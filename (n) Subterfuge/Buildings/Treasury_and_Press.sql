INSERT INTO Building_YieldPerFriend
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PRINTING_HOUSE', 'YIELD_GOLD', 1);

INSERT INTO Building_YieldPerAlly
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PRINTING_HOUSE', 'YIELD_SCIENCE', 1);

--INSERT INTO Building_YieldFromSpyAttack
--	(BuildingType, YieldType, Yield)
--VALUES
--	('BUILDING_PRINTING_HOUSE', 'YIELD_SCIENCE', 20);

UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_PRINTING_HOUSE' WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WIRE_SERVICE');

UPDATE Unit_BuildingClassPurchaseRequireds SET BuildingClassType = 'BUILDINGCLASS_PRINTING_HOUSE' WHERE UnitType = 'UNIT_DIPLOMAT';

UPDATE Buildings SET SpecialistCount = 1 WHERE Type = 'BUILDING_WIRE_SERVICE';

-- Scholasticism (Shadow Networks) 
UPDATE Policies
SET
	MinorScienceAllies = 0
WHERE Type = 'POLICY_SCHOLASTICISM';

DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_SCHOLASTICISM';

INSERT INTO Policy_BuildingClassYieldChanges
	(PolicyType, BuildingClassType, YieldType, YieldChange)
VALUES
	('POLICY_SCHOLASTICISM', 'BUILDINGCLASS_CONSTABLE', 'YIELD_SCIENCE', 2),	
	('POLICY_SCHOLASTICISM', 'BUILDINGCLASS_PRINTING_HOUSE', 'YIELD_SCIENCE', 2);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Shadow Networks[ENDCOLOR][NEWLINE][ICON_BULLET]+3% [ICON_CULTURE] Culture in [ICON_CAPITAL] Capital for every 100 [ICON_VP_SPY_POINTS] Spy Points ever accumulated (up to 30%).[NEWLINE][ICON_BULLET]+2 [ICON_RESEARCH] Science from Constabularies and Printing Houses.[NEWLINE][ICON_BULLET]+1 [ICON_RESEARCH] Science from Specialists.'
WHERE Tag = 'TXT_KEY_POLICY_SCHOLASTICISM_HELP';

-- State Treasury (was Printing Press)
UPDATE Buildings SET
FreePromotion = NULL,
SpySecurityModifierPerXPop = 60,
PrereqTech = 'TECH_BANKING',
PortraitIndex = 1,
IconAtlas = 'NEW_BLDG_ATLAS_DLC',
ExtraSpies = 1
WHERE Type = 'BUILDING_PRINTING_PRESS';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PRINTING_PRESS', 'YIELD_SCIENCE', 2),
	('BUILDING_PRINTING_PRESS', 'YIELD_GOLD', 3);

INSERT INTO Building_YieldFromSpyRigElection
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PRINTING_PRESS', 'YIELD_GOLD', 40);

UPDATE Language_en_US
SET Text = 'State Treasury'
WHERE Tag = 'TXT_KEY_BUILDING_PRINTING_PRESS';

UPDATE Language_en_US
SET Text = 'Provides 1 additional [ICON_RES_PAPER] Paper and 100 [ICON_VP_SPY_POINTS] Spy Points. Gain 1 [ICON_SPY] City Security for every 6 [ICON_CITIZEN] Citizens in the City. +20% [ICON_PRODUCTION] Production of Diplomatic Units in this City. Receive 40 [ICON_GOLD] Gold when you sucessfully rig an election in a [ICON_CITY_STATE] City-State, scaling with Era.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_PRINTING_PRESS_HELP';

UPDATE Language_en_US
SET Text = 'This National Wonder cannot be built unless the city has a Chancery. Build it to receive a production speed increase for Diplomatic Units in the city where it is built, and bonuses to Rigging Elections everywhere.'
WHERE Tag = 'TXT_KEY_BUILDING_PRINTING_PRESS_STRATEGY';

