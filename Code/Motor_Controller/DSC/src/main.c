/*
 * main.c

 *
 *  Created on: Sep 14, 2019
 *      Author: matthew
 */
#include <float.h>
#include <stdlib.h>
#include <math.h>
#include "CAN.h"
#include "confgenerator.h"
#include "stm32f765xx.h"
#include "timers.h"
#include "utils.h"
#include "Sys_funcs.h"
#include "mcpwm_foc.h"
#include "conf_general.h"
#include "GPIO.h"


int handshaking_complete[4];
int run;


int main(void){

//initialize system clock
System_Clock_Init();
//initalize CAN
init_can(CAN1);
//init GPIO
gpio_init();
//enable interrupts
init_interupts();
//get default configurations
mc_configuration mcconf;
confgenerator_set_defaults_mcconf(&mcconf);

//Do can handshaking here
while(!(handshaking_complete[0]&handshaking_complete[1]&handshaking_complete[2]&handshaking_complete[3])){;;}


//Wait until minimum speed reached and calibration locked in
mcpwm_foc_init(&mcconf);
//main loop is just changing speed based on recieved can messages
//watch dog timer is kicked in CAN interrupts (basically if not reciving speed messages, shut down)
while(1){
//while above minimum speed
	while(1){
			//if not started, start motor pwm
	//	mcpwm_foc_set_pid_speed();
		speed_control_and_open_loop();
		//kick watch dog in CAN interrupt)
		}
	}
}
