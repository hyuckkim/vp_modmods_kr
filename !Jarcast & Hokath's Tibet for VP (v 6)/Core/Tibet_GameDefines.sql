--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'GLOBAL_ALPINE_PASSES';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_CUSTOM_MISSIONS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_PLOT';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_FOUND_RELIGION';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_GOLDEN_AGE'; 
--=======================================================================================================================
-- VP FIXES
--=======================================================================================================================
-- additional combat classes for promotions
INSERT OR REPLACE INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_UNITCOMBAT_SPECIAL_PEOPLE',		'Great People'),
			('TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST',		'Archaeologists');

INSERT OR REPLACE INTO UnitCombatInfos 
			(Type,							Description) 
VALUES		('UNITCOMBAT_SPECIAL_PEOPLE',	'TXT_KEY_UNITCOMBAT_SPECIAL_PEOPLE'),
			('UNITCOMBAT_ARCHAEOLOGIST',	'TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST');

UPDATE Units SET CombatClass = 'UNITCOMBAT_ARCHAEOLOGIST'	WHERE Type ='UNIT_ARCHAEOLOGIST';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SPECIAL_PEOPLE'	WHERE Special ='SPECIALUNIT_PEOPLE';
--==========================================================================================================================
-- Improvements
--==========================================================================================================================
-- Improvements
--------------------------------
INSERT INTO Improvements
		(Type,							SpecificCivRequired,	CivilizationType,			Description,							Civilopedia, 								Help,										ArtDefineTag,					ImprovementResource, ImprovementResourceQuantity,MountainsMakesValid,PillageGold,	IconAtlas,			PortraitIndex)
SELECT	'IMPROVEMENT_JAR_YAKPASTURE',	1,						'CIVILIZATION_JAR_TIBET',	'TXT_KEY_IMPROVEMENT_JAR_YAKPASTURE',	'TXT_KEY_IMPROVEMENT_JAR_YAKPASTURE_TEXT',	'TXT_KEY_IMPROVEMENT_JAR_YAKPASTURE_HELP',	'ART_DEF_IMPROVEMENT_PASTURE',	'RESOURCE_JAR_YAK',	 1,							1,					PillageGold,	'JAR_TIBET_ATLAS',	6
FROM Improvements  WHERE Type= 'IMPROVEMENT_PASTURE';
UPDATE Improvements SET NoTwoAdjacent=1 WHERE Type= 'IMPROVEMENT_JAR_YAKPASTURE';
------------------------------	
-- Improvement_Flavors
------------------------------	
INSERT INTO Improvement_Flavors	
		(ImprovementType, 				FlavorType,			Flavor)
SELECT	'IMPROVEMENT_JAR_YAKPASTURE',	'FLAVOR_GROWTH',	20 UNION ALL
SELECT	'IMPROVEMENT_JAR_YAKPASTURE',	'FLAVOR_PRODUCTION',20 UNION ALL
SELECT	'IMPROVEMENT_JAR_YAKPASTURE',	'FLAVOR_CULTURE',	10 UNION ALL
SELECT	'IMPROVEMENT_JAR_YAKPASTURE',	'FLAVOR_GOLD',		10;
------------------------------	
-- Improvement_ValidTerrains
------------------------------		
INSERT INTO Improvement_ValidTerrains 	
		(ImprovementType,				TerrainType)
SELECT	'IMPROVEMENT_JAR_YAKPASTURE', 	'TERRAIN_MOUNTAIN';
------------------------------	
-- Improvement_ResourceType_Yields
------------------------------
INSERT INTO Improvement_ResourceType_Yields 	
		(ImprovementType, 				ResourceType, 		YieldType,			Yield)
SELECT	'IMPROVEMENT_JAR_YAKPASTURE', 'RESOURCE_JAR_YAK',	'YIELD_FOOD', 		1 UNION ALL
SELECT	'IMPROVEMENT_JAR_YAKPASTURE', 'RESOURCE_JAR_YAK',	'YIELD_PRODUCTION', 1 UNION ALL
SELECT	'IMPROVEMENT_JAR_YAKPASTURE', 'RESOURCE_JAR_YAK',	'YIELD_GOLD', 		1 ;
------------------------------	
-- Improvement_Yields
------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType,				YieldType,		Yield)
SELECT	'IMPROVEMENT_JAR_YAKPASTURE',	YieldType,		Yield
FROM Improvement_Yields WHERE ImprovementType = 'IMPROVEMENT_PASTURE';
------------------------------
-- Improvement_TechYieldChanges
------------------------------
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,				TechType, YieldType, Yield)
SELECT	'IMPROVEMENT_JAR_YAKPASTURE',	'TECH_INDUSTRIALIZATION',	'YIELD_PRODUCTION',	2 UNION ALL
SELECT 	'IMPROVEMENT_JAR_YAKPASTURE',	TechType, YieldType, Yield
FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_PASTURE';
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,				YieldType,			Yield)
SELECT	 PolicyType,	'IMPROVEMENT_JAR_YAKPASTURE',	YieldType,			Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_PASTURE' UNION ALL
SELECT	 PolicyType,	'IMPROVEMENT_JAR_YAKPASTURE',	YieldType,			Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_MOAI';
------------------------------
-- Belief_ImprovementYieldChanges
------------------------------
INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 				YieldType, Yield)
SELECT	 BeliefType,	'IMPROVEMENT_JAR_YAKPASTURE',	YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_PASTURE' UNION ALL
SELECT	 BeliefType,	'IMPROVEMENT_JAR_YAKPASTURE',	YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_MOAI';
------------------------------	
-- Improvement_ResourceTypes
------------------------------
INSERT INTO Improvement_ResourceTypes
		(ImprovementType, 				ResourceType,		ResourceMakesValid, ResourceTrade)
