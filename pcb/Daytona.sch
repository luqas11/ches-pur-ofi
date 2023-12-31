EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Connector_Generic:Conn_01x08 J1
U 1 1 5FF5F938
P 3800 4400
F 0 "J1" H 3880 4392 50  0000 L CNN
F 1 "Botones" H 3880 4301 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 3800 4400 50  0001 C CNN
F 3 "~" H 3800 4400 50  0001 C CNN
	1    3800 4400
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J2
U 1 1 5FF600FF
P 7250 4300
F 0 "J2" H 7330 4292 50  0000 L CNN
F 1 "Pedales+Velocimetro+Monedas" H 7330 4201 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 7250 4300 50  0001 C CNN
F 3 "~" H 7250 4300 50  0001 C CNN
	1    7250 4300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5FF60E39
P 7100 3700
F 0 "J3" H 7180 3742 50  0000 L CNN
F 1 "Volante" H 7180 3651 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 7100 3700 50  0001 C CNN
F 3 "~" H 7100 3700 50  0001 C CNN
	1    7100 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4100 6400 4100
$Comp
L MCU_Module:Arduino_Leonardo A1
U 1 1 5FF63410
P 5900 4000
F 0 "A1" H 5900 5181 50  0000 C CNN
F 1 "Arduino_Leonardo" H 5900 5090 50  0000 C CNN
F 2 "luqas11:Arduino_Leonardo_WithFemaleSockets" H 5900 4000 50  0001 C CIN
F 3 "https://www.arduino.cc/en/Main/ArduinoBoardLeonardo" H 5900 4000 50  0001 C CNN
	1    5900 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5100 6850 5100
Wire Wire Line
	6650 4300 6650 4100
Wire Wire Line
	6550 4400 6550 4200
Wire Wire Line
	6550 4200 6400 4200
Wire Wire Line
	6750 4100 6750 3600
Wire Wire Line
	6850 4200 6850 5100
Wire Wire Line
	6900 3800 6600 3800
Wire Wire Line
	6600 3800 6600 4000
Wire Wire Line
	6600 4000 6400 4000
Wire Wire Line
	6900 3700 6850 3700
Wire Wire Line
	6850 3700 6850 4200
Connection ~ 6850 4200
Wire Wire Line
	6900 3600 6750 3600
Connection ~ 6750 3600
Wire Wire Line
	6100 2750 6100 3000
Wire Wire Line
	6100 2750 6750 2750
Wire Wire Line
	6750 2750 6750 3600
Wire Wire Line
	6950 4500 6950 5200
Wire Wire Line
	6950 5200 5250 5200
Wire Wire Line
	4000 5100 5800 5100
Wire Wire Line
	5400 4600 4000 4600
Wire Wire Line
	4000 4500 5400 4500
Wire Wire Line
	4000 4400 5400 4400
Wire Wire Line
	4000 4300 5400 4300
Wire Wire Line
	4000 4200 5400 4200
Wire Wire Line
	4000 4100 5400 4100
Wire Wire Line
	4000 4000 5400 4000
Wire Wire Line
	7050 4500 6950 4500
Wire Wire Line
	6550 4400 7050 4400
Wire Wire Line
	6650 4300 7050 4300
Wire Wire Line
	6850 4200 7050 4200
Wire Wire Line
	6750 4100 7050 4100
Wire Wire Line
	7050 4600 7050 5300
Wire Wire Line
	7050 5300 5150 5300
Wire Wire Line
	4000 4700 4000 5100
Wire Wire Line
	5250 5200 5250 3900
Wire Wire Line
	5250 3900 5400 3900
Wire Wire Line
	5150 5300 5150 3800
Wire Wire Line
	5150 3800 5400 3800
$EndSCHEMATC
