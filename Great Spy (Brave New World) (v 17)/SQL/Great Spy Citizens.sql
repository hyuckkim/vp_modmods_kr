-- Specialists

--INSERT INTO Specialists 
--		(Type,							Description,							Strategy,										GreatPeopleTitle,								Visible,	Cost,	GreatPeopleUnitClass,		GreatPeopleRateChange,	IconAtlas,						PortraitIndex)
--VALUES	('SPECIALIST_OPERATIVE_MOD',	'TXT_KEY_SPECIALIST_OPERATIVE_MOD',		'TXT_KEY_SPECIALIST_OPERATIVE_MOD_STRATEGY',	'TXT_KEY_SPECIALIST_OPERATIVE_MOD_TITLE',		0,			0,		'UNITCLASS_TOMATEKH_SPY',	3,						'TOMATEKH_OPERATIVE_ATLAS',		0);

UPDATE Specialists
SET Strategy = 'TXT_KEY_SPECIALIST_CITIZEN_STRATEGY_SPY_OVERRIDE'
WHERE Type = 'SPECIALIST_CITIZEN';

INSERT INTO Beliefs 
		(Type,								Description,								ShortDescription,								Pantheon)
VALUES	('BELIEF_SPY_MYSTERY_CULTS',		'TXT_KEY_BELIEF_SPY_MYSTERY_CULTS',			'TXT_KEY_BELIEF_SPY_MYSTERY_CULTS_SHORT',			   1);

INSERT INTO Beliefs 
		(Type,								Description,								ShortDescription,								Enhancer)
VALUES	('BELIEF_SPY_NEGATIVE_THEOLOGY',	'TXT_KEY_BELIEF_SPY_NEGATIVE_THEOLOGY',		'TXT_KEY_BELIEF_SPY_NEGATIVE_THEOLOGY_SHORT',		   1);

--
--

INSERT INTO ArtDefine_LandmarkTypes
		(Type, 										LandmarkType, 		FriendlyName)
SELECT	'ART_DEF_IMPROVEMENT_FAKE_HORSE_MOD', 		'Improvement', 		'TOMATEKH_FAKE_HORSE';
	
INSERT INTO ArtDefine_Landmarks
		(Era, 	State, 					Scale,	ImprovementType, 						LayoutHandler, 				ResourceType, 				Model, 													TerrainContour)
VALUES 	('Any', 'Any', 					0.08,  	'ART_DEF_IMPROVEMENT_FAKE_HORSE_MOD',	'ANIMATED_ROTATED', 		'ART_DEF_RESOURCE_ALL',		'Assets/Buildings/Resources/horse/SuperHorse.fxsxml', 	1);

INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,							TileType,			Asset)
VALUES	('ART_DEF_IMPROVEMENT_FAKE_HORSE_MOD',		'Improvement',		'sv_horse.dds');

--

INSERT INTO ArtDefine_LandmarkTypes
		(Type, 										LandmarkType, 		FriendlyName)
SELECT	'ART_DEF_IMPROVEMENT_FAKE_IRON_MOD', 		'Improvement', 		'TOMATEKH_FAKE_IRON';
	
INSERT INTO ArtDefine_Landmarks
		(Era, 	State, 					Scale,	ImprovementType, 						LayoutHandler, 				ResourceType, 				Model, 													TerrainContour)
VALUES 	('Any', 'Any', 					1,  	'ART_DEF_IMPROVEMENT_FAKE_IRON_MOD',	'SNAPSHOT', 				'ART_DEF_RESOURCE_ALL',		'Assets/Buildings/Resources/Iron/Iron.fxsxml', 			1);

INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,							TileType,			Asset)
VALUES	('ART_DEF_IMPROVEMENT_FAKE_IRON_MOD',		'Improvement',		'sv_iron.dds');

--

INSERT INTO ArtDefine_LandmarkTypes
		(Type, 										LandmarkType, 		FriendlyName)
SELECT	'ART_DEF_IMPROVEMENT_FAKE_COAL_MOD', 		'Improvement', 		'TOMATEKH_FAKE_COAL';
	
INSERT INTO ArtDefine_Landmarks
		(Era, 	State, 					Scale,	ImprovementType, 						LayoutHandler, 				ResourceType, 				Model, 													TerrainContour)
