-- Tree structure
UPDATE Policies
SET GridX = 5, GridY = 1
WHERE Type = 'POLICY_CARAVANS';

UPDATE Policies
SET GridX = 3, GridY = 1
WHERE Type = 'POLICY_TRADE_UNIONS';

UPDATE Policies
SET GridX = 2, GridY = 3
WHERE Type = 'POLICY_ENTREPRENEURSHIP';

UPDATE Policies
SET GridX = 5, GridY = 2,
PortraitIndex = 11
WHERE Type = 'POLICY_MERCANTILISM';

UPDATE Policies
SET GridX = 4, GridY = 3,
PortraitIndex = 9
WHERE Type = 'POLICY_PROTECTIONISM';

DELETE FROM Policy_PrereqPolicies WHERE PolicyType IN ('POLICY_PROTECTIONISM', 'POLICY_ENTREPRENEURSHIP', 'POLICY_MERCANTILISM');

INSERT INTO Policy_PrereqPolicies
	(PolicyType, PrereqPolicy)
VALUES	
	('POLICY_MERCANTILISM', 'POLICY_CARAVANS'),	
	('POLICY_ENTREPRENEURSHIP', 'POLICY_TRADE_UNIONS'),
	('POLICY_PROTECTIONISM', 'POLICY_MERCANTILISM'),
	('POLICY_PROTECTIONISM', 'POLICY_TRADE_UNIONS');

------------------------
-- Opener (now Industry)
UPDATE Policies
SET FreeTradeRoute = 0,
GreatMerchantRateModifier = 50
WHERE Type = 'POLICY_COMMERCE';

INSERT INTO Policy_BuildingClassProductionModifiers
	(PolicyType, BuildingClassType, ProductionModifier)
VALUES
	('POLICY_COMMERCE', 'BUILDINGCLASS_COALING_STATION', 100);

INSERT INTO Policy_HurryModifiers
	(PolicyType, HurryType, HurryCostModifier)
VALUES
	('POLICY_COMMERCE', 'HURRY_GOLD', -5);
-- an additional 5

-- Wagon Trains (now Trade Subsidies)
UPDATE Policies
SET
	RouteGoldMaintenanceMod = 0,
	GreatMerchantRateModifier = 0,
	LandTradeRouteGoldChange = 0,
	SeaTradeRouteGoldChange = 0,
	PovertyFlatReduction = 0,
	RouteGoldMaintenanceMod = -50
WHERE Type = 'POLICY_CARAVANS';

INSERT INTO Policy_YieldFromConstruction
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_CARAVANS', 'YIELD_SCIENCE', 15);

INSERT INTO Policy_BuildingClassHappiness
	(PolicyType, BuildingClassType, Happiness)
VALUES
	('POLICY_CARAVANS', 'BUILDINGCLASS_WINDMILL', 1);

-- Mercenary Army (now Division of Labor)
DELETE FROM Policy_BuildingClassYieldModifiers WHERE PolicyType = 'POLICY_TRADE_UNIONS';

INSERT INTO Policy_BuildingClassYieldChanges
	(PolicyType, BuildingClassType, YieldType, YieldChange)
VALUES
	('POLICY_TRADE_UNIONS', 'BUILDINGCLASS_ARMORY', 'YIELD_PRODUCTION', 1),
	('POLICY_TRADE_UNIONS', 'BUILDINGCLASS_ARMORY', 'YIELD_CULTURE', 1),
	('POLICY_TRADE_UNIONS', 'BUILDINGCLASS_WINDMILL', 'YIELD_PRODUCTION', 1),
	('POLICY_TRADE_UNIONS', 'BUILDINGCLASS_WINDMILL', 'YIELD_CULTURE', 1),
	('POLICY_TRADE_UNIONS', 'BUILDINGCLASS_WORKSHOP', 'YIELD_PRODUCTION', 1),
	('POLICY_TRADE_UNIONS', 'BUILDINGCLASS_WORKSHOP', 'YIELD_CULTURE', 1),
	('POLICY_TRADE_UNIONS', 'BUILDINGCLASS_FACTORY', 'YIELD_PRODUCTION', 1),
	('POLICY_TRADE_UNIONS', 'BUILDINGCLASS_FACTORY', 'YIELD_CULTURE', 1),
	('POLICY_TRADE_UNIONS', 'BUILDINGCLASS_COALING_STATION', 'YIELD_PRODUCTION', 1),
	('POLICY_TRADE_UNIONS', 'BUILDINGCLASS_COALING_STATION', 'YIELD_CULTURE', 1);

