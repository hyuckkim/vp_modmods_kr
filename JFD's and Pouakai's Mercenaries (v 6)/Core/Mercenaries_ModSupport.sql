--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_MERCENARY_ARMY_HELP_CBP'
WHERE Type = 'POLICY_MARITIME_INFRASTRUCTURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_MERCENARIES_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_MERCENARIES_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ContractModifiers
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_JFD_ContractModifiers 
SET PolicyType = 'POLICY_MARITIME_INFRASTRUCTURE', CostModifier = -15
WHERE PolicyType = 'POLICY_TRADE_UNIONS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_MERCENARIES_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Technologies
SET GridX = 3, GridY = 5, Cost = 150
WHERE Type = 'TECH_JFD_MERCENARIES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_TECH_ADDITIONS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Technologies
SET GridY = 4
WHERE Type = 'TECH_MATHEMATICS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_TECH_ADDITIONS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Technologies
SET GridY = 6
WHERE Type = 'TECH_ENGINEERING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_COMMUNITY_BALANCE_PATCH' AND Value = 1);
-----------------------------------------------------------------------------------------------------		
-- Technology_PrereqTechs
-----------------------------------------------------------------------------------------------------	
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_JFD_MERCENARIES' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_COMMUNITY_BALANCE_PATCH' AND Value = 1);
INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_JFD_MERCENARIES', 		'TECH_HORSEBACK_RIDING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_TECH_ADDITIONS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_COMMUNITY_BALANCE_PATCH' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 						PrereqTech)
SELECT	'TECH_CURRENCY',				'TECH_JFD_MERCENARIES'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_TECH_ADDITIONS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
