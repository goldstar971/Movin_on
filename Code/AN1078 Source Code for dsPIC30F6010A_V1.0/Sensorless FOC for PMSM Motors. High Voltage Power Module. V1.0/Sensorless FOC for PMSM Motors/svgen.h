#ifndef SVGen_H
#define SVGen_H
//------------------  C ASVGen for SVGen routines ---------------------

typedef struct {
    short   iPWMPeriod;

    short   qVr1;
    short   qVr2;
    short   qVr3;

    } tSVGenParm;

void CalcRefVec( void );
void CalcSVGen( void );
void CorrectPhase( void );

tSVGenParm SVGenParm;
#endif



