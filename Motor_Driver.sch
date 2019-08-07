EESchema Schematic File Version 4
LIBS:DSC_motor_controller-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
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
L DSC_motor_controller-rescue:TC2117-3.3VDBTR-TC2117-3.3VDBTR Reg1
U 1 1 5D34C356
P 2850 6800
F 0 "Reg1" H 3450 6950 50  0000 C CNN
F 1 "TC2117" H 3450 6500 50  0000 C CNN
F 2 "TC2117:SOT230P700X180-4N" H 4000 6900 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/2/TC2117-3.3VDBTR.pdf" H 4000 6800 50  0001 L CNN
F 4 "Microchip TC2117-3.3VDBTR, LDO Voltage Regulator, 800mA, 3.3 V +/-0.5%, 2.7  6 Vin, 3-Pin SOT-223" H 4000 6700 50  0001 L CNN "Description"
F 5 "1.8" H 4000 6600 50  0001 L CNN "Height"
F 6 "Microchip" H 4000 6500 50  0001 L CNN "Manufacturer_Name"
F 7 "TC2117-3.3VDBTR" H 4000 6400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "579-TC2117-3.3VDBTR" H 4000 6300 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=579-TC2117-3.3VDBTR" H 4000 6200 50  0001 L CNN "Mouser Price/Stock"
F 10 "8234434" H 4000 6100 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/8234434" H 4000 6000 50  0001 L CNN "RS Price/Stock"
	1    2850 6800
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:GRM155C81C105ME11J-GRM155C81C105ME11J C2
U 1 1 5D34C7D9
P 4400 6800
F 0 "C2" H 4650 6950 50  0000 C CNN
F 1 "1u" H 4650 6650 50  0000 C CNN
F 2 "GRM155C91C105ME11J:CAPC1005X55N" H 4750 6850 50  0001 L CNN
F 3 "http://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c02e.pdf" H 4750 6750 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT" H 4750 6650 50  0001 L CNN "Description"
F 5 "0.55" H 4750 6550 50  0001 L CNN "Height"
F 6 "Murata Electronics" H 4750 6450 50  0001 L CNN "Manufacturer_Name"
F 7 "GRM155C81C105ME11J" H 4750 6350 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "81-GRM155C81C105ME1J" H 4750 6250 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=81-GRM155C81C105ME1J" H 4750 6150 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 0   0   50  0001 C CNN "RS Part Number"
F 11 "" H 0   0   50  0001 C CNN "RS Price/Stock"
	1    4400 6800
	0    1    1    0   
$EndComp
$Comp
L DSC_motor_controller-rescue:GRM155C81C105ME11J-GRM155C81C105ME11J C3
U 1 1 5D34C879
P 2350 7450
F 0 "C3" H 2600 7600 50  0000 C CNN
F 1 "1u" H 2600 7300 50  0000 C CNN
F 2 "GRM155C91C105ME11J:CAPC1005X55N" H 2700 7500 50  0001 L CNN
F 3 "http://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c02e.pdf" H 2700 7400 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT" H 2700 7300 50  0001 L CNN "Description"
F 5 "0.55" H 2700 7200 50  0001 L CNN "Height"
F 6 "Murata Electronics" H 2700 7100 50  0001 L CNN "Manufacturer_Name"
F 7 "GRM155C81C105ME11J" H 2700 7000 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "81-GRM155C81C105ME1J" H 2700 6900 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=81-GRM155C81C105ME1J" H 2700 6800 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 2700 6700 50  0001 L CNN "RS Part Number"
F 11 "" H 2700 6600 50  0001 L CNN "RS Price/Stock"
	1    2350 7450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5D34CB08
P 2600 6550
F 0 "#PWR0125" H 2600 6300 50  0001 C CNN
F 1 "GND" H 2605 6377 50  0000 C CNN
F 2 "" H 2600 6550 50  0001 C CNN
F 3 "" H 2600 6550 50  0001 C CNN
	1    2600 6550
	-1   0    0    1   
$EndComp
$Comp
L DSC_motor_controller-rescue:+5V-BLDC_4-cache #PWR0126
U 1 1 5D34CB5D
P 4400 6800
F 0 "#PWR0126" H 4400 6650 50  0001 C CNN
F 1 "+5V" H 4415 6973 50  0000 C CNN
F 2 "" H 4400 6800 60  0000 C CNN
F 3 "" H 4400 6800 60  0000 C CNN
	1    4400 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 6800 2600 6550
Wire Wire Line
	2600 6800 2350 6800
Wire Wire Line
	2350 6800 2350 6950
Connection ~ 2600 6800
Wire Wire Line
	2850 6900 2850 7450
Wire Wire Line
	2850 7450 2750 7450
$Comp
L power:+3.3V #PWR0127
U 1 1 5D34CD49
P 2750 7450
F 0 "#PWR0127" H 2750 7300 50  0001 C CNN
F 1 "+3.3V" H 2765 7623 50  0000 C CNN
F 2 "" H 2750 7450 50  0001 C CNN
F 3 "" H 2750 7450 50  0001 C CNN
	1    2750 7450
	-1   0    0    1   
$EndComp
Connection ~ 2750 7450
Wire Wire Line
	2750 7450 2350 7450
Wire Wire Line
	2850 6800 2600 6800
Wire Wire Line
	4150 6800 4400 6800
Connection ~ 4400 6800
$Comp
L power:GND #PWR0128
U 1 1 5D34D052
P 4400 7300
F 0 "#PWR0128" H 4400 7050 50  0001 C CNN
F 1 "GND" H 4405 7127 50  0000 C CNN
F 2 "" H 4400 7300 50  0001 C CNN
F 3 "" H 4400 7300 50  0001 C CNN
	1    4400 7300
	1    0    0    -1  
$EndComp
NoConn ~ 4150 6900
$Comp
L DSC_motor_controller-rescue:DRV8302-BLDC_4-cache DRV1
U 1 1 5D363539
P 5450 4150
F 0 "DRV1" H 5450 5650 60  0000 C CNN
F 1 "DRV8302" H 5800 2600 60  0000 C CNN
F 2 "DRV8302DCAR:SOP50P810X120-57N" H 5450 4150 60  0001 C CNN
F 3 "" H 5450 4150 60  0000 C CNN
	1    5450 4150
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:RK73H1JTTD1802F-RK73H1JTTD1802F R17
U 1 1 5D363C64
P 2650 2850
F 0 "R17" H 2950 2750 50  0000 L CNN
F 1 "18k" H 2950 2850 50  0000 L CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 3200 2900 50  0001 L CNN
F 3 "http://www.koaspeer.com/catimages/Products/RK73-RT/RK73-RT.pdf" H 3200 2800 50  0001 L CNN
F 4 "Resistor Thick Film 18K 1% SMD 0603" H 3200 2700 50  0001 L CNN "Description"
F 5 "0.55" H 3200 2600 50  0001 L CNN "Height"
F 6 "KOA Speer" H 3200 2500 50  0001 L CNN "Manufacturer_Name"
F 7 "RK73H1JTTD1802F" H 3200 2400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "660-RK73H1JTTD1802F" H 3200 2300 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=660-RK73H1JTTD1802F" H 3200 2200 50  0001 L CNN "Mouser Price/Stock"
F 10 "6316698P" H 3200 2100 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/6316698P" H 3200 2000 50  0001 L CNN "RS Price/Stock"
	1    2650 2850
	0    1    -1   0   
