UPDATE Language_en_US
SET Text = '+100% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR].[NEWLINE]Can perform Ranged Attacks over obstacles.'
WHERE Tag = 'TXT_KEY_PROMOTION_CITY_SIEGE_HELP';

-- give to hwacha without siege engine, up RCS to compensate
INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_HWACHA', 'Singijeon'),
	('TXT_KEY_PROMOTION_HWACHA_HELP', 'Can perform Ranged Attacks over obstacles.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade[ENDCOLOR].');

-- sier morb needs it too
UPDATE Language_en_US
SET Text = 'Can perform Ranged Attacks over obstacles.[NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_HELP'
AND EXISTS (SELECT * FROM UnitPromotions WHERE Type = 'PROMOTION_UNIT_SIAM_CROACHING_TIGER');

-- make inaccuracy more to compensate
UPDATE Language_en_US
SET Text = '-50% [ICON_STRENGTH] Combat Strength when attacking [COLOR_NEGATIVE_TEXT]Land Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_SIEGE_INACCURACY_HELP';