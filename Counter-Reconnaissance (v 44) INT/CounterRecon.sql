INSERT INTO Language_ko_KR
        (Tag,													Text)
VALUES	('TXT_KEY_PROMOTION_RECON_COMBAT',						'[COLOR_WARNING_TEXT]Contact [ENDCOLOR][ICON_VP_VISION]'),
		('TXT_KEY_PROMOTION_RECON_COMBAT_HELP',					'Sight [ICON_VP_VISION] reduced to 1.[NEWLINE]-20% [ICON_WAR] Attack Strength against Cities & Units that are Fortified, at Full HP, or above 50% HP. Withdraws from 1st melee attack. Expires after 1 turn combat-free.'),
		/**('TXT_KEY_PROMOTION_RECON_COMBAT_HELP',					'-20% [ICON_WAR] Attack Strength against Cities & Units that are Fortified, at Full HP, or above 50% HP. Withdraws from 1st melee attack. Expires after 1 turn combat-free.'),
		**/
		('TXT_KEY_PEDIA_PROMOTION_RECON_COMBAT',				'Contact'),
		('TXT_KEY_PROMOTION_SCREENED',							'Screened'),
        ('TXT_KEY_PROMOTION_SCREENED_HELP',						'Local intel & supplies compromised![NEWLINE]Sight [ICON_VP_VISION] reduced to 1.[NEWLINE]-10% [ICON_STRENGTH] Combat Strength against Recon. Rough terrain [ICON_MOVES] [COLOR_NEGATIVE_TEXT]ends turn[ENDCOLOR]! Lost after combat.'),
        ('TXT_KEY_PEDIA_PROMOTION_SCREENED',					'Screened'),
		('TXT_KEY_PROMOTION_TB_FINISHER',						'Blaze'),
        ('TXT_KEY_PROMOTION_TB_FINISHER_HELP',					'+5% [ICON_WAR] Attack Strength. On attack, restricts enemy movement, sight and combat strength. Can move after kill.[NEWLINE]Blocks selection of Scout promotion.'),
        ('TXT_KEY_PEDIA_PROMOTION_TB_FINISHER',					'Blaze'),
		('TXT_KEY_PROMOTION_SURV_FINISHER',						'Survivalist'),
        ('TXT_KEY_PROMOTION_SURV_FINISHER_HELP',				'+5% [ICON_STRENGTH] Defense Strength. Withdraws from 1st melee attack. After combat: damages adjacent enemies, defense increases, heals on kill.[NEWLINE]Blocks selection of Scout promotion.'),
        ('TXT_KEY_PEDIA_PROMOTION_SURV_FINISHER',				'Survivalist'),
		('TXT_KEY_PROMOTION_SURV_COMBAT',						'Attrit'),
        ('TXT_KEY_PROMOTION_SURV_COMBAT_HELP',					'+10% [ICON_STRENGTH] Defense Strength. +5 HP on kill. Adjacent enemy effect: 5 damage. Lost after 1 turn combat-free.'),
        ('TXT_KEY_PEDIA_PROMOTION_SURV_COMBAT',					'Attrit'),
		('TXT_KEY_PROMOTION_CCDCONCEALED',						'[COLOR_PROJECT_TEXT]Concealed [ENDCOLOR][ICON_VIEW_CITY]'),
        ('TXT_KEY_PROMOTION_CCDCONCEALED_HELP',					'Strict camouflage, concealment and decoy discipline conceals the unit from rival detection.[NEWLINE]-10% [ICON_WAR] Attack Strength against Cities & Units that are Fortified, at Full HP, or above 50% HP. Ranged [ICON_RANGE_STRENGTH] Attack enabled. Lost after combat.'),
        ('TXT_KEY_PEDIA_PROMOTION_CCDCONCEALED',				'Concealed'),
		('TXT_KEY_PROMOTION_RECONHEAL',							'Resupplied'),
        ('TXT_KEY_PROMOTION_RECONHEAL_HELP',					'Acquired supplies from enemy unit. [COLOR_POSITIVE_TEXT]+5 Heal[ENDCOLOR]. Lost after combat or move.'),
        ('TXT_KEY_PEDIA_PROMOTION_RECONHEAL',					'Resupplied'),
		('TXT_KEY_PROMOTION_SABOTAGED',							'Interdicted'),
        ('TXT_KEY_PROMOTION_SABOTAGED_HELP',					'Enemy recon has compromised this position.[NEWLINE]-5% [ICON_STRENGTH] defense while fortified. [COLOR_NEGATIVE_TEXT]-5 Heal[ENDCOLOR] outside enemy territory. Lost after move or 1 turn combat-free.'),
        ('TXT_KEY_PEDIA_PROMOTION_SABOTAGED',					'Interdicted'),
		('TXT_KEY_PROMOTION_MEDIC_FINISHER',					'Interdiction'),
        ('TXT_KEY_PROMOTION_MEDIC_FINISHER_HELP',				'+5% [ICON_STRENGTH] strength while fortified & from adjacent friendly units. On attack, sabotages enemy healing, providing extra healing to any attacker temporarily. After combat, sap adjacent enemy [ICON_MOVES] Movement by 1.[NEWLINE]Blocks selection of Scout promotion.'),
        ('TXT_KEY_PEDIA_PROMOTION_MEDIC_FINISHER',				'Interdiction'),
		('TXT_KEY_PROMOTION_RECON_EMBARKED',					'[COLOR_WATER_TEXT]Exposed [ENDCOLOR][ICON_VP_VISION]'),
        ('TXT_KEY_PROMOTION_RECON_EMBARKED_HELP',				'Unit has not been in combat, but is not concealed due to terrain. -20% [ICON_WAR] Attack Strength against Cities & Units that are Fortified, at Full HP, or above 50% HP. Lost after combat.'),
        ('TXT_KEY_PEDIA_PROMOTION_RECON_EMBARKED',				'Exposed'),
		('TXT_KEY_PROMOTION_SCOUTING_COMBAT',					'Exfiltrate'),
        ('TXT_KEY_PROMOTION_SCOUTING_COMBAT_HELP',				'+5% [ICON_WAR] Attack Strength against fortified units. Half-cost pillage moves. +5 HP on pillage. Ignores enemy unit [COLOR_UNIT_TEXT]Zone of Control[ENDCOLOR]. Lost after 1 turn combat free.'),
        ('TXT_KEY_PEDIA_PROMOTION_SCOUTING_COMBAT',				'Exfiltrate'),
		('TXT_KEY_PROMOTION_MEDIC_COMBAT',						'Interdicting'),
        ('TXT_KEY_PROMOTION_MEDIC_COMBAT_HELP',					'+10% [ICON_STRENGTH] strength while fortified. On attack, sabotages enemy unit healing, providing extra healing to any attacker temporarily. Saps adjacent enemy movement by 1. Lost after 1 turn combat free.'),
        ('TXT_KEY_PEDIA_PROMOTION_MEDIC_COMBAT',				'Interdicting'),
		('TXT_KEY_PROMOTION_SCOUTING_FINISHER',					'Scout'),
        ('TXT_KEY_PROMOTION_SCOUTING_FINISHER_HELP',			'+5% [ICON_WAR] Attack Strength against fortified units. Half-cost pillage moves. +5 HP to adjacent units on pillage. After combat, ignores enemy unit [COLOR_UNIT_TEXT]Zone of Control[ENDCOLOR].[NEWLINE]Blocks selection of Blaze, Survivalist, Interdiction.'),
        ('TXT_KEY_PEDIA_PROMOTION_SCOUTING_FINISHER',			'Scout');

