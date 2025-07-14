-- "Lost on upgrade" update
UPDATE Language_ko_KR SET Text = Text||' [COLOR_NEGATIVE_TEXT]유닛 업그레이드 후 손실됩니다.[ENDCOLOR]'
WHERE Tag IN (SELECT Help FROM UnitPromotions WHERE LostWithUpgrade = 1);