UPDATE Language_en_US
SET Text = 'Wars are expensive. In 1433 England''s war with France led to a deficit of  30,000 - the equivalent of over  100 billion today. Money that the King received in taxes and fines were recorded by using sticks with notches marked on them according to the amount of money involved. The stick was cut in two and one half given to the Sheriff as receipt for the money. This represents one of the first examples of centralized public finances. As the Age of Exploration progressed, the role of finance in government became ever more central.'
WHERE Tag = 'TXT_KEY_CIV5_BUILDINGS_PRINTING_PRESS_TEXT';

-- White Tower
UPDATE Buildings SET
PrereqTech = 'TECH_CIVIL_SERVICE',
BuildingClass = 'BUILDINGCLASS_PRINTING_PRESS', 
ExtraSpies = 2
WHERE Type = 'BUILDING_WHITE_TOWER';

UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = 'BUILDINGCLASS_PRINTING_PRESS' WHERE BuildingType = 'BUILDING_WHITE_TOWER';

DELETE FROM Building_ResourceQuantity WHERE BuildingType = 'BUILDING_WHITE_TOWER';

INSERT INTO Building_ResourceQuantity
	(BuildingType, ResourceType, Quantity)
SELECT
	Type, 'RESOURCE_PAPER', 2
FROM Buildings
WHERE Type = 'BUILDING_WHITE_TOWER';

INSERT INTO Building_UnitCombatProductionModifiers
	(BuildingType, UnitCombatType, Modifier)
SELECT
	Type, 'UNITCOMBAT_DIPLOMACY', 33
FROM Buildings
WHERE Type = 'BUILDING_WHITE_TOWER';

DELETE FROM Building_YieldFromConstruction WHERE BuildingType = 'BUILDING_WHITE_TOWER';

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_WHITE_TOWER';

INSERT OR REPLACE INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_WHITE_TOWER', 'YIELD_GOLD', 5),
	('BUILDING_WHITE_TOWER', 'YIELD_SCIENCE', 4),
	('BUILDING_WHITE_TOWER', 'YIELD_CULTURE', 2);

UPDATE Language_en_US
SET Text = 'Provides 2 additional [ICON_RES_PAPER] Paper and 200 [ICON_VP_SPY_POINTS] Spy Points. +33% [ICON_PRODUCTION] Production of Diplomatic Units in this City.[NEWLINE][NEWLINE]Receive 40 [ICON_GOLD] Gold and [ICON_RESEARCH] Science when you identify, capture, or kill a foreign [ICON_SPY] Spy or when you perform a Spy Mission, and +25 [ICON_GOLD] Gold and [ICON_RESEARCH] Science when you successfully rig an election in a [ICON_CITY_STATE] City-State, scaling with Era.[NEWLINE][NEWLINE]Contains 1 slot for a [ICON_GREAT_WORK] Great Work of Art or Artifact, and comes with a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_VP_GREATART] Great Work of Art.[NEWLINE][NEWLINE]+1 [ICON_CULTURE] Culture to all Constabularies, Castles, and Armories.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost increases based on the number of Cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_WHITE_TOWER_HELP';

UPDATE Language_en_US
SET Text = 'Unique English replacement for the {TXT_KEY_BUILDING_PRINTING_PRESS}. In addition to improving the bonuses of the {TXT_KEY_BUILDING_PRINTING_PRESS}, the {TXT_KEY_BUILDING_WHITE_TOWER} boosts Constabularies, Castles, and Armories; provides [ICON_GOLD] Gold and [ICON_RESEARCH] Science for both offensive and defensive Spy actions, in addition to adding [ICON_RESEARCH] Science to Rigging Elections; and contains a free [ICON_VP_GREATART] Great Work of Art.'
WHERE Tag = 'TXT_KEY_BUILDING_WHITE_TOWER_STRATEGY';
