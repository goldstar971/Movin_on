/*
 * timers.h
 *
 *  Created on: Sep 17, 2019
 *      Author: matthew
 */

#ifndef TIMERS_H_
#define TIMERS_H_
#include "stm32f765xx.h"



//init software watch dog
void soft_watchdog_init(TIM_TypeDef* timx);
void kick_soft_watchdog(TIM_TypeDef* timx);
void kick_hard_watchdog(void);

#endif /* TIMERS_H_ */