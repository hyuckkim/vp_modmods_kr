--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 									LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_IMPROVEMENT_INUIT_IGLOO', 	'Improvement', 	'INUIT_IGLOO');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.55,  'ART_DEF_IMPROVEMENT_INUIT_IGLOO', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'HB_Fort_MID.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed',       3.00,  'ART_DEF_IMPROVEMENT_INUIT_IGLOO', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'igloo.fxsxml',    1 UNION ALL
SELECT 'Any', 'Pillaged',          0.55,  'ART_DEF_IMPROVEMENT_INUIT_IGLOO', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'PL_Fort_MID.fxsxml', 1;
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 					TileType, 		Asset)
VALUES 		('ART_DEF_IMPROVEMENT_INUIT_IGLOO', 	'Improvement', 	'Igloo.dds');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 				IconsPerRow, 	IconsPerColumn)
VALUES	('IMPROVEMENT_IGLOO_ATLAS', 			256, 		'IglooIcon256.dds',			1, 				1),
		('IMPROVEMENT_IGLOO_ATLAS', 			64, 		'IglooIcon064.dds',			1, 				1),
		('IMPROVEMENT_IGLOO_ATLAS', 			45, 		'IglooIcon045.dds',			1, 				1),
		('IMPROVEMENT_IGLOO_ALPHA_ATLAS', 		256, 		'iglooAlpha256.dds',		1, 				1),
		('IMPROVEMENT_IGLOO_ALPHA_ATLAS', 		64, 		'iglooAlpha064.dds',		1, 				1),
		('IMPROVEMENT_IGLOO_ALPHA_ATLAS', 		45, 		'iglooAlpha045.dds',		1, 				1);
--==========================================================================================================================

--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
------------------------------
-- Improvements
------------------------------
INSERT INTO Improvements
			(Type,						GoldMaintenance,	Description,							Civilopedia,								Help, 									ArtDefineTag,						DestroyedWhenPillaged,	Permanent,	BuildableOnResources,	PortraitIndex,	IconAtlas)
VALUES		('IMPROVEMENT_INUIT_IGLOO',	0,					'TXT_KEY_IMPROVEMENT_INUIT_IGLOO',		'TXT_KEY_IMPROVEMENT_INUIT_IGLOO_TEXT',		'TXT_KEY_IMPROVEMENT_INUIT_IGLOO_HELP',	'ART_DEF_IMPROVEMENT_INUIT_IGLOO', 	0,						1,			0,						0,				'IMPROVEMENT_IGLOO_ATLAS');
------------------------------	
-- Improvement_ValidTerrains
------------------------------		
INSERT INTO Improvement_ValidTerrains 	
			(ImprovementType, 			TerrainType)
VALUES		('IMPROVEMENT_INUIT_IGLOO',	'TERRAIN_SNOW');
------------------------------	
-- Improvement_Yields
------------------------------		
INSERT INTO Improvement_Yields 	
			(ImprovementType, 				YieldType,				Yield)
VALUES		('IMPROVEMENT_INUIT_IGLOO',	'YIELD_GOLD',		1),
			('IMPROVEMENT_INUIT_IGLOO',	'YIELD_CULTURE',	2),
			('IMPROVEMENT_INUIT_IGLOO',	'YIELD_FOOD',		4);
------------------------------
-- Improvement_TechYieldChanges
------------------------------
INSERT INTO Improvement_TechYieldChanges
			(ImprovementType,				TechType,			YieldType,			Yield)
VALUES		('IMPROVEMENT_INUIT_IGLOO',		'TECH_RIFLING',		'YIELD_FOOD',		1),
			('IMPROVEMENT_INUIT_IGLOO',		'TECH_RIFLING',		'YIELD_CULTURE',	1);
--==========================================================================================================================
-- POLICY
--==========================================================================================================================				
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------		
INSERT INTO Policy_ImprovementYieldChanges
(PolicyType, ImprovementType, YieldType, Yield)
SELECT PolicyType, 'IMPROVEMENT_INUIT_IGLOO', YieldType, Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_ENCAMPMENT_SHOSHONE';

