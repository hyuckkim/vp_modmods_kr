--=====================================================================================================
-- TERRAINS
--=====================================================================================================
UPDATE Language_en_US SET Text = 'Permafrost' WHERE Tag = 'TXT_KEY_TERRAIN_SNOW';

INSERT INTO Terrain_HillsYieldChanges
(TerrainType,	YieldType, Yield) VALUES
('TERRAIN_SNOW', 'YIELD_PRODUCTION', 2);
--=====================================================================================================
-- RESOURCES
--=====================================================================================================
INSERT INTO IconTextureAtlases 
(Atlas, 							IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn) VALUES
('JAR_POLARWILDGAME_ATLAS', 		256, 		'PolarWildGame_256.dds',	1, 				1),
('JAR_POLARWILDGAME_ATLAS', 		128, 		'PolarWildGame_128.dds',	1, 				1),
('JAR_POLARWILDGAME_ATLAS', 		80, 		'PolarWildGame_080.dds',	1, 				1),
('JAR_POLARWILDGAME_ATLAS', 		64, 		'PolarWildGame_064.dds',	1, 				1),
('JAR_POLARWILDGAME_ATLAS', 		45, 		'PolarWildGame_045.dds',	1, 				1);

INSERT OR REPLACE INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_POLARWILDGAME',	'PolarWildGameFontIcon');		
	
INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 					IconFontTexture,				IconMapping)
VALUES	('ICON_RES_POLARWILDGAME',	'ICON_FONT_TEXTURE_POLARWILDGAME',	1);

INSERT INTO ArtDefine_StrategicView
(StrategicViewType,					TileType,	Asset) Values
('ART_DEF_RESOURCE_POLARWILDGAME',	'Resource',	'sv_PolarWildGame.dds');

INSERT INTO ArtDefine_LandmarkTypes
(Type,								LandmarkType,	FriendlyName) VALUES
('ART_DEF_RESOURCE_POLARWILDGAME',	'Resource',		'PolarWildGame');

INSERT INTO ArtDefine_Landmarks
(Era,	State,	Scale,	ImprovementType,			LayoutHandler,	ResourceType,						Model,							TerrainContour) VALUES									
('Any',	'Any',	0.07,	'ART_DEF_IMPROVEMENT_NONE',	'ANIMATED',		'ART_DEF_RESOURCE_POLARWILDGAME',	'resource_whitefurs.fxsxml',	1),
('Any',	'Any',	0.07,	'ART_DEF_IMPROVEMENT_CAMP',	'ANIMATED',		'ART_DEF_RESOURCE_POLARWILDGAME',	'resource_whitefurs.fxsxml',	1);
--=======================================================================================================================
--=======================================================================================================================
-- Removed columns
-- Resources: AITradeModifier, AIObjective, MinLandPercent, RandApp1, RandApp2, RandApp3, RandApp4,
-- Player, TilesPer, ConstAppearance, PlacementOrder, GroupRange, GroupRand, Normalize
INSERT OR REPLACE INTO Resources
(Type,						LandResource,	AnimalResource,	Description,						Civilopedia,								ResourceClassType,		ArtDefineTag,					AltArtDefineTag,	ArtDefineTagHeavy,	AltArtDefineTagHeavy,	TechReveal,	PolicyReveal,	TechCityTrade,	TechObsolete,	AIStopTradingEra,	Happiness,	WonderProductionMod,	WonderProductionModObsoleteEra, StartingResourceQuantity,	MinAreaSize,	MinLatitude,	MaxLatitude,	ResourceUsage,	PresentOnAllValidPlots, Area,	Hills,	Flatlands,	NoRiverSide,	OnlyMinorCivs,	IconString,			PortraitIndex,	IconAtlas) VALUES
('RESOURCE_JAR_POLARWILDGAME',	1,				1,			'TXT_KEY_RESOURCE_POLARWILDGAME',	'TXT_KEY_CIV5_RESOURCE_POLARWILDGAME_TEXT',	'RESOURCECLASS_BONUS',	'ART_DEF_RESOURCE_POLARWILDGAME',null,				null,				null,					'TECH_AGRICULTURE',	null,	'TECH_TRAPPING',null,			null,				0,			0,						null,							0,							3,				0,				90,				0,				0,						0,		0,		1,			0,				0,				'[ICON_RES_POLARWILDGAME]',	0,			'JAR_POLARWILDGAME_ATLAS');

