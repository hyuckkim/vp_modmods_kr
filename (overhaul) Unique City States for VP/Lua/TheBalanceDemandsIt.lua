include("FLuaVector.lua")

-- 43 variables so far coded (max 60)
local L = Locale.ConvertTextKey
local bBlockDoubleTriggering = false -- for preventing the double triggering the UnitPrekill event and other functions

local eSphere = GameInfoTypes.RESOLUTION_SPHERE_OF_INFLUENCE
local eArtifactRuin = GameInfoTypes.ARTIFACT_ANCIENT_RUIN

local tUCSDefines = {
	-- for abilities
	["ThresholdPseudoAllies"] = 600,				-- 7.5 * GameDefines.FRIENDSHIP_THRESHOLD_ALLIES
	-- for unique luxury resources related to traits
	["NumCityStatesForFirstThreshold"] = 0,
	["NumCityStatesForSecondThreshold"] = 5,
	["NumCityStatesForThirdThreshold"] = 10,
	["CityStateLuxuryChanceThreshold"] = 85,
	["CityStateLuxuryChanceThresholdRare"] = 10,
	-- for unit gifts
	["CityStateUnitChanceThreshold"] = 1,		-- per 100
	-- for GW gifts
	["CityStateGreatWorkChanceThreshold"] = 5	-- per 1000
}

-- city-states IDs
local tLostCities = {} 

-- for optional features (passives)
local tSettings = {}

-- for events to start
local tConditionsForActiveAbilities = {
	["WithAlliance"] = true,
	["FromEmbassy"] = true,
	["FromHighInluenceLevel"] = true
}
local tEmbassies = {}

local tMinorTraits = {
	GameInfoTypes.MINOR_TRAIT_MARITIME,
	GameInfoTypes.MINOR_TRAIT_MERCANTILE,
	GameInfoTypes.MINOR_TRAIT_MILITARISTIC,
	GameInfoTypes.MINOR_TRAIT_CULTURED,
	GameInfoTypes.MINOR_TRAIT_RELIGIOUS
}

local tMinorPersonalities = {
	MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_FRIENDLY,
	MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_NEUTRAL,
	MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_HOSTILE,
	MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_IRRATIONAL
}

local tEventChoice = {
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_BOGOTA, -- 1
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_CAPE_TOWN,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_MANILA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH, -- 6
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SIDON,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_OC_EO,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_THIMPHU,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_ANDORRA, -- 11
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_CANOSSA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_LEVUKA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_DALI,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_RISHIKESH,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_ISKANWAYA, -- 16
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_TIWANAKU,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_HONG_KONG,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL, -- 21
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_TYRE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_KABUL,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY, -- 26
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SYDNEY,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_GWYNEDD,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SINGAPORE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_RAGUSA, -- 31
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_VATICAN_CITY,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_KATHMANDU,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_IFE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_GENEVA, -- 36
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_GENOA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SIERRA_LEONE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_KARYES,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SGANG_GWAAY,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_NYARYANA_MARQ, -- 41
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_WOOTEI_NIICIE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_LAHORE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_DAKKAR,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_POKROVKA, -- 46
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_OUIDAH,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_HONIARA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_JUYUBIT,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SANAA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_PELYM, -- 51
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_KATENDE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_LONGYAN,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_KARASJOHKA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_AYUTTHAYA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SARNATH, -- 56
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_PALMYRA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_AL_TIRABIN,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_HANUABADA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_BALKH, -- 61
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_CLERMONT,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_MENDYARRUP,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_JETARKTE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SADDARVAZEH,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_IRUNEA, -- 66
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_TUNIS
}

local tBuildingsActiveAbilities = {
	GameInfoTypes.BUILDING_LHASA, -- 1
	GameInfoTypes.BUILDING_OC_EO_2,
	GameInfoTypes.BUILDING_OC_EO_3,
	GameInfoTypes.BUILDING_THIMPHU,
	GameInfoTypes.BUILDING_THIMPHU_2,
	GameInfoTypes.BUILDING_ANDORRA_2, -- 6
	GameInfoTypes.BUILDING_CANOSSA,
	GameInfoTypes.BUILDING_WOOTEI_NIICIE_2, -- inserted instead temple
	GameInfoTypes.BUILDING_LEVUKA,
	GameInfoTypes.BUILDING_JERUSALEM,
	GameInfoTypes.BUILDING_RISHIKESH_2, -- 11
	GameInfoTypes.BUILDING_WELLINGTON_HORSE,
	GameInfoTypes.BUILDING_WELLINGTON_IRON,
	GameInfoTypes.BUILDING_WELLINGTON_COAL,
	GameInfoTypes.BUILDING_WELLINGTON_OIL,
	GameInfoTypes.BUILDING_WELLINGTON_ALUMINUM, -- 16
	GameInfoTypes.BUILDING_WELLINGTON_URANIUM,
	GameInfoTypes.BUILDING_WELLINGTON_PAPER,
	GameInfoTypes.BUILDING_RAGUSA_2,
	GameInfoTypes.BUILDING_KARYES,
	GameInfoTypes.BUILDING_OUIDAH, -- 21
	GameInfoTypes.BUILDING_SANAA,
	GameInfoTypes.BUILDING_PELYM,
	GameInfoTypes.BUILDING_KATENDE,
	GameInfoTypes.BUILDING_KATENDE_2,
	GameInfoTypes.BUILDING_SARNATH_2, -- 26
	GameInfoTypes.BUILDING_LONGYAN,
	GameInfoTypes.BUILDING_PALMYRA_2,	
	GameInfoTypes.BUILDING_KARYES_2,
	GameInfoTypes.BUILDING_AL_TIRABIN,
	GameInfoTypes.BUILDING_JETARKTE, -- 31
	GameInfoTypes.BUILDING_SADDARVAZEH,
	GameInfoTypes.BUILDING_IRUNEA
}

local tBuildingClasses = {
	GameInfoTypes.BUILDINGCLASS_TEMPLE,
	GameInfoTypes.BUILDINGCLASS_CARAVANSARY,
	GameInfoTypes.BUILDINGCLASS_COURT_SCRIBE,
	GameInfoTypes.BUILDINGCLASS_PRINTING_PRESS,
	GameInfoTypes.BUILDINGCLASS_FOREIGN_OFFICE
}

local tPromotionsActiveAbilities = {
	GameInfoTypes.PROMOTION_ISKANWAYA, -- 1
	GameInfoTypes.PROMOTION_KABUL,
	GameInfoTypes.PROMOTION_GUARDIA_SVIZZERA,
	GameInfoTypes.PROMOTION_KATZBALGER,
	GameInfoTypes.PROMOTION_SIKH,
	GameInfoTypes.PROMOTION_SIKH_SWORD, -- 6
	GameInfoTypes.PROMOTION_SIKH_KNIFE,
	GameInfoTypes.PROMOTION_SIKH_DISC,
	GameInfoTypes.PROMOTION_SIKH_BOW,
	GameInfoTypes.PROMOTION_SIKH_TRIDENT,
	GameInfoTypes.PROMOTION_SIKH_DAGGER, -- 11
	GameInfoTypes.PROMOTION_SIKH_MUSKET,
	GameInfoTypes.PROMOTION_SIKH_SHIELD,
	GameInfoTypes.PROMOTION_SIKH_CHAINMAIL,
	GameInfoTypes.PROMOTION_SIKH_ROBE,
	GameInfoTypes.PROMOTION_SIKH_SHOES, -- 16
	GameInfoTypes.PROMOTION_SIKH_TURBAN,
	GameInfoTypes.PROMOTION_SIKH_MARTIAL_ART,
	GameInfoTypes.PROMOTION_SIKH_BRACELET,
	GameInfoTypes.PROMOTION_DAKKAR,
	GameInfoTypes.PROMOTION_CLERMONT1, -- 21
	GameInfoTypes.PROMOTION_CLERMONT2,
	GameInfoTypes.PROMOTION_CLERMONT3,
	GameInfoTypes.PROMOTION_CLERMONT4,
	GameInfoTypes.PROMOTION_CLERMONT5,
	GameInfoTypes.PROMOTION_CLERMONT6, -- 26
	GameInfoTypes.PROMOTION_CLERMONT7,
	GameInfoTypes.PROMOTION_MENDYARRUP
}

local tBuildingsPassiveAbilities = {
	GameInfoTypes.BUILDING_CS_STRENGTH_FRIENDLY, -- 1
	GameInfoTypes.BUILDING_CS_STRENGTH_NEUTRAL,
	GameInfoTypes.BUILDING_CS_STRENGTH_HOSTILE,
	GameInfoTypes.BUILDING_CS_RELIGION_FRIENDLY,
	GameInfoTypes.BUILDING_CS_RELIGION_NEUTRAL,
	GameInfoTypes.BUILDING_CS_RELIGION_HOSTILE, -- 6
	GameInfoTypes.BUILDING_CS_RELIGION_IRRATIONAL
}

local tPoliciesPassiveAbilities = {
	GameInfoTypes.POLICY_CS_MARITIME,
	GameInfoTypes.POLICY_CS_MERCANTILE,
	GameInfoTypes.POLICY_CS_MILITARISTIC,
	GameInfoTypes.POLICY_CS_CULTURED,
	GameInfoTypes.POLICY_CS_RELIGIOUS
}

local tImprovementsRegular = {
	GameInfoTypes.IMPROVEMENT_CAMP,
	GameInfoTypes.IMPROVEMENT_PLANTATION,
	GameInfoTypes.IMPROVEMENT_TRADING_POST
}

local tImprovementsUCS = {
	GameInfoTypes.IMPROVEMENT_MOUND,		-- 1
	GameInfoTypes.IMPROVEMENT_SUNK_COURT,
	GameInfoTypes.IMPROVEMENT_MONASTERY,
	GameInfoTypes.IMPROVEMENT_TOTEM_POLE,
	GameInfoTypes.IMPROVEMENT_CHUM,
	GameInfoTypes.IMPROVEMENT_TULOU,		-- 6
	GameInfoTypes.IMPROVEMENT_DOGO_CANARIO,	-- dummy
	GameInfoTypes.IMPROVEMENT_LLAO_LLAO,	-- dummy
	GameInfoTypes.IMPROVEMENT_MARSH,		-- dummy
	GameInfoTypes.IMPROVEMENT_CITY,			-- dummy
	GameInfoTypes.IMPROVEMENT_FUNERARY_TOWER, -- 11
	GameInfoTypes.IMPROVEMENT_BEDOUIN_CAMP,
	GameInfoTypes.IMPROVEMENT_DAAQ_AH,
	GameInfoTypes.IMPROVEMENT_PHROURION,
	GameInfoTypes.IMPROVEMENT_RIBAT
}

local tImprovementsGreatPeople = {
	GameInfoTypes.IMPROVEMENT_EMBASSY,
	GameInfoTypes.IMPROVEMENT_HOLY_SITE,
	GameInfoTypes.IMPROVEMENT_FORT,
	GameInfoTypes.IMPROVEMENT_MANUFACTORY,
	GameInfoTypes.IMPROVEMENT_CUSTOMS_HOUSE,
	GameInfoTypes.IMPROVEMENT_ACADEMY
}

local tFeatureTypes = {
	GameInfoTypes.FEATURE_FOREST,
	GameInfoTypes.FEATURE_JUNGLE,
	GameInfoTypes.FEATURE_MARSH,
	GameInfoTypes.FEATURE_OASIS,
	GameInfoTypes.FEATURE_FLOOD_PLAINS,
	GameInfoTypes.FEATURE_ICE,
	GameInfoTypes.FEATURE_FALLOUT
}

local tTerrainTypes = {
	GameInfoTypes.TERRAIN_SNOW,
	GameInfoTypes.TERRAIN_TUNDRA,
	GameInfoTypes.TERRAIN_COAST,
	GameInfoTypes.TERRAIN_OCEAN,
	GameInfoTypes.TERRAIN_GRASS,
	GameInfoTypes.TERRAIN_PLAINS,
	GameInfoTypes.TERRAIN_DESERT
}

local tPlotTypes = {
	GameInfoTypes.PLOT_LAND,
	GameInfoTypes.PLOT_HILLS,
	GameInfoTypes.PLOT_MOUNTAIN,
	GameInfoTypes.PLOT_OCEAN
}

local tDomainTypes = {
	GameInfoTypes.DOMAIN_LAND,
	GameInfoTypes.DOMAIN_SEA,
	GameInfoTypes.DOMAIN_AIR
}

local tSpecialistTypes = {
	GameInfoTypes.SPECIALIST_SCIENTIST,
	GameInfoTypes.SPECIALIST_ENGINEER,
	GameInfoTypes.SPECIALIST_MERCHANT,
	GameInfoTypes.SPECIALIST_ARTIST,
	GameInfoTypes.SPECIALIST_WRITER,
	GameInfoTypes.SPECIALIST_MUSICIAN,
	GameInfoTypes.SPECIALIST_CITIZEN,
	GameInfoTypes.SPECIALIST_CIVIL_SERVANT
}

local tUnitsGreatPeople = {
	GameInfoTypes.UNIT_SCIENTIST,
	GameInfoTypes.UNIT_ENGINEER,
	GameInfoTypes.UNIT_MERCHANT,
	GameInfoTypes.UNIT_ARTIST,
	GameInfoTypes.UNIT_WRITER,
	GameInfoTypes.UNIT_MUSICIAN,
	GameInfoTypes.UNIT_GREAT_DIPLOMAT,
	GameInfoTypes.UNIT_GREAT_GENERAL,
	GameInfoTypes.UNIT_GREAT_ADMIRAL,
	GameInfoTypes.UNIT_PROPHET
}

local tUnitsCivilian = {
	GameInfoTypes.UNIT_WORKER,
	GameInfoTypes.UNIT_WORKBOAT,
	GameInfoTypes.UNIT_MISSIONARY,
	GameInfoTypes.UNIT_ARCHAEOLOGIST,
	GameInfoTypes.UNIT_CARAVAN,
	GameInfoTypes.UNIT_CARGO_SHIP,
	GameInfoTypes.UNIT_CARAVAN_OF_DALI,
	GameInfoTypes.UNIT_CARGO_SHIP_OF_DALI, -- unused because of VP's dll constraints (Spain)
	GameInfoTypes.UNIT_SISQENO,
	GameInfoTypes.UNIT_SISQENO_WORKER,
	GameInfoTypes.UNIT_TEAAT
}	

local tUnitsMilitary = {
	GameInfoTypes.UNIT_SWISS_GUARD,
	GameInfoTypes.UNIT_GURKHA,
	GameInfoTypes.UNIT_NIHANG,
	GameInfoTypes.UNIT_SAKA
}

local tResourcesBonus = {
	GameInfoTypes.RESOURCE_DEER,
	GameInfoTypes.RESOURCE_REINDEER,
	GameInfoTypes.RESOURCE_COW,
	GameInfoTypes.RESOURCE_SHEEP
}

local tResourcesLuxury = {
	GameInfoTypes.RESOURCE_DOGO_CANARIO,
	GameInfoTypes.RESOURCE_LLAO_LLAO,
	GameInfoTypes.RESOURCE_IVORY
}

local tResourcesStrategic = {
	GameInfoTypes.RESOURCE_HORSE,
	GameInfoTypes.RESOURCE_IRON,
	GameInfoTypes.RESOURCE_COAL,
	GameInfoTypes.RESOURCE_OIL,
	GameInfoTypes.RESOURCE_ALUMINUM,
	GameInfoTypes.RESOURCE_URANIUM,
	GameInfoTypes.RESOURCE_PAPER
}

local eResourceArtifact = GameInfoTypes.RESOURCE_ARTIFACTS

local tTechnologyTypes = {
	GameInfoTypes.TECH_ARCHAEOLOGY,
	GameInfoTypes.TECH_RADIO,
	GameInfoTypes.TECH_TELECOM,
	GameInfoTypes.TECH_HORSEBACK_RIDING,
	GameInfoTypes.TECH_HORSEBACK_RIDING_UCS_DUMMY
}

local tDirectionTypes = {
	DirectionTypes.DIRECTION_NORTHEAST,
	DirectionTypes.DIRECTION_EAST,
	DirectionTypes.DIRECTION_SOUTHEAST,
	DirectionTypes.DIRECTION_SOUTHWEST,
	DirectionTypes.DIRECTION_WEST,
	DirectionTypes.DIRECTION_NORTHWEST
}


-- specific variables needed for some specific City-State abilities (reduced to a minimum to save variables)
-- ZURICH - it should be stored, but there's additional notification about the lost data (workaround), it's not so important
local tZurichLastInterests = {}
local tZurichCounter = {}
-- PRAGUE
local tUnitsWithSpread = {}
	for unit in DB.Query("SELECT Units.ID FROM Units WHERE SpreadReligion = 1") do
		table.insert(tUnitsWithSpread, unit.ID)
	end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- look for major city --> city-states conflicts
local tCityConflicts = {}

-- loop through all conflicts in the game printing all the conflicts found
function ConflictsTest()
	print("XXXXXXXXXXXXXXXXXXXXXX")
	print("CONFLICTS_TEST")
	for civilization in DB.Query("SELECT Civilizations.Type FROM Civilizations") do
		for citystate in DB.Query("SELECT MinorCivilizations.Type, MinorCivilizations.Description FROM MinorCivilizations") do
			for citylist in DB.Query("SELECT Civilization_CityNames.CityName FROM Civilization_CityNames WHERE CivilizationType = ?", civilization.Type) do
				sMajorCityName = L(citylist.CityName)
				sMinorCityName = L(citystate.Description)
				
				if sMajorCityName == sMinorCityName then
					print("BASE_CONFLICT", civilization.Type, citystate.Type)	
				end
			end
		end
	end
end
ConflictsTest()

function Conflicts()
	print("XXXXXXXXXXXXXXXXXXXXXX")
	print("CONFLICTS")
	for emajorplayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pMajorPlayer = Players[emajorplayer]
		
		if not pMajorPlayer:IsEverAlive() then return end

		for eminorplayer = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
			local pMinorPlayer = Players[eminorplayer]
				
			if pMinorPlayer:IsMinorCiv() then
				local sMinorCapitalName = L(GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Description)
				
				for citylist in DB.Query("SELECT Civilization_CityNames.CityName FROM Civilization_CityNames WHERE CivilizationType = ?", GameInfo.Civilizations[pMajorPlayer:GetCivilizationType()].Type) do
					if L(citylist.CityName) == sMinorCapitalName then
						print("CONFLICT_SET!!!", sMinorCapitalName)	
						print("XXXXXXXXXXXXXXXXXXXXXX")
						tCityConflicts[eminorplayer] = true
						break
					end
				end
			end
		end
	end
end
Conflicts()

function SubstituteConflictingCityStates(ePlayer, iX, iY)
	if not tCityConflicts[ePlayer] then return end
	
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local pPlot = Map.GetPlot(iX, iY)
	local pCity = pPlot:GetPlotCity()
	local eNewOwner = nil
	print("XXXXXXXXXXXXXXXXXXXXXX")
	print("CS_FOUNDED", "CONFLICT_CODE_APPLIED!!!", pCity:GetName())
	repeat	
		print("----------------------")
		print("CS_FOUNDED", "NEW_LOOP_STARTED...")
		local ePreviousOwner = pPlot:GetOwner()
		Game.DoSpawnFreeCity(pCity)

		pCity = pPlot:GetPlotCity()
		eNewOwner = pPlot:GetOwner()
		local pNewOwner = Players[eNewOwner]
		local sNewName = L(GameInfo.MinorCivilizations[pNewOwner:GetMinorCivType()].Description)
		
		pCity:SetName(sNewName)
		
		if ePlayer == eNewOwner then 
			-- in case when there are no free CS spots;
			print("CS_FOUNDED", "OWNERSHIP_CANNOT_BE_CHANGED!!!")
			for emajorplayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
				local pMajorPlayer = Players[emajorplayer]
				local pMajorCapital = pMajorPlayer:GetCapitalCity()
			
				if pMajorPlayer:IsHuman() then
					pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_CONFLICT", pCity:GetName()), L("TXT_KEY_UCS_CONFLICT_TITLE"), pMajorCapital:GetX(), pMajorCapital:GetY())
				end
			end
			
			return
		end 
		
		print("CS_FOUNDED", "OWNERSHIP_CHANGED_FROM...", ePreviousOwner, "TO...", eNewOwner)
		print("CS_FOUNDED", "CHANGED_NAME_TO...", pCity:GetName())
		
		RepeatableCheckConflicts(eNewOwner)
		print("CS_FOUNDED", "NEW_OWNER_CONFLICT?", tCityConflicts[eNewOwner])
	until(not tCityConflicts[eNewOwner])
	
	for emajorplayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pMajorPlayer = Players[emajorplayer]
		local pMajorCapital = pMajorPlayer:GetCapitalCity()
		
		if pMajorPlayer:IsHuman() then
			pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_CONFLICT_RESOLVED"), L("TXT_KEY_UCS_CONFLICT_RESOLVED_TITLE"), pMajorCapital:GetX(), pMajorCapital:GetY())
		end
	end
	
	MaritimeCityStatesBonuses(eNewOwner, iX, iY)
	MercantileCityStatesBonuses(eNewOwner, iX, iY)
	MilitaristicCityStatesBonuses(eNewOwner, iX, iY)
	CulturedCityStatesBonuses(eNewOwner, iX, iY)
	ReligiousCityStatesBonuses(eNewOwner, iX, iY)

	SettledCityStateWithBuilding(eNewOwner, iX, iY)
end
GameEvents.PlayerCityFounded.Add(SubstituteConflictingCityStates)

function RepeatableCheckConflicts(ePlayer)
	print("++++++++++++++++++++++")
	for emajorplayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pMajorPlayer = Players[emajorplayer]
		
		if not pMajorPlayer:IsEverAlive() then return end

		local pMinorPlayer = Players[ePlayer]
		local sMinorCapitalName = L(GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Description)
		
		for citylist in DB.Query("SELECT Civilization_CityNames.CityName FROM Civilization_CityNames WHERE CivilizationType = ?", GameInfo.Civilizations[pMajorPlayer:GetCivilizationType()].Type) do
			if L(citylist.CityName) == sMinorCapitalName then
				print("NEW_CONFLICT_SET!!!", sMinorCapitalName)
				print("++++++++++++++++++++++")
				tCityConflicts[ePlayer] = true
				break
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- automated CS UU gifts for any changes made by other modmods, f.e. MUC
-- VP+MUC: Sipahi, Companion Cavalry, Norwegian Ski Infantry, Battering Ram, Pracinha
-- VP only: Longbowman, Ballista, Turtle Ship, Hakkapeliitta, Great Galleass
local tUniqueUnitsFromMinors = {}

for specialUnit in DB.Query("SELECT Units.ID, Units.Type, Units.Description, Units.PrereqTech FROM Units WHERE MinorCivGift = 1") do
	local iBaseUnitID, sBaseUnitType = 1000, ""
	
	local sUpgradesToClass = GameInfo.Unit_ClassUpgrades{UnitType=specialUnit.Type}().UnitClassType
	
	for upgrade in DB.Query("SELECT Unit_ClassUpgrades.UnitType FROM Unit_ClassUpgrades WHERE UnitClassType = ?", sUpgradesToClass) do
		local bMercenary = GameInfo.Units{Type=upgrade.UnitType}().PurchaseOnly == true or GameInfo.Units{Type=upgrade.UnitType}().PurchaseOnly == 1
		
		if not bMercenary then
			local eUnit = GameInfo.Units{Type=upgrade.UnitType}().ID
			
			if eUnit < iBaseUnitID then
				iBaseUnitID = eUnit
				sBaseUnitType = upgrade.UnitType
			end
		end
	end
	--print("CS_UU_GIFTS", L(specialUnit.Description), sUpgradesToClass, specialUnit.PrereqTech, sBaseUnitType)

	tUniqueUnitsFromMinors[specialUnit.ID] = {
		sOriginalUnit = sBaseUnitType,
		ePrereqTech = GameInfo.Technologies{Type=specialUnit.PrereqTech}().ID					
	}
end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- RNG
function RandomNumberBetween(iLower, iHigher)
    return (Game.Rand((iHigher + 1) - iLower, "")) + iLower
end

-- Position Calculator for custom positioning of floating text prompts (yields, additional info)
function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

-- Notifications for CS passive gifts
function UnitNotificationLoad(pMinorPlayer, pMajorPlayer, sUnitName, eUnitType)
	pMajorCapitalCity = pMajorPlayer:GetCapitalCity()
	pMinorCapitalCity = pMinorPlayer:GetCapitalCity()
	sMinorCityName = pMinorCapitalCity:GetName()

	if pMajorPlayer:IsHuman() then
		pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, L("TXT_KEY_UCS_PASSIVES_GIFTS", sUnitName, sMinorCityName), L("TXT_KEY_UCS_PASSIVES_GIFTS_TITLE"), pMajorCapitalCity:GetX(), pMajorCapitalCity:GetY(), eUnitType, false)
	end
end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- Resetting cooldown for active events for civs passing the threshold and setting new events
function MinorPlayerDoTurn(ePlayer)
	local pMinorPlayer = Players[ePlayer]
		
	if pMinorPlayer:IsMinorCiv() and pMinorPlayer:IsAlive() then
		local sMinorCivType = GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type
		
		-- Ally part
		if tConditionsForActiveAbilities["WithAlliance"] then
			if pMinorPlayer:GetAlly() ~= -1 then 
				local pMajorPlayer = Players[pMinorPlayer:GetAlly()]
				
				if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) ~= 0 then
					pMajorPlayer:SetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType], 3)
				end 
				
				if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) == 0 and not pMajorPlayer:IsEventChoiceActive(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) then
					pMajorPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType])
					
					if pMajorPlayer:IsHuman() then
						pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_ALLY", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_ALLY_TITLE"), pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
					end
				end
			end
		end
		
		-- Embassy part
		if tConditionsForActiveAbilities["FromEmbassy"] then
			if pMinorPlayer:GetImprovementCount(tImprovementsGreatPeople[1]) > 0 then
				if tEmbassies[ePlayer] == nil then
					local pMinorCapital = pMinorPlayer:GetCapitalCity()
					
					for i = 0, pMinorCapital:GetNumCityPlots() - 1, 1 do
						local pPlot = pMinorCapital:GetCityIndexPlot(i)
					   
					    if pPlot and pPlot:GetOwner() == ePlayer and pPlot:GetImprovementType() == tImprovementsGreatPeople[1] then
							tEmbassies[ePlayer] = pPlot:GetPlayerThatBuiltImprovement()
							break
						end
					end
				end
				
				local pMajorPlayer = Players[tEmbassies[ePlayer]]

				if pMajorPlayer:IsAtWarWith(ePlayer) then return end
				
				if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) ~= 0 then
					pMajorPlayer:SetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType], 3)
				end 
				
				if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) == 0 and not pMajorPlayer:IsEventChoiceActive(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) then
					pMajorPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType])
					
					if pMajorPlayer:IsHuman() then
						pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_EMBASSY", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_EMBASSY_TITLE"), pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
					end
				end
			end
		end
		
		-- pseudoAlly part
		if tConditionsForActiveAbilities["FromHighInluenceLevel"] then
			for eplayer, pplayer in ipairs(Players) do
				if pplayer and pplayer:IsAlive() then
					if pplayer:IsMinorCiv() then break end
					if not pplayer:IsEverAlive() then break end
					
					if pMinorPlayer:GetMinorCivFriendshipWithMajor(eplayer) >= tUCSDefines["ThresholdPseudoAllies"] then
						--print("PSEUDO_ALLIES", pMinorPlayer:GetName(), pplayer:GetName(), pMinorPlayer:GetMinorCivFriendshipWithMajor(eplayer))
						if pplayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) ~= 0 then
							pplayer:SetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType], 3)
						end
						
						if pplayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) == 0 and not pplayer:IsEventChoiceActive(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) then
							pplayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType])
							
							if pplayer:IsHuman() then
								pplayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_INFLUENCE", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_INFLUENCE_TITLE"), pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(MinorPlayerDoTurn)

-- Setting events after Sphere of Influence voting
function MovingSwiftly(eResolution, eProposer, eChoice, bEnact, bPassed)
	if eResolution == eSphere then
		local pMinorPlayer = Players[eChoice]
		local pMajorPlayer = Players[eProposer]
	
		if bEnact and bPassed then
			if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type]) == 0 then
				pMajorPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type])	
			end
		end
	end
end
GameEvents.ResolutionResult.Add(MovingSwiftly)

-- Border expansion on Diplo Actions
function DiplomaticExpansion(eUnitOwner, eUnit, eUnitType, iX, iY, bDelay, eKillerPlayer)
	if not bDelay or eKillerPlayer ~= -1 then return end
	
	local pPlayer = Players[eUnitOwner]

	if pPlayer:IsMinorCiv() then return end
	
	local pUnit = pPlayer:GetUnitByID(eUnit)
	local bIsGreatDiplomat = pUnit:GetUnitType() == tUnitsGreatPeople[7]
	local bIsDiploUnit = pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_DIPLOMACY

	if bIsDiploUnit or bIsGreatDiplomat then
		local iInfluence = 0
		local iEraBoost = (bIsGreatDiplomat and 20 or 0) * pPlayer:GetCurrentEra()
		local iModifier = 0

		for promotion in DB.Query("SELECT UnitPromotions.ID, UnitPromotions.DiploMissionInfluence FROM UnitPromotions WHERE DiploMissionInfluence > 0") do
			if pUnit:IsHasPromotion(promotion.ID) then
				iInfluence = iInfluence + promotion.DiploMissionInfluence
			end
		end

		for policy in DB.Query("SELECT Policies.ID, Policies.MissionInfluenceModifier FROM Policies WHERE MissionInfluenceModifier > 0") do
			if pPlayer:HasPolicy(policy.ID) then
				iModifier = iModifier + policy.MissionInfluenceModifier
			end
		end

		local iTotalInfluence = (iInfluence + iEraBoost) * (1 + (iModifier / 100))
		local iBorderGrowthBonus = iTotalInfluence / 10
		local pPlot = Map.GetPlot(iX, iY)
		local pMinorCity = pPlot:GetWorkingCity()
		local pMinorPlayer = Players[pPlot:GetOwner()]
		
		if pMinorCity and pMinorPlayer then
			local eMinorPersonality = pMinorPlayer:GetPersonality()

			if tSettings["EnablePassivesBorderGrowth"] then
				pMinorCity:ChangeJONSCultureStored(iBorderGrowthBonus)
			end
		
			if tSettings["EnablePassivesHitPoints"] then
				local iRandomHPGain = 0

				if eMinorPersonality == tMinorPersonalities[4] then
					iRandomHPGain = Game.Rand(3, "Random HP Gain for Irrational CSs") + 1
				end

				if eMinorPersonality == tMinorPersonalities[1] or iRandomHPGain == 1 then
					pMinorCity:SetNumRealBuilding(tBuildingsPassiveAbilities[1], pMinorCity:GetNumRealBuilding(tBuildingsPassiveAbilities[1]) + 1)
				elseif eMinorPersonality == tMinorPersonalities[2] or iRandomHPGain == 2  then
					pMinorCity:SetNumRealBuilding(tBuildingsPassiveAbilities[2], pMinorCity:GetNumRealBuilding(tBuildingsPassiveAbilities[2]) + 1)
				elseif eMinorPersonality == tMinorPersonalities[3] or iRandomHPGain == 3  then
					pMinorCity:SetNumRealBuilding(tBuildingsPassiveAbilities[3], pMinorCity:GetNumRealBuilding(tBuildingsPassiveAbilities[3]) + 1)
				end
			end
		end
	end
