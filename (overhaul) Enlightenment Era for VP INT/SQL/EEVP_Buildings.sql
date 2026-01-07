------------------------------------------------
-- 4UC
------------------------------------------------
-- TODO: sort these into the correct places above

-- Schutzenstand
UPDATE Language_ko_KR
SET Text = '+30% [ICON_PRODUCTION] Production of Gunpowder Units, and +20% [ICON_PRODUCTION] Production to all other Land Units, which also receive additional +15 XP. +2 [ICON_WAR] Military Supply.[NEWLINE][NEWLINE]When you construct a Unit in this City, gain [ICON_RESEARCH] Science equal to 10% of the Unit''s [ICON_PRODUCTION] Production cost.[NEWLINE][NEWLINE][ICON_CITY_STATE] City-State [COLOR_CYAN]Ally[ENDCOLOR] Bonus: +1 [ICON_PRODUCTION] Production and +1 [ICON_CULTURE] Culture each.[NEWLINE][NEWLINE]Nearby [ICON_RES_IRON] Iron: +2 [ICON_PRODUCTION] Production.[NEWLINE]Nearby [ICON_RES_COAL] Coal: +1 [ICON_PRODUCTION] Production and +1 [ICON_RESEARCH] Science.'
WHERE Tag = 'TXT_KEY_BUILDING_SCHUTZENSTAND_HELP';
UPDATE Language_ko_KR
SET Text = 'The Schützenstand is an Austrian unique building, replacing the {TXT_KEY_BUILDING_EE_GUNSMITH}. It is cheaper than the {TXT_KEY_BUILDING_EE_GUNSMITH}, and allows for faster and better training of Land Units in the City. It also provides +1 [ICON_PRODUCTION] Production and +1 [ICON_CULTURE] Culture for every City-State you''re currently Allied with.'
WHERE Tag = 'TXT_KEY_BUILDING_SCHUTZENSTAND_STRATEGY';

------------------------------------------
-- spanish bullring
UPDATE Language_ko_KR
SET Text = '+500 [ICON_RESEARCH] Science when completed. Nearby Jungle, Forest, Camps, and Pastures gain +1 [ICON_TOURISM] Tourism and [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Trigger a "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]" in this city whenever it completes a [COLOR_POSITIVE_TEXT]Public Works Project[ENDCOLOR]. Gain 100 [ICON_CULTURE] Culture, [ICON_PEACE] Faith, and [ICON_GOLD] Gold whenever a "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]" begins, Scaling with Era.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom.'
WHERE Tag = 'TXT_KEY_BUILDING_BULLRING_HELP';

UPDATE Language_ko_KR
SET Text = 'The Bullring is a Spanish Unique Building that is cheaper and is available earlier than the Zoo. In addition to the Zoo''s bonuses to Camps, the Bullring gives bonuses to Pastures. Try to focus on triggering many "We Love the King Days" by connecting Resources or building Public Works in order to get additional Yields.'
WHERE Tag = 'TXT_KEY_BUILDING_BULLRING_STRATEGY';

------------------------------------------
-- moroccan riad
UPDATE Language_ko_KR
SET Text = 'When completed, gains [ICON_GOLD] Gold and [ICON_CULTURE] Culture for every 8 Buildings and Wonders already constructed in this city. Gains +1 [ICON_GOLD] Gold and [ICON_CULTURE] Culture every Era. City gains +1 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism on Snow and for every Mountain within the workable Tiles. +5 [ICON_TOURISM] Tourism from Oases worked by this City.[NEWLINE][NEWLINE]When you spend [ICON_INVEST] Gold to purchase Units or invest in Buildings in this City, 10% of the cost is converted into [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]50% of the [ICON_CULTURE] Culture from [ICON_WONDER] World Wonders and Tiles is added to the [ICON_TOURISM] Tourism output of the City. [ICON_TOURISM] Tourism output from Great Works +25%.[NEWLINE][NEWLINE]Completing a [ICON_CARAVAN]/[ICON_CARGO_SHIP] Trade Route originating here and targeting another Civilization, triggers a (or strengthens an existing) [COLOR_POSITIVE_TEXT]Historic Event[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_BUILDING_RIAD_HELP';

