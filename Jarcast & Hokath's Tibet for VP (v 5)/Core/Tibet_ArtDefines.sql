--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn)
VALUES	('JAR_TIBET_ATLAS', 			256, 		'Tibet_IconAtlas_256.dds',	4, 				3),
		('JAR_TIBET_ATLAS', 			128, 		'Tibet_IconAtlas_128.dds',	4, 				3),
		('JAR_TIBET_ATLAS', 			80, 		'Tibet_IconAtlas_80.dds',	4, 				3),
		('JAR_TIBET_ATLAS', 			64, 		'Tibet_IconAtlas_64.dds',	4, 				3),
		('JAR_TIBET_ATLAS', 			45, 		'Tibet_IconAtlas_45.dds',	4, 				3),
		('JAR_TIBET_ATLAS', 			32, 		'Tibet_IconAtlas_32.dds',	4, 				3),
		('JAR_TIBET_ALPHA_ATLAS', 		128, 		'Tibet_IconAtlas_128.dds',	1, 				2),
		('JAR_TIBET_ALPHA_ATLAS', 		80, 		'Tibet_IconAtlas_80.dds',	1, 				2),
		('JAR_TIBET_ALPHA_ATLAS', 		64, 		'Tibet_IconAtlas_64.dds',	1, 				2),
		('JAR_TIBET_ALPHA_ATLAS', 		48, 		'Tibet_IconAtlas_48.dds',	1, 				2),
		('JAR_TIBET_ALPHA_ATLAS', 		45, 		'Tibet_IconAtlas_45.dds',	1, 				2),
		('JAR_TIBET_ALPHA_ATLAS', 		32, 		'Tibet_IconAtlas_32.dds',	1, 				2),
		('JAR_TIBET_ALPHA_ATLAS', 		24, 		'Tibet_IconAtlas_24.dds',	1, 				2),
		('UNIT_JAR_RTAKHRAB_FLAG', 		32, 		'flag_Rtakhrab.dds',		1, 				1),
		('UNIT_JAR_DOBDOB_FLAG', 		32, 		'flag_DobDob.dds',			1, 				1),
		('JAR_DOBDOB_ACTION_ATLAS', 	64, 		'DobDobAction_64.dds',		1, 				1),
		('JAR_DOBDOB_ACTION_ATLAS', 	45, 		'DobDobAction_45.dds',		1, 				1),
		('JAR_TIBET_PROMO_ATLAS', 		256, 		'Jar_Tibet_PI_256.dds',		6, 				1),
		('JAR_TIBET_PROMO_ATLAS', 		64, 		'Jar_Tibet_PI_064.dds',		6, 				1),
		('JAR_TIBET_PROMO_ATLAS', 		45, 		'Jar_Tibet_PI_045.dds',		6, 				1),
		('JAR_TIBET_PROMO_ATLAS', 		32, 		'Jar_Tibet_PI_032.dds',		6, 				1),
		('JAR_TIBET_PROMO_ATLAS', 		16, 		'Jar_Tibet_PI_016.dds',		6, 				1);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_JAR_RTAKHRAB',	'Unit', 	'sv_Rtakhrab.dds';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		TileType,	Asset)
SELECT	'ART_DEF_UNIT_JAR_DOBDOB',	'Unit', 	'sv_DobDob.dds';
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JAR_RTAKHRAB',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	Type = 'ART_DEF_UNIT_KNIGHT';
	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JAR_DOBDOB',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	Type = 'ART_DEF_UNIT_INQUISITOR';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JAR_RTAKHRAB', 	'ART_DEF_UNIT_MEMBER_JAR_RTAKHRAB', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_KNIGHT';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JAR_DOBDOB', 'ART_DEF_UNIT_MEMBER_JAR_DOBDOB', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_LONGSWORDSMAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_RTAKHRAB',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_DOBDOB',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_INQUISITOR');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_RTAKHRAB',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_DOBDOB',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WARRIOR' AND "Index"=0;
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale, ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_RTAKHRAB',	Scale, ZOffset, Domain, 'Knight_China.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_KNIGHT';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale, ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_DOBDOB',	Scale, ZOffset, Domain, 'buddhist_missionary.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_INQUISITOR_02';
--==========================================================================================================================
-- Yak Resource
--==========================================================================================================================
-- IconFontTextures
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconFontTextures 
		(IconFontTexture, 				IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JAR_YAK', 	'FontIcons_Yak');
--------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconFontMapping 
		(IconName, 				IconFontTexture,				IconMapping)
VALUES	('ICON_RES_JAR_YAK', 	'ICON_FONT_TEXTURE_JAR_YAK',	1);
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,				TileType,	Asset) 
VALUES	('ART_DEF_RESOURCE_JAR_YAK',	'Resource',	'sv_Yak.dds');
--------------------------------------------------------------------------------------------------------------------------		
-- ArtDefine_LandmarkTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes 
		(Type,							LandmarkType,	FriendlyName) 
VALUES	('ART_DEF_RESOURCE_JAR_YAK',	'Resource',		'Jar_Yak');	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_Landmarks 
		(Era,	State,	Scale,	ImprovementType,				LayoutHandler,		ResourceType,				Model,					TerrainContour)
SELECT	 'Any',	'Any',	'0.08',	'ART_DEF_IMPROVEMENT_NONE',		'ANIMATED_ROTATED',	'ART_DEF_RESOURCE_JAR_YAK', 'resource_yak.fxsxml',	1 UNION ALL
SELECT	 'Any',	'Any',	'0.08',	'ART_DEF_IMPROVEMENT_PASTURE',	'ANIMATED_ROTATED',	'ART_DEF_RESOURCE_JAR_YAK', 'resource_yak.fxsxml',	1;
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JAR_TIBET_ICON', 		0.153,	0.655,	0.376,		1),
		('COLOR_PLAYER_JAR_TIBET_BACKGROUND', 	0.855,	0.855,	0.855,		1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors
		(Type, 						PrimaryColor, 					SecondaryColor, 					TextColor)
VALUES	('PLAYERCOLOR_JAR_TIBET',	'COLOR_PLAYER_JAR_TIBET_ICON', 	'COLOR_PLAYER_JAR_TIBET_BACKGROUND', 'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JAR_SONGTSAN_GAMPO_PEACE', 	'TibetPeace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JAR_SONGTSAN_GAMPO_WAR', 	'TibetWar', 		'DynamicResident'),
		('SND_AMBIENCE_BUDDHISTCHANT', 					'TibetAmbience', 	'DynamicResident'),
		('SND_DOM_SPEECH_JAR_TIBET', 					'TibetDoM',			'DynamicResident');			
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_JAR_SONGTSEN_GAMPO_AMBIENCE','SND_AMBIENCE_BUDDHISTCHANT', 					'GAME_SFX', 	0.0,					80, 		80, 		0, 		 1),
		('AS2D_LEADER_MUSIC_JAR_SONGTSAN_GAMPO_PEACE', 		'SND_LEADER_MUSIC_JAR_SONGTSAN_GAMPO_PEACE', 	'GAME_MUSIC', 	-1.0,					100, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JAR_SONGTSAN_GAMPO_WAR', 		'SND_LEADER_MUSIC_JAR_SONGTSAN_GAMPO_WAR', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1,		 0),
		('AS2D_DOM_SPEECH_JAR_TIBET', 						'SND_DOM_SPEECH_JAR_TIBET',						'GAME_SPEECH', 	-1.0,					100, 		100, 		0, 		 0);
--==========================================================================================================================
--==========================================================================================================================