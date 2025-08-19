---------------------------------------
-- some actual sea power for manannan
---------------------------------------
INSERT INTO Belief_FreePromotions
	(BeliefType, PromotionType)
VALUES
	('BELIEF_MANANNAN', 'PROMOTION_AMPHIBIOUS');

DELETE FROM Belief_ImprovementYieldChanges WHERE BeliefType = 'BELIEF_MANANNAN';

INSERT INTO Belief_ImprovementYieldChanges
	(BeliefType, ImprovementType, YieldType, Yield)
VALUES
	('BELIEF_MANANNAN', 'IMPROVEMENT_FISHING_BOATS', 'YIELD_CULTURE', 1),
	('BELIEF_MANANNAN', 'IMPROVEMENT_FISHING_BOATS', 'YIELD_GREAT_ADMIRAL_POINTS', 1);

UPDATE Language_en_US SET
Text = '+3 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_GOLD] Gold if the City is [COLOR_POSITIVE]Coastal[ENDCOLOR]. +1 [ICON_PRODUCTION] Production from Water tiles and +1 [ICON_CULTURE] Culture and [ICON_GREAT_ADMIRAL] Great Admiral Point from Fishing Boats. Eligible Units receive the [COLOR_POSITIVE_TEXT]Amphibious[ENDCOLOR] Promotion. +2 [ICON_GREAT_ADMIRAL] Great Admiral Points from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_MANANNAN';

---------------------------------------
-- ogma, key bonus is kinda shit compared to bran
---------------------------------------
DELETE FROM Belief_YieldPerPop WHERE BeliefType = 'BELIEF_OGMA';

UPDATE Belief_BuildingClassYieldChanges SET YieldChange = 3 WHERE BeliefType = 'BELIEF_OGMA';  -- this was unusually high imo

UPDATE Belief_BuildingClassYieldChanges SET 
YieldChange = 2
WHERE BeliefType = 'BELIEF_OGMA' AND BuildingClassType = 'BUILDINGCLASS_PALACE';

INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BELIEF_OGMA', 'BUILDINGCLASS_LIBRARY', 'YIELD_SCIENCE', 2),
	('BELIEF_OGMA', 'BUILDINGCLASS_LIBRARY', 'YIELD_CULTURE', 2);

DELETE FROM Belief_GreatWorkYieldChanges WHERE BeliefType = 'BELIEF_OGMA';

INSERT INTO Belief_GreatWorkYieldChanges
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_OGMA', 'YIELD_FOOD', 1),
	('BELIEF_OGMA', 'YIELD_SCIENCE', 1),
	('BELIEF_OGMA', 'YIELD_CULTURE', 1);

UPDATE Belief_GreatPersonPoints SET GreatPersonType = 'GREATPERSON_WRITER' WHERE GreatPersonType = 'GREATPERSON_ARTIST' AND BeliefType = 'BELIEF_OGMA';

INSERT INTO Belief_SpecialistYieldChanges
	(BeliefType, SpecialistType, YieldType, Yield)
VALUES
	('BELIEF_OGMA', 'SPECIALIST_SCIENTIST', 'YIELD_FOOD', 1),
	('BELIEF_OGMA', 'SPECIALIST_SCIENTIST', 'YIELD_SCIENCE', 1),
	('BELIEF_OGMA', 'SPECIALIST_SCIENTIST', 'YIELD_CULTURE', 1),
	('BELIEF_OGMA', 'SPECIALIST_WRITER', 'YIELD_FOOD', 1),
	('BELIEF_OGMA', 'SPECIALIST_WRITER', 'YIELD_SCIENCE', 1),
	('BELIEF_OGMA', 'SPECIALIST_WRITER', 'YIELD_CULTURE', 1);

