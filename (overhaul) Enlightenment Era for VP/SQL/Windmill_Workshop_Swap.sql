---------------------------------
-- compatibility with custom civs
---------------------------------
CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility02 AFTER INSERT ON Buildings
WHEN NEW.BuildingClass='BUILDINGCLASS_WINDMILL'
AND NEW.Type != 'BUILDING_WINDMILL'
BEGIN
	UPDATE Buildings SET 
	PrereqTech = 'TECH_ARCHITECTURE',
	Cost = 600,
	GoldMaintenance = 3,
	BuildingProductionModifier = 15,
	AllowsProductionTradeRoutes = 0
	WHERE Type = NEW.Type;

	INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, BuildingClassType)
	SELECT
		NEW.Type, 'BUILDINGCLASS_WORKSHOP';

	INSERT INTO Building_GrowthExtraYield
		(BuildingType, YieldType, Yield)
	SELECT
		NEW.Type, 'YIELD_PRODUCTION', 25;

	INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, ResourceType, YieldType, Yield) 
	SELECT
		NEW.Type, 'RESOURCE_STONE',	y.Type, 1
	FROM Yields y
	WHERE y.Type IN ('YIELD_GOLDEN_AGE_POINTS', 'YIELD_PRODUCTION');

	INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, ResourceType, YieldType, Yield) 
	SELECT
		NEW.Type, 'RESOURCE_MARBLE',	y.Type, 1
	FROM Yields y
	WHERE y.Type IN ('YIELD_GOLDEN_AGE_POINTS', 'YIELD_CULTURE');
END;

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility03 AFTER INSERT ON Buildings
WHEN NEW.BuildingClass='BUILDINGCLASS_WORKSHOP'
AND NEW.Type != 'BUILDING_WORKSHOP'
BEGIN
	UPDATE Buildings SET
	SpecialistType = 'SPECIALIST_ENGINEER',
	SpecialistCount = 1
	WHERE Type = NEW.Type AND SpecialistType = NULL;

	INSERT INTO Building_BuildingClassLocalYieldChanges
		(BuildingType, BuildingClassType, YieldType, YieldChange)
	SELECT
		NEW.Type, Type, 'YIELD_FOOD', 2
	FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_STABLE', 'BUILDINGCLASS_GROCER');
	
	INSERT INTO Building_ImprovementYieldChanges
		(BuildingType, ImprovementType, YieldType, Yield)
	SELECT
		NEW.Type, 'IMPROVEMENT_FARM', Type, 1
	FROM Yields WHERE Type IN ('YIELD_PRODUCTION', 'YIELD_GOLD');

	INSERT INTO Building_FeatureYieldChanges
		(BuildingType, FeatureType, YieldType, Yield)
	SELECT
		NEW.Type, 'FEATURE_MARSH', Type, 1
	FROM Yields WHERE Type IN ('YIELD_PRODUCTION', 'YIELD_GOLD');

	INSERT INTO Building_LakePlotYieldChanges
		(BuildingType, YieldType, Yield)
	SELECT
		NEW.Type, YieldType, 1
	FROM Building_LakePlotYieldChanges WHERE BuildingType = 'BUILDING_WINDMILL';
END;

---------------------------------------------------
-- we will just change the names and the icons
---------------------------------------------------
----------------------
-- Windmill
----------------------
-- windmills came quite early, 9-12 centuries
UPDATE Buildings SET 
Civilopedia = 'TXT_KEY_CIV5_BUILDINGS_WINDMILL_TEXT',
PortraitIndex = 1,
SpecialistType = 'SPECIALIST_ENGINEER',
SpecialistCount = 1,
PrereqTech = 'TECH_MACHINERY'
WHERE Type = 'BUILDING_WORKSHOP';

UPDATE Language_en_US SET Text = 'Workshop' WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL';

UPDATE Building_BuildingClassLocalYieldChanges SET YieldChange = 2 WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL');
UPDATE Building_BuildingClassLocalYieldChanges SET BuildingClassType = 'BUILDINGCLASS_STABLE' WHERE BuildingClassType = 'BUILDINGCLASS_GRANARY' AND BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL');
UPDATE Building_BuildingClassLocalYieldChanges SET BuildingType = 'BUILDING_WORKSHOP' WHERE BuildingType = 'BUILDING_WINDMILL';

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
SELECT
	a.Type, 'IMPROVEMENT_FARM', b.Type, 1
