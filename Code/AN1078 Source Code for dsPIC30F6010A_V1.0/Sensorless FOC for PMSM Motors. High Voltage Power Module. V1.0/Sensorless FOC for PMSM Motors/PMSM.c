 /**********************************************************************
 *                                                                     *
 *                        Software License Agreement                   *
 *                                                                     *
 *    The software supplied herewith by Microchip Technology           *
 *    Incorporated (the "Company") for its dsPIC controller            *
 *    is intended and supplied to you, the Company's customer,         *
 *    for use solely and exclusively on Microchip dsPIC                *
 *    products. The software is owned by the Company and/or its        *
 *    supplier, and is protected under applicable copyright laws. All  *
 *    rights are reserved. Any use in violation of the foregoing       *
 *    restrictions may subject the user to criminal sanctions under    *
 *    applicable laws, as well as to civil liability for the breach of *
 *    the terms and conditions of this license.                        *
 *                                                                     *
 *    THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION.  NO           *
 *    WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING,    *
 *    BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND    *
 *    FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE     *
 *    COMPANY SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL,  *
 *    INCIDENTAL OR CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.  *
 *                                                                     *
  **********************************************************************/

 /**********************************************************************
 *                                                                     * 
 *    Author: John Theys/Dave Ross/Jorge Zambada                       * 
 *                                                                     *
 *    Filename:       PMSM.c                                           *
 *    Date:           04/27/07                                         *
 *    File Version:   1.00                                             *
 *                                                                     *
 *    Tools used: MPLAB GL  -> 7.52.0.0                                *
 *                                                                     *
 *    Linker File:    p30f6010a.gld                                     *
 *                                                                     *
 *                                                                     *
 ***********************************************************************
 *10/31/03  2.00    Released    Motor runs fine, still some loose ends
 *
 *12/19/03  2.01    Cleaned up structure, created UserParms.h for all 
 *                  user defines.
 *
 *02/12/04	3.00	-Removed unnecessary files from project.
 					-Changed iRPM to int to correct floating point calc
 * 					problems.
 *					-CalcVel() and velocity control loop only execute
 *					after number of loop periods specified by
 *					iIrpPerCalc.
 *					-Added iDispLoopCount variable to schedule 
 *					execution of display and button routines
 *					-trig.s file changed to use program space for 
 *					storage of sine data.
 *					-Added DiagnosticsOutput() function that uses 
 *					output compare channels to output control variable
 *					information.
 *					-Added TORQUE_MODE definition to bypass velocity
 *					control loop.
 *					-Turned off SATDW bit in curmodel.s file.  The
 *					automatic saturation feature prevents slip
 *					angle calculation from wrapping properly.
 *04/27/07  4.00    -PMSM functionality added. Speed and Position Estimation
 *                  is used to control PMSM motors. ACIM is not supported.
 *
 ************************************************************************
 *      Code Description
 *  
 *  This file demonstrates Vector Control of a 3 phase PMSM using the
 *  dsPIC30F.  SVM is used as the modulation strategy. Currents are measured
 *  to estimate position and speed of PMSM Motors
 **********************************************************************/

/************** GLOBAL DEFINITIONS ***********/

#define INITIALIZE
#include "Motor.h"
#include "Parms.h"
#include "Encoder.h"
#include "SVGen.h"
#include "ReadADC.h"
#include "MeasCurr.h"
#include "Control.h"
#include "PI.h"
#include "Park.h"
#include "OpenLoop.h"
#include "Util.h"
#include "LCD.h"
#include "bin2dec.h"
#include "UserParms.h"
#include "smcpos.h"

/************** END OF GLOBAL DEFINITIONS ***********/

SMC smc1 = SMC_DEFAULTS;

