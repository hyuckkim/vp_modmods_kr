----------------------------------------------------
-- Generic info
----------------------------------------------------
INSERT INTO Buildings (Type, PrereqTech, Cost, ArtDefineTag, PortraitIndex, IconAtlas, NukeImmune, NumPoliciesNeeded, WonderSplashImage, WonderSplashAnchor) VALUES
('BUILDING_FW_SKYTREE',     	  	 	'TECH_GLOBALIZATION',                 3250, 'ART_DEF_BUILDING_LABORATORY',   0,'BW_ATLAS_SKYTREE', 	  		1, 28, 		'SkyTree_splash.dds', 				'R,T'),
('BUILDING_FW_GENE_VAULT', 				'TECH_ECOGENETICS',                   3500, 'ART_DEF_BUILDING_LABORATORY',  42,'CIV_COLOR_ATLAS_FW_3',  	1, 28, 		'GeneVault_Splash.dds',		 		'L,T'),
('BUILDING_FW_SHANGHAI_WFC', 		    'TECH_GRID_COMPUTING', 	              3500, 'ART_DEF_BUILDING_LABORATORY',   1,'BW_ATLAS_CHINESE_NEW_YEAR', 1, 28, 		'SHANGHAI_WFC_splash.dds', 			'L,T'),
('BUILDING_FW_VIRTUAL_IDOL', 			'TECH_METAVERSE',                     3500, 'ART_DEF_BUILDING_LABORATORY',  17,'CIV_COLOR_ATLAS_FW_3',   	1, 28, 		'VirtualIdol_Splash.dds',		 	'L,T'),
('BUILDING_FW_NANO_INSTITUTE',    	 	'TECH_NANOMATERIALS',                 3500, 'ART_DEF_BUILDING_LABORATORY',  17,'CIV_COLOR_ATLAS_FW_2',  	1, 28, 		'SkyTree_splash_a.dds', 			'L,T'),
('BUILDING_FW_EDEN_PROJECT', 			'TECH_ARTIFICIAL_ENVIRONMENTS',       3500, 'ART_DEF_BUILDING_LABORATORY',  51,'TCS_MOD_ICON_ATLAS',    	1, 28, 		'EdenProject_Splash.dds',		 	'L,T'),
('BUILDING_FW_APEX_CENTRE',     	 	'TECH_BIOMEDICAL',                    4000, 'ART_DEF_BUILDING_LABORATORY',  39,'CIV_COLOR_ATLAS_FW_3',  	1, 28, 		'ApexCentre_Splash.dds', 			'L,T'),
('BUILDING_FW_DATA_HAVEN', 	  	  	 	'TECH_GENERATIVE_AI',                 4000, 'ART_DEF_BUILDING_LABORATORY',   3,'CIV_COLOR_ATLAS_FW_2',  	1, 29, 		'DataHaven_Splash.dds', 			'R,B'),
('BUILDING_FW_JURASSIC_PARK',     	 	'TECH_SYNTHETIC_BIOLOGY',             4250, 'ART_DEF_BUILDING_LABORATORY',   5,'CIV_COLOR_ATLAS_FW_3',  	1, 29, 		'JurassicPark_Splash.dds', 			'L,T'),
('BUILDING_FW_ENRICHMENT_CENTRE', 		'TECH_ADVANCED_MATERIALS',            4250, 'ART_DEF_BUILDING_LABORATORY',   7,'CIV_COLOR_ATLAS_FW_3',  	1, 28, 		'EnrichmentCentre_Splash.dds',		'L,T'),
('BUILDING_FW_SKYHOOK', 				'TECH_ASTRODYNAMICS',                 4250, 'ART_DEF_BUILDING_LABORATORY',  23,'CIV_COLOR_ATLAS_FW_3',  	1, 29, 		'Skyhook_Splash.dds',		 		'L,T'),
('BUILDING_FW_PHOLUS_MUTAGEN', 			'TECH_TRANSGENICS',                   4500, 'ART_DEF_BUILDING_LABORATORY',  26,'CIV_COLOR_ATLAS_FW_2',  	1, 29, 		'PholusMutagen_Splash.dds',		 	'L,T'),
('BUILDING_FW_SHIMIZUMCP', 		  	 	'TECH_AUTONOMOUS_SYSTEMS',            4500, 'ART_DEF_BUILDING_LABORATORY',  16,'CIV_COLOR_ATLAS_FW_2',  	1, 30, 		'FWShimizuMCP_Splash.dds', 			'L,T'),
('BUILDING_FW_LAPUTA',   	 	        'TECH_ARCOLOGIES',                    4500, 'ART_DEF_BUILDING_LABORATORY',  44,'TCS_MOD_ICON_ATLAS',     	1, 30, 		'FWLaputa_Splash.dds', 	'L,T'),
('BUILDING_FW_HIVE',                    'TECH_GENGINEERING',                  4750, 'ART_DEF_BUILDING_LABORATORY',  41,'TCS_MOD_ICON_ATLAS', 	    1, 30, 		'HiveCity_Splash.dds', 	        'L,T'),
('BUILDING_FW_MNEMOSYNE', 				'TECH_QUANTUM_SYNC',    	          4750, 'ART_DEF_BUILDING_LABORATORY',  45,'CIV_COLOR_ATLAS_FW_2',  	1, 30, 		'Mnemosyne_Splash.dds',		 		'L,T'),
('BUILDING_FW_SKYNET', 					'TECH_AGI', 	  		 	          4750, 'ART_DEF_BUILDING_LABORATORY',  32,'CIV_COLOR_ATLAS_FW_3',  	1, 30, 		'Skynet_Splash.dds',		 		'L,T'),
('BUILDING_FW_GLOBAL_POWERGRID', 		'TECH_NUCLEAR_FUSION',                4750, 'ART_DEF_BUILDING_LABORATORY',  47,'TCS_MOD_ICON_ATLAS',     	1, 30, 		'Nuclearfusion_Splash.dds',		 	'L,T'),
('BUILDING_FW_ORBITAL_REFINERY', 		'TECH_SPACE_HABITATS',                4750, 'ART_DEF_BUILDING_LABORATORY',  57,'CIV_COLOR_ATLAS_FW_2',  	1, 30, 		'OrbitalRefinery_Splash.dds', 		'L,T'),
('BUILDING_FW_CREATION_ORATORIUM', 	  	'TECH_GENETIC_ACCELERATION',          5000, 'ART_DEF_BUILDING_LABORATORY',  38,'TCS_MOD_ICON_ATLAS', 	    1, 32, 		'CreationOratorium_Splash.dds', 		'R,T'),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE', 	'TECH_HUMAN_AUGMENTATION',            5000, 'ART_DEF_BUILDING_LABORATORY',  16,'CIV_COLOR_ATLAS_FW_3',   	1, 32, 		'NephilimGeneTemplate_Splash.dds', 	'L,T'),
('BUILDING_FW_DIGITAL_EMANCIPATION', 	'TECH_DIGITAL_SOCIETY',               5000, 'ART_DEF_BUILDING_LABORATORY',  43,'CIV_COLOR_ATLAS_FW_2', 	    1, 32, 		'DigitalEmancipation_Splash.dds',	'L,T'),
('BUILDING_FW_ANGELNET', 				'TECH_SMART_MATERIALS',               5000, 'ART_DEF_BUILDING_LABORATORY',  38,'CIV_COLOR_ATLAS_FW_2', 	    1, 32, 		'Angelnet_Splash.dds',		 		'L,T'),
('BUILDING_FW_CITADEL_STATION', 		'TECH_ENERGY_THEORY',                 5000, 'ART_DEF_BUILDING_LABORATORY',   6,'CIV_COLOR_ATLAS_FW_3', 	    1, 32, 		'CitadelStation_Splash.dds',		'R,T'),
('BUILDING_FW_ULTIMATOWER', 	  	 	'TECH_HYPERSTRUCTURES',               5000, 'ART_DEF_BUILDING_LABORATORY',  49,'CIV_COLOR_ATLAS_FW_2', 	    1, 32, 		'FWUltimaTower_Splash.dds', 		'L,T'),
('BUILDING_FW_BIONICTOWER', 	  	 	'TECH_HYPERSTRUCTURES',               5000, 'ART_DEF_BUILDING_LABORATORY',  29,'CIV_COLOR_ATLAS_FW_2',	    1, 32, 		'FWBionicTower_Splash.dds', 		'C,T'),
('BUILDING_FW_BUENOSAIRESFORUM',  	 	'TECH_HYPERSTRUCTURES',               5000, 'ART_DEF_BUILDING_LABORATORY',  47,'CIV_COLOR_ATLAS_FW_2',   	1, 32, 		'FWBuenosAiresForum_Splash.dds',	'L,T'),
('BUILDING_FW_GENOME_PROJECT', 			NULL,    			              		-1, 'ART_DEF_BUILDING_LABORATORY',  21,'CIV_COLOR_ATLAS_FW_3', 	    1, NULL, 	'GenomeProject_Splash.dds',		 	'L,T'),
('BUILDING_FW_AI_DATANETWORK', 			NULL,    			              		-1, 'ART_DEF_BUILDING_LABORATORY',  32,'TCS_MOD_ICON_ATLAS', 	    1, NULL, 	'AInetworkProject_Splash.dds',		'L,T'),
('BUILDING_FW_DEEP_RESOURCE', 		NULL,    								-1, 'ART_DEF_BUILDING_LABORATORY',   9,'TCS_MOD_ICON_ATLAS',     	1, NULL, 	'AsteroidMining_Splash.dds',		'L,T');


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
'BUILDING_FW_CREATION_ORATORIUM',
'BUILDING_FW_DATA_HAVEN',
'BUILDING_FW_BIONICTOWER',
'BUILDING_FW_LAPUTA',
'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',
'BUILDING_FW_HIVE',

