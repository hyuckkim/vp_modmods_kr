--==========================================================================================================================	
-- UNIT CLASSES
--==========================================================================================================================			
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO UnitClasses 	
		(Type,								DefaultUnit,			Description)
VALUES	('UNITCLASS_JFD_GAESATAE',			'UNIT_JFD_GAESATAE',	'TXT_KEY_UNIT_JFD_GAESATAE'),	
		('UNITCLASS_JFD_HESSIAN',			'UNIT_JFD_HESSIAN',		'TXT_KEY_UNIT_JFD_HESSIAN'),	
		('UNITCLASS_JFD_NOTIFICATION',		null,					null),
		('UNITCLASS_JFD_POTSDAM_GIANT',		'UNIT_JFD_HESSIAN',		'TXT_KEY_UNIT_JFD_POTSDAM_GIANT');
		
INSERT INTO UnitClasses 	
		(Type,								DefaultUnit,			Description)
SELECT	'UNITCLASS_JFD_BLACK_RIDER',		'UNIT_JFD_BLACK_RIDER',	'TXT_KEY_UNIT_JFD_BLACK_RIDER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_ADDITIONS_BLACK_RIDERS' AND Value = 1);

INSERT INTO UnitClasses 	
		(Type,								DefaultUnit,			Description)
SELECT	'UNITCLASS_JFD_VARANGIAN',			'UNIT_JFD_VARANGIAN',	'TXT_KEY_UNIT_JFD_VARANGIAN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_ADDITIONS_VARANGIAN' AND Value = 1);	
		
UPDATE UnitClasses
SET DefaultUnit = 'UNIT_GALLEY'
WHERE Type = 'UNITCLASS_GALLEY';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_ANTI_AIRCRAFT_GUN'
WHERE Type = 'UNITCLASS_ANTI_AIRCRAFT_GUN';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_AT_GUN'
WHERE Type = 'UNITCLASS_ANTI_TANK_GUN';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_ATOMIC_BOMB'
WHERE Type = 'UNITCLASS_ATOMIC_BOMB';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_CHARIOT_ARCHER'
WHERE Type = 'UNITCLASS_CHARIOT_ARCHER';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_HELICOPTER_GUNSHIP'
WHERE Type = 'UNITCLASS_HELICOPTER_GUNSHIP';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_HORSEMAN'
WHERE Type = 'UNITCLASS_HORSEMAN';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_LANCER'
WHERE Type = 'UNITCLASS_LANCER';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_LONGSWORDSMAN'
WHERE Type = 'UNITCLASS_LONGSWORDSMAN';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_ROCKET_ARTILLERY'
WHERE Type = 'UNITCLASS_ROCKET_ARTILLERY';

UPDATE UnitClasses
SET Description = 'TXT_KEY_CIV5_KOREA_TURTLESHIP_HEADING'
WHERE Type = 'UNITCLASS_KOREAN_TURTLE_SHIP';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_MONGOL_KESHIK'
WHERE Type = 'UNITCLASS_MOUNTED_BOWMAN';
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 								Class,								ShowInPedia, 	Cost,	FaithCost,	Description, 								PortraitIndex,	IconAtlas)									
VALUES	('UNIT_JFD_CONTRACT_NOTIFICATION',	'UNITCLASS_JFD_NOTIFICATION',		0,				-1,		-1,			'TXT_KEY_UNIT_JFD_CONTRACT_NOTIFICATION',	0,				'JFD_POUAKAI_MERCENARY_NOTIFICATION_ATLAS'); 

