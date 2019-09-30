#ifndef OpenLoop_H
#define OpenLoop_H
//------------------  C API for OpenLoop routine ---------------------

typedef struct {
    short   qAngFlux;       // rotational angle of rotor flux in 1.15 format
    short   qDeltaFlux;     // change in angle for one loop

    short   qKdelta;        // Vel constant

    short   qVelMech;       // mechanical rotational velocity in 1.15 format
    } tOpenLoopParm;

void OpenLoop( void );
void InitOpenLoop(void);

EXTERN tOpenLoopParm OpenLoopParm;
#endif
