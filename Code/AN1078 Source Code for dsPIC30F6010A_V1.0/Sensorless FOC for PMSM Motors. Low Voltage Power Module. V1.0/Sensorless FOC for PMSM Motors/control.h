#ifndef Control_H
#define Control_H
//------------------  C API for Control routine ---------------------

typedef struct {
    short   qVelRef;    // Reference velocity
    short   qVdRef;     // Vd flux reference value
    short   qVqRef;     // Vq torque reference value
    } tCtrlParm;

tCtrlParm CtrlParm;
#endif



