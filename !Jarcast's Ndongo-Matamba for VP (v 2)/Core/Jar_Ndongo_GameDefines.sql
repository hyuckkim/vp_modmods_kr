--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
-------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES ('EVENTS_GREAT_PEOPLE', 1),('EVENTS_MINORS', 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 						DefaultBuilding, 		Description,					NoLimit)
VALUES	('BUILDINGCLASS_JAR_NDONGO','BUILDING_JAR_NDONGO',	'TXT_KEY_BUILDING_JAR_NDONGO',	1),
		('BUILDINGCLASS_JAR_NDUMMY','BUILDING_JAR_NDUMMY',	'TXT_KEY_BUILDING_JAR_NDUMMY',	1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Buildings
(Type, 						 	BuildingClass, 				IsDummy,	Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	MinAreaSize,	Description) VALUES	
('BUILDING_JAR_NDONGO', 		'BUILDINGCLASS_JAR_NDONGO',		1,		-1,		-1,			-1,				null,		-1,				'TXT_KEY_BUILDING_JAR_NDONGO'),
('BUILDING_JAR_NDUMMY', 		'BUILDINGCLASS_JAR_NDUMMY',		1,		-1,		-1,			-1,				null,		-1,				'TXT_KEY_BUILDING_JAR_NDUMMY');
UPDATE Buildings SET Defense = 200 WHERE TYPE = 'BUILDING_JAR_NDONGO';
------------------------------
-- Building_YieldChanges
------------------------------
INSERT INTO Building_YieldChanges 	
		(BuildingType, 			YieldType,	Yield)
SELECT	'BUILDING_JAR_NDONGO',	Type,		2 FROM Yields WHERE Type IN ('YIELD_CULTURE', 'YIELD_PRODUCTION');
--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds		
		(Type,				PrereqTech,	ImprovementType, 			Description, 								Help, 											Recommendation, 							Time, EntityEvent, 			OrderPriority, 	IconIndex, 	IconAtlas)
SELECT 	'BUILD_JAR_KILOMBO',PrereqTech,	'IMPROVEMENT_JAR_KILOMBO',	'TXT_KEY_BUILD_IMPROVEMENT_JAR_KILOMBO',	'TXT_KEY_BUILD_IMPROVEMENT_JAR_KILOMBO_HELP',	'TXT_KEY_BUILD_IMPROVEMENT_JAR_KILOMBO_REC',Time, 'ENTITY_EVENT_BUILD',	95,				7,			'JAR_NDONGO_ICON_ATLAS'
FROM Builds WHERE Type='BUILD_TRADING_POST';

INSERT INTO Builds		
		(Type,				PrereqTech,	ImprovementType, 			Description, 								Help, 	Recommendation,	Kill, EntityEvent, 	OrderPriority, 	IconIndex, 	IconAtlas)
SELECT 	'BUILD_JAR_MAKUNZE',PrereqTech,	'IMPROVEMENT_JAR_MAKUNZE',	'TXT_KEY_BUILD_IMPROVEMENT_JAR_MAKUNZE',	Help, 	Recommendation,	Kill, EntityEvent, 	OrderPriority,	10,			'JAR_NDONGO_ICON_ATLAS'
FROM Builds WHERE Type='BUILD_EMBASSY';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Unit_Builds	
		(UnitType, 	BuildType)
SELECT 	 Type,		'BUILD_JAR_KILOMBO' FROM Units WHERE Class='UNITCLASS_WORKER';
--------------------------------------------------------------------------------------------------------------------------
-- BuildFeatures
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildFeatures	
		(BuildType, 			FeatureType, 	Remove)
SELECT	'BUILD_JAR_MAKUNZE',	FeatureType, 	Remove FROM BuildFeatures WHERE BuildType='BUILD_EMBASSY' UNION ALL
SELECT	'BUILD_JAR_KILOMBO',	'FEATURE_FOREST',  	0  UNION ALL
SELECT	'BUILD_JAR_KILOMBO',	'FEATURE_JUNGLE', 	0;
--==========================================================================================================================
-- Improvements
--==========================================================================================================================
-- Improvements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvements
		(Type,						Description,						Civilopedia, 							Help,									ArtDefineTag,					SpecificCivRequired,	CivilizationType,		PillageGold, Permanent,	NoTwoAdjacent,	NoFollowUp,	DefenseModifier,	IconAtlas,				PortraitIndex)
VALUES	('IMPROVEMENT_JAR_KILOMBO',	'TXT_KEY_IMPROVEMENT_JAR_KILOMBO',	'TXT_KEY_IMPROVEMENT_JAR_KILOMBO_TEXT',	'TXT_KEY_IMPROVEMENT_JAR_KILOMBO_HELP',	'ART_DEF_IMPROVEMENT_JAR_KILOMBO',	1,					'CIVILIZATION_JAR_NDONGO',	20,				0,			1,		1,			50,					'JAR_NDONGO_ICON_ATLAS',	3);
UPDATE Improvements SET UnitFreePromotion='PROMOTION_JAR_KILOMBO', MakesPassable = 1, UnitPlotExperience=1, GrantsVisionXTiles = 2 WHERE Type = 'IMPROVEMENT_JAR_KILOMBO';

INSERT INTO Improvements
		(Type,						Description,				Civilopedia, 							Help,									ArtDefineTag,						OnlyCityStateTerritory, IsEmbassy, ImprovementLeagueVotes, CreatedByGreatPerson, BuildableOnResources, ConnectsAllResources,	PillageGold, Permanent,	IconAtlas,				PortraitIndex)
SELECT	'IMPROVEMENT_JAR_MAKUNZE',	'TXT_KEY_UNIT_JAR_MAKUNZE',	'TXT_KEY_IMPROVEMENT_JAR_MAKUNZE_TEXT',	'TXT_KEY_IMPROVEMENT_JAR_MAKUNZE_HELP',	'ART_DEF_IMPROVEMENT_JAR_MAKUNZE',	OnlyCityStateTerritory, IsEmbassy, ImprovementLeagueVotes, CreatedByGreatPerson, BuildableOnResources, ConnectsAllResources,	PillageGold, Permanent,	'JAR_NDONGO_ICON_ATLAS',	9
FROM Improvements WHERE Type='IMPROVEMENT_EMBASSY';
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ValidTerrains
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidTerrains 	
		(ImprovementType,			TerrainType)
SELECT	'IMPROVEMENT_JAR_KILOMBO',	TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_FORT';

INSERT INTO Improvement_ValidTerrains 	
		(ImprovementType,			TerrainType)
SELECT	'IMPROVEMENT_JAR_MAKUNZE',	TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_EMBASSY';
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_Yields
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType, 			YieldType, Yield)
SELECT	'IMPROVEMENT_JAR_KILOMBO',	YieldType, Yield FROM Improvement_Yields WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST' UNION ALL
SELECT	'IMPROVEMENT_JAR_MAKUNZE',	YieldType, Yield FROM Improvement_Yields WHERE ImprovementType = 'IMPROVEMENT_EMBASSY';

