/*
'UNIT_TRIPLANE'                 Triplane (Airbase)
'UNIT_EARLYMONOPLAN'            Monoplane (Carrier)
'UNIT_FIGHTER'                  Piston Fighter (Airbase)         
'UNIT_JAPANESE_ZERO'            A6M Zero (Piston Fighter, Policy-only, Carrier-capable)
'UNIT_EARLYJET'                 P-80 Shooting Star (Airbase, Wonder-only: Pentagon)
'UNIT_JET27'                    F/A-18 (Carrier Jet Fighter)
'UNIT_MIG29'                    MiG-29K (Carrier Jet Fighter, Policy-only)
'UNIT_JET_FIGHTER'              F-22 Raptor (Stealth Air Superiority, Airbase)
'UNIT_ADVJET'                   F-35 Lightning II (Advanced Stealth, Carrier)

'UNIT_WWI_BOMBER'               Biplane Naval Bomber (Carrier)
'UNIT_LIGHTBOMBER'             Carrier Light Bomber (Carrier)
'UNIT_BOMBER'                   Heavy Bomber (Airbase)
'UNIT_AMERICAN_B17'             B-17 Flying Fortress (Airbase, Policy-only)
'UNIT_STRBOMB'                  Strategic Bomber (Airbase)      
'UNIT_B52'                      B-52 Stratofortress (Airbase, Policy-only)
'UNIT_ULTJETBOMB'               Jet Bomber (Airbase)
'UNIT_STEALTH_BOMBER'           Stealth Bomber (Airbase)
*/
--==========================================================================================================================	
-- Atlas
--==========================================================================================================================
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES		
('eaw_i_ATLAS', 256, 'EAW_i_256.dds', 9,1),
('eaw_i_ATLAS', 128, 'EAW_i_128.dds', 9,1),
('eaw_i_ATLAS', 080, 'EAW_i_080.dds', 9,1),
('eaw_i_ATLAS', 064, 'EAW_i_064.dds', 9,1),
('eaw_i_ATLAS', 045, 'EAW_i_045.dds', 9,1),
('eaw_flag_ATLAS', 32, 'EAW_flag_32.dds', 9, 1);

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
--=======================================================
-- Air fighters
--=======================================================
--------------------------------
-- Early Mono
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_EARLYMONOPLAN', 'TXT_KEY_UNIT_EARLYMONOPLAN', 'UNIT_EARLYMONOPLAN');

INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range, AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate, PurchaseCooldown, NoSupply)
SELECT		'UNITCLASS_EARLYMONOPLAN', 'UNIT_EARLYMONOPLAN', 'TECH_ATOMIC_THEORY', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	'TECH_SATELLITES',	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_EARLYMONOPLAN', 'TXT_KEY_EARLYMONOPLAN_TEXT', 	'TXT_KEY_UNIT_EARLYMONOPLAN_STRATEGY', 'TXT_KEY_UNIT_HELP_EARLYMONOPLAN', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_EARLYMONOPLAN', 3, 'eaw_flag_ATLAS',	3, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply
FROM Units WHERE (Type = 'UNIT_TRIPLANE');

--------------------------------
-- Early Jet
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_EARLYJET', 'TXT_KEY_UNIT_EARLYJET', 'UNIT_EARLYJET');

INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range,	AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, Special, XPValueAttack, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, 	IconAtlas, MoveRate, PurchaseCooldown, NoSupply, FreeUpgrade)
SELECT		'UNITCLASS_EARLYJET', 'UNIT_EARLYJET', 'TECH_COMBINED_ARMS', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, Special, XPValueAttack, Combat, -1,	-1, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_EARLYJET', 'TXT_KEY_EARLYJET_TEXT', 	'TXT_KEY_UNIT_EARLYJET_STRATEGY', 'TXT_KEY_UNIT_HELP_EARLYJET', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_EARLYJET', 4, 'eaw_flag_ATLAS',	4, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply, 1
FROM Units WHERE (Type = 'UNIT_FIGHTER');


--------------------------------
-- JET 27 Supersonic fighter
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_JET27', 'TXT_KEY_UNIT_JET27', 'UNIT_JET27');

INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range,	AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, Special, XPValueAttack, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, 	IconAtlas, MoveRate, PurchaseCooldown, NoSupply)
SELECT		'UNITCLASS_JET27', 'UNIT_JET27', 'TECH_SATELLITES', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	NULL,	IsMounted, Special, XPValueAttack, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JET27', 'TXT_KEY_JET27_TEXT', 	'TXT_KEY_UNIT_JET27_STRATEGY', 'TXT_KEY_UNIT_HELP_JET27', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_JET27', 6, 'eaw_flag_ATLAS',	6, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply
FROM Units WHERE (Type = 'UNIT_FIGHTER');

--------------------------------
-- MIG 29
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_MIG29', 'TXT_KEY_UNIT_MIG29', 'UNIT_MIG29');

INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range,	AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, Special, XPValueAttack, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas, MoveRate, PurchaseCooldown, NoSupply, PolicyType)
SELECT		'UNITCLASS_MIG29', 'UNIT_MIG29', 'TECH_SATELLITES', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	NULL,	IsMounted, Special, XPValueAttack, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_MIG29', 'TXT_KEY_MIG29_TEXT', 	'TXT_KEY_UNIT_MIG29_STRATEGY', 'TXT_KEY_UNIT_HELP_MIG29', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_MIG29', 7, 'eaw_flag_ATLAS',	7, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply, 'POLICY_MILITARISM'
FROM Units WHERE (Type = 'UNIT_FIGHTER');

--------------------------------
-- Advanced Stealth Jet
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_ADVJET', 'TXT_KEY_UNIT_ADVJET', 'UNIT_ADVJET');

INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range,	AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate, PurchaseCooldown, NoSupply)
SELECT		'UNITCLASS_ADVJET', 'UNIT_ADVJET', 'TECH_GLOBALIZATION', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	NULL,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_ADVJET', 'TXT_KEY_ADVJET_TEXT', 	'TXT_KEY_UNIT_ADVJET_STRATEGY', 'TXT_KEY_UNIT_HELP_ADVJET', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_ADVJET', 5, 'eaw_flag_ATLAS',	5, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply
FROM Units WHERE (Type = 'UNIT_JET_FIGHTER');
	
--=======================================================
-- Bombers
--=======================================================
--------------------------------
-- Median Bomber
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_LIGHTBOMBER', 'TXT_KEY_UNIT_LIGHTBOMBER', 'UNIT_LIGHTBOMBER');

INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range, AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate, PurchaseCooldown, NoSupply)
SELECT		'UNITCLASS_LIGHTBOMBER', 'UNIT_LIGHTBOMBER', 'TECH_ATOMIC_THEORY', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	'TECH_ADVANCED_BALLISTICS',	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_LIGHTBOMBER', 'TXT_KEY_LIGHTBOMBER_TEXT', 	'TXT_KEY_UNIT_LIGHTBOMBER_STRATEGY', 'TXT_KEY_UNIT_HELP_LIGHTBOMBER', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_LIGHTBOMBER', 0, 'eaw_flag_ATLAS',	0, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply
FROM Units WHERE (Type = 'UNIT_WWI_BOMBER');

--------------------------------
-- Strategic bomber
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_STRBOMB', 'TXT_KEY_UNIT_STRBOMB', 'UNIT_STRBOMB');

INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range, AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate, PurchaseCooldown, NoSupply)
SELECT		'UNITCLASS_STRBOMB', 'UNIT_STRBOMB', 'TECH_ADVANCED_BALLISTICS', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	NULL,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_STRBOMB', 'TXT_KEY_STRBOMB_TEXT', 	'TXT_KEY_UNIT_STRBOMB_STRATEGY', 'TXT_KEY_UNIT_HELP_STRBOMB', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_STRBOMB', 8, 'eaw_flag_ATLAS',	8, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply
FROM Units WHERE (Type = 'UNIT_BOMBER');

--------------------------------
-- B 52
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_B52', 'TXT_KEY_UNIT_B52', 'UNIT_B52');

INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range, AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate, PurchaseCooldown, NoSupply, PolicyType)
SELECT		'UNITCLASS_B52', 'UNIT_B52', 'TECH_ADVANCED_BALLISTICS', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	NULL,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_B52', 'TXT_KEY_B52_TEXT', 	'TXT_KEY_UNIT_B52_STRATEGY', 'TXT_KEY_UNIT_HELP_B52', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_B52', 1, 'eaw_flag_ATLAS',	1, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply, 'POLICY_THEIR_FINEST_HOUR'
FROM Units WHERE (Type = 'UNIT_BOMBER');

--------------------------------
-- Ultijet Bomb
--------------------------------
INSERT INTO UnitClasses (Type, Description, DefaultUnit)
VALUES ('UNITCLASS_ULTJETBOMB', 'TXT_KEY_UNIT_ULTJETBOMB', 'UNIT_ULTJETBOMB');

INSERT INTO Units 	
			(Class, Type, PrereqTech, RangedCombat, Range, AirInterceptRange, BaseSightRange,	ObsoleteTech,	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate, PurchaseCooldown, NoSupply)
SELECT		'UNITCLASS_ULTJETBOMB', 'UNIT_ULTJETBOMB', 'TECH_STEALTH', RangedCombat, Range,	AirInterceptRange, BaseSightRange,	'TECH_NUCLEAR_FUSION',	IsMounted, XPValueAttack, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_ULTJETBOMB', 'TXT_KEY_ULTJETBOMB_TEXT', 	'TXT_KEY_UNIT_ULTJETBOMB_STRATEGY', 'TXT_KEY_UNIT_HELP_ULTJETBOMB', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, 300, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_ULTJETBOMB', 2, 'eaw_flag_ATLAS',	2, 'eaw_i_ATLAS', MoveRate, PurchaseCooldown, NoSupply
FROM Units WHERE (Type = 'UNIT_STEALTH_BOMBER');