$EndComp
$Comp
L DSC_motor_controller-rescue:CGA3E2C0G1H682J080AD-CGA3E2C0G1H682J080AD C19
U 1 1 5D363ED7
P 3500 2000
F 0 "C19" V 3850 1950 50  0000 R CNN
F 1 "6.8n" V 3650 2000 50  0000 R CNN
F 2 "CGA3E2C7R1H223K080AA:CAPC1608X90N" H 3850 2050 50  0001 L CNN
F 3 "http://docs-emea.rs-online.com/webdocs/14e9/0900766b814e9125.pdf" H 3850 1950 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 6800pF 50volts C0G 5%" H 3850 1850 50  0001 L CNN "Description"
F 5 "0.9" H 3850 1750 50  0001 L CNN "Height"
F 6 "TDK" H 3850 1650 50  0001 L CNN "Manufacturer_Name"
F 7 "CGA3E2C0G1H682J080AD" H 3850 1550 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-CGA3E2C0G1H682JD" H 3850 1450 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-CGA3E2C0G1H682JD" H 3850 1350 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 3850 1250 50  0001 L CNN "RS Part Number"
F 11 "" H 3850 1150 50  0001 L CNN "RS Price/Stock"
	1    3500 2000
	0    -1   -1   0   
$EndComp
$Comp
L DSC_motor_controller-rescue:C0603C121J5GACTU-C0603C121J5GACTU C20
U 1 1 5D3640D5
P 3850 2350
F 0 "C20" V 4200 2300 50  0000 R CNN
F 1 "120p" V 4000 2350 50  0000 R CNN
F 2 "C0603C121J5GACTU:CAPC1608X87N" H 4200 2400 50  0001 L CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1003_C0G_SMD.pdf" H 4200 2300 50  0001 L CNN
F 4 "Kemet 0603 C 120pF Ceramic Multilayer Capacitor, 50 V dc, +125C, C0G Dielectric, +/-5%" H 4200 2200 50  0001 L CNN "Description"
F 5 "0.87" H 4200 2100 50  0001 L CNN "Height"
F 6 "Kemet" H 4200 2000 50  0001 L CNN "Manufacturer_Name"
F 7 "C0603C121J5GACTU" H 4200 1900 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "80-C0603C121J5G" H 4200 1800 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=80-C0603C121J5G" H 4200 1700 50  0001 L CNN "Mouser Price/Stock"
F 10 "0147897P" H 4200 1600 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/0147897P" H 4200 1500 50  0001 L CNN "RS Price/Stock"
	1    3850 2350
	0    -1   -1   0   
$EndComp
$Comp
L DSC_motor_controller-rescue:RK73H1JTTD1502F-RK73H1JTTD1502F R18
U 1 1 5D364780
P 3500 2900
F 0 "R18" H 3900 3000 50  0000 R CNN
F 1 "15k" H 3900 2900 50  0000 R CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 4050 2950 50  0001 L CNN
F 3 "http://www.koaspeer.com/catimages/Products/RK73-RT/RK73-RT.pdf" H 4050 2850 50  0001 L CNN
F 4 "Thick Film Resistors - SMD 1/10watts 15Kohms 1%" H 4050 2750 50  0001 L CNN "Description"
F 5 "0.55" H 4050 2650 50  0001 L CNN "Height"
F 6 "KOA Speer" H 4050 2550 50  0001 L CNN "Manufacturer_Name"
F 7 "RK73H1JTTD1502F" H 4050 2450 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "660-RK73H1JTTD1502F" H 4050 2350 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=660-RK73H1JTTD1502F" H 4050 2250 50  0001 L CNN "Mouser Price/Stock"
F 10 "6316676P" H 4050 2150 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/6316676P" H 4050 2050 50  0001 L CNN "RS Price/Stock"
	1    3500 2900
	0    -1   -1   0   
$EndComp
$Comp
L DSC_motor_controller-rescue:RK73H1JTTD2203F-RK73H1JTTD2203F R19
U 1 1 5D3652F1
P 4250 2350
F 0 "R19" H 4550 2450 50  0000 L CNN
F 1 "220k" H 4500 2350 50  0000 L CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 4800 2400 50  0001 L CNN
F 3 "http://www.koaspeer.com/catimages/Products/RK73-RT/RK73-RT.pdf" H 4800 2300 50  0001 L CNN
F 4 "Thick Film Resistors - SMD 1/10watt 220Kohms 1%" H 4800 2200 50  0001 L CNN "Description"
F 5 "0.55" H 4800 2100 50  0001 L CNN "Height"
F 6 "KOA Speer" H 4800 2000 50  0001 L CNN "Manufacturer_Name"
F 7 "RK73H1JTTD2203F" H 4800 1900 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "660-RK73H1JTTD2203F" H 4800 1800 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=660-RK73H1JTTD2203F" H 4800 1700 50  0001 L CNN "Mouser Price/Stock"
F 10 "6355665" H 4800 1600 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/6355665" H 4800 1500 50  0001 L CNN "RS Price/Stock"
	1    4250 2350
	0    1    -1   0   
$EndComp
$Comp
L DSC_motor_controller-rescue:RK73H1JTTD3301F-RK73H1JTTD3301F R16
U 1 1 5D36586D
P 2650 2000
F 0 "R16" H 2950 1900 50  0000 L CNN
F 1 "3.3K" H 2900 2000 50  0000 L CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 3200 2050 50  0001 L CNN
F 3 "http://www.koaspeer.com/catimages/Products/RK73-RT/RK73-RT.pdf" H 3200 1950 50  0001 L CNN
F 4 "Thick Film Resistors - SMD 1/10watt 3.3Kohms 1%" H 3200 1850 50  0001 L CNN "Description"
F 5 "0.55" H 3200 1750 50  0001 L CNN "Height"
F 6 "KOA Speer" H 3200 1650 50  0001 L CNN "Manufacturer_Name"
F 7 "RK73H1JTTD3301F" H 3200 1550 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "660-RK73H1JTTD3301F" H 3200 1450 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=660-RK73H1JTTD3301F" H 3200 1350 50  0001 L CNN "Mouser Price/Stock"
F 10 "6316519P" H 3200 1250 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/6316519P" H 3200 1150 50  0001 L CNN "RS Price/Stock"
	1    2650 2000
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 5D3665C7
P 2300 1600
F 0 "#PWR0129" H 2300 1350 50  0001 C CNN
F 1 "GND" H 2305 1427 50  0000 C CNN
F 2 "" H 2300 1600 50  0001 C CNN
F 3 "" H 2300 1600 50  0001 C CNN
	1    2300 1600
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:+5V-BLDC_4-cache #PWR0130
U 1 1 5D366631
P 2300 2750
F 0 "#PWR0130" H 2300 2600 50  0001 C CNN
F 1 "+5V" H 2315 2923 50  0000 C CNN
F 2 "" H 2300 2750 60  0000 C CNN
F 3 "" H 2300 2750 60  0000 C CNN
	1    2300 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 2850 2300 2850
Wire Wire Line
	2300 2850 2300 2750
Wire Wire Line
	2650 2150 2650 2050
Wire Wire Line
	2650 2050 3050 2050
Connection ~ 2650 2050
Wire Wire Line
	2650 2050 2650 2000
Wire Wire Line
	3500 2000 3500 2200
Wire Wire Line
	2300 1600 2300 1300
Wire Wire Line
	2300 1300 2650 1300
Wire Wire Line
	2650 1300 3500 1300
Wire Wire Line
	3500 1300 3500 1500
Connection ~ 2650 1300
Wire Wire Line
	3050 2050 3050 3000
Wire Wire Line
	3050 3000 4650 3000
Wire Wire Line
	4250 1650 4250 1300
Wire Wire Line
	4250 1300 3850 1300
Connection ~ 3500 1300
Wire Wire Line
	3850 1850 3850 1300
Connection ~ 3850 1300
Wire Wire Line
	3850 1300 3500 1300
Wire Wire Line
	4250 2350 4250 2800
Wire Wire Line
	4250 2800 4650 2800
Wire Wire Line
	3850 2350 3850 2900
Wire Wire Line
	3850 2900 4650 2900
Wire Wire Line
	3850 2900 3500 2900
