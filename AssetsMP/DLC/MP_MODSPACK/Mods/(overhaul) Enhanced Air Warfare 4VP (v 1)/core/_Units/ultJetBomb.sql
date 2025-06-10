-- rev 4

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================

--------------------------------
-- UnitClasses
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_ULTJETBOMB', 'TXT_KEY_UNIT_ULTJETBOMB', 'UNIT_ULTJETBOMB');

--------------------------------
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range, AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate, PurchaseCooldown, NoSupply)
SELECT		'UNITCLASS_ULTJETBOMB', 'UNIT_ULTJETBOMB', 'TECH_LASERS', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	'TECH_NANOTECHNOLOGY',	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_ULTJETBOMB', 'TXT_KEY_ULTJETBOMB_TEXT', 	'TXT_KEY_UNIT_ULTJETBOMB_STRATEGY', 'TXT_KEY_UNIT_HELP_ULTJETBOMB', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_ULTJETBOMB', 2, 'eaw_flag_ATLAS',	2, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply
FROM Units WHERE (Type = 'UNIT_STEALTH_BOMBER');

--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_ULTJETBOMB', 'AS2D_SELECT_B1', 'AS2D_SELECT_B1');

--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, UnitAIType)
SELECT		'UNIT_ULTJETBOMB', 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_STEALTH_BOMBER');

--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, ResourceType)
SELECT		'UNIT_ULTJETBOMB', ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_STEALTH_BOMBER');

--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, UnitClassType)
VALUES	
      ('UNIT_ULTJETBOMB', 'UNITCLASS_STEALTH_BOMBER');

--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, FlavorType, Flavor)
VALUES
      ('UNIT_ULTJETBOMB', 'FLAVOR_OFFENSE', 14), -- Strategic Bomber is 13, Stealth Bomber is 15
      ('UNIT_ULTJETBOMB', 'FLAVOR_DEFENSE', 8), -- Strategic Bomber is 7, Stealth Bomber is 9
      ('UNIT_ULTJETBOMB', 'FLAVOR_AIR', 23); -- Strategic Bomber is 20, Stealth Bomber is 25

--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, BuildingClassType)
SELECT		('UNIT_ULTJETBOMB'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_STEALTH_BOMBER');

--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		'UNIT_ULTJETBOMB', PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_BOMBER');

INSERT INTO Unit_FreePromotions	(UnitType, PromotionType)
VALUES 
  ('UNIT_ULTJETBOMB', 'PROMOTION_AIR_RECON');
  
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
VALUES
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_ULTJETBOMB', NULL),
	('CIVILIZATION_MINOR', 'UNITCLASS_ULTJETBOMB', NULL);

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, TileType,	Asset)
VALUES		('ART_DEF_UNIT_ULTJETBOMB', 'Unit', 'sv_B1flag_128.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_ULTJETBOMB', 1, 'BomberWing');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES ('ART_DEF_UNIT_ULTJETBOMB', 'ART_DEF_UNIT_MEMBER_ULTJETBOMB', 1);
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos
      (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ULTJETBOMB', 0.121, 'Air', 'EAW_B-1_Lancer.fxsxml', 'METAL', 'METALLRG');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
      (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_ULTJETBOMB', 'Idle Attack Bombard Death Run', 64, 1.9, 0.16, 0.4, 0);
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
      (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_ULTJETBOMB', 0, 0, 25, 55, 0.8, 1, 1, 'EXPLOSIVE', 'EXPLOSION200POUND');
--==========================================================================================================================
