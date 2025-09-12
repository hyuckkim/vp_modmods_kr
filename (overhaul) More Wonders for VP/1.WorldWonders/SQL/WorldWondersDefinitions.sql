----------------------------------------------------
-- Main file for all Wonders
-- Dec 9, 2017: Created, Infixo
-- Jan 6, 2020: Improved, adan_eslavo
--============================================--
-- HELP
--============================================--
-- Water - city must be built NEXT TO a COAST tile or LAKE tile (MinAreaSize=10 is Sea, MinAreaSize=1 is Lake)
-- River - city must be built NEXT TO a RIVER
-- FreshWater - city must be built next to a RIVER or adjacent to a LAKE or OASIS tile
-- Mountain - city must be built NEXT TO a MOUNTAIN tile
-- NearbyMountainRequired - city must be built WITHIN 2 TILES OF a MOUNTAIN tile, Mountain must be within cultural borders
-- Hill - city must be built ON a HILL tile
-- Flat - city MUST NOT be built ON a HILL tile
-- HolyCity
-- (VP) IsNoWater - restricts Fresh Water (River, Lake)
-- (VP) IsNoRiver
-- (VP) AnyWater - requires any type of water (Lake, Coast, River)
-- (VP) CapitalOnly
-- (VP) ResourceType - allows for Building to be unlocked by a specific resource being owned (can be strategic or luxury)
-- (VP) RequiresRail - rail connection
--============================================--
-- NEOLITHIC ERA
--============================================--
-- ALTAMIRA CAVE (NEW)
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_ALTAMIRA';
	UPDATE Buildings SET Cost = 115, PrereqTech = 'TECH_AGRICULTURE', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_ANCIENT' WHERE Type = 'BUILDING_ALTAMIRA';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyMountainRequired = 1 WHERE Type = 'BUILDING_ALTAMIRA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,			ResourceType) 
	SELECT		'BUILDING_ALTAMIRA',	'RESOURCE_BISON'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_ALTAMIRA',	'RESOURCE_DEER'		WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_ALTAMIRA',	'RESOURCE_HORSE'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------	
	UPDATE Buildings SET Defense = 500, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 1, EnhancedYieldTech = 'TECH_ARCHAEOLOGY' WHERE Type = 'BUILDING_ALTAMIRA';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_ALTAMIRA',	'YIELD_CULTURE',	1);

	INSERT INTO Building_ResourceYieldChanges 
				(BuildingType,			ResourceType,		YieldType,			Yield) 
	VALUES		('BUILDING_ALTAMIRA',	'RESOURCE_BISON',	'YIELD_FOOD',		1),
				('BUILDING_ALTAMIRA',	'RESOURCE_DEER',	'YIELD_FOOD',		1),
				('BUILDING_ALTAMIRA',	'RESOURCE_HORSE',	'YIELD_FOOD',		1),
				('BUILDING_ALTAMIRA',	'RESOURCE_BISON',	'YIELD_CULTURE',	1),
				('BUILDING_ALTAMIRA',	'RESOURCE_DEER',	'YIELD_CULTURE',	1),
				('BUILDING_ALTAMIRA',	'RESOURCE_HORSE',	'YIELD_CULTURE',	1);
				
	INSERT INTO Building_TechEnhancedYieldChanges
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_ALTAMIRA',	'YIELD_CULTURE',	3);
	---------------------------------------------------------	
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor) 
	VALUES		('BUILDING_ALTAMIRA',	'FLAVOR_CITY_DEFENSE',	10),
				('BUILDING_ALTAMIRA',	'FLAVOR_CULTURE',		50),
				('BUILDING_ALTAMIRA',	'FLAVOR_GROWTH',		30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- GGANTIJA (NEW)
	UPDATE Buildings SET Cost = 115, PrereqTech = 'TECH_AGRICULTURE',	NumPoliciesNeeded = 0, MaxStartEra = 'ERA_ANCIENT' WHERE Type = 'BUILDING_GGANTIJA';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_GGANTIJA';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_GRASS' WHERE Type = 'BUILDING_GGANTIJA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1 OR Value=2);
	-- + Farm(2) lua (HARD)
	---------------------------------------------------------	
	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,		Yield)
	VALUES		('BUILDING_GGANTIJA',	'YIELD_FAITH',	2);

	INSERT INTO Building_ImprovementYieldChangesGlobal 
				(BuildingType,			ImprovementType,	YieldType,		Yield) 
	VALUES		('BUILDING_GGANTIJA',	'IMPROVEMENT_FARM',	'YIELD_FOOD',	1);

	INSERT INTO Building_InstantYield
				(BuildingType,			YieldType,		Yield) 
	VALUES		('BUILDING_GGANTIJA',	'YIELD_FOOD',	50);
	
	INSERT INTO Building_YieldFromYieldPercent
				(BuildingType,			YieldIn,		YieldOut,		Value) 
	VALUES		('BUILDING_GGANTIJA',	'YIELD_FAITH',	'YIELD_FOOD',	10);
	---------------------------------------------------------	
	INSERT INTO Building_Flavors
				(BuildingType,			FlavorType,			Flavor)
	VALUES		('BUILDING_GGANTIJA',	'FLAVOR_RELIGION',	10),
				('BUILDING_GGANTIJA',	'FLAVOR_GROWTH',	60);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- GOEBEKLI TEPE (NEW)
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_GOEBEKLI_TEPE';
	UPDATE Buildings SET Cost = 115, PrereqTech = 'TECH_AGRICULTURE', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_ANCIENT' WHERE Type = 'BUILDING_GOEBEKLI_TEPE';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyMountainRequired = 1, IsNoWater = 1/*, IsNoCoast = 1*/ WHERE Type = 'BUILDING_GOEBEKLI_TEPE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_DESERT' WHERE Type = 'BUILDING_GOEBEKLI_TEPE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------	
	INSERT INTO Building_YieldChanges
				(BuildingType,				YieldType,			Yield) 
	VALUES		('BUILDING_GOEBEKLI_TEPE',	'YIELD_CULTURE',	1),
				('BUILDING_GOEBEKLI_TEPE',	'YIELD_SCIENCE',	1),
				('BUILDING_GOEBEKLI_TEPE',	'YIELD_FAITH',		1);

	INSERT INTO Building_ResourceYieldChangesGlobal
				(BuildingType,				ResourceType,		YieldType,			Yield) 
	VALUES		('BUILDING_GOEBEKLI_TEPE',	'RESOURCE_STONE',	'YIELD_SCIENCE',	1);

	INSERT INTO Building_YieldPerXTerrainTimes100
				(BuildingType,				TerrainType,			YieldType,			Yield) 
	VALUES		('BUILDING_GOEBEKLI_TEPE',	'TERRAIN_MOUNTAIN',		'YIELD_FAITH',		100),
				('BUILDING_GOEBEKLI_TEPE',	'TERRAIN_MOUNTAIN',		'YIELD_SCIENCE',	100);
	---------------------------------------------------------	
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,			Flavor) 
	VALUES		('BUILDING_GOEBEKLI_TEPE',	'FLAVOR_CULTURE',	10),
				('BUILDING_GOEBEKLI_TEPE',	'FLAVOR_SCIENCE',	40),
				('BUILDING_GOEBEKLI_TEPE',	'FLAVOR_RELIGION',	40);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- KUK (NEW)
	UPDATE Buildings SET WonderSplashAnchor = 'C,T' WHERE Type = 'BUILDING_KUK';
	UPDATE Buildings SET Cost = 115, PrereqTech = 'TECH_AGRICULTURE', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_ANCIENT' WHERE Type = 'BUILDING_KUK';
	---------------------------------------------------------
	UPDATE Buildings SET ProhibitedCityTerrain = 'TERRAIN_SNOW' WHERE Type = 'BUILDING_KUK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_LocalFeatureAnds 
				(BuildingType,		FeatureType) 
	SELECT		'BUILDING_KUK',		'FEATURE_MARSH'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_KUK',		'FEATURE_JUNGLE'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------	
	UPDATE Buildings SET FoodKept = 10, EnhancedYieldTech = 'TECH_STEAM_POWER' WHERE Type = 'BUILDING_KUK';
	
	INSERT INTO Building_YieldChanges
				(BuildingType,		YieldType,			Yield) 
	VALUES		('BUILDING_KUK',	'YIELD_FOOD',		1),
				('BUILDING_KUK',	'YIELD_SCIENCE',	1);

	INSERT INTO Building_TechEnhancedYieldChanges
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_KUK',		'YIELD_PRODUCTION',	3),
				('BUILDING_KUK_DUMMY',	'YIELD_PRODUCTION',	2);
	
	INSERT INTO Building_FeatureYieldChanges 
				(BuildingType,			FeatureType,			YieldType,				Yield) 
	VALUES		('BUILDING_KUK_DUMMY',	'FEATURE_MARSH',		'YIELD_PRODUCTION',		1),
				('BUILDING_KUK_DUMMY',	'FEATURE_MARSH',		'YIELD_SCIENCE',		1);
	---------------------------------------------------------	
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,				Flavor) 
	VALUES		('BUILDING_KUK',	'FLAVOR_GROWTH',		40),
				('BUILDING_KUK',	'FLAVOR_SCIENCE',		30),
				('BUILDING_KUK',	'FLAVOR_PRODUCTION',	40);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MAJORVILLE MEDICINE WHEEL (NEW)
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_MAJORVILLE';
	UPDATE Buildings SET Cost = 115, PrereqTech = 'TECH_AGRICULTURE', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_ANCIENT' WHERE Type = 'BUILDING_MAJORVILLE';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_TUNDRA', Hill = 1 WHERE Type = 'BUILDING_MAJORVILLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_TUNDRA' WHERE Type = 'BUILDING_MAJORVILLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------	
	INSERT INTO Building_YieldChanges
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_MAJORVILLE',	'YIELD_FAITH',		1),
				('BUILDING_MAJORVILLE',	'YIELD_SCIENCE',	1);
	
	INSERT INTO Building_TerrainYieldChanges 
				(BuildingType,			TerrainType,		YieldType,		Yield) 
	VALUES		('BUILDING_MAJORVILLE',	'TERRAIN_TUNDRA',	'YIELD_FAITH',	1);

	INSERT INTO Building_ImprovementYieldChangesGlobal 
				(BuildingType,			ImprovementType,	YieldType,		Yield) 
	VALUES		('BUILDING_MAJORVILLE',	'IMPROVEMENT_CAMP',	'YIELD_FOOD',	1);

	INSERT INTO Building_ResourceYieldChangesGlobal 
				(BuildingType,			ResourceType,		YieldType,			Yield) 
	VALUES		('BUILDING_MAJORVILLE', 'RESOURCE_BISON',	'YIELD_CULTURE',	1);
	---------------------------------------------------------	
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,				Flavor) 
	VALUES		('BUILDING_MAJORVILLE',	'FLAVOR_SCIENCE',		10),
				('BUILDING_MAJORVILLE',	'FLAVOR_RELIGION',		30),
				('BUILDING_MAJORVILLE',	'FLAVOR_CULTURE',		30),
				('BUILDING_MAJORVILLE',	'FLAVOR_GROWTH',		30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MOHENJO-DARO (NEW)
	UPDATE Buildings SET Cost = 115, PrereqTech = 'TECH_AGRICULTURE', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_ANCIENT' WHERE Type = 'BUILDING_MOHENJO_DARO';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_MOHENJO_DARO';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */River = 1, NearbyTerrainRequired = 'TERRAIN_DESERT' WHERE Type = 'BUILDING_MOHENJO_DARO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_MOHENJO_DARO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------	
	UPDATE Buildings SET /*FreeBuildingThisCity = 'BUILDINGCLASS_WELL'*/ MutuallyExclusiveGroup = 3 WHERE Type = 'BUILDING_MOHENJO_DARO';
	
	INSERT INTO Building_YieldChanges
				(BuildingType,				YieldType,			Yield) 
	VALUES		('BUILDING_MOHENJO_DARO',	'YIELD_CULTURE',	2),
				('BUILDING_MOHENJO_DARO',	'YIELD_FAITH',		1),
				('BUILDING_MOHENJO_DARO',	'YIELD_FOOD',		1);

	INSERT INTO Building_YieldChangesPerPop 
				(BuildingType,				YieldType,			Yield) 
	VALUES		('BUILDING_MOHENJO_DARO',	'YIELD_PRODUCTION',	25);

	INSERT INTO Building_RiverPlotYieldChanges
				(BuildingType,				YieldType,		Yield) 
	VALUES		('BUILDING_MOHENJO_DARO',	'YIELD_FOOD',	1);
	---------------------------------------------------------	
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,				Flavor) 
	VALUES		('BUILDING_MOHENJO_DARO',	'FLAVOR_CULTURE',		20),
				('BUILDING_MOHENJO_DARO',	'FLAVOR_RELIGION',		30),
				('BUILDING_MOHENJO_DARO',	'FLAVOR_GROWTH',		50);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- SKARA BRAE (NEW)
	UPDATE Buildings SET Cost = 115, PrereqTech = 'TECH_AGRICULTURE', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_ANCIENT' WHERE Type = 'BUILDING_SKARA_BRAE';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_SKARA_BRAE';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1, Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_SKARA_BRAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType, ResourceType) 
	SELECT		'BUILDING_SKARA_BRAE', 'RESOURCE_FISH'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_SKARA_BRAE', 'RESOURCE_COW'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_SKARA_BRAE', 'RESOURCE_WHEAT' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_SKARA_BRAE', 'RESOURCE_MAIZE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_SKARA_BRAE', 'RESOURCE_RICE'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_SKARA_BRAE', 'RESOURCE_SHEEP' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------	
	INSERT INTO Building_YieldChanges
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_SKARA_BRAE', 'YIELD_PRODUCTION',	1),
				('BUILDING_SKARA_BRAE', 'YIELD_FOOD',		1);
	
	INSERT INTO Building_ResourceYieldChangesGlobal 
				(BuildingType,			ResourceType,		YieldType,		Yield) 
	VALUES		('BUILDING_SKARA_BRAE', 'RESOURCE_FISH',	'YIELD_FOOD',	1),
				('BUILDING_SKARA_BRAE', 'RESOURCE_COW',		'YIELD_FOOD',	1),
				('BUILDING_SKARA_BRAE', 'RESOURCE_WHEAT',	'YIELD_FOOD',	1),
				('BUILDING_SKARA_BRAE', 'RESOURCE_MAIZE',	'YIELD_FOOD',	1),
				('BUILDING_SKARA_BRAE', 'RESOURCE_RICE',	'YIELD_FOOD',	1),
				('BUILDING_SKARA_BRAE', 'RESOURCE_SHEEP',	'YIELD_FOOD',	1);
	
	INSERT INTO Building_ImprovementYieldChangesGlobal 
				(BuildingType,			ImprovementType,			YieldType,			Yield) 
	VALUES		('BUILDING_SKARA_BRAE',	'IMPROVEMENT_TRADING_POST',	'YIELD_PRODUCTION',	1),
				('BUILDING_SKARA_BRAE',	'IMPROVEMENT_TRADING_POST',	'YIELD_GOLD',		1);
	---------------------------------------------------------	
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,					Flavor) 
	VALUES		('BUILDING_SKARA_BRAE', 'FLAVOR_PRODUCTION',		20),
				('BUILDING_SKARA_BRAE', 'FLAVOR_GROWTH',			60),
				('BUILDING_SKARA_BRAE', 'FLAVOR_GOLD',				20),
				('BUILDING_SKARA_BRAE', 'FLAVOR_TILE_IMPROVEMENT',	20);
--============================================--
-- ANCIENT ERA
--============================================--
-- KARNAK (NEW)
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_KARNAK';
	UPDATE Buildings SET Cost = 150, PrereqTech = 'TECH_POTTERY',	NumPoliciesNeeded = 0, MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_KARNAK';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1 WHERE Type = 'BUILDING_KARNAK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,		FeatureType) 
	SELECT		'BUILDING_KARNAK',	'FEATURE_OASIS'			WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_KARNAK',	'FEATURE_FLOOD_PLAINS'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	---------------------------------------------------------	
	UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_MONUMENT' WHERE Type = 'BUILDING_KARNAK';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,			Yield) 
	VALUES		('BUILDING_KARNAK', 'YIELD_FOOD',		1),
				('BUILDING_KARNAK', 'YIELD_FAITH',		1),
				('BUILDING_KARNAK', 'YIELD_CULTURE',	1);
	
	INSERT INTO Building_YieldPerXFeatureTimes100 
				(BuildingType,		FeatureType,			YieldType,				Yield) 
	VALUES		('BUILDING_KARNAK', 'FEATURE_FLOOD_PLAINS', 'YIELD_PRODUCTION',		50),
				('BUILDING_KARNAK', 'FEATURE_FLOOD_PLAINS', 'YIELD_FAITH',			50);

	INSERT INTO Building_FeatureYieldChanges 
				(BuildingType,		FeatureType,			YieldType,				Yield) 
	VALUES		('BUILDING_KARNAK', 'FEATURE_OASIS',		'YIELD_PRODUCTION',		1),
				('BUILDING_KARNAK', 'FEATURE_OASIS',		'YIELD_FAITH',			1);
	
	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,		BuildingClassType,			YieldType,			YieldChange) 
	VALUES		('BUILDING_KARNAK',	'BUILDINGCLASS_MONUMENT',	'YIELD_CULTURE',	1);
	---------------------------------------------------------	
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,				Flavor) 
	VALUES		('BUILDING_KARNAK', 'FLAVOR_CULTURE',		40),
				('BUILDING_KARNAK', 'FLAVOR_RELIGION',		40),
				('BUILDING_KARNAK', 'FLAVOR_GROWTH',		40);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- STONEHENGE
	UPDATE Buildings SET MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_STONEHENGE';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_STONEHENGE';
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_GRASS' WHERE Type = 'BUILDING_STONEHENGE';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_GRASS', /*IsNoCoast = 1, */Flat = 1 WHERE Type = 'BUILDING_STONEHENGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_GRASS', Flat = 1 WHERE Type = 'BUILDING_STONEHENGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- NAZCA LINES (NEW)
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_NAZCA';
	UPDATE Buildings SET Cost = 150, PrereqTech = 'TECH_TRAPPING',	NumPoliciesNeeded = 0, MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_NAZCA';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1, IsNoWater = 1/*, IsNoCoast = 1*/, NearbyTerrainRequired = 'TERRAIN_PLAINS' WHERE Type = 'BUILDING_NAZCA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Hill = 1, NearbyTerrainRequired = 'TERRAIN_PLAINS' WHERE Type = 'BUILDING_NAZCA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------	
	UPDATE Buildings SET EnhancedYieldTech = 'TECH_FLIGHT', SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 1 WHERE Type = 'BUILDING_NAZCA';
	
	INSERT INTO Building_TerrainYieldChanges 
				(BuildingType,		TerrainType,		YieldType,		Yield) 
	VALUES		('BUILDING_NAZCA',	'TERRAIN_PLAINS',	'YIELD_FOOD',	2);
	
	INSERT INTO Building_PlotYieldChanges 
				(BuildingType,		PlotType,		YieldType,		Yield) 
	VALUES		('BUILDING_NAZCA',	'PLOT_HILLS',	'YIELD_FAITH',	1);
	
	INSERT INTO Building_ImprovementYieldChanges 
				(BuildingType,		ImprovementType,	YieldType,			Yield) 
	VALUES		('BUILDING_NAZCA',	'IMPROVEMENT_CAMP',	'YIELD_SCIENCE',	1);

	INSERT INTO Building_TechEnhancedYieldChanges
				(BuildingType,		YieldType,			Yield) 
	VALUES		('BUILDING_NAZCA',	'YIELD_SCIENCE',	4),
				('BUILDING_NAZCA',	'YIELD_TOURISM',	2);
	---------------------------------------------------------	
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,			Flavor) 
	VALUES		('BUILDING_NAZCA',	'FLAVOR_GROWTH',	60),
				('BUILDING_NAZCA',	'FLAVOR_RELIGION',	60),
				('BUILDING_NAZCA',	'FLAVOR_SCIENCE',	10),
				('BUILDING_NAZCA',	'FLAVOR_CULTURE',	10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- PYRAMIDS
	UPDATE Buildings SET MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_PYRAMID';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_PYRAMID';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1, Flat = 1, ProhibitedCityTerrain = 'TERRAIN_TUNDRA' WHERE Type = 'BUILDING_PYRAMID' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET River = 1, Flat = 1 WHERE Type = 'BUILDING_PYRAMID' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- WIELICZKA (NEW)
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_WIELICZKA';
	UPDATE Buildings SET Cost = 150, PrereqTech = 'TECH_MINING', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_WIELICZKA';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1 WHERE Type = 'BUILDING_WIELICZKA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + Mine(2) lua (HARD)
	-- + PlaceForResource lua (ALL)
	---------------------------------------------------------	
	INSERT INTO Building_ResourceYieldChanges 
				(BuildingType,			ResourceType,		YieldType,			Yield) 
	VALUES		('BUILDING_WIELICZKA',	'RESOURCE_SALT',	'YIELD_PRODUCTION',	1),
				('BUILDING_WIELICZKA',	'RESOURCE_SALT',	'YIELD_GOLD',		1);
	
	INSERT INTO Building_ResourcePlotsToPlace
				(BuildingType,			ResourceType,		NumPlots,	ResourceQuantityToPlace) 
	VALUES		('BUILDING_WIELICZKA',	'RESOURCE_SALT',	2,			1);

	INSERT INTO Building_GlobalYieldModifiers 
				(BuildingType,			YieldType,		Yield) 
	VALUES		('BUILDING_WIELICZKA',	'YIELD_FOOD',	5);
	
	INSERT INTO Building_ImprovementYieldChanges 
				(BuildingType,			ImprovementType,	YieldType,		Yield) 
	VALUES		('BUILDING_WIELICZKA',	'IMPROVEMENT_MINE',	'YIELD_FOOD',	1);
	---------------------------------------------------------	
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor) 
	VALUES		('BUILDING_WIELICZKA',	'FLAVOR_GROWTH',		50),
				('BUILDING_WIELICZKA',	'FLAVOR_PRODUCTION',	10),
				('BUILDING_WIELICZKA',	'FLAVOR_GOLD',			20),
				('BUILDING_WIELICZKA',	'FLAVOR_HAPPINESS',		20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- PETRA
	UPDATE Buildings SET MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_PETRA';
	UPDATE Buildings SET WonderSplashAnchor = 'C,T' WHERE Type = 'BUILDING_PETRA';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyMountainRequired = 1, NearbyTerrainRequired = 'TERRAIN_DESERT' WHERE Type = 'BUILDING_PETRA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_DESERT' WHERE Type = 'BUILDING_PETRA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- TEMPLE OF ARTEMIS
	UPDATE Buildings SET MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_TEMPLE_ARTEMIS';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_TEMPLE_ARTEMIS';
	---------------------------------------------------------
	UPDATE Buildings SET ProhibitedCityTerrain = 'TERRAIN_DESERT' WHERE Type = 'BUILDING_TEMPLE_ARTEMIS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,				FeatureType) 
	SELECT		'BUILDING_TEMPLE_ARTEMIS',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_TEMPLE_ARTEMIS',	'FEATURE_JUNGLE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));

	-- + Camp/Plantation(1) (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- PLAIN OF JARS (NEW)
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_THONG_HAI_HIN';
	UPDATE Buildings SET Cost = 185, PrereqTech = 'TECH_ARCHERY', NumPoliciesNeeded = 2, MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_THONG_HAI_HIN';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1, /*, IsNoCoast = 1*/ NearbyTerrainRequired = 'TERRAIN_PLAINS' WHERE Type = 'BUILDING_THONG_HAI_HIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Flat = 1, NearbyTerrainRequired = 'TERRAIN_PLAINS' WHERE Type = 'BUILDING_THONG_HAI_HIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------	
	UPDATE Buildings SET TradeRouteLandGoldBonus = 200 WHERE Type = 'BUILDING_THONG_HAI_HIN';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,		Yield) 
	VALUES		('BUILDING_THONG_HAI_HIN',	'YIELD_GOLD',	2),
				('BUILDING_THONG_HAI_HIN',	'YIELD_FAITH',	3);
	
	INSERT INTO Building_YieldFromDeath
				(BuildingType,				YieldType,		Yield)
	VALUES		('BUILDING_THONG_HAI_HIN',	'YIELD_FAITH',	5);

	INSERT INTO Building_YieldFromInternalTR
				(BuildingType,				YieldType,		Yield)
	VALUES		('BUILDING_THONG_HAI_HIN',	'YIELD_FOOD',	2);
	---------------------------------------------------------	
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,				Flavor) 
	VALUES		('BUILDING_THONG_HAI_HIN',	'FLAVOR_GROWTH',		20),
				('BUILDING_THONG_HAI_HIN',	'FLAVOR_RELIGION',		50),
				('BUILDING_THONG_HAI_HIN',	'FLAVOR_GOLD',			40);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MAUSOLEUM OF HALICARNASSUS
	UPDATE Buildings SET MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_MAUSOLEUM_HALICARNASSUS';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_MAUSOLEUM_HALICARNASSUS';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10, Hill = 1 WHERE Type = 'BUILDING_MAUSOLEUM_HALICARNASSUS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + Quarry(1) (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- STATUE OF ZEUS
	UPDATE Buildings SET MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_STATUE_ZEUS';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_STATUE_ZEUS';
	---------------------------------------------------------
	-- + Afraid/Guarded/Hostile/War (lua) (HARD)
