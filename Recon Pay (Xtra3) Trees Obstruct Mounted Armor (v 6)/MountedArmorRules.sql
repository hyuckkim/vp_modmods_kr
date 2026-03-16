UPDATE Units
	SET MoveRate = 'BIPED' 
	WHERE Type = 'UNIT_XCOM_SQUAD';

UPDATE Units
	SET Domain = 'DOMAIN_HOVER'
	WHERE Type LIKE '%HELICOPTER%';

INSERT INTO Language_en_US
        (Tag,													Text)
VALUES	('TXT_KEY_PROMOTION_SLOW_WOODS',						'Obstructed Movement in Wooded Terrain'),
        ('TXT_KEY_PROMOTION_SLOW_WOODS_HELP',					'Slower [ICON_MOVES] Movement in Forest, Jungle, Marsh, Oasis. Can use enemy roads.'),
        ('TXT_KEY_PEDIA_PROMOTION_SLOW_WOODS',					'Obstructed Movement in Wooded Terrain');

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_SLOW_WOODS'
FROM Units WHERE MoveRate = 'QUADRUPED';

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_SLOW_WOODS'
FROM Units WHERE MoveRate = 'WHEELED' AND Domain = 'DOMAIN_LAND' AND NOT (CombatClass = 'UNITCOMBAT_HELICOPTER' OR CombatClass = 'UNITCOMBAT_AIRSHIP');

/**INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_SLOW_WOODS'
FROM Units WHERE MoveRate = 'PHANT';**/

INSERT INTO UnitPromotions_Features
			(PromotionType,	FeatureType,		DoubleMove,	ExtraMove) 
	SELECT	Type,			'FEATURE_OASIS',	1,			1	FROM UnitPromotions
	WHERE (Type='PROMOTION_HORSE_THEFT');

INSERT INTO UnitPromotions_Features
			(PromotionType,	FeatureType,		DoubleMove,	ExtraMove) 
	SELECT	Type,			'FEATURE_FOREST',	1,			1	FROM UnitPromotions
	WHERE (Type='PROMOTION_HORSE_THEFT');

INSERT INTO UnitPromotions_Features
			(PromotionType,	FeatureType,		DoubleMove,	ExtraMove) 
	SELECT	Type,			'FEATURE_JUNGLE',	1,			1	FROM UnitPromotions
	WHERE (Type='PROMOTION_HORSE_THEFT');

INSERT INTO UnitPromotions_Features
			(PromotionType,	FeatureType,		DoubleMove,	ExtraMove) 
	SELECT	Type,			'FEATURE_MARSH',	1,			1	FROM UnitPromotions
	WHERE (Type='PROMOTION_HORSE_THEFT');

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'PROMOTIONS_HALF_MOVE';