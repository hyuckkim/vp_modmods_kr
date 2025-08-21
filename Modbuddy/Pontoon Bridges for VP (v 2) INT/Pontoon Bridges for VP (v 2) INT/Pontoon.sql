UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][NEWLINE][COLOR_CYAN]철도[ENDCOLOR]의 연구가 끝났다면, 근처의 부교를 도로에서 철도로 업그레이드하세요.'
	WHERE Tag = 'TXT_KEY_PROJECT_PUBLIC_WORKS_HELP';

INSERT OR REPLACE INTO LocalizedText
	(Language, Tag, Text)
VALUES
	('ko_KR', 'TXT_KEY_PROMOTION_PONTOON_BRIDGE', '부교 작동'),
	('ko_KR', 'TXT_KEY_PROMOTION_PONTOON_BRIDGE_HELP', '바다나 강을 건너 공격할 때 발생하는 전투 페널티를 제거합니다. 모든 [COLOR_POSITIVE_TEXT]원거리 공격[ENDCOLOR]에 대한 [COLOR_NEGATIVE_TEXT]방어력[ENDCOLOR]이 -10% 감소합니다. [COLOR_POSITIVE_TEXT]도시[ENDCOLOR]에 대한 [COLOR_NEGATIVE_TEXT]전투력[ENDCOLOR]이 -25% 감소합니다.'),
	('ko_KR', 'TXT_KEY_PONTOON_BRIDGE', '부교'),
	('ko_KR', 'TXT_KEY_PONTOON_BRIDGE_HELP', '지상 유닛이 이 해안 타일을 통과할 수 있습니다. 2개 이상의 땅 타일이 인접한 해안 타일에만 건설할 수 있습니다. 2개 또는 3개의 인접한 땅 타일이 있는 타일의 경우, 땅 타일은 인접할 수 없습니다. 부교 건설에 소모된 승선한 노동자에 의해 건설됩니다.[NEWLINE][NEWLINE]산호 위에 건설하거나 특정 기술을 해제하면 다양한 산출량을 얻을 수 있습니다. 이 시설과 도시를 연결할 수 있습니다.'),
	('ko_KR', 'TXT_KEY_PONTOON_BRIDGE_TEXT', '부교(또는 선교, 주교)는 보병, 포병, 기차 등이 좁고 얕은 수역을 빠르게 건널 수 있도록 하는 데 사용됩니다.'),
	('ko_KR', 'TXT_KEY_BUILD_PONTOON_BRIDGE', '[LINK=IMPROVEMENT_PONTOON_BRIDGE]부교[\LINK] 건설'),
	('ko_KR', 'TXT_KEY_BUILD_PONTOON_BRIDGE_REC', '이를 통해 지상 유닛은 사소한 전투 페널티를 받으며 이 육각 타일을 횡단할 수 있습니다.');