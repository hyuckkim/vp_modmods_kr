-- text correction
UPDATE Language_ko_KR SET
Text = 'Gain 5 XP when [ICON_RAZING] Pillaging.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUT_XP_PILLAGE_HELP';

-- trailblazer line combat oriented
UPDATE Language_ko_KR SET
Text = '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]+25% [ICON_STRENGTH] Attack in Forest and Jungle.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_ko_KR SET
Text = '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]+20% [ICON_STRENGTH] Defense in Desert and Tundra.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_ko_KR SET
Text = '+1 [ICON_MOVES] Movement.[NEWLINE]Can move after attacking.[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

-- now niche promos
-- messes with civilopedia if promo has same name as unit!
UPDATE Language_ko_KR SET
Text = 'Tactical Retreat'
WHERE Tag = 'TXT_KEY_PROMOTION_COMMANDO';

-- but Klepht keeps it
UPDATE Language_ko_KR SET
Text = 'Industrial-era exploration Unit. Has additional strength when Attacking. Gains Experience from pillaging non-road Improvements.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_COMMANDO_CBP';

UPDATE Language_ko_KR SET
Text = '[COLOR_POSITIVE_TEXT]Withdraw from Melee Attack[ENDCOLOR] if there is an open tile behind this Unit, once per turn.'
WHERE Tag = 'TXT_KEY_PROMOTION_COMMANDO_HELP';

-- balance altitude training and make it available
-- in new promotions there is an upgrade to this
UPDATE Language_ko_KR SET
Text = '+20% [ICON_STRENGTH] Attack in [COLOR_POSITIVE_TEXT]Hills[ENDCOLOR].[NEWLINE]Can cross [COLOR_POSITIVE_TEXT]Mountains[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_ALTITUDE_TRAINING_HELP';

-- make frogman the upgrade to amphibious
UPDATE Language_ko_KR SET
Text = '+1 [ICON_MOVES] Embarked Movement.[NEWLINE]Embarking and Disembarking cost only 1 [ICON_MOVES] Movement.[NEWLINE]+50% [ICON_STRENGTH] Defense when Embarked.'
WHERE Tag = 'TXT_KEY_PROMOTION_FROGMAN_HELP';