INSERT INTO Improvement_Yields 	
		(ImprovementType, 			YieldType,					Yield)
VALUES	('IMPROVEMENT_JAR_KILOMBO',	'YIELD_FOOD',					1),
		('IMPROVEMENT_JAR_KILOMBO',	'YIELD_GREAT_GENERAL_POINTS',	1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_TechYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,			TechType,	YieldType,	Yield)
SELECT	'IMPROVEMENT_JAR_MAKUNZE',	TechType,	YieldType,	Yield FROM Improvement_TechYieldChanges WHERE ImprovementType='IMPROVEMENT_EMBASSY' UNION ALL
SELECT	'IMPROVEMENT_JAR_KILOMBO',	'TECH_FERTILIZER',			'YIELD_FOOD',		1 UNION ALL
SELECT	'IMPROVEMENT_JAR_KILOMBO',	'TECH_CHEMISTRY',			'YIELD_CULTURE_LOCAL', 2 UNION ALL
SELECT	'IMPROVEMENT_JAR_KILOMBO',	'TECH_INDUSTRIALIZATION',	'YIELD_PRODUCTION',	1 UNION ALL
SELECT	'IMPROVEMENT_JAR_KILOMBO',	'TECH_MILITARY_SCIENCE',	'YIELD_SCIENCE',	1 UNION ALL
SELECT	'IMPROVEMENT_JAR_KILOMBO',	'TECH_RADIO',				'YIELD_CULTURE',	1;
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_YieldPerXAdjacentImprovement
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_YieldPerXAdjacentImprovement
		(ImprovementType, 			OtherImprovementType,	YieldType, 						Yield, NumRequired)
SELECT	'IMPROVEMENT_JAR_KILOMBO', 	'IMPROVEMENT_CITADEL',	'YIELD_GOLD', 					1, 		1 UNION ALL
SELECT	'IMPROVEMENT_JAR_KILOMBO', 	'IMPROVEMENT_CITADEL',	'YIELD_GREAT_GENERAL_POINTS', 	1, 		1 ;
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_RouteYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_RouteYieldChanges
		(ImprovementType, 		 	RouteType, YieldType, Yield)
