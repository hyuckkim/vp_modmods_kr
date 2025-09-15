UPDATE Language_ko_KR
SET Text = '도시에서 작업하는 정글 타일 2개 또는 숲 타일 2개마다 [ICON_PEACE] 신앙, [ICON_CULTURE] 문화, ICON_RESEARCH] 과학이 +1 증가합니다. 시장에서 [ICON_FOOD] 식량과 [ICON_PEACE] 신앙이 +2 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_SACRED_PATH';

-- god king
UPDATE Language_ko_KR
SET Text = Replace(Text, '[ICON_PEACE] 신앙, ', '')
WHERE Tag = 'TXT_KEY_BELIEF_GOD_KING';