end
GameEvents.UnitPrekill.Add(DiplomaticExpansion)

-- Setting the specicifc removing conditions for UCSTI
function CanWeSubstituteImprovement(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild == GameInfoTypes.BUILD_ROAD or eBuild == GameInfoTypes.BUILD_RAILROAD or eBuild == GameInfoTypes.BUILD_REMOVE_ROUTE
	or eBuild == GameInfoTypes.BUILD_REPAIR or eBuild == GameInfoTypes.BUILD_SCRUB_FALLOUT 
	or eBuild == GameInfoTypes.BUILD_LANDMARK or eBuild == GameInfoTypes.BUILD_ARCHAEOLOGY_DIG then return true end
	
	local pPlot = Map.GetPlot(iX, iY)
	local eResourceTypeUnderneath = pPlot:GetResourceType()
	local eCurrentImprovementType = pPlot:GetImprovementType()

	local pPlayer = Players[ePlayer]
		
	if not pPlayer:IsHuman() then
		if eCurrentImprovementType ~= -1 then
			for i, eimprovement in ipairs(tImprovementsUCS) do
				if eimprovement == eCurrentImprovementType then				
					if eResourceTypeUnderneath ~= -1 then
						local sTech = GameInfo.Resources[eResourceTypeUnderneath].TechReveal
						
						if sTech then
							local eTech = GameInfo.Technologies{Type=sTech}().ID
							local pTeam = Teams[Players[ePlayer]:GetTeam()]
							
							return pTeam:IsHasTech(eTech)
						else
							return true
						end
					else
						return false -- when there's no resource on the tile, so you cannot replace
					end
				end
			end
			
			return true -- when improvement is not the UCS improvement
		else
			return true -- when there's no improvement on the tile
		end
	else
		return true -- is human
	end
end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- Unique stuff for CSs types and personalities
-- Common Variables
local tChosenMaritimeLuxuries = {}
local tChosenMilitaristicLuxuries = {}
local tChosenCulturedLuxuries = {}
local tChosenReligiousLuxuries = {}

-- MARITIME
function InitializeMaritimeResources()
	local tMaritimeLuxuries = {
		GameInfoTypes.RESOURCE_BEER,
		GameInfoTypes.RESOURCE_CHEESE,
		GameInfoTypes.RESOURCE_HONEY,
		GameInfoTypes.RESOURCE_ROPES
	}
	
	local iNumMaritimeCityStates = 0
	
	for eplayer = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pMaritimeMinor = Players[eplayer]
		
		if pMaritimeMinor:IsAlive() then
			local eMaritimeTrait = pMaritimeMinor:GetMinorCivTrait()
			
			if eMaritimeTrait == tMinorTraits[1] then
				iNumMaritimeCityStates = iNumMaritimeCityStates + 1
			end
		end
	end
	
	if iNumMaritimeCityStates > tUCSDefines["NumCityStatesForFirstThreshold"] then
		table.insert(tChosenMaritimeLuxuries, table.remove(tMaritimeLuxuries, Game.Rand(#tMaritimeLuxuries, "Choose 1st of all available luxuries") + 1))
	end
	
	if #tMaritimeLuxuries > 0 then
		if iNumMaritimeCityStates > tUCSDefines["NumCityStatesForSecondThreshold"] then
			table.insert(tChosenMaritimeLuxuries, table.remove(tMaritimeLuxuries, Game.Rand(#tMaritimeLuxuries, "Choose 2nd of all available luxuries") + 1))
		end
	end
	
	if #tMaritimeLuxuries > 0 then
		if iNumMaritimeCityStates > tUCSDefines["NumCityStatesForThirdThreshold"] then
			table.insert(tChosenMaritimeLuxuries, table.remove(tMaritimeLuxuries, Game.Rand(#tMaritimeLuxuries, "Choose 3rd of all available luxuries") + 1))
		end
	end

	if #tChosenMaritimeLuxuries == 0 then
		print("LUX_INIT_MARITIME_0_ERROR", iNumMaritimeCityStates, #tMaritimeLuxuries)
	end
end

function MaritimeCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer then return end
	if not pPlayer:IsMinorCiv() then return end
	if not pPlayer:IsAlive() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Maritime
	if eMinorTrait ~= tMinorTraits[1] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	local iCapitalX = pMinorCapital:GetX()
	local iCapitalY = pMinorCapital:GetY()
	
	if iCapitalX ~= iX or iCapitalY ~= iY then return end

	-- Bonus Resource
	if tSettings["EnablePassivesTileResources"] then
		local tBonusResourcesIDs = {}
		local tBonusResourcesTypes = {}
		local bBonusPlaced = false
	
		for resource in GameInfo.Resources{ResourceClassType="RESOURCECLASS_BONUS"} do
			table.insert(tBonusResourcesIDs, resource.ID)
			table.insert(tBonusResourcesTypes, resource.Type)
		end
	
		repeat
			local iRandomResource = RandomNumberBetween(1, #tBonusResourcesIDs)
			local eChosenResource = tBonusResourcesIDs[iRandomResource]
			local tBonusResourceFeatures = {}
			local tBonusResourceTerrains = {}
		
			for row in GameInfo.Resource_FeatureBooleans{ResourceType=tBonusResourcesTypes[iRandomResource]} do
				table.insert(tBonusResourceFeatures, row.FeatureType)
			end
			for row in GameInfo.Resource_TerrainBooleans{ResourceType=tBonusResourcesTypes[iRandomResource]} do
				table.insert(tBonusResourceTerrains, row.TerrainType)
			end	
		
			for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
				local pPlot = pMinorCapital:GetCityIndexPlot(i)
			
				if pPlot then
					local bIsCity = pPlot:IsCity()
					local eImprovement = pPlot:GetImprovementType()
					local eResource = pPlot:GetResourceType()
					local eFeature = pPlot:GetFeatureType()
					local eTerrain = pPlot:GetTerrainType()
					local bFeaturePass = false
					local bTerrainPass = false
				
					if not bIsCity and eResource == -1 and eImprovement == -1 then
						if #tBonusResourceFeatures == 0 and eFeature == -1 then
							bFeaturePass = true
						else
							for i, value in ipairs(tBonusResourceFeatures) do
								if eFeature == FeatureTypes[value] then
									bFeaturePass = true
									break
								end
							end
						end
					
						if #tBonusResourceTerrains == 0 then
							bFeaturePass = true
						else
							for i, value in ipairs(tBonusResourceTerrains) do
								if eTerrain == TerrainTypes[value] then
									bTerrainPass = true
									break
								end
							end
						end
					
						if bFeaturePass and bTerrainPass then
							pPlot:SetResourceType(eChosenResource, 1)
							bBonusPlaced = true
							break
						end
					end
				end
			
				if i >= 36 then
					table.remove(tBonusResourcesIDs, iRandomResource)
					table.remove(tBonusResourcesTypes, iRandomResource)
					break
				end
			end
		until (bBonusPlaced or #tBonusResourcesIDs == 0)
	end
	
	-- Unique Luxuries
	if tSettings["EnablePassivesLuxuries"] then
		local iChance = Game.Rand(100, "Chance for placing the luxury") + 1
		local iThreshold = tUCSDefines["CityStateLuxuryChanceThreshold"]
		
		if iChance <= iThreshold then
			local pCapitalPlot = pMinorCapital:Plot()
			local eChosenResource = -1
			
			repeat
				if #tChosenMaritimeLuxuries == 0 then
					print("NO_MARITIME_CS")
					break
				end

				local iRandomResource = Game.Rand(#tChosenMaritimeLuxuries, "Choose one of all chosen luxuries") + 1
				
				if tChosenMaritimeLuxuries[iRandomResource] ~= nil then
					eChosenResource = tChosenMaritimeLuxuries[iRandomResource]
				end		
			until(eChosenResource ~= -1)
			
			pCapitalPlot:SetResourceType(eChosenResource, 1)
			pCapitalPlot:SetImprovementType(tImprovementsUCS[10])
		end
	end
	
	-- policy
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[1], true)
end
	
function MaritimeCityStatesBonusesLiberated(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[eOtherPlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Maritime
	if eMinorTrait ~= tMinorTraits[1] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	-- policy
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[1], true)
end

function MaritimeFreeGreatPersonImprovement(eTeam, eEra, bFirst)
	if eEra ~= GameInfoTypes.ERA_CLASSICAL then return end
	
	for eplayer = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pPlayer = Players[eplayer]
		
		if pPlayer and pPlayer:IsAlive() then
			if not pPlayer:IsMinorCiv() then return end

			local ePlayerTeam = pPlayer:GetTeam()

			if ePlayerTeam == eTeam then
				local eMinorTrait = pPlayer:GetMinorCivTrait()
				
				-- Maritime
				-- Manufactory
				if eMinorTrait ~= tMinorTraits[1] then return end
				
				local pMinorCapital = pPlayer:GetCapitalCity()

				for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
					local pPlot = pMinorCapital:GetCityIndexPlot(i)
					
					if pPlot then
						local bIsCity = pPlot:IsCity()
						local ePlot = pPlot:GetPlotType()
						local eResource = pPlot:GetResourceType()
						local bIsStrategic = (eResource ~= -1) and (GameInfo.Resources[eResource].ResourceUsage == 1) or false
						local eImprovement = pPlot:GetImprovementType()
						local eFeature = pPlot:GetFeatureType()
						
						if not bIsCity and eImprovement == -1 and eFeature == -1 and (bIsStrategic or eResource == -1) and (ePlot == tPlotTypes[1] or ePlot == tPlotTypes[2]) then
							pPlot:SetImprovementType(tImprovementsGreatPeople[4])

							local ePlotOwner = pPlot:GetOwner()

							if ePlotOwner ~= eplayer then
								pPlot:SetOwner(eplayer, pMinorCapital:GetID())
							end
							
							break
						end
					end
					
					if i >= 18 then
						break
					end
				end
			end
		end
	end
end
	
function FreeWorkerFromCityState(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	if pMinorCapital == nil then return end
	
	if pPlayer:HasPolicy(tPoliciesPassiveAbilities[1]) then
		local eMinorPersonality = pPlayer:GetPersonality()
		
		if eMinorPersonality ~= tMinorPersonalities[1] then return end
		
		local iWorkerSpawnChance = RandomNumberBetween(1, 100)
		
		if iWorkerSpawnChance <= tUCSDefines["CityStateUnitChanceThreshold"] then
			for eMajorPlayer, pMajorPlayer in ipairs(Players) do
				if pMajorPlayer and pMajorPlayer:IsAlive() then
					if pMajorPlayer:IsMinorCiv() then break end
					if not pMajorPlayer:IsEverAlive() then break end
					
					if pPlayer:IsFriends(eMajorPlayer) or pPlayer:IsAllies(eMajorPlayer) then
						local iWorkerOrFishingBoatSpawnChance = RandomNumberBetween(1, 100)

						local pMajorCapital = pMajorPlayer:GetCapitalCity()
						local bIsMajorHasCoast = pMajorCapital:IsCoastal()
						local bIsMajorHasTrueSea = false

						if bIsMajorHasCoast then
							for i = 1, pMajorCapital:GetNumCityPlots() - 1, 1 do
								local pPlot = pMajorCapital:GetCityIndexPlot(i)
		
								if pPlot then
									local bIsLake = pPlot:IsLake()
									local ePlot = pPlot:GetPlotType()
			
									if ePlot == tPlotTypes[4] and not bIsLake then
										bIsMajorHasTrueSea = true
										break
									end
								end
		
								if i >= 6 then
									break
								end
							end
						end
						
						if iWorkerOrFishingBoatSpawnChance <= 50 and bIsMajorHasTrueSea then
							pMajorPlayer:AddFreeUnit(tUnitsCivilian[2], UNITAI_DEFENSE)
							UnitNotificationLoad(pPlayer, pMajorPlayer, "Fishing Boat", tUnitsCivilian[2])
						else	
							pMajorPlayer:AddFreeUnit(tUnitsCivilian[1], UNITAI_DEFENSE)
							UnitNotificationLoad(pPlayer, pMajorPlayer, "Worker", tUnitsCivilian[1])
						end
					end
				end
			end
		end
	end
end
	

-- MERCANTILE
function MercantileCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer then return end
	if not pPlayer:IsMinorCiv() then return end
	if not pPlayer:IsAlive() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Mercantile	
	if eMinorTrait ~= tMinorTraits[2] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	local iCapitalX = pMinorCapital:GetX()
	local iCapitalY = pMinorCapital:GetY()
	
	if iCapitalX ~= iX or iCapitalY ~= iY then return end
	
	-- Luxury Resource
	if tSettings["EnablePassivesTileResources"] then
		local tLuxuryResourcesIDs = {}
		local tLuxuryResourcesTypes = {}
		local bLuxuryPlaced = false
	
		for resource in GameInfo.Resources{ResourceClassType="RESOURCECLASS_LUXURY", OnlyMinorCivs=0} do
			table.insert(tLuxuryResourcesIDs, resource.ID)
			table.insert(tLuxuryResourcesTypes, resource.Type)
		end
	
		repeat
			local iRandomResource = RandomNumberBetween(1, #tLuxuryResourcesIDs)
			local eChosenResource = tLuxuryResourcesIDs[iRandomResource]
			local tLuxuryResourceFeatures = {}
			local tLuxuryResourceTerrains = {}
		
			for row in GameInfo.Resource_FeatureBooleans{ResourceType=tLuxuryResourcesTypes[iRandomResource]} do
				table.insert(tLuxuryResourceFeatures, row.FeatureType)
			end
			for row in GameInfo.Resource_TerrainBooleans{ResourceType=tLuxuryResourcesTypes[iRandomResource]} do
				table.insert(tLuxuryResourceTerrains, row.TerrainType)
			end	
		
			for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
				local pPlot = pMinorCapital:GetCityIndexPlot(i)
			
				if pPlot then
					local bIsCity = pPlot:IsCity()
					local eImprovement = pPlot:GetImprovementType()
					local eResource = pPlot:GetResourceType()
					local eFeature = pPlot:GetFeatureType()
					local eTerrain = pPlot:GetTerrainType()
					local bFeaturePass = false
					local bTerrainPass = false
				
					if not bIsCity and eResource == -1 and eImprovement == -1 then
						if #tLuxuryResourceFeatures == 0 and eFeature == -1 then
							bFeaturePass = true
						else
							for i, value in ipairs(tLuxuryResourceFeatures) do
								if eFeature == FeatureTypes[value] then
									bFeaturePass = true
									break
								end
							end
						end
					
						if #tLuxuryResourceTerrains == 0 then
							bFeaturePass = true
						else
							for i, value in ipairs(tLuxuryResourceTerrains) do
								if eTerrain == TerrainTypes[value] then
									bTerrainPass = true
									break
								end
							end
						end
					
						if bFeaturePass and bTerrainPass then
							pPlot:SetResourceType(eChosenResource, 1)
							bLuxuryPlaced = true
							break
						end
					end
				end
			
				if i >= 36 then
					table.remove(tLuxuryResourcesIDs, iRandomResource)
					table.remove(tLuxuryResourcesTypes, iRandomResource)
					break
				end
			end
		until (bLuxuryPlaced or #tLuxuryResourcesIDs == 0)
	end
	
	-- policy
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[2], true)
end
	
function MercantileCityStatesBonusesLiberated(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[eOtherPlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Mercantile
	if eMinorTrait ~= tMinorTraits[2] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	-- policy
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[2], true)
end

function MercantileFreeGreatPersonImprovement(eTeam, eEra, bFirst)
	if eEra ~= GameInfoTypes.ERA_CLASSICAL then return end
	
	for eplayer = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pPlayer = Players[eplayer]
		
		if pPlayer and pPlayer:IsAlive() then
			if not pPlayer:IsMinorCiv() then return end

			local ePlayerTeam = pPlayer:GetTeam()

			if ePlayerTeam == eTeam then
				local eMinorTrait = pPlayer:GetMinorCivTrait()
				
				-- Mercantile
				-- Town
				if eMinorTrait ~= tMinorTraits[2] then return end
				
				local pMinorCapital = pPlayer:GetCapitalCity()

				for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
					local pPlot = pMinorCapital:GetCityIndexPlot(i)
					
					if pPlot then
						local bIsCity = pPlot:IsCity()
						local ePlot = pPlot:GetPlotType()
						local eResource = pPlot:GetResourceType()
						local bIsStrategic = (eResource ~= -1) and (GameInfo.Resources[eResource].ResourceUsage == 1) or false
						local eImprovement = pPlot:GetImprovementType()
						local eFeature = pPlot:GetFeatureType()
						
						if not bIsCity and eImprovement == -1 and eFeature == -1 and (bIsStrategic or eResource == -1) and (ePlot == tPlotTypes[1] or ePlot == tPlotTypes[2]) then
							pPlot:SetImprovementType(tImprovementsGreatPeople[5])

							local ePlotOwner = pPlot:GetOwner()

							if ePlotOwner ~= eplayer then
								pPlot:SetOwner(eplayer, pMinorCapital:GetID())
							end
							
							break
						end
					end
					
					if i >= 18 then
						break
					end
				end
			end
		end
	end
end
	
function FreeCaravanFromCityState(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	if pMinorCapital == nil then return end
	
	if pPlayer:HasPolicy(tPoliciesPassiveAbilities[2]) then
		local eMinorPersonality = pPlayer:GetPersonality()
		
		if eMinorPersonality ~= tMinorPersonalities[1] then return end
		
		local iCaravanSpawnChance = RandomNumberBetween(1, 100)
		
		if iCaravanSpawnChance <= tUCSDefines["CityStateUnitChanceThreshold"] then
			for eMajorPlayer, pMajorPlayer in ipairs(Players) do
				if pMajorPlayer and pMajorPlayer:IsAlive() then
					if pMajorPlayer:IsMinorCiv() then break end
					if not pMajorPlayer:IsEverAlive() then break end
					
					if pPlayer:IsFriends(eMajorPlayer) or pPlayer:IsAllies(eMajorPlayer) then
						local bIsMajorCanHaveTR = pMajorPlayer:GetNumInternationalTradeRoutesUsed() < pMajorPlayer:GetNumInternationalTradeRoutesAvailable()
						
						if bIsMajorCanHaveTR then
							local iCaravanOrCargoSpawnChance = RandomNumberBetween(1, 100)
						
							local pMajorCapital = pMajorPlayer:GetCapitalCity()
							local bIsMajorHasCoast = pMajorCapital:IsCoastal()
							local bIsMajorHasTrueSea = false

							if bIsMajorHasCoast then
								for i = 1, pMajorCapital:GetNumCityPlots() - 1, 1 do
									local pPlot = pMajorCapital:GetCityIndexPlot(i)
		
									if pPlot then
										local bIsLake = pPlot:IsLake()
										local ePlot = pPlot:GetPlotType()
			
										if ePlot == tPlotTypes[4] and not bIsLake then
											bIsMajorHasTrueSea = true
											break
										end
									end
		
									if i >= 6 then
										break
									end
								end
							end

							if iCaravanOrCargoSpawnChance <= 50 and bIsMajorHasTrueSea then
								pMajorPlayer:AddFreeUnit(tUnitsCivilian[6], UNITAI_DEFENSE)
								UnitNotificationLoad(pPlayer, pMajorPlayer, "Cargo Ship", tUnitsCivilian[6])
							else	
								pMajorPlayer:AddFreeUnit(tUnitsCivilian[5], UNITAI_DEFENSE)
								UnitNotificationLoad(pPlayer, pMajorPlayer, "Caravan", tUnitsCivilian[5])
							end
						end
					end
				end
			end
		end
	end
end
	

-- MILITARISTIC
function InitializeMilitaristicResources()
	local tMilitarisiticLuxuries = {
		GameInfoTypes.RESOURCE_GUNPOWDER
	}
	
	local iNumMilitarisiticCityStates = 0
	
	for eplayer = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pMilitarisiticMinor = Players[eplayer]
		
		if pMilitarisiticMinor:IsAlive() then
			local eMilitarisiticTrait = pMilitarisiticMinor:GetMinorCivTrait()
			
			if eMilitarisiticTrait == tMinorTraits[3] then
				iNumMilitarisiticCityStates = iNumMilitarisiticCityStates + 1
			end
		end
	end
	
	if iNumMilitarisiticCityStates > tUCSDefines["NumCityStatesForFirstThreshold"] then
		table.insert(tChosenMilitaristicLuxuries, table.remove(tMilitarisiticLuxuries, Game.Rand(#tMilitarisiticLuxuries, "Choose 1st of all available luxuries") + 1))
	end
	
	--[[if #tMilitarisiticLuxuries > 0 then
		if iNumMilitarisiticCityStates > tUCSDefines["NumCityStatesForSecondThreshold"] then
			table.insert(tChosenMilitaristicLuxuries, table.remove(tMilitarisiticLuxuries, Game.Rand(#tMilitarisiticLuxuries, "Choose 2nd of all available luxuries") + 1))
		end
	end
	
	if #tMilitarisiticLuxuries > 0 then
		if iNumMilitarisiticCityStates > tUCSDefines["NumCityStatesForThirdThreshold"] then
			table.insert(tChosenMilitaristicLuxuries, table.remove(tMilitarisiticLuxuries, Game.Rand(#tMilitarisiticLuxuries, "Choose 3rd of all available luxuries") + 1))
		end
	end--]]

	if #tChosenMilitaristicLuxuries == 0 then
		print("LUX_INIT_MILITARISTIC_0_ERROR", iNumMilitarisiticCityStates, #tMilitarisiticLuxuries)
	end
end

function MilitaristicCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer then return end
	if not pPlayer:IsMinorCiv() then return end
	if not pPlayer:IsAlive() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Militaristic	
	if eMinorTrait ~= tMinorTraits[3] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	local iCapitalX = pMinorCapital:GetX()
	local iCapitalY = pMinorCapital:GetY()
	
	if iCapitalX ~= iX or iCapitalY ~= iY then return end
	
	-- Strategic Resource
	if tSettings["EnablePassivesTileResources"] then
		local tStrategicResourcesIDs = {}
		local tStrategicResourcesTypes = {}
		local bStrategicPlaced = false
	
		for resource in GameInfo.Resources{ResourceUsage=1} do
			if resource.ID ~= GameInfoTypes.RESOURCE_PAPER then
				table.insert(tStrategicResourcesIDs, resource.ID)
				table.insert(tStrategicResourcesTypes, resource.Type)
			end
		end
	
		repeat
			local iRandomResource = RandomNumberBetween(1, #tStrategicResourcesIDs)
			local eChosenResource = tStrategicResourcesIDs[iRandomResource]
			local tStrategicResourceFeatures = {}
			local tStrategicResourceTerrains = {}
			
			for row in GameInfo.Resource_FeatureBooleans{ResourceType=tStrategicResourcesTypes[iRandomResource]} do
				table.insert(tStrategicResourceFeatures, row.FeatureType)
			end
			for row in GameInfo.Resource_TerrainBooleans{ResourceType=tStrategicResourcesTypes[iRandomResource]} do
				table.insert(tStrategicResourceTerrains, row.TerrainType)
			end	
		
			for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
				local pPlot = pMinorCapital:GetCityIndexPlot(i)
			
				if pPlot then
					local bIsCity = pPlot:IsCity()
					local eImprovement = pPlot:GetImprovementType()
					local eResource = pPlot:GetResourceType()
					local ePlot = pPlot:GetPlotType()
					local eFeature = pPlot:GetFeatureType()
					local eTerrain = pPlot:GetTerrainType()
					local bFeaturePass = false
					local bTerrainPass = false
				
					if not bIsCity and eResource == -1 and eImprovement == -1 then
						if #tStrategicResourceFeatures == 0 and eFeature == -1 then
							bFeaturePass = true
						elseif eFeature == -1  and ePlot == tPlotTypes[4] then
							bFeaturePass = true
						else
							for i, value in ipairs(tStrategicResourceFeatures) do
								if eFeature == FeatureTypes[value] then
									bFeaturePass = true
									break
								end
							end
						end
					
						if #tStrategicResourceTerrains == 0 then
							bFeaturePass = true
						else
							for i, value in ipairs(tStrategicResourceTerrains) do
								if eTerrain == TerrainTypes[value] then
									bTerrainPass = true
									break
								end
							end
						end
					
						if bFeaturePass and bTerrainPass then
							pPlot:SetResourceType(eChosenResource, 1)
							bStrategicPlaced = true
							break
						end
					end
				end
			
				if i >= 36 then
					table.remove(tStrategicResourcesIDs, iRandomResource)
					table.remove(tStrategicResourcesTypes, iRandomResource)
					break
				end
			end
		until (bStrategicPlaced or #tStrategicResourcesIDs == 0)
	end
	
	-- Unique Luxuries
	if tSettings["EnablePassivesLuxuries"] then
		local iChance = Game.Rand(100, "Chance for placing the luxury") + 1
		local iThreshold = tUCSDefines["CityStateLuxuryChanceThresholdRare"]
		
		if iChance <= iThreshold then
			local pCapitalPlot = pMinorCapital:Plot()
			local eChosenResource = -1
			
			repeat
				if #tChosenMilitaristicLuxuries == 0 then
					print("NO_MILITARISTIC_CS")
					break
				end

				local iRandomResource = Game.Rand(#tChosenMilitaristicLuxuries, "Choose one of all chosen luxuries") + 1
				
				if tChosenMilitaristicLuxuries[iRandomResource] ~= nil then
					eChosenResource = tChosenMilitaristicLuxuries[iRandomResource]
				end		
			until(eChosenResource ~= -1)
			
			pCapitalPlot:SetResourceType(eChosenResource, 1)
			pCapitalPlot:SetImprovementType(tImprovementsUCS[10])
		end
	end
	
	-- policy
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[3], true)
end
	
function MilitaristicCityStatesBonusesLiberated(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[eOtherPlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Militaristic
	if eMinorTrait ~= tMinorTraits[3] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	-- policy
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[3], true)
end

function MilitaristicFreeGreatPersonImprovement(eTeam, eEra, bFirst)
	if eEra ~= GameInfoTypes.ERA_CLASSICAL then return end
	
	for eplayer = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pPlayer = Players[eplayer]
		
		if pPlayer and pPlayer:IsAlive() then
			if not pPlayer:IsMinorCiv() then return end

			local ePlayerTeam = pPlayer:GetTeam()

			if ePlayerTeam == eTeam then
				local eMinorTrait = pPlayer:GetMinorCivTrait()
				
				-- Militaristic
				-- Fort
				if eMinorTrait ~= tMinorTraits[3] then return end
				
				local pMinorCapital = pPlayer:GetCapitalCity()

				for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
					local pPlot = pMinorCapital:GetCityIndexPlot(i)
					
					if pPlot then
						local bIsCity = pPlot:IsCity()
						local ePlot = pPlot:GetPlotType()
						local eResource = pPlot:GetResourceType()
						local bIsStrategic = (eResource ~= -1) and (GameInfo.Resources[eResource].ResourceUsage == 1) or false
						local eImprovement = pPlot:GetImprovementType()
						local eFeature = pPlot:GetFeatureType()
						
						if not bIsCity and eImprovement == -1 and eFeature == -1 and (bIsStrategic or eResource == -1) and (ePlot == tPlotTypes[1] or ePlot == tPlotTypes[2]) then
							pPlot:SetImprovementType(tImprovementsGreatPeople[3])

							local ePlotOwner = pPlot:GetOwner()

							if ePlotOwner ~= eplayer then
								pPlot:SetOwner(eplayer, pMinorCapital:GetID())
							end
							
							break
						end
					end
					
					if i >= 18 then
						break
					end
				end
			end
		end
	end
end
	
function CityStateTrainedUU(ePlayer, eCity, eUnit, bGold, bFaith)
	local pPlayer = Players[ePlayer]

	if not pPlayer:IsMinorCiv() then return end

	if pPlayer:IsMinorCivHasUniqueUnit() then
		local ePrereqTech	
		local bUnitMatched = false

		-- produced unit
		local pProducedUnit = pPlayer:GetUnitByID(eUnit)
		local eProducedUnit = pProducedUnit:GetUnitType()
		local sProducedUnitType = GameInfo.Units{ID=eProducedUnit}().Type
		local sProducedUnitClass = GameInfo.Units{ID=eProducedUnit}().Class

		-- unique unit for that CS
		local eUniqueUnit = pPlayer:GetMinorCivUniqueUnit()
		local sUniqueUnitType = GameInfo.Units{ID=eUniqueUnit}().Type

		-- checking if produced unit matched the a) unique unit from any civ; b) unassigned unique units; to be substituted
		for civclassoverrides in GameInfo.Civilization_UnitClassOverrides{UnitClassType=sProducedUnitClass} do
			if civclassoverrides.UnitType == sUniqueUnitType then
				ePrereqTech = GameInfoTypes[GameInfo.Units{Type=sUniqueUnitType}().PrereqTech]				
				bUnitMatched = true
				break
			end
		end
		
		if not bUnitMatched and tUniqueUnitsFromMinors[eUniqueUnit] then
			if sProducedUnitType == tUniqueUnitsFromMinors[eUniqueUnit].sOriginalUnit then
				ePrereqTech = tUniqueUnitsFromMinors[eUniqueUnit].ePrereqTech
				bUnitMatched = true
			end
		end

		if bUnitMatched then
			local pTeam = Teams[pPlayer:GetTeam()]
			
			if pTeam:IsHasTech(ePrereqTech) then
				pProducedUnit:Kill()
				pPlayer:AddFreeUnit(eUniqueUnit, UNITAI_DEFENSE)
			end
		end
	end
end

--[[function MilitaristicTerrainUpgrades(eUnitOwner, eUnit)
	print("UPGRADE_CHECK", eUnitOwner, eUnit)

	local pPlayer = Players[eUnitOwner]
	local pUnit = pPlayer:GetUnitByID(eUnit)
	local pPlot = pUnit:GetPlot()

	if pPlot then
		local ePlotOwner = pPlot:GetOwner()

		--if ePlotOwner == -1 then return false end
		--if ePlotOwner == eUnitOwner then return true end

		if ePlotOwner ~= -1 then
			local pPlotOwner = Players[ePlotOwner]

			if pPlotOwner:IsMinorCiv() then
				local eMinorTrait = pPlotOwner:GetMinorCivTrait()

				if eMinorTrait == tMinorTraits[3] then 
					if pPlotOwner:IsAllies(eUnitOwner) then
						print("UPGRADE_CHECK_TRUE")
						return true
					else
						print("UPGRADE_CHECK_FALSE")
						return false
					end
				end
			end
		end
	end

	return true
end
GameEvents.UnitCanHaveAnyUpgrade.Add(MilitaristicTerrainUpgrades)--]]
	

-- CULTURED
function InitializeCulturedResources()
	local tCulturedLuxuries = {
		GameInfoTypes.RESOURCE_TAPESTRIES,
		GameInfoTypes.RESOURCE_PORCELAIN,
		GameInfoTypes.RESOURCE_SCULPTURES
	}
	
	local iNumCulturedCityStates = 0
	
	for eplayer = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pCulturedMinor = Players[eplayer]
		
		if pCulturedMinor:IsAlive() then
			local eCulturedTrait = pCulturedMinor:GetMinorCivTrait()
			
			if eCulturedTrait == tMinorTraits[4] then
				iNumCulturedCityStates = iNumCulturedCityStates + 1
			end
		end
	end
	
	if iNumCulturedCityStates > tUCSDefines["NumCityStatesForFirstThreshold"] then
		table.insert(tChosenCulturedLuxuries, table.remove(tCulturedLuxuries, Game.Rand(#tCulturedLuxuries, "Choose 1st of all available luxuries") + 1))
	end
	
	if #tCulturedLuxuries > 0 then
		if iNumCulturedCityStates > tUCSDefines["NumCityStatesForSecondThreshold"] then
			table.insert(tChosenCulturedLuxuries, table.remove(tCulturedLuxuries, Game.Rand(#tCulturedLuxuries, "Choose 2nd of all available luxuries") + 1))
		end
	end
	
	if #tCulturedLuxuries > 0 then
		if iNumCulturedCityStates > tUCSDefines["NumCityStatesForThirdThreshold"] then
			table.insert(tChosenCulturedLuxuries, table.remove(tCulturedLuxuries, Game.Rand(#tCulturedLuxuries, "Choose 3rd of all available luxuries") + 1))
		end
	end

	if #tChosenCulturedLuxuries == 0 then
		print("LUX_INIT_CULTURED_0_ERROR", iNumCulturedCityStates, #tCulturedLuxuries)
	end
end

function CulturedCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer then return end
	if not pPlayer:IsMinorCiv() then return end
	if not pPlayer:IsAlive() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Cultured	
	if eMinorTrait ~= tMinorTraits[4] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	local iCapitalX = pMinorCapital:GetX()
	local iCapitalY = pMinorCapital:GetY()
	
	if iCapitalX ~= iX or iCapitalY ~= iY then return end
	
	-- Unique Luxuries
	if tSettings["EnablePassivesLuxuries"] then
		local iChance = Game.Rand(100, "Chance for placing the luxury") + 1
		local iThreshold = tUCSDefines["CityStateLuxuryChanceThreshold"]
		
		if iChance <= iThreshold then
			local pCapitalPlot = pMinorCapital:Plot()
			local eChosenResource = -1
			
			repeat
				if #tChosenCulturedLuxuries == 0 then
					print("NO_CULTURED_CS")
					break
				end

				local iRandomResource = Game.Rand(#tChosenCulturedLuxuries, "Choose one of all chosen luxuries") + 1
				
				if tChosenCulturedLuxuries[iRandomResource] ~= nil then
					eChosenResource = tChosenCulturedLuxuries[iRandomResource]
				end		
			until(eChosenResource ~= -1)
			
			pCapitalPlot:SetResourceType(eChosenResource, 1)
			pCapitalPlot:SetImprovementType(tImprovementsUCS[10])
		end
	end
	
	-- Artifact
	local tArtifactSpots = {}

	for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
		local pPlot = pMinorCapital:GetCityIndexPlot(i)
			
		if pPlot then
			local bIsCity = pPlot:IsCity()
			local bIsWater = pPlot:IsWater()
			local bIsMountain = pPlot:GetPlotType() == 0
			local eImprovement = pPlot:GetImprovementType()
			local eResource = pPlot:GetResourceType()
				
			if not bIsWater and not bIsMountain and not bIsCity and eResource == -1 and eImprovement == -1 then
				table.insert(tArtifactSpots, pPlot)
			end
		end
			
		if i >= 18 then
			break
		end
	end

	if #tArtifactSpots > 0 then
		local pChosenPlot = table.remove(tArtifactSpots, #tArtifactSpots)
		
		pChosenPlot:SetArchaeologicalRecord(eArtifactRuin, GameInfoTypes.ERA_ANCIENT, pPlayer:GetID())
		pChosenPlot:SetResourceType(eResourceArtifact, 1)
	end
	
	-- policy
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[4], true)
end
	
function CulturedCityStatesBonusesLiberated(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[eOtherPlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Cultured
	if eMinorTrait ~= tMinorTraits[4] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	-- policy
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[4], true)
end

function CulturedFreeGreatPersonImprovement(eTeam, eEra, bFirst)
	if eEra ~= GameInfoTypes.ERA_CLASSICAL then return end
	
	for eplayer = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pPlayer = Players[eplayer]
		
		if pPlayer and pPlayer:IsAlive() then
			if not pPlayer:IsMinorCiv() then return end

			local ePlayerTeam = pPlayer:GetTeam()

			if ePlayerTeam == eTeam then
				local eMinorTrait = pPlayer:GetMinorCivTrait()
				
				-- Cultured
				-- Academy
				if eMinorTrait ~= tMinorTraits[4] then return end
				
				local pMinorCapital = pPlayer:GetCapitalCity()

				for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
					local pPlot = pMinorCapital:GetCityIndexPlot(i)
					
					if pPlot then
						local bIsCity = pPlot:IsCity()
						local ePlot = pPlot:GetPlotType()
						local eResource = pPlot:GetResourceType()
						local bIsStrategic = (eResource ~= -1) and (GameInfo.Resources[eResource].ResourceUsage == 1) or false
						local eImprovement = pPlot:GetImprovementType()
						local eFeature = pPlot:GetFeatureType()
						
						if not bIsCity and eImprovement == -1 and eFeature == -1 and (bIsStrategic or eResource == -1) and (ePlot == tPlotTypes[1] or ePlot == tPlotTypes[2]) then
							pPlot:SetImprovementType(tImprovementsGreatPeople[6])

							local ePlotOwner = pPlot:GetOwner()

							if ePlotOwner ~= eplayer then
								pPlot:SetOwner(eplayer, pMinorCapital:GetID())
							end
							
							break
						end
					end
					
					if i >= 18 then
						break
					end
				end
			end
		end
	end
end
	
function FreeArchaeologistFromCityState(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	if pMinorCapital == nil then return end
	
	if pPlayer:HasPolicy(tPoliciesPassiveAbilities[4]) then
		local eMinorPersonality = pPlayer:GetPersonality()
		
		if eMinorPersonality ~= tMinorPersonalities[1] then return end
		
		local iArchaeologistSpawnChance = RandomNumberBetween(1, 100)
		
		if iArchaeologistSpawnChance <= tUCSDefines["CityStateUnitChanceThreshold"] then
			for eMajorPlayer, pMajorPlayer in ipairs(Players) do
				if pMajorPlayer and pMajorPlayer:IsAlive() then
					if pMajorPlayer:IsMinorCiv() then break end
					if not pMajorPlayer:IsEverAlive() then break end
					
					local pMajorTeam = Teams[pMajorPlayer:GetTeam()]
					local bCanArchaeologistBeSpawned = pMajorTeam:IsHasTech(tTechnologyTypes[1])

					if bCanArchaeologistBeSpawned then
						if pPlayer:IsFriends(eMajorPlayer) or pPlayer:IsAllies(eMajorPlayer) then
							pMajorPlayer:AddFreeUnit(tUnitsCivilian[4], UNITAI_DEFENSE)
								UnitNotificationLoad(pPlayer, pMajorPlayer, "Archaeologist", tUnitsCivilian[4])
						end
					end
				end
			end
		end
	end
end
	
function FreeGreatWorkFromCityState(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()	
	
	if pMinorCapital == nil then return end
	if not pPlayer:HasPolicy(tPoliciesPassiveAbilities[4]) then return end
	
	local iGreatWorkSpawnChance = RandomNumberBetween(1, 1000)
	
	if iGreatWorkSpawnChance > tUCSDefines["CityStateGreatWorkChanceThreshold"] then return end
		
	for eMajorPlayer, pMajorPlayer in ipairs(Players) do
		if pMajorPlayer and pMajorPlayer:IsAlive() then
			if pMajorPlayer:IsMinorCiv() then break end
			if not pMajorPlayer:IsEverAlive() then break end
			
			if pPlayer:IsFriends(eMajorPlayer) or pPlayer:IsAllies(eMajorPlayer) then
				local iFreeArtSpots, iFreeWritingSpots, iFreeMusicSpots = 0, 0, 0
				
				-- check free spots
				for city in pMajorPlayer:Cities() do
					iFreeArtSpots = iFreeArtSpots + city:GetNumAvailableGreatWorkSlots(GameInfoTypes.GREAT_WORK_SLOT_ART_ARTIFACT)
					iFreeWritingSpots = iFreeWritingSpots + city:GetNumAvailableGreatWorkSlots(GameInfoTypes.GREAT_WORK_SLOT_LITERATURE)
					iFreeMusicSpots = iFreeMusicSpots + city:GetNumAvailableGreatWorkSlots(GameInfoTypes.GREAT_WORK_SLOT_MUSIC)
				end
				
				-- choose great work type for gift
				local sGreatWorkClassType, eGreatWorkSlotType, sGreatWorkSlotType = nil, nil, nil
				
				if iFreeMusicSpots > 0 then
					eGreatWorkClassType = GameInfoTypes.GREAT_WORK_MUSIC
					sGreatWorkClassType = 'GREAT_WORK_MUSIC'
					eGreatWorkSlotType = GameInfoTypes.GREAT_WORK_SLOT_MUSIC
					sGreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC'
				elseif iFreeWritingSpots > 0 then
					eGreatWorkClassType = GameInfoTypes.GREAT_WORK_LITERATURE
					sGreatWorkClassType = 'GREAT_WORK_LITERATURE'
					eGreatWorkSlotType = GameInfoTypes.GREAT_WORK_SLOT_LITERATURE
					sGreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE'
				elseif iFreeArtSpots > 0 then
					eGreatWorkClassType = GameInfoTypes.GREAT_WORK_ART
					sGreatWorkClassType = 'GREAT_WORK_ART'
					eGreatWorkSlotType = GameInfoTypes.GREAT_WORK_SLOT_ART_ARTIFACT
					sGreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT'
				end
				
				if sGreatWorkClassType then
					local tUsedGreatWorks, tReservedGreatWorks, tAvailableGreatWorks = {}, {}, {}
					
					-- already created great works
					for eplayer, pplayer in ipairs(Players) do
						local tTempTable = pplayer:GetGreatWorks(eGreatWorkClassType)
						
						for i, v in ipairs(tTempTable) do
							local eUsedID = Game.GetGreatWorkType(v.Index)
							
							tUsedGreatWorks[eUsedID] = true
						end
					end
					
					-- reserved great works (for buildings)
					for building in DB.Query("SELECT Buildings.FreeGreatWork FROM Buildings") do
						if building.FreeGreatWork ~= nil then
							local eReservedID = GameInfo.GreatWorks{Type=building.FreeGreatWork}().ID
						
							tReservedGreatWorks[eReservedID] = true
						end
					end
					
					-- creating GW list to choose from
					for greatwork in DB.Query("SELECT GreatWorks.ID FROM GreatWorks WHERE GreatWorkClassType = ?", sGreatWorkClassType) do
						if not tUsedGreatWorks[greatwork.ID] and not tReservedGreatWorks[greatwork.ID] then
							table.insert(tAvailableGreatWorks, greatwork.ID)
						end
					end
					
					-- continue if the pool is not depleted
					if #tAvailableGreatWorks > 0 then
						local eGreatWorkType = table.remove(tAvailableGreatWorks, Game.Rand(#tAvailableGreatWorks, "Choose a random ID of a GW") + 1)
						local eGreatWork = Game.CreateGreatWork(eGreatWorkType, eMajorPlayer, pMajorPlayer:GetCurrentEra(), pPlayer:GetName())
						local bFoundFreeSlot = false
						
						-- looking for a building with at least 1 free slot
						for city in pMajorPlayer:Cities() do
							if city:GetNumAvailableGreatWorkSlots(eGreatWorkSlotType) > 0 then
								for building in DB.Query("SELECT Buildings.ID, Buildings.Description, Buildings.BuildingClass, Buildings.GreatWorkCount FROM Buildings WHERE GreatWorkSlotType = ?", sGreatWorkSlotType) do
									if city:IsHasBuilding(building.ID) then
										local eBuildingClass = GameInfo.BuildingClasses{Type=building.BuildingClass}{}.ID
										local iNumBuildingGreatWorkSlots = building.GreatWorkCount
										
										for i = 0, iNumBuildingGreatWorkSlots - 1 do
											if city:GetBuildingGreatWork(eBuildingClass, i) == -1 then
												city:SetBuildingGreatWork(eBuildingClass, i, eGreatWork)
												bFoundFreeSlot = true
												
												if pMajorPlayer:IsHuman() then
													pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_WORK_COMPLETED_ACTIVE_PLAYER, L("TXT_KEY_UCS_PASSIVES_GREAT_WORK_GIFTS", pPlayer:GetName(), L(GameInfo.GreatWorks[eGreatWorkType].Description), L(building.Description)), L("TXT_KEY_UCS_PASSIVES_GREAT_WORK_GIFTS_TITLE"), city:GetX(), city:GetY(), eGreatWork)
												end	
	
												break
											end	
										end
										
										if bFoundFreeSlot then break end
									end
								end
								
								if bFoundFreeSlot then break end
							end
						end
					end
				end
			end
		end
	end
end
	

-- RELIGIOUS
function InitializeReligiousResources()
	local tReligiousLuxuries = {
		GameInfoTypes.RESOURCE_CHAMPAGNE,
		GameInfoTypes.RESOURCE_MANUSCRIPTS,
		GameInfoTypes.RESOURCE_MOSAICS
	}
	
	local iNumReligiousCityStates = 0
	
	for eplayer = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pReligiousMinor = Players[eplayer]
		
		if pReligiousMinor:IsAlive() then
			local eReligiousTrait = pReligiousMinor:GetMinorCivTrait()
			
			if eReligiousTrait == tMinorTraits[5] then
				iNumReligiousCityStates = iNumReligiousCityStates + 1
			end
		end
	end
	
	if iNumReligiousCityStates > tUCSDefines["NumCityStatesForFirstThreshold"] then
		table.insert(tChosenReligiousLuxuries, table.remove(tReligiousLuxuries, Game.Rand(#tReligiousLuxuries, "Choose 1st of all available luxuries") + 1))
	end
	
	if #tReligiousLuxuries > 0 then
		if iNumReligiousCityStates > tUCSDefines["NumCityStatesForSecondThreshold"] then
			table.insert(tChosenReligiousLuxuries, table.remove(tReligiousLuxuries, Game.Rand(#tReligiousLuxuries, "Choose 2nd of all available luxuries") + 1))
		end
	end
	
	if #tReligiousLuxuries > 0 then
		if iNumReligiousCityStates > tUCSDefines["NumCityStatesForThirdThreshold"] then
			table.insert(tChosenReligiousLuxuries, table.remove(tReligiousLuxuries, Game.Rand(#tReligiousLuxuries, "Choose 3rd of all available luxuries") + 1))
		end
	end

	if #tChosenReligiousLuxuries == 0 then
		print("LUX_INIT_RELIGIOUS_0_ERROR", iNumReligiousCityStates, #tReligiousLuxuries)
	end
end

function ReligiousCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer then return end
	if not pPlayer:IsMinorCiv() then return end
	if not pPlayer:IsAlive() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Religious	
	if eMinorTrait ~= tMinorTraits[5] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	local iCapitalX = pMinorCapital:GetX()
	local iCapitalY = pMinorCapital:GetY()
	
	if iCapitalX ~= iX or iCapitalY ~= iY then return end
	
	-- Unique Luxuries
	if tSettings["EnablePassivesLuxuries"] then
		local iChance = Game.Rand(100, "Chance for placing the luxury") + 1
		local iThreshold = tUCSDefines["CityStateLuxuryChanceThreshold"]
		
		if iChance <= iThreshold then
			local pCapitalPlot = pMinorCapital:Plot()
			local eChosenResource = -1
			
			repeat
				if #tChosenReligiousLuxuries == 0 then
					print("NO_RELIGIOUS_CS")
					break
				end

				local iRandomResource = Game.Rand(#tChosenReligiousLuxuries, "Choose one of all chosen luxuries") + 1
				
				if tChosenReligiousLuxuries[iRandomResource] ~= nil then
					eChosenResource = tChosenReligiousLuxuries[iRandomResource]
				end		
			until(eChosenResource ~= -1)
			
			pCapitalPlot:SetResourceType(eChosenResource, 1)
			pCapitalPlot:SetImprovementType(tImprovementsUCS[10])
		end
	end
	
	-- policy
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[5], true)
	
	-- buildings
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[4], pMinorCapital:GetNumRealBuilding(tBuildingsPassiveAbilities[4]) + 1)
	elseif eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[5], pMinorCapital:GetNumRealBuilding(tBuildingsPassiveAbilities[5]) + 1)
	elseif eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[6], pMinorCapital:GetNumRealBuilding(tBuildingsPassiveAbilities[6]) + 1)
	elseif eMinorPersonality == tMinorPersonalities[4] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[7], pMinorCapital:GetNumRealBuilding(tBuildingsPassiveAbilities[7]) + 1)
	end
end
	
function ReligiousCityStatesBonusesLiberated(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[eOtherPlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Religious
	if eMinorTrait ~= tMinorTraits[5] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	-- policy
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[5], true)

	-- buildings
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[4], pMinorCapital:GetNumRealBuilding(tBuildingsPassiveAbilities[4]) + 1)
	elseif eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[5], pMinorCapital:GetNumRealBuilding(tBuildingsPassiveAbilities[5]) + 1)
	elseif eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[6], pMinorCapital:GetNumRealBuilding(tBuildingsPassiveAbilities[6]) + 1)
	elseif eMinorPersonality == tMinorPersonalities[4] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[7], pMinorCapital:GetNumRealBuilding(tBuildingsPassiveAbilities[7]) + 1)
	end
end

function ReligiousFreeGreatPersonImprovement(eTeam, eEra, bFirst)
	if eEra ~= GameInfoTypes.ERA_CLASSICAL then return end
	
	for eplayer = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pPlayer = Players[eplayer]
		
		if pPlayer and pPlayer:IsAlive() then
			if not pPlayer:IsMinorCiv() then return end

			local ePlayerTeam = pPlayer:GetTeam()

			if ePlayerTeam == eTeam then
				local eMinorTrait = pPlayer:GetMinorCivTrait()
				
				-- Religious
				-- Holy Site
				if eMinorTrait ~= tMinorTraits[5] then return end
				
				local pMinorCapital = pPlayer:GetCapitalCity()

				for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
					local pPlot = pMinorCapital:GetCityIndexPlot(i)
					
					if pPlot then
						local bIsCity = pPlot:IsCity()
						local ePlot = pPlot:GetPlotType()
						local eResource = pPlot:GetResourceType()
						local bIsStrategic = (eResource ~= -1) and (GameInfo.Resources[eResource].ResourceUsage == 1) or false
						local eImprovement = pPlot:GetImprovementType()
						local eFeature = pPlot:GetFeatureType()
						
						if not bIsCity and eImprovement == -1 and eFeature == -1 and (bIsStrategic or eResource == -1) and (ePlot == tPlotTypes[1] or ePlot == tPlotTypes[2]) then
							pPlot:SetImprovementType(tImprovementsGreatPeople[2])

							local ePlotOwner = pPlot:GetOwner()

							if ePlotOwner ~= eplayer then
								pPlot:SetOwner(eplayer, pMinorCapital:GetID())
							end
							
							break
						end
					end
					
					if i >= 18 then
						break
					end
				end
			end
		end
	end
end
	
function FreeMissionaryFromCityState(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	if pMinorCapital == nil then return end
	
	if pPlayer:HasPolicy(tPoliciesPassiveAbilities[5]) then
		local eMinorPersonality = pPlayer:GetPersonality()
		
		if eMinorPersonality ~= tMinorPersonalities[1] then return end
		
		local iMissionarySpawnChance = RandomNumberBetween(1, 100)
		
		if iMissionarySpawnChance <= tUCSDefines["CityStateUnitChanceThreshold"] then
			for eMajorPlayer, pMajorPlayer in ipairs(Players) do
				if pMajorPlayer and pMajorPlayer:IsAlive() then
					if pMajorPlayer:IsMinorCiv() then break end
					if not pMajorPlayer:IsEverAlive() then break end
					
					local bCanMissionaryBeSpawned = pMajorPlayer:HasCreatedReligion() or pMajorPlayer:GetCapitalCity():GetReligiousMajority() > 0

					if bCanMissionaryBeSpawned then
						if pPlayer:IsFriends(eMajorPlayer) or pPlayer:IsAllies(eMajorPlayer) then
							pMajorPlayer:AddFreeUnit(tUnitsCivilian[3], UNITAI_DEFENSE)
								UnitNotificationLoad(pPlayer, pMajorPlayer, "Missionary", tUnitsCivilian[3])
						end
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------
-- functions common for all city-state's traits
-- after conquest unique luxuries must be again artificially improved
function ConquerCityStatesLuxuries(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	local pCityPlot = Map.GetPlot(iX, iY)
	local eResource = pCityPlot:GetResourceType()
	
	if eResource ~= -1 then
		local bIsNonMercantileResource = GameInfo.Resources[eResource].OnlyMinorCivs
		
		if not bIsNonMercantileResource then
			pNewOwner:ChangeNumResourceTotal(pCityPlot:GetResourceType(), -1) -- stops multiplication of luxury underneath
			--pCityPlot:SetImprovementType(tImprovementsUCS[10])
			pCityPlot:SetImprovementType(tImprovementsRegular[2])
			print(iX, iY, pCityPlot:GetImprovementType())
			pCityPlot:SetImprovementType(-1)
			print(iX, iY, pCityPlot:GetImprovementType())
		end
	end
end

function LiberatedCityStatesLuxuries(ePlayer, eOtherPlayer, eCity)
	local pCityState = Players[eOtherPlayer]
	local pCity = pCityState:GetCityByID(eCity)
	local pCityPlot = pCity:Plot()
	local eResource = pCityPlot:GetResourceType()
	
	if eResource ~= -1 then
		local bIsNonMercantileResource = GameInfo.Resources[eResource].OnlyMinorCivs
	
		if not bIsNonMercantileResource then
			pCityState:ChangeNumResourceTotal(pCityPlot:GetResourceType(), 1)
		end
	end
end

-- some unique luxuries have unique monopoly effects requiring policies or buildings
function UniqueMonopolyBonuses(ePlayer)
	local pPlayer = Players[ePlayer]
	local pCapital = pPlayer:GetCapitalCity()
	
	if pPlayer:IsMinorCiv() then return end
	if not pCapital then return end
	
	local tResourcesWithUniqueMonopoly = {
		GameInfoTypes.RESOURCE_CHEESE,
		GameInfoTypes.RESOURCE_HONEY,
		GameInfoTypes.RESOURCE_MANUSCRIPTS,
		GameInfoTypes.RESOURCE_MOSAICS,
		GameInfoTypes.RESOURCE_COINS,
		GameInfoTypes.RESOURCE_ROPES,
		GameInfoTypes.RESOURCE_GUNPOWDER,
		GameInfoTypes.RESOURCE_PORCELAIN,
		GameInfoTypes.RESOURCE_GLASS,
		GameInfoTypes.RESOURCE_CHAMPAGNE,
		GameInfoTypes.RESOURCE_TAPESTRIES
	}
	
	local tPoliciesForUniqueMonopolies = {
		GameInfoTypes.POLICY_MONOPOLY_CHEESE,
		GameInfoTypes.POLICY_MONOPOLY_HONEY,
		GameInfoTypes.POLICY_MONOPOLY_MANUSCRIPTS,
		GameInfoTypes.POLICY_MONOPOLY_MOSAICS,
		nil,
		GameInfoTypes.POLICY_MONOPOLY_ROPES,
		GameInfoTypes.POLICY_MONOPOLY_GUNPOWDER,
		GameInfoTypes.POLICY_MONOPOLY_PORCELAIN,
		GameInfoTypes.POLICY_MONOPOLY_GLASS,
		GameInfoTypes.POLICY_MONOPOLY_CHAMPAGNE,
		GameInfoTypes.POLICY_MONOPOLY_TAPESTRIES
	}
	
	local tBuildingsForUniqueMonopolies = {
		nil,
		nil,
		GameInfoTypes.BUILDING_MONOPOLY_MANUSCRIPTS,
		nil,
		GameInfoTypes.BUILDING_MONOPOLY_COINS,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil
	}
	
	for i, resource in ipairs(tResourcesWithUniqueMonopoly) do
		local bMonopoly = pPlayer:HasGlobalMonopoly(resource)
		local iMonopoly = bMonopoly and 1 or 0
		
		if tPoliciesForUniqueMonopolies[i] then
			pPlayer:SetHasPolicy(tPoliciesForUniqueMonopolies[i], bMonopoly)
		end
		
		if tBuildingsForUniqueMonopolies[i] then
			pCapital:SetNumRealBuilding(tBuildingsForUniqueMonopolies[i], iMonopoly)
		end
	end
end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- BOGOTA (CULTURE FROM LIBERATION)
function LiberatedForBogota(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[1]) ~= 0 then
		local iCities = pPlayer:GetNumCities()
		local pCapital = pPlayer:GetCapitalCity()	
		local pLiberatedCity = nil
		local pMinorPlayer = Players[tLostCities["eLostBogota"]]
		
		if iCities > 6 then iCities = 6 end

		local iBaseYield = RandomNumberBetween(20, 30)
		local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
		local iCultureLiberated = iBaseYield * iEraModifier * iCities
	
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_CULTURE, iCultureLiberated, true, pCapital:GetID())
		
		for eplayer = 0, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
			local pPlayer = Players[eplayer]

			if pPlayer:IsAlive() then
				pLiberatedCity = pPlayer:GetCityByID(eCity)	
				
				if pLiberatedCity ~= nil then
					break
				end
			end
		end

		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_BOGOTA_LIBERATION", pMinorPlayer:GetName(), iCultureLiberated), L("TXT_KEY_UCS_BONUS_BOGOTA_LIBERATION_TITLE"), pLiberatedCity:GetX(), pLiberatedCity:GetY())
		end
	end
end

function CapturedForBogota(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pPlayer = Players[eNewOwner]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[1]) ~= 0 then
		local pCapital = pPlayer:GetCapitalCity()	
		local pMinorPlayer = Players[tLostCities["eLostBogota"]]
		
		local iBaseYield = 30
		local iCurrentEraModifier = pPlayer:GetCurrentEra() + 1
		local iCultureCaptured = iBaseYield * iCurrentEraModifier
		
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_CULTURE, iCultureCaptured, true, pCapital:GetID())
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_BOGOTA_CAPTURE", pMinorPlayer:GetName(), iCultureCaptured), L("TXT_KEY_UCS_BONUS_BOGOTA_CAPTURE_TITLE", pMinorPlayer:GetName()), iX, iY)
		end
	end
end



-- LEVUKA (GROWTH FROM KILLING AND CONQUER)
function CaptureCityForLevuka(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pPlayer = Players[eNewOwner]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[13]) ~= 0 then
		local pMinorPlayer = Players[tLostCities["eLostLevuka"]]
		
		local iBaseYield = RandomNumberBetween(100, 200)
		local iCurrentEraModifier = pPlayer:GetCurrentEra() + 1
		local iOwnedCities = pPlayer:GetNumCities()
		local iFoodBonus = math.ceil((iBaseYield * iCurrentEraModifier) / iOwnedCities)
		
		for city in pPlayer:Cities() do
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FOOD, iFoodBonus, true, city:GetID())
		end
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_LEVUKA_CONQUEST", pMinorPlayer:GetName(), iFoodBonus), L("TXT_KEY_UCS_BONUS_LEVUKA_CONQUEST_TITLE"), iX, iY)
		end
		
		ConquestsForLevuka(eNewOwner)
	end
end

function ConquestsForLevuka(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[13]) ~= 0 then
		local iConqueredCities = 0
		
		for city in pPlayer:Cities() do
			if city:GetOwner() ~= city:GetOriginalOwner() then
				iConqueredCities = iConqueredCities + 1
			end
		end
		
		pPlayer:GetCapitalCity():SetNumRealBuilding(tBuildingsActiveAbilities[9], iConqueredCities)
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[9]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[13]) then
				pPlayer:GetCapitalCity():SetNumRealBuilding(tBuildingsActiveAbilities[9], 0)
			end
		end
	end
end

function BarbCampForLevuka(iX, iY, ePlayer)
    local pPlayer = Players[ePlayer]
    local pTeam = Teams[pPlayer:GetTeam()]
   
	if not pPlayer:IsAlive() then return end
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[13]) ~= 0 then
		local pMinorPlayer = Players[tLostCities["eLostLevuka"]]
		
		local iBaseYield = RandomNumberBetween(30, 75)
		local iCurrentEraModifier = pPlayer:GetCurrentEra() + 1
		local iOwnedCities = pPlayer:GetNumCities()
		local iFoodBonus = math.ceil((iBaseYield * iCurrentEraModifier) / iOwnedCities)
		
		for city in pPlayer:Cities() do
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FOOD, iFoodBonus, true, city:GetID())
		end
			
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_LEVUKA_BARBARIANS", pMinorPlayer:GetName(), iFoodBonus), L("TXT_KEY_UCS_BONUS_LEVUKA_BARBARIANS_TITLE"), iX, iY)
		end
	end
end



-- BRUSSELS (FEATURE MARSH)
-- improvement
function CanWePlaceMarsh(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_MARSH then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[2]) > 0) then return false end
	
	local pPlot = Map.GetPlot(iX, iY)
	
	if pPlot and not pPlot:IsCoastalLand() then return false end
	
	return true
end
GameEvents.PlayerCanBuild.Add(CanWePlaceMarsh)

function PlacedMarsh(ePlayer, iX, iY, eImprovement)
	if eImprovement == tImprovementsUCS[9] then
		local pPlot = Map.GetPlot(iX, iY)
		
		pPlot:SetImprovementType(-1)
		pPlot:SetFeatureType(tFeatureTypes[3], -1)
	end
end

-- promotion
--[[function InvisibleMarshOnMove(ePlayer, eUnit, iX, iY) 
	local pPlayer = Players[ePlayer]
	
	local pUnit = pPlayer:GetUnitByID(eUnit)
	local eUnitCombat = pUnit:GetUnitCombatType()
	local pPlot = pUnit:GetPlot()
	local bOnMarsh = pPlot and pPlot:GetFeatureType() == tFeatureTypes[3]
	local bInCity = pPlot and pPlot:IsCity()
	
	local bIsHasEventOn = pPlayer:GetEventChoiceCooldown(tEventChoice[2]) ~= 0
	
	-- main promotion
	if bIsHasEventOn then
		if eUnitCombat == GameInfoTypes.UNITCOMBAT_RECON or eUnitCombat == GameInfoTypes.UNITCOMBAT_MELEE or eUnitCombat == GameInfoTypes.UNITCOMBAT_GUN then
			pUnit:SetHasPromotion(tPromotionsActiveAbilities[21], bOnMarsh)
		end
	else
		if pUnit:IsHasPromotion(tPromotionsActiveAbilities[21]) then
			pUnit:SetHasPromotion(tPromotionsActiveAbilities[21], false)
		end
	end

	-- counter promotion
	if eUnitCombat == GameInfoTypes.UNITCOMBAT_RECON or bInCity then
		if bOnMarsh then
			pUnit:SetHasPromotion(tPromotionsActiveAbilities[22], true)
		else
			local bIsMarshAround = false

			for i, direction in ipairs(tDirectionTypes) do
				local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
					
				if pAdjacentPlot then
					if pAdjacentPlot:GetFeatureType() == tFeatureTypes[3] then
						bIsMarshAround = true
						break
					end
				end
			end

			pUnit:SetHasPromotion(tPromotionsActiveAbilities[22], bIsMarshAround)
		end
	end
end

function InvisibleMarshOnEventOn(ePlayer, eEventChoiceType)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if eEventChoiceType == tEventChoice[2] then
		for unit in pPlayer:Units() do
			local eUnitCombat = unit:GetUnitCombatType()
				
			if eUnitCombat == GameInfoTypes.UNITCOMBAT_RECON or eUnitCombat == GameInfoTypes.UNITCOMBAT_MELEE or eUnitCombat == GameInfoTypes.UNITCOMBAT_GUN then
				local pPlot = unit:GetPlot()
				local bOnMarsh = pPlot and pPlot:GetFeatureType() == tFeatureTypes[3]
					
				unit:SetHasPromotion(tPromotionsActiveAbilities[21], bOnMarsh)
			end
		end
	end
end

function InvisibleMarshOnEventOff(ePlayer, eEventChoiceType)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if eEventChoiceType == tEventChoice[2] then
		for unit in pPlayer:Units() do
			unit:SetHasPromotion(tPromotionsActiveAbilities[21], false)
		end
	end
end--]]



-- ADEJE (IMPROVEMENT/RESOURCE DOGO CANARIO)
function CanWePlaceDogoCanario(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_DOGO_CANARIO then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[42]) > 0) then return false end
	
	local pPlot = Map.GetPlot(iX, iY)
	
	-- hills requirement moved here because HillsMakesValid was treated as OR to terrain requirement
	if not pPlot:IsHills() then return false end

	local eResource = pPlot:GetResourceType()
	
	if eResource ~= -1 then return false end

	for i, direction in ipairs(tDirectionTypes) do
		local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
		local eAdjacentResourceType = pAdjacentPlot:GetResourceType()
						
		if eAdjacentResourceType == tResourcesLuxury[1] then return false end
	end
	
	return true
end
GameEvents.PlayerCanBuild.Add(CanWePlaceDogoCanario)

function PlacedDogoCanario(ePlayer, iX, iY, eImprovement)
	if eImprovement == tImprovementsUCS[7] then
		local pPlot = Map.GetPlot(iX, iY)
		
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(tResourcesLuxury[1], 1)
	end
end



-- YAIUWA (IMPROVEMENT/RESOURCE LLAO LLAO)
function CanWePlaceLlaoLlao(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_LLAO_LLAO then
		return true
	else
		return false
	end
	
	local pPlayer = Players[ePlayer]
	
	--if not (pPlayer:GetEventChoiceCooldown(tEventChoice[??]) > 0) then return false end

	return true
end
GameEvents.PlayerCanBuild.Add(CanWePlaceLlaoLlao)

function PlacedLlaoLlao(ePlayer, iX, iY, eImprovement)
	if eImprovement == tImprovementsUCS[8] then
		local pPlot = Map.GetPlot(iX, iY)
		
		pPlot:SetResourceType(tResourcesLuxury[2], 1)
		pPlot:SetImprovementType(tImprovementsRegular[2])
	end
end
GameEvents.BuildFinished.Add(PlacedLlaoLlao) -- !!!DELETE


	
-- CAHOKIA (IMPROVEMENT MOUND)
function CanWeBuildMound(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_MOUND then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[3]) > 0) then return false end
	
	return true
end
GameEvents.PlayerCanBuild.Add(CanWeBuildMound)



-- SGAANG GWAAY (IMPROVEMENT TOTEM POLE)
function CanWeBuildTotemPole(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_TOTEM_POLE then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[40]) > 0) then return false end

	local pPlot = Map.GetPlot(iX, iY)

	-- complex requirement that involves coast, lake and other factors
	if pPlot:IsAdjacentToShallowWater() then
		return true
	else
		for i, direction in ipairs(tDirectionTypes) do
			local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
			local eImprovementType = pAdjacentPlot:GetImprovementType()
						
			if pAdjacentPlot and (pAdjacentPlot:IsCity() or eImprovementType == tImprovementsRegular[3] or eImprovementType == tImprovementsGreatPeople[5]) then 
				return true
			end
		end
	end

	return false
end
GameEvents.PlayerCanBuild.Add(CanWeBuildTotemPole)



-- NYARYANA MARQ (IMPROVEMENT CHUM)
function CanWeBuildChum(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_CHUM then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[41]) > 0) then return false end
	
	return true
end
GameEvents.PlayerCanBuild.Add(CanWeBuildChum)



-- LA VENTA (IMPROVEMENT COLOSSAL HEAD)
function CanWeBuildColossalHead(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_BIG_HEAD then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[23]) > 0) then return false end

	local pPlot = Map.GetPlot(iX, iY)

	local eTerrain = pPlot:GetTerrainType()

	-- terrain requirement moved here because it was omitted by the feature requirement
	if eTerrain == tTerrainTypes[5] or eTerrain == tTerrainTypes[6] then
		return true
	end
	
	return false
end
GameEvents.PlayerCanBuild.Add(CanWeBuildColossalHead)



-- TUNIS (IMPROVEMENT RIBAT)
function CanWeBuildRibat(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_RIBAT then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[67]) > 0) then return false end
	
	--[[for i, direction in ipairs(tDirectionTypes) do
		local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
						
		if pAdjacentPlot and pAdjacentPlot:IsCity() then return false end
	end--]]

	return true
end
GameEvents.PlayerCanBuild.Add(CanWeBuildRibat)



-- BACTRA (IMPROVEMENT PHROURION)
function CanWeBuildPhrourion(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_PHROURION then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[61]) > 0) then return false end
	
	local pPlot = Map.GetPlot(iX, iY)

	--[[for i, direction in ipairs(tDirectionTypes) do
		local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
		
		if pAdjacentPlot and pAdjacentPlot:IsCity() then return false end
	end--]]

	if pPlot:IsRiverSide() then return true end

	for i, direction in ipairs(tDirectionTypes) do
		local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
		
		if pAdjacentPlot then
			if pAdjacentPlot:IsLake() then return true end
		end
	end
	
	return false
end
GameEvents.PlayerCanBuild.Add(CanWeBuildPhrourion)

function BuiltPhrourion(ePlayer, iX, iY, eImprovement)
	if eImprovement == tImprovementsUCS[14] then
		local pPlot = Map.GetPlot(iX, iY)
		local eFeature = pPlot:GetFeatureType()

		if eFeature == tFeatureTypes[1] or eFeature == tFeatureTypes[2] then
			pPlot:SetResourceType(tResourcesLuxury[3], 1)
		end
	end
end




-- PALMYRA (IMPROVEMENT FUNERARY TOWER)
function CanWeBuildFuneraryTower(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_FUNERARY_TOWER then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[57]) > 0) then return false end

	local pPlot = Map.GetPlot(iX, iY)
	local ePlotOwner = pPlot:GetOwner()
	local bIsOnOrAdjacentToOwned = ePlotOwner == ePlayer

	if not bIsOnOrAdjacentToOwned then
		for i, direction in ipairs(tDirectionTypes) do
			local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
			local eAdjacentPlotOwner = pAdjacentPlot:GetOwner()
			local eImprovementType = pAdjacentPlot:GetImprovementType()

			if eAdjacentPlotOwner == ePlayer or eImprovementType == tImprovementsUCS[11] then 
				bIsOnOrAdjacentToOwned = true
				break
			end
		end
	end

	return bIsOnOrAdjacentToOwned
end
GameEvents.PlayerCanBuild.Add(CanWeBuildFuneraryTower)

function BuiltFuneraryTower(ePlayer, iX, iY, eImprovement)
	if eImprovement == tImprovementsUCS[11] then
		local pPlot = Map.GetPlot(iX, iY)
		local ePlotOwner = pPlot:GetOwner()
		local pClosestCity = nil

		if ePlotOwner == ePlayer then 
			pClosestCity = pPlot:GetWorkingCity()
		else
			for i, direction in ipairs(tDirectionTypes) do
				local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
				local eAdjacentPlotOwner = pAdjacentPlot:GetOwner()
				
				if eAdjacentPlotOwner == ePlayer then 
					pClosestCity = pAdjacentPlot:GetWorkingCity()
					pPlot:SetOwner(ePlayer, pClosestCity:GetID())
					break
				end
			end
		end

		pClosestCity:SetNumRealBuilding(tBuildingsActiveAbilities[28], pClosestCity:GetNumRealBuilding(tBuildingsActiveAbilities[28]) + 1)
	end
end



-- MOGADISHU (IMPROVEMENT DAAQ AH)
function CanWeBuildDaaqAh(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_DAAQ_AH then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[59]) > 0) then return false end
	
	local pPlot = Map.GetPlot(iX, iY)

	if not pPlot:IsHills() then return false end

	return true
end
GameEvents.PlayerCanBuild.Add(CanWeBuildDaaqAh)

function BuiltDaaqAh(ePlayer, iX, iY, eImprovement)
	if eImprovement == tImprovementsUCS[13] then
		local pPlot = Map.GetPlot(iX, iY)
		local eResource = pPlot:GetResourceType()

		if eResource == tResourcesBonus[3] or eResource == tResourcesBonus[4] --[[or eResource == tResourcesStrategic[1]--]] then
			-- do nothing		
		elseif eResource == -1 then
			local iRoll = Game.Rand(1, "0=Cow, 1=Sheep")
			
			if iRoll == 0 then
				pPlot:SetResourceType(tResourcesBonus[3], 1)
			elseif iRoll == 1 then
				pPlot:SetResourceType(tResourcesBonus[4], 1)
			end
		--[[else
			pPlot:SetResourceType(tResourcesStrategic[1], 3)--]]
		end
	end
end



-- TIWANAKU (IMPROVEMENT SUNKEN COURTYARD)
function CanWeBuySisqeno(ePlayer, eCity, eUnit)
	if eUnit ~= tUnitsCivilian[9] then return true end
	
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return false end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[17]) ~= 0 then
		return true
	else
		return false
	end
end
GameEvents.CityCanTrain.Add(CanWeBuySisqeno)

function DummyWorkerForAISisqeno(ePlayer, eCity, eUnit, bGold, bFaith)	
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsHuman() then
		local pUnit = pPlayer:GetUnitByID(eUnit)
		
		if pUnit and pUnit:GetUnitType() == tUnitsCivilian[9] then
			pPlayer:AddFreeUnit(tUnitsCivilian[10], UNITAI_DEFENSE)
			
			for unit in pPlayer:Units() do
				if unit:GetUnitType() == tUnitsCivilian[10] and unit:GetMoves() > 0 and unit:GetPlot():GetWorkingCity():GetID() == eCity then
					unit:SetMoves(0)
					break
				end
			end
		end
	end
end

function CanWeBuildSunkenCourtyard(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_SUNK_COURT_HUMAN and eBuild ~= GameInfoTypes.BUILD_SUNK_COURT_AI then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[17]) > 0) then return false end
	
	local pUnit = pPlayer:GetUnitByID(eUnit)
	
	if pUnit:GetUnitType() == tUnitsCivilian[9] and pPlayer:IsHuman() then
		return true
	elseif pUnit:GetUnitType() == tUnitsCivilian[9] and not pPlayer:IsHuman() then
		-- AI cannot build SC with Sisqeno (must use a Worker)
		return false
	elseif pUnit:GetUnitType() == tUnitsCivilian[10] then
		for unit in pPlayer:Units() do
			if unit:GetUnitType() == tUnitsCivilian[9] then
				return true
			end
		end
	end
	
	return false
end
GameEvents.PlayerCanBuild.Add(CanWeBuildSunkenCourtyard)

function BuiltSunkenCourtyard(ePlayer, iX, iY, eImprovement)
	-- event triggers twice, so this should prevent it
	bBlockDoubleTriggering = not bBlockDoubleTriggering
	
	if bBlockDoubleTriggering then
		if eImprovement == tImprovementsUCS[2] then
			local pPlayer = Players[ePlayer]

			-- AI part (Rook and Bishop mechanic; AI cannot build the SC with Sisqeno because the Missionary algorithm is dumb and that's why it gains additional dummy Worker,
			-- that can only build this one improvement. When it does it lowers the number of Spreads of 1 Sisqeno on the map (oldest), and blocks it from additional action
			-- (if alive), so it couldn't do Spread Religion action same turn (same thing must be done when religion is spread).
			if not pPlayer:IsHuman() then
				for unit in pPlayer:Units() do
					if unit:GetUnitType() == tUnitsCivilian[9] then
						if unit:GetSpreadsLeft() > 1 then
							unit:SetSpreadsLeft(unit:GetSpreadsLeft() - 1)
							unit:SetMoves(0)
						else
							unit:Kill()
						end

						break
					end
				end
			-- Human part (Queen; Humans does not get any Worker because they can do both things with their Sisqeno unit)
			else
				local pPlot = Map.GetPlot(iX, iY)
				local iNumUnits = pPlot:GetNumUnits();
				local tMatchedUnits = {}

				if iNumUnits > 0 then
					for i = 0, iNumUnits - 1 do
						local pUnit = pPlot:GetUnit(i);
						
						if pUnit:GetUnitType() == tUnitsCivilian[9] --[[and pUnit:IsBusy()--]] and pUnit:GetSpreadsLeft() > 1 and pUnit:GetOwner() == ePlayer then
							table.insert(tMatchedUnits, pUnit)
						end
					end
				end
				
				if #tMatchedUnits == 0 then return false end
				
				local pRandomUnit = table.remove(tMatchedUnits, Game.Rand(#tMatchedUnits, "Choose random Sisqeno on the tile") + 1)

				pRandomUnit:SetSpreadsLeft(pRandomUnit:GetSpreadsLeft() - 1)
			end
		end
	end
end

-- OnSpread (unavailable)



-- AL-TIRABIN (IMPROVEMENT BEDOUIN CAMP, TRADE ROUTES)
function CanWeBuildBedouinCamp(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_BEDOUIN_CAMP then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[58]) > 0) then return false end

	--[[for i, direction in ipairs(tDirectionTypes) do
		local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
						
		if pAdjacentPlot and pAdjacentPlot:IsCity() then return false end
	end--]]

	return true
end
GameEvents.PlayerCanBuild.Add(CanWeBuildBedouinCamp)

function TradeRoutesFromBedouinsOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[58] then
		AddTradeRoutesFromBedouins(ePlayer)
	end
end

function TradeRoutesFromBedouinsOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[58] then
		local pPlayer = Players[ePlayer]
		local pCapital = pPlayer:GetCapitalCity()
		
		pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[30], 0)
	end
end

function TradeRoutesFromBedouinsOnEraChange(eTeam, eEra, bFirst)
	for eplayer = 0, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pPlayer = Players[eplayer]

		if pPlayer and pPlayer:IsAlive() then
			if pPlayer:IsMinorCiv() then return end

			local ePlayerTeam = pPlayer:GetTeam()

			if ePlayerTeam == eTeam then
				if pPlayer:GetEventChoiceCooldown(tEventChoice[58]) ~= 0 then
					AddTradeRoutesFromBedouins(eplayer)

					if eEra == 2 or eEra == 4 or eEra == 6 then
						if pPlayer:IsHuman() then
							local pCapital = pPlayer:GetCapitalCity()
							local pAlTirabin = Players[tLostCities["eLostAlTirabin"]]

							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_AL_TIRABIN", pAlTirabin:GetName()), L("TXT_KEY_UCS_BONUS_AL_TIRABIN_TITLE"), pCapital:GetX(), pCapital:GetY())
						end
					end
				end
			end
		end
	end
end

function AddTradeRoutesFromBedouins(ePlayer)
	local pPlayer = Players[ePlayer]
	local pCapital = pPlayer:GetCapitalCity()
	local iTradeRoutesAvailable = math.floor((pPlayer:GetCurrentEra() + 2) / 2) -- only in Ancient, Medieval, Industrial and Information
	
	pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[30], iTradeRoutesAvailable)
end



-- LONGYAN (IMPROVEMENT TULOU)
function CanWeBuildTulou(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_TULOU then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[53]) > 0) then return false end
	
	local bCity = false

	for i, direction in ipairs(tDirectionTypes) do
		local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
						
		if pAdjacentPlot and pAdjacentPlot:IsCity() then bCity = true end
	end

	return bCity
end
GameEvents.PlayerCanBuild.Add(CanWeBuildTulou)

function BuiltTulou(ePlayer, iX, iY, eImprovement)
	if eImprovement == tImprovementsUCS[6] then
		-- Supply Cap
		CountTulous(ePlayer)

		-- Population
		local pPlayer = Players[ePlayer]
		local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
		local pLongyan = Players[tLostCities["eLostLongyan"]]
		
		pCity:ChangePopulation(1, true)
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_LONGYAN_POP", pLongyan:GetName(), pCity:GetName()), L("TXT_KEY_UCS_BONUS_LONGYAN_POP_TITLE"), pCity:GetX(), pCity:GetY())
		end
	end
end

function TulouPillagedOrDestroyed(iX, iY, ePlotOwner, eOldImprovement, eNewImprovement, bPillaged)
	if eOldImprovement ~= tImprovementsUCS[6] then return end
	
	CountTulous(ePlotOwner)
end

function TulousOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[53] then
		CountTulous(ePlayer)
	end
end

function TulousOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[53] then
		local pPlayer = Players[ePlayer]
		local pCapital = pPlayer:GetCapitalCity()
		
		pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[27], 0)
	end
end

function TulousOnCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	CountTulous(eOldOwner)
	CountTulous(eNewOwner)
end

function CountTulous(ePlayer)
	local pPlayer = Players[ePlayer]

	if pPlayer:GetEventChoiceCooldown(tEventChoice[53]) ~= 0 then	
		local pCapital = pPlayer:GetCapitalCity()
		local iNumTulous = pPlayer:GetImprovementCount(tImprovementsUCS[6])

		pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[27], iNumTulous)
	end
end



-- KARYES (IMPROVEMENT MONASTERY, BONUSES FROM MONASTERIES)
function CanWeBuildMonastery(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_MONASTERY then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[39]) > 0) then return false end
	
	--[[for i, direction in ipairs(tDirectionTypes) do
		local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
						
		if pAdjacentPlot and pAdjacentPlot:IsCity() then return false end
	end--]]

	return true
end
GameEvents.PlayerCanBuild.Add(CanWeBuildMonastery)

function BuiltMonastery(ePlayer, iX, iY, eImprovement)
	if eImprovement == tImprovementsUCS[3] then
		CheckAllMonasteries()
	end
end

function MonasteryPillagedOrDestroyed(iX, iY, ePlotOwner, eOldImprovement, eNewImprovement, bPillaged)
	if eOldImprovement ~= tImprovementsUCS[3] then return end
	
	CheckAllMonasteries()
end

function MonasteriesOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[39] then
		PlaceDummiesForMonasteries()
	end
end

function MonasteriesOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[39] then
		PlaceDummiesForMonasteries()
	end
end

function MonasteriesOnCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	CheckAllMonasteries()
end

function MonasteriesOnNewCity(ePlayer, iX, iY)
	CheckAllMonasteries()
end

function PlaceDummiesForMonasteries()
	for eplayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pPlayer = Players[eplayer]
	
		if pPlayer:IsAlive() then
			if pPlayer:GetEventChoiceCooldown(tEventChoice[39]) ~= 0 then	
				for city in pPlayer:Cities() do
					if city:GetNumRealBuilding(tBuildingsActiveAbilities[29]) >= 3 then
						city:SetNumRealBuilding(tBuildingsActiveAbilities[20], 1)
					else
						city:SetNumRealBuilding(tBuildingsActiveAbilities[20], 0)
					end
				end
			else
				for city in pPlayer:Cities() do
					city:SetNumRealBuilding(tBuildingsActiveAbilities[20], 0)
				end
			end
		end
	end
end

function CheckAllMonasteries()
	for eplayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pPlayer = Players[eplayer]
	
		if pPlayer:IsAlive() then
			for city in pPlayer:Cities() do
				local iMonasteries = 0

				for iplot = 0, city:GetNumCityPlots() - 1 do
					local pPlot = city:GetCityIndexPlot(iplot)

					if pPlot then
						local eImprovementType = pPlot:GetImprovementType()
						
						if eImprovementType == tImprovementsUCS[3] and not pPlot:IsImprovementPillaged() then
							iMonasteries = iMonasteries + 1
						end
						
						city:SetNumRealBuilding(tBuildingsActiveAbilities[29], iMonasteries)

						if iMonasteries >= 3 then
							break
						end
					end
				end
			end
		end
	end

	PlaceDummiesForMonasteries()
end



-- CAPE TOWN (BENEFITS FROM TRADE ROUTES)
function TradeInCapeTown(eFromPlayer, eFromCity, eToPlayer, eToCity, eDomain, eConnectionType)
	local pPlayer = Players[eFromPlayer]
		
	if pPlayer:GetEventChoiceCooldown(tEventChoice[4]) ~= 0 then
		local pToPlayer = Players[eToPlayer]
		local iBaseYield = RandomNumberBetween(20, 40)
		local iPopulationModifier = pToPlayer:GetCityByID(eToCity):GetPopulation()
		local iActualTRNumberModifier = pPlayer:GetNumInternationalTradeRoutesUsed() * 0.6
		local iCahChing = math.ceil((iBaseYield * iPopulationModifier) / iActualTRNumberModifier)
		local pPlayerCity = pPlayer:GetCityByID(eFromCity)
		local pCapeTown = Players[tLostCities["eLostCapeTown"]]
		
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iCahChing, true, eFromCity)

		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_CAPE_TOWN", pCapeTown:GetName(), iCahChing), L("TXT_KEY_UCS_BONUS_CAPE_TOWN_TITLE"), pPlayerCity:GetX(), pPlayerCity:GetY())
		end
	end
end


-- MANILA (YIELDS AT THE END FOR TRADE)
function TradeInManila(eFromPlayer, eFromCity, eToPlayer, eToCity, eDomain, eConnectionType)
	local pPlayer = Players[eFromPlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[5]) ~= 0 then
		local pToPlayer = Players[eToPlayer]
		local iBaseYield = RandomNumberBetween(25, 50)
		local iPopulationModifier = pToPlayer:GetCityByID(eToCity):GetPopulation()
		local iActualTRNumberModifier = pPlayer:GetNumInternationalTradeRoutesUsed() * 0.6
		local iYumYum = math.ceil((iBaseYield * iPopulationModifier) / iActualTRNumberModifier)
		local pPlayerCity = pPlayer:GetCityByID(eFromCity)
		local pManila = Players[tLostCities["eLostManila"]]

		pPlayer:DoInstantYield(GameInfoTypes.YIELD_FOOD, iYumYum, true, eFromCity)
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_PRODUCTION, iYumYum, true, eFromCity)
		
		if pPlayer:IsHuman() then 
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_MANILA", pManila:GetName(), iYumYum), L("TXT_KEY_UCS_BONUS_MANILA_TITLE"), pPlayerCity:GetX(), pPlayerCity:GetY())
		end
	end
end


-- COLOMBO (HEAL UNITS AT THE END FOR TRADE)
function TradeInColombo(eFromPlayer, eFromCity, eToPlayer, eToCity, eDomain, eConnectionType)
	local pPlayer = Players[eFromPlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[18]) ~= 0 then
		if eFromPlayer ~= eToPlayer then
			local pCity = pPlayer:GetCityByID(eFromCity)
			local pColombo = Players[tLostCities["eLostColombo"]]

			for unit in pPlayer:Units() do
				unit:ChangeDamage(-10)
			end

			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_COLOMBO", pCity:GetName(), pColombo:GetName()), L("TXT_KEY_UCS_BONUS_COLOMBO_TITLE"), pCity:GetX(), pCity:GetY())
			end
		end
	end		
end



-- HANUABADA (HIRI TRADE CYCLE)
function TradeInHanuabada(eFromPlayer, eFromCity, eToPlayer, eToCity, eDomain, eConnectionType)
	local pPlayer = Players[eFromPlayer]
		
	if pPlayer:GetEventChoiceCooldown(tEventChoice[60]) ~= 0 then
		if eDomain == tDomainTypes[2] then
			local pToPlayer = Players[eToPlayer]
			local iBaseYield = RandomNumberBetween(10, 50)
			local iPopulationModifier = pToPlayer:GetCityByID(eToCity):GetPopulation()
			local iActualTRNumberModifier = pPlayer:GetNumInternationalTradeRoutesUsed() * 0.6
			local iHiri = math.ceil((iBaseYield * iPopulationModifier) / iActualTRNumberModifier)
			local pPlayerCity = pPlayer:GetCityByID(eFromCity)
			local pHanuabada = Players[tLostCities["eLostHanuabada"]]
		
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLDEN_AGE_POINTS, iHiri, true, eFromCity)

			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_HANUABADA", pHanuabada:GetName(), iHiri), L("TXT_KEY_UCS_BONUS_HANUABADA_TITLE"), pPlayerCity:GetX(), pPlayerCity:GetY())
			end
		end
	end
end



-- KIEV/MILAN/VILNIUS/VALETTA (STARTING BUILDINGS FOR CERTAIN CITY-STATES)
function SettledCityStateWithBuilding(ePlayer, iPlotX, iPlotY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer then return end
	if pPlayer:IsMinorCiv() and pPlayer:IsAlive() then
		local pSettledCity = Map.GetPlot(iPlotX, iPlotY):GetPlotCity()
		
		if GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_KIEV" then
			pSettledCity:SetNumRealBuilding(GameInfoTypes.BUILDING_KIEV, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_MILAN" then
			pSettledCity:SetNumRealBuilding(GameInfoTypes.BUILDING_MILAN, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_VALLETTA" then
			if pSettledCity:IsCoastal(10) then
				pSettledCity:SetNumRealBuilding(GameInfoTypes.BUILDING_VALLETTA, 1)
			end
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_VILNIUS" then
			pSettledCity:SetNumRealBuilding(GameInfoTypes.BUILDING_VILNIUS, 1)
		end
	end
end

function LiberatedCityStateWithBuilding(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[eOtherPlayer]
	
	if pPlayer:IsMinorCiv() then
		local pLiberatedCity = pPlayer:GetCapitalCity()
		
		if GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_KIEV" then
			pLiberatedCity:SetNumRealBuilding(GameInfoTypes.BUILDING_KIEV, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_MILAN" then
			pLiberatedCity:SetNumRealBuilding(GameInfoTypes.BUILDING_MILAN, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_VALLETTA" then
			if pLiberatedCity:IsCoastal(10) then
				pLiberatedCity:SetNumRealBuilding(GameInfoTypes.BUILDING_VALLETTA, 1)
			end
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_VILNIUS" then
			pLiberatedCity:SetNumRealBuilding(GameInfoTypes.BUILDING_VILNIUS, 1)
		end
	end
end



-- ZURICH (GOLD INTERESTS)
function ZurichMerchants(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[6]) ~= 0 then
		local iInterest = pPlayer:GetGold() * 0.02
		local iInterestCap = 20 * (pPlayer:GetCurrentEra() + 1)
		local pCapital = pPlayer:GetCapitalCity()
		local pMinorPlayer = Players[tLostCities["eLostZurich"]]
		local iCounterThreshold = 5
		
		if iInterest > iInterestCap then iInterest = iInterestCap end
		
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iInterest, true, pCapital:GetID())
		
		if tZurichCounter[ePlayer] == nil then
			tZurichCounter[ePlayer] = 1
			tZurichLastInterests[ePlayer] = iInterest
		else
			tZurichCounter[ePlayer] = tZurichCounter[ePlayer] + 1
			tZurichLastInterests[ePlayer] = tZurichLastInterests[ePlayer] + iInterest
		end
		
		if tZurichCounter[ePlayer] >= iCounterThreshold then
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_ZURICH", pMinorPlayer:GetName(), tZurichLastInterests[ePlayer], iCounterThreshold), L("TXT_KEY_UCS_BONUS_ZURICH_TITLE"), pCapital:GetX(), pCapital:GetY())
			end

			tZurichCounter[ePlayer] = 0
			tZurichLastInterests[ePlayer] = 0
		end
	end
end

function ZurichMerchantsNoAlly(eMinor, eMajor, bIsAlly, iOldFriendship, iNewFriendship)
	local pMinorPlayer = Players[eMinor]
	local pMajorPlayer = Players[eMajor]
	
	if GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type == "MINOR_CIV_ZURICH" then
		if not bIsAlly then
			local pCapital = pMajorPlayer:GetCapitalCity()
			
			if tZurichCounter[eMajor] == 0 then
				if pMajorPlayer:IsHuman() then
					pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_ZURICH_STOP_ALLY_ZERO", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_ZURICH_STOP_ALLY_TITLE"), pCapital:GetX(), pCapital:GetY())
				end
			else
				if pMajorPlayer:IsHuman() then
					pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_ZURICH_STOP_ALLY", pMinorPlayer:GetName(), tZurichCounter[eMajor], tZurichLastInterests[eMajor]), L("TXT_KEY_UCS_BONUS_ZURICH_STOP_ALLY_TITLE"), pCapital:GetX(), pCapital:GetY())
				end
			end

			tZurichCounter[eMajor] = 0
			tZurichLastInterests[eMajor] = 0
        end
	end
end



-- JERUSALEM (SPHERE OF INFLUENCE AND RELIGION FOR AN ALLY)
function JerusalemsDevotion(ePlayer)
	for _, pplayer in ipairs(Players) do
		if pplayer and pplayer:IsAlive() and pplayer:IsMinorCiv() then
		    local pMinorPlayer = pplayer
		    
		    if GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type == "MINOR_CIV_JERUSALEM" then
				if pMinorPlayer:IsAllies(ePlayer) then
					local pMajorPlayer = Players[ePlayer]

			if not pMajorPlayer:HasCreatedReligion() then return end
					
            		if pMajorPlayer:GetMajorityReligion() ~= nil and pMajorPlayer:GetMajorityReligion() ~= pMinorPlayer:GetMajorityReligion() then
            			local pJerusalemCity = pMinorPlayer:GetCapitalCity()
				
						pJerusalemCity:AdoptReligionFully(pMajorPlayer:GetMajorityReligion())
						pJerusalemCity:SetNumRealBuilding(tBuildingsActiveAbilities[10], 1)
						
						if pMajorPlayer:IsHuman() then
							pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_JERUSALEM_RELIGION", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_JERUSALEM_RELIGION_TITLE"), pJerusalemCity:GetX(), pJerusalemCity:GetY())
						end
            		end
        		
        		    break
                end
    	    end
    	end
	end
end

function JerusalemsDevotionSphere(eMinor, eMajor, bIsAlly, iOldFriendship, iNewFriendship)
	local pMinorPlayer = Players[eMinor]
	local pMajorPlayer = Players[eMajor]
	
	if GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type == "MINOR_CIV_JERUSALEM" then
		if bIsAlly then
			if Game.GetNumActiveLeagues() ~= 0 and not Game.IsResolutionPassed(eSphere, tLostCities["eLostJerusalem"]) then
            	local pJerusalemCity = pMinorPlayer:GetCapitalCity()
				
				Game.DoEnactResolution(eSphere, tLostCities["eLostJerusalem"], eMajor)
            			
            	if pMajorPlayer:IsHuman() then
            		pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_JERUSALEM_SPHERE", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_JERUSALEM_SPHERE_TITLE"), pJerusalemCity:GetX(), pJerusalemCity:GetY())
            	end
			end
        end
	end
end



-- SIDON (SPHERE OF INFLUENCE FROM DEMANDING TRIBUTE)
function DestroyLifeForSidon(ePlayer, eCS, iGold, eUnitType, iPlotX, iPlotY)
	local pPlayer = Players[ePlayer]

	if not Game.IsResolutionPassed(eSphere, tLostCities["eLostSidon"]) and pPlayer:GetEventChoiceCooldown(tEventChoice[7]) ~= 0 and Game.GetNumActiveLeagues() ~= 0 then
		local pMinorPlayer = Players[tLostCities["eLostSidon"]]
		local pSidonCity = pMinorPlayer:GetCapitalCity()
		
		Game.DoEnactResolution(eSphere, tLostCities["eLostSidon"], ePlayer)
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_SIDON", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_SIDON_TITLE"), pSidonCity:GetX(), pSidonCity:GetY())
		end
	end
end



-- LHASA (SPHERE OF INFLUENCE FROM WW)
function CanWeBuildPotalaPalace(ePlayer, eBuilding)
	if eBuilding ~= tBuildingsActiveAbilities[1] then return true end
	if Game.GetNumActiveLeagues() == 0 then return false end
	if Players[ePlayer]:GetEventChoiceCooldown(tEventChoice[8]) ~= 0 then return true	end
	
	return false
end

function BuiltWonderForLhasa(ePlayer, eCity, eBuilding, bGold, bFaith)
	if eBuilding == tBuildingsActiveAbilities[1] then
		local pPlayer = Players[ePlayer]
		local pCity = pPlayer:GetCityByID(eCity)
		local pMinorPlayer = Players[tLostCities["eLostLhasa"]]
		
		Game.DoEnactResolution(eSphere, tLostCities["eLostLhasa"], ePlayer)
		--GameEvents.CityConstructed.Remove(BuiltWonderForLhasa)
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_LHASA", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_LHASA_TITLE"), pCity:GetX(), pCity:GetY())
		end
	end
end



-- ÓC EO (TRADE ROUTES INTO GROWTH)
	--[[	Domain - DomainTypes.DOMAIN_LAND or DomainTypes.DOMAIN_SEA (int)
		TurnsLeft - turns left before the trade route can be reassigned (int)
		FromCivilizationType - eg GameInfoTypes.CIVILIZATION_ENGLAND (int)
		FromID - from player ID (int)
		FromCityName - from city name (string)
		FromCity - from city (Lua pCity object)
		ToCivilizationType - to player civ type (int)
		ToID - to player ID (int)
		ToCityName - to city name (string)
		ToCity - to city (Lua pCity object)
		FromGPT - route yield (int)
		ToGPT - route yield (int)
		ToFood - route yield (int)
		ToProduction - route yield (int)
		FromScience - route yield (int)
		ToScience - route yield (int)
		ToReligion - to religion type (or -1) (int)
		ToPressure - to pressure (int)
		FromReligion - from religion type (or -1) (int)
		FromPressure - from pressure (int)
		FromTourism - from tourism (int)
		ToTourism - to tourism (int) --]]

function LordsOfTheGreatGlassRiver(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[9]) ~= 0 then
		local iInternationalSeaTradeRoutes = InternationalSeaTradeRoutes(ePlayer, pPlayer)
		local pCapitalCity = pPlayer:GetCapitalCity()
		
		for city in pPlayer:Cities() do
			if city:IsCoastal(10) then
				city:SetNumRealBuilding(tBuildingsActiveAbilities[2], iInternationalSeaTradeRoutes)
			end
		end
		
		pCapitalCity:SetNumRealBuilding(tBuildingsActiveAbilities[3], iInternationalSeaTradeRoutes)
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[2]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[3]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[9]) then
				for city in pPlayer:Cities() do
					city:SetNumRealBuilding(tBuildingsActiveAbilities[2], 0)
					city:SetNumRealBuilding(tBuildingsActiveAbilities[3], 0)
				end
			end
		end
	end
	
	
end

function LordsOfTheGreatGlassRiverOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[9] then
		local pPlayer = Players[ePlayer]
		local iInternationalSeaTradeRoutes = InternationalSeaTradeRoutes(ePlayer, pPlayer)
		local pCapitalCity = pPlayer:GetCapitalCity()
		
		for city in pPlayer:Cities() do
			if city:IsCoastal(10) then
				city:SetNumRealBuilding(tBuildingsActiveAbilities[2], iInternationalSeaTradeRoutes)
			end
		end
		
		pCapitalCity:SetNumRealBuilding(tBuildingsActiveAbilities[3], iInternationalSeaTradeRoutes)
	end
end

function LordsOfTheGreatGlassRiverOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[9] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			city:SetNumRealBuilding(tBuildingsActiveAbilities[2], 0)
			city:SetNumRealBuilding(tBuildingsActiveAbilities[3], 0)
		end
	end
end

function LordsOfTheGreatGlassRiverCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[9]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsCoastal(10) then
			local iInternationalSeaTradeRoutes = InternationalSeaTradeRoutes(eNewOwner, pNewOwner)
			
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[2], iInternationalSeaTradeRoutes)
		end
	else	
		if not pNewOwner:IsEventChoiceActive(tEventChoice[9]) then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[2], 0)
			end
		end
	end
end

function LordsOfTheGreatGlassRiverNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[9]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
			
		if pPlot then
			local pCity = pPlot:GetWorkingCity()
			
			if pCity:IsCoastal(10) then
				local iInternationalSeaTradeRoutes = InternationalSeaTradeRoutes(ePlayer, pPlayer)
				
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[2], iInternationalSeaTradeRoutes)
			end
		end
	end
end

function InternationalSeaTradeRoutes(ePlayer, pPlayer)
	local iInternationalSeaTradeRoutes = 0
	
	for _, tradeRoute in ipairs(pPlayer:GetTradeRoutes()) do
		if tradeRoute.FromID == ePlayer and tradeRoute.ToID ~= ePlayer and tradeRoute.Domain == GameInfoTypes.DOMAIN_SEA then
			iInternationalSeaTradeRoutes = iInternationalSeaTradeRoutes + 1
		end
	end
	
	return iInternationalSeaTradeRoutes
end



-- THIMPHU (CITY ON HILL?)
function DrukTsendhenOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[10] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			-- culture on hill
			local pPlot = city:Plot()
			
			if pPlot then
				local ePlot = pPlot:GetPlotType()
			
				if ePlot == tPlotTypes[2] then
					city:SetNumRealBuilding(tBuildingsActiveAbilities[4], 1)
				end
			end
			
			-- culture to defense conversion
			local iDefenseToAdd = city:GetJONSCulturePerTurn()
			
			city:SetNumRealBuilding(tBuildingsActiveAbilities[5], iDefenseToAdd)
		end
	end
end

function DrukTsendhenOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[10] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			city:SetNumRealBuilding(tBuildingsActiveAbilities[4], 0)
			city:SetNumRealBuilding(tBuildingsActiveAbilities[5], 0)
		end
	end
end

function DrukTsendhenCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[10]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
			
		if pPlot then		
			local pConqCity = pPlot:GetWorkingCity()

			-- culture on hill
			local ePlot = pPlot:GetPlotType()
			
			if ePlot == tPlotTypes[2] then
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[4], 1)
			end
			
			-- culture to defense conversion
			local iDefenseToAdd = pConqCity:GetJONSCulturePerTurn()
			
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[5], iDefenseToAdd)
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[10]) then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[4], 0)
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[5], 0)
			end
		end
	end
end

function DrukTsendhenNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[10]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
				
		if pPlot then		
			local pCity = pPlot:GetWorkingCity()

			-- culture on hill
			local ePlot = pPlot:GetPlotType()
			
			if ePlot == tPlotTypes[2] then
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[4], 1)
			end
			
			-- culture to defense conversion
			local iDefenseToAdd = pCity:GetJONSCulturePerTurn()
			
			pCity:SetNumRealBuilding(tBuildingsActiveAbilities[5], iDefenseToAdd)
		end
	end
end



-- PELYM (CITY ON TUNDRA OR SNOW?)
function SiberianWarlordsOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[51] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			local pPlot = city:Plot()
			
			if pPlot then
				local eTerrain = pPlot:GetTerrainType()
			
				if eTerrain == tTerrainTypes[1] or eTerrain == tTerrainTypes[2] then
					city:SetNumRealBuilding(tBuildingsActiveAbilities[23], 1)
				end
			end
		end
	end
end

function SiberianWarlordsOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[51] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			city:SetNumRealBuilding(tBuildingsActiveAbilities[23], 0)
		end
	end
end

function SiberianWarlordsCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[51]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
			
		if pPlot then
			local eTerrain = pPlot:GetTerrainType()
		
			if eTerrain == tTerrainTypes[1] or eTerrain == tTerrainTypes[2] then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[23], 1)
			end
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[51]) then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[23], 0)
			end
		end
	end
end

function SiberianWarlordsNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[51]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
				
		if pPlot then
			local eTerrain = pPlot:GetTerrainType()
			
			if eTerrain == tTerrainTypes[1] or eTerrain == tTerrainTypes[2] then
				local pCity = pPlot:GetWorkingCity()
			
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[23], 1)
			end
		end
	end
end



-- RAGUSA (CITY ON COAST?)
function MaritimeSuzeraintyOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[31] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			if city:IsCoastal(10) then
				city:SetNumRealBuilding(tBuildingsActiveAbilities[19], 1)
			end
		end
	end
end

function MaritimeSuzeraintyOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[31] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			city:SetNumRealBuilding(tBuildingsActiveAbilities[19], 0)
		end
	end
end

function MaritimeSuzeraintyCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[31]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
			
		if pPlot then
			local pConqCity = pPlot:GetWorkingCity()
			
			if pConqCity:IsCoastal(10) then
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[19], 1)
			end
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[31]) then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[19], 0)
			end
		end
	end
end

function MaritimeSuzeraintyNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[31]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
				
		if pPlot then
			local pCity = pPlot:GetWorkingCity()
			
			if pCity:IsCoastal(10) then		
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[19], 1)
			end
		end
	end
end



-- RISHIKESH (CITY ON RIVER?)
function HimalayanYogiOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[15] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			local pPlot = city:Plot()
			
			if pPlot then
				if pPlot:IsRiver() then
					city:SetNumRealBuilding(tBuildingsActiveAbilities[11], 1)
				end
			end
		end
	end
end

function HimalayanYogiOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[15] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			city:SetNumRealBuilding(tBuildingsActiveAbilities[11], 0)
		end
	end
end

function HimalayanYogiCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[15]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		
		if pPlot then
			if pPlot:IsRiver() then
				local pConqCity = pPlot:GetWorkingCity()
				
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[11], 1)
			end
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[15]) then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[11], 0)
			end
		end
	end