FROM Buildings a, Yields b WHERE a.BuildingClass = 'BUILDINGCLASS_WORKSHOP' 
AND b.Type IN ('YIELD_PRODUCTION', 'YIELD_GOLD');

UPDATE Building_ImprovementYieldChanges SET Yield = 1 WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_AGRIBUSINESS');

-- move the marsh and lake changes to the new windmil/old workshop
UPDATE Building_FeatureYieldChanges SET Yield = 1 WHERE BuildingType = 'BUILDING_WINDMILL';
UPDATE Building_LakePlotYieldChanges SET Yield = 1 WHERE BuildingType = 'BUILDING_WINDMILL';

UPDATE Building_FeatureYieldChanges SET BuildingType = 'BUILDING_WORKSHOP' WHERE BuildingType = 'BUILDING_WINDMILL';
UPDATE Building_LakePlotYieldChanges SET BuildingType = 'BUILDING_WORKSHOP' WHERE BuildingType = 'BUILDING_WINDMILL';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	'BUILDING_WORKSHOP', 'FEATURE_FOREST', 'YIELD_PRODUCTION', 1;

UPDATE Language_en_US
SET Text = '{TXT_KEY_BUILDING_STABLE}s and Pharmacies in the City produce +2 [ICON_FOOD] Food. +1 [ICON_PRODUCTION] Production from Forests worked by this City. +1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Farms, Marshes, and Lakes.[NEWLINE][NEWLINE]Allows [ICON_PRODUCTION] Production to be moved from this City along trade routes inside your Civilization.'
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_HELP';

UPDATE Language_en_US
SET Text = 'The Windmill is a Medieval-era building which increases the [ICON_PRODUCTION] Production and [ICON_GOLD] Gold output of a City based on the nearby terrain: from Forests, Farms, Marshes, and Lakes. It also provides additional Food if the requisite infrastructure exists in the City.'
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_STRATEGY';

UPDATE Language_en_US
SET Text = '+1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Farms and +2 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Pastures worked by the City. 10% of [ICON_FOOD] Food created by the City counts as [ICON_GOLD] Gold Per Turn.[NEWLINE][NEWLINE]Requires 2 [ICON_RES_HORSE] Horses.'
WHERE Tag = 'TXT_KEY_BUILDING_AGRIBUSINESS_HELP';

----------------------
-- Workshop
----------------------
-- whilst workshops refer to the renaissance in their pedia text
UPDATE Buildings SET 
Civilopedia = 'TXT_KEY_CIV5_BUILDINGS_WORKSHOP_TEXT',
PortraitIndex = 28,
PrereqTech = 'TECH_ARCHITECTURE',
Cost = 600,
GoldMaintenance = 3
WHERE Type = 'BUILDING_WINDMILL';

UPDATE Language_en_US SET Text = 'Windmill' WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP';

-- windmills dont currently have prereqs
INSERT INTO Building_ClassesNeededInCity 
	(BuildingType, BuildingClassType)
SELECT
	Type, 'BUILDINGCLASS_WORKSHOP'
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL';

UPDATE Building_YieldChanges SET Yield = Yield + 1 WHERE BuildingType = 'BUILDING_WINDMILL';
DELETE FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_WINDMILL';
DELETE FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_WINDMILL';

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_PRODUCTION', 25
FROM Buildings WHERE Type = 'BUILDING_WINDMILL';

INSERT INTO Building_ResourceYieldChanges 
	(BuildingType, ResourceType, YieldType, Yield) 
SELECT
	b.Type, 'RESOURCE_STONE',	y.Type, 1
FROM Buildings b, Yields y
WHERE y.Type IN ('YIELD_GOLDEN_AGE_POINTS', 'YIELD_PRODUCTION')
AND b.Type IN (SELECT Type FROM Buildings WHERE Type = 'BUILDING_WINDMILL');

