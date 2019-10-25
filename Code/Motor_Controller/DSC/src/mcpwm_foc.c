/*
	Copyright 2016 - 2019 Benjamin Vedder	benjamin@vedder.se

	This file is part of the VESC firmware.

	The VESC firmware is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    The VESC firmware is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    */

#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif

#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "mcpwm_foc.h"
#include "utils.h"
#include <GPIO.h>
#include "stm32f765xx.h"
#include "hw_75_300.h"
#include "conf_general.h"
#include "timers.h"

// Private types
typedef struct {
	float id_target;
	float iq_target;
	float max_duty;
	float duty_now;
	float phase;
	float i_alpha;
	float i_beta;
	float i_abs;
	float i_abs_filter;
	float i_bus;
	float v_bus;
	float v_alpha;
	float v_beta;
	float mod_d;
	float mod_q;
	float id;
	float iq;
	float id_filter;
	float iq_filter;
	float vd;
	float vq;
	float vd_int;
	float vq_int;
	uint32_t svm_sector;
} motor_state_t;

typedef struct {
	int sample_num;
	float avg_current_tot;
	float avg_voltage_tot;
	bool measure_inductance_now;
	float measure_inductance_duty;
} mc_sample_t;

// Private variables
static volatile mc_configuration *m_conf;
static volatile mc_state m_state;
static volatile mc_control_mode m_control_mode;
static volatile motor_state_t m_motor_state;
static volatile int m_curr0_sum;
static volatile int m_curr1_sum;
static volatile int m_curr_samples;
static volatile int m_curr0_offset;
static volatile int m_curr1_offset;
static volatile int m_curr_unbalance;
static volatile bool m_phase_override;
static volatile float m_phase_now_override;
static volatile float m_duty_cycle_set;
static volatile float m_id_set;
static volatile float m_iq_set;
static volatile float m_openloop_speed;
static volatile float m_openloop_phase;
static volatile bool m_dccal_done;
static volatile bool m_output_on;
static volatile float m_pos_pid_set;
static volatile float m_speed_pid_set_rpm;
static volatile float m_phase_now_observer;
static volatile float m_phase_now_observer_override;
static volatile bool m_phase_observer_override;
static volatile float m_phase_now_encoder;
static volatile float m_phase_now_encoder_no_index;
static volatile float m_observer_x1;
static volatile float m_observer_x2;
static volatile float m_pll_phase;
static volatile float m_pll_speed;
static volatile mc_sample_t m_samples;
static volatile int m_tachometer;
static volatile int m_tachometer_abs;
static volatile float m_last_adc_isr_duration;
static volatile float m_pos_pid_now;
static volatile bool m_init_done = false;
static volatile float m_gamma_now;
static volatile int m_curr2_sum;
static volatile int m_curr2_offset;


//global variables
volatile int ADC_curr_norm_value[3];
volatile uint16_t ADC_Value[HW_ADC_CHANNELS];


// Private functions
static void do_dc_cal(void);
void observer_update(float v_alpha, float v_beta, float i_alpha, float i_beta,
		float dt, volatile float *x1, volatile float *x2, volatile float *phase);
static void pll_run(float phase, float dt, volatile float *phase_var,
		volatile float *speed_var);
static void control_current(volatile motor_state_t *state_m, float dt);
static void svm(float alpha, float beta, uint32_t PWMHalfPeriod,
		uint32_t* tAout, uint32_t* tBout, uint32_t* tCout, uint32_t *svm_sector);
static void run_pid_control_speed(float dt);
static void stop_pwm_hw(void);
static void start_pwm_hw(void);




// Macros

#define TIMER_UPDATE_DUTY(duty1, duty2, duty3) \
		TIM1->CR1 |= TIM_CR1_UDIS; \
		TIM1->CCR1 = duty1; \
		TIM1->CCR2 = duty2; \
		TIM1->CCR3 = duty3; \
		TIM1->CR1 &= ~TIM_CR1_UDIS;


#define TIMER_UPDATE_SAMP(samp) \
		TIM8->CCR1 = samp;

#define TIMER_UPDATE_SAMP_TOP(samp, top) \
		TIM1->CR1 |= TIM_CR1_UDIS; \
		TIM8->CR1 |= TIM_CR1_UDIS; \
		TIM1->ARR = top; \
		TIM8->CCR1 = samp; \
		TIM1->CR1 &= ~TIM_CR1_UDIS; \
		TIM8->CR1 &= ~TIM_CR1_UDIS;


#define TIMER_UPDATE_DUTY_SAMP(duty1, duty2, duty3, samp) \
		TIM1->CR1 |= TIM_CR1_UDIS; \
		TIM8->CR1 |= TIM_CR1_UDIS; \
		TIM1->CCR1 = duty1; \
		TIM1->CCR2 = duty2; \
		TIM1->CCR3 = duty3; \
		TIM8->CCR1 = samp; \
		TIM1->CR1 &= ~TIM_CR1_UDIS; \
		TIM8->CR1 &= ~TIM_CR1_UDIS;


