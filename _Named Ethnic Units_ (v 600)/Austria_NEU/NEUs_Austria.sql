-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Austria');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_AUSTRIA',		'GREAT_WAR_INFANTRY',	'ausgw1',						12),
('_AUSTRIA',		'TANK',					'Panzer_IV_Ausf_G',				3),
('_AUSTRIA',		'LONGSWORDSMAN',		'austria_longsw2',				12),
('_AUSTRIA',		'WARRIOR',				'AustriaWarrior',				12),
('_AUSTRIA',		'PARATROOPER',			'Paratrooper_German_v2',		10);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Austria';
