

--------------------------------
-- Unit_FreePromotions Deletion
--------------------------------
UPDATE Defines
SET Value = '60'
WHERE Name = 'BARBARIAN_MAX_XP_VALUE';


/*
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KOREAN_HWACHA'     AND PromotionType = 'PROMOTION_MUST_SET_UP';
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_FIELD_GUN'         AND PromotionType = 'PROMOTION_MUST_SET_UP';
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EE_FIELD_GUN'      AND PromotionType = 'PROMOTION_MUST_SET_UP';
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ARTILLERY'         AND PromotionType = 'PROMOTION_MUST_SET_UP';
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GERMANY_KRUPP_GUN' AND PromotionType = 'PROMOTION_MUST_SET_UP';
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RUSSIA_LICORNE'    AND PromotionType = 'PROMOTION_MUST_SET_UP';


