-- JFD_CulDivUtils
-- Author: JFD
-- DateCreated: 9/22/2014 11:18:48 PM
--==========================================================================================================================
if (not GameInfo) then return end
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("IconSupport")
include("PlotIterators.lua")
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
--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
----------------------------------------------------------------------------------------------------------------------------	
--Game.GetRound
function Game.GetRound(num, idp)
	local mult = 10^(idp or 0)
	return g_MathFloor(num * mult + 0.5) / mult
end
------------------------------------------------------------------------------------------------------------------------
--NOTIFICATION UTILS
------------------------------------------------------------------------------------------------------------------------
--Player:SendWorldEvent
local notificationWorldEventID = NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"]
function Player.SendWorldEvent(player, description)
	print("Sending World Event: ", description)
	local activePlayer = Players[Game.GetActivePlayer()]
	local playerTeam = Teams[player:GetTeam()]
	if (not playerTeam:IsHasMet(Game.GetActiveTeam())) then return end
	activePlayer:AddNotification(notificationWorldEventID, description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end 
----------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------
--Game_IsCulDivStartingBonusesActive
function Game_IsCulDivStartingBonusesActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "0bd3563e-6c6e-40b9-abc2-ea535533fd8a" then
			return true
		end
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
--------------------------------------------------------------------------------------------------------------------------
-- GENERAL UTILITIES
--------------------------------------------------------------------------------------------------------------------------
--Player:GetUniqueBuilding
function Player.GetUniqueBuilding(player, buldingClass)
	if Player.GetSpecificBuildingType then
		return player:GetSpecificBuildingType(buldingClass)
	else
		local buldingType = nil
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		for uniqueBuilding in GameInfo.Civilization_BuildingClassOverrides{CivilizationType = civType, BuildingClassType = buldingClass} do
			buldingType = uniqueBuilding.BuildingType
			break
		end

		if (not buldingType) then
			buldingType = GameInfo.BuildingClasses[buldingClass].DefaultBuilding
		end

		return GameInfoTypes[buldingType]
	end
end
--------------------------------------------------------------------------------------------------------------------------
--Player:GetUniqueUnit
function Player.GetUniqueUnit(player, unitClass)
	if Player.GetSpecificUnitType then
		return player:GetSpecificUnitType(unitClass)
	else
		local unitType = nil
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
 
		for uniqueUnit in GameInfo.Civilization_UnitClassOverrides{CivilizationType = civType, UnitClassType = unitClass} do
			unitType = uniqueUnit.UnitType
			break
		end
 
		if (not unitType) then
			unitType = GameInfo.UnitClasses[unitClass].DefaultUnit
		end
 
		return GameInfoTypes[unitType]
	end
end
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local cultureColonialID		= GameInfoTypes["CULTURE_JFD_COLONIAL"]

local eraIndustrialID   	= GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID 		= GameInfoTypes["ERA_MEDIEVAL"]
local eraModernID   		= GameInfoTypes["ERA_MODERN"]
----------------------------------------------------------------------------------------------------------------------------
--g_CultureTypes_Table
local g_CultureTypes_Table = {}
local g_CultureTypes_Count = 1
for row in DB.Query("SELECT ID, LowerTag FROM JFD_CultureTypes;") do 	
	g_CultureTypes_Table[g_CultureTypes_Count] = row
	g_CultureTypes_Count = g_CultureTypes_Count + 1
end

--g_CultureType_OldTags_Table
local g_CultureType_OldTags_Table = {}
local g_CultureType_OldTags_Count = 1
for row in DB.Query("SELECT * FROM JFD_CultureType_OldTags;") do 	
	g_CultureType_OldTags_Table[g_CultureType_OldTags_Count] = row
	g_CultureType_OldTags_Count = g_CultureType_OldTags_Count + 1
end

--g_CultureSubType_OldTags_Table
local g_CultureSubType_OldTags_Table = {}
local g_CultureSubType_OldTags_Count = 1
for row in DB.Query("SELECT * FROM JFD_CultureSubType_OldTags;") do 	
	g_CultureSubType_OldTags_Table[g_CultureSubType_OldTags_Count] = row
	g_CultureSubType_OldTags_Count = g_CultureSubType_OldTags_Count + 1
end

--g_Civilization_CultureTypes_Table
local g_Civilization_CultureTypes_Table = {}
local g_Civilization_CultureTypes_Count = 1
-- C15 --
local g_Civilization_CultureTypes_Indexable = {}
-- /C15 --
for row in DB.Query("SELECT * FROM Civilization_JFD_CultureTypes;") do 	
	g_Civilization_CultureTypes_Table[g_Civilization_CultureTypes_Count] = row
	-- C15 --
	g_Civilization_CultureTypes_Indexable[row.CivilizationType] = g_Civilization_CultureTypes_Count
	-- /C15 --
	g_Civilization_CultureTypes_Count = g_Civilization_CultureTypes_Count + 1
end

--g_UnitPromotions_UnitDialogues_Table
local g_UnitPromotions_UnitDialogues_Table = {}
local g_UnitPromotions_UnitDialogues_Count = 1
for row in DB.Query("SELECT * FROM UnitPromotions_JFD_UnitDialogues;") do 	
	g_UnitPromotions_UnitDialogues_Table[g_UnitPromotions_UnitDialogues_Count] = row
	g_UnitPromotions_UnitDialogues_Count = g_UnitPromotions_UnitDialogues_Count + 1
end
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--g_ArtDefineTypes
local g_ArtDefineTypes = {}
g_ArtDefineTypes["ARTSTYLE_SOUTH_AMERICA"]	 = GameInfoTypes["CULTURE_JFD_GREAT_PLAINS"]
g_ArtDefineTypes["ARTSTYLE_ASIAN"]		  	 = GameInfoTypes["CULTURE_JFD_FAR_EASTERN"]
g_ArtDefineTypes["ARTSTYLE_EUROPEAN"]	  	 = GameInfoTypes["CULTURE_JFD_WESTERN"]
g_ArtDefineTypes["ARTSTYLE_GRECO_ROMAN"] 	 = GameInfoTypes["CULTURE_JFD_CLASSICAL"]
g_ArtDefineTypes["ARTSTYLE_MIDDLE_EAST"]	 = GameInfoTypes["CULTURE_JFD_MID_EASTERN"]
g_ArtDefineTypes["ARTSTYLE_POLYNESIAN"]  	 = GameInfoTypes["CULTURE_JFD_OCEANIC"]

--Player:GetCultureType
function Player.GetCultureType(player)
	local cultureID = nil 
	local subCultureID = nil
	if (not player:IsMinorCiv()) then
		local civID = player:GetCivilizationType()
		local civ = GameInfo.Civilizations[civID]
		local civType = civ.Type
		-- C15 --
		local tIndexed = g_Civilization_CultureTypes_Table[g_Civilization_CultureTypes_Indexable[civType]]
		--local cultureType = civ.CultureType
		local cultureType = nil
		if tIndexed then
			cultureType = tIndexed.CultureType
		else
			print("tIndexed is nil! civID = ", civID, " civType = ", civType, " Indexable = ", g_Civilization_CultureTypes_Indexable[civType])
		end
		-- /C15 --
		if cultureType then
			cultureID = GameInfoTypes[cultureType]
		end
		-- C15 --
		--local subCultureType = civ.CultureSubType
		local subCultureType = nil
		if tIndexed then
			subCultureType = tIndexed.SubCultureType
		end
		-- /C15 --
		if subCultureType then
			subCultureID = GameInfoTypes[subCultureType]

			if (not subCultureID) then
				--g_CultureSubType_OldTags_Table
				local numRows = #g_CultureSubType_OldTags_Table
				for index = 1, numRows do
					local row = g_CultureSubType_OldTags_Table[index]
					if row.OldTag == subCultureType then
						subCultureID = GameInfoTypes[row.CultureSubType]
						break
					end
				end
			end
		end
		
		if (not cultureID) then
			--g_CultureType_OldTags_Table
			local numRows = #g_CultureType_OldTags_Table
			for index = 1, numRows do
				local row = g_CultureType_OldTags_Table[index]
				if row.OldTag == cultureType then
					cultureID = GameInfoTypes[row.CultureType]
					break
				end
			end
		end

		if (not cultureID) then 
			cultureID = g_ArtDefineTypes[civ.ArtStyleType] 
		end
	else
		local minorCivID = player:GetMinorCivType()
		local minorCiv = GameInfo.MinorCivilizations[minorCivID]
		cultureID = minorCiv.CultureType
		local cultureType = minorCiv.CultureType
		if cultureType then
			cultureID = GameInfoTypes[cultureType]
		end		
		
		if (not cultureID) then
			--g_CultureType_OldTags_Table
			local numRows = #g_CultureType_OldTags_Table
			for index = 1, numRows do
				local row = g_CultureType_OldTags_Table[index]
				if row.OldTag == cultureType then
					cultureID = GameInfoTypes[row.CultureType]
					break
				end
			end
		end

		if (not cultureID) then 
			cultureID = g_ArtDefineTypes[minorCiv.ArtStyleType] 
		end
	end

	if (not cultureID) then
		print("Invalid cultureID for " .. player:GetCivilizationShortDescription())
	end	

	return (cultureID or cultureColonialID), subCultureID
end
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetCultureID(playerID)
	return Players[playerID]:GetCultureType()
end
----------------------------------------------------------------------------------------------------------------------------
--Player_GetCultureSplashScreenTag
function Player_GetCultureSplashScreenTag(player, eraType)
	local civID = player:GetCivilizationType()
	local civ = GameInfo.Civilizations[civID]
	local civType = civ.Type
	local cultureID, cultureSubID = player:GetCultureType()
	local culture = GameInfo.JFD_CultureTypes[cultureID]
	local splashScreenTag = nil
	if cultureSubID then
		local cultureSub = GameInfo.JFD_CultureSubTypes[cultureSubID]
		splashScreenTag = cultureSub.SplashScreenTag 
	else
		splashScreenTag = culture.SplashScreenTag 
	end
	
	--g_Civilization_CultureTypes_Table
	local numRows = #g_Civilization_CultureTypes_Table
	for index = 1, numRows do
		local row = g_Civilization_CultureTypes_Table[index]
		if row.CivilizationType == civType and row.SplashScreenTag then
			splashScreenTag = row.SplashScreenTag
			break
		end
	end
	
	if splashScreenTag then
		splashScreenTag = "Era_" .. splashScreenTag .. "_" .. eraType .. ".dds"
	end
	return (splashScreenTag or ("ERA" .. "_" .. eraType .. ".dds"))
end
----------------------------------------------------------------------------------------------------------------------------
--Player_GetCultureDefeatScreenTag
function Player_GetCultureDefeatScreenTag(player)
	local civID = player:GetCivilizationType()
	local civ = GameInfo.Civilizations[civID]
	local civType = civ.Type
	local cultureID, subCultureID = player:GetCultureType() 
	local cultureID, cultureSubID = player:GetCultureType()
	local culture = GameInfo.JFD_CultureTypes[cultureID]
	
	local currentEraID = player:GetCurrentEra()
	local defeatScreenTag = culture.DefeatScreenTag
	local defeatScreenEarlyTag = defeatScreenTag .. "Early.dds"
	local defeatScreenMidTag = defeatScreenTag .. "Mid.dds"
	local defeatScreenLateTag= defeatScreenTag .. "Late.dds"
	if cultureSubID then
		local cultureSub = GameInfo.JFD_CultureSubTypes[cultureSubID]
		local thisDefeatScreenEarlyTag = cultureSub.DefeatScreenEarlyTag
		if thisDefeatScreenEarlyTag then
			defeatScreenEarlyTag = thisDefeatScreenEarlyTag
		end
		local thisDefeatScreenMidTag = cultureSub.DefeatScreenMidTag
		if thisDefeatScreenMidTag then
			defeatScreenMidTag = thisDefeatScreenMidTag
		end
		local thisDefeatScreenLateTag = cultureSub.DefeatScreenLateTag
		if thisDefeatScreenLateTag then
			defeatScreenLateTag = thisDefeatScreenEarlyTag
		end
	end

	--g_Civilization_CultureTypes_Table
	local civsTable = g_Civilization_CultureTypes_Table
	local numCivs = #civsTable
	for index = 1, numCivs do
		local row = civsTable[index]
		if row.CivilizationType == civType then
			local thisDefeatScreenEarlyTag = row.DefeatScreenEarlyTag
			if thisDefeatScreenEarlyTag then
				defeatScreenEarlyTag = thisDefeatScreenEarlyTag
			end
			local thisDefeatScreenMidTag = row.DefeatScreenMidTag
			if thisDefeatScreenMidTag then
				defeatScreenMidTag = thisDefeatScreenMidTag
			end
			local thisDefeatScreenLateTag = row.DefeatScreenLateTag
			if thisDefeatScreenLateTag then
				defeatScreenLateTag = thisDefeatScreenEarlyTag
			end
			break
		end
	end

	if currentEraID >= eraModernID then
		return (defeatScreenLateTag or "Victory_Defeat.dds")
	elseif currentEraID >= eraMedievalID then
		return (defeatScreenMidTag or "Victory_Defeat.dds")
	else
		return (defeatScreenEarlyTag or "Victory_Defeat.dds")
	end
end
----------------------------------------------------------------------------------------------------------------------------
--Player_GetUnitDialogueTag
function Player_GetUnitDialogueTag(player, unit)
	local cultureID, cultureSubID = player:GetCultureType()
	local culture = GameInfo.JFD_CultureTypes[cultureID]
	local soundFile = nil
	if cultureSubID then
		local cultureSub = GameInfo.JFD_CultureSubTypes[cultureSubID]
		soundFile = cultureSub.UnitDialogueTag 
	else
		soundFile = culture.UnitDialogueTag 
	end
	
	local civID = player:GetCivilizationType()
	local civ = GameInfo.Civilizations[civID]
	local civType = civ.Type
	--g_Civilization_CultureTypes_Table
	local numRows = #g_Civilization_CultureTypes_Table
	for index = 1, numRows do
		local row = g_Civilization_CultureTypes_Table[index]
		if row.CivilizationType == civType then
			soundFile = row.UnitDialogueTag
			break
		end
	end
	
	if unit then
		--g_UnitPromotions_UnitDialogues_Table
		local numRows = #g_UnitPromotions_UnitDialogues_Table
		for index = 1, numRows do
			local row = g_UnitPromotions_UnitDialogues_Table[index]
			local ID = GameInfoTypes[row.PromotionType]
			if unit:IsHasPromotion(ID) then
				soundFile = row.UnitDialogueTag
				break
			end
		end
	end
	
	return soundFile
end
--=======================================================================================================================
--=======================================================================================================================