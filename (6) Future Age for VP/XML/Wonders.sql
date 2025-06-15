----------------------------------------------------
-- Generic info
----------------------------------------------------
INSERT INTO Buildings (Type, PrereqTech, Cost, ArtDefineTag, PortraitIndex, IconAtlas, NukeImmune, NumPoliciesNeeded, WonderSplashImage, WonderSplashAnchor) VALUES
('BUILDING_FW_SKYTREE',     	  	 	'TECH_MEMETICS',     	   3250, 'ART_DEF_BUILDING_LABORATORY',  0,'BW_ATLAS_SKYTREE', 	  		1, 28, 		'SkyTree_splash.dds', 				'R,T'),
('BUILDING_FW_SHANGHAI_WFC', 		    'TECH_GRID_COMPUTING', 	   3250, 'ART_DEF_BUILDING_LABORATORY',  1,'BW_ATLAS_CHINESE_NEW_YEAR', 1, 27, 		'SHANGHAI_WFC_splash.dds', 			'L,T'),
('BUILDING_FW_NANO_INSTITUTE',    	 	'TECH_NANOTECHNOLOGY',     3250, 'ART_DEF_BUILDING_LABORATORY',  17,'CIV_COLOR_ATLAS_FW_2', 	1, 27, 		'SkyTree_splash_a.dds', 			'L,T'),
('BUILDING_FW_GENE_VAULT', 				'TECH_FW_ECOTHEORY',       3500, 'ART_DEF_BUILDING_LABORATORY',  42,'CIV_COLOR_ATLAS_FW_3', 	1, 28, 		'GeneVault_Splash.dds',		 		'L,T'),
('BUILDING_FW_APEX_CENTRE',     	 	'TECH_IMPLANTS',           3500, 'ART_DEF_BUILDING_LABORATORY',  39,'CIV_COLOR_ATLAS_FW_3', 	1, 28, 		'ApexCentre_Splash.dds', 			'L,T'),
('BUILDING_FW_VIRTUAL_IDOL', 			'TECH_COGNITIVE_TECH',     3500, 'ART_DEF_BUILDING_LABORATORY',  17, 'CIV_COLOR_ATLAS_FW_3', 	1, 28, 		'VirtualIdol_Splash.dds',		 	'L,T'),
('BUILDING_FW_ENRICHMENT_CENTRE', 		'TECH_NUCLEAR_ENRICHMENT', 3500, 'ART_DEF_BUILDING_LABORATORY',  7, 'CIV_COLOR_ATLAS_FW_3', 	1, 28, 		'EnrichmentCentre_Splash.dds',		'L,T'),
('BUILDING_FW_JURASSIC_PARK',     	 	'TECH_CLONING',            3750, 'ART_DEF_BUILDING_LABORATORY',  5,'CIV_COLOR_ATLAS_FW_3', 		1, 29, 		'JurassicPark_Splash.dds', 			'L,T'),
('BUILDING_FW_HELIOS', 					'TECH_ASTRODYNAMICS',      3750, 'ART_DEF_BUILDING_LABORATORY',  19,'CIV_COLOR_ATLAS_FW_2', 	1, 29, 		'Helios_Splash.dds',		 		'L,T'),
('BUILDING_FW_PHOLUS_MUTAGEN', 			'TECH_TRANSGENICS',    	   4000, 'ART_DEF_BUILDING_LABORATORY',  26, 'CIV_COLOR_ATLAS_FW_2', 	1, 29, 		'PholusMutagen_Splash.dds',		 	'L,T'),
('BUILDING_FW_DATA_HAVEN', 	  	  	 	'TECH_AUTONOMOUS_SYSTEMS', 4000, 'ART_DEF_BUILDING_LABORATORY',  3,'CIV_COLOR_ATLAS_FW_2', 		1, 29, 		'DataHaven_Splash.dds', 			'R,B'),
('BUILDING_FW_SHIMIZUMCP', 		  	 	'TECH_ARCOLOGIES',    	   4000, 'ART_DEF_BUILDING_LABORATORY',  16,'CIV_COLOR_ATLAS_FW_2', 	1, 30, 		'FWShimizuMCP_Splash.dds', 			'L,T'),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE', 	'TECH_GENGINEERING',       4250, 'ART_DEF_BUILDING_FW_GARDEN',   16,'CIV_COLOR_ATLAS_FW_3', 	1, 30, 		'NephilimGeneTemplate_Splash.dds', 	'L,T'),
('BUILDING_FW_MNEMOSYNE', 				'TECH_CYBERNETICS',    	   4250, 'ART_DEF_BUILDING_LABORATORY',  45, 'CIV_COLOR_ATLAS_FW_2', 	1, 30, 		'Mnemosyne_Splash.dds',		 		'L,T'),
('BUILDING_FW_SKYNET', 					'TECH_AI', 	  		 	   4250, 'ART_DEF_BUILDING_LABORATORY',  32,'CIV_COLOR_ATLAS_FW_3', 	1, 30, 		'Skynet_Splash.dds',		 		'L,T'),
('BUILDING_FW_CITADEL_STATION', 		'TECH_NUCLEAR_FUSION',     4250, 'ART_DEF_BUILDING_LABORATORY',  6, 'CIV_COLOR_ATLAS_FW_3', 	1, 30, 		'CitadelStation_Splash.dds',		'R,T'),
('BUILDING_FW_ORBITAL_REFINERY', 		'TECH_ADAMANTIUM',         4250, 'ART_DEF_BUILDING_LABORATORY',  57,'CIV_COLOR_ATLAS_FW_2', 	1, 30, 		'OrbitalRefinery_Splash.dds', 		'L,T'),
('BUILDING_FW_FLOATINGISLANDS',   	 	'TECH_TERRAFORMING', 	   5000, 'ART_DEF_BUILDING_LABORATORY',  50,'CIV_COLOR_ATLAS_FW_2', 	1, 32, 		'LivingCity_Splash.dds', 	        'L,T'),
('BUILDING_FW_DIGITAL_EMANCIPATION', 	'TECH_DIGITAL_SOCIETY',    5000, 'ART_DEF_BUILDING_LABORATORY',  43, 'CIV_COLOR_ATLAS_FW_2', 	1, 32, 		'DigitalEmancipation_Splash.dds',	'L,T'),
('BUILDING_FW_ANGELNET', 				'TECH_SMART_MATERIALS',    5000, 'ART_DEF_BUILDING_LABORATORY',  38,'CIV_COLOR_ATLAS_FW_2', 	1, 32, 		'Angelnet_Splash.dds',		 		'L,T'),
('BUILDING_FW_ULTIMATOWER', 	  	 	'TECH_HYPERSTRUCTURES',    5000, 'ART_DEF_BUILDING_LABORATORY',  49,'CIV_COLOR_ATLAS_FW_2', 	1, 32, 		'FWUltimaTower_Splash.dds', 		'L,T'),
('BUILDING_FW_BIONICTOWER', 	  	 	'TECH_HYPERSTRUCTURES',    5000, 'ART_DEF_BUILDING_LABORATORY',  29,'CIV_COLOR_ATLAS_FW_2',		1, 32, 		'FWBionicTower_Splash.dds', 		'C,T'),
('BUILDING_FW_BUENOSAIRESFORUM',  	 	'TECH_HYPERSTRUCTURES',    5000, 'ART_DEF_BUILDING_LABORATORY',  47,'CIV_COLOR_ATLAS_FW_2', 	1, 32, 		'FWBuenosAiresForum_Splash.dds',	'L,T'),
('BUILDING_FW_SKYCITY', 	  	  	 	'TECH_HYPERSTRUCTURES',    5000, 'ART_DEF_BUILDING_LABORATORY',  36,'CIV_COLOR_ATLAS_FW_3', 	1, 32, 		'KingdomTowerCT_Splash.dds', 		'R,T'),
('BUILDING_FW_GENOME_PROJECT', 			NULL,    					-1,  'ART_DEF_BUILDING_LABORATORY',  21,'CIV_COLOR_ATLAS_FW_3', 	1, NULL, 	'GenomeProject_Splash.dds',		 	'L,T'),
('BUILDING_FW_ASTEROID_MINING', 		NULL,    				   -1, 	 'ART_DEF_BUILDING_LABORATORY',  19, 'CIV_COLOR_ATLAS_FW_3', 	1, NULL, 	'AsteroidMining_Splash.dds',		'L,T'),
('BUILDING_FW_ASTEROID_MINING_1', 		NULL,    				   -1, 	 'ART_DEF_BUILDING_LABORATORY',  19, 'CIV_COLOR_ATLAS_FW_3', 	1, NULL, 	'AsteroidMining_Splash.dds',		'L,T'),
('BUILDING_FW_ASTEROID_MINING_2', 		NULL,    				   -1, 	 'ART_DEF_BUILDING_LABORATORY',  19, 'CIV_COLOR_ATLAS_FW_3', 	1, NULL, 	'AsteroidMining_Splash.dds',		'L,T');


UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_'||SUBSTR(Type,10), Description = 'TXT_KEY_'||Type,
	Civilopedia = 'TXT_KEY_'||Type||'_PEDIA', Quote = 'TXT_KEY_'||Type||'_QUOTE', Help = 'TXT_KEY_'||Type||'_HELP',
	MinAreaSize = -1, HurryCostModifier = -20, ConquestProb = 100
WHERE Type IN (
'BUILDING_FW_NANO_INSTITUTE',
'BUILDING_FW_APEX_CENTRE',
'BUILDING_FW_JURASSIC_PARK',
'BUILDING_FW_SKYTREE',
'BUILDING_FW_SHIMIZUMCP',
'BUILDING_FW_BUENOSAIRESFORUM',
'BUILDING_FW_ULTIMATOWER',
'BUILDING_FW_SKYCITY',
'BUILDING_FW_DATA_HAVEN',
'BUILDING_FW_BIONICTOWER',
'BUILDING_FW_FLOATINGISLANDS',
'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',
'BUILDING_FW_SHANGHAI_WFC',
'BUILDING_FW_ORBITAL_REFINERY',
'BUILDING_FW_SKYNET',
'BUILDING_FW_ANGELNET',
'BUILDING_FW_GENOME_PROJECT',
'BUILDING_FW_GENE_VAULT',
'BUILDING_FW_HELIOS',
'BUILDING_FW_MNEMOSYNE',
'BUILDING_FW_PHOLUS_MUTAGEN',
'BUILDING_FW_CITADEL_STATION',
'BUILDING_FW_VIRTUAL_IDOL',
'BUILDING_FW_ENRICHMENT_CENTRE',
'BUILDING_FW_DIGITAL_EMANCIPATION',
'BUILDING_FW_ASTEROID_MINING',
'BUILDING_FW_ASTEROID_MINING_1',
'BUILDING_FW_ASTEROID_MINING_2');

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxGlobalInstances)
SELECT 'BUILDINGCLASS_'||SUBSTR(Type,10), Type, 'TXT_KEY_'||Type, 1
FROM Buildings
WHERE Type IN (
'BUILDING_FW_NANO_INSTITUTE',
'BUILDING_FW_APEX_CENTRE',
'BUILDING_FW_JURASSIC_PARK',
'BUILDING_FW_SKYTREE',
'BUILDING_FW_SHIMIZUMCP',
'BUILDING_FW_BUENOSAIRESFORUM',
'BUILDING_FW_ULTIMATOWER',
'BUILDING_FW_SKYCITY',
'BUILDING_FW_DATA_HAVEN',
'BUILDING_FW_BIONICTOWER',
'BUILDING_FW_FLOATINGISLANDS',
'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',
'BUILDING_FW_SHANGHAI_WFC',
'BUILDING_FW_ORBITAL_REFINERY',
'BUILDING_FW_SKYNET',
'BUILDING_FW_ANGELNET',
'BUILDING_FW_GENOME_PROJECT',
'BUILDING_FW_GENE_VAULT',
'BUILDING_FW_HELIOS',
'BUILDING_FW_MNEMOSYNE',
'BUILDING_FW_PHOLUS_MUTAGEN',
'BUILDING_FW_CITADEL_STATION',
'BUILDING_FW_VIRTUAL_IDOL',
'BUILDING_FW_ENRICHMENT_CENTRE',
'BUILDING_FW_DIGITAL_EMANCIPATION',
'BUILDING_FW_ASTEROID_MINING',
'BUILDING_FW_ASTEROID_MINING_1',
'BUILDING_FW_ASTEROID_MINING_2');

--------------------------------------------
-- Move Wonders
--------------------------------------------

-- Move OPERA
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_GLOBALIZATION', Cost = 3000, CultureRateModifier = '25', MinAreaSize = '10'
-- WHERE Type = 'BUILDING_SYDNEY_OPERA_HOUSE';

-- Move Hubble
UPDATE Buildings
SET PrereqTech = 'TECH_ORBITAL_DEV', Cost = 3500
WHERE Type = 'BUILDING_HUBBLE';


--------------------------------------------
-- Apex Centre
--------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_CIVIL_SERVANT', SpecialistCount = 2, GreatPeopleRateChange = 2, EspionageModifier = -25
WHERE Type = 'BUILDING_FW_APEX_CENTRE';

----------------------------------------------
-- Ceres Station
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_FW_ASTEROID_MINING';
UPDATE Buildings
SET NeverCapture = 1
WHERE Type = 'BUILDING_FW_ASTEROID_MINING_1';
UPDATE Buildings
SET NeverCapture = 1
WHERE Type = 'BUILDING_FW_ASTEROID_MINING_2';

----------------------------------------------
-- Digital Emancipation
----------------------------------------------
UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_FW_BRAIN_UPLOADING', GlobalGreatPeopleRateModifier = 30, FreeGreatPeople = 1, LocalPopRequired = 70
WHERE Type = 'BUILDING_FW_DIGITAL_EMANCIPATION';

----------------------------------------------
-- Enrichment Centre
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 2, GreatPeopleRateChange = 1, MutuallyExclusiveGroup = 28524
WHERE Type = 'BUILDING_FW_ENRICHMENT_CENTRE';

----------------------------------------------
-- Virtual Idol
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MUSICIAN', SpecialistCount = 2, BoredomFlatReduction = 2, GreatPeopleRateChange = 1, Happiness = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC', GreatWorkCount = 2, GreatWorksTourismModifier = 50, CultureRateModifier = 10
WHERE Type = 'BUILDING_FW_VIRTUAL_IDOL';

----------------------------------------------
-- Citadel Station
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_CIVIL_SERVANT', SpecialistCount = 3, GreatPeopleRateChange = 2, EspionageModifier = -15, GlobalEspionageModifier = -15, ExtraSpies = 2, Espionage = 1
WHERE Type = 'BUILDING_FW_CITADEL_STATION';

-- SpyRankChange = 1, InstantSpyRankChange = 1 Obsolete with newest VP versions

INSERT INTO Building_YieldFromSpyAttack
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_CITADEL_STATION', 'YIELD_FAITH',   100),
	('BUILDING_FW_CITADEL_STATION', 'YIELD_SCIENCE', 100),
	('BUILDING_FW_CITADEL_STATION', 'YIELD_GOLD', 	 100),
	('BUILDING_FW_APEX_CENTRE', 	'YIELD_FAITH', 	 100);

----------------------------------------------
-- Pholus Mutagen
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 2, TrainedFreePromotion = 'PROMOTION_FW_MUTATION'
WHERE Type = 'BUILDING_FW_PHOLUS_MUTAGEN';

----------------------------------------------
-- Mnemosyne
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 2, TrainedFreePromotion = 'PROMOTION_MNEMOSYNE_EXPERIENCE'
WHERE Type = 'BUILDING_FW_MNEMOSYNE';

----------------------------------------------
-- Helios
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2, FreeBuildingThisCity = 'BUILDINGCLASS_FW_SPACE_STATION', MutuallyExclusiveGroup = 28524
WHERE Type = 'BUILDING_FW_HELIOS';