#undef	SNAPSHOT
#ifdef	SNAPSHOT
#define	SNAPSIZE		900
#define SNAPDELAY		0 // In number of PWM Interrupts
#define	SNAP1		smc1.Ialpha
#define	SNAP2		smc1.Ealpha
#define SNAP3		smc1.EalphaFinal
int	SnapBuf1[SNAPSIZE];
int SnapBuf2[SNAPSIZE];
int SnapBuf3[SNAPSIZE];		
int	SnapCount = 0;
int SnapShotDelayCnt = 0;
int SnapShotDelay = SNAPDELAY;
#endif

extern int FilteredOmega;
extern int __OffsetTheta;

unsigned long Startup_Ramp = 0;            // Start up ramp in open loop
unsigned int Startup_Lock = 0;

unsigned int LOCK_TIME = 4000; // This number is: 8,000 is 1 second.
unsigned int END_SPEED_RPM = 450; // Value in RPMs

//END_SPEED = END_SPEED_RPM * Pole Pairs * PWM Period * 65536 / 60.0

union   {
        struct
            {
            unsigned DoLoop:1;
            unsigned BeginStop:1;
            unsigned DoSnap:1;
            unsigned SnapDone:1;
            unsigned OpenLoop:1;
            unsigned RunMotor:1;
            unsigned RunningUpload:1;
            unsigned Btn1Pressed:1;
            unsigned Btn2Pressed:1;
            unsigned Btn3Pressed:1;
            unsigned Btn4Pressed:1;
            unsigned UploadToMonitor:1;
            unsigned ChangeMode:1;
            unsigned ChangeSpeed:1;
            unsigned    :2;
            }bit;
        WORD Word;
        } uGF;        // general flags


 union   {
            long  Long;
            WORD  Word[2];
            short Short[2];
            BYTE  Byte[4];
            } DataUnion;        

tPIParm     PIParmQ;
tPIParm     PIParmQref;
tPIParm     PIParmD;

tReadADCParm ReadADCParm;

int iRPM,iRPM_old;
int iOffset, iOffset_old;
WORD iMaxLoopCnt;
WORD iLoopCnt;
WORD iDispLoopCnt;

SFRAC16 PrevTheta = 0;
SFRAC16 AccumTheta = 0;
SFRAC16 TemporalMechAng= 0;
unsigned int AccumThetaCnt = 0;

/******************************************************/
void __attribute__((__interrupt__)) _ADCInterrupt(void);
void __attribute__((__interrupt__)) _PWMInterrupt(void);
void SetupBoard( void );
bool SetupParm(void);
void SetupControlParameters(void);
void DoControl( void );
void Dis_RPM( BYTE bChrPosC, BYTE bChrPosR );
void CalculateParkAngle(void);

