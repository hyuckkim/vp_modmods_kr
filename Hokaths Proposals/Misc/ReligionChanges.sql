-------------------------------------------------------
-- new beliefs and text defined
-------------------------------------------------------
INSERT INTO Beliefs
	(Type, 	Description, 	ShortDescription, Tooltip, 
	Pantheon,  Founder,  Follower, 	Enhancer,  Reformation)
VALUES	
	('BELIEF_HOLY_COW', 	'TXT_KEY_BELIEF_HOLY_COW', 		'TXT_KEY_BELIEF_HOLY_COW_SHORT',        'TXT_KEY_BELIEF_HOLY_COW',		
	0, 	0, 	  1, 	 0, 	 0),
	('BELIEF_EXODUS', 	'TXT_KEY_BELIEF_EXODUS',		'TXT_KEY_BELIEF_EXODUS_SHORT',          'TXT_KEY_BELIEF_EXODUS',		
	0, 	0, 	  0, 	 0, 	 1),
	('BELIEF_CARGO_CULT', 	'TXT_KEY_BELIEF_CARGO_CULT',		'TXT_KEY_BELIEF_CARGO_CULT_SHORT',          'TXT_KEY_BELIEF_CARGO_CULT',		
	0, 	0, 	  0, 	 0, 	 1),
	('BELIEF_SACRED_GEOMETRY',  'TXT_KEY_BELIEF_SACRED_GEOMETRY',   'TXT_KEY_BELIEF_SACRED_GEOMETRY_SHORT', 'TXT_KEY_BELIEF_SACRED_GEOMETRY',		
	0, 	0, 	  0, 	 1, 	 0);

INSERT INTO Language_en_US 
	(Tag, Text)
VALUES
	--Theriolatry
	('TXT_KEY_BELIEF_HOLY_COW_SHORT', 'Sacred Bull'),
	('TXT_KEY_BELIEF_HOLY_COW', '+1 [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] from [ICON_RES_COW] Cattle.'),

	('TXT_KEY_BELIEF_EXODUS_SHORT', 'Exodus'),
	('TXT_KEY_BELIEF_EXODUS', 'Expending a [ICON_GREAT_ADMIRAL] Great Admiral grants 25 [ICON_PEACE] Faith and [ICON_GOLDEN_AGE] Golden Age Points for every City following this [ICON_RELIGION] Religion (max 20 Cities). Settler and Religious Units gain the [COLOR_POSITIVE_TEXT]Diaspora[ENDCOLOR] Promotion. +2 [ICON_CULTURE] Culture and [ICON_GREAT_ADMIRAL] Great Admiral Points if the City is Coastal.'),

	('TXT_KEY_BELIEF_CARGO_CULT_SHORT', 'Cargo Cult'),
	('TXT_KEY_BELIEF_CARGO_CULT', 'May purchase Airports with [ICON_PEACE] Faith. Double yields from Natural Wonders. +5 [ICON_GOLDEN_AGE] Golden Age Points in the Holy City for every known [ICON_RELIGION_PANTHEON] Pantheon founded (caps at 8 Pantheons).'),

	('TXT_KEY_BELIEF_SACRED_GEOMETRY_SHORT', 'Sacred Geometry'),
	('TXT_KEY_BELIEF_SACRED_GEOMETRY', 'Expending a [ICON_GREAT_ENGINEER] Great Engineer grants 25 [ICON_RESEARCH] Science and [ICON_PEACE] Faith for every City following this [ICON_RELIGION] Religion (max 20 Cities). +2 [ICON_GOLD] Gold and [ICON_CULTURE] Culture from all [ICON_WONDER] World Wonders. +5 [ICON_GREAT_MUSICIAN] Great Musician points in the Holy City.');

-------------------------
-- founders 
--------------------------
-- theocratic rule/world church/pilgrimage
DELETE FROM Belief_YieldFromWLTKD WHERE BeliefType = 'BELIEF_WORLD_CHURCH';
INSERT INTO Belief_YieldChangePerXForeignFollowers
	(BeliefType, YieldType, ForeignFollowers)
