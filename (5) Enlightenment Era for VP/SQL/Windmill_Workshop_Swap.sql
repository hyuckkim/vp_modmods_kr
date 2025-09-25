--================================================================================
-- Windmill (Before Workshop line change)
--================================================================================
DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_WINDMILL';

-- need forge
INSERT INTO Building_ClassesNeededInCity 
	(BuildingType, BuildingClassType)
SELECT
	Type, 'BUILDINGCLASS_FORGE'
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL';

-- windmills came quite early, 9-12 centuries
UPDATE Buildings SET 
PrereqTech = 'TECH_MACHINERY',
Cost = 350,
BuildingProductionModifier = 0,
GoldMaintenance = 2,
SpecialistCount = 0, -- move to Workshop
AllowsProductionTradeRoutes= 1
WHERE Type = 'BUILDING_WINDMILL';

-- Farm gold+1, production+1
INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
SELECT
	a.Type, 'IMPROVEMENT_FARM', b.Type, 1
FROM Buildings a, Yields b WHERE a.BuildingClass = 'BUILDINGCLASS_WINDMILL' 
AND b.Type IN ('YIELD_PRODUCTION', 'YIELD_GOLD');

-- marsh prodution +1. gold+1 
UPDATE Building_FeatureYieldChanges SET Yield = 1 WHERE BuildingType = 'BUILDING_WINDMILL';
-- lake  prodution +1. gold+1 
UPDATE Building_LakePlotYieldChanges SET Yield = 1 WHERE BuildingType = 'BUILDING_WINDMILL';
-- Stable, Grany +2 food
UPDATE Building_BuildingClassLocalYieldChanges SET BuildingClassType = 'BUILDINGCLASS_STABLE' WHERE BuildingClassType = 'BUILDINGCLASS_GRANARY' AND BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP');
UPDATE Building_BuildingClassLocalYieldChanges SET YieldChange = 2 WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL');

UPDATE Language_en_US
SET Text = '{TXT_KEY_BUILDING_STABLE}s and Pharmacies in the City produce +2 [ICON_FOOD] Food. +1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Farms, Marshes, and Lakes.[NEWLINE][NEWLINE]Allows [ICON_PRODUCTION] Production to be moved from this City along trade routes inside your Civilization.'
WHERE Tag='TXT_KEY_BUILDING_WINDMILL_HELP';

UPDATE Language_en_US
SET Text = 'The Windmill is a Medieval-era building which increases the [ICON_PRODUCTION] Production and [ICON_GOLD] Gold output of a City based on the nearby terrain: from Forests, Farms, Marshes, and Lakes. It also provides additional Food if the requisite infrastructure exists in the City.'
WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL_STRATEGY';
--================================================================================
-- Worskshop (Before Windmill line change)
--================================================================================
DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_WORKSHOP';
DELETE FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_WORKSHOP';
DELETE FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_WORKSHOP';

INSERT INTO Building_ClassesNeededInCity 
	(BuildingType, BuildingClassType)
SELECT
	Type, 'BUILDINGCLASS_WINDMILL'
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP';

-- need workshop
UPDATE Buildings SET 
PrereqTech = 'TECH_ARCHITECTURE',
Cost = 600,
BuildingProductionModifier = 15,
SpecialistType = 'SPECIALIST_ENGINEER',--  come from Windmill
SpecialistCount = 1, -- come from Windmill
GoldMaintenance = 3,
AllowsProductionTradeRoutes=0
WHERE Type = 'BUILDING_WORKSHOP';

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_PRODUCTION', 25
FROM Buildings WHERE Type = 'BUILDING_WORKSHOP';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	'BUILDING_WORKSHOP', 'FEATURE_FOREST', 'YIELD_PRODUCTION', 1;

INSERT INTO Building_ResourceYieldChanges 
  (BuildingType, ResourceType, YieldType, Yield) 
SELECT
  'BUILDING_WORKSHOP', 'RESOURCE_STONE', y.Type, 1
FROM Yields y
WHERE y.Type IN ('YIELD_GOLDEN_AGE_POINTS', 'YIELD_PRODUCTION');

-- Prouction+1
UPDATE Building_YieldChanges SET Yield = Yield + 1 WHERE BuildingType = 'BUILDING_WORKSHOP';

-- Now changed, so need change neededincity
DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_EE_CLOTH_MILL';
INSERT INTO Building_ClassesNeededInCity 	(BuildingType, BuildingClassType)
SELECT	Type, 'BUILDINGCLASS_WORKSHOP'
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_EE_CLOTH_MILL';

UPDATE Language_en_US SET
Text = '+1 [ICON_PRODUCTION] Production from Forests worked by this City, and +1 [ICON_PRODUCTION] Production for every 4 [ICON_CITIZEN] Citizens in the City. Internal [ICON_INTERNATIONAL_TRADE] Trade Routes from this City generate +4 [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]Nearby [ICON_RES_STONE] Stone: +1 [ICON_PRODUCTION] Production and [ICON_GOLDEN_AGE] Golden Age Point.'
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_HELP';

UPDATE Language_en_US
SET Text = Replace(Text, '+1 [ICON_PRODUCTION] Production from Forests worked by this City, and +1 [ICON_PRODUCTION] Production for every 4 [ICON_CITIZEN] Citizens in the City.', '25% of the [ICON_PRODUCTION] Production of the City is added to the City''s current [ICON_PRODUCTION] Production after a new [ICON_CITIZEN] Citizen is born. +15% [ICON_PRODUCTION] Production when constructing Buildings.')
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_HELP';

UPDATE Language_en_US
SET Text = 'The Workshop boosts Production in strong Cities, and improves your ability to move Production to weaker ones with Internal Trade Routes. It also improves the Aqueduct growth bonus, which is best when high Production can also be paired with rapid growth, whether that is a small City getting off the ground or a larger City with ample Food.'
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_STRATEGY';

--================================================================================
-- Stock yard
--================================================================================
UPDATE Building_ImprovementYieldChanges
SET Yield = 1
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_STOCKYARD')
  AND ImprovementType = 'IMPROVEMENT_FARM';


UPDATE Language_en_US
SET Text = '+1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Farms and +2 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Pastures worked by the City. 10% of [ICON_FOOD] Food created by the City counts as [ICON_GOLD] Gold Per Turn.[NEWLINE][NEWLINE]Requires 2 [ICON_RES_HORSE] Horses.'
WHERE Tag = 'TXT_KEY_BUILDING_STOCKYARD_HELP';


