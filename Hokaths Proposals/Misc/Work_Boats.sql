-- UPDATE Improvements SET DestroyedWhenPillaged = 0 WHERE Type IN ('IMPROVEMENT_OFFSHORE_PLATFORM', 'IMPROVEMENT_FISHING_BOATS');

DELETE FROM Concepts WHERE Type IN ('CONCEPT_WORKERS_REPAIR_WATER', 'CONCEPT_WORKERS_WORKBOATS');
DELETE FROM Concepts_RelatedConcept WHERE ConceptType IN ('CONCEPT_WORKERS_REPAIR_WATER', 'CONCEPT_WORKERS_WORKBOATS');
DELETE FROM Concepts_RelatedConcept WHERE RelatedConcept IN ('CONCEPT_WORKERS_REPAIR_WATER', 'CONCEPT_WORKERS_WORKBOATS');

INSERT INTO Unit_Builds	
		(UnitType, 	BuildType)
SELECT 	 Type,		'BUILD_FISHING_BOATS_NO_KILL' FROM Units WHERE Class='UNITCLASS_WORKER';

UPDATE Builds SET
HotKeyPriority = 0,
Time = 400,
ShowInPedia = 1,
ShowInTechTree = 1,
Help = 'TXT_KEY_BUILD_FISHING_BOAT_HELP',
Recommendation = 'TXT_KEY_BUILD_FISHING_BOAT_REC'
WHERE Type = 'BUILD_FISHING_BOATS_NO_KILL';

INSERT OR REPLACE INTO Language_en_US 
	(Tag, Text)
Values 
	('TXT_KEY_BUILD_FISHING_BOAT_HELP', 'Constructs Fishing Boats on a Sea Resource, which increases the yields based on the Resource.'),
	('TXT_KEY_BUILD_FISHING_BOAT_REC', 'It will increase the yields of this Sea Resource.'),
	('TXT_KEY_CIV5_IMPROVEMENTS_FISHINGBOATS_TEXT', 'Fishing boats allow a civilization to harvest the valuable [ICON_RES_CRAB] Crab, [ICON_RES_WHALE] Whale, [ICON_RES_CORAL] Coral, and [ICON_RES_PEARLS] Pearls Luxury Resources, as well as improve sources of [ICON_RES_FISH] Fish. To construct a fishing boat you must have researched Fishing, which allows your workers to embark.  It is [COLOR_NEGATIVE_TEXT]Destroyed when Pillaged[ENDCOLOR].');

-----------------------------

UPDATE Builds SET
HotKeyPriority = 0,
ShowInPedia = 0,
ShowInTechTree = 0
WHERE Type = 'BUILD_FISHING_BOATS';

--DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_WORKBOAT';

UPDATE Units SET
PrereqTech = NULL,
Cost = -1
WHERE Type = 'UNIT_WORKBOAT';

INSERT INTO Unit_Builds	
		(UnitType, 	BuildType)
SELECT 	 Type,		'BUILD_OFFSHORE_PLATFORM' FROM Units WHERE Class='UNITCLASS_WORKER';

UPDATE Builds SET
Time = 800,
CanBeEmbarked = 1,
Kill = 0,
Help = 'TXT_KEY_BUILD_OFFSHORE_PLATFORMS_HELP',
Recommendation = 'TXT_KEY_BUILD_OFFSHORE_PLATFORMS_REC'
WHERE Type = 'BUILD_OFFSHORE_PLATFORM';

INSERT OR REPLACE INTO Language_en_US 
	(Tag, Text)
Values 
	('TXT_KEY_BUILD_OFFSHORE_PLATFORMS_HELP', 'Constructs an Offshore Platform, which improves the Oil Strategic Resource when it appears on Sea Tiles. Generates a large increase in [ICON_GOLD] Gold and [ICON_PRODUCTION] Production.'),
	('TXT_KEY_BUILD_OFFSHORE_PLATFORMS_REC', 'It will connect this source of [ICON_RES_OIL] Oil and improve Production and Gold output.'),
	('TXT_KEY_CIV5_IMPROVEMENTS_OFFSHOREPLATFORM_TEXT', 'The offshore platform is an important late-game improvement as it provides access to the highly-prized [ICON_RES_OIL] Oil Strategic Resource, but only when it appears in the ocean. It is [COLOR_NEGATIVE_TEXT]Destroyed when Pillaged[ENDCOLOR].');

--------------------------------------
-- more wonders compatibility

INSERT INTO Unit_Builds
	(UnitType, BuildType)
SELECT
	Type, 'BUILD_FISHING_BOATS_GBH'
FROM Units WHERE Class='UNITCLASS_WORKER'
AND EXISTS (SELECT * FROM Builds WHERE Type = 'BUILD_FISHING_BOATS_GBH');

INSERT INTO Unit_Builds
	(UnitType, BuildType)
SELECT
	Type, 'BUILD_OFFSHORE_PLATFORM_GBH'
FROM Units WHERE Class='UNITCLASS_WORKER'
AND EXISTS (SELECT * FROM Builds WHERE Type = 'BUILD_OFFSHORE_PLATFORM_GBH');

UPDATE Builds SET
Time = 700,
CanBeEmbarked = 1,
Kill = 0,
Help = 'TXT_KEY_BUILD_OFFSHORE_PLATFORMS_HELP',
Recommendation = 'TXT_KEY_BUILD_OFFSHORE_PLATFORMS_REC'
WHERE Type = 'BUILD_OFFSHORE_PLATFORM_GBH'
AND EXISTS (SELECT * FROM Builds WHERE Type = 'BUILD_OFFSHORE_PLATFORM_GBH');

UPDATE Builds SET
HotKeyPriority = 0,
CanBeEmbarked = 1,
Time = 500,
Kill = 0,
Help = 'TXT_KEY_BUILD_FISHING_BOAT_HELP',
Recommendation = 'TXT_KEY_BUILD_FISHING_BOAT_REC'
WHERE Type = 'BUILD_FISHING_BOATS_GBH';