end

function HimalayanYogiNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[15]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
				
		if pPlot then
			if pPlot:IsRiver() then
				local pCity = pPlot:GetWorkingCity()
			
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[11], 1)
			end
		end
	end
end



-- ANDORRA (MOUNTAIN NEARBY?)
function PyreneanPareageOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[11] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			local iCityX = city:GetX()
			local iCityY = city:GetY()

			for i, direction in ipairs(tDirectionTypes) do
				local pPlot = Map.PlotDirection(iCityX, iCityY, direction)
						
				if pPlot then
					local ePlot = pPlot:GetPlotType()
						
					if ePlot == tPlotTypes[3] then
						city:SetNumRealBuilding(tBuildingsActiveAbilities[6], 1)
						break
					end
				end
			end			
		end
	end
end

function PyreneanPareageOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[11] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			city:SetNumRealBuilding(tBuildingsActiveAbilities[6], 0)
		end
	end
end

function PyreneanPareageCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	local pPlot = Map.GetPlot(iX, iY)
	local pConqCity = pPlot:GetWorkingCity()
			
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[11]) ~= 0 then
		for i, direction in ipairs(tDirectionTypes) do
			local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
						
			if pAdjacentPlot then
				local ePlot = pAdjacentPlot:GetPlotType()
						
				if ePlot == tPlotTypes[3] then
					pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[6], 1)
					break
				end
			end
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[11]) then
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[6], 0)
		end
	end
