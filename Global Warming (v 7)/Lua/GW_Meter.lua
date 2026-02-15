-- GW_Meter
-- Author: FramedArchitecture
-- DateCreated: 4/25/2013
--------------------------------------------------------------------
local MapModData		= MapModData
MapModData.g_Properties	= MapModData.g_Properties or {}
local g_Properties		= MapModData.g_Properties
local insert			= table.insert
local concat			= table.concat
local fIndex			= 0
local myIndex			= 0
--------------------------------------------------------------------
function UpdateGlobalWarmingMeter()
    local fCurrent = ((fIndex/100) * 184) / 190
	local myCurrent = ((myIndex/100) * 184) / 190
    Controls.GW_MeterBar:SetPercents(myCurrent, fCurrent)
	Controls.GW_MeterBar:SetToolTipString( GetGlobalWarmingTooltip() );
end
--------------------------------------------------------------------
function GetGlobalWarmingTooltip()
	local tips = {}
	if (fIndex > 0) then
		insert(tips, Locale.ConvertTextKey("TXT_KEY_GW_METER_TOOLTIP", fIndex, myIndex))
		
		local events = g_Properties.g_GWEvents or {}
		if #events > 0 then
			insert(tips, "------------------------")
			insert(tips, Locale.ConvertTextKey("TXT_KEY_GW_METER_EVENTS"))
			for _,v in ipairs(events) do
				if (v.threshold <= fIndex) then
					insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey(v.title));
				end
			end
		end
	else
		insert(tips, Locale.ConvertTextKey("TXT_KEY_GW_METER_NONE_TOOLTIP"))
	end
	return concat(tips, "[NEWLINE]")
end
--------------------------------------------------------------------
function OnClose()
	ContextPtr:SetHide(true)
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose)
--------------------------------------------------------------------
function InputHandler(uiMsg, wParam, lParam)
	if (uiMsg == KeyEvents.KeyDown) then
		if (wParam == Keys.VK_ESCAPE) then
			OnClose()
			return true
		end
	end
end
ContextPtr:SetInputHandler(InputHandler)
--------------------------------------------------------------------
function ShowHideHandler(bIsHide, bInitState)
	if (not bInitState and not bIsHide) then
		if g_Properties.g_GWIntialized then
			LuaEvents.UpdateGlobalWarmingIndex()
			fIndex = g_Properties.fIndex
			myIndex = g_Properties.myIndex
		else
			fIndex = 0
			myIndex = 0
		end
		UpdateGlobalWarmingMeter()
	end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)
--------------------------------------------------------------------
function OnGlobalWarmingMeter()
	ContextPtr:SetHide(false)
end
--------------------------------------------------------------------
function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
	table.insert(additionalEntries, {text=Locale.ConvertTextKey("TXT_KEY_GW_METER_DIPLO_CORNER_HOOK"), call=OnGlobalWarmingMeter})
end
--------------------------------------------------------------------
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()
--------------------------------------------------------------------
--ContextPtr:SetHide(true)
Events.GameplaySetActivePlayer.Add(OnClose);


