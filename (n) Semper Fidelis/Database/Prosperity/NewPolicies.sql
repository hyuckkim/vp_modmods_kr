CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_UNIT_CREATED';
-- ------------------------------------------------------
-- Tier 1 -----------------------------------------------
-- ------------------------------------------------------
-- heroic invention

INSERT INTO Policy_FreeUnitClasses
	(PolicyType, UnitClassType, Count)
VALUES
	('POLICY_HEROIC_INVENTION', 'UNITCLASS_SCIENTIST', 1);

INSERT INTO Policy_GreatPersonExpendedYield
	(PolicyType, GreatPersonType, YieldType, Yield)
VALUES
	('POLICY_HEROIC_INVENTION', 'GREATPERSON_ENGINEER', 'YIELD_SCIENCE', 200),
	('POLICY_HEROIC_INVENTION', 'GREATPERSON_ENGINEER', 'YIELD_CULTURE', 200),
	('POLICY_HEROIC_INVENTION', 'GREATPERSON_MERCHANT', 'YIELD_SCIENCE', 200), 
	('POLICY_HEROIC_INVENTION', 'GREATPERSON_MERCHANT', 'YIELD_CULTURE', 200);

-- intellectual property
INSERT INTO Policy_GreatWorkYieldChanges
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_INTELLECTUAL_PROPERTY', 'YIELD_GOLD', 5);

INSERT INTO Policy_YieldFromTech
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_INTELLECTUAL_PROPERTY', 'YIELD_GOLD', 200);

INSERT INTO Policy_BuildingClassSecurityChanges
	(PolicyType, BuildingClassType, SecurityChange)
VALUES
	('POLICY_INTELLECTUAL_PROPERTY', 'BUILDINGCLASS_LABORATORY', 20);

-- corporate espionage
INSERT INTO Policy_YieldModifierFromActiveSpies
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_CORPORATE_ESPIONAGE', 'YIELD_SCIENCE', 3);


-- laissez faire
INSERT INTO Policy_CapitalYieldPerPopChangeEmpire
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_LAISSEZ_FAIRE', 'YIELD_GOLD', 2);

INSERT INTO Policy_BuildingClassInLiberatedCities
	(PolicyType, BuildingClassType, Count)
VALUES
	('POLICY_LAISSEZ_FAIRE', 'BUILDINGCLASS_CARAVANSARY', 1),
	('POLICY_LAISSEZ_FAIRE', 'BUILDINGCLASS_MINT', 1),
	('POLICY_LAISSEZ_FAIRE', 'BUILDINGCLASS_BANK', 1),
	('POLICY_LAISSEZ_FAIRE', 'BUILDINGCLASS_HOTEL', 1),
	('POLICY_LAISSEZ_FAIRE', 'BUILDINGCLASS_AIRPORT', 1);


-- company towns
INSERT INTO Policy_SpecialistYieldChanges
	(PolicyType, SpecialistType, YieldType, Yield)
VALUES
	('POLICY_COMPANY_TOWNS', 'SPECIALIST_MERCHANT', 'YIELD_PRODUCTION', 2),	
	('POLICY_COMPANY_TOWNS', 'SPECIALIST_MERCHANT', 'YIELD_FAITH', 2);

INSERT INTO Policy_ImprovementYieldChanges
	(PolicyType, ImprovementType, YieldType, Yield)
SELECT
	'POLICY_COMPANY_TOWNS', Type, 'YIELD_GOLD', 4
FROM Improvements
WHERE SpecificCivRequired = 1 OR Type IN (
	'IMPROVEMENT_TRADING_POST',
	'IMPROVEMENT_CUSTOMS_HOUSE',
	'IMPROVEMENT_MANUFACTORY',
	-- hidden unique improvements
	'IMPROVEMENT_POLDER_WATER',
	'IMPROVEMENT_ORDO'
);

