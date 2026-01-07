------------ zoo ----------
UPDATE Buildings
SET
	FinishLandTRTourism = 0,
	FinishSeaTRTourism = 0
WHERE BuildingClass = 'BUILDINGCLASS_THEATRE';
-- this is the zoo

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_THEATRE', 'IMPROVEMENT_CAMP', 'YIELD_CULTURE', 1),
	('BUILDING_BULLRING', 'IMPROVEMENT_CAMP', 'YIELD_CULTURE', 1),
	('BUILDING_BULLRING', 'IMPROVEMENT_CAMP', 'YIELD_TOURISM', 1);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_THEATRE';

-- Zoo
/*
UPDATE Language_en_US
SET Text = '+500 [ICON_RESEARCH] Science when completed. +1 [ICON_CULTURE] Culture from Camps worked by this City. Nearby Jungle and Forest tiles gain +1 [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom.'
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_HELP';
*/

UPDATE Language_en_US
SET Text = 'Mass construction of Zoos in all your Cities will give you a sudden burst of Science to reach a more advanced Tech. Zoos also represent one of the first sources of Tourism on Tiles. They are much more important to unlock if your Empire is heavily forested, or if you have a large number of Camp Luxuries.'
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_STRATEGY';

/*
UPDATE Language_en_US
SET Text = '+500 [ICON_RESEARCH] Science when completed. Nearby Jungle, Forest, Camps, and Pastures gain +1 [ICON_TOURISM] Tourism and [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Trigger a "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]" in this city whenever it completes a [COLOR_POSITIVE_TEXT]Public Works Project[ENDCOLOR]. Gain 100 [ICON_CULTURE] Culture, [ICON_PEACE] Faith, and [ICON_GOLD] Gold whenever a "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]" begins, Scaling with Era.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom.'
WHERE Tag = 'TXT_KEY_BUILDING_BULLRING_HELP';
*/

UPDATE Language_en_US
SET Text = 'The Bullring is a Spanish Unique Building that is cheaper and is available earlier than the Zoo. In addition to the Zoo''s bonuses to Camps, the Bullring gives bonuses to Pastures. Try to focus on triggering many "We Love the King Days" by connecting Resources or building Public Works in order to get additional Yields.'
WHERE Tag = 'TXT_KEY_BUILDING_BULLRING_STRATEGY';

------------ hotel -------------

UPDATE Buildings
SET
	FinishLandTRTourism = 5,
	FinishSeaTRTourism = 5,
	LandmarksTourismPercent = 34
WHERE BuildingClass = 'BUILDINGCLASS_HOTEL';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	Type, 'FEATURE_OASIS', 'YIELD_TOURISM', 5
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL';

INSERT INTO Building_YieldPerXTerrainTimes100
	(BuildingType, TerrainType, YieldType, Yield)
SELECT
	Type, 'TERRAIN_MOUNTAIN', 'YIELD_GOLD', 100
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL';

INSERT INTO Building_YieldPerXTerrainTimes100
	(BuildingType, TerrainType, YieldType, Yield)
SELECT
	Type, 'TERRAIN_MOUNTAIN', 'YIELD_TOURISM', 100
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL';

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 	BuildingClassType)
SELECT
	Type, 'BUILDINGCLASS_MINT'	
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL';

INSERT INTO Building_TerrainYieldChanges
	(BuildingType, TerrainType, YieldType, Yield)
SELECT 
	Type, 'TERRAIN_SNOW', 'YIELD_GOLD', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL' UNION ALL
SELECT 
	Type, 'TERRAIN_SNOW', 'YIELD_TOURISM', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL';

-- Hotels
/*
UPDATE Language_en_US
SET Text = 'City gains +1 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism on Snow and for every Mountain within the workable Tiles. +5 [ICON_TOURISM] Tourism from Oases worked by this City.[NEWLINE][NEWLINE]33% of the [ICON_CULTURE] Culture from [ICON_WONDER] World Wonders and Tiles is added to the [ICON_TOURISM] Tourism output of the City. [ICON_TOURISM] Tourism output from Great Works +25%.[NEWLINE][NEWLINE]Completing a [ICON_CARAVAN]/[ICON_CARGO_SHIP] Trade Route originating here and targeting another Civilization, triggers a (or strengthens an existing) [COLOR_POSITIVE_TEXT]Historic Event[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_BUILDING_HOTEL_HELP';
*/

UPDATE Buildings SET LandmarksTourismPercent = 50 WHERE Type = 'BUILDING_MOROCCO_RIAD';

/*
UPDATE Language_en_US
SET Text = 'When completed, gains [ICON_GOLD] Gold and [ICON_CULTURE] Culture for every 8 Buildings and Wonders already constructed in this city. Gains +1 [ICON_GOLD] Gold and [ICON_CULTURE] Culture every Era. City gains +1 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism on Snow and for every Mountain within the workable Tiles. +5 [ICON_TOURISM] Tourism from Oases worked by this City.[NEWLINE][NEWLINE]When you spend [ICON_INVEST] Gold to purchase Units or invest in Buildings in this City, 10% of the cost is converted into [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]50% of the [ICON_CULTURE] Culture from [ICON_WONDER] World Wonders and Tiles is added to the [ICON_TOURISM] Tourism output of the City. [ICON_TOURISM] Tourism output from Great Works +25%.[NEWLINE][NEWLINE]Completing a [ICON_CARAVAN]/[ICON_CARGO_SHIP] Trade Route originating here and targeting another Civilization, triggers a (or strengthens an existing) [COLOR_POSITIVE_TEXT]Historic Event[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_BUILDING_MOROCCO_RIAD_HELP';
*/

DELETE FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_MOAI' AND TechType = 'TECH_ARCHAEOLOGY' and YieldType = 'YIELD_TOURISM';