Connection ~ 3850 2900
NoConn ~ 4650 3200
$Comp
L power:GND #PWR0131
U 1 1 5D369B89
P 4650 3100
F 0 "#PWR0131" H 4650 2850 50  0001 C CNN
F 1 "GND" V 4655 2972 50  0000 R CNN
F 2 "" H 4650 3100 50  0001 C CNN
F 3 "" H 4650 3100 50  0001 C CNN
	1    4650 3100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 5D369BE8
P 4650 3700
F 0 "#PWR0132" H 4650 3450 50  0001 C CNN
F 1 "GND" V 4655 3572 50  0000 R CNN
F 2 "" H 4650 3700 50  0001 C CNN
F 3 "" H 4650 3700 50  0001 C CNN
	1    4650 3700
	0    1    1    0   
$EndComp
NoConn ~ 4650 5200
NoConn ~ 4650 5300
NoConn ~ 6250 2900
$Comp
L DSC_motor_controller-rescue:RK73H1JTTD1004F-RK73H1JTTD1004F R20
U 1 1 5D36A842
P 6450 3500
F 0 "R20" H 6800 3600 50  0000 C CNN
F 1 "1M" H 6800 3500 50  0000 C CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 7000 3550 50  0001 L CNN
F 3 "http://www.koaspeer.com/catimages/Products/RK73-RT/RK73-RT.pdf" H 7000 3450 50  0001 L CNN
F 4 "KOA SPEER ELECTRONICS - RK73H1JTTD1004F - RES, THICK FILM, 1M, 1%, 0.1W, 0603" H 7000 3350 50  0001 L CNN "Description"
F 5 "0.55" H 7000 3250 50  0001 L CNN "Height"
F 6 "KOA Speer" H 7000 3150 50  0001 L CNN "Manufacturer_Name"
F 7 "RK73H1JTTD1004F" H 7000 3050 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "660-RK73H1JTTD1004F" H 7000 2950 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=660-RK73H1JTTD1004F" H 7000 2850 50  0001 L CNN "Mouser Price/Stock"
F 10 "6317118P" H 7000 2750 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/6317118P" H 7000 2650 50  0001 L CNN "RS Price/Stock"
	1    6450 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3500 6250 3500
$Comp
L power:GND #PWR0133
U 1 1 5D36AC8D
P 7150 3500
F 0 "#PWR0133" H 7150 3250 50  0001 C CNN
F 1 "GND" V 7155 3372 50  0000 R CNN
F 2 "" H 7150 3500 50  0001 C CNN
F 3 "" H 7150 3500 50  0001 C CNN
	1    7150 3500
	0    -1   1    0   
$EndComp
$Comp
L DSC_motor_controller-rescue:RK73H1JTTD1002F-RK73H1JTTD1002F R21
U 1 1 5D36BE7E
P 4200 3400
F 0 "R21" H 4550 3500 50  0000 C CNN
F 1 "10k" H 4550 3400 50  0000 C CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 4750 3450 50  0001 L CNN
F 3 "http://www.koaspeer.com/catimages/Products/RK73-RT/RK73-RT.pdf" H 4750 3350 50  0001 L CNN
F 4 "Thick Film Resistors - SMD 1/10watts 10Kohms 1%" H 4750 3250 50  0001 L CNN "Description"
F 5 "0.55" H 4750 3150 50  0001 L CNN "Height"
F 6 "KOA Speer" H 4750 3050 50  0001 L CNN "Manufacturer_Name"
F 7 "RK73H1JTTD1002F" H 4750 2950 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "660-RK73H1JTTD1002F" H 4750 2850 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=660-RK73H1JTTD1002F" H 4750 2750 50  0001 L CNN "Mouser Price/Stock"
F 10 "6316632P" H 4750 2650 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/6316632P" H 4750 2550 50  0001 L CNN "RS Price/Stock"
	1    4200 3400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 5D36BF3A
P 3500 3400
F 0 "#PWR0134" H 3500 3150 50  0001 C CNN
F 1 "GND" V 3505 3272 50  0000 R CNN
F 2 "" H 3500 3400 50  0001 C CNN
F 3 "" H 3500 3400 50  0001 C CNN
	1    3500 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 3400 4650 3400
Text HLabel 4650 3300 0    50   Output ~ 0
FAULT
$Comp
L power:GND #PWR0135
U 1 1 5D36C741
P 4650 3500
F 0 "#PWR0135" H 4650 3250 50  0001 C CNN
F 1 "GND" V 4655 3372 50  0000 R CNN
F 2 "" H 4650 3500 50  0001 C CNN
F 3 "" H 4650 3500 50  0001 C CNN
	1    4650 3500
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0136
U 1 1 5D36C7E7
P 4650 3600
F 0 "#PWR0136" H 4650 3450 50  0001 C CNN
F 1 "+3.3V" V 4665 3728 50  0000 L CNN
F 2 "" H 4650 3600 50  0001 C CNN
F 3 "" H 4650 3600 50  0001 C CNN
	1    4650 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 5500 4500 5500
NoConn ~ 4650 3900
Wire Wire Line
	4650 3800 4100 3800
$Comp
L DSC_motor_controller-rescue:CGA3E2X7R1H223K080AA-CGA3E2X7R1H223K080AA C21
U 1 1 5D36E996
P 3800 4150
F 0 "C21" H 4200 4200 50  0000 C CNN
F 1 "22n" H 3900 4200 50  0000 C CNN
F 2 "CGA3E2C7R1H223K080AA:CAPC1608X90N" H 4150 4200 50  0001 L CNN
F 3 "http://docs-emea.rs-online.com/webdocs/14e9/0900766b814e9125.pdf" H 4150 4100 50  0001 L CNN
F 4 "TDK 22nF Multilayer Ceramic Capacitor MLCC 50 V dc +/-10% X7R Dielectric 1608 Solder Max. Op. Temp. +125C" H 4150 4000 50  0001 L CNN "Description"
F 5 "0.9" H 4150 3900 50  0001 L CNN "Height"
F 6 "TDK" H 4150 3800 50  0001 L CNN "Manufacturer_Name"
F 7 "CGA3E2X7R1H223K080AA" H 4150 3700 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-CGA3E2X7R1H223K" H 4150 3600 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-CGA3E2X7R1H223K" H 4150 3500 50  0001 L CNN "Mouser Price/Stock"
F 10 "1447372" H 4150 3400 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/1447372" H 4150 3300 50  0001 L CNN "RS Price/Stock"
	1    3800 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 4100 4350 4100
Wire Wire Line
	4350 4100 4350 4150
Wire Wire Line
	3300 4150 3300 4250
Wire Wire Line
	4550 4250 4550 4200
Wire Wire Line
	4550 4200 4650 4200
$Comp
L DSC_motor_controller-rescue:C3216X7R1H225K160AE-C3216X7R1H225K160AE C22
U 1 1 5D3728B6
P 4000 5550
F 0 "C22" V 4204 5678 50  0000 L CNN
F 1 "2.2u" V 4295 5678 50  0000 L CNN
F 2 "C3216X7R1H225K160AE:CAPC3216X180N" H 4350 5600 50  0001 L CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf" H 4350 5500 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 3216 2.2uF 50volts X7R 10% Soft Term" H 4350 5400 50  0001 L CNN "Description"
F 5 "1.8" H 4350 5300 50  0001 L CNN "Height"
F 6 "TDK" H 4350 5200 50  0001 L CNN "Manufacturer_Name"
F 7 "C3216X7R1H225K160AE" H 4350 5100 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-C3216X7R1H225KST" H 4350 5000 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-C3216X7R1H225KST" H 4350 4900 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 4350 4800 50  0001 L CNN "RS Part Number"
F 11 "" H 4350 4700 50  0001 L CNN "RS Price/Stock"
	1    4000 5550
	0    1    1    0   
