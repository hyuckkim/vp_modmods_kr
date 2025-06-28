--------------------
-- Tradition
--------------------

-- Database Changes
DELETE FROM Building_BuildingClassYieldChanges WHERE BuildingType IN ('BUILDING_PALACE_TREASURY', 'BUILDING_PALACE_ASTROLOGER');

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES	
	('BUILDING_PALACE_ASTROLOGER', 'BUILDINGCLASS_LODGE', 'YIELD_SCIENCE', 1),
	('BUILDING_PALACE_ASTROLOGER', 'BUILDINGCLASS_HERBALIST', 'YIELD_SCIENCE', 1),
	('BUILDING_PALACE_COURT_CHAPEL', 'BUILDINGCLASS_SHRINE', 'YIELD_CULTURE_LOCAL', 2),
	('BUILDING_PALACE_COURT_CHAPEL', 'BUILDINGCLASS_STONE_WORKS', 'YIELD_CULTURE_LOCAL', 2),
	('BUILDING_CAPITAL_ENGINEER', 'BUILDINGCLASS_GROVE', 'YIELD_PRODUCTION', 1),	
	('BUILDING_CAPITAL_ENGINEER', 'BUILDINGCLASS_FORGE', 'YIELD_PRODUCTION', 1),
	('BUILDING_PALACE_TREASURY', 'BUILDINGCLASS_MONUMENT', 'YIELD_CULTURE', 2),
	('BUILDING_PALACE_TREASURY', 'BUILDINGCLASS_AQUEDUCT', 'YIELD_CULTURE', 2),
	('BUILDING_PALACE_TREASURY', 'BUILDINGCLASS_BATH', 'YIELD_CULTURE', 2),
	('BUILDING_PALACE_GARDEN', 'BUILDINGCLASS_GRANARY', 'YIELD_TOURISM', 2),
	('BUILDING_PALACE_GARDEN', 'BUILDINGCLASS_CARAVANSARY', 'YIELD_TOURISM', 2),
	('BUILDING_PALACE_GARDEN', 'BUILDINGCLASS_GARDEN', 'YIELD_TOURISM', 2);

DELETE FROM Policy_CityYieldChanges WHERE PolicyType = 'POLICY_ARISTOCRACY' AND YieldType = 'YIELD_PRODUCTION';

-- actually scratch this. we will make stoneworks buildable everywhere instead
--Building_YieldFromInternalTR
--	(BuildingClassType, YieldType, Yield)
--VALUES
--	('BUILDINGCLASS_CAPITAL_ENGINEER', 'YIELD_PRODUCTION', 2);
--
--UPDATE Buildings SET AllowsProductionTradeRoutes = 1 WHERE Type = 'BUILDING_CAPITAL_ENGINEER';

-- remove the build requirement part of Legalism, its odd and i want the 1 Happiness from scrivener

-- policy buildings no longer national wonders
UPDATE BuildingClasses SET MaxPlayerInstances = -1 WHERE Type IN 
('BUILDINGCLASS_PALACE_THRONE_ROOM', 
'BUILDINGCLASS_PALACE_TREASURY', 
'BUILDINGCLASS_CAPITAL_ENGINEER', 
'BUILDINGCLASS_PALACE_GARDEN', 
'BUILDINGCLASS_PALACE_COURT_CHAPEL', 
'BUILDINGCLASS_PALACE_ASTROLOGER');

DELETE FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_LEGALISM';
INSERT INTO Policy_BuildingClassHappiness
	(PolicyType, BuildingClassType, Happiness)
SELECT
	'POLICY_LEGALISM', Type, 1
FROM BuildingClasses
WHERE MaxPlayerInstances = 1;

DELETE FROM Policy_BuildingClassProductionModifiers WHERE PolicyType = 'POLICY_LEGALISM';
INSERT INTO Policy_BuildingClassProductionModifiers
	(PolicyType, BuildingClassType, ProductionModifier)
SELECT
	'POLICY_LEGALISM', Type, 25
FROM BuildingClasses
WHERE MaxPlayerInstances = 1;

