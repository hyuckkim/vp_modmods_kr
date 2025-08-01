INSERT INTO Language_en_US (Text, Tag)
SELECT '+25% [ICON_GREAT_PEOPLE] Great People generation in this City. +1 [ICON_CULTURE] from Desert Tile. +1 [ICON_HAPPINESS_1] Happiness.[NEWLINE]Nearby Oases: +2 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_CITRUS] Citrus: +1 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_COCOA] Cocoa: +1 [ICON_FOOD] Food, +1 [ICON_GOLD]' , 'TXT_KEY_BUILDING_RIAD_HELP'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_KASBAH' AND Value= 1);

UPDATE Language_EN_US
SET Text = 'The Riad increases the speed at which [ICON_GREAT_PEOPLE] Great People are generated in the city by 25% and also provides +1 [ICON_HAPPINESS_1] and a +1 [ICON_CULTURE] Culture bonus to all desert tiles. The city also does not need to be next to a river for the Riad to be constructed, however you cannot construct this if a bath is in the city.'
WHERE Tag = 'TXT_KEY_BUILDING_RIAD_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_KASBAH' AND Value= 1);

UPDATE Improvements
SET NoTwoAdjacent = '0'
WHERE Type = 'IMPROVEMENT_KASBAH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_KASBAH' AND Value= 1);

UPDATE Buildings 
SET MutuallyExclusiveGroup = 2, Cost = 275, GoldMaintenance = 2, Happiness = 1, Help = 'TXT_KEY_BUILDING_RIAD_HELP', HurryCostModifier = 5
WHERE Type = 'BUILDING_RIAD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_KASBAH' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield)
	SELECT 'BUILDING_RIAD', 'RESOURCE_CITRUS', 'YIELD_FOOD', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_KASBAH' AND Value= 1 ) UNION ALL
	SELECT 'BUILDING_RIAD', 'RESOURCE_CITRUS', 'YIELD_GOLD', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_KASBAH' AND Value= 1 ) UNION ALL
	SELECT 'BUILDING_RIAD', 'RESOURCE_COCOA', 'YIELD_FOOD', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_KASBAH' AND Value= 1 ) UNION ALL
	SELECT 'BUILDING_RIAD', 'RESOURCE_COCOA', 'YIELD_GOLD', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_KASBAH' AND Value= 1 );

INSERT INTO Building_TerrainYieldChanges (BuildingType, TerrainType, YieldType, Yield)
SELECT 'BUILDING_RIAD', 'TERRAIN_DESERT', 'YIELD_CULTURE', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_KASBAH' AND Value= 1);

INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType)
SELECT 'BUILDING_RIAD', 'BUILDINGCLASS_AQUEDUCT' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_KASBAH' AND Value= 1 );

INSERT INTO Building_FeatureYieldChanges (BuildingType, FeatureType, YieldType, Yield)
SELECT 'BUILDING_RIAD', 'FEATURE_OASIS', 'YIELD_GOLD', 2 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_BRAZILWOOD_CAMP' AND Value= 1 );