CREATE TRIGGER ProsperityUICustomCivs
AFTER INSERT ON Improvements WHEN 1 = NEW.SpecificCivRequired
BEGIN
	INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType, ImprovementType, YieldType, Yield)
	SELECT
		'POLICY_COMPANY_TOWNS', NEW.Type, 'YIELD_GOLD', 4;
END;

INSERT INTO Policy_CityYieldChanges
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_COMPANY_TOWNS', 'YIELD_GOLD', 4);


-- temperance
INSERT INTO Policy_ReligionYieldMod
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_TEMPERANCE', 'YIELD_FOOD', 12),
	('POLICY_TEMPERANCE', 'YIELD_FAITH', 4);

UPDATE Buildings SET
TradeRouteRecipientBonus = 2,
TradeRouteTargetBonus = 2
WHERE Type = 'BUILDING_PROSPERITY_SPEAKEASY';

INSERT INTO Building_YieldFromInternalTREnd
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PROSPERITY_SPEAKEASY', 'YIELD_CULTURE', 25),
	('BUILDING_PROSPERITY_SPEAKEASY', 'YIELD_GOLD', 25);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_PROSPERITY_SPEAKEASY', 'IMPROVEMENT_FARM', 'YIELD_GOLD', 1),
	('BUILDING_PROSPERITY_SPEAKEASY', 'IMPROVEMENT_FARM', 'YIELD_CULTURE', 1);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PROSPERITY_SPEAKEASY', 'YIELD_FOOD', -12),
	('BUILDING_PROSPERITY_SPEAKEASY', 'YIELD_CULTURE', 1),
	('BUILDING_PROSPERITY_SPEAKEASY', 'YIELD_GOLD', 1);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES	('TXT_KEY_BUILDING_PROSPERITY_SPEAKEASY', 'Speakeasy'),
	('TXT_KEY_BUILDING_PROSPERITY_SPEAKEASY_HELP', 'Internal [ICON_INTERNATIONAL_TRADE] Trade Routes to or from this City generate 25 [ICON_GOLD] Gold and [ICON_CULTURE] Culture when completed, scaling with Era. Incoming [ICON_ARROW_LEFT] Trade Routes generate +2 [ICON_GOLD] Gold for the City and for the [ICON_ARROW_RIGHT] Trade Route owner. [COLOR_NEGATIVE_TEXT]Reduces[ENDCOLOR] the [ICON_FOOD] Food output of the City by [COLOR_NEGATIVE_TEXT]-12[ENDCOLOR].[NEWLINE][NEWLINE]Nearby Farms: +1 [ICON_GOLD] Gold and [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Requires the [COLOR_MAGENTA]Temperance[ENDCOLOR] Policy.'),
	('TXT_KEY_BUILDING_PROSPERITY_SPEAKEASY_STRATEGY', 'The Speakeasy boosts Gold and Culture output, but this is in the context of removing large amounts of free Food the Temperance Policy gives for following your Religion. If you want to break prohibition by building the Speakeasy, you will trade in your growth bonus for other yields, and so this decision has to be made on a City-by-City basis. Additionally, the bonuses to trade routes allow Internal options to be explored while trying to attract International routes to compensate you for shifting away from them yourself.'),
	('TXT_KEY_BUILDING_PROSPERITY_SPEAKEASY_TEXT', 'A speakeasy, also called a beer flat or blind pig or blind tiger, was an illicit establishment that sold alcoholic beverages. Speakeasy bars in the United States date back to at least the 1880s, but came into prominence in the United States during the Prohibition era (1920–1933, longer in some states). During that time, the sale, manufacture, and transportation (bootlegging) of alcoholic beverages was illegal throughout the United States, due to the Eighteenth Amendment to the United States Constitution. The quality of the alcohol sold in speakeasies ranged from very poor to very good, depending on the owner''s source. Cheap liquor was generally used because it was more profitable, was responsible for a shift away from 19th-century "classic" cocktails, that celebrated the raw taste of the liquor (such as the gin cocktail, made with Genever (sweet) gin), to new cocktails aimed at masking the taste of rough moonshine.');