SELECT	'IMPROVEMENT_JAR_YAKPASTURE', 'RESOURCE_JAR_YAK',	1,					1;
--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds		
		(Type,					PrereqTech,	ImprovementType, 				Description, 					Help, 									Recommendation, 					Time, EntityEvent, OrderPriority, 	IconIndex, 	IconAtlas)
SELECT 	'BUILD_JAR_YAKPASTURE',	'TECH_CONSTRUCTION',	'IMPROVEMENT_JAR_YAKPASTURE', 	'TXT_KEY_BUILD_JAR_YAKPASTURE', 'TXT_KEY_BUILD_JAR_YAKPASTURE_HELP',	'TXT_KEY_BUILD_JAR_YAKPASTURE_REC',	Time, EntityEvent, OrderPriority,	7,			'JAR_TIBET_ATLAS'
FROM Builds WHERE Type='BUILD_PASTURE';
--------------------------------
-- BuildFeatures
--------------------------------
INSERT INTO BuildFeatures
		(BuildType, 				FeatureType, PrereqTech, Production, Time, Remove)
SELECT	('BUILD_JAR_YAKPASTURE'),	FeatureType, PrereqTech, Production, Time, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_PASTURE';
------------------------------				
-- Unit_Builds
------------------------------				
INSERT INTO Unit_Builds	
		(UnitType, 	BuildType)
SELECT 	 Type,		'BUILD_JAR_YAKPASTURE' FROM Units WHERE Class='UNITCLASS_WORKER';
--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
---- Resources
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resources
		(Type, 				AnimalResource, LandResource, Description, 				Civilopedia, 						Help, 								ResourceClassType, Happiness, IsMonopoly, ArtDefineTag, 				CivilizationType, 			IconString, PortraitIndex, IconAtlas)
SELECT	'RESOURCE_JAR_YAK', AnimalResource, LandResource, 'TXT_KEY_RESOURCE_JAR_YAK',	'TXT_KEY_RESOURCE_JAR_YAK_TEXT',	'TXT_KEY_RESOURCE_JAR_YAK_HELP',	ResourceClassType, Happiness, IsMonopoly, 'ART_DEF_RESOURCE_JAR_YAK', 	'CIVILIZATION_JAR_TIBET', '[ICON_RES_JAR_YAK]', 10, 'JAR_TIBET_ATLAS'
FROM Resources WHERE Type = 'RESOURCE_IVORY';
------------------------------
-- Resource_CityYieldModFromMonopoly
------------------------------		
INSERT INTO Resource_CityYieldModFromMonopoly
		(ResourceType, YieldType, Yield)
SELECT 	 'RESOURCE_JAR_YAK', 'YIELD_FOOD', 5 UNION ALL
SELECT 	 'RESOURCE_JAR_YAK', 'YIELD_CULTURE', 5;
------------------------------
-- Resource_YieldChanges
------------------------------
INSERT INTO Resource_YieldChanges 	
		(ResourceType, 			YieldType, 		Yield)
SELECT 	 'RESOURCE_JAR_YAK',	'YIELD_FOOD',		2 UNION ALL
SELECT 	 'RESOURCE_JAR_YAK',	'YIELD_PRODUCTION',	1 UNION ALL
SELECT 	 'RESOURCE_JAR_YAK',	'YIELD_CULTURE',	1;
------------------------------
-- Corporation_ResourceYieldChanges
------------------------------
INSERT INTO Corporation_ResourceYieldChanges
		(CorporationType, ResourceType, 		YieldType, Yield)
SELECT	 CorporationType, 'RESOURCE_JAR_YAK',	YieldType, Yield
FROM Corporation_ResourceYieldChanges WHERE CorporationType='CORPORATION_CENTAURUS_EXTRACTORS';
------------------------------
-- Corporation_ResourceMonopolyOrs
------------------------------
INSERT INTO Corporation_ResourceMonopolyOrs
		(CorporationType, 					ResourceType)
SELECT	'CORPORATION_CENTAURUS_EXTRACTORS',	'RESOURCE_JAR_YAK';
------------------------------
-- Building_LocalResourceOrs
------------------------------
INSERT INTO Building_LocalResourceOrs
		(BuildingType,	ResourceType)
SELECT	BuildingType,	'RESOURCE_JAR_YAK'
FROM Building_LocalResourceOrs  WHERE ResourceType='RESOURCE_COW';
------------------------------
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges
		(BuildingType, 	ResourceType, 		YieldType, Yield)