$EndComp
$Comp
L DSC_motor_controller-rescue:C3216X7R1H225K160AE-C3216X7R1H225K160AE C23
U 1 1 5D3731EB
P 3600 5100
F 0 "C23" H 3950 5150 50  0000 C CNN
F 1 "2.2u" H 3700 5150 50  0000 C CNN
F 2 "C3216X7R1H225K160AE:CAPC3216X180N" H 3950 5150 50  0001 L CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf" H 3950 5050 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 3216 2.2uF 50volts X7R 10% Soft Term" H 3950 4950 50  0001 L CNN "Description"
F 5 "1.8" H 3950 4850 50  0001 L CNN "Height"
F 6 "TDK" H 3950 4750 50  0001 L CNN "Manufacturer_Name"
F 7 "C3216X7R1H225K160AE" H 3950 4650 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-C3216X7R1H225KST" H 3950 4550 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-C3216X7R1H225KST" H 3950 4450 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 3950 4350 50  0001 L CNN "RS Part Number"
F 11 "" H 3950 4250 50  0001 L CNN "RS Price/Stock"
	1    3600 5100
	-1   0    0    1   
$EndComp
$Comp
L DSC_motor_controller-rescue:C3216X7R1H225K160AE-C3216X7R1H225K160AE C24
U 1 1 5D373849
P 3600 4800
F 0 "C24" H 4000 4850 50  0000 C CNN
F 1 "2.2u" H 3700 4850 50  0000 C CNN
F 2 "C3216X7R1H225K160AE:CAPC3216X180N" H 3950 4850 50  0001 L CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf" H 3950 4750 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 3216 2.2uF 50volts X7R 10% Soft Term" H 3950 4650 50  0001 L CNN "Description"
F 5 "1.8" H 3950 4550 50  0001 L CNN "Height"
F 6 "TDK" H 3950 4450 50  0001 L CNN "Manufacturer_Name"
F 7 "C3216X7R1H225K160AE" H 3950 4350 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-C3216X7R1H225KST" H 3950 4250 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-C3216X7R1H225KST" H 3950 4150 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 3950 4050 50  0001 L CNN "RS Part Number"
F 11 "" H 3950 3950 50  0001 L CNN "RS Price/Stock"
	1    3600 4800
	-1   0    0    1   
$EndComp
$Comp
L DSC_motor_controller-rescue:C3216X7R1H225K160AE-C3216X7R1H225K160AE C25
U 1 1 5D373EA3
P 3150 4000
F 0 "C25" H 3400 3735 50  0000 C CNN
F 1 "2.2u" H 3400 3826 50  0000 C CNN
F 2 "C3216X7R1H225K160AE:CAPC3216X180N" H 3500 4050 50  0001 L CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf" H 3500 3950 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 3216 2.2uF 50volts X7R 10% Soft Term" H 3500 3850 50  0001 L CNN "Description"
F 5 "1.8" H 3500 3750 50  0001 L CNN "Height"
F 6 "TDK" H 3500 3650 50  0001 L CNN "Manufacturer_Name"
F 7 "C3216X7R1H225K160AE" H 3500 3550 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-C3216X7R1H225KST" H 3500 3450 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-C3216X7R1H225KST" H 3500 3350 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 3500 3250 50  0001 L CNN "RS Part Number"
F 11 "" H 3500 3150 50  0001 L CNN "RS Price/Stock"
	1    3150 4000
	-1   0    0    1   
$EndComp
$Comp
L DSC_motor_controller-rescue:C3216X7R1H225K160AE-C3216X7R1H225K160AE C26
U 1 1 5D374535
P 9100 3350
F 0 "C26" V 9304 3478 50  0000 L CNN
F 1 "2.2u" V 9395 3478 50  0000 L CNN
F 2 "C3216X7R1H225K160AE:CAPC3216X180N" H 9450 3400 50  0001 L CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf" H 9450 3300 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 3216 2.2uF 50volts X7R 10% Soft Term" H 9450 3200 50  0001 L CNN "Description"
F 5 "1.8" H 9450 3100 50  0001 L CNN "Height"
F 6 "TDK" H 9450 3000 50  0001 L CNN "Manufacturer_Name"
F 7 "C3216X7R1H225K160AE" H 9450 2900 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-C3216X7R1H225KST" H 9450 2800 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-C3216X7R1H225KST" H 9450 2700 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 9450 2600 50  0001 L CNN "RS Part Number"
F 11 "" H 9450 2500 50  0001 L CNN "RS Price/Stock"
	1    9100 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 5100 3100 5000
Wire Wire Line
	3100 5000 2850 5000
Connection ~ 3100 5000
Wire Wire Line
	3100 5000 3100 4800
Wire Wire Line
	4500 5500 4500 6050
Wire Wire Line
	4000 5550 4000 5400
Wire Wire Line
	4650 5100 4300 5100
$Comp
L power:GND #PWR0138
U 1 1 5D37E0CE
P 5450 5950
F 0 "#PWR0138" H 5450 5700 50  0001 C CNN
F 1 "GND" H 5455 5777 50  0000 C CNN
F 2 "" H 5450 5950 50  0001 C CNN
F 3 "" H 5450 5950 50  0001 C CNN
	1    5450 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 5950 5450 5900
Text HLabel 4650 4300 0    50   Output ~ 0
EN_GATE
Text HLabel 4650 4400 0    50   Input ~ 0
PWM_A_H
Text HLabel 4650 4500 0    50   Input ~ 0
PWM_A_L
Text HLabel 4650 4600 0    50   Input ~ 0
PWM_B_H
Text HLabel 4650 4700 0    50   Input ~ 0
PWM_B_L
Text HLabel 4650 4800 0    50   Input ~ 0
PWM_C_H
Text HLabel 4650 4900 0    50   Input ~ 0
PWM_C_L
Wire Wire Line
	3600 5100 3600 5000
Wire Wire Line
	3300 4250 4550 4250
Wire Wire Line
	4350 4150 3800 4150