UPDATE Language_en_US SET
Text = '+2 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture from Libraries and the Palace. +1 [ICON_FOOD] Food, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture from [ICON_GREAT_WORK] Great Works, [ICON_VP_SCIENTIST] Scientists, and [ICON_VP_WRITER] Writers. +3 [ICON_GREAT_SCIENTIST] Great Scientist Points and [ICON_GREAT_WRITER] Great Writer Points in your [ICON_CAPITAL] Capital/Holy City. +3 [ICON_RESEARCH] Science from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_OGMA';

---------------------------------------
-- cernunnos unimproved feature yields idea
---------------------------------------
INSERT INTO Belief_UnimprovedFeatureYieldChanges
	(BeliefType, FeatureType, YieldType, Yield)
SELECT
	'BELIEF_CERNUNNOS', Type, 'YIELD_FOOD', 1
FROM Features;

INSERT INTO Belief_UnimprovedFeatureYieldChanges
	(BeliefType, FeatureType, YieldType, Yield)
SELECT
	'BELIEF_CERNUNNOS', Type, 'YIELD_PRODUCTION', 1
FROM Features;

INSERT INTO Belief_LakePlotYield
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_CERNUNNOS', 'YIELD_FOOD', 1),
	('BELIEF_CERNUNNOS', 'YIELD_PRODUCTION', 1);

DELETE FROM Belief_FeatureYieldChanges WHERE BeliefType = 'BELIEF_CERNUNNOS' AND YieldType = 'YIELD_FOOD';
DELETE FROM Belief_FeatureYieldChanges WHERE BeliefType = 'BELIEF_CERNUNNOS' AND FeatureType = 'FEATURE_JUNGLE';

INSERT INTO Belief_FeatureYieldChanges
	(BeliefType, FeatureType, YieldType, Yield)
VALUES
	('BELIEF_CERNUNNOS', 'FEATURE_JUNGLE', 'YIELD_GOLD', 1);

UPDATE Language_en_US SET
Text = '+1 [ICON_FOOD] Food and [ICON_PRODUCTION] Production from every [COLOR_NEGATIVE_TEXT]unimproved[ENDCOLOR] Feature. +1 [ICON_GOLD] Gold from Forests and Jungles. +1 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture from Camps and Plantations. +2 [ICON_CULTURE] Culture from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_CERNUNNOS';

---------------------------------------
-- rhiannon with natural wonders 
---------------------------------------
UPDATE Beliefs SET 
RequiresImprovement = 0,
RequiresResource = 0,
MinPopulation = 4
WHERE Type = 'BELIEF_RHIANNON';

DELETE FROM Belief_ImprovementYieldChanges WHERE BeliefType = 'BELIEF_RHIANNON';
DELETE FROM Belief_YieldPerFollowingCity WHERE BeliefType = 'BELIEF_RHIANNON';

INSERT INTO Belief_YieldChangeNaturalWonder
	(BeliefType, YieldType, Yield)
SELECT
	'BELIEF_RHIANNON', Type, 3
FROM Yields WHERE ID < 6;

DELETE FROM Belief_BuildingClassYieldChanges WHERE BeliefType = 'BELIEF_RHIANNON';

INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
SELECT
	'BELIEF_RHIANNON', 'BUILDINGCLASS_CIRCUS', Type, 1
FROM Yields WHERE ID < 6;

INSERT INTO Belief_CityYieldChanges
	(BeliefType, YieldType, Yield)
SELECT
	'BELIEF_RHIANNON', Type, 1
FROM Yields WHERE ID < 6;

INSERT INTO UnitPromotions
	(Type, Description, Help, 
	PediaType, PediaEntry, PortraitIndex, IconAtlas, IsVisibleAboveFlag, CannotBeChosen,
	EnemyRoute, MovesChange, ExtraNavalMovement, IgnoreZOC, IgnoreTerrainCost, RivalTerritory)
