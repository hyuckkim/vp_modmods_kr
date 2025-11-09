--swap the help texts for modded civ to grab
UPDATE Language_ko_KR
SET Text = '도시 내 {TXT_KEY_BUILDING_STABLE}과 약국에서 +2 [ICON_FOOD] 식량 +2를 생산합니다. 이 도시에서 경작하는 숲에서 [ICON_PRODUCTION] 생산력 +1을 생산합니다. 농장, 습지, 호수에서 [ICON_PRODUCTION] 생산력과 [ICON_GOLD] 골드 +1을 생산합니다.[NEWLINE][NEWLINE]이 도시에서 문명 내부의 교역로를 따라 [ICON_PRODUCTION] 생산력을 이동할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_HELP';

UPDATE Language_ko_KR
SET Text = '풍차는 중세 시대의 건물로, 주변 지형(숲, 농장, 습지, 호수)에 따라 도시의 [ICON_PRODUCTION] 생산력과 [ICON_GOLD] 골드 산출량을 늘려줍니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL_STRATEGY';

UPDATE Language_ko_KR
SET Text = '도시에서 경작하는 농장에서 [ICON_PRODUCTION] 생산력과 [ICON_GOLD] 골드 +1, 초원에서 [ICON_PRODUCTION] 생산력과 [ICON_GOLD] 골드 +2를 얻습니다. 도시에서 생산하는 [ICON_FOOD] 식량의 10%가 턴 당 [ICON_GOLD] 골드로 계산됩니다.[NEWLINE][NEWLINE][ICON_RES_HORSE]말 2마리가 필요합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STOCKYARD_HELP';

-- swap the help text
UPDATE Language_ko_KR SET
Text = '이 도시에서 경작하는 숲에서 [ICON_PRODUCTION] 생산력이 +1 증가하고, 도시에 거주하는 [ICON_CITIZEN] 시민 4명 당 [ICON_PRODUCTION] 생산력이 +1 증가합니다. 이 도시의 내부 [ICON_INTERNATIONAL_TRADE] 교역로는 [ICON_PRODUCTION] 생산력 +4를 생성합니다.[NEWLINE][NEWLINE][ICON_RES_STONE] 석재: +1 [ICON_PRODUCTION] 생산, [ICON_GOLDEN_AGE] 황금기 점수 +1[NEWLINE][ICON_RES_MARBLE] 대리석: [ICON_CULTURE] 문화, [ICON_GOLDEN_AGE] 황금기 점수 +1'
WHERE Tag='TXT_KEY_BUILDING_WINDMILL_HELP';

UPDATE Language_ko_KR
SET Text = Replace(Text, '이 도시에서 경작하는 숲에서 [ICON_PRODUCTION] 생산력이 +1 증가하고, 도시에 거주하는 [ICON_CITIZEN] 시민 4명 당 [ICON_PRODUCTION] 생산력이 +1 증가합니다.', '새로운 [ICON_CITIZEN] 시민이 태어난 후, 도시 [ICON_PRODUCTION] 생산력의 25%가 도시의 현재 [ICON_PRODUCTION] 생산력에 추가됩니다. 건물을 건설할 때 [ICON_PRODUCTION] 생산력이 15% 증가합니다.')
WHERE Tag ='TXT_KEY_BUILDING_WINDMILL_HELP';

UPDATE Language_ko_KR
SET Text = '작업장은 강력한 도시의 생산력을 높이고, 내부 교역로를 통해 약한 도시로 생산력을 이전하는 능력을 향상시킵니다. 또한 송수로 성장 보너스도 향상되는데, 이는 높은 생산력과 빠른 성장이 결합될 때 가장 효과적이며, 작은 도시가 시작되는 경우든, 풍부한 식량을 보유한 대규모 도시가 시작되는 경우든 마찬가지입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_STRATEGY';

------------------------------------------------------------
-- 호환성
------------------------------------------------------------
INSERT OR REPLACE INTO Language_ko_KR (Tag, Text)
SELECT 'TXT_KEY_BUILDING_ATLOOH_HELP',
'도시에 있는 [ICON_VP_ARTIST] 예술가 전문가는 [ICON_PRODUCTION] 생산력, [ICON_GOLD] 골드, [ICON_PEACE] 신앙을 +2 생성합니다. [ICON_RES_JAR_DIYOGI] 디요기 사치 자원의 사본 1개를 제공합니다. 도시에 거주하는 [ICON_CITIZEN] 시민 4명당 [ICON_CULTURE] 문화가 +1 증가합니다.[NEWLINE][NEWLINE]'||Text
FROM Language_ko_KR WHERE Tag='TXT_KEY_BUILDING_WORKSHOP_HELP';

UPDATE Language_ko_KR SET Text = REPLACE(Text, '이 도시에서 작업한 숲에서 [ICON_PRODUCTION] 생산 +1', '이 도시에서 작업한 평지 및 사막 타일에서 [ICON_PRODUCTION] 생산력 +1')
WHERE Tag = 'TXT_KEY_BUILDING_ATLOOH_HELP';

UPDATE Language_ko_KR SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_SHEEP] 양: [ICON_GOLD] 골드 +2'
WHERE Tag = 'TXT_KEY_BUILDING_ATLOOH_HELP';
