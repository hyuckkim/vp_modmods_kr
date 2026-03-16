-- 폴리네시아와 쇼숀 교환
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]아군 영토 내[ENDCOLOR]에서 [ICON_STRENGTH] 전투력이 +20% 증가합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_HOMELAND_GUARDIAN_BOOGALOO_HELP';

-- 텍스트
UPDATE Language_ko_KR
SET Text = '승선 시 [ICON_VP_VISION] 시야가 +2 증가하고, 언제든지 승선하여 대양 위로 이동할 수 있습니다. 어선과 산호에서 [ICON_PRODUCTION] 생산력이 +2 증가합니다. 근접 공격 유닛과 화약 유닛이 어선을 건조할 수 있습니다. 소유한 {TXT_KEY_IMPROVEMENT_MOAI} 주변 2타일 이내의 유닛은 [ICON_STRENGTH] 전투력이 +20% 증가합니다. [ICON_HAPPINESS_3] 고립으로 인한 불행이 없습니다.'
WHERE Tag = 'TXT_KEY_TRAIT_WAYFINDING';

UPDATE Language_ko_KR
SET Text = '해안 타일에만 건설할 수 있습니다. 인접한 모아이와 도시마다 [ICON_CULTURE] 문화가 +1 증가합니다. 폴리네시아 영토에 있는 모아이로부터 2타일 이내에 있는 경우, 모든 폴리네시아 부대의 전투력이 [ICON_STRENGTH] +20% 증가합니다.[NEWLINE][NEWLINE]자원 위에 건설할 수 있지만, 자원을 연결할 수는 없습니다.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_MOAI_HELP';

UPDATE Language_ko_KR
SET Text = '인접한 모아이와 도시마다 [ICON_CULTURE] 문화가 +1 증가합니다. 2타일 반경 내에 있는 모든 폴리네시아 유닛의 [ICON_STRENGTH] 전투력이 +20% 증가합니다.[NEWLINE][NEWLINE]해안 타일에만 건설할 수 있습니다. 자원 위에 건설할 수 있지만, 자원을 연결할 수는 없습니다.'
WHERE Tag = 'TXT_KEY_BUILD_MOAI_HELP';

UPDATE Language_ko_KR
SET Text = '[ICON_CULTURE] 문화와 [ICON_CULTURE_LOCAL] 국경의 성장이 증가할 것입니다. 타일의 모든 특징을 제거합니다.[NEWLINE]도시나 다른 [ICON_CULTURE] 모아이와 인접해 있으면 추가 [ICON_CULTURE] 문화를 제공합니다.[NEWLINE]근처 폴리네시아 유닛에게 전투 보너스를 제공합니다.[NEWLINE]이 타일의 [COLOR_NEGATIVE_TEXT]자원(있는 경우)은 연결[ENDCOLOR]되지 않습니다.'
WHERE Tag = 'TXT_KEY_BUILD_MOAI_REC';

UPDATE Language_ko_KR
SET Text = '도시는 획득 시 최대 4개의 추가 타일을 차지하며, 경계가 같은 유형의 땅 타일로 확장되면 인접한 소유자가 없는 타일도 차지합니다. 모든 정찰 유닛은 고대 유적에서 보상을 선택할 수 있습니다. [COLOR_POSITIVE_TEXT]아군 영토 내[ENDCOLOR]에서 지상 전투 유닛의 [ICON_STRENGTH] 전투력이 +20% 증가합니다.'
WHERE Tag = 'TXT_KEY_TRAIT_GREAT_EXPANSE';

UPDATE Language_ko_KR
SET Text = '평평한 땅 타일에만 지을 수 있으며, 다른 진영과 인접할 수 없습니다.[NEWLINE][NEWLINE]이 타일에 주둔한 모든 유닛의 [ICON_STRENGTH] 방어력이 +15% 증가합니다. 이 타일 옆에서 턴을 끝내는 모든 적 유닛은 5의 피해를 입습니다. (피해는 다른 시설과 중복되지 않습니다)'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_ENCAMPMENT_SHOSHONE_HELP';

UPDATE Language_ko_KR
SET Text = '이 타일에 주둔한 모든 유닛의 [ICON_STRENGTH] 방어력이 +15% 증가합니다. 숙영지 옆에서 턴을 마친 적군 유닛은 5의 피해를 입습니다.[NEWLINE][NEWLINE]평평한 땅 타일에만 지을 수 있으며, 다른 숙영지와 인접할 수 없습니다.'
WHERE Tag = 'TXT_KEY_BUILD_ENCAMPMENT_SHOSHONE_HELP';

UPDATE Language_ko_KR
SET Text = '[ICON_FOOD] 식량, [ICON_PRODUCTION] 생산력, [ICON_CULTURE] 문화가 증가합니다. 타일의 모든 특징을 제거합니다.[NEWLINE]타일에 있는 자신의 유닛에 방어 보너스를 제공하고, 인접한 적 유닛에게 약간의 피해를 줍니다.'
WHERE Tag = 'TXT_KEY_BUILD_ENCAMPMENT_SHOSHONE_REC';