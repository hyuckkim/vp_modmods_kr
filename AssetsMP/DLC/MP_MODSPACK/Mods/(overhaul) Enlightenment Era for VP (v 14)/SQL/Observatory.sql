-- Observatory
-- bit dangerous to up this for e.g. Inca
--UPDATE Building_YieldPerXTerrainTimes100 SET Yield = 100 WHERE BuildingType = 'BUILDING_OBSERVATORY';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_OBSERVATORY', 'FEATURE_ATOLL', 'YIELD_SCIENCE', 2);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_OBSERVATORY', 'BUILDINGCLASS_HARBOR', 'YIELD_SCIENCE', 1),
	('BUILDING_OBSERVATORY', 'BUILDINGCLASS_HARBOR', 'YIELD_GOLDEN_AGE_POINTS', 1);

UPDATE Buildings SET
	PolicyType = NULL,  -- so have to change the policy too
	Mountain = 0,
	SpecialistCount = 1,
	ConquestProb = 80,
	TradeRouteSeaDistanceModifier = 25,
	EnhancedYieldTech = 'TECH_EE_REFRACTION'
WHERE Type = 'BUILDING_OBSERVATORY';

INSERT INTO Building_TechEnhancedYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_OBSERVATORY', 'YIELD_SCIENCE', 4);

DELETE FROM Policy_GoldenAgeGreatPersonRateModifier WHERE PolicyType = 'POLICY_SECULARISM';
INSERT INTO Policy_GoldenAgeGreatPersonRateModifier
	(PolicyType, GreatPersonType, Modifier)
SELECT
	'POLICY_SECULARISM', Type, 25
FROM GreatPersons
WHERE Specialist IS NOT NULL;

UPDATE Language_en_US
SET Text = Replace(Text, 'Can construct [COLOR_POSITIVE_TEXT]Observatories[ENDCOLOR] (+6 [ICON_RESEARCH] Science, +1 [ICON_RESEARCH] Science from nearby Mountains, 2 [ICON_VP_SCIENTIST] Scientist Slot).', '+25% [ICON_GREAT_PEOPLE] Great Person Rate during [ICON_GOLDEN_AGE] Golden Ages.')
WHERE Tag = 'TXT_KEY_POLICY_SECULARISM_HELP';

-- Harbor
UPDATE Buildings SET
	TradeRouteSeaDistanceModifier = 25
WHERE BuildingClass = 'BUILDINGCLASS_HARBOR';

UPDATE Language_en_US
SET Text = Replace(Text, '[ICON_CARGO_SHIP] Sea Trade Routes gain +50% Range', '[ICON_CARGO_SHIP] Sea Trade Routes gain +25% Range')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HARBOR');

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_OBSERVATORY';

INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_OBSERVATORY', 'BUILDINGCLASS_UNIVERSITY');

-- branches off instead
--UPDATE Building_ClassesNeededInCity SET
--BuildingClassType = 'BUILDINGCLASS_OBSERVATORY'
--WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PUBLIC_SCHOOL');

INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_OBSERVATORY', 'FLAVOR_I_SEA_TRADE_ROUTE', 10),
	('BUILDING_OBSERVATORY', 'FLAVOR_NAVAL', 10),
	('BUILDING_OBSERVATORY', 'FLAVOR_RELIGION', 5);

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	Type, 'BUILDINGCLASS_OBSERVATORY', 'YIELD_FAITH', 1
FROM Buildings WHERE Cost = -1 AND FaithCost > 0;

-- strong compatibility
CREATE TRIGGER ObservatoryFaithBonus
AFTER INSERT ON Buildings WHEN NEW.FaithCost > 0 AND NEW.Cost = -1
BEGIN
	INSERT INTO Building_BuildingClassLocalYieldChanges
		(BuildingType, BuildingClassType, YieldType, YieldChange)
	SELECT
		NEW.Type, 'BUILDINGCLASS_OBSERVATORY', 'YIELD_FAITH', 1;
END;

UPDATE Language_en_US
SET Text = 'City gains +1 [ICON_RESEARCH] Science for every Mountain within the workable tiles. Atolls worked by the City gain +2 [ICON_RESEARCH] Science. +1 [ICON_PEACE] Faith from every Building in the City that must be purchased with [ICON_PEACE] Faith.[NEWLINE][NEWLINE][ICON_CARGO_SHIP] Sea Trade Routes gain +25% Range. Harbors in the City gain +1 [ICON_RESEARCH] Science and [ICON_GOLDEN_AGE] Golden Age Point.[NEWLINE][NEWLINE]+4 [ICON_RESEARCH] Science once [COLOR_CYAN]{TXT_KEY_TECH_EE_REFRACTION}[ENDCOLOR] is discovered.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_HELP';

UPDATE Language_en_US
SET Text = 'The Observatory increases [ICON_RESEARCH] Science output, especially for Cities near lots of Mountains or with access to Atolls. You might also consider it for your Coastal Cities, especially those running Sea Trade Routes. Finally if you are running a religious Empire, stargazing will reinforce your Faith.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_STRATEGY';
