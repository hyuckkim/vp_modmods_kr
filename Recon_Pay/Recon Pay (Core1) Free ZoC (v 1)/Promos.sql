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
