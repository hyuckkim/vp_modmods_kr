-- 텍스트 수정
UPDATE Language_ko_KR SET
Text = '[ICON_RAZING] 약탈 시 경험치 5를 얻습니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUT_XP_PILLAGE_HELP';

-- trailblazer line combat oriented
UPDATE Language_ko_KR SET
Text = '[COLOR_POSITIVE_TEXT]아군 영토 밖[ENDCOLOR]에서 [ICON_STRENGTH] 전투력이 10% 증가합니다.[NEWLINE]숲과 정글에서 [ICON_STRENGTH] 공격력이 +25% 증가합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_ko_KR SET
Text = '[COLOR_POSITIVE_TEXT]아군 영토 밖[ENDCOLOR]에서 [ICON_STRENGTH] 전투력이 10% 증가합니다.[NEWLINE]사막과 툰드라에서 [ICON_STRENGTH] 공격력이 +20% 증가합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_ko_KR SET
Text = '[ICON_MOVES] 이동력이 +1 증가합니다.[NEWLINE]공격 후 이동할 수 있습니다.[NEWLINE][COLOR_POSITIVE_TEXT]통제 구역(ZOC)[ENDCOLOR]을 무시합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

-- now niche promos
-- 승급과 유닛의 이름이 같으면 문명백과에 문제가 생깁니다!
UPDATE Language_ko_KR SET
Text = '전술적 후퇴'
WHERE Tag = 'TXT_KEY_PROMOTION_COMMANDO';

-- but Klepht keeps it
UPDATE Language_ko_KR SET
Text = '산업 시대 탐험 유닛입니다. 공격 시 추가적인 힘을 얻습니다. 도로가 아닌 시설을 약탈하여 경험치를 얻습니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_COMMANDO_CBP';

UPDATE Language_ko_KR SET
Text = '턴당 한 번, 이 유닛 뒤에 빈 타일이 있다면 [COLOR_POSITIVE_TEXT]근접 공격을 회피[ENDCOLOR]합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_COMMANDO_HELP';

-- balance altitude training and make it available
-- in new promotions there is an upgrade to this
UPDATE Language_ko_KR SET
Text = '[COLOR_POSITIVE_TEXT]언덕[ENDCOLOR]에서 [ICON_STRENGTH] 공격력이 +20% 증가합니다.[NEWLINE][COLOR_POSITIVE_TEXT]산[ENDCOLOR]을 건널 수 있습니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_ALTITUDE_TRAINING_HELP';

-- make frogman the upgrade to amphibious
UPDATE Language_ko_KR SET
Text = '[ICON_MOVES] 승선 이동력이 +1 증가합니다.[NEWLINE]승선과 하선에 [ICON_MOVES] 이동력을 1 소모합니다.[NEWLINE]승선 시 [ICON_STRENGTH] 방어력이 +50% 증가합니다.'
WHERE Tag = 'TXT_KEY_PROMOTION_FROGMAN_HELP';