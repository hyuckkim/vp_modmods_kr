----------------------------------------------
-- Topkapi
-- Defensive ones (Walls, Castle, etc.)
----------------------------------------------
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_THEMING_BONUS_EE_TOPKAPI', '왕실 보물 박물관'),
	('TXT_KEY_THEMING_BONUS_EE_TOPKAPI_HELP', '보너스를 극대화하려면 걸작 슬롯에 연속된 시대 그리고 다른 문명의 예술 작품과 유물을 채워 넣으세요.');

----------------------------------
-- and carthage UNW goes to ironworks
----------------------------------
UPDATE Language_ko_KR SET
Text = '모든 해안 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] {TXT_KEY_BUILDING_HARBOR}가 생깁니다. 유입되는 [ICON_ARROW_LEFT] 교역로를 통해 도시는 [ICON_GOLD] 골드 +2를 얻고, 교역로 소유자는 [ICON_GOLD] 골드 +1을 얻습니다. [ICON_INTERNATIONAL_TRADE] 교역로 2개를 [COLOR_POSITIVE_TEXT]추가[ENDCOLOR]로 얻습니다. 모든 항구는 [ICON_PRODUCTION] 생산력이 +3 증가하고, 모든 등대는 [ICON_CULTURE] 문화가 +2 증가합니다.[NEWLINE][NEWLINE][ICON_RES_IRON] 철 2개를 제공합니다. 이 도시에 건물을 건설하면 [ICON_RESEARCH] 과학이 +25 증가합니다. (시대에 따라 조정됨)[NEWLINE][NEWLINE]이 도시의 [ICON_GOLD] 빈곤으로 인해 [ICON_HAPPINESS_3] 불행 -1을 얻습니다.[NEWLINE][NEWLINE][ICON_PRODUCTION] 생산 비용은 소유한 도시의 수에 따라 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_COTHON_HELP';

UPDATE Language_ko_KR SET
Text = '{TXT_KEY_BUILDING_IRONWORKS}를 대체하는 고유한 카르타고식 건물입니다. {TXT_KEY_BUILDING_IRONWORKS}의 보너스에 더해, {TXT_KEY_BUILDING_GREAT_COTHON}은 모든 해안 도시에 무료 {TXT_KEY_BUILDING_HARBOR}, 2 개의 [ICON_INTERNATIONAL_TRADE] 교역로, [ICON_GOLD] 교역로에서 보내고 받는 양쪽이 모두 골드를 획득하고, 건설된 도시의 빈곤 감소 효과를 일정량만큼 획득하며, 문명 내 모든 등대와 항구의 생산력을 향상시킵니다. {TXT_KEY_BUILDING_IRONWORKS}와 달리, {TXT_KEY_BUILDING_GREAT_COTHON}은 [COLOR_CYAN]고전 시대[ENDCOLOR]에 [COLOR_CYAN]{TXT_KEY_TECH_CURRENCY_TITLE}[ENDCOLOR] 발견과 함께 만들 수 있습니다. {TXT_KEY_BUILDING_GREAT_COTHON}은 건설에 필요한 어떠한 조건도 없지만, 해안 도시에서만 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_COTHON_STRATEGY';
