/*
 * gpio.h
 *
 *  Created on: Oct 16, 2019
 *      Author: matthew
 */



#include "stm32f765xx.h"
#ifndef gpio_H_
#define gpio_H_
void gpio_init(void);
void turn_on_LED(char led[]);
void turn_off_LED(char led[]);


#endif /* gpio_H_ */
