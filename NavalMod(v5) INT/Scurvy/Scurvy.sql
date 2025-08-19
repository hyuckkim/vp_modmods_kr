----------------------------- SCURVY ----------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PROMOTION_SCURVY_IMMUNITY', 'Seamanship'),
('TXT_KEY_PROMOTION_SCURVY_IMMUNITY_HELP', 'Immunity to Attrition from Ocean Tiles.');

UPDATE Language_en_US
SET Text = 'May Takes Damage in Ocean Tiles If Ends Turn Outside Friendly Territory.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCURVY_HELP';
--------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PROMOTION_FA_SEA_ACADEMY', 'Naval Academy'),
('TXT_KEY_PROMOTION_FA_SEA_ACADEMY_HELP', '+50% Experience gained from combat.[NEWLINE][COLOR_NEGATIVE_TEXT]Lost on upgrade.[ENDCOLOR]');
---------------------------NAVIGATION_SCHOOL-----------------------------------------------
UPDATE Language_en_US
SET Text = 'Removes scurvy from all naval units built by empire. +10% [ICON_SILVER_FIST] Military Supply from Population.
City must be built on the coast.'
WHERE Tag = 'TXT_KEY_NEWWORLD_SCENARIO_BUILDING_NAVIGATION_SCHOOL_HELP';

UPDATE Language_en_US
SET Text = 'Build the Navigation School national wonder to ensure that all naval units will not suffer from the Scurvy promotion.'
WHERE Tag = 'TXT_KEY_NEWWORLD_SCENARIO_BUILDING_NAVIGATION_SCHOOL_STRATEGY';
---------------------------MILITATY_PORT-----------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES
    ('TXT_KEY_PROMOTION_COAST_GUARD_2', 'Patrol II'),
    ('TXT_KEY_PROMOTION_COAST_GUARD_2_HELP', '+10% [ICON_STRENGTH] Combat Strength when attacking and +5 HP when Healing [COLOR_POSITIVE_TEXT]Inside of Friendly Territory[ENDCOLOR].');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_MILITATY_PORT', 'Naval Base'),
('TXT_KEY_BUILDING_MILITATY_PORT_HELP', '+10% City''s [ICON_RANGE_STRENGTH] Ranged Strike Damage. +20% [ICON_PRODUCTION] Production when construct and +15 XP when building Naval Capital, Naval Ranged and Naval Raider Units. +1 [ICON_WAR] Military Supply.'),
('TXT_KEY_BUILDING_MILITATY_PORT_STRATEGY', 'The Naval Base is a building which improves defense and naval production alson increases Military Units supplied by this City''s by 1.'),
('TXT_KEY_BUILDING_MILITATY_PORT_PEDIA', 'A Naval Base is a military base, where warships and naval ships are docked when they have no mission at sea or need to restock. Ships may also undergo repairs. Some naval bases are temporary homes to aircraft that usually stay on ships but are undergoing maintenance while the ship is in port.');
-------------- Seaport
UPDATE Language_en_US
SET Text = '+1 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold from all Coast and Ocean tiles. +2 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Sea Resources worked by this City.[NEWLINE][NEWLINE]Forms an [ICON_INDUSTRIAL_CONNECTED] Industrial City Connection with other Cities via water if they also have Seaports.[NEWLINE][NEWLINE]Can only be constructed in a Coastal City.'
WHERE Tag = 'TXT_KEY_BUILDING_SEAPORT_HELP';

UPDATE Language_en_US
SET Text = 'The Seaport is an Industrial-era building, requiring a Harbor. It increases the [ICON_PRODUCTION] Production and [ICON_GOLD] Gold output of water tiles and allows for Industrial City Connections over Water (see Concepts for more details).'
WHERE Tag = 'TXT_KEY_BUILDING_SEAPORT_STRATEGY';