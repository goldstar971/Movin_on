EESchema Schematic File Version 4
LIBS:DSC_motor_controller-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "BLDC Motor Controller"
Date "2019-10-03"
Rev "1"
Comp "P13905 Movin On"
Comment1 "Matthew Gould"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L STM32F765VIT6:STM32F765VIT6 DSC?
U 1 1 5D33B539
P 3850 2250
AR Path="/5D33B539" Ref="DSC?"  Part="1" 
AR Path="/5D33B4C0/5D33B539" Ref="DSC1"  Part="1" 
F 0 "DSC1" H 6750 -500 50  0000 L CNN
F 1 "STM32F765VIT6" H 6750 -650 50  0000 L CNN
F 2 "STM32F765VIT6:QFP50P1600X1600X160-100N" H 6700 2750 50  0001 L CNN
F 3 "https://www.st.com/resource/en/datasheet/stm32f765vi.pdf" H 6700 2650 50  0001 L CNN
F 4 "STMICROELECTRONICS - STM32F765VIT6 - MCU, ARM CORTEX-M7, 216MHZ, LQFP-100" H 6700 2550 50  0001 L CNN "Description"
F 5 "1.6" H 6700 2450 50  0001 L CNN "Height"
F 6 "STMicroelectronics" H 6700 2350 50  0001 L CNN "Manufacturer_Name"
F 7 "STM32F765VIT6" H 6700 2250 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "511-STM32F765VIT6" H 6700 2150 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=511-STM32F765VIT6" H 6700 2050 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6700 1950 50  0001 L CNN "RS Part Number"
F 11 "" H 6700 1850 50  0001 L CNN "RS Price/Stock"
	1    3850 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4150 3850 4250
Wire Wire Line
	6550 5350 6550 5700
Wire Wire Line
	6850 2250 7000 2250
Text HLabel 3850 2950 0    50   Output ~ 0
LED_Green
Text HLabel 3850 3050 0    50   Output ~ 0
LED_Red
Text HLabel 3850 3550 0    50   Input ~ 0
NRST
Text HLabel 3850 3650 0    50   Input ~ 0
Curr_A
Text HLabel 3850 3750 0    50   Input ~ 0
Curr_B
Text HLabel 3850 3850 0    50   Input ~ 0
Curr_C
Text HLabel 3850 3950 0    50   Input ~ 0
Batt_voltage
Text HLabel 3850 4450 0    50   Input ~ 0
Volt_A
Text HLabel 3850 4550 0    50   Input ~ 0
Volt_B
Text HLabel 4350 5350 3    50   Input ~ 0
Volt_C
Text HLabel 4450 5350 3    50   Input ~ 0
Temp_sense
Text HLabel 5350 5350 3    50   Output ~ 0
PWM_C_L
Text HLabel 5450 5350 3    50   Output ~ 0
PWM_C_H
Text HLabel 5550 5350 3    50   Output ~ 0
PWM_B_L
Text HLabel 5650 5350 3    50   Output ~ 0
PWM_B_H
Text HLabel 5750 5350 3    50   Output ~ 0
PWM_A_L
Text HLabel 5850 5350 3    50   Output ~ 0
PWM_A_H
Text HLabel 5950 5350 3    50   Output ~ 0
EN_Gate
Text HLabel 6050 5350 3    50   Input ~ 0
Fault
Text HLabel 6150 5350 3    50   Output ~ 0
SCL
Text HLabel 6250 5350 3    50   Output ~ 0
SDA
Text HLabel 6850 2750 2    50   Input ~ 0
CAN_RX
Text HLabel 6850 2650 2    50   Output ~ 0
CAN_TX
Text HLabel 6850 2550 2    50   BiDi ~ 0
SWDIO
Text HLabel 6550 1550 1    50   Input ~ 0
SWCLK
$Comp
L GRM155C81C105ME11J:GRM155C81C105ME11J C35
U 1 1 5D33BFEE
P 2100 4550
F 0 "C35" H 2350 4700 50  0000 C CNN
F 1 "1u" H 2350 4400 50  0000 C CNN
F 2 "GRM155C91C105ME11J:CAPC1005X55N" H 2450 4600 50  0001 L CNN
F 3 "http://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c02e.pdf" H 2450 4500 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT" H 2450 4400 50  0001 L CNN "Description"
F 5 "0.55" H 2450 4300 50  0001 L CNN "Height"
F 6 "Murata Electronics" H 2450 4200 50  0001 L CNN "Manufacturer_Name"
F 7 "GRM155C81C105ME11J" H 2450 4100 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "81-GRM155C81C105ME1J" H 2450 4000 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=81-GRM155C81C105ME1J" H 2450 3900 50  0001 L CNN "Mouser Price/Stock"
	1    2100 4550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2100 4050 2350 4050
