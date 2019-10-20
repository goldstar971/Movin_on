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

#ifndef DATATYPES_H_
#define DATATYPES_H_

#include <stdint.h>
#include <stdbool.h>


// Data types
typedef enum {
   MC_STATE_OFF = 0,
   MC_STATE_DETECTING,
   MC_STATE_RUNNING,
   MC_STATE_FULL_BRAKE,
} mc_state;

typedef enum {
	PWM_MODE_NONSYNCHRONOUS_HISW = 0, // This mode is not recommended
	PWM_MODE_SYNCHRONOUS, // The recommended and most tested mode
	PWM_MODE_BIPOLAR // Some glitches occasionally, can kill MOSFETs
} mc_pwm_mode;

typedef enum {
	COMM_MODE_INTEGRATE = 0,
	COMM_MODE_DELAY
} mc_comm_mode;

typedef enum {
	SENSOR_MODE_SENSORLESS = 0,
	SENSOR_MODE_SENSORED,
	SENSOR_MODE_HYBRID
} mc_sensor_mode;

typedef enum {
	FOC_SENSOR_MODE_SENSORLESS = 0,
	FOC_SENSOR_MODE_ENCODER,
	FOC_SENSOR_MODE_HALL
} mc_foc_sensor_mode;

// Auxiliary output mode
typedef enum {
	OUT_AUX_MODE_OFF = 0,
	OUT_AUX_MODE_ON_AFTER_2S,
	OUT_AUX_MODE_ON_AFTER_5S,
	OUT_AUX_MODE_ON_AFTER_10S
} out_aux_mode;

// General purpose drive output mode
typedef enum {
	GPD_OUTPUT_MODE_NONE = 0,
	GPD_OUTPUT_MODE_MODULATION,
	GPD_OUTPUT_MODE_VOLTAGE,
	GPD_OUTPUT_MODE_CURRENT
} gpd_output_mode;

typedef enum {
	MOTOR_TYPE_BLDC = 0,
	MOTOR_TYPE_DC,
	MOTOR_TYPE_FOC,
	MOTOR_TYPE_GPD
} mc_motor_type;

typedef enum {
	FAULT_CODE_NONE = 0,
	FAULT_CODE_OVER_VOLTAGE,
	FAULT_CODE_UNDER_VOLTAGE,
	FAULT_CODE_DRV,
	FAULT_CODE_ABS_OVER_CURRENT,
	FAULT_CODE_OVER_TEMP_FET,
	FAULT_CODE_OVER_TEMP_MOTOR,
	FAULT_CODE_GATE_DRIVER_OVER_VOLTAGE,
	FAULT_CODE_GATE_DRIVER_UNDER_VOLTAGE,
	FAULT_CODE_MCU_UNDER_VOLTAGE,
	FAULT_CODE_BOOTING_FROM_WATCHDOG_RESET,
	FAULT_CODE_ENCODER_SPI,
	FAULT_CODE_ENCODER_SINCOS_BELOW_MIN_AMPLITUDE,
	FAULT_CODE_ENCODER_SINCOS_ABOVE_MAX_AMPLITUDE,
	FAULT_CODE_FLASH_CORRUPTION,
	FAULT_CODE_HIGH_OFFSET_CURRENT_SENSOR_1,
	FAULT_CODE_HIGH_OFFSET_CURRENT_SENSOR_2,
	FAULT_CODE_HIGH_OFFSET_CURRENT_SENSOR_3,
	FAULT_CODE_UNBALANCED_CURRENTS
} mc_fault_code;

typedef enum {
	CONTROL_MODE_DUTY = 0,
	CONTROL_MODE_SPEED,
	CONTROL_MODE_CURRENT,
	CONTROL_MODE_CURRENT_BRAKE,
	CONTROL_MODE_POS,
	CONTROL_MODE_HANDBRAKE,
	CONTROL_MODE_OPENLOOP,
	CONTROL_MODE_OPENLOOP_PHASE,
	CONTROL_MODE_OPENLOOP_DUTY,
	CONTROL_MODE_OPENLOOP_DUTY_PHASE,
	CONTROL_MODE_NONE
} mc_control_mode;

typedef enum {
	DISP_POS_MODE_NONE = 0,
	DISP_POS_MODE_INDUCTANCE,
	DISP_POS_MODE_OBSERVER,
	DISP_POS_MODE_ENCODER,
	DISP_POS_MODE_PID_POS,
	DISP_POS_MODE_PID_POS_ERROR,
	DISP_POS_MODE_ENCODER_OBSERVER_ERROR
} disp_pos_mode;

typedef enum {
	SENSOR_PORT_MODE_HALL = 0,
	SENSOR_PORT_MODE_ABI,
	SENSOR_PORT_MODE_AS5047_SPI,
	SENSOR_PORT_MODE_AD2S1205,
	SENSOR_PORT_MODE_SINCOS
} sensor_port_mode;

