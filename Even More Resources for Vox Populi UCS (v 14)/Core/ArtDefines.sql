--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES	('EVEN_MORE_RESOURCES_ATLAS_A',		256, 		'EvenMoreResourcesA_256.dds',	4, 				4),
		('EVEN_MORE_RESOURCES_ATLAS_A',		128, 		'EvenMoreResourcesA_128.dds',	4, 				4),
		('EVEN_MORE_RESOURCES_ATLAS_A',		80, 		'EvenMoreResourcesA_080.dds',	4, 				4),
		('EVEN_MORE_RESOURCES_ATLAS_A',		64, 		'EvenMoreResourcesA_064.dds',	4, 				4),
		('EVEN_MORE_RESOURCES_ATLAS_A',		45, 		'EvenMoreResourcesA_045.dds',	4, 				4),
		('EVEN_MORE_RESOURCES_ATLAS_B',		256, 		'EvenMoreResourcesB_256.dds',	4, 				4),
		('EVEN_MORE_RESOURCES_ATLAS_B',		128, 		'EvenMoreResourcesB_128.dds',	4, 				4),
		('EVEN_MORE_RESOURCES_ATLAS_B',		80, 		'EvenMoreResourcesB_080.dds',	4, 				4),
		('EVEN_MORE_RESOURCES_ATLAS_B',		64, 		'EvenMoreResourcesB_064.dds',	4, 				4),
		('EVEN_MORE_RESOURCES_ATLAS_B',		45, 		'EvenMoreResourcesB_045.dds',	4, 				4);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
VALUES	/*('ICON_FONT_TEXTURE_BEER', 			'BeerFontIcon_22'),
		('ICON_FONT_TEXTURE_BIRDS_NEST', 	'BirdsNestFontIcon_22'),
		('ICON_FONT_TEXTURE_CHAMPAGNE', 	'ChampagneFontIcon_22'),
		('ICON_FONT_TEXTURE_CHEESE', 		'CheeseFontIcon_22'),*/
		('ICON_FONT_TEXTURE_COCONUT', 		'CoconutFontIcon_22'),
		('ICON_FONT_TEXTURE_HARDWOOD', 		'HardwoodFontIcon_22'),
		--('ICON_FONT_TEXTURE_HONEY', 		'HoneyFontIcon_22'),
		('ICON_FONT_TEXTURE_LAVENDER', 		'LavenderFontIcon_22'),
		('ICON_FONT_TEXTURE_LEAD', 			'LeadFontIcon_22'),
		--('ICON_FONT_TEXTURE_MANUSCRIPTS',	'ManuscriptsFontIcon_22'),
		('ICON_FONT_TEXTURE_OBSIDIAN', 		'ObsidianFontIcon_22'),
		('ICON_FONT_TEXTURE_PINEAPPLE', 	'PineappleFontIcon_22'),
		('ICON_FONT_TEXTURE_PLATINUM', 		'PlatinumFontIcon_22'),
		('ICON_FONT_TEXTURE_POPPY', 		'PoppyFontIcon_22'),
		('ICON_FONT_TEXTURE_POTATO', 		'PotatoFontIcon_22'),
		('ICON_FONT_TEXTURE_RUBBER', 		'RubberFontIcon_22'),
		('ICON_FONT_TEXTURE_SULFUR', 		'SulfurFontIcon_22'),
		('ICON_FONT_TEXTURE_TIN', 			'TinFontIcon_22'),
		('ICON_FONT_TEXTURE_TITANIUM', 		'TitaniumFontIcon_22');
--------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconFontMapping 
		(IconName, 					IconFontTexture,					IconMapping)
