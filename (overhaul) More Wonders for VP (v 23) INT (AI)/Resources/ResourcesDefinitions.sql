--============================================--
-- 텍스트
--============================================--			
INSERT INTO Language_ko_KR 
			(Tag,											Text) 
VALUES		('TXT_KEY_RESOURCE_TERN',						'제비갈매기 알'),
			('TXT_KEY_RESOURCE_TERN_TEXT',					'작성 필요'),
			('TXT_KEY_RESOURCE_TERN_MONOPOLY',				'[ICON_WONDER] 아후 통가리키가 부여합니다. [COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 제국에 [ICON_PEACE] +5%.'),
			('TXT_KEY_RESOURCE_SYLVITE',					'실바이트'),
			('TXT_KEY_RESOURCE_SYLVITE_TEXT',				'작성 필요'),
			('TXT_KEY_RESOURCE_SYLVITE_MONOPOLY',			'달롤이 부여합니다. [COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] [COLOR_WATER_TEXT]폭발성 혼합물[ENDCOLOR]/[COLOR_YIELD_GOLD]공성[ENDCOLOR].'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH',				'열대어'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH_TEXT',			'작성 필요'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH_MONOPOLY',		'그레이트배리어리프(대보초)와 갈라파고스 자연경관에 의해 생성될 수 있습니다.'),
			('TXT_KEY_RESOURCE_TORTOISE',					'거대 거북'),
			('TXT_KEY_RESOURCE_TORTOISE_TEXT',				'작성 필요'),
			('TXT_KEY_RESOURCE_TORTOISE_MONOPOLY',			'갈라파고스에 의해 생성됩니다. [COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] +10% [ICON_GOLDEN_AGE] 황금기 길이.');

UPDATE Language_ko_KR SET Text = Text||'[NEWLINE][NEWLINE]인접한 [ICON_RES_TORTOISE]: [ICON_RESEARCH] 과학 +2.' WHERE Tag = 'TXT_KEY_BUILDING_LABORATORY_HELP';
--=====================================================--
-- 자원
---------------------------------------------------------
-- 제비갈매기 알 - 아후 통가리키 세계 불가사의에 의해 추가됨
-- 실바이트 - 달롤 자연 불가사의에 의해 추가됨
-- 열대어 - 그레이트배리어리프와 갈라파고스 자연 불가사의에 의해 추가됨
-- 거대 거북 - 갈라파고스 자연 불가사의에 의해 추가됨
--=====================================================--
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 								LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_RESOURCE_TERN', 			'Resource', 	'제비갈매기 알'),
			('ART_DEF_RESOURCE_SYLVITE', 		'Resource', 	'실바이트'),
			('ART_DEF_RESOURCE_TROPICAL_FISH', 	'Resource', 	'열대어'),
			('ART_DEF_RESOURCE_TORTOISE', 		'Resource', 	'거대 거북');