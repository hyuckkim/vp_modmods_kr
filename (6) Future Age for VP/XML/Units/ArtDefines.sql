-- INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
--     VALUES ('ART_DEF_UNIT_UAV', 'Unit', 'svcuirassier.dds'),
--     VALUES ('ART_DEF_UNIT_FW_HYBRID_DRONE', 'Unit', 'svcuirassier.dds'),
--     VALUES ('ART_DEF_UNIT_SMAN_IEUP_REAPER_DRONE', 'Unit', 'SV_HelicopterGunship.dds');

-- =======================================================================================================
--		Paratrooper
-- =======================================================================================================
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_CAYM_PARATROOPER'), 1, 'UnFormed'
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_PARATROOPER');
	
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES	('ART_DEF_UNIT_CAYM_PARATROOPER', 'ART_DEF_UNIT_MEMBER_CAYM_PARATROOPER', "10");
	
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_CAYM_PARATROOPER'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PARATROOPER');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_CAYM_PARATROOPER'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PARATROOPER');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_CAYM_PARATROOPER'), ('0.14'), ZOffset, Domain, ('Paratrooper_France.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_CARAVEL');

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,						TileType,			Asset) 
VALUES	('ART_DEF_UNIT_CAYM_PARATROOPER',			'Unit',				'SV_Caymparatrooper.dds');

-- =======================================================================================================
--		PMC
-- =======================================================================================================
-- Unit Art Defines
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_PRO_PMC'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_PARATROOPER');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers)
	SELECT	('ART_DEF_UNIT_PRO_PMC'), ('ART_DEF_UNIT_MEMBER_PRO_PMC'), NumMembers
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_PARATROOPER');

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_PRO_PMC'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PARATROOPER');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_PRO_PMC'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PARATROOPER');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_PRO_PMC'), 0.12, ZOffset, Domain, ('RM_Commando.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_PARATROOPER');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
SELECT	'ART_DEF_UNIT_PRO_PMC', 'Unit', 'SV_CAYM_PMC.dds';



-- =======================================================================================================
--		Modern Drone Art Defines
-- =======================================================================================================
-- Unit Art Defines
INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation) VALUES ('ART_DEF_UNIT_FW_MODERN_DRONE', 1, "FighterWing");
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers) VALUES ('ART_DEF_UNIT_FW_MODERN_DRONE', 'ART_DEF_UNIT_MEMBER_FW_MODERN_DRONE', 1);

-- Unit Member Art Defines

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_FW_MODERN_DRONE', 0.16, "Air", 'SMAN_IEUP_Reaper.fxsxml', "METAL", "METALLRG");
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
	VALUES ('ART_DEF_UNIT_MEMBER_FW_MODERN_DRONE', "Idle Attack Bombard Death Run", 135.0, 2.0, 0.25, 0.5, 0);
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_FW_MODERN_DRONE', 0, 0, 3.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_FW_MODERN_DRONE', 1, 0, 1.0, 1.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_FW_MODERN_DRONE', 1, 1, 'PROJECTILE', 25.0, 50.0, 3.0, 'EXPLOSIVE', 'EXPLOSION200POUND');



-- =======================================================================================================
--		Modern Bazooka - ATGM - Art Defines
-- =======================================================================================================
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_FW_ATGM'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_MOBILE_SAM');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers)
	SELECT	('ART_DEF_UNIT_FW_ATGM'), ('ART_DEF_UNIT_FW_MEMBER_ATGM'), NumMembers
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MOBILE_SAM');

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_FW_MEMBER_ATGM'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MOBILESAM');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_FW_MEMBER_ATGM'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MOBILESAM');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_FW_MEMBER_ATGM'), Scale, ZOffset, Domain, ('rangedmarine02.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_MOBILESAM');


-- INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
-- 	SELECT	('ART_DEF_UNIT_FW_ATGM'), TileType, Asset
-- 	FROM ArtDefine_StrategicView WHERE (StrategicViewType = 'ART_DEF_UNIT_MOBILE_SAM');

-- =======================================================================================================
--		Mutant
-- =======================================================================================================
INSERT INTO "ArtDefine_UnitInfos" ('Type','DamageStates','Formation')
	SELECT	("ART_DEF_UNIT_FW_MUTANT"), "DamageStates", ("Barbarian")
	FROM "ArtDefine_UnitInfos" WHERE (Type = "ART_DEF_UNIT_U_AZTEC_JAGUAR");