'BUILDING_FW_SHANGHAI_WFC',
'BUILDING_FW_ORBITAL_REFINERY',
'BUILDING_FW_SKYNET',
'BUILDING_FW_ANGELNET',
'BUILDING_FW_GENOME_PROJECT',
'BUILDING_FW_AI_DATANETWORK',
'BUILDING_FW_GENE_VAULT',
'BUILDING_FW_EDEN_PROJECT',
'BUILDING_FW_SKYHOOK',
'BUILDING_FW_MNEMOSYNE',
'BUILDING_FW_GLOBAL_POWERGRID',
'BUILDING_FW_PHOLUS_MUTAGEN',
'BUILDING_FW_CITADEL_STATION',
'BUILDING_FW_VIRTUAL_IDOL',
'BUILDING_FW_ENRICHMENT_CENTRE',
'BUILDING_FW_DIGITAL_EMANCIPATION',
'BUILDING_FW_DEEP_RESOURCE');

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
'BUILDING_FW_CREATION_ORATORIUM',
'BUILDING_FW_DATA_HAVEN',
'BUILDING_FW_BIONICTOWER',
'BUILDING_FW_LAPUTA',
'BUILDING_FW_NEPHILIM_GENE_TEMPLATE',
'BUILDING_FW_HIVE',

'BUILDING_FW_SHANGHAI_WFC',
'BUILDING_FW_ORBITAL_REFINERY',
'BUILDING_FW_SKYNET',
'BUILDING_FW_ANGELNET',
'BUILDING_FW_GENOME_PROJECT',
'BUILDING_FW_AI_DATANETWORK',
'BUILDING_FW_GENE_VAULT',
'BUILDING_FW_EDEN_PROJECT',
'BUILDING_FW_SKYHOOK',
'BUILDING_FW_MNEMOSYNE',
'BUILDING_FW_GLOBAL_POWERGRID',
'BUILDING_FW_PHOLUS_MUTAGEN',
'BUILDING_FW_CITADEL_STATION',
'BUILDING_FW_VIRTUAL_IDOL',
'BUILDING_FW_ENRICHMENT_CENTRE',
'BUILDING_FW_DIGITAL_EMANCIPATION',
'BUILDING_FW_DEEP_RESOURCE');

----------------------------------------------
-- CERN Changed
----------------------------------------------
UPDATE Buildings
SET MinorFriendshipChange = 30
WHERE Type = 'BUILDING_CERN'; 

----------------------------------------------
-- Skytree
----------------------------------------------
UPDATE Buildings
SET Happiness = 3
WHERE Type = 'BUILDING_FW_SKYTREE';

--------------------------------------------
-- HUBBLE
--------------------------------------------
-- Move Hubble
UPDATE Buildings
SET PrereqTech = 'TECH_SPACE_EXPLORE', Cost = 3250
WHERE Type = 'BUILDING_HUBBLE';

----------------------------------------------
-- Gene Vault
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_WRITER', SpecialistCount = 1, GreatPeopleRateChange = 2, TechEnhancedTourism = 5, Happiness = 2, LandmarksTourismPercent = 50, GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 2, ThemingBonusHelp = 'TXT_KEY_GENE_VAULT_THEMING_BONUS_HELP', MutuallyExclusiveGroup = 84524
WHERE Type = 'BUILDING_FW_GENE_VAULT';

----------------------------------------------
-- Shanghai Tower
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 2, PovertyFlatReductionGlobal = 5, FinishLandTRTourism = 5, FinishSeaTRTourism = 5
WHERE Type = 'BUILDING_FW_SHANGHAI_WFC';

----------------------------------------------
-- Virtual Idol
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MUSICIAN', SpecialistCount = 2, GreatPeopleRateChange = 2, Happiness = 2, GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC', GreatWorkCount = 2, GreatWorksTourismModifier = 50, CultureRateModifier = 10, ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_FW_VIRTUAL_IDOL_HELP'
WHERE Type = 'BUILDING_FW_VIRTUAL_IDOL';

----------------------------------------------
-- Nano Institute
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2, FreeBuildingThisCity = 'BUILDINGCLASS_FW_NANOFORGE'
WHERE Type = 'BUILDING_FW_NANO_INSTITUTE';

----------------------------------------------
-- Eden Project
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 1, GreatPeopleRateChange = 2, TechEnhancedTourism = 5, Happiness = 2, LandmarksTourismPercent = 50, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 2, ThemingBonusHelp = 'TXT_KEY_GENE_VAULT2_THEMING_BONUS_HELP', MutuallyExclusiveGroup = 84524
WHERE Type = 'BUILDING_FW_EDEN_PROJECT';

--------------------------------------------
-- Apex Centre
--------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_CIVIL_SERVANT', SpecialistCount = 2, GreatPeopleRateChange = 2, EspionageModifier = -25
WHERE Type = 'BUILDING_FW_APEX_CENTRE';

INSERT INTO Building_YieldFromSpyAttack
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_APEX_CENTRE', 	'YIELD_FAITH', 	 100);
----------------------------------------------
-- Data Haven
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 2, NearbyTerrainRequired = 'TERRAIN_TUNDRA'
WHERE Type = 'BUILDING_FW_DATA_HAVEN';

----------------------------------------------
-- Jurassic Park
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MERCHANT', GreatPeopleRateChange = 2, TechEnhancedTourism = 3, Happiness = 2, BorderObstacle = 1, FreeBuildingThisCity = 'BUILDINGCLASS_FW_CLONE_LAB', Defense = 1250, ExtraCityHitPoints = 50
WHERE Type = 'BUILDING_FW_JURASSIC_PARK';

----------------------------------------------
-- Enrichment Centre
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 2, GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_FW_ENRICHMENT_CENTRE';
----------------------------------------------
-- Helios
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2, FreeBuildingThisCity = 'BUILDINGCLASS_FW_SOLAR_REFLECTOR'
WHERE Type = 'BUILDING_FW_SKYHOOK';

----------------------------------------------
-- Pholus Mutagen
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 2, TrainedFreePromotion = 'PROMOTION_FW_MUTATION'
WHERE Type = 'BUILDING_FW_PHOLUS_MUTAGEN';

----------------------------------------------
-- Shimizumcp
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2, Water = 1, ExtraCityHitPoints = 150, Defense = 2000, DeepWaterTileDamage = 5, BorderObstacleWater = 1, MinAreaSize = 10
WHERE Type = 'BUILDING_FW_SHIMIZUMCP';

----------------------------------------------
-- Floating Islands
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MERCHANT',  GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_FW_LAPUTA';

----------------------------------------------
-- Floating Islands Dummy
----------------------------------------------
INSERT INTO Buildings (Type, BuildingClass, Cost, Description, ArtDefineTag, MinAreaSize, IconAtlas, PortraitIndex, NeverCapture, GreatWorkCount, FaithCost, NukeImmune) VALUES
('BUILDING_FW_LAPUTA_DUMMY', 'BUILDINGCLASS_FW_LAPUTA_DUMMY', -1, 'TXT_KEY_BUILDING_FW_LAPUTA_DUMMY', 'NONE', -1, 'BW_ATLAS_1', 19, 1, -1, -1, 1);
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description) VALUES
('BUILDINGCLASS_FW_LAPUTA_DUMMY','BUILDING_FW_LAPUTA_DUMMY','TXT_KEY_BUILDING_FW_LAPUTA_DUMMY');
UPDATE Buildings SET ExtraCityHitPoints = 50, Defense = 1000, CitySupplyFlat = 1 WHERE Type = 'BUILDING_FW_LAPUTA_DUMMY';

----------------------------------------------
-- Nephilim Gene Template2 (HIVE)
----------------------------------------------
UPDATE Buildings
SET Happiness = 2, FreeBuildingThisCity = 'BUILDINGCLASS_FW_DISTRIBUTION_HUB', FreePromotion = 'PROMOTION_FW_PREDATOR', MutuallyExclusiveGroup = 23497
WHERE Type = 'BUILDING_FW_HIVE';

----------------------------------------------
-- Mnemosyne
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 2, TrainedFreePromotion = 'PROMOTION_MNEMOSYNE_EXPERIENCE'
WHERE Type = 'BUILDING_FW_MNEMOSYNE';

----------------------------------------------
-- Nuclear Fusion network
----------------------------------------------
UPDATE Buildings
SET MinorFriendshipChange = 100, FreeBuildingThisCity = 'BUILDINGCLASS_FW_FUSION_PLANT'
WHERE Type = 'BUILDING_FW_GLOBAL_POWERGRID';

----------------------------------------------
-- Skynet
----------------------------------------------
UPDATE Buildings
SET FreePromotion = 'PROMOTION_FW_SKYNET_LINK', FreeBuildingThisCity = 'BUILDINGCLASS_FW_SIMULATION_HUB', Defense = 3000, ExtraCityHitPoints = 150, MutuallyExclusiveGroup = 23497
WHERE Type = 'BUILDING_FW_SKYNET';