DELETE FROM Policy_BuildingClassProductionModifiers WHERE PolicyType = 'POLICY_TRADE_UNIONS';

UPDATE Policies SET
	LandTradeRouteGoldChange = 500,
	SeaTradeRouteGoldChange = 500
WHERE Type = 'POLICY_TRADE_UNIONS';

/*
INSERT INTO Policy_YieldChangeTradeRoute
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_TRADE_UNIONS', 'YIELD_PRODUCTION', 4),
	('POLICY_TRADE_UNIONS', 'YIELD_GOLD', 4);
*/

-- Entrepreneurship
UPDATE Policies
SET
	GreatMerchantRateModifier = 0,
	TradeMissionGoldModifier = 0,
	GreatEngineerHurryModifier = 0
WHERE Type = 'POLICY_ENTREPRENEURSHIP';

DELETE FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_ENTREPRENEURSHIP';

DELETE FROM Policy_ImprovementYieldChanges WHERE PolicyType = 'POLICY_ENTREPRENEURSHIP';

INSERT INTO Policy_ImprovementYieldChanges
	(PolicyType, ImprovementType, YieldType, Yield)
VALUES		
	('POLICY_ENTREPRENEURSHIP', 'IMPROVEMENT_CUSTOMS_HOUSE', 'YIELD_CULTURE', 3),
	('POLICY_ENTREPRENEURSHIP', 'IMPROVEMENT_CUSTOMS_HOUSE', 'YIELD_FOOD', 3),
	('POLICY_ENTREPRENEURSHIP', 'IMPROVEMENT_TRADING_POST', 'YIELD_CULTURE', 1),
	('POLICY_ENTREPRENEURSHIP', 'IMPROVEMENT_TRADING_POST', 'YIELD_GOLD', 2),
	('POLICY_ENTREPRENEURSHIP', 'IMPROVEMENT_MINE', 'YIELD_PRODUCTION', 2),
	('POLICY_ENTREPRENEURSHIP', 'IMPROVEMENT_MINE', 'YIELD_GOLD', 1),
	('POLICY_ENTREPRENEURSHIP', 'IMPROVEMENT_FARM', 'YIELD_PRODUCTION', 2),
	('POLICY_ENTREPRENEURSHIP', 'IMPROVEMENT_FARM', 'YIELD_GOLD', 1),
	('POLICY_ENTREPRENEURSHIP', 'IMPROVEMENT_LUMBERMILL', 'YIELD_PRODUCTION', 2),
	('POLICY_ENTREPRENEURSHIP', 'IMPROVEMENT_LUMBERMILL', 'YIELD_GOLD', 1);

-- Mercantilism
DELETE FROM Policy_YieldFromConstruction WHERE PolicyType = 'POLICY_MERCANTILISM';

DELETE FROM Policy_BuildingClassYieldModifiers WHERE PolicyType = 'POLICY_MERCANTILISM';

INSERT INTO Policy_BuildingClassYieldChanges
	(PolicyType, BuildingClassType, YieldType, YieldChange)
VALUES
	('POLICY_MERCANTILISM', 'BUILDINGCLASS_HOTEL', 'YIELD_SCIENCE', 1),
	('POLICY_MERCANTILISM', 'BUILDINGCLASS_HOTEL', 'YIELD_GOLD', 1),
	('POLICY_MERCANTILISM', 'BUILDINGCLASS_CARAVANSARY', 'YIELD_SCIENCE', 1),
	('POLICY_MERCANTILISM', 'BUILDINGCLASS_CARAVANSARY', 'YIELD_GOLD', 1),
	('POLICY_MERCANTILISM', 'BUILDINGCLASS_MINT', 'YIELD_SCIENCE', 1),
	('POLICY_MERCANTILISM', 'BUILDINGCLASS_MINT', 'YIELD_GOLD', 1),
	('POLICY_MERCANTILISM', 'BUILDINGCLASS_BANK', 'YIELD_SCIENCE', 1),
	('POLICY_MERCANTILISM', 'BUILDINGCLASS_BANK', 'YIELD_GOLD', 1),
	('POLICY_MERCANTILISM', 'BUILDINGCLASS_STOCK_EXCHANGE', 'YIELD_GOLD', 1),
	('POLICY_MERCANTILISM', 'BUILDINGCLASS_STOCK_EXCHANGE', 'YIELD_SCIENCE', 1);

