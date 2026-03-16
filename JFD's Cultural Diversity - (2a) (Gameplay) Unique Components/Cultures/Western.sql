-- ============================
-- Ship of the Line (Frigate)
-- splish splash splosh
-- ==============================

UPDATE Units SET
IconAtlas = 'CD_MILITARY_ATLAS',
PortraitIndex = 29,
Combat = Combat + 1,
RangedCombat = RangedCombat + 2
WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE';

DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_ENGLAND' AND UnitClassType = 'UNITCLASS_FRIGATE';  -- or it will show up twice

INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
SELECT
	CivilizationType, 'UNITCLASS_FRIGATE', 'UNIT_ENGLISH_SHIPOFTHELINE'
FROM Civilization_JFD_CultureTypes WHERE CultureType = 'CULTURE_JFD_WESTERN';

CREATE TRIGGER WesternShipOfTheLine
AFTER INSERT ON Civilization_JFD_CultureTypes WHEN NEW.CultureType = 'CULTURE_JFD_WESTERN'
BEGIN
	INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
	SELECT
		NEW.CivilizationType, 'UNITCLASS_FRIGATE', 'UNIT_ENGLISH_SHIPOFTHELINE';
END;

--UPDATE Language_en_US SET
--Text = Replace(Text, 'Ship of the Line', 'Man-of-War')
--WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Language_en_US SET
Text = 'Requires the [ICON_CULTURE_JFD_WESTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WESTERN_SHORT_DESC}[ENDCOLOR] Cultural Group.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_SHIPOFTHELINE';

UPDATE Language_en_US SET
Text = Replace(Text, 'The {TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE} is the English unique unit, replacing the {TXT_KEY_UNIT_FRIGATE}.', 'The {TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE} is a [ICON_CULTURE_JFD_WESTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WESTERN_SHORT_DESC}[ENDCOLOR] unique component, replacing the {TXT_KEY_UNIT_FRIGATE}')
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE_STRATEGY';

-- =============================
-- longbow returns
-- =============================

INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
SELECT
	'CIVILIZATION_ENGLAND', 'UNITCLASS_CROSSBOWMAN', 'UNIT_ENGLISH_LONGBOWMAN';

UPDATE Units SET 
Cost = 160,
FaithCost = 350,
MinorCivGift = 0,
Class = 'UNITCLASS_CROSSBOWMAN'
WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';

-- =======================
-- East India Company (Chartered Company)
-- =======================

--------------------------------
-- first we move the chartered company to economics where it belongs. 
--------------------------------
UPDATE Buildings SET 
PrereqTech = 'TECH_ECONOMICS',
Cost = 240
WHERE BuildingClass =  'BUILDINGCLASS_NATIONAL_TREASURY';

UPDATE Building_ClassesNeededInCity SET 
BuildingClassType = 'BUILDINGCLASS_BANK'
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_NATIONAL_TREASURY');

----------------------------------
-- carthage UNW goes to ironworks
----------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GREAT_COTHON';
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_GREAT_COTHON', 'YIELD_PRODUCTION', 10);

DELETE FROM Building_ResourceQuantity WHERE BuildingType = 'BUILDING_GREAT_COTHON';
INSERT INTO Building_ResourceQuantity
	(BuildingType, ResourceType, Quantity)
VALUES
	('BUILDING_GREAT_COTHON', 'RESOURCE_IRON', 2);

DELETE FROM Building_YieldFromConstruction WHERE BuildingType = 'BUILDING_GREAT_COTHON';
INSERT INTO Building_YieldFromConstruction
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_GREAT_COTHON', 'YIELD_SCIENCE', 25);

DELETE FROM Civilization_BuildingClassOverrides WHERE BuildingType = 'BUILDING_GREAT_COTHON';
INSERT INTO Civilization_BuildingClassOverrides
	(CivilizationType, BuildingClassType, BuildingType)
VALUES
	('CIVILIZATION_CARTHAGE', 'BUILDINGCLASS_IRONWORKS', 'BUILDING_GREAT_COTHON');