/************* START OF MAIN FUNCTION ***************/
int main ( void )
{
	SMCInit(&smc1);

    SetupPorts();
	InitLCD();
   	SetupControlParameters(); 
    while(1)
        {
        uGF.Word = 0;                   // clear flags
        
        // init Mode
        uGF.bit.OpenLoop = 1;           // start in openloop
		
		// init LEDs
        pinLED1 = 0;
        pinLED2 = !uGF.bit.OpenLoop;
        pinLED3 = 0;
        pinLED4 = 0;

        // init board
        SetupBoard();
        
        // init user specified parms and stop on error
        if( SetupParm() )
            {
            // Error
            uGF.bit.RunMotor=0;
            return;
            }
        
        // zero out i sums 
        PIParmD.qdSum = 0;
        PIParmQ.qdSum = 0;
        PIParmQref.qdSum = 0;
     
        iMaxLoopCnt = 0;
        
        Wrt_S_LCD("Vector Control  ", 0 , 0);
        Wrt_S_LCD("S4-Run/Stop     ", 0, 1);
                
        // Enable ADC interrupt and begin main loop timing
        IFS0bits.ADIF = 0; 
        IEC0bits.ADIE = 1;
		
        if(!uGF.bit.RunMotor)
            {	            
            // Initialize current offset compensation
            while(!pinButton1)                  //wait here until button 1 is pressed 
                {
                ClrWdt();               

                // Start offset accumulation    //and accumulate current offset while waiting
                MeasCompCurr();

                }
            while(pinButton1);                  //when button 1 is released 
			SetupParm();
            uGF.bit.RunMotor = 1;               //then start motor
            }

        // Run the motor
        uGF.bit.ChangeMode = 1;
        // Enable the driver IC on the motor control PCB
        pinPWMOutputEnable_ = 0;
        
		Wrt_S_LCD("RPM=            ", 0, 0);
		Wrt_S_LCD("S5-Cls. Lp S6-2x", 0, 1);
		
		//Run Motor loop
        while(1)
            {
            ClrWdt();
            
            // Write vector control variables to output compare channels
            // for observation on oscilloscope.
                          
            // The code that updates the LCD display and polls the buttons
            // executes every 50 msec.
            
            if(iDispLoopCnt >= dDispLoopCnt)
            	{
            	//Display RPM
            	Dis_RPM(5,0);
      			// Button 1 starts or stops the motor
                if(pinButton1)  
	                {
                    if( !uGF.bit.Btn1Pressed )
                        uGF.bit.Btn1Pressed  = 1;
                    }
                else
                    {
                    if( uGF.bit.Btn1Pressed )
                        {
                        // Button just released
                        uGF.bit.Btn1Pressed  = 0;
                        // begin stop sequence
                        uGF.bit.RunMotor = 0;
                        pinPWMOutputEnable_ = 1;
                        break;
                        }
                    }
                    
				//while running button 2 will toggle open and closed loop
                if(pinButton2)                  
                    {
                    if( !uGF.bit.Btn2Pressed )
                        uGF.bit.Btn2Pressed  = 1;
                    }
                else
                    {
                    if( uGF.bit.Btn2Pressed )
                        {
                        // Button just released
                        uGF.bit.Btn2Pressed  = 0;
                        uGF.bit.ChangeMode = 1;
                        uGF.bit.OpenLoop = ! uGF.bit.OpenLoop;
                        pinLED2 = !uGF.bit.OpenLoop;
                        }
                    }
				
				//while running button 3 will double/half the speed or torque demand
                if(pinButton3)                      
                    {
                    if( !uGF.bit.Btn3Pressed )
                        uGF.bit.Btn3Pressed  = 1;
                        LATGbits.LATG0 = 0;
                    }
                else
                    {
                    if( uGF.bit.Btn3Pressed )
                        {
                        // Button just released
                        uGF.bit.Btn3Pressed  = 0;
                        uGF.bit.ChangeSpeed = !uGF.bit.ChangeSpeed;
                        pinLED3 = uGF.bit.ChangeSpeed;
                        
                        #ifdef SNAPSHOT
                        uGF.bit.DoSnap = 1;
                        SnapCount = 0;
                        pinLED4 = 1;
                        #endif
                        
                        }
                    }
				
				if( uGF.bit.SnapDone )
                    { 
                                         
                     uGF.bit.SnapDone=0;
                     pinLED4 = 0;          
                        
                    }

                }  // end of display and button polling code              
                
            }   // End of Run Motor loop

        
        } // End of Main loop
        
    // should never get here
    while(1){}
}

//---------------------------------------------------------------------
// Executes one PI itteration for each of the three loops Id,Iq,Speed

