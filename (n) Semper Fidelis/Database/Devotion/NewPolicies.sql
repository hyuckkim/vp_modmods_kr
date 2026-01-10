INSERT INTO Policy_BuildingClassYieldChanges
        (PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT  'POLICY_STATE_RELIGION', b.BuildingClass, a.Type, 1
FROM Buildings b, Yields a WHERE b.Cost = -1 AND b.FaithCost > 0 AND a.Type IN ('YIELD_FAITH', 'YIELD_GOLD', 'YIELD_CULTURE', 'YIELD_GOLDEN_AGE_POINTS');

INSERT INTO UnitPromotions_CivilianUnitType
	(PromotionType, UnitType)
SELECT
	'PROMOTION_DEVOTION_MERCHANT', Type
FROM Units
WHERE Class = 'UNITCLASS_MERCHANT';


INSERT INTO Policy_YieldFromBorderGrowth
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_RELIGIOUS_SETTLEMENTS', 'YIELD_FOOD', 40),
	('POLICY_RELIGIOUS_SETTLEMENTS', 'YIELD_FAITH', 40);


INSERT INTO Policy_SpecialistExtraYields
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_PATERNALISM', 'YIELD_FAITH', 1),
	('POLICY_PATERNALISM', 'YIELD_CULTURE', 1);

-- ethical finance
INSERT INTO Policy_ImprovementYieldChanges
	(PolicyType, ImprovementType, YieldType, Yield)
SELECT
	'POLICY_ETHICAL_FINANCE', Type, 'YIELD_FAITH', 3
FROM Improvements
WHERE SpecificCivRequired = 1 OR Type IN (
	'IMPROVEMENT_WELL',
	'IMPROVEMENT_PASTURE',
	'IMPROVEMENT_OFFSHORE_PLATFORM',
	'IMPROVEMENT_HOLY_SITE',
	-- hidden unique improvements
	'IMPROVEMENT_POLDER_WATER',
	'IMPROVEMENT_ORDO'
);

CREATE TRIGGER DevoUICustomCivs
AFTER INSERT ON Improvements WHEN 1 = NEW.SpecificCivRequired
BEGIN
	INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType, ImprovementType, YieldType, Yield)
	SELECT
		'POLICY_ETHICAL_FINANCE', NEW.Type, 'YIELD_FAITH', 3;
END;

INSERT INTO Policy_CityYieldChanges
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_ETHICAL_FINANCE', 'YIELD_FAITH', 3);

-- change order to not have well
DELETE FROM Policy_ImprovementYieldChanges WHERE PolicyType = 'POLICY_FIVE_YEAR_PLAN' AND ImprovementType = 'IMPROVEMENT_WELL';

UPDATE Language_en_US SET
Text = Replace(Text, '+3 [ICON_PRODUCTION] Production for every Mine, Quarry, Lumber Mill, Oil Well,', '+3 [ICON_PRODUCTION] Production for every Mine, Quarry, Lumber Mill,')
WHERE Tag = 'TXT_KEY_POLICY_FIVE_YEAR_PLAN_HELP';

-- tier 2 ------------------------------------------
INSERT INTO Policy_UnitCombatProductionModifiers
	(PolicyType, UnitCombatType, ProductionModifier)
VALUES
	('POLICY_JIHAD', 'UNITCOMBAT_MISSILE', 100);

INSERT INTO Policy_UnitClassReplacements
	(PolicyType, ReplacedUnitClassType, ReplacementUnitClassType)
VALUES
	('POLICY_JIHAD', 'UNITCLASS_ANTI_AIRCRAFT_GUN', 'UNITCLASS_MUJAHIDEEN');

INSERT INTO Policy_ConquerorYield
	(PolicyType, YieldType, Yield)
VALUES	
	('POLICY_OATH', 'YIELD_FOOD', 50),
	('POLICY_OATH', 'YIELD_CULTURE', 50),
	('POLICY_OATH', 'YIELD_FAITH', 50);

-- morality police

INSERT INTO Policy_BuildingClassYieldModifiers
	(PolicyType, BuildingClassType, YieldType, YieldMod)
VALUES
	('POLICY_RELIGIOUS_POLICE', 'BUILDINGCLASS_COURTHOUSE', 'YIELD_FAITH', 20);

