;;------------------  ASM30 API for OpenLoop routines ---------------------
; OpenLoopParm stucture:
;
          .equ OpLoop_qAngFlux,0     ; rotational angle of rotor flux in 1.15 format
          .equ OpLoop_qDeltaFlux,2   ; change in angle for one loop

          .equ OpLoop_qKdelta,4      ; Vel constant

          .equ OpLoop_qVelMech,6     ; Mechanical rotational velocity in 1.15

          .extern _OpenLoopParm

