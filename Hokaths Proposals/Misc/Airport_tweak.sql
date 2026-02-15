UPDATE Language_en_US
SET Text = '+5% Yields from [ICON_CONNECTED]/[ICON_INDUSTRIAL_CONNECTED] City Connections in your Empire. +1 [ICON_TOURISM] Tourism for every 3 [ICON_CITIZEN] Citizens in the City. +3 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism from Atolls.[NEWLINE][NEWLINE]Allows [COLOR_POSITIVE_TEXT]Airlifts[ENDCOLOR] to or from this City. [COLOR_POSITIVE_TEXT]Increases Air Unit Capacity of the City from 2 to 6.[ENDCOLOR] +10 [ICON_STRENGTH] Damage to Air Units during Air Strikes on City.'
WHERE Tag = 'TXT_KEY_BUILDING_AIRPORT_HELP';

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
