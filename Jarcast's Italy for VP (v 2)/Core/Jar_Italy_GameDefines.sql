--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_MINORS_INTERACTION';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RESOLUTIONS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_ABORT';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_TURN';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_MISSION';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_RESULT';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_ENDED';
--==========================================================================================================================
-- Improvements
--==========================================================================================================================
-- Improvements
--------------------------------
INSERT INTO Improvements
		(Type,						Description,						Civilopedia, 							Help,									ArtDefineTag,					SpecificCivRequired,	CivilizationType,		PillageGold, Permanent,	NoTwoAdjacent,	DefenseModifier,	IconAtlas,				PortraitIndex)
VALUES	('IMPROVEMENT_JAR_BORGO',	'TXT_KEY_IMPROVEMENT_JAR_BORGO',	'TXT_KEY_IMPROVEMENT_JAR_BORGO_TEXT',	'TXT_KEY_IMPROVEMENT_JAR_BORGO_HELP',	'ART_DEF_IMPROVEMENT_JAR_BORGO',	1,					'CIVILIZATION_JAR_ITALY',	20,				0,			1,			25,				'JAR_ITALY_ICON_ATLAS',	2);
UPDATE Improvements SET MakesPassable = 1, GrantsVisionXTiles = 2 WHERE Type = 'IMPROVEMENT_JAR_BORGO';
------------------------------	
-- Improvement_Flavors
------------------------------		
INSERT INTO Improvement_Flavors	
		(ImprovementType, 				FlavorType,			Flavor)
VALUES	('IMPROVEMENT_JAR_BORGO',	'FLAVOR_CULTURE',		40),
		('IMPROVEMENT_JAR_BORGO',	'FLAVOR_GREAT_PEOPLE',	25),
		('IMPROVEMENT_JAR_BORGO',	'FLAVOR_GOLD',			15),
		('IMPROVEMENT_JAR_BORGO',	'FLAVOR_PRODUCTION',	15),
		('IMPROVEMENT_JAR_BORGO',	'FLAVOR_GROWTH',		15);
------------------------------	
-- Improvement_ValidTerrains
------------------------------		
INSERT INTO Improvement_ValidTerrains 	
		(ImprovementType,			TerrainType)
SELECT	'IMPROVEMENT_JAR_BORGO',	TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST';
------------------------------	
-- Improvement_Yields
------------------------------		
INSERT INTO Improvement_Yields 	
		(ImprovementType, 			YieldType,			Yield)
VALUES	('IMPROVEMENT_JAR_BORGO',	'YIELD_FOOD',		2),
		('IMPROVEMENT_JAR_BORGO',	'YIELD_GOLD',		1),
		('IMPROVEMENT_JAR_BORGO',	'YIELD_PRODUCTION',	1),
		('IMPROVEMENT_JAR_BORGO',	'YIELD_CULTURE',	2);
------------------------------
-- Improvement_YieldPerXAdjacentImprovement
------------------------------
INSERT INTO Improvement_YieldPerXAdjacentImprovement
		(ImprovementType, 	OtherImprovementType,		YieldType, Yield, NumRequired)
SELECT	Type, 				'IMPROVEMENT_JAR_BORGO',	'YIELD_FOOD', 	1, 1 FROM Improvements WHERE Type IN ('IMPROVEMENT_ACADEMY', 'IMPROVEMENT_CUSTOMS_HOUSE', 'IMPROVEMENT_MANUFACTORY', 'IMPROVEMENT_CITADEL','IMPROVEMENT_HOLY_SITE') UNION ALL
SELECT	Type, 				'IMPROVEMENT_JAR_BORGO',	'YIELD_CULTURE',1, 1 FROM Improvements WHERE Type IN ('IMPROVEMENT_ACADEMY', 'IMPROVEMENT_CUSTOMS_HOUSE', 'IMPROVEMENT_MANUFACTORY', 'IMPROVEMENT_CITADEL','IMPROVEMENT_HOLY_SITE');
------------------------------
-- Improvement_TechYieldChanges
------------------------------
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,			TechType,					YieldType,			Yield)
SELECT	'IMPROVEMENT_JAR_BORGO',	'TECH_ARCHITECTURE',		'YIELD_CULTURE',	1 UNION ALL
SELECT	'IMPROVEMENT_JAR_BORGO',	'TECH_FERTILIZER', 			'YIELD_FOOD',		1 UNION ALL
SELECT	'IMPROVEMENT_JAR_BORGO',	'TECH_INDUSTRIALIZATION',	'YIELD_PRODUCTION',	2 UNION ALL
SELECT	'IMPROVEMENT_JAR_BORGO',	'TECH_ARCHAEOLOGY',			'YIELD_SCIENCE',	1 UNION ALL
SELECT	'IMPROVEMENT_JAR_BORGO',	'TECH_CORPORATIONS',		'YIELD_GOLD',		1 UNION ALL
SELECT	'IMPROVEMENT_JAR_BORGO',	'TECH_RADIO',				'YIELD_TOURISM',	2;
------------------------------	
-- Improvement_RouteYieldChanges
------------------------------
INSERT INTO Improvement_RouteYieldChanges
		(ImprovementType, 		 RouteType, YieldType, Yield)