$Comp
L DSC_motor_controller-rescue:CGA2B3X7R1E224K050BE-CGA2B3X7R1E224K050BE C29
U 1 1 5D383FF6
P 6600 3700
F 0 "C29" H 6950 3650 50  0000 C CNN
F 1 "220n" H 6700 3650 50  0000 C CNN
F 2 "GRM155C91C105ME11J:CAPC1005X55N" H 6950 3750 50  0001 L CNN
F 3 "http://docs-emea.rs-online.com/webdocs/14e9/0900766b814e9125.pdf" H 6950 3650 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0402 0.22uF 25volts X7R 10% Soft Term" H 6950 3550 50  0001 L CNN "Description"
F 5 "0.55" H 6950 3450 50  0001 L CNN "Height"
F 6 "TDK" H 6950 3350 50  0001 L CNN "Manufacturer_Name"
F 7 "CGA2B3X7R1E224K050BE" H 6950 3250 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-CG2B3X7R1E224KBE" H 6950 3150 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-CG2B3X7R1E224KBE" H 6950 3050 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 0   0   50  0001 C CNN "RS Part Number"
F 11 "" H 0   0   50  0001 C CNN "RS Price/Stock"
	1    6600 3700
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:CGA2B3X7R1E224K050BE-CGA2B3X7R1E224K050BE C28
U 1 1 5D3840F8
P 6600 4100
F 0 "C28" H 6750 4050 50  0000 C CNN
F 1 "220n" H 7000 4050 50  0000 C CNN
F 2 "GRM155C91C105ME11J:CAPC1005X55N" H 6950 4150 50  0001 L CNN
F 3 "http://docs-emea.rs-online.com/webdocs/14e9/0900766b814e9125.pdf" H 6950 4050 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0402 0.22uF 25volts X7R 10% Soft Term" H 6950 3950 50  0001 L CNN "Description"
F 5 "0.55" H 6950 3850 50  0001 L CNN "Height"
F 6 "TDK" H 6950 3750 50  0001 L CNN "Manufacturer_Name"
F 7 "CGA2B3X7R1E224K050BE" H 6950 3650 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-CG2B3X7R1E224KBE" H 6950 3550 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-CG2B3X7R1E224KBE" H 6950 3450 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6950 3350 50  0001 L CNN "RS Part Number"
F 11 "" H 6950 3250 50  0001 L CNN "RS Price/Stock"
	1    6600 4100
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:CGA2B3X7R1E224K050BE-CGA2B3X7R1E224K050BE C27
U 1 1 5D384189
P 6600 4600
F 0 "C27" H 6700 4550 50  0000 C CNN
F 1 "220n" H 7000 4550 50  0000 C CNN
F 2 "GRM155C91C105ME11J:CAPC1005X55N" H 6950 4650 50  0001 L CNN
F 3 "http://docs-emea.rs-online.com/webdocs/14e9/0900766b814e9125.pdf" H 6950 4550 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0402 0.22uF 25volts X7R 10% Soft Term" H 6950 4450 50  0001 L CNN "Description"
F 5 "0.55" H 6950 4350 50  0001 L CNN "Height"
F 6 "TDK" H 6950 4250 50  0001 L CNN "Manufacturer_Name"
F 7 "CGA2B3X7R1E224K050BE" H 6950 4150 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-CG2B3X7R1E224KBE" H 6950 4050 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-CG2B3X7R1E224KBE" H 6950 3950 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6950 3850 50  0001 L CNN "RS Part Number"
F 11 "" H 6950 3750 50  0001 L CNN "RS Price/Stock"
	1    6600 4600
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:AS0805KKX7R0BB104-AS0805KKX7R0BB104 C30
U 1 1 5D38472C
P 6650 3200
F 0 "C30" H 6750 3150 50  0000 C CNN
F 1 "100n" H 7100 3150 50  0000 C CNN
F 2 "AS0805KKX7R0BB104:CAPC2012X145N" H 7000 3250 50  0001 L CNN
F 3 "https://mouser.componentsearchengine.com/Datasheets/1/AS0805KKX7R0BB104.pdf" H 7000 3150 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0.1uF 10% 100V AEC-Q200" H 7000 3050 50  0001 L CNN "Description"
F 5 "1.45" H 7000 2950 50  0001 L CNN "Height"
F 6 "YAGEO (PHYCOMP)" H 7000 2850 50  0001 L CNN "Manufacturer_Name"
F 7 "AS0805KKX7R0BB104" H 7000 2750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "603-AS0805KKX70BB104" H 7000 2650 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=603-AS0805KKX70BB104" H 7000 2550 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 7000 2450 50  0001 L CNN "RS Part Number"
F 11 "" H 7000 2350 50  0001 L CNN "RS Price/Stock"
	1    6650 3200
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:C0603C153J3GACTU-C0603C153J3GACTU C31
U 1 1 5D38487F
P 6650 2600
F 0 "C31" V 6800 2700 50  0000 C CNN
F 1 "15n" V 7000 2700 50  0000 C CNN
F 2 "C0603C121J5GACTU:CAPC1608X87N" H 7000 2650 50  0001 L CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1003_C0G_SMD.pdf" H 7000 2550 50  0001 L CNN
F 4 "Capacitor Ceramic C0G 0603 25V 15nF KEMET 15nF Multilayer Ceramic Capacitor (MLCC) 25 V +/-5% C0G dielectric C SMD max op. temp. +125C" H 7000 2450 50  0001 L CNN "Description"
F 5 "0.87" H 7000 2350 50  0001 L CNN "Height"
F 6 "Kemet" H 7000 2250 50  0001 L CNN "Manufacturer_Name"
F 7 "C0603C153J3GACTU" H 7000 2150 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "80-C0603C153J3G" H 7000 2050 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=80-C0603C153J3G" H 7000 1950 50  0001 L CNN "Mouser Price/Stock"
F 10 "8015233P" H 7000 1850 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/8015233P" H 7000 1750 50  0001 L CNN "RS Price/Stock"
F 12 "70610853" H 7000 1650 50  0001 L CNN "Allied_Number"
F 13 "https://www.alliedelec.com/kemet-c0603c153j3gactu/70610853/" H 7000 1550 50  0001 L CNN "Allied Price/Stock"
	1    6650 2600
	0    1    -1   0   
$EndComp
$Comp
L DSC_motor_controller-rescue:SDR0805-220ML-SDR0805-220ML L1
U 1 1 5D3849DB
P 8000 3350
F 0 "L1" H 8400 3300 50  0000 C CNN
F 1 "22u" H 8400 3450 50  0000 C CNN
F 2 "SDR0805-220ML:SDR0805-121KL" H 8650 3400 50  0001 L CNN
F 3 "http://www.bourns.com/docs/Product-Datasheets/SDR0805.pdf" H 8650 3300 50  0001 L CNN
F 4 "Bourns SDR0805 Series Wire-wound SMD Inductor with a Ferrite Core, 22 uH +/-20% 2.3A Idc Q:20" H 8650 3200 50  0001 L CNN "Description"
F 5 "" H 8650 3100 50  0001 L CNN "Height"
F 6 "Bourns" H 8650 3000 50  0001 L CNN "Manufacturer_Name"
F 7 "SDR0805-220ML" H 8650 2900 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "652-SDR0805-220ML" H 8650 2800 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=652-SDR0805-220ML" H 8650 2700 50  0001 L CNN "Mouser Price/Stock"
F 10 "7361270" H 8650 2600 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/7361270" H 8650 2500 50  0001 L CNN "RS Price/Stock"
F 12 "70153836" H 8650 2400 50  0001 L CNN "Allied_Number"
F 13 "https://www.alliedelec.com/bourns-sdr0805-220ml/70153836/" H 8650 2300 50  0001 L CNN "Allied Price/Stock"
	1    8000 3350
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:PMEG6020ER,115-PMEG6020ER_115 D1
U 1 1 5D385096
P 7750 3200
F 0 "D1" V 8104 3328 50  0000 L CNN
F 1 "PMEG6020ER,115" V 8195 3328 50  0000 L CNN
F 2 "PMEG6020ER:SODFL3517X110N" H 8250 3350 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/PMEG6020ER,115.pdf" H 8250 3250 50  0001 L CNN
F 4 "Nexperia PMEG6020ER,115 SMT Schottky Diode, 60V 2A, 2-Pin SOD-123W" H 8250 3150 50  0001 L CNN "Description"
F 5 "1.1" H 8250 3050 50  0001 L CNN "Height"
F 6 "Nexperia" H 8250 2950 50  0001 L CNN "Manufacturer_Name"
F 7 "PMEG6020ER,115" H 8250 2850 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "771-PMEG6020ER-115" H 8250 2750 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=771-PMEG6020ER-115" H 8250 2650 50  0001 L CNN "Mouser Price/Stock"
F 10 "7805414" H 8250 2550 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/7805414" H 8250 2450 50  0001 L CNN "RS Price/Stock"
	1    7750 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 3700 6550 3700
Wire Wire Line
	6550 3700 6550 3600
Wire Wire Line
	6550 3600 6250 3600
Wire Wire Line
	7100 3700 7100 3800
Wire Wire Line
	7100 3800 6250 3800
Wire Wire Line
	6600 4100 6250 4100
Wire Wire Line
	7100 4100 7100 4300
Wire Wire Line
	7100 4300 6250 4300
Wire Wire Line
	6600 4600 6250 4600
Wire Wire Line
	7100 4600 7100 4800
Wire Wire Line
	7100 4800 6250 4800
Wire Wire Line
	6250 5100 6500 5100
Wire Wire Line
	6500 5100 6500 5200
Wire Wire Line
	6500 5200 6250 5200
Wire Wire Line
	6250 5300 6500 5300
Wire Wire Line
	6500 5300 6500 5200
Connection ~ 6500 5200
Wire Wire Line
	6250 5400 6500 5400
Wire Wire Line
	6500 5400 6500 5300
Connection ~ 6500 5300
Wire Wire Line
	6500 5100 6700 5100
