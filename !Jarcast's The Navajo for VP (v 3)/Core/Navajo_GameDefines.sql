--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_MINORS_INTERACTION';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_GREAT_PEOPLE';
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 
(DefaultBuilding, 				Type, 								Description,						NoLimit) VALUES
('BUILDING_JAR_HOZHOOJI',		'BUILDINGCLASS_JAR_HOZHOOJI',		'TXT_KEY_TRAIT_JAR_NAVAJO_SHORT',		0),
('BUILDING_JAR_DUMMY_GWORKS',	'BUILDINGCLASS_JAR_DUMMY_GWORKS',	'TXT_KEY_BUILDING_JAR_DUMMY_GWORKS',	1),
('BUILDING_JAR_HOGAN',			'BUILDINGCLASS_JAR_HOGAN',			'TXT_KEY_IMPROVEMENT_JAR_HOGAN',		1),
('BUILDING_JAR_HOGAN_MUS',		'BUILDINGCLASS_JAR_HOGAN_MUS',		'TXT_KEY_BUILDING_JAR_HOGAN_MUS',		1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings
(Type, 						 	BuildingClass, 						IsDummy,	Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	MinAreaSize,	NeverCapture,	Description) VALUES	
('BUILDING_JAR_DUMMY_GWORKS', 	'BUILDINGCLASS_JAR_DUMMY_GWORKS',	1,			-1,		-1,			-1,				null,		-1,				1,				'TXT_KEY_BUILDING_JAR_DUMMY_GWORKS'),
('BUILDING_JAR_HOGAN', 			'BUILDINGCLASS_JAR_HOGAN',			0,			-1,		-1,			2,				null,		-1,				1,				'TXT_KEY_IMPROVEMENT_JAR_HOGAN'),
('BUILDING_JAR_HOGAN_MUS', 		'BUILDINGCLASS_JAR_HOGAN_MUS',		1,			-1,		-1,			-1,				null,		-1,				1,				'TXT_KEY_BUILDING_JAR_HOGAN_MUS'),
('BUILDING_JAR_HOZHOOJI', 		'BUILDINGCLASS_JAR_HOZHOOJI',		0,			-1,		-1,			1,				null,		-1,				1,				'TXT_KEY_TRAIT_JAR_NAVAJO_SHORT');
UPDATE Buildings SET UnmoddedHappiness= 1, ReligiousPressureModifier= 5, ConversionModifier = -2 WHERE Type = 'BUILDING_JAR_DUMMY_GWORKS';
UPDATE Buildings SET PortraitIndex=4, IconAtlas='JAR_NAVAJO_ICON_ATLAS', GreatWorkSlotType= 'GREAT_WORK_SLOT_MUSIC',
ThemingBonusHelp='TXT_KEY_THEMING_BONUS_HOGAN_HELP' WHERE Type = 'BUILDING_JAR_HOGAN';
UPDATE Buildings SET SpecialistType='SPECIALIST_MUSICIAN', GreatPeopleRateChange= 1 WHERE Type = 'BUILDING_JAR_HOGAN_MUS';
UPDATE Buildings SET PortraitIndex= 2, IconAtlas='JAR_NAVAJO_ICON_ATLAS', GreatWorkSlotType= 'GREAT_WORK_SLOT_MUSIC'
WHERE Type = 'BUILDING_JAR_HOZHOOJI';

INSERT INTO Buildings 	
		(Type,					BuildingClass,	GoldMaintenance,	Cost, 			 	FaithCost, 				NoUnhappfromXSpecialists, EnhancedYieldTech, TechEnhancedTourism, 	AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DistressFlatReduction, GreatPeopleRateModifier,	FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech,	ArtDefineTag, SpecialistType,		SpecialistCount,	MinAreaSize, ConquestProb, HurryCostModifier,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	IsNoRiver,	MutuallyExclusiveGroup,	AllowsProductionTradeRoutes,	Help,							Description,				Civilopedia,						Strategy,							IconAtlas,				PortraitIndex)
SELECT	'BUILDING_JAR_ATLOOH',	BuildingClass,	GoldMaintenance+2,	round(Cost*1.10), 	round(FaithCost*1.10), 	NoUnhappfromXSpecialists, 'TECH_RADIO',						2, 		AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DistressFlatReduction, GreatPeopleRateModifier, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech,	ArtDefineTag, 'SPECIALIST_ARTIST',	SpecialistCount,	MinAreaSize, ConquestProb, HurryCostModifier,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	IsNoRiver,	MutuallyExclusiveGroup,	AllowsProductionTradeRoutes,	'TXT_KEY_BUILDING_ATLOOH_HELP',	'TXT_KEY_BUILDING_ATLOOH', 'TXT_KEY_CIV5_BUILDING_ATLOOH_TEXT',	'TXT_KEY_BUILDING_ATLOOH_STRATEGY',	'JAR_NAVAJO_ICON_ATLAS',	10
FROM Buildings WHERE Type = 'BUILDING_WORKSHOP';
UPDATE Buildings SET GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 1 WHERE Type = 'BUILDING_JAR_ATLOOH';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ThemingBonuses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ThemingBonuses
		(BuildingType,		Description, 					Bonus, RequiresOwner, AIPriority)
SELECT	'BUILDING_JAR_HOGAN','TXT_KEY_THEMING_BONUS_HOGAN', 6, 		1,				2;
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
SELECT	'BUILDING_JAR_ATLOOH',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_WORKSHOP';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType, Flavor)
SELECT	'BUILDING_JAR_ATLOOH',	FlavorType, Flavor FROM Building_Flavors WHERE BuildingType = 'BUILDING_WORKSHOP' UNION ALL
SELECT	'BUILDING_JAR_ATLOOH',	'FLAVOR_CULTURE', 10 UNION ALL
SELECT	'BUILDING_JAR_ATLOOH',	'FLAVOR_HAPPINESS', 10;
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 			YieldType,	Yield)
SELECT	'BUILDING_JAR_ATLOOH',	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_WORKSHOP';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChangesPerPop
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChangesPerPop 	
		(BuildingType,			YieldType,		Yield)
