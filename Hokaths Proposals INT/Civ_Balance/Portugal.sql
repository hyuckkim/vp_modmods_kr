---------------------------------------------
-- define new promotions
---------------------------------------------
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_PORTUGAL_UA_1', 'Padrões I'),
	('TXT_KEY_PROMOTION_PORTUGAL_UA_1_HELP', 'Gain 1 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture when revealing tiles.[NEWLINE]This value is multiplied by 12 for Natural Wonders, 4 for Ancient Ruins, and 3 for Resources.'),
	('TXT_KEY_PROMOTION_PORTUGAL_UA_2', 'Padrões II'),
	('TXT_KEY_PROMOTION_PORTUGAL_UA_2_HELP', 'Gain 1 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture when revealing tiles.[NEWLINE]This value is multiplied by 12 for Natural Wonders, 4 for Ancient Ruins, and 3 for Resources.'),
	('TXT_KEY_PROMOTION_PORTUGAL_UA_3', 'Padrões III'),
	('TXT_KEY_PROMOTION_PORTUGAL_UA_3_HELP', 'Gain 1 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture when revealing tiles.[NEWLINE]This value is multiplied by 12 for Natural Wonders, 4 for Ancient Ruins, and 3 for Resources.'),
	('TXT_KEY_PROMOTION_MARE_CLAUSUM', 'Mare Clausum'),
	('TXT_KEY_PROMOTION_MARE_CLAUSUM_HELP', 'Friendly Naval Units within 5 tiles gain +25% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].');
--------------------------------------------------------
-- Update the Portugese UA
--------------------------------------------------------
UPDATE Language_ko_KR
SET Text = 'After researching [COLOR_CYAN]Sailing[ENDCOLOR], tiles revealed by Recon or Naval Units grant [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture, scaling with the discovery of [COLOR_CYAN]Compass[ENDCOLOR] and [COLOR_CYAN]Navigation[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_TRAIT_EXTRA_TRADE';

UPDATE Language_ko_KR
SET Text = 'Padrão Real'
WHERE Tag = 'TXT_KEY_TRAIT_EXTRA_TRADE_SHORT';
--------------------------------------------------
-- Update University of Coimbra 
--------------------------------------------------
UPDATE Language_ko_KR SET
Text = Replace(Text, 'Age of Discovery', 'Mare Clausum')
WHERE Tag = 'TXT_KEY_BUILDING_UNIVERSITY_OF_COIMBRA_HELP';

INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_THEMING_BONUS_COIMBRA_HELP', 'To maximize your bonus, make sure the Great Work Slots are filled Works of Writing created by you and from the same Era.'),
	('TXT_KEY_THEMING_BONUS_COIMBRA_1', 'Conimbricenses'),
	('TXT_KEY_THEMING_BONUS_COIMBRA_2', 'Os Lusíadas');

UPDATE Language_ko_KR SET
Text = Replace(Text, '+3 [ICON_RESEARCH] Science when themed.', '+3 [ICON_RESEARCH] Science, [ICON_PEACE] Faith, and [ICON_GREAT_ADMIRAL] Great Admiral Points when themed.')
WHERE Tag = 'TXT_KEY_BUILDING_UNIVERSITY_OF_COIMBRA_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, '+50 [ICON_CULTURE] Culture', '+50 [ICON_CULTURE] Culture and +20 [ICON_GREAT_ADMIRAL] Great Admiral Points')
WHERE Tag = 'TXT_KEY_BUILDING_UNIVERSITY_OF_COIMBRA_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, 'All Universities gain +3 [ICON_GOLD] Gold.', 
	'+1 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture to all Buildings that [COLOR_CYAN]must[ENDCOLOR] be purchased with [ICON_PEACE] Faith.')
WHERE Tag = 'TXT_KEY_BUILDING_UNIVERSITY_OF_COIMBRA_HELP';
----------------------------------------------------------------
-- bandeirantes changes 
----------------------------------------------------------------
-- +25% [ICON_STRENGTH] Combat Strength against Barbarians
UPDATE Language_ko_KR SET
Text = 'Gain 150% of the [ICON_STRENGTH] Strength of defeated [COLOR_POSITIVE_TEXT]Barbarian Units[ENDCOLOR] as [ICON_GOLD] Gold, [ICON_PRODUCTION] Production, and [ICON_CULTURE_LOCAL] Border Growth Points in the Unit''s origin City.[NEWLINE]2 [ICON_INFLUENCE] Influence with the nearest [ICON_CITY_STATE] City-State for every XP earned in combat.' 
WHERE Tag = 'TXT_KEY_PROMOTION_FLAG_BEARER_HELP';