UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]도시[ENDCOLOR]를 공격할 때 [ICON_STRENGTH] 전투력이 +100% 증가합니다.[NEWLINE]장애물 너머로 원거리 공격을 수행할 수 있습니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_CITY_SIEGE_HELP';

-- give to hwacha without siege engine, up RCS to compensate
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_HWACHA', '신기전'),
	('TXT_KEY_PROMOTION_HWACHA_HELP', '장애물 너머로 원거리 공격을 수행할 수 있습니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]업그레이드시 없어집니다[ENDCOLOR].');

-- sier morb needs it too
UPDATE Language_ko_KR
SET Text = '장애물 너머로 원거리 공격을 수행할 수 있습니다.[NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_HELP'
AND EXISTS (SELECT * FROM UnitPromotions WHERE Type = 'PROMOTION_UNIT_SIAM_CROACHING_TIGER');

-- make inaccuracy more to compensate
UPDATE Language_ko_KR
SET Text = '[COLOR_NEGATIVE_TEXT]지상 유닛[ENDCOLOR]을 공격할 때 [ICON_STRENGTH] 전투력이 -50% 감소합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_SIEGE_INACCURACY_HELP';