--==========================================================================================================================	
-- AI types
--==========================================================================================================================
--=======================================================
-- Air fighters
--=======================================================
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
SELECT		'UNIT_EARLYJET', 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_AITypes (UnitType, UnitAIType)
SELECT		'UNIT_EARLYMONOPLAN', UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_TRIPLANE');
	
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
SELECT		'UNIT_JET27', UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_FIGHTER');
	
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
SELECT		'UNIT_MIG29', 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_JAPANESE_ZERO');
	
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
SELECT		'UNIT_ADVJET', 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_JET_FIGHTER');
--=======================================================
-- Bombers
--=======================================================
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
SELECT		'UNIT_LIGHTBOMBER', 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_WWI_BOMBER');
	
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
SELECT		'UNIT_STRBOMB', UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_BOMBER');
	
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
SELECT		'UNIT_B52', 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_AMERICAN_B17');
		
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
SELECT		'UNIT_ULTJETBOMB', 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_STEALTH_BOMBER');

--==========================================================================================================================	
-- Flavor
--==========================================================================================================================
--=======================================================
-- Air fighters
--=======================================================
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_EARLYMONOPLAN', 'FLAVOR_OFFENSE', 6), -- Triplane is 5, Fighter is 8
('UNIT_EARLYMONOPLAN', 'FLAVOR_DEFENSE', 6), -- Triplane is 5, Fighter is 8
('UNIT_EARLYMONOPLAN', 'FLAVOR_AIR', 11), -- Triplane is 10, Fighter is 12
('UNIT_EARLYMONOPLAN', 'FLAVOR_ANTIAIR', 13); -- Triplane is 12, Fighter is 15

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_JET27', 'FLAVOR_OFFENSE', 9), -- Fighter is 8, Stealth Fighter is 10
('UNIT_JET27', 'FLAVOR_DEFENSE', 9), -- Fighter is 8, Stealth Fighter is 10
('UNIT_JET27', 'FLAVOR_AIR', 16), -- Fighter is 12, Stealth Fighter is 20
('UNIT_JET27', 'FLAVOR_ANTIAIR', 16); -- Fighter is 15, Stealth Fighter is 17

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_MIG29', 'FLAVOR_OFFENSE', 9), -- Zero is 9, Stealth Fighter is 10
('UNIT_MIG29', 'FLAVOR_DEFENSE', 9), -- Zero is 9, Stealth Fighter is 10
('UNIT_MIG29', 'FLAVOR_AIR', 17), -- Zero is 13, Stealth Fighter is 20
('UNIT_MIG29', 'FLAVOR_ANTIAIR', 28); -- Zero is 25, Fighter is 15, Stealth Fighter is 17

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)
SELECT		('UNIT_EARLYJET'), FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_ADVJET', 'FLAVOR_OFFENSE', 12), -- Stealth Fighter is 10
('UNIT_ADVJET', 'FLAVOR_DEFENSE', 12), -- Stealth Fighter is 10
('UNIT_ADVJET', 'FLAVOR_AIR', 24), -- Stealth Fighter is 20
('UNIT_ADVJET', 'FLAVOR_ANTIAIR', 18); -- Stealth Fighter is 17

UPDATE Unit_Flavors SET Flavor = 17 WHERE UnitType = 'UNIT_JET_FIGHTER' AND FlavorType = 'FLAVOR_ANTIAIR'; -- was 15
--=======================================================
-- Bombers
--=======================================================
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_LIGHTBOMBER', 'FLAVOR_OFFENSE', 11), -- Early Bomber is, 10 Bomber is 12
('UNIT_LIGHTBOMBER', 'FLAVOR_DEFENSE', 6), -- Early Bomber is 5, Bomber is 6
('UNIT_LIGHTBOMBER', 'FLAVOR_AIR', 15); -- Early Bomber is 14, Bomber is 15
	
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_STRBOMB', 'FLAVOR_OFFENSE', 13), -- Bomber is 12, Jet Bomber is 14
('UNIT_STRBOMB', 'FLAVOR_DEFENSE', 7), -- Bomber is 6, Jet Bomber is 8
('UNIT_STRBOMB', 'FLAVOR_AIR', 20); -- Bomber is 15, Jet Bomber is 23

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_B52', 'FLAVOR_OFFENSE', 16), -- B-17 is 15
('UNIT_B52', 'FLAVOR_DEFENSE', 7), -- B-17 is 7
('UNIT_B52', 'FLAVOR_AIR', 20); -- B-17 is 18

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_ULTJETBOMB', 'FLAVOR_OFFENSE', 14), -- Strategic Bomber is 13, Stealth Bomber is 15
('UNIT_ULTJETBOMB', 'FLAVOR_DEFENSE', 8), -- Strategic Bomber is 7, Stealth Bomber is 9
('UNIT_ULTJETBOMB', 'FLAVOR_AIR', 23); -- Strategic Bomber is 20, Stealth Bomber is 25

