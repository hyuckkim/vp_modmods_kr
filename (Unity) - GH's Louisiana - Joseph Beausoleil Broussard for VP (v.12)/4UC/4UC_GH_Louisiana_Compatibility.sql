--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_LOUISIANA_KREWE', 	'Unit', 	'sv_Louisiana_Krewe.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_LOUISIANA_KREWE',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_MUSICIAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,							NumMembers)
VALUES	('ART_DEF_UNIT_LOUISIANA_KREWE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_KREWE_1',		1),
		('ART_DEF_UNIT_LOUISIANA_KREWE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_KREWE_2',		1),
		('ART_DEF_UNIT_LOUISIANA_KREWE',	'ART_DEF_UNIT_MEMBER_LOUISIANA_KREWE_3',		1);
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
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
-- ArtDefine_UnitMemberInfos
------------------------------
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
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 										Description, 											Help, 													Sound, 				RangeChange,	RangedAttackModifier,	MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 							PediaType,			PediaEntry)
VALUES	('PROMOTION_GH_LOUISIANA_KREWE_MARDIGRAS',	'TXT_KEY_PROMOTION_GH_LOUISIANA_KREWE_MARDIGRAS',		'TXT_KEY_PROMOTION_GH_LOUISIANA_KREWE_MARDIGRAS_HELP',	'AS2D_IF_LEVELUP',	0,				0,						0,				0,			0,			0,					0,			0,					1, 				7, 				'GH_LOUISIANA_PROMOTION_ATLAS', 	'PEDIA_CIVILIAN',	'TXT_KEY_PROMOTION_GH_LOUISIANA_KREWE_MARDIGRAS');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
INSERT INTO Units
		(Type, 						Class, Cost,  Moves, CivilianAttackPriority, Special, Domain, Capture,	CombatClass,	MinAreaSize,	NukeDamageLevel,	DefaultUnitAI, WorkRate, CombatLimit, OneShotTourism, OneShotTourismPercentOthers, TourismBonusTurns,	MoveRate, BaseSightRange,	UnitArtInfoEraVariation,	ShowInPedia,	PurchaseCooldown,	GlobalFaithPurchaseCooldown,	Description, 						Civilopedia, 									Help, 										Strategy,										AdvancedStartCost,	UnitArtInfo,					UnitFlagIconOffset,	UnitFlagAtlas,		PortraitIndex, 	IconAtlas)
SELECT	'UNIT_GH_LOUISIANA_KREWE',	Class, Cost,  Moves, CivilianAttackPriority, Special, Domain, Capture,	CombatClass,	MinAreaSize,	NukeDamageLevel,	DefaultUnitAI, WorkRate, CombatLimit, OneShotTourism, OneShotTourismPercentOthers, TourismBonusTurns,	MoveRate, BaseSightRange,	UnitArtInfoEraVariation,	ShowInPedia,	PurchaseCooldown,	GlobalFaithPurchaseCooldown,	'TXT_KEY_UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_CIV5_UNIT_GH_LOUISIANA_KREWE_TEXT', 	'TXT_KEY_UNIT_GH_LOUISIANA_KREWE_HELP', 	'TXT_KEY_UNIT_GH_LOUISIANA_KREWE_STRATEGY',		AdvancedStartCost, 	'ART_DEF_UNIT_LOUISIANA_KREWE',	0,					'GH_KREWE_FLAG',	5, 				'GH_LOUISIANA_ATLAS'
FROM Units WHERE Type = 'UNIT_MUSICIAN';
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GH_LOUISIANA_KREWE', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSICIAN';
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
		(UnitType, 				UnitAIType)
SELECT	'UNIT_GH_LOUISIANA_KREWE', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MUSICIAN';
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_GH_LOUISIANA_KREWE', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MUSICIAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_GH_LOUISIANA_KREWE',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MUSICIAN';

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
VALUES	('UNIT_GH_LOUISIANA_KREWE',	'PROMOTION_GH_LOUISIANA_KREWE_MARDIGRAS');
--==========================================================================================================================
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
		(SoundID, 					Filename, 		LoadType,		DontCache)		
