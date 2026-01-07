-- dunno if this works. we can try without it.
--INSERT INTO Unit_AITypes
--	(UnitType, UnitAIType)
--VALUES
--	('UNIT_MOBILE_SAM', 'UNITAI_MISSILE_CARRIER_SEA');

UPDATE UNITS SET
SpecialCargo = 'SPECIALUNIT_MISSILE',
DomainCargo = 'DOMAIN_AIR'
WHERE Type = 'UNIT_MOBILE_SAM';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_MOBILE_SAM', 'PROMOTION_CARGO_II');
-- II is two slots, etc.

