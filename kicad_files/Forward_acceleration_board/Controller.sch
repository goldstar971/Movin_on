EESchema Schematic File Version 4
LIBS:Forward_acceleration_board-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L STM32F205RBT6:STM32F205RBT6 Accel_mc1
U 1 1 5D9E4EAD
P 4250 2850
F 0 "Accel_mc1" H 6300 1150 50  0000 L CNN
F 1 "STM32F205RBT6" H 6200 950 50  0000 L CNN
F 2 "STM32F205RBT6:QFP50P1200X1200X160-64N" H 6200 3350 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/STM32F205RBT6.pdf" H 6200 3250 50  0001 L CNN
F 4 "" H 6200 3150 50  0001 L CNN "Description"
F 5 "1.6" H 6200 3050 50  0001 L CNN "Height"
F 6 "511-STM32F205RBT6" H 6200 2950 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=511-STM32F205RBT6" H 6200 2850 50  0001 L CNN "Mouser Price/Stock"
F 8 "STMicroelectronics" H 6200 2750 50  0001 L CNN "Manufacturer_Name"
F 9 "STM32F205RBT6" H 6200 2650 50  0001 L CNN "Manufacturer_Part_Number"
	1    4250 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0139
U 1 1 5DAEB2E4
P 5000 5750
F 0 "#PWR0139" H 5000 5600 50  0001 C CNN
F 1 "+3.3V" H 5015 5923 50  0000 C CNN
F 2 "" H 5000 5750 50  0001 C CNN
F 3 "" H 5000 5750 50  0001 C CNN
	1    5000 5750
	1    0    0    -1  
$EndComp
$Comp
L C3216X7R1H225K160AE:C3216X7R1H225K160AE C27
U 1 1 5DAEB7E6
P 6450 2950
F 0 "C27" H 6700 3100 50  0000 C CNN
F 1 "2.2u" H 6750 2800 50  0000 C CNN
F 2 "C3216X7R1H225K160AE:CAPC3216X180N" H 6800 3000 50  0001 L CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf" H 6800 2900 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 3216 2.2uF 50volts X7R 10% Soft Term" H 6800 2800 50  0001 L CNN "Description"
F 5 "1.8" H 6800 2700 50  0001 L CNN "Height"
F 6 "TDK" H 6800 2600 50  0001 L CNN "Manufacturer_Name"
F 7 "C3216X7R1H225K160AE" H 6800 2500 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-C3216X7R1H225KST" H 6800 2400 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-C3216X7R1H225KST" H 6800 2300 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6800 2200 50  0001 L CNN "RS Part Number"
F 11 "" H 6800 2100 50  0001 L CNN "RS Price/Stock"
	1    6450 2950
	1    0    0    -1  
$EndComp
$Comp
L C3216X7R1H225K160AE:C3216X7R1H225K160AE C24
U 1 1 5DAEB89D
P 5950 5200
F 0 "C24" V 6100 5100 50  0000 L CNN
F 1 "2.2u" V 6300 5000 50  0000 L CNN
F 2 "C3216X7R1H225K160AE:CAPC3216X180N" H 6300 5250 50  0001 L CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf" H 6300 5150 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 3216 2.2uF 50volts X7R 10% Soft Term" H 6300 5050 50  0001 L CNN "Description"
F 5 "1.8" H 6300 4950 50  0001 L CNN "Height"
F 6 "TDK" H 6300 4850 50  0001 L CNN "Manufacturer_Name"
F 7 "C3216X7R1H225K160AE" H 6300 4750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-C3216X7R1H225KST" H 6300 4650 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-C3216X7R1H225KST" H 6300 4550 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6300 4450 50  0001 L CNN "RS Part Number"
F 11 "" H 6300 4350 50  0001 L CNN "RS Price/Stock"
	1    5950 5200
	0    1    1    0   
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C23
U 1 1 5DAEB9D8
P 5000 5750
F 0 "C23" V 5204 5878 50  0000 L CNN
F 1 ".1u" V 5295 5878 50  0000 L CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 5350 5800 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 5350 5700 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 5350 5600 50  0001 L CNN "Description"
F 5 "1.45" H 5350 5500 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 5350 5400 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 5350 5300 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 5350 5200 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 5350 5100 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 5350 5000 50  0001 L CNN "RS Part Number"
F 11 "" H 5350 4900 50  0001 L CNN "RS Price/Stock"
	1    5000 5750
	0    1    1    0   
