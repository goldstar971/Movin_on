/*=============================================================================
    Initialize ports for P30F6010a
=============================================================================*/

#include "general.h"

void SetupPorts( void )
{


// ============= Port A ==============

//        absent
//        absent
//        absent
//        absent

//        absent
//        absent
//        absent
//        absent

//        absent
// RA9    VREF-                 O   LED1 (Active high)  
// RA10   VREF+                 O   LED2 (Active high)  
//        absent

//        absent
//        absent
// RA14   INT3                  O   LED3 (Active high)   
// RA15   INT4                  O   LED4 (Active high)  

    LATA  = 0x0000;
    TRISA = 0x39FF;

// ============= Port B ==============

// RB0    PGD/EMUD/AN0/CN2      AI  Phase1 I /EMUD
// RB1    PGC/EMUC/AN1/CN3      AI  Phase2 I /EMUC
// RB2    AN2/SS1/LVDIN/CN4     AI  Phase3 I
// RB3    AN3/INDX/CN5          I   QEI Index

// RB4    AN4/QEA/CN6           I   QEI A
// RB5    AN5/QEB/CN7           I   QEI B
// RB6    AN6/OCFA              AI  PFC Hall  
// RB7    AN7                   AI  Pot (VR1)

// RB8    AN8                   AI  Bus Shunt
// RB9    AN9                   AI  VAC Sense
// RB10   AN10                  AI  Phase4 Shunt
// RB11   AN11                  AI  VBus Sense

// RB12   AN12                  AI  V Phase1
// RB13   AN13                  AI  V Phase2
// RB14   AN14                  AI  V Phase3
// RB15   AN15/OCFB/CN12        O   Fault'

    LATB  = 0x0000;
    TRISB = 0xFFFF;

// ============= Port C ==============

//        absent
// RC1    T2CK                  O   LCD R/W'
//        absent
// RC3    T4CK                  O   LCD RS 

//        absent
//        absent
//        absent
//        absent

//        absent
//        absent
//        absent
//        absent

//        absent
// RC13   EMUD1/SOSC2/CN1           EMUD1
// RC14   EMUC1/SOSC1/T1CK/CN0      EMUC1
// RC15   OSC2/CLKO

    LATC  = 0x0000;
    TRISC = 0xFFF5;

// ============= Port D ==============

// RD0    EMUC2/OC1             I/O LCD D0
// RD1    EMUD2/OC2             I/O LCD D1      
// RD2    OC3                   I/O LCD D2
// RD3    OC4                   I/O LCD D3

// RD4    OC5/CN13              O   Brake circuit firing line (Active high)
// RD5    OC6/CN14              O   PFC switch firing line (Active high)
// RD6    OC7/CN15  			O	//*** Output compare 7 for diagnostics	
// RD7    OC8/CN16/UPDN         O   //*** Output compare 8 for diagnostics

// RD8    IC1                   I   CAP1
// RD9    IC2                   I   CAP2
// RD10   IC3                   I   CAP3
// RD11   IC4                   O   Fire Enable (PWM Output Enable) (Active low)

// RD12   IC5
// RD13   IC6/CN19              O   LCD E
// RD14   IC7/CN20
// RD15   IC8/CN21

    LATD  = 0x0000;
    TRISD = 0xD70F;

// ============= Port E ==============

// RE0    PWM1L                 O   Phase1 L
// RE1    PWM1H                 O   Phase1 H
// RE2    PWM2L                 O   Phase2 L
// RE3    PWM2H                 O   Phase2 H

// RE4    PWM3L                 O   Phase3 L
// RE5    PWM3H                 O   Phase3 H
// RE6    PWM4L                 O   Phase4 L
// RE7    PWM4H                 O   Phase4 H

// RE8    FLTA/INT1             I   Fault'
// RE9    FLTB/INT2             O   Fault Reset (Active high)
//        absent
//        absent

//        absent
//        absent
//        absent
//        absent

    LATE  = 0x0000;
    TRISE = 0xFDFF;

// ============= Port F ==============

// RF0    C1RX                  I   CAN Rx
// RF1    C1TX                  O   CAN Tx
// RF2    U1RX                  I   232 Rx
// RF3    U1TX                  O   232 Tx

// RF4    U2RX/CN17             I   485 Rx
// RF5    U2TX/CN18             O   485 Tx
// RF6    EMUC3/SCK1/INT0       I   ISO SCK1
// RF7    SDI1                  I   ISO SDI1

// RF8    EMUD3/SDO1            O   SDO1
//        absent
//        absent
//        absent

//        absent
//        absent
//        absent
//        absent

    LATF  = 0x0000;
    TRISF = 0xFFFF;

// ============= Port G ==============

// RG0    C2RX                  O   485 RE'
// RG1    C2TX                  O   485 DE
// RG2    SCL                   I/O SCL
// RG3    SDA                   I/O SDA

//        absent
//        absent
// RG6    SCK2/CN8              I   Button 1 (S4) (Active low)
// RG7    SDI2/CN9              I   Button 2 (S5) (Active low)

// RG8    SDO2/CN10             I   Button 3 (S6) (Active low)
// RG9    SS2/CN11              I   Button 4 (S7) (Active low)
//        absent
//        absent

//        absent
//        absent
//        absent
//        absent

    LATG  = 0x0000;
    TRISG = 0xFFF0;

}

