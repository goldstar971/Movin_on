#include "general.h"
#include "smcpos.h"

SFRAC16 __OffsetTheta;
SFRAC16 Op1, Op2, Op3, Res1, FilteredOmega;

void SMC_Position_Estimation (SMC *s)
{
	long result;
	int acc_copy;
	register int resultA asm("A");
	asm("PUSH CORCON");
	CORCONbits.SATA = 1;
	CORCONbits.SATB = 1;
	CORCONbits.ACCSAT = 1;
	// Sliding mode current observer

	// 
	//
	//	s->EstIalpha = s->Fsmopos * s->EstIalpha +
	//				   s->Gsmopos * (s->Valpha - s->Ealpha - s->Zalpha)
	//
	//

	Op1 = s->Fsmopos;
	Op2 = s->EstIalpha;

	asm("MOV _Op1, W4");
	asm("MOV _Op2, W5");
	asm("MPY W4*W5, A");

	Op1 = s->Valpha;
	Op2 = s->Ealpha;
	Op3 = s->Zalpha;

	asm("MOV _Op1, W0");
	asm("MOV _Op2, W1");
	asm("MOV _Op3, W2");
	asm("LAC W1, B");
	asm("ADD W2, #0, B");
	asm("NEG B");
	asm("ADD W0, #0, B");
	asm("SAC.R B, #0, W4");
	
	Op1 = s->Gsmopos;

	asm("MOV _Op1, W5");
	asm("MPY W4*W5, B");
	asm("ADD A");
	asm("SAC.R A, #0, W0");
	asm("MOV W0, _Res1");
	
	s->EstIalpha = Res1;

	// 
	//
	//	s->EstIbeta = s->Fsmopos * s->EstIbeta +
	//				  s->Gsmopos * (s->Vbeta - s->Ebeta - s->Zbeta)
	//
	//

	Op1 = s->Fsmopos;
	Op2 = s->EstIbeta;

	asm("MOV _Op1, W4");
	asm("MOV _Op2, W5");
	asm("MPY W4*W5, A");

	Op1 = s->Vbeta;
	Op2 = s->Ebeta;
	Op3 = s->Zbeta;

	asm("MOV _Op1, W0");
	asm("MOV _Op2, W1");
	asm("MOV _Op3, W2");
	asm("LAC W1, B");
	asm("ADD W2, #0, B");
	asm("NEG B");
	asm("ADD W0, #0, B");
	asm("SAC.R B, #0, W4");
	
	Op1 = s->Gsmopos;

	asm("MOV _Op1, W5");
	asm("MPY W4*W5, B");
	asm("ADD A");
	asm("SAC.R A, #0, W0");
	asm("MOV W0, _Res1");
	
	s->EstIbeta = Res1;

	// Current errors
	// s->IalphaError = s->EstIalpha - s->Ialpha;
	Op1 = s->EstIalpha;
	Op2 = s->Ialpha;

	asm("MOV _Op1, W0");
	asm("MOV _Op2, W1");
	asm("LAC W0, A");
	asm("LAC W1, B");
	asm("SUB A");
	asm("SAC.R A, #0, W0");
	asm("MOV W0, _Res1");

	s->IalphaError = Res1;

	// s->IbetaError = s->EstIbeta - s->Ibeta;

	Op1 = s->EstIbeta;
	Op2 = s->Ibeta;

	asm("MOV _Op1, W0");
	asm("MOV _Op2, W1");
	asm("LAC W0, A");
	asm("LAC W1, B");
	asm("SUB A");
	asm("SAC.R A, #0, W0");
	asm("MOV W0, _Res1");

	s->IbetaError = Res1;

	// Sliding control calculator

	if (s->IalphaError > 0)
		s->Zalpha = s->Kslide;
	else if (s->IalphaError == 0)
		s->Zalpha = 0;
	else
		s->Zalpha = -s->Kslide;

	if (s->IbetaError > 0)
		s->Zbeta = s->Kslide;
	else if (s->IbetaError == 0)
		s->Zbeta = 0;
	else
		s->Zbeta = -s->Kslide;

	// Sliding control filter -> back EMF calculator
	// s->Ealpha = s->Ealpha + s->Kslf * (s->Zalpha-s->Ealpha)
	Op1 = s->Zalpha;
	Op2 = s->Ealpha;
	Op3 = s->Kslf;

	asm("MOV _Op1, W0");
	asm("MOV _Op2, W1");
	asm("MOV _Op3, W5");
	asm("LAC W0, A");
	asm("LAC W1, B");
	asm("SUB A");
	asm("SAC.R A, #0, W4");
	asm("MPY W4*W5, A");
	asm("ADD A");
	asm("SAC.R A, #0, W0");
	asm("MOV W0, _Res1");

	s->Ealpha = Res1;

	// s->Ebeta = s->Ebeta + s->Kslf * (s->Zbeta-s->Ebeta)
	Op1 = s->Zbeta;
	Op2 = s->Ebeta;
	Op3 = s->Kslf;

	asm("MOV _Op1, W0");
	asm("MOV _Op2, W1");
	asm("MOV _Op3, W5");
	asm("LAC W0, A");
	asm("LAC W1, B");
	asm("SUB A");
	asm("SAC.R A, #0, W4");
	asm("MPY W4*W5, A");
	asm("ADD A");
	asm("SAC.R A, #0, W0");
	asm("MOV W0, _Res1");

	s->Ebeta = Res1;

	// New filter used to calculate Position	
	// s->EalphaFinal = s->EalphaFinal + s->KslfFinal * (s->Ealpha-s->EalphaFinal)

	Op1 = s->Ealpha;
	Op2 = s->EalphaFinal;
	Op3 = s->KslfFinal;

	asm("MOV _Op1, W0");
	asm("MOV _Op2, W1");
	asm("MOV _Op3, W5");
	asm("LAC W0, A");
	asm("LAC W1, B");
	asm("SUB A");
	asm("SAC.R A, #0, W4");
	asm("MPY W4*W5, A");
	asm("ADD A");
	asm("SAC.R A, #0, W0");
	asm("MOV W0, _Res1");

	s->EalphaFinal = Res1;

	// s->EbetaFinal = s->EbetaFinal + s->KslfFinal * (s->Ebeta-s->EbetaFinal)

	Op1 = s->Ebeta;
	Op2 = s->EbetaFinal;
	Op3 = s->KslfFinal;

	asm("MOV _Op1, W0");
	asm("MOV _Op2, W1");
	asm("MOV _Op3, W5");
	asm("LAC W0, A");
	asm("LAC W1, B");
	asm("SUB A");
	asm("SAC.R A, #0, W4");
	asm("MPY W4*W5, A");
	asm("ADD A");
	asm("SAC.R A, #0, W0");
	asm("MOV W0, _Res1");

	s->EbetaFinal = Res1;

	asm("POP CORCON");

	// Rotor angle calculator -> Theta = atan(Ebeta,-Ealpha)
	s->Theta = cordic(s->EbetaFinal,-s->EalphaFinal);
	
	AccumTheta += s->Theta - PrevTheta;
	PrevTheta = s->Theta;
	
	AccumThetaCnt++;
	if (AccumThetaCnt == diIrpPerCalc)
	{
		resultA = __builtin_mpy(AccumTheta,Q15(SPEED_CONSTANT),0,0,0,0,0,0);
		asm("SAC.R A, #0, W0");
		asm("MOV W0, _Res1");
		s->Omega = Res1;
		AccumThetaCnt = 0;
		AccumTheta = 0;
	}
    //                               Q15(Omega) * PWM Frequency * 60
    // Speed RPMs = -----------------------------------------------------------
    //               Q15(Speed Constant) * Cycler per Speed Calc * Motor Poles
    // For example:
    //    Omega = .5
    //    PWM Frequency = 20,000
    //    Speed Constant = 0.625
    //    Cycles per Speed Calc = 20
    //    Motor Poles (pole pairs * 2) = 10
    // Then:
    //    Speed in RPMs is 4,800 RPMs

	// FilteredOmega = FilteredOmega + FilterCoeff * (s->Omega-FilteredOmega)

	asm("PUSH CORCON");
	CORCONbits.SATA = 1;
	CORCONbits.SATB = 1;
	CORCONbits.ACCSAT = 1;

	Op1 = s->Omega;
	Op2 = FilteredOmega;
	Op3 = Q15(0.01);

	asm("MOV _Op1, W0");
	asm("MOV _Op2, W1");
	asm("MOV _Op3, W5");
	asm("LAC W0, A");
	asm("LAC W1, B");
	asm("SUB A");
	asm("SAC.R A, #0, W4");
	asm("MPY W4*W5, A");
	asm("ADD A");
	asm("SAC.R A, #0, W0");
	asm("MOV W0, _Res1");

	FilteredOmega = Res1;

	asm("POP CORCON");

	if (FilteredOmega < Q15(OMEGA0))
	{
		resultA = __builtin_mpy(FilteredOmega,SLOPEFRAC0,0,0,0,0,0,0);
		asm("SAC.R A, #0, W0");
		asm("MOV W0, _Res1");
		__OffsetTheta = Res1;
		__OffsetTheta += FilteredOmega * SLOPEINT0;
		__OffsetTheta += CONSTANT0;
	}
	else if (FilteredOmega < Q15(OMEGA1))
	{
		resultA = __builtin_mpy(FilteredOmega,SLOPEFRAC1,0,0,0,0,0,0);
		asm("SAC.R A, #0, W0");
		asm("MOV W0, _Res1");
		__OffsetTheta = Res1;
		__OffsetTheta += FilteredOmega * SLOPEINT1;
		__OffsetTheta += CONSTANT1;
	}
	else if (FilteredOmega < Q15(OMEGA2))
	{
		resultA = __builtin_mpy(FilteredOmega,SLOPEFRAC2,0,0,0,0,0,0);
		asm("SAC.R A, #0, W0");
		asm("MOV W0, _Res1");
		__OffsetTheta = Res1;
		__OffsetTheta += FilteredOmega * SLOPEINT2;
		__OffsetTheta += CONSTANT2;
	}
	else if (FilteredOmega < Q15(OMEGA3))
	{
		resultA = __builtin_mpy(FilteredOmega,SLOPEFRAC3,0,0,0,0,0,0);
		asm("SAC.R A, #0, W0");
		asm("MOV W0, _Res1");
		__OffsetTheta = Res1;
		__OffsetTheta += FilteredOmega * SLOPEINT3;
		__OffsetTheta += CONSTANT3;
	}
	else if (FilteredOmega < Q15(OMEGA4))
	{
		resultA = __builtin_mpy(FilteredOmega,SLOPEFRAC4,0,0,0,0,0,0);
		asm("SAC.R A, #0, W0");
		asm("MOV W0, _Res1");
		__OffsetTheta = Res1;
		__OffsetTheta += FilteredOmega * SLOPEINT4;
		__OffsetTheta += CONSTANT4;
	}
	else if (FilteredOmega < Q15(OMEGA5))
	{
		resultA = __builtin_mpy(FilteredOmega,SLOPEFRAC5,0,0,0,0,0,0);
		asm("SAC.R A, #0, W0");
		asm("MOV W0, _Res1");
		__OffsetTheta = Res1;
		__OffsetTheta += FilteredOmega * SLOPEINT5;
		__OffsetTheta += CONSTANT5;
	}
	else
		__OffsetTheta = DEFAULTCONSTANT;

	s->Theta = s->Theta + __OffsetTheta;

	return;
}

