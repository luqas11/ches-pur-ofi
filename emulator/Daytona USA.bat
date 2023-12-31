@echo off

echo Launching Daytona USA...
echo.

:: If the config file exists, launch the game and finish the script
if exist "./com_port.txt" (
    start emulator_multicpu.exe daytona
    exit 0
)

:: If the config file doesn't exists, ask the COM port number and create it
:ask
set /p port="Enter the COM port number to use: "
echo %port%|findstr /r "[^0-9]" > nul && (
    echo The COM port number can only contain numeric characters.
    echo.
    goto :ask
)

:: After a valid COM port number has been set, launch the game
echo COM%port%> com_port.txt
start emulator_multicpu.exe daytona