SELECT 	'IMPROVEMENT_JAR_KILOMBO', 	RouteType, YieldType, Yield
FROM Improvement_RouteYieldChanges WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST';
--------------------------------------------------------------------------------------------------------------------------
-- Policy_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,			YieldType,			Yield)
SELECT	 PolicyType,	'IMPROVEMENT_JAR_KILOMBO',	YieldType,			Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType IN ('IMPROVEMENT_FORT', 'IMPROVEMENT_TRADING_POST','IMPROVEMENT_MOAI');
--------------------------------------------------------------------------------------------------------------------------
-- Belief_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 			YieldType, Yield)
SELECT	 BeliefType,	'IMPROVEMENT_JAR_KILOMBO',	YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType IN ('IMPROVEMENT_FORT', 'IMPROVEMENT_TRADING_POST','IMPROVEMENT_MOAI');
--------------------------------------------------------------------------------------------------------------------------
-- Building_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ImprovementYieldChanges
		(BuildingType,	ImprovementType,			YieldType,	Yield) 
SELECT	BuildingType,	'IMPROVEMENT_JAR_KILOMBO',	YieldType,	Yield
FROM Building_ImprovementYieldChanges WHERE ImprovementType IN ('IMPROVEMENT_FORT', 'IMPROVEMENT_TRADING_POST');
--------------------------------------------------------------------------------------------------------------------------
-- Building_ImprovementYieldChangesGlobal
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ImprovementYieldChangesGlobal
		(BuildingType,	ImprovementType,			YieldType,	Yield) 
SELECT	BuildingType,	'IMPROVEMENT_JAR_KILOMBO',	YieldType,	Yield
FROM Building_ImprovementYieldChangesGlobal WHERE ImprovementType IN ('IMPROVEMENT_FORT', 'IMPROVEMENT_TRADING_POST');
--------------------------------------------------------------------------------------------------------------------------
-- SQL TRIGGERS
--------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER IF NOT EXISTS JarKilombo01 AFTER INSERT ON Policy_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_TRADING_POST' OR NEW.ImprovementType = 'IMPROVEMENT_FORT' OR NEW.ImprovementType = 'IMPROVEMENT_MOAI'
BEGIN
	INSERT INTO Policy_ImprovementYieldChanges
					(PolicyType,	ImprovementType,			YieldType,			Yield)
	SELECT DISTINCT	 NEW.PolicyType,'IMPROVEMENT_JAR_KILOMBO',	NEW.YieldType,	NEW.Yield;
END;
--
CREATE TRIGGER IF NOT EXISTS JarKilombo02 AFTER INSERT ON Belief_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_TRADING_POST' OR NEW.ImprovementType = 'IMPROVEMENT_FORT' OR NEW.ImprovementType = 'IMPROVEMENT_MOAI'
BEGIN
	INSERT INTO Belief_ImprovementYieldChanges
					(BeliefType,	ImprovementType,			YieldType,			Yield)
	SELECT DISTINCT	 NEW.BeliefType,'IMPROVEMENT_JAR_KILOMBO',	NEW.YieldType,	NEW.Yield;
END;
--
CREATE TRIGGER IF NOT EXISTS JarKilombo03 AFTER INSERT ON Building_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_TRADING_POST' OR NEW.ImprovementType = 'IMPROVEMENT_FORT'
BEGIN
	INSERT INTO Building_ImprovementYieldChanges
					(BuildingType,	ImprovementType,			YieldType,			Yield)
	SELECT DISTINCT	 NEW.BuildingType,'IMPROVEMENT_JAR_KILOMBO',	NEW.YieldType,	NEW.Yield;
END;
--
CREATE TRIGGER IF NOT EXISTS JarKilombo04 AFTER INSERT ON Building_ImprovementYieldChangesGlobal
WHEN NEW.ImprovementType = 'IMPROVEMENT_TRADING_POST' OR NEW.ImprovementType = 'IMPROVEMENT_FORT'
BEGIN
	INSERT INTO Building_ImprovementYieldChangesGlobal
					(BuildingType,	ImprovementType,			YieldType,			Yield)
	SELECT DISTINCT	 NEW.BuildingType,'IMPROVEMENT_JAR_KILOMBO',	NEW.YieldType,	NEW.Yield;
