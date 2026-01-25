--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 										Red, 			Green, 			Blue, 			Alpha)
VALUES		('COLOR_PLAYER_GH_LOUISIANA_ICON', 			0.039,			0.000,			0.478,			1),
			('COLOR_PLAYER_GH_LOUISIANA_BACKGROUND',	0.478,			0.424,			0.365,			1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_GH_LOUISIANA',		'COLOR_PLAYER_GH_LOUISIANA_ICON', 	'COLOR_PLAYER_GH_LOUISIANA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- SHRIMP
--==========================================================================================================================
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT OR REPLACE INTO ArtDefine_LandmarkTypes 
			(Type,							LandmarkType,	FriendlyName) 
VALUES		('ART_DEF_RESOURCE_SHRIMP',		'Resource',		'Shrimp');
--==========================================================================================================================
-- ArtDefine_Landmarks
--==========================================================================================================================
INSERT OR REPLACE INTO ArtDefine_Landmarks 
			(Era, State, Scale, ImprovementType, LayoutHandler,	ResourceType, 					Model, TerrainContour, Tech)
SELECT 		Era, State, Scale, ImprovementType, LayoutHandler,	('ART_DEF_RESOURCE_SHRIMP'), 	Model, TerrainContour, Tech
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_CRAB';
--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType,				TileType,	Asset) 
VALUES		('ART_DEF_RESOURCE_SHRIMP',		'Resource',	'sv_shrimp.dds');
--==========================================================================================================================
-- IconFontTextures
--==========================================================================================================================
INSERT INTO IconFontTextures 
			(IconFontTexture, 					IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_SHRIMP',		'ShrimpFontIcons_22');
--==========================================================================================================================
-- IconFontMapping
--==========================================================================================================================
INSERT INTO IconFontMapping 
			(IconName, 				IconFontTexture,				IconMapping)
VALUES		('ICON_RES_SHRIMP',		'ICON_FONT_TEXTURE_SHRIMP',		1);
--==========================================================================================================================
-- CAJUN CABIN
--==========================================================================================================================
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 												LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN', 	'Improvement', 	'IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks
			(Era, 	State, 					Scale, 		ImprovementType, 									LayoutHandler, 	ResourceType, 			Model, 						TerrainContour)
VALUES 		('Any', 'UnderConstruction', 	2.7,		'ART_DEF_IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'Bayou_Cabin_hb.fxsxml',	1),
			('Any', 'Constructed', 			3.1,		'ART_DEF_IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'Bayou_Cabin.fxsxml',		1),
			('Any', 'Pillaged', 			3.1,		'ART_DEF_IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'Bayou_Cabin_pl.fxsxml',	1);
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 								TileType, 		Asset)
VALUES 		('ART_DEF_IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN', 	'Improvement', 	'sv_Cajun_Cabin.dds');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 						IconSize, 		Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('GH_LOUISIANA_ATLAS', 				256, 		'GH_Louisiana_Atlas_256.dds',		3, 				3),
			('GH_LOUISIANA_ATLAS', 				128, 		'GH_Louisiana_Atlas_128.dds',		3, 				3),
			('GH_LOUISIANA_ATLAS', 				80, 		'GH_Louisiana_Atlas_080.dds',		3, 				3),			
			('GH_LOUISIANA_ATLAS', 				64, 		'GH_Louisiana_Atlas_064.dds',		3, 				3),
			('GH_LOUISIANA_ATLAS', 				45, 		'GH_Louisiana_Atlas_045.dds',		3, 				3),
			('GH_LOUISIANA_ATLAS', 				32, 		'GH_Louisiana_Atlas_032.dds',		3, 				3),			
			('RESOURCE_GH_LOUISIANA_ATLAS', 	256, 		'Shrimp_256.dds',					1, 				1),
			('RESOURCE_GH_LOUISIANA_ATLAS',		80, 		'Shrimp_080.dds',					1, 				1),			
			('RESOURCE_GH_LOUISIANA_ATLAS', 	64, 		'Shrimp_064.dds',					1, 				1),			
			('RESOURCE_GH_LOUISIANA_ATLAS', 	45, 		'Shrimp_045.dds',					1, 				1),
			('GH_LOUISIANA_ALPHA_ATLAS', 		256, 		'LouisianaAlpha256.dds',			1, 				1),
			('GH_LOUISIANA_ALPHA_ATLAS', 		128, 		'LouisianaAlpha128.dds',			1, 				1),
			('GH_LOUISIANA_ALPHA_ATLAS', 		80, 		'LouisianaAlpha80.dds',				1, 				1),
			('GH_LOUISIANA_ALPHA_ATLAS', 		64, 		'LouisianaAlpha64.dds',				1, 				1),
			('GH_LOUISIANA_ALPHA_ATLAS', 		48, 		'LouisianaAlpha48.dds',				1, 				1),
			('GH_LOUISIANA_ALPHA_ATLAS', 		32, 		'LouisianaAlpha32.dds',				1, 				1),
			('GH_LOUISIANA_ALPHA_ATLAS', 		24, 		'LouisianaAlpha24.dds',				1, 				1),			
			('GH_LOUISIANA_ALPHA_ATLAS', 		16, 		'LouisianaAlpha16.dds',				1, 				1),			
			('GH_KREWE_FLAG', 					32, 		'Flag_Louisiana_Krewe.dds',			1, 				1),
			('GH_GVOYAGEUR_FLAG', 				32, 		'Flag_Louisiana_GVoyageur.dds',		1, 				1),
			('GH_LOUISIANA_PROMOTION_ATLAS', 	256, 		'Louisiana_PI_256.dds',				8, 				1),
			('GH_LOUISIANA_PROMOTION_ATLAS', 	64, 		'Louisiana_PI_064.dds',				8, 				1),
			('GH_LOUISIANA_PROMOTION_ATLAS', 	45, 		'Louisiana_PI_045.dds',				8, 				1),
			('GH_LOUISIANA_PROMOTION_ATLAS', 	32, 		'Louisiana_PI_032.dds',				8, 				1),
			('GH_LOUISIANA_PROMOTION_ATLAS', 	16, 		'Louisiana_PI_016.dds',				8, 				1);			
--==========================================================================================================================
-- Audio_Sounds
--==========================================================================================================================	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_GH_LOUISIANA_BEAUSOLEIL_PEACE', 	'Beausoleil_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_GH_LOUISIANA_BEAUSOLEIL_WAR', 	'Beausoleil_War', 		'DynamicResident');
--==========================================================================================================================
-- Audio_2DSounds
--==========================================================================================================================	
INSERT INTO Audio_2DSounds	
		(ScriptID, 											SoundID, 											SoundType, 				MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_GH_LOUISIANA_BEAUSOLEIL_PEACE',	'SND_LEADER_MUSIC_GH_LOUISIANA_BEAUSOLEIL_PEACE', 	'GAME_MUSIC', 			85, 		85, 		1, 		 0),
		('AS2D_LEADER_MUSIC_GH_LOUISIANA_BEAUSOLEIL_WAR', 	'SND_LEADER_MUSIC_GH_LOUISIANA_BEAUSOLEIL_WAR',		'GAME_MUSIC', 			85, 		85, 		1,		 0);
--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
SELECT	'ART_DEF_UNIT_LOUISIANA_GVOYAGEUR', 	TileType, 	'sv_Louisiana_GVoyageur.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_U_SHOSHONE_PATHFINDER';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_LOUISIANA_KREWE', 	'Unit', 	'sv_Louisiana_Krewe.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_LOUISIANA_GVOYAGEUR',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_SHOSHONE_PATHFINDER';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 											DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_CLASSICAL',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SCOUT';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 											DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_MEDIEVAL',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SCOUT';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 											DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_RENAISSANCE',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SCOUT';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 											DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_INDUSTRIAL',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SCOUT';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_LOUISIANA_KREWE',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_MUSICIAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,										UnitMemberInfoType,												NumMembers)
VALUES	('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR',				'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SCOUT',				1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR',				'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_PATHFINDER',			2),
		
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_CLASSICAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SCOUT',				1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_CLASSICAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_PATHFINDER',			1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_CLASSICAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SCIROQUOIS',			2),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_CLASSICAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_PATHFINDER',			1),
		
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_MEDIEVAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SCOUT',				1),		
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_MEDIEVAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_PATHFINDER',			1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_MEDIEVAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_CHASQUI',				1),		
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_MEDIEVAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SCIROQUOIS',			2),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_MEDIEVAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_CHASQUI',				1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_MEDIEVAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_PATHFINDER',			1),
		
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_RENAISSANCE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_COMMANDO',				1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_RENAISSANCE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SKIRMISHER',			1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_RENAISSANCE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_MUSKIROQUOIS',			1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_RENAISSANCE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_HAMMOCK',				2),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_RENAISSANCE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_MUSKIROQUOIS',			1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_RENAISSANCE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_MIKMAQ',				2),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_RENAISSANCE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SKIRMISHER',			1),				

		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_INDUSTRIAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_COMMANDO',				1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_INDUSTRIAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SKIRMISHER',			1),		
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_INDUSTRIAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_MIKMAQ',				1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_INDUSTRIAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_MUSKIROQUOIS',			2),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_INDUSTRIAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_OGICHIDAA',			1),				
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_INDUSTRIAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_HAMMOCK',				2),		
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_INDUSTRIAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_MIKMAQ',				1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_INDUSTRIAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SKIRMISHER',			1),
		('ART_DEF_UNIT_LOUISIANA_GVOYAGEUR_INDUSTRIAL',		'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_OGICHIDAA',			1);
		
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,							NumMembers)
VALUES	('ART_DEF_UNIT_LOUISIANA_KREWE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_KREWE_1',		1),
		('ART_DEF_UNIT_LOUISIANA_KREWE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_KREWE_2',		1),
		('ART_DEF_UNIT_LOUISIANA_KREWE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_KREWE_3',		1);
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_PATHFINDER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SHOSHONE_PATHFINDER';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SCOUT',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SCIROQUOIS',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_CHASQUI',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_COMMANDO',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BOER_COMMANDO_2';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_MIKMAQ',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_HAMMOCK',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SKIRMISHER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_OGICHIDAA',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_MUSKIROQUOIS',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_KREWE_1',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_KREWE_2',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_KREWE_3',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_PATHFINDER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SHOSHONE_PATHFINDER';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SCOUT',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SCIROQUOIS',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_CHASQUI',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_COMMANDO',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BOER_COMMANDO_2';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_MIKMAQ',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_HAMMOCK',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SKIRMISHER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_OGICHIDAA',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_MUSKIROQUOIS',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 													Scale,  ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_PATHFINDER',	Scale,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SHOSHONE_PATHFINDER';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 												Scale,  ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SCOUT',	Scale,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SCOUT';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 													Scale,  ZOffset, Domain, Model,							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SCIROQUOIS',	Scale,	ZOffset, Domain, 'GV_Scout_Iroquois.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SCOUT';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 												Scale,  ZOffset, Domain, Model,					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_CHASQUI',	Scale,	ZOffset, Domain, 'GV_IncaScout.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SCOUT';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 												Scale,  ZOffset, Domain, Model,						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_COMMANDO',	Scale,	ZOffset, Domain, 'Grand_Voyageur.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_BOER_COMMANDO_2';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 												Scale,  ZOffset, Domain, Model,					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_MIKMAQ',	Scale,	ZOffset, Domain, 'GV_Aniwina.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 												Scale,  ZOffset, Domain, Model,						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_HAMMOCK',	Scale,	ZOffset, Domain, 'GV_Hammock.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 													Scale,  ZOffset, Domain, Model,						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_SKIRMISHER',	Scale,	ZOffset, Domain, 'GV_skirmisher.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 													Scale,  ZOffset, Domain, Model,					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_OGICHIDAA',	Scale,	ZOffset, Domain, 'GV_Ogichidaa.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 													Scale,  ZOffset, Domain, Model,							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_GVOYAGEUR_MUSKIROQUOIS',	Scale,	ZOffset, Domain, 'GV_IroquoisMusketman.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,  ZOffset, Domain, Model,							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_KREWE_1',	Scale,	ZOffset, Domain, 'Louisiana_Krewe_1.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,  ZOffset, Domain, Model,							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_KREWE_2',	Scale,	ZOffset, Domain, 'Louisiana_Krewe_2.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,  ZOffset, Domain, Model,							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOUISIANA_KREWE_3',	Scale,	ZOffset, Domain, 'Louisiana_Krewe_3.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN';