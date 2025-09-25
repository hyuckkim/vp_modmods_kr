----------------------
-- Windmill
----------------------
UPDATE Language_ko_KR
SET Text = '도시 주변 습지 및 호수 타일의 [ICON_PRODUCTION]생산과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 곡창과 약국에서 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]국내 교역로를 통해 당신 문명의 다른 도시로 [ICON_PRODUCTION]생산을 [ICON_TURNS_REMAINING]제공할 수 있습니다.'
WHERE Tag='TXT_KEY_BUILDING_WINDMILL_HELP'; 

UPDATE Language_ko_KR
SET Text = '풍차는 중세 시대 건물로, 숲·농장·늪지·호수 등 주변 지형에 따라 도시의 [ICON_PRODUCTION] 생산과 [ICON_GOLD] 골드 산출을 높여 줍니다. 또한 도시 내 관련 기반 시설이 갖춰져 있다면 추가 [ICON_FOOD] 식량을 제공합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL_STRATEGY';

----------------------
-- Workshop
----------------------
-- 작업장 (풍차->작업장)
UPDATE Language_ko_KR 
SET Text = '도시 주변 숲 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. 건물을 건설할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다. [ICON_CITIZEN]시민이 증가할 때 현재 [ICON_PRODUCTION]생산 산출량의 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR]를 즉시 제공합니다. [NEWLINE][NEWLINE]이 도시에서 출발하는 국내 [ICON_INTERNATIONAL_TRADE] 교역로의 [ICON_PRODUCTION] 생산이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_STONE] 석재: [ICON_GOLDEN_AGE]황금기 점수 +1, [ICON_PRODUCTION]생산 +1'
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_HELP';

UPDATE Language_ko_KR
SET Text = '작업장은 생산력이 높은 도시의 [ICON_PRODUCTION] 생산을 더욱 끌어올리고, 내부 교역로를 통해 생산력이 약한 도시에 생산을 이전하는 능력을 향상시킵니다. 또한 수로의 성장 보너스를 강화하여 높은 생산과 빠른 성장이 함께할 때 가장 큰 효과를 냅니다. 이는 이제 막 기반을 다지는 소도시부터 풍부한 식량을 갖춘 대도시에 이르기까지 모두에 유용합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_STRATEGY';

----------------------
-- 기업형농장
----------------------
UPDATE Language_ko_KR
SET Text = '농장의 [ICON_PRODUCTION]생산과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가하고, 목장의 [ICON_PRODUCTION]생산과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 매턴 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_GOLD]골드로 전환합니다.[NEWLINE][NEWLINE][ICON_RES_HORSE]말이 [COLOR_NEGATIVE_TEXT]2마리[ENDCOLOR] 필요합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STOCKYARD_HELP'; 



