-- Garden
UPDATE Language_en_US
SET Text = 'The Garden increases the speed at which [ICON_GREAT_PEOPLE] Great People are generated in the City by 25%, and buffs the Gold output of Oases and the Tourism output of Lakes. Gardens require an Aqueduct in the City in order to be built.'
WHERE Tag = 'TXT_KEY_BUILDING_GARDEN_STRATEGY';

INSERT INTO Building_LakePlotYieldChanges
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_TOURISM', 2
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GARDEN';

