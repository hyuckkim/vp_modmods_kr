-- JFD_Sovereignty_Utils
-- Author: JFD
-- DateCreated: 4/30/2019 8:35:10 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua");
include("JFD_Sovereignty_IncludeUtils.lua");
include("PlotIterators.lua");
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "JFDSovereignty";
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------

JFD_RTP = {}

local g_ConvertTextKey  = Locale.ConvertTextKey
local g_GetRandom		= Game.GetRandom
local g_GetRound		= Game.GetRound
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

local gameSpeedID		= Game.GetGameSpeedType()
local gameSpeed			= GameInfo.GameSpeeds[gameSpeedID]
local gameSpeedMod		= (gameSpeed.BuildPercent/100) 

local handicapID		= Game.GetHandicapType()
local handicap			= GameInfo.HandicapInfos[handicapID]
--=======================================================================================================================
-- CACHED TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------

local cache = {
    Governments = {},
    GovernmentTitlesWithReforms = {},
    Factions = {},
    Reforms = {},
    ReformSubBranchFlavours = {},
    CouncillorsGreatPeople = {},
    CivilizationGovernments = {},
    BuildingSovereigntyMods = {},
    PolicySovereigntyMods = {},
    TraitSovereigntyMods = {}
}

local function cacheTable(tableName, query) 
    if cache[tableName] == nil then
        cache[tableName] = {}
    end

    local count = 1
    for row in DB.Query(query) do
       cache[tableName][count] = row
       count = count + 1
    end
end

cacheTable("Governments", "SELECT * FROM JFD_Governments WHERE IsHidden = 0;")
cacheTable("GovernmentTitlesWithReforms", "SELECT * FROM JFD_Government_Titles WHERE ReformType IS NOT NULL;")
--cacheTable("Government_LeaderTitles_ReformType", "SELECT * FROM JFD_Government_Titles WHERE ReformType IS NOT NULL AND TitleLeader IS NOT NULL;")
--cacheTable("Government_StateTitles", "SELECT * FROM JFD_Government_Titles WHERE ReformType IS NOT NULL AND TitleState IS NOT NULL;")
cacheTable("Factions", "SELECT * FROM JFD_Factions;")
--cacheTable("FactionsRevolutionaries", "SELECT * FROM JFD_Factions WHERE DominanceNumAnarchyTurns > 0;")
cacheTable("Reforms", "SELECT * FROM JFD_Reforms WHERE ShowInGovernment = 1;")
--cacheTable("ReformsLeftRight", "SELECT * FROM JFD_Reforms WHERE ShowInGovernment = 1 AND Alignment != 'REFORM_CENTRE';")
--cacheTable("ReformsLimited", "SELECT * FROM JFD_Reforms WHERE ShowInGovernment = 1 AND IsDefaultWithLimited = 1;")
--cacheTable("ReformsSemiLimited", "SELECT * FROM JFD_Reforms WHERE ShowInGovernment = 1 AND IsDefaultWithSemiLimited = 1;")
cacheTable("ReformSubBranchFlavours", "SELECT * FROM JFD_ReformSubBranch_Flavours;")
cacheTable("Councillors", "SELECT * FROM JFD_Councillors;")
cacheTable("CivilizationGovernments", "SELECT * FROM Civilization_JFD_Governments;")
cacheTable("BuildingSovereigntyMods", "SELECT * FROM Building_JFD_SovereigntyMods;")
cacheTable("PolicySovereigntyMods", "SELECT * FROM Policy_JFD_SovereigntyMods;")
cacheTable("TraitovereigntyMods", "SELECT * FROM Trait_JFD_SovereigntyMods;")

--g_JFD_Factions_Table
local g_JFD_Factions_Table = {}
local g_JFD_Factions_Count = 1
for row in DB.Query("SELECT * FROM JFD_Factions;") do 	
	g_JFD_Factions_Table[g_JFD_Factions_Count] = row
	g_JFD_Factions_Count = g_JFD_Factions_Count + 1
end

--g_JFD_FactionsRevolutionaries_Table
local g_JFD_FactionsRevolutionaries_Table = {}
local g_JFD_FactionsRevolutionaries_Count = 1
for row in DB.Query("SELECT * FROM JFD_Factions WHERE DominanceNumAnarchyTurns > 0;") do 	
	g_JFD_FactionsRevolutionaries_Table[g_JFD_FactionsRevolutionaries_Count] = row
	g_JFD_FactionsRevolutionaries_Count = g_JFD_FactionsRevolutionaries_Count + 1
end

--g_JFD_Reforms_Table
local g_JFD_Reforms_Table = {}
local g_JFD_Reforms_Count = 1
for row in DB.Query("SELECT * FROM JFD_Reforms WHERE ShowInGovernment = 1;") do 	
	g_JFD_Reforms_Table[g_JFD_Reforms_Count] = row
	g_JFD_Reforms_Count = g_JFD_Reforms_Count + 1
end

--g_JFD_ReformsLeftRight_Table
local g_JFD_ReformsLeftRight_Table = {}
local g_JFD_ReformsLeftRight_Count = 1
for row in DB.Query("SELECT * FROM JFD_Reforms WHERE ShowInGovernment = 1 AND Alignment != 'REFORM_CENTRE';") do 	
	g_JFD_ReformsLeftRight_Table[g_JFD_ReformsLeftRight_Count] = row
	g_JFD_ReformsLeftRight_Count = g_JFD_ReformsLeftRight_Count + 1
end

--g_JFD_ReformsLimited_Table
local g_JFD_ReformsLimited_Table = {}
local g_JFD_ReformsLimited_Count = 1
for row in DB.Query("SELECT * FROM JFD_Reforms WHERE ShowInGovernment = 1 AND IsDefaultWithLimited = 1;") do 	
	g_JFD_ReformsLimited_Table[g_JFD_ReformsLimited_Count] = row
	g_JFD_ReformsLimited_Count = g_JFD_ReformsLimited_Count + 1
end

--g_JFD_ReformsSemiLimited_Table
local g_JFD_ReformsSemiLimited_Table = {}
local g_JFD_ReformsSemiLimited_Count = 1
for row in DB.Query("SELECT * FROM JFD_Reforms WHERE ShowInGovernment = 1 AND IsDefaultWithSemiLimited = 1;") do 	
	g_JFD_ReformsSemiLimited_Table[g_JFD_ReformsSemiLimited_Count] = row
	g_JFD_ReformsSemiLimited_Count = g_JFD_ReformsSemiLimited_Count + 1
end

--g_JFD_ReformSubBranch_Flavours_Table
local g_JFD_ReformSubBranch_Flavours_Table = {}
local g_JFD_ReformSubBranch_Flavours_Count = 1
for row in DB.Query("SELECT * FROM JFD_ReformSubBranch_Flavours;") do 	
	g_JFD_ReformSubBranch_Flavours_Table[g_JFD_ReformSubBranch_Flavours_Count] = row
	g_JFD_ReformSubBranch_Flavours_Count = g_JFD_ReformSubBranch_Flavours_Count + 1
end

--g_JFD_Councillors_GreatPeople_Table
local g_JFD_Councillors_Table = {}
local g_JFD_Councillors_Count = 1
for row in DB.Query("SELECT * FROM JFD_Councillors;") do 	
	g_JFD_Councillors_Table[g_JFD_Councillors_Count] = row
	g_JFD_Councillors_Count = g_JFD_Councillors_Count + 1
end

--g_Civilization_JFD_Governments_Table
local g_Civilization_JFD_Governments_Table = {}
local g_Civilization_JFD_Governments_Count = 1
for row in DB.Query("SELECT * FROM Civilization_JFD_Governments;") do 	
	g_Civilization_JFD_Governments_Table[g_Civilization_JFD_Governments_Count] = row
	g_Civilization_JFD_Governments_Count = g_Civilization_JFD_Governments_Count + 1
end

--g_Building_JFD_SovereigntyMods_Table
local g_Building_JFD_SovereigntyMods_Table = {}
local g_Building_JFD_SovereigntyMods_Count = 1
for row in DB.Query("SELECT * FROM Building_JFD_SovereigntyMods;") do 	
	g_Building_JFD_SovereigntyMods_Table[g_Building_JFD_SovereigntyMods_Count] = row
	g_Building_JFD_SovereigntyMods_Count = g_Building_JFD_SovereigntyMods_Count + 1
end

--g_Policy_JFD_SovereigntyMods_Table
local g_Policy_JFD_SovereigntyMods_Table = {}
local g_Policy_JFD_SovereigntyMods_Count = 1
for row in DB.Query("SELECT * FROM Policy_JFD_SovereigntyMods;") do 	
	g_Policy_JFD_SovereigntyMods_Table[g_Policy_JFD_SovereigntyMods_Count] = row
	g_Policy_JFD_SovereigntyMods_Count = g_Policy_JFD_SovereigntyMods_Count + 1
end

--g_Trait_JFD_SovereigntyMods_Table
local g_Trait_JFD_SovereigntyMods_Table = {}
local g_Trait_JFD_SovereigntyMods_Count = 1
for row in DB.Query("SELECT * FROM Trait_JFD_SovereigntyMods;") do 	
	g_Trait_JFD_SovereigntyMods_Table[g_Trait_JFD_SovereigntyMods_Count] = row
	g_Trait_JFD_SovereigntyMods_Count = g_Trait_JFD_SovereigntyMods_Count + 1
end

--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxCivPlayers = GameDefines["MAX_CIV_PLAYERS"]
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]

local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]

local yieldSovereigntyID = GameInfoTypes["YIELD_JFD_SOVEREIGNTY"]

local governmentAnarchyID = GameInfoTypes["GOVERNMENT_JFD_ANARCHY"]
local governmentPolisID = GameInfoTypes["GOVERNMENT_JFD_POLIS"]
local governmentTribeID = GameInfoTypes["GOVERNMENT_JFD_TRIBE"]
local governmentChiefdomID = GameInfoTypes["GOVERNMENT_JFD_CHIEFDOM"]
local governmentMonarchyID = GameInfoTypes["GOVERNMENT_JFD_MONARCHY"]
local governmentPrincipalityID = GameInfoTypes["GOVERNMENT_JFD_PRINCIPALITY"]
local governmentRepublicID = GameInfoTypes["GOVERNMENT_JFD_REPUBLIC"]
local governmentTheocracyID = GameInfoTypes["GOVERNMENT_JFD_THEOCRACY"]
local governmentDictatorshipID = GameInfoTypes["GOVERNMENT_JFD_DICTATORSHIP"]
local governmentCaliphateID = GameInfoTypes["GOVERNMENT_JFD_CALIPHATE"]
local governmentHREID = GameInfoTypes["GOVERNMENT_JFD_HOLY_ROMAN_EMPIRE"]
local governmentMandateID = GameInfoTypes["GOVERNMENT_JFD_MANDATE_OF_HEAVEN"]
local governmentPapacyID = GameInfoTypes["GOVERNMENT_JFD_PAPACY"]
local governmentShogunateID = GameInfoTypes["GOVERNMENT_JFD_SHOGUNATE"]

local factionRevolutionariesID = GameInfoTypes["FACTION_JFD_REVOLUTIONARIES"]
local factionRevolutionariesDesc = g_ConvertTextKey(GameInfo.JFD_Factions[factionRevolutionariesID].Description)

local reformLegitimacyWisdomID = GameInfoTypes["REFORM_JFD_LEGITIMACY_WISDOM"]
local reformLegitimacyWealthID = GameInfoTypes["REFORM_JFD_LEGITIMACY_WEALTH"]
local reformLegitimacyDivineRightID = GameInfoTypes["REFORM_JFD_LEGITIMACY_DIVINE_RIGHT"]
local reformLegitimacyLawID = GameInfoTypes["REFORM_JFD_LEGITIMACY_LAW"]
local reformLegitimacySecurityID = GameInfoTypes["REFORM_JFD_LEGITIMACY_SECURITY"]
local reformLegitimacyCharismaID = GameInfoTypes["REFORM_JFD_LEGITIMACY_CHARISMA"]
local reformAdministrationCommonwealthID = GameInfoTypes["REFORM_JFD_ADMINISTRATION_COMMONWEALTH"]
local reformAdministrationPoliceStateID = GameInfoTypes["REFORM_JFD_ADMINISTRATION_POLICE_STATE"]
local reformConstitutionCodifiedID = GameInfoTypes["REFORM_JFD_CONSTITUTION_CODIFIED"]
local reformConstitutionUncodifiedID = GameInfoTypes["REFORM_JFD_CONSTITUTION_UNCODIFIED"]
local reformExecutiveAbsoluteID = GameInfoTypes["REFORM_JFD_EXECUTIVE_ABSOLUTE"]
local reformExecutiveConstitutionalID = GameInfoTypes["REFORM_JFD_EXECUTIVE_CONSTITUTIONAL"]
local reformFactionsInterestsID = GameInfoTypes["REFORM_JFD_FACTIONS_INTERESTS"]
local reformFactionsMultiPartyID = GameInfoTypes["REFORM_JFD_FACTIONS_MULTI_PARTY"]
local reformFactionsTwoPartyID = GameInfoTypes["REFORM_JFD_FACTIONS_TWO_PARTY"]
local reformLegislatureCongressionalID = GameInfoTypes["REFORM_JFD_LEGISLATURE_CONGRESSIONAL"]
local reformLegislatureParliamentaryID = GameInfoTypes["REFORM_JFD_LEGISLATURE_PARLIAMENTARY"]
local reformRelationsManorialID = GameInfoTypes["REFORM_JFD_RELATIONS_MANORIAL"]
local reformRelationsPersonalID = GameInfoTypes["REFORM_JFD_RELATIONS_PERSONAL"]
local reformRelationsMunicipalID = GameInfoTypes["REFORM_JFD_RELATIONS_MUNICIPAL"]
local reformTerritoryEmpireID = GameInfoTypes["REFORM_JFD_TERRITORY_EMPIRE"]
local reformStructureFederationID = GameInfoTypes["REFORM_JFD_STRUCTURE_FEDERATION"]
local reformStructureUnitaryID = GameInfoTypes["REFORM_JFD_STRUCTURE_UNITARY"]

local defineDefaultAILegislatureChoicePopThreshold = GameDefines["JFD_SOVEREIGNTY_DEFAULT_AI_LEGISLATURE_CHOICE_POPULATION_THRESHOLD"]
local defineDefaultFullGovernmentPopThreshold = GameDefines["JFD_SOVEREIGNTY_DEFAULT_FULL_GOVERNMENT_POPULATION_THRESHOLD"]
local defineDefaultLimitedGovernmentPopThreshold = GameDefines["JFD_SOVEREIGNTY_DEFAULT_LIMITED_GOVERNMENT_POPULATION_THRESHOLD"]
local defineDefaultGovernmentCooldownModCap = GameDefines["JFD_SOVEREIGNTY_DEFAULT_GOVERNMENT_COOLDOWN_MOD_CAP"]
local defineDefaultGovernmentCooldownTurns = (GameDefines["JFD_SOVEREIGNTY_DEFAULT_GOVERNMENT_COOLDOWN"]*gameSpeedMod)
local defineDefaultGovernmentCooldownTurnsModPerCity = GameDefines["JFD_SOVEREIGNTY_DEFAULT_GOVERNMENT_COOLDOWN_MOD_PER_CITY"]
local defineDefaultGovernmentCooldownTurnsModPerCitizen = GameDefines["JFD_SOVEREIGNTY_DEFAULT_GOVERNMENT_COOLDOWN_MOD_PER_CITIZEN"]
local defineDefaultGovernmentCooldownRate = GameDefines["JFD_SOVEREIGNTY_DEFAULT_GOVERNMENT_COOLDOWN_RATE"]
local defineDefaultReformAnarchyTurns = GameDefines["JFD_SOVEREIGNTY_DEFAULT_REFORM_ANARCHY_TURNS"]
local defineDefaultReformAnarchyCooldownTurns = GameDefines["JFD_SOVEREIGNTY_DEFAULT_REFORM_ANARCHY_COOLDOWN_TURNS"]
local defineDefaultReformCooldownModCap = GameDefines["JFD_SOVEREIGNTY_DEFAULT_REFORM_COOLDOWN_MOD_CAP"]
local defineDefaultReformCooldownTurns = (GameDefines["JFD_SOVEREIGNTY_DEFAULT_REFORM_COOLDOWN"]*gameSpeedMod)
local defineDefaultReformCooldownTurnsModPerCity = GameDefines["JFD_SOVEREIGNTY_DEFAULT_REFORM_COOLDOWN_MOD_PER_CITY"]
local defineDefaultReformCooldownTurnsModPerCitizen = GameDefines["JFD_SOVEREIGNTY_DEFAULT_REFORM_COOLDOWN_MOD_PER_CITIZEN"]
local defineDefaultReformCooldownRate = GameDefines["JFD_SOVEREIGNTY_DEFAULT_REFORM_COOLDOWN_RATE"]
local defineDefaultReformRevSentiment = GameDefines["JFD_SOVEREIGNTY_DEFAULT_REFORM_REVOLUTIONARY_SENTIMENT"]
--==========================================================================================================================
-- SOVEREIGNTY UTILS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- SOVEREIGNTY UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player:GetMaxSovereignty
function Player.GetMaxSovereignty(player)
	local numSovMax = 0	
	local numSovMaxMod = Player_GetMaxSovereigntyModifier(player)
	if numSovMaxMod ~= 0 then
		numSovMax = numSovMax + numSovMaxMod
	end
	
	return numSovMax
end

--Player:CalculateSovereignty
function Player.CalculateSovereignty(player, updateCurrentSovereignty, returnsTT)	
	local playerID = player:GetID()
	local numSov = 0
	local numSovMax = player:GetMaxSovereignty()
	local strSovereigntyTT = ""

	local sovFromCitiesTable = Player_GetSovereigntyFromCities(player)

	--PLAYER YIELDS
	local numSovFromYieldRateMods = player:GetYieldRateModifier(yieldSovereigntyID)
	numSov = numSov + numSovFromYieldRateMods
	
	if (numSovFromYieldRateMods ~= 0 and returnsTT) then
		if numSovFromYieldRateMods > 0 then numSovFromYieldRateMods = "+" .. numSovFromYieldRateMods end
		strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_POLICIES_AND_REFORMS", numSovFromYieldRateMods)
	end

	--CITY YIELDS
	local numSovFromCities = sovFromCitiesTable.NumSovFromCities
	numSov = numSov + numSovFromCities
	
	if (numSovFromCities ~= 0 and returnsTT) then
		if numSovFromCities > 0 then numSovFromCities = "+" .. numSovFromCities	end
		strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_CITIES", numSovFromCities)
	end

	--NUM CITIES OR LESS
	if sovFromCitiesTable.HasReformSovWhenNumCitiesOrLess then
		local numSovWhenNumCitiesOrLess = sovFromCitiesTable.NumReformSovWhenNumCitiesOrLess
		local strHL = ""
		
		if sovFromCitiesTable.HasReformSovWhenNumCitiesOrLessMet then
			numSov = numSov + numSovWhenNumCitiesOrLess
			
			if returnsTT then
				if numSovWhenNumCitiesOrLess < 0 then
					strHL = "[COLOR_NEGATIVE_TEXT]"
				elseif numSovWhenNumCitiesOrLess > 0 then
					strHL = "[COLOR_POSITIVE_TEXT]+"
				end
			end
		end
		if returnsTT and sovFromCitiesTable.HasReformSovWhenNumCitiesOrLessMet then
			strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_WHEN_NUM_CITIES_OR_LESS", strHL, numSovWhenNumCitiesOrLess, sovFromCitiesTable.NumReformSovWhenNumCitiesOrLessReq)
		end
	end
	
	--NUM CITIES OR MORE
	if sovFromCitiesTable.HasReformSovWhenNumCitiesOrMore then
		local numSovWhenNumCitiesOrMore = sovFromCitiesTable.NumReformSovWhenNumCitiesOrMore
		local strHL = ""
		
		if sovFromCitiesTable.HasReformSovWhenNumCitiesOrMoreMet then
			numSov = numSov + numSovWhenNumCitiesOrMore
			
			if returnsTT then
				if numSovWhenNumCitiesOrMore < 0 then
					strHL = "[COLOR_NEGATIVE_TEXT]"
				elseif numSovWhenNumCitiesOrMore > 0 then
					strHL = "[COLOR_POSITIVE_TEXT]+"
				end
			end
		end
		if returnsTT and sovFromCitiesTable.HasReformSovWhenNumCitiesOrMoreMet then
			strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_WHEN_NUM_CITIES_OR_MORE", strHL, numSovWhenNumCitiesOrMore, sovFromCitiesTable.NumReformSovWhenNumCitiesOrMoreReq)
		end
	end
	
	--LEGITIMACIES
	local numSovFromLegitimaciesMod = Player_GetLegitimacySovModifier(player)
	
	local numSovWhenTradition = 0
	local numReformSovWhenTradition = sovFromCitiesTable.NumReformSovWhenTradition
	local hasReformSovWhenTradition = sovFromCitiesTable.HasReformSovWhenTradition

    local numLegitimaciesMet = 0
	
	--LEGITIMACIES: CONNECTIONS
	if sovFromCitiesTable.HasReformSovWhenConnection then
		local numSovWhenConnection = sovFromCitiesTable.NumReformSovWhenConnection
		local strHL = ""
		
		if numSovFromLegitimaciesMod ~= 0 then 
			numSovWhenConnection = numSovWhenConnection + g_GetRound((numSovWhenConnection*numSovFromLegitimaciesMod)/100) 
		end
		
		if sovFromCitiesTable.HasReformSovWhenConnectionMet then		
			numSov = numSov + numSovWhenConnection
            numLegitimaciesMet = numLegitimaciesMet + 1
			if returnsTT then
				if numSovWhenConnection < 0 then
					strHL = "[COLOR_NEGATIVE_TEXT]"
				elseif numSovWhenConnection > 0 then
					strHL = "[COLOR_POSITIVE_TEXT]"
				end
			end
		end
		if returnsTT then
			strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_WHEN_CONNECTION", strHL, numSovWhenConnection)
		end
	end
	
	--LEGITIMACIES: GARRISONS
	if sovFromCitiesTable.HasReformSovWhenGarrison then
		local numSovWhenGarrison = sovFromCitiesTable.NumReformSovWhenGarrison
		local strHL = ""
		
		if numSovFromLegitimaciesMod ~= 0 then 
			numSovWhenGarrison = numSovWhenGarrison + g_GetRound((numSovWhenGarrison*numSovFromLegitimaciesMod)/100) 
		end
		
		if sovFromCitiesTable.HasReformSovWhenGarrisonMet then
			numSov = numSov + numSovWhenGarrison
            numLegitimaciesMet = numLegitimaciesMet + 1
			if returnsTT then
				if numSovWhenGarrison < 0 then
					strHL = "[COLOR_NEGATIVE_TEXT]"
				elseif numSovWhenGarrison > 0 then
					strHL = "[COLOR_POSITIVE_TEXT]"
				end
			end
		end
		if returnsTT then
			strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_WHEN_GARRISON", strHL, numSovWhenGarrison)
		end
	end
	
	--LEGITIMACIES: SPECIALISTS
	if sovFromCitiesTable.HasReformSovWhenSpecialist then
		local numSovWhenSpecialist = sovFromCitiesTable.NumReformSovWhenSpecialist
		local strHL = ""
		
		if numSovFromLegitimaciesMod ~= 0 then 
			numSovWhenSpecialist = numSovWhenSpecialist + g_GetRound((numSovWhenSpecialist*numSovFromLegitimaciesMod)/100) 
		end
		
		if sovFromCitiesTable.HasReformSovWhenSpecialistMet then
			numSov = numSov + numSovWhenSpecialist
            numLegitimaciesMet = numLegitimaciesMet + 1
			if returnsTT then
				if numSovWhenSpecialist < 0 then
					strHL = "[COLOR_NEGATIVE_TEXT]"
				elseif numSovWhenSpecialist > 0 then
					strHL = "[COLOR_POSITIVE_TEXT]"
				end
			end
		end
		if returnsTT then
			strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_WHEN_SPECIALIST", strHL, numSovWhenSpecialist)
		end
	end
	
	--LEGITIMACIES: POPULATION
	if sovFromCitiesTable.HasReformSovWhenPopulation then
		local numSovWhenPopulation = sovFromCitiesTable.NumReformSovWhenPopulation
		local strHL = ""
		
		if numSovFromLegitimaciesMod ~= 0 then 
			numSovWhenPopulation = numSovWhenPopulation + g_GetRound((numSovWhenPopulation*numSovFromLegitimaciesMod)/100) 
		end
		
		if sovFromCitiesTable.HasReformSovWhenPopulationMet then		
			numSov = numSov + numSovWhenPopulation
            numLegitimaciesMet = numLegitimaciesMet + 1			
			if returnsTT then
				if numSovWhenPopulation < 0 then
					strHL = "[COLOR_NEGATIVE_TEXT]"
				elseif numSovWhenPopulation > 0 then
					strHL = "[COLOR_POSITIVE_TEXT]"
				end
			end
		end
		if returnsTT then
			strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_WHEN_POPULATION", strHL, numSovWhenPopulation, sovFromCitiesTable.NumReformSovWhenPopulationReq)
		end
	end
	
	--LEGITIMACIES: RELIGION
	if sovFromCitiesTable.HasReformSovWhenStateReligion then
		local numSovWhenStateReligion = sovFromCitiesTable.NumReformSovWhenStateReligion
		local strHL = ""
		
		if numSovFromLegitimaciesMod ~= 0 then 
			numSovWhenStateReligion = numSovWhenStateReligion + g_GetRound((numSovWhenStateReligion*numSovFromLegitimaciesMod)/100) 
		end
		
		if sovFromCitiesTable.HasReformSovWhenStateReligionMet then		
			numSov = numSov + numSovWhenStateReligion
			numLegitimaciesMet = numLegitimaciesMet + 1
			if returnsTT then
				if numSovWhenStateReligion < 0 then
					strHL = "[COLOR_NEGATIVE_TEXT]"
				elseif numSovWhenStateReligion > 0 then
					strHL = "[COLOR_POSITIVE_TEXT]"
				end
			end
		end
		if returnsTT then
			strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_WHEN_RELIGION", strHL, numSovWhenStateReligion)
		end
	end
	
	--LEGITIMACIES: BUILDING CLASS
	if sovFromCitiesTable.HasReformSovWhenBuildingClass then
		local numSovWhenBuildingClass = sovFromCitiesTable.NumReformSovWhenBuildingClass
		local strHL = ""
		
		if numSovFromLegitimaciesMod ~= 0 then 
			numSovWhenBuildingClass = numSovWhenBuildingClass + g_GetRound((numSovWhenBuildingClass*numSovFromLegitimaciesMod)/100) 
		end
		
		if sovFromCitiesTable.HasReformSovWhenBuildingClassMet then		
			numSov = numSov + numSovWhenBuildingClass
            numLegitimaciesMet = numLegitimaciesMet + 1			
			if returnsTT then
				if numSovWhenBuildingClass < 0 then
					strHL = "[COLOR_NEGATIVE_TEXT]"
				elseif numSovWhenBuildingClass > 0 then
					strHL = "[COLOR_POSITIVE_TEXT]"
				end
			end
		end
		if returnsTT then
			local buildingClass = GameInfo.BuildingClasses[sovFromCitiesTable.NumReformSovWhenBuildingClassType]
			strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_WHEN_BUILDING_CLASS", strHL, numSovWhenBuildingClass, buildingClass.Description)
		end
	end
	
	--LEGITIMACIES: HAPPINESS
	if sovFromCitiesTable.HasReformSovWhenHappiness then
		local numSovWhenHappiness = sovFromCitiesTable.NumReformSovWhenHappiness
		local strHL = ""
		
		if numSovFromLegitimaciesMod ~= 0 then 
			numSovWhenHappiness = numSovWhenHappiness + g_GetRound((numSovWhenHappiness*numSovFromLegitimaciesMod)/100) 
		end
		
		if sovFromCitiesTable.HasReformSovWhenHappinessMet then		
			numSov = numSov + numSovWhenHappiness
            numLegitimaciesMet = numLegitimaciesMet + 1
			if returnsTT then
				if numSovWhenHappiness < 0 then
					strHL = "[COLOR_NEGATIVE_TEXT]"
				elseif numSovWhenHappiness > 0 then
					strHL = "[COLOR_POSITIVE_TEXT]"
				end
			end
		end
		if returnsTT then
			strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_WHEN_HAPPINESS", strHL, numSovWhenHappiness, sovFromCitiesTable.NumReformSovWhenHappinessReq)
		end
	end
	
	--LEGITIMACIES: DEFENSE
	if sovFromCitiesTable.HasReformSovWhenDefense then
		local numSovWhenDefense = sovFromCitiesTable.NumReformSovWhenDefense
		local strHL = ""
		
		if numSovFromLegitimaciesMod ~= 0 then 
			numSovWhenDefense = numSovWhenDefense + g_GetRound((numSovWhenDefense*numSovFromLegitimaciesMod)/100) 
		end
		
		if sovFromCitiesTable.HasReformSovWhenDefenseMet then		
			numSov = numSov + numSovWhenDefense
            numLegitimaciesMet = numLegitimaciesMet + 1			
			if returnsTT then
				if numSovWhenDefense < 0 then
					strHL = "[COLOR_NEGATIVE_TEXT]"
				elseif numSovWhenDefense > 0 then
					strHL = "[COLOR_POSITIVE_TEXT]"
				end
			end
		end
		if returnsTT then
			strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_WHEN_DEFENSE", strHL, numSovWhenDefense, sovFromCitiesTable.NumReformSovWhenDefenseReq)
		end
	end
	
	--LEGITIMACIES: HERITAGE
	if hasReformSovWhenTradition then
		local strHL1 = ""
		local strHL2 = ""
		local strBonus1 = 5
		local strBonus2 = 10
				
		if numSovFromLegitimaciesMod ~= 0 then 
			numSovWhenTradition = numSovWhenTradition + g_GetRound((numSovWhenTradition*numSovFromLegitimaciesMod)/100) 
			strBonus1 = strBonus1 + g_GetRound((strBonus1*numSovFromLegitimaciesMod)/100) 
			strBonus2 = strBonus2 + g_GetRound((strBonus2*numSovFromLegitimaciesMod)/100) 
		end

        if (numLegitimaciesMet == 1) then
            numSov = numSov + numReformSovWhenTradition
            if returnsTT then
    			strHL1 = "[COLOR_POSITIVE_TEXT]"
            end
        elseif (numLegitimaciesMet > 1) then
            numSov = numSov + numReformSovWhenTradition*2
            numLegitimaciesMet = numLegitimaciesMet + 1
            if returnsTT then
                strHL2 = "[COLOR_POSITIVE_TEXT]"
            end
        end
		
		if returnsTT then
			strSovereigntyTT = strSovereigntyTT .. "[NEWLINE]  [ICON_BULLET]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_WHEN_HERITAGE", strHL1, strBonus1, strHL2, strBonus2)
		end
	end

    --LEGITIMACIES: TOTAL
    if numLegitimaciesMet >= 3 then 
        numSov = numSov + 15
        if returnsTT then
            strSovereigntyTT = strSovereigntyTT .. "[NEWLINE] [ICON_BULLET][COLOR_POSITIVE_TEXT]+15%[ENDCOLOR] when all 3 [COLOR_POSITIVE_TEXT]Legitimacies[ENDCOLOR] fulfilled." 
        end
    else
        if returnsTT then
            strSovereigntyTT = strSovereigntyTT .. "[NEWLINE] [ICON_BULLET]+15% when all 3 [COLOR_POSITIVE_TEXT]Legitimacies[ENDCOLOR] fulfilled." 
        end
    end

	
	if numSov >= numSovMax then
		numSov = numSovMax
	end
	
	return numSov, strSovereigntyTT
