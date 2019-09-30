#ifndef general_H
#define general_H

//--------------------- Common stuff for C routines ---------------------

//#include <p30F5016.h>
#include <p30F6010a.h>
typedef unsigned short WORD;
typedef signed int SFRAC16;
typedef unsigned char  BYTE;
typedef unsigned char  bool;
#define False  0
#define True   1

#define Q15(Float_Value)	\
        ((Float_Value < 0.0) ? (SFRAC16)(32768 * (Float_Value) - 0.5) \
        : (SFRAC16)(32767 * (Float_Value) + 0.5))

void SetupPorts( void );

#ifdef INITIALIZE
    // allocate storage
    #define EXTERN
#else
    #define EXTERN extern
#endif


//#define SIMU    // Simulate encoder //??
extern WORD uTestPos;  // ??


#endif      // end of general_H