UPDATE Policies SET FreeTradeRoute = 2 WHERE Type = 'POLICY_MERCANTILISM';

-- Protectionism (now Gold Standard)
UPDATE Policies
SET
InternalTradeRouteYieldModifier = 0,
TradeMissionGoldModifier = 25
WHERE Type = 'POLICY_PROTECTIONISM';

DELETE FROM Policy_WLTKDYieldMod WHERE PolicyType = 'POLICY_PROTECTIONISM';

INSERT INTO Policy_WLTKDYieldMod
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_PROTECTIONISM', 'YIELD_CULTURE', 10),
	('POLICY_PROTECTIONISM', 'YIELD_GOLD', 10);

-- Finisher
DELETE FROM Policy_SpecialistExtraYields WHERE PolicyType = 'POLICY_COMMERCE_FINISHER';

INSERT INTO Policy_ResourceYieldChanges
	(PolicyType, ResourceType, YieldType, Yield)
SELECT
	'POLICY_COMMERCE_FINISHER', Type, 'YIELD_PRODUCTION', 1
FROM Resources
WHERE IsMonopoly = 0 AND Type NOT IN ('RESOURCE_ARTIFACTS', 'RESOURCE_HIDDEN_ARTIFACTS') UNION ALL
SELECT
	'POLICY_COMMERCE_FINISHER', Type, 'YIELD_SCIENCE', 2
FROM Resources WHERE IsMonopoly = 0 AND Type NOT IN ('RESOURCE_ARTIFACTS', 'RESOURCE_HIDDEN_ARTIFACTS');

--------------------
-- Industry
--------------------
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Industry[ENDCOLOR] augments City [ICON_PRODUCTION][ICON_GOLD][ICON_RESEARCH][ICON_CULTURE] Yields by boosting common Improvements, Buildings, and Resources. It uniquely increases the value of [ICON_INVEST] Investments and Purchases, and offers several benefits to [ICON_GREAT_MERCHANT] Great Merchants.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting Industry grants:[ENDCOLOR][NEWLINE][ICON_BULLET]+100% [ICON_PRODUCTION] Production towards Coaling Stations.[NEWLINE][ICON_BULLET]Earn [ICON_GREAT_MERCHANT] Great Merchants 50% faster.[NEWLINE][ICON_BULLET]-10% [ICON_INVEST] Gold needed for purchases.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Each Industry policy unlocked grants:[ENDCOLOR][NEWLINE][ICON_BULLET]-5% [ICON_INVEST] Gold needed for purchases.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting all Policies in Industry grants:[ENDCOLOR][NEWLINE][ICON_BULLET]Unlocks building [COLOR_POSITIVE_TEXT]Broadway[ENDCOLOR].[NEWLINE][ICON_BULLET]+3 [ICON_HAPPINESS_1] Happiness per unique owned Luxury Resource.[NEWLINE][ICON_BULLET]+2 [ICON_RESEARCH] Science and +1 [ICON_PRODUCTION] Production from Bonus Resources.[NEWLINE][ICON_BULLET]Allows for the purchase of [ICON_GREAT_MERCHANT] Great Merchants with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_COMMERCE_HELP';

