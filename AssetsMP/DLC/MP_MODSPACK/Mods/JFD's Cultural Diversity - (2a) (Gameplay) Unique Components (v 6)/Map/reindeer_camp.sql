--=======================================================================================================================
-- RESOURCES
--=======================================================================================================================
-- Removed columns
-- Resources: AITradeModifier, AIObjective, MinLandPercent, RandApp1, RandApp2, RandApp3, RandApp4,
-- Player, TilesPer, ConstAppearance, PlacementOrder, GroupRange, GroupRand, Normalize
INSERT OR REPLACE INTO Resources
	(Type,				Description,					Civilopedia,							Help,								ResourceClassType,		ArtDefineTag,				AltArtDefineTag,	ArtDefineTagHeavy,	AltArtDefineTagHeavy,	TechReveal,	PolicyReveal,	TechCityTrade,	TechObsolete,	AIStopTradingEra,	Happiness,	WonderProductionMod,	WonderProductionModObsoleteEra, StartingResourceQuantity,	MinAreaSize,	MinLatitude,	MaxLatitude,	ResourceUsage,	PresentOnAllValidPlots, Area,	Hills,	Flatlands,	NoRiverSide,	OnlyMinorCivs,	IconString,			PortraitIndex,	IconAtlas) 
VALUES
	('RESOURCE_REINDEER',	'TXT_KEY_RESOURCE_REINDEER',	'TXT_KEY_CIV5_RESOURCE_REINDEER_TEXT',	'TXT_KEY_RESOURCE_REINDEER_HELP',	'RESOURCECLASS_BONUS',	'ART_DEF_RESOURCE_REINDEER',null,				null,				null,					'TECH_AGRICULTURE',	null,	'TECH_AGRICULTURE',null,			null,				0,			0,						null,							0,							3,				0,				90,				0,				0,						0,		0,		0,			0,				0,			'[ICON_RES_REINDEER]',	53,			'CD_ECONOMIC_ATLAS');

UPDATE Resources SET 
LandResource=1, 
AnimalResource=1,
TechImproveable = 'TECH_TRAPPING'
WHERE Type='RESOURCE_REINDEER';

INSERT OR REPLACE INTO IconFontTextures 
		(IconFontTexture, 			IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_REINDEER',	'Reindeer_Font');		
	
INSERT OR REPLACE INTO IconFontMapping 
	(IconName, 	IconFontTexture,	IconMapping)
VALUES	
	('ICON_RES_REINDEER',	'ICON_FONT_TEXTURE_REINDEER',	1);

INSERT OR REPLACE  INTO Resource_YieldChanges
	(ResourceType,	YieldType,  Yield) 
VALUES
	('RESOURCE_REINDEER',	'YIELD_FOOD',		2),
	('RESOURCE_REINDEER',	'YIELD_PRODUCTION',	1);

INSERT OR REPLACE  INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType, 		 YieldType, Yield)
SELECT	BuildingType, 	'RESOURCE_REINDEER', YieldType, Yield
FROM Building_ResourceYieldChanges WHERE ResourceType = 'RESOURCE_DEER';

INSERT OR REPLACE  INTO Building_ResourceYieldChangesGlobal
		(BuildingType, ResourceType, 		 YieldType, Yield)
SELECT	BuildingType, 	'RESOURCE_REINDEER', YieldType, Yield
FROM Building_ResourceYieldChangesGlobal WHERE ResourceType = 'RESOURCE_DEER';

UPDATE Language_en_US SET
Text = Text || '[NEWLINE]Nearby [ICON_RES_REINDEER] Reindeer: +1 [ICON_FOOD] Food.'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_SMOKEHOUSE');

INSERT OR REPLACE INTO Belief_ResourceYieldChanges
		(BeliefType,	ResourceType, 			YieldType, Yield)
SELECT	BeliefType,		'RESOURCE_REINDEER',	YieldType, Yield
FROM Belief_ResourceYieldChanges WHERE ResourceType = 'RESOURCE_DEER';

INSERT OR REPLACE INTO Policy_ResourceYieldChanges
		(PolicyType,	ResourceType, 			YieldType, Yield)
SELECT	PolicyType,		'RESOURCE_REINDEER',	YieldType, Yield
FROM Policy_ResourceYieldChanges WHERE ResourceType = 'RESOURCE_DEER';
--------------------------------------------
-- SQL TRIGGERS for strong compatibility
--------------------------------------------
CREATE TRIGGER Jar_Reindeer01
AFTER INSERT ON Building_ResourceYieldChanges WHEN (NEW.ResourceType ='RESOURCE_DEER')
BEGIN
	INSERT OR REPLACE  INTO Building_ResourceYieldChanges
			(BuildingType, 		ResourceType, YieldType, Yield)
	SELECT	NEW.BuildingType, 	'RESOURCE_REINDEER', NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_Reindeer02
