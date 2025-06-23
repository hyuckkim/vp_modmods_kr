--==========================================================================================================================
-- RELIGIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
--RTP_Religions
CREATE TRIGGER RTP_Religions
AFTER INSERT ON Religions 
BEGIN
	UPDATE Religions
	SET Adjective = Description || '_ADJ'
	WHERE Type = NEW.Type;
END;

--==========================================================================================================================		
-- BUILDING CLASSES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_ReligiousBuildings
CREATE TRIGGER JFD_Sovereignty_ReligiousBuildings
AFTER INSERT ON BuildingClasses
WHEN NEW.DefaultBuilding IN (SELECT Type FROM Buildings WHERE Cost = -1 AND FaithCost > 0 AND UnlockedByBelief = 1)
BEGIN
	INSERT INTO Policy_BuildingClassCultureChanges
			(PolicyType,								BuildingClassType,	CultureChange)
	VALUES	('POLICY_REFORM_JFD_CHURCH_CULTURAL',		NEW.Type,			2);

	INSERT INTO Policy_BuildingClassYieldChanges
			(PolicyType,								BuildingClassType,	YieldType,			YieldChange)
	VALUES	('POLICY_REFORM_JFD_CHURCH_CULTURAL',		NEW.Type,			'YIELD_FAITH',		-2),
			('POLICY_REFORM_JFD_CHURCH_NATIONAL',		NEW.Type,			'YIELD_FAITH',		-2);

	INSERT INTO Policy_BuildingClassHappiness
			(PolicyType,								BuildingClassType,	Happiness)
	VALUES	('POLICY_REFORM_JFD_CHURCH_NATIONAL',		NEW.Type,			1);
END;

--==========================================================================================================================		
-- ERAS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_Eras
CREATE TRIGGER JFD_Sovereignty_Eras
AFTER INSERT ON Eras
WHEN NEW.Type = 'ERA_ENLIGHTENMENT'
BEGIN
	UPDATE JFD_Reforms
	SET PrereqEra = 'ERA_ENLIGHTENMENT'
	WHERE Type IN ('REFORM_JFD_EXECUTIVE_CONSTITUTIONAL', 
                    'REFORM_JFD_EXECUTIVE_ABSOLUTE', 
                    'REFORM_JFD_SUFFRAGE_LANDED', 
                    'REFORM_JFD_SUFFRAGE_UNIVERSAL',
                    'REFORM_JFD_JUDICIARY_DEPENDENT',
                    'REFORM_JFD_JUDICIARY_INDEPENDENT', 
                    'REFORM_JFD_REPRESENTATIVES_PERMANENT', 
                    'REFORM_JFD_PRECEDENCE_POWER', 
                    'REFORM_JFD_PRECEDENCE_RANK', 
                    'REFORM_JFD_REPRESENTATIVES_TRANSIENT', 
                    'REFORM_JFD_TRADE_FAIR', 
                    'REFORM_JFD_TRADE_FREE', 
                    'REFORM_JFD_SCHOOLING_MERITED', 
                    'REFORM_JFD_SCHOOLING_UNIVERSAL', 
                    'REFORM_JFD_MANUFACTURING_CRAFTED', 
                    'REFORM_JFD_MANUFACTURING_MECHANICAL', 
                    'REFORM_JFD_RECRUITMENT_PROFESSIONAL', 
                    'REFORM_JFD_RECRUITMENT_IRREGULAR', 
                    'REFORM_JFD_COMMAND_COMMISSION', 
                    'REFORM_JFD_COMMAND_MERIT', 
                    'REFORM_JFD_SEPARATION_LEGAL', 
                    'REFORM_JFD_SEPARATION_SOCIAL', 
                    'REFORM_JFD_PUBLICATIONS_PROPAGANDA', 
                    'REFORM_JFD_PUBLICATIONS_FREE', 
                    'REFORM_JFD_LANGUAGE_PURE', 
                    'REFORM_JFD_LANGUAGE_ADAPTED', 
                    'REFORM_JFD_EQUALITY_OUTCOMES', 
                    'REFORM_JFD_EQUALITY_OPPORTUNITIES')
	AND EXISTS (SELECT Type FROM Eras WHERE Type = 'ERA_ENLIGHTENMENT');
END;