UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Authority[ENDCOLOR] prepares in the [COLOR_CYAN]early game[ENDCOLOR] to demand [ICON_PIRATE] Tribute from City-States and [ICON_VICTORY_DOMINATION] Clear Barbarian Camps to make way for Cities. Gains significant [ICON_FOOD][ICON_PRODUCTION][ICON_GOLD][ICON_RESEARCH] yields [COLOR_CYAN]throughout the game[ENDCOLOR] from expanding [ICON_CULTURE_LOCAL] Borders and [ICON_SILVER_FIST] training Units.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting Authority grants:[ENDCOLOR][NEWLINE][ICON_BULLET]+25% combat bonus VS Barbarians and receive announcements when Barbarian Camps spawn in revealed territory.[NEWLINE][ICON_BULLET]Receive 25 [ICON_CULTURE] Culture when you clear Barbarian Camps, scaling with Era.[NEWLINE][ICON_BULLET]Gain [ICON_CULTURE] Culture and [ICON_RESEARCH] Science in the [ICON_CAPITAL] Capital equal to 25% of the Gold [ICON_PIRATE] Tribute demanded from City-States.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Each Authority policy unlocked grants:[ENDCOLOR][NEWLINE][ICON_BULLET]When you train a Military Unit in a City, gain [ICON_RESEARCH] Science and [ICON_CULTURE] Culture equal to 5% of the Unit''s [ICON_PRODUCTION] Production cost.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting all policies in Authority grants:[ENDCOLOR][NEWLINE][ICON_BULLET]Unlocks building [COLOR_POSITIVE_TEXT]Alhambra[ENDCOLOR].[NEWLINE][ICON_BULLET]Cities gain 40 [ICON_GOLD] Gold when their borders expand, scaling with Era.[NEWLINE][ICON_BULLET]Allows the purchasing of [COLOR_YELLOW]Free Companies[ENDCOLOR], [COLOR_YELLOW]Foreign Legions[ENDCOLOR], and [COLOR_YELLOW]Mercenaries[ENDCOLOR] as their prerequisite technologies are researched.[NEWLINE][ICON_BULLET]Allows for the purchase of [ICON_GREAT_GENERAL] Great Generals with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_HONOR_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Tribute[ENDCOLOR][NEWLINE][ICON_BULLET]A [COLOR_POSITIVE_TEXT]Settler[ENDCOLOR] appears near the [ICON_CAPITAL] Capital.[NEWLINE][ICON_BULLET]Gain [ICON_FOOD] Food and [ICON_PRODUCTION] Production in the [ICON_CAPITAL] Capital equal to 33% of the Gold [ICON_PIRATE] Tribute demanded from City-States.'
WHERE Tag = 'TXT_KEY_POLICY_WARRIOR_CODE_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Imperium[ENDCOLOR][NEWLINE][ICON_BULLET]Cities gain 40 [ICON_PRODUCTION] Production when their borders expand, scaling with Era.[NEWLINE][ICON_BULLET]Receive 40 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture when you found or conquer Cities, scaling with Era. Conquest bonus also scales based on City [ICON_CITIZEN] population.'
WHERE Tag = 'TXT_KEY_POLICY_DISCIPLINE_HELP';

INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_BUILDING_GLOVE_HELP', 'Glove Authority');