--INSERT INTO Policy_BuildingClassProductionModifiers
--	(PolicyType, BuildingClassType, ProductionModifier)
--VALUES
--	('POLICY_MEDIA_STRATEGY', 'BUILDINGCLASS_BROADCAST_TOWER', 100);

INSERT INTO Policy_YieldFromBirth
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_RELIGIOUS_POLICE', 'YIELD_FAITH', 30);

INSERT INTO UnitPromotions_CivilianUnitType
	(PromotionType, UnitType)
SELECT
	'PROMOTION_DEVOTION_RELIGIOUS_POLICE', Type
FROM Units
WHERE Class = 'UNITCLASS_INQUISITOR';

INSERT INTO UnitPromotions_InstantYields
	(PromotionType, YieldType, Yield, IsEraScaling)
VALUES
	('PROMOTION_DEVOTION_RELIGIOUS_POLICE', 'YIELD_CULTURE', 50, 1);

-- fundamentalism

INSERT INTO Process_ProductionYields
	(ProcessType, YieldType, Yield)
VALUES
	('PROCESS_FAITH', 'YIELD_FAITH', 25);

INSERT INTO Policy_ArtifactYieldChanges
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_FUNDAMENTALISM', 'YIELD_FAITH', 6);

INSERT INTO Policy_LitYieldChanges
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_FUNDAMENTALISM', 'YIELD_SCIENCE', 6);

INSERT INTO UnitPromotions_CivilianUnitType
	(PromotionType, UnitType)
SELECT
	'PROMOTION_DEVOTION_INQUISITOR', Type
FROM Units
WHERE Class = 'UNITCLASS_INQUISITOR';

-- load order nothing adds corporations (yet, afaik)
INSERT INTO Policy_BuildingClassYieldChanges
	(PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT
	'POLICY_DEVO_CORPORATIONS', OfficeBuildingClass, a.type, 5
FROM Corporations, Yields a WHERE a.Type IN ('YIELD_FAITH');

INSERT INTO Policy_FranchisePerImprovement
	(PolicyType, ImprovementType, NumFranchise)
VALUES
	('POLICY_DEVO_CORPORATIONS', 'IMPROVEMENT_HOLY_SITE', 1);


-- tier 3 -------------------------------------------

INSERT INTO UnitPromotions_CivilianUnitType
	(PromotionType, UnitType)
SELECT
	'PROMOTION_DEVOTION_MISSIONARY', Type
FROM Units
WHERE Class = 'UNITCLASS_MISSIONARY';

INSERT INTO Policy_GoldenAgeYieldMod
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_MESSIAH', 'YIELD_FAITH', 20);

-----------------------------------
-- armageddon hacks
-----------------------------------

INSERT INTO Policy_YieldFromKills
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_ARMAGEDDON', 'YIELD_FAITH', 225);

-- nuclear missile dummy
INSERT INTO UnitClasses
		(Type, 					DefaultUnit)
SELECT	'UNITCLASS_DEVOTION_NUCLEAR_MISSILE','UNIT_DEVOTION_NUCLEAR_MISSILE';

INSERT INTO Units 	
		(Type,				Class, 			Combat, BaseSightRange, Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	GlobalFaithPurchaseCooldown, PurchaseCooldown,	Moves, 	Immobile, CombatClass, Domain, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	Description, 				Civilopedia, 					Strategy, 							Help, 							Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,			PortraitIndex, 	IconAtlas,			MoveRate,
ShowInPedia, Range, Special, DefaultUnitAI, Suicide, HurryCostModifier, NukeDamageLevel, ProjectPrereq, PolicyType, PrereqTech)

SELECT	'UNIT_DEVOTION_NUCLEAR_MISSILE',	'UNITCLASS_DEVOTION_NUCLEAR_MISSILE',	Combat, BaseSightRange, Cost,		7500,		0,								0, 							 PurchaseCooldown,	Moves, 	Immobile, CombatClass, Domain, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	Description, 				Civilopedia, 					Strategy, 							Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,			PortraitIndex, 	IconAtlas,			MoveRate,
0, Range, Special, DefaultUnitAI, Suicide, HurryCostModifier, NukeDamageLevel, ProjectPrereq, 'POLICY_ARMAGEDDON', NULL
FROM Units WHERE Type = 'UNIT_NUCLEAR_MISSILE';

-- graphical hack for tech tree
INSERT INTO Unit_TechTypes
	(UnitType, TechType)
VALUES
	('UNIT_DEVOTION_NUCLEAR_MISSILE', 'TECH_LASERS');

INSERT INTO Policy_UnitClassReplacements
	(PolicyType, ReplacedUnitClassType, ReplacementUnitClassType)
VALUES
	('POLICY_ARMAGEDDON', 'UNITCLASS_NUCLEAR_MISSILE', 'UNITCLASS_DEVOTION_NUCLEAR_MISSILE');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
SELECT
	'UNIT_DEVOTION_NUCLEAR_MISSILE', PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_NUCLEAR_MISSILE';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_DEVOTION_NUCLEAR_MISSILE',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_NUCLEAR_MISSILE';
	
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_DEVOTION_NUCLEAR_MISSILE',	UnitAIType FROM Unit_AITypes WHERE UnitType = 'UNIT_NUCLEAR_MISSILE';

INSERT INTO Unit_Flavors
       (UnitType,          FlavorType, Flavor)
SELECT 'UNIT_DEVOTION_NUCLEAR_MISSILE',FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_NUCLEAR_MISSILE';

INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType)
SELECT	'UNIT_DEVOTION_NUCLEAR_MISSILE',	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_NUCLEAR_MISSILE';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_DEVOTION_NUCLEAR_MISSILE',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_NUCLEAR_MISSILE';