--============================================--
-- CLASSICAL ERA
--============================================--
-- GREAT LIGHTHOUSE
	UPDATE Buildings SET MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_GREAT_LIGHTHOUSE';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_GREAT_LIGHTHOUSE';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10, River = 1, ProhibitedCityTerrain = 'TERRAIN_GRASS' WHERE Type = 'BUILDING_GREAT_LIGHTHOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Water = 1, MinAreaSize = 10, River = 1 WHERE Type = 'BUILDING_GREAT_LIGHTHOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- GREAT LIBRARY
	UPDATE Buildings SET MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_GREAT_LIBRARY';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_GREAT_LIBRARY';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1, Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_GREAT_LIBRARY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Hill = 1 WHERE Type = 'BUILDING_GREAT_LIBRARY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,				FeatureType) 
	SELECT		'BUILDING_GREAT_LIBRARY',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_GREAT_LIBRARY',	'FEATURE_JUNGLE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- HANGING GARDENS
	UPDATE Buildings SET MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_HANGING_GARDEN';
	UPDATE Buildings SET WonderSplashAnchor = 'C,T' WHERE Type = 'BUILDING_HANGING_GARDEN';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */Flat = 1, FreshWater = 1 WHERE Type = 'BUILDING_HANGING_GARDEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET FreshWater = 1 WHERE Type = 'BUILDING_HANGING_GARDEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- FORUM ROMANUM
	UPDATE Buildings SET MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_FORUM';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T', PrereqTech = 'TECH_WRITING' WHERE Type = 'BUILDING_FORUM';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_FORUM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,		FeatureType) 
	SELECT		'BUILDING_FORUM',	'FEATURE_MARSH' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MALWIYA MINARET (NEW)
	UPDATE Buildings SET Cost = 200, PrereqTech = 'TECH_MATHEMATICS', NumPoliciesNeeded = 4, MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_MALWIYA';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_MALWIYA';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1 WHERE Type = 'BUILDING_MALWIYA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,		BuildingClassType) 
	SELECT		'BUILDING_MALWIYA',	'BUILDINGCLASS_STONE_WORKS' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2 WHERE Type = 'BUILDING_MALWIYA';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_MALWIYA',	'YIELD_FAITH',		3);

	INSERT INTO Building_ImprovementYieldChangesGlobal 
				(BuildingType,			ImprovementType,			YieldType,			Yield) 
	VALUES		('BUILDING_MALWIYA',	'IMPROVEMENT_MANUFACTORY',	'YIELD_FAITH',		3),
				('BUILDING_MALWIYA',	'IMPROVEMENT_QUARRY',		'YIELD_FAITH',		1),
				('BUILDING_MALWIYA',	'IMPROVEMENT_QUARRY',		'YIELD_PRODUCTION', 1);

	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,			BuildingClassType,				YieldType,			YieldChange) 
	VALUES		('BUILDING_MALWIYA',	'BUILDINGCLASS_STONE_WORKS',	'YIELD_PRODUCTION', 2);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,					Flavor) 
	VALUES		('BUILDING_MALWIYA',	'FLAVOR_GREAT_PEOPLE',		30),
				('BUILDING_MALWIYA',	'FLAVOR_PRODUCTION',		50),
				('BUILDING_MALWIYA',	'FLAVOR_RELIGION',			60),
				('BUILDING_MALWIYA',	'FLAVOR_TILE_IMPROVEMENT',	30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- TERRACOTA ARMY
	UPDATE Buildings SET MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_TERRACOTTA_ARMY';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_TERRACOTTA_ARMY';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */IsNoWater = 1 WHERE Type = 'BUILDING_TERRACOTTA_ARMY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET IsNoWater = 1 WHERE Type = 'BUILDING_TERRACOTTA_ARMY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	-- + Mine/Quarry(1) (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- BUDDHAS OF BAMYAN (NEW)
	UPDATE Buildings SET Cost = 200, PrereqTech = 'TECH_CONSTRUCTION', NumPoliciesNeeded = 4, MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_BAMYAN';
	---------------------------------------------------------
	UPDATE Buildings SET WonderSplashAnchor = 'C,T' WHERE Type = 'BUILDING_BAMYAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	-- + Peace (lua) (HARD)
	-- + Mountains(2) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET ReligiousPressureModifier = 100, EnhancedYieldTech = 'TECH_ROCKETRY', DoFToVotes = 1 WHERE Type = 'BUILDING_BAMYAN';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,					Yield) 
	VALUES		('BUILDING_BAMYAN', 'YIELD_CULTURE',			1),
				('BUILDING_BAMYAN', 'YIELD_FAITH',				2);
	
	INSERT INTO Building_YieldPerFriend
				(BuildingType,		YieldType,		Yield) 
	VALUES		('BUILDING_BAMYAN', 'YIELD_FAITH',	2);
	
	INSERT INTO Building_YieldPerAlly
				(BuildingType,		YieldType,					Yield) 
	VALUES		('BUILDING_BAMYAN', 'YIELD_FAITH',	            2),
                ('BUILDING_BAMYAN', 'YIELD_GOLDEN_AGE_POINTS',	3);

	INSERT INTO Building_TechEnhancedYieldChanges
				(BuildingType,		YieldType,					Yield) 
	VALUES		('BUILDING_BAMYAN', 'YIELD_CULTURE',			2),
				('BUILDING_BAMYAN', 'YIELD_GOLDEN_AGE_POINTS',	2);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,				Flavor) 
	VALUES		('BUILDING_BAMYAN', 'FLAVOR_CULTURE',		30),
				('BUILDING_BAMYAN', 'FLAVOR_RELIGION',		60),
				('BUILDING_BAMYAN', 'FLAVOR_HAPPINESS',		40);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- GATE OF THE SUN (NEW)
	UPDATE Buildings SET Cost = 200, PrereqTech = 'TECH_CONSTRUCTION', NumPoliciesNeeded = 4, MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_GATE_OF_SUN';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_GATE_OF_SUN';
	---------------------------------------------------------
	UPDATE Buildings SET FreshWater = 1, Water = 1, MinAreaSize = 1, NearbyMountainRequired = 1 WHERE Type = 'BUILDING_GATE_OF_SUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET FreshWater = 1, Water = 1, MinAreaSize = 1 WHERE Type = 'BUILDING_GATE_OF_SUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------
	UPDATE Buildings SET GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 1 WHERE Type = 'BUILDING_GATE_OF_SUN';
	
	INSERT INTO Building_YieldModifiers
				(BuildingType,					YieldType,			Yield) 
	VALUES		('BUILDING_GATE_OF_SUN_DUMMY',	'YIELD_SCIENCE',	5);

	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,			Yield) 
	VALUES		('BUILDING_GATE_OF_SUN',	'YIELD_CULTURE',	1),
				('BUILDING_GATE_OF_SUN',	'YIELD_SCIENCE',	1);

	INSERT INTO Building_YieldPerXTerrainTimes100
				(BuildingType,				TerrainType,			YieldType,			Yield) 
	VALUES		('BUILDING_GATE_OF_SUN',	'TERRAIN_MOUNTAIN',		'YIELD_CULTURE',	100);

	INSERT INTO Building_LakePlotYieldChanges 
				(BuildingType,				YieldType,			Yield)
	VALUES		('BUILDING_GATE_OF_SUN',	'YIELD_CULTURE',	1);	
	
	INSERT INTO Building_GoldenAgeYieldMod 
				(BuildingType,				YieldType,			Yield)
	VALUES		('BUILDING_GATE_OF_SUN',	'YIELD_SCIENCE',	5);	
	
	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,				BuildingClassType,		YieldType,			YieldChange) 
	VALUES		('BUILDING_GATE_OF_SUN',	'BUILDINGCLASS_WALLS',	'YIELD_SCIENCE',	1);

	-- + science_per_city_with_walls (lua)
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,				Flavor) 
	VALUES		('BUILDING_GATE_OF_SUN',	'FLAVOR_CULTURE',		30),
				('BUILDING_GATE_OF_SUN',	'FLAVOR_SCIENCE',		60);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- PARTHENON
	UPDATE Buildings SET MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_PARTHENON';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_PARTHENON';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10, Hill = 1, IsNoWater = 1 WHERE Type = 'BUILDING_PARTHENON' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Hill = 1 WHERE Type = 'BUILDING_PARTHENON' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- EL GHRIBA SYNAGOGUE (NEW)
	UPDATE Buildings SET Cost = 250, PrereqTech = 'TECH_DRAMA', NumPoliciesNeeded = 5, MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_EL_GHRIBA';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_EL_GHRIBA';
	---------------------------------------------------------
	UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_SYNAGOGUE', GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 1, FreeGreatWork = 'GREAT_WORK_THE_ARK' WHERE Type = 'BUILDING_EL_GHRIBA';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_EL_GHRIBA',	'YIELD_CULTURE',	1),
				('BUILDING_EL_GHRIBA',	'YIELD_GOLD',		1),
				('BUILDING_EL_GHRIBA',	'YIELD_FAITH',		4);
	
	INSERT INTO Building_YieldFromFaithPurchase
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_EL_GHRIBA',	'YIELD_GOLD',		15);
	
	INSERT INTO GreatWorks
				(Type,					Description,					GreatWorkClassType,	Audio,							Image,									Quote) 
	VALUES		('GREAT_WORK_THE_ARK',	'TXT_KEY_GREAT_WORK_THE_ARK',	'GREAT_WORK_ART',	'AS2D_GREAT_ARTIST_ARTWORK',	'Great_Work_Ark_of_the_Covenant.dds',	'TXT_KEY_GREAT_WORK_THE_ARK_QUOTE');
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,			Flavor) 
	VALUES		('BUILDING_EL_GHRIBA',	'FLAVOR_CULTURE',	30),
				('BUILDING_EL_GHRIBA',	'FLAVOR_RELIGION',	50),
				('BUILDING_EL_GHRIBA',	'FLAVOR_GOLD',		30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- ORACLE
	UPDATE Buildings SET MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_ORACLE';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_ORACLE';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1, NearbyMountainRequired = 1 WHERE Type = 'BUILDING_ORACLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Hill = 1 WHERE Type = 'BUILDING_ORACLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- ETCHMIADZIN CATHEDRAL (NEW)
	UPDATE Buildings SET Cost = 250, PrereqTech = 'TECH_PHILOSOPHY', NumPoliciesNeeded = 5, MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_ETCHMIADZIN';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_ETCHMIADZIN';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */NearbyTerrainRequired = 'TERRAIN_GRASS' WHERE Type = 'BUILDING_ETCHMIADZIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,			FeatureType) 
	SELECT		'BUILDING_ETCHMIADZIN',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------
	UPDATE Buildings SET GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 1, FreeGreatWork = 'GREAT_WORK_HOLY_LANCE'  WHERE Type = 'BUILDING_ETCHMIADZIN';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,					Yield) 
	VALUES		('BUILDING_ETCHMIADZIN',	'YIELD_GOLDEN_AGE_POINTS',	2),
				('BUILDING_ETCHMIADZIN',	'YIELD_FAITH',				2);
	
	INSERT INTO Building_YieldFromYieldPercent
				(BuildingType,				YieldIn,		YieldOut,					Value) 
	VALUES		('BUILDING_ETCHMIADZIN',	'YIELD_FAITH',	'YIELD_CULTURE',			10),
				('BUILDING_ETCHMIADZIN',	'YIELD_FAITH',	'YIELD_GOLDEN_AGE_POINTS',	10);
	
	INSERT INTO Building_GreatWorkYieldChanges
				(BuildingType,				YieldType,		Yield) 
	VALUES		('BUILDING_ETCHMIADZIN',	'YIELD_FAITH',	1);
	
	INSERT INTO GreatWorks
				(Type,						Description,						GreatWorkClassType,	Audio,							Image,							Quote) 
	VALUES		('GREAT_WORK_HOLY_LANCE',	'TXT_KEY_GREAT_WORK_HOLY_LANCE',	'GREAT_WORK_ART',	'AS2D_GREAT_ARTIST_ARTWORK',	'Great_Work_Holy_Lance.dds',	'TXT_KEY_GREAT_WORK_HOLY_LANCE_QUOTE');
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,			Flavor) 
	VALUES		('BUILDING_ETCHMIADZIN',	'FLAVOR_CULTURE',	50),
				('BUILDING_ETCHMIADZIN',	'FLAVOR_RELIGION',	60),
				('BUILDING_ETCHMIADZIN',	'FLAVOR_HAPPINESS',	20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- ANGKOR WAT
	UPDATE Buildings SET MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_ANGKOR_WAT';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_ANGKOR_WAT';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1, FreshWater = 1, Water = 1, MinAreaSize = 1 WHERE Type = 'BUILDING_ANGKOR_WAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET FreshWater = 1, Water = 1, MinAreaSize = 1 WHERE Type = 'BUILDING_ANGKOR_WAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,			FeatureType) 
	SELECT		'BUILDING_ANGKOR_WAT',	'FEATURE_JUNGLE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- SIGIRIYA (NEW)
	UPDATE Buildings SET Cost = 250, PrereqTech = 'TECH_CURRENCY', NumPoliciesNeeded = 5, MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_SIGIRIYA';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_SIGIRIYA';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1 /*, IsNoCoast = 1*/ WHERE Type = 'BUILDING_SIGIRIYA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Hill = 1 WHERE Type = 'BUILDING_SIGIRIYA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,			FeatureType) 
	SELECT		'BUILDING_SIGIRIYA',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_SIGIRIYA',	'FEATURE_JUNGLE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------
	UPDATE Buildings SET Defense = 1000, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 2, ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_SIGIRIYA_HELP' WHERE Type = 'BUILDING_SIGIRIYA';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_SIGIRIYA',	'YIELD_CULTURE',	2);

	INSERT INTO Building_GreatWorkYieldChanges
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_SIGIRIYA',	'YIELD_CULTURE',	1);

	INSERT INTO Building_InstantYield
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_SIGIRIYA',	'YIELD_GOLD',		200);

	INSERT INTO Building_ThemingBonuses 
				(BuildingType,			Description,						Bonus,	MustBeArt,	RequiresOwner,	AIPriority)
	VALUES		('BUILDING_SIGIRIYA',	'TXT_KEY_THEMING_BONUS_SIGIRIYA',	7,		1,			1,				5);

	INSERT INTO Building_ThemingYieldBonus 
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_SIGIRIYA',	'YIELD_GOLD',		6),
				('BUILDING_SIGIRIYA',	'YIELD_CULTURE',	3);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor) 
	VALUES		('BUILDING_SIGIRIYA',	'FLAVOR_GOLD',			30),
				('BUILDING_SIGIRIYA',	'FLAVOR_CULTURE',		80),
				('BUILDING_SIGIRIYA',	'FLAVOR_CITY_DEFENSE',	20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- GREAT WALL
	UPDATE Buildings SET MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_GREAT_WALL';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_GREAT_WALL';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1, River = 1 WHERE Type = 'BUILDING_GREAT_WALL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + Deceptive/Hostile/War (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- CHAND BAORI (NEW)
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_CHAND_BAORI';
	UPDATE Buildings SET Cost = 250, PrereqTech = 'TECH_ENGINEERING', NumPoliciesNeeded = 5, MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_CHAND_BAORI';
	---------------------------------------------------------
	UPDATE Buildings SET IsNoWater = 1, NearbyTerrainRequired = 'TERRAIN_DESERT' WHERE Type = 'BUILDING_CHAND_BAORI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET IsNoWater = 1 WHERE Type = 'BUILDING_CHAND_BAORI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,			BuildingClassType) 
	SELECT		'BUILDING_CHAND_BAORI',	'BUILDINGCLASS_WELL' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET NoUnhappfromXSpecialists = 3, GreatPeopleRateModifier = 10, FreeGreatPeople = 1 WHERE Type = 'BUILDING_CHAND_BAORI';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,			Yield) 
	VALUES		('BUILDING_CHAND_BAORI',	'YIELD_FOOD',		2),
				('BUILDING_CHAND_BAORI',	'YIELD_GOLD',		1),
				('BUILDING_CHAND_BAORI',	'YIELD_CULTURE',	2);
	
	INSERT INTO Building_TerrainYieldChanges 
				(BuildingType,				TerrainType,		YieldType,		Yield) 
	VALUES		('BUILDING_CHAND_BAORI',	'TERRAIN_DESERT',	'YIELD_FOOD',	1);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,				Flavor) 
	VALUES		('BUILDING_CHAND_BAORI',	'FLAVOR_GROWTH',		40),
				('BUILDING_CHAND_BAORI',	'FLAVOR_CULTURE',		20),
				('BUILDING_CHAND_BAORI',	'FLAVOR_GREAT_PEOPLE',	30),
				('BUILDING_CHAND_BAORI',	'FLAVOR_HAPPINESS',		20),
				('BUILDING_CHAND_BAORI',	'FLAVOR_GOLD',			10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- COLOSSUS
	UPDATE Buildings SET MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_COLOSSUS';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_COLOSSUS';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_COLOSSUS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,			ResourceType) 
	SELECT		'BUILDING_COLOSSUS',	'RESOURCE_IRON'		WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_COLOSSUS',	'RESOURCE_COPPER'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--============================================--