--==========================================================================================================================	
-- ClassOverrides
--==========================================================================================================================
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES
('CIVILIZATION_BARBARIAN', 'UNITCLASS_EARLYJET', NULL),
('CIVILIZATION_MINOR',    'UNITCLASS_EARLYJET', NULL),
('CIVILIZATION_BARBARIAN', 'UNITCLASS_EARLYMONOPLAN', NULL),
('CIVILIZATION_MINOR',    'UNITCLASS_EARLYMONOPLAN', NULL),
('CIVILIZATION_BARBARIAN', 'UNITCLASS_JET27', NULL),
('CIVILIZATION_MINOR',    'UNITCLASS_JET27', NULL),
('CIVILIZATION_BARBARIAN', 'UNITCLASS_MIG29', NULL),
('CIVILIZATION_MINOR',    'UNITCLASS_MIG29', NULL),
('CIVILIZATION_BARBARIAN', 'UNITCLASS_ADVJET', NULL),
('CIVILIZATION_MINOR',    'UNITCLASS_ADVJET', NULL),
('CIVILIZATION_BARBARIAN', 'UNITCLASS_LIGHTBOMBER', NULL),
('CIVILIZATION_MINOR',    'UNITCLASS_LIGHTBOMBER', NULL),
('CIVILIZATION_BARBARIAN', 'UNITCLASS_STRBOMB', NULL),
('CIVILIZATION_MINOR',    'UNITCLASS_STRBOMB', NULL),
('CIVILIZATION_BARBARIAN', 'UNITCLASS_B52', NULL),
('CIVILIZATION_MINOR',    'UNITCLASS_B52', NULL),
('CIVILIZATION_BARBARIAN', 'UNITCLASS_ULTJETBOMB', NULL),
('CIVILIZATION_MINOR',    'UNITCLASS_ULTJETBOMB', NULL);

------------------------------------------------
-- PurchaseRequireds 
-------------------------------------------------
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
SELECT		('UNIT_EARLYMONOPLAN'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_TRIPLANE');

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
SELECT		('UNIT_JET27'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
SELECT		('UNIT_MIG29'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_JAPANESE_ZERO');	

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
SELECT		('UNIT_ADVJET'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_JET_FIGHTER');

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
SELECT		('UNIT_LIGHTBOMBER'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_WWI_BOMBER');

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
SELECT		('UNIT_STRBOMB'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_BOMBER');
	
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
SELECT		('UNIT_B52'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_AMERICAN_B17');

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
SELECT		('UNIT_ULTJETBOMB'), BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE (UnitType = 'UNIT_STEALTH_BOMBER');

------------------------------------------------
-- ResourceQuantityRequirements 
-------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType)
SELECT		'UNIT_EARLYMONOPLAN', ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_TRIPLANE');

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType)
SELECT		'UNIT_JET27', ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType)
SELECT		'UNIT_MIG29', ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_JAPANESE_ZERO');

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType)
SELECT		'UNIT_ADVJET', ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_JET_FIGHTER');

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType)
SELECT		'UNIT_LIGHTBOMBER', ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_WWI_BOMBER');

INSERT INTO Unit_ResourceQuantityRequirements 	(UnitType, ResourceType)
SELECT		'UNIT_STRBOMB', ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_BOMBER');
		
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType)
SELECT		'UNIT_B52', ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_AMERICAN_B17');

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType)
SELECT		'UNIT_ULTJETBOMB', ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_BOMBER');
--==========================================================================================================================	
-- RCS & Cost & Faith
--==========================================================================================================================
/*
'UNIT_TRIPLANE'                 Triplane (Airbase)
'UNIT_EARLYMONOPLAN'            Monoplane (Carrier)
'UNIT_FIGHTER'                  Piston Fighter (Airbase)         
'UNIT_JAPANESE_ZERO'            A6M Zero (Piston Fighter, Policy-only, Carrier-capable)
'UNIT_EARLYJET'                 P-80 Shooting Star (Airbase, Wonder-only: Pentagon)
'UNIT_JET27'                    F/A-18 (Carrier Jet Fighter)
'UNIT_MIG29'                    MiG-29K (Carrier Jet Fighter, Policy-only)
'UNIT_JET_FIGHTER'              F-22 Raptor (Stealth Air Superiority, Airbase)
'UNIT_ADVJET'                   F-35 Lightning II (Advanced Stealth, Carrier)

'UNIT_WWI_BOMBER'               Biplane Naval Bomber (Carrier)
'UNIT_LIGHTBOMBER'             Carrier Light Bomber (Carrier)
'UNIT_BOMBER'                   Heavy Bomber (Airbase)
'UNIT_AMERICAN_B17'             B-17 Flying Fortress (Airbase, Policy-only)
'UNIT_STRBOMB'                  Strategic Bomber (Airbase)      
'UNIT_B52'                      B-52 Stratofortress (Airbase, Policy-only)
'UNIT_ULTJETBOMB'               Jet Bomber (Airbase)
'UNIT_STEALTH_BOMBER'           Stealth Bomber (Airbase)
*/

----- RCS
UPDATE Units SET RangedCombat = 44 WHERE Type = 'UNIT_TRIPLANE'; 
UPDATE Units SET RangedCombat = 50 WHERE Type = 'UNIT_EARLYMONOPLAN'; 
UPDATE Units SET RangedCombat = 57 WHERE Type = 'UNIT_FIGHTER'; 
UPDATE Units SET RangedCombat = 58 WHERE Type = 'UNIT_JAPANESE_ZERO'; 
UPDATE Units SET RangedCombat = 61 WHERE Type = 'UNIT_EARLYJET'; 
UPDATE Units SET RangedCombat = 65 WHERE Type = 'UNIT_JET27'; 
UPDATE Units SET RangedCombat = 66 WHERE Type = 'UNIT_MIG29';
UPDATE Units SET RangedCombat = 74 WHERE Type = 'UNIT_JET_FIGHTER'; 
UPDATE Units SET RangedCombat = 84 WHERE Type = 'UNIT_ADVJET'; 

