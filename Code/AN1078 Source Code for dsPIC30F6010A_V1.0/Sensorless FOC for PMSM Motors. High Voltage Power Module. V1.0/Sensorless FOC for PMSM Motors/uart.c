#include "Motor.h"
#include "UART.h"


void DumpBuffer(WORD iNum, short *pBuf, short iNumCol)
{
    SendUARTShort( 0xFFAA );    // tag
    SendUARTShort( iNumCol );
    while( iNum-- )
        SendUARTShort( *pBuf++ );
}



//---------------------------------------------------------------------
// Setup UART baudrate and init UART.
#define BAUD 115200
void SetupUART(void)
{
    U1MODE = 0;
    U1STA  = 0;
    U1BRG = (((14745600/BAUD) / 16) -1);
    ResetUART();
}

//---------------------------------------------------------------------
// Setup UART baudrate and init UART.
#define BAUD1 230400
void SetupUARTFast(void)
{
    U1MODE = 0;
    U1STA  = 0;
    U1BRG = (((7372800/BAUD1) / 16) -1);
    ResetUART();
}


//---------------------------------------------------------------------
// Reset UART due to error or on startup.  Clears all pending bytes, 
// resets all error conditions and re-enables UART
void ResetUART(void)
{
    U1MODEbits.UARTEN = 0;
    U1MODEbits.UARTEN = 1;      // Enable UART
    U1STAbits.UTXEN = 1;        // Enable UART TX
}

//---------------------------------------------------------------------
// Sent byte
void SendUARTByte( BYTE b )
{
    while( U1STAbits.UTXBF );      // buffer full

    U1TXREG = b;
}

//---------------------------------------------------------------------
// Send short
void SendUARTShort( short s )
{
    while( U1STAbits.UTXBF );      // buffer full
    U1TXREG = (BYTE)s;
    while( U1STAbits.UTXBF );      // buffer full
    U1TXREG = *((BYTE *)&s + 1);
}

