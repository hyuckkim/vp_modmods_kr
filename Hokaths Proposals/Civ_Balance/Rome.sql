
---------------------------------------------------------------
-- Trait
---------------------------------------------------------------

UPDATE Traits SET 
--FreeUnit = 'UNITCLASS_WRITER',  -- Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_WRITER] Great Writer when you discover [COLOR_CYAN]Iron Working[ENDCOLOR].
FreeUnitPrereqTech = 'TECH_IRON_WORKING',
CapitalBuildingModifier = 25,
CityStateCombatModifier = 0,
AnnexedCityStatesGiveYields = 0,
CityConnectionTradeRouteChange = 100
WHERE Type = 'TRAIT_CAPITAL_BUILDINGS_CHEAPER';

UPDATE Language_en_US SET 
Text = '+25% [ICON_PRODUCTION] Production towards Buildings present in [ICON_CAPITAL] Capital. +100% [ICON_GOLD] Gold/[ICON_PRODUCTION] Production from [ICON_CONNECTED] City Connections/[ICON_INDUSTRIAL_CONNECTED] Industrial City Connections in all Cities. '
WHERE Tag = 'TXT_KEY_TRAIT_CAPITAL_BUILDINGS_CHEAPER';

---------------------------------------------------------------
-- Fornix
---------------------------------------------------------------

UPDATE Building_ExtraPlayerInstancesFromAccomplishments SET AccomplishmentType = 'ACCOMPLISHMENT_WARS_WON' WHERE BuildingType = 'BUILDING_FORNIX';

UPDATE Buildings SET
TrainedFreePromotion = 'PROMOTION_TRIUMPH',
FreeGreatWorK = 'GREAT_WORK_ROME'
WHERE Type = 'BUILDING_FORNIX';

INSERT INTO GreatWorks
	(Type, GreatWorkClassType, Description, Quote, Image)
VALUES
	('GREAT_WORK_ROME', 'GREAT_WORK_LITERATURE', 'TXT_KEY_GREAT_WORK_ROME', 'TXT_KEY_GREAT_WORK_QUOTE_ROME', 'GreatWriter_Background.dds');

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_GREAT_WORK_ROME', 'Volume of The History of Rome'),
	('TXT_KEY_GREAT_WORK_QUOTE_ROME', '"The study of history is the best medicine for a sick mind; for in history you have a record of the infinite variety of human experience plainly set out for all to see: and in that record you can find for yourself and your country both examples and warnings: fine things to take as models, base things, rotten through and through, to avoid."[NEWLINE]-Livy');

DELETE FROM Building_FreeUnits WHERE BuildingType = 'BUILDING_FORNIX';

UPDATE Building_YieldChanges SET Yield = 1 WHERE BuildingType = 'BUILDING_FORNIX';

UPDATE Building_BuildingClassYieldChanges SET
YieldType = 'YIELD_SCIENCE' WHERE
BuildingType = 'BUILDING_FORNIX' AND YieldType = 'YIELD_GOLD';

DELETE FROM Building_BuildingClassLocalYieldChanges WHERE BuildingType = 'BUILDING_FORNIX';

-------------
-- triumph promo
-------------
INSERT INTO UnitPromotions
	(Type, Description, Help, PediaEntry, Sound,
	PediaType, PortraitIndex, IconAtlas, IsVisibleAboveFlag, CannotBeChosen, OrderPriority)
SELECT
	'PROMOTION_TRIUMPH', 'TXT_KEY_PROMOTION_TRIUMPH', 'TXT_KEY_PROMOTION_TRIUMPH_HELP', 'TXT_KEY_PROMOTION_TRIUMPH_PEDIA', Sound,
	'PEDIA_SHARED', 20, 'PROMOTION_ATLAS_VP_04', 1, 1, 200
FROM UnitPromotions WHERE Type = 'PROMOTION_MORALE';

UPDATE UnitPromotions SET
CombatPercent = 15
WHERE Type = 'PROMOTION_TRIUMPH';

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_TRIUMPH', 'Triumph'),
	('TXT_KEY_PROMOTION_TRIUMPH_PEDIA', '[COLOR_POSITIVE_TEXT](Rome)[ENDCOLOR] Triumph'),
	('TXT_KEY_PROMOTION_TRIUMPH_HELP', '+15% [ICON_STRENGTH] Combat Strength.[NEWLINE]Gain 50% of the [ICON_STRENGTH] Combat Strength of defeated enemy Units as [ICON_GREAT_GENERAL] Great General Points.');

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
SELECT
	'PROMOTION_TRIUMPH', UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_MORALE';

INSERT INTO UnitPromotions_YieldFromKills
	(PromotionType, YieldType, Yield)
VALUES
	('PROMOTION_TRIUMPH', 'YIELD_GREAT_GENERAL_POINTS', 50);

/*
---------------------------------------------------------------
-- Ballista
---------------------------------------------------------------

UPDATE Units SET
Class = 'UNITCLASS_TREBUCHET',
Cost = 130,
FaithCost = 250,
Combat = 10,
RangedCombat = 20,
PrereqTech = 'TECH_ENGINEERING',
ObsoleteTech = 'TECH_RIFLING'
WHERE Type = 'UNIT_ROMAN_BALLISTA';

Civilization_UnitClassOverrides SET
UnitClassType = 'UNITCLASS_TREBUCHET' 
WHERE UnitType = 'UNIT_ROMAN_BALLISTA';
*/
