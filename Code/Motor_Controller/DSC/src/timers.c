/*
 * timers.c
 *
 *  Created on: Sep 17, 2019
 *      Author: matthew
 */
#include "timers.h"

//if software watchdog reaches its limit value
//in this case, means no new speed value has been received via can in 50ms
void TIM2_IRQHandler(void){
	NVIC_SystemReset(); //reset system
}


//initalize software watch dog timer
void soft_watchdog_init(TIM_TypeDef* timx){
		timx->CR1|=0x80;//set AARP preload enable equal to true
		timx->PSC=0x215; //set to 1 MHZ
		timx->ARR|=0xffffffff; //count for relatively infinite time
		timx->CCR1=0xc350; // trigger interrupt after 50 ms
		timx->EGR|=0x1; //generate update event to load registers
		timx->DIER|=0x2; //enable cc1 event interrupt
}

void kick_hard_watchdog(void){
	IWDG->KR|=0xAAAA;
}

void kick_soft_watchdog(TIM_TypeDef* timx){
	 	timx->EGR|=0x1; //reset software watchdog timer by triggering update event


}
//configure watchdog for 12ms reset (from original code).  Probably too long because we are doing
//far less (was because time out threads ran every 10ms)
//10ms of inaction after a fault or hangup  will not cause any sort of safety issue.
void init_watchdog(void){
	IWDG->KR|=0x00005555; //enable write to normally write protected registers
	IWDG->PR|=0x000; //set divider for 4
	IWDG->RLR=140; //watchdog timer activates after 16.25ms at typical frequency of 32khz, which allows for operating condition
	//variation in LPW timer frequency (17khz-47khz)
	IWDG->KR|=0xCCCC; // start watch dog
}