;*******************************************************************
; Routines: CurModel
;
;*******************************************************************

; Common to all routines in file

          .include "general.inc"
          .include "curmodel.inc"
          .include "park.inc"

;*******************************************************************
; CurModel
;  
;Description:        
;
;
;Physical constants:
;  fRotorTmConst        Rotor time constant in sec
;
;Physical form of equations:
;  Magnetizing current (amps):
;     Imag = Imag + (fLoopPeriod/fRotorTmConst)*(Id - Imag)
;
;  Slip speed in RPS:
;     VelSlipRPS = (1/fRotorTmConst) * Iq/Imag / (2*pi)
;
;  Rotor flux speed in RPS:
;     VelFluxRPS = iPoles * VelMechRPS + VelSlipRPS
;
;  Rotor flux angle (radians):
;     AngFlux = AngFlux + fLoopPeriod * 2 * pi * VelFluxRPS
;
;Scaled Variables:
;  qdImag     Magnetizing current scaled by maximum current (1.31)
;  qVelSlip   Mechnical Slip velocity in RPS scaled by fScaleMechRPS
;  qAngFlux   Flux angle scaled by pi
;
;Scaled Equations:
;  qdImag     = qdImag + qKcur * (qId - qdImag)
;  qVelSlip   = qKslip * qIq/qdImag
;  qAngFlux   = qAngFlux + qKdelta * (qVelMech + qVelSlip)
;
;Scaling factors:
;  qKcur = (2^15) * (fLoopPeriod/fRotorTmConst)
;  qKdelta = (2^15) * 2 * iPoles * fLoopPeriod * fScaleMechRPS
;  qKslip = (2^15)/(2 * pi * fRotorTmConst * iPoles * fScaleMechRPS)
;
;
;Functional prototype:
; 
; void CurModel( void )
;
;On Entry:   CurModelParm structure must contain qKcur, qKslip, iKpoles, 
;                             qKdelta, qVelMech, qMaxSlipVel
;
;On Exit:    CurModelParm will contain qAngFlux, qdImag and qVelSlip
;
;Parameters: 
; Input arguments: None
;
; Return:
;   Void
;
; SFR Settings required:
;         CORCON.SATA  = 0
;         CORCON.IF    = 0
;
; Support routines required: None
;
; Local Stack usage: 0
;
; Registers modified: w0-w7,AccA
;
; Timing: 72 instruction cycles
;
;*******************************************************************
;
;=================== CODE =====================
          .section  .text

; Register usage for CurModel

          .equ SignW,   w2   ; track sign changes
          .equ ShiftW,  w3   ; # shifts before divide
          .equ IqW,     w4   ; Q current (1.15)
          .equ KslipW,  w5   ; Kslip constant (1.15)
          .equ ImagW,   w7   ; magnetizing current (1.15)


          .global   _CurModel
          .global   CurModel

_CurModel:
CurModel:
		  		  
     ;; qdImag = qdImag + qKcur * (qId - qdImag)      ;; magnetizing current

          mov.w     _CurModelParm+CurMod_qdImag,w6
          mov.w     _CurModelParm+CurMod_qdImag+2,w7
          lac       w7,A
          mov.w     w6,ACCALL

          mov.w     _ParkParm+Park_qId,w4
          sub.w     w4,w7,w4                            ; qId-qdImagH
          mov.w     _CurModelParm+CurMod_qKcur,w5

          mac       w4*w5,A     ; add Kcur*(Id-Imag) to Imag
          sac       A,w7 
          mov.w     ACCALL,w6
          mov.w     w6,_CurModelParm+CurMod_qdImag
          mov.w     w7,_CurModelParm+CurMod_qdImag+2

     ;; qVelSlip   = qKslip * qIq/qdImag

     ;; First make qIqW and qdImagW positive and save sign in SignW
          clr       SignW              ; set flag sign to positive

     ;; if( IqW < 0 ) => toggle SignW and set IqW = -IqW
          mov.w     _ParkParm+Park_qIq,IqW
          cp0       IqW
          bra       Z,jCurModSkip
          bra       NN,jCurMod1
          neg       IqW,IqW
          com       SignW,SignW         ; toggle sign
