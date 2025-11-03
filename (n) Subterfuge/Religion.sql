----------------------------
-- Daoguan building with spy rebalance
----------------------------
REPLACE INTO Beliefs
		(Type, Description, ShortDescription, Tooltip, 
		Pantheon, Founder, Follower, Enhancer, Reformation)
VALUES
	('BELIEF_DAOGUAN', 'TXT_KEY_BELIEF_DAOGUAN', 'TXT_KEY_BELIEF_DAOGUAN_SHORT', 'TXT_KEY_BELIEF_DAOGUAN',	
		0, 	0, 	1, 	0, 	0);

REPLACE INTO Belief_BuildingClassFaithPurchase
		(BeliefType, 				BuildingClassType)
VALUES	
		('BELIEF_DAOGUAN', 			'BUILDINGCLASS_DAOGUAN');

REPLACE INTO BuildingClasses 	
		(Type, 							DefaultBuilding, 		Description)
VALUES	
	('BUILDINGCLASS_DAOGUAN', 		'BUILDING_DAOGUAN', 	'TXT_KEY_BUILDING_DAOGUAN');

UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_DAOGUAN_TOOLTIP' WHERE Type = 'BELIEF_DAOGUAN';

REPLACE INTO Buildings 	
		(Type, 					BuildingClass, 				Description, 					Civilopedia, 						Strategy, Help,  						ReligiousPressureModifier, 	ConversionModifier, GreatWorkSlotType,				GreatWorkCount, GreatPeopleRateModifier, ExtraSpies, SpySecurityModifier,
		NoUnhappfromXSpecialists, 	DistressFlatReduction, 	Cost, UnlockedByBelief, FaithCost, NukeImmune, ConquestProb, ArtDefineTag, MinAreaSize, IconAtlas,	 			PortraitIndex)
SELECT	'BUILDING_DAOGUAN', 	'BUILDINGCLASS_DAOGUAN', 	'TXT_KEY_BUILDING_DAOGUAN', 	'TXT_KEY_BUILDING_DAOGUAN_PEDIA', 	'TXT_KEY_BUILDING_DAOGUAN_STRATEGY', 	'TXT_KEY_BUILDING_DAOGUAN_HELP', 	
		25, -10,	'GREAT_WORK_SLOT_LITERATURE', 	1, 	0, 1, 10,
		1, 	0, 	Cost, UnlockedByBelief, FaithCost, NukeImmune, ConquestProb, ArtDefineTag, MinAreaSize, 'SpyRework_Atlas', 	8
FROM Buildings WHERE Type = 'BUILDING_CHURCH';

REPLACE INTO Building_YieldChanges
		(BuildingType, 		YieldType, 	Yield)
VALUES	
		('BUILDING_DAOGUAN', 	'YIELD_FAITH', 	4);

REPLACE INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_DAOGUAN', 	'FLAVOR_GREAT_PEOPLE', 	20),
	('BUILDING_DAOGUAN', 	'FLAVOR_RELIGION', 	50);

REPLACE INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_DAOGUAN_SHORT', 'Daoguans'),
	('TXT_KEY_BELIEF_DAOGUAN', 'Use [ICON_PEACE] Faith to purchase Daoguans.'),
	('TXT_KEY_BUILDING_DAOGUAN', 'Daoguan'),
	('TXT_KEY_BUILDING_DAOGUAN_PEDIA', 'A Daoguan is a place of worship in Taoism. The structure and function of a Daoguan can vary according to the Taoist school the temple belongs to. For example, guan of the Quanzhen School are monasteries where celibate daoshi live.'),
	('TXT_KEY_BUILDING_DAOGUAN_HELP', '+10 [ICON_SPY] City Security and +10 [ICON_VP_SPY_POINTS] Spy Points. Boost Pressure of [ICON_RELIGION] Religious Majority emanating from this City by +25%, and increases the City''s resistance to [ICON_RELIGION] Religious conversion by 10%.[NEWLINE][NEWLINE]1 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from Urbanization.[NEWLINE][NEWLINE]Contains 1 slot for a [ICON_GREAT_WORK] Great Work of Writing.'),
	('TXT_KEY_BUILDING_DAOGUAN_STRATEGY', 'Can only be built in cities following a religion with the Daoguans belief. Construct this building by purchasing it with [ICON_PEACE] Faith. The Daoguan offers bonuses towards Great People generation and Spies. It is one of the only ways to leverage a large empire to boost your Espionage.'),
	('TXT_KEY_BUILDING_DAOGUAN_TOOLTIP', '+4 [ICON_PEACE] Faith[NEWLINE][NEWLINE]{TXT_KEY_BUILDING_DAOGUAN_HELP}');

------------------------------
-- Add espionage interactions to some founders
------------------------------
-- chartarium, guard your tech
UPDATE Buildings SET 
SpySecurityModifierPerXPop = 120
WHERE Type = 'BUILDING_RELIGIOUS_LIBRARY';

UPDATE Language_en_US SET
Text = '+1 [ICON_SPY] City Security for every 3 [ICON_CITIZEN] Citizens in the City.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_RELIGIOUS_LIBRARY_HELP';

UPDATE Language_en_US
SET Text = 'When you research a Technology, gain +2 [ICON_GOLDEN_AGE] Golden Age Points, [ICON_PEACE] Faith, and [ICON_CULTURE] Culture for every Follower of your [ICON_RELIGION] Religion (max 250 Followers).[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Chartarium National Wonder[ENDCOLOR] (+1 [ICON_SPY] City Security for every 3 [ICON_CITIZEN] Citizens; +5 [ICON_RESEARCH] Science from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_TITHE';

-- council, control the church
UPDATE Buildings SET 
ExtraSpies = 5
WHERE Type = 'BUILDING_HOLY_COUNCIL';

