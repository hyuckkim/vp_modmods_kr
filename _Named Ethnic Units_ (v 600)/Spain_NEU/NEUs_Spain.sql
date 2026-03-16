-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Spain');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_SPAIN',			'RIFLEMAN',				'civ5_sparm1',					12),
('_SPAIN',			'KNIGHT',				'Knight_Spain',					5),
('_SPAIN',			'PIKEMAN',				'Pikeman_Spain',				12),
('_SPAIN',			'WARRIOR',				'Caetrati',						12),
('_SPAIN',			'PARATROOPER',			'Paratrooper_Spain',			10),
('_SPAIN',			'INFANTRY',				'Infantry_Spain',				12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Spain';
