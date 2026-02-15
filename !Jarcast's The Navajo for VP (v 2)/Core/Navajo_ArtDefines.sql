--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JAR_NAVAJO_ICON_ATLAS', 					256, 		'Jar_NavajoAtlas_256.dds',				4, 				3),
		('JAR_NAVAJO_ICON_ATLAS', 					128, 		'Jar_NavajoAtlas_128.dds',				4, 				3),
		('JAR_NAVAJO_ICON_ATLAS', 					80, 		'Jar_NavajoAtlas_80.dds',				4, 				3),
		('JAR_NAVAJO_ICON_ATLAS', 					64, 		'Jar_NavajoAtlas_64.dds',				4, 				3),
		('JAR_NAVAJO_ICON_ATLAS', 					45, 		'Jar_NavajoAtlas_45.dds',				4, 				3),
		('JAR_NAVAJO_ICON_ATLAS', 					32, 		'Jar_NavajoAtlas_32.dds',				4, 				3),
		('JAR_NAVAJO_ALPHA_ATLAS', 					128, 		'Jar_NavajoAlphaAtlas_128.dds',			1,				1),
		('JAR_NAVAJO_ALPHA_ATLAS', 					80, 		'Jar_NavajoAlphaAtlas_80.dds',			1, 				1),
		('JAR_NAVAJO_ALPHA_ATLAS', 					64, 		'Jar_NavajoAlphaAtlas_64.dds',			1, 				1),
		('JAR_NAVAJO_ALPHA_ATLAS', 					48, 		'Jar_NavajoAlphaAtlas_48.dds',			1, 				1),
		('JAR_NAVAJO_ALPHA_ATLAS', 					45, 		'Jar_NavajoAlphaAtlas_45.dds',			1, 				1),
		('JAR_NAVAJO_ALPHA_ATLAS', 					32, 		'Jar_NavajoAlphaAtlas_32.dds',			1, 				1),
		('JAR_NAVAJO_ALPHA_ATLAS', 					24, 		'Jar_NavajoAlphaAtlas_24.dds',			1, 				1),
		('JAR_NAVAJO_ALPHA_ATLAS', 					16, 		'Jar_NavajoAlphaAtlas_16.dds',			1, 				1),
		('UNIT_JAR_HATAALII_FLAG',					32, 		'Jar_HataaliiUnit_32.dds',				1, 				1),
		('UNIT_JAR_CODETALKER_FLAG',				32, 		'Jar_CodeTalkerUnit_32.dds',			1, 				1),
		('UNIT_JAR_NAABAAHII_FLAG',					32, 		'Jar_NaabaahiiUnit_32.dds',				1, 				1);
		
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 		Filename,   					IconsPerRow,  IconsPerColumn)
VALUES	('RELIGION_ATLAS_DINEBAHANE', 	256, 		'ReligionNavajo256.dds',				1, 				1),
		('RELIGION_ATLAS_DINEBAHANE', 	214, 		'ReligionNavajo214.dds',				1, 				1),
		('RELIGION_ATLAS_DINEBAHANE', 	128, 		'ReligionNavajo128.dds',				1, 				1),
		('RELIGION_ATLAS_DINEBAHANE', 	80, 		 'ReligionNavajo80.dds',				1, 				1),
		('RELIGION_ATLAS_DINEBAHANE', 	64, 		 'ReligionNavajo64.dds',				1, 				1),
		('RELIGION_ATLAS_DINEBAHANE', 	48, 		 'ReligionNavajo48.dds',				1, 				1),
		('RELIGION_ATLAS_DINEBAHANE', 	32, 		 'ReligionNavajo32.dds',				1, 				1),
		('RELIGION_ATLAS_DINEBAHANE', 	24, 		 'ReligionNavajo24.dds',				1, 				1),
		('RELIGION_ATLAS_DINEBAHANE', 	16, 		 'ReligionNavajo16.dds',				1, 				1);

INSERT INTO IconTextureAtlases
		(Atlas, 				IconSize, 	Filename, 				IconsPerRow, IconsPerColumn)
VALUES	('promoNavajo_atlas', 	256, 		'navajo_PI_256.dds', 	4, 				1),
		('promoNavajo_atlas', 	064, 		'navajo_PI_064.dds', 	4, 				1),
		('promoNavajo_atlas', 	045, 		'navajo_PI_045.dds', 	4, 				1),
		('promoNavajo_atlas', 	032, 		'navajo_PI_032.dds', 	4, 				1),
		('promoNavajo_atlas', 	016, 		'navajo_PI_016.dds', 	4, 				1);

