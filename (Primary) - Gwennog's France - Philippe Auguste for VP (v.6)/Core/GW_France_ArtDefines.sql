--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 									Red, 			Green, 			Blue, 			Alpha)
VALUES		('COLOR_PLAYER_GW_FRANCE_ICON', 		1.000,			0.757,			0.078,			1),
			('COLOR_PLAYER_GW_FRANCE_BACKGROUND',	0.008,			0.541,			0.769,			1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 							PrimaryColor, 					SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_GW_FRANCE',		'COLOR_PLAYER_GW_FRANCE_ICON', 	'COLOR_PLAYER_GW_FRANCE_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 						IconSize, 		Filename, 					IconsPerRow, 	IconsPerColumn)
VALUES		('GW_FRANCE_ATLAS', 			256, 		'GW_FRANCE_Atlas_256.dds',		3, 				2),
			('GW_FRANCE_ATLAS', 			128, 		'GW_FRANCE_Atlas_128.dds',		3, 				2),
			('GW_FRANCE_ATLAS', 			80, 		'GW_FRANCE_Atlas_080.dds',		3, 				2),
			('GW_FRANCE_ATLAS', 			64, 		'GW_FRANCE_Atlas_064.dds',		3, 				2),
			('GW_FRANCE_ATLAS', 			45, 		'GW_FRANCE_Atlas_045.dds',		3, 				2),
			('GW_FRANCE_ATLAS', 			32, 		'GW_FRANCE_Atlas_032.dds',		3, 				2),
			('GW_FRANCE_ALPHA_ATLAS', 		64, 		'GW_FRANCE_Alpha_064.dds',		1, 				1),
			('GW_FRANCE_ALPHA_ATLAS', 		48, 		'GW_FRANCE_Alpha_048.dds',		1, 				1),
			('GW_FRANCE_ALPHA_ATLAS', 		32, 		'GW_FRANCE_Alpha_032.dds',		1, 				1),
			('GW_FRANCE_ALPHA_ATLAS', 		24, 		'GW_FRANCE_Alpha_024.dds',		1, 				1),
			('GW_FRANCE_UNIT_FLAG', 		32, 		'Flag_GW_FRANCE_032.dds',		2, 				1),
			('GW_FRANCE_PROMOTION_ATLAS', 	256, 		'GW_France_PI_256.dds',			5, 				1),
			('GW_FRANCE_PROMOTION_ATLAS', 	64, 		'GW_France_PI_064.dds',			5, 				1),
			('GW_FRANCE_PROMOTION_ATLAS', 	45, 		'GW_France_PI_045.dds',			5, 				1),
			('GW_FRANCE_PROMOTION_ATLAS', 	32, 		'GW_France_PI_032.dds',			5, 				1),
			('GW_FRANCE_PROMOTION_ATLAS', 	16, 		'GW_France_PI_016.dds',			5, 				1);
--==========================================================================================================================
-- Audio_Sounds
--==========================================================================================================================	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_GW_FRANCE_PHILIPPE_PEACE', 	'GW_France_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_GW_FRANCE_PHILIPPE_WAR', 	'GW_France_War', 	'DynamicResident');
--==========================================================================================================================
-- Audio_2DSounds
--==========================================================================================================================	
INSERT INTO Audio_2DSounds	
		(ScriptID, 										SoundID, 										SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_GW_FRANCE_PHILIPPE_PEACE',	'SND_LEADER_MUSIC_GW_FRANCE_PHILIPPE_PEACE', 	'GAME_MUSIC', 	70, 		70, 		1, 		 0),
		('AS2D_LEADER_MUSIC_GW_FRANCE_PHILIPPE_WAR', 	'SND_LEADER_MUSIC_GW_FRANCE_PHILIPPE_WAR',		'GAME_MUSIC', 	85, 		85, 		1,		 0);
--==========================================================================================================================	
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
SELECT	'ART_DEF_UNIT_GW_FRANCE_CHEVALIER',	TileType,	'SV_GW_France_Chevalier.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_KNIGHT';
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_GW_FRANCE_CHEVALIER',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_KNIGHT';
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_GW_FRANCE_CHEVALIER',	'ART_DEF_UNIT_MEMBER_GW_FRANCE_CHEVALIER',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_KNIGHT';
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_GW_FRANCE_CHEVALIER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GW_FRANCE_CHEVALIER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GW_FRANCE_CHEVALIER',	Scale,	ZOffset, Domain, 'Knight_France_v2.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_KNIGHT';
--==========================================================================================================================
-- IMPROVEMENT CHATEAU
--==========================================================================================================================
--------------------------------
-- ArtDefine_Landmarks
--------------------------------
UPDATE ArtDefine_Landmarks SET
	Era = 'Ancient',
	Scale = 0.16,
	Tech = 'TECH_CHIVALRY'
WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_SCHLOSS';

INSERT INTO ArtDefine_Landmarks
		(Era, 		State,					Scale,	ImprovementType,				LayoutHandler,  ResourceType,			 Model,						TerrainContour,	Tech)
VALUES	('Ancient',	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_SCHLOSS',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',  'HB_Norman_Fort.fxsxml',	1,				NULL),
		('Ancient',	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_SCHLOSS',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',  'Norman_Fort.fxsxml',		1,				NULL),
		('Ancient',	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_SCHLOSS',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',  'PL_Norman_Fort.fxsxml',	1,				NULL);

INSERT INTO ArtDefine_Landmarks 
		(Era, 		State,					Scale,	ImprovementType,				LayoutHandler,  ResourceType,			 Model,					TerrainContour,	Tech)
VALUES	('Ancient',	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_SCHLOSS',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',  'Chateau_HB.fxsxml',	0,				'TECH_ARCHITECTURE'),
		('Ancient',	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_SCHLOSS',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',  'Chateau.fxsxml',		0,				'TECH_ARCHITECTURE'),
		('Ancient',	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_SCHLOSS',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',  'Chateau_PIL.fxsxml',	0,				'TECH_ARCHITECTURE');	