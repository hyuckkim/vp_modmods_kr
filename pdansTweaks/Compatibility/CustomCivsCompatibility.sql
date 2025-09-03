--=====================================================================================	
-- CUSTOM CIV COMPATIBILITY
--=====================================================================================

--Zeppelin Line added to UA promotions
INSERT INTO	Trait_FreePromotionUnitCombats
			(TraitType,						UnitCombatType, 			PromotionType)
VALUES		('TRAIT_KEEPERSOFTHEPEACE',		'UNITCOMBAT_AIRSHIP', 		'PROMOTION_ROYALCANADIANMOUNTIES'),
			('TRAIT_CHOSEN_PEOPLE',			'UNITCOMBAT_AIRSHIP', 		'PROMOTION_PROMISED_LAND'),
			('TRAIT_TA_SETI',				'UNITCOMBAT_AIRSHIP', 		'PROMOTION_NUBIA_TASETI');
				
INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_ROYALCANADIANMOUNTIES', 	'UNITCOMBAT_AIRSHIP'),
	('PROMOTION_PROMISED_LAND', 			'UNITCOMBAT_AIRSHIP'),
	('PROMOTION_NUBIA_TASETI', 				'UNITCOMBAT_AIRSHIP'),
	('PROMOTION_CLCOLONIALCAPITALISM', 		'UNITCOMBAT_AIRSHIP');