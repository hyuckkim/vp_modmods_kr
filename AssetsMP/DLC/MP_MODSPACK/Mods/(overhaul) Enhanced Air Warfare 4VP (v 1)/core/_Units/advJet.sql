-- rev 3

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================

--------------------------------
-- UnitClasses
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_ADVJET', 'TXT_KEY_UNIT_ADVJET', 'UNIT_ADVJET');

--------------------------------
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range,	AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate, PurchaseCooldown, NoSupply)
SELECT		'UNITCLASS_ADVJET', 'UNIT_ADVJET', 'TECH_GLOBALIZATION', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	NULL,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_ADVJET', 'TXT_KEY_ADVJET_TEXT', 	'TXT_KEY_UNIT_ADVJET_STRATEGY', 'TXT_KEY_UNIT_HELP_ADVJET', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_ADVJET', 5, 'eaw_flag_ATLAS',	5, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply
FROM Units WHERE (Type = 'UNIT_JET_FIGHTER');

--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
SELECT		('UNIT_ADVJET'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_JET_FIGHTER');	

--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, UnitAIType)
SELECT		('UNIT_ADVJET'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_JET_FIGHTER');

--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, ResourceType)
SELECT		('UNIT_ADVJET'), ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_JET_FIGHTER');

--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, FlavorType, Flavor)
VALUES
      ('UNIT_ADVJET', 'FLAVOR_OFFENSE', 12), -- Stealth Fighter is 10
      ('UNIT_ADVJET', 'FLAVOR_DEFENSE', 12), -- Stealth Fighter is 10
      ('UNIT_ADVJET', 'FLAVOR_AIR', 24), -- Stealth Fighter is 20
      ('UNIT_ADVJET', 'FLAVOR_ANTIAIR', 18); -- Stealth Fighter is 17

--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, BuildingClassType)
SELECT		('UNIT_ADVJET'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_JET_FIGHTER');

--------------------------------
-- Unit_FreePromotions
--------------------------------

INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		('UNIT_ADVJET'), PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_JET_FIGHTER');

--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
VALUES
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_ADVJET', NULL),
	('CIVILIZATION_MINOR', 'UNITCLASS_ADVJET', NULL);


--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================

------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, TileType,	Asset)
VALUES		('ART_DEF_UNIT_ADVJET', 'Unit', 'sv_SU57flag_128.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_ADVJET', 1, 'FighterWing');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES	('ART_DEF_UNIT_ADVJET', 'ART_DEF_UNIT_MEMBER_ADVJET', 3);
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ADVJET', 0.1, 'Air', 'EAW_SuT-50cammo.fxsxml', 'METAL', 'METALLRG');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_ADVJET', 'Idle Attack Bombard Death Run', 135, 3, 0.35, 0.55, 0);
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ADVJET', 0, 0, 2.4, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ADVJET', 1, 0, 1, 1, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15, 'BULLETHC', 'BULLETHC');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ADVJET', 1, 1, 'PROJECTILE', 25, 50, 2.6, 'EXPLOSIVE', 'EXPLOSION200POUND');

--==========================================================================================================================