end

function PyreneanPareageNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[11]) ~= 0 then
		for i, direction in ipairs(tDirectionTypes) do
			local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
						
			if pAdjacentPlot then
				local ePlot = pAdjacentPlot:GetPlotType()
						
				if ePlot == tPlotTypes[3] then
					local pCity = pAdjacentPlot:GetWorkingCity()	
			
					pCity:SetNumRealBuilding(tBuildingsActiveAbilities[6], 1)
					break
				end
			end
		end
	end
end



-- CANOSSA (TEMPLE BUILT?)
function ArdentFlameInPiousHeartOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[12] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			if city:HasBuildingClass(tBuildingClasses[1]) then
				city:SetNumRealBuilding(tBuildingsActiveAbilities[7], 1)
			else
				city:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
			end
		end
	end
end

function ArdentFlameInPiousHeartOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[12] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			city:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
		end
	end
end

function ArdentFlameInPiousHeartCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	local pPlot = Map.GetPlot(iX, iY)
	local pConqCity = pPlot:GetWorkingCity()
			
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[12]) ~= 0 then
		if pConqCity:HasBuildingClass(tBuildingClasses[1]) then
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 1)
		else
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[12]) then
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
		end
	end
end

function ArdentFlameInPiousHeartNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[12]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		
		if pPlot then
			local pCity = pPlot:GetWorkingCity()	

			if pCity:HasBuildingClass(tBuildingClasses[1]) then
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 1)
			end
		end
	end
