------------------------------
-- Carthage Changes
------------------------------
-- Change the free building to Lighthouse. 
--DELETE FROM Trait_YieldFromSettle WHERE TraitType = 'TRAIT_PHOENICIAN_HERITAGE';

UPDATE Traits SET FreeBuilding = 'BUILDING_HARBOR' WHERE Type = 'TRAIT_PHOENICIAN_HERITAGE';

UPDATE Buildings SET AllowsWaterRoutes = 1 WHERE Type = 'BUILDING_HARBOR';

UPDATE Language_en_US
SET Text = '+125 [ICON_GOLD] Gold when founding Cities, scaling with Era. Owned coastal Cities receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Harbor and [ICON_CONNECTED] City Connection. [ICON_INTERNATIONAL_TRADE] Trade Route Resource Diversity modifier doubled if positive, halved if negative.'
WHERE Tag = 'TXT_KEY_TRAIT_PHOENICIAN_HERITAGE';

--Update Cothon building bonuses
DELETE FROM Building_BuildingClassYieldChanges WHERE BuildingType = 'BUILDING_GREAT_COTHON';

INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 				BuildingClassType, 			YieldType, 			YieldChange)
VALUES	('BUILDING_GREAT_COTHON', 	'BUILDINGCLASS_HARBOR', 	'YIELD_CULTURE', 	2),
		('BUILDING_GREAT_COTHON', 	'BUILDINGCLASS_LIGHTHOUSE', 'YIELD_PRODUCTION', 2);
		
UPDATE Language_en_US
SET Text = 'Receive a free copy of all Luxury Resources around the City. Incoming [ICON_INTERNATIONAL_TRADE] Trade Routes generate +5 [ICON_GOLD] Gold for the City, and +3 [ICON_GOLD] Gold for the [ICON_INTERNATIONAL_TRADE] Trade Route owner. Resource Diversity Modifiers for Trade Routes from this City increase by 25% if positive, and decrease by 25% if negative. Grants 2 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Routes, all Lighthouses gain +2 [ICON_PRODUCTION] Production, and all Harbors gain +2 [ICON_CULTURE] Culture. -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_COTHON_HELP';
