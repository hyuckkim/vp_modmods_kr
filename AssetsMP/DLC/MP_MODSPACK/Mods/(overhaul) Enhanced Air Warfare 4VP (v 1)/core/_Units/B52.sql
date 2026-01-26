-- rev 3

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================

--------------------------------
-- UnitClasses
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_B52', 'TXT_KEY_UNIT_B52', 'UNIT_B52');

--------------------------------
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range, AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate, PurchaseCooldown, NoSupply, PolicyType)
SELECT		'UNITCLASS_B52', 'UNIT_B52', 'TECH_ADVANCED_BALLISTICS', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	NULL,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_B52', 'TXT_KEY_B52_TEXT', 	'TXT_KEY_UNIT_B52_STRATEGY', 'TXT_KEY_UNIT_HELP_B52', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_B52', 1, 'eaw_flag_ATLAS',	1, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply, 'POLICY_THEIR_FINEST_HOUR'
FROM Units WHERE (Type = 'UNIT_BOMBER');

--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_B52', 'AS2D_SELECT_B52', 'AS2D_SELECT_B52');

--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, UnitAIType)
SELECT		'UNIT_B52', 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_AMERICAN_B17');

--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, ResourceType)
SELECT		'UNIT_B52', ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_AMERICAN_B17');

--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, UnitClassType)
VALUES	
      ('UNIT_B52', 'UNITCLASS_STEALTH_BOMBER');

--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, FlavorType, Flavor)
VALUES
      ('UNIT_B52', 'FLAVOR_OFFENSE', 16), -- B-17 is 15
      ('UNIT_B52', 'FLAVOR_DEFENSE', 7), -- B-17 is 7
      ('UNIT_B52', 'FLAVOR_AIR', 20); -- B-17 is 18

--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, BuildingClassType)
SELECT		('UNIT_B52'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_AMERICAN_B17');

--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		'UNIT_B52', PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_AMERICAN_B17');


INSERT INTO Unit_FreePromotions	(UnitType, PromotionType)
VALUES 
  ('UNIT_B52', 'PROMOTION_AIR_RECON');

--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
VALUES
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_B52', NULL),
	('CIVILIZATION_MINOR', 'UNITCLASS_B52', NULL);


--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, TileType,	Asset)
VALUES		('ART_DEF_UNIT_B52', 'Unit', 'sv_B52flag_128.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_B52', 1, 'BomberWing');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES ('ART_DEF_UNIT_B52', 'ART_DEF_UNIT_MEMBER_B52', 1);
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_B52', 0.128, 'Air', 'EAW_B52.fxsxml', 'METAL', 'METALLRG');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_B52', 'Idle Attack Bombard Death Run', 64, 1.9, 0.14, 0.24, 0);
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_B52', 0, 0, 1, 1, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitRadius, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_B52', 1, 0, 35, 60, 0.89, 50, 1, 1, 'EXPLOSIVE', 'EXPLOSION200POUND');

/*
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_B52', 0, 0, 35, 60, 0.89, 1, 1, 'EXPLOSIVE', 'EXPLOSION200POUND');
*/
--==========================================================================================================================