$Comp
L C3216X7R1H225K160AE:C3216X7R1H225K160AE C37
U 1 1 5D33FBF9
P 8550 2750
F 0 "C37" H 8800 2900 50  0000 C CNN
F 1 "2.2u" H 8850 2600 50  0000 C CNN
F 2 "C3216X7R1H225K160AE:CAPC3216X180N" H 8900 2800 50  0001 L CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf" H 8900 2700 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 3216 2.2uF 50volts X7R 10% Soft Term" H 8900 2600 50  0001 L CNN "Description"
F 5 "1.8" H 8900 2500 50  0001 L CNN "Height"
F 6 "TDK" H 8900 2400 50  0001 L CNN "Manufacturer_Name"
F 7 "C3216X7R1H225K160AE" H 8900 2300 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-C3216X7R1H225KST" H 8900 2200 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-C3216X7R1H225KST" H 8900 2100 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 8900 2000 50  0001 L CNN "RS Part Number"
F 11 "" H 8900 1900 50  0001 L CNN "RS Price/Stock"
	1    8550 2750
	0    -1   -1   0   
$EndComp
$Comp
L C3216X7R1H225K160AE:C3216X7R1H225K160AE C36
U 1 1 5D33FC4F
P 7400 6350
F 0 "C36" H 7650 6550 50  0000 C CNN
F 1 "2.2u" H 7650 6200 50  0000 C CNN
F 2 "C3216X7R1H225K160AE:CAPC3216X180N" H 7750 6400 50  0001 L CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf" H 7750 6300 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 3216 2.2uF 50volts X7R 10% Soft Term" H 7750 6200 50  0001 L CNN "Description"
F 5 "1.8" H 7750 6100 50  0001 L CNN "Height"
F 6 "TDK" H 7750 6000 50  0001 L CNN "Manufacturer_Name"
F 7 "C3216X7R1H225K160AE" H 7750 5900 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-C3216X7R1H225KST" H 7750 5800 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-C3216X7R1H225KST" H 7750 5700 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 7750 5600 50  0001 L CNN "RS Part Number"
F 11 "" H 7750 5500 50  0001 L CNN "RS Price/Stock"
	1    7400 6350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6850 2450 8050 2450
Wire Wire Line
	8050 2450 8050 2750
Wire Wire Line
	8050 2750 8550 2750
Wire Wire Line
	7950 2350 7950 2250
Wire Wire Line
	7950 2250 8200 2250
Wire Wire Line
	6850 2350 7750 2350
Wire Wire Line
	6350 6350 6350 5350
Wire Wire Line
	7400 5850 6450 5850
Wire Wire Line
	6450 5350 6450 5850