$EndComp
$Comp
L GRM155C81C105ME11J:GRM155C81C105ME11J C19
U 1 1 5DAEBCD2
P 3800 4500
F 0 "C19" V 4004 4628 50  0000 L CNN
F 1 "1u" V 4095 4628 50  0000 L CNN
F 2 "GRM155C91C105ME11J:CAPC1005X55N" H 4150 4550 50  0001 L CNN
F 3 "http://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c02e.pdf" H 4150 4450 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT" H 4150 4350 50  0001 L CNN "Description"
F 5 "0.55" H 4150 4250 50  0001 L CNN "Height"
F 6 "Murata Electronics" H 4150 4150 50  0001 L CNN "Manufacturer_Name"
F 7 "GRM155C81C105ME11J" H 4150 4050 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "81-GRM155C81C105ME1J" H 4150 3950 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=81-GRM155C81C105ME1J" H 4150 3850 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 4150 3750 50  0001 L CNN "RS Part Number"
F 11 "" H 4150 3650 50  0001 L CNN "RS Price/Stock"
	1    3800 4500
	0    1    1    0   
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C25
U 1 1 5DAEBDB8
P 6250 5200
F 0 "C25" V 6454 5328 50  0000 L CNN
F 1 ".1u" V 6545 5328 50  0000 L CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 6600 5250 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 6600 5150 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 6600 5050 50  0001 L CNN "Description"
F 5 "1.45" H 6600 4950 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 6600 4850 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 6600 4750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 6600 4650 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 6600 4550 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6600 4450 50  0001 L CNN "RS Part Number"
F 11 "" H 6600 4350 50  0001 L CNN "RS Price/Stock"
	1    6250 5200
	0    1    1    0   
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C21
U 1 1 5DAEBE00
P 4300 1800
F 0 "C21" V 4650 1950 50  0000 R CNN
F 1 ".1u" V 4450 1950 50  0000 R CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 4650 1850 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 4650 1750 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 4650 1650 50  0001 L CNN "Description"
F 5 "1.45" H 4650 1550 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 4650 1450 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 4650 1350 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 4650 1250 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 4650 1150 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 4650 1050 50  0001 L CNN "RS Part Number"
F 11 "" H 4650 950 50  0001 L CNN "RS Price/Stock"
	1    4300 1800
	0    -1   -1   0   
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C18
U 1 1 5DAEBE48
P 3400 4500
F 0 "C18" V 3604 4628 50  0000 L CNN
F 1 ".1u" V 3695 4628 50  0000 L CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 3750 4550 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 3750 4450 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 3750 4350 50  0001 L CNN "Description"
F 5 "1.45" H 3750 4250 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 3750 4150 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 3750 4050 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 3750 3950 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 3750 3850 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 3750 3750 50  0001 L CNN "RS Part Number"
F 11 "" H 3750 3650 50  0001 L CNN "RS Price/Stock"
	1    3400 4500
	0    1    1    0   
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C26
U 1 1 5DAEBE82
P 6450 2600
F 0 "C26" H 6700 2865 50  0000 C CNN
F 1 ".1u" H 6700 2774 50  0000 C CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 6800 2650 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 6800 2550 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 6800 2450 50  0001 L CNN "Description"
F 5 "1.45" H 6800 2350 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 6800 2250 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 6800 2150 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 6800 2050 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 6800 1950 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6800 1850 50  0001 L CNN "RS Part Number"
F 11 "" H 6800 1750 50  0001 L CNN "RS Price/Stock"
	1    6450 2600
	1    0    0    -1  
