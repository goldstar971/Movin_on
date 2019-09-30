#ifndef SnapShot_H
#define SnapShot_H

#define dSnapSkip 10     // Frequency of samples in PWM Loops
#define SNAPSIZE 2500   // Number of data points captured

short iNumSnap;
short *pSnap;

short iSnapSkip;
short iSnapSkipCnt;
short iSnapCols;

short iChgDelay;
short iChgDelayCnt;

short Snap[SNAPSIZE];

//---------------------------------------------------------------------

void initSnap(void);
bool DoSnap( void);
bool SnapShort( short iX );



#endif
