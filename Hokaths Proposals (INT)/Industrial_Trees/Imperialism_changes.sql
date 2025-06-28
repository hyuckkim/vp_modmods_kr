--------------------
-- Imperialism
--------------------
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Imperialism[ENDCOLOR] extracts additional yields, especially from [ICON_PUPPET] Puppet Cities. Militarily, it provides [ICON_PRODUCTION][ICON_GOLD] discounts for obtaining the newest Units, and enhances [ICON_VP_VISION] Sight, [ICON_MOVES] Movement, and [ICON_STRENGTH] Combat Strength, particularly of [ICON_GREAT_ADMIRAL] Admirals and their navies.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting Imperialism grants:[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_MOVES] Movement for Naval Units, Embarked Units, and [ICON_GREAT_GENERAL] Great Generals, as well as +1 [ICON_VP_VISION] Sight for Melee, Recon, Naval Melee and Gunpowder Units.[NEWLINE][ICON_BULLET]+10% [ICON_PRODUCTION] Production toward Military Units, -10% [ICON_GOLD] Gold required for upgrades.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Each Imperialism policy unlocked grants:[ENDCOLOR][NEWLINE][ICON_BULLET]+5% [ICON_PRODUCTION] Production for Military Units, -5% [ICON_GOLD] Gold required for upgrades.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting all policies in Imperialism grants:[ENDCOLOR][NEWLINE][ICON_BULLET]Unlocks building the [COLOR_POSITIVE_TEXT]Pentagon[ENDCOLOR].[NEWLINE][ICON_BULLET]Allows you to see [ICON_RES_HIDDEN_ARTIFACTS] Hidden Antiquity Sites.[NEWLINE][ICON_BULLET]All Naval and Air units gain the [COLOR_POSITIVE_TEXT]Banzai![ENDCOLOR] Promotion (become stronger as they take damage).[NEWLINE][ICON_BULLET]Allows for the purchase of [ICON_GREAT_ADMIRAL] Great Admirals with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_EXPLORATION_HELP';

UPDATE Language_en_US
SET Text = Replace(Text, '[NEWLINE][ICON_BULLET]Allows you to see [ICON_RES_HIDDEN_ARTIFACTS] Hidden Antiquity Sites.', '')
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_AESTHETICS_HELP';


UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Colonialism[ENDCOLOR][NEWLINE][ICON_BULLET]+2 [ICON_RESEARCH] Science and +1 [ICON_CULTURE] Culture from Barracks, Armories, Military Academies.[NEWLINE][ICON_BULLET]+2 [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, and [ICON_GREAT_ADMIRAL] Great Admiral Points from Citadels and Manufactories.[NEWLINE][ICON_BULLET]Each unique [ICON_VP_MONOPOLY] Global Monopoly modifier is increased by an additional 10% if it''s percentage-based, or +3 otherwise.'
WHERE Tag = 'TXT_KEY_POLICY_NAVAL_TRADITION_HELP';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Martial Law[ENDCOLOR][NEWLINE][ICON_BULLET]No [ICON_GOLD] Gold Maintenance for Garrisons.[NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness and +4 [ICON_CULTURE] Culture for each Garrison.[NEWLINE][ICON_BULLET]+2 [ICON_CULTURE] Culture and [ICON_CULTURE_LOCAL] Border Growth Points from Forts.[NEWLINE][ICON_BULLET]-30% Yield penalties for [ICON_PUPPET] Puppeted Cities.'
WHERE Tag = 'TXT_KEY_POLICY_MARITIME_INFRASTRUCTURE_HELP';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Exploitation[ENDCOLOR][NEWLINE][ICON_BULLET]+3 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_CULTURE_LOCAL] Border Growth Points from Luxury Resources.[NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production and [ICON_RESEARCH] Science from Coasts, Lakes, and Oceans.'
WHERE Tag = 'TXT_KEY_POLICY_MERCHANT_NAVY_HELP';
