-- rev 4

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================

--------------------------------
-- UnitClasses
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_EARLYMONOPLAN', 'TXT_KEY_UNIT_EARLYMONOPLAN', 'UNIT_EARLYMONOPLAN');

--------------------------------
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range, AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate, PurchaseCooldown, NoSupply)
SELECT		'UNITCLASS_EARLYMONOPLAN', 'UNIT_EARLYMONOPLAN', 'TECH_ATOMIC_THEORY', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	'TECH_MOBILE_TACTICS',	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_EARLYMONOPLAN', 'TXT_KEY_EARLYMONOPLAN_TEXT', 	'TXT_KEY_UNIT_EARLYMONOPLAN_STRATEGY', 'TXT_KEY_UNIT_HELP_EARLYMONOPLAN', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_EARLYMONOPLAN', 3, 'eaw_flag_ATLAS',	3, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply
FROM Units WHERE (Type = 'UNIT_TRIPLANE');

--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES	('UNIT_EARLYMONOPLAN', 'AS2D_SELECT_P11', 'AS2D_SELECT_P11');

--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, UnitAIType)
SELECT		'UNIT_EARLYMONOPLAN', UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_TRIPLANE');

--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, ResourceType)
SELECT		'UNIT_EARLYMONOPLAN', ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_TRIPLANE');

--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, UnitClassType)
VALUES	
      ('UNIT_EARLYMONOPLAN', 'UNITCLASS_JET27');

--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, FlavorType, Flavor)
VALUES
      ('UNIT_EARLYMONOPLAN', 'FLAVOR_OFFENSE', 6), -- Triplane is 5, Fighter is 8
      ('UNIT_EARLYMONOPLAN', 'FLAVOR_DEFENSE', 6), -- Triplane is 5, Fighter is 8
      ('UNIT_EARLYMONOPLAN', 'FLAVOR_AIR', 11), -- Triplane is 10, Fighter is 12
      ('UNIT_EARLYMONOPLAN', 'FLAVOR_ANTIAIR', 13); -- Triplane is 12, Fighter is 15

--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, BuildingClassType)
SELECT		('UNIT_EARLYMONOPLAN'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_TRIPLANE');

--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		'UNIT_EARLYMONOPLAN', PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_TRIPLANE');

--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
VALUES
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_EARLYMONOPLAN', NULL),
	('CIVILIZATION_MINOR', 'UNITCLASS_EARLYMONOPLAN', NULL);


--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, TileType,	Asset)
VALUES		('ART_DEF_UNIT_EARLYMONOPLAN', 'Unit', 'sv_P11flag_128.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_EARLYMONOPLAN', 1, 'FighterWing');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES	('ART_DEF_UNIT_EARLYMONOPLAN', 'ART_DEF_UNIT_MEMBER_EARLYMONOPLAN', 3);
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYMONOPLAN', 0.082, 'Air', 'EAW_PZL_P.11.fxsxml', 'METAL', 'METALLRG');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYMONOPLAN', 'Idle Attack Bombard Death Run', 45, 1.5, 0.3, 0.5, 0);
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYMONOPLAN', 0, 0, 10, 20, 1.3, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 25, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYMONOPLAN', 1, 0, 1, 1, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 35, 'BULLETHC', 'BULLETHC');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_EARLYMONOPLAN', 1, 1, 'PROJECTILE', 25, 50, 1.3, 1, 1, 'EXPLOSIVE', 'EXPLOSION200POUND');

--==========================================================================================================================
