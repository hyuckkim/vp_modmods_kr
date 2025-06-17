
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
------------------------------
-- IconTextureAtlases
------------------------------
-- INSERT INTO IconTextureAtlases 
-- 			(Atlas, 						IconSize, 	Filename,				IconsPerRow, 	IconsPerColumn)
-- VALUES		('RESOURCE_EGYPT_ATLAS',		256, 		'FlaxIcon_256.dds',		1, 				1),
-- 			('RESOURCE_EGYPT_ATLAS',		128, 		'FlaxIcon_128.dds',		1, 				1),
-- 			('RESOURCE_EGYPT_ATLAS',		80, 		'FlaxIcon_080.dds',		1, 				1),
-- 			('RESOURCE_EGYPT_ATLAS',		64, 		'FlaxIcon_064.dds',		1, 				1),
-- 			('RESOURCE_EGYPT_ATLAS',		45, 		'FlaxIcon_045.dds',		1, 				1),
-- 			('RESOURCE_EGYPT_ATLAS',		32, 		'FlaxIcon_032.dds',		1, 				1);
--==========================================================================================================================

--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
------------------------------
-- IconFontTextures
------------------------------
INSERT INTO IconFontTextures 
			(IconFontTexture, 					IconFontTextureFile)
VALUES		('FUTURE_ICON_FONT_TEXTURE', 		'FutureFontIcons');	
------------------------------
-- IconFontMapping
------------------------------
INSERT INTO IconFontMapping 
	(IconName, 				        IconFontTexture,						IconMapping)
VALUES	
    ('ICON_RES_NANOMAT', 		    'FUTURE_ICON_FONT_TEXTURE',				0),
    ('ICON_RES_IMPLANT', 		    'FUTURE_ICON_FONT_TEXTURE',				2),
    ('ICON_RES_ADN_FUNGUS', 		'FUTURE_ICON_FONT_TEXTURE',				4);

--==========================================================================================================================

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 								LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_RESOURCE_ADN_FUNGUS', 	'Resource', 	'ADN_FUNGUS');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks
			(Era, 			State, 					Scale, 	ImprovementType, 					LayoutHandler, 	ResourceType, 						Model, 										TerrainContour,	Tech)
VALUES 		('Any', 		'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',		'ART_DEF_RESOURCE_ADN_FUNGUS',		'resource_dye.fxsxml',						1,				null),
			('Ancient', 	'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_ADN_FUNGUS',		'FungalGrowth.fxsxml',		            	1,				null),
			('Ancient', 	'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_ADN_FUNGUS',		'FungalGrowth.fxsxml',				        1,				null),
			('Ancient', 	'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_ADN_FUNGUS',		'FungalGrowth.fxsxml',			            1,				null),
			('Industrial', 	'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_ADN_FUNGUS',		'FungalGrowth.fxsxml',			            1,				null),
			('Industrial', 	'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_ADN_FUNGUS',		'FungalGrowth.fxsxml',			           	1,				null),
			('Industrial', 	'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_ADN_FUNGUS',		'FungalGrowth.fxsxml',		             	1,				null);
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 				TileType, 		Asset)
VALUES 		('ART_DEF_RESOURCE_ADN_FUNGUS', 	'Resource', 	'sv_FungalGrowth.dds');
--==========================================================================================================================

--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
------------------------------
-- Resources  - ! Must be before improvements !
------------------------------
INSERT INTO Resources 
			(Type,					TechReveal,		    	TechCityTrade, 				Description,				    Civilopedia, 						 Help,	                                ResourceClassType, 		ArtDefineTag, 				   Happiness,  IconString, 		       	PortraitIndex, 	IconAtlas,				 AITradeModifier,	ResourceUsage, 	PlacementOrder, AIObjective, 	ConstAppearance, 	MinAreaSize, 	MaxLatitude, 	RandApp1, 	RandApp2, 	Player, Hills, 	Flatlands, 	IsMonopoly, MonopolyXPBonus)
VALUES		('RESOURCE_NANOMAT',	'TECH_NANOMATERIALS',	'TECH_NANOMATERIALS',		'TXT_KEY_RESOURCE_NANOMAT',	   'TXT_KEY_RESOURCE_NANOMAT_TEXT',	    'TXT_KEY_RESOURCE_NANOMAT_HELP',	   'RESOURCECLASS_MODERN',	'ART_DEF_RESOURCE_ALUMINUM',   0,		  '[ICON_RES_NANOMAT]',    	31,			 	'CIV_COLOR_ATLAS_FW_3',  10, 				1, 				1, 				1, 				100, 				3, 				90,		 		10, 		10, 		100,  	0,   	1, 			1, 			2);

