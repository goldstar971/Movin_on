#ifndef PI_H
#define PI_H
//------------------  C API for PI routines ---------------------

typedef struct {
    long    qdSum;          // 1.31 format
    short   qKp;
    short   qKi;
    short   qKc;
    short   qOutMax;
    short   qOutMin;
    short   qInRef; 
    short   qInMeas;
    short   qOut;
    } tPIParm;

void InitPI( tPIParm *pParm);
void CalcPI( tPIParm *pParm);
#endif



