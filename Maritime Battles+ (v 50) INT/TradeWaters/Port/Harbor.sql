----------------------------------------------------------
-- ArtDefine Landmarks
----------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes	(Type,							LandmarkType,	FriendlyName)
	SELECT							'ART_DEF_IMPROVEMENT_HARBOR',	'Improvement',	'Harbor';

INSERT INTO ArtDefine_Landmarks	(Era,		State,			Scale,	ImprovementType,				LayoutHandler,	ResourceType,				Model,					TerrainContour)
	SELECT						'Ancient',	'Constructed',	0.04,	'ART_DEF_IMPROVEMENT_HARBOR',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'MBharbor_anc.fxsxml',	1;

INSERT INTO ArtDefine_Landmarks	(Era,			State,			Scale,	ImprovementType,				LayoutHandler,	ResourceType,				Model,					TerrainContour)
	SELECT						'Industrial',	'Constructed',	0.04,	'ART_DEF_IMPROVEMENT_HARBOR',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'MBharbor_ind.fxsxml',	1;

INSERT INTO ArtDefine_Landmarks	(Era,		State,					Scale,	ImprovementType,				LayoutHandler,	ResourceType,				Model,																				TerrainContour)
	SELECT						'Ancient',	'UnderConstruction',	0.3,	'ART_DEF_IMPROVEMENT_HARBOR',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Assets/Buildings/Improvements/Trading_Post/Medieval/HB_MED_Trading_Post3.fxsxml',	0;

INSERT INTO ArtDefine_Landmarks	(Era,			State,					Scale,	ImprovementType,				LayoutHandler,	ResourceType,				Model,																				TerrainContour)
	SELECT						'Industrial',	'UnderConstruction',	0.3,	'ART_DEF_IMPROVEMENT_HARBOR',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Assets/Buildings/Improvements/Trading_Post/Modern/HB_MOD_Trading_Post3.fxsxml',	0;

INSERT INTO ArtDefine_StrategicView	(StrategicViewType,				TileType,		Asset)
	SELECT							'ART_DEF_IMPROVEMENT_HARBOR',	'Improvement',	'harborSV.dds';

----------------------------------------------------------
-- Improvements
----------------------------------------------------------
INSERT INTO Improvements	(Type,					Description,					Civilopedia,								Help,										ArtDefineTag,					Water,	Permanent,	OutsideBorders,	GraphicalOnly,	DestroyedWhenPillaged,	NoTwoAdjacent,	RequiresXAdjacentLand,	PortraitIndex,	IconAtlas,		NoAdjacentCity,	NewOwner,	OwnerOnly,	UnitFreePromotion)
	VALUES					('IMPROVEMENT_HARBOR',	'TXT_KEY_IMPROVEMENT_HARBOR',	'TXT_KEY_CIV5_IMPROVEMENTS_HARBOR_TEXT',	'TXT_KEY_CIV5_IMPROVEMENTS_HARBOR_HELP',	'ART_DEF_IMPROVEMENT_HARBOR',	1,		0,			1,				0,				1,						1,				1,						26,				'BW_ATLAS_1',	1,				1,			1,			'PROMOTION_REPLENISHMENT');

INSERT INTO Improvement_ValidTerrains	(ImprovementType,		TerrainType) 
	VALUES								('IMPROVEMENT_HARBOR',	'TERRAIN_COAST');

----------------------------------------------------------
-- Text Keys
----------------------------------------------------------
INSERT INTO Language_en_US	(Tag,										Text)
	VALUES					('TXT_KEY_IMPROVEMENT_HARBOR',				'Port'),
							('TXT_KEY_CIV5_IMPROVEMENTS_HARBOR_HELP',	'Its a port.'),
							('TXT_KEY_CIV5_IMPROVEMENTS_HARBOR_TEXT',	'A port provides faster movement in adjacent plots, and allows naval units to replenish (heal) away from friendly territory.');

--------------------------------------------------------------------------------------------------
--Builds
--------------------------------------------------------------------------------------------------
INSERT INTO Builds		(Type,				Description,					Help,										Recommendation,								HotKey,	OrderPriority,	Time,	Cost,	CostIncreasePerImprovement,	Water,	CanBeEmbarked,	PrereqTech,		ImprovementType,		EntityEvent,				IconIndex,	IconAtlas,					ShowInTechTree)
	VALUES				('BUILD_HARBOR',	'TXT_KEY_IMPROVEMENT_HARBOR',	'TXT_KEY_CIV5_IMPROVEMENTS_HARBOR_HELP',	'TXT_KEY_CIV5_IMPROVEMENTS_HARBOR_TEXT',	'KB_H',	97,				10,		0,		0,							1,		1,				'TECH_OPTICS',	'IMPROVEMENT_HARBOR',	'ENTITY_EVENT_BUILD',		8,			'BUILD_ATLAS_VP',	1);

