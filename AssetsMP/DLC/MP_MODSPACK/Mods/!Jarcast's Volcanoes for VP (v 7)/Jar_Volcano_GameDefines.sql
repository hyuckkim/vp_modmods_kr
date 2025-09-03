--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
INSERT INTO COMMUNITY
		(Type,							Value)
VALUES	('JAR_VOLCANOES_PERCENT',		10), -- the higher the more volcanoes around
		('JAR_VOLCANOES_MINDISTANCE',	7);  -- minimum tile distance between Volcanoes
--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';
--=======================================================================================================================
-- VP FIXES
--=======================================================================================================================
-- additional combat classes for promotions
INSERT OR REPLACE INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_UNITCOMBAT_SPECIAL_PEOPLE',		'Great People'),
			('TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST',		'Archaeologists');

INSERT OR REPLACE INTO UnitCombatInfos 
			(Type,							Description) 
VALUES		('UNITCOMBAT_SPECIAL_PEOPLE',	'TXT_KEY_UNITCOMBAT_SPECIAL_PEOPLE'),
			('UNITCOMBAT_ARCHAEOLOGIST',	'TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST');

UPDATE Units SET CombatClass = 'UNITCOMBAT_ARCHAEOLOGIST'	WHERE Type ='UNIT_ARCHAEOLOGIST';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SPECIAL_PEOPLE'	WHERE Special ='SPECIALUNIT_PEOPLE';
--======================================================================================================================
-- Features
--======================================================================================================================
INSERT INTO Features
(Type,					Description,				Civilopedia,					ArtDefineTag,					SeeThrough, TurnDamage,	OccurrenceFrequency,	NoAdjacent,	Impassable,	NoCity,	NoImprovement,	Rough,	PortraitIndex,	IconAtlas) VALUES
('FEATURE_VOLCANO_NEW',	'TXT_FEATURE_VOLCANO_NEW',	'TXT_FEATURE_VOLCANO_NEW_TEXT', 'ART_DEF_FEATURE_VOLCANO_NEW',	2,			30,			1,						1,			1,			1,		1,				1,		0,				'JAR_VOLCANO_ATLAS');

ALTER TABLE Features ADD COLUMN 'IsVolcano' BOOLEAN DEFAULT 0;
UPDATE Features SET IsVolcano=1 WHERE Type IN ('FEATURE_VOLCANO_NEW','FEATURE_VOLCANO','FEATURE_FUJI','FEATURE_KILIMANJARO');
UPDATE Features SET IsVolcano=1 WHERE Type ='FEATURE_MT_PAEKTU' AND EXISTS (SELECT * FROM Features WHERE Type = 'FEATURE_MT_PAEKTU');
UPDATE Features SET IsVolcano=1 WHERE Type ='FEATURE_DALLOL' AND EXISTS (SELECT * FROM Features WHERE Type = 'FEATURE_DALLOL');
--======================================================================================================================
-- BUILDINGS
--======================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO BuildingClasses
(DefaultBuilding, 					Type,									Description) VALUES
('BUILDING_OBSIDIAN_WORKS',			'BUILDINGCLASS_OBSIDIAN_WORKS',			'TXT_KEY_BUILDING_OBSIDIAN_WORKS'),
('BUILDING_VOLCANO_OBSERVATORY',	'BUILDINGCLASS_VOLCANO_OBSERVATORY',	'TXT_KEY_BUILDING_VOLCANO_OBSERVATORY'),
('BUILDING_JAR_POMPEII',			'BUILDINGCLASS_JAR_POMPEII',			'TXT_KEY_BUILDING_JAR_POMPEII'),
('BUILDING_JAR_TONGARIRO',			'BUILDINGCLASS_JAR_TONGARIRO',			'TXT_KEY_BUILDING_JAR_TONGARIRO');
UPDATE BuildingClasses SET MaxGlobalInstances =1 WHERE Type IN ('BUILDINGCLASS_JAR_TONGARIRO','BUILDINGCLASS_JAR_POMPEII');

INSERT INTO Civilization_BuildingClassOverrides
(CivilizationType, BuildingClassType) VALUES
('CIVILIZATION_BARBARIAN',	'BUILDINGCLASS_JAR_POMPEII'),
('CIVILIZATION_MINOR',		'BUILDINGCLASS_JAR_POMPEII'),
('CIVILIZATION_BARBARIAN',	'BUILDINGCLASS_JAR_TONGARIRO'),
('CIVILIZATION_MINOR',		'BUILDINGCLASS_JAR_TONGARIRO');
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Buildings
		(Type, 							BuildingClass, 							PrereqTech, 				Cost,	GoldMaintenance,	HurryCostModifier,	SpecialistType,			SpecialistCount,	GreatPeopleRateChange,	 Description, 							Civilopedia, 									Strategy, 											Help, 											MinAreaSize, ConquestProb, ArtDefineTag, IconAtlas, 		PortraitIndex)