$Comp
L CGA6M3X7S2A475K200AB:CGA6M3X7S2A475K200AB C38
U 1 1 5D341643
P 1900 2750
F 0 "C38" H 2250 2950 50  0000 R CNN
F 1 "4.7u" H 2250 2550 50  0000 R CNN
F 2 "CGA5M3X7S2A475K200AB:CAPC3225X200N" H 2250 2800 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/CGA6M3X7S2A475K200AB.pdf" H 2250 2700 50  0001 L CNN
F 4 "TDK 4.7uF Multilayer Ceramic Capacitor MLCC 100V dc +/-10% X7S Dielectric 1210 (3225M) SMD, Max. Temp. +125C" H 2250 2600 50  0001 L CNN "Description"
F 5 "2" H 2250 2500 50  0001 L CNN "Height"
F 6 "TDK" H 2250 2400 50  0001 L CNN "Manufacturer_Name"
F 7 "CGA6M3X7S2A475K200AB" H 2250 2300 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-CGA6M3X7S2A475K" H 2250 2200 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-CGA6M3X7S2A475K" H 2250 2100 50  0001 L CNN "Mouser Price/Stock"
F 10 "9155415P" H 2250 2000 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/9155415P" H 2250 1900 50  0001 L CNN "RS Price/Stock"
	1    1900 2750
	0    -1   -1   0   
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C45
U 1 1 5D341A3F
P 4200 800
F 0 "C45" H 4450 650 50  0000 C CNN
F 1 "100n" H 4450 974 50  0000 C CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 4550 850 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 4550 750 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 4550 650 50  0001 L CNN "Description"
F 5 "1.45" H 4550 550 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 4550 450 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 4550 350 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 4550 250 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 4550 150 50  0001 L CNN "Mouser Price/Stock"
	1    4200 800 
	1    0    0    -1  
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C44
U 1 1 5D341B54
P 7750 1850
F 0 "C44" H 8050 1700 50  0000 R CNN
F 1 "100n" H 8100 2050 50  0000 R CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 8100 1900 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 8100 1800 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 8100 1700 50  0001 L CNN "Description"
F 5 "1.45" H 8100 1600 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 8100 1500 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 8100 1400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 8100 1300 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 8100 1200 50  0001 L CNN "Mouser Price/Stock"
	1    7750 1850
	0    1    1    0   
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C43
U 1 1 5D341BAB
P 8050 5350
F 0 "C43" H 8350 5550 50  0000 R CNN
F 1 "100n" H 8400 5150 50  0000 R CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 8400 5400 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 8400 5300 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 8400 5200 50  0001 L CNN "Description"
F 5 "1.45" H 8400 5100 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 8400 5000 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 8400 4900 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 8400 4800 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 8400 4700 50  0001 L CNN "Mouser Price/Stock"
	1    8050 5350
	0    1    1    0   
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C40
U 1 1 5D341BDE
P 2550 2750
F 0 "C40" H 2800 2950 50  0000 C CNN
F 1 "100n" H 2800 2600 50  0000 C CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 2900 2800 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 2900 2700 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 2900 2600 50  0001 L CNN "Description"
F 5 "1.45" H 2900 2500 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 2900 2400 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 2900 2300 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 2900 2200 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 2900 2100 50  0001 L CNN "Mouser Price/Stock"
	1    2550 2750
	0    -1   -1   0   
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C39
U 1 1 5D341C13
P 3150 2750
F 0 "C39" H 3400 2600 50  0000 C CNN
F 1 "100n" H 3400 2924 50  0000 C CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 3500 2800 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 3500 2700 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 3500 2600 50  0001 L CNN "Description"
F 5 "1.45" H 3500 2500 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 3500 2400 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 3500 2300 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 3500 2200 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 3500 2100 50  0001 L CNN "Mouser Price/Stock"
	1    3150 2750
	0    -1   -1   0   
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C41
U 1 1 5D341CBA
P 2750 4550
F 0 "C41" H 3000 4700 50  0000 C CNN
F 1 "100n" H 3000 4400 50  0000 C CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 3100 4600 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 3100 4500 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 3100 4400 50  0001 L CNN "Description"
F 5 "1.45" H 3100 4300 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 3100 4200 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 3100 4100 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 3100 4000 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 3100 3900 50  0001 L CNN "Mouser Price/Stock"
	1    2750 4550
	0    -1   -1   0   
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C42
U 1 1 5D341D0D
P 4500 6650
F 0 "C42" H 4750 6800 50  0000 C CNN
F 1 "100n" H 4750 6500 50  0000 C CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 4850 6700 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 4850 6600 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 4850 6500 50  0001 L CNN "Description"
F 5 "1.45" H 4850 6400 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 4850 6300 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 4850 6200 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 4850 6100 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 4850 6000 50  0001 L CNN "Mouser Price/Stock"
	1    4500 6650
	-1   0    0    1   
