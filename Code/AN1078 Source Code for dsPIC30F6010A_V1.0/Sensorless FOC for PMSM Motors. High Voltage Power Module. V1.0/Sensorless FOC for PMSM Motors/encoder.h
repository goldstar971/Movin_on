#ifndef Encoder_H
#define Encoder_H
//------------------  C API for Encoder routines ---------------------

#define Nang            8       // Nang must satisfy 64 <= 2^Nang < CntsPerRev
                                // Must be changed in encoder.inc also

#define Nvel            8       // Nvel must be in range -8 <= 15-Nvel <= +7
                                // Change in encoder.inc also & see explanation

typedef struct {
    short   qMechAng;       // Mechanical rotational angle in 1.15 format 
    short   qKang;          // Constant: Count to Angle scaling
    short   iCntsPerRev;    // Constant: Encoder counts per revolution of motor

    short   qVelMech;       // Mechanical rotational velocity in 1.15
    short   qKvel;          // Constant: Count to velocity scaling
    short   iIrpPerCalc;    // Constant: Timer interrupts per speed calc

 // private
    short   iVelCntDwn;     // Countdown to next speed calc
    short   iPrevCnt;       // Last encoder value
    short   iAccumCnt;      // Accumulating cnts
    short   iDeltaCnt;      // Accumulated cnts waiting for Velocity calc

    } tEncoderParm;

bool InitEncoderScaling( void );
void CalcAng( void );
void InitCalcVel(void);
void CalcVelIrp( void );
void CalcVel( void );

EXTERN tEncoderParm EncoderParm;
#endif




