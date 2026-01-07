-- Scholasticism (Shadow Networks) 
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Shadow Networks[ENDCOLOR][NEWLINE][ICON_BULLET]+3% [ICON_CULTURE] Culture in [ICON_CAPITAL] Capital for every 100 [ICON_SPY_POINT] Spy Points ever accumulated (up to 30%).[NEWLINE][ICON_BULLET]+2 [ICON_RESEARCH] Science from Constabularies and Printing Houses.[NEWLINE][ICON_BULLET]+1 [ICON_RESEARCH] Science from Specialists.'
WHERE Tag = 'TXT_KEY_POLICY_SCHOLASTICISM_HELP';

-- State Treasury (was Printing Press)
UPDATE Language_ko_KR
SET Text = 'State Treasury'
WHERE Tag = 'TXT_KEY_BUILDING_PRINTING_PRESS';
/*
UPDATE Language_ko_KR
SET Text = 'Provides 1 additional [ICON_RES_PAPER] Paper and 100 [ICON_SPY_POINT] Spy Points. Gain 1 [ICON_SPY] City Security for every 6 [ICON_CITIZEN] Citizens in the City. +20% [ICON_PRODUCTION] Production of Diplomatic Units in this City. Receive 40 [ICON_GOLD] Gold when you sucessfully rig an election in a [ICON_CITY_STATE] City-State, scaling with Era.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_PRINTING_PRESS_HELP';
*/
UPDATE Language_ko_KR
SET Text = 'This National Wonder cannot be built unless the city has a Chancery. Build it to receive a production speed increase for Diplomatic Units in the city where it is built, and bonuses to Rigging Elections everywhere.'
WHERE Tag = 'TXT_KEY_BUILDING_PRINTING_PRESS_STRATEGY';

UPDATE Language_ko_KR
SET Text = 'Wars are expensive. In 1433 England''s war with France led to a deficit of  30,000 - the equivalent of over  100 billion today. Money that the King received in taxes and fines were recorded by using sticks with notches marked on them according to the amount of money involved. The stick was cut in two and one half given to the Sheriff as receipt for the money. This represents one of the first examples of centralized public finances. As the Age of Exploration progressed, the role of finance in government became ever more central.'
WHERE Tag = 'TXT_KEY_CIV5_BUILDINGS_PRINTING_PRESS_TEXT';

-- White Tower
/*
UPDATE Language_ko_KR
SET Text = 'Provides 2 additional [ICON_RES_PAPER] Paper and 200 [ICON_SPY_POINT] Spy Points. +33% [ICON_PRODUCTION] Production of Diplomatic Units in this City.[NEWLINE][NEWLINE]Receive 40 [ICON_GOLD] Gold and [ICON_RESEARCH] Science when you identify, capture, or kill a foreign [ICON_SPY] Spy or when you perform a Spy Mission, and +25 [ICON_GOLD] Gold and [ICON_RESEARCH] Science when you successfully rig an election in a [ICON_CITY_STATE] City-State, scaling with Era.[NEWLINE][NEWLINE]Contains 1 slot for a [ICON_GREAT_WORK] Great Work of Art or Artifact, and comes with a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GW_ART] Great Work of Art.[NEWLINE][NEWLINE]+1 [ICON_CULTURE] Culture to all Constabularies, Castles, and Armories.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost increases based on the number of Cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_WHITE_TOWER_HELP';
*/
UPDATE Language_ko_KR
SET Text = 'Unique English replacement for the {TXT_KEY_BUILDING_PRINTING_PRESS}. In addition to improving the bonuses of the {TXT_KEY_BUILDING_PRINTING_PRESS}, the {TXT_KEY_BUILDING_WHITE_TOWER} boosts Constabularies, Castles, and Armories; provides [ICON_GOLD] Gold and [ICON_RESEARCH] Science for both offensive and defensive Spy actions, in addition to adding [ICON_RESEARCH] Science to Rigging Elections; and contains a free [ICON_GW_ART] Great Work of Art.'
WHERE Tag = 'TXT_KEY_BUILDING_WHITE_TOWER_STRATEGY';