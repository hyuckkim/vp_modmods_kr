-- Tree structure
UPDATE Policies
SET GridX = 2, GridY = 1,
PortraitIndex = 53
WHERE Type = 'POLICY_SECULARISM';

UPDATE Policies
SET GridX = 3, GridY = 2
WHERE Type = 'POLICY_SOVEREIGNTY';

UPDATE Policies
SET GridX = 5, GridY = 1,
PortraitIndex = 49
WHERE Type = 'POLICY_HUMANISM';

UPDATE Policies
SET GridX = 1, GridY = 2,
PortraitIndex = 52
WHERE Type = 'POLICY_FREE_THOUGHT';

UPDATE Policies
SET GridX = 4, GridY = 3,
PortraitIndex = 51
WHERE Type = 'POLICY_SCIENTIFIC_REVOLUTION';

DELETE FROM Policy_PrereqPolicies WHERE PolicyType = 'POLICY_FREE_THOUGHT';

INSERT INTO Policy_PrereqPolicies
	(PolicyType, PrereqPolicy)
VALUES
	('POLICY_FREE_THOUGHT', 'POLICY_SECULARISM'),
	('POLICY_SCIENTIFIC_REVOLUTION', 'POLICY_HUMANISM');

-- Opener
UPDATE Policies SET 
GreatScientistRateModifier = 33,
CityGrowthMod = 10
WHERE Type = 'POLICY_RATIONALISM';

DELETE FROM Policy_ResourceYieldChanges WHERE PolicyType = 'POLICY_RATIONALISM';
DELETE FROM Policy_YieldModifiers WHERE PolicyType = 'POLICY_RATIONALISM';

INSERT INTO Policy_SpecialistYieldChanges
	(PolicyType, SpecialistType, YieldType, Yield)
VALUES
	('POLICY_RATIONALISM', 'SPECIALIST_SCIENTIST', 'YIELD_SCIENCE', 1),	
	('POLICY_RATIONALISM', 'SPECIALIST_SCIENTIST', 'YIELD_CULTURE', 1);

-- Secularism (now Liberalism)
DELETE FROM Policy_FeatureYieldChanges
WHERE PolicyType = 'POLICY_SECULARISM';

DELETE FROM Policy_TerrainYieldChanges
WHERE PolicyType = 'POLICY_SECULARISM';

INSERT INTO Policy_SpecialistExtraYields
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_SECULARISM', 'YIELD_PRODUCTION', 1),
	('POLICY_SECULARISM', 'YIELD_GOLD', 2);

INSERT INTO Policy_GoldenAgeGreatPersonRateModifier
	(PolicyType, GreatPersonType, Modifier)
SELECT
	'POLICY_SECULARISM', Type, 25
FROM GreatPersons
WHERE Specialist IS NOT NULL;

-- Observatory

UPDATE Buildings SET
	PolicyType = NULL
WHERE Type = 'BUILDING_OBSERVATORY';

UPDATE Language_en_US
SET Text = Replace(Text, '[NEWLINE][NEWLINE]Requires [COLOR_MAGENTA]{TXT_KEY_POLICY_SECULARISM}[ENDCOLOR] Policy.', '')
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_HELP';


-- Humanism (now Mass Education)
DELETE FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_HUMANISM';

INSERT INTO Policy_BuildingClassHappiness
	(PolicyType, BuildingClassType, Happiness)
VALUES
	('POLICY_HUMANISM', 'BUILDINGCLASS_PUBLIC_SCHOOL', 1);

INSERT INTO Policy_BuildingClassYieldChanges
	(PolicyType, BuildingClassType, YieldType, YieldChange)
VALUES
	('POLICY_HUMANISM', 'BUILDINGCLASS_PUBLIC_SCHOOL', 'YIELD_CULTURE', 2),
	('POLICY_HUMANISM', 'BUILDINGCLASS_PUBLIC_SCHOOL', 'YIELD_FOOD', 3);

INSERT INTO Policy_BuildingClassProductionModifiers
	(PolicyType, BuildingClassType, ProductionModifier)
VALUES
	('POLICY_HUMANISM', 'BUILDINGCLASS_PUBLIC_SCHOOL', 50);


