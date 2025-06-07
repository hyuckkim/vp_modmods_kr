-----------------------------------------------------
-- Policy Costs
--------------------------------------------------

-- this setting grows faster but seems like not enough. industry in the late medieval for the AI
--UPDATE Defines SET Value = 40 WHERE Name = 'BASE_POLICY_COST';
--UPDATE Defines SET Value = 2.394 WHERE Name = 'POLICY_COST_EXPONENT';
--UPDATE Defines SET Value = 3.388 WHERE Name = 'POLICY_COST_INCREASE_TO_BE_EXPONENTED';
--UPDATE Defines SET Value = 0.0 WHERE Name = 'POLICY_COST_EXTRA_VALUE';

-- cubi scaling now. This feel ok but it becomes too expensive later. only 3 policies into industry as enter modern
--UPDATE Defines SET Value = 58.8 WHERE Name = 'BASE_POLICY_COST';
--UPDATE Defines SET Value = 2.954 WHERE Name = 'POLICY_COST_EXPONENT';
--UPDATE Defines SET Value = 1.617 WHERE Name = 'POLICY_COST_INCREASE_TO_BE_EXPONENTED';
--UPDATE Defines SET Value = 1.416 WHERE Name = 'POLICY_COST_EXTRA_VALUE';

-- try to find a middle way with improved optimization algorithm
UPDATE Defines SET Value = 60.0 WHERE Name = 'BASE_POLICY_COST';
UPDATE Defines SET Value = 2.4 WHERE Name = 'POLICY_COST_EXPONENT';
UPDATE Defines SET Value = 3.34 WHERE Name = 'POLICY_COST_INCREASE_TO_BE_EXPONENTED';
UPDATE Defines SET Value = 0.0 WHERE Name = 'POLICY_COST_EXTRA_VALUE';

------------------------------------------------------------------------------------------------------------------------	
-- Wonder costs and requirements
------------------------------------------------------------------------------------------------------------------------	
-- Ren1: Chitzen Itza 12, Globe Theatre 11, Himeji 12, Leaning Tower 13
-- Ren2: Porcelain 11, Taj Mahal 12, Topkapi *13, Versailles *12, Sistine 11, Summer Palace 12, Red Fort 13
-- EE1: Uffizi 0, Wat Phra *14, Torre del Oro *14
-- EE2: Kronborg *15, Fasil *15
-- Ind1: Smithsonian*17, Neuschwanstein 16/18, Slater Mill 15/17, 
-- Ind2: Louvre 17/19, BigBen 0, Eiffel 17/19, Brandenburg Gate 0
-- Mod1: Statue of Liberty 20, Empire State Building 0, Motherland Calls 8, 
-- Infixo: new values as of VP907
-- Hokath: reapply sweep table with different values

CREATE TEMP TABLE WonderPolicyNeeded (
	GridXTemp INTEGER,
	NumPolicies INTEGER
);

-- need to compare to verns table
INSERT INTO WonderPolicyNeeded
VALUES
	(1, 0),
	(2, 2),
	(3, 4),
	(4, 5),
	(5, 7),  --medieval
	(6, 8),
	(7, 10),  --renais
	(8, 11),
	(9, 12),  --enlight
	(10, 13),
	(11, 15),  --indust
	(12, 17),
	(13, 19),  --modern
	(14, 21),
	(15, 23),  --atomic
	(16, 25),
	(17, 27),  --info
	(18, 29),
	(19, 30);

UPDATE Buildings
SET NumPoliciesNeeded = (
	SELECT NumPolicies FROM WonderPolicyNeeded WHERE PrereqTech IN (
		SELECT Type FROM Technologies WHERE GridX = GridXTemp
	)
)
WHERE WonderSplashImage IS NOT NULL
AND PolicyType IS NULL
AND EXISTS (
	SELECT 1 FROM WonderPolicyNeeded WHERE PrereqTech IN (
		SELECT Type FROM Technologies WHERE GridX = GridXTemp
	)
);

