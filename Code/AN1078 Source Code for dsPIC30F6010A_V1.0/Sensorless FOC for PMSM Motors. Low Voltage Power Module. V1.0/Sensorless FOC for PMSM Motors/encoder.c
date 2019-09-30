// Scaling for encoder routines

#include "general.h"
#include "Parms.h"
#include "Encoder.h"

/**********************************************************
InitEncoderScaling

Initialize scaling constants for encoder rotuines.

    Arguments:
        CntsPerRev: Encoder counts per revolution from quadrature
        ScalingSpeedInRPS: Rev per sec used for basic velocity scaling
        IrpPerCalc: Number of CalcVelIrp interrupts per velocity calculation
        VelIrpPeriod: Period between VelCalcIrp interrupts (in Sec)

For CalcAng:
    Runtime equation:
    qMechAng = qKang * (POSCNT*4) / 2^Nang

    Scaling equations:
        qKang = (2^15)*(2^Nang)/CntsPerRev.

For CalcVelIrp, CalcVel:
    Runtime equation:
        qMechVel = qKvel * (2^15 * Delta / 2^Nvel)

    Scaling equations:
        fVelCalcPeriod = fVelIrpPeriod * iIrpPerCalc
        MaxCntRate = CntsPerRev * ScaleMechRPS
        MaxDeltaCnt = fVelCalcPeriod * MaxCntRate
        qKvel = (2^15)*(2^Nvel)/MaxDeltaCnt
**********************************************************/

bool InitEncoderScaling( void )
{
    float fVelCalcPeriod, fMaxCntRate;
    long  MaxDeltaCnt;
    long  K;

    EncoderParm.iCntsPerRev = MotorParm.iCntsPerRev;

    K = 32768;
    K *= 1 << Nang;
    EncoderParm.qKang = K/EncoderParm.iCntsPerRev;


    EncoderParm.iIrpPerCalc = MotorParm.iIrpPerCalc;
    fVelCalcPeriod = MotorParm.fVelIrpPeriod * MotorParm.iIrpPerCalc;
    fMaxCntRate = EncoderParm.iCntsPerRev * MotorParm.fScaleMechRPS;
    MaxDeltaCnt = fVelCalcPeriod * fMaxCntRate;

    // qKvel = (2^15)*(2^Nvel)/MaxDeltaCnt
    K = 32768;
    K *= 1 << Nvel;
    K /= MaxDeltaCnt;
    if( K >= 32768 )
        // Error
        return True;
    EncoderParm.qKvel = K;

    // Initialize private variables used by CalcVelIrp.
    InitCalcVel();
    return False;
}