-- Sovereignty (now Emancipation)
UPDATE Policies
SET
	DistressFlatReductionGlobal = 0,
	PovertyFlatReductionGlobal = 0,
	IlliteracyFlatReductionGlobal = 0,
	BoredomFlatReductionGlobal = 0,
	ReligiousUnrestFlatReductionGlobal = 0,
 	HappinessPerXPopulationGlobal = 8  -- bugged atm with progress, have to change that too!
WHERE Type = 'POLICY_SOVEREIGNTY';

-- placeholder
--INSERT INTO Policy_BuildingClassHappiness
--	(PolicyType, BuildingClassType, Happiness)
--VALUES
--	('POLICY_SOVEREIGNTY', 'BUILDINGCLASS_THEATRE', 1),
--	('POLICY_SOVEREIGNTY', 'BUILDINGCLASS_HOTEL', 1),
--	('POLICY_SOVEREIGNTY', 'BUILDINGCLASS_MUSEUM', 1);

DELETE FROM Policy_ImprovementYieldChanges WHERE PolicyType = 'POLICY_SOVEREIGNTY';

INSERT INTO Policy_YieldFromBirthRetroactive
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_SOVEREIGNTY', 'YIELD_CULTURE', 5),
	('POLICY_SOVEREIGNTY', 'YIELD_GOLDEN_AGE_POINTS', 5);

DELETE FROM Policy_GoldenAgeYieldMod WHERE PolicyType = 'POLICY_SOVEREIGNTY';

INSERT INTO Policy_GoldenAgeYieldMod
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_SOVEREIGNTY', 'YIELD_FOOD', 10),
	('POLICY_FREE_THOUGHT', 'YIELD_SCIENCE', 10);

-- Free Thought (now Secularism, unhelpful I know)
DELETE FROM Policy_ImprovementYieldChanges
WHERE PolicyType = 'POLICY_FREE_THOUGHT';

DELETE FROM Policy_BuildingClassYieldModifiers
WHERE PolicyType = 'POLICY_FREE_THOUGHT';

UPDATE Policies
SET
	GreatScientistRateModifier = 0,
	GreatScientistBeakerModifier = 0
WHERE Type = 'POLICY_FREE_THOUGHT';

INSERT INTO Policy_ImprovementYieldChanges
	(PolicyType, ImprovementType, YieldType, Yield)
VALUES
	('POLICY_FREE_THOUGHT', 'IMPROVEMENT_ACADEMY', 'YIELD_PRODUCTION', 3),
	('POLICY_FREE_THOUGHT', 'IMPROVEMENT_ACADEMY', 'YIELD_GOLD', 3);

-- this has too much synergy with artistry frankly, should be in Freedom
--INSERT INTO Policy_YieldModifierFromGreatWorks
--	(PolicyType, YieldType, Yield)
--VALUES
--	('POLICY_FREE_THOUGHT', 'YIELD_SCIENCE', 4);

-- Scientific Revolution (now Employment Law)
UPDATE Policies
SET
	CityGrowthMod = 0,
	HappinessToCulture = 50
	--,HappinessToScience = 50  -- this is actually 50% happiness if happy, but bugged
WHERE Type = 'POLICY_SCIENTIFIC_REVOLUTION';

INSERT INTO Policy_YieldFromNonSpecialistCitizens
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_SCIENTIFIC_REVOLUTION', 'YIELD_PRODUCTION', 100);
	
INSERT INTO Policy_SpecialistExtraYields
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_SCIENTIFIC_REVOLUTION', 'YIELD_PRODUCTION', 1);

DELETE FROM Policy_YieldModifierFromGreatWorks WHERE PolicyType = 'POLICY_SCIENTIFIC_REVOLUTION';

-- this is too antithetical to thickening a wide empire
--INSERT INTO Policy_BuildingClassYieldModifiers
--	(PolicyType, BuildingClassType, YieldType, Yield)
--SELECT
--	'POLICY_LEGALISM', Type, 4, 'YIELD_FOOD'
--FROM BuildingClasses
--WHERE MaxPlayerInstances = 1;