VALUES	('SND_KREWE_K__001', 		'K__001', 		'Streamed',		1),
		('SND_KREWE_K__002', 		'K__002', 		'Streamed',		1),
		('SND_KREWE_K__003', 		'K__003', 		'Streamed',		1),
		('SND_KREWE_K__004', 		'K__004', 		'Streamed',		1),
		('SND_KREWE_K__005', 		'K__005', 		'Streamed',		1),
		('SND_KREWE_K__006', 		'K__006', 		'Streamed',		1),
		('SND_KREWE_K__007', 		'K__007', 		'Streamed',		1),
		('SND_KREWE_K__008', 		'K__008', 		'Streamed',		1),
		('SND_KREWE_K__009', 		'K__009', 		'Streamed',		1),
		('SND_KREWE_K__010', 		'K__010', 		'Streamed',		1),
		('SND_KREWE_K__011', 		'K__011', 		'Streamed',		1),		
		('SND_KREWE_K__012', 		'K__012', 		'Streamed',		1),
		('SND_KREWE_K__013', 		'K__013', 		'Streamed',		1),				
		('SND_KREWE_K__014', 		'K__014', 		'Streamed',		1),
		('SND_KREWE_K__015', 		'K__015', 		'Streamed',		1),				
		('SND_KREWE_K__016', 		'K__016', 		'Streamed',		1),
		('SND_KREWE_K__017', 		'K__017', 		'Streamed',		1),				
		('SND_KREWE_K__018', 		'K__018', 		'Streamed',		1),
		('SND_KREWE_K__019', 		'K__019', 		'Streamed',		1),				
		('SND_KREWE_K__020', 		'K__020', 		'Streamed',		1),				
		('SND_KREWE_K__021', 		'K__021', 		'Streamed',		1),
		('SND_KREWE_K__022', 		'K__022', 		'Streamed',		1),
		('SND_KREWE_K__023', 		'K__023', 		'Streamed',		1);		
--==========================================================================================================================
-- Audio_2DSounds
--==========================================================================================================================
INSERT INTO Audio_2DSounds	
		(ScriptID, 				SoundID, 				SoundType, 				TaperSoundtrackVolume)
VALUES	('AS2D_KREWE_K__001',	'SND_KREWE_K__001',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__002',	'SND_KREWE_K__002',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__003',	'SND_KREWE_K__003',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__004',	'SND_KREWE_K__004',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__005',	'SND_KREWE_K__005',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__006',	'SND_KREWE_K__006',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__007',	'SND_KREWE_K__007',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__008',	'SND_KREWE_K__008',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__009',	'SND_KREWE_K__009',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__010',	'SND_KREWE_K__010',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__011',	'SND_KREWE_K__011',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__012',	'SND_KREWE_K__012',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__013',	'SND_KREWE_K__013',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__014',	'SND_KREWE_K__014',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__015',	'SND_KREWE_K__015',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__016',	'SND_KREWE_K__016',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__017',	'SND_KREWE_K__017',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__018',	'SND_KREWE_K__018',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__019',	'SND_KREWE_K__019',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__020',	'SND_KREWE_K__020',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__021',	'SND_KREWE_K__021',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__022',	'SND_KREWE_K__022',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__023',	'SND_KREWE_K__023',		'GAME_MUSIC_STINGS', 	'0.0');
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 	
		(UnitType, 				UniqueName,						GreatWorkType)
VALUES	('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__001',	'GREAT_WORK_SK_001'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__002',	'GREAT_WORK_SK_002'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__003',	'GREAT_WORK_SK_003'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__004',	'GREAT_WORK_SK_004'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__005',	'GREAT_WORK_SK_005'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__006',	'GREAT_WORK_SK_006'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__007',	'GREAT_WORK_SK_007'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__008',	'GREAT_WORK_SK_008'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__009',	'GREAT_WORK_SK_009'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__010',	'GREAT_WORK_SK_010'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__011',	'GREAT_WORK_SK_011'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__012',	'GREAT_WORK_SK_012'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__013',	'GREAT_WORK_SK_013'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__014',	'GREAT_WORK_SK_014'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__015',	'GREAT_WORK_SK_015'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__016',	'GREAT_WORK_SK_016'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__017',	'GREAT_WORK_SK_017'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__018',	'GREAT_WORK_SK_018'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__019',	'GREAT_WORK_SK_019'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__020',	'GREAT_WORK_SK_020'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__021',	'GREAT_WORK_SK_021'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__022',	'GREAT_WORK_SK_022'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__023',	'GREAT_WORK_SK_023');
--==========================================================================================================================
-- GreatWorks
--==========================================================================================================================
INSERT INTO GreatWorks
		(Type, GreatWorkClassType, Description, Audio, Image)