SELECT 	'IMPROVEMENT_JAR_BORGO', RouteType, YieldType, Yield
FROM Improvement_RouteYieldChanges WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST';
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,			YieldType,			Yield)
SELECT	 PolicyType,	'IMPROVEMENT_JAR_BORGO',	YieldType,			Yield
from Policy_ImprovementYieldChanges where ImprovementType = 'IMPROVEMENT_TRADING_POST' UNION ALL
SELECT	 PolicyType,	'IMPROVEMENT_JAR_BORGO',	YieldType, Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_MOAI';
------------------------------
-- Belief_ImprovementYieldChanges
------------------------------	
INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 			YieldType, Yield)
SELECT	 BeliefType,	'IMPROVEMENT_JAR_BORGO',	YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST' UNION ALL
SELECT	 BeliefType,	'IMPROVEMENT_JAR_BORGO',	YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_MOAI';
------------------------------	
-- Building_ImprovementYieldChanges
------------------------------	
INSERT INTO Building_ImprovementYieldChanges
		(BuildingType,	ImprovementType,			YieldType,	Yield) 
SELECT	BuildingType,	'IMPROVEMENT_JAR_BORGO',	YieldType,	Yield
FROM Building_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST';
------------------------------	
-- Building_ImprovementYieldChangesGlobal
------------------------------	
INSERT INTO Building_ImprovementYieldChangesGlobal
		(BuildingType,	ImprovementType,			YieldType,	Yield) 
SELECT	BuildingType,	'IMPROVEMENT_JAR_BORGO',	YieldType,	Yield
FROM Building_ImprovementYieldChangesGlobal WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST';
------------------------------
-- SQL TRIGGERS
------------------------------
CREATE TRIGGER IF NOT EXISTS JarComune01 AFTER INSERT ON Policy_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_TRADING_POST' OR NEW.ImprovementType = 'IMPROVEMENT_MOAI'
BEGIN
	INSERT INTO Policy_ImprovementYieldChanges
					(PolicyType,	ImprovementType,			YieldType,			Yield)
	SELECT DISTINCT	 NEW.PolicyType,'IMPROVEMENT_JAR_BORGO',	NEW.YieldType,	NEW.Yield;
END;
--
CREATE TRIGGER IF NOT EXISTS JarComune02 AFTER INSERT ON Belief_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_TRADING_POST' OR NEW.ImprovementType = 'IMPROVEMENT_MOAI'
BEGIN
	INSERT INTO Belief_ImprovementYieldChanges
					(BeliefType,	ImprovementType,			YieldType,			Yield)
	SELECT DISTINCT	 NEW.BeliefType,'IMPROVEMENT_JAR_BORGO',	NEW.YieldType,	NEW.Yield;
END;
--
CREATE TRIGGER IF NOT EXISTS JarComune03 AFTER INSERT ON Building_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_TRADING_POST' 
BEGIN
	INSERT INTO Building_ImprovementYieldChanges
					(BuildingType,	ImprovementType,			YieldType,			Yield)
	SELECT DISTINCT	 NEW.BuildingType,'IMPROVEMENT_JAR_BORGO',	NEW.YieldType,	NEW.Yield;
