-- make holy sites a faith-based tile only. add other yields to fealty
DELETE FROM Improvement_Yields
WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE';

INSERT INTO Improvement_Yields
	(ImprovementType, YieldType, Yield)
VALUES
	('IMPROVEMENT_HOLY_SITE', 'YIELD_FAITH', 6);

DELETE FROM Improvement_TechYieldChanges
WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE';

INSERT INTO Improvement_TechYieldChanges
	(ImprovementType, TechType, YieldType, Yield)
VALUES	
	('IMPROVEMENT_HOLY_SITE', 'TECH_THEOLOGY', 'YIELD_FAITH', 3),
	('IMPROVEMENT_HOLY_SITE', 'TECH_ACOUSTICS', 'YIELD_FAITH', 3),
	('IMPROVEMENT_HOLY_SITE', 'TECH_ARCHAEOLOGY', 'YIELD_FAITH', 3),
	('IMPROVEMENT_HOLY_SITE', 'TECH_FLIGHT', 'YIELD_FAITH', 3);

DELETE FROM Belief_ImprovementYieldChanges
WHERE BeliefType = 'BELIEF_MESSIAH';

INSERT INTO Belief_ImprovementYieldChanges
	(BeliefType, ImprovementType, YieldType, Yield)
SELECT
	'BELIEF_MESSIAH', 'IMPROVEMENT_HOLY_SITE', a.type, 3
FROM Yields a WHERE a.Type in ('YIELD_FAITH', 'YIELD_CULTURE', 'YIELD_TOURISM');

UPDATE Language_en_US
SET Text = 'Reduces minimum Policy requirement for Wonders by 1. Prophets of this [ICON_RELIGION] Religion 25% stronger, cost 25% less [ICON_PEACE] Faith. +3 [ICON_PEACE] Faith, [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism from Holy Sites. If this is the majority Religion, Follower reduction from rival [ICON_INQUISITOR] Inquisitors and [ICON_PROPHET] Prophets is halved.'
WHERE Tag = 'TXT_KEY_BELIEF_MESSIAH';


UPDATE Policies
SET FaithCostModifier = 0
WHERE Type = 'POLICY_PIETY';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Fealty[ENDCOLOR] enhances your ability to defend and leverage your [ICON_RELIGION] Majority Religion.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting Fealty grants:[ENDCOLOR][NEWLINE][ICON_BULLET]Can purchase Monasteries with [ICON_PEACE] Faith (+3 [ICON_FOOD] Food, +3 [ICON_RESEARCH] Science, +2 [ICON_PEACE] Faith, converts 10% of [ICON_PEACE] Faith Purchase into [ICON_GOLD]).[NEWLINE][ICON_BULLET]-25% [ICON_PEACE] Faith costs for purchasing Buildings, Missionaries, and Inquisitors.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Each Fealty policy unlocked grants:[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PEACE] Faith and [ICON_STRENGTH] Strength in every City.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting all Policies in Fealty grants:[ENDCOLOR][NEWLINE][ICON_BULLET]Unlocks building the [COLOR_POSITIVE_TEXT]Red Fort[ENDCOLOR].[NEWLINE][ICON_BULLET]+25% [ICON_TOURISM] Tourism modifier for [COLOR_POSITIVE_TEXT]Shared Religion[ENDCOLOR].[NEWLINE][ICON_BULLET]Cities that follow your [ICON_RELIGION] Majority Religion generate +3 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, [ICON_SCIENCE] Science, and [ICON_CULTURE] Culture.[NEWLINE][ICON_BULLET]Allows for the purchase of [ICON_GREAT_ARTIST] Great Artists with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PIETY_HELP';

-- Monastery

INSERT INTO Building_YieldFromFaithPurchase
			(BuildingType,			YieldType,			Yield) 
VALUES		('BUILDING_MONASTERY',	'YIELD_GOLD',		10);

UPDATE Language_en_US
SET Text = 'Religious building purchased with [ICON_PEACE] Faith. Converts 10% of [ICON_PEACE] Faith Purchase into [ICON_GOLD]. [NEWLINE][NEWLINE]Requires the adoption of the [COLOR_MAGENTA]{TXT_KEY_POLICY_BRANCH_PIETY}[ENDCOLOR] Policy Branch.'
WHERE Tag = 'TXT_KEY_BUILDING_MONASTERY_HELP';

UPDATE Language_en_US
SET Text = 'Monasteries increase [ICON_PEACE] Faith, [ICON_FOOD] Food, and [ICON_RESEARCH] Science output. They also convert Faith purchases into Gold, increasing the value of Faith. Can only be built if you have adopted the Fealty Policy Branch. Construct this building by purchasing it with [ICON_PEACE] Faith.'
WHERE Tag = 'TXT_KEY_BUILDING_MONASTERY_STRATEGY';

