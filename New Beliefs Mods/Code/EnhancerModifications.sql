--change Orthodoxy to Ecumenism
UPDATE Beliefs SET SpreadDistanceModifier = 20 WHERE Type = 'BELIEF_HOLY_ORDER';
UPDATE Beliefs SET SpreadStrengthModifier = 20 WHERE Type = 'BELIEF_HOLY_ORDER';

UPDATE Beliefs SET PressureChangeTradeRoute = 0 WHERE Type = 'BELIEF_HOLY_ORDER';
UPDATE Beliefs SET FriendlyCityStateSpreadModifier = 0 WHERE Type = 'BELIEF_HOLY_ORDER';

INSERT INTO Belief_HolyCityYieldChanges
		(BeliefType, 			YieldType, 		Yield)
VALUES	('BELIEF_HOLY_ORDER', 	'YIELD_GOLD', 	5),
		('BELIEF_HOLY_ORDER', 	'YIELD_FAITH', 	5);
		
UPDATE Language_en_US
SET Text = '[ICON_RELIGION] Religion spreads 20% faster (50% with Printing Press), and to Cities 20% further away. Holy City gains +5 [ICON_PEACE] Faith and [ICON_GOLDEN_AGE] Golden Age Points.'
WHERE Tag = 'TXT_KEY_BELIEF_HOLY_ORDER';

UPDATE Language_en_US
SET Text = 'Ecumenism'
WHERE Tag = 'TXT_KEY_BELIEF_HOLY_ORDER_SHORT';
--Remove Policy Reduction from Prophecy
UPDATE Beliefs SET ReducePolicyRequirements = 0 WHERE Type = 'TXT_KEY_BELIEF_MESSIAH';

UPDATE Language_en_US
SET Text = 'Sainthood'
WHERE Tag = 'TXT_KEY_BELIEF_MESSIAH_SHORT';

UPDATE Language_en_US
SET Text = 'Prophets of this [ICON_RELIGION] Religion 25% stronger, cost 25% less [ICON_PEACE] Faith. +3 to base Holy Site yields. If this is the majority Religion, Follower reduction from rival [ICON_INQUISITOR] Inquisitors and [ICON_PROPHET] Prophets halved.'
WHERE Tag = 'TXT_KEY_BELIEF_MESSIAH';

--rework Symbolism
UPDATE Beliefs SET HappinessPerFollowingCity = 0.25 WHERE Type = 'BELIEF_ITINERANT_PREACHERS';
DELETE FROM Belief_HolyCityYieldChanges WHERE BeliefType = 'BELIEF_ITINERANT_PREACHERS';
DELETE FROM Belief_GreatPersonPoints WHERE BeliefType = 'BELIEF_ITINERANT_PREACHERS';

INSERT INTO Belief_GreatPersonPoints
		(BeliefType, 					GreatPersonType, 			Value)
VALUES	('BELIEF_ITINERANT_PREACHERS', 	'GREATPERSON_ARTIST', 		2),
		('BELIEF_ITINERANT_PREACHERS', 	'GREATPERSON_MUSICIAN', 	2),
		('BELIEF_ITINERANT_PREACHERS', 	'GREATPERSON_WRITER', 		2);

UPDATE Beliefs SET PolicyReductionWonderXFollowerCities = 8 WHERE Type = 'BELIEF_ITINERANT_PREACHERS';
UPDATE Beliefs SET CityScalerLimiter = 24 WHERE Type = 'BELIEF_ITINERANT_PREACHERS';

UPDATE Language_en_US
SET Text = 'Holy City gains +2 [ICON_GREAT_WORK] Great Artist, Musician, and Writer Points per turn. Reduce minimum Policy requirement for Wonders by 1 for every 8 Cities, and +1 [ICON_HAPPINESS_1] Happiness for every 4 Cities following this Religion (max 24 Cities).'
WHERE Tag = 'TXT_KEY_BELIEF_ITINERANT_PREACHERS';

--rebase Zealotry's unit purchase mechanic so it doesn't interfere with Nuncios

DELETE FROM Belief_EraFaithUnitPurchase WHERE BeliefType = 'BELIEF_HEATHEN_CONVERSION';

INSERT INTO Belief_SpecificFaithUnitPurchase
		(BeliefType, 					UnitType)
SELECT	'BELIEF_HEATHEN_CONVERSION', 	Type
FROM Units WHERE (RequiresFaithPurchaseEnabled = 1 AND Combat > 0 AND Domain = 'DOMAIN_LAND');

CREATE TRIGGER VP_NewUnitZealotryFaithPurchase_Add
AFTER INSERT ON Units 
WHEN (NEW.RequiresFaithPurchaseEnabled = 1 AND NEW.Combat > 0 AND NEW.Domain = 'DOMAIN_LAND')
BEGIN
    INSERT INTO Belief_SpecificFaithUnitPurchase (BeliefType, UnitType) VALUES ('BELIEF_HEATHEN_CONVERSION', NEW.Type);
END;