END;
--
CREATE TRIGGER IF NOT EXISTS JarComune04 AFTER INSERT ON Building_ImprovementYieldChangesGlobal
WHEN NEW.ImprovementType = 'IMPROVEMENT_TRADING_POST' 
BEGIN
	INSERT INTO Building_ImprovementYieldChangesGlobal
					(BuildingType,	ImprovementType,			YieldType,			Yield)
	SELECT DISTINCT	 NEW.BuildingType,'IMPROVEMENT_JAR_BORGO',	NEW.YieldType,	NEW.Yield;
END;
--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds		
		(Type,				PrereqTech,				ImprovementType, 			Description, 							Help, 										Recommendation, 							Time, EntityEvent, 			OrderPriority, 	IconIndex, 	IconAtlas)
SELECT 	'BUILD_JAR_BORGO',	'TECH_CIVIL_SERVICE',	'IMPROVEMENT_JAR_BORGO',	'TXT_KEY_BUILD_IMPROVEMENT_JAR_BORGO',	'TXT_KEY_BUILD_IMPROVEMENT_JAR_BORGO_HELP',	'TXT_KEY_BUILD_IMPROVEMENT_JAR_BORGO_REC',	Time, 'ENTITY_EVENT_BUILD',	95,				3,			'JAR_ITALY_ICON_ATLAS'
FROM Builds WHERE Type='BUILD_TRADING_POST';
------------------------------				
-- Unit_Builds
------------------------------				
INSERT INTO Unit_Builds	
		(UnitType, 	BuildType)
SELECT 	 Type,		'BUILD_JAR_BORGO' FROM Units WHERE Class='UNITCLASS_WORKER';
--------------------------------
-- BuildFeatures
--------------------------------
INSERT INTO BuildFeatures
		(BuildType, 			FeatureType,		PrereqTech,	Time, Production,	Remove)
SELECT	('BUILD_JAR_BORGO'),	'FEATURE_FOREST',	PrereqTech,	Time, Production,	Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_REMOVE_FOREST';

INSERT INTO BuildFeatures
		(BuildType, 			FeatureType,		PrereqTech,	Time,	Production, Remove)
SELECT	('BUILD_JAR_BORGO'),	'FEATURE_JUNGLE',	PrereqTech,	Time,	Production,	Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_REMOVE_JUNGLE';

INSERT INTO BuildFeatures
		(BuildType, 			FeatureType,		PrereqTech,	Time,	Production, Remove)
SELECT	('BUILD_JAR_BORGO'),	'FEATURE_MARSH',	PrereqTech,	Time,	Production,	Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_REMOVE_MARSH';
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions 
(Type, 							Description, 							Help, 										Sound, 				LostWithUpgrade, OrderPriority, CannotBeChosen,	PortraitIndex, 	IconAtlas,				PediaType, 			PediaEntry) VALUES
('PROMOTION_JAR_SWORDONDEMAND',	'TXT_KEY_PROMOTION_JAR_SWORDONDEMAND',	'TXT_KEY_PROMOTION_JAR_SWORDONDEMAND_HELP',	'AS2D_IF_LEVELUP',	1,				 0, 			1,				0, 			'JAR_ITALY_PROMO_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_SWORDONDEMAND'),
('PROMOTION_JAR_RISORGIMENTO',	'TXT_KEY_PROMOTION_JAR_RISORGIMENTO',	'TXT_KEY_PROMOTION_JAR_RISORGIMENTO_HELP',	'AS2D_IF_LEVELUP',	1,				 0, 			1,				1, 			'JAR_ITALY_PROMO_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_RISORGIMENTO'),
('PROMOTION_JAR_VIVAVERDI',		'TXT_KEY_PROMOTION_JAR_VIVAVERDI',		'TXT_KEY_PROMOTION_JAR_VIVAVERDI_HELP',		'AS2D_IF_LEVELUP',	0,				 0, 			1,				2, 			'JAR_ITALY_PROMO_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_VIVAVERDI');
UPDATE UnitPromotions SET ExperiencePercent=50 WHERE Type = 'PROMOTION_JAR_SWORDONDEMAND';
UPDATE UnitPromotions SET CityAttack = 100, DamageReductionCityAssault = 20 WHERE Type = 'PROMOTION_JAR_RISORGIMENTO';
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
		(Type,					Class, 	PrereqTech,	Range, BaseSightRange, Combat, PuppetPurchaseOverride,	MoveAfterPurchase,PurchaseOnly,	Cost,	FaithCost,				RequiresFaithPurchaseEnabled,	GlobalFaithPurchaseCooldown,	Moves, Immobile, CombatClass, Domain, DefaultUnitAI, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	Description, 					Civilopedia, 						Strategy, 								Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,				PortraitIndex, 	IconAtlas,				MoveRate)
