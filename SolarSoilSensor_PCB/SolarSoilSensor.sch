EESchema Schematic File Version 4
LIBS:power
LIBS:device
LIBS:74xx
LIBS:audio
LIBS:interface
LIBS:SolarSoilSensor-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Solar Motor Controller"
Date "2017-04-24"
Rev "1"
Comp "The Curious Electric Compnay"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:CP C1
U 1 1 58A49EA0
P 3150 2200
F 0 "C1" H 3175 2300 50  0000 L CNN
F 1 "0.47F" H 3175 2100 50  0000 L CNN
F 2 "REInnovationFootprint:C_0_47F_SuperCap" H 3188 2050 50  0001 C CNN
F 3 "" H 3150 2200 50  0000 C CNN
F 4 "~" H 3150 2200 60  0001 C CNN "Notes"
F 5 "~" H 3150 2200 60  0001 C CNN "Description"
F 6 "~" H 3150 2200 60  0001 C CNN "Manufacturer"
F 7 "~" H 3150 2200 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 3150 2200 60  0001 C CNN "Supplier 1"
F 9 "~" H 3150 2200 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.4" H 3150 2200 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 3150 2200 60  0001 C CNN "Supplier 2"
F 12 "~" H 3150 2200 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 3150 2200 60  0001 C CNN "Supplier 2 Cost"
F 14 "~" H 3150 2200 60  0001 C CNN "Cost"
	1    3150 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 58A4A198
P 2550 1750
F 0 "D1" H 2550 1850 50  0000 C CNN
F 1 "1N5819" H 2550 1650 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Diode_1" H 2550 1750 50  0001 C CNN
F 3 "" H 2550 1750 50  0000 C CNN
F 4 "~" H 2550 1750 60  0000 C CNN "Notes"
F 5 "~" H 2550 1750 60  0001 C CNN "Description"
F 6 "~" H 2550 1750 60  0001 C CNN "Manufacturer"
F 7 "~" H 2550 1750 60  0001 C CNN "Manufacturer Part No"
F 8 "RS" H 2550 1750 60  0001 C CNN "Supplier 1"
F 9 "~" H 2550 1750 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.03" H 2550 1750 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2550 1750 60  0001 C CNN "Supplier 2"
F 12 "~" H 2550 1750 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2550 1750 60  0001 C CNN "Supplier 2 Cost"
	1    2550 1750
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male P7
U 1 1 58A4A9B1
P 10300 6100
F 0 "P7" H 10300 6200 50  0000 C CNN
F 1 "LOGO1" V 10150 6100 50  0000 C CNN
F 2 "CuriousElectric3:2020_04_14_CuriousElectricCompany_Logo_Round_10mm_FCu" H 10300 6100 50  0001 C CNN
F 3 "" H 10300 6100 50  0000 C CNN
	1    10300 6100
	0    -1   1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male P8
U 1 1 58A4AA34
P 10600 6100
F 0 "P8" H 10600 6200 50  0000 C CNN
F 1 "LOGO2" V 10450 6100 50  0000 C CNN
F 2 "CuriousElectric3:TCEC_Words_13mm" H 10600 6100 50  0001 C CNN
F 3 "" H 10600 6100 50  0000 C CNN
	1    10600 6100
	0    -1   1    0   
$EndComp
$Comp
L matts_components:GND #PWR01
U 1 1 58A4AEF1
P 3800 2600
F 0 "#PWR01" H 3800 2350 50  0001 C CNN
F 1 "GND" H 3800 2450 50  0000 C CNN
F 2 "" H 3800 2600 50  0000 C CNN
F 3 "" H 3800 2600 50  0000 C CNN
	1    3800 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2000 2100 1750
Wire Wire Line
	2100 2400 2100 2500
Wire Wire Line
	3150 2050 3150 1750
Connection ~ 3150 1750
Wire Wire Line
	3150 2350 3150 2500
Connection ~ 3150 2500
Wire Wire Line
	3800 2500 3800 2600
NoConn ~ 10300 6300
NoConn ~ 10600 6300
Wire Wire Line
	2700 1750 3150 1750
