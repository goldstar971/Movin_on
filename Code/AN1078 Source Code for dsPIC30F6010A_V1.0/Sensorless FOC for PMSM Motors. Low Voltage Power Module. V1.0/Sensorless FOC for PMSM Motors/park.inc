;;------------------  ASM30 API for Park Clarke routines ---------------------
; ParkParm stucture:

; typedef struct {
;    short   qAngle;
;    short   qCos;
;    short   qSin;
;    short   qIa;
;    short   qIb;
;    short   qIalpha;
;    short   qIbeta;
;    short   qId;
;    short   qIq;
;    short   qVd;
;    short   qVq;
;    short   qValpha;
;    short   qVbeta;
;    short   qV1;
;    short   qV2;
;    short   qV3;
;    } tParkParm;

; Note that pairs qCos,qSin, qIa,qIb, etc must remain consecutive

          .equ Park_qAngle,0       ; qAngle
          .equ Park_qSin,2         ; qSin
          .equ Park_qCos,4         ; qCos
          .equ Park_qIa,6          ; qIa
          .equ Park_qIb,8          ; qIb
          .equ Park_qIalpha,10     ; qIalpha
          .equ Park_qIbeta,12      ; qIbeta
          .equ Park_qId,14         ; qId
          .equ Park_qIq,16         ; qIq
          .equ Park_qVd,18         ; qVd
          .equ Park_qVq,20         ; qVq
          .equ Park_qValpha,22     ; qValpha
          .equ Park_qVbeta,24      ; qVbeta
          .equ Park_qV1,26         ; qV1
          .equ Park_qV2,28         ; qV2
          .equ Park_qV3,30         ; qV3

          .extern _ParkParm