SELECT	'UNIT_JAR_CONDOTTA',	Class,	PrereqTech,	Range, BaseSightRange, Combat, 1,						1,				 1,	round(Cost*0.8),	round(FaithCost*0.8),	RequiresFaithPurchaseEnabled,	GlobalFaithPurchaseCooldown,	Moves, Immobile, CombatClass, Domain, DefaultUnitAI, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	'TXT_KEY_UNIT_JAR_CONDOTTA',	'TXT_KEY_UNIT_JAR_CONDOTTA_TEXT',	'TXT_KEY_UNIT_JAR_CONDOTTA_STRATEGY',	'TXT_KEY_UNIT_JAR_CONDOTTA_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_JAR_CONDOTTA', 	0,					'UNIT_JAR_CONDOTTA_FLAG',	5,				'JAR_ITALY_ICON_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_KNIGHT';

INSERT INTO Units 	
		(Type,					Class, 	PrereqTech,	Range, BaseSightRange, Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly,	GlobalFaithPurchaseCooldown,	MoveAfterPurchase,	Moves, 	Immobile, CombatClass, Domain, DefaultUnitAI, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	Description, 					Civilopedia, 						Strategy, 								Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,				PortraitIndex, 	IconAtlas,				MoveRate, PurchaseCooldown, BaseLandAirDefense)
SELECT	'UNIT_JAR_BERSAGLIERI',	Class,	PrereqTech,	Range, BaseSightRange, Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly,	GlobalFaithPurchaseCooldown,	MoveAfterPurchase,	Moves+1,Immobile, CombatClass, Domain, DefaultUnitAI, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	'TXT_KEY_UNIT_JAR_BERSAGLIERI',	'TXT_KEY_UNIT_JAR_BERSAGLIERI_TEXT','TXT_KEY_UNIT_JAR_BERSAGLIERI_STRATEGY','TXT_KEY_UNIT_JAR_BERSAGLIERI_HELP',Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_JAR_BERSAGLIERI', 0,					'UNIT_JAR_BERSAGLIERI_FLAG',7,				'JAR_ITALY_ICON_ATLAS',	MoveRate, PurchaseCooldown, BaseLandAirDefense
FROM Units WHERE Type = 'UNIT_RIFLEMAN';
UPDATE Units SET CulExpOnDisbandUpgrade =1 WHERE Type = 'UNIT_JAR_BERSAGLIERI';
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			 SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JAR_CONDOTTA', SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			 	SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JAR_BERSAGLIERI', SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
		(UnitType, 			 UnitAIType)
SELECT	'UNIT_JAR_CONDOTTA', UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_AITypes 	
		(UnitType, 			 	UnitAIType)
SELECT	'UNIT_JAR_BERSAGLIERI', UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';
--==========================================================================================================================	
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================		
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType)
SELECT	'UNIT_JAR_CONDOTTA',	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_KNIGHT';
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JAR_CONDOTTA', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';
	
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JAR_BERSAGLIERI', FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType) 
SELECT	'UNIT_JAR_CONDOTTA',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType) 
SELECT	'UNIT_JAR_BERSAGLIERI',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_JAR_CONDOTTA',	'PROMOTION_OPEN_TERRAIN'),
		('UNIT_JAR_CONDOTTA',	'PROMOTION_JAR_SWORDONDEMAND'),
		('UNIT_JAR_BERSAGLIERI','PROMOTION_JAR_RISORGIMENTO'),
		('UNIT_JAR_BERSAGLIERI','PROMOTION_JAR_VIVAVERDI');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JAR_CONDOTTA',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_KNIGHT';

UPDATE Units SET
ObsoleteTech = (select a.ObsoleteTech from Units a, Unit_ClassUpgrades b, UnitClasses c WHERE b.UnitType='UNIT_JAR_CONDOTTA' and b.UnitClassType=c.Type and c.DefaultUnit=a.Type)
WHERE (Type = 'UNIT_JAR_CONDOTTA');

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JAR_BERSAGLIERI',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';

