UPDATE Language_en_US
SET Text = '+2 [ICON_CULTURE] Culture and +2 [ICON_TOURISM] Tourism. +1 [ICON_HAPPINESS_1] Happiness and [ICON_CULTURE] Culture from every Stable.[NEWLINE][NEWLINE]Requires 1 [ICON_RES_HORSE] Horse.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_EQUESTRIANART_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_STRATEGIC' AND Value= 1);

UPDATE Language_en_US
SET Text = '+1 [ICON_HAPPINESS_1]Happiness. +1 [ICON_GOLD] Gold from each [ICON_RES_HORSE] Horse resource worked by this city.[NEWLINE][NEWLINE]Requires 2 [ICON_RES_HORSE] Horses.'
WHERE Tag = 'TXT_KEY_BUILDING_RACING_COURSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_STRATEGIC' AND Value= 1);
/*
UPDATE Language_en_US
SET Text = 'The Ironworks National Wonder increases [ICON_PRODUCTION] Production in a city by +10 [ICON_PRODUCTION] and +1 [ICON_PRODUCTION] from Iron resources worked by this city. A city must have a workshop before it can construct an Ironworks.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_IRONWORKS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_STRATEGIC' AND Value= 1);
*/
UPDATE Buildings
SET NumCityCostMod = 10, NationalPopRequired = 50
WHERE Type = 'BUILDING_SCHOOL_OF_EQUESTRIAN_ART' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_STRATEGIC' AND Value= 1);

UPDATE Buildings
SET Cost = 600, HurryCostModifier = 5
WHERE Type = 'BUILDING_STEELMILL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_STRATEGIC' AND Value= 1);

UPDATE Building_YieldChanges
SET Yield = 0
WHERE BuildingType = 'BUILDING_RACING_COURSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_STRATEGIC' AND Value= 1);

UPDATE Buildings
SET Happiness = 1, GoldMaintenance = 3, Cost = 750, HurryCostModifier = 5
WHERE Type = 'BUILDING_RACING_COURSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_STRATEGIC' AND Value= 1);