SELECT	'BUILDING_JAR_ATLOOH',	YieldType,		Yield FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_WORKSHOP' UNION ALL
SELECT	'BUILDING_JAR_ATLOOH',	'YIELD_CULTURE',Yield
FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_WORKSHOP' AND YieldType='YIELD_PRODUCTION';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldFromInternalTR
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldFromInternalTR 	
		(BuildingType, 			YieldType, Yield)
SELECT	'BUILDING_JAR_ATLOOH', 	YieldType, Yield
FROM Building_YieldFromInternalTR WHERE BuildingType = 'BUILDING_WORKSHOP';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,			ResourceType,		YieldType,		Yield)
VALUES	('BUILDING_JAR_ATLOOH',	'RESOURCE_SHEEP',	'YIELD_GOLD',	2);
--------------------------------------------------------------------------------------------------------------------------	
-- Building_TerrainYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_TerrainYieldChanges
		(BuildingType, 			TerrainType, YieldType, Yield)
SELECT 	'BUILDING_JAR_ATLOOH',	Type, 		'YIELD_PRODUCTION', 1 FROM Terrains WHERE Type IN ('TERRAIN_PLAINS','TERRAIN_DESERT');
--------------------------------------------------------------------------------------------------------------------------	
-- Building_SpecialistYieldChangesLocal
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_SpecialistYieldChangesLocal
		(BuildingType, 			SpecialistType,		YieldType, Yield)
VALUES	('BUILDING_JAR_ATLOOH', 'SPECIALIST_ARTIST', 'YIELD_PRODUCTION', 2),
		('BUILDING_JAR_ATLOOH', 'SPECIALIST_ARTIST', 'YIELD_FAITH', 2),
		('BUILDING_JAR_ATLOOH', 'SPECIALIST_ARTIST', 'YIELD_GOLD', 2);
--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
---- Resources
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resources
		(Type, 					LandResource, AnimalResource, Description, 					Civilopedia, 							Help, 									ResourceClassType, Happiness, IsMonopoly, MaxLatitude, ArtDefineTag, 					CivilizationType, 			IconString, PortraitIndex, IconAtlas)
SELECT	'RESOURCE_JAR_DIYOGI', 	LandResource, AnimalResource, 'TXT_KEY_RESOURCE_JAR_DIYOGI',	'TXT_KEY_CIV5_RESOURCE_JAR_DIYOGI_TEXT','TXT_KEY_RESOURCE_MONOPOLY_JAR_DIYOGI',	ResourceClassType, Happiness, IsMonopoly, MaxLatitude, 'ART_DEF_RESOURCE_JAR_DIYOGI', 	'CIVILIZATION_JAR_NAVAJO', '[ICON_RES_JAR_DIYOGI]', 8, 'JAR_NAVAJO_ICON_ATLAS'
FROM Resources WHERE Type = 'RESOURCE_IVORY';
--------------------------------------------------------------------------------------------------------------------------	
-- Resource_CityYieldModFromMonopoly
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resource_CityYieldModFromMonopoly
		(ResourceType, YieldType, Yield)
SELECT 	 'RESOURCE_JAR_DIYOGI', 'YIELD_GOLD', 5 UNION ALL
SELECT 	 'RESOURCE_JAR_DIYOGI', 'YIELD_CULTURE', 5;
--------------------------------------------------------------------------------------------------------------------------	
-- Resource_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resource_YieldChanges 	
		(ResourceType, 			YieldType, 		Yield)
SELECT 	 'RESOURCE_JAR_DIYOGI',	'YIELD_CULTURE',	1;
--------------------------------------------------------------------------------------------------------------------------	
-- Improvement_ResourceTypes
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)
VALUES	('RESOURCE_JAR_DIYOGI',	'IMPROVEMENT_PLANTATION');
--------------------------------------------------------------------------------------------------------------------------	
-- Corporation_ResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Corporation_ResourceYieldChanges
				(CorporationType, ResourceType, 			YieldType, Yield)
