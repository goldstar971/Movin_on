;*******************************************************************
; Routines: InitCalcVel, CalcVel
;
;*******************************************************************

; Common to all routines in file

          .include "general.inc"
          .include "encoder.inc"

;*******************************************************************
; void InitCalcVel(void)
;         Initialize private velocity variables.  
;         iIrpPerCalc must be set on entry.
;*******************************************************************

; Register usage for InitCalcVel

          .equ Work0W,  w4   ; Working register
          .equ PosW,    w5   ; current position: POSCNT

;*******************************************************************

          .global   _InitCalcVel
          .global   InitCalcVel
_InitCalcVel:
InitCalcVel:

     ;; Disable interrupts for the next 5 instructions 
          DISI      #5

     ;; Load iPrevCnt & zero Delta
     ;; encoder value. Note: To get accurate velocity qVelMech must be 
     ;; calculated twice.
          mov.w     POSCNT,PosW         ; current encoder value
          mov.w     PosW,_EncoderParm+Encod_iPrevCnt
          clr.w     _EncoderParm+Encod_iAccumCnt

     ;; Load iVelCntDwn
          mov.w     _EncoderParm+Encod_iIrpPerCalc,WREG
          mov.w     WREG,_EncoderParm+Encod_iVelCntDwn

          return

;*******************************************************************
; CalcVelIrp
;
; Called from timer interrupt at specified intervals. 
;
; The interrupt interval, VelPeriod, MUST be less than the minimum time 
; required for 1/2 revolution at maximum speed.
; 
; This routine will accumulate encoder change for iIrpPerCalc interrupts,
; a period of time  = iIrpPerCalc * VelPeriod, and then copy the accumulation
; to iDeltaCnt for use by the CalcVel routine to calculate velocity.
; The accumulation is set back to zero and a new accumulation starts.
;
;Functional prototype:  void CalcVelIrp( void );
;
;On Entry:   EncoderParm must contain iPrevCnt, iAccumCnt, iVelCntDwn
;
;On Exit:    EncoderParm will contain iPrevCnt, iAccumCnt and iDeltaCnt
;                   (if countdown reached zero).
;
;Parameters: 
; Input arguments: None
;
; Return:
;   Void
;
; SFR Settings required: None
;
; Support routines required: None
;
; Local Stack usage: 3
;
; Registers modified: None
;
; Timing: About  29 instruction cycles (if new iDeltaCnt produced)
;
;=====================================================
; Equivalent C code
;{
;    register short Pos, Delta; 
;
;    Pos = POSCNT;
;
;    Delta = Pos - EncoderParm.iPrevCnt;
;    EncoderParm.iPrevCnt = Pos;
;
;    if( iDelta >= 0 )
;        {
;        // Delta > 0 either because 
;        //       1) vel is > 0 or 
;        //       2) Vel < 0 and encoder wrapped around 
;
;        if( Delta >=  EncoderParm.iCntsPerRev/2 )
;            {
;            // Delta >= EncoderParm.iCntsPerRev/2 => Neg speed, wrapped around
;
;            Delta -= EncoderParm.iCntsPerRev;
;            }
;        }
;    else
;        {
;        // Delta < 0 either because 
;        //       1) vel is < 0 or 
;        //       2) Vel > 0 and wrapped around
;
;        if( Delta < -EncoderParm.iCntsPerRev/2 )
;            {
;            // Delta < -EncoderParm.iCntsPerRev/2 => Pos vel, wrapped around
;
;            Delta += EncoderParm.iCntsPerRev;
;            }
;        }
;
;    EncoderParm.iAccumCnt += Delta;
;
;    EncoderParm.iVelCntDwn--;
;    if(EncoderParm.iVelCntDwn)
;        return;
;
;    iVelCntDwn = iIrpPerCalc; 
;    qVelMech = qKvel * iAccumCnt * 2^Nvel;
;    EncoderParm.iAccumCnt = 0;
;}
;=================== CODE =====================
; Register usage for CalcVelIrp 
          .equ PosW,    w0   ; current position: POSCNT

          .equ WorkW,   w4   ; Working register
          .equ DeltaW,  w6   ; NewCnt - PrevCnt

          .global   _CalcVelIrp
          .global   CalcVelIrp

