-- hero of the people. slightly weak

INSERT INTO Policy_YieldGPExpend
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_HERO_OF_THE_PEOPLE', 'YIELD_GREAT_GENERAL_POINTS', 40);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Hero of the People[ENDCOLOR]: [ICON_GREAT_PEOPLE] Great Person rate increases by 25%. A [ICON_GREAT_PEOPLE] Great Person of your choice appears near your [ICON_CAPITAL] Capital. Gain 40 [ICON_GREAT_GENERAL] Great General Points when you expend a [ICON_GREAT_PEOPLE] Great Person, scaling with Era.'
WHERE Tag = 'TXT_KEY_POLICY_HERO_OF_THE_PEOPLE_HELP';

-- communism. bit weird wonder bonus. we are also missing culture victory options in T1

UPDATE Policies
SET
	BuildingPurchaseCostModifier = -25,
	WonderProductionModifier = 0
WHERE Type = 'POLICY_SKYSCRAPERS';

INSERT INTO Policy_YieldFromNonSpecialistCitizens
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_SKYSCRAPERS', 'YIELD_TOURISM', 25);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Communism[ENDCOLOR]: -25% [ICON_INVEST] Gold needed to invest in Buildings. Courthouses provide +10 [ICON_TOURISM] Tourism. Cities produce +1 [ICON_TOURISM] Tourism for every 4 non-Specialist [ICON_CITIZEN] Citizens.'
WHERE Tag = 'TXT_KEY_POLICY_SKYSCRAPERS_HELP';

-- this had wikipedia [3][4] references in lol
UPDATE Language_en_US
SET Text = 'Communism is a socioeconomic system structured upon common ownership of the means of production and characterized by the absence of social classes, money, and the state; as well as a social, political and economic ideology and movement that aims to establish this social order. The movement to develop communism, in its Marxist–Leninist interpretations, significantly influenced the history of the 20th century, which saw intense rivalry between the states which claimed to follow this ideology and their enemies.'
WHERE Tag = 'TXT_KEY_POLICY_SKYSCRAPERS_TEXT';

-- workers faculties. more tourism options please

INSERT INTO Policy_BuildingClassYieldModifiers
	(PolicyType, BuildingClassType, YieldType, YieldMod)
VALUES
	('POLICY_WORKERS_FACULTIES', 'BUILDINGCLASS_FACTORY', 'YIELD_TOURISM', 10);

UPDATE Policy_BuildingClassYieldModifiers
SET YieldMod = 5
WHERE PolicyType = 'POLICY_WORKERS_FACULTIES';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Worker Faculties[ENDCOLOR]: Factories increase City [ICON_RESEARCH] Science and [ICON_TOURISM] Tourism output by 5%. +100% [ICON_PRODUCTION] Production towards Factories, and receive 5 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Factories in your Empire.'
WHERE Tag = 'TXT_KEY_POLICY_WORKERS_FACULTIES_HELP';

-- resettlement. repeat harmony change and buff

UPDATE Policies
SET
	NewCityExtraPopulation = 6,
	FreePopulation = 0
WHERE Type = 'POLICY_RESETTLEMENT';

INSERT INTO Policy_YieldChangeTradeRoute
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_RESETTLEMENT', 'YIELD_FOOD', 10);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Resettlement[ENDCOLOR]: New Cities have +6 [ICON_CITIZEN] Population. No Partisans from [ICON_RAZING] Razing enemy Cities. [ICON_CONNECTED] City connections generate +10 [ICON_FOOD] Food.'
WHERE Tag = 'TXT_KEY_POLICY_RESETTLEMENT_HELP';

-- great leap forward. renamed atomic spies. move yield from non-specialist and replace with free atomic bomb

DELETE FROM Policy_YieldFromNonSpecialistCitizens WHERE PolicyType='POLICY_YOUNG_PIONEERS';

INSERT INTO Policy_UnitClassProductionModifiers
	(PolicyType, UnitClassType, ProductionModifier)
VALUES
	('POLICY_YOUNG_PIONEERS', 'UNITCLASS_ATOMIC_BOMB', 100);

UPDATE Language_en_US
SET Text = 'Atomic Spies'
WHERE Tag = 'TXT_KEY_POLICY_YOUNG_PIONEERS';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Atomic Spies[ENDCOLOR]: Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Technology. Spies [COLOR_POSITIVE_TEXT]siphon[ENDCOLOR] +100% more [ICON_RESEARCH] Science. +100% [ICON_PRODUCTION] Production towards [COLOR_YELLOW]Atomic Bombs[ENDCOLOR]. '
WHERE Tag = 'TXT_KEY_POLICY_YOUNG_PIONEERS_HELP';