SELECT DISTINCT	 CorporationType, 'RESOURCE_JAR_DIYOGI',	YieldType, Yield
FROM Corporation_ResourceYieldChanges WHERE CorporationType='CORPORATION_GIORGIO_ARMEIER';
--------------------------------------------------------------------------------------------------------------------------	
-- Corporation_ResourceMonopolyOrs
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Corporation_ResourceMonopolyOrs
		(CorporationType, 					ResourceType)
SELECT	'CORPORATION_GIORGIO_ARMEIER',	'RESOURCE_JAR_DIYOGI';
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 					Class, Cost, GlobalFaithPurchaseCooldown, PurchaseCooldown, Moves, 		Capture, CivilianAttackPriority, Special, Domain, DefaultUnitAI,		Description, 						Civilopedia, 						Help, 								Strategy,	AdvancedStartCost,	WorkRate, CombatLimit, FoundReligion, SpreadReligion, ReligionSpreads, ReligiousStrength, UnitArtInfoEraVariation,	UnitArtInfo,   UnitFlagIconOffset,	UnitFlagAtlas,				MoveRate, PortraitIndex, IconAtlas)
SELECT	'UNIT_JAR_HATAALII',	Class, Cost, GlobalFaithPurchaseCooldown, PurchaseCooldown, Moves+1, 	Capture, CivilianAttackPriority, Special, Domain, DefaultUnitAI,		'TXT_KEY_UNIT_JAR_HATAALII', 	'TXT_KEY_CIV5_UNIT_JAR_HATAALII_TEXT', 	'TXT_KEY_UNIT_JAR_HATAALII_HELP',   Strategy,	AdvancedStartCost, 	WorkRate, CombatLimit, FoundReligion, SpreadReligion, ReligionSpreads, ReligiousStrength, 0,						'ART_DEF_UNIT_JAR_HATAALII',   0,	'UNIT_JAR_HATAALII_FLAG',	MoveRate, 3, 			 'JAR_NAVAJO_ICON_ATLAS'
FROM Units WHERE Type = 'UNIT_PROPHET';

INSERT INTO Units 	
		(Type, 					Class, IsMounted, PrereqTech,	Combat, RangedCombat, 	Range,	BaseSightRange, GlobalFaithPurchaseCooldown, PurchaseCooldown, Cost, FaithCost, RequiresFaithPurchaseEnabled,	Moves,		CombatClass,	Domain,		DefaultUnitAI,	Description,					Civilopedia,								Strategy,									Help,									MilitarySupport,	MilitaryProduction,	Pillage,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	XPValueAttack,		XPValueDefense,		UnitArtInfo,					UnitFlagIconOffset,	UnitFlagAtlas,				PortraitIndex,	IconAtlas,				MoveRate)
SELECT	'UNIT_JAR_NAABAAHII',	Class, IsMounted, PrereqTech,	Combat,	RangedCombat+2, Range,	BaseSightRange, GlobalFaithPurchaseCooldown, PurchaseCooldown, Cost, FaithCost, RequiresFaithPurchaseEnabled,	Moves+1,	CombatClass,	Domain,		DefaultUnitAI,	('TXT_KEY_UNIT_JAR_NAABAAHII'),	('TXT_KEY_UNIT_CIV5_JAR_NAABAAHII_TEXT'),	('TXT_KEY_UNIT_JAR_NAABAAHII_STRATEGY'),	('TXT_KEY_UNIT_JAR_NAABAAHII_HELP'),	MilitarySupport,	MilitaryProduction,	Pillage,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	XPValueAttack,		XPValueDefense,		('ART_DEF_UNIT_JAR_NAABAAHII'),	0,					'UNIT_JAR_NAABAAHII_FLAG',	9,				'JAR_NAVAJO_ICON_ATLAS',MoveRate
FROM Units WHERE Type = 'UNIT_CUIRASSIER';

INSERT INTO Units
		(Type, 					ShowInPedia, Class, Cost, Range, BaseSightRange, GlobalFaithPurchaseCooldown, PurchaseCooldown, PrereqTech, Combat, RangedCombat, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 								Help, 										Strategy,	AdvancedStartCost,	UnitArtInfo,  			UnitFlagIconOffset,	UnitFlagAtlas,				PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JAR_CODETALKER',	0,			 Class, Cost, Range, BaseSightRange, GlobalFaithPurchaseCooldown, PurchaseCooldown, PrereqTech, Combat, RangedCombat, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_JAR_CODETALKER'),	('TXT_KEY_UNIT_CIV5_JAR_CODETALKER_TEXT'), 	'TXT_KEY_UNIT_CIV5_JAR_CODETALKER_HELP', 	Strategy,	AdvancedStartCost, 	'ART_DEF_UNIT_JAR_CODETALKER',  0,			'UNIT_JAR_CODETALKER_FLAG',	7, 			'JAR_NAVAJO_ICON_ATLAS'