-- Finisher
UPDATE Policies
SET
	GreatScientistBeakerModifier = 25,
	DistressFlatReductionGlobal = 0,
	PovertyFlatReductionGlobal = 0,
	IlliteracyFlatReductionGlobal = 0,
	BoredomFlatReductionGlobal = 0,
	ReligiousUnrestFlatReductionGlobal = 0,
	SpySecurityModifier = 12
WHERE Type = 'POLICY_RATIONALISM_FINISHER';

-- Scaler
DELETE FROM Policy_YieldModifiers WHERE PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType = 'POLICY_BRANCH_RATIONALISM');

UPDATE Policies SET CityGrowthMod = 5 WHERE PolicyBranchType = 'POLICY_BRANCH_RATIONALISM';

--------------------
-- Rationalism
--------------------

-- Leader title change
UPDATE Language_en_US
SET Text = 'Chancellor {1_PlayerName:textkey} of {2_CivName:textkey}'
WHERE Tag = 'TXT_KEY_RATIONALISM_TITLE';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Rationalism[ENDCOLOR] unleashes a wave of new [ICON_CITIZEN] Citizens by providing large [ICON_HAPPINESS_1] Happiness and [ICON_FOOD] Food bonuses. Simultaneously boosts the output of the resulting [ICON_GOLDEN_AGE] Golden Ages and Specialists, especially [ICON_VP_SCIENTIST] Scientists.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting Rationalism grants:[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture from [ICON_VP_SCIENTIST] Scientists.[NEWLINE][ICON_BULLET]Earn [ICON_GREAT_SCIENTIST] Great Scientists 33% faster.[NEWLINE][ICON_BULLET]+10% [ICON_FOOD] Growth in all Cities.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Each Rationalism policy unlocked grants:[ENDCOLOR][NEWLINE][ICON_BULLET]+5% [ICON_FOOD] Growth in all Cities.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting all Policies in Rationalism grants:[ENDCOLOR][NEWLINE][ICON_BULLET]Unlocks building [COLOR_POSITIVE_TEXT]Bletchley Park[ENDCOLOR].[NEWLINE][ICON_BULLET]+25% Instant Yields from [ICON_GREAT_SCIENTIST] Great Scientists.[NEWLINE][ICON_BULLET]+12 [ICON_SPY] City Security in every City.[NEWLINE][ICON_BULLET]Allows for the purchase of [ICON_GREAT_SCIENTIST] Great Scientists with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_RATIONALISM_HELP';

UPDATE Language_en_US
SET Text = 'Liberalism'
WHERE Tag = 'TXT_KEY_POLICY_SECULARISM';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Liberalism[ENDCOLOR][NEWLINE][ICON_BULLET]+2 [ICON_GOLD] Gold and +1 [ICON_PRODUCTION] Production from Specialists.[NEWLINE][ICON_BULLET]+25% [ICON_GREAT_PEOPLE] Great Person Rate during [ICON_GOLDEN_AGE] Golden Ages.'
WHERE Tag = 'TXT_KEY_POLICY_SECULARISM_HELP';

UPDATE Language_en_US
SET Text = 'Philosopher John Locke is often credited with founding liberalism as a distinct tradition based on the social contract, arguing that each man has a natural right to life, liberty and property, and governments must not violate these rights. From the Glorious Revolution of 1688, through the American Revolution and French Revolutions of late 1700s, to the Tanzimat reform of the Ottoman empire beginning in 1839, liberal philosophy was used to justify the armed overthrow of royal sovereignty and the rise of consitutionalism.'
WHERE Tag = 'TXT_KEY_POLICY_SECULARISM_TEXT';

UPDATE Language_en_US
SET Text = 'Emancipation'
WHERE Tag = 'TXT_KEY_POLICY_SOVEREIGNTY';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Emancipation[ENDCOLOR][NEWLINE][ICON_BULLET]Receive an [COLOR_POSITIVE_TEXT]Instant Boost[ENDCOLOR] of 5 [ICON_CULTURE] Culture and [ICON_GOLDEN_AGE] Golden Age Points for every [ICON_CITIZEN] Citizen in the Empire, scaling with Era.[NEWLINE][ICON_BULLET]+10% [ICON_FOOD] Food during [ICON_GOLDEN_AGE] Golden Ages.[NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness for every 8 [ICON_CITIZEN] Citizens in a City.'
WHERE Tag = 'TXT_KEY_POLICY_SOVEREIGNTY_HELP';

-- +1 [ICON_HAPPINESS_1] Happiness from every Zoo, Hotel, and Museum.

UPDATE Language_en_US
SET Text = 'Although by the 1850s slavery in the British Empire had been banned for almost half a century, the vaunted bastion of liberal rationalism in America still only extended fundamental rights to white men of property. This was a contentious state of affairs and in 1861 a civil war erupted. It was in this context that President Abraham Lincoln issued an executive order, ''...That on the first day of January, in the year of our Lord, one thousand eight hundred and sixty-three, all persons held as slaves within any State or designated part of a State, the people whereof shall then be in rebellion against the United States, shall be then, thenceforward, and forever free...'''
WHERE Tag = 'TXT_KEY_POLICY_SOVEREIGNTY_TEXT';

UPDATE Language_en_US
SET Text = 'Mass Education'
WHERE Tag = 'TXT_KEY_POLICY_HUMANISM';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Mass Education[ENDCOLOR][NEWLINE][ICON_BULLET]Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Technology.[NEWLINE][ICON_BULLET]+50% [ICON_PRODUCTION] Production towards Public Schools.[NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness, +2 [ICON_CULTURE] Culture, and +3 [ICON_FOOD] Food from Public Schools.'
WHERE Tag = 'TXT_KEY_POLICY_HUMANISM_HELP';

UPDATE Language_en_US
SET Text = 'In Sparta boys between the age 6 and 7 left their homes and were sent to military school. Yet, by the 18th century, a minority of children attended school, and many for no more than three to four months out of the year. In 1763 Prussia implemented a modern compulsory education system, and the policy quickly spread across northern Europe, stopping at industrialist Britian, which felt threatened by an educated (and enfranchised) working class, and did not follow suit until 1870, in spite of much campaigning against child labour practices from liberals and the Church. Even then, provision only held up to the age of 12.'
WHERE Tag = 'TXT_KEY_POLICY_HUMANISM_TEXT';

UPDATE Language_en_US
SET Text = 'Secularism'
WHERE Tag = 'TXT_KEY_POLICY_FREE_THOUGHT';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Secularism[ENDCOLOR][NEWLINE][ICON_BULLET]-5 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest in all Cities.[NEWLINE][ICON_BULLET]+10% [ICON_RESEARCH] Science during [ICON_GOLDEN_AGE] Golden Ages.[NEWLINE][ICON_BULLET]+3 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Academies.'
WHERE Tag = 'TXT_KEY_POLICY_FREE_THOUGHT_HELP';

UPDATE Language_en_US
SET Text = 'Employment Law'
WHERE Tag = 'TXT_KEY_POLICY_SCIENTIFIC_REVOLUTION';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Employment Law[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_FOOD] Food and [ICON_PRODUCTION] Production for every [ICON_CITIZEN] Citizen.[NEWLINE][ICON_BULLET]50% of [ICON_HAPPINESS_1] Happiness in each City is converted into [ICON_CULTURE] Culture.'
WHERE Tag = 'TXT_KEY_POLICY_SCIENTIFIC_REVOLUTION_HELP';

UPDATE Language_en_US
SET Text = 'The Code of Hammurabi (c. 1755-1750 BC) stipulated a 2 shekel prevailing wage for each 60 gur (300 bushel) vessel constructed in an employment contract between a shipbuilder and a ship-owner. Since then, protections to trade have been a central part of jurisprudence. Sadly, one of the appalling consequences of the industrial revolution was a reversal of this norm and an almost unregulated economic framework that led to much misery and death. In Britain, a great milestone in labour law was reached with the Factories Act 1833, which limited the employment of children under eighteen years of age, prohibited all night work, and, crucially, provided for inspectors to enforce the law.'
WHERE Tag = 'TXT_KEY_POLICY_SCIENTIFICREVOLUTION_TEXT';