end
-------------------------------------------------------------------------------------------------------------------------
--Player:GetCurrentSovereignty
function Player.GetCurrentSovereignty(player)	
	return player:GetSovereignty()
end
-------------------------------------------------------------------------------------------------------------------------
--Player:UpdateCurrentSovereignty
function Player.UpdateCurrentSovereignty(player, numSov)	
	local playerID = player:GetID()
	
	if (not numSov) then
		numSov = player:CalculateSovereignty()
	end	
	
    player:SetSovereignty(numSov)
	
	if player:IsHuman() and player:IsTurnActive() then
		LuaEvents.JFD_UpdateTopPanel()
	end
end
----------------------------------------------------------------------------------------------------------------------------
--g_Buildings_SovereigntyChange_Table
local g_Buildings_SovereigntyChange_Table = {}
local g_Buildings_SovereigntyChange_Count = 1
for row in DB.Query("SELECT ID, SovereigntyChange FROM Buildings WHERE SovereigntyChange <> 0;") do 	
	g_Buildings_SovereigntyChange_Table[g_Buildings_SovereigntyChange_Count] = row
	g_Buildings_SovereigntyChange_Count = g_Buildings_SovereigntyChange_Count + 1
end

local reformSovConnectionID = -1
local reformSovConnectionNum = 0
for row in DB.Query("SELECT ID, SovereigntyWhenConnected FROM JFD_Reforms WHERE SovereigntyWhenConnected <> 0;") do 	
	reformSovConnectionID  = row.ID
	reformSovConnectionNum = row.SovereigntyWhenConnected
	break
end
local reformSovGarrisonID = -1
local reformSovGarrisonNum = 0
for row in DB.Query("SELECT ID, SovereigntyWhenGarrisoned FROM JFD_Reforms WHERE SovereigntyWhenGarrisoned <> 0;") do 	
	reformSovGarrisonID = row.ID
	reformSovGarrisonNum = row.SovereigntyWhenGarrisoned
	break
end
local reformSovSpecialistsID = -1
local reformSovSpecialistsNum
for row in DB.Query("SELECT ID, SovereigntyWhenSpecialist FROM JFD_Reforms WHERE SovereigntyWhenSpecialist <> 0;") do 	
	reformSovSpecialistsID = row.ID
	reformSovSpecialistsNum = row.SovereigntyWhenSpecialist
	break
end
local reformSovPopulationID = -1
local reformSovPopulationNum = 0
local reformSovPopulationReq = 0
for row in DB.Query("SELECT ID, SovereigntyWhenPopulation, SovereigntyWhenPopulationReq FROM JFD_Reforms WHERE SovereigntyWhenPopulation <> 0;") do 	
	reformSovPopulationID = row.ID
	reformSovPopulationNum = row.SovereigntyWhenPopulation
	reformSovPopulationReq = row.SovereigntyWhenPopulationReq
	break
end
local reformSovBuildingClassID = -1
local reformSovBuildingClassNum = 0
local reformSovBuildingClassType = 0
for row in DB.Query("SELECT ID, SovereigntyWhenBuildingClass, SovereigntyWhenBuildingClassType FROM JFD_Reforms WHERE SovereigntyWhenBuildingClass <> 0;") do 	
	reformSovBuildingClassID = row.ID
	reformSovBuildingClassNum = row.SovereigntyWhenBuildingClass
	reformSovBuildingClassType = row.SovereigntyWhenBuildingClassType
	break
end
local reformSovStateReligionID = -1
local reformSovStateReligionNum = 0
for row in DB.Query("SELECT ID, SovereigntyWhenStateReligion FROM JFD_Reforms WHERE SovereigntyWhenStateReligion <> 0;") do 	
	reformSovStateReligionID = row.ID
	reformSovStateReligionNum = row.SovereigntyWhenStateReligion
	break
end
local reformSovTraditionID = -1
local reformSovTraditionNum = 0
for row in DB.Query("SELECT ID, SovereigntyWhenTradition FROM JFD_Reforms WHERE SovereigntyWhenTradition <> 0;") do 	
	reformSovTraditionID = row.ID
	reformSovTraditionNum = row.SovereigntyWhenTradition
	break
end
local reformSovHappinessID = -1
local reformSovHappinessNum = 0
local reformSovHappinessReq = 0
for row in DB.Query("SELECT ID, SovereigntyWhenHappiness, SovereigntyWhenHappinessReq FROM JFD_Reforms WHERE SovereigntyWhenHappiness <> 0;") do 	
	reformSovHappinessID = row.ID
	reformSovHappinessNum = row.SovereigntyWhenHappiness
	reformSovHappinessReq = row.SovereigntyWhenHappinessReq
	break
end
local reformSovDefenseID = -1
local reformSovDefenseNum = 0
local reformSovDefenseReq = 0
for row in DB.Query("SELECT ID, SovereigntyWhenDefense, SovereigntyWhenDefenseReq FROM JFD_Reforms WHERE SovereigntyWhenDefense <> 0;") do 	
	reformSovDefenseID = row.ID
	reformSovDefenseNum = row.SovereigntyWhenDefense
	reformSovDefenseReq = row.SovereigntyWhenDefenseReq
	break
end
local reformSovNumCitiesOrLessID = -1
local reformSovNumCitiesOrLessNum = 0
local reformSovNumCitiesOrLessReq = 0
for row in DB.Query("SELECT ID, SovereigntyWhenNumCitiesOrLess, SovereigntyWhenNumCitiesOrLessReq FROM JFD_Reforms WHERE SovereigntyWhenNumCitiesOrLess > 0;") do 	
	reformSovNumCitiesOrLessID = row.ID
	reformSovNumCitiesOrLessNum = row.SovereigntyWhenNumCitiesOrLess
	reformSovNumCitiesOrLessReq = row.SovereigntyWhenNumCitiesOrLessReq
	break
end
local reformSovNumCitiesOrMoreID = -1
local reformSovNumCitiesOrMoreNum = 0
local reformSovNumCitiesOrMoreReq = 0
for row in DB.Query("SELECT ID, SovereigntyWhenNumCitiesOrMore, SovereigntyWhenNumCitiesOrMoreReq FROM JFD_Reforms WHERE SovereigntyWhenNumCitiesOrMore > 0;") do 	
	reformSovNumCitiesOrMoreID = row.ID
	reformSovNumCitiesOrMoreNum = row.SovereigntyWhenNumCitiesOrMore
	reformSovNumCitiesOrMoreReq = row.SovereigntyWhenNumCitiesOrMoreReq
	break
end

--Player_GetSovereigntyFromCities
function Player_GetSovereigntyFromCities(player)
	local sovFromCitiesTable = {}

	--CITIES
	local numSovFromCities = 0
	sovFromCitiesTable.NumSovFromCities = 0
	
	--NUM CITIES OR LESS
	local hasReformSovNumCitiesOrLess = player:HasReform(reformSovNumCitiesOrLessID)
	if hasReformSovNumCitiesOrLess then
		sovFromCitiesTable.HasReformSovWhenNumCitiesOrLess = true
		sovFromCitiesTable.NumReformSovWhenNumCitiesOrLess = reformSovNumCitiesOrLessNum
		sovFromCitiesTable.NumReformSovWhenNumCitiesOrLessReq = reformSovNumCitiesOrLessReq
		
		local reform = GameInfo.JFD_Reforms[reformSovNumCitiesOrLessID]
		sovFromCitiesTable.HasReformSovWhenNumCitiesOrMore = true
		sovFromCitiesTable.NumReformSovWhenNumCitiesOrMore = reform.SovereigntyWhenNumCitiesOrMore
		sovFromCitiesTable.NumReformSovWhenNumCitiesOrMoreReq = reform.SovereigntyWhenNumCitiesOrMoreReq
	end
	
	--NUM CITIES OR MORE
	local hasReformSovNumCitiesOrMore = player:HasReform(reformSovNumCitiesOrMoreID)
	if hasReformSovNumCitiesOrMore then
		sovFromCitiesTable.HasReformSovWhenNumCitiesOrMore = true
		sovFromCitiesTable.NumReformSovWhenNumCitiesOrMore = reformSovNumCitiesOrMoreNum
		sovFromCitiesTable.NumReformSovWhenNumCitiesOrMoreReq = reformSovNumCitiesOrMoreReq
		
		local reform = GameInfo.JFD_Reforms[reformSovNumCitiesOrMoreID]
		sovFromCitiesTable.HasReformSovWhenNumCitiesOrLess = true
		sovFromCitiesTable.NumReformSovWhenNumCitiesOrLess = reform.SovereigntyWhenNumCitiesOrLess
		sovFromCitiesTable.NumReformSovWhenNumCitiesOrLessReq = reform.SovereigntyWhenNumCitiesOrLessReq
	end
	
	--CONNECTION
	local hasReformSovConnection = player:HasReform(reformSovConnectionID)
	if hasReformSovConnection then
		sovFromCitiesTable.HasReformSovWhenConnection = true
		sovFromCitiesTable.NumReformSovWhenConnection = reformSovConnectionNum
	end
	local numCitiesConnection = 0
	
	--GARRISON
	local hasReformSovGarrison = player:HasReform(reformSovGarrisonID)
	if hasReformSovGarrison then
		sovFromCitiesTable.HasReformSovWhenGarrison = true
		sovFromCitiesTable.NumReformSovWhenGarrison = reformSovGarrisonNum
	end
	local numCitiesGarrison = 0
	
	--SPECIALIST
	local hasReformSovSpecialist = player:HasReform(reformSovSpecialistsID)
	if hasReformSovSpecialist then
		sovFromCitiesTable.HasReformSovWhenSpecialist = true
		sovFromCitiesTable.NumReformSovWhenSpecialist = reformSovSpecialistsNum
	end
	local numCitiesSpecialist = 0
	
	--POPULATION
	local hasReformSovPopulation = player:HasReform(reformSovPopulationID)
	if hasReformSovPopulation then
		sovFromCitiesTable.HasReformSovWhenPopulation = true
		sovFromCitiesTable.NumReformSovWhenPopulation = reformSovPopulationNum
		sovFromCitiesTable.NumReformSovWhenPopulationReq = reformSovPopulationReq
	end
	local numCitiesPopulation = 0
	
	--RELIGION
	local religionID = nil
	local hasReformSovStateReligion = player:HasReform(reformSovStateReligionID)
	if hasReformSovStateReligion then	
		religionID = player:GetMainReligion()
		sovFromCitiesTable.HasReformSovWhenStateReligion = true
		sovFromCitiesTable.NumReformSovWhenStateReligion = reformSovStateReligionNum
		sovFromCitiesTable.NumReformSovWhenStateReligionID = religionID
	end
	local numCitiesStateReligion = 0
	
	--BUILDING CLASS
	local hasReformSovBuildingClass = player:HasReform(reformSovBuildingClassID)
	if hasReformSovBuildingClass then
		sovFromCitiesTable.HasReformSovWhenBuildingClass = true
		sovFromCitiesTable.NumReformSovWhenBuildingClass = reformSovBuildingClassNum
		sovFromCitiesTable.NumReformSovWhenBuildingClassType = reformSovBuildingClassType
	end
	local numCitiesBuildingClass = 0
	
	--HERITAGE
	local hasReformSovTradition = player:HasReform(reformSovTraditionID)
	if hasReformSovTradition then
		sovFromCitiesTable.HasReformSovWhenTradition = true
		sovFromCitiesTable.NumReformSovWhenTradition = reformSovTraditionNum
	end
	
	--HAPPINESS
	local hasReformSovHappiness = player:HasReform(reformSovHappinessID)
	if hasReformSovHappiness then
		sovFromCitiesTable.HasReformSovWhenHappiness = true
		sovFromCitiesTable.NumReformSovWhenHappiness = reformSovHappinessNum
		sovFromCitiesTable.NumReformSovWhenHappinessReq = reformSovHappinessReq
	end
	local numCitiesHappiness = 0
	
	--DEFENSE
	local hasReformSovDefense = player:HasReform(reformSovDefenseID)
	if hasReformSovDefense then
		sovFromCitiesTable.HasReformSovWhenDefense = true
		sovFromCitiesTable.NumReformSovWhenDefense = reformSovDefenseNum
		sovFromCitiesTable.NumReformSovWhenDefenseReq = reformSovDefenseReq
	end
	local numCitiesDefense = 0
	
	local playerCapital = player:GetCapitalCity()
	local numCities = player:GetNumCities()
	
	if player:IsHuman() then
		--g_Buildings_SovereigntyChange_Table
		local buildingsTable = g_Buildings_SovereigntyChange_Table
		local numBuildings = #buildingsTable
		for index = 1, numBuildings do
			local row = buildingsTable[index]
			local buildingID = row.ID
			if player:CountNumBuildings(buildingID) > 0 then
				numSovFromCities = numSovFromCities + (player:CountNumBuildings(buildingID)*row.SovereigntyChange)
			end
		end
		
		for city in player:Cities() do
			--YIELD MODS
			numSovFromCities = numSovFromCities + city:GetYieldRateModifier(yieldSovereigntyID)

			--CONNECTION
			if hasReformSovConnection then
				if (player:IsCapitalConnectedToCity(city) or city:IsCapital()) then 
					numCitiesConnection = numCitiesConnection + 1 
				end
			end
			
			--GARRISON
			if hasReformSovGarrison then
				if city:GetGarrisonedUnit() then 
					numCitiesGarrison = numCitiesGarrison + 1 
				end
			end
			
			--SPECIALIST
			if hasReformSovSpecialist then
				if player:GetCityHasAnySpecialist(city) then 
					numCitiesSpecialist = numCitiesSpecialist + 1 
				end
			end
			
			--POPULATION
			if hasReformSovPopulation then
				if city:GetPopulation() >= reformSovPopulationReq then 
					numCitiesPopulation = numCitiesPopulation + 1 
				end
			end
		
			--RELIGION
			if hasReformSovStateReligion then
				if city:GetReligiousMajority() == religionID then 
					numCitiesStateReligion = numCitiesStateReligion + 1 
				end
			end
			
			--HAPPINESS
			if hasReformSovHappiness then
				if city:GetLocalHappiness() >= reformSovHappinessReq then 
					numCitiesHappiness = numCitiesHappiness + 1 
				end
			end
			
			--DEFENSE
			if hasReformSovDefense then
				if g_GetRound(city:GetStrengthValue()/100) >= reformSovDefenseReq then 
					numCitiesDefense = numCitiesDefense + 1 
				end
			end
		end
		
		--BUILDING CLASS
		if hasReformSovBuildingClass then
			local buildingClassID = GameInfoTypes[reformSovBuildingClassType]
			numCitiesBuildingClass = player:GetBuildingClassCount(buildingClassID)
		end
		
	else
		if playerCapital then
			--g_Buildings_SovereigntyChange_Table
			local buildingsTable = g_Buildings_SovereigntyChange_Table
			local numBuildings = #buildingsTable
			for index = 1, numBuildings do
				local row = buildingsTable[index]
				local buildingID = row.ID
				if player:CountNumBuildings(buildingID) > 0 then
					numSovFromCities = numSovFromCities + (player:CountNumBuildings(buildingID)*row.SovereigntyChange)
				end
			end
			
			--YIELD MODS
			for city in player:Cities() do
				numSovFromCities = numSovFromCities + city:GetYieldRateModifier(yieldSovereigntyID)
			end
	
			--CONNECTION
			if hasReformSovConnection then
				numCitiesConnection = numCities
			end
			
			--GARRISON
			if hasReformSovGarrison then
				if playerCapital:GetGarrisonedUnit() then 
					numCitiesGarrison = numCities
				end
			end
			
			--SPECIALIST
			if hasReformSovSpecialist then
				if player:GetCityHasAnySpecialist(playerCapital) then 
					numCitiesSpecialist = numCities 
				end
			end
			
			--POPULATION
			if hasReformSovPopulation then
				if playerCapital:GetPopulation() >= reformSovPopulationReq then 
					numCitiesPopulation = numCities 
				end
			end
			
			--RELIGION 
			if hasReformSovStateReligion then
				local buildingClassID = GameInfoTypes[reformSovBuildingClassType]
				if playerCapital:GetReligiousMajority() == religionID then 
					numCitiesStateReligion = numCities 
				end
			end
			
			--BUILDING CLASS
			if hasReformSovBuildingClass then
				local buildingClassID = GameInfoTypes[reformSovBuildingClassType]
				if player:GetBuildingClassCount(buildingClassID) >= 1 then 
					numCitiesBuildingClass = numCities 
				end
			end
			
			--HAPPINESS
			if hasReformSovHappiness then
				if playerCapital:GetLocalHappiness() >= reformSovHappinessReq then 
					numCitiesHappiness = numCities 
				end
			end
			
			--DEFENSE
			if hasReformSovDefense then
				if g_GetRound(playerCapital:GetStrengthValue()/100) >= reformSovDefenseReq then 
					numCitiesDefense = numCities 
				end
			end
		end
	end
	
	sovFromCitiesTable.NumSovFromCities = numSovFromCities
	sovFromCitiesTable.HasReformSovWhenNumCitiesOrLessMet = (numCities <= reformSovNumCitiesOrLessReq)
	sovFromCitiesTable.HasReformSovWhenNumCitiesOrMoreMet = (numCities >= reformSovNumCitiesOrMoreReq)
	sovFromCitiesTable.HasReformSovWhenConnectionMet = (numCitiesConnection == numCities)
	sovFromCitiesTable.HasReformSovWhenGarrisonMet = (numCitiesGarrison == numCities)
	sovFromCitiesTable.HasReformSovWhenSpecialistMet = (numCitiesSpecialist == numCities)
	sovFromCitiesTable.HasReformSovWhenPopulationMet = (numCitiesPopulation == numCities)
	sovFromCitiesTable.HasReformSovWhenBuildingClassMet = (numCitiesBuildingClass == numCities)
	sovFromCitiesTable.HasReformSovWhenStateReligionMet = (numCitiesStateReligion == numCities)
	sovFromCitiesTable.HasReformSovWhenHappinessMet = (numCitiesHappiness == numCities)
	sovFromCitiesTable.HasReformSovWhenDefenseMet = (numCitiesDefense == numCities)
	
	return sovFromCitiesTable
end	
----------------------------------------------------------------------------------------------------------------------------
-- SOVEREIGNTY MODIFIER UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player_GetMaxSovereigntyModifier
function Player_GetMaxSovereigntyModifier(player)
	local numSovMaxMod = 0

	for index = 1, #cache.Governments do
		local row = cache.Governments[index]
		local numThisMaxSovChange = row.MaxSovChange
		if numThisMaxSovChange ~= 0 then
			if player:IsHasGovernment(row.ID) then
				numSovMaxMod = numSovMaxMod + numThisMaxSovChange
			end
		end
	end
			
	--g_JFD_Reforms_Table
	local reformsTable = g_JFD_Reforms_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local numThisMaxSovChange = row.MaxSovChange
		if numThisMaxSovChange ~= 0 then
			local reformID = row.ID
			if player:HasReform(reformID) then
				numSovMaxMod = numSovMaxMod + numThisMaxSovChange
			end
		end
	end
	
	--g_Building_JFD_SovereigntyMods_Table
	local buildingsTable = g_Building_JFD_SovereigntyMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local numThisMaxSovChange = row.MaxSovChange
		if numThisMaxSovChange ~= 0 then
			local buildingID = GameInfoTypes[row.BuildingType]
			local buildingCount = player:CountNumBuildings(buildingID)
			if buildingCount > 0 then
				numSovMaxMod = numSovMaxMod + numThisMaxSovChange
			end
		end
	end
			
	--g_Policy_JFD_SovereigntyMods_Table
	local policiesTable = g_Policy_JFD_SovereigntyMods_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local numThisMaxSovChange = row.MaxSovChange
		if numThisMaxSovChange ~= 0 then
			local policyID = GameInfoTypes[row.PolicyType]
			if player:HasPolicy(policyID) then
				numSovMaxMod = numSovMaxMod + numThisMaxSovChange
			end
		end
	end
			
	--g_Trait_JFD_SovereigntyMods_Table
	local traitsTable = g_Trait_JFD_SovereigntyMods_Table
	local numTraits = #traitsTable
	for index = 1, numTraits do
		local row = traitsTable[index]
		local numThisMaxSovChange = row.MaxSovChange
		if numThisMaxSovChange ~= 0 then
			local traitID = GameInfoTypes[row.TraitType]
			if player:HasTrait(traitID) then
				numSovMaxMod = numSovMaxMod + numThisMaxSovChange
			end
		end
	end
	
	return numSovMaxMod
end
----------------------------------------------------------------------------------------------------------------------------
--Player_GetLegitimacySovModifier
function Player_GetLegitimacySovModifier(player)
	local numLegitimacySovMod = 0
    
    -- Governments
	for index = 1, #cache.Governments do
		local government = cache.Governments[index]
		if government.LegitimacySovMod ~= 0 then
			if player:IsHasGovernment(government.ID) then
				numLegitimacySovMod = numLegitimacySovMod + government.LegitimacySovMod
			end
		end
	end
			
	-- Reforms
	for index = 1, #cache.Reforms do
		local reform = cache.Reforms[index]
		if reform.LegitimacySovMod ~= 0 then
			if player:HasReform(reform.ID) then
				numLegitimacySovMod = numLegitimacySovMod + reform.LegitimacySovMod
			end
		end
	end
	
	-- Buildings
	local buildingsTable = g_Building_JFD_SovereigntyMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local numThisLegitimacySovMod = row.LegitimacySovMod
		local reqReformID = GameInfoTypes[row.LegitimacySovModReformType]
		if (not reqReformID) or (reqReformID and reqReformID == reformID) then
			if numThisLegitimacySovMod ~= 0 then
				local buildingID = GameInfoTypes[row.BuildingType]
				local buildingCount = player:CountNumBuildings(buildingID)
				if buildingCount > 0 then
					numLegitimacySovMod = numLegitimacySovMod + (numThisLegitimacySovMod*buildingCount)
				end
			end
		end
	end
			
	--g_Policy_JFD_SovereigntyMods_Table
	local policiesTable = g_Policy_JFD_SovereigntyMods_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local numThisLegitimacySovMod = row.LegitimacySovMod
		local reqReformID = GameInfoTypes[row.LegitimacySovModReformType]
		if (not reqReformID) or (reqReformID and reqReformID == reformID) then
			if numThisLegitimacySovMod ~= 0 then
				local policyID = GameInfoTypes[row.PolicyType]
				if player:HasPolicy(policyID) then
					numLegitimacySovMod = numLegitimacySovMod + numThisLegitimacySovMod
				end
			end
		end
	end
			
	--g_Trait_JFD_SovereigntyMods_Table
	local traitsTable = g_Trait_JFD_SovereigntyMods_Table
	local numTraits = #traitsTable
	for index = 1, numTraits do
		local row = traitsTable[index]
		local numThisLegitimacySovMod = row.LegitimacySovMod
		local reqReformID = GameInfoTypes[row.LegitimacySovModReformType]
		if (not reqReformID) or (reqReformID and reqReformID == reformID) then
			if numThisLegitimacySovMod ~= 0 then
				local traitID = GameInfoTypes[row.TraitType]
				if player:HasTrait(traitID) then
					numLegitimacySovMod = numLegitimacySovMod + numThisLegitimacySovMod
				end
			end
		end
	end
	
	return numLegitimacySovMod
end
----------------------------------------------------------------------------------------------------------------------------
-- SOVEREIGNTY TEXT UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player_GetSovereigntyTopPanelInfoTT
function Player_GetSovereigntyTopPanelInfoTT(player)
	local governmentID = player:GetCurrentGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	
	local strSovTopPanelTT = g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_TT_YOUR_GOVERNMENT", government.Description)
	strSovTopPanelTT = strSovTopPanelTT .. "[NEWLINE]"
	strSovTopPanelTT = strSovTopPanelTT .. g_ConvertTextKey(government.Help)
	strSovTopPanelTT = strSovTopPanelTT .. "[NEWLINE][NEWLINE]"
	
	--SOVEREIGNTY
	local numRealSov = player:GetCurrentSovereignty()
	local numProjSov, strSovTT = player:CalculateSovereignty(true, true)
	local numSovMax = player:GetMaxSovereignty()
	local HL1 = "[COLOR_JFD_SOVEREIGNTY_FADING]"
	if numRealSov >= numSovMax then
		HL1 = "[COLOR_JFD_SOVEREIGNTY]"
	end
	local HL2 = "[COLOR_JFD_SOVEREIGNTY_FADING]"
	if numProjSov >= numSovMax then
		HL2 = "[COLOR_JFD_SOVEREIGNTY]"
	end
	strSovTopPanelTT = strSovTopPanelTT .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_TT_YOUR_SOVEREIGNTY", numRealSov, numSovMax, numProjSov, HL1, HL2)
	strSovTopPanelTT = strSovTopPanelTT .. strSovTT
	
	--LEGISLATURE COOLDOWN
	local numGovernmentCooldown = player:GetCurrentGovernmentCooldown()
	if numGovernmentCooldown > 0 then
		strSovTopPanelTT = strSovTopPanelTT .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_TT_GOVERNMENT_COOLDOWN", numGovernmentCooldown)	
	end
	
	--REFORM COOLDOWN
	local numReformCooldown = player:GetCurrentReformCooldown()
	if numReformCooldown > 0 then
		--if govtCooldown <= 0 then sovereigntyTT = sovereigntyTT .. "[NEWLINE]" end
		strSovTopPanelTT = strSovTopPanelTT .. "[NEWLINE]".. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_TT_REFORM_COOLDOWN", numReformCooldown)	
	else
		--if govtCooldown <= 0 then sovereigntyTT = sovereigntyTT .. "[NEWLINE]" end
		strSovTopPanelTT = strSovTopPanelTT .. "[NEWLINE]".. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_TT_REFORM_NONE")	
	end
	
	--HELP
	--strSovTopPanelTT = strSovTopPanelTT .. "[NEWLINE][NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_TT_INFO")
	
	return strSovTopPanelTT
end
--==========================================================================================================================
-- GOVERNMENT UTILS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENT UTILS
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--Game.AnyoneHasGovernment
function Game.AnyoneHasGovernment(player, governmentID)
	for otherPlayerID = 0, defineMaxMajorCivs - 1 do
		local otherPlayer = Players[otherPlayerID]
		if otherPlayer:IsAlive() then
			if otherPlayer:IsHasGovernment(governmentID) then
				return true
			end
		end
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------
--Player:CanHaveLimitedGovernment
function Player.CanHaveLimitedGovernment(player)
	if player:IsBarbarian() then return false end
	return (player:GetTotalPopulation() >= defineDefaultLimitedGovernmentPopThreshold) and (not player:IsHasGovernment()) and (not player:IsHasLimitedGovernment())
end
----------------------------------------------------------------------------------------------------------------------------
--Player:CanChangeGovernment
function Player.CanChangeGovernment(player)
	local government = GameInfo.JFD_Governments[player:GetCurrentGovernment()]
	
	if (player:IsAnarchy() and (not player:IsHuman())) then
		return true
	end
	
	if government.IsAllowsChangeGovernment then
		return true, g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_VIEW_GOVERNMENTS_TT")
	end
	
	local dominantFactionID = player:GetDominantFaction()
	if dominantFactionID > -1 then
		local dominantFaction = GameInfo.JFD_Factions[dominantFactionID]
		if dominantFaction.IsAllowsChangeGovernment then
			return true, g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_VIEW_GOVERNMENTS_TT")
		end
	end
	
	if (player:GetExcessHappiness() > 0 and (not player:IsHuman())) then
		return false
	end

    local canChange = load( player, "CanChangeGovernment" ) or false;
	
	return canChange, g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_VIEW_GOVERNMENTS_TT_DISABLED")
