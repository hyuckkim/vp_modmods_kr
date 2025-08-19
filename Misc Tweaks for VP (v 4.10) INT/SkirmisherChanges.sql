------------------------------
-- Mongolia Changes
------------------------------
UPDATE Language_ko_KR
SET Text = 'Mounted Ranged Units gain +1 [ICON_MOVES] Moves and the [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_ENVELOPMENT}[ENDCOLOR] Promotion. Gain All Yields equal to 20% of the [ICON_GOLD] Gold from bullying [ICON_CITY_STATE] City-States.'
WHERE Tag = 'TXT_KEY_TRAIT_TERROR';

UPDATE Language_ko_KR
SET Text = '+1 [ICON_MOVES] Moves.'
WHERE Tag = 'TXT_KEY_PROMOTION_MONGOL_TERROR_HELP';

------------------------------
-- SKIRMISHER LINE CHANGES
------------------------------
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_SKIRMISHER_XP_PENALTY', 'Skirmisher Doctrine'),
	('TXT_KEY_PROMOTION_SKIRMISHER_XP_PENALTY_HELP', '+1 [ICON_WAR] Attack.[NEWLINE]+50% [ICON_STRENGTH] Combat Strength when defending against [COLOR_POSITIVE_TEXT]Ranged Attacks[ENDCOLOR].');