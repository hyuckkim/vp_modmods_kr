-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_America');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_BRAZIL',			'FIGHTER',				'P40Brazil',					2),
('_BRAZIL',			'MUSKETMAN',			'BrazilPretosForros',			12),
('_BRAZIL',			'WWI_TANK',				'RenaultFTBrazil',				2),
('_BRAZIL',			'PRIVATEER',			'Canhoneira',					1),
('_BRAZIL',			'RIFLEMAN',				'Brazilian_Rifleman',			12),
('_BRAZIL',			'ARTILLERY',			'77cmFk',						2);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Brazil';
