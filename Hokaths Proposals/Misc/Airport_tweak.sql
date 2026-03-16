UPDATE Buildings SET CityConnectionTradeRouteModifier = 5 WHERE Type = 'BUILDING_AIRPORT';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_AIRPORT', 'FEATURE_ATOLL', 'YIELD_GOLD', 3),
	('BUILDING_AIRPORT', 'FEATURE_ATOLL', 'YIELD_TOURISM', 3);

INSERT INTO Building_YieldChangesPerPop
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_AIRPORT', 'YIELD_TOURISM', 34);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
VALUES
	('BUILDING_AIRPORT', 'BUILDINGCLASS_HOTEL');
