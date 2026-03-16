INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	Type, 'BUILDINGCLASS_FACTORY', 'YIELD_PRODUCTION', 3
FROM Buildings
WHERE BuildingClass = 'BUILDINGCLASS_REFINERY';

DELETE FROM Building_BuildingClassYieldChanges WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FACTORY');

-- text

UPDATE Language_en_US
SET Text = 'The Refinery is a Modern-era building which can only be constructed in 5 Cities total. The Refinery helps your Production by boosting all your Factories and produces 1 Iron, Coal and Oil resource each, however it has a high maintenance cost.'
WHERE Tag = 'TXT_KEY_BUILDING_REFINERY_STRATEGY';

UPDATE Language_en_US
SET Text = '+3 [ICON_PRODUCTION] Production to all owned Factories in the Empire. Produces 1 [ICON_RES_IRON] Iron, [ICON_RES_COAL] Coal, and [ICON_RES_OIL] Oil.[NEWLINE][NEWLINE]Can be built in up to 5 Cities maximum.'
WHERE Tag = 'TXT_KEY_BUILDING_REFINERY_HELP';