VALUES	/*('ICON_RES_BEER', 			'ICON_FONT_TEXTURE_BEER',			1),
		('ICON_RES_BIRDS_NEST', 	'ICON_FONT_TEXTURE_BIRDS_NEST',		1),
		('ICON_RES_CHAMPAGNE', 		'ICON_FONT_TEXTURE_CHAMPAGNE',		1),
		('ICON_RES_CHEESE', 		'ICON_FONT_TEXTURE_CHEESE',			1),*/
		('ICON_RES_COCONUT', 		'ICON_FONT_TEXTURE_COCONUT',		1),
		('ICON_RES_HARDWOOD', 		'ICON_FONT_TEXTURE_HARDWOOD',		1),
		--('ICON_RES_HONEY', 			'ICON_FONT_TEXTURE_HONEY',			1),
		('ICON_RES_LAVENDER', 		'ICON_FONT_TEXTURE_LAVENDER',		1),
		('ICON_RES_LEAD', 			'ICON_FONT_TEXTURE_LEAD',			1),
		--('ICON_RES_MANUSCRIPTS',	'ICON_FONT_TEXTURE_MANUSCRIPTS',	1),
		('ICON_RES_OBSIDIAN', 		'ICON_FONT_TEXTURE_OBSIDIAN',		1),
		('ICON_RES_PINEAPPLE', 		'ICON_FONT_TEXTURE_PINEAPPLE',		1),
		('ICON_RES_PLATINUM', 		'ICON_FONT_TEXTURE_PLATINUM',		1),
		('ICON_RES_POPPY', 			'ICON_FONT_TEXTURE_POPPY',			1),
		('ICON_RES_POTATO', 		'ICON_FONT_TEXTURE_POTATO',			1),
		('ICON_RES_RUBBER', 		'ICON_FONT_TEXTURE_RUBBER',			1),
		('ICON_RES_SULFUR', 		'ICON_FONT_TEXTURE_SULFUR',			1),
		('ICON_RES_TIN', 			'ICON_FONT_TEXTURE_TIN',			1),
		('ICON_RES_TITANIUM', 		'ICON_FONT_TEXTURE_TITANIUM',		1);
