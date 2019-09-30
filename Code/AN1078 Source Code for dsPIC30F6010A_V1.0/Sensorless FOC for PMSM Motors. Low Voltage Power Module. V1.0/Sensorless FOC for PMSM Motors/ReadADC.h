#ifndef ReadADC_H
#define ReadADC_H
//------------------  C API for ReadADC routines ---------------------

typedef struct {
    short   qK;         // 1.15 
    short   qADValue;   // 1.15

    } tReadADCParm;

void ReadADC0( tReadADCParm* pParm );       // Returns unsigned value 0 -> 2*iK 
void ReadSignedADC0( tReadADCParm* pParm ); // Returns signed value -2*iK -> 2*iK

#endif