end
----------------------------------------------------------------------------------------------------------------------------
--Player:CanHaveGovernment
function Player.CanHaveGovernment(player, governmentID)

    print("Can have " .. governmentID .. "?")

	if governmentID == 0 then
		return false
	end
	
	local currentGovernmentID = player:GetCurrentGovernment()
	local currentGovernment = GameInfo.JFD_Governments[currentGovernmentID]
	local government = GameInfo.JFD_Governments[governmentID]
	local canHaveGovernment = true
	local canSeeGovernment = true
	local strCanHaveGovernment = ""
	
	if governmentID == currentGovernmentID then
		canHaveGovernment = false
		canSeeGovernment = true
		strCanHaveGovernment = strCanHaveGovernment .. "[NEWLINE][NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_CHOOSE_GOVERNMENT_WARNING_CURRENT")
		return canHaveGovernment, canSeeGovernment, strCanHaveGovernment
	end
	
	local reqBuildingOR = government.RequiresBuildingOR
	if reqBuildingOR then
		local buildingORID = GameInfoTypes[reqBuildingOR]
		if player:CountNumBuildings(buildingORID) > 0 then
			canHaveGovernment = true
			canSeeGovernment = true
			return canHaveGovernment, canSeeGovernment, strCanHaveGovernment
		end
	end
	
	local reqPopulation = government.RequiresPopulation
	if reqPopulation > 0 then
		local numTotalPop = player:GetTotalPopulation()
		if numTotalPop < reqPopulation then
			canHaveGovernment = false
			canSeeGovernment = true
			strCanHaveGovernment = strCanHaveGovernment .. "[NEWLINE][NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_CHOOSE_GOVERNMENT_WARNING_REQUIRES_POPULATION", reqPopulation, numTotalPop)
		end
	end

	local reqBuilding = government.RequiresBuilding
	if reqBuilding then
		local buildingID = GameInfoTypes[reqBuilding]
		local building = GameInfo.Buildings[buildingID]
		if player:CountNumBuildings(buildingID) <= 0 then
			canHaveGovernment = false
			canSeeGovernment = false
			strCanHaveGovernment = strCanHaveGovernment .. "[NEWLINE][NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_CHOOSE_GOVERNMENT_WARNING_REQUIRES_BUILDING", building.Description)
			return canHaveGovernment, canSeeGovernment, strCanHaveGovernment
		end
	end

	local reqGovernment = government.RequiresGovernment
	if reqGovernment then
		local reqGovernmentID = GameInfoTypes[reqGovernment]
		local reqGovernment = GameInfo.JFD_Governments[reqGovernmentID]
		if currentGovernmentID ~= reqGovernmentID then
			canHaveGovernment = false
			canSeeGovernment = true
			strCanHaveGovernment = strCanHaveGovernment .. "[NEWLINE][NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_CHOOSE_GOVERNMENT_WARNING_REQUIRES_GOVERNMENT", reqGovernment.Description)
		end
	end

	if government.RequiresIdeology then
		if player:GetIdeology() < 0 then
			canHaveGovernment = false
			canSeeGovernment = true
			strCanHaveGovernment = strCanHaveGovernment .. "[NEWLINE][NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_CHOOSE_GOVERNMENT_WARNING_REQUIRES_IDEOLOGY")
		end
	end

	local reqReligion = government.RequiresReligion
	if reqReligion then
		if player:GetReligionCreatedByPlayer() <= 0 then 
			canHaveGovernment = false
			canSeeGovernment = true
			strCanHaveGovernment = strCanHaveGovernment .. "[NEWLINE][NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_CHOOSE_GOVERNMENT_WARNING_REQUIRES_RELIGION")
		end
	end

	if government.IsUnique then
		for otherPlayerID = 0, defineMaxMajorCivs - 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsAlive() then
				if otherPlayer:GetCurrentGovernment() == governmentID then
					canHaveGovernment = false
					canSeeGovernment = true
					if otherPlayerID == player:GetID() then
						strCanHaveGovernment = strCanHaveGovernment .. "[NEWLINE][NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_CHOOSE_GOVERNMENT_WARNING_REQUIRES_UNIQUE_YOU")
					else
						strCanHaveGovernment = strCanHaveGovernment .. "[NEWLINE][NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_CHOOSE_GOVERNMENT_WARNING_REQUIRES_UNIQUE", otherPlayer:GetName())
					end
					break
				end
			end
		end
	end
	
	if government.IsLimited then
		canHaveGovernment = (currentGovernment.IsLimited)
		canSeeGovernment  = (currentGovernment.IsLimited)
	end

	return canHaveGovernment, canSeeGovernment, strCanHaveGovernment
end
----------------------------------------------------------------------------------------------------------------------------
--Player:SetHasGovernment
function Player.SetHasGovernment(player, governmentID, isInit, isChanging)
	local playerID = player:GetID()
	local oldGovernmentID = player:GetCurrentGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
		
	player:SetGovernment(governmentID)
    LuaEvents.JFD_Sovereignty_UI_BlockEndTurnButton(false, playerID)
    LuaEvents.UI_ClearNotification("GovernmentChoice")
    save( player, "CanChangeGovernment", false );
	
	if player:IsMinorCiv() then return end
	
	local isLimited = government.IsLimited
	local isSemiLimited = government.IsSemiLimited
	if isInit then
		player:SetHasAllDefaultReforms(governmentID, true, false, false, true)
	elseif isLimited or isSemiLimited then
		player:SetHasAllDefaultReforms(governmentID, true, isLimited, isSemiLimited, true)
	end
	
	local numReformCooldown = player:CalculateReformCooldown()
	if numReformCooldown ~= 0 then
		player:SetCurrentReformCooldown(numReformCooldown)
		player:SetReformCooldownRate(defineDefaultReformCooldownRate) 

	end

	player:UpdateCurrentSovereignty()
	
	if player:IsHuman() and player:IsTurnActive() then
		local notificationDesc = government.NotificationDescription
		local notificationShortDesc = government.NotificationShortDescription
		if isChanging then
			notificationDesc = notificationDesc .. "_CHANGE"
			notificationShortDesc = notificationShortDesc .. "_CHANGE"
			local oldGovernment = GameInfo.JFD_Governments[oldGovernmentID]
			player:SendNotification("NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", g_ConvertTextKey(notificationDesc, government.Description, oldGovernment.Description), g_ConvertTextKey(notificationShortDesc), false, nil, nil, governmentID)
		else
			player:SendNotification("NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", g_ConvertTextKey(notificationDesc, government.Description), g_ConvertTextKey(notificationShortDesc), false, nil, nil, governmentID)
		end
		
		if government.AudioEffect then
			Events.AudioPlay2DSound(government.AudioEffect);
		end

		Events.OpenInfoCorner( InfoCornerID.Civilization );
		LuaEvents.UI_UpdateCivilizationOverview()
	else
		local notificationWorldEvent = government.NotificationWorldEvent
		if isChanging then
			notificationWorldEvent = notificationWorldEvent .. "_CHANGE"
			local oldGovernment = GameInfo.JFD_Governments[oldGovernmentID]
			player:SendWorldEvent(g_ConvertTextKey(notificationWorldEvent, player:GetCivilizationShortDescriptionKey(), government.Description, oldGovernment.Description))	
		else
			player:SendWorldEvent(g_ConvertTextKey(notificationWorldEvent, player:GetCivilizationShortDescriptionKey(), government.Description))
		end
	end	

	LuaEvents.JFD_GovernmentEstablished(playerID, governmentID, oldGovernmentID)

    if government.StartsGoldenAge then
        player:ChangeGoldenAgeTurns(10)
    end
	
	if government.IsLegislated then
		player:ResetLegislature(governmentID, true)
	end
	
	if (not isInit) then
		player:UpdateLeaderName(governmentID)
		player:UpdateCivilizationStateDescription(governmentID)
	end	
end
----------------------------------------------------------------------------------------------------------------------------
--Player:GetCurrentGovernment
function Player.GetCurrentGovernment(player)
	local playerID = player:GetID()
    local currentGovernmentID = player:GetGovernment()
    
    if currentGovernmentID == 0 or currentGovernmentID == -1 then
	   if player:IsMinorCiv() then
	       currentGovernmentID = governmentPolisID
	   else
	       currentGovernmentID = governmentTribeID
	   end
	end

    return currentGovernmentID

end
----------------------------------------------------------------------------------------------------------------------------
--Player:IsHasGovernment
function Player.IsHasGovernment(player, governmentID)
	if governmentID then
		return (player:GetCurrentGovernment() == governmentID)
	else
		return (player:GetCurrentGovernment() > governmentTribeID)
	end	
end
----------------------------------------------------------------------------------------------------------------------------
--Player:IsHasLimitedGovernment
function Player.IsHasLimitedGovernment(player)
	local currentGovernmentID = player:GetCurrentGovernment()
	if currentGovernmentID then
		return GameInfo.JFD_Governments[currentGovernmentID].IsLimited
	else
		return false
	end
end
----------------------------------------------------------------------------------------------------------------------------
--Player:IsHasFullGovernment
function Player.IsHasFullGovernment(player)
	return (not player:IsHasLimitedGovernment())
