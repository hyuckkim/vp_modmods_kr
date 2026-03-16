-- JFD_CulDiv_DawnOfManPopup
-- Author: JFD
-- DateCreated: 9/29/2014 11:56:18 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
include("CommonBehaviors")
include("IconSupport.lua")
include("InfoTooltipInclude.lua")
include("InstanceManager.lua")
include("JFD_CulDivUtils.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- MATH UTILITIES
----------------------------------------------------------------------------------------------------------------------------
local g_GetRandom = Game.GetRandom
----------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
----------------------------------------------------------------------------------------------------------------------------
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
----------------------------------------------------------------------------------------------------------------------------
local g_IsVMCActive = Game_IsVMCActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxPlayers = GameDefines["MAX_PLAYERS"]
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- INIT
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--JFD_CulDiv_Core_LoadScreenClose
function JFD_CulDiv_Core_LoadScreenClose()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	if activePlayer:GetCapitalCity() then 
		return 
	end
	ContextPtr:SetHide(false)
end
Events.LoadScreenClose.Add(JFD_CulDiv_Core_LoadScreenClose)
------------------------------------------------------------------------------------------------------------------------
--UI_InitDawnOfManPopup()
function UI_InitDawnOfManPopup()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local activeCultureID, activeSubCultureID = activePlayer:GetCultureType()
	local activeCulture = GameInfo.JFD_CultureTypes[activeCultureID]

	local numGameYear = Game.GetGameTurnYear()
	local strEra = "A.D."
	if Game.GetGameTurnYear() < 0 then 
		numGameYear = (Game.GetGameTurnYear()*-1)
		strEra = "B.C."
	end
	local strDescription = g_ConvertTextKey(activeCulture.ShortDescription)
	local strDescriptionBonus = nil
	IconHookup(activeCulture.PortraitIndex, 64, activeCulture.IconAtlas, Controls.CivIcon)
	if activeSubCultureID then
		local activeSubCulture = GameInfo.JFD_CultureSubTypes[activeSubCultureID]
		strDescription = strDescription .. " - " .. g_ConvertTextKey(activeSubCulture.ShortDescription)
	end
	if Game_IsCulDivStartingBonusesActive() then
		for row in GameInfo.JFD_CultureType_StartingBonuses("CultureType = '" .. activeCulture.Type .. "'") do
			strDescriptionBonus = g_ConvertTextKey(row.Description)
			break
		end
	end
	Controls.CultureTitle:SetText(strDescription)
	Controls.Summary:LocalizeAndSetText("TXT_KEY_JFD_DAWN_OF_MAN_MESSAGE", numGameYear, strEra, activePlayer:GetCivilizationAdjective(), activePlayer:GetName())
	if strDescriptionBonus then
		Controls.Summary2:LocalizeAndSetText(strDescriptionBonus)
		Controls.Summary2:SetHide(false)
	end
	Controls.ButtonStack:CalculateSize()
	Controls.MainUI:DoAutoSize()
	Events.AudioPlay2DSound("AS2D_SOUND_JFD_DAWN_OF_MAN")
end
------------------------------------------------------------------------------------------------------------------------
--UI_CloseDawnOfManPopup
function UI_CloseDawnOfManPopup()
	ContextPtr:SetHide(true)
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, UI_CloseDawnOfManPopup)
------------------------------------------------------------------------------------------------------------------------
function InputHandler(uiMsg, wParam, lParam)
  if (uiMsg == KeyEvents.KeyDown) then
    if (wParam == Keys.VK_ESCAPE) then
      UI_CloseDawnOfManPopup()
      return true
    end
  end
end
ContextPtr:SetInputHandler(InputHandler)
------------------------------------------------------------------------------------------------------------------------
function ShowHideHandler(bIsHide, bInitState)
	if (not bInitState and not bIsHide) then
		UI_InitDawnOfManPopup()
	end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)
ContextPtr:SetHide(true)
--==========================================================================================================================
--==========================================================================================================================