_CalcVelIrp:
CalcVelIrp:

     ;; Save registers
          push      w0
          push      w4
          push      w6

     ;; Pos = uTestPos;

 .ifdef SIMU
          mov.w     _uTestPos,PosW     ; encoder value  ??
 .else
          mov.w     POSCNT,PosW        ; encoder value
 .endif

          mov.w     _EncoderParm+Encod_iPrevCnt,WorkW
          
     ;; Update previous cnt with new cnt
          mov.w     PosW,_EncoderParm+Encod_iPrevCnt

     ;; Calc Delta = New - Prev
          sub.w     PosW,WorkW,DeltaW     
          bra       N,jEncoder5         ; Delta < 0

     ;; Delta > 0 either because 
     ;;       1) vel is > 0 or 
     ;;       2) Vel < 0 and wrapped around

          lsr.w     _EncoderParm+Encod_iCntsPerRev,WREG   ; WREG = CntsPerRev/2

     ;; Is Delta < CntsPerRev/2
          sub.w     DeltaW,w0,WorkW  ; Delta-CntsPerRev/2
          bra       N,jEncoder20        ; 0 < Delta < CntsPerRev/2, Vel > 0

     ;; Delta >= CntsPerRev/2 => Neg speed, wrapped around
     ;; Delta = Delta - CntsPerRev
          
          mov.w     _EncoderParm+Encod_iCntsPerRev,w0  
          sub.w     DeltaW,w0,DeltaW

     ;; Delta < 0, Vel < 0
          bra       jEncoder20 

jEncoder5:
     ;; Delta < 0 either because 
     ;;       1) vel is < 0 or 
     ;;       2) Vel > 0 and wrapped around

          lsr.w     _EncoderParm+Encod_iCntsPerRev,WREG   ; WREG = CntsPerRev/2

     ;; Is Delta + CntsPerRev/2 < 0
          add.w     DeltaW,w0,WorkW  ; Delta+CntsPerRev/2
          bra       NN,jEncoder20       ; -CntsPerRev/2 <= Delta < 0, Vel > 0

     ;; Delta < -CntsPerRev/2 => Pos vel, wrapped around
     ;; Delta = Delta + CntsPerRev
          
          mov.w     _EncoderParm+Encod_iCntsPerRev,w0  
          add.w     DeltaW,w0,DeltaW

     ;; Delta < -CntsPerRev/2, Vel > 0

jEncoder20: 

     ;; Delta now contains signed change in position

     ;; EncoderParm.Delta += Delta;
          mov.w     DeltaW,w0
          add.w     _EncoderParm+Encod_iAccumCnt

     ;; EncoderParm.iVelCntDwn--;
     ;; if(EncoderParm.iVelCntDwn) return;

          dec.w     _EncoderParm+Encod_iVelCntDwn
          cp0.w     _EncoderParm+Encod_iVelCntDwn
          bra       NZ,jEncoder40

     ;; Reload iVelCntDwn: iVelCntDwn = iIrpPerCalc; 
          mov.w     _EncoderParm+Encod_iIrpPerCalc,WREG
          mov.w     WREG,_EncoderParm+Encod_iVelCntDwn

     ;; Copy iAccumCnt to iDeltaCnt then iAccumCnt = 0
          mov.w     _EncoderParm+Encod_iAccumCnt,DeltaW
          mov.w     DeltaW,_EncoderParm+Encod_iDeltaCnt
          clr.w     _EncoderParm+Encod_iAccumCnt

jEncoder40:

     ;; Restore registers
          pop       w6
          pop       w4
          pop       w0
          return

;*******************************************************************
; CalcVel
;
; Calculate qVelMech from the last iDeltaCnt produced by the
; interrupt routine CalcVelIrp.
;
;Functional prototype:  void CalcVel( void );
;
;On Entry:   EncoderParm must contain iDeltaCnt, qKvel
;
;On Exit:    EncoderParm will contain qVelMech
;
;Parameters: 
; Input arguments: None
;
; Return:
;   Void
;
; SFR Settings required: None
;
; Support routines required: None
;
; Local Stack usage: none
;
; Registers modified: None
;
; Timing: About  8 instruction cycles
;  
;*******************************************************************

          .global   _CalcVel
          .global   CalcVel
_CalcVel:
CalcVel:
     ;; qVelMech = qKvel * ( Delta / 2^Nvel / 2^15)


     ;; iDeltaCnt is an integer but as Q15 it = (iDeltaCnt/2^15)
          mov.w     _EncoderParm+Encod_iDeltaCnt,DeltaW
          mov.w     _EncoderParm+Encod_qKvel,WorkW

          mpy       WorkW*DeltaW,A                ; dKvel * (Delta/2^15)
          sac       A,#(Nvel-15),WorkW            ; left shift by 15-Nvel

		neg WorkW,WorkW
     ;; qVelMech = qKvel * Q15( Delta / 2^Nvel )
          mov.w     WorkW,_EncoderParm+Encod_qVelMech
          return


          .end
