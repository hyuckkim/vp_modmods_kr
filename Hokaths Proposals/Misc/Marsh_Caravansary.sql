INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	Type, 'FEATURE_MARSH', 'YIELD_GOLD', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CARAVANSARY';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	Type, 'FEATURE_MARSH', 'YIELD_FOOD', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CARAVANSARY';

-- also put this here
UPDATE Building_ClassesNeededInCity SET 
BuildingClassType = 'BUILDINGCLASS_CARAVANSARY'
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MINT'); 
