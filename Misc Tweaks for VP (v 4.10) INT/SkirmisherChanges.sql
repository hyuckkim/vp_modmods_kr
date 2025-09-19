------------------------------
-- 몽골 변경
------------------------------
UPDATE Language_ko_KR
SET Text = '승선한 원거리 유닛은 [ICON_MOVES] 이동력이 +1 증가하고 [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_ENVELOPMENT}[ENDCOLOR] 승급을 얻습니다. [ICON_CITY_STATE] 도시 국가를 괴롭히면서 얻는 [ICON_GOLD] 골드의 20%에 해당하는 모든 산출량을 얻습니다.'
WHERE Tag = 'TXT_KEY_TRAIT_TERROR';

UPDATE Language_ko_KR
SET Text = '[ICON_MOVES] 이동력이 +1 증가합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_MONGOL_TERROR_HELP';

------------------------------
-- 스커미셔 라인 변경
------------------------------
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_SKIRMISHER_XP_PENALTY', '스커미셔 독트린'),
	('TXT_KEY_PROMOTION_SKIRMISHER_XP_PENALTY_HELP', '[ICON_WAR] 공격력이 +1 증가합니다.[NEWLINE][COLOR_POSITIVE_TEXT]원거리 공격[ENDCOLOR]을 방어할 때 [ICON_STRENGTH] 전투력이 +50% 증가합니다.');