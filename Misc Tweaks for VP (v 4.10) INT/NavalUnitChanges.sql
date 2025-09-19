----------------------------------------------------
-- 집중 포화
----------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_HEAVY_FIRE', '집중 포화'),
	('TXT_KEY_PROMOTION_HEAVY_FIRE_HELP', '[COLOR_POSITIVE_TEXT]해상 근접 유닛[ENDCOLOR]을 공격할 때 [ICON_STRENGTH] 전투력이 +50% 증가합니다.');

----------------------------------------------------
-- 승급
----------------------------------------------------
-- tweak Depth Charges values
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]잠수함 유닛[ENDCOLOR]에 대한 [ICON_STRENGTH] 전투력이 +33% 증가합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_ANTI_SUBMARINE_I_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]잠수함 유닛[ENDCOLOR]에 대한 [ICON_STRENGTH] 전투력이 +66% 증가합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_ANTI_SUBMARINE_II_HELP';