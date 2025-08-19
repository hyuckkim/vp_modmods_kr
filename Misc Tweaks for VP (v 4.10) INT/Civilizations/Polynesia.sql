-- Polynesia and Shoshone swap
UPDATE Language_ko_KR
SET Text = '+20% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Inside Friendly Territory[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_HOMELAND_GUARDIAN_BOOGALOO_HELP';

-- Text
UPDATE Language_ko_KR
SET Text = '+2 [ICON_VP_VISION] Sight when Embarked, can always Embark and move over Oceans. +2 [ICON_PRODUCTION] Production from Fishing Boats and Atolls. Melee and Gunpowder Units can construct Fishing Boats. Units gain +20% [ICON_STRENGTH] Combat Strength within 2 tiles of an owned {TXT_KEY_IMPROVEMENT_MOAI}. No [ICON_HAPPINESS_3] Unhappiness from Isolation.'
WHERE Tag = 'TXT_KEY_TRAIT_WAYFINDING';

UPDATE Language_ko_KR
SET Text = 'Can only be built on coastal tiles. +1 [ICON_CULTURE] for each adjacent Moai and City. If within 2 tiles of an Moai in Polynesian territory, all Polynesian units gain +20% [ICON_STRENGTH] Combat Strength.[NEWLINE][NEWLINE]Can be built on Resources but does not connect them.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_MOAI_HELP';

UPDATE Language_ko_KR
SET Text = '+1 [ICON_CULTURE] for each adjacent Moai and City. +20% [ICON_STRENGTH] Combat Strength to any nearby Polynesian Units within a 2-tile radius.[NEWLINE][NEWLINE]Can only be built on coastal tiles. Can be built on Resources but does not connect them.'
WHERE Tag = 'TXT_KEY_BUILD_MOAI_HELP';

UPDATE Language_ko_KR
SET Text = 'It will increase [ICON_CULTURE] Culture and [ICON_CULTURE_LOCAL] Border Growth. Removes any feature on the tile.[NEWLINE]Provides additional [ICON_CULTURE] Culture if adjacent to cities or other Moai.[NEWLINE]Provides a combat bonus for nearby Polynesian units.[NEWLINE]It will not [COLOR_NEGATIVE_TEXT]connect the resource[ENDCOLOR] on this tile (if any).'
WHERE Tag = 'TXT_KEY_BUILD_MOAI_REC';

UPDATE Language_ko_KR
SET Text = 'Cities claim up to 4 additional tiles when acquired, and claim adjacent unowned tiles when their borders expand to a land tile of the same type. All Recon Units can choose rewards from Ancient Ruins. Land Units gain +20% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Inside Friendly Territory[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_TRAIT_GREAT_EXPANSE';

UPDATE Language_ko_KR
SET Text = 'Can only be built on flat land tiles, and cannot be adjacent to another Encampment.[NEWLINE][NEWLINE]+15% [ICON_STRENGTH] Defensive Strength for any Unit stationed in this tile. Any enemy unit which ends its turn next to this tile takes 5 damage (damage does not stack with other improvements).'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_ENCAMPMENT_SHOSHONE_HELP';

UPDATE Language_ko_KR
SET Text = '+15% [ICON_STRENGTH] Defensive Strength for any Unit stationed in this tile. Any enemy unit which ends its turn next to the Encampment takes 5 damage.[NEWLINE][NEWLINE]Can only be built on flat land tiles, and cannot be adjacent to another Encampment.'
WHERE Tag = 'TXT_KEY_BUILD_ENCAMPMENT_SHOSHONE_HELP';

UPDATE Language_ko_KR
SET Text = 'It will increase [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_CULTURE] Culture. Removes any feature on the tile.[NEWLINE]Provides a defensive bonus for own units on the tile, and lightly damages adjacent enemy units.'
WHERE Tag = 'TXT_KEY_BUILD_ENCAMPMENT_SHOSHONE_REC';

UPDATE Language_ko_KR
SET Text = 'Unique Polynesian {TXT_KEY_UNIT_LONGSWORDSMAN} that weakens adjacent enemy Units, can embark and disembark quickly, and does not require [ICON_RES_IRON] {TXT_KEY_RESOURCE_IRON}.'
WHERE Tag = 'TXT_KEY_CIV5_POLYNESIAN_MAORI_WARRIOR_HELP';

UPDATE Language_ko_KR
SET Text = 'The {TXT_KEY_UNIT_POLYNESIAN_MAORI_WARRIOR} is the Polynesian unique unit, replacing the {TXT_KEY_UNIT_LONGSWORDSMAN}. It has a unique debuffing aura that decreases the [ICON_STRENGTH] Combat Strength of adjacent enemies. It can also embark and disembark with just one [ICON_MOVES] Movement. It is a lot cheaper and does not require [ICON_RES_IRON] {TXT_KEY_RESOURCE_IRON} to be trained.'
WHERE Tag = 'TXT_KEY_CIV5_POLYNESIAN_MAORI_WARRIOR_STRATEGY';

UPDATE Language_ko_KR
SET Text = '-20% [ICON_STRENGTH] Combat Strength for [COLOR_POSITIVE_TEXT]Adjacent Enemy Units[ENDCOLOR].[NEWLINE]Embarking and Disembarking cost only 1 [ICON_MOVES] Movement.'
WHERE Tag = 'TXT_KEY_PROMOTION_HAKA_WAR_DANCE_HELP';