$EndComp
Connection ~ 2750 4050
Wire Wire Line
	2750 4050 3850 4050
Wire Wire Line
	3250 4550 3250 4250
Wire Wire Line
	3250 4250 3850 4250
Wire Wire Line
	2100 4550 2750 4550
Connection ~ 2750 4550
Wire Wire Line
	2750 4550 2950 4550
Connection ~ 3850 4250
Wire Wire Line
	3150 2750 3200 2750
Wire Wire Line
	1900 3250 2550 3250
Connection ~ 2550 3250
Wire Wire Line
	2550 3250 2900 3250
Wire Wire Line
	2850 2250 2550 2250
Wire Wire Line
	2850 3150 3850 3150
Connection ~ 2550 2250
Wire Wire Line
	2550 2250 1900 2250
Wire Wire Line
	3150 2250 2850 2250
Connection ~ 2850 2250
Wire Wire Line
	2550 2750 2550 3250
Wire Wire Line
	2850 2250 2850 3150
Wire Wire Line
	1900 2750 1900 3250
Wire Wire Line
	4250 5350 4250 6250
Wire Wire Line
	4150 6250 4150 5350
Wire Wire Line
	4150 6250 4000 6250
Wire Wire Line
	4000 6250 4000 6650
Wire Wire Line
	4500 6250 4500 6450
Wire Wire Line
	4250 6250 4500 6250
Wire Wire Line
	7400 5850 7950 5850
Connection ~ 7400 5850
Wire Wire Line
	6550 5700 7500 5700
Wire Wire Line
	7500 5700 7500 5350
Wire Wire Line
	7500 5350 7700 5350
Connection ~ 7750 2350
Wire Wire Line
	7750 2350 7950 2350
Wire Wire Line
	7200 2250 7200 1850
Wire Wire Line
	7200 1850 7750 1850
Wire Wire Line
	4700 1050 4700 800 
Wire Wire Line
	4250 1050 4250 1550
Wire Wire Line
	4200 800  4150 800 
Wire Wire Line
	4150 800  4150 1300
$Comp
L DSC_motor_controller-rescue:+3.3V-power #PWR0111
U 1 1 5D34B8C4
P 7700 5350
AR Path="/5D34B8C4" Ref="#PWR0111"  Part="1" 
AR Path="/5D33B4C0/5D34B8C4" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 7700 5200 50  0001 C CNN
F 1 "+3.3V" H 7715 5523 50  0000 C CNN
F 2 "" H 7700 5350 50  0001 C CNN
F 3 "" H 7700 5350 50  0001 C CNN
	1    7700 5350
	1    0    0    -1  
$EndComp
Connection ~ 7700 5350
Wire Wire Line
	7700 5350 8050 5350
$Comp
L DSC_motor_controller-rescue:+3.3V-power #PWR0112
U 1 1 5D34B9BC
P 7000 2250
AR Path="/5D34B9BC" Ref="#PWR0112"  Part="1" 
AR Path="/5D33B4C0/5D34B9BC" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 7000 2100 50  0001 C CNN
F 1 "+3.3V" H 7015 2423 50  0000 C CNN
F 2 "" H 7000 2250 50  0001 C CNN
F 3 "" H 7000 2250 50  0001 C CNN
	1    7000 2250
	1    0    0    -1  
$EndComp
Connection ~ 7000 2250
Wire Wire Line
	7000 2250 7200 2250
