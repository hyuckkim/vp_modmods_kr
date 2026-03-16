--==========================================================================================================================
-- Decisions Addin Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support (
	FileName text default null
);
--==========================================================================================================================
-- Events Addin Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS EventsAddin_Support (
	FileName text default null
);
--==========================================================================================================================
-- Other Tables
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Building_YieldFromCityStates (
	BuildingType text,
	YieldType text,
	Yield integer default 0,
	IncludeFriendly boolean default false
);

CREATE TABLE IF NOT EXISTS Building_ResourcePerEra (
	BuildingType text,
	ResourceType text,
	Quantity integer default 0,
	InitialQuantity integer default 0
);
INSERT INTO EventsAddin_Support (FileName) VALUES ('SettlementEvent.lua');

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_UNIT_FOUNDED' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_DIPLO_MODIFIERS' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_GREAT_PEOPLE' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_LIBERATION' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_UNIT_UPGRADES' AND Value = 0;

INSERT INTO DiploModifiers (Type, Description)
SELECT 'DIPLOMODIFIER_BENEVOLENCE_SAME', 'TXT_KEY_SPECIFIC_DIPLO_BENEVOLENCE_SAME' UNION ALL
SELECT 'DIPLOMODIFIER_PRAGMATIC_SAME', 'TXT_KEY_SPECIFIC_DIPLO_PRAGMATIC_SAME' UNION ALL
SELECT 'DIPLOMODIFIER_MALEVOLENCE_SAME', 'TXT_KEY_SPECIFIC_DIPLO_MALEVOLENCE_SAME' UNION ALL
SELECT 'DIPLOMODIFIER_MORAL_DIFFERENCE', 'TXT_KEY_SPECIFIC_DIPLO_MORAL_DIFFERENCE';

INSERT INTO LocalizedText
	(Language, Tag, Text)
VALUES
	('en_US', 'TXT_KEY_SPECIFIC_DIPLO_BENEVOLENCE_SAME', 'We share a benevolence rule among our people.'),
	('en_US', 'TXT_KEY_SPECIFIC_DIPLO_PRAGMATIC_SAME', 'We share a pragmatic rule among our people.'),
	('en_US', 'TXT_KEY_SPECIFIC_DIPLO_MALEVOLENCE_SAME', 'We share a malevolence rule among our people.'),
	('en_US', 'TXT_KEY_SPECIFIC_DIPLO_MORAL_DIFFERENCE', 'We do not share the same morality for our people!');