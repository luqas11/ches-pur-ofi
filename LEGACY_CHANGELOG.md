# Historial de versiones

## Versión 1.3.0 (11/1/2023)
*Probado en la máquina del Daytona.*

#### Software:
- Calibración de potenciómetros
- Creación de script interactivo para autogenerar el archivo `com_port.txt` e iniciar el juego

## Versión 1.2 (8/12/2021)
*Probado en la máquina del Daytona.*
#### Software:
- Reemplazo de la comunicación via script C# por comunicación serie directa para el envío de la velocidad actual
- Handleo de errores de conexión con el puerto COM
- Ajustes de código en el sketch

## Versión 1.1 (4/4/2021)
*Probado con PCB propio.*
#### Software:
- Cuatro entradas digitales nuevas, ocho en totaL
- Modificación de script LUA para comunicar el valor de la velocidad actual
- Creación de un script C# para enviar la salida del LUA a Arduino por comunicación serie
- Salida para el servo del velocímetro, basado en el valor recibido del script C#

#### Hardware:
- PCB con pines para Arduino y los conectores de E/S

## Versión 1.0 (19/4/2019)  
*Probado con protoboard.*
#### Software:
- Tres entradas analógicas para potenciómetros
- Cuatro entradas digitales para botones

#### Hardware:
- Cableado en protoboard

## Versión 0.x (N/A)  
Sin documentar.

## Pinout de Arduino:

| Pin | Salida | 
|---|---|
| GND | GND |
| 5V | 5V |
| 4 | Velocímetro |
| 5 | Monedas |
| 6 | Cambio 5 |
| 7 | Cambio 2 |
| 8 | Cambio 6 |
| 9 | Cambio 3 |
| 10 | Cambio 1 |
| 11 | Cambio 4 |
| 12 | Cambio 7 |
| A0 | Volante |
| A1 | Acelerador |
| A2 | Freno |
