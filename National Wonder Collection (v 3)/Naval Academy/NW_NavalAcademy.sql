--------------------------------------------------------------------------------------------------
--Building Classes
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,		DefaultBuilding,				MaxPlayerInstances,	Description)
SELECT 'BUILDINGCLASS_FA_SEA_ACADEMY',	'BUILDING_FA_SEA_ACADEMY',		1,					'TXT_KEY_BUILDING_FA_SEA_ACADEMY';

--------------------------------------------------------------------------------------------------
--Civilization Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,					BuildingType)
SELECT 'CIVILIZATION_MINOR',											'BUILDINGCLASS_FA_SEA_ACADEMY',		NULL;

--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,			BuildingClass,						PrereqTech,			Cost,	NumCityCostMod,	TrainedFreePromotion,		NukeImmune,	NeverCapture,	HurryCostModifier,	IconAtlas,		PortraitIndex,	Description,						Help,									Strategy,									Civilopedia,								ArtDefineTag,					MinAreaSize) 
SELECT 'BUILDING_FA_SEA_ACADEMY',		'BUILDINGCLASS_FA_SEA_ACADEMY',		'TECH_NAVIGATION',	360,	20,				'PROMOTION_FA_SEA_ACADEMY',	1,			1,				-1,					'FA_NW_ATLAS',	0,				'TXT_KEY_BUILDING_FA_SEA_ACADEMY',	'TXT_KEY_BUILDING_FA_SEA_ACADEMY_HELP',	'TXT_KEY_BUILDING_FA_SEA_ACADEMY_STRATEGY',	'TXT_KEY_BUILDING_FA_SEA_ACADEMY_PEDIA',	'ART_DEF_BUILDING_IRONWORKS',	-1;

--------------------------------------------------------------------------------------------------
--Building Class Reqs
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity (BuildingType,		BuildingClassType)
SELECT 'BUILDING_FA_SEA_ACADEMY',							'BUILDINGCLASS_SEAPORT';

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_SEA_ACADEMY',					'YIELD_CULTURE',		1;

--------------------------------------------------------------------------------------------------
--Building, Unit Production Modifier
--------------------------------------------------------------------------------------------------
INSERT INTO Building_DomainProductionModifiers (BuildingType,		DomainType,				Modifier) 
SELECT 'BUILDING_FA_SEA_ACADEMY',									'DOMAIN_SEA',			15;

--------------------------------------------------------------------------------------------------
--Building, Unit Domain XP
--------------------------------------------------------------------------------------------------
INSERT INTO Building_DomainFreeExperiences (BuildingType,			DomainType,				Experience) 
SELECT 'BUILDING_FA_SEA_ACADEMY',									'DOMAIN_SEA',			15;

--------------------------------------------------------------------------------------------------
--Building Free Units
--------------------------------------------------------------------------------------------------
INSERT INTO Building_FreeUnits (BuildingType,	UnitType,					NumUnits)
SELECT 'BUILDING_FA_SEA_ACADEMY',				'UNIT_GREAT_ADMIRAL',		1;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,						Flavor)
SELECT 'BUILDING_FA_SEA_ACADEMY',				'FLAVOR_PRODUCTION',			10 UNION ALL
SELECT 'BUILDING_FA_SEA_ACADEMY',				'FLAVOR_MILITARY_TRAINING',		30 UNION ALL
SELECT 'BUILDING_FA_SEA_ACADEMY',				'FLAVOR_NAVAL',					40 UNION ALL
SELECT 'BUILDING_FA_SEA_ACADEMY',				'FLAVOR_NAVAL_RECON',			20 UNION ALL
SELECT 'BUILDING_FA_SEA_ACADEMY',				'FLAVOR_WONDER',				20;

--------------------------------------------------------------------------------------------------
--Promotions
--------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions (Type,	CannotBeChosen,	Description,						Help,										PediaEntry,							IconAtlas,			PortraitIndex,	Sound,				PediaType)
SELECT 'PROMOTION_FA_SEA_ACADEMY',	1,				'TXT_KEY_PROMOTION_FA_SEA_ACADEMY',	'TXT_KEY_PROMOTION_FA_SEA_ACADEMY_HELP',	'TXT_KEY_PROMOTION_FA_SEA_ACADEMY',	'ABILITY_ATLAS',	58,				'AS2D_IF_LEVELUP',	'PEDIA_SHARED';

--------------------------------------------------------------------------------------------------
--Promotions, Unit Combat Buffs
--------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_Domains (PromotionType,	DomainType,			Modifier)
SELECT 'PROMOTION_FA_SEA_ACADEMY',					'DOMAIN_SEA',		10;

--------------------------------------------------------------------------------------------------
--Promotions, Terrain
--------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_Terrains (PromotionType,	TerrainType,		DoubleMove)
SELECT 'PROMOTION_FA_SEA_ACADEMY',					'TERRAIN_OCEAN',	1;

--------------------------------------------------------------------------------------------------
--Allowed Promotions, UnitCombats
--------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_UnitCombats (PromotionType,	UnitCombatType)
SELECT 'PROMOTION_FA_SEA_ACADEMY',						'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 'PROMOTION_FA_SEA_ACADEMY',						'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 'PROMOTION_FA_SEA_ACADEMY',						'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 'PROMOTION_FA_SEA_ACADEMY',						'UNITCOMBAT_CARRIER' UNION ALL
SELECT 'PROMOTION_FA_SEA_ACADEMY',						'UNITCOMBAT_NAVAL';