UPDATE Language_en_US
SET Text = 'Atomic spies were people in the United States, the United Kingdom, and Canada who are known to have illicitly given information about nuclear weapons production or design to the Soviet Union during World War II and the early Cold War. At the time, numerous nuclear scientists wanted to share the information with the world scientific community, but this proposal was firmly quashed by the United States government. Atomic spies were motivated by a range of factors. Some, such as ideology or a belief in communism, were committed to advancing the interests of the Soviet Union. Others were motivated by financial gain, while some may have been coerced or blackmailed into spying. Confirmation about espionage work came from the Venona project, which intercepted and decrypted Soviet intelligence reports sent during and after World War II. With all the stolen information, Soviet nuclear ability was advanced by several years at the very least.'
WHERE Tag = 'TXT_KEY_POLICY_YOUNG_PIONEERS_TEXT';

-- nationalization office yield super low

UPDATE Policy_BuildingClassYieldChanges SET
YieldChange = 4
WHERE PolicyType = 'POLICY_NATIONALIZATION';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Nationalization[ENDCOLOR]: Each [ICON_VP_OFFICE] Corporate Office counts as a Franchise. Foreign Franchises no longer benefit your Corporation, you can no longer construct [ICON_VP_FRANCHISE] Franchises in foreign Cities (except Vassals) and vice versa. +4 [ICON_RESEARCH] Science from all Corporation Offices.'
WHERE Tag = 'TXT_KEY_POLICY_NATIONALIZATION_HELP';

-- cultural revolution.  This is one of those lame ones
-- add yield from non-specialist and add culture to it

UPDATE Policies SET
SharedIdeologyTourismModifier = 25,
LessHappyTourismModifier = 0
WHERE Type = 'POLICY_DICTATORSHIP_PROLETARIAT';

INSERT INTO Policy_YieldFromNonSpecialistCitizens
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_DICTATORSHIP_PROLETARIAT', 'YIELD_CULTURE', 25),
	('POLICY_DICTATORSHIP_PROLETARIAT', 'YIELD_SCIENCE', 25);

-- bit of great leap forward flavor
-- wide happiness already exists in public school tenet, go for a bit different
UPDATE Policy_BuildingClassHappiness SET 
BuildingClassType = 'BUILDINGCLASS_COAL_PLANT',
Happiness = 5
WHERE PolicyType = 'POLICY_DICTATORSHIP_PROLETARIAT';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Cultural Revolution[ENDCOLOR]: +5 [ICON_HAPPINESS_1] Happiness from Refineries. Gain +25% [ICON_TOURISM] Tourism to other Civilizations following [COLOR_MAGENTA]Order[ENDCOLOR]. Cities produce +1 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture for every 4 non-Specialist [ICON_CITIZEN] Citizens.'
WHERE Tag = 'TXT_KEY_POLICY_DICTATORSHIP_PROLETARIAT_HELP';

-- academy of sciences. remove weird tiny bonus, replace with connection yields

INSERT INTO Policy_YieldChangeTradeRoute
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_ACADEMY_SCIENCES', 'YIELD_SCIENCE', 6);

DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_ACADEMY_SCIENCES';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Academy of Sciences[ENDCOLOR]: -2 [ICON_HAPPINESS_3] Unhappiness from [ICON_RESEARCH] Illiteracy in all Cities. +100% [ICON_PRODUCTION] Production towards Research Labs, and receive 5 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Research Labs in your Empire. [ICON_CONNECTED] City connections provide +6 [ICON_RESEARCH] Science.'
WHERE Tag = 'TXT_KEY_POLICY_ACADEMY_SCIENCES_HELP';

-- dictatorship of prollys. increase to +8 because its a bit weak for t2 and 8 is lucky number. add tourism

UPDATE Policy_CityYieldChanges
SET Yield = 8
WHERE PolicyType = 'POLICY_PARTY_LEADERSHIP';

INSERT INTO Policy_CityYieldChanges
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_PARTY_LEADERSHIP', 'YIELD_TOURISM', 8);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Dictatorship of the Proletariat[ENDCOLOR]: +8 [ICON_FOOD] Food, [ICON_RESEARCH] Science, [ICON_GOLD] Gold, [ICON_CULTURE] Culture, and [ICON_TOURISM] Tourism per City.'
WHERE Tag = 'TXT_KEY_POLICY_PARTY_LEADERSHIP_HELP';

-- iron curtain. change +5/+5 to +5 to all yields

DELETE FROM Policy_YieldChangeTradeRoute WHERE PolicyType='POLICY_IRON_CURTAIN';

INSERT INTO Policy_YieldChangeTradeRoute
	(PolicyType, YieldType, Yield)
