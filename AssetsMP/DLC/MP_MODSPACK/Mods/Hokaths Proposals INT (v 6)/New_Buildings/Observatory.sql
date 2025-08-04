-- Harbor
UPDATE Language_ko_KR
SET Text = Replace(Text, '[ICON_CARGO_SHIP] Sea Trade Routes gain +50% Range', '[ICON_CARGO_SHIP] Sea Trade Routes gain +25% Range')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HARBOR');

-- strong compatibility
UPDATE Language_ko_KR
SET Text = 'City gains +1 [ICON_RESEARCH] Science for every Mountain within the workable tiles. Atolls worked by the City gain +2 [ICON_RESEARCH] Science. +1 [ICON_PEACE] Faith from every Building in the City that must be purchased with [ICON_PEACE] Faith.[NEWLINE][NEWLINE][ICON_CARGO_SHIP] Sea Trade Routes gain +25% Range. Harbors in the City gain +1 [ICON_RESEARCH] Science and [ICON_GOLDEN_AGE] Golden Age Point.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_HELP';

UPDATE Language_ko_KR
SET Text = '천문대는 [ICON_RESEARCH] 과학 산출량을 늘려줍니다. 특히 산이 많거나 산호에 접근할 수 있는 도시의 경우 더욱 그렇습니다. 또한 해안 도시, 특히 해상 무역로를 운영하는 도시에도 고려해 볼 만합니다. 마지막으로, 당신이 종교 문명을 운영한다면, 별을 바라보는 것이 당신의 신앙을 강화시켜줄 것입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_STRATEGY';