FROM Units WHERE (Type = 'UNIT_PARATROOPER');
--------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JAR_HATAALII', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PROPHET');

INSERT INTO UnitGameplay2DScripts
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JAR_NAABAAHII', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SHOSHONE_COMANCHE_RIDERS');

INSERT INTO UnitGameplay2DScripts
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JAR_CODETALKER', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PARATROOPER');
--------------------------------------------------------------------------------------------------------------------------	
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JAR_HATAALII', 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PROPHET');

INSERT INTO Unit_AITypes
		(UnitType, UnitAIType)
SELECT 'UNIT_JAR_NAABAAHII', UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CUIRASSIER');

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	('UNIT_JAR_CODETALKER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PARATROOPER');
--------------------------------------------------------------------------------------------------------------------------	
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Builds 	
		(UnitType, 				BuildType)
SELECT	'UNIT_JAR_HATAALII', 	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_PROPHET');
--------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JAR_HATAALII',	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_PROPHET');

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
SELECT	'UNIT_JAR_NAABAAHII',	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_CUIRASSIER');

INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
VALUES	('UNIT_JAR_NAABAAHII', 	'PROMOTION_NAABAAHII'),
		('UNIT_JAR_CODETALKER', 'PROMOTION_JAR_CODETALKER');

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
SELECT	'UNIT_JAR_CODETALKER',	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_PARATROOPER');
--------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_ClassUpgrades
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JAR_CODETALKER', 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_PARATROOPER');

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JAR_NAABAAHII',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CUIRASSIER';

UPDATE Units SET
ObsoleteTech = (select a.ObsoleteTech from Units a, Unit_ClassUpgrades b, UnitClasses c WHERE b.UnitType='UNIT_JAR_NAABAAHII' and b.UnitClassType=c.Type and c.DefaultUnit=a.Type)
WHERE (Type = 'UNIT_JAR_NAABAAHII');
--------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_Flavors
       (UnitType,          FlavorType, Flavor)
SELECT 'UNIT_JAR_NAABAAHII',FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CUIRASSIER';

