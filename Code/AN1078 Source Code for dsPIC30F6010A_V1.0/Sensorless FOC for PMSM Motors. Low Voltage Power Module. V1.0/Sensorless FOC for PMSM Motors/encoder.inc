;;------------------  ASM30 API for Encoder routines ---------------------
; EncoderParm stucture:

          .equ Encod_qMechAng,0      ; Mechanical rotational angle in 1.15 format      
          .equ Encod_qKang,2         ; Constant: Count to Angle scaling                
          .equ Encod_iCntsPerRev,4   ; Constant: Encoder counts per revolution of motor
                                                                                       
          .equ Encod_qVelMech,6      ; Mechanical rotational velocity in 1.15          
          .equ Encod_qKvel,8         ; Constant: Count to velocity scaling             
          .equ Encod_iIrpPerCalc,10      ; Constant: Number of timer ticks per speed calc  

     ;; private

          .equ Encod_iVelCntDwn,12   ; Countdown to next speed calc
          .equ Encod_iPrevCnt,14     ; Last encoder value
          .equ Encod_iAccumCnt,16    ; Accumulating cnts
          .equ Encod_iDeltaCnt,18;   ; Accumulated cnts waiting for Velocity calc

          .extern _EncoderParm

; See discussion in CalcAng.s for proper value of Nang.
          .equ Nang,8         ; Nang must satisfy 64 <= 2^Nang < CntsPerRev

; Angular velocity scaling:  iVelMech = qKvel * DeltaCnt / 2^Nvel
;
; where qKvel = (2^15)*(2^Nvel)/MaxDeltaCnt.
;
; The Nvel scaling factor is picked to maximize precision without causing 
; qKvel to overflow 1.15 format. To do this Nvel must be small enough so that 
; 2^Nvel/MaxDeltaCnt < 1 but large enough to provide required precision.

; Assume MaxDeltaCnt > 256 => Nvel = 8
          .equ Nvel,8           ; Nvel must be in range -8 <= 15-Nvel <= +7
                                ; Must be changed in encoder.h also

