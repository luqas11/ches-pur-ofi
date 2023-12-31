require("model2");	-- Import model2 machine globals

isPortAvailable = false; -- Indicates if the script should try to send data through the COM port
portName = "NULL"; -- Selected COM port, NULL by default

-- After the game is loaded, try to read the selected COM port number from the config file and attempt a connection
function Init()
	local file = io.open("com_port.txt")
	if file ~= nil
	then
		portName = file:read()
		file:close()
		isPortAvailable = true -- If a COM port number has been found, the script is ready to start sending data
	end
end

function Frame()
	local gameState = I960_ReadByte(0x5010A4)

	if   gameState==0x16	-- Ingame
	  or gameState==0x03	-- Attract ini
	  or gameState==0x04	-- Attract Higscore ini
	  or gameState==0x05	-- Attract Highscore
	  or gameState==0x06	-- Attract VR Ini
	  or gameState==0x07	-- Attract VR
	then
	 	Model2_SetStretchBLow(1)	-- Stretch the bg tilemap (sky & clouds) when widescreen
		Model2_SetWideScreen(1)
	else					-- No widescreen on the rest of the screens
	 	Model2_SetStretchBLow(0)
		Model2_SetWideScreen(0)
	end
end

-- After rendering each frame, check if a the COM port is available and try to send the current car speed
-- If something goes wrong, indicate it on the screen
function PostDraw()
--  Video_DrawText(250,100,(I960_ReadWord(RAMBASE + 0x5198)),0xFFFFFF) -- Show the current car speed on the screen
	local textColor = 0xFF7777 -- Initially, set the indicator text color to an error color

	if isPortAvailable
	then
		local serial = io.open(portName,"w")
		if serial ~= nil
		then
			serial:write(I960_ReadWord(RAMBASE + 0x5198) .. "a")
			serial:flush()
			serial:close()
			textColor = 0x77FF77 -- If the communication was successful, set the message color to a success color
		else
			isPortAvailable = false -- If the serial communication fails set the port availability to false, to prevent the script from retrying connection every frame
		end
	end

	Video_DrawText(5,5,portName,textColor) -- Draw the indicator text with the given color and COM port name
end

--Some sample code follows to show how to draw strings and setup options/cheats
--
--function PostDraw()
--	Video_DrawText(20,10,HEX32(I960_GetRamPtr(RAMBASE)),0xFFFFFF);
--	Video_DrawText(20,10,HEX32(I960_ReadWord(RAMBASE+0x10D0)),0xFFFFFF);
--	Video_DrawText(20,20,HEX32(RAMBASE),0xFFFFFF);
--	Video_DrawText(20,30,Options.cheat1.value,0xFFFFFF);
--	Video_DrawText(20,40,Input_IsKeyPressed(0x1E),0xFFFFFF);
--end
--
--function cheat1func(value)
--	
--end
--
--function cheat1change(value)
--
--end
--
--

function timecheatfunc(value)
	I960_WriteWord(RAMBASE+0x10D0,50*64);	--50 seconds always
end

Options =
{
--	cheat1={name="Cheat 1",values={"Off","On"},runfunc=cheat1func,changefunc=cheat1change},
	timecheat={name="Infinite Time",values={"Off","On"},runfunc=timecheatfunc}
}
