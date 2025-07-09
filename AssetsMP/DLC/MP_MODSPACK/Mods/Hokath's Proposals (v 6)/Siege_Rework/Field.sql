UPDATE UnitPromotions SET
SplashDamage = 5,
OpenRangedAttackMod = 0
WHERE RankList = 'FIELD';

UPDATE Language_en_US SET
Text = Replace(Text, '+10% [ICON_RANGE_STRENGTH] Ranged Combat Strength when attacking Units in [COLOR_POSITIVE_TEXT]Open Terrain[ENDCOLOR].', 'Deal [COLOR_POSITIVE_TEXT]5 Damage[ENDCOLOR] to all Enemy Units [COLOR_POSITIVE_TEXT]adjacent to[ENDCOLOR] the target Unit (within [ICON_RANGE_STRENGTH] Range) when attacking.[NEWLINE]This Damage ignores damage reduction, but does not affect Units in [COLOR_NEGATIVE_TEXT]Cities[ENDCOLOR] and [COLOR_NEGATIVE_TEXT]Fortifications[ENDCOLOR].')
WHERE Tag IN ('TXT_KEY_PROMOTION_FIELD_1_HELP', 'TXT_KEY_PROMOTION_FIELD_2_HELP', 'TXT_KEY_PROMOTION_FIELD_3_HELP');

-- so no more access to splash for siege, naval only
UPDATE UnitPromotions SET 
PromotionPrereqOr1 = 'PROMOTION_TARGETING_3',
PromotionPrereqOr2 = NULL
WHERE Type = 'PROMOTION_SPLASH_1';