SELECT	BuildingType, 	'RESOURCE_JAR_YAK', YieldType, Yield
FROM Building_ResourceYieldChanges WHERE ResourceType='RESOURCE_COW';
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------
INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 					Type, 								Description)
VALUES	('BUILDING_JAR_DUMMY_DOBDOB',		'BUILDINGCLASS_JAR_DUMMY_DOBDOB',	'TXT_KEY_BUILDING_JAR_DUMMY_DOBDOB'),
	('BUILDING_JAR_DUMMY_TIBETUA',		'BUILDINGCLASS_JAR_DUMMY_TIBETUA',	'TXT_KEY_BUILDING_JAR_DUMMY_TIBETUA');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings
		(Type, 					BuildingClass,	Cost,	GoldMaintenance,	FaithCost,	ConversionModifier,	ReligiousPressureModifier,	AlwaysHeal,	GreatWorkSlotType, GreatWorkCount, ReligiousUnrestFlatReduction,	PrereqTech,		Help,									Description,						Civilopedia,							Strategy,									ArtDefineTag,	MinAreaSize,	HurryCostModifier,	NeverCapture,	IconAtlas,			PortraitIndex)
SELECT	('BUILDING_JAR_KUMBUM'),BuildingClass,	250,	GoldMaintenance,	300,		-15,				50,							10,			GreatWorkSlotType, GreatWorkCount, ReligiousUnrestFlatReduction,	'TECH_THEOLOGY',('TXT_KEY_BUILDING_JAR_KUMBUM_HELP'),	('TXT_KEY_BUILDING_JAR_KUMBUM'),	('TXT_KEY_BUILDING_JAR_KUMBUM_TEXT'),	('TXT_KEY_BUILDING_JAR_KUMBUM_STRATEGY'),	ArtDefineTag,	MinAreaSize,	HurryCostModifier,	1,				('JAR_TIBET_ATLAS'),	3
FROM Buildings WHERE (Type = 'BUILDING_TEMPLE');

INSERT OR REPLACE INTO Buildings
(Type, 						 	BuildingClass, 						IsDummy,	Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	MinAreaSize,	NeverCapture,	Description, 							Help) VALUES	
('BUILDING_JAR_DUMMY_DOBDOB', 	'BUILDINGCLASS_JAR_DUMMY_DOBDOB',	1,			-1,		-1,			-1,				null,		-1,				1,				'TXT_KEY_BUILDING_JAR_DUMMY_DOBDOB',	'TXT_KEY_BUILDING_JAR_DUMMY_DOBDOB_HELP'),
('BUILDING_JAR_DUMMY_TIBETUA', 	'BUILDINGCLASS_JAR_DUMMY_TIBETUA',	1,			-1,		-1,			-1,				null,		-1,				1,				'TXT_KEY_BUILDING_JAR_DUMMY_TIBETUA',	'TXT_KEY_BUILDING_JAR_DUMMY_TIBETUA_HELP');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,		Flavor)
SELECT	('BUILDING_JAR_KUMBUM'),	'FLAVOR_CULTURE',	10 UNION ALL
SELECT	('BUILDING_JAR_KUMBUM'),	FlavorType,		Flavor+10
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_TEMPLE');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,		Yield)
SELECT	('BUILDING_JAR_KUMBUM'),	'YIELD_CULTURE',1	UNION ALL
SELECT	('BUILDING_JAR_KUMBUM'),	YieldType,		Yield+1
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_TEMPLE');
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldFromYieldPercent
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldFromYieldPercent
(BuildingType, 					YieldIn, 		YieldOut, 		Value) VALUES
('BUILDING_JAR_DUMMY_DOBDOB', 	'YIELD_FAITH', 	'YIELD_PRODUCTION', 15);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldFromYieldPercentGlobal
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldFromYieldPercentGlobal
(BuildingType, 					YieldIn, 		YieldOut, 		Value) VALUES
('BUILDING_JAR_DUMMY_TIBETUA', 	'YIELD_FAITH', 	'YIELD_CULTURE', 20),
('BUILDING_JAR_DUMMY_TIBETUA', 	'YIELD_FAITH', 	'YIELD_GREAT_GENERAL_POINTS', 10);
------------------------------	
-- Building_ResourceYieldChanges
------------------------------		
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 				ResourceType,	YieldType,		Yield)
SELECT	('BUILDING_JAR_KUMBUM'),	ResourceType,	YieldType,		Yield
FROM Building_ResourceYieldChanges WHERE (BuildingType = 'BUILDING_TEMPLE');
------------------------------	
-- Building_YieldFromFaithPurchase
------------------------------		
INSERT INTO Building_YieldFromFaithPurchase 	
		(BuildingType, 			YieldType,		Yield)
VALUES	('BUILDING_JAR_KUMBUM',	'YIELD_GOLDEN_AGE_POINTS',	15);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
SELECT	'BUILDING_JAR_KUMBUM',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type,					Class, 	PrereqTech,	Range, BaseSightRange, Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	GlobalFaithPurchaseCooldown, PurchaseCooldown,	MoveAfterPurchase,	Moves, 		Immobile, CombatClass, Domain, DefaultUnitAI, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	Description, 					Civilopedia, 						Strategy, 								Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,				PortraitIndex, 	IconAtlas,			MoveRate)
SELECT	'UNIT_JAR_RTAKHRAB',	Class,	PrereqTech,	Range, BaseSightRange, Combat,	150,	250,		0,								GlobalFaithPurchaseCooldown, PurchaseCooldown,	MoveAfterPurchase,	Moves-1, 	Immobile, CombatClass, Domain, DefaultUnitAI, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	'TXT_KEY_UNIT_JAR_RTAKHRAB',	'TXT_KEY_CIV5_JAR_RTAKHRAB_TEXT',	'TXT_KEY_UNIT_JAR_RTAKHRAB_STRATEGY',	'TXT_KEY_UNIT_JAR_RTAKHRAB_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_JAR_RTAKHRAB', 	0,					'UNIT_JAR_RTAKHRAB_FLAG',	2,				'JAR_TIBET_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_KNIGHT';