VALUES
	('PROMOTION_RHIANNON', 'TXT_KEY_PROMOTION_RHIANNON', 'TXT_KEY_PROMOTION_RHIANNON_HELP', 
	'PEDIA_CIVILIAN', 'TXT_KEY_PROMOTION_RHIANNON', 22, 'extraPromo_Atlas', 1, 1,
	1, 2, 2, 1, 1, 1);

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_RHIANNON', 'UNITCOMBAT_SETTLER');

INSERT INTO Belief_FreePromotions
	(BeliefType, PromotionType)
VALUES
	('BELIEF_RHIANNON', 'PROMOTION_RHIANNON');

UPDATE Language_en_US SET
Text = '+1 [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] if the City has at least 4 [ICON_CITIZEN] Citizens. +3 [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] from Natural Wonders. Settler Units receive the [COLOR_POSITIVE_TEXT]Rhiannon''s Path[ENDCOLOR] Promotion. +1 [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_RHIANNON';

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_RHIANNON', 'Rhiannon''s Path'),
	('TXT_KEY_PROMOTION_RHIANNON_HELP', '+2 [ICON_MOVES] Movement.[NEWLINE]Ignores Terrain Costs, Zone of Control, and rival borders.[NEWLINE]Can use enemy Routes.');

---------------------------------------
-- revert bran dagda healing swap c.f. pdan thread
---------------------------------------
UPDATE Beliefs
SET
	FriendlyHealChange = 10,
	CityGrowthModifier = 25,
	HappinessPerCity = 1
WHERE Type = 'BELIEF_DAGDA';

UPDATE Language_en_US SET
Text = '+25% [ICON_FOOD] Growth and +1 [ICON_HAPPINESS_1] Happiness. +12 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, and [ICON_CULTURE] Culture when a [ICON_CITIZEN] Citizen is born, scaling with Era. Units heal [COLOR_POSITIVE_TEXT]+10 HP[ENDCOLOR] per turn in owned Territory. +5 [ICON_FOOD] Food from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_DAGDA';

---------------------------------------
-- and buff bran so it has something for a non-capital bonus
---------------------------------------
UPDATE Beliefs
SET
	FriendlyHealChange = 0,
	CityRangeStrikeModifier = 25
WHERE Type = 'BELIEF_BRAN';

INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
SELECT
	'BELIEF_BRAN', 'BUILDINGCLASS_WALLS', Type, 1
FROM Yields WHERE Type IN ('YIELD_PRODUCTION', 'YIELD_GOLD', 'YIELD_SCIENCE', 'YIELD_CULTURE');

UPDATE Language_en_US SET
Text = '+1 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture from Walls and the Palace. +4 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture in your [ICON_CAPITAL] Capital/Holy City for every 5 Followers of your [ICON_RELIGION_PANTHEON] Pantheon in owned Cities. +25% City [ICON_RANGE_STRENGTH] Ranged Combat Strength. +2 [ICON_HAPPINESS_1] Happiness from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_BRAN';

---------------------------------------
-- Cailleach, the Hag
---------------------------------------
UPDATE Belief_BuildingClassYieldChanges SET YieldChange = 4 WHERE BeliefType = 'BELIEF_CAILLEACH';
UPDATE Belief_BuildingClassYieldChanges SET YieldType = 'YIELD_PRODUCTION' WHERE BeliefType = 'BELIEF_CAILLEACH';

INSERT INTO Belief_CityYieldPerXTerrainTimes100
	(BeliefType, TerrainType, YieldType, Yield)
VALUES
	('BELIEF_CAILLEACH', 'TERRAIN_TUNDRA', 'YIELD_GOLD', 50);

UPDATE Belief_ImprovementYieldChanges SET YieldType = 'YIELD_PRODUCTION' WHERE YieldType = 'YIELD_GOLD' AND BeliefType = 'BELIEF_CAILLEACH';

DELETE FROM Belief_TerrainYieldChanges WHERE BeliefType = 'BELIEF_CAILLEACH';