INSERT INTO Units 	
		(Type, 						JFD_OnlyMercenary, Class,						Combat,		PolicyType,			 Cost,		FaithCost,		PrereqTech,			RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Strategy, 									Help, 									Civilopedia,							MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_BLACK_RIDER', 	1,				   'UNITCLASS_JFD_BLACK_RIDER', 23,			'POLICY_TRADE_UNIONS', Cost+50,	FaithCost+100,	'TECH_METALLURGY',	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_BLACK_RIDER', 	'TXT_KEY_UNIT_JFD_BLACK_RIDER_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_BLACK_RIDER',	'TXT_KEY_CIV5_JFD_BLACK_RIDER_TEXT',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_BLACK_RIDER',	0,					'JFD_BLACK_RIDER_FLAG_ART_ATLAS',	3, 				'JFD_POUAKAI_MERCENARY_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_CAVALRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_ADDITIONS_BLACK_RIDERS' AND Value = 1);

INSERT INTO Units 		
		(Type, 						JFD_OnlyMercenary, Class,					 PolicyType,			 Combat,	Cost,	 FaithCost,		PrereqTech,			RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Strategy, 								Help, 								Civilopedia,						MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_GAESATAE', 		1,				   'UNITCLASS_JFD_GAESATAE', 'POLICY_TRADE_UNIONS',  Combat+2,	Cost+20, FaithCost+40,	'TECH_CURRENCY',	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_GAESATAE', 	'TXT_KEY_UNIT_JFD_GAESATAE_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_GAESATAE',	'TXT_KEY_CIV5_JFD_GAESATAE_TEXT',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_GAESATAE',	0,					'JFD_GAESATAE_FLAG_ART_ATLAS',	0, 				'JFD_POUAKAI_MERCENARY_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_SPEARMAN';

INSERT INTO Units 	
		(Type, 						JFD_OnlyMercenary, Class,					PolicyType,				 Combat, Cost, FaithCost, PrereqTech,		RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Strategy, 								Help, 								Civilopedia,						MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_HESSIAN', 		1,				   'UNITCLASS_JFD_HESSIAN', 'POLICY_TRADE_UNIONS',	 Combat, Cost, FaithCost, 'TECH_RIFLING',	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_HESSIAN', 	'TXT_KEY_UNIT_JFD_HESSIAN_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_HESSIAN',	'TXT_KEY_CIV5_JFD_HESSIAN_TEXT',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_HESSIAN',	0,					'JFD_HESSIAN_FLAG_ART_ATLAS',	1, 				'JFD_POUAKAI_MERCENARY_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_RIFLEMAN';

INSERT INTO Units 	
		(Type, 						JFD_OnlyMercenary, Class,						  PolicyType,			 Combat, Cost, FaithCost,	PrereqTech,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Strategy, 									Help, 									Civilopedia,							MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_POTSDAM_GIANT', 	1,				   'UNITCLASS_JFD_POTSDAM_GIANT', 'POLICY_TRADE_UNIONS', Combat, Cost, FaithCost,	PrereqTech,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_POTSDAM_GIANT', 	'TXT_KEY_UNIT_JFD_POTSDAM_GIANT_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_POTSDAM_GIANT',	'TXT_KEY_CIV5_JFD_POTSDAM_GIANT_TEXT',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_POTSDAM_GIANT',	UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas
FROM Units WHERE Type = 'UNIT_JFD_HESSIAN';

INSERT INTO Units 	
		(Type, 						JFD_OnlyMercenary, Class,						PolicyType,			 Combat,		Cost,	 FaithCost,		PrereqTech,				RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Strategy, 								Help, 								Civilopedia,						MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_VARANGIAN', 		1,				   'UNITCLASS_JFD_VARANGIAN',	'POLICY_TRADE_UNIONS', Combat-4,	Cost+20, FaithCost+40,	'TECH_IRON_WORKING',	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_VARANGIAN', 	'TXT_KEY_UNIT_JFD_VARANGIAN_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_VARANGIAN',	'TXT_KEY_CIV5_JFD_VARANGIAN_TEXT',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_VARANGIAN',	0,					'JFD_VARANGIAN_FLAG_ART_ATLAS',	2, 				'JFD_POUAKAI_MERCENARY_UNIT_ATLAS'
FROM Units WHERE Type = 'UNIT_SWORDSMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_ADDITIONS_VARANGIAN' AND Value = 1);	

-- Buccaneer
UPDATE Units
SET JFD_OnlyMercenary = 1, Help = 'TXT_KEY_UNIT_JFD_HELP_BUCCANEER'
WHERE Type = 'UNIT_LS_BUCCANEER_NAVAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_CHANGES_PRIVATEER' AND Value = 1);

-- Corsair
UPDATE Units
SET JFD_OnlyMercenary = 1, Help = 'TXT_KEY_UNIT_JFD_HELP_BUCCANEER_CORSAIR'
WHERE Type = 'UNIT_BUCCANEER_CORSAIR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_CHANGES_PRIVATEER' AND Value = 1);

-- Foreign Legion
UPDATE Units
SET Combat = 50, JFD_OnlyMercenary = 1, MoveAfterPurchase = 0, Help = 'TXT_KEY_UNIT_JFD_HELP_FRENCH_FOREIGNLEGION', Strategy = 'TXT_KEY_UNIT_JFD_FRENCH_FOREIGNLEGION_STRATEGY'
WHERE Type = 'UNIT_FRENCH_FOREIGNLEGION';

-- Galley
UPDATE Units
SET JFD_OnlyMercenary = 1
WHERE Type = 'UNIT_GALLEY';

-- Great Recon Units
UPDATE Units
SET JFD_CannnotBeMercenary = 1
WHERE Class IN ('UNITCLASS_JFD_GREAT_SCOUT', 'UNITCLASS_JFD_GREAT_ADVENTURER', 'UNITCLASS_JFD_GREAT_EXPLORER', 'UNITCLASS_JFD_GREAT_AIRSHIP');

-- Landsneckht
UPDATE Units
SET JFD_OnlyMercenary = 1, MoveAfterPurchase = 0, Help = 'TXT_KEY_UNIT_JFD_HELP_GERMAN_LANDSKNECHT', Strategy = 'TXT_KEY_UNIT_JFD_GERMAN_LANDSKNECHT_STRATEGY'
WHERE Type = 'UNIT_GERMAN_LANDSKNECHT';

-- Hessian/Potsdam Giant
UPDATE Units
SET PrereqTech = 'TECH_EE_FLINTLOCK', Combat = 30, Cost = 185
WHERE Type IN ('UNIT_JFD_HESSIAN', 'UNIT_JFD_POTSDAM_GIANT')
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

-- Privateer
UPDATE Units
SET JFD_OnlyMercenary = 1, Help = 'TXT_KEY_UNIT_JFD_HELP_PRIVATEER', Strategy = 'TXT_KEY_UNIT_JFD_PRIVATEER_STRATEGY'
WHERE Type = 'UNIT_PRIVATEER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_CHANGES_PRIVATEER' AND Value = 1);

-- Sea Beggar
UPDATE Units
SET JFD_OnlyMercenary = 1, Help = 'TXT_KEY_UNIT_JFD_HELP_DUTCH_SEA_BEGGAR', Strategy = 'TXT_KEY_UNIT_JFD_DUTCH_SEA_BEGGAR_STRATEGY'
WHERE Type = 'UNIT_DUTCH_SEA_BEGGAR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_CHANGES_PRIVATEER' AND Value = 1);

