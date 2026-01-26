-----------------------------------------
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('PADRE2026_ATLAS',	256, 'Padre2_BuildingAtlas_256.dds', 4, 1),
('PADRE2026_ATLAS',	128, 'Padre2_BuildingAtlas_128.dds', 4, 1),
('PADRE2026_ATLAS',	 80, 'Padre2_BuildingAtlas_80.dds',  4, 1),
('PADRE2026_ATLAS',	 64, 'Padre2_BuildingAtlas_64.dds',  4, 1),
('PADRE2026_ATLAS',	 45, 'Padre2_BuildingAtlas_45.dds',  4, 1);	
-------------------------------------------

INSERT INTO Features 	
		(Type, 						 Description,				Civilopedia,                             ArtDefineTag,	       Rough, Movement, SeeThrough,   Defense,	NoImprovement, PortraitIndex, IconAtlas)
SELECT	'FEATURE_SHOALS', 	'TXT_KEY_FEATURE_SHOALS',	   'TXT_KEY_CIV5_FEATURE_SHOALS_TEXT',	   'ART_DEF_FEATURE_SHOALS',       1,    3,		  0,              0,          0,           2,         'PADRE2026_ATLAS';

INSERT INTO Feature_TerrainBooleans
	(FeatureType, TerrainType)
VALUES
	('FEATURE_SHOALS', 'TERRAIN_COAST');
	
INSERT INTO ArtDefine_Landmarks 
		(Era,			State,						Scale,				ImprovementType,					LayoutHandler,				ResourceType,								Model,						TerrainContour)
VALUES  ('Any',			'Any',						1,			'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_FEATURE_SHOALS',				'Underwater.fxsxml',						1);
	
	
INSERT INTO ArtDefine_LandmarkTypes (Type,										LandmarkType,	FriendlyName) 
VALUES
                             ('ART_DEF_FEATURE_SHOALS',					'Resource',		'Shoals');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset) VALUES ('ART_DEF_FEATURE_SHOALS', 'Feature', 'SV_Atoll.dds');
	
INSERT INTO Feature_YieldChanges
	(FeatureType, YieldType, Yield)
VALUES
	('FEATURE_SHOALS', 'YIELD_FOOD', -1);
	
INSERT INTO	BuildFeatures
(BuildType, FeatureType, PrereqTech, Remove)
VALUES
	('BUILD_TERSANE', 'FEATURE_SHOALS', NULL, 1),
	('BUILD_POLDER_WATER', 'FEATURE_SHOALS', 'TECH_GUILDS', 1),
	('BUILD_KAMPONG', 'FEATURE_SHOALS', 'TECH_OPTICS', 1);
-------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_FEATURE_SHOALS', 'Shoal'),
('TXT_KEY_CIV5_FEATURE_SHOALS_TEXT', 'Shallow coastal waters with submerged rocks or sandbanks, dangerous for navigation and movement.');
-------------------------------------------------------	
	INSERT INTO UnitPromotions_Features
	(PromotionType, FeatureType, ExtraMove, DoubleMove)
VALUES
    ('PROMOTION_DEEP_DRAFT', 'FEATURE_SHOALS', 1, 0),
	('PROMOTION_SHALLOW_DRAFT', 'FEATURE_SHOALS', 0, 1);
	
UPDATE Language_en_US SET
Text = 'Half [ICON_MOVES] Movement in [COLOR_NEGATIVE_TEXT]Ocean[ENDCOLOR].[NEWLINE]Double [ICON_MOVES] Movement in [COLOR_POSITIVE_TEXT]Shoal[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Lost on Upgrade.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_SHALLOW_DRAFT_HELP';

	
	INSERT INTO UnitPromotions_Features
	(PromotionType, FeatureType, Attack, Defense)
VALUES
	('PROMOTION_INVISIBLE_SUBMARINE', 'FEATURE_SHOALS', -25, -25);
	
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE]-25% [ICON_STRENGTH] Combat Strength when defending in or attacking a Unit in [COLOR_NEGATIVE_TEXT]Shoal[ENDCOLOR].'
	WHERE Tag = 'TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE_HELP' AND EXISTS (SELECT * FROM Units WHERE Type='UNIT_TORPEDO');

