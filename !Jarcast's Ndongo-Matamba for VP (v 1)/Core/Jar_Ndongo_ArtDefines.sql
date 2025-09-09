--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		TileType,	Asset)
VALUES	('ART_DEF_UNIT_JAR_POMBO',	'Unit', 	'sv_Pombo.dds'),
		('ART_DEF_UNIT_JAR_IMBARE',	'Unit', 	'sv_Imbare.dds'),
		('ART_DEF_UNIT_JAR_MAKUNZE','Unit', 	'sv_Makunze.dds'),
		('ART_DEF_UNIT_JAR_NGOLA', 	'Unit', 	'SVLSNdongoNzinga.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JAR_POMBO',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PIKEMAN';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JAR_IMBARE',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JAR_MAKUNZE',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_DIPLOMAT';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JAR_NGOLA',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JAR_POMBO', 	'ART_DEF_UNIT_MEMBER_JAR_POMBO',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PIKEMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JAR_IMBARE', 	'ART_DEF_UNIT_MEMBER_JAR_IMBARE',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PIKEMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JAR_MAKUNZE', 'ART_DEF_UNIT_MEMBER_JAR_MAKUNZE',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_DIPLOMAT';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType, 				UnitMemberInfoType, 				NumMembers)
VALUES	('ART_DEF_UNIT_JAR_NGOLA', 'ART_DEF_UNIT_MEMBER_JAR_NGOLA', 	1);
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_POMBO',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_IMBARE',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WARRIOR';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_MAKUNZE',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_NGOLA',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_POMBO',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_IMBARE',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WARRIOR';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_MAKUNZE',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_NGOLA',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 					 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_POMBO',	Scale,	ZOffset, Domain, 'EthiopiaSpearman.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 					 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_IMBARE',	Scale,	ZOffset, Domain, 'SonghaiSwordsman.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_WARRIOR';

INSERT INTO ArtDefine_UnitMemberInfos 														 
		(Type, 								Scale,	ZOffset, Domain, Model, 			 		MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_MAKUNZE',	Scale,	ZOffset, Domain, 'ZimbabweanGano.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT';

INSERT INTO ArtDefine_UnitMemberInfos
		(Type, 								Scale, ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_NGOLA', 	Scale, ZOffset, Domain, 'LSNzingaSonghaiSpear.fxsxml', 	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_SPEARMAN');
--==========================================================================================================================
-- IMPROVEMENT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,					TileType,		Asset)
VALUES	('ART_DEF_IMPROVEMENT_JAR_KILOMBO',	'Improvement',	'SV_Kilombo.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_LandmarkTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes 
		(Type,								LandmarkType,	FriendlyName)
VALUES	('ART_DEF_IMPROVEMENT_JAR_KILOMBO',	'Improvement',	'Jar_Kilombo');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_Landmarks
		(Era,	State,				Scale,	ImprovementType,				LayoutHandler,	ResourceType,				Model,				TerrainContour)
VALUES 	('Any', 'UnderConstruction', 0.8,	'ART_DEF_IMPROVEMENT_JAR_KILOMBO',	'SNAPSHOT',	'ART_DEF_RESOURCE_NONE', 	'Mocambo.fxsxml',		1),
		('Any', 'Constructed',		 1.1,	'ART_DEF_IMPROVEMENT_JAR_KILOMBO',	'RANDOM',	'ART_DEF_RESOURCE_NONE', 	'Kilombo_B.fxsxml',		1),
		('Any', 'Pillaged',			 1.1,	'ART_DEF_IMPROVEMENT_JAR_KILOMBO',	'RANDOM',	'ART_DEF_RESOURCE_NONE', 	'Kilombo_P.fxsxml',		1),
		('Any', 'UnderConstruction',	1,  'ART_DEF_IMPROVEMENT_JAR_MAKUNZE',	'RANDOM',	'ART_DEF_RESOURCE_ALL',		'UI_Makunze_HB.fxsxml',	1),
		('Any', 'Constructed',			1,  'ART_DEF_IMPROVEMENT_JAR_MAKUNZE',	'RANDOM',	'ART_DEF_RESOURCE_ALL',		'UI_Makunze_B.fxsxml',	1),
		('Any', 'Pillaged',				1,  'ART_DEF_IMPROVEMENT_JAR_MAKUNZE',	'RANDOM',	'ART_DEF_RESOURCE_ALL',		'UI_Makunze_PL.fxsxml',	1);
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 		LoadType)
VALUES	('SND_LEADER_MUSIC_JAR_NDONGO_PEACE',	'Nzinga_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JAR_NDONGO_WAR',		'Nzinga_War', 	'DynamicResident'),		
		('SND_AMBIENCE_NDONGO',					'Nzinga_Ambience', 'DynamicResident');		--24.15 - 26.04
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 							SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_JAR_NZINGA_AMBIENCE',	'SND_AMBIENCE_NDONGO',		'GAME_SFX', 	0.0,					99, 		99, 		0, 		 1),
		('AS2D_LEADER_MUSIC_JAR_NDONGO_PEACE',	'SND_LEADER_MUSIC_JAR_NDONGO_PEACE','GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JAR_NDONGO_WAR', 	'SND_LEADER_MUSIC_JAR_NDONGO_WAR', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)  
VALUES	('COLOR_PLAYER_JAR_NDONGO_ICON', 		0.494,	0.153,	0.067,	1), -- #7E2711
		('COLOR_PLAYER_JAR_NDONGO_BACKGROUND',	0.733,	0.686,	0.541,	1); -- #BBAF8A
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 						PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_JAR_NDONGO',	'COLOR_PLAYER_JAR_NDONGO_ICON',		'COLOR_PLAYER_JAR_NDONGO_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES	('JAR_NDONGO_ALPHA_ATLAS', 		128, 		'NdongoIconAtlas128.dds',		1,				2),
		('JAR_NDONGO_ALPHA_ATLAS', 		80, 		'NdongoIconAtlas080.dds',		1, 				2),
		('JAR_NDONGO_ALPHA_ATLAS', 		64, 		'NdongoIconAtlas064.dds',		1, 				2),
		('JAR_NDONGO_ALPHA_ATLAS', 		48, 		'NdongoIconAtlas048.dds',		1, 				2),
		('JAR_NDONGO_ALPHA_ATLAS', 		45, 		'NdongoIconAtlas045.dds',		1, 				2),
		('JAR_NDONGO_ALPHA_ATLAS', 		32, 		'NdongoIconAtlas032.dds',		1, 				2),
		('JAR_NDONGO_ALPHA_ATLAS', 		24, 		'NdongoIconAtlas024.dds',		1, 				2),
		('JAR_NDONGO_ALPHA_ATLAS', 		16, 		'NdongoIconAtlas016.dds',		1, 				2),
		('JAR_NDONGO_ICON_ATLAS', 		256, 		'NdongoIconAtlas256.dds',		4, 				3),
		('JAR_NDONGO_ICON_ATLAS', 		128, 		'NdongoIconAtlas128.dds',		4, 				3),
		('JAR_NDONGO_ICON_ATLAS', 		80, 		'NdongoIconAtlas080.dds',		4, 				3),
		('JAR_NDONGO_ICON_ATLAS', 		64, 		'NdongoIconAtlas064.dds',		4, 				3),
		('JAR_NDONGO_ICON_ATLAS', 		45, 		'NdongoIconAtlas045.dds',		4, 				3),
		('JAR_NDONGO_ICON_ATLAS', 		32, 		'NdongoIconAtlas032.dds',		4, 				3),
		('JAR_NDONGO_FLAG_POMBO',		32, 		'flag_Pombo.dds',				1, 				1),
		('JAR_NDONGO_FLAG_IMBARE',		32, 		'flag_Imbare.dds',				1, 				1),
		('JAR_NDONGO_FLAG_MAKUNZE',		32, 		'flag_Makunze.dds',				1, 				1),
		('JAR_NDONGO_FLAG_NGOLA',		32, 		'UnitAlphaLSNdongoNzinga.dds',	1, 				1),
		('JAR_NDONGO_PROMO_ATLAS', 		256, 		'Jar_Ndongo_PI_256.dds',		3,				1),
		('JAR_NDONGO_PROMO_ATLAS', 		64, 		'Jar_Ndongo_PI_064.dds',		3,				1),
		('JAR_NDONGO_PROMO_ATLAS', 		45, 		'Jar_Ndongo_PI_045.dds',		3,				1),
		('JAR_NDONGO_PROMO_ATLAS', 		32, 		'Jar_Ndongo_PI_032.dds',		3,				1),
		('JAR_NDONGO_PROMO_ATLAS', 		16, 		'Jar_Ndongo_PI_016.dds',		3,				1);
--==========================================================================================================================	
--==========================================================================================================================	