INSERT INTO Belief_TerrainYieldChanges
	(BeliefType, TerrainType, YieldType, Yield)
VALUES
	('BELIEF_CAILLEACH', 'TERRAIN_SNOW', 'YIELD_FOOD', 2),
	('BELIEF_CAILLEACH', 'TERRAIN_SNOW', 'YIELD_PRODUCTION', 2),
	('BELIEF_CAILLEACH', 'TERRAIN_SNOW', 'YIELD_GOLD', 2);

UPDATE Language_en_US SET
Text = '+1 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_GOLD] Gold for every 2 Tundra tiles worked by the City. +2 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_GOLD] Gold from Snow tiles with Resources. +1 [ICON_PRODUCTION] Production and [ICON_CULTURE] Culture from Quarries and Mines on Resources. +4 [ICON_PRODUCTION] Production from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_CAILLEACH';

--UPDATE Language_en_US SET
--Text = 'Cailleach, the Hag'
--WHERE Tag = 'TXT_KEY_BELIEF_CAILLEACH_SHORT';

---------------------------------------
-- Epona, the Great Mare
---------------------------------------
DELETE FROM Belief_CityYieldChanges WHERE BeliefType = 'BELIEF_EPONA';

INSERT INTO Belief_ImprovementYieldChanges
	(BeliefType, ImprovementType, YieldType, Yield)
VALUES
	('BELIEF_EPONA', 'IMPROVEMENT_PASTURE', 'YIELD_CULTURE_LOCAL', 3);

INSERT INTO Belief_BuildingClassHappiness
	(BeliefType, BuildingClassType, Happiness)
VALUES
	('BELIEF_EPONA', 'BUILDINGCLASS_STABLE', 1);

INSERT INTO Belief_BuildingClassFaithPurchase
	(BeliefType, BuildingClassType)
VALUES
	('BELIEF_EPONA', 'BUILDINGCLASS_STABLE');	

UPDATE Buildings SET 
FaithCost = 400,
UnlockedByBelief = 1
WHERE Type = 'BUILDING_STABLE';

UPDATE Language_en_US SET
Text = '+3 [ICON_CULTURE_LOCAL] Border Growth from Pastures. +1 [ICON_HAPPINESS_1] Happiness from Stables and can purchase them with [ICON_PEACE] Faith. Gain +8 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture every time the City expands its borders naturally, scaling with Era. +5 [ICON_CULTURE_LOCAL] Border Growth from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_EPONA';

---------------------------------------
-- Lugh: Egypt is going a different way can buff this
---------------------------------------
INSERT INTO Belief_YieldChangeAnySpecialist
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_LUGH', 'YIELD_TOURISM', 2);

UPDATE Beliefs SET WonderProductionModifier = 25 WHERE Type = 'BELIEF_LUGH';

UPDATE Belief_BuildingClassYieldChanges SET YieldChange = 5 WHERE BeliefType = 'BELIEF_LUGH';
UPDATE Belief_BuildingClassYieldChanges SET YieldType = 'YIELD_TOURISM' WHERE BeliefType = 'BELIEF_LUGH';

UPDATE Language_en_US SET
Text = '+2 [ICON_FOOD] Food, [ICON_GOLD] Gold, [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, and [ICON_TOURISM] Tourism if the City has a Specialist. +25% [ICON_PRODUCTION] Production towards [ICON_WONDER] Wonders. +2 [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism from [ICON_WONDER] World Wonders. +5 [ICON_TOURISM] Tourism from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_LUGH';

---------------------------------------
-- Morrigan, typo and added last effect
---------------------------------------

INSERT INTO Belief_ResourceYieldChanges
	(BeliefType, ResourceType, YieldType, Yield)
SELECT
	'BELIEF_MORRIGAN', Type, 'YIELD_GREAT_GENERAL_POINTS', 1
FROM Resources WHERE ResourceUsage = 1;