VALUES	('GREAT_WORK_SK_001', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_001', 'AS2D_KREWE_K__001', 'BG_01_Allen_Toussaint.dds'),
		('GREAT_WORK_SK_002', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_002', 'AS2D_KREWE_K__002', 'BG_Cajun.dds'),
		('GREAT_WORK_SK_003', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_003', 'AS2D_KREWE_K__003', 'BG_03_Aurora_Nealand.dds'),
		('GREAT_WORK_SK_004', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_004', 'AS2D_KREWE_K__004', 'BG_Cajun_Zydeco.dds'),
		('GREAT_WORK_SK_005', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_005', 'AS2D_KREWE_K__005', 'BG_05_Clifton_Chenier.dds'),
		('GREAT_WORK_SK_006', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_006', 'AS2D_KREWE_K__006', 'BG_06_Creedence_Clearwater_Revival.dds'),
		('GREAT_WORK_SK_007', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_007', 'AS2D_KREWE_K__007', 'BG_07_Dr_John.dds'),
		('GREAT_WORK_SK_008', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_008', 'AS2D_KREWE_K__008', 'BG_08_Rod_Bernard.dds'),
		('GREAT_WORK_SK_009', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_009', 'AS2D_KREWE_K__009', 'BG_09_Fat_Domino.dds'),
		('GREAT_WORK_SK_010', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_010', 'AS2D_KREWE_K__010', 'BG_10_Jelly_Roll_Morton.dds'),
		('GREAT_WORK_SK_011', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_011', 'AS2D_KREWE_K__011', 'BG_Cajun_Zydeco.dds'),
		('GREAT_WORK_SK_012', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_012', 'AS2D_KREWE_K__012', 'BG_12_Kid_Ory.dds'),
		('GREAT_WORK_SK_013', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_013', 'AS2D_KREWE_K__013', 'BG_13_Lightnin_slim.dds'),
		('GREAT_WORK_SK_014', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_014', 'AS2D_KREWE_K__014', 'BG_14_Louis_Armstrong.dds'),
		('GREAT_WORK_SK_015', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_015', 'AS2D_KREWE_K__015', 'BG_15_Mahalia_Jackson.dds'),
		('GREAT_WORK_SK_016', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_016', 'AS2D_KREWE_K__016', 'BG_16_Professor_Longhair.dds'),
		('GREAT_WORK_SK_017', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_017', 'AS2D_KREWE_K__017', 'BG_Blues.dds'),
		('GREAT_WORK_SK_018', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_018', 'AS2D_KREWE_K__018', 'BG_18_Sydney_Bechet.dds'),
		('GREAT_WORK_SK_019', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_019', 'AS2D_KREWE_K__019', 'BG_19_The_Meters.dds'),
		('GREAT_WORK_SK_020', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_020', 'AS2D_KREWE_K__020', 'BG_Cajun.dds'),
		('GREAT_WORK_SK_021', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_021', 'AS2D_KREWE_K__021', 'BG_21_Zachary_Richard.dds'),
		('GREAT_WORK_SK_022', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_022', 'AS2D_KREWE_K__022', 'BG_22_Zydeco_Joe.dds'),
		('GREAT_WORK_SK_023', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_023', 'AS2D_KREWE_K__023', 'BG_23_Jon_Batiste.dds');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
------------------------------
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
		(Type, 													DefaultBuilding, 									Description,											NoLimit)
VALUES	('BUILDINGCLASS_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD',	'BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD',		'TXT_KEY_BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD',	1),
		('BUILDINGCLASS_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD',	'BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD',		'TXT_KEY_BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD',	1),
		('BUILDINGCLASS_D_GH_LOUISIANA_FROM_KREWE',				'BUILDING_D_GH_LOUISIANA_FROM_KREWE',				'TXT_KEY_BUILDING_D_GH_LOUISIANA_FROM_KREWE',			1);
------------------------------
-- Buildings
------------------------------	
INSERT INTO	Buildings
		(Type, 								Description,								Civilopedia,										Strategy,											Help,												ThemingBonusHelp,										GoldMaintenance, Cost,	HurryCostModifier, MinAreaSize, ConquestProb,	BuildingClass, ArtDefineTag, PrereqTech, 		PortraitIndex,	IconAtlas,				NeverCapture, NukeImmune, NumCityCostMod,	GreatWorkSlotType,			GreatWorkCount,	SpecialistType,			GreatPeopleRateChange,	BoredomFlatReductionGlobal,	ReligiousUnrestFlatReductionGlobal,	CultureRateModifier,	GreatPeopleRateModifier,	NationalPopRequired)
SELECT	'BUILDING_GH_LOUISIANA_VIEUXCARRE',	'TXT_KEY_BUILDING_GH_LOUISIANA_VIEUXCARRE',	'TXT_KEY_BUILDING_GH_LOUISIANA_VIEUXCARRE_TEXT',	'TXT_BUILDING_GH_LOUISIANA_VIEUXCARRE_STRATEGY',	'TXT_KEY_BUILDING_GH_LOUISIANA_VIEUXCARRE_HELP',	'TXT_KEY_GH_LOUISIANA_VIEUXCARRE_THEMING_BONUS_HELP',	GoldMaintenance, Cost,	HurryCostModifier, MinAreaSize, ConquestProb,	BuildingClass, ArtDefineTag, 'TECH_ACOUSTICS',	2,				'GH_LOUISIANA_ATLAS',	NeverCapture, NukeImmune, 0,				'GREAT_WORK_SLOT_MUSIC',	GreatWorkCount,	'SPECIALIST_MUSICIAN',	3,						BoredomFlatReductionGlobal,	1,									CultureRateModifier,	25,							0
FROM	Buildings WHERE Type = 'BUILDING_HERMITAGE';

INSERT INTO Buildings
		(Type, 						 						BuildingClass, 											Cost,	FaithCost,	GreatWorkCount,	NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	MinAreaSize,	IconAtlas,			PortraitIndex,	IsDummy,	Description)
VALUES	('BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD', 	'BUILDINGCLASS_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD',	-1,		-1,			-1,				1,				1,			0,				-1,					-1,				'CIV_COLOR_ATLAS',	0,				1,			'TXT_KEY_BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD'),
		('BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD', 	'BUILDINGCLASS_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD',	-1,		-1,			-1,				1,				1,			0,				-1,					-1,				'CIV_COLOR_ATLAS',	0,				1,			'TXT_KEY_BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD'),
		('BUILDING_D_GH_LOUISIANA_FROM_KREWE', 				'BUILDINGCLASS_D_GH_LOUISIANA_FROM_KREWE',				-1,		-1,			-1,				1,				1,			0,				-1,					-1,				'CIV_COLOR_ATLAS',	0,				1,			'TXT_KEY_BUILDING_D_GH_LOUISIANA_FROM_KREWE');
------------------------------	
-- Building_UnitCombatProductionModifiers
------------------------------	
INSERT INTO Building_UnitCombatProductionModifiers
		(BuildingType,										UnitCombatType,				Modifier)
VALUES	('BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD',	'UNITCOMBAT_DIPLOMACY',		50);
------------------------------	
-- Building_SpecialistYieldChanges
------------------------------	
INSERT INTO Building_SpecialistYieldChanges
		(BuildingType,							SpecialistType, 				YieldType,			Yield)
VALUES	('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'SPECIALIST_CIVIL_SERVANT',		'YIELD_TOURISM',	1),
		('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'SPECIALIST_MERCHANT',			'YIELD_TOURISM',	1),
		('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'SPECIALIST_MUSICIAN',			'YIELD_TOURISM',	1);
------------------------------	
-- Building_YieldChangesPerPop
------------------------------	
INSERT INTO Building_YieldChangesPerPop 
		(BuildingType,							YieldType,			Yield)
SELECT	'BUILDING_GH_LOUISIANA_VIEUXCARRE',		YieldType,			Yield
FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_HERMITAGE';
------------------------------	
-- Building_GreatWorkYieldChangesLocal
------------------------------	
INSERT INTO Building_GreatWorkYieldChangesLocal 
		(BuildingType,							YieldType,			Yield)
VALUES	('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'YIELD_TOURISM',	1);
------------------------------	
-- Building_ResourceQuantity
------------------------------	
INSERT INTO Building_ResourceQuantity	
		(BuildingType,							ResourceType,		Quantity)
VALUES	('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'RESOURCE_PAPER',	1);
------------------------------	
-- Building_ThemingBonuses
------------------------------
INSERT INTO Building_ThemingBonuses 
		(BuildingType,							Description,										Bonus,	ConsecutiveEras,	RequiresOwner,	AIPriority)
VALUES	('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'TXT_KEY_THEMING_BONUS_GH_LOUISIANA_VIEUXCARRE',	15,		1,					1,				5);
------------------------------	
-- Building_ThemingYieldBonus
------------------------------	
INSERT INTO Building_ThemingYieldBonus 
		(BuildingType,							YieldType,			Yield) 
VALUES	('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'YIELD_GOLD',		10),
		('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'YIELD_CULTURE',	10);
------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType,			Flavor)
SELECT	'BUILDING_GH_LOUISIANA_VIEUXCARRE',		FlavorType,			Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_HERMITAGE';

INSERT INTO Building_Flavors
		(BuildingType, 							FlavorType,				Flavor)
VALUES	('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'FLAVOR_GREAT_PEOPLE',	50);
------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------		
INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType,							BuildingClassType,		YieldType,			YieldChange) 		
SELECT	'BUILDING_D_GH_LOUISIANA_FROM_KREWE',	BuildingClass,			'YIELD_TOURISM',	1
FROM	Buildings WHERE (SpecialistType = 'SPECIALIST_MUSICIAN' OR SpecialistType = 'SPECIALIST_MERCHANT' OR SpecialistType = 'SPECIALIST_CIVIL_SERVANT' OR GreatWorkSlotType ='GREAT_WORK_SLOT_MUSIC');
------------------------------	
-- Building_ImprovementYieldChangesGlobal
------------------------------	
INSERT INTO Building_ImprovementYieldChangesGlobal 
		(BuildingType,							ImprovementType,						YieldType,			Yield) 
VALUES	('BUILDING_D_GH_LOUISIANA_FROM_KREWE',	'IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'YIELD_TOURISM',	1);
--==========================================================================================================================	
-- EVENTS
--==========================================================================================================================	
-- EventChoices
--------------------------------	
INSERT INTO EventChoices
		(Type,											Description, 									Help,												IsOneShot,	EventDuration,	Expires,	CapitalEffectOnly,	EventBuildingClassGlobal,					RequiredCiv)
VALUES	('PLAYER_EVENT_CHOICE_GH_TOURISM_MUSIC_BONUS',	'TXT_KEY_PLAYER_EVENT_GH_TOURISM_MUSIC_BONUS',	'TXT_KEY_PLAYER_EVENT_GH_TOURISM_MUSIC_BONUS_HELP',	0,			15,				1,			1,					'BUILDINGCLASS_D_GH_LOUISIANA_FROM_KREWE',	'CIVILIZATION_GH_LOUISIANA');
------------------------------	
-- Events
------------------------------	
INSERT INTO Events
		(Type,									EventClass,					Description, 										Help,													RandomChance,	RandomChanceDelta,	IsOneShot,	Global,	EraScaling,	EventCooldown,	NumChoices,	IgnoresGlobalCooldown,	RequiredCiv)
VALUES	('PLAYER_EVENT_GH_TOURISM_MUSIC_BONUS',	'EVENT_CLASS_CIV_SPECIFIC',	'TXT_KEY_PLAYER_EVENT_P_GH_TOURISM_MUSIC_BONUS',	'TXT_KEY_PLAYER_EVENT_P_GH_TOURISM_MUSIC_BONUS_HELP',	0,				0,					0,			0,		0,			0,				1,			0,						'CIVILIZATION_GH_LOUISIANA');
------------------------------	
-- Event_ParentEvents
------------------------------	
INSERT INTO Event_ParentEvents
		(EventChoiceType,								EventType)
VALUES	('PLAYER_EVENT_CHOICE_GH_TOURISM_MUSIC_BONUS',	'PLAYER_EVENT_GH_TOURISM_MUSIC_BONUS');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================		
-- Civilization_UnitClassOverrides 
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 				UnitClassType, 			UnitType)
SELECT	'CIVILIZATION_GH_LOUISIANA',	'UNITCLASS_MUSICIAN',	'UNIT_GH_LOUISIANA_KREWE'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
--------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType, 				BuildingClassType, 			BuildingType)
SELECT	'CIVILIZATION_GH_LOUISIANA',	'BUILDINGCLASS_HERMITAGE',	'BUILDING_GH_LOUISIANA_VIEUXCARRE'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');