DROP TABLE WonderPolicyNeeded;

CREATE TEMP TABLE WorldWonderCost (
	GridXTemp INTEGER,
	CostTemp INTEGER
);

INSERT INTO WorldWonderCost
VALUES
	(1, 150), --ancient
	(2, 185),
	(3, 200), --classical
	(4, 250),
	(5, 400),  --medieval
	(6, 500),
	(7, 700),  --renai
	(8, 800),
	(9, 1000),  --enlight
	(10, 1150),
	(11, 1350),  --indust
	(12, 1500),
	(13, 1750),  --modern
	(14, 1950),
	(15, 2200),  --atomic
	(16, 2400),
	(17, 2700),  --info
	(18, 2950),
	(19, 3250);

UPDATE Buildings
SET Cost = (
	SELECT CostTemp FROM WorldWonderCost WHERE PrereqTech IN (
		SELECT Type FROM Technologies WHERE GridX = GridXTemp
	)
)
WHERE WonderSplashImage IS NOT NULL
AND EXISTS (
	SELECT 1 FROM WorldWonderCost WHERE PrereqTech IN (
		SELECT Type FROM Technologies WHERE GridX = GridXTemp
	)
);

DROP TABLE WorldWonderCost;

-- Corporations
UPDATE Buildings
SET Cost = 1750, GoldMaintenance = 0
WHERE BuildingClass IN (
	SELECT HeadquartersBuildingClass FROM Corporations
);


-----------------------------------------------
-- Building Costs
----------------------------------------------

CREATE TEMP TABLE BuildingCost (
	GridXTemp INTEGER,
	CostTemp INTEGER,
	GoldMaintenanceTemp INTEGER
);

INSERT INTO BuildingCost
VALUES
	(0, 65, 0),
	(1, 65, 1),
	(2, 110, 1),
	(3, 150, 1),  --classical
	(4, 200, 1),
	(5, 300, 2),  --medieval
	(6, 350, 2),
	(7, 500, 2),  --renai
	(8, 600, 3),
	(9, 800, 3),  --enlight
	(10, 925, 4),
	(11, 1150, 4),  --indust
	(12, 1300, 5),
	(13, 1750, 6),  --modern
	(14, 2000, 7),
	(15, 2250, 8),  --atomic
	(16, 2450, 9),
	(17, 2650, 10),  --info
	(18, 2850, 11),
	(19, 3100, 12);

UPDATE Buildings
SET
	Cost = (
		SELECT CostTemp FROM BuildingCost WHERE PrereqTech IN (
			SELECT Type FROM Technologies WHERE GridX = GridXTemp
		)
	),
	GoldMaintenance = (
		SELECT GoldMaintenanceTemp FROM BuildingCost WHERE PrereqTech IN (
			SELECT Type FROM Technologies WHERE GridX = GridXTemp
		)
	)
WHERE WonderSplashImage IS NULL
AND BuildingClass NOT IN (
	SELECT Type FROM BuildingClasses
	WHERE MaxPlayerInstances = 1
)
AND EXISTS (
	SELECT 1 FROM BuildingCost WHERE PrereqTech IN (
		SELECT Type FROM Technologies WHERE GridX = GridXTemp
	)
);

-- National Wonders
UPDATE Buildings
SET
	Cost = (
		SELECT CostTemp FROM BuildingCost WHERE PrereqTech IN (
			SELECT Type FROM Technologies WHERE GridX = GridXTemp
		)
	) * 100 / 250,
	GoldMaintenance = 0
WHERE BuildingClass IN (
	SELECT Type FROM BuildingClasses
	WHERE MaxPlayerInstances = 1
)
AND EXISTS (
	SELECT 1 FROM BuildingCost WHERE PrereqTech IN (
		SELECT Type FROM Technologies WHERE GridX = GridXTemp
	)
);

