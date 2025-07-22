-- Windmill
UPDATE Language_ko_KR
SET Text = '건물을 건설할 때 [ICON_PRODUCTION] 생산력이 +15% 증가합니다. 도시에서 일하는 농장과 습지에서 [ICON_PRODUCTION] 생산력과 [ICON_GOLD] 골드가 +1 증가합니다. 근처 호수에서는 [ICON_PRODUCTION] 생산력과 [ICON_GOLD] 골드가 +2 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL_HELP';

UPDATE Language_ko_KR
SET Text = '풍차는 르네상스 시대의 건물로, 건물을 건설할 때 도시의 [ICON_PRODUCTION] 생산력을 증가시키고 농장, 습지, 호수에서 [ICON_PRODUCTION] 생산력과 [ICON_GOLD] 골드를 생성합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL_STRATEGY';

UPDATE Language_ko_KR
SET Text = '도시에서 경작하는 농장에서는 생산력과 금이 +1 증가하고, 목장에서는 생산력과 금이 +2 증가합니다. 도시에서 생산된 [ICON_FOOD] 식량의 10%는 턴당 [ICON_GOLD] 골드로 간주됩니다.[NEWLINE][NEWLINE][ICON_RES_HORSE] 말 2마리가 필요합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STOCKYARD_HELP';