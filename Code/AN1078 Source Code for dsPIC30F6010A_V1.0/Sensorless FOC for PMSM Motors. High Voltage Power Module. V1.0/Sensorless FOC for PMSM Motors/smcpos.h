#ifndef smcpos_H
#define smcpos_H

#include "UserParms.h"

typedef struct	{  
				SFRAC16  Valpha;   		// Input: Stationary alfa-axis stator voltage 
                SFRAC16  Ealpha;   		// Variable: Stationary alfa-axis back EMF 
				SFRAC16  EalphaFinal;	// Variable: Filtered EMF for Angle calculation
                SFRAC16  Zalpha;      	// Output: Stationary alfa-axis sliding control 
                SFRAC16  Gsmopos;    	// Parameter: Motor dependent control gain 
                SFRAC16  EstIalpha;   	// Variable: Estimated stationary alfa-axis stator current 
                SFRAC16  Fsmopos;    	// Parameter: Motor dependent plant matrix 
                SFRAC16  Vbeta;   		// Input: Stationary beta-axis stator voltage 
                SFRAC16  Ebeta;  		// Variable: Stationary beta-axis back EMF 
				SFRAC16  EbetaFinal;	// Variable: Filtered EMF for Angle calculation
                SFRAC16  Zbeta;      	// Output: Stationary beta-axis sliding control 
                SFRAC16  EstIbeta;    	// Variable: Estimated stationary beta-axis stator current 
                SFRAC16  Ialpha;  		// Input: Stationary alfa-axis stator current 
                SFRAC16  IalphaError; 	// Variable: Stationary alfa-axis current error                 
                SFRAC16  Kslide;     	// Parameter: Sliding control gain 
                SFRAC16  Ibeta;  		// Input: Stationary beta-axis stator current 
                SFRAC16  IbetaError;  	// Variable: Stationary beta-axis current error                 
                SFRAC16  Kslf;       	// Parameter: Sliding control filter gain 
                SFRAC16  KslfFinal;    	// Parameter: EMF Filter for angle calculation
                SFRAC16  Theta;			// Output: Compensated rotor angle 
				SFRAC16  Omega;     	// Output: Rotor speed
				} SMC;	            

typedef SMC *SMC_handle;

#define SMC_DEFAULTS {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

// SLOPEx and LINEOFFSETx is taken from the theta
// compensation spreadsheet

#define SPEED_CONSTANT 1.5625

// Define this in RPMs

#define SPEED0 900
#define SPEED1 1800
#define SPEED2 2700
#define SPEED3 3600
#define SPEED4 4500
#define SPEED5 5400
#define SPEED6 6300
#define SPEED7 7200

// Define this in Degrees, from 0 to 360

#define THETA_AT_SPEED0 0
#define THETA_AT_SPEED1 130
#define THETA_AT_SPEED2 200
#define THETA_AT_SPEED3 240
#define THETA_AT_SPEED4 290
#define THETA_AT_SPEED5 310
#define THETA_AT_SPEED6 320
#define THETA_AT_SPEED7 325

#define OMEGA0 (float)(SPEED0 * dLoopTimeInSec * SPEED_CONSTANT * \
                diIrpPerCalc * diPoles * 2.0 / 60.0)
#define OMEGA1 (float)(SPEED1 * dLoopTimeInSec * SPEED_CONSTANT * \
                diIrpPerCalc * diPoles * 2.0 / 60.0)
#define OMEGA2 (float)(SPEED2 * dLoopTimeInSec * SPEED_CONSTANT * \
                diIrpPerCalc * diPoles * 2.0 / 60.0)
#define OMEGA3 (float)(SPEED3 * dLoopTimeInSec * SPEED_CONSTANT * \
                diIrpPerCalc * diPoles * 2.0 / 60.0)
#define OMEGA4 (float)(SPEED4 * dLoopTimeInSec * SPEED_CONSTANT * \
                diIrpPerCalc * diPoles * 2.0 / 60.0)
#define OMEGA5 (float)(SPEED5 * dLoopTimeInSec * SPEED_CONSTANT * \
                diIrpPerCalc * diPoles * 2.0 / 60.0)
#define OMEGA6 (float)(SPEED6 * dLoopTimeInSec * SPEED_CONSTANT * \
                diIrpPerCalc * diPoles * 2.0 / 60.0)
#define OMEGA7 (float)(SPEED7 * dLoopTimeInSec * SPEED_CONSTANT * \
                diIrpPerCalc * diPoles * 2.0 / 60.0)

