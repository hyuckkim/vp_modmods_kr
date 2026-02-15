-- Harbor
UPDATE Language_ko_KR
SET Text = Replace(Text, '[ICON_CARGO_SHIP] 해상 교역로 범위 +50% 증가', '[ICON_CARGO_SHIP] 해상 교역로 범위 +25% 증가')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HARBOR');

-- strong compatibility
UPDATE Language_ko_KR
SET Text = '작업 가능한 타일 내에 있는 산 하나당 도시는 [ICON_RESEARCH] 과학 +1을 얻습니다. 도시가 작업하는 산호는 [ICON_RESEARCH] 과학 +2를 얻습니다. [ICON_PEACE] 신앙으로 구매해야 하는 도시 내 모든 건물에서 [ICON_PEACE] 신앙이 +1 증가합니다.[NEWLINE][NEWLINE][ICON_CARGO_SHIP] 해상 교역로의 범위가 25% 증가합니다. 도시 내 항구는 [ICON_RESEARCH] 과학과 [ICON_GOLDEN_AGE] 황금기 점수가 +1 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_HELP';

UPDATE Language_ko_KR
SET Text = '천문대는 [ICON_RESEARCH] 과학 산출량을 늘려줍니다. 특히 산이 많거나 산호에 접근할 수 있는 도시의 경우 더욱 그렇습니다. 또한 해안 도시, 특히 해상 무역로를 운영하는 도시에도 고려해 볼 만합니다. 마지막으로, 당신이 종교 문명을 운영한다면, 별을 바라보는 것이 당신의 신앙을 강화시켜줄 것입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_STRATEGY';