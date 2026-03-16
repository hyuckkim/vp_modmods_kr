/*
INSERT INTO Features
        (Type,					Description,				Civilopedia,						ArtDefineTag,	Movement,	PortraitIndex,		IconAtlas)
VALUES	('FEATURE_RIPARIAN',	'TXT_KEY_FEATURE_RIPARIAN',	'TXT_KEY_FEATURE_RIPARIAN_PEDIA',	NULL,			1,			13,					'TERRAIN_ATLAS'),
		('FEATURE_RIPARIAN_2',	'TXT_KEY_FEATURE_RIPARIAN',	'TXT_KEY_FEATURE_RIPARIAN_PEDIA',	NULL,			2,			13,					'TERRAIN_ATLAS');

INSERT INTO UnitPromotions_Features
        (PromotionType,							FeatureType,			DoubleMove)
VALUES	('PROMOTION_WOODLAND_TRAILBLAZER_2',	'FEATURE_RIPARIAN',		1),
		('PROMOTION_WOODLAND_TRAILBLAZER_2',	'FEATURE_RIPARIAN_2',	1),
		('PROMOTION_WOODLAND_TRAILBLAZER_2',	'FEATURE_FLOOD_PLAINS',	1);

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]Double [ICON_MOVES] Movement in clear plots adjacent to [COLOR_CITY_BLUE]Rivers[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

INSERT INTO Language_en_US
        (Tag,													Text)
VALUES	('TXT_KEY_FEATURE_RIPARIAN',							'Riparian'),
        ('TXT_KEY_FEATURE_RIPARIAN_PEDIA',						'Riparian hexes are clear (no forest, jungle, marsh) inland hexes directly adjacent to rivers. They provide movement bonuses to some units.');

INSERT INTO UnitPromotions_Features
			(PromotionType,	FeatureType,			IgnoreTerrainCostFrom) 
	SELECT	Type,			'FEATURE_RIPARIAN_2',	1	FROM UnitPromotions
	WHERE (Type='PROMOTION_PATHFINDER' or Type='PROMOTION_PATHFINDER_2' or Type='PROMOTION_SCOUT');
*/

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]Double [ICON_MOVES] Movement adjacent to [COLOR_CITY_BLUE]Rivers[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_2_HELP';

UPDATE UnitPromotions	SET RiverDoubleMove = 1 WHERE Type = 'PROMOTION_SURVIVALISM_2';

UPDATE UnitPromotions	SET River = 0 WHERE Type LIKE 'PROMOTION%TRAILBLAZER_2';

UPDATE Language_en_US
SET Text = REPLACE (Text, '[NEWLINE]Eliminate combat penalties for attacking over a river.[NEWLINE]Crossing a river costs only 1 [ICON_MOVES] Movement.', '')
WHERE Tag LIKE 'TXT_KEY_PROMOTION%TRAILBLAZER_2_HELP';

UPDATE UnitPromotions	SET IgnoreZOC = 0, River = 1 WHERE Type = 'PROMOTION_SURVIVALISM_1';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]Eliminate combat penalties for attacking over a river.[NEWLINE]Crossing a river costs only 1 [ICON_MOVES] Movement.'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_1_HELP';
/*
UPDATE Language_en_US
SET Text = REPLACE (Text, '[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE UnitPromotions	SET IgnoreZOC = 1 WHERE Type = 'PROMOTION_SURVIVALISM_1';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_1_HELP';
*/
UPDATE UnitPromotions	SET MovesChange = 0 WHERE Type LIKE 'PROMOTION%TRAILBLAZER_1';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Movement and ', '')
WHERE Tag LIKE 'TXT_KEY_PROMOTION%TRAILBLAZER_1_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Movement.[NEWLINE]', '')
WHERE Tag LIKE 'TXT_KEY_PROMOTION%TRAILBLAZER_1_HELP';

UPDATE UnitPromotions	SET MovesChange = 0 WHERE Type LIKE 'PROMOTION%TRAILBLAZER_2';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Movement and ', '')
WHERE Tag LIKE 'TXT_KEY_PROMOTION%TRAILBLAZER_2_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Movement.[NEWLINE]', '')
WHERE Tag LIKE 'TXT_KEY_PROMOTION%TRAILBLAZER_2_HELP';

UPDATE UnitPromotions	SET MovesChange = 0 WHERE Type LIKE 'PROMOTION%TRAILBLAZER_3';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Movement and ', '')
WHERE Tag LIKE 'TXT_KEY_PROMOTION%TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_MOVES] Movement.[NEWLINE]', '')
WHERE Tag LIKE 'TXT_KEY_PROMOTION%TRAILBLAZER_3_HELP';

/*
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';
*/