-- Select
-- Author: Richard
-- DateCreated: 2/21/2015 2:24:17 PM
--------------------------------------------------------------
-- WORK IN PROGRESS --

Controls.EUROPE:RegisterCallback(Mouse.eLClick, function() 
	ContextPtr:SetHide(true)
end);

Controls.ASIA:RegisterCallback(Mouse.eLClick, function() 
	ContextPtr:SetHide(true)
end);

Controls.AFRICA:RegisterCallback(Mouse.eLClick, function() 
	ContextPtr:SetHide(true)
end);

Controls.AMERICA:RegisterCallback(Mouse.eLClick, function() 
	ContextPtr:SetHide(true)
end);

Controls.MIDEASTERN:RegisterCallback(Mouse.eLClick, function() 
	ContextPtr:SetHide(true)
end);

Controls.CANCEL:RegisterCallback(Mouse.eLClick, function() 
	Events.AudioDebugChangeMusic(true,false,false);
end);