-- TEXT
-- updated for azum supply integration
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Justice[ENDCOLOR][NEWLINE][ICON_BULLET]Cities with a garrison gain +25% [ICON_RANGE_STRENGTH] Ranged Combat Strength.[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_CAPITAL_ENGINEER}[ENDCOLOR] built in [ICON_CAPITAL] Capital (+3 [ICON_PRODUCTION] Production, +2 [ICON_STRENGTH] Defense, +50 Hit Points, +1 [ICON_PRODUCTION] Production to all Councils and Forges, +10% [ICON_SILVER_FIST] Military Supply from [ICON_CITIZEN] Population in the City; 1 [ICON_VP_ENGINEER] Engineer Slot).'
WHERE Tag = 'TXT_KEY_POLICY_ARISTOCRACY_HELP';

UPDATE Language_en_US
SET Text = 'Ceremony'
WHERE Tag = 'TXT_KEY_POLICY_OLIGARCHY';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Ceremony[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_CULTURE] Culture cost of tiles reduced by 20% (exponentially) in all Cities.[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_PALACE_COURT_CHAPEL}[ENDCOLOR] built in [ICON_CAPITAL] Capital (+3 [ICON_PEACE] Faith, +2 [ICON_CULTURE_LOCAL] Border Growth Points to all Shrines and Stoneworks, 1 [ICON_GREAT_WORK] Great Work of Art or Artifact slot; 1 [ICON_VP_ARTIST] Artist Slot).'
WHERE Tag = 'TXT_KEY_POLICY_OLIGARCHY_HELP';

UPDATE Language_en_US
SET Text = 'A ceremony is an event of ritual significance, performed on a special occasion. The word may be of Etruscan origin, via the Latin caerimonia. One of the major markers of a court is ceremony. Most monarchal courts included ceremonies concerning the investiture or coronation of the monarch and audiences with the monarch. Some courts had ceremonies around the waking and the sleeping of the monarch called a levee. Orders of chivalry as honorific orders became an important part of court culture starting in the 15th century. They were the right of the monarch to create and grant as the fount of honour.'
WHERE Tag = 'TXT_KEY_POLICY_OLIGARCHY_TEXT';

