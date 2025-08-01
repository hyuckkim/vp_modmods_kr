DELETE FROM Language_en_US
WHERE Tag = 'TXT_BUILDING_JCHURCH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_BRAZILWOOD_CAMP' AND Value= 1 );

INSERT INTO Language_en_US (Text, Tag)
SELECT '+25% [ICON_GREAT_PEOPLE] Great People generation in this City. +1 [ICON_PEACE] Faith for every 6 [ICON_CITIZEN] Citizens in the City. +1 [ICON_CULTURE] Culture from Jungle. Increases the city''s resistance to conversion by 10%.[NEWLINE]Nearby Oases: +2 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_CITRUS] Citrus: +1 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_COCOA] Cocoa: +1 [ICON_FOOD] Food, +1 [ICON_GOLD]' , 'TXT_KEY_BUILDING_JCHURCH_HELP'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_BRAZILWOOD_CAMP' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'The Jesuit Church increases the speed at which [ICON_GREAT_PEOPLE] Great people are generated in the city by 25%, buffs the food output of Oases, increases [ICON_PEACE] Faith in the city and also provide a [ICON_CULTURE] Culture bonus on Jungle tiles. Unlike the Garden, the Jesuit Church does not require an Aqueduct in the City in order to be built.'
WHERE Tag = 'TXT_KEY_BUILDING_JCHURCH_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_BRAZILWOOD_CAMP' AND Value= 1 );

UPDATE Buildings 
SET Cost = 275, GoldMaintenance = 2, ConversionModifier = -10, Help = 'TXT_KEY_BUILDING_JCHURCH_HELP', HurryCostModifier = 5
WHERE Type = 'BUILDING_JCHURCH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_BRAZILWOOD_CAMP' AND Value= 1 );

UPDATE Building_YieldChanges
SET Yield = '0'
WHERE BuildingType = 'BUILDING_JCHURCH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_BRAZILWOOD_CAMP' AND Value= 1 );

INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield)
	SELECT 'BUILDING_JCHURCH', 'RESOURCE_CITRUS', 'YIELD_FOOD', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_BRAZILWOOD_CAMP' AND Value= 1 ) UNION ALL
	SELECT 'BUILDING_JCHURCH', 'RESOURCE_CITRUS', 'YIELD_GOLD', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_BRAZILWOOD_CAMP' AND Value= 1 ) UNION ALL
	SELECT 'BUILDING_JCHURCH', 'RESOURCE_COCOA', 'YIELD_FOOD', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_BRAZILWOOD_CAMP' AND Value= 1 ) UNION ALL
	SELECT 'BUILDING_JCHURCH', 'RESOURCE_COCOA', 'YIELD_GOLD', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_BRAZILWOOD_CAMP' AND Value= 1 );
	
INSERT INTO Building_FeatureYieldChanges (BuildingType, FeatureType, YieldType, Yield)
SELECT 'BUILDING_JCHURCH', 'FEATURE_OASIS', 'YIELD_GOLD', 2 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_BRAZILWOOD_CAMP' AND Value= 1 );
