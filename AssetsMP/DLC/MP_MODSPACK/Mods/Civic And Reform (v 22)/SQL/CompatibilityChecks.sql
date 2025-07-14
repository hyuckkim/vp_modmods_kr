/*
_______________Civic and Reforms for the Community Patch! ________________

Thank you for downloading Civic and Reforms!

_______________OPTIONS FOR CPMC____________________

All options below are preset to the default values of this mod.

-- OPTIONS --
-- If you have not read the instructions above, please do so now!
-- Disabling files below will only require you to set the value to 0.
*/

/*
Vox Populi
0 = Disabled until it detects Vox Populi! (Default).
1 = Enabled if it detects Vox Populi.
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CIVICS', 0);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CIVICS' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_TRADER_SIDS');

/*
_______________Don't touch below here!____________________
*/
UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_DIPLO_MODIFIERS' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'BUGFIX_DUMMY_POLICIES' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_TRADE_ROUTES' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_RELIGION' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_UNIT_FOUNDED' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'YIELD_MODIFIER_FROM_UNITS' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'GLOBAL_CITY_AUTOMATON_WORKERS' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'POLICIES_CITY_AUTOMATON_WORKERS' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'BUILDINGS_CITY_AUTOMATON_WORKERS' AND Value = 0;

INSERT INTO DiploModifiers (Type, Description)
--SELECT 'DIPLOMODIFIER_CIVIC_SAME', 'TXT_KEY_SPECIFIC_DIPLO_CIVIC_SAME' UNION ALL
SELECT 'DIPLOMODIFIER_CIVIC_DIFFERENCE', 'TXT_KEY_SPECIFIC_DIPLO_CIVIC_DIFFERENCE';

INSERT INTO LocalizedText
	(Language, Tag, Text)
VALUES
	--('en_US', 'TXT_KEY_SPECIFIC_DIPLO_CIVIC_SAME', 'Similar values bring us closer.'),
	--('en_US', 'TXT_KEY_SPECIFIC_DIPLO_CIVIC_DIFFERENCE', 'Different values set us apart.');
	('en_US', 'TXT_KEY_SPECIFIC_DIPLO_CIVIC_DIFFERENCE', 'They noticed how you reformed your civics.');