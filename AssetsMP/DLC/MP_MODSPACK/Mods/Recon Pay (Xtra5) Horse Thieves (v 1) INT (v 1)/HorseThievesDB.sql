INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_HORSE_THIEVES', '말 도둑');

INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_HORSE_THIEVES_HELP', '유닛은 [COLOR_YIELD_FOOD] 말이나 아군 기마 유닛[ENDCOLOR]에 인접해 있을 경우 [ICON_MOVES] 이동력 +1을 획득할 수 있으며, [COLOR_RED]적의 말[ENDCOLOR]을 약탈/공격할 경우 +1 이동력을 획득할 수 있습니다.');

INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_HORSE_THEFT', '말 훔치기');

INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_HORSE_THEFT_HELP', '유닛이 말을 획득: [ICON_MOVES] 이동력이 +1 증가합니다. 해당 유닛이 전투, 약탈 또는 승선하면 손실됩니다.');

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