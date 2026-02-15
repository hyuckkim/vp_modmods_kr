--=======================================================================================================================
-- IMPROVEMENT ART DEFINES
--=======================================================================================================================	
-- ArtDefine_LandmarkTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes
		(Type,								LandmarkType,	FriendlyName)
VALUES	('ART_DEF_IMPROVEMENT_JAR_BORGO',	'Improvement',	'Wonder');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,					TileType,		Asset) 
VALUES	('ART_DEF_IMPROVEMENT_JAR_BORGO',	'Improvement',	'sv_borgo.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_Landmarks 
		(Era,	State,					Scale,	ImprovementType,					LayoutHandler,	ResourceType,				Model,				TerrainContour)
VALUES	('Any', 'UnderConstruction',	1,  	'ART_DEF_IMPROVEMENT_JAR_BORGO',	'RANDOM',		'ART_DEF_RESOURCE_NONE',	'Comune_HB.fxsxml',	1),
		('Any', 'Constructed',			1,  	'ART_DEF_IMPROVEMENT_JAR_BORGO',	'RANDOM',		'ART_DEF_RESOURCE_NONE',	'Comune_B.fxsxml',	1),
		('Any', 'Pillaged',				1,  	'ART_DEF_IMPROVEMENT_JAR_BORGO',	'RANDOM',		'ART_DEF_RESOURCE_NONE',	'Comune_PL.fxsxml',	1);
--=======================================================================================================================
-- UNIT ART DEFINES
--=======================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_JAR_CONDOTTA',		'Unit', 		'sv_Condottiere.dds'),
		('ART_DEF_UNIT_JAR_BERSAGLIERI',	'Unit', 		'sv_Bersaglieri.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JAR_CONDOTTA',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_KNIGHT';
	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JAR_BERSAGLIERI',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JAR_CONDOTTA', 		'ART_DEF_UNIT_MEMBER_JAR_CONDOTTA',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_KNIGHT';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JAR_BERSAGLIERI', 	'ART_DEF_UNIT_MEMBER_JAR_BERSAGLIERI',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_CONDOTTA',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_BERSAGLIERI',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_CONDOTTA',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_BERSAGLIERI',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,  ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_CONDOTTA',	Scale,	ZOffset, Domain, 'condottiere.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_KNIGHT');

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_BERSAGLIERI',	Scale,	ZOffset, Domain, 'itagw1.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------  
INSERT INTO Audio_Sounds
        (SoundID,                                     Filename,             LoadType)
VALUES  ('SND_LEADER_MUSIC_JAR_UMBERTO_I_PEACE',     'JarItalyPeace',     'DynamicResident'),
        ('SND_LEADER_MUSIC_JAR_UMBERTO_I_WAR',         'JarItalyWar',         'DynamicResident'),      
        ('SND_AMBIENCE_BIRDS',                         'BirdsAmbience',     'DynamicResident');      
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------  
INSERT INTO Audio_2DSounds
        (ScriptID,                                         SoundID,                                 SoundType,         TaperSoundtrackVolume,    MinVolume,     MaxVolume,    IsMusic, Looping)
VALUES  ('AS2D_AMBIENCE_LEADER_JAR_UMBERTO_I_AMBIENCE',    'SND_AMBIENCE_BIRDS',                    'GAME_SFX',     0.0,                    30,         30,         0,          1),
        ('AS2D_LEADER_MUSIC_JAR_UMBERTO_I_PEACE',        'SND_LEADER_MUSIC_JAR_UMBERTO_I_PEACE',    'GAME_MUSIC',     -1.0,                    60,         60,         1,          0),
        ('AS2D_LEADER_MUSIC_JAR_UMBERTO_I_WAR',         'SND_LEADER_MUSIC_JAR_UMBERTO_I_WAR',     'GAME_MUSIC',     -1.0,                    90,         90,         1,         0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_JAR_ITALY_ICON', 		0.882,	0.584,	0.419,  1),
		('COLOR_PLAYER_JAR_ITALY_BACKGROUND', 	0.078,	0.215,	0.062,	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 						PrimaryColor, 					SecondaryColor, 						 TextColor)
VALUES	('PLAYERCOLOR_JAR_ITALY',	'COLOR_PLAYER_JAR_ITALY_ICON',	'COLOR_PLAYER_JAR_ITALY_BACKGROUND',	 'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES	('JAR_ITALY_ALPHA_ATLAS',		128, 		'atlas_italy_128.dds',			1,				2),
		('JAR_ITALY_ALPHA_ATLAS',		80, 		'atlas_italy_80.dds',			1, 				2),
		('JAR_ITALY_ALPHA_ATLAS',		64, 		'atlas_italy_64.dds',			1, 				2),
		('JAR_ITALY_ALPHA_ATLAS',		48, 		'atlas_italy_48.dds',			1, 				2),
		('JAR_ITALY_ALPHA_ATLAS',		45, 		'atlas_italy_45.dds',			1, 				2),
		('JAR_ITALY_ALPHA_ATLAS',		32, 		'atlas_italy_32.dds',			1, 				2),
		('JAR_ITALY_ALPHA_ATLAS',		24, 		'atlas_italy_24.dds',			1, 				2),
		('JAR_ITALY_ALPHA_ATLAS',		16, 		'atlas_italy_16.dds',			1, 				2),
		('JAR_ITALY_ICON_ATLAS', 		256, 		'atlas_italy_256.dds',			4, 				2),
		('JAR_ITALY_ICON_ATLAS', 		128, 		'atlas_italy_128.dds',			4, 				2),
		('JAR_ITALY_ICON_ATLAS', 		80, 		'atlas_italy_80.dds',			4, 				2),
		('JAR_ITALY_ICON_ATLAS', 		64, 		'atlas_italy_64.dds',			4, 				2),
		('JAR_ITALY_ICON_ATLAS', 		45, 		'atlas_italy_45.dds',			4, 				2),
		('JAR_ITALY_ICON_ATLAS', 		32, 		'atlas_italy_32.dds',			4, 				2),
		('UNIT_JAR_CONDOTTA_FLAG', 		32, 		'flag_Condottiere.dds',			1, 				1),
		('UNIT_JAR_BERSAGLIERI_FLAG', 	32, 		'flag_Bersaglieri.dds',			1, 				1),
		('JAR_ITALY_PROMO_ATLAS', 		256, 		'Jar_Italy_PI_256.dds',			3,				1),
		('JAR_ITALY_PROMO_ATLAS', 		64, 		'Jar_Italy_PI_064.dds',			3,				1),
		('JAR_ITALY_PROMO_ATLAS', 		45, 		'Jar_Italy_PI_045.dds',			3,				1),
		('JAR_ITALY_PROMO_ATLAS', 		32, 		'Jar_Italy_PI_032.dds',			3,				1),
		('JAR_ITALY_PROMO_ATLAS', 		16, 		'Jar_Italy_PI_016.dds',			3,				1);
--=======================================================================================================================	
--=======================================================================================================================	
