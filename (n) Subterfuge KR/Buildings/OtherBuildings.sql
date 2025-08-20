-- Foreign Office
UPDATE Language_ko_KR
SET Text = 'Provides 1 additional [ICON_RES_PAPER] Paper and 100 [ICON_VP_SPY_POINTS] Spy Points. +20% [ICON_PRODUCTION] Production of Diplomatic Units in this City. All Diplomatic Units receive the [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_IMMUNITY}[ENDCOLOR] Promotion. Receive 75 [ICON_TOURISM] Tourism when you sucessfully rig an election in a [ICON_CITY_STATE] City-State, scaling with Era.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_FOREIGN_OFFICE_HELP';

UPDATE Language_ko_KR
SET Text = 'This National Wonder cannot be built unless the city has a Wire Service. Build it to receive a production speed increase for Diplomatic Units in the city where it is built, increased movement and influence for all your Diplomatic Units and the ability to send your Diplomatic Units through rival territory without an [COLOR_POSITIVE_TEXT]Open Borders[ENDCOLOR] agreement. It also grants a Spy and, if you are Rigging City-State elections, the Wonder provides you with additional Gold for you to buy even more Diplomats.'
WHERE Tag = 'TXT_KEY_BUILDING_FOREIGN_OFFICE_STRATEGY';

-- Constabulary
UPDATE Language_ko_KR
SET Text = 'Receive 50 [ICON_PRODUCTION] Production when you perform a Spy Mission, scaling with Era. ' || Text
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_CONSTABLE'));

-- Police Station
UPDATE Language_ko_KR
SET Text = 'Receive 30 [ICON_CULTURE] Culture when you perform a Spy Mission, scaling with Era. ' || Text
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_POLICE_STATION'));

-- Nightclub (elsewhere in mod but might be deleted so check)
UPDATE Language_ko_KR
SET Text = 'Receive 50 [ICON_TOURISM] Tourism when you perform a Spy Mission, scaling with Era. ' || Text
WHERE Tag IN (SELECT Help FROM Buildings WHERE Type = 'BUILDING_NIGHTCLUB');