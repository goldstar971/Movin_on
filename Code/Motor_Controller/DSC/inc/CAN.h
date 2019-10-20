/*
 * CAN.h
 *
 *  Created on: Sep 17, 2019
 *      Author: matthew
 */

#ifndef CAN_H_
#define CAN_H_
typedef struct
{
	uint8_t data[8];
	int identifier;
	char DCL;
}CAN_Message;


void CAN1_RX0_IRQHandler(void);
void init_can(CAN_TypeDef * CANx);
void can_transmit(CAN_Message *msg);





#endif /* CAN_H_ */
