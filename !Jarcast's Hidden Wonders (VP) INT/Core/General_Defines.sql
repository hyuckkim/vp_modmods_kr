--======================================================================================================================================--
-- DEFINES
--======================================================================================================================================--
UPDATE Language_ko_KR
SET Text = '소유한 세계 불가사의로 인해 요구되는 추가 [ICON_PRODUCTION] 생산력: [COLOR_NEGATIVE_TEXT]{1_Num}%[ENDCOLOR]
[NEWLINE][ICON_PRODUCTION] 생산력 요구 증가 요인:
[NEWLINE][ICON_BULLET] 같은 시대의 불가사의: [COLOR_NEGATIVE_TEXT]50%[ENDCOLOR]
[NEWLINE][ICON_BULLET] 이전 시대의 불가사의: [COLOR_NEGATIVE_TEXT]30%[ENDCOLOR]
[NEWLINE][ICON_BULLET] 두 시대 이전의 불가사의: [COLOR_NEGATIVE_TEXT]20%[ENDCOLOR]
[NEWLINE][ICON_BULLET] 3개 시대 또는 그 이상 과거 시대의 불가사의: [COLOR_NEGATIVE_TEXT]10%[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_WONDER_COST_INCREASE_METRIC';