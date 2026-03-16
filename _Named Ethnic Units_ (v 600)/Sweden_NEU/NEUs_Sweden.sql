-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Sweden');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_SWEDEN',			'PARATROOPER',			'Paratrooper_Sweden',			10),
('_SWEDEN',			'LONGSWORDSMAN',		'Longswordsman_Viking_v3',		12),
('_SWEDEN',			'INFANTRY',				'Infantry_Sweden',				12),
('_SWEDEN',			'WWI_TANK',				'Strv_M21',						2),
('_SWEDEN',			'ANTI_TANK_GUN',		'PVKV_M43',						2),
('_SWEDEN',			'DESTROYER',			'Goteborg_Class',				1),
('_SWEDEN',			'RIFLEMAN',				'civ5_swerm1',					12),
('_SWEDEN',			'TANK',					'Strv_M41',						3),
('_SWEDEN',			'PIKEMAN',				'Pikeman_Viking',				12),
('_SWEDEN',			'BOMBER',				'SAAB_B18',						1),
('_SWEDEN',			'ANTI_AIRCRAFT_GUN',	'Landsverk_L-62',				2),
('_SWEDEN',			'KNIGHT',				'Knight_Viking',				5);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Sweden';
