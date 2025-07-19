-- Garden
UPDATE Language_ko_KR
SET Text = '이 도시에서 [ICON_GREAT_PEOPLE] 위인 생성량이 +25% 증가합니다.[NEWLINE][NEWLINE]이 도시의 전문가 1명이 더 이상 [ICON_URBANIZATION] 도시화로 인한 [ICON_HAPPINESS_3] 불행을 생성하지 않습니다.[NEWLINE][NEWLINE]오아시스: [ICON_GOLD] 골드 +2[NEWLINE]호수: [ICON_TOURISM] 관광 +2[NEWLINE][ICON_RES_CITRUS] 감귤: [ICON_FOOD] 식량 +1, [ICON_GOLD] 골드 +1[NEWLINE][ICON_RES_COCOA] 코코아: [ICON_FOOD] 식량 +1, [ICON_GOLD] 골드 +1[NEWLINE][ICON_RES_CLOVES]정향: [ICON_PEACE] 신앙 +1, [ICON_CULTURE] 문화 +1[NEWLINE][ICON_RES_PEPPER] 후추: [ICON_PEACE] 신앙 +1, [ICON_GOLD] 골드 +1[NEWLINE][ICON_RES_NUTMEG]육두구: [ICON_CULTURE] 문화 +1, [ICON_PRODUCTION] 생산력 +1'
WHERE Tag = 'TXT_KEY_BUILDING_GARDEN_HELP';

UPDATE Language_ko_KR
SET Text = '정원은 도시에서 [ICON_GREAT_PEOPLE] 위인이 생성되는 속도를 25% 증가시키고, 오아시스의 골드 생산량과 호수의 관광 생산량을 증가시킵니다. 정원을 건설하려면 도시에 송수로가 필요합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GARDEN_STRATEGY';