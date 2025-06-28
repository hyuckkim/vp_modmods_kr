UPDATE Language_en_US
SET Text = '+1 [ICON_GOLD] and [ICON_CULTURE] Culture for every Luxury worked by your Cities. +4 [ICON_GOLD] Gold for each unique Luxury you import and/or export, scaling with Era. Can import duplicate Luxuries from Civilizations which count toward [ICON_VP_MONOPOLY] Monopolies.'
WHERE Tag = 'TXT_KEY_TRAIT_LUXURY_RETENTION';

UPDATE Language_en_US
SET Text = 'Can only be built on Marsh tiles or on featureless Lake/Coast tiles adjacent to at least 2 land tiles. Polders built on water can be traversed by land units without embarkation, as if they are land tiles.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_POLDER_HELP';