UPDATE Language_en_US SET
Text = '+50 [ICON_VP_SPY_POINTS] Spy Points.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_HOLY_COUNCIL_HELP';

UPDATE Language_en_US
SET Text = 'When a City adopts your [ICON_RELIGION] Religion for the first time, gain 20 [ICON_RESEARCH] Science and [ICON_PRODUCTION] Production in your Holy City, scaling gradually based on the number of Cities following your [ICON_RELIGION] Religion (bonus caps at 25 Cities).[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Holy Council National Wonder[ENDCOLOR] (+4 [ICON_PEACE] Faith, +5 [ICON_FOOD] Food, +50 [ICON_VP_SPY_POINTS] Spy Points; +5 [ICON_RESEARCH] Science from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_PAPAL_PRIMACY';

-- court, establish security
UPDATE Buildings SET 
GlobalSpySecurityModifier = 8
WHERE Type = 'BUILDING_DIVINE_COURT';

UPDATE Language_en_US SET
Text = '+8 [ICON_SPY] City Security in all Cities.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_DIVINE_COURT_HELP';

UPDATE Language_en_US
SET Text = 'When you unlock a Policy, gain 5 [ICON_PEACE] Faith, [ICON_RESEARCH] Science, and [ICON_GOLD] Gold for every Follower of your [ICON_RELIGION] Religion (max 250 Followers).[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Divine Court National Wonder[ENDCOLOR] (+4 [ICON_PEACE] Faith, +6 [ICON_GOLD] Gold, +8 [ICON_SPY] City Security in all Cities; +5 [ICON_CULTURE] Culture from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_CHURCH_PROPERTY';

-- throne, aquire eunuchs. 80 has china in mind
UPDATE Buildings SET 
ExtraSpies = 8
WHERE Type = 'BUILDING_HEAVENLY_THRONE';

UPDATE Language_en_US SET
Text = '+80 [ICON_VP_SPY_POINTS] Spy Points.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_HEAVENLY_THRONE_HELP';

UPDATE Language_en_US
SET Text = 'Holy City produces +20% of its Yields when your Empire is in a [ICON_GOLDEN_AGE] Golden Age.[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Celestial Throne National Wonder[ENDCOLOR] (+2 [ICON_PEACE] Faith, [ICON_CULTURE] Culture, [ICON_FOOD] Food, [ICON_RESEARCH] Science, [ICON_GOLD] Gold, and [ICON_PRODUCTION] Production, +80 [ICON_VP_SPY_POINTS] Spy Points.; +5 [ICON_GOLDEN_AGE] Golden Age Points from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_PEACE_LOVING';

-- mausoleum has an effect

-- palace 

INSERT INTO Building_YieldChangesPerPop
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_APOSTOLIC_PALACE', 'YIELD_TOURISM', 34);

UPDATE Language_en_US SET
Text = '+1 [ICON_TOURISM] Tourism for every 3 [ICON_CITIZEN] Citizens in the City. ' || Text
WHERE Tag = 'TXT_KEY_BUILDING_APOSTOLIC_PALACE_HELP';

UPDATE Language_en_US
SET Text = 'When you spread your [ICON_RELIGION] Religion to foreign Cities, gain +15 [ICON_FOOD] Food in Holy City, scaling with the number of new Followers of your [ICON_RELIGION] Religion, and 15 [ICON_TOURISM] Tourism, scaling with the number of Followers of other [ICON_RELIGION] Religions in the City.[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Apostolic Palace National Wonder[ENDCOLOR] (+4 [ICON_PEACE] Faith, +4 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism for every 3 [ICON_CITIZEN] Citizens; +5 [ICON_TOURISM] Tourism from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_PILGRIMAGE';

-- sacred garden
INSERT INTO Building_BuildingClassYieldModifiers
	(BuildingType, BuildingClassType, YieldType, Modifier)
VALUES
	('BUILDING_SACRED_GARDEN', 'BUILDINGCLASS_GARDEN', 'YIELD_FOOD', 10);

UPDATE Language_en_US SET
Text = 'All Gardens provide +10% [ICON_FOOD] Growth in the City in which they are built.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_SACRED_GARDEN_HELP';

UPDATE Language_en_US
SET Text = 'When you enter a new Era, Holy City gains 12 of every Yield for each City following your [ICON_RELIGION] Religion (max 25 Cities), scaling with Era.[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Sacred Garden National Wonder[ENDCOLOR] (+3 [ICON_PEACE] Faith, +5 [ICON_CULTURE] Culture, +10% [ICON_FOOD] Growth from Gardens; +5 [ICON_FOOD] Food from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_INITIATION_RITES';

-- great altar has an effect

-- ossurary

INSERT INTO Building_YieldChangesFromPassingTR
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_GRAND_OSSUARY', 'YIELD_CULTURE', 5),
	('BUILDING_GRAND_OSSUARY', 'YIELD_TOURISM', 5),
	('BUILDING_GRAND_OSSUARY', 'YIELD_GOLD', 5);

UPDATE Language_en_US SET
Text = '+5 [ICON_GOLD] Gold, [ICON_CULTURE] Culture, and [ICON_TOURISM] Tourism is a [ICON_INTERNATIONAL_TRADE] Trade Route passes through the City.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_GRAND_OSSUARY_HELP';

UPDATE Language_en_US
SET Text = Replace(Text, '+10 [ICON_PEACE] Faith', '+10 [ICON_PEACE] Faith; [ICON_GOLD]/[ICON_CULTURE]/[ICON_TOURISM] Yields if a [ICON_INTERNATIONAL_TRADE] Trade Route passes the City')
WHERE Tag = 'TXT_KEY_BELIEF_WORLD_CHURCH';



