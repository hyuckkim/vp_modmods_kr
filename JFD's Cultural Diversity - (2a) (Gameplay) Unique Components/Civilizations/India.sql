
----------------------------------------------------------
-- Unique Building: Harappan Reservoir (Aqueduct)->(Well/Watermill)
----------------------------------------------------------
DELETE FROM Civilization_BuildingClassOverrides WHERE BuildingClassType = 'BUILDINGCLASS_AQUEDUCT' AND CivilizationType = 'CIVILIZATION_INDIA';

INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
SELECT	'CIVILIZATION_INDIA',	'BUILDINGCLASS_WATERMILL',	NULL 	UNION ALL
SELECT	'CIVILIZATION_INDIA',	'BUILDINGCLASS_WELL',		'BUILDING_HARAPPAN_RESERVOIR';

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_HARAPPAN_RESERVOIR_HELP', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_WATERMILL_HELP';

DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_HARAPPAN_RESERVOIR';

UPDATE Buildings
SET
	BuildingClass = 'BUILDINGCLASS_WELL',
	Cost = 65,
	PrereqTech = 'TECH_MINING',
	FoodBonusPerCityMajorityFollower = 1,
	AddsFreshWater = 1,
	FoodKept = 0
WHERE Type = 'BUILDING_HARAPPAN_RESERVOIR';

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_HARAPPAN_RESERVOIR';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
SELECT
	'BUILDING_HARAPPAN_RESERVOIR', YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_WATERMILL';

DELETE FROM Building_ImprovementYieldChanges WHERE BuildingType = 'BUILDING_HARAPPAN_RESERVOIR';

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_HARAPPAN_RESERVOIR', 'IMPROVEMENT_FARM', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_YieldChangesPerPop
	(BuildingType, YieldType, Yield)
SELECT
	'BUILDING_HARAPPAN_RESERVOIR', YieldType, Yield
FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_WATERMILL';

DELETE FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_HARAPPAN_RESERVOIR';
DELETE FROM Building_LakePlotYieldChanges WHERE BuildingType = 'BUILDING_HARAPPAN_RESERVOIR';

UPDATE Language_en_US SET
Text = 'The City serves as a source of [COLOR_POSITIVE_TEXT]Fresh Water[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_BUILDING_HARAPPAN_RESERVOIR_HELP';

UPDATE Language_en_US SET
Text = 'Unique Indian replacement for the {TXT_KEY_BUILDING_WELL} and {TXT_KEY_BUILDING_WATERMILL}. Has the yields and scaling of the {TXT_KEY_BUILDING_WATERMILL}, but comes early and is cheap like the Well. Instead of having a placement requirement, it simply provides Fresh Water to surrounding tiles, boosting the yields of Farms that otherwise wouldn''t be irrigated. The Production boost for your Farms is also a significant boost, especially for this point in the game. Finally this Buildings allows India to boost its Cities'' [ICON_FOOD] Food generation based on the strength of the majority [ICON_RELIGION] Religion, scaling across the entire game if you can keep your Religion at home!'
WHERE Tag = 'TXT_KEY_BUILDING_HARAPPAN_RESERVOIR_STRATEGY';

----------------------------------------------------------
-- Unique Building: Qila (Castle)->(Bastion Fort)
----------------------------------------------------------
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = 'BUILDINGCLASS_BASTION_FORT' WHERE BuildingType = 'BUILDING_MUGHAL_FORT';

UPDATE Buildings SET 
BuildingClass = 'BUILDINGCLASS_BASTION_FORT',
CitySupplyModifier = 5, 
CitySupplyFlat = 1,
GreatWorkSlotType = NULL,
GreatWorkCount = 0,
GoldMaintenance = 4,
Cost = 600,
HealRateChange = 5,
Defense = 1000,
PrereqTech = 'TECH_NAVIGATION',
CityIndirectFire = 1,
ExtraCityHitPoints = 0
WHERE Type = 'BUILDING_MUGHAL_FORT';

UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_CASTLE' WHERE BuildingType = 'BUILDING_MUGHAL_FORT';
DELETE FROM Building_ImprovementYieldChanges WHERE BuildingType = 'BUILDING_MUGHAL_FORT';
DELETE FROM Building_BuildingClassLocalYieldChanges WHERE BuildingType = 'BUILDING_MUGHAL_FORT';  -- for subterfuge

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MUGHAL_FORT';
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MUGHAL_FORT', 'YIELD_TOURISM', 2);

DELETE FROM Building_GreatPersonProgressFromConstruction WHERE BuildingType = 'BUILDING_MUGHAL_FORT';
INSERT INTO Building_GreatPersonProgressFromConstruction
	(BuildingType, GreatPersonType, EraType, Value)
VALUES
	('BUILDING_MUGHAL_FORT', 'GREATPERSON_ARTIST', 'ERA_ANCIENT', 5);

UPDATE Language_en_US SET
Text = 'The Qila is the unique Indian replacement for the Bastion Fort. In addition to the normal bonuses of the Fort, the City gains additional health and also increased Defense for every National or World Wonder. Your most magnificent cities also become more difficult to capture. Further, the Qila generates Culture and Great Artist Points, with more coming from your more developed Cities.'
WHERE Tag = 'TXT_KEY_BUILDING_MUGHAL_FORT_STRATEGY';

/*
UPDATE Language_en_US SET
Text = 'Damage from all sources against this City is reduced by 2. +1 [ICON_WAR] Military Supply, and +5% [ICON_SILVER_FIST] Military Supply from Population. Allows City to [ICON_RANGE_STRENGTH] Strike over obstacles.[NEWLINE][NEWLINE]Garrisoned Units receive an additional 5 Health when healing in this City.[NEWLINE][NEWLINE]+1 [ICON_STRENGTH] City Strength for every 2 National or [ICON_WONDER] World Wonders built in this City. 20% of [ICON_STRENGTH] City Defense is converted to [ICON_CULTURE] Culture very turn. When you complete a building gain 5% progress towards a [ICON_GREAT_ARTIST] Great Artist.[NEWLINE][NEWLINE][ICON_CITY_STATE] Empire Size Modifier is reduced by 5% in this City.'
WHERE Tag = 'TXT_KEY_BUILDING_MUGHAL_FORT_HELP';
*/