VALUES 	('Any', 'Any', 					1,  	'ART_DEF_IMPROVEMENT_FAKE_COAL_MOD',	'SNAPSHOT', 				'ART_DEF_RESOURCE_ALL',		'Assets/Buildings/Resources/Coal/Coal.fxsxml', 			1);

INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,							TileType,			Asset)
VALUES	('ART_DEF_IMPROVEMENT_FAKE_COAL_MOD',		'Improvement',		'sv_coal.dds');

--

INSERT INTO ArtDefine_LandmarkTypes
		(Type, 										LandmarkType, 		FriendlyName)
SELECT	'ART_DEF_IMPROVEMENT_FAKE_ALUM_MOD', 		'Improvement', 		'TOMATEKH_FAKE_ALUM';
	
INSERT INTO ArtDefine_Landmarks
		(Era, 	State, 					Scale,	ImprovementType, 						LayoutHandler, 				ResourceType, 				Model, 															TerrainContour)
VALUES 	('Any', 'Any', 					1,  	'ART_DEF_IMPROVEMENT_FAKE_ALUM_MOD',	'SNAPSHOT', 				'ART_DEF_RESOURCE_ALL',		'Assets/Buildings/Resources/Aluminum/Aluminum.fxsxml', 			1);

INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,							TileType,			Asset)
VALUES	('ART_DEF_IMPROVEMENT_FAKE_ALUM_MOD',		'Improvement',		'sv_aluminum.dds');


--

INSERT INTO ArtDefine_LandmarkTypes
		(Type, 										LandmarkType, 		FriendlyName)
SELECT	'ART_DEF_IMPROVEMENT_FAKE_OIL_MOD', 		'Improvement', 		'TOMATEKH_FAKE_OIL';
	
INSERT INTO ArtDefine_Landmarks
		(Era, 	State, 					Scale,	ImprovementType, 						LayoutHandler, 				ResourceType, 				Model, 															TerrainContour)
VALUES 	('Any', 'Any', 					1,  	'ART_DEF_IMPROVEMENT_FAKE_OIL_MOD',		'SNAPSHOT', 				'ART_DEF_RESOURCE_ALL',		'Assets/Buildings/Resources/Oil/Oil_water_heavy.fxsxml', 		1);

INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,							TileType,			Asset)
VALUES	('ART_DEF_IMPROVEMENT_FAKE_OIL_MOD',		'Improvement',		'sv_oil.dds');

--

INSERT INTO ArtDefine_LandmarkTypes
		(Type, 										LandmarkType, 		FriendlyName)
SELECT	'ART_DEF_IMPROVEMENT_FAKE_URAN_MOD', 		'Improvement', 		'TOMATEKH_FAKE_URAN';
	
INSERT INTO ArtDefine_Landmarks
		(Era, 	State, 					Scale,	ImprovementType, 						LayoutHandler, 				ResourceType, 				Model, 															TerrainContour)
VALUES 	('Any', 'Any', 					1,  	'ART_DEF_IMPROVEMENT_FAKE_URAN_MOD',	'SNAPSHOT', 				'ART_DEF_RESOURCE_ALL',		'Assets/Buildings/Resources/Uranium/Uranium.fxsxml', 			1);

INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,							TileType,			Asset)
VALUES	('ART_DEF_IMPROVEMENT_FAKE_URAN_MOD',		'Improvement',		'sv_uranium.dds');

--
--

INSERT INTO Improvements 
		(Type,														 Description,                                            Civilopedia,														Help,			                                ArtDefineTag,		Permanent,			GraphicalOnly,		PortraitIndex,			               IconAtlas)