-- great awakening

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PROSPERITY_CAMP', 'YIELD_CULTURE', 1),
	('BUILDING_PROSPERITY_CAMP', 'YIELD_FAITH', 1);

INSERT INTO Building_YieldFromBorderGrowth
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PROSPERITY_CAMP', 'YIELD_CULTURE', 20);

INSERT INTO Building_GreatWorkYieldChangesLocal
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PROSPERITY_CAMP', 'YIELD_CULTURE_LOCAL', 4);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES	('TXT_KEY_BUILDING_PROSPERITY_CAMP', 'Chautauqua'),
	('TXT_KEY_BUILDING_PROSPERITY_CAMP_HELP', 'Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 25%. +25% [ICON_GREAT_PEOPLE] Great Person generation in this City. Gain 20 [ICON_CULTURE] Culture in the City when its borders expand, scaling with Era. +4 [ICON_CULTURE_LOCAL] Border Growth Points from [ICON_GREAT_WORK] Great Works in this City.[NEWLINE][NEWLINE]Requires the [COLOR_MAGENTA]Great Awakening[ENDCOLOR] Policy.'),
	('TXT_KEY_BUILDING_PROSPERITY_CAMP_STRATEGY', 'The Chautauqua can be Purchased in weaker Cities and then, by moving Great Works there, turbo-charge its Border Growth and all the yields that might come from that. It also boosts Great People generation and Religious Pressure, which are both excellent in stronger Cities, where you might instead choose to construct the Building with Production.'),
	('TXT_KEY_BUILDING_PROSPERITY_CAMP_TEXT', 'In 1874, Methodist Episcopal minister John Heyl Vincent and businessman Lewis Miller organized the New York Chautauqua Assembly at a campsite on the shores of Chautauqua Lake in the state of New York. The gatherings grew in popularity and spread across the country. Some were so religiously oriented that they were essentially church camps, while more secular Chautauquas resembled summer school and competed with vaudeville in theaters and circus tent shows with their animal acts and trapeze acrobats. In all cases lectures were the mainstay of the Chautauqua. The most prolific speaker was Russell Conwell, who delivered his famous "Acres of Diamonds" speech 5,000 times to audiences on the Chautauqua and Lyceum circuits.');


-- ------------------------------------------------------
-- Tier 2 -----------------------------------------------
-- ------------------------------------------------------
-- venture capital
INSERT INTO Building_YieldFromPurchase
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_D_FOR_VENTURE_CAPITAL', 'YIELD_SCIENCE', 15);

INSERT INTO Policy_FreeBuilding
	(PolicyType, BuildingClassType, Count)
VALUES
	('POLICY_VENTURE_CAPITAL', 'BUILDINGCLASS_BANK', 999);

INSERT INTO Policy_SpecialistYieldChanges
	(PolicyType, SpecialistType, YieldType, Yield)
VALUES
	('POLICY_VENTURE_CAPITAL', 'SPECIALIST_ENGINEER', 'YIELD_GOLD', 4);


-- pharma
INSERT INTO Policy_YieldFromBirth
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_PHARMA_MARKETING', 'YIELD_SCIENCE', 25);

INSERT INTO Policy_SpecialistYieldChanges
	(PolicyType, SpecialistType, YieldType, Yield)
VALUES
	('POLICY_PHARMA_MARKETING', 'SPECIALIST_SCIENTIST', 'YIELD_FOOD', 4);

INSERT INTO Policy_BuildingClassYieldModifiers
	(PolicyType, BuildingClassType, YieldType, YieldMod)