typedef struct {
	float cycle_int_limit;
	float cycle_int_limit_running;
	float cycle_int_limit_max;
	float comm_time_sum;
	float comm_time_sum_min_rpm;
	int32_t comms;
	float time_at_comm;
} mc_rpm_dep_struct;

typedef enum {
	DRV8301_OC_LIMIT = 0,
	DRV8301_OC_LATCH_SHUTDOWN,
	DRV8301_OC_REPORT_ONLY,
	DRV8301_OC_DISABLED
} drv8301_oc_mode;

typedef enum {
	DEBUG_SAMPLING_OFF = 0,
	DEBUG_SAMPLING_NOW,
	DEBUG_SAMPLING_START,
	DEBUG_SAMPLING_TRIGGER_START,
	DEBUG_SAMPLING_TRIGGER_FAULT,
	DEBUG_SAMPLING_TRIGGER_START_NOSEND,
	DEBUG_SAMPLING_TRIGGER_FAULT_NOSEND,
	DEBUG_SAMPLING_SEND_LAST_SAMPLES
} debug_sampling_mode;

typedef enum {
	CAN_BAUD_125K = 0,
	CAN_BAUD_250K,
	CAN_BAUD_500K,
	CAN_BAUD_1M
} CAN_BAUD;

typedef enum {
	BATTERY_TYPE_LIION_3_0__4_2,
	BATTERY_TYPE_LIIRON_2_6__3_6,
	BATTERY_TYPE_LEAD_ACID
} BATTERY_TYPE;

typedef struct {
	// Switching and drive
	mc_pwm_mode pwm_mode;
	mc_comm_mode comm_mode;
	mc_motor_type motor_type;
	mc_sensor_mode sensor_mode;
	// Limits
	float l_current_max;
	float l_current_min;
	float l_in_current_max;
	float l_in_current_min;
	float l_abs_current_max;
	float l_min_erpm;
	float l_max_erpm;
	float l_erpm_start;
	float l_max_erpm_fbrake;
	float l_max_erpm_fbrake_cc;
	float l_min_vin;
	float l_max_vin;
	float l_battery_cut_start;
	float l_battery_cut_end;
	bool l_slow_abs_current;
	float l_temp_fet_start;
	float l_temp_fet_end;
	float l_temp_motor_start;
	float l_temp_motor_end;
	float l_temp_accel_dec;
	float l_min_duty;
	float l_max_duty;
	float l_watt_max;
	float l_watt_min;
	float l_current_max_scale;
	float l_current_min_scale;
	// Overridden limits (Computed during runtime)
	float lo_current_max;
	float lo_current_min;
	float lo_in_current_max;
	float lo_in_current_min;
	float lo_current_motor_max_now;
	float lo_current_motor_min_now;
	// Sensorless (bldc)
	float sl_min_erpm;
	float sl_min_erpm_cycle_int_limit;
	float sl_max_fullbreak_current_dir_change;
	float sl_cycle_int_limit;
	float sl_phase_advance_at_br;
	float sl_cycle_int_rpm_br;
	float sl_bemf_coupling_k;
	// Hall sensor
	int8_t hall_table[8];
	float hall_sl_erpm;
	// FOC
	float foc_current_kp;
	float foc_current_ki;
	float foc_f_sw;
	float foc_dt_us;
	float foc_encoder_offset;
	bool foc_encoder_inverted;
	float foc_encoder_ratio;
	float foc_encoder_sin_offset;
	float foc_encoder_sin_gain;
	float foc_encoder_cos_offset;
	float foc_encoder_cos_gain;
	float foc_encoder_sincos_filter_constant;
	float foc_motor_l;
	float foc_motor_r;
	float foc_motor_flux_linkage;
	float foc_observer_gain;
	float foc_observer_gain_slow;
	float foc_pll_kp;
	float foc_pll_ki;
	float foc_duty_dowmramp_kp;
	float foc_duty_dowmramp_ki;
	float foc_openloop_rpm;
	float foc_sl_openloop_hyst;
	float foc_sl_openloop_time;
	float foc_sl_d_current_duty;
	float foc_sl_d_current_factor;
	mc_foc_sensor_mode foc_sensor_mode;
	uint8_t foc_hall_table[8];
	float foc_sl_erpm;
	bool foc_sample_v0_v7;
	bool foc_sample_high_current;
	float foc_sat_comp;
	bool foc_temp_comp;
	float foc_temp_comp_base_temp;
	float foc_current_filter_const;
	// GPDrive
	int gpd_buffer_notify_left;
	int gpd_buffer_interpol;
	float gpd_current_filter_const;
	float gpd_current_kp;
	float gpd_current_ki;
	// Speed PID
	float s_pid_kp;
	float s_pid_ki;
	float s_pid_kd;
	float s_pid_kd_filter;
	float s_pid_min_erpm;
	bool s_pid_allow_braking;
	// Pos PID
	float p_pid_kp;
	float p_pid_ki;
	float p_pid_kd;
	float p_pid_kd_filter;
	float p_pid_ang_div;
	// Current controller
	float cc_startup_boost_duty;
	float cc_min_current;
	float cc_gain;
	float cc_ramp_step_max;
	// Misc
	int32_t m_fault_stop_time_ms;
	float m_duty_ramp_step;
	float m_current_backoff_gain;
	uint32_t m_encoder_counts;
	sensor_port_mode m_sensor_port_mode;
	bool m_invert_direction;
	drv8301_oc_mode m_drv8301_oc_mode;
	int m_drv8301_oc_adj;
	float m_bldc_f_sw_min;
	float m_bldc_f_sw_max;
	float m_dc_f_sw;
	float m_ntc_motor_beta;
	out_aux_mode m_out_aux_mode;
	// Setup info
	uint8_t si_motor_poles;
	float si_gear_ratio;
	float si_wheel_diameter;
	BATTERY_TYPE si_battery_type;
	int si_battery_cells;
	float si_battery_ah;
} mc_configuration;

