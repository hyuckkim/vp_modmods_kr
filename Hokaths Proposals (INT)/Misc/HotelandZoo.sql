-- 동물원
UPDATE Language_ko_KR
SET Text = '완료 시 [ICON_RESEARCH] 과학 +500을 줍니다. 이 도시가 운영하는 야영지에서 [ICON_CULTURE] 문화 +1을 얻습니다. 근처 정글과 숲 타일은 [ICON_CULTURE] 문화와 [ICON_TOURISM] 관광이 +1 증가합니다.[NEWLINE][NEWLINE][ICON_CULTURE] 무료로 인한 [ICON_HAPPINESS_3] 불행이 -1 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_HELP';

UPDATE Language_ko_KR
SET Text = '모든 도시에 동물원을 대량으로 건설하면 과학이 급격히 증가해 더 진보된 기술을 습득할 수 있습니다. 동물원은 또한 관광 타일의 초기 원천 중 하나입니다. 문명이 울창한 숲으로 뒤덮여 있거나 야영지 사치 자원이 많을 경우 이를 해제하는 것이 훨씬 더 중요합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_STRATEGY';

UPDATE Language_ko_KR
SET Text = '완료 시 [ICON_RESEARCH] 과학 +500을 줍니다. 근처 정글, 숲, 야영지, 목장에서 [ICON_TOURISM] 관광과 [ICON_CULTURE] 문화가 +1 증가합니다.[NEWLINE][NEWLINE]이 도시에서 [COLOR_POSITIVE_TEXT]공공 사업 프로젝트[ENDCOLOR]가 완료될 때마다 "[COLOR_POSITIVE_TEXT]국왕 경축일[ENDCOLOR]"을 시행합니다. "[COLOR_POSITIVE_TEXT]국왕 경축일[ENDCOLOR]"이 시작될 때마다 [ICON_CULTURE] 문화, [ICON_PEACE] 신앙, [ICON_GOLD] 골드를 100씩 얻습니다. (시대에 따라 보정)[NEWLINE][NEWLINE] [ICON_CULTURE] 무료로 인한 [ICON_HAPPINESS_3] 불행이 -1 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_SPAIN_BULLRING_HELP';

UPDATE Language_ko_KR
SET Text = '투우장은 동물원보다 저렴하고 일찍 입장할 수 있는 스페인의 독특한 건물입니다. 동물원이 야영지에 주는 보너스 외에도, 투우장은 목장에 보너스를 줍니다. 추가 산출량을 얻으려면 자원을 연결하거나 공공 사업을 건설하여 "국왕 경축일"을 많이 만드는 데 집중하세요.'
WHERE Tag = 'TXT_KEY_BUILDING_SPAIN_BULLRING_STRATEGY';

-- 호텔
UPDATE Language_ko_KR
SET Text = '도시는 눈이 내리고 작업 가능한 타일 내에 있는 모든 산에 대해 [ICON_GOLD] 골드와 [ICON_TOURISM] 관광이 +1 증가합니다. 이 도시에서 작업 중인 오아시스의 [ICON_TOURISM] 관광이 +5 증가합니다.[NEWLINE][NEWLINE][ICON_WONDER] 세계 불가사의와 타일에서 얻은 [ICON_CULTURE] 문화의 33%가 도시의 [ICON_TOURISM] 관광 산출량에 추가됩니다. 걸작으로 인한 [ICON_TOURISM] 관광 산출량이 25% 증가합니다.[NEWLINE][NEWLINE]여기에서 시작하여 다른 문명을 대상으로 하는 [ICON_CARAVAN]/[ICON_CARGO_SHIP] 교역로를 완성하면 [COLOR_POSITIVE_TEXT]역사적 이벤트[ENDCOLOR]가 발생(하거나 기존 이벤트가 강화)됩니다.'
WHERE Tag = 'TXT_KEY_BUILDING_HOTEL_HELP';

UPDATE Language_ko_KR
SET Text = '완성되면 이 도시에 이미 건설된 건물과 불가사의 8개마다 [ICON_GOLD] 골드와 [ICON_CULTURE] 문화를 얻습니다. 매 시대마다 [ICON_GOLD] 골드와 [ICON_CULTURE] 문화가 +1 증가합니다. 도시는 눈이 내리고 작업 가능한 타일 내에 있는 모든 산에 대해 [ICON_GOLD] 골드와 [ICON_TOURISM] 관광이 +1 증가합니다. 이 도시에서 생산되는 오아시스의 [ICON_TOURISM] 관광이 +5 증가합니다.[NEWLINE][NEWLINE]이 도시에서 [ICON_INVEST] 골드를 사용하여 유닛을 구매하거나 건물에 투자할 경우, 비용의 10%가 [ICON_TOURISM] 관광으로 전환됩니다.[NEWLINE][NEWLINE][ICON_WONDER] 세계 불가사의와 타일에서 얻은 [ICON_CULTURE] 문화의 50%가 도시의 [ICON_TOURISM] 관광 산출량에 추가됩니다. 걸작으로 인한 [ICON_TOURISM] 관광 산출량이 +25% 증가합니다.[NEWLINE][NEWLINE]여기에서 시작하여 다른 문명을 대상으로 하는 [ICON_CARAVAN]/[ICON_CARGO_SHIP] 교역로를 완료하면 [COLOR_POSITIVE_TEXT]역사적 이벤트[ENDCOLOR]가 발생(하거나 기존 이벤트가 강화)됩니다.'
WHERE Tag = 'TXT_KEY_BUILDING_MOROCCO_RIAD_HELP';