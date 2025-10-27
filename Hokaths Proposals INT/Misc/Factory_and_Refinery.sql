-- text

UPDATE Language_ko_KR
SET Text = '도시에 거주하는 [ICON_CITIZEN] 시민 4명당 [ICON_PRODUCTION] 생산력이 +1 증가합니다. 도시에서 운영되는 공장은 [ICON_PRODUCTION] 생산력 +2를 얻습니다.[NEWLINE][NEWLINE]이 도시의 전문가 1명이 더 이상 [ICON_URBANIZATION] 도시화로 인한 [ICON_HAPPINESS_3] 불행을 생성하지 않습니다.[NEWLINE][NEWLINE][ICON_RES_COAL] 석탄: [ICON_PRODUCTION] 생산력 +2, [ICON_RESEARCH] 과학 +2[NEWLINE][NEWLINE][ICON_RES_COAL] 석탄 1개가 필요합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_FACTORY_HELP';

UPDATE Language_ko_KR
SET Text = '도시에 있는 [ICON_CITIZEN] 시민 2명마다 [ICON_PRODUCTION] 생산력이 1 증가합니다. 도시에서 운영되는 공장은 [ICON_PRODUCTION] 생산력 +4를 얻습니다.[NEWLINE][NEWLINE]이 도시의 전문가 2명은 더 이상 도시화로 인한 [ICON_HAPPINESS_3] 불행을 생성하지 않습니다.[NEWLINE][NEWLINE]산업 시대나 그 이후에 건물을 완성하면, 건설 비용의 10%를 [ICON_GREAT_ENGINEER] 위대한 기술자를 육성하는 점수로 얻습니다.[NEWLINE][NEWLINE]기술자 전문가에 [ICON_PRODUCTION] 생산력이 +2 증가합니다.[NEWLINE][NEWLINE][ICON_RES_COAL] 석탄: [ICON_PRODUCTION] 생산력 +3'
WHERE Tag = 'TXT_KEY_BUILDING_STEAM_MILL_HELP';

UPDATE Language_ko_KR
SET Text = '제련소는 총 5개 도시에서만 건설할 수 있는 현대 시대 건물입니다. 제련소는 모든 공장의 생산을 촉진하고 철, 석탄, 석유 자원을 각각 1개씩 생산해내지만, 유지 관리 비용이 높습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_COAL_PLANT_STRATEGY';

UPDATE Language_ko_KR
SET Text = '문명 내의 소유한 모든 공장의 [ICON_PRODUCTION] 생산력이 +3 증가합니다. [ICON_RES_IRON] 철, [ICON_RES_COAL] 석탄, [ICON_RES_OIL] 석유 1개를 생산합니다.[NEWLINE][NEWLINE]최대 5개 도시에 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_COAL_PLANT_HELP';