AFTER INSERT ON Building_ResourceYieldChangesGlobal WHEN (NEW.ResourceType ='RESOURCE_DEER')
BEGIN
	INSERT OR REPLACE  INTO Building_ResourceYieldChangesGlobal
			(BuildingType, 		ResourceType, YieldType, Yield)
	SELECT	NEW.BuildingType, 	'RESOURCE_REINDEER', NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_Reindeer03
AFTER INSERT ON Belief_ResourceYieldChanges WHEN (NEW.ResourceType ='RESOURCE_DEER')
BEGIN
	INSERT OR REPLACE  INTO Belief_ResourceYieldChanges
			(BeliefType, ResourceType, YieldType, Yield)
	SELECT	NEW.BeliefType, 'RESOURCE_REINDEER', NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_Reindeer04
AFTER INSERT ON Policy_ResourceYieldChanges WHEN (NEW.ResourceType ='RESOURCE_DEER')
BEGIN
	INSERT OR REPLACE  INTO Policy_ResourceYieldChanges
			(PolicyType, ResourceType, YieldType, Yield)
	SELECT	NEW.PolicyType, 'RESOURCE_REINDEER', NEW.YieldType, NEW.Yield;
END;
--==========================================================================================================================
-- BUILDS
--==========================================================================================================================
INSERT OR REPLACE INTO Builds		
	(Type,			PrereqTech,	ImprovementType, 	Description, 							Help, 	
	Recommendation, 	Time, 		EntityEvent, 		OrderPriority, 	IconIndex, 	IconAtlas, ShowInTechTree, ShowInPedia)
SELECT 	
	'BUILD_CAMP_REINDEER',	PrereqTech,	'IMPROVEMENT_CAMP_REINDEER', 	'TXT_KEY_BUILD_CAMP_REINDEER', 'TXT_KEY_BUILD_CAMP_REINDEER_HELP',	
	'TXT_KEY_BUILD_CAMP_REINDEER_REC',	Time, EntityEvent, 90,	61, 	'CD_ECONOMIC_ATLAS', 0, 0
FROM Builds WHERE Type = 'BUILD_CAMP';

INSERT INTO BuildFeatures 
	(BuildType, FeatureType, PrereqTech, Time, Production, Remove)
VALUES
	('BUILD_CAMP_REINDEER', 'FEATURE_FOREST', 'TECH_MINING', 400, 40, 1);

--=======================================================================================================================
-- IMPROVEMENT
--=======================================================================================================================
INSERT OR REPLACE INTO Improvements
		(Type,							Description,							Civilopedia, 								Help,										ArtDefineTag,	ImprovementResource, ImprovementResourceQuantity,PillageGold,	IconAtlas,			PortraitIndex)
SELECT	'IMPROVEMENT_CAMP_REINDEER',	'TXT_KEY_IMPROVEMENT_CAMP_REINDEER',	'TXT_KEY_IMPROVEMENT_CAMP_REINDEER_TEXT',	'TXT_KEY_IMPROVEMENT_CAMP_REINDEER_HELP',	ArtDefineTag,	'RESOURCE_REINDEER',	 1,						 PillageGold,	'CD_ECONOMIC_ATLAS',	60
FROM Improvements  WHERE Type = 'IMPROVEMENT_CAMP';
UPDATE Improvements SET NoTwoAdjacent=1 WHERE Type='IMPROVEMENT_CAMP_REINDEER';

INSERT OR REPLACE INTO Improvement_ValidTerrains 	
		(ImprovementType,				TerrainType)
SELECT	'IMPROVEMENT_CAMP_REINDEER', 	'TERRAIN_TUNDRA' UNION ALL
SELECT	'IMPROVEMENT_CAMP_REINDEER', 	'TERRAIN_SNOW';

INSERT OR REPLACE INTO Improvement_ResourceTypes
(ImprovementType,				ResourceType,			ResourceMakesValid, ResourceTrade,	DiscoveryRand,	QuantityRequirement) 
VALUES
('IMPROVEMENT_CAMP_REINDEER',	'RESOURCE_REINDEER',	1,					1,				0,				0),
('IMPROVEMENT_CAMP',	'RESOURCE_REINDEER',	1,					1,				0,				0);