$Comp
L DSC_motor_controller-rescue:+3.3V-power #PWR0113
U 1 1 5D34BA59
P 4150 1300
AR Path="/5D34BA59" Ref="#PWR0113"  Part="1" 
AR Path="/5D33B4C0/5D34BA59" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 4150 1150 50  0001 C CNN
F 1 "+3.3V" V 4165 1428 50  0000 L CNN
F 2 "" H 4150 1300 50  0001 C CNN
F 3 "" H 4150 1300 50  0001 C CNN
	1    4150 1300
	0    -1   -1   0   
$EndComp
Connection ~ 4150 1300
Wire Wire Line
	4150 1300 4150 1550
$Comp
L DSC_motor_controller-rescue:+3.3V-power #PWR0114
U 1 1 5D34BBE6
P 2900 3250
AR Path="/5D34BBE6" Ref="#PWR0114"  Part="1" 
AR Path="/5D33B4C0/5D34BBE6" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 2900 3100 50  0001 C CNN
F 1 "+3.3V" H 2915 3423 50  0000 C CNN
F 2 "" H 2900 3250 50  0001 C CNN
F 3 "" H 2900 3250 50  0001 C CNN
	1    2900 3250
	-1   0    0    1   
$EndComp
Connection ~ 2900 3250
Wire Wire Line
	2900 3250 3200 3250
Wire Wire Line
	3200 2750 3200 3250
Connection ~ 3200 2750
Wire Wire Line
	3200 2750 3850 2750
Connection ~ 3200 3250
Wire Wire Line
	3200 3250 3850 3250
$Comp
L DSC_motor_controller-rescue:+3.3V-power #PWR0115
U 1 1 5D34C866
P 2950 4550
AR Path="/5D34C866" Ref="#PWR0115"  Part="1" 
AR Path="/5D33B4C0/5D34C866" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 2950 4400 50  0001 C CNN
F 1 "+3.3V" H 2965 4723 50  0000 C CNN
F 2 "" H 2950 4550 50  0001 C CNN
F 3 "" H 2950 4550 50  0001 C CNN
	1    2950 4550
	-1   0    0    1   
$EndComp
Connection ~ 2950 4550
Wire Wire Line
	2950 4550 3250 4550
$Comp
L DSC_motor_controller-rescue:+3.3V-power #PWR0116
U 1 1 5D34C8C7
P 4500 6450
AR Path="/5D34C8C7" Ref="#PWR0116"  Part="1" 
AR Path="/5D33B4C0/5D34C8C7" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 4500 6300 50  0001 C CNN
F 1 "+3.3V" V 4515 6578 50  0000 L CNN
F 2 "" H 4500 6450 50  0001 C CNN
F 3 "" H 4500 6450 50  0001 C CNN
	1    4500 6450
	0    1    1    0   
$EndComp
Connection ~ 4500 6450
Wire Wire Line
	4500 6450 4500 6650
$Comp
L DSC_motor_controller-rescue:GND-power #PWR0117
U 1 1 5D34C9FE
P 4100 6350
F 0 "#PWR0117" H 4100 6100 50  0001 C CNN
F 1 "GND" H 4105 6177 50  0000 C CNN
F 2 "" H 4100 6350 50  0001 C CNN
F 3 "" H 4100 6350 50  0001 C CNN
	1    4100 6350
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:GND-power #PWR0118
U 1 1 5D34CA88
P 8200 2250
F 0 "#PWR0118" H 8200 2000 50  0001 C CNN
F 1 "GND" H 8205 2077 50  0000 C CNN
F 2 "" H 8200 2250 50  0001 C CNN
F 3 "" H 8200 2250 50  0001 C CNN
	1    8200 2250
	-1   0    0    1   
$EndComp
$Comp
L DSC_motor_controller-rescue:GND-power #PWR0119
U 1 1 5D34CAD8
P 1900 2250
F 0 "#PWR0119" H 1900 2000 50  0001 C CNN
F 1 "GND" H 1905 2077 50  0000 C CNN
F 2 "" H 1900 2250 50  0001 C CNN
F 3 "" H 1900 2250 50  0001 C CNN
	1    1900 2250
	-1   0    0    1   