INSERT INTO Unit_Flavors
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JAR_CODETALKER', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PARATROOPER');
--------------------------------------------------------------------------------------------------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType)
SELECT	'UNIT_JAR_NAABAAHII',	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CUIRASSIER';
--==========================================================================================================================	
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 							 Description, 							 	Help, 												Sound, 			LostWithUpgrade, OrderPriority, CannotBeChosen,	CombatPercent,	PortraitIndex, 	IconAtlas,			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JAR_CODETALKER',	 'TXT_KEY_PROMOTION_JAR_CODETALKER',	 	 'TXT_KEY_PROMOTION_JAR_CODETALKER_HELP',		'AS2D_IF_LEVELUP',	0,				 0, 			1,				0,				0, 			'promoNavajo_atlas', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_CODETALKER'),
			('PROMOTION_JAR_CODETALKERPOS',	 'TXT_KEY_PROMOTION_JAR_CODETALKERACTIVE',	 'TXT_KEY_PROMOTION_JAR_CODETALKER_HELP',		'AS2D_IF_LEVELUP',	0,				 0, 			1,				10,				1, 			'promoNavajo_atlas', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_CODETALKER'),
			('PROMOTION_JAR_CODETALKERNEG',	 'TXT_KEY_PROMOTION_JAR_CODETALKERACTIVE',	 'TXT_KEY_PROMOTION_JAR_CODETALKER_HELP',		'AS2D_IF_LEVELUP',	0,				 0, 			1,				-10,			10, 'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JAR_CODETALKER');
			
INSERT INTO UnitPromotions 
		(Type, 					Description, 					 Help, 									Sound, 			LostWithUpgrade, OrderPriority, CannotBeChosen,	PortraitIndex, 	IconAtlas,				PediaType, 			PediaEntry)
VALUES	('PROMOTION_NAABAAHII',	'TXT_KEY_PROMOTION_NAABAAHII',	 'TXT_KEY_PROMOTION_NAABAAHII_HELP',	'AS2D_IF_LEVELUP',	0,				 0, 					1,				3, 	'promoNavajo_atlas', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_NAABAAHII');
UPDATE UnitPromotions SET FreePillageMoves=1, XPFromPillaging = 5 WHERE Type = 'PROMOTION_NAABAAHII';

INSERT INTO UnitPromotions 
		(Type, 					Description, 					 Help, 									Sound, 			LostWithUpgrade, OrderPriority, CannotBeChosen,	PortraitIndex, 	IconAtlas,				PediaType, 			PediaEntry)
VALUES	('PROMOTION_ANAI_NDAA',	'TXT_KEY_PROMOTION_ANAI_NDAA',	 'TXT_KEY_PROMOTION_ANAI_NDAA_HELP',	'AS2D_IF_LEVELUP',	0,				 0, 					1,				2, 	'promoNavajo_atlas', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_ANAI_NDAA');
UPDATE UnitPromotions SET VisibilityChange= 1 WHERE Type='PROMOTION_ANAI_NDAA';
--------------------------------------------------------------------------------------------------------------------------	
-- UnitPromotions_YieldFromPillage
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions_YieldFromPillage
		(PromotionType, 			YieldType, 			Yield, 	YieldNoScale)
VALUES	('PROMOTION_NAABAAHII', 	'YIELD_FOOD', 		30, 		0),
		('PROMOTION_NAABAAHII', 	'YIELD_PRODUCTION', 30, 		0),
		('PROMOTION_NAABAAHII', 	'YIELD_CULTURE', 	30, 		0);
--------------------------------------------------------------------------------------------------------------------------	
-- UnitPromotions_Terrains
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions_Terrains
		(PromotionType,			TerrainType,		Attack, Defense,	IgnoreTerrainCostIn)
VALUES	('PROMOTION_ANAI_NDAA', 'TERRAIN_PLAINS',	25,		25,			1),
		('PROMOTION_ANAI_NDAA', 'TERRAIN_DESERT',	25,		25,			1);
--------------------------------------------------------------------------------------------------------------------------	
-- UnitPromotions_YieldFromKills
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions_YieldFromKills
		(PromotionType, 		YieldType,		Yield)
VALUES	('PROMOTION_ANAI_NDAA',	'YIELD_FAITH',	100);
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Improvements
		(Type, 						Description, 					Civilopedia, 								ArtDefineTag, 						Help, 									SpecificCivRequired, 	CivilizationType, 		PillageGold,	HillsMakesValid,	BuildableOnResources,	Permanent,	DestroyedWhenPillaged, 	PortraitIndex, 	IconAtlas,		NoTwoAdjacent,	DefenseModifier)
SELECT	'IMPROVEMENT_JAR_HOGAN',	'TXT_KEY_IMPROVEMENT_JAR_HOGAN',	'TXT_KEY_IMPROVEMENT_JAR_HOGAN_TEXT',	'ART_DEF_IMPROVEMENT_JAR_HOGAN',	'TXT_KEY_IMPROVEMENT_JAR_HOGAN_HELP',		1,			'CIVILIZATION_JAR_NAVAJO',		20,				0,						0,						0,			0,						5,		'JAR_NAVAJO_ICON_ATLAS',	1,				10
FROM Improvements WHERE Type='IMPROVEMENT_MINE';
--------------------------------------------------------------------------------------------------------------------------	
-- Improvement_Flavors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Improvement_Flavors	
			(ImprovementType, 			FlavorType,				Flavor)
VALUES		('IMPROVEMENT_JAR_HOGAN',	'FLAVOR_CULTURE',		5),
			('IMPROVEMENT_JAR_HOGAN',	'FLAVOR_GOLD',			1),
			('IMPROVEMENT_JAR_HOGAN',	'FLAVOR_PRODUCTION',	5),
			('IMPROVEMENT_JAR_HOGAN',	'FLAVOR_GROWTH',		2),
			('IMPROVEMENT_JAR_HOGAN',	'FLAVOR_CITY_DEFENSE',	2),
			('IMPROVEMENT_JAR_HOGAN',	'FLAVOR_DEFENSE',		2);
--------------------------------------------------------------------------------------------------------------------------	
-- Improvement_Yields
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Improvement_Yields 	
		(ImprovementType, 			YieldType,			Yield)
VALUES	('IMPROVEMENT_JAR_HOGAN',	'YIELD_PRODUCTION',	1),
		('IMPROVEMENT_JAR_HOGAN',	'YIELD_CULTURE',	1),
		('IMPROVEMENT_JAR_HOGAN',	'YIELD_FAITH',		2);
--------------------------------------------------------------------------------------------------------------------------	
-- Improvement_YieldPerXAdjacentImprovement
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Improvement_YieldPerXAdjacentImprovement
		(ImprovementType, 			OtherImprovementType,		YieldType, 			Yield, NumRequired)
SELECT	'IMPROVEMENT_JAR_HOGAN', 	'IMPROVEMENT_HOLY_SITE',	'YIELD_CULTURE', 	1, 		1 UNION ALL
SELECT	'IMPROVEMENT_JAR_HOGAN', 	'IMPROVEMENT_HOLY_SITE',	'YIELD_FAITH', 		1, 		1 ;
--------------------------------------------------------------------------------------------------------------------------	
-- Improvement_TechYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,		TechType,YieldType,Yield)
SELECT	'IMPROVEMENT_JAR_HOGAN',TechType,YieldType,Yield
FROM Improvement_TechYieldChanges WHERE ImprovementType='IMPROVEMENT_TRADING_POST';
			
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,			TechType,					YieldType,			Yield)
VALUES	('IMPROVEMENT_JAR_HOGAN',	'TECH_INDUSTRIALIZATION',	'YIELD_PRODUCTION',	2),
		('IMPROVEMENT_JAR_HOGAN',	'TECH_ACOUSTICS',			'YIELD_FAITH',		1),
		('IMPROVEMENT_JAR_HOGAN',	'TECH_ACOUSTICS',			'YIELD_CULTURE',	1),
		('IMPROVEMENT_JAR_HOGAN',	'TECH_FERTILIZER',			'YIELD_FOOD',		1),
		('IMPROVEMENT_JAR_HOGAN',	'TECH_BIOLOGY',				'YIELD_SCIENCE',	1),
		('IMPROVEMENT_JAR_HOGAN',	'TECH_CORPORATIONS',		'YIELD_GOLD',		1),
		('IMPROVEMENT_JAR_HOGAN',	'TECH_RADIO',				'YIELD_TOURISM',	2);
--------------------------------------------------------------------------------------------------------------------------	
-- Improvement_RouteYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Improvement_RouteYieldChanges
		(ImprovementType, 		 RouteType, YieldType, Yield)
SELECT 	'IMPROVEMENT_JAR_HOGAN', RouteType, YieldType, Yield
FROM Improvement_RouteYieldChanges WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST';
--------------------------------------------------------------------------------------------------------------------------	
-- Policy_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,			YieldType,			Yield)
SELECT	 PolicyType,	'IMPROVEMENT_JAR_HOGAN',	YieldType,			Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST' UNION ALL
SELECT	 PolicyType,	'IMPROVEMENT_JAR_HOGAN',	YieldType,			Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_MOAI';
--------------------------------------------------------------------------------------------------------------------------	
-- Belief_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 			YieldType, Yield)
SELECT	 BeliefType,	'IMPROVEMENT_JAR_HOGAN',	YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST' UNION ALL
SELECT	 BeliefType,	'IMPROVEMENT_JAR_HOGAN',	YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_MOAI';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ImprovementYieldChanges
		(BuildingType,	ImprovementType,			YieldType,	Yield) 
