;*******************************************************************
; CONFIG settings
;*******************************************************************
          .include "general.inc"

; Clock switching off, Fail Safe off, XT with PLL8
  config __FOSC, CSW_FSCM_OFF & XT_PLL16

          .end