----------------------------------------------
-- Orbital Refinery
----------------------------------------------
UPDATE Buildings
SET DistressFlatReduction = 1, NoUnhappfromXSpecialists = 1, FreePromotion = 'PROMOTION_FW_SPACESPECIALIST', FreeBuildingThisCity = 'BUILDINGCLASS_FW_METROPLEX_HUB', MutuallyExclusiveGroup = 23497
WHERE Type = 'BUILDING_FW_ORBITAL_REFINERY';

----------------------------------------------
-- Sky City => Genesis ortorium changed
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MUSICIAN', SpecialistCount = 2, GreatPeopleRateChange = 2, GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC', GreatWorkCount = 2, ThemingBonusHelp = 'TXT_KEY_CREATION_ORATORIUM_THEMING_BONUS_HELP', Happiness = 7
WHERE Type = 'BUILDING_FW_CREATION_ORATORIUM';

----------------------------------------------
-- Nephilim Gene Template
----------------------------------------------
UPDATE Buildings
SET Happiness = 2, FreeBuildingThisCity = 'BUILDINGCLASS_FW_BIRTHING_PODS'
WHERE Type = 'BUILDING_FW_NEPHILIM_GENE_TEMPLATE';

----------------------------------------------
-- Digital Emancipation
----------------------------------------------
UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_FW_BRAIN_UPLOADING', GlobalGreatPeopleRateModifier = 30, FreeGreatPeople = 1, LocalPopRequired = 70
WHERE Type = 'BUILDING_FW_DIGITAL_EMANCIPATION';

----------------------------------------------
-- Angelnet
----------------------------------------------
UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_FW_UTILITY_FOG', Defense = 5000, AllowsRangeStrike = 1, ExtraCityHitPoints = 200, NukeModifier = -20, Happiness = 3
WHERE Type = 'BUILDING_FW_ANGELNET';

----------------------------------------------
-- Citadel Station
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_CIVIL_SERVANT', SpecialistCount = 3, GreatPeopleRateChange = 2, EspionageModifier = -15, GlobalEspionageModifier = -15, ExtraSpies = 2, Espionage = 1
WHERE Type = 'BUILDING_FW_CITADEL_STATION';

INSERT INTO Building_YieldFromSpyAttack
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_CITADEL_STATION', 'YIELD_FAITH',   100),
	('BUILDING_FW_CITADEL_STATION', 'YIELD_SCIENCE', 100),
	('BUILDING_FW_CITADEL_STATION', 'YIELD_GOLD', 	 100);

----------------------------------------------
-- Ultimate Tower
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 2, GreatPeopleRateChange = 5, PolicyType = 'POLICY_EXPLORATION_FINISHER'
WHERE Type = 'BUILDING_FW_ULTIMATOWER';

----------------------------------------------
-- Bionic Tower
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 2, GreatPeopleRateChange = 5, PolicyType = 'POLICY_RATIONALISM_FINISHER'
WHERE Type = 'BUILDING_FW_BIONICTOWER';

----------------------------------------------
-- Buenos Aires Forum
----------------------------------------------
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 2, GreatPeopleRateChange = 5, GoldenAge = 1, GoldenAgeModifier = 50, PolicyType = 'POLICY_COMMERCE_FINISHER'
WHERE Type = 'BUILDING_FW_BUENOSAIRESFORUM';

----------------------------------------------
-- Genome Project
----------------------------------------------
UPDATE Buildings
SET UnlockedByLeague = 1, SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 3
WHERE Type = 'BUILDING_FW_GENOME_PROJECT';

----------------------------------------------
-- AI Singularity
----------------------------------------------
UPDATE Buildings
SET UnlockedByLeague = 1,  FreeGreatPeople = 1, SpecialistType = 'SPECIALIST_MERCHANT', GreatPeopleRateChange = 3
WHERE Type = 'BUILDING_FW_AI_DATANETWORK';

----------------------------------------------
-- Ceres Station
----------------------------------------------
UPDATE Buildings
SET UnlockedByLeague = 1, SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 3
WHERE Type = 'BUILDING_FW_DEEP_RESOURCE';

----------------------------------------------
-- Project Utopia - Citizen Earth Protocol - Cultural Victory
----------------------------------------------
UPDATE Projects
SET Cost = 42000, TechPrereq = 'TECH_COMPUTRONIUM'
WHERE Type = 'PROJECT_UTOPIA_PROJECT';

--==================================================================
INSERT INTO Building_ThemingYieldBonus 
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_CREATION_ORATORIUM',     'YIELD_GOLDEN_AGE_POINTS',  5),
	('BUILDING_FW_CREATION_ORATORIUM',     'YIELD_FAITH',			    5),
	('BUILDING_FW_GENE_VAULT',  'YIELD_FAITH',			    4),
	('BUILDING_FW_VIRTUAL_IDOL','YIELD_CULTURE',            8),
	('BUILDING_FW_GENE_VAULT',  'YIELD_GOLDEN_AGE_POINTS',  4),
	('BUILDING_FW_EDEN_PROJECT', 'YIELD_SCIENCE',		    4),
	('BUILDING_FW_EDEN_PROJECT', 'YIELD_GOLDEN_AGE_POINTS',  4);

INSERT INTO Building_ThemingBonuses
	(BuildingType, Description, Bonus, RequiresOwner, AIPriority, SameEra, RequiresSamePlayer)
VALUES 
 	('BUILDING_FW_GENE_VAULT',   'TXT_KEY_THEMING_BONUS_GENE_VAULT', 	     8, 1, 5, 0, 0),
	('BUILDING_FW_VIRTUAL_IDOL', 'TXT_KEY_THEMING_BONUS_FW_VIRTUAL_IDOL',    8, 0, 5, 1, 1),
	('BUILDING_FW_EDEN_PROJECT',  'TXT_KEY_THEMING_BONUS_GENE_VAULT2',   	 8, 1, 5, 0, 0),
	('BUILDING_FW_CREATION_ORATORIUM', 	 'TXT_KEY_THEMING_BONUS_CREATION_ORATORIUM', 		     8, 1, 5, 0, 0);

----------------------------------------------
-- Yield Changes
----------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_FW_SKYTREE',  					'YIELD_CULTURE', 		2),
('BUILDING_FW_SKYTREE',  					'YIELD_GOLD', 			3),
('BUILDING_FW_SHANGHAI_WFC',  				'YIELD_CULTURE', 		1),
('BUILDING_FW_NANO_INSTITUTE',  			'YIELD_PRODUCTION', 	6),
('BUILDING_FW_DATA_HAVEN',  				'YIELD_CULTURE', 		2),
('BUILDING_FW_DATA_HAVEN',  				'YIELD_SCIENCE', 		2),
('BUILDING_FW_DATA_HAVEN',  				'YIELD_PRODUCTION', 	2),
('BUILDING_FW_JURASSIC_PARK',  				'YIELD_CULTURE', 		2),
('BUILDING_FW_JURASSIC_PARK',  				'YIELD_SCIENCE', 		4),
('BUILDING_FW_JURASSIC_PARK',  				'YIELD_GOLD', 			6),
('BUILDING_FW_ENRICHMENT_CENTRE',  		    'YIELD_SCIENCE', 	    8),
('BUILDING_FW_SKYHOOK',  		        	'YIELD_PRODUCTION', 	8),
('BUILDING_FW_SHIMIZUMCP',  				'YIELD_PRODUCTION', 	8),
('BUILDING_FW_SHIMIZUMCP',  				'YIELD_GOLD', 	        8),
('BUILDING_FW_SHIMIZUMCP',  				'YIELD_SCIENCE', 	    8),
('BUILDING_FW_LAPUTA',  		        	'YIELD_SCIENCE', 		5),
('BUILDING_FW_LAPUTA',  		         	'YIELD_CULTURE', 		3),
('BUILDING_FW_LAPUTA',  		        	'YIELD_GOLD', 			2),
('BUILDING_FW_SKYNET',  					'YIELD_PRODUCTION', 	4),
('BUILDING_FW_SKYNET',  					'YIELD_SCIENCE', 		3),
('BUILDING_FW_ORBITAL_REFINERY',  			'YIELD_GOLD', 			3),
('BUILDING_FW_ORBITAL_REFINERY',  			'YIELD_PRODUCTION', 	5),
('BUILDING_FW_CREATION_ORATORIUM',  		'YIELD_CULTURE', 		6),
('BUILDING_FW_CREATION_ORATORIUM',  		'YIELD_FAITH', 			4),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  	'YIELD_CULTURE', 		1),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  	'YIELD_FAITH', 			8),
('BUILDING_FW_BIONICTOWER',  				'YIELD_SCIENCE', 		5),
('BUILDING_FW_BIONICTOWER',  				'YIELD_CULTURE', 		1),
('BUILDING_FW_ULTIMATOWER',  				'YIELD_CULTURE', 		1),
('BUILDING_FW_ULTIMATOWER',  				'YIELD_PRODUCTION', 	5),
('BUILDING_FW_BUENOSAIRESFORUM',  			'YIELD_CULTURE', 		1),
('BUILDING_FW_BUENOSAIRESFORUM',  			'YIELD_GOLD', 			5);

INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield) VALUES
('BUILDING_FW_ENRICHMENT_CENTRE', 					'YIELD_SCIENCE', 	10),
('BUILDING_FW_SKYHOOK', 				            'YIELD_PRODUCTION',	10),
('BUILDING_FW_CREATION_ORATORIUM',  				'YIELD_FAITH', 		50),
('BUILDING_FW_CREATION_ORATORIUM',  			    'YIELD_CULTURE', 	50),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE', 				'YIELD_PRODUCTION', 50),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE', 				'YIELD_SCIENCE', 	50);

------------------------
-- Building_SpecialistYieldChangesLocal
------------------------
INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_FW_CITADEL_STATION',				'SPECIALIST_CIVIL_SERVANT',	'YIELD_SCIENCE',			2),
	('BUILDING_FW_CITADEL_STATION',				'SPECIALIST_CIVIL_SERVANT',	'YIELD_GOLD',				2),
	('BUILDING_FW_CITADEL_STATION',				'SPECIALIST_CIVIL_SERVANT',	'YIELD_PRODUCTION',			2),
	('BUILDING_FW_CITADEL_STATION', 	        'SPECIALIST_SCIENTIST', 	'YIELD_SCIENCE', 	        1),
	('BUILDING_FW_CITADEL_STATION', 	        'SPECIALIST_ENGINEER', 		'YIELD_PRODUCTION',         1),
	('BUILDING_FW_CITADEL_STATION', 	        'SPECIALIST_MERCHANT', 		'YIELD_GOLD', 		        1),
	('BUILDING_FW_CITADEL_STATION', 	        'SPECIALIST_MUSICIAN', 		'YIELD_CULTURE', 	        1),
	('BUILDING_FW_CITADEL_STATION',          	'SPECIALIST_ARTIST', 		'YIELD_CULTURE', 	        1),
	('BUILDING_FW_CITADEL_STATION', 	        'SPECIALIST_WRITER', 		'YIELD_CULTURE', 	        1),
	('BUILDING_FW_CITADEL_STATION', 	        'SPECIALIST_CIVIL_SERVANT',	'YIELD_CULTURE',	        1),
	('BUILDING_FW_ULTIMATOWER', 				'SPECIALIST_SCIENTIST', 	'YIELD_FOOD',				2),
	('BUILDING_FW_ULTIMATOWER', 				'SPECIALIST_ENGINEER', 		'YIELD_FOOD',	 			2),
	('BUILDING_FW_ULTIMATOWER', 				'SPECIALIST_MERCHANT', 		'YIELD_FOOD',				2),
	('BUILDING_FW_ULTIMATOWER',					'SPECIALIST_WRITER',		'YIELD_FOOD',				2),
	('BUILDING_FW_ULTIMATOWER',					'SPECIALIST_ARTIST',		'YIELD_FOOD',				2),
	('BUILDING_FW_ULTIMATOWER',					'SPECIALIST_MUSICIAN',		'YIELD_FOOD',				2),
	('BUILDING_FW_ULTIMATOWER',					'SPECIALIST_CIVIL_SERVANT',	'YIELD_FOOD',				2),
	('BUILDING_FW_ULTIMATOWER', 				'SPECIALIST_SCIENTIST', 	'YIELD_PRODUCTION',			2),
	('BUILDING_FW_ULTIMATOWER', 				'SPECIALIST_ENGINEER', 		'YIELD_PRODUCTION',	 		2),
	('BUILDING_FW_ULTIMATOWER', 				'SPECIALIST_MERCHANT', 		'YIELD_PRODUCTION',			2),
	('BUILDING_FW_ULTIMATOWER',					'SPECIALIST_WRITER',		'YIELD_PRODUCTION',			2),
	('BUILDING_FW_ULTIMATOWER',					'SPECIALIST_ARTIST',		'YIELD_PRODUCTION',			2),
	('BUILDING_FW_ULTIMATOWER',					'SPECIALIST_MUSICIAN',		'YIELD_PRODUCTION',			2),
	('BUILDING_FW_ULTIMATOWER',					'SPECIALIST_CIVIL_SERVANT',	'YIELD_PRODUCTION',			2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_SCIENTIST',		'YIELD_FOOD',				2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_ENGINEER',		'YIELD_FOOD',				2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_MERCHANT',		'YIELD_FOOD',				2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_WRITER',		'YIELD_FOOD',				2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_ARTIST',		'YIELD_FOOD',				2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_MUSICIAN',		'YIELD_FOOD',				2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_CIVIL_SERVANT',	'YIELD_FOOD',				2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_SCIENTIST',		'YIELD_SCIENCE',			2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_ENGINEER',		'YIELD_SCIENCE',			2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_MERCHANT',		'YIELD_SCIENCE',			2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_WRITER',		'YIELD_SCIENCE',			2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_ARTIST',		'YIELD_SCIENCE',			2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_MUSICIAN',		'YIELD_SCIENCE',			2),
	('BUILDING_FW_BIONICTOWER',					'SPECIALIST_CIVIL_SERVANT',	'YIELD_SCIENCE',			2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_SCIENTIST',		'YIELD_GOLD',				2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_ENGINEER',		'YIELD_GOLD',				2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_MERCHANT',		'YIELD_GOLD',				2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_WRITER',		'YIELD_GOLD',				2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_ARTIST',		'YIELD_GOLD',				2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_MUSICIAN',		'YIELD_GOLD',				2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_CIVIL_SERVANT',	'YIELD_GOLD',				2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_SCIENTIST',		'YIELD_GOLDEN_AGE_POINTS',	2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_ENGINEER',		'YIELD_GOLDEN_AGE_POINTS',	2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_MERCHANT',		'YIELD_GOLDEN_AGE_POINTS',	2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_WRITER',		'YIELD_GOLDEN_AGE_POINTS',	2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_ARTIST',		'YIELD_GOLDEN_AGE_POINTS',	2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_MUSICIAN',		'YIELD_GOLDEN_AGE_POINTS',	2),
	('BUILDING_FW_BUENOSAIRESFORUM',			'SPECIALIST_CIVIL_SERVANT',	'YIELD_GOLDEN_AGE_POINTS',	2),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_CIVIL_SERVANT',	'YIELD_CULTURE',			1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_ARTIST',		'YIELD_CULTURE',			1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_WRITER',		'YIELD_CULTURE',			1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_MUSICIAN',		'YIELD_CULTURE',			1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_SCIENTIST',		'YIELD_SCIENCE',			1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_MERCHANT',		'YIELD_GOLD',				1),
	('BUILDING_FW_GENOME_PROJECT',				'SPECIALIST_ENGINEER',		'YIELD_PRODUCTION',			1);


----------------------------------------------------
-- Promotions' unique features
----------------------------------------------------
INSERT INTO Unit_ProductionModifierBuildings 
	(UnitType,	BuildingType,	ProductionModifier) 
VALUES
	('UNIT_FW_BIOINFANTRY', 		       'BUILDING_FW_HIVE',                    10),
	('UNIT_FW_CLONETROOPER', 		       'BUILDING_FW_HIVE',                    10),
	('UNIT_FW_BIOTROOPER', 		           'BUILDING_FW_HIVE',                    10),
	('UNIT_FW_SUPERSOLDIERS', 		       'BUILDING_FW_HIVE',                    10),
	('UNIT_FW_SWARM', 				       'BUILDING_FW_HIVE',                    10),
	('UNIT_FW_HYBRID_DRONE', 			   'BUILDING_FW_HIVE',                    10),
	('UNIT_FW_BIODRONE', 			       'BUILDING_FW_HIVE',                    10),
	('UNIT_FW_CHIMERA', 		           'BUILDING_FW_HIVE',                    10),
	('UNIT_FW_MUTANT', 				       'BUILDING_FW_HIVE',                    10),
	('UNIT_FW_HYDRA', 				       'BUILDING_FW_HIVE',                    10),
	('UNIT_FW_AUTOMATON', 			       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_ROBOT_INFANTRY', 		       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_COLOSSUS', 	    	       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_ZEKE', 			           'BUILDING_FW_SKYNET', 				  10),
	('UNIT_MECH', 			               'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_MECH_ARTILLERY', 		       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_ANGEL', 		               'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_CYBERSAM', 			       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_CRAWLER', 			       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_NANOHIVE', 			       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_MEGAHIVE', 			       'BUILDING_FW_SKYNET', 				  10),
	('UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER', 'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_XCOM_SQUAD', 		           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_SPACEMARINES', 	           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_BATTLESUIT', 		           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_GUNDAM',      	           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_DRONE_FIGHTER_2', 	       'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_SUBORBITAL_BOMBER', 	       'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_PLASMA_FIGHTER', 	           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_PLASMA_BOMBER', 	           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_SPACE_FIGHTER', 	           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_SPACE_BOMBER', 	           'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_HELICARRIER', 		       'BUILDING_FW_ORBITAL_REFINERY', 	      10),
	('UNIT_FW_NEXUS', 		               'BUILDING_FW_ORBITAL_REFINERY', 	      10);


INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_FW_PREDATOR', 	       'UNITCOMBAT_MELEE'),
	('PROMOTION_FW_PREDATOR', 	       'UNITCOMBAT_GUN'),
	('PROMOTION_FW_PREDATOR',          'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_FW_PREDATOR', 	       'UNITCOMBAT_MOUNTED'),
	('PROMOTION_FW_PREDATOR', 	       'UNITCOMBAT_NAVALMELEE'),
	('PROMOTION_FW_PREDATOR', 	       'UNITCOMBAT_NAVALRANGED'),
	('PROMOTION_FW_SKYNET_LINK',       'UNITCOMBAT_ARCHER'),
	('PROMOTION_FW_SKYNET_LINK',       'UNITCOMBAT_ARMOR'),
	('PROMOTION_FW_SKYNET_LINK',       'UNITCOMBAT_SIEGE'),
	('PROMOTION_FW_SKYNET_LINK',       'UNITCOMBAT_SUBMARINE'),
	('PROMOTION_FW_SPACESPECIALIST',   'UNITCOMBAT_GUN'),
	('PROMOTION_FW_SPACESPECIALIST',   'UNITCOMBAT_RECON'),
	('PROMOTION_FW_SPACESPECIALIST',   'UNITCOMBAT_CARRIER'),
	('PROMOTION_FW_SPACESPECIALIST',   'UNITCOMBAT_FIGHTER'),
	('PROMOTION_FW_SPACESPECIALIST',   'UNITCOMBAT_BOMBER');

INSERT INTO Building_ImprovementYieldChangesGlobal	
	(BuildingType, 						ImprovementType,							YieldType,					Yield)
VALUES		
	('BUILDING_FW_SKYTREE',		        'IMPROVEMENT_FW_COMM_ARRAY',	            'YIELD_GOLDEN_AGE_POINTS',	1),
	('BUILDING_FW_SKYTREE',		        'IMPROVEMENT_FW_COMM_ARRAY',	            'YIELD_SCIENCE',			1),
	('BUILDING_FW_SKYTREE',		        'IMPROVEMENT_FW_COMM_ARRAY',	            'YIELD_GOLD',				1),
	('BUILDING_FW_GENE_VAULT', 	        'IMPROVEMENT_FW_PRESERVE', 		            'YIELD_CULTURE', 			2),
	('BUILDING_FW_GENE_VAULT', 	        'IMPROVEMENT_FW_BIOWELL', 		            'YIELD_FOOD', 				1),
	('BUILDING_FW_EDEN_PROJECT', 	    'IMPROVEMENT_FW_HYDROPONICS_DOME',      	'YIELD_GOLD', 				1),
	('BUILDING_FW_EDEN_PROJECT', 	    'IMPROVEMENT_FW_HERC',      	            'YIELD_PRODUCTION',    		2),
	('BUILDING_FW_DATA_HAVEN',	        'IMPROVEMENT_FW_GENERATOR', 	            'YIELD_SCIENCE',    		1),
	('BUILDING_FW_DATA_HAVEN',	        'IMPROVEMENT_FW_GENERATOR_WATER',           'YIELD_SCIENCE',    		1),
	('BUILDING_FW_DATA_HAVEN', 	        'IMPROVEMENT_FW_INDUSTRIAL_COMPLEX',        'YIELD_PRODUCTION', 		2),
	('BUILDING_FW_PHOLUS_MUTAGEN', 	    'IMPROVEMENT_FW_GENOCENTRE',                'YIELD_FAITH',      		1),
	('BUILDING_FW_PHOLUS_MUTAGEN', 	    'IMPROVEMENT_FW_GENOCENTRE',                'YIELD_SCIENCE',   	    	2),
	('BUILDING_FW_PHOLUS_MUTAGEN', 	    'IMPROVEMENT_FW_WATER_GENOCENTRE',          'YIELD_FAITH',      		1),
	('BUILDING_FW_PHOLUS_MUTAGEN', 	    'IMPROVEMENT_FW_WATER_GENOCENTRE',          'YIELD_SCIENCE',   	    	2),
	('BUILDING_FW_SHIMIZUMCP', 	        'IMPROVEMENT_FW_CORE',                      'YIELD_FOOD',    		    2),
	('BUILDING_FW_SHIMIZUMCP', 	        'IMPROVEMENT_FW_CORE',                      'YIELD_CULTURE',    		1),
	('BUILDING_FW_SHIMIZUMCP', 	        'IMPROVEMENT_FW_WATER_CORE',                'YIELD_FOOD',    		    2),
	('BUILDING_FW_SHIMIZUMCP', 	        'IMPROVEMENT_FW_WATER_CORE',                'YIELD_CULTURE',    		1),
	('BUILDING_FW_LAPUTA',              'IMPROVEMENT_FW_ARCOLOGY',                  'YIELD_GOLD',    	    	2),
	('BUILDING_FW_LAPUTA',              'IMPROVEMENT_FW_ARCOLOGY',                  'YIELD_PRODUCTION',    	    1),
	('BUILDING_FW_LAPUTA',              'IMPROVEMENT_FW_WATER_ARCOLOGY',            'YIELD_GOLD',    	    	2),
	('BUILDING_FW_LAPUTA',              'IMPROVEMENT_FW_WATER_ARCOLOGY',            'YIELD_PRODUCTION',    		1);

----------------------------------------------
-- Resource  requirements
----------------------------------------------
INSERT INTO Building_ResourceQuantityRequirements 
	(BuildingType, ResourceType, Cost) 
VALUES
	('BUILDING_FW_SHIMIZUMCP', 				'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_LAPUTA', 		            'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_HIVE',                    'RESOURCE_XENO_FUNGUS', 	1),
	('BUILDING_FW_MNEMOSYNE', 	        	'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_GLOBAL_POWERGRID', 	   	'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_GLOBAL_POWERGRID', 		'RESOURCE_URANIUM', 	1),
	('BUILDING_FW_CREATION_ORATORIUM', 		'RESOURCE_XENO_FUNGUS', 	1),
	('BUILDING_FW_NEPHILIM_GENE_TEMPLATE', 	'RESOURCE_XENO_FUNGUS', 	1),
	('BUILDING_FW_DIGITAL_EMANCIPATION', 	'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_ANGELNET', 	            'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_CITADEL_STATION',         'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_ULTIMATOWER', 			'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_BIONICTOWER', 			'RESOURCE_NANOMAT', 	1),
	('BUILDING_FW_BUENOSAIRESFORUM', 		'RESOURCE_NANOMAT', 	1);

------------------------
-- Building_BuildingClassHappiness
------------------------
INSERT INTO Building_BuildingClassHappiness 
	(BuildingType, BuildingClassType, Happiness)
VALUES
	('BUILDING_FW_SHIMIZUMCP',       'BUILDINGCLASS_FW_AUTOPLANT',    1),
	('BUILDING_FW_GLOBAL_POWERGRID', 'BUILDINGCLASS_FW_FUSION_PLANT', 1);

INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_FW_SKYTREE',           'BUILDINGCLASS_BROADCAST_TOWER'),
	('BUILDING_FW_JURASSIC_PARK',     'BUILDINGCLASS_FW_GENE_LAB'),
	('BUILDING_FW_SKYHOOK',           'BUILDINGCLASS_FW_LAUNCH_FACILITY'),
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
	('BUILDING_FW_NANO_INSTITUTE', 		'RESOURCE_NANOMAT', 		6),
	('BUILDING_FW_APEX_CENTRE', 		'RESOURCE_PAPER', 			3),
	('BUILDING_FW_ENRICHMENT_CENTRE', 	'RESOURCE_URANIUM', 		4),
	('BUILDING_FW_SKYHOOK',          	'RESOURCE_ALUMINUM', 		6),
	('BUILDING_FW_ORBITAL_REFINERY', 	'RESOURCE_NANOMAT', 		12),
	('BUILDING_FW_DEEP_RESOURCE', 	    'RESOURCE_URANIUM', 		2);

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
	('BUILDING_FW_SKYTREE', 		 	    'BUILDINGCLASS_BROADCAST_TOWER', 		   'YIELD_CULTURE',    		  1),
	('BUILDING_FW_SKYTREE', 		        'BUILDINGCLASS_BROADCAST_TOWER', 		   'YIELD_GOLDEN_AGE_POINTS', 1),
	('BUILDING_FW_GENE_VAULT', 	 	    	'BUILDINGCLASS_FW_ECOSANCTUARY',  		   'YIELD_PRODUCTION', 		  2),
	('BUILDING_FW_GENE_VAULT', 	 	  	    'BUILDINGCLASS_FW_BIOFACTORY',             'YIELD_PRODUCTION',        2),
	('BUILDING_FW_GENE_VAULT', 	 	  	    'BUILDINGCLASS_FW_OCEAN_BIOHUB',           'YIELD_PRODUCTION',        2),
	('BUILDING_FW_EDEN_PROJECT', 	 	    'BUILDINGCLASS_FW_VERTICAL_FARM',  	       'YIELD_GOLD', 	          2),
	('BUILDING_FW_EDEN_PROJECT', 	 	    'BUILDINGCLASS_FW_GEOTHERMAL_FACTORY',     'YIELD_GOLD',              2),
	('BUILDING_FW_EDEN_PROJECT', 	 	    'BUILDINGCLASS_FW_BOREHOLE',               'YIELD_GOLD',              2),
	('BUILDING_FW_DATA_HAVEN', 		 	    'BUILDINGCLASS_FW_SERVER_HUB', 	           'YIELD_GOLD',			  2),
	('BUILDING_FW_JURASSIC_PARK', 	  	    'BUILDINGCLASS_THEATRE',  		           'YIELD_GOLD', 			  4),
	('BUILDING_FW_JURASSIC_PARK', 	  	    'BUILDINGCLASS_FW_CLONE_LAB',  		       'YIELD_SCIENCE', 		  4),
	('BUILDING_FW_ENRICHMENT_CENTRE', 	    'BUILDINGCLASS_FW_PARTICLE_ACCELERATOR',   'YIELD_SCIENCE', 	 	  4),
	('BUILDING_FW_ENRICHMENT_CENTRE', 	    'BUILDINGCLASS_FW_PARTICLE_ACCELERATOR',   'YIELD_PRODUCTION', 	 	  4),
	('BUILDING_FW_SKYHOOK', 	            'BUILDINGCLASS_FW_LAUNCH_FACILITY',        'YIELD_GOLD', 		      4),
	('BUILDING_FW_SKYHOOK', 	            'BUILDINGCLASS_FW_LAUNCH_FACILITY',        'YIELD_CULTURE', 		  4),
	('BUILDING_FW_SOLAR_REFLECTOR', 	    'BUILDINGCLASS_FW_LAPUTA_DUMMY',           'YIELD_CULTURE',    		  2),
	('BUILDING_FW_SOLAR_REFLECTOR', 	    'BUILDINGCLASS_FW_LAPUTA_DUMMY',           'YIELD_SCIENCE',    		  2),
	('BUILDING_FW_SOLAR_REFLECTOR', 		'BUILDINGCLASS_FW_LAPUTA_DUMMY',           'YIELD_PRODUCTION',    	  2),
	('BUILDING_FW_SOLAR_REFLECTOR', 	    'BUILDINGCLASS_FW_LAPUTA_DUMMY',           'YIELD_GOLD',    		  2),
	('BUILDING_FW_HIVE',                    'BUILDINGCLASS_FW_CLONE_LAB',              'YIELD_FOOD', 		      2),
	('BUILDING_FW_HIVE',                    'BUILDINGCLASS_FW_CLONE_LAB',              'YIELD_CULTURE', 		  2),
	('BUILDING_FW_HIVE',                    'BUILDINGCLASS_FW_CLONE_LAB',              'YIELD_FAITH', 		      2),
	('BUILDING_FW_HIVE',                    'BUILDINGCLASS_FW_TRANSGENIC_NURSERY',     'YIELD_FOOD', 		      2),
	('BUILDING_FW_HIVE',                    'BUILDINGCLASS_FW_TRANSGENIC_NURSERY',     'YIELD_CULTURE', 		  2),
	('BUILDING_FW_HIVE',                    'BUILDINGCLASS_FW_TRANSGENIC_NURSERY',     'YIELD_FAITH', 		      2),
	('BUILDING_FW_SKYNET',                  'BUILDINGCLASS_FW_HUMONOID_FORGE',         'YIELD_FOOD',    		  2),
	('BUILDING_FW_SKYNET',                  'BUILDINGCLASS_FW_HUMONOID_FORGE',         'YIELD_CULTURE', 	      2),
	('BUILDING_FW_SKYNET',                  'BUILDINGCLASS_FW_HUMONOID_FORGE',         'YIELD_PRODUCTION', 	      2),
	('BUILDING_FW_SKYNET',                  'BUILDINGCLASS_FW_DRONE_HIVE',             'YIELD_FOOD', 		      2),
	('BUILDING_FW_SKYNET',                  'BUILDINGCLASS_FW_DRONE_HIVE',             'YIELD_CULTURE',           2),
	('BUILDING_FW_SKYNET',                  'BUILDINGCLASS_FW_DRONE_HIVE',             'YIELD_PRODUCTION',        2),
	('BUILDING_FW_ORBITAL_REFINERY',        'BUILDINGCLASS_FW_SOLAR_REFLECTOR',        'YIELD_PRODUCTION',        2),
	('BUILDING_FW_ORBITAL_REFINERY',        'BUILDINGCLASS_FW_SOLAR_REFLECTOR',        'YIELD_GOLD',              2),
	('BUILDING_FW_ORBITAL_REFINERY',        'BUILDINGCLASS_FW_SOLAR_REFLECTOR',        'YIELD_SCIENCE',           2),
	('BUILDING_FW_ORBITAL_REFINERY',        'BUILDINGCLASS_FW_AEROSPACE_COMPLEX',      'YIELD_PRODUCTION',        2),
	('BUILDING_FW_ORBITAL_REFINERY',        'BUILDINGCLASS_FW_AEROSPACE_COMPLEX',      'YIELD_GOLD',              2),
	('BUILDING_FW_ORBITAL_REFINERY',        'BUILDINGCLASS_FW_AEROSPACE_COMPLEX',      'YIELD_SCIENCE',           2),
	('BUILDING_FW_DIGITAL_EMANCIPATION',    'BUILDINGCLASS_FW_DRONE_HIVE',			   'YIELD_PRODUCTION', 	      8),
	('BUILDING_FW_DIGITAL_EMANCIPATION',    'BUILDINGCLASS_FW_DRONE_HIVE',		       'YIELD_GOLD', 			  4),
	('BUILDING_FW_DIGITAL_EMANCIPATION',    'BUILDINGCLASS_FW_SIMULATION_HUB',	       'YIELD_SCIENCE', 		  6),
	('BUILDING_FW_DIGITAL_EMANCIPATION',    'BUILDINGCLASS_FW_SIMULATION_HUB',	       'YIELD_CULTURE', 		  6),
	('BUILDING_FW_DIGITAL_EMANCIPATION',    'BUILDINGCLASS_FW_SIMULATION_HUB',  	   'YIELD_GOLD', 			  4),
	('BUILDING_FW_DIGITAL_EMANCIPATION',    'BUILDINGCLASS_FW_BRAIN_UPLOADING',	       'YIELD_GOLD', 			  1),
	('BUILDING_FW_DIGITAL_EMANCIPATION',    'BUILDINGCLASS_FW_BRAIN_UPLOADING',        'YIELD_SCIENCE', 		  1),
	('BUILDING_FW_DIGITAL_EMANCIPATION',    'BUILDINGCLASS_FW_BRAIN_UPLOADING',	       'YIELD_CULTURE', 		  1),
	('BUILDING_FW_DIGITAL_EMANCIPATION',    'BUILDINGCLASS_FW_BRAIN_UPLOADING',        'YIELD_FOOD', 			  1),
	('BUILDING_FW_AI_DATANETWORK',          'BUILDINGCLASS_FW_COMMERCE_SERVER',        'YIELD_GOLD',              8),
	('BUILDING_FW_AI_DATANETWORK',          'BUILDINGCLASS_FW_ENTERTAINMENT_SERVER',   'YIELD_CULTURE',           8),
	('BUILDING_FW_AI_DATANETWORK',          'BUILDINGCLASS_FW_CLOUD_COMPUTING',        'YIELD_PRODUCTION',        8),
	('BUILDING_FW_AI_DATANETWORK',          'BUILDINGCLASS_FW_RESEARCH_SERVER',        'YIELD_SCIENCE',           8),
	('BUILDING_FW_DEEP_RESOURCE',           'BUILDINGCLASS_FW_NANOFORGE',              'YIELD_PRODUCTION',        4),
	('BUILDING_FW_DEEP_RESOURCE',           'BUILDINGCLASS_FW_NANOFORGE',              'YIELD_SCIENCE',           4);

INSERT INTO Building_SpecificGreatPersonRateModifier 
	(BuildingType, SpecialistType, Modifier) 
VALUES
	('BUILDING_FW_GENE_VAULT', 			'SPECIALIST_WRITER', 		25),
	('BUILDING_FW_EDEN_PROJECT', 		'SPECIALIST_SCIENTIST', 	15),
	('BUILDING_FW_CITADEL_STATION', 	'SPECIALIST_CIVIL_SERVANT', 50),
	('BUILDING_FW_BIONICTOWER', 		'SPECIALIST_SCIENTIST', 	50),
	('BUILDING_FW_BUENOSAIRESFORUM', 	'SPECIALIST_MERCHANT', 		50),
	('BUILDING_FW_ULTIMATOWER', 		'SPECIALIST_ENGINEER', 		50);

INSERT INTO Building_FreeUnits 
	(BuildingType,						UnitType,				NumUnits)
VALUES	
	('BUILDING_FW_VIRTUAL_IDOL', 		'UNIT_MUSICIAN',			1),
	('BUILDING_FW_APEX_CENTRE', 		'UNIT_GREAT_DIPLOMAT',		1),
	('BUILDING_FW_JURASSIC_PARK', 		'UNIT_FW_TREX',				1),
	('BUILDING_FW_JURASSIC_PARK', 		'UNIT_FW_TRICERATOPS',		1),
	('BUILDING_FW_JURASSIC_PARK', 		'UNIT_FW_RAPTOR',			2),
	('BUILDING_FW_CREATION_ORATORIUM', 	'UNIT_MUSICIAN',			1),
	('BUILDING_FW_ULTIMATOWER', 		'UNIT_ENGINEER',			1),
	('BUILDING_FW_BIONICTOWER', 		'UNIT_SCIENTIST',			1),
	('BUILDING_FW_BUENOSAIRESFORUM', 	'UNIT_MERCHANT',			1);

INSERT INTO Building_ResourcePlotsToPlace
		(BuildingType,						ResourceType,			NumPlots, ResourceQuantityToPlace) 
VALUES	('BUILDING_FW_PHOLUS_MUTAGEN',		'RESOURCE_XENO_FUNGUS',	4		, 3);

INSERT INTO Building_InstantYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_SHANGHAI_WFC', 'YIELD_GOLD', 		15000),
	('BUILDING_FW_SHANGHAI_WFC', 'YIELD_TOURISM', 	10000);

INSERT INTO Building_YieldFromYieldPercent
	(BuildingType,						YieldIn,			YieldOut,			Value) 
VALUES	
	('BUILDING_FW_CREATION_ORATORIUM',	'YIELD_CULTURE',	'YIELD_GOLD',		10),
	('BUILDING_FW_CREATION_ORATORIUM',	'YIELD_CULTURE',	'YIELD_TOURISM',	10),
	('BUILDING_FW_ULTIMATOWER',			'YIELD_PRODUCTION',	'YIELD_TOURISM',	10),
	('BUILDING_FW_ULTIMATOWER',			'YIELD_PRODUCTION',	'YIELD_GOLD',		10),
	('BUILDING_FW_BIONICTOWER',			'YIELD_SCIENCE',	'YIELD_GOLD',		10),
	('BUILDING_FW_BIONICTOWER',			'YIELD_SCIENCE',	'YIELD_TOURISM',	10),
	('BUILDING_FW_BUENOSAIRESFORUM',	'YIELD_GOLD',		'YIELD_TOURISM',	10);

INSERT INTO Building_HurryModifiersLocal
	(BuildingType, 					 HurryType,    HurryCostModifier)
VALUES
	('BUILDING_FW_BUENOSAIRESFORUM', 'HURRY_GOLD', -50);

------------------------
-- Flavors
------------------------
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_FW_SKYTREE',        			'FLAVOR_WONDER',      		25),
('BUILDING_FW_SKYTREE',        			'FLAVOR_TILE_IMPROVEMENT',  10),
('BUILDING_FW_SKYTREE',        			'FLAVOR_HAPPINESS',      	30),
('BUILDING_FW_SKYTREE',        			'FLAVOR_CULTURE',      		30),
('BUILDING_FW_SKYTREE',        			'FLAVOR_SCIENCE',      		30),
('BUILDING_FW_SKYTREE',        			'FLAVOR_GOLD',      		30),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_WONDER',      		25),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_GREAT_PEOPLE',      25),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_PRODUCTION',      	15),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_GROWTH',      		15),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_HAPPINESS',      	15),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_TILE_IMPROVEMENT',  15),
('BUILDING_FW_GENE_VAULT',  			'FLAVOR_CULTURE',      		50),
('BUILDING_FW_SHANGHAI_WFC',  			'FLAVOR_WONDER',      		30),
('BUILDING_FW_SHANGHAI_WFC',  			'FLAVOR_GREAT_PEOPLE',      25),
('BUILDING_FW_SHANGHAI_WFC',  			'FLAVOR_CULTURE',      		50),
('BUILDING_FW_SHANGHAI_WFC',  			'FLAVOR_GOLD',      		60),
('BUILDING_FW_VIRTUAL_IDOL',  			'FLAVOR_WONDER',      		25),
('BUILDING_FW_VIRTUAL_IDOL',  			'FLAVOR_GREAT_PEOPLE',      25),
('BUILDING_FW_VIRTUAL_IDOL',  			'FLAVOR_HAPPINESS',      	25),
('BUILDING_FW_VIRTUAL_IDOL',  			'FLAVOR_CULTURE',      		80),
('BUILDING_FW_NANO_INSTITUTE',        	'FLAVOR_WONDER',      		25),
('BUILDING_FW_NANO_INSTITUTE',        	'FLAVOR_GREAT_PEOPLE',      5),
('BUILDING_FW_NANO_INSTITUTE',        	'FLAVOR_PRODUCTION',      	55),
('BUILDING_FW_NANO_INSTITUTE',        	'FLAVOR_MILITARY_TRAINING', 50),
('BUILDING_FW_NANO_INSTITUTE',        	'FLAVOR_OFFENSE', 			40),
('BUILDING_FW_NANO_INSTITUTE',        	'FLAVOR_DEFENSE', 			40),
('BUILDING_FW_EDEN_PROJECT',  			'FLAVOR_WONDER',      		25),
('BUILDING_FW_EDEN_PROJECT',  			'FLAVOR_GREAT_PEOPLE',      25),
('BUILDING_FW_EDEN_PROJECT',  			'FLAVOR_GOLD',          	15),
('BUILDING_FW_EDEN_PROJECT',  			'FLAVOR_GROWTH',      		15),
('BUILDING_FW_EDEN_PROJECT',  			'FLAVOR_HAPPINESS',      	15),
('BUILDING_FW_EDEN_PROJECT',  			'FLAVOR_TILE_IMPROVEMENT',  15),
('BUILDING_FW_EDEN_PROJECT',  			'FLAVOR_CULTURE',      		50),
('BUILDING_FW_APEX_CENTRE',  			'FLAVOR_RELIGION',      	10),
('BUILDING_FW_APEX_CENTRE',  			'FLAVOR_WONDER',      		25),
('BUILDING_FW_APEX_CENTRE',  			'FLAVOR_ESPIONAGE',      	35),
('BUILDING_FW_APEX_CENTRE',  			'FLAVOR_GREAT_PEOPLE',      35),
('BUILDING_FW_APEX_CENTRE',  			'FLAVOR_DIPLOMACY',      	80),
('BUILDING_FW_DATA_HAVEN',        		'FLAVOR_WONDER',      		25),
('BUILDING_FW_DATA_HAVEN',        		'FLAVOR_TILE_IMPROVEMENT',  15),
('BUILDING_FW_DATA_HAVEN',        		'FLAVOR_GREAT_PEOPLE',      25),
('BUILDING_FW_DATA_HAVEN',        		'FLAVOR_GOLD',      		45),
('BUILDING_FW_DATA_HAVEN',        		'FLAVOR_SCIENCE',      		50),
('BUILDING_FW_DATA_HAVEN',        		'FLAVOR_CULTURE',      		50),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_WONDER',      		25),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_GREAT_PEOPLE',      15),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_CITY_DEFENSE',      15),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_DEFENSE',      		15),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_HAPPINESS',      	20),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_CULTURE',      		10),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_GOLD',      		30),
('BUILDING_FW_JURASSIC_PARK',        	'FLAVOR_SCIENCE',      		30),
('BUILDING_FW_ENRICHMENT_CENTRE',  		'FLAVOR_PRODUCTION',        15),
('BUILDING_FW_ENRICHMENT_CENTRE',  		'FLAVOR_EXPANSION',      	40),
('BUILDING_FW_ENRICHMENT_CENTRE',  		'FLAVOR_WONDER',      		25),
('BUILDING_FW_ENRICHMENT_CENTRE',  		'FLAVOR_GREAT_PEOPLE',      35),
('BUILDING_FW_ENRICHMENT_CENTRE',  		'FLAVOR_SCIENCE',      		20),
('BUILDING_FW_SKYHOOK',  				'FLAVOR_WONDER',      		25),
('BUILDING_FW_SKYHOOK',  				'FLAVOR_PRODUCTION',      	25),
('BUILDING_FW_SKYHOOK',  				'FLAVOR_CULTURE',      		15),
('BUILDING_FW_SKYHOOK',  				'FLAVOR_GOLD',      		15),
('BUILDING_FW_SKYHOOK',  		        'FLAVOR_EXPANSION',      	25),
('BUILDING_FW_SKYHOOK',  		        'FLAVOR_SPACESHIP',      	25),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_WONDER',      		25),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_EXPANSION',      	25),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_MILITARY_TRAINING', 50),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_RELIGION',          15),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_SCIENCE',      		50),
('BUILDING_FW_PHOLUS_MUTAGEN',  		'FLAVOR_TILE_IMPROVEMENT',  20),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_GREAT_PEOPLE',      5),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_WONDER',            25),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_PRODUCTION',        15),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_GOLD',              15),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_SCIENCE',           15),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_HAPPINESS',        	35),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_DEFENSE',        	35),
('BUILDING_FW_SHIMIZUMCP',          	'FLAVOR_CITY_DEFENSE',      55),
('BUILDING_FW_LAPUTA',        	        'FLAVOR_SCIENCE',      		30),
('BUILDING_FW_LAPUTA',              	'FLAVOR_WONDER',      		25),
('BUILDING_FW_LAPUTA',              	'FLAVOR_GREAT_PEOPLE',      15),
('BUILDING_FW_LAPUTA', 		            'FLAVOR_CITY_DEFENSE', 		30),
('BUILDING_FW_LAPUTA', 		            'FLAVOR_DEFENSE', 			35),
('BUILDING_FW_LAPUTA',                 	'FLAVOR_CULTURE',      		30),
('BUILDING_FW_LAPUTA',                 	'FLAVOR_GOLD',      		30),
('BUILDING_FW_HIVE',                    'FLAVOR_WONDER',      		25),
('BUILDING_FW_HIVE',                    'FLAVOR_GREAT_PEOPLE',      20),
('BUILDING_FW_HIVE',                    'FLAVOR_GROWTH',            40),
('BUILDING_FW_HIVE',                    'FLAVOR_CULTURE',        	20),
('BUILDING_FW_HIVE',                    'FLAVOR_RELIGION',        	20),
('BUILDING_FW_HIVE',                    'FLAVOR_OFFENSE', 			20),
('BUILDING_FW_HIVE',                    'FLAVOR_PRODUCTION', 		50),
('BUILDING_FW_HIVE',                    'FLAVOR_OFFENSE', 			10),
('BUILDING_FW_HIVE',                    'FLAVOR_MILITARY_TRAINING', 50),
('BUILDING_FW_MNEMOSYNE',  				'FLAVOR_WONDER',      		25),
('BUILDING_FW_MNEMOSYNE',  				'FLAVOR_OFFENSE',      		50),
('BUILDING_FW_MNEMOSYNE',  				'FLAVOR_MILITARY_TRAINING', 70),
('BUILDING_FW_SKYNET',  				'FLAVOR_WONDER',      		25),
('BUILDING_FW_SKYNET',  				'FLAVOR_MOBILE',      		25),
('BUILDING_FW_SKYNET',  				'FLAVOR_CITY_DEFENSE',      35),
('BUILDING_FW_SKYNET',  				'FLAVOR_DEFENSE',      		35),
('BUILDING_FW_SKYNET',  				'FLAVOR_RANGED',      		50),
('BUILDING_FW_SKYNET',  				'FLAVOR_OFFENSE',      		25),
('BUILDING_FW_SKYNET',  				'FLAVOR_WONDER',      		25),
('BUILDING_FW_SKYNET',  				'FLAVOR_PRODUCTION',      	10),
('BUILDING_FW_SKYNET',  				'FLAVOR_CULTURE',        	10),
('BUILDING_FW_SKYNET',  				'FLAVOR_GROWTH',      	    10),
('BUILDING_FW_SKYNET',  				'FLAVOR_MILITARY_TRAINING', 65),
('BUILDING_FW_GLOBAL_POWERGRID',  		'FLAVOR_WONDER',      		25),
('BUILDING_FW_GLOBAL_POWERGRID',  	    'FLAVOR_PRODUCTION',      	50),
('BUILDING_FW_GLOBAL_POWERGRID',  		'FLAVOR_DIPLOMACY',         80),
('BUILDING_FW_GLOBAL_POWERGRID',  		'FLAVOR_HAPPINESS',         40),
('BUILDING_FW_GLOBAL_POWERGRID',  		'FLAVOR_GREAT_PEOPLE',      40),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_WONDER',      		25),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_GREAT_PEOPLE',      5),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_SPACESHIP',      	10),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_GOLD',      		35),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_EXPANSION',      	15),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_PRODUCTION',      	10),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_GOLD',      	    10),
('BUILDING_FW_ORBITAL_REFINERY',  		'FLAVOR_SCIENCE',        	10),
('BUILDING_FW_ORBITAL_REFINERY',        'FLAVOR_MILITARY_TRAINING', 60),
('BUILDING_FW_CREATION_ORATORIUM',      'FLAVOR_CULTURE',      		40),
('BUILDING_FW_CREATION_ORATORIUM',    	'FLAVOR_WONDER',      		25),
('BUILDING_FW_CREATION_ORATORIUM',    	'FLAVOR_RELIGION',      	40),
('BUILDING_FW_CREATION_ORATORIUM',   	'FLAVOR_GREAT_PEOPLE',      40),
('BUILDING_FW_CREATION_ORATORIUM',      'FLAVOR_HAPPINESS',      	30),
('BUILDING_FW_CREATION_ORATORIUM',      'FLAVOR_CULTURE',      		60),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  'FLAVOR_WONDER',      		25),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  'FLAVOR_PRODUCTION',      	40),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  'FLAVOR_SCIENCE',      		40),
('BUILDING_FW_NEPHILIM_GENE_TEMPLATE',  'FLAVOR_PRODUCTION', 		10),
('BUILDING_FW_DIGITAL_EMANCIPATION',  	'FLAVOR_WONDER',      		25),
('BUILDING_FW_DIGITAL_EMANCIPATION',  	'FLAVOR_SCIENCE',      		35),
('BUILDING_FW_DIGITAL_EMANCIPATION',  	'FLAVOR_CULTURE',      		35),
('BUILDING_FW_DIGITAL_EMANCIPATION',  	'FLAVOR_PRODUCTION',      	35),
('BUILDING_FW_DIGITAL_EMANCIPATION',  	'FLAVOR_GOLD',      		35),
('BUILDING_FW_DIGITAL_EMANCIPATION',  	'FLAVOR_GREAT_PEOPLE',      50),
('BUILDING_FW_ANGELNET',  				'FLAVOR_WONDER',      		25),
('BUILDING_FW_ANGELNET',  				'FLAVOR_HAPPINESS',      	10),
('BUILDING_FW_ANGELNET',  				'FLAVOR_CITY_DEFENSE',  	70),
('BUILDING_FW_ANGELNET',  				'FLAVOR_DEFENSE',      		70),
('BUILDING_FW_ANGELNET',  				'FLAVOR_EXPANSION',      	20),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_SCIENCE',      		10),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_PRODUCTION',      	10),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_GOLD',      		10),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_WONDER',      		25),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_GREAT_PEOPLE',      55),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_DIPLOMACY',      	60),
('BUILDING_FW_CITADEL_STATION',  		'FLAVOR_ESPIONAGE',      	65),
('BUILDING_FW_ULTIMATOWER',        		'FLAVOR_GOLD',      		10),
('BUILDING_FW_ULTIMATOWER',        		'FLAVOR_WONDER',      		25),
('BUILDING_FW_ULTIMATOWER',        		'FLAVOR_PRODUCTION',      	60),
('BUILDING_FW_ULTIMATOWER',        		'FLAVOR_GREAT_PEOPLE',      40),
('BUILDING_FW_ULTIMATOWER',        		'FLAVOR_HAPPINESS',      	40),
('BUILDING_FW_ULTIMATOWER',        		'FLAVOR_GROWTH',      		50),
('BUILDING_FW_BIONICTOWER',        		'FLAVOR_GOLD',      		10),
('BUILDING_FW_BIONICTOWER',        		'FLAVOR_WONDER',      		25),
('BUILDING_FW_BIONICTOWER',        		'FLAVOR_GREAT_PEOPLE',      40),
('BUILDING_FW_BIONICTOWER',        		'FLAVOR_HAPPINESS',      	40),
('BUILDING_FW_BIONICTOWER',        		'FLAVOR_GROWTH',      		50),
('BUILDING_FW_BIONICTOWER',        		'FLAVOR_SCIENCE',      		60),
('BUILDING_FW_BUENOSAIRESFORUM',        'FLAVOR_GOLD',      		60),
('BUILDING_FW_BUENOSAIRESFORUM',        'FLAVOR_WONDER',      		25),
('BUILDING_FW_BUENOSAIRESFORUM',        'FLAVOR_GREAT_PEOPLE',      40),
('BUILDING_FW_BUENOSAIRESFORUM',        'FLAVOR_HAPPINESS',   		55),
('BUILDING_FW_GENOME_PROJECT',  		'FLAVOR_WONDER',      		25),
('BUILDING_FW_GENOME_PROJECT',  		'FLAVOR_GROWTH',      		40),
('BUILDING_FW_GENOME_PROJECT',  		'FLAVOR_GREAT_PEOPLE',      60),
('BUILDING_FW_GENOME_PROJECT',  		'FLAVOR_SCIENCE',      		50),
('BUILDING_FW_AI_DATANETWORK',  		'FLAVOR_WONDER',      		25),
('BUILDING_FW_AI_DATANETWORK',  		'FLAVOR_GROWTH',      		40),
('BUILDING_FW_AI_DATANETWORK',  		'FLAVOR_CULTURE',      		25),
('BUILDING_FW_AI_DATANETWORK',  		'FLAVOR_PRODUCTION',   		25),
('BUILDING_FW_AI_DATANETWORK',  		'FLAVOR_GOLD',   	    	25),
('BUILDING_FW_AI_DATANETWORK',  		'FLAVOR_GREAT_PEOPLE',      60),
('BUILDING_FW_AI_DATANETWORK',  		'FLAVOR_SCIENCE',      		50),
('BUILDING_FW_DEEP_RESOURCE',  		    'FLAVOR_WONDER',      		25),
('BUILDING_FW_DEEP_RESOURCE',  	     	'FLAVOR_SCIENCE',      		20),
('BUILDING_FW_DEEP_RESOURCE',  		    'FLAVOR_PRODUCTION',      	20),
('BUILDING_FW_DEEP_RESOURCE',  		    'FLAVOR_GREAT_PEOPLE',      60),
('BUILDING_FW_DEEP_RESOURCE',        	'FLAVOR_MILITARY_TRAINING', 25),
('BUILDING_FW_DEEP_RESOURCE',        	'FLAVOR_OFFENSE', 			20),
('BUILDING_FW_DEEP_RESOURCE',        	'FLAVOR_DEFENSE', 			20);