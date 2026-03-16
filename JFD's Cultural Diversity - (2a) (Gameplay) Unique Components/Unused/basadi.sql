-- ======================================================================================================
-- UNIQUE TILE IMPROVEMENT
-- ======================================================================================================
-- ArtDefine_LandmarkTypes
--------------------------
INSERT INTO ArtDefine_LandmarkTypes
          (Type,                                LandmarkType,     FriendlyName)
VALUES    ('ART_DEF_IMPROVEMENT_THP_BASADI',    'Improvement',    'THP_BASADI');
----------------------
-- ArtDefine_Landmarks
----------------------
INSERT INTO ArtDefine_Landmarks
(Era,    State,                Scale,    ImprovementType,                    LayoutHandler,    ResourceType,            Model,                        TerrainContour)
SELECT    'Any', 'UnderConstruction', 0.8,    'ART_DEF_IMPROVEMENT_THP_BASADI',    'SNAPSHOT',        'ART_DEF_RESOURCE_ALL', 'Basadi_hb.fxsxml',        1 UNION ALL
SELECT    'Any', 'Constructed',        0.8,    'ART_DEF_IMPROVEMENT_THP_BASADI',    'SNAPSHOT',        'ART_DEF_RESOURCE_ALL', 'Basadi_main.fxsxml',    1 UNION ALL
SELECT    'Any', 'Pillaged',            0.8,    'ART_DEF_IMPROVEMENT_THP_BASADI',    'SNAPSHOT',        'ART_DEF_RESOURCE_ALL', 'Basadi_pl.fxsxml',    1;
--------------------------
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView
          (StrategicViewType,                        TileType,         Asset)
VALUES    ('ART_DEF_IMPROVEMENT_THP_BASADI',        'Improvement',    'sv_basadi.dds');

--=======================================================================================================
-- BUILDS
--=======================================================================================================
-- Builds
---------
INSERT INTO Builds
(Type,                                 PrereqTech,         ImprovementType,            Time,  Recommendation,                    Description,            Help,                              CtrlDown,    OrderPriority,    IconIndex, IconAtlas,              HotKey,    EntityEvent)
VALUES        ('BUILD_THP_BASADI',    NULL,    'IMPROVEMENT_THP_BASADI',    NULL, 'TXT_KEY_BUILD_THP_BASADI_REC', 'TXT_KEY_THP_BASADI',  'TXT_KEY_BUILD_THP_BASADI_HELP',    1,           98,               57,        'CD_ECONOMIC_ATLAS',    'KB_B',    'ENTITY_EVENT_BUILD');
----------------
-- BuildFeatures
----------------
INSERT INTO BuildFeatures
              (BuildType,              FeatureType, PrereqTech,        Time, Remove)
SELECT        ('BUILD_THP_BASADI'),    FeatureType, PrereqTech, Time, 0
FROM BuildFeatures WHERE BuildType = 'BUILD_HOLY_SITE';
--=======================================================================================================
-- IMPROVEMENTS
--=======================================================================================================
-- Improvements
---------------
INSERT INTO Improvements
(Type,                                     GoldMaintenance,    NoTwoAdjacent,    
Description,                       Civilopedia,                                    ArtDefineTag,                    
BuildableOnResources,    CreatedByGreatPerson, DestroyedWhenPillaged, ConnectsAllResources,    
PillageGold,    DefenseModifier,    PortraitIndex,    IconAtlas)
VALUES        
('IMPROVEMENT_THP_BASADI',     0,                1,                 
'TXT_KEY_IMPROVEMENT_THP_BASADI',  'TXT_KEY_IMPROVEMENT_THP_BASADI_TEXT',    'ART_DEF_IMPROVEMENT_THP_BASADI',    
1,          1,             0,                        1,
20,             0,                  49,                'CD_ECONOMIC_ATLAS');
------------------------------
-- Improvement_TechYieldChanges
------------------------------
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,			TechType, YieldType, Yield)
SELECT 	'IMPROVEMENT_THP_BASADI',	TechType, YieldType, Yield
FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE';
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,			YieldType,			Yield)
SELECT	 PolicyType,	'IMPROVEMENT_THP_BASADI',	YieldType,			Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE';
------------------------------
-- Belief_ImprovementYieldChanges
------------------------------	
INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 			YieldType, Yield)
SELECT	 BeliefType,	'IMPROVEMENT_THP_BASADI',	YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE';
----------------------------
-- Improvement_ValidTerrains
----------------------------
--INSERT INTO Improvement_ValidTerrains
--              (ImprovementType,                TerrainType)
--VALUES        ('IMPROVEMENT_THP_BASADI',      'TERRAIN_HILL');