INSERT INTO Resource_Flavors
(ResourceType,					FlavorType,				Flavor) VALUES
('RESOURCE_JAR_POLARWILDGAME',	'FLAVOR_GROWTH',		10);

INSERT INTO Resource_TerrainBooleans
(ResourceType,				TerrainType) VALUES
('RESOURCE_JAR_POLARWILDGAME',	'TERRAIN_SNOW');

INSERT INTO Resource_YieldChanges
(ResourceType,				YieldType,		Yield) VALUES
('RESOURCE_JAR_POLARWILDGAME',	'YIELD_FOOD',	1);

INSERT INTO Improvement_ResourceTypes
(ImprovementType,			ResourceType,			ResourceMakesValid, ResourceTrade,	DiscoveryRand,	QuantityRequirement) VALUES
('IMPROVEMENT_CAMP',	'RESOURCE_JAR_POLARWILDGAME',	1,					1,				0,				0);

INSERT INTO Improvement_ResourceType_Yields
(ImprovementType,			ResourceType,					YieldType,			Yield) VALUES
('IMPROVEMENT_CAMP',		'RESOURCE_JAR_POLARWILDGAME',	'YIELD_FOOD',		1);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_RESOURCE_POLARWILDGAME', 'Polar Wild Game'),
('TXT_KEY_CIV5_RESOURCE_POLARWILDGAME_TEXT', 'Human hunting of land animals in polar regions began thousands of years ago with Indigenous peoples who adapted to Arctic tundra and subpolar landscapes. Groups such as the Inuit, Sámi, Nenets, and Chukchi relied heavily on terrestrial animals like caribou (reindeer), musk oxen, Arctic hares, and Arctic foxes. These animals provided meat, fat, hides for clothing and shelter, bones for tools, and sinew for sewing. Hunters developed techniques suited to open tundra and seasonal migrations, including driving herds into corrals, using bows, spears, and later rifles, and coordinating communal hunts. Knowledge of weather, terrain, and animal behavior was essential, and hunting was embedded in social traditions, rituals, and rules that helped regulate use of resources.');

INSERT INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType, YieldType, Yield)
SELECT	Type, 'RESOURCE_JAR_POLARWILDGAME', 'YIELD_FOOD', 		1	FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_SMOKEHOUSE' UNION ALL
SELECT	Type, 'RESOURCE_JAR_POLARWILDGAME', 'YIELD_CULTURE_LOCAL', 1 FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_SMOKEHOUSE' UNION ALL
SELECT	Type, 'RESOURCE_JAR_POLARWILDGAME', 'YIELD_CULTURE_LOCAL', 1 FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_EE_TAVERN' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_TAVERN') UNION ALL
SELECT	Type, 'RESOURCE_JAR_POLARWILDGAME', 'YIELD_PRODUCTION', 	1	FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_EE_TAVERN' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_TAVERN');

CREATE TRIGGER IF NOT EXISTS JarPolarWildGame1 AFTER INSERT ON Buildings
WHEN NEW.BuildingClass='BUILDINGCLASS_SMOKEHOUSE'
BEGIN
	INSERT INTO Building_ResourceYieldChanges
			(BuildingType, ResourceType, YieldType, Yield)
	SELECT	NEW.Type, 'RESOURCE_JAR_POLARWILDGAME', 'YIELD_FOOD', 		1 UNION ALL
	SELECT	NEW.Type, 'RESOURCE_JAR_POLARWILDGAME', 'YIELD_CULTURE_LOCAL', 1;
END;

CREATE TRIGGER IF NOT EXISTS JarPolarWildGame3 AFTER INSERT ON Buildings
WHEN NEW.Type='BUILDING_EE_TAVERN'
BEGIN
	INSERT INTO Building_ResourceYieldChanges
			(BuildingType, ResourceType, YieldType, Yield)
	SELECT	NEW.Type, 'RESOURCE_JAR_POLARWILDGAME', 'YIELD_PRODUCTION',	1 UNION ALL
	SELECT	NEW.Type, 'RESOURCE_JAR_POLARWILDGAME', 'YIELD_CULTURE_LOCAL', 1;
END;
--=======================================================================================================================
--=======================================================================================================================