INSERT INTO Units 	
		(Type,				Class, 					UnitEraUpgrade,	Combat, BaseSightRange, Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	RequiresEnhancedReligion,	ProhibitsSpread,	RemoveHeresy,	GlobalFaithPurchaseCooldown, PurchaseCooldown,	MoveAfterPurchase,	Moves, 	Immobile, CombatClass, Domain, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	Description, 				Civilopedia, 					Strategy, 							Help, 							Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,			PortraitIndex, 	IconAtlas,			MoveRate)
SELECT	'UNIT_JAR_DOBDOB',	'UNITCLASS_INQUISITOR',	1,				Combat, BaseSightRange, -1,		300,		0,								1,							1,					1,				0, 							 PurchaseCooldown,	MoveAfterPurchase,	Moves, 	Immobile, CombatClass, Domain, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	'TXT_KEY_UNIT_JAR_DOBDOB',	'TXT_KEY_CIV5_JAR_DOBDOB_TEXT',	'TXT_KEY_UNIT_JAR_DOBDOB_STRATEGY',	'TXT_KEY_UNIT_JAR_DOBDOB_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_JAR_DOBDOB', 	0,					'UNIT_JAR_DOBDOB_FLAG',	5,				'JAR_TIBET_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_SPEARMAN';
--------------------------------	
-- Unit_EraCombatStrength
--------------------------------
INSERT INTO Unit_EraCombatStrength 	
		(UnitType, 			EraType,			CombatStrength)
SELECT	'UNIT_JAR_DOBDOB',	'ERA_MEDIEVAL',		Combat FROM Units WHERE Type='UNIT_PIKEMAN' UNION ALL
SELECT	'UNIT_JAR_DOBDOB',	'ERA_RENAISSANCE',	Combat FROM Units WHERE Type='UNIT_SPANISH_TERCIO' UNION ALL
SELECT	'UNIT_JAR_DOBDOB',	'ERA_ENLIGHTENMENT',	Combat+3 FROM Units WHERE Type='UNIT_SPANISH_TERCIO' AND EXISTS (SELECT * FROM Eras WHERE Type = 'ERA_ENLIGHTENMENT') UNION ALL
SELECT	'UNIT_JAR_DOBDOB',	'ERA_INDUSTRIAL',	Combat-5 FROM Units WHERE Type='UNIT_RIFLEMAN' UNION ALL
SELECT	'UNIT_JAR_DOBDOB',	'ERA_MODERN',		Combat FROM Units WHERE Type='UNIT_RIFLEMAN' ;
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JAR_RTAKHRAB',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';	

INSERT INTO UnitGameplay2DScripts
       (UnitType,			SelectionSound, FirstSelectionSound)
SELECT 'UNIT_JAR_DOBDOB',  	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_INQUISITOR';
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JAR_RTAKHRAB',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_KNIGHT';
	
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_JAR_DOBDOB',	UnitAIType FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN' UNION ALL
SELECT	'UNIT_JAR_DOBDOB',	UnitAIType FROM Unit_AITypes WHERE UnitType = 'UNIT_INQUISITOR' UNION ALL
SELECT	'UNIT_JAR_DOBDOB',	UnitAIType FROM Unit_AITypes WHERE UnitType = 'UNIT_MISSIONARY';
--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors
       (UnitType,          FlavorType, Flavor)
SELECT 'UNIT_JAR_RTAKHRAB',FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';
	
INSERT INTO Unit_Flavors
       (UnitType,          FlavorType, Flavor)
SELECT 'UNIT_JAR_DOBDOB',  FlavorType, Flavor FROM Unit_Flavors WHERE UnitType = 'UNIT_PIKEMAN' UNION ALL
SELECT 'UNIT_JAR_DOBDOB',  FlavorType, Flavor FROM Unit_Flavors WHERE UnitType = 'UNIT_INQUISITOR';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType)
SELECT	'UNIT_JAR_RTAKHRAB',	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_KNIGHT';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JAR_RTAKHRAB',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_KNIGHT';