end

function ArdentFlameInPiousHeartBuildingConstruction(ePlayer, eCity, eBuilding, bGold, bFaith) 
	if GameInfo.Buildings[eBuilding].BuildingClass == "BUILDINGCLASS_TEMPLE" then
		local pPlayer = Players[ePlayer]
	
		if pPlayer:GetEventChoiceCooldown(tEventChoice[12]) ~= 0 then
			local pCity = pPlayer:GetCityByID(eCity)

			pCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 1)
		end
	end
end



-- WOOTEI-NIICIE (CARAVANSARY BUILT? HORSES NEARBY?)
function PeopleOfTheBlueSkyOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[43] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			if city:HasBuildingClass(tBuildingClasses[2]) then
				city:SetNumRealBuilding(tBuildingsActiveAbilities[8], 1)
			else
				city:SetNumRealBuilding(tBuildingsActiveAbilities[8], 0)
			end
		end
	end
end

function PeopleOfTheBlueSkyOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[43] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			city:SetNumRealBuilding(tBuildingsActiveAbilities[8], 0)
		end
	end
end

function PeopleOfTheBlueSkyCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	local pPlot = Map.GetPlot(iX, iY)
	local pConqCity = pPlot:GetWorkingCity()
			
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[43]) ~= 0 then
		if pConqCity:HasBuildingClass(tBuildingClasses[2]) then
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[8], 1)
		else
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[8], 0)
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[43]) then
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[8], 0)
		end
	end
end

function PeopleOfTheBlueSkyNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[43]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		
		if pPlot then
			local pCity = pPlot:GetWorkingCity()	

			if pCity:HasBuildingClass(tBuildingClasses[2]) then
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[8], 1)
			end
		end
	end
end

function PeopleOfTheBlueSkyBuildingConstruction(ePlayer, eCity, eBuilding, bGold, bFaith) 
	if GameInfo.Buildings[eBuilding].BuildingClass == "BUILDINGCLASS_CARAVANSARY" then
		local pPlayer = Players[ePlayer]
	
		if pPlayer:GetEventChoiceCooldown(tEventChoice[43]) ~= 0 then
			local pCity = pPlayer:GetCityByID(eCity)

			pCity:SetNumRealBuilding(tBuildingsActiveAbilities[8], 1)
		end
	end
end



-- KATENDE (DIPLOMATIC NATIONAL WONDERS BUILT?)
function LongClawOfMemoryOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[52] then
		local pPlayer = Players[ePlayer]
		
		for city in pPlayer:Cities() do
			local iScrivenersOffice = city:HasBuildingClass(tBuildingClasses[3]) and 1 or 0
			local iPrintingPress = city:HasBuildingClass(tBuildingClasses[4]) and 1 or 0
			local iForeignBureau = city:HasBuildingClass(tBuildingClasses[5]) and 1 or 0
			
			if iScrivenersOffice > 0 or iPrintingPress > 0 or iForeignBureau > 0 then
				local iSum = iScrivenersOffice + iPrintingPress + iForeignBureau
				
				city:SetNumRealBuilding(tBuildingsActiveAbilities[24], iSum)
				city:SetNumRealBuilding(tBuildingsActiveAbilities[25], iSum)
			else
				city:SetNumRealBuilding(tBuildingsActiveAbilities[24], 0)
				city:SetNumRealBuilding(tBuildingsActiveAbilities[25], 0)
			end
		end
	end
end

function LongClawOfMemoryOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[52] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			city:SetNumRealBuilding(tBuildingsActiveAbilities[24], 0)
			city:SetNumRealBuilding(tBuildingsActiveAbilities[25], 0)
		end
	end
end

function LongClawOfMemoryCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	local pPlot = Map.GetPlot(iX, iY)
	local pConqCity = pPlot:GetWorkingCity()
			
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[52]) ~= 0 then
		local iScrivenersOffice = pConqCity:HasBuildingClass(tBuildingClasses[3]) and 1 or 0
		local iPrintingPress = pConqCity:HasBuildingClass(tBuildingClasses[4]) and 1 or 0
		local iForeignBureau = pConqCity:HasBuildingClass(tBuildingClasses[5]) and 1 or 0
	
		if iScrivenersOffice > 0 or iPrintingPress > 0 or iForeignBureau > 0 then
			local iSum = iScrivenersOffice + iPrintingPress + iForeignBureau
			
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[24], iSum)
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[25], iSum)
		else
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[24], 0)
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[25], 0)
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[52]) then
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[24], 0)
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[25], 0)
		end
	end
end

function LongClawOfMemoryNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[52]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		
		if pPlot then
			local pCity = pPlot:GetWorkingCity()	

			local iScrivenersOffice = pCity:HasBuildingClass(tBuildingClasses[3]) and 1 or 0
			local iPrintingPress = pCity:HasBuildingClass(tBuildingClasses[4]) and 1 or 0
			local iForeignBureau = pCity:HasBuildingClass(tBuildingClasses[5]) and 1 or 0
		
			if iScrivenersOffice > 0 or iPrintingPress > 0 or iForeignBureau > 0 then
				local iSum = iScrivenersOffice + iPrintingPress + iForeignBureau
				
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[24], iSum)
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[25], iSum)
			end
		end
	end
end

function LongClawOfMemoryBuildingConstruction(ePlayer, eCity, eBuilding, bGold, bFaith) 
	local sBuildingClass = GameInfo.Buildings[eBuilding].BuildingClass
	
	if sBuildingClass == "BUILDINGCLASS_COURT_SCRIBE" or sBuildingClass == "BUILDINGCLASS_PRINTING_PRESS" or sBuildingClass == "BUILDINGCLASS_FOREIGN_OFFICE" then
		local pPlayer = Players[ePlayer]
	
		if pPlayer:GetEventChoiceCooldown(tEventChoice[52]) ~= 0 then
			local pCity = pPlayer:GetCityByID(eCity)

			pCity:SetNumRealBuilding(tBuildingsActiveAbilities[24], pCity:GetNumRealBuilding(tBuildingsActiveAbilities[24]) + 1)
			pCity:SetNumRealBuilding(tBuildingsActiveAbilities[25], pCity:GetNumRealBuilding(tBuildingsActiveAbilities[25]) + 1)
		end
	end
end



-- JETARKTE (CITY ON COAST?)
function SeaNomadsOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[64] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			if city:IsCoastal(10) then
				city:SetNumRealBuilding(tBuildingsActiveAbilities[31], 1)
			end
		end
	end
end

function SeaNomadsOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[64] then
		local pPlayer = Players[ePlayer]
	
		for city in pPlayer:Cities() do
			city:SetNumRealBuilding(tBuildingsActiveAbilities[31], 0)
		end
	end
end

function SeaNomadsCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[64]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
			
		if pPlot then
			local pConqCity = pPlot:GetWorkingCity()
			
			if pConqCity:IsCoastal(10) then
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[31], 1)
			end
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[64]) then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[31], 0)
			end
		end
	end
end

function SeaNomadsNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[64]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
				
		if pPlot then
			local pCity = pPlot:GetWorkingCity()
			
			if pCity:IsCoastal(10) then		
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[31], 1)
			end
		end
	end
end



-- DALI (BUYING TRADE UNITS WITH FAITH)
function TradeWithFaith(ePlayer, eCity, eUnit)
	if eUnit ~= tUnitsCivilian[7] --[[and eUnit ~= tUnitsCivilian[8]--]] then return true end
	
	local pPlayer = Players[ePlayer]

	if pPlayer:IsMinorCiv() then return true end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[14]) ~= 0 then
		return true
	else
		return false
	end
end
GameEvents.CityCanTrain.Add(TradeWithFaith)

function DummyTechHorsebackRiding(eTeam, eTech, iChange)
	if eTech ~= tTechnologyTypes[4] then return end
	
	local eActivePlayer = Game.GetActivePlayer()
	local pActivePlayer = Players[eActivePlayer]
	
	if pActivePlayer:IsMinorCiv() then return end
	
	local pActiveTeam = Teams[pActivePlayer:GetTeam()]
	
	pActiveTeam:GetTeamTechs():SetHasTech(tTechnologyTypes[5], true)
end
GameEvents.TeamTechResearched.Add(DummyTechHorsebackRiding)


-- VATICAN CITY (SWISS GUARD FUNCTIONS)
function CanWeBuySwissGuard(ePlayer, eCity, eUnit)
	if eUnit ~= tUnitsMilitary[1] then return true end
	
	local pPlayer = Players[ePlayer]

	if pPlayer:IsMinorCiv() then return true end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[32]) ~= 0 then
		return true
	else
		return false
	end
end
GameEvents.CityCanTrain.Add(CanWeBuySwissGuard)

function SwissGuardHealingAttack(eAttackingPlayer, eAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, eDefendingPlayer, eDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, eInterceptingPlayer, eInterceptingUnit, iInterceptorDamage, iX, iY)
	local pAttackingPlayer = Players[eAttackingPlayer]
	
	if not (pAttackingPlayer and (iDefenderFinalDamage >= iDefenderMaxHP)) then return end
	
	local pAttackingUnit = pAttackingPlayer:GetUnitByID(eAttackingUnit)
		
	if pAttackingUnit:IsHasPromotion(tPromotionsActiveAbilities[3]) then
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetWorkingCity()
		local bInRangeOfCapital, bInRangeOfHolyCity = false, false

		if pCity == nil then return end

		bInRangeOfCapital = pCity:IsCapital() and pCity:GetOwner() == eAttackingPlayer
		bInRangeOfHolyCity = pCity:IsHolyCityAnyReligion() and pCity:GetOwner() == eAttackingPlayer

		if bInRangeOfHolyCity then
			pAttackingUnit:ChangeDamage(-40)
		elseif bInRangeOfCapital then
			pAttackingUnit:ChangeDamage(-30)
		else
			pAttackingUnit:ChangeDamage(-10)
		end
	end
end

function SwissGuardHealingDefend(eAttackingPlayer, eAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, eDefendingPlayer, eDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, eInterceptingPlayer, eInterceptingUnit, iInterceptorDamage, iX, iY)
	local pDefendingPlayer = Players[eDefendingPlayer]
	
	if not (pDefendingPlayer and (iAttackerFinalDamage >= iAttackerMaxHP)) then return end
	
	local pDefendingUnit = pDefendingPlayer:GetUnitByID(eDefendingUnit)
		
	if pDefendingUnit:IsHasPromotion(tPromotionsActiveAbilities[3]) then
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetWorkingCity()
		local bInRangeOfCapital, bInRangeOfHolyCity = false, false

		if pCity == nil then return end

		bInRangeOfCapital = pCity:IsCapital() and pCity:GetOwner() == eDefendingPlayer
		bInRangeOfHolyCity = pCity:IsHolyCityAnyReligion() and pCity:GetOwner() == eDefendingPlayer

		if bInRangeOfHolyCity then
			pDefendingUnit:ChangeDamage(-40)
		elseif bInRangeOfCapital then
			pDefendingUnit:ChangeDamage(-30)
		else
			pDefendingUnit:ChangeDamage(-10)
		end
	end
end

function SwissGuardYields(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return end

	local iSwissGuards = pPlayer:GetUnitClassCount(GameInfoTypes.UNITCLASS_SWISS_GUARD)
	
	if iSwissGuards == 0 then return end

	local pTeam = Teams[pPlayer:GetTeam()]
	local bRadio = pTeam:IsHasTech(tTechnologyTypes[2])
	local bTelecom = pTeam:IsHasTech(tTechnologyTypes[3])
	local pCapital = pPlayer:GetCapitalCity()
	local iBaseYield = 2 * iSwissGuards
	
	pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iBaseYield, true, pCapital:GetID())

	if bRadio then
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_CULTURE, iBaseYield, true, pCapital:GetID())
	end

	if bTelecom then
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_TOURISM, iBaseYield, true, pCapital:GetID())
	end
end

function SwissGuardYieldsNotification(ePlayer, eCity, eUnit, bGold, bFaith)	
	local pPlayer = Players[ePlayer]
	local pUnit = pPlayer:GetUnitByID(eUnit)

	if pUnit and pUnit:GetUnitType() == tUnitsMilitary[1] then
		local pTeam = Teams[pPlayer:GetTeam()]
		local bRadio = pTeam:IsHasTech(tTechnologyTypes[2])
		local bTelecom = pTeam:IsHasTech(tTechnologyTypes[3])
		local pCity = pPlayer:GetCityByID(eCity)
		local pVaticanCity = Players[tLostCities["eLostVaticanCity"]]
		
		if pPlayer:IsHuman() then
			if bTelecom then		
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_VATICAN_KATZBALGER_C", pUnit:GetName(), pVaticanCity:GetName()), L("TXT_KEY_UCS_BONUS_VATICAN_KATZBALGER_TITLE"), pCity:GetX(), pCity:GetY())
			elseif bRadio then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_VATICAN_KATZBALGER_B", pUnit:GetName(), pVaticanCity:GetName()), L("TXT_KEY_UCS_BONUS_VATICAN_KATZBALGER_TITLE"), pCity:GetX(), pCity:GetY())
			else
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_VATICAN_KATZBALGER_A", pUnit:GetName(), pVaticanCity:GetName()), L("TXT_KEY_UCS_BONUS_VATICAN_KATZBALGER_TITLE"), pCity:GetX(), pCity:GetY())
			end		
		end
	end
end



-- KATHMANDU (GURKHA FUNCTIONS)
function CanWeBuyGurkha(ePlayer, eCity, eUnit)
	if eUnit ~= tUnitsMilitary[2] then return true end
	
	local pPlayer = Players[ePlayer]

	if pPlayer:IsMinorCiv() then return true end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[33]) ~= 0 then
		return true
	else
		return false
	end
end
GameEvents.CityCanTrain.Add(CanWeBuyGurkha)



-- DAERGRAEVS (SAKA FUNCTIONS)
function CanWeTrainSaka(ePlayer, eCity, eUnit)
	if eUnit ~= tUnitsMilitary[4] then return true end
	
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return false end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[46]) ~= 0 then
		return true
	else
		return false
	end
end
GameEvents.CityCanTrain.Add(CanWeTrainSaka)