-- MEDIEVAL ERA
--============================================--
-- UNIVERSITY OF SANKORE
	UPDATE Buildings SET MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_MOSQUE_OF_DJENNE';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_MOSQUE_OF_DJENNE';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_DESERT' WHERE Type = 'BUILDING_MOSQUE_OF_DJENNE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,					BuildingClassType) 
	SELECT		'BUILDING_MOSQUE_OF_DJENNE',	'BUILDINGCLASS_LIBRARY' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- PROPHET'S MOSQUE (NEW)
	UPDATE Buildings SET Cost = 400, PrereqTech = 'TECH_EDUCATION', NumPoliciesNeeded = 6, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_NABAWI';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_NABAWI';
	---------------------------------------------------------
	UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_MOSQUE', GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 2, ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_NABAWI_HELP' WHERE Type = 'BUILDING_NABAWI';

	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,			Yield)
	VALUES		('BUILDING_NABAWI', 'YIELD_CULTURE',	2),
				('BUILDING_NABAWI', 'YIELD_FAITH',		5);

	INSERT INTO Building_SpecificGreatPersonRateModifier
				(BuildingType,		SpecialistType,			Modifier)
	VALUES		('BUILDING_NABAWI', 'SPECIALIST_WRITER',	20);

	INSERT INTO Building_GlobalYieldModifiers
				(BuildingType,		YieldType,		Yield)
	VALUES		('BUILDING_NABAWI', 'YIELD_FAITH',	10);

	INSERT INTO Building_ThemingBonuses
				(BuildingType,		Description,					Bonus,	RequiresOwner,	AIPriority)
	VALUES		('BUILDING_NABAWI', 'TXT_KEY_THEMING_BONUS_NABAWI', 10,		1,				5);

	INSERT INTO Building_ThemingYieldBonus
				(BuildingType,		YieldType,					Yield)
	VALUES		('BUILDING_NABAWI', 'YIELD_GOLDEN_AGE_POINTS',	4),
				('BUILDING_NABAWI', 'YIELD_FAITH',				4);
	---------------------------------------------------------
	INSERT INTO Building_Flavors
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_NABAWI', 'FLAVOR_CULTURE',		30),
				('BUILDING_NABAWI', 'FLAVOR_RELIGION',		70),
				('BUILDING_NABAWI', 'FLAVOR_GREAT_PEOPLE',	20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MORAY TERRACES (NEW)
	UPDATE Buildings SET Cost = 400, PrereqTech = 'TECH_EDUCATION', NumPoliciesNeeded = 6, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_MORAY';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_MORAY';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1 /*, IsNoCoast = 1*/ WHERE Type = 'BUILDING_MORAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + Farm(1) (lua) (HARD)
	---------------------------------------------------------
	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,			Yield)
	VALUES		('BUILDING_MORAY',	'YIELD_FOOD',		2),
				('BUILDING_MORAY',	'YIELD_SCIENCE',	2);

	INSERT INTO Building_PlotYieldChanges 
				(BuildingType,		PlotType,		YieldType,			Yield) 
	VALUES		('BUILDING_MORAY',	'PLOT_HILLS',	'YIELD_FOOD',		1),
				('BUILDING_MORAY',	'PLOT_HILLS',	'YIELD_PRODUCTION',	1),
				('BUILDING_MORAY',	'PLOT_HILLS',	'YIELD_SCIENCE',	1);

	INSERT INTO Building_GlobalYieldModifiers 
				(BuildingType,		YieldType,		Yield) 
	VALUES		('BUILDING_MORAY',	'YIELD_FOOD',	5);

	INSERT INTO Building_YieldFromYieldPercent
				(BuildingType,		YieldIn,			YieldOut,		Value) 
	VALUES		('BUILDING_MORAY',	'YIELD_SCIENCE',	'YIELD_FOOD',	15);
	---------------------------------------------------------
	INSERT INTO Building_Flavors
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_MORAY', 'FLAVOR_GROWTH',			70),
				('BUILDING_MORAY', 'FLAVOR_PRODUCTION',		50),
				('BUILDING_MORAY', 'FLAVOR_SCIENCE',		20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- HAGIA SOPHIA
	UPDATE Buildings SET MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_HAGIA_SOPHIA';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_HAGIA_SOPHIA';
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- BOROBUDUR
	UPDATE Buildings SET MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_BOROBUDUR';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_BOROBUDUR';
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- LAVAUX (NEW)
	UPDATE Buildings SET Cost = 400, PrereqTech = 'TECH_THEOLOGY', NumPoliciesNeeded = 7, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_LAVAUX';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_LAVAUX';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1, FreshWater = 1, Water = 1, MinAreaSize = 1 WHERE Type = 'BUILDING_LAVAUX' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + PlaceForResource lua
	---------------------------------------------------------
	UPDATE Buildings SET EmpireSizeModifierReductionGlobal = -10 WHERE Type = 'BUILDING_LAVAUX';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,		Yield)
	VALUES		('BUILDING_LAVAUX', 'YIELD_FOOD',	2),
				('BUILDING_LAVAUX', 'YIELD_GOLD',	1);

	INSERT INTO Building_LakePlotYieldChanges 
				(BuildingType,		YieldType,		Yield)
	VALUES		('BUILDING_LAVAUX',	'YIELD_FOOD',	1);	
	
	INSERT INTO Building_ResourceYieldChanges 
				(BuildingType,		ResourceType,		YieldType,		Yield) 
	VALUES		('BUILDING_LAVAUX',	'RESOURCE_WINE',	'YIELD_FOOD',	1),
				('BUILDING_LAVAUX',	'RESOURCE_WINE',	'YIELD_GOLD',	1),
				('BUILDING_LAVAUX',	'RESOURCE_WINE',	'YIELD_FAITH',	1);

	INSERT INTO Building_ResourcePlotsToPlace
				(BuildingType,		ResourceType,		NumPlots,	ResourceQuantityToPlace) 
	VALUES		('BUILDING_LAVAUX',	'RESOURCE_WINE',	2,			1);
	---------------------------------------------------------
	INSERT INTO Building_Flavors
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_LAVAUX', 'FLAVOR_GROWTH',		50),
				('BUILDING_LAVAUX', 'FLAVOR_GOLD',			40),
				('BUILDING_LAVAUX', 'FLAVOR_HAPPINESS',		60),
				('BUILDING_LAVAUX', 'FLAVOR_RELIGION',		10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- ALHAMBRA
	UPDATE Buildings SET MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_ALHAMBRA';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_ALHAMBRA';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1 WHERE Type = 'BUILDING_ALHAMBRA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,			FeatureType) 
	SELECT		'BUILDING_ALHAMBRA',	'FEATURE_FOREST'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- WARTBURG (NEW)
	UPDATE Buildings SET Cost = 400, PrereqTech = 'TECH_CHIVALRY', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_WARTBURG';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_WARTBURG';
	---------------------------------------------------------
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,			FeatureType) 
	SELECT		'BUILDING_WARTBURG',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,			BuildingClassType) 
	SELECT		'BUILDING_WARTBURG',	'BUILDINGCLASS_WRITERS_GUILD' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------
	UPDATE Buildings SET Defense = 1000, SpecialistType = 'SPECIALIST_WRITER', GreatPeopleRateChange = 2, GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 3, ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_WARTBURG_HELP' WHERE Type = 'BUILDING_WARTBURG';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,					Yield) 
	VALUES		('BUILDING_WARTBURG',	'YIELD_CULTURE',			1),
				('BUILDING_WARTBURG',	'YIELD_GOLDEN_AGE_POINTS',	1);
	
	INSERT INTO Building_SpecificGreatPersonRateModifier 
				(BuildingType,			SpecialistType,			Modifier)
	VALUES		('BUILDING_WARTBURG',	'SPECIALIST_WRITER',	30);

	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,			BuildingClassType,				YieldType,		YieldChange) 
	VALUES		('BUILDING_WARTBURG',	'BUILDINGCLASS_WRITERS_GUILD',	'YIELD_FAITH',	1);

	INSERT INTO Building_ThemingBonuses 
				(BuildingType,			Description,						Bonus,	RequiresOwner,	AIPriority)
	VALUES		('BUILDING_WARTBURG',	'TXT_KEY_THEMING_BONUS_WARTBURG',	15,		1,				5);

	INSERT INTO Building_DomainFreeExperiencePerGreatWork
				(BuildingType,			DomainType,		Experience)
	VALUES		('BUILDING_WARTBURG',	'DOMAIN_LAND',	5);

	INSERT INTO Building_ThemingYieldBonus 
				(BuildingType,			YieldType,					Yield) 
	VALUES		('BUILDING_WARTBURG',	'YIELD_CULTURE',			3),
				('BUILDING_WARTBURG',	'YIELD_FAITH',				3),
				('BUILDING_WARTBURG',	'YIELD_GOLDEN_AGE_POINTS',	3);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_WARTBURG',	'FLAVOR_CULTURE',		30),
				('BUILDING_WARTBURG',	'FLAVOR_GREAT_PEOPLE',	60),
				('BUILDING_WARTBURG',	'FLAVOR_RELIGION',		30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MACHU PICCHU
	UPDATE Buildings SET MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_MACHU_PICHU';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T' WHERE Type = 'BUILDING_MACHU_PICHU';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyMountainRequired = 0 WHERE Type = 'BUILDING_MACHU_PICHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET NearbyMountainRequired = 1 WHERE Type = 'BUILDING_MACHU_PICHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	-- + Mountains(2) (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- GREAT ZIMBABWE (NEW)
	UPDATE Buildings SET Cost = 400, PrereqTech = 'TECH_PHYSICS', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_GREAT_ZIMBABWE';
	UPDATE Buildings SET WonderSplashAnchor = 'R,C' WHERE Type = 'BUILDING_GREAT_ZIMBABWE';
	---------------------------------------------------------
	--UPDATE Buildings SET IsNoCoast = 1 WHERE Type = 'BUILDING_GREAT_ZIMBABWE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + Mine/Camp(3) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET Defense = 1000, GlobalPlotBuyCostModifier = -30, NumTradeRouteBonus = 1 WHERE Type = 'BUILDING_GREAT_ZIMBABWE';

	INSERT INTO Building_YieldChanges 
				(BuildingType,						YieldType,					Yield)
	VALUES		('BUILDING_GREAT_ZIMBABWE',			'YIELD_FAITH',				1),
				('BUILDING_GREAT_ZIMBABWE',			'YIELD_GOLD',				1),
				('BUILDING_GREAT_ZIMBABWE_DUMMY',	'YIELD_GOLDEN_AGE_POINTS',	2);
	
	INSERT INTO Building_UnitCombatProductionModifiers 	
				(BuildingType,						UnitCombatType,			Modifier) 
	VALUES		('BUILDING_GREAT_ZIMBABWE_DUMMY',	'UNITCOMBAT_MOUNTED',	5),
				('BUILDING_GREAT_ZIMBABWE_DUMMY',	'UNITCOMBAT_SIEGE',		5),
				('BUILDING_GREAT_ZIMBABWE_DUMMY',	'UNITCOMBAT_ARCHER',	5),
				('BUILDING_GREAT_ZIMBABWE_DUMMY',	'UNITCOMBAT_MELEE',		5),
				('BUILDING_GREAT_ZIMBABWE_DUMMY',	'UNITCOMBAT_GUN',		5),
				('BUILDING_GREAT_ZIMBABWE_DUMMY',	'UNITCOMBAT_ARMOR',		5),
				('BUILDING_GREAT_ZIMBABWE_DUMMY',	'UNITCOMBAT_RECON',		5);
	---------------------------------------------------------
	INSERT INTO Building_Flavors
				(BuildingType,				FlavorType,				Flavor)
	VALUES		('BUILDING_GREAT_ZIMBABWE',	'FLAVOR_GOLD',			50),
				('BUILDING_GREAT_ZIMBABWE',	'FLAVOR_RELIGION',		10),
				('BUILDING_GREAT_ZIMBABWE',	'FLAVOR_CULTURE',		10),
				('BUILDING_GREAT_ZIMBABWE',	'FLAVOR_EXPANSION',		40);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- AHU TONGARIKI (NEW)
	UPDATE Buildings SET Cost = 400, PrereqTech = 'TECH_PHYSICS', NumPoliciesNeeded = 7, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_AHU';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_AHU';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_AHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,	FeatureType) 
	SELECT		'BUILDING_AHU',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_AHU',	'FEATURE_JUNGLE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,	ResourceType) 
	SELECT		'BUILDING_AHU',	'RESOURCE_STONE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET WorkerSpeedModifier = 20 WHERE Type = 'BUILDING_AHU';
	
	INSERT INTO Building_GlobalYieldModifiers
				(BuildingType,		YieldType,		Yield)
	VALUES		('BUILDING_AHU',	'YIELD_FAITH',	5);

	INSERT INTO Building_ResourceQuantity
				(BuildingType,		ResourceType,		Quantity) 
	VALUES		('BUILDING_AHU',	'RESOURCE_TERN',	1);
	
	INSERT INTO Building_ImprovementYieldChangesGlobal
				(BuildingType,		ImprovementType,		YieldType,			Yield) 
	VALUES		('BUILDING_AHU',	'IMPROVEMENT_QUARRY',	'YIELD_CULTURE',	1);

	INSERT INTO Building_TerrainYieldChanges 
				(BuildingType,		TerrainType,		YieldType,		Yield) 
	VALUES		('BUILDING_AHU',	'TERRAIN_COAST',	'YIELD_FAITH',	1);
	
	INSERT INTO Building_FeatureYieldChanges
				(BuildingType,		FeatureType,		YieldType,				Yield) 
	VALUES		('BUILDING_AHU',	'FEATURE_FOREST',	'YIELD_PRODUCTION',		1),
				('BUILDING_AHU',	'FEATURE_JUNGLE',	'YIELD_PRODUCTION',		1);
	---------------------------------------------------------
	INSERT INTO Building_Flavors
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_AHU',	'FLAVOR_CULTURE',		20),
				('BUILDING_AHU',	'FLAVOR_PRODUCTION',	50),
				('BUILDING_AHU',	'FLAVOR_RELIGION',		30),
				('BUILDING_AHU',	'FLAVOR_HAPPINESS',		20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- FALUN MINE (NEW)
	UPDATE Buildings SET Cost = 400, PrereqTech = 'TECH_STEEL', NumPoliciesNeeded = 6, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_FALUN';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_FALUN';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1 WHERE Type = 'BUILDING_FALUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + Mine(4) (lua) (HARD)
	---------------------------------------------------------
	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,						Yield)
	VALUES		('BUILDING_FALUN',	'YIELD_GOLDEN_AGE_POINTS',		1),
				('BUILDING_FALUN',	'YIELD_GREAT_GENERAL_POINTS',	1);

	INSERT INTO Building_ResourceYieldChanges
				(BuildingType,		ResourceType,		YieldType,					Yield) 
	VALUES		('BUILDING_FALUN',	'RESOURCE_COPPER',	'YIELD_GOLDEN_AGE_POINTS',	1),
				('BUILDING_FALUN',	'RESOURCE_COPPER',	'YIELD_GOLD',				1);

	INSERT INTO Building_ImprovementYieldChanges
				(BuildingType,		ImprovementType,	YieldType,		Yield) 
	VALUES		('BUILDING_FALUN',	'IMPROVEMENT_MINE',	'YIELD_GOLD',	1);

	INSERT INTO Building_ResourcePlotsToPlace
				(BuildingType,		ResourceType,		NumPlots,	ResourceQuantityToPlace) 
	VALUES		('BUILDING_FALUN',	'RESOURCE_COPPER',	2,			1);
	
	INSERT INTO Building_FreeUnits 
				(BuildingType,		UnitType,				NumUnits) 
	VALUES		('BUILDING_FALUN',	'UNIT_GREAT_GENERAL',	1);
	
	INSERT INTO Building_GreatPersonProgressFromConstruction
				(BuildingType,		GreatPersonType,		EraType,			Value) 
	VALUES		('BUILDING_FALUN',	'GREATPERSON_ENGINEER',	'ERA_CLASSICAL',	2);
	---------------------------------------------------------
	INSERT INTO Building_Flavors
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_FALUN',	'FLAVOR_GOLD',			40),
				('BUILDING_FALUN',	'FLAVOR_PRODUCTION',	10),
				('BUILDING_FALUN',	'FLAVOR_HAPPINESS',		50),
				('BUILDING_FALUN',	'FLAVOR_GREAT_PEOPLE',	40);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- FORGE OF DAMASCUS (NEW)
	UPDATE Buildings SET Cost = 400, PrereqTech = 'TECH_STEEL', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_DAMASCUS';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_DAMASCUS';
	---------------------------------------------------------
	UPDATE Buildings SET FreshWater = 1 WHERE Type = 'BUILDING_DAMASCUS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	-- + LumberMill(1) (lua) (HARD)
	
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,			ResourceType) 
	SELECT		'BUILDING_DAMASCUS',	'RESOURCE_IRON' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------
	UPDATE Buildings SET FreePromotion = 'PROMOTION_DAMASCUS', SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 2, EnhancedYieldTech = 'TECH_METALLURGY' WHERE Type = 'BUILDING_DAMASCUS';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_DAMASCUS',	'YIELD_PRODUCTION',	3),
				('BUILDING_DAMASCUS',	'YIELD_SCIENCE',	3);

	INSERT INTO Building_TechEnhancedYieldChanges
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_DAMASCUS',	'YIELD_PRODUCTION', 3);

	INSERT INTO Building_ResourceYieldChangesGlobal
				(BuildingType,			ResourceType,		YieldType,			Yield) 
	VALUES		('BUILDING_DAMASCUS',	'RESOURCE_IRON',	'YIELD_PRODUCTION', 1),
				('BUILDING_DAMASCUS',	'RESOURCE_IRON',	'YIELD_SCIENCE',	1);

	INSERT INTO UnitPromotions 
				(Type,					Description,					Help,								Sound,				CannotBeChosen, LostWithUpgrade,	AttackMod,	DefenseMod,		PortraitIndex,	IconAtlas,						PediaType,		PediaEntry) 
	VALUES		('PROMOTION_DAMASCUS',	'TXT_KEY_PROMOTION_DAMASCUS',	'TXT_KEY_PROMOTION_DAMASCUS_HELP',	'AS2D_IF_LEVELUP',	1,				0,					10,			10,				0,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_DAMASCUS');

	INSERT INTO UnitPromotions_UnitCombats
				(PromotionType,			UnitCombatType)
	VALUES		('PROMOTION_DAMASCUS',	'UNITCOMBAT_MELEE'),
				('PROMOTION_DAMASCUS',	'UNITCOMBAT_MOUNTED');
	---------------------------------------------------------
	INSERT INTO Building_Flavors
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_DAMASCUS',	'FLAVOR_DEFENSE',		10),
				('BUILDING_DAMASCUS',	'FLAVOR_OFFENSE',		40),
				('BUILDING_DAMASCUS',	'FLAVOR_PRODUCTION',	50),
				('BUILDING_DAMASCUS',	'FLAVOR_SCIENCE',		30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- FORBIDDEN PALACE
	UPDATE Buildings SET MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_FORBIDDEN_PALACE';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_FORBIDDEN_PALACE';
	---------------------------------------------------------
	UPDATE Buildings SET Capital = 1 WHERE Type = 'BUILDING_FORBIDDEN_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,					BuildingClassType) 
	SELECT		'BUILDING_FORBIDDEN_PALACE',	'BUILDINGCLASS_WALLS'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_FORBIDDEN_PALACE',	'BUILDINGCLASS_PALACE'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- RILA MONASTERY (FORMER KARLSTEJN)
	UPDATE Buildings SET MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_KARLSTEJN';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B', WonderSplashImage = 'Wonder_Rila_splash.dds' WHERE Type = 'BUILDING_KARLSTEJN';

	INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES ('ATLAS_MORE_WONDERS_RILA', 256, 'Wonder_Rila_256.dds',	'1', '1');
	INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES ('ATLAS_MORE_WONDERS_RILA', 128, 'Wonder_Rila_128.dds',	'1', '1');
	INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES ('ATLAS_MORE_WONDERS_RILA', 80,	'Wonder_Rila_80.dds',	'1', '1');
	INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES ('ATLAS_MORE_WONDERS_RILA', 64,	'Wonder_Rila_64.dds',	'1', '1');
	INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES ('ATLAS_MORE_WONDERS_RILA', 45,	'Wonder_Rila_45.dds',	'1', '1');

	UPDATE Buildings SET IconAtlas = 'ATLAS_MORE_WONDERS_RILA', PortraitIndex = 0 WHERE Type = 'BUILDING_KARLSTEJN';
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- GOLDEN DAGON PAGODA (NEW)
	UPDATE Buildings SET Cost = 500, PrereqTech = 'TECH_GUILDS', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_SHWEDAGON';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_SHWEDAGON';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1, FreshWater = 1 WHERE Type = 'BUILDING_SHWEDAGON' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET FreshWater = 1 WHERE Type = 'BUILDING_SHWEDAGON' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------
	UPDATE Buildings SET FreePromotion = 'PROMOTION_HIDDEN_ARTIFACTS', GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 4, ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_SHWEDAGON_HELP', SpecialistType = 'SPECIALIST_ARTIST', GreatPeopleRateChange = 2 WHERE Type = 'BUILDING_SHWEDAGON';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_SHWEDAGON',	'YIELD_GOLD',		2),
				('BUILDING_SHWEDAGON',	'YIELD_CULTURE',	2);
	
	INSERT INTO Building_SpecialistYieldChanges
				(BuildingType,			SpecialistType,			YieldType,			Yield) 
	VALUES		('BUILDING_SHWEDAGON',	'SPECIALIST_ARTIST',	'YIELD_FAITH',		2);

	INSERT INTO Building_ThemingBonuses 
				(BuildingType,			Description,									Bonus,	MustBeArtifact,	RequiresUniquePlayers,	ConsecutiveEras,	AIPriority)
	VALUES		('BUILDING_SHWEDAGON',	'TXT_KEY_THEMING_BONUS_SHWEDAGON_KALPA',		40,		1,				1,						1,					7),
				('BUILDING_SHWEDAGON',	'TXT_KEY_THEMING_BONUS_SHWEDAGON_CONSECUTIVE',	32,		1,				0,						1,					6),
				('BUILDING_SHWEDAGON',	'TXT_KEY_THEMING_BONUS_SHWEDAGON_PLAYERS',		24,		1,				1,						0,					6),
				('BUILDING_SHWEDAGON',	'TXT_KEY_THEMING_BONUS_SHWEDAGON_ARTIFACTS',	20,		1,				0,						0,					5);
				
	INSERT INTO Building_GreatWorkYieldChanges
				(BuildingType,			YieldType,		Yield) 
	VALUES		('BUILDING_SHWEDAGON',	'YIELD_GOLD',	1);
	
	INSERT INTO Building_ThemingYieldBonus 
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_SHWEDAGON',	'YIELD_CULTURE',	5),
				('BUILDING_SHWEDAGON',	'YIELD_FAITH',		5),
				('BUILDING_SHWEDAGON',	'YIELD_GOLD',		5),
				('BUILDING_SHWEDAGON',	'YIELD_TOURISM',	5);
	
	INSERT INTO UnitPromotions 
				(Type,							Description,							Help,										Sound,				CannotBeChosen, LostWithUpgrade,	WorkRateMod,	RivalTerritory,		PortraitIndex,	IconAtlas,						PediaType,			PediaEntry) 
	VALUES		('PROMOTION_HIDDEN_ARTIFACTS',	'TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS',	'TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS_HELP',	'AS2D_IF_LEVELUP',	1,				0,					20,				1,					11,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_CIVILIAN',	'TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS');

	INSERT INTO UnitPromotions_UnitCombats
				(PromotionType,					UnitCombatType)
	VALUES		('PROMOTION_HIDDEN_ARTIFACTS',	'UNITCOMBAT_ARCHAEOLOGIST');
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_SHWEDAGON',	'FLAVOR_CULTURE',		50),
				('BUILDING_SHWEDAGON',	'FLAVOR_GREAT_PEOPLE',	40),
				('BUILDING_SHWEDAGON',	'FLAVOR_GOLD',			20),
				('BUILDING_SHWEDAGON',	'FLAVOR_RELIGION',		40);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MONT SAINT-MICHEL (NEW)
	UPDATE Buildings SET Cost = 500, PrereqTech = 'TECH_GUILDS', NumPoliciesNeeded = 8, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_MICHEL';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_MICHEL';
	---------------------------------------------------------
	-- + OneTileCity (lua) (ALL)
	---------------------------------------------------------
	UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_MONASTERY', ExtraCityHitPoints = 200, Defense = 1000, EnhancedYieldTech = 'TECH_ELECTRICITY' WHERE Type = 'BUILDING_MICHEL';

	INSERT INTO Building_TechEnhancedYieldChanges
				(BuildingType,		YieldType,			Yield) 
	VALUES		('BUILDING_MICHEL',	'YIELD_TOURISM',	3),
				('BUILDING_MICHEL',	'YIELD_GOLD',		3);

	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,					Yield) 
	VALUES		('BUILDING_MICHEL',	'YIELD_GOLD',				2),
				('BUILDING_MICHEL',	'YIELD_GOLDEN_AGE_POINTS',	2);
	
	INSERT INTO Building_YieldChangesPerPop 
				(BuildingType,		YieldType,		Yield) 
	VALUES		('BUILDING_MICHEL', 'YIELD_FAITH',	40);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,				Flavor) 
	VALUES		('BUILDING_MICHEL', 'FLAVOR_GOLD',			40),
				('BUILDING_MICHEL', 'FLAVOR_HAPPINESS',		20),
				('BUILDING_MICHEL', 'FLAVOR_RELIGION',		30),
				('BUILDING_MICHEL', 'FLAVOR_CITY_DEFENSE',	10),
				('BUILDING_MICHEL', 'FLAVOR_CULTURE',		10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- BUYUK HAN (NEW)
	UPDATE Buildings SET Cost = 500, PrereqTech = 'TECH_GUILDS', NumPoliciesNeeded = 8, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_BUYUK_HAN';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_BUYUK_HAN';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */ Flat = 1 WHERE Type = 'BUILDING_BUYUK_HAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + Village(1) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_CARAVANSARY', EnhancedYieldTech = 'TECH_CORPORATIONS' WHERE Type = 'BUILDING_BUYUK_HAN';

	INSERT INTO Building_TechEnhancedYieldChanges
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_BUYUK_HAN',	'YIELD_PRODUCTION',	2),
				('BUILDING_BUYUK_HAN',	'YIELD_GOLD',		3);

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,				Yield) 
	VALUES		('BUILDING_BUYUK_HAN',	'YIELD_FOOD',			1),
				('BUILDING_BUYUK_HAN',	'YIELD_PRODUCTION',		1),
				('BUILDING_BUYUK_HAN',	'YIELD_GOLD',			2),
				('BUILDING_BUYUK_HAN',	'YIELD_FAITH',			1);
	
	INSERT INTO Building_ImprovementYieldChangesGlobal
				(BuildingType,			ImprovementType,			YieldType,			Yield) 
	VALUES		('BUILDING_BUYUK_HAN',	'IMPROVEMENT_TRADING_POST',	'YIELD_PRODUCTION',	2);

	INSERT INTO Building_FreeUnits
				(BuildingType,			UnitType,			NumUnits) 
	VALUES		('BUILDING_BUYUK_HAN',	'UNIT_CARAVAN',		1);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor) 
	VALUES		('BUILDING_BUYUK_HAN',	'FLAVOR_GOLD',			50),
				('BUILDING_BUYUK_HAN',	'FLAVOR_PRODUCTION',	50),
				('BUILDING_BUYUK_HAN',	'FLAVOR_RELIGION',		10),
				('BUILDING_BUYUK_HAN',	'FLAVOR_GROWTH',		10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- ITSUKUSHIMA SHRINE (NEW)
	UPDATE Buildings SET Cost = 500, PrereqTech = 'TECH_COMPASS', NumPoliciesNeeded = 8, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_ITSUKUSHIMA';
	UPDATE Buildings SET WonderSplashAnchor = 'R,C' WHERE Type = 'BUILDING_ITSUKUSHIMA';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_ITSUKUSHIMA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));

	-- luxury sea resources
	INSERT INTO Building_LocalResourceOrs	(BuildingType,			ResourceType)
	SELECT DISTINCT							'BUILDING_ITSUKUSHIMA',	Type
	FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY' AND SeaResource = 1;

	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,			ResourceType) 
	SELECT		'BUILDING_ITSUKUSHIMA',	'RESOURCE_CORAL'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_ITSUKUSHIMA',	'RESOURCE_CRAB'		WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_ITSUKUSHIMA',	'RESOURCE_PEARLS'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_ITSUKUSHIMA',	'RESOURCE_WHALE'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET PlotCultureCostModifier = -50 WHERE Type = 'BUILDING_ITSUKUSHIMA_DUMMY';

	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,			Yield)
	VALUES		('BUILDING_ITSUKUSHIMA',	'YIELD_CULTURE',	2);

	-- luxury sea resources
	INSERT INTO Building_ResourceYieldChanges	(BuildingType,				ResourceType,		YieldType,		Yield)
	SELECT DISTINCT								'BUILDING_ITSUKUSHIMA',		Type,				'YIELD_FAITH',	2
	FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY' AND SeaResource = 1;

	INSERT INTO Building_ImprovementYieldChangesGlobal 
				(BuildingType,				ImprovementType,				YieldType,		Yield) 
	VALUES		('BUILDING_ITSUKUSHIMA',	'IMPROVEMENT_FISHING_BOATS',	'YIELD_CULTURE',	1);

	INSERT INTO Building_SeaPlotYieldChanges 
				(BuildingType,				YieldType,		Yield) 
	VALUES		('BUILDING_ITSUKUSHIMA',	'YIELD_FAITH',	1);
	
	INSERT INTO Building_FeatureYieldChanges
				(BuildingType,					FeatureType,		YieldType,			Yield) 
	VALUES		('BUILDING_ITSUKUSHIMA_DUMMY',	'FEATURE_ATOLL',	'YIELD_CULTURE',	1),
				('BUILDING_ITSUKUSHIMA_DUMMY',	'FEATURE_ATOLL',	'YIELD_FOOD',		1),
				('BUILDING_ITSUKUSHIMA_DUMMY',	'FEATURE_ATOLL',	'YIELD_FAITH',		1);

	-- + increased_border_growth_in_coastal_cities (lua)
	-- + boost_in_coastal_cities_to_atolls (lua)
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,					Flavor) 
	VALUES		('BUILDING_ITSUKUSHIMA',	'FLAVOR_CULTURE',			60),
				('BUILDING_ITSUKUSHIMA',	'FLAVOR_RELIGION',			60),
				('BUILDING_ITSUKUSHIMA',	'FLAVOR_TILE_IMPROVEMENT',	20),
				('BUILDING_ITSUKUSHIMA',	'FLAVOR_EXPANSION',			10),
				('BUILDING_ITSUKUSHIMA',	'FLAVOR_GROWTH',			10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- QALHAT (NEW)
	UPDATE Buildings SET Cost = 500, PrereqTech = 'TECH_COMPASS', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_QALHAT';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_QALHAT';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_QALHAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,		ResourceType) 
	SELECT		'BUILDING_QALHAT',	'RESOURCE_HORSE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------
	UPDATE Buildings SET NumTradeRouteBonus = 1, TradeRouteSeaGoldBonus = 100 WHERE Type = 'BUILDING_QALHAT';

	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,			Yield)
	VALUES		('BUILDING_QALHAT',			'YIELD_GOLD',		3),
				('BUILDING_QALHAT_DUMMY',	'YIELD_CULTURE',	3);

	INSERT INTO Building_ResourceYieldChanges
				(BuildingType,		ResourceType,		YieldType,		Yield) 
	VALUES		('BUILDING_QALHAT',	'RESOURCE_HORSE',	'YIELD_GOLD',	2);

	INSERT INTO Building_UnitCombatProductionModifiers 	
				(BuildingType,		UnitCombatType,		Modifier) 
	VALUES		('BUILDING_QALHAT', 'UNITCOMBAT_CARGO',	50);

	-- + culture_for_each_sea_trade_route_to_other_major_civ (lua)
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,					Flavor) 
	VALUES		('BUILDING_QALHAT',	'FLAVOR_CULTURE',			30),
				('BUILDING_QALHAT',	'FLAVOR_GOLD',				50),
				('BUILDING_QALHAT',	'FLAVOR_I_SEA_TRADE_ROUTE',	60),
				('BUILDING_QALHAT',	'FLAVOR_PRODUCTION',		10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- NOTRE DAME
	UPDATE Buildings SET HolyCity = 0, NumPoliciesNeeded = 0, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_NOTRE_DAME';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_NOTRE_DAME';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1, Flat = 1 WHERE Type = 'BUILDING_NOTRE_DAME' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_NOTRE_DAME' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- KRAK DES CHEVALIERS (NEW)
	UPDATE Buildings SET Cost = 500, PrereqTech = 'TECH_MACHINERY', NumPoliciesNeeded = 7, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_CHEVALIERS';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_CHEVALIERS';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */Hill = 1, IsNoWater = 1 WHERE Type = 'BUILDING_CHEVALIERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET /*IsNoCoast = 1, */Hill = 1 WHERE Type = 'BUILDING_CHEVALIERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------
	UPDATE Buildings SET Defense = 2000, CitySupplyFlat = 1 WHERE Type = 'BUILDING_CHEVALIERS';
	UPDATE Buildings SET Defense = 500, CitySupplyFlat = 1 WHERE Type = 'BUILDING_CHEVALIERS_DUMMY';

	INSERT INTO Building_YieldChanges 
				(BuildingType,					YieldType,						Yield)
	VALUES		('BUILDING_CHEVALIERS',			'YIELD_FOOD',					2),
				('BUILDING_CHEVALIERS',			'YIELD_FAITH',					1),
				('BUILDING_CHEVALIERS',			'YIELD_GREAT_GENERAL_POINTS',	1),
				('BUILDING_CHEVALIERS_DUMMY',	'YIELD_FAITH',					1);

	INSERT INTO Building_UnitCombatProductionModifiers 	
				(BuildingType,			UnitCombatType,			Modifier) 
	VALUES		('BUILDING_CHEVALIERS', 'UNITCOMBAT_MOUNTED',	20),
				('BUILDING_CHEVALIERS', 'UNITCOMBAT_SIEGE',		20);

	INSERT INTO Building_FreeUnits 
				(BuildingType,			UnitType,				NumUnits)
	VALUES		('BUILDING_CHEVALIERS', 'UNIT_GREAT_GENERAL',	1);

	-- + bonuses_in_non-coastal_cities (lua)
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_CHEVALIERS', 'FLAVOR_CITY_DEFENSE',	60),
				('BUILDING_CHEVALIERS', 'FLAVOR_OFFENSE',		30),
				('BUILDING_CHEVALIERS', 'FLAVOR_RELIGION',		20),
				('BUILDING_CHEVALIERS', 'FLAVOR_PRODUCTION',	20),
				('BUILDING_CHEVALIERS', 'FLAVOR_GROWTH',		10);
--============================================--
-- RENAISSANCE ERA
--============================================--
-- AIT BENHADDOU (NEW)
	UPDATE Buildings SET Cost = 700, PrereqTech = 'TECH_BANKING', NumPoliciesNeeded = 9, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_BENHADDOU';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T' WHERE Type = 'BUILDING_BENHADDOU';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1, NearbyTerrainRequired = 'TERRAIN_DESERT' WHERE Type = 'BUILDING_BENHADDOU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	--Village(1) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET NumTradeRouteBonus = 1, EnhancedYieldTech = 'TECH_RADIO' WHERE Type = 'BUILDING_BENHADDOU';

	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,			Yield)
	VALUES		('BUILDING_BENHADDOU',		'YIELD_FOOD',		2),
				('BUILDING_BENHADDOU',		'YIELD_GOLD',		2),
				('BUILDING_BENHADDOU',		'YIELD_CULTURE',	2);
				
	INSERT INTO Building_TechEnhancedYieldChanges
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_BENHADDOU',	'YIELD_TOURISM',	4);

	INSERT INTO Building_RiverPlotYieldChanges
				(BuildingType,			YieldType,		Yield) 
	VALUES		('BUILDING_BENHADDOU',	'YIELD_FOOD',	1);
	
	INSERT INTO Building_ImprovementYieldChanges
				(BuildingType,			ImprovementType,			YieldType,			Yield) 
	VALUES		('BUILDING_BENHADDOU',	'IMPROVEMENT_TRADING_POST',	'YIELD_TOURISM',	3),
				('BUILDING_BENHADDOU',	'IMPROVEMENT_TRADING_POST',	'YIELD_GOLD',		3);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_BENHADDOU',	'FLAVOR_CULTURE',		60),
				('BUILDING_BENHADDOU',	'FLAVOR_GROWTH',		30),
				('BUILDING_BENHADDOU',	'FLAVOR_GOLD',			30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- KILWA KISIWANI (NEW)
	UPDATE Buildings SET Cost = 700, PrereqTech = 'TECH_BANKING', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_KILWA_KISIWANI';
	UPDATE Buildings SET WonderSplashAnchor = 'C,B' WHERE Type = 'BUILDING_KILWA_KISIWANI';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_KILWA_KISIWANI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + Mine/Camp(3) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET NumTradeRouteBonus = 2 WHERE Type = 'BUILDING_KILWA_KISIWANI';

	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,			Yield)
	VALUES		('BUILDING_KILWA_KISIWANI',	'YIELD_GOLD',		2);

	INSERT INTO Building_ResourceQuantity
				(BuildingType,				ResourceType,			Quantity) 
	VALUES		('BUILDING_KILWA_KISIWANI',	'RESOURCE_PORCELAIN',	1),
				('BUILDING_KILWA_KISIWANI',	'RESOURCE_JEWELRY',		1);

	INSERT INTO Building_ResourceYieldChanges	(BuildingType,						ResourceType,		YieldType,		Yield) 
	SELECT DISTINCT								'BUILDING_KILWA_KISIWANI_DUMMY',	Type,				'YIELD_GOLD',	1
	FROM Resources WHERE ResourceUsage = 2;

	INSERT INTO Building_ResourceYieldChanges	(BuildingType,						ResourceType,		YieldType,			Yield) 
	SELECT DISTINCT								'BUILDING_KILWA_KISIWANI_DUMMY',	Type,				'YIELD_PRODUCTION',	1
	FROM Resources WHERE ResourceUsage = 1;
	
	-- +production_gold_to_local_luxuries_strategics (lua)
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,				Flavor)
	VALUES		('BUILDING_KILWA_KISIWANI',	'FLAVOR_GOLD',			60),
				('BUILDING_KILWA_KISIWANI',	'FLAVOR_PRODUCTION',	20),
				('BUILDING_KILWA_KISIWANI',	'FLAVOR_HAPPINESS',		40);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- GLOBE THEATER
	UPDATE Buildings SET Cost = 700 WHERE Type = 'BUILDING_GLOBE_THEATER';
	UPDATE Buildings SET MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_GLOBE_THEATER';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_GLOBE_THEATER';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_GLOBE_THEATER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,				BuildingClassType) 
	SELECT		'BUILDING_GLOBE_THEATER',	'BUILDINGCLASS_BATH'		 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_GLOBE_THEATER',	'BUILDINGCLASS_AMPHITHEATER' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- ST. PETER'S BASILICA (NEW)
	UPDATE Buildings SET Cost = 700, PrereqTech = 'TECH_PRINTING_PRESS', NumPoliciesNeeded = 10, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_ST_PETERS';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_ST_PETERS';
	---------------------------------------------------------
	UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_CATHEDRAL', ExtraLeagueVotes = 6 WHERE Type = 'BUILDING_ST_PETERS';

	INSERT INTO Building_YieldChanges 
				(BuildingType,					YieldType,			Yield)
	VALUES		('BUILDING_ST_PETERS',			'YIELD_FAITH',		4),
				('BUILDING_ST_PETERS',			'YIELD_CULTURE',	1);

	INSERT INTO Building_FreeUnits 
				(BuildingType,			UnitType,				NumUnits)
	VALUES		('BUILDING_ST_PETERS', 'UNIT_INQUISITOR',		3);

	INSERT INTO Building_BuildingClassHappiness (BuildingType,				BuildingClassType,	Happiness)
	SELECT DISTINCT								'BUILDING_ST_PETERS_DUMMY',	BuildingClass,		1
	FROM Buildings WHERE Cost = -1 and FaithCost > 0 AND WonderSplashImage IS NULL;
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_ST_PETERS',	'FLAVOR_RELIGION',		60),
				('BUILDING_ST_PETERS',	'FLAVOR_PRODUCTION',	20),
				('BUILDING_ST_PETERS',	'FLAVOR_HAPPINESS',		40),
				('BUILDING_ST_PETERS',	'FLAVOR_DIPLOMACY',		10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- CHICHEN ITZA
	UPDATE Buildings SET Cost = 700 WHERE Type = 'BUILDING_CHICHEN_ITZA';
	UPDATE Buildings SET MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_CHICHEN_ITZA';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_CHICHEN_ITZA';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1, NearbyTerrainRequired = 'TERRAIN_PLAINS' WHERE Type = 'BUILDING_CHICHEN_ITZA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,				FeatureType) 
	SELECT		'BUILDING_CHICHEN_ITZA',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- GOLDEN PAVILION (NEW)
	UPDATE Buildings SET Cost = 700, PrereqTech = 'TECH_ASTRONOMY', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_KINKAKU_JI';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_KINKAKU_JI';
	---------------------------------------------------------
	UPDATE Buildings SET FreshWater = 1 WHERE Type = 'BUILDING_KINKAKU_JI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,				FeatureType) 
	SELECT		'BUILDING_KINKAKU_JI',		'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_KINKAKU_JI',		'FEATURE_JUNGLE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_PAGODA', GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 1 WHERE Type = 'BUILDING_KINKAKU_JI';

	INSERT INTO Building_YieldChanges 
				(BuildingType,					YieldType,			Yield)
	VALUES		('BUILDING_KINKAKU_JI',			'YIELD_FAITH',		3),
				('BUILDING_KINKAKU_JI',			'YIELD_CULTURE',	2);

	INSERT INTO Building_LakePlotYieldChanges 
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_KINKAKU_JI',	'YIELD_CULTURE',	1),
				('BUILDING_KINKAKU_JI',	'YIELD_FAITH',		1),
				('BUILDING_KINKAKU_JI',	'YIELD_FOOD',		1);
	
	INSERT INTO Building_FeatureYieldChanges
				(BuildingType,			FeatureType,			YieldType,				Yield) 
	VALUES		('BUILDING_KINKAKU_JI',	'FEATURE_FOREST',		'YIELD_CULTURE',		1),
				('BUILDING_KINKAKU_JI',	'FEATURE_FOREST',		'YIELD_FAITH',			1),
				('BUILDING_KINKAKU_JI',	'FEATURE_JUNGLE',		'YIELD_CULTURE',		1),
				('BUILDING_KINKAKU_JI',	'FEATURE_JUNGLE',		'YIELD_FAITH',			1);

	INSERT INTO Building_RiverPlotYieldChanges
				(BuildingType,			YieldType,		Yield) 
	VALUES		('BUILDING_KINKAKU_JI',	'YIELD_FOOD',	1);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_KINKAKU_JI',	'FLAVOR_RELIGION',		50),
				('BUILDING_KINKAKU_JI',	'FLAVOR_CULTURE',		50),
				('BUILDING_KINKAKU_JI',	'FLAVOR_GROWTH',		40);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MARAE ARAHURAHU (NEW)
	UPDATE Buildings SET Cost = 700, PrereqTech = 'TECH_ASTRONOMY', NumPoliciesNeeded = 10, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_MARAE';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_MARAE';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10, NearbyTerrainRequired = 'TERRAIN_GRASS' WHERE Type = 'BUILDING_MARAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_MARAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,		BuildingClassType) 
	SELECT		'BUILDING_MARAE',	'BUILDINGCLASS_GARDEN' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET FreePromotion = 'PROMOTION_MARAE', GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC', GreatWorkCount = 2, ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_MARAE_HELP', SpecialistType = 'SPECIALIST_MUSICIAN', GreatPeopleRateChange = 1 WHERE Type = 'BUILDING_MARAE';
	UPDATE Buildings SET FreePromotion = 'PROMOTION_ARAHURAHU' WHERE Type = 'BUILDING_MARAE_DUMMY';

	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,						Yield)
	VALUES		('BUILDING_MARAE',	'YIELD_GREAT_ADMIRAL_POINTS',	1);

	INSERT INTO Building_DomainFreeExperiencePerGreatWork
				(BuildingType,		DomainType,		Experience)
	VALUES		('BUILDING_MARAE',	'DOMAIN_LAND',	15),
				('BUILDING_MARAE',	'DOMAIN_SEA',	15);

	INSERT INTO Building_ThemingBonuses 
				(BuildingType,		Description,					Bonus,	RequiresOwner,	AIPriority)
	VALUES		('BUILDING_MARAE',	'TXT_KEY_THEMING_BONUS_MARAE',	14,		1,				5);

	INSERT INTO Building_ThemingYieldBonus 
				(BuildingType,		YieldType,			Yield) 
	VALUES		('BUILDING_MARAE',	'YIELD_CULTURE',	3),
				('BUILDING_MARAE',	'YIELD_FOOD',		8);
	
	INSERT INTO Building_YieldFromDeath
				(BuildingType,		YieldType,		Yield)
	VALUES		('BUILDING_MARAE',	'YIELD_FAITH',	10);
	
	INSERT INTO UnitPromotions 
				(Type,					Description,					Help,								Sound,				CannotBeChosen, LostWithUpgrade,	AttackMod,	PortraitIndex,	IconAtlas,						PediaType,		PediaEntry) 
	VALUES		('PROMOTION_MARAE',		'TXT_KEY_PROMOTION_MARAE',		'TXT_KEY_PROMOTION_MARAE_HELP',		'AS2D_IF_LEVELUP',	1,				0,					10,			2,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_RANGED', 'TXT_KEY_PROMOTION_MARAE'),
				('PROMOTION_ARAHURAHU',	'TXT_KEY_PROMOTION_ARAHURAHU',	'TXT_KEY_PROMOTION_ARAHURAHU_HELP',	'AS2D_IF_LEVELUP',	1,				0,					0,			3,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_ARAHURAHU');

	INSERT INTO UnitPromotions_UnitCombats
				(PromotionType,			UnitCombatType)
	VALUES		('PROMOTION_MARAE',		'UNITCOMBAT_ARCHER'),
				('PROMOTION_MARAE',		'UNITCOMBAT_GUN'),
				('PROMOTION_ARAHURAHU',	'UNITCOMBAT_ARCHER'),
				('PROMOTION_ARAHURAHU',	'UNITCOMBAT_GUN'),
				('PROMOTION_ARAHURAHU',	'UNITCOMBAT_ARMOR'),
				('PROMOTION_ARAHURAHU',	'UNITCOMBAT_MELEE'),
				('PROMOTION_ARAHURAHU',	'UNITCOMBAT_MOUNTED'),
				('PROMOTION_ARAHURAHU',	'UNITCOMBAT_RECON'),
				('PROMOTION_ARAHURAHU',	'UNITCOMBAT_SIEGE');

	INSERT INTO UnitPromotions_YieldFromKills
				(PromotionType,			YieldType,			Yield)
	VALUES		('PROMOTION_ARAHURAHU',	'YIELD_CULTURE',	120);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_MARAE',		'FLAVOR_RELIGION',		30),
				('BUILDING_MARAE',		'FLAVOR_CULTURE',		60),
				('BUILDING_MARAE',		'FLAVOR_OFFENSE',		30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- HIMEJI CASTLE
	UPDATE Buildings SET Cost = 700 WHERE Type = 'BUILDING_HIMEJI_CASTLE';
	UPDATE Buildings SET MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_HIMEJI_CASTLE';
	UPDATE Buildings SET WonderSplashAnchor = 'C,T' WHERE Type = 'BUILDING_HIMEJI_CASTLE';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1, Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_HIMEJI_CASTLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,				FeatureType) 
	SELECT		'BUILDING_HIMEJI_CASTLE',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- OLD BRIDGE (NEW)
	UPDATE Buildings SET Cost = 700, PrereqTech = 'TECH_GUNPOWDER', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_OLD_BRIDGE';
	UPDATE Buildings SET WonderSplashAnchor = 'L,C' WHERE Type = 'BUILDING_OLD_BRIDGE';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1, Hill = 1 WHERE Type = 'BUILDING_OLD_BRIDGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + Peace (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET Happiness = 1, SpecialistType = 'SPECIALIST_CIVIL_SERVANT', GreatPeopleRateChange = 2, SingleLeagueVotes = 2 WHERE Type = 'BUILDING_OLD_BRIDGE';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_OLD_BRIDGE',	'YIELD_CULTURE',	1);
	
	INSERT INTO Building_FreeUnits 
				(BuildingType,				UnitType,				NumUnits)
	VALUES		('BUILDING_OLD_BRIDGE',		'UNIT_GREAT_DIPLOMAT',	1);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_OLD_BRIDGE',	'FLAVOR_CULTURE',		10),
				('BUILDING_OLD_BRIDGE',	'FLAVOR_GREAT_PEOPLE',	30),
				('BUILDING_OLD_BRIDGE',	'FLAVOR_DIPLOMACY',		60),
				('BUILDING_OLD_BRIDGE',	'FLAVOR_HAPPINESS',		30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- LEANING TOWER OF PISA
	UPDATE Buildings SET Cost = 700 WHERE Type = 'BUILDING_LEANING_TOWER';
	UPDATE Buildings SET NumPoliciesNeeded = 9, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_LEANING_TOWER';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T' WHERE Type = 'BUILDING_LEANING_TOWER';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1, AnyWater = 1 WHERE Type = 'BUILDING_LEANING_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET AnyWater = 1 WHERE Type = 'BUILDING_LEANING_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,				FeatureType) 
	SELECT		'BUILDING_LEANING_TOWER',	'FEATURE_MARSH' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MEENAKSHI TEMPLE (NEW)
	UPDATE Buildings SET Cost = 700, PrereqTech = 'TECH_CHEMISTRY', NumPoliciesNeeded = 9, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_MEENAKSHI';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_MEENAKSHI';
	---------------------------------------------------------
	UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_MANDIR' WHERE Type = 'BUILDING_MEENAKSHI';

	INSERT INTO Building_YieldChanges 
				(BuildingType,					YieldType,			Yield)
	VALUES		('BUILDING_MEENAKSHI',			'YIELD_FOOD',		1),
				('BUILDING_MEENAKSHI',			'YIELD_CULTURE',	2);

	INSERT INTO Building_YieldChangesPerPopInEmpire
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_MEENAKSHI',	'YIELD_FAITH',		25);

	INSERT INTO Building_LakePlotYieldChanges 
				(BuildingType,			YieldType,		Yield)
	VALUES		('BUILDING_MEENAKSHI',	'YIELD_FAITH',	1);	
	
	INSERT INTO Building_RiverPlotYieldChanges
				(BuildingType,			YieldType,		Yield) 
	VALUES		('BUILDING_MEENAKSHI',	'YIELD_FAITH',	1);
	
	INSERT INTO Building_YieldFromFaithPurchase
				(BuildingType,			YieldType,		Yield) 
	VALUES		('BUILDING_MEENAKSHI',	'YIELD_FOOD',	20);
	
	INSERT INTO Building_GreatWorkYieldChanges
				(BuildingType,			YieldType,		Yield) 
	VALUES		('BUILDING_MEENAKSHI',	'YIELD_FOOD',	1);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_MEENAKSHI',	'FLAVOR_GROWTH',		50),
				('BUILDING_MEENAKSHI',	'FLAVOR_RELIGION',		60),
				('BUILDING_MEENAKSHI',	'FLAVOR_CULTURE',		10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- PORCELAIN TOWER
	UPDATE Buildings SET Cost = 850 WHERE Type = 'BUILDING_PORCELAIN_TOWER';
	UPDATE Buildings SET NumPoliciesNeeded = 11, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_PORCELAIN_TOWER';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T' WHERE Type = 'BUILDING_PORCELAIN_TOWER';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_PORCELAIN_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + CS_Ally(2) (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- TAJ MAHAL
	UPDATE Buildings SET Cost = 850 WHERE Type = 'BUILDING_TAJ_MAHAL';
	UPDATE Buildings SET NumPoliciesNeeded = 11, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_TAJ_MAHAL';
	UPDATE Buildings SET WonderSplashImage = 'Wonder_Taj_Mahal_splash.dds' WHERE Type = 'BUILDING_TAJ_MAHAL';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_TAJ_MAHAL';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */Flat = 1, River = 1 WHERE Type = 'BUILDING_TAJ_MAHAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Flat = 1, River = 1 WHERE Type = 'BUILDING_TAJ_MAHAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- UFFIZI
	UPDATE Buildings SET Cost = 850 WHERE Type = 'BUILDING_UFFIZI';
	UPDATE Buildings SET NumPoliciesNeeded = 12, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_UFFIZI';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_UFFIZI';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_UFFIZI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	-- + GW_of_Art(3) (lua)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- PETERHOF (NEW)
	UPDATE Buildings SET Cost = 850, PrereqTech = 'TECH_ECONOMICS', NumPoliciesNeeded = 12, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_PETERHOF';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T' WHERE Type = 'BUILDING_PETERHOF';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1, Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_PETERHOF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_PETERHOF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,			ResourceType) 
	SELECT		'BUILDING_PETERHOF',	'RESOURCE_IRON' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET WLTKDTurns = 20, GreatPeopleRateModifier = 10 WHERE Type = 'BUILDING_PETERHOF';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,					Yield)
	VALUES		('BUILDING_PETERHOF',	'YIELD_GOLDEN_AGE_POINTS',	7);

	INSERT INTO Building_WLTKDYieldMod
				(BuildingType,			YieldType,					Yield)
	VALUES		('BUILDING_PETERHOF',	'YIELD_GOLDEN_AGE_POINTS',	25),
				('BUILDING_PETERHOF',	'YIELD_GOLD',				15),
				('BUILDING_PETERHOF',	'YIELD_PRODUCTION',			15);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_PETERHOF',	'FLAVOR_GOLD',			40),
				('BUILDING_PETERHOF',	'FLAVOR_PRODUCTION',	40),
				('BUILDING_PETERHOF',	'FLAVOR_HAPPINESS',		40),
				('BUILDING_PETERHOF',	'FLAVOR_GREAT_PEOPLE',	20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- BAKKEN (NEW)
	UPDATE Buildings SET Cost = 850, PrereqTech = 'TECH_ECONOMICS', NumPoliciesNeeded = 12, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_BAKKEN';
	UPDATE Buildings SET WonderSplashAnchor = 'C,T' WHERE Type = 'BUILDING_BAKKEN';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1 WHERE Type = 'BUILDING_BAKKEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	-- + Happiness(70) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET Happiness = 3, WLTKDTurns = 10 WHERE Type = 'BUILDING_BAKKEN';

	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,			Yield)
	VALUES		('BUILDING_BAKKEN',	'YIELD_GOLD',		2),
				('BUILDING_BAKKEN',	'YIELD_CULTURE',	1),
				('BUILDING_BAKKEN',	'YIELD_TOURISM',	3);
	
	INSERT INTO Building_WLTKDYieldMod
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_BAKKEN',		'YIELD_TOURISM',	33);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_BAKKEN',	'FLAVOR_CULTURE',		10),
				('BUILDING_BAKKEN',	'FLAVOR_HAPPINESS',		80),
				('BUILDING_BAKKEN',	'FLAVOR_GOLD',			20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- SISTINE CHAPEL
	UPDATE Buildings SET Cost = 850 WHERE Type = 'BUILDING_SISTINE_CHAPEL';
	UPDATE Buildings SET NumPoliciesNeeded = 13, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_SISTINE_CHAPEL';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_SISTINE_CHAPEL';
	---------------------------------------------------------
	-- + Founded_Religion (lua) (HARD)
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,				BuildingClassType) 
	SELECT		'BUILDING_SISTINE_CHAPEL',	'BUILDINGCLASS_ARTISTS_GUILD' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- SUMMER PALACE
	UPDATE Buildings SET Cost = 850 WHERE Type = 'BUILDING_SUMMER_PALACE';
	UPDATE Buildings SET NumPoliciesNeeded = 13, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_SUMMER_PALACE';
	UPDATE Buildings SET WonderSplashAnchor = 'C,T' WHERE Type = 'BUILDING_SUMMER_PALACE';
	---------------------------------------------------------
	UPDATE Buildings SET FreshWater = 1, Water = 1, MinAreaSize = 1, Hill = 1 WHERE Type = 'BUILDING_SUMMER_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,				FeatureType) 
	SELECT		'BUILDING_SUMMER_PALACE',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- HOUSE OF TRADE OF THE INDIES (NEW)
	UPDATE Buildings SET Cost = 850, PrereqTech = 'TECH_NAVIGATION', NumPoliciesNeeded = 12, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_HOUSE_OF_TRADE';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_HOUSE_OF_TRADE';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_HOUSE_OF_TRADE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + CSAlly(2) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET NumTradeRouteBonus = 2, SpecialistType = 'SPECIALIST_MERCHANT', GreatPeopleRateChange = 2 WHERE Type = 'BUILDING_HOUSE_OF_TRADE';

	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,						Yield)
	VALUES		('BUILDING_HOUSE_OF_TRADE',	'YIELD_GOLD',					2),
				('BUILDING_HOUSE_OF_TRADE',	'YIELD_GREAT_ADMIRAL_POINTS',	1);
	
	INSERT INTO Building_FreeUnits 
				(BuildingType,					UnitType,				NumUnits)
	VALUES		('BUILDING_HOUSE_OF_TRADE',		'UNIT_GREAT_ADMIRAL',	1);
	
	INSERT INTO Building_UnitCombatProductionModifiers 	
				(BuildingType,				UnitCombatType,				Modifier) 
	VALUES		('BUILDING_HOUSE_OF_TRADE',	'UNITCOMBAT_NAVALMELEE',	10),
				('BUILDING_HOUSE_OF_TRADE',	'UNITCOMBAT_NAVALRANGED',	10),
				('BUILDING_HOUSE_OF_TRADE',	'UNITCOMBAT_SUBMARINE',		10),
				('BUILDING_HOUSE_OF_TRADE',	'UNITCOMBAT_CARRIER',		10),
				('BUILDING_HOUSE_OF_TRADE',	'UNITCOMBAT_CARGO',			10);	
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,				Flavor)
	VALUES		('BUILDING_HOUSE_OF_TRADE',	'FLAVOR_GOLD',			60),
				('BUILDING_HOUSE_OF_TRADE',	'FLAVOR_GREAT_PEOPLE',	30),
				('BUILDING_HOUSE_OF_TRADE',	'FLAVOR_NAVAL',			20),
				('BUILDING_HOUSE_OF_TRADE',	'FLAVOR_PRODUCTION',	10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- SOLOVIETSKY MONASTERY (NEW)
	UPDATE Buildings SET Cost = 850, PrereqTech = 'TECH_NAVIGATION', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_SOLOVIETSKY';
	UPDATE Buildings SET WonderSplashAnchor = 'R,C' WHERE Type = 'BUILDING_SOLOVIETSKY';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10, NearbyTerrainRequired = 'TERRAIN_TUNDRA' WHERE Type = 'BUILDING_SOLOVIETSKY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_TUNDRA' WHERE Type = 'BUILDING_SOLOVIETSKY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------
	UPDATE Buildings SET ExtraCityHitPoints = 50, Defense = 1000, CitySupplyFlat = 1 WHERE Type = 'BUILDING_SOLOVIETSKY';

	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,					Yield)
	VALUES		('BUILDING_SOLOVIETSKY',	'YIELD_PRODUCTION',			1),
				('BUILDING_SOLOVIETSKY',	'YIELD_GOLDEN_AGE_POINTS',	1),
				('BUILDING_SOLOVIETSKY',	'YIELD_FAITH',				1);

	INSERT INTO Building_TerrainYieldChanges
				(BuildingType,				TerrainType,			YieldType,				Yield) 
	VALUES		('BUILDING_SOLOVIETSKY',	'TERRAIN_TUNDRA',		'YIELD_PRODUCTION',		1),
				('BUILDING_SOLOVIETSKY',	'TERRAIN_TUNDRA',		'YIELD_FAITH',			1);

	INSERT INTO Building_UnitCombatProductionModifiers 	
				(BuildingType,				UnitCombatType,				Modifier) 
	VALUES		('BUILDING_SOLOVIETSKY',	'UNITCOMBAT_NAVALMELEE',	15),
				('BUILDING_SOLOVIETSKY',	'UNITCOMBAT_NAVALRANGED',	15),
				('BUILDING_SOLOVIETSKY',	'UNITCOMBAT_SUBMARINE',		15),
				('BUILDING_SOLOVIETSKY',	'UNITCOMBAT_CARRIER',		15);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,					Flavor)
	VALUES		('BUILDING_SOLOVIETSKY',	'FLAVOR_PRODUCTION',	60),
				('BUILDING_SOLOVIETSKY',	'FLAVOR_RELIGION',		30),
				('BUILDING_SOLOVIETSKY',	'FLAVOR_OFFENSE',		10),
				('BUILDING_SOLOVIETSKY',	'FLAVOR_CITY_DEFENSE',	30),
				('BUILDING_SOLOVIETSKY',	'FLAVOR_NAVAL',			30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- RED FORT
	UPDATE Buildings SET Cost = 850 WHERE Type = 'BUILDING_RED_FORT';
	UPDATE Buildings SET MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_RED_FORT';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_RED_FORT';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */River = 1 WHERE Type = 'BUILDING_RED_FORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_RED_FORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- AQUEDUCT OF PADRE TEMBLEQUE (NEW)
	UPDATE Buildings SET Cost = 850, PrereqTech = 'TECH_METALLURGY', NumPoliciesNeeded = 11, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_TEMBLEQUE';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_TEMBLEQUE';
	---------------------------------------------------------
	UPDATE Buildings SET  /*IsNoCoast = 1, */ FreshWater = 1, NearbyTerrainRequired = 'TERRAIN_DESERT' WHERE Type = 'BUILDING_TEMBLEQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET  FreshWater = 1 WHERE Type = 'BUILDING_TEMBLEQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------
	UPDATE Buildings SET DistressFlatReduction = 1 WHERE Type = 'BUILDING_TEMBLEQUE';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_TEMBLEQUE',	'YIELD_FOOD',		2),
				('BUILDING_TEMBLEQUE',	'YIELD_PRODUCTION',	1),
				('BUILDING_TEMBLEQUE',	'YIELD_FAITH',		1);

	INSERT INTO Building_TerrainYieldChanges
				(BuildingType,			TerrainType,			YieldType,			Yield) 
	VALUES		('BUILDING_TEMBLEQUE',	'TERRAIN_DESERT',		'YIELD_FOOD',		1);

	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,			BuildingClassType,			YieldType,			YieldChange) 
	VALUES		('BUILDING_TEMBLEQUE',	'BUILDINGCLASS_AQUEDUCT',	'YIELD_PRODUCTION',	1),
				('BUILDING_TEMBLEQUE',	'BUILDINGCLASS_AQUEDUCT',	'YIELD_FAITH',		1);

	INSERT INTO Building_YieldFromFaithPurchase
				(BuildingType,					YieldType,			Yield)
	VALUES		('BUILDING_TEMBLEQUE_DUMMY',	'YIELD_PRODUCTION',	5);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_TEMBLEQUE',	'FLAVOR_GROWTH',		60),
				('BUILDING_TEMBLEQUE',	'FLAVOR_PRODUCTION',	40),
				('BUILDING_TEMBLEQUE',	'FLAVOR_RELIGION',		20),
				('BUILDING_TEMBLEQUE',	'FLAVOR_HAPPINESS',		30);