-- nuclear bomb dummy
INSERT INTO UnitClasses
		(Type, 					DefaultUnit)
SELECT	'UNITCLASS_DEVOTION_ATOMIC_BOMB','UNIT_DEVOTION_ATOMIC_BOMB';

INSERT INTO Units 	
		(Type,				Class, 			Combat, BaseSightRange, Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	GlobalFaithPurchaseCooldown, PurchaseCooldown,	Moves, 	Immobile, CombatClass, Domain, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	Description, 				Civilopedia, 					Strategy, 							Help, 							Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,			PortraitIndex, 	IconAtlas,			MoveRate,
ShowInPedia, Range, Special, DefaultUnitAI, Suicide, HurryCostModifier, NukeDamageLevel, ProjectPrereq, PolicyType, PrereqTech)

SELECT	'UNIT_DEVOTION_ATOMIC_BOMB',	'UNITCLASS_DEVOTION_ATOMIC_BOMB',	Combat, BaseSightRange, Cost,		7500,		0,								0, 							 PurchaseCooldown,	Moves, 	Immobile, CombatClass, Domain, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	Description, 				Civilopedia, 					Strategy, 							Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,			PortraitIndex, 	IconAtlas,			MoveRate,
0, Range, Special, DefaultUnitAI, Suicide, HurryCostModifier, NukeDamageLevel, ProjectPrereq, 'POLICY_ARMAGEDDON', NULL
FROM Units WHERE Type = 'UNIT_ATOMIC_BOMB';

-- graphical hack for tech tree
INSERT INTO Unit_TechTypes
	(UnitType, TechType)
VALUES
	('UNIT_DEVOTION_ATOMIC_BOMB', 'TECH_NUCLEAR_FISSION');

INSERT INTO Policy_UnitClassReplacements
	(PolicyType, ReplacedUnitClassType, ReplacementUnitClassType)
VALUES
	('POLICY_ARMAGEDDON', 'UNITCLASS_ATOMIC_BOMB', 'UNITCLASS_DEVOTION_ATOMIC_BOMB');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
SELECT
	'UNIT_DEVOTION_ATOMIC_BOMB', PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ATOMIC_BOMB';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_DEVOTION_ATOMIC_BOMB',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_ATOMIC_BOMB';
	
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_DEVOTION_ATOMIC_BOMB',	UnitAIType FROM Unit_AITypes WHERE UnitType = 'UNIT_ATOMIC_BOMB';

INSERT INTO Unit_Flavors
       (UnitType,          FlavorType, Flavor)
SELECT 'UNIT_DEVOTION_ATOMIC_BOMB',FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_ATOMIC_BOMB';

INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType)
SELECT	'UNIT_DEVOTION_ATOMIC_BOMB',	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_ATOMIC_BOMB';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_DEVOTION_ATOMIC_BOMB',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ATOMIC_BOMB';





