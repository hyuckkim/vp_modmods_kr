--============================================--
-- ICONS ATLASES
--============================================--
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('RESOURCE_MORE_WONDERS_ATLAS', 	256, 		'More_Wonders_Resources_256.dds',		4, 				1),
			('RESOURCE_MORE_WONDERS_ATLAS', 	80, 		'More_Wonders_Resources_80.dds',		4, 				1),
			('RESOURCE_MORE_WONDERS_ATLAS', 	64, 		'More_Wonders_Resources_64.dds',		4, 				1),
			('RESOURCE_MORE_WONDERS_ATLAS', 	45, 		'More_Wonders_Resources_45.dds',		4, 				1);	
--------------------------------------------------------------
INSERT INTO IconFontTextures 
			(IconFontTexture, 				IconFontTextureFile)
VALUES		('MORE_WONDERS_FONT_ATLAS', 	'More_Wonders_Resources_Font_22');
--============================================--
-- TEXTS
--============================================--			
INSERT INTO Language_en_US 
			(Tag,											Text) 
VALUES		('TXT_KEY_RESOURCE_TERN',						'Tern Egg'),
			('TXT_KEY_RESOURCE_TERN_TEXT',					'TODO'),
			('TXT_KEY_RESOURCE_TERN_MONOPOLY',				'Granted by [ICON_WONDER] Ahu Tongariki. [COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +5% [ICON_PEACE] on Empire.'),
			--('TXT_KEY_RESOURCE_TERN_MONOPOLY_FULL',		'1 copy is granted by Ahu Tongariki [ICON_WONDER] World Wonder.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +5% [ICON_PEACE] Faith in all owned Cities.'),
			('TXT_KEY_RESOURCE_SYLVITE',					'Sylvite'),
			('TXT_KEY_RESOURCE_SYLVITE_TEXT',				'TODO'),
			('TXT_KEY_RESOURCE_SYLVITE_MONOPOLY',			'Granted by Dallol. [COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] [COLOR_WATER_TEXT]Explosive Mixture[ENDCOLOR]/[COLOR_YIELD_GOLD]Siege[ENDCOLOR].'),
			--('TXT_KEY_RESOURCE_SYLVITE_MONOPOLY_FULL',	'1 copy is granted by Dallol Natural Wonder.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] Promotion [COLOR_POSITIVE_TEXT]Explosive Mixture[ENDCOLOR] for owned [COLOR:255:230:85:255]Siege[ENDCOLOR] units (tied to dummy building).'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH',				'Tropical Fish'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH_TEXT',			'TODO'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH_MONOPOLY',		'Can be spawned by Great Barrier Reef and Galapagos Natural Wonders.'),
			('TXT_KEY_RESOURCE_TORTOISE',					'Giant Tortoise'),
			('TXT_KEY_RESOURCE_TORTOISE_TEXT',				'TODO'),
			('TXT_KEY_RESOURCE_TORTOISE_MONOPOLY',			'Spawned by Galapagos. [COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_GOLDEN_AGE] Length.');
			--('TXT_KEY_RESOURCE_TORTOISE_MONOPOLY_FULL',	'Can be spawned by Galapagos Natural Wonder.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_GOLDEN_AGE] Golden Age Length.');

UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]Nearby [ICON_RES_TORTOISE]: +2 [ICON_RESEARCH] Science.' WHERE Tag = 'TXT_KEY_BUILDING_LABORATORY_HELP';

INSERT INTO Language_ko_KR
			(Tag,											Text)
