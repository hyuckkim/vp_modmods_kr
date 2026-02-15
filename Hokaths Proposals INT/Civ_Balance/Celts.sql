---------------------------------------
-- 마나난을 위한 실제 해상 전력
---------------------------------------
UPDATE Language_ko_KR SET
Text = '도시가 [COLOR_POSITIVE]연안[ENDCOLOR]에 있을 경우 [ICON_FOOD] 식량 +3, [ICON_PRODUCTION] 생산 +3, [ICON_GOLD] 골드 +3 증가합니다. 물 타일에서 [ICON_PRODUCTION] 생산 +1, 어선에서 [ICON_CULTURE] 문화 +1, [ICON_GREAT_ADMIRAL] 위대한 제독 점수가 +1 증가합니다. 자격을 갖춘 유닛은 [COLOR_POSITIVE_TEXT]수륙양용[ENDCOLOR] 승급을 받습니다. 연회장에서 [ICON_GREAT_ADMIRAL] 위대한 제독 점수가 +2 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_MANANNAN';

---------------------------------------
-- 오그마, 키 보너스는 브랜에 비하면 좀 엉터리야
---------------------------------------
UPDATE Language_ko_KR SET
Text = '도서관과 궁전에서 [ICON_RESEARCH]과학 +2, [ICON_CULTURE] 문화가 +2 증가합니다. [ICON_GREAT_WORK] 걸작, [ICON_VP_SCIENTIST] 과학자, [ICON_VP_WRITER] 작가로부터 [ICON_FOOD] 음식 +1, [ICON_RESEARCH] 과학 +1, [ICON_CULTURE] 문화가 +1 증가합니다. 수도/성지에 [ICON_GREAT_SCIENTIST] 위대한 과학자 점수 +3, [ICON_GREAT_WRITER] 위대한 작가 점수가 +3 추가됩니다. 연회장에서 [ICON_RESEARCH] 과학이 +3 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_OGMA';

---------------------------------------
-- 시설이 지어지지 않은 특징이 있는 지형의 케르눈노스 아이디어
---------------------------------------
UPDATE Language_ko_KR SET
Text = '[COLOR_NEGATIVE_TEXT]시설이 없는[ENDCOLOR] 모든 특징 지형에서 [ICON_FOOD] 식량 +1, [ICON_PRODUCTION] 생산 +1 증가합니다. 숲과 정글에서 [ICON_GOLD] 골드가 +1 증가합니다. 야영지와 재배지에서 [ICON_RESEARCH] 과학 +1, [ICON_CULTURE] 문화 +1 증가합니다. 연회장에서 [ICON_CULTURE] 문화 +2 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_CERNUNNOS';

---------------------------------------
-- 리아논과 자연경관 
---------------------------------------
UPDATE Language_ko_KR SET
Text = '도시에 [ICON_CITIZEN] 시민이 4명 이상이면 [COLOR_POSITIVE_TEXT]모든 산출량[ENDCOLOR]이 +1 증가합니다. 자연경관에서 얻는 [COLOR_POSITIVE_TEXT]모든 산출량[ENDCOLOR]이 +3 증가합니다. 개척자 유닛이 [COLOR_POSITIVE_TEXT]리아논의 길[ENDCOLOR] 승급을 받습니다. 연회장에서 [COLOR_POSITIVE_TEXT]모든 산출량[ENDCOLOR]이 +1 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_RHIANNON';

INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_RHIANNON', '리아논의 길'),
	('TXT_KEY_PROMOTION_RHIANNON_HELP', '[ICON_MOVES] 이동력이 +2 증가합니다.[NEWLINE] 지형 비용, 통제 구역(ZOC), 경쟁자의 국경을 무시합니다.[NEWLINE]적의 경로를 이용할 수 있습니다.');

