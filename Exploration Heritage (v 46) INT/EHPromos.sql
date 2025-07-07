INSERT INTO Language_ko_KR 
		(Tag,												Text)
VALUES	('TXT_KEY_PROMOTION_EXPLORATION_HERITAGE',			'탐험 유산'),
		('TXT_KEY_PROMOTION_EXPLORATION_HERITAGE_HELP',		'본 [COLOR_PROJECT_TEXT]대학[ENDCOLOR]에서 전수한 지리적 지식은 수도까지의 [ICON_MOVES] 거리의 50%를 [COLOR_XP_BLUE]경험치[ENDCOLOR]로 부여합니다.[NEWLINE][NEWLINE]유닛의 [COLOR_POSITIVE_TEXT]체력은 항상 가득[ENDCOLOR] 차 있어야 하며, [COLOR_POSITIVE_TEXT]정찰 경험치 풀[ENDCOLOR]이 비어 있어서는 안 됩니다.'),
		('TXT_KEY_PEDIA_PROMOTION_EXPLORATION_HERITAGE',	'탐험 유산');

INSERT INTO Language_ko_KR 
		(Tag,								Text)
VALUES	('TXT_KEY_TOPIC_RECONXPPOOL',		'정찰 경험치 풀'),
		('TXT_KEY_RECONXPPOOL_TITLE',		'정찰 경험치 풀'),
		('TXT_KEY_RECONXPPOOL_BODY',		'공수 부대 이전의 정찰 유닛은 발견한 토지 구역의 총 수와 모든 정찰 유닛의 총 경험치의 차이에 따라 경험치를 부여받을 수 있습니다. 발견된 토지 구역의 수가 정찰 유닛 경험치의 합을 초과할 경우, 체력이 가득 차고 탐험 유산 승급을 받은 정찰 유닛은 매 턴 정찰 경험치 풀에서 경험치를 얻습니다.'),
		('TXT_KEY_RECONXPPOOL_ADV_QUEST',	'정찰 경험치 풀이 무엇인가요?');

UPDATE Language_ko_KR
SET Text = Text||' 이 도시에서 훈련받은 공수 부대 이전 정찰 유닛은 [COLOR_POSITIVE_TEXT]탐험 유산[ENDCOLOR] 승급 혜택을 받습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_UNIVERSITY_HELP';