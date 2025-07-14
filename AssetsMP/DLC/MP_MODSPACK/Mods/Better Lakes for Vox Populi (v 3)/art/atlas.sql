--Atlas

INSERT INTO IconTextureAtlases 
			(Atlas, 						IconSize,  	 Filename,				IconsPerRow, 	IconsPerColumn)
VALUES		('IA_LAKE_ATLAS',				256, 		'LakeAtlas256.dds',		5, 				1),
			('IA_LAKE_ATLAS',				128, 		'LakeAtlas128.dds',		5, 				1),
			('IA_LAKE_ATLAS',				80, 		'LakeAtlas80.dds',		5, 				1),
			('IA_LAKE_ATLAS',				64, 		'LakeAtlas64.dds',		5, 				1),
			('IA_LAKE_ATLAS',				45, 		'LakeAtlas45.dds',		5, 				1),
			('IA_LAKE_ATLAS',				32, 		'LakeAtlas32.dds',		5, 				1);


-- ART DEFINES

-- ArtDefine_StrategicView
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,								TileType,	Asset)
VALUES	('ART_DEF_RESOURCE_IA_LAKE_FISH',				'Resource',	'SV_LakeFish.dds'),
		('ART_DEF_RESOURCE_IA_SALT_LAKE',				'Resource',	'SV_SaltLake.dds');
--------------------------------------------------------------------------------------------------------------------------		
-- ArtDefine_LandmarkTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes 
		(Type,											LandmarkType,	FriendlyName)
VALUES	('ART_DEF_RESOURCE_IA_LAKE_FISH',				'Resource',		'Lake Fish'),
		('ART_DEF_RESOURCE_IA_SALT_LAKE',				'Resource',		'Salt Lake');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
--------------------------------------------------------------------------------------------------------------------------

INSERT INTO ArtDefine_Landmarks 
		(Era,			State,		Scale,				ImprovementType,						LayoutHandler,	ResourceType,						Model,						TerrainContour, Tech)
VALUES	
		--lake fish
		('Ancient',		'Any',		0.0700000002980232,	'ART_DEF_IMPROVEMENT_FISHING_BOATS',	'ANIMATED',		'ART_DEF_RESOURCE_IA_LAKE_FISH',	'fish.fxsxml',				1,				null),
		('Industrial',	'Any',		0.0700000002980232,	'ART_DEF_IMPROVEMENT_FISHING_BOATS',	'ANIMATED',		'ART_DEF_RESOURCE_IA_LAKE_FISH',	'fish_industrial.fxsxml',	1,				null),
		('Ancient',		'Any',		0.0700000002980232,	'ART_DEF_IMPROVEMENT_NONE',				'ANIMATED',		'ART_DEF_RESOURCE_IA_LAKE_FISH',	'fish.fxsxml',				1,				null),
		('Industrial',	'Any',		0.0700000002980232,	'ART_DEF_IMPROVEMENT_NONE',				'ANIMATED',		'ART_DEF_RESOURCE_IA_LAKE_FISH',	'fish_industrial.fxsxml',	1,				null);

		--salt lake
		--('Any',			'Any',		1,					'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_IA_SALT_LAKE',	'salt.fxsxml',				1,				null);