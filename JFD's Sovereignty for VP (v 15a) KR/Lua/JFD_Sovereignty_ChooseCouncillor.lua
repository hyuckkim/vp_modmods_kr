-------------------------------------------------
-- Choose Councillor Popup
-------------------------------------------------

g_Unit = nil
g_Councillor = nil

-------------------------------------------------------------------------------
function OnConfirmYes()
    Players[Game.GetActivePlayer()]:SetHasCouncillor(g_Unit, g_Unit:GetUnitType(), g_Councillor, g_Unit:GetName())
    LuaEvents.ChooseCouncillor(nil)
    UIManager:DequeuePopup(ContextPtr);
end
Controls.ConfirmYes:RegisterCallback(Mouse.eLClick, OnConfirmYes)
-------------------------------------------------------------------------------
function OnConfirmNo()
    UIManager:DequeuePopup(ContextPtr);
end
Controls.ConfirmNo:RegisterCallback(Mouse.eLClick, OnConfirmNo)
-------------------------------------------------
function ShowHideHandler(bIsHide, bInitState)
	if (not bInitState and not bIsHide) then

        if (not g_Unit) or (not g_Councillor) then
            return
        end

        local player = Players[Game.GetActivePlayer()]
        if (not player) then 
            return  
        end
        
        local unitType = g_Unit:GetUnitType()
        local unitInfo = GameInfo.Units[unitType]
        local unitDesc = unitInfo.Description
        
    	Controls.CouncillorConfirmLabel:LocalizeAndSetText("TXT_KEY_JFD_COUNCILLOR_APPOINT_CONFIRM", g_Unit:GetName(), g_Councillor.Description)
	end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)
ContextPtr:SetHide(true)
--------------------------------------------------------------------
function OnActivePlayerChanged()
	UIManager:DequeuePopup(ContextPtr);
end
Events.GameplaySetActivePlayer.Add(OnActivePlayerChanged);
-------------------------------------------------
function ShowChooseCouncillor(unit, councillor)	
	if (not Players[Game.GetActivePlayer()]:IsHuman()) then return end
    g_Unit = unit
    g_Councillor = councillor
	UIManager:QueuePopup(ContextPtr, PopupPriority.SocialPolicy)
end
LuaEvents.UI_ShowChooseCouncillor.Add(ShowChooseCouncillor)


