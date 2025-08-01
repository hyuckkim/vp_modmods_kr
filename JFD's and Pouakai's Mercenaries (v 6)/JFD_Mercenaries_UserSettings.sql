--==========================================================================================================================	
-- USER SETTINGS
--==========================================================================================================================	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*
Allows support for various third-party mods. 
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,												Value)
VALUES	('JFD_MERCENARIES_COMMUNITY_BALANCE_PATCH',			0); -- Community Balance Patch

UPDATE JFD_GlobalUserSettings
SET Value = 1
WHERE Type = 'JFD_MERCENARIES_COMMUNITY_BALANCE_PATCH'
AND EXISTS (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WELL');
--==========================================================================================================================	
-- MERCENARIES
--==========================================================================================================================	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*CORE SETTINGS
---------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,												Value)
VALUES	('JFD_RTP_MERCENARIES_CORE_AI_CAP',					3), -- Number of concurrent Contracts the AI is allowed to take out.
		('JFD_RTP_MERCENARIES_NO_AI_MAINTENANCE',			1), -- AI won't pay maintenance for their Contracts (to compensate for their general lack of brains).
		('JFD_MERCENARIES_NO_AI_MAINTENANCE',				1), -- AI won't pay maintenance for their Contracts (to compensate for their general lack of frugality).
		('JFD_MERCENARIES_NO_GOLD_PURCHASING',				0), -- Removes rush-buying of units with Gold. Only Mercenaries may be purchased for Gold.
		('JFD_MERCENARIES_POLICY_CHANGES',					1), -- Mercenary Army makes contracts cheaper.
		('JFD_MERCENARIES_TECH_ADDITIONS',					1), -- Adds Mercenaries tech to Classical Era (unlocks Merc. Contracts, Gaesatae, and Jiayuguan Fort)
		('JFD_MERCENARIES_WONDER_CHANGES',					1), -- Adds Jiayuguan Fort at Mercenary Contracts/Construction.
		('JFD_MERCENARIES_UNITS_ADDITIONS_BLACK_RIDERS',	1), -- Adds the Black Rider at Metallurgy.
		('JFD_MERCENARIES_UNITS_ADDITIONS_VARANGIAN',		1), -- Adds the Varangian Guard at Iron Working.
		('JFD_MERCENARIES_UNITS_CHANGES_PRIVATEER',			1); -- Turns the Privateer (and uniques) into a Mercenary Contract-only unit.
--------------------------------------------------------------------------
/*MERCENARIES
---------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,									Value)
VALUES	('JFD_MERCENARIES_RELIGIOUS',			1); -- Allows for Piety-costing Contracts (note: Requires JFD's Piety to be active).
--==========================================================================================================================	
-- DO NOT MODIFY
--==========================================================================================================================
--JFD_GlobalUserSettings
--------------------------
--CBP
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_MERCENARIES_UNITS_CHANGES_PRIVATEER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================	
--==========================================================================================================================	