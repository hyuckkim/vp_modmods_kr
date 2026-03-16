-- Building_YieldChanges
INSERT INTO Building_YieldChanges(BuildingType, YieldType, Yield)
SELECT 'BUILDING_CASINO', 'YIELD_GOLD', 1;

-- Building_TechEnhancedYieldChanges
INSERT INTO Building_TechEnhancedYieldChanges(BuildingType, YieldType, Yield)
SELECT 'BUILDING_CASINO', 'YIELD_GOLD', 6;

INSERT INTO Building_YieldFromSpyAttack
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CASINO', 'YIELD_GOLD', 30),
	('BUILDING_CASINO', 'YIELD_CULTURE', 30);

INSERT INTO Building_YieldFromBorderGrowth
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CASINO', 'YIELD_TOURISM', 10),
	('BUILDING_CASINO', 'YIELD_CULTURE', 10);

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, 	FeatureType, YieldType, Yield)
VALUES
	('BUILDING_CASINO', 'FEATURE_OASIS', 'YIELD_CULTURE', 5);


