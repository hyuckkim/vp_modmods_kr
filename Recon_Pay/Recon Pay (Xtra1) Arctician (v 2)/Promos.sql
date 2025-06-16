INSERT INTO Language_en_US
        (Tag,													Text)
VALUES	('TXT_KEY_PROMOTION_ARCTICIAN',							'Arctician'),
        ('TXT_KEY_PROMOTION_ARCTICIAN_HELP',					'Can cross [COLOR_WATER_TEXT]Ice[ENDCOLOR]. +15% [ICON_STRENGTH] Combat Strength in Snow.'),
        ('TXT_KEY_PEDIA_PROMOTION_ARCTICIAN',					'Arctician');

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'PROMOTIONS_CROSS_ICE';