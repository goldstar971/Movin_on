/*
 * CAN.c
 *
 *  Created on: Sep 17, 2019
 *      Author: matthew
 */
#include "CAN.h"
#include "stm32f765xx.h"

extern int handshaking_complete[];
extern
void CAN1_RX0_IRQHandler(void){



}



void init_can(CAN_TypeDef * CANx){
	CANx->MCR&=~CAN_MCR_SLEEP;//wake from sleep
	CANx->MCR|= CAN_MCR_INRQ; //request to enter initialization mode
	while(CANx->MSR^CAN_MSR_INAK){;}//wait until hardware enters initialization mode
	CANx->BTR &= ~0x7F03FF;
	CANx->BTR |= 0x1e0001; //set for 1 Mb/s
	CANx->MCR&=~CAN_MCR_INRQ;
	while(CANx->MSR&CAN_MSR_INAK){;}//wait until normal mode

}



void can_transmit(CAN_Message *msg);


