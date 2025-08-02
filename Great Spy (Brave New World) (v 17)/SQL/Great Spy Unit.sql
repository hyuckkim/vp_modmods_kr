--Units

INSERT INTO Units 	
		(Class,							Type,					Cost,	Moves,	BaseSightRange,		CivilianAttackPriority,				Special,				Domain,			DefaultUnitAI,		Description,					Civilopedia,						Strategy, 							AdvancedStartCost,	WorkRate,	CombatLimit, 	 UnitArtInfo,					UnitArtInfoEraVariation,	UnitFlagAtlas,					UnitFlagIconOffset,		IconAtlas,				PortraitIndex,		      MoveRate)
VALUES	('UNITCLASS_TOMATEKH_SPY',		'UNIT_TOMATEKH_SPY',	-1,		3,		3,					'CIVILIAN_ATTACK_PRIORITY_HIGH',	'SPECIALUNIT_PEOPLE',	'DOMAIN_LAND',	'UNITAI_EXPLORE',	'TXT_KEY_UNIT_TOMATEKH_SPY',	'TXT_KEY_UNIT_TOMATEKH_SPY_TEXT',	'TXT_KEY_UNIT_TOMATEKH_STRATEGY',	-1,					1,			0,				'ART_DEF_UNIT_TOMATEKH_SPY',	1,							'TOMATEKH_SPY_ALPHA_ATLAS',		0,						'TOMATEKH_SPY_ATLAS',	1,					'GREAT_PERSON');

INSERT INTO UnitClasses
		(Type,								Description,										DefaultUnit)
Values	('UNITCLASS_TOMATEKH_SPY',			'TXT_KEY_UNIT_TOMATEKH_SPY',				'UNIT_TOMATEKH_SPY');

INSERT INTO Unit_AITypes
		(UnitType,																				 UnitAIType)
Values	('UNIT_TOMATEKH_SPY',														       'UNITAI_EXPLORE');

INSERT INTO Unit_Flavors
		(UnitType,										FlavorType,						Flavor)
Values	('UNIT_TOMATEKH_SPY',							'FLAVOR_ESPIONAGE',					 1),
	    ('UNIT_TOMATEKH_SPY',							'FLAVOR_RECON',				         1);

INSERT INTO Unit_FreePromotions 
		(UnitType,											                   PromotionType)
VALUES	('UNIT_TOMATEKH_SPY',			                            'PROMOTION_TOMATEKH_SPY');

INSERT INTO Unit_UniqueNames	
		(UnitType,											 UniqueName)	
VALUES	('UNIT_TOMATEKH_SPY',		 'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_1'),	
		('UNIT_TOMATEKH_SPY',		 'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_2'),
		('UNIT_TOMATEKH_SPY',		 'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_3'),
		('UNIT_TOMATEKH_SPY',		 'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_4'),
		('UNIT_TOMATEKH_SPY',		 'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_5'),
		('UNIT_TOMATEKH_SPY',		 'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_6'),
		('UNIT_TOMATEKH_SPY',		 'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_7'),
		('UNIT_TOMATEKH_SPY',		 'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_8'),
		('UNIT_TOMATEKH_SPY',		 'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_9'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_10'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_11'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_12'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_13'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_14'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_15'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_16'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_17'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_18'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_19'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_20'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_21'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_22'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_23'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_24'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_25'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_26'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_27'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_28'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_29'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_30'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_31'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_32'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_33'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_34'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_35'),
		('UNIT_TOMATEKH_SPY',		'TXT_KEY_UNIT_TOMATEKH_SPY_NAME_36');

--Promotions

INSERT INTO UnitPromotions 
		(Type, 								Description, 							Help, 										Sound, 					CannotBeChosen,			Invisible,					SeeInvisible,				IgnoreTerrainCost,		RivalTerritory,		PortraitIndex,	IconAtlas,								PediaType,				PediaEntry)