SFRAC16 FracDiv(SFRAC16 num, SFRAC16 den)
{
	SFRAC16 FracDivResult;
	__asm__ volatile("repeat #17\n\t"
                     "divf %1,%2\n\t"
                     "mov w0,%0" : /* output */ "=g"(FracDivResult)
                                 : /* input */ "r"(num),
                                               "e"(den)
                                 : /* clobber */ "w0");

	return FracDivResult;
}

void SMCInit(SMC *s)
{
	float TemporalFloat;
    //                R * Ts
    // Fsmopos = 1 - --------
    //                  L
    //            Ts
    // Gsmopos = ----
    //            L
    // Ts = Sampling Period. If sampling at PWM, Ts = 50 us
    // R = Phase Resistance. If not provided by motor datasheet,
    //     measure phase to phase resistance with multimeter, and
    //     divide over two to get phase resistance. If 4 Ohms are
    //     measured from phase to phase, then R = 2 Ohms
    // L = Phase inductance. If not provided by motor datasheet,
    //     measure phase to phase inductance with multimeter, and
    //     divide over two to get phase inductance. If 2 mH are
    //     measured from phase to phase, then L = 1 mH
    
    TemporalFloat = (float)(1 - PhaseRes * dLoopTimeInSec / PhaseInd);
	if (TemporalFloat < 0.0)
		s->Fsmopos = Q15(0.0);
	else
		s->Fsmopos = Q15(TemporalFloat);

	TemporalFloat = (float)(dLoopTimeInSec / PhaseInd);
	if (TemporalFloat > 1.0)
		s->Gsmopos = Q15(0.99999);
	else
		s->Gsmopos = Q15(TemporalFloat);

	s->Kslide = Q15(0.6);
	s->Kslf = Q15(0.1);
	s->KslfFinal = Q15(0.02);
	return;
}

