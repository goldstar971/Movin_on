;;--------------------- Common stuff for ASM routines ---------------------

;.include "p30f5016.inc"
.include "p30f6010a.inc"

;;--------------------- Test stuff for simulation ---------------------

        .extern _uTestPos
;;        .equ SIMU,1   ; simulate encoder
        .equ TEST_CUR_MODEL,1   ; testing for current model

