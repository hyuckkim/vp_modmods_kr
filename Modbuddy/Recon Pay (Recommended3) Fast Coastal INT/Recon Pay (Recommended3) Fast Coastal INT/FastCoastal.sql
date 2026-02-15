INSERT INTO Language_ko_KR
        (Tag,													Text)
VALUES	('TXT_KEY_FEATURE_COASTAL',								'연안의'),
        ('TXT_KEY_FEATURE_COASTAL_PEDIA',						'연안 육각 타일은 (물에 바로 인접한, 숲, 정글, 습지가 없는) 깨끗한 육각 타일입니다. 일부 유닛에 이동 보너스를 제공합니다.');

UPDATE Language_ko_KR
SET Text = REPLACE (Text, ', 그리고 적의 도로/철도를 이용', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '적의 도로/철도를 이용할 수 있습니다.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '적의 도로/철도를 이용할 수 있습니다.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = Text||' [COLOR_CITY_BLUE]호수/연안/대양[ENDCOLOR]에 인접한 깨끗한 구역에서 연속 [ICON_MOVES] 이동이 가능합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = Text||' Can use Enemy Roads/Railroads.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_1_HELP';
/*
UPDATE Language_ko_KR
SET Text = REPLACE (Text, '[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_2_HELP';
*/
UPDATE Language_ko_KR
SET Text = REPLACE (Text, 'Movement and ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Movement.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, 'Movement and ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Movement.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, 'Movement and ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Movement.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';