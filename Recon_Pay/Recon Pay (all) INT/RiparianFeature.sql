INSERT INTO Features
        (Type,					Description,				Civilopedia,						ArtDefineTag,	Movement,	PortraitIndex,		IconAtlas)
VALUES	('FEATURE_RIPARIAN',	'TXT_KEY_FEATURE_RIPARIAN',	'TXT_KEY_FEATURE_RIPARIAN_PEDIA',	NULL,			1,			13,					'TERRAIN_ATLAS'),
		('FEATURE_RIPARIAN_2',	'TXT_KEY_FEATURE_RIPARIAN',	'TXT_KEY_FEATURE_RIPARIAN_PEDIA',	NULL,			2,			13,					'TERRAIN_ATLAS');

INSERT INTO UnitPromotions_Features
        (PromotionType,							FeatureType,			DoubleMove)
VALUES	('PROMOTION_WOODLAND_TRAILBLAZER_2',	'FEATURE_RIPARIAN',		1),
		('PROMOTION_WOODLAND_TRAILBLAZER_2',	'FEATURE_RIPARIAN_2',	1);

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_CITY_BLUE]강[ENDCOLOR]에 인접한 타일로 이동 시 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]두 배[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

INSERT INTO Language_ko_KR
        (Tag,													Text)
VALUES	('TXT_KEY_FEATURE_RIPARIAN',							'강변'),
        ('TXT_KEY_FEATURE_RIPARIAN_PEDIA',						'강변은 강에 인접하며 다른 장애물 (숲, 정글, 습지)이 없는 내륙 타일입니다. 일부 유닛에 이동력 보너스를 제공합니다.');