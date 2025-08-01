INSERT INTO Buildings (Type, BuildingClass, Cost, PrereqTech, FreeStartEra, Help, Description, Civilopedia, Strategy, ArtDefineTag, MinAreaSize, AllowsRangeStrike, Defense, ExtraCityHitPoints, HurryCostModifier, IconAtlas, NeverCapture, PortraitIndex, ArtInfoCulturalVariation, DisplayPosition)
SELECT 'BUILDING_PALAIS', 'BUILDINGCLASS_CASTLE', 300, 'TECH_CHIVALRY', 'ERA_INDUSTRIAL', 'TXT_KEY_BUILDING_PALAIS_TEXT', 'TXT_KEY_BUILDING_PALAIS', 'TXT_KEY_BUILDING_PALAIS_PEDIA', 'TXT_KEY_BUILDING_PALAIS_STRATEGY', 'CASTLE', -1, 1, 1750, 100, 5, 'BW_ATLAS_1', 1, 39, 1, 1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_CHATEAU' AND Value= 1);

UPDATE Buildings
SET CitySupplyModifier = 10
WHERE Type = 'BUILDING_PALAIS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_CHATEAU' AND Value= 1);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
SELECT 'BUILDING_PALAIS', 'FLAVOR_CITY_DEFENSE', 50 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_CHATEAU' AND Value= 1) UNION ALL
SELECT 'BUILDING_PALAIS', 'FLAVOR_CULTURE', 20 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_CHATEAU' AND Value= 1);

INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType)
SELECT 'BUILDING_PALAIS', 'BUILDINGCLASS_WALLS'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_CHATEAU' AND Value= 1);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield)
SELECT 'BUILDING_PALAIS', 'YIELD_CULTURE', 3
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_CHATEAU' AND Value= 1);

INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType)
SELECT 'CIVILIZATION_FRANCE', 'BUILDINGCLASS_CASTLE', 'BUILDING_PALAIS'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_CHATEAU' AND Value= 1);

INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield)
SELECT 'BUILDING_PALAIS', 'YIELD_FOOD', 25 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_CHATEAU' AND Value= 1) UNION ALL
SELECT 'BUILDING_PALAIS', 'YIELD_GOLD', 20 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_CHATEAU' AND Value= 1);

UPDATE Improvements
SET SpecificCivRequired = NULL, CivilizationType = NULL
WHERE Type = 'IMPROVEMENT_CHATEAU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_CHATEAU' AND Value= 1);
	
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES
	('en_US', 'TXT_KEY_BUILDING_PALAIS', 'Palais'),
	('en_US', 'TXT_KEY_BUILDING_PALAIS_TEXT', '+3 [ICON_CULTURE] Culture. Grants +1 [ICON_FOOD] Food for every 4 [ICON_CITIZEN] Citizens and +1 [ICON_GOLD] Gold for every 5 [ICON_CITIZEN] Citizens in the City. +10% Supply.'),
	('en_US', 'TXT_KEY_BUILDING_PALAIS_STRATEGY', 'Unique French replacement for the Castle. It is cheaper than the Castle and has no maintenance while being a strong supporter for infrastructure. The city must possess Walls before the Palais can be constructed.'),
	('en_US', 'TXT_KEY_BUILDING_PALAIS_PEDIA', 'A Palais resembles a Chateau in many features, but is mostly referred to in urban environments.');