#include "general.h"
#include "Park.h"
#include "SVGen.h"
#include "encoder.h"
#include "SnapShot.h"
#include "control.h"
#include "curmodel.h"
#include "pi.h"

extern tPIParm PIParmD;
extern tPIParm PIParmQ;

extern	union   {
            long  Long;
            WORD  Word[2];
            short Short[2];
            BYTE  Byte[4];
            } DataUnion;        
//---------------------------------------------------------------------
void initSnap(void)
{
        iNumSnap = 0;
        pSnap = Snap;
        while( pSnap < Snap+SNAPSIZE )
            *pSnap++ = 0;
        pSnap = Snap;
        
        // init sample counts for snapshot
        iSnapSkipCnt = 0;
        iChgDelayCnt = 0;
        
        // Initialize parameters for snap-shot feature
        iSnapSkip = dSnapSkip;
        iChgDelay = iSnapSkip*10;
}        
//---------------------------------------------------------------------
// Accumulate Snap info
bool DoSnap( void)
{

    iSnapSkipCnt--;
    if( iSnapSkipCnt <= 0 )
        {
        iSnapSkipCnt = iSnapSkip;

        //if( SnapShort(ParkParm.qAngle) )
          //  return True;
        
        if( SnapShort(PDC1 << 5) )
            return True;
        
        // must be number of varaibles +1
        iSnapCols = 2;
        
        //SnapShort(ParkParm.qIa );
        //SnapShort(ParkParm.qIb * 5);

        //SnapShort(ParkParm.qIalpha );
        //SnapShort(ParkParm.qIbeta );
        
        //DataUnion.Long = CurModelParm.qdImag;
        //SnapShort(DataUnion.Short[1]);  

        //SnapShort(ParkParm.qId);
        //SnapShort(ParkParm.qIq);

        DataUnion.Long = PIParmD.qdSum;
        //SnapShort(DataUnion.Short[1]); 
        //SnapShort(PIParmD.qInRef);
        //SnapShort(PIParmD.qInMeas);
        //SnapShort(PIParmD.qOut);

        DataUnion.Long = PIParmQ.qdSum;
        //SnapShort(DataUnion.Short[1]); 
        //SnapShort(PIParmQ.qInRef);
        //SnapShort(PIParmQ.qInMeas);
        //SnapShort(PIParmQ.qOut);

        //SnapShort(CtrlParm.qVdRef);
        //SnapShort(CtrlParm.qVqRef);
        //SnapShort(CtrlParm.qVelRef);
        
        //SnapShort(ParkParm.qVd);
        //SnapShort(ParkParm.qVq);

        //SnapShort(ParkParm.qValpha);
        //SnapShort(ParkParm.qVbeta);

        //SnapShort(SVGenParm.qVr1);
        //SnapShort(SVGenParm.qVr2);
        //SnapShort(SVGenParm.qVr3);
        
        //SnapShort(PDC1 * 32);
        //SnapShort(PDC2 * 64);
        //SnapShort(PDC3 * 64);

        //SnapShort(CurModelParm.qVelFlux);
        //SnapShort(CurModelParm.qAngFlux);       
        //SnapShort(CurModelParm.qVelSlip);       
        //SnapShort(EncoderParm.qVelMech);
        //SnapShort(EncoderParm.iDeltaCnt*1000);
        
        //SnapShort(ParkParm.qAngle);
        //SnapShort(ParkParm.qSin);
        //SnapShort(ParkParm.qCos);  


        }
    return False;
}

//---------------------------------------------------------------------
// Save a Short as Snap info 
bool SnapShort( short iX )
{
    if( iNumSnap == SNAPSIZE )
        return True;

    *pSnap++ = iX;
    iNumSnap++;
    return False;
}

