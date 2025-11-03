INSERT INTO BuildingClasses 	
	(Type,		DefaultBuilding,	Description)
VALUES		
	('BUILDINGCLASS_PARK_IND',	'BUILDING_PARK_IND',	 'TXT_KEY_BUILDING_PARK_IND');

INSERT INTO Buildings
	(Type,		Description,	Civilopedia,	Strategy,	Help,	
	GoldMaintenance, Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb,
	BuildingClass,	ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_PARK_IND',	'TXT_KEY_BUILDING_PARK_IND', 	'TXT_KEY_BUILDING_PARK_IND_TEXT', 'TXT_KEY_BUILDING_PARK_IND_STRATEGY',	'TXT_KEY_BUILDING_PARK_IND_HELP',	
	6, 		1250, -20, 	-1, 	80,
	'BUILDINGCLASS_PARK_IND', 'ART_DEF_BUILDING_MARKET', 'TECH_FERTILIZER', 24, 'BW_ATLAS_1');

UPDATE Buildings SET
NoUnhappfromXSpecialists = 1 
WHERE Type = 'BUILDING_PARK_IND';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PARK_IND', 'YIELD_GOLDEN_AGE_POINTS', 1),
	('BUILDING_PARK_IND', 'YIELD_TOURISM', 1),
	('BUILDING_PARK_IND', 'YIELD_CULTURE', 1);

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	'BUILDING_PARK_IND', a.BuildingClass, b.Type, 2
FROM Buildings a, Yields b
WHERE a.Type IN ('BUILDING_THEATRE', 'BUILDING_HOTEL', 'BUILDING_MUSEUM')
AND b.Type IN ('YIELD_TOURISM');

/*
INSERT INTO Building_InstantYieldFromWLTKDStart
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PARK_IND', 'YIELD_GOLDEN_AGE_POINTS', 100);
*/

INSERT INTO Building_WLTKDYieldMod
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PARK_IND', 'YIELD_GOLDEN_AGE_POINTS', 50);

INSERT INTO Building_LakePlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PARK_IND', 'YIELD_FOOD', 1),
	('BUILDING_PARK_IND', 'YIELD_TOURISM', 1);

INSERT INTO Building_YieldChangesPerGoldenAge
	(BuildingType, YieldType, Yield, YieldCap)
VALUES
	('BUILDING_PARK_IND', 'YIELD_CULTURE', 2, 999);

INSERT INTO Building_YieldModifiers
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PARK_IND', 'YIELD_FOOD', 5);

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_PARK_IND', 'FLAVOR_HAPPINESS', 10),
	('BUILDING_PARK_IND', 'FLAVOR_GROWTH', 5),
	('BUILDING_PARK_IND', 'FLAVOR_CULTURE', 10);

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	
	('TXT_KEY_BUILDING_PARK_IND',		'Park'),
	('TXT_KEY_BUILDING_PARK_IND_TEXT',	'An urban park is a green space in a city, densely populated suburbia, or other incorporated places that offers place for recreation to residents and visitors. The earliest parks were ornate royal or artistocratic gardens opened to the public, such as the remodelling of St James''s Park in London by John Nash in 1826. In the late 19th century, city governments purchased large tracts of land on the outskirts of cities to form landscaped areas often housing zoos, golf courses and museums. Princes Park in the Liverpool suburb of Toxteth was opened in 1843 and the land on which the park was built was purchased by Richard Vaughan Yates, an iron merchant and philanthropist, in 1841 for £50,000.'),
	('TXT_KEY_BUILDING_PARK_IND_STRATEGY',	'The Park is a sort of cultural Building that provides bonuses indirectly. In developed Cities you can add a reasonable amount of Tourism. Satifying WLTKD requirements will generate Golden Age Points, and for each Golden Age you permanantely produce more Culture. A virtuous cycle whose benefits mostly exist at the Empire level. The local bonuses, a boost to Food and an Urbanization reduction, are small and most relevant to larger Cities working Specialists. In sum, the Park in game is much like the Park in real life: a luxury for your wealthier Cities.'),
-- Receive an instant boost of 100 [ICON_GOLDEN_AGE] Golden Age Points when [COLOR_POSITIVE_TEXT]"We Love the King Day"[ENDCOLOR] begins in the City, scaling with Era.
	('TXT_KEY_BUILDING_PARK_IND_HELP', 'The City generates +50% [ICON_GOLDEN_AGE] Golden Age Points during [COLOR_POSITIVE_TEXT]"We Love the King Day"[ENDCOLOR]. Permanently generate an additional +2 [ICON_CULTURE] Culture each time a [ICON_GOLDEN_AGE] Golden Age begins. +2 [ICON_TOURISM] Tourism from Zoos, Hotels, and Museums in the City.[NEWLINE][NEWLINE]Nearby Lakes: +1 [ICON_FOOD] Food and [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]1 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.');


--the predecessors to urban parks were generally rural cemeteries. Especially in the United States, cemeteries were intended as civic institutions designed for public use. Before the widespread development of public parks, the rural cemetery provided a place for the general public to enjoy outdoor recreation amidst art and sculpture previously available only for the wealthy.


