--------------------------------------------------------------------------------------------------
--Building Classes
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,		DefaultBuilding,				MaxPlayerInstances,	Description)
SELECT 'BUILDINGCLASS_FA_AIR_ACADEMY',	'BUILDING_FA_AIR_ACADEMY',		1,					'TXT_KEY_BUILDING_FA_AIR_ACADEMY';

--------------------------------------------------------------------------------------------------
--Civilization Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,					BuildingType)
SELECT 'CIVILIZATION_MINOR',											'BUILDINGCLASS_FA_AIR_ACADEMY',		NULL;

--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,			BuildingClass,						PrereqTech,			Cost,	NumCityCostMod,	TrainedFreePromotion,	NukeImmune,	NeverCapture,	HurryCostModifier,	IconAtlas,		PortraitIndex,	Description,						Help,									Strategy,									Civilopedia,								ArtDefineTag,					MinAreaSize) 
SELECT 'BUILDING_FA_AIR_ACADEMY',		'BUILDINGCLASS_FA_AIR_ACADEMY',		'TECH_FLIGHT',		125,	20,				'PROMOTION_EVASION',	1,			1,				-1,					'FA_NW_ATLAS',	8,				'TXT_KEY_BUILDING_FA_AIR_ACADEMY',	'TXT_KEY_BUILDING_FA_AIR_ACADEMY_HELP',	'TXT_KEY_BUILDING_FA_AIR_ACADEMY_STRATEGY',	'TXT_KEY_BUILDING_FA_AIR_ACADEMY_PEDIA',	'ART_DEF_BUILDING_IRONWORKS',	-1;

--------------------------------------------------------------------------------------------------
--Building Class Reqs
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity (BuildingType,		BuildingClassType)
SELECT 'BUILDING_FA_AIR_ACADEMY',							'BUILDINGCLASS_MILITARY_ACADEMY';

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_AIR_ACADEMY',					'YIELD_CULTURE',		1;

--------------------------------------------------------------------------------------------------
--Building, Unit Production Modifier
--------------------------------------------------------------------------------------------------
INSERT INTO Building_DomainProductionModifiers (BuildingType,		DomainType,				Modifier) 
SELECT 'BUILDING_FA_AIR_ACADEMY',									'DOMAIN_AIR',			25;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,						Flavor)
SELECT 'BUILDING_FA_AIR_ACADEMY',				'FLAVOR_PRODUCTION',			10 UNION ALL
SELECT 'BUILDING_FA_AIR_ACADEMY',				'FLAVOR_MILITARY_TRAINING',		30 UNION ALL
SELECT 'BUILDING_FA_AIR_ACADEMY',				'FLAVOR_AIR',					50 UNION ALL
SELECT 'BUILDING_FA_AIR_ACADEMY',				'FLAVOR_WONDER',				20;

