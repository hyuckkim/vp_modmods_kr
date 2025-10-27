UPDATE UnitPromotions SET RangeAttackIgnoreLOS = 1 WHERE Type = 'PROMOTION_CITY_SIEGE';

UPDATE Language_en_US
SET Text = '+100% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR].[NEWLINE]Can perform Ranged Attacks over obstacles.'
WHERE Tag = 'TXT_KEY_PROMOTION_CITY_SIEGE_HELP';

DELETE FROM Unit_FreePromotions WHERE 
UnitType IN (SELECT Type FROM Units WHERE Class IN ('UNITCLASS_FIELD_GUN', 'UNITCLASS_ARTILLERY', 'UNITCLASS_ROCKET_ARTILLERY')) AND 
PromotionType = 'PROMOTION_INDIRECT_FIRE';

UPDATE Units SET Cost = Cost - 100 WHERE Class = 'UNITCLASS_FIELD_GUN' AND NOT EXISTS (SELECT * FROM Eras WHERE Type='ERA_ENLIGHTENMENT'); 

-- give to hwacha without siege engine, up RCS to compensate
INSERT INTO UnitPromotions
	(Type, Description, Help, PediaType, PediaEntry, 
	PortraitIndex, IconAtlas, IsVisibleAboveFlag, CannotBeChosen, LostWithUpgrade,
	RangeAttackIgnoreLOS)
VALUES
	('PROMOTION_HWACHA', 'TXT_KEY_PROMOTION_HWACHA', 'TXT_KEY_PROMOTION_HWACHA_HELP', 'PEDIA_SIEGE', 'TXT_KEY_PROMOTION_HWACHA', 
	2, 'promoVP_atlas_02', 0, 1, 1,
	1);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_HWACHA', 'Singijeon'),
	('TXT_KEY_PROMOTION_HWACHA_HELP', 'Can perform Ranged Attacks over obstacles.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade[ENDCOLOR].');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_KOREAN_HWACHA', 'PROMOTION_HWACHA');

-- sier morb needs it too

UPDATE UnitPromotions SET RangeAttackIgnoreLOS = 1 WHERE Type = 'PROMOTION_UNIT_SIAM_CROACHING_TIGER' 
AND EXISTS (SELECT * FROM UnitPromotions WHERE Type = 'PROMOTION_UNIT_SIAM_CROACHING_TIGER');

UPDATE Language_en_US
SET Text = 'Can perform Ranged Attacks over obstacles.[NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_HELP'
AND EXISTS (SELECT * FROM UnitPromotions WHERE Type = 'PROMOTION_UNIT_SIAM_CROACHING_TIGER');

-- make inaccuracy more to compensate

UPDATE UnitPromotions_Domains SET Attack = -50 WHERE PromotionType = 'PROMOTION_SIEGE_INACCURACY';

UPDATE Language_en_US
SET Text = '-50% [ICON_STRENGTH] Combat Strength when attacking [COLOR_NEGATIVE_TEXT]Land Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_SIEGE_INACCURACY_HELP';