$EndComp
$Comp
L CGA6M3X7S2A475K200AB:CGA6M3X7S2A475K200AB C22
U 1 1 5DAEBFA7
P 4550 1800
F 0 "C22" V 4846 1672 50  0000 R CNN
F 1 "4.7u" V 4755 1672 50  0000 R CNN
F 2 "CGA6M3X7S2A475K200AB:CAPC3225X200N" H 4900 1850 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/CGA6M3X7S2A475K200AB.pdf" H 4900 1750 50  0001 L CNN
F 4 "TDK 4.7uF Multilayer Ceramic Capacitor MLCC 100V dc +/-10% X7S Dielectric 1210 (3225M) SMD, Max. Temp. +125C" H 4900 1650 50  0001 L CNN "Description"
F 5 "2" H 4900 1550 50  0001 L CNN "Height"
F 6 "TDK" H 4900 1450 50  0001 L CNN "Manufacturer_Name"
F 7 "CGA6M3X7S2A475K200AB" H 4900 1350 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-CGA6M3X7S2A475K" H 4900 1250 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-CGA6M3X7S2A475K" H 4900 1150 50  0001 L CNN "Mouser Price/Stock"
F 10 "9155415P" H 4900 1050 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/9155415P" H 4900 950 50  0001 L CNN "RS Price/Stock"
	1    4550 1800
	0    -1   -1   0   
$EndComp
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C17
U 1 1 5DAEC0D2
P 2800 3550
F 0 "C17" V 3004 3678 50  0000 L CNN
F 1 ".1u" V 3095 3678 50  0000 L CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 3150 3600 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 3150 3500 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 3150 3400 50  0001 L CNN "Description"
F 5 "1.45" H 3150 3300 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 3150 3200 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 3150 3100 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 3150 3000 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 3150 2900 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 3150 2800 50  0001 L CNN "RS Part Number"
F 11 "" H 3150 2700 50  0001 L CNN "RS Price/Stock"
	1    2800 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 3450 2800 3450
Wire Wire Line
	2800 3450 2800 3550
$Comp
L AS0805KKX7R0BB104:AS0805KKX7R0BB104 C20
U 1 1 5DAEC209
P 3900 2850
F 0 "C20" H 4150 2585 50  0000 C CNN
F 1 ".1u" H 4150 2676 50  0000 C CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 4250 2900 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 4250 2800 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 4250 2700 50  0001 L CNN "Description"
F 5 "1.45" H 4250 2600 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 4250 2500 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 4250 2400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 4250 2300 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 4250 2200 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 4250 2100 50  0001 L CNN "RS Part Number"
F 11 "" H 4250 2000 50  0001 L CNN "RS Price/Stock"
	1    3900 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	4250 2850 4100 2850
$Comp
L power:GND #PWR0140
U 1 1 5DAEC2EE
P 3400 2850
F 0 "#PWR0140" H 3400 2600 50  0001 C CNN
F 1 "GND" H 3405 2677 50  0000 C CNN
F 2 "" H 3400 2850 50  0001 C CNN
F 3 "" H 3400 2850 50  0001 C CNN
	1    3400 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0141
U 1 1 5DAEC344
P 2800 4050
F 0 "#PWR0141" H 2800 3800 50  0001 C CNN
F 1 "GND" H 2805 3877 50  0000 C CNN
F 2 "" H 2800 4050 50  0001 C CNN
F 3 "" H 2800 4050 50  0001 C CNN
	1    2800 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 4050 3800 4050
Wire Wire Line
	3800 4050 3800 4500
Wire Wire Line
	4250 3950 4100 3950
Wire Wire Line
	4100 3950 4100 5000
Wire Wire Line
	3400 5000 3650 5000
Wire Wire Line
	3800 4500 3400 4500
Connection ~ 3800 4500
$Comp
L power:GND #PWR0142
U 1 1 5DAEC7F0
P 3650 5000
F 0 "#PWR0142" H 3650 4750 50  0001 C CNN
F 1 "GND" H 3655 4827 50  0000 C CNN
F 2 "" H 3650 5000 50  0001 C CNN
F 3 "" H 3650 5000 50  0001 C CNN
	1    3650 5000
	1    0    0    -1  
$EndComp
Text HLabel 2800 3450 0    50   Input ~ 0
NRST
Wire Wire Line
	4650 6250 4650 5050
