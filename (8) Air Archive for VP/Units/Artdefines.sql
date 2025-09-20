--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================

--===========================
-- Air Fighters
--===========================
------------------------------
-- Early Mono
------------------------------
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_EARLYMONOPLAN', 1, 'FighterWing');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES	('ART_DEF_UNIT_EARLYMONOPLAN', 'ART_DEF_UNIT_MEMBER_EARLYMONOPLAN', 3);

INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYMONOPLAN', 0.082, 'Air', 'EAW_PZL_P.11.fxsxml', 'METAL', 'METALLRG');

INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYMONOPLAN', 'Idle Attack Bombard Death Run', 45, 1.5, 0.3, 0.5, 0);

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYMONOPLAN', 0, 0, 10, 20, 1.3, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 25, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYMONOPLAN', 1, 0, 1, 1, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 35, 'BULLETHC', 'BULLETHC');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYMONOPLAN', 1, 1, 'PROJECTILE', 25, 50, 1.3, 1, 1, 'EXPLOSIVE', 'EXPLOSION200POUND');


--INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType,	Asset)
--VALUES		('ART_DEF_UNIT_EARLYMONOPLAN', 'Unit', 'sv_P11flag_128.dds');

------------------------------
-- Early Jet
------------------------------
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_EARLYJET', 1, 'FighterWing');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES	('ART_DEF_UNIT_EARLYJET', 'ART_DEF_UNIT_MEMBER_EARLYJET', 3);

INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYJET', 0.1, 'Air', 'EAW_P-80_Shooting_Star.fxsxml', 'METAL', 'METALLRG');

INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYJET', 'Idle Attack Bombard Death Run', 70, 1.68, 0.25, 0.4, 0);

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYJET', 0, 0, 1.8, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 8, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYJET', 1, 0, 1, 1, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 8, 'BULLETHC', 'BULLETHC');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYJET', 1, 1, 'PROJECTILE', 25, 50, 1.8, 'EXPLOSIVE', 'EXPLOSION200POUND');

--INSERT INTO ArtDefine_StrategicView 	(StrategicViewType, TileType,	Asset)
--VALUES		('ART_DEF_UNIT_EARLYJET', 'Unit', 'sv_P80flag_128.dds');

------------------------------
-- Jet Fighters
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_JET27', 1, 'FighterWing');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES	('ART_DEF_UNIT_JET27', 'ART_DEF_UNIT_MEMBER_JET27', 3);

INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_JET27', 0.093, 'Air', 'EAW_Mirage2000.fxsxml', 'METAL', 'METALLRG');

INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_JET27', 'Idle Attack Bombard Death Run', 90, 2.2, 0.3, 0.5, 0);

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_JET27', 0, 0, 2, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 10, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_JET27', 1, 0, 1, 1, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 10, 'BULLETHC', 'BULLETHC');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_JET27', 1, 1, 'PROJECTILE', 25, 50, 2, 'EXPLOSIVE', 'EXPLOSION200POUND');

--INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType,	Asset)
--VALUES		('ART_DEF_UNIT_JET27', 'Unit', 'sv_M2kflag_128.dds');

------------------------------
-- MIG-29
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_MIG29', 1, 'FighterWing');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES	('ART_DEF_UNIT_MIG29', 'ART_DEF_UNIT_MEMBER_MIG29', 3);

INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_MIG29', 0.118, 'Air', 'EAW_MiG29Russia.fxsxml', 'METAL', 'METALLRG');

INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_MIG29', 'Idle Attack Bombard Death Run', 100, 2.3, 0.2, 0.4, 0);

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_MIG29', 0, 0, 2, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 12, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_MIG29', 1, 0, 1, 1, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 12, 'BULLETHC', 'BULLETHC');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_MIG29', 1, 1, 'PROJECTILE', 25, 50, 2.1, 'EXPLOSIVE', 'EXPLOSION200POUND');

--INSERT INTO ArtDefine_StrategicView 	(StrategicViewType, TileType,	Asset)
--VALUES		('ART_DEF_UNIT_MIG29', 'Unit', 'sv_Mig29flag_128.dds');

------------------------------------------------------------------------------
-- Stealth Jet
----------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_ADVJET', 1, 'FighterWing');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES	('ART_DEF_UNIT_ADVJET', 'ART_DEF_UNIT_MEMBER_ADVJET', 3);

INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ADVJET', 0.1, 'Air', 'F-35.fxsxml', 'METAL', 'METALLRG');

INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_ADVJET', 'Idle Attack Bombard Death Run', 135, 3, 0.35, 0.55, 0);

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ADVJET', 0, 0, 2.4, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ADVJET', 1, 0, 1, 1, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15, 'BULLETHC', 'BULLETHC');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ADVJET', 1, 1, 'PROJECTILE', 25, 50, 2.6, 'EXPLOSIVE', 'EXPLOSION200POUND');

--INSERT INTO ArtDefine_StrategicView 	(StrategicViewType, TileType,	Asset)
--VALUES		('ART_DEF_UNIT_ADVJET', 'Unit', 'sv_SU57flag_128.dds');

--===========================
-- Air Bombers
--===========================

------------------------------
-- Medium Bomb
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_LIGHTBOMBER', 1, 'BomberWing');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES	('ART_DEF_UNIT_LIGHTBOMBER', 'ART_DEF_UNIT_MEMBER_LIGHTBOMBER', 1);

INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_LIGHTBOMBER', 0.089, 'Air', 'EAW_Vickers_Wellington.fxsxml', 'METAL', 'METALLRG');

INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_LIGHTBOMBER', 'Idle Attack Bombard Death Run', 64, 1.4, 0.125, 0.295, 0);

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType,                   "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect,                                   HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_LIGHTBOMBER', 0,      0,           1.0,                1.0,       'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0,   'BULLETHC',           'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType,                      "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed,    HitRadius, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_LIGHTBOMBER',      1,     0,            15.0,                 25.0,       0.899999976158142,      10,         1,              1, 'EXPLOSIVE', 'EXPLOSION200POUND');

--INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType,	Asset)
--VALUES		('ART_DEF_UNIT_LIGHTBOMBER', 'Unit', 'sv_VickWflag_128.dds');

------------------------------
-- Strategy Bomb
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_STRBOMB', 1, 'BomberWing');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES ('ART_DEF_UNIT_STRBOMB', 'ART_DEF_UNIT_MEMBER_STRBOMB', 1);

INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_STRBOMB', 0.115, 'Air', 'EAW_Tu-95.fxsxml', 'METAL', 'METALLRG');

INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_STRBOMB', 'Idle Attack Bombard Death Run', 64, 1.85, 0.13, 0.37, 0);

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_STRBOMB', 0, 0, 1, 1, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType,               "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitRadius, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_STRBOMB',    1,      0,             15,              25,               0.91,            10,           1,          1,        'EXPLOSIVE', 'EXPLOSION200POUND');

--INSERT INTO ArtDefine_StrategicView 		(StrategicViewType, TileType,	Asset)
--VALUES ('ART_DEF_UNIT_STRBOMB', 'Unit', 'sv_tu95flag_128.dds');

------------------------------
-- B 52
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_B52', 1, 'BomberWing');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES ('ART_DEF_UNIT_B52', 'ART_DEF_UNIT_MEMBER_B52', 1);

INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_B52', 0.128, 'Air', 'EAW_B52.fxsxml', 'METAL', 'METALLRG');

INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_B52', 'Idle Attack Bombard Death Run', 64, 1.9, 0.14, 0.24, 0);

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_B52', 0, 0, 1, 1, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitRadius, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_B52', 1, 0, 35, 60, 0.89, 50, 1, 1, 'EXPLOSIVE', 'EXPLOSION200POUND');

--INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType,	Asset)
--VALUES		('ART_DEF_UNIT_B52', 'Unit', 'sv_B52flag_128.dds');

------------------------------
-- UtiBomb
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_ULTJETBOMB', 1, 'BomberWing');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES ('ART_DEF_UNIT_ULTJETBOMB', 'ART_DEF_UNIT_MEMBER_ULTJETBOMB', 1);

INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ULTJETBOMB', 0.14, 'Air', 'EAW_B-1_Lancer.fxsxml', 'METAL', 'METALLRG');

INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType,                               EnableActions,        AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_ULTJETBOMB', 'Idle Attack Bombard Death Run',        64,      1.9,         0.16,        0.4,            0);

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType,             "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ULTJETBOMB', 0, 0,            25,                 55,                  0.8,           1,           1,        'EXPLOSIVE',  'EXPLOSION200POUND');

--INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType,	Asset)
--VALUES		('ART_DEF_UNIT_ULTJETBOMB', 'Unit', 'sv_B1flag_128.dds');	
--==========================================================================================================================