void mcpwm_foc_init(volatile mc_configuration *configuration) {


	m_init_done = false;


	m_conf = configuration;

	// Initialize variables
	m_state = MC_STATE_OFF;
	m_control_mode = CONTROL_MODE_NONE;
	m_curr0_sum = 0;
	m_curr1_sum = 0;
	m_curr_unbalance = 0.0;
	m_curr_samples = 0;
	m_dccal_done = false;
	m_phase_override = false;
	m_phase_now_override = 0.0;
	m_duty_cycle_set = 0.0;
	m_id_set = 0.0;
	m_iq_set = 0.0;
	m_openloop_speed = 0.0;
	m_openloop_phase = 0.0;
	m_output_on = false;
	m_pos_pid_set = 0.0;
	m_speed_pid_set_rpm = 0.0;
	m_phase_now_observer = 0.0;
	m_phase_now_observer_override = 0.0;
	m_phase_observer_override = false;
	m_phase_now_encoder = 0.0;
	m_phase_now_encoder_no_index = 0.0;
	m_observer_x1 = 0.0;
	m_observer_x2 = 0.0;
	m_pll_phase = 0.0;
	m_pll_speed = 0.0;
	m_tachometer = 0;
	m_tachometer_abs = 0;
	m_last_adc_isr_duration = 0;
	m_pos_pid_now = 0.0;
	m_gamma_now = 0.0;
	memset((void*)&m_motor_state, 0, sizeof(motor_state_t));
	memset((void*)&m_samples, 0, sizeof(mc_sample_t));


	m_curr2_sum = 0;



	TIM1->CNT = 0;
	TIM8->CNT = 0;

	TIM1->CR1|=0x20; //set to center aligned mode 1 (events only triggered on down counting)
	//set idle states, set output trigger to be update event
	TIM1->CR2|=0x3F20;
	TIM1->ARR|=0x2A30; //set period for 20khz-> 216mhz/20khz=10800
	//configure channels 1,2,3 in PWM mode
	TIM1->CCMR1|=0x6868;
	TIM1->CCMR2|=0x68;
	TIM1->CCER|=0x555;
	//initalize duty cycle
	TIM1->CCR1|=TIM1->ARR/2;
	TIM1->CCR2|=TIM1->ARR/2;
	TIM1->CCR3|=TIM1->ARR/2;
	//Break, dead time, lock configuration
	TIM1->BDTR|=0x2C87;
	TIM1->CR2|=0x1;//preload capture and control regs
	TIM1->CR1|=0x80;//enable Auto-reload preload
	//enable master slave mode : timer synchronization
	TIM1->SMCR|=0x80;
	TIM1->EGR|=0x1;//load all registers with their values

	/*
	* ADC!
	 */
	// DMA for the ADC
	//configure for channel zero with single peripheral and memory burst
	//no double buffer mode, priority level high, peripheralINC mode disabled,
	//peripheral and memory data size as half word, Memory increment enabled
	//circular mode, peripheral to memory data direction,transfer complete interrupt
	//enabled.

	//give the address of the peripheral data register and the memory to write to
	//as well as the number of data items to transfer
	DMA2_Stream4->CR|=0x00022D10;
	DMA2_Stream4->NDTR|=HW_ADC_CHANNELS;
	DMA2_Stream4->PAR=(uint32_t)&ADC->CDR;
	DMA2_Stream4->M0AR=(uint32_t)&ADC_Value;
	//disable fifo mode/enable direct mode
	DMA2_Stream4->FCR&=~0x4;
	DMA2_Stream4->CR|=0x1; //enable stream

	//common init
	//enable internal voltage and temperature sensor
	//triple regular simultaneous mode, Dma access mode 1, 5 ADCclk cycles between sampling phases.
	//DMA requests after last transfer enabled
	ADC->CCR|=0x806016;
	// Channel-specific settings
	//set to scan mode with 12bit resolution
	ADC1->CR1|=0x100;
	//continous conversion mode disabled, external triggered on falling edge
	//External trigger is T8_TRG0(2)
	//DataAlign is right
	ADC1->CR2|=0x2800000;
	//same initization for ADC2 and ADC3, as for ADC1 except no triggers
	ADC2->CR1|=0x100;
	ADC3->CR1|=0x100;


	//setup channel groups for ADC
	ADC1->SQR1|=(HW_ADC_NBR_CONV-1)<<20;
	ADC2->SQR1|=(HW_ADC_NBR_CONV-1)<<20;
	ADC3->SQR1|=(HW_ADC_NBR_CONV-1)<<20;
	ADC3->SQR3|=((14<<15)|(5<<10)|(3<<5)|12);
	ADC2->SQR3|=((15<<15)|(13<<10)|(2<<5)|11);
	ADC1->SQR3|=((17<<15)|(18<<10)|(1<<5)|10);


	// Enable ADC1, ADC2, ADC3
	ADC1->CR1|=0x1;
	ADC2->CR1|=0x1;
	ADC3->CR1|=0x1;

	// ------------- Timer8 for ADC sampling ------------- //

	//set output mode pwm1 upcounting, period of 0xffff, edge aligned
	TIM8->CCMR1|=0x68;
	TIM8->CR1|=0x40; //ARR preload enable
	//enable ch1 output and set output polarity to high
	TIM8->CCER|=0x1;
	TIM8->CCR1|=500;
	//set pulse upon TRG02 when cnt=ccr1
	//set OC and ocn idle to high
	TIM8->CR2|=0x400300;
	// PWM outputs have to be enabled in order to trigger ADC on CCx
	TIM8->BDTR|=0x8000;
	//set slave mode as reset with ITR0 as input trigger
	TIM8->SMCR|=0x04;
	TIM1->EGR|=0x1;//load all registers with their values

	// Enable TIM1 and TIM8
	TIM1->CR1|=0x01;
	TIM8->CR1|=0x01;

	//enable main outputs on TIM1
	TIM1->BDTR|=0x8000;

	// ADC sampling locations
	stop_pwm_hw();

	// Sample intervals. For now they are fixed with voltage samples in the center of V7
	// and current samples in the center of V0
	TIMER_UPDATE_SAMP(MCPWM_FOC_CURRENT_SAMP_OFFSET);

	// Enable CC1 interrupt, which will be fired in V0 and V7
	TIM8->DIER|=0x2;


	//Send Engate high
	GPIOE->ODR|=0x4000;
	// Calibrate current offset
	do_dc_cal();

	m_init_done = true;
}



bool mcpwm_foc_init_done(void) {
	return m_init_done;
}

void mcpwm_foc_set_configuration(volatile mc_configuration *configuration) {
	m_conf = configuration;

	m_control_mode = CONTROL_MODE_NONE;
	m_state = MC_STATE_OFF;
	stop_pwm_hw();
	uint32_t top = SYSTEM_CORE_CLOCK / (int)m_conf->foc_f_sw;
	TIMER_UPDATE_SAMP_TOP(MCPWM_FOC_CURRENT_SAMP_OFFSET, top);
}

mc_state mcpwm_foc_get_state(void) {
	return m_state;
}

bool mcpwm_foc_is_dccal_done(void) {
	return m_dccal_done;
}

/**
 * Switch off all FETs.
 */
void mcpwm_foc_stop_pwm(void) {
	mcpwm_foc_set_current(0.0);
}



/**
 * Use PID rpm control. Note that this value has to be multiplied by half of
 * the number of motor poles.
 *
 * @param rpm
 * The electrical RPM goal value to use.
 */
void mcpwm_foc_set_pid_speed(float rpm) {
	m_control_mode = CONTROL_MODE_SPEED;
	m_speed_pid_set_rpm = rpm;

	if (m_state != MC_STATE_RUNNING) {
		m_state = MC_STATE_RUNNING;
	}
}

/*
 * Brake the motor with a desired current. Absolute values less than
 * conf->cc_min_current will release the motor.
 *
 * @param current
 * The current to use. Positive and negative values give the same effect.
 */
void mcpwm_foc_set_brake_current(float current) {
	if (fabsf(current) < m_conf->cc_min_current) {
		m_control_mode = CONTROL_MODE_NONE;
		m_state = MC_STATE_OFF;
		stop_pwm_hw();
		return;
	}

	m_control_mode = CONTROL_MODE_CURRENT_BRAKE;
	m_iq_set = current;

	if (m_state != MC_STATE_RUNNING) {
		m_state = MC_STATE_RUNNING;
	}
}

/**
 * Apply a fixed static current vector in open loop to emulate an electric
 * handbrake.
 *
 * @param current
 * The brake current to use.
 */
void mcpwm_foc_set_handbrake(float current) {
	if (fabsf(current) < m_conf->cc_min_current) {
		m_control_mode = CONTROL_MODE_NONE;
		m_state = MC_STATE_OFF;
		stop_pwm_hw();
		return;
	}

	m_control_mode = CONTROL_MODE_HANDBRAKE;
	m_iq_set = current;

	if (m_state != MC_STATE_RUNNING) {
		m_state = MC_STATE_RUNNING;
	}
}

/**
 * Produce an openloop rotating current.
 *
 * @param current
 * The current to use.
 *
 * @param rpm
 * The RPM to use.
 */
void mcpwm_foc_set_openloop(float current, float rpm) {
	if (fabsf(current) < m_conf->cc_min_current) {
		m_control_mode = CONTROL_MODE_NONE;
		m_state = MC_STATE_OFF;
		stop_pwm_hw();
		return;
	}

	utils_truncate_number(&current, -m_conf->l_current_max * m_conf->l_current_max_scale,
			m_conf->l_current_max * m_conf->l_current_max_scale);

	m_control_mode = CONTROL_MODE_OPENLOOP;
	m_iq_set = current;
	m_openloop_speed = rpm * ((2.0 * M_PI) / 60.0);

	if (m_state != MC_STATE_RUNNING) {
		m_state = MC_STATE_RUNNING;
	}
}

/**
 * Produce an openloop current at a fixed phase.
 *
 * @param current
 * The current to use.
 *
 * @param phase
 * The phase to use in degrees, range [0.0 360.0]
 */
void mcpwm_foc_set_openloop_phase(float current, float phase) {
	if (fabsf(current) < m_conf->cc_min_current) {
		m_control_mode = CONTROL_MODE_NONE;
		m_state = MC_STATE_OFF;
		stop_pwm_hw();
		return;
	}

	utils_truncate_number(&current, -m_conf->l_current_max * m_conf->l_current_max_scale,
			m_conf->l_current_max * m_conf->l_current_max_scale);

	m_control_mode = CONTROL_MODE_OPENLOOP_PHASE;
	m_iq_set = current;

	m_openloop_phase = phase * M_PI / 180.0;
	utils_norm_angle_rad((float*)&m_openloop_phase);

	if (m_state != MC_STATE_RUNNING) {
		m_state = MC_STATE_RUNNING;
	}
}

/**
 * Set current offsets values,
 * this is used by the virtual motor to set the previously saved offsets back,
 * when it is disconnected
 */
void mcpwm_foc_set_current_offsets(volatile int curr0_offset,
		volatile int curr1_offset,
		volatile int curr2_offset){
	m_curr0_offset = curr0_offset;
	m_curr1_offset = curr1_offset;
	m_curr2_offset = curr2_offset;
}

/**
 * Produce an openloop rotating voltage.
 *
 * @param dutyCycle
 * The duty cycle to use.
 *
 * @param rpm
 * The RPM to use.
 */
void mcpwm_foc_set_openloop_duty(float dutyCycle, float rpm) {
	m_control_mode = CONTROL_MODE_OPENLOOP_DUTY;
	m_duty_cycle_set = dutyCycle;
	m_openloop_speed = rpm * ((2.0 * M_PI) / 60.0);

	if (m_state != MC_STATE_RUNNING) {
		m_state = MC_STATE_RUNNING;
	}
}

/**
 * Produce an openloop voltage at a fixed phase.
 *
 * @param dutyCycle
 * The duty cycle to use.
 *
 * @param phase
 * The phase to use in degrees, range [0.0 360.0]
 */
void mcpwm_foc_set_openloop_duty_phase(float dutyCycle, float phase) {
	m_control_mode = CONTROL_MODE_OPENLOOP_DUTY_PHASE;
	m_duty_cycle_set = dutyCycle;
	m_openloop_phase = phase * M_PI / 180.0;
	utils_norm_angle_rad((float*)&m_openloop_phase);

	if (m_state != MC_STATE_RUNNING) {
		m_state = MC_STATE_RUNNING;
	}
}

float mcpwm_foc_get_duty_cycle_set(void) {
	return m_duty_cycle_set;
}

float mcpwm_foc_get_duty_cycle_now(void) {
	return m_motor_state.duty_now;
}

float mcpwm_foc_get_pid_pos_set(void) {
	return m_pos_pid_set;
}

float mcpwm_foc_get_pid_pos_now(void) {
	return m_pos_pid_now;
}

/**
 * Get the current switching frequency.
 *
 * @return
 * The switching frequency in Hz.
 */
float mcpwm_foc_get_switching_frequency_now(void) {
	return m_conf->foc_f_sw;
}

/**
 * Get the current sampling frequency.
 *
 * @return
 * The sampling frequency in Hz.
 */
float mcpwm_foc_get_sampling_frequency_now(void) {
#ifdef HW_HAS_PHASE_SHUNTS
	if (m_conf->foc_sample_v0_v7) {
		return m_conf->foc_f_sw;
	} else {
		return m_conf->foc_f_sw / 2.0;
	}
#else
	return m_conf->foc_f_sw / 2.0;
#endif
}


/**
 * Calculate the current RPM of the motor. This is a signed value and the sign
 * depends on the direction the motor is rotating in. Note that this value has
 * to be divided by half the number of motor poles.
 *
 * @return
 * The RPM value.
 */
float mcpwm_foc_get_rpm(void) {
	return m_pll_speed / ((2.0 * M_PI) / 60.0);
}

/**
 * Get the motor current. The sign of this value will
 * represent whether the motor is drawing (positive) or generating
 * (negative) current. This is the q-axis current which produces torque.
 *
 * @return
 * The motor current.
 */
float mcpwm_foc_get_tot_current(void) {
	return SIGN(m_motor_state.vq) * m_motor_state.iq;
}

/**
 * Get the filtered motor current. The sign of this value will
 * represent whether the motor is drawing (positive) or generating
 * (negative) current. This is the q-axis current which produces torque.
 *
 * @return
 * The filtered motor current.
 */
float mcpwm_foc_get_tot_current_filtered(void) {
	return SIGN(m_motor_state.vq) * m_motor_state.iq_filter;
}

/**
 * Get the magnitude of the motor current, which includes both the
 * D and Q axis.
 *
 * @return
 * The magnitude of the motor current.
 */
float mcpwm_foc_get_abs_motor_current(void) {
	return m_motor_state.i_abs;
}

/**
 * Get the magnitude of the motor current unbalance
 *
 * @return
 * The magnitude of the phase currents unbalance.
 */
float mcpwm_foc_get_abs_motor_current_unbalance(void) {
	return (float)(m_curr_unbalance) * FAC_CURRENT;
}

/**
 * Get the magnitude of the motor voltage.
 *
 * @return
 * The magnitude of the motor voltage.
 */
float mcpwm_foc_get_abs_motor_voltage(void) {
	const float vd_tmp = m_motor_state.vd;
	const float vq_tmp = m_motor_state.vq;
	return sqrtf(SQ(vd_tmp) + SQ(vq_tmp));
}

/**
 * Get the filtered magnitude of the motor current, which includes both the
 * D and Q axis.
 *
 * @return
 * The magnitude of the motor current.
 */
float mcpwm_foc_get_abs_motor_current_filtered(void) {
	return m_motor_state.i_abs_filter;
}

/**
 * Get the motor current. The sign of this value represents the direction
 * in which the motor generates torque.
 *
 * @return
 * The motor current.
 */
float mcpwm_foc_get_tot_current_directional(void) {
	return m_motor_state.iq;
}

/**
 * Get the filtered motor current. The sign of this value represents the
 * direction in which the motor generates torque.
 *
 * @return
 * The filtered motor current.
 */
float mcpwm_foc_get_tot_current_directional_filtered(void) {
	return m_motor_state.iq_filter;
}

/**
 * Get the direct axis motor current.
 *
 * @return
 * The D axis current.
 */
float mcpwm_foc_get_id(void) {
	return m_motor_state.id;
}