$Comp
L power:GND #PWR0143
U 1 1 5DAED4B8
P 4700 6250
F 0 "#PWR0143" H 4700 6000 50  0001 C CNN
F 1 "GND" H 4705 6077 50  0000 C CNN
F 2 "" H 4700 6250 50  0001 C CNN
F 3 "" H 4700 6250 50  0001 C CNN
	1    4700 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 6250 4650 6250
Wire Wire Line
	5950 5050 5950 5200
$Comp
L power:GND #PWR0144
U 1 1 5DAED74A
P 5950 5750
F 0 "#PWR0144" H 5950 5500 50  0001 C CNN
F 1 "GND" H 5955 5577 50  0000 C CNN
F 2 "" H 5950 5750 50  0001 C CNN
F 3 "" H 5950 5750 50  0001 C CNN
	1    5950 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 5050 6250 5050
Wire Wire Line
	6250 5050 6250 5200
Wire Wire Line
	6250 5700 5950 5700
Wire Wire Line
	5950 5700 5950 5750
Connection ~ 5950 5700
Wire Wire Line
	6350 2950 6450 2950
Wire Wire Line
	6350 2850 6400 2850
Wire Wire Line
	6450 2850 6450 2600
$Comp
L power:GND #PWR0145
U 1 1 5DAEF041
P 7150 2750
F 0 "#PWR0145" H 7150 2500 50  0001 C CNN
F 1 "GND" V 7155 2622 50  0000 R CNN
F 2 "" H 7150 2750 50  0001 C CNN
F 3 "" H 7150 2750 50  0001 C CNN
	1    7150 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6950 2600 6950 2750
Wire Wire Line
	7150 2750 6950 2750
Connection ~ 6950 2750
Wire Wire Line
	6950 2750 6950 2950
Wire Wire Line
	4550 2150 4550 2050
Wire Wire Line
	4550 1800 4300 1800
Connection ~ 4550 1800
Wire Wire Line
	4650 2150 4650 1750
Wire Wire Line
	4650 1750 4900 1750
Wire Wire Line
	4900 1750 4900 1300
Wire Wire Line
	4900 1300 4750 1300
Wire Wire Line
	4300 1300 4550 1300
Connection ~ 4550 1300
$Comp
L power:GND #PWR0146
U 1 1 5DAF0B67
P 4750 1300
F 0 "#PWR0146" H 4750 1050 50  0001 C CNN
F 1 "GND" H 4755 1127 50  0000 C CNN
F 2 "" H 4750 1300 50  0001 C CNN
F 3 "" H 4750 1300 50  0001 C CNN
	1    4750 1300
	-1   0    0    1   
$EndComp
Connection ~ 4750 1300
Wire Wire Line
	4750 1300 4550 1300
Text HLabel 4250 4150 0    50   Input ~ 0
Top_left_FSR_out
Text HLabel 4250 4250 0    50   Input ~ 0
Middle_left_FSR_out
Text HLabel 4250 4350 0    50   Input ~ 0
Bottom_left_FSR_out
Text HLabel 4550 5050 3    50   Input ~ 0
Break_FSR_OUT
Text HLabel 4250 3550 0    50   Input ~ 0
Top_right_FSR_out
Text HLabel 4250 3650 0    50   Input ~ 0
Middle_right_FSR_out
Text HLabel 4250 3750 0    50   Input ~ 0
Bottom_right_FSR_out
Text HLabel 4250 3050 0    50   Input ~ 0
IMU_data_ready
Text HLabel 5050 2150 1    50   Input ~ 0
SDA
Text HLabel 5150 2150 1    50   Input ~ 0
SCL
Text HLabel 4750 2150 1    50   Input ~ 0
CAN_TX
Text HLabel 4850 2150 1    50   Input ~ 0
CAN_RX
Connection ~ 4700 6250
Wire Wire Line
	4750 5050 4750 5750
Wire Wire Line
	4700 6250 5000 6250
Wire Wire Line
	4750 5750 5000 5750
