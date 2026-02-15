/*
UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_CITY_BLUE]강[ENDCOLOR]에 인접한 깨끗한 구역에서 [ICON_MOVES] 이동력이 두 배로 증가합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

INSERT INTO Language_ko_KR
        (Tag,													Text)
VALUES	('TXT_KEY_FEATURE_RIPARIAN',							'강가의'),
        ('TXT_KEY_FEATURE_RIPARIAN_PEDIA',						'강가의 육각형 타일은 강에 직접 인접한 깨끗한(숲, 정글, 습지가 없는) 내륙 육각형 타일입니다. 일부 유닛에 이동 보너스를 제공합니다.');
*/

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_CITY_BLUE]강[ENDCOLOR]에 인접한 깨끗한 구역에서 [ICON_MOVES] 이동력이 두 배로 증가합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_2_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '[NEWLINE]강을 건너 공격할 경우 전투 페널티를 제거합니다.[NEWLINE]강을 건너는 데 [ICON_MOVES] 이동력을 1만 소모합니다.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE]강을 건너 공격할 경우 전투 페널티를 제거합니다.[NEWLINE]강을 건너는 데 [ICON_MOVES] 이동력을 1만 소모합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_1_HELP';
/*
UPDATE Language_ko_KR
SET Text = REPLACE (Text, '[NEWLINE][COLOR_POSITIVE_TEXT]통제 구역(ZOC)[ENDCOLOR]을 무시합니다.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_POSITIVE_TEXT]통제 구역(ZOC)[ENDCOLOR]을 무시합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_1_HELP';
*/
UPDATE Language_ko_KR
SET Text = REPLACE (Text, '이동력 그리고 ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '[ICON_MOVES] 이동력이 +1 증가합니다.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '이동력 그리고 ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '[ICON_MOVES] 이동력이 +1 증가합니다.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '이동력 그리고 ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '[ICON_MOVES] 이동력이 +1 증가합니다.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';