-- JUYUBIT (TEAAT FUNCTIONS)
function CanWeTrainTeaat(ePlayer, eCity, eUnit)
	if eUnit ~= tUnitsCivilian[11] then return true end
	
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return false end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[49]) ~= 0 then
		return true
	else
		return false
	end
end
GameEvents.CityCanTrain.Add(CanWeTrainTeaat)

function TeeatBuiltSomething(eUnitOwner, eUnit, eUnitType, iX, iY, bDelay, eKillerPlayer)
	if not bDelay or eKillerPlayer ~= -1 then return end
	
	local pPlayer = Players[eUnitOwner]

	if pPlayer:IsMinorCiv() then return end
	
	local pUnit = pPlayer:GetUnitByID(eUnit)
		
	if pUnit:GetUnitType() == tUnitsCivilian[11] then
		local iBaseCulture = 5
		local iBaseFood = 2 * iBaseCulture
		local iEraModifier = math.max(1, pPlayer:GetCurrentEra())	
		local iTomol1 = iBaseFood * iEraModifier
		local iTomol2 = iBaseCulture * iEraModifier
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetWorkingCity()
		local pJuyubit = Players[tLostCities["eLostJuyubit"]]
		
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_FOOD, iTomol1, true, pCity:GetID())
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_CULTURE, iTomol2, true, pCity:GetID())
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_TEAAT", pJuyubit:GetName(), iTomol1, iTomol2, pCity:GetName()), L("TXT_KEY_UCS_TEAAT_TITLE"), pCity:GetX(), pCity:GetY())
		end	
	end
end



-- ISKANWAYA (PROMOTION HEALING EACH TURN)
function HealersFromIskanwaya(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[16]) ~= 0 then
		for unit in pPlayer:Units() do
			if unit then
				if unit:GetDamage() > 0 and unit:IsHasPromotion(tPromotionsActiveAbilities[1]) then
					local pPlot = unit:GetPlot()
					local iX = pPlot:GetX()
					local iY = pPlot:GetY()
					local bPlotMissionary, bPlotHolySite, bPlotMountain = false, false, false
					local bAdjacentMissionary, bAdjacentHolySite, bAdjacentMountain = false, false, false

					bPlotMissionary = pPlot:GetUnit() and pPlot:GetUnit():GetUnitType() == tUnitsCivilian[3]
					bPlotHolySite = pPlot:GetImprovementType() == tImprovementsGreatPeople[2]
					bPlotMountain = pPlot:GetPlotType() == tPlotTypes[3]

					if bPlotMissionary or bPlotHolySite or bPlotMountain then
						unit:ChangeDamage(-10)
					else
						for i, direction in ipairs(tDirectionTypes) do
							local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
						
							if pAdjacentPlot then
								bAdjacentMissionary = pAdjacentPlot:GetUnit() and pAdjacentPlot:GetUnit():GetUnitType() == tUnitsCivilian[3]
								bAdjacentHolySite = pAdjacentPlot:GetImprovementType() == tImprovementsGreatPeople[2]
								bAdjacentMountain = pAdjacentPlot:GetPlotType() == tPlotTypes[3]

								if bAdjacentMissionary or bAdjacentHolySite or bAdjacentMountain then
									break
								end
							end
						end

						if bAdjacentMissionary or bAdjacentHolySite or bAdjacentMountain then
							unit:ChangeDamage(-10)
						end
					end
				end
			end
		end
	end
end



-- KABUL (PROMOTION NEAR MOUNTAIN)
function MujahideensFromKabulOnMove(ePlayer, eUnit, iX, iY) 
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	local pUnit = pPlayer:GetUnitByID(eUnit)
	local bIsMountainAround = false
	
	if not pUnit:IsCombatUnit() then return end

	if pUnit:IsHasPromotion(tPromotionsActiveAbilities[2]) then
		for i, direction in ipairs(tDirectionTypes) do
			local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)

			if pAdjacentPlot then
				if pAdjacentPlot:GetPlotType() == tPlotTypes[3] then
					bIsMountainAround = true
					break
				end
			end
		end
		
		if not bIsMountainAround or pPlayer:GetEventChoiceCooldown(tEventChoice[24]) == 0 then
			pUnit:SetHasPromotion(tPromotionsActiveAbilities[2], false)
		end
	else
		if pPlayer:GetEventChoiceCooldown(tEventChoice[24]) ~= 0 then
			if pUnit:GetDomainType() == tDomainTypes[1] then
				for i, direction in ipairs(tDirectionTypes) do
					local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
					
					if pAdjacentPlot then
						if pAdjacentPlot:GetPlotType() == tPlotTypes[3] then
							pUnit:SetHasPromotion(tPromotionsActiveAbilities[2], true)
							break
						end
					end
				end
			end
		end
	end
end

function MujahideensFromKabulOnEventOn(ePlayer, eEventChoiceType)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if eEventChoiceType == tEventChoice[24] then
		for unit in pPlayer:Units() do
			if unit:GetDomainType() == tDomainTypes[1] and unit:IsCombatUnit() then
				local bIsMountainAround = false
	
				for i, direction in ipairs(tDirectionTypes) do
					local pAdjacentPlot = Map.PlotDirection(unit:GetX(), unit:GetY(), direction)
				
					if pAdjacentPlot then
						if pAdjacentPlot:GetPlotType() == tPlotTypes[3] then
							unit:SetHasPromotion(tPromotionsActiveAbilities[2], true)
							break
						end
					end
				end
			end
		end
	end
end

function MujahideensFromKabulOnEventOff(ePlayer, eEventChoiceType)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if eEventChoiceType == tEventChoice[24] then
		for unit in pPlayer:Units() do
			unit:SetHasPromotion(tPromotionsActiveAbilities[2], false)
		end
	end
end



-- HONG KONG (CITIZENS MIGRATING TO CS)
function MigrationToHongKong(ePlayer)
	local pPlayer = Players[ePlayer]

	if pPlayer:IsMinorCiv() then return end
					
	if pPlayer:GetEventChoiceCooldown(tEventChoice[19]) ~= 0 then
		local pHongKong = Players[tLostCities["eLostHongKong"]]
		local pHongKongCity = pHongKong:GetCapitalCity()		
		
		for city in pPlayer:Cities() do
			local iMigrationThreshold = city:GetPopulation() - pHongKongCity:GetPopulation()
			local iCurrentInfluenceWithHongKong = pHongKong:GetMinorCivFriendshipWithMajor(ePlayer)

			if iMigrationThreshold > 0 and iCurrentInfluenceWithHongKong >= GameDefines.FRIENDSHIP_THRESHOLD_FRIENDS then
				local iRolledMigrationChance = RandomNumberBetween(1, 1000)
				
				if iRolledMigrationChance <= iMigrationThreshold then
					local iInfluence = 30
					local iBaseYield = RandomNumberBetween(100, 150)
					local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
					
					-- setting the peak to last forever
					if iCurrentInfluenceWithHongKong >= 570 then iCurrentInfluenceWithHongKong = 570 end

					local iInfluenceModifier = iCurrentInfluenceWithHongKong / GameDefines.FRIENDSHIP_THRESHOLD_ALLIES
					
					-- setting the somewhat logarithmic curve, because linear was too high
					local iFactor1 = 1.5
					local iFactor2 = 750
					local iInfluenceCapModifier = (iFactor1 - (iCurrentInfluenceWithHongKong - GameDefines.FRIENDSHIP_THRESHOLD_FRIENDS) / iFactor2) / iFactor1 -- for more info look at the excel calculations

					city:ChangePopulation(-1, true)
					pHongKongCity:ChangePopulation(1, true)

					local iGoldReward = math.ceil(iBaseYield * iEraModifier * iInfluenceModifier * iInfluenceCapModifier)

					pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iGoldReward, true, city:GetID())
					pHongKong:ChangeMinorCivFriendshipWithMajor(ePlayer, iInfluence)

					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_HONG_KONG", city:GetName(), pHongKongCity:GetName(), pHongKong:GetName(), iGoldReward, iInfluence), L("TXT_KEY_UCS_BONUS_HONG_KONG_TITLE"), city:GetX(), city:GetY())
					end

					break
				end
			end
		end
	end		
end



-- FLORENCE (SPAWN OF GREAT ENGINEER OR GREAT ARTIST)
function ArtistsInFlorence(ePlayer)
	local pPlayer = Players[ePlayer]

	if pPlayer:IsMinorCiv() then return end
					
	if pPlayer:GetEventChoiceCooldown(tEventChoice[20]) ~= 0 then
		local iArtistThreshold = 10
		local iArtistChance = RandomNumberBetween(1, 1000)
		
		if iArtistChance <= iArtistThreshold then
			local pFlorence = Players[tLostCities["eLostFlorence"]]
			local pCapital = pPlayer:GetCapitalCity()
			local iArtistVsEngineer = RandomNumberBetween(0, 1)		
			local pUnit
				
			if iArtistVsEngineer == 0 then
				pUnit = pPlayer:InitUnit(tUnitsGreatPeople[4], pCapital:GetX(), pCapital:GetY())
			else
				pUnit = pPlayer:InitUnit(tUnitsGreatPeople[2], pCapital:GetX(), pCapital:GetY())
			end
			
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_FLORENCE", pFlorence:GetName(), pUnit:GetName()), L("TXT_KEY_UCS_BONUS_FLORENCE_TITLE", L(GameInfo.Units[pUnit:GetUnitType()].Description)), pCapital:GetX(), pCapital:GetY())
			end
		end
	end	
end



-- KYZYL (YIELDS ON RESEARCH)
function ResearchersFromKyzyl(eTeam, eTech, iChange)
	local pActivePlayer = Players[Game.GetActivePlayer()]
	local eActiveTeam = pActivePlayer:GetTeam()
	
	if pActivePlayer:IsMinorCiv() then return end
	if eTeam ~= eActiveTeam then return end
					
	if pActivePlayer:GetEventChoiceCooldown(tEventChoice[21]) ~= 0 then
		local pCapital = pActivePlayer:GetCapitalCity()
		local pKyzyl = Players[tLostCities["eLostKyzyl"]]
		local sKyzylYields = ""
		
		for city in pActivePlayer:Cities() do
			local iBaseYield = RandomNumberBetween(5, 20)
			local iEraModifier = math.max(1, pActivePlayer:GetCurrentEra())
			local iOwnedCities = pActivePlayer:GetNumCities()

			if iOwnedCities > 8 then iOwnedCities = 8 end

			local iCitiesNumberDismodifier = 1 - ((iOwnedCities - 1) * 0.1)
			local iProductionBoostFromResearch = iBaseYield * iEraModifier * iCitiesNumberDismodifier

			pActivePlayer:DoInstantYield(GameInfoTypes.YIELD_PRODUCTION, iProductionBoostFromResearch, true, city:GetID())

			sKyzylYields = sKyzylYields .. "[NEWLINE][ICON_BULLET] " .. city:GetName() .. ": " .. iProductionBoostFromResearch .. " [ICON_PRODUCTION]"
		end
		
		if pActivePlayer:IsHuman() then
			pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_KYZYL", pKyzyl:GetName(), sKyzylYields), L("TXT_KEY_UCS_BONUS_KYZYL_TITLE"), pCapital:GetX(), pCapital:GetY())
		end	
	end	
end



-- TYRE (TOURISM FROM WW CONSTRUCTION)
function TourismFromTyre(ePlayer, eCity, eBuilding, bGold, bFaith) 
	local bBuildingSplash = GameInfo.Buildings[eBuilding].WonderSplashImage ~= nil
	local bBuildingCorporation = GameInfo.Buildings[eBuilding].IsCorporation == 1
	
	if bBuildingSplash and not bBuildingCorporation then
		local pPlayer = Players[ePlayer]
	
		if pPlayer:GetEventChoiceCooldown(tEventChoice[22]) ~= 0 then
			local pCity = pPlayer:GetCityByID(eCity)
			local iBaseYield = RandomNumberBetween(20, 40)
			local iWonderModifier = 1 + (pCity:GetNumWorldWonders() * 0.2)
			local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
			local iTourismBoost = iBaseYield * iWonderModifier * iEraModifier
			local pTyre = Players[tLostCities["eLostTyre"]]
	
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_TOURISM, iTourismBoost, true, eCity)

			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_TYRE", L(GameInfo.Buildings[eBuilding].Description), pTyre:GetName(), iTourismBoost), L("TXT_KEY_UCS_BONUS_TYRE_TITLE"), pCity:GetX(), pCity:GetY())
			end	
		end
	end
end



-- WELLINGTON (ADDS STRATEGIC RESOURCES)
function EvenMoreStrategicResources(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end

	if pPlayer:GetEventChoiceCooldown(tEventChoice[25]) ~= 0 then
		local pCapital = pPlayer:GetCapitalCity()
		
		for i, value in ipairs(tResourcesStrategic) do
			if pPlayer:GetNumResourceAvailable(value, false) > 0 then
				local iEnumerator = i + 11 -- correction for the dummies table
				
				if pPlayer:HasStrategicMonopoly(value) then
					pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[iEnumerator], 2)
				elseif pPlayer:HasGlobalMonopoly(value) then
					pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[iEnumerator], 3)
				else
					pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[iEnumerator], 1)
				end
			end
		end
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[12]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[13]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[14]) > 0
			or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[15]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[16]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[17]) > 0
			or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[18]) > 0 then
			
			local pCapital = pPlayer:GetCapitalCity()
			
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[12], 0) -- horses
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[13], 0) -- iron
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[14], 0) -- coal
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[15], 0) -- oil
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[16], 0) -- aluminum
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[17], 0) -- uranium
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[18], 0) -- paper
		end
	end
end



--QUEBEC CITY (FEATURE REMOVAL YIELDS)
function FeatureCutByQuebec(iX, iY, eOwner, eOldFeature, eNewFeature)
	if eNewFeature ~= -1 then return end
	if eOldFeature == tFeatureTypes[1] or eOldFeature == tFeatureTypes[2] then
		local pPlayer = Players[eOwner]
		
		if pPlayer == nil then
			pPlayer = Players[Map.GetPlot(iX, iY):GetOwner()]
		end

		if not pPlayer then return end
		
		if pPlayer:IsMinorCiv() then return end

		if pPlayer:GetEventChoiceCooldown(tEventChoice[26]) ~= 0 then
			local iBaseYield = 10
			local iEraModifier = ((math.max(1, pPlayer:GetCurrentEra()) - 1) * 0.7) + 1
			local iCutExtraYield = iBaseYield * iEraModifier
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			local pQuebecCity = Players[tLostCities["eLostQuebecCity"]]

			pPlayer:DoInstantYield(GameInfoTypes.YIELD_PRODUCTION, iCutExtraYield, true, pCity:GetID())
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iCutExtraYield, true, pCity:GetID())

			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_QUEBEC_CITY", pQuebecCity:GetName(), pCity:GetName(), iCutExtraYield, L(GameInfo.Features[eOldFeature].Description)), L("TXT_KEY_UCS_BONUS_QUEBEC_CITY_TITLE"), pCity:GetX(), pCity:GetY())
			end	
		end
	end
end



--PRAGUE (MISSIONARY EXPENDED YIELDS)
function SpreadTheFaithInPrussia(eUnitOwner, eUnit, eUnitType, iX, iY, bDelay, eKillerPlayer)
	if bDelay then return end
	
	local pPlayer = Players[eUnitOwner]
	
	if pPlayer:IsMinorCiv() then return end

	if pPlayer:GetEventChoiceCooldown(tEventChoice[27]) ~= 0 then
		local pUnit = pPlayer:GetUnitByID(eUnit)
		
		for i, spreadunit in ipairs(tUnitsWithSpread) do
			if pUnit:GetUnitType() == spreadunit then
				local iBaseYield = RandomNumberBetween(4, 13)
				local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
				local iCultureFromDeath = iBaseYield * iEraModifier
				local iFaithFromDeath = iCultureFromDeath * 2			
				local pCapital = pPlayer:GetCapitalCity()
				local pPrague = Players[tLostCities["eLostPrague"]]

				pPlayer:DoInstantYield(GameInfoTypes.YIELD_CULTURE, iCultureFromDeath, true, pCapital:GetID())
				pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iFaithFromDeath, true, pCapital:GetID())
			
				if pPlayer:IsHuman() then
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_PRAGUE", pPrague:GetName(), pUnit:GetName(), iFaithFromDeath, iCultureFromDeath), L("TXT_KEY_UCS_BONUS_PRAGUE_TITLE"), pCapital:GetX(), pCapital:GetY())
				end
				
				break	
			end
		end
	end
end



--SINGAPORE (GOLD FROM DIPLOMACY)
function WiseDiplomatsFromSingapore(eUnitOwner, eUnit, eUnitType, iX, iY, bDelay, eKillerPlayer)
	if not bDelay or eKillerPlayer ~= -1 then return end
	
	local pPlayer = Players[eUnitOwner]

	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[30]) ~= 0 then
		local pUnit = pPlayer:GetUnitByID(eUnit)
			
		if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_DIPLOMACY then
			local iBaseYield = 20
			local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
			
			local pCityStateFrom = Players[Map.GetPlot(iX, iY):GetOwner()]
			local iCurrentInfluenceWithCityState = pCityStateFrom:GetMinorCivFriendshipWithMajor(eUnitOwner)
			local iInfluenceModifier = 1

			if iCurrentInfluenceWithCityState >= GameDefines.FRIENDSHIP_THRESHOLD_ALLIES then
				iInfluenceModifier = 1.5
			elseif iCurrentInfluenceWithCityState >= 2 * GameDefines.FRIENDSHIP_THRESHOLD_ALLIES then
				iInfluenceModifier = 2.5
			elseif iCurrentInfluenceWithCityState < 0 then
				iInfluenceModifier = 0.5
			end
			
			local iDiploWealth = iBaseYield * iEraModifier * iInfluenceModifier	
			local pCapital = pPlayer:GetCapitalCity()
			local pSingapore = Players[tLostCities["eLostSingapore"]]
			
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iDiploWealth, true, pCapital:GetID())
			
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_SINGAPORE", pSingapore:GetName(), pCityStateFrom:GetName(), iDiploWealth), L("TXT_KEY_UCS_BONUS_SINGAPORE_TITLE"), pCapital:GetX(), pCapital:GetY())
			end	
		end
	end
end



-- SYDNEY (WLTKD GREAT PEOPLE POINTS)
function GenerateGPPBySydney(eCityOwner, iX, iY, iTurns)
	local pPlayer = Players[eCityOwner]

	if pPlayer:IsMinorCiv() then return end

	if pPlayer:GetEventChoiceCooldown(tEventChoice[28]) ~= 0 then
		local iBaseYieldArtist = RandomNumberBetween(5, 20)
		local iBaseYieldWriter = RandomNumberBetween(5, 20)
		local iBaseYieldMusician = RandomNumberBetween(5, 20)
		local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
		local iBoost1 = iBaseYieldArtist * iEraModifier
		local iBoost2 = iBaseYieldWriter * iEraModifier
		local iBoost3 = iBaseYieldMusician * iEraModifier
		local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
		local pSydney = Players[tLostCities["eLostSydney"]]

		pCity:ChangeSpecialistGreatPersonProgressTimes100(tSpecialistTypes[4], iBoost1 * 100)
		pCity:ChangeSpecialistGreatPersonProgressTimes100(tSpecialistTypes[5], iBoost2 * 100)
		pCity:ChangeSpecialistGreatPersonProgressTimes100(tSpecialistTypes[6], iBoost3 * 100)

		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_SYDNEY", pSydney:GetName(), pCity:GetName(), L(GameInfo.Units[tUnitsGreatPeople[4]].Description), L(GameInfo.Units[tUnitsGreatPeople[5]].Description), L(GameInfo.Units[tUnitsGreatPeople[6]].Description), iBoost1, iBoost2, iBoost3), L("TXT_KEY_UCS_BONUS_SYDNEY_TITLE"), pCity:GetX(), pCity:GetY())
		end
	end
end



-- GWYNEDD (LONGER WLTKD)
function WeLoveGwyneddSoMuch(ePlayer, iX, iY, iTurns)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end

	if pPlayer:GetEventChoiceCooldown(tEventChoice[29]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		
		if pPlot then
			local pCity = pPlot:GetPlotCity()
			
			if pCity then
				local iWLTKDExtendedTurns = pCity:GetWeLoveTheKingDayCounter() + ((iTurns * 34) / 100) -- the hook is called after the game has already increased the WLTKD turns in the city 
				
				pCity:SetWeLoveTheKingDayCounter(iWLTKDExtendedTurns) -- DO NOT use pCity:ChangeWeLoveTheKingDayCounter as it will call the hook again, resulting in an infinite loop
			end
		end
	end
end

function WeLoveGwyneddSoMuchOnEventOn(ePlayer, eEventChoiceType)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if eEventChoiceType == tEventChoice[29] then
		for city in pPlayer:Cities() do
			local iCurrentWLTKDTurns = city:GetWeLoveTheKingDayCounter()

			if iCurrentWLTKDTurns > 0 then
				local iWLTKDExtendedTurns = iCurrentWLTKDTurns + ((iCurrentWLTKDTurns * 34) / 100)
				
				city:SetWeLoveTheKingDayCounter(iWLTKDExtendedTurns)
			end
		end
	end
end

function WeLoveGwyneddSoMuchOnEventOff(ePlayer, eEventChoiceType)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if eEventChoiceType == tEventChoice[29] then
		for city in pPlayer:Cities() do
			local iCurrentWLTKDTurns = city:GetWeLoveTheKingDayCounter()

			if iCurrentWLTKDTurns > 0 then
				local iWLTKDReducedTurns = (iCurrentWLTKDTurns * 66) / 100
				
				city:SetWeLoveTheKingDayCounter(iWLTKDReducedTurns)
			end
		end
	end
end



-- YANGCHENG (FAITH ON ERA CHANGE)
function YearOfTheAnimal(eTeam, eEra, bFirst)
	for eplayer = 0, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pPlayer = Players[eplayer]

		if pPlayer and pPlayer:IsAlive() then
			if pPlayer:IsMinorCiv() then return end

			local ePlayerTeam = pPlayer:GetTeam()

			if ePlayerTeam == eTeam then
				if pPlayer:GetEventChoiceCooldown(tEventChoice[34]) ~= 0 then
					local iRandomAnimal = RandomNumberBetween(1, 12)
					local sAnimal, sAnimalBonusYield, sAnimalBonusYield2, sAnimalBonusYieldText = "", "", "", ""
					local iAnimalBonusYield, iAnimalBonusYield2, eAnimalBonusYield, eAnimalBonusYield2 = 0, 0, 0, 0
					local iBaseYield = 70
					local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
					local iFirstModifier = 1
					local pCapital = pPlayer:GetCapitalCity()
					local pYangcheng = Players[tLostCities["eLostYangcheng"]]

					if bFirst then
						iFirstModifier = 1.3
					end

					local iAnimalFaith = iBaseYield * iEraModifier * iFirstModifier
				
					if pPlayer:IsHuman() then
						if iRandomAnimal == 1 then
							sAnimal = "Rat"
							iAnimalBonusYield = iAnimalFaith / 6
							eAnimalBonusYield = GameInfoTypes.YIELD_TOURISM
							sAnimalBonusYield = " [ICON_TOURISM] Tourism"
						elseif iRandomAnimal == 2 then
							sAnimal = "Ox"
							iAnimalBonusYield = iAnimalFaith / 4
							eAnimalBonusYield = GameInfoTypes.YIELD_PRODUCTION
							sAnimalBonusYield = " [ICON_PRODUCTION] Production"
						elseif iRandomAnimal == 3 then
							sAnimal = "Tiger"
							iAnimalBonusYield = iAnimalFaith / 5
							eAnimalBonusYield = GameInfoTypes.YIELD_GREAT_GENERAL_POINTS
							sAnimalBonusYield = " [ICON_GREAT_GENERAL] Great General Points"
						elseif iRandomAnimal == 4 then
							sAnimal = "Rabbit"
							iAnimalBonusYield = iAnimalFaith / 5
							eAnimalBonusYield = GameInfoTypes.YIELD_FAITH
							sAnimalBonusYield = " [ICON_PEACE] Faith"
						elseif iRandomAnimal == 5 then
							sAnimal = "Dragon"
							iAnimalBonusYield = iAnimalFaith / 7
							eAnimalBonusYield = GameInfoTypes.YIELD_GREAT_ADMIRAL_POINTS
							sAnimalBonusYield = " [ICON_GREAT_ADMIRAL] Great Admiral Points"
						elseif iRandomAnimal == 6 then
							sAnimal = "Snake"
							iAnimalBonusYield = iAnimalFaith / 6
							eAnimalBonusYield = GameInfoTypes.YIELD_CULTURE
							sAnimalBonusYield = " [ICON_CULTURE] Culture"
						elseif iRandomAnimal == 7 then
							sAnimal = "Horse"
							iAnimalBonusYield = iAnimalFaith / 4
							eAnimalBonusYield = GameInfoTypes.YIELD_GOLD
							sAnimalBonusYield = " [ICON_GOLD] Gold"
						elseif iRandomAnimal == 8 then
							sAnimal = "Goat"
							iAnimalBonusYield = iAnimalFaith / 4
							eAnimalBonusYield = GameInfoTypes.YIELD_FOOD
							sAnimalBonusYield = " [ICON_FOOD] Food"
							iAnimalBonusYield2 = iAnimalFaith / 6
							eAnimalBonusYield2 = GameInfoTypes.YIELD_PRODUCTION
							sAnimalBonusYield2 = " [ICON_PRODUCTION] Production"
						elseif iRandomAnimal == 9 then
							sAnimal = "Monkey"
							iAnimalBonusYield = iAnimalFaith / 6
							eAnimalBonusYield = GameInfoTypes.YIELD_SCIENCE
							sAnimalBonusYield = " [ICON_RESEARCH] Science"
						elseif iRandomAnimal == 10 then
							sAnimal = "Rooster"
							iAnimalBonusYield = iAnimalFaith / 7
							eAnimalBonusYield = GameInfoTypes.YIELD_GOLDEN_AGE_POINTS
							sAnimalBonusYield = " [ICON_GOLDEN_AGE] Golden Age Points"
						elseif iRandomAnimal == 11 then
							sAnimal = "Dog"
							iAnimalBonusYield = iAnimalFaith / 2
							eAnimalBonusYield = GameInfoTypes.YIELD_CULTURE_LOCAL
							sAnimalBonusYield = " [ICON_CULTURE_LOCAL] Border Growth Points"
						elseif iRandomAnimal == 12 then
							sAnimal = "Pig"
							iAnimalBonusYield = iAnimalFaith / 3
							eAnimalBonusYield = GameInfoTypes.YIELD_FOOD
							sAnimalBonusYield = " [ICON_FOOD] Food"
						end

						pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iAnimalFaith, true, pCapital:GetID())
						pPlayer:DoInstantYield(eAnimalBonusYield, iAnimalBonusYield, true, pCapital:GetID())

						iAnimalBonusYield = math.floor(iAnimalBonusYield)
						iAnimalBonusYield2 = math.floor(iAnimalBonusYield2)

						if iRandomAnimal == 8 then -- GOAT (2 yields exception)
							pPlayer:DoInstantYield(eAnimalBonusYield2, iAnimalBonusYield2, true, pCapital:GetID())
							sAnimalBonusYieldText = iAnimalBonusYield .. sAnimalBonusYield .. " and " .. iAnimalBonusYield2 .. sAnimalBonusYield2
						else
							sAnimalBonusYieldText = iAnimalBonusYield .. sAnimalBonusYield
						end

						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_YANGCHENG", pYangcheng:GetName(), iAnimalFaith, sAnimal, sAnimalBonusYieldText), L("TXT_KEY_UCS_BONUS_YANGCHENG_TITLE", sAnimal), pCapital:GetX(), pCapital:GetY())
					end
				end
			end
		end
	end
end



-- IFE (FAITH ON TRAINED DIPLO UNITS)
--[[function FaithForDiploFromIfe(ePlayer, eCity, eUnit, bGold, bFaith)	
	local pPlayer = Players[ePlayer]
	local pUnit = pPlayer:GetUnitByID(eUnit)
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[35]) ~= 0 then
		if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_DIPLOMACY then
			local iBaseYield = 30
			local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
			local iYoruba = iBaseYield * iEraModifier		
			local pCity = pPlayer:GetCityByID(eCity)--]]
			--local pIfe = Players[tLostCities["eLostIfe"]]
		
			--[[pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iYoruba, true, pCity:GetID())
						
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_IFE", pUnit:GetName(), pIfe:GetName(), iYoruba), L("TXT_KEY_UCS_BONUS_IFE_TITLE"), pCity:GetX(), pCity:GetY())		
			end
		end
	end
end--]]

function FaithForDiploFromIfeSpawn(eUnitOwner, eUnit, eUnitType, iX, iY)	
	local pPlayer = Players[eUnitOwner]
	local pUnit = pPlayer:GetUnitByID(eUnit)
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[35]) ~= 0 then
		local iBaseYield = 30
		local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
		local iYoruba = iBaseYield * iEraModifier		
		local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
		local pIfe = Players[tLostCities["eLostIfe"]]
		
		if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_DIPLOMACY then
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iYoruba, true, pCity:GetID())
						
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_IFE", pUnit:GetName(), pIfe:GetName(), iYoruba), L("TXT_KEY_UCS_BONUS_IFE_TITLE"), pCity:GetX(), pCity:GetY())		
			end
		elseif pUnit:GetUnitType() == tUnitsGreatPeople[7] then
			iYoruba = iYoruba * 2

			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iYoruba, true, pCity:GetID())
						
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_IFE", pUnit:GetName(), pIfe:GetName(), iYoruba), L("TXT_KEY_UCS_BONUS_IFE_TITLE"), pCity:GetX(), pCity:GetY())		
			end
		end
	end
end



-- GENEVA (FAITH ON TRAINED GP UNITS)
function FaithForGPFromGeneva(eUnitOwner, eUnit, eUnitType, iX, iY)	
	local pPlayer = Players[eUnitOwner]
	local pUnit = pPlayer:GetUnitByID(eUnit)
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[36]) ~= 0 then
		if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_SPECIAL_PEOPLE then
			local iBaseYield = 25
			local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
			local iEscalade = iBaseYield * iEraModifier		
			local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
			local pGeneva = Players[tLostCities["eLostGeneva"]]
		
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iEscalade, true, pCity:GetID())
						
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_GENEVA", pGeneva:GetName(), pUnit:GetName(), iEscalade), L("TXT_KEY_UCS_BONUS_GENEVA_TITLE"), pCity:GetX(), pCity:GetY())		
			end
		end
	end
