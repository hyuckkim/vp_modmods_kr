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

INSERT INTO Resource_TerrainBooleans
	(ResourceType, TerrainType)
VALUES
	('RESOURCE_REINDEER', 'TERRAIN_TUNDRA'),
	('RESOURCE_REINDEER', 'TERRAIN_SNOW');

INSERT INTO Resource_FeatureBooleans
	(ResourceType, FeatureType)
VALUES
	('RESOURCE_REINDEER', 'FEATURE_FOREST');

INSERT INTO Resource_FeatureTerrainBooleans
	(ResourceType, TerrainType)
VALUES
	('RESOURCE_REINDEER', 'TERRAIN_TUNDRA');

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

--------------------------------------------
-- Improvement allowed 
--------------------------------------------
INSERT OR REPLACE INTO Improvement_ResourceTypes
(ImprovementType,				ResourceType,			ResourceMakesValid, ResourceTrade,	DiscoveryRand,	QuantityRequirement) 
VALUES
('IMPROVEMENT_CAMP',	'RESOURCE_REINDEER',	1,					1,				0,				0);

INSERT OR REPLACE  INTO Improvement_ResourceType_Yields
(ImprovementType,				ResourceType,			YieldType,			Yield) VALUES
('IMPROVEMENT_CAMP',	'RESOURCE_REINDEER',	'YIELD_CULTURE',	1),
('IMPROVEMENT_CAMP',	'RESOURCE_REINDEER',	'YIELD_FOOD',		1);