-- organized religion changes
UPDATE Policies
SET
	VotesPerFollowingCityTimes100 = 0
WHERE Type = 'POLICY_ORGANIZED_RELIGION';

INSERT INTO Policy_SpecialistExtraYields
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_ORGANIZED_RELIGION', 'YIELD_FAITH', 1);

DELETE FROM Policy_BuildingClassYieldChanges
WHERE PolicyType = 'POLICY_ORGANIZED_RELIGION';

--INSERT INTO Policy_BuildingClassYieldModifiers
--	(PolicyType, BuildingClassType, YieldType, YieldMod)
--VALUES
--	('POLICY_ORGANIZED_RELIGION', 'BUILDINGCLASS_GRAND_TEMPLE', 'YIELD_FAITH', 20);

INSERT INTO Policy_ImprovementYieldChanges
	(PolicyType, ImprovementType, YieldType, Yield)
VALUES
	('POLICY_ORGANIZED_RELIGION', 'IMPROVEMENT_HOLY_SITE', 'YIELD_CULTURE', 5),
	('POLICY_ORGANIZED_RELIGION', 'IMPROVEMENT_HOLY_SITE', 'YIELD_TOURISM', 5);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Organized Religion[ENDCOLOR][NEWLINE][ICON_BULLET]25% Pressure from owned Cities following your [ICON_RELIGION] Primary Religion.[NEWLINE][ICON_BULLET]+1 [ICON_PEACE] Faith from Specialists.[NEWLINE][ICON_BULLET]+5 [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism from Holy Sites.'
WHERE Tag = 'TXT_KEY_POLICY_ORGANIZED_RELIGION_HELP';

-- name swap

UPDATE Policies
SET
	PortraitIndex = 47
WHERE Type = 'POLICY_THEOCRACY';

UPDATE Language_en_US
SET Text = 'Fiefdoms'
WHERE Tag = 'TXT_KEY_POLICY_THEOCRACY';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Fiefdoms[ENDCOLOR][NEWLINE][ICON_BULLET]+33% Yields from Internal [ICON_INTERNATIONAL_TRADE] Trade Routes.[NEWLINE][ICON_BULLET]Completing an Internal [ICON_INTERNATIONAL_TRADE] Trade Route triggers a Historic Event as if completing an International [ICON_INTERNATIONAL_TRADE] Trade Route.[NEWLINE][ICON_BULLET]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom in all Cities.'
WHERE Tag = 'TXT_KEY_POLICY_THEOCRACY_HELP';

UPDATE Language_en_US
SET Text = 'A fief is a heritable right to property or income source granted by a king to a lesser noble in return for vows of fealty. A fief usually took the form of revenue-producing lands which the noble could levy taxes from, in which case the estate was called a Fiefdom, but it could also take other forms, such as a trade monopoly or resource rights, like mining. These fiefs were central to the Medieval feudal system, and allowed kings to bind knights to their service without the need for the large bureaucracies and costs of a standing army; it was up to knights to sustain their own livelihoods once they had been given the means to do so.'
WHERE Tag = 'TXT_KEY_POLICY_THEOCRACY_TEXT';

UPDATE Policies
SET
	PortraitIndex = 45
WHERE Type = 'POLICY_REFORMATION';

UPDATE Language_en_US
SET Text = 'Divine Right'
WHERE Tag = 'TXT_KEY_POLICY_REFORMATION';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Divine Right[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness for every 10 Military Units in Empire.[NEWLINE][ICON_BULLET]+15% [ICON_PRODUCTION] Production and +100% [ICON_CULTURE_LOCAL] Border Growth during "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]."'
WHERE Tag = 'TXT_KEY_POLICY_REFORMATION_HELP';

UPDATE Language_en_US
SET Text = 'The divine right of kings, or divine-right theory of kingship, is a political and religious doctrine of royal and political legitimacy. It asserts that a monarch is subject to no earthly authority, deriving the right to rule directly from the will of God. The king is thus not subject to the will of his people, the aristocracy, or any other estate of the realm, including (in the view of some, especially in Protestant countries) the Church. According to this doctrine, only God can judge an unjust king. The doctrine implies that any attempt to depose the king or to restrict his powers runs contrary to the will of God and may constitute a sacrilegious act. It is often expressed in the phrase "by the Grace of God," attached to the titles of a reigning monarch.'
WHERE Tag = 'TXT_KEY_POLICY_REFORMATION_TEXT';