end



-- GENOA (GOLD ON TRAINED GP UNITS)
function GoldForGPFromGenoa(eUnitOwner, eUnit, eUnitType, iX, iY)	
	local pPlayer = Players[eUnitOwner]
	local pUnit = pPlayer:GetUnitByID(eUnit)
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[37]) ~= 0 then
		if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_SPECIAL_PEOPLE then
			local iBaseYield1 = 40
			local iBaseYield2 = 10
			local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
			local iLa = iBaseYield1 * iEraModifier
			local iSuperba = iBaseYield2 * iEraModifier		
			local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
			local pGenoa = Players[tLostCities["eLostGenoa"]]
		
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iLa, true, pCity:GetID())
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLDEN_AGE_POINTS, iSuperba, true, pCity:GetID())
						
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_GENOA", pGenoa:GetName(), pUnit:GetName(), iLa, iSuperba), L("TXT_KEY_UCS_BONUS_GENOA_TITLE"), pCity:GetX(), pCity:GetY())		
			end
		end
	end
end



-- SIERRA LEONE (CULTURE PER WORKER)
function CulturePerWorker(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[38]) ~= 0 then
		local pCapital = pPlayer:GetCapitalCity()
		local iWorkers = pPlayer:GetUnitClassCount(GameInfoTypes.UNITCLASS_WORKER)

		pPlayer:DoInstantYield(GameInfoTypes.YIELD_CULTURE, iWorkers, true, pCapital:GetID())
	end
end



-- OUIDAH (GOLD PER WORKER)
function GoldPerWorker(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[47]) ~= 0 then
		local pCapital = pPlayer:GetCapitalCity()
		local iWorkers = pPlayer:GetUnitClassCount(GameInfoTypes.UNITCLASS_WORKER)

		pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iWorkers, true, pCapital:GetID())
	end
end

function BuiltImprovementForOuidah(ePlayer, iX, iY, eImprovement)
	if eImprovement == -1 then return end
		
	-- event triggers twice, so this should prevent it
	bBlockDoubleTriggering = not bBlockDoubleTriggering
	
	if bBlockDoubleTriggering then
		local pPlayer = Players[ePlayer]

		if pPlayer:GetEventChoiceCooldown(tEventChoice[47]) ~= 0 then
			sImprovement = GameInfo.Improvements[eImprovement].Type
			sBuild = GameInfo.Builds{ImprovementType=sImprovement}().Type
			sUnit = GameInfo.Unit_Builds{BuildType=sBuild}().UnitType
		
			if sUnit ~= "UNIT_WORKER" then return end

			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()

			if pCity then
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[21], pCity:GetNumRealBuilding(tBuildingsActiveAbilities[21]) + 1)
			end
		end
	end
end



-- LAHORE (INCREASING UNIT CS)
function CanWeBuyNihang(ePlayer, eCity, eUnit)
	if eUnit ~= tUnitsMilitary[3] then return true end
	
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return false end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[44]) ~= 0 then
		return true
	else
		return false
	end
end
GameEvents.CityCanTrain.Add(CanWeBuyNihang)

function XPBoostForNihang(ePlayer, eCity, eBuilding, bGold, bFaith)
	local pPlayer = Players[ePlayer]
	local iNumNihangs = pPlayer:GetUnitClassCount(GameInfoTypes.UNITCLASS_NIHANG)
	
	if iNumNihangs > 0 then
		local sBuildingClass = GameInfo.Buildings[eBuilding].BuildingClass
		local bArmory = sBuildingClass == "BUILDINGCLASS_ARMORY"
		local bMilitaryAcademy = sBuildingClass == "BUILDINGCLASS_MILITARY_ACADEMY"
		local bArsenal = sBuildingClass == "BUILDINGCLASS_ARSENAL"

		if bArmory or bMilitaryAcademy or bArsenal then
			local pCity = pPlayer:GetCityByID(eCity)
			
			for unit in pPlayer:Units() do
				if unit:GetUnitType() == tUnitsMilitary[3] then
					if bArmory then
						unit:ChangeExperience(2)
					elseif bMilitaryAcademy then
						unit:ChangeExperience(3)
					elseif bArsenal then
						unit:ChangeExperience(4)
					end
				end
			end

			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_NIHANG_XP", L(GameInfo.Buildings[eBuilding].Description)), L("TXT_KEY_UCS_NIHANG_XP_TITLE"), pCity:GetX(), pCity:GetY())		
			end
		end
	end
end

function NihangPromoted(eUnitOwner, eUnit, ePromotion)
	--[[PROMOTION_SIKH = 5
		PROMOTION_SIKH_SWORD = 6
		PROMOTION_SIKH_KNIFE = 7
		PROMOTION_SIKH_DISC = 8
		PROMOTION_SIKH_BOW = 9
		PROMOTION_SIKH_TRIDENT = 10
		PROMOTION_SIKH_DAGGER = 11
		PROMOTION_SIKH_MUSKET = 12
		PROMOTION_SIKH_SHIELD = 13
		PROMOTION_SIKH_CHAINMAIL = 14
		PROMOTION_SIKH_ROBE = 15
		PROMOTION_SIKH_SHOES = 16
		PROMOTION_SIKH_TURBAN = 17
		PROMOTION_SIKH_MARTIAL_ART = 18
		PROMOTION_SIKH_BRACELET = 19 --]]
		local pUnit = Players[eUnitOwner]:GetUnitByID(eUnit)

		if ePromotion == tPromotionsActiveAbilities[6] or ePromotion == tPromotionsActiveAbilities[13] 
			or ePromotion == tPromotionsActiveAbilities[15] or ePromotion == tPromotionsActiveAbilities[17] then
			pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() + 1)
		elseif ePromotion == tPromotionsActiveAbilities[14] then
			pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() + 2)
		elseif ePromotion == tPromotionsActiveAbilities[7] or ePromotion == tPromotionsActiveAbilities[9]
			or ePromotion == tPromotionsActiveAbilities[10] or ePromotion == tPromotionsActiveAbilities[16] then
			pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() + 3)
		elseif ePromotion == tPromotionsActiveAbilities[11] or ePromotion == tPromotionsActiveAbilities[12] or ePromotion == tPromotionsActiveAbilities[18] then
			pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() + 4)
		elseif ePromotion == tPromotionsActiveAbilities[19] then
			pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() + 6)
		elseif ePromotion == tPromotionsActiveAbilities[5] or ePromotion == tPromotionsActiveAbilities[8] then
			-- nothing
		end
end

function RiposteFromNihang(eAttackingPlayer, eAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, eDefendingPlayer, eDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, eInterceptingPlayer, eInterceptingUnit, iInterceptorDamage, iX, iY)
	if not ((iAttackerFinalDamage < iAttackerMaxHP) and (iDefenderFinalDamage < iDefenderMaxHP)) then return end
	
	local pDefendingPlayer = Players[eDefendingPlayer]
	local pDefendingUnit = pDefendingPlayer:GetUnitByID(eDefendingUnit)
		
	if pDefendingUnit and pDefendingUnit:IsHasPromotion(tPromotionsActiveAbilities[10]) then
		local pAttackingPlayer = Players[eAttackingPlayer]
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(eAttackingUnit)
		
		if pAttackingUnit then
			local iRiposteDamage = 0.2 * iDefenderDamage
			local iTotalDamageWithRiposte = iAttackerFinalDamage + iRiposteDamage
			
			pAttackingUnit:ChangeDamage(iRiposteDamage)

			if pAttackingPlayer:IsHuman() and pAttackingPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(iX, iY)
				
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR:6:82:255:255]Trehsool Mukh used![ENDCOLOR]", 1.3)

				if iTotalDamageWithRiposte >= iAttackerMaxHP then
					pAttackingPlayer:AddNotification(NotificationTypes.NOTIFICATION_UNIT_DIED, L("TXT_KEY_UCS_NIHANG_RIPOSTED"), L("TXT_KEY_UCS_NIHANG_RIPOSTED_TITLE"), iX, iY, pAttackingUnit:GetUnitType())		
				end
			end

			if pDefendingPlayer:IsHuman() then
				local vUnitPosition = PositionCalculator(iX, iY)
				
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR:6:82:255:255]Trehsool Mukh used![ENDCOLOR]", 1.3)
			end
		end
	end
end



-- DAKKAR (UNITS GIVEN TO CS HAVE MORE CS)
function GiftToDakkar(eMajor, eMinor, iGold, eUnitType, iX, iY)
	local pMajorPlayer = Players[eMajor]
	
	if pMajorPlayer:GetEventChoiceCooldown(tEventChoice[45]) ~= 0 then
		local pMinorPlayer = Players[eMinor]
		
		for unit in pMinorPlayer:Units() do
			if unit:GetUnitType() == eUnitType and not unit:IsHasPromotion(tPromotionsActiveAbilities[20]) then
				local bCombat = GameInfo.Units[eUnitType].Combat > 0
				local bRangedCombat = GameInfo.Units[eUnitType].RangedCombat > 0
								
				if bCombat and bRangedCombat then
					unit:SetHasPromotion(tPromotionsActiveAbilities[20], true)
					unit:SetBaseCombatStrength(unit:GetBaseCombatStrength() + 5)
					unit:SetBaseRangedCombatStrength(unit:GetBaseRangedCombatStrength() + 5)
				elseif not bCombat and bRangedCombat then
					unit:SetHasPromotion(tPromotionsActiveAbilities[20], true)
					unit:SetBaseRangedCombatStrength(unit:GetBaseRangedCombatStrength() + 5)
				elseif bCombat and not bRangedCombat then
					unit:SetHasPromotion(tPromotionsActiveAbilities[20], true)
					unit:SetBaseCombatStrength(unit:GetBaseCombatStrength() + 5)
				end

				break
			end
		end
	end
end

function DakkarUpgraded(eUnitOwner, eOldUnit, eNewUnit, bGoodyHut)
	local pPlayer = Players[eUnitOwner]

	if not pPlayer:IsMinorCiv() then return end

	local pOldUnit = pPlayer:GetUnitByID(eOldUnit)
	local pNewUnit = pPlayer:GetUnitByID(eNewUnit)

	if pOldUnit:IsHasPromotion(tPromotionsActiveAbilities[20]) then
		local eUnitType = pNewUnit:GetUnitType()
		
		local bCombat = GameInfo.Units[eUnitType].Combat > 0
		local bRangedCombat = GameInfo.Units[eUnitType].RangedCombat > 0
				
		if bCombat and bRangedCombat then
			pNewUnit:SetBaseCombatStrength(pNewUnit:GetBaseCombatStrength() + 5)
			pNewUnit:SetBaseRangedCombatStrength(pNewUnit:GetBaseRangedCombatStrength() + 5)
		elseif not bCombat and bRangedCombat then
			pNewUnit:SetBaseRangedCombatStrength(pNewUnit:GetBaseRangedCombatStrength() + 5)
		elseif bCombat and not bRangedCombat then
			pNewUnit:SetBaseCombatStrength(pNewUnit:GetBaseCombatStrength() + 5)
		end
	end
end



-- HONIARA
function HoniaraSignsForTheNature(eCityOwner, eCity, iX, iY, bGold, bCulture)
	if not bCulture then return end

	local pPlot = Map.GetPlot(iX, iY)
	local eResource = pPlot:GetResourceType()
	
	if eResource == -1 then return end
	
	local bBonusResource = GameInfo.Resources[eResource].ResourceClassType == "RESOURCECLASS_BONUS"
	
	if not bBonusResource then return end
	
	local pPlayer = Players[eCityOwner]
	local bCoast = pPlot:GetPlotType() == tPlotTypes[4]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[48]) ~= 0 then
		local iBaseYield = 25
		local iSeaModifier = bCoast and 2 or 1
		local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
		local iSuahongiDance = iBaseYield * iSeaModifier * iEraModifier
		local pCity = pPlot:GetWorkingCity()
		local pHoniara = Players[tLostCities["eLostHoniara"]]

		pPlayer:DoInstantYield(GameInfoTypes.YIELD_FOOD, iSuahongiDance, true, pCity:GetID())
			
		if pPlayer:IsHuman() then
			if not bCoast then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_HONIARA_LAND", pHoniara:GetName(), iSuahongiDance, pCity:GetName()), L("TXT_KEY_UCS_BONUS_HONIARA_TITLE"), pCity:GetX(), pCity:GetY())
			else
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_HONIARA_SEA", pHoniara:GetName(), iSuahongiDance, pCity:GetName()), L("TXT_KEY_UCS_BONUS_HONIARA_TITLE"), pCity:GetX(), pCity:GetY())
			end
		end	
	end
end



-- SANAA (GOLD FROM DIFFERENT LUXURIES)
function DoWeHaveNewLuxury(ePlayer, iX, iY, eImprovement)
	local pPlayer = Players[ePlayer]

	if pPlayer:GetEventChoiceCooldown(tEventChoice[50]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		local eResource = pPlot:GetResourceType()
		
		if eResource == -1 then return end

		local bLuxury = GameInfo.Resources[eResource].ResourceClassType == "RESOURCECLASS_LUXURY"
		
		if bLuxury then
			FindLuxuriesForSanaa(ePlayer)
		end
	end
end

function DoWeLostALuxury(iX, iY, ePlotOwner, eOldImprovement, eNewImprovement, bPillaged)
	local pPlayer = Players[ePlotOwner]

	if ePlotOwner == -1 then return end

	if pPlayer:GetEventChoiceCooldown(tEventChoice[50]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		local eResource = pPlot:GetResourceType()
		
		if eResource == -1 then return end
		
		local bLuxury = GameInfo.Resources[eResource].ResourceClassType == "RESOURCECLASS_LUXURY"
		
		if bLuxury then
			FindLuxuriesForSanaa(ePlotOwner)
		end
	end
end

function LuxuriesOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[50] then
		FindLuxuriesForSanaa(ePlayer)
	end
end

function LuxuriesOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[50] then
		local pPlayer = Players[ePlayer]
		local pCapital = pPlayer:GetCapitalCity()

		pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[22], 0)
	end
end

function LuxuriesFromCaptured(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pOldPlayer = Players[eOldOwner]
	local pNewPlayer = Players[eNewOwner]

	if pOldPlayer:GetEventChoiceCooldown(tEventChoice[50]) ~= 0 then
		FindLuxuriesForSanaa(eOldOwner)
	end
	
	if pNewPlayer:GetEventChoiceCooldown(tEventChoice[50]) ~= 0 then
		FindLuxuriesForSanaa(eNewOwner)
	end
end

function FindLuxuriesForSanaa(ePlayer)
	local pPlayer = Players[ePlayer]

	if pPlayer:GetEventChoiceCooldown(tEventChoice[50]) ~= 0 then
		local tUniqueLuxuries = {}
		local iUniqueLuxuries = 0
		
		for city in pPlayer:Cities() do
			for i = 0, city:GetNumCityPlots() - 1, 1 do
				local pPlot = city:GetCityIndexPlot(i)
			   	
				if pPlot and pPlot:GetOwner() == ePlayer then
					local eResource = pPlot:GetResourceType()
					
					if eResource ~= -1 then
						local bLuxury = GameInfo.Resources[eResource].ResourceClassType == "RESOURCECLASS_LUXURY"
						
						if bLuxury and not pPlot:IsImprovementPillaged() and not tUniqueLuxuries[eResource] then
							local eImprovement = pPlot:GetImprovementType()
							
							if eImprovement ~= -1 then
								local bConnected = pPlot:IsResourceConnectedByImprovement(eImprovement)
								
								if bConnected then
									tUniqueLuxuries[eResource] = true
									iUniqueLuxuries = iUniqueLuxuries + 1
								end
							end
						end
					end
				end
			end
		end
		
		local pCapital = pPlayer:GetCapitalCity()

		pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[22], iUniqueLuxuries)
	end
end



-- KARASJOHKA (SPAWN REINDEER)
function BuiltCampOnDeerWithTundraAround(ePlayer, iX, iY, eImprovement)
	if eImprovement ~= tImprovementsRegular[1] then return end
	
	local pPlayer = Players[ePlayer]

	if pPlayer:GetEventChoiceCooldown(tEventChoice[54]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		local eResource = pPlot:GetResourceType()

		if eResource ~= tResourcesBonus[1] then return end
		
		local tPossibleReindeerSpots = {}
		local iSnowNumTilesAround = 0;
		
		for i, direction in ipairs(tDirectionTypes) do
			local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
			
			if pAdjacentPlot then
				local bAdjacentCity = pAdjacentPlot:IsCity()
				local eAdjacentResource = pAdjacentPlot:GetResourceType()
				local eAdjacentTerrain = pAdjacentPlot:GetTerrainType()
				local bAdjacentSnow = eAdjacentTerrain == tTerrainTypes[1]
				local bAdjacentTundra = eAdjacentTerrain == tTerrainTypes[2]
				
				if (bAdjacentSnow or bAdjacentTundra) and eAdjacentResource == -1 and not bAdjacentCity then
					table.insert(tPossibleReindeerSpots, pAdjacentPlot)
					
					if bAdjacentSnow then
						iSnowNumTilesAround = iSnowNumTilesAround + 1
					end
				end
			end
		end

		-- 1st round of placing a Reindeer resource (80% + X% per adjacent Snow)
		if #tPossibleReindeerSpots == 0 then return end
		
		local iChance = Game.Rand(100, "Chance for spawning a Reindeer")
		local iThreshold = 80 + iSnowNumTilesAround
		
		if iChance >= iThreshold then return end
		
		local pKarasjohka = Players[tLostCities["eLostKarasjohka"]]
		local iRandomSpot = Game.Rand(#tPossibleReindeerSpots, "Choosing plot for a Reindeer") + 1
		local pChosenPlot = table.remove(tPossibleReindeerSpots, iRandomSpot)
		
		pChosenPlot:SetResourceType(tResourcesBonus[2], 1)

		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_KARASJOHKA_MAIN", pKarasjohka:GetName()), L("TXT_KEY_UCS_BONUS_KARASJOHKA_MAIN_TITLE"), pChosenPlot:GetX(), pChosenPlot:GetY())
		end

		-- 2nd round of placing a Reindeer resource (10% + X% per adjacent Snow)
		if #tPossibleReindeerSpots == 0 then return end
		
		iChance = Game.Rand(100, "Chance for spawning additional Reindeer")
		
		if iChance >= iThreshold - 70 then return end
		
		iRandomSpot = Game.Rand(#tPossibleReindeerSpots, "Choosing plot for a Reindeer") + 1
		pChosenPlot = table.remove(tPossibleReindeerSpots, iRandomSpot)

		pChosenPlot:SetResourceType(tResourcesBonus[2], 1)

		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_KARASJOHKA_AUX", pKarasjohka:GetName()), L("TXT_KEY_UCS_BONUS_KARASJOHKA_AUX_TITLE"), pChosenPlot:GetX(), pChosenPlot:GetY())
		end
	end
end



-- AYUTTHAYA (WAR EFFECTS; ON CONSTRUCTION BONUS)
function WarDeclaredToAyutthaya(eOriginatingPlayer, eTeam, bAggressor)
	local pOriginatingPlayer = Players[eOriginatingPlayer]
	local iBaseProduction = 10
	local iBaseGeneralPoints = 50
	local iEraModifier = math.max(1, pOriginatingPlayer:GetCurrentEra())
	local iTotalProduction = iBaseProduction * iEraModifier
	local pAyutthaya = Players[tLostCities["eLostAyutthaya"]]

	if pOriginatingPlayer:GetEventChoiceCooldown(tEventChoice[55]) ~= 0 then
		pOriginatingPlayer:DoInstantYield(GameInfoTypes.YIELD_PRODUCTION, iTotalProduction, true)
		
		local pCapital = pOriginatingPlayer:GetCapitalCity()
		
		if pOriginatingPlayer:IsHuman() then
			pOriginatingPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_AYUTTHAYA_DECLARED", pAyutthaya:GetName(), iTotalProduction), L("TXT_KEY_UCS_BONUS_AYUTTHAYA_DECLARED_TITLE"), pCapital:GetX(), pCapital:GetY())
		end	
	end
	
	for eplayerplayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pPlayer = Players[eplayerplayer]
		local eDefenderTeam = pPlayer:GetTeam()
		
		if eDefenderTeam == eTeam and pPlayer:GetEventChoiceCooldown(tEventChoice[55]) ~= 0 then	
			local pCapital = pPlayer:GetCapitalCity()
			
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_GREAT_GENERAL_POINTS, iBaseGeneralPoints, true, pCapital:GetID())
			
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_AYUTTHAYA_SUFFERED", pAyutthaya:GetName(), iBaseGeneralPoints), L("TXT_KEY_UCS_BONUS_AYUTTHAYA_SUFFERED_TITLE"), pCapital:GetX(), pCapital:GetY())
			end
		end
	end
end

function AyutthayaDevelops(ePlayer, eCity, eBuilding, bGold, bFaith)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[55]) ~= 0 then
		local iBuildingCost = GameInfo.Buildings[eBuilding].Cost
		local iBaseCulture = (iBuildingCost * 5) / 100
		local pCapital = pPlayer:GetCapitalCity()
		
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_CULTURE, iBaseCulture, true, pCapital:GetID())
	end
end



-- SARNATH (POLICY COST FROM RELIGION)
function SarnathLowersPolicyCostOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[56] then
		CheckReligionInCities(ePlayer)
	end
end

function SarnathLowersPolicyCostOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[56] then
		local pPlayer = Players[ePlayer]
		local pCapital = pPlayer:GetCapitalCity()

		pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[26], 0)
	end
end

function SarnathLowersPolicyCostOnFounding(ePlayer, eHolyCity, eReligion, eBelief1, eBelief2, eBelief3, eBelief4, eBelief5)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[56]) ~= 0 then
		CheckReligionInCities(ePlayer)
	end
end

function SarnathLowersPolicyCost(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[56]) ~= 0 then
		CheckReligionInCities(ePlayer)
	end
end

function CheckReligionInCities(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:HasCreatedReligion() then return end
	
	local eFoundedReligion = pPlayer:GetReligionCreatedByPlayer()
	local iNumReligiousCities = 0
	
	for city in pPlayer:Cities() do
		if city:GetReligiousMajority() == eFoundedReligion then
			iNumReligiousCities = iNumReligiousCities + 1
		end
	end
	
	if iNumReligiousCities > 10 then
		iNumReligiousCities = 10
	end

	local pCapital = pPlayer:GetCapitalCity()

	pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[26], iNumReligiousCities)
end



-- CLERMONT (BLOCK)
function GiveClermontPromoOnEventOn(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[62] then
		local pPlayer = Players[ePlayer]

		for unit in pPlayer:Units() do
			local eUnitCombatClass = unit:GetUnitCombatType()
			
			if eUnitCombatClass == GameInfoTypes.UNITCOMBAT_MELEE then
				local bHasClermontPromo = false
				
				for i = 22, 27, 1 do
					if unit:IsHasPromotion(tPromotionsActiveAbilities[i]) then
						bHasClermontPromo = true
						break
					end
				end

				unit:SetHasPromotion(tPromotionsActiveAbilities[21], not bHasClermontPromo)
			end
		end
	end
end

function TakeClermontPromoOnEventOff(ePlayer, eEventChoiceType)
	if eEventChoiceType == tEventChoice[62] then
		local pPlayer = Players[ePlayer]
	
		for unit in pPlayer:Units() do
			if unit:IsHasPromotion(tPromotionsActiveAbilities[21]) then
				unit:SetHasPromotion(tPromotionsActiveAbilities[21], false)
			end
		end
	end
end

function GiveClermontPromoOnTrain(eUnitOwner, eUnit, eUnitType, iX, iY)	
	local pPlayer = Players[eUnitOwner]
	local pUnit = pPlayer:GetUnitByID(eUnit)
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[62]) ~= 0 then
		local eUnitCombatClass = pUnit:GetUnitCombatType()

		if eUnitCombatClass == GameInfoTypes.UNITCOMBAT_MELEE or eUnitCombatClass == GameInfoTypes.UNITCOMBAT_GUN then
			pUnit:SetHasPromotion(tPromotionsActiveAbilities[21], true)
		end
	end
end



-- MENDYARRUP (GROWTH INTO MILITARY)
function FixForMendyarrup(iX, iY, ePlotOwner, eOldImprovement, eNewImprovement, bPillaged)
	if eOldImprovement ~= eNewImprovement or bPillaged then return end
	
	local pPlayer = Players[ePlotOwner]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[63]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetWorkingCity()
		local iOneTurnFood = pCity:GetYieldRate(iFoodYield)
		local pMendyarrup = Players[tLostCities["eLostMendyarrup"]]

		if pCity then
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FOOD, iOneTurnFood, true, pCity:GetID())
		
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_MENDYARRUP_FIX", pMendyarrup:GetName(), pCity:GetName(), iOneTurnFood), L("TXT_KEY_UCS_BONUS_MENDYARRUP_FIX_TITLE"), iX, iY)
			end
		end
	end
end

function PillageForMendyarrup(iX, iY, ePlotOwner, eOldImprovement, eNewImprovement, bPillaged)
	if eOldImprovement ~= eNewImprovement or not bPillaged then return end
	
	local pPlot = Map.GetPlot(iX, iY)
	local iNumUnitsOnTile = pPlot:GetNumUnits()
				
	if iNumUnitsOnTile > 0 then
		for i = 0, iNumUnitsOnTile - 1, 1 do
			local pUnit = pPlot:GetUnit(i)
						
			if pUnit:IsCombatUnit() then
				if pUnit:IsHasPromotion(tPromotionsActiveAbilities[28]) then
					local iMovementAdded = 1
						
					pUnit:ChangeExperience(3)
					pUnit:ChangeMoves(GameDefines["MOVE_DENOMINATOR"] * iMovementAdded)
					break
				end
			end
		end
	end		
end

function GrowthForMendyarrup(iX, iY, iOldPop, iNewPop)
	if iNewPop <= iOldPop or iNewPop < 2 then return end
	
	local pPlot = Map.GetPlot(iX, iY)
	local pCity = pPlot:GetWorkingCity()
	local ePlayer = pCity:GetOwner()	
	local pPlayer = Players[pCity:GetOwner()]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[63]) ~= 0 then
		local pMendyarrup = Players[tLostCities["eLostMendyarrup"]]
		local iSumUnitsBuffed = 0
		
		for iplot = 0, 18 do -- 2 tiles away from a city
			local plot = pCity:GetCityIndexPlot(iplot)
			
			if plot then
				local iNumUnitsOnTile = plot:GetNumUnits()
				
				if iNumUnitsOnTile > 0 then
					for i = 0, iNumUnitsOnTile - 1, 1 do
						local pUnit = plot:GetUnit(i)
						
						if pUnit:GetOwner() == ePlayer then
							if pUnit:IsCombatUnit() then
								pUnit:ChangeExperience(2)
								iSumUnitsBuffed = iSumUnitsBuffed + 1
							end
						end
					end
				end
			end
		end

		if iSumUnitsBuffed then	
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_MENDYARRUP_XP", pMendyarrup:GetName(), pCity:GetName(), iSumUnitsBuffed), L("TXT_KEY_UCS_BONUS_MENDYARRUP_XP_TITLE"), iX, iY)
			end
		end
	end
end



-- SADDARVAZEH (MISSIONARIES SPAWNED)
function ZoroasterHolySite(iX, iY, ePlotOwner, eOldImprovement, eNewImprovement, bPillaged)
	if eNewImprovement == tImprovementsGreatPeople[2] and (eOldImprovement ~= eNewImprovement or eOldImprovement == -1) then
		local pPlayer = Players[ePlotOwner]
		
		if pPlayer and pPlayer:GetEventChoiceCooldown(tEventChoice[65]) ~= 0 then
			local bCanMissionaryBeSpawned = pPlayer:HasCreatedReligion()
			
			if bCanMissionaryBeSpawned then
				local pPlot = Map.GetPlot(iX, iY)
				local pCity = pPlot:GetWorkingCity()
				local pChosenCity = pCity -- unused currently (choosing city not possible)	
				local eReligion = pPlayer:GetReligionCreatedByPlayer()		
				local bCityHasMajority = pCity:GetReligiousMajority() > 0 and pCity:GetReligiousMajority() == eReligion
				local bIsValidCity = false
				local iRealX, iRealY = iX, iY
				local pSaddarvazeh = Players[tLostCities["eLostSaddarvazeh"]]
				
				if bCityHasMajority then
					pCity:SetNumRealBuilding(tBuildingsActiveAbilities[32], pCity:GetNumRealBuilding(tBuildingsActiveAbilities[32]) + 1) -- temporary solution for city choosing
					--pPlayer:AddFreeUnit(tUnitsCivilian[3], UNITAI_DEFENSE)
					bIsValidCity = true
				else
					for city in pPlayer:Cities() do
						if city:IsHolyCityForReligion(eReligion) and city:GetReligiousMajority() == eReligion then
							city:SetNumRealBuilding(tBuildingsActiveAbilities[32], city:GetNumRealBuilding(tBuildingsActiveAbilities[32]) + 1) -- temporary solution for city choosing
							--pPlayer:AddFreeUnit(tUnitsCivilian[3], UNITAI_DEFENSE)
							bIsValidCity = true
							pCity = city
							iRealX = city:GetX()
							iRealY = city:GetY()
							break
						end
					end
				end

				if bIsValidCity and pPlayer:IsHuman() then
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_SADDARVAZEH", pSaddarvazeh:GetName(), pCity:GetName()), L("TXT_KEY_UCS_BONUS_SADDARVAZEH_TITLE"), iRealX, iRealY)
				end
			end
		end
	end
end

function ZoroasterFound(ePlayer, eHolyCity, eReligion, eBelief1, eBelief2, eBelief3, eBelief4, eBelief5)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[65]) ~= 0 then
		ZoroasterActs(ePlayer, eReligion)
	end
end

function ZoroasterEnhanced(ePlayer, eReligion, eBelief1, eBelief2)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[65]) ~= 0 then
		ZoroasterActs(ePlayer, eReligion)
	end
end

function ZoroasterReformed(ePlayer, eReligion, eBelief)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[65]) ~= 0 then
		ZoroasterActs(ePlayer, eReligion)
	end
end