SELECT	BuildingType,	'IMPROVEMENT_JAR_HOGAN',	YieldType,	Yield
FROM Building_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ImprovementYieldChangesGlobal
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ImprovementYieldChangesGlobal
		(BuildingType,	ImprovementType,			YieldType,	Yield) 
SELECT	BuildingType,	'IMPROVEMENT_JAR_HOGAN',	YieldType,	Yield
FROM Building_ImprovementYieldChangesGlobal WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST';
--------------------------------------------------------------------------------------------------------------------------	
-- Improvement_ValidTerrains
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Improvement_ValidTerrains 	
		(ImprovementType,				TerrainType)
SELECT	'IMPROVEMENT_JAR_HOGAN',		TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_TRADING_POST';
--------------------------------------------------------------------------------------------------------------------------	
-- SQL TRIGGERS
--------------------------------------------------------------------------------------------------------------------------	
CREATE TRIGGER IF NOT EXISTS JarHogan01 AFTER INSERT ON Policy_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_TRADING_POST' OR NEW.ImprovementType = 'IMPROVEMENT_MOAI'
BEGIN
	INSERT INTO Policy_ImprovementYieldChanges
					(PolicyType,	ImprovementType,			YieldType,			Yield)
	SELECT DISTINCT	 NEW.PolicyType,'IMPROVEMENT_JAR_HOGAN',	NEW.YieldType,	NEW.Yield;
END;
--
CREATE TRIGGER IF NOT EXISTS JarHogan02 AFTER INSERT ON Belief_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_TRADING_POST' OR NEW.ImprovementType = 'IMPROVEMENT_MOAI'
BEGIN
	INSERT INTO Belief_ImprovementYieldChanges
					(BeliefType,	ImprovementType,			YieldType,			Yield)
	SELECT DISTINCT	 NEW.BeliefType,'IMPROVEMENT_JAR_HOGAN',	NEW.YieldType,	NEW.Yield;
END;
--
CREATE TRIGGER IF NOT EXISTS JarHogan03 AFTER INSERT ON Building_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_TRADING_POST' 
BEGIN
	INSERT INTO Building_ImprovementYieldChanges
					(BuildingType,	ImprovementType,			YieldType,			Yield)
	SELECT DISTINCT	 NEW.BuildingType,'IMPROVEMENT_JAR_HOGAN',	NEW.YieldType,	NEW.Yield;
END;
--
CREATE TRIGGER IF NOT EXISTS JarHogan04 AFTER INSERT ON Building_ImprovementYieldChangesGlobal
WHEN NEW.ImprovementType = 'IMPROVEMENT_TRADING_POST' 
BEGIN
	INSERT INTO Building_ImprovementYieldChangesGlobal
					(BuildingType,	ImprovementType,			YieldType,			Yield)
	SELECT DISTINCT	 NEW.BuildingType,'IMPROVEMENT_JAR_HOGAN',	NEW.YieldType,	NEW.Yield;
