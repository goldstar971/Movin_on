#include "general.h"


//==================== PIN DEFINITIONS ======================

// LED's - Active high
#define pinLED1              LATAbits.LATA9
#define pinLED2              LATAbits.LATA10
#define pinLED3              LATAbits.LATA14
#define pinLED4              LATAbits.LATA15
#define pinLED_F_R           LATDbits.LATD7

// Pushbutton pin connections for the motor control PCB.
#define pinButton1           !PORTGbits.RG6
#define pinButton2           !PORTGbits.RG7
#define pinButton3           !PORTGbits.RG8
#define pinButton4           !PORTGbits.RG9

// This is the control line for the driver IC on the
// motor control PCB.  It must be low to activate
// the PWM drive signals to the power module.
#define pinPWMOutputEnable_   PORTDbits.RD11    // active low 

// PFC switch firing line
#define pinPFCFire           PORTDbits.RD5

// BRAKE circuit firing line
#define pinBrakeFire         PORTDbits.RD4

// This is the fault reset line for the motor power module.
// The dsPIC must generate an active high pulse to clear any
// of the red fault LEDs on the power module.
#define pinFaultReset        PORTEbits.RE9

