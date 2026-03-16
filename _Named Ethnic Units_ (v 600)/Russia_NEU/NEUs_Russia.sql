-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Russia');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_RUSSIA',			'MARINE',				'RussianSF',					10),
('_RUSSIA',			'HELICOPTER_GUNSHIP',	'Mi8Russia',					1),
('_RUSSIA',			'RIFLEMAN',				'civ5_rusrm',					12),
('_RUSSIA',			'INFANTRY',				'Infantry_Russia',				12),
('_RUSSIA',			'TANK',					'T-34-85',						3),
('_RUSSIA',			'BOMBER',				'EAW_Tu-95',					1);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Russia';