SELECT	'BUILDING_VOLCANO_OBSERVATORY',	'BUILDINGCLASS_VOLCANO_OBSERVATORY',	'TECH_SCIENTIFIC_THEORY',	900,	4,					-20,				'SPECIALIST_SCIENTIST',	1,					2,						'TXT_KEY_BUILDING_VOLCANO_OBSERVATORY',	'TXT_KEY_BUILDING_VOLCANO_OBSERVATORY_PEDIA',	'TXT_KEY_BUILDING_VOLCANO_OBSERVATORY_STRATEGY',	'TXT_KEY_BUILDING_VOLCANO_OBSERVATORY_HELP',	MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_VOLCANO_ATLAS', 2	FROM Buildings WHERE Type='BUILDING_OBSERVATORY' UNION ALL
SELECT	'BUILDING_OBSIDIAN_WORKS',		'BUILDINGCLASS_OBSIDIAN_WORKS',			'TECH_MASONRY',				85,		1,					-20,				'SPECIALIST_SCIENTIST',	0,					1,						'TXT_KEY_BUILDING_OBSIDIAN_WORKS',		'TXT_KEY_BUILDING_OBSIDIAN_WORKS_PEDIA',		'TXT_KEY_BUILDING_OBSIDIAN_WORKS_STRATEGY',			'TXT_KEY_BUILDING_OBSIDIAN_WORKS_HELP',			MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_VOLCANO_ATLAS', 1	FROM Buildings WHERE Type='BUILDING_STONE_WORKS';

UPDATE Buildings SET PrereqTech='TECH_HAFTING', Cost=50, GoldMaintenance=0
WHERE Type = 'BUILDING_OBSIDIAN_WORKS' AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_HAFTING');

CREATE TRIGGER IF NOT EXISTS JarVolcanoObsWorks AFTER INSERT ON Technologies
WHEN NEW.Type = 'TECH_HAFTING'
BEGIN
	UPDATE Buildings SET PrereqTech='TECH_HAFTING', Cost=50, GoldMaintenance=0, SpecialistType=NULL, GreatPeopleRateChange=0
	WHERE Type = 'BUILDING_OBSIDIAN_WORKS';
END;

INSERT INTO Buildings			
		(Type, 						BuildingClass, 			  		PrereqTech,			Cost,	 Help,									Description, 						Civilopedia,							Quote,									IconAtlas,				WonderSplashImage,			WonderSplashAudio,					PortraitIndex,	NukeImmune, ConquestProb)
SELECT	'BUILDING_JAR_POMPEII',		'BUILDINGCLASS_JAR_POMPEII', 	'TECH_ARCHAEOLOGY',	1300, 	'TXT_KEY_BUILDING_JAR_POMPEII_HELP',	'TXT_KEY_BUILDING_JAR_POMPEII', 	'TXT_KEY_BUILDING_JAR_POMPEII_PEDIA',	'TXT_KEY_BUILDING_JAR_POMPEII_QUOTE',	'JAR_VOLCANO_ATLAS',	'Jar_Pompeii_splash.dds',	'AS2D_WONDER_SPEECH_JAR_POMPEII',	3,				1,			0 UNION ALL
SELECT	'BUILDING_JAR_TONGARIRO',	'BUILDINGCLASS_JAR_TONGARIRO', 	'TECH_BIOLOGY',		1550, 	'TXT_KEY_BUILDING_JAR_TONGARIRO_HELP',	'TXT_KEY_BUILDING_JAR_TONGARIRO', 	'TXT_KEY_BUILDING_JAR_TONGARIRO_PEDIA',	'TXT_KEY_BUILDING_JAR_TONGARIRO_QUOTE',	'JAR_VOLCANO_ATLAS',	'Jar_Tongariro_splash.dds',	'AS2D_WONDER_SPEECH_JAR_TONGARIRO',	4,				1,			0;

UPDATE Buildings SET GreatWorkCount=1, GreatWorkSlotType='GREAT_WORK_SLOT_ART_ARTIFACT', FreeGreatWork='GREAT_WORK_POMPEII_RUINS'
WHERE Type='BUILDING_JAR_POMPEII';
------------------------------------------------------------------------------------------------------------------------
-- GreatWorks
------------------------------------------------------------------------------------------------------------------------
INSERT INTO GreatWorks
		(Type,							GreatWorkClassType,	Description,						Audio,							Image)
VALUES	('GREAT_WORK_POMPEII_RUINS',	'GREAT_WORK_ART',	'TXT_KEY_GREAT_WORK_POMPEII_RUINS',	'AS2D_GREAT_ARTIST_ARTWORK',	'VillaMisteriAffresco.dds');
------------------------------------------------------------------------------------------------------------------------
-- Building_ImprovementYieldChangesGlobal
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ImprovementYieldChangesGlobal
		(BuildingType, ImprovementType, YieldType, Yield)
SELECT	'BUILDING_JAR_POMPEII', Type,	'YIELD_GOLDEN_AGE_POINTS',1	FROM Improvements WHERE CreatedByGreatPerson = 1 UNION ALL
SELECT	'BUILDING_JAR_POMPEII', Type,	'YIELD_CULTURE',2	FROM Improvements WHERE CreatedByGreatPerson = 1;

CREATE TRIGGER IF NOT EXISTS JarWonderPompeii AFTER INSERT ON Improvements
WHEN NEW.CreatedByGreatPerson = 1
BEGIN
	INSERT INTO Building_ImprovementYieldChangesGlobal
			(BuildingType, 			ImprovementType, YieldType, Yield)
	SELECT	'BUILDING_JAR_POMPEII', NEW.Type,	'YIELD_GOLDEN_AGE_POINTS',1	UNION ALL
	SELECT	'BUILDING_JAR_POMPEII', NEW.Type,	'YIELD_CULTURE',2;
