-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Indonesia');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_INDONESIA',		'KNIGHT',				'Armored_Cavalry',				5),
('_INDONESIA',		'ARCHER',				'Archer_Korea',					12),
('_INDONESIA',		'MARINE',				'AsianSF',						12),
('_INDONESIA',		'MODERN_ARMOR',			'Leopard2',						3),
('_INDONESIA',		'ANTI_TANK_GUN',		'Type1_Ho-Ni_I',				2),
('_INDONESIA',		'ANTI_AIRCRAFT_GUN',	'Type98_Ko-Hi',					2);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Indonesia';