UPDATE Units SET
ObsoleteTech = (select a.ObsoleteTech from Units a, Unit_ClassUpgrades b, UnitClasses c WHERE b.UnitType='UNIT_JAR_BERSAGLIERI' and b.UnitClassType=c.Type and c.DefaultUnit=a.Type)
WHERE (Type = 'UNIT_JAR_BERSAGLIERI');
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------
INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 				Type, 								Description,						NoLimit)
VALUES	('BUILDING_JAR_DUMMY_BORGO',	'BUILDINGCLASS_JAR_DUMMY_BORGO',	'TXT_KEY_BUILDING_JAR_DUMMY_BORGO', 1),
		('BUILDING_JAR_DUMMY_PASTA',	'BUILDINGCLASS_JAR_DUMMY_PASTA',	'TXT_KEY_BUILDING_JAR_DUMMY_PASTA', 1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings
		(Type, 						BuildingClass,	Cost,	GoldMaintenance,	FaithCost, UnlockedByBelief, BuildingProductionModifier, SpecialistType, SpecialistCount, PrereqTech,	Help,										Description,							Civilopedia,								Strategy,										ArtDefineTag,	MinAreaSize,	HurryCostModifier,	NeverCapture,	IconAtlas,			PortraitIndex)
SELECT	'BUILDING_JAR_PASTIFICIO',	BuildingClass,	Cost,	GoldMaintenance,	FaithCost, UnlockedByBelief, BuildingProductionModifier, SpecialistType, SpecialistCount, PrereqTech,	('TXT_KEY_BUILDING_JAR_PASTIFICIO_HELP'),	('TXT_KEY_BUILDING_JAR_PASTIFICIO'),	('TXT_KEY_BUILDING_JAR_PASTIFICIO_TEXT'),	('TXT_KEY_BUILDING_JAR_PASTIFICIO_STRATEGY'),	ArtDefineTag,	MinAreaSize,	HurryCostModifier,	1,				('JAR_ITALY_ICON_ATLAS'),	6
FROM Buildings WHERE (Type = 'BUILDING_WINDMILL');
UPDATE Buildings SET GreatPeopleRateChange = 3 WHERE Type = 'BUILDING_JAR_PASTIFICIO';

INSERT OR REPLACE INTO Buildings
(Type, 						 	BuildingClass, 						IsDummy,	Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	MinAreaSize,	NeverCapture,	Description, 							Help) VALUES	
('BUILDING_JAR_DUMMY_BORGO', 	'BUILDINGCLASS_JAR_DUMMY_BORGO',	1,			-1,		-1,			-1,				null,		-1,				1,				'TXT_KEY_BUILDING_JAR_DUMMY_BORGO',	'TXT_KEY_BUILDING_JAR_DUMMY_BORGO_HELP'),
('BUILDING_JAR_DUMMY_PASTA', 	'BUILDINGCLASS_JAR_DUMMY_PASTA',	1,			-1,		-1,			-1,				null,		-1,				1,				'TXT_KEY_BUILDING_JAR_DUMMY_PASTA',	'TXT_KEY_BUILDING_JAR_DUMMY_PASTA_HELP');

UPDATE Buildings SET LandmarksTourismPercent=5, GreatWorksTourismModifier=5 WHERE Type = 'BUILDING_JAR_DUMMY_BORGO';
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,		Flavor)
SELECT	'BUILDING_JAR_PASTIFICIO',	'FLAVOR_CULTURE',	20 UNION ALL
SELECT	'BUILDING_JAR_PASTIFICIO',	'FLAVOR_GROWTH',	20 UNION ALL
SELECT	'BUILDING_JAR_PASTIFICIO',	FlavorType,		Flavor+10
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_WINDMILL');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType,		Yield)
SELECT	'BUILDING_JAR_DUMMY_PASTA',	'YIELD_TOURISM',4	UNION ALL
SELECT	'BUILDING_JAR_PASTIFICIO',	'YIELD_CULTURE',1	UNION ALL
SELECT	'BUILDING_JAR_PASTIFICIO',	'YIELD_FOOD',	4	UNION ALL
SELECT	'BUILDING_JAR_PASTIFICIO',	YieldType,		Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_WINDMILL');