--============================================--
-- INDUSTRIAL ERA
--============================================--
-- MUSEUM ISLAND (NEW)
	UPDATE Buildings SET Cost = 1100, PrereqTech = 'TECH_SCIENTIFIC_THEORY', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_MUSEUM_ISLAND';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_MUSEUM_ISLAND';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_MUSEUM_ISLAND' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + GW_of_Art(4) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_MUSEUM', GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 4, ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_HELP' WHERE Type = 'BUILDING_MUSEUM_ISLAND';

	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,			Yield)
	VALUES		('BUILDING_MUSEUM_ISLAND',	'YIELD_CULTURE',	4),
				('BUILDING_MUSEUM_ISLAND',	'YIELD_TOURISM',	3);

	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,				BuildingClassType,		YieldType,			YieldChange) 
	VALUES		('BUILDING_MUSEUM_ISLAND',	'BUILDINGCLASS_MUSEUM',	'YIELD_TOURISM',	2);

	INSERT INTO Building_SpecificGreatPersonRateModifier 
				(BuildingType,						SpecialistType,			Modifier)
	VALUES		('BUILDING_MUSEUM_ISLAND_DUMMY',	'SPECIALIST_ARTIST',	50);

	INSERT INTO Building_ThemingBonuses 
				(BuildingType,				Description,										Bonus,	MustBeArt,	UniqueEras,	RequiresAnyButOwner,	AIPriority)
	VALUES		('BUILDING_MUSEUM_ISLAND',	'TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_COMPOSITION',	30,		1,			1,			1,						8),
				('BUILDING_MUSEUM_ISLAND',	'TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_ERAS',			24,		1,			1,			0,						7),
				('BUILDING_MUSEUM_ISLAND',	'TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_OTHERS',		20,		1,			0,			1,						6),
				('BUILDING_MUSEUM_ISLAND',	'TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_ART',			12,		1,			0,			0,						5);
				
	INSERT INTO Building_ThemingYieldBonus 
				(BuildingType,				YieldType,			Yield) 
	VALUES		('BUILDING_MUSEUM_ISLAND',	'YIELD_CULTURE',	5),
				('BUILDING_MUSEUM_ISLAND',	'YIELD_SCIENCE',	5),
				('BUILDING_MUSEUM_ISLAND',	'YIELD_TOURISM',	5);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,			Flavor)
	VALUES		('BUILDING_MUSEUM_ISLAND',	'FLAVOR_CULTURE',	100),
				('BUILDING_MUSEUM_ISLAND',	'FLAVOR_SCIENCE',	10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- SIKU QUANSHU (NEW)
	UPDATE Buildings SET Cost = 1100, PrereqTech = 'TECH_SCIENTIFIC_THEORY', NumPoliciesNeeded = 13, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_SIKU_QUANSHU';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_SIKU_QUANSHU';
	---------------------------------------------------------
	-- + GW_of_Literature(4) (lua) (HARD)
	-- + Cities(7) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET IlliteracyFlatReduction = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 4, SpecialistType = 'SPECIALIST_WRITER', SpecialistCount = 2, ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_HELP' WHERE Type = 'BUILDING_SIKU_QUANSHU';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,			Yield)
	VALUES		('BUILDING_SIKU_QUANSHU',	'YIELD_SCIENCE',	1);

	INSERT INTO Building_SpecialistYieldChanges
				(BuildingType,				SpecialistType,			YieldType,			Yield) 
	VALUES		('BUILDING_SIKU_QUANSHU',	'SPECIALIST_WRITER',	'YIELD_SCIENCE',	2);

	INSERT INTO Building_GreatWorkYieldChanges
				(BuildingType,				YieldType,			Yield) 
	VALUES		('BUILDING_SIKU_QUANSHU',	'YIELD_SCIENCE',	1),
				('BUILDING_SIKU_QUANSHU',	'YIELD_CULTURE',	1);
	
	INSERT INTO Building_ThemingBonuses 
				(BuildingType,				Description,										Bonus,	UniqueEras,	RequiresOwner,	AIPriority)
	VALUES		('BUILDING_SIKU_QUANSHU',	'TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_COMPOSITION',	34,		1,			1,				8),
				('BUILDING_SIKU_QUANSHU',	'TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_ERAS',			28,		1,			0,				7),
				('BUILDING_SIKU_QUANSHU',	'TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_OWNER',			22,		0,			1,				6),
				('BUILDING_SIKU_QUANSHU',	'TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_WRITINGS',		14,		0,			0,				5);
				
	INSERT INTO Building_ThemingYieldBonus 
				(BuildingType,				YieldType,			Yield) 
	VALUES		('BUILDING_SIKU_QUANSHU',	'YIELD_CULTURE',	10),
				('BUILDING_SIKU_QUANSHU',	'YIELD_SCIENCE',	10);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,			Flavor)
	VALUES		('BUILDING_SIKU_QUANSHU',	'FLAVOR_CULTURE',	60),
				('BUILDING_SIKU_QUANSHU',	'FLAVOR_SCIENCE',	50);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- NESCHWANSTEIN
	UPDATE Buildings SET Cost = 1100 WHERE Type = 'BUILDING_NEUSCHWANSTEIN';
	UPDATE Buildings SET NumPoliciesNeeded = 14 WHERE Type = 'BUILDING_NEUSCHWANSTEIN';
	UPDATE Buildings SET MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_NEUSCHWANSTEIN';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T' WHERE Type = 'BUILDING_NEUSCHWANSTEIN';
	---------------------------------------------------------
	UPDATE Buildings SET FreshWater = 1, NearbyMountainRequired = 1 WHERE Type = 'BUILDING_NEUSCHWANSTEIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET NearbyMountainRequired = 1 WHERE Type = 'BUILDING_NEUSCHWANSTEIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- BROOKLYN BRIDGE (NEW)
	UPDATE Buildings SET Cost = 1100, PrereqTech = 'TECH_RAILROAD', NumPoliciesNeeded = 14, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_BROOKLYN';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_BROOKLYN';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10, River = 1 WHERE Type = 'BUILDING_BROOKLYN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + IsHasCitizens(25) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET NumTradeRouteBonus = 1, MinorFriendshipChange = 100 WHERE Type = 'BUILDING_BROOKLYN';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_BROOKLYN',	'YIELD_CULTURE',	2),
				('BUILDING_BROOKLYN',	'YIELD_TOURISM',	4),
				('BUILDING_BROOKLYN',	'YIELD_PRODUCTION',	1);

	INSERT INTO Building_FreeUnits 
				(BuildingType,			UnitType,				NumUnits)
	VALUES		('BUILDING_BROOKLYN',	'UNIT_GREAT_DIPLOMAT',	1);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,			Flavor)
	VALUES		('BUILDING_BROOKLYN',	'FLAVOR_GOLD',		10),
				('BUILDING_BROOKLYN',	'FLAVOR_CULTURE',	10),
				('BUILDING_BROOKLYN',	'FLAVOR_DIPLOMACY',	60);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- TRANS_SIBERIAN RAILWAY (NEW)
	UPDATE Buildings SET Cost = 1100, PrereqTech = 'TECH_RAILROAD', NumPoliciesNeeded = 14, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_SIBERIAN_RAILWAY';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_SIBERIAN_RAILWAY';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */NearbyTerrainRequired = 'TERRAIN_TUNDRA' WHERE Type = 'BUILDING_SIBERIAN_RAILWAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_TUNDRA' WHERE Type = 'BUILDING_SIBERIAN_RAILWAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,					BuildingClassType) 
	SELECT		'BUILDING_SIBERIAN_RAILWAY',	'BUILDINGCLASS_COALING_STATION' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET FreePromotion = 'PROMOTION_SIBERIAN_RAILWAY', WorkerSpeedModifier = 25, CityConnectionTradeRouteModifier = 15 WHERE Type = 'BUILDING_SIBERIAN_RAILWAY';

	INSERT INTO Building_ResourceYieldChangesGlobal
				(BuildingType,					ResourceType,			YieldType,						Yield) 
	VALUES		('BUILDING_SIBERIAN_RAILWAY',	'RESOURCE_COAL',		'YIELD_GOLDEN_AGE_POINTS',		5),
				('BUILDING_SIBERIAN_RAILWAY',	'RESOURCE_OIL',			'YIELD_GOLDEN_AGE_POINTS',		5),
				('BUILDING_SIBERIAN_RAILWAY',	'RESOURCE_ALUMINUM',	'YIELD_GOLDEN_AGE_POINTS',		5),
				('BUILDING_SIBERIAN_RAILWAY',	'RESOURCE_URANIUM',		'YIELD_GOLDEN_AGE_POINTS',		5);
	
	INSERT INTO UnitPromotions 
				(Type,							Description,							Help,										Sound,				CannotBeChosen, LostWithUpgrade,	PortraitIndex,	IconAtlas,						PediaType,		PediaEntry) 
	VALUES		('PROMOTION_SIBERIAN_RAILWAY',	'TXT_KEY_PROMOTION_SIBERIAN_RAILWAY',	'TXT_KEY_PROMOTION_SIBERIAN_RAILWAY_HELP',	'AS2D_IF_LEVELUP',	1,				0,					7,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_SHARED',	'TXT_KEY_PROMOTION_SIBERIAN_RAILWAY');

	INSERT INTO UnitPromotions_Terrains 
				(PromotionType,					TerrainType,			DoubleMove) 
	VALUES		('PROMOTION_SIBERIAN_RAILWAY',	'TERRAIN_TUNDRA',		1),
				('PROMOTION_SIBERIAN_RAILWAY',	'TERRAIN_SNOW',			1);

	INSERT INTO UnitPromotions_UnitCombats
				(PromotionType,					UnitCombatType)
	VALUES		('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_GUN'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_MELEE'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_RECON'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_ARCHER'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_MOUNTED'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_SIEGE'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_ARMOR'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_SETTLER'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_WORKER'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_INQUISITOR'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_MISSIONARY'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_DIPLOMACY'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_CARAVAN'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_SPECIAL_PEOPLE'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_SPACESHIP_PART'),
				('PROMOTION_SIBERIAN_RAILWAY',	'UNITCOMBAT_ARCHAEOLOGIST');
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,					FlavorType,				Flavor)
	VALUES		('BUILDING_SIBERIAN_RAILWAY',	'FLAVOR_PRODUCTION',	50),
				('BUILDING_SIBERIAN_RAILWAY',	'FLAVOR_MOBILE',		20),
				('BUILDING_SIBERIAN_RAILWAY',	'FLAVOR_GOLD',			30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- SOHO FOUNDRY
	UPDATE Buildings SET Cost = 1100 WHERE Type = 'BUILDING_SOHO_FOUNDRY';
	UPDATE Buildings SET NumPoliciesNeeded = 14 WHERE Type = 'BUILDING_SOHO_FOUNDRY';
	UPDATE Buildings SET MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_SOHO_FOUNDRY';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_SOHO_FOUNDRY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);

	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,				FeatureType) 
	SELECT		'BUILDING_SOHO_FOUNDRY',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_SOHO_FOUNDRY',	'FEATURE_JUNGLE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- PANAMA CANAL (NEW)
	UPDATE Buildings SET Cost = 1100, PrereqTech = 'TECH_STEAM_POWER', NumPoliciesNeeded = 14, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_PANAMA_CANAL';
	UPDATE Buildings SET WonderSplashAnchor = 'L,C' WHERE Type = 'BUILDING_PANAMA_CANAL';
	---------------------------------------------------------
	-- + IsOnIsthmus (lua) (ALL)
	---------------------------------------------------------
	UPDATE Buildings SET FreePromotion = 'PROMOTION_PANAMA_CANAL' WHERE Type = 'BUILDING_PANAMA_CANAL';
	UPDATE Buildings SET TradeRouteSeaDistanceModifier = 100, TradeRouteSeaGoldBonus = 300, TradeRouteRecipientBonus = 3 WHERE Type = 'BUILDING_PANAMA_CANAL_DUMMY';

	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,			Yield)
	VALUES		('BUILDING_PANAMA_CANAL',	'YIELD_PRODUCTION',	3);

	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,				BuildingClassType,			YieldType,			YieldChange) 
	VALUES		('BUILDING_PANAMA_CANAL',	'BUILDINGCLASS_HARBOR',		'YIELD_GOLD',		2),
				('BUILDING_PANAMA_CANAL',	'BUILDINGCLASS_SEAPORT',	'YIELD_GOLD',		2);

	INSERT INTO UnitPromotions 
				(Type,						Description,						Help,									Sound,				CannotBeChosen, LostWithUpgrade,	FriendlyHealChange,	MovesChange,	PortraitIndex,	IconAtlas,						PediaType,		PediaEntry) 
	VALUES		('PROMOTION_PANAMA_CANAL',	'TXT_KEY_PROMOTION_PANAMA_CANAL',	'TXT_KEY_PROMOTION_PANAMA_CANAL_HELP',	'AS2D_IF_LEVELUP',	1,				0,					10,					1,				5,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_NAVAL',	'TXT_KEY_PROMOTION_PANAMA_CANAL');

	INSERT INTO UnitPromotions_UnitCombats
				(PromotionType,				UnitCombatType)
	VALUES		('PROMOTION_PANAMA_CANAL',	'UNITCOMBAT_NAVALMELEE'),
				('PROMOTION_PANAMA_CANAL',	'UNITCOMBAT_NAVALRANGED'),
				('PROMOTION_PANAMA_CANAL',	'UNITCOMBAT_CARRIER'),
				('PROMOTION_PANAMA_CANAL',	'UNITCOMBAT_CARGO'),
				('PROMOTION_PANAMA_CANAL',	'UNITCOMBAT_SUBMARINE');
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,						Flavor)
	VALUES		('BUILDING_PANAMA_CANAL',	'FLAVOR_GOLD',					40),
				('BUILDING_PANAMA_CANAL',	'FLAVOR_PRODUCTION',			20),
				('BUILDING_PANAMA_CANAL',	'FLAVOR_DEFENSE',				20),
				('BUILDING_PANAMA_CANAL',	'FLAVOR_I_SEA_TRADE_ROUTE',		20),
				('BUILDING_PANAMA_CANAL',	'FLAVOR_I_TRADE_DESTINATION',	20),
				('BUILDING_PANAMA_CANAL',	'FLAVOR_I_TRADE_ORIGIN',		20);

	-- + gold_and_range_for_coastal_city_tr
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- ZOCALO (NEW)
	UPDATE Buildings SET Cost = 1100, PrereqTech = 'TECH_RIFLING', NumPoliciesNeeded = 13, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_ZOCALO';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T' WHERE Type = 'BUILDING_ZOCALO';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1, Water = 1, MinAreaSize = 1, FreshWater = 1, NearbyTerrainRequired = 'TERRAIN_PLAINS' WHERE Type = 'BUILDING_ZOCALO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Flat = 1, Water = 1, MinAreaSize = 1, FreshWater = 1 WHERE Type = 'BUILDING_ZOCALO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------
	UPDATE Buildings SET SpecialistType = 'SPECIALIST_CIVIL_SERVANT', SpecialistCount = 1 WHERE Type = 'BUILDING_ZOCALO';

	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,			Yield)
	VALUES		('BUILDING_ZOCALO',	'YIELD_FAITH',		2),
				('BUILDING_ZOCALO',	'YIELD_TOURISM',	2);

	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,		BuildingClassType,			YieldType,			YieldChange) 
	VALUES		('BUILDING_ZOCALO',	'BUILDINGCLASS_MONUMENT',	'YIELD_TOURISM',		2);

	INSERT INTO Building_SpecialistYieldChanges
				(BuildingType,		SpecialistType,				YieldType,			Yield) 
	VALUES		('BUILDING_ZOCALO',	'SPECIALIST_CIVIL_SERVANT',	'YIELD_FAITH',		1);
	
	INSERT INTO Building_FreeUnits 
				(BuildingType,			UnitType,				NumUnits)
	VALUES		('BUILDING_ZOCALO',		'UNIT_GREAT_DIPLOMAT',	1);
	
	INSERT INTO Building_UnitCombatProductionModifiers 	
				(BuildingType,		UnitCombatType,			Modifier) 
	VALUES		('BUILDING_ZOCALO', 'UNITCOMBAT_DIPLOMACY',	10);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_ZOCALO',	'FLAVOR_RELIGION',		20),
				('BUILDING_ZOCALO',	'FLAVOR_DIPLOMACY',		70),
				('BUILDING_ZOCALO',	'FLAVOR_CULTURE',		20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- KEW GARDENS (NEW)
	UPDATE Buildings SET Cost = 1300, PrereqTech = 'TECH_FERTILIZER', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_KEW_GARDENS';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_KEW_GARDENS';
	---------------------------------------------------------
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,			BuildingClassType) 
	SELECT		'BUILDING_KEW_GARDENS',	'BUILDINGCLASS_STOCKYARD'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2)) UNION ALL
	SELECT		'BUILDING_KEW_GARDENS',	'BUILDINGCLASS_GARDEN'		WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------
	UPDATE Buildings SET SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 3 WHERE Type = 'BUILDING_KEW_GARDENS';

	INSERT INTO Building_ImprovementYieldChangesGlobal 
				(BuildingType,				ImprovementType,	YieldType,			Yield) 
	VALUES		('BUILDING_KEW_GARDENS',	'IMPROVEMENT_FARM',	'YIELD_FOOD',		1),
				('BUILDING_KEW_GARDENS',	'IMPROVEMENT_FARM',	'YIELD_SCIENCE',	1),
				('BUILDING_KEW_GARDENS',	'IMPROVEMENT_FARM',	'YIELD_TOURISM',	1);

	INSERT INTO Building_YieldFromYieldPercent
				(BuildingType,				YieldIn,			YieldOut,			Value) 
	VALUES		('BUILDING_KEW_GARDENS',	'YIELD_FOOD',		'YIELD_SCIENCE',	10),
				('BUILDING_KEW_GARDENS',	'YIELD_SCIENCE',	'YIELD_TOURISM',	10);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,				Flavor)
	VALUES		('BUILDING_KEW_GARDENS',	'FLAVOR_GROWTH',		30),
				('BUILDING_KEW_GARDENS',	'FLAVOR_SCIENCE',		50),
				('BUILDING_KEW_GARDENS',	'FLAVOR_CULTURE',		30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- LOUVRE
	UPDATE Buildings SET Cost = 1300 WHERE Type = 'BUILDING_LOUVRE';
	UPDATE Buildings SET MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_LOUVRE';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C', WonderSplashImage = 'Wonder_Louvre_splash.dds' WHERE Type = 'BUILDING_LOUVRE';
	---------------------------------------------------------
	-- + Landmark(1) (lua) (ALL)
	-- + GW_of_Art(4) (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- PALACE OF WESTMINSTER
	UPDATE Buildings SET Cost = 1300 WHERE Type = 'BUILDING_BIG_BEN';
	UPDATE Buildings SET MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_BIG_BEN';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_BIG_BEN';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_BIG_BEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + CS_Ally(3) (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MONTE CARLO (NEW)
	UPDATE Buildings SET Cost = 1300, PrereqTech = 'TECH_INDUSTRIALIZATION', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_POSTMODERN' WHERE Type = 'BUILDING_MONTE_CARLO';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_MONTE_CARLO';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10, NearbyMountainRequired = 1 WHERE Type = 'BUILDING_MONTE_CARLO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_MONTE_CARLO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------
	UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_HOTEL' WHERE Type = 'BUILDING_MONTE_CARLO';

	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,				BuildingClassType,			YieldType,			YieldChange) 
	VALUES		('BUILDING_MONTE_CARLO',	'BUILDINGCLASS_HOTEL',		'YIELD_GOLD',		2),
				('BUILDING_MONTE_CARLO',	'BUILDINGCLASS_HOTEL',		'YIELD_TOURISM',	2);

	INSERT INTO Building_GlobalYieldModifiers
				(BuildingType,				YieldType,			Yield) 
	VALUES		('BUILDING_MONTE_CARLO',	'YIELD_GOLD',		10);

	INSERT INTO Building_YieldFromYieldPercent
				(BuildingType,				YieldIn,			YieldOut,		Value) 
	VALUES		('BUILDING_MONTE_CARLO',	'YIELD_TOURISM',	'YIELD_GOLD',	33);

	INSERT INTO Building_YieldFromPurchase
				(BuildingType,				YieldType,			Yield) 
	VALUES		('BUILDING_MONTE_CARLO',	'YIELD_TOURISM',	20);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,			Flavor)
	VALUES		('BUILDING_MONTE_CARLO',	'FLAVOR_GOLD',		80),
				('BUILDING_MONTE_CARLO',	'FLAVOR_CULTURE',	50);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- RUHR VALLEY (NEW)
	UPDATE Buildings SET Cost = 1300, PrereqTech = 'TECH_INDUSTRIALIZATION', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_POSTMODERN' WHERE Type = 'BUILDING_RUHR_VALLEY';
	UPDATE Buildings SET WonderSplashAnchor = 'C,B' WHERE Type = 'BUILDING_RUHR_VALLEY';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_RUHR_VALLEY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + PlaceForResource lua (ALL)
	---------------------------------------------------------
	UPDATE Buildings SET CityWorkingChange = 1 WHERE Type = 'BUILDING_RUHR_VALLEY';

	INSERT INTO Building_GlobalYieldModifiers
				(BuildingType,				YieldType,				Yield) 
	VALUES		('BUILDING_RUHR_VALLEY',	'YIELD_PRODUCTION',		10);

	INSERT INTO Building_ImprovementYieldChangesGlobal 
				(BuildingType,				ImprovementType,		YieldType,				Yield) 
	VALUES		('BUILDING_RUHR_VALLEY',	'IMPROVEMENT_MINE',		'YIELD_PRODUCTION',		1),
				('BUILDING_RUHR_VALLEY',	'IMPROVEMENT_QUARRY',	'YIELD_PRODUCTION',		1);

	INSERT INTO Building_ResourceYieldChangesGlobal 
				(BuildingType,				ResourceType,			YieldType,					Yield) 
	VALUES		('BUILDING_RUHR_VALLEY',	'RESOURCE_COAL',		'YIELD_GOLD',				1),
				('BUILDING_RUHR_VALLEY',	'RESOURCE_COAL',		'YIELD_GOLDEN_AGE_POINTS',	1);
	
	INSERT INTO Building_ResourcePlotsToPlace
				(BuildingType,				ResourceType,		NumPlots,	ResourceQuantityToPlace) 
	VALUES		('BUILDING_RUHR_VALLEY',	'RESOURCE_COAL',	1,			3);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,				Flavor)
	VALUES		('BUILDING_RUHR_VALLEY',	'FLAVOR_PRODUCTION',	100);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- EIFFEL TOWER
	UPDATE Buildings SET Cost = 1300 WHERE Type = 'BUILDING_EIFFEL_TOWER';
	UPDATE Buildings SET NumPoliciesNeeded = 16, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_EIFFEL_TOWER';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T' WHERE Type = 'BUILDING_EIFFEL_TOWER';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1, NearbyTerrainRequired = 'TERRAIN_GRASS' WHERE Type = 'BUILDING_EIFFEL_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,				ResourceType) 
	SELECT		'BUILDING_EIFFEL_TOWER',	'RESOURCE_IRON' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- DARJEELING HIMALAYAN RAILWAY (NEW)
	UPDATE Buildings SET Cost = 1300, PrereqTech = 'TECH_DYNAMITE', NumPoliciesNeeded = 16, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_DARJEELING';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_DARJEELING';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyMountainRequired = 1 WHERE Type = 'BUILDING_DARJEELING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,			BuildingClassType) 
	SELECT		'BUILDING_DARJEELING',	'BUILDINGCLASS_COALING_STATION' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);

	-- + Mountains(2) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET FreePromotion = 'PROMOTION_DARJEELING', CityConnectionTradeRouteModifier = 15 WHERE Type = 'BUILDING_DARJEELING';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_DARJEELING',	'YIELD_PRODUCTION',	2),
				('BUILDING_DARJEELING',	'YIELD_TOURISM',	3);

	INSERT INTO Building_YieldPerXTerrainTimes100
				(BuildingType,					TerrainType,			YieldType,			Yield) 
	VALUES		('BUILDING_DARJEELING_DUMMY',	'TERRAIN_MOUNTAIN',		'YIELD_FOOD',		100),
				('BUILDING_DARJEELING_DUMMY',	'TERRAIN_MOUNTAIN',		'YIELD_PRODUCTION',	100),
				('BUILDING_DARJEELING_DUMMY',	'TERRAIN_MOUNTAIN',		'YIELD_CULTURE',	100),
				('BUILDING_DARJEELING_DUMMY',	'TERRAIN_MOUNTAIN',		'YIELD_TOURISM',	100);

	INSERT INTO UnitPromotions 
				(Type,						Description,					Help,									Sound,				CannotBeChosen, LostWithUpgrade,	CanCrossMountains,	PortraitIndex,	IconAtlas,						PediaType,		PediaEntry) 
	VALUES		('PROMOTION_DARJEELING',	'TXT_KEY_PROMOTION_DARJEELING',	'TXT_KEY_PROMOTION_DARJEELING_HELP',	'AS2D_IF_LEVELUP',	1,				0,					1,					6,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_NAVAL',	'TXT_KEY_PROMOTION_DARJEELING');

	INSERT INTO UnitPromotions_UnitCombats
				(PromotionType,				UnitCombatType)
	VALUES		('PROMOTION_DARJEELING',	'UNITCOMBAT_GUN'),
				('PROMOTION_DARJEELING',	'UNITCOMBAT_MELEE'),
				('PROMOTION_DARJEELING',	'UNITCOMBAT_RECON'),
				('PROMOTION_DARJEELING',	'UNITCOMBAT_ARCHER');
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,				Flavor)
	VALUES		('BUILDING_DARJEELING',		'FLAVOR_PRODUCTION',	30),
				('BUILDING_DARJEELING',		'FLAVOR_CULTURE',		50),
				('BUILDING_DARJEELING',		'FLAVOR_MOBILE',		20);	
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- BRANDENBURG GATE
	UPDATE Buildings SET Cost = 1300 WHERE Type = 'BUILDING_BRANDENBURG_GATE';
	UPDATE Buildings SET NumPoliciesNeeded = 0, MaxStartEra = 'ERA_POSTMODERN' WHERE Type = 'BUILDING_BRANDENBURG_GATE';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T' WHERE Type = 'BUILDING_BRANDENBURG_GATE';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1 WHERE Type = 'BUILDING_BRANDENBURG_GATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	-- + Citadel/Fort(1) (lua) (ALL)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- BANFF SPRINGS HOTEL (NEW)
	UPDATE Buildings SET Cost = 1300, PrereqTech = 'TECH_MILITARY_SCIENCE', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_POSTMODERN' WHERE Type = 'BUILDING_BANFF';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_BANFF';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyMountainRequired = 1, NearbyTerrainRequired = 'TERRAIN_TUNDRA' WHERE Type = 'BUILDING_BANFF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_TUNDRA' WHERE Type = 'BUILDING_BANFF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------
	UPDATE Buildings SET BoredomFlatReduction = 1, FreeBuildingThisCity = 'BUILDINGCLASS_HOTEL', SpecialistType = 'SPECIALIST_MERCHANT', GreatPeopleRateChange = 1 WHERE Type = 'BUILDING_BANFF';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,			Yield)
	VALUES		('BUILDING_BANFF',	'YIELD_TOURISM',	5);

	INSERT INTO Building_SpecialistYieldChanges
				(BuildingType,		SpecialistType,			YieldType,			Yield) 
	VALUES		('BUILDING_BANFF',	'SPECIALIST_MERCHANT',	'YIELD_GOLD',		1),
				('BUILDING_BANFF',	'SPECIALIST_MERCHANT',	'YIELD_TOURISM',	1);

	INSERT INTO Building_YieldPerXTerrainTimes100
				(BuildingType,		TerrainType,			YieldType,			Yield) 
	VALUES		('BUILDING_BANFF',	'TERRAIN_MOUNTAIN',		'YIELD_GOLD',		500),
				('BUILDING_BANFF',	'TERRAIN_MOUNTAIN',		'YIELD_TOURISM',	500);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,			Flavor)
	VALUES		('BUILDING_BANFF',	'FLAVOR_GOLD',		60),
				('BUILDING_BANFF',	'FLAVOR_CULTURE',	60),
				('BUILDING_BANFF',	'FLAVOR_HAPPINESS',	10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- ORSZAGHAZ (NEW)
	UPDATE Buildings SET Cost = 1300, PrereqTech = 'TECH_MILITARY_SCIENCE', NumPoliciesNeeded = 15, MaxStartEra = 'ERA_POSTMODERN' WHERE Type = 'BUILDING_ORSZAGHAZ';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_ORSZAGHAZ';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */River = 1 WHERE Type = 'BUILDING_ORSZAGHAZ' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,			BuildingClassType) 
	SELECT		'BUILDING_ORSZAGHAZ',	'BUILDINGCLASS_CONSTABLE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET FreePolicies = 1, SingleLeagueVotes = 1, DoFToVotes = 1, DPToVotes = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 1, FreeGreatWork = 'GREAT_WORK_HOLY_CROWN' WHERE Type = 'BUILDING_ORSZAGHAZ';

	INSERT INTO Building_GlobalYieldModifiers
				(BuildingType,			YieldType,					Yield) 
	VALUES		('BUILDING_ORSZAGHAZ',	'YIELD_GOLDEN_AGE_POINTS',	15);

	INSERT INTO GreatWorks
				(Type,						Description,						GreatWorkClassType,	Audio,							Image,							Quote) 
	VALUES		('GREAT_WORK_HOLY_CROWN',	'TXT_KEY_GREAT_WORK_HOLY_CROWN',	'GREAT_WORK_ART',	'AS2D_GREAT_ARTIST_ARTWORK',	'Great_Work_Holy_Crown.dds',	'TXT_KEY_GREAT_WORK_HOLY_CROWN_QUOTE');
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,			Flavor)
	VALUES		('BUILDING_ORSZAGHAZ',	'FLAVOR_DIPLOMACY',	100),
				('BUILDING_ORSZAGHAZ',	'FLAVOR_CULTURE',	30);