end
----------------------------------------------------------------------------------------------------------------------------
--Player_GetGovernmentPreference
function Player_GetGovernmentPreference(player, isRandom)

	if (not isRandom) then
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		--g_Civilization_JFD_Governments_Table
		local governmentsTable = g_Civilization_JFD_Governments_Table
		local numGovernments = #governmentsTable
		for index = 1, numGovernments do
			local row = governmentsTable[index]
			if row.CivilizationType == civType then
				local governmentType = row.GovernmentType
				local government = GameInfo.JFD_Governments[governmentType]
				local governmentPrefID = GameInfoTypes[governmentType]
				if governmentPrefID and player:CanHaveGovernment(governmentPrefID) then
					local flavour1 = player:GetFlavorValue(government.FlavorType1)
					local flavour2 = player:GetFlavorValue(government.FlavorType2)
					local weight = flavour1 + flavour2 + row.Weight
					return governmentPrefID, weight
				elseif governmentPrefID == govermentDictatorshipID or governmentPrefID == govermentShogunateID then
					governmentPrefID = governmentRepublicID
					if governmentPrefID and player:CanHaveGovernment(governmentPrefID) then
						local flavour1 = player:GetFlavorValue(government.FlavorType1)
						local flavour2 = player:GetFlavorValue(government.FlavorType2)
						local weight = flavour1 + flavour2 + row.Weight
						return governmentPrefID, weight
					end
				elseif (governmentPrefID == govermentHREID or governmentPrefID == govermentMandateID or governmentPrefID == govermentCaliphateID) then
					governmentPrefID = governmentMonarchyID
					if governmentPrefID and player:CanHaveGovernment(governmentPrefID) then
						local flavour1 = player:GetFlavorValue(government.FlavorType1)
						local flavour2 = player:GetFlavorValue(government.FlavorType2)
						local weight = flavour1 + flavour2 + row.Weight
						return governmentPrefID, weight
					end
				elseif governmentPrefID == govermentPapacyID then
					governmentPrefID = governmentTheocracyID
					if governmentPrefID and player:CanHaveGovernment(governmentPrefID) then
						local flavour1 = player:GetFlavorValue(government.FlavorType1)
						local flavour2 = player:GetFlavorValue(government.FlavorType2)
						local weight = flavour1 + flavour2 + row.Weight
						return governmentPrefID, weight
					end
				end
			end
		end
		
		local govtPreferenceID = nil
		local govtPreferenceWeight = 0

		for index = 1, #cache.Governments do
			local government = cache.Governments[index]
			if player:CanHaveGovernment(government.ID) then
				local flavour1 = player:GetFlavorValue(government.FlavorType1)
				local flavour2 = player:GetFlavorValue(government.FlavorType2)
				local weight = flavour1 + flavour2 
				if weight > govtPreferenceWeight then
					govtPreferenceID = government.ID
					govtPreferenceWeight = weight
				end
			end
		end
		if govtPreferenceID then
			return govtPreferenceID, govtPreferenceWeight
		end
	else
		local validGovts = {}
		local numValidGovts = 1

		for index = 1, #cache.Governments do
			local government = cache.Governments[index]
			if player:CanHaveGovernment(government.ID) then
				validGovts[numValidGovts] = government.ID
				numValidGovts = numValidGovts + 1
			end
		end
		return validGovts[g_GetRandom(1,#validGovts)]
	end
end
----------------------------------------------------------------------------------------------------------------------------
--Player:DoInitiateGovernmentChoice
function Player.InitiateGovernmentChoice(player)
	local playerID = player:GetID()
	if player:IsHuman() and player:IsTurnActive() then
		player:SendNotification("NOTIFICATION_JFD_GOVERNMENT_CHOICE", g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_GOVERNMENT_CHOICE_DESC"), g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_GOVERNMENT_CHOICE_SHORT_DESC"), false, nil, nil, -1)
   		Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_VERY_GOOD")
		LuaEvents.JFD_Sovereignty_UI_BlockEndTurnButton(true, playerID)
        save( player, "CanChangeGovernment", true );
	else
		local currentGovernmentID = player:GetCurrentGovernment()
		local isInit = (currentGovernmentID == governmentTribeID)
		local isChanging = player:IsHasGovernment()

		local governmentPrefID, governmentPrefVal = Player_GetGovernmentPreference(player)
		if player:CanHaveGovernment(governmentPrefID) then
			if governmentPrefVal >= g_GetRandom(1,100) then
				player:SetHasGovernment(governmentPrefID, isInit, isChanging)
			else
				local newGovernmentPrefID = Player_GetGovernmentPreference(player, true)
				if newGovernmentPrefID then
					player:SetHasGovernment(newGovernmentPrefID, isInit, isChanging)
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
--Player:InitiateGovernmentChangeConsideration
function Player.InitiateGovernmentChangeConsideration(player, currentGovernmentID, isReligious, isIdeological)
	if (not player:IsHuman()) then
		print(Game.GetGameTurn() .. " " .. player:GetName() .. " is considering changing Government!")

		if currentGovernmentID ~= governmentDictatorshipID then
			local hasChosenDictatorship = false
			local numTenets = player:GetNumIdeologicalTenets()
			if numTenets > 0 then
				local chanceToChange = g_GetRound(100/numTenets)
				if chanceToChange <= g_GetRandom(1,100) then
					player:SetHasGovernment(governmentDictatorshipID, false, true)
					hasChosenDictatorship = true
				end
			end

			if (not hasChosenDictatorship) then
				local prefGovernmentID = Player_GetGovernmentPreference(player)
				if isReligious and prefGovernmentID ~= governmentTheocracyID then return end
				if isIdeological and prefGovernmentID ~= governmentDictatorshipID then return end
				
				if prefGovernmentID and prefGovernmentID ~= currentGovernmentID then
					player:SetHasGovernment(prefGovernmentID, false)
				end

				local chanceToChange = g_GetRandom(1,100)
				if chanceToChange <= 25 then
					local governmentToChangeID = governmentRepublicID
					if currentGovernmentID == governmentRepublicID then
						governmentToChangeID = governmentMonarchyID 
					end
					player:SetHasGovernment(governmentToChangeID, false, true)
				end
			end
		else
			player:ResetLegislature(governmentDictatorshipID)
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENT TITLES UTILS
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Government_LeaderTitles_Table
local g_JFD_Government_LeaderTitles_Table = {}
local g_JFD_Government_LeaderTitles_Count = 1
for row in DB.Query("SELECT * FROM JFD_Government_Titles WHERE TitleLeader IS NOT NULL ORDER BY Priority;") do 	
	g_JFD_Government_LeaderTitles_Table[g_JFD_Government_LeaderTitles_Count] = row
	g_JFD_Government_LeaderTitles_Count = g_JFD_Government_LeaderTitles_Count + 1
end

--g_JFD_Government_StateTitles_Table
local g_JFD_Government_StateTitles_Table = {}
local g_JFD_Government_StateTitles_Count = 1
for row in DB.Query("SELECT * FROM JFD_Government_Titles WHERE TitleState IS NOT NULL ORDER BY Priority;") do 	
	g_JFD_Government_StateTitles_Table[g_JFD_Government_StateTitles_Count] = row
	g_JFD_Government_StateTitles_Count = g_JFD_Government_StateTitles_Count + 1
end

--g_JFD_Government_StyleTitles_Table
local g_JFD_Government_StyleTitles_Table = {}
local g_JFD_Government_StyleTitles_Count = 1
for row in DB.Query("SELECT * FROM JFD_Government_Titles WHERE TitleStyle IS NOT NULL ORDER BY Priority;") do 	
	g_JFD_Government_StyleTitles_Table[g_JFD_Government_StyleTitles_Count] = row
	g_JFD_Government_StyleTitles_Count = g_JFD_Government_StyleTitles_Count + 1
end
----------------------------------------------------------------------------------------------------------------------------
--Player:GetLeaderTitle
function Player.GetLeaderTitle(player, governmentID, includeEpithet, includeFullTitle, includeFullTitleWithStyle, otherPlayer)
	local isFeminine = player:IsLeaderFeminine()
	
	if otherPlayer then
		player = otherPlayer
	end
	
	if (not governmentID) then
		governmentID = player:GetCurrentGovernment()
		if governmentID == -1 then
			governmentID = governmentTribeID
		end
	end
	
	-- print("Getting Leader Title", debug.traceback())
	
	local playerID = player:GetID()
	local playerTeam = Teams[player:GetTeam()]
	local playerCapital = player:GetCapitalCity()
	local leaderName = g_ConvertTextKey(player:GetDefaultName())
	local government = GameInfo.JFD_Governments[governmentID]
	
	if player:IsMinorCiv() then
		--LEADER TITLE
		local minorCivID = player:GetMinorCivType()
		if minorCivID == -1 then
			minorCivID = otherPlayer:GetMinorCivType()
		end
		local strLeaderTitle = "TXT_KEY_JFD_TITLE_LEADER_" .. GameInfo.MinorCivilizations[minorCivID].Type
		
		--FEMALE
		if isFeminine then
			strLeaderTitle = strLeaderTitle .. "_FEMALE"
		end
		strLeaderTitle = g_ConvertTextKey(strLeaderTitle)

		return strLeaderTitle
		
	else
		--LEADER TITLE
		local strLeaderTitle
		local strLeaderTitleText 
		local strLeaderTitleStyleText 
		local isStateTitleDoNotUseCiv = false
		local isLeaderTitleAfterName = false
	
		--FEMALE
		--SPECIAL TITLES
		--g_JFD_Government_LeaderTitles_Table
		local titlesTable = g_JFD_Government_LeaderTitles_Table
		local numTitles = #titlesTable
		for index = 1, numTitles do
			local row = titlesTable[index]
			local strSpecialLeaderTitle = row.TitleLeader
			local isTitleMet = true
			
			--FEMALE
			if isFeminine then
				strSpecialLeaderTitle = strSpecialLeaderTitle .. "_FEMALE"
			end
			
			--Governments
			local thisGovernmentID = GameInfoTypes[row.GovernmentType]
			if (thisGovernmentID and governmentID == thisGovernmentID) or (not thisGovernmentID) then
				
				local thisGovernmentNOTID = GameInfoTypes[row.GovernmentTypeNOT]
				if (thisGovernmentNOTID and governmentID == thisGovernmentNOTID) then
					isTitleMet = false
				end
						
				--Era
				local eraID = GameInfoTypes[row.EraType]
				if eraID and player:GetCurrentEra() <= eraID then
					isTitleMet = false
				end
		
				--Beliefs
				local belief = row.BeliefType
				local beliefID = GameInfoTypes[belief]
				if beliefID then
					if (not player:HasBelief(beliefID)) then
						isTitleMet = false
					end
				elseif belief then
					isTitleMet = false
				end
				
				--Buildings
				local building = row.BuildingType
				local buildingID = GameInfoTypes[building]
				if buildingID then
					if player:CountNumBuildings(buildingID) == 0 then
						isTitleMet = false
					end
				elseif building then
					isTitleMet = false
				end
					
				--Ideologies
				local ideology = row.IdeologyType
				local ideologyID = GameInfoTypes[ideology]
				if ideologyID then
					if (not player:IsPolicyBranchUnlocked(ideologyID)) then
						isTitleMet = false
					end
				elseif ideology then
					isTitleMet = false
				end
					
				--Policy Branches
				local policyBranch = row.PolicyBranchType
				local policyBranchID = GameInfoTypes[policyBranch]
				if policyBranchID then
					if player:GetDominantPolicyBranchForTitle() ~= policyBranchID then
						isTitleMet = false
					end
				elseif policyBranch then
					isTitleMet = false
				end
					
				--Policies
				local policy = row.PolicyType
				local policyID = GameInfoTypes[policy]
				if policyID then
					if (not player:HasPolicy(policyID)) then
						isTitleMet = false
					end
				elseif policy then
					isTitleMet = false
				end
				local policyAND = row.PolicyTypeAND
				local policyANDID = GameInfoTypes[policyAND]
				if policyANDID then
					if (not player:HasPolicy(policyANDID)) then
						isTitleMet = false
					end
				elseif policyAND then
					isTitleMet = false
				end
					
				--Reforms
				local reform = row.ReformType
				local reformID = GameInfoTypes[reform]
				if reformID then
					if (not player:HasReform(reformID)) then
						isTitleMet = false
					end
				elseif reform then
					isTitleMet = false
				end
				local reformAND = row.ReformTypeAND
				local reformANDID = GameInfoTypes[reformAND]
				if reformANDID then
					if (not player:HasReform(reformANDID)) then
						isTitleMet = false
					end
				elseif reformAND then
					isTitleMet = false
				end
				local reformAND2 = row.ReformTypeAND2
				local reformAND2ID = GameInfoTypes[reformAND2]
				if reformAND2ID then
					if (not player:HasReform(reformAND2ID)) then
						isTitleMet = false
					end
				elseif reformAND2 then
					isTitleMet = false
				end
				local reformAND3 = row.ReformTypeAND3
				local reformAND3ID = GameInfoTypes[reformAND3]
				if reformAND3ID then
					if (not player:HasReform(reformAND3ID)) then
						isTitleMet = false
					end
				elseif reformAND3 then
					isTitleMet = false
				end
				local reformNOT = row.ReformTypeNOT
				local reformNOTID = GameInfoTypes[reformNOT]
				if reformNOTID then
					if player:HasReform(reformNOTID) then
						isTitleMet = false
					end
				elseif reformNOT then
					isTitleMet = false
				end
				
				--Anti-Pope
				if row.IsAntiPope then
					if (not Game.AnyoneHasGovernment(governmentPapacyID)) then
						isTitleMet = false
					end
				end
	
				--Religion Founded
				local religion = row.ReligionFoundedType
				local religionID = GameInfoTypes[religion]
				if religionID then
					if Game.GetFounderBenefitsReligion(playerID) ~= religionID then
						isTitleMet = false
					end
				elseif religion then
					isTitleMet = false
				end
		
				--State Religion
				local religion = row.StateReligionType
				local religionID = GameInfoTypes[religion]
				if religionID then
					local stateReligionID = player:GetMainReligion()
					if religionID and religionID ~= stateReligionID then
						isTitleMet = false
					end
				elseif religion then
					isTitleMet = false
				end
		
				--Vassals
				if row.IsVassalOfSomeone then
					if playerTeam.IsVassalOfSomeone then
						if (not playerTeam:IsVassalOfSomeone()) then
							isTitleMet = false
						end
						if row.IsVassalHRE then
							local playerMasterID = playerTeam:GetMaster()
							if playerMasterID ~= -1 then
								local playerMaster = Players[playerMasterID]
								if playerMaster:GetCurrentGovernment() ~= governmentHREID then
									isTitleMet = false
								end
							end
						end
					else
						isTitleMet = false
					end
				end
				
				--Historical Prime Ministers/Chancellors
				if row.IsLeaderPrimeMinister then
					if (not player:IsHistoricalPrimeMinister()) then
						isTitleMet = false
					end
				end	
				
				--Historical Regents
				if row.IsLeaderRegent then
					if (not player:IsHistoricalRegent()) then
						isTitleMet = false
					end
				end	
				
				if isTitleMet then
					strLeaderTitle = g_ConvertTextKey(strSpecialLeaderTitle)
					isStateTitleDoNotUseCiv = row.IsStateTitleDoNotUseCiv
					isLeaderTitleAfterName = row.IsLeaderTitleAfterName
				end
			else
				isTitleMet = false
			end
		end
	
		--LEADER FULL TITLE
		if includeFullTitle and strLeaderTitle then

			if isLeaderTitleAfterName then
				strLeaderTitleText = g_ConvertTextKey("TXT_KEY_JFD_BLANK_LEADER_TITLE", leaderName, strLeaderTitle)
			else
				strLeaderTitleText = g_ConvertTextKey("TXT_KEY_JFD_BLANK_LEADER_TITLE", strLeaderTitle, leaderName)
			end
			
			--LEADER FULL TITLE WITH STYLE
			if includeFullTitleWithStyle then
				strLeaderTitleStyleText = leaderName
				
				local strStateTitle, strStateTitleText = player:GetStateTitle(governmentID, true)
				
				local isTitleStyleReqAndIsFirst = true
				--SPECIAL STYLES
				--g_JFD_Government_StyleTitles_Table
				local titlesTable = g_JFD_Government_StyleTitles_Table
				local numTitles = #titlesTable
				for index = 1, numTitles do
					local row = titlesTable[index]
					local strStyleTitle = row.TitleStyle
					if isFeminine then
						strStyleTitle = strStyleTitle .. "_FEMALE"
					end
					local isTitleStyleReqAnd = row.IsStyleRequiresAnd
					local isTitleMet = true
					
					--Beliefs
					local belief = row.BeliefType
					local beliefID = GameInfoTypes[belief]
					if beliefID then
						if (not player:HasBelief(beliefID)) then
							isTitleMet = false
						end
					elseif belief then
						isTitleMet = false
					end
	
					--Buildings
					local building = row.BuildingType
					local buildingID = GameInfoTypes[building]
					if buildingID then
						if player:CountNumBuildings(buildingID) == 0 then
							isTitleMet = false
						end
					elseif building then
						isTitleMet = false
					end
						
					--Ideologies
					local ideology = row.IdeologyType
					local ideologyID = GameInfoTypes[ideology]
					if ideologyID then
						if (not player:IsPolicyBranchUnlocked(ideologyID)) then
							isTitleMet = false
						end
					elseif ideology then
						isTitleMet = false
					end
						
					--Policies
					local policy = row.PolicyType
					local policyID = GameInfoTypes[policy]
					if policyID then
						if (not player:HasPolicy(policyID)) then
							isTitleMet = false
						end
					elseif policy then
						isTitleMet = false
					end
					local policyAND = row.PolicyTypeAND
					local policyANDID = GameInfoTypes[policyAND]
					if policyANDID then
						if (not player:HasPolicy(policyANDID)) then
							isTitleMet = false
						end
					elseif policyAND then
						isTitleMet = false
					end
			
					--Governments
					local reqGovernmentID = GameInfoTypes[row.GovernmentType]
					if (reqGovernmentID and governmentID ~= reqGovernmentID) then
						isTitleMet = false
					end
					local thisGovernmentNOTID = GameInfoTypes[row.GovernmentTypeNOT]
					if (thisGovernmentNOTID and governmentID == thisGovernmentNOTID) then
						isTitleMet = false
					end
						
					--Reforms
					local reform = row.ReformType
					local reformID = GameInfoTypes[reform]
					if reformID then
						if (not player:HasReform(reformID)) then
							isTitleMet = false
						end
					elseif reform then
						isTitleMet = false
					end
					local reformAND = row.ReformTypeAND
					local reformANDID = GameInfoTypes[reformAND]
					if reformANDID then
						if (not player:HasReform(reformANDID)) then
							isTitleMet = false
						end
					elseif reformAND then
						isTitleMet = false
					end
					local reformAND2 = row.ReformTypeAND2
					local reformAND2ID = GameInfoTypes[reformAND2]
					if reformAND2ID then
						if (not player:HasReform(reformAND2ID)) then
							isTitleMet = false
						end
					elseif reformAND2 then
						isTitleMet = false
					end
					local reformAND3 = row.ReformTypeAND3
					local reformAND3ID = GameInfoTypes[reformAND3]
					if reformAND3ID then
						if (not player:HasReform(reformAND3ID)) then
							isTitleMet = false
						end
					elseif reformAND3 then
						isTitleMet = false
					end
					local reformNOT = row.ReformTypeNOT
					local reformNOTID = GameInfoTypes[reformNOT]
					if reformNOTID then
						if player:HasReform(reformNOTID) then
							isTitleMet = false
						end
					elseif reformNOT then
						isTitleMet = false
					end
	
					--Religion Founded
					local religion = row.ReligionFoundedType
					local religionID = GameInfoTypes[religion]
					if religionID then
						if Game.GetFounderBenefitsReligion(playerID) ~= religionID then
							isTitleMet = false
						end
					elseif religion then
						isTitleMet = false
					end
			
					--State Religion
					local religion = row.StateReligionType
					local religionID = GameInfoTypes[religion]
					if religionID then
						local stateReligionID = player:GetMainReligion()
						if religionID and religionID ~= stateReligionID then
							isTitleMet = false
						end
					elseif religion then
						isTitleMet = false
					end
					
					if isTitleMet then
						if row.UseAdjectiveInLocalization then
							local civAdj = player:GetCivilizationAdjective()
							strStyleTitle = g_ConvertTextKey(strStyleTitle, civAdj)
						end
						if row.UseGovernmentDescriptionInLocalization then
							local govtDesc = government.Description
							strStyleTitle = g_ConvertTextKey(strStyleTitle, govtDesc)
						end
						if row.UseDescriptionInLocalization then
							local civDesc = player:GetCivilizationShortDescription()
							strStyleTitle = g_ConvertTextKey(strStyleTitle, civDesc)
						end
						if row.UseReligionInLocalization then
							local mainReligionID = player:GetMainReligion()
							if mainReligionID > -1 then
								local religionAdj = GameInfo.Religions[mainReligionID].Adjective
								if religionAdj then
									strStyleTitle = g_ConvertTextKey(strStyleTitle, religionAdj)
								end
							end
						end
						if row.UseCapitalInLocalization and playerCapital then
							strStyleTitle = g_ConvertTextKey(strStyleTitle, playerCapital:GetName())
						end
						
						if isTitleStyleReqAnd then
							if isTitleStyleReqAndIsFirst then
								strLeaderTitleStyleText = strLeaderTitleStyleText .. ", " .. g_ConvertTextKey(strStyleTitle)
								isTitleStyleReqAndIsFirst = false
							else
								strLeaderTitleStyleText = strLeaderTitleStyleText .. ", " .. g_ConvertTextKey("TXT_KEY_JFD_TITLE_AND") .. " " .. g_ConvertTextKey(strStyleTitle)
							end
						else
							strLeaderTitleStyleText = strLeaderTitleStyleText .. ", " .. g_ConvertTextKey(strStyleTitle)
						end
					end
				end
				
				if (not isStateTitleDoNotUseCiv) then
					strLeaderTitleStyleText = strLeaderTitleStyleText .. ", " .. g_ConvertTextKey(strLeaderTitle) .. " " .. g_ConvertTextKey("TXT_KEY_JFD_TITLE_OF") .. " " .. player:GetCivilizationShortDescription()
				else
					strLeaderTitleStyleText = strLeaderTitleStyleText .. ", " .. g_ConvertTextKey(strLeaderTitle)
				end
				
				--CONQUESTS
				if player:HasReform(reformTerritoryEmpireID) then
					for city in player:Cities() do
						if (city:IsOriginalCapital() and city:GetOriginalOwner() ~= playerID) then	
							local originalOwnerID = city:GetOriginalOwner()
							local originalOwner = Players[originalOwnerID]
							local originalOwnerCivDesc = originalOwner:GetCivilizationShortDescription()
							local originalGovernmentID = originalOwner:GetCurrentGovernment()
							local originalGovernment = GameInfo.JFD_Governments[originalGovernmentID]
							local strConqueredTitle
							if (not originalGovernment.IsSpecial) then
								strConqueredTitle = player:GetLeaderTitle(originalGovernmentID, false, false, false, originalOwner)
							else
								strConqueredTitle = player:GetLeaderTitle(governmentID, false, false, false, originalOwner)
							end
							strLeaderTitleStyleText = strLeaderTitleStyleText .. ", " .. g_ConvertTextKey(strConqueredTitle) .. " " .. g_ConvertTextKey("TXT_KEY_JFD_TITLE_OF") .. " " .. originalOwnerCivDesc
						end
					end
				end
			end
		end

		return strLeaderTitle, strLeaderTitleText, strLeaderTitleStyleText
	end
end
----------------------------------------------------------------------------------------------------------------------------
--Player:GetStateTitle
function Player.GetStateTitle(player, governmentID, includeFullTitle)
	if (not governmentID) then
		governmentID = player:GetCurrentGovernment()
		if governmentID == -1 then
			governmentID = governmentTribeID
		end
	end
	
	local playerID = player:GetID()
	local playerTeam = Teams[player:GetTeam()]
	local playerCapital = player:GetCapitalCity()
	local civName = player:GetCivilizationShortDescription()
	local civAdj = player:GetCivilizationAdjective()
	local government = GameInfo.JFD_Governments[governmentID]
	local isNotCivNameInUse = false
	local isUseAdjective = false
	local isStateTitleOmitOf = false
	
	if player:IsMinorCiv() then
		--STATE TITLE
		local strStateTitle = "TXT_KEY_JFD_TITLE_STATE_" .. GameInfo.MinorCivilizations[player:GetMinorCivType()].Type
		strStateTitle = g_ConvertTextKey("TXT_KEY_JFD_BLANK_STATE_TITLE", strStateTitle, player:GetCivilizationShortDescription())
		
		return strStateTitle
	else
	
		--STATE TITLE
		local strStateTitle
		local strStateTitleText
		
		--SPECIAL TITLES
		--g_JFD_Government_StateTitles_Table
		local titlesTable = g_JFD_Government_StateTitles_Table
		local numTitles = #titlesTable
		for index = 1, numTitles do
			local row = titlesTable[index]
			local strSpecialStateTitle = row.TitleState
			local isTitleMet = true
			
			--Governments
			local thisGovernmentID = GameInfoTypes[row.GovernmentType]
			if (thisGovernmentID and governmentID == thisGovernmentID) or (not thisGovernmentID) then
				
				local thisGovernmentNOTID = GameInfoTypes[row.GovernmentTypeNOT]
				if (thisGovernmentNOTID and governmentID == thisGovernmentNOTID) then
					isTitleMet = false
				end
		
				--Cycle of Power
				local cyclePowerID = GameInfoTypes[row.CyclePowerType]
				if cyclePowerID and Player.GetCyclePower then
					if player:GetCyclePower() ~= cyclePowerID then
						isTitleMet = false
					end
				end
				
				--Anti-Pope
				if row.IsAntiPope then
					if (not Game.AnyoneHasGovernment(governmentPapacyID)) then
						isTitleMet = false
					end
				end
						
				--Era
				local eraID = GameInfoTypes[row.EraType]
				if eraID and player:GetCurrentEra() <= eraID then
					isTitleMet = false
				end
		
				--Beliefs
				local belief = row.BeliefType
				local beliefID = GameInfoTypes[belief]
				if beliefID then
					if (not player:HasBelief(beliefID)) then
						isTitleMet = false
					end
				elseif belief then
					isTitleMet = false
				end
		
				--Buildings
				local building = row.BuildingType
				local buildingID = GameInfoTypes[building]
				if buildingID then
					if player:CountNumBuildings(buildingID) == 0 then
						isTitleMet = false
					end
				elseif building then
					isTitleMet = false
				end
					
				--Ideologies
				local ideology = row.IdeologyType
				local ideologyID = GameInfoTypes[ideology]
				if ideologyID then
					if (not player:IsPolicyBranchUnlocked(ideologyID)) then
						isTitleMet = false
					end
				elseif ideology then
					isTitleMet = false
				end
					
				--Policies
				local policy = row.PolicyType
				local policyID = GameInfoTypes[policy]
				if policyID then
					if (not player:HasPolicy(policyID)) then
						isTitleMet = false
					end
				elseif policy then
					isTitleMet = false
				end
				local policyAND = row.PolicyTypeAND
				local policyANDID = GameInfoTypes[policyAND]
				if policyANDID then
					if (not player:HasPolicy(policyANDID)) then
						isTitleMet = false
					end
				elseif policyAND then
					isTitleMet = false
				end
					
				--Reforms
				local reform = row.ReformType
				local reformID = GameInfoTypes[reform]
				if reformID then
					if (not player:HasReform(reformID)) then
						isTitleMet = false
					end
				elseif reform then
					isTitleMet = false
				end
				local reformAND = row.ReformTypeAND
				local reformANDID = GameInfoTypes[reformAND]
				if reformANDID then
					if (not player:HasReform(reformANDID)) then
						isTitleMet = false
					end
				elseif reformAND then
					isTitleMet = false
				end
				local reformAND2 = row.ReformTypeAND2
				local reformAND2ID = GameInfoTypes[reformAND2]
				if reformAND2ID then
					if (not player:HasReform(reformAND2ID)) then
						isTitleMet = false
					end
				elseif reformAND2 then
					isTitleMet = false
				end
				local reformAND3 = row.ReformTypeAND3
				local reformAND3ID = GameInfoTypes[reformAND3]
				if reformAND3ID then
					if (not player:HasReform(reformAND3ID)) then
						isTitleMet = false
					end
				elseif reformAND3 then
					isTitleMet = false
				end
				local reformNOT = row.ReformTypeNOT
				local reformNOTID = GameInfoTypes[reformNOT]
				if reformNOTID then
					if player:HasReform(reformNOTID) then
						isTitleMet = false
					end
				elseif reformNOT then
					isTitleMet = false
				end
		
				--Religion Founded
				local religion = row.ReligionFoundedType
				local religionID = GameInfoTypes[religion]
				if religionID then
					if Game.GetFounderBenefitsReligion(playerID) ~= religionID then
						isTitleMet = false
					end
				elseif religion then
					isTitleMet = false
				end
		
				--State Religion
				local religion = row.StateReligionType
				local religionID = GameInfoTypes[religion]
				if religionID then
					local stateReligionID = player:GetMainReligion()
					if religionID and religionID ~= stateReligionID then
						isTitleMet = false
					end
				elseif religion then
					isTitleMet = false
				end
		
				--Vassals
				if row.IsVassalOfSomeone then
					if playerTeam.IsVassalOfSomeone then
						if (not playerTeam:IsVassalOfSomeone()) then
							isTitleMet = false
						end
						if row.IsVassalHRE then
							local playerMasterID = playerTeam:GetMaster()
							if playerMasterID ~= -1 then
								local playerMaster = Players[playerMasterID]
								if playerMaster:GetCurrentGovernment() ~= governmentHREID then
									isTitleMet = false
								end
							end
						end
					else
						isTitleMet = false
					end
				end
				
				--City-State Allies
				if row.MinNumCityStateAllies then
					if player:GetNumCityStatePartners() < row.MinNumCityStateAllies then
						isTitleMet = false
					end
				end
				
				if row.UseReligionAsAdjective then
					local mainReligionID = player:GetMainReligion()
					if mainReligionID > -1 then
						local religionAdj = GameInfo.Religions[mainReligionID].Adjective
						if religionAdj then
							strSpecialStateTitle = g_ConvertTextKey(strSpecialStateTitle, religionAdj)
						else
							isTitleMet = false
						end
					else
						isTitleMet = false
					end
				end
				
				if isTitleMet then
					isNotCivNameInUse = row.IsStateTitleDoNotUseCiv
					isStateTitleReverse = row.IsStateTitleReverse
					isUseAdjective = row.UseAdjective
					isStateTitleOmitOf = row.IsStateTitleOmitOf
					
					if row.UseCapital then
						civName = playerCapital:GetName()
					end
	
					strStateTitle = g_ConvertTextKey(strSpecialStateTitle)
				end
			else
				isTitleMet = false
			end
		end
	
		--STATE FULL TITLE
		if includeFullTitle then
			if isNotCivNameInUse then
				strStateTitleText = strStateTitle
			else
				if strStateTitle then
					if isStateTitleOmitOf then
						strStateTitleText = g_ConvertTextKey("TXT_KEY_JFD_BLANK_STATE_TITLE_NO_OF", strStateTitle, civName)
					else
						strStateTitleText = g_ConvertTextKey("TXT_KEY_JFD_BLANK_STATE_TITLE", strStateTitle, civName)
					end
				end
	
				--PLURAL
				if (player:IsCivilizationPlural() or isStateTitleReverse or isUseAdjective) and strStateTitle then
					strStateTitleText = g_ConvertTextKey("TXT_KEY_JFD_BLANK_STATE_TITLE_REVERSE", strStateTitle, civAdj)
				end
			end
		end

		return strStateTitle, strStateTitleText
	end
end
----------------------------------------------------------------------------------------------------------------------------
--Player:UpdateLeaderName
function Player.UpdateLeaderName(player, governmentID)
	local playerID = player:GetID()
	local _, strLeaderTitleText = player:GetLeaderTitle(governmentID, false, true)
	local strCurrentDesc = player:GetName()
	if strLeaderTitleText and strLeaderTitleText ~= strCurrentDesc then
		PreGame.SetLeaderName(playerID, strLeaderTitleText)
        print("Leader name " .. strCurrentDesc .. " updated to " .. strLeaderTitleText)
	end
end
----------------------------------------------------------------------------------------------------------------------------
--Player:UpdateCivilizationStateDescription
function Player.UpdateCivilizationStateDescription(player, governmentID)
	local playerID = player:GetID()
	local strStateTitle, strStateTitleText = player:GetStateTitle(governmentID, true)
	local strCurrentDesc = player:GetCivilizationDescription()
	if strStateTitleText and strStateTitleText ~= strCurrentDesc then
		PreGame.SetCivilizationDescription(playerID, strStateTitleText)
	end
end
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Government_Names_Table
local g_JFD_Government_Names_Table = {}
local g_JFD_Government_Names_Count = 1
for row in DB.Query("SELECT * FROM JFD_Government_Names;") do 
	g_JFD_Government_Names_Table[g_JFD_Government_Names_Count] = row
	g_JFD_Government_Names_Count = g_JFD_Government_Names_Count + 1
end

--Player:GetGovernmentName
function Player.GetGovernmentName(player, governmentID)
	local government = GameInfo.JFD_Governments[governmentID]
	local governmentType = government.Type
	local currentEraID = player:GetCurrentEra()
	local strGovernmentName = g_ConvertTextKey(government.Description)
	
	if player:IsAnarchy() then
		return g_ConvertTextKey("TXT_KEY_GOVERNMENT_JFD_ANARCHY_DESC")
	elseif government.IsUnique then
		return strGovernmentName
	end
	 
	--g_JFD_Government_Names_Table
	local governmentsTable = g_JFD_Government_Names_Table
	local numGovernments = #governmentsTable
	for index = 1, numGovernments do
		local row = governmentsTable[index]
		local isNameValid = true
		
		local reqGovernment = row.GovernmentType
		local reqGovernmentID = GameInfoTypes[reqGovernment]
		if ((reqGovernment and governmentID == reqGovernmentID) or (not reqGovernment)) then
		
			local reqEra = row.EraType
			if reqEra then
				local reqEraID = GameInfoTypes[reqGovernment]
				if reqEraID then
					if currentEraID ~= reqEraID then
						isNameValid = false
					end
				else
					isNameValid = false
				end
			end
			
			local reqReform = row.ReformType
			if reqReform then
				local reqReformID = GameInfoTypes[reqReform]
				if (not player:HasReform(reqReformID)) then
					isNameValid = false
				end
			end
			local reqReformAND = row.ReformTypeAND
			if reqReformAND then
				local reqReformANDID = GameInfoTypes[reqReformAND]
				if (not player:HasReform(reqReformANDID)) then
					isNameValid = false
				end
			end
			local reqReformNOT = row.ReformTypeNOT
			if reqReformNOT then
				local reqReformNOTID = GameInfoTypes[reqReformNOT]
				if player:HasReform(reqReformNOTID) then
					isNameValid = false
				end
			end
				
			local reqIdeology = row.IdeologyType
			if reqIdeology then
				local reqIdeologyID = GameInfoTypes[reqIdeology]
				if reqIdeologyID then
					if player:GetIdeology() ~= reqIdeologyID then
						isNameValid = false
					end
				else
					isNameValid = false
				end
			end
			
			local reqPolicy = row.PolicyType
			if reqPolicy then
				local reqPolicyID = GameInfoTypes[reqPolicy]
				if (not player:HasPolicy(reqPolicyID)) then
					isNameValid = false
				end
			end
			
			local reqBuilding = row.BuildingType
			if reqBuilding then
				local reqBuildingID = GameInfoTypes[reqBuilding]
				if player:CountNumBuildings(reqBuildingID) == 0 then
					isNameValid = false
				end
			end
			
			if row.IsNoCities then
				if player:GetNumCities() > 0 then
					isNameValid = false
				end
			end
		else
			isNameValid = false
		end
		
		if isNameValid then
			if row.UseReligionAdj then
				local mainReligionID = player:GetMainReligion()
				if mainReligionID > -1 then
					local religionAdj = GameInfo.Religions[mainReligionID].Adjective
					if religionAdj then
						strGovernmentName = g_ConvertTextKey(row.Name, religionAdj) .. " " .. strGovernmentName
					end
				end
			else
				strGovernmentName = g_ConvertTextKey(row.Name) .. " " .. strGovernmentName
			end	
		end	
	end
	
	return strGovernmentName
end
--==========================================================================================================================
-- LEGISLATURE UTILS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Faction_FavouredReforms_Table
local g_JFD_Faction_FavouredReforms_Table = {}
local g_JFD_Faction_FavouredReforms_Count = 1
for row in DB.Query("SELECT * FROM JFD_Faction_FavouredReforms;") do 	
	g_JFD_Faction_FavouredReforms_Table[g_JFD_Faction_FavouredReforms_Count] = row
	g_JFD_Faction_FavouredReforms_Count = g_JFD_Faction_FavouredReforms_Count + 1
end

--g_JFD_Faction_FavouredReforms_ReformTypes_Table
local g_JFD_Faction_FavouredReforms_ReformTypes_Table = {}
local g_JFD_Faction_FavouredReforms_ReformTypes_Count = 1
for row in DB.Query("SELECT * FROM JFD_Faction_FavouredReforms WHERE ReformType IS NOT NULL;") do 	
	g_JFD_Faction_FavouredReforms_ReformTypes_Table[g_JFD_Faction_FavouredReforms_ReformTypes_Count] = row
	g_JFD_Faction_FavouredReforms_ReformTypes_Count = g_JFD_Faction_FavouredReforms_ReformTypes_Count + 1
end

--g_JFD_Reforms_FactionSupportSovMod_Table
local g_JFD_Reforms_FactionSupportSovMod_Table = {}
local g_JFD_Reforms_FactionSupportSovMod_Count = 1
for row in DB.Query("SELECT ID, FactionSupportSovMod FROM JFD_Reforms WHERE ShowInGovernment = 1 AND FactionSupportSovMod <> 0;") do 	
	g_JFD_Reforms_FactionSupportSovMod_Table[g_JFD_Reforms_FactionSupportSovMod_Count] = row
	g_JFD_Reforms_FactionSupportSovMod_Count = g_JFD_Reforms_FactionSupportSovMod_Count + 1
end

--g_JFD_Faction_OpposedReforms_Table
local g_JFD_Faction_OpposedReforms_Table = {}
local g_JFD_Faction_OpposedReforms_Count = 1
for row in DB.Query("SELECT * FROM JFD_Faction_OpposedReforms;") do 	
	g_JFD_Faction_OpposedReforms_Table[g_JFD_Faction_OpposedReforms_Count] = row
	g_JFD_Faction_OpposedReforms_Count = g_JFD_Faction_OpposedReforms_Count + 1
end

--g_JFD_Faction_OpposedReforms_ReformTypes_Table
local g_JFD_Faction_OpposedReforms_ReformTypes_Table = {}
local g_JFD_Faction_OpposedReforms_ReformTypes_Count = 1
for row in DB.Query("SELECT * FROM JFD_Faction_OpposedReforms WHERE ReformType IS NOT NULL;") do 	
	g_JFD_Faction_OpposedReforms_ReformTypes_Table[g_JFD_Faction_OpposedReforms_ReformTypes_Count] = row
	g_JFD_Faction_OpposedReforms_ReformTypes_Count = g_JFD_Faction_OpposedReforms_ReformTypes_Count + 1
end

--g_JFD_Reforms_FactionOppositionSovMod_Table
local g_JFD_Reforms_FactionOppositionSovMod_Table = {}
local g_JFD_Reforms_FactionOppositionSovMod_Count = 1
for row in DB.Query("SELECT ID, FactionOppositionSovMod FROM JFD_Reforms WHERE ShowInGovernment = 1 AND FactionOppositionSovMod <> 0;") do 	
	g_JFD_Reforms_FactionOppositionSovMod_Table[g_JFD_Reforms_FactionOppositionSovMod_Count] = row
	g_JFD_Reforms_FactionOppositionSovMod_Count = g_JFD_Reforms_FactionOppositionSovMod_Count + 1
end
----------------------------------------------------------------------------------------------------------------------------
-- FACTION UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player:GetDominantFaction
function Player.GetDominantFaction(player, returnsTT)
	local factionID = -1
	local factionPower = 0

	--g_JFD_Factions_Table
	local factionsTable = g_JFD_Factions_Table
	local numFactions = #factionsTable
	for index = 1, numFactions do
		local row = factionsTable[index]
		local thisFactionID = row.ID
		if player:IsFactionValid(thisFactionID) then	
			local thisFactionPower = player:GetFactionPower(thisFactionID)
			if thisFactionPower > factionPower then
				factionID = thisFactionID
				factionPower = thisFactionPower
			end
		end	
	end
	
	local strDominantFactionTT
	if returnsTT then
		if factionID > -1 then
			strDominantFactionTT = g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_DOMINANT_FACTION_TT", player:GetFactionName(factionID))
			local numFactionSovMod, strFactionSovMod = Player_GetFactionSovModifier(player, true)
			if strFactionSovMod then
				strDominantFactionTT = strDominantFactionTT .. strFactionSovMod
			end
		end
	end

	return factionID, factionPower, strDominantFactionTT
end
----------------------------------------------------------------------------------------------------------------------------
--Player:GetFactionPower
function Player.GetFactionPower(player, factionID)
	return player:GetPoliticPercent(factionID)
end
----------------------------------------------------------------------------------------------------------------------------
--Player:SetFactionPower
function Player.SetFactionPower(player, factionID, setVal)
	return player:SetPoliticPercent(factionID, setVal)
end
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Faction_Names_Table
local g_JFD_Faction_Names_Table = {}
local g_JFD_Faction_Names_Count = 1
for row in DB.Query("SELECT * FROM JFD_Faction_Names;") do 	
	g_JFD_Faction_Names_Table[g_JFD_Faction_Names_Count] = row
	g_JFD_Faction_Names_Count = g_JFD_Faction_Names_Count + 1
end

--Player:GetIntendedFactionName
function Player.GetIntendedFactionName(player, factionID, governmentID, otherPlayerID)
	local playerCapital = player:GetCapitalCity()
	local civAdj = player:GetCivilizationAdjective()
	local civShortDesc = player:GetCivilizationShortDescription()
	
	if governmentID == governmentDictatorshipID then
		local factionRevolutionariesName = player:GetFactionName(factionRevolutionariesID)
		if factionRevolutionariesName ~= factionRevolutionariesDesc then
			return factionRevolutionariesName 
		end
	end
	
	local religionAdj = ""
	local religionID = player:GetMainReligion()
	if religionID ~= -1 then
		religionAdj = GameInfo.Religions[religionID].Adjective
	end
	
	local faction = GameInfo.JFD_Factions[factionID]
	local factionType = faction.Type
	local strName = g_ConvertTextKey(faction.Description)
	
	local currentEraID = player:GetCurrentEra()
	
	local factionPartyTable = {}
	local factionPartyCount = 1
	
	--g_JFD_Faction_Names_Table
	local factionsTable = g_JFD_Faction_Names_Table
	local numFactions = #factionsTable
	for index = 1, numFactions do
		local row = factionsTable[index]
		if row.FactionType == factionType then		
			local strNameIntended = g_ConvertTextKey(row.Name)
			local isNameValid = true
			
			if row.IsReligious then
				if religionID ~= -1 then
					local reqReligionID = GameInfoTypes[row.ReligionType]
					if reqReligionID then
						if religionID ~= reqReligionID then
							isNameValid = false
						end
					end
				else
					isNameValid = false
				end
			end
			
			local reqGovernment = row.GovernmentType
			if reqGovernment then
				local reqGovernmentID = GameInfoTypes[reqGovernment]
				if governmentID ~= reqGovernmentID then
					isNameValid = false
				end
			end
			
			local reqPolicyBranch = row.PolicyBranchType
			if reqPolicyBranch then
				local reqPolicyBranchID = GameInfoTypes[reqPolicyBranch]
				if reqPolicyBranchID and (not player:IsPolicyBranchUnlocked(reqPolicyBranchID)) then
					isNameValid = false
				elseif (not reqPolicyBranchID) then
					isNameValid = false
				end
			end
			
			local reqPolicy = row.PolicyType
			if reqPolicy then
				local reqPolicyID = GameInfoTypes[reqPolicy]
				if reqPolicyID and (not player:HasPolicy(reqPolicyID)) then
					isNameValid = false
				elseif (not reqPolicyID) then
					isNameValid = false
				end
			end
			
			local reqReform = row.ReformType
			if reqReform then
				local reqReformID = GameInfoTypes[reqReform]
				if (not player:HasReform(reqReformID)) then
					isNameValid = false
				end
			end
			
			local reqReformNOT = row.ReformTypeNOT
			if reqReformNOT then
				local reqReformNOTID = GameInfoTypes[reqReformNOT]
				if player:HasReform(reqReformNOTID) then
					isNameValid = false
				end
			end
			
			local reqAnyIdeology = row.ReqIdeology
			if reqAnyIdeology then
				if player:GetIdeology() == -1 then
					isNameValid = false
				end
			end
			
			local reqIdeology = row.IdeologyType
			if reqIdeology then
				local reqIdeologyID = GameInfoTypes[reqIdeology]
				if reqIdeologyID then
					if player:GetIdeology() ~= reqIdeologyID then
						isNameValid = false
					end
				else
					isNameValid = false
				end
			end
			
			if row.ReqNoIdeology then
				if player:GetIdeology() ~= -1 then
					isNameValid = false
				end
			end
			
			local minEra = row.MinEra
			if minEra then
				local minEraID = GameInfoTypes[minEra]
				if currentEraID < minEraID then
					isNameValid = false
				end
			end
			
			if isNameValid then
				if row.IsReligious then
					if religionAdj then
						strName = g_ConvertTextKey(row.Name, religionAdj)
					else
						strName = g_ConvertTextKey(row.Name, "TXT_KEY_JFD_FACTION_JFD_RELIGIOUS_NAME_1")
					end
				else
					strName = strNameIntended
				end
				
				if row.UsePlayerAdj then
					strName = g_ConvertTextKey("TXT_KEY_JFD_FACTION_PREFIX_CIV", player:GetCivilizationAdjective()) .. " " .. g_ConvertTextKey(strName)
				end
				
				if row.UsePlayerDesc then
					strName = g_ConvertTextKey(strName) .. " " .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_SUFFIX_OF_CIV", player:GetCivilizationShortDescription())
				end
				
				if row.UseCustomPlayerAdj and otherPlayerID then
					local otherPlayer = Players[otherPlayerID]
					strName = g_ConvertTextKey("TXT_KEY_JFD_FACTION_PREFIX_CIV", otherPlayer:GetCivilizationAdjective()) .. " " .. g_ConvertTextKey(strName)
				end
			
				if row.UseCustomPlayerDesc and otherPlayerID then
					local otherPlayer = Players[otherPlayerID]
					strName = g_ConvertTextKey(strName) .. " " .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_SUFFIX_OF_CIV", otherPlayer:GetCivilizationShortDescription())
				end
			
				if row.IsRandom then
					local prefixCiv = g_ConvertTextKey("TXT_KEY_JFD_FACTION_PREFIX_CIV", civAdj)
					
					if (not row.NoPrefixOrSuffix) then
						local suffixChance = g_GetRandom(1,100)
						if suffixChance <= 10 then
							local suffixDesc = "TXT_KEY_JFD_FACTION_SUFFIX_" .. g_GetRandom(1,26)
							strName = strName .. " " .. g_ConvertTextKey(suffixDesc)
						end
					end
					
					if (not row.NoGroup) then
						local groupDesc = "TXT_KEY_JFD_FACTION_GROUP_" .. g_GetRandom(1,32)
						strName = strName .. " " .. g_ConvertTextKey(groupDesc)
					end
					
					if row.AlwaysUseCivDesc then
						local prefixCiv = g_ConvertTextKey("TXT_KEY_JFD_FACTION_PREFIX_CIV", civShortDesc)
						strName = prefixCiv .. " " .. strName
					else
						local suffixChance = g_GetRandom(1,100)
						if suffixChance <= 25 then
							local suffixOfCiv = g_ConvertTextKey("TXT_KEY_JFD_FACTION_SUFFIX_OF_CIV", civShortDesc)
							strName = strName .. " " .. suffixOfCiv
						else
							local prefixChance = g_GetRandom(1,100)
							if prefixChance <= 25 then
								local prefixCiv = g_ConvertTextKey("TXT_KEY_JFD_FACTION_PREFIX_CIV", civAdj)
								strName = prefixCiv .. " " .. strName
							end
							
							if (not row.NoPrefixOrSuffix) then
								local prefixChance = g_GetRandom(1,100)
								if prefixChance <= 20 then
									local prefixDesc = "TXT_KEY_JFD_FACTION_PREFIX_" .. g_GetRandom(1,20)
									strName = g_ConvertTextKey(prefixDesc) .. " " .. strName
								end
							end
						end
					end
				end
				
				factionPartyTable[factionPartyCount] = strName
				factionPartyCount = factionPartyCount + 1
			end
		end
	end
	
	if #factionPartyTable > 0 then
		return factionPartyTable[g_GetRandom(1,#factionPartyTable)]
	end
	
	return strName
end
----------------------------------------------------------------------------------------------------------------------------
--Player:GetFactionName
function Player.GetFactionName(player, factionID)
	local playerID = player:GetID()
	local faction = GameInfo.JFD_Factions[factionID]
	local factionType = faction.Type
	return load( player, "FACTION_" .. factionType .. "_NAME" ) or g_ConvertTextKey(faction.Description)
end
----------------------------------------------------------------------------------------------------------------------------
--Player:SetFactionName
function Player.SetFactionName(player, factionID, strName)
	local playerID = player:GetID()
	local factionType = GameInfo.JFD_Factions[factionID].Type
	save( player, "FACTION_" .. factionType .. "_NAME", strName )
end
----------------------------------------------------------------------------------------------------------------------------
--Player:GetFactionCivType
function Player.GetFactionCivType(player, factionID)
	local playerID = player:GetID()
	local faction = GameInfo.JFD_Factions[factionID]
	local factionType = faction.Type
	return load( player, "FACTION_" .. factionType .. "_CIV_TYPE" ) or -1
end
----------------------------------------------------------------------------------------------------------------------------
--Player:SetFactionCivType
function Player.SetFactionCivType(player, factionID, civID)
	local playerID = player:GetID()
	local factionType = GameInfo.JFD_Factions[factionID].Type
	save( player, "FACTION_" .. factionType .. "_CIV_TYPE", civID )
end
----------------------------------------------------------------------------------------------------------------------------
--Game_GetFactionSupportTT
function Game_GetFactionSupportTT(factionID)
	local faction = GameInfo.JFD_Factions[factionID]
	local factionType = faction.Type
	local strSupport
	
	--g_JFD_Faction_FavouredReforms_ReformTypes_Table
	local factionsTable = g_JFD_Faction_FavouredReforms_ReformTypes_Table
	local numFactions = #factionsTable
	for index = 1, numFactions do
		local row = factionsTable[index]
		if row.FactionType == factionType then
			local reformType = row.ReformType
			if reformType then
				local reform = GameInfo.JFD_Reforms[reformType]
				local reformBranch = GameInfo.JFD_ReformBranches[reform.ReformBranchType]
				if (not strSupport) then
					strSupport = g_ConvertTextKey("TXT_KEY_JFD_FACTION_OPINION_REFORMS", reform.ReformSubBranchDescription, reform.ShortDescription, reformBranch.ShortDescription)
				else
					strSupport = strSupport .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_OPINION_REFORMS", reform.ReformSubBranchDescription, reform.ShortDescription, reformBranch.ShortDescription)
				end
			end
		end
	end
	
	if strSupport then
		strSupport = g_ConvertTextKey("TXT_KEY_JFD_FACTION_FAVOURED") .. "[NEWLINE]"  .. strSupport
	end
	
	return strSupport
end
----------------------------------------------------------------------------------------------------------------------------
--Game_GetFactionOppositionTT
function Game_GetFactionOppositionTT(factionID)
	local faction = GameInfo.JFD_Factions[factionID]
	local factionType = faction.Type
	local strOpposition
	
	--g_JFD_Faction_OpposedReforms_ReformTypes_Table
	-- local factionsTable = g_JFD_Faction_OpposedReforms_ReformTypes_Table
	-- local numFactions = #factionsTable
	-- for index = 1, numFactions do
		-- local row = factionsTable[index]
		-- if row.FactionType == factionType then
			-- local reformType = row.ReformType
			-- if reformType then
				-- local reform = GameInfo.JFD_Reforms[reformType]
				-- local reformBranch = GameInfo.JFD_ReformBranches[reform.ReformBranchType]
				-- if (not strOpposition) then
					-- strOpposition = g_ConvertTextKey("TXT_KEY_JFD_FACTION_OPINION_REFORMS", reform.ReformSubBranchDescription, reform.ShortDescription, reformBranch.ShortDescription)
				-- else
					-- strOpposition = strOpposition .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_OPINION_REFORMS_OPPOSED", reform.ReformSubBranchDescription, reform.ShortDescription, reformBranch.ShortDescription)
				-- end
			-- end
		-- end
	-- end
	
	-- if strOpposition then
	strOpposition = g_ConvertTextKey("TXT_KEY_JFD_FACTION_OPPOSED") .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_OPINION_REFORMS_OPPOSED")
	-- end
	
	return strOpposition
end
----------------------------------------------------------------------------------------------------------------------------
--Player:GetFactionHelp
function Player.GetFactionHelp(player, factionID, factionName, factionPower)
	local faction = GameInfo.JFD_Factions[factionID]
	local factionType = faction.Type
	local strFactionHelp = g_ConvertTextKey(faction.Help, factionName, factionPower)	
	return strFactionHelp
end
----------------------------------------------------------------------------------------------------------------------------
--Player:IsFactionValid
function Player.IsFactionValid(player, factionID, governmentID, isViewing)	
	local playerTeam = Teams[player:GetTeam()]
	local governmentID = governmentID or player:GetCurrentGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local governmentType = government.Type
	
	local isFactionValid = true
	
	--g_JFD_Factions_Table
	local factionsTable = g_JFD_Factions_Table
	local numFactions = #factionsTable
	for index = 1, numFactions do
		local row = factionsTable[index]
		local thisFactionID = row.ID
		if thisFactionID == factionID then
			local prereqGovernment = row.PrereqGovernment
			local prereqGovernmentOR = row.PrereqGovernmentOR
			local prereqGovernmentNOT = row.PrereqGovernmentNOT
			local prereqReform = row.PrereqReform
			local prereqReformOR = row.PrereqReformOR
			local prereqReformID = GameInfoTypes[prereqReform]
			local prereqReformORID = GameInfoTypes[prereqReformOR]
			local prereqIdeology = row.PrereqIdeology
			local prereqIdeologyID = GameInfoTypes[prereqIdeology]
			
			if (prereqGovernment and prereqGovernment ~= governmentType) then
				isFactionValid = false
			end
			
			if row.IsValidNotSpecial then
				if government.IsSpecial then
					return false
				end
			end
			
			if row.IsPapalFollower then
				isFactionValid = false
				if (governmentID ~= governmentPapacyID and player:GetReligionCreatedByPlayer() <= 0) then
					local playerPopeID, playerPopeReligionID = Game_GetPapacyFounder()
					if playerPopeID > -1 and playerPopeReligionID > -1 then
						local playerPope = Players[playerPopeID]
						local teamPopeID = playerPope:GetTeam()
						local teamPope = Teams[teamPopeID]
						if (playerTeam:IsHasMet(teamPopeID) and (not playerTeam:IsAtWar(teamPopeID))) then
							local religionID = player:GetMainReligion()
							if religionID == playerPopeReligionID then
								isFactionValid = true
							end
						end
					end	
				end
			end
			
			if (prereqGovernmentOR and prereqGovernmentOR ~= governmentType) then
				isFactionValid = false
			end
			
			if (prereqGovernmentNOT and prereqGovernmentNOT == governmentType) then
				isFactionValid = false
			end
			
			if isViewing then
				if (prereqReform and prereqReform ~= "REFORM_JFD_FACTIONS_INTERESTS") then
					isFactionValid = false
				end
			
				if prereqIdeology and (not prereqIdeologyID) then
					isFactionValid = false
				end
			else
				if (prereqReform and (not player:HasReform(prereqReformID))) then
					if (prereqReformOR and (not player:HasReform(prereqReformORID))) or (not prereqReformOR) then
						isFactionValid = false
					end
				end
			
				local ideologyID = player:GetIdeology()
				if prereqIdeology and ideologyID ~= prereqIdeologyID then
					isFactionValid = false
				elseif prereqIdeology and (not prereqIdeologyID) then
					isFactionValid = false
				end
			end
		end
	end
		
	return isFactionValid
end
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Faction_Criteria_Table
local g_JFD_Faction_Criteria_Table = {}
local g_JFD_Faction_Criteria_Count = 1
for row in DB.Query("SELECT * FROM JFD_Faction_Criteria;") do 	
	g_JFD_Faction_Criteria_Table[g_JFD_Faction_Criteria_Count] = row
	g_JFD_Faction_Criteria_Count = g_JFD_Faction_Criteria_Count + 1
end

--g_JFD_Faction_CriteriaPartyYields_Table
local g_JFD_Faction_CriteriaPartyYields_Table = {}
local g_JFD_Faction_CriteriaPartyYields_Count = 1
for row in DB.Query("SELECT * FROM JFD_Faction_CriteriaPartyYields;") do 	
	g_JFD_Faction_CriteriaPartyYields_Table[g_JFD_Faction_CriteriaPartyYields_Count] = row
	g_JFD_Faction_CriteriaPartyYields_Count = g_JFD_Faction_CriteriaPartyYields_Count + 1
end

--g_Building_DomainFreeExperiences_Table
local g_Building_DomainFreeExperiences_Table = {}
local g_Building_DomainFreeExperiences_Count = 1
for row in DB.Query("SELECT * FROM Building_DomainFreeExperiences WHERE DomainType = 'DOMAIN_LAND';") do 	
	g_Building_DomainFreeExperiences_Table[g_Building_DomainFreeExperiences_Count] = row
	g_Building_DomainFreeExperiences_Count = g_Building_DomainFreeExperiences_Count + 1
end

--g_Belief_BuildingClassFaithPurchase_Table
local g_Belief_BuildingClassFaithPurchase_Table = {}
local g_Belief_BuildingClassFaithPurchase_Count = 1
for row in DB.Query("SELECT * FROM Belief_BuildingClassFaithPurchase WHERE BuildingClassType IN (SELECT Type FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE FaithCost > 0 AND Cost <= 0));") do 	
	g_Belief_BuildingClassFaithPurchase_Table[g_Belief_BuildingClassFaithPurchase_Count] = row
	g_Belief_BuildingClassFaithPurchase_Count = g_Belief_BuildingClassFaithPurchase_Count + 1
end

--Player:ComposeNewLegislature
local domainAirID = GameInfoTypes["DOMAIN_AIR"]
local domainLandID = GameInfoTypes["DOMAIN_LAND"]
local domainSeaID = GameInfoTypes["DOMAIN_SEA"]
local unitClassGreatAdmiralID = GameInfoTypes["UNITCLASS_GREAT_ADMIRAL"]
local unitClassGreatGeneralID = GameInfoTypes["UNITCLASS_GREAT_GENERAL"]
local yieldFoodID = GameInfoTypes["YIELD_FOOD"]
local yieldGoldenAgePointsID = GameInfoTypes["YIELD_GOLDEN_AGE_POINTS"]

function Player.ComposeNewLegislature(player, governmentID)
	if (not player:IsAlive()) then return end
	local playerID = player:GetID()
	local playerIsHuman = (player:IsHuman() and player:IsTurnActive())
	local playerTeam = Teams[player:GetTeam()]
	local playerCapital = player:GetCapitalCity()
	
	-- print("Compose new Legislature", debug.traceback())
	
	local numFactionSovMod = Player_GetFactionSovModifier(player)
	local numCities = player:GetNumCities()
	local numTotalPopulation = player:GetTotalPopulation()
	local numMilitaryUnits = player:GetNumMilitaryUnits()
	local numCapitalPopulation = playerCapital:GetPopulation()
	local numTotal = 0
	local numCityTotal = 0
	local strNewFactionCityResult = {}
	local strNewFactionNationalResult = {}
	
	local newFactionTable = {}
	local revFactionTable = {}
	
	--g_JFD_Factions_Table
	local factionsTable = g_JFD_Factions_Table
	local numFactions = #factionsTable
	for index = 1, numFactions do
		local row = factionsTable[index]
		local thisFactionID = row.ID
		player:SetFactionPower(thisFactionID, 0)
		newFactionTable[thisFactionID] = {FactionID = thisFactionID, Power = 0, CityList = {}}
	end
	--g_JFD_FactionsRevolutionaries_Table
	local factionsTable = g_JFD_FactionsRevolutionaries_Table
	local numFactions = #factionsTable
	for index = 1, numFactions do
		local row = factionsTable[index]
		local thisFactionID = row.ID
		player:SetFactionPower(thisFactionID, 0)
		revFactionTable[thisFactionID] = {FactionID = thisFactionID, Power = 0, CityList = {}}
	end
	
	--FACTIONS
	local cityCount = 1
	--g_JFD_Factions_Table
	local factionsTable = g_JFD_Factions_Table
	local numFactions = #factionsTable
	for index = 1, numFactions do
		local row = factionsTable[index]
		local thisFactionID = row.ID
		
		if player:IsFactionValid(thisFactionID) then
		
			--g_JFD_Faction_Criteria_Table
			local factionsCriteriaTable = g_JFD_Faction_Criteria_Table
			local numFactionsCriteria = #factionsCriteriaTable
			for index = 1, numFactionsCriteria do
				local row2 = factionsCriteriaTable[index]
				local factionType = row2.FactionType
				local factionID = GameInfoTypes[factionType]
				if factionID == thisFactionID then
					if row2.IsDictatorship then
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + 1
						numTotal = numTotal + 1
					end
					
					if row2.IsOtherCivHighestYield then
						local playerPopeID, playerPopeReligionID = Game_GetPapacyFounder()
						local playerFollowerID = -1
						local playerNumYield = 0
						for otherPlayerID = 0, defineMaxMajorCivs - 1 do
							local otherPlayer = Players[otherPlayerID]
							if otherPlayer:IsAlive() and playerTeam:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:GetCapitalCity() then
								local religionID = otherPlayer:GetMainReligion()
								if religionID == playerPopeReligionID then
									local highestYieldType = row2.IsOtherCivHighestYieldType
									local highestYieldID = GameInfoTypes[highestYieldType]
									local thisPlayerNumYield = otherPlayer:CalculateTotalYield(highestYieldID)
									if highestYieldType == "YIELD_CULTURE" then
										thisPlayerNumYield = otherPlayer:GetTotalJONSCulturePerTurn()
									end
									if thisPlayerNumYield > playerNumYield then
										playerFollowerID = otherPlayerID
										playerNumYield = thisPlayerNumYield
									end
								end
							end
						end
						if playerFollowerID > -1 then
							local playerFollower = Players[playerFollowerID]
							local numYield = playerFollower:GetTotalFaithPerTurn()
							newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numYield
							newFactionTable[thisFactionID].PlayerID = playerFollowerID
							numTotal = numTotal + numYield
						end
					end
					
					local otherFaction = row2.IsOtherFactionPower
					if otherFaction then
						local playerPopeID = Game_GetPapacyFounder()
						local otherFactionID = GameInfoTypes[otherFaction]
						local numPower = Players[playerPopeID]:GetFactionPower(otherFactionID)
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numPower
						numTotal = numTotal + numPower
					end
					
					if row2.IsNumCapitalPopulation then
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numCapitalPopulation
						numTotal = numTotal + numCapitalPopulation
					end
					
					if row2.IsNumActiveTradeRoutes then
						local numTradeRoutes = (#player:GetTradeRoutes()*numCapitalPopulation)
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numTradeRoutes
						numTotal = numTotal + numTradeRoutes
					end
					
					if row2.IsNumActiveWars then
						local numWars = (playerTeam:GetAtWarCount()*numCapitalPopulation)
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numWars
						numTotal = numTotal + numWars
					end
					
					if row2.IsNumCityStateFriends then
						local numFriends = (player:GetNumCityStatePartners()*numCapitalPopulation)
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numFriends
						numTotal = numTotal + numFriends
					end
					
					local numBuildingType = row2.IsNumBuildingType
					if numBuildingType then
						local buildingClassID = GameInfoTypes[numBuildingType]
						local numBuilding = (player:GetBuildingClassCountPlusMaking(buildingClassID)*numCapitalPopulation)
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numBuilding
						numTotal = numTotal + numBuilding
					end
					
					if row2.IsNumReligiousFollowers then
						local religionID = player:GetMainReligion()
						local numFollowers, numNotFollowers, numNoneFollowers = player:GetNumTotalFollowers(religionID)
					
						if row2.IsNumOwnReligiousFollowers then
							newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numFollowers
							numTotal = numTotal + numFollowers
						end
					
						if row2.IsNumOtherReligiousFollowers then
							newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numNotFollowers
							numTotal = numTotal + numNotFollowers
						end
						
						if row2.IsNumNonReligiousFollowers then
							newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numNoneFollowers
							numTotal = numTotal + numNoneFollowers
						end
					end
					
					if row2.IsNumCombatUnits then
						local numUnits = 0
						for unit in player:Units() do
							if unit:IsCombatUnit() then
								numUnits = numUnits + unit:GetLevel()
							end
						end
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numUnits
						numTotal = numTotal + numUnits
					end
					
					if row2.IsLargestOfCityStateAllies then
						local largestMinors = {}
						for otherPlayerID = 0, defineMaxCivPlayers - 1 do	
							local otherPlayer = Players[otherPlayerID]
							if otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and playerTeam:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:IsAllies(playerID) and otherPlayer:GetCapitalCity() then
								local minorTraitID = otherPlayer:GetMinorCivTrait()
								local minorTraitType = GameInfo.MinorCivTraits[minorTraitID].Type
								largestMinors[minorTraitID] = {MinorID = -1, NumPop = 0}
								if row2.MinorCivTraitType == minorTraitType then
									local numPop = otherPlayer:GetTotalPopulation()
									if numPop > largestMinors[minorTraitID].NumPop then
										largestMinors[minorTraitID].MinorID = otherPlayerID
										largestMinors[minorTraitID].NumPop = numPop
									end
								end
							end
						end	
						for _, thisMinor in pairs(largestMinors) do
							if thisMinor.MinorID ~= -1 then
								newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + thisMinor.NumPop
								newFactionTable[thisFactionID].PlayerID = thisMinor.MinorID
								numTotal = numTotal + thisMinor.NumPop
							end
						end
					end
					
					if row2.IsGoldenAge then
						local numPower = player:GetHappiness()
						if (not player:IsGoldenAge()) then
							numPower = 0
						end
						newFactionTable[thisFactionID].Power = numPower
						numTotal = numTotal + numPower
					end
					if row2.IsNotGoldenAge then
						local numPower = player:GetHappiness()
						if player:IsGoldenAge() then
							numPower = 0
						end
						newFactionTable[thisFactionID].Power = numPower
						numTotal = numTotal + numPower
					end
					
					if row2.IsGlobalFaith then
						local numFaith = player:GetTotalFaithPerTurn()
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numFaith
						numTotal = numTotal + numFaith
					end
					
					if row2.IsGlobalTourism then
						local numTourism = player:GetTourism()
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numTourism
						numTotal = numTotal + numTourism
					end
					
					if row2.IsGlobalYieldTypeProportion then
						local yieldType = row2.YieldType
						local numYield = 0
						if yieldType then
							local yieldID = GameInfoTypes[row2.YieldType]
							numYield = player:CalculateTotalYield(yieldID)
						end
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + g_MathMax(numYield,0)
						numTotal = numTotal + numYield
					end
					
					if row2.IsCapitalYieldTypeProportion then	
						local yieldType = row2.YieldType
						local numYield = 0
						if yieldType then
							local yieldID = GameInfoTypes[row2.YieldType]
							if yieldType == "YIELD_CULTURE" then
								numYield = playerCapital:GetBaseJONSCulturePerTurn()
							elseif yieldType == "YIELD_EXPERIENCE" then
								numYield = playerCapital:GetDomainFreeExperience(domainLandID)
							elseif yieldType == "YIELD_HAPPINESS" then
								numYield = playerCapital:GetHappiness() + playerCapital:GetLocalHappiness()
							elseif yieldType == "YIELD_FOOD_LOSS" then
								numYield = g_MathMin(playerCapital:FoodDifference(), 0)
							elseif yieldType == "YIELD_FOOD_CON" then
								numYield = playerCapital:FoodConsumption()
							elseif yieldType == "YIELD_FOOD_DIFF" then
								numYield = playerCapital:FoodDifference()
							else
								numYield = playerCapital:GetBaseYieldRate(yieldID)
							end
							if (yieldType == "YIELD_FOOD" or yieldType == "YIELD_FOOD_CON" or yieldType == "YIELD_HAPPINESS" or yieldType == "YIELD_FOOD_DIFF" or yieldType == "YIELD_FOOD_LOSS") then
								numYield = (numYield*numTotalPopulation)
							elseif yieldType == "YIELD_EXPERIENCE" then
								numYield = (numYield*numMilitaryUnits)
							else
								numYield = (numYield*numCapitalPopulation)
							end
						end
						
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + g_MathMax(numYield,0)
						numTotal = numTotal + numYield
					end
					
					if row2.IsCityYieldProportion then	
						local yieldType = row2.YieldType
						local yieldID = GameInfoTypes[yieldType]
						local totalYield = 0
							
						for city in player:Cities() do
							local numPop = city:GetPopulation()
                            local cityYield = 0
							if yieldType then
								if yieldType == "YIELD_CULTURE" then
									cityYield = city:GetBaseJONSCulturePerTurn() 
								elseif yieldType == "YIELD_TOURISM" then
									cityYield = city:GetBaseTourism()/100
								elseif yieldType == "YIELD_HAPPINESS" then
									cityYield = city:GetHappiness() + city:GetLocalHappiness()
								elseif yieldType == "YIELD_FOOD_DIFF" then
									local numFood = city:FoodDifference() 
									if numFood < 0 then numFood = numFood*-1 end
									cityYield = numFood
								elseif yieldType == "YIELD_FOOD_CON" then
									cityYield = city:FoodConsumption()
								elseif yieldType == "YIELD_EXPERIENCE" then
									cityYield = city:GetDomainFreeExperience(domainLandID)
								elseif yieldType == "YIELD_GOLDEN_AGE_POINTS" then
									if yieldGoldenAgePointsID then
										cityYield = city:GetBaseYieldRate(yieldID)
									end
								else
									cityYield = city:GetBaseYieldRate(yieldID)
								end
							end
       						cityYield = (cityYield*numPop)
										
							if playerIsHuman then
								newFactionTable[factionID].CityList[cityCount] = {City = city, NumVotes = cityYield}
								cityCount = cityCount + 1
							end

                            totalYield = totalYield + cityYield

						end
						newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + g_MathMax(totalYield,0)
						numTotal = numTotal + totalYield
					end
					
					if row2.IsCityYieldTypeHighestOf then
						-- g_JFD_Faction_CriteriaPartyYields_Table
						local factionsCriteriaTable = g_JFD_Faction_CriteriaPartyYields_Table
						local numFactionsCriteria = #factionsCriteriaTable
						for index = 1, numFactionsCriteria do
							local row3 = factionsCriteriaTable[index]
							if row3.FactionType == factionType then
								local faction1 = row3.FactionType
								local faction1ID = GameInfoTypes[faction1]
								local faction2 = row3.OpposingFactionType1
								local faction2ID = GameInfoTypes[faction2]
								local faction3 = row3.DefaultingFactionType
								local faction3ID = GameInfoTypes[faction3]
								
								local yield1ID = GameInfoTypes[row3.YieldType1]
								local yield2ID = GameInfoTypes[row3.YieldType2]
								local yield3ID = GameInfoTypes[row3.YieldType3]
								local yieldOpposing1ID = GameInfoTypes[row3.OpposingYieldType1]
								local yieldOpposing2ID = GameInfoTypes[row3.OpposingYieldType2]
								local yieldOpposing3ID = GameInfoTypes[row3.OpposingYieldType3]
									
								local numFaction1Vote = 0
								local numFaction2Vote = 0
								local numFaction3Vote = 0
								
								for city in player:Cities() do
									local numPop = city:GetPopulation()
									local numYield = (g_GetRound(city:GetBaseYieldRate(yield1ID)/1.3) + city:GetBaseYieldRate(yield2ID) + g_MathMax(city:FoodDifference(),0))*numPop
									local numYieldOpposing = (city:GetBaseJONSCulturePerTurn() + city:GetBaseYieldRate(yieldOpposing2ID) + city:GetBaseYieldRate(yieldOpposing3ID))*numPop
									
									if (numYield > numYieldOpposing) then
										numFaction1Vote = numFaction1Vote + numYield
									
										if playerIsHuman then
											newFactionTable[faction1ID].CityList[cityCount] = {City = city, NumVotes = numYield}
											cityCount = cityCount + 1
										end
									elseif (numYieldOpposing > numYield) then
										numFaction2Vote = numFaction2Vote + numYieldOpposing
									
										if playerIsHuman then
											newFactionTable[faction2ID].CityList[cityCount] = {City = city, NumVotes = numYieldOpposing}
											cityCount = cityCount + 1
										end
									else
										numYield = numYield + numYieldOpposing
										numFaction3Vote = numFaction3Vote + numYield 
									
										if playerIsHuman then
											newFactionTable[faction3ID].CityList[cityCount] = {City = city, NumVotes = numYield}
											cityCount = cityCount + 1
										end
									end
								end
								
								newFactionTable[faction1ID].Power = (newFactionTable[faction1ID].Power or 0) + numFaction1Vote
								newFactionTable[faction2ID].Power = (newFactionTable[faction2ID].Power or 0) + numFaction2Vote
								newFactionTable[faction3ID].Power = (newFactionTable[faction3ID].Power or 0) + numFaction3Vote

								numTotal = numTotal + numFaction1Vote + numFaction2Vote + numFaction3Vote
							end
						end
					end
					
					local policyBranchType = row2.PolicyBranchType
					if policyBranchType then
						local policyBranchXPercentBonus = row2.IsPolicyBranchXPercentBonus
						if policyBranchXPercentBonus ~= 0 then
							local numPower = (newFactionTable[thisFactionID].Power or 0)
							local numBonus = 0
							local numBranchesMod = (player:GetNumPoliciesUnlockedInBranch(policyBranchType)*policyBranchXPercentBonus)
							if numBranchesMod > 0 then
								numBonus = ((numPower*numBranchesMod)/100)
							end
							newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numBonus
							numTotal = numTotal + numBonus
						else
							local numBranches = player:GetNumPoliciesUnlockedInBranch(policyBranchType) 
							newFactionTable[thisFactionID].Power = (newFactionTable[thisFactionID].Power or 0) + numBranches
							numTotal = numTotal + numBranches
						end
					end
					
					local buildingNegates = row2.IsBuildingNegatesPower
					if buildingNegates then
						local buildingClassID = GameInfoTypes[buildingNegates]
						if player:GetBuildingClassCount(buildingClassID) > 0 then
							numTotal = numTotal - newFactionTable[thisFactionID].Power
							newFactionTable[thisFactionID].Power = 0
						end
					end
				end
			end
		end
	end
	
	local strLegislature = ""
	
	table.sort(newFactionTable, function(a,b) return a.Power > b.Power end)
	
	local numDominantFactions = 0
	for _, thisFaction in pairs(newFactionTable) do
		local factionID = thisFaction.FactionID
		local faction = GameInfo.JFD_Factions[factionID]
		local factionType = faction.Type
		local factionPower = thisFaction.Power
		local factionPowerDivided = faction.PowerDividedByX
		local factionPowerIsTotal = thisFaction.PowerIsTotal
		local factionPlayerID = thisFaction.PlayerID
		
		if (factionPower > 0 or thisFaction.PlayerID) then
			if (not factionPowerIsTotal) then
				if numDominantFactions == 0 then
					if numFactionSovMod ~= 0 then
						local factionPowerBonus = g_GetRound((factionPower*numFactionSovMod)/100)
						factionPower = factionPower + factionPowerBonus
						numTotal = numTotal+factionPowerBonus
					end
					numDominantFactions = 1
				end
			end

			if factionPowerDivided > 0 then
                local factionPowerToRemove = factionPower - g_GetRound(factionPower/factionPowerDivided)
				factionPower = g_GetRound(factionPower/factionPowerDivided)
                numTotal = numTotal - factionPowerToRemove
			end	
			local numPercent = factionPower
			if (not factionPowerIsTotal) then
				numPercent = g_GetRound((factionPower/numTotal)*100)	
			end

			player:SetFactionPower(factionID, numPercent)
			local strFactionName = player:GetIntendedFactionName(factionID, governmentID, factionPlayerID)
			player:SetFactionName(factionID, strFactionName)
			if factionPlayerID then
				player:SetFactionCivType(factionID, factionPlayerID)
			end
			
			if numPercent > 0 then
				if playerIsHuman and factionID > -1 then
					local faction = GameInfo.JFD_Factions[factionID]
					local factionDesc = player:GetFactionName(factionID)
					strLegislature = strLegislature .. "[NEWLINE][ICON_BULLET]" .. faction.IconString .. " " .. g_ConvertTextKey(factionDesc) .. ": [COLOR_JFD_SOVEREIGNTY]" .. numPercent .. "%[ENDCOLOR][ICON_JFD_SOVEREIGNTY]"

					local numGlobalPercent = numPercent
					for _, cityList in pairs(thisFaction.CityList) do
						local city = cityList.City
						local numVotes = cityList.NumVotes
						local numCityPercent = g_MathMin(g_GetRound((numVotes/numTotal)*100),100)
						if numCityPercent > 0 then
							if strNewFactionCityResult[factionID] then
								strNewFactionCityResult[factionID] = strNewFactionCityResult[factionID] .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_NOTIFICATION_NEW_LEGISLATURE_TEXT_CITY_RESULT_TT", city:GetName(), faction.IconString, faction.Adjective, numCityPercent)
							else
								strNewFactionCityResult[factionID] = g_ConvertTextKey("TXT_KEY_JFD_NOTIFICATION_NEW_LEGISLATURE_TEXT_CITY_RESULT_TT", city:GetName(), faction.IconString, faction.Adjective, numCityPercent)
							end
						end
					end
				end
			end
		end
	end

	--REVOLUTIONARIES
	--g_JFD_FactionsRevolutionaries_Table
	local factionsTable = g_JFD_FactionsRevolutionaries_Table
	local numFactions = #factionsTable
	for index = 1, numFactions do
		local row = factionsTable[index]
		local thisFactionID = row.ID
		
		if player:IsFactionValid(thisFactionID) then
		
			--g_JFD_Faction_Criteria_Table
			local factionsCriteriaTable = g_JFD_Faction_Criteria_Table
			local numFactionsCriteria = #factionsCriteriaTable
			for index = 1, numFactionsCriteria do
				local row2 = factionsCriteriaTable[index]
				local factionType = row2.FactionType
				local factionID = GameInfoTypes[factionType]
				if factionID == thisFactionID then
					if row2.IsRevolutionaries then
						local numRevolutionarySentiment = g_MathFloor(player:GetTotalRevolutionarySentiment())
						revFactionTable[thisFactionID].Power = numRevolutionarySentiment
						revFactionTable[thisFactionID].PowerIsTotal = true
					end
					
					local buildingNegates = row2.IsBuildingNegatesPower
					if buildingNegates then
						local buildingClassID = GameInfoTypes[buildingNegates]
						if player:GetBuildingClassCount(buildingClassID) > 0 then
							revFactionTable[thisFactionID].Power = 0
						end
					end
				end
			end
		end
	end
	
	for _, thisFaction in pairs(revFactionTable) do
		local factionID = thisFaction.FactionID
		local faction = GameInfo.JFD_Factions[factionID]
		local factionType = faction.Type
		local factionPower = thisFaction.Power
		local factionPowerIsTotal = thisFaction.PowerIsTotal
		local factionPlayerID = thisFaction.PlayerID
		
		if (factionPower > 0 or thisFaction.PlayerID) then
			local numPercent = factionPower
			player:SetFactionPower(factionID, numPercent)
			local strFactionName = player:GetIntendedFactionName(factionID, governmentID, factionPlayerID)
			player:SetFactionName(factionID, strFactionName)
			
			if numPercent > 0 then
				if playerIsHuman then
					local faction = GameInfo.JFD_Factions[factionID]
					local factionDesc = player:GetFactionName(factionID)
					strLegislature = strLegislature .. "[NEWLINE][ICON_BULLET]" .. faction.IconString .. " " .. g_ConvertTextKey(factionDesc) .. ": [COLOR_JFD_SOVEREIGNTY]" .. numPercent .. "%[ENDCOLOR][ICON_JFD_SOVEREIGNTY]"
				end
			end
		end
	end
	
	--DOMINANT FACTION
	local factionDominantID = player:GetDominantFaction()
	if factionDominantID > -1 then
		local factionDominant = GameInfo.JFD_Factions[factionDominantID]
		local factionName = player:GetFactionName(factionDominantID)
		local factionDesc = factionDominant.ShortDescription
		local numDominanceNumAnarchyTurns = factionDominant.DominanceNumAnarchyTurns
		if numDominanceNumAnarchyTurns > 0 then
			player:ChangeAnarchyNumTurns(numDominanceNumAnarchyTurns)
			if (not playerIsHuman) then
				player:SendWorldEvent(g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NEW_LEGISLATURE_DESC_REVOLUTIONARIES", factionDominant.ShortDescription, player:GetCivilizationAdjective()))	
			else
				Events.AudioPlay2DSound("AS2D_SOUND_JFD_ANARCHY");
				player:SendNotification("NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", g_ConvertTextKey("TXT_KEY_JFD_NOTIFICATION_NEW_LEGISLATURE_TEXT_REVOLUTIONARIES", factionDominant.ShortDescription, numDominanceNumAnarchyTurns), g_ConvertTextKey("TXT_KEY_JFD_NOTIFICATION_NEW_LEGISLATURE_SHORT_TEXT_REVOLUTIONARIES", factionDesc), false, -1, -1, governmentAnarchyID)
			end
		else
			if (not playerIsHuman) then
				if factionDominant.IsMandateOfHeavenGain then
					player:SendWorldEvent(g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NEW_LEGISLATURE_DESC_MANDATE_OF_HEAVEN", player:GetName(), player:GetCivilizationShortDescription()))	
				elseif factionDominant.IsMandateOfHeavenLoss then
					player:SendWorldEvent(g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NEW_LEGISLATURE_DESC_MANDATE_OF_HEAVEN_LOSS", player:GetName(), player:GetCivilizationShortDescription()))	
				else
					player:SendWorldEvent(g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NEW_LEGISLATURE_DESC", factionDominant.ShortDescription, player:GetCivilizationAdjective()))	
				end
			else
				LuaEvents.UI_ShowNewLegislaturePopup(playerID, governmentID, strLegislature, strNewFactionCityResult, (#strNewFactionCityResult > 0))
				if factionDominant.IsMandateOfHeavenGain then
					player:SendNotification("NOTIFICATION_JFD_GOVERNMENT_LEGISLATURE", g_ConvertTextKey("TXT_KEY_JFD_NOTIFICATION_NEW_LEGISLATURE_TEXT_MANDATE_OF_HEAVEN"), g_ConvertTextKey("TXT_KEY_JFD_NOTIFICATION_NEW_LEGISLATURE_SHORT_TEXT_MANDATE_OF_HEAVEN"), false, -1, -1)
				elseif factionDominant.IsMandateOfHeavenLoss then
					player:SendNotification("NOTIFICATION_JFD_GOVERNMENT_LEGISLATURE", g_ConvertTextKey("TXT_KEY_JFD_NOTIFICATION_NEW_LEGISLATURE_TEXT_MANDATE_OF_HEAVEN_LOSS", numDominanceNumAnarchyTurns), g_ConvertTextKey("TXT_KEY_JFD_NOTIFICATION_NEW_LEGISLATURE_SHORT_TEXT_MANDATE_OF_HEAVEN_LOSS"), false, -1, -1)
				else
					player:SendNotification("NOTIFICATION_JFD_GOVERNMENT_LEGISLATURE", g_ConvertTextKey("TXT_KEY_JFD_NOTIFICATION_NEW_LEGISLATURE_TEXT", factionDominant.ShortDescription), g_ConvertTextKey("TXT_KEY_JFD_NOTIFICATION_NEW_LEGISLATURE_SHORT_TEXT", factionDesc), false, -1, -1)
				end
			end
		end
	end
	
	LuaEvents.JFD_LegislatureComposed(playerID, governmentID)
end
----------------------------------------------------------------------------------------------------------------------------
--Game_GetPapacyFounder
function Game_GetPapacyFounder()
	for playerID = 0, defineMaxMajorCivs - 1 do
		local player = Players[playerID]
		if player:IsAlive() then
			if player:GetCurrentGovernment() == governmentPapacyID then
				return playerID, player:GetReligionCreatedByPlayer()
			end
		end
	end
	return -1, -1
end
----------------------------------------------------------------------------------------------------------------------------
-- FACTION MODIFIER UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player_GetFactionSovModifier
function Player_GetFactionSovModifier(player, returnsTT)
	local numFactionSovMod = 0
	local strFactionSovMod = ""

	for index = 1, #cache.Governments do
		local government = cache.Governments[index]
		if government.FactionSovMod ~= 0 then
			if player:IsHasGovernment(government.ID) then
				numFactionSovMod = numFactionSovMod + government.FactionSovMod
				if returnsTT then
					strFactionSovMod = strFactionSovMod .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_SOV_MODIFIER_FROM_GOVERNMENT", government.FactionSovMod, "[COLOR_WARNING_TEXT]+")
				end
			end
		end
	end
			
	local numFactionSovModReforms = 0
	--g_JFD_Reforms_Table
	local reformsTable = g_JFD_Reforms_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local numThisFactionSovMod = row.FactionSovMod
		if numThisFactionSovMod ~= 0 then
			local reformID = row.ID
			if player:HasReform(reformID) then
				numFactionSovModReforms = numFactionSovModReforms + numThisFactionSovMod
			end
		end
	end
	if numFactionSovModReforms ~= 0 then
		numFactionSovMod = numFactionSovMod + numFactionSovModReforms				
		if returnsTT then
			if numFactionSovModReforms > 0 then 
				strFactionSovMod = strFactionSovMod .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_SOV_MODIFIER_FROM_REFORMS", numFactionSovModReforms, "[COLOR_WARNING_TEXT]+")
			else
				strFactionSovMod = strFactionSovMod .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_SOV_MODIFIER_FROM_REFORMS", numFactionSovModReforms, "[COLOR_POSITIVE_TEXT]")
			end
		end
	end
	
	local numFactionSovModBuildings = 0
	--g_Building_JFD_SovereigntyMods_Table
	local buildingsTable = g_Building_JFD_SovereigntyMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local numThisFactionSovMod = row.FactionSovMod
		if numThisFactionSovMod ~= 0 then
			local buildingID = GameInfoTypes[row.BuildingType]
			local buildingCount = player:CountNumBuildings(buildingID)
			if buildingCount > 0 then
				numFactionSovModBuildings = numFactionSovModBuildings + (numThisFactionSovMod*buildingCount)
			end
		end
	end
	if numFactionSovModBuildings ~= 0 then
		numFactionSovMod = numFactionSovMod + numFactionSovModBuildings				
		if returnsTT then
			if numFactionSovModBuildings > 0 then 
				strFactionSovMod = strFactionSovMod .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_SOV_MODIFIER_FROM_BUILDINGS", numFactionSovModBuildings, "[COLOR_WARNING_TEXT]+")
			else
				strFactionSovMod = strFactionSovMod .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_SOV_MODIFIER_FROM_BUILDINGS", numFactionSovModBuildings, "[COLOR_POSITIVE_TEXT]")
			end
		end
	end
				
	local numFactionSovModPolicies = 0
	--g_Policy_JFD_SovereigntyMods_Table
	local policiesTable = g_Policy_JFD_SovereigntyMods_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local numThisFactionSovMod = row.FactionSovMod
		if numThisFactionSovMod ~= 0 then
			local policyID = GameInfoTypes[row.PolicyType]
			if player:HasPolicy(policyID) then
				numFactionSovModPolicies = numFactionSovModPolicies + numThisFactionSovMod
			end
		end
	end
	if numFactionSovModPolicies ~= 0 then
		numFactionSovMod = numFactionSovMod + numFactionSovModPolicies				
		if returnsTT then
			if numFactionSovModPolicies > 0 then 
				strFactionSovMod = strFactionSovMod .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_SOV_MODIFIER_FROM_POLICIES", numFactionSovModPolicies, "[COLOR_WARNING_TEXT]+")
			else
				strFactionSovMod = strFactionSovMod .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_SOV_MODIFIER_FROM_POLICIES", numFactionSovModPolicies, "[COLOR_POSITIVE_TEXT]")
			end
		end
	end
				
	local numFactionSovModTraits = 0
	--g_Trait_JFD_SovereigntyMods_Table
	local traitsTable = g_Trait_JFD_SovereigntyMods_Table
	local numTraits = #traitsTable
	for index = 1, numTraits do
		local row = traitsTable[index]
		local numThisFactionSovMod = row.FactionSovMod
		if numThisFactionSovMod ~= 0 then
			local traitID = GameInfoTypes[row.TraitType]
			if player:HasTrait(traitID) then
				numFactionSovModTraits = numFactionSovModTraits + numThisFactionSovMod
			end
		end
	end
	if numFactionSovModTraits ~= 0 then
		numFactionSovMod = numFactionSovMod + numFactionSovModTraits				
		if returnsTT then
			if numFactionSovModTraits > 0 then 
				strFactionSovMod = strFactionSovMod .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_SOV_MODIFIER_FROM_TRAITS", numFactionSovModTraits, "[COLOR_WARNING_TEXT]+")
			else
				strFactionSovMod = strFactionSovMod .. g_ConvertTextKey("TXT_KEY_JFD_FACTION_SOV_MODIFIER_FROM_TRAITS", numFactionSovModTraits, "[COLOR_POSITIVE_TEXT]")
			end
		end
	end
	
	return numFactionSovMod, strFactionSovMod
end
----------------------------------------------------------------------------------------------------------------------------
-- LEGISLATURE UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player:ResetLegislature
function Player.ResetLegislature(player, governmentID, isMuteSound)
	if player:IsHuman() and player:IsTurnActive() then
        if (not isMuteSound) then
    		Events.AudioPlay2DSound("AS2D_SOUND_JFD_LEGISLATURE_RESET");
        end
	end
	player:ComposeNewLegislature(governmentID)
	local numGovernmentCooldown = player:CalculateGovernmentCooldown()
	player:SetCurrentGovernmentCooldown(numGovernmentCooldown) 
	player:SetGovernmentCooldownRate(defineDefaultGovernmentCooldownRate) 
end
----------------------------------------------------------------------------------------------------------------------------
--Player:GetCurrentGovernmentCooldown
function Player.GetCurrentGovernmentCooldown(player)
	return player:GetGovernmentCooldown()
end
----------------------------------------------------------------------------------------------------------------------------
--Player:ChangeCurrentGovernmentCooldown
function Player.ChangeCurrentGovernmentCooldown(player, changeVal)
	player:ChangeGovernmentCooldown(changeVal)
end
----------------------------------------------------------------------------------------------------------------------------
--Player:SetCurrentGovernmentCooldown
function Player.SetCurrentGovernmentCooldown(player, setVal)
	if setVal <= 0 then setVal = 0 end
	player:SetGovernmentCooldown(setVal)
end
----------------------------------------------------------------------------------------------------------------------------
--Player:CalculateGovernmentCooldown
function Player.CalculateGovernmentCooldown(player, returnsTT)
	local numCurrentGovernmentCooldown = player:GetCurrentGovernmentCooldown()
	local numGovernmentCooldown = defineDefaultGovernmentCooldownTurns
	local numGovernmentCooldownModTotal = 0
	local strGovernmentCooldownModTT = ""
	
	--Cities
	local numGovernmentCooldownModPerCity = (defineDefaultGovernmentCooldownTurnsModPerCity*player:GetNumCities())
	--g_Building_JFD_SovereigntyMods_Table
	local buildingsTable = g_Building_JFD_SovereigntyMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local numThisGovernmentCooldownMod = row.GovernmentCooldownModPerCity
		if numThisGovernmentCooldownMod ~= 0 then
			local buildingID = GameInfoTypes[row.BuildingType]
			local buildingCount = player:CountNumBuildings(buildingID)
			if buildingCount > 0 then
				numThisGovernmentCooldownMod = (numThisGovernmentCooldownMod*buildingCount)
				numGovernmentCooldownModPerCity = numGovernmentCooldownModPerCity + ((numGovernmentCooldownModPerCity*numThisGovernmentCooldownMod)/100)
			end
		end
	end
	numGovernmentCooldownModPerCity = g_GetRound(numGovernmentCooldownModPerCity)
	if numGovernmentCooldownModPerCity ~= 0 then
		numGovernmentCooldownModTotal = numGovernmentCooldownModTotal + numGovernmentCooldownModPerCity
		if returnsTT then
			if numGovernmentCooldownModPerCity < 0 then
				strGovernmentCooldownModTT = strGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_CITIES", "[COLOR_POSITIVE_TEXT]" .. numGovernmentCooldownModPerCity .. "%[ENDCOLOR]")
			else
				strGovernmentCooldownModTT = strGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_CITIES", "[COLOR_WARNING_TEXT]+" .. numGovernmentCooldownModPerCity .. "%[ENDCOLOR]")
			end
		end
	end
	
	--Citizens
	local numGovernmentCooldownModPerCitizen = (defineDefaultGovernmentCooldownTurnsModPerCitizen*player:GetTotalPopulation())
	--g_Building_JFD_SovereigntyMods_Table
	local buildingsTable = g_Building_JFD_SovereigntyMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local numThisGovernmentCooldownMod = row.GovernmentCooldownModPerCitizen
		if numThisGovernmentCooldownMod ~= 0 then
			local buildingID = GameInfoTypes[row.BuildingType]
			local buildingCount = player:CountNumBuildings(buildingID)
			if buildingCount > 0 then
				numThisGovernmentCooldownMod = (numThisGovernmentCooldownMod*buildingCount)
				numGovernmentCooldownModPerCitizen = numGovernmentCooldownModPerCitizen + ((numGovernmentCooldownModPerCitizen*numThisGovernmentCooldownMod)/100)
			end
		end
	end
	numGovernmentCooldownModPerCitizen = g_GetRound(numGovernmentCooldownModPerCitizen)
	if numGovernmentCooldownModPerCitizen ~= 0 then
		numGovernmentCooldownModTotal = numGovernmentCooldownModTotal + numGovernmentCooldownModPerCitizen
		if returnsTT then
			if numGovernmentCooldownModPerCitizen < 0 then
				strGovernmentCooldownModTT = strGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_CITIZENS", "[COLOR_POSITIVE_TEXT]" .. numGovernmentCooldownModPerCitizen .. "%[ENDCOLOR]")
			else
				strGovernmentCooldownModTT = strGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_CITIZENS", "[COLOR_WARNING_TEXT]+" .. numGovernmentCooldownModPerCitizen .. "%[ENDCOLOR]")
			end
		end
	end
	
	local strGovernmentCooldownTT = ""
	local numGovernmentCooldownMod, strNumGovernmentCooldownModTT = Player_GetGovernmentCooldownModifier(player, returnsTT)
	if numGovernmentCooldownMod ~= 0 then
		numGovernmentCooldownModTotal = numGovernmentCooldownModTotal + numGovernmentCooldownMod
	end
	
	if numGovernmentCooldownModTotal ~= 0 then
		if numGovernmentCooldownModTotal > 0 then
			numGovernmentCooldownModTotal = g_MathMin(numGovernmentCooldownModTotal, defineDefaultGovernmentCooldownModCap)
		else
			numGovernmentCooldownModTotal = g_MathMax(numGovernmentCooldownModTotal, (defineDefaultGovernmentCooldownModCap*-1))
		end
		numGovernmentCooldown = numGovernmentCooldown + ((numGovernmentCooldown*numGovernmentCooldownModTotal)/100)
	end
	numGovernmentCooldown = g_GetRound(numGovernmentCooldown)
	
	if returnsTT then
		strGovernmentCooldownTT = g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_GOVERNMENT_COOLDOWN_TT", numCurrentGovernmentCooldown, numGovernmentCooldown)
		if strNumGovernmentCooldownModTT then
			if strGovernmentCooldownModTT ~= "" then
				strGovernmentCooldownTT = strGovernmentCooldownTT .. strGovernmentCooldownModTT .. strNumGovernmentCooldownModTT
			else
				strGovernmentCooldownTT = strGovernmentCooldownTT .. strNumGovernmentCooldownModTT
			end
		end
	end

	return numGovernmentCooldown, numCurrentGovernmentCooldown, strGovernmentCooldownTT
end
----------------------------------------------------------------------------------------------------------------------------
-- LEGISLATURE MODIFIER UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player_GetGovernmentCooldownModifier
function Player_GetGovernmentCooldownModifier(player, returnsTT)
	local numGovernmentCooldownMod = 0
	local strNumGovernmentCooldownModTT = ""	

    for index = 1, #cache.Governments do
		local government = cache.Governments[index]
		if government.GovernmentCooldownMod ~= 0 then
			if player:IsHasGovernment(government.ID) then
				numGovernmentCooldownMod = numGovernmentCooldownMod + government.GovernmentCooldownMod
				if returnsTT then
					if government.GovernmentCooldownMod > 0 then
						strNumGovernmentCooldownModTT = strNumGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_GOVERNMENT", "[COLOR_WARNING_TEXT]+" .. government.GovernmentCooldownMod .. "%[ENDCOLOR]")
					else
						strNumGovernmentCooldownModTT = strNumGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_GOVERNMENT", "[COLOR_POSITIVE_TEXT]" .. government.GovernmentCooldownMod .. "%[ENDCOLOR]")
					end
				end
			end
		end
	end
			
	for index = 1, #cache.Reforms do
		local reform = cache.Reforms[index]
		if reform.GovernmentCooldownMod ~= 0 then
			if player:HasReform(reform.ID) then
				numGovernmentCooldownMod = numGovernmentCooldownMod + reform.GovernmentCooldownMod
				if returnsTT then
					if reform.GovernmentCooldownMod > 0 then
						strNumGovernmentCooldownModTT = strNumGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_REFORMS", "[COLOR_WARNING_TEXT]+" .. reform.GovernmentCooldownMod .. "%[ENDCOLOR]")
					else
						strNumGovernmentCooldownModTT = strNumGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_REFORMS", "[COLOR_POSITIVE_TEXT]" .. reform.GovernmentCooldownMod .. "%[ENDCOLOR]")
					end
				end
			end
		end
	end
	
	--g_Building_JFD_SovereigntyMods_Table
	local buildingsTable = g_Building_JFD_SovereigntyMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local numThisGovernmentCooldownMod = row.GovernmentCooldownMod
		if numThisGovernmentCooldownMod ~= 0 then
			local buildingID = GameInfoTypes[row.BuildingType]
			local buildingCount = player:CountNumBuildings(buildingID)
			if buildingCount > 0 then
				numThisGovernmentCooldownMod = (numThisGovernmentCooldownMod*buildingCount)
				numGovernmentCooldownMod = numGovernmentCooldownMod + numThisGovernmentCooldownMod
				if returnsTT then
					if numThisGovernmentCooldownMod > 0 then
						strNumGovernmentCooldownModTT = strNumGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_BUILDINGS", "[COLOR_WARNING_TEXT]+" .. numThisGovernmentCooldownMod .. "%[ENDCOLOR]")
					else
						strNumGovernmentCooldownModTT = strNumGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_BUILDINGS", "[COLOR_POSITIVE_TEXT]" .. numThisGovernmentCooldownMod .. "%[ENDCOLOR]")
					end
				end
			end
		end
	end
			
	--g_Policy_JFD_SovereigntyMods_Table
	local policiesTable = g_Policy_JFD_SovereigntyMods_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local numThisGovernmentCooldownMod = row.GovernmentCooldownMod
		if numThisGovernmentCooldownMod ~= 0 then
			local policyID = GameInfoTypes[row.PolicyType]
			if player:HasPolicy(policyID) then
				numGovernmentCooldownMod = numGovernmentCooldownMod + numThisGovernmentCooldownMod
				if returnsTT then
					if numThisGovernmentCooldownMod > 0 then
						strNumGovernmentCooldownModTT = strNumGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_POLICIES", "[COLOR_WARNING_TEXT]+" .. numThisGovernmentCooldownMod .. "%[ENDCOLOR]")
					else
						strNumGovernmentCooldownModTT = strNumGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_POLICIES", "[COLOR_POSITIVE_TEXT]" .. numThisGovernmentCooldownMod .. "%[ENDCOLOR]")
					end
				end
			end
		end
	end
			
	--g_Trait_JFD_SovereigntyMods_Table
	local traitsTable = g_Trait_JFD_SovereigntyMods_Table
	local numTraits = #traitsTable
	for index = 1, numTraits do
		local row = traitsTable[index]
		local numThisGovernmentCooldownMod = row.GovernmentCooldownMod
		if numThisGovernmentCooldownMod ~= 0 then
			local traitID = GameInfoTypes[row.TraitType]
			if player:HasTrait(traitID) then
				numGovernmentCooldownMod = numGovernmentCooldownMod + numThisGovernmentCooldownMod
				if returnsTT then
					if numThisGovernmentCooldownMod > 0 then
						strNumGovernmentCooldownModTT = strNumGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_TRAITS", "[COLOR_WARNING_TEXT]+" .. numThisGovernmentCooldownMod .. "%[ENDCOLOR]")
					else
						strNumGovernmentCooldownModTT = strNumGovernmentCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_COOLDOWN_TT_FROM_TRAITS", "[COLOR_POSITIVE_TEXT]" .. numThisGovernmentCooldownMod .. "%[ENDCOLOR]")
					end
				end
			end
		end
	end

	return numGovernmentCooldownMod, strNumGovernmentCooldownModTT
end
--==========================================================================================================================
-- REFORM UTILS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- REFORM UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player:HasReform
function Player.HasReform(player, reformID)
	if (not reformID) then 
        print("reformID is nil!") 
        return 
    end
	if reformID ~= -1 then
		local reform = GameInfo.JFD_Reforms[reformID]
		local policyID = GameInfoTypes[reform.PolicyType]
		return player:HasPolicy(policyID)
	end
end
----------------------------------------------------------------------------------------------------------------------------
--Player:GetNumReforms
function Player.GetNumReforms(player, isAligned)
	local numPassedReforms = 0
	
	local reformsTable = g_JFD_Reforms_Table
	if isAligned then
		--g_JFD_Reforms_Table
		reformsTable = g_JFD_ReformsLeftRight_Table
	end
	
	--g_JFD_Reforms_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local reformID = row.ID
		if player:HasReform(reformID) then
			numPassedReforms = numPassedReforms + 1
		end
	end

	return numPassedReforms
end
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Reform_Negates_Table
local g_JFD_Reform_Negates_Table = {}
local g_JFD_Reform_Negates_Count = 1
for row in DB.Query("SELECT * FROM JFD_Reform_Negates;") do 	
	g_JFD_Reform_Negates_Table[g_JFD_Reform_Negates_Count] = row
	g_JFD_Reform_Negates_Count = g_JFD_Reform_Negates_Count + 1
end

--Player:SetHasReform
function Player.SetHasReform(player, reformID, isReformFree, setHasReform, isInit)
	local playerID = player:GetID()
	local playerIsHuman = (player:IsHuman() and player:IsTurnActive())
	local isTriggersAnarchy = false
	
	local numFreeReforms = player:GetNumFreeReforms()
	if numFreeReforms > 0 then
		isReformFree = true
	end
	
	local reform = GameInfo.JFD_Reforms[reformID]
	local reformType = reform.Type
	local policyID = GameInfoTypes[reform.PolicyType]
	if setHasReform and (not player:HasReform(reformID)) then
	
		--NUM FREE REFORMS
		if isReformFree and (not isInit) then
			player:ChangeNumFreeReforms(-1)
		else
		--REFORM COOLDOWN
			local numReformCooldown = player:CalculateReformCooldown()
			if numReformCooldown ~= 0 then
				player:SetCurrentReformCooldown(numReformCooldown)
			end
		end
	
		if (not isInit) then
			LuaEvents.JFD_ReformPassed(playerID, reformID, isReformFree)
	
			if playerIsHuman then
				local reformBranch = GameInfo.JFD_ReformBranches[reform.ReformBranchType]
				local reformBranchDesc = reformBranch.ShortDescription
				local reformHeaderDesc = reform.ReformSubBranchDescription
				local reformDesc = reform.ShortDescription
				local reformPedia = reform.Pedia
				local reformHelpBonus = reform.HelpBonus
				local reformHelpPenalty = reform.HelpPenalty
				player:SendNotification("NOTIFICATION_JFD_GOVERNMENT_REFORM", g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_REFORM_PASSED_TEXT", reformBranchDesc, reformDesc, reformHeaderDesc, reformPedia, reformHelpBonus, reformHelpPenalty), g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_REFORM_PASSED_SHORT_TEXT", reformBranchDesc), false, -1, -1)
			end
		end
		
		player:GrantPolicy(policyID, true)
	
		--g_JFD_Reform_Negates_Table
		local reformsTable = g_JFD_Reform_Negates_Table
		local numReforms = #reformsTable
		for index = 1, numReforms do
			local row = reformsTable[index]
			if row.ReformType == reformType then
				local reformNegateType = row.ReformNegateType
				local reformNegateID = GameInfoTypes[reformNegateType]
				local policyID = GameInfoTypes["POLICY_" .. reformNegateType]
				player:RevokePolicy(policyID)
				LuaEvents.JFD_ReformRevoked(playerID, reformNegateID)
			end
		end
	elseif (not setHasReform) then
		player:RevokePolicy(policyID)
		LuaEvents.JFD_ReformRevoked(playerID, reformID)
	end

	--LEGISLATURE
	if (not isInit) then
		if reform.ResetsLegislature then
			local governmentID = player:GetCurrentGovernment()
			player:ResetLegislature(governmentID)
		end
	end
	
	--TITLE
	if (not isInit) then
		
        for index = 1, #cache.GovernmentTitlesWithReforms do
            local title = cache.GovernmentTitlesWithReforms[index] 
            if title.ReformType == reformType then
                if title.TitleLeader then
                    player:UpdateLeaderName(governmentID)
                end

                if title.TitleState then
                    player:UpdateCivilizationStateDescription(governmentID)
                end
            end

        end
	end

	if playerIsHuman then
		LuaEvents.JFD_UpdateTopPanel()
		if (not isTriggersAnarchy) and (not isInit) then
			Events.AudioPlay2DSound("AS2D_SOUND_JFD_REFORM_PASSED")
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
--Player:SetHasAllDefaultReforms
function Player.SetHasAllDefaultReforms(player, governmentID, isInit, isLimited, isSemiLimited)
	if governmentID == governmentTribeID then 
		return 
	end
	local government = GameInfo.JFD_Governments[governmentID]
	local governmentType = government.Type

	--g_JFD_Reforms_Table
	local reformsTable = g_JFD_Reforms_Table
	if isLimited then
		reformsTable = g_JFD_ReformsLimited_Table
	elseif isSemiLimited then
		reformsTable = g_JFD_ReformsSemiLimited_Table
	end
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local reformID = row.ID
		if row.DefaultActive then
			player:SetHasReform(reformID, false, true, isInit)
		end
	end
	
	player:UpdateLeaderName(governmentID)
	player:UpdateCivilizationStateDescription(governmentID)
end
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Reforms_ReformCostModPerCity_Table
local g_JFD_Reforms_ReformCostModPerCity_Table = {}
local g_JFD_Reforms_ReformCostModPerCity_Count = 1
for row in DB.Query("SELECT * FROM JFD_Reforms WHERE ReformCostModPerCity <> 0;") do 	
	g_JFD_Reforms_ReformCostModPerCity_Table[g_JFD_Reforms_ReformCostModPerCity_Count] = row
	g_JFD_Reforms_ReformCostModPerCity_Count = g_JFD_Reforms_ReformCostModPerCity_Count + 1
end

--g_JFD_Reforms_ReformCostModPerPop_Table
local g_JFD_Reforms_ReformCostModPerPop_Table = {}
local g_JFD_Reforms_ReformCostModPerPop_Count = 1
for row in DB.Query("SELECT * FROM JFD_Reforms WHERE ReformCostModPerPop <> 0;") do 	
	g_JFD_Reforms_ReformCostModPerPop_Table[g_JFD_Reforms_ReformCostModPerPop_Count] = row
	g_JFD_Reforms_ReformCostModPerPop_Count = g_JFD_Reforms_ReformCostModPerPop_Count + 1
end

--Player:GetReformCost
function Player.GetReformCost(player, reformID)
	local reform = GameInfo.JFD_Reforms[reformID]
	local reformBranchType = reform.ReformBranchType
	local numReformCost = reform.Cost
	if (not player:IsHuman()) then
		numReformCost = 0
	end
	
	local numReformCostMod = Player_GetReformCostModifier(player, reformID)
	if numReformCostMod ~= 0 then
		numReformCost = numReformCost + ((numReformCost*numReformCostMod)/100)
	end
	
	--REFORMS
	--g_JFD_Reforms_ReformCostModPerCity_Table
	local reformsTable = g_JFD_Reforms_ReformCostModPerCity_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local reformID = row.ID
		if player:HasReform(reformID) then
			local numCities = player:GetNumCities()
			local numReformCostModPerCity = 0
			local numReformCostModPerCityReformCategoryType = row.ReformCostModPerCityReformCategoryType
			if numReformCostModPerCityReformCategoryType then	
				if reformBranchType == numReformCostModPerCityReformCategoryType then 
					numReformCostModPerCity = row.ReformCostModPerCity
				end
			end
			
			local numReformCostMod = g_MathMin(numReformCostModPerCity*numCities, 30)
			numReformCostMod = g_MathMax(numReformCostMod, -30)
			numReformCost = numReformCost + ((numReformCost*numReformCostMod)/100)
		end
	end
		
	--g_JFD_Reforms_ReformCostModPerPop_Table
	local reformsTable = g_JFD_Reforms_ReformCostModPerPop_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local reformID = row.ID
		if player:HasReform(reformID) then
			local numPopulation = player:GetTotalPopulation()
			local numReformCostModPerPop = 0
			local numReformCostModPerCityReformCategoryType = row.ReformCostModPerPopReformCategoryType
			if numReformCostModPerCityReformCategoryType then	
				if reformBranchType == numReformCostModPerCityReformCategoryType then 
					numReformCostModPerPop = row.ReformCostModPerPop
				end
			end
			
			local numReformCostMod = g_MathMin(numReformCostModPerPop*numPopulation, 30)
			numReformCostMod = g_MathMax(numReformCostMod, -30)
			numReformCost = numReformCost + ((numReformCost*numReformCostMod)/100)
		end
	end
	
	-- LEGISLATURE
	numReformCost = numReformCost + player:GetReformOpinionOpposed(reformID)
	numReformCost = numReformCost - player:GetReformOpinionFavoured(reformID)

    -- COUNCILLORS
	for index = 1, #g_Policy_JFD_SovereigntyMods_Table do
		local policy = g_Policy_JFD_SovereigntyMods_Table[index]
        if policy.ReformBranchType and policy.ReformBranchType == reformBranchType then
            if policy.ReformCostMod ~= 0 then
                if player:HasPolicy(GameInfoTypes[policy.PolicyType]) then
					numReformCost = numReformCost + policy.ReformCostMod
				end
            end
        end
	end
	
	if numReformCost < 0 then 
		numReformCost = 0 
	end
	
	return g_GetRound(numReformCost)
end
----------------------------------------------------------------------------------------------------------------------------
--Player:GetReformOpinionFavoured
function Player.GetReformOpinionFavoured(player, reformID)
	local reform = GameInfo.JFD_Reforms[reformID]
	local reformType = reform.Type
	local reformAlignment = reform.Alignment
	local reformBranchType = reform.ReformBranchType
	local numReformOpinionFavoured = 0
	
	--g_JFD_Faction_FavouredReforms_Table
	local factionsTable = g_JFD_Faction_FavouredReforms_Table
	local numFactions = #factionsTable
	for index = 1, numFactions do
		local row = factionsTable[index]
		local factionID = GameInfoTypes[row.FactionType]
		local factionPower = player:GetFactionPower(factionID)
		if factionPower > 0 then
				
			--g_JFD_Reforms_FactionSupportSovMod_Table
			local reformsTable = g_JFD_Reforms_FactionSupportSovMod_Table
			local numReforms = #reformsTable
			for index = 1, numReforms do
				local row = reformsTable[index]
				local reformID = row.ID
				if player:HasReform(reformID) then
					factionPower = factionPower + g_GetRound((factionPower*row.FactionSupportSovMod)/100)
				end
			end
			
			local thisReformBranchType = row.ReformBranchType
			local thisReformType = row.ReformType
			if (thisReformBranchType and thisReformBranchType == reformBranchType) and ((reformAlignment == row.ReformAlignment) or (not row.ReformAlignment)) then
				numReformOpinionFavoured = numReformOpinionFavoured + factionPower
			elseif (thisReformType and reformType == thisReformType) then
				numReformOpinionFavoured = numReformOpinionFavoured + factionPower
			end
		end
	end
	
	return numReformOpinionFavoured
end
----------------------------------------------------------------------------------------------------------------------------
--Player:GetReformOpinionOpposed
function Player.GetReformOpinionOpposed(player, reformID)
	local reform = GameInfo.JFD_Reforms[reformID]
	local reformType = reform.Type
	local reformAlignment = reform.Alignment
	local reformBranchType = reform.ReformBranchType
	local numReformOpinionOpposed = 0
	
	--g_JFD_Faction_OpposedReforms_Table
	local factionsTable = g_JFD_Faction_OpposedReforms_Table
	local numFactions = #factionsTable
	for index = 1, numFactions do
		local row = factionsTable[index]
		local factionID = GameInfoTypes[row.FactionType]
		local factionPower = player:GetFactionPower(factionID)
		
		--g_JFD_Reforms_FactionOppositionSovMod_Table
		local reformsTable = g_JFD_Reforms_FactionOppositionSovMod_Table
		local numReforms = #reformsTable
		for index = 1, numReforms do
			local row = reformsTable[index]
			local reformID = row.ID
			if player:HasReform(reformID) then
				factionPower = factionPower + g_GetRound((factionPower*row.FactionOppositionSovMod)/100)
			end
		end
			
		if factionPower > 0 then
			local thisReformBranchType = row.ReformBranchType
			local thisReformType = row.ReformType
			if (thisReformBranchType and thisReformBranchType == reformBranchType) and ((reformAlignment == row.ReformAlignment) or (not row.ReformAlignment)) then
				numReformOpinionOpposed = numReformOpinionOpposed + factionPower
			elseif (thisReformType and reformType == thisReformType) then
				numReformOpinionOpposed = numReformOpinionOpposed + factionPower
			end
		end
	end
	
	return numReformOpinionOpposed
end
----------------------------------------------------------------------------------------------------------------------------
--Player:CanHaveReform
function Player.CanHaveReform(player, reformID, ignoreCost, reformCost)
	local playerTeam = Teams[player:GetTeam()]
	local currentGovernmentID = player:GetCurrentGovernment()
	local currentGovernment = GameInfo.JFD_Governments[currentGovernmentID]
	local reform = GameInfo.JFD_Reforms[reformID]
	local canHaveReform = true
	local isReformCooldownDisable = false
	local strReformDisableIcon = ""
	local strReformDisabledTT = ""
	
	if (not reform.ShowInGovernment) then 
		return false, false, "", ""
	end

	if reform.IsNotWithLimited then
		if currentGovernment.IsLimited then
			canHaveReform = false
			isReformCooldownDisable = false
			strReformDisableIcon = "[ICON_CROSS]"
			strReformDisabledTT = strReformDisabledTT .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_BLOCKED")
			return canHaveReform, isReformCooldownDisable, strReformDisableIcon, strReformDisabledTT
		end
	end 

	if reform.IsNotWithSemiLimited then
		if currentGovernment.IsSemiLimited then
			canHaveReform = false
			isReformCooldownDisable = false
			strReformDisableIcon = "[ICON_CROSS]"
			strReformDisabledTT = strReformDisabledTT .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_BLOCKED")
			return canHaveReform, isReformCooldownDisable, strReformDisableIcon, strReformDisabledTT
		end
	end 

	if player:HasReform(reformID) then 
		canHaveReform = false
		isReformCooldownDisable = false
		strReformDisableIcon = ""
		strReformDisabledTT = strReformDisabledTT .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_PASSED")
	end

	if player:IsAnarchy() then
		canHaveReform = false
		isReformCooldownDisable = false
		strReformDisableIcon = "[ICON_RESISTANCE]"
		-- strReformDisabledTT = strReformDisabledTT .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_ANARCHY")
	end

	if (not ignoreCost) then
		local numSov = player:GetCurrentSovereignty()
		local numReformCost = reformCost
		if (not numReformCost) then			
			numReformCost = player:GetReformCost(reformID)
		end
		if numSov < numReformCost then 
			canHaveReform = false
			isReformCooldownDisable = false
			strReformDisableIcon = "[ICON_JFD_SOVEREIGNTY]"
			-- strReformDisabledTT = strReformDisabledTT .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_SOVEREIGNTY_REQ", numReformCost) 
		end
	end

	local prereqGovernmentID = GameInfoTypes[reform.PrereqGovernment]
	if prereqGovernmentID then
		if currentGovernmentID ~= prereqGovernmentID then 
			canHaveReform = false
			isReformCooldownDisable = false
			strReformDisableIcon = "[ICON_LOCKED]"
			strReformDisabledTT = strReformDisabledTT .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_PREREQ_GOVERNMENT", GameInfo.JFD_Governments[prereqGovernmentID].Description) 
		end
	end

	local prereqEraID = GameInfoTypes[reform.PrereqEra]
	if prereqEraID then
		local currentEraID = player:GetCurrentEra()
		if currentEraID < prereqEraID then 
			canHaveReform = false
			isReformCooldownDisable = false
			strReformDisableIcon = "[ICON_LOCKED]"
			strReformDisabledTT = strReformDisabledTT .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_PREREQ_ERA", GameInfo.Eras[prereqEraID].Description)
		end
	end

	local numReformCooldown = player:GetCurrentReformCooldown()
	if numReformCooldown > 0 then 
		canHaveReform = false
		isReformCooldownDisable = true
		strReformDisableIcon = "[ICON_JFD_REFORM_COOLDOWN]"
		-- strReformDisabledTT = strReformDisabledTT .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_COOLDOWN", numReformCooldown)
	end

	return canHaveReform, isReformCooldownDisable, strReformDisableIcon, strReformDisabledTT
end
----------------------------------------------------------------------------------------------------------------------------
--Player_GetReformSubBranchAlignmentPreference
function Player_GetReformSubBranchAlignmentPreference(player, reformSubBranchID)
	local prefAlignment = "REFORM_CENTRE"
	local reformSubBranch = GameInfo.JFD_ReformSubBranches[reformSubBranchID]
	local reformSubBranchType = reformSubBranch.Type
	local reformBranchType = reformSubBranch.ReformBranchType
	local reformBranchFlavourType = reformBranchType.FlavourType
	local baseFlavour = player:GetFlavorValue(reformBranchFlavourType)
	if baseFlavour == 0 then
		local reformBranchAltFlavourType = reformBranchType.AltFlavourType
		baseFlavour = player:GetFlavorValue(reformBranchAltFlavourType)
	end

	local leftFlavourVal = 0
	if baseFlavour <= 4 then
		leftFlavourVal = baseFlavour
	end
	local rightFlavourVal = 0
	if baseFlavour >= 7 then
		rightFlavourVal = (baseFlavour-6)
	end
	local centreFlavourVal = 0
	if (baseFlavour == 5 or baseFlavour == 6) then
		centreFlavourVal = (baseFlavour-4)
	end

	--g_JFD_ReformSubBranch_Flavours_Table
	local reformSubBranchesTable = g_JFD_ReformSubBranch_Flavours_Table
	local numSubBranches = #reformSubBranchesTable
	for index = 1, numSubBranches do
		local row = reformSubBranchesTable[index]	
		if row.ReformSubBranchType == reformSubBranchType then
			local leftFlavourType = row.LeftFlavourType
			leftFlavourVal = leftFlavourVal + player:GetFlavorValue(leftFlavourType)
			local rightFlavourType = row.RightFlavourType
			rightFlavourVal = rightFlavourVal + player:GetFlavorValue(rightFlavourType)
			local centreFlavourType = row.CentreFlavourType
			centreFlavourVal = centreFlavourVal + 0
			if centreFlavourType then
				centreFlavourVal = centreFlavourVal + player:GetFlavorValue(centreFlavourType)
			end
		end
	end
	
	if (rightFlavourVal > centreFlavourVal and leftFlavourVal > centreFlavourVal) then
		if rightFlavourVal > leftFlavourVal then
			prefAlignment = "REFORM_RIGHT"
		else
			prefAlignment = "REFORM_LEFT"
		end
	end
	
	return prefAlignment
end
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_ReformsToPass_Table
local g_JFD_ReformsToPass_Table = {}
local g_JFD_ReformsToPass_Count = 1
for row in DB.Query("SELECT * FROM JFD_Reforms WHERE ShowInGovernment = 1 ORDER BY ID DESC;") do 	
	g_JFD_ReformsToPass_Table[g_JFD_ReformsToPass_Count] = row
	g_JFD_ReformsToPass_Count = g_JFD_ReformsToPass_Count + 1
end

--Player_GetReformToPass
function Player_GetReformToPass(playerID)
	local player = Players[playerID]
	if player:IsHuman() then return end
	if (not player:IsHasGovernment()) then return end
	
	local numCities = player:GetNumCities()
	local numPop = player:GetTotalPopulation()
		
	local governmentID = player:GetCurrentGovernment()
	local governmentType = GameInfo.JFD_Governments[governmentID].Type
	local validReformsTable = {}
	local validReformsTableCount = 1
	
	local currentEraID = player:GetCurrentEra()
	if currentEraID >= eraRenaissanceID then

        local alignment = Player_GetReformSubBranchAlignmentPreference(player, "REFORM_SUBBRANCH_JFD_LEGITIMACY_1")
        if alignment == "REFORM_LEFT" then
            if player:CanHaveReform(reformLegitimacyWealthID) then
                return reformLegitimacyWealthID
            end           
        elseif alignment == "REFORM_RIGHT" then
            if player:CanHaveReform(reformLegitimacyWisdomID) then
                return reformLegitimacyWisdomID
            end
        end

        local alignment = Player_GetReformSubBranchAlignmentPreference(player, "REFORM_SUBBRANCH_JFD_LEGITIMACY_3")
        if alignment == "REFORM_LEFT" then
            if player:CanHaveReform(reformLegitimacyCharismaID) then
                return reformLegitimacyCharismaID
            end           
        elseif alignment == "REFORM_RIGHT" then
            if player:CanHaveReform(reformLegitimacySecurityID) then
                return reformLegitimacySecurityID
            end
        end

        local alignment = Player_GetReformSubBranchAlignmentPreference(player, "REFORM_SUBBRANCH_JFD_CONSTITUTION")
	    if alignment == "REFORM_LEFT" then
		    if player:CanHaveReform(reformConstitutionUncodifiedID) then	
			    return reformConstitutionUncodifiedID
            end
        elseif alignment == "REFORM_RIGHT" then
	    	if player:CanHaveReform(reformConstitutionCodifiedID) then	
		    	return reformConstitutionCodifiedID
			end
       	end
	
		if (not player:HasReform(reformFactionsInterestsID)) then
			local alignment = Player_GetReformSubBranchAlignmentPreference(player, "REFORM_SUBBRANCH_JFD_LEGISLATURE")
			if alignment == "REFORM_LEFT" then
				if player:CanHaveReform(reformLegislatureParliamentaryID) then
					return reformLegislatureParliamentaryID
				end
			elseif alignment == "REFORM_RIGHT" then
				if player:CanHaveReform(reformLegislatureCongressionalID) then	
					return reformLegislatureCongressionalID
				end
			end
		end
			
		local alignment = Player_GetReformSubBranchAlignmentPreference(player, "REFORM_SUBBRANCH_JFD_EXECUTIVE")
		if alignment == "REFORM_LEFT" then
			if player:CanHaveReform(reformExecutiveConstitutionalID) then	
				return reformExecutiveConstitutionalID
			end
		elseif alignment == "REFORM_RIGHT" then
			if player:CanHaveReform(reformExecutiveAbsoluteID) then	
				return reformExecutiveAbsoluteID
			end
		end
		
		if numPop >= defineDefaultAILegislatureChoicePopThreshold then
			local alignment = Player_GetReformSubBranchAlignmentPreference(player, "REFORM_SUBBRANCH_JFD_FACTIONS")
			if alignment == "REFORM_LEFT" then
				if player:CanHaveReform(reformFactionsMultiPartyID, true) then
					return reformFactionsMultiPartyID
				end
			elseif alignment == "REFORM_RIGHT" then
				if player:CanHaveReform(reformFactionsTwoPartyID, true) then	
					return reformFactionsTwoPartyID
				end
			end
		end
			
		if currentEraID >= eraIndustrialID then
			if numCities > 8 then
				local alignment = Player_GetReformSubBranchAlignmentPreference(player, "REFORM_SUBBRANCH_JFD_STRUCTURE")
				if alignment == "REFORM_LEFT" then
					if player:CanHaveReform(reformStructureUnitaryID) then	
						return reformStructureUnitaryID
					end
				elseif alignment == "REFORM_RIGHT" then
					if player:CanHaveReform(reformStructureFederationID) then	
						return reformStructureFederationID
					end
				end
			end
		end
	end

	--g_JFD_ReformSubBranch_Flavours_Table
	local reformSubBranchesTable = g_JFD_ReformSubBranch_Flavours_Table
	local numSubBranches = #reformSubBranchesTable
	for index = 1, numSubBranches do
		local row = reformSubBranchesTable[index]	
		local reformSubBranchType = row.ReformSubBranchType
		local alignment = Player_GetReformSubBranchAlignmentPreference(player, reformSubBranchType)
		
		--g_JFD_ReformsToPass_Table
		local reformsTable = g_JFD_ReformsToPass_Table
		local numReforms = #reformsTable
		for index = 1, numReforms do
			local row2 = reformsTable[index]	
			local reformID = row2.ID
			if row2.ShowInGovernment then
				if (row2.ReformSubBranchType == reformSubBranchType and row2.Alignment == alignment) then
					if player:CanHaveReform(reformID) then
						local numSovWhenNumCitiesOrLess = row2.SovereigntyWhenNumCitiesOrLess
						local numSovWhenNumCitiesOrMore = row2.SovereigntyWhenNumCitiesOrMore
						if (numSovWhenNumCitiesOrLess > 0 and numCities <= numSovWhenNumCitiesOrLess) 
						or (numSovWhenNumCitiesOrMore > 0 and numCities >= numSovWhenNumCitiesOrMore) 
						or (numSovWhenNumCitiesOrLess == 0 and numSovWhenNumCitiesOrLess == 0) then
							validReformsTable[validReformsTableCount] = reformID
							validReformsTableCount = validReformsTableCount + 1
						end
					end
				end
			end
		end
	end
	
	if #validReformsTable > 0 then
		for _, reformID in pairs(validReformsTable) do
			local reformBranch = GameInfo.JFD_Reforms[reformID].ReformBranchType
			local reformBranchFlavour1 = GameInfo.JFD_ReformBranches[reformBranch].FlavourType
			local reformBranchFlavour2 = GameInfo.JFD_ReformBranches[reformBranch].AltFlavourType
			local playerFlavour1 = player:GetFlavorValue(reformBranchFlavour1) + g_GetRandom(1,4)
			local playerFlavour2 = player:GetFlavorValue(reformBranchFlavour2) + g_GetRandom(1,4)
			local playerFlavour = (playerFlavour1 + playerFlavour2)
			local randomChance = g_GetRandom(1,100)
			if playerFlavour > randomChance then
				return validReformsTable[reformID]
			end
		end
		return validReformsTable[g_GetRandom(1,#validReformsTable)]
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- FREE REFORM UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player:GetNumFreeReforms
function Player.GetNumFreeReforms(player)	
	local playerID = player:GetID()
	return load( player, "FreeReforms" ) or 0
end
----------------------------------------------------------------------------------------------------------------------------
--Player:ChangeNumFreeReforms
function Player.ChangeNumFreeReforms(player, changeVal)
	local currentVal = player:GetNumFreeReforms()
	local newVal = g_GetRound(currentVal+changeVal)
	player:SetNumFreeReforms(newVal)
end
----------------------------------------------------------------------------------------------------------------------------
--Player:SetNumFreeReforms
function Player.SetNumFreeReforms(player, setVal)
	local playerID = player:GetID()
	save( player, "FreeReforms", setVal )
end
----------------------------------------------------------------------------------------------------------------------------
-- REFORM COOLDOWN UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player:GetCurrentReformCooldown
function Player.GetCurrentReformCooldown(player)
	return player:GetReformCooldown()
end
----------------------------------------------------------------------------------------------------------------------------
--Player:ChangeCurrentReformCooldown
function Player.ChangeCurrentReformCooldown(player, changeVal)
	player:ChangeReformCooldown(changeVal)
end
----------------------------------------------------------------------------------------------------------------------------
--Player:SetCurrentReformCooldown
function Player.SetCurrentReformCooldown(player, setVal)
	if setVal <= 0 then setVal = 0 end
	player:SetReformCooldown(setVal)
end
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Reforms_RevolutionarySentimentCooldownMod_Table
local g_JFD_Reforms_RevolutionarySentimentCooldownMod_Table = {}
local g_JFD_Reforms_RevolutionarySentimentCooldownMod_Count = 1
for row in DB.Query("SELECT ID, RevolutionarySentimentCooldownMod FROM JFD_Reforms WHERE ShowInGovernment = 1 AND RevolutionarySentimentCooldownMod <> 0;") do 	
	g_JFD_Reforms_RevolutionarySentimentCooldownMod_Table[g_JFD_Reforms_RevolutionarySentimentCooldownMod_Count] = row
	g_JFD_Reforms_RevolutionarySentimentCooldownMod_Count = g_JFD_Reforms_RevolutionarySentimentCooldownMod_Count + 1
end

--Player:CalculateReformCooldown
function Player.CalculateReformCooldown(player, returnsTT)
	local numCurrentReformCooldown = player:GetCurrentReformCooldown()
	local numReformCooldown = defineDefaultReformCooldownTurns
	local numReformCooldownModTotal = 0
	local strReformCooldownTT = ""
	local strReformCooldownModTT = ""
	
	--Revolutionary Sentiment
	local numRevolutionarySentiment = player:GetTotalRevolutionarySentiment()
	if numRevolutionarySentiment > 0 then
		
		--g_JFD_Reforms_RevolutionarySentimentCooldownMod_Table
		local reformsTable = g_JFD_Reforms_RevolutionarySentimentCooldownMod_Table
		local numReforms = #reformsTable
		for index = 1, numReforms do
			local row = reformsTable[index]
			local reformID = row.ID
			if player:HasReform(reformID) then
				numRevolutionarySentiment = numRevolutionarySentiment + ((numRevolutionarySentiment*row.RevolutionarySentimentCooldownMod)/100)
			end
		end
		
		numReformCooldown = numReformCooldown + g_GetRound((numReformCooldown*numRevolutionarySentiment)/100)
		if returnsTT then
			if numRevolutionarySentiment > 0 then
				strReformCooldownModTT = strReformCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_REVOLUTIONARY_SENTIMENT", "[COLOR_WARNING_TEXT]+" .. numRevolutionarySentiment .. "%[ENDCOLOR]")
			else
				strReformCooldownModTT = strReformCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_REVOLUTIONARY_SENTIMENT", "[COLOR_POSITIVE_TEXT]" .. numRevolutionarySentiment .. "%[ENDCOLOR]")
			end
		end
	end	
	
	--Cities
	local numReformCooldownModPerCity = (defineDefaultReformCooldownTurnsModPerCity*player:GetNumCities())
	--g_Building_JFD_SovereigntyMods_Table
	local buildingsTable = g_Building_JFD_SovereigntyMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local buildingReformCooldownMod = row.ReformCooldownModPerCity
		if buildingReformCooldownMod ~= 0 then
			local buildingID = GameInfoTypes[row.BuildingType]
			local buildingCount = player:CountNumBuildings(buildingID)
			if buildingCount > 0 then
				buildingReformCooldownMod = (buildingReformCooldownMod*buildingCount)
				numReformCooldownModPerCity = numReformCooldownModPerCity + ((numReformCooldownModPerCity*buildingReformCooldownMod)/100)
			end
		end
	end
	numReformCooldownModPerCity = g_GetRound(numReformCooldownModPerCity)
	if numReformCooldownModPerCity > 0 then
		numReformCooldownModTotal = numReformCooldownModTotal + numReformCooldownModPerCity
		if returnsTT then
			strReformCooldownModTT = strReformCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_CITIES", "[COLOR_WARNING_TEXT]+" .. numReformCooldownModPerCity .. "%[ENDCOLOR]")
		end
	end
	
	--Citizens
	local numReformCooldownModPerCitizen = (defineDefaultReformCooldownTurnsModPerCitizen*player:GetTotalPopulation())
	--g_Building_JFD_SovereigntyMods_Table
	local buildingsTable = g_Building_JFD_SovereigntyMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local buildingReformCooldownMod = row.ReformCooldownModPerCitizen
		if buildingReformCooldownMod ~= 0 then
			local buildingID = GameInfoTypes[row.BuildingType]
			local buildingCount = player:CountNumBuildings(buildingID)
			if buildingCount > 0 then
				buildingReformCooldownMod = (buildingReformCooldownMod*buildingCount)
				numReformCooldownModPerCitizen = numReformCooldownModPerCitizen + ((numReformCooldownModPerCitizen*buildingReformCooldownMod)/100)
			end
		end
	end
	numReformCooldownModPerCitizen = g_GetRound(numReformCooldownModPerCitizen)
	if numReformCooldownModPerCitizen > 0 then
		numReformCooldownModTotal = numReformCooldownModTotal + numReformCooldownModPerCitizen
		if returnsTT then
			strReformCooldownModTT = strReformCooldownModTT .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_CITIZENS", "[COLOR_WARNING_TEXT]+" .. numReformCooldownModPerCitizen .. "%[ENDCOLOR]")
		end
	end
	
	local numReformCooldownMod, strNumReformCooldownModTT = Player_GetReformCooldownModifier(player, returnsTT)
	if numReformCooldownMod ~= 0 then
		numReformCooldownModTotal = numReformCooldownModTotal + numReformCooldownMod
	end
	
	if numReformCooldownModTotal ~= 0 then
		if numReformCooldownModTotal > 0 then
			numReformCooldownModTotal = g_MathMin(numReformCooldownModTotal, defineDefaultReformCooldownModCap)
		else
			numReformCooldownModTotal = g_MathMax(numReformCooldownModTotal, (defineDefaultReformCooldownModCap*-1))
		end
		numReformCooldown = numReformCooldown + ((numReformCooldown*numReformCooldownModTotal)/100)
	end
	numReformCooldown = g_GetRound(numReformCooldown)
	
	if returnsTT then
		if strReformCooldownModTT ~= "" then
			strReformCooldownTT = g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_REFORM_COOLDOWN_TT", numCurrentReformCooldown, numReformCooldown) .. strReformCooldownModTT .. strNumReformCooldownModTT
		else
			strReformCooldownTT = g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_REFORM_COOLDOWN_TT", numCurrentReformCooldown, numReformCooldown) .. strNumReformCooldownModTT
		end
	end
	
	if (not player:IsHuman()) then
		numReformCooldown = g_GetRound(numReformCooldown/2)
	end

	return numReformCooldown, numCurrentReformCooldown, strReformCooldownTT
end
----------------------------------------------------------------------------------------------------------------------------
-- REVOLUTIONARY SENTIMENT UTILS
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Reforms_RevolutionarySentimentPerReform_Table
local g_JFD_Reforms_RevolutionarySentimentPerReform_Table = {}
local g_JFD_Reforms_RevolutionarySentimentPerReform_Count = 1
for row in DB.Query("SELECT ID, RevolutionarySentimentPerReform FROM JFD_Reforms WHERE ShowInGovernment = 1 AND RevolutionarySentimentPerReform <> 0;") do 	
	g_JFD_Reforms_RevolutionarySentimentPerReform_Table[g_JFD_Reforms_RevolutionarySentimentPerReform_Count] = row
	g_JFD_Reforms_RevolutionarySentimentPerReform_Count = g_JFD_Reforms_RevolutionarySentimentPerReform_Count + 1
end

--Player:GetTotalRevolutionarySentiment
function Player.GetTotalRevolutionarySentiment(player, returnsTT)
	local currentGovernmentID = player:GetCurrentGovernment()
	local currentGovernment = GameInfo.JFD_Governments[currentGovernmentID]

    local revolutionarySentimentPerReform = defineDefaultReformRevSentiment

    --g_JFD_Reforms_RevolutionarySentimentPerReform_Table
	local reformsTable = g_JFD_Reforms_RevolutionarySentimentPerReform_Table
	local numGovts = #reformsTable
	for index = 1, numGovts do
		local row = reformsTable[index]
		local reformID = row.ID
		if player:HasReform(reformID) then
			revolutionarySentimentPerReform = revolutionarySentimentPerReform + row.RevolutionarySentimentPerReform
		end
	end
	
	local numRevolutionarySentimentBase = (player:GetNumReforms(true)*revolutionarySentimentPerReform)
	local numRevolutionarySentiment = numRevolutionarySentimentBase
	local numRevolutionarySentimentMod, strRevolutionarySentimentModTT = Player_GetRevolutionarySentimentModifier(player, returnsTT)
	
	if numRevolutionarySentimentMod > 0 then
		numRevolutionarySentiment = numRevolutionarySentiment + ((numRevolutionarySentiment*numRevolutionarySentimentMod)/100)
	end
	numRevolutionarySentiment = g_GetRound(numRevolutionarySentiment,2)
	
	if returnsTT then
		strRevolutionarySentimentModTT = g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_RATE", numRevolutionarySentiment, numRevolutionarySentimentBase) .. strRevolutionarySentimentModTT
	end

	return numRevolutionarySentiment, strRevolutionarySentimentModTT
end
----------------------------------------------------------------------------------------------------------------------------
-- REVOLUTIONARY SENTIMENT MODIFIER UTILS
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Reforms_RevolutionarySentimentMods_Table
local g_JFD_Reforms_RevolutionarySentimentMods_Table = {}
local g_JFD_Reforms_RevolutionarySentimentMods_Count = 1
for row in DB.Query("SELECT ID, RevolutionarySentimentModPerCity, RevolutionarySentimentModPerPop FROM JFD_Reforms WHERE ShowInGovernment = 1 AND (RevolutionarySentimentModPerCity <> 0 OR RevolutionarySentimentModPerPop <> 0);") do 	
	g_JFD_Reforms_RevolutionarySentimentMods_Table[g_JFD_Reforms_RevolutionarySentimentMods_Count] = row
	g_JFD_Reforms_RevolutionarySentimentMods_Count = g_JFD_Reforms_RevolutionarySentimentMods_Count + 1
end

--Player_GetRevolutionarySentimentModifier
function Player_GetRevolutionarySentimentModifier(player, returnsTT)
	local numCities = player:GetNumCities()
	local numPopulation = player:GetTotalPopulation()

	local numRevolutionarySentimentMod = 0
	local strRevolutionarySentimentModTT = ""
	
	local numRevolutionarySentimentModUnhappiness = g_MathMax(player:GetExcessHappiness()*-1,0)*10
	numRevolutionarySentimentMod = numRevolutionarySentimentMod + numRevolutionarySentimentModUnhappiness
	if returnsTT then
		if numRevolutionarySentimentModUnhappiness > 0 then
			strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_UNHAPPINESS", "[COLOR_WARNING_TEXT]+" .. numRevolutionarySentimentModUnhappiness .. "%[ENDCOLOR]")
		end
	end
				
	for index = 1, #cache.Governments do
        local government = cache.Governments[index]
		if government.RevolutionarySentimentMod ~= 0 then
			if player:IsHasGovernment(government.ID) then
				numRevolutionarySentimentMod = numRevolutionarySentimentMod + government.RevolutionarySentimentMod
				if returnsTT then
					if government.RevolutionarySentimentMod > 0 then
						strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_GOVERNMENT", "[COLOR_WARNING_TEXT]+" .. government.RevolutionarySentimentMod .. "%[ENDCOLOR]")
					else
						strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_GOVERNMENT", "[COLOR_POSITIVE_TEXT]" .. government.RevolutionarySentimentMod .. "%[ENDCOLOR]")
					end
				end
			end
		end
	end
	
	local numRevolutionarySentimentModOpposition = 0
	--g_JFD_ReformsLeftRight_Table
	local reformsTable = g_JFD_ReformsLeftRight_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local reformID = row.ID
		if player:HasReform(reformID) then
			local reformAlignment = row.Alignment
			local reformBranch = row.ReformBranchType
			
			--g_JFD_Faction_OpposedReforms_Table
			local factionsTable = g_JFD_Faction_OpposedReforms_Table
			local numFactions = #factionsTable
			for index = 1, numFactions do
				local row = factionsTable[index]
				if ((row.ReformBranchType == reformBranch) and (row.ReformAlignment == reformAlignment)) then
					local factionID = GameInfoTypes[row.FactionType]
					local factionPower = player:GetFactionPower(factionID)
					if factionPower > 0 then
						local numThisRevolutionarySentimentMod = factionPower
						numRevolutionarySentimentModOpposition = numRevolutionarySentimentModOpposition + numThisRevolutionarySentimentMod
					end
				end
			end
		end
	end
	if numRevolutionarySentimentModOpposition ~= 0 then
		numRevolutionarySentimentMod = numRevolutionarySentimentMod + numRevolutionarySentimentModOpposition
		if returnsTT then
			if numRevolutionarySentimentModOpposition > 0 then
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_OPPOSITION", "[COLOR_WARNING_TEXT]+" .. numRevolutionarySentimentModOpposition .. "%[ENDCOLOR]")
			else
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_OPPOSITION", "[COLOR_POSITIVE_TEXT]" .. numRevolutionarySentimentModOpposition .. "%[ENDCOLOR]")
			end
		end
	end

	local numRevolutionarySentimentModCities = 0
	local numRevolutionarySentimentModPopulation = 0
	--g_JFD_Reforms_RevolutionarySentimentMods_Table
	local reformsTable = g_JFD_Reforms_RevolutionarySentimentMods_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local reformID = row.ID
		if player:HasReform(reformID) then
			local numRevolutionarySentimentModPerCity = row.RevolutionarySentimentModPerCity
			if numRevolutionarySentimentModPerCity ~= 0 then
				numRevolutionarySentimentModCities = numRevolutionarySentimentModCities + (numRevolutionarySentimentModPerCity*numCities)
			end

			local numRevolutionarySentimentModPerPop = row.RevolutionarySentimentModPerPop
			if numRevolutionarySentimentModPerPop ~= 0 then
				numRevolutionarySentimentModPopulation = numRevolutionarySentimentModPopulation + (numRevolutionarySentimentModPerPop*numPopulation)
			end
		end
	end
	if numRevolutionarySentimentModCities ~= 0 then
		numRevolutionarySentimentMod = numRevolutionarySentimentMod + numRevolutionarySentimentModCities
		if returnsTT then
			if numRevolutionarySentimentModCities > 0 then
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_CITIES", "[COLOR_WARNING_TEXT]+" .. numRevolutionarySentimentModCities .. "%[ENDCOLOR]")
			else
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_CITIES", "[COLOR_POSITIVE_TEXT]" .. numRevolutionarySentimentModCities .. "%[ENDCOLOR]")
			end
		end
	end
	if numRevolutionarySentimentModPopulation ~= 0 then
		numRevolutionarySentimentMod = numRevolutionarySentimentMod + numRevolutionarySentimentModPopulation
		if returnsTT then
			if numRevolutionarySentimentModPopulation > 0 then
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_POPULATION", "[COLOR_WARNING_TEXT]+" .. numRevolutionarySentimentModPopulation .. "%[ENDCOLOR]")
			else
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_POPULATION", "[COLOR_POSITIVE_TEXT]" .. numRevolutionarySentimentModPopulation .. "%[ENDCOLOR]")
			end
		end
	end
			
	local numRevolutionarySentimentModReforms = 0
	--g_JFD_Reforms_Table
	local reformsTable = g_JFD_Reforms_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local numThisRevolutionarySentimentModReforms = row.RevolutionarySentimentMod
		if numThisRevolutionarySentimentModReforms ~= 0 then
			local reformID = row.ID
			if player:HasReform(reformID) then
				numRevolutionarySentimentModReforms = numRevolutionarySentimentModReforms + numThisRevolutionarySentimentModReforms
			end
		end
	end
	if numRevolutionarySentimentModReforms ~= 0 then
		numRevolutionarySentimentMod = numRevolutionarySentimentMod + numRevolutionarySentimentModReforms
		if returnsTT then
			if numRevolutionarySentimentModReforms > 0 then
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_REFORMS", "[COLOR_WARNING_TEXT]+" .. numRevolutionarySentimentModReforms .. "%[ENDCOLOR]")
			else
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_REFORMS", "[COLOR_POSITIVE_TEXT]" .. numRevolutionarySentimentModReforms .. "%[ENDCOLOR]")
			end
		end
	end
				
	local numRevolutionarySentimentModBuildings = 0
	--g_Building_JFD_SovereigntyMods_Table
	local buildingsTable = g_Building_JFD_SovereigntyMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local numThisRevolutionarySentimentModRBuildings = row.RevolutionarySentimentMod
		if numThisRevolutionarySentimentModRBuildings ~= 0 then
			local buildingID = GameInfoTypes[row.BuildingType]
			local buildingCount = player:CountNumBuildings(buildingID)
			if buildingCount > 0 then
				numRevolutionarySentimentModBuildings = numRevolutionarySentimentModBuildings + (numThisRevolutionarySentimentModRBuildings*buildingCount)
			end
		end
	end
	if numRevolutionarySentimentModBuildings ~= 0 then
		numRevolutionarySentimentMod = numRevolutionarySentimentMod + numRevolutionarySentimentModBuildings
		if returnsTT then
			if numRevolutionarySentimentModBuildings > 0 then
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_BUILDINGS", "[COLOR_WARNING_TEXT]+" .. numRevolutionarySentimentModBuildings .. "%[ENDCOLOR]")
			else
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_BUILDINGS", "[COLOR_POSITIVE_TEXT]" .. numRevolutionarySentimentModBuildings .. "%[ENDCOLOR]")
			end
		end
	end
			
	local numRevolutionarySentimentModPolicies = 0
	--g_Policy_JFD_SovereigntyMods_Table
	local policiesTable = g_Policy_JFD_SovereigntyMods_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local numThisRevolutionarySentimentModPolicies = row.RevolutionarySentimentMod
		if numThisRevolutionarySentimentModPolicies ~= 0 then
			local policyID = GameInfoTypes[row.PolicyType]
			if player:HasPolicy(policyID) then
				numRevolutionarySentimentModPolicies = numRevolutionarySentimentModPolicies + numThisRevolutionarySentimentModPolicies
			end
		end
	end
	if numRevolutionarySentimentModPolicies ~= 0 then
		numRevolutionarySentimentMod = numRevolutionarySentimentMod + numRevolutionarySentimentModPolicies
		if returnsTT then
			if numRevolutionarySentimentModPolicies > 0 then
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_POLICIES", "[COLOR_WARNING_TEXT]+" .. numRevolutionarySentimentModPolicies .. "%[ENDCOLOR]")
			else
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_POLICIES", "[COLOR_POSITIVE_TEXT]" .. numRevolutionarySentimentModPolicies .. "%[ENDCOLOR]")
			end
		end
	end
			
	local numRevolutionarySentimentModTraits = 0
	--g_Trait_JFD_SovereigntyMods_Table
	local traitsTable = g_Trait_JFD_SovereigntyMods_Table
	local numTraits = #traitsTable
	for index = 1, numTraits do
		local row = traitsTable[index]
		local numThisRevolutionarySentimentModTraits = row.RevolutionarySentimentMod
		if numThisRevolutionarySentimentModTraits ~= 0 then
			local traitID = GameInfoTypes[row.TraitType]
			if player:HasTrait(traitID) then
				numRevolutionarySentimentModTraits = numRevolutionarySentimentModTraits + numThisRevolutionarySentimentModTraits
			end
		end
	end
	if numRevolutionarySentimentModTraits ~= 0 then
		numRevolutionarySentimentMod = numRevolutionarySentimentMod + numRevolutionarySentimentModTraits
		if returnsTT then
			if numRevolutionarySentimentModTraits > 0 then
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_TRAITS", "[COLOR_WARNING_TEXT]+" .. numRevolutionarySentimentModTraits .. "%[ENDCOLOR]")
			else
				strRevolutionarySentimentModTT = strRevolutionarySentimentModTT .. g_ConvertTextKey("TXT_KEY_JFD_REVOLUTIONARY_SENTIMENT_TT_FROM_TRAITS", "[COLOR_POSITIVE_TEXT]" .. numRevolutionarySentimentModTraits .. "%[ENDCOLOR]")
			end
		end
	end
	
	return numRevolutionarySentimentMod, strRevolutionarySentimentModTT
end
----------------------------------------------------------------------------------------------------------------------------
-- REFORM MODIFIER UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player_GetReformCooldownModifier
function Player_GetReformCooldownModifier(player, returnsTT)
	local numReformCooldownMod = 0
	local strNumReformCooldownMod = ""
    
    -- Government
	for index = 1, #cache.Governments do
        local government = cache.Governments[index]
		if government.ReformCooldownMod ~= 0 then
			if player:IsHasGovernment(government.ID) then
				numReformCooldownMod = numReformCooldownMod + government.ReformCooldownMod
				if returnsTT then
					if government.ReformCooldownMod > 0 then
						strNumReformCooldownMod = strNumReformCooldownMod .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_GOVERNMENT", "[COLOR_WARNING_TEXT]+" .. government.ReformCooldownMod .. "%[ENDCOLOR]")
					else
						strNumReformCooldownMod = strNumReformCooldownMod .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_GOVERNMENT", "[COLOR_POSITIVE_TEXT]" .. government.ReformCooldownMod .. "%[ENDCOLOR]")
					end
				end
			end
		end
	end
			
	--g_JFD_Reforms_Table
	local reformsTable = g_JFD_Reforms_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local numThisReformCooldownMod = row.ReformCooldownMod
		if numThisReformCooldownMod ~= 0 then
			local reformID = GameInfoTypes[row.ReformType]
			if player:HasReform(reformID) then
				numReformCooldownMod = numReformCooldownMod + numThisReformCooldownMod
				if returnsTT then
					if numThisReformCooldownMod > 0 then
						strNumReformCooldownMod = strNumReformCooldownMod .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_REFORMS", "[COLOR_WARNING_TEXT]+" .. numThisReformCooldownMod .. "%[ENDCOLOR]")
					else
						strNumReformCooldownMod = strNumReformCooldownMod .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_REFORMS", "[COLOR_POSITIVE_TEXT]" .. numThisReformCooldownMod .. "%[ENDCOLOR]")
					end
				end
			end
		end
	end
	
	--g_Building_JFD_SovereigntyMods_Table
	local buildingsTable = g_Building_JFD_SovereigntyMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local numThisReformCooldownMod = row.ReformCooldownMod
		if numThisReformCooldownMod ~= 0 then
			local buildingID = GameInfoTypes[row.BuildingType]
			local buildingCount = player:CountNumBuildings(buildingID)
			if buildingCount > 0 then
				numThisReformCooldownMod = (numThisReformCooldownMod*buildingCount)
				numReformCooldownMod = numReformCooldownMod + numThisReformCooldownMod
				if returnsTT then
					if numThisReformCooldownMod > 0 then
						strNumReformCooldownMod = strNumReformCooldownMod .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_BUILDINGS", "[COLOR_WARNING_TEXT]+" .. numThisReformCooldownMod .. "%[ENDCOLOR]")
					else
						strNumReformCooldownMod = strNumReformCooldownMod .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_BUILDINGS", "[COLOR_POSITIVE_TEXT]" .. numThisReformCooldownMod .. "%[ENDCOLOR]")
					end
				end
			end
		end
	end
			
	--g_Policy_JFD_SovereigntyMods_Table
	local policiesTable = g_Policy_JFD_SovereigntyMods_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local numThisReformCooldownMod = row.ReformCooldownMod
		if numThisReformCooldownMod ~= 0 then
			local policyID = GameInfoTypes[row.PolicyType]
			if player:HasPolicy(policyID) then
				numReformCooldownMod = numReformCooldownMod + numThisReformCooldownMod
				if returnsTT then
					if numThisReformCooldownMod > 0 then
						strNumReformCooldownMod = strNumReformCooldownMod .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_POLICIES", "[COLOR_WARNING_TEXT]+" .. numThisReformCooldownMod .. "%[ENDCOLOR]")
					else
						strNumReformCooldownMod = strNumReformCooldownMod .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_POLICIES", "[COLOR_POSITIVE_TEXT]" .. numThisReformCooldownMod .. "%[ENDCOLOR]")
					end
				end
			end
		end
	end
			
	--g_Trait_JFD_SovereigntyMods_Table
	local traitsTable = g_Trait_JFD_SovereigntyMods_Table
	local numTraits = #traitsTable
	for index = 1, numTraits do
		local row = traitsTable[index]
		local numThisReformCooldownMod = row.ReformCooldownMod
		if numThisReformCooldownMod ~= 0 then
			local traitID = GameInfoTypes[row.TraitType]
			if player:HasTrait(traitID) then
				numReformCooldownMod = numReformCooldownMod + numThisReformCooldownMod
				if returnsTT then
					if numThisReformCooldownMod > 0 then
						strNumReformCooldownMod = strNumReformCooldownMod .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_TRAITS", "[COLOR_WARNING_TEXT]+" .. numThisReformCooldownMod .. "%[ENDCOLOR]")
					else
						strNumReformCooldownMod = strNumReformCooldownMod .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_TT_FROM_TRAITS", "[COLOR_POSITIVE_TEXT]" .. numThisReformCooldownMod .. "%[ENDCOLOR]")
					end
				end
			end
		end
	end
	
	return numReformCooldownMod, strNumReformCooldownMod
end
----------------------------------------------------------------------------------------------------------------------------
--Player_GetReformCostModifier
function Player_GetReformCostModifier(player, reformID)
    local reform = GameInfo.JFD_Reforms[reformID]
	local reformBranchType = reform.ReformBranchType
	local reformType = GameInfo.JFD_Reforms[reformID].Type
	local numReformCostMod = 0

	-- Government
	for index = 1, #cache.Governments do
        local government = cache.Governments[index]
		if government.ReformCostMod ~= 0 then
			if player:IsHasGovernment(government.ID) then
				numReformCostMod = numReformCostMod + government.ReformCostMod
			end
		end
	end
			
	--g_JFD_Reforms_Table
	local reformsTable = g_JFD_Reforms_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local numThisReformCostMod = row.ReformCostMod
		if numThisReformCostMod ~= 0 then
			local reformID = row.ID
			if player:HasReform(reformID) then
				numReformCostMod = numReformCostMod + numThisReformCostMod
			end
		end
	end
	
	--g_Building_JFD_SovereigntyMods_Table
	local buildingsTable = g_Building_JFD_SovereigntyMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local numThisReformCostMod = row.ReformCostMod
		local reqReformBranchType = GameInfoTypes[row.ReformBranchType]
		if (not reqReformBranchType) or (reqReformBranchType and reqReformBranchType == reformBranchType) then
			if numThisReformCostMod ~= 0 then
				local buildingID = GameInfoTypes[row.BuildingType]
				local buildingCount = player:CountNumBuildings(buildingID)
				if buildingCount > 0 then
					numReformCostMod = numReformCostMod + (numThisReformCostMod*buildingCount)
				end
			end
		end
	end
			
	--g_Policy_JFD_SovereigntyMods_Table
	local policiesTable = g_Policy_JFD_SovereigntyMods_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local numThisReformCostMod = row.ReformCostMod
		local reqReformBranchType = GameInfoTypes[row.ReformBranchType]
		if (not reqReformBranchType) or (reqReformBranchType and reqReformBranchType == reformBranchType) then
			if numThisReformCostMod ~= 0 then
				local policyID = GameInfoTypes[row.PolicyType]
				if player:HasPolicy(policyID) then
					numReformCostMod = numReformCostMod + numThisReformCostMod
				end
			end
		end
	end
			
	--g_Trait_JFD_SovereigntyMods_Table
	local traitsTable = g_Trait_JFD_SovereigntyMods_Table
	local numTraits = #traitsTable
	for index = 1, numTraits do
		local row = traitsTable[index]
		local numThisReformCostMod = row.ReformCostMod
		local reqReformBranchType = GameInfoTypes[row.ReformBranchType]
		if (not reqReformBranchType) or (reqReformBranchType and reqReformBranchType == reformBranchType) then
			if numThisReformCostMod ~= 0 then
				local traitID = GameInfoTypes[row.TraitType]
				if player:HasTrait(traitID) then
					numReformCostMod = numReformCostMod + numThisReformCostMod
				end
			end
		end
	end
	
	return numReformCostMod
end
----------------------------------------------------------------------------------------------------------------------------
-- REFORM TEXT UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player_GetReformInfoTT
function Player_GetReformInfoTT(player, reformID, reformCost)
	local playerTeam = Teams[player:GetTeam()]
	local strReformHelp = ""
	
	local reform = GameInfo.JFD_Reforms[reformID]
	local reformType = reform.Type
	local reformAlignment = reform.Alignment
	local hasReform = player:HasReform(reformID)
	local canHaveReform, reformCooldownIsDisable, strReformDisabledIcon, strReformDisabledTT = player:CanHaveReform(reformID, reformCost)
	local reformBranchType = reform.ReformBranchType
	local reformHelp
	
	--LEGISLATURE	
	local strReformOpinions = ""
	local isSupported = false
	
	--g_JFD_Faction_FavouredReforms_Table
	local factionsTable = g_JFD_Faction_FavouredReforms_Table
	local numFactions = #factionsTable
	for index = 1, numFactions do
		local row = factionsTable[index]
		local factionID = GameInfoTypes[row.FactionType]
		local factionPower = player:GetFactionPower(factionID)
		if factionPower > 0 then
		
			--g_JFD_Reforms_FactionSupportSovMod_Table
			local reformsTable = g_JFD_Reforms_FactionSupportSovMod_Table
			local numReforms = #reformsTable
			for index = 1, numReforms do
				local row = reformsTable[index]
				local reformID = row.ID
				if player:HasReform(reformID) then
					factionPower = factionPower + g_GetRound((factionPower*row.FactionSupportSovMod)/100)
				end
			end
		
			isSupported = true
			local thisReformAlignment = row.ReformAlignment
			local thisReformBranch = row.ReformBranchType
			local thisReformType = row.ReformType
			if thisReformBranch and thisReformBranch == reformBranchType and reformAlignment == thisReformAlignment then
				local faction = GameInfo.JFD_Factions[factionID]
				local factionIcon = faction.IconString
				strReformOpinions = strReformOpinions .. "[NEWLINE]   [ICON_BULLET][ICON_JFD_REFORM_SUPPORT] "
				strReformOpinions = strReformOpinions .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_REFORM_SUPPORTED", factionIcon, factionPower) 
			elseif (thisReformType and reformType == thisReformType) then
				local faction = GameInfo.JFD_Factions[factionID]
				local factionIcon = faction.IconString
				strReformOpinions = strReformOpinions .. "[NEWLINE]   [ICON_BULLET][ICON_JFD_REFORM_SUPPORT] "
				strReformOpinions = strReformOpinions .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_REFORM_SUPPORTED", factionIcon, factionPower) 
			end
		end
	end
	
	--g_JFD_Faction_OpposedReforms_Table
	local factionsTable = g_JFD_Faction_OpposedReforms_Table
	local numFactions = #factionsTable
	for index = 1, numFactions do
		local row = factionsTable[index]
		local factionID = GameInfoTypes[row.FactionType]
		local factionPower = player:GetFactionPower(factionID)
		if factionPower > 0 then
		
			--g_JFD_Reforms_FactionOppositionSovMod_Table
			local reformsTable = g_JFD_Reforms_FactionOppositionSovMod_Table
			local numReforms = #reformsTable
			for index = 1, numReforms do
				local row = reformsTable[index]
				local reformID = row.ID
				if player:HasReform(reformID) then
					factionPower = factionPower + g_GetRound((factionPower*row.FactionOppositionSovMod)/100)
				end
			end
			
			local thisReformAlignment = row.ReformAlignment
			local thisReformBranch = row.ReformBranchType
			local thisReformType = row.ReformType
			if thisReformBranch and thisReformBranch == reformBranchType and reformAlignment == thisReformAlignment then
				local faction = GameInfo.JFD_Factions[factionID]
				local factionIcon = faction.IconString
				if (not isSupported) then
					strReformOpinions = strReformOpinions .. "[NEWLINE]"
				end
				strReformOpinions = strReformOpinions .. "[NEWLINE]   [ICON_BULLET][ICON_JFD_REFORM_OPPOSE] "
				strReformOpinions = strReformOpinions .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_REFORM_OPPOSED", factionIcon, factionPower) 
			elseif (thisReformType and reformType == thisReformType) then
				local faction = GameInfo.JFD_Factions[factionID]
				local factionIcon = faction.IconString
				strReformOpinions = strReformOpinions .. "[NEWLINE]   [ICON_BULLET][ICON_JFD_REFORM_OPPOSE] "
				strReformOpinions = strReformOpinions .. g_ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_REFORM_OPPOSED", factionIcon, factionPower) 
			end
		end
	end
	
	strReformOpinions = strReformOpinions .. "[NEWLINE]" 
	strReformHelp = g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP", reform.ShortDescription, reform.Pedia, reform.HelpBonus, reform.HelpPenalty, strReformOpinions)
	
	--Active
	if hasReform then
		strReformHelp = strReformHelp .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_PASSED")
	else
			
		--ANARCHY
		if player:IsAnarchy() then
			strReformHelp = strReformHelp .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_ANARCHY")
		end
		
		--COST
		local numSov = player:GetCurrentSovereignty()
		local numReformCost = reformCost
		if (not numReformCost) then			
			numReformCost = player:GetReformCost(reformID)
		end
		if numSov < numReformCost then 
			strReformHelp = strReformHelp .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_SOVEREIGNTY_REQ", numReformCost) 
		end
		
		--COOLDOWN
		local numReformCooldown = player:GetCurrentReformCooldown()
		if numReformCooldown > 0 then 
			strReformHelp = strReformHelp .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_COOLDOWN", numReformCooldown)
		end
		
		--PREREQS	
		if strReformDisabledTT ~= "" then
			strReformHelp = strReformHelp .. "[NEWLINE]" .. g_ConvertTextKey("TXT_KEY_JFD_REFORM_HELP_PREREQS") 
			strReformHelp = strReformHelp .. strReformDisabledTT
		end	
	end
	
	return strReformHelp
end
----------------------------------------------------------------------------------------------------------------------------
-- COUNCILLOR UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player:GetUnitClassCouncillor
function Player.GetUnitClassCouncillor(player, unitClassType)
	local councillorsTable = g_JFD_Councillors_Table
	for index = 1, #councillorsTable do
		local councillor = councillorsTable[index]
		if councillor.UnitClassType == unitClassType then
			return councillor
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
--Player:IsHasCouncillor
function Player.IsHasCouncillor(player, councillorID)
    local councillor = GameInfo.JFD_Councillors[councillorID]
    local policyID = GameInfoTypes[councillor.PolicyType]
    return player:HasPolicy(policyID)
end
----------------------------------------------------------------------------------------------------------------------------
--Player:SetHasCouncillor
function Player.SetHasCouncillor(player, unit, unitID, councillor, name)

	local unitInfo = GameInfo.Units[unitID]
	local unitClassID = GameInfoTypes[unitInfo.Class]
	
	if name then
		local lengthUnitDesc = (Locale.Length(name) - Locale.Length(" (" .. Locale.ConvertTextKey(unitInfo.Description) .. ")"))
		name = Locale.Substring(name, 0, lengthUnitDesc)
	end

    player:GrantPolicy(GameInfoTypes[councillor.PolicyType], true)
	player:SetCouncillorName(councillor.ID, name)

	unit:greatperson()

	if player:IsHuman() and player:IsTurnActive() then
		player:SendNotification("NOTIFICATION_JFD_GOVERNMENT", g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_COUNCILLOR_APPOINTED_TEXT", unit:GetName(), unitInfo.Description, councillor.Description), g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_COUNCILLOR_APPOINTED_SHORT_TEXT"), false, nil, nil)
		Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_VERY_GOOD");
	end
	LuaEvents.JFD_CouncillorAppointed(player:GetID(), councillor.ID, name)

end
----------------------------------------------------------------------------------------------------------------------------
--Player:GetCouncillorName
function Player.GetCouncillorName(player, councillorID)
	local playerID = player:GetID()
	local councillor = GameInfo.JFD_Councillors[councillorID]
    return load( player, "COUNCILLOR_"  .. councillor.Type .. "_NAME") or "Minister"
end
----------------------------------------------------------------------------------------------------------------------------
--Player:SetCouncillorName
function Player.SetCouncillorName(player, councillorID, strName)
	local playerID = player:GetID()
	local councillor = GameInfo.JFD_Councillors[councillorID]
	save( player, "COUNCILLOR_"  .. councillor.Type .. "_NAME", strName)
end

------------------------------------------------------------------------------------------------------------------------
--UNIQUES UTILS
------------------------------------------------------------------------------------------------------------------------
--Player:GetUniqueBuilding
function Player.GetUniqueBuilding(player, buildingClass)
	local buildingType = nil
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
 
	for uniqueBuilding in GameInfo.Civilization_BuildingClassOverrides{CivilizationType = civType, BuildingClassType = buildingClass} do
		buildingType = uniqueBuilding.BuildingType
		break
	end
 
	if (not buildingType) then
		buildingType = GameInfo.BuildingClasses[buildingClass].DefaultBuilding
	end
 
	return buildingType
end

--------------------------------------------------------------------------------------------------------------------------
--Player:GetUniqueUnit
function Player.GetUniqueUnit(player, unitClass)
	local unitType = nil
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
 
	for uniqueUnit in GameInfo.Civilization_UnitClassOverrides{CivilizationType = civType, UnitClassType = unitClass} do
		unitType = uniqueUnit.UnitType
		break
	end
 
	if (not unitType) then
		unitType = GameInfo.UnitClasses[unitClass].DefaultUnit
	end
 
	return unitType
end
--==========================================================================================================================
--==========================================================================================================================