UPDATE Units SET
ObsoleteTech = (select a.ObsoleteTech from Units a, Unit_ClassUpgrades b, UnitClasses c WHERE b.UnitType='UNIT_JAR_RTAKHRAB' and b.UnitClassType=c.Type and c.DefaultUnit=a.Type)
WHERE (Type = 'UNIT_JAR_RTAKHRAB');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JAR_RTAKHRAB',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JAR_DOBDOB',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_WARRIOR';

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
VALUES	('UNIT_JAR_RTAKHRAB',	'PROMOTION_JAR_RTAKHRAB1'),
	('UNIT_JAR_RTAKHRAB',	'PROMOTION_JAR_RTAKHRAB2'),
	('UNIT_JAR_DOBDOB',	'PROMOTION_IGNORE_TERRAIN_COST'),
	('UNIT_JAR_DOBDOB',	'PROMOTION_JAR_SHERPA'),
	('UNIT_JAR_DOBDOB',	'PROMOTION_JAR_TIBETANTHEOCRACY'),
	('UNIT_JAR_DOBDOB',	'PROMOTION_JAR_MONASTICPOLICE'),
	('UNIT_JAR_DOBDOB',	'PROMOTION_JAR_AIDEWORDLYMATTERS');
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions 
(Type, 								Description, 								Help, 											Sound, 			LostWithUpgrade, OrderPriority, CannotBeChosen,	PortraitIndex, 	IconAtlas,				PediaType, 			PediaEntry) VALUES
('PROMOTION_JAR_SHERPA',			'TXT_KEY_PROMOTION_JAR_SHERPA',				'TXT_KEY_PROMOTION_JAR_SHERPA_HELP',			'AS2D_IF_LEVELUP',	0,				 0, 			1,			0, 				'JAR_TIBET_PROMO_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_SHERPA'),
('PROMOTION_JAR_RTAKHRAB1',			'TXT_KEY_PROMOTION_JAR_RTAKHRAB1',			'TXT_KEY_PROMOTION_JAR_RTAKHRAB1_HELP',			'AS2D_IF_LEVELUP',	0,				 0, 			1,			1, 				'JAR_TIBET_PROMO_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_RTAKHRAB1'),
('PROMOTION_JAR_RTAKHRAB2', 		'TXT_KEY_PROMOTION_JAR_RTAKHRAB2',			'TXT_KEY_PROMOTION_JAR_RTAKHRAB2_HELP',			'AS2D_IF_LEVELUP',	1,				 0, 			1,			2, 				'JAR_TIBET_PROMO_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_RTAKHRAB2'),
('PROMOTION_JAR_TIBETANTHEOCRACY',	'TXT_KEY_PROMOTION_JAR_TIBETANTHEOCRACY',	'TXT_KEY_PROMOTION_JAR_TIBETANTHEOCRACY_HELP',	'AS2D_IF_LEVELUP',	0,				 0, 			1,			5, 				'JAR_TIBET_PROMO_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_TIBETANTHEOCRACY'),
('PROMOTION_JAR_MONASTICPOLICE',	'TXT_KEY_PROMOTION_JAR_MONASTICPOLICE',		'TXT_KEY_PROMOTION_JAR_MONASTICPOLICE_HELP',	'AS2D_IF_LEVELUP',	0,				 0, 			1,			3, 				'JAR_TIBET_PROMO_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_MONASTICPOLICE'),
('PROMOTION_JAR_AIDEWORDLYMATTERS',	'TXT_KEY_PROMOTION_JAR_AIDEWORDLYMATTERS',	'TXT_KEY_PROMOTION_JAR_AIDEWORDLYMATTERS_HELP',	'AS2D_IF_LEVELUP',	0,				 0, 			1,			4, 				'JAR_TIBET_PROMO_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_AIDEWORDLYMATTERS');

UPDATE UnitPromotions SET CanCrossMountains= 1 WHERE Type = 'PROMOTION_JAR_SHERPA';
		
INSERT INTO UnitPromotions_UnitCombatMods
		(PromotionType, 			UnitCombatType, 		Modifier)
SELECT 	'PROMOTION_JAR_RTAKHRAB1', 	'UNITCOMBAT_MELEE', 	33 UNION ALL
SELECT 	'PROMOTION_JAR_RTAKHRAB1', 	'UNITCOMBAT_GUN', 		33 UNION ALL
SELECT 	'PROMOTION_JAR_RTAKHRAB1', 	'UNITCOMBAT_ARCHER', 	33;
--==========================================================================================================================
-- Missions
--==========================================================================================================================
INSERT INTO Missions
		(Type,							Description, 							Help,										DisabledHelp,									Time,	Build,	Target, Sound,	HotKey,	HotKeyPriority, OrderPriority,	Visible, EntityEventType, 			IconIndex, IconAtlas)
SELECT	'MISSION_JAR_KILL_MISSIONARY',	'TXT_KEY_MISSION_JAR_KILL_MISSIONARY',	'TXT_KEY_MISSION_JAR_KILL_MISSIONARY_HELP',	'TXT_KEY_MISSION_JAR_KILL_MISSIONARY_DISABLED',	20,		0,		0,		0,		'KB_U',	2,				150,			1,		 NULL,						0,		    'JAR_DOBDOB_ACTION_ATLAS';
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
		(Type, 							Description, 							Civilopedia, 									CivilopediaTag, 									ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_JAR_SONGTSEN_GAMPO', 	'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO', 	'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO', 			'TXT_KEY_CIVILOPEDIA_LEADERS_JAR_SONGTSEN_GAMPO', 	'Tibet_Leaderhead.xml',		8, 						6, 						4, 							7, 			3, 				6, 				8, 						6, 				4, 			6, 			7, 				5, 			4, 			'JAR_TIBET_ATLAS', 		0);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES		('LEADER_JAR_SONGTSEN_GAMPO', 	'MAJOR_CIV_APPROACH_WAR', 			8),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES		('LEADER_JAR_SONGTSEN_GAMPO', 	'MINOR_CIV_APPROACH_IGNORE', 		8),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'MINOR_CIV_APPROACH_BULLY', 		6);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 					FlavorType, 						Flavor)
VALUES		('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_OFFENSE', 					8),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_RECON', 					4),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_RANGED', 					6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_MOBILE', 					8),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_NAVAL', 					3),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_AIR', 						6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_EXPANSION', 				9),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_GOLD', 						5),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_SCIENCE', 					6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_CULTURE', 					8),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_WONDER', 					7),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_RELIGION', 					9),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_DIPLOMACY', 				3),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_SPACESHIP', 				5),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_NUKE', 						6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_USE_NUKE', 					5),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_AIRLIFT', 					4),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_I_TRADE_ORIGIN', 			6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		3),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_ARCHAEOLOGY', 				6),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'FLAVOR_AIR_CARRIER', 				7);
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================			
INSERT INTO Diplomacy_Responses 
			(LeaderType, 					ResponseType, 											Response, 																			Bias)
