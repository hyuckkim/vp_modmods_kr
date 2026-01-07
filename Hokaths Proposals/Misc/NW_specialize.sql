-----------------------------------------------------------------------------------------
-- add new coastal NW for engineers
----------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 	
	(Type,	DefaultBuilding, Description, MaxPlayerInstances)
VALUES		
	('BUILDINGCLASS_MASTER_SHIPWRIGHT',	'BUILDING_MASTER_SHIPWRIGHT',	'TXT_KEY_BUILDING_MASTER_SHIPWRIGHT', 1);

INSERT INTO	 Buildings
	(Type,	Description,	Civilopedia,  Strategy,		Help,		
		GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	BuildingClass, 	
		NumCityCostMod, NationalPopRequired, NeverCapture, NukeImmune,	
		ArtDefineTag, 	PrereqTech, 	PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_MASTER_SHIPWRIGHT',	'TXT_KEY_BUILDING_MASTER_SHIPWRIGHT', 	'TXT_KEY_BUILDING_MASTER_SHIPWRIGHT_TEXT',	'TXT_KEY_BUILDING_MASTER_SHIPWRIGHT_STRATEGY',	'TXT_KEY_BUILDING_MASTER_SHIPWRIGHT_HELP',	
		2, 	60, -20, 	10, 	'BUILDINGCLASS_MASTER_SHIPWRIGHT', 	
 		25,  12, 1, 1, 
		'ART_DEF_BUILDING_MARKET', 	'TECH_MATHEMATICS', 	8,	'CORP2_ATLAS');

UPDATE Buildings SET
    SpecialistType = 'SPECIALIST_ENGINEER',
    SpecialistCount = 1,
    GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_MASTER_SHIPWRIGHT';

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
VALUES
	('BUILDING_MASTER_SHIPWRIGHT', 'SPECIALIST_ENGINEER', 25);

INSERT INTO Building_DomainProductionModifiers
	(BuildingType, DomainType, Modifier)
VALUES
	('BUILDING_MASTER_SHIPWRIGHT', 'DOMAIN_SEA', 15);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_MASTER_SHIPWRIGHT', 'IMPROVEMENT_FISHING_BOATS', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MASTER_SHIPWRIGHT', 'YIELD_PRODUCTION', 2),
	('BUILDING_MASTER_SHIPWRIGHT', 'YIELD_SCIENCE', 2),
	('BUILDING_MASTER_SHIPWRIGHT', 'YIELD_CULTURE', 1);

INSERT INTO Building_Flavors
	(BuildingType,	FlavorType,	Flavor)
VALUES
	('BUILDING_MASTER_SHIPWRIGHT',	'FLAVOR_PRODUCTION', 40),
	('BUILDING_MASTER_SHIPWRIGHT',	'FLAVOR_NAVAL_GROWTH', 20),
	('BUILDING_MASTER_SHIPWRIGHT',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 20);

INSERT INTO Building_ClassesNeededInCity 	
	(BuildingType, 	BuildingClassType)
VALUES	
	('BUILDING_MASTER_SHIPWRIGHT',	'BUILDINGCLASS_LIGHTHOUSE');

INSERT INTO Language_en_US 
	(Tag, Text)
VALUES	
	('TXT_KEY_BUILDING_MASTER_SHIPWRIGHT',  'Master Shipwright'),
	('TXT_KEY_BUILDING_MASTER_SHIPWRIGHT_TEXT',   'A master shipwright was the highest-ranking carpenter responsible for building and repairing ships, a role that has evolved over time from a position of command in historic dockyards to a modern role in contemporary shipbuilding projects. Until recently, with the development of complex non-maritime technologies, a ship has often represented the most advanced structure that the society building it could produce. Owing to the critical importance of a strong navy to imperial power, over much of history the most skilled shipwrights were under the employ of the state.'),
	('TXT_KEY_BUILDING_MASTER_SHIPWRIGHT_STRATEGY',	'The Master Shipwright is a good long term investment for a Coastal City that will be producing the rump of your naval forces. It however has a dual role, boosting the value of Engineers in the City by providing additional Great Person Points (including 1 flat point per turn), meaning whichever City you put this in will be encouraged to focus on Engineers, possibly at the expense of other Specialists, so pick carefully.'),
	('TXT_KEY_BUILDING_MASTER_SHIPWRIGHT_HELP',    '');