INSERT INTO Resources 
			(Type,					TechReveal,		        TechCityTrade, 		        Description,					Civilopedia, 						 Help,	                                ResourceClassType, 		ArtDefineTag, 				  	Happiness,  IconString, 		    PortraitIndex, 	IconAtlas,  			AITradeModifier, 	ResourceUsage, 	PlacementOrder, AIObjective, 	ConstAppearance, 	MinAreaSize, 	MaxLatitude, 	RandApp1, 	RandApp2, 	Player, Hills, 	Flatlands, 	IsMonopoly, MonopolyXPBonus)
VALUES		('RESOURCE_ADN_FUNGUS',	'TECH_GEN_MANIP',		'TECH_GEN_MANIP',		   'TXT_KEY_RESOURCE_ADN_FUNGUS',	'TXT_KEY_RESOURCE_ADN_FUNGUS_TEXT',	 'TXT_KEY_RESOURCE_ADN_FUNGUS_HELP',	'RESOURCECLASS_RUSH',	'ART_DEF_RESOURCE_ADN_FUNGUS',  0,		  '[ICON_RES_ADN_FUNGUS]',  24,	          	'CIV_COLOR_ATLAS_FW',   10, 				1, 				1, 				1, 				100, 				3, 				90,		 		10, 		10, 		100,  	1, 		1, 			1, 			2);

INSERT INTO Resources 
			(Type,					TechReveal,		    	TechCityTrade, 				Description,					Civilopedia, 						 Help,	                            	ResourceClassType, 		ArtDefineTag, 				  	Happiness,	IconString, 		    PortraitIndex, 	IconAtlas, 				AITradeModifier, 	ResourceUsage, 	PlacementOrder, AIObjective, 	ConstAppearance, 	MinAreaSize, 	MaxLatitude, 	RandApp1, 	RandApp2, 	Player, Hills,	Flatlands,	IsMonopoly,	MonopolyXPBonus)
VALUES		('RESOURCE_IMPLANT',	'TECH_IMPLANTS',		'TECH_IMPLANTS',			'TXT_KEY_RESOURCE_IMPLANT',		'TXT_KEY_RESOURCE_IMPLANT_TEXT',	 'TXT_KEY_RESOURCE_IMPLANT_HELP',		'RESOURCECLASS_MODERN',	'ART_DEF_RESOURCE_ALUMINUM',  	0,			'[ICON_RES_IMPLANT]', 	31,			 	'CIV_COLOR_ATLAS_FW', 	10, 				1, 				1, 				1, 				100, 				3, 				90,		 		10, 		10, 		100, 	0,		1,			1,			2);

------------------------------
-- Resource_YieldChanges
------------------------------
INSERT INTO Resource_YieldChanges 	
	(ResourceType, 				YieldType, 			Yield)
VALUES	
    ('RESOURCE_ADN_FUNGUS',		'YIELD_CULTURE',		1),
    ('RESOURCE_ADN_FUNGUS',		'YIELD_SCIENCE',		1);

INSERT INTO Policy_ResourceYieldChanges
	(PolicyType, ResourceType, YieldType, Yield)
VALUES
	('POLICY_RATIONALISM', 'RESOURCE_ADN_FUNGUS', 'YIELD_SCIENCE', 3),
	('POLICY_RATIONALISM', 'RESOURCE_ADN_FUNGUS', 'YIELD_PRODUCTION', 2),
	('POLICY_RATIONALISM', 'RESOURCE_NANOMAT', 'YIELD_SCIENCE', 3),
	('POLICY_RATIONALISM', 'RESOURCE_NANOMAT', 'YIELD_PRODUCTION', 2);

-- INSERT INTO Resource_TerrainBooleans (ResourceType,	TerrainType)
-- SELECT 'RESOURCE_ADN_FUNGUS',							'TERRAIN_DESERT' UNION ALL
-- SELECT 'RESOURCE_ADN_FUNGUS',							'TERRAIN_TUNDRA' UNION ALL
-- SELECT 'RESOURCE_ADN_FUNGUS',							'TERRAIN_SNOW' UNION ALL
-- SELECT 'RESOURCE_ADN_FUNGUS',							'TERRAIN_GRASS' UNION ALL
-- SELECT 'RESOURCE_ADN_FUNGUS',							'TERRAIN_PLAINS';