INSERT INTO Building_YieldFromYieldPercent
(BuildingType, 				YieldOut, 		YieldIn, 	Value) VALUES
('BUILDING_JAR_PASTIFICIO', 'YIELD_CULTURE','YIELD_FOOD', 15); 
------------------------------	
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges
		(BuildingType, 				ResourceType, 		YieldType, Yield)
SELECT	'BUILDING_JAR_PASTIFICIO', 	ResourceType, 		YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType='BUILDING_WINDMILL';

INSERT INTO Building_ResourceYieldChanges 
(BuildingType,				ResourceType,		YieldType,			Yield) VALUES
('BUILDING_JAR_PASTIFICIO',	'RESOURCE_WHEAT',	'YIELD_CULTURE',		1);
------------------------------
-- Building_ImprovementYieldChanges
------------------------------	
INSERT INTO Building_ImprovementYieldChanges
		(BuildingType, 				ImprovementType, 	YieldType, Yield)
VALUES	('BUILDING_JAR_PASTIFICIO', 'IMPROVEMENT_FARM', 'YIELD_CULTURE', 1);
--------------------------------
-- Building_LakePlotYieldChanges
--------------------------------
INSERT INTO Building_LakePlotYieldChanges
		(BuildingType, 			YieldType, Yield)
SELECT 'BUILDING_JAR_PASTIFICIO', YieldType, Yield
FROM Building_LakePlotYieldChanges WHERE BuildingType = 'BUILDING_WINDMILL';
--------------------------------
-- Building_FeatureYieldChanges
--------------------------------
INSERT INTO Building_FeatureYieldChanges
		(BuildingType, 			FeatureType, YieldType, Yield)
SELECT 'BUILDING_JAR_PASTIFICIO', FeatureType, YieldType, Yield
FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_WINDMILL';	
--------------------------------
-- Building_BuildingClassLocalYieldChanges
--------------------------------
INSERT INTO Building_BuildingClassLocalYieldChanges
		(BuildingType, 			BuildingClassType, YieldType, YieldChange)
SELECT 'BUILDING_JAR_PASTIFICIO', BuildingClassType, YieldType, YieldChange
FROM Building_BuildingClassLocalYieldChanges WHERE BuildingType = 'BUILDING_WINDMILL';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 											CivilopediaTag, 								ArtDefineTag, 						IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JAR_UMBERTO_I', 	'TXT_KEY_LEADER_JAR_UMBERTO_I', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JAR_UMBERTO_I_TEXT_1', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JAR_UMBERTO_I', 	'JFD_ItalyUmbertoI_Scene.xml',		'JAR_ITALY_ICON_ATLAS', 	0);

