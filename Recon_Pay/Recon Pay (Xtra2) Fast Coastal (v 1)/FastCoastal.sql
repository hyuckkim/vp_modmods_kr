INSERT INTO Features
        (Type,					Description,				Civilopedia,						ArtDefineTag,	Movement,	PortraitIndex,		IconAtlas)
VALUES	('FEATURE_COASTAL',		'TXT_KEY_FEATURE_COASTAL',	'TXT_KEY_FEATURE_COASTAL_PEDIA',	NULL,			1,			8,					'TERRAIN_ATLAS'),
		('FEATURE_COASTAL_2',	'TXT_KEY_FEATURE_COASTAL',	'TXT_KEY_FEATURE_COASTAL_PEDIA',	NULL,			2,			8,					'TERRAIN_ATLAS');

INSERT INTO UnitPromotions_Features
        (PromotionType,							FeatureType,			DoubleMove)
VALUES	('PROMOTION_WOODLAND_TRAILBLAZER_3',	'FEATURE_COASTAL',		1),
		('PROMOTION_WOODLAND_TRAILBLAZER_3',	'FEATURE_COASTAL_2',	1);

INSERT INTO Language_ko_KR
        (Tag,													Text)
VALUES	('TXT_KEY_FEATURE_COASTAL',								'해안'),
        ('TXT_KEY_FEATURE_COASTAL_PEDIA',						'해안은 물 타일에 인접하며 다른 장애물 (숲, 정글, 습지)이 없는 타일입니다. 일부 유닛에 이동력 보너스를 제공합니다.');

UPDATE UnitPromotions
SET EnemyRoute = 0
WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_3';

UPDATE UnitPromotions
SET EnemyRoute = 1
WHERE Type = 'PROMOTION_SURVIVALISM_2';

UPDATE Language_ko_KR
SET Text = Text||' (적 도로 이용 보너스는 제거됨)[NEWLINE][COLOR_CITY_BLUE]호수/해안/해양[ENDCOLOR] 타일에 인접한 타일로 이동 시 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]두 배[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = Text||'  적 도로 이용 가능'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_2_HELP';