#define THETA0 (float)(THETA_AT_SPEED0 * 90.0 / 32768.0)
#define THETA1 (float)(THETA_AT_SPEED1 * 90.0 / 32768.0)
#define THETA2 (float)(THETA_AT_SPEED2 * 90.0 / 32768.0)
#define THETA3 (float)(THETA_AT_SPEED3 * 90.0 / 32768.0)
#define THETA4 (float)(THETA_AT_SPEED4 * 90.0 / 32768.0)
#define THETA5 (float)(THETA_AT_SPEED5 * 90.0 / 32768.0)
#define THETA6 (float)(THETA_AT_SPEED6 * 90.0 / 32768.0)
#define THETA7 (float)(THETA_AT_SPEED7 * 90.0 / 32768.0)

#define SLOPECALC0 (float)(THETA0 / OMEGA0)
#define SLOPECALC1 (float)((THETA1 - THETA0) / (OMEGA1 -OMEGA0))
#define SLOPECALC2 (float)((THETA2 - THETA1) / (OMEGA2 -OMEGA1))
#define SLOPECALC3 (float)((THETA3 - THETA2) / (OMEGA3 -OMEGA2))
#define SLOPECALC4 (float)((THETA4 - THETA3) / (OMEGA4 -OMEGA3))
#define SLOPECALC5 (float)((THETA5 - THETA4) / (OMEGA5 -OMEGA4))
#define SLOPECALC6 (float)((THETA6 - THETA5) / (OMEGA6 -OMEGA5))
#define SLOPECALC7 (float)((THETA7 - THETA6) / (OMEGA7 -OMEGA6))

#define LINEOFFSET0 (float)(THETA0 - OMEGA0 * SLOPECALC0)
#define LINEOFFSET1 (float)(THETA1 - OMEGA1 * SLOPECALC1)
#define LINEOFFSET2 (float)(THETA2 - OMEGA2 * SLOPECALC2)
#define LINEOFFSET3 (float)(THETA3 - OMEGA3 * SLOPECALC3)
#define LINEOFFSET4 (float)(THETA4 - OMEGA4 * SLOPECALC4)
#define LINEOFFSET5 (float)(THETA5 - OMEGA5 * SLOPECALC5)
#define LINEOFFSET6 (float)(THETA6 - OMEGA6 * SLOPECALC6)
#define LINEOFFSET7 (float)(THETA7 - OMEGA7 * SLOPECALC7)

#define SLOPEINT0 (int)(SLOPECALC0)
#define SLOPEINT1 (int)(SLOPECALC1)
#define SLOPEINT2 (int)(SLOPECALC2)
#define SLOPEINT3 (int)(SLOPECALC3)
#define SLOPEINT4 (int)(SLOPECALC4)
#define SLOPEINT5 (int)(SLOPECALC5)
#define SLOPEINT6 (int)(SLOPECALC6)
#define SLOPEINT7 (int)(SLOPECALC7)

#define SLOPEFRAC0 Q15(SLOPECALC0 - SLOPEINT0)
#define SLOPEFRAC1 Q15(SLOPECALC1 - SLOPEINT1)
#define SLOPEFRAC2 Q15(SLOPECALC2 - SLOPEINT2)
#define SLOPEFRAC3 Q15(SLOPECALC3 - SLOPEINT3)
#define SLOPEFRAC4 Q15(SLOPECALC4 - SLOPEINT4)
#define SLOPEFRAC5 Q15(SLOPECALC5 - SLOPEINT5)
#define SLOPEFRAC6 Q15(SLOPECALC6 - SLOPEINT6)
#define SLOPEFRAC7 Q15(SLOPECALC7 - SLOPEINT7)

#define CONSTANT0 Q15(LINEOFFSET0)
#define CONSTANT1 Q15(LINEOFFSET1)
#define CONSTANT2 Q15(LINEOFFSET2)
#define CONSTANT3 Q15(LINEOFFSET3)
#define CONSTANT4 Q15(LINEOFFSET4)
#define CONSTANT5 Q15(LINEOFFSET5)
#define CONSTANT6 Q15(LINEOFFSET6)
#define CONSTANT7 Q15(LINEOFFSET7)
#define DEFAULTCONSTANT Q15(THETA7)

void SMC_Position_Estimation(SMC_handle);
void SMCInit(SMC_handle);
SFRAC16 FracDiv(SFRAC16 numerator, SFRAC16 denominator);
int cordic(int x, int y);

extern SFRAC16 PrevTheta;
extern SFRAC16 AccumTheta;
extern unsigned int AccumThetaCnt;

#endif
