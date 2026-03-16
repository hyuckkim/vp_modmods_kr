--------------------------------------------------------------------------------------------------
--Building Classes
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,			DefaultBuilding,				MaxPlayerInstances,	Description)
SELECT 'BUILDINGCLASS_FA_CENTRAL_STATION',	'BUILDING_FA_CENTRAL_STATION',	1,					'TXT_KEY_BUILDING_FA_CENTRAL_STATION';

--------------------------------------------------------------------------------------------------
--Civilization Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,					BuildingType)
SELECT 'CIVILIZATION_MINOR',											'BUILDINGCLASS_FA_CENTRAL_STATION',	NULL;

--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,				BuildingClass,							PrereqTech,			Cost,	NumCityCostMod,	NukeImmune,	NeverCapture,	HurryCostModifier,	IconAtlas,		PortraitIndex,	Description,							Help,										Strategy,										Civilopedia,									ArtDefineTag,					MinAreaSize) 
SELECT 'BUILDING_FA_CENTRAL_STATION',		'BUILDINGCLASS_FA_CENTRAL_STATION',		'TECH_RAILROAD',	360,	10,				1,			1,				-1,					'FA_NW_ATLAS',	4,				'TXT_KEY_BUILDING_FA_CENTRAL_STATION',	'TXT_KEY_BUILDING_FA_CENTRAL_STATION_HELP',	'TXT_KEY_BUILDING_FA_CENTRAL_STATION_STRATEGY',	'TXT_KEY_BUILDING_FA_CENTRAL_STATION_PEDIA',	'ART_DEF_BUILDING_IRONWORKS',	-1;

--------------------------------------------------------------------------------------------------
--Building Class Reqs
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity (BuildingType,		BuildingClassType)
SELECT 'BUILDING_FA_CENTRAL_STATION',						'BUILDINGCLASS_FACTORY';

INSERT INTO Building_PrereqBuildingClasses (BuildingType,	BuildingClassType,				NumBuildingNeeded) 
SELECT 'BUILDING_FA_CENTRAL_STATION',						'BUILDINGCLASS_FACTORY',		1;

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_CENTRAL_STATION',				'YIELD_CULTURE',		1;

--------------------------------------------------------------------------------------------------
--Building, City Yield Modifiers
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_CENTRAL_STATION',				'YIELD_GOLD',			10;

--------------------------------------------------------------------------------------------------
--Building Free Units
--------------------------------------------------------------------------------------------------
INSERT INTO Building_FreeUnits (BuildingType,	UnitType,					NumUnits)
SELECT 'BUILDING_FA_CENTRAL_STATION',			'UNIT_FA_CENTRAL_STATION',	1;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,						Flavor)
SELECT 'BUILDING_FA_CENTRAL_STATION',			'FLAVOR_PRODUCTION',			20 UNION ALL
SELECT 'BUILDING_FA_CENTRAL_STATION',			'FLAVOR_GOLD',					10 UNION ALL
SELECT 'BUILDING_FA_CENTRAL_STATION',			'FLAVOR_INFRASTRUCTURE',		60 UNION ALL
SELECT 'BUILDING_FA_CENTRAL_STATION',			'FLAVOR_EXPANSION',				20 UNION ALL
SELECT 'BUILDING_FA_CENTRAL_STATION',			'FLAVOR_GROWTH',				10 UNION ALL
SELECT 'BUILDING_FA_CENTRAL_STATION',			'FLAVOR_WONDER',				20;

--------------------------------------------------------------------------------------------------
--Trigger Unit
--------------------------------------------------------------------------------------------------
INSERT INTO UnitClasses (Type, DefaultUnit,	Description) 
SELECT 'UNITCLASS_FA_CENTRAL_STATION', 'UNIT_FA_CENTRAL_STATION', Description								
FROM Buildings WHERE Type = 'BUILDING_FA_CENTRAL_STATION';

INSERT INTO Units (Class, Type, Domain,	CombatLimit, Cost, ShowInPedia,	Description) 
SELECT 'UNITCLASS_FA_CENTRAL_STATION', 'UNIT_FA_CENTRAL_STATION', 'DOMAIN_LAND', 0, -1, 0, Description								
FROM Buildings WHERE Type = 'BUILDING_FA_CENTRAL_STATION';

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits) 
SELECT Type, 'UNIT_FA_CENTRAL_STATION', 1								
FROM Buildings WHERE Type = 'BUILDING_FA_CENTRAL_STATION';

--------------------------------------------------------------------------------------------------
--Building, Class Yield Modifier (Additive for each instance of BuildingType across entire empire.)
--------------------------------------------------------------------------------------------------
INSERT INTO Building_BuildingClassYieldChanges (BuildingType,	BuildingClassType,			YieldType,				YieldChange) 
SELECT 'BUILDING_FA_CENTRAL_STATION',							'BUILDINGCLASS_FACTORY',	'YIELD_GOLD',			1;

DELETE FROM Building_YieldModifiers WHERE BuildingType = "BUILDING_FA_CENTRAL_STATION";

UPDATE Buildings SET Help = 'TXT_KEY_BUILDING_FA_CENTRAL_STATION2_HELP' WHERE Type = "BUILDING_FA_CENTRAL_STATION";