--------------------------------------------------------------------------------------------------------------------------------------------
-- AMERCIAN UWWs (FROM VP 3.8)
--------------------------------------------------------------------------------------------------------------------------------------------
-- Smithsonian Institute
	UPDATE Buildings SET MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_AMERICA_SMITHSONIAN';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C', WonderSplashImage = 'Wonder_America_Smithsonian_splash.dds' WHERE Type = 'BUILDING_AMERICA_SMITHSONIAN';
	UPDATE Buildings SET Quote = 'TXT_KEY_WONDER_AMERICA_SMITHSONIAN_QUOTE' WHERE Type = 'BUILDING_AMERICA_SMITHSONIAN';
--------------------------------------------------------------------------------------------------------------------------------------------
-- West Point
	UPDATE Buildings SET MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_AMERICA_WESTPOINT';
	UPDATE Buildings SET WonderSplashAnchor = 'C,B', WonderSplashImage = 'Wonder_America_West_Point_splash.dds' WHERE Type = 'BUILDING_AMERICA_WESTPOINT';
	UPDATE Buildings SET Quote = 'TXT_KEY_WONDER_AMERICA_WESTPOINT_QUOTE' WHERE Type = 'BUILDING_AMERICA_WESTPOINT';
--------------------------------------------------------------------------------------------------------------------------------------------
-- Slater Mill
	UPDATE Buildings SET MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_AMERICA_SLATERMILL';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B', WonderSplashImage = 'Wonder_America_Slater_Mill_splash.dds' WHERE Type = 'BUILDING_AMERICA_SLATERMILL';
	UPDATE Buildings SET Quote = 'TXT_KEY_WONDER_AMERICA_SLATERMILL_QUOTE' WHERE Type = 'BUILDING_AMERICA_SLATERMILL';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_AMERICA_SLATERMILL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
