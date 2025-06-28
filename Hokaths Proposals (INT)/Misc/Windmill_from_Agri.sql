-- Windmill
UPDATE Language_en_US
SET Text = '+15% [ICON_PRODUCTION] Production when constructing Buildings. +1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Farms and Marshes worked by the City. Nearby Lakes produce +2 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold.'
WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL_HELP';

UPDATE Language_en_US
SET Text = 'The Windmill is a Renaissance-era building which increases the [ICON_PRODUCTION] Production output of a City when constructing buildings and generate [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Farms, Marshes, and Lakes.'
WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL_STRATEGY';

UPDATE Language_en_US
SET Text = '+1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Farms and +2 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Pastures worked by the City. 10% of [ICON_FOOD] Food created by the City counts as [ICON_GOLD] Gold Per Turn.[NEWLINE][NEWLINE]Requires 2 [ICON_RES_HORSE] Horses.'
WHERE Tag = 'TXT_KEY_BUILDING_STOCKYARD_HELP';
