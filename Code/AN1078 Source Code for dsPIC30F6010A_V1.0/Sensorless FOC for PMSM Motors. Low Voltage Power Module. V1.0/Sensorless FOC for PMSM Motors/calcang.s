;*******************************************************************
; Routines: CalcAng
;
;*******************************************************************

          .include "general.inc"
          .include "encoder.inc"

;*******************************************************************
; CalcAng
;  
;Description:        
;
; Angle scaling:  qMechAng = qKang * (POSCNT*4) / 2^Nang
;
; where qKang = (2^15)*(2^Nang)/CntsPerRev.
;
; The Nang scaling factor is picked to maximize precision without causing 
; qKang to overflow 1.15 format. To do this Nang must be small enough so that 
; 2^Nang < CntsPerRev but large enough to provide required precision.
;
; The Position POSCNT is multiplied by 2^M where M is chosen to be 2 so that
; the resulting Acc value of qKang*POSCNT*2^M can be shifted into the 1.15
; format by the SAR command. The requirement is that  
;         -8 <= 15-Nang-M<= +7
; An additional requirement is POSCNT*2^M < 2^15 not to overflow the 1.15
; requirement of the fractional multiply instruction. The 2^M factor is 
; explicity added and removed in the code using the lac and sac commands.
;
; If CntsPerRev satisfies the requirement 128 < CntsPerRev < 8192 then
; M can be = 2 and Nang has to satisfy the two requirements 
;         6 <= Nang <= 21 
;         2^Nang < CntsPerRev
; which combine to give 64 <= 2^Nang < CntsPerRev
;
; To calculate with DSP instr:
;        Accum = qKang * POSCNT  where both are treated as 1.15 format
;        then must /2^Nang and times 32768 to make 1.31 format in accum.
;        This step can be done using the shift value in SAR instr
;        hence use SAR on qKang*POSCNT using (Nang-15) shift value (neg->left)
;
;Functional prototype:
; 
; void CalcAng( void )
;
;On Entry:   EncoderParm structure must contain qKang
;
;On Exit:    EncoderParm will contain qMechAng
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
; Registers modified: w4,w5,AccA
;
; Timing: 8 instruction cycles
;
;*******************************************************************
;
;=================== CODE =====================
          .section  .text

; Register usage for CalcAng

          .equ Work0W,  w4   ; Working register
          .equ PosW,    w5   ; current position: POSCNT


          .global   _CalcAng
          .global   CalcAng

_CalcAng:
CalcAng:
     ;; qMechAng = qKang * POSCNT / 2^Nang

 .ifdef SIMU
          mov.w     _uTestPos,PosW     ; encoder value  ??
 .else
          mov.w     POSCNT,PosW        ; encoder value
 .endif

     ;; Multiply POSCNT by 4  
          ;sl.w      PosW,#2,PosW
		sub #1000,PosW
 		sl.w      PosW,#3,PosW
     ;; 4*POSCNT is an integer but as Q15 it = (4*POSCNT/2^15)

          mov.w     _EncoderParm+Encod_qKang,Work0W

          mpy       Work0W*PosW,A
		
          sac       A,#(Nang+2-15),Work0W         ; left shift by 15-Nang-2

     ;; qMechAng = qKang * Q15( POSCNT/2^Nang )

		neg Work0W,Work0W
          mov.w     Work0W,_EncoderParm+Encod_qMechAng
          return

          .end
