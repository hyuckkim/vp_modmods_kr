---------------------------------
-- compatibility with custom civs
---------------------------------
UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = (CASE 
	WHEN BuildingClassType='BUILDINGCLASS_WINDMILL' THEN 'BUILDINGCLASS_WORKSHOP'
	WHEN BuildingClassType='BUILDINGCLASS_WORKSHOP' THEN 'BUILDINGCLASS_WINDMILL'
	ELSE BuildingClassType END);
	
UPDATE Buildings SET BuildingClass = (CASE 
	WHEN BuildingClass='BUILDINGCLASS_WINDMILL' AND Type != 'BUILDING_WINDMILL' THEN 'BUILDINGCLASS_WORKSHOP'
	WHEN BuildingClass='BUILDINGCLASS_WORKSHOP' AND Type != 'BUILDING_WORKSHOP' THEN 'BUILDINGCLASS_WINDMILL'
	ELSE BuildingClass END);

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility01 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN (NEW.BuildingClassType='BUILDINGCLASS_WINDMILL' OR NEW.BuildingClassType='BUILDINGCLASS_WORKSHOP') AND NEW.BuildingType IS NOT NULL
BEGIN
	UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = (CASE 
	WHEN NEW.BuildingClassType='BUILDINGCLASS_WINDMILL' THEN 'BUILDINGCLASS_WORKSHOP'
	WHEN NEW.BuildingClassType='BUILDINGCLASS_WORKSHOP' THEN 'BUILDINGCLASS_WINDMILL'
	ELSE NEW.BuildingClassType END) WHERE BuildingType = NEW.BuildingType;
END;

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility02 AFTER INSERT ON Buildings
WHEN NEW.BuildingClass='BUILDINGCLASS_WINDMILL'
AND NEW.Type != 'BUILDING_WINDMILL'
BEGIN
	UPDATE Buildings SET 
	BuildingClass = 'BUILDINGCLASS_WORKSHOP',
	PrereqTech = 'TECH_ARCHITECTURE',
	Cost = 600,
	GoldMaintenance = 3,
	BuildingProductionModifier = 15,
	SpecialistType = 'SPECIALIST_ENGINEER',
	SpecialistCount = 0
	WHERE Type = NEW.Type;

	INSERT INTO Building_GrowthExtraYield
		(BuildingType, YieldType, Yield)
	SELECT
		NEW.Type, 'YIELD_PRODUCTION', 25;
END;

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility03 AFTER INSERT ON Buildings
WHEN NEW.BuildingClass='BUILDINGCLASS_WORKSHOP'
AND NEW.Type != 'BUILDING_WORKSHOP'
BEGIN
	UPDATE Buildings SET 
	BuildingClass = 'BUILDINGCLASS_WINDMILL',
	PrereqTech = 'TECH_MACHINERY',
	Cost = 350,
	GoldMaintenance = 2,
	BuildingProductionModifier = 0,
	SpecialistType = 'SPECIALIST_ENGINEER',
	SpecialistCount = 1
	WHERE Type = NEW.Type;

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
		NEW.Type, 'FEATURE_FOREST', 'YIELD_PRODUCTION', 1
	WHERE New.Type != 'BUILDING_JAR_ATLOOH';

	INSERT INTO Building_FeatureYieldChanges
		(BuildingType, FeatureType, YieldType, Yield)
	SELECT
		NEW.Type, 'FEATURE_MARSH', Type, 1
	FROM Yields WHERE Type IN ('YIELD_PRODUCTION', 'YIELD_GOLD');

	INSERT INTO Building_LakePlotYieldChanges
		(BuildingType, YieldType, Yield)
	SELECT
		NEW.Type, YieldType, Yield
	FROM Building_LakePlotYieldChanges WHERE BuildingType = 'BUILDING_WINDMILL';
END;

---------------------------------------------------
---------------------------------------------------
-- windmills came quite early, 9-12 centuries
UPDATE Buildings SET 
PrereqTech = 'TECH_MACHINERY',
Cost = 350,
GoldMaintenance = 2,
BuildingProductionModifier = 0,
SpecialistType = 'SPECIALIST_ENGINEER',
SpecialistCount = 1,
Help = 'TXT_KEY_BUILDING_WORKSHOP_HELP'
WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL';

UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_FORGE' WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL');

-- presumable the class swap already happened
CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility04 AFTER INSERT ON Building_ClassesNeededInCity
WHEN NEW.BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL')
BEGIN
	UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_FORGE' WHERE BuildingType = NEW.BuildingType;
END;

-- whilst workshops refer to the renaissance in their pedia text
UPDATE Buildings SET 
PrereqTech = 'TECH_ARCHITECTURE',
Cost = 600,
GoldMaintenance = 3,
BuildingProductionModifier = 15,
SpecialistType = 'SPECIALIST_ENGINEER',
SpecialistCount = 0,
Help = 'TXT_KEY_BUILDING_WINDMILL_HELP'
WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP';

UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_WINDMILL' WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP');

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility05 AFTER INSERT ON Building_ClassesNeededInCity
WHEN NEW.BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP')
BEGIN
	UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_WINDMILL' WHERE BuildingType = NEW.BuildingType;
END;

-- now update their effects
----------------------
-- Windmill
----------------------
UPDATE Building_BuildingClassLocalYieldChanges SET YieldChange = 2 WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL');
UPDATE Building_BuildingClassLocalYieldChanges SET BuildingClassType = 'BUILDINGCLASS_STABLE' WHERE BuildingClassType = 'BUILDINGCLASS_GRANARY' AND BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL');

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
SELECT
	a.Type, 'IMPROVEMENT_FARM', b.Type, 1
FROM Buildings a, Yields b WHERE a.BuildingClass = 'BUILDINGCLASS_WINDMILL' 
AND b.Type IN ('YIELD_PRODUCTION', 'YIELD_GOLD');

UPDATE Building_ImprovementYieldChanges SET Yield = 1 WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_STOCKYARD');

UPDATE Building_FeatureYieldChanges SET Yield = 1 WHERE BuildingType = 'BUILDING_WINDMILL';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	Type, 'FEATURE_FOREST', 'YIELD_PRODUCTION', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL';

--swap the help texts for modded civ to grab
UPDATE Language_en_US
SET Text = '{TXT_KEY_BUILDING_STABLE}s and {TXT_KEY_BUILDING_GROCER} in the City produce +2 [ICON_FOOD] Food. +1 [ICON_PRODUCTION] Production from Forests worked by this City. +1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Farms and Marshes worked by the City. Nearby Lakes produce +2 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold.'
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_HELP';

UPDATE Language_en_US
SET Text = 'The Windmill is a Medieval-era building which increases the [ICON_PRODUCTION] Production and [ICON_GOLD] Gold output of a City based on the nearby terrain: from Forests, Farms, Marshes, and Lakes. It also provides additional Food if the requisite infrastructure exists in the City.'
WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL_STRATEGY';

UPDATE Language_en_US
SET Text = '+1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Farms and +2 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Pastures worked by the City. 10% of [ICON_FOOD] Food created by the City counts as [ICON_GOLD] Gold Per Turn.[NEWLINE][NEWLINE]Requires 2 [ICON_RES_HORSE] Horses.'
WHERE Tag = 'TXT_KEY_BUILDING_STOCKYARD_HELP';
----------------------
-- Workshop
----------------------
-- it was a windmill so remove these
CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility06 AFTER INSERT ON Building_BuildingClassLocalYieldChanges
WHEN NEW.BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP')
BEGIN
	DELETE FROM Building_BuildingClassLocalYieldChanges WHERE BuildingType = NEW.BuildingType;
END;

UPDATE Building_YieldChanges SET Yield = Yield + 1 WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP');
DELETE FROM Building_FeatureYieldChanges WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP');

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility07 AFTER INSERT ON Building_FeatureYieldChanges
WHEN NEW.BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP')
BEGIN
	DELETE FROM Building_FeatureYieldChanges WHERE BuildingType = NEW.BuildingType;
END;

DELETE FROM Building_YieldChangesPerPop WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP');

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility08 AFTER INSERT ON Building_YieldChangesPerPop
WHEN NEW.BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP')
BEGIN
	DELETE FROM Building_YieldChangesPerPop WHERE BuildingType = NEW.BuildingType;
END;

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_PRODUCTION', 25
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP';

-- swap the help text
UPDATE Language_en_US SET
Text = '+1 [ICON_PRODUCTION] Production from Forests worked by this City, and +1 [ICON_PRODUCTION] Production for every 4 [ICON_CITIZEN] Citizens in the City. Internal [ICON_INTERNATIONAL_TRADE] Trade Routes from this City generate +4 [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]Allows [ICON_PRODUCTION] Production to be moved from this City along trade routes inside your Civilization.'
WHERE Tag='TXT_KEY_BUILDING_WINDMILL_HELP';

UPDATE Language_en_US
SET Text = Replace(Text, '+1 [ICON_PRODUCTION] Production from Forests worked by this City, and +1 [ICON_PRODUCTION] Production for every 4 [ICON_CITIZEN] Citizens in the City.', '25% of the [ICON_PRODUCTION] Production of the City is added to the City''s current [ICON_PRODUCTION] Production after a new [ICON_CITIZEN] Citizen is born. +15% [ICON_PRODUCTION] Production when constructing Buildings.')
WHERE Tag ='TXT_KEY_BUILDING_WINDMILL_HELP';

UPDATE Language_en_US
SET Text = 'The Workshop boosts Production in strong Cities, and improve your ability to move Production to weaker ones with Internal Trade Routes. It also improves the Aqueduct growth bonus, which is best when high Production can also be paired with rapid growth, whether that is a small City getting off the ground or a larger City with ample Food.'
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_STRATEGY';

