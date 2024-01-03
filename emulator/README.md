## Emulator

> [!IMPORTANT]  
> Since the **SEGA Model 2 Emulator** has no license file and it's webpage is down, i can't link a reference to the original author to give credits. The README file states that the author is *ElSemi*, and it's page (currently down) is http://nebula.emulatronia.com.

#### How this works
The *Model 2* emulator calls the functions defined in the `daytona.lua` script during the game execution. That allows the development of additional features integrated with the emulation state and lifecycle.  
In this case, the `daytona.lua` script reads the current car speed from the RAM address `0x00505198`, and sends it through the COM port as a string with the format `XXXa`, where *XXX* is the speed value and *a* is the line ending character. It gets the board's COM port number from a configuration file named `com_port.txt`, which has a single line string with the port name in the format `COMX`, with *X* as the port number.

#### Configuration
As mentioned, the COM port number is picked from the `com_port.txt` configuration file where it is written in a specific string format. The `Daytona USA.bat` script allows the user to interactivelly generate this file if it's not present. At launch, it asks the user for the port number and generates the file with the port name string. If the file already exists, it launches the game without asking anyting.

#### Port status messages
In the top left corner of the screen, a small green or red text indicates the port connection status:
- If the script can't find the configuration file, the `NULL` text is shown in **red**
- If the script finds the file but can't establish a connection, the port name is shown in **red**
- If the script finds the file and establishes a successful connection, the port name is shown in **green**
- If the script loses connection with the port at any time of the gameplay, the port name turns into **red**

Notice that the script will not retry the port connection if it's lost during the gameplay, so a emulator reset is needed for reconnection.