INSERT INTO Resource_TerrainBooleans
	(ResourceType, TerrainType)
VALUES
	('RESOURCE_ADN_FUNGUS', 'TERRAIN_GRASS'),
	('RESOURCE_ADN_FUNGUS', 'TERRAIN_PLAINS');

INSERT INTO Resource_TerrainBooleans
	(ResourceType, TerrainType)
VALUES
	('RESOURCE_NANOMAT',    'TERRAIN_COAST'),
	('RESOURCE_NANOMAT',    'TERRAIN_OCEAN'),
	('RESOURCE_NANOMAT',    'TERRAIN_DESERT'),
	('RESOURCE_NANOMAT',    'TERRAIN_TUNDRA'),
	('RESOURCE_NANOMAT',    'TERRAIN_SNOW');

-- INSERT INTO Resource_FeatureBooleans (ResourceType,	FeatureType)
-- SELECT 'RESOURCE_ADN_FUNGUS',						'FEATURE_MARSH'          UNION ALL
-- SELECT 'RESOURCE_ADN_FUNGUS',						'FEATURE_FOREST'         UNION ALL
-- SELECT 'RESOURCE_ADN_FUNGUS',						'FEATURE_JUNGLE'         UNION ALL
-- SELECT 'RESOURCE_ADN_FUNGUS',						'FEATURE_FLOOD_PLAINS';

INSERT INTO Resource_FeatureBooleans
	(ResourceType, FeatureType)
VALUES
	('RESOURCE_ADN_FUNGUS', 'FEATURE_MARSH'),
	('RESOURCE_ADN_FUNGUS', 'FEATURE_FOREST'),
	('RESOURCE_ADN_FUNGUS', 'FEATURE_JUNGLE');

-- INSERT INTO Resource_FeatureTerrainBooleans (ResourceType,	TerrainType)
-- SELECT 'RESOURCE_ADN_FUNGUS',						'TERRAIN_DESERT'         UNION ALL
-- SELECT 'RESOURCE_ADN_FUNGUS',						'TERRAIN_TUNDRA'         UNION ALL
-- SELECT 'RESOURCE_ADN_FUNGUS',						'TERRAIN_SNOW'           UNION ALL
-- SELECT 'RESOURCE_ADN_FUNGUS',						'TERRAIN_GRASS'          UNION ALL
-- SELECT 'RESOURCE_ADN_FUNGUS',						'TERRAIN_PLAINS';



------------------------------
-- Resource_Flavors
------------------------------
INSERT INTO Resource_Flavors 	
        (ResourceType, 			FlavorType, 			Flavor)
VALUES		
        ('RESOURCE_NANOMAT',	'FLAVOR_OFFENSE',		15),
        ('RESOURCE_NANOMAT',	'FLAVOR_DEFENSE',		15),
        ('RESOURCE_ADN_FUNGUS',	'FLAVOR_SCIENCE',		10),
		('RESOURCE_ADN_FUNGUS',	'FLAVOR_CULTURE',		10),
		('RESOURCE_ADN_FUNGUS',	'FLAVOR_DEFENSE',		10),
		('RESOURCE_ADN_FUNGUS',	'FLAVOR_OFFENSE',		10),
		('RESOURCE_IMPLANT',	'FLAVOR_GOLD',			10),
		('RESOURCE_IMPLANT',	'FLAVOR_OFFENSE',		10),
        ('RESOURCE_IMPLANT',	'FLAVOR_DEFENSE',		10);

INSERT INTO Resource_QuantityTypes 
	(ResourceType, 		        Quantity)
VALUES	
	('RESOURCE_NANOMAT',            1),
    ('RESOURCE_ADN_FUNGUS', 		2),
    ('RESOURCE_ADN_FUNGUS', 		3),
    ('RESOURCE_ADN_FUNGUS', 		4);
        
--==========================================================================================================================

--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
------------------------------
-- Improvements
------------------------------
INSERT INTO Improvement_ResourceTypes
			(ResourceType, 			ImprovementType)