UPDATE Language_en_US SET
Text = '+1 [ICON_GREAT_GENERAL] Great General Point from Strategic Resources. Gain [ICON_GOLD] Gold, [ICON_CULTURE] Culture, and [ICON_GOLDEN_AGE] Golden Age Points from killing enemy units equal to 200% of its [ICON_STRENGTH] Strength, and gain 20 of each yield when you [COLOR_POSITIVE_TEXT]pillaging improvements[ENDCOLOR], scaling with Era. +2 [ICON_GREAT_GENERAL] Great General Points from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_MORRIGAN';

---------------------------------------
-- nuada has no culture. add small amount through theme
---------------------------------------
DELETE FROM Belief_YieldFromWLTKD WHERE BeliefType = 'BELIEF_NUADA';

INSERT INTO Belief_YieldFromWLTKD
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_NUADA', 'YIELD_GOLD', 10),
	('BELIEF_NUADA', 'YIELD_SCIENCE', 10),
	('BELIEF_NUADA', 'YIELD_CULTURE', 10);

UPDATE Language_en_US SET
Text = '+10% [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture during "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]". +3 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_GOLDEN_AGE] Golden Age Points in your [ICON_CAPITAL] Capital/Holy City for every unique Luxury Resource owned or imported, and per active Trade Route [ICON_ARROW_LEFT] to or [ICON_ARROW_RIGHT] from the City. +5 [ICON_GOLD] Gold from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_NUADA';

-----------------------------
-----------------------------
-- new ones
-----------------------------
-----------------------------

-----------------------------
-- gwyn who is a mix with idris the giant and the grey king
-----------------------------

INSERT INTO Beliefs
	(Type, Description, ShortDescription, Pantheon, CivilizationType, Tooltip, FaithFromKills, FaithFromDyingUnits)
VALUES
	('BELIEF_GWYN', 'TXT_KEY_BELIEF_GWYN', 'TXT_KEY_BELIEF_GWYN_SHORT', 1, 'CIVILIZATION_CELTS', 'TXT_KEY_BELIEF_GWYN', 200, 200);

INSERT INTO Belief_CityYieldPerXTerrainTimes100 -- Special: mountains don't need to be worked, but yields are capped at population
	(BeliefType, TerrainType, YieldType, Yield)
VALUES
	('BELIEF_GWYN', 'TERRAIN_MOUNTAIN', 'YIELD_FOOD', 50),
	('BELIEF_GWYN', 'TERRAIN_MOUNTAIN', 'YIELD_SCIENCE', 50),
	('BELIEF_GWYN', 'TERRAIN_MOUNTAIN', 'YIELD_CULTURE', 50);

-- (partial) copy from tweaks mod
-- balance altitude training and make it available
DELETE FROM UnitPromotions_Terrains WHERE PromotionType = 'PROMOTION_ALTITUDE_TRAINING';

UPDATE UnitPromotions SET 
HillsDoubleMove = 0,
HillsAttack = 20,
CanCrossMountains = 1,
PediaType = 'PEDIA_SCOUTING',
RankList = 'ALPINE',
RankNumber = 1
WHERE Type = 'PROMOTION_ALTITUDE_TRAINING';

UPDATE Language_en_US SET
Text = '+20% [ICON_STRENGTH] Attack in Hills.[NEWLINE]Can cross Mountains.'
WHERE Tag = 'TXT_KEY_PROMOTION_ALTITUDE_TRAINING_HELP';

INSERT INTO Belief_FreePromotions
	(BeliefType, PromotionType)
VALUES
	('BELIEF_GWYN', 'PROMOTION_ALTITUDE_TRAINING');

INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BELIEF_GWYN', 'BUILDINGCLASS_CIRCUS', 'YIELD_FAITH', 3);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_GWYN', '+1 [ICON_FOOD] Food, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture for every 2 Mountains within 3 tiles of the City (capping at the City''s population). Eligible Units receive the [COLOR_POSITIVE_TEXT]Altitude Training[ENDCOLOR] Promotion. Gain [ICON_PEACE] Faith when an enemy Unit is killed or an owned Unit dies equal to 200% of its [ICON_STRENGTH] Strength. +3 [ICON_PEACE] Faith from Ceilidh Hall.'),
	('TXT_KEY_BELIEF_GWYN_SHORT', 'Gwyn, Monarch of the Mists');

----------------------------------------
-- olwen a sun-type diety for the desert
----------------------------------------
INSERT INTO Beliefs
	(Type, Description, ShortDescription, Pantheon, CivilizationType, Tooltip)
VALUES
	('BELIEF_OLWEN', 'TXT_KEY_BELIEF_OLWEN', 'TXT_KEY_BELIEF_OLWEN_SHORT', 1, 'CIVILIZATION_CELTS', 'TXT_KEY_BELIEF_OLWEN');

INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BELIEF_OLWEN', 'BUILDINGCLASS_CIRCUS', 'YIELD_GOLDEN_AGE_POINTS', 5);

INSERT INTO Belief_TerrainYieldChanges
	(BeliefType, TerrainType, YieldType, Yield)
VALUES
	('BELIEF_OLWEN', 'TERRAIN_DESERT', 'YIELD_FOOD', 1),
	('BELIEF_OLWEN', 'TERRAIN_DESERT', 'YIELD_PRODUCTION', 1);

INSERT INTO Belief_CityYieldPerXTerrainTimes100
	(BeliefType, TerrainType, YieldType, Yield)
VALUES
	('BELIEF_OLWEN', 'TERRAIN_PLAINS', 'YIELD_FOOD', 50),
	('BELIEF_OLWEN', 'TERRAIN_PLAINS', 'YIELD_PRODUCTION', 50);

INSERT INTO Belief_CityYieldPerXFeatureTimes100
	(BeliefType, FeatureType, YieldType, Yield)
VALUES
	('BELIEF_OLWEN', 'FEATURE_FLOOD_PLAINS', 'YIELD_PRODUCTION', 50),
	('BELIEF_OLWEN', 'FEATURE_FLOOD_PLAINS', 'YIELD_FOOD', 50);

INSERT INTO Belief_FeatureYieldChanges
	(BeliefType, FeatureType, YieldType, Yield)
VALUES
	('BELIEF_OLWEN', 'FEATURE_FLOOD_PLAINS', 'YIELD_FOOD', -1),
	('BELIEF_OLWEN', 'FEATURE_FLOOD_PLAINS', 'YIELD_PRODUCTION', -1);

INSERT INTO Belief_ImprovementYieldChanges
	(BeliefType, ImprovementType, YieldType, Yield)
VALUES
	('BELIEF_OLWEN', 'IMPROVEMENT_FARM', 'YIELD_SCIENCE', 1),
	('BELIEF_OLWEN', 'IMPROVEMENT_FARM', 'YIELD_GOLDEN_AGE_POINTS', 1);

INSERT INTO Belief_YieldBonusGoldenAge
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_OLWEN', 'YIELD_CULTURE', 15);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_OLWEN', '+1 [ICON_FOOD] Food and [ICON_PRODUCTION] Production from Desert tiles [COLOR_NEGATIVE_TEXT]without[ENDCOLOR] Flood Plains, and for every 2 Plains or 2 Flood Plains tiles worked by the City. +1 [ICON_RESEARCH] Science and [ICON_GOLDEN_AGE] Golden Age Point from Farms. +15% [ICON_CULTURE] Culture in the [ICON_CAPITAL] Capital/Holy City during [ICON_GOLDEN_AGE] Golden Ages. +5 [ICON_GOLDEN_AGE] Golden Age Points from Ceilidh Hall.'),
	('TXT_KEY_BELIEF_OLWEN_SHORT', 'Olwen, the Golden Wheel');