void DoControl( void )
{
short i;
short TempAng;

    // Assume ADC channel 0 has raw A/D value in signed fractional form from
    // speed pot (AN7).
    
	ReadSignedADC0( &ReadADCParm );
	
    if( uGF.bit.OpenLoop )
        {
        // OPENLOOP:  force rotating angle,Vd,Vq

        if( uGF.bit.ChangeMode )
            {
            // just changed to openloop
            uGF.bit.ChangeMode = 0;
            // synchronize angles

            // VqRef & VdRef not used
            CtrlParm.qVqRef = 0;
            CtrlParm.qVdRef = 0;
			uGF.bit.DoSnap = 1;
			Startup_Lock = 0;
			Startup_Ramp = 0;
			// Initialize SMC
			smc1.Valpha = 0;
			smc1.Ealpha = 0;
			smc1.EalphaFinal = 0;
			smc1.Zalpha = 0;
			smc1.EstIalpha = 0;
			smc1.Vbeta = 0;
			smc1.Ebeta = 0;
			smc1.EbetaFinal = 0;
			smc1.Zbeta = 0;
			smc1.EstIbeta = 0;
			smc1.Ialpha = 0;
			smc1.IalphaError = 0;
			smc1.Ibeta = 0;
			smc1.IbetaError = 0;
			smc1.Theta = 0;
			smc1.Omega = 0;

            }

		CtrlParm.qVelRef = ADCBUF3/2; // Initial Torque Reference

       

        if(AccumThetaCnt == 0)
	    {
			CalcVel();
            PIParmQref.qInMeas = smc1.Omega;
		}

        CtrlParm.qVqRef    = CtrlParm.qVelRef;
       	
        // PI control for Q
        PIParmQ.qInMeas = ParkParm.qIq;
        PIParmQ.qInRef  = CtrlParm.qVqRef;
        CalcPI(&PIParmQ);
        ParkParm.qVq    = PIParmQ.qOut;       

        // PI control for D
        PIParmD.qInMeas = ParkParm.qId;
        PIParmD.qInRef  = CtrlParm.qVdRef;
        CalcPI(&PIParmD);
        ParkParm.qVd    = PIParmD.qOut;
    }

    else
        // Closed Loop Vector Control
        {

		if(uGF.bit.ChangeSpeed)
		{
		    CtrlParm.qVelRef = ReadADCParm.qADValue/3;
		}
		else
		{
		    CtrlParm.qVelRef = ReadADCParm.qADValue/6;
		}

        if( uGF.bit.ChangeMode )
        {
            // just changed from openloop
            uGF.bit.ChangeMode = 0;
			PIParmQref.qdSum = (long)CtrlParm.qVqRef << 13;
			Startup_Lock = 0;
			Startup_Ramp = 0;
	    }               
                
        // Check to see if new velocity information is available by comparing
        // the number of interrupts per velocity calculation against the
        // number of velocity count samples taken.  If new velocity info
        // is available, calculate the new velocity value and execute
        // the speed control loop.

        if(AccumThetaCnt == 0)
        	{
	        // Calculate velocity from acumulated encoder counts
        	CalcVel();
        	// Execute the velocity control loop
			PIParmQref.qInMeas = smc1.Omega;
        	PIParmQref.qInRef  = CtrlParm.qVelRef;
        	CalcPI(&PIParmQref);
        	CtrlParm.qVqRef = PIParmQref.qOut;
           	}
       
        #ifdef	SNAPSHOT
		if(SnapShotDelayCnt++ == SnapShotDelay)
		{
			SnapShotDelayCnt = 0;
			// Log data in the snapshot buffers
	       	if( uGF.bit.DoSnap )
	        {
		     SnapBuf1[SnapCount] = SNAP1;
		     SnapBuf2[SnapCount] = SNAP2;  
		     SnapBuf3[SnapCount] = SNAP3;   
		     SnapCount++;    
	         if(SnapCount == SNAPSIZE)
	            {
					SnapCount = 0;
	                uGF.bit.SnapDone=1;
	                uGF.bit.DoSnap = 0;
	            }
	         }
   		}
       	#endif
       
       
        // If the application is running in torque mode, the velocity
        // control loop is bypassed.  The velocity reference value, read
        // from the potentiometer, is used directly as the torque 
        // reference, VqRef.
       	
        // PI control for Q
        PIParmQ.qInMeas = ParkParm.qIq;
        PIParmQ.qInRef  = CtrlParm.qVqRef;
        CalcPI(&PIParmQ);
        ParkParm.qVq    = PIParmQ.qOut;       

        // PI control for D
        PIParmD.qInMeas = ParkParm.qId;
        PIParmD.qInRef  = CtrlParm.qVdRef;
        CalcPI(&PIParmD);
        ParkParm.qVd    = PIParmD.qOut;

        }
}