--============================================--
-- MODERN ERA
--============================================--
-- STATUE OF LIBERTY
	UPDATE Buildings SET Cost = 1550 WHERE Type = 'BUILDING_STATUE_OF_LIBERTY';
	UPDATE Buildings SET NumPoliciesNeeded = 17, MaxStartEra = 'ERA_POSTMODERN' WHERE Type = 'BUILDING_STATUE_OF_LIBERTY';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_STATUE_OF_LIBERTY';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_STATUE_OF_LIBERTY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	-- + Specialists(10) (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- POLAR EXPEDITION (NEW)
	UPDATE Buildings SET Cost = 1550, PrereqTech = 'TECH_BIOLOGY', NumPoliciesNeeded = 17 WHERE Type = 'BUILDING_POLAR_EXPEDITION';
	UPDATE Buildings SET WonderSplashAnchor = 'C,B' WHERE Type = 'BUILDING_POLAR_EXPEDITION';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoWater = 1, IsNoCoast = 1, */NearbyTerrainRequired = 'TERRAIN_SNOW' WHERE Type = 'BUILDING_POLAR_EXPEDITION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + IsAtPolar (lua) (HARD)
	---------------------------------------------------------
	INSERT INTO Building_YieldChanges 
				(BuildingType,					YieldType,					Yield)
	VALUES		('BUILDING_POLAR_EXPEDITION',	'YIELD_SCIENCE',			6),
				('BUILDING_POLAR_EXPEDITION',	'YIELD_GOLDEN_AGE_POINTS',	2);
	
	INSERT INTO Building_SpecialistYieldChanges
				(BuildingType,					SpecialistType,			YieldType,					Yield) 
	VALUES		('BUILDING_POLAR_EXPEDITION',	'SPECIALIST_SCIENTIST',	'YIELD_SCIENCE',			1),
				('BUILDING_POLAR_EXPEDITION',	'SPECIALIST_SCIENTIST',	'YIELD_GOLDEN_AGE_POINTS',	1);
	
	INSERT INTO Building_TerrainYieldChanges
				(BuildingType,					TerrainType,		YieldType,				Yield) 
	VALUES		('BUILDING_POLAR_EXPEDITION',	'TERRAIN_SNOW',		'YIELD_SCIENCE',		2);

	INSERT INTO Building_ResourcePlotsToPlace
				(BuildingType,					ResourceType,		NumPlots,	ResourceQuantityToPlace) 
	VALUES		('BUILDING_POLAR_EXPEDITION',	'RESOURCE_OIL',		1,			2),
				('BUILDING_POLAR_EXPEDITION',	'RESOURCE_OIL',		1,			3);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,					FlavorType,				Flavor)
	VALUES		('BUILDING_POLAR_EXPEDITION',	'FLAVOR_SCIENCE',		100),
				('BUILDING_POLAR_EXPEDITION',	'FLAVOR_PRODUCTION',	20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- EMPIRE STATE BUILDING
	UPDATE Buildings SET Cost = 1550 WHERE Type = 'BUILDING_EMPIRE_STATE_BUILDING';
	UPDATE Buildings SET NumPoliciesNeeded = 18, MaxStartEra = 'ERA_POSTMODERN' WHERE Type = 'BUILDING_EMPIRE_STATE_BUILDING';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_EMPIRE_STATE_BUILDING';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1 WHERE Type = 'BUILDING_EMPIRE_STATE_BUILDING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));

	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,						ResourceType) 
	SELECT		'BUILDING_EMPIRE_STATE_BUILDING',	'RESOURCE_ALUMINUM' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- AKIHABARA ELECTRIC TOWN (NEW)
	UPDATE Buildings SET Cost = 1550, PrereqTech = 'TECH_ELECTRICITY', NumPoliciesNeeded = 18 WHERE Type = 'BUILDING_AKIHABARA';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_AKIHABARA';
	---------------------------------------------------------
	-- + Town(1) (lua) (HARD)
	-- + Merchants(3) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 2 WHERE Type = 'BUILDING_AKIHABARA';
	
	INSERT INTO Building_SpecialistYieldChanges
				(BuildingType,			SpecialistType,			YieldType,			Yield) 
	VALUES		('BUILDING_AKIHABARA',	'SPECIALIST_MERCHANT',	'YIELD_PRODUCTION',	2);
	
	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,			BuildingClassType,			YieldType,			YieldChange) 
	VALUES		('BUILDING_AKIHABARA',	'BUILDINGCLASS_MARKET',		'YIELD_PRODUCTION',	1),
				('BUILDING_AKIHABARA',	'BUILDINGCLASS_MARKET',		'YIELD_GOLD',		2),
				('BUILDING_AKIHABARA',	'BUILDINGCLASS_MARKET',		'YIELD_CULTURE',	1);

	INSERT INTO Building_ImprovementYieldChangesGlobal 
				(BuildingType,			ImprovementType,				YieldType,			Yield) 
	VALUES		('BUILDING_AKIHABARA',	'IMPROVEMENT_CUSTOMS_HOUSE',	'YIELD_PRODUCTION',	1),
				('BUILDING_AKIHABARA',	'IMPROVEMENT_CUSTOMS_HOUSE',	'YIELD_GOLD',		1);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_AKIHABARA',	'FLAVOR_GOLD',			50),
				('BUILDING_AKIHABARA',	'FLAVOR_PRODUCTION',	60),
				('BUILDING_AKIHABARA',	'FLAVOR_CULTURE',		20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- ROCKEFELLER CENTER (NEW)
	UPDATE Buildings SET Cost = 1550, PrereqTech = 'TECH_CORPORATIONS', NumPoliciesNeeded = 18 WHERE Type = 'BUILDING_ROCKEFELLER';
	UPDATE Buildings SET WonderSplashAnchor = 'C,B' WHERE Type = 'BUILDING_ROCKEFELLER';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10, River = 1 WHERE Type = 'BUILDING_ROCKEFELLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,			BuildingClassType) 
	SELECT		'BUILDING_ROCKEFELLER',	'BUILDINGCLASS_OPERA_HOUSE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_LABORATORY' WHERE Type = 'BUILDING_ROCKEFELLER';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,					YieldType,			Yield)
	VALUES		('BUILDING_ROCKEFELLER',		'YIELD_GOLD',		5),
				('BUILDING_ROCKEFELLER_DUMMY',	'YIELD_GOLD',		3);
	
	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,				BuildingClassType,			YieldType,			YieldChange) 
	VALUES		('BUILDING_ROCKEFELLER',	'BUILDINGCLASS_HOSPITAL',	'YIELD_SCIENCE',	2);

	INSERT INTO Building_YieldFromPurchase
				(BuildingType,					YieldType,			Yield) 
	VALUES		('BUILDING_ROCKEFELLER_DUMMY',	'YIELD_CULTURE',	5);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_ROCKEFELLER',	'FLAVOR_SCIENCE',		100),
				('BUILDING_ROCKEFELLER',	'FLAVOR_DIPLOMACY',		20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- KREMLIN
	-- UPDATE Buildings SET MaxStartEra = 'ERA_POSTMODERN' WHERE Type = 'BUILDING_KREMLIN';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_KREMLIN';
	-- UPDATE Buildings SET WonderSplashImage = 'Wonder_Kremlin_splash.dds' WHERE Type = 'BUILDING_KREMLIN';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */NearbyTerrainRequired = 'TERRAIN_TUNDRA' WHERE Type = 'BUILDING_KREMLIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	-- UPDATE Buildings SET /*IsNoCoast = 1, */ WHERE Type = 'BUILDING_KREMLIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- AUTOBAHN (NEW)
	UPDATE Buildings SET Cost = 1550, PrereqTech = 'TECH_COMBUSTION', NumPoliciesNeeded = 17 WHERE Type = 'BUILDING_AUTOBAHN';
	UPDATE Buildings SET WonderSplashAnchor = 'C,B' WHERE Type = 'BUILDING_AUTOBAHN';
	---------------------------------------------------------
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,			ResourceType) 
	SELECT		'BUILDING_AUTOBAHN',	'RESOURCE_OIL' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,			BuildingClassType) 
	SELECT		'BUILDING_AUTOBAHN',	'BUILDINGCLASS_ARSENAL' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_AUTOBAHN',	'BUILDINGCLASS_FACTORY' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET WorkerSpeedModifier = 30, CityConnectionTradeRouteModifier = 15 WHERE Type = 'BUILDING_AUTOBAHN';
	UPDATE Buildings SET Defense = 700 WHERE Type = 'BUILDING_AUTOBAHN_DUMMY';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,				YieldType,					Yield)
	VALUES		('BUILDING_AUTOBAHN',		'YIELD_PRODUCTION',			2),
				('BUILDING_AUTOBAHN',		'YIELD_GOLDEN_AGE_POINTS',	5);
	
	INSERT INTO Building_GlobalYieldModifiers
				(BuildingType,			YieldType,					Yield) 
	VALUES		('BUILDING_AUTOBAHN',	'YIELD_GOLDEN_AGE_POINTS',	10);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_AUTOBAHN',	'FLAVOR_CITY_DEFENSE',	30),
				('BUILDING_AUTOBAHN',	'FLAVOR_PRODUCTION',	50),
				('BUILDING_AUTOBAHN',	'FLAVOR_GOLD',			20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- INTERSTATE HIGHWAY SYSTEM (NEW)
	UPDATE Buildings SET Cost = 1800, PrereqTech = 'TECH_PLASTIC', NumPoliciesNeeded = 19 WHERE Type = 'BUILDING_INTERSTATE';
	UPDATE Buildings SET WonderSplashAnchor = 'R,C' WHERE Type = 'BUILDING_INTERSTATE';
	---------------------------------------------------------
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,			ResourceType) 
	SELECT		'BUILDING_INTERSTATE',	'RESOURCE_OIL' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));

	-- + Cities(8) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET EmpireSizeModifierReductionGlobal = -5, CityConnectionTradeRouteModifier = 15 WHERE Type = 'BUILDING_INTERSTATE';
	UPDATE Buildings SET PopulationChange = 1 WHERE Type = 'BUILDING_INTERSTATE_DUMMY';
	
	INSERT INTO Building_GlobalYieldModifiers
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_INTERSTATE',	'YIELD_PRODUCTION',	10);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_INTERSTATE',	'FLAVOR_PRODUCTION',	100),
				('BUILDING_INTERSTATE',	'FLAVOR_GROWTH',		20),
				('BUILDING_INTERSTATE',	'FLAVOR_GOLD',			20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- HOLLYWOOD (NEW)
	UPDATE Buildings SET Cost = 1800, PrereqTech = 'TECH_RADIO', NumPoliciesNeeded = 21 WHERE Type = 'BUILDING_HOLLYWOOD';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_HOLLYWOOD';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1, Water = 1, MinAreaSize = 10, NearbyTerrainRequired = 'TERRAIN_GRASS' WHERE Type = 'BUILDING_HOLLYWOOD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Hill = 1 WHERE Type = 'BUILDING_HOLLYWOOD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
	---------------------------------------------------------
	UPDATE Buildings SET BoredomFlatReduction = 1, FreePolicies = 1, CultureMedianModifierGlobal = -5 WHERE Type = 'BUILDING_HOLLYWOOD';
	
	INSERT INTO Building_YieldChanges
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_HOLLYWOOD',	'YIELD_TOURISM',	1);

	INSERT INTO Building_YieldFromPolicyUnlock
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_HOLLYWOOD',	'YIELD_TOURISM',	75);

	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,			BuildingClassType,					YieldType,			YieldChange) 
	VALUES		('BUILDING_HOLLYWOOD',	'BUILDINGCLASS_BROADCAST_TOWER',	'YIELD_GOLD',		1),
				('BUILDING_HOLLYWOOD',	'BUILDINGCLASS_BROADCAST_TOWER',	'YIELD_CULTURE',	1),
				('BUILDING_HOLLYWOOD',	'BUILDINGCLASS_ARTISTS_GUILD',		'YIELD_GOLD',		2),
				('BUILDING_HOLLYWOOD',	'BUILDINGCLASS_ARTISTS_GUILD',		'YIELD_CULTURE',	2),
				('BUILDING_HOLLYWOOD',	'BUILDINGCLASS_ARTISTS_GUILD',		'YIELD_TOURISM',	2),
				('BUILDING_HOLLYWOOD',	'BUILDINGCLASS_WRITERS_GUILD',		'YIELD_GOLD',		2),
				('BUILDING_HOLLYWOOD',	'BUILDINGCLASS_WRITERS_GUILD',		'YIELD_CULTURE',	2),
				('BUILDING_HOLLYWOOD',	'BUILDINGCLASS_WRITERS_GUILD',		'YIELD_TOURISM',	2),
				('BUILDING_HOLLYWOOD',	'BUILDINGCLASS_MUSICIANS_GUILD',	'YIELD_GOLD',		2),
				('BUILDING_HOLLYWOOD',	'BUILDINGCLASS_MUSICIANS_GUILD',	'YIELD_CULTURE',	2),
				('BUILDING_HOLLYWOOD',	'BUILDINGCLASS_MUSICIANS_GUILD',	'YIELD_TOURISM',	2);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_HOLLYWOOD',	'FLAVOR_CULTURE',		100),
				('BUILDING_HOLLYWOOD',	'FLAVOR_GOLD',			30),
				('BUILDING_HOLLYWOOD',	'FLAVOR_HAPPINESS',		50);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- CONCORDE (NEW)
	UPDATE Buildings SET Cost = 1800, PrereqTech = 'TECH_FLIGHT', NumPoliciesNeeded = 21 WHERE Type = 'BUILDING_CONCORDE';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_CONCORDE';
	---------------------------------------------------------
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,			ResourceType) 
	SELECT		'BUILDING_CONCORDE',	'RESOURCE_ALUMINUM' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));

	-- + Engineers(3) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET MinorFriendshipChange = 20, CityConnectionTradeRouteModifier = 15 WHERE Type = 'BUILDING_CONCORDE';
	
	INSERT INTO Building_YieldChanges
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_CONCORDE',	'YIELD_TOURISM',	3);

	INSERT INTO Building_WLTKDYieldMod
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_CONCORDE',	'YIELD_TOURISM',	25);

	INSERT INTO Building_ResourceYieldChangesGlobal 
				(BuildingType,			ResourceType,			YieldType,			Yield) 
	VALUES		('BUILDING_CONCORDE',	'RESOURCE_OIL',			'YIELD_TOURISM',	3),
				('BUILDING_CONCORDE',	'RESOURCE_ALUMINUM',	'YIELD_TOURISM',	3);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_CONCORDE',	'FLAVOR_CULTURE',		120),
				('BUILDING_CONCORDE',	'FLAVOR_GOLD',			40),
				('BUILDING_CONCORDE',	'FLAVOR_HAPPINESS',		30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- CRISTO REDENTOR
	UPDATE Buildings SET Cost = 1800 WHERE Type = 'BUILDING_CRISTO_REDENTOR';
	UPDATE Buildings SET NumPoliciesNeeded = 19, MaxStartEra = 'ERA_POSTMODERN' WHERE Type = 'BUILDING_CRISTO_REDENTOR';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_CRISTO_REDENTOR';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 0, Hill = 1, Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_CRISTO_REDENTOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));

	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,				FeatureType) 
	SELECT		'BUILDING_CRISTO_REDENTOR',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_CRISTO_REDENTOR',	'FEATURE_JUNGLE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- BROADWAY
	UPDATE Buildings SET Cost = 1800 WHERE Type = 'BUILDING_BROADWAY';
	UPDATE Buildings SET MaxStartEra = 'ERA_POSTMODERN' WHERE Type = 'BUILDING_BROADWAY';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_BROADWAY';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1 WHERE Type = 'BUILDING_BROADWAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	-- + GW_of_Music(2) (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- PRORA
	UPDATE Buildings SET Cost = 1800 WHERE Type = 'BUILDING_PRORA_RESORT';
	UPDATE Buildings SET MaxStartEra = 'ERA_POSTMODERN' WHERE Type = 'BUILDING_PRORA_RESORT';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T' WHERE Type = 'BUILDING_PRORA_RESORT';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1, Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_PRORA_RESORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));

	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,				FeatureType) 
	SELECT		'BUILDING_PRORA_RESORT',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_PRORA_RESORT',	'FEATURE_JUNGLE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- SANBO HONBU (NEW)
	UPDATE Buildings SET Cost = 1800, PrereqTech = 'TECH_BALLISTICS', NumPoliciesNeeded = 19 WHERE Type = 'BUILDING_SANBO';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_SANBO';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_SANBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);

	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,		BuildingClassType) 
	SELECT		'BUILDING_SANBO',	'BUILDINGCLASS_ARSENAL'				WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_SANBO',	'BUILDINGCLASS_MILITARY_ACADEMY'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET FreePolicies = 1, FreePromotion = 'PROMOTION_SANBO_LAND' WHERE Type = 'BUILDING_SANBO';
	UPDATE Buildings SET FreePromotion = 'PROMOTION_SANBO_SEA' WHERE Type = 'BUILDING_SANBO_DUMMY';
	UPDATE Buildings SET FreePromotion = 'PROMOTION_SANBO_AIR' WHERE Type = 'BUILDING_SANBO_2_DUMMY';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,						Yield)
	VALUES		('BUILDING_SANBO',		'YIELD_GREAT_GENERAL_POINTS',	2),
				('BUILDING_SANBO',		'YIELD_GREAT_ADMIRAL_POINTS',	3);

	INSERT INTO Building_UnitCombatProductionModifiers 	
				(BuildingType,		UnitCombatType,				Modifier) 
	VALUES		('BUILDING_SANBO',	'UNITCOMBAT_NAVALMELEE',	30),
				('BUILDING_SANBO',	'UNITCOMBAT_NAVALRANGED',	30),
				('BUILDING_SANBO',	'UNITCOMBAT_SUBMARINE',		30),
				('BUILDING_SANBO',	'UNITCOMBAT_CARRIER',		30),
				('BUILDING_SANBO',	'UNITCOMBAT_MOUNTED',		30),
				('BUILDING_SANBO',	'UNITCOMBAT_SIEGE',			30),
				('BUILDING_SANBO',	'UNITCOMBAT_ARCHER',		30),
				('BUILDING_SANBO',	'UNITCOMBAT_MELEE',			30),
				('BUILDING_SANBO',	'UNITCOMBAT_GUN',			30),
				('BUILDING_SANBO',	'UNITCOMBAT_ARMOR',			30),
				('BUILDING_SANBO',	'UNITCOMBAT_RECON',			30),
				('BUILDING_SANBO',	'UNITCOMBAT_HELICOPTER',	30),
				('BUILDING_SANBO',	'UNITCOMBAT_FIGHTER',		30),
				('BUILDING_SANBO',	'UNITCOMBAT_BOMBER',		30),
				('BUILDING_SANBO',	'UNITCOMBAT_MISSILE',		30);
	
	INSERT INTO UnitPromotions 
				(Type,							Description,							Help,											Sound,				CannotBeChosen, LostWithUpgrade,	RoughAttack,	RoughRangedAttackMod,	RoughDefense,	River,	LandAirDefenseBonus,	AdjacentMod,	RangedAttackModifier,	PortraitIndex,	IconAtlas,						PediaType,		PediaEntry) 
	VALUES		('PROMOTION_SANBO_LAND',		'TXT_KEY_PROMOTION_SANBO_LAND',			'TXT_KEY_PROMOTION_SANBO_LAND_HELP',			'AS2D_IF_LEVELUP',	1,				0,					10,				10,						10,				1,		0,						0,				0,						13,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_SHARED',	'TXT_KEY_PROMOTION_SANBO_LAND'),
				('PROMOTION_SANBO_SEA',			'TXT_KEY_PROMOTION_SANBO_SEA',			'TXT_KEY_PROMOTION_SANBO_SEA_HELP',				'AS2D_IF_LEVELUP',	1,				0,					0,				0,						0,				0,		10,						10,				0,						12,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_SHARED',	'TXT_KEY_PROMOTION_SANBO_SEA'),
				('PROMOTION_SANBO_AIR',			'TXT_KEY_PROMOTION_SANBO_AIR',			'TXT_KEY_PROMOTION_SANBO_AIR_HELP',				'AS2D_IF_LEVELUP',	1,				0,					0,				0,						0,				0,		0,						0,				0,						14,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_SANBO_AIR'),
				('PROMOTION_SANBO_AIR_EFFECT',	'TXT_KEY_PROMOTION_SANBO_AIR_EFFECT',	'TXT_KEY_PROMOTION_SANBO_AIR_EFFECT_HELP',		'AS2D_IF_LEVELUP',	1,				0,					0,				0,						0,				0,		0,						0,				30,						15,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_SANBO_AIR_EFFECT');

	INSERT INTO UnitPromotions_UnitCombats
				(PromotionType,					UnitCombatType)
	VALUES		('PROMOTION_SANBO_LAND',		'UNITCOMBAT_RECON'),
				('PROMOTION_SANBO_LAND',		'UNITCOMBAT_ARMOR'),
				('PROMOTION_SANBO_LAND',		'UNITCOMBAT_GUN'),
				('PROMOTION_SANBO_LAND',		'UNITCOMBAT_MELEE'),
				('PROMOTION_SANBO_LAND',		'UNITCOMBAT_ARCHER'),
				('PROMOTION_SANBO_LAND',		'UNITCOMBAT_SIEGE'),
				('PROMOTION_SANBO_LAND',		'UNITCOMBAT_MOUNTED'),
				('PROMOTION_SANBO_SEA',			'UNITCOMBAT_CARRIER'),
				('PROMOTION_SANBO_SEA',			'UNITCOMBAT_SUBMARINE'),
				('PROMOTION_SANBO_SEA',			'UNITCOMBAT_NAVALRANGED'),
				('PROMOTION_SANBO_SEA',			'UNITCOMBAT_NAVALMELEE'),
				('PROMOTION_SANBO_AIR',			'UNITCOMBAT_HELICOPTER'),
				('PROMOTION_SANBO_AIR',			'UNITCOMBAT_FIGHTER'),
				('PROMOTION_SANBO_AIR',			'UNITCOMBAT_BOMBER'),
				('PROMOTION_SANBO_AIR_EFFECT',	'UNITCOMBAT_HELICOPTER'),
				('PROMOTION_SANBO_AIR_EFFECT',	'UNITCOMBAT_FIGHTER'),
				('PROMOTION_SANBO_AIR_EFFECT',	'UNITCOMBAT_BOMBER');
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,					Flavor)
	VALUES		('BUILDING_SANBO',	'FLAVOR_AIR',				20),
				('BUILDING_SANBO',	'FLAVOR_EXPANSION',			10),
				('BUILDING_SANBO',	'FLAVOR_MILITARY_TRAINING',	60),
				('BUILDING_SANBO',	'FLAVOR_NAVAL',				20),
				('BUILDING_SANBO',	'FLAVOR_OFFENSE',			50),
				('BUILDING_SANBO',	'FLAVOR_PRODUCTION',		30),
				('BUILDING_SANBO',	'FLAVOR_RANGED',			20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MOUNT RUSHMORE (NEW)
	UPDATE Buildings SET Cost = 1800, PrereqTech = 'TECH_BALLISTICS', NumPoliciesNeeded = 19 WHERE Type = 'BUILDING_RUSHMORE';
	UPDATE Buildings SET WonderSplashAnchor = 'C,B' WHERE Type = 'BUILDING_RUSHMORE';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyMountainRequired = 1 WHERE Type = 'BUILDING_RUSHMORE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));

	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,			FeatureType) 
	SELECT		'BUILDING_RUSHMORE',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET SingleLeagueVotes = 1, SpecialistType = 'SPECIALIST_ARTIST', SpecialistCount = 1 WHERE Type = 'BUILDING_RUSHMORE';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_RUSHMORE',	'YIELD_TOURISM',	3);
		
	INSERT INTO Building_GreatWorkYieldChanges
				(BuildingType,			YieldType,			Yield) 
	VALUES		('BUILDING_RUSHMORE',	'YIELD_CULTURE',	1),
				('BUILDING_RUSHMORE',	'YIELD_TOURISM',	1);

	INSERT INTO Building_YieldPerXTerrainTimes100
				(BuildingType,			TerrainType,			YieldType,			Yield) 
	VALUES		('BUILDING_RUSHMORE',	'TERRAIN_MOUNTAIN',		'YIELD_PRODUCTION',	100),
				('BUILDING_RUSHMORE',	'TERRAIN_MOUNTAIN',		'YIELD_CULTURE',	100),
				('BUILDING_RUSHMORE',	'TERRAIN_MOUNTAIN',		'YIELD_TOURISM',	200);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_RUSHMORE',	'FLAVOR_CULTURE',		70),
				('BUILDING_RUSHMORE',	'FLAVOR_PRODUCTION',	20),
				('BUILDING_RUSHMORE',	'FLAVOR_DIPLOMACY',		10);
--============================================--
-- ATOMIC ERA
--============================================--
-- HABITAT-67 (NEW)
	UPDATE Buildings SET Cost = 2100, PrereqTech = 'TECH_PENICILIN', NumPoliciesNeeded = 20 WHERE Type = 'BUILDING_HABITAT';
	UPDATE Buildings SET WonderSplashAnchor = 'C,B' WHERE Type = 'BUILDING_HABITAT';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1, NearbyTerrainRequired = 'TERRAIN_TUNDRA' WHERE Type = 'BUILDING_HABITAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------
	UPDATE Buildings SET DistressFlatReduction = 2, NoUnhappfromXSpecialists = 3, PopulationChange = 3 WHERE Type = 'BUILDING_HABITAT';
	
	INSERT INTO Building_SpecialistYieldChanges
				(BuildingType,			SpecialistType,			YieldType,			Yield) 
	VALUES		('BUILDING_HABITAT',	'SPECIALIST_ENGINEER',	'YIELD_CULTURE',	1);
	
	INSERT INTO Building_BuildingClassLocalHappiness 
				(BuildingType,			BuildingClassType,					Happiness)
	VALUES		('BUILDING_HABITAT',	'BUILDINGCLASS_GARDEN',				1),
				('BUILDING_HABITAT',	'BUILDINGCLASS_HOSPITAL',			1),
				('BUILDING_HABITAT',	'BUILDINGCLASS_MUSEUM',				1),
				('BUILDING_HABITAT',	'BUILDINGCLASS_POLICE_STATION',		1);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_HABITAT',	'FLAVOR_CULTURE',		20),
				('BUILDING_HABITAT',	'FLAVOR_GROWTH',		40),
				('BUILDING_HABITAT',	'FLAVOR_HAPPINESS',		100);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- VOSTOK STATION (NEW)
	UPDATE Buildings SET Cost = 2100, PrereqTech = 'TECH_REFRIGERATION', NumPoliciesNeeded = 22 WHERE Type = 'BUILDING_VOSTOK';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_VOSTOK';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1, NearbyTerrainRequired = 'TERRAIN_SNOW' WHERE Type = 'BUILDING_VOSTOK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------
	UPDATE Buildings SET SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 3 WHERE Type = 'BUILDING_VOSTOK';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_VOSTOK',		'YIELD_SCIENCE',	1);
		
	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,			BuildingClassType,				YieldType,			YieldChange) 
	VALUES		('BUILDING_VOSTOK',		'BUILDINGCLASS_LABORATORY',		'YIELD_SCIENCE',	2),
				('BUILDING_VOSTOK',		'BUILDINGCLASS_MEDICAL_LAB',	'YIELD_FOOD',		3);
	
	INSERT INTO Building_LakePlotYieldChanges 
				(BuildingType,		YieldType,			Yield)
	VALUES		('BUILDING_VOSTOK',	'YIELD_SCIENCE',	5);	
	
	INSERT INTO Building_TerrainYieldChanges
				(BuildingType,		TerrainType,		YieldType,				Yield) 
	VALUES		('BUILDING_VOSTOK',	'TERRAIN_SNOW',		'YIELD_FOOD',			1),
				('BUILDING_VOSTOK',	'TERRAIN_SNOW',		'YIELD_PRODUCTION',		1),
				('BUILDING_VOSTOK',	'TERRAIN_SNOW',		'YIELD_SCIENCE',		4);
	--------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_VOSTOK',	'FLAVOR_SCIENCE',		100),
				('BUILDING_VOSTOK',	'FLAVOR_GROWTH',		40),
				('BUILDING_VOSTOK',	'FLAVOR_PRODUCTION',	20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MILESTII MICI WINERY (NEW)
	UPDATE Buildings SET Cost = 2100, PrereqTech = 'TECH_REFRIGERATION', NumPoliciesNeeded = 22 WHERE Type = 'BUILDING_MILESTII_MICI';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_MILESTII_MICI';
	---------------------------------------------------------
	UPDATE Buildings SET IsNoWater = 1/*, IsNoCoast = 1*/ WHERE Type = 'BUILDING_MILESTII_MICI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,				FeatureType) 
	SELECT		'BUILDING_MILESTII_MICI',	'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	INSERT INTO Building_YieldChanges 
				(BuildingType,					YieldType,			Yield)
	VALUES		('BUILDING_MILESTII_MICI',		'YIELD_FOOD',		2),
				('BUILDING_MILESTII_MICI',		'YIELD_GOLD',		4);
		
	INSERT INTO Building_SpecialistYieldChanges
				(BuildingType,				SpecialistType,			YieldType,				Yield) 
	VALUES		('BUILDING_MILESTII_MICI',	'SPECIALIST_MERCHANT',	'YIELD_FOOD',			1),
				('BUILDING_MILESTII_MICI',	'SPECIALIST_MERCHANT',	'YIELD_PRODUCTION',		1);
	
	INSERT INTO Building_YieldPerFriend
				(BuildingType,				YieldType,		Yield) 
	VALUES		('BUILDING_MILESTII_MICI',	'YIELD_FOOD',	1),
				('BUILDING_MILESTII_MICI',	'YIELD_GOLD',	1);
	
	INSERT INTO Building_YieldPerAlly
				(BuildingType,				YieldType,				Yield) 
	VALUES		('BUILDING_MILESTII_MICI',	'YIELD_FOOD',			2),
				('BUILDING_MILESTII_MICI',	'YIELD_PRODUCTION',		1),
				('BUILDING_MILESTII_MICI',	'YIELD_GOLD',			2);
	
	INSERT INTO Building_HurryModifiers
				(BuildingType,				HurryType,		HurryCostModifier)
	VALUES		('BUILDING_MILESTII_MICI',	'HURRY_GOLD',	-10);		
	--------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_MILESTII_MICI',	'FLAVOR_SCIENCE',		100),
				('BUILDING_MILESTII_MICI',	'FLAVOR_GROWTH',		40),
				('BUILDING_MILESTII_MICI',	'FLAVOR_PRODUCTION',	20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- JFK SPACE CENTER (NEW)
	UPDATE Buildings SET Cost = 2100, PrereqTech = 'TECH_ROCKETRY', NumPoliciesNeeded = 22 WHERE Type = 'BUILDING_JFK';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T' WHERE Type = 'BUILDING_JFK';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1, Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_JFK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,		BuildingClassType) 
	SELECT		'BUILDING_JFK',		'BUILDINGCLASS_LABORATORY' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET FreePolicies = 1, AirModifier = 2, IlliteracyFlatReduction = 1, EnhancedYieldTech = 'TECH_SATELLITES' WHERE Type = 'BUILDING_JFK';

	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,						Yield)
	VALUES		('BUILDING_JFK',	'YIELD_PRODUCTION',				1),
				('BUILDING_JFK',	'YIELD_SCIENCE',				1),
				('BUILDING_JFK',	'YIELD_TOURISM',				2),
				('BUILDING_JFK',	'YIELD_GREAT_GENERAL_POINTS',	1);
	
	INSERT INTO Building_UnitCombatProductionModifiers
				(BuildingType,		UnitCombatType,					Modifier)
	VALUES		('BUILDING_JFK',	'UNITCOMBAT_SPACESHIP_PART',	20);

	INSERT INTO Building_TechEnhancedYieldChanges
				(BuildingType,		YieldType,			Yield) 
	VALUES		('BUILDING_JFK',	'YIELD_SCIENCE',	3);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_JFK',	'FLAVOR_SPACESHIP',		50),
				('BUILDING_JFK',	'FLAVOR_PRODUCTION',	10),
				('BUILDING_JFK',	'FLAVOR_SCIENCE',		80),
				('BUILDING_JFK',	'FLAVOR_OFFENSE',		10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- SPUTNIK (NEW)
	UPDATE Buildings SET Cost = 2100, PrereqTech = 'TECH_ROCKETRY', NumPoliciesNeeded = 22 WHERE Type = 'BUILDING_SPUTNIK';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_SPUTNIK';
	---------------------------------------------------------
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,		ResourceType) 
	SELECT		'BUILDING_SPUTNIK',	'RESOURCE_ALUMINUM' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	-- + Scientists(3) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET FreePolicies = 1, GoldenAge = 1 WHERE Type = 'BUILDING_SPUTNIK';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,						Yield)
	VALUES		('BUILDING_SPUTNIK',	'YIELD_SCIENCE',				1),
				('BUILDING_SPUTNIK',	'YIELD_GOLDEN_AGE_POINTS',		3);

	INSERT INTO Building_UnitCombatProductionModifiers
				(BuildingType,			UnitCombatType,					Modifier)
	VALUES		('BUILDING_SPUTNIK',	'UNITCOMBAT_SPACESHIP_PART',	20);

	INSERT INTO Building_SpecificGreatPersonRateModifier 
				(BuildingType,			SpecialistType,			Modifier)
	VALUES		('BUILDING_SPUTNIK',	'SPECIALIST_ENGINEER',	33),
				('BUILDING_SPUTNIK',	'SPECIALIST_SCIENTIST',	25);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_SPUTNIK',	'FLAVOR_SPACESHIP',		50),
				('BUILDING_SPUTNIK',	'FLAVOR_PRODUCTION',	70),
				('BUILDING_SPUTNIK',	'FLAVOR_SCIENCE',		50);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- PENTAGON
	UPDATE Buildings SET Cost = 2100 WHERE Type = 'BUILDING_PENTAGON';
	UPDATE Buildings SET WonderSplashAnchor = 'C,B' WHERE Type = 'BUILDING_PENTAGON';
	---------------------------------------------------------
	UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_PENTAGON' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	-- + Citadel/Fort(1) (lua) (ALL)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- ANITKABIR (NEW)
	UPDATE Buildings SET Cost = 2100, PrereqTech = 'TECH_COMBINED_ARMS', NumPoliciesNeeded = 20 WHERE Type = 'BUILDING_ANITKABIR';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_ANITKABIR';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1,*/ Hill = 1 WHERE Type = 'BUILDING_ANITKABIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Hill = 1 WHERE Type = 'BUILDING_ANITKABIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

	INSERT INTO Building_LocalFeatureOrs 
				(BuildingType,				FeatureType) 
	SELECT		'BUILDING_ANITKABIR',		'FEATURE_FOREST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_ANITKABIR',		'FEATURE_JUNGLE' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET FreePolicies = 1, SingleLeagueVotes = 1, CapitalsToVotes = 1 WHERE Type = 'BUILDING_ANITKABIR';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,					Yield)
	VALUES		('BUILDING_ANITKABIR',	'YIELD_CULTURE',			2),
				('BUILDING_ANITKABIR',	'YIELD_GOLDEN_AGE_POINTS',	3);

	INSERT INTO Building_UnitCombatProductionModifiers
				(BuildingType,			UnitCombatType,				Modifier)
	VALUES		('BUILDING_ANITKABIR',	'UNITCOMBAT_DIPLOMACY',		50);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_ANITKABIR',	'FLAVOR_DIPLOMACY',		120),
				('BUILDING_ANITKABIR',	'FLAVOR_CULTURE',		50);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- THULE AIR BASE (NEW)
	UPDATE Buildings SET Cost = 2350, PrereqTech = 'TECH_ELECTRONICS', NumPoliciesNeeded = 23 WHERE Type = 'BUILDING_THULE';
	UPDATE Buildings SET WonderSplashAnchor = 'C,B' WHERE Type = 'BUILDING_THULE';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10, NearbyTerrainRequired = 'TERRAIN_SNOW' WHERE Type = 'BUILDING_THULE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_SNOW' WHERE Type = 'BUILDING_THULE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------
	UPDATE Buildings SET CitySupplyFlat = 2, AirModifier = 3, FreePromotion = 'PROMOTION_THULE' WHERE Type = 'BUILDING_THULE';

	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,						Yield)
	VALUES		('BUILDING_THULE',	'YIELD_SCIENCE',				1),
				('BUILDING_THULE',	'YIELD_GOLDEN_AGE_POINTS',		1),
				('BUILDING_THULE',	'YIELD_GREAT_GENERAL_POINTS',	1);

	INSERT INTO Building_DomainFreeExperiences
				(BuildingType,		DomainType,		Experience)
	VALUES		('BUILDING_THULE',	'DOMAIN_AIR',	5);

	INSERT INTO Building_DomainFreeExperiencesGlobal
				(BuildingType,		DomainType,		Experience)
	VALUES		('BUILDING_THULE',	'DOMAIN_AIR',	5);
	
	INSERT INTO UnitPromotions 
				(Type,				Description,				Help,							Sound,				CannotBeChosen, LostWithUpgrade,	RangedAttackModifier,	RangeChange,	PortraitIndex,	IconAtlas,						PediaType,		PediaEntry) 
	VALUES		('PROMOTION_THULE',	'TXT_KEY_PROMOTION_THULE',	'TXT_KEY_PROMOTION_THULE_HELP',	'AS2D_IF_LEVELUP',	1,				0,					5,						2,				15,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_THULE');

	INSERT INTO UnitPromotions_UnitCombats
				(PromotionType,		UnitCombatType)
	VALUES		('PROMOTION_THULE',	'UNITCOMBAT_BOMBER'),
				('PROMOTION_THULE',	'UNITCOMBAT_FIGHTER');
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,						Flavor)
	VALUES		('BUILDING_THULE',	'FLAVOR_OFFENSE',				50),
				('BUILDING_THULE',	'FLAVOR_DEFENSE',				10),
				('BUILDING_THULE',	'FLAVOR_MILITARY_TRAINING',		80),
				('BUILDING_THULE',	'FLAVOR_AIR',					70),
				('BUILDING_THULE',	'FLAVOR_SCIENCE',				10);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- WHITE SANDS MISSILE RANGE (NEW)
	UPDATE Buildings SET Cost = 2350, PrereqTech = 'TECH_ELECTRONICS', NumPoliciesNeeded = 23 WHERE Type = 'BUILDING_WHITE_SANDS';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_WHITE_SANDS';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_DESERT', Flat = 1 WHERE Type = 'BUILDING_WHITE_SANDS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------
	UPDATE Buildings SET FreePromotion = 'PROMOTION_WHITE_SANDS', SpaceProductionModifier = 35 WHERE Type = 'BUILDING_WHITE_SANDS';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,							Yield)
	VALUES		('BUILDING_WHITE_SANDS',	'YIELD_SCIENCE',				3),
				('BUILDING_WHITE_SANDS',	'YIELD_GREAT_GENERAL_POINTS',	1);

	INSERT INTO Building_FreeUnits
				(BuildingType,				UnitType,				NumUnits)
	VALUES		('BUILDING_WHITE_SANDS',	'UNIT_GUIDED_MISSILE',	3);

	INSERT INTO Building_UnitCombatProductionModifiers
				(BuildingType,				UnitCombatType,					Modifier)
	VALUES		('BUILDING_WHITE_SANDS',	'UNITCOMBAT_MISSILE',			33),
				('BUILDING_WHITE_SANDS',	'UNITCOMBAT_SPACESHIP_PART',	10);

	INSERT INTO UnitPromotions 
				(Type,						Description,						Help,									Sound,				CannotBeChosen, LostWithUpgrade,	RangeChange,	PortraitIndex,	IconAtlas,						PediaType,		PediaEntry) 
	VALUES		('PROMOTION_WHITE_SANDS',	'TXT_KEY_PROMOTION_WHITE_SANDS',	'TXT_KEY_PROMOTION_WHITE_SANDS_HELP',	'AS2D_IF_LEVELUP',	1,				0,					2,				1,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_WHITE_SANDS');

	INSERT INTO UnitPromotions_UnitCombats
				(PromotionType,				UnitCombatType)
	VALUES		('PROMOTION_WHITE_SANDS',	'UNITCOMBAT_MISSILE');
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,				FlavorType,				Flavor)
	VALUES		('BUILDING_WHITE_SANDS',	'FLAVOR_SPACESHIP',		50),
				('BUILDING_WHITE_SANDS',	'FLAVOR_PRODUCTION',	40),
				('BUILDING_WHITE_SANDS',	'FLAVOR_OFFENSE',		40),
				('BUILDING_WHITE_SANDS',	'FLAVOR_SCIENCE',		10),
				('BUILDING_WHITE_SANDS',	'FLAVOR_AIR',			20);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- BLETCHEY PARK
	UPDATE Buildings SET Cost = 2350 WHERE Type = 'BUILDING_BLETCHLEY_PARK';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_BLETCHLEY_PARK';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */NearbyTerrainRequired = 'TERRAIN_GRASS' WHERE Type = 'BUILDING_BLETCHLEY_PARK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MILLAU VIADUCT (NEW)
	UPDATE Buildings SET Cost = 2350, PrereqTech = 'TECH_COMPUTERS', NumPoliciesNeeded = 24 WHERE Type = 'BUILDING_MILLAU';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_MILLAU';
	---------------------------------------------------------
	UPDATE Buildings SET Hill = 1/*, IsNoCoast = 1*/ WHERE Type = 'BUILDING_MILLAU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Hill = 1 WHERE Type = 'BUILDING_MILLAU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	-- + Village(1) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET Happiness = 1, TradeRouteLandDistanceModifier = 100, NoUnhappfromXSpecialists = 2 WHERE Type = 'BUILDING_MILLAU';

	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,			Yield)
	VALUES		('BUILDING_MILLAU',	'YIELD_PRODUCTION',	1),
				('BUILDING_MILLAU',	'YIELD_TOURISM',	1);

	INSERT INTO Building_GlobalYieldModifiers
				(BuildingType,		YieldType,			Yield) 
	VALUES		('BUILDING_MILLAU',	'YIELD_TOURISM',	5);

	INSERT INTO Building_YieldFromYieldPercent
				(BuildingType,		YieldIn,			YieldOut,			Value) 
	VALUES		('BUILDING_MILLAU',	'YIELD_PRODUCTION',	'YIELD_TOURISM',	5);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_MILLAU',	'FLAVOR_CULTURE',		40),
				('BUILDING_MILLAU',	'FLAVOR_PRODUCTION',	10),
				('BUILDING_MILLAU',	'FLAVOR_HAPPINESS',		60);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- MOTHERLAND CALLS
	UPDATE Buildings SET Cost = 2350 WHERE Type = 'BUILDING_MOTHERLAND_STATUE';
	UPDATE Buildings SET NumPoliciesNeeded = 24, PrereqTech = 'TECH_NUCLEAR_FISSION' WHERE Type = 'BUILDING_MOTHERLAND_STATUE';
	UPDATE Buildings SET WonderSplashAnchor = 'C,T' WHERE Type = 'BUILDING_MOTHERLAND_STATUE';
	---------------------------------------------------------
	UPDATE Buildings SET /*IsNoCoast = 1, */Hill = 1, River = 1 WHERE Type = 'BUILDING_MOTHERLAND_STATUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET Hill = 1 WHERE Type = 'BUILDING_MOTHERLAND_STATUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- REVOLUTIONARY_MUSEUM (NEW)
	UPDATE Buildings SET Cost = 2350, PrereqTech = 'TECH_NUCLEAR_FISSION', NumPoliciesNeeded = 24 WHERE Type = 'BUILDING_REVOLUTIONARY_MUSEUM';
	UPDATE Buildings SET WonderSplashAnchor = 'C,B' WHERE Type = 'BUILDING_REVOLUTIONARY_MUSEUM';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1 WHERE Type = 'BUILDING_REVOLUTIONARY_MUSEUM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value-1 OR Value=2));
	
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,						BuildingClassType) 
	SELECT		'BUILDING_REVOLUTIONARY_MUSEUM',	'BUILDINGCLASS_POLICE_STATION'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_REVOLUTIONARY_MUSEUM',	'BUILDINGCLASS_BROADCAST_TOWER' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------
	UPDATE Buildings SET GreatPeopleRateModifier = 10, FreePolicies = 1 WHERE Type = 'BUILDING_REVOLUTIONARY_MUSEUM';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_REVOLUTIONARY_MUSEUM',	'YIELD_TOURISM',	2);

	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,			BuildingClassType,				YieldType,			YieldChange) 
	VALUES		('BUILDING_REVOLUTIONARY_MUSEUM',	'BUILDINGCLASS_MONUMENT',		'YIELD_CULTURE',	3),
				('BUILDING_REVOLUTIONARY_MUSEUM',	'BUILDINGCLASS_CONSTABLE',		'YIELD_TOURISM',	2),
				('BUILDING_REVOLUTIONARY_MUSEUM',	'BUILDINGCLASS_POLICE_STATION',	'YIELD_TOURISM',	2);

	INSERT INTO Building_YieldFromGPExpend
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_REVOLUTIONARY_MUSEUM',	'YIELD_CULTURE',	50);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,			Flavor)
	VALUES		('BUILDING_REVOLUTIONARY_MUSEUM',	'FLAVOR_CULTURE',	150);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- ARECIBO OBSERVATORY (NEW)
	UPDATE Buildings SET Cost = 2350, PrereqTech = 'TECH_RADAR', NumPoliciesNeeded = 0 WHERE Type = 'BUILDING_ARECIBO';
	UPDATE Buildings SET WonderSplashAnchor = 'C,T' WHERE Type = 'BUILDING_ARECIBO';
	---------------------------------------------------------
	UPDATE Buildings SET NearbyMountainRequired = 1 WHERE Type = 'BUILDING_ARECIBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + Academy(1) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET SingleLeagueVotes = 1, SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 2 WHERE Type = 'BUILDING_ARECIBO';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_ARECIBO',	'YIELD_SCIENCE',	4);
	
	INSERT INTO Building_SpecialistYieldChanges
				(BuildingType,			SpecialistType,			YieldType,			Yield) 
	VALUES		('BUILDING_ARECIBO',	'SPECIALIST_SCIENTIST',	'YIELD_SCIENCE',	1);
	
	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,			BuildingClassType,				YieldType,			YieldChange) 
	VALUES		('BUILDING_ARECIBO',	'BUILDINGCLASS_OBSERVATORY',	'YIELD_SCIENCE',	2);

	INSERT INTO Building_YieldPerXTerrainTimes100
				(BuildingType,				TerrainType,			YieldType,			Yield) 
	VALUES		('BUILDING_ARECIBO_DUMMY',	'TERRAIN_MOUNTAIN',		'YIELD_SCIENCE',	100);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_ARECIBO',	'FLAVOR_SCIENCE',		100),
				('BUILDING_ARECIBO',	'FLAVOR_DIPLOMACY',		20);
