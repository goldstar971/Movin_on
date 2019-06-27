/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define LED_GREEN_Pin GPIO_PIN_14
#define LED_GREEN_GPIO_Port GPIOC
#define LED_RED_Pin GPIO_PIN_15
#define LED_RED_GPIO_Port GPIOC
#define V_phase_1_Pin GPIO_PIN_0
#define V_phase_1_GPIO_Port GPIOC
#define V_phase_2_Pin GPIO_PIN_1
#define V_phase_2_GPIO_Port GPIOC
#define V_phase_3_Pin GPIO_PIN_2
#define V_phase_3_GPIO_Port GPIOC
#define Pfet_temp_Pin GPIO_PIN_3
#define Pfet_temp_GPIO_Port GPIOC
#define phase_1_curr_Pin GPIO_PIN_1
#define phase_1_curr_GPIO_Port GPIOA
#define phase_2_curr_Pin GPIO_PIN_2
#define phase_2_curr_GPIO_Port GPIOA
#define phase_3_curr_Pin GPIO_PIN_4
#define phase_3_curr_GPIO_Port GPIOA
#define V_battery_supply_Pin GPIO_PIN_5
#define V_battery_supply_GPIO_Port GPIOA
#define INL1_Pin GPIO_PIN_8
#define INL1_GPIO_Port GPIOE
#define INH1_Pin GPIO_PIN_9
#define INH1_GPIO_Port GPIOE
#define INL2_Pin GPIO_PIN_10
#define INL2_GPIO_Port GPIOE
#define INH2_Pin GPIO_PIN_11
#define INH2_GPIO_Port GPIOE
#define INL3_Pin GPIO_PIN_12
#define INL3_GPIO_Port GPIOE
#define INH3_Pin GPIO_PIN_13
#define INH3_GPIO_Port GPIOE
#define En_Gate_Pin GPIO_PIN_14
#define En_Gate_GPIO_Port GPIOE
#define Fault_Pin GPIO_PIN_15
#define Fault_GPIO_Port GPIOE
#define Wakeup_Pin GPIO_PIN_14
#define Wakeup_GPIO_Port GPIOD
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
