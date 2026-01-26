----------------------------------------------------------
-- ArtDefine Landmarks
----------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes	(Type,								LandmarkType,	FriendlyName)
	SELECT							'ART_DEF_IMPROVEMENT_LIGHTHOUSE',	'Improvement',	'Lighthouse';

INSERT INTO ArtDefine_Landmarks	(Era,		State,			Scale,	ImprovementType,					LayoutHandler,	ResourceType,				Model,						TerrainContour)
	SELECT						'Ancient',	'Constructed',	0.045,	'ART_DEF_IMPROVEMENT_LIGHTHOUSE',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'MBrennlighthouse.fxsxml',	1;

INSERT INTO ArtDefine_Landmarks	(Era,			State,			Scale,	ImprovementType,					LayoutHandler,	ResourceType,				Model,						TerrainContour)
	SELECT						'Industrial',	'Constructed',	0.045,	'ART_DEF_IMPROVEMENT_LIGHTHOUSE',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'MBindlighthouse.fxsxml',	1;

INSERT INTO ArtDefine_Landmarks	(Era,		State,					Scale,	ImprovementType,					LayoutHandler,	ResourceType,				Model,																				TerrainContour)
	SELECT						'Ancient',	'UnderConstruction',	0.3,	'ART_DEF_IMPROVEMENT_LIGHTHOUSE',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Assets/Buildings/Improvements/Trading_Post/Medieval/HB_MED_Trading_Post1.fxsxml',	0;

INSERT INTO ArtDefine_Landmarks	(Era,			State,					Scale,	ImprovementType,					LayoutHandler,	ResourceType,				Model,																				TerrainContour)
	SELECT						'Industrial',	'UnderConstruction',	0.3,	'ART_DEF_IMPROVEMENT_LIGHTHOUSE',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Assets/Buildings/Improvements/Trading_Post/Modern/HB_MOD_Trading_Post1.fxsxml',	0;

INSERT INTO ArtDefine_StrategicView	(StrategicViewType,					TileType,		Asset)
	SELECT							'ART_DEF_IMPROVEMENT_LIGHTHOUSE',	'Improvement',	'lighthouseSV.dds';

----------------------------------------------------------
-- Improvements
----------------------------------------------------------
INSERT INTO Improvements	(Type,						Description,						Civilopedia,									Help,											ArtDefineTag,						NoFreshWater,	Water,	Permanent,	InAdjacentFriendly,	GraphicalOnly,	DestroyedWhenPillaged,	NoTwoAdjacent,	RequiresXAdjacentLand,	PortraitIndex,	IconAtlas,		NoAdjacentCity,	CoastMakesValid,	OwnerOnly)
	VALUES					('IMPROVEMENT_LIGHTHOUSE',	'TXT_KEY_IMPROVEMENT_LIGHTHOUSE',	'TXT_KEY_CIV5_IMPROVEMENTS_LIGHTHOUSE_TEXT',	'TXT_KEY_CIV5_IMPROVEMENTS_LIGHTHOUSE_HELP',	'ART_DEF_IMPROVEMENT_LIGHTHOUSE',	1,				1,		0,			1,					0,				1,						1,				1,						36,				'BW_ATLAS_1',	1,				1,					1);

INSERT INTO Improvement_ValidTerrains	(ImprovementType,			TerrainType) 
	VALUES								('IMPROVEMENT_LIGHTHOUSE',	'TERRAIN_COAST');

----------------------------------------------------------
-- Text Keys
----------------------------------------------------------
INSERT INTO Language_en_US	(Tag,											Text)
	VALUES					('TXT_KEY_IMPROVEMENT_LIGHTHOUSE',				'Lighthouse'),
							('TXT_KEY_CIV5_IMPROVEMENTS_LIGHTHOUSE_HELP',	'A lighthouse is a tower, building, or other type of physical structure designed to emit light from a system of lamps and lenses and to serve as a beacon for navigational aid for maritime pilots at sea or on inland waterways.'),
							('TXT_KEY_CIV5_IMPROVEMENTS_LIGHTHOUSE_TEXT',	'A lighthouse provides faster movement in adjacent plots.');

--------------------------------------------------------------------------------------------------
--Unit builds 
--------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds		(UnitType,			BuildType)
	VALUES					('UNIT_WORKER',		'BUILD_LIGHTHOUSE'),
							('UNIT_WORKBOAT',	'BUILD_LIGHTHOUSE');

--------------------------------------------------------------------------------------------------
--Builds
--------------------------------------------------------------------------------------------------
INSERT INTO Builds		(Type,					Description,						Help,											Recommendation,									HotKey,	OrderPriority,	Time,	Cost,	CostIncreasePerImprovement,	Water,	CanBeEmbarked,	PrereqTech,		ImprovementType,			EntityEvent,				IconIndex,	IconAtlas,					ShowInTechTree)
	VALUES				('BUILD_LIGHTHOUSE',	'TXT_KEY_IMPROVEMENT_LIGHTHOUSE',	'TXT_KEY_CIV5_IMPROVEMENTS_LIGHTHOUSE_TEXT',	'TXT_KEY_CIV5_IMPROVEMENTS_LIGHTHOUSE_TEXT',	'KB_G',	97,				300,	0,		0,							1,		1,				'TECH_OPTICS',	'IMPROVEMENT_LIGHTHOUSE',	'ENTITY_EVENT_BUILD',		2,			'UNIT_ACTION_ATLAS_EXP2',	1);

--------------------------------------------------------------------------------------------------
--Improvement yields
--------------------------------------------------------------------------------------------------

INSERT INTO Improvement_Yields	(ImprovementType,			YieldType,			Yield)
	VALUES						('IMPROVEMENT_LIGHTHOUSE',	'YIELD_FOOD',		1);

INSERT INTO Improvement_AdjacentTerrainYieldChanges	(ImprovementType,			TerrainType,		YieldType,		Yield)
	VALUES											('IMPROVEMENT_LIGHTHOUSE',	'TERRAIN_COAST',	'YIELD_FOOD',	1);

INSERT INTO Improvement_YieldPerXAdjacentImprovement	(ImprovementType,				OtherImprovementType,		YieldType,		Yield,	NumRequired)
	VALUES												('IMPROVEMENT_FISHING_BOATS',	'IMPROVEMENT_LIGHTHOUSE',	'YIELD_GOLD',	1,		1);

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_CITY';