-- Ideology National Wonders should have the same costs
UPDATE Buildings
SET Cost = (SELECT CostTemp FROM BuildingCost WHERE GridXTemp = 12) * 100 / 250
WHERE BuildingClass IN (
	SELECT Type FROM BuildingClasses
	WHERE MaxPlayerInstances = 1
) AND PolicyBranchType IS NOT NULL;

DROP TABLE BuildingCost;

-- Corporations
UPDATE Buildings
SET Cost = 1750, GoldMaintenance = 6
WHERE BuildingClass IN (
	SELECT OfficeBuildingClass FROM Corporations
);

-- Outliers
-- Council, Agribusiness, guild support, and Gold buildings, tavern
UPDATE Buildings
SET GoldMaintenance = 0
WHERE BuildingClass IN (
	'BUILDINGCLASS_GROVE',
	'BUILDINGCLASS_STOCKYARD',
	'BUILDINGCLASS_AMPHITHEATER',
	'BUILDINGCLASS_GALLERY',
	'BUILDINGCLASS_OPERA_HOUSE',
	'BUILDINGCLASS_MARKET',
	'BUILDINGCLASS_CARAVANSARY',
	'BUILDINGCLASS_MINT',
	'BUILDINGCLASS_BANK',
	'BUILDINGCLASS_STOCK_EXCHANGE',
	'BUILDINGCLASS_EE_WEIGH_HOUSE',
	'BUILDINGCLASS_EE_TAVERN'
);

-- Non-unique Courthouse, Garden and Chancery
UPDATE Buildings
SET GoldMaintenance = 3
WHERE Type IN (
	'BUILDING_COURTHOUSE',
	'BUILDING_GARDEN',
	'BUILDING_CHANCERY'
);

-- Maintenance-free Unique Buildings
UPDATE Buildings
SET GoldMaintenance = 0
WHERE Type IN (
	'BUILDING_SATRAPS_COURT',
	'BUILDING_BASILICA'
);

--==========================================================================================================================
-- Tech Costs
--==========================================================================================================================
CREATE TEMP TABLE TechCosts (
	X INTEGER,
	TechCost INTEGER
);

INSERT INTO TechCosts
VALUES
	(0, 20),
	(1, 60),
	(2, 100),
	(3, 130),
	(4, 275),
	(5, 500),
	(6, 700),
	(7, 1750),
	(8, 2400),
	(9, 3600),
	(10, 5000),
	(11, 7400),
	(12, 9800),
	(13, 12000),
	(14, 14000),
	(15, 17100),
	(16, 20400),
	(17, 24500),  -- linear extrapolation
	(18, 27500),
	(19, 29000),
	(20, 31000);

UPDATE Technologies
SET Cost = (SELECT TechCost FROM TechCosts WHERE X = GridX)
WHERE EXISTS (SELECT 1 FROM TechCosts WHERE X = GridX);

DROP TABLE TechCosts;

-----------------------------------------------------------------------------------
-- (MILITARY) Unit Costs
-----------------------------------------------------------------------------------

-- Military units
CREATE TEMP TABLE TechTier_UnitCosts (
	TechTier INTEGER,
	LandBasicCost INTEGER,
	LandAdvancedCost INTEGER,
	UnitFaithCost INTEGER
);

INSERT INTO TechTier_UnitCosts
VALUES
	(0, 40, 45, 100),
	(1, 50, 55, 100),
	(2, 70, 90, 150),
	(3, 90, 100, 200),  -- classical
	(4, 110, 130, 250),
	(5, 135, 175, 300),  -- medieval
	(6, 160, 200, 350),
	(7, 300, 350, 400),  -- renai
	(8, 325, 375, 450),
	(9, 400, 450, 500),  -- enlight
	(10, 475, 500, 550),
	(11, 625, 750, 600),  -- indust
	(12, 725, 825, 700),
	(13, 900, 1000, 800),  --modern
	(14, 1050, 1300, 900),
	(15, 1300, 1650, 1000), -- atomic
	(16, 1500, 1800, 1400),
	(17, 1800, 2250, 1600),  -- info
	(18, 2250, 3000, 1800),  --GDR is here atm
	(19, 2600, 3000, 2000);