/**
 * Get the quadrature axis motor current.
 *
 * @return
 * The Q axis current.
 */
float mcpwm_foc_get_iq(void) {
	return m_motor_state.iq;
}

/**
 * Get the input current to the motor controller.
 *
 * @return
 * The input current.
 */
float mcpwm_foc_get_tot_current_in(void) {
	return m_motor_state.i_bus;
}

/**
 * Get the filtered input current to the motor controller.
 *
 * @return
 * The filtered input current.
 */
float mcpwm_foc_get_tot_current_in_filtered(void) {
	return m_motor_state.i_bus; // TODO: Calculate filtered current?
}

/**
 * Read the number of steps the motor has rotated. This number is signed and
 * will return a negative number when the motor is rotating backwards.
 *
 * @param reset
 * If true, the tachometer counter will be reset after this call.
 *
 * @return
 * The tachometer value in motor steps. The number of motor revolutions will
 * be this number divided by (3 * MOTOR_POLE_NUMBER).
 */
int mcpwm_foc_get_tachometer_value(bool reset) {
	int val = m_tachometer;

	if (reset) {
		m_tachometer = 0;
	}

	return val;
}

/**
 * Read the absolute number of steps the motor has rotated.
 *
 * @param reset
 * If true, the tachometer counter will be reset after this call.
 *
 * @return
 * The tachometer value in motor steps. The number of motor revolutions will
 * be this number divided by (3 * MOTOR_POLE_NUMBER).
 */
int mcpwm_foc_get_tachometer_abs_value(bool reset) {
	int val = m_tachometer_abs;

	if (reset) {
		m_tachometer_abs = 0;
	}

	return val;
}

/**
 * Read the motor phase.
 *
 * @return
 * The phase angle in degrees.
 */
float mcpwm_foc_get_phase(void) {
	float angle = m_motor_state.phase * (180.0 / M_PI);
	utils_norm_angle(&angle);
	return angle;
}

/**
 * Read the phase that the observer has calculated.
 *
 * @return
 * The phase angle in degrees.
 */
float mcpwm_foc_get_phase_observer(void) {
	float angle = m_phase_now_observer * (180.0 / M_PI);
	utils_norm_angle(&angle);
	return angle;
}

/**
 * Read the phase from based on the encoder.
 *
 * @return
 * The phase angle in degrees.
 */
float mcpwm_foc_get_phase_encoder(void) {
	float angle = m_phase_now_encoder * (180.0 / M_PI);
	utils_norm_angle(&angle);
	return angle;
}

float mcpwm_foc_get_vd(void) {
	return m_motor_state.vd;
}

float mcpwm_foc_get_vq(void) {
	return m_motor_state.vq;
}

/**
 * Get current offsets,
 * this is used by the virtual motor to save the current offsets,
 * when it is connected
 */
void mcpwm_foc_get_current_offsets(volatile int *curr0_offset, volatile int *curr1_offset, volatile int *curr2_offset) {
	*curr0_offset = m_curr0_offset;
	*curr1_offset = m_curr1_offset;
	*curr2_offset = m_curr2_offset;

}






float mcpwm_foc_get_last_adc_isr_duration(void) {
	return m_last_adc_isr_duration;
}



