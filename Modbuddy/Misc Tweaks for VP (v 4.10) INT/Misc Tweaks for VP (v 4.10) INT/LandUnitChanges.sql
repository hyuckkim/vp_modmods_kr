----------------------------------------------------
-- 더 일찍 파이크맨
----------------------------------------------------
UPDATE Language_ko_KR
SET Text = '{TXT_KEY_UNIT_DANISH_BERSERKER}는 {TXT_KEY_UNIT_PIKEMAN}을 대체하는 덴마크의 고유 유닛입니다. 강을 건너고 승선한 채로 공격할 때 아무런 페널티가 없으며, 부상당한 부대에 대한 [ICON_STRENGTH] 전투력 보너스를 받습니다. 또한 속도가 더 빠르기 때문에 부상당한 부대를 따라잡아 최후의 공격을 가할 수 있습니다.'
WHERE Tag = 'TXT_KEY_CIV5_DENMARK_BERSERKER_STRATEGY';

----------------------------------------------------
-- 고도 훈련 약화
----------------------------------------------------
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]언덕[ENDCOLOR]에 있는 유닛을 방어하거나 공격할 때 [ICON_STRENGTH] 전투력이 +10% 증가합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_ALTITUDE_TRAINING_HELP';

----------------------------------------------------
-- 좋은 정찰 승급
----------------------------------------------------
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]아군 영토 밖[ENDCOLOR]에서 [ICON_STRENGTH] 전투력이 +10% 증가합니다.[NEWLINE][COLOR_POSITIVE_TEXT]숲[ENDCOLOR]과 [COLOR_POSITIVE_TEXT]정글[ENDCOLOR]에서 [ICON_MOVES] 이동력이 2배가 됩니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]아군 영토 밖[ENDCOLOR]에서 [ICON_STRENGTH] 전투력이 +10% 증가합니다.[NEWLINE][COLOR_POSITIVE_TEXT]사막[ENDCOLOR]과 [COLOR_POSITIVE_TEXT]눈[ENDCOLOR]에서 [ICON_MOVES] 이동력이 2배가 됩니다.[NEWLINE][COLOR_POSITIVE_TEXT]통제 구역(ZOC)[ENDCOLOR]을 무시합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]아군 영토 밖[ENDCOLOR]에서 [ICON_STRENGTH] 전투력이 +10% 증가합니다.[NEWLINE]승선할 수 있고, 산을 넘을 수 있으며, 적의 도로/철도를 이용할 수 있습니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = '바다나 강을 건너 공격할 경우 전투 페널티를 제거합니다.[NEWLINE]승선과 하선에 [ICON_MOVES] 이동력을 1 소모합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_FROGMAN_HELP';

UPDATE Language_ko_KR
SET Text = '[ICON_VP_VISION] 시야와 승선 후 시야가 +1 증가합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_2_HELP';

UPDATE Language_ko_KR
SET Text = '[ICON_MOVES] 이동력과 승선 후 이동력이 +1 증가합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_3_HELP';