--============================================--
-- INFORMATION ERA
--============================================--
-- SVALBARD GLOBAL SEED VAULT (NEW)
	UPDATE Buildings SET Cost = 2650, PrereqTech = 'TECH_ECOLOGY', NumPoliciesNeeded = 23 WHERE Type = 'BUILDING_SEED_VAULT';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_SEED_VAULT';
	---------------------------------------------------------
	UPDATE Buildings SET IsNoWater = 1/*, IsNoCoast = 1*/, NearbyTerrainRequired = 'TERRAIN_SNOW' WHERE Type = 'BUILDING_SEED_VAULT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET IsNoWater = 1, NearbyTerrainRequired = 'TERRAIN_SNOW' WHERE Type = 'BUILDING_SEED_VAULT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	---------------------------------------------------------
	UPDATE Buildings SET BasicNeedsMedianModifierGlobal = -15 WHERE Type = 'BUILDING_SEED_VAULT';

	INSERT INTO Building_YieldChanges 
				(BuildingType,			YieldType,			Yield)
	VALUES		('BUILDING_SEED_VAULT',	'YIELD_FOOD',		5);

	INSERT INTO Building_GlobalYieldModifiers 
				(BuildingType,			YieldType,		Yield) 
	VALUES		('BUILDING_SEED_VAULT',	'YIELD_FOOD',	10);

	INSERT INTO Building_ResourceYieldChangesGlobal 
				(BuildingType,			ResourceType,		YieldType,			Yield) 
	VALUES		('BUILDING_SEED_VAULT',	'RESOURCE_WHEAT',	'YIELD_FOOD',		2),
				('BUILDING_SEED_VAULT',	'RESOURCE_MAIZE',	'YIELD_FOOD',		2),
				('BUILDING_SEED_VAULT',	'RESOURCE_RICE',	'YIELD_FOOD',		2);

	INSERT INTO Building_GrowthExtraYield
				(BuildingType,					YieldType,			Yield) 
	VALUES		('BUILDING_SEED_VAULT_DUMMY',	'YIELD_PRODUCTION',	50);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_SEED_VAULT',	'FLAVOR_GROWTH',		150),
				('BUILDING_SEED_VAULT',	'FLAVOR_PRODUCTION',	30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- CN TOWER
	UPDATE Buildings SET Cost = 2650 WHERE Type = 'BUILDING_CN_TOWER';
	UPDATE Buildings SET WonderSplashAnchor = 'R,T' WHERE Type = 'BUILDING_CN_TOWER';
	---------------------------------------------------------
	UPDATE Buildings SET Flat = 1, FreshWater = 1, Water = 1, MinAreaSize = 1 WHERE Type = 'BUILDING_CN_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET FreshWater = 1, Water = 1, MinAreaSize = 1 WHERE Type = 'BUILDING_CN_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	-- + Happiness(80) (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- SYDNEY OPERA HOUSE
	UPDATE Buildings SET Cost = 2650 WHERE Type = 'BUILDING_SYDNEY_OPERA_HOUSE';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_SYDNEY_OPERA_HOUSE';
	UPDATE Buildings SET PrereqTech = 'TECH_TELECOM' WHERE Type = 'BUILDING_SYDNEY_OPERA_HOUSE';
	UPDATE Buildings SET NumPoliciesNeeded = 25 WHERE Type = 'BUILDING_SYDNEY_OPERA_HOUSE';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_SYDNEY_OPERA_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + GW_of_Music(3) (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- PALM JUMEIRAH (NEW)
	UPDATE Buildings SET Cost = 2650, PrereqTech = 'TECH_SATELLITES', NumPoliciesNeeded = 26 WHERE Type = 'BUILDING_JUMEIRAH';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_JUMEIRAH';
	---------------------------------------------------------
	UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_JUMEIRAH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));

	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,			ResourceType) 
	SELECT		'BUILDING_JUMEIRAH',	'RESOURCE_OIL' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	INSERT INTO Building_TerrainYieldChanges
				(BuildingType,			TerrainType,			YieldType,				Yield) 
	VALUES		('BUILDING_JUMEIRAH',	'TERRAIN_DESERT',		'YIELD_PRODUCTION',		3);
	
	INSERT INTO Building_FeatureYieldChanges
				(BuildingType,				FeatureType,		YieldType,				Yield) 
	VALUES		('BUILDING_JUMEIRAH_DUMMY',	'FEATURE_ATOLL',	'YIELD_TOURISM',		7);

	INSERT INTO Building_ResourceYieldChangesGlobal 
				(BuildingType,			ResourceType,		YieldType,			Yield) 
	VALUES		('BUILDING_JUMEIRAH',	'RESOURCE_OIL',		'YIELD_GOLD',		4);

	INSERT INTO Building_YieldFromYieldPercent
				(BuildingType,			YieldIn,			YieldOut,			Value) 
	VALUES		('BUILDING_JUMEIRAH',	'YIELD_PRODUCTION',	'YIELD_GOLD',		10),
				('BUILDING_JUMEIRAH',	'YIELD_PRODUCTION',	'YIELD_TOURISM',	15);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_JUMEIRAH',	'FLAVOR_PRODUCTION',	30),
				('BUILDING_JUMEIRAH',	'FLAVOR_GOLD',			60),
				('BUILDING_JUMEIRAH',	'FLAVOR_CULTURE',		30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- TAIPEI (NEW)
	UPDATE Buildings SET Cost = 2650, PrereqTech = 'TECH_ADVANCED_BALLISTICS', NumPoliciesNeeded = 25 WHERE Type = 'BUILDING_TAIPEI';
	UPDATE Buildings SET WonderSplashAnchor = 'R,C' WHERE Type = 'BUILDING_TAIPEI';
	---------------------------------------------------------
	-- + Village(1) (lua) (HARD)
	-- + CS_Ally(3) (lua) (HARD)
	---------------------------------------------------------
	UPDATE Buildings SET SingleLeagueVotes = 1 WHERE Type = 'BUILDING_TAIPEI';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,			Yield)
	VALUES		('BUILDING_TAIPEI',	'YIELD_SCIENCE',	1),
				('BUILDING_TAIPEI',	'YIELD_GOLD',		2),
				('BUILDING_TAIPEI',	'YIELD_CULTURE',	1),
				('BUILDING_TAIPEI',	'YIELD_TOURISM',	2);
	
	INSERT INTO Building_SpecialistYieldChanges
				(BuildingType,		SpecialistType,			YieldType,			Yield) 
	VALUES		('BUILDING_TAIPEI',	'SPECIALIST_ENGINEER',	'YIELD_SCIENCE',	1);
	
	INSERT INTO Building_BuildingClassYieldChanges 
				(BuildingType,		BuildingClassType,				YieldType,		YieldChange) 
	VALUES		('BUILDING_TAIPEI',	'BUILDINGCLASS_BANK',			'YIELD_GOLD',	2),
				('BUILDING_TAIPEI',	'BUILDINGCLASS_STOCK_EXCHANGE',	'YIELD_GOLD',	2);
	
	INSERT INTO Building_ImprovementYieldChanges
				(BuildingType,		ImprovementType,				YieldType,			Yield) 
	VALUES		('BUILDING_TAIPEI',	'IMPROVEMENT_CUSTOMS_HOUSE',	'YIELD_GOLD',		2),
				('BUILDING_TAIPEI',	'IMPROVEMENT_TRADING_POST',		'YIELD_GOLD',		2);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_TAIPEI',	'FLAVOR_SCIENCE',		10),
				('BUILDING_TAIPEI',	'FLAVOR_GOLD',			70),
				('BUILDING_TAIPEI',	'FLAVOR_DIPLOMACY',		30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- CURIOSITY ROVER (NEW)
	UPDATE Buildings SET Cost = 2950, PrereqTech = 'TECH_ROBOTICS', NumPoliciesNeeded = 26 WHERE Type = 'BUILDING_CURIOSITY';
	UPDATE Buildings SET WonderSplashAnchor = 'L,T' WHERE Type = 'BUILDING_CURIOSITY';
	---------------------------------------------------------
	UPDATE Buildings SET IsNoWater = 1/*, IsNoCoast = 1*/ WHERE Type = 'BUILDING_CURIOSITY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_DESERT' WHERE Type = 'BUILDING_CURIOSITY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,			ResourceType) 
	SELECT		'BUILDING_CURIOSITY',	'RESOURCE_ALUMINUM' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	---------------------------------------------------------
	UPDATE Buildings SET MinorFriendshipChange = 50 WHERE Type = 'BUILDING_CURIOSITY';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,					YieldType,					Yield)
	VALUES		('BUILDING_CURIOSITY',			'YIELD_GOLD',				1),
				('BUILDING_CURIOSITY',			'YIELD_SCIENCE',			3),
				('BUILDING_CURIOSITY',			'YIELD_GOLDEN_AGE_POINTS',	2),
				('BUILDING_CURIOSITY_DUMMY',	'YIELD_GOLDEN_AGE_POINTS',	10);
	
	INSERT INTO Building_SpecialistYieldChanges
				(BuildingType,			SpecialistType,			YieldType,					Yield) 
	VALUES		('BUILDING_CURIOSITY',	'SPECIALIST_ENGINEER',	'YIELD_GOLDEN_AGE_POINTS',	3),
				('BUILDING_CURIOSITY',	'SPECIALIST_SCIENTIST',	'YIELD_GOLDEN_AGE_POINTS',	3);

	-- + yields_per_research_agreements (lua)
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,			FlavorType,				Flavor)
	VALUES		('BUILDING_CURIOSITY',	'FLAVOR_SCIENCE',		30),
				('BUILDING_CURIOSITY',	'FLAVOR_GOLD',			10),
				('BUILDING_CURIOSITY',	'FLAVOR_HAPPINESS',		70);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- GREAT FIREWALL
	UPDATE Buildings SET Cost = 2950 WHERE Type = 'BUILDING_GREAT_FIREWALL';
	UPDATE Buildings SET NumPoliciesNeeded = 27 WHERE Type = 'BUILDING_GREAT_FIREWALL';
	UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_GREAT_FIREWALL';
	---------------------------------------------------------
	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,				BuildingClassType) 
	SELECT		'BUILDING_GREAT_FIREWALL',	'BUILDINGCLASS_POLICE_STATION'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) UNION ALL
	SELECT		'BUILDING_GREAT_FIREWALL',	'BUILDINGCLASS_WIRE_SERVICE'	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- GLOBAL POSITIONING SYSTEM (NEW)
	UPDATE Buildings SET Cost = 2950, PrereqTech = 'TECH_INTERNET', NumPoliciesNeeded = 26 WHERE Type = 'BUILDING_GPS';
	UPDATE Buildings SET WonderSplashAnchor = 'C,T' WHERE Type = 'BUILDING_GPS';
	---------------------------------------------------------
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,		ResourceType) 
	SELECT		'BUILDING_GPS',		'RESOURCE_URANIUM' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);

	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,		BuildingClassType) 
	SELECT		'BUILDING_GPS',		'BUILDINGCLASS_BOMB_SHELTER' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	---------------------------------------------------------
	UPDATE Buildings SET Espionage = 1, GlobalSpySecurityModifier = 20, ExtraSpies = 2 WHERE Type = 'BUILDING_GPS';
	
	INSERT INTO Building_YieldChanges 
				(BuildingType,		YieldType,				Yield)
	VALUES		('BUILDING_GPS',	'YIELD_PRODUCTION',		3),
				('BUILDING_GPS',	'YIELD_GOLD',			2);
	
	INSERT INTO Building_YieldFromSpyAttack
				(BuildingType,		YieldType,						Yield) 
	VALUES		('BUILDING_GPS',	'YIELD_GREAT_GENERAL_POINTS',	25),
				('BUILDING_GPS',	'YIELD_GREAT_ADMIRAL_POINTS',	25);

	INSERT INTO Building_YieldFromSpyDefense
				(BuildingType,		YieldType,				Yield) 
	VALUES		('BUILDING_GPS',	'YIELD_PRODUCTION',		50),
				('BUILDING_GPS',	'YIELD_GOLD',			50);
	---------------------------------------------------------
	INSERT INTO Building_Flavors 
				(BuildingType,		FlavorType,				Flavor)
	VALUES		('BUILDING_GPS',	'FLAVOR_PRODUCTION',	50),
				('BUILDING_GPS',	'FLAVOR_GOLD',			50),
				('BUILDING_GPS',	'FLAVOR_OFFENSE',		40),
				('BUILDING_GPS',	'FLAVOR_DEFENSE',		30);
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- HUBBLE SPACE TELESCOPE
	UPDATE Buildings SET Cost = 2950 WHERE Type = 'BUILDING_HUBBLE';
	UPDATE Buildings SET NumPoliciesNeeded = 27 WHERE Type = 'BUILDING_HUBBLE';
	UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_HUBBLE';
	UPDATE Buildings SET PrereqTech = 'TECH_LASERS' WHERE Type = 'BUILDING_HUBBLE';
	---------------------------------------------------------
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,		ResourceType) 
	SELECT		'BUILDING_HUBBLE',	'RESOURCE_ALUMINUM' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));
	-- + Research Agreement(1) (lua) (HARD)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- CERN
	UPDATE Buildings SET NumPoliciesNeeded = 29 WHERE Type = 'BUILDING_CERN';
	UPDATE Buildings SET WonderSplashAnchor = 'C,C', WonderSplashImage = 'Wonder_CERN_splash.dds' WHERE Type = 'BUILDING_CERN';
	---------------------------------------------------------
	INSERT INTO Building_LocalResourceOrs 
				(BuildingType,		ResourceType) 
	SELECT		'BUILDING_CERN',	'RESOURCE_URANIUM' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=1 OR Value=2));

	INSERT INTO Building_ClassesNeededInCity 
				(BuildingType,		BuildingClassType) 
	SELECT		'BUILDING_CERN',	'BUILDINGCLASS_LABORATORY' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--============================================--
-- RELIGIOUS WONDERS (MUST BE BUILT IN HOLY CITY)
--============================================--
-- El Ghriba					- Judaism			- Late Classical
-- Hagia Sophia					- Orthodox/Islam	- Early Medieval
-- Borobudur					- Buddhism			- Early Medieval
-- Al Masjid an-Nabawi			- Islam				- Early Medieval
-- Rila Monastery (Karlstejn)	- Orthodox			- Late Medieval 
-- St Peter's Basilica			- Catholic			- Early Renaissance
-- Meenakshi Temple				- Hindu				- Early Renaissance
---------------------------------------------------------
UPDATE Buildings SET HolyCity = 1 WHERE Type IN
('BUILDING_EL_GHRIBA', 'BUILDING_NABAWI', 'BUILDING_HAGIA_SOPHIA', 'BUILDING_BOROBUDUR', 'BUILDING_KARLSTEJN', 'BUILDING_ST_PETERS', 'BUILDING_MEENAKSHI');

INSERT INTO Building_ClassNeededNowhere
			(BuildingType,				BuildingClassType) 
VALUES		('BUILDING_EL_GHRIBA',		'BUILDINGCLASS_NABAWI'),
			('BUILDING_EL_GHRIBA',		'BUILDINGCLASS_HAGIA_SOPHIA'),
			('BUILDING_EL_GHRIBA',		'BUILDINGCLASS_BOROBUDUR'),
			('BUILDING_EL_GHRIBA',		'BUILDINGCLASS_KARLSTEJN'),
			('BUILDING_EL_GHRIBA',		'BUILDINGCLASS_ST_PETERS'),
			('BUILDING_EL_GHRIBA',		'BUILDINGCLASS_MEENAKSHI'),		
			('BUILDING_NABAWI',			'BUILDINGCLASS_EL_GHRIBA'),
			('BUILDING_NABAWI',			'BUILDINGCLASS_HAGIA_SOPHIA'),
			('BUILDING_NABAWI',			'BUILDINGCLASS_BOROBUDUR'),
			('BUILDING_NABAWI',			'BUILDINGCLASS_KARLSTEJN'),
			('BUILDING_NABAWI',			'BUILDINGCLASS_ST_PETERS'),
			('BUILDING_NABAWI',			'BUILDINGCLASS_MEENAKSHI'),
			('BUILDING_HAGIA_SOPHIA',	'BUILDINGCLASS_EL_GHRIBA'),
			('BUILDING_HAGIA_SOPHIA',	'BUILDINGCLASS_NABAWI'),
			('BUILDING_HAGIA_SOPHIA',	'BUILDINGCLASS_BOROBUDUR'),
			('BUILDING_HAGIA_SOPHIA',	'BUILDINGCLASS_KARLSTEJN'),
			('BUILDING_HAGIA_SOPHIA',	'BUILDINGCLASS_ST_PETERS'),
			('BUILDING_HAGIA_SOPHIA',	'BUILDINGCLASS_MEENAKSHI'),
			('BUILDING_BOROBUDUR',		'BUILDINGCLASS_EL_GHRIBA'),
			('BUILDING_BOROBUDUR',		'BUILDINGCLASS_NABAWI'),
			('BUILDING_BOROBUDUR',		'BUILDINGCLASS_HAGIA_SOPHIA'),
			('BUILDING_BOROBUDUR',		'BUILDINGCLASS_KARLSTEJN'),
			('BUILDING_BOROBUDUR',		'BUILDINGCLASS_ST_PETERS'),
			('BUILDING_BOROBUDUR',		'BUILDINGCLASS_MEENAKSHI'),
			('BUILDING_KARLSTEJN',		'BUILDINGCLASS_EL_GHRIBA'),
			('BUILDING_KARLSTEJN',		'BUILDINGCLASS_NABAWI'),
			('BUILDING_KARLSTEJN',		'BUILDINGCLASS_HAGIA_SOPHIA'),
			('BUILDING_KARLSTEJN',		'BUILDINGCLASS_BOROBUDUR'),
			('BUILDING_KARLSTEJN',		'BUILDINGCLASS_ST_PETERS'),
			('BUILDING_KARLSTEJN',		'BUILDINGCLASS_MEENAKSHI'),
			('BUILDING_ST_PETERS',		'BUILDINGCLASS_EL_GHRIBA'),
			('BUILDING_ST_PETERS',		'BUILDINGCLASS_NABAWI'),
			('BUILDING_ST_PETERS',		'BUILDINGCLASS_HAGIA_SOPHIA'),
			('BUILDING_ST_PETERS',		'BUILDINGCLASS_BOROBUDUR'),
			('BUILDING_ST_PETERS',		'BUILDINGCLASS_KARLSTEJN'),
			('BUILDING_ST_PETERS',		'BUILDINGCLASS_MEENAKSHI'),
			('BUILDING_MEENAKSHI',		'BUILDINGCLASS_EL_GHRIBA'),
			('BUILDING_MEENAKSHI',		'BUILDINGCLASS_NABAWI'),
			('BUILDING_MEENAKSHI',		'BUILDINGCLASS_HAGIA_SOPHIA'),
			('BUILDING_MEENAKSHI',		'BUILDINGCLASS_BOROBUDUR'),
			('BUILDING_MEENAKSHI',		'BUILDINGCLASS_KARLSTEJN'),
			('BUILDING_MEENAKSHI',		'BUILDINGCLASS_ST_PETERS');
--============================================--
-- POLICY FINISHERS
--============================================--
UPDATE Buildings SET PolicyType = 'POLICY_TRADITION_FINISHER' 	WHERE Type IN ('BUILDING_MOSQUE_OF_DJENNE',	'BUILDING_NOTRE_DAME',		'BUILDING_SHWEDAGON');
UPDATE Buildings SET PolicyType = 'POLICY_LIBERTY_FINISHER' 	WHERE Type IN ('BUILDING_FORBIDDEN_PALACE',	'BUILDING_WARTBURG',		'BUILDING_BUYUK_HAN');
UPDATE Buildings SET PolicyType = 'POLICY_HONOR_FINISHER' 		WHERE Type IN ('BUILDING_ALHAMBRA',			'BUILDING_DAMASCUS',		'BUILDING_GREAT_ZIMBABWE');
UPDATE Buildings SET PolicyType = 'POLICY_PIETY_FINISHER' 		WHERE Type IN ('BUILDING_RED_FORT',			'BUILDING_KINKAKU_JI',		'BUILDING_SOLOVIETSKY');
UPDATE Buildings SET PolicyType = 'POLICY_PATRONAGE_FINISHER'	WHERE Type IN ('BUILDING_BIG_BEN', 			'BUILDING_KILWA_KISIWANI',	'BUILDING_OLD_BRIDGE');
UPDATE Buildings SET PolicyType = 'POLICY_AESTHETICS_FINISHER'	WHERE Type IN ('BUILDING_LOUVRE', 			'BUILDING_MONTE_CARLO',		'BUILDING_MUSEUM_ISLAND');
UPDATE Buildings SET PolicyType = 'POLICY_COMMERCE_FINISHER' 	WHERE Type IN ('BUILDING_BROADWAY', 		'BUILDING_RUHR_VALLEY',		'BUILDING_BANFF');
UPDATE Buildings SET PolicyType = 'POLICY_EXPLORATION_FINISHER'	WHERE Type IN ('BUILDING_BRANDENBURG_GATE', 'BUILDING_PENTAGON',		'BUILDING_WHITE_SANDS');
UPDATE Buildings SET PolicyType = 'POLICY_RATIONALISM_FINISHER'	WHERE Type IN ('BUILDING_BLETCHLEY_PARK',	'BUILDING_KEW_GARDENS',		'BUILDING_ARECIBO');

INSERT INTO Building_ClassNeededNowhere
			(BuildingType,						BuildingClassType) 
VALUES		('BUILDING_MOSQUE_OF_DJENNE',		'BUILDINGCLASS_NOTRE_DAME'),		-- tradition
			('BUILDING_MOSQUE_OF_DJENNE',		'BUILDINGCLASS_SHWEDAGON'),
			('BUILDING_NOTRE_DAME',				'BUILDINGCLASS_MOSQUE_OF_DJENNE'),
			('BUILDING_NOTRE_DAME',				'BUILDINGCLASS_SHWEDAGON'),
			('BUILDING_SHWEDAGON',				'BUILDINGCLASS_MOSQUE_OF_DJENNE'),
			('BUILDING_SHWEDAGON',				'BUILDINGCLASS_NOTRE_DAME'),
			------------------------------
			('BUILDING_FORBIDDEN_PALACE',		'BUILDINGCLASS_WARTBURG'),			-- liberty (progress)
			('BUILDING_FORBIDDEN_PALACE',		'BUILDINGCLASS_BUYUK_HAN'),
			('BUILDING_WARTBURG',				'BUILDINGCLASS_FORBIDDEN_PALACE'),
			('BUILDING_WARTBURG',				'BUILDINGCLASS_BUYUK_HAN'),
			('BUILDING_BUYUK_HAN',				'BUILDINGCLASS_FORBIDDEN_PALACE'),
			('BUILDING_BUYUK_HAN',				'BUILDINGCLASS_WARTBURG'),
			------------------------------
			('BUILDING_ALHAMBRA',				'BUILDINGCLASS_DAMASCUS'),			-- honor (authority)
			('BUILDING_ALHAMBRA',				'BUILDINGCLASS_GREAT_ZIMBABWE'),
			('BUILDING_DAMASCUS',				'BUILDINGCLASS_ALHAMBRA'),
			('BUILDING_DAMASCUS',				'BUILDINGCLASS_GREAT_ZIMBABWE'),
			('BUILDING_GREAT_ZIMBABWE',			'BUILDINGCLASS_ALHAMBRA'),
			('BUILDING_GREAT_ZIMBABWE',			'BUILDINGCLASS_DAMASCUS'),
			------------------------------
			('BUILDING_RED_FORT',				'BUILDINGCLASS_KINKAKU_JI'),		-- piety
			('BUILDING_RED_FORT',				'BUILDINGCLASS_SOLOVIETSKY'),
			('BUILDING_KINKAKU_JI',				'BUILDINGCLASS_RED_FORT'),
			('BUILDING_KINKAKU_JI',				'BUILDINGCLASS_SOLOVIETSKY'),
			('BUILDING_SOLOVIETSKY',			'BUILDINGCLASS_RED_FORT'),
			('BUILDING_SOLOVIETSKY',			'BUILDINGCLASS_KINKAKU_JI'),
			------------------------------
			('BUILDING_BIG_BEN',				'BUILDINGCLASS_KILWA_KISIWANI'),	-- patronage
			('BUILDING_BIG_BEN',				'BUILDINGCLASS_OLD_BRIDGE'),
			('BUILDING_KILWA_KISIWANI',			'BUILDINGCLASS_BIG_BEN'),
			('BUILDING_KILWA_KISIWANI',			'BUILDINGCLASS_OLD_BRIDGE'),
			('BUILDING_OLD_BRIDGE',				'BUILDINGCLASS_BIG_BEN'),
			('BUILDING_OLD_BRIDGE',				'BUILDINGCLASS_KILWA_KISIWANI'),
			------------------------------
			('BUILDING_LOUVRE',					'BUILDINGCLASS_MONTE_CARLO'),		-- aesthetics
			('BUILDING_LOUVRE',					'BUILDINGCLASS_MUSEUM_ISLAND'),
			('BUILDING_MONTE_CARLO',			'BUILDINGCLASS_LOUVRE'),
			('BUILDING_MONTE_CARLO',			'BUILDINGCLASS_MUSEUM_ISLAND'),
			('BUILDING_MUSEUM_ISLAND',			'BUILDINGCLASS_LOUVRE'),
			('BUILDING_MUSEUM_ISLAND',			'BUILDINGCLASS_MONTE_CARLO'),
			------------------------------
			('BUILDING_BROADWAY',				'BUILDINGCLASS_RUHR_VALLEY'),		-- commerce
			('BUILDING_BROADWAY',				'BUILDINGCLASS_BANFF'),
			('BUILDING_RUHR_VALLEY',			'BUILDINGCLASS_BROADWAY'),
			('BUILDING_RUHR_VALLEY',			'BUILDINGCLASS_BANFF'),
			('BUILDING_BANFF',					'BUILDINGCLASS_BROADWAY'),
			('BUILDING_BANFF',					'BUILDINGCLASS_RUHR_VALLEY'),
			------------------------------
			('BUILDING_BRANDENBURG_GATE',		'BUILDINGCLASS_PENTAGON'),			-- exploration (imperialism)
			('BUILDING_BRANDENBURG_GATE',		'BUILDINGCLASS_WHITE_SANDS'),
			('BUILDING_PENTAGON',				'BUILDINGCLASS_BRANDENBURG_GATE'),
			('BUILDING_PENTAGON',				'BUILDINGCLASS_WHITE_SANDS'),
			('BUILDING_WHITE_SANDS',			'BUILDINGCLASS_BRANDENBURG_GATE'),
			('BUILDING_WHITE_SANDS',			'BUILDINGCLASS_PENTAGON'),
			------------------------------
			('BUILDING_BLETCHLEY_PARK',			'BUILDINGCLASS_KEW_GARDENS'),		-- rationalism
			('BUILDING_BLETCHLEY_PARK',			'BUILDINGCLASS_ARECIBO'),
			('BUILDING_KEW_GARDENS',			'BUILDINGCLASS_BLETCHLEY_PARK'),
			('BUILDING_KEW_GARDENS',			'BUILDINGCLASS_ARECIBO'),
			('BUILDING_ARECIBO',				'BUILDINGCLASS_BLETCHLEY_PARK'),
			('BUILDING_ARECIBO',				'BUILDINGCLASS_KEW_GARDENS');