UPDATE Units SET RangedCombat = 48 WHERE Type = 'UNIT_WWI_BOMBER';
UPDATE Units SET RangedCombat = 55 WHERE Type = 'UNIT_LIGHTBOMBER';
UPDATE Units SET RangedCombat = 63 WHERE Type = 'UNIT_BOMBER'; 
UPDATE Units SET RangedCombat = 67 WHERE Type = 'UNIT_AMERICAN_B17';
UPDATE Units SET RangedCombat = 72 WHERE Type = 'UNIT_STRBOMB'; 
UPDATE Units SET RangedCombat = 76 WHERE Type = 'UNIT_B52';
UPDATE Units SET RangedCombat = 82 WHERE Type = 'UNIT_ULTJETBOMB';
UPDATE Units SET RangedCombat = 93 WHERE Type = 'UNIT_STEALTH_BOMBER'; 

----- Range
UPDATE Units SET Range = 6 WHERE Type = 'UNIT_TRIPLANE';
UPDATE Units SET Range = 7 WHERE Type = 'UNIT_EARLYMONOPLAN';
UPDATE Units SET Range = 8 WHERE Type = 'UNIT_FIGHTER'; 
UPDATE Units SET Range = 8 WHERE Type = 'UNIT_JAPANESE_ZERO'; 
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_EARLYJET'; 
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_JET27'; 
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_MIG29';
UPDATE Units SET Range = 10 WHERE Type = 'UNIT_JET_FIGHTER'; 
UPDATE Units SET Range = 11 WHERE Type = 'UNIT_ADVJET'; 

UPDATE Units SET Range = 6 WHERE Type = 'UNIT_WWI_BOMBER'; 
UPDATE Units SET Range = 7 WHERE Type = 'UNIT_LIGHTBOMBER';
UPDATE Units SET Range = 8 WHERE Type = 'UNIT_BOMBER'; 
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_AMERICAN_B17'; 
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_STRBOMB'; 
UPDATE Units SET Range = 10 WHERE Type = 'UNIT_B52'; 
UPDATE Units SET Range = 10 WHERE Type = 'UNIT_ULTJETBOMB';
UPDATE Units SET Range = 11 WHERE Type = 'UNIT_STEALTH_BOMBER'; 

----- Interception Range
UPDATE Units SET AirInterceptRange = 6 WHERE Type = 'UNIT_TRIPLANE'; 
UPDATE Units SET AirInterceptRange = 7 WHERE Type = 'UNIT_EARLYMONOPLAN'; 
UPDATE Units SET AirInterceptRange = 8 WHERE Type = 'UNIT_FIGHTER'; 
UPDATE Units SET AirInterceptRange = 8 WHERE Type = 'UNIT_JAPANESE_ZERO'; 
UPDATE Units SET AirInterceptRange = 8 WHERE Type = 'UNIT_EARLYJET'; 
UPDATE Units SET AirInterceptRange = 9 WHERE Type = 'UNIT_JET27'; 
UPDATE Units SET AirInterceptRange = 9 WHERE Type = 'UNIT_MIG29'; 
UPDATE Units SET AirInterceptRange = 10 WHERE Type = 'UNIT_JET_FIGHTER'; 
UPDATE Units SET AirInterceptRange = 11 WHERE Type = 'UNIT_ADVJET'; 

----- Cost
UPDATE Units SET Cost = 1000 WHERE Type = 'UNIT_TRIPLANE';
UPDATE Units SET Cost = 1250 WHERE Type = 'UNIT_EARLYMONOPLAN';
UPDATE Units SET Cost = 1450 WHERE Type = 'UNIT_FIGHTER'; 
UPDATE Units SET Cost = 1450 WHERE Type = 'UNIT_JAPANESE_ZERO'; 
UPDATE Units SET Cost = 1800 WHERE Type = 'UNIT_JET27'; 
UPDATE Units SET Cost = 1800 WHERE Type = 'UNIT_MIG29'; 
UPDATE Units SET Cost = 2200 WHERE Type = 'UNIT_JET_FIGHTER'; 
UPDATE Units SET Cost = 2500 WHERE Type = 'UNIT_ADVJET'; 

UPDATE Units SET Cost = 1050 WHERE Type = 'UNIT_WWI_BOMBER';
UPDATE Units SET Cost = 1300 WHERE Type = 'UNIT_LIGHTBOMBER'; 
UPDATE Units SET Cost = 1500 WHERE Type = 'UNIT_BOMBER'; 
UPDATE Units SET Cost = 1500 WHERE Type = 'UNIT_AMERICAN_B17'; 
UPDATE Units SET Cost = 1900 WHERE Type = 'UNIT_STRBOMB'; 
UPDATE Units SET Cost = 1900 WHERE Type = 'UNIT_B52'; 
UPDATE Units SET Cost = 2250 WHERE Type = 'UNIT_ULTJETBOMB';
UPDATE Units SET Cost = 2600 WHERE Type = 'UNIT_STEALTH_BOMBER';