VALUES	('PROMOTION_TOMATEKH_SPY', 			'TXT_KEY_PROMOTION_TOMATEKH_SPY',		'TXT_KEY_PROMOTION_TOMATEKH_SPY_HELP',		'AS2D_IF_LEVELUP',		1,						'INVISIBLE_SUBMARINE',		'INVISIBLE_SUBMARINE',		1,						1,					0,				'TOMATEKH_SPY_PROMOTION_ATLAS',			'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_TOMATEKH_SPY'),
		('PROMOTION_TOMATEKH_SPY_XP1', 		'TXT_KEY_PROMOTION_TOMATEKH_SPY',		'TXT_KEY_PROMOTION_TOMATEKH_SPY_HELP',		'AS2D_IF_LEVELUP',		1,						'INVISIBLE_SUBMARINE',		'INVISIBLE_SUBMARINE',		1,						1,					0,				'TOMATEKH_SPY_PROMOTION_ATLAS',			NULL,					'TXT_KEY_PROMOTION_TOMATEKH_SPY'),
		('PROMOTION_TOMATEKH_SPY_XP2', 		'TXT_KEY_PROMOTION_TOMATEKH_SPY',		'TXT_KEY_PROMOTION_TOMATEKH_SPY_HELP',		'AS2D_IF_LEVELUP',		1,						'INVISIBLE_SUBMARINE',		'INVISIBLE_SUBMARINE',		1,						1,					0,				'TOMATEKH_SPY_PROMOTION_ATLAS',			NULL,					'TXT_KEY_PROMOTION_TOMATEKH_SPY'),
		('PROMOTION_TOMATEKH_SPY_XP3', 		'TXT_KEY_PROMOTION_TOMATEKH_SPY',		'TXT_KEY_PROMOTION_TOMATEKH_SPY_HELP',		'AS2D_IF_LEVELUP',		1,						'INVISIBLE_SUBMARINE',		'INVISIBLE_SUBMARINE',		1,						1,					0,				'TOMATEKH_SPY_PROMOTION_ATLAS',			NULL,					'TXT_KEY_PROMOTION_TOMATEKH_SPY'),
		('PROMOTION_TOMATEKH_SPY_NULL', 	'TXT_KEY_PROMOTION_TOMATEKH_SPY_NULL',	'TXT_KEY_PROMOTION_TOMATEKH_SPY_HELP_NULL',	'AS2D_IF_LEVELUP',		1,						NULL,						NULL,						0,						0,					0,				'TOMATEKH_SPY_PROMOTION_ATLAS',			NULL,					'TXT_KEY_PROMOTION_TOMATEKH_SPY_NULL');

UPDATE UnitPromotions SET Description = 'TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE_SPY' WHERE Type = 'PROMOTION_INVISIBLE_SUBMARINE';
UPDATE UnitPromotions SET PediaEntry = 'TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE_SPY_HELP' WHERE Type = 'PROMOTION_INVISIBLE_SUBMARINE';
UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE_SPY' WHERE Type = 'PROMOTION_INVISIBLE_SUBMARINE';

UPDATE UnitPromotions SET Description = 'TXT_KEY_PROMOTION_SEE_INVISIBLE_SUBMARINE_SPY' WHERE Type = 'PROMOTION_SEE_INVISIBLE_SUBMARINE';
UPDATE UnitPromotions SET PediaEntry = 'TXT_KEY_PROMOTION_SEE_INVISIBLE_SUBMARINE_SPY_HELP' WHERE Type = 'PROMOTION_SEE_INVISIBLE_SUBMARINE';
UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_SEE_INVISIBLE_SUBMARINE_SPY' WHERE Type = 'PROMOTION_SEE_INVISIBLE_SUBMARINE';