END;
------------------------------------------------------------------------------------------------------------------------
-- Policies
------------------------------------------------------------------------------------------------------------------------
INSERT INTO	Policies
(Type, 						Description, 					IsDummy) VALUES
('POLICY_JAR_POMPEII',		'TXT_KEY_BUILDING_JAR_POMPEII',		1),
('POLICY_JAR_TONGARIRO',	'TXT_KEY_BUILDING_JAR_TONGARIRO',	1);

INSERT INTO Policy_FreePromotions
(PolicyType, 			PromotionType) VALUES
('POLICY_JAR_POMPEII', 'PROMOTION_JAR_POMPEII');

INSERT INTO Policy_FeatureYieldChanges
(PolicyType, 			FeatureType, 		YieldType, Yield) VALUES
('POLICY_JAR_TONGARIRO', 'FEATURE_FOREST', 'YIELD_FAITH', 2),
('POLICY_JAR_TONGARIRO', 'FEATURE_JUNGLE', 'YIELD_FAITH', 2),
('POLICY_JAR_TONGARIRO', 'FEATURE_FOREST', 'YIELD_GOLDEN_AGE_POINTS', 2),
('POLICY_JAR_TONGARIRO', 'FEATURE_JUNGLE', 'YIELD_GOLDEN_AGE_POINTS', 2);
------------------------------------------------------------------------------------------------------------------------
-- Building_LocalFeatureOrs
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_LocalFeatureOrs 
		(BuildingType,					FeatureType) 
SELECT	'BUILDING_JAR_POMPEII',			Type FROM Features WHERE IsVolcano=1 UNION ALL
SELECT	'BUILDING_OBSIDIAN_WORKS',		Type FROM Features WHERE IsVolcano=1 UNION ALL
SELECT	'BUILDING_VOLCANO_OBSERVATORY',	Type FROM Features WHERE IsVolcano=1;
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Building_Flavors
		(BuildingType,					FlavorType,			Flavor)
SELECT	'BUILDING_OBSIDIAN_WORKS',		'FLAVOR_SCIENCE', 	20 UNION ALL
SELECT	'BUILDING_OBSIDIAN_WORKS',		'FLAVOR_PRODUCTION',20 UNION ALL
SELECT	'BUILDING_OBSIDIAN_WORKS',		'FLAVOR_HAPPINESS', 5 UNION ALL
SELECT	'BUILDING_JAR_POMPEII',			'FLAVOR_GOLD', 		15 UNION ALL
SELECT	'BUILDING_JAR_POMPEII',			'FLAVOR_CULTURE', 	45 UNION ALL
SELECT	'BUILDING_JAR_POMPEII',			'FLAVOR_ARCHAEOLOGY', 15 UNION ALL
SELECT	'BUILDING_JAR_POMPEII',			'FLAVOR_SCIENCE', 	15 UNION ALL
SELECT	'BUILDING_JAR_POMPEII',			'FLAVOR_HAPPINESS', 15 UNION ALL
SELECT	'BUILDING_JAR_POMPEII',			'FLAVOR_WONDER', 	20 UNION ALL
SELECT	'BUILDING_JAR_TONGARIRO',		'FLAVOR_RELIGION', 	50 UNION ALL
SELECT	'BUILDING_JAR_TONGARIRO',		'FLAVOR_HAPPINESS', 50 UNION ALL
SELECT	'BUILDING_JAR_TONGARIRO',		'FLAVOR_CULTURE', 	25 UNION ALL
SELECT	'BUILDING_JAR_TONGARIRO',		'FLAVOR_WONDER', 	20 UNION ALL
SELECT	'BUILDING_VOLCANO_OBSERVATORY',	'FLAVOR_SCIENCE', 	35;
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges
(BuildingType, 					YieldType, 		Yield) VALUES
('BUILDING_JAR_TONGARIRO',		'YIELD_TOURISM', 3),
('BUILDING_JAR_TONGARIRO',		'YIELD_CULTURE', 2),
('BUILDING_JAR_TONGARIRO',		'YIELD_FAITH', 	 2),
('BUILDING_JAR_TONGARIRO',		'YIELD_SCIENCE', 2),
('BUILDING_JAR_POMPEII',		'YIELD_TOURISM', 5),
('BUILDING_JAR_POMPEII',		'YIELD_CULTURE', 2),
('BUILDING_JAR_POMPEII',		'YIELD_SCIENCE', 2),
('BUILDING_JAR_POMPEII',		'YIELD_GOLDEN_AGE_POINTS', 2),
('BUILDING_OBSIDIAN_WORKS', 	'YIELD_SCIENCE', 	1),
('BUILDING_OBSIDIAN_WORKS', 	'YIELD_PRODUCTION', 1),
('BUILDING_VOLCANO_OBSERVATORY','YIELD_SCIENCE', 	6);
------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingClassYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Building_BuildingClassYieldChanges
(BuildingType, 				BuildingClassType,		YieldType, 	YieldChange) VALUES
('BUILDING_JAR_TONGARIRO',	'BUILDINGCLASS_GARDEN','YIELD_TOURISM',	2),
('BUILDING_JAR_TONGARIRO',	'BUILDINGCLASS_GARDEN','YIELD_GOLDEN_AGE_POINTS',	2);
------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceYieldChanges
		(BuildingType, 				ResourceType, 		YieldType, 		Yield)
