-- JFD_CulDiv_UnitDialogue_Functions
-- Author: JFD
-- DateCreated: 9/29/2014 11:56:18 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
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
local g_DialogueActionChance = 20
local g_DialogueMoveChance = 10
local g_DialogueSelectChance = 20

local g_PlayerUnitDialogues = {}
-------------------------------------------------------------------------------------------------------------------------
-- INIT
-------------------------------------------------------------------------------------------------------------------------
--JFD_CulDiv_UnitDialogue_SequenceGameInitComplete
local function JFD_CulDiv_UnitDialogue_SequenceGameInitComplete()
	local playerID = Game.GetActivePlayer()
	local player = Players[playerID]
	local currentUnitDialogue = g_PlayerUnitDialogues[playerID]
	local newUnitDialogue = Player_GetUnitDialogueTag(player)
	if currentUnitDialogue ~= newUnitDialogue then
		g_PlayerUnitDialogues[playerID] = newUnitDialogue
	end
end
Events.SequenceGameInitComplete.Add(JFD_CulDiv_UnitDialogue_SequenceGameInitComplete);
-------------------------------------------------------------------------------------------------------------------------
--JFD_CulDiv_UnitDialogue_ActivePlayerTurnEnd
local function JFD_CulDiv_UnitDialogue_ActivePlayerTurnEnd()
	local playerID = Game.GetActivePlayer()
	local player = Players[playerID]
	local currentUnitDialogue = g_PlayerUnitDialogues[playerID]
	local newUnitDialogue = Player_GetUnitDialogueTag(player)
	if currentUnitDialogue ~= newUnitDialogue then
		g_PlayerUnitDialogues[playerID] = newUnitDialogue
	end
end
Events.ActivePlayerTurnEnd.Add(JFD_CulDiv_UnitDialogue_ActivePlayerTurnEnd);
-------------------------------------------------------------------------------------------------------------------------
-- UNITS
-------------------------------------------------------------------------------------------------------------------------
--JFD_CulDiv_UnitDialogue_UnitActionChanged
local function JFD_CulDiv_UnitDialogue_UnitActionChanged(playerID, unitID)
	if playerID ~= Game.GetActivePlayer() then return end
	if UI.GetHeadSelectedCity() then return end
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if (not unit) or unit:IsDead() then return end
	local unitTypeID = unit:GetUnitType()
	local unitMechanized = GameInfo.Units[unitTypeID].Mechanized
	if unitMechanized then return end
	local numChance = g_GetRandom(1,100)
	if numChance <= g_DialogueActionChance then
		local randomSoundIndex = g_GetRandom(0,9)
		local soundFile = g_PlayerUnitDialogues[playerID]
		if (not soundFile) then return end
		soundFile = soundFile .. "_ORDER_00" .. randomSoundIndex
		Events.AudioPlay2DSound(soundFile)
	end
end
Events.UnitActionChanged.Add(JFD_CulDiv_UnitDialogue_UnitActionChanged)
-------------------------------------------------------------------------------------------------------------------------
--JFD_CulDiv_UnitDialogue_UnitSetXY
local function JFD_CulDiv_UnitDialogue_UnitSetXY(playerID, unitID)
	if playerID ~= Game.GetActivePlayer() then return end
	if UI.GetHeadSelectedCity() then return end
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if (not unit) or unit:IsDead() then return end
	local unitTypeID = unit:GetUnitType()
	local unitMoves = GameInfo.Units[unitTypeID].Moves
	if unitMoves < unit:GetMoves() then return end
	local unitMechanized = GameInfo.Units[unitTypeID].Mechanized
	if unitMechanized then return end
	local numChance = g_GetRandom(1,100)
	if numChance <= g_DialogueMoveChance then
		local randomSoundIndex = g_GetRandom(0,9)
		local soundFile = g_PlayerUnitDialogues[playerID]
		if (not soundFile) then return end
		soundFile = soundFile .. "_ORDER_00" .. randomSoundIndex
		Events.AudioPlay2DSound(soundFile)
	end
end
GameEvents.UnitSetXY.Add(JFD_CulDiv_UnitDialogue_UnitSetXY)
-------------------------------------------------------------------------------------------------------------------------
--JFD_CulDiv_UnitDialogue_UnitSelectionChanged
local function JFD_CulDiv_UnitDialogue_UnitSelectionChanged(playerID, unitID, i, j, k, isSelected)
	if (not isSelected) then return end
	if playerID ~= Game.GetActivePlayer() then return end
	if UI.GetHeadSelectedCity() then return end
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if (not unit) or unit:IsDead() then return end
	local unitTypeID = unit:GetUnitType()
	local unitMechanized = GameInfo.Units[unitTypeID].Mechanized
	if unitMechanized then return end
	local numChance = g_GetRandom(1,100)
	if numChance <= g_DialogueSelectChance then
		local randomSoundIndex = g_GetRandom(0,9)
		local soundFile = g_PlayerUnitDialogues[playerID]
		if (not soundFile) then return end
		soundFile = soundFile .. "_SELECT_00" .. randomSoundIndex
		Events.AudioPlay2DSound(soundFile)
	end
end
Events.UnitSelectionChanged.Add(JFD_CulDiv_UnitDialogue_UnitSelectionChanged)
--==========================================================================================================================
--==========================================================================================================================