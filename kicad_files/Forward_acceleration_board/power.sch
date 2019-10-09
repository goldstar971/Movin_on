EESchema Schematic File Version 4
LIBS:Forward_acceleration_board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
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
L TC2117-3.3VDBTR:TC2117-3.3VDBTR Reg1
U 1 1 5D8DA77D
P 4500 3250
F 0 "Reg1" H 5150 3400 50  0000 C CNN
F 1 "TC2117" H 5150 3000 50  0000 C CNN
F 2 "TC2117-3.3VDBTR:SOT230P700X180-4N" H 5650 3350 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/2/TC2117-3.3VDBTR.pdf" H 5650 3250 50  0001 L CNN
F 4 "Microchip TC2117-3.3VDBTR, LDO Voltage Regulator, 800mA, 3.3 V +/-0.5%, 2.7  6 Vin, 3-Pin SOT-223" H 5650 3150 50  0001 L CNN "Description"
F 5 "1.8" H 5650 3050 50  0001 L CNN "Height"
F 6 "Microchip" H 5650 2950 50  0001 L CNN "Manufacturer_Name"
F 7 "TC2117-3.3VDBTR" H 5650 2850 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "579-TC2117-3.3VDBTR" H 5650 2750 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=579-TC2117-3.3VDBTR" H 5650 2650 50  0001 L CNN "Mouser Price/Stock"
F 10 "8234434" H 5650 2550 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/8234434" H 5650 2450 50  0001 L CNN "RS Price/Stock"
	1    4500 3250
	1    0    0    -1  
$EndComp
$Comp
L GRM155C81C105ME11J:GRM155C81C105ME11J C2
U 1 1 5D8DA8C1
P 6300 3500
F 0 "C2" V 6504 3628 50  0000 L CNN
F 1 "1u" V 6595 3628 50  0000 L CNN
F 2 "GRM155C91C105ME11J:CAPC1005X55N" H 6650 3550 50  0001 L CNN
F 3 "http://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c02e.pdf" H 6650 3450 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT" H 6650 3350 50  0001 L CNN "Description"
F 5 "0.55" H 6650 3250 50  0001 L CNN "Height"
F 6 "Murata Electronics" H 6650 3150 50  0001 L CNN "Manufacturer_Name"
F 7 "GRM155C81C105ME11J" H 6650 3050 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "81-GRM155C81C105ME1J" H 6650 2950 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=81-GRM155C81C105ME1J" H 6650 2850 50  0001 L CNN "Mouser Price/Stock"
	1    6300 3500
	0    1    1    0   
$EndComp
$Comp
L GRM155C81C105ME11J:GRM155C81C105ME11J C1
U 1 1 5D8DA9F0
P 4250 3900
F 0 "C1" V 4546 3772 50  0000 R CNN
F 1 "1u" V 4455 3772 50  0000 R CNN
F 2 "GRM155C91C105ME11J:CAPC1005X55N" H 4600 3950 50  0001 L CNN
F 3 "http://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c02e.pdf" H 4600 3850 50  0001 L CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT" H 4600 3750 50  0001 L CNN "Description"
F 5 "0.55" H 4600 3650 50  0001 L CNN "Height"
F 6 "Murata Electronics" H 4600 3550 50  0001 L CNN "Manufacturer_Name"
F 7 "GRM155C81C105ME11J" H 4600 3450 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "81-GRM155C81C105ME1J" H 4600 3350 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=81-GRM155C81C105ME1J" H 4600 3250 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 4600 3150 50  0001 L CNN "RS Part Number"
F 11 "" H 4600 3050 50  0001 L CNN "RS Price/Stock"
	1    4250 3900
	0    -1   -1   0   
$EndComp
NoConn ~ 5800 3350
$Comp
L power:GND #PWR0135
U 1 1 5D8DABF4
P 6300 4100
F 0 "#PWR0135" H 6300 3850 50  0001 C CNN
F 1 "GND" H 6305 3927 50  0000 C CNN
F 2 "" H 6300 4100 50  0001 C CNN
F 3 "" H 6300 4100 50  0001 C CNN
	1    6300 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4100 6300 4000
Wire Wire Line
	5800 3250 6300 3250
Wire Wire Line
	6300 3250 6300 3500
Wire Wire Line
	4500 3250 4250 3250
Wire Wire Line
	4250 3250 4250 3400
Wire Wire Line
	4250 3900 4350 3900
Wire Wire Line
	4500 3900 4500 3350
$Comp
L power:GND #PWR0136
U 1 1 5D8DAFBB
P 4250 3250
F 0 "#PWR0136" H 4250 3000 50  0001 C CNN
F 1 "GND" H 4255 3077 50  0000 C CNN
F 2 "" H 4250 3250 50  0001 C CNN
F 3 "" H 4250 3250 50  0001 C CNN
	1    4250 3250
	-1   0    0    1   
$EndComp
Connection ~ 4250 3250
$Comp
L power:+3.3V #PWR0137
U 1 1 5D8DB052
P 4350 3900
F 0 "#PWR0137" H 4350 3750 50  0001 C CNN
F 1 "+3.3V" H 4365 4073 50  0000 C CNN
F 2 "" H 4350 3900 50  0001 C CNN
F 3 "" H 4350 3900 50  0001 C CNN
	1    4350 3900
	-1   0    0    1   
$EndComp
Connection ~ 4350 3900
Wire Wire Line
	4350 3900 4500 3900
$Comp
L power:+5V #PWR0138
U 1 1 5D8DB134
P 6300 3250
F 0 "#PWR0138" H 6300 3100 50  0001 C CNN
F 1 "+5V" H 6315 3423 50  0000 C CNN
F 2 "" H 6300 3250 50  0001 C CNN
F 3 "" H 6300 3250 50  0001 C CNN
	1    6300 3250
	1    0    0    -1  
$EndComp
Connection ~ 6300 3250
$EndSCHEMATC