----------------------------------------------
-- Gene Vault
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_WRITER', SpecialistCount = 1, GreatPeopleRateChange = 2, TechEnhancedTourism = 5, Happiness = 2, LandmarksTourismPercent = 50, GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 2, ThemingBonusHelp = 'TXT_KEY_GENE_VAULT_THEMING_BONUS_HELP'
WHERE Type = 'BUILDING_FW_GENE_VAULT';

----------------------------------------------
-- Genome Project
----------------------------------------------
UPDATE Buildings
SET UnlockedByLeague = 1, SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 3
WHERE Type = 'BUILDING_FW_GENOME_PROJECT';

----------------------------------------------
-- Angelnet
----------------------------------------------
UPDATE Buildings
SET AirModifier = 5, FreeBuildingThisCity = 'BUILDINGCLASS_FW_UTILITY_FOG', Defense = 5000, AllowsRangeStrike = 1, ExtraCityHitPoints = 200, NukeModifier = -20, Happiness = 3
WHERE Type = 'BUILDING_FW_ANGELNET';

----------------------------------------------
-- Project Utopia - Citizen Earth Protocol - Cultural Victory
----------------------------------------------
UPDATE Projects
SET Cost = 35000, TechPrereq = 'TECH_HOMO_SUPERIOR'
WHERE Type = 'PROJECT_UTOPIA_PROJECT';

----------------------------------------------
-- Skynet
----------------------------------------------
UPDATE Buildings
SET FreePromotion = 'PROMOTION_FW_SKYNET_LINK', FreeBuildingThisCity = 'BUILDINGCLASS_FW_SIMULATION_HUB', MutuallyExclusiveGroup = 23497, Defense = 3000, ExtraCityHitPoints = 150
WHERE Type = 'BUILDING_FW_SKYNET';

----------------------------------------------
-- Orbital Refinery
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2, DistressFlatReduction = 1, NoUnhappfromXSpecialists = 1, MutuallyExclusiveGroup = 23497, FreeBuildingThisCity = 'BUILDINGCLASS_FW_METROPLEX_HUB'
WHERE Type = 'BUILDING_FW_ORBITAL_REFINERY';

----------------------------------------------
-- Shanghai Tower
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 2, PovertyFlatReductionGlobal = 5, FinishLandTRTourism = 5, FinishSeaTRTourism = 5, FreeBuildingThisCity = 'BUILDINGCLASS_FW_CRYPTOBANK'
WHERE Type = 'BUILDING_FW_SHANGHAI_WFC';

----------------------------------------------
-- Nephilim Gene Template
----------------------------------------------
UPDATE Buildings
SET Happiness = 2, MutuallyExclusiveGroup = 23497, FreeBuildingThisCity = 'BUILDINGCLASS_FW_BIRTHING_PODS', FreePromotion = 'PROMOTION_FW_NEPHILIM'
WHERE Type = 'BUILDING_FW_NEPHILIM_GENE_TEMPLATE';

----------------------------------------------
-- Skytree
----------------------------------------------
UPDATE Buildings
SET Happiness = 3
WHERE Type = 'BUILDING_FW_SKYTREE';

----------------------------------------------
-- Jurassic Park
----------------------------------------------
UPDATE Buildings
SET ProhibitedCityTerrain = 'TERRAIN_COAST', SpecialistType = 'SPECIALIST_MERCHANT', GreatPeopleRateChange = 2, TechEnhancedTourism = 3, Happiness = 2, BorderObstacle = 1, FreeBuildingThisCity = 'BUILDINGCLASS_FW_CLONE_LAB', Defense = 1500, ExtraCityHitPoints = 75
WHERE Type = 'BUILDING_FW_JURASSIC_PARK';

----------------------------------------------
-- Floating Islands
----------------------------------------------
UPDATE Buildings
SET FreePromotion = 'PROMOTION_FW_THALASSOCRACY', SpecialistType = 'SPECIALIST_MERCHANT', Water = 1, GreatPeopleRateChange = 1, MinAreaSize = 10
WHERE Type = 'BUILDING_FW_FLOATINGISLANDS';

----------------------------------------------
-- Floating Islands Dummy
----------------------------------------------
INSERT INTO Buildings (Type, BuildingClass, Cost, Description, ArtDefineTag, MinAreaSize, IconAtlas, PortraitIndex, NeverCapture, GreatWorkCount, FaithCost, NukeImmune) VALUES
('BUILDING_FW_FLOATINGISLANDS_DUMMY', 'BUILDINGCLASS_FW_FLOATINGISLANDS_DUMMY', -1, 'TXT_KEY_BUILDING_FW_FLOATINGISLANDS_DUMMY', 'NONE', -1, 'BW_ATLAS_1', 19, 1, -1, -1, 1);
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description) VALUES
('BUILDINGCLASS_FW_FLOATINGISLANDS_DUMMY','BUILDING_FW_FLOATINGISLANDS_DUMMY','TXT_KEY_BUILDING_FW_FLOATINGISLANDS_DUMMY');
UPDATE Buildings SET ExtraCityHitPoints = 75, Defense = 1500, CitySupplyFlat = 1 WHERE Type = 'BUILDING_FW_FLOATINGISLANDS_DUMMY';

----------------------------------------------
-- Bionic Tower
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 2, GreatPeopleRateChange = 5, PolicyType = 'POLICY_RATIONALISM_FINISHER'
WHERE Type = 'BUILDING_FW_BIONICTOWER';

----------------------------------------------
-- Data Haven
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 2, NearbyTerrainRequired = 'TERRAIN_TUNDRA'
WHERE Type = 'BUILDING_FW_DATA_HAVEN';

----------------------------------------------
-- Sky City
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_WRITER', SpecialistCount = 2, GreatPeopleRateChange = 5, GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 2, ThemingBonusHelp = 'TXT_KEY_SKYCITY_THEMING_BONUS_HELP', Happiness = 7, PolicyType = 'POLICY_AESTHETICS_FINISHER'
WHERE Type = 'BUILDING_FW_SKYCITY';

INSERT INTO Building_ThemingYieldBonus 
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_SKYCITY',    'YIELD_GOLDEN_AGE_POINTS',  5),
	('BUILDING_FW_SKYCITY',    'YIELD_FAITH',			   5),
	('BUILDING_FW_GENE_VAULT', 'YIELD_FAITH',			   4),
	('BUILDING_FW_GENE_VAULT', 'YIELD_GOLDEN_AGE_POINTS',  4);

INSERT INTO Building_ThemingBonuses
	(BuildingType, Description, Bonus, RequiresOwner, AIPriority, SameEra, RequiresSamePlayer)
VALUES 
	('BUILDING_FW_SKYCITY', 	'TXT_KEY_THEMING_BONUS_SKYCITY', 		 8, 1, 5, 0, 0),
 	('BUILDING_FW_GENE_VAULT',  'TXT_KEY_THEMING_BONUS_GENE_VAULT', 	 8, 1, 5, 0, 0),
 	('BUILDING_FW_VIRTUAL_IDOL','TXT_KEY_THEMING_BONUS_FW_VIRTUAL_IDOL', 2, 0, 2, 1, 1);

----------------------------------------------
-- Ultimate Tower
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 2, GreatPeopleRateChange = 5, GlobalPopulationChange = 3, Happiness = 7, PolicyType = 'POLICY_EXPLORATION_FINISHER'
WHERE Type = 'BUILDING_FW_ULTIMATOWER';

----------------------------------------------
-- Buenos Aires Forum
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 2, GreatPeopleRateChange = 5, GoldenAge = 1, GoldenAgeModifier = 50, PolicyType = 'POLICY_COMMERCE_FINISHER'
WHERE Type = 'BUILDING_FW_BUENOSAIRESFORUM';

----------------------------------------------
-- Shimizumcp
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2, Water = 1, ExtraCityHitPoints = 150, Defense = 2000, DeepWaterTileDamage = 5, BorderObstacleWater = 1, MinAreaSize = 10
WHERE Type = 'BUILDING_FW_SHIMIZUMCP';

----------------------------------------------
-- Nano Institute
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2, FreeBuildingThisCity = 'BUILDINGCLASS_FW_NANOFORGE'
WHERE Type = 'BUILDING_FW_NANO_INSTITUTE';