VALUES		('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_FIRST_GREETING', 								'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_FIRSTGREETING%', 								2),	
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_DEFEATED', 									'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DEFEATED%', 										2),	
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_REPEAT_TOO_MUCH', 					'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_REPEAT_TOO_MUCH%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_REPEAT_TRADE_TOO_MUCH', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_REPEAT_TRADE_TOO_MUCH%', 						2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_HOSTILE_REPEAT', 					'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_REPEAT_TOO_MUCH%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_HOSTILE_HELLO', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_HOSTILE_HELLO%', 						2),	
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_POLITE_HELLO', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_POLITE_HELLO%', 						2),	
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_HOSTILE_HUMAN_AT_WAR', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_HOSTILE_HUMAN_AT_WAR%', 				2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_HUMAN_AT_WAR', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_HUMAN_AT_WAR%', 						2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 		'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 			2),	
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_AGGRESSIVE_MILITARY', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_AGGRESSIVE_MILITARY_WARNING%', 					2),	
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_HOSTILE_AGGRESSIVE_PLOT_BUYING', 	'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_HOSTILE_AGGRESSIVE_PLOT_BUYING%', 		2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_AGGRESSIVE_PLOT_BUYING', 			'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_AGGRESSIVE_PLOT_BUYING%', 				2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_HOSTILE_AGGRESSIVE_EXPANSION', 		'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_HOSTILE_AGGRESSIVE_EXPANSION%', 		2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_AGGRESSIVE_EXPANSION', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_AGGRESSIVE_EXPANSION%', 				2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_FRIENDLY_STRONG_MILITARY', 			'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_FRIENDLY_STRONG_MILITARY%', 			2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_FRIENDLY_STRONG_ECONOMY', 			'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_FRIENDLY_STRONG_ECONOMY%', 				2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_HOSTILE_HUMAN_FEW_CITIES', 			'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_HOSTILE_HUMAN_FEW_CITIES%', 			2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_HOSTILE_HUMAN_SMALL_ARMY', 			'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_HOSTILE_HUMAN_SMALL_ARMY%', 			2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_GREETING_HOSTILE_HUMAN_IS_WARMONGER', 		'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GREETING_HOSTILE_HUMAN_IS_WARMONGER%', 			2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_TOO_SOON_FOR_DOF', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_TOO_SOON_FOR_DOF%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_RESPONSE_TO_BEING_DENOUNCED%', 					2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_WORK_AGAINST_SOMEONE', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DENOUNCE%', 										2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_AI_DOF_BACKSTAB', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DENOUNCE%', 										2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_RESPONSE_TO_BEING_DENOUNCED%', 					2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_DOFED_FRIEND', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_HUMAN_DOFED_FRIEND%', 							2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_DOFED_ENEMY', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_HUMAN_DOFED_ENEMY%', 							2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_DENOUNCED_ENEMY', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_HUMAN_DENOUNCED_ENEMY%', 						2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_DENOUNCED_FRIEND', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_HUMAN_DENOUNCED_FRIEND%', 						2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_DOF_SO_AI_DOF', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_HUMAN_DOF_SO_AI_DOF%', 							2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_DENOUNCE_SO_AI_DENOUNCE', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_HUMAN_DENOUNCE_SO_AI_DENOUNCE%', 				2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_DOF_SO_AI_DENOUNCE', 					'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_HUMAN_DOF_SO_AI_DENOUNCE%', 						2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_COOP_WAR_REQUEST', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_COOP_WAR_REQUEST%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_COOP_WAR_TIME', 								'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_COOP_WAR_TIME%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_WORK_WITH_US', 								'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DEC_FRIENDSHIP%', 								2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_PLOT_BUYING_WARNING', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_PLOT_BUYING_WARNING%', 							2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_PLOT_BUYING_SERIOUS_WARNING%', 					2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_EXPANSION_SERIOUS_WARNING', 					'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_EXPANSION_SERIOUS_WARNING%', 					2),	
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_EXPANSION_WARNING', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_EXPANSION_WARNING%', 							2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_AGGRESSIVE_MILITARY_WARNING', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_AGGRESSIVE_MILITARY_WARNING%', 					2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_INSULT_UNHAPPINESS', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_INSULT_UNHAPPINESS%', 							2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_INSULT_CITIES', 								'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_INSULT_CITIES%', 								2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_INSULT_BULLY', 								'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_INSULT_BULLY%', 									2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_INSULT_MILITARY', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_INSULT_MILITARY%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_INSULT_GENERIC', 								'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_INSULT_GENERIC%', 							2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_INSULT_CULTURE', 								'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_INSULT_CULTURE%', 								2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_INSULT_POPULATION', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_INSULT_POPULATION%', 							2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_RETURNED_CIVILIAN', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_RETURNED_CIVILIAN%', 							2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_DECLARATION_PROTECT_CITY_STATE', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DECLARATION_PROTECT_CITY_STATE%', 				2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_DECLARATION_ABANDON_CITY_STATE', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DECLARATION_ABANDON_CITY_STATE%', 				2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_DONT_SETTLE_YES', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DONT_SETTLE_YES%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_DONT_SETTLE_NO', 								'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DONT_SETTLE_NO%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_LUXURY_TRADE', 								'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_LUXURY_TRADE%', 									2),	
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_OPEN_BORDERS_EXCHANGE', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_OPEN_BORDERS_EXCHANGE%', 						2),	
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_REQUEST', 									'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_RESPONSE_REQUEST%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_ATTACKED_HOSTILE', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_ATTACKED_HOSTILE%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_ATTACKED_WEAK_HOSTILE', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_ATTACKED_HOSTILE%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_ATTACKED_STRONG_HOSTILE', 					'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_ATTACKED_HOSTILE%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_ATTACKED_EXCITED', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_ATTACKED_EXCITED%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_ATTACKED_WEAK_EXCITED', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_ATTACKED_EXCITED%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_ATTACKED_STRONG_EXCITED', 					'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_ATTACKED_EXCITED%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_ATTACKED_SAD', 								'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_ATTACKED_SAD%', 									2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_ATTACKED_BETRAYED', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_ATTACKED_BETRAYED%', 							2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_DOW_GENERIC', 								'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DOW_GENERIC%', 									2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_DOW_LAND', 									'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DOW_LAND%', 										2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_DOW_WORLD_CONQUEST', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DOW_WORLD_CONQUEST%', 							2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_DOW_OPPORTUNITY', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DOW_OPPORTUNITY%', 								2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_DOW_DESPERATE', 								'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DOW_DESPERATE%', 								2),
--			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_DOW_REGRET', 									'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_DOW_REGRET%', 									2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_TOO_SOON_NO_PEACE', 							'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_TOO_SOON_NO_PEACE%', 							2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING_GOOD',	'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GOOD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_AGGRESSIVE_MILITARY_WARNING_BAD',				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GOOD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HOSTILE_WE_ATTACKED_MINOR_BAD',				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GOOD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_WE_ATTACKED_MINOR_BAD',						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_GOOD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING_BAD', 	'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_BAD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_ATTACKED_MINOR_BAD', 					'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_BAD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_SERIOUS_EXPANSION_WARNING_BAD', 		'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_BAD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_SERIOUS_PLOT_BUYING_WARNING_BAD', 		'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_BAD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_PLOT_BUYING_WARNING_BAD', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_BAD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_AGGRESSIVE_MILITARY_WARNING_GOOD', 			'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_BAD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HOSTILE_WE_ATTACKED_MINOR_GOOD', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_BAD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_WE_ATTACKED_MINOR_GOOD', 						'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_BAD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_ATTACKED_MINOR_GOOD', 					'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_BAD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_SERIOUS_EXPANSION_WARNING_GOOD', 		'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_BAD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_SERIOUS_PLOT_BUYING_WARNING_GOOD', 		'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_BAD%', 											2),
			('LEADER_JAR_SONGTSEN_GAMPO', 	'RESPONSE_HUMAN_PLOT_BUYING_WARNING_GOOD', 				'TXT_KEY_LEADER_JAR_SONGTSEN_GAMPO_BAD%', 											2);	
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 					TraitType)
VALUES		('LEADER_JAR_SONGTSEN_GAMPO', 	'TRAIT_JAR_TIBET');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 					Description, 					ShortDescription)
VALUES		('TRAIT_JAR_TIBET', 	'TXT_KEY_TRAIT_JAR_TIBET', 		'TXT_KEY_TRAIT_JAR_TIBET_SHORT');
--==========================================================================================================================	
-- Trait_FreePromotionUnitCombats
--==========================================================================================================================	
INSERT INTO Trait_FreePromotionUnitCombats 
			(TraitType,			UnitCombatType,					PromotionType)				