---------------------------------------
-- revert bran dagda healing swap c.f. pdan thread
---------------------------------------
UPDATE Language_ko_KR SET
Text = '[ICON_FOOD] 식량 성장률이 +25% 증가하고 [ICON_HAPPINESS_1] 행복도가 +1 증가합니다.시민이 태어날 때마다 [ICON_PRODUCTION] 생산력, [ICON_GOLD] 골드, [ICON_CULTURE] 문화가 +12 증가합니다. (시대에 따라 보정) 자신이 소유한 영토에 있는 유닛은 턴당 [COLOR_POSITIVE_TEXT]체력을 +10[ENDCOLOR]만큼 회복합니다. 연회장에서 [ICON_FOOD] 식량 +5 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_DAGDA';

---------------------------------------
-- and buff bran so it has something for a non-capital bonus
---------------------------------------
UPDATE Language_ko_KR SET
Text = '성벽과 궁전에서 [ICON_PRODUCTION] 생산력, [ICON_GOLD] 골드, [ICON_RESEARCH] 과학, [ICON_CULTURE] 문화가 +1 증가합니다. 자신이 소유한 도시에 있는 [ICON_RELIGION_PANTHEON] 신전의 추종자 5명당 [ICON_CAPITAL] 수도/성지의 [ICON_PRODUCTION] 생산력, [ICON_GOLD] 골드, [ICON_RESEARCH] 과학, [ICON_CULTURE] 문화가 +4 증가합니다. 도시 [ICON_RANGE_STRENGTH] 원거리 전투력이 +25% 증가합니다. 연회장에서 [ICON_HAPPINESS_1] 행복이 +2 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_BRAN';

---------------------------------------
-- Cailleach, the Hag
---------------------------------------
UPDATE Language_ko_KR SET
Text = '도시에서 작업하는 툰드라 타일 2개마다 [ICON_FOOD] 식량, [ICON_PRODUCTION] 생산, [ICON_GOLD] 골드가 +1 증가합니다. 자원이 있는 눈 타일에서 [ICON_FOOD] 식량, [ICON_PRODUCTION] 생산, [ICON_GOLD] 골드가 +2 증가합니다. 채석장과 광산에서 생산되는 자원의 [ICON_PRODUCTION] 생산력과 [ICON_CULTURE] 문화가 +1 증가합니다. 연회장에서 [ICON_PRODUCTION] 생산이 +4 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_CAILLEACH';

--UPDATE Language_ko_KR SET
--Text = 'Cailleach, the Hag'
--WHERE Tag = 'TXT_KEY_BELIEF_CAILLEACH_SHORT';

---------------------------------------
-- 에포나, 위대한 암말
---------------------------------------
UPDATE Language_ko_KR SET
Text = '목장에서 [ICON_CULTURE_LOCAL] 국경 성장이 +3 증가합니다. 마구간에서 [ICON_HAPPINESS_1] 행복이 +1만큼 증가하고 [ICON_PEACE] 신앙을 사용해 구매할 수 있습니다. 도시의 국경이 자연스럽게 확장될 때마다 [ICON_FOOD] 식량, [ICON_PRODUCTION] 생산,  [ICON_RESEARCH] 과학, [ICON_CULTURE] 문화가 +8씩 증가합니다. (시대에 따라 보정) 연회장에서 [ICON_CULTURE_LOCAL] 국경 성장이 +5 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_EPONA';

---------------------------------------
-- 루그: 이집트는 다른 방향으로 가고 있습니다. 이것을 강화할 수 있습니다.
---------------------------------------
UPDATE Language_ko_KR SET
Text = '도시에 전문가가 있는 경우 [ICON_FOOD] 식량, [ICON_GOLD] 골드, [ICON_RESEARCH] 과학, [ICON_CULTURE] 문화, [ICON_TOURISM] 관광이 +2 증가합니다. [ICON_WONDER] 불가사의에서 [ICON_PRODUCTION] 생산력이 +25% 증가합니다. [ICON_WONDER] 세계 불가사의에서 [ICON_CULTURE] 문화와 [ICON_TOURISM] 관광이 +2 증가합니다. 연회장에서 [ICON_TOURISM] 관광이 +5 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_LUGH';