INSERT INTO Building_ResourceYieldChanges 
	(BuildingType, ResourceType, YieldType, Yield) 
SELECT
	b.Type, 'RESOURCE_MARBLE',	y.Type, 1
FROM Buildings b, Yields y
WHERE y.Type IN ('YIELD_GOLDEN_AGE_POINTS', 'YIELD_CULTURE')
AND b.Type IN (SELECT Type FROM Buildings WHERE Type = 'BUILDING_WINDMILL');

-- update the help text
UPDATE Language_en_US SET
Text = '+1 [ICON_PRODUCTION] Production from Forests worked by this City, and +1 [ICON_PRODUCTION] Production for every 4 [ICON_CITIZEN] Citizens in the City. Internal [ICON_INTERNATIONAL_TRADE] Trade Routes from this City generate +4 [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]Nearby [ICON_RES_STONE] Stone: +1 [ICON_PRODUCTION] Production and [ICON_GOLDEN_AGE] Golden Age Point.[NEWLINE]Nearby [ICON_RES_MARBLE] Marble: +1 [ICON_CULTURE] Culture and [ICON_GOLDEN_AGE] Golden Age Point.'
WHERE Tag='TXT_KEY_BUILDING_WINDMILL_HELP';

UPDATE Language_en_US
SET Text = Replace(Text, '+1 [ICON_PRODUCTION] Production from Forests worked by this City, and +1 [ICON_PRODUCTION] Production for every 4 [ICON_CITIZEN] Citizens in the City.', '25% of the [ICON_PRODUCTION] Production of the City is added to the City''s current [ICON_PRODUCTION] Production after a new [ICON_CITIZEN] Citizen is born. +15% [ICON_PRODUCTION] Production when constructing Buildings.')
WHERE Tag ='TXT_KEY_BUILDING_WINDMILL_HELP';

UPDATE Language_en_US
SET Text = 'The Workshop boosts Production in strong Cities, and improves your ability to move Production to weaker ones with Internal Trade Routes. It also improves the Aqueduct growth bonus, which is best when high Production can also be paired with rapid growth, whether that is a small City getting off the ground or a larger City with ample Food.'
WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL_STRATEGY';

------------------------------------------------------------
-- compatibility
------------------------------------------------------------
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
SELECT 'TXT_KEY_BUILDING_ATLOOH_HELP_EE',
'+1 [ICON_CULTURE] Culture for every 4 [ICON_CITIZEN] Citizens in the City. [ICON_ARTIST] Artist Specialists in the City generate +2 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, and [ICON_PEACE] Faith. Provides 1 copy of the [ICON_RES_JAR_DIYOGI] Diyogi Luxury Resource. +1 [ICON_CULTURE] Culture for every 4 [ICON_CITIZEN] Citizens in the City.[NEWLINE][NEWLINE]' || Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_SHEEP] Sheep: +2 [ICON_GOLD] Gold.'
FROM Language_en_US WHERE Tag='TXT_KEY_BUILDING_WORKSHOP_HELP';

UPDATE Language_en_US SET Text = REPLACE(Text, '+1 [ICON_PRODUCTION] Production from Forests worked by this City', '+1 [ICON_PRODUCTION] Production from Plains and Desert tiles worked by this City')
WHERE Tag = 'TXT_KEY_BUILDING_ATLOOH_HELP_EE';

UPDATE Buildings SET Help = 'TXT_KEY_BUILDING_ATLOOH_HELP_EE' WHERE Type = 'BUILDING_JAR_ATLOOH';

CREATE TRIGGER IF NOT EXISTS EE_Navajo_compatibility AFTER INSERT ON Buildings
WHEN NEW.Type = 'BUILDING_JAR_ATLOOH'
BEGIN
	UPDATE Buildings SET Help = 'TXT_KEY_BUILDING_ATLOOH_HELP_EE' WHERE Type = NEW.Type;

	INSERT INTO Building_YieldChangesPerPop 	
		(BuildingType,		YieldType,	Yield)
	SELECT
		'BUILDING_JAR_ATLOOH',	'YIELD_CULTURE', 25;

END;