VALUES
	('BELIEF_WORLD_CHURCH', 'YIELD_GOLD', 4),
	('BELIEF_WORLD_CHURCH', 'YIELD_FAITH', 4),
	('BELIEF_WORLD_CHURCH', 'YIELD_TOURISM', 4);
UPDATE Beliefs SET FollowerScalerLimiter = 400 WHERE Type = 'BELIEF_WORLD_CHURCH';
UPDATE Language_en_US SET 
Text = Replace(Text, '"We Love the King Day" boosts the [ICON_PEACE] Faith, [ICON_CULTURE] Culture, and [ICON_GOLD] Gold output of a City by 15%.', '+1 [ICON_GOLD] Gold, [ICON_PEACE] Faith, and [ICON_TOURISM] Tourism in the Holy City for every 4 Followers of this [ICON_RELIGION] Religion in Foreign Cities (max 400 Followers).') 
WHERE Tag = 'TXT_KEY_BELIEF_WORLD_CHURCH';
UPDATE Language_en_US SET Text = 'Pilgrimage' WHERE Tag = 'TXT_KEY_BELIEF_WORLD_CHURCH_SHORT';

-- divine inheritence/peace loving
DELETE FROM Belief_YieldBonusGoldenAge WHERE BeliefType = 'BELIEF_PEACE_LOVING';
INSERT INTO Belief_YieldPerXFollowers
	(BeliefType, YieldType, PerXFollowers)
VALUES
	('BELIEF_PEACE_LOVING', 'YIELD_FOOD', 4),
	('BELIEF_PEACE_LOVING', 'YIELD_CULTURE_LOCAL', 4),
	('BELIEF_PEACE_LOVING', 'YIELD_GOLDEN_AGE_POINTS', 4);
UPDATE Beliefs SET FollowerScalerLimiter = 400 WHERE Type = 'BELIEF_WORLD_CHURCH';
UPDATE Language_en_US
SET Text = Replace(Text, 'Holy City produces +20% of its Yields when your Empire is in a [ICON_GOLDEN_AGE] Golden Age.', '+1 [ICON_FOOD] Food, [ICON_CULTURE_LOCAL] Border Growth Points, and [ICON_GOLDEN_AGE] Golden Age Points in the Holy City for every 4 Followers of this [ICON_RELIGION] Religion in owned Cities (max 400 Followers).')
WHERE Tag = 'TXT_KEY_BELIEF_PEACE_LOVING';

------------------
-- exodus
-------------------
UPDATE Beliefs SET CityScalerLimiter = 20 WHERE Type = 'BELIEF_EXODUS';

INSERT INTO Belief_GreatPersonExpendedYield
	(BeliefType, GreatPersonType, YieldType, Yield)
VALUES
	('BELIEF_EXODUS', 'GREATPERSON_ADMIRAL', 'YIELD_FAITH', 25),
	('BELIEF_EXODUS', 'GREATPERSON_ADMIRAL', 'YIELD_GOLDEN_AGE_POINTS', 25);

INSERT INTO Belief_CoastalCityYieldChanges
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_EXODUS', 'YIELD_CULTURE', 2),
	('BELIEF_EXODUS', 'YIELD_GREAT_ADMIRAL_POINTS', 2);

INSERT INTO Belief_FreePromotions
	(BeliefType, PromotionType)
VALUES
	('BELIEF_EXODUS', 'PROMOTION_EXODUS');

INSERT INTO UnitPromotions
	(Type, Description, Help, 
	PediaType, PediaEntry, PortraitIndex, IconAtlas, IsVisibleAboveFlag, CannotBeChosen,
	ExtraNavalMovement, EmbarkFlatCost, DisembarkFlatCost, EmbarkExtraVisibility)