//---------------------------------------------------------------------
// The ADC ISR does speed calculation and executes the vector update loop.
// The ADC sample and conversion is triggered by the PWM period.
// The speed calculation assumes a fixed time interval between calculations.
//---------------------------------------------------------------------

void __attribute__((__interrupt__)) _ADCInterrupt(void)
{
		_RG0 = 1;
        IFS0bits.ADIF = 0;
        
        // Increment count variable that controls execution
        // of display and button functions.
        iDispLoopCnt++;
        
        // acumulate position counts since last interrupt  
        CalcVelIrp();  
     
        if( uGF.bit.RunMotor )
                {
                
                // Set LED1 for diagnostics
                pinLED1 = 1; 
                
                // use TMR1 to measure interrupt time for diagnostics
                TMR1 = 0;           
                iLoopCnt = TMR1;
		 
		        // Calculate qIa,qIb
                MeasCompCurr();
                
				// Calculate qAngle from QEI Module
				CalculateParkAngle();

                // Calculate qId,qIq from qSin,qCos,qIa,qIb
                ClarkePark();
                               
                // Calculate control values
                DoControl();
							
                // Calculate qSin,qCos from qAngle
                SinCos();

                // Calculate qValpha, qVbeta from qSin,qCos,qVd,qVq
                InvPark();    

                // Calculate Vr1,Vr2,Vr3 from qValpha, qVbeta 
                CalcRefVec();

                // Calculate and set PWM duty cycles from Vr1,Vr2,Vr3
                CalcSVGen();
                
                // Measure loop time
                iLoopCnt = TMR1 - iLoopCnt;
                if( iLoopCnt > iMaxLoopCnt )
                    iMaxLoopCnt = iLoopCnt;
                               
                // Clear LED1 for diagnostics
                pinLED1 = 0;
                }    
		_RG0 = 0;
}

//---------------------------------------------------------------------
// SetupBoard
//
// Initialze board
//---------------------------------------------------------------------

void SetupBoard( void )
{
    BYTE b;

    // Disable ADC interrupt
    IEC0bits.ADIE = 0; 

    // Reset any active faults on the motor control power module.
    pinFaultReset = 1;
    for(b=0;b<10;b++)
        Nop();
    pinFaultReset = 0;


    // Ensure PFC switch is off.
    pinPFCFire = 0;
    // Ensure brake switch is off.
    pinBrakeFire = 0;
}

//---------------------------------------------------------------------
// Dis_RPM
//
// Display RPM
//---------------------------------------------------------------------
void Dis_RPM( BYTE bChrPosC, BYTE bChrPosR )
{
	if (FilteredOmega < 0)
	    Wrt_S_LCD("-", bChrPosC, bChrPosR);
	else
	    Wrt_S_LCD("+", bChrPosC, bChrPosR);
	
	iRPM_old = iRPM;
	iRPM = (int)((float)(FilteredOmega / 32768.0) * 60.0) / \
           (SPEED_CONSTANT * diIrpPerCalc * diPoles * dLoopTimeInSec * 2.0);
    iRPM = (iRPM + iRPM_old) >> 1;
    Wrt_Signed_Int_LCD( iRPM, bChrPosC, bChrPosR);

	if (__OffsetTheta < 0)
	    Wrt_S_LCD("-", bChrPosC+6, bChrPosR);
	else
	    Wrt_S_LCD("+", bChrPosC+6, bChrPosR);
	
	iOffset_old = iOffset;       
    iOffset = __OffsetTheta/90;
    iOffset = (iOffset + iOffset_old) >> 1;
	Wrt_Signed_Int_LCD(iOffset, bChrPosC+7, bChrPosR);
}    