END;
--==========================================================================================================================
-- BUILDS
--==========================================================================================================================				
-- Builds
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Builds		
			(Type,							PrereqTech,			ImprovementType, 			Description, 							Help, 										Recommendation, 							Time, EntityEvent, 			OrderPriority, 	IconIndex, 	IconAtlas)
SELECT 		'BUILD_IMPROVEMENT_JAR_HOGAN',	'TECH_PHILOSOPHY',	'IMPROVEMENT_JAR_HOGAN',	'TXT_KEY_BUILD_IMPROVEMENT_JAR_HOGAN',	'TXT_KEY_BUILD_IMPROVEMENT_JAR_HOGAN_HELP',	'TXT_KEY_BUILD_IMPROVEMENT_JAR_HOGAN_REC',	Time, 'ENTITY_EVENT_BUILD',	95,				6,			'JAR_NAVAJO_ICON_ATLAS'
FROM Builds WHERE Type='BUILD_MINE';
--------------------------------------------------------------------------------------------------------------------------		
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Unit_Builds	
		(UnitType, 		BuildType)
VALUES	('UNIT_WORKER',	'BUILD_IMPROVEMENT_JAR_HOGAN');
--------------------------------------------------------------------------------------------------------------------------	
-- BuildFeatures
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildFeatures
		(BuildType, 					FeatureType, 	PrereqTech,	Time, Production, Remove)
SELECT	'BUILD_IMPROVEMENT_JAR_HOGAN', 	FeatureType, 	PrereqTech, Time, Production, Remove
FROM BuildFeatures WHERE BuildType='BUILD_TRADING_POST';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 					Civilopedia, 								CivilopediaTag, 						ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JAR_MANUELITO', 	'TXT_KEY_LEADER_JAR_MANUELITO', 'TXT_KEY_LEADER_JAR_MANUELITO_PEDIA_TEXT', 	'TXT_KEY_LEADER_JAR_MANUELITO_PEDIA', 	'Jar_Manuelito_Scene.xml',	5, 						5, 						6, 							5, 			5, 				8, 				7, 						7, 				6, 			6, 			6, 				4, 			5, 		'JAR_NAVAJO_ICON_ATLAS',  	1);

UPDATE Leaders SET PrimaryVictoryPursuit = 'VICTORY_PURSUIT_CULTURE'
WHERE Type = 'LEADER_JAR_MANUELITO';
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JAR_MANUELITO', 	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_JAR_MANUELITO', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_JAR_MANUELITO', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_JAR_MANUELITO', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JAR_MANUELITO', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JAR_MANUELITO', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JAR_MANUELITO', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JAR_MANUELITO', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JAR_MANUELITO', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JAR_MANUELITO', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_JAR_MANUELITO', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_JAR_MANUELITO', 	'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JAR_MANUELITO', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_DEFENSE', 					8),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_RECON', 					7),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_RANGED', 					7),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_MOBILE', 					9),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_NAVAL', 					3),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_AIR', 						5),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_PRODUCTION', 				4),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_GOLD', 						7),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_SCIENCE', 					3),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_CULTURE', 					7),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_HAPPINESS', 				7),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_WONDER', 					5),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_RELIGION', 					8),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_DIPLOMACY', 				7),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_SPACESHIP', 				5),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_NUKE', 						3),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_ESPIONAGE', 				9),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JAR_MANUELITO', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JAR_MANUELITO', 	'TRAIT_JAR_NAVAJO');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type,					Description, 				ShortDescription)
VALUES	('TRAIT_JAR_NAVAJO',	'TXT_KEY_TRAIT_JAR_NAVAJO',	'TXT_KEY_TRAIT_JAR_NAVAJO_SHORT');
--------------------------------------------------------------------------------------------------------------------------	
-- Trait_MusicYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Trait_MusicYieldChanges
		(TraitType, 			YieldType, Yield)
VALUES	('TRAIT_JAR_NAVAJO',	'YIELD_FOOD',  3),
		('TRAIT_JAR_NAVAJO',	'YIELD_FAITH', 3);
--------------------------------------------------------------------------------------------------------------------------	
-- Trait_NoBuilds
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Trait_NoBuilds	
		(TraitType, 		BuildType)