----- Faith Cost
UPDATE Units SET FaithCost = 900 WHERE Type = 'UNIT_TRIPLANE'; 
UPDATE Units SET FaithCost = 1000 WHERE Type = 'UNIT_EARLYMONOPLAN';
UPDATE Units SET FaithCost = 1400 WHERE Type = 'UNIT_FIGHTER'; 
UPDATE Units SET FaithCost = 1400 WHERE Type = 'UNIT_JAPANESE_ZERO'; 
UPDATE Units SET FaithCost = 1600 WHERE Type = 'UNIT_JET27';
UPDATE Units SET FaithCost = 1600 WHERE Type = 'UNIT_MIG29'; 
UPDATE Units SET FaithCost = 1800 WHERE Type = 'UNIT_JET_FIGHTER'; 
UPDATE Units SET FaithCost = 2000 WHERE Type = 'UNIT_ADVJET';

UPDATE Units SET FaithCost = 900 WHERE Type = 'UNIT_WWI_BOMBER'; 
UPDATE Units SET FaithCost = 1000 WHERE Type = 'UNIT_LIGHTBOMBER';
UPDATE Units SET FaithCost = 1400 WHERE Type = 'UNIT_BOMBER'; 
UPDATE Units SET FaithCost = 1400 WHERE Type = 'UNIT_AMERICAN_B17'; 
UPDATE Units SET FaithCost = 1600 WHERE Type = 'UNIT_STRBOMB'; 
UPDATE Units SET FaithCost = 1600 WHERE Type = 'UNIT_B52';
UPDATE Units SET FaithCost = 1800 WHERE Type = 'UNIT_ULTJETBOMB'; 
UPDATE Units SET FaithCost = 2000 WHERE Type = 'UNIT_STEALTH_BOMBER'; 

--==========================================================================================================================	
-- ClassUpgrades
--==========================================================================================================================

DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JET_FIGHTER';

INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType) VALUES
('UNIT_EARLYJET',     'UNITCLASS_JET27'),
('UNIT_EARLYMONOPLAN','UNITCLASS_JET27'),
('UNIT_JET27',        'UNITCLASS_ADVJET'),
('UNIT_MIG29',        'UNITCLASS_ADVJET'),
('UNIT_JET_FIGHTER',  'UNITCLASS_ADVJET'),
('UNIT_LIGHTBOMBER', 'UNITCLASS_STRBOMB'),
('UNIT_JET_FIGHTER', 'UNITCLASS_ADVJET'),
('UNIT_B52',          'UNITCLASS_STEALTH_BOMBER'),
('UNIT_STRBOMB',      'UNITCLASS_STEALTH_BOMBER'),
('UNIT_ULTJETBOMB',   'UNITCLASS_STEALTH_BOMBER');

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_ULTJETBOMB' WHERE UnitType = 'UNIT_AMERICAN_B17';
UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_ULTJETBOMB' WHERE UnitType = 'UNIT_BOMBER';
--==========================================================================================================================	
-- Specail Units
--==========================================================================================================================
----- Pentagon gives 2x P-80 Shooting Star instead of 2x Stealth Fighters 
UPDATE Building_FreeUnits SET UnitType = 'UNIT_EARLYJET' WHERE BuildingType = 'BUILDING_PENTAGON' AND NumUnits = '2';
UPDATE Buildings SET AirModifier = 2 WHERE Type = 'BUILDING_PENTAGON';

----- Medium Bomber now upgrades into B-52 if you have POLICY_THEIR_FINEST_HOUR
----- Monoplane now upgrades into MiG-29 if you have POLICY_MILITARISM
INSERT INTO Policy_UnitClassReplacements
	(PolicyType, ReplacedUnitClassType, ReplacementUnitClassType)
VALUES
	('POLICY_MILITARISM', 'UNITCLASS_JET27', 'UNITCLASS_MIG29');
	
INSERT INTO Policy_UnitClassReplacements
	(PolicyType, ReplacedUnitClassType, ReplacementUnitClassType)
VALUES
	('POLICY_THEIR_FINEST_HOUR', 'UNITCLASS_STRBOMB', 'UNITCLASS_B52');


--==========================================================================================================================	
-- Airbase Unit Change (New function)
--==========================================================================================================================

INSERT OR IGNORE INTO SpecialUnits (Type, Description, Valid, CityLoad)
VALUES ('SPECIALUNIT_AIRBASE', 'TXT_KEY_SPECIALUNIT_AIRBASE', 1, 1);

UPDATE SpecialUnits
SET Valid = 1, CityLoad = 1
WHERE Type = 'SPECIALUNIT_AIRBASE';