----- ArtScale

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.078 WHERE Type = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER'; --       VP : 0.09    EAW : 0.078
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.082 WHERE Type = 'ART_DEF_UNIT_MEMBER_EARLYMONOPLAN'; --     VP : _       EAW : 0.082
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.085 WHERE Type = 'ART_DEF_UNIT_MEMBER_FIGHTER'; --           VP : 0.08    EAW : 0.085
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.077 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO'; --   VP : 0.07    EAW : 0.077
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.1 WHERE Type = 'ART_DEF_UNIT_MEMBER_EARLYJET'; --            VP : _       EAW : 0.1
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.093 WHERE Type = 'ART_DEF_UNIT_MEMBER_JET27'; --             VP : _       EAW : 0.093
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.118 WHERE Type = 'ART_DEF_UNIT_MEMBER_MIG29'; --             VP : _       EAW : 0.118
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.097 WHERE Type = 'ART_DEF_UNIT_MEMBER_JETFIGHTER'; --        VP : 0.09    EAW : 0.097
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.1 WHERE Type = 'ART_DEF_UNIT_MEMBER_ADVJET'; --              VP : _       EAW : 0.1

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.063 WHERE Type = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER'; --        VP : 0.08    EAW : 0.063
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.089 WHERE Type = 'ART_DEF_UNIT_MEMBER_LIGHTBOMBER'; --      VP : _       EAW : 0.089
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.085 WHERE Type = 'ART_DEF_UNIT_MEMBER_BOMBER'; --            VP : 0.08    EAW : 0.085
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.087 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_B17'; --    VP : 0.08    EAW : 0.087
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.115 WHERE Type = 'ART_DEF_UNIT_MEMBER_STRBOMB'; --           VP : _       EAW : 0.115
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.128 WHERE Type = 'ART_DEF_UNIT_MEMBER_B52'; --               VP : _       EAW : 0.128
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.125 WHERE Type = 'ART_DEF_UNIT_MEMBER_ULTJETBOMB'; --        VP : _       EAW : 0.125
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.088 WHERE Type = 'ART_DEF_UNIT_MEMBER_STEALTHBOMBER'; --     VP : 0.08    EAW : 0.088

-----------------------------------------------------------------------------------------------------------
----- ArtDefine_ UPDATE

UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.6 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BOMBER'; -- was 1.79999995231628
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.7 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_B17'; -- was 1.20000004768372
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.3 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER'; -- was 1.60000002384186
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.7 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIGHTER'; -- was 1.60000002384186
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.72 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO'; -- was 1.60000002384186
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.5 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JETFIGHTER'; -- was 3
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_STEALTHBOMBER'; -- was more
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.36 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER'; -- was more

UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 0.37 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER'; -- was 0.25
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 0.41 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER'; -- was 0.5
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 0.35 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO'; -- was 0.25
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 0.45 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO'; -- was 0.5
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 0.21 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER'; -- was more
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 0.31 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER'; -- was more
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 0.32 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BOMBER'; -- was more
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 0.42 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BOMBER'; -- was more

UPDATE ArtDefine_UnitMemberCombats SET AttackRadius = 125 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JETFIGHTER'; -- was 135

UPDATE ArtDefine_UnitMemberCombatWeapons SET ProjectileSpeed = 1 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER' AND "Index" = 1 AND SubIndex = 1; -- was 1.29999995231628
UPDATE ArtDefine_UnitMemberCombatWeapons SET ProjectileSpeed = 1.5 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIGHTER' AND "Index" = 0 AND SubIndex = 1; -- was 3
UPDATE ArtDefine_UnitMemberCombatWeapons SET ProjectileSpeed = 1.6 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO' AND "Index" = 0 AND SubIndex = 1; -- was 1.29999995231628
UPDATE ArtDefine_UnitMemberCombatWeapons SET ProjectileSpeed = 2.3 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JETFIGHTER' AND "Index" = 0 AND SubIndex = 0; -- was 3
UPDATE ArtDefine_UnitMemberCombatWeapons SET ProjectileSpeed = 2.4 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JETFIGHTER' AND "Index" = 1 AND SubIndex = 1; -- was 3

UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 3 WHERE UnitInfoType = 'ART_DEF_UNIT_JET_FIGHTER'; -- was 1

--==========================================================================================================================
-- Compatibility Patch If there are too many units, the strategy view's limitations will become unmanageable. (So Air units SV all delted)
--==========================================================================================================================
DELETE FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_TRIPLANE';
DELETE FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_FIGHTER';
DELETE FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_WWI_BOMBER';
DELETE FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_BOMBER';
DELETE FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_AMERICAN_B17';
DELETE FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_JAPANESE_ZERO';
DELETE FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_JET_FIGHTER';
DELETE FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_STEALTH_BOMBER';
