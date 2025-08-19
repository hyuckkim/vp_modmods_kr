--==========================================================================================================================		
-- CONCEPTS
--==========================================================================================================================
INSERT OR REPLACE INTO Language_ko_KR (Tag, Text)
VALUES
	(
		'TXT_KEY_ED_EVENTS_TITLE',
		'Events'
	),
	(
		'TXT_KEY_ED_EVENTS_BODY',
		'[ICON_ED_EVENTS] Events may randomly occur throughout the course of play. There are a whole range of Events in the game, which can result in positive, negative and mixed outcomes for a player''s country. They take the form of a pop-up notification on the player''s screen, which may present a player with a choice, or may simply inform the player of the consequences and require they acknowledge the Event has occurred.'
	),
	(
		'TXT_KEY_ED_DECISIONS_TITLE',
		'Decisions'
	),
	(
		'TXT_KEY_ED_DECISIONS_BODY',
		'[ICON_ED_DECISIONS] Decisions are a set of choices a nation can make if certain conditions are met. Each Decision has consequences, which can be both positive and negative. A nation never has to take a Decision it is always at the players discretion whether to accept a Decision or not. Some Decisions are nation specific, some are religion specific and some are more generic.'
	);
UPDATE Language_ko_KR
	SET Text = '+1 [ICON_RES_PAPER] Paper. +10% [ICON_PRODUCTION] Production of Diplomatic Units. Can only be constructed in a Capital. The cost goes up the more cities there are in the empire. [NEWLINE][NEWLINE] +10% of the [ICON_PRODUCTION] Production of the City is added to the current [ICON_PRODUCTION] Production amount every time the city gains a [ICON_CITIZEN] Citizen. Provides 1 [ICON_MAGISTRATES] Magistrates on completion and 1 [ICON_MAGISTRATES] Magistrates when entering a new era.'
	WHERE Tag = 'TXT_KEY_BUILDING_COURT_SCRIBE_HELP';
UPDATE Language_ko_KR
	SET Text = 'This National Wonder is unique, in that players may build it in their Capital without any other prerequisites. It gives a small production boost when building diplomatic units in the capital, and one [ICON_RES_PAPER] Paper resource. Build this building if you want to secure a city-state ally or two during the first few eras of the game. The additional [ICON_PRODUCTION] Production granted upon City growth makes it important to build this building early on to maximize the boost. Also provides 1 [ICON_MAGISTRATES] Magistrates upon completion, as well as an additional [ICON_MAGISTRATES] Magistrates for each new era.'
	WHERE Tag = 'TXT_KEY_BUILDING_COURT_SCRIBE_STRATEGY';
UPDATE Language_ko_KR
	SET Text = '+1 [ICON_RESEARCH] Science for every 3 [ICON_CITIZEN] Citizens in the City. Contains 1 slot for a Great Work of Art.[NEWLINE][NEWLINE]When one of the following [COLOR_POSITIVE_TEXT]Historic Events[ENDCOLOR] is completed, receive a [ICON_TOURISM] Tourism boost with all known Civs based on your recent [ICON_CULTURE] Culture output:[NEWLINE][ICON_BULLET] Earn a [ICON_GREAT_PEOPLE] Great Person[NEWLINE][ICON_BULLET] Build a [ICON_GOLDEN_AGE] World Wonder[NEWLINE][ICON_BULLET] Win a [ICON_WAR] War[NEWLINE][ICON_BULLET] Enter a new [ICON_RESEARCH] Era[NEWLINE][NEWLINE][ICON_CONNECTED] Connecting other Cities to the [ICON_CAPITAL] Capital by Road will produce additional [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Provides 2 [ICON_MAGISTRATES] Magistrates at the start of the game.'
	WHERE Tag = 'TXT_KEY_BUILDING_PALACE_HELP';
UPDATE Language_ko_KR
	SET Text = 'Receive 1 free Great Diplomat when completed. +1 [ICON_RES_PAPER] Paper. +20% [ICON_PRODUCTION] Production of Diplomatic Units. All Diplomatic Units receive the [COLOR_POSITIVE_TEXT]Nobility[ENDCOLOR] Promotion.[NEWLINE][NEWLINE]Provides 1 [ICON_MAGISTRATES] Magistrates when completed.'
	WHERE Tag = 'TXT_KEY_BUILDING_SUMMER_PALACE_HELP';
UPDATE Language_ko_KR
	SET Text = '+1 [ICON_RES_PAPER] Paper. +20% [ICON_PRODUCTION] Production of Diplomatic Units. All Diplomatic Units receive the [COLOR_POSITIVE_TEXT]Imperial Seal[ENDCOLOR] Promotion. [NEWLINE][NEWLINE]Provides 1 [ICON_MAGISTRATES] Magistrates when completed.'
	WHERE Tag = 'TXT_KEY_BUILDING_FORUM_HELP';
UPDATE Language_ko_KR
	SET Text = '+1 [ICON_RES_PAPER] Paper. +20% [ICON_PRODUCTION] Production of Diplomatic Units. All Diplomatic Units receive the [COLOR_POSITIVE_TEXT]Literacy[ENDCOLOR] Promotion.[NEWLINE][NEWLINE]Must have built a Chancery in all cities. The cost goes up the more cities there are in the empire.[NEWLINE][NEWLINE]Provides 1 [ICON_MAGISTRATES] Magistrates when completed.'
	WHERE Tag = 'TXT_KEY_BUILDING_PRINTING_PRESS_HELP';
UPDATE Language_ko_KR
	SET Text = '+2 [ICON_RES_PAPER] Paper. +20% [ICON_PRODUCTION] Production of Diplomatic Units. All Diplomatic Units receive the [COLOR_POSITIVE_TEXT]Diplomatic Immunity[ENDCOLOR] Promotion.[NEWLINE][NEWLINE]Must have built a Wire Service in all cities. The cost goes up the more cities there are in the empire.[NEWLINE][NEWLINE]Provides 1 [ICON_MAGISTRATES] Magistrates when completed.'
	WHERE Tag = 'TXT_KEY_BUILDING_FOREIGN_OFFICE_HELP';