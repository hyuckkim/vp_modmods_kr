---------------------------------------------------------------
-- Trait
---------------------------------------------------------------
UPDATE Language_ko_KR SET 
Text = '+25% [ICON_PRODUCTION] Production towards Buildings present in [ICON_CAPITAL] Capital. +100% [ICON_GOLD] Gold/[ICON_PRODUCTION] Production from [ICON_CONNECTED] City Connections/[ICON_INDUSTRIAL_CONNECTED] Industrial City Connections in all Cities. '
WHERE Tag = 'TXT_KEY_TRAIT_CAPITAL_BUILDINGS_CHEAPER';

---------------------------------------------------------------
-- Fornix
---------------------------------------------------------------
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_GREAT_WORK_ROME', 'Volume of The History of Rome'),
	('TXT_KEY_GREAT_WORK_QUOTE_ROME', '"The study of history is the best medicine for a sick mind; for in history you have a record of the infinite variety of human experience plainly set out for all to see: and in that record you can find for yourself and your country both examples and warnings: fine things to take as models, base things, rotten through and through, to avoid."[NEWLINE]-Livy');

-------------
-- triumph promo
-------------
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_TRIUMPH', 'Triumph'),
	('TXT_KEY_PROMOTION_TRIUMPH_PEDIA', '[COLOR_POSITIVE_TEXT](Rome)[ENDCOLOR] Triumph'),
	('TXT_KEY_PROMOTION_TRIUMPH_HELP', '+15% [ICON_STRENGTH] Combat Strength.[NEWLINE]Gain 50% of the [ICON_STRENGTH] Combat Strength of defeated enemy Units as [ICON_GREAT_GENERAL] Great General Points.');