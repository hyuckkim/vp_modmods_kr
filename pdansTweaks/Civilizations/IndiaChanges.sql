DELETE FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_INDUS_CANAL';

UPDATE Language_en_US
SET Text = 'Unique Indian replacement for the Aqueduct. Carries over 20% of [ICON_FOOD] Food after City growth, and +25% of the [ICON_PRODUCTION] Production of the City is added to the City''s current [ICON_PRODUCTION] Production. Grants +2 [ICON_FOOD] Food from Lakes and Oases. Farms worked by this City gain +1 [ICON_FOOD] Food and [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty.'
WHERE Tag = 'TXT_KEY_BUILDING_INDUS_CANAL_HELP';