--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,							TileType,	Asset)
VALUES	('ART_DEF_RESOURCE_COCONUT',				'Resource',	'SV_Coconut.dds'),
		('ART_DEF_RESOURCE_HARDWOOD',				'Resource',	'SV_Hardwood.dds'),
		('ART_DEF_RESOURCE_LAVENDER',				'Resource',	'SV_Lavender.dds'),
		('ART_DEF_RESOURCE_LEAD',					'Resource',	'SV_Lead.dds'),
		--('ART_DEF_RESOURCE_LEAD_HEAVY',				'Resource',	'SV_Lead.dds'),
		('ART_DEF_RESOURCE_OBSIDIAN',				'Resource',	'SV_Obsidian.dds'),
		('ART_DEF_RESOURCE_PINEAPPLE',				'Resource',	'SV_Pineapple.dds'),
		('ART_DEF_RESOURCE_PLATINUM',				'Resource',	'SV_Platinum.dds'),
		('ART_DEF_RESOURCE_PLATINUM_HEAVY',			'Resource',	'SV_Platinum.dds'),
		('ART_DEF_RESOURCE_POPPY',					'Resource',	'SV_Poppy.dds'),
		('ART_DEF_RESOURCE_POTATO',					'Resource',	'SV_Potato.dds'),
		('ART_DEF_RESOURCE_RUBBER',					'Resource',	'SV_Rubber.dds'),
		('ART_DEF_RESOURCE_SULFUR',					'Resource',	'SV_Sulfur.dds'),
		('ART_DEF_RESOURCE_TIN',					'Resource',	'SV_Tin.dds'),
		('ART_DEF_RESOURCE_TITANIUM',				'Resource',	'SV_Titanium.dds'),
		('ART_DEF_RESOURCE_TITANIUM_HEAVY',			'Resource',	'SV_Titanium.dds'),
		('ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'Resource',	'SV_Titanium.dds'),
		('ART_DEF_RESOURCE_TITANIUM_MARSH',			'Resource',	'SV_Titanium.dds');
--------------------------------------------------------------------------------------------------------------------------		
-- ArtDefine_LandmarkTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes 
		(Type,										LandmarkType,	FriendlyName)
VALUES	('ART_DEF_RESOURCE_COCONUT',				'Resource',		'Coconut'),
		('ART_DEF_RESOURCE_HARDWOOD',				'Resource',		'Hardwood'),
		('ART_DEF_RESOURCE_LAVENDER',				'Resource',		'Lavender'),
		('ART_DEF_RESOURCE_LEAD',					'Resource',		'Lead'),
		--('ART_DEF_RESOURCE_LEAD_HEAVY',				'Resource',		'Lead Heavy'),
		('ART_DEF_RESOURCE_OBSIDIAN',				'Resource',		'Obsidian'),
		('ART_DEF_RESOURCE_PINEAPPLE',				'Resource',		'Pineapple'),
		('ART_DEF_RESOURCE_PLATINUM',				'Resource',		'Platinum'),
		('ART_DEF_RESOURCE_PLATINUM_HEAVY',			'Resource',		'Platinum Heavy'),
		('ART_DEF_RESOURCE_POPPY',					'Resource',		'Poppy'),
		('ART_DEF_RESOURCE_POTATO',					'Resource',		'Potato'),
		('ART_DEF_RESOURCE_RUBBER',					'Resource',		'Rubber'),
		('ART_DEF_RESOURCE_SULFUR',					'Resource',		'Sulfur'),
		('ART_DEF_RESOURCE_TIN',					'Resource',		'Tin'),
		('ART_DEF_RESOURCE_TITANIUM',				'Resource',		'Titanium'),
		('ART_DEF_RESOURCE_TITANIUM_HEAVY',			'Resource',		'Titanium Heavy'),
		('ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'Resource',		'Titanium Heavy Marsh'),
		('ART_DEF_RESOURCE_TITANIUM_MARSH',			'Resource',		'Titanium Marsh');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_Landmarks 
		(Era,			State,						Scale,				ImprovementType,					LayoutHandler,				ResourceType,								Model,										TerrainContour, Tech)
VALUES	
		-- Coconut
		('Any',			'Any',						1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_COCONUT',					'Coconuttrees.fxsxml',						1,				null),
		('Industrial',	'Constructed',				1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_COCONUT',					'Plantation_IND_Coconuttrees.fxsxml',		1,				null),
		('Industrial',	'UnderConstruction',		1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_COCONUT',					'Plantation_IND_Coconuttrees_HB.fxsxml',	1,				null),
		('Industrial',	'Pillaged',					1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_COCONUT',					'Plantation_IND_Coconuttrees_PIL.fxsxml',	1,				null),
		('Ancient',		'Constructed',				1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_COCONUT',					'Plantation_MID_Coconuttrees.fxsxml',		1,				null),
		('Ancient',		'UnderConstruction',		1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_COCONUT',					'Plantation_MID_Coconuttrees_HB.fxsxml',	1,				null),
		('Ancient',		'Pillaged',					1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_COCONUT',					'Plantation_MID_Coconuttrees_PIL.fxsxml',	1,				null),

		-- Hardwood
		('Any',			'Any',						1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_HARDWOOD',				'Lumbertrees.fxsxml',						1,				null),
		('Ancient',		'Constructed',				0.8,				'ART_DEF_IMPROVEMENT_LUMBERMILL',	'SNAPSHOT',					'ART_DEF_RESOURCE_HARDWOOD',				'Lumbermill_MID_Lumbertrees.fxsxml',		1,				null),
		('Ancient',		'UnderConstruction',		0.8,				'ART_DEF_IMPROVEMENT_LUMBERMILL',	'SNAPSHOT',					'ART_DEF_RESOURCE_HARDWOOD',				'Lumbermill_MID_Lumbertrees_HB.fxsxml',		1,				null),
		('Ancient',		'Pillaged',					0.8,				'ART_DEF_IMPROVEMENT_LUMBERMILL',	'SNAPSHOT',					'ART_DEF_RESOURCE_HARDWOOD',				'Lumbermill_MID_Lumbertrees_PIL.fxsxml',	1,				null),

		-- Lavender
		('Any',			'Any',						1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LAVENDER',				'Resource_Lavender.fxsxml',					1,				null),
		('Industrial',	'Constructed',				1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_LAVENDER',				'Plantation_IND_Lavender.fxsxml',			1,				null),
		('Industrial',	'UnderConstruction',		1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_LAVENDER',				'HB_Plantation_IND_Lavender.fxsxml',		1,				null),
		('Industrial',	'Pillaged',					1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_LAVENDER',				'PL_Plantation_IND_Lavender.fxsxml',		1,				null),
		('Ancient',		'Constructed',				1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_LAVENDER',				'Plantation_MID_Lavender.fxsxml',			1,				null),
		('Ancient',		'UnderConstruction',		1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_LAVENDER',				'HB_Plantation_MID_Lavender.fxsxml',		1,				null),
		('Ancient',		'Pillaged',					1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_LAVENDER',				'PL_Plantation_MID_Lavender.fxsxml',		1,				null),

		-- Lead
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD',					'Lead.fxsxml',								1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD',					'MED_Mine_Lead.fxsxml',						1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD',					'HB_MED_Mine_Lead.fxsxml',					1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD',					'PL_MED_Mine_Lead.fxsxml',					1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD',					'IND_Mine_Lead.fxsxml',						1,				null),
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD',					'HB_IND_Mine_Lead.fxsxml',					1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD',					'PL_IND_Mine_Lead.fxsxml',					1,				null),
		--('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD_HEAVY',				'Lead_Heavy.fxsxml',						1,				null),
		--('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD_HEAVY',				'MED_Mine_Lead_Heavy.fxsxml',				1,				null),
		--('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD_HEAVY',				'HB_MED_Mine_Lead_Heavy.fxsxml',			1,				null),
		--('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD_HEAVY',				'PL_MED_Mine_Lead_Heavy.fxsxml',			1,				null),
		--('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD_HEAVY',				'IND_Mine_Lead_Heavy.fxsxml',				1,				null),
		--('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD_HEAVY',				'HB_IND_Mine_Lead_Heavy.fxsxml',			1,				null),
		--('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_LEAD_HEAVY',				'PL_IND_Mine_Lead_Heavy.fxsxml',			1,				null),

		-- Obsidian
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_OBSIDIAN',				'Obsidian.fxsxml',							1,				null),
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_QUARRY',		'SNAPSHOT',					'ART_DEF_RESOURCE_OBSIDIAN',				'HB_Anc_Obsidian_Quarry.fxsxml',			1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_QUARRY',		'SNAPSHOT',					'ART_DEF_RESOURCE_OBSIDIAN',				'Anc_Obsidian_Quarry.fxsxml',				1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_QUARRY',		'SNAPSHOT',					'ART_DEF_RESOURCE_OBSIDIAN',				'PL_Anc_Obsidian_Quarry.fxsxml',			1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_QUARRY',		'SNAPSHOT',					'ART_DEF_RESOURCE_OBSIDIAN',				'HB_IND_Obsidian_Quarry.fxsxml',			1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_QUARRY',		'SNAPSHOT',					'ART_DEF_RESOURCE_OBSIDIAN',				'IND_Obsidian_Quarry.fxsxml',				1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_QUARRY',		'SNAPSHOT',					'ART_DEF_RESOURCE_OBSIDIAN',				'PL_IND_Obsidian_Quarry.fxsxml',			1,				null),

		-- Pineapple
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PINEAPPLE',				'resource_pineapple.fxsxml',				1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_PINEAPPLE',				'plantation_ind_pineapple.fxsxml',			1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_PINEAPPLE',				'hb_plantation_ind_pineapple.fxsxml',		1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_PINEAPPLE',				'pl_plantation_ind_pineapple.fxsxml',		1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_PINEAPPLE',				'plantation_mid_pineapple.fxsxml',			1,				null),
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_PINEAPPLE',				'hb_plantation_mid_pineapple.fxsxml',		1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_PINEAPPLE',				'pl_plantation_mid_pineapple.fxsxml',		1,				null),

		-- Platinum
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM',				'Platinum.fxsxml',							1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM',				'MED_Mine_Platinum.fxsxml',					1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM',				'HB_MED_Mine_Platinum.fxsxml',				1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM',				'PL_MED_Mine_Platinum.fxsxml',				1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM',				'IND_Mine_Platinum.fxsxml',					1,				null),
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM',				'HB_IND_Mine_Platinum.fxsxml',				1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM',				'PL_IND_Mine_Platinum.fxsxml',				1,				null),
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM_HEAVY',			'Platinum_Heavy.fxsxml',					1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM_HEAVY',			'MED_Mine_Platinum_Heavy.fxsxml',			1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM_HEAVY',			'HB_MED_Mine_Platinum_Heavy.fxsxml',		1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM_HEAVY',			'PL_MED_Mine_Platinum_Heavy.fxsxml',		1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM_HEAVY',			'IND_Mine_Platinum_Heavy.fxsxml',			1,				null),
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM_HEAVY',			'HB_IND_Mine_Platinum_Heavy.fxsxml',		1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_PLATINUM_HEAVY',			'PL_IND_Mine_Platinum_Heavy.fxsxml',		1,				null),

		-- Poppy
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_POPPY',					'Resource_Poppy.fxsxml',					1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_POPPY',					'Plantation_IND_Poppy.fxsxml',				1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_POPPY',					'HB_Plantation_IND_Poppy.fxsxml',			1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_POPPY',					'PL_Plantation_IND_Poppy.fxsxml',			1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_POPPY',					'Plantation_MID_Poppy.fxsxml',				1,				null),
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_POPPY',					'HB_Plantation_MID_Poppy.fxsxml',			1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_POPPY',					'PL_Plantation_MID_Poppy.fxsxml',			1,				null),

		-- Potato
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_POTATO',					'resource_potatoe.fxsxml',					1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_POTATO',					'plantation_ind_potatoe.fxsxml',			1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_POTATO',					'hb_plantation_ind_potatoe.fxsxml',			1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_POTATO',					'pl_plantation_ind_potatoe.fxsxml',			1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_POTATO',					'plantation_mid_potatoe.fxsxml',			1,				null),
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_POTATO',					'hb_plantation_mid_potatoe.fxsxml',			1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_POTATO',					'pl_plantation_mid_potatoe.fxsxml',			1,				null),

		-- Rubber
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_RUBBER',					'Rubbertrees.fxsxml',						1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_RUBBER',					'Plantation_IND_Rubbertrees.fxsxml',		1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_RUBBER',					'Plantation_IND_Rubbertrees_HB.fxsxml',		1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_RUBBER',					'Plantation_IND_Rubbertrees_PIL.fxsxml',	1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_RUBBER',					'Plantation_MID_Rubbertrees.fxsxml',		1,				null),
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_RUBBER',					'Plantation_MID_Rubbertrees_HB.fxsxml',		1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',					'ART_DEF_RESOURCE_RUBBER',					'Plantation_MID_Rubbertrees_PIL.fxsxml',	1,				null),

		-- Sulfur
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_SULFUR',					'Sulfur.fxsxml',							1,				null),
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_QUARRY',		'SNAPSHOT',					'ART_DEF_RESOURCE_SULFUR',					'HB_Anc_Sulfur_Quarry.fxsxml',				1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_QUARRY',		'SNAPSHOT',					'ART_DEF_RESOURCE_SULFUR',					'Anc_Sulfur_Quarry.fxsxml',					1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_QUARRY',		'SNAPSHOT',					'ART_DEF_RESOURCE_SULFUR',					'PL_Anc_Sulfur_Quarry.fxsxml',				1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_QUARRY',		'SNAPSHOT',					'ART_DEF_RESOURCE_SULFUR',					'HB_IND_Sulfur_Quarry.fxsxml',				1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_QUARRY',		'SNAPSHOT',					'ART_DEF_RESOURCE_SULFUR',					'IND_Sulfur_Quarry.fxsxml',					1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_QUARRY',		'SNAPSHOT',					'ART_DEF_RESOURCE_SULFUR',					'PL_IND_Sulfur_Quarry.fxsxml',				1,				null),

		-- Tin
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TIN',						'tin.fxsxml',								1,				null),
		('Industrial',		'Constructed',			0.899999976158142,	'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TIN',						'ind_mine_tin.fxsxml',						1,				null),
		('Industrial',		'UnderConstruction',	0.899999976158142,	'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TIN',						'hb_ind_tin_mine.fxsxml',					1,				null),
		('Industrial',		'Pillaged',				0.899999976158142,	'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TIN',						'pl_ind_mine_tin.fxsxml',					1,				null),
		('Ancient',			'Constructed',			0.899999976158142,	'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TIN',						'med_mine_tin.fxsxml',						1,				null),
		('Ancient',			'UnderConstruction',	0.899999976158142,	'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TIN',						'hb_med_tin_mine.fxsxml',					1,				null),
		('Ancient',			'Pillaged',				0.899999976158142,	'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TIN',						'pl_med_mine_tin.fxsxml',					1,				null),

		-- Titanium
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM',				'HB_MED_Mine_Titanium.fxsxml',				1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM',				'MED_Mine_Titanium.fxsxml',					1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM',				'PL_MED_Mine_Titanium.fxsxml',				1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM',				'HB_IND_Mine_Titanium.fxsxml',				1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM',				'IND_Mine_Titanium.fxsxml',					1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM',				'PL_IND_Mine_Titanium.fxsxml',				1,				null),
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM',				'Titanium.fxsxml',							1,				null),
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'HB_MED_Mine_Titanium_Heavy.fxsxml',		1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'MED_Mine_Titanium_Heavy.fxsxml',			1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'PL_MED_Mine_Titanium_Heavy.fxsxml',		1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'HB_IND_Mine_Titanium_Heavy.fxsxml',		1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'IND_Mine_Titanium_Heavy.fxsxml',			1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'PL_IND_Mine_Titanium_Heavy.fxsxml',		1,				null),
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'Titanium_Heavy.fxsxml',					1,				null),
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'HB_MED_Mine_Titanium_Heavy.fxsxml',		1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'MED_Mine_Titanium_Heavy.fxsxml',			1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'PL_MED_Mine_Titanium_Heavy.fxsxml',		1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'HB_IND_Mine_Titanium_Heavy.fxsxml',		1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'IND_Mine_Titanium_Heavy.fxsxml',			1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'PL_IND_Mine_Titanium_Heavy.fxsxml',		1,				null),
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'Titanium_Heavy_marsh.fxsxml',				1,				null),
		('Ancient',			'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_MARSH',			'HB_MED_Mine_Titanium.fxsxml',				1,				null),
		('Ancient',			'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_MARSH',			'MED_Mine_Titanium.fxsxml',					1,				null),
		('Ancient',			'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_MARSH',			'PL_MED_Mine_Titanium.fxsxml',				1,				null),
		('Industrial',		'UnderConstruction',	1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_MARSH',			'HB_IND_Mine_Titanium.fxsxml',				1,				null),
		('Industrial',		'Constructed',			1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_MARSH',			'IND_Mine_Titanium.fxsxml',					1,				null),
		('Industrial',		'Pillaged',				1,					'ART_DEF_IMPROVEMENT_MINE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_MARSH',			'PL_IND_Mine_Titanium.fxsxml',				1,				null),
		('Any',				'Any',					1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TITANIUM_MARSH',			'Titanium_marsh.fxsxml',					1,				null);