Connection ~ 5000 5750
$Comp
L power:+3.3V #PWR0147
U 1 1 5DAF867A
P 6250 5050
F 0 "#PWR0147" H 6250 4900 50  0001 C CNN
F 1 "+3.3V" H 6265 5223 50  0000 C CNN
F 2 "" H 6250 5050 50  0001 C CNN
F 3 "" H 6250 5050 50  0001 C CNN
	1    6250 5050
	1    0    0    -1  
$EndComp
Connection ~ 6250 5050
$Comp
L power:+3.3V #PWR0148
U 1 1 5DAF86B5
P 3400 4500
F 0 "#PWR0148" H 3400 4350 50  0001 C CNN
F 1 "+3.3V" V 3415 4628 50  0000 L CNN
F 2 "" H 3400 4500 50  0001 C CNN
F 3 "" H 3400 4500 50  0001 C CNN
	1    3400 4500
	0    -1   -1   0   
$EndComp
Connection ~ 3400 4500
$Comp
L power:+3.3V #PWR0149
U 1 1 5DAF87A4
P 4100 2850
F 0 "#PWR0149" H 4100 2700 50  0001 C CNN
F 1 "+3.3V" H 4115 3023 50  0000 C CNN
F 2 "" H 4100 2850 50  0001 C CNN
F 3 "" H 4100 2850 50  0001 C CNN
	1    4100 2850
	1    0    0    -1  
$EndComp
Connection ~ 4100 2850
Wire Wire Line
	4100 2850 3900 2850
$Comp
L power:+3.3V #PWR0150
U 1 1 5DAF8835
P 6400 2850
F 0 "#PWR0150" H 6400 2700 50  0001 C CNN
F 1 "+3.3V" H 6415 3023 50  0000 C CNN
F 2 "" H 6400 2850 50  0001 C CNN
F 3 "" H 6400 2850 50  0001 C CNN
	1    6400 2850
	1    0    0    -1  
$EndComp
Connection ~ 6400 2850
Wire Wire Line
	6400 2850 6450 2850
$Comp
L power:+3.3V #PWR0151
U 1 1 5DAF88C6
P 4550 2050
F 0 "#PWR0151" H 4550 1900 50  0001 C CNN
F 1 "+3.3V" V 4565 2178 50  0000 L CNN
F 2 "" H 4550 2050 50  0001 C CNN
F 3 "" H 4550 2050 50  0001 C CNN
	1    4550 2050
	0    -1   -1   0   
$EndComp
Connection ~ 4550 2050
Wire Wire Line
	4550 2050 4550 1800
Text HLabel 6050 2150 1    50   Input ~ 0
SWCLK
Text HLabel 6350 3050 2    50   Input ~ 0
SWDIO
NoConn ~ 6350 3150
NoConn ~ 6350 3250
NoConn ~ 6350 3350
NoConn ~ 6350 3450
NoConn ~ 6350 3550
NoConn ~ 6350 3650
NoConn ~ 6350 3750
NoConn ~ 6350 3850
NoConn ~ 6350 3950
NoConn ~ 6350 4050
NoConn ~ 6350 4150
NoConn ~ 6350 4250
NoConn ~ 6350 4350
NoConn ~ 4950 2150
NoConn ~ 4250 2950
NoConn ~ 4250 3150
NoConn ~ 4250 3250
NoConn ~ 4250 3350
NoConn ~ 4250 3850
NoConn ~ 5250 2150
NoConn ~ 5350 2150
NoConn ~ 5450 2150
NoConn ~ 5550 2150
NoConn ~ 5650 2150
NoConn ~ 5750 2150
NoConn ~ 5850 2150
NoConn ~ 5950 2150
NoConn ~ 4950 5050
NoConn ~ 5050 5050
NoConn ~ 5150 5050
NoConn ~ 5250 5050
NoConn ~ 5350 5050
NoConn ~ 5450 5050
NoConn ~ 5550 5050
NoConn ~ 5650 5050
NoConn ~ 5750 5050
NoConn ~ 5850 5050
NoConn ~ 4850 5050
Wire Wire Line
	4100 5000 3800 5000
Connection ~ 3650 5000
Connection ~ 3800 5000
Wire Wire Line
	3800 5000 3650 5000
$EndSCHEMATC