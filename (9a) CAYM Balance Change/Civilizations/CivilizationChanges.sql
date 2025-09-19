INSERT OR REPLACE INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound) VALUES
('UNIT_BARBARIAN_HORSEMAN','AS2D_SELECT_UNIT','AS2D_BIRTH_UNIT');


------------------------------
-- Mongolia Changes
------------------------------
UPDATE UnitPromotions SET MovesChange = 0 WHERE Type = 'PROMOTION_MONGOL_TERROR';
UPDATE UnitPromotions SET IgnoreZOC = 0 WHERE Type = 'PROMOTION_MONGOL_TERROR';
UPDATE UnitPromotions SET ExtraAttacks = 0 WHERE Type = 'PROMOTION_MONGOL_TERROR';
UPDATE UnitPromotions SET CombatPercent = 33 WHERE Type = 'PROMOTION_MONGOL_TERROR';
UPDATE UnitPromotions SET FlankAttackModifier = 0 WHERE Type = 'PROMOTION_MONGOL_TERROR';
---------------------------------------------------------------------------------------------------------
UPDATE UnitPromotions SET HillsDoubleMove = 1 WHERE Type = 'PROMOTION_MONGOL_TERROR';
INSERT INTO UnitPromotions_Features(PromotionType, FeatureType, DoubleMove) VALUES
('PROMOTION_MONGOL_TERROR', 'FEATURE_FOREST', 1),
('PROMOTION_MONGOL_TERROR', 'FEATURE_JUNGLE', 1);
---------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
UPDATE UnitPromotions SET IconAtlas = 'promoVP_atlas_03' WHERE TYPE = 'PROMOTION_MONGOL_TERROR';
UPDATE UnitPromotions SET PortraitIndex = 6 WHERE TYPE = 'PROMOTION_MONGOL_TERROR';
---------------------------------------------------------------------------------------

--DELETE FROM Trait_FreePromotionUnitClass WHERE PromotionType = 'PROMOTION_MONGOL_TERROR';

--INSERT INTO Trait_FreePromotionUnitClass
--		(TraitType, 	UnitClassType, 						PromotionType)
--VALUES 	('TRAIT_TERROR', 'UNITCLASS_CHARIOT_ARCHER', 		'PROMOTION_LOGISTICS'),
--		('TRAIT_TERROR', 'UNITCLASS_HORSE_ARCHER', 			'PROMOTION_LOGISTICS'),
--		('TRAIT_TERROR', 'UNITCLASS_MOUNTED_BOWMAN', 		'PROMOTION_LOGISTICS'),
--		('TRAIT_TERROR', 'UNITCLASS_CUIRASSIER', 			'PROMOTION_LOGISTICS'),
--		('TRAIT_TERROR', 'UNITCLASS_CAVALRY', 				'PROMOTION_LOGISTICS'),
--		('TRAIT_TERROR', 'UNITCLASS_ANTI_TANK_GUN', 		'PROMOTION_LOGISTICS'),
--		('TRAIT_TERROR', 'UNITCLASS_HELICOPTER_GUNSHIP', 	'PROMOTION_LOGISTICS');

UPDATE Language_en_US
SET Text = 'Mounted Ranged Units +33% Combat and Double Movement on Hills and in Forest/Jungle. Gain All Yields equal to 20% of the [ICON_GOLD] Gold from bullying [ICON_CITY_STATE] City-States.'
WHERE Tag = 'TXT_KEY_TRAIT_TERROR';

UPDATE Language_en_US
SET Text = 'Mounted Ranged Units +33% [NEWLINE]CombatDouble Movement on Hills and in Forest/Jungle.'
WHERE Tag = 'TXT_KEY_PROMOTION_MONGOL_TERROR_HELP';

UPDATE Language_ko_KR
SET Text = '원거리 기마 유닛의 전투력이 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR]증가하고 언덕, 숲, 정글에서 이동력이 [COLOR_POSITIVE_TEXT]2배[ENDCOLOR] 증가합니다. [ICON_CITY_STATE]도시 국가가 바치는 [ICON_GOLD] 골드의 산출량의 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR]만큼 모든 산출량을 얻습니다.'
WHERE Tag = 'TXT_KEY_TRAIT_TERROR';

UPDATE Language_ko_KR
SET Text = '원거리 기병 유닛 [ICON_STRENGTH]전투력 [COLOR_POSITIVE_TEXT]+33%[ENDCOLOR][NEWLINE]언덕, 숲, 정글에서 [ICON_MOVES]이동력 [COLOR_POSITIVE_TEXT]두 배[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_MONGOL_TERROR_HELP'; 