/*

-- Spy / Pec - RtP
CREATE TABLE IF NOT EXISTS 
Policy_FaithPurchaseUnitClasses (
    PolicyType										text 						default null,
	UnitClassType									text 	 					default null,
    EraType											text 						default null);

INSERT INTO Policy_FaithPurchaseUnitClasses
		(PolicyType,					         UnitClassType)
SELECT	'POLICY_PATRONAGE_FINISHER',	'UNITCLASS_TOMATEKH_SPY'
WHERE EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER')
AND NOT EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE');

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Patronage[ENDCOLOR] enhances the benefits of City-State friendship.[NEWLINE][NEWLINE]Adopting Patronage will cause [ICON_INFLUENCE] Influence with City-States to degrade 25% slower than normal. Unlocks building the Forbidden Palace.[NEWLINE][NEWLINE]Adopting all policies in the Patronage tree will cause allied City-States to occasionally gift you [ICON_GREAT_PEOPLE] Great People. It also allows the purchase of Great Spies with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PATRONAGE_HELP' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER')
AND NOT EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE');

-- Spy + RtP - PeC
INSERT INTO Policy_FaithPurchaseUnitClasses
		(PolicyType,					         UnitClassType)
SELECT	'POLICY_PATRONAGE_FINISHER',	'UNITCLASS_TOMATEKH_SPY'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_DIGNITARY')
AND NOT EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER');

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Patronage[ENDCOLOR] enhances the benefits of City-State friendship.[NEWLINE][NEWLINE]Adopting Patronage will cause [ICON_INFLUENCE] Influence with City-States to degrade 25% slower than normal. Unlocks building the Forbidden Palace.[NEWLINE][NEWLINE]Adopting all policies in the Patronage tree will cause allied City-States to occasionally gift you [ICON_GREAT_PEOPLE] Great People. It also allows the purchase of Great Spies with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PATRONAGE_HELP' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_DIGNITARY')
AND NOT EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER');

DELETE FROM Policy_FaithPurchaseUnitClasses 
WHERE UnitClassType = 'UNITCLASS_JFD_GREAT_DIGNITARY' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_DIGNITARY')
AND NOT EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER');

INSERT INTO Policy_FaithPurchaseUnitClasses
		(PolicyType,					             UnitClassType)
SELECT	'POLICY_LIBERTY_FINISHER',	'UNITCLASS_JFD_GREAT_DIGNITARY'
WHERE EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_DIGNITARY')
AND NOT EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER');

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Liberty[ENDCOLOR] is best for civilizations which desire rapid expansion.[NEWLINE][NEWLINE]Adopting Liberty will provide 1 [ICON_CULTURE] Culture in every city. Unlocks building the Pyramids.[NEWLINE][NEWLINE]Adopting all policies in the Liberty tree will grant a free Great Person of your choice near the [ICON_CAPITAL] Capital. It also allows the purchase of Great Magistrates and Great Dignitaries with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_LIBERTY_HELP' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_DIGNITARY')
AND NOT EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER');

-- Spy + PeC + RtP
DELETE FROM Policy_FaithPurchaseUnitClasses WHERE PolicyType = 'POLICY_IDEOLOGY_ENTERTAINER' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER');

DELETE FROM Policy_FaithPurchaseUnitClasses WHERE UnitClassType = 'UNITCLASS_JFD_GREAT_MAGISTRATE' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER');

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Liberty[ENDCOLOR] is best for civilizations which desire rapid expansion.[NEWLINE][NEWLINE]Adopting Liberty will provide 1 [ICON_CULTURE] Culture in every city. Unlocks building the Pyramids.[NEWLINE][NEWLINE]Adopting all policies in the Liberty tree will grant a free Great Person of your choice near the [ICON_CAPITAL] Capital.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_LIBERTY_HELP' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER');

--
INSERT INTO Policies 
		(Type,										Description,								        Civilopedia,                                    Help,											GridX,		GridY,		PortraitIndex,		IconAtlas,			   IconAtlasAchieved)
SELECT	'POLICY_TOMATEKH_FAITH_ENTERTAINER',		'TXT_KEY_POLICY_TOMATEKH_SPY_DUMMY',			    'TXT_KEY_POLICY_TOMATEKH_SPY_DUMMY_TEXT',		'TXT_KEY_POLICY_TOMATEKH_SPY_DUMMY_HELP',	    1000,		1000,		47,					'POLICY_ATLAS',			 'POLICY_A_ATLAS'
WHERE EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE');

UPDATE PolicyBranchTypes
SET FreePolicy = 'POLICY_TOMATEKH_FAITH_ENTERTAINER'
WHERE Type = 'POLICY_BRANCH_FREEDOM'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE');

INSERT INTO Policy_FaithPurchaseUnitClasses
		(PolicyType,					         UnitClassType)
SELECT	'POLICY_TOMATEKH_FAITH_ENTERTAINER',	'UNITCLASS_ENTERTAINER'
WHERE EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE');

UPDATE Language_en_US
SET Text = 'The Freedom ideology provides bonuses for Culture, Tourism, Specialist production, and more. Freedom becomes available upon completing 3 factories or entering the Modern Era, and cannot be active at the same time as Autocracy or Order.[NEWLINE][NEWLINE]Adopting Freedom also allows the purchase of Great Entertainers with [ICON_PEACE] Faith.'
WHERE Tag = 'TXT_KEY_SOCIALPOLICY_FREEDOM_HEADING3_BODY' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER');

--
INSERT INTO Policies 
		(Type,										Description,								        Civilopedia,                                    Help,											GridX,		GridY,		PortraitIndex,		IconAtlas,			   IconAtlasAchieved)
SELECT	'POLICY_TOMATEKH_FAITH_SPY',			    'TXT_KEY_POLICY_TOMATEKH_SPY_DUMMY',			    'TXT_KEY_POLICY_TOMATEKH_SPY_DUMMY_TEXT',		'TXT_KEY_POLICY_TOMATEKH_SPY_DUMMY_HELP',	    1000,		1000,		47,					'POLICY_ATLAS',			 'POLICY_A_ATLAS'
WHERE EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE');

UPDATE PolicyBranchTypes
SET FreePolicy = 'POLICY_TOMATEKH_FAITH_SPY'
WHERE Type = 'POLICY_BRANCH_ORDER'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE');

INSERT INTO Policy_FaithPurchaseUnitClasses
		(PolicyType,					         UnitClassType)
SELECT	'POLICY_TOMATEKH_FAITH_SPY',	'UNITCLASS_TOMATEKH_SPY'
WHERE EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE');

UPDATE Language_en_US
SET Text = 'Players interested in creating massive, sprawling civs should turn to the Order ideology, as the strength of the empire is determined by the total number of cities it contains. Order becomes available for exploration upon completing 3 factories or entering the Modern Era.[NEWLINE][NEWLINE]Adopting Order also allows the purchase of Great Spies with [ICON_PEACE] Faith.'
WHERE Tag = 'TXT_KEY_SOCIALPOLICY_ORDER_HEADING3_BODY' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER');

--
INSERT INTO Policies 
		(Type,										Description,								        Civilopedia,                                    Help,											GridX,		GridY,		PortraitIndex,		IconAtlas,			   IconAtlasAchieved)
SELECT	'POLICY_TOMATEKH_FAITH_MAGISTRATE',			'TXT_KEY_POLICY_TOMATEKH_SPY_DUMMY',			    'TXT_KEY_POLICY_TOMATEKH_SPY_DUMMY_TEXT',		'TXT_KEY_POLICY_TOMATEKH_SPY_DUMMY_HELP',	    1000,		1000,		47,					'POLICY_ATLAS',			 'POLICY_A_ATLAS'
WHERE EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE');

UPDATE PolicyBranchTypes
SET FreePolicy = 'POLICY_TOMATEKH_FAITH_MAGISTRATE'
WHERE Type = 'POLICY_BRANCH_AUTOCRACY'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE');

INSERT INTO Policy_FaithPurchaseUnitClasses
		(PolicyType,					         UnitClassType)
SELECT	'POLICY_TOMATEKH_FAITH_MAGISTRATE',	'UNITCLASS_JFD_GREAT_MAGISTRATE'
WHERE EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE');

UPDATE Language_en_US
SET Text = 'The Autocracy ideology is well suited for those wishing nothing more than to crush their foes under the weight of their iron-plated boots. This ideology unlocks upon completing 3 factories or entering the Modern Era, and cannot be active at the same time as Freedom or Order.[NEWLINE][NEWLINE]Adopting Autocracy also allows the purchase of Great Magistrates with [ICON_PEACE] Faith.'
WHERE Tag = 'TXT_KEY_SOCIALPOLICY_AUTOCRACY_HEADING3_BODY' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_MAGISTRATE')
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_ENTERTAINER');

*/


