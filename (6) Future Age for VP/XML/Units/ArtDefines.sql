-- =======================================================================================================
--		Moderen Colonist
-- =======================================================================================================
INSERT INTO ArtDefine_UnitInfos	(Type, DamageStates, Formation)
VALUES
	('ART_DEF_UNIT_FW_MODERN_COLONIST',		1,	'Vehicle');

INSERT INTO ArtDefine_UnitInfoMemberInfos	(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES 
	('ART_DEF_UNIT_FW_MODERN_COLONIST',		'ART_DEF_UNIT_MEMBER_FW_MODERN_COLONIST2', 	1),     
	('ART_DEF_UNIT_FW_MODERN_COLONIST',		'ART_DEF_UNIT_MEMBER_FW_MODERN_COLONIST3', 	1),     
	('ART_DEF_UNIT_FW_MODERN_COLONIST',		'ART_DEF_UNIT_MEMBER_FW_MODERN_COLONIST4', 	1);

INSERT INTO ArtDefine_UnitMemberInfos	(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag, Domain)
VALUES 
	('ART_DEF_UNIT_MEMBER_FW_MODERN_COLONIST2', 0.08, 'GreatArtist_Late.fxsxml', 'CLOTH', 'FLESH',   NULL),  
	('ART_DEF_UNIT_MEMBER_FW_MODERN_COLONIST3', 0.05, 'Caravan_Late.fxsxml',     'CLOTH', 'FLESH',   NULL),  
	('ART_DEF_UNIT_MEMBER_FW_MODERN_COLONIST4', 0.05, 'Caravan_Late.fxsxml',     'CLOTH', 'FLESH',   NULL);  


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
INSERT INTO ArtDefine_StrategicView 		(StrategicViewType,						TileType,			Asset) 
VALUES	('ART_DEF_UNIT_CAYM_PARATROOPER',			'Unit',				'SV_Caymparatrooper.dds');

-- Caym paratrooper image Change
UPDATE Units SET UnitArtInfo = 'ART_DEF_UNIT_CAYM_PARATROOPER', PortraitIndex = '36', IconAtlas = 'TCS_MOD_ICON_ATLAS', UnitFlagAtlas = 'UNIT_PARATROOPER_FLAG_ATLAS', UnitFlagIconOffset = '0' WHERE Type = 'UNIT_PARATROOPER';

UPDATE ArtDefine_StrategicView SET Asset = 'SV_Caymparatroopera.dds' WHERE StrategicViewType = 'ART_DEF_UNIT_PARATROOPER';

UPDATE Units SET UnitArtInfo = 'ART_DEF_UNIT_MARINE', UnitFlagIconOffset = '19', PortraitIndex = '19', IconAtlas = 'EXPANSION_UNIT_ATLAS_1', UnitFlagAtlas = 'EXPANSION_UNIT_FLAG_ATLAS' WHERE Type = 'UNIT_GUERILLA';

UPDATE Units SET UnitFlagAtlas = 'UNIT_PARATROOPERA_FLAG_ATLAS', UnitFlagIconOffset = '0' WHERE Type = 'UNIT_MARINE';


-- =======================================================================================================
-- Rocketartillery -> Himars,  self-propelled artillery
-- =======================================================================================================
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13, Model = 'M109SKorea.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_ROCKETARTILLERY';

UPDATE Units SET PortraitIndex = '38', IconAtlas = 'BM_ALIENS_CIV_COLOR_ATLAS', UnitFlagAtlas = 'UNIT_ROCKETARTI_FLAG_ATLAS', UnitFlagIconOffset = 0  WHERE Type = 'UNIT_ROCKET_ARTILLERY';

UPDATE ArtDefine_StrategicView SET Asset = 'sv_K9Korea.dds' WHERE StrategicViewType = 'ART_DEF_UNIT_ROCKET_ARTILLERY';

-- =======================================================================================================
-- mobile SAM -> moderen SAM,  self-propelled SAN
-- =======================================================================================================
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13, Model = 'RolandFrance.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_MOBILESAM';

UPDATE Units SET PortraitIndex = '37', IconAtlas = 'BM_ALIENS_CIV_COLOR_ATLAS', UnitFlagAtlas = 'UNIT_SPAD_FLAG_ATLAS', UnitFlagIconOffset = 0  WHERE Type = 'UNIT_MOBILE_SAM';

UPDATE ArtDefine_StrategicView SET Asset = 'sv_SPAD.dds' WHERE StrategicViewType = 'ART_DEF_UNIT_MOBILE_SAM';

-- =======================================================================================================
--		PMC
-- =======================================================================================================
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
--		Predator Drone Art Defines
-- =======================================================================================================
INSERT INTO ArtDefine_UnitInfos 		(Type, DamageStates, Formation) 
	VALUES 	('ART_DEF_UNIT_PREDATOR_DRONE', 1, "FighterWing");
INSERT INTO ArtDefine_UnitInfoMemberInfos 		(UnitInfoType, UnitMemberInfoType, NumMembers)
	VALUES 	('ART_DEF_UNIT_PREDATOR_DRONE', 'ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 1);
INSERT INTO ArtDefine_UnitMemberInfos 		(Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 0.12, 30, 'Air', 'SMAN_IEUP_CASFighter.fxsxml', "METAL", "METALLRG");
INSERT INTO ArtDefine_UnitMemberCombats 		(UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
	VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', "Idle Attack Bombard Death Run", 135.0, 2.0, 0.25, 0.5, 0);
INSERT INTO ArtDefine_UnitMemberCombatWeapons 		(UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 0, 0, 3.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");
INSERT INTO ArtDefine_UnitMemberCombatWeapons 		(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 1, 0, 1.0, 1.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");
INSERT INTO ArtDefine_UnitMemberCombatWeapons 		(UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 1, 1, 'PROJECTILE', 25.0, 50.0, 3.0, 'EXPLOSIVE', 'EXPLOSION200POUND');

INSERT INTO ArtDefine_StrategicView 		(StrategicViewType, TileType, Asset) 
	VALUES 	('ART_DEF_UNIT_PREDATOR_DRONE', 'Unit', 'UAV_SV.dds');

-- =======================================================================================================
--		Modern Drone Art Defines
-- =======================================================================================================
INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation) VALUES ('ART_DEF_UNIT_FW_MODERN_DRONE', 1, "FighterWing");
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers) VALUES ('ART_DEF_UNIT_FW_MODERN_DRONE', 'ART_DEF_UNIT_MEMBER_FW_MODERN_DRONE', 1);
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

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
SELECT	'ART_DEF_UNIT_MEMBER_FW_MODERN_DRONE', 'Unit', 'SV_FW_UAV.dds';

-- =======================================================================================================
--  Apache
-- =======================================================================================================
INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation)
	VALUES ('ART_DEF_UNIT_FW_APACHE', 1, NULL);
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	VALUES ('ART_DEF_UNIT_FW_APACHE', 'ART_DEF_UNIT_FW_MEMBER_APACHE', 1);
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_FW_MEMBER_APACHE', 0.100000001490116, 'Hover', 'ART/Model/Ka52.fxsxml', 'METAL', 'METALLRG');
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, HasShortRangedAttack, HasRefaceAfterCombat)
	VALUES  ('ART_DEF_UNIT_FW_MEMBER_APACHE', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady',  1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons  (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES  ('ART_DEF_UNIT_FW_MEMBER_APACHE', 0, 0, 1.0, 1.0, 'ART_DEF_VEFFECT_GUNSHIP_MACHINE_GUN_HIT_$(TERRAIN)', 'BULLETHC', 'BULLETHC');

INSERT INTO ArtDefine_UnitMemberCombatWeapons  (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES  ('ART_DEF_UNIT_FW_MEMBER_APACHE', 0, 1, 'PROJECTILE', 10.0, 15.0, 4.0, 'EXPLOSIVE', 'EXPLOSION20POUND');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
	VALUES ('ART_DEF_UNIT_FW_APACHE', 'Unit', 'SV_apache.dds');

-- =======================================================================================================
--		Modern Bazooka - JAVELIN - Art Defines
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

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
SELECT	'ART_DEF_UNIT_FW_ATGM', 'Unit', 'SSV_FW_Hypervelocity_Missile.dds';


-- =======================================================================================================
-- MECHANIZED_INFANTRY
-- =======================================================================================================
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation) VALUES ('ART_DEF_UNIT_SMAN_IEUP_PRIVATE_MIL_CONTRACTORS', 1, "UnFormed");	

INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES	('ART_DEF_UNIT_SMAN_IEUP_PRIVATE_MIL_CONTRACTORS', 'ART_DEF_UNIT_MEMBER_SMAN_IEUP_PMC_MECH', "1");
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES	('ART_DEF_UNIT_SMAN_IEUP_PRIVATE_MIL_CONTRACTORS', 'ART_DEF_UNIT_MEMBER_SMAN_IEUP_PMC_INF', "4");

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_SMAN_IEUP_PMC_INF'), 0.16, ZOffset, Domain, ('SMAN_IEUP_PMC_Inf.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_PARATROOPER');
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_SMAN_IEUP_PMC_MECH'), 0.18, ZOffset, Domain, ('SMAN_IEUP_PMC_Mech.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_MECHANIZEDINFANTRY');
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_SMAN_IEUP_PMC_INF'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PARATROOPER');
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_SMAN_IEUP_PMC_MECH'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MECHANIZEDINFANTRY');
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_PMC_INF'), "0", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PARATROOPER');
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_PMC_MECH'), "0", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MECHANIZEDINFANTRY');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset ) VALUES ('ART_DEF_UNIT_SMAN_IEUP_PRIVATE_MIL_CONTRACTORS', 'Unit', 'SV_mechanizedInfantry.dds');