/*
UPDATE Language_ko_KR
SET Text = REPLACE (Text, 'Pilum', 'Fortify')
WHERE Tag = 'TXT_KEY_MISC_YOU_UNIT_WAS_DAMAGED_AOE_STRIKE_FORTIFY';

UPDATE Language_ko_KR
SET Text = REPLACE (Text, 'Rend', 'Move')
WHERE Tag = 'TXT_KEY_MISC_YOU_UNIT_WAS_DAMAGED_AOE_STRIKE_ON_MOVE';
*/
UPDATE Language_ko_KR
SET Text = REPLACE (Text, 'Pillaging costs no [ICON_MOVES] Movement.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_3_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE] Blocks selection of Trailblazer III, Medic II'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_3_HELP';

UPDATE Language_ko_KR
SET Text = Text||' [COLOR_POSITIVE_TEXT]+1 HP[ENDCOLOR] from Fresh Water during non-combat turns.'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_2_HELP';

UPDATE Language_ko_KR
SET Text = Text||' [COLOR_POSITIVE_TEXT]+1 HP[ENDCOLOR] from Rivers during non-combat turns.'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_1_HELP';

UPDATE Language_ko_KR
SET Text = Text||' [COLOR_POSITIVE_TEXT]+1 HP[ENDCOLOR] from Marsh & Oasis during non-combat turns.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE] Blocks selection of Survivalism III, Medic II'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_ko_KR
SET Text = Text||' [COLOR_POSITIVE_TEXT]+1 HP[ENDCOLOR] from Forest & Jungle during non-combat turns.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE] Blocks selection of Survivalism III, Trailblazer III'
WHERE Tag = 'TXT_KEY_PROMOTION_MEDIC_II_HELP';