VALUES		('TRAIT_JAR_TIBET',	'UNITCOMBAT_ARCHAEOLOGIST',		'PROMOTION_JAR_SHERPA'),
			('TRAIT_JAR_TIBET',	'UNITCOMBAT_DIPLOMACY',			'PROMOTION_JAR_SHERPA'),
			('TRAIT_JAR_TIBET',	'UNITCOMBAT_INQUISITOR',		'PROMOTION_JAR_SHERPA'),
			('TRAIT_JAR_TIBET',	'UNITCOMBAT_MISSIONARY',		'PROMOTION_JAR_SHERPA'),
			('TRAIT_JAR_TIBET',	'UNITCOMBAT_SPECIAL_PEOPLE',	'PROMOTION_JAR_SHERPA'),
			('TRAIT_JAR_TIBET',	'UNITCOMBAT_WORKER',			'PROMOTION_JAR_SHERPA'),
			('TRAIT_JAR_TIBET',	'UNITCOMBAT_SETTLER',			'PROMOTION_JAR_SHERPA'),
			('TRAIT_JAR_TIBET',	'UNITCOMBAT_RECON',				'PROMOTION_JAR_SHERPA');
--==========================================================================================================================	
-- Policies
--==========================================================================================================================	
INSERT INTO	Policies
(Type, 						Description, 						IsDummy) VALUES
('POLICY_JAR_TIBET',		'TXT_KEY_TRAIT_JAR_TIBET_SHORT',	1),
('POLICY_JAR_TIBET_JPE',	'TXT_KEY_TRAIT_JAR_TIBET_SHORT',	1),
('POLICY_JAR_TIBET2',		'TXT_KEY_TRAIT_JAR_TIBET_SHORT',	1),
('POLICY_JAR_TIBET3',		'TXT_KEY_TRAIT_JAR_TIBET_SHORT',	1);

