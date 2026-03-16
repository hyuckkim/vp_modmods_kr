-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Venice');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_VENICE',			'CARRIER',				'Aquila_Class',					1),
('_VENICE',			'INFANTRY',				'Infantry_Italy',				12),
('_VENICE',			'IRONCLAD',				're_umberto_bb',				1),
('_VENICE',			'WWI_TANK',				'Fiat_3000',					2),
('_VENICE',			'GREAT_WAR_INFANTRY',	'hunrm1',						12),
('_VENICE',			'MODERN_ARMOR',			'Ariete',						3);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Venice';
