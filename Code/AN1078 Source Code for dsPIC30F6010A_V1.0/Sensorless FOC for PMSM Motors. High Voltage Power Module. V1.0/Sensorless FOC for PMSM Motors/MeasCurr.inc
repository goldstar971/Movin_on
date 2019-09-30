;;------------------  ASM30 API for MeasCurr routines ---------------------
; MeasCurrParm stucture:

          .equ ADC_qKa,0          ; qKa - 1.15
          .equ ADC_iOffsetLa,2
          .equ ADC_iOffsetHa,4

          .equ ADC_qKb,6          ; qKb - 1.15
          .equ ADC_iOffsetLb,8
          .equ ADC_iOffsetHb,10

          .extern _MeasCurrParm