INSERT INTO "ArtDefine_UnitInfoMemberInfos" ('UnitInfoType','UnitMemberInfoType','NumMembers')
	VALUES	("ART_DEF_UNIT_FW_MUTANT", "ART_DEF_UNIT_MEMBER_FW_MUTANT", "6");

INSERT INTO "ArtDefine_UnitMemberCombats" ('UnitMemberType', 'EnableActions', 'DisableActions', 'MoveRadius', 'ShortMoveRadius', 'ChargeRadius', 'AttackRadius', 'RangedAttackRadius', 'MoveRate', 'ShortMoveRate', 'TurnRateMin', 'TurnRateMax', 'TurnFacingRateMin', 'TurnFacingRateMax', 'RollRateMin', 'RollRateMax', 'PitchRateMin', 'PitchRateMax', 'LOSRadiusScale', 'TargetRadius', 'TargetHeight', 'HasShortRangedAttack', 'HasLongRangedAttack', 'HasLeftRightAttack', 'HasStationaryMelee', 'HasStationaryRangedAttack', 'HasRefaceAfterCombat', 'ReformBeforeCombat', 'HasIndependentWeaponFacing', 'HasOpponentTracking', 'HasCollisionAttack', 'AttackAltitude', 'AltitudeDecelerationDistance', 'OnlyTurnInMovementActions', 'RushAttackFormation')
	SELECT	("ART_DEF_UNIT_MEMBER_FW_MUTANT"), "EnableActions", "DisableActions", "MoveRadius", "ShortMoveRadius", "ChargeRadius", "AttackRadius", "RangedAttackRadius", 
			"MoveRate", "ShortMoveRate", "TurnRateMin", "TurnRateMax", "TurnFacingRateMin", "TurnFacingRateMax", "RollRateMin", "RollRateMax", "PitchRateMin", "PitchRateMax", "LOSRadiusScale", "TargetRadius", "TargetHeight", "HasShortRangedAttack", "HasLongRangedAttack", "HasLeftRightAttack", "HasStationaryMelee", "HasStationaryRangedAttack", "HasRefaceAfterCombat", "ReformBeforeCombat", "HasIndependentWeaponFacing", "HasOpponentTracking", "HasCollisionAttack", "AttackAltitude", "AltitudeDecelerationDistance", "OnlyTurnInMovementActions", "RushAttackFormation"
	FROM "ArtDefine_UnitMemberCombats" WHERE (UnitMemberType = "ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR");
INSERT INTO "ArtDefine_UnitMemberCombatWeapons" ('UnitMemberType', 'Index', 'SubIndex', 'ID', 'VisKillStrengthMin', 'VisKillStrengthMax', 'ProjectileSpeed', 'ProjectileTurnRateMin', 'ProjectileTurnRateMax', 'HitEffect', 'HitEffectScale', 'HitRadius', 'ProjectileChildEffectScale', 'AreaDamageDelay', 'ContinuousFire', 'WaitForEffectCompletion', 'TargetGround', 'IsDropped', 'WeaponTypeTag', 'WeaponTypeSoundOverrideTag')
	SELECT ("ART_DEF_UNIT_MEMBER_FW_MUTANT"), "Index", "SubIndex", "ID", "VisKillStrengthMin", "VisKillStrengthMax", "ProjectileSpeed", "ProjectileTurnRateMin", "ProjectileTurnRateMax", "HitEffect", "HitEffectScale", "HitRadius", "ProjectileChildEffectScale", "AreaDamageDelay", "ContinuousFire", "WaitForEffectCompletion", "TargetGround", "IsDropped", "WeaponTypeTag", "WeaponTypeSoundOverrideTag"
	FROM "ArtDefine_UnitMemberCombatWeapons" WHERE (UnitMemberType = "ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR");
INSERT INTO "ArtDefine_UnitMemberInfos" ("Type", "Scale", "ZOffset", "Domain", "Model", "MaterialTypeTag", "MaterialTypeSoundOverrideTag")
	SELECT	("ART_DEF_UNIT_MEMBER_FW_MUTANT"), "0.16", "ZOffset", "Domain", 
			("zombie.fxsxml"), "MaterialTypeTag", "MaterialTypeSoundOverrideTag"
	FROM "ArtDefine_UnitMemberInfos" WHERE (Type = "ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR");

-- =======================================================================================================
--		Neodestroyer (Zumwalt)
-- =======================================================================================================

INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_FW_NEODESTROYER', 3, '');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale , Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_FW_NEODESTROYER', 0.114, 'Sea', 'kirov.fxsxml', 'METAL', 'METALLRG');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES ('ART_DEF_UNIT_FW_NEODESTROYER', 'ART_DEF_UNIT_MEMBER_FW_NEODESTROYER', 1);

INSERT INTO ArtDefine_UnitMemberCombats (
	UnitMemberType,
	EnableActions, DisableActions,
	HasShortRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing, RushAttackFormation)
VALUES (
	'ART_DEF_UNIT_MEMBER_FW_NEODESTROYER',
	'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir', '',
	1, 1, 0, 1, '');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
	(UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES
	('ART_DEF_UNIT_MEMBER_FW_NEODESTROYER', 0, 0, 'ART_DEF_VEFFECT_MECH_ROCKET_PROJECTILE', 25, 50, 5.3, 'ART_DEF_VEFFECT_GUIDED_MISSILE_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION200POUND'),
	('ART_DEF_UNIT_MEMBER_FW_NEODESTROYER', 1, 0, 'ART_DEF_VEFFECT_MECH_ROCKET_PROJECTILE', 25, 50, 5.3, 'ART_DEF_VEFFECT_GUIDED_MISSILE_IMPACT_$(TERRAIN)', 'BULLETHC', 'BULLETHC');


-- =======================================================================================================
--		Diplomat
-- =======================================================================================================

INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_SAS_SCRIBE', 1, 'EarlyGreatArtist');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SAS_SCRIBE', 'ART_DEF_UNIT_MEMBER_SAS_SCRIBE', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_SCRIBE', 0.12, 'BOSScribe.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_SCRIBE', 'Idle Death BombardDefend Run', 1);


--=====================================================================================================================--
--Unit ArtDefines--
--=====================================================================================================================--
--Zeppelin
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates) 
VALUES ('ART_DEF_UNIT_WWI_ZEPPELIN', 1); 

INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers) 
VALUES ('ART_DEF_UNIT_WWI_ZEPPELIN', 'ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 1); 

INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag) 
VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 0.09, 30.0, 'Land', 'UnitLines/ZeppelinLine/Zeppelin/ZeppelinTC.fxsxml', 'METAL', 'METALLRG'); 

INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, TargetRadius, TargetHeight, HasShortRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing) 
VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir', 1.0, 65.0, 0, 0, 0, 0); 

--INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, HitEffect, HitRadius, ContinuousFire, WeaponTypeTag, WeaponTypeSoundOverrideTag) 
--VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 0, 0, 'ART_DEF_VEFFECT_ANTIAIR_IMPACT_$(TERRAIN)', 32.0, 1, 'BULLETHC', 'BULLETHC'); 

--INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag) 
--VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 1, 0, 'ART_DEF_VEFFECT_ANTIAIR_IMPACT_$(TERRAIN)', 16.0, 'BULLETHC', 'BULLETHC'); 

--INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag) 
--VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 0, 0, 15.0, 25.0, 0.899999976158142, 10.0, 'BULLETHC', 'BULLETHC'); 

INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitRadius, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag) 
VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 0, 0, 15.0, 25.0, 0.899999976158142, 10.0, 1, 1, 'EXPLOSIVE', 'EXPLOSION200POUND'); 

INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag) 
VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 1, 0, 25.0, 50.0, 'ART_DEF_VEFFECT_ARTILLERY_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION20POUND'); 

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset) 
VALUES ('ART_DEF_UNIT_WWI_ZEPPELIN', 'Unit', 'WWI_Zeppelin_SV.dds'); 

-- =======================================================================================================
--		Predator Drone Art Defines
-- =======================================================================================================
-- Unit Art Defines
INSERT INTO ArtDefine_UnitInfos 
		(Type, DamageStates, Formation) 
VALUES 	('ART_DEF_UNIT_PREDATOR_DRONE', 1, "FighterWing");

INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES 	('ART_DEF_UNIT_PREDATOR_DRONE', 'ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 1);


INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, TileType, Asset) 
VALUES 	('ART_DEF_UNIT_PREDATOR_DRONE', 'Unit', 'UAV_SV.dds');