INSERT INTO Policy_CityYieldChanges 
(PolicyType,			YieldType, 		Yield) VALUES
('POLICY_JAR_TIBET',	'YIELD_FAITH',	3), -- 3 beliefs found
('POLICY_JAR_TIBET2',	'YIELD_FAITH',	2), -- 2 beliefs enhance
('POLICY_JAR_TIBET3',   'YIELD_FAITH',	1), -- reform
('POLICY_JAR_TIBET_JPE','YIELD_FAITH',	1); -- pantheon
--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
		(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 				DawnOfManQuote, 								DawnOfManAudio,						DawnOfManImage)
SELECT	('CIVILIZATION_JAR_TIBET'), 	('TXT_KEY_CIV_JAR_TIBET_DESC'), 	('TXT_KEY_CIV_JAR_TIBET_SHORT_DESC'), 		('TXT_KEY_CIV_JAR_TIBET_ADJECTIVE'), 	('TXT_KEY_CIV_JAR_TIBET_SHORT_DESC'), 	('TXT_KEY_CIV5_JAR_TIBET'), 	('PLAYERCOLOR_JAR_TIBET'), 		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JAR_TIBET_ATLAS'), 	1, 				('JAR_TIBET_ALPHA_ATLAS'), 	('China'), 		('Tibet_Map512.dds'), 	('TXT_KEY_CIV5_DOM_JAR_SONGTSEN_GAMPO_TEXT'),	('AS2D_DOM_SPEECH_JAR_TIBET'), 		('DOM_Tibet.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_CHINA');

INSERT INTO MajorBlocksMinor
(MajorCiv, 					MinorCiv) VALUES
('CIVILIZATION_JAR_TIBET', 'MINOR_CIV_LHASA');
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_01'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_02'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_03'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_04'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_05'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_06'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_07'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_08'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_09'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_10'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_11'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_12'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_13'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_14'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_15'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_16'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_17'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_18'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_19'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_20'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_21'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_22'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_23'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_24'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_25'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_26'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_27'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_28'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_29'),
			('CIVILIZATION_JAR_TIBET', 		'TXT_KEY_CITY_NAME_JAR_TIBET_30');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JAR_TIBET'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_CHINA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 			TechType)
SELECT		('CIVILIZATION_JAR_TIBET'), TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_CHINA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JAR_TIBET'), UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_CHINA');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JAR_TIBET', 		'LEADER_JAR_SONGTSEN_GAMPO');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 			UnitType)
SELECT	'CIVILIZATION_JAR_TIBET', 	'UNITCLASS_INQUISITOR', 'UNIT_JAR_DOBDOB' UNION ALL
SELECT	'CIVILIZATION_JAR_TIBET', 	'UNITCLASS_KNIGHT', 	'UNIT_JAR_RTAKHRAB';
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
SELECT	'CIVILIZATION_JAR_TIBET', 	'BUILDINGCLASS_TEMPLE',		'BUILDING_JAR_KUMBUM';
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
VALUES		('CIVILIZATION_JAR_TIBET', 	'RELIGION_BUDDHISM');
--==========================================================================================================================	
-- Civilization_Start_Prefer_Mountain
--==========================================================================================================================		
INSERT INTO Civilization_Start_Prefer_Mountain
			(CivilizationType,			StartPreferMountain)
VALUES		('CIVILIZATION_JAR_TIBET',	1);	
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 			RegionType)
VALUES		('CIVILIZATION_JAR_TIBET', 	'REGION_HILLS');

INSERT OR REPLACE INTO Civilization_Start_Region_Priority 
			(CivilizationType, 			RegionType)
VALUES		('CIVILIZATION_INCA', 		'REGION_HILLS');	
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 			SpyName)
VALUES	('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_0'),	
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_1'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_2'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_3'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_4'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_5'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_6'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_7'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_8'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_9'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_10'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_11'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_12'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_13'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_14'),
		('CIVILIZATION_JAR_TIBET', 	'TXT_KEY_SPY_NAME_JAR_TIBET_15');
--==========================================================================================================================
--==========================================================================================================================