VALUES
	('PROMOTION_EXODUS', 'TXT_KEY_PROMOTION_EXODUS', 'TXT_KEY_PROMOTION_EXODUS_HELP', 
	'PEDIA_CIVILIAN', 'TXT_KEY_PROMOTION_EXODUS', 48, 'PROMOTION_ATLAS', 1, 1,
	2, 1, 1, 1);

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_EXODUS', 'UNITCOMBAT_SETTLER'),
	('PROMOTION_EXODUS', 'UNITCOMBAT_MISSIONARY'),
	('PROMOTION_EXODUS', 'UNITCOMBAT_INQUISITOR');

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_EXODUS', 'Diaspora'),
	('TXT_KEY_PROMOTION_EXODUS_HELP', '+2 [ICON_MOVES] Naval Movement.[NEWLINE]+1 [ICON_VISION] Vision while [COLOR_POSITIVE_TEXT]Embarked[ENDCOLOR].[NEWLINE]Embarking and Disembarking cost only 1 [ICON_MOVES] Movement.');

------------------
-- sacred geometry
-------------------
INSERT INTO Belief_YieldChangeWorldWonder
	(BeliefType, 	YieldType, 	Yield)
VALUES	
	('BELIEF_SACRED_GEOMETRY', 'YIELD_CULTURE', 2),
	('BELIEF_SACRED_GEOMETRY', 'YIELD_GOLD', 2);

UPDATE Beliefs SET CityScalerLimiter = 20 WHERE Type = 'BELIEF_SACRED_GEOMETRY';
INSERT INTO Belief_GreatPersonExpendedYield
	(BeliefType, GreatPersonType, YieldType, Yield)
VALUES
	('BELIEF_SACRED_GEOMETRY', 'GREATPERSON_ENGINEER', 'YIELD_SCIENCE', 25),
	('BELIEF_SACRED_GEOMETRY', 'GREATPERSON_ENGINEER', 'YIELD_FAITH', 25);

INSERT INTO Belief_GreatPersonPoints
	(BeliefType, GreatPersonType, Value)
VALUES
	('BELIEF_SACRED_GEOMETRY', 'GREATPERSON_MUSICIAN', 5);

------------------
-- sacred bull
-------------------
INSERT INTO Belief_ResourceYieldChanges
	(BeliefType, ResourceType, YieldType, Yield)
SELECT
	'BELIEF_HOLY_COW', a.Type, b.Type, 1
FROM Resources a, Yields b WHERE 
--a.AnimalResource = 1 AND
a.Type = 'RESOURCE_COW' AND
b.ID < 6;

------------------
-- golden age yields move
-------------------
-- orthodoxy yields during GA, following pdan beliefs
UPDATE Beliefs SET 
SpreadDistanceModifier = 20,
SpreadStrengthModifier = 20, 
PressureChangeTradeRoute = 0,
FriendlyCityStateSpreadModifier = 0 
WHERE Type = 'BELIEF_HOLY_ORDER';

UPDATE Language_en_US
SET Text = 'Ecumenism'
WHERE Tag = 'TXT_KEY_BELIEF_HOLY_ORDER_SHORT';

DELETE FROM Belief_HolyCityYieldChanges WHERE BeliefType = 'BELIEF_HOLY_ORDER';  --pdan compatibility

INSERT INTO Belief_YieldBonusGoldenAge
	(BeliefType, YieldType, Yield)
SELECT
	'BELIEF_HOLY_ORDER', Type, 10
FROM Yields WHERE ID < 6;
		
UPDATE Language_en_US
SET Text = 'Holy City gains +15% [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] during a [ICON_GOLDEN_AGE] Golden Age. [ICON_RELIGION] Religion spreads 20% faster (50% with Printing Press), and to Cities 20% further away.'
WHERE Tag = 'TXT_KEY_BELIEF_HOLY_ORDER';

------------------
-- WLTKD yields  move
-------------------
UPDATE Language_en_US
SET Text = 'Annual Festivals'
WHERE Tag = 'TXT_KEY_BELIEF_MISSIONARY_ZEAL_SHORT';

/*
-- doesnt seem to work...
INSERT INTO Belief_ResourceHappiness
	(BeliefType, ResourceType, HappinessChange)
SELECT
	'BELIEF_MISSIONARY_ZEAL', Type, 1
FROM Resources WHERE Happiness > 0;

-- strong compatibility
CREATE TRIGGER Festivals_Resource_Happiness
AFTER INSERT ON Resources 
WHEN NEW.Happiness > 0
BEGIN
    INSERT INTO Belief_ResourceHappiness
	(BeliefType, ResourceType, HappinessChange)
    VALUES 
	('BELIEF_MISSIONARY_ZEAL', NEW.Type, 1);
END;
*/

