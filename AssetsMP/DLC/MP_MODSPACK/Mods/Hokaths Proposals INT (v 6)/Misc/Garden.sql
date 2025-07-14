-- Garden
UPDATE Language_ko_KR
SET Text = '+25% [ICON_GREAT_PEOPLE] Great People generation in this City.[NEWLINE][NEWLINE]1 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.[NEWLINE][NEWLINE]Nearby Oases: +2 [ICON_GOLD] Gold.[NEWLINE]Nearby Lakes: +2 [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_CITRUS] Citrus: +1 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_COCOA] Cocoa: +1 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_CLOVES] Cloves: +1 [ICON_PEACE] Faith, +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_PEPPER] Pepper: +1 [ICON_PEACE] Faith, +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_NUTMEG] Nutmeg: +1 [ICON_CULTURE] Culture, +1 [ICON_PRODUCTION] Production.'
WHERE Tag = 'TXT_KEY_BUILDING_GARDEN_HELP';

UPDATE Language_ko_KR
SET Text = 'The Garden increases the speed at which [ICON_GREAT_PEOPLE] Great People are generated in the City by 25%, and buffs the Gold output of Oases and the Tourism output of Lakes. Gardens require an Aqueduct in the City in order to be built.'
WHERE Tag = 'TXT_KEY_BUILDING_GARDEN_STRATEGY';