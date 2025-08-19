----------------------------------------------------
-- Earlier Pikeman
----------------------------------------------------
UPDATE Language_ko_KR
SET Text = 'The {TXT_KEY_UNIT_DANISH_BERSERKER} is the Danish unique unit, replacing the {TXT_KEY_UNIT_PIKEMAN}. It can cross rivers and attack while embarked with no penalty, and has a [ICON_STRENGTH] Combat Strength bonus against wounded units. It is also faster, allowing it to catch up to wounded units to deal the final strike.'
WHERE Tag = 'TXT_KEY_CIV5_DENMARK_BERSERKER_STRATEGY';

----------------------------------------------------
-- Altitude Training nerf
----------------------------------------------------
UPDATE Language_ko_KR
SET Text = '+10% [ICON_STRENGTH] Combat Strength when defending in or attacking a Unit in [COLOR_POSITIVE_TEXT]Hill[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_ALTITUDE_TRAINING_HELP';

----------------------------------------------------
-- Good recon promotions
----------------------------------------------------
UPDATE Language_ko_KR
SET Text = '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]Double [ICON_MOVES] Movement in [COLOR_POSITIVE_TEXT]Forest[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Jungle[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_ko_KR
SET Text = '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]Double [ICON_MOVES] Movement in [COLOR_POSITIVE_TEXT]Desert[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Snow[ENDCOLOR].[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_ko_KR
SET Text = '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]Can Embark, cross Mountains, and use Enemy Roads/Railroads.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = 'Eliminate combat penalties for attacking from the sea or over a river.[NEWLINE]Embarking and Disembarking cost only 1 [ICON_MOVES] Movement.'
WHERE Tag = 'TXT_KEY_PROMOTION_FROGMAN_HELP';

UPDATE Language_ko_KR
SET Text = '+1 [ICON_VP_VISION] Sight and Embarked Sight.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_2_HELP';

UPDATE Language_ko_KR
SET Text = '+1 [ICON_MOVES] Movement and Embarked Movement.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_3_HELP';