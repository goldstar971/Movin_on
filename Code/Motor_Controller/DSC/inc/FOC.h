/*
 * PWM.h
 *
 *  Created on: Sep 17, 2019
 *      Author: matthew
 */

#ifndef FOC_H_
#define FOC_H_


void init_FOC(void);
void deinit_FOC(void);
void brake(float brake_strength);

#endif /* FOC_H_ */