void DMA2_Stream4_IRQHandler(void *p, uint32_t flags) {
	(void)p;
	(void)flags;

	static int skip = 0;
	if (++skip == FOC_CONTROL_LOOP_FREQ_DIVIDER) {
		skip = 0;
	} else {
		return;
	}

	// Reset the watchdog
	kick_hard_watchdog();

	int curr0 = GET_CURRENT1();
	int curr1 = GET_CURRENT2();


	int curr2 = GET_CURRENT3();


	m_curr0_sum += curr0;
	m_curr1_sum += curr1;
	m_curr2_sum += curr2;

	curr0 -= m_curr0_offset;
	curr1 -= m_curr1_offset;
	curr2 -= m_curr2_offset;
	m_curr_unbalance = curr0 + curr1 + curr2;


	m_curr_samples++;

	ADC_curr_norm_value[0] = curr0;
	ADC_curr_norm_value[1] = curr1;
	ADC_curr_norm_value[2] = curr2;


	// Use the best current samples depending on the modulation state.
	if (m_conf->foc_sample_high_current) {
		// High current sampling mode. Choose the lower currents to derive the highest one
		// in order to be able to measure higher currents.
		const float i0_abs = fabsf(ADC_curr_norm_value[0]);
		const float i1_abs = fabsf(ADC_curr_norm_value[1]);
		const float i2_abs = fabsf(ADC_curr_norm_value[2]);

		if (i0_abs > i1_abs && i0_abs > i2_abs) {
			ADC_curr_norm_value[0] = -(ADC_curr_norm_value[1] + ADC_curr_norm_value[2]);
		} else if (i1_abs > i0_abs && i1_abs > i2_abs) {
			ADC_curr_norm_value[1] = -(ADC_curr_norm_value[0] + ADC_curr_norm_value[2]);
		} else if (i2_abs > i0_abs && i2_abs > i1_abs) {
			ADC_curr_norm_value[2] = -(ADC_curr_norm_value[0] + ADC_curr_norm_value[1]);
		}
	}

	float ia = ADC_curr_norm_value[0] * FAC_CURRENT;
	float ib = ADC_curr_norm_value[1] * FAC_CURRENT;
//	float ic = -(ia + ib);



#ifdef HW_HAS_PHASE_SHUNTS
	float dt;
	if (m_conf->foc_sample_v0_v7) {
		dt = 1.0 / m_conf->foc_f_sw;
	} else {
		dt = 1.0 / (m_conf->foc_f_sw / 2.0);
	}
#else
	float dt = 1.0 / (m_conf->foc_f_sw / 2.0);
#endif

	// This has to be done for the skip function to have any chance at working with the
	// observer and control loops.
	// TODO: Test this.
	dt /= (float)FOC_CONTROL_LOOP_FREQ_DIVIDER;

	UTILS_LP_FAST(m_motor_state.v_bus, GET_INPUT_VOLTAGE(), 0.1);



	static float phase_before = 0.0;
	const float phase_diff = utils_angle_difference_rad(m_motor_state.phase, phase_before);
	phase_before = m_motor_state.phase;

	if (m_state == MC_STATE_RUNNING) {
		// Clarke transform assuming balanced currents
		m_motor_state.i_alpha = ia;
		m_motor_state.i_beta = ONE_BY_SQRT3 * ia + TWO_BY_SQRT3 * ib;

		// Full Clarke transform in case there are current offsets
//		m_motor_state.i_alpha = (2.0 / 3.0) * ia - (1.0 / 3.0) * ib - (1.0 / 3.0) * ic;
//		m_motor_state.i_beta = ONE_BY_SQRT3 * ib - ONE_BY_SQRT3 * ic;

		const float duty_abs = fabsf(m_motor_state.duty_now);
		float id_set_tmp = m_id_set;
		float iq_set_tmp = m_iq_set;
		m_motor_state.max_duty = m_conf->l_max_duty;

		static float duty_filtered = 0.0;
		UTILS_LP_FAST(duty_filtered, m_motor_state.duty_now, 0.1);
		utils_truncate_number(&duty_filtered, -1.0, 1.0);

		float duty_set = m_duty_cycle_set;
		bool control_duty = m_control_mode == CONTROL_MODE_DUTY ||
				m_control_mode == CONTROL_MODE_OPENLOOP_DUTY ||
				m_control_mode == CONTROL_MODE_OPENLOOP_DUTY_PHASE;

		// When the modulation is low in brake mode and the set brake current
		// cannot be reached, short all phases to get more braking without
		// applying active braking. Use a bit of hysteresis when leaving
		// the shorted mode.
		static bool was_full_brake = false;
		if (m_control_mode == CONTROL_MODE_CURRENT_BRAKE &&
				fabsf(duty_filtered) < m_conf->l_min_duty * 1.5 &&
				(m_motor_state.i_abs * (was_full_brake ? 1.0 : 1.5)) < fabsf(m_iq_set)) {
			control_duty = true;
			duty_set = 0.0;
			was_full_brake = true;
		} else {
			was_full_brake = false;
		}

		// Brake when set ERPM is below min ERPM
		if (m_control_mode == CONTROL_MODE_SPEED &&
				fabsf(m_speed_pid_set_rpm) < m_conf->s_pid_min_erpm) {
			control_duty = true;
			duty_set = 0.0;
		}

		if (control_duty) {
			// Duty cycle control
			static float duty_i_term = 0.0;
			if (fabsf(duty_set) < (duty_abs - 0.05) ||
					(SIGN(m_motor_state.vq) * m_motor_state.iq) < m_conf->lo_current_min) {
				// Truncating the duty cycle here would be dangerous, so run a PID controller.

				// Compensation for supply voltage variations
				float scale = 1.0 / GET_INPUT_VOLTAGE();

				// Compute error
				float error = duty_set - m_motor_state.duty_now;

				// Compute parameters
				float p_term = error * m_conf->foc_duty_dowmramp_kp * scale;
				duty_i_term += error * (m_conf->foc_duty_dowmramp_ki * dt) * scale;

				// I-term wind-up protection
				utils_truncate_number(&duty_i_term, -1.0, 1.0);

				// Calculate output
				float output = p_term + duty_i_term;
				utils_truncate_number(&output, -1.0, 1.0);
				iq_set_tmp = output * m_conf->lo_current_max;
			} else {
				// If the duty cycle is less than or equal to the set duty cycle just limit
				// the modulation and use the maximum allowed current.
				duty_i_term = 0.0;
				m_motor_state.max_duty = duty_set;
				if (duty_set > 0.0) {
					iq_set_tmp = m_conf->lo_current_max;
				} else {
					iq_set_tmp = -m_conf->lo_current_max;
				}
			}
		} else if (m_control_mode == CONTROL_MODE_CURRENT_BRAKE) {
			// Braking
			iq_set_tmp = fabsf(iq_set_tmp);

			if (phase_diff > 0.0) {
				iq_set_tmp = -iq_set_tmp;
			} else if (phase_diff == 0.0) {
				iq_set_tmp = 0.0;
			}
		}

		// Run observer
		if (!m_phase_override) {
			observer_update(m_motor_state.v_alpha, m_motor_state.v_beta,
					m_motor_state.i_alpha, m_motor_state.i_beta, dt,
					&m_observer_x1, &m_observer_x2, &m_phase_now_observer);
		}


			if (m_phase_observer_override) {
				m_motor_state.phase = m_phase_now_observer_override;
			} else {
				m_motor_state.phase = m_phase_now_observer;
			}

			// Inject D axis current at low speed to make the observer track
			// better. This does not seem to be necessary with dead time
			// compensation.
			// Note: this is done at high rate prevent noise.
			if (!m_phase_override) {
				if (duty_abs < m_conf->foc_sl_d_current_duty) {
					id_set_tmp = utils_map(duty_abs, 0.0, m_conf->foc_sl_d_current_duty,
							fabsf(m_motor_state.iq_target) * m_conf->foc_sl_d_current_factor, 0.0);
				} else {
					id_set_tmp = 0.0;
				}
			}


		if (m_control_mode == CONTROL_MODE_HANDBRAKE) {
			// Force the phase to 0 in handbrake mode so that the current simply locks the rotor.
			m_motor_state.phase = 0.0;
		} else if (m_control_mode == CONTROL_MODE_OPENLOOP ||
				m_control_mode == CONTROL_MODE_OPENLOOP_DUTY) {
			static float openloop_angle = 0.0;
			openloop_angle += dt * m_openloop_speed;
			utils_norm_angle_rad(&openloop_angle);
			m_motor_state.phase = openloop_angle;
		} else if (m_control_mode == CONTROL_MODE_OPENLOOP_PHASE ||
				m_control_mode == CONTROL_MODE_OPENLOOP_DUTY_PHASE) {
			m_motor_state.phase = m_openloop_phase;
		}

		if (m_phase_override) {
			m_motor_state.phase = m_phase_now_override;
		}

		// Apply current limits
		// TODO: Consider D axis current for the input current as well.
		const float mod_q = m_motor_state.mod_q;
		if (mod_q > 0.001) {
			utils_truncate_number(&iq_set_tmp, m_conf->lo_in_current_min / mod_q, m_conf->lo_in_current_max / mod_q);
		} else if (mod_q < -0.001) {
			utils_truncate_number(&iq_set_tmp, m_conf->lo_in_current_max / mod_q, m_conf->lo_in_current_min / mod_q);
		}

		if (mod_q > 0.0) {
			utils_truncate_number(&iq_set_tmp, m_conf->lo_current_min, m_conf->lo_current_max);
		} else {
			utils_truncate_number(&iq_set_tmp, -m_conf->lo_current_max, -m_conf->lo_current_min);
		}

		utils_saturate_vector_2d(&id_set_tmp, &iq_set_tmp,
				utils_max_abs(m_conf->lo_current_max, m_conf->lo_current_min));

		m_motor_state.id_target = id_set_tmp;
		m_motor_state.iq_target = iq_set_tmp;

		control_current(&m_motor_state, dt);
	} else {
		// Track back emf
		float Va = ADC_VOLTS(ADC_IND_SENS1) * ((VIN_R1 + VIN_R2) / VIN_R2);
		float Vb = ADC_VOLTS(ADC_IND_SENS2) * ((VIN_R1 + VIN_R2) / VIN_R2);
		float Vc = ADC_VOLTS(ADC_IND_SENS3) * ((VIN_R1 + VIN_R2) / VIN_R2);

		// Full Clarke transform (no balanced voltages)
		m_motor_state.v_alpha = (2.0 / 3.0) * Va - (1.0 / 3.0) * Vb - (1.0 / 3.0) * Vc;
		m_motor_state.v_beta = ONE_BY_SQRT3 * Vb - ONE_BY_SQRT3 * Vc;

		float c, s;
		utils_fast_sincos_better(m_motor_state.phase, &s, &c);


		// Park transform
		float vd_tmp = c * m_motor_state.v_alpha + s * m_motor_state.v_beta;
		float vq_tmp = c * m_motor_state.v_beta  - s * m_motor_state.v_alpha;

		UTILS_NAN_ZERO(m_motor_state.vd);
		UTILS_NAN_ZERO(m_motor_state.vq);

		UTILS_LP_FAST(m_motor_state.vd, vd_tmp, 0.2);
		UTILS_LP_FAST(m_motor_state.vq, vq_tmp, 0.2);

		m_motor_state.vd_int = m_motor_state.vd;
		m_motor_state.vq_int = m_motor_state.vq;

		// Update corresponding modulation
		m_motor_state.mod_d = m_motor_state.vd / ((2.0 / 3.0) * m_motor_state.v_bus);
		m_motor_state.mod_q = m_motor_state.vq / ((2.0 / 3.0) * m_motor_state.v_bus);

		// The current is 0 when the motor is undriven
		m_motor_state.i_alpha = 0.0;
		m_motor_state.i_beta = 0.0;
		m_motor_state.id = 0.0;
		m_motor_state.iq = 0.0;
		m_motor_state.id_filter = 0.0;
		m_motor_state.iq_filter = 0.0;
		m_motor_state.i_bus = 0.0;
		m_motor_state.i_abs = 0.0;
		m_motor_state.i_abs_filter = 0.0;

		// Run observer
		observer_update(m_motor_state.v_alpha, m_motor_state.v_beta,
				m_motor_state.i_alpha, m_motor_state.i_beta, dt, &m_observer_x1,
				&m_observer_x2, &m_phase_now_observer);

			m_motor_state.phase = m_phase_now_observer;
		}


	// Calculate duty cycle
	m_motor_state.duty_now = SIGN(m_motor_state.vq) *
			sqrtf(m_motor_state.mod_d * m_motor_state.mod_d +
					m_motor_state.mod_q * m_motor_state.mod_q) / SQRT3_BY_2;

	// Run PLL for speed estimation
	pll_run(m_motor_state.phase, dt, &m_pll_phase, &m_pll_speed);

	// Update tachometer (resolution = 60 deg as for BLDC)
	float ph_tmp = m_motor_state.phase;
	utils_norm_angle_rad(&ph_tmp);
	int step = (int)floorf((ph_tmp + M_PI) / (2.0 * M_PI) * 6.0);
	utils_truncate_number_int(&step, 0, 5);
	static int step_last = 0;
	int diff = step - step_last;
	step_last = step;

	if (diff > 3) {
		diff -= 6;
	} else if (diff < -2) {
		diff += 6;
	}

	m_tachometer += diff;
	m_tachometer_abs += abs(diff);

	// MCIF handler
	//mc_interface_mc_timer_isr();
}