Wire Wire Line
	6700 5100 6700 5200
Connection ~ 6500 5100
$Comp
L power:GND #PWR0140
U 1 1 5D3938FD
P 6700 5200
F 0 "#PWR0140" H 6700 4950 50  0001 C CNN
F 1 "GND" H 6705 5027 50  0000 C CNN
F 2 "" H 6700 5200 50  0001 C CNN
F 3 "" H 6700 5200 50  0001 C CNN
	1    6700 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0141
U 1 1 5D3995C1
P 6500 6300
F 0 "#PWR0141" H 6500 6050 50  0001 C CNN
F 1 "GND" H 6505 6127 50  0000 C CNN
F 2 "" H 6500 6300 50  0001 C CNN
F 3 "" H 6500 6300 50  0001 C CNN
	1    6500 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 6300 6500 6150
Wire Wire Line
	6250 5500 6500 5500
Wire Wire Line
	6500 5500 6500 5650
Text HLabel 7000 5500 2    50   Input ~ 0
SUPPLY
$Comp
L DSC_motor_controller-rescue:CGA6M3X7S2A475K200AB-CGA6M3X7S2A475K200AB C33
U 1 1 5D384454
P 6500 5650
F 0 "C33" V 6650 5750 50  0000 C CNN
F 1 "4.7u" V 6850 5750 50  0000 C CNN
F 2 "CGA5M3X7S2A475K200AB:CAPC3225X200N" H 6850 5700 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/CGA6M3X7S2A475K200AB.pdf" H 6850 5600 50  0001 L CNN
F 4 "TDK 4.7uF Multilayer Ceramic Capacitor MLCC 100V dc +/-10% X7S Dielectric 1210 (3225M) SMD, Max. Temp. +125C" H 6850 5500 50  0001 L CNN "Description"
F 5 "2" H 6850 5400 50  0001 L CNN "Height"
F 6 "TDK" H 6850 5300 50  0001 L CNN "Manufacturer_Name"
F 7 "CGA6M3X7S2A475K200AB" H 6850 5200 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-CGA6M3X7S2A475K" H 6850 5100 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-CGA6M3X7S2A475K" H 6850 5000 50  0001 L CNN "Mouser Price/Stock"
F 10 "9155415P" H 6850 4900 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/9155415P" H 6850 4800 50  0001 L CNN "RS Price/Stock"
	1    6500 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 5500 6500 5500
Connection ~ 6500 5500
Text HLabel 6250 5000 2    50   Input ~ 0
SL_C
Text HLabel 6250 4900 2    50   Output ~ 0
GL_C
Text HLabel 7200 4800 2    50   Input ~ 0
SH_C
Wire Wire Line
	7100 4800 7200 4800
Connection ~ 7100 4800
Text HLabel 7200 4300 2    50   Input ~ 0
SH_B
Wire Wire Line
	7100 4300 7200 4300
Text HLabel 7200 3800 2    50   Input ~ 0
SH_A
Wire Wire Line
	7100 3800 7200 3800
Text HLabel 6250 4500 2    50   Input ~ 0
SL_B
Text HLabel 6250 4400 2    50   Output ~ 0
GL_B
Text HLabel 6250 4000 2    50   Input ~ 0
SL_A
Text HLabel 6250 3900 2    50   Output ~ 0
GL_A
Text HLabel 6250 4700 2    50   Output ~ 0
GH_C
Text HLabel 6250 4200 2    50   Output ~ 0
GH_B
Text HLabel 6250 3700 2    50   Output ~ 0
GH_A
Wire Wire Line
	8800 3350 9100 3350
Wire Wire Line
	9450 3350 9450 3300
Wire Wire Line
	9450 3300 9650 3300
Connection ~ 9100 3350
Wire Wire Line
	9100 3350 9450 3350
Wire Wire Line
	9650 3800 9650 3900
Wire Wire Line
	9650 3900 9100 3900
Wire Wire Line
	9100 3850 9100 3900
Connection ~ 9100 3900
Wire Wire Line
	9100 3900 7750 3900
$Comp
L DSC_motor_controller-rescue:875015119003-875015119003 C34
U 1 1 5D3AF060
P 9650 3300
AR Path="/5D3AF060" Ref="C34"  Part="1" 
AR Path="/5D34E5A4/5D3AF060" Ref="C34"  Part="1" 
F 0 "C34" V 9854 3430 50  0000 L CNN
F 1 "100u" V 9945 3430 50  0000 L CNN
F 2 "875015119003:CAPPM7343X200N" H 10000 3350 50  0001 L CNN
F 3 "https://katalog.we-online.com/pbs/datasheet/875015119003.pdf" H 10000 3250 50  0001 L CNN
F 4 "Wurth Elektronik 100uF 6.3V dc Aluminium Polymer Capacitor, Surface Mount 7.3 x 4.3 x 1.9mm +105C 7.3mm" H 10000 3150 50  0001 L CNN "Description"
F 5 "2" H 10000 3050 50  0001 L CNN "Height"
F 6 "Wurth Elektronik" H 10000 2950 50  0001 L CNN "Manufacturer_Name"
F 7 "875015119003" H 10000 2850 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "710-875015119003" H 10000 2750 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=710-875015119003" H 10000 2650 50  0001 L CNN "Mouser Price/Stock"
F 10 "1855760" H 10000 2550 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/1855760" H 10000 2450 50  0001 L CNN "RS Price/Stock"
	1    9650 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	8000 3350 7900 3350
Wire Wire Line
	7900 3350 7900 3300
Wire Wire Line
	7900 3300 7750 3300
Connection ~ 7750 3300
Wire Wire Line
	6650 3200 6250 3200
Wire Wire Line
	6250 3400 6250 3300
Connection ~ 6250 3300
$Comp
L DSC_motor_controller-rescue:CGA6M3X7S2A475K200AB-CGA6M3X7S2A475K200AB C32
U 1 1 5D3BA05E
P 7450 2250
F 0 "C32" V 7600 2350 50  0000 C CNN
F 1 "4.7u" V 7800 2350 50  0000 C CNN
F 2 "CGA5M3X7S2A475K200AB:CAPC3225X200N" H 7800 2300 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/CGA6M3X7S2A475K200AB.pdf" H 7800 2200 50  0001 L CNN
F 4 "TDK 4.7uF Multilayer Ceramic Capacitor MLCC 100V dc +/-10% X7S Dielectric 1210 (3225M) SMD, Max. Temp. +125C" H 7800 2100 50  0001 L CNN "Description"
F 5 "2" H 7800 2000 50  0001 L CNN "Height"
F 6 "TDK" H 7800 1900 50  0001 L CNN "Manufacturer_Name"
F 7 "CGA6M3X7S2A475K200AB" H 7800 1800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "810-CGA6M3X7S2A475K" H 7800 1700 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=810-CGA6M3X7S2A475K" H 7800 1600 50  0001 L CNN "Mouser Price/Stock"
F 10 "9155415P" H 7800 1500 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/9155415P" H 7800 1400 50  0001 L CNN "RS Price/Stock"
	1    7450 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 3000 6450 3000
Wire Wire Line
	6450 3000 6450 3100
Wire Wire Line
	6450 3100 6250 3100
Wire Wire Line
	6450 3000 7000 3000
Wire Wire Line
	7000 3000 7000 2250
Wire Wire Line
	7000 2250 7450 2250
Connection ~ 6450 3000
Wire Wire Line
	6250 2800 6400 2800
Wire Wire Line
	6400 2800 6400 1750
Text GLabel 8150 2050 2    50   Output ~ 0
SUPPLY
Text HLabel 8150 2250 2    50   Input ~ 0
SUPPLY
Connection ~ 7450 2250
$Comp
L power:GND #PWR0142
U 1 1 5D3CBB4C
P 6650 2600
F 0 "#PWR0142" H 6650 2350 50  0001 C CNN
F 1 "GND" H 6655 2427 50  0000 C CNN
F 2 "" H 6650 2600 50  0001 C CNN
F 3 "" H 6650 2600 50  0001 C CNN
	1    6650 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1750 6650 1750