VALUES		('RESOURCE_ADN_FUNGUS',	'IMPROVEMENT_FW_FUNGAL_GROWTH'),
	        ('RESOURCE_NANOMAT',	'IMPROVEMENT_WELL');

------------------------------
-- Improvement_ResourceType_Yields
------------------------------
INSERT INTO Improvement_ResourceType_Yields
			(ResourceType, 			ImprovementType,			YieldType,			Yield)
VALUES	('RESOURCE_ADN_FUNGUS',	'IMPROVEMENT_FW_FUNGAL_GROWTH',	'YIELD_CULTURE',	2),
        ('RESOURCE_ADN_FUNGUS',	'IMPROVEMENT_FW_FUNGAL_GROWTH',	'YIELD_SCIENCE',	2),
		('RESOURCE_ADN_FUNGUS',	'IMPROVEMENT_FW_FUNGAL_GROWTH', 'YIELD_FOOD',		2),
		('RESOURCE_NANOMAT',	'IMPROVEMENT_WELL',	            'YIELD_SCIENCE',	3);

--==========================================================================================================================

--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================				
------------------------------
-- Building_ResourceYieldChanges
------------------------------		
-- INSERT INTO Building_ResourceYieldChanges
-- 			(BuildingType,					ResourceType,			YieldType,			Yield)
-- VALUES		('BUILDING_BURIAL_TOMB',		'RESOURCE_EGYPT_FLAX',	'YIELD_GOLD',		1),
-- 			('BUILDING_BURIAL_TOMB',		'RESOURCE_EGYPT_FLAX',	'YIELD_FAITH',	1),
-- 			('BUILDING_CARAVANSARY',		'RESOURCE_EGYPT_FLAX',	'YIELD_GOLD',		1),
-- 			('BUILDING_CARAVANSARY',		'RESOURCE_EGYPT_FLAX',	'YIELD_FAITH',	1);
--==========================================================================================================================
--==========================================================================================================================

--=======================================

INSERT INTO Resource_YieldChangeFromMonopoly
	(ResourceType, YieldType, Yield)
VALUES
	('RESOURCE_NANOMAT', 	'YIELD_PRODUCTION',  1),
	('RESOURCE_NANOMAT', 	'YIELD_SCIENCE', 	 1),
	('RESOURCE_ADN_FUNGUS', 'YIELD_CULTURE',	 1),
	('RESOURCE_ADN_FUNGUS', 'YIELD_SCIENCE', 	 1),
	('RESOURCE_IMPLANT', 	'YIELD_GOLD',	 	 1),
	('RESOURCE_IMPLANT', 	'YIELD_PRODUCTION',  1);

--=============================
-- RUSSIA Resource *2 (2023.09.22)
--=============================
INSERT INTO Trait_ResourceQuantityModifiers
	(TraitType, ResourceType, ResourceQuantityModifier)
VALUES
	('TRAIT_STRATEGIC_RICHES', 'RESOURCE_NANOMAT', 		100),
	('TRAIT_STRATEGIC_RICHES', 'RESOURCE_ADN_FUNGUS', 	100),
	('TRAIT_STRATEGIC_RICHES', 'RESOURCE_IMPLANT', 		100);

--=================
-- VP Panel
--=================

-- ���� ���ǵ� Helper ���̺��� ������ ����
DROP TABLE IF EXISTS Helper;

-- ���ο� Helper ���̺� ����
CREATE TEMP TABLE Helper (
    Priority INTEGER,
    ResourceType TEXT
);

-- Helper ���̺��� �� ����
INSERT INTO Helper
VALUES
    (1, 'RESOURCE_HORSE'),
    (2, 'RESOURCE_IRON'),
    (3, 'RESOURCE_COAL'),
    (4, 'RESOURCE_OIL'),
    (5, 'RESOURCE_ALUMINUM'),
    (6, 'RESOURCE_URANIUM'),
    (7, 'RESOURCE_PAPER'),
    (8, 'RESOURCE_ADN_FUNGUS'),
    (9, 'RESOURCE_NANOMAT'),
    (10,'RESOURCE_IMPLANT');

-- Resources ���̺� ������Ʈ
UPDATE Resources
SET StrategicPriority = (SELECT Priority FROM Helper WHERE ResourceType = Type)
WHERE EXISTS (SELECT 1 FROM Helper WHERE ResourceType = Type);

-- �ӽ� Helper ���̺� ����
DROP TABLE Helper;
