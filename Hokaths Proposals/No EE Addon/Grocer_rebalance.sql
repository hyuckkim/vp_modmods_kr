INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_FAITH', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_FAITH', 25
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	Type, 'FEATURE_MARSH', 'YIELD_SCIENCE', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	Type, 'FEATURE_MARSH', 'YIELD_FAITH', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

DELETE FROM Building_YieldChangesPerPop WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER');

UPDATE Buildings SET
FoodKept = 10,
PovertyFlatReduction = 0
WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

INSERT INTO	 Building_Flavors
		(BuildingType,			FlavorType, 	Flavor)
SELECT	Type,	'FLAVOR_RELIGION',	5
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

UPDATE Language_en_US
SET Text = '10% of [ICON_FOOD] Food is carried over, and 25% of the [ICON_PEACE] Faith output of the City is added as an instant boost whenever a [ICON_CITIZEN] Citizen is born in this City. +1 [ICON_PEACE] Faith and [ICON_RESEARCH] Science from Marshes worked by this City.[NEWLINE][NEWLINE]Nearby [ICON_RES_FIGS] Figs: +1 [ICON_GOLD] Gold, +1 [ICON_PRODUCTION] Production, +1 [ICON_FOOD] Food.'
WHERE Tag = 'TXT_KEY_BUILDING_GROCER_HELP';

UPDATE Language_en_US
SET Text = 'The Grocer is a Renaissance-era building which can only be constructed if you have already built an Aqueduct in the City. Like the Aqueduct, the Grocer helps your City grow more quickly and combats Poverty. It also increases Faith output, and is the final building in the Tech Tree to do so.'
WHERE Tag = 'TXT_KEY_BUILDING_GROCER_STRATEGY';

