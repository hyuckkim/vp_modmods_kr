INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_HORSE_THIEVES', 'Horse Thieves');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_HORSE_THIEVES_HELP', 'Unit can acquire +1 [ICON_MOVES] Movement adjacent to [COLOR_YIELD_FOOD]horses or friendly mounted units[ENDCOLOR], or pillaging/attacking [COLOR_RED]enemy horses[ENDCOLOR].');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_HORSE_THEFT', 'Horse Theft');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_HORSE_THEFT_HELP', 'Unit acquired horses: +1 [ICON_MOVES] Movement. Lost if the unit engages in combat, pillages or embarks.');

UPDATE UnitPromotions	SET MovesChange = 0 WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_1';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Movement and ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Movement.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE UnitPromotions	SET MovesChange = 0 WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_2';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Movement and ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Movement.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE UnitPromotions	SET MovesChange = 0 WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_3';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Movement and ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Movement.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_ENDED';
