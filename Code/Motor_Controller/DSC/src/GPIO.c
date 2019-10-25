/*
 * GPIO.c
 *
 *  Created on: Oct 16, 2019
 *      Author: matthew
 */
#include <GPIO.h>
#include <string.h>

void gpio_init(void){
	//configure pin modes
	GPIOA->MODER|=0x28000F3C;
	GPIOB->MODER|=0xA00000;
	GPIOC->MODER|=0x500000FF;
	GPIOE->MODER|=0x1AAA0000;
	//set fault as pullup
	GPIOE->PUPDR|=0x40000000;
	//configure CAN pins
	GPIOA->AFR[2]|=0x9900;
	//configure i2c pins
	GPIOB->AFR[2]|=0x4400;
	//configure tim1 ch outputs
	GPIOE->AFR[2]|=0x5550000;
}
void turn_on_LED(char led[]){
	if (strcmp(led,"red")){
		GPIOE->ODR|=0x4000;
	}
	else{
		GPIOE->ODR|=0x8000;
	}

}
void turn_off_LED(char led[]){
	if (strcmp(led,"red")){
		GPIOE->ODR&=~0x4000;
	}
	else{
		GPIOE->ODR&=~0x8000;
	}

}