// Private functions

void speed_control_and_open_loop(void) {

		float openloop_rpm = utils_map(fabsf(m_motor_state.iq_target),
				0.0, m_conf->l_current_max,
				0.0, m_conf->foc_openloop_rpm);

		utils_truncate_number_abs(&openloop_rpm, m_conf->foc_openloop_rpm);

		const float dt = 0.001;
		const float min_rads = (openloop_rpm * 2.0 * M_PI) / 60.0;
		static float min_rpm_hyst_timer = 0.0;
		static float min_rpm_timer = 0.0;

		float add_min_speed = 0.0;
		if (m_motor_state.duty_now > 0.0) {
			add_min_speed = min_rads * dt;
		} else {
			add_min_speed = -min_rads * dt;
		}

		// Open loop encoder angle for when the index is not found
		m_phase_now_encoder_no_index += add_min_speed;
		utils_norm_angle_rad((float*)&m_phase_now_encoder_no_index);

		// Output a minimum speed from the observer
		if (fabsf(m_pll_speed) < min_rads) {
			min_rpm_hyst_timer += dt;
		} else if (min_rpm_hyst_timer > 0.0) {
			min_rpm_hyst_timer -= dt;
		}

		// Don't use this in brake mode.
		if (m_control_mode == CONTROL_MODE_CURRENT_BRAKE || fabsf(m_motor_state.duty_now) < 0.001) {
			min_rpm_hyst_timer = 0.0;
			m_phase_observer_override = false;
		}

		bool started_now = false;
		if (min_rpm_hyst_timer > m_conf->foc_sl_openloop_hyst && min_rpm_timer <= 0.0001) {
			min_rpm_timer = m_conf->foc_sl_openloop_time;
			started_now = true;
		}

		if (min_rpm_timer > 0.0) {
			m_phase_now_observer_override += add_min_speed;

			// When the motor gets stuck it tends to be 90 degrees off, so start the open loop
			// sequence by correcting with 90 degrees.
			if (started_now) {
				if (m_motor_state.duty_now > 0.0) {
					m_phase_now_observer_override += M_PI / 2.0;
				} else {
					m_phase_now_observer_override -= M_PI / 2.0;
				}
			}

			utils_norm_angle_rad((float*)&m_phase_now_observer_override);
			m_phase_observer_override = true;
			min_rpm_timer -= dt;
			min_rpm_hyst_timer = 0.0;
		} else {
			m_phase_now_observer_override = m_phase_now_observer;
			m_phase_observer_override = false;
		}

		// Samples
		if (m_state == MC_STATE_RUNNING) {
			const volatile float vd_tmp = m_motor_state.vd;
			const volatile float vq_tmp = m_motor_state.vq;
			const volatile float id_tmp = m_motor_state.id;
			const volatile float iq_tmp = m_motor_state.iq;

			m_samples.avg_current_tot += sqrtf(SQ(id_tmp) + SQ(iq_tmp));
			m_samples.avg_voltage_tot += sqrtf(SQ(vd_tmp) + SQ(vq_tmp));
			m_samples.sample_num++;
		}

		// Update and the observer gain.
		m_gamma_now = utils_map(fabsf(m_motor_state.duty_now), 0.0, 1.0,
				m_conf->foc_observer_gain * m_conf->foc_observer_gain_slow, m_conf->foc_observer_gain);

		run_pid_control_speed(dt);
}

static void do_dc_cal(void) {



	//if fault pin has not gone high, indicating that PWM output is ready
	while(!(GPIOE->IDR&0x8000)){
	};

	m_curr0_sum = 0;
	m_curr1_sum = 0;
	m_curr2_sum = 0;
	m_curr_samples = 0;
	while(m_curr_samples < 4000) {};
	m_curr0_offset = m_curr0_sum / m_curr_samples;
	m_curr1_offset = m_curr1_sum / m_curr_samples;
	m_curr2_offset = m_curr2_sum / m_curr_samples;

	m_dccal_done = true;
}

