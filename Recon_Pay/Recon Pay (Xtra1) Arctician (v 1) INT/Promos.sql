INSERT INTO Language_ko_KR
        (Tag,													Text)
VALUES	('TXT_KEY_PROMOTION_ARCTICIAN',							'극지인'),
        ('TXT_KEY_PROMOTION_ARCTICIAN_HELP',					'[COLOR_WATER_TEXT]빙하[ENDCOLOR] 타일을 건널 수 있습니다. 설원에서 [ICON_STRENGTH] 전투력 보너스 +15%'),
        ('TXT_KEY_PEDIA_PROMOTION_ARCTICIAN',					'Arctician');

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'PROMOTIONS_CROSS_ICE';