$Comp
L power:VCC #PWR02
U 1 1 58FDDFB1
P 3750 1750
F 0 "#PWR02" H 3750 1600 50  0001 C CNN
F 1 "VCC" H 3750 1900 50  0000 C CNN
F 2 "" H 3750 1750 50  0000 C CNN
F 3 "" H 3750 1750 50  0000 C CNN
	1    3750 1750
	1    0    0    -1  
$EndComp
$Comp
L matts_components:ATTINY85-P IC1
U 1 1 58FDDFEF
P 3400 5900
F 0 "IC1" H 3500 5950 60  0000 C CNN
F 1 "ATTINY85-P" H 5400 5150 60  0000 C CNN
F 2 "REInnovationFootprint:DIP-8_300_ELL" H 3500 5150 60  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1744708.pdf?_ga=2.238630600.937687315.1494695229-1523402957.1422198431" H 3400 5900 60  0001 C CNN
F 4 "~" H 3400 5900 60  0001 C CNN "Notes"
F 5 "8 Bit uP 20MHz" H 3400 5900 60  0001 C CNN "Description"
F 6 "ATMEL" H 3400 5900 60  0001 C CNN "Manufacturer"
F 7 "ATTINY85-20PU" H 3400 5900 60  0001 C CNN "Manufacturer Part No"
F 8 "Farnell" H 3400 5900 60  0001 C CNN "Supplier 1"
F 9 "1455162" H 3400 5900 60  0001 C CNN "Supplier 1 Part No"
F 10 "1.12" H 3400 5900 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 3400 5900 60  0001 C CNN "Supplier 2"
F 12 "~" H 3400 5900 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 3400 5900 60  0001 C CNN "Supplier 2 Cost"
F 14 "~" H 3400 5900 60  0001 C CNN "Cost"
	1    3400 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 58FDE0E2
P 6100 6250
F 0 "C2" H 6125 6350 50  0000 L CNN
F 1 "100n" H 6125 6150 50  0000 L CNN
F 2 "REInnovationFootprint:C1_wide_lg_pad" H 6138 6100 50  0001 C CNN
F 3 "" H 6100 6250 50  0000 C CNN
F 4 "~" H 6100 6250 60  0001 C CNN "Notes"
F 5 "~" H 6100 6250 60  0001 C CNN "Description"
F 6 "~" H 6100 6250 60  0001 C CNN "Manufacturer"
F 7 "~" H 6100 6250 60  0001 C CNN "Manufacturer Part No"
F 8 "Rapid" H 6100 6250 60  0001 C CNN "Supplier 1"
F 9 "~" H 6100 6250 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.07" H 6100 6250 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 6100 6250 60  0001 C CNN "Supplier 2"
F 12 "~" H 6100 6250 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 6100 6250 60  0001 C CNN "Supplier 2 Cost"
F 14 "~" H 6100 6250 60  0001 C CNN "Cost"
	1    6100 6250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR05
U 1 1 58FDE32B
P 6100 5950
F 0 "#PWR05" H 6100 5800 50  0001 C CNN
F 1 "VCC" H 6100 6100 50  0000 C CNN
F 2 "" H 6100 5950 50  0000 C CNN
F 3 "" H 6100 5950 50  0000 C CNN
	1    6100 5950
	1    0    0    -1  
$EndComp
$Comp
L matts_components:GND #PWR06
U 1 1 58FDE35A
P 6100 6600
F 0 "#PWR06" H 6100 6350 50  0001 C CNN
F 1 "GND" H 6100 6450 50  0000 C CNN
F 2 "" H 6100 6600 50  0000 C CNN
F 3 "" H 6100 6600 50  0000 C CNN
	1    6100 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_CBE Q1
U 1 1 58FDE37F
P 5950 2500
F 0 "Q1" H 6250 2550 50  0000 R CNN
F 1 "BC547" H 6400 2450 50  0000 R CNN
F 2 "REInnovationFootprint:TO92-EBC_large_pad" H 6150 2600 50  0001 C CNN
F 3 "" H 5950 2500 50  0000 C CNN
	1    5950 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 58FDE43D
