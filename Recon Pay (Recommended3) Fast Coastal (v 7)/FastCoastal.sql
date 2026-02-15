INSERT INTO Features
        (Type,					Description,				Civilopedia,						ArtDefineTag,	Movement,	PortraitIndex,		IconAtlas)
VALUES	('FEATURE_COASTAL',		'TXT_KEY_FEATURE_COASTAL',	'TXT_KEY_FEATURE_COASTAL_PEDIA',	NULL,			1,			8,					'TERRAIN_ATLAS'),
		('FEATURE_COASTAL_2',	'TXT_KEY_FEATURE_COASTAL',	'TXT_KEY_FEATURE_COASTAL_PEDIA',	NULL,			2,			8,					'TERRAIN_ATLAS');

INSERT INTO UnitPromotions_Features
        (PromotionType,							FeatureType,			DoubleMove)
VALUES	('PROMOTION_WOODLAND_TRAILBLAZER_3',	'FEATURE_COASTAL',		1),
		('PROMOTION_WOODLAND_TRAILBLAZER_3',	'FEATURE_COASTAL_2',	1);

INSERT INTO Language_en_US
        (Tag,													Text)
VALUES	('TXT_KEY_FEATURE_COASTAL',								'Coastal'),
        ('TXT_KEY_FEATURE_COASTAL_PEDIA',						'Coastal hexes are clear (no forest, jungle, marsh) hexes directly adjacent to water. They provide movement bonuses to some units.');

UPDATE UnitPromotions
SET EnemyRoute = 0
WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_3';

UPDATE UnitPromotions
SET EnemyRoute = 1
WHERE Type = 'PROMOTION_SCOUTING_1';

UPDATE Language_en_US
SET Text = REPLACE (Text, ', and use Enemy Roads/Railroads', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Can and use Enemy Roads/Railroads.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Can use Enemy Roads/Railroads.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = Text||' Double [ICON_MOVES] Movement in clear plots adjacent to [COLOR_CITY_BLUE]Lakes/Coast/Ocean[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = Text||' Can use Enemy Roads/Railroads.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_1_HELP';
/*
UPDATE Language_en_US
SET Text = REPLACE (Text, '[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE UnitPromotions	SET IgnoreZOC = 1 WHERE Type = 'PROMOTION_SCOUTING_2';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_2_HELP';
*/
INSERT INTO UnitPromotions_Features
			(PromotionType,	FeatureType,			IgnoreTerrainCostFrom) 
	SELECT	Type,			'FEATURE_COASTAL_2',	1	FROM UnitPromotions
	WHERE (Type='PROMOTION_PATHFINDER' or Type='PROMOTION_PATHFINDER_2' or Type='PROMOTION_SCOUT');

UPDATE UnitPromotions	SET MovesChange = 0 WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_1';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Movement and ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Movement.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE UnitPromotions	SET MovesChange = 0 WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_2';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Movement and ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Movement.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE UnitPromotions	SET MovesChange = 0 WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_3';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Movement and ', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Movement.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';