UPDATE Language_en_US SET Text = REPLACE(Text, 'building the [COLOR_POSITIVE_TEXT]University of Sankore[ENDCOLOR].', 	'Wonders: [COLOR_CYAN]University of Sankore[ENDCOLOR], [COLOR_CYAN]Golden Dagon Pagoda[ENDCOLOR] and [COLOR_CYAN]Notre Dame[ENDCOLOR] (only [COLOR_NEGATIVE_TEXT]one[ENDCOLOR] of those newly unlocked Wonders can be built in Empire).') 	WHERE Tag = 'TXT_KEY_POLICY_BRANCH_TRADITION_HELP';
UPDATE Language_en_US SET Text = REPLACE(Text, 'building the [COLOR_POSITIVE_TEXT]Forbidden Palace[ENDCOLOR].', 		'Wonders: [COLOR_CYAN]Forbidden Palace[ENDCOLOR], [COLOR_CYAN]Wartburg[ENDCOLOR] and [COLOR_CYAN]Büyük Han[ENDCOLOR] (only [COLOR_NEGATIVE_TEXT]one[ENDCOLOR] of those newly unlocked Wonders can be built in Empire).') 					WHERE Tag = 'TXT_KEY_POLICY_BRANCH_LIBERTY_HELP';
UPDATE Language_en_US SET Text = REPLACE(Text, 'building [COLOR_POSITIVE_TEXT]Alhambra[ENDCOLOR].', 					'Wonders: [COLOR_CYAN]Alhambra[ENDCOLOR], [COLOR_CYAN]Forge of Damascus[ENDCOLOR] and [COLOR_CYAN]Great Zimbabwe[ENDCOLOR] (only [COLOR_NEGATIVE_TEXT]one[ENDCOLOR] of those newly unlocked Wonders can be built in Empire).') 				WHERE Tag = 'TXT_KEY_POLICY_BRANCH_HONOR_HELP';
UPDATE Language_en_US SET Text = REPLACE(Text, 'building the [COLOR_POSITIVE_TEXT]Red Fort[ENDCOLOR].', 				'Wonders: [COLOR_CYAN]Red Fort[ENDCOLOR], [COLOR_CYAN]Golden Pavilion[ENDCOLOR] and [COLOR_CYAN]Solovietsky Monastery[ENDCOLOR] (only [COLOR_NEGATIVE_TEXT]one[ENDCOLOR] of those newly unlocked Wonders can be built in Empire).') 		WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PIETY_HELP';
UPDATE Language_en_US SET Text = REPLACE(Text, 'building the [COLOR_POSITIVE_TEXT]Palace of Westminster[ENDCOLOR].', 	'Wonders: [COLOR_CYAN]Palace of Westminster[ENDCOLOR], [COLOR_CYAN]Kilwa Kisiwani[ENDCOLOR] and [COLOR_CYAN]Old Bridge[ENDCOLOR] (only [COLOR_NEGATIVE_TEXT]one[ENDCOLOR] of those newly unlocked Wonders can be built in Empire).') 		WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PATRONAGE_HELP';
UPDATE Language_en_US SET Text = REPLACE(Text, 'building the [COLOR_POSITIVE_TEXT]Louvre[ENDCOLOR].', 					'Wonders: [COLOR_CYAN]Louvre[ENDCOLOR], [COLOR_CYAN]Monte Carlo Cassino[ENDCOLOR] and [COLOR_CYAN]Museum Island[ENDCOLOR] (only [COLOR_NEGATIVE_TEXT]one[ENDCOLOR] of those newly unlocked Wonders can be built in Empire).') 							WHERE Tag = 'TXT_KEY_POLICY_BRANCH_AESTHETICS_HELP';
UPDATE Language_en_US SET Text = REPLACE(Text, 'building [COLOR_POSITIVE_TEXT]Broadway[ENDCOLOR].', 					'Wonders: [COLOR_CYAN]Broadway[ENDCOLOR], [COLOR_CYAN]Ruhr Valley[ENDCOLOR] and [COLOR_CYAN]Banff Spring Hotel[ENDCOLOR] (only [COLOR_NEGATIVE_TEXT]one[ENDCOLOR] of those newly unlocked Wonders can be built in Empire).') 			WHERE Tag = 'TXT_KEY_POLICY_BRANCH_COMMERCE_HELP';
UPDATE Language_en_US SET Text = REPLACE(Text, 'building the [COLOR_POSITIVE_TEXT]Pentagon[ENDCOLOR].', 				'Wonders: [COLOR_CYAN]Pentagon[ENDCOLOR], [COLOR_CYAN]Brandenburg Gate[ENDCOLOR] and [COLOR_CYAN]White Sands Missile Range[ENDCOLOR] (only [COLOR_NEGATIVE_TEXT]one[ENDCOLOR] of those newly unlocked Wonders can be built in Empire).') 				WHERE Tag = 'TXT_KEY_POLICY_BRANCH_EXPLORATION_HELP';
UPDATE Language_en_US SET Text = REPLACE(Text, 'building [COLOR_POSITIVE_TEXT]Bletchley Park[ENDCOLOR].', 				'Wonders: [COLOR_CYAN]Bletchley Park[ENDCOLOR], [COLOR_CYAN]Kew Gardens[ENDCOLOR] and [COLOR_CYAN]Arecibo Observatory[ENDCOLOR] (only [COLOR_NEGATIVE_TEXT]one[ENDCOLOR] of those newly unlocked Wonders can be built in Empire).') 			WHERE Tag = 'TXT_KEY_POLICY_BRANCH_RATIONALISM_HELP';
--============================================--
-- TRANSPORTATION WONDERS
--============================================--
INSERT INTO Building_ClassNeededNowhere
			(BuildingType,					BuildingClassType) 
VALUES		('BUILDING_DARJEELING',			'BUILDINGCLASS_SIBERIAN_RAILWAY'),
			('BUILDING_DARJEELING',			'BUILDINGCLASS_AUTOBAHN'),
			('BUILDING_DARJEELING',			'BUILDINGCLASS_INTERSTATE'),
			('BUILDING_DARJEELING',			'BUILDINGCLASS_CONCORDE'),
			('BUILDING_SIBERIAN_RAILWAY',	'BUILDINGCLASS_DARJEELING'),
			('BUILDING_SIBERIAN_RAILWAY',	'BUILDINGCLASS_AUTOBAHN'),
			('BUILDING_SIBERIAN_RAILWAY',	'BUILDINGCLASS_INTERSTATE'),
			('BUILDING_SIBERIAN_RAILWAY',	'BUILDINGCLASS_CONCORDE'),
			('BUILDING_AUTOBAHN',			'BUILDINGCLASS_DARJEELING'),
			('BUILDING_AUTOBAHN',			'BUILDINGCLASS_SIBERIAN_RAILWAY'),
			('BUILDING_AUTOBAHN',			'BUILDINGCLASS_INTERSTATE'),
			('BUILDING_AUTOBAHN',			'BUILDINGCLASS_CONCORDE'),
			('BUILDING_INTERSTATE',			'BUILDINGCLASS_DARJEELING'),
			('BUILDING_INTERSTATE',			'BUILDINGCLASS_SIBERIAN_RAILWAY'),
			('BUILDING_INTERSTATE',			'BUILDINGCLASS_AUTOBAHN'),
			('BUILDING_INTERSTATE',			'BUILDINGCLASS_CONCORDE'),
			('BUILDING_CONCORDE',			'BUILDINGCLASS_DARJEELING'),
			('BUILDING_CONCORDE',			'BUILDINGCLASS_SIBERIAN_RAILWAY'),
			('BUILDING_CONCORDE',			'BUILDINGCLASS_AUTOBAHN'),
			('BUILDING_CONCORDE',			'BUILDINGCLASS_INTERSTATE');
--============================================--
-- IDEOLOGY WONDERS
--============================================--
UPDATE Buildings SET PolicyBranchType = 'POLICY_BRANCH_FREEDOM'   WHERE Type IN ('BUILDING_STATUE_OF_LIBERTY', 'BUILDING_ORSZAGHAZ', 'BUILDING_HOLLYWOOD', 'BUILDING_JFK');
UPDATE Buildings SET PolicyBranchType = 'POLICY_BRANCH_ORDER'     WHERE Type IN ('BUILDING_KREMLIN'/*, 'BUILDING_GREAT_HALL'*/, 'BUILDING_SPUTNIK', 'BUILDING_REVOLUTIONARY_MUSEUM');
UPDATE Buildings SET PolicyBranchType = 'POLICY_BRANCH_AUTOCRACY' WHERE Type IN ('BUILDING_PRORA_RESORT', 'BUILDING_SANBO'/*, 'BUILDING_TEHRAN_NUCLEAR'*/, 'BUILDING_ANITKABIR');

INSERT INTO Building_ClassNeededNowhere
			(BuildingType,						BuildingClassType) 
VALUES		('BUILDING_STATUE_OF_LIBERTY',		'BUILDINGCLASS_ORSZAGHAZ'),				-- freedom
			('BUILDING_STATUE_OF_LIBERTY',		'BUILDINGCLASS_HOLLYWOOD'),
			('BUILDING_STATUE_OF_LIBERTY',		'BUILDINGCLASS_JFK'),
			('BUILDING_ORSZAGHAZ',				'BUILDINGCLASS_STATUE_OF_LIBERTY'),
			('BUILDING_ORSZAGHAZ',				'BUILDINGCLASS_HOLLYWOOD'),
			('BUILDING_ORSZAGHAZ',				'BUILDINGCLASS_JFK'),
			('BUILDING_HOLLYWOOD',				'BUILDINGCLASS_STATUE_OF_LIBERTY'),
			('BUILDING_HOLLYWOOD',				'BUILDINGCLASS_ORSZAGHAZ'),
			('BUILDING_HOLLYWOOD',				'BUILDINGCLASS_JFK'),
			('BUILDING_JFK',					'BUILDINGCLASS_STATUE_OF_LIBERTY'),
			('BUILDING_JFK',					'BUILDINGCLASS_ORSZAGHAZ'),
			('BUILDING_JFK',					'BUILDINGCLASS_HOLLYWOOD'),
			------------------------------
			--('BUILDING_KREMLIN',				'BUILDINGCLASS_GREAT_HALL'),			-- order
			('BUILDING_KREMLIN',				'BUILDINGCLASS_SPUTNIK'),
			('BUILDING_KREMLIN',				'BUILDINGCLASS_REVOLUTIONARY_MUSEUM'),
			--('BUILDING_GREAT_HALL',				'BUILDINGCLASS_KREMLIN'),
			--('BUILDING_GREAT_HALL',				'BUILDINGCLASS_SPUTNIK'),
			--('BUILDING_GREAT_HALL',				'BUILDINGCLASS_REVOLUTIONARY_MUSEUM'),
			('BUILDING_SPUTNIK',				'BUILDINGCLASS_KREMLIN'),
			--('BUILDING_SPUTNIK',				'BUILDINGCLASS_GREAT_HALL'),
			('BUILDING_SPUTNIK',				'BUILDINGCLASS_REVOLUTIONARY_MUSEUM'),
			('BUILDING_REVOLUTIONARY_MUSEUM',	'BUILDINGCLASS_KREMLIN'),
			--('BUILDING_REVOLUTIONARY_MUSEUM',	'BUILDINGCLASS_GREAT_HALL'),
			('BUILDING_REVOLUTIONARY_MUSEUM',	'BUILDINGCLASS_SPUTNIK'),
			------------------------------
			('BUILDING_PRORA_RESORT',		'BUILDINGCLASS_SANBO'),						-- autocracy
			--('BUILDING_PRORA_RESORT',		'BUILDINGCLASS_TEHRAN_NUCLEAR'),
			('BUILDING_PRORA_RESORT',		'BUILDINGCLASS_ANITKABIR'),
			('BUILDING_SANBO',				'BUILDINGCLASS_PRORA_RESORT'),
			--('BUILDING_SANBO',				'BUILDINGCLASS_TEHRAN_NUCLEAR'),
			('BUILDING_SANBO',				'BUILDINGCLASS_ANITKABIR'),
			--('BUILDING_TEHRAN_NUCLEAR',		'BUILDINGCLASS_PRORA_RESORT'),
			--('BUILDING_TEHRAN_NUCLEAR',		'BUILDINGCLASS_SANBO'),
			--('BUILDING_TEHRAN_NUCLEAR',		'BUILDINGCLASS_ANITKABIR'),
			('BUILDING_ANITKABIR',			'BUILDINGCLASS_PRORA_RESORT'),
			('BUILDING_ANITKABIR',			'BUILDINGCLASS_SANBO'); --!!!
			--('BUILDING_ANITKABIR',			'BUILDINGCLASS_TEHRAN_NUCLEAR'),
--============================================--
-- FREE ART HELP TEXTS
--============================================--
UPDATE Language_en_US SET Text = REPLACE(Text, 'Contains a pre-built [ICON_GREAT_WORK] Great Work of Art. ', 'Starts with [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]The Crown Jewels[ENDCOLOR].[NEWLINE][NEWLINE]') WHERE Tag ='TXT_KEY_BUILDING_WHITE_TOWER_HELP';
UPDATE Language_en_US SET Text = REPLACE(Text, 'comes with both a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_WORK] Great Work', 'starts with [COLOR_CULTURE_STORED] [COLOR_MAGENTA]Flood Tablet[ENDCOLOR]') WHERE Tag ='TXT_KEY_BUILDING_ROYAL_LIBRARY_HELP';
--============================================--
-- FREE ART QUOTES
--============================================--
-- Man
UPDATE GreatWorks SET Audio = 'AS2D_WONDER_SPEECH_ARK_OF_THE_COVENANT_MAN'		WHERE Type = 'GREAT_WORK_THE_ARK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SPEECH' AND Value=0);
UPDATE GreatWorks SET Audio = 'AS2D_WONDER_SPEECH_HOLY_LANCE_MAN'				WHERE Type = 'GREAT_WORK_HOLY_LANCE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SPEECH' AND Value=0);
UPDATE GreatWorks SET Audio = 'AS2D_WONDER_SPEECH_HOLY_CROWN_MAN'				WHERE Type = 'GREAT_WORK_HOLY_CROWN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SPEECH' AND Value=0);
-- Woman
UPDATE GreatWorks SET Audio = 'AS2D_WONDER_SPEECH_ARK_OF_THE_COVENANT_WOMAN'	WHERE Type = 'GREAT_WORK_THE_ARK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SPEECH' AND Value=1);
UPDATE GreatWorks SET Audio = 'AS2D_WONDER_SPEECH_HOLY_LANCE_WOMAN'				WHERE Type = 'GREAT_WORK_HOLY_LANCE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SPEECH' AND Value=1);
UPDATE GreatWorks SET Audio = 'AS2D_WONDER_SPEECH_HOLY_CROWN_WOMAN'				WHERE Type = 'GREAT_WORK_HOLY_CROWN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SPEECH' AND Value=1);
--============================================--
-- PROMOTION ORDERING
--============================================--
UPDATE UnitPromotions SET FlagPromoOrder = 203, OrderPriority = 203 WHERE Type = 'PROMOTION_HIMEJI_CASTLE';
UPDATE UnitPromotions SET FlagPromoOrder = 204, OrderPriority = 204 WHERE Type = 'PROMOTION_SANBO_LAND';
UPDATE UnitPromotions SET FlagPromoOrder = 205, OrderPriority = 205 WHERE Type = 'PROMOTION_SANBO_SEA';
UPDATE UnitPromotions SET FlagPromoOrder = 206, OrderPriority = 206 WHERE Type = 'PROMOTION_SANBO_AIR';
UPDATE UnitPromotions SET FlagPromoOrder = 207, OrderPriority = 207 WHERE Type = 'PROMOTION_STATUE_ZEUS';
UPDATE UnitPromotions SET FlagPromoOrder = 208, OrderPriority = 208 WHERE Type = 'PROMOTION_TREASURE_FLEET';

UPDATE UnitPromotions SET FlagPromoOrder = 209, OrderPriority = 209 WHERE Type = 'PROMOTION_ALHAMBRA';
UPDATE UnitPromotions SET FlagPromoOrder = 210, OrderPriority = 210 WHERE Type = 'PROMOTION_DAMASCUS';
UPDATE UnitPromotions SET FlagPromoOrder = 211, OrderPriority = 211 WHERE Type = 'PROMOTION_MARAE';
UPDATE UnitPromotions SET FlagPromoOrder = 212, OrderPriority = 212 WHERE Type = 'PROMOTION_ARAHURAHU';
UPDATE UnitPromotions SET FlagPromoOrder = 213, OrderPriority = 213 WHERE Type = 'PROMOTION_THULE';
UPDATE UnitPromotions SET FlagPromoOrder = 214, OrderPriority = 214 WHERE Type = 'PROMOTION_WHITE_SANDS';

UPDATE UnitPromotions SET FlagPromoOrder = 215, OrderPriority = 215 WHERE Type = 'PROMOTION_ARSENALE';

UPDATE UnitPromotions SET FlagPromoOrder = 216, OrderPriority = 216 WHERE Type = 'PROMOTION_PANAMA_CANAL';
UPDATE UnitPromotions SET FlagPromoOrder = 217, OrderPriority = 217 WHERE Type = 'PROMOTION_SIBERIAN_RAILWAY';
UPDATE UnitPromotions SET FlagPromoOrder = 218, OrderPriority = 218 WHERE Type = 'PROMOTION_DARJEELING';

UPDATE UnitPromotions SET FlagPromoOrder = 219, OrderPriority = 219 WHERE Type = 'PROMOTION_HIDDEN_ARTIFACTS';
--============================================--
-- Hide all INACTIVE Wonders - override any previous settings
-- Warning! They will still be visible in Civilopedia!
--============================================--
UPDATE Buildings
SET Cost = -1, FaithCost = -1, PrereqTech = NULL, GreatWorkCount = -1, IsDummy = 1
WHERE Type IN (SELECT 'BUILDING_'||WType FROM MWfVPConfig WHERE WActive = 0);
--============================================--
-- VP FIXES
--============================================--
-- deletion of unnecessary and annoying +1 Culture from most of base WWs:
-- deletion with substitution
-- ==> Production
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_TERRACOTTA_ARMY';
	INSERT INTO Building_YieldChanges (BuildingType, YieldType,	Yield) VALUES ('BUILDING_TERRACOTTA_ARMY', 'YIELD_PRODUCTION', 1);
-- ==> Gold
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_FORBIDDEN_PALACE';
	INSERT INTO Building_YieldChanges (BuildingType, YieldType,	Yield) VALUES ('BUILDING_FORBIDDEN_PALACE', 'YIELD_GOLD', 1);
-- ==> Science
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_STONEHENGE';
	INSERT INTO Building_YieldChanges (BuildingType, YieldType,	Yield) VALUES ('BUILDING_STONEHENGE', 'YIELD_SCIENCE', 1);
-- ==> Golden Age Points
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_PYRAMID';
	INSERT INTO Building_YieldChanges (BuildingType, YieldType,	Yield) VALUES ('BUILDING_PYRAMID', 'YIELD_GOLDEN_AGE_POINTS', 1);
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_CHICHEN_ITZA';
	INSERT INTO Building_YieldChanges (BuildingType, YieldType,	Yield) VALUES ('BUILDING_CHICHEN_ITZA', 'YIELD_GOLDEN_AGE_POINTS', 1);
-- ==> Great General Points
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_STATUE_ZEUS';
	INSERT INTO Building_YieldChanges (BuildingType, YieldType,	Yield) VALUES ('BUILDING_STATUE_ZEUS', 'YIELD_GREAT_GENERAL_POINTS', 1);
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_KREMLIN';
	INSERT INTO Building_YieldChanges (BuildingType, YieldType,	Yield) VALUES ('BUILDING_KREMLIN', 'YIELD_GREAT_GENERAL_POINTS', 2);	
-- ==> Great Admiral Points
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_GREAT_LIGHTHOUSE';
	INSERT INTO Building_YieldChanges (BuildingType, YieldType,	Yield) VALUES ('BUILDING_GREAT_LIGHTHOUSE', 'YIELD_GREAT_ADMIRAL_POINTS', 1);

-- just deletion
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_MACHU_PICHU';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_TEMPLE_ARTEMIS';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_GREAT_LIBRARY';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_COLOSSUS';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_GREAT_WALL';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_HIMEJI_CASTLE';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_SUMMER_PALACE';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_NOTRE_DAME';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_PORCELAIN_TOWER';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_RED_FORT';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_SOHO_FOUNDRY';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_BRANDENBURG_GATE';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_BIG_BEN';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_PENTAGON';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_CN_TOWER';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_BLETCHLEY_PARK';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_CERN';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_GREAT_FIREWALL';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_HUBBLE';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_INTERNATIONAL_SPACE_STATION';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_GRAND_CANAL';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_CRYSTAL_PALACE';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_UN';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_MOTHERLAND_STATUE';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_PRORA_RESORT';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_TWOKAY_FOODS_HQ';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_TRADER_SIDS_HQ';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_HEXXON_REFINERY_HQ';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_GIORGIO_ARMEIER_HQ';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_FIRAXITE_MATERIALS_HQ';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_CIVILIZED_JEWELERS_HQ';
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_LANDSEA_EXTRACTORS_HQ';
--============================================--
-- EE Compatibility
--============================================--
UPDATE Buildings SET NumPoliciesNeeded = 9 WHERE Type = 'BUILDING_HIMEJI_CASTLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 9 WHERE Type = 'BUILDING_MARAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 9 WHERE Type = 'BUILDING_CHICHEN_ITZA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 9 WHERE Type = 'BUILDING_GLOBE_THEATER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 9 WHERE Type = 'BUILDING_ST_PETERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 11 WHERE Type = 'BUILDING_BAKKEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 11 WHERE Type = 'BUILDING_SUMMER_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 12 WHERE Type = 'BUILDING_EE_VERSAILLES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 12 WHERE Type = 'BUILDING_SISTINE_CHAPEL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 13 WHERE Type = 'BUILDING_PETERHOF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 13 WHERE Type = 'BUILDING_HOUSE_OF_TRADE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 13 WHERE Type = 'BUILDING_UFFIZI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 13 WHERE Type = 'BUILDING_EE_WAT_PHRA_KAEW' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 13 WHERE Type = 'BUILDING_EE_TORRE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 15 WHERE Type = 'BUILDING_SIKU_QUANSHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 15 WHERE Type = 'BUILDING_EE_KRONBORG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 15 WHERE Type = 'BUILDING_EE_FASIL_GHEBBI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 16 WHERE Type = 'BUILDING_SIBERIAN_RAILWAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 16 WHERE Type = 'BUILDING_BROOKLYN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 16 WHERE Type = 'BUILDING_ZOCALO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 16 WHERE Type = 'BUILDING_PANAMA_CANAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 16 WHERE Type = 'BUILDING_EE_SMITHSONIAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 16 WHERE Type = 'BUILDING_SOHO_FOUNDRY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 16 WHERE Type = 'BUILDING_NEUSCHWANSTEIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 17 WHERE Type = 'BUILDING_ORSZAGHAZ' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 17 WHERE Type = 'BUILDING_DARJEELING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 17 WHERE Type = 'BUILDING_EIFFEL_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 19 WHERE Type = 'BUILDING_AUTOBAHN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 19 WHERE Type = 'BUILDING_STATUE_OF_LIBERTY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 19 WHERE Type = 'BUILDING_POLAR_EXPEDITION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 19 WHERE Type = 'BUILDING_ROCKEFELLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 19 WHERE Type = 'BUILDING_AKIHABARA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 19 WHERE Type = 'BUILDING_EMPIRE_STATE_BUILDING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 19 WHERE Type = 'BUILDING_KREMLIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 20 WHERE Type = 'BUILDING_RUSHMORE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 20 WHERE Type = 'BUILDING_SANBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 20 WHERE Type = 'BUILDING_INTERSTATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 20 WHERE Type = 'BUILDING_CRISTO_REDENTOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 22 WHERE Type = 'BUILDING_HABITAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 22 WHERE Type = 'BUILDING_ANITKABIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET NumPoliciesNeeded = 25 WHERE Type = 'BUILDING_SEED_VAULT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET Cost = 800 WHERE Type = 'BUILDING_EE_TOPKAPI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 800 WHERE Type = 'BUILDING_EE_VERSAILLES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 800 WHERE Type = 'BUILDING_SUMMER_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 800 WHERE Type = 'BUILDING_SOLOVIETSKY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 800 WHERE Type = 'BUILDING_BAKKEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 800 WHERE Type = 'BUILDING_SISTINE_CHAPEL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 800 WHERE Type = 'BUILDING_TAJ_MAHAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 800 WHERE Type = 'BUILDING_PORCELAIN_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 800 WHERE Type = 'BUILDING_RED_FORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1000 WHERE Type = 'BUILDING_EE_WAT_PHRA_KAEW' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1000 WHERE Type = 'BUILDING_EE_TORRE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1000 WHERE Type = 'BUILDING_HOUSE_OF_TRADE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1000 WHERE Type = 'BUILDING_PETERHOF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1000 WHERE Type = 'BUILDING_UFFIZI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1150 WHERE Type = 'BUILDING_EE_KRONBORG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1150 WHERE Type = 'BUILDING_EE_FASIL_GHEBBI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1150 WHERE Type = 'BUILDING_SIKU_QUANSHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1150 WHERE Type = 'BUILDING_MUSEUM_ISLAND' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1350 WHERE Type = 'BUILDING_EE_SMITHSONIAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1350 WHERE Type = 'BUILDING_SIBERIAN_RAILWAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1350 WHERE Type = 'BUILDING_BROOKLYN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1350 WHERE Type = 'BUILDING_ZOCALO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1350 WHERE Type = 'BUILDING_PANAMA_CANAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1350 WHERE Type = 'BUILDING_SOHO_FOUNDRY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1350 WHERE Type = 'BUILDING_NEUSCHWANSTEIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1500 WHERE Type = 'BUILDING_ORSZAGHAZ' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1500 WHERE Type = 'BUILDING_DARJEELING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1500 WHERE Type = 'BUILDING_EIFFEL_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1500 WHERE Type = 'BUILDING_BANFF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1500 WHERE Type = 'BUILDING_BRANDENBURG_GATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1500 WHERE Type = 'BUILDING_RUHR_VALLEY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1500 WHERE Type = 'BUILDING_MONTE_CARLO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1500 WHERE Type = 'BUILDING_BIG_BEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1500 WHERE Type = 'BUILDING_LOUVRE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1500 WHERE Type = 'BUILDING_KEW_GARDENS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1750 WHERE Type = 'BUILDING_AUTOBAHN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1750 WHERE Type = 'BUILDING_STATUE_OF_LIBERTY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1750 WHERE Type = 'BUILDING_POLAR_EXPEDITION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1750 WHERE Type = 'BUILDING_ROCKEFELLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1750 WHERE Type = 'BUILDING_KREMLIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1750 WHERE Type = 'BUILDING_AKIHABARA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1750 WHERE Type = 'BUILDING_EMPIRE_STATE_BUILDING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1950 WHERE Type = 'BUILDING_RUSHMORE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1950 WHERE Type = 'BUILDING_SANBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1950 WHERE Type = 'BUILDING_INTERSTATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1950 WHERE Type = 'BUILDING_CRISTO_REDENTOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1950 WHERE Type = 'BUILDING_HOLLYWOOD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1950 WHERE Type = 'BUILDING_CONCORDE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1950 WHERE Type = 'BUILDING_BROADWAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 1950 WHERE Type = 'BUILDING_PRORA_RESORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2200 WHERE Type = 'BUILDING_HABITAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2200 WHERE Type = 'BUILDING_VOSTOK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2200 WHERE Type = 'BUILDING_MILESTII_MICI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2200 WHERE Type = 'BUILDING_ANITKABIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2200 WHERE Type = 'BUILDING_PENTAGON' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2200 WHERE Type = 'BUILDING_SPUTNIK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2400 WHERE Type = 'BUILDING_WHITE_SANDS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2400 WHERE Type = 'BUILDING_MILLAU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2400 WHERE Type = 'BUILDING_ARECIBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2400 WHERE Type = 'BUILDING_BLETCHLEY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2400 WHERE Type = 'BUILDING_THULE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2400 WHERE Type = 'BUILDING_MOTHERLAND_STATUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2400 WHERE Type = 'BUILDING_REVOLUTIONARY_MUSEUM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2700 WHERE Type = 'BUILDING_JUMEIRAH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2700 WHERE Type = 'BUILDING_TAIPEI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2700 WHERE Type = 'BUILDING_CN_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2700 WHERE Type = 'BUILDING_SYDNEY_OPERA_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET Cost = 2700 WHERE Type = 'BUILDING_SEED_VAULT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET PrereqTech = 'TECH_EE_SOVEREIGNTY' WHERE Type = 'BUILDING_SUMMER_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET PrereqTech = 'TECH_ACOUSTICS' WHERE Type = 'BUILDING_EE_VERSAILLES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET PrereqTech = 'TECH_EE_EXPLORATION' WHERE Type = 'BUILDING_BAKKEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET PrereqTech = 'TECH_EE_EXPLORATION' WHERE Type = 'BUILDING_SOLOVIETSKY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET PrereqTech = 'TECH_ECONOMICS' WHERE Type = 'BUILDING_HOUSE_OF_TRADE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET PrereqTech = 'TECH_EE_FLINTLOCK' WHERE Type = 'BUILDING_PETERHOF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET PrereqTech = 'TECH_EE_MANUFACTURING' WHERE Type = 'BUILDING_SIKU_QUANSHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET WonderSplashAnchor = 'C,B' WHERE Type = 'BUILDING_EE_WAT_PHRA_KAEW' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET WonderSplashAnchor = 'C,C' WHERE Type = 'BUILDING_EE_SMITHSONIAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_EE_TORRE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET WonderSplashAnchor = 'R,B' WHERE Type = 'BUILDING_EE_KRONBORG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_EE_FASIL_GHEBBI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET WonderSplashAnchor = 'L,B' WHERE Type = 'BUILDING_EE_VERSAILLES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
UPDATE Buildings SET WonderSplashAnchor = 'C,T' WHERE Type = 'BUILDING_EE_TOPKAPI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET Hill = 1, Water = 1, MinAreaSize = 10													WHERE Type = 'BUILDING_EE_TOPKAPI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Buildings SET Flat = 1, NearbyTerrainRequired = 'TERRAIN_GRASS', IsNoWater = 1/*, IsNoCoast = 1*/	WHERE Type = 'BUILDING_EE_VERSAILLES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Buildings SET River = 1																				WHERE Type = 'BUILDING_EE_WAT_PHRA_KAEW' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Buildings SET Water = 1, MinAreaSize = 10, River = 1, NearbyTerrainRequired = 'TERRAIN_DESERT'		WHERE Type = 'BUILDING_EE_TORRE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Buildings SET Flat = 1, Water = 1, MinAreaSize = 10													WHERE Type = 'BUILDING_EE_KRONBORG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Buildings SET Hill = 1, NearbyTerrainRequired = 'TERRAIN_PLAINS', IsNoWater = 1/*, IsNoCoast = 1*/	WHERE Type = 'BUILDING_EE_FASIL_GHEBBI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Buildings SET River = 1																				WHERE Type = 'BUILDING_EE_SMITHSONIAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
--------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET Hill = 1, Water = 1, MinAreaSize = 10													WHERE Type = 'BUILDING_EE_TOPKAPI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
UPDATE Buildings SET Flat = 1																				WHERE Type = 'BUILDING_EE_VERSAILLES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
UPDATE Buildings SET River = 1																				WHERE Type = 'BUILDING_EE_WAT_PHRA_KAEW' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
UPDATE Buildings SET Water = 1, MinAreaSize = 10															WHERE Type = 'BUILDING_EE_TORRE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
UPDATE Buildings SET Flat = 1, Water = 1, MinAreaSize = 10													WHERE Type = 'BUILDING_EE_KRONBORG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
UPDATE Buildings SET Hill = 1																				WHERE Type = 'BUILDING_EE_FASIL_GHEBBI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
UPDATE Buildings SET River = 1																				WHERE Type = 'BUILDING_EE_SMITHSONIAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity 
			(BuildingType,				BuildingClassType) 
SELECT		'BUILDING_EE_TOPKAPI',		'BUILDINGCLASS_EE_MANOR' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
			
INSERT INTO Building_ClassesNeededInCity 
			(BuildingType,				BuildingClassType) 
SELECT		'BUILDING_EE_KRONBORG',		'BUILDINGCLASS_HARBOR' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value=1);
--------------------------------------------------------------
--------------------------------------------------------------
