--------------------------------------------------------------------------------------------------
--Text
-------------------------------------------------------------------------------------------------- 
INSERT INTO Language_ko_KR
		(Tag,											Text)
VALUES	('TXT_KEY_IMPROVEMENT_YOUNG_FOREST',			'관목지'),
		('TXT_KEY_CIV5_IMPROVEMENT_YOUNG_FOREST_HELP',	'초기 천이 관목지는 무손상 산림과 남아 있는 성숙한 나무 근처에 토종 관목, 묘목, 토종 초본 식물이 섞인 곳입니다. 관목지 식생의 높이와 밀도는 다양하고 불규칙합니다. 생태학자들은 산림 천이의 단계를 다음과 같이 4단계로 봅니다: (i) 입목 형성 시작, (ii) 줄기 배제, (iii) 하층 재형성, 그리고 (iv) 정상 상태, 혹은 성숙한 숲입니다. 관목지는 산림 발달의 후기 단계에 아직 도달하지 않은 어린 숲입니다.[NEWLINE][NEWLINE]방어력 보너스가 10% 증가하고, 10턴 후 숲으로 성장합니다.'),
		('TXT_KEY_IMPROVEMENT_TROPICAL_VEG',			'열대 관목지'),
		('TXT_KEY_CIV5_IMPROVEMENT_TROPICAL_VEG_HELP',	'초기-천이 열대 관목지는 일년 내내 따뜻한 기후에서 발생하며 일반적으로 다른 위도에 비해 생물학적으로 더 다양합니다. 일년 내내 풍부한 비가 내리는 곳의 열대 식물은 종종 나무가 무성하고 얽힌 식물이 자라는 경우가 많습니다. 생태학자들은 산림 천이 단계를 다음과 같이 4단계로 봅니다: (i) 입목 형성 시작, (ii) 줄기 배제, (iii) 하층 재형성, 그리고 (iv) 정상 상태입니다.따뜻하고 습한 환경의 열대 관목지에서는 수목 군락 시작과 하층 재형성 단계가 강화되는 경향이 있습니다.[NEWLINE][NEWLINE]방어력 보너스가 10% 증가하고, 10턴 후 정글로 성장합니다.'),
		('TXT_KEY_CIV5_IMPROVEMENT_GROW_JUNGLE',		'[COLOR_CITY_GREEN]정상 상태 정글[ENDCOLOR]'),
		('TXT_KEY_CIV5_IMPROVEMENT_GROW_FOREST',		'[COLOR_CITY_GREEN]정상 상태 숲[ENDCOLOR]'),
		('TXT_KEY_CIV5_SUCCESSIONAL_VEGETATION',		'[COLOR_CITY_GREEN]연속적인 초목[ENDCOLOR]'),
		('TXT_KEY_CIV5_IMPROVEMENT_WILDFIRE',			'[COLOR_WARNING_TEXT]산불[ENDCOLOR]'),
		('TXT_KEY_CIV5_BURN_FOREST',					'[COLOR_WARNING_TEXT]산림전용[ENDCOLOR]'),
		('TXT_KEY_CIV5_FIRE_PILLAGE',					'[ICON_RAZING]'),
		('TXT_KEY_IMPROVEMENT_WILDFIRE',				'산불'),
		('TXT_KEY_CIV5_IMPROVEMENT_WILDFIRE_HELP',		'통제 불능의 화재로 넓은 지역의 초목이 소실됩니다.'),
		('TXT_KEY_PROMOTION_WILDFIRE',					'산불'),
		('TXT_KEY_PROMOTION_WILDFIRE_HELP',				'시야, 회복, 방어 및 측면 지원이 [COLOR_NEGATIVE_TEXT]차단됨[ENDCOLOR]'),
		('TXT_KEY_PROMOTION_SMOKE',						'연기'),
		('TXT_KEY_PROMOTION_SMOKE_HELP',				'시야 [COLOR_NEGATIVE_TEXT]차단됨[ENDCOLOR]'),
		('TXT_KEY_FEATURE_SMOKE',						'제한된 시야'),
		('TXT_KEY_IMPROVEMENT_SMOKE',					'연기'),
		('TXT_KEY_CIV5_IMPROVEMENT_SMOKE_HELP',			'통제 불능의 화재는 연기를 발생시킵니다.'),
		('TXT_KEY_CIV5_IMPROVEMENT_SMOKE_TEXT',			'산불은 숲과 정글 타일에서 자연스럽게 연기를 발생시킵니다.'),
		('TXT_KEY_IMPROVEMENT_BURNT',					'화재 반흔'),
		('TXT_KEY_CIV5_IMPROVEMENT_BURNT_HELP',			'산불로 인해 초목이 타버린 후 눈에 띄게 검게 변한 땅 표면입니다.'),
		('TXT_KEY_CIV5_IMPROVEMENT_BURNT_TEXT',			'진화된 산불은 숲과 정글 타일에 타버린 초목을 남깁니다.'),
		('TXT_KEY_BUILD_BURNT',							'산불 진화'),
		('TXT_KEY_BUILD_BURNT_HELP',					'화재의 흉터가 남을 것입니다. 유닛의 체력이 1로 감소합니다. 일시적으로 [ICON_RESEARCH] 과학이 +1 증가합니다.');

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_UNIT_ACTIONS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_PLOT';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_CITY_FOUNDING';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'IMPROVEMENTS_EXTENSIONS';