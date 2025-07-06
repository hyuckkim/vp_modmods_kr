UPDATE Language_ko_KR
SET Text = REPLACE (Text, '+25% [ICON_STRENGTH] Combat Strength when defending.[NEWLINE]+5 HP when Healing [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].', '+10% [ICON_STRENGTH] Defence in [COLOR_POSITIVE_TEXT]Open[ENDCOLOR] terrain.')
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_1_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '+25% [ICON_STRENGTH] Combat Strength when defending.[NEWLINE]+5 HP when Healing [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].', '+10% [ICON_STRENGTH] Defense against [COLOR_POSITIVE_TEXT]Ranged[ENDCOLOR] Attacks. +10% [ICON_STRENGTH] Combat Strength within 3 plots of a [COLOR_POSITIVE_TEXT]Friendly City[ENDCOLOR].')
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_2_HELP';

UPDATE Language_ko_KR
SET Text = '+1 [ICON_VP_VISION] Sight.[NEWLINE]+10% [ICON_STRENGTH] Combat Strength if not adjacent to any friendly unit. '||Text
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '+1 [ICON_VP_VISION] Sight and Embarked Sight.[NEWLINE]', ' +10% [ICON_WAR] Attack Strength in [COLOR_POSITIVE_TEXT]Forest[ENDCOLOR], [COLOR_POSITIVE_TEXT]Jungle[ENDCOLOR], and [COLOR_POSITIVE_TEXT]Hill[ENDCOLOR]. ')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_ko_KR
SET Text = '+10% [ICON_STRENGTH] Combat Strength from [COLOR_POSITIVE_TEXT]Rough terrain[ENDCOLOR]. -10% Damage from Cities. '||Text
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '+20% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]', '+1 [ICON_VP_VISION] Sight.[NEWLINE]+10% [ICON_STRENGTH] Combat Strength per [COLOR_POSITIVE_TEXT]adjacent[ENDCOLOR] recon. Double Heal in [COLOR_POSITIVE_TEXT]Forest, Jungle, Marsh, Oasis[ENDCOLOR].')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, ' Embark, cross Mountains,', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, 'Can Embark, cross Mountains.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, 'Can Embark and cross Mountains.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, 'Can cross Mountains.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, ' cross Mountains,', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, 'Can Embark.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, ' Embark,', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '+1 [ICON_VP_VISION] Sight and Embarked Sight.', '+10% [ICON_WAR] Attack Strength against units under half HP. Can Embark and cross Mountains.')
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_1_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '[NEWLINE][COLOR_POSITIVE_TEXT]통제 구역(ZOC)[ENDCOLOR]을 무시합니다.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_1_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '[NEWLINE][COLOR_POSITIVE_TEXT]통제 구역(ZOC)[ENDCOLOR]을 무시합니다.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_2_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '[NEWLINE][COLOR_POSITIVE_TEXT]통제 구역(ZOC)[ENDCOLOR]을 무시합니다.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '[NEWLINE][COLOR_POSITIVE_TEXT]통제 구역(ZOC)[ENDCOLOR]을 무시합니다.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '[NEWLINE][COLOR_POSITIVE_TEXT]통제 구역(ZOC)[ENDCOLOR]을 무시합니다.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '[NEWLINE][COLOR_POSITIVE_TEXT]통제 구역(ZOC)[ENDCOLOR]을 무시합니다.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = Text||' +10% [ICON_WAR] Attack Strength against wounded units.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_2_HELP';