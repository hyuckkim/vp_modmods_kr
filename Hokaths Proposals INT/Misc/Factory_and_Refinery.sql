-- text
UPDATE Language_ko_KR
SET Text = '제련소는 총 5개 도시에서만 건설할 수 있는 현대 시대 건물입니다. 제련소는 모든 공장의 생산을 촉진하고 철, 석탄, 석유 자원을 각각 1개씩 생산해내지만, 유지 관리 비용이 높습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_REFINERY_STRATEGY';

UPDATE Language_ko_KR
SET Text = '문명 내의 소유한 모든 공장의 [ICON_PRODUCTION] 생산력이 +3 증가합니다. [ICON_RES_IRON] 철, [ICON_RES_COAL] 석탄, [ICON_RES_OIL] 석유 1개를 생산합니다.[NEWLINE][NEWLINE]최대 5개 도시에 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_REFINERY_HELP';