UPDATE Units
SET Special = 'SPECIALUNIT_AIRBASE'
WHERE Type IN (
    'UNIT_TRIPLANE',          -- Triplane (Airbase)
    'UNIT_FIGHTER',           -- Piston/Propeller Fighter (Airbase)
    'UNIT_EARLYJET',          -- P-80 Shooting Star (Airbase, Pentagon)
    'UNIT_JET_FIGHTER',       -- F-22 (Airbase)

    'UNIT_BOMBER',            -- Heavy Bomber (Airbase)
    'UNIT_AMERICAN_B17',      -- B-17 (Airbase, Policy-only)
    'UNIT_STRBOMB',           -- Strategic Bomber (Airbase)
    'UNIT_B52',               -- B-52 (Airbase, Policy-only)
    'UNIT_ULTJETBOMB',        -- Jet Bomber (Airbase)
    'UNIT_STEALTH_BOMBER'     -- Stealth Bomber (Airbase)
);
UPDATE Units SET RangedCombat = 78 WHERE Type = 'UNIT_JET_FIGHTER'; 
UPDATE Units SET RangedCombat = 82 WHERE Type = 'UNIT_ADVJET'; 

UPDATE Units SET Range = 6 WHERE Type = 'UNIT_TRIPLANE';
UPDATE Units SET Range = 7 WHERE Type = 'UNIT_EARLYMONOPLAN';
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_FIGHTER'; 
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_JAPANESE_ZERO'; 
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_EARLYJET'; 
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_JET27'; 
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_MIG29';
UPDATE Units SET Range = 11 WHERE Type = 'UNIT_JET_FIGHTER'; 
UPDATE Units SET Range = 11 WHERE Type = 'UNIT_ADVJET'; 

UPDATE Units SET Range = 6 WHERE Type = 'UNIT_WWI_BOMBER'; -- carrier
UPDATE Units SET Range = 7 WHERE Type = 'UNIT_LIGHTBOMBER'; -- carrier
UPDATE Units SET Range = 12 WHERE Type = 'UNIT_BOMBER'; 
UPDATE Units SET Range = 13 WHERE Type = 'UNIT_AMERICAN_B17'; -- Policy
UPDATE Units SET Range = 13 WHERE Type = 'UNIT_STRBOMB'; 
UPDATE Units SET Range = 14 WHERE Type = 'UNIT_B52'; -- Policy
UPDATE Units SET Range = 15 WHERE Type = 'UNIT_ULTJETBOMB';
UPDATE Units SET Range = 18 WHERE Type = 'UNIT_STEALTH_BOMBER'; 

----- Interception Range
UPDATE Units SET AirInterceptRange = 6 WHERE Type = 'UNIT_TRIPLANE'; 
UPDATE Units SET AirInterceptRange = 7 WHERE Type = 'UNIT_EARLYMONOPLAN'; 
UPDATE Units SET AirInterceptRange = 9 WHERE Type = 'UNIT_FIGHTER'; 
UPDATE Units SET AirInterceptRange = 9 WHERE Type = 'UNIT_JAPANESE_ZERO'; 
UPDATE Units SET AirInterceptRange = 9 WHERE Type = 'UNIT_EARLYJET'; 
UPDATE Units SET AirInterceptRange = 9 WHERE Type = 'UNIT_JET27'; 
UPDATE Units SET AirInterceptRange = 9 WHERE Type = 'UNIT_MIG29'; 
UPDATE Units SET AirInterceptRange = 11 WHERE Type = 'UNIT_JET_FIGHTER'; 
UPDATE Units SET AirInterceptRange = 11 WHERE Type = 'UNIT_ADVJET'; 