UPDATE Buildings
SET
	BuildingClass = 'BUILDINGCLASS_IRONWORKS',
	PrereqTech = 'TECH_CURRENCY',
	TradeRouteRecipientBonus = 2,
	TradeRouteTargetBonus = 1,
	ExtraLuxuries = 0,
	ResourceDiversityModifier = 0,
	NumTradeRouteBonus = 2,
	Water = 1,
	PovertyFlatReductionGlobal = 0,
	PovertyFlatReduction = 1,
	FreeBuilding = 'BUILDINGCLASS_HARBOR'
WHERE Type = 'BUILDING_GREAT_COTHON';

UPDATE Language_en_US SET
Text = 'Unique Carthaginian replacement for the {TXT_KEY_BUILDING_IRONWORKS}. In addition to the bonuses of the {TXT_KEY_BUILDING_IRONWORKS}, the {TXT_KEY_BUILDING_GREAT_COTHON} provides: a free {TXT_KEY_BUILDING_HARBOR} in all of your coastal cities; two [ICON_INTERNATIONAL_TRADE] Trade Routes; [ICON_GOLD] Gold for both recipient and target of trade routes and a flat point of Poverty reduction in the City where it is built; and boosts all Lighthouses and Harbors in your Empire. Unlike the {TXT_KEY_BUILDING_IRONWORKS}, the {TXT_KEY_BUILDING_GREAT_COTHON} is made available in the [COLOR_CYAN]Classical Era[ENDCOLOR] with the discovery of [COLOR_CYAN]{TXT_KEY_TECH_CURRENCY_TITLE}[ENDCOLOR]. The {TXT_KEY_BUILDING_GREAT_COTHON} does not have any building requirements, but can only be built in a Coastal City.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_COTHON_STRATEGY';

--------------------------------
-- now add the new UNW. early at banking
--------------------------------
REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_EAST_INDIA_HELP', 'Requires the [ICON_CULTURE_JFD_WESTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WESTERN_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_NATIONAL_TREASURY_HELP';

UPDATE Buildings SET
	TradeRouteSeaGoldBonus = 400,
	ExtraLuxuries = 1,
	ResourceDiversityModifier = 25,
	PovertyFlatReductionGlobal = 1,
	PrereqTech = 'TECH_BANKING',
        Cost = 190,  -- reduced from 240
	NumCityCostMod = 10
WHERE Type = 'BUILDING_CD_EAST_INDIA';

-- if EE is active economics is moved so need to adjust
UPDATE Buildings SET PrereqTech = 'TECH_EE_EXPLORATION' WHERE Type = 'BUILDING_CD_EAST_INDIA' AND EXISTS (SELECT 1 FROM Eras WHERE Type = 'ERA_ENLIGHTENMENT');

INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
SELECT
	'BUILDING_CD_EAST_INDIA', 'SPECIALIST_MERCHANT', Type, 1
FROM Yields WHERE ID < 6;

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
VALUES
	('BUILDING_CD_EAST_INDIA', 'SPECIALIST_MERCHANT', 20);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_CD_EAST_INDIA', 'BUILDINGCLASS_HARBOR', 'YIELD_GREAT_ADMIRAL_POINTS', 1),
	('BUILDING_CD_EAST_INDIA', 'BUILDINGCLASS_BANK', 'YIELD_TOURISM', 2);

INSERT INTO Building_YieldChangesPerMonopoly
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_EAST_INDIA', 'YIELD_FOOD', 3),
	('BUILDING_CD_EAST_INDIA', 'YIELD_TOURISM', 3),
	('BUILDING_CD_EAST_INDIA', 'YIELD_GREAT_ADMIRAL_POINTS', 3);

-- think we have enough?
--INSERT INTO Building_YieldFromInternationalTREnd
--	(BuildingType, YieldType, Yield)
--VALUES
--	('BUILDING_CD_EAST_INDIA', 'YIELD_FOOD', 10),
--	('BUILDING_CD_EAST_INDIA', 'YIELD_GOLD', 10),
--	('BUILDING_CD_EAST_INDIA', 'YIELD_CULTURE', 10);

INSERT INTO Building_DomainFreeExperiencesGlobal
	(BuildingType, DomainType, Experience)
VALUES
	('BUILDING_CD_EAST_INDIA', 'DOMAIN_SEA', 15);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_EAST_INDIA', 'YIELD_CULTURE', 4),
	('BUILDING_CD_EAST_INDIA', 'YIELD_TOURISM', 4);