$EndComp
$Comp
L DSC_motor_controller-rescue:GND-power #PWR0120
U 1 1 5D34CB00
P 4700 800
F 0 "#PWR0120" H 4700 550 50  0001 C CNN
F 1 "GND" V 4705 672 50  0000 R CNN
F 2 "" H 4700 800 50  0001 C CNN
F 3 "" H 4700 800 50  0001 C CNN
	1    4700 800 
	0    -1   -1   0   
$EndComp
$Comp
L DSC_motor_controller-rescue:GND-power #PWR0121
U 1 1 5D34CB28
P 7950 5850
F 0 "#PWR0121" H 7950 5600 50  0001 C CNN
F 1 "GND" H 7955 5677 50  0000 C CNN
F 2 "" H 7950 5850 50  0001 C CNN
F 3 "" H 7950 5850 50  0001 C CNN
	1    7950 5850
	1    0    0    -1  
$EndComp
Connection ~ 7950 5850
Wire Wire Line
	7950 5850 8050 5850
Connection ~ 1900 2250
Connection ~ 4700 800 
Wire Wire Line
	6350 6350 7400 6350
Connection ~ 8200 2250
Wire Wire Line
	8200 2250 8550 2250
NoConn ~ 3850 2250
NoConn ~ 3850 2350
NoConn ~ 3850 2450
NoConn ~ 3850 2550
NoConn ~ 3850 2650
NoConn ~ 3850 2850
NoConn ~ 3850 3350
NoConn ~ 3850 3450
NoConn ~ 3850 4350
NoConn ~ 3850 4650
NoConn ~ 4550 5350
NoConn ~ 4650 5350
NoConn ~ 4750 5350
NoConn ~ 4850 5350
NoConn ~ 4950 5350
NoConn ~ 5050 5350
NoConn ~ 5150 5350
NoConn ~ 5250 5350
NoConn ~ 6850 4650
NoConn ~ 6850 2850
NoConn ~ 6850 2950
NoConn ~ 6850 3050
NoConn ~ 6850 3150
NoConn ~ 6850 3250
NoConn ~ 6850 3350
NoConn ~ 6850 3450
NoConn ~ 6850 3550
NoConn ~ 6850 3650
NoConn ~ 6850 3750
NoConn ~ 6850 3850
NoConn ~ 6850 3950
NoConn ~ 6850 4050
NoConn ~ 6850 4150
NoConn ~ 6850 4250
NoConn ~ 6850 4350
NoConn ~ 6850 4450
NoConn ~ 6850 4550
NoConn ~ 4350 1550
NoConn ~ 4450 1550
NoConn ~ 4550 1550
NoConn ~ 4650 1550
NoConn ~ 4850 1550
NoConn ~ 4950 1550
NoConn ~ 5050 1550
NoConn ~ 5150 1550
NoConn ~ 5250 1550
NoConn ~ 5350 1550
NoConn ~ 5450 1550
NoConn ~ 5550 1550
NoConn ~ 5650 1550
NoConn ~ 5750 1550
NoConn ~ 5850 1550
NoConn ~ 5950 1550
NoConn ~ 6050 1550
NoConn ~ 6150 1550
NoConn ~ 6250 1550
NoConn ~ 6350 1550
NoConn ~ 6450 1550
Wire Wire Line
	4750 1050 4750 1550
Wire Wire Line
	4250 1050 4700 1050
Connection ~ 4700 1050
Wire Wire Line
	4700 1050 4750 1050
$Comp
L DSC_motor_controller-rescue:GND-power #PWR0122
U 1 1 5D495BE6
P 2350 4050
F 0 "#PWR0122" H 2350 3800 50  0001 C CNN
F 1 "GND" H 2355 3877 50  0000 C CNN
F 2 "" H 2350 4050 50  0001 C CNN
F 3 "" H 2350 4050 50  0001 C CNN
	1    2350 4050
	-1   0    0    1   
$EndComp
Connection ~ 2350 4050
Wire Wire Line
	2350 4050 2750 4050
$EndSCHEMATC