// Applications to use
typedef enum {
	APP_NONE = 0,
	APP_PPM,
	APP_ADC,
	APP_UART,
	APP_PPM_UART,
	APP_ADC_UART,
	APP_NUNCHUK,
	APP_NRF,
	APP_CUSTOM
} app_use;

// Throttle curve mode
typedef enum {
	THR_EXP_EXPO = 0,
	THR_EXP_NATURAL,
	THR_EXP_POLY
} thr_exp_mode;

// PPM control types
typedef enum {
	PPM_CTRL_TYPE_NONE = 0,
	PPM_CTRL_TYPE_CURRENT,
	PPM_CTRL_TYPE_CURRENT_NOREV,
	PPM_CTRL_TYPE_CURRENT_NOREV_BRAKE,
	PPM_CTRL_TYPE_DUTY,
	PPM_CTRL_TYPE_DUTY_NOREV,
	PPM_CTRL_TYPE_PID,
	PPM_CTRL_TYPE_PID_NOREV
} ppm_control_type;

typedef struct {
	ppm_control_type ctrl_type;
	float pid_max_erpm;
	float hyst;
	float pulse_start;
	float pulse_end;
	float pulse_center;
	bool median_filter;
	bool safe_start;
	float throttle_exp;
	float throttle_exp_brake;
	thr_exp_mode throttle_exp_mode;
	float ramp_time_pos;
	float ramp_time_neg;
	bool multi_esc;
	bool tc;
	float tc_max_diff;
} ppm_config;

// ADC control types
typedef enum {
	ADC_CTRL_TYPE_NONE = 0,
	ADC_CTRL_TYPE_CURRENT,
	ADC_CTRL_TYPE_CURRENT_REV_CENTER,
	ADC_CTRL_TYPE_CURRENT_REV_BUTTON,
	ADC_CTRL_TYPE_CURRENT_REV_BUTTON_BRAKE_ADC,
	ADC_CTRL_TYPE_CURRENT_REV_BUTTON_BRAKE_CENTER,
	ADC_CTRL_TYPE_CURRENT_NOREV_BRAKE_CENTER,
	ADC_CTRL_TYPE_CURRENT_NOREV_BRAKE_BUTTON,
	ADC_CTRL_TYPE_CURRENT_NOREV_BRAKE_ADC,
	ADC_CTRL_TYPE_DUTY,
	ADC_CTRL_TYPE_DUTY_REV_CENTER,
	ADC_CTRL_TYPE_DUTY_REV_BUTTON,
	ADC_CTRL_TYPE_PID,
	ADC_CTRL_TYPE_PID_REV_CENTER,
	ADC_CTRL_TYPE_PID_REV_BUTTON
} adc_control_type;

typedef struct {
	adc_control_type ctrl_type;
	float hyst;
	float voltage_start;
	float voltage_end;
	float voltage_center;
	float voltage2_start;
	float voltage2_end;
	bool use_filter;
	bool safe_start;
	bool cc_button_inverted;
	bool rev_button_inverted;
	bool voltage_inverted;
	bool voltage2_inverted;
	float throttle_exp;
	float throttle_exp_brake;
	thr_exp_mode throttle_exp_mode;
	float ramp_time_pos;
	float ramp_time_neg;
	bool multi_esc;
	bool tc;
	float tc_max_diff;
	uint32_t update_rate_hz;
} adc_config;


#define EEPROM_VARS_HW			64
#define EEPROM_VARS_CUSTOM		64

#endif /* DATATYPES_H_ */