UPDATE Language_en_US
SET Text = 'Bounty'
WHERE Tag = 'TXT_KEY_POLICY_MONARCHY';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Bounty[ENDCOLOR][NEWLINE][ICON_BULLET]Specialists in [ICON_CAPITAL] Capital consume half the normal amount of [ICON_FOOD] Food.[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_PALACE_GARDEN}[ENDCOLOR] built in [ICON_CAPITAL] Capital (+5 [ICON_FOOD] Food, +2 [ICON_TOURISM] Tourism to all Granaries, Caravansaries, and Gardens, +25% [ICON_GREAT_PEOPLE] Great Person Rate, -2 [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization, 1 [ICON_GREAT_WORK] Great Work of Writing slot; 1 [ICON_VP_WRITER] Writer Slot).'
WHERE Tag = 'TXT_KEY_POLICY_MONARCHY_HELP';

UPDATE Language_en_US
SET Text = 'Meaning ''Something that is given generously'', feasts and festivals are a universal feature of centralized culture. Much of the authority of the state, from early history to today, lies in the ability to provide for its citizens. A ruler that cannot secure enough food for their people to eat will not remain a ruler for long.'
WHERE Tag = 'TXT_KEY_POLICY_MONARCHY_TEXT';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Splendor[ENDCOLOR][NEWLINE][ICON_BULLET]Expending a [ICON_GREAT_PEOPLE] Great Person grants 50 [ICON_CULTURE] Culture, scaling with Era.[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_PALACE_TREASURY}[ENDCOLOR] built in [ICON_CAPITAL] Capital (+4 [ICON_GOLD] Gold, +2 [ICON_CULTURE] Culture to all Monuments, Aqueducts, and Baths; 1 [ICON_VP_MERCHANT] Merchant Slot).'
WHERE Tag = 'TXT_KEY_POLICY_LANDED_ELITE_HELP';

UPDATE Language_en_US
SET Text = 'Mysticism'
WHERE Tag = 'TXT_KEY_POLICY_LEGALISM';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Mysticism[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness from National Wonders.[NEWLINE][ICON_BULLET]+25% [ICON_PRODUCTION] Production toward National Wonders.[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_PALACE_ASTROLOGER}[ENDCOLOR] built in [ICON_CAPITAL] Capital (+3 [ICON_RESEARCH] Science, +1 [ICON_RESEARCH] Science to all Smokehouses and Herbalists; 1 [ICON_VP_SCIENTIST] Scientist Slot).'
WHERE Tag = 'TXT_KEY_POLICY_LEGALISM_HELP';

UPDATE Language_en_US
SET Text = 'Mysiticism comes from the Ancient Greek word meaning ''to conceal'' and referred to the liturgical and spiritual aspect of early Christianity. Today the word encompasses all range of extraordinary or supernatural experience. Control over, and participation in, such events lent much credibility to rulers throughout history, in both religious and political domains.'
WHERE Tag = 'TXT_KEY_POLICY_LEGALISM_TEXT';

INSERT OR REPLACE INTO Language_en_US 
	(Tag, Text)
Values 
	('TXT_KEY_BUILDING_PALACE_TREASURY', 'Treasury Hoard'),
	('TXT_KEY_BUILDING_PALACE_TREASURY_HELP', 'All {TXT_KEY_BUILDING_MONUMENT_DESC}s, {TXT_KEY_BUILDING_AQUEDUCT}s, and {TXT_KEY_BUILDING_BATH}s gain +2 [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Can only be constructed via the [COLOR_MAGENTA]{TXT_KEY_POLICY_LANDED_ELITE}[ENDCOLOR] Policy.'),
	('TXT_KEY_BUILDING_CAPITAL_ENGINEER_HELP', 'All {TXT_KEY_BUILDING_GROVE}s and {TXT_KEY_BUILDING_FORGE}s gain +1 [ICON_PRODUCTION] Production. +20% [ICON_SILVER_FIST] Military Supply from Population.[NEWLINE][NEWLINE]Can only be constructed via the [COLOR_MAGENTA]{TXT_KEY_POLICY_ARISTOCRACY}[ENDCOLOR] Policy.'),	
	('TXT_KEY_BUILDING_PALACE_GARDEN_HELP', 'All Granaries, Caravansaries, and {TXT_KEY_BUILDING_GARDEN}s gain +2 [ICON_TOURISM] Tourism. +25% [ICON_GREAT_PEOPLE] Great Person Rate in the City. Contains 1 slot for a [ICON_VP_GREATWRITING] Great Work of Writing.[NEWLINE][NEWLINE]2 Specialists in this City no longer produce [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.[NEWLINE][NEWLINE]Can only be constructed via the [COLOR_MAGENTA]{TXT_KEY_POLICY_MONARCHY}[ENDCOLOR] Policy.'),
	('TXT_KEY_BUILDING_PALACE_COURT_CHAPEL_HELP', 'All {TXT_KEY_BUILDING_SHRINE}s and {TXT_KEY_BUILDING_STONE_WORKS} gain +2 [ICON_CULTURE_LOCAL] Border Growth Points. Contains 1 slot for a [ICON_GREAT_WORK] Great Work of Art or Artifact.[NEWLINE][NEWLINE]Can only be constructed via the [COLOR_MAGENTA]{TXT_KEY_POLICY_OLIGARCHY}[ENDCOLOR] Policy.'),
	('TXT_KEY_BUILDING_PALACE_ASTROLOGER', 'Astrologer''s Sanctum'),
	('TXT_KEY_BUILDING_PALACE_ASTROLOGER_HELP', 'All {TXT_KEY_BUILDING_LODGE}s and {TXT_KEY_BUILDING_HERBALIST}s gain +1 [ICON_RESEARCH] Science.[NEWLINE][NEWLINE]Can only be constructed via the [COLOR_MAGENTA]{TXT_KEY_POLICY_LEGALISM}[ENDCOLOR] Policy.');

UPDATE Buildings SET
IconAtlas = 'CORP2_ATLAS',
PortraitIndex = 7
WHERE Type = 'BUILDING_PALACE_TREASURY';