INSERT INTO Belief_YieldFromWLTKD
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_MISSIONARY_ZEAL', 'YIELD_GOLD', 10),
	('BELIEF_MISSIONARY_ZEAL', 'YIELD_CULTURE', 10),
	('BELIEF_MISSIONARY_ZEAL', 'YIELD_FAITH', 10);

--UPDATE Beliefs SET
--BorderGrowthRateIncreaseGlobal = 33
--WHERE Type = 'BELIEF_MISSIONARY_ZEAL';
-- +33% [ICON_CULTURE_LOCAL] Border Growth Rate. 

UPDATE Language_en_US
SET Text = '"We Love the King Day" boosts the [ICON_PEACE] Faith, [ICON_CULTURE] Culture, and [ICON_GOLD] Gold output of a City by 10%. [ICON_MISSIONARY] Missionaries of this Religion are 25% stronger.'
WHERE Tag = 'TXT_KEY_BELIEF_MISSIONARY_ZEAL';
--+1 [ICON_HAPPINESS_1] Happiness from every Luxury Resource.

DELETE FROM Belief_YieldChangePerForeignCity WHERE BeliefType = 'BELIEF_MISSIONARY_ZEAL';
DELETE FROM Belief_GoldenAgeGreatPersonRateModifier WHERE BeliefType = 'BELIEF_MISSIONARY_ZEAL';

--------------------------------------
-- symbolism gain GP during GA from sacred calendar
--------------------------------------
UPDATE Beliefs SET HappinessPerFollowingCity = 0.25 WHERE Type = 'BELIEF_ITINERANT_PREACHERS';
DELETE FROM Belief_HolyCityYieldChanges WHERE BeliefType = 'BELIEF_ITINERANT_PREACHERS';
DELETE FROM Belief_GreatPersonPoints WHERE BeliefType = 'BELIEF_ITINERANT_PREACHERS';
INSERT INTO Belief_GoldenAgeGreatPersonRateModifier
	(BeliefType, GreatPersonType, Modifier)
SELECT
	'BELIEF_ITINERANT_PREACHERS', Type, 33
FROM GreatPersons;

UPDATE Beliefs SET 
PolicyReductionWonderXFollowerCities = 8,
CityScalerLimiter = 24 
WHERE Type = 'BELIEF_ITINERANT_PREACHERS';

UPDATE Language_en_US
SET Text = 'Reduce minimum Policy requirement for [ICON_WONDER] World Wonders by 1 and gain +2 [ICON_HAPPINESS_1] Happiness for every 8 Cities following this Religion (max 24 Cities). +33% [ICON_GREAT_PEOPLE] Great Person Rate in Holy City during [ICON_GOLDEN_AGE] Golden Ages.'
WHERE Tag = 'TXT_KEY_BELIEF_ITINERANT_PREACHERS';

-- and make sure the reduction is removed from prophecy (which is v strong anyway)
UPDATE Beliefs SET
PolicyReductionWonderXFollowerCities = 0
WHERE Type = 'BELIEF_MESSIAH';

UPDATE Language_en_US
SET Text = Replace(Text, 'Reduces minimum Policy requirement for Wonders by 1. ', '')
WHERE Tag = 'TXT_KEY_BELIEF_MESSIAH';

----------------------------
-- buff universalism
----------------------------
UPDATE Belief_YieldChangePerXForeignFollowers SET ForeignFollowers = 5 WHERE BeliefType = 'BELIEF_RELIGIOUS_UNITY';
UPDATE Belief_YieldPerOtherReligionFollower SET Yield = 4 WHERE BeliefType = 'BELIEF_RELIGIOUS_UNITY';

