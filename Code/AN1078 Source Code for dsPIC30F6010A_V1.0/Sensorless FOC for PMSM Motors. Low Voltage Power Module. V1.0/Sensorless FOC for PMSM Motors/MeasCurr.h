#ifndef MeasCurr_H
#define MeasCurr_H
//------------------  C API for MeasCurr routines ---------------------

typedef struct {
    short   qKa;        // 1.15 
    short   iOffsetLa;
    short   iOffsetHa;

    short   qKb;        // 1.15 
    short   iOffsetLb;
    short   iOffsetHb;

    } tMeasCurrParm;

void MeasCurr( void );
void MeasCompCurr( void );
void InitMeasCompCurr( short iOffset_a, short iOffset_b );

tMeasCurrParm MeasCurrParm;
#endif