UPDATE Units SET UnitArtInfo = 'ART_DEF_UNIT_SMAN_IEUP_PRIVATE_MIL_CONTRACTORS' WHERE Type = 'UNIT_MECHANIZED_INFANTRY';

UPDATE Units SET PortraitIndex = '6', IconAtlas = 'EXPANSION_TECH_ATLAS_1'  WHERE Type = 'UNIT_MECHANIZED_INFANTRY';

UPDATE Technologies SET Portraitindex = '26' , IconAtlas = 'UNIT_ATLAS_2' WHERE Type = 'TECH_MOBILE_TACTICS';



--=====================================================================================================================--
-- Zeppelin
--=====================================================================================================================--
INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation) VALUES ('ART_DEF_UNIT_ZEPPELIN_AIRSHIP', 1, "FighterWing");
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers) VALUES ('ART_DEF_UNIT_ZEPPELIN_AIRSHIP', 'ART_DEF_UNIT_MEMBER_ZEPPELIN_AIRSHIP', 1);
INSERT INTO ArtDefine_UnitMemberInfos 		(Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
    VALUES ('ART_DEF_UNIT_MEMBER_ZEPPELIN_AIRSHIP', 0.10, 30, 'Air', 'ZeppelinTC.fxsxml', "METAL", "METALLRG");
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
	VALUES ('ART_DEF_UNIT_MEMBER_ZEPPELIN_AIRSHIP', "Idle Attack Bombard Death Run", 135.0, 2.0, 0.25, 0.5, 0);
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_ZEPPELIN_AIRSHIP', 0, 0, 3.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_ZEPPELIN_AIRSHIP', 1, 0, 1.0, 1.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_ZEPPELIN_AIRSHIP', 1, 1, 'PROJECTILE', 25.0, 50.0, 3.0, 'EXPLOSIVE', 'EXPLOSION200POUND');

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset) 
VALUES ('ART_DEF_UNIT_ZEPPELIN_AIRSHIP', 'Unit', 'WWI_Zeppelin_SV.dds'); 