UPDATE Language_en_US
SET Text = '+1 [ICON_RESEARCH] Science and [ICON_PRODUCTION] Production in the Holy City for every 4 followers of other Religions in owned Cities. +1 [ICON_GOLD] Gold and [ICON_PEACE] Faith in Holy City for every 5 followers of this [ICON_RELIGION] Religion in Foreign Cities.'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_UNITY';

-------------------------
-- cargo cult
-------------------------
INSERT INTO Belief_YieldModifierNaturalWonder
	(BeliefType, YieldType, Yield)
SELECT
	'BELIEF_CARGO_CULT', Type, 100
FROM Yields;

INSERT INTO Belief_BuildingClassFaithPurchase
	(BeliefType, BuildingClassType)
VALUES
	('BELIEF_CARGO_CULT', 'BUILDINGCLASS_AIRPORT');

UPDATE Buildings SET FaithCost = 1000, UnlockedByBelief = 1 WHERE BuildingClass = 'BUILDINGCLASS_AIRPORT';

INSERT INTO Belief_YieldFromKnownPantheons
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_CARGO_CULT', 'YIELD_GOLDEN_AGE_POINTS', 500);

------------------------------------------------------
-- Follower Yield Beliefs
------------------------------------------------------

UPDATE Belief_MaxYieldPerFollowerPercent SET Max = 50 WHERE BeliefType = 'BELIEF_ASCETISM';

UPDATE Belief_MaxYieldPerFollower SET Max = 999 WHERE BeliefType = 'BELIEF_ASCETISM';  -- if you set 0 then you get no yields.

INSERT INTO Belief_YieldChangeAnySpecialist
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_ASCETISM', 'YIELD_FOOD', 4);

UPDATE Language_en_US
SET Text = '+1 [ICON_FOOD] Food for every 2 followers in the City. +4 [ICON_FOOD] Food if the City has a Specialist.'
WHERE Tag = 'TXT_KEY_BELIEF_ASCETISM';

UPDATE Belief_MaxYieldPerFollower SET Max = 999 WHERE BeliefType = 'BELIEF_RELIGIOUS_COMMUNITY';

INSERT INTO Belief_YieldPerActiveTR
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_RELIGIOUS_COMMUNITY', 'YIELD_PRODUCTION', 2);
UPDATE Language_en_US
SET Text = '+1 [ICON_PRODUCTION] Production for every 2 followers in the City. +2 [ICON_PRODUCTION] Production per active [ICON_INTERNATIONAL_TRADE] Trade Route to or from the City.'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_COMMUNITY';

UPDATE Belief_MaxYieldPerFollowerPercent SET Max = 50 WHERE BeliefType = 'BELIEF_FEED_WORLD';

UPDATE Belief_MaxYieldPerFollower SET Max = 999 WHERE BeliefType = 'BELIEF_FEED_WORLD';

INSERT INTO Belief_ResourceYieldChanges
	(BeliefType, ResourceType, YieldType, Yield)
SELECT
	'BELIEF_FEED_WORLD', Type, 'YIELD_GOLD', 1
FROM Resources 
WHERE IsMonopoly = 0 AND Type NOT IN ('RESOURCE_ARTIFACTS', 'RESOURCE_HIDDEN_ARTIFACTS');

UPDATE Language_en_US
SET Text = '+1 [ICON_GOLD] Gold for every 2 followers in the City. +1 [ICON_GOLD] Gold from [COLOR_POSITIVE_TEXT]Bonus Resources[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_BELIEF_FEED_WORLD';

UPDATE Belief_MaxYieldPerFollower SET Max = 999 WHERE BeliefType = 'BELIEF_DIVINE_INSPIRATION';

DELETE FROM Belief_YieldChangeAnySpecialist WHERE BeliefType = 'BELIEF_DIVINE_INSPIRATION';
INSERT INTO Belief_GreatWorkYieldChanges
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_DIVINE_INSPIRATION', 'YIELD_CULTURE', 1);
UPDATE Language_en_US
SET Text = '+1 [ICON_CULTURE] Culture for every 3 followers in the City. +1 [ICON_CULTURE] Culture from [ICON_GREAT_WORK] Great Works.'
WHERE Tag = 'TXT_KEY_BELIEF_DIVINE_INSPIRATION';

