-- Lua Script1
-- Author: Richard
-- DateCreated: 8/26/2013 1:55:26 PM
--------------------------------------------------------------

Controls.OK:RegisterCallback(Mouse.eLClick, function() 
	Events.AudioDebugChangeMusic(true,false,false);
	print("Music changer: current song skipped")
end);

Controls.OK:RegisterCallback(Mouse.eRClick, function() 
	local select = Controls.Select
	select:SetHide(false)
end);