END;
--==========================================================================================================================
-- UNITPROMOTIONS
--==========================================================================================================================
INSERT INTO UnitPromotions 
(Type, 						Description, 						Help, 									Sound, 				LostWithUpgrade, OrderPriority, CannotBeChosen,	PortraitIndex, 	IconAtlas,				PediaType, 			PediaEntry) VALUES
('PROMOTION_JAR_KILOMBO',	'TXT_KEY_PROMOTION_JAR_KILOMBO',	'TXT_KEY_PROMOTION_JAR_KILOMBO_HELP',	'AS2D_IF_LEVELUP',	1,				 0, 			1,				0, 			'JAR_NDONGO_PROMO_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_KILOMBO'),
('PROMOTION_JAR_POMBO',		'TXT_KEY_PROMOTION_JAR_POMBO',		'TXT_KEY_PROMOTION_JAR_POMBO_HELP',		'AS2D_IF_LEVELUP',	0,				 0, 			1,				1, 			'JAR_NDONGO_PROMO_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_POMBO'),
('PROMOTION_JAR_IMBARE',	'TXT_KEY_PROMOTION_JAR_IMBARE',		'TXT_KEY_PROMOTION_JAR_IMBARE_HELP',	'AS2D_IF_LEVELUP',	0,				 0, 			1,				2, 			'JAR_NDONGO_PROMO_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_IMBARE');

UPDATE UnitPromotions SET AlwaysHeal= 1, FightWellDamaged= 1, IsLostOnMove=1 WHERE Type = 'PROMOTION_JAR_KILOMBO';
UPDATE UnitPromotions SET AttackWoundedMod = 33 WHERE Type = 'PROMOTION_JAR_POMBO';
UPDATE UnitPromotions SET RangedDefenseMod = 15, ExtraWithdrawal= 100 WHERE Type = 'PROMOTION_JAR_IMBARE';

INSERT INTO UnitPromotions 
		(Type, 					Description, 					 Help, 									Sound, 			LostWithUpgrade, OrderPriority, CannotBeChosen,	PortraitIndex, 	IconAtlas,				PediaType, 			PediaEntry)
VALUES	('PROMOTION_UA_NDONGO',	'TXT_KEY_PROMOTION_UA_NDONGO',	 'TXT_KEY_PROMOTION_UA_NDONGO_HELP',	'AS2D_IF_LEVELUP',	0,				 0, 					1,				17, 'promoVP_atlas_02', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_UA_NDONGO');
UPDATE UnitPromotions SET FriendlyLandsModifier = 20, NearbyCityCombatMod = 10, NearbyRange = 1 WHERE Type='PROMOTION_UA_NDONGO';
------------------------------	
-- UnitPromotions_UnitCombats
------------------------------		
INSERT INTO UnitPromotions_UnitCombats  	
(PromotionType, 			UnitCombatType) VALUES
('PROMOTION_JAR_KILOMBO',	'UNITCOMBAT_MELEE'),
('PROMOTION_JAR_KILOMBO',	'UNITCOMBAT_GUN'),
('PROMOTION_JAR_KILOMBO',	'UNITCOMBAT_RECON'),
('PROMOTION_JAR_KILOMBO',	'UNITCOMBAT_MOUNTED'),
('PROMOTION_JAR_KILOMBO',	'UNITCOMBAT_ARMOR'),
('PROMOTION_JAR_KILOMBO',	'UNITCOMBAT_ARCHER'),
('PROMOTION_JAR_KILOMBO',	'UNITCOMBAT_SIEGE');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 				Class,	CombatClass, Cost, PrereqTech,				Combat,   RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, PurchaseOnly, PurchaseCooldown,	GlobalFaithPurchaseCooldown,	MoveAfterPurchase,CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 				Help, 						  	Strategy, 							Civilopedia, 					ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 				UnitFlagAtlas, 				UnitFlagIconOffset,		IconAtlas,				PortraitIndex)
SELECT	'UNIT_JAR_POMBO',	Class,	CombatClass, Cost, 'TECH_CIVIL_SERVICE',	Combat+4, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, PurchaseOnly, PurchaseCooldown,	GlobalFaithPurchaseCooldown,	MoveAfterPurchase,CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JAR_POMBO', 'TXT_KEY_UNIT_JAR_POMBO_HELP',	'TXT_KEY_UNIT_JAR_POMBO_STRATEGY',	'TXT_KEY_UNIT_JAR_POMBO_TEXT',	ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JAR_POMBO',	'JAR_NDONGO_FLAG_POMBO',	0,						'JAR_NDONGO_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_EXPLORER';
UPDATE Unit_BuildingClassPurchaseRequireds SET BuildingClassType='BUILDINGCLASS_BARRACKS' WHERE UnitType='UNIT_JAR_POMBO';

INSERT INTO Units 	
		(Type, 				Class,	CombatClass, 		Cost, PrereqTech,	Combat,   RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, PurchaseOnly, PurchaseCooldown,	GlobalFaithPurchaseCooldown,	MoveAfterPurchase,CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 				Help, 						  	Strategy, 							Civilopedia, 					ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 				UnitFlagAtlas, 				UnitFlagIconOffset,		IconAtlas,				PortraitIndex)