---------------------------------------
-- 모리건, 오타가 있고 마지막 효과 추가됨
---------------------------------------
UPDATE Language_ko_KR SET
Text = '전략 자원으로부터 [ICON_GREAT_GENERAL] 위대한 장군 점수 +1을 얻습니다. 적 유닛을 처치하면 해당 유닛의 [ICON_STRENGTH] 공격력의 200%에 해당하는 [ICON_GOLD] 골드, [ICON_CULTURE] 문화, [ICON_GOLDEN_AGE] 황금기 점수를 얻고, [COLOR_POSITIVE_TEXT]시설물을 약탈[ENDCOLOR]하면 각 산출량을 20씩 얻습니다. (시대에 따라 보정) 연회장에서 [ICON_GREAT_GENERAL] 위대한 장군 점수가 +2 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_MORRIGAN';

---------------------------------------
-- 누아다에는 문화가 없습니다. 테마를 통해 소량 추가
---------------------------------------
UPDATE Language_ko_KR SET
Text = '"[COLOR_POSITIVE_TEXT]국왕 경축일[ENDCOLOR]" 동안 [ICON_GOLD] 골드, [ICON_RESEARCH] 과학, [ICON_CULTURE] 문화가 +10% 증가합니다. 소유하거나 수입한 고유한 사치 자원 하나와 도시와의 [ICON_ARROW_LEFT] 활성화된 [ICON_ARROW_RIGHT] 교역로 하나당 [ICON_CAPITAL] 수도/성지의 [ICON_GOLD] 골드, [ICON_RESEARCH] 과학, [ICON_GOLDEN_AGE] 황금기 점수가 +3 증가합니다. 연회장에서 +5 [ICON_GOLD] 골드가 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_NUADA';

-----------------------------
-- 거인 이드리스와 회색 왕의 혼혈인 그윈
-----------------------------
UPDATE Language_ko_KR SET
Text = '언덕에서 [ICON_STRENGTH] 공격력이 +20% 증가합니다.[NEWLINE]산을 건널 수 있습니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_ALTITUDE_TRAINING_HELP';

INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_GWYN', '도시 주변 3타일 이내에 산 2개가 생길 때마다 [ICON_FOOD] 식량, [ICON_RESEARCH] 과학, [ICON_CULTURE] 문화가 +1 증가합니다. (도시 인구에 따라 제한) 자격을 갖춘 유닛은 [COLOR_POSITIVE_TEXT]Altitude Training[ENDCOLOR] 승급을 받습니다. 적군 유닛이 죽거나 자신이 소유한 유닛이 죽을 때마다 해당 유닛의 [ICON_STRENGTH] 전투력의 200%에 해당하는 [ICON_PEACE] 신앙을 얻습니다. 연회장에서 [ICON_PEACE] 신앙이 +3 증가합니다.'),
	('TXT_KEY_BELIEF_GWYN_SHORT', '그윈, 안개의 군주');

----------------------------------------
-- 올웬은 사막의 태양형 신입니다.
----------------------------------------
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_OLWEN', '범람원이 [COLOR_NEGATIVE_TEXT]없는[ENDCOLOR] 사막 타일에서 [ICON_FOOD] 식량과 [ICON_PRODUCTION] 생산이 +1 증가하고, 도시에서 작업하는 평원 타일 2개 또는 범람원 타일 2개마다 식량과 생산이 +1 증가합니다. 농장에서 [ICON_RESEARCH] 과학과 [ICON_GOLDEN_AGE] 황금기 점수가 +1 증가합니다. [ICON_GOLDEN_AGE] 황금기에는 수도/성지의 [ICON_CULTURE] 문화가 +15% 증가합니다. 연회장에서 [ICON_GOLDEN_AGE] 황금기 점수가 +5 증가합니다.'),
	('TXT_KEY_BELIEF_OLWEN_SHORT', '올웬, 황금 바퀴');