VALUES	('IMPROVEMENT_FAKE_HORSE_MOD',		'TXT_KEY_IMPROVEMENT_FAKE_HORSE_MOD',						'TXT_KEY_UNIT_TOMATEKH_SPY_TEXT',							'TXT_KEY_UNIT_TOMATEKH_SPY_HELP',				    'ART_DEF_IMPROVEMENT_FAKE_HORSE_MOD',               1,						 1,			        29,					'TERRAIN_ATLAS'),
		('IMPROVEMENT_FAKE_IRON_MOD',		 'TXT_KEY_IMPROVEMENT_FAKE_IRON_MOD',						'TXT_KEY_UNIT_TOMATEKH_SPY_TEXT',							'TXT_KEY_UNIT_TOMATEKH_SPY_HELP',					 'ART_DEF_IMPROVEMENT_FAKE_IRON_MOD',               1,						 1,			        26,					'TERRAIN_ATLAS'),
		('IMPROVEMENT_FAKE_COAL_MOD',		 'TXT_KEY_IMPROVEMENT_FAKE_COAL_MOD',						'TXT_KEY_UNIT_TOMATEKH_SPY_TEXT',							'TXT_KEY_UNIT_TOMATEKH_SPY_HELP',					 'ART_DEF_IMPROVEMENT_FAKE_COAL_MOD',               1,						 1,			        26,					'TERRAIN_ATLAS'),
		('IMPROVEMENT_FAKE_ALUM_MOD',		 'TXT_KEY_IMPROVEMENT_FAKE_ALUM_MOD',						'TXT_KEY_UNIT_TOMATEKH_SPY_TEXT',							'TXT_KEY_UNIT_TOMATEKH_SPY_HELP',					 'ART_DEF_IMPROVEMENT_FAKE_ALUM_MOD',               1,						 1,			        26,					'TERRAIN_ATLAS'),
		('IMPROVEMENT_FAKE_OIL_MOD',		  'TXT_KEY_IMPROVEMENT_FAKE_OIL_MOD',						'TXT_KEY_UNIT_TOMATEKH_SPY_TEXT',							'TXT_KEY_UNIT_TOMATEKH_SPY_HELP',					  'ART_DEF_IMPROVEMENT_FAKE_OIL_MOD',               1,						 1,			        28,					'TERRAIN_ATLAS'),
		('IMPROVEMENT_FAKE_URAN_MOD',		 'TXT_KEY_IMPROVEMENT_FAKE_URAN_MOD',						'TXT_KEY_UNIT_TOMATEKH_SPY_TEXT',							'TXT_KEY_UNIT_TOMATEKH_SPY_HELP',					 'ART_DEF_IMPROVEMENT_FAKE_URAN_MOD',               1,						 1,			        26,					'TERRAIN_ATLAS');

INSERT INTO Units 
		(Class,                                                 Type,    Moves,    Cost,								      Description,		ShowInPedia,	CombatLimit,		        UnitArtInfo,	UnitFlagIconOffset,		PortraitIndex,	            IconAtlas)
VALUES	('UNITCLASS_SPY_DUMMY',						'UNIT_SPY_DUMMY',		 0,		 -1,					'TXT_KEY_UNIT_SPY_DUMMY_DESC',	              0,              0,	'ART_DEF_UNIT__SETTLER',		            82,                7,	 'TOMATEKH_SPY_ATLAS');


INSERT INTO UnitClasses
		(Type,									          Description,					 DefaultUnit)
Values	('UNITCLASS_SPY_DUMMY',			'TXT_KEY_UNIT_SPY_DUMMY_DESC',				'UNIT_SPY_DUMMY');


INSERT INTO Improvement_Yields 
		(ImprovementType,							     YieldType,		        Yield)
VALUES	('IMPROVEMENT_FAKE_HORSE_MOD',          'YIELD_PRODUCTION',                 1),
		('IMPROVEMENT_FAKE_IRON_MOD',           'YIELD_PRODUCTION',                 1),
		('IMPROVEMENT_FAKE_COAL_MOD',           'YIELD_PRODUCTION',                 1),
		('IMPROVEMENT_FAKE_ALUM_MOD',           'YIELD_PRODUCTION',                 1),
		('IMPROVEMENT_FAKE_OIL_MOD',            'YIELD_PRODUCTION',                 1),
		('IMPROVEMENT_FAKE_URAN_MOD',           'YIELD_PRODUCTION',                 1);

DELETE FROM HandicapInfo_Goodies WHERE GoodyType = 'GOODY_REVEAL_RESOURCE';

CREATE TRIGGER GSModAARuinsBackup
AFTER INSERT ON HandicapInfo_Goodies WHEN 'GOODY_BARBARIANS_STRONG' = NEW.GoodyType
BEGIN

	DELETE FROM HandicapInfo_Goodies WHERE GoodyType = 'GOODY_REVEAL_RESOURCE';

END;