//---------------------------------------------------------------------
bool SetupParm(void)
{
    // Turn saturation on to insure that overflows will be handled smoothly.
    CORCONbits.SATA  = 0;

    // Setup required parameters
 
    // Number of pole pairs
    MotorParm.iPoles        = diPoles ;

    // Basic loop period (in sec).  (PWM interrupt period)
    MotorParm.fLoopPeriod = dLoopInTcy * dTcy;  //Loop period in cycles * sec/cycle

    // Encoder velocity interrupt period (in sec). 
    MotorParm.fVelIrpPeriod = MotorParm.fLoopPeriod;

    // Number of vel interrupts per velocity calculation.
    MotorParm.iIrpPerCalc = diIrpPerCalc;       // In loops 

    // Scale mechanical speed of motor (in rev/sec)
    MotorParm.fScaleMechRPS = MotorParm.iScaleMechRPM/60.0;

    // Scaled flux speed of motor (in rev/sec)
    // All dimensionless flux velocities scaled by this value.
    MotorParm.fScaleFluxRPS = MotorParm.iPoles*MotorParm.fScaleMechRPS;

    // Fraction of revolution per LoopTime at maximum flux velocity
    MotorParm.fScaleFracRevPerLoop = MotorParm.fLoopPeriod * MotorParm.fScaleFluxRPS; 

    // Scaled flux speed of motor (in radians/sec)
    // All dimensionless velocities in radians/sec scaled by this value.
    MotorParm.fScaleFluxSpeed = 6.283 * MotorParm.fScaleFluxRPS;

    // Encoder count rate at iScaleMechRPM
    MotorParm.lScaleCntRate = MotorParm.iCntsPerRev * (MotorParm.iScaleMechRPM/60.0);

// ============= Open Loop ======================
	// Motor End Speed Calculation

	MotorParm.EndSpeed = END_SPEED_RPM * MotorParm.iPoles * dLoopTimeInSec * 65536 / 60.0;
	MotorParm.EndSpeed = MotorParm.EndSpeed * 1024;
	MotorParm.LockTime = LOCK_TIME;

// ============= Encoder ===============

    if( InitEncoderScaling() )
        // Error
        return True;

// ============= ADC - Measure Current & Pot ======================

    // Scaling constants: Determined by calibration or hardware design.
    ReadADCParm.qK      = dqK;    

    MeasCurrParm.qKa    = dqKa;    
    MeasCurrParm.qKb    = dqKb;   

    // Inital offsets
    InitMeasCompCurr(0,0);    

// ============= SVGen ===============
    // Set PWM period to Loop Time 
    SVGenParm.iPWMPeriod = dLoopInTcy;      

// ============= TIMER #1 ======================
    PR1 = 0xFFFF;
    T1CONbits.TON = 1;
    T1CONbits.TCKPS = 1;    // prescale of 8 => 1.08504 uS tick

// ============= Motor PWM ======================

    PDC1 = 0;
    PDC2 = 0;
    PDC3 = 0;
    PDC4 = 0;

    // Center aligned PWM.
    // Note: The PWM period is set to dLoopInTcy/2 but since it counts up and 
    // and then down => the interrupt flag is set to 1 at zero => actual 
    // interrupt period is dLoopInTcy

    PTPER = dLoopInTcy/2;   // Setup PWM period to Loop Time defined in parms.h 

    PWMCON1 = 0x0077;       // Enable PWM 1,2,3 pairs for complementary mode
    DTCON1 = (0x40) | (dDeadTime / 2);     // Dead time
    DTCON2 = 0;
    FLTACON = 0;            // PWM fault pins not used
    FLTBCON = 0;

	IFS2bits.PWMIF = 0;
	IEC2bits.PWMIE = 0;

    PTCON = 0x8002;         // Enable PWM for center aligned operation

    // SEVTCMP: Special Event Compare Count Register 
    // Phase of ADC capture set relative to PWM cycle: 0 offset and counting up
    //SEVTCMP = 2;        // Cannot be 0 -> turns off trigger (Missing from doc)       
	SEVTCMP = PTPER;
    SEVTCMPbits.SEVTDIR = 0;

// ============= ADC - Measure Current & Pot ======================
// ADC setup for simultanous sampling on 
//      CH0=AN7, CH1=AN0, CH2=AN1, CH3=AN2. 
// Sampling triggered by PWM and stored in signed fractional form.

    ADCON1 = 0;
    // Signed fractional (DOUT = sddd dddd dd00 0000)
    ADCON1bits.FORM = 3;    
    // Motor Control PWM interval ends sampling and starts conversion
    ADCON1bits.SSRC = 3;  
    // Simultaneous Sample Select bit (only applicable when CHPS = 01 or 1x)
    // Samples CH0, CH1, CH2, CH3 simultaneously (when CHPS = 1x)
    // Samples CH0 and CH1 simultaneously (when CHPS = 01)
    ADCON1bits.SIMSAM = 1;  
    // Sampling begins immediately after last conversion completes. 
    // SAMP bit is auto set.
    ADCON1bits.ASAM = 1;  


    ADCON2 = 0;
    // Samples CH0, CH1, CH2, CH3 simultaneously (when CHPS = 1x)
    ADCON2bits.CHPS = 2;  


    ADCON3 = 0;
    // A/D Conversion Clock Select bits = 8 * Tcy
    ADCON3bits.ADCS = 15;  


    /* ADCHS: ADC Input Channel Select Register */
    ADCHS = 0;
    // CH0 is AN7
    ADCHSbits.CH0SA = 7;
    // CH1 positive input is AN0, CH2 positive input is AN1, CH3 positive input is AN2
    ADCHSbits.CH123SA = 0;


    /* ADPCFG: ADC Port Configuration Register */
    // Set all ports digital
    ADPCFG = 0xFFFF;
    ADPCFGbits.PCFG0 = 0;   // AN0 analog
    ADPCFGbits.PCFG1 = 0;   // AN1 analog
    ADPCFGbits.PCFG2 = 0;   // AN2 analog
    ADPCFGbits.PCFG7 = 0;   // AN7 analog

    /* ADCSSL: ADC Input Scan Select Register */
    ADCSSL = 0;

    // Turn on A/D module
    ADCON1bits.ADON = 1;
    
    return False;
}