INSERT OR REPLACE  INTO Improvement_ResourceType_Yields
(ImprovementType,				ResourceType,			YieldType,			Yield) VALUES
('IMPROVEMENT_CAMP_REINDEER',	'RESOURCE_REINDEER',	'YIELD_CULTURE',	1),
('IMPROVEMENT_CAMP_REINDEER',	'RESOURCE_REINDEER',	'YIELD_FOOD',		1),
('IMPROVEMENT_CAMP',	'RESOURCE_REINDEER',	'YIELD_CULTURE',	1),
('IMPROVEMENT_CAMP',	'RESOURCE_REINDEER',	'YIELD_FOOD',		1);

INSERT OR REPLACE INTO Improvement_TechYieldChanges
		(ImprovementType,			TechType, YieldType, Yield)
SELECT 	'IMPROVEMENT_CAMP_REINDEER',TechType, YieldType, Yield
FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_CAMP';

INSERT OR REPLACE INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,			YieldType,	Yield)
SELECT	 PolicyType,	'IMPROVEMENT_CAMP_REINDEER',YieldType,	Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_CAMP';

INSERT OR REPLACE INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 			YieldType, Yield)
SELECT	 BeliefType,	'IMPROVEMENT_CAMP_REINDEER',YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_CAMP';

INSERT OR REPLACE INTO Building_ImprovementYieldChanges
		(BuildingType, ImprovementType, 			YieldType, Yield)
SELECT	BuildingType, 'IMPROVEMENT_CAMP_REINDEER', 	YieldType, Yield
FROM Building_ImprovementYieldChangesGlobal WHERE ImprovementType='IMPROVEMENT_CAMP';

INSERT OR REPLACE INTO Building_ImprovementYieldChangesGlobal
		(BuildingType, ImprovementType, 			YieldType, Yield)
SELECT	BuildingType, 'IMPROVEMENT_CAMP_REINDEER', 	YieldType, Yield
FROM Building_ImprovementYieldChangesGlobal WHERE ImprovementType='IMPROVEMENT_CAMP';
--------------------------------------------
-- SQL TRIGGERS for strong compatibility
--------------------------------------------
CREATE TRIGGER Jar_Reindeer05
AFTER INSERT ON Improvement_TechYieldChanges WHEN (NEW.ImprovementType ='IMPROVEMENT_CAMP')
BEGIN
	INSERT OR REPLACE  INTO Improvement_TechYieldChanges
			(ImprovementType, 			TechType, YieldType, Yield)
	SELECT	'IMPROVEMENT_CAMP_REINDEER', NEW.TechType, NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_Reindeer06
AFTER INSERT ON Policy_ImprovementYieldChanges WHEN (NEW.ImprovementType ='IMPROVEMENT_CAMP')
BEGIN
	INSERT OR REPLACE  INTO Policy_ImprovementYieldChanges
			(ImprovementType, 			PolicyType, YieldType, Yield)
	SELECT	'IMPROVEMENT_CAMP_REINDEER', NEW.PolicyType, NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_Reindeer07
AFTER INSERT ON Belief_ImprovementYieldChanges WHEN (NEW.ImprovementType ='IMPROVEMENT_CAMP')
BEGIN
	INSERT OR REPLACE  INTO Belief_ImprovementYieldChanges
			(ImprovementType, 			BeliefType, YieldType, Yield)
	SELECT	'IMPROVEMENT_CAMP_REINDEER', NEW.BeliefType, NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_Reindeer08
AFTER INSERT ON Building_ImprovementYieldChanges WHEN (NEW.ImprovementType ='IMPROVEMENT_CAMP')
BEGIN
	INSERT OR REPLACE  INTO Building_ImprovementYieldChanges
			(ImprovementType, 			BuildingType, YieldType, Yield)
	SELECT	'IMPROVEMENT_CAMP_REINDEER', NEW.BuildingType, NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_Reindeer09
AFTER INSERT ON Building_ImprovementYieldChangesGlobal WHEN (NEW.ImprovementType ='IMPROVEMENT_CAMP')
BEGIN
	INSERT OR REPLACE  INTO Building_ImprovementYieldChangesGlobal
			(ImprovementType, 			BuildingType, YieldType, Yield)
	SELECT	'IMPROVEMENT_CAMP_REINDEER', NEW.BuildingType, NEW.YieldType, NEW.Yield;
END;
--=======================================================================================================================
--=======================================================================================================================