--==========================================================================================================================	
-- TECH UPDATE
--==========================================================================================================================
INSERT INTO IconTextureAtlases	(Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('CENW_PI_ATLAS', 256, 'CENW_IconAtlas256.dds', 4, 3),
('CENW_PI_ATLAS', 128, 'CENW_IconAtlas128.dds', 4, 3),
('CENW_PI_ATLAS', 80, 'CENW_IconAtlas80.dds', 4, 3),
('CENW_PI_ATLAS', 64, 'CENW_IconAtlas64.dds', 4, 3),
('CENW_PI_ATLAS', 45, 'CENW_IconAtlas45.dds', 4, 3);

UPDATE Units SET PortraitIndex = '1', IconAtlas = 'CENW_PI_ATLAS'  WHERE Type = 'UNIT_EARLY_DESTROYER';
UPDATE Units SET PortraitIndex = '0', IconAtlas = 'CENW_PI_ATLAS' WHERE Type = 'UNIT_ATTACK_SUBMARINE';
UPDATE Units SET PortraitIndex = '9', IconAtlas = 'CENW_PI_ATLAS' WHERE Type = 'UNIT_MISSILE_DESTROYER';
UPDATE Units SET PortraitIndex = '5', IconAtlas = 'CENW_PI_ATLAS' WHERE Type = 'UNIT_SUPERCARRIER';

UPDATE Units SET PrereqTech = 'TECH_INTERNET' WHERE Type = 'UNIT_MISSILE_DESTROYER';
UPDATE Units SET PrereqTech = 'TECH_LASERS' WHERE Type = 'UNIT_GUIDED_MISSILE';
UPDATE Units SET PrereqTech = 'TECH_LASERS' WHERE Type = 'UNIT_MISSILE_CRUISER';
UPDATE Units SET PrereqTech = 'TECH_STEALTH' WHERE Type = 'UNIT_JET_FIGHTER';
UPDATE Units SET PrereqTech = 'TECH_LASERS', FaithCost = 1800 WHERE Type = 'UNIT_SUPERCARRIER' ;

UPDATE Units SET PrereqTech = 'TECH_PARTICLE_PHYSICS' WHERE Type = 'UNIT_NUCLEAR_MISSILE' AND NOT EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_DRONE_FIGHTER_2');
UPDATE Units SET PrereqTech = 'TECH_NANOTECHNOLOGY', FaithCost = 2000 WHERE Type = 'UNIT_MECH' AND NOT EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_DRONE_FIGHTER_2');
UPDATE Units SET PrereqTech = 'TECH_NUCLEAR_FUSION', FaithCost = 2000 WHERE Type = 'UNIT_STEALTH_BOMBER' AND NOT EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_DRONE_FIGHTER_2');

----- New obsolescence rules
--UPDATE Units SET ObsoleteTech = 'TECH_LASERS' WHERE Type = 'UNIT_FIGHTER'; -- Jet Fighter (Oil SR) is never obsolete
--UPDATE Units SET ObsoleteTech = 'TECH_STEALTH' WHERE Type = 'UNIT_BOMBER'; -- Jet Bomber (Oil SR) is never obsolete
--UPDATE Units SET ObsoleteTech = 'TECH_GLOBALIZATION' WHERE Type = 'UNIT_JET_FIGHTER'; -- Advanced Fighter (Alu SR) is superior tan Stealth Fighter
UPDATE Units SET ObsoleteTech = 'TECH_STEALTH' WHERE Type = 'UNIT_AMERICAN_B17'; -- B-52 is never obsolete
UPDATE Units SET ObsoleteTech = 'TECH_LASERS' WHERE Type = 'UNIT_JAPANESE_ZERO'; -- MiG-29 is never obsolete

----- Technology_Flavors
UPDATE Technology_Flavors SET Flavor = 20 WHERE TechType = 'TECH_INTERNET' AND FlavorType = 'FLAVOR_NAVAL'; -- was 10   -- MISSILE_DESTROYER
UPDATE Technology_Flavors SET Flavor = 20 WHERE TechType = 'TECH_LASERS' AND FlavorType = 'FLAVOR_NAVAL'; -- was 10   -- MISSILE_CRUISER
UPDATE Technology_Flavors SET Flavor = 0 WHERE TechType = 'TECH_STEALTH' AND FlavorType = 'FLAVOR_NAVAL'; -- was 10   -- MISSILE_DESTROYER move to Ineternet
UPDATE Technology_Flavors SET Flavor = 20 WHERE TechType = 'TECH_STEALTH' AND FlavorType = 'FLAVOR_AIR'; -- was 10   -- JETBOMB
UPDATE Technology_Flavors SET Flavor = 10 WHERE TechType = 'TECH_STEALTH' AND FlavorType = 'FLAVOR_OFFENSE'; -- was 5

INSERT INTO Technology_Flavors
	(TechType, FlavorType, Flavor)
VALUES
	('TECH_ATOMIC_THEORY', 'FLAVOR_AIR', 20),             -- EARLYMONOPLAN and _LIGHTBOMBER
	('TECH_ATOMIC_THEORY', 'FLAVOR_OFFENSE', 10),
	
	('TECH_SATELLITES', 'FLAVOR_AIR',     20),               -- JET27 
	('TECH_SATELLITES', 'FLAVOR_OFFENSE', 10),

	('TECH_ADVANCED_BALLISTICS', 'FLAVOR_OFFENSE', 10),               -- STRA BOMB
	('TECH_ADVANCED_BALLISTICS', 'FLAVOR_AIR',     20),                
		
	('TECH_STEALTH', 'FLAVOR_OFFENSE', 10);               -- JET_FIGHTER

--==========================================================================================================================	
-- Compatibility Patch
--==========================================================================================================================
UPDATE Units SET PrereqTech = 'TECH_NANOTECHNOLOGY', FaithCost = 2000 WHERE Type = 'UNIT_ADVJET' AND EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_DRONE_FIGHTER_2');
UPDATE Units SET PrereqTech = 'TECH_NANOTECHNOLOGY', FaithCost = 2000 WHERE Type = 'UNIT_STEALTH_BOMBER' AND EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_DRONE_FIGHTER_2');
UPDATE Units SET ObsoleteTech = 'TECH_FUTURE_BALLISTICS' WHERE Type = 'UNIT_ADVJET' AND EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_DRONE_FIGHTER_2');

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_FW_DRONE_FIGHTER_2'
WHERE UnitType = 'UNIT_ADVJET'
  AND EXISTS (
      SELECT 1 FROM UnitClasses
      WHERE Type = 'UNITCLASS_FW_DRONE_FIGHTER_2'
  );

INSERT OR IGNORE INTO Unit_ClassUpgrades (UnitType, UnitClassType)
SELECT 'UNIT_ADVJET', 'UNITCLASS_FW_DRONE_FIGHTER_2'
WHERE EXISTS (
    SELECT 1 FROM UnitClasses
    WHERE Type = 'UNITCLASS_FW_DRONE_FIGHTER_2'
);


UPDATE Units
SET Special = 'SPECIALUNIT_AIRBASE'
WHERE Type IN (
    'UNIT_FW_SUBORBITAL_BOMBER'
);

UPDATE Units SET Range = 36 WHERE Type = 'UNIT_FW_SUBORBITAL_BOMBER'; 