SELECT	'BUILDING_OBSIDIAN_WORKS', 'RESOURCE_OBSIDIAN',	'YIELD_PRODUCTION', 2;
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldPerXFeatureTimes100
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldPerXFeatureTimes100
		(BuildingType,					FeatureType,			YieldType,		Yield)
SELECT	BuildingType,					'FEATURE_VOLCANO_NEW',	YieldType,		Yield
FROM Building_YieldPerXTerrainTimes100 WHERE TerrainType ='TERRAIN_MOUNTAIN';

CREATE TRIGGER IF NOT EXISTS JarVolcanoComp1 AFTER INSERT ON Building_YieldPerXTerrainTimes100
WHEN NEW.TerrainType ='TERRAIN_MOUNTAIN'
BEGIN
	INSERT INTO Building_YieldPerXFeatureTimes100
			(BuildingType,		FeatureType,			YieldType,		Yield)
	SELECT	NEW.BuildingType,	'FEATURE_VOLCANO_NEW', 	NEW.YieldType,	NEW.Yield
	WHERE NOT EXISTS (SELECT 1 FROM Building_YieldPerXFeatureTimes100 WHERE BuildingType= NEW.BuildingType AND FeatureType='FEATURE_VOLCANO_NEW' AND YieldType=NEW.YieldType);
END;
------------------------------------------------------------------------------------------------------------------------
-- Policy_FeatureYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_FeatureYieldChanges
		(PolicyType,	FeatureType,			YieldType,Yield)
SELECT 	PolicyType, 	'FEATURE_VOLCANO_NEW', 	YieldType, Yield
FROM Policy_TerrainYieldChanges WHERE TerrainType ='TERRAIN_MOUNTAIN';

CREATE TRIGGER IF NOT EXISTS JarVolcanoComp2 AFTER INSERT ON Policy_TerrainYieldChanges
WHEN NEW.TerrainType ='TERRAIN_MOUNTAIN'
BEGIN
	INSERT INTO Policy_FeatureYieldChanges
					(PolicyType,	FeatureType,			YieldType,		Yield)
	SELECT DISTINCT	NEW.PolicyType,	'FEATURE_VOLCANO_NEW', 	NEW.YieldType,	NEW.Yield 
	WHERE NOT EXISTS (SELECT 1 FROM Policy_FeatureYieldChanges WHERE PolicyType= NEW.PolicyType AND FeatureType='FEATURE_VOLCANO_NEW' AND YieldType=NEW.YieldType);
END;
------------------------------------------------------------------------------------------------------------------------
-- Trait_FeatureYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trait_FeatureYieldChanges
		(TraitType,	FeatureType,			YieldType,Yield)
SELECT 	TraitType, 	'FEATURE_VOLCANO_NEW', 	YieldType, Yield
FROM Trait_TerrainYieldChanges WHERE TerrainType ='TERRAIN_MOUNTAIN';

CREATE TRIGGER IF NOT EXISTS JarVolcanoComp3 AFTER INSERT ON Trait_TerrainYieldChanges
WHEN NEW.TerrainType ='TERRAIN_MOUNTAIN'
BEGIN
	INSERT INTO Trait_FeatureYieldChanges
					(TraitType,		FeatureType,			YieldType,		Yield)
	SELECT DISTINCT	NEW.TraitType,	'FEATURE_VOLCANO_NEW', 	NEW.YieldType,	NEW.Yield
	WHERE NOT EXISTS (SELECT 1 FROM Trait_FeatureYieldChanges WHERE TraitType= NEW.TraitType AND FeatureType='FEATURE_VOLCANO_NEW' AND YieldType=NEW.YieldType);
END;
------------------------------------------------------------------------------------------------------------------------
-- Belief_CityYieldPerXFeatureTimes100
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_CityYieldPerXFeatureTimes100
		(BeliefType, 				FeatureType, 			YieldType, Yield)
SELECT 	'BELIEF_ONE_WITH_NATURE', 	'FEATURE_VOLCANO_NEW', 	YieldType, Yield
FROM Belief_CityYieldPerXTerrainTimes100 WHERE TerrainType ='TERRAIN_MOUNTAIN';

UPDATE Language_en_US SET Text = REPLACE(Text, 'for every 2 Mountains', 'for every 2 Mountains or Volcanoes')
WHERE Tag = 'TXT_KEY_BELIEF_ONE_WITH_NATURE';
--======================================================================================================================
-- UnitPromotions
--======================================================================================================================
INSERT INTO UnitPromotions 
(Type, 						Description, 					Help, 								Sound, 			LostWithUpgrade, OrderPriority, CannotBeChosen,	PortraitIndex, 	IconAtlas,		PediaType, 			PediaEntry) VALUES
('PROMOTION_JAR_POMPEII',	'TXT_KEY_PROMOTION_JAR_POMPEII',	'TXT_KEY_PROMOTION_JAR_POMPEII_HELP','AS2D_IF_LEVELUP',	0,				 0, 			1,			59, 			'ABILITY_ATLAS', 'PEDIA_CIVILIAN', 'TXT_KEY_PROMOTION_JAR_POMPEII');
UPDATE UnitPromotions SET MovesChange = 2 WHERE Type = 'PROMOTION_JAR_POMPEII';

