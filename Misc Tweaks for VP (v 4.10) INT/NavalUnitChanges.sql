----------------------------------------------------
-- Heavy Fire
----------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_HEAVY_FIRE', 'Heavy Fire'),
	('TXT_KEY_PROMOTION_HEAVY_FIRE_HELP', '+50% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Naval Melee Units[ENDCOLOR].');

----------------------------------------------------
-- Promotions
----------------------------------------------------
-- tweak Depth Charges values
UPDATE Language_ko_KR
SET Text = '+33% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Submarine Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_ANTI_SUBMARINE_I_HELP';

UPDATE Language_ko_KR
SET Text = '+66% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Submarine Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_ANTI_SUBMARINE_II_HELP';