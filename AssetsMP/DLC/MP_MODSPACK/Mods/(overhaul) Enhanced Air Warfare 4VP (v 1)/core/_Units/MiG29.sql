-- rev 5

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================

--------------------------------
-- UnitClasses
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_MIG29', 'TXT_KEY_UNIT_MIG29', 'UNIT_MIG29');

--------------------------------
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range,	AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, Special, XPValueAttack, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas, MoveRate, PurchaseCooldown, NoSupply, PolicyType)
SELECT		'UNITCLASS_MIG29', 'UNIT_MIG29', 'TECH_MOBILE_TACTICS', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	NULL,	IsMounted, Special, XPValueAttack, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_MIG29', 'TXT_KEY_MIG29_TEXT', 	'TXT_KEY_UNIT_MIG29_STRATEGY', 'TXT_KEY_UNIT_HELP_MIG29', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_MIG29', 7, 'eaw_flag_ATLAS',	7, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply, 'POLICY_MILITARISM'
FROM Units WHERE (Type = 'UNIT_FIGHTER');

--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MIG29'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_JET_FIGHTER');

--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, UnitAIType)
SELECT		('UNIT_MIG29'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_JAPANESE_ZERO');

--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, ResourceType)
SELECT		('UNIT_MIG29'), ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_JAPANESE_ZERO');

--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, UnitClassType)
VALUES	
      ('UNIT_MIG29', 'UNITCLASS_ADVJET');

--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, FlavorType, Flavor)
VALUES
      ('UNIT_MIG29', 'FLAVOR_OFFENSE', 9), -- Zero is 9, Stealth Fighter is 10
      ('UNIT_MIG29', 'FLAVOR_DEFENSE', 9), -- Zero is 9, Stealth Fighter is 10
      ('UNIT_MIG29', 'FLAVOR_AIR', 17), -- Zero is 13, Stealth Fighter is 20
      ('UNIT_MIG29', 'FLAVOR_ANTIAIR', 28); -- Zero is 25, Fighter is 15, Stealth Fighter is 17

--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, BuildingClassType)
SELECT		('UNIT_MIG29'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_JAPANESE_ZERO');

--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		('UNIT_MIG29'), PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_JAPANESE_ZERO');

--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
VALUES
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_MIG29', NULL),
	('CIVILIZATION_MINOR', 'UNITCLASS_MIG29', NULL);
	
	
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================

------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, TileType,	Asset)
VALUES		('ART_DEF_UNIT_MIG29', 'Unit', 'sv_Mig29flag_128.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_MIG29', 1, 'FighterWing');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES	('ART_DEF_UNIT_MIG29', 'ART_DEF_UNIT_MEMBER_MIG29', 3);
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_MIG29', 0.118, 'Air', 'EAW_MiG29Russia.fxsxml', 'METAL', 'METALLRG');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_MIG29', 'Idle Attack Bombard Death Run', 100, 2.3, 0.2, 0.4, 0);
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_MIG29', 0, 0, 2, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 12, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_MIG29', 1, 0, 1, 1, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 12, 'BULLETHC', 'BULLETHC');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_MIG29', 1, 1, 'PROJECTILE', 25, 50, 2.1, 'EXPLOSIVE', 'EXPLOSION200POUND');

--==========================================================================================================================