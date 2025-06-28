UPDATE Language_en_US SET
Text = 'The Minefield is a Modern-era building which can only be constructed if you have enough Iron and you have already built a Harbor in the City. With the Minefield in place, enemy ships are stopped immediately after entering the City''s territory and are no longer safe to sit back on local ocean tiles outside of range from retaliation from land. Your Naval Melee Units from this City have a lesser effect on all adjacent enemies. Use Minefields to blunt a naval invasion, and then outmaneuver it with your own navy. Due to their resource requirement, Minefields are best limited to locations particularly vulnerable to naval sieges. '
WHERE Tag = 'TXT_KEY_BUILDING_MINEFIELD_STRATEGY';

UPDATE Language_en_US SET
Text = Replace(Text, '-10% [ICON_STRENGTH] Combat Strength when defending against [COLOR_NEGATIVE_TEXT]Ranged Attacks[ENDCOLOR].[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_MINELAYER_HELP';

UPDATE Language_en_US SET
Text = Replace(Text, '[NEWLINE][NEWLINE]Available once you have researched [COLOR_CYAN]{TXT_KEY_TECH_COMBUSTION_TITLE}[ENDCOLOR].', '')
WHERE Tag = 'TXT_KEY_PROMOTION_MINELAYER_HELP';

UPDATE Language_en_US SET
Text = '+15 XP for Sea Units. All Naval Melee Units created by this City (past or future) receive the [COLOR_POSITIVE_TEXT]Minelayer[ENDCOLOR] Promotion, slowing adjacent enemy Units.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_MINEFIELD_HELP';