DELETE FROM Unit_FreePromotions
        WHERE PromotionType="PROMOTION_IGNORE_TERRAIN_COST" AND UnitType IN (SELECT Type FROM Units 
        WHERE CombatClass='UNITCOMBAT_RECON');

UPDATE UnitPromotions
SET HillsDoubleMove = 1
WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_3';

UPDATE Language_ko_KR
SET Text = Text||' 습지에서 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]두 배[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_ko_KR
SET Text = Text||' 언덕에서 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]두 배[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE UnitPromotions
SET CannotBeChosen = 1
WHERE Type = 'PROMOTION_IGNORE_TERRAIN_COST';

DELETE FROM Language_ko_KR
        WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

INSERT INTO Language_ko_KR
        (Tag,													Text)
VALUES	('TXT_KEY_PROMOTION_IGNORE_ZOC',						'ZOC 무시'),
        ('TXT_KEY_PROMOTION_IGNORE_ZOC_HELP',					'적 유닛의 [COLOR_UNIT_TEXT]ZOC[ENDCOLOR] 무시'),
        ('TXT_KEY_PEDIA_PROMOTION_IGNORE_ZOC',					'ZOC 무시'),
		('TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP',		' [COLOR_POSITIVE_TEXT]아군 영토 밖[ENDCOLOR]에서 [ICON_STRENGTH] 전투력 보너스 +10%.[NEWLINE] 사막과 설원에서 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]두 배[ENDCOLOR]. 오아시스에서 회복 속도 [COLOR_POSITIVE_TEXT]두 배[ENDCOLOR]');

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_IGNORE_ZOC'
FROM Units WHERE CombatClass='UNITCOMBAT_RECON';

UPDATE UnitPromotions
SET IgnoreZOC = 0
WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_2';

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

UPDATE Language_ko_KR
SET Text = Text||' 승선 시 [ICON_STRENGTH] 전투력 +5%'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_1_HELP';

UPDATE Language_ko_KR
SET Text = Text||' 승선 시 [ICON_STRENGTH] 전투력 +10%'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_2_HELP';

UPDATE Language_ko_KR
SET Text = Text||' 승선 시 [ICON_STRENGTH] 전투력 +15%'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_2_HELP';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1, EmbarkDefenseModifier = 5
WHERE Type = 'PROMOTION_SCOUTING_1';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1, EmbarkDefenseModifier = 10
WHERE Type = 'PROMOTION_SCOUTING_2';

UPDATE UnitPromotions
SET ExtraNavalMovement = 1, EmbarkDefenseModifier = 15
WHERE Type = 'PROMOTION_SCOUTING_3';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1
WHERE Type = 'PROMOTION_EMBARKATION';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1
WHERE Type = 'PROMOTION_EMBARKED_SIGHT';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1
WHERE Type = 'PROMOTION_WAR_CANOES';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1
WHERE Type = 'PROMOTION_ALLWATER_EMBARKATION';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1
WHERE Type = 'PROMOTION_OCEAN_CROSSING';

INSERT INTO Language_ko_KR
        (Tag,													Text)
VALUES	('TXT_KEY_PROMOTION_ARCTICIAN',							'극지인'),
        ('TXT_KEY_PROMOTION_ARCTICIAN_HELP',					'[COLOR_WATER_TEXT]빙하[ENDCOLOR] 타일을 건널 수 있습니다. 설원에서 [ICON_STRENGTH] 전투력 보너스 +15%'),
        ('TXT_KEY_PEDIA_PROMOTION_ARCTICIAN',					'Arctician');

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'PROMOTIONS_CROSS_ICE';