// See http://cas.ensmp.fr/~praly/Telechargement/Journaux/2010-IEEE_TPEL-Lee-Hong-Nam-Ortega-Praly-Astolfi.pdf
void observer_update(float v_alpha, float v_beta, float i_alpha, float i_beta,
		float dt, volatile float *x1, volatile float *x2, volatile float *phase) {

	const float L = (3.0 / 2.0) * m_conf->foc_motor_l;
	const float lambda = m_conf->foc_motor_flux_linkage;
	float R = (3.0 / 2.0) * m_conf->foc_motor_r;

	// Saturation compensation
	const float sign = (m_motor_state.iq * m_motor_state.vq) >= 0.0 ? 1.0 : -1.0;
	R -= R * sign * m_conf->foc_sat_comp * (m_motor_state.i_abs_filter / m_conf->l_current_max);

	const float L_ia = L * i_alpha;
	const float L_ib = L * i_beta;
	const float R_ia = R * i_alpha;
	const float R_ib = R * i_beta;
	const float lambda_2 = SQ(lambda);
	const float gamma_half = m_gamma_now * 0.5;

	// Original
//	float err = lambda_2 - (SQ(*x1 - L_ia) + SQ(*x2 - L_ib));
//	float x1_dot = -R_ia + v_alpha + gamma_half * (*x1 - L_ia) * err;
//	float x2_dot = -R_ib + v_beta + gamma_half * (*x2 - L_ib) * err;
//	*x1 += x1_dot * dt;
//	*x2 += x2_dot * dt;

	// Iterative with some trial and error
	const int iterations = 6;
	const float dt_iteration = dt / (float)iterations;
	for (int i = 0;i < iterations;i++) {
		float err = lambda_2 - (SQ(*x1 - L_ia) + SQ(*x2 - L_ib));
		float gamma_tmp = gamma_half;
		if (utils_truncate_number_abs(&err, lambda_2 * 0.2)) {
			gamma_tmp *= 10.0;
		}
		float x1_dot = -R_ia + v_alpha + gamma_tmp * (*x1 - L_ia) * err;
		float x2_dot = -R_ib + v_beta + gamma_tmp * (*x2 - L_ib) * err;

		*x1 += x1_dot * dt_iteration;
		*x2 += x2_dot * dt_iteration;
	}

	// Same as above, but without iterations.
//	float err = lambda_2 - (SQ(*x1 - L_ia) + SQ(*x2 - L_ib));
//	float gamma_tmp = gamma_half;
//	if (utils_truncate_number_abs(&err, lambda_2 * 0.2)) {
//		gamma_tmp *= 10.0;
//	}
//	float x1_dot = -R_ia + v_alpha + gamma_tmp * (*x1 - L_ia) * err;
//	float x2_dot = -R_ib + v_beta + gamma_tmp * (*x2 - L_ib) * err;
//	*x1 += x1_dot * dt;
//	*x2 += x2_dot * dt;

	UTILS_NAN_ZERO(*x1);
	UTILS_NAN_ZERO(*x2);

	*phase = utils_fast_atan2(*x2 - L_ib, *x1 - L_ia);
}

static void pll_run(float phase, float dt, volatile float *phase_var,
		volatile float *speed_var) {
	UTILS_NAN_ZERO(*phase_var);
	float delta_theta = phase - *phase_var;
	utils_norm_angle_rad(&delta_theta);
	UTILS_NAN_ZERO(*speed_var);
	*phase_var += (*speed_var + m_conf->foc_pll_kp * delta_theta) * dt;
	utils_norm_angle_rad((float*)phase_var);
	*speed_var += m_conf->foc_pll_ki * delta_theta * dt;
}

/**
 * Run the current control loop.
 *
 * @param state_m
 * The motor state.
 *
 * Parameters that shall be set before calling this function:
 * id_target
 * iq_target
 * max_duty
 * phase
 * i_alpha
 * i_beta
 * v_bus
 *
 * Parameters that will be updated in this function:
 * i_bus
 * i_abs
 * i_abs_filter
 * v_alpha
 * v_beta
 * mod_d
 * mod_q
 * id
 * iq
 * id_filter
 * iq_filter
 * vd
 * vq
 * vd_int
 * vq_int
 * svm_sector
 *
 * @param dt
 * The time step in seconds.
 */
static void control_current(volatile motor_state_t *state_m, float dt) {
	float c,s;
	utils_fast_sincos_better(state_m->phase, &s, &c);

	float max_duty = fabsf(state_m->max_duty);
	utils_truncate_number(&max_duty, 0.0, m_conf->l_max_duty);

	state_m->id = c * state_m->i_alpha + s * state_m->i_beta;
	state_m->iq = c * state_m->i_beta  - s * state_m->i_alpha;
	UTILS_LP_FAST(state_m->id_filter, state_m->id, m_conf->foc_current_filter_const);
	UTILS_LP_FAST(state_m->iq_filter, state_m->iq, m_conf->foc_current_filter_const);

	float Ierr_d = state_m->id_target - state_m->id;
	float Ierr_q = state_m->iq_target - state_m->iq;

	state_m->vd = state_m->vd_int + Ierr_d * m_conf->foc_current_kp;
	state_m->vq = state_m->vq_int + Ierr_q * m_conf->foc_current_kp;


	float ki = m_conf->foc_current_ki;


	state_m->vd_int += Ierr_d * (ki * dt);
	state_m->vq_int += Ierr_q * (ki * dt);

	// Saturation
	utils_saturate_vector_2d((float*)&state_m->vd, (float*)&state_m->vq,
			(2.0 / 3.0) * max_duty * SQRT3_BY_2 * state_m->v_bus);

	state_m->mod_d = state_m->vd / ((2.0 / 3.0) * state_m->v_bus);
	state_m->mod_q = state_m->vq / ((2.0 / 3.0) * state_m->v_bus);

	// Windup protection
//	utils_saturate_vector_2d((float*)&state_m->vd_int, (float*)&state_m->vq_int,
//			(2.0 / 3.0) * max_duty * SQRT3_BY_2 * state_m->v_bus);
	utils_truncate_number_abs((float*)&state_m->vd_int, (2.0 / 3.0) * max_duty * SQRT3_BY_2 * state_m->v_bus);
	utils_truncate_number_abs((float*)&state_m->vq_int, (2.0 / 3.0) * max_duty * SQRT3_BY_2 * state_m->v_bus);

	// TODO: Have a look at this?
	state_m->i_bus = state_m->mod_d * state_m->id + state_m->mod_q * state_m->iq;
	state_m->i_abs = sqrtf(SQ(state_m->id) + SQ(state_m->iq));
	state_m->i_abs_filter = sqrtf(SQ(state_m->id_filter) + SQ(state_m->iq_filter));

	float mod_alpha = c * state_m->mod_d - s * state_m->mod_q;
	float mod_beta  = c * state_m->mod_q + s * state_m->mod_d;

	// Deadtime compensation
	const float i_alpha_filter = c * state_m->id_target - s * state_m->iq_target;
	const float i_beta_filter = c * state_m->iq_target + s * state_m->id_target;
	const float ia_filter = i_alpha_filter;
	const float ib_filter = -0.5 * i_alpha_filter + SQRT3_BY_2 * i_beta_filter;
	const float ic_filter = -0.5 * i_alpha_filter - SQRT3_BY_2 * i_beta_filter;
	const float mod_alpha_filter_sgn = (2.0 / 3.0) * SIGN(ia_filter) - (1.0 / 3.0) * SIGN(ib_filter) - (1.0 / 3.0) * SIGN(ic_filter);
	const float mod_beta_filter_sgn = ONE_BY_SQRT3 * SIGN(ib_filter) - ONE_BY_SQRT3 * SIGN(ic_filter);
	const float mod_comp_fact = m_conf->foc_dt_us * 1e-6 * m_conf->foc_f_sw;
	const float mod_alpha_comp = mod_alpha_filter_sgn * mod_comp_fact;
	const float mod_beta_comp = mod_beta_filter_sgn * mod_comp_fact;

	// Apply compensation here so that 0 duty cycle has no glitches.
	state_m->v_alpha = (mod_alpha - mod_alpha_comp) * (2.0 / 3.0) * state_m->v_bus;
	state_m->v_beta = (mod_beta - mod_beta_comp) * (2.0 / 3.0) * state_m->v_bus;

	// Set output (HW Dependent)
	uint32_t duty1, duty2, duty3, top;
	top = TIM1->ARR;
	svm(-mod_alpha, -mod_beta, top, &duty1, &duty2, &duty3, (uint32_t*)&state_m->svm_sector);
	TIMER_UPDATE_DUTY(duty1, duty2, duty3);
	start_pwm_hw();


}

