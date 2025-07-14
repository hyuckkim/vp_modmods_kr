--============================================--
-- DEFINES
--============================================--
UPDATE Language_ko_KR
SET Text = '보유한 세계 불가사의로 인한 추가 [ICON_PRODUCTION] 생산력: [COLOR_NEGATIVE_TEXT]{1_Num}%[ENDCOLOR][NEWLINE][ICON_PRODUCTION] 요구 생산력 증가 요인:[NEWLINE][ICON_BULLET] 같은 시대의 불가사의: [COLOR_NEGATIVE_TEXT]40%[ENDCOLOR][NEWLINE][ICON_BULLET] 이전 시대의 불가사의: [COLOR_NEGATIVE_TEXT]35%[ENDCOLOR][NEWLINE][ICON_BULLET] 2시대 이전의 불가사의: [COLOR_NEGATIVE_TEXT]30%[ENDCOLOR][NEWLINE][ICON_BULLET] 3시대 또는 그 이전 시대의 불가사의는 페널티를 추가하지 않습니다.'
WHERE Tag = 'TXT_KEY_WONDER_COST_INCREASE_METRIC';

-- DUMMY BUILDINGS
-- HolyCity doesn't need one because it is usually 1 city; 2nd religion and 2nd Holy City might allow for 2nd Wonder
--============================================--
INSERT INTO Language_ko_KR 
			(Tag,						Text) 
SELECT		'TXT_KEY_BUILDING_'||WType, WDummy
FROM MWfVPConfig WHERE WActive = 2;				