SELECT
	'POLICY_IRON_CURTAIN', Type, 5
FROM Yields WHERE ID < 6;

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Iron Curtain[ENDCOLOR]: [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Courthouse upon immediate City [ICON_OCCUPIED] Annexation. +200% [ICON_FOOD] Food or [ICON_PRODUCTION] Production from Internal Trade Routes. [ICON_CONNECTED] City connections provide +5 to [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_POLICY_IRON_CURTAIN_HELP';

-- social realism. want to move the tourism bonus to freedom, nothing inherently wrong. will use new tourism scaler reduction for wide. very sexy.

UPDATE Policy_GreatWorkYieldChanges SET Yield = 8 WHERE PolicyType = 'POLICY_CULTURAL_REVOLUTION';

UPDATE Policies
SET
	SharedIdeologyTourismModifier = 0,
	TourismCostXCitiesMod = 3
-- note the sign convention is flipped compared to the other use of this... woops!
WHERE Type = 'POLICY_CULTURAL_REVOLUTION';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Socialist Realism[ENDCOLOR]: Unlocks the [COLOR_CYAN]Propaganda[ENDCOLOR] Process (converts 15% of [ICON_PRODUCTION] Production into [ICON_TOURISM] Tourism). Each City increases the [ICON_TOURISM] penalty by a flat [COLOR_POSITIVE_TEXT]3% less[ENDCOLOR] than before. +8 [ICON_PRODUCTION] Production from all [ICON_GREAT_WORK] Great Works.'
WHERE Tag = 'TXT_KEY_POLICY_CULTURAL_REVOLUTION_HELP';

-- spaceflight pioneers. GP focus is odd for order

DELETE FROM Policy_FreeUnitClasses WHERE PolicyType = 'POLICY_SPACEFLIGHT_PIONEERS';
DELETE FROM Policy_YieldGPExpend WHERE PolicyType = 'POLICY_SPACEFLIGHT_PIONEERS';

INSERT INTO Policy_BuildingClassProductionModifiers
	(PolicyType, BuildingClassType, ProductionModifier)
SELECT
	'POLICY_SPACEFLIGHT_PIONEERS', BuildingClass, 100
FROM Buildings WHERE MutuallyExclusiveGroup = 1;

-- big wide, very nice. 3% seemed too strong in my test
UPDATE Policies SET
	TechCostXCitiesMod = -2
WHERE Type = 'SPACEFLIGHT_PIONEERS';

UPDATE Language_en_US
SET Text = 'Megaprojects'
WHERE Tag = 'TXT_KEY_POLICY_SPACEFLIGHT_PIONEERS';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Megaprojects[ENDCOLOR]: [ICON_GREAT_ENGINEER] Great Engineers grant +50% Instant Yields, and they may now hurry [COLOR_YELLOW]Spaceship Parts[ENDCOLOR]. +100% [ICON_PRODUCTION] Production towards [COLOR_POSITIVE_TEXT]Power Plants[ENDCOLOR]. Each City increases the cost of [COLOR_CYAN]Technologies[ENDCOLOR] by a flat [COLOR_POSITIVE_TEXT]2% less[ENDCOLOR] than before.'
WHERE Tag = 'TXT_KEY_POLICY_SPACEFLIGHT_PIONEERS_HELP';

UPDATE Language_en_US
SET Text = 'A megaproject is an extremely large-scale construction and investment project. In the 1950s Joseph Stalin initiated a series of so called Great Construction Projects to build hydroelectric dams and canals across the the Soviet Union. Beijing followed a more urbanism-focussed initiative later that decade with the Ten Great Buildings of the Great Leap Forward. Since then the term has usually be used to refer to larger power plants, bridges, or other infrastructure, but it has also found use when describing massive-scale scientific investment such as the sequencing of the human genome, or the construction of space rockets.'
WHERE Tag = 'TXT_KEY_POLICY_SPACEFLIGHT_PIONEERS_TEXT';

-- just text changes
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Double Agents[ENDCOLOR]: Receive 200 [ICON_VP_SPY_POINTS] Spy Points. Gain 125 [ICON_RESEARCH] Science when you identify a foreign [ICON_SPY] Spy, scaling with Era.'
WHERE Tag = 'TXT_KEY_POLICY_DOUBLE_AGENTS_HELP';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Peace, Land, Bread[ENDCOLOR]: -2 [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty. +20% [ICON_FOOD] Growth in all Cities. Building [ICON_GOLD] Gold Maintenance reduced by 20%.'
WHERE Tag = 'TXT_KEY_POLICY_UNIVERSAL_HEALTHCARE_O_HELP';