void CalculateParkAngle(void)
{
 	smc1.Ialpha = ParkParm.qIalpha;
  	smc1.Ibeta = ParkParm.qIbeta;
    smc1.Valpha = ParkParm.qValpha;
    smc1.Vbeta = ParkParm.qVbeta;

	SMC_Position_Estimation(&smc1);

	if(uGF.bit.OpenLoop)	
	{
		if (Startup_Lock < LOCK_TIME)
			Startup_Lock+=1;
		else if (Startup_Ramp < MotorParm.EndSpeed)
			Startup_Ramp+=1;
		else
		{
            uGF.bit.ChangeMode = 1;
            uGF.bit.OpenLoop = 0;
            pinLED2 = !uGF.bit.OpenLoop;
		}
		ParkParm.qAngle += (int)(Startup_Ramp >> 10);
	}
	else
	{
		ParkParm.qAngle = smc1.Theta;
	}
	return;
}

void SetupControlParameters(void)
{

// ============= PI D Term ===============      
    PIParmD.qKp = dDqKp;       
    PIParmD.qKi = dDqKi;              
    PIParmD.qKc = dDqKc;       
    PIParmD.qOutMax = dDqOutMax;
    PIParmD.qOutMin = -PIParmD.qOutMax;

    InitPI(&PIParmD);

// ============= PI Q Term ===============
    PIParmQ.qKp = dQqKp;    
    PIParmQ.qKi = dQqKi;
    PIParmQ.qKc = dQqKc;
    PIParmQ.qOutMax = dQqOutMax;
    PIParmQ.qOutMin = -PIParmQ.qOutMax;

    InitPI(&PIParmQ);

// ============= PI Qref Term ===============
    PIParmQref.qKp = dQrefqKp;       
    PIParmQref.qKi = dQrefqKi;       
    PIParmQref.qKc = dQrefqKc;       
    PIParmQref.qOutMax = dQrefqOutMax;   
    PIParmQref.qOutMin = -PIParmQref.qOutMax;

    InitPI(&PIParmQref);
	return;
}

