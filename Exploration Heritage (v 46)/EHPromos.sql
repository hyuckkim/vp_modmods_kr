INSERT INTO UnitPromotions
		(Type,								Description,								Help,											PortraitIndex,	IconAtlas,			Sound,				CannotBeChosen,	LostWithUpgrade,	PediaType,			PediaEntry)
VALUES	('PROMOTION_EXPLORATION_HERITAGE',	'TXT_KEY_PROMOTION_EXPLORATION_HERITAGE',	'TXT_KEY_PROMOTION_EXPLORATION_HERITAGE_HELP',	35,				'extraPromo_Atlas',	'AS2D_IF_LEVELUP',	1,				0,					'PEDIA_SCOUTING',	'TXT_KEY_PEDIA_PROMOTION_EXPLORATION_HERITAGE');

INSERT INTO Language_en_US 
		(Tag,												Text)
VALUES	('TXT_KEY_PROMOTION_EXPLORATION_HERITAGE',			'Exploration Heritage'),
		('TXT_KEY_PROMOTION_EXPLORATION_HERITAGE_HELP',		'Geographical knowledge transmitted by our [COLOR_PROJECT_TEXT]University[ENDCOLOR] grants 50% of the [ICON_MOVES] distance to our capital as [COLOR_XP_BLUE]XP[ENDCOLOR].[NEWLINE][NEWLINE]Unit must be [COLOR_POSITIVE_TEXT]full HP[ENDCOLOR], and [COLOR_POSITIVE_TEXT]Recon XP Pool[ENDCOLOR] must not be empty.'),
		('TXT_KEY_PEDIA_PROMOTION_EXPLORATION_HERITAGE',	'Exploration Heritage');

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,						UnitCombatType)
VALUES	('PROMOTION_EXPLORATION_HERITAGE',	'UNITCOMBAT_RECON');

UPDATE Buildings
SET TrainedFreePromotion = 'PROMOTION_EXPLORATION_HERITAGE'
WHERE (BuildingClass = 'BUILDINGCLASS_UNIVERSITY' AND TrainedFreePromotion IS NULL);

INSERT INTO Concepts
		(Type,					Topic,							Description,					Summary,					AdvisorQuestion,					Advisor,	CivilopediaPage,	CivilopediaPageText,							CivilopediaHeaderType)
VALUES	('CONCEPT_RECONXPPOOL',	'TXT_KEY_TOPIC_RECONXPPOOL',	'TXT_KEY_RECONXPPOOL_TITLE',	'TXT_KEY_RECONXPPOOL_BODY',	'TXT_KEY_RECONXPPOOL_ADV_QUEST',	'MILITARY',	5,					'TXT_KEY_CIVILOPEDIA_SHORTCUT_PROMOTIONS_LIST',	'HEADER_COMBAT');
		
INSERT INTO Language_en_US 
		(Tag,								Text)
VALUES	('TXT_KEY_TOPIC_RECONXPPOOL',		'Recon XP Pool'),
		('TXT_KEY_RECONXPPOOL_TITLE',		'Recon XP Pool'),
		('TXT_KEY_RECONXPPOOL_BODY',		'Pre-paratrooper reconnaissance units may be granted experience based on the difference between the total number of discovered land plots and total XP of all recon units.  If the number of discovered land plots exceeds the sum of recon unit XP, a recon unit with full HP & Exploration Heritage promotion will be granted XP from the Recon XP Pool each turn.'),
		('TXT_KEY_RECONXPPOOL_ADV_QUEST',	'What is the Recon XP Pool?');

UPDATE Language_en_US
SET Text = Text||' Pre-paratrooper recon units trained by this City receive the [COLOR_POSITIVE_TEXT]Exploration Heritage[ENDCOLOR] Promotion.'
WHERE Tag = 'TXT_KEY_BUILDING_UNIVERSITY_HELP';
