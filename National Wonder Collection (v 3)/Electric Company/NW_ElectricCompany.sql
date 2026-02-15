--------------------------------------------------------------------------------------------------
--Building Classes
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,			DefaultBuilding,				MaxPlayerInstances,	Description)
SELECT 'BUILDINGCLASS_FA_ELECTRIC_CO',		'BUILDING_FA_ELECTRIC_CO',		1,					'TXT_KEY_BUILDING_FA_ELECTRIC_CO' UNION ALL
SELECT 'BUILDINGCLASS_FA_ELECTRIC_POWER',	'BUILDING_FA_ELECTRIC_POWER',	-1,					'TXT_KEY_BUILDING_FA_ELECTRIC_POWER';

--------------------------------------------------------------------------------------------------
--Civilization Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,					BuildingType)
SELECT 'CIVILIZATION_MINOR',											'BUILDINGCLASS_FA_ELECTRIC_CO',		NULL;

--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
ALTER TABLE Buildings ADD COLUMN FreeBuildingThisContinent text DEFAULT null;

INSERT INTO Buildings (Type,				BuildingClass,							PrereqTech,			Cost,	NumCityCostMod,	FreeBuildingThisContinent,		River,	GoldMaintenance,	NukeImmune,	NeverCapture,	HurryCostModifier,	IconAtlas,		PortraitIndex,	Description,							Help,										Strategy,										Civilopedia,									ArtDefineTag,					MinAreaSize) 
SELECT 'BUILDING_FA_ELECTRIC_CO',			'BUILDINGCLASS_FA_ELECTRIC_CO',			'TECH_ELECTRONICS',	500,	20,				'BUILDING_FA_ELECTRIC_POWER',	1,		5,					1,			1,				-1,					'FA_NW_ATLAS',	3,				'TXT_KEY_BUILDING_FA_ELECTRIC_CO',		'TXT_KEY_BUILDING_FA_ELECTRIC_CO_HELP',		'TXT_KEY_BUILDING_FA_ELECTRIC_CO_STRATEGY',		'TXT_KEY_BUILDING_FA_ELECTRIC_CO_PEDIA',		'ART_DEF_BUILDING_IRONWORKS',	-1 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_POWER',		'BUILDINGCLASS_FA_ELECTRIC_POWER',		NULL,				-1,		0,				NULL,							0,		0,					1,			1,				-1,					'FA_NW_ATLAS',	6,				'TXT_KEY_BUILDING_FA_ELECTRIC_POWER',	'TXT_KEY_BUILDING_FA_ELECTRIC_POWER_HELP',	'TXT_KEY_BUILDING_FA_ELECTRIC_POWER_STRATEGY',	'TXT_KEY_BUILDING_FA_ELECTRIC_POWER_PEDIA',		'ART_DEF_BUILDING_IRONWORKS',	-1;

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_ELECTRIC_CO',					'YIELD_CULTURE',		1;

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_ELECTRIC_POWER',				'YIELD_GOLD',			1 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_POWER',				'YIELD_SCIENCE',		2 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_POWER',				'YIELD_PRODUCTION',		2;

--------------------------------------------------------------------------------------------------
--Building Free Units
--------------------------------------------------------------------------------------------------
INSERT INTO Building_FreeUnits (BuildingType,	UnitType,					NumUnits)
SELECT 'BUILDING_FA_ELECTRIC_CO',				'UNIT_FA_ELECTRIC_CO',		1;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,						Flavor)
SELECT 'BUILDING_FA_ELECTRIC_CO',				'FLAVOR_GOLD',					20 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_CO',				'FLAVOR_PRODUCTION',			30 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_CO',				'FLAVOR_SCIENCE',				30 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_CO',				'FLAVOR_HAPPINESS',				30 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_CO',				'FLAVOR_GROWTH',				20 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_CO',				'FLAVOR_WONDER',				20;

--------------------------------------------------------------------------------------------------
--Trigger Unit
--------------------------------------------------------------------------------------------------
INSERT INTO UnitClasses (Type, DefaultUnit,	Description) 
SELECT 'UNITCLASS_FA_ELECTRIC_CO', 'UNIT_FA_ELECTRIC_CO', Description								
FROM Buildings WHERE Type = 'BUILDING_FA_ELECTRIC_CO';

INSERT INTO Units (Class, Type, Domain,	CombatLimit, Cost, ShowInPedia,	Description) 
SELECT 'UNITCLASS_FA_ELECTRIC_CO', 'UNIT_FA_ELECTRIC_CO', 'DOMAIN_LAND', 0, -1, 0, Description								
FROM Buildings WHERE Type = 'BUILDING_FA_ELECTRIC_CO';

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits) 
SELECT Type, 'UNIT_FA_ELECTRIC_CO', 1								
FROM Buildings WHERE Type = 'BUILDING_FA_ELECTRIC_CO';


--------------------------------------------------------------------------------------------------
--Building, Class Yield Modifier (Additive for each instance of BuildingType across entire empire.)
--------------------------------------------------------------------------------------------------
INSERT INTO Building_BuildingClassHappiness (BuildingType,		BuildingClassType,					Happiness) 
SELECT 'BUILDING_FA_ELECTRIC_CO',								'BUILDINGCLASS_FA_ELECTRIC_POWER',	1;

INSERT INTO Building_BuildingClassYieldChanges (BuildingType,	BuildingClassType,					YieldType,				YieldChange)
SELECT 'BUILDING_FA_ELECTRIC_CO',								'BUILDINGCLASS_FA_ELECTRIC_POWER',	'YIELD_GOLD',			1 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_CO',								'BUILDINGCLASS_FA_ELECTRIC_POWER',	'YIELD_SCIENCE',		2 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_CO',								'BUILDINGCLASS_FA_ELECTRIC_POWER',	'YIELD_PRODUCTION',		2;

DELETE FROM Building_YieldChanges WHERE BuildingType = "BUILDING_FA_ELECTRIC_POWER";

UPDATE Buildings SET Help = 'TXT_KEY_BUILDING_FA_ELECTRIC_CO2_HELP' WHERE Type = "BUILDING_FA_ELECTRIC_CO";