SELECT	'UNIT_JAR_IMBARE',	Class,	'UNITCOMBAT_MELEE', Cost, PrereqTech,	Combat+2, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, PurchaseOnly, PurchaseCooldown,	GlobalFaithPurchaseCooldown,	MoveAfterPurchase,CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JAR_IMBARE', 'TXT_KEY_UNIT_JAR_IMBARE_HELP',	'TXT_KEY_UNIT_JAR_IMBARE_STRATEGY',	'TXT_KEY_UNIT_JAR_IMBARE_TEXT',	ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JAR_IMBARE',	'JAR_NDONGO_FLAG_IMBARE',	0,						'JAR_NDONGO_ICON_ATLAS',	5
FROM Units WHERE Type = 'UNIT_SPANISH_TERCIO';

INSERT INTO Units 	
		(Type, 				PrereqTech, CivilianAttackPriority, Class, Cost, Moves, 	FaithCost, RequiresFaithPurchaseEnabled, Special, CombatLimit, Domain, DefaultUnitAI, BaseGold, Description, 					Civilopedia, 						Help, 								Strategy,								RestingPointChange, 	AdvancedStartCost, WorkRate, NumInfPerEra, BaseHurry, PurchaseCooldown, GlobalFaithPurchaseCooldown, BaseLandAirDefense, HurryMultiplier, Pillage, IgnoreBuildingDefense, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,				MoveRate,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JAR_MAKUNZE', PrereqTech, CivilianAttackPriority, Class, Cost, Moves+1, 	FaithCost, RequiresFaithPurchaseEnabled, Special, CombatLimit, Domain, DefaultUnitAI, BaseGold, ('TXT_KEY_UNIT_JAR_MAKUNZE'), ('TXT_KEY_UNIT_JAR_MAKUNZE_TEXT'), 	('TXT_KEY_UNIT_JAR_MAKUNZE_HELP'), 	('TXT_KEY_UNIT_JAR_MAKUNZE_STRATEGY'),	RestingPointChange, 	AdvancedStartCost, WorkRate, NumInfPerEra, BaseHurry, PurchaseCooldown, GlobalFaithPurchaseCooldown, BaseLandAirDefense, HurryMultiplier, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_JAR_MAKUNZE'),  	0,					'JAR_NDONGO_FLAG_MAKUNZE',	MoveRate,	6, 				'JAR_NDONGO_ICON_ATLAS'
FROM Units WHERE Type = 'UNIT_GREAT_DIPLOMAT';