VALUES	('TRAIT_JAR_NAVAJO','BUILD_TRADING_POST');
--------------------------------------------------------------------------------------------------------------------------	
-- Trait_GreatPersonCostReduction
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Trait_GreatPersonCostReduction
(TraitType, GreatPersonType, Modifier) VALUES
('TRAIT_JAR_NAVAJO', 'GREATPERSON_MUSICIAN', -25);
--------------------------------------------------------------------------------------------------------------------------	
-- Trait_FreePromotionUnitCombats
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Trait_FreePromotionUnitCombats
(TraitType, UnitCombatType, PromotionType) VALUES
('TRAIT_JAR_NAVAJO', 'UNITCOMBAT_MELEE', 	'PROMOTION_ANAI_NDAA'),
('TRAIT_JAR_NAVAJO', 'UNITCOMBAT_GUN', 	 	'PROMOTION_ANAI_NDAA'),
('TRAIT_JAR_NAVAJO', 'UNITCOMBAT_ARCHER',	'PROMOTION_ANAI_NDAA'),
('TRAIT_JAR_NAVAJO', 'UNITCOMBAT_RECON',	'PROMOTION_ANAI_NDAA'),
('TRAIT_JAR_NAVAJO', 'UNITCOMBAT_MOUNTED',	'PROMOTION_ANAI_NDAA'),
('TRAIT_JAR_NAVAJO', 'UNITCOMBAT_SIEGE',	'PROMOTION_ANAI_NDAA');
--------------------------------------------------------------------------------------------------------------------------	
-- Trait_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Trait_ImprovementYieldChanges
(TraitType, ImprovementType, YieldType, Yield) VALUES
('TRAIT_JAR_NAVAJO', 'IMPROVEMENT_HOLY_SITE', 'YIELD_FOOD', 3);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 						Description, 				ShortDescription,				 Adjective,							Civilopedia, 					CivilopediaTag, 		DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,					AlphaIconAtlas,			PortraitIndex,	SoundtrackTag,  MapImage, 				DawnOfManQuote, 				DawnOfManImage)
SELECT	'CIVILIZATION_JAR_NAVAJO',	'TXT_KEY_CIV_NAVAJO_DESC', 	'TXT_KEY_CIV_NAVAJO_SHORT_DESC', 'TXT_KEY_CIV_NAVAJO_ADJECTIVE',  	'TXT_KEY_CIV5_NAVAJO_TEXT_1', 	'TXT_KEY_CIV5_NAVAJO', 'PLAYERCOLOR_JAR_NAVAJO',  	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JAR_NAVAJO_ICON_ATLAS',  'JAR_NAVAJO_ALPHA_ATLAS', 0,				SoundtrackTag, 	'Jar_MapNavajo.dds',   'TXT_KEY_CIV5_DAWN_NAVAJO_TEXT',   'Jar_DOM_Navajo.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_SHOSHONE';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_01'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_02'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_03'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_04'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_05'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_06'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_07'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_08'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_09'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_10'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_11'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_12'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_13'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_14'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_15'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_16'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_17'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_18'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_19'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_20'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_21'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_22'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_23'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_24'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_25'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_26'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_27'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_28'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_29'),
			('CIVILIZATION_JAR_NAVAJO', 		'TXT_KEY_CITY_NAME_JAR_NAVAJO_30');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 			BuildingClassType)
SELECT	'CIVILIZATION_JAR_NAVAJO', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 			TechType)
SELECT	'CIVILIZATION_JAR_NAVAJO', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JAR_NAVAJO', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 			LeaderheadType)
VALUES	('CIVILIZATION_JAR_NAVAJO',	'LEADER_JAR_MANUELITO');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
SELECT	'CIVILIZATION_JAR_NAVAJO', 	'BUILDINGCLASS_WORKSHOP', 	'BUILDING_JAR_ATLOOH';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JAR_NAVAJO', 'UNITCLASS_PROPHET',		'UNIT_JAR_HATAALII'),
		('CIVILIZATION_JAR_NAVAJO', 'UNITCLASS_PARATROOPER',	'UNIT_JAR_CODETALKER'),
		('CIVILIZATION_JAR_NAVAJO', 'UNITCLASS_CUIRASSIER',		'UNIT_JAR_NAABAAHII');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 			ReligionType)
SELECT	'CIVILIZATION_JAR_NAVAJO',  ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_0'),	
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_1'),
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_2'),
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_3'),
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_4'),
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_5'),
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_6'),
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_7'),
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_8'),
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_9'),	
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_10'),	
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_11'),	
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_12'),	
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_13'),	
			('CIVILIZATION_JAR_NAVAJO', 	'TXT_KEY_SPY_NAME_JAR_NAVAJO_14');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_JAR_NAVAJO', 	'REGION_DESERT'),
			('CIVILIZATION_JAR_NAVAJO', 	'REGION_PLAINS');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Region_Avoid
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Start_Region_Avoid 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_JAR_NAVAJO', 	'REGION_JUNGLE'),
			('CIVILIZATION_JAR_NAVAJO', 	'REGION_GRASS'),
			('CIVILIZATION_JAR_NAVAJO', 	'REGION_TUNDRA');
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JAR_NAVAJO_ICON',		0.945,	0.655,	0.059,	1), -- 241 167 15
			('COLOR_PLAYER_JAR_NAVAJO_BACKGROUND',	0.275,	0.255,	0.078,	1); -- 70 65 20
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 							SecondaryColor, 								TextColor)
VALUES		('PLAYERCOLOR_JAR_NAVAJO',			'COLOR_PLAYER_JAR_NAVAJO_ICON', 		'COLOR_PLAYER_JAR_NAVAJO_BACKGROUND', 			'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
--==========================================================================================================================