VALUES
	('POLICY_PHARMA_MARKETING', 'BUILDINGCLASS_HOSPITAL', 'YIELD_GOLD', 5),
	('POLICY_PHARMA_MARKETING', 'BUILDINGCLASS_LABORATORY', 'YIELD_GOLD', 5),
	('POLICY_PHARMA_MARKETING', 'BUILDINGCLASS_MEDICAL_LAB', 'YIELD_GOLD', 5),
	('POLICY_PHARMA_MARKETING', 'BUILDINGCLASS_HOSPITAL', 'YIELD_SCIENCE', 5),
	('POLICY_PHARMA_MARKETING', 'BUILDINGCLASS_LABORATORY', 'YIELD_SCIENCE', 5),
	('POLICY_PHARMA_MARKETING', 'BUILDINGCLASS_MEDICAL_LAB', 'YIELD_SCIENCE', 5);


-- foreign investment
INSERT INTO Policy_BuildingClassYieldChanges
	(PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT
	'POLICY_FOREIGN_INVESTMENT', FranchiseBuildingClass, a.Type, 1
FROM Corporations, Yields a WHERE a.Type IN ('YIELD_GOLD', 'YIELD_SCIENCE', 'YIELD_CULTURE_LOCAL');

INSERT INTO Policy_BuildingClassYieldChanges
	(PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT
	'POLICY_FOREIGN_INVESTMENT', OfficeBuildingClass, a.type, 8
FROM Corporations, Yields a WHERE a.Type IN ('YIELD_GOLD');

INSERT INTO Policy_FreeBuilding
	(PolicyType, BuildingClassType, Count)
SELECT
	'POLICY_FOREIGN_INVESTMENT', FranchiseBuildingClass, 999
FROM Corporations;

INSERT INTO Policy_BuildingClassInLiberatedCities
	(PolicyType, BuildingClassType, Count)
SELECT
	'POLICY_FOREIGN_INVESTMENT', FranchiseBuildingClass, 1
FROM Corporations;

-- professional sport
INSERT INTO Policy_BuildingClassProductionModifiers
	(PolicyType, BuildingClassType, ProductionModifier)
VALUES
	('POLICY_PROFESSIONAL_SPORT', 'BUILDINGCLASS_STADIUM', 100);

INSERT INTO Policy_BuildingClassYieldModifiers
	(PolicyType, BuildingClassType, YieldType, YieldMod)
VALUES
	('POLICY_PROFESSIONAL_SPORT', 'BUILDINGCLASS_STADIUM', 'YIELD_GOLD', 15),
	('POLICY_PROFESSIONAL_SPORT', 'BUILDINGCLASS_STADIUM', 'YIELD_CULTURE', 15);

INSERT INTO Policy_YieldFromDelegateCount
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_PROFESSIONAL_SPORT', 'YIELD_GOLD', 10),
	('POLICY_PROFESSIONAL_SPORT', 'YIELD_CULTURE', 10);


-- Exaltation (gold missionaries)
INSERT INTO UnitClasses
		(Type, 					DefaultUnit)
SELECT	'UNITCLASS_PROSPERITY_MISSIONARY','UNIT_PROSPERITY_MISSIONARY';

INSERT INTO Units 	
		(Type,				Class, 			Combat, BaseSightRange, Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	GlobalFaithPurchaseCooldown, PurchaseCooldown,	Moves, 	Immobile, CombatClass, Domain, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	Description, 				Civilopedia, 					Strategy, 							Help, 							Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,			PortraitIndex, 	IconAtlas,			MoveRate,
ShowInPedia, Range, Special, DefaultUnitAI, Suicide, HurryCostModifier, NukeDamageLevel, ProjectPrereq, PolicyType, PrereqTech, ReligionSpreads, ReligiousStrength, SpreadReligion, PurchaseOnly)

SELECT	'UNIT_PROSPERITY_MISSIONARY',	'UNITCLASS_PROSPERITY_MISSIONARY',	Combat, BaseSightRange, 800,		250,		0,								0, 							 PurchaseCooldown,	Moves, 	Immobile, CombatClass, Domain, GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	Description, 				Civilopedia, 					Strategy, 							Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,			PortraitIndex, 	IconAtlas,			MoveRate,
0, Range, Special, DefaultUnitAI, Suicide, HurryCostModifier, NukeDamageLevel, ProjectPrereq, 'POLICY_EXALTATION', PrereqTech, ReligionSpreads, ReligiousStrength, SpreadReligion, 1
FROM Units WHERE Type = 'UNIT_MISSIONARY';

INSERT INTO Policy_UnitClassReplacements
	(PolicyType, ReplacedUnitClassType, ReplacementUnitClassType)
VALUES
	('POLICY_EXALTATION', 'UNITCLASS_MISSIONARY', 'UNITCLASS_PROSPERITY_MISSIONARY');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
SELECT
	'UNIT_PROSPERITY_MISSIONARY', PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MISSIONARY';
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_PROSPERITY_MISSIONARY',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MISSIONARY';
	
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_PROSPERITY_MISSIONARY',	UnitAIType FROM Unit_AITypes WHERE UnitType = 'UNIT_MISSIONARY';
--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors
       (UnitType,          FlavorType, Flavor)
SELECT 'UNIT_PROSPERITY_MISSIONARY', FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MISSIONARY';

-- televangelism

INSERT INTO Policy_BuildingClassYieldModifiers
	(PolicyType, BuildingClassType, YieldType, YieldMod)
VALUES
	('POLICY_TELEVANGELISM', 'BUILDINGCLASS_BROADCAST_TOWER', 'YIELD_GOLD', 15),
	('POLICY_TELEVANGELISM', 'BUILDINGCLASS_BROADCAST_TOWER', 'YIELD_FAITH', 15);

INSERT INTO Policy_BuildingClassProductionModifiers
	(PolicyType, BuildingClassType, ProductionModifier)
VALUES
	('POLICY_TELEVANGELISM', 'BUILDINGCLASS_BROADCAST_TOWER', 100);

INSERT INTO Policy_ReligionYieldMod
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_TELEVANGELISM', 'YIELD_CULTURE_LOCAL', 10);


-- military contractors
INSERT INTO Policy_SpecialistYieldChanges
	(PolicyType, SpecialistType, YieldType, Yield)
VALUES
	('POLICY_MILITARY_CONTRACTORS', 'SPECIALIST_SCIENTIST', 'YIELD_GREAT_GENERAL_POINTS', 1),
	('POLICY_MILITARY_CONTRACTORS', 'SPECIALIST_ENGINEER', 'YIELD_GREAT_GENERAL_POINTS', 1);


-- ------------------------------------------------------
-- Tier 3 -----------------------------------------------
-- ------------------------------------------------------
-- commerical aero

INSERT INTO Policy_FreeUnitClasses
	(PolicyType, UnitClassType, Count)
VALUES
	('POLICY_COMMERCIAL_AEROSPACE', 'UNITCLASS_MERCHANT', 1);

INSERT INTO UnitPromotions_InstantYields
	(PromotionType, YieldType, Yield, IsEraScaling)
VALUES
	('PROMOTION_PROSPERITY_AERO', 'YIELD_SCIENCE', 50, 1);

-- mass media
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_UNIT_CREATED';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_GREAT_PEOPLE';

INSERT INTO Policy_FreeUnitClasses
	(PolicyType, UnitClassType, Count)
VALUES
	('POLICY_MASS_MEDIA', 'UNITCLASS_MERCHANT', 1);

-- charismata

INSERT INTO Policy_FreeUnitClasses
	(PolicyType, UnitClassType, Count)
VALUES
	('POLICY_CHARISMATA', 'UNITCLASS_MERCHANT', 1);

INSERT INTO Policy_GreatPersonExpendedYield
	(PolicyType, GreatPersonType, YieldType, Yield)
VALUES
	('POLICY_CHARISMATA', 'GREATPERSON_MERCHANT', 'YIELD_FAITH', 400); 