-- Gold Purchasing
UPDATE Units
SET HurryCostModifier= -1
WHERE HurryCostModifier != -1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_NO_GOLD_PURCHASING' AND Value = 1);

CREATE TRIGGER JFDMercenaries_Units
AFTER INSERT ON Units 
WHEN NEW.HurryCostModifier != -1
BEGIN
	UPDATE Units
	SET HurryCostModifier= -1
	WHERE Type = NEW.Type
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_NO_GOLD_PURCHASING' AND Value = 1);
END;
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_BLACK_RIDER', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CAVALRY';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_GAESATAE', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WARRIOR';
	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_HESSIAN', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_POTSDAM_GIANT', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_VARANGIAN', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SWORDSMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_ADDITIONS_VARANGIAN' AND Value = 1);	
--------------------------------		
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_BLACK_RIDER',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CAVALRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_ADDITIONS_BLACK_RIDERS' AND Value = 1);

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_GAESATAE',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WARRIOR';		
	
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_HESSIAN',			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';	

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_POTSDAM_GIANT',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';	

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_VARANGIAN',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SWORDSMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_ADDITIONS_VARANGIAN' AND Value = 1);	
--------------------------------	
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_BLACK_RIDER', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CAVALRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_ADDITIONS_BLACK_RIDERS' AND Value = 1);
	
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_GAESATAE', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_HESSIAN', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WARRIOR';	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_POTSDAM_GIANT', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_VARANGIAN', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SWORDSMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_ADDITIONS_VARANGIAN' AND Value = 1);	
--------------------------------
-- Unit_FreePromotions
--------------------------------	
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_FRENCH_FOREIGNLEGION' AND PromotionType = 'PROMOTION_DOUBLE_PLUNDER';
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT' AND PromotionType = 'PROMOTION_DOUBLE_PLUNDER';
DELETE FROM Unit_FreePromotions WHERE UnitType IN ('UNIT_PRIVATEER', 'UNIT_DUTCH_SEA_BEGGAR', 'UNIT_BUCCANEER_CORSAIR') AND PromotionType = 'PROMOTION_PRIZE_SHIPS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_CHANGES_PRIVATEER' AND Value = 1);
DELETE FROM Unit_FreePromotions WHERE UnitType IN ('UNIT_PRIVATEER') AND PromotionType = 'PROMOTION_COASTAL_RAIDER_1'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_CHANGES_PRIVATEER' AND Value = 1);

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_BLACK_RIDER',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CAVALRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_ADDITIONS_BLACK_RIDERS' AND Value = 1);

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_GAESATAE',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_HESSIAN',			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_FRENCH_FOREIGNLEGION',PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_POTSDAM_GIANT',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_VARANGIAN',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SWORDSMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_ADDITIONS_VARANGIAN' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Unit_ClassUpgrades WHERE UnitType IN ('UNIT_BUCCANEER_CORSAIR', 'UNIT_PRIVATEER', 'UNIT_DUTCH_SEA_BEGGAR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_UNITS_CHANGES_PRIVATEER' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================