P 5400 2500
F 0 "R5" V 5480 2500 50  0000 C CNN
F 1 "1k" V 5400 2500 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5330 2500 50  0001 C CNN
F 3 "" H 5400 2500 50  0000 C CNN
F 4 "~" H 5400 2500 60  0000 C CNN "Notes"
F 5 "~" H 5400 2500 60  0001 C CNN "Description"
F 6 "~" H 5400 2500 60  0001 C CNN "Manufacturer"
F 7 "~" H 5400 2500 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 5400 2500 60  0001 C CNN "Supplier 1"
F 9 "~" H 5400 2500 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 5400 2500 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 5400 2500 60  0001 C CNN "Supplier 2"
F 12 "~" H 5400 2500 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 5400 2500 60  0001 C CNN "Supplier 2 Cost"
	1    5400 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5900 6000 6100 6000
Wire Wire Line
	6100 5950 6100 6000
Connection ~ 6100 6000
Wire Wire Line
	5900 6500 6100 6500
Wire Wire Line
	6100 6400 6100 6500
Connection ~ 6100 6500
$Comp
L power:VCC #PWR07
U 1 1 58FDEAEB
P 6050 1300
F 0 "#PWR07" H 6050 1150 50  0001 C CNN
F 1 "VCC" H 6050 1450 50  0000 C CNN
F 2 "" H 6050 1300 50  0000 C CNN
F 3 "" H 6050 1300 50  0000 C CNN
	1    6050 1300
	1    0    0    -1  
$EndComp
$Comp
L matts_components:GND #PWR08
U 1 1 58FDEB29
P 6050 2800
F 0 "#PWR08" H 6050 2550 50  0001 C CNN
F 1 "GND" H 6050 2650 50  0000 C CNN
F 2 "" H 6050 2800 50  0000 C CNN
F 3 "" H 6050 2800 50  0000 C CNN
	1    6050 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2800 6050 2700
Wire Wire Line
	6050 2300 6050 2100
Wire Wire Line
	6050 1400 6050 1300
Wire Wire Line
	5550 2500 5750 2500
Text HLabel 5050 2500 0    60   Input ~ 0
SOIL_POWER
Wire Wire Line
	5050 2500 5250 2500
Connection ~ 2100 1750
Wire Wire Line
	3650 5350 2950 5350
Wire Wire Line
	3650 5450 3000 5450
Wire Wire Line
	3650 5550 3050 5550
$Comp
L power:VCC #PWR09
U 1 1 58FDF957
P 4250 5300
F 0 "#PWR09" H 4250 5150 50  0001 C CNN
F 1 "VCC" H 4250 5450 50  0000 C CNN
F 2 "" H 4250 5300 50  0000 C CNN
F 3 "" H 4250 5300 50  0000 C CNN
	1    4250 5300
	1    0    0    -1  
$EndComp
$Comp
L matts_components:GND #PWR010
U 1 1 58FDF995
P 4450 5600
F 0 "#PWR010" H 4450 5350 50  0001 C CNN
F 1 "GND" H 4450 5450 50  0000 C CNN
F 2 "" H 4450 5600 50  0000 C CNN
F 3 "" H 4450 5600 50  0000 C CNN
	1    4450 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5550 4450 5550
Wire Wire Line
	4150 5350 4250 5350
Wire Wire Line
	4250 5350 4250 5300
Wire Wire Line
	4150 5450 4350 5450
Wire Wire Line
	4350 5750 3100 5750
Wire Wire Line
	3100 5750 3100 6000
Connection ~ 2950 6100
Connection ~ 3000 6200
Connection ~ 3100 6000
$Comp
L Device:R R1
U 1 1 59172111
P 1150 2100
F 0 "R1" V 1230 2100 50  0000 C CNN
F 1 "470k" V 1150 2100 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1080 2100 50  0001 C CNN
F 3 "" H 1150 2100 50  0000 C CNN
F 4 "~" H 1150 2100 60  0000 C CNN "Notes"
F 5 "~" H 1150 2100 60  0001 C CNN "Description"
F 6 "~" H 1150 2100 60  0001 C CNN "Manufacturer"
F 7 "~" H 1150 2100 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 1150 2100 60  0001 C CNN "Supplier 1"
F 9 "~" H 1150 2100 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 1150 2100 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 1150 2100 60  0001 C CNN "Supplier 2"
F 12 "~" H 1150 2100 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 1150 2100 60  0001 C CNN "Supplier 2 Cost"
	1    1150 2100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 59172117
