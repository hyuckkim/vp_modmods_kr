-- WonderRace.lua
-- Author: Cynther
-- Based on work by: hambil
-- DateCreated: 4/17/2013 2:01:35 AM
--------------------------------------------------------------
include('WRLib.lua')
include("IconSupport")

function Init()
	print("ui\\WonderRace.lua loaded")
	Controls.WRDialogPanel:SetHide(true)
	Controls.WROptionsPanel:SetHide(true)
	ContextPtr:SetHide(false)
	--IconHookup(22, 80, "CIV_COLOR_ATLAS", Controls.WROptionsTopIcon)	-- Change to custom logo
	Controls.WROptionsTurnDiffCheckBox:SetCheck(MapModData.WonderRace.Options.TurnDiff)
	Controls.WROptionsCompIDCheckBox:SetCheck(MapModData.WonderRace.Options.CompID)
	Controls.WROptionsDetectWonderCheckBox:SetCheck(MapModData.WonderRace.Options.DetectWonder)
	Controls.WROptionsLosingNotifCheckBox:SetCheck(MapModData.WonderRace.Options.LosingNotif)
end

-- Default show/hide call
ContextPtr:SetShowHideHandler(function (bIsHide, bInitState) end)

function OnTurnDiffOptionChanged(bIsChecked)
	MapModData.WonderRace.Options.TurnDiff = bIsChecked
end
Controls.WROptionsTurnDiffCheckBox:RegisterCheckHandler(OnTurnDiffOptionChanged)

function OnCompIDOptionChanged(bIsChecked)
	MapModData.WonderRace.Options.CompID = bIsChecked
end
Controls.WROptionsCompIDCheckBox:RegisterCheckHandler(OnCompIDOptionChanged)

function OnDetectWonderOptionChanged(bIsChecked)
	MapModData.WonderRace.Options.DetectWonder = bIsChecked
end
Controls.WROptionsDetectWonderCheckBox:RegisterCheckHandler(OnDetectWonderOptionChanged)

function OnLosingNotifOptionChanged(bIsChecked)
	MapModData.WonderRace.Options.LosingNotif = bIsChecked
end
Controls.WROptionsLosingNotifCheckBox:RegisterCheckHandler(OnLosingNotifOptionChanged)

function OnLoggingOptionChanged(bIsChecked)
	MapModData.WonderRace.Options.Logging = bIsChecked
end
-- Controls.WROptionsLoggingCheckBox:RegisterCheckHandler(OnLoggingOptionChanged)

function OnDebugOptionChanged(bIsChecked)
	MapModData.WonderRace.Options.Debug = bIsChecked
end
-- Controls.WROptionsDebugCheckBox:RegisterCheckHandler(OnDebugOptionChanged)

-- Player clicked WR Options in DiploCorner menu
function OnDiploCornerPopup()
	print("OnDiploCornerPopup() called")
	Controls.WROptionsPanel:SetHide(false)
end

function OnCloseDialogPanel()
	Controls.WRDialogPanel:SetHide(true)
end
Controls.WRDialogCloseButton:RegisterCallback(Mouse.eLClick, OnCloseDialogPanel)


function OnCloseOptionsPanel()
	PrintOptionsToLog()
	local db = Modding.OpenUserData('WonderRace', WRVersion) -- Access persistent data storage
	db.SetValue('WRNotifyTurnDiff', MapModData.WonderRace.Options.TurnDiff)
	db.SetValue('WRNotifyCompetitorID', MapModData.WonderRace.Options.CompID)
	db.SetValue('WRNotifyOnDetectWonder', MapModData.WonderRace.Options.DetectWonder)
	db.SetValue('WRRepeatLosingNotification', MapModData.WonderRace.Options.LosingNotif)
	db.SetValue('WREnableLogging', MapModData.WonderRace.Options.Logging)
	db.SetValue('WRDebug', MapModData.WonderRace.Options.Debug)
	Controls.WROptionsPanel:SetHide(true)
end
Controls.WROptionsCloseButton:RegisterCallback(Mouse.eLClick, OnCloseOptionsPanel)

-- Register WROptions in DiploCorner dropdown list
function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
	table.insert(additionalEntries, {
		text=Locale.ConvertTextKey("TXT_KEY_WR_CAPTION_OPTIONS"), 
		call=OnDiploCornerPopup
	})
end
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()

Init()