Wire Wire Line
	6650 1750 6650 2100
$Comp
L power:GND #PWR0143
U 1 1 5D3F310E
P 9650 3900
F 0 "#PWR0143" H 9650 3650 50  0001 C CNN
F 1 "GND" H 9655 3727 50  0000 C CNN
F 2 "" H 9650 3900 50  0001 C CNN
F 3 "" H 9650 3900 50  0001 C CNN
	1    9650 3900
	1    0    0    -1  
$EndComp
Connection ~ 9650 3900
$Comp
L DSC_motor_controller-rescue:+5V-BLDC_4-cache #PWR0144
U 1 1 5D3F3151
P 9650 3000
F 0 "#PWR0144" H 9650 2850 50  0001 C CNN
F 1 "+5V" H 9665 3173 50  0000 C CNN
F 2 "" H 9650 3000 60  0000 C CNN
F 3 "" H 9650 3000 60  0000 C CNN
	1    9650 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 3000 9650 3300
Connection ~ 9650 3300
$Comp
L power:GND #PWR0145
U 1 1 5D3F97B0
P 7450 2750
F 0 "#PWR0145" H 7450 2500 50  0001 C CNN
F 1 "GND" H 7455 2577 50  0000 C CNN
F 2 "" H 7450 2750 50  0001 C CNN
F 3 "" H 7450 2750 50  0001 C CNN
	1    7450 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2250 7850 2250
Wire Wire Line
	8150 2050 7850 2050
Wire Wire Line
	7850 2050 7850 2250
Connection ~ 7850 2250
Wire Wire Line
	7850 2250 8150 2250
$Comp
L DSC_motor_controller-rescue:ERJ3EKF3902V-ERJ3EKF3902V R29
U 1 1 5D417FBD
P 9750 4250
F 0 "R29" H 10100 4350 50  0000 C CNN
F 1 "39k" H 10100 4250 50  0000 C CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 10300 4300 50  0001 L CNN
F 3 "http://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C86.pdf" H 10300 4200 50  0001 L CNN
F 4 "Thick Film Chip Resistor 0.1W 0603 39K Panasonic E96 Series Precision Thick Film Surface Mount Resistor 0603 Case 39k +/-1% 0.1W +/-100ppm/C" H 10300 4100 50  0001 L CNN "Description"
F 5 "0.55" H 10300 4000 50  0001 L CNN "Height"
F 6 "Panasonic" H 10300 3900 50  0001 L CNN "Manufacturer_Name"
F 7 "ERJ3EKF3902V" H 10300 3800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 10300 3700 50  0001 L CNN "Mouser Part Number"
F 9 "" H 10300 3600 50  0001 L CNN "Mouser Price/Stock"
F 10 "8085080" H 10300 3500 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/8085080" H 10300 3400 50  0001 L CNN "RS Price/Stock"
	1    9750 4250
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:ERJ3EKF3902V-ERJ3EKF3902V R26
U 1 1 5D41EDD3
P 9750 4750
F 0 "R26" H 10100 4850 50  0000 C CNN
F 1 "39k" H 10100 4750 50  0000 C CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 10300 4800 50  0001 L CNN
F 3 "http://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C86.pdf" H 10300 4700 50  0001 L CNN
F 4 "Thick Film Chip Resistor 0.1W 0603 39K Panasonic E96 Series Precision Thick Film Surface Mount Resistor 0603 Case 39k +/-1% 0.1W +/-100ppm/C" H 10300 4600 50  0001 L CNN "Description"
F 5 "0.55" H 10300 4500 50  0001 L CNN "Height"
F 6 "Panasonic" H 10300 4400 50  0001 L CNN "Manufacturer_Name"
F 7 "ERJ3EKF3902V" H 10300 4300 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 10300 4200 50  0001 L CNN "Mouser Part Number"
F 9 "" H 10300 4100 50  0001 L CNN "Mouser Price/Stock"
F 10 "8085080" H 10300 4000 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/8085080" H 10300 3900 50  0001 L CNN "RS Price/Stock"
	1    9750 4750
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:ERJ3EKF3902V-ERJ3EKF3902V R27
U 1 1 5D421F74
P 9750 5250
F 0 "R27" H 10100 5350 50  0000 C CNN
F 1 "39k" H 10100 5250 50  0000 C CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 10300 5300 50  0001 L CNN
F 3 "http://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C86.pdf" H 10300 5200 50  0001 L CNN
F 4 "Thick Film Chip Resistor 0.1W 0603 39K Panasonic E96 Series Precision Thick Film Surface Mount Resistor 0603 Case 39k +/-1% 0.1W +/-100ppm/C" H 10300 5100 50  0001 L CNN "Description"
F 5 "0.55" H 10300 5000 50  0001 L CNN "Height"
F 6 "Panasonic" H 10300 4900 50  0001 L CNN "Manufacturer_Name"
F 7 "ERJ3EKF3902V" H 10300 4800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 10300 4700 50  0001 L CNN "Mouser Part Number"
F 9 "" H 10300 4600 50  0001 L CNN "Mouser Price/Stock"
F 10 "8085080" H 10300 4500 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/8085080" H 10300 4400 50  0001 L CNN "RS Price/Stock"
	1    9750 5250
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:ERJ3EKF3902V-ERJ3EKF3902V R28
U 1 1 5D425119
P 9750 5750
F 0 "R28" H 10100 5850 50  0000 C CNN
F 1 "39k" H 10100 5750 50  0000 C CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 10300 5800 50  0001 L CNN
F 3 "http://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C86.pdf" H 10300 5700 50  0001 L CNN
F 4 "Thick Film Chip Resistor 0.1W 0603 39K Panasonic E96 Series Precision Thick Film Surface Mount Resistor 0603 Case 39k +/-1% 0.1W +/-100ppm/C" H 10300 5600 50  0001 L CNN "Description"
F 5 "0.55" H 10300 5500 50  0001 L CNN "Height"
F 6 "Panasonic" H 10300 5400 50  0001 L CNN "Manufacturer_Name"
F 7 "ERJ3EKF3902V" H 10300 5300 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 10300 5200 50  0001 L CNN "Mouser Part Number"
F 9 "" H 10300 5100 50  0001 L CNN "Mouser Price/Stock"
F 10 "8085080" H 10300 5000 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/8085080" H 10300 4900 50  0001 L CNN "RS Price/Stock"
	1    9750 5750
	1    0    0    -1  
$EndComp
$Comp
L DSC_motor_controller-rescue:RK73H1JTTD2201F-RK73H1JTTD2201F R25
U 1 1 5D44D9FA
P 10450 4450
F 0 "R25" H 10800 4350 50  0000 C CNN
F 1 "2k2" H 10800 4450 50  0000 C CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 11000 4500 50  0001 L CNN
F 3 "http://www.koaspeer.com/catimages/Products/RK73-RT/RK73-RT.pdf" H 11000 4400 50  0001 L CNN
F 4 "Thick Film Resistors - SMD 1/10watt 2.2Kohms 1%" H 11000 4300 50  0001 L CNN "Description"
F 5 "0.55" H 11000 4200 50  0001 L CNN "Height"
F 6 "KOA Speer" H 11000 4100 50  0001 L CNN "Manufacturer_Name"
F 7 "RK73H1JTTD2201F" H 11000 4000 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "660-RK73H1JTTD2201F" H 11000 3900 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=660-RK73H1JTTD2201F" H 11000 3800 50  0001 L CNN "Mouser Price/Stock"
F 10 "6316474P" H 11000 3700 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/6316474P" H 11000 3600 50  0001 L CNN "RS Price/Stock"
	1    10450 4450
	-1   0    0    1   
