INSERT INTO Language_ko_KR 
		(Tag,												Text)
VALUES	('TXT_KEY_PROMOTION_EXPLORATION_HERITAGE',			'Exploration Heritage'),
		('TXT_KEY_PROMOTION_EXPLORATION_HERITAGE_HELP',		'Geographical knowledge transmitted by our [COLOR_PROJECT_TEXT]University[ENDCOLOR] grants 50% of the [ICON_MOVES] distance to our capital as [COLOR_XP_BLUE]XP[ENDCOLOR].[NEWLINE][NEWLINE]Unit must be [COLOR_POSITIVE_TEXT]full HP[ENDCOLOR], and [COLOR_POSITIVE_TEXT]Recon XP Pool[ENDCOLOR] must not be empty.'),
		('TXT_KEY_PEDIA_PROMOTION_EXPLORATION_HERITAGE',	'Exploration Heritage');

INSERT INTO Language_ko_KR 
		(Tag,								Text)
VALUES	('TXT_KEY_TOPIC_RECONXPPOOL',		'Recon XP Pool'),
		('TXT_KEY_RECONXPPOOL_TITLE',		'Recon XP Pool'),
		('TXT_KEY_RECONXPPOOL_BODY',		'Pre-paratrooper reconnaissance units may be granted experience based on the difference between the total number of discovered land plots and total XP of all recon units.  If the number of discovered land plots exceeds the sum of recon unit XP, a recon unit with full HP & Exploration Heritage promotion will be granted XP from the Recon XP Pool each turn.'),
		('TXT_KEY_RECONXPPOOL_ADV_QUEST',	'What is the Recon XP Pool?');

UPDATE Language_ko_KR
SET Text = Text||' Pre-paratrooper recon units trained by this City receive the [COLOR_POSITIVE_TEXT]Exploration Heritage[ENDCOLOR] Promotion.'
WHERE Tag = 'TXT_KEY_BUILDING_UNIVERSITY_HELP';
