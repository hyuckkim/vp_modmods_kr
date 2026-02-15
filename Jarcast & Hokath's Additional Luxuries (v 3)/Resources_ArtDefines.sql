--==========================================================================================================================
-- ICON ATLAS
--==========================================================================================================================
---- IconTextureAtlases
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases
		(Atlas,				IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
SELECT 'JAR_ADDLUX_ATLAS', 	256, 		3, 				1, 'AddLuxResAtlas256.dds' UNION ALL
SELECT 'JAR_ADDLUX_ATLAS', 	128, 		3, 				1, 'AddLuxResAtlas128.dds' UNION ALL
SELECT 'JAR_ADDLUX_ATLAS', 	080, 		3, 				1, 'AddLuxResAtlas80.dds' UNION ALL
SELECT 'JAR_ADDLUX_ATLAS', 	064, 		3, 				1, 'AddLuxResAtlas64.dds' UNION ALL
SELECT 'JAR_ADDLUX_ATLAS', 	045, 		3, 				1, 'AddLuxResAtlas45.dds';
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconFontTextures 
		(IconFontTexture, 				IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_ALPACA', 	'AlpacaFontIcon_22'),
		('ICON_FONT_TEXTURE_CAMEL', 	'CamelFontIcon_22'),
		('ICON_FONT_TEXTURE_QUARTZ', 	'QuartzFontIcon_22');
--------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconFontMapping 
		(IconName, 				IconFontTexture,				IconMapping)
VALUES	('ICON_RES_ALPACA', 	'ICON_FONT_TEXTURE_ALPACA',		1),
		('ICON_RES_CAMEL', 		'ICON_FONT_TEXTURE_CAMEL',		1),
		('ICON_RES_QUARTZ', 	'ICON_FONT_TEXTURE_QUARTZ',		1);
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,				TileType,	Asset) 
VALUES	('ART_DEF_RESOURCE_ALPACA',		'Resource',	'sv_Alpaca.dds'),
		('ART_DEF_RESOURCE_CAMEL',		'Resource',	'sv_Camel.dds'),
		('ART_DEF_RESOURCE_QUARTZ',		'Resource',	'sv_Quartz.dds');
--------------------------------------------------------------------------------------------------------------------------		
-- ArtDefine_LandmarkTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes 
		(Type,							LandmarkType,	FriendlyName) 
VALUES	('ART_DEF_RESOURCE_ALPACA',		'Resource',		'Jar_Alpaca'),
		('ART_DEF_RESOURCE_CAMEL',		'Resource',		'Jar_Camel'),
		('ART_DEF_RESOURCE_QUARTZ',		'Resource',		'Jar_Quartz');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_Landmarks
		(Era,	State,	Scale,	ImprovementType,				LayoutHandler,	ResourceType,				Model,					TerrainContour)
SELECT	 'Any',	'Any',	0.08,	'ART_DEF_IMPROVEMENT_NONE',		'ANIMATED',		'ART_DEF_RESOURCE_ALPACA', 'resource_alpaca_larger_v2.fxsxml',	1 UNION ALL
SELECT	 'Any',	'Any',	0.08,	'ART_DEF_IMPROVEMENT_PASTURE',	'ANIMATED',		'ART_DEF_RESOURCE_ALPACA', 'resource_alpaca_larger_v2.fxsxml',	1;

INSERT INTO ArtDefine_Landmarks
		(Era,	State,	Scale,	ImprovementType,				LayoutHandler,		ResourceType,				Model,					TerrainContour)
SELECT	 'Any',	'Any',	0.08,	'ART_DEF_IMPROVEMENT_NONE',		'ANIMATED_ROTATED',	'ART_DEF_RESOURCE_CAMEL', 'resource_camel.fxsxml',	1 UNION ALL
SELECT	 'Any',	'Any',	0.08,	'ART_DEF_IMPROVEMENT_PASTURE',	'ANIMATED_ROTATED',	'ART_DEF_RESOURCE_CAMEL', 'resource_camel.fxsxml',	1;

INSERT INTO ArtDefine_Landmarks
		(ResourceType,				ImprovementType,			Model,							Era,			State,					Scale,	LayoutHandler,	TerrainContour)
SELECT  'ART_DEF_RESOURCE_QUARTZ', 'ART_DEF_IMPROVEMENT_NONE', 	'Resource_QUARTZ.fxsxml', 		'Any', 			'Any', 					1, 'SNAPSHOT', 1 UNION ALL
SELECT  'ART_DEF_RESOURCE_QUARTZ', 'ART_DEF_IMPROVEMENT_QUARRY','HB_QUARRY_MID_QUARTZ.fxsxml', 	'Ancient', 		'UnderConstruction', 	1, 'SNAPSHOT', 1 UNION ALL
SELECT  'ART_DEF_RESOURCE_QUARTZ', 'ART_DEF_IMPROVEMENT_QUARRY','QUARRY_MID_QUARTZ.fxsxml', 	'Ancient', 		'Constructed', 			1, 'SNAPSHOT', 1 UNION ALL
SELECT  'ART_DEF_RESOURCE_QUARTZ', 'ART_DEF_IMPROVEMENT_QUARRY','PL_QUARRY_MID_QUARTZ.fxsxml', 	'Ancient', 		'Pillaged', 			1, 'SNAPSHOT', 1 UNION ALL
SELECT  'ART_DEF_RESOURCE_QUARTZ', 'ART_DEF_IMPROVEMENT_QUARRY','HB_QUARRY_IND_QUARTZ.fxsxml', 	'Industrial', 	'UnderConstruction', 	1, 'SNAPSHOT', 1 UNION ALL
SELECT  'ART_DEF_RESOURCE_QUARTZ', 'ART_DEF_IMPROVEMENT_QUARRY','QUARRY_IND_QUARTZ.fxsxml', 	'Industrial', 	'Constructed', 			1, 'SNAPSHOT', 1 UNION ALL
SELECT  'ART_DEF_RESOURCE_QUARTZ', 'ART_DEF_IMPROVEMENT_QUARRY','PL_QUARRY_IND_QUARTZ.fxsxml', 	'Industrial', 	'Pillaged', 			1, 'SNAPSHOT', 1;
--==========================================================================================================================
--==========================================================================================================================