;*******************************************************************
; Routines: OpenLoop
;
;*******************************************************************

; Common to all routines in file

          .include "general.inc"
          .include "openloop.inc"

;*******************************************************************
; OpenLoop
;  
;Description:        
;
;Equations:
;     qDeltaFlux = Kdelta * qVelMech
;     qAngFlux = qAngFlux + Kdelta * qVelMech           ;; rotor flux angle    
;
;     qKdelta = (2^15) * 2 * iPoles * fLoopPeriod * fScaleMechRPS
;       where qVelMech is the mechanical velocity in RPS scaled by fScaleMechRPS
;       and the iPoles is required to get Flux vel from Mech vel
;       and the 2 is to scale +/- 2*pi into +/- pi
;
;Functional prototype:
; 
; void OpenLoop( void )
;
;On Entry:   OpenLoopParm structure must contain 
;
;On Exit:    OpenLoopParm will contain 
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
; Registers modified: ??w4,w5,AccA
;
; Timing: ??8 instruction cycles
;
;*******************************************************************
;
;=================== CODE =====================
          .section  .text

; Register usage for OpenLoop

          .equ Work0W,  w4   ; Working register
          .equ Work1W,  w5   ; Working register

          .global   _OpenLoop
          .global   OpenLoop

_OpenLoop:
OpenLoop:
          mov.w     _OpenLoopParm+OpLoop_qVelMech,Work0W
          mov.w     _OpenLoopParm+OpLoop_qKdelta,Work1W
          mpy       Work0W*Work1W,A
          sac       A,Work0W
          mov.w     Work0W,_OpenLoopParm+OpLoop_qDeltaFlux

     ;; qAngFlux = qAngFlux + qDeltaFlux
          mov.w     _OpenLoopParm+OpLoop_qAngFlux,Work1W
          add.w     Work0W,Work1W,Work0W
          mov.w     Work0W,_OpenLoopParm+OpLoop_qAngFlux
          return


;*******************************************************************
; void InitOpenLoop(void)
;         Initialize private OpenLoop variables.  
;*******************************************************************

; Register usage for InitOpenLoop


;*******************************************************************

          .global   _InitOpenLoop
          .global   InitOpenLoop
_InitOpenLoop:
InitOpenLoop:

          clr.w     _OpenLoopParm+OpLoop_qAngFlux
          clr.w     _OpenLoopParm+OpLoop_qDeltaFlux
          return

          .end
