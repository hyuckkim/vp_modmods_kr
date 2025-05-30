INSERT INTO Language_ko_KR
        (Tag,										Text)
VALUES	('TXT_KEY_PROMOTION_PATHFINDER',			'탐사 물류'),
        ('TXT_KEY_PROMOTION_PATHFINDER_HELP',		'험지, 설원, 사막, 습지에서 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]두 배[ENDCOLOR]. [COLOR_WATER_TEXT]강[ENDCOLOR] 건널 시 패널티 없음. 매 턴 공격 1회 [COLOR_SELECTED_TEXT]회피[ENDCOLOR] 가능.'),
        ('TXT_KEY_PEDIA_PROMOTION_PATHFINDER',		'탐사 물류 (길잡이)'),
		('TXT_KEY_PROMOTION_PATHFINDER_2',			'전장 물류'),
        ('TXT_KEY_PROMOTION_PATHFINDER_2_HELP',		'언덕, 설원, 사막에서 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]두 배[ENDCOLOR]. 적 유닛의 [COLOR_UNIT_TEXT]ZOC[ENDCOLOR] 무시'),
        ('TXT_KEY_PEDIA_PROMOTION_PATHFINDER_2',	'전장 물류 (길잡이)'),
		('TXT_KEY_PROMOTION_SCOUT',					'탐사 물류'),
        ('TXT_KEY_PROMOTION_SCOUT_HELP',			'언덕, 설원, 사막에서 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]두 배[ENDCOLOR]. 매 턴 공격 1회 [COLOR_SELECTED_TEXT]회피[ENDCOLOR] 가능.'),
        ('TXT_KEY_PEDIA_PROMOTION_SCOUT',			'탐사 물류 (정찰병)'),
		('TXT_KEY_PROMOTION_SCOUT_2',				'전장 물류'),
        ('TXT_KEY_PROMOTION_SCOUT_2_HELP',			'언덕에서 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]두 배[ENDCOLOR]. 적 유닛의 [COLOR_UNIT_TEXT]ZOC[ENDCOLOR] 무시'),
        ('TXT_KEY_PEDIA_PROMOTION_SCOUT_2',			'전장 물류 (정찰병)'),
		('TXT_KEY_PROMOTION_POST_SCOUT',			'탐사 물류'),
        ('TXT_KEY_PROMOTION_POST_SCOUT_HELP',		'언덕에서 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]두 배[ENDCOLOR]. 매 턴 공격 1회 [COLOR_SELECTED_TEXT]회피[ENDCOLOR] 가능.'),
        ('TXT_KEY_PEDIA_PROMOTION_POST_SCOUT',		'탐사 물류 (탐험가)');

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_PATHFINDER'
FROM Units WHERE Class = 'UNITCLASS_PATHFINDER';

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_SCOUT'
FROM Units WHERE Class = 'UNITCLASS_SCOUT';

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_POST_SCOUT'
FROM Units WHERE Class = 'UNITCLASS_EXPLORER';

INSERT INTO UnitPromotions_PostCombatRandomPromotion
		(PromotionType,					NewPromotion)
VALUES	('PROMOTION_PATHFINDER',		'PROMOTION_PATHFINDER_2'),
		('PROMOTION_SCOUT',				'PROMOTION_SCOUT_2');