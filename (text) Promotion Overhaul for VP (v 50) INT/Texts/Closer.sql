-- "Lost on upgrade" update
UPDATE Language_en_US SET Text = Text||' [COLOR_NEGATIVE_TEXT]Lost after unit upgrade[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM UnitPromotions WHERE LostWithUpgrade = 1);