/*

-- ① UnitInfos
INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_ZEPPELIN_AIRSHIP', 1, 'FighterWing');

-- ② UnitMemberInfos
INSERT INTO ArtDefine_UnitMemberInfos
       (Type,                                Scale, Domain, Model,                 MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ZEPPELIN_AIRSHIP', 0.16, 'Air',  'ZeppelinTC.fxsxml', 'METAL',         'METALLRG');

-- ③ 연결
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,                    UnitMemberInfoType,                   NumMembers)
VALUES ('ART_DEF_UNIT_ZEPPELIN_AIRSHIP',  'ART_DEF_UNIT_MEMBER_ZEPPELIN_AIRSHIP', 1);

-- ④ Combats (원문 유지할 거면 그대로, 권장값은 숫자 플래그)
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombats
       (UnitMemberType,                            EnableActions,              AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat, HasShortRangedAttack, HasIndependentWeaponFacing)
VALUES ('ART_DEF_UNIT_MEMBER_ZEPPELIN_AIRSHIP', 'Idle Attack Bombard Death Run', 135.0,      2.0,     0.25,       0.5,        0,                   1,                    1);

-- ⑤ 무기
DELETE FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ZEPPELIN_AIRSHIP';

INSERT INTO ArtDefine_UnitMemberCombatWeapons
       (UnitMemberType,                           "Index", SubIndex, ProjectileSpeed, HitEffect,                                                  HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ZEPPELIN_AIRSHIP',   0,       0,        3.0,            'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)',        15.0,     'BULLETHC',   'BULLETHC');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
       (UnitMemberType,                           "Index", SubIndex, ProjectileArtInfo,          ProjectileSpeed, HitEffect,                           HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ZEPPELIN_AIRSHIP',   1,       0,        'ART_DEF_PROJECTILE_BOMB',  2.5,            'ART_DEF_VEFFECT_BOMB_IMPACT_MD',    25.0,     'BOMB',      'BOMB');

-- ⑥ 전략뷰 (유닛 키로!)
INSERT INTO ArtDefine_StrategicView (StrategicViewType,           TileType, Asset)
VALUES                              ('ART_DEF_UNIT_ZEPPELIN_AIRSHIP', 'Unit',  'WWI_Zeppelin_SV.dds');


/*