----------------------------------------------
-- Yield Changes
----------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_FW_SKYNET',  					'YIELD_PRODUCTION', 	4),
('BUILDING_FW_SKYNET',  					'YIELD_SCIENCE', 		3),
('BUILDING_FW_ORBITAL_REFINERY',  			'YIELD_GOLD', 			3),
('BUILDING_FW_ORBITAL_REFINERY',  			'YIELD_PRODUCTION', 	5),
('BUILDING_FW_HELIOS',  		        	'YIELD_PRODUCTION', 	8),
('BUILDING_FW_ENRICHMENT_CENTRE',  		    'YIELD_SCIENCE', 	    8),
('BUILDING_FW_SHANGHAI_WFC',  				'YIELD_CULTURE', 		1),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  	'YIELD_CULTURE', 		1),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  	'YIELD_FAITH', 			8),
('BUILDING_FW_SKYTREE',  					'YIELD_CULTURE', 		2),
('BUILDING_FW_SKYTREE',  					'YIELD_GOLD', 			3),
('BUILDING_FW_JURASSIC_PARK',  				'YIELD_CULTURE', 		2),
('BUILDING_FW_JURASSIC_PARK',  				'YIELD_SCIENCE', 		4),
('BUILDING_FW_JURASSIC_PARK',  				'YIELD_GOLD', 			6),
('BUILDING_FW_FLOATINGISLANDS',  			'YIELD_SCIENCE', 		5),
('BUILDING_FW_FLOATINGISLANDS',  			'YIELD_CULTURE', 		3),
('BUILDING_FW_FLOATINGISLANDS',  			'YIELD_GOLD', 			2),
('BUILDING_FW_BIONICTOWER',  				'YIELD_SCIENCE', 		5),
('BUILDING_FW_BIONICTOWER',  				'YIELD_CULTURE', 		1),
('BUILDING_FW_DATA_HAVEN',  				'YIELD_CULTURE', 		2),
('BUILDING_FW_DATA_HAVEN',  				'YIELD_FOOD', 			2),
('BUILDING_FW_DATA_HAVEN',  				'YIELD_PRODUCTION', 	2),
('BUILDING_FW_NANO_INSTITUTE',  			'YIELD_PRODUCTION', 	6),
('BUILDING_FW_SKYCITY',  					'YIELD_CULTURE', 		6),
('BUILDING_FW_SKYCITY',  					'YIELD_FAITH', 			4),
('BUILDING_FW_ULTIMATOWER',  				'YIELD_CULTURE', 		1),
('BUILDING_FW_ULTIMATOWER',  				'YIELD_PRODUCTION', 	5),
('BUILDING_FW_BUENOSAIRESFORUM',  			'YIELD_CULTURE', 		1),
('BUILDING_FW_BUENOSAIRESFORUM',  			'YIELD_GOLD', 			5),
('BUILDING_FW_SHIMIZUMCP',  				'YIELD_PRODUCTION', 	8),
('BUILDING_FW_SHIMIZUMCP',  				'YIELD_GOLD', 	        8),
('BUILDING_FW_SHIMIZUMCP',  				'YIELD_SCIENCE', 	    8);

INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield) VALUES
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE', 				'YIELD_FAITH', 		50),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE', 				'YIELD_SCIENCE', 	50),
('BUILDING_FW_ENRICHMENT_CENTRE', 					'YIELD_SCIENCE', 	10);

