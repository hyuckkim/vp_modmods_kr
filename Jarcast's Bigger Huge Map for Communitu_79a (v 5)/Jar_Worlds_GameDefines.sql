-- Communitu_79 Huge size: 97, 66
-- x1.25: 109x74
-- x1.5: 119x81
-- x2:  138x93
-- Giant Earth (17280 plots = x2.7): 160x108

UPDATE Defines SET Value = 9 WHERE Name = 'RELIGION_MAXIMUM_CAP';

UPDATE Worlds SET ReformationPercentRequired = 50, MaxActiveReligions = 9, 
DefaultPlayers=14,	DefaultMinorCivs=41, NumCitiesUnhappinessPercent = 50, TradeRouteDistanceMod= 180
WHERE Type = 'WORLDSIZE_HUGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'JAR_COMMUNITU_HUGER_MAPS' AND Value=1);

UPDATE Worlds SET ReformationPercentRequired = 50, MaxActiveReligions = 9,
DefaultPlayers=18,	DefaultMinorCivs=41, NumCitiesUnhappinessPercent = 45, TradeRouteDistanceMod= 200
WHERE Type = 'WORLDSIZE_HUGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'JAR_COMMUNITU_HUGER_MAPS' AND Value=2);

UPDATE Worlds SET ReformationPercentRequired = 40, MaxActiveReligions = 9,
MinDistanceCities = 4, MinDistanceCityStates =4,
DefaultPlayers=20,	DefaultMinorCivs=41, NumCitiesUnhappinessPercent = 40, TradeRouteDistanceMod= 220
WHERE Type = 'WORLDSIZE_HUGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'JAR_COMMUNITU_HUGER_MAPS' AND Value=3);

UPDATE Worlds SET ReformationPercentRequired = 40, MaxActiveReligions = 9,
MinDistanceCities = 4, MinDistanceCityStates =4,
DefaultPlayers=22,	DefaultMinorCivs=41, NumCitiesUnhappinessPercent = 35, TradeRouteDistanceMod= 250
WHERE Type = 'WORLDSIZE_HUGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'JAR_COMMUNITU_HUGER_MAPS' AND Value=4);

UPDATE Worlds SET MinDistanceCities = 3, MinDistanceCityStates =3
WHERE Type = 'WORLDSIZE_HUGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'JAR_COMMUNITU_HUGER_MAPS' AND Value=4)
AND EXISTS (SELECT * FROM Defines WHERE Name = 'MAX_MAJOR_CIVS' AND Value>29);

UPDATE Defines
SET Value = (SELECT MinDistanceCities FROM Worlds WHERE Type = 'WORLDSIZE_HUGE')
WHERE Name = 'MIN_CITY_RANGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'JAR_COMMUNITU_HUGER_MAPS' AND Value>1);
--==========================================================================================================================
-- Base game Beliefs: 9 Founder, 9 Enhancer, 9 Reformation
-- New Beliefs modmod: +3 Founder, +2 Enhancer, +2 Reformation
UPDATE Worlds SET MaxActiveReligions = 11
WHERE Type = 'WORLDSIZE_HUGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'JAR_COMMUNITU_HUGER_MAPS' AND Value>1)
AND EXISTS (SELECT * FROM Beliefs WHERE Type = 'BELIEF_GOD_OF_STORMS');
UPDATE Defines SET Value = 11 WHERE Name = 'RELIGION_MAXIMUM_CAP'
AND EXISTS (SELECT * FROM Beliefs WHERE Type = 'BELIEF_GOD_OF_STORMS');

CREATE TRIGGER VPNewBeliefsMod
AFTER INSERT ON Beliefs WHEN 'BELIEF_GOD_OF_STORMS' = NEW.Type
BEGIN
	UPDATE Worlds SET MaxActiveReligions = 11
	WHERE Type = 'WORLDSIZE_HUGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'JAR_COMMUNITU_HUGER_MAPS' AND Value>1);
	UPDATE Defines SET Value = 11 WHERE Name = 'RELIGION_MAXIMUM_CAP'
	AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'JAR_COMMUNITU_HUGER_MAPS' AND Value>1);
END;
--==========================================================================================================================
--==========================================================================================================================