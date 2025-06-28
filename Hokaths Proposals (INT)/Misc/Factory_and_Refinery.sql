-- text

UPDATE Language_en_US
SET Text = '+1 [ICON_PRODUCTION] Production for every 4 [ICON_CITIZEN] Citizens in the City. Manufactories worked by the City gain +2 [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]1 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.[NEWLINE][NEWLINE]Nearby [ICON_RES_COAL] Coal: +2 [ICON_PRODUCTION] Production, +2 [ICON_RESEARCH] Science.[NEWLINE][NEWLINE]Requires 1 [ICON_RES_COAL] Coal. '
WHERE Tag = 'TXT_KEY_BUILDING_FACTORY_HELP';

UPDATE Language_en_US
SET Text = '+1 [ICON_PRODUCTION] Production for every 2 [ICON_CITIZEN] Citizens in the City. Manufactories worked by the City gain +4 [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]2 Specialists in this City no longer produce [ICON_HAPPINESS_3] Unhappiness from Urbanization.[NEWLINE][NEWLINE]When you complete a building from the Industrial Era or later, gain 10% of its construction cost as Points towards a [ICON_GREAT_ENGINEER] Great Engineer.[NEWLINE][NEWLINE]+2 [ICON_PRODUCTION] Production to Engineer Specialists.[NEWLINE][NEWLINE]Nearby [ICON_RES_COAL] Coal: +3 [ICON_PRODUCTION] Production.'
WHERE Tag = 'TXT_KEY_BUILDING_STEAM_MILL_HELP';

UPDATE Language_en_US
SET Text = 'The Refinery is a Modern-era building which can only be constructed in 5 Cities total. The Refinery helps your Production by boosting all your Factories and produces 1 Iron, Coal and Oil resource each, however it has a high maintenance cost.'
WHERE Tag = 'TXT_KEY_BUILDING_COAL_PLANT_STRATEGY';

UPDATE Language_en_US
SET Text = '+2 [ICON_PRODUCTION] Production to all owned Factories in the Empire. Produces 1 [ICON_RES_IRON] Iron, [ICON_RES_COAL] Coal, and [ICON_RES_OIL] Oil.[NEWLINE][NEWLINE]Can be built in up to 5 Cities maximum.'
WHERE Tag = 'TXT_KEY_BUILDING_COAL_PLANT_HELP';
