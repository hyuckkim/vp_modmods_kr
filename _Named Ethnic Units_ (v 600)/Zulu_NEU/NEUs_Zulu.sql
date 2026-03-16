-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Zulu');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_ZULU',			'WARRIOR',				'impi_1',						12),
('_ZULU',			'SWORDSMAN',			'NubianSwordsman',				12),
('_ZULU',			'SPEARMAN',				'BantuSpearman',				12),
('_ZULU',			'INFANTRY',				'AfricanInfantry',				12),
('_ZULU',			'MARINE',				'Civ5_AfricanSF_v2',			10),
('_ZULU',			'SCOUT',				'AfrScout',						12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Zulu';
