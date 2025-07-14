----------------------------------------------------
-- Generic info
----------------------------------------------------
INSERT INTO Buildings (Type, PrereqTech, Cost, ArtDefineTag, PortraitIndex, IconAtlas) VALUES
('BUILDING_FW_SERVER_HUB', 				'TECH_INTERNET', 					2500, 'ART_DEF_BUILDING_LABORATORY',        32,'CIV_COLOR_ATLAS_FW_2'),

('BUILDING_FW_ENTERTAINMENT_SERVER', 	'TECH_GEN_MANIP', 				    3250, 'ART_DEF_BUILDING_LABORATORY',        42,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_COMMERCE_SERVER', 		'TECH_SUPERCOMPUTERS', 				3250, 'ART_DEF_BUILDING_STOCK_EXCHANGE',    33,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_CLOUD_COMPUTING', 		'TECH_ROBOTICS', 				    3250, 'ART_DEF_BUILDING_LABORATORY',        44,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_RESEARCH_SERVER', 		'TECH_NANOMATERIALS', 			    3250, 'ART_DEF_BUILDING_LABORATORY',        34,'CIV_COLOR_ATLAS_FW_2'),

('BUILDING_FW_GENE_LAB', 				'TECH_GEN_MANIP', 					3250, 'ART_DEF_BUILDING_LABORATORY',        20,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_CYBERPOLICE', 			'TECH_SUPERCOMPUTERS', 				3250, 'COLESSEUM',                          11,'EXPANSION_BW_ATLAS_1'),
('BUILDING_FW_NANOMAT_PLANT', 			'TECH_NANOMATERIALS', 				3250, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',     3,'CIV_COLOR_ATLAS_FW'),

('BUILDING_FW_AQUACULTURE_LAB', 		'TECH_EUTHENICS', 					3500, 'ART_DEF_BUILDING_LABORATORY',        51,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_FUNGAL_AGRIGENOMICS', 	'TECH_EUTHENICS', 					3500, 'ART_DEF_BUILDING_LABORATORY',        43,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_CRYPTOBANK', 				'TECH_GRID_COMPUTING', 				3500, 'ART_DEF_BUILDING_STOCK_EXCHANGE',    15,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_UNDERSEA_MINING', 		'TECH_GRID_COMPUTING', 	        	3500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',     53,'CIV_COLOR_ATLAS_FW_2'),

('BUILDING_FW_AUTOPLANT', 				'TECH_POWER_SYSTEMS', 		        3500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',    12,'CIV_COLOR_ATLAS_FW_2'),

('BUILDING_FW_VR_TRAINING', 			'TECH_MEMETICS', 					3500, 'ART_DEF_BUILDING_LABORATORY',         0,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_VIRTUAL_MUSEUM', 			'TECH_MEMETICS', 					3500, 'MUSEUM',                             39,'CIV_COLOR_ATLAS_FW_2'),

-- ('BUILDING_FW_NANOFORGE', 				'TECH_NANOTECHNOLOGY', 				3500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',      8,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_PARTICLE_ACCELERATOR', 	'TECH_PARTICLE_PHYSICS', 			3500, 'ART_DEF_BUILDING_LABORATORY',          0,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_VERTICAL_FARM', 			'TECH_ARTIFICIAL_ENVIRONMENTS', 	3500, 'ART_DEF_BUILDING_LABORATORY',          7,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF','TECH_ARTIFICIAL_ENVIRONMENTS', 	3500, 'ART_DEF_FEATURE_REEF',                 1,'NW_ATLAS'),
('BUILDING_FW_ECOSANCTUARY', 			'TECH_FW_ECOTHEORY', 	            4000, 'ART_DEF_BUILDING_FW_GARDEN',          31,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BIOFACTORY', 				'TECH_FW_ECOTHEORY', 				4000, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',      2,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_IMPLANT_CLINIC', 			'TECH_IMPLANTS', 					3750, 'ART_DEF_BUILDING_LABORATORY',          4,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_NETWORK_BACKBONE', 		'TECH_COGNITIVE_TECH', 				4000, 'ART_DEF_BUILDING_LABORATORY',          1,'CIV_COLOR_ATLAS_FW'),

('BUILDING_FW_BOREHOLE', 				'TECH_QUANTUM_COMPUTERS',           4000, 'ART_DEF_BUILDING_LABORATORY',         36,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_GEOTHERMAL_FACTORY', 		'TECH_QUANTUM_COMPUTERS', 			4000, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',     48,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_HYDROTHERMAL_FACTORY', 	'TECH_QUANTUM_COMPUTERS', 			4000, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',  	 46,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_LAUNCH_FACILITY', 		'TECH_ORBITAL_DEV', 			    4000, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',     56,'CIV_COLOR_ATLAS_FW_2'),

('BUILDING_FW_CLONE_LAB', 				'TECH_CLONING', 					4250, 'ART_DEF_BUILDING_LABORATORY',          5, 'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BIOFLESH_INDUSTRY', 		'TECH_CLONING', 					4250, 'ART_DEF_BUILDING_LABORATORY',          21,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_GENEJACK_FACILITY', 		'TECH_ORGANICS', 		        	4250, 'ART_DEF_BUILDING_LABORATORY',         29,'CIV_COLOR_ATLAS_FW_3'),

('BUILDING_FW_METROPLEX_HUB', 			'TECH_ORGANICS', 			        4250, 'ART_DEF_BUILDING_LABORATORY',         28,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_FEEDSITE_HUB', 			'TECH_ORGANICS', 		            4250, 'ART_DEF_BUILDING_LABORATORY',         40,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_DISTRIBUTION_HUB', 		'TECH_NUCLEAR_ENRICHMENT', 		    4250, 'ART_DEF_BUILDING_LABORATORY',         61,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_SIMULATION_HUB', 			'TECH_NUCLEAR_ENRICHMENT', 		    4250, 'ART_DEF_BUILDING_LABORATORY',          6,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_TELEPRESENCE_HUB', 		'TECH_MECHATRONICS',	 		    4250, 'ART_DEF_BUILDING_LABORATORY',         61,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_ENRICHMENT_FACILITY', 	'TECH_NUCLEAR_ENRICHMENT', 			4500, 'ART_DEF_BUILDING_LABORATORY',         40,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_SPACE_STATION', 			'TECH_ASTRODYNAMICS', 				4250, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',     52,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_MYCOPROTEIN_VATS', 		'TECH_ASTRODYNAMICS', 		    	4250, 'ART_DEF_BUILDING_LABORATORY',         60,'CIV_COLOR_ATLAS_FW_2'),

('BUILDING_FW_TIDAL_PORT', 				'TECH_NEURAL_INTERFACE', 		    4500, 'ART_DEF_BUILDING_FW_HYDRO_ARRAY',     57,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_CYBERCLINIC', 			'TECH_NEURAL_INTERFACE', 			4500, 'ART_DEF_BUILDING_LABORATORY',          8,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_HIGHSPEED_RAIL', 			'TECH_SUPERCONDUCTIVITY', 			4500, 'ART_DEF_BUILDING_GARDEN',              2,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_RESEARCH_MODULE', 		'TECH_SUPERCONDUCTIVITY', 		    4500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',     24,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_ENGINEERING_MODULE', 		'TECH_SUPERCONDUCTIVITY', 		    4500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',     25,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_COMM_MODULE', 			'TECH_SUPERCONDUCTIVITY', 		    4500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',     28,'CIV_COLOR_ATLAS_FW_2'),

('BUILDING_FW_TRANSGENIC_NURSERY', 		'TECH_TRANSGENICS', 				4500, 'ART_DEF_BUILDING_LABORATORY',         59,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_DRONE_HIVE', 				'TECH_AUTONOMOUS_SYSTEMS', 			4500, 'ART_DEF_BUILDING_LABORATORY',          9,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_NANOMINES_FIELD', 		'TECH_ARCOLOGIES', 			        4500, 'ART_DEF_BUILDING_GARDEN',             18,'COMMUNITY_ATLAS'),
('BUILDING_FW_DEFENSE_FIELD', 			'TECH_ARCOLOGIES', 			        4750, 'ART_DEF_BUILDING_FW_MILITARY_BASE',   33,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_AEROSPACE_COMPLEX', 		'TECH_ARCOLOGIES', 		        	4500, 'ART_DEF_BUILDING_AIRPORT',            30,'CIV_COLOR_ATLAS_FW_3'),

('BUILDING_FW_ECTOGENESIS_POD', 		'TECH_GENGINEERING', 				4750, 'ART_DEF_BUILDING_LABORATORY',         22,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_MASS_DIGESTER', 			'TECH_BIOMODIFICATION', 	    	4750, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',      4,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BIOMOD_TANK', 			'TECH_BIOMODIFICATION', 			4750, 'ART_DEF_BUILDING_LABORATORY',         30,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_DIGITAL_POLICE', 			'TECH_AI', 		                	4750, 'COLESSEUM',                           11,'EXPANSION_BW_ATLAS_1'),
('BUILDING_FW_FUSION_PLANT', 			'TECH_NUCLEAR_FUSION', 				4750, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',      6,'CIV_COLOR_ATLAS_FW'),
('BUILDING_FW_ORBITAL_HABITAT', 		'TECH_ADAMANTIUM', 	                5000, 'ART_DEF_BUILDING_HOSPITAL',           26,'CIV_COLOR_ATLAS_FW_3'),

('BUILDING_FW_TERRAFORMING_STATION', 	'TECH_TERRAFORMING', 				5000, 'ART_DEF_BUILDING_LABORATORY',         36,'CIV_COLOR_ATLAS_FW'),
('BUILDING_FW_PHOTOSYSTEMS', 			'TECH_TERRAFORMING', 				5000, 'ART_DEF_BUILDING_LABORATORY',         35,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BIRTHING_PODS', 			'TECH_HUMAN_AUGMENTATION', 			5000, 'ART_DEF_BUILDING_LABORATORY',         62,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BRAIN_UPLOADING', 		'TECH_DIGITAL_SOCIETY', 			5000, 'ART_DEF_BUILDING_LABORATORY',          3,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_AI_NETWORK', 				'TECH_DIGITAL_SOCIETY', 			5000, 'ART_DEF_BUILDING_LABORATORY',          8,'BM_ALIENS_CIV_COLOR_ATLAS'),
('BUILDING_FW_ALLOY_FOUNDRY', 			'TECH_SMART_MATERIALS', 			5250, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',     13,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_UTILITY_FOG', 			'TECH_SMART_MATERIALS', 			5250, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',     11,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_MOON_BASE', 				'TECH_ENERGY_THEORY', 				5500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT',     58,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_CENTRAL_COMMAND', 		'TECH_HYPERSTRUCTURES', 			5000, 'ART_DEF_BUILDING_LABORATORY',         23,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_GENOME_PROJECT_1', 		     NULL,                            -1, 'ART_DEF_BUILDING_LABORATORY',         21,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_GENOME_PROJECT_2', 		     NULL,                            -1, 'ART_DEF_BUILDING_LABORATORY',         21,'CIV_COLOR_ATLAS_FW_3');

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_'||SUBSTR(Type,10), Description = 'TXT_KEY_'||Type,
	Civilopedia = 'TXT_KEY_'||Type||'_PEDIA', Strategy = 'TXT_KEY_'||Type||'_STRATEGY', Help = 'TXT_KEY_'||Type||'_HELP',
	MinAreaSize = -1, HurryCostModifier = -20, ConquestProb = 80
WHERE Type IN (
'BUILDING_FW_GENE_LAB',
'BUILDING_FW_LAUNCH_FACILITY',
'BUILDING_FW_CYBERPOLICE',
'BUILDING_FW_DIGITAL_POLICE',
'BUILDING_FW_SERVER_HUB',
'BUILDING_FW_VR_TRAINING',
'BUILDING_FW_VIRTUAL_MUSEUM',
'BUILDING_FW_CLOUD_COMPUTING',
'BUILDING_FW_ENTERTAINMENT_SERVER',
'BUILDING_FW_COMMERCE_SERVER',
'BUILDING_FW_RESEARCH_SERVER',
'BUILDING_FW_NANOMINES_FIELD',
'BUILDING_FW_NETWORK_BACKBONE',
'BUILDING_FW_MASS_DIGESTER',
'BUILDING_FW_UNDERSEA_MINING',
'BUILDING_FW_AQUACULTURE_LAB',
'BUILDING_FW_CLONE_LAB',
'BUILDING_FW_BIOFLESH_INDUSTRY',
'BUILDING_FW_FUNGAL_AGRIGENOMICS',
'BUILDING_FW_SEAWATER_ARTIFICIAL_REEF',
'BUILDING_FW_ECOSANCTUARY',
'BUILDING_FW_BIOFACTORY',
'BUILDING_FW_GEOTHERMAL_FACTORY',
'BUILDING_FW_HYDROTHERMAL_FACTORY',
'BUILDING_FW_PARTICLE_ACCELERATOR',
'BUILDING_FW_ECTOGENESIS_POD',
'BUILDING_FW_PHOTOSYSTEMS',
'BUILDING_FW_TRANSGENIC_NURSERY',
'BUILDING_FW_TIDAL_PORT',
'BUILDING_FW_HIGHSPEED_RAIL',
'BUILDING_FW_GENEJACK_FACILITY',
'BUILDING_FW_BIOMOD_TANK',
'BUILDING_FW_IMPLANT_CLINIC',
'BUILDING_FW_BIRTHING_PODS',
'BUILDING_FW_CYBERCLINIC',
'BUILDING_FW_TELEPRESENCE_HUB',
'BUILDING_FW_SIMULATION_HUB',
'BUILDING_FW_AI_NETWORK',
'BUILDING_FW_BRAIN_UPLOADING',
'BUILDING_FW_FUSION_PLANT',
'BUILDING_FW_DEFENSE_FIELD',
'BUILDING_FW_AEROSPACE_COMPLEX',
'BUILDING_FW_AUTOPLANT',
'BUILDING_FW_CRYPTOBANK',
'BUILDING_FW_DRONE_HIVE',
'BUILDING_FW_UTILITY_FOG',
'BUILDING_FW_NANOFORGE',
'BUILDING_FW_NANOMAT_PLANT',
'BUILDING_FW_ALLOY_FOUNDRY',
'BUILDING_FW_CONVERTER',
'BUILDING_FW_FEEDSITE_HUB',
'BUILDING_FW_DISTRIBUTION_HUB',
'BUILDING_FW_METROPLEX_HUB',
'BUILDING_FW_VERTICAL_FARM',
'BUILDING_FW_MYCOPROTEIN_VATS',
'BUILDING_FW_SPACE_STATION',
'BUILDING_FW_MOON_BASE',
'BUILDING_FW_RESEARCH_MODULE',
'BUILDING_FW_ENGINEERING_MODULE',
'BUILDING_FW_COMM_MODULE',
'BUILDING_FW_ORBITAL_HABITAT',
'BUILDING_FW_BOREHOLE',
'BUILDING_FW_CENTRAL_COMMAND',
'BUILDING_FW_TERRAFORMING_STATION',
'BUILDING_FW_ENRICHMENT_FACILITY',
'BUILDING_FW_BIOFUEL_REFINERY',
'BUILDING_FW_GENOME_PROJECT_1',
'BUILDING_FW_GENOME_PROJECT_2');

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxPlayerInstances) VALUES
('BUILDINGCLASS_FW_MOON_BASE', 			     'BUILDING_FW_MOON_BASE', 		    	'TXT_KEY_BUILDING_FW_MOON_BASE', 			1),
('BUILDINGCLASS_FW_GENOME_PROJECT_1', 	     'BUILDING_FW_GENOME_PROJECT_1', 	    'TXT_KEY_BUILDING_FW_GENOME_PROJECT_1', 	1),
('BUILDINGCLASS_FW_GENOME_PROJECT_2', 	     'BUILDING_FW_GENOME_PROJECT_2', 	    'TXT_KEY_BUILDING_FW_GENOME_PROJECT_2', 	1),
('BUILDINGCLASS_FW_NANOFORGE', 	     		 'BUILDING_FW_NANOFORGE', 	    		'TXT_KEY_BUILDING_FW_NANOFORGE', 			5),
('BUILDINGCLASS_FW_BIOFUEL_REFINERY', 	     'BUILDING_FW_BIOFUEL_REFINERY', 	    'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY', 	3),
('BUILDINGCLASS_FW_BIOFUEL_REFINERY_RICE', 	 'BUILDING_FW_BIOFUEL_REFINERY_RICE', 	'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY', 	3),
('BUILDINGCLASS_FW_BIOFUEL_REFINERY_BANANA', 'BUILDING_FW_BIOFUEL_REFINERY_BANANA', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY', 	3),
('BUILDINGCLASS_FW_BIOFUEL_REFINERY_MAIZE',  'BUILDING_FW_BIOFUEL_REFINERY_MAIZE', 	'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY', 	3),
('BUILDINGCLASS_FW_ENRICHMENT_FACILITY',     'BUILDING_FW_ENRICHMENT_FACILITY',     'TXT_KEY_BUILDING_FW_ENRICHMENT_FACILITY', 	3);

INSERT INTO Buildings (Type, BuildingClass, PrereqTech, Cost, ArtDefineTag, PortraitIndex, IconAtlas, Help, Description, Civilopedia, Strategy) VALUES
('BUILDING_FW_NANOFORGE',       	   'BUILDINGCLASS_FW_NANOFORGE',  		 'TECH_NANOTECHNOLOGY',3500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT', 8,'TCS_MOD_ICON_ATLAS', 'TXT_KEY_BUILDING_FW_NANOFORGE_HELP', 		 'TXT_KEY_BUILDING_FW_NANOFORGE',        		'TXT_KEY_BUILDING_FW_NANOFORGE_PEDIA', 		  'TXT_KEY_BUILDING_FW_NANOFORGE_STRATEGY'),
('BUILDING_FW_BIOFUEL_REFINERY',       'BUILDINGCLASS_FW_BIOFUEL_REFINERY',  'TECH_POWER_SYSTEMS', 3500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT', 4,'CIV_COLOR_ATLAS_FW', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_HELP', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY',        'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_PEDIA', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_STRATEGY'),
('BUILDING_FW_BIOFUEL_REFINERY_RICE',  'BUILDINGCLASS_FW_BIOFUEL_REFINERY',  'TECH_POWER_SYSTEMS', 3500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT', 4,'CIV_COLOR_ATLAS_FW', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_HELP', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_RICE',   'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_PEDIA', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_STRATEGY'),
('BUILDING_FW_BIOFUEL_REFINERY_BANANA','BUILDINGCLASS_FW_BIOFUEL_REFINERY',  'TECH_POWER_SYSTEMS', 3500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT', 4,'CIV_COLOR_ATLAS_FW', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_HELP', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_BANANA', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_PEDIA', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_STRATEGY'),
('BUILDING_FW_BIOFUEL_REFINERY_MAIZE', 'BUILDINGCLASS_FW_BIOFUEL_REFINERY',  'TECH_POWER_SYSTEMS', 3500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT', 4,'CIV_COLOR_ATLAS_FW', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_HELP', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_MAIZE',  'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_PEDIA', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_STRATEGY'),
('BUILDING_FW_CONVERTER',              'BUILDINGCLASS_FW_CONVERTER',         'TECH_POWER_SYSTEMS', 3500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT', 2,'CIV_COLOR_ATLAS_FW', 'TXT_KEY_BUILDING_FW_CONVERTER_HELP',        'TXT_KEY_BUILDING_FW_CONVERTER',               'TXT_KEY_BUILDING_FW_CONVERTER_PEDIA',        'TXT_KEY_BUILDING_FW_CONVERTER_STRATEGY'),
('BUILDING_FW_CONVERTER_OIL',          'BUILDINGCLASS_FW_CONVERTER',         'TECH_POWER_SYSTEMS', 3500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT', 2,'CIV_COLOR_ATLAS_FW', 'TXT_KEY_BUILDING_FW_CONVERTER_HELP',        'TXT_KEY_BUILDING_FW_CONVERTER_OIL',           'TXT_KEY_BUILDING_FW_CONVERTER_PEDIA',        'TXT_KEY_BUILDING_FW_CONVERTER_STRATEGY'),
('BUILDING_FW_CONVERTER_IRON',         'BUILDINGCLASS_FW_CONVERTER',         'TECH_POWER_SYSTEMS', 3500, 'ART_DEF_BUILDING_FW_HYDRO_PLANT', 2,'CIV_COLOR_ATLAS_FW', 'TXT_KEY_BUILDING_FW_CONVERTER_HELP',        'TXT_KEY_BUILDING_FW_CONVERTER_IRON',          'TXT_KEY_BUILDING_FW_CONVERTER_PEDIA',        'TXT_KEY_BUILDING_FW_CONVERTER_STRATEGY');

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description)
SELECT 'BUILDINGCLASS_'||SUBSTR(Type,10), Type, 'TXT_KEY_'||Type
FROM Buildings
WHERE Type IN (
'BUILDING_FW_GENE_LAB',
'BUILDING_FW_LAUNCH_FACILITY',
'BUILDING_FW_CYBERPOLICE',
'BUILDING_FW_DIGITAL_POLICE',
'BUILDING_FW_SERVER_HUB',
'BUILDING_FW_VR_TRAINING',
'BUILDING_FW_VIRTUAL_MUSEUM',
'BUILDING_FW_CLOUD_COMPUTING',
'BUILDING_FW_ENTERTAINMENT_SERVER',
'BUILDING_FW_COMMERCE_SERVER',
'BUILDING_FW_RESEARCH_SERVER',
'BUILDING_FW_NANOMINES_FIELD',
'BUILDING_FW_NETWORK_BACKBONE',
'BUILDING_FW_MASS_DIGESTER',
'BUILDING_FW_UNDERSEA_MINING',
'BUILDING_FW_AQUACULTURE_LAB',
'BUILDING_FW_CLONE_LAB',
'BUILDING_FW_BIOFLESH_INDUSTRY',
'BUILDING_FW_FUNGAL_AGRIGENOMICS',
'BUILDING_FW_SEAWATER_ARTIFICIAL_REEF',
'BUILDING_FW_ECOSANCTUARY',
'BUILDING_FW_BIOFACTORY',
'BUILDING_FW_GEOTHERMAL_FACTORY',
'BUILDING_FW_HYDROTHERMAL_FACTORY',
'BUILDING_FW_PARTICLE_ACCELERATOR',
'BUILDING_FW_ECTOGENESIS_POD',
'BUILDING_FW_PHOTOSYSTEMS',
'BUILDING_FW_TRANSGENIC_NURSERY',
'BUILDING_FW_TIDAL_PORT',
'BUILDING_FW_HIGHSPEED_RAIL',
'BUILDING_FW_GENEJACK_FACILITY',
'BUILDING_FW_BIOMOD_TANK',
'BUILDING_FW_IMPLANT_CLINIC',
'BUILDING_FW_BIRTHING_PODS',
'BUILDING_FW_CYBERCLINIC',
'BUILDING_FW_TELEPRESENCE_HUB',
'BUILDING_FW_SIMULATION_HUB',
'BUILDING_FW_AI_NETWORK',
'BUILDING_FW_BRAIN_UPLOADING',
'BUILDING_FW_FUSION_PLANT',
'BUILDING_FW_DEFENSE_FIELD',
'BUILDING_FW_AEROSPACE_COMPLEX',
'BUILDING_FW_AUTOPLANT',
'BUILDING_FW_CRYPTOBANK',
'BUILDING_FW_DRONE_HIVE',
'BUILDING_FW_UTILITY_FOG',
'BUILDING_FW_NANOMAT_PLANT',
'BUILDING_FW_ALLOY_FOUNDRY',
'BUILDING_FW_CONVERTER',
'BUILDING_FW_FEEDSITE_HUB',
'BUILDING_FW_DISTRIBUTION_HUB',
'BUILDING_FW_METROPLEX_HUB',
'BUILDING_FW_VERTICAL_FARM',
'BUILDING_FW_MYCOPROTEIN_VATS',
'BUILDING_FW_ORBITAL_HABITAT',
'BUILDING_FW_BOREHOLE',
'BUILDING_FW_SPACE_STATION',
'BUILDING_FW_COMM_MODULE',
'BUILDING_FW_RESEARCH_MODULE',
'BUILDING_FW_ENGINEERING_MODULE',
'BUILDING_FW_CENTRAL_COMMAND',
'BUILDING_FW_TERRAFORMING_STATION');

-- ----------------------------------------------
-- -- Spaceship Factory & HUBBLE
-- ----------------------------------------------
UPDATE Buildings
SET PrereqTech = 'TECH_ORBITAL_DEV', Cost = 3500, GoldMaintenance = 15
WHERE Type = 'BUILDING_SPACESHIP_FACTORY';
UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]Spaceships, Space Marines, ODST and XCOM units trained in this city have +15% [ICON_STRENGTH] Combat Strength.' WHERE Tag IN ('TXT_KEY_BUILDING_SPACESHIP_FACTORY_HELP');

-- ----------------------------------------------
-- -- International Space Station
-- ----------------------------------------------
UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_FW_LAUNCH_FACILITY'
WHERE Type = 'BUILDING_INTERNATIONAL_SPACE_STATION';

-- ----------------------------------------------
-- -- CYBERPOLICE (vp 4.4 changed)
-- ----------------------------------------------
UPDATE Buildings
SET EspionageModifier = 0,
	SpySecurityModifier = 10,
	DistressFlatReduction = 1,
	PovertyFlatReduction = 1,
	IlliteracyFlatReduction = 1,
	BoredomFlatReduction = 1,
	GoldMaintenance = 12
WHERE Type = 'BUILDING_FW_CYBERPOLICE';

-- ----------------------------------------------
-- -- Digital Police (vp 4.4 changed)
-- ----------------------------------------------
UPDATE Buildings
SET EspionageModifier = 0,
	SpySecurityModifier = 10,
	DistressFlatReduction = 1,
	PovertyFlatReduction = 1,
	IlliteracyFlatReduction = 1,
	BoredomFlatReduction = 1,
	GoldMaintenance = 16
WHERE Type = 'BUILDING_FW_DIGITAL_POLICE';

-- ----------------------------------------------
-- -- Biofuel Refinery
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 8, MutuallyExclusiveGroup = 54221
WHERE Type = 'BUILDING_FW_BIOFUEL_REFINERY';

UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 8, MutuallyExclusiveGroup = 54221
WHERE Type = 'BUILDING_FW_BIOFUEL_REFINERY_RICE';

UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 8, MutuallyExclusiveGroup = 54221
WHERE Type = 'BUILDING_FW_BIOFUEL_REFINERY_BANANA';

UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 8, MutuallyExclusiveGroup = 54221
WHERE Type = 'BUILDING_FW_BIOFUEL_REFINERY_MAIZE';


-- ----------------------------------------------
-- -- Enrichment Facility
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 18, NationalPopRequired = 125
WHERE Type = 'BUILDING_FW_ENRICHMENT_FACILITY';

-- ----------------------------------------------
-- -- Genome Project 1
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, NeverCapture = 1
WHERE Type = 'BUILDING_FW_GENOME_PROJECT_1';

-- ----------------------------------------------
-- -- Genome Project 2
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, NeverCapture = 1, GlobalPopulationChange = 1
WHERE Type = 'BUILDING_FW_GENOME_PROJECT_1';

-- ----------------------------------------------
-- -- Terraforming Station
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 18, MutuallyExclusiveGroup = 23491
WHERE Type = 'BUILDING_FW_TERRAFORMING_STATION';
-- ----------------------------------------------
-- -- AI Network
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 16, Defense = 1500, ExtraCityHitPoints = 75, MutuallyExclusiveGroup = 23491
WHERE Type = 'BUILDING_FW_AI_NETWORK';
-- ----------------------------------------------
-- -- Central Command
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 18, MutuallyExclusiveGroup = 23491
WHERE Type = 'BUILDING_FW_CENTRAL_COMMAND';

-- ----------------------------------------------
-- -- Moon Base
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, NukeImmune = 1, NationalPopRequired = 110, SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 2, Happiness = 3, NoUnhappfromXSpecialists = 2
WHERE Type = 'BUILDING_FW_MOON_BASE';

-- ----------------------------------------------
-- -- Orbital Habitat
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, NukeImmune = 1, NoUnhappfromXSpecialists = 2
WHERE Type = 'BUILDING_FW_ORBITAL_HABITAT';

-- ----------------------------------------------
-- -- Comm Module
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, GoldMaintenance = 2, SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 1, GreatPeopleRateChange = 2, MutuallyExclusiveGroup = 99801
WHERE Type = 'BUILDING_FW_COMM_MODULE';
-- ----------------------------------------------
-- -- Engineering Module
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, GoldMaintenance = 8, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 1, GreatPeopleRateChange = 2, MutuallyExclusiveGroup = 99801
WHERE Type = 'BUILDING_FW_ENGINEERING_MODULE';
-- ----------------------------------------------
-- -- Research Module
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, GoldMaintenance = 8, SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 1, GreatPeopleRateChange = 2, MutuallyExclusiveGroup = 99801
WHERE Type = 'BUILDING_FW_RESEARCH_MODULE';

-- ----------------------------------------------
-- -- Space Station
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, GoldMaintenance = 12, NoUnhappfromXSpecialists = 1, WLTKDTurns = 15, CityAirStrikeDefense = 5, Defense = 500
WHERE Type = 'BUILDING_FW_SPACE_STATION';

-- ----------------------------------------------
-- -- Mycoprotein Vats
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, FoodKept = 10, NoUnhappfromXSpecialists = 2
WHERE Type = 'BUILDING_FW_MYCOPROTEIN_VATS';

-- ----------------------------------------------
-- -- Vertical Farms
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 15, NeverCapture = 1, NoUnhappfromXSpecialists = 1
WHERE Type = 'BUILDING_FW_VERTICAL_FARM';

-- ----------------------------------------------
-- -- Metroplex hub
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 5, SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 1, GreatPeopleRateChange = 2, MutuallyExclusiveGroup = 9993, MutuallyExclusiveGroup = 999, PovertyFlatReduction = 1
WHERE Type = 'BUILDING_FW_METROPLEX_HUB';
-- ----------------------------------------------
-- -- Distribution Hub
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 20, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 1, GreatPeopleRateChange = 2, BuildingProductionModifier = 15, NoUnhappfromXSpecialists = 1,  MutuallyExclusiveGroup = 9993
WHERE Type = 'BUILDING_FW_DISTRIBUTION_HUB';
-- ----------------------------------------------
-- -- Simulation Hub
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 20, SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 1, GreatPeopleRateChange = 2,  MutuallyExclusiveGroup = 9993, IlliteracyFlatReduction = 1
WHERE Type = 'BUILDING_FW_SIMULATION_HUB';
-- ----------------------------------------------
-- -- Feedsite Hub
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 20, SpecialistType = 'SPECIALIST_MUSICIAN', SpecialistCount = 1, GreatPeopleRateChange = 2, TechEnhancedTourism = 0, Happiness = 3,  MutuallyExclusiveGroup = 9993, BoredomFlatReduction = 1
WHERE Type = 'BUILDING_FW_FEEDSITE_HUB';

-- ----------------------------------------------
-- -- Alloy Foundry
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, NeverCapture = 1
WHERE Type = 'BUILDING_FW_ALLOY_FOUNDRY';

-- ----------------------------------------------
-- -- Converter
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 6, NeverCapture = 1, MutuallyExclusiveGroup = 3612
WHERE Type = 'BUILDING_FW_CONVERTER';
UPDATE Buildings
SET GoldMaintenance = 7, NeverCapture = 1, MutuallyExclusiveGroup = 3612
WHERE Type = 'BUILDING_FW_CONVERTER_OIL';
UPDATE Buildings
SET GoldMaintenance = 8, NeverCapture = 1, MutuallyExclusiveGroup = 3612
WHERE Type = 'BUILDING_FW_CONVERTER_IRON';

-- ----------------------------------------------
-- -- Nanomaterial Plant
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 10, NeverCapture = 1
WHERE Type = 'BUILDING_FW_NANOMAT_PLANT';

-- ----------------------------------------------
-- -- Nanoforge
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 18, NeverCapture = 1, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 1, CitySupplyFlat = 1
WHERE Type = 'BUILDING_FW_NANOFORGE';

-- ----------------------------------------------
-- -- Utility Fog
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 25, EmpireSizeModifierReduction = '-5', HealRateChange = 5, BuildingProductionModifier = 20, AllowsRangeStrike = 1, CityRangedStrikeRange = 1, Defense = 1200, ExtraCityHitPoints = 100
WHERE Type = 'BUILDING_FW_UTILITY_FOG';

---------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------
-- -- Transgenic Nursery
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 1, TrainedFreePromotion = 'PROMOTION_FW_PARASITISM', MutuallyExclusiveGroup = 99778
WHERE Type = 'BUILDING_FW_TRANSGENIC_NURSERY';
-- ----------------------------------------------
-- -- Drone Hive
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, Defense = 1500, ExtraCityHitPoints = 50, BuildingProductionModifier = 10, SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 1,  TrainedFreePromotion = 'PROMOTION_FW_AUTO_REPAIR', MutuallyExclusiveGroup = 99778
WHERE Type = 'BUILDING_FW_DRONE_HIVE';
-- ----------------------------------------------
-- -- Aerospace Complex
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, CityAirStrikeDefense = 12, AirModifier = 3,  TrainedFreePromotion = 'PROMOTION_PARADROP_2', MutuallyExclusiveGroup = 99778
WHERE Type = 'BUILDING_FW_AEROSPACE_COMPLEX';
-- SpaceProductionModifier = 10,
------------------------------------------------------------------------------------------------------------------------------------------

-- ----------------------------------------------
-- -- Defense Field
-- ----------------------------------------------
UPDATE Buildings
SET ProhibitedCityTerrain = 'TERRAIN_COAST', GoldMaintenance = 25, Defense = 1800, AllowsRangeStrike = 1, ExtraCityHitPoints = 125, NukeImmune = 1, NukeModifier = -20
WHERE Type = 'BUILDING_FW_DEFENSE_FIELD';

-- ----------------------------------------------
-- -- Fusion Plant
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, GreatPeopleRateModifier = 25
WHERE Type = 'BUILDING_FW_FUSION_PLANT';
INSERT INTO Building_YieldFromProcessModifier
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_FUSION_PLANT', 'YIELD_FOOD', 20),
	('BUILDING_FW_FUSION_PLANT', 'YIELD_GOLD', 20),
	('BUILDING_FW_FUSION_PLANT', 'YIELD_SCIENCE', 20),
	('BUILDING_FW_FUSION_PLANT', 'YIELD_CULTURE', 20),
	('BUILDING_FW_FUSION_PLANT', 'YIELD_FAITH', 20);

-- ----------------------------------------------
-- -- Brain Uploading
-- ----------------------------------------------
UPDATE Buildings
SET PopulationChange = -20, NukeImmune = 1, ConquestProb = 100, LocalPopRequired = 70
WHERE Type = 'BUILDING_FW_BRAIN_UPLOADING';

-- ----------------------------------------------
-- -- Telepresence Hub
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 6
WHERE Type = 'BUILDING_FW_TELEPRESENCE_HUB';

-- ----------------------------------------------
-- -- Cyberclinic
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16
WHERE Type = 'BUILDING_FW_CYBERCLINIC';

-- ----------------------------------------------
-- -- Birthing Pods
-- ----------------------------------------------
UPDATE Buildings
SET Happiness = 1, PopulationChange = 5, FoodKept = 20, NoUnhappfromXSpecialists = 2
WHERE Type = 'BUILDING_FW_BIRTHING_PODS';

-- ----------------------------------------------
-- -- Implant Clinic
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, NeverCapture = 1, DistressFlatReduction = 1
WHERE Type = 'BUILDING_FW_IMPLANT_CLINIC';

-- ----------------------------------------------
-- -- Bioenhancement Centre
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, NeverCapture = 1, TrainedFreePromotion = 'PROMOTION_FW_BIOMODS'
WHERE Type = 'BUILDING_FW_BIOMOD_TANK';

-- ----------------------------------------------
-- -- Genejack Facility
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12
WHERE Type = 'BUILDING_FW_GENEJACK_FACILITY';

-- ----------------------------------------------
-- -- Tidal Port
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 1, Water = 1, FinishSeaTRTourism = 10, TradeRouteSeaGoldBonus = 100, CitySupplyFlat = 1, TradeRouteRecipientBonus = 2, TradeRouteTargetBonus = 2, TradeRouteSeaDistanceModifier = 50, MutuallyExclusiveGroup = 876871
WHERE Type = 'BUILDING_FW_TIDAL_PORT';

-- ----------------------------------------------
-- -- High Speed Rail Train
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 1, RequiresIndustrialCityConnection = 1, FinishLandTRTourism = 10, TradeRouteLandGoldBonus = 50, TradeRouteLandDistanceModifier = 25, MutuallyExclusiveGroup = 876871
WHERE Type = 'BUILDING_FW_HIGHSPEED_RAIL';

-- ----------------------------------------------
-- -- Photosystems
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 20, ConquestProb = 100
WHERE Type = 'BUILDING_FW_PHOTOSYSTEMS';

-- ----------------------------------------------
-- -- Biogenesis Pod
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, NeverCapture = 1, TrainedFreePromotion = 'PROMOTION_FW_GENGINEERED'
WHERE Type = 'BUILDING_FW_ECTOGENESIS_POD';

-- ----------------------------------------------
-- -- Nanomines Field
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, ExtraCityHitPoints = 50, Defense = 1000, Water = 1, DeepWaterTileDamage = 5, BorderObstacleWater = 1, MinAreaSize = 10
WHERE Type = 'BUILDING_FW_NANOMINES_FIELD';

-- ----------------------------------------------
-- -- Launch Facility
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, DistressFlatReduction = 1, NoUnhappfromXSpecialists = 1
WHERE Type = 'BUILDING_FW_LAUNCH_FACILITY';

-- ----------------------------------------------
-- -- Particle Accelerator
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 1, IlliteracyFlatReduction = 1
WHERE Type = 'BUILDING_FW_PARTICLE_ACCELERATOR';

-- ----------------------------------------------
-- -- VR Training
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NeverCapture = 1, DistressFlatReduction = 1, BoredomFlatReduction = 1
WHERE Type = 'BUILDING_FW_VR_TRAINING';

-- ----------------------------------------------
-- -- Virtual Museum
-- ----------------------------------------------
UPDATE Buildings
SET GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 2, GoldMaintenance = 12, BoredomFlatReduction = 1
WHERE Type = 'BUILDING_FW_VIRTUAL_MUSEUM';

-- ----------------------------------------------
-- -- Cloud Computing
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 10, PolicyBranchType = 'POLICY_BRANCH_EXPLORATION', SpecialistCount = 1, SpecialistType = 'SPECIALIST_ENGINEER', DistressFlatReduction = 1
WHERE Type = 'BUILDING_FW_CLOUD_COMPUTING';
-- ----------------------------------------------
-- -- Entertainment Server
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 10, PolicyBranchType = 'POLICY_BRANCH_AESTHETICS', SpecialistCount = 1, SpecialistType = 'SPECIALIST_ARTIST', TechEnhancedTourism = 0, BoredomFlatReduction = 1
WHERE Type = 'BUILDING_FW_ENTERTAINMENT_SERVER';
-- ----------------------------------------------
-- -- E-Commerce Server
-- ----------------------------------------------
UPDATE Buildings
SET SpecialistCount = 1, PolicyBranchType = 'POLICY_BRANCH_COMMERCE', SpecialistType = 'SPECIALIST_MERCHANT', TradeRouteRecipientBonus = 2, TradeRouteTargetBonus = 2, PovertyFlatReduction = 1
WHERE Type = 'BUILDING_FW_COMMERCE_SERVER';
-- ----------------------------------------------
-- -- Research Server
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 10, PolicyBranchType = 'POLICY_BRANCH_RATIONALISM', SpecialistCount = 1, SpecialistType = 'SPECIALIST_SCIENTIST', IlliteracyFlatReduction = 1
WHERE Type = 'BUILDING_FW_RESEARCH_SERVER';

-- ----------------------------------------------
-- -- Autoplant
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 10, NoUnhappfromXSpecialists = 1, SpecialistCount = 1, SpecialistType = 'SPECIALIST_ENGINEER'
WHERE Type = 'BUILDING_FW_AUTOPLANT';

-- ----------------------------------------------
-- -- Cryptobank
-- ----------------------------------------------
UPDATE Buildings
SET SpecialistCount = 1, SpecialistType = 'SPECIALIST_MERCHANT', PovertyFlatReduction = 1
WHERE Type = 'BUILDING_FW_CRYPTOBANK';

-- ----------------------------------------------
-- -- Genomod Lab
-- ----------------------------------------------
UPDATE Buildings
SET FoodKept = 15, GoldMaintenance = 10, DistressFlatReduction = 1
WHERE Type = 'BUILDING_FW_GENE_LAB';

-- ----------------------------------------------
-- -- Clone Lab
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, CitySupplyModifier = 10, PopulationChange = 2, GreatPeopleRateModifier = 10
WHERE Type = 'BUILDING_FW_CLONE_LAB';

-- ----------------------------------------------
-- -- Bio-flesh Industry
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12
WHERE Type = 'BUILDING_FW_BIOFLESH_INDUSTRY';

-- ----------------------------------------------
-- -- Fungal Agrigenomics
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, ConquestProb = 100
WHERE Type = 'BUILDING_FW_FUNGAL_AGRIGENOMICS';

-- ----------------------------------------------
-- -- VR Training
-- ----------------------------------------------
UPDATE Buildings
SET CitySupplyFlat = 1, DistressFlatReduction = 1, BoredomFlatReduction = 1 
WHERE Type = 'BUILDING_FW_VR_TRAINING';

-- ----------------------------------------------
-- -- Ecosanctuary
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NeverCapture = 1, LandmarksTourismPercent = 15, MutuallyExclusiveGroup = 23492, NoUnhappfromXSpecialists = 1, BoredomFlatReduction = 1, ReligiousUnrestFlatReduction = 1
WHERE Type = 'BUILDING_FW_ECOSANCTUARY';
-- ----------------------------------------------
-- -- Biofactory
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NeverCapture = 1, ProhibitedCityTerrain = 'TERRAIN_SNOW', MutuallyExclusiveGroup = 23492
WHERE Type = 'BUILDING_FW_BIOFACTORY';
-- ----------------------------------------------
-- -- Geothermal Factory
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NeverCapture = 1, NearbyMountainRequired = 1, MutuallyExclusiveGroup = 23492
WHERE Type = 'BUILDING_FW_GEOTHERMAL_FACTORY';
-- ----------------------------------------------
-- -- Hydrothermal Factory
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NeverCapture = 1, Water = 1, MutuallyExclusiveGroup = 23492
WHERE Type = 'BUILDING_FW_HYDROTHERMAL_FACTORY';
-- ----------------------------------------------
-- -- Borehole
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NeverCapture = 1, ProhibitedCityTerrain = 'TERRAIN_MOUNTAIN', MutuallyExclusiveGroup = 23492
WHERE Type = 'BUILDING_FW_BOREHOLE';

-- ----------------------------------------------
-- -- Network Backbone
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 6, GreatWorksTourismModifier = 10
WHERE Type = 'BUILDING_FW_NETWORK_BACKBONE';

-- ----------------------------------------------
-- -- Mass Digester
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 20, NoUnhappfromXSpecialists = 2
WHERE Type = 'BUILDING_FW_MASS_DIGESTER';

-- ----------------------------------------------
-- -- Undersea Mining Platform
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 8, MutuallyExclusiveGroup = 40961, Water = 1, MinAreaSize = 10, TradeRouteRecipientBonus = 1, TradeRouteTargetBonus = 1
WHERE Type = 'BUILDING_FW_UNDERSEA_MINING';
-- ----------------------------------------------
-- -- Artificial Reef
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 8, MutuallyExclusiveGroup = 40961, Water = 1, MinAreaSize = 10, TechEnhancedTourism = 0
WHERE Type = 'BUILDING_FW_SEAWATER_ARTIFICIAL_REEF';
-- ----------------------------------------------
-- -- Aquaculture Lab
-- ----------------------------------------------
UPDATE Buildings
SET FoodKept = 10, Water = 1, MutuallyExclusiveGroup = 40961, MinAreaSize = 1
WHERE Type = 'BUILDING_FW_AQUACULTURE_LAB';


-----------------------------------------------

INSERT INTO Building_TerrainYieldChanges
	(BuildingType, 							 TerrainType, 		YieldType, 			Yield)
VALUES
	('BUILDING_FW_BIOFACTORY', 				 'TERRAIN_GRASS', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_BIOFACTORY', 				 'TERRAIN_PLAINS', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_MASS_DIGESTER', 		 	 'TERRAIN_GRASS', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_MASS_DIGESTER', 		 	 'TERRAIN_PLAINS', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_MASS_DIGESTER', 		 	 'TERRAIN_TUNDRA', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_MASS_DIGESTER', 		 	 'TERRAIN_SNOW', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_MASS_DIGESTER', 		 	 'TERRAIN_DESERT', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_HYDROTHERMAL_FACTORY', 	 'TERRAIN_COAST', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_HYDROTHERMAL_FACTORY', 	 'TERRAIN_OCEAN', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_GENEJACK_FACILITY', 		 'TERRAIN_GRASS', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_GENEJACK_FACILITY', 		 'TERRAIN_PLAINS', 	'YIELD_GOLD', 		1),
	('BUILDING_FW_GENEJACK_FACILITY', 		 'TERRAIN_TUNDRA', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_GENEJACK_FACILITY', 		 'TERRAIN_SNOW', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_GENEJACK_FACILITY', 		 'TERRAIN_DESERT', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_AQUACULTURE_LAB', 		 'TERRAIN_COAST', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_AQUACULTURE_LAB', 		 'TERRAIN_OCEAN', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'TERRAIN_COAST', 	'YIELD_CULTURE', 	1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'TERRAIN_COAST', 	'YIELD_SCIENCE', 	1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'TERRAIN_OCEAN', 	'YIELD_CULTURE', 	1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'TERRAIN_OCEAN', 	'YIELD_SCIENCE', 	1),
	('BUILDING_FW_UNDERSEA_MINING', 		 'TERRAIN_COAST', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_UNDERSEA_MINING', 		 'TERRAIN_COAST', 	'YIELD_GOLD', 		1),
	('BUILDING_FW_UNDERSEA_MINING', 		 'TERRAIN_OCEAN', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_UNDERSEA_MINING', 		 'TERRAIN_OCEAN', 	'YIELD_GOLD', 		1);

----------------------------------------------
-- Yield Changes
----------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_FW_BIOFUEL_REFINERY_MAIZE',  'YIELD_FOOD', 	-4),
('BUILDING_FW_BIOFUEL_REFINERY_RICE',  	'YIELD_FOOD', 	-4),
('BUILDING_FW_BIOFUEL_REFINERY_BANANA', 'YIELD_FOOD', 	-4),
('BUILDING_FW_BIOFUEL_REFINERY',  	    'YIELD_FOOD', 	-4),
('BUILDING_FW_BIOFLESH_INDUSTRY',  	    'YIELD_FOOD', 	-6),
('BUILDING_FW_CLONE_LAB',  			'YIELD_PRODUCTION', 2),
('BUILDING_FW_BIOFLESH_INDUSTRY',	'YIELD_SCIENCE', 	4),
('BUILDING_FW_NANOFORGE',  			'YIELD_SCIENCE', 	1),
('BUILDING_FW_NANOMAT_PLANT',  		'YIELD_PRODUCTION', 2),

('BUILDING_FW_TERRAFORMING_STATION','YIELD_TOURISM', 				4),
('BUILDING_FW_TERRAFORMING_STATION','YIELD_GOLDEN_AGE_POINTS', 		4),
('BUILDING_FW_AI_NETWORK',  		'YIELD_GREAT_GENERAL_POINTS', 	2),
('BUILDING_FW_AI_NETWORK',  		'YIELD_GREAT_ADMIRAL_POINTS', 	2),
('BUILDING_FW_CENTRAL_COMMAND',  	'YIELD_SCIENCE', 				6),
('BUILDING_FW_CENTRAL_COMMAND',  	'YIELD_FOOD', 					3),

('BUILDING_FW_SERVER_HUB',  		'YIELD_CULTURE', 	2),
('BUILDING_FW_SERVER_HUB',  		'YIELD_SCIENCE', 	2),
('BUILDING_FW_SERVER_HUB',  		'YIELD_GOLD', 		2),
('BUILDING_FW_SERVER_HUB',  		'YIELD_PRODUCTION', 2),
('BUILDING_FW_SERVER_HUB',  		'YIELD_FAITH', 		2),

('BUILDING_FW_ENTERTAINMENT_SERVER','YIELD_CULTURE', 	2),
('BUILDING_FW_ENTERTAINMENT_SERVER','YIELD_TOURISM', 	2),
('BUILDING_FW_RESEARCH_SERVER',  	'YIELD_SCIENCE', 	3),
('BUILDING_FW_COMMERCE_SERVER',  	'YIELD_GOLD', 		2),
('BUILDING_FW_CLOUD_COMPUTING',  	'YIELD_PRODUCTION', 3),

('BUILDING_FW_VR_TRAINING',  		'YIELD_SCIENCE', 	1),
('BUILDING_FW_GENE_LAB',  			'YIELD_FOOD', 		3),
('BUILDING_FW_AUTOPLANT',  			'YIELD_PRODUCTION', 3),
('BUILDING_FW_CRYPTOBANK',  		'YIELD_GOLD', 		5),
('BUILDING_FW_RESEARCH_MODULE',  	'YIELD_SCIENCE', 	5),
('BUILDING_FW_ENGINEERING_MODULE',  'YIELD_PRODUCTION',	4),
('BUILDING_FW_VERTICAL_FARM',  		'YIELD_FOOD', 		6),
('BUILDING_FW_BOREHOLE',  			'YIELD_PRODUCTION', 6),
('BUILDING_FW_ECOSANCTUARY',  		'YIELD_PRODUCTION', 3),
('BUILDING_FW_NETWORK_BACKBONE',  	'YIELD_PRODUCTION', 2),
('BUILDING_FW_NETWORK_BACKBONE',  	'YIELD_SCIENCE', 	2),
('BUILDING_FW_NETWORK_BACKBONE',  	'YIELD_CULTURE', 	2),
('BUILDING_FW_MASS_DIGESTER',  		'YIELD_FOOD', 		2),
('BUILDING_FW_BIOFACTORY',  		'YIELD_FOOD', 		5),
('BUILDING_FW_GEOTHERMAL_FACTORY',  'YIELD_PRODUCTION', 4),
('BUILDING_FW_HYDROTHERMAL_FACTORY','YIELD_FOOD', 		3),
('BUILDING_FW_HYDROTHERMAL_FACTORY','YIELD_SCIENCE', 	2),
('BUILDING_FW_PARTICLE_ACCELERATOR','YIELD_SCIENCE', 	3),
('BUILDING_FW_SIMULATION_HUB',  	'YIELD_SCIENCE', 	5),
('BUILDING_FW_TELEPRESENCE_HUB',  	'YIELD_PRODUCTION', 2),
('BUILDING_FW_TELEPRESENCE_HUB',  	'YIELD_SCIENCE', 	2),
('BUILDING_FW_TELEPRESENCE_HUB',  	'YIELD_CULTURE', 	2),
('BUILDING_FW_TRANSGENIC_NURSERY',  'YIELD_SCIENCE', 	5),
('BUILDING_FW_DRONE_HIVE',  		'YIELD_PRODUCTION', 4),
('BUILDING_FW_UTILITY_FOG',  		'YIELD_PRODUCTION', 6),
('BUILDING_FW_FEEDSITE_HUB',  		'YIELD_CULTURE', 	6),
('BUILDING_FW_FEEDSITE_HUB',  		'YIELD_TOURISM', 	6),
('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'YIELD_TOURISM', 	6),
('BUILDING_FW_AQUACULTURE_LAB',  	'YIELD_CULTURE', 	2),
('BUILDING_FW_DISTRIBUTION_HUB',  	'YIELD_PRODUCTION', 5),
('BUILDING_FW_METROPLEX_HUB',  		'YIELD_GOLD', 		6),
('BUILDING_FW_CYBERCLINIC',  		'YIELD_SCIENCE', 	5),
('BUILDING_FW_FUNGAL_AGRIGENOMICS', 'YIELD_SCIENCE', 	2),
('BUILDING_FW_FUNGAL_AGRIGENOMICS', 'YIELD_CULTURE', 	2),
('BUILDING_FW_FUSION_PLANT',  		'YIELD_PRODUCTION', 20),
('BUILDING_FW_SPACE_STATION', 		'YIELD_PRODUCTION', 4),
('BUILDING_FW_SPACE_STATION', 		'YIELD_SCIENCE', 	5);

INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_FW_NANOMINES_FIELD',	        'BUILDINGCLASS_HARBOR'),
	('BUILDING_FW_NANOFORGE',	            'BUILDINGCLASS_FW_NANOMAT_PLANT'),
	('BUILDING_FW_NANOMAT_PLANT',	        'BUILDINGCLASS_LABORATORY'),
	('BUILDING_FW_GENE_LAB', 	            'BUILDINGCLASS_LABORATORY'),
	('BUILDING_FW_CLONE_LAB', 	            'BUILDINGCLASS_FW_GENE_LAB'),
	('BUILDING_FW_BIOFLESH_INDUSTRY', 	    'BUILDINGCLASS_FW_GENE_LAB'),
	('BUILDING_FW_FUNGAL_AGRIGENOMICS', 	'BUILDINGCLASS_FW_GENE_LAB'),
	('BUILDING_FW_GENEJACK_FACILITY', 		'BUILDINGCLASS_FW_FUNGAL_AGRIGENOMICS'),
	('BUILDING_FW_MASS_DIGESTER', 			'BUILDINGCLASS_FW_GENEJACK_FACILITY'),
	('BUILDING_FW_PHOTOSYSTEMS', 			'BUILDINGCLASS_FW_GENEJACK_FACILITY'),
	('BUILDING_FW_CONVERTER', 				'BUILDINGCLASS_FW_NANOMAT_PLANT'),
	('BUILDING_FW_TRANSGENIC_NURSERY', 		'BUILDINGCLASS_FW_IMPLANT_CLINIC'),
	('BUILDING_FW_TRANSGENIC_NURSERY', 		'BUILDINGCLASS_FW_GENE_LAB'),
	('BUILDING_FW_ECTOGENESIS_POD', 		'BUILDINGCLASS_FW_TRANSGENIC_NURSERY'),
	('BUILDING_FW_BIOMOD_TANK', 			'BUILDINGCLASS_FW_TRANSGENIC_NURSERY'),
	('BUILDING_FW_TERRAFORMING_STATION', 	'BUILDINGCLASS_FW_TRANSGENIC_NURSERY'),
	('BUILDING_FW_DRONE_HIVE', 				'BUILDINGCLASS_FW_AUTOPLANT'),
	('BUILDING_FW_AI_NETWORK', 				'BUILDINGCLASS_FW_DRONE_HIVE'),
	('BUILDING_FW_UTILITY_FOG', 			'BUILDINGCLASS_FW_NETWORK_BACKBONE'),
	('BUILDING_FW_AEROSPACE_COMPLEX', 		'BUILDINGCLASS_FW_LAUNCH_FACILITY'),
	('BUILDING_FW_MOON_BASE', 			    'BUILDINGCLASS_FW_AEROSPACE_COMPLEX'),
	('BUILDING_FW_ORBITAL_HABITAT', 		'BUILDINGCLASS_FW_AEROSPACE_COMPLEX'),
	('BUILDING_FW_CENTRAL_COMMAND', 		'BUILDINGCLASS_FW_AEROSPACE_COMPLEX'),
	('BUILDING_FW_CONVERTER_OIL', 			'BUILDINGCLASS_FW_NANOMAT_PLANT'),
	('BUILDING_FW_CONVERTER_IRON', 			'BUILDINGCLASS_FW_NANOMAT_PLANT'),
	('BUILDING_FW_VIRTUAL_MUSEUM', 			'BUILDINGCLASS_MUSEUM'),
	('BUILDING_FW_VIRTUAL_MUSEUM',	 		'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_CYBERPOLICE', 			'BUILDINGCLASS_POLICE_STATION'),	
	('BUILDING_FW_DIGITAL_POLICE', 			'BUILDINGCLASS_FW_CYBERPOLICE'),	
	('BUILDING_FW_VR_TRAINING', 			'BUILDINGCLASS_MILITARY_ACADEMY'),
	('BUILDING_FW_VR_TRAINING', 			'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_RESEARCH_SERVER', 		'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_RESEARCH_SERVER', 		'BUILDINGCLASS_LABORATORY'),
	('BUILDING_FW_ENTERTAINMENT_SERVER', 	'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_ENTERTAINMENT_SERVER', 	'BUILDINGCLASS_BROADCAST_TOWER'),
	('BUILDING_FW_COMMERCE_SERVER', 		'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_COMMERCE_SERVER', 		'BUILDINGCLASS_STOCK_EXCHANGE'),
	('BUILDING_FW_CLOUD_COMPUTING', 		'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_CLOUD_COMPUTING', 		'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_VERTICAL_FARM', 			'BUILDINGCLASS_GROCER'),
	('BUILDING_FW_NETWORK_BACKBONE', 		'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_UNDERSEA_MINING', 		'BUILDINGCLASS_HARBOR'),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'BUILDINGCLASS_HARBOR'),
	('BUILDING_FW_AQUACULTURE_LAB', 		'BUILDINGCLASS_HARBOR'),
	('BUILDING_FW_BIOFACTORY', 				'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_GEOTHERMAL_FACTORY', 		'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_HYDROTHERMAL_FACTORY', 	'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_PARTICLE_ACCELERATOR', 	'BUILDINGCLASS_LABORATORY'),
	('BUILDING_FW_BIOMOD_TANK', 			'BUILDINGCLASS_FW_IMPLANT_CLINIC'),
	('BUILDING_FW_TELEPRESENCE_HUB', 		'BUILDINGCLASS_FW_NETWORK_BACKBONE'),
	('BUILDING_FW_CYBERCLINIC', 			'BUILDINGCLASS_LABORATORY'),
	('BUILDING_FW_BRAIN_UPLOADING', 		'BUILDINGCLASS_FW_CYBERCLINIC'),
	('BUILDING_FW_FUSION_PLANT', 			'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_DEFENSE_FIELD', 			'BUILDINGCLASS_MILITARY_BASE'),
	('BUILDING_FW_DEFENSE_FIELD', 			'BUILDINGCLASS_BOMB_SHELTER'),
	('BUILDING_FW_AEROSPACE_COMPLEX', 		'BUILDINGCLASS_AIRPORT'),
	('BUILDING_FW_IMPLANT_CLINIC', 			'BUILDINGCLASS_HOSPITAL'),
	('BUILDING_FW_BIRTHING_PODS', 			'BUILDINGCLASS_HOSPITAL'),
	('BUILDING_FW_BIRTHING_PODS', 			'BUILDINGCLASS_FW_GENE_LAB'),
	('BUILDING_FW_AUTOPLANT', 				'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_CRYPTOBANK', 				'BUILDINGCLASS_STOCK_EXCHANGE'),
	('BUILDING_FW_ALLOY_FOUNDRY', 			'BUILDINGCLASS_FW_FUSION_PLANT'),
	('BUILDING_FW_TIDAL_PORT', 				'BUILDINGCLASS_SEAPORT'),
	('BUILDING_FW_HIGHSPEED_RAIL', 			'BUILDINGCLASS_COALING_STATION'),	
	('BUILDING_FW_LAUNCH_FACILITY', 		'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_SPACE_STATION', 			'BUILDINGCLASS_FW_LAUNCH_FACILITY'),
	('BUILDING_FW_ORBITAL_HABITAT', 		'BUILDINGCLASS_FW_LAUNCH_FACILITY'),
	('BUILDING_FW_FEEDSITE_HUB', 			'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_METROPLEX_HUB', 			'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_MYCOPROTEIN_VATS', 		'BUILDINGCLASS_MEDICAL_LAB'),
	('BUILDING_FW_DISTRIBUTION_HUB', 		'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_SIMULATION_HUB', 			'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_RESEARCH_MODULE',	 		'BUILDINGCLASS_FW_LAUNCH_FACILITY'),
	('BUILDING_FW_RESEARCH_MODULE', 		'BUILDINGCLASS_FW_SPACE_STATION'),
	('BUILDING_FW_ENGINEERING_MODULE', 		'BUILDINGCLASS_FW_LAUNCH_FACILITY'),
	('BUILDING_FW_ENGINEERING_MODULE', 		'BUILDINGCLASS_FW_SPACE_STATION'),
	('BUILDING_FW_COMM_MODULE', 			'BUILDINGCLASS_FW_LAUNCH_FACILITY'),
	('BUILDING_FW_COMM_MODULE', 			'BUILDINGCLASS_FW_SPACE_STATION'),
	('BUILDING_FW_MOON_BASE', 				'BUILDINGCLASS_FW_LAUNCH_FACILITY');

INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_FW_METROPLEX_HUB', 		'SPECIALIST_MERCHANT', 'YIELD_GOLD',		1),
	('BUILDING_FW_DISTRIBUTION_HUB', 	'SPECIALIST_ENGINEER', 	'YIELD_PRODUCTION',	1),
	('BUILDING_FW_SIMULATION_HUB', 		'SPECIALIST_SCIENTIST', 'YIELD_SCIENCE',	1),
	('BUILDING_FW_FEEDSITE_HUB', 		'SPECIALIST_WRITER', 	'YIELD_CULTURE',	1),
	('BUILDING_FW_FEEDSITE_HUB', 		'SPECIALIST_MUSICIAN', 	'YIELD_CULTURE',	1),
	('BUILDING_FW_FEEDSITE_HUB', 		'SPECIALIST_ARTIST', 	'YIELD_CULTURE',	1),
	('BUILDING_FW_RESEARCH_MODULE', 	'SPECIALIST_SCIENTIST', 'YIELD_SCIENCE',	1),
	('BUILDING_FW_ENGINEERING_MODULE', 	'SPECIALIST_ENGINEER', 	'YIELD_PRODUCTION',	1),
	('BUILDING_FW_COMM_MODULE', 		'SPECIALIST_MERCHANT', 	'YIELD_GOLD',		1),
	('BUILDING_FW_ORBITAL_HABITAT', 	'SPECIALIST_MERCHANT', 	'YIELD_FOOD',		1),
	('BUILDING_FW_ORBITAL_HABITAT', 	'SPECIALIST_ENGINEER', 	'YIELD_FOOD',		1),
	('BUILDING_FW_ORBITAL_HABITAT', 	'SPECIALIST_SCIENTIST', 'YIELD_FOOD',		1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_ENGINEER',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_ENGINEER',		'YIELD_SCIENCE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_ENGINEER',		'YIELD_GOLD',		1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_ENGINEER',		'YIELD_CULTURE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_SCIENTIST',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_SCIENTIST',		'YIELD_SCIENCE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_SCIENTIST',		'YIELD_GOLD',		1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_SCIENTIST',		'YIELD_CULTURE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_WRITER',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_WRITER',		'YIELD_SCIENCE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_WRITER',		'YIELD_GOLD',		1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_WRITER',		'YIELD_CULTURE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_ARTIST',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_ARTIST',		'YIELD_SCIENCE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_ARTIST',		'YIELD_GOLD',		1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_ARTIST',		'YIELD_CULTURE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_MUSICIAN',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_MUSICIAN',		'YIELD_SCIENCE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_MUSICIAN',		'YIELD_GOLD',		1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_MUSICIAN',		'YIELD_CULTURE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_MERCHANT',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_MERCHANT',		'YIELD_SCIENCE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_MERCHANT',		'YIELD_GOLD',		1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_MERCHANT',		'YIELD_CULTURE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_CIVIL_SERVANT',	'YIELD_PRODUCTION',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_CIVIL_SERVANT',	'YIELD_SCIENCE',	1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_CIVIL_SERVANT',	'YIELD_GOLD',		1),
	('BUILDING_FW_FUSION_PLANT',	'SPECIALIST_CIVIL_SERVANT',	'YIELD_CULTURE',	1),
	('BUILDING_FW_BIRTHING_PODS', 	'SPECIALIST_SCIENTIST', 	'YIELD_SCIENCE', 	2),
	('BUILDING_FW_BIRTHING_PODS', 	'SPECIALIST_ENGINEER', 		'YIELD_PRODUCTION', 2),
	('BUILDING_FW_BIRTHING_PODS', 	'SPECIALIST_MERCHANT', 		'YIELD_GOLD', 		2),
	('BUILDING_FW_BIRTHING_PODS', 	'SPECIALIST_MUSICIAN', 		'YIELD_CULTURE', 	1),
	('BUILDING_FW_BIRTHING_PODS', 	'SPECIALIST_ARTIST', 		'YIELD_CULTURE', 	1),
	('BUILDING_FW_BIRTHING_PODS', 	'SPECIALIST_WRITER', 		'YIELD_CULTURE', 	1),
	('BUILDING_FW_BIRTHING_PODS', 	'SPECIALIST_CIVIL_SERVANT',	'YIELD_CULTURE',	2),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_ENGINEER',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_ENGINEER',		'YIELD_SCIENCE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_ENGINEER',		'YIELD_GOLD',		1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_ENGINEER',		'YIELD_CULTURE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_SCIENTIST',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_SCIENTIST',		'YIELD_SCIENCE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_SCIENTIST',		'YIELD_GOLD',		1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_SCIENTIST',		'YIELD_CULTURE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_WRITER',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_WRITER',		'YIELD_SCIENCE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_WRITER',		'YIELD_GOLD',		1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_WRITER',		'YIELD_CULTURE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_ARTIST',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_ARTIST',		'YIELD_SCIENCE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_ARTIST',		'YIELD_GOLD',		1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_ARTIST',		'YIELD_CULTURE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_MUSICIAN',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_MUSICIAN',		'YIELD_SCIENCE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_MUSICIAN',		'YIELD_GOLD',		1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_MUSICIAN',		'YIELD_CULTURE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_MERCHANT',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_MERCHANT',		'YIELD_SCIENCE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_MERCHANT',		'YIELD_GOLD',		1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_MERCHANT',		'YIELD_CULTURE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_CIVIL_SERVANT',	'YIELD_PRODUCTION',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_CIVIL_SERVANT',	'YIELD_SCIENCE',	1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_CIVIL_SERVANT',	'YIELD_GOLD',		1),
	('BUILDING_FW_BRAIN_UPLOADING',	'SPECIALIST_CIVIL_SERVANT',	'YIELD_CULTURE',	1);

INSERT INTO Building_SpecificGreatPersonRateModifier (BuildingType, SpecialistType, Modifier) VALUES
('BUILDING_FW_RESEARCH_SERVER', 	 'SPECIALIST_SCIENTIST', 10),
('BUILDING_FW_COMMERCE_SERVER', 	 'SPECIALIST_MERCHANT',  10),
('BUILDING_FW_CLOUD_COMPUTING', 	 'SPECIALIST_ENGINEER',  10),
('BUILDING_FW_ENTERTAINMENT_SERVER', 'SPECIALIST_ARTIST', 	 5),
('BUILDING_FW_ENTERTAINMENT_SERVER', 'SPECIALIST_WRITER', 	 5),
('BUILDING_FW_ENTERTAINMENT_SERVER', 'SPECIALIST_MUSICIAN',  5),
('BUILDING_FW_VIRTUAL_MUSEUM', 		 'SPECIALIST_ARTIST', 	 15),
('BUILDING_FW_CYBERCLINIC', 		 'SPECIALIST_SCIENTIST', 25);

INSERT INTO Corporation_BuildingClassYieldChanges (CorporationType, BuildingClassType, YieldType, YieldChange) VALUES
('CORPORATION_CIVILIZED_JEWELERS', 'BUILDINGCLASS_FW_SEAWATER_ARTIFICIAL_REEF', 'YIELD_GOLDEN_AGE_POINTS', 	4),
('CORPORATION_GIORGIO_ARMEIER',    'BUILDINGCLASS_FW_VIRTUAL_MUSEUM', 			'YIELD_CULTURE', 			2),
('CORPORATION_FIRAXITE_MATERIALS', 'BUILDINGCLASS_FW_PARTICLE_ACCELERATOR', 	'YIELD_SCIENCE', 			3),
('CORPORATION_LANDSEA_EXTRACTORS', 'BUILDINGCLASS_FW_UNDERSEA_MINING', 			'YIELD_PRODUCTION', 		2),
('CORPORATION_TWOKAY_FOODS', 	   'BUILDINGCLASS_FW_AQUACULTURE_LAB', 			'YIELD_FOOD', 				3),
('CORPORATION_TWOKAY_FOODS', 	   'BUILDINGCLASS_FW_MYCOPROTEIN_VATS', 		'YIELD_FOOD', 				3),
('CORPORATION_HEXXON_REFINERY',    'BUILDINGCLASS_FW_FUSION_PLANT', 			'YIELD_PRODUCTION', 		3);


-- INSERT INTO Building_YieldFromBirthRetroactive
-- 	(BuildingType, YieldType, Yield)
-- SELECT
-- 	Type, 'YIELD_SCIENCE', 50
-- FROM Buildings
-- WHERE BuildingClass = 'BUILDINGCLASS_MEDICAL_LAB';

--------------------------------
-- Building_HurryModifiersLocal
--------------------------------
INSERT INTO Building_HurryModifiersLocal
	(BuildingType, HurryType, HurryCostModifier)
VALUES
	('BUILDING_FW_CRYPTOBANK', 		'HURRY_GOLD', -15),
	('BUILDING_FW_METROPLEX_HUB', 	'HURRY_GOLD', -15);


INSERT INTO Building_YieldFromSpyDefense
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_CYBERPOLICE', 			'YIELD_SCIENCE', 	25),
	('BUILDING_FW_CYBERPOLICE', 			'YIELD_GOLD', 		25),
	('BUILDING_FW_DIGITAL_POLICE', 			'YIELD_SCIENCE', 	25),
	('BUILDING_FW_DIGITAL_POLICE', 			'YIELD_GOLD', 		25);
	
-- Building_YieldPerXTerrainTimes100
INSERT INTO Building_YieldPerXTerrainTimes100
	(BuildingType, TerrainType, YieldType, Yield)
VALUES 
	('BUILDING_FW_GEOTHERMAL_FACTORY', 'TERRAIN_MOUNTAIN',	'YIELD_PRODUCTION', 200),
	('BUILDING_FW_GEOTHERMAL_FACTORY', 'TERRAIN_MOUNTAIN',	'YIELD_GOLD', 		200);		

INSERT INTO Building_YieldFromYieldPercent
	(BuildingType, YieldIn, YieldOut, Value)
VALUES
	('BUILDING_FW_ECOSANCTUARY', 		 'YIELD_PRODUCTION', 'YIELD_CULTURE', 		10),
	('BUILDING_FW_BIOFACTORY', 			 'YIELD_PRODUCTION', 'YIELD_FOOD', 	 		10),
	('BUILDING_FW_BOREHOLE', 			 'YIELD_PRODUCTION', 'YIELD_GOLD',	 		10),
	('BUILDING_FW_GEOTHERMAL_FACTORY', 	 'YIELD_PRODUCTION', 'YIELD_GOLD',	 		5),
	('BUILDING_FW_GEOTHERMAL_FACTORY', 	 'YIELD_PRODUCTION', 'YIELD_PRODUCTION',	5),
	('BUILDING_FW_HYDROTHERMAL_FACTORY', 'YIELD_PRODUCTION', 'YIELD_FOOD', 	 		5),
	('BUILDING_FW_HYDROTHERMAL_FACTORY', 'YIELD_PRODUCTION', 'YIELD_SCIENCE', 		5),
	('BUILDING_FW_VERTICAL_FARM', 		 'YIELD_FOOD', 		'YIELD_SCIENCE', 		5);



INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield) VALUES
('BUILDING_FW_MOON_BASE', 				'YIELD_SCIENTIST', 	10),
('BUILDING_FW_MOON_BASE', 				'YIELD_PRODUCTION', 10),
('BUILDING_FW_MOON_BASE', 				'YIELD_GOLD', 		10),
('BUILDING_FW_MYCOPROTEIN_VATS', 		'YIELD_FOOD', 		25),
('BUILDING_FW_VIRTUAL_MUSEUM', 			'YIELD_CULTURE', 	25),
('BUILDING_FW_VIRTUAL_MUSEUM', 			'YIELD_TOURISM', 	25),
('BUILDING_FW_LAUNCH_FACILITY',  		'YIELD_PRODUCTION', 10),
('BUILDING_FW_LAUNCH_FACILITY',  		'YIELD_SCIENCE',	10),
('BUILDING_FW_LAUNCH_FACILITY',  		'YIELD_GOLD', 		10),
('BUILDING_FW_AUTOPLANT',  				'YIELD_PRODUCTION', 20), -- 1/5 pop
('BUILDING_FW_CRYPTOBANK',  			'YIELD_GOLD', 		20),
('BUILDING_FW_PARTICLE_ACCELERATOR',  	'YIELD_SCIENCE', 	20),
('BUILDING_FW_RESEARCH_SERVER', 		'YIELD_SCIENCE',	20),
('BUILDING_FW_ENTERTAINMENT_SERVER', 	'YIELD_CULTURE', 	20),
('BUILDING_FW_COMMERCE_SERVER', 		'YIELD_GOLD', 		20),
('BUILDING_FW_CLOUD_COMPUTING', 		'YIELD_PRODUCTION', 20),
('BUILDING_FW_COMM_MODULE',  			'YIELD_GOLD', 		25),
('BUILDING_FW_RESEARCH_MODULE',  		'YIELD_SCIENCE', 	25),
('BUILDING_FW_ENGINEERING_MODULE',  	'YIELD_PRODUCTION', 25),
('BUILDING_FW_MASS_DIGESTER', 			'YIELD_FOOD',		100),
('BUILDING_FW_BRAIN_UPLOADING', 		'YIELD_GOLD', 		100),
('BUILDING_FW_BRAIN_UPLOADING', 		'YIELD_FAITH', 		100),
('BUILDING_FW_BRAIN_UPLOADING', 		'YIELD_SCIENCE', 	100),
('BUILDING_FW_BRAIN_UPLOADING', 		'YIELD_CULTURE', 	100),
('BUILDING_FW_BRAIN_UPLOADING', 		'YIELD_PRODUCTION', 100);

INSERT INTO Building_GreatWorkYieldChangesLocal
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_FEEDSITE_HUB', 	'YIELD_CULTURE', 1),
	('BUILDING_FW_VIRTUAL_MUSEUM',  'YIELD_CULTURE', 1),
	('BUILDING_FW_VIRTUAL_MUSEUM',  'YIELD_TOURISM', 1);

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_FW_AQUACULTURE_LAB',    	'FEATURE_OASIS', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_AQUACULTURE_LAB',    	'FEATURE_OASIS', 	'YIELD_GOLD', 		1),
	('BUILDING_FW_PHOTOSYSTEMS', 		'FEATURE_FOREST', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_PHOTOSYSTEMS', 		'FEATURE_MARSH', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_PHOTOSYSTEMS', 		'FEATURE_MARSH', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_PHOTOSYSTEMS', 		'FEATURE_JUNGLE', 	'YIELD_PRODUCTION', 1);

INSERT INTO Building_ResourceQuantity
	(BuildingType,						ResourceType,		Quantity) 
VALUES
	('BUILDING_FW_ENRICHMENT_FACILITY',	'RESOURCE_URANIUM',		2),
	('BUILDING_FW_BIOFLESH_INDUSTRY', 	'RESOURCE_ADN_FUNGUS', 	5),
	('BUILDING_FW_BIOFUEL_REFINERY',	    'RESOURCE_OIL',		3),
	('BUILDING_FW_BIOFUEL_REFINERY_RICE',	'RESOURCE_OIL',		3),
	('BUILDING_FW_BIOFUEL_REFINERY_BANANA',	'RESOURCE_OIL',		3),
	('BUILDING_FW_BIOFUEL_REFINERY_MAIZE',	'RESOURCE_OIL',		3),
	('BUILDING_FW_IMPLANT_CLINIC',		'RESOURCE_IMPLANT',		5),
	('BUILDING_FW_CYBERCLINIC',			'RESOURCE_IMPLANT',		6),
	('BUILDING_FW_NANOMAT_PLANT',		'RESOURCE_NANOMAT',		5),
	('BUILDING_FW_CONVERTER',			'RESOURCE_NANOMAT',		4),
	('BUILDING_FW_CONVERTER_OIL',		'RESOURCE_NANOMAT',		3),
	('BUILDING_FW_CONVERTER_IRON',		'RESOURCE_NANOMAT',		3),
	('BUILDING_FW_ALLOY_FOUNDRY',		'RESOURCE_NANOMAT',		8),
	('BUILDING_FW_UTILITY_FOG',			'RESOURCE_NANOMAT',		3),
	('BUILDING_FW_AI_NETWORK',			'RESOURCE_IMPLANT',		3),
	('BUILDING_FW_CENTRAL_COMMAND',		'RESOURCE_NANOMAT',		3),
	('BUILDING_FW_TERRAFORMING_STATION','RESOURCE_ADN_FUNGUS',	3),
	('BUILDING_FW_MOON_BASE',			'RESOURCE_NANOMAT',		7);

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_ORBITAL_HABITAT', 'YIELD_PRODUCTION', 10);

INSERT INTO Building_FreeUnits 
	(BuildingType,						UnitType,				NumUnits)
VALUES	
	('BUILDING_FW_CLONE_LAB', 			'UNIT_FW_CLONETROOPER',		1);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, 						ImprovementType, 						YieldType, 		Yield)
VALUES
	('BUILDING_FW_CENTRAL_COMMAND', 	 'IMPROVEMENT_FW_ARCOLOGY',   			'YIELD_FOOD', 		2),
	('BUILDING_FW_CENTRAL_COMMAND', 	 'IMPROVEMENT_FW_ARCOLOGY',   			'YIELD_PRODUCTION', 2),
	('BUILDING_FW_CENTRAL_COMMAND', 	 'IMPROVEMENT_FW_WATER_ARCOLOGY',   	'YIELD_FOOD', 		2),
	('BUILDING_FW_CENTRAL_COMMAND', 	 'IMPROVEMENT_FW_WATER_ARCOLOGY',   	'YIELD_PRODUCTION', 2),
	('BUILDING_FW_TERRAFORMING_STATION', 'IMPROVEMENT_FW_GENOCENTRE',   		'YIELD_CULTURE', 	2),
	('BUILDING_FW_TERRAFORMING_STATION', 'IMPROVEMENT_FW_GENOCENTRE',   		'YIELD_SCIENCE', 	2),
	('BUILDING_FW_TERRAFORMING_STATION', 'IMPROVEMENT_FW_WATER_GENOCENTRE',   	'YIELD_CULTURE', 	2),
	('BUILDING_FW_TERRAFORMING_STATION', 'IMPROVEMENT_FW_WATER_GENOCENTRE',   	'YIELD_SCIENCE', 	2),
	('BUILDING_FW_AUTOPLANT', 			 'IMPROVEMENT_FW_INDUSTRIAL_COMPLEX',   'YIELD_PRODUCTION', 1),
	('BUILDING_FW_AUTOPLANT', 			 'IMPROVEMENT_FW_INDUSTRIAL_COMPLEX',   'YIELD_GOLD', 		1),
	('BUILDING_FW_CRYPTOBANK', 			 'IMPROVEMENT_CUSTOMS_HOUSE',   		'YIELD_GOLD', 		1),
	('BUILDING_FW_CRYPTOBANK', 			 'IMPROVEMENT_TRADING_POST',   			'YIELD_GOLD', 		1),
	('BUILDING_FW_PARTICLE_ACCELERATOR', 'IMPROVEMENT_FW_HERC', 				'YIELD_SCIENCE', 	1),
	('BUILDING_FW_PARTICLE_ACCELERATOR', 'IMPROVEMENT_FW_HERC', 				'YIELD_GOLD', 		1),
	('BUILDING_FW_BOREHOLE', 			 'IMPROVEMENT_MINE', 					'YIELD_PRODUCTION', 2),
	('BUILDING_FW_BOREHOLE', 			 'IMPROVEMENT_QUARRY', 					'YIELD_PRODUCTION', 2),
	('BUILDING_FW_BOREHOLE', 			 'IMPROVEMENT_WELL', 					'YIELD_PRODUCTION', 2),
	('BUILDING_FW_VERTICAL_FARM', 		 'IMPROVEMENT_FARM', 					'YIELD_FOOD', 		1),
	('BUILDING_FW_VERTICAL_FARM', 		 'IMPROVEMENT_FW_HYDROPONICS_DOME', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_VERTICAL_FARM', 		 'IMPROVEMENT_FW_WATER_HYDROPONICS_DOME', 'YIELD_FOOD', 	1),
	('BUILDING_FW_VERTICAL_FARM', 		 'IMPROVEMENT_TERRACE_FARM', 			'YIELD_FOOD', 		1),
	('BUILDING_FW_VERTICAL_FARM', 		 'IMPROVEMENT_PLANTATION', 				'YIELD_FOOD', 		1),
	('BUILDING_FW_VERTICAL_FARM', 		 'IMPROVEMENT_POLDER', 					'YIELD_FOOD', 		1),
	('BUILDING_FW_ECOSANCTUARY', 		 'IMPROVEMENT_FW_PRESERVE', 			'YIELD_PRODUCTION', 1),
	('BUILDING_FW_ECOSANCTUARY', 		 'IMPROVEMENT_FW_BIOWELL', 				'YIELD_PRODUCTION', 1),
	('BUILDING_FW_ECOSANCTUARY', 		 'IMPROVEMENT_BRAZILWOOD_CAMP', 		'YIELD_PRODUCTION', 1),
	('BUILDING_FW_ECOSANCTUARY', 		 'IMPROVEMENT_LUMBERMILL', 				'YIELD_PRODUCTION', 1),
	('BUILDING_FW_ECOSANCTUARY', 		 'IMPROVEMENT_CAMP', 					'YIELD_PRODUCTION', 1),
	('BUILDING_FW_DISTRIBUTION_HUB', 	 'IMPROVEMENT_FW_INDUSTRIAL_COMPLEX', 	'YIELD_PRODUCTION', 2),
	('BUILDING_FW_DISTRIBUTION_HUB', 	 'IMPROVEMENT_FW_INDUSTRIAL_COMPLEX', 	'YIELD_GOLD', 		1),
	('BUILDING_FW_DISTRIBUTION_HUB', 	 'IMPROVEMENT_MANUFACTORY', 			'YIELD_PRODUCTION', 2),
	('BUILDING_FW_DISTRIBUTION_HUB', 	 'IMPROVEMENT_MANUFACTORY', 			'YIELD_GOLD', 		1),
	('BUILDING_FW_SIMULATION_HUB', 	 	 'IMPROVEMENT_FW_HERC', 				'YIELD_SCIENCE', 	2),
	('BUILDING_FW_SIMULATION_HUB', 	 	 'IMPROVEMENT_FW_HERC', 				'YIELD_GOLD', 		1),
	('BUILDING_FW_SIMULATION_HUB', 	 	 'IMPROVEMENT_ACADEMY', 				'YIELD_SCIENCE', 	2),
	('BUILDING_FW_SIMULATION_HUB', 	 	 'IMPROVEMENT_ACADEMY', 				'YIELD_GOLD', 		1),
	('BUILDING_FW_METROPLEX_HUB', 		 'IMPROVEMENT_TRADING_POST', 			'YIELD_GOLD', 		3),
	('BUILDING_FW_METROPLEX_HUB', 		 'IMPROVEMENT_CUSTOMS_HOUSE', 			'YIELD_GOLD', 		3),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FW_FUNGAL_GROWTH', 		'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FW_FUNGAL_GROWTH', 		'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FW_CORE', 				'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FW_CORE', 				'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FW_WATER_CORE', 			'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FW_WATER_CORE', 			'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FW_VAULT', 				'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FW_VAULT', 				'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FORT', 					'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FORT', 					'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_CITADEL', 				'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_CITADEL', 				'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_ZULU_KRAAL', 				'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_ZULU_KRAAL', 				'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_CELTS_OPPIDUM', 			'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_CELTS_OPPIDUM', 			'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_MONGOLIA_ORDO', 			'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_MONGOLIA_ORDO', 			'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_OTTOMAN_TERSANE', 		'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_OTTOMAN_TERSANE', 		'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_CHATEAU', 				'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_CHATEAU', 				'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FEITORIA', 				'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FEITORIA', 				'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_KASBAH', 					'YIELD_GOLD', 			2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_KASBAH', 					'YIELD_CULTURE_LOCAL', 	2),
	('BUILDING_FW_TRANSGENIC_NURSERY', 	 'IMPROVEMENT_FW_BIOWELL', 				'YIELD_FOOD', 		1),
	('BUILDING_FW_TRANSGENIC_NURSERY', 	 'IMPROVEMENT_FW_BIOWELL', 				'YIELD_SCIENCE', 	1),
	('BUILDING_FW_AEROSPACE_COMPLEX', 	 'IMPROVEMENT_FW_HYDROPONICS_DOME', 		'YIELD_CULTURE', 1),
	('BUILDING_FW_AEROSPACE_COMPLEX', 	 'IMPROVEMENT_FW_WATER_HYDROPONICS_DOME', 	'YIELD_CULTURE', 1),
	('BUILDING_FW_AEROSPACE_COMPLEX',    'IMPROVEMENT_FW_HYDROPONICS_DOME', 		'YIELD_PRODUCTION', 1),
	('BUILDING_FW_AEROSPACE_COMPLEX', 	 'IMPROVEMENT_FW_WATER_HYDROPONICS_DOME', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_DRONE_HIVE', 		 	 'IMPROVEMENT_FW_GENERATOR', 			'YIELD_PRODUCTION', 1),
	('BUILDING_FW_DRONE_HIVE', 		 	 'IMPROVEMENT_FW_GENERATOR', 			'YIELD_GOLD', 		1);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	-- ('BUILDING_FW_VERTICAL_FARM', 'BUILDINGCLASS_FW_VERTICAL_FARM', 'YIELD_SCIENCE', 2),
	('BUILDING_FW_BIOFACTORY', 'BUILDINGCLASS_FW_BIOFACTORY', 'YIELD_FOOD', 2),
	('BUILDING_FW_AUTOPLANT', 'BUILDINGCLASS_FW_AUTOPLANT', 'YIELD_PRODUCTION', 1),
	('BUILDING_FW_PARTICLE_ACCELERATOR', 'BUILDINGCLASS_FW_PARTICLE_ACCELERATOR', 'YIELD_SCIENCE', 1),
	('BUILDING_FW_ECOSANCTUARY', 'BUILDINGCLASS_FW_ECOSANCTUARY', 'YIELD_CULTURE', 2),
	('BUILDING_FW_BOREHOLE', 	'BUILDINGCLASS_FW_BOREHOLE', 'YIELD_GOLD', 2),
	('BUILDING_FW_CRYPTOBANK', 'BUILDINGCLASS_FW_CRYPTOBANK', 'YIELD_GOLD', 1),
	('BUILDING_FW_GEOTHERMAL_FACTORY', 'BUILDINGCLASS_FW_GEOTHERMAL_FACTORY', 'YIELD_PRODUCTION', 2),
	('BUILDING_FW_HYDROTHERMAL_FACTORY', 'BUILDINGCLASS_FW_HYDROTHERMAL_FACTORY', 'YIELD_SCIENCE', 2),

	('BUILDING_FW_NETWORK_BACKBONE', 'BUILDINGCLASS_FW_RESEARCH_SERVER', 'YIELD_SCIENCE', 1),
	('BUILDING_FW_NETWORK_BACKBONE', 'BUILDINGCLASS_FW_ENTERTAINMENT_SERVER', 'YIELD_CULTURE', 1),
	('BUILDING_FW_NETWORK_BACKBONE', 'BUILDINGCLASS_FW_COMMERCE_SERVER', 'YIELD_GOLD', 1),
	('BUILDING_FW_NETWORK_BACKBONE', 'BUILDINGCLASS_FW_CLOUD_COMPUTING', 'YIELD_PRODUCTION', 1),
	('BUILDING_FW_CYBERCLINIC', 'BUILDINGCLASS_HOSPITAL', 'YIELD_SCIENCE', 3),
	('BUILDING_FW_CYBERCLINIC', 'BUILDINGCLASS_FW_CLONE_LAB', 'YIELD_SCIENCE', 3),
	('BUILDING_FW_ORBITAL_HABITAT', 'BUILDINGCLASS_FW_ENGINEERING_MODULE', 'YIELD_PRODUCTION', 2),
	('BUILDING_FW_ORBITAL_HABITAT', 'BUILDINGCLASS_FW_RESEARCH_MODULE', 'YIELD_SCIENCE', 2),
	('BUILDING_FW_ORBITAL_HABITAT', 'BUILDINGCLASS_FW_COMM_MODULE', 'YIELD_GOLD', 2),
	('BUILDING_FW_SPACE_STATION', 'BUILDINGCLASS_FW_ORBITAL_HABITAT', 'YIELD_FOOD', 2),
	('BUILDING_FW_MOON_BASE', 'BUILDINGCLASS_FW_FUSION_PLANT', 'YIELD_PRODUCTION', 5),
	('BUILDING_FW_MOON_BASE', 'BUILDINGCLASS_FW_SPACE_STATION', 'YIELD_PRODUCTION', 1),
	('BUILDING_FW_MOON_BASE', 'BUILDINGCLASS_FW_SPACE_STATION', 'YIELD_GOLD', 1),
	('BUILDING_FW_MOON_BASE', 'BUILDINGCLASS_FW_SPACE_STATION', 'YIELD_SCIENCE', 1),
	('BUILDING_FW_GENOME_PROJECT_1', 'BUILDINGCLASS_LABORATORY', 'YIELD_SCIENCE', 2),
	('BUILDING_FW_GENOME_PROJECT_1', 'BUILDINGCLASS_MEDICAL_LAB', 'YIELD_FOOD', 2),
	('BUILDING_FW_GENOME_PROJECT_2', 'BUILDINGCLASS_FW_GENE_LAB', 'YIELD_SCIENCE', 2),
	('BUILDING_FW_ASTEROID_MINING', 'BUILDINGCLASS_FW_ENGINEERING_MODULE', 'YIELD_PRODUCTION', 1),
	('BUILDING_FW_ASTEROID_MINING', 'BUILDINGCLASS_FW_RESEARCH_MODULE', 'YIELD_SCIENCE', 1),
	('BUILDING_FW_ASTEROID_MINING', 'BUILDINGCLASS_FW_COMM_MODULE', 'YIELD_GOLD', 1);


INSERT INTO Building_ThemingYieldBonus
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_VIRTUAL_MUSEUM', 'YIELD_CULTURE', 5);

-- add Utility Fog to Defender of Faith Belief
INSERT INTO Belief_BuildingClassYieldChanges (BeliefType, BuildingClassType, YieldType, YieldChange)
SELECT DISTINCT BeliefType, 'BUILDINGCLASS_FW_UTILITY_FOG', YieldType, YieldChange
FROM Belief_BuildingClassYieldChanges WHERE BeliefType = 'BELIEF_DEFENDER_FAITH';
INSERT INTO Belief_BuildingClassYieldChanges (BeliefType, BuildingClassType, YieldType, YieldChange)
SELECT DISTINCT BeliefType, 'BUILDINGCLASS_FW_DEFENSE_FIELD', YieldType, YieldChange
FROM Belief_BuildingClassYieldChanges WHERE BeliefType = 'BELIEF_DEFENDER_FAITH';

-- Ceremony (Tradition)
INSERT INTO Policy_BuildingClassHappiness (PolicyType, BuildingClassType, Happiness)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_FW_MOON_BASE', Happiness
FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_LEGALISM';

-- Division of Labor (Industry)
INSERT INTO Policy_BuildingClassYieldModifiers (PolicyType, BuildingClassType, YieldType, YieldMod)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_FW_AUTOPLANT', YieldType, YieldMod
FROM Policy_BuildingClassYieldModifiers WHERE PolicyType = 'POLICY_TRADE_UNIONS';

-- Colonialism (Imperialism)
INSERT INTO Policy_BuildingClassYieldChanges (PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_FW_NANOFORGE', YieldType, YieldChange
FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_NAVAL_TRADITION';

INSERT INTO Policy_BuildingClassCultureChanges (PolicyType, BuildingClassType, CultureChange)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_FW_NANOFORGE', CultureChange
FROM Policy_BuildingClassCultureChanges WHERE PolicyType = 'POLICY_NAVAL_TRADITION';

INSERT INTO Policy_BuildingClassCultureChanges(PolicyType, BuildingClassType, CultureChange) VALUES
('POLICY_NAVAL_TRADITION', 'BUILDINGCLASS_FW_IMPLANT_CLINIC', 1);

INSERT INTO Policy_BuildingClassYieldChanges (PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_FW_VR_TRAINING', YieldType, YieldChange
FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_NAVAL_TRADITION';

INSERT INTO Policy_BuildingClassCultureChanges (PolicyType, BuildingClassType, CultureChange)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_FW_VR_TRAINING', CultureChange
FROM Policy_BuildingClassCultureChanges WHERE PolicyType = 'POLICY_NAVAL_TRADITION';

INSERT INTO Policy_BuildingClassYieldChanges
	(PolicyType, BuildingClassType, YieldType, YieldChange)
VALUES
	('POLICY_CREATIVE_EXPRESSION', 	 'BUILDINGCLASS_FW_VIRTUAL_MUSEUM', 		'YIELD_CULTURE', 	        3),
	('POLICY_CREATIVE_EXPRESSION', 	 'BUILDINGCLASS_FW_VIRTUAL_MUSEUM', 		'YIELD_GOLDEN_AGE_POINTS', 	3),
	('POLICY_MOBILIZATION', 	 'BUILDINGCLASS_FW_NANOMINES_FIELD', 	'YIELD_SCIENCE', 	3),
	('POLICY_MOBILIZATION', 	 'BUILDINGCLASS_FW_DEFENSE_FIELD', 		'YIELD_SCIENCE', 	3),
	('POLICY_MOBILIZATION', 	 'BUILDINGCLASS_FW_UTILITY_FOG', 		'YIELD_SCIENCE', 	3),
	('POLICY_SCHOLASTICISM', 	 'BUILDINGCLASS_FW_CYBERPOLICE', 		'YIELD_SCIENCE', 	3),
	('POLICY_SCHOLASTICISM', 	 'BUILDINGCLASS_FW_DIGITAL_POLICE', 	'YIELD_SCIENCE', 	3),
	('POLICY_FORTIFIED_BORDERS', 'BUILDINGCLASS_FW_CYBERPOLICE', 		'YIELD_PRODUCTION', 5),
	('POLICY_FORTIFIED_BORDERS', 'BUILDINGCLASS_FW_CYBERPOLICE', 		'YIELD_CULTURE', 	3),
	('POLICY_FORTIFIED_BORDERS', 'BUILDINGCLASS_FW_DIGITAL_POLICE', 	'YIELD_PRODUCTION', 5),
	('POLICY_FORTIFIED_BORDERS', 'BUILDINGCLASS_FW_DIGITAL_POLICE', 	'YIELD_CULTURE', 	3);

INSERT INTO Policy_BuildingClassHappiness
	(PolicyType, BuildingClassType, Happiness)
VALUES
	('POLICY_POLICE_STATE', 'BUILDINGCLASS_FW_CYBERPOLICE', 		1),
	('POLICY_POLICE_STATE', 'BUILDINGCLASS_FW_DIGITAL_POLICE', 		1);

INSERT INTO Policy_BuildingClassProductionModifiers
	(PolicyType, BuildingClassType, ProductionModifier)
VALUES
	('POLICY_TRADE_UNIONS', 		'BUILDINGCLASS_FW_HIGHSPEED_RAIL', 		100),
	('POLICY_FORTIFIED_BORDERS', 	'BUILDINGCLASS_FW_CYBERPOLICE', 		100),
	('POLICY_FORTIFIED_BORDERS', 	'BUILDINGCLASS_FW_DIGITAL_POLICE', 		100);


INSERT INTO Building_PlotYieldChanges 
	(BuildingType,							PlotType,			YieldType,			Yield) 
VALUES		
	('BUILDING_FW_GEOTHERMAL_FACTORY',		'PLOT_HILLS',		'YIELD_PRODUCTION',	1);

INSERT INTO Policy_BuildingClassYieldModifiers
	(PolicyType, BuildingClassType, YieldType, YieldMod)
VALUES
	('POLICY_MERCANTILISM', 	'BUILDINGCLASS_FW_CRYPTOBANK', 		'YIELD_CULTURE', 	3),
	('POLICY_MERCANTILISM', 	'BUILDINGCLASS_FW_CRYPTOBANK', 		'YIELD_SCIENCE', 	3),
	('POLICY_TRADE_UNIONS', 	'BUILDINGCLASS_FW_NANOFORGE', 		'YIELD_PRODUCTION', 3),
	('POLICY_TRADE_UNIONS', 	'BUILDINGCLASS_FW_NANOFORGE', 		'YIELD_GOLD', 		3),
	('POLICY_TRADE_UNIONS', 	'BUILDINGCLASS_FW_HIGHSPEED_RAIL', 	'YIELD_PRODUCTION', 3),
	('POLICY_TRADE_UNIONS', 	'BUILDINGCLASS_FW_HIGHSPEED_RAIL', 	'YIELD_GOLD', 		3);



INSERT INTO Building_YieldFromInternalTR
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_HIGHSPEED_RAIL', 'YIELD_FOOD', 		8),
	('BUILDING_FW_HIGHSPEED_RAIL', 'YIELD_PRODUCTION', 	4);


INSERT INTO Unit_ProductionModifierBuildings (UnitType,	BuildingType,	ProductionModifier) VALUES
('UNIT_FW_CLONETROOPER', 		'BUILDING_FW_IMPLANT_CLINIC', 	 10),
('UNIT_FW_MUTANT', 				'BUILDING_FW_IMPLANT_CLINIC', 	 10),
('UNIT_FW_BIOINFANTRY', 		'BUILDING_FW_IMPLANT_CLINIC', 	 10),
('UNIT_FW_BIOTROOPER', 			'BUILDING_FW_IMPLANT_CLINIC', 	 10),
('UNIT_FW_SUPERSOLDIERS', 		'BUILDING_FW_IMPLANT_CLINIC', 	 10),
('UNIT_FW_CLONETROOPER', 		'BUILDING_FW_BIOMOD_TANK', 		 15),
('UNIT_FW_MUTANT', 				'BUILDING_FW_BIOMOD_TANK', 		 15),
('UNIT_FW_BIOINFANTRY', 		'BUILDING_FW_BIOMOD_TANK', 		 15),
('UNIT_FW_BIOTROOPER', 			'BUILDING_FW_BIOMOD_TANK', 		 15),
('UNIT_FW_SUPERSOLDIERS', 		'BUILDING_FW_BIOMOD_TANK', 		 15),
('UNIT_FW_CHIMERA', 			'BUILDING_FW_ECTOGENESIS_POD', 	 15),
('UNIT_FW_HYDRA', 				'BUILDING_FW_ECTOGENESIS_POD', 	 15),
('UNIT_FW_SWARM', 				'BUILDING_FW_ECTOGENESIS_POD', 	 15),
('UNIT_FW_BIODRONE', 			'BUILDING_FW_ECTOGENESIS_POD', 	 15),

('UNIT_FW_CLONETROOPER', 		'BUILDING_FW_TRANSGENIC_NURSERY', 	10),
('UNIT_FW_MUTANT', 				'BUILDING_FW_TRANSGENIC_NURSERY', 	10),
('UNIT_FW_BIOINFANTRY', 		'BUILDING_FW_TRANSGENIC_NURSERY', 	10),
('UNIT_FW_BIOTROOPER', 			'BUILDING_FW_TRANSGENIC_NURSERY', 	10),
('UNIT_FW_CHIMERA', 			'BUILDING_FW_TRANSGENIC_NURSERY', 	10),
('UNIT_FW_SUPERSOLDIERS', 		'BUILDING_FW_TRANSGENIC_NURSERY', 	10),
('UNIT_FW_HYDRA', 				'BUILDING_FW_TRANSGENIC_NURSERY', 	10),
('UNIT_FW_SWARM', 				'BUILDING_FW_TRANSGENIC_NURSERY', 	10),
('UNIT_FW_BIODRONE', 			'BUILDING_FW_TRANSGENIC_NURSERY', 	10),
('UNIT_FW_AUTOMATON', 			'BUILDING_FW_DRONE_HIVE', 		 10),
('UNIT_FW_ROBOT_INFANTRY', 		'BUILDING_FW_DRONE_HIVE', 		 10),
('UNIT_FW_COLOSSUS', 		    'BUILDING_FW_DRONE_HIVE', 		 10),
('UNIT_FW_NANOHIVE', 			'BUILDING_FW_DRONE_HIVE', 		 10),
('UNIT_FW_MEGAHIVE', 			'BUILDING_FW_DRONE_HIVE', 		 10),
('UNIT_FW_HIMARS', 				'BUILDING_FW_DRONE_HIVE', 		 10),
('UNIT_FW_MECH_ARTILLERY', 		'BUILDING_FW_DRONE_HIVE', 		 10),
('UNIT_FW_ANGEL', 		        'BUILDING_FW_DRONE_HIVE', 		 10),
('UNIT_FW_ZEKE', 		        'BUILDING_FW_DRONE_HIVE', 		 10),
('UNIT_MECH', 					'BUILDING_FW_DRONE_HIVE', 		 10),
('UNIT_FW_PLASMA_BOMBER', 		'BUILDING_FW_AEROSPACE_COMPLEX', 10),
('UNIT_FW_PLASMA_FIGHTER', 		'BUILDING_FW_AEROSPACE_COMPLEX', 10),
('UNIT_FW_SPACE_BOMBER', 		'BUILDING_FW_AEROSPACE_COMPLEX', 10),
('UNIT_FW_SPACE_FIGHTER', 		'BUILDING_FW_AEROSPACE_COMPLEX', 10),
('UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER', 'BUILDING_FW_AEROSPACE_COMPLEX', 10),
('UNIT_FW_XCOM_SQUAD', 		    'BUILDING_FW_AEROSPACE_COMPLEX', 10),
('UNIT_FW_SPACEMARINES', 		'BUILDING_FW_AEROSPACE_COMPLEX', 10),
('UNIT_FW_BATTLESUIT', 		    'BUILDING_FW_AEROSPACE_COMPLEX', 10),
('UNIT_FW_GUNDAM', 	        	'BUILDING_FW_AEROSPACE_COMPLEX', 10),
('UNIT_FW_HELICARRIER', 	    'BUILDING_FW_AEROSPACE_COMPLEX', 10),
('UNIT_FW_NEXUS', 		        'BUILDING_FW_AEROSPACE_COMPLEX', 10),
('UNIT_FW_CYBERSUB', 			'BUILDING_FW_CYBERCLINIC', 		 15),
('UNIT_FW_CYBERSAM', 			'BUILDING_FW_CYBERCLINIC', 		 15),
('UNIT_FW_CRAWLER', 			'BUILDING_FW_CYBERCLINIC', 		 15),
('UNIT_FW_HOVERTANK', 			'BUILDING_FW_CYBERCLINIC', 		 15);

----------------------------------------------
-- Feature requirements
----------------------------------------------
INSERT INTO Building_LocalFeatureOrs (BuildingType, FeatureType) VALUES
('BUILDING_FW_ECOSANCTUARY', 		'FEATURE_JUNGLE'),
('BUILDING_FW_ECOSANCTUARY', 		'FEATURE_FOREST'),
('BUILDING_FW_PHOTOSYSTEMS', 		'FEATURE_JUNGLE'),
('BUILDING_FW_PHOTOSYSTEMS', 		'FEATURE_FOREST'),
('BUILDING_FW_PHOTOSYSTEMS', 		'FEATURE_MARSH');

----------------------------------------------
-- Resource  requirements
----------------------------------------------
INSERT INTO Building_ResourceQuantityRequirements (BuildingType, ResourceType, Cost) VALUES
('BUILDING_FW_NANOMINES_FIELD', 	'RESOURCE_NANOMAT', 	1),
('BUILDING_FW_NANOFORGE', 			'RESOURCE_NANOMAT', 	1),
('BUILDING_FW_BIOFLESH_INDUSTRY', 	'RESOURCE_HORSE', 		3),
('BUILDING_FW_CONVERTER', 			'RESOURCE_COAL', 		2),
('BUILDING_FW_CONVERTER_OIL', 		'RESOURCE_OIL', 		1),
('BUILDING_FW_CONVERTER_IRON',  	'RESOURCE_IRON', 		1),
('BUILDING_FW_ALLOY_FOUNDRY', 		'RESOURCE_URANIUM', 	1),
('BUILDING_FW_MASS_DIGESTER', 		'RESOURCE_ADN_FUNGUS', 	1),
('BUILDING_FW_FUSION_PLANT', 		'RESOURCE_URANIUM',    	1),
('BUILDING_FW_ECTOGENESIS_POD', 	'RESOURCE_ADN_FUNGUS', 	1),
('BUILDING_FW_TIDAL_PORT', 			'RESOURCE_NANOMAT', 	1),
('BUILDING_FW_HIGHSPEED_RAIL', 		'RESOURCE_NANOMAT', 	1),
('BUILDING_FW_TRANSGENIC_NURSERY', 	'RESOURCE_ADN_FUNGUS', 	1),
('BUILDING_FW_DRONE_HIVE', 			'RESOURCE_IMPLANT', 	1),
('BUILDING_FW_AEROSPACE_COMPLEX', 	'RESOURCE_NANOMAT', 	1);

INSERT INTO Building_DomainProductionModifiers
	(BuildingType, DomainType, Modifier)
VALUES
	('BUILDING_FW_TIDAL_PORT', 		'DOMAIN_SEA', 	15),
	('BUILDING_FW_NANOFORGE', 		'DOMAIN_SEA', 	15),
	('BUILDING_FW_NANOFORGE', 		'DOMAIN_LAND', 	15),
	('BUILDING_FW_NANOFORGE', 		'DOMAIN_AIR', 	15),
	('BUILDING_FW_NANOFORGE', 		'DOMAIN_HOVER', 15),
	('BUILDING_FW_LAUNCH_FACILITY', 'DOMAIN_AIR', 	15),
	('BUILDING_FW_LAUNCH_FACILITY', 'DOMAIN_HOVER', 15);

INSERT INTO Building_YieldModifiers
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_HIGHSPEED_RAIL', 	'YIELD_PRODUCTION', 15),
	('BUILDING_FW_HIGHSPEED_RAIL', 	'YIELD_GOLD', 		10),
	('BUILDING_FW_HIGHSPEED_RAIL', 	'YIELD_CULTURE', 	5),
	('BUILDING_FW_TIDAL_PORT', 		'YIELD_PRODUCTION', 15),
	('BUILDING_FW_TIDAL_PORT', 		'YIELD_CULTURE', 	5);

----------------------------------------------
-- Improved Resources nearby
----------------------------------------------
INSERT INTO Building_LocalResourceOrs 
	(BuildingType, ResourceType)
VALUES
	('BUILDING_FW_CONVERTER', 				'RESOURCE_COAL'),	
	('BUILDING_FW_CONVERTER_OIL', 			'RESOURCE_OIL'),
	('BUILDING_FW_CONVERTER_IRON', 			'RESOURCE_IRON'),
	('BUILDING_FW_BIOFUEL_REFINERY', 	    'RESOURCE_WHEAT'),
	('BUILDING_FW_BIOFUEL_REFINERY_RICE', 	'RESOURCE_RICE'),
	('BUILDING_FW_BIOFUEL_REFINERY_BANANA', 'RESOURCE_BANANA'),
	('BUILDING_FW_BIOFUEL_REFINERY_MAIZE', 	'RESOURCE_MAIZE');


INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'RESOURCE_CRAB', 'YIELD_SCIENCE', 1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'RESOURCE_CRAB', 'YIELD_GOLD', 1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'RESOURCE_PEARLS', 'YIELD_GOLD', 1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'RESOURCE_PEARLS', 'YIELD_CULTURE', 1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'RESOURCE_CORAL', 'YIELD_SCIENCE', 1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'RESOURCE_CORAL', 'YIELD_CULTURE', 1),
	('BUILDING_FW_UNDERSEA_MINING', 'RESOURCE_NANOMAT', 'YIELD_PRODUCTION', 1),
	('BUILDING_FW_UNDERSEA_MINING', 'RESOURCE_NANOMAT', 'YIELD_GOLD', 1),
	('BUILDING_FW_UNDERSEA_MINING', 'RESOURCE_NANOMAT', 'YIELD_SCIENCE', 1),
	('BUILDING_FW_UNDERSEA_MINING', 'RESOURCE_OIL', 'YIELD_PRODUCTION', 1),
	('BUILDING_FW_UNDERSEA_MINING', 'RESOURCE_OIL', 'YIELD_GOLD', 1),
	('BUILDING_FW_UNDERSEA_MINING', 'RESOURCE_OIL', 'YIELD_SCIENCE', 1),
	('BUILDING_FW_UNDERSEA_MINING', 'RESOURCE_WHALE', 'YIELD_PRODUCTION', 1),
	('BUILDING_FW_UNDERSEA_MINING', 'RESOURCE_WHALE', 'YIELD_GOLD', 1),
	('BUILDING_FW_UNDERSEA_MINING', 'RESOURCE_WHALE', 'YIELD_SCIENCE', 1),
	('BUILDING_FW_GENE_LAB', 'RESOURCE_COW', 'YIELD_FOOD', 2),
	('BUILDING_FW_GENE_LAB', 'RESOURCE_DEER', 'YIELD_FOOD', 2),
	('BUILDING_FW_GENE_LAB', 'RESOURCE_HORSE', 'YIELD_FOOD', 2),
	('BUILDING_FW_GENE_LAB', 'RESOURCE_SHEEP', 'YIELD_FOOD', 2),
	('BUILDING_FW_GENE_LAB', 'RESOURCE_BISON', 'YIELD_FOOD', 2),
	('BUILDING_FW_BIOFLESH_INDUSTRY', 	'RESOURCE_COW', 		'YIELD_GOLD', 2),
	('BUILDING_FW_BIOFLESH_INDUSTRY', 	'RESOURCE_DEER', 		'YIELD_GOLD', 2),
	('BUILDING_FW_BIOFLESH_INDUSTRY', 	'RESOURCE_HORSE', 		'YIELD_GOLD', 2),
	('BUILDING_FW_BIOFLESH_INDUSTRY', 	'RESOURCE_SHEEP', 		'YIELD_GOLD', 2),
	('BUILDING_FW_BIOFLESH_INDUSTRY', 	'RESOURCE_BISON', 		'YIELD_GOLD', 2),
	('BUILDING_FW_BIOFLESH_INDUSTRY', 	'RESOURCE_WHALE', 		'YIELD_GOLD', 2),
	('BUILDING_FW_NANOMAT_PLANT', 		'RESOURCE_COAL', 		'YIELD_PRODUCTION', 2),
	('BUILDING_FW_NANOMAT_PLANT', 		'RESOURCE_OIL', 'YIELD_PRODUCTION', 2),
	('BUILDING_FW_CONVERTER', 		'RESOURCE_COAL', 	'YIELD_GOLD', 		2),
	('BUILDING_FW_CONVERTER_OIL', 	'RESOURCE_OIL', 	'YIELD_GOLD', 		2),
	('BUILDING_FW_CONVERTER_IRON', 	'RESOURCE_IRON', 	'YIELD_GOLD', 		2),
	('BUILDING_FW_ALLOY_FOUNDRY', 'RESOURCE_ALUMINUM', 	'YIELD_PRODUCTION', 4),
	('BUILDING_FW_ALLOY_FOUNDRY', 'RESOURCE_ALUMINUM', 	'YIELD_GOLD', 		2),
	('BUILDING_FW_ALLOY_FOUNDRY', 'RESOURCE_URANIUM', 	'YIELD_PRODUCTION', 4),
	('BUILDING_FW_ALLOY_FOUNDRY', 'RESOURCE_URANIUM', 	'YIELD_GOLD', 		2);

INSERT INTO 
	Building_SeaResourceYieldChanges (BuildingType,	YieldType,	Yield) 
VALUES
	('BUILDING_FW_AQUACULTURE_LAB', 'YIELD_GOLD', 1),
	('BUILDING_FW_AQUACULTURE_LAB', 'YIELD_FOOD', 1),
	('BUILDING_FW_TIDAL_PORT', 'YIELD_PRODUCTION', 1),
	('BUILDING_FW_TIDAL_PORT', 'YIELD_GOLD', 2);

------------------------------	
-- Building_DomainFreeExperiences
------------------------------
INSERT INTO Building_DomainFreeExperiences
	(BuildingType, DomainType, Experience)
VALUES
	('BUILDING_FW_VR_TRAINING', 'DOMAIN_LAND', 25),
	('BUILDING_FW_VR_TRAINING', 'DOMAIN_SEA', 25),
	('BUILDING_FW_VR_TRAINING', 'DOMAIN_AIR', 25),
	('BUILDING_FW_VR_TRAINING', 'DOMAIN_HOVER', 25);

------------------------
-- Building_ResourcePlotsToPlace
------------------------
INSERT INTO Building_ResourcePlotsToPlace
		(BuildingType,						ResourceType,			NumPlots, 	ResourceQuantityToPlace) 
VALUES	('BUILDING_FW_AQUACULTURE_LAB',		'RESOURCE_FISH',		1, 			1),
		('BUILDING_FW_FUNGAL_AGRIGENOMICS',	'RESOURCE_ADN_FUNGUS',	1, 			5),
		('BUILDING_FW_PHOTOSYSTEMS',		'RESOURCE_ADN_FUNGUS',	1, 			3),
		('BUILDING_FW_GENEJACK_FACILITY',	'RESOURCE_ADN_FUNGUS',	1, 			2);
		
------------------------
-- Flavors
------------------------
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_SPACESHIP_FACTORY', 		'FLAVOR_MILITARY_TRAINING', 15),
('BUILDING_FW_UTILITY_FOG', 		'FLAVOR_PRODUCTION', 35),
('BUILDING_FW_UTILITY_FOG', 		'FLAVOR_DEFENSE', 30),
('BUILDING_FW_UTILITY_FOG', 		'FLAVOR_CITY_DEFENSE', 35),
('BUILDING_FW_UTILITY_FOG', 		'FLAVOR_EXPANSION', 20),
('BUILDING_FW_UTILITY_FOG', 		'FLAVOR_HAPPINESS', 5),
('BUILDING_FW_ENRICHMENT_FACILITY', 'FLAVOR_EXPANSION', 25),
('BUILDING_FW_BIOFUEL_REFINERY', 	'FLAVOR_EXPANSION', 35),
('BUILDING_FW_BIOFUEL_REFINERY', 	'FLAVOR_PRODUCTION', 25),
('BUILDING_FW_BIOFUEL_REFINERY_RICE', 	'FLAVOR_EXPANSION', 35),
('BUILDING_FW_BIOFUEL_REFINERY_RICE', 	'FLAVOR_PRODUCTION', 25),
('BUILDING_FW_BIOFUEL_REFINERY_BANANA', 'FLAVOR_EXPANSION', 35),
('BUILDING_FW_BIOFUEL_REFINERY_BANANA', 'FLAVOR_PRODUCTION', 25),
('BUILDING_FW_BIOFUEL_REFINERY_MAIZE', 	'FLAVOR_EXPANSION', 35),
('BUILDING_FW_BIOFUEL_REFINERY_MAIZE', 	'FLAVOR_PRODUCTION', 25),
('BUILDING_FW_CYBERPOLICE', 		'FLAVOR_HAPPINESS', 15),
('BUILDING_FW_CYBERPOLICE', 		'FLAVOR_ESPIONAGE', 25),
('BUILDING_FW_DIGITAL_POLICE', 		'FLAVOR_HAPPINESS', 15),
('BUILDING_FW_DIGITAL_POLICE', 		'FLAVOR_ESPIONAGE', 30),
('BUILDING_FW_GENE_LAB', 			'FLAVOR_HAPPINESS', 5),
('BUILDING_FW_GENE_LAB', 			'FLAVOR_GROWTH', 30),
('BUILDING_FW_GENE_LAB', 			'FLAVOR_GREAT_PEOPLE', 35),
('BUILDING_FW_LAUNCH_FACILITY', 	'FLAVOR_GOLD', 				10),
('BUILDING_FW_LAUNCH_FACILITY', 	'FLAVOR_SCIENCE', 			10),
('BUILDING_FW_LAUNCH_FACILITY', 	'FLAVOR_PRODUCTION', 		10),
('BUILDING_FW_LAUNCH_FACILITY', 	'FLAVOR_OFFENSE', 			15),
('BUILDING_FW_LAUNCH_FACILITY', 	'FLAVOR_AIR', 				15),
('BUILDING_FW_LAUNCH_FACILITY', 	'FLAVOR_MILITARY_TRAINING', 20),
('BUILDING_FW_LAUNCH_FACILITY', 	'FLAVOR_HAPPINESS', 		10),
('BUILDING_FW_SERVER_HUB', 			'FLAVOR_CULTURE', 				30),
('BUILDING_FW_SERVER_HUB', 			'FLAVOR_SCIENCE', 				30),
('BUILDING_FW_SERVER_HUB', 			'FLAVOR_PRODUCTION', 			30),
('BUILDING_FW_SERVER_HUB', 			'FLAVOR_GOLD', 					30),
('BUILDING_FW_SERVER_HUB', 			'FLAVOR_RELIGION', 				20),
('BUILDING_FW_ENTERTAINMENT_SERVER', 'FLAVOR_CULTURE', 				50),
('BUILDING_FW_RESEARCH_SERVER', 	 'FLAVOR_SCIENCE', 				50),
('BUILDING_FW_CLOUD_COMPUTING', 	 'FLAVOR_PRODUCTION', 			50),
('BUILDING_FW_COMMERCE_SERVER', 	 'FLAVOR_GOLD', 				50),
('BUILDING_FW_COMMERCE_SERVER', 	 'FLAVOR_I_TRADE_DESTINATION', 	20),
('BUILDING_FW_COMMERCE_SERVER', 	 'FLAVOR_I_TRADE_ORIGIN', 		20),
('BUILDING_FW_VR_TRAINING', 		'FLAVOR_MILITARY_TRAINING', 	60),
('BUILDING_FW_VR_TRAINING', 		'FLAVOR_SCIENCE', 				5),
('BUILDING_FW_VR_TRAINING', 		'FLAVOR_HAPPINESS', 			8),
('BUILDING_FW_VIRTUAL_MUSEUM', 		'FLAVOR_CULTURE', 				25),
('BUILDING_FW_VIRTUAL_MUSEUM', 		'FLAVOR_EXPANSION', 			6),
('BUILDING_FW_VIRTUAL_MUSEUM', 		'FLAVOR_HAPPINESS', 			5),
('BUILDING_FW_NETWORK_BACKBONE', 	'FLAVOR_SCIENCE', 				30),
('BUILDING_FW_NETWORK_BACKBONE', 	'FLAVOR_CULTURE', 				30),
('BUILDING_FW_NETWORK_BACKBONE', 	'FLAVOR_PRODUCTION', 			30),
('BUILDING_FW_NETWORK_BACKBONE', 	'FLAVOR_GOLD', 					30),
('BUILDING_FW_MASS_DIGESTER', 		'FLAVOR_GROWTH', 				75),
('BUILDING_FW_MASS_DIGESTER', 		'FLAVOR_HAPPINESS', 			5),

('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'FLAVOR_SCIENCE', 		40),
('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'FLAVOR_CULTURE', 		40),
('BUILDING_FW_UNDERSEA_MINING', 'FLAVOR_PRODUCTION', 			40),
('BUILDING_FW_UNDERSEA_MINING', 'FLAVOR_GOLD', 					35),
('BUILDING_FW_UNDERSEA_MINING', 'FLAVOR_I_TRADE_ORIGIN', 		10),
('BUILDING_FW_UNDERSEA_MINING', 'FLAVOR_I_TRADE_DESTINATION', 	10),
('BUILDING_FW_AQUACULTURE_LAB', 'FLAVOR_GROWTH', 				60),
('BUILDING_FW_AQUACULTURE_LAB', 'FLAVOR_GOLD', 					10),
('BUILDING_FW_AQUACULTURE_LAB', 'FLAVOR_CULTURE', 				5),

('BUILDING_FW_VERTICAL_FARM', 		'FLAVOR_TILE_IMPROVEMENT', 	20),
('BUILDING_FW_VERTICAL_FARM', 		'FLAVOR_GROWTH', 			40),
('BUILDING_FW_VERTICAL_FARM', 		'FLAVOR_SCIENCE', 			50),
('BUILDING_FW_VERTICAL_FARM', 		'FLAVOR_HAPPINESS', 		5),

('BUILDING_FW_ECOSANCTUARY', 		'FLAVOR_TILE_IMPROVEMENT', 	5),
('BUILDING_FW_ECOSANCTUARY', 		'FLAVOR_CULTURE', 			60),
('BUILDING_FW_ECOSANCTUARY', 		'FLAVOR_PRODUCTION', 		40),
('BUILDING_FW_ECOSANCTUARY', 		'FLAVOR_HAPPINESS', 		15),
('BUILDING_FW_BIOFACTORY', 			'FLAVOR_TILE_IMPROVEMENT', 	5),
('BUILDING_FW_BIOFACTORY', 			'FLAVOR_GROWTH', 			50),
('BUILDING_FW_BIOFACTORY', 			'FLAVOR_PRODUCTION', 		40),
('BUILDING_FW_GEOTHERMAL_FACTORY', 	'FLAVOR_TILE_IMPROVEMENT', 	5),
('BUILDING_FW_GEOTHERMAL_FACTORY', 	'FLAVOR_PRODUCTION', 		50),
('BUILDING_FW_GEOTHERMAL_FACTORY', 	'FLAVOR_GOLD', 				40),
('BUILDING_FW_HYDROTHERMAL_FACTORY', 'FLAVOR_TILE_IMPROVEMENT', 5),
('BUILDING_FW_HYDROTHERMAL_FACTORY', 'FLAVOR_GROWTH', 			25),
('BUILDING_FW_HYDROTHERMAL_FACTORY', 'FLAVOR_SCIENCE', 			30),
('BUILDING_FW_HYDROTHERMAL_FACTORY', 'FLAVOR_PRODUCTION', 		40),
('BUILDING_FW_BOREHOLE', 			'FLAVOR_TILE_IMPROVEMENT', 	5),
('BUILDING_FW_BOREHOLE', 			'FLAVOR_GOLD', 				50),
('BUILDING_FW_BOREHOLE', 			'FLAVOR_PRODUCTION', 		40),

('BUILDING_FW_CLONE_LAB', 'FLAVOR_PRODUCTION', 5),
('BUILDING_FW_CLONE_LAB', 'FLAVOR_GROWTH', 20),
('BUILDING_FW_CLONE_LAB', 'FLAVOR_DEFENSE', 5),
('BUILDING_FW_CLONE_LAB', 'FLAVOR_HAPPINESS', 5),
('BUILDING_FW_CLONE_LAB', 'FLAVOR_MILITARY_TRAINING', 5),
('BUILDING_FW_CLONE_LAB', 'FLAVOR_GREAT_PEOPLE', 10),
('BUILDING_FW_BIOFLESH_INDUSTRY', 	'FLAVOR_PRODUCTION', 		5),
('BUILDING_FW_BIOFLESH_INDUSTRY', 	'FLAVOR_OFFENSE', 			5),
('BUILDING_FW_BIOFLESH_INDUSTRY', 	'FLAVOR_DEFENSE', 			5),
('BUILDING_FW_BIOFLESH_INDUSTRY', 	'FLAVOR_HAPPINESS', 		5),
('BUILDING_FW_BIOFLESH_INDUSTRY', 	'FLAVOR_SCIENCE', 			5),
('BUILDING_FW_BIOFLESH_INDUSTRY', 	'FLAVOR_MILITARY_TRAINING', 25),
('BUILDING_FW_BIOFLESH_INDUSTRY', 	'FLAVOR_EXPANSION', 		5),
('BUILDING_FW_FUNGAL_AGRIGENOMICS', 'FLAVOR_SCIENCE', 			30),
('BUILDING_FW_FUNGAL_AGRIGENOMICS', 'FLAVOR_CULTURE', 			30),
('BUILDING_FW_FUNGAL_AGRIGENOMICS', 'FLAVOR_CITY_DEFENSE', 		5),
('BUILDING_FW_FUNGAL_AGRIGENOMICS', 'FLAVOR_EXPANSION', 		5),
('BUILDING_FW_FUNGAL_AGRIGENOMICS', 'FLAVOR_MILITARY_TRAINING', 40),
('BUILDING_FW_NANOMINES_FIELD', 	'FLAVOR_DEFENSE', 			30),
('BUILDING_FW_NANOMINES_FIELD', 	'FLAVOR_CITY_DEFENSE', 		60),
('BUILDING_FW_PARTICLE_ACCELERATOR', 'FLAVOR_SCIENCE', 			50),
('BUILDING_FW_ECTOGENESIS_POD', 	'FLAVOR_MILITARY_TRAINING', 60),
('BUILDING_FW_PHOTOSYSTEMS', 		'FLAVOR_SCIENCE', 			5),
('BUILDING_FW_PHOTOSYSTEMS', 		'FLAVOR_CULTURE', 			5),
('BUILDING_FW_PHOTOSYSTEMS', 		'FLAVOR_PRODUCTION', 		35),
('BUILDING_FW_PHOTOSYSTEMS', 		'FLAVOR_GROWTH', 			35),
('BUILDING_FW_PHOTOSYSTEMS', 		'FLAVOR_MILITARY_TRAINING', 5),

('BUILDING_FW_TIDAL_PORT', 		'FLAVOR_PRODUCTION', 			50),
('BUILDING_FW_TIDAL_PORT', 		'FLAVOR_GOLD', 					40),
('BUILDING_FW_TIDAL_PORT', 		'FLAVOR_I_SEA_TRADE_ROUTE', 	40),
('BUILDING_FW_TIDAL_PORT', 		'FLAVOR_I_TRADE_DESTINATION', 	20),
('BUILDING_FW_TIDAL_PORT', 		'FLAVOR_I_TRADE_ORIGIN', 		20),
('BUILDING_FW_TIDAL_PORT', 		'FLAVOR_CULTURE', 				40),
('BUILDING_FW_TIDAL_PORT', 		'FLAVOR_NAVAL', 				35),
('BUILDING_FW_TIDAL_PORT', 		'FLAVOR_MILITARY_TRAINING', 	5),
('BUILDING_FW_HIGHSPEED_RAIL', 	'FLAVOR_I_LAND_TRADE_ROUTE', 	40),
('BUILDING_FW_HIGHSPEED_RAIL', 	'FLAVOR_I_TRADE_DESTINATION', 	15),
('BUILDING_FW_HIGHSPEED_RAIL', 	'FLAVOR_I_TRADE_ORIGIN', 		15),
('BUILDING_FW_HIGHSPEED_RAIL', 	'FLAVOR_PRODUCTION', 			50),
('BUILDING_FW_HIGHSPEED_RAIL', 	'FLAVOR_GROWTH', 				30),
('BUILDING_FW_HIGHSPEED_RAIL', 	'FLAVOR_GOLD', 					40),
('BUILDING_FW_HIGHSPEED_RAIL', 	'FLAVOR_CULTURE', 				40),
('BUILDING_FW_HIGHSPEED_RAIL', 	'FLAVOR_INFRASTRUCTURE', 		20),

('BUILDING_FW_GENEJACK_FACILITY', 'FLAVOR_PRODUCTION', 25),
('BUILDING_FW_GENEJACK_FACILITY', 'FLAVOR_GOLD', 5),
('BUILDING_FW_GENEJACK_FACILITY', 'FLAVOR_GROWTH', 5),
('BUILDING_FW_BIOMOD_TANK', 	'FLAVOR_MILITARY_TRAINING', 60),
('BUILDING_FW_NANOMAT_PLANT', 	'FLAVOR_MILITARY_TRAINING', 50),
('BUILDING_FW_NANOMAT_PLANT', 	'FLAVOR_EXPANSION', 		5),
('BUILDING_FW_NANOMAT_PLANT', 	'FLAVOR_PRODUCTION', 		30),
('BUILDING_FW_NANOMAT_PLANT', 	'FLAVOR_SPACESHIP', 		40),
('BUILDING_FW_CONVERTER', 		'FLAVOR_SPACESHIP', 		50),
('BUILDING_FW_CONVERTER', 		'FLAVOR_MILITARY_TRAINING', 50),
('BUILDING_FW_CONVERTER', 		'FLAVOR_EXPANSION', 		5),
('BUILDING_FW_CONVERTER_OIL', 	'FLAVOR_SPACESHIP', 		40),
('BUILDING_FW_CONVERTER_OIL', 	'FLAVOR_MILITARY_TRAINING', 40),
('BUILDING_FW_CONVERTER_IRON', 	'FLAVOR_SPACESHIP', 		40),
('BUILDING_FW_CONVERTER_IRON', 	'FLAVOR_MILITARY_TRAINING', 40),
('BUILDING_FW_NANOFORGE', 'FLAVOR_PRODUCTION', 50),
('BUILDING_FW_NANOFORGE', 'FLAVOR_OFFENSE', 35),
('BUILDING_FW_NANOFORGE', 'FLAVOR_DEFENSE', 35),
('BUILDING_FW_NANOFORGE', 'FLAVOR_MILITARY_TRAINING', 50),
('BUILDING_FW_ORBITAL_HABITAT', 'FLAVOR_GROWTH', 50),
('BUILDING_FW_ORBITAL_HABITAT', 'FLAVOR_PRODUCTION', 25),
('BUILDING_FW_ORBITAL_HABITAT', 'FLAVOR_GOLD', 		5),
('BUILDING_FW_ORBITAL_HABITAT', 'FLAVOR_SCIENCE', 	5),
('BUILDING_FW_ORBITAL_HABITAT', 'FLAVOR_GREAT_PEOPLE', 10),
('BUILDING_FW_ORBITAL_HABITAT', 'FLAVOR_HAPPINESS', 10),
('BUILDING_FW_DEFENSE_FIELD', 	'FLAVOR_DEFENSE', 30),
('BUILDING_FW_DEFENSE_FIELD', 	'FLAVOR_CITY_DEFENSE', 60),
('BUILDING_FW_IMPLANT_CLINIC', 	'FLAVOR_HAPPINESS', 5),
('BUILDING_FW_IMPLANT_CLINIC', 	'FLAVOR_OFFENSE', 30),
('BUILDING_FW_IMPLANT_CLINIC', 	'FLAVOR_MILITARY_TRAINING', 45),
('BUILDING_FW_BIRTHING_PODS', 		'FLAVOR_GROWTH', 		75),
('BUILDING_FW_BIRTHING_PODS', 		'FLAVOR_GREAT_PEOPLE', 	40),
('BUILDING_FW_BIRTHING_PODS', 		'FLAVOR_HAPPINESS', 	10),
('BUILDING_FW_BIRTHING_PODS', 		'FLAVOR_SCIENCE', 		10),
('BUILDING_FW_BIRTHING_PODS', 		'FLAVOR_GOLD', 			5),
('BUILDING_FW_BIRTHING_PODS', 		'FLAVOR_PRODUCTION', 	5),
('BUILDING_FW_BIRTHING_PODS', 		'FLAVOR_CULTURE', 		5),
('BUILDING_FW_CYBERCLINIC', 		'FLAVOR_MILITARY_TRAINING', 20),
('BUILDING_FW_CYBERCLINIC', 		'FLAVOR_SCIENCE', 35),
('BUILDING_FW_TELEPRESENCE_HUB', 'FLAVOR_PRODUCTION', 30),
('BUILDING_FW_TELEPRESENCE_HUB', 'FLAVOR_SCIENCE', 30),
('BUILDING_FW_TELEPRESENCE_HUB', 'FLAVOR_GOLD', 30),
('BUILDING_FW_TELEPRESENCE_HUB', 'FLAVOR_CULTURE', 30),
('BUILDING_FW_BRAINUPLOADING', 'FLAVOR_PRODUCTION', 40),
('BUILDING_FW_BRAINUPLOADING', 'FLAVOR_SCIENCE', 40),
('BUILDING_FW_BRAINUPLOADING', 'FLAVOR_GOLD', 40),
('BUILDING_FW_BRAINUPLOADING', 'FLAVOR_CULTURE', 40),
('BUILDING_FW_AUTOPLANT', 'FLAVOR_PRODUCTION', 50),
('BUILDING_FW_CRYPTOBANK', 'FLAVOR_GOLD', 50),

('BUILDING_FW_TRANSGENIC_NURSERY', 	'FLAVOR_TILE_IMPROVEMENT', 		 5),
('BUILDING_FW_TRANSGENIC_NURSERY', 	'FLAVOR_GROWTH', 				 5),
('BUILDING_FW_TRANSGENIC_NURSERY', 	'FLAVOR_MILITARY_TRAINING', 	 10),
('BUILDING_FW_TRANSGENIC_NURSERY', 	'FLAVOR_SCIENCE',		 		 10),
('BUILDING_FW_TRANSGENIC_NURSERY', 	'FLAVOR_MOBILE', 				 10),
('BUILDING_FW_TRANSGENIC_NURSERY', 	'FLAVOR_OFFENSE', 				 30),
('BUILDING_FW_DRONE_HIVE', 			'FLAVOR_TILE_IMPROVEMENT', 		 5),
('BUILDING_FW_DRONE_HIVE', 			'FLAVOR_GOLD', 					 5),
('BUILDING_FW_DRONE_HIVE', 			'FLAVOR_MILITARY_TRAINING', 	 10),
('BUILDING_FW_DRONE_HIVE', 			'FLAVOR_PRODUCTION', 			 10),
('BUILDING_FW_DRONE_HIVE', 			'FLAVOR_CITY_DEFENSE', 			 20),
('BUILDING_FW_DRONE_HIVE', 			'FLAVOR_DEFENSE', 				 30),
('BUILDING_FW_AEROSPACE_COMPLEX', 	'FLAVOR_TILE_IMPROVEMENT', 		 5),
('BUILDING_FW_AEROSPACE_COMPLEX', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 5),
('BUILDING_FW_AEROSPACE_COMPLEX', 	'FLAVOR_PRODUCTION', 			 5),
('BUILDING_FW_AEROSPACE_COMPLEX', 	'FLAVOR_CULTURE', 				 5),
('BUILDING_FW_AEROSPACE_COMPLEX', 	'FLAVOR_MILITARY_TRAINING', 	 10),
('BUILDING_FW_AEROSPACE_COMPLEX', 	'FLAVOR_MOBILE', 				 10),
('BUILDING_FW_AEROSPACE_COMPLEX', 	'FLAVOR_CITY_DEFENSE', 			 15),
('BUILDING_FW_AEROSPACE_COMPLEX', 	'FLAVOR_ANTIAIR', 				 25),
('BUILDING_FW_AEROSPACE_COMPLEX', 	'FLAVOR_AIR', 					 30),
('BUILDING_FW_AEROSPACE_COMPLEX', 	'FLAVOR_AIRLIFT', 				 30),

('BUILDING_FW_FEEDSITE_HUB', 		'FLAVOR_GREAT_PEOPLE', 		5),
('BUILDING_FW_FEEDSITE_HUB', 		'FLAVOR_HAPPINESS', 		35),
('BUILDING_FW_FEEDSITE_HUB', 		'FLAVOR_CULTURE', 			50),
('BUILDING_FW_DISTRIBUTION_HUB', 	'FLAVOR_TILE_IMPROVEMENT', 	5),
('BUILDING_FW_DISTRIBUTION_HUB', 	'FLAVOR_GREAT_PEOPLE', 		5),
('BUILDING_FW_DISTRIBUTION_HUB', 	'FLAVOR_GOLD', 				5),
('BUILDING_FW_DISTRIBUTION_HUB', 	'FLAVOR_PRODUCTION', 		50),
('BUILDING_FW_SIMULATION_HUB', 		'FLAVOR_TILE_IMPROVEMENT', 	5),
('BUILDING_FW_SIMULATION_HUB', 		'FLAVOR_GREAT_PEOPLE', 		5),
('BUILDING_FW_SIMULATION_HUB', 		'FLAVOR_GOLD', 				5),
('BUILDING_FW_SIMULATION_HUB', 		'FLAVOR_SCIENCE', 			50),
('BUILDING_FW_METROPLEX_HUB', 		'FLAVOR_TILE_IMPROVEMENT', 	5),
('BUILDING_FW_METROPLEX_HUB', 		'FLAVOR_GREAT_PEOPLE', 		5),
('BUILDING_FW_METROPLEX_HUB', 		'FLAVOR_GOLD', 				55),

('BUILDING_FW_MYCOPROTEIN_VATS', 		'FLAVOR_GROWTH', 		45),
('BUILDING_FW_MYCOPROTEIN_VATS', 		'FLAVOR_HAPPINESS', 	30),
('BUILDING_FW_ALLOY_FOUNDRY', 			'FLAVOR_PRODUCTION', 	40),
('BUILDING_FW_ALLOY_FOUNDRY', 			'FLAVOR_SPACESHIP', 	40),
('BUILDING_FW_ALLOY_FOUNDRY', 			'FLAVOR_MILITARY_TRAINING', 30),
('BUILDING_FW_ALLOY_FOUNDRY', 			'FLAVOR_TILE_IMPROVEMENT', 20),
('BUILDING_FW_TERRAFORMING_STATION', 	'FLAVOR_MILITARY_TRAINING', 5),
('BUILDING_FW_TERRAFORMING_STATION', 	'FLAVOR_EXPANSION', 		5),
('BUILDING_FW_TERRAFORMING_STATION', 	'FLAVOR_TILE_IMPROVEMENT', 	10),
('BUILDING_FW_TERRAFORMING_STATION', 	'FLAVOR_HAPPINESS', 		20),
('BUILDING_FW_TERRAFORMING_STATION', 	'FLAVOR_CULTURE', 			20),
('BUILDING_FW_TERRAFORMING_STATION', 	'FLAVOR_SCIENCE', 			20),
('BUILDING_FW_AI_NETWORK', 				'FLAVOR_MILITARY_TRAINING', 5),
('BUILDING_FW_AI_NETWORK', 				'FLAVOR_EXPANSION', 		5),
('BUILDING_FW_AI_NETWORK', 				'FLAVOR_DEFENSE', 			5),
('BUILDING_FW_AI_NETWORK', 				'FLAVOR_TILE_IMPROVEMENT', 	10),
('BUILDING_FW_AI_NETWORK', 				'FLAVOR_GREAT_PEOPLE', 		10),
('BUILDING_FW_AI_NETWORK', 				'FLAVOR_CITY_DEFENSE', 		20),
('BUILDING_FW_AI_NETWORK', 				'FLAVOR_GOLD', 				20),
('BUILDING_FW_CENTRAL_COMMAND', 		'FLAVOR_MILITARY_TRAINING', 5),
('BUILDING_FW_CENTRAL_COMMAND', 		'FLAVOR_EXPANSION', 		5),
('BUILDING_FW_CENTRAL_COMMAND', 		'FLAVOR_SPACESHIP', 		5),
('BUILDING_FW_CENTRAL_COMMAND', 		'FLAVOR_SCIENCE', 			10),
('BUILDING_FW_CENTRAL_COMMAND', 		'FLAVOR_TILE_IMPROVEMENT', 	10),
('BUILDING_FW_CENTRAL_COMMAND', 		'FLAVOR_PRODUCTION', 		20),
('BUILDING_FW_CENTRAL_COMMAND', 		'FLAVOR_GROWTH', 			20),

('BUILDING_FW_SPACE_STATION', 'FLAVOR_GROWTH', 				5),
('BUILDING_FW_SPACE_STATION', 'FLAVOR_PRODUCTION', 			5),
('BUILDING_FW_SPACE_STATION', 'FLAVOR_SCIENCE', 			5),
('BUILDING_FW_SPACE_STATION', 'FLAVOR_ANTIAIR', 			10),
('BUILDING_FW_SPACE_STATION', 'FLAVOR_CITY_DEFENSE', 		10),
('BUILDING_FW_SPACE_STATION', 'FLAVOR_CULTURE', 			5),
('BUILDING_FW_SPACE_STATION', 'FLAVOR_HAPPINESS', 			10),
('BUILDING_FW_COMM_MODULE', 		'FLAVOR_GOLD', 			50),
('BUILDING_FW_RESEARCH_MODULE', 	'FLAVOR_SCIENCE', 		50),
('BUILDING_FW_ENGINEERING_MODULE', 'FLAVOR_PRODUCTION', 	50),
('BUILDING_FW_MOON_BASE', 			'FLAVOR_PRODUCTION', 20),
('BUILDING_FW_MOON_BASE', 			'FLAVOR_SCIENCE', 20),
('BUILDING_FW_MOON_BASE', 			'FLAVOR_GOLD', 20),
('BUILDING_FW_MOON_BASE', 			'FLAVOR_EXPANSION', 10),
('BUILDING_FW_MOON_BASE', 			'FLAVOR_HAPPINESS', 25),
('BUILDING_FW_FUSION_PLANT', 'FLAVOR_GROWTH', 20),
('BUILDING_FW_FUSION_PLANT', 'FLAVOR_CULTURE', 20),
('BUILDING_FW_FUSION_PLANT', 'FLAVOR_GOLD', 20),
('BUILDING_FW_FUSION_PLANT', 'FLAVOR_SCIENCE', 20),
('BUILDING_FW_FUSION_PLANT', 'FLAVOR_GREAT_PEOPLE', 40),
('BUILDING_FW_FUSION_PLANT', 'FLAVOR_PRODUCTION', 70),
('BUILDING_FW_BRAIN_UPLOADING', 	'FLAVOR_GROWTH', 	20),
('BUILDING_FW_BRAIN_UPLOADING', 	'FLAVOR_CULTURE', 	20),
('BUILDING_FW_BRAIN_UPLOADING', 	'FLAVOR_GOLD', 		20),
('BUILDING_FW_BRAIN_UPLOADING', 	'FLAVOR_SCIENCE', 	20),
('BUILDING_FW_BRAIN_UPLOADING', 	'FLAVOR_RELIGION', 	20);
