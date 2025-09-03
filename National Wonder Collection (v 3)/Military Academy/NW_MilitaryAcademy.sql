--------------------------------------------------------------------------------------------------
--Building Classes
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,		DefaultBuilding,				MaxPlayerInstances,	Description)
SELECT 'BUILDINGCLASS_FA_WAR_ACADEMY',	'BUILDING_FA_WAR_ACADEMY',		1,					'TXT_KEY_BUILDING_FA_WAR_ACADEMY';

--------------------------------------------------------------------------------------------------
--Civilization Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,					BuildingType)
SELECT 'CIVILIZATION_MINOR',											'BUILDINGCLASS_FA_WAR_ACADEMY',		NULL;

--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,			BuildingClass,						PrereqTech,			Cost,	NumCityCostMod,	GreatGeneralRateModifier,	FreeBuildingThisCity,		NukeImmune,	NeverCapture,	HurryCostModifier,	IconAtlas,		PortraitIndex,	Description,						Help,									Strategy,									Civilopedia,								ArtDefineTag,					MinAreaSize) 
SELECT 'BUILDING_FA_WAR_ACADEMY',		'BUILDINGCLASS_FA_WAR_ACADEMY',		'TECH_GUNPOWDER',	360,	20,				20,							'BUILDINGCLASS_ARSENAL',	1,			1,				-1,					'FA_NW_ATLAS',	1,				'TXT_KEY_BUILDING_FA_WAR_ACADEMY',	'TXT_KEY_BUILDING_FA_WAR_ACADEMY_HELP',	'TXT_KEY_BUILDING_FA_WAR_ACADEMY_STRATEGY',	'TXT_KEY_BUILDING_FA_WAR_ACADEMY_PEDIA',	'ART_DEF_BUILDING_IRONWORKS',	-1;

--------------------------------------------------------------------------------------------------
--Building Class Reqs
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity (BuildingType,		BuildingClassType)
SELECT 'BUILDING_FA_WAR_ACADEMY',							'BUILDINGCLASS_ARMORY';

INSERT INTO Building_PrereqBuildingClasses (BuildingType,	BuildingClassType,				NumBuildingNeeded) 
SELECT 'BUILDING_FA_WAR_ACADEMY',							'BUILDINGCLASS_ARMORY',			-1;

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_WAR_ACADEMY',					'YIELD_FOOD',			-2 UNION ALL
SELECT 'BUILDING_FA_WAR_ACADEMY',					'YIELD_CULTURE',		1;

--------------------------------------------------------------------------------------------------
--Building, Unit Production Modifier
--------------------------------------------------------------------------------------------------
INSERT INTO Building_DomainProductionModifiers (BuildingType,		DomainType,				Modifier) 
SELECT 'BUILDING_FA_WAR_ACADEMY',									'DOMAIN_LAND',			15;

--------------------------------------------------------------------------------------------------
--Building, Unit Domain XP
--------------------------------------------------------------------------------------------------
INSERT INTO Building_DomainFreeExperiences (BuildingType,			DomainType,				Experience) 
SELECT 'BUILDING_FA_WAR_ACADEMY',									'DOMAIN_LAND',			15;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,						Flavor)
SELECT 'BUILDING_FA_WAR_ACADEMY',				'FLAVOR_PRODUCTION',			10 UNION ALL
SELECT 'BUILDING_FA_WAR_ACADEMY',				'FLAVOR_MILITARY_TRAINING',		40 UNION ALL
SELECT 'BUILDING_FA_WAR_ACADEMY',				'FLAVOR_CITY_DEFENSE',			10 UNION ALL
SELECT 'BUILDING_FA_WAR_ACADEMY',				'FLAVOR_OFFENSE',				15 UNION ALL
SELECT 'BUILDING_FA_WAR_ACADEMY',				'FLAVOR_DEFENSE',				15 UNION ALL
SELECT 'BUILDING_FA_WAR_ACADEMY',				'FLAVOR_WONDER',				20;