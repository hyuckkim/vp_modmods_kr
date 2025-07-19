-- Public School
UPDATE Language_ko_KR
SET Text = '도시에 거주하는 [ICON_CITIZEN] 시민 4명당 [ICON_RESEARCH] 과학이 +1 증가합니다.[NEWLINE][NEWLINE][ICON_RESEARCH] 문맹으로 인한 [ICON_HAPPINESS_3] 불행이 -1 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_PUBLIC_SCHOOL_HELP';

-- Broadcast Tower
UPDATE Language_ko_KR
SET Text = '도시에 거주하는 [ICON_CITIZEN] 시민 4명마다 [ICON_CULTURE] 문화와 [ICON_TOURISM] 관광이 +1 증가합니다.도시의 [ICON_GREAT_WORK] 걸작으로 인해 [ICON_TOURISM] 관광이 +2 증가합니다.[NEWLINE][NEWLINE][ICON_CULTURE] 무료로 인한 [ICON_HAPPINESS_3] 불행이 -1 감소합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]가 있으면 [ICON_GOLD] 골드가 +10 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_BROADCAST_TOWER_HELP';