P 1150 2550
F 0 "R2" V 1230 2550 50  0000 C CNN
F 1 "10k" V 1150 2550 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1080 2550 50  0001 C CNN
F 3 "" H 1150 2550 50  0000 C CNN
F 4 "~" H 1150 2550 60  0000 C CNN "Notes"
F 5 "~" H 1150 2550 60  0001 C CNN "Description"
F 6 "~" H 1150 2550 60  0001 C CNN "Manufacturer"
F 7 "~" H 1150 2550 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 1150 2550 60  0001 C CNN "Supplier 1"
F 9 "~" H 1150 2550 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 1150 2550 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 1150 2550 60  0001 C CNN "Supplier 2"
F 12 "~" H 1150 2550 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 1150 2550 60  0001 C CNN "Supplier 2 Cost"
	1    1150 2550
	-1   0    0    1   
$EndComp
$Comp
L matts_components:GND #PWR013
U 1 1 59172123
P 1150 2800
F 0 "#PWR013" H 1150 2550 50  0001 C CNN
F 1 "GND" H 1150 2650 50  0000 C CNN
F 2 "" H 1150 2800 50  0000 C CNN
F 3 "" H 1150 2800 50  0000 C CNN
	1    1150 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 2250 1150 2300
Wire Wire Line
	1150 2700 1150 2800
Text HLabel 1350 2300 2    60   Output ~ 0
Vsolar
Wire Wire Line
	1150 2300 1350 2300
Connection ~ 1150 2300
Text HLabel 2650 6400 0    60   Input ~ 0
Vsolar
Wire Wire Line
	3050 6500 3200 6500
$Comp
L Device:R R6
U 1 1 591769AF
P 8750 1750
F 0 "R6" V 8830 1750 50  0000 C CNN
F 1 "330" V 8750 1750 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 8680 1750 50  0001 C CNN
F 3 "" H 8750 1750 50  0000 C CNN
F 4 "~" H 8750 1750 60  0000 C CNN "Notes"
F 5 "~" H 8750 1750 60  0001 C CNN "Description"
F 6 "~" H 8750 1750 60  0001 C CNN "Manufacturer"
F 7 "~" H 8750 1750 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 8750 1750 60  0001 C CNN "Supplier 1"
F 9 "~" H 8750 1750 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 8750 1750 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 8750 1750 60  0001 C CNN "Supplier 2"
F 12 "~" H 8750 1750 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 8750 1750 60  0001 C CNN "Supplier 2 Cost"
	1    8750 1750
	1    0    0    -1  
$EndComp
$Comp
L matts_components:GND #PWR014
U 1 1 59176BF9
P 8750 3500
F 0 "#PWR014" H 8750 3250 50  0001 C CNN
F 1 "GND" H 8750 3350 50  0000 C CNN
F 2 "" H 8750 3500 50  0000 C CNN
F 3 "" H 8750 3500 50  0000 C CNN
	1    8750 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5450 4350 5750
Wire Wire Line
	3050 5550 3050 6500
Wire Wire Line
	3000 5450 3000 6200
Wire Wire Line
	2950 5350 2950 6100
Wire Notes Line
	500  3950 11200 3950
Wire Notes Line
	4300 3950 4300 500 
Text Notes 950  5250 0    60   ~ 0
ATTiny85 Arduino Pins:\nIC Pin:       Arduino Ref:\n1                5/A0/RST\n2                3/A3\n3                4/A2\n4                GND\n5                0 - PWM\n6                1 - PWM\n7                2/A1\n8                +Supply
$Comp
L Device:LED D2
U 1 1 5968E412
P 8750 2200
F 0 "D2" H 8750 2300 50  0000 C CNN
F 1 "LED" H 8750 2100 50  0000 C CNN
F 2 "REInnovationFootprint:LED-5MM_larg_pad" H 8750 2200 50  0001 C CNN
F 3 "" H 8750 2200 50  0000 C CNN
F 4 "~" H 8750 2200 60  0000 C CNN "Notes"
F 5 "5mm White LED ?" H 8750 2200 60  0001 C CNN "Description"
F 6 "~" H 8750 2200 60  0001 C CNN "Manufacturer"
F 7 "~" H 8750 2200 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 8750 2200 60  0001 C CNN "Supplier 1"
F 9 "~" H 8750 2200 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.1" H 8750 2200 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 8750 2200 60  0001 C CNN "Supplier 2"
F 12 "~" H 8750 2200 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 8750 2200 60  0001 C CNN "Supplier 2 Cost"
	1    8750 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8750 1400 8750 1600
