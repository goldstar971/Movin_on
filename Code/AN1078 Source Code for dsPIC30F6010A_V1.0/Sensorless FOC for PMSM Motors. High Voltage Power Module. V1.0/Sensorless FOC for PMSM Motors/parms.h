#ifndef Parms_H
#define Parms_H

EXTERN float fWork;
EXTERN short iWork;

EXTERN struct {

  // Required physical quantities:

    int   iPoles;         // Number of pole pairs
    int   iScaleMechRPM;  // 8 times nominal mechanical speed of motor (in RPM)
    int   iCntsPerRev;    // Encoder counts per revolution as detected by the
                          //       dsPIC quadrature configuration.

    float fRotorTmConst;  // Rotor time constant in sec
                          // Calculated from rotor inductance / rotor resistance

  // Required software quantities:

    float fLoopPeriod;    // Basic loop period (in sec).

    float fVelIrpPeriod;  // Encoder velocity interrupt period (in sec). 

    int   iIrpPerCalc;    // Number of vel interrupts per velocity calculation.


  // Derived quantities:
    float fScaleMechRPS;    // Scale mechanical speed of motor (in rev/sec)
    
    float fScaleFluxRPS;    // Scale flux speed of motor (in rev/sec)

    float fScaleFluxSpeed;  // Scale flux speed of motor (in radians/sec)
                            // Used for all speed scaling

    float fScaleFluxPeriod; // Period of one revolution of flux vector (in sec) 
                            //   at Scaled speed

    // Fraction of revolution per LoopTime at scaled flux velocity
    float fScaleFracRevPerLoop; 

    long  lScaleCntRate;    // Encoder count rate at iScaleMechRPM

	unsigned int LockTime;

	long EndSpeed;

} MotorParm;


bool InitMotorParm(void);

#endif

