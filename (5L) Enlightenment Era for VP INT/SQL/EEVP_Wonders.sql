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
Text = '모든 [COLOR_YELLOW]해안 도시[ENDCOLOR]에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND][ENDCOLOR] {TXT_KEY_BUILDING_HARBOR}[ENDCOLOR]을 무료로 제공합니다. 추가 [ICON_INTERNATIONAL_TRADE][COLOR_YELLOW]교역로[ENDCOLOR] 2개를 제공합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항만[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가하고, 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]등대[ENDCOLOR]는 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 도시로 향하는 [ICON_ARROW_LEFT] 교역로마다 도시의 [ICON_GOLD] 골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가하고, [ICON_ARROW_RIGHT] 교역로를 개설한 상대 문명의 [ICON_GOLD]골드도 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]을 얻습니다.  [NEWLINE][NEWLINE]건설을 완료하면 [ICON_RESEARCH]과학 [COLOR_POSITIVE_TEXT]25[ENDCOLOR][COLOR:105:105:105:255](시대별 보정)[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE][ICON_GOLD] 빈곤으로 인한 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_IRON] 철 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_COTHON_HELP';

UPDATE Language_ko_KR SET
Text = '{TXT_KEY_BUILDING_IRONWORKS}를 대체하는 카르타고의 고유 건물입니다. {TXT_KEY_BUILDING_IRONWORKS}의 보너스에 더해, {TXT_KEY_BUILDING_GREAT_COTHON}은 모든 해안 도시에 {TXT_KEY_BUILDING_HARBOR}을 제공하고, 추가 [ICON_INTERNATIONAL_TRADE] 교역로 2개를 제공하며, [ICON_GOLD] 교역로에서 보내고 받는 양쪽이 모두 골드를 획득하고, 건설된 도시의 빈곤 감소 효과를 일정량만큼 획득하며, 문명 내 모든 등대와 항구의 생산력을 향상시킵니다. {TXT_KEY_BUILDING_IRONWORKS}와 달리, {TXT_KEY_BUILDING_GREAT_COTHON}은 [COLOR_CYAN]고전 시대[ENDCOLOR]에 [COLOR_CYAN]{TXT_KEY_TECH_CURRENCY_TITLE}[ENDCOLOR] 발견과 함께 만들 수 있습니다. {TXT_KEY_BUILDING_GREAT_COTHON}은 건설에 필요한 어떠한 조건도 없지만, 해안 도시에서만 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_COTHON_STRATEGY';