Text Notes 4800 5500 0    60   ~ 0
ISP Connections:\n1 - MISO\n2 - Vcc\n3 - SCK\n4 - MOSI\n5 - RESET\n6 - GND\n
Wire Wire Line
	4450 5550 4450 5600
Wire Wire Line
	6100 6000 6100 6100
Wire Wire Line
	6100 6500 6100 6600
Wire Wire Line
	2100 1750 2400 1750
Wire Wire Line
	2100 2500 3150 2500
Wire Wire Line
	2950 6100 3200 6100
Wire Wire Line
	3000 6200 3200 6200
Wire Wire Line
	3100 6000 3200 6000
Wire Wire Line
	1150 2300 1150 2400
$Comp
L Device:Speaker LS1
U 1 1 5E8A140A
P 10500 2450
F 0 "LS1" H 10670 2446 50  0000 L CNN
F 1 "PIEZO" H 10670 2355 50  0000 L CNN
F 2 "REInnovationFootprint:TH_PIEZO_17x7" H 10500 2250 50  0001 C CNN
F 3 "~" H 10490 2400 50  0001 C CNN
	1    10500 2450
	1    0    0    -1  
$EndComp
Text HLabel 2650 6200 0    60   Input ~ 0
LED
Text HLabel 2650 6000 0    60   Input ~ 0
PIEZO
Text HLabel 8350 2600 0    60   Input ~ 0
LED
Text HLabel 10100 1300 0    60   Input ~ 0
PIEZO
$Comp
L matts_components:GND #PWR0101
U 1 1 5E8C2F6A
P 10300 3100
F 0 "#PWR0101" H 10300 2850 50  0001 C CNN
F 1 "GND" H 10300 2950 50  0000 C CNN
F 2 "" H 10300 3100 50  0000 C CNN
F 3 "" H 10300 3100 50  0000 C CNN
	1    10300 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 2450 10300 2000
Wire Wire Line
	10300 2550 10300 3100
$Comp
L Device:Solar_Cells SC1
U 1 1 58A49F68
P 2100 2200
F 0 "SC1" H 2200 2300 50  0000 L CNN
F 1 "SOLAR PV" H 2200 2200 50  0000 L CNN
F 2 "REInnovationFootprint:PV_53x30mm_TH" V 2100 2260 50  0001 C CNN
F 3 "" V 2100 2260 50  0000 C CNN
F 4 "~" H 2100 2200 60  0000 C CNN "Notes"
F 5 "53x30mm 30mA 5V PV module" H 2100 2200 60  0001 C CNN "Description"
F 6 "~" H 2100 2200 60  0001 C CNN "Manufacturer"
F 7 "~" H 2100 2200 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 2100 2200 60  0001 C CNN "Supplier 1"
F 9 "~" H 2100 2200 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.7" H 2100 2200 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2100 2200 60  0001 C CNN "Supplier 2"
F 12 "~" H 2100 2200 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2100 2200 60  0001 C CNN "Supplier 2 Cost"
	1    2100 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male P3
U 1 1 58FDE4BD
P 7300 2000
F 0 "P3" H 7300 2150 50  0000 C CNN
F 1 "SOIL_SENSOR" V 7200 1950 50  0000 C CNN
F 2 "CuriousElectric3:2020_04_14_SolarSoilSensorPCB_Outline" H 7300 2000 50  0001 C CNN
F 3 "" H 7300 2000 50  0000 C CNN
	1    7300 2000
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J1
U 1 1 5E921125
P 3850 5450
F 0 "J1" H 3900 5767 50  0000 C CNN
F 1 "ISP" H 3900 5676 50  0000 C CNN
F 2 "REInnovationFootprint:TH3x2_ISP" H 3850 5450 50  0001 C CNN
F 3 "~" H 3850 5450 50  0001 C CNN
	1    3850 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 1900 8750 2050
