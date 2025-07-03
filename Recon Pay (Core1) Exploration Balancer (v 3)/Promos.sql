INSERT INTO Language_en_US
        (Tag,										Text)
VALUES	('TXT_KEY_PROMOTION_PATHFINDER',			'Exploration Logistics'),
        ('TXT_KEY_PROMOTION_PATHFINDER_HELP',		'Ignores [ICON_MOVES] Movement Cost from Forest, Jungle, Hills, Snow, Desert, & Marsh. Can cross [COLOR_WATER_TEXT]Rivers[ENDCOLOR] without penalty. [COLOR_SELECTED_TEXT]Withdraws[ENDCOLOR] from 1 melee attack per turn.[NEWLINE]Lost on combat.'),
        ('TXT_KEY_PEDIA_PROMOTION_PATHFINDER',		'Exploration Logistics'),
		('TXT_KEY_PROMOTION_PATHFINDER_2',			'Combat Logistics'),
        ('TXT_KEY_PROMOTION_PATHFINDER_2_HELP',		'Ignores [ICON_MOVES] Movement Cost from Marsh, Snow, & Desert. Ignores enemy [COLOR_SELECTED_TEXT]Zone of Control[ENDCOLOR].[NEWLINE]Lost on upgrade.'),
        ('TXT_KEY_PEDIA_PROMOTION_PATHFINDER_2',	'Combat Logistics');

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_PATHFINDER'
FROM Units WHERE Class = 'UNITCLASS_PATHFINDER';

INSERT INTO UnitPromotions_PostCombatRandomPromotion
		(PromotionType,					NewPromotion)
VALUES	('PROMOTION_PATHFINDER',		'PROMOTION_PATHFINDER_2');