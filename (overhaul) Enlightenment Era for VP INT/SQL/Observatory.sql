-- Observatory
-- bit dangerous to up this for e.g. Inca
--UPDATE Building_YieldPerXTerrainTimes100 SET Yield = 100 WHERE BuildingType = 'BUILDING_OBSERVATORY';

UPDATE Language_ko_KR
SET Text = Replace(Text, '[COLOR_POSITIVE_TEXT]천문대[ENDCOLOR]를 건설할 수 있습니다. ([ICON_RESEARCH] 과학 +6, 근처 산에서 [ICON_RESEARCH] 과학 +1, [ICON_SCIENTIST] 과학자 슬롯 2개)', '[ICON_GOLDEN_AGE] 황금기 동안 [ICON_GREAT_PEOPLE] 위인 비율 +25%')
WHERE Tag = 'TXT_KEY_POLICY_SECULARISM_HELP';

-- Harbor
UPDATE Language_ko_KR
SET Text = Replace(Text, '[ICON_CARGO_SHIP] 해상 교역로 거리 +50%', '[ICON_CARGO_SHIP] 해상 교역로 거리 +25%')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HARBOR');

-- strong compatibility
UPDATE Language_ko_KR
SET Text = '도시는 작업 가능한 타일 내의 산 하나당 [ICON_RESEARCH] 과학 +1을 얻습니다. 도시에 의해 작동 중인 산호섬은 [ICON_RESEARCH] 과학 +2를 얻습니다. [ICON_PEACE] 신앙으로 구매해야 하는 도시 내 모든 건물에서 [ICON_PEACE] 신앙이 +1 증가합니다.[NEWLINE][NEWLINE][ICON_CARGO_SHIP] 해상 교역로의 범위가 +25% 증가합니다. 도시 내 항구는 [ICON_RESEARCH] 과학과 [ICON_GOLDEN_AGE] 황금기 점수가 +1 증가합니다.[NEWLINE][NEWLINE][COLOR_CYAN]{TXT_KEY_TECH_EE_REFRACTION}[ENDCOLOR]이 발견되면 [ICON_RESEARCH] 과학이 +4 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_HELP';

UPDATE Language_ko_KR
SET Text = '천문대는 [ICON_RESEARCH] 과학 산출량을 증가시키며, 특히 산이 많거나 산호섬에 접근할 수 있는 도시의 경우 더욱 그렇습니다. 해안 도시, 특히 해상 교역로를 운영하는 도시에도 천문대를 고려해 볼 수 있습니다. 마지막으로, 종교 문명을 운영한다면 천문학을 통해 신앙을 강화할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_STRATEGY';