VALUES		('TXT_KEY_RESOURCE_TERN',						'제비갈매기 알'),
			('TXT_KEY_RESOURCE_TERN_TEXT',					'TODO'),
			('TXT_KEY_RESOURCE_TERN_MONOPOLY',				'[ICON_WONDER] 아후 통가리키에 의해 부여됩니다. [COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 제국 내 [ICON_PEACE] 신앙 +5%.'),
			('TXT_KEY_RESOURCE_SYLVITE',					'실바이트'),
			('TXT_KEY_RESOURCE_SYLVITE_TEXT',				'TODO'),
			('TXT_KEY_RESOURCE_SYLVITE_MONOPOLY',			'달롤에 의해 부여됩니다. [COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] [COLOR_WATER_TEXT]폭발성 혼합물[ENDCOLOR]/[COLOR_YIELD_GOLD]공성[ENDCOLOR].'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH',				'열대어'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH_TEXT',			'TODO'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH_MONOPOLY',		'대보초와 갈라파고스 자연 불가사의에 의해 생성될 수 있습니다.'),
			('TXT_KEY_RESOURCE_TORTOISE',					'거대 거북'),
			('TXT_KEY_RESOURCE_TORTOISE_TEXT',				'TODO'),
			('TXT_KEY_RESOURCE_TORTOISE_MONOPOLY',			'갈라파고스에 의해 생성됩니다. [COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] [ICON_GOLDEN_AGE] 황금기 기간 +10%.');

UPDATE Language_ko_KR SET Text = Text||'[NEWLINE][NEWLINE]인접한 [ICON_RES_TORTOISE] 거대 거북: [ICON_RESEARCH] 과학 +2.' WHERE Tag = 'TXT_KEY_BUILDING_LABORATORY_HELP';
--=====================================================--
-- RESURCES
---------------------------------------------------------
-- Tern Egg - added by Ahu Tongariki WW
-- Sylvite - added by Dallol NW
-- Tropical Fish - added by Great Barrier Reef and Galapagos NWs
-- Giant Tortoise - added by Galapagos NW
--=====================================================--
INSERT INTO Resources 
			(Type,						TechReveal,			TechCityTrade, 		Description,						Civilopedia, 							Help,										ResourceClassType, 			IsMonopoly, 	ArtDefineTag, 						CivilizationType,		OnlyMinorCivs,  Happiness,  ResourceUsage,	SeaResource,	AnimalResource,	PlantResource,	RockResource,	IconString, 				PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_TERN',			null,				'TECH_PHYSICS',		'TXT_KEY_RESOURCE_TERN',			'TXT_KEY_RESOURCE_TERN_TEXT',			'TXT_KEY_RESOURCE_TERN_MONOPOLY',			'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_TERN',			null,					0,				2,			2,				0,				1,				0,				0,				'[ICON_RES_TERN]',			0, 				'RESOURCE_MORE_WONDERS_ATLAS'),
			('RESOURCE_SYLVITE',		null,				'TECH_MINING',		'TXT_KEY_RESOURCE_SYLVITE',			'TXT_KEY_RESOURCE_SYLVITE_TEXT',		'TXT_KEY_RESOURCE_SYLVITE_MONOPOLY',		'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_SYLVITE',			null,					0,				2,			2,				0,				0,				0,				1,				'[ICON_RES_SYLVITE]',		1, 				'RESOURCE_MORE_WONDERS_ATLAS'),
			('RESOURCE_TROPICAL_FISH',	'TECH_SAILING',		'TECH_SAILING',		'TXT_KEY_RESOURCE_TROPICAL_FISH',	'TXT_KEY_RESOURCE_TROPICAL_FISH_TEXT',	'TXT_KEY_RESOURCE_TROPICAL_FISH_MONOPOLY',	'RESOURCECLASS_BONUS',		0,				'ART_DEF_RESOURCE_TROPICAL_FISH',	null,					0,				0,			0,				1,				1,				0,				0,				'[ICON_RES_TROPICAL_FISH]',	2, 				'RESOURCE_MORE_WONDERS_ATLAS'),
			('RESOURCE_TORTOISE',		'TECH_TRAPPING',	'TECH_TRAPPING',	'TXT_KEY_RESOURCE_TORTOISE',		'TXT_KEY_RESOURCE_TORTOISE_TEXT',		'TXT_KEY_RESOURCE_TORTOISE_MONOPOLY',		'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_TORTOISE',		null,					0,				2,			2,				0,				1,				0,				0,				'[ICON_RES_TORTOISE]',		3, 				'RESOURCE_MORE_WONDERS_ATLAS');

UPDATE Resources SET MonopolyGALength = '10' WHERE Type = 'RESOURCE_TORTOISE';
---------------------------------------------------------
INSERT INTO Resource_YieldChanges
			(ResourceType, 				YieldType, 					Yield)
VALUES		('RESOURCE_TROPICAL_FISH',	'YIELD_FOOD',				1),
			('RESOURCE_TROPICAL_FISH',	'YIELD_CULTURE',			1),
			('RESOURCE_TORTOISE',		'YIELD_FOOD',				1),
			('RESOURCE_TORTOISE',		'YIELD_GOLDEN_AGE_POINTS',	1);

INSERT INTO Improvement_ResourceTypes
			(ImprovementType,				ResourceType, 				ResourceMakesValid, ResourceTrade)
VALUES		('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_TROPICAL_FISH',	1,					1),
			('IMPROVEMENT_CAMP',			'RESOURCE_TORTOISE',		1,					1);

INSERT INTO Improvement_ResourceType_Yields
			(ImprovementType,				ResourceType, 				YieldType, 					Yield)
VALUES		('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_TROPICAL_FISH',	'YIELD_FOOD',				2),
			('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_TROPICAL_FISH',	'YIELD_CULTURE',			1),
			('IMPROVEMENT_CAMP',			'RESOURCE_TORTOISE',		'YIELD_GOLD',				1),
			('IMPROVEMENT_CAMP',			'RESOURCE_TORTOISE',		'YIELD_GOLDEN_AGE_POINTS',	1);

INSERT INTO Building_ResourceYieldChanges
			(BuildingType,				ResourceType, 			YieldType, 			Yield)
VALUES		('BUILDING_LABORATORY',		'RESOURCE_TORTOISE',	'YIELD_SCIENCE',	2);
---------------------------------------------------------
INSERT INTO Resource_Flavors 	
			(ResourceType, 				FlavorType, 			Flavor)
VALUES		('RESOURCE_TERN',			'FLAVOR_GROWTH',		10),
			('RESOURCE_TERN',			'FLAVOR_RELIGION',		50),
			('RESOURCE_SYLVITE',		'FLAVOR_PRODUCTION',	20),
			('RESOURCE_SYLVITE',		'FLAVOR_CULTURE',		30),
			('RESOURCE_TROPICAL_FISH',	'FLAVOR_GROWTH',		10),
			('RESOURCE_TROPICAL_FISH',	'FLAVOR_CULTURE',		30),
			('RESOURCE_TORTOISE',		'FLAVOR_GROWTH',		10),
			('RESOURCE_TORTOISE',		'FLAVOR_GOLD',			30);
---------------------------------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 				TileType, 		Asset)
VALUES 		('ART_DEF_RESOURCE_TERN', 			'Resource', 	'sv_Tern_Egg.dds'),
			('ART_DEF_RESOURCE_SYLVITE',		'Resource', 	'sv_Sylvite.dds'),
			('ART_DEF_RESOURCE_TROPICAL_FISH', 	'Resource', 	'sv_Tropical_Fish.dds'),
			('ART_DEF_RESOURCE_TORTOISE', 		'Resource', 	'sv_Tortoise.dds');

INSERT INTO ArtDefine_LandmarkTypes
			(Type, 								LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_RESOURCE_TERN', 			'Resource', 	'Tern Egg'),
			('ART_DEF_RESOURCE_SYLVITE', 		'Resource', 	'Sylvite'),
			('ART_DEF_RESOURCE_TROPICAL_FISH', 	'Resource', 	'Tropical Fish'),
			('ART_DEF_RESOURCE_TORTOISE', 		'Resource', 	'Giant Tortoise');

INSERT INTO ArtDefine_Landmarks
			(Era,	State,	Scale,	ImprovementType,	LayoutHandler,	ResourceType,						Model,					TerrainContour,	Tech) 
SELECT		Era,	State,	Scale,	ImprovementType,	LayoutHandler,	'ART_DEF_RESOURCE_TROPICAL_FISH',	'fish_tropical.fxsxml', TerrainContour,	Tech
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_FISH' AND Era = 'Ancient';

INSERT INTO ArtDefine_Landmarks
			(Era,	State,	Scale,	ImprovementType,	LayoutHandler,	ResourceType,						Model,								TerrainContour,	Tech) 
SELECT		Era,	State,	Scale,	ImprovementType,	LayoutHandler,	'ART_DEF_RESOURCE_TROPICAL_FISH',	'fish_tropical_industrial.fxsxml',	TerrainContour,	Tech
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_FISH' AND Era = 'Industrial';

INSERT INTO ArtDefine_Landmarks 
			(Era,			State,						Scale,				ImprovementType,					LayoutHandler,				ResourceType,						Model,							TerrainContour, Tech)
VALUES		('Any',			'Any',						1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_TORTOISE',		'tortoise_resource.fxsxml',		1,				null),
			('Industrial',	'Constructed',				1,					'ART_DEF_IMPROVEMENT_CAMP',			'SNAPSHOT',					'ART_DEF_RESOURCE_TORTOISE',		'tortoise_camp_cn.fxsxml',		1,				null),
			('Industrial',	'UnderConstruction',		1,					'ART_DEF_IMPROVEMENT_CAMP',			'SNAPSHOT',					'ART_DEF_RESOURCE_TORTOISE',		'tortoise_camp_hb.fxsxml',		1,				null),
			('Industrial',	'Pillaged',					1,					'ART_DEF_IMPROVEMENT_CAMP',			'SNAPSHOT',					'ART_DEF_RESOURCE_TORTOISE',		'tortoise_camp_pl.fxsxml',		1,				null),
			('Ancient',		'Constructed',				1,					'ART_DEF_IMPROVEMENT_CAMP',			'SNAPSHOT',					'ART_DEF_RESOURCE_TORTOISE',		'tortoise_camp_cn.fxsxml',		1,				null),
			('Ancient',		'UnderConstruction',		1,					'ART_DEF_IMPROVEMENT_CAMP',			'SNAPSHOT',					'ART_DEF_RESOURCE_TORTOISE',		'tortoise_camp_hb.fxsxml',		1,				null),
			('Ancient',		'Pillaged',					1,					'ART_DEF_IMPROVEMENT_CAMP',			'SNAPSHOT',					'ART_DEF_RESOURCE_TORTOISE',		'tortoise_camp_pl.fxsxml',		1,				null);
---------------------------------------------------------
INSERT INTO IconFontMapping 
			(IconName, 					IconFontTexture,			IconMapping)
VALUES		('ICON_RES_TERN', 			'MORE_WONDERS_FONT_ATLAS',	1),
			('ICON_RES_SYLVITE', 		'MORE_WONDERS_FONT_ATLAS',	2),
			('ICON_RES_TROPICAL_FISH', 	'MORE_WONDERS_FONT_ATLAS',	3),
			('ICON_RES_TORTOISE', 		'MORE_WONDERS_FONT_ATLAS',	4);
--------------------------------------------------------------