INSERT INTO Units 	
		(Type,				Class, ShowInPedia, Cost, FaithCost, PurchaseCooldown,	GlobalFaithPurchaseCooldown, Moves, CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 			Civilopedia, Help, 							Strategy,AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation,	UnitArtInfo, UnitFlagIconOffset,	UnitFlagAtlas,				MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JAR_NGOLA',	Class, ShowInPedia, Cost, FaithCost, PurchaseCooldown,	GlobalFaithPurchaseCooldown, Moves, CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JAR_NGOLA',Civilopedia, 'TXT_KEY_UNIT_JAR_NGOLA_HELP', Strategy,AdvancedStartCost, WorkRate, CombatLimit, DontShowYields, 0,						'ART_DEF_UNIT_JAR_NGOLA',	0,		'JAR_NDONGO_FLAG_NGOLA',	MoveRate, 8, 				'JAR_NDONGO_ICON_ATLAS'
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JAR_POMBO',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_EXPLORER';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JAR_IMBARE',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ZULU_IMPI';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JAR_MAKUNZE', SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_DIPLOMAT';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JAR_NGOLA', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_JAR_POMBO',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_EXPLORER';

INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_JAR_IMBARE',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SPANISH_TERCIO';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JAR_MAKUNZE', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_DIPLOMAT';

INSERT INTO Unit_AITypes
		(UnitType, 			UnitAIType)
SELECT	'UNIT_JAR_NGOLA', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_JAR_POMBO',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_EXPLORER';

INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_JAR_IMBARE',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SPANISH_TERCIO';

INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_JAR_MAKUNZE',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_DIPLOMAT';

INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_JAR_NGOLA', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JAR_POMBO',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_EXPLORER';

UPDATE Units SET
ObsoleteTech = (select a.ObsoleteTech from Units a, Unit_ClassUpgrades b, UnitClasses c WHERE b.UnitType='UNIT_JAR_POMBO' and b.UnitClassType=c.Type and c.DefaultUnit=a.Type)
WHERE Type = 'UNIT_JAR_POMBO';

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JAR_IMBARE',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SPANISH_TERCIO';

UPDATE Units SET
ObsoleteTech = (select a.ObsoleteTech from Units a, Unit_ClassUpgrades b, UnitClasses c WHERE b.UnitType='UNIT_JAR_IMBARE' and b.UnitClassType=c.Type and c.DefaultUnit=a.Type)
WHERE Type = 'UNIT_JAR_IMBARE';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 	
		(UnitType, 			UniqueName, GreatWorkType)
SELECT	'UNIT_JAR_MAKUNZE', UniqueName, GreatWorkType
FROM Unit_UniqueNames WHERE UnitType = 'UNIT_GREAT_DIPLOMAT';

INSERT INTO Unit_UniqueNames 
		(UnitType, 			UniqueName)
VALUES	('UNIT_JAR_NGOLA', 	'TXT_KEY_GREAT_PERSON_JAR_NGOLA_01'),
		('UNIT_JAR_NGOLA', 	'TXT_KEY_GREAT_PERSON_JAR_NGOLA_02'),
		('UNIT_JAR_NGOLA', 	'TXT_KEY_GREAT_PERSON_JAR_NGOLA_03'),
		('UNIT_JAR_NGOLA', 	'TXT_KEY_GREAT_PERSON_JAR_NGOLA_04'),
		('UNIT_JAR_NGOLA', 	'TXT_KEY_GREAT_PERSON_JAR_NGOLA_05'),
		('UNIT_JAR_NGOLA', 	'TXT_KEY_GREAT_PERSON_JAR_NGOLA_06'),
		('UNIT_JAR_NGOLA', 	'TXT_KEY_GREAT_PERSON_JAR_NGOLA_07');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions
		(UnitType, 			PromotionType)
SELECT	'UNIT_JAR_POMBO',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EXPLORER';

INSERT INTO Unit_FreePromotions
		(UnitType, 			PromotionType)
SELECT	'UNIT_JAR_IMBARE',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SPANISH_TERCIO';

INSERT INTO Unit_FreePromotions
		(UnitType, 			PromotionType)
SELECT	'UNIT_JAR_MAKUNZE',	'PROMOTION_SUPPLY_BOOST' UNION ALL
SELECT	'UNIT_JAR_MAKUNZE', PromotionType FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_DIPLOMAT');

INSERT INTO Unit_FreePromotions 		
		(UnitType, 			PromotionType)
SELECT	'UNIT_JAR_NGOLA',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO UnitPromotions_CivilianUnitType
		(PromotionType, UnitType)
SELECT	PromotionType, 'UNIT_JAR_NGOLA'
FROM UnitPromotions_CivilianUnitType WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
VALUES	('UNIT_JAR_POMBO',	'PROMOTION_JAR_POMBO'),
		('UNIT_JAR_POMBO',	'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
		('UNIT_JAR_IMBARE',	'PROMOTION_JAR_IMBARE');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 			BuildType)
SELECT	'UNIT_JAR_MAKUNZE',	'BUILD_JAR_MAKUNZE';

INSERT INTO Unit_Builds 	
		(UnitType, 			BuildType)
SELECT	'UNIT_JAR_NGOLA',	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityExpended
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityExpended 	
		(UnitType, 			ResourceType, 	Amount)
SELECT	'UNIT_JAR_MAKUNZE',	ResourceType, 	Amount
FROM Unit_ResourceQuantityExpended WHERE (UnitType = 'UNIT_GREAT_DIPLOMAT');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_BuildingClassPurchaseRequireds
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Unit_BuildingClassPurchaseRequireds WHERE UnitType = 'UNIT_JAR_POMBO';
INSERT INTO Unit_BuildingClassPurchaseRequireds
		(UnitType, BuildingClassType)
SELECT	'UNIT_JAR_POMBO', 'BUILDINGCLASS_BARRACKS';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 						   ArtDefineTag, 	VictoryCompetitiveness, WonderCompetitiveness,  MinorCivCompetitiveness, 		Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JAR_NZINGA', 	'TXT_KEY_LEADER_JAR_NZINGA',	'TXT_KEY_LEADER_JAR_NZINGA_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JAR_NZINGA',   'Nzinga_LS.xml',   7, 					    3, 						11, 							11, 			7, 				4, 				5, 						6, 			3, 			3, 			2, 				2, 			6, 	'JAR_NDONGO_ICON_ATLAS', 	0);

UPDATE Leaders SET Personality = 'PERSONALITY_DIPLOMAT',
	PrimaryVictoryPursuit = 'VICTORY_PURSUIT_DIPLOMACY'
WHERE Type = 'LEADER_JAR_NZINGA';
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_JAR_NZINGA', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_JAR_NZINGA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_JAR_NZINGA', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_JAR_NZINGA', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JAR_NZINGA', 	'MAJOR_CIV_APPROACH_AFRAID', 		1),
		('LEADER_JAR_NZINGA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JAR_NZINGA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_JAR_NZINGA', 	'MINOR_CIV_APPROACH_IGNORE', 		1),
		('LEADER_JAR_NZINGA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_JAR_NZINGA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	9),
		('LEADER_JAR_NZINGA', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_JAR_NZINGA', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_JAR_NZINGA', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JAR_NZINGA', 	'FLAVOR_DEFENSE', 					8),
		('LEADER_JAR_NZINGA', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JAR_NZINGA', 	'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_JAR_NZINGA', 	'FLAVOR_RECON', 					6),
		('LEADER_JAR_NZINGA', 	'FLAVOR_RANGED', 					9),
		('LEADER_JAR_NZINGA', 	'FLAVOR_MOBILE', 					8),
		('LEADER_JAR_NZINGA', 	'FLAVOR_NAVAL', 					2),
		('LEADER_JAR_NZINGA', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_JAR_NZINGA', 	'FLAVOR_NAVAL_GROWTH', 				2),
		('LEADER_JAR_NZINGA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_JAR_NZINGA', 	'FLAVOR_AIR', 						2),
		('LEADER_JAR_NZINGA', 	'FLAVOR_EXPANSION', 				6),
		('LEADER_JAR_NZINGA', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JAR_NZINGA', 	'FLAVOR_TILE_IMPROVEMENT', 			2),
		('LEADER_JAR_NZINGA', 	'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_JAR_NZINGA', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_JAR_NZINGA', 	'FLAVOR_GOLD', 						5),
		('LEADER_JAR_NZINGA', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JAR_NZINGA', 	'FLAVOR_CULTURE', 					6),
		('LEADER_JAR_NZINGA', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_JAR_NZINGA', 	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_JAR_NZINGA', 	'FLAVOR_WONDER', 					3),
		('LEADER_JAR_NZINGA', 	'FLAVOR_RELIGION', 					5),
		('LEADER_JAR_NZINGA', 	'FLAVOR_DIPLOMACY', 				10),
		('LEADER_JAR_NZINGA', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JAR_NZINGA', 	'FLAVOR_WATER_CONNECTION', 			3),
		('LEADER_JAR_NZINGA', 	'FLAVOR_NUKE', 						3),
		('LEADER_JAR_NZINGA', 	'FLAVOR_USE_NUKE', 					3),
		('LEADER_JAR_NZINGA', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JAR_NZINGA', 	'FLAVOR_AIRLIFT', 					4),
		('LEADER_JAR_NZINGA', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JAR_NZINGA', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JAR_NZINGA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JAR_NZINGA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JAR_NZINGA', 	'FLAVOR_ARCHAEOLOGY', 				3),
		('LEADER_JAR_NZINGA', 	'FLAVOR_AIR_CARRIER', 				6);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_JAR_NZINGA', 	'TRAIT_JAR_NZINGA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 				 ShortDescription)
VALUES	('TRAIT_JAR_NZINGA', 	'TXT_KEY_TRAIT_JAR_NZINGA',	 'TXT_KEY_TRAIT_JAR_NZINGA_SHORT');
------------------------------------------------------------------------------------------------------------------------
-- Trait_NoBuilds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Trait_NoBuilds	
		(TraitType, 			BuildType)
VALUES	('TRAIT_JAR_NZINGA',	'BUILD_TRADING_POST');
--------------------------------------------------------------------------------------------------------------------------	
-- Trait_FreePromotionUnitCombats
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Trait_FreePromotionUnitCombats
(TraitType, UnitCombatType, PromotionType) VALUES
('TRAIT_JAR_NZINGA', 'UNITCOMBAT_MELEE', 	'PROMOTION_UA_NDONGO'),
('TRAIT_JAR_NZINGA', 'UNITCOMBAT_GUN', 	 	'PROMOTION_UA_NDONGO'),
('TRAIT_JAR_NZINGA', 'UNITCOMBAT_ARCHER',	'PROMOTION_UA_NDONGO'),
('TRAIT_JAR_NZINGA', 'UNITCOMBAT_RECON',	'PROMOTION_UA_NDONGO'),
('TRAIT_JAR_NZINGA', 'UNITCOMBAT_MOUNTED',	'PROMOTION_UA_NDONGO'),
('TRAIT_JAR_NZINGA', 'UNITCOMBAT_ARMOR',	'PROMOTION_UA_NDONGO'),
('TRAIT_JAR_NZINGA', 'UNITCOMBAT_SIEGE',	'PROMOTION_UA_NDONGO');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses																												 
		(LeaderType, 			ResponseType, 								Response, 													Bias)
VALUES 	('LEADER_JAR_NZINGA', 	'RESPONSE_AI_DOF_BACKSTAB', 				'TXT_KEY_LEADER_JAR_NZINGA_DENOUNCE_FRIEND%', 				500),
		('LEADER_JAR_NZINGA', 	'RESPONSE_ATTACKED_HOSTILE', 				'TXT_KEY_LEADER_JAR_NZINGA_ATTACKED_HOSTILE%', 				500),
		('LEADER_JAR_NZINGA', 	'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_JAR_NZINGA_DEFEATED%', 						500),
		('LEADER_JAR_NZINGA', 	'RESPONSE_DOW_GENERIC', 					'TXT_KEY_LEADER_JAR_NZINGA_DOW_GENERIC%', 					500),
		('LEADER_JAR_NZINGA', 	'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_JAR_NZINGA_FIRSTGREETING%', 				500),
		('LEADER_JAR_NZINGA', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 	'TXT_KEY_LEADER_JAR_NZINGA_RESPONSE_TO_BEING_DENOUNCED%',   500),
		('LEADER_JAR_NZINGA', 	'RESPONSE_WORK_AGAINST_SOMEONE', 			'TXT_KEY_LEADER_JAR_NZINGA_DENOUNCE%', 						500),
		('LEADER_JAR_NZINGA', 	'RESPONSE_WORK_WITH_US', 					'TXT_KEY_LEADER_JAR_NZINGA_DEC_FRIENDSHIP%', 				500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 						Description,					ShortDescription,					  Adjective,						   Civilopedia, 					CivilopediaTag, 			DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,				PortraitIndex,	AlphaIconAtlas,				SoundtrackTag,  MapImage, 		DawnOfManQuote, 					DawnOfManImage)
SELECT	'CIVILIZATION_JAR_NDONGO',	'TXT_KEY_CIV_JAR_NDONGO_DESC',   'TXT_KEY_CIV_JAR_NDONGO_SHORT_DESC',  'TXT_KEY_CIV_JAR_NDONGO_ADJECTIVE',   'TXT_KEY_CIV5_JAR_NDONGO_TEXT_1',	'TXT_KEY_CIV5_JAR_NDONGO',	'PLAYERCOLOR_JAR_NDONGO',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JAR_NDONGO_ICON_ATLAS',	1,			'JAR_NDONGO_ALPHA_ATLAS',	'Ethiopia', 	'Ndongo.dds',	'TXT_KEY_CIV5_DAWN_JAR_NDONGO_TEXT',	'Nzinga_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_ETHIOPIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 			CityName)
VALUES	('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_01'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_02'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_03'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_04'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_05'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_06'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_07'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_08'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_09'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_10'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_11'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_12'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_13'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_14'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_15'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_16'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_17'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_18'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_19'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_20'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_21'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_22'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_23'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_24'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_25'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_26'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_27'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_28'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_29'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_30'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_31'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_32'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_33'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_34'),
		('CIVILIZATION_JAR_NDONGO',  'TXT_KEY_CITY_NAME_JAR_NDONGO_35');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_JAR_NDONGO', 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ETHIOPIA';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_JAR_NDONGO',		TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ETHIOPIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JAR_NDONGO',		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ETHIOPIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_JAR_NDONGO',		'LEADER_JAR_NZINGA');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JAR_NDONGO',	'UNITCLASS_EXPLORER',		'UNIT_JAR_POMBO'),
		('CIVILIZATION_JAR_NDONGO',	'UNITCLASS_TERCIO',			'UNIT_JAR_IMBARE'),
		('CIVILIZATION_JAR_NDONGO',	'UNITCLASS_GREAT_DIPLOMAT',	'UNIT_JAR_MAKUNZE'),
		('CIVILIZATION_JAR_NDONGO',	'UNITCLASS_GREAT_GENERAL',	'UNIT_JAR_NGOLA');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_JAR_NDONGO',		'RELIGION_CHRISTIANITY');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_0'),	
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_1'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_2'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_3'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_4'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_5'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_6'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_7'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_8'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_9'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_10'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_11'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_12'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_13'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_14'),
		('CIVILIZATION_JAR_NDONGO',		'TXT_KEY_SPY_NAME_JAR_NDONGO_15');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_JAR_NDONGO',		'REGION_JUNGLE');	
--==========================================================================================================================
--==========================================================================================================================