UPDATE Language_en_US
SET Text = 'Division of Labor'
WHERE Tag = 'TXT_KEY_POLICY_TRADE_UNIONS';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Division of Labor[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production and [ICON_CULTURE] Culture from Armories, Workshops, Windmills, Factories, and Coaling Stations.[NEWLINE][ICON_BULLET]+5 [ICON_GOLD] Golde from [ICON_INTERNATIONAL_TRADE] International Trade Routes.'
WHERE Tag = 'TXT_KEY_POLICY_TRADE_UNIONS_HELP';
-- [ICON_CONNECTED] City Connections generate +4 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold.

UPDATE Language_en_US
SET Text = 'Subsidies'
WHERE Tag = 'TXT_KEY_POLICY_CARAVANS';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Subsidies[ENDCOLOR][NEWLINE][ICON_BULLET]-50% [ICON_GOLD] Route Maintenance.[NEWLINE][ICON_BULLET]Cities earn +15 [ICON_RESEARCH] Science when they construct Buildings, scaling with Era.[NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness from {TXT_KEY_BUILDING_WINDMILL}.'
WHERE Tag = 'TXT_KEY_POLICY_CARAVANS_HELP';

UPDATE Language_en_US
SET Text = 'A subsidy is any financial aid provided by a government to a producer or seller of a good or service that is designed to increase the competitiveness of a particular industry firm or entire industry. An employment subsidy can protect jobs in a crisis, a transport subsidy can open up new transport routes, and an export subsidy can be used to pursue a policy of mercantilism.'
WHERE Tag = 'TXT_KEY_POLICY_CARAVANS_TEXT';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Mercantilism[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_RESEARCH] Science and [ICON_GOLD] Gold from Caravansaries, Customs Houses, Banks, Hotels, and Stock Exchanges.[NEWLINE][ICON_BULLET]+2 [ICON_INTERNATIONAL_TRADE] Trade Routes.'
WHERE Tag = 'TXT_KEY_POLICY_MERCANTILISM_HELP';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Entrepreneurship[ENDCOLOR][NEWLINE][ICON_BULLET]+2 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold from every Mine, Farm, and Lumber Mill.[NEWLINE][ICON_BULLET]+2 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture from every Village.[NEWLINE][ICON_BULLET]+3 [ICON_FOOD] Food and [ICON_CULTURE] Culture from every Town.'
WHERE Tag = 'TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';

UPDATE Language_en_US
SET Text = 'Gold Standard'
WHERE Tag = 'TXT_KEY_POLICY_PROTECTIONISM';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Gold Standard[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_INVEST] Gold investments in Buildings reduce their [ICON_PRODUCTION] Production cost by an additional 10%.[NEWLINE][ICON_BULLET]+10% [ICON_GOLD] Gold and [ICON_CULTURE] Culture during "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]".[NEWLINE][ICON_BULLET]+25% Instant Yields from [ICON_GREAT_MERCHANT] Great Merchants.'
WHERE Tag = 'TXT_KEY_POLICY_PROTECTIONISM_HELP';

UPDATE Language_en_US
SET Text = 'Throughout history, precious metals have formed the basis of (commodity) money. As large sums became traded more commonly, representative money in the form of notes and certificates became the main medium of exchange. In this context, a gold standard is a monetary system in which representative money is exchangable for a fixed quantity of gold bullion. This was done to maintain stable exchange rates and limit inflation, although these effects are not guaranteed and the choice comes with significant monetary policy implications. The gold standard was the basis for the international monetary system from the 1870s to the early 1920s, and intermittently until 1971 when the world''s reserve currency, the US dollar, terminated its convertibility policy.'
WHERE Tag = 'TXT_KEY_POLICY_PROTECTIONISM_TEXT';

---------------
-- if EE is active
--------------
UPDATE Policy_BuildingClassProductionModifiers SET
ProductionModifier = 50 
WHERE PolicyType = 'POLICY_COMMERCE' AND EXISTS (SELECT * FROM Eras WHERE Type='ERA_ENLIGHTENMENT');

INSERT INTO Policy_BuildingClassProductionModifiers
	(PolicyType, BuildingClassType, ProductionModifier)
SELECT
	'POLICY_COMMERCE', Type, 50
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_EE_WEIGH_HOUSE', 'BUILDINGCLASS_EE_CLOTH_MILL') 
AND EXISTS (SELECT * FROM Eras WHERE Type='ERA_ENLIGHTENMENT');

UPDATE Language_en_US SET
Text = Replace(Text, '+100%', '+50%')
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_COMMERCE_HELP'
AND EXISTS (SELECT * FROM Eras WHERE Type='ERA_ENLIGHTENMENT');

UPDATE Language_en_US SET
Text = Replace(Text, 'Production towards ', 'Production towards Weigh Houses, Cloth Mills, and ')
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_COMMERCE_HELP'
AND EXISTS (SELECT * FROM Eras WHERE Type='ERA_ENLIGHTENMENT');
-------------------
------------------