Wire Wire Line
	8750 2350 8750 2600
$Comp
L Device:R R3
U 1 1 5E93E069
P 6450 1400
F 0 "R3" V 6530 1400 50  0000 C CNN
F 1 "100k" V 6450 1400 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 6380 1400 50  0001 C CNN
F 3 "" H 6450 1400 50  0000 C CNN
F 4 "~" H 6450 1400 60  0000 C CNN "Notes"
F 5 "~" H 6450 1400 60  0001 C CNN "Description"
F 6 "~" H 6450 1400 60  0001 C CNN "Manufacturer"
F 7 "~" H 6450 1400 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 6450 1400 60  0001 C CNN "Supplier 1"
F 9 "~" H 6450 1400 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 6450 1400 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 6450 1400 60  0001 C CNN "Supplier 2"
F 12 "~" H 6450 1400 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 6450 1400 60  0001 C CNN "Supplier 2 Cost"
	1    6450 1400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 1400 6300 1400
Wire Wire Line
	6950 1400 6950 2000
Wire Wire Line
	6950 2000 7100 2000
Wire Wire Line
	6600 1400 6950 1400
Wire Wire Line
	6050 2100 7100 2100
Text HLabel 6550 2000 0    60   Input ~ 0
SOIL_SENSE
Text HLabel 2650 6300 0    60   Input ~ 0
SOIL_SENSE
Text HLabel 2650 6100 0    60   Input ~ 0
SOIL_POWER
Wire Wire Line
	6950 2000 6550 2000
Connection ~ 6950 2000
Wire Wire Line
	3150 2500 3800 2500
Wire Wire Line
	3150 1750 3750 1750
Wire Wire Line
	1150 1950 1150 1750
Wire Wire Line
	1150 1750 2100 1750
Wire Wire Line
	2650 6000 3100 6000
Wire Wire Line
	2650 6100 2950 6100
Wire Wire Line
	2650 6200 3000 6200
Wire Wire Line
	2650 6300 3200 6300
Wire Wire Line
	2650 6400 3200 6400
$Comp
L power:VCC #PWR03
U 1 1 5E970932
P 8750 1400
F 0 "#PWR03" H 8750 1250 50  0001 C CNN
F 1 "VCC" H 8750 1550 50  0000 C CNN
F 2 "" H 8750 1400 50  0000 C CNN
F 3 "" H 8750 1400 50  0000 C CNN
	1    8750 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E97F08E
P 10300 1850
F 0 "R4" V 10380 1850 50  0000 C CNN
F 1 "120" V 10300 1850 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 10230 1850 50  0001 C CNN
F 3 "" H 10300 1850 50  0000 C CNN
F 4 "~" H 10300 1850 60  0000 C CNN "Notes"
F 5 "~" H 10300 1850 60  0001 C CNN "Description"
F 6 "~" H 10300 1850 60  0001 C CNN "Manufacturer"
F 7 "~" H 10300 1850 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 10300 1850 60  0001 C CNN "Supplier 1"
F 9 "~" H 10300 1850 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 10300 1850 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 10300 1850 60  0001 C CNN "Supplier 2"
F 12 "~" H 10300 1850 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 10300 1850 60  0001 C CNN "Supplier 2 Cost"
	1    10300 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 1300 10300 1300
Wire Wire Line
	10300 1300 10300 1700
$Comp
L matts_components:SW_PUSH SW1
U 1 1 5E99FAC3
P 8750 3100
F 0 "SW1" V 8797 3040 50  0000 R CNN
F 1 "SET" V 8704 3040 50  0000 R CNN
F 2 "REInnovationFootprint:SW_PUSH_SMALL_lg_pad" H 8750 3100 60  0001 C CNN
F 3 "" H 8750 3100 60  0000 C CNN
	1    8750 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8350 2600 8750 2600
Wire Wire Line
	8750 2600 8750 2800
Connection ~ 8750 2600
Wire Wire Line
	8750 3400 8750 3500
$EndSCHEMATC
