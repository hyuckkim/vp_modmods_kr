-- rev 5

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================

--------------------------------
-- UnitClasses
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_MEDIUMBOMBER', 'TXT_KEY_UNIT_MEDIUMBOMBER', 'UNIT_MEDIUMBOMBER');

--------------------------------
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range, AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate, PurchaseCooldown, NoSupply)
SELECT		'UNITCLASS_MEDIUMBOMBER', 'UNIT_MEDIUMBOMBER', 'TECH_ATOMIC_THEORY', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	'TECH_ADVANCED_BALLISTICS',	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_MEDIUMBOMBER', 'TXT_KEY_MEDIUMBOMBER_TEXT', 	'TXT_KEY_UNIT_MEDIUMBOMBER_STRATEGY', 'TXT_KEY_UNIT_HELP_MEDIUMBOMBER', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_MEDIUMBOMBER', 0, 'eaw_flag_ATLAS',	0, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply
FROM Units WHERE (Type = 'UNIT_WWI_BOMBER');

--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_MEDIUMBOMBER', 'AS2D_SELECT_VICK', 'AS2D_SELECT_VICK');

--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, UnitAIType)
SELECT		'UNIT_MEDIUMBOMBER', 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_WWI_BOMBER');

--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, ResourceType)
SELECT		'UNIT_MEDIUMBOMBER', ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_WWI_BOMBER');

--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, UnitClassType)
VALUES	
      ('UNIT_MEDIUMBOMBER', 'UNITCLASS_STRBOMB');

--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, FlavorType, Flavor)
VALUES
      ('UNIT_MEDIUMBOMBER', 'FLAVOR_OFFENSE', 11), -- Early Bomber is, 10 Bomber is 12
      ('UNIT_MEDIUMBOMBER', 'FLAVOR_DEFENSE', 6), -- Early Bomber is 5, Bomber is 6
      ('UNIT_MEDIUMBOMBER', 'FLAVOR_AIR', 15); -- Early Bomber is 14, Bomber is 15

--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, BuildingClassType)
SELECT		('UNIT_MEDIUMBOMBER'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_WWI_BOMBER');

--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		'UNIT_MEDIUMBOMBER', PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_WWI_BOMBER');

--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
VALUES
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_MEDIUMBOMBER', NULL),
	('CIVILIZATION_MINOR', 'UNITCLASS_MEDIUMBOMBER', NULL);


--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================------------------------------	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, TileType,	Asset)
VALUES		('ART_DEF_UNIT_MEDIUMBOMBER', 'Unit', 'sv_VickWflag_128.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_MEDIUMBOMBER', 1, 'BomberWing');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES	('ART_DEF_UNIT_MEDIUMBOMBER', 'ART_DEF_UNIT_MEMBER_MEDIUMBOMBER', 1);
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_MEDIUMBOMBER', 0.089, 'Air', 'EAW_Vickers_Wellington.fxsxml', 'METAL', 'METALLRG');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_MEDIUMBOMBER', 'Idle Attack Bombard Death Run', 64, 1.4, 0.125, 0.295, 0);
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_MEDIUMBOMBER', 0, 0, 1.0, 1.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, 'BULLETHC', 'BULLETHC');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitRadius, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_MEDIUMBOMBER', 1, 0, 15.0, 25.0, 0.899999976158142, 10, 1, 1, 'EXPLOSIVE', 'EXPLOSION200POUND');
--==========================================================================================================================