unsigned int const Angles[15]={
	8192,	4836,	2555,
	1297,	651,	326,
	163,	81,		41,
	20,		10,		5,
	3,		1,		1};

int cordic(int x, int y)
{	
	unsigned char quadrant, step;
	int currangle, newx;

	if((x >= 0) && (y >= 0)) // Quadrant 0, 0 < angle < 90
		quadrant = 0;
	else if((x < 0) && (y >= 0)) // Quadrant 1, 90 < angle < 180
	{
		quadrant = 1;
		x = -x;
	}
	else if((x < 0) && (y < 0)) // Quadrant 2, 180 < angle < 270
	{
		quadrant = 2;
		x = -x;
		y = -y;
	}
	else if((x >= 0) && (y < 0)) // Quadrant 3, 270 < angle < 360
	{
		quadrant = 3;
		y = -y;
	}
	currangle = 0;

	for(step = 0; step < 10; step++)
	{
		if(y < 0)
		{	
			newx = x - (y >> step);
			y = (x >> step) + y;
			x = newx;
			currangle += Angles[step]; 
		}
		else
		{	
			newx = x + (y >> step);
			y = -(x >> step) + y;
			x = newx;
			currangle -= Angles[step]; 
		}
	}

	switch(quadrant)
	{
		case 0:	currangle = -currangle;
				break;

		case 1:	currangle = 32768 + currangle;
				break;

		case 2: currangle = 32768 - currangle;
				break;

		case 3: currangle = currangle;
				break;
	}
	
	return currangle;
}
