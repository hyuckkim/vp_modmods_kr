INSERT INTO UnitPromotions_Terrains
        (PromotionType,				TerrainType,		DoubleMove)
VALUES	('PROMOTION_SURVIVALISM_3',	'TERRAIN_COAST',	1);

UPDATE UnitPromotions	SET AllowsEmbarkation = 0, EmbarkFlatCost = 0 WHERE Type = 'PROMOTION_SURVIVALISM_3';

UPDATE Language_en_US
SET Text = Text||' Double [ICON_MOVES] Movement in [COLOR_CYAN]Coast[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_3_HELP';

UPDATE UnitPromotions	SET AllowsEmbarkation = 1, EmbarkFlatCost = 1 WHERE Type = 'PROMOTION_SCOUTING_1';

UPDATE Language_en_US
SET Text = Text||' [COLOR_CYAN]Embarking[ENDCOLOR] costs 1 [ICON_MOVES] Move.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_1_HELP';

UPDATE UnitPromotions	SET EmbarkFlatCost = 0, ExtraNavalMovement = 1 WHERE Type = 'PROMOTION_FROGMAN';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]+1 [ICON_MOVES] Embarked Movement.'
WHERE Tag = 'TXT_KEY_PROMOTION_FROGMAN_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Embarking and ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_FROGMAN_HELP';

UPDATE UnitPromotions	SET ExtraNavalMovement = 0 WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_1';

UPDATE Language_en_US
SET Text = REPLACE (Text, ' and Embarked Movement', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Embarked Movement.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE UnitPromotions	SET ExtraNavalMovement = 0 WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_2';

UPDATE Language_en_US
SET Text = REPLACE (Text, ' and Embarked Movement', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Embarked Movement.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE UnitPromotions	SET AllowsEmbarkation = 0, ExtraNavalMovement = 0 WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_3';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Embark and ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Embark, ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, ' and Embarked Movement', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Embarked Movement.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';