UPDATE Leaders
SET VictoryCompetitiveness = 8,
WonderCompetitiveness = 6,
MinorCivCompetitiveness = 2,
Boldness = 7,
DiploBalance = 5,
WarmongerHate = 4,
DenounceWillingness = 5,
DoFWillingness = 6,
Loyalty = 5,
Neediness = 8,
Forgiveness = 4,
Chattiness = 5,
Meanness = 5,
Personality='PERSONALITY_COALITION', PrimaryVictoryPursuit  = 'VICTORY_PURSUIT_CULTURE'
WHERE Type = 'LEADER_JAR_UMBERTO_I';	
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_JAR_UMBERTO_I', 		'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_JAR_UMBERTO_I', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_JAR_UMBERTO_I', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_JAR_UMBERTO_I', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_JAR_UMBERTO_I', 		'MAJOR_CIV_APPROACH_AFRAID', 		6),
		('LEADER_JAR_UMBERTO_I', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JAR_UMBERTO_I', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_JAR_UMBERTO_I', 		'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JAR_UMBERTO_I', 		'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JAR_UMBERTO_I', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JAR_UMBERTO_I', 		'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_JAR_UMBERTO_I', 		'MINOR_CIV_APPROACH_BULLY', 		8);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_JAR_UMBERTO_I', 		'FLAVOR_OFFENSE', 					6),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_DEFENSE', 					5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_RECON', 					7),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_RANGED', 					5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_MOBILE', 					6),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_NAVAL', 					7),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_NAVAL_RECON', 				7),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_NAVAL_GROWTH', 				6),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_AIR', 						5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_EXPANSION', 				7),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_GROWTH', 					6),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_TILE_IMPROVEMENT', 			7),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_PRODUCTION', 				5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_GOLD', 						5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_SCIENCE', 					5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_CULTURE', 					9),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_HAPPINESS', 				5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_GREAT_PEOPLE', 				9),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_WONDER', 					7),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_RELIGION', 					4),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_DIPLOMACY', 				7),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_SPACESHIP', 				3),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_WATER_CONNECTION', 			7),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_NUKE', 						2),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_USE_NUKE', 					2),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_ESPIONAGE', 				2),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_AIRLIFT', 					5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_ARCHAEOLOGY', 				8),
		('LEADER_JAR_UMBERTO_I', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_JAR_UMBERTO_I',		'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JAR_UMBERTO_I_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JAR_UMBERTO_I_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_ATTACKED_STRONG_HOSTILE', 			 	'TXT_KEY_LEADER_JAR_UMBERTO_I_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JAR_UMBERTO_I_DEFEATED%', 					 			500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JAR_UMBERTO_I_DOW_GENERIC%', 				 				500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JAR_UMBERTO_I_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JAR_UMBERTO_I_FIRSTGREETING%', 				 			500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JAR_UMBERTO_I_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JAR_UMBERTO_I_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JAR_UMBERTO_I_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JAR_UMBERTO_I_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',		500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JAR_UMBERTO_I_LUXURY_TRADE%', 		  					500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JAR_UMBERTO_I_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JAR_UMBERTO_I_PLOT_BUYING_SERIOUS_WARNING%', 				500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JAR_UMBERTO_I_REQUEST%', 		  							500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JAR_UMBERTO_I_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_JAR_UMBERTO_I_TOO_SOON_FOR_DOF%', 						500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JAR_UMBERTO_I_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JAR_UMBERTO_I_DENOUNCE%', 					  			500),
		('LEADER_JAR_UMBERTO_I',		'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JAR_UMBERTO_I_DEC_FRIENDSHIP%', 			  	  			500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JAR_UMBERTO_I',	'TRAIT_JAR_UMBERTO_I');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 					ShortDescription)
VALUES	('TRAIT_JAR_UMBERTO_I',		'TXT_KEY_TRAIT_JAR_UMBERTO_I',	'TXT_KEY_TRAIT_JAR_UMBERTO_I_SHORT');
UPDATE Traits SET IsOddEraScaler = 1, GreatPeopleRateModifier= 50 WHERE Type = 'TRAIT_JAR_UMBERTO_I';
------------------------------------------------------------------------------------------------------------------------
-- Trait_NoBuilds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Trait_NoBuilds	
		(TraitType, 			BuildType)
VALUES	('TRAIT_JAR_UMBERTO_I',	'BUILD_TRADING_POST');
------------------------------------------------------------------------------------------------------------------------
-- Trait_SpecialistYieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Trait_SpecialistYieldChanges
		(TraitType, 		SpecialistType, YieldType, Yield)
SELECT	'TRAIT_JAR_UMBERTO_I', Type, 'YIELD_PRODUCTION', 1 FROM Specialists WHERE GreatPeopleUnitClass IS NOT NULL;		
------------------------------------------------------------------------------------------------------------------------	
-- Policies
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO	Policies
(Type, 						Description, 						IsDummy) VALUES
('POLICY_ITALY_CULTHER',	'TXT_KEY_JAR_CULTURAL_HERITAGE',	1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType, 			BuildingClassType, 		YieldType, 		YieldChange)
SELECT	'POLICY_ITALY_CULTHER', 'BUILDINGCLASS_JAR_GWA','YIELD_SCIENCE', 1;
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations 	
		(Type, 						SoundtrackTag,  MapImage, 						DawnOfManQuote, 						DawnOfManImage,					Description,					ShortDescription,					Adjective,							CivilopediaTag,				 			DefaultPlayerColor,		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,				PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JAR_ITALY',	'Venice', 		'JFD_MapItalyUmbertoI512.dds',	'TXT_KEY_CIV_DAWN_JAR_UMBERTO_I_TEXT',	'JFD_DOM_ItalyUmbertoI.dds',	'TXT_KEY_CIV_JAR_ITALY_DESC', 	'TXT_KEY_CIV_JAR_ITALY_SHORT_DESC',	'TXT_KEY_CIV_JAR_ITALY_ADJECTIVE', 	'TXT_KEY_CIVILOPEDIA_CIVS_JAR_ITALY', 'PLAYERCOLOR_JAR_ITALY',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JAR_ITALY_ICON_ATLAS',	1,				'JAR_ITALY_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_VENICE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_CityNames SET CityName='TXT_KEY_CITY_NAME_JAR_ITALY_1'
WHERE CivilizationType='CIVILIZATION_ROME' AND CityName='TXT_KEY_CITY_NAME_ROME';
	
INSERT INTO Civilization_CityNames
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_1'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_2'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_3'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_4'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_5'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_6'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_7'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_8'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_9'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_10'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_11'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_12'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_13'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_14'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_15'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_16'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_17'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_18'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_19'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_20'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_21'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_22'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_23'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_24'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_25'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_26'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_27'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_28'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_29'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_30'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_31'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_32'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_33'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_34'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_35'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_36'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_37'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_38'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_39'),
		('CIVILIZATION_JAR_ITALY',    'TXT_KEY_CITY_NAME_JAR_ITALY_40');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_JAR_ITALY',		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_VENICE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 			TechType)
SELECT	'CIVILIZATION_JAR_ITALY',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_VENICE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits	
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JAR_ITALY',	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_VENICE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Leaders 
		(CivilizationType, 			LeaderheadType)
VALUES	('CIVILIZATION_JAR_ITALY',	'LEADER_JAR_UMBERTO_I');		
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 			UnitType)
SELECT	'CIVILIZATION_JAR_ITALY',	'UNITCLASS_KNIGHT',		'UNIT_JAR_CONDOTTA' UNION ALL
SELECT	'CIVILIZATION_JAR_ITALY',	'UNITCLASS_RIFLEMAN',	'UNIT_JAR_BERSAGLIERI';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
SELECT	'CIVILIZATION_JAR_ITALY',	'BUILDINGCLASS_WINDMILL',	'BUILDING_JAR_PASTIFICIO';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Religions 
		(CivilizationType, 			ReligionType)
SELECT	'CIVILIZATION_JAR_ITALY',	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_VENICE';
--------------------------------	
-- Civilization_Start_Along_Ocean 
--------------------------------		
/*INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 				StartAlongOcean)
VALUES	('CIVILIZATION_JAR_ITALY', 		1);*/
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Region_Avoid
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Region_Avoid
		(CivilizationType, 			RegionType)
VALUES	('CIVILIZATION_JAR_ITALY', 	'REGION_JUNGLE'),
		('CIVILIZATION_JAR_ITALY', 	'REGION_DESERT');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 			SpyName)
VALUES	('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_0'),	
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_1'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_2'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_3'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_4'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_5'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_6'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_7'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_8'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_9'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_10'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_11'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_12'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_13'),
		('CIVILIZATION_JAR_ITALY',	'TXT_KEY_SPY_NAME_JAR_ITALY_14');
------------------------------------------------------------------------------------------------------------------------	
-- MajorBlocksMinor
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO MajorBlocksMinor
		(MajorCiv,                  MinorCiv)
VALUES	('CIVILIZATION_JAR_ITALY',	'MINOR_CIV_MILAN'),
		('CIVILIZATION_JAR_ITALY',	'MINOR_CIV_GENOA'),
		('CIVILIZATION_JAR_ITALY',	'MINOR_CIV_FLORENCE');
--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
SELECT 'TXT_KEY_BUILDING_JAR_PASTIFICIO_HELP', '이 도시의 [ICON_FOOD] 식량의 15%가 매 턴 [ICON_CULTURE] 문화로 전환됩니다. [NEWLINE]국제 [ICON_INTERNATIONAL_TRADE] 교역로가 이 도시에 연결될 때마다 +4 [ICON_TOURISM] 관광을 제공합니다.[NEWLINE]도시 인근의 농장에서 +1 [ICON_CULTURE] 문화.[NEWLINE]주변의 [ICON_RES_WHEAT] 밀 자원마다 +1 [ICON_CULTURE] 문화 [NEWLINE][NEWLINE]'||Text
FROM Language_en_US WHERE Tag='TXT_KEY_BUILDING_WINDMILL_HELP';
--==========================================================================================================================
--==========================================================================================================================