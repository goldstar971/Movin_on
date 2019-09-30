#ifndef UserParms_H
#define UserParms_H

//**************  Oscillator **************

#define dFoscExt        7372800         // External Crystal or Clock Frequency (Hz)
#define dPLL            16              // PLL ratio
#define dLoopTimeInSec  0.000125        // PWM Period - 125 uSec, 8Khz PWM
#define dDeadTimeSec    0.000002        // Deadtime in seconds
#define	dDispLoopTime	0.100			// Display and button polling loop period in sec

// Derived
#define dFosc       (dFoscExt*dPLL)     // Clock frequency (Hz)
#define dFcy        (dFosc/4)           // Instruction cycle frequency (Hz)
#define dTcy        (1.0/dFcy)          // Instruction cycle period (sec)
#define dDeadTime   (int)(dDeadTimeSec*dFcy) // Dead time in dTcys

#define dLoopInTcy  (dLoopTimeInSec/dTcy)   // Basic loop period in units of Tcy

// Number of control loops that must execute before the button and display
// routine is executed.
#define	dDispLoopCnt	(dDispLoopTime/dLoopTimeInSec)

//**************  Motor Parameters **************
#define diPoles         2       // Number of pole pairs
#define PhaseRes		((float)(1.4 / 2.0))
#define PhaseInd		((float)(0.0147 / 2.0))

//************** Measurement **************
#define diIrpPerCalc    8      // PWM loops per velocity calculation

//************** PI Coefficients **************

// This definition can be used to bypass the velocity control loop.
// If TORQUE_MODE is defined, then the potentiometer demand value
// is passed directly to the Q (torque) control loop.
//#define	TORQUE_MODE

//******** D Control Loop Coefficients *******
#define     dDqKp           Q15(0.05);     // 0x4000 
#define     dDqKi           Q15(0.005);     // 0x00A4  
#define     dDqKc           Q15(0.005);     // 0x00A4
#define     dDqOutMax       0x27F7;     // 0x27F7

//******** Q Control Loop Coefficients *******
#define     dQqKp           Q15(0.05);
#define     dQqKi           Q15(0.005);
#define     dQqKc           Q15(0.005);
#define     dQqOutMax       0x7999;

//*** Velocity Control Loop Coefficients *****
#define     dQrefqKp        Q15(0.15);
#define     dQrefqKi        Q15(0.0025);
#define     dQrefqKc        Q15(0.9999);
#define     dQrefqOutMax    0x5000;

//************** ADC Scaling **************
// Scaling constants: Determined by calibration or hardware design. 

#define     dqK             0x3FFF;     // equivalent to 0.4999
#define     dqKa            0x3FFF;     // equivalent to 0.4999
#define     dqKb            0x3FFF;     // equivalent to 0.4999

//************** Field Weakening **************

// Field Weakening constant for constant torque range
#define     dqK1            0;       // Flux reference value

#endif