------------------------------------------
-- Kabuki Theatre
UPDATE Language_ko_KR
SET Text = Replace(Text, '+5% [ICON_CULTURE] Culture in the City.', '+1 [ICON_CULTURE] Culture for every 5 [ICON_CITIZEN] Citizens in the City.') || '[NEWLINE][NEWLINE]Nearby [ICON_RES_CRAB] Crab: +1 [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_WINE] Wine: +1 [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_TRUFFLES] Truffles: +1 [ICON_GOLD] Gold and +2 [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_OLIVE] Olives: +1 [ICON_FOOD] Food and [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_MARBLE] Marble: +1 [ICON_CULTURE] Culture, [ICON_PEACE] Faith, and [ICON_TOURISM] Tourism.'
WHERE Tag = 'TXT_KEY_BUILDING_KABUKI_THEATER_HELP';

------------------------------------------
-- Beer Hall
UPDATE Language_ko_KR
SET Text = Replace(Text, '+15% [ICON_PRODUCTION] Production when constructing Buildings. Grocers, Granaries, and Nearby [ICON_RES_WHEAT] Wheat, [ICON_RES_MAIZE] Maize, and [ICON_RES_RICE] Rice Resources produce +1 [ICON_FOOD] Food and [ICON_CULTURE] Culture. Nearby Marshes and Lakes produce +2 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]+1 [ICON_HAPPINESS_1] Happiness for every 9 Policies you have adopted. Gain 10 [ICON_CULTURE] Culture in this City whenever you gift a military unit to a City-State, Scaling with Era.', 
'When a Unit [COLOR_POSITIVE_TEXT]created by this City[ENDCOLOR] [ICON_RAZING] Pillages a tile, gain 15 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism, scaling with Era. +15% [ICON_PRODUCTION] Production when training [COLOR_POSITIVE_TEXT]Recon Units[ENDCOLOR], and they receive +30 XP.[NEWLINE][NEWLINE]+1 [ICON_HAPPINESS_1] Happiness for every 9 Policies you have adopted. Gain 10 [ICON_CULTURE] Culture in this City whenever you gift a military Unit to a City-State, scaling with Era.[NEWLINE][NEWLINE]Nearby [ICON_RES_FISH] Fish: +1 [ICON_FOOD] Food and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_CRAB] Crab: +1 [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_WHALE] Whales: +2 [ICON_GOLD] Gold and +1 [ICON_RESEARCH] Science.')
WHERE Tag = 'TXT_KEY_BUILDING_BREWHOUSE_HELP';

UPDATE Language_ko_KR
SET Text = 'The Brewhouse is the unique German replacement for the Tavern, which does not require the Harbor (and therefore a Coastal City). In addition to the standard bonuses of a Tavern, the Brewhouse provides bonuses to Happiness, which grow stronger with the number of Policies you have adopted. Each Brewhouse on Empire provides an instant boost of Culture whenever you gift a Military Unit to a City-State. The Brewhouse'' rewards for policy adoption and unit gifting both get stronger after you adopt an Ideology, with different yield bonuses depending on what Ideology you adopt. Prioritize culture via allying with City-States in order to increase the power of your Bräuhauser.'
WHERE Tag = 'TXT_KEY_BUILDING_BREWHOUSE_STRATEGY';

------------------------------------------
-- Qila to Bastion Fort
UPDATE Language_ko_KR SET
Text = 'The Qila is the unique Indian replacement for the Bastion Fort. In addition to the normal bonuses of the Fort, the City gains additional health and also increased Defense for every National or World Wonder. Your most magnificent cities also become more difficult to capture. Further, the Qila generates Culture and Great Artist Points, with more coming from your more developed Cities.'
WHERE Tag = 'TXT_KEY_BUILDING_MUGHAL_FORT_STRATEGY';

UPDATE Language_ko_KR SET
Text = 'Damage from all sources against this City is reduced by 2. +1 [ICON_WAR] Military Supply, and +5% [ICON_SILVER_FIST] Military Supply from Population. Allows City to [ICON_RANGE_STRENGTH] Strike over obstacles.[NEWLINE][NEWLINE]Garrisoned Units receive an additional 5 Health when healing in this City.[NEWLINE][NEWLINE]+1 [ICON_STRENGTH] City Strength for every 2 National or [ICON_WONDER] World Wonders built in this City. 20% of [ICON_STRENGTH] City Defense is converted to [ICON_CULTURE] Culture very turn. When you complete a building gain 2% progress towards a [ICON_GREAT_ARTIST] Great Artist.[NEWLINE][NEWLINE][ICON_CITY_STATE] Empire Size Modifier is reduced by 5% in this City.'
WHERE Tag = 'TXT_KEY_BUILDING_MUGHAL_FORT_HELP';