$EndComp
$Comp
L DSC_motor_controller-rescue:RK73H1JTTD2201F-RK73H1JTTD2201F R22
U 1 1 5D450BB7
P 10450 4950
F 0 "R22" H 10800 4850 50  0000 C CNN
F 1 "2k2" H 10800 4950 50  0000 C CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 11000 5000 50  0001 L CNN
F 3 "http://www.koaspeer.com/catimages/Products/RK73-RT/RK73-RT.pdf" H 11000 4900 50  0001 L CNN
F 4 "Thick Film Resistors - SMD 1/10watt 2.2Kohms 1%" H 11000 4800 50  0001 L CNN "Description"
F 5 "0.55" H 11000 4700 50  0001 L CNN "Height"
F 6 "KOA Speer" H 11000 4600 50  0001 L CNN "Manufacturer_Name"
F 7 "RK73H1JTTD2201F" H 11000 4500 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "660-RK73H1JTTD2201F" H 11000 4400 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=660-RK73H1JTTD2201F" H 11000 4300 50  0001 L CNN "Mouser Price/Stock"
F 10 "6316474P" H 11000 4200 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/6316474P" H 11000 4100 50  0001 L CNN "RS Price/Stock"
	1    10450 4950
	-1   0    0    1   
$EndComp
$Comp
L DSC_motor_controller-rescue:RK73H1JTTD2201F-RK73H1JTTD2201F R23
U 1 1 5D453D66
P 10450 5450
F 0 "R23" H 10800 5350 50  0000 C CNN
F 1 "2k2" H 10800 5450 50  0000 C CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 11000 5500 50  0001 L CNN
F 3 "http://www.koaspeer.com/catimages/Products/RK73-RT/RK73-RT.pdf" H 11000 5400 50  0001 L CNN
F 4 "Thick Film Resistors - SMD 1/10watt 2.2Kohms 1%" H 11000 5300 50  0001 L CNN "Description"
F 5 "0.55" H 11000 5200 50  0001 L CNN "Height"
F 6 "KOA Speer" H 11000 5100 50  0001 L CNN "Manufacturer_Name"
F 7 "RK73H1JTTD2201F" H 11000 5000 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "660-RK73H1JTTD2201F" H 11000 4900 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=660-RK73H1JTTD2201F" H 11000 4800 50  0001 L CNN "Mouser Price/Stock"
F 10 "6316474P" H 11000 4700 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/6316474P" H 11000 4600 50  0001 L CNN "RS Price/Stock"
	1    10450 5450
	-1   0    0    1   
$EndComp
$Comp
L DSC_motor_controller-rescue:RK73H1JTTD2201F-RK73H1JTTD2201F R24
U 1 1 5D456F1B
P 10450 6000
F 0 "R24" H 10800 5900 50  0000 C CNN
F 1 "2k2" H 10800 6000 50  0000 C CNN
F 2 "ERJ3RQF4R7V:RESC1608X55N" H 11000 6050 50  0001 L CNN
F 3 "http://www.koaspeer.com/catimages/Products/RK73-RT/RK73-RT.pdf" H 11000 5950 50  0001 L CNN
F 4 "Thick Film Resistors - SMD 1/10watt 2.2Kohms 1%" H 11000 5850 50  0001 L CNN "Description"
F 5 "0.55" H 11000 5750 50  0001 L CNN "Height"
F 6 "KOA Speer" H 11000 5650 50  0001 L CNN "Manufacturer_Name"
F 7 "RK73H1JTTD2201F" H 11000 5550 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "660-RK73H1JTTD2201F" H 11000 5450 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=660-RK73H1JTTD2201F" H 11000 5350 50  0001 L CNN "Mouser Price/Stock"
F 10 "6316474P" H 11000 5250 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/6316474P" H 11000 5150 50  0001 L CNN "RS Price/Stock"
	1    10450 6000
	-1   0    0    1   
$EndComp
Text HLabel 9500 4750 0    50   Output ~ 0
Volt_A
Text HLabel 9500 5250 0    50   Output ~ 0
Volt_B
Text HLabel 9500 5750 0    50   Output ~ 0
Volt_C
Wire Wire Line
	9750 5750 9650 5750
Wire Wire Line
	9750 5250 9650 5250
Wire Wire Line
	9750 4750 9600 4750
Text HLabel 10450 5750 2    50   Input ~ 0
SH_C
Text HLabel 10450 5250 2    50   Input ~ 0
SH_B
Text HLabel 10450 4750 2    50   Input ~ 0
SH_A
Text HLabel 10450 4250 2    50   Input ~ 0
SUPPLY
Wire Wire Line
	9750 4250 9650 4250
Wire Wire Line
	9650 4250 9650 4450
Wire Wire Line
	9650 4450 9750 4450
Wire Wire Line
	9750 6000 9650 6000
Wire Wire Line
	9650 6000 9650 5750
Connection ~ 9650 5750
Wire Wire Line
	9650 5750 9500 5750
Wire Wire Line
	9750 5450 9650 5450
Wire Wire Line
	9650 5450 9650 5250
Connection ~ 9650 5250
Wire Wire Line
	9650 5250 9500 5250
Wire Wire Line
	9750 4950 9600 4950
Wire Wire Line
	9600 4950 9600 4750
Connection ~ 9600 4750
Wire Wire Line
	9600 4750 9500 4750
Text HLabel 9450 4250 0    50   Output ~ 0
Batt_voltage
Wire Wire Line
	9650 4250 9450 4250
Connection ~ 9650 4250
Wire Wire Line
	10450 5450 10800 5450
Wire Wire Line
	10800 4950 10450 4950
Wire Wire Line
	10800 4450 10450 4450
Wire Wire Line
	10800 4450 10800 4950
Connection ~ 10800 4950
Wire Wire Line
	10800 4950 10800 5450
Wire Wire Line
	10800 5450 10800 6000
Connection ~ 10800 5450
Wire Wire Line
	6250 3300 7750 3300
Wire Wire Line
	7750 3200 7750 3300
Wire Wire Line
	7150 3200 7750 3200
$Comp
L power:GND #PWR0137
U 1 1 5D48A5A5
P 2850 6050
F 0 "#PWR0137" H 2850 5800 50  0001 C CNN
F 1 "GND" H 2855 5877 50  0000 C CNN
F 2 "" H 2850 6050 50  0001 C CNN
F 3 "" H 2850 6050 50  0001 C CNN
	1    2850 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 6000 10500 6000
$Comp
L power:GND #PWR0146
U 1 1 5D48A6E5
P 10500 6000
F 0 "#PWR0146" H 10500 5750 50  0001 C CNN
F 1 "GND" H 10505 5827 50  0000 C CNN
F 2 "" H 10500 6000 50  0001 C CNN
F 3 "" H 10500 6000 50  0001 C CNN
	1    10500 6000
	1    0    0    -1  
$EndComp
Connection ~ 10500 6000
Wire Wire Line
	10500 6000 10800 6000
Wire Wire Line
	4000 5400 4650 5400
Wire Wire Line
	2850 6050 2850 5000
Wire Wire Line
	2850 6050 4000 6050
Connection ~ 4000 6050
Wire Wire Line
	4650 4000 3150 4000
Connection ~ 2850 6050
Wire Wire Line
	2650 5000 2850 5000
Wire Wire Line
	2650 4000 2650 5000
Wire Wire Line
	4000 6050 4500 6050
Connection ~ 2850 5000
Wire Wire Line
	3600 5000 4650 5000
Wire Wire Line
	4100 3800 4100 4800
Wire Wire Line
	4100 4800 3600 4800
$Comp
L power:GND #PWR0139
U 1 1 5D50B2C2
P 4300 5100
F 0 "#PWR0139" H 4300 4850 50  0001 C CNN
F 1 "GND" H 4305 4927 50  0000 C CNN
F 2 "" H 4300 5100 50  0001 C CNN
F 3 "" H 4300 5100 50  0001 C CNN
	1    4300 5100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