------------------------
-- Building_SpecialistYieldChangesLocal
------------------------
INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_ENGINEER',		'YIELD_FOOD',				1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_SCIENTIST',		'YIELD_FOOD',				1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_WRITER',		'YIELD_FOOD',				1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_ARTIST',		'YIELD_FOOD',				1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_MUSICIAN',		'YIELD_FOOD',				1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_MERCHANT',		'YIELD_FOOD',				1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_CIVIL_SERVANT',	'YIELD_FOOD',				1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_ENGINEER',		'YIELD_SCIENCE',			1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_SCIENTIST',		'YIELD_SCIENCE',			1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_WRITER',		'YIELD_SCIENCE',			1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_ARTIST',		'YIELD_SCIENCE',			1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_MUSICIAN',		'YIELD_SCIENCE',			1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_MERCHANT',		'YIELD_SCIENCE',			1),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_CIVIL_SERVANT',	'YIELD_SCIENCE',			1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_ENGINEER',		'YIELD_GOLDEN_AGE_POINTS',	1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_SCIENTIST',		'YIELD_GOLDEN_AGE_POINTS',	1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_WRITER',		'YIELD_GOLDEN_AGE_POINTS',	1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_ARTIST',		'YIELD_GOLDEN_AGE_POINTS',	1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_MUSICIAN',		'YIELD_GOLDEN_AGE_POINTS',	1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_MERCHANT',		'YIELD_GOLDEN_AGE_POINTS',	1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_CIVIL_SERVANT',	'YIELD_GOLDEN_AGE_POINTS',	1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_ENGINEER',		'YIELD_GOLD',				1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_SCIENTIST',		'YIELD_GOLD',				1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_WRITER',		'YIELD_GOLD',				1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_ARTIST',		'YIELD_GOLD',				1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_MUSICIAN',		'YIELD_GOLD',				1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_MERCHANT',		'YIELD_GOLD',				1),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_CIVIL_SERVANT',	'YIELD_GOLD',				1),
	('BUILDING_FW_ULTIMATOWER', 				'SPECIALIST_SCIENTIST', 	'YIELD_FOOD',				1),
	('BUILDING_FW_ULTIMATOWER', 				'SPECIALIST_ENGINEER', 		'YIELD_FOOD',	 			1),
	('BUILDING_FW_ULTIMATOWER', 				'SPECIALIST_MERCHANT', 		'YIELD_FOOD',				1),
	('BUILDING_FW_ULTIMATOWER',					'SPECIALIST_WRITER',		'YIELD_FOOD',				1),
	('BUILDING_FW_ULTIMATOWER',					'SPECIALIST_ARTIST',		'YIELD_FOOD',				1),
	('BUILDING_FW_ULTIMATOWER',					'SPECIALIST_MUSICIAN',		'YIELD_FOOD',				1),
	('BUILDING_FW_ULTIMATOWER',					'SPECIALIST_CIVIL_SERVANT',	'YIELD_FOOD',				1),
	('BUILDING_FW_SKYCITY', 					'SPECIALIST_SCIENTIST', 	'YIELD_CULTURE',			1),
	('BUILDING_FW_SKYCITY', 					'SPECIALIST_ENGINEER', 		'YIELD_CULTURE',	 		1),
	('BUILDING_FW_SKYCITY', 					'SPECIALIST_MERCHANT', 		'YIELD_CULTURE',			1),
	('BUILDING_FW_SKYCITY',						'SPECIALIST_WRITER',		'YIELD_CULTURE',			1),
	('BUILDING_FW_SKYCITY',						'SPECIALIST_ARTIST',		'YIELD_CULTURE',			1),
	('BUILDING_FW_SKYCITY',						'SPECIALIST_MUSICIAN',		'YIELD_CULTURE',			1),
	('BUILDING_FW_SKYCITY',						'SPECIALIST_CIVIL_SERVANT',	'YIELD_CULTURE',			1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_CIVIL_SERVANT',	'YIELD_CULTURE',			1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_ARTIST',		'YIELD_CULTURE',			1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_WRITER',		'YIELD_CULTURE',			1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_MUSICIAN',		'YIELD_CULTURE',			1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_SCIENTIST',		'YIELD_SCIENCE',			1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_MERCHANT',		'YIELD_GOLD',				1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_ENGINEER',		'YIELD_PRODUCTION',			1),
	('BUILDING_FW_CITADEL_STATION',				'SPECIALIST_CIVIL_SERVANT',	'YIELD_FAITH',				2),
	('BUILDING_FW_CITADEL_STATION',				'SPECIALIST_CIVIL_SERVANT',	'YIELD_SCIENCE',			2),
	('BUILDING_FW_CITADEL_STATION',				'SPECIALIST_CIVIL_SERVANT',	'YIELD_GOLD',				2),
	('BUILDING_FW_CITADEL_STATION',				'SPECIALIST_CIVIL_SERVANT',	'YIELD_PRODUCTION',			2);

----------------------------------------------------
-- Promotions' unique features
----------------------------------------------------

INSERT INTO Unit_ProductionModifierBuildings 
	(UnitType,	BuildingType,	ProductionModifier) 
VALUES
	('UNIT_FW_AUTOMATON', 			       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_ROBOT_INFANTRY', 		       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_COLOSSUS', 	    	       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_NANOHIVE', 			       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_MEGAHIVE', 			       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_ZEKE', 			           'BUILDING_FW_SKYNET', 				  10),
	('UNIT_MECH', 			               'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_MECH_ARTILLERY', 		       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_ANGEL', 		               'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_CRAWLER', 			       'BUILDING_FW_SKYNET', 				  10),

	('UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER', 'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_XCOM_SQUAD', 		           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_SPACEMARINES', 	           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_BATTLESUIT', 		           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_GUNDAM',      	           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_DRONE_FIGHTER_2', 	       'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_SUBORBITAL_BOMBER', 	       'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_PLASMA_FIGHTER', 	           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_PLASMA_BOMBER', 	           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_SPACE_FIGHTER', 	           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_SPACE_BOMBER', 	           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_HELICARRIER', 		       'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_NEXUS', 		               'BUILDING_FW_ORBITAL_REFINERY', 	      10),

	('UNIT_FW_HYBRID_DRONE', 			   'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  10),
	('UNIT_FW_BIODRONE', 			       'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  10),
	('UNIT_FW_BIOINFANTRY', 		       'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  10),
	('UNIT_FW_CLONETROOPER', 		       'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  10),
	('UNIT_FW_BIOTROOPER', 		           'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  10),
	('UNIT_FW_SUPERSOLDIERS', 		       'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  10),
	('UNIT_FW_MUTANT', 				       'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  10),
	('UNIT_FW_HYDRA', 				       'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  10),
	('UNIT_FW_SWARM', 				       'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  10),
	('UNIT_FW_CHIMERA', 		           'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  10);

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_FW_SKYNET_LINK',       'UNITCOMBAT_ARCHER'),
	('PROMOTION_FW_SKYNET_LINK',       'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_FW_SKYNET_LINK',       'UNITCOMBAT_ARMOR'),
	('PROMOTION_FW_SKYNET_LINK',       'UNITCOMBAT_SIEGE'),
	('PROMOTION_FW_SKYNET_LINK',       'UNITCOMBAT_SUBMARINE'),
	('PROMOTION_FW_THALASSOCRACY',     'UNITCOMBAT_SUBMARINE'),
	('PROMOTION_FW_THALASSOCRACY',     'UNITCOMBAT_NAVALMELEE'),
	('PROMOTION_FW_THALASSOCRACY',     'UNITCOMBAT_NAVALRANGED'),
	('PROMOTION_FW_THALASSOCRACY',     'UNITCOMBAT_CARRIER'),
	('PROMOTION_FW_NEPHILIM', 	       'UNITCOMBAT_MELEE'),
	('PROMOTION_FW_NEPHILIM', 	       'UNITCOMBAT_GUN'),
	('PROMOTION_FW_NEPHILIM', 	       'UNITCOMBAT_RECON'),
	('PROMOTION_FW_NEPHILIM', 	       'UNITCOMBAT_MOUNTED'),
	('PROMOTION_FW_NEPHILIM', 	       'UNITCOMBAT_NAVALMELEE'),
	('PROMOTION_FW_NEPHILIM', 	       'UNITCOMBAT_NAVALRANGED');
	-- ('PROMOTION_FW_SPACESPECIALIST',   'UNITCOMBAT_GUN'),
	-- ('PROMOTION_FW_SPACESPECIALIST',   'UNITCOMBAT_RECON'),
	-- ('PROMOTION_FW_SPACESPECIALIST',   'UNITCOMBAT_CARRIER'),
	-- ('PROMOTION_FW_SPACESPECIALIST',   'UNITCOMBAT_FIGHTER'),
	-- ('PROMOTION_FW_SPACESPECIALIST',   'UNITCOMBAT_BOMBER');

INSERT INTO Building_UnitCombatProductionModifiers 
	(BuildingType, UnitCombatType, Modifier) 
VALUES
	('BUILDING_FW_FLOATINGISLANDS', 'UNITCOMBAT_NAVALRANGED', 25),
	('BUILDING_FW_FLOATINGISLANDS', 'UNITCOMBAT_NAVALMELEE',  25),
	('BUILDING_FW_FLOATINGISLANDS', 'UNITCOMBAT_SUBMARINE',   25),
	('BUILDING_FW_FLOATINGISLANDS', 'UNITCOMBAT_CARRIER', 	  25);

INSERT INTO Building_ImprovementYieldChangesGlobal	
	(BuildingType, 						ImprovementType,							YieldType,					Yield)
VALUES		
	('BUILDING_FW_GENE_VAULT', 	        'IMPROVEMENT_FW_PRESERVE', 		            'YIELD_CULTURE', 			1),
	('BUILDING_FW_GENE_VAULT', 	        'IMPROVEMENT_FW_BIOWELL', 		            'YIELD_FOOD', 				1),
	('BUILDING_FW_ENRICHMENT_CENTRE',	'IMPROVEMENT_FW_GENERATOR', 	            'YIELD_SCIENCE',    		1),
	('BUILDING_FW_ENRICHMENT_CENTRE',	'IMPROVEMENT_FW_INDUSTRIAL_COMPLEX',        'YIELD_PRODUCTION', 		1),
	('BUILDING_FW_HELIOS', 	            'IMPROVEMENT_FW_HYDROPONICS_DOME',      	'YIELD_GOLD', 				1),
	('BUILDING_FW_HELIOS', 	            'IMPROVEMENT_FW_WATER_HYDROPONICS_DOME', 	'YIELD_GOLD', 				1),
	('BUILDING_FW_HELIOS', 	            'IMPROVEMENT_FW_HERC',      	            'YIELD_PRODUCTION',    		1),
	('BUILDING_FW_SKYTREE',		        'IMPROVEMENT_FW_COMM_ARRAY',	            'YIELD_GOLDEN_AGE_POINTS',	1),
	('BUILDING_FW_SKYTREE',		        'IMPROVEMENT_FW_COMM_ARRAY',	            'YIELD_SCIENCE',			1),
	('BUILDING_FW_SKYTREE',		        'IMPROVEMENT_FW_COMM_ARRAY',	            'YIELD_GOLD',				1);

----------------------------------------------
-- Resource  requirements
----------------------------------------------
INSERT INTO Building_ResourceQuantityRequirements 
	(BuildingType, ResourceType, Cost) 
VALUES
	('BUILDING_FW_FLOATINGISLANDS', 		'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_BIONICTOWER', 			'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_SHIMIZUMCP', 				'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_SKYCITY', 				'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_ULTIMATOWER', 			'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_BUENOSAIRESFORUM', 		'RESOURCE_NANOMAT', 	1);

------------------------
-- Building_BuildingClassHappiness
------------------------
INSERT INTO Building_BuildingClassHappiness 
	(BuildingType, BuildingClassType, Happiness)
VALUES
	('BUILDING_FW_SHIMIZUMCP', 'BUILDINGCLASS_FW_AUTOPLANT', 1);


INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_FW_SKYTREE', 'BUILDINGCLASS_BROADCAST_TOWER'),
	('BUILDING_FW_HELIOS', 'BUILDINGCLASS_FW_LAUNCH_FACILITY'),
	('BUILDING_FW_JURASSIC_PARK', 'BUILDINGCLASS_FW_GENE_LAB'),
	('BUILDING_FW_ENRICHMENT_CENTRE', 'BUILDINGCLASS_NUCLEAR_PLANT');

----------------------------------------------
-- Feature requirements
----------------------------------------------
INSERT INTO Building_LocalFeatureOrs 
	(BuildingType, FeatureType) 
VALUES
	('BUILDING_FW_JURASSIC_PARK', 'FEATURE_JUNGLE'),
	('BUILDING_FW_JURASSIC_PARK', 'FEATURE_FOREST');

INSERT INTO Building_ResourceQuantity
	(BuildingType, ResourceType, Quantity)
VALUES
	('BUILDING_FW_ENRICHMENT_CENTRE', 	'RESOURCE_URANIUM', 		4),
	('BUILDING_FW_HELIOS',          	'RESOURCE_NANOMAT', 		4),
	('BUILDING_FW_NANO_INSTITUTE', 		'RESOURCE_NANOMAT', 		6),
	('BUILDING_FW_ORBITAL_REFINERY', 	'RESOURCE_NANOMAT', 		12),
	('BUILDING_FW_ASTEROID_MINING', 	'RESOURCE_URANIUM', 		2),
	('BUILDING_FW_ASTEROID_MINING_2', 	'RESOURCE_NANOMAT', 		6),
	('BUILDING_FW_ASTEROID_MINING_1', 	'RESOURCE_ALUMINUM', 		3),
	('BUILDING_FW_ASTEROID_MINING_1', 	'RESOURCE_IRON', 			2),
	('BUILDING_FW_ASTEROID_MINING_1', 	'RESOURCE_NANOMAT', 		1),
	('BUILDING_FW_APEX_CENTRE', 		'RESOURCE_PAPER', 			3),
	('BUILDING_FW_APEX_CENTRE', 		'RESOURCE_IMPLANT', 		4);


INSERT INTO Building_TerrainYieldChanges
	(BuildingType, TerrainType, YieldType, Yield)
VALUES
	('BUILDING_FW_DATA_HAVEN', 		 'TERRAIN_TUNDRA', 	'YIELD_CULTURE', 	2),
	('BUILDING_FW_DATA_HAVEN', 		 'TERRAIN_SNOW', 	'YIELD_CULTURE', 	2),
	('BUILDING_FW_DATA_HAVEN', 		 'TERRAIN_TUNDRA', 	'YIELD_SCIENCE', 	2),
	('BUILDING_FW_DATA_HAVEN', 		 'TERRAIN_SNOW', 	'YIELD_SCIENCE', 	2);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_FW_DATA_HAVEN', 		 	 'BUILDINGCLASS_FW_SERVER_HUB', 		'YIELD_GOLD',				2),
	('BUILDING_FW_ORBITAL_REFINERY', 	 'BUILDINGCLASS_FW_NANOMAT_PLANT', 		'YIELD_GOLD',				1),
	('BUILDING_FW_ORBITAL_REFINERY', 	 'BUILDINGCLASS_FW_NANOMAT_PLANT', 		'YIELD_PRODUCTION',			1),
	('BUILDING_FW_ORBITAL_REFINERY', 	 'BUILDINGCLASS_FW_NANOFORGE', 			'YIELD_GOLD',				1),
	('BUILDING_FW_ORBITAL_REFINERY', 	 'BUILDINGCLASS_FW_NANOFORGE', 			'YIELD_PRODUCTION',			1),
	('BUILDING_FW_SKYTREE', 		 	 'BUILDINGCLASS_BROADCAST_TOWER', 		'YIELD_CULTURE',    		1),
	('BUILDING_FW_SKYTREE', 		  	 'BUILDINGCLASS_BROADCAST_TOWER', 		'YIELD_GOLDEN_AGE_POINTS',  1),
	('BUILDING_FW_JURASSIC_PARK', 	  	 'BUILDINGCLASS_EE_MENAGERIE',  		'YIELD_GOLD', 				2),
	('BUILDING_FW_JURASSIC_PARK', 	  	 'BUILDINGCLASS_FW_CLONE_LAB',  		'YIELD_SCIENCE', 			2),
	('BUILDING_FW_GENE_VAULT', 	 	  	 'BUILDINGCLASS_FW_ECOSANCTUARY',  		'YIELD_PRODUCTION', 		2),
	('BUILDING_FW_GENE_VAULT', 	 	  	 'BUILDINGCLASS_FW_BIOFACTORY',         'YIELD_FOOD',     			2),
	('BUILDING_FW_PHOLUS_MUTAGEN', 	 	 'BUILDINGCLASS_FW_FUNGAL_AGRIGENOMICS','YIELD_GOLD', 				2),
	('BUILDING_FW_DIGITAL_EMANCIPATION', 'BUILDINGCLASS_FW_SIMULATION_HUB',	    'YIELD_SCIENCE', 			6),
	('BUILDING_FW_DIGITAL_EMANCIPATION', 'BUILDINGCLASS_FW_SIMULATION_HUB',	    'YIELD_CULTURE', 			6),
	('BUILDING_FW_DIGITAL_EMANCIPATION', 'BUILDINGCLASS_FW_SIMULATION_HUB',  	'YIELD_GOLD', 				4),
	('BUILDING_FW_DIGITAL_EMANCIPATION', 'BUILDINGCLASS_FW_DRONE_HIVE',			'YIELD_PRODUCTION', 		8),
	('BUILDING_FW_DIGITAL_EMANCIPATION', 'BUILDINGCLASS_FW_DRONE_HIVE',			'YIELD_GOLD', 				4),
	('BUILDING_FW_DIGITAL_EMANCIPATION', 'BUILDINGCLASS_FW_BRAIN_UPLOADING',	'YIELD_GOLD', 				1),
	('BUILDING_FW_DIGITAL_EMANCIPATION', 'BUILDINGCLASS_FW_BRAIN_UPLOADING',	'YIELD_SCIENCE', 			1),
	('BUILDING_FW_DIGITAL_EMANCIPATION', 'BUILDINGCLASS_FW_BRAIN_UPLOADING',	'YIELD_CULTURE', 			1),
	('BUILDING_FW_DIGITAL_EMANCIPATION', 'BUILDINGCLASS_FW_BRAIN_UPLOADING',	'YIELD_FOOD', 				1);

INSERT INTO Building_SpecificGreatPersonRateModifier 
	(BuildingType, SpecialistType, Modifier) 
VALUES
	('BUILDING_FW_GENE_VAULT', 			'SPECIALIST_WRITER', 		20),
	('BUILDING_FW_CITADEL_STATION', 	'SPECIALIST_CIVIL_SERVANT', 50),
	('BUILDING_FW_BUENOSAIRESFORUM', 	'SPECIALIST_MERCHANT', 		40),
	('BUILDING_FW_ULTIMATOWER', 		'SPECIALIST_ENGINEER', 		40),
	('BUILDING_FW_SKYCITY', 			'SPECIALIST_WRITER', 		25),
	('BUILDING_FW_SKYCITY', 			'SPECIALIST_ARTIST', 		25),
	('BUILDING_FW_SKYCITY', 			'SPECIALIST_MUSICIAN', 		25),
	('BUILDING_FW_BIONICTOWER', 		'SPECIALIST_SCIENTIST', 	40);

INSERT INTO Building_SeaPlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_FLOATINGISLANDS', 'YIELD_CULTURE', 2),
	('BUILDING_FW_FLOATINGISLANDS', 'YIELD_GOLD', 2);

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_FW_FLOATINGISLANDS', 'FEATURE_ATOLL', 'YIELD_CULTURE', 1),
	('BUILDING_FW_FLOATINGISLANDS', 'FEATURE_ATOLL', 'YIELD_GOLD', 1),
	('BUILDING_FW_FLOATINGISLANDS', 'FEATURE_ATOLL', 'YIELD_SCIENCE', 2),
	('BUILDING_FW_FLOATINGISLANDS', 'FEATURE_ATOLL', 'YIELD_PRODUCTION', 2);

INSERT INTO Building_FreeUnits 
	(BuildingType,						UnitType,				NumUnits)
VALUES	
	('BUILDING_FW_JURASSIC_PARK', 		'UNIT_FW_TREX',				1),
	('BUILDING_FW_JURASSIC_PARK', 		'UNIT_FW_TRICERATOPS',		1),
	('BUILDING_FW_JURASSIC_PARK', 		'UNIT_FW_RAPTOR',			2),
	('BUILDING_FW_FLOATINGISLANDS', 	'UNIT_GREAT_ADMIRAL',		1),
	('BUILDING_FW_VIRTUAL_IDOL', 		'UNIT_MUSICIAN',			1),
	('BUILDING_FW_APEX_CENTRE', 		'UNIT_GREAT_DIPLOMAT',		1),
	('BUILDING_FW_BUENOSAIRESFORUM', 	'UNIT_MERCHANT',			1),
	('BUILDING_FW_ULTIMATOWER', 		'UNIT_ENGINEER',			1),
	('BUILDING_FW_SKYCITY', 			'UNIT_WRITER',				1),
	('BUILDING_FW_BIONICTOWER', 		'UNIT_SCIENTIST',			1);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, 						ImprovementType, 						YieldType, 		Yield)
VALUES
	('BUILDING_FW_SHANGHAI_WFC', 	 	'IMPROVEMENT_TRADING_POST', 			'YIELD_CULTURE', 	1),
	('BUILDING_FW_SHANGHAI_WFC', 	 	'IMPROVEMENT_TRADING_POST', 			'YIELD_TOURISM', 	1),
	('BUILDING_FW_SHANGHAI_WFC', 	 	'IMPROVEMENT_CUSTOMS_HOUSE', 			'YIELD_CULTURE', 	1),
	('BUILDING_FW_SHANGHAI_WFC', 	 	'IMPROVEMENT_CUSTOMS_HOUSE', 			'YIELD_TOURISM', 	1);

INSERT INTO Building_ResourcePlotsToPlace
		(BuildingType,						ResourceType,			NumPlots, ResourceQuantityToPlace) 
VALUES	('BUILDING_FW_PHOLUS_MUTAGEN',		'RESOURCE_ADN_FUNGUS',	4		, 3);


INSERT INTO Building_InstantYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_SHANGHAI_WFC', 'YIELD_GOLD', 		15000),
	('BUILDING_FW_SHANGHAI_WFC', 'YIELD_TOURISM', 	10000);

INSERT INTO Building_YieldFromYieldPercent
	(BuildingType,						YieldIn,			YieldOut,			Value) 
VALUES	
	('BUILDING_FW_ULTIMATOWER',			'YIELD_PRODUCTION',	'YIELD_TOURISM',	10),
	('BUILDING_FW_ULTIMATOWER',			'YIELD_PRODUCTION',	'YIELD_GOLD',		10),
	('BUILDING_FW_BUENOSAIRESFORUM',	'YIELD_GOLD',		'YIELD_TOURISM',	15),
	('BUILDING_FW_SKYCITY',				'YIELD_CULTURE',	'YIELD_GOLD',		10),
	('BUILDING_FW_SKYCITY',				'YIELD_CULTURE',	'YIELD_TOURISM',	10),
	('BUILDING_FW_BIONICTOWER',			'YIELD_SCIENCE',	'YIELD_GOLD',		10),
	('BUILDING_FW_BIONICTOWER',			'YIELD_SCIENCE',	'YIELD_TOURISM',	10);

INSERT INTO Building_HurryModifiersLocal
	(BuildingType, 					 HurryType,    HurryCostModifier)
VALUES
	('BUILDING_FW_BUENOSAIRESFORUM', 'HURRY_GOLD', -50);

------------------------
-- Flavors
------------------------
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_FW_APEX_CENTRE',  			'FLAVOR_RELIGION',      	10),
('BUILDING_FW_APEX_CENTRE',  			'FLAVOR_WONDER',      		25),
('BUILDING_FW_APEX_CENTRE',  			'FLAVOR_ESPIONAGE',      	35),
('BUILDING_FW_APEX_CENTRE',  			'FLAVOR_GREAT_PEOPLE',      35),
('BUILDING_FW_APEX_CENTRE',  			'FLAVOR_DIPLOMACY',      	80),
('BUILDING_FW_DIGITAL_EMANCIPATION',  	'FLAVOR_WONDER',      		25),
('BUILDING_FW_DIGITAL_EMANCIPATION',  	'FLAVOR_SCIENCE',      		35),
('BUILDING_FW_DIGITAL_EMANCIPATION',  	'FLAVOR_CULTURE',      		35),
('BUILDING_FW_DIGITAL_EMANCIPATION',  	'FLAVOR_PRODUCTION',      	35),
('BUILDING_FW_DIGITAL_EMANCIPATION',  	'FLAVOR_GOLD',      		35),
('BUILDING_FW_DIGITAL_EMANCIPATION',  	'FLAVOR_GREAT_PEOPLE',      50),
('BUILDING_FW_ENRICHMENT_CENTRE',  		'FLAVOR_TILE_IMPROVEMENT',  15),
('BUILDING_FW_ENRICHMENT_CENTRE',  		'FLAVOR_GOLD',      		15),
('BUILDING_FW_ENRICHMENT_CENTRE',  		'FLAVOR_EXPANSION',      	25),
('BUILDING_FW_ENRICHMENT_CENTRE',  		'FLAVOR_WONDER',      		25),
('BUILDING_FW_ENRICHMENT_CENTRE',  		'FLAVOR_GREAT_PEOPLE',      35),
('BUILDING_FW_ENRICHMENT_CENTRE',  		'FLAVOR_SCIENCE',      		20),
('BUILDING_FW_VIRTUAL_IDOL',  			'FLAVOR_WONDER',      		25),
('BUILDING_FW_VIRTUAL_IDOL',  			'FLAVOR_GREAT_PEOPLE',      25),
('BUILDING_FW_VIRTUAL_IDOL',  			'FLAVOR_HAPPINESS',      	25),
('BUILDING_FW_VIRTUAL_IDOL',  			'FLAVOR_CULTURE',      		80),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_SCIENCE',      		10),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_PRODUCTION',      	10),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_GOLD',      		10),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_RELIGION',      	10),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_WONDER',      		25),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_GREAT_PEOPLE',      35),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_DIPLOMACY',      	60),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_ESPIONAGE',      	65),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_CITY_DEFENSE',      10),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_GOLD',      		10),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_WONDER',      		25),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_EXPANSION',      	25),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_MILITARY_TRAINING', 40),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_CULTURE',      		50),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_SCIENCE',      		50),
('BUILDING_FW_MNEMOSYNE',  				'FLAVOR_WONDER',      		25),
('BUILDING_FW_MNEMOSYNE',  				'FLAVOR_OFFENSE',      		30),
('BUILDING_FW_MNEMOSYNE',  				'FLAVOR_RECON',      		25),
('BUILDING_FW_MNEMOSYNE',  				'FLAVOR_DEFENSE',      		25),
('BUILDING_FW_MNEMOSYNE',  				'FLAVOR_RANGED',      		25),
('BUILDING_FW_MNEMOSYNE',  				'FLAVOR_MILITARY_TRAINING', 75),
('BUILDING_FW_HELIOS',  				'FLAVOR_WONDER',      		25),
('BUILDING_FW_HELIOS',  				'FLAVOR_PRODUCTION',      	25),
('BUILDING_FW_HELIOS',  				'FLAVOR_SCIENCE',      		25),
('BUILDING_FW_HELIOS',  				'FLAVOR_GOLD',      		15),
('BUILDING_FW_HELIOS',  		    	'FLAVOR_TILE_IMPROVEMENT',  15),
('BUILDING_FW_HELIOS',  		        'FLAVOR_EXPANSION',      	25),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_WONDER',      		25),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_GREAT_PEOPLE',      25),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_PRODUCTION',      	10),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_GROWTH',      		10),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_HAPPINESS',      	15),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_TILE_IMPROVEMENT',  15),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_CULTURE',      		50),
('BUILDING_FW_GENOME_PROJECT',  		'FLAVOR_WONDER',      		25),
('BUILDING_FW_GENOME_PROJECT',  		'FLAVOR_GROWTH',      		40),
('BUILDING_FW_GENOME_PROJECT',  		'FLAVOR_GREAT_PEOPLE',      60),
('BUILDING_FW_GENOME_PROJECT',  		'FLAVOR_SCIENCE',      		50),
('BUILDING_FW_ANGELNET',  				'FLAVOR_WONDER',      		25),
('BUILDING_FW_ANGELNET',  				'FLAVOR_HAPPINESS',      	10),
('BUILDING_FW_ANGELNET',  				'FLAVOR_AIR',  				20),
('BUILDING_FW_ANGELNET',  				'FLAVOR_AIRLIFT',  			20),
('BUILDING_FW_ANGELNET',  				'FLAVOR_DEFENSE',      		70),
('BUILDING_FW_ANGELNET',  				'FLAVOR_CITY_DEFENSE',  	75),
('BUILDING_FW_SKYNET',  				'FLAVOR_WONDER',      		25),
('BUILDING_FW_SKYNET',  				'FLAVOR_MOBILE',      		25),
('BUILDING_FW_SKYNET',  				'FLAVOR_CITY_DEFENSE',      35),
('BUILDING_FW_SKYNET',  				'FLAVOR_DEFENSE',      		35),
('BUILDING_FW_SKYNET',  				'FLAVOR_RANGED',      		25),
('BUILDING_FW_SKYNET',  				'FLAVOR_OFFENSE',      		25),
('BUILDING_FW_SKYNET',  				'FLAVOR_WONDER',      		25),
('BUILDING_FW_SKYNET',  				'FLAVOR_PRODUCTION',      	10),
('BUILDING_FW_SKYNET',  				'FLAVOR_MILITARY_TRAINING', 65),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_WONDER',      		25),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_GREAT_PEOPLE',      5),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_SPACESHIP',      	10),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_GOLD',      		35),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_EXPANSION',      	5),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_MILITARY_TRAINING', 25),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_PRODUCTION',      	50),
('BUILDING_FW_ORBITAL_REFINERY',        'FLAVOR_MILITARY_TRAINING', 60),
('BUILDING_FW_SHANGHAI_WFC',  			'FLAVOR_WONDER',      		30),
('BUILDING_FW_SHANGHAI_WFC',  			'FLAVOR_GREAT_PEOPLE',      25),
('BUILDING_FW_SHANGHAI_WFC',  			'FLAVOR_CULTURE',      		50),
('BUILDING_FW_SHANGHAI_WFC',  			'FLAVOR_GOLD',      		60),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  'FLAVOR_WONDER',      		25),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  'FLAVOR_GREAT_PEOPLE',      20),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  'FLAVOR_RELIGION',      	40),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  'FLAVOR_SCIENCE',      		40),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  'FLAVOR_OFFENSE', 			10),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  'FLAVOR_PRODUCTION', 		10),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  'FLAVOR_MILITARY_TRAINING', 60),
('BUILDING_FW_SKYTREE',        			'FLAVOR_WONDER',      		25),
('BUILDING_FW_SKYTREE',        			'FLAVOR_TILE_IMPROVEMENT',  10),
('BUILDING_FW_SKYTREE',        			'FLAVOR_HAPPINESS',      	40),
('BUILDING_FW_SKYTREE',        			'FLAVOR_CULTURE',      		30),
('BUILDING_FW_SKYTREE',        			'FLAVOR_SCIENCE',      		10),
('BUILDING_FW_SKYTREE',        			'FLAVOR_GOLD',      		30),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_WONDER',      		25),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_GREAT_PEOPLE',      15),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_CITY_DEFENSE',      20),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_DEFENSE',      		15),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_HAPPINESS',      	20),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_CULTURE',      		30),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_GOLD',      		30),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_SCIENCE',      		30),
('BUILDING_FW_FLOATINGISLANDS',        	'FLAVOR_SCIENCE',      		15),
('BUILDING_FW_FLOATINGISLANDS',        	'FLAVOR_WONDER',      		25),
('BUILDING_FW_FLOATINGISLANDS',        	'FLAVOR_GREAT_PEOPLE',      30),
('BUILDING_FW_FLOATINGISLANDS', 		'FLAVOR_DEFENSE', 			35),
('BUILDING_FW_FLOATINGISLANDS', 		'FLAVOR_CITY_DEFENSE', 		40),
('BUILDING_FW_FLOATINGISLANDS',        	'FLAVOR_CULTURE',      		50),
('BUILDING_FW_FLOATINGISLANDS',        	'FLAVOR_GOLD',      		50),
('BUILDING_FW_FLOATINGISLANDS',        	'FLAVOR_NAVAL',      		80),