function ZoroasterActs(ePlayer, eReligion)
	local pPlayer = Players[ePlayer]
	
	for city in pPlayer:Cities() do
		if city:IsHolyCityForReligion(eReligion) and city:GetReligiousMajority() == eReligion then
			city:SetNumRealBuilding(tBuildingsActiveAbilities[32], city:GetNumRealBuilding(tBuildingsActiveAbilities[32]) + 1) -- temporary solution for city choosing
			--pPlayer:AddFreeUnit(tUnitsCivilian[3], UNITAI_DEFENSE)

			local iX = city:GetX()
			local iY = city:GetY()
			local pSaddarvazeh = Players[tLostCities["eLostSaddarvazeh"]]
			
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_SADDARVAZEH", pSaddarvazeh:GetName(), city:GetName()), L("TXT_KEY_UCS_BONUS_SADDARVAZEH_TITLE"), iX, iY)
			end
			
			break
		end
	end
end



-- IRUNEA (FREE WORK BOATS)
function IruneaConstructsOnEraChange(eTeam, eEra, bFirst)
	for eplayer = 0, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pPlayer = Players[eplayer]

		if pPlayer and pPlayer:IsAlive() then
			if pPlayer:IsMinorCiv() then return end

			local ePlayerTeam = pPlayer:GetTeam()

			if ePlayerTeam == eTeam then
				if pPlayer:GetEventChoiceCooldown(tEventChoice[66]) ~= 0 then
					local pCity = pPlayer:GetCapitalCity() -- nil
					local pIrunea = Players[tLostCities["eLostIrunea"]]

					for city in pPlayer:Cities() do
						if city:IsCoastal(10) then
							pCity = city -- unused until added
						end
					end

					pCity:SetNumRealBuilding(tBuildingsActiveAbilities[33], pCity:GetNumRealBuilding(tBuildingsActiveAbilities[33]) + 1) -- temporary solution for city choosing
					--pPlayer:AddFreeUnit(tUnitsCivilian[2], UNITAI_DEFENSE)
					
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_IRUNEA_ERA", pIrunea:GetName()), L("TXT_KEY_UCS_BONUS_IRUNEA_ERA_TITLE"), pCity:GetX(), pCity:GetY())
					end
				end
			end
		end
	end
end

function IruneaConstructsOnCityFounding(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[66]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
				
		if pPlot then
			local pCity = pPlot:GetWorkingCity()
			
			if pCity:IsCoastal(10) then
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[33], 1) -- temporary solution for city choosing
				--pPlayer:AddFreeUnit(tUnitsCivilian[2], UNITAI_DEFENSE)
					
				if pPlayer:IsHuman() then
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_IRUNEA_SETTLE", pIrunea:GetName()), L("TXT_KEY_UCS_BONUS_IRUNEA_SETTLE_TITLE"), pCity:GetX(), pCity:GetY())
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- INITIALIZATION
function SettingUpSpecificEvents()
	tSettings["EnablePassives"] = GameInfo.Community{Type="UCS-PASSIVES-ON"}().Value == 1
	tSettings["EnablePassivesImprovements"] = GameInfo.Community{Type="UCS-PASSIVES-TILE"}().Value == 1
	tSettings["EnablePassivesTileResources"] = GameInfo.Community{Type="UCS-PASSIVES-RES"}().Value == 1
	tSettings["EnablePassivesLuxuries"] = GameInfo.Community{Type="UCS-PASSIVES-LUX"}().Value == 1
	tSettings["EnablePassivesFreeUnits"] = GameInfo.Community{Type="UCS-PASSIVES-UNIT"}().Value == 1
	tSettings["EnablePassivesBorderGrowth"] = GameInfo.Community{Type="UCS-PASSIVES-BGP"}().Value == 1
	tSettings["EnablePassivesHitPoints"] = GameInfo.Community{Type="UCS-PASSIVES-HP"}().Value == 1

	if tSettings["EnablePassives"] then
		GameEvents.PlayerCityFounded.Add(MaritimeCityStatesBonuses)
		GameEvents.PlayerLiberated.Add(MaritimeCityStatesBonusesLiberated)
		
		GameEvents.PlayerCityFounded.Add(MercantileCityStatesBonuses)
		GameEvents.PlayerLiberated.Add(MercantileCityStatesBonusesLiberated)
		
		GameEvents.PlayerCityFounded.Add(MilitaristicCityStatesBonuses)
		GameEvents.PlayerLiberated.Add(MilitaristicCityStatesBonusesLiberated)
		GameEvents.CityTrained.Add(CityStateTrainedUU)
		
		GameEvents.PlayerCityFounded.Add(CulturedCityStatesBonuses)
		GameEvents.PlayerLiberated.Add(CulturedCityStatesBonusesLiberated)
		GameEvents.PlayerDoTurn.Add(FreeGreatWorkFromCityState)
		
		GameEvents.PlayerCityFounded.Add(ReligiousCityStatesBonuses)
		GameEvents.PlayerLiberated.Add(ReligiousCityStatesBonusesLiberated)
	end
	
	if tSettings["EnablePassivesImprovements"] then
		GameEvents.TeamSetEra.Add(MaritimeFreeGreatPersonImprovement)
		GameEvents.TeamSetEra.Add(MercantileFreeGreatPersonImprovement)
		GameEvents.TeamSetEra.Add(MilitaristicFreeGreatPersonImprovement)
		GameEvents.TeamSetEra.Add(CulturedFreeGreatPersonImprovement)
		GameEvents.TeamSetEra.Add(ReligiousFreeGreatPersonImprovement)
	end
	
	if tSettings["EnablePassivesLuxuries"] then
		-- part of this mechanics is blocked inside regular pasive functions
		
		InitializeMaritimeResources()
		InitializeMilitaristicResources()
		InitializeCulturedResources()
		InitializeReligiousResources()
		
		GameEvents.CityCaptureComplete.Add(ConquerCityStatesLuxuries)
		GameEvents.PlayerLiberated.Add(LiberatedCityStatesLuxuries)
		GameEvents.PlayerDoTurn.Add(UniqueMonopolyBonuses)
	end
	
	if tSettings["EnablePassivesFreeUnits"] then
		GameEvents.PlayerDoTurn.Add(FreeWorkerFromCityState)
		GameEvents.PlayerDoTurn.Add(FreeCaravanFromCityState)
		GameEvents.PlayerDoTurn.Add(FreeArchaeologistFromCityState)
		GameEvents.PlayerDoTurn.Add(FreeMissionaryFromCityState)
	end
	
	-- active abilities
	for eCS, pCS in pairs(Players) do
		if pCS:IsMinorCiv() then		
			local sMinorCivType = GameInfo.MinorCivilizations[pCS:GetMinorCivType()].Type
		
			-- unit actions effects
			if sMinorCivType == "MINOR_CIV_BOGOTA" then	
				tLostCities["eLostBogota"] = eCS
				GameEvents.PlayerLiberated.Add(LiberatedForBogota)		
				GameEvents.CityCaptureComplete.Add(CapturedForBogota)
			elseif sMinorCivType == "MINOR_CIV_LEVUKA" then
				tLostCities["eLostLevuka"] = eCS
				GameEvents.CityCaptureComplete.Add(CaptureCityForLevuka)
				GameEvents.PlayerDoTurn.Add(ConquestsForLevuka)
				GameEvents.BarbariansCampCleared.Add(BarbCampForLevuka)
				
			
			-- improvements
			elseif sMinorCivType == "MINOR_CIV_CAHOKIA" or sMinorCivType == "MINOR_CIV_SGAANG" or sMinorCivType == "MINOR_CIV_NYARYANA_MARQ" 
			or sMinorCivType == "MINOR_CIV_LA_VENTA" or sMinorCivType == "MINOR_CIV_TUNIS" 
			or sMinorCivType == "MINOR_CIV_BALKH" or sMinorCivType == "MINOR_CIV_PALMYRA" 
			or sMinorCivType == "MINOR_CIV_MOGADISHU" or sMinorCivType == "MINOR_CIV_TIWANAKU" or sMinorCivType == "MINOR_CIV_LONGYAN" 
			or sMinorCivType == "MINOR_CIV_AL_TIRABIN" or sMinorCivType == "MINOR_CIV_KARYES" then
					GameEvents.PlayerCanBuild.Add(CanWeSubstituteImprovement)
			
				if sMinorCivType == "MINOR_CIV_CAHOKIA" then	
					tLostCities["eLostCahokia"] = eCS
				elseif sMinorCivType == "MINOR_CIV_SGAANG" then	
					tLostCities["eLostSGaang"] = eCS
				elseif sMinorCivType == "MINOR_CIV_NYARYANA_MARQ" then	
					tLostCities["eLostNyaryanaMarq"] = eCS
				elseif sMinorCivType == "MINOR_CIV_LA_VENTA" then	
					tLostCities["eLostLaVenta"] = eCS
				elseif sMinorCivType == "MINOR_CIV_TUNIS" then	
					tLostCities["eLostTunis"] = eCS
				elseif sMinorCivType == "MINOR_CIV_BALKH" then	
					tLostCities["eLostBalkh"] = eCS
					GameEvents.BuildFinished.Add(BuiltPhrourion)
				elseif sMinorCivType == "MINOR_CIV_PALMYRA" then	
					tLostCities["eLostPalmyra"] = eCS
					GameEvents.BuildFinished.Add(BuiltFuneraryTower)
				elseif sMinorCivType == "MINOR_CIV_MOGADISHU" then	
					tLostCities["eLostMogadishu"] = eCS
					GameEvents.BuildFinished.Add(BuiltDaaqAh)
				elseif sMinorCivType == "MINOR_CIV_TIWANAKU" then	
					tLostCities["eLostTiwanaku"] = eCS
					GameEvents.CityTrained.Add(DummyWorkerForAISisqeno)
					GameEvents.BuildFinished.Add(BuiltSunkenCourtyard)
				elseif sMinorCivType == "MINOR_CIV_AL_TIRABIN" then	
					tLostCities["eLostAlTirabin"] = eCS
					GameEvents.EventChoiceActivated.Add(TradeRoutesFromBedouinsOnEventOn)
					GameEvents.EventChoiceEnded.Add(TradeRoutesFromBedouinsOnEventOff)
					GameEvents.TeamSetEra.Add(TradeRoutesFromBedouinsOnEraChange)
				elseif sMinorCivType == "MINOR_CIV_LONGYAN" then	
					tLostCities["eLostLongyan"] = eCS
					GameEvents.BuildFinished.Add(BuiltTulou)
					GameEvents.TileImprovementChanged.Add(TulouPillagedOrDestroyed)
					GameEvents.EventChoiceActivated.Add(TulousOnEventOn)
					GameEvents.EventChoiceEnded.Add(TulousOnEventOff)
					GameEvents.CityCaptureComplete.Add(TulousOnCapture)
				elseif sMinorCivType == "MINOR_CIV_KARYES" then	
					tLostCities["eLostKaryes"] = eCS
					GameEvents.BuildFinished.Add(BuiltMonastery)
					GameEvents.TileImprovementChanged.Add(MonasteryPillagedOrDestroyed)
					GameEvents.EventChoiceActivated.Add(MonasteriesOnEventOn)
					GameEvents.EventChoiceEnded.Add(MonasteriesOnEventOff)
					GameEvents.CityCaptureComplete.Add(MonasteriesOnCapture)
					GameEvents.PlayerCityFounded.Add(MonasteriesOnNewCity)

					CheckAllMonasteries()
				end


			-- resources/features
			elseif sMinorCivType == "MINOR_CIV_BRUSSELS" then	
				tLostCities["eLostBrussels"] = eCS
				GameEvents.BuildFinished.Add(PlacedMarsh)
				GameEvents.UnitSetXY.Add(InvisibleMarshOnMove)
				GameEvents.EventChoiceActivated.Add(InvisibleMarshOnEventOn)
				GameEvents.EventChoiceEnded.Add(InvisibleMarshOnEventOff)
			elseif sMinorCivType == "MINOR_CIV_ADEJE" then	
				tLostCities["eLostAdeje"] = eCS
				GameEvents.BuildFinished.Add(PlacedDogoCanario)
			--[[elseif sMinorCivType == "MINOR_CIV_YAIUWA" then	
				tLostCities["eLostYaiuwa"] = eCS
				GameEvents.BuildFinished.Add(PlacedLlaoLlao)--]]
			

			-- trade routes bonuses
			elseif sMinorCivType == "MINOR_CIV_CAPE_TOWN" then	
				tLostCities["eLostCapeTown"] = eCS
				GameEvents.PlayerTradeRouteCompleted.Add(TradeInCapeTown)
			elseif sMinorCivType == "MINOR_CIV_MANILA" then	
				tLostCities["eLostManila"] = eCS
				GameEvents.PlayerTradeRouteCompleted.Add(TradeInManila)
			elseif sMinorCivType == "MINOR_CIV_COLOMBO" then
				tLostCities["eLostColombo"] = eCS
				GameEvents.PlayerTradeRouteCompleted.Add(TradeInColombo)
			elseif sMinorCivType == "MINOR_CIV_HANUABADA" then	
				tLostCities["eLostHanuabada"] = eCS
				GameEvents.PlayerTradeRouteCompleted.Add(TradeInHanuabada)
			
			
			-- starting building setup for city-states
			elseif sMinorCivType == "MINOR_CIV_KIEV" or sMinorCivType == "MINOR_CIV_MILAN" 
			or sMinorCivType == "MINOR_CIV_VILNIUS" or sMinorCivType == "MINOR_CIV_VALLETTA" then
				GameEvents.PlayerCityFounded.Add(SettledCityStateWithBuilding)
				GameEvents.PlayerLiberated.Add(LiberatedCityStateWithBuilding)
				
				if sMinorCivType == "MINOR_CIV_KIEV" then	
					tLostCities["eLostKyiv"] = eCS
				elseif sMinorCivType == "MINOR_CIV_MILAN" then	
					tLostCities["eLostMilan"] = eCS
				elseif sMinorCivType == "MINOR_CIV_VILNIUS" then	
					tLostCities["eLostVilnius"] = eCS
				elseif sMinorCivType == "MINOR_CIV_VALLETTA" then	
					tLostCities["eLostValletta"] = eCS
				end
			
			
			-- gold interests
			elseif sMinorCivType == "MINOR_CIV_ZURICH" then	
				tLostCities["eLostZurich"] = eCS
				
				for eplayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
					tZurichLastInterests[eplayer] = 0
					tZurichCounter[eplayer] = 0
				end

				GameEvents.PlayerDoTurn.Add(ZurichMerchants)
				GameEvents.MinorAlliesChanged.Add(ZurichMerchantsNoAlly)
			

			-- sphere of influence
			elseif sMinorCivType == "MINOR_CIV_SIDON" then
				tLostCities["eLostSidon"] = eCS
				GameEvents.PlayerBullied.Add(DestroyLifeForSidon)
			elseif sMinorCivType == "MINOR_CIV_LHASA" then
				tLostCities["eLostLhasa"] = eCS
				
				if not Game.AnyoneHasWonder(tBuildingsActiveAbilities[1]) then
					GameEvents.PlayerCanConstruct.Add(CanWeBuildPotalaPalace)
					GameEvents.CityConstructed.Add(BuiltWonderForLhasa)
				end
			elseif sMinorCivType == "MINOR_CIV_JERUSALEM" then
				tLostCities["eLostJerusalem"] = eCS
				GameEvents.PlayerDoTurn.Add(JerusalemsDevotion)
				GameEvents.MinorAlliesChanged.Add(JerusalemsDevotionSphere)
			
			
			-- setting up specific building conditions
			elseif sMinorCivType == "MINOR_CIV_OC_EO" then	
				tLostCities["eLostOcEo"] = eCS
				GameEvents.PlayerDoTurn.Add(LordsOfTheGreatGlassRiver) -- could be unused if another event will be added in dll (TradeStarted)
				GameEvents.EventChoiceActivated.Add(LordsOfTheGreatGlassRiverOnEventOn)
				GameEvents.EventChoiceEnded.Add(LordsOfTheGreatGlassRiverOnEventOff)
				GameEvents.CityCaptureComplete.Add(LordsOfTheGreatGlassRiverCapture)
				GameEvents.PlayerCityFounded.Add(LordsOfTheGreatGlassRiverNewCity)
			elseif sMinorCivType == "MINOR_CIV_THIMPHU" then
				tLostCities["eLostThimphu"] = eCS
				GameEvents.EventChoiceActivated.Add(DrukTsendhenOnEventOn)
				GameEvents.EventChoiceEnded.Add(DrukTsendhenOnEventOff)
				GameEvents.CityCaptureComplete.Add(DrukTsendhenCapture)
				GameEvents.PlayerCityFounded.Add(DrukTsendhenNewCity)
			elseif sMinorCivType == "MINOR_CIV_PELYM" then
				tLostCities["eLostPelym"] = eCS
				GameEvents.EventChoiceActivated.Add(SiberianWarlordsOnEventOn)
				GameEvents.EventChoiceEnded.Add(SiberianWarlordsOnEventOff)
				GameEvents.CityCaptureComplete.Add(SiberianWarlordsCapture)
				GameEvents.PlayerCityFounded.Add(SiberianWarlordsNewCity)
			elseif sMinorCivType == "MINOR_CIV_RAGUSA" then
				tLostCities["eLostRagusa"] = eCS
				GameEvents.EventChoiceActivated.Add(MaritimeSuzeraintyOnEventOn)
				GameEvents.EventChoiceEnded.Add(MaritimeSuzeraintyOnEventOff)
				GameEvents.CityCaptureComplete.Add(MaritimeSuzeraintyCapture)
				GameEvents.PlayerCityFounded.Add(MaritimeSuzeraintyNewCity)
			elseif sMinorCivType == "MINOR_CIV_RISHIKESH" then
				tLostCities["eLostRishikesh"] = eCS
				GameEvents.EventChoiceActivated.Add(HimalayanYogiOnEventOn)
				GameEvents.EventChoiceEnded.Add(HimalayanYogiOnEventOff)
				GameEvents.CityCaptureComplete.Add(HimalayanYogiCapture)
				GameEvents.PlayerCityFounded.Add(HimalayanYogiNewCity)
			elseif sMinorCivType == "MINOR_CIV_ANDORRA" then
				tLostCities["eLostAndorra"] = eCS
				GameEvents.EventChoiceActivated.Add(PyreneanPareageOnEventOn)
				GameEvents.EventChoiceEnded.Add(PyreneanPareageOnEventOff)
				GameEvents.CityCaptureComplete.Add(PyreneanPareageCapture)
				GameEvents.PlayerCityFounded.Add(PyreneanPareageNewCity)
			elseif sMinorCivType == "MINOR_CIV_CANOSSA" then
				tLostCities["eLostCanossa"] = eCS
				GameEvents.EventChoiceActivated.Add(ArdentFlameInPiousHeartOnEventOn)
				GameEvents.EventChoiceEnded.Add(ArdentFlameInPiousHeartOnEventOff)
				GameEvents.CityCaptureComplete.Add(ArdentFlameInPiousHeartCapture)
				GameEvents.PlayerCityFounded.Add(ArdentFlameInPiousHeartNewCity)
				GameEvents.CityConstructed.Add(ArdentFlameInPiousHeartBuildingConstruction)
			elseif sMinorCivType == "MINOR_CIV_WOOTEI_NIICIE" then
				tLostCities["eLostWooteiNiicie"] = eCS
				GameEvents.EventChoiceActivated.Add(PeopleOfTheBlueSkyOnEventOn)
				GameEvents.EventChoiceEnded.Add(PeopleOfTheBlueSkyOnEventOff)
				GameEvents.CityCaptureComplete.Add(PeopleOfTheBlueSkyCapture)
				GameEvents.PlayerCityFounded.Add(PeopleOfTheBlueSkyNewCity)
				GameEvents.CityConstructed.Add(PeopleOfTheBlueSkyBuildingConstruction)
			elseif sMinorCivType == "MINOR_CIV_KATENDE" then
				tLostCities["eLostKatende"] = eCS
				GameEvents.EventChoiceActivated.Add(LongClawOfMemoryOnEventOn)
				GameEvents.EventChoiceEnded.Add(LongClawOfMemoryOnEventOff)
				GameEvents.CityCaptureComplete.Add(LongClawOfMemoryCapture)
				GameEvents.PlayerCityFounded.Add(LongClawOfMemoryNewCity)
				GameEvents.CityConstructed.Add(LongClawOfMemoryBuildingConstruction)
			elseif sMinorCivType == "MINOR_CIV_JETARKTE" then
				tLostCities["eLostJetarkte"] = eCS
				GameEvents.EventChoiceActivated.Add(SeaNomadsOnEventOn)
				GameEvents.EventChoiceEnded.Add(SeaNomadsOnEventOff)
				GameEvents.CityCaptureComplete.Add(SeaNomadsCapture)
				GameEvents.PlayerCityFounded.Add(SeaNomadsNewCity)
			
			
			-- new/exclusive units
			elseif sMinorCivType == "MINOR_CIV_DALI" then
				tLostCities["eLostDali"] = eCS
				--GameEvents.TeamTechResearched.Add(DummyTechHorsebackRiding)
			elseif sMinorCivType == "MINOR_CIV_VATICAN_CITY" then
				tLostCities["eLostVaticanCity"] = eCS
				GameEvents.CombatEnded.Add(SwissGuardHealingAttack)
				GameEvents.CombatEnded.Add(SwissGuardHealingDefend)
				GameEvents.PlayerDoTurn.Add(SwissGuardYields)
				GameEvents.CityTrained.Add(SwissGuardYieldsNotification)
			elseif sMinorCivType == "MINOR_CIV_KATHMANDU" then
				tLostCities["eLostKathmandu"] = eCS
			elseif sMinorCivType == "MINOR_CIV_POKROVKA" then
				tLostCities["eLostPokrovka"] = eCS
			elseif sMinorCivType == "MINOR_CIV_JUYUBIT" then
				tLostCities["eLostJuyubit"] = eCS
				GameEvents.UnitPrekill.Add(TeeatBuiltSomething)
			
			
			-- promotions effects
			elseif sMinorCivType == "MINOR_CIV_ISKANWAYA" then
				tLostCities["eLostIskanwaya"] = eCS
				GameEvents.PlayerDoTurn.Add(HealersFromIskanwaya)
			elseif sMinorCivType == "MINOR_CIV_KABUL" then
				tLostCities["eLostKabul"] = eCS
				GameEvents.UnitSetXY.Add(MujahideensFromKabulOnMove)
				GameEvents.EventChoiceActivated.Add(MujahideensFromKabulOnEventOn)
				GameEvents.EventChoiceEnded.Add(MujahideensFromKabulOnEventOff)
			

			-- citizen migration
			elseif sMinorCivType == "MINOR_CIV_HONG_KONG" then
				tLostCities["eLostHongKong"] = eCS
				GameEvents.PlayerDoTurn.Add(MigrationToHongKong)
			

			-- GP spawn
			elseif sMinorCivType == "MINOR_CIV_FLORENCE" then
				tLostCities["eLostFlorence"] = eCS
				GameEvents.PlayerDoTurn.Add(ArtistsInFlorence)


			-- tech researched effects
			elseif sMinorCivType == "MINOR_CIV_KYZYL" then
				tLostCities["eLostKyzyl"] = eCS
				GameEvents.TeamTechResearched.Add(ResearchersFromKyzyl)


			-- building construction effects
			elseif sMinorCivType == "MINOR_CIV_TYRE" then
				tLostCities["eLostTyre"] = eCS
				GameEvents.CityConstructed.Add(TourismFromTyre)
				

			-- multiplication of strategic resources
			elseif sMinorCivType == "MINOR_CIV_WELLINGTON" then
				tLostCities["eLostWellington"] = eCS
				GameEvents.PlayerDoTurn.Add(EvenMoreStrategicResources)


			-- changing feature yields
			elseif sMinorCivType == "MINOR_CIV_QUEBEC_CITY" then
				tLostCities["eLostQuebecCity"] = eCS
				GameEvents.TileFeatureChanged.Add(FeatureCutByQuebec)


			-- prekill effects
			elseif sMinorCivType == "MINOR_CIV_PRAGUE" then
				tLostCities["eLostPrague"] = eCS
				GameEvents.UnitPrekill.Add(SpreadTheFaithInPrussia)
			elseif sMinorCivType == "MINOR_CIV_SINGAPORE" then
				tLostCities["eLostSingapore"] = eCS
				GameEvents.UnitPrekill.Add(WiseDiplomatsFromSingapore)


			-- WLTKD start/end effects
			elseif sMinorCivType == "MINOR_CIV_SYDNEY" then
				tLostCities["eLostSydney"] = eCS
				GameEvents.CityBeginsWLTKD.Add(GenerateGPPBySydney)
			elseif sMinorCivType == "MINOR_CIV_GWYNEDD" then
				tLostCities["eLostGwynedd"] = eCS
				GameEvents.CityBeginsWLTKD.Add(WeLoveGwyneddSoMuch) -- city starts celebrating WLTKD
				GameEvents.CityExtendsWLTKD.Add(WeLoveGwyneddSoMuch) -- city already celebrating WLTKD, which then gets extended	
				GameEvents.EventChoiceActivated.Add(WeLoveGwyneddSoMuchOnEventOn)
				GameEvents.EventChoiceEnded.Add(WeLoveGwyneddSoMuchOnEventOff)


			-- era change yields
			elseif sMinorCivType == "MINOR_CIV_YANGCHENG" then
				tLostCities["eLostYangcheng"] = eCS
				GameEvents.TeamSetEra.Add(YearOfTheAnimal)


			-- trained unit effects
			elseif sMinorCivType == "MINOR_CIV_IFE" then
				tLostCities["eLostIfe"] = eCS
				GameEvents.CityTrained.Add(FaithForDiploFromIfe)
				GameEvents.UnitCreated.Add(FaithForDiploFromIfeSpawn)				
			elseif sMinorCivType == "MINOR_CIV_GENEVA" then
				tLostCities["eLostGeneva"] = eCS
				GameEvents.UnitCreated.Add(FaithForGPFromGeneva)
			elseif sMinorCivType == "MINOR_CIV_GENOA" then
				tLostCities["eLostGenoa"] = eCS
				GameEvents.UnitCreated.Add(GoldForGPFromGenoa)


			-- yield per unit
			elseif sMinorCivType == "MINOR_CIV_SIERRA_LEONE" then
				tLostCities["eLostSierraLeone"] = eCS
				GameEvents.PlayerDoTurn.Add(CulturePerWorker)
			elseif sMinorCivType == "MINOR_CIV_OUIDAH" then
				tLostCities["eLostOuidah"] = eCS
				GameEvents.PlayerDoTurn.Add(GoldPerWorker)
				GameEvents.BuildFinished.Add(BuiltImprovementForOuidah)
			

			-- unique promotion branch
			elseif sMinorCivType == "MINOR_CIV_LAHORE" then
				tLostCities["eLostLahore"] = eCS
				GameEvents.CityConstructed.Add(XPBoostForNihang)
				GameEvents.UnitPromoted.Add(NihangPromoted)
				GameEvents.CombatEnded.Add(RiposteFromNihang)
			

			-- gifted units
			elseif sMinorCivType == "MINOR_CIV_DAKKAR" then
				tLostCities["eLostDakkar"] = eCS
				GameEvents.PlayerGifted.Add(GiftToDakkar)
				GameEvents.UnitUpgraded.Add(DakkarUpgraded)
			
			
			-- border growth bonuses
			elseif sMinorCivType == "MINOR_CIV_HONIARA" then
				tLostCities["eLostHoniara"] = eCS
				GameEvents.CityBoughtPlot.Add(HoniaraSignsForTheNature)
			

			-- finding luxuries
			elseif sMinorCivType == "MINOR_CIV_SANAA" then
				tLostCities["eLostSanaa"] = eCS
				GameEvents.BuildFinished.Add(DoWeHaveNewLuxury)
				GameEvents.TileImprovementChanged.Add(DoWeLostALuxury)
				GameEvents.EventChoiceActivated.Add(LuxuriesOnEventOn)
				GameEvents.EventChoiceEnded.Add(LuxuriesOnEventOff)
				GameEvents.CityCaptureComplete.Add(LuxuriesFromCaptured)
				
				
			-- spawning reindeers
			elseif sMinorCivType == "MINOR_CIV_KARASJOHKA" then
				tLostCities["eLostKarasjohka"] = eCS	
				GameEvents.BuildFinished.Add(BuiltCampOnDeerWithTundraAround)
				
				
			-- war declared
			elseif sMinorCivType == "MINOR_CIV_AYUTTHAYA" then
				tLostCities["eLostAyutthaya"] = eCS	
				GameEvents.DeclareWar.Add(WarDeclaredToAyutthaya)
				GameEvents.CityConstructed.Add(AyutthayaDevelops)

				
			-- policy cost from religious cities
			elseif sMinorCivType == "MINOR_CIV_SARNATH" then
				tLostCities["eLostSarnath"] = eCS	
				GameEvents.EventChoiceActivated.Add(SarnathLowersPolicyCostOnEventOn)
				GameEvents.EventChoiceEnded.Add(SarnathLowersPolicyCostOnEventOff)
				GameEvents.ReligionFounded.Add(SarnathLowersPolicyCostOnFounding)
				GameEvents.PlayerDoTurn.Add(SarnathLowersPolicyCost)

				
			-- fix for Clermont
			elseif sMinorCivType == "MINOR_CIV_CLERMONT" then
				tLostCities["eLostClermont"] = eCS	
				GameEvents.EventChoiceActivated.Add(GiveClermontPromoOnEventOn)
				GameEvents.EventChoiceEnded.Add(TakeClermontPromoOnEventOff)
				GameEvents.UnitCreated.Add(GiveClermontPromoOnTrain)

				
			-- growth and military
			elseif sMinorCivType == "MINOR_CIV_MENDYARRUP" then
				tLostCities["eLostMendyarrup"] = eCS	
				GameEvents.TileImprovementChanged.Add(FixForMendyarrup)
				GameEvents.TileImprovementChanged.Add(PillageForMendyarrup)
				GameEvents.SetPopulation.Add(GrowthForMendyarrup)



			-- free Missionaries
			elseif sMinorCivType == "MINOR_CIV_SADDARVAZEH" then
				tLostCities["eLostSaddarvazeh"] = eCS
				GameEvents.TileImprovementChanged.Add(ZoroasterHolySite)
				GameEvents.ReligionFounded.Add(ZoroasterFound)
				GameEvents.ReligionEnhanced.Add(ZoroasterEnhanced)
				GameEvents.ReligionReformed.Add(ZoroasterReformed)



			-- free Missionaries
			elseif sMinorCivType == "MINOR_CIV_IRUNEA" then
				tLostCities["eLostIrunea"] = eCS
				GameEvents.TeamSetEra.Add(IruneaConstructsOnEraChange)
				GameEvents.PlayerCityFounded.Add(IruneaConstructsOnCityFounding)
			end
		end
	end
end
SettingUpSpecificEvents()