jCurMod1:

     ;; if( ImagW < 0 ) => toggle SignW and set ImagW = -ImagW
          cp0       ImagW
          bra       NN,jCurMod2
          neg       ImagW,ImagW
          com       SignW,SignW         ; toggle sign
jCurMod2:

     ;; Calculate Kslip*|IqW| in Acc A to maintain 1.31
          mov.w     _CurModelParm+CurMod_qKslip,KslipW
          mpy       IqW*KslipW,A

     ;; Make sure denominator is > numerator else skip term
          sac       A,w0                ; temporary
          cp        ImagW,w0            ; |qdImag| - |Kslip*qIq|
          bra       LEU,jCurModSkip     ; skip term:  |qdImag| <= |Kslip*qIq|  

     ;; This will not be required for later releases of the 6010 <SILICON_ERR>
          clr.w     ShiftW

     ;; Calculate how many places ImagW can be shifted without putting 
     ;; a one in the msb location (preserves sign)
          
          ff1l      ImagW,ShiftW
          sub.w     ShiftW,#2,ShiftW   ; # shifts necessary to put 1 in bit 14

     ;; Shift:  ImagW = ImagW << ShiftW
          sl        ImagW,ShiftW,ImagW

     ;; Shift AccA, Requires (-ShiftW) to shift left.
          neg       ShiftW,ShiftW

     ;; |Kslip*qIq| = |Kslip*qIq| << ShiftW
          sftac     A,ShiftW
          
          
		
     ;; Do divide of |qKslip*qIq|/|ImagW|.  We know at this point that the
     ;; results will be positive and < 1.0.  We also know that we have maximum
     ;; precision.

          sac       A,w6 
          repeat    #17
          divf      w6,ImagW            ; w0 = KslipW*IqW/ImagW, w1 = remainder

     ;; Limit maximum slip speed
          mov.w     _CurModelParm+CurMod_qMaxSlipVel,w1
          cp        w1,w0             ; qMaxSlipSpeed - | Kslip*qIq/qdImag |
          bra       NN,jCurMod4

     ;; result too large: replace it with qMaxSlipSpeed
          mov.w     w1,w0
          bra       jCurMod4

jCurModSkip:
     ;; term skipped entirely - set it = 0
          clr.w     w0

jCurMod4:
     ;; set correct sign
          btsc      SignW,#0
          neg       w0,w0

     ;; For testing
          mov.w     w0,_CurModelParm+CurMod_qVelSlip

     ;; Add mechanical velocity
          mov.w     _CurModelParm+CurMod_qVelMech,w4
          add.w     w0,w4,w4
          mov.w     w4,_CurModelParm+CurMod_qVelFlux
        
        
     ;; Load AngFlux to Acc A
                   
          mov.w     _CurModelParm+CurMod_qAngFlux,w1
          lac       w1,A

          mov.w     _CurModelParm+CurMod_qKdelta,w5
          mac       w4*w5,A
		  
		  ; Need to temporarily turn off data space write
		  ; saturation while accumulator is stored.
		  ; This is because qAngFlux represents the
		  ; flux angle and must be able to wrap beyond
		  ; 0x7FFF.
		  bclr		CORCON,#SATDW
		  sac       A,w4
		  bset		CORCON,#SATDW
          mov.w     w4,_CurModelParm+CurMod_qAngFlux
          
          
          return


;*******************************************************************
; void InitCurModel(void)
;         Initialize private CurModel variables.  
;*******************************************************************

; Register usage for InitCurModel


;*******************************************************************

          .global   _InitCurModel
          .global   InitCurModel
_InitCurModel:
InitCurModel:

          clr.w     _CurModelParm+CurMod_qAngFlux
          clr.w     _CurModelParm+CurMod_qdImag
          clr.w     _CurModelParm+CurMod_qdImag+2
          return

          .end