('BUILDING_FW_BIONICTOWER',        		'FLAVOR_GOLD',      		10),
('BUILDING_FW_BIONICTOWER',        		'FLAVOR_WONDER',      		25),
('BUILDING_FW_BIONICTOWER',        		'FLAVOR_GREAT_PEOPLE',      40),
('BUILDING_FW_BIONICTOWER',        		'FLAVOR_HAPPINESS',      	40),
('BUILDING_FW_BIONICTOWER',        		'FLAVOR_GROWTH',      		50),
('BUILDING_FW_BIONICTOWER',        		'FLAVOR_SCIENCE',      		60),
('BUILDING_FW_DATA_HAVEN',        		'FLAVOR_WONDER',      		25),
('BUILDING_FW_DATA_HAVEN',        		'FLAVOR_GREAT_PEOPLE',      25),
('BUILDING_FW_DATA_HAVEN',        		'FLAVOR_GOLD',      		45),
('BUILDING_FW_DATA_HAVEN',        		'FLAVOR_SCIENCE',      		50),
('BUILDING_FW_DATA_HAVEN',        		'FLAVOR_CULTURE',      		50),
('BUILDING_FW_SKYCITY',        			'FLAVOR_GOLD',      		10),
('BUILDING_FW_SKYCITY',        			'FLAVOR_WONDER',      		25),
('BUILDING_FW_SKYCITY',        			'FLAVOR_RELIGION',      	20),
('BUILDING_FW_SKYCITY',        			'FLAVOR_GREAT_PEOPLE',      40),
('BUILDING_FW_SKYCITY',        			'FLAVOR_HAPPINESS',      	30),
('BUILDING_FW_SKYCITY',        			'FLAVOR_CULTURE',      		60),
('BUILDING_FW_ULTIMATOWER',        		'FLAVOR_GOLD',      		10),
('BUILDING_FW_ULTIMATOWER',        		'FLAVOR_WONDER',      		25),
('BUILDING_FW_ULTIMATOWER',        		'FLAVOR_GREAT_PEOPLE',      40),
('BUILDING_FW_ULTIMATOWER',        		'FLAVOR_HAPPINESS',      	40),
('BUILDING_FW_ULTIMATOWER',        		'FLAVOR_GROWTH',      		50),
('BUILDING_FW_ULTIMATOWER',        		'FLAVOR_PRODUCTION',      	60),
('BUILDING_FW_BUENOSAIRESFORUM',        'FLAVOR_CULTURE',      		10),
('BUILDING_FW_BUENOSAIRESFORUM',        'FLAVOR_WONDER',      		25),
('BUILDING_FW_BUENOSAIRESFORUM',        'FLAVOR_GREAT_PEOPLE',      40),
('BUILDING_FW_BUENOSAIRESFORUM',        'FLAVOR_HAPPINESS',   		55),
('BUILDING_FW_BUENOSAIRESFORUM',        'FLAVOR_GOLD',      		60),

('BUILDING_FW_NANO_INSTITUTE',        	'FLAVOR_SPACESHIP',      	10),
('BUILDING_FW_NANO_INSTITUTE',        	'FLAVOR_WONDER',      		25),
('BUILDING_FW_NANO_INSTITUTE',        	'FLAVOR_OFFENSE', 			40),
('BUILDING_FW_NANO_INSTITUTE',        	'FLAVOR_DEFENSE', 			40),
('BUILDING_FW_NANO_INSTITUTE',        	'FLAVOR_MILITARY_TRAINING', 50),
('BUILDING_FW_NANO_INSTITUTE',        	'FLAVOR_PRODUCTION',      	55),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_GREAT_PEOPLE',      5),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_WONDER',            25),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_PRODUCTION',        15),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_HAPPINESS',        	35),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_DEFENSE',        	35),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_CITY_DEFENSE',      55),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_SCIENCE',           15),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_GOLD',              15);