-- Unit Member Art Defines
INSERT INTO ArtDefine_UnitMemberInfos 
		(Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 0.12, 30, 'Land', 'SMAN_IEUP_CASFighter.fxsxml', "METAL", "METALLRG");

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', "Idle Attack Bombard Death Run", 135.0, 2.0, 0.25, 0.5, 0);

INSERT INTO ArtDefine_UnitMemberCombatWeapons 
		(UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 0, 0, 3.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");

INSERT INTO ArtDefine_UnitMemberCombatWeapons 
		(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 1, 0, 1.0, 1.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");

INSERT INTO ArtDefine_UnitMemberCombatWeapons 
		(UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 1, 1, 'PROJECTILE', 25.0, 50.0, 3.0, 'EXPLOSIVE', 'EXPLOSION200POUND');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('UNIT_ZEPPELIN_FLAG_ATLAS', 		32, 		'WWI_Zeppelin_Flag.dds', 			1, 				1),
			('UNIT_UAV_FLAG_ATLAS', 			32, 		'UAV_UnitFlag32.dds', 				1, 				1);



------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn)
VALUES	
			('UNIT_MECHNIZEDINF_FLAG_ATLAS', 	32, 		'MechanizedinfantryFlag.dds',		    1, 				1),			
			('UNIT_SPAD_FLAG_ATLAS', 			32, 		'SPADFlag.dds',		                    1, 				1),			
			('UNIT_ROCKETARTI_FLAG_ATLAS', 		32, 		'K9KoreaFlag.dds',		                1, 				1);

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13, Model = 'M109SKorea.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_ROCKETARTILLERY';

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13, Model = 'RolandFrance.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_MOBILESAM';

UPDATE Units SET UnitArtInfo = 'ART_DEF_UNIT_SMAN_IEUP_PRIVATE_MIL_CONTRACTORS' WHERE Type = 'UNIT_MECHANIZED_INFANTRY';

UPDATE Units SET PortraitIndex = '6', IconAtlas = 'EXPANSION_TECH_ATLAS_1'  WHERE Type = 'UNIT_MECHANIZED_INFANTRY';

UPDATE Technologies SET Portraitindex = '26' , IconAtlas = 'UNIT_ATLAS_2' WHERE Type = 'TECH_MOBILE_TACTICS';

UPDATE ArtDefine_StrategicView SET Asset = 'sv_SPAD.dds' WHERE StrategicViewType = 'ART_DEF_UNIT_MOBILE_SAM';

UPDATE ArtDefine_StrategicView SET Asset = 'sv_K9Korea.dds' WHERE StrategicViewType = 'ART_DEF_UNIT_ROCKET_ARTILLERY';

UPDATE ArtDefine_StrategicView SET Asset = 'SV_Caymparatroopera.dds' WHERE StrategicViewType = 'ART_DEF_UNIT_PARATROOPER';

UPDATE Units SET UnitArtInfo = 'ART_DEF_UNIT_MARINE', UnitFlagIconOffset = '19', PortraitIndex = '19', IconAtlas = 'EXPANSION_UNIT_ATLAS_1', UnitFlagAtlas = 'EXPANSION_UNIT_FLAG_ATLAS' WHERE Type = 'UNIT_GUERILLA';

UPDATE Units SET UnitFlagAtlas = 'UNIT_PARATROOPERA_FLAG_ATLAS', UnitFlagIconOffset = '0' WHERE Type = 'UNIT_MARINE';

UPDATE Units SET UnitArtInfo = 'ART_DEF_UNIT_CAYM_PARATROOPER', PortraitIndex = '36', IconAtlas = 'TCS_MOD_ICON_ATLAS', UnitFlagAtlas = 'UNIT_PARATROOPER_FLAG_ATLAS', UnitFlagIconOffset = '0' WHERE Type = 'UNIT_PARATROOPER';

UPDATE Units SET PortraitIndex = '38', IconAtlas = 'BM_ALIENS_CIV_COLOR_ATLAS', UnitFlagAtlas = 'UNIT_ROCKETARTI_FLAG_ATLAS', UnitFlagIconOffset = 0  WHERE Type = 'UNIT_ROCKET_ARTILLERY';

UPDATE Units SET PortraitIndex = '37', IconAtlas = 'BM_ALIENS_CIV_COLOR_ATLAS', UnitFlagAtlas = 'UNIT_SPAD_FLAG_ATLAS', UnitFlagIconOffset = 0  WHERE Type = 'UNIT_MOBILE_SAM';
