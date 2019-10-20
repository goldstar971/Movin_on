/*
 * main.c
 *
 *  Created on: Sep 14, 2019
 *      Author: matthew
 */
#include "CAN.h"
#include "main.h"
#include "stm32f765xx.h"
#include "sys_clock.h"
#include "timers.h"
#include "utils.h"
#include "float.h"
#include <stdlib.h>
#include <math.h>
#include "mcpwm_foc.h"



int main(void){

//initialize system clock
System_Clock_Init();
//initalize CAN
init_can();
//init GPIO
gpio_init();

//Do can handshaking here

//Wait until minimum speed reached and calibration locked in
mcpwm_foc_init();
while(1){
//while above minimum speed
	while(1){
			//if not started, start motor pwm
		speed_control_and_open_loop();
		}
		//


	}
}

