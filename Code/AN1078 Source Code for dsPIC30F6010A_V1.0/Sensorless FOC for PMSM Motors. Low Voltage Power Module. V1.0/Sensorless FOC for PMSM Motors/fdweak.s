;*******************************************************************
; Routines: FdWeak
;
;*******************************************************************

; Common to all routines in file

          .include "general.inc"
          .include "Control.inc"
          .include "FdWeak.inc"

;*******************************************************************
; FdWeak
;  
;Description:        
;
;Equations:
;
;Scaling factors:
;
;Functional prototype:
; 
; void FdWeak( void )
;
;On Entry:   FdWeakParm structure must contain: _FdWeakParm+FdWeak_qK1
;
;On Exit:    FdWeakParm will contain : _CtrlParm+Ctrl_qVdRef
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

; Register usage for FdWeak


          .global   _FdWeakening
          .global   FdWeakening

_FdWeakening:
FdWeakening:

          mov.w     _FdWeakParm+FdWeak_qK1,w0
          mov.w     w0,_CtrlParm+Ctrl_qVdRef
          return

          .end