INSERT INTO UnitPromotions_UnitCombats
(PromotionType, 			UnitCombatType) VALUES
('PROMOTION_JAR_POMPEII', 'UNITCOMBAT_ARCHAEOLOGIST');
--======================================================================================================================
-- RESOURCES
--======================================================================================================================
-- Resources
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Resources
		(Type, 					ResourceClassType,	Happiness, ResourceUsage, IsMonopoly, LandResource,	RockResource, 	Description,				 Civilopedia, 							Help,							ArtDefineTag,					IconString,				Hills,	Flatlands,	PortraitIndex,	IconAtlas)
SELECT	'RESOURCE_OBSIDIAN', 'RESOURCECLASS_LUXURY',Happiness, ResourceUsage, IsMonopoly, 1,			1,				'TXT_KEY_RESOURCE_OBSIDIAN','TXT_KEY_CIV5_RESOURCE_OBSIDIAN_TEXT','TXT_KEY_RESOURCE_OBSIDIAN_HELP',	'ART_DEF_RESOURCE_OBSIDIAN',	'[ICON_RES_OBSIDIAN]',	1,		1,			5,				'JAR_VOLCANO_ATLAS'
FROM Resources WHERE Type ='RESOURCE_WINE';

UPDATE Resources SET MinAreaSize = 3, MaxLatitude = 90
WHERE Type ='RESOURCE_OBSIDIAN';

INSERT OR REPLACE INTO Resource_Flavors 	
		(ResourceType,		 FlavorType, Flavor)
SELECT	'RESOURCE_OBSIDIAN', 'FLAVOR_HAPPINESS', 10;

INSERT OR REPLACE INTO Resource_YieldChanges
(ResourceType, 			YieldType, Yield) VALUES
('RESOURCE_OBSIDIAN', 'YIELD_PRODUCTION', 1);

INSERT OR REPLACE INTO Resource_FeatureBooleans
(ResourceType, 			FeatureType) VALUES
('RESOURCE_OBSIDIAN', 'FEATURE_FOREST'),
('RESOURCE_OBSIDIAN', 'FEATURE_JUNGLE'),
('RESOURCE_OBSIDIAN', 'FEATURE_MARSH');

INSERT OR REPLACE INTO Resource_FeatureTerrainBooleans
(ResourceType, TerrainType) VALUES
('RESOURCE_OBSIDIAN', 'TERRAIN_GRASS'),
('RESOURCE_OBSIDIAN', 'TERRAIN_PLAINS'),
('RESOURCE_OBSIDIAN', 'TERRAIN_DESERT'),
('RESOURCE_OBSIDIAN', 'TERRAIN_TUNDRA'),
('RESOURCE_OBSIDIAN', 'TERRAIN_SNOW');

INSERT OR REPLACE INTO Resource_MonopolyCombatModifiers
(ResourceType, 		IsGlobalMonopoly, IsStrategicMonopoly, Attack, Defense) VALUES
('RESOURCE_OBSIDIAN', 1,			 0, 					10, 0);

INSERT OR REPLACE INTO Improvement_ResourceTypes
		(ResourceType, ImprovementType)
SELECT	'RESOURCE_OBSIDIAN', 'IMPROVEMENT_QUARRY' UNION ALL
SELECT	'RESOURCE_OBSIDIAN', Type	FROM Improvements WHERE CreatedByGreatPerson = 1;

INSERT OR REPLACE INTO Improvement_ResourceType_Yields
(ImprovementType, 		ResourceType, 		YieldType, Yield) VALUES
('IMPROVEMENT_QUARRY', 'RESOURCE_OBSIDIAN', 'YIELD_SCIENCE', 2);
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
-- 0 Volcano, 1 ObsidianWorks, 2 V. Observatory, 3 Pompeii, 4 Tongariro, 5 ObsidianRes
INSERT INTO IconTextureAtlases 
		(Atlas, 				IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('JAR_VOLCANO_ATLAS', 	256, 		'Jar_Volcano_IconAtlas_256.dds',	3, 				2),
		('JAR_VOLCANO_ATLAS', 	128, 		'Jar_Volcano_IconAtlas_128.dds',	3, 				2),
		('JAR_VOLCANO_ATLAS', 	80, 		'Jar_Volcano_IconAtlas_80.dds',		3, 				2),
		('JAR_VOLCANO_ATLAS', 	64, 		'Jar_Volcano_IconAtlas_64.dds',		3, 				2),
		('JAR_VOLCANO_ATLAS', 	45, 		'Jar_Volcano_IconAtlas_45.dds',		3, 				2);
--==========================================================================================================================
-- FEATURE GRAPHICS
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
----------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type,	LandmarkType,	FriendlyName) VALUES
('ART_DEF_FEATURE_VOLCANO_NEW',			'Resource',		'Jar_Volcano');
----------------------------------------------------------
-- ArtDefine_StrategicView
----------------------------------------------------------
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset) VALUES
('ART_DEF_FEATURE_VOLCANO_NEW',			'Feature',	'SV_Krakatoa.dds');
----------------------------------------------------------
-- ArtDefine_Landmarks
----------------------------------------------------------
INSERT INTO ArtDefine_Landmarks
(Era, 	State, 	Scale,	ImprovementType,			LayoutHandler,	ResourceType,					Model,					TerrainContour) VALUES
('Any', 'Any',	0.75,	'ART_DEF_IMPROVEMENT_NONE',	'SNAPSHOT',		'ART_DEF_FEATURE_VOLCANO_NEW',	'feature_volcano_2.fxsxml',	1	);
--==========================================================================================================================
-- OBSIDIAN
--==========================================================================================================================
-- IconFontTextures
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_OBSIDIAN', 		'ObsidianFontIcon_22');
--------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 					IconFontTexture,					IconMapping)
VALUES	('ICON_RES_OBSIDIAN', 		'ICON_FONT_TEXTURE_OBSIDIAN',		1);
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_StrategicView 
		(StrategicViewType,				TileType,	Asset)
