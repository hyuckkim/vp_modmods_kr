UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'PROMOTIONS_HALF_MOVE';

UPDATE Units
	SET MoveRate = 'BIPED' 
	WHERE Type = 'UNIT_XCOM_SQUAD';

INSERT INTO Language_ko_KR
        (Tag,													Text)
VALUES	('TXT_KEY_PROMOTION_SLOW_WOODS',						'나무가 우거진 지형에서 이동 방해'),
        ('TXT_KEY_PROMOTION_SLOW_WOODS_HELP',					'숲, 정글, 습지, 오아시스에서 [ICON_MOVES] 이동력 감소'),
        ('TXT_KEY_PEDIA_PROMOTION_SLOW_WOODS',					'나무가 우거진 지형에서 이동 방해');

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_SLOW_WOODS'
FROM Units WHERE MoveRate = 'QUADRUPED';

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_SLOW_WOODS'
FROM Units WHERE MoveRate = 'WHEELED';

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_SLOW_WOODS'
FROM Units WHERE MoveRate = 'PHANT';