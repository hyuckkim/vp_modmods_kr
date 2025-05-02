-- rev 5

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================

--------------------------------
-- UnitClasses
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_EARLYJET', 'TXT_KEY_UNIT_EARLYJET', 'UNIT_EARLYJET');

--------------------------------
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range,	AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, Special, XPValueAttack, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, 	IconAtlas, MoveRate, PurchaseCooldown, NoSupply, FreeUpgrade)
SELECT		'UNITCLASS_EARLYJET', 'UNIT_EARLYJET', 'TECH_COMBINED_ARMS', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	NULL,	IsMounted, Special, XPValueAttack, Combat, -1,	-1, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_EARLYJET', 'TXT_KEY_EARLYJET_TEXT', 	'TXT_KEY_UNIT_EARLYJET_STRATEGY', 'TXT_KEY_UNIT_HELP_EARLYJET', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_EARLYJET', 4, 'eaw_flag_ATLAS',	4, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply, 1
FROM Units WHERE (Type = 'UNIT_FIGHTER');

--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
SELECT		('UNIT_EARLYJET'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_JET_FIGHTER');

--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, UnitAIType)
SELECT		('UNIT_EARLYJET'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_FIGHTER');

--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, UnitClassType)
VALUES	
      ('UNIT_EARLYJET', 'UNITCLASS_JET27');

--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, FlavorType, Flavor)
SELECT		('UNIT_EARLYJET'), FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_FIGHTER');

--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		('UNIT_EARLYJET'), PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_FreePromotions	(UnitType, PromotionType)
VALUES 
  ('UNIT_EARLYJET', 'PROMOTION_AIR_REPAIR'),
  ('UNIT_EARLYJET', 'PROMOTION_AIR_RANGE'),
  ('UNIT_EARLYJET', 'PROMOTION_ANTI_AIR_II'),
  ('UNIT_EARLYJET', 'PROMOTION_JET_DOM');

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	

------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, TileType,	Asset)
VALUES		('ART_DEF_UNIT_EARLYJET', 'Unit', 'sv_P80flag_128.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_EARLYJET', 1, 'FighterWing');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES	('ART_DEF_UNIT_EARLYJET', 'ART_DEF_UNIT_MEMBER_EARLYJET', 3);
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYJET', 0.1, 'Air', 'EAW_P-80_Shooting_Star.fxsxml', 'METAL', 'METALLRG');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYJET', 'Idle Attack Bombard Death Run', 70, 1.68, 0.25, 0.4, 0);
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYJET', 0, 0, 1.8, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 8, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYJET', 1, 0, 1, 1, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 8, 'BULLETHC', 'BULLETHC');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYJET', 1, 1, 'PROJECTILE', 25, 50, 1.8, 'EXPLOSIVE', 'EXPLOSION200POUND');

--==========================================================================================================================
