--==========================================================================================================================
-- ALOE VERA
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
(Atlas, 							IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn) VALUES
('JAR_ALOE_ATLAS', 					256, 		'AloeVera_256.dds',			1, 				1),
('JAR_ALOE_ATLAS', 					128, 		'AloeVera_128.dds',			1, 				1),
('JAR_ALOE_ATLAS', 					80, 		'AloeVera_80.dds',			1, 				1),
('JAR_ALOE_ATLAS', 					64, 		'AloeVera_64.dds',			1, 				1),
('JAR_ALOE_ATLAS', 					45, 		'AloeVera_45.dds',			1, 				1);

INSERT OR REPLACE INTO IconFontTextures 
		(IconFontTexture, 			IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_ALOE',	'FontIcon_AloreVera');		
	
INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 			IconFontTexture,				IconMapping)
VALUES	('ICON_RES_ALOEVERA',	'ICON_FONT_TEXTURE_ALOE',	1);

INSERT INTO ArtDefine_StrategicView
(StrategicViewType,					TileType,	Asset) Values
('ART_DEF_RESOURCE_ALOEVERA',		'Resource',	'SV_Aloevera.dds');

INSERT INTO ArtDefine_LandmarkTypes
(Type,								LandmarkType,	FriendlyName) VALUES
('ART_DEF_RESOURCE_ALOEVERA',		'Resource',		'Aloe Vera');

INSERT INTO ArtDefine_Landmarks
(Era,				State,						Scale,		ImprovementType,							LayoutHandler,			ResourceType,					Model,									TerrainContour) VALUES									
('Any',				'Any',						0.85,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',	'Resource_Aloevera.fxsxml',							1),
('Industrial',		'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',	'Plantation_IND_Aloevera.fxsxml',					1),
('Industrial',		'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',	'HB_Plantation_IND_Aloevera.fxsxml',				1),
('Industrial',		'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',	'PL_Plantation_IND_Aloevera.fxsxml',				1),
('Ancient',			'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',	'Plantation_MID_Aloevera.fxsxml',					1),
('Ancient',			'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',	'HB_Plantation_MID_Aloevera.fxsxml',				1),
('Ancient',			'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',	'PL_Plantation_MID_Aloevera.fxsxml',				1);
--=======================================================================================================================
--=======================================================================================================================
-- Removed columns
-- Resources: AITradeModifier, AIObjective, MinLandPercent, RandApp1, RandApp2, RandApp3, RandApp4,
-- Player, TilesPer, ConstAppearance, PlacementOrder, GroupRange, GroupRand, Normalize
INSERT OR REPLACE INTO Resources
(Type,						LandResource,	PlantResource,	Description,					Civilopedia,							ResourceClassType,		ArtDefineTag,				AltArtDefineTag,	ArtDefineTagHeavy,	AltArtDefineTagHeavy,	TechReveal,	PolicyReveal,	TechCityTrade,	TechObsolete,	AIStopTradingEra,	Happiness,	WonderProductionMod,	WonderProductionModObsoleteEra, StartingResourceQuantity,	MinAreaSize,	MinLatitude,	MaxLatitude,	ResourceUsage,	PresentOnAllValidPlots, Area,	Hills,	Flatlands,	NoRiverSide,	OnlyMinorCivs,	IconString,			PortraitIndex,	IconAtlas) VALUES
('RESOURCE_JAR_ALOE_VERA',	1,				1,				'TXT_KEY_RESOURCE_ALOE_VERA',	'TXT_KEY_CIV5_RESOURCE_ALOE_VERA_TEXT',	'RESOURCECLASS_BONUS',	'ART_DEF_RESOURCE_ALOEVERA',null,				null,				null,					'TECH_AGRICULTURE',	null,	'TECH_CALENDAR',null,			null,				0,			0,						null,							0,							3,				0,				90,				0,				0,						0,		0,		1,			0,				0,				'[ICON_RES_ALOEVERA]',	0,			'JAR_ALOE_ATLAS');

INSERT INTO Resource_Flavors
(ResourceType,				FlavorType,					Flavor) VALUES
('RESOURCE_JAR_ALOE_VERA',	'FLAVOR_INFRASTRUCTURE',	15),
('RESOURCE_JAR_ALOE_VERA',	'FLAVOR_SCIENCE',	5),
('RESOURCE_JAR_ALOE_VERA',	'FLAVOR_GROWTH',	5),
('RESOURCE_JAR_ALOE_VERA',	'FLAVOR_GOLD',		5);

INSERT INTO Resource_TerrainBooleans
(ResourceType,				TerrainType) VALUES
('RESOURCE_JAR_ALOE_VERA',	'TERRAIN_DESERT');

INSERT INTO Resource_YieldChanges
(ResourceType,				YieldType,		Yield) VALUES
('RESOURCE_JAR_ALOE_VERA',	'YIELD_GOLD',	1);

INSERT INTO Improvement_ResourceTypes
(ImprovementType,			ResourceType,			ResourceMakesValid, ResourceTrade,	DiscoveryRand,	QuantityRequirement) VALUES
('IMPROVEMENT_PLANTATION',	'RESOURCE_JAR_ALOE_VERA',	1,					1,				0,				0);

INSERT INTO Improvement_ResourceType_Yields
(ImprovementType,				ResourceType,			YieldType,				Yield) VALUES
('IMPROVEMENT_PLANTATION',		'RESOURCE_JAR_ALOE_VERA',	'YIELD_SCIENCE',	2),
('IMPROVEMENT_PLANTATION',		'RESOURCE_JAR_ALOE_VERA',	'YIELD_FOOD',		1);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_RESOURCE_ALOE_VERA', 'Aloe Vera'),
('TXT_KEY_CIV5_RESOURCE_ALOE_VERA_TEXT', 'Aloe vera, a succulent plant known for its medicinal properties, has a rich history dating back thousands of years. Believed to have originated in the Arabian Peninsula, aloe vera''s use can be traced to ancient civilizations, including the Egyptians, who referred to it as the "plant of immortality." Egyptians utilized aloe vera for various purposes, such as treating wounds, skin irritations, and burns. The plant''s popularity spread across different cultures, with mentions in ancient Greek, Roman, and Indian texts. [NEWLINE][NEWLINE]Throughout history, aloe vera continued to be valued for its healing properties. It gained prominence during the Middle Ages in Europe and the Renaissance, where it was cultivated in monasteries for its medicinal benefits. In the 20th century, aloe vera''s popularity surged as scientific research confirmed its therapeutic properties, leading to the development of various skincare and health products containing aloe vera extracts. Today, aloe vera is widely recognized and utilized globally for its soothing, moisturizing, and healing qualities in skincare, cosmetics, and alternative medicine.');

INSERT INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType, YieldType, Yield)
SELECT	Type, 'RESOURCE_JAR_ALOE_VERA', 'YIELD_FOOD', 1 FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_GROCER') UNION ALL
SELECT	Type, 'RESOURCE_JAR_ALOE_VERA', 'YIELD_GOLD', 1 FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_GROCER');
--=======================================================================================================================
--=======================================================================================================================