INSERT INTO IconFontTextures 
			(IconFontTexture, 							IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_REL_DINEBAHANE', 	'ReligionNavajoFontIcons');

INSERT INTO IconFontMapping 
			(IconName, 						IconFontTexture,	 				IconMapping)
VALUES		('ICON_RELIGION_DINEBAHANE',	'ICON_FONT_TEXTURE_REL_DINEBAHANE',	1);
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 		LoadType)
VALUES	('SND_LEADER_MUSIC_JAR_MANUELITO_PEACE', 	'Navajo_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JAR_MANUELITO_WAR', 		'Navajo_War', 		'DynamicResident'),		
		('SND_AMBIENCE_WIND', 						'WindAmbience', 	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		DontTriggerDuplicates,	DontPlayMoreThan,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_JAR_MANUELITO_AMBIENCE','SND_AMBIENCE_WIND', 				'GAME_SFX', 	0,						0,					0.0,					70, 		70, 		0, 		 1),
		('AS2D_LEADER_MUSIC_JAR_MANUELITO_PEACE',	'SND_LEADER_MUSIC_JAR_MANUELITO_PEACE', 'GAME_MUSIC', 	0,						0,					-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JAR_MANUELITO_WAR', 	'SND_LEADER_MUSIC_JAR_MANUELITO_WAR', 	'GAME_MUSIC', 	0,						0,					-1.0,					60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,		Asset)
VALUES	('ART_DEF_UNIT_JAR_HATAALII',				'Unit', 		'Jar_HataaliiUnit_128.dds'),
		('ART_DEF_UNIT_JAR_CODETALKER',				'Unit', 		'Jar_CodeTalkerUnit_128.dds'),
		('ART_DEF_UNIT_JAR_NAABAAHII',				'Unit', 		'Jar_NaabaahiiUnit_128.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JAR_HATAALII', 				1, 			'LooseCivilian'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_PROPHET';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JAR_CODETALKER', 				DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PARATROOPER';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JAR_NAABAAHII', 				DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_SHOSHONE_COMANCHE_RIDERS';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
VALUES ('ART_DEF_UNIT_JAR_HATAALII', 	'ART_DEF_UNIT_MEMBER_JAR_HATAALII', 	1);

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,		NumMembers)
SELECT	'ART_DEF_UNIT_JAR_CODETALKER', 	UnitMemberInfoType, 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PARATROOPER';

INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                     UnitMemberInfoType,                   NumMembers)
SELECT    'ART_DEF_UNIT_JAR_NAABAAHII',     'ART_DEF_UNIT_MEMBER_JAR_NAABAAHII',   NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_SHOSHONE_COMANCHE_RIDERS';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
		(UnitMemberType, 						EnableActions, HasRefaceAfterCombat)
VALUES 	('ART_DEF_UNIT_MEMBER_JAR_HATAALII', 'Idle Death BombardDefend Run', 1);

INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                               EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_JAR_NAABAAHII', EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SHOSHONE_COMANCHE_RIDERS';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                              "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_JAR_NAABAAHII',"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SHOSHONE_COMANCHE_RIDERS';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale, ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_HATAALII',	Scale, ZOffset, Domain, 'NativeGreatProphet.fxsxml',			'CLOTH', 'FLESH'
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_PROPHET';

INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                         Scale,    ZOffset, Domain, Model,                    MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_JAR_NAABAAHII', Scale,    ZOffset, Domain, 'navajo_rider.fxsxml',    MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SHOSHONE_COMANCHE_RIDERS';
--==========================================================================================================================
-- IMPROVEMENT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_IMPROVEMENT_JAR_HOGAN',	'Improvement',	'sv_hogan.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_LandmarkTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes
		(Type,								LandmarkType,	FriendlyName)
VALUES 	('ART_DEF_IMPROVEMENT_JAR_HOGAN',	'Improvement',	'JAR_NAVAJO_HOGAN');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_Landmarks
		(Era,	State,				Scale,	ImprovementType,				LayoutHandler,		ResourceType,			Model,					TerrainContour)
VALUES 	('Any', 'UnderConstruction', 0.8,	'ART_DEF_IMPROVEMENT_JAR_HOGAN',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Hogan_HalfBuilt.fxsxml',	1),
		('Any', 'Constructed',		0.8,	'ART_DEF_IMPROVEMENT_JAR_HOGAN',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Hogan_Built.fxsxml',		1),
		('Any', 'Pillaged',			0.8,	'ART_DEF_IMPROVEMENT_JAR_HOGAN',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Hogan_Pillaged.fxsxml',	1); 
--==========================================================================================================================
-- RESOURCE DIYOGI
--==========================================================================================================================	
------------------------------	
-- ArtDefine_StrategicView
------------------------------		
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 				TileType, 		Asset)
VALUES 		('ART_DEF_RESOURCE_JAR_DIYOGI', 	'Resource', 	'IconDiyogi_256sv.dds');
------------------------------	
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 							LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_RESOURCE_JAR_DIYOGI', 	'Resource', 'JAR_NAVAJO_DIYOGI');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks
			(Era, 			State, 					Scale, 	ImprovementType, 					LayoutHandler, 	ResourceType, 						Model, 										TerrainContour,	Tech)
SELECT		 Era, 			State, 					Scale, 	ImprovementType, 					LayoutHandler, 	'ART_DEF_RESOURCE_JAR_DIYOGI', 		Model, 										TerrainContour,	Tech
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_WINE';
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
------------------------------
-- IconFontTextures
------------------------------
INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JAR_DIYOGI', 		'Diyogi_FontIcons');
------------------------------
-- IconFontMapping
------------------------------
INSERT INTO IconFontMapping 
		(IconName, 				IconFontTexture,				IconMapping)
VALUES	('ICON_RES_JAR_DIYOGI', 	'ICON_FONT_TEXTURE_JAR_DIYOGI',	1);
--==========================================================================================================================	
--==========================================================================================================================	
