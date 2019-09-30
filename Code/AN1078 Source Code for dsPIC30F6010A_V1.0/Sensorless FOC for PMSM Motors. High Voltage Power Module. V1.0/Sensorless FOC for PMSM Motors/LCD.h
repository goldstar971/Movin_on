#ifndef LCD_H
#define LCD_H

#define dRS   LATCbits.LATC3
#define dE    LATDbits.LATD13
#define dR_W  LATCbits.LATC1
#define dBusy PORTDbits.RD3

void Int2Ascii(int value, int *pstring);
void Wrt_Int_LCD( int iNumber, BYTE bChrPosC, BYTE bChrPosR);
void Wrt_Signed_Int_LCD(int iNumber , BYTE bChrPosC, BYTE bChrPosR);
void Wrt_S_LCD(char s[], BYTE bChrPosC, BYTE bChrPosR);
void HomeLCD(void);
void HomeClearLCD(void);
void ChrPos (BYTE bChrPosC, BYTE bChrPosR);
void WrtChrNext(BYTE bNumber);
void Wait(WORD count);
void WrtLCDInst(BYTE bValue);
void WrtLCDData(BYTE bValue);
void WrtLCDByte(BYTE bValue);
void LCDBusy(void);
void InitLCD(void);

#endif
