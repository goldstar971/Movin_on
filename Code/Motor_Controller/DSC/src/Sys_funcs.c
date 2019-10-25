/*
 * Sys_funcs.c
 *
 *  Created on: Oct 24, 2019
 *      Author: matthew
 */
#include "Sys_funcs.h"



//******************************************************************************************
// Switch the PLL source from MSI to HSI, and select the PLL as SYSCLK source.
//******************************************************************************************
void System_Clock_Init(void){



	// To correctly read data from FLASH memory, the number of wait states (LATENCY)
  // must be correctly programmed according to the frequency of the CPU clock
  // (HCLK) and the supply voltage of the device.
	FLASH->ACR &= ~FLASH_ACR_LATENCY;
	FLASH->ACR |=  FLASH_ACR_LATENCY_7WS;

	// Enable the Internal High Speed oscillator (HSI
	RCC->CR |= RCC_CR_HSION;
	while((RCC->CR & RCC_CR_HSIRDY) == 0);
	// Adjusts the Internal High Speed oscillator (HSI) calibration value
	// RC oscillator frequencies are factory calibrated by ST for 1 % accuracy at 25oC

	RCC->CR    &= ~RCC_CR_PLLON;
	while((RCC->CR & RCC_CR_PLLRDY) == RCC_CR_PLLRDY);

	// Select clock source to PLL
	RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLSRC;
	RCC->PLLCFGR |= RCC_PLLCFGR_PLLSRC_HSI; // 00 = No clock, 01 = MSI, 10 = HSI, 11 = HSE

	// Make PLL as 216 MHz
	// f(VCO clock) = f(PLL clock input) * (PLLN / PLLM) = 16MHz * 27/1 = 432 MHz
	// f(PLL_P) = f(VCO clock) / PLLP = 432MHz/2 = 216MHz
	RCC->PLLCFGR = (RCC->PLLCFGR & ~RCC_PLLCFGR_PLLN) | 27U << 6;
	RCC->PLLCFGR = (RCC->PLLCFGR & ~RCC_PLLCFGR_PLLM) | RCC_PLLCFGR_PLLM_0 ; // 000: PLLM = 1, 001: PLLM = 2, 010: PLLM = 3, 011: PLLM = 4, 100: PLLM = 5, 101: PLLM = 6, 110: PLLM = 7, 111: PLLM = 8

	RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLP;



	// Select PLL selected as system clock
	RCC->CFGR &= ~RCC_CFGR_SW;
	RCC->CFGR |= RCC_CFGR_SW_PLL; // 00: MSI, 01:HSI, 10: HSE, 11: PLL

	// Wait until System Clock has been selected
	while ((RCC->CFGR & RCC_CFGR_SWS) != RCC_CFGR_SWS_PLL);

	//enable PLL
	RCC->CR   |= RCC_CR_PLLON;
		while((RCC->CR & RCC_CR_PLLRDY) == 0);

	// The maximum frequency of the AHB is 216mhz, the APB1 is 45 mhz and the APB2 is 90 MHz.
	RCC->CFGR &= ~RCC_CFGR_HPRE;  // AHB prescaler = 1; SYSCLK not divided
	RCC->CFGR &= ~RCC_CFGR_PPRE1; // APB high-speed prescaler (APB1) = 8,
	RCC->CFGR |=RCC_CFGR_PPRE1_DIV8;
	RCC->CFGR &= ~RCC_CFGR_PPRE2; // APB high-speed prescaler (APB2) = 4,
	RCC->CFGR |=RCC_CFGR_PPRE2_DIV4;
	RCC->AHB1ENR|=(0x17); //enable GPIO banks ABCE's clocks
	RCC->AHB3ENR|=0x2400801;//enable I2C2 and CAN1, TIM2 and watchdog clocks
	RCC->APB2ENR|=0x82; //enable clocks for ADC1, TIM1 and TIM8

}

void init_interupts(void){

	NVIC_SetPriority(CAN1_RX0_IRQn,0);
	NVIC_EnableIRQ(CAN1_RX0_IRQn);
	NVIC_SetPriority(DMA2_Stream4_IRQn,2);
	NVIC_EnableIRQ(DMA2_Stream4_IRQn);
	NVIC_SetPriority(TIM8_CC_IRQn,3);
	NVIC_EnableIRQ(TIM8_CC_IRQn);
	NVIC_SetPriority(TIM2_IRQn,1);
	NVIC_EnableIRQ(TIM2_IRQn);

}