-- Fishing Boats worked by this City yield +1 [ICON_PRODUCTION] Production. +25% [ICON_ENGINEER] Engineer rate in this City. +15% [ICON_PRODUCTION] to all Naval Units trained in this City.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own.

----------------------------------------------------------------------------------------
-- take GEMS off national epic
-----------------------------------------------------------------------------------------

UPDATE Buildings SET
    GreatPeopleRateModifier = 0
WHERE Type = 'BUILDING_NATIONAL_EPIC';  -- uniques can keep it

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
SELECT
	'BUILDING_NATIONAL_EPIC', Type, 25
FROM Specialists WHERE Type IN ('SPECIALIST_WRITER', 'SPECIALIST_ARTIST', 'SPECIALIST_MUSICIAN');

-----------------------------------------------------------------------------------------
-- Change Circus Maximus to have Merchant effects, move Culture to Grand Temple
-----------------------------------------------------------------------------------------

UPDATE Buildings SET
    SpecialistType = 'SPECIALIST_MERCHANT',
    GreatPeopleRateChange = 1,
    SpecialistCount = 1
WHERE BuildingClass = 'BUILDINGCLASS_CIRCUS_MAXIMUS';

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
SELECT
	Type, 'SPECIALIST_MERCHANT', 25
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CIRCUS_MAXIMUS';

DELETE FROM Building_WLTKDYieldMod WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_CIRCUS_MAXIMUS';

INSERT INTO Building_WLTKDYieldMod
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_CULTURE', 10
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GRAND_TEMPLE';

-----------------------------------------------------------------------------------------
-- add Scientist effects to National College
-----------------------------------------------------------------------------------------

UPDATE Buildings SET
    SpecialistType = 'SPECIALIST_SCIENTIST',
    GreatPeopleRateChange = 1,
    SpecialistCount = 1
WHERE BuildingClass = 'BUILDINGCLASS_NATIONAL_COLLEGE';

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
SELECT
	Type, 'SPECIALIST_SCIENTIST', 25
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_NATIONAL_COLLEGE';

-----------------------------------------------------------------------------------------
-- add Civil Servant effects to Scrivener Office
-----------------------------------------------------------------------------------------

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
SELECT
	Type, 'SPECIALIST_CIVIL_SERVANT', 25
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_SCRIVENERS_OFFICE';

-----------------------------------------------------------------------------------------
-- add tile improvement interactions to Oxford and Grand Temple
-----------------------------------------------------------------------------------------

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
SELECT
	a.Type, 'IMPROVEMENT_ACADEMY', b.Type, 1
FROM Buildings a, Yields b WHERE
a.BuildingClass = 'BUILDINGCLASS_OXFORD_UNIVERSITY' AND
b.Type IN ('YIELD_TOURISM', 'YIELD_FAITH');

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
SELECT
	a.Type, 'IMPROVEMENT_HOLY_SITE', b.Type, 1
FROM Buildings a, Yields b WHERE
a.BuildingClass = 'BUILDINGCLASS_GRAND_TEMPLE' AND
b.Type IN ('YIELD_CULTURE', 'YIELD_GOLDEN_AGE_POINTS');

/*
-- dont let oxford be built in capital
INSERT INTO Building_LockedBuildingClasses
	(BuildingType, BuildingClassType)
SELECT
	Type, 'BUILDINGCLASS_PALACE'
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_OXFORD_UNIVERISTY';

UPDATE Language_en_US SET
Text = Replace(Text, 'Cities you own.', 'Cities you own. [COLOR_NEGATIVE_TEXT]Cannot[ENDCOLOR] be built in the [ICON_CAPITAL] Capital.')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_OXFORD_UNIVERSITY');
*/