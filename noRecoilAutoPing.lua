------------------------------------
-------------- REWYERO -------------
------------------------------------

-- YOU CAN ACTIVATE THIS SCRIPT IN GAME WITH MOUSE WHEEL CLICK --
-- I use Left Alt for a Ping the enemys in Warzone, so you need maybe change this in game!

-------------------- Variable Section ----------------
recoilIsEnabled = True  	-- (True = Activated, False = Deactivated)
YrecoilSpeed = 4		 	-- Vertical Recoil Speed
secondRecoilSpeed = 2		-- Second Recoil Speed, after YRecoilSpeed
Ytime = 30		        	-- Second Recoil Speed Activated after YTime
autotag = 1			 		-- Auto Ping (1 = Enabled / 0 = Disabled) 
pingDelay = 6			 	-- Ping Delay (it will Ping again after Fire Click Pressed 6 Times)

------------------ !DO NOT CHANGE THIS VALUES! --------------
timer = 0			 -- DONT CHANGE THIS!
pingTimer = 0		 -- DONT CHANGE THIS!
------------------------- Function ---------------------

function OnEvent(event, arg)
    OutputLogMessage("event = %s, arg = %d\n", event, arg)
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
    elseif event == "PROFILE_DEACTIVATED" then
        ReleaseMouseButton(2)  -- to prevent it from being stuck on
    end
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 3) then 		-- arg == 3, Number 3 mean the middle Mouse Button. (Mouse Wheel Click)
        recoilx4 = not recoilx4
    end

   if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and recoilx4 and IsMouseButtonPressed(3)) then
		timer = 0
		AutoPing()

		if (pingTimer == pingDelay) then
			pingTimer = 0
		end

-- No Recoil
        if recoilx4 then
			if( timer == 0 ) then
         		repeat
            	Sleep(math.random(20, 80))
				if(recoilIsEnabled == True) then
           	 		MoveMouseRelative(0, YrecoilSpeed)
				end
				timer = timer + 1
            	until timer == Ytime or not IsMouseButtonPressed(1)
			end
			if( timer == Ytime) then
				repeat 
				Sleep(math.random(30, 80))
				if(recoilIsEnabled == False) then
           			MoveMouseRelative(0, secondRecoilSpeed)
				end
				until not IsMouseButtonPressed(1)
				pingTimer = 0
			end
  	end
   end
end
function AutoPing()
if (autotag == 1) then
		if (pingTimer == 0) then
			OutputLogMessage("Auto Ping\n")
			PressKey("lalt")
			Sleep(math.random(40, 120))
			ReleaseKey("lalt")
			Sleep(math.random(80, 220))
			PressKey("lalt")
			Sleep(math.random(30, 150))
			ReleaseKey("lalt")
			pingTimer = 1
		else
			pingTimer = pingTimer + 1
		end
	end
end
	