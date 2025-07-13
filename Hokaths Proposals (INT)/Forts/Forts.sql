-- Fort
UPDATE Language_ko_KR
SET Text = 'A fort is a special improvement that can be built outside your borders and improves the defensive bonus of the tile by 50% for units stationed in that tile. However, forts do not provide a defensive bonus to units in enemy territory and [COLOR_NEGATIVE_TEXT]costs[ENDCOLOR] 2 [ICON_GOLD] Gold per turn to maintain. Cannot be built adjacent to one another. Contains [COLOR_POSITIVE_TEXT]Fortifications[ENDCOLOR], allowing owned Units to stay stationed in this tile after attacking and a [COLOR_POSITIVE_TEXT]Canal[ENDCOLOR], allowing friendly [COLOR_POSITIVE_TEXT]Sea[ENDCOLOR] Units to traverse through it.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_FORT_TEXT';

UPDATE Language_ko_KR
SET Text = '[COLOR_NEGATIVE_TEXT]Costs[ENDCOLOR] 2 [ICON_GOLD] Gold per turn to maintain. +50% [ICON_STRENGTH] Defensive Strength for any Unit stationed in this tile. Contains [COLOR_POSITIVE_TEXT]Fortifications[ENDCOLOR], allowing owned Units to stay stationed in this tile after attacking and a [COLOR_POSITIVE_TEXT]Canal[ENDCOLOR], allowing friendly [COLOR_POSITIVE_TEXT]Sea[ENDCOLOR] Units to traverse through it.'
WHERE Tag = 'TXT_KEY_BUILD_FORT_HELP';