VALUES	('ART_DEF_RESOURCE_OBSIDIAN',	'Resource',	'SV_Obsidian.dds');
--------------------------------------------------------------------------------------------------------------------------		
-- ArtDefine_LandmarkTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_LandmarkTypes 
		(Type,							LandmarkType,	FriendlyName)
VALUES	('ART_DEF_RESOURCE_OBSIDIAN',	'Resource',		'Obsidian');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_Landmarks 
(Era,			State,					Scale,	ImprovementType,				LayoutHandler,	ResourceType,					Model,								TerrainContour, Tech) VALUES
('Any',			'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',		'SNAPSHOT',		'ART_DEF_RESOURCE_OBSIDIAN',	'Obsidian.fxsxml',					1,				null),
('Ancient',		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_QUARRY',	'SNAPSHOT',		'ART_DEF_RESOURCE_OBSIDIAN',	'HB_Anc_Obsidian_Quarry.fxsxml',	1,				null),
('Ancient',		'Constructed',			1,		'ART_DEF_IMPROVEMENT_QUARRY',	'SNAPSHOT',		'ART_DEF_RESOURCE_OBSIDIAN',	'Anc_Obsidian_Quarry.fxsxml',		1,				null),
('Ancient',		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_QUARRY',	'SNAPSHOT',		'ART_DEF_RESOURCE_OBSIDIAN',	'PL_Anc_Obsidian_Quarry.fxsxml',	1,				null),
('Industrial',	'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_QUARRY',	'SNAPSHOT',		'ART_DEF_RESOURCE_OBSIDIAN',	'HB_IND_Obsidian_Quarry.fxsxml',	1,				null),
('Industrial',	'Constructed',			1,		'ART_DEF_IMPROVEMENT_QUARRY',	'SNAPSHOT',		'ART_DEF_RESOURCE_OBSIDIAN',	'IND_Obsidian_Quarry.fxsxml',		1,				null),
('Industrial',	'Pillaged',				1,		'ART_DEF_IMPROVEMENT_QUARRY',	'SNAPSHOT',		'ART_DEF_RESOURCE_OBSIDIAN',	'PL_IND_Obsidian_Quarry.fxsxml',	1,				null);
--==========================================================================================================================
-- Audio_Sounds
--==========================================================================================================================
INSERT INTO Audio_Sounds (SoundID, Filename, LoadType) VALUES
('SND_WONDER_SPEECH_JAR_POMPEII', 	'Jar_Pompeii_audio', 'DynamicResident'),
('SND_WONDER_SPEECH_JAR_TONGARIRO', 'Jar_Tongariro_audio', 'DynamicResident');
--------------------------------------------------------------------------------------------------------------------------		
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Audio_2DSounds (ScriptID,SoundID,SoundType,TaperSoundtrackVolume,MinVolume,MaxVolume) VALUES
('AS2D_WONDER_SPEECH_JAR_POMPEII','SND_WONDER_SPEECH_JAR_POMPEII','GAME_MUSIC_STINGS',0.0,80,80),
('AS2D_WONDER_SPEECH_JAR_TONGARIRO','SND_WONDER_SPEECH_JAR_TONGARIRO','GAME_MUSIC_STINGS',0.0,80,80);
--======================================================================================================================
-- Language_en_US
--======================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text) VALUES
('TXT_FEATURE_VOLCANO_NEW', 'Volcano'),
('TXT_FEATURE_VOLCANO_NEW_TEXT', 'Volcanoes are awe-inspiring geological phenomena that result from the Earth''s internal heat and pressure. These majestic structures are typically found at the boundaries of tectonic plates, where magma from the Earth''s mantle rises to the surface. When pressure builds up beneath the Earth''s crust, it can lead to explosive volcanic eruptions, characterized by the release of ash, lava, and gases. Volcanic eruptions can vary greatly in intensity, from gentle effusive eruptions where lava flows steadily, to violent explosive eruptions that eject pyroclastic material at high speeds. The shape and behavior of a volcano depend on various factors, including the composition of the magma, the presence of gases, and the geological structure of the surrounding area. [NEWLINE][NEWLINE]Volcanoes play a crucial role in shaping the Earth''s surface and influencing global climate patterns. The lava and ash emitted during eruptions can create new landforms, such as lava plateaus, volcanic cones, and calderas. Over time, volcanic activity can build up entire mountain ranges, like the Cascade Range in the western United States or the Andes in South America. Additionally, volcanic ash and gases released into the atmosphere during eruptions can affect weather patterns and climate, with significant volcanic eruptions sometimes leading to short-term cooling of the Earth''s surface due to the reflection of sunlight by ash particles. Despite their potential for destruction, volcanoes also support unique ecosystems around the world, with many plants and animals adapted to thrive in the nutrient-rich soils produced by volcanic activity.'),
('TXT_KEY_BUILDING_VOLCANO_OBSERVATORY', 'Volcano Observatory'),
('TXT_KEY_BUILDING_VOLCANO_OBSERVATORY_HELP', 'Can only be built in a City with a [COLOR_CYAN]Volcano[ENDCOLOR] nearby.'),
('TXT_KEY_BUILDING_VOLCANO_OBSERVATORY_STRATEGY', 'The Volcano Observatory is an Industrial era building that increases [ICON_RESEARCH] Science output of Cities near Volcanoes.'),
('TXT_KEY_BUILDING_VOLCANO_OBSERVATORY_PEDIA', 'The history of volcanology traces back to ancient civilizations where volcanic eruptions were often perceived as acts of gods or mythical beings. Early observations of volcanic activity were primarily anecdotal, recorded in ancient texts and myths. One of the earliest documented eruptions is the eruption of Mount Vesuvius in 79 AD, which buried the Roman cities of Pompeii and Herculaneum. However, systematic scientific study of volcanoes began to emerge during the Renaissance period with advancements in natural philosophy and empirical observation. Early pioneers like Pliny the Elder in ancient Rome and the Icelandic scholar Jón Ólafsson made significant contributions to the understanding of volcanic phenomena through their observations and writings. [NEWLINE]The 18th and 19th centuries marked a turning point in the study of volcanology with the development of modern scientific methodologies and the establishment of volcano observatories. Notable figures such as Sir William Hamilton, who witnessed the eruptions of Mount Vesuvius in the late 18th century, and Sir Charles Lyell, whose work on geology laid the foundation for understanding volcanic processes, played pivotal roles in advancing the field. [NEWLINE][NEWLINE] The concept of volcano observatories emerged in the late 19th and early 20th centuries with the recognition of the need for systematic monitoring of volcanic phenomena. The earliest known observatory was established in Naples, Italy, in 1845, following the devastating eruption of Mount Vesuvius in 1822. This observatory, known as the Vesuvius Observatory, became one of the pioneering institutions for volcano monitoring, utilizing instruments such as seismographs and tiltmeters to track volcanic activity. [NEWLINE]The 20th century witnessed a significant expansion in the establishment of volcano observatories worldwide, particularly in regions prone to volcanic activity. The Hawaiian Volcano Observatory, founded in 1912 by Thomas A. Jaggar Jr., is another notable example. It played a critical role in monitoring the ongoing eruptions of Kilauea and Mauna Loa volcanoes, contributing immensely to our understanding of basaltic volcanism. Similarly, the establishment of the United States Geological Survey (USGS) Volcano Hazards Program in 1980 consolidated volcano monitoring efforts across the United States, leading to improved volcanic hazard assessment and emergency response.'),
('TXT_KEY_BUILDING_OBSIDIAN_WORKS', 'Obsidian Works'),
('TXT_KEY_BUILDING_OBSIDIAN_WORKS_HELP', 'Places 1 [ICON_RES_OBSIDIAN] Obsidian resource inside City range if possible. [NEWLINE][NEWLINE]Nearby [ICON_RES_OBSIDIAN] Obsidian: +2 [ICON_PRODUCTION] Production. [NEWLINE][NEWLINE]Can only be built in a City with a [COLOR_CYAN]Volcano[ENDCOLOR] nearby.'),
('TXT_KEY_BUILDING_OBSIDIAN_WORKS_STRATEGY', 'Obsidian Works provides [ICON_RES_OBSIDIAN] Obsidian and increase the [ICON_PRODUCTION] Production of the luxury resource.'),
('TXT_KEY_BUILDING_OBSIDIAN_WORKS_PEDIA', 'Obsidian processing has a rich history dating back thousands of years, spanning various cultures across the globe. Obsidian, a naturally occurring volcanic glass formed when molten lava cools rapidly, has been prized for its sharp edges and versatility. The earliest evidence of obsidian use dates back to the Paleolithic period, where it was utilized by early humans for crafting tools such as blades, arrowheads, and cutting implements due to its ability to fracture into extremely sharp edges. [NEWLINE][NEWLINE]Ancient civilizations such as the Aztecs, Maya, and Inca extensively used obsidian for tools, weapons, and religious artifacts. In Mesoamerica, obsidian played a particularly significant role in societal development, with sophisticated techniques developed for shaping and refining the material. Skilled artisans would carefully chip away at raw obsidian using percussion or pressure techniques to create precise shapes and edges. Obsidian artifacts have been found in archaeological sites throughout Central America, illustrating its importance in trade and cultural exchange. The legacy of obsidian processing continues today, with modern techniques enabling the creation of intricate artworks and scientific applications, while archaeological findings provide valuable insights into ancient technologies and trade networks.'),
('TXT_KEY_BUILDING_JAR_POMPEII', 'Pompeii'),
('TXT_KEY_BUILDING_JAR_POMPEII_HELP', '+2 [ICON_CULTURE] Culture, +1 [ICON_GOLDEN_AGE] Golden Age Point from all the Great Person Improvements in the Empire. [NEWLINE]All Archaeologist Units get [COLOR_POSITIVE_TEXT]Pompeian Alacrity[ENDCOLOR] promotion. [NEWLINE]Starts with [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]Villa of the Mysteries Fresco[ENDCOLOR] Great Work of Art. [NEWLINE]Can only be built in a City with a [COLOR_CYAN]Volcano[ENDCOLOR] nearby.'),
('TXT_KEY_BUILDING_JAR_POMPEII_PEDIA', 'Pompeii is an ancient Roman city near modern Naples in Italy that was buried under volcanic ash and pumice in the eruption of Mount Vesuvius in AD 79. The city was frozen in time, preserving a unique snapshot of life in the Roman Empire. Pompeii was a thriving urban center with an estimated population of around 11,000 people at the time of the eruption. It boasted elaborate villas, bustling marketplaces, and well-preserved public buildings such as temples, theaters, and bathhouses. [NEWLINE][NEWLINE]Today, Pompeii stands as one of the most important archaeological sites in the world, offering a remarkable insight into ancient Roman civilization. Excavations have unearthed remarkably preserved buildings, artifacts, and even the remains of inhabitants, providing invaluable information about daily life, architecture, art, and culture in antiquity. The site attracts millions of visitors annually who come to marvel at its well-preserved streets, frescoes, and mosaics, making it a UNESCO World Heritage Site and an enduring symbol of the power and unpredictability of nature.'),
('TXT_KEY_BUILDING_JAR_POMPEII_QUOTE', '[NEWLINE]"No catastrophe has ever yielded so much pleasure to the rest of humanity as that which buried Pompeii and Herculaneum."[NEWLINE] - Johann Wolfgang von Goethe[NEWLINE]'),
('TXT_KEY_GREAT_WORK_POMPEII_RUINS', 'Villa of the Mysteries Fresco'),
('TXT_KEY_PROMOTION_JAR_POMPEII', 'Pompeian Alacrity'),
('TXT_KEY_PROMOTION_JAR_POMPEII_HELP', '+2 [ICON_MOVES] Movement.'),
('TXT_KEY_BUILDING_JAR_TONGARIRO', 'Tongariro National Park'),
('TXT_KEY_BUILDING_JAR_TONGARIRO_HELP', '+2 [ICON_PEACE] Faith, +2 [ICON_GOLDEN_AGE] Golden Age Points from Forests and Jungles across the empire. [NEWLINE]All Gardens gain +2 [ICON_TOURISM] Tourism, +2 [ICON_GOLDEN_AGE] Golden Age Points. [NEWLINE]Can only be built in a City with a [COLOR_CYAN]Volcano[ENDCOLOR] nearby, and a [COLOR_CYAN]Forest[ENDCOLOR] or [COLOR_CYAN]Jungle[ENDCOLOR] nearby.'),
('TXT_KEY_BUILDING_JAR_TONGARIRO_PEDIA', 'Tongariro National Park, located in the central North Island of New Zealand, is the 6th oldest national park in the world, and a UNESCO World Heritage Site. Established in 1887, the park encompasses diverse landscapes, including active volcanoes, alpine meadows, and lush forests. Its most iconic features are the three active volcanoes: Mount Tongariro, Mount Ngauruhoe (famously known as Mount Doom from the Lord of the Rings films), and Mount Ruapehu, which is the highest peak in the North Island. These volcanoes have shaped the terrain with their eruptions and have cultural significance to the indigenous Maori people. [NEWLINE][NEWLINE]The park offers a wide range of outdoor activities, including hiking, skiing, snowboarding, and mountain biking. The Tongariro Alpine Crossing is one of the most popular day hikes in the world, taking visitors through dramatic landscapes of volcanic craters, emerald lakes, and steaming vents. The park is also rich in Maori cultural heritage, with sacred sites and legends intertwined with the land. Its breathtaking scenery, geological significance, and cultural importance make Tongariro National Park a must-visit destination for nature enthusiasts and adventurers alike.'),
('TXT_KEY_BUILDING_JAR_TONGARIRO_QUOTE', '[NEWLINE]"Whaia te iti kahurangi, ki te tuohu koe me he maunga teitei. [NEWLINE]Seek the treasure you value most dearly, if you bow your head, let it be to a lofty mountain."[NEWLINE] - Maori proverb[NEWLINE]'),
('TXT_KEY_RESOURCE_OBSIDIAN', 'Obsidian'),
('TXT_KEY_RESOURCE_OBSIDIAN_HELP', '[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] Units gain +10% [ICON_STRENGTH] Strength when attacking.'),
('TXT_KEY_CIV5_RESOURCE_OBSIDIAN_TEXT', 'Obsidian is a naturally occurring volcanic glass formed as an extrusive igneous rock. It was an important part of the material culture of Pre-Columbian Mesoamerica. Obsidian was a highly integrated part of daily and ritual life, and its widespread and varied use may be a significant contributor to Mesoamerica''s lack of metallurgy. Most notably, it was used to make macuahuitl, a wooden club with obsidian blades.');
--======================================================================================================================
--======================================================================================================================