UPDATE Belief_MaxYieldPerFollowerPercent SET Max = 34 WHERE BeliefType = 'BELIEF_CHORAL_MUSIC';

UPDATE Belief_MaxYieldPerFollower SET Max = 999 WHERE BeliefType = 'BELIEF_CHORAL_MUSIC';

INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BELIEF_CHORAL_MUSIC', 'BUILDINGCLASS_UNIVERSITY', 'YIELD_SCIENCE', 2);
UPDATE Language_en_US
SET Text = '+1 [ICON_RESEARCH] Science for every 3 followers in the City. +2 [ICON_RESEARCH] Science from Universities.'
WHERE Tag = 'TXT_KEY_BELIEF_CHORAL_MUSIC';

------------------
-- cooperation to match
INSERT INTO Belief_YieldChangeAnySpecialist
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_COMMUNALISM', 'YIELD_FOOD', 2);
UPDATE Language_en_US
SET Text = '[ICON_FOOD] Food and [ICON_PRODUCTION] Production Internal Trade Routes generate +3 of their respective yields, scaling with Era. +2 [ICON_FOOD] Food and [ICON_PRODUCTION] Production if the City has a Specialist.'
WHERE Tag = 'TXT_KEY_BELIEF_COMMUNALISM';

-- mastery/abstinence include labourers for custom civ options

INSERT INTO Belief_SpecialistYieldChanges
	(BeliefType, SpecialistType, YieldType, Yield)
VALUES
	('BELIEF_RELIGIOUS_ART', 'SPECIALIST_CITIZEN', 'YIELD_PRODUCTION', 1),
	('BELIEF_RELIGIOUS_ART', 'SPECIALIST_CITIZEN', 'YIELD_GOLDEN_AGE_POINTS', 1);

UPDATE Language_en_US
SET Text = 'Specialists and [ICON_CITIZEN_RED] Labourers generate +1 [ICON_GOLDEN_AGE] Golden Age Point and +1 of their primary Yield ([ICON_SCIENTIST]:[ICON_RESEARCH], [ICON_MERCHANT]/[ICON_CIVIL_SERVANT]:[ICON_GOLD], [ICON_ENGINEER]/[ICON_CITIZEN_RED]:[ICON_PRODUCTION], [ICON_WRITER]/[ICON_ARTIST]/[ICON_MUSICIAN]:[ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_ART';

---------------------
-- update reformations to have gallery and observatory
---------------------
-- gallery
INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BELIEF_UNDERGROUND_SECT', 'BUILDINGCLASS_GALLERY', 'YIELD_CULTURE', 2);

INSERT INTO Belief_BuildingClassFaithPurchase
	(BeliefType, BuildingClassType)
VALUES
	('BELIEF_UNDERGROUND_SECT', 'BUILDINGCLASS_GALLERY');

UPDATE Buildings SET
FaithCost = 450,
UnlockedByBelief = 1
WHERE BuildingClass = 'BUILDINGCLASS_GALLERY';

UPDATE Language_en_US
SET Text = Replace(Text, 'Amphitheaters,', 'Amphitheaters, Galleries,')
WHERE Tag = 'TXT_KEY_BELIEF_UNDERGROUND_SECT';

-- observatory
INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BELIEF_JESUIT_EDUCATION', 'BUILDINGCLASS_OBSERVATORY', 'YIELD_SCIENCE', 2);

INSERT INTO Belief_BuildingClassFaithPurchase
	(BeliefType, BuildingClassType)
VALUES
	('BELIEF_JESUIT_EDUCATION', 'BUILDINGCLASS_OBSERVATORY');

UPDATE Buildings SET
FaithCost = 450,
UnlockedByBelief = 1
WHERE BuildingClass = 'BUILDINGCLASS_OBSERVATORY';

UPDATE Language_en_US
SET Text = Replace(Text, 'Universities,', 'Universities, Observatories,')
WHERE Tag = 'TXT_KEY_BELIEF_JESUIT_EDUCATION';

