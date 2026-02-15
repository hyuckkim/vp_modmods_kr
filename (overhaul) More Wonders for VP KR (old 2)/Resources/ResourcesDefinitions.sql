--============================================--
-- ICONS ATLASES
--============================================--
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('RESOURCE_MORE_WONDERS_ATLAS', 	256, 		'More_Wonders_Resources_256.dds',		3, 				1),
			('RESOURCE_MORE_WONDERS_ATLAS', 	128, 		'More_Wonders_Resources_128.dds',		3, 				1),
			('RESOURCE_MORE_WONDERS_ATLAS', 	80, 		'More_Wonders_Resources_80.dds',		3, 				1),
			('RESOURCE_MORE_WONDERS_ATLAS', 	64, 		'More_Wonders_Resources_64.dds',		3, 				1),
			('RESOURCE_MORE_WONDERS_ATLAS', 	45, 		'More_Wonders_Resources_45.dds',		3, 				1),
			('RESOURCE_MORE_WONDERS_ATLAS', 	32, 		'More_Wonders_Resources_32.dds',		3,				1);	
--------------------------------------------------------------
INSERT INTO IconFontTextures 
			(IconFontTexture, 				IconFontTextureFile)
VALUES		('MORE_WONDERS_FONT_ATLAS', 	'More_Wonders_Resources_Font_22');
--============================================--
-- TEXTS
--============================================--			
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_RESOURCE_TERN',					'Tern Egg'),
			('TXT_KEY_RESOURCE_TERN_TEXT',				'TODO'),
			('TXT_KEY_RESOURCE_TERN_MONOPOLY',			'1 copy is granted by Ahu Tongariki World Wonder.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_PEACE] Faith in all owned Cities (tied to building).'),
			('TXT_KEY_RESOURCE_SYLVITE',				'Sylvite'),
			('TXT_KEY_RESOURCE_SYLVITE_TEXT',			'TODO'),
			('TXT_KEY_RESOURCE_SYLVITE_MONOPOLY',		'1 copy is granted by Dallol Natural Wonder.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] Promotion [COLOR_POSITIVE_TEXT]Explosive Mixture[ENDCOLOR] for owned [COLOR:255:230:85:255]Siege[ENDCOLOR] units (tied to dummy building). -5% [ICON_HAPPINESS_3][ICON_HAPPINESS_3] Boredom.'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH',			'Tropical Fish'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH_TEXT',		'TODO'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH_MONOPOLY',	'Can be spawned by Great Barrier Reed Natural Wonder.');
			
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_RESOURCE_TERN',					'제비갈매기 알'),
			('TXT_KEY_RESOURCE_TERN_TEXT',				'TODO'),
			('TXT_KEY_RESOURCE_TERN_MONOPOLY',			'아후 통가리키 불가사의에서 사본 1개를 부여합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] +10% [ICON_PEACE] 신앙 (모든 도시)(건물과 연결됨)'),
			('TXT_KEY_RESOURCE_SYLVITE',				'칼리암염'),
			('TXT_KEY_RESOURCE_SYLVITE_TEXT',			'TODO'),
			('TXT_KEY_RESOURCE_SYLVITE_MONOPOLY',		'댈롤 자연 경관에서 사본 1개를 부여합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 보유한 [COLOR:255:230:85:255]공성 유닛[ENDCOLOR]에 대해 [COLOR_POSITIVE_TEXT]폭발 혼합물[ENDCOLOR]승급을 부여합니다(더미 건물에 연결됨). -5% [ICON_HAPPINESS_3][ICON_HAPPINESS_3] 무료.'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH',			'열대어'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH_TEXT',		'TODO'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH_MONOPOLY',	'일부 자연 경관 근처에서 등장합니다.');
--=====================================================--
-- RESURCES
---------------------------------------------------------
-- Tern Egg - added by Ahu Tongariki WW
-- Sylvite - added by Dallol NW
-- Tropical Fish - added by Great Barrier Reef NW
--=====================================================--
INSERT INTO Resources 
			(Type,						TechReveal,			TechCityTrade, 		Description,						Civilopedia, 							Help,										ResourceClassType, 			IsMonopoly, 	ArtDefineTag, 						CivilizationType,		OnlyMinorCivs,  Happiness,  ResourceUsage,	IconString, 				PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_TERN',			null,				'TECH_PHYSICS',		'TXT_KEY_RESOURCE_TERN',			'TXT_KEY_RESOURCE_TERN_TEXT',			'TXT_KEY_RESOURCE_TERN_MONOPOLY',			'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_TERN',			null,					0,				2,			2,				'[ICON_RES_TERN]',			0, 				'RESOURCE_MORE_WONDERS_ATLAS'),
			('RESOURCE_SYLVITE',		null,				'TECH_MINING',		'TXT_KEY_RESOURCE_SYLVITE',			'TXT_KEY_RESOURCE_SYLVITE_TEXT',		'TXT_KEY_RESOURCE_SYLVITE_MONOPOLY',		'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_SYLVITE',			null,					0,				2,			2,				'[ICON_RES_SYLVITE]',		1, 				'RESOURCE_MORE_WONDERS_ATLAS'),
			('RESOURCE_TROPICAL_FISH',	'TECH_SAILING',		'TECH_SAILING',		'TXT_KEY_RESOURCE_TROPICAL_FISH',	'TXT_KEY_RESOURCE_TROPICAL_FISH_TEXT',	'TXT_KEY_RESOURCE_TROPICAL_FISH_MONOPOLY',	'RESOURCECLASS_BONUS',		0,				'ART_DEF_RESOURCE_TROPICAL_FISH',	null,					0,				0,			0,				'[ICON_RES_TROPICAL_FISH]',	2, 				'RESOURCE_MORE_WONDERS_ATLAS');
---------------------------------------------------------
INSERT INTO Resource_YieldChanges
			(ResourceType, 				YieldType, 			Yield)
VALUES		('RESOURCE_TROPICAL_FISH',	'YIELD_FOOD',		1),
			('RESOURCE_TROPICAL_FISH',	'YIELD_CULTURE',	1);

INSERT INTO Improvement_ResourceTypes
			(ImprovementType,				ResourceType, 				ResourceMakesValid, ResourceTrade)
VALUES		('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_TROPICAL_FISH',	1,					1);

INSERT INTO Improvement_ResourceType_Yields
			(ImprovementType,				ResourceType, 				YieldType, 			Yield)
VALUES		('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_TROPICAL_FISH',	'YIELD_FOOD',		2),
			('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_TROPICAL_FISH',	'YIELD_CULTURE',	1);
---------------------------------------------------------
INSERT INTO Resource_Flavors 	
			(ResourceType, 				FlavorType, 			Flavor)
VALUES		('RESOURCE_TERN',			'FLAVOR_GROWTH',		10),
			('RESOURCE_TERN',			'FLAVOR_RELIGION',		50),
			('RESOURCE_SYLVITE',		'FLAVOR_PRODUCTION',	20),
			('RESOURCE_SYLVITE',		'FLAVOR_CULTURE',		30),
			('RESOURCE_TROPICAL_FISH',	'FLAVOR_GROWTH',		10),
			('RESOURCE_TROPICAL_FISH',	'FLAVOR_CULTURE',		30);
---------------------------------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 				TileType, 		Asset)
VALUES 		('ART_DEF_RESOURCE_TERN', 			'Resource', 	'sv_Tern_Egg.dds'),
			('ART_DEF_RESOURCE_SYLVITE',		'Resource', 	'sv_Sylvite.dds'),
			('ART_DEF_RESOURCE_TROPICAL_FISH', 	'Resource', 	'sv_Tropical_Fish.dds');

INSERT INTO ArtDefine_LandmarkTypes
			(Type, 								LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_RESOURCE_TERN', 			'Resource', 	'Tern Egg'),
			('ART_DEF_RESOURCE_SYLVITE', 		'Resource', 	'Sylvite'),
			('ART_DEF_RESOURCE_TROPICAL_FISH', 	'Resource', 	'Tropical Fish');

INSERT INTO ArtDefine_Landmarks
			(Era,	State,	Scale,	ImprovementType,	LayoutHandler,	ResourceType,						Model,					TerrainContour,	Tech) 
SELECT		Era,	State,	Scale,	ImprovementType,	LayoutHandler,	'ART_DEF_RESOURCE_TROPICAL_FISH',	'fish_tropical.fxsxml', TerrainContour,	Tech
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_FISH' AND Era = 'Ancient';

INSERT INTO ArtDefine_Landmarks
			(Era,	State,	Scale,	ImprovementType,	LayoutHandler,	ResourceType,						Model,								TerrainContour,	Tech) 
SELECT		Era,	State,	Scale,	ImprovementType,	LayoutHandler,	'ART_DEF_RESOURCE_TROPICAL_FISH',	'fish_tropical_industrial.fxsxml',	TerrainContour,	Tech
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_FISH' AND Era = 'Industrial';
---------------------------------------------------------
INSERT INTO IconFontMapping 
			(IconName, 					IconFontTexture,			IconMapping)
VALUES		('ICON_RES_TERN', 			'MORE_WONDERS_FONT_ATLAS',	1),
			('ICON_RES_SYLVITE', 		'MORE_WONDERS_FONT_ATLAS',	2),
			('ICON_RES_TROPICAL_FISH', 	'MORE_WONDERS_FONT_ATLAS',	3);
--------------------------------------------------------------