-- Melee, Ranged, Recon
UPDATE Units
SET Cost = (
	SELECT LandBasicCost FROM TechTier_UnitCosts WHERE PrereqTech IN (
		SELECT Type FROM Technologies WHERE GridX = TechTier
	)
)
WHERE EXISTS (
	SELECT 1 FROM TechTier_UnitCosts WHERE PrereqTech IN (
		SELECT Type FROM Technologies WHERE GridX = TechTier
	)
) AND CombatClass IN (
	'UNITCOMBAT_MELEE',
	'UNITCOMBAT_GUN',
	'UNITCOMBAT_ARCHER',
	'UNITCOMBAT_RECON'
) AND IsMounted = 0 AND MinorCivGift = 0;

-- Mounted Melee, Mounted Ranged, Siege
UPDATE Units
SET Cost = (
	SELECT LandAdvancedCost FROM TechTier_UnitCosts WHERE PrereqTech IN (
		SELECT Type FROM Technologies WHERE GridX = TechTier
	)
)
WHERE EXISTS (
	SELECT 1 FROM TechTier_UnitCosts WHERE PrereqTech IN (
		SELECT Type FROM Technologies WHERE GridX = TechTier
	)
) AND (
	CombatClass IN (
		'UNITCOMBAT_MOUNTED',
		'UNITCOMBAT_ARMOR',
		'UNITCOMBAT_SIEGE'
	) OR IsMounted = 1
) AND MinorCivGift = 0;

-- Faith costs
UPDATE Units
SET FaithCost = (
	SELECT UnitFaithCost FROM TechTier_UnitCosts WHERE PrereqTech IN (
		SELECT Type FROM Technologies WHERE GridX = TechTier
	)
)
WHERE EXISTS (
	SELECT 1 FROM TechTier_UnitCosts WHERE PrereqTech IN (
		SELECT Type FROM Technologies WHERE GridX = TechTier
	)
)
AND CombatClass IN (SELECT Type FROM UnitCombatInfos WHERE IsMilitary = 1)
AND PurchaseOnly = 0
AND MinorCivGift = 0;

DROP TABLE TechTier_UnitCosts;

-- Ships and planes
CREATE TEMP TABLE UnitClass_Costs (
	UnitClass TEXT,
	UnitCost INTEGER
);

INSERT INTO UnitClass_Costs
VALUES
	-- Naval Melee
	('UNITCLASS_GALLEY', 70),
	('UNITCLASS_TRIREME', 120),
	('UNITCLASS_CARAVEL', 160),
	('UNITCLASS_EE_CARRACK', 350),
	('UNITCLASS_PRIVATEER', 475),
	('UNITCLASS_IRONCLAD', 825),
	('UNITCLASS_EARLY_DESTROYER', 1150),
	('UNITCLASS_DESTROYER', 1500),
	('UNITCLASS_MISSILE_DESTROYER', 2250),
	-- Naval Ranged
	('UNITCLASS_LIBURNA', 100),
	('UNITCLASS_GALLEASS', 175),
	('UNITCLASS_EE_GALLEON', 450),
	('UNITCLASS_FRIGATE', 500),
	('UNITCLASS_CRUISER', 900),
	('UNITCLASS_DREADNOUGHT', 1300),
	('UNITCLASS_BATTLESHIP', 1800),
	('UNITCLASS_MISSILE_CRUISER', 2500),
	-- Submarine
	('UNITCLASS_SUBMARINE', 1300),
	('UNITCLASS_ATTACK_SUBMARINE', 1800),
	('UNITCLASS_NUCLEAR_SUBMARINE', 2500),
	-- Carrier
	('UNITCLASS_CARRIER', 1800),
	('UNITCLASS_SUPERCARRIER', 4000),
	-- Fighter
	('UNITCLASS_TRIPLANE', 800),
	('UNITCLASS_FIGHTER', 1400),
	('UNITCLASS_ZERO', 1400),
	('UNITCLASS_JET_FIGHTER', 2100),
	-- Bomber
	('UNITCLASS_WWI_BOMBER', 850),
	('UNITCLASS_BOMBER', 1500),
	('UNITCLASS_B17', 1500),
	('UNITCLASS_STEALTH_BOMBER', 2200);

UPDATE Units
SET Cost = (SELECT UnitCost FROM UnitClass_Costs WHERE UnitClass = Class)
WHERE EXISTS (SELECT 1 FROM UnitClass_Costs WHERE UnitClass = Class);

DROP TABLE UnitClass_Costs;

-- boat faith costs for spain
-- Renaissance
UPDATE Units SET Cost = 350, FaithCost = 400 WHERE Type = 'UNIT_EE_CARRACK';
UPDATE Units SET Cost = 350, FaithCost = 400 WHERE Type = 'UNIT_DUTCH_SEA_BEGGAR';
UPDATE Units SET Cost = 350, FaithCost = 400 WHERE Type = 'UNIT_PORTUGUESE_NAU'; 
UPDATE Units SET Cost = 450, FaithCost = 450 WHERE Type = 'UNIT_EE_GALLEON'; 
-- Enlightenment 
UPDATE Units SET Cost = 475, FaithCost = 500 WHERE Type = 'UNIT_PRIVATEER'; -- (350p)
UPDATE Units SET Cost = 500, FaithCost = 550 WHERE Type = 'UNIT_FRIGATE'; -- (475p)
UPDATE Units SET Cost = 500, FaithCost = 550 WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE'; -- (375p) replaces FRIGATE

-- No Prereq
UPDATE Units SET Cost = 40, FaithCost = 100 WHERE Class IN ('UNITCLASS_WARRIOR', 'UNITCLASS_VP_SLINGER', 'UNITCLASS_PATHFINDER');

-- Outliers
UPDATE Units SET Cost = 125 WHERE Class = 'UNITCLASS_ELEPHANT_RIDER';
UPDATE Units SET Cost = 100 WHERE Class = 'UNITCLASS_SWORDSMAN';
UPDATE Units SET Cost = 160 WHERE Class = 'UNITCLASS_LONGSWORDSMAN';
UPDATE Units SET Cost = 125 WHERE Class = 'UNITCLASS_FCOMPANY';
UPDATE Units SET Cost = 550 WHERE Class = 'UNITCLASS_FOREIGNLEGION';
UPDATE Units SET Cost = 2500 WHERE Class = 'UNITCLASS_MODERN_ARMOR';

-- Unique Units
UPDATE Units SET Cost = 70, FaithCost = 150 WHERE Type = 'UNIT_CELT_PICTISH_WARRIOR'; -- earlier but same cost
UPDATE Units SET Cost = 100 WHERE Type = 'UNIT_MAYAN_ATLATLIST'; -- cheaper and earlier
UPDATE Units SET Cost = 135, FaithCost = 300 WHERE Type = 'UNIT_DANISH_BERSERKER'; -- earlier but same cost
UPDATE Units SET Cost = 275, FaithCost = 350 WHERE Type = 'UNIT_GERMAN_LANDSKNECHT'; -- cheaper
UPDATE Units SET Cost = 325, FaithCost = 500 WHERE Type = 'UNIT_OTTOMAN_JANISSARY'; -- earlier but same cost
UPDATE Units SET Cost = 350, FaithCost = 500 WHERE Type = 'UNIT_INDIAN_WARELEPHANT'; -- earlier but same cost
UPDATE Units SET Cost = 600, FaithCost = 550 WHERE Type = 'UNIT_ETHIOPIAN_MEHAL_SEFARI'; -- cheaper
