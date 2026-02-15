-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Ethiopia');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_ETHIOPIA',		'ARCHER',				'EthiopiaArcher',				12),
('_ETHIOPIA',		'PIKEMAN',				'EthiopianPikeman',				12),
('_ETHIOPIA',		'SCOUT',				'EthiopianScout',				6),
('_ETHIOPIA',		'MODERN_ARMOR',			'T55Ethiopia',					3),
('_ETHIOPIA',		'HORSEMAN',				'EthiopiaMedHorseman',			5),
('_ETHIOPIA',		'CROSSBOWMAN',			'EthiopiaCrossbow',				12),
('_ETHIOPIA',		'TRIPLANE',				'Spowith_Camel',				3);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Ethiopia';
