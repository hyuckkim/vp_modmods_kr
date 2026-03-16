INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
SELECT
	Type, 'BUILDINGCLASS_JAIL'
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CONSTABLE';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_JAIL', 'YIELD_PRODUCTION', 2);

INSERT INTO Building_YieldFromSpyAttack
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_JAIL', 'YIELD_CULTURE_LOCAL', 25);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_JAIL', 'IMPROVEMENT_QUARRY', 'YIELD_PRODUCTION', 1),
	('BUILDING_JAIL', 'IMPROVEMENT_QUARRY', 'YIELD_CULTURE_LOCAL', 1);

INSERT INTO Building_YieldFromBorderGrowth
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_JAIL', 'YIELD_GOLD', 5);

-- Castle
DELETE FROM Building_ImprovementYieldChanges
WHERE ImprovementType = 'IMPROVEMENT_QUARRY'
AND BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CASTLE');

INSERT INTO Building_BuildingClassLocalYieldChanges
    (BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
    Type, 'BUILDINGCLASS_JAIL', 'YIELD_TOURISM', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CASTLE';

INSERT INTO Building_BuildingClassLocalYieldChanges
    (BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
    Type, 'BUILDINGCLASS_HARBOR', 'YIELD_TOURISM', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CASTLE';

INSERT INTO Building_BuildingClassLocalYieldChanges
    (BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
    Type, 'BUILDINGCLASS_CONSTABLE', 'YIELD_TOURISM', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CASTLE';

/*
UPDATE Language_en_US
SET Text = 'Damage from all sources against this City is reduced by 2. +10% [ICON_SILVER_FIST] Military Supply from Population. Contains 1 slot for a [ICON_GREAT_WORK] Great Work of Art or Artifact. Jail, Harbor, and Constabulary in this City gain +1 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE][ICON_CITY_STATE] Empire Size Modifier is reduced by 5% in this City.'
WHERE Tag = 'TXT_KEY_BUILDING_CASTLE_HELP';
*/

UPDATE Language_en_US
SET Text = 'The Castle is a Medieval-era building which increases Defensive Strength and reduces all incoming damage by 2. Increases Military Units supplied by this City''s population by 10%. It is also an early source of Tourism. Also helps with managing the Empire Size Modifier in this City. The City must already possess Walls before a Castle can be constructed.'
WHERE Tag = 'TXT_KEY_BUILDING_CASTLE_STRATEGY';

/*
UPDATE Language_en_US
SET Text = 'Damage from all sources against this City is reduced by 2. Contains 1 slot for a [ICON_GREAT_WORK] Great Work of Art or Artifact. Jail, Harbor, and Constabulary in this City gain +1 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]+1 [ICON_STRENGTH] City Strength for every 2 National or World Wonders built in the City. 20% of [ICON_STRENGTH] City Defense is converted into [ICON_CULTURE] Culture every turn.[NEWLINE][NEWLINE][ICON_CITY_STATE] Empire Size Modifier is reduced by 5% in this City.'
WHERE Tag = 'TXT_KEY_BUILDING_INDIA_QILA_HELP';

UPDATE Language_en_US
SET Text = 'Replaces the Castle. Gives a Free [COLOR_POSITIVE_TEXT]Armory[ENDCOLOR] in the City when built.[NEWLINE][NEWLINE]Damage from all sources against this City is reduced by 3. 15% [ICON_SILVER_FIST] Military Supply from Population. Contains 1 slot for a [ICON_GREAT_WORK] Great Work of Art or Artifact. Jail, Harbor, and Constabulary in this City gain +1 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]+10% [ICON_RANGE_STRENGTH] Ranged Combat Strength for City Bombardment and +33% [ICON_RANGE_STRENGTH] Ranged Combat Strength for Ranged units, and Siege Units garrisoned in this City.[NEWLINE][NEWLINE][ICON_CITY_STATE] Empire Size Modifier is reduced by 5% in this City.'
WHERE Tag = 'TXT_KEY_BUILDING_POLAND_BARBICAN_HELP';
*/