// Magnitude must not be larger than sqrt(3)/2, or 0.866
static void svm(float alpha, float beta, uint32_t PWMHalfPeriod,
		uint32_t* tAout, uint32_t* tBout, uint32_t* tCout, uint32_t *svm_sector) {
	uint32_t sector;

	if (beta >= 0.0f) {
		if (alpha >= 0.0f) {
			//quadrant I
			if (ONE_BY_SQRT3 * beta > alpha) {
				sector = 2;
			} else {
				sector = 1;
			}
		} else {
			//quadrant II
			if (-ONE_BY_SQRT3 * beta > alpha) {
				sector = 3;
			} else {
				sector = 2;
			}
		}
	} else {
		if (alpha >= 0.0f) {
			//quadrant IV5
			if (-ONE_BY_SQRT3 * beta > alpha) {
				sector = 5;
			} else {
				sector = 6;
			}
		} else {
			//quadrant III
			if (ONE_BY_SQRT3 * beta > alpha) {
				sector = 4;
			} else {
				sector = 5;
			}
		}
	}

	// PWM timings
	uint32_t tA, tB, tC;

	switch (sector) {

	// sector 1-2
	case 1: {
		// Vector on-times
		uint32_t t1 = (alpha - ONE_BY_SQRT3 * beta) * PWMHalfPeriod;
		uint32_t t2 = (TWO_BY_SQRT3 * beta) * PWMHalfPeriod;

		// PWM timings
		tA = (PWMHalfPeriod - t1 - t2) / 2;
		tB = tA + t1;
		tC = tB + t2;

		break;
	}

	// sector 2-3
	case 2: {
		// Vector on-times
		uint32_t t2 = (alpha + ONE_BY_SQRT3 * beta) * PWMHalfPeriod;
		uint32_t t3 = (-alpha + ONE_BY_SQRT3 * beta) * PWMHalfPeriod;

		// PWM timings
		tB = (PWMHalfPeriod - t2 - t3) / 2;
		tA = tB + t3;
		tC = tA + t2;

		break;
	}

	// sector 3-4
	case 3: {
		// Vector on-times
		uint32_t t3 = (TWO_BY_SQRT3 * beta) * PWMHalfPeriod;
		uint32_t t4 = (-alpha - ONE_BY_SQRT3 * beta) * PWMHalfPeriod;

		// PWM timings
		tB = (PWMHalfPeriod - t3 - t4) / 2;
		tC = tB + t3;
		tA = tC + t4;

		break;
	}

	// sector 4-5
	case 4: {
		// Vector on-times
		uint32_t t4 = (-alpha + ONE_BY_SQRT3 * beta) * PWMHalfPeriod;
		uint32_t t5 = (-TWO_BY_SQRT3 * beta) * PWMHalfPeriod;

		// PWM timings
		tC = (PWMHalfPeriod - t4 - t5) / 2;
		tB = tC + t5;
		tA = tB + t4;

		break;
	}

	// sector 5-6
	case 5: {
		// Vector on-times
		uint32_t t5 = (-alpha - ONE_BY_SQRT3 * beta) * PWMHalfPeriod;
		uint32_t t6 = (alpha - ONE_BY_SQRT3 * beta) * PWMHalfPeriod;

		// PWM timings
		tC = (PWMHalfPeriod - t5 - t6) / 2;
		tA = tC + t5;
		tB = tA + t6;

		break;
	}

	// sector 6-1
	case 6: {
		// Vector on-times
		uint32_t t6 = (-TWO_BY_SQRT3 * beta) * PWMHalfPeriod;
		uint32_t t1 = (alpha + ONE_BY_SQRT3 * beta) * PWMHalfPeriod;

		// PWM timings
		tA = (PWMHalfPeriod - t6 - t1) / 2;
		tC = tA + t1;
		tB = tC + t6;

		break;
	}
	}

	*tAout = tA;
	*tBout = tB;
	*tCout = tC;
	*svm_sector = sector;
}



static void run_pid_control_speed(float dt) {
	static float i_term = 0.0;
	static float prev_error = 0.0;
	float p_term;
	float d_term;

	// PID is off. Return.
	if (m_control_mode != CONTROL_MODE_SPEED) {
		i_term = 0.0;
		prev_error = 0.0;
		return;
	}

	const float rpm = mcpwm_foc_get_rpm();
	float error = m_speed_pid_set_rpm - rpm;

	// Too low RPM set. Reset state and return.
	if (fabsf(m_speed_pid_set_rpm) < m_conf->s_pid_min_erpm) {
		i_term = 0.0;
		prev_error = error;
		return;
	}

	// Compute parameters
	p_term = error * m_conf->s_pid_kp * (1.0 / 20.0);
	i_term += error * (m_conf->s_pid_ki * dt) * (1.0 / 20.0);
	d_term = (error - prev_error) * (m_conf->s_pid_kd / dt) * (1.0 / 20.0);

	// Filter D
	static float d_filter = 0.0;
	UTILS_LP_FAST(d_filter, d_term, m_conf->s_pid_kd_filter);
	d_term = d_filter;

	// I-term wind-up protection
	utils_truncate_number(&i_term, -1.0, 1.0);

	// Store previous error
	prev_error = error;

	// Calculate output
	float output = p_term + i_term + d_term;
	utils_truncate_number(&output, -1.0, 1.0);

	// Optionally disable braking
	if (!m_conf->s_pid_allow_braking) {
		if (rpm > 20.0 && output < 0.0) {
			output = 0.0;
		}

		if (rpm < -20.0 && output > 0.0) {
			output = 0.0;
		}
	}

	m_iq_set = output * m_conf->lo_current_max;
}

static void stop_pwm_hw(void) {
	TIM1->CCMR1&=~0x7070;
	TIM1->CCMR2&=~0x70;
	TIM1->CCMR1|=0x4040;
	TIM1->CCMR2|=0x40;
	TIM1->CCER&=~0x555;
	TIM1->CCER|=0x111;
	TIM1->EGR|=0x20;


#ifdef HW_HAS_DRV8313
	DISABLE_BR();
#endif
	m_output_on = false;
}

static void start_pwm_hw(void) {


	TIM1->CCMR1&=~0x7070;
	TIM1->CCMR1|=0x6060;
	TIM1->CCMR2&=~0x60;
	TIM1->CCMR2|=0x60;
	TIM1->CCER|=0x555;
	// Generate COM event in ADC interrupt to get better synchronization
//	TIM_GenerateEvent(TIM1, TIM_EventSource_COM);

	m_output_on = true;
}



