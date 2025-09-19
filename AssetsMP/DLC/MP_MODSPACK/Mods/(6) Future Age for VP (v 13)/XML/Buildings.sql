INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('MUCfVP-CAYM', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'MUCfVP-CAYM' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_DRYDOCK') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 0);


----------------------------------------------------
-- Generic info
----------------------------------------------------
INSERT INTO Buildings (Type, BuildingClass, PrereqTech, Cost, ArtDefineTag, PortraitIndex, IconAtlas, Help, Description, Civilopedia, Strategy) VALUES
('BUILDING_FW_BIOFUEL_REFINERY',       'BUILDINGCLASS_FW_BIOFUEL_REFINERY',  'TECH_GEO_ENERGY',  2500, 'ART_DEF_BUILDING_LABORATORY',  45,'CIV_COLOR_ATLAS_FW_3',   'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_HELP', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY',        'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_PEDIA', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_STRATEGY'),
('BUILDING_FW_BIOFUEL_REFINERY_RICE',  'BUILDINGCLASS_FW_BIOFUEL_REFINERY',  'TECH_GEO_ENERGY',  2500, 'ART_DEF_BUILDING_LABORATORY',  45,'CIV_COLOR_ATLAS_FW_3',   'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_HELP', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_RICE',   'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_PEDIA', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_STRATEGY'),
('BUILDING_FW_BIOFUEL_REFINERY_BANANA','BUILDINGCLASS_FW_BIOFUEL_REFINERY',  'TECH_GEO_ENERGY',  2500, 'ART_DEF_BUILDING_LABORATORY',  45,'CIV_COLOR_ATLAS_FW_3',   'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_HELP', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_BANANA', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_PEDIA', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_STRATEGY'),
('BUILDING_FW_BIOFUEL_REFINERY_MAIZE', 'BUILDINGCLASS_FW_BIOFUEL_REFINERY',  'TECH_GEO_ENERGY',  2500, 'ART_DEF_BUILDING_LABORATORY',  45,'CIV_COLOR_ATLAS_FW_3',   'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_HELP', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_MAIZE',  'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_PEDIA', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_STRATEGY'),
('BUILDING_FW_CONVERTER',              'BUILDINGCLASS_FW_CONVERTER',         'TECH_NANOMATERIALS',  2500, 'ART_DEF_BUILDING_LABORATORY',  44,'CIV_COLOR_ATLAS_FW_3',   'TXT_KEY_BUILDING_FW_CONVERTER_HELP',        'TXT_KEY_BUILDING_FW_CONVERTER',               'TXT_KEY_BUILDING_FW_CONVERTER_PEDIA',        'TXT_KEY_BUILDING_FW_CONVERTER_STRATEGY'),
('BUILDING_FW_CONVERTER_OIL',          'BUILDINGCLASS_FW_CONVERTER',         'TECH_NANOMATERIALS',  2500, 'ART_DEF_BUILDING_LABORATORY',  44,'CIV_COLOR_ATLAS_FW_3',   'TXT_KEY_BUILDING_FW_CONVERTER_HELP',        'TXT_KEY_BUILDING_FW_CONVERTER_OIL',           'TXT_KEY_BUILDING_FW_CONVERTER_PEDIA',        'TXT_KEY_BUILDING_FW_CONVERTER_STRATEGY'),
('BUILDING_FW_CONVERTER_IRON',         'BUILDINGCLASS_FW_CONVERTER',         'TECH_NANOMATERIALS',  2500, 'ART_DEF_BUILDING_LABORATORY',  44,'CIV_COLOR_ATLAS_FW_3',   'TXT_KEY_BUILDING_FW_CONVERTER_HELP',        'TXT_KEY_BUILDING_FW_CONVERTER_IRON',          'TXT_KEY_BUILDING_FW_CONVERTER_PEDIA',        'TXT_KEY_BUILDING_FW_CONVERTER_STRATEGY'),
('BUILDING_FW_NANOFORGE',       	   'BUILDINGCLASS_FW_NANOFORGE',  		 'TECH_NANOMATERIALS',  3500, 'ART_DEF_BUILDING_LABORATORY',   8,'TCS_MOD_ICON_ATLAS',     'TXT_KEY_BUILDING_FW_NANOFORGE_HELP', 	    'TXT_KEY_BUILDING_FW_NANOFORGE',        		'TXT_KEY_BUILDING_FW_NANOFORGE_PEDIA', 		  'TXT_KEY_BUILDING_FW_NANOFORGE_STRATEGY');

INSERT INTO Buildings (Type, PrereqTech, Cost, ArtDefineTag, PortraitIndex, IconAtlas) VALUES
('BUILDING_FW_AQUACULTURE_LAB', 		'TECH_SEA_EXPLORE', 	    		2750, 'ART_DEF_BUILDING_LABORATORY',         51,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF','TECH_SEA_EXPLORE',              	2750, 'ART_DEF_BUILDING_LABORATORY',          1,'NW_ATLAS'),
('BUILDING_FW_UNDERSEA_MINING', 		'TECH_SEA_EXPLORE', 	            2750, 'ART_DEF_BUILDING_LABORATORY',         53,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_SERVER_HUB', 				'TECH_INTERNET', 					2750, 'ART_DEF_BUILDING_LABORATORY',         32,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_FUNGAL_AGRIGENOMICS', 	'TECH_GEN_MANIP', 					3250, 'ART_DEF_BUILDING_LABORATORY',         51,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_GENE_LAB', 				'TECH_GEN_MANIP', 					3250, 'ART_DEF_BUILDING_LABORATORY',         43,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_WORLD_SECURITY', 			'TECH_GLOBALIZATION', 				3250, 'ART_DEF_BUILDING_LABORATORY',         57,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_AUTOPLANT', 				'TECH_ROBOTICS', 		            3250, 'ART_DEF_BUILDING_LABORATORY',          7,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_NANOMAT_PLANT', 			'TECH_NANOTECHNOLOGY', 				3250, 'ART_DEF_BUILDING_LABORATORY',          3,'CIV_COLOR_ATLAS_FW'),
('BUILDING_FW_COMMERCE_SERVER', 		'TECH_DATA_SCIENCE', 				3500, 'ART_DEF_BUILDING_LABORATORY',         33,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_ENTERTAINMENT_SERVER', 	'TECH_DATA_SCIENCE', 				3500, 'ART_DEF_BUILDING_LABORATORY',         42,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_CLOUD_COMPUTING', 		'TECH_DATA_SCIENCE', 				3500, 'ART_DEF_BUILDING_LABORATORY',         44,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_RESEARCH_SERVER', 		'TECH_DATA_SCIENCE', 			    3500, 'ART_DEF_BUILDING_LABORATORY',         34,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_ECOSANCTUARY', 			'TECH_ECOGENETICS', 	            3500, 'ART_DEF_BUILDING_LABORATORY',         31,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_CRYPTOBANK', 				'TECH_GRID_COMPUTING', 				3500, 'ART_DEF_BUILDING_LABORATORY',         15,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_VR_TRAINING', 			'TECH_METAVERSE', 					3500, 'ART_DEF_BUILDING_LABORATORY',          0,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_VIRTUAL_MUSEUM', 			'TECH_METAVERSE', 					3500, 'ART_DEF_BUILDING_LABORATORY',         39,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_PARTICLE_ACCELERATOR', 	'TECH_PARTICLE_PHYSICS', 			3500, 'ART_DEF_BUILDING_LABORATORY',         59,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_VERTICAL_FARM', 			'TECH_ARTIFICIAL_ENVIRONMENTS', 	3500, 'ART_DEF_BUILDING_LABORATORY',          7,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BIOTEST_CENTER', 		    'TECH_BIOTECHNOLOGY', 			    4000, 'ART_DEF_BUILDING_LABORATORY',         20,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BIOFACTORY', 				'TECH_BIOTECHNOLOGY', 				4000, 'ART_DEF_BUILDING_LABORATORY',          2,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_OCEAN_BIOHUB', 	        'TECH_BIOTECHNOLOGY', 	     	    4000, 'ART_DEF_BUILDING_LABORATORY',  	     57,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_BIOTECH_CENTER', 	    	'TECH_BIOTECHNOLOGY', 		      	4000, 'ART_DEF_BUILDING_LABORATORY',         29,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_BIO_AUG_CLINIC', 			'TECH_BIOMEDICAL', 					4000, 'ART_DEF_BUILDING_LABORATORY',          4,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_NETWORK_BACKBONE', 		'TECH_GENERATIVE_AI', 				4000, 'ART_DEF_BUILDING_LABORATORY',          1,'CIV_COLOR_ATLAS_FW'),
('BUILDING_FW_LAUNCH_FACILITY', 		'TECH_FUTURE_BALLISTICS', 			4000, 'ART_DEF_BUILDING_LABORATORY',         56,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BOREHOLE', 				'TECH_GEO_ENERGY',                  4000, 'ART_DEF_BUILDING_LABORATORY',         36,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_GEOTHERMAL_FACTORY', 		'TECH_GEO_ENERGY', 		        	4000, 'ART_DEF_BUILDING_LABORATORY',         48,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_ANTIMATTER_RESEARCH', 	'TECH_GEO_ENERGY', 		    	    4000, 'ART_DEF_BUILDING_LABORATORY',         27,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_CLONE_LAB', 				'TECH_SYNTHETIC_BIOLOGY', 			4250, 'ART_DEF_BUILDING_LABORATORY',         5, 'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_FEEDSITE_HUB', 			'TECH_BIO_HYBRID', 		            4250, 'ART_DEF_BUILDING_LABORATORY',         40,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_SIMULATION_HUB', 			'TECH_BIO_HYBRID', 		            4250, 'ART_DEF_BUILDING_LABORATORY',          6,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BIOCONVERTER_ADNF', 		'TECH_BIO_HYBRID', 			        4250, 'ART_DEF_BUILDING_LABORATORY',          2,'CIV_COLOR_ATLAS_FW'),
('BUILDING_FW_BIOCONVERTER_NANO', 		'TECH_BIO_HYBRID', 			        4250, 'ART_DEF_BUILDING_LABORATORY',          2,'CIV_COLOR_ATLAS_FW'),
('BUILDING_FW_BIOCONVERTER_NANO2', 		'TECH_BIO_HYBRID', 			        4250, 'ART_DEF_BUILDING_LABORATORY',          2,'CIV_COLOR_ATLAS_FW'),
('BUILDING_FW_HUMONOID_FORGE',   		'TECH_INTEGRATED_AI',	 		    4250, 'ART_DEF_BUILDING_LABORATORY',          1,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_TELEPRESENCE_HUB', 		'TECH_INTEGRATED_AI',	 		    4250, 'ART_DEF_BUILDING_LABORATORY',         61,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_DISTRIBUTION_HUB', 		'TECH_ADVANCED_MATERIALS', 		    4250, 'ART_DEF_BUILDING_LABORATORY',         8,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_METROPLEX_HUB', 			'TECH_ADVANCED_MATERIALS', 		    4250, 'ART_DEF_BUILDING_LABORATORY',         28,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_METAMATERIALS_CENTER', 	'TECH_ADVANCED_MATERIALS', 			4250, 'ART_DEF_BUILDING_LABORATORY',         34,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_MYCOPROTEIN_VATS', 		'TECH_ASTRODYNAMICS', 		    	4250, 'ART_DEF_BUILDING_LABORATORY',         60,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_SOLAR_REFLECTOR', 		'TECH_ASTRODYNAMICS', 				4250, 'ART_DEF_BUILDING_LABORATORY',         43,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_TRANSGENIC_NURSERY', 		'TECH_TRANSGENICS', 				4500, 'ART_DEF_BUILDING_LABORATORY',         59,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_DEFENSE_FIELD', 			'TECH_AUTONOMOUS_SYSTEMS', 			4500, 'ART_DEF_BUILDING_LABORATORY',         17,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_NANOMINES_FIELD', 		'TECH_AUTONOMOUS_SYSTEMS', 			4500, 'ART_DEF_BUILDING_LABORATORY',         18,'COMMUNITY_ATLAS'),
('BUILDING_FW_DRONE_HIVE', 				'TECH_AUTONOMOUS_SYSTEMS', 			4500, 'ART_DEF_BUILDING_LABORATORY',          9,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_AEROSPACE_COMPLEX', 		'TECH_ARCOLOGIES', 		        	4500, 'ART_DEF_BUILDING_LABORATORY',         30,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_BIOCOMPUTER', 		    'TECH_NEURAL_INTERFACE', 		    4500, 'ART_DEF_BUILDING_LABORATORY',         21,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_TIDAL_PORT', 				'TECH_NEURAL_INTERFACE', 		    4500, 'ART_DEF_BUILDING_LABORATORY',         50,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_SKYRAIL_HUB', 			'TECH_PLASMA_ENERGY', 		    	4500, 'ART_DEF_BUILDING_LABORATORY',          61,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_LAGRANGE_COMMERCIAL', 	'TECH_PLASMA_ENERGY', 		        4500, 'ART_DEF_BUILDING_LABORATORY',         19,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_LAGRANGE_INDUSTRIAL', 	'TECH_PLASMA_ENERGY', 		        4500, 'ART_DEF_BUILDING_LABORATORY',         20,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_LAGRANGE_RESEARCH', 		'TECH_PLASMA_ENERGY', 		        4500, 'ART_DEF_BUILDING_LABORATORY',         21,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_ECTOGENESIS_POD', 		'TECH_GENGINEERING', 				4750, 'ART_DEF_BUILDING_LABORATORY',         22,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_MASS_DIGESTER', 			'TECH_BIOMODIFICATION', 	    	4750, 'ART_DEF_BUILDING_LABORATORY',          4,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BIOMOD_TANK', 			'TECH_BIOMODIFICATION', 			4750, 'ART_DEF_BUILDING_LABORATORY',         30,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_QUANTUM_LINK', 			'TECH_QUANTUM_SYNC', 		    	4750, 'ART_DEF_BUILDING_LABORATORY',          8,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BIGBROTHER_CONTROL', 	    'TECH_AGI', 		                4750, 'ART_DEF_BUILDING_LABORATORY',         29,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_FUSION_PLANT', 			'TECH_NUCLEAR_FUSION', 				4750, 'ART_DEF_BUILDING_LABORATORY',          6,'CIV_COLOR_ATLAS_FW'),
('BUILDING_FW_ORBITAL_MINING', 	    	'TECH_PLANETARY_MIGRATION', 	    4750, 'ART_DEF_BUILDING_LABORATORY',         19,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_ORBITAL_HABITAT', 		'TECH_SPACE_HABITATS', 	            4750, 'ART_DEF_BUILDING_LABORATORY',         27,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_GENETIC_EVOLUTION',   	'TECH_GENETIC_ACCELERATION', 		5000, 'ART_DEF_BUILDING_LABORATORY',         36,'CIV_COLOR_ATLAS_FW'),
('BUILDING_FW_AI_NETWORK', 				'TECH_DIGITAL_SOCIETY', 			5000, 'ART_DEF_BUILDING_LABORATORY',          8,'BM_ALIENS_CIV_COLOR_ATLAS'),
('BUILDING_FW_CENTRAL_COMMAND', 		'TECH_HYPERSTRUCTURES', 			5000, 'ART_DEF_BUILDING_LABORATORY',         23,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_PHOTOSYSTEMS', 			'TECH_GENETIC_ACCELERATION', 		5000, 'ART_DEF_BUILDING_LABORATORY',         35,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BIRTHING_PODS', 			'TECH_HUMAN_AUGMENTATION', 			5000, 'ART_DEF_BUILDING_LABORATORY',         62,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_BRAIN_UPLOADING', 		'TECH_DIGITAL_SOCIETY', 			5000, 'ART_DEF_BUILDING_LABORATORY',          3,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_ALLOY_FOUNDRY', 			'TECH_SMART_MATERIALS', 			5000, 'ART_DEF_BUILDING_LABORATORY',         13,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_UTILITY_FOG', 			'TECH_SMART_MATERIALS', 			5000, 'ART_DEF_BUILDING_LABORATORY',         11,'CIV_COLOR_ATLAS_FW_2'),
('BUILDING_FW_GENOME_PROJECT_1', 		     NULL,                            -1, 'ART_DEF_BUILDING_LABORATORY',         21,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_GENOME_PROJECT_2', 		     NULL,                            -1, 'ART_DEF_BUILDING_LABORATORY',         21,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_AI_DATANETWORK_1', 		     NULL,                            -1, 'ART_DEF_BUILDING_LABORATORY',         21,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_AI_DATANETWORK_2', 		     NULL,                            -1, 'ART_DEF_BUILDING_LABORATORY',         21,'CIV_COLOR_ATLAS_FW_3'),
('BUILDING_FW_DEEP_RESOURCE_1', 		     NULL,    					      -1, 'ART_DEF_BUILDING_LABORATORY',          9,'TCS_MOD_ICON_ATLAS'),
('BUILDING_FW_DEEP_RESOURCE_2', 		     NULL,    						  -1, 'ART_DEF_BUILDING_LABORATORY',          9,'TCS_MOD_ICON_ATLAS');

------------------------------------------------------------
-- 1) Cyber Police Dummy : 1  minocity +1 security
------------------------------------------------------------
INSERT INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_FW_WORLD_SECURITY_DUMMY',
        'TXT_KEY_BUILDING_FW_WORLD_SECURITY_DUMMY',
        'BUILDING_FW_WORLD_SECURITY_DUMMY');


INSERT OR IGNORE INTO Buildings
        (Type,                           BuildingClass,                        Cost, FaithCost, PrereqTech,
         NeverCapture, NukeImmune, ConquestProb,
         Description,                              Help,                                   ArtDefineTag,
         IconAtlas, PortraitIndex, NoOccupiedUnhappiness, SpySecurityModifier)
VALUES  ('BUILDING_FW_WORLD_SECURITY_DUMMY','BUILDINGCLASS_FW_WORLD_SECURITY_DUMMY', -1,   -1,        NULL,
         1,            1,         0,
         'TXT_KEY_BUILDING_FW_WORLD_SECURITY_DUMMY', 'TXT_KEY_BUILDING_FW_WORLD_SECURITY_DUMMY_HELP','NONE',
         'TCS_MOD_ICON_ATLAS',    40,                1,                    1);


---------------------------
-- NEW DUMMY BUILDING
----------------------------
INSERT INTO BuildingClasses (Type, DefaultBuilding)
VALUES ('BUILDINGCLASS_DUMMY_MIL10_STACK','BUILDING_DUMMY_MIL10_STACK');

INSERT INTO Buildings
 (Type,                          BuildingClass,                       Cost, PrereqTech, NeverCapture, NukeImmune, ConquestProb,
  Description,                   Help,                                IconAtlas, PortraitIndex)
VALUES
 ('BUILDING_DUMMY_MIL10_STACK', 'BUILDINGCLASS_DUMMY_MIL10_STACK',     -1,   NULL,       1,           1,          100,
 'TXT_KEY_BUILDING_MIL10_STACK_DUMMY',      NULL,                                  'CIV_COLOR_ATLAS_FW_2', 22);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield)
VALUES ('BUILDING_DUMMY_MIL10_STACK','YIELD_PRODUCTION',1);

INSERT INTO BuildingClasses (Type, DefaultBuilding)
VALUES ('BUILDINGCLASS_DUMMY_BIOMOD_POP', 'BUILDING_DUMMY_BIOMOD_POP');

INSERT INTO Buildings
 (Type,                         BuildingClass,                    Cost, PrereqTech, NeverCapture, NukeImmune, ConquestProb,
  Description,                  Help,                             IconAtlas, PortraitIndex)
VALUES
 ('BUILDING_DUMMY_BIOMOD_POP', 'BUILDINGCLASS_DUMMY_BIOMOD_POP',  -1,   NULL,        1,           1,          100,
  'TXT_KEY_BUILDING_DUMMY_BIOMOD_POP_DUMMY',    NULL,                             'CIV_COLOR_ATLAS_FW_2', 30);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
 ('BUILDING_DUMMY_BIOMOD_POP', 'YIELD_GREAT_GENERAL_POINTS', 1),
 ('BUILDING_DUMMY_BIOMOD_POP', 'YIELD_GREAT_ADMIRAL_POINTS', 1),
 ('BUILDING_DUMMY_BIOMOD_POP', 'YIELD_GOLDEN_AGE_POINTS',    2);

--=======================================================================================================================================================
UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_'||SUBSTR(Type,10), Description = 'TXT_KEY_'||Type,
	Civilopedia = 'TXT_KEY_'||Type||'_PEDIA', Strategy = 'TXT_KEY_'||Type||'_STRATEGY', Help = 'TXT_KEY_'||Type||'_HELP',
	MinAreaSize = -1, HurryCostModifier = -20, ConquestProb = 80
WHERE Type IN (
'BUILDING_FW_GENE_LAB',
'BUILDING_FW_LAUNCH_FACILITY',
'BUILDING_FW_WORLD_SECURITY',
'BUILDING_FW_BIGBROTHER_CONTROL',
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
'BUILDING_FW_BIOTEST_CENTER',
'BUILDING_FW_FUNGAL_AGRIGENOMICS',
'BUILDING_FW_SEAWATER_ARTIFICIAL_REEF',
'BUILDING_FW_ECOSANCTUARY',
'BUILDING_FW_BIOFACTORY',
'BUILDING_FW_GEOTHERMAL_FACTORY',
'BUILDING_FW_ANTIMATTER_RESEARCH',
'BUILDING_FW_OCEAN_BIOHUB',
'BUILDING_FW_PARTICLE_ACCELERATOR',
'BUILDING_FW_ECTOGENESIS_POD',
'BUILDING_FW_PHOTOSYSTEMS',
'BUILDING_FW_TRANSGENIC_NURSERY',
'BUILDING_FW_TIDAL_PORT',
'BUILDING_FW_SKYRAIL_HUB',
'BUILDING_FW_BIOTECH_CENTER',
'BUILDING_FW_BIOMOD_TANK',
'BUILDING_FW_BIO_AUG_CLINIC',
'BUILDING_FW_BIRTHING_PODS',
'BUILDING_FW_QUANTUM_LINK',
'BUILDING_FW_BIOCOMPUTER',
'BUILDING_FW_BIOCONVERTER_NANO',
'BUILDING_FW_BIOCONVERTER_NANO2',
'BUILDING_FW_BIOCONVERTER_ADNF',
'BUILDING_FW_TELEPRESENCE_HUB',
'BUILDING_FW_HUMONOID_FORGE',
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
'BUILDING_FW_SOLAR_REFLECTOR',
'BUILDING_FW_ORBITAL_MINING',
'BUILDING_FW_LAGRANGE_RESEARCH',
'BUILDING_FW_LAGRANGE_INDUSTRIAL',
'BUILDING_FW_LAGRANGE_COMMERCIAL',
'BUILDING_FW_ORBITAL_HABITAT',
'BUILDING_FW_BOREHOLE',
'BUILDING_FW_CENTRAL_COMMAND',
'BUILDING_FW_GENETIC_EVOLUTION',
'BUILDING_FW_METAMATERIALS_CENTER',
'BUILDING_FW_BIOFUEL_REFINERY',
'BUILDING_FW_DEEP_RESOURCE_1', 		
'BUILDING_FW_DEEP_RESOURCE_2', 	
'BUILDING_FW_AI_DATANETWORK_1',
'BUILDING_FW_AI_DATANETWORK_2',
'BUILDING_FW_GENOME_PROJECT_1',
'BUILDING_FW_GENOME_PROJECT_2');

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description)
SELECT 'BUILDINGCLASS_'||SUBSTR(Type,10), Type, 'TXT_KEY_'||Type
FROM Buildings
WHERE Type IN (
'BUILDING_FW_GENE_LAB',
'BUILDING_FW_LAUNCH_FACILITY',
'BUILDING_FW_WORLD_SECURITY',
'BUILDING_FW_BIGBROTHER_CONTROL',
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
'BUILDING_FW_BIOTEST_CENTER',
'BUILDING_FW_FUNGAL_AGRIGENOMICS',
'BUILDING_FW_SEAWATER_ARTIFICIAL_REEF',
'BUILDING_FW_ECOSANCTUARY',
'BUILDING_FW_BIOFACTORY',
'BUILDING_FW_GEOTHERMAL_FACTORY',
'BUILDING_FW_ANTIMATTER_RESEARCH',
'BUILDING_FW_OCEAN_BIOHUB',
'BUILDING_FW_PARTICLE_ACCELERATOR',
'BUILDING_FW_ECTOGENESIS_POD',
'BUILDING_FW_PHOTOSYSTEMS',
'BUILDING_FW_TRANSGENIC_NURSERY',
'BUILDING_FW_TIDAL_PORT',
'BUILDING_FW_SKYRAIL_HUB',
'BUILDING_FW_BIOTECH_CENTER',
'BUILDING_FW_BIOMOD_TANK',
'BUILDING_FW_BIO_AUG_CLINIC',
'BUILDING_FW_BIRTHING_PODS',
'BUILDING_FW_QUANTUM_LINK',
'BUILDING_FW_TELEPRESENCE_HUB',
'BUILDING_FW_HUMONOID_FORGE',
'BUILDING_FW_BIOCOMPUTER',
'BUILDING_FW_BIOCONVERTER_NANO',
'BUILDING_FW_BIOCONVERTER_NANO2',
'BUILDING_FW_BIOCONVERTER_ADNF',
'BUILDING_FW_SIMULATION_HUB',
'BUILDING_FW_AI_NETWORK',
'BUILDING_FW_BRAIN_UPLOADING',
'BUILDING_FW_FUSION_PLANT',
'BUILDING_FW_DEFENSE_FIELD',
'BUILDING_FW_NANOFORGE',
'BUILDING_FW_AEROSPACE_COMPLEX',
'BUILDING_FW_AUTOPLANT',
'BUILDING_FW_CRYPTOBANK',
'BUILDING_FW_DRONE_HIVE',
'BUILDING_FW_UTILITY_FOG',
'BUILDING_FW_NANOMAT_PLANT',
'BUILDING_FW_ORBITAL_MINING',
'BUILDING_FW_ALLOY_FOUNDRY',
'BUILDING_FW_CONVERTER',
'BUILDING_FW_FEEDSITE_HUB',
'BUILDING_FW_DISTRIBUTION_HUB',
'BUILDING_FW_METROPLEX_HUB',
'BUILDING_FW_VERTICAL_FARM',
'BUILDING_FW_MYCOPROTEIN_VATS',
'BUILDING_FW_ORBITAL_HABITAT',
'BUILDING_FW_BOREHOLE',
'BUILDING_FW_SOLAR_REFLECTOR',
'BUILDING_FW_LAGRANGE_COMMERCIAL',
'BUILDING_FW_LAGRANGE_RESEARCH',
'BUILDING_FW_LAGRANGE_INDUSTRIAL',
'BUILDING_FW_CENTRAL_COMMAND',
'BUILDING_FW_GENETIC_EVOLUTION');

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxPlayerInstances) VALUES
('BUILDINGCLASS_FW_GENOME_PROJECT_1', 	     'BUILDING_FW_GENOME_PROJECT_1', 	    'TXT_KEY_BUILDING_FW_GENOME_PROJECT_1', 	1),
('BUILDINGCLASS_FW_GENOME_PROJECT_2', 	     'BUILDING_FW_GENOME_PROJECT_2', 	    'TXT_KEY_BUILDING_FW_GENOME_PROJECT_2', 	1),
('BUILDINGCLASS_FW_AI_DATANETWORK_1', 	     'BUILDING_FW_AI_DATANETWORK_1', 	    'TXT_KEY_BUILDING_FW_AI_DATANETWORK_1', 	1),
('BUILDINGCLASS_FW_AI_DATANETWORK_2', 	     'BUILDING_FW_AI_DATANETWORK_2', 	    'TXT_KEY_BUILDING_FW_AI_DATANETWORK_2', 	1),
('BUILDINGCLASS_FW_DEEP_RESOURCE_1', 	     'BUILDING_FW_DEEP_RESOURCE_1',       'TXT_KEY_BUILDING_FW_DEEP_RESOURCE_1', 	1),
('BUILDINGCLASS_FW_DEEP_RESOURCE_2', 	     'BUILDING_FW_DEEP_RESOURCE_2', 	    'TXT_KEY_BUILDING_FW_DEEP_RESOURCE_2', 	1),
('BUILDINGCLASS_FW_BIOFUEL_REFINERY', 	     'BUILDING_FW_BIOFUEL_REFINERY', 	    'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY', 	3),
('BUILDINGCLASS_FW_BIOFUEL_REFINERY_RICE', 	 'BUILDING_FW_BIOFUEL_REFINERY_RICE', 	'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY', 	3),
('BUILDINGCLASS_FW_BIOFUEL_REFINERY_BANANA', 'BUILDING_FW_BIOFUEL_REFINERY_BANANA', 'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY', 	3),
('BUILDINGCLASS_FW_BIOFUEL_REFINERY_MAIZE',  'BUILDING_FW_BIOFUEL_REFINERY_MAIZE', 	'TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY', 	3),
('BUILDINGCLASS_FW_METAMATERIALS_CENTER',    'BUILDING_FW_METAMATERIALS_CENTER',    'TXT_KEY_BUILDING_FW_METAMATERIALS_CENTER', 3);


--- ======================================================================================
-- Tech 1
------------------------------------------------------------------------------------------
-- ----------------------------------------------
-- -- Aquaculture Lab
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 11, Water = 1,  MinAreaSize = 1, DistressFlatReduction = 1, MutuallyExclusiveGroup = 40961
WHERE Type = 'BUILDING_FW_AQUACULTURE_LAB';
-- ----------------------------------------------
-- -- Artificial Reef
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 11, Water = 1, MinAreaSize = 10, TechEnhancedTourism = 0, MutuallyExclusiveGroup = 40961
WHERE Type = 'BUILDING_FW_SEAWATER_ARTIFICIAL_REEF';
-- ----------------------------------------------
-- -- Undersea Mining Platform
-- ----------------------------------------------
UPDATE Buildings
SET Water = 1, MinAreaSize = 10, TradeRouteRecipientBonus = 1, TradeRouteTargetBonus = 1, MutuallyExclusiveGroup = 40961
WHERE Type = 'BUILDING_FW_UNDERSEA_MINING';

-----------------------------------------------------------------------
-----------------------------------------------------------------------------
--- ======================================================================================
-- Tech 2
------------------------------------------------------------------------------------------
-- ----------------------------------------------
-- -- Fungal Agrigenomics
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NeverCapture = 1
WHERE Type = 'BUILDING_FW_FUNGAL_AGRIGENOMICS';
-- ----------------------------------------------
-- -- Genomod Lab
-- ----------------------------------------------
UPDATE Buildings
SET FoodKept = 15, GoldMaintenance = 12, DistressFlatReduction = 2, SpecialistCount = 2, SpecialistType = 'SPECIALIST_SCIENTIST'
WHERE Type = 'BUILDING_FW_GENE_LAB';
-- ----------------------------------------------
-- -- CYBERPOLICE (vp 4.4 changed)
-- ----------------------------------------------
UPDATE Buildings
SET EspionageModifier = 0,
	SpySecurityModifier = 20,
	DistressFlatReduction = 1,
	PovertyFlatReduction = 1,
	IlliteracyFlatReduction = 1,
	BoredomFlatReduction = 1,
	GoldMaintenance = 12
WHERE Type = 'BUILDING_FW_WORLD_SECURITY';

-- ----------------------------------------------
-- -- Autoplant
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NoUnhappfromXSpecialists = 1, DistressFlatReduction = 1, SpecialistCount = 2, SpecialistType = 'SPECIALIST_ENGINEER'
WHERE Type = 'BUILDING_FW_AUTOPLANT';
-- ----------------------------------------------
-- -- Nanomaterial Plant
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NeverCapture = 1
WHERE Type = 'BUILDING_FW_NANOMAT_PLANT';
-- ----------------------------------------------
-- -- Spaceship Factory 
-- ----------------------------------------------
UPDATE Buildings
SET PrereqTech = 'TECH_SPACE_EXPLORE', Cost = 3250, GoldMaintenance = 12
WHERE Type = 'BUILDING_SPACESHIP_FACTORY';

UPDATE Buildings
SET SpaceProductionModifier = 35
WHERE Type = 'BUILDING_SPACESHIP_FACTORY';

INSERT INTO Building_DomainProductionModifiers (BuildingType, DomainType, Modifier)
SELECT 'BUILDING_SPACESHIP_FACTORY','DOMAIN_AIR',15
WHERE EXISTS (SELECT 1 FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value=1)  
  AND NOT EXISTS (
    SELECT 1 FROM Building_DomainProductionModifiers
    WHERE BuildingType='BUILDING_SPACESHIP_FACTORY' AND DomainType='DOMAIN_AIR'
  );

UPDATE Buildings
SET TrainedFreePromotion = 'PROMOTION_FW_SPACESHIP'
WHERE Type = 'BUILDING_SPACESHIP_FACTORY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 1);
--- ======================================================================================
-- Tech 3
------------------------------------------------------------------------------------------
-- ----------------------------------------------
-- -- Ecosanctuary
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NeverCapture = 1, LandmarksTourismPercent = 15, BoredomFlatReduction = 1, ReligiousUnrestFlatReduction = 1, MutuallyExclusiveGroup = 23532
WHERE Type = 'BUILDING_FW_ECOSANCTUARY';
-- ----------------------------------------------
-- -- Cryptobank
-- ----------------------------------------------
UPDATE Buildings
SET SpecialistCount = 2, SpecialistType = 'SPECIALIST_MERCHANT', PovertyFlatReduction = 2
WHERE Type = 'BUILDING_FW_CRYPTOBANK';
-- ----------------------------------------------
-- -- VR Training
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NeverCapture = 1, DistressFlatReduction = 1, BoredomFlatReduction = 1, CitySupplyFlat = 1
WHERE Type = 'BUILDING_FW_VR_TRAINING';
-- ----------------------------------------------
-- -- Virtual Museum
-- ----------------------------------------------
UPDATE Buildings
SET GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 2, GoldMaintenance = 12, BoredomFlatReduction = 2
WHERE Type = 'BUILDING_FW_VIRTUAL_MUSEUM';
-------------------------------------------------------------------------------------------
-- ----------------------------------------------
-- -- Entertainment Server
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, SpecialistCount = 1, SpecialistType = 'SPECIALIST_ARTIST', TechEnhancedTourism = 0, BoredomFlatReduction = 1, NoUnhappfromXSpecialists = 1, MutuallyExclusiveGroup = 99801
WHERE Type = 'BUILDING_FW_ENTERTAINMENT_SERVER';
-- ----------------------------------------------
-- -- Cloud Computing
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, SpecialistCount = 1, SpecialistType = 'SPECIALIST_ENGINEER', DistressFlatReduction = 1, NoUnhappfromXSpecialists = 1, MutuallyExclusiveGroup = 99801
WHERE Type = 'BUILDING_FW_CLOUD_COMPUTING';
-- ----------------------------------------------
-- -- E-Commerce Server
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 8, SpecialistCount = 1, SpecialistType = 'SPECIALIST_MERCHANT', PovertyFlatReduction = 1, NoUnhappfromXSpecialists = 1, MutuallyExclusiveGroup = 99801
WHERE Type = 'BUILDING_FW_COMMERCE_SERVER';
-- ----------------------------------------------
-- -- Research Server
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, SpecialistCount = 2, SpecialistType = 'SPECIALIST_SCIENTIST',  IlliteracyFlatReduction = 1, NoUnhappfromXSpecialists = 1, MutuallyExclusiveGroup = 99801
WHERE Type = 'BUILDING_FW_RESEARCH_SERVER';
-------------------------------------------------------------------------------------------------
-- ----------------------------------------------
-- -- Nanoforge
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NeverCapture = 1, CitySupplyFlat = 1
WHERE Type = 'BUILDING_FW_NANOFORGE';
-- ----------------------------------------------
-- -- Particle Accelerator
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 2, IlliteracyFlatReduction = 1
WHERE Type = 'BUILDING_FW_PARTICLE_ACCELERATOR';
-- ----------------------------------------------
-- -- Vertical Farms
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 12, NeverCapture = 1, IlliteracyFlatReduction = 1, NoUnhappfromXSpecialists = 1, MutuallyExclusiveGroup = 23532
WHERE Type = 'BUILDING_FW_VERTICAL_FARM';

--- ======================================================================================
-- Tech 3
------------------------------------------------------------------------------------------
-- ----------------------------------------------
-- -- Bio-flesh Industry
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 4
WHERE Type = 'BUILDING_FW_BIOTEST_CENTER';
-- ----------------------------------------------
-- -- Biofactory
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, ProhibitedCityTerrain = 'TERRAIN_SNOW', MutuallyExclusiveGroup = 23492
WHERE Type = 'BUILDING_FW_BIOFACTORY';
-- ----------------------------------------------
-- -- Marine Bio Industry Complex
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14,  Water = 1, MutuallyExclusiveGroup = 23492
WHERE Type = 'BUILDING_FW_OCEAN_BIOHUB';
-- ----------------------------------------------
-- -- Genejack Facility
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, MutuallyExclusiveGroup = 83452, SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 1
WHERE Type = 'BUILDING_FW_BIOTECH_CENTER';
-- ----------------------------------------------
-- -- Implant Clinic
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, NeverCapture = 1, CitySupplyFlat = 1, DistressFlatReduction = 2, TrainedFreePromotion = 'PROMOTION_FW_IMPLANTS', MutuallyExclusiveGroup = 69231
WHERE Type = 'BUILDING_FW_BIO_AUG_CLINIC';
-- ----------------------------------------------
-- -- Network Backbone
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, GreatWorksTourismModifier = 10, PovertyFlatReduction = 1, DistressFlatReduction = 1, SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 1
WHERE Type = 'BUILDING_FW_NETWORK_BACKBONE';
-- ----------------------------------------------
-- -- Launch Facility
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, DistressFlatReduction = 1, NoUnhappfromXSpecialists = 1, TrainedFreePromotion = 'PROMOTION_FW_GPSASSIST', AirModifier = 1,  MutuallyExclusiveGroup = 69231
WHERE Type = 'BUILDING_FW_LAUNCH_FACILITY';
-- ----------------------------------------------
-- -- Biofuel Refinery
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 2, MutuallyExclusiveGroup = 54221
WHERE Type = 'BUILDING_FW_BIOFUEL_REFINERY';

UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 2, MutuallyExclusiveGroup = 54221
WHERE Type = 'BUILDING_FW_BIOFUEL_REFINERY_RICE';

UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 2, MutuallyExclusiveGroup = 54221
WHERE Type = 'BUILDING_FW_BIOFUEL_REFINERY_BANANA';

UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 2, MutuallyExclusiveGroup = 54221
WHERE Type = 'BUILDING_FW_BIOFUEL_REFINERY_MAIZE';
-- ----------------------------------------------
-- -- Geothermal Factory
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 11, NeverCapture = 1, NearbyMountainRequired = 1, MutuallyExclusiveGroup = 23492
WHERE Type = 'BUILDING_FW_GEOTHERMAL_FACTORY';
-- ----------------------------------------------
-- -- Borehole
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, NeverCapture = 1, ProhibitedCityTerrain = 'TERRAIN_MOUNTAIN', MutuallyExclusiveGroup = 23492
WHERE Type = 'BUILDING_FW_BOREHOLE';
-- ----------------------------------------------
-- -- Deep earth Reasearch
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, NeverCapture = 1, MutuallyExclusiveGroup = 83452, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 1
WHERE Type = 'BUILDING_FW_ANTIMATTER_RESEARCH';
--- ======================================================================================
-- Tech 4
------------------------------------------------------------------------------------------
-- ----------------------------------------------
-- -- Clone Lab
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, CitySupplyModifier = 10, PopulationChange = 2, GreatPeopleRateModifier = 10
WHERE Type = 'BUILDING_FW_CLONE_LAB';
-- ----------------------------------------------
-- -- Feedsite Hub
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, SpecialistType = 'SPECIALIST_MUSICIAN', SpecialistCount = 2, GreatPeopleRateChange = 2, BoredomFlatReduction = 1,  NoUnhappfromXSpecialists = 1, MutuallyExclusiveGroup = 39993
WHERE Type = 'BUILDING_FW_FEEDSITE_HUB';
-- ----------------------------------------------
-- -- Simulation Hub
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 2, GreatPeopleRateChange = 2, IlliteracyFlatReduction = 1, NoUnhappfromXSpecialists = 1,  MutuallyExclusiveGroup = 39993
WHERE Type = 'BUILDING_FW_SIMULATION_HUB';
-- ----------------------------------------------
-- ----------------------------------------------
-- -- Bioconverter nanomaterial (OIL)
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 2
WHERE Type = 'BUILDING_FW_BIOCONVERTER_NANO';
-- ----------------------------------------------
-- -- Bioconverter nanomaterial (COAL)
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 2
WHERE Type = 'BUILDING_FW_BIOCONVERTER_NANO2';
-- ----------------------------------------------
-- -- Bioconverter Genospore
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 2
WHERE Type = 'BUILDING_FW_BIOCONVERTER_ADNF';

-- ----------------------------------------------
-- -- Telepresence Hub
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 8
WHERE Type = 'BUILDING_FW_TELEPRESENCE_HUB';

-- ----------------------------------------------
-- -- Humonoid forge
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14,  NoUnhappfromXSpecialists = 2
WHERE Type = 'BUILDING_FW_HUMONOID_FORGE';
-- ----------------------------------------------
-- -- Distribution Hub
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 2, GreatPeopleRateChange = 2, BuildingProductionModifier = 15, DistressFlatReduction = 1, NoUnhappfromXSpecialists = 1,  MutuallyExclusiveGroup = 39993
WHERE Type = 'BUILDING_FW_DISTRIBUTION_HUB';
-- ----------------------------------------------
-- -- Metroplex hub
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 2, GreatPeopleRateChange = 2,  PovertyFlatReduction = 1,  NoUnhappfromXSpecialists = 1, MutuallyExclusiveGroup = 39993
WHERE Type = 'BUILDING_FW_METROPLEX_HUB';
-- ----------------------------------------------
-- -- Enrichment Facility
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 14, NationalPopRequired = 125
WHERE Type = 'BUILDING_FW_METAMATERIALS_CENTER';
-- ----------------------------------------------
-- -- Mycoprotein Vats
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 14, FoodKept = 10, NoUnhappfromXSpecialists = 1
WHERE Type = 'BUILDING_FW_MYCOPROTEIN_VATS';
-- ----------------------------------------------
-- -- Space Station
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, GoldMaintenance = 9, NoUnhappfromXSpecialists = 1, WLTKDTurns = 15, CityAirStrikeDefense = 5
WHERE Type = 'BUILDING_FW_SOLAR_REFLECTOR';
--- ======================================================================================
-- Tech 5
------------------------------------------------------------------------------------------
-- ----------------------------------------------
-- -- Transgenic Nursery
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, SpecialistType = 'SPECIALIST_SCIENTIST', FoodKept=10, GreatPeopleRateChange = 1, TrainedFreePromotion = 'PROMOTION_FW_TRANSGENICS', MutuallyExclusiveGroup = 99778, SpecialistCount = 1
WHERE Type = 'BUILDING_FW_TRANSGENIC_NURSERY';
-- ----------------------------------------------
-- -- Biocomputer
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16
WHERE Type = 'BUILDING_FW_BIOCOMPUTER';
-- ----------------------------------------------
-- -- Tidal Port
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 1, Water = 1, FinishSeaTRTourism = 10, TradeRouteSeaGoldBonus = 100, CitySupplyFlat = 2, TradeRouteRecipientBonus = 2, TradeRouteTargetBonus = 2, TradeRouteSeaDistanceModifier = 50
WHERE Type = 'BUILDING_FW_TIDAL_PORT';
-----------------------------------------------
-- -- Defense Field
-- ----------------------------------------------
UPDATE Buildings
SET ProhibitedCityTerrain = 'TERRAIN_COAST', GoldMaintenance = 16, Defense = 2000, AllowsRangeStrike = 1, ExtraCityHitPoints = 125, NukeImmune = 1, NukeModifier = -20
WHERE Type = 'BUILDING_FW_DEFENSE_FIELD';
-- ----------------------------------------------
-- -- Nanomines Field
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, ExtraCityHitPoints = 50, Defense = 1000, Water = 1, DeepWaterTileDamage = 5, BorderObstacleWater = 1, MinAreaSize = 10
WHERE Type = 'BUILDING_FW_NANOMINES_FIELD';
-- ----------------------------------------------
-- -- Drone Hive
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, BuildingProductionModifier = 15, SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 1,  TrainedFreePromotion = 'PROMOTION_FW_AUTO_REPAIR', MutuallyExclusiveGroup = 99778, SpecialistCount = 1
WHERE Type = 'BUILDING_FW_DRONE_HIVE';
-- ----------------------------------------------
-- --  sky rail hub
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 1, RequiresIndustrialCityConnection = 1, FinishLandTRTourism = 10, TradeRouteLandGoldBonus = 50, BuildingProductionModifier = 15, TradeRouteLandDistanceModifier = 25
WHERE Type = 'BUILDING_FW_SKYRAIL_HUB';
-- ----------------------------------------------
-- -- Comm Module
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, GoldMaintenance = 6, SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 2, GreatPeopleRateChange = 2,  PovertyFlatReduction = 1, NoUnhappfromXSpecialists = 1, MutuallyExclusiveGroup = 26801
WHERE Type = 'BUILDING_FW_LAGRANGE_COMMERCIAL';
-- ----------------------------------------------
-- -- Engineering Module
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, GoldMaintenance = 16, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 2, GreatPeopleRateChange = 2, DistressFlatReduction = 1, NoUnhappfromXSpecialists = 1, MutuallyExclusiveGroup = 26801
WHERE Type = 'BUILDING_FW_LAGRANGE_INDUSTRIAL';
-- ----------------------------------------------
-- -- Research Module
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, GoldMaintenance = 16, SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 2, GreatPeopleRateChange = 2, IlliteracyFlatReduction = 1, NoUnhappfromXSpecialists = 1, MutuallyExclusiveGroup = 26801
WHERE Type = 'BUILDING_FW_LAGRANGE_RESEARCH';
-- ----------------------------------------------
-- -- Aerospace Complex
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, SpaceProductionModifier = 15, SpecialistType = 'SPECIALIST_MERCHANT', GreatPeopleRateChange = 1,  CityAirStrikeDefense = 10, AirModifier = 4,  TrainedFreePromotion = 'PROMOTION_FW_AEROPLEX_DROP', MutuallyExclusiveGroup = 99778, SpecialistCount = 1
WHERE Type = 'BUILDING_FW_AEROSPACE_COMPLEX';
-----------------------------------------------------------------------------------------------------------------------------------------
--- ======================================================================================
-- Tech 6
------------------------------------------------------------------------------------------
-- ----------------------------------------------
-- -- Biogenesis Pod
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, NeverCapture = 1, DistressFlatReduction = 2, TrainedFreePromotion = 'PROMOTION_FW_GENGINEERED'
WHERE Type = 'BUILDING_FW_ECTOGENESIS_POD';
-- ----------------------------------------------
-- -- Bioenhancement Centre
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, NeverCapture = 1, BoredomFlatReduction = 2, TrainedFreePromotion = 'PROMOTION_FW_BIOMODS', SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 2
WHERE Type = 'BUILDING_FW_BIOMOD_TANK';
-- ----------------------------------------------
-- -- Mass Digester
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, NoUnhappfromXSpecialists = 2
WHERE Type = 'BUILDING_FW_MASS_DIGESTER';
-- ----------------------------------------------
-- -- QUANTUM_LINK
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, Happiness = 2
WHERE Type = 'BUILDING_FW_QUANTUM_LINK';
-- ----------------------------------------------
-- -- Digital Police (vp 4.4 changed)
-- ----------------------------------------------
UPDATE Buildings
SET EspionageModifier = 0,
	SpySecurityModifier = 20,
	DistressFlatReduction = 1,
	PovertyFlatReduction = 1,
	IlliteracyFlatReduction = 1,
	BoredomFlatReduction = 1,
	NoUnhappfromXSpecialists = 2,
	GoldMaintenance = 16, 
	SpecialistType = 'SPECIALIST_CIVIL_SERVANT', SpecialistCount = 2
WHERE Type = 'BUILDING_FW_BIGBROTHER_CONTROL';
-- ----------------------------------------------
-- -- Fusion Plant
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, GreatPeopleRateModifier = 25
WHERE Type = 'BUILDING_FW_FUSION_PLANT';

INSERT INTO Building_YieldFromProcessModifier
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_FUSION_PLANT', 'YIELD_FOOD',    20),
	('BUILDING_FW_FUSION_PLANT', 'YIELD_GOLD',    20),
	('BUILDING_FW_FUSION_PLANT', 'YIELD_SCIENCE', 20),
	('BUILDING_FW_FUSION_PLANT', 'YIELD_CULTURE', 20),
	('BUILDING_FW_FUSION_PLANT', 'YIELD_FAITH',   20);
-- ----------------------------------------------
-- -- Moon Base --> cerenoid mining
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, NukeImmune = 1, GoldMaintenance = 16, SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 2, NoUnhappfromXSpecialists = 2
WHERE Type = 'BUILDING_FW_ORBITAL_MINING';
-- ----------------------------------------------
-- -- Orbital Habitat
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 16, NukeImmune = 1, NoUnhappfromXSpecialists = 2
WHERE Type = 'BUILDING_FW_ORBITAL_HABITAT';
--- ======================================================================================
-- Tech 7
------------------------------------------------------------------------------------------
-- ----------------------------------------------
-- -- Photosystems
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 18
WHERE Type = 'BUILDING_FW_PHOTOSYSTEMS';
-- ----------------------------------------------
-- -- Terraforming Station
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 20, MutuallyExclusiveGroup = 23491
WHERE Type = 'BUILDING_FW_GENETIC_EVOLUTION';
-- ----------------------------------------------
-- -- Birthing Pods
-- ----------------------------------------------
UPDATE Buildings
SET PopulationChange = 5, FoodKept = 18, NoUnhappfromXSpecialists = 3
WHERE Type = 'BUILDING_FW_BIRTHING_PODS';
-- ----------------------------------------------
-- -- AI Network
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 20, GreatPeopleRateModifier = 15, NoUnhappfromXSpecialists = 2, Defense = 1500, ExtraCityHitPoints = 60, MutuallyExclusiveGroup = 23491
WHERE Type = 'BUILDING_FW_AI_NETWORK';
-- ----------------------------------------------
-- -- Brain Uploading
-- ----------------------------------------------
UPDATE Buildings
SET PopulationChange = -20, NukeImmune = 1, ConquestProb = 100, LocalPopRequired = 70
WHERE Type = 'BUILDING_FW_BRAIN_UPLOADING';
-- ----------------------------------------------
-- -- Alloy Foundry
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 18, NeverCapture = 1
WHERE Type = 'BUILDING_FW_ALLOY_FOUNDRY';
-- ----------------------------------------------
-- -- Utility Fog
-- ----------------------------------------------
UPDATE Buildings
SET GoldMaintenance = 18, NeverCapture = 1, EmpireSizeModifierReduction = -5, HealRateChange = 5, BuildingProductionModifier = 20, AllowsRangeStrike = 1, CityRangedStrikeRange = 1, Defense = 1200, ExtraCityHitPoints = 100
WHERE Type = 'BUILDING_FW_UTILITY_FOG';
-- ----------------------------------------------
-- -- Central Command
-- ----------------------------------------------
UPDATE Buildings
SET NeverCapture = 1, GoldMaintenance = 20, MutuallyExclusiveGroup = 23491
WHERE Type = 'BUILDING_FW_CENTRAL_COMMAND';
-- ===========================================================================
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
WHERE Type = 'BUILDING_FW_GENOME_PROJECT_2';
-- ----------------------------------------------
-- -- Global Datanetwork Project 1
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, NeverCapture = 1
WHERE Type = 'BUILDING_FW_AI_DATANETWORK_1';
-- ----------------------------------------------
-- -- Global Datanetwork Project 2
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, NeverCapture = 1, GlobalGreatPeopleRateModifier = 10 
WHERE Type = 'BUILDING_FW_AI_DATANETWORK_2';
-- ----------------------------------------------
-- -- Deep resource Project 1
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, NeverCapture = 1
WHERE Type = 'BUILDING_FW_DEEP_RESOURCE_1';
-- ----------------------------------------------
-- -- Deep resource Project 2
-- ----------------------------------------------
UPDATE Buildings
SET NukeImmune = 1, NeverCapture = 1
WHERE Type = 'BUILDING_FW_DEEP_RESOURCE_2';

-------------------------------------------------------------------------------
--==============================================================================================
-- Building Basse
--=========================================================================
INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_FW_AQUACULTURE_LAB', 		'BUILDINGCLASS_HARBOR'),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF','BUILDINGCLASS_HARBOR'),
	('BUILDING_FW_UNDERSEA_MINING', 		'BUILDINGCLASS_HARBOR'),
	('BUILDING_FW_FUNGAL_AGRIGENOMICS', 	'BUILDINGCLASS_LABORATORY'),
	('BUILDING_FW_GENE_LAB', 	            'BUILDINGCLASS_LABORATORY'),
	('BUILDING_FW_WORLD_SECURITY', 			'BUILDINGCLASS_POLICE_STATION'),
	('BUILDING_FW_WORLD_SECURITY',	 	    'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_AUTOPLANT', 				'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_NANOMAT_PLANT',	        'BUILDINGCLASS_LABORATORY'),
	('BUILDING_FW_ECOSANCTUARY', 			'BUILDINGCLASS_GROCER'),
	('BUILDING_FW_CRYPTOBANK', 				'BUILDINGCLASS_STOCK_EXCHANGE'),
	('BUILDING_FW_CRYPTOBANK', 				'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_VR_TRAINING', 			'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_VR_TRAINING', 			'BUILDINGCLASS_MILITARY_ACADEMY'),
	('BUILDING_FW_VIRTUAL_MUSEUM', 			'BUILDINGCLASS_MUSEUM'),
	('BUILDING_FW_VIRTUAL_MUSEUM',	 		'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_COMMERCE_SERVER', 		'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_COMMERCE_SERVER', 		'BUILDINGCLASS_STOCK_EXCHANGE'),
	('BUILDING_FW_ENTERTAINMENT_SERVER', 	'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_ENTERTAINMENT_SERVER', 	'BUILDINGCLASS_BROADCAST_TOWER'),
	('BUILDING_FW_RESEARCH_SERVER', 		'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_RESEARCH_SERVER', 		'BUILDINGCLASS_LABORATORY'),
	('BUILDING_FW_CLOUD_COMPUTING', 		'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_CLOUD_COMPUTING', 		'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_CONVERTER', 				'BUILDINGCLASS_FW_NANOMAT_PLANT'),
	('BUILDING_FW_CONVERTER_OIL', 			'BUILDINGCLASS_FW_NANOMAT_PLANT'),
	('BUILDING_FW_CONVERTER_IRON', 			'BUILDINGCLASS_FW_NANOMAT_PLANT'),
	('BUILDING_FW_NANOFORGE',	            'BUILDINGCLASS_FW_NANOMAT_PLANT'),
	('BUILDING_FW_PARTICLE_ACCELERATOR', 	'BUILDINGCLASS_LABORATORY'),
	('BUILDING_FW_VERTICAL_FARM', 			'BUILDINGCLASS_GROCER'),
	('BUILDING_FW_BIOTEST_CENTER', 	        'BUILDINGCLASS_FW_GENE_LAB'),
	('BUILDING_FW_BIOFACTORY', 				'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_OCEAN_BIOHUB', 	        'BUILDINGCLASS_HARBOR'),
	('BUILDING_FW_BIOTECH_CENTER', 	    	'BUILDINGCLASS_FW_FUNGAL_AGRIGENOMICS'),
	('BUILDING_FW_BIOTECH_CENTER', 		    'BUILDINGCLASS_FW_GENE_LAB'),
	('BUILDING_FW_BIO_AUG_CLINIC', 			'BUILDINGCLASS_HOSPITAL'),
	('BUILDING_FW_NETWORK_BACKBONE', 		'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_LAUNCH_FACILITY', 		'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_GEOTHERMAL_FACTORY', 		'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_ANTIMATTER_RESEARCH', 	'BUILDINGCLASS_FW_PARTICLE_ACCELERATOR'),
	('BUILDING_FW_ANTIMATTER_RESEARCH', 	'BUILDINGCLASS_FW_NANOMAT_PLANT'),
	('BUILDING_FW_CLONE_LAB', 	            'BUILDINGCLASS_FW_GENE_LAB'),
	('BUILDING_FW_FEEDSITE_HUB', 			'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_SIMULATION_HUB', 			'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_HUMONOID_FORGE', 			'BUILDINGCLASS_FW_NANOFORGE'),
	('BUILDING_FW_TELEPRESENCE_HUB', 		'BUILDINGCLASS_FW_NETWORK_BACKBONE'),
	('BUILDING_FW_DISTRIBUTION_HUB', 		'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_METROPLEX_HUB', 			'BUILDINGCLASS_FW_SERVER_HUB'),
	('BUILDING_FW_MYCOPROTEIN_VATS', 		'BUILDINGCLASS_MEDICAL_LAB'),
	('BUILDING_FW_SOLAR_REFLECTOR', 		'BUILDINGCLASS_FW_LAUNCH_FACILITY'),
	('BUILDING_FW_TRANSGENIC_NURSERY', 		'BUILDINGCLASS_FW_FUNGAL_AGRIGENOMICS'),
	('BUILDING_FW_TRANSGENIC_NURSERY', 		'BUILDINGCLASS_FW_GENE_LAB'),
	('BUILDING_FW_BIOCOMPUTER',             'BUILDINGCLASS_FW_BIOTECH_CENTER'),
	('BUILDING_FW_TIDAL_PORT', 				'BUILDINGCLASS_SEAPORT'),
	('BUILDING_FW_DEFENSE_FIELD', 			'BUILDINGCLASS_MILITARY_BASE'),
	('BUILDING_FW_DEFENSE_FIELD', 			'BUILDINGCLASS_BOMB_SHELTER'),
	('BUILDING_FW_NANOMINES_FIELD',	        'BUILDINGCLASS_HARBOR'),
	('BUILDING_FW_DRONE_HIVE', 				'BUILDINGCLASS_FW_AUTOPLANT'),
	('BUILDING_FW_SKYRAIL_HUB', 			'BUILDINGCLASS_COALING_STATION'),	
	('BUILDING_FW_SKYRAIL_HUB', 			'BUILDINGCLASS_AIRPORT'),	
	('BUILDING_FW_LAGRANGE_COMMERCIAL', 	'BUILDINGCLASS_FW_SOLAR_REFLECTOR'),
	('BUILDING_FW_LAGRANGE_RESEARCH', 		'BUILDINGCLASS_FW_SOLAR_REFLECTOR'),
	('BUILDING_FW_LAGRANGE_INDUSTRIAL', 	'BUILDINGCLASS_FW_SOLAR_REFLECTOR'),
	('BUILDING_FW_AEROSPACE_COMPLEX', 		'BUILDINGCLASS_FW_LAUNCH_FACILITY'),
	('BUILDING_FW_AEROSPACE_COMPLEX', 		'BUILDINGCLASS_AIRPORT'),
	('BUILDING_FW_ECTOGENESIS_POD', 		'BUILDINGCLASS_FW_TRANSGENIC_NURSERY'),
	('BUILDING_FW_MASS_DIGESTER', 			'BUILDINGCLASS_FW_BIOTECH_CENTER'),
	('BUILDING_FW_BIOMOD_TANK', 			'BUILDINGCLASS_FW_FUNGAL_AGRIGENOMICS'),
	('BUILDING_FW_BIOMOD_TANK', 			'BUILDINGCLASS_FW_BIO_AUG_CLINIC'),
	('BUILDING_FW_QUANTUM_LINK', 			'BUILDINGCLASS_FW_BIOCOMPUTER'),
	('BUILDING_FW_QUANTUM_LINK', 			'BUILDINGCLASS_FW_TELEPRESENCE_HUB'),
	('BUILDING_FW_BIGBROTHER_CONTROL', 		'BUILDINGCLASS_FW_WORLD_SECURITY'),	
	('BUILDING_FW_FUSION_PLANT', 			'BUILDINGCLASS_FACTORY'),
	('BUILDING_FW_FUSION_PLANT', 			'BUILDINGCLASS_FW_ANTIMATTER_RESEARCH'),
	('BUILDING_FW_ORBITAL_MINING', 			'BUILDINGCLASS_FW_LAUNCH_FACILITY'),
	('BUILDING_FW_ORBITAL_MINING', 		    'BUILDINGCLASS_FW_AEROSPACE_COMPLEX'),
	('BUILDING_FW_ORBITAL_HABITAT', 		'BUILDINGCLASS_FW_AEROSPACE_COMPLEX'),
	('BUILDING_FW_GENETIC_EVOLUTION', 	    'BUILDINGCLASS_FW_TRANSGENIC_NURSERY'),
	('BUILDING_FW_PHOTOSYSTEMS', 			'BUILDINGCLASS_FW_BIOTECH_CENTER'),
	('BUILDING_FW_BIRTHING_PODS', 			'BUILDINGCLASS_HOSPITAL'),
	('BUILDING_FW_BIRTHING_PODS', 			'BUILDINGCLASS_FW_GENE_LAB'),
	('BUILDING_FW_AI_NETWORK', 				'BUILDINGCLASS_FW_DRONE_HIVE'),
	('BUILDING_FW_BRAIN_UPLOADING', 		'BUILDINGCLASS_FW_QUANTUM_LINK'),
	('BUILDING_FW_UTILITY_FOG', 			'BUILDINGCLASS_FW_DRONE_HIVE'),
	('BUILDING_FW_ALLOY_FOUNDRY', 			'BUILDINGCLASS_FW_FUSION_PLANT'),
	('BUILDING_FW_CENTRAL_COMMAND', 		'BUILDINGCLASS_FW_AEROSPACE_COMPLEX');

----------------------------------------------
-- Yield Changes
----------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_FW_AQUACULTURE_LAB',  	    'YIELD_CULTURE',    2),
('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF','YIELD_TOURISM', 	6),
('BUILDING_FW_SERVER_HUB',  		    'YIELD_CULTURE', 	2),
('BUILDING_FW_SERVER_HUB',  		    'YIELD_SCIENCE', 	2),
('BUILDING_FW_SERVER_HUB',  		    'YIELD_GOLD', 		2),
('BUILDING_FW_SERVER_HUB',  		    'YIELD_PRODUCTION', 2),
('BUILDING_FW_SERVER_HUB',  		    'YIELD_FAITH', 		2),
('BUILDING_FW_FUNGAL_AGRIGENOMICS',     'YIELD_SCIENCE', 	4),
('BUILDING_FW_FUNGAL_AGRIGENOMICS',     'YIELD_CULTURE', 	4),
('BUILDING_FW_GENE_LAB',  			    'YIELD_FOOD', 		3),
('BUILDING_FW_AUTOPLANT',  			    'YIELD_PRODUCTION', 3),
('BUILDING_FW_NANOMAT_PLANT',  		    'YIELD_SCIENCE',    4),
('BUILDING_FW_NANOMAT_PLANT',  		    'YIELD_PRODUCTION', 4),
('BUILDING_FW_ECOSANCTUARY',  		    'YIELD_PRODUCTION', 3),
('BUILDING_FW_CRYPTOBANK',  		    'YIELD_GOLD', 		5),
('BUILDING_FW_VR_TRAINING',  		    'YIELD_SCIENCE', 	1),
('BUILDING_FW_ENTERTAINMENT_SERVER',    'YIELD_CULTURE', 	4),
('BUILDING_FW_RESEARCH_SERVER',  	    'YIELD_SCIENCE', 	4),
('BUILDING_FW_CLOUD_COMPUTING',  	    'YIELD_PRODUCTION', 4),
('BUILDING_FW_NANOFORGE',  			    'YIELD_SCIENCE',    1),
('BUILDING_FW_PARTICLE_ACCELERATOR',    'YIELD_SCIENCE', 	3),
('BUILDING_FW_VERTICAL_FARM',  		    'YIELD_FOOD', 		6),
('BUILDING_FW_BIOTEST_CENTER',  	    'YIELD_FOOD',      -6),
('BUILDING_FW_BIOTEST_CENTER',          'YIELD_SCIENCE',    4),
('BUILDING_FW_BIOFACTORY',  		    'YIELD_FOOD', 		6),
('BUILDING_FW_OCEAN_BIOHUB',            'YIELD_FOOD', 		3),
('BUILDING_FW_OCEAN_BIOHUB',            'YIELD_SCIENCE', 	3),
('BUILDING_FW_NETWORK_BACKBONE',      	'YIELD_PRODUCTION', 2),
('BUILDING_FW_NETWORK_BACKBONE',      	'YIELD_SCIENCE', 	2),
('BUILDING_FW_NETWORK_BACKBONE',  	    'YIELD_CULTURE', 	2),
('BUILDING_FW_BIOFUEL_REFINERY_MAIZE',  'YIELD_FOOD', 	   -4),
('BUILDING_FW_BIOFUEL_REFINERY_MAIZE',  'YIELD_SCIENCE',    2),
('BUILDING_FW_BIOFUEL_REFINERY_RICE',  	'YIELD_FOOD', 	   -4),
('BUILDING_FW_BIOFUEL_REFINERY_RICE',  	'YIELD_SCIENCE',    2),
('BUILDING_FW_BIOFUEL_REFINERY_BANANA', 'YIELD_FOOD', 	   -4),
('BUILDING_FW_BIOFUEL_REFINERY_BANANA', 'YIELD_SCIENCE',    2),
('BUILDING_FW_BIOFUEL_REFINERY',  	    'YIELD_FOOD',      -4),
('BUILDING_FW_BIOFUEL_REFINERY',  	    'YIELD_SCIENCE',    2),
('BUILDING_FW_GEOTHERMAL_FACTORY',      'YIELD_PRODUCTION', 3),
('BUILDING_FW_BOREHOLE',  			    'YIELD_PRODUCTION', 6),
('BUILDING_FW_CLONE_LAB',  			    'YIELD_SCIENCE',    3),
('BUILDING_FW_FEEDSITE_HUB',  		    'YIELD_CULTURE', 	6),
('BUILDING_FW_SIMULATION_HUB',  	    'YIELD_SCIENCE', 	6),
('BUILDING_FW_BIOCONVERTER_ADNF',  	    'YIELD_SCIENCE', 	4),
('BUILDING_FW_BIOCONVERTER_NANO',  	    'YIELD_SCIENCE', 	4),
('BUILDING_FW_BIOCONVERTER_NANO2',      'YIELD_SCIENCE', 	4),
('BUILDING_FW_TELEPRESENCE_HUB',    	'YIELD_PRODUCTION', 2),
('BUILDING_FW_TELEPRESENCE_HUB',  	    'YIELD_SCIENCE', 	2),
('BUILDING_FW_TELEPRESENCE_HUB',  	    'YIELD_CULTURE', 	2),
('BUILDING_FW_DISTRIBUTION_HUB',  	    'YIELD_PRODUCTION', 6),
('BUILDING_FW_SOLAR_REFLECTOR', 	    'YIELD_PRODUCTION', 5),
('BUILDING_FW_SOLAR_REFLECTOR', 	    'YIELD_SCIENCE', 	5),
('BUILDING_FW_LAGRANGE_RESEARCH',  	    'YIELD_SCIENCE', 	4),
('BUILDING_FW_LAGRANGE_INDUSTRIAL',     'YIELD_PRODUCTION',	4),
('BUILDING_FW_TRANSGENIC_NURSERY',      'YIELD_SCIENCE', 	4),
('BUILDING_FW_BIOCOMPUTER',             'YIELD_SCIENCE',    6),
('BUILDING_FW_BIOCOMPUTER',             'YIELD_FOOD',      -6),
('BUILDING_FW_DRONE_HIVE',  		    'YIELD_PRODUCTION', 4),
('BUILDING_FW_AEROSPACE_COMPLEX',       'YIELD_CULTURE',    4),
('BUILDING_FW_MASS_DIGESTER',  		    'YIELD_FOOD', 		2),
('BUILDING_FW_QUANTUM_LINK',  		    'YIELD_SCIENCE', 	5),
('BUILDING_FW_FUSION_PLANT',  		    'YIELD_PRODUCTION', 20),
('BUILDING_FW_GENETIC_EVOLUTION',       'YIELD_SCIENCE',    4),
('BUILDING_FW_GENETIC_EVOLUTION',       'YIELD_PRODUCTION', 4),
('BUILDING_FW_AI_NETWORK',  		    'YIELD_SCIENCE', 	8),
('BUILDING_FW_UTILITY_FOG',  		    'YIELD_PRODUCTION', 6),
('BUILDING_FW_CENTRAL_COMMAND',  	    'YIELD_GOLD', 		4),
('BUILDING_FW_CENTRAL_COMMAND',  	    'YIELD_CULTURE', 	4);

--------------------------------
-- Building_YieldChange percent
--------------------------------
INSERT INTO Building_YieldFromYieldPercent
	(BuildingType, YieldIn, YieldOut, Value)
VALUES
	('BUILDING_FW_ECOSANCTUARY', 	    	'YIELD_PRODUCTION', 'YIELD_CULTURE', 	10),
	('BUILDING_FW_VERTICAL_FARM', 		    'YIELD_FOOD', 		'YIELD_SCIENCE', 	10),
	('BUILDING_FW_BIOFACTORY', 			    'YIELD_PRODUCTION', 'YIELD_FOOD', 	 	10),
	('BUILDING_FW_BOREHOLE', 			    'YIELD_PRODUCTION', 'YIELD_GOLD',	 	10),
	('BUILDING_FW_NETWORK_BACKBONE', 		'YIELD_PRODUCTION', 'YIELD_GOLD',	 	5),
	('BUILDING_FW_NETWORK_BACKBONE', 		'YIELD_PRODUCTION', 'YIELD_TOURISM',	5),
	('BUILDING_FW_GEOTHERMAL_FACTORY',   	'YIELD_PRODUCTION', 'YIELD_GOLD',	 	5),
	('BUILDING_FW_GEOTHERMAL_FACTORY',  	'YIELD_PRODUCTION', 'YIELD_PRODUCTION',	5),
	('BUILDING_FW_OCEAN_BIOHUB',            'YIELD_PRODUCTION', 'YIELD_FOOD', 	 	5),
	('BUILDING_FW_OCEAN_BIOHUB',            'YIELD_PRODUCTION', 'YIELD_SCIENCE', 	5);


INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield) VALUES
('BUILDING_FW_AUTOPLANT',  				'YIELD_PRODUCTION', 20), -- 1/5 pop
('BUILDING_FW_VIRTUAL_MUSEUM', 			'YIELD_CULTURE', 	25),
('BUILDING_FW_VIRTUAL_MUSEUM', 			'YIELD_TOURISM', 	25),
('BUILDING_FW_CRYPTOBANK',  			'YIELD_GOLD', 		20),
('BUILDING_FW_PARTICLE_ACCELERATOR',  	'YIELD_SCIENCE', 	20),
('BUILDING_FW_COMMERCE_SERVER', 		'YIELD_GOLD', 		50),
('BUILDING_FW_ENTERTAINMENT_SERVER', 	'YIELD_CULTURE', 	50),
('BUILDING_FW_CLOUD_COMPUTING', 		'YIELD_PRODUCTION', 50),
('BUILDING_FW_RESEARCH_SERVER', 		'YIELD_SCIENCE',	50),
('BUILDING_FW_BIO_AUG_CLINIC',  		'YIELD_FOOD',   	10),
('BUILDING_FW_BIO_AUG_CLINIC',  		'YIELD_FAITH', 		10),
('BUILDING_FW_LAUNCH_FACILITY',  		'YIELD_SCIENCE',	10),
('BUILDING_FW_LAUNCH_FACILITY',  		'YIELD_GOLD',       10),

('BUILDING_FW_HUMONOID_FORGE',  		'YIELD_PRODUCTION', 10),
('BUILDING_FW_HUMONOID_FORGE',  		'YIELD_CULTURE',	10),
('BUILDING_FW_MYCOPROTEIN_VATS', 		'YIELD_FOOD', 		25),
('BUILDING_FW_LAGRANGE_COMMERCIAL',  	'YIELD_GOLD', 		25),
('BUILDING_FW_LAGRANGE_RESEARCH',  		'YIELD_SCIENCE', 	25),
('BUILDING_FW_LAGRANGE_INDUSTRIAL',  	'YIELD_PRODUCTION', 25),
('BUILDING_FW_MASS_DIGESTER', 			'YIELD_FOOD',		50),
('BUILDING_FW_ORBITAL_MINING', 			'YIELD_SCIENCE', 	10),
('BUILDING_FW_ORBITAL_MINING', 			'YIELD_PRODUCTION', 10),
('BUILDING_FW_ORBITAL_MINING', 			'YIELD_GOLD', 		10),
('BUILDING_FW_BRAIN_UPLOADING', 		'YIELD_GOLD', 		100),
('BUILDING_FW_BRAIN_UPLOADING', 		'YIELD_FAITH', 		100),
('BUILDING_FW_BRAIN_UPLOADING', 		'YIELD_SCIENCE', 	100),
('BUILDING_FW_BRAIN_UPLOADING', 		'YIELD_CULTURE', 	100),
('BUILDING_FW_BRAIN_UPLOADING', 		'YIELD_PRODUCTION', 100);


INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_FW_GENE_LAB',             'BUILDINGCLASS_FW_GENE_LAB',             'YIELD_FOOD',       2),
	('BUILDING_FW_AUTOPLANT',            'BUILDINGCLASS_FW_AUTOPLANT',            'YIELD_PRODUCTION', 2),
	('BUILDING_FW_PARTICLE_ACCELERATOR', 'BUILDINGCLASS_FW_PARTICLE_ACCELERATOR', 'YIELD_SCIENCE',    2),
	('BUILDING_FW_CRYPTOBANK',           'BUILDINGCLASS_FW_CRYPTOBANK',           'YIELD_GOLD',       2),
	('BUILDING_FW_VIRTUAL_MUSEUM',       'BUILDINGCLASS_FW_VIRTUAL_MUSEUM',       'YIELD_CULTURE',    2),
	('BUILDING_FW_VERTICAL_FARM',        'BUILDINGCLASS_FW_VERTICAL_FARM',        'YIELD_SCIENCE',    2),
	('BUILDING_FW_ECOSANCTUARY',         'BUILDINGCLASS_FW_ECOSANCTUARY',         'YIELD_CULTURE',    2),
	('BUILDING_FW_BIOFACTORY',           'BUILDINGCLASS_FW_BIOFACTORY',           'YIELD_FOOD',       2),
	('BUILDING_FW_BIOFACTORY',           'BUILDINGCLASS_FW_OCEAN_BIOHUB',         'YIELD_SCIENCE',    2),
	('BUILDING_FW_OCEAN_BIOHUB',         'BUILDINGCLASS_FW_BIOFACTORY',           'YIELD_FOOD',       2),
	('BUILDING_FW_OCEAN_BIOHUB',         'BUILDINGCLASS_FW_OCEAN_BIOHUB',         'YIELD_SCIENCE',    2),
	('BUILDING_FW_BOREHOLE', 	         'BUILDINGCLASS_FW_BOREHOLE',             'YIELD_GOLD',       2),
	('BUILDING_FW_BOREHOLE',             'BUILDINGCLASS_FW_GEOTHERMAL_FACTORY',   'YIELD_PRODUCTION', 2),
	('BUILDING_FW_GEOTHERMAL_FACTORY', 	 'BUILDINGCLASS_FW_BOREHOLE',             'YIELD_GOLD',       2),
	('BUILDING_FW_GEOTHERMAL_FACTORY',   'BUILDINGCLASS_FW_GEOTHERMAL_FACTORY',   'YIELD_PRODUCTION', 2),
	('BUILDING_FW_BIO_AUG_CLINIC',       'BUILDINGCLASS_FW_VR_TRAINING',          'YIELD_PRODUCTION', 2),
	('BUILDING_FW_LAUNCH_FACILITY',      'BUILDINGCLASS_SPACESHIP_FACTORY',       'YIELD_PRODUCTION', 2),
	('BUILDING_FW_NETWORK_BACKBONE',     'BUILDINGCLASS_FW_RESEARCH_SERVER',      'YIELD_SCIENCE',    2),
	('BUILDING_FW_NETWORK_BACKBONE',     'BUILDINGCLASS_FW_ENTERTAINMENT_SERVER', 'YIELD_CULTURE',    2),
	('BUILDING_FW_NETWORK_BACKBONE',     'BUILDINGCLASS_FW_COMMERCE_SERVER',      'YIELD_GOLD',       2),
	('BUILDING_FW_NETWORK_BACKBONE',     'BUILDINGCLASS_FW_CLOUD_COMPUTING',      'YIELD_PRODUCTION', 2),
	('BUILDING_FW_HUMONOID_FORGE',       'BUILDINGCLASS_FW_NANOFORGE',            'YIELD_PRODUCTION', 2),
	('BUILDING_FW_FEEDSITE_HUB',         'BUILDINGCLASS_FW_TELEPRESENCE_HUB',     'YIELD_CULTURE',    1),
	('BUILDING_FW_SIMULATION_HUB',       'BUILDINGCLASS_FW_TELEPRESENCE_HUB',     'YIELD_SCIENCE',    1),
	('BUILDING_FW_DISTRIBUTION_HUB',     'BUILDINGCLASS_FW_TELEPRESENCE_HUB',     'YIELD_PRODUCTION', 1),
	('BUILDING_FW_METROPLEX_HUB',        'BUILDINGCLASS_FW_TELEPRESENCE_HUB',     'YIELD_GOLD',       1),
	('BUILDING_FW_BIOCOMPUTER',          'BUILDINGCLASS_FW_BIOCOMPUTER',          'YIELD_SCIENCE',    5),
	('BUILDING_FW_QUANTUM_LINK',         'BUILDINGCLASS_FW_TELEPRESENCE_HUB',     'YIELD_PRODUCTION', 1),
	('BUILDING_FW_QUANTUM_LINK',         'BUILDINGCLASS_FW_TELEPRESENCE_HUB',     'YIELD_SCIENCE',    1),
	('BUILDING_FW_QUANTUM_LINK',         'BUILDINGCLASS_FW_TELEPRESENCE_HUB',     'YIELD_CULTURE',    1),
	('BUILDING_FW_QUANTUM_LINK',         'BUILDINGCLASS_FW_BIOCOMPUTER',          'YIELD_SCIENCE',    4),
	('BUILDING_FW_ORBITAL_HABITAT',      'BUILDINGCLASS_FW_LAGRANGE_INDUSTRIAL',  'YIELD_PRODUCTION', 2),
	('BUILDING_FW_ORBITAL_HABITAT',      'BUILDINGCLASS_FW_LAGRANGE_RESEARCH',    'YIELD_SCIENCE',    2),
	('BUILDING_FW_ORBITAL_HABITAT',      'BUILDINGCLASS_FW_LAGRANGE_COMMERCIAL',   'YIELD_GOLD',      2),
	('BUILDING_FW_SOLAR_REFLECTOR',      'BUILDINGCLASS_FW_ORBITAL_HABITAT',      'YIELD_FOOD',       2),
	('BUILDING_FW_GENOME_PROJECT_1',     'BUILDINGCLASS_LABORATORY',              'YIELD_SCIENCE',    2),
	('BUILDING_FW_GENOME_PROJECT_1',     'BUILDINGCLASS_MEDICAL_LAB',             'YIELD_FOOD',       3),
	('BUILDING_FW_GENOME_PROJECT_2',     'BUILDINGCLASS_FW_GENE_LAB',             'YIELD_SCIENCE',    2),
	('BUILDING_FW_GENOME_PROJECT_2',     'BUILDINGCLASS_FW_GENE_LAB',             'YIELD_SCIENCE',    2),
	('BUILDING_FW_AI_DATANETWORK_1',     'BUILDINGCLASS_FW_SERVER_HUB',           'YIELD_SCIENCE',    1),
	('BUILDING_FW_AI_DATANETWORK_1',     'BUILDINGCLASS_FW_SERVER_HUB',           'YIELD_PRODUCTION', 1),
	('BUILDING_FW_AI_DATANETWORK_1',     'BUILDINGCLASS_FW_SERVER_HUB',           'YIELD_CULTURE',    1),
	('BUILDING_FW_AI_DATANETWORK_1',     'BUILDINGCLASS_FW_SERVER_HUB',           'YIELD_FAITH',      1),
	('BUILDING_FW_AI_DATANETWORK_1',     'BUILDINGCLASS_FW_SERVER_HUB',           'YIELD_GOLD',       1),
	('BUILDING_FW_AI_DATANETWORK_2',     'BUILDINGCLASS_FW_NETWORK_BACKBONE',     'YIELD_SCIENCE',    2),
	('BUILDING_FW_AI_DATANETWORK_2',     'BUILDINGCLASS_FW_NETWORK_BACKBONE',     'YIELD_CULTURE',    2),
	('BUILDING_FW_AI_DATANETWORK_2',     'BUILDINGCLASS_FW_NETWORK_BACKBONE',     'YIELD_GOLD',       2);




INSERT INTO Building_SpecificGreatPersonRateModifier (BuildingType, SpecialistType, Modifier) VALUES
('BUILDING_FW_RESEARCH_SERVER',      'SPECIALIST_SCIENTIST',    15),
('BUILDING_FW_COMMERCE_SERVER',      'SPECIALIST_MERCHANT',     15),
('BUILDING_FW_CLOUD_COMPUTING',      'SPECIALIST_ENGINEER',     15),
('BUILDING_FW_ENTERTAINMENT_SERVER', 'SPECIALIST_ARTIST',       15),
('BUILDING_FW_ENTERTAINMENT_SERVER', 'SPECIALIST_WRITER',       15),
('BUILDING_FW_ENTERTAINMENT_SERVER', 'SPECIALIST_MUSICIAN',     15),
('BUILDING_FW_VIRTUAL_MUSEUM',       'SPECIALIST_ARTIST',       15),
('BUILDING_FW_QUANTUM_LINK',         'SPECIALIST_SCIENTIST',    25);


INSERT INTO Corporation_BuildingClassYieldChanges (CorporationType, BuildingClassType, YieldType, YieldChange) VALUES
('CORPORATION_TRADER_SIDS',        'BUILDINGCLASS_FW_CRYPTOBANK', 			    'YIELD_GOLD', 			    3),
('CORPORATION_TRADER_SIDS',        'BUILDINGCLASS_FW_METROPLEX_HUB', 			'YIELD_GOLD', 			    3),
('CORPORATION_LANDSEA_EXTRACTORS', 'BUILDINGCLASS_FW_UNDERSEA_MINING', 			'YIELD_PRODUCTION', 		2),
('CORPORATION_LANDSEA_EXTRACTORS', 'BUILDINGCLASS_FW_TIDAL_PORT', 			    'YIELD_PRODUCTION', 		2),
('CORPORATION_HEXXON_REFINERY',    'BUILDINGCLASS_FW_NANOMAT_PLANT', 			'YIELD_PRODUCTION', 		3),
('CORPORATION_HEXXON_REFINERY',    'BUILDINGCLASS_FW_FUSION_PLANT', 			'YIELD_PRODUCTION', 		3),
('CORPORATION_GIORGIO_ARMEIER',    'BUILDINGCLASS_FW_VIRTUAL_MUSEUM', 			'YIELD_CULTURE', 			2),
('CORPORATION_GIORGIO_ARMEIER',    'BUILDINGCLASS_FW_FEEDSITE_HUB', 			'YIELD_CULTURE', 			2),
('CORPORATION_FIRAXITE_MATERIALS', 'BUILDINGCLASS_FW_PARTICLE_ACCELERATOR', 	'YIELD_SCIENCE', 			3),
('CORPORATION_FIRAXITE_MATERIALS', 'BUILDINGCLASS_FW_ANTIMATTER_RESEARCH',   	'YIELD_SCIENCE', 			3),
('CORPORATION_TWOKAY_FOODS', 	   'BUILDINGCLASS_FW_AQUACULTURE_LAB', 		    'YIELD_FOOD', 				3),
('CORPORATION_TWOKAY_FOODS', 	   'BUILDINGCLASS_FW_MYCOPROTEIN_VATS', 	    'YIELD_FOOD', 				3),
('CORPORATION_CIVILIZED_JEWELERS', 'BUILDINGCLASS_FW_SEAWATER_ARTIFICIAL_REEF', 'YIELD_GOLDEN_AGE_POINTS', 	4),
('CORPORATION_CIVILIZED_JEWELERS', 'BUILDINGCLASS_FW_SKYRAIL_HUB',              'YIELD_GOLDEN_AGE_POINTS', 	4);


INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_FW_METROPLEX_HUB', 		'SPECIALIST_MERCHANT',  'YIELD_GOLD',		1),
	('BUILDING_FW_DISTRIBUTION_HUB', 	'SPECIALIST_ENGINEER', 	'YIELD_PRODUCTION',	1),
	('BUILDING_FW_SIMULATION_HUB', 		'SPECIALIST_SCIENTIST', 'YIELD_SCIENCE',	1),
	('BUILDING_FW_FEEDSITE_HUB', 		'SPECIALIST_WRITER', 	'YIELD_CULTURE',	1),
	('BUILDING_FW_FEEDSITE_HUB', 		'SPECIALIST_MUSICIAN', 	'YIELD_CULTURE',	1),
	('BUILDING_FW_FEEDSITE_HUB', 		'SPECIALIST_ARTIST', 	'YIELD_CULTURE',	1),
	('BUILDING_FW_LAGRANGE_RESEARCH', 	'SPECIALIST_SCIENTIST', 'YIELD_SCIENCE',	3),
	('BUILDING_FW_LAGRANGE_INDUSTRIAL', 'SPECIALIST_ENGINEER', 	'YIELD_PRODUCTION',	3),
	('BUILDING_FW_LAGRANGE_COMMERCIAL', 'SPECIALIST_MERCHANT', 	'YIELD_GOLD',		3),
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


--------------------------------
-- Building_HurryModifiersLocal
--------------------------------
INSERT INTO Building_HurryModifiersLocal
	(BuildingType, HurryType, HurryCostModifier)
VALUES
	('BUILDING_FW_CRYPTOBANK', 		'HURRY_GOLD', -15),
	('BUILDING_FW_METROPLEX_HUB', 	'HURRY_GOLD', -15);

--========================================================================================================================================================
-- Terrain & feature
--======================================================================================
INSERT INTO Building_TerrainYieldChanges
	(BuildingType, 							 TerrainType, 		YieldType, 			Yield)
VALUES
	('BUILDING_FW_AQUACULTURE_LAB', 		 'TERRAIN_COAST', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_AQUACULTURE_LAB', 		 'TERRAIN_OCEAN', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'TERRAIN_COAST', 	'YIELD_CULTURE', 	1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'TERRAIN_COAST', 	'YIELD_SCIENCE', 	1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'TERRAIN_OCEAN', 	'YIELD_CULTURE', 	1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'TERRAIN_OCEAN', 	'YIELD_SCIENCE', 	1),
	('BUILDING_FW_UNDERSEA_MINING', 		 'TERRAIN_COAST', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_UNDERSEA_MINING', 		 'TERRAIN_COAST', 	'YIELD_GOLD', 		1),
	('BUILDING_FW_UNDERSEA_MINING', 		 'TERRAIN_OCEAN', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_UNDERSEA_MINING', 		 'TERRAIN_OCEAN', 	'YIELD_GOLD', 		1),
	('BUILDING_FW_BIOFACTORY', 				 'TERRAIN_GRASS', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_BIOFACTORY', 				 'TERRAIN_PLAINS', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_OCEAN_BIOHUB', 	         'TERRAIN_COAST', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_OCEAN_BIOHUB', 	         'TERRAIN_OCEAN', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_BIOTECH_CENTER', 		     'TERRAIN_GRASS', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_BIOTECH_CENTER', 		     'TERRAIN_PLAINS', 	'YIELD_GOLD', 		1),
	('BUILDING_FW_BIOTECH_CENTER', 		     'TERRAIN_TUNDRA', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_BIOTECH_CENTER', 		     'TERRAIN_SNOW', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_BIOTECH_CENTER', 	    	 'TERRAIN_DESERT', 	'YIELD_PRODUCTION', 1),
	('BUILDING_FW_ANTIMATTER_RESEARCH', 	 'TERRAIN_TUNDRA', 	'YIELD_GOLD',       1),
	('BUILDING_FW_ANTIMATTER_RESEARCH',      'TERRAIN_SNOW', 	'YIELD_GOLD',       1),
	('BUILDING_FW_ANTIMATTER_RESEARCH', 	 'TERRAIN_DESERT', 	'YIELD_GOLD',       1),
	('BUILDING_FW_MASS_DIGESTER', 		 	 'TERRAIN_GRASS', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_MASS_DIGESTER', 		 	 'TERRAIN_PLAINS', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_MASS_DIGESTER', 		 	 'TERRAIN_TUNDRA', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_MASS_DIGESTER', 		 	 'TERRAIN_SNOW', 	'YIELD_FOOD', 		1),
	('BUILDING_FW_MASS_DIGESTER', 		 	 'TERRAIN_DESERT', 	'YIELD_FOOD', 		1);


--------------------------------
-- Building_Terrain yield etc
--------------------------------
INSERT INTO Building_YieldPerXTerrainTimes100
	(BuildingType, TerrainType, YieldType, Yield)
VALUES 
	('BUILDING_FW_GEOTHERMAL_FACTORY', 'TERRAIN_MOUNTAIN',	'YIELD_PRODUCTION', 100),
	('BUILDING_FW_GEOTHERMAL_FACTORY', 'TERRAIN_MOUNTAIN',	'YIELD_GOLD', 		100),	
	('BUILDING_FW_ANTIMATTER_RESEARCH','TERRAIN_MOUNTAIN',	'YIELD_SCIENCE',	100);		

INSERT INTO 
	Building_SeaResourceYieldChanges (BuildingType,	YieldType,	Yield) 
VALUES
	('BUILDING_FW_AQUACULTURE_LAB', 'YIELD_GOLD',       1),
	('BUILDING_FW_AQUACULTURE_LAB', 'YIELD_FOOD',       1),
	('BUILDING_FW_TIDAL_PORT',      'YIELD_PRODUCTION', 1),
	('BUILDING_FW_TIDAL_PORT',      'YIELD_GOLD',       2);

INSERT INTO Building_PlotYieldChanges 
	(BuildingType,							PlotType,			YieldType,			Yield) 
VALUES		
	('BUILDING_FW_GEOTHERMAL_FACTORY',		'PLOT_HILLS',		'YIELD_PRODUCTION',	1),
	('BUILDING_FW_ANTIMATTER_RESEARCH',		'PLOT_HILLS',		'YIELD_SCIENCE',	1);

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_FW_PHOTOSYSTEMS', 		    'FEATURE_FOREST', 'YIELD_FOOD',       1),
	('BUILDING_FW_PHOTOSYSTEMS', 		    'FEATURE_MARSH',  'YIELD_FOOD',       1),
	('BUILDING_FW_PHOTOSYSTEMS', 		    'FEATURE_MARSH',  'YIELD_PRODUCTION', 1),
	('BUILDING_FW_PHOTOSYSTEMS', 		    'FEATURE_JUNGLE', 'YIELD_PRODUCTION', 1);

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
-- Building Resource
----------------------------------------------
INSERT INTO Building_ResourcePlotsToPlace
		(BuildingType,						ResourceType,			NumPlots, ResourceQuantityToPlace) 
VALUES	('BUILDING_FW_AQUACULTURE_LAB',		'RESOURCE_FISH',		1		, 1),
		('BUILDING_FW_FUNGAL_AGRIGENOMICS',	'RESOURCE_XENO_FUNGUS',	1		, 5),
		('BUILDING_FW_BIOTECH_CENTER',	    'RESOURCE_XENO_FUNGUS',	1		, 2),
		('BUILDING_FW_PHOTOSYSTEMS',		'RESOURCE_XENO_FUNGUS',	1		, 4);

INSERT INTO Building_ResourceQuantity
    (BuildingType, ResourceType, Quantity) 
VALUES
    ('BUILDING_FW_NANOMAT_PLANT',          'RESOURCE_NANOMAT',     5),
    ('BUILDING_FW_CONVERTER',              'RESOURCE_NANOMAT',     4),
    ('BUILDING_FW_CONVERTER_OIL',          'RESOURCE_NANOMAT',     4),
    ('BUILDING_FW_CONVERTER_IRON',         'RESOURCE_NANOMAT',     4),
    ('BUILDING_FW_BIOTEST_CENTER',         'RESOURCE_XENO_FUNGUS',  4),
    ('BUILDING_FW_BIOFUEL_REFINERY',       'RESOURCE_OIL',         4),
    ('BUILDING_FW_BIOFUEL_REFINERY_RICE',  'RESOURCE_OIL',         4),
    ('BUILDING_FW_BIOFUEL_REFINERY_BANANA','RESOURCE_OIL',         4),
    ('BUILDING_FW_BIOFUEL_REFINERY_MAIZE', 'RESOURCE_OIL',         4),
    ('BUILDING_FW_ANTIMATTER_RESEARCH',    'RESOURCE_NANOMAT',     2),
    ('BUILDING_FW_CLONE_LAB',              'RESOURCE_XENO_FUNGUS',  1),
    ('BUILDING_FW_BIOCONVERTER_ADNF',      'RESOURCE_XENO_FUNGUS',  5),
    ('BUILDING_FW_BIOCONVERTER_NANO',      'RESOURCE_NANOMAT',     4),
    ('BUILDING_FW_BIOCONVERTER_NANO2',     'RESOURCE_NANOMAT',     2),
    ('BUILDING_FW_METAMATERIALS_CENTER',   'RESOURCE_URANIUM',     2),
    ('BUILDING_FW_METAMATERIALS_CENTER',   'RESOURCE_NANOMAT',     1),
	('BUILDING_FW_ORBITAL_MINING',         'RESOURCE_IRON',        2),
    ('BUILDING_FW_ORBITAL_MINING',         'RESOURCE_NANOMAT',     2),
    ('BUILDING_FW_GENETIC_EVOLUTION',      'RESOURCE_XENO_FUNGUS',  3),
    ('BUILDING_FW_ALLOY_FOUNDRY',          'RESOURCE_NANOMAT',     8),
    ('BUILDING_FW_UTILITY_FOG',            'RESOURCE_NANOMAT',     3),
    ('BUILDING_FW_CENTRAL_COMMAND',        'RESOURCE_NANOMAT',     3),
	('BUILDING_FW_DEEP_RESOURCE_2', 	   'RESOURCE_ALUMINUM',    4),
	('BUILDING_FW_DEEP_RESOURCE_2', 	   'RESOURCE_NANOMAT', 	   3),
	('BUILDING_FW_DEEP_RESOURCE_2', 	   'RESOURCE_URANIUM', 	   1),
	('BUILDING_FW_DEEP_RESOURCE_1', 	   'RESOURCE_COAL',        3),
	('BUILDING_FW_DEEP_RESOURCE_1', 	   'RESOURCE_IRON', 	   6),
	('BUILDING_FW_DEEP_RESOURCE_1', 	   'RESOURCE_NANOMAT', 	   1);


INSERT INTO Building_ResourceQuantityRequirements
    (BuildingType,                   ResourceType,       Cost)
VALUES
    ('BUILDING_FW_GENE_LAB',          'RESOURCE_HORSE',      1),
    ('BUILDING_FW_AUTOPLANT',         'RESOURCE_OIL',        1),
    ('BUILDING_FW_CONVERTER',         'RESOURCE_COAL',       1),
    ('BUILDING_FW_CONVERTER_OIL',     'RESOURCE_OIL',        1),
    ('BUILDING_FW_CONVERTER_IRON',    'RESOURCE_IRON',       1),
    ('BUILDING_FW_NANOFORGE',         'RESOURCE_NANOMAT',    1),
    ('BUILDING_FW_BIOTEST_CENTER' ,   'RESOURCE_HORSE',      3),
    ('BUILDING_FW_BIOCONVERTER_ADNF', 'RESOURCE_ALUMINUM',   1),
    ('BUILDING_FW_BIOCONVERTER_ADNF', 'RESOURCE_NANOMAT',    5),
    ('BUILDING_FW_BIOCONVERTER_NANO', 'RESOURCE_OIL',        1),
    ('BUILDING_FW_BIOCONVERTER_NANO', 'RESOURCE_XENO_FUNGUS', 5),
    ('BUILDING_FW_BIOCONVERTER_NANO2','RESOURCE_COAL',       1),
    ('BUILDING_FW_BIOCONVERTER_NANO2','RESOURCE_XENO_FUNGUS', 4),
    ('BUILDING_FW_BIOCOMPUTER',       'RESOURCE_XENO_FUNGUS', 1),
    ('BUILDING_FW_BIOCOMPUTER',       'RESOURCE_ALUMINUM',   1),
    ('BUILDING_FW_BIOCOMPUTER',       'RESOURCE_NANOMAT',    1),
    ('BUILDING_FW_TIDAL_PORT',        'RESOURCE_NANOMAT',    1),
	('BUILDING_FW_DEFENSE_FIELD',     'RESOURCE_NANOMAT',    1),
	('BUILDING_FW_NANOMINES_FIELD',   'RESOURCE_NANOMAT',    1),
    ('BUILDING_FW_SKYRAIL_HUB',       'RESOURCE_NANOMAT',    1),
    ('BUILDING_FW_ECTOGENESIS_POD',   'RESOURCE_XENO_FUNGUS', 1),
    ('BUILDING_FW_BIOMOD_TANK',       'RESOURCE_XENO_FUNGUS', 1),
    ('BUILDING_FW_MASS_DIGESTER',     'RESOURCE_XENO_FUNGUS', 1),
    ('BUILDING_FW_QUANTUM_LINK',      'RESOURCE_NANOMAT',    1),
    ('BUILDING_FW_FUSION_PLANT',      'RESOURCE_URANIUM',    1),
	('BUILDING_FW_FUSION_PLANT',      'RESOURCE_NANOMAT',    1),
	('BUILDING_FW_BRAIN_UPLOADING',   'RESOURCE_NANOMAT',    1),
    ('BUILDING_FW_ALLOY_FOUNDRY',     'RESOURCE_ALUMINUM',   1),
    ('BUILDING_FW_ALLOY_FOUNDRY',     'RESOURCE_URANIUM',    1);

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
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'RESOURCE_CRAB',     'YIELD_SCIENCE',    1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'RESOURCE_CRAB',     'YIELD_GOLD',       1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'RESOURCE_PEARLS',   'YIELD_GOLD',       1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'RESOURCE_PEARLS',   'YIELD_CULTURE',    1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'RESOURCE_CORAL',    'YIELD_SCIENCE',    1),
	('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'RESOURCE_CORAL',    'YIELD_CULTURE',    1),
	('BUILDING_FW_UNDERSEA_MINING',          'RESOURCE_NANOMAT',  'YIELD_PRODUCTION', 1),
	('BUILDING_FW_UNDERSEA_MINING',          'RESOURCE_NANOMAT',  'YIELD_GOLD',       1),
	('BUILDING_FW_UNDERSEA_MINING',          'RESOURCE_NANOMAT',  'YIELD_SCIENCE',    1),
	('BUILDING_FW_UNDERSEA_MINING',          'RESOURCE_OIL',      'YIELD_PRODUCTION', 1),
	('BUILDING_FW_UNDERSEA_MINING',          'RESOURCE_OIL',      'YIELD_GOLD',       1),
	('BUILDING_FW_UNDERSEA_MINING',          'RESOURCE_OIL',      'YIELD_SCIENCE',    1),
	('BUILDING_FW_UNDERSEA_MINING',          'RESOURCE_WHALE',    'YIELD_PRODUCTION', 1),
	('BUILDING_FW_UNDERSEA_MINING',          'RESOURCE_WHALE',    'YIELD_GOLD',       1),
	('BUILDING_FW_UNDERSEA_MINING',          'RESOURCE_WHALE',    'YIELD_SCIENCE',    1),
	('BUILDING_FW_GENE_LAB',                 'RESOURCE_COW',      'YIELD_FOOD',       2),
	('BUILDING_FW_GENE_LAB',                 'RESOURCE_DEER',     'YIELD_FOOD',       2),
	('BUILDING_FW_GENE_LAB',                 'RESOURCE_HORSE',    'YIELD_FOOD',       2),
	('BUILDING_FW_GENE_LAB',                 'RESOURCE_SHEEP',    'YIELD_FOOD',       2),
	('BUILDING_FW_GENE_LAB',                 'RESOURCE_BISON',    'YIELD_FOOD',       2),
	('BUILDING_FW_NANOMAT_PLANT',            'RESOURCE_COAL',     'YIELD_PRODUCTION', 2),
	('BUILDING_FW_NANOMAT_PLANT',            'RESOURCE_OIL',      'YIELD_PRODUCTION', 2),
	('BUILDING_FW_NANOMAT_PLANT',            'RESOURCE_IRON',     'YIELD_PRODUCTION', 2),
	('BUILDING_FW_NANOMAT_PLANT',            'RESOURCE_NANOMAT',  'YIELD_PRODUCTION', 2),
	('BUILDING_FW_CONVERTER',                'RESOURCE_COAL',     'YIELD_GOLD',       2),
	('BUILDING_FW_CONVERTER_OIL',            'RESOURCE_OIL',      'YIELD_GOLD',       2),
	('BUILDING_FW_CONVERTER_IRON',           'RESOURCE_IRON',     'YIELD_GOLD',       2),
	('BUILDING_FW_BIOTEST_CENTER',           'RESOURCE_COW',      'YIELD_GOLD',       2),
	('BUILDING_FW_BIOTEST_CENTER',           'RESOURCE_DEER',     'YIELD_GOLD',       2),
	('BUILDING_FW_BIOTEST_CENTER',           'RESOURCE_HORSE',    'YIELD_GOLD',       2),
	('BUILDING_FW_BIOTEST_CENTER',           'RESOURCE_SHEEP',    'YIELD_GOLD',       2),
	('BUILDING_FW_BIOTEST_CENTER',           'RESOURCE_BISON',    'YIELD_GOLD',       2),
	('BUILDING_FW_BIOFUEL_REFINERY', 	     'RESOURCE_WHEAT', 	  'YIELD_GOLD',       2),
	('BUILDING_FW_BIOFUEL_REFINERY_RICE',    'RESOURCE_RICE', 	  'YIELD_GOLD',       2),
	('BUILDING_FW_BIOFUEL_REFINERY_MAIZE',   'RESOURCE_MAIZE', 	  'YIELD_GOLD',       2),
	('BUILDING_FW_BIOFUEL_REFINERY_BANANA',  'RESOURCE_BANANA',   'YIELD_GOLD',       2),
	('BUILDING_FW_ALLOY_FOUNDRY',            'RESOURCE_ALUMINUM', 'YIELD_PRODUCTION', 4),
	('BUILDING_FW_ALLOY_FOUNDRY',            'RESOURCE_ALUMINUM', 'YIELD_GOLD',       2),
	('BUILDING_FW_ALLOY_FOUNDRY',            'RESOURCE_URANIUM',  'YIELD_PRODUCTION', 4),
	('BUILDING_FW_ALLOY_FOUNDRY',            'RESOURCE_URANIUM',  'YIELD_GOLD',       2);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, 						ImprovementType, 						YieldType, 		Yield)
VALUES
	('BUILDING_FW_CRYPTOBANK', 			 'IMPROVEMENT_TRADING_POST',   			    'YIELD_GOLD', 		2),
	('BUILDING_FW_VR_TRAINING',          'IMPROVEMENT_FW_COMM_ARRAY',               'YIELD_PRODUCTION', 2), 
	('BUILDING_FW_NANOFORGE', 			 'IMPROVEMENT_FW_INDUSTRIAL_COMPLEX',       'YIELD_GOLD', 		2),
	('BUILDING_FW_PARTICLE_ACCELERATOR', 'IMPROVEMENT_FW_HERC', 				    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_ECOSANCTUARY', 		 'IMPROVEMENT_FW_PRESERVE', 			    'YIELD_PRODUCTION', 2),
	('BUILDING_FW_ECOSANCTUARY', 		 'IMPROVEMENT_FW_BIOWELL', 				    'YIELD_PRODUCTION', 2),
	('BUILDING_FW_ECOSANCTUARY', 		 'IMPROVEMENT_BRAZILWOOD_CAMP', 		    'YIELD_PRODUCTION', 2),
	('BUILDING_FW_ECOSANCTUARY', 		 'IMPROVEMENT_LUMBERMILL', 				    'YIELD_PRODUCTION', 2),
	('BUILDING_FW_ECOSANCTUARY', 		 'IMPROVEMENT_CAMP', 					    'YIELD_PRODUCTION', 2),
	('BUILDING_FW_VERTICAL_FARM', 		 'IMPROVEMENT_FARM', 					    'YIELD_FOOD', 		2),
	('BUILDING_FW_VERTICAL_FARM', 		 'IMPROVEMENT_FW_HYDROPONICS_DOME', 	    'YIELD_FOOD', 		2),
	('BUILDING_FW_VERTICAL_FARM', 		 'IMPROVEMENT_TERRACE_FARM', 			    'YIELD_FOOD', 		2),
	('BUILDING_FW_VERTICAL_FARM', 		 'IMPROVEMENT_PLANTATION', 				    'YIELD_FOOD', 		2),
	('BUILDING_FW_VERTICAL_FARM', 		 'IMPROVEMENT_POLDER', 					    'YIELD_FOOD', 		2),
	('BUILDING_FW_NETWORK_BACKBONE', 	 'IMPROVEMENT_MOAI',                        'YIELD_GOLD',       2), 
	('BUILDING_FW_NETWORK_BACKBONE', 	 'IMPROVEMENT_KUNA',                        'YIELD_GOLD',       2), 
	('BUILDING_FW_NETWORK_BACKBONE', 	 'IMPROVEMENT_KASBAH',                      'YIELD_GOLD',       2), 
	('BUILDING_FW_NETWORK_BACKBONE', 	 'IMPROVEMENT_FEITORIA',                    'YIELD_GOLD',       2), 
	('BUILDING_FW_NETWORK_BACKBONE', 	 'IMPROVEMENT_SPAIN_HACIENDA',              'YIELD_GOLD',       2), 
	('BUILDING_FW_NETWORK_BACKBONE',     'IMPROVEMENT_SIHEYUAN',                    'YIELD_GOLD',       2), 
	('BUILDING_FW_NETWORK_BACKBONE',     'IMPROVEMENT_MONGOLIA_ORDO',               'YIELD_GOLD',       2), 
	('BUILDING_FW_NETWORK_BACKBONE',     'IMPROVEMENT_CHATEAU',                     'YIELD_GOLD',       2), 
	('BUILDING_FW_NETWORK_BACKBONE',     'IMPROVEMENT_TRADING_POST',                'YIELD_GOLD',       2), 
	('BUILDING_FW_NETWORK_BACKBONE',     'IMPROVEMENT_FW_GENERATOR',                'YIELD_GOLD',       2), 
	('BUILDING_FW_NETWORK_BACKBONE',     'IMPROVEMENT_FW_GENERATOR_WATER',          'YIELD_GOLD',       2), 
	('BUILDING_FW_BOREHOLE', 			 'IMPROVEMENT_MINE', 					    'YIELD_PRODUCTION', 2),
	('BUILDING_FW_BOREHOLE', 			 'IMPROVEMENT_QUARRY', 					    'YIELD_PRODUCTION', 2),
	('BUILDING_FW_BOREHOLE', 			 'IMPROVEMENT_WELL', 					    'YIELD_PRODUCTION', 2),
	('BUILDING_FW_FEEDSITE_HUB', 	 	 'IMPROVEMENT_FW_PRESERVE', 				'YIELD_CULTURE', 	2),
	('BUILDING_FW_FEEDSITE_HUB', 	 	 'IMPROVEMENT_FW_PRESERVE', 			    'YIELD_GOLD',    	1),
	('BUILDING_FW_FEEDSITE_HUB', 	 	 'IMPROVEMENT_FW_COMM_ARRAY', 				'YIELD_CULTURE', 	2),
	('BUILDING_FW_FEEDSITE_HUB', 	 	 'IMPROVEMENT_FW_COMM_ARRAY', 				'YIELD_GOLD',    	1),
	('BUILDING_FW_FEEDSITE_HUB', 	 	 'IMPROVEMENT_LANDMARK', 		    		'YIELD_CULTURE', 	2),
	('BUILDING_FW_FEEDSITE_HUB', 	 	 'IMPROVEMENT_LANDMARK', 			    	'YIELD_GOLD',    	1),
	('BUILDING_FW_FEEDSITE_HUB', 	 	 'IMPROVEMENT_HOLY_SITE', 			    	'YIELD_CULTURE',    2),
	('BUILDING_FW_FEEDSITE_HUB', 	 	 'IMPROVEMENT_HOLY_SITE', 			    	'YIELD_GOLD',    	1),
	('BUILDING_FW_SIMULATION_HUB', 	 	 'IMPROVEMENT_FW_HERC', 				    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_SIMULATION_HUB', 	 	 'IMPROVEMENT_FW_HERC', 				    'YIELD_GOLD', 		1),
	('BUILDING_FW_SIMULATION_HUB', 	 	 'IMPROVEMENT_ACADEMY', 				    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_SIMULATION_HUB', 	 	 'IMPROVEMENT_ACADEMY', 				    'YIELD_GOLD', 		1),
	('BUILDING_FW_DISTRIBUTION_HUB', 	 'IMPROVEMENT_FW_INDUSTRIAL_COMPLEX', 	    'YIELD_PRODUCTION', 2),
	('BUILDING_FW_DISTRIBUTION_HUB', 	 'IMPROVEMENT_FW_INDUSTRIAL_COMPLEX', 	    'YIELD_GOLD', 		1),
	('BUILDING_FW_DISTRIBUTION_HUB', 	 'IMPROVEMENT_MANUFACTORY', 			    'YIELD_PRODUCTION', 2),
	('BUILDING_FW_DISTRIBUTION_HUB', 	 'IMPROVEMENT_MANUFACTORY', 			    'YIELD_GOLD', 		1),
	('BUILDING_FW_METROPLEX_HUB', 		 'IMPROVEMENT_TRADING_POST', 			    'YIELD_GOLD', 		3),
	('BUILDING_FW_METROPLEX_HUB', 		 'IMPROVEMENT_CUSTOMS_HOUSE', 			    'YIELD_GOLD', 		3),
	('BUILDING_FW_TRANSGENIC_NURSERY', 	 'IMPROVEMENT_FW_BIOWELL', 				    'YIELD_FAITH', 		1),
	('BUILDING_FW_TRANSGENIC_NURSERY', 	 'IMPROVEMENT_FW_BIOWELL', 				    'YIELD_SCIENCE', 	1),
	('BUILDING_FW_DRONE_HIVE', 		 	 'IMPROVEMENT_FW_GENERATOR_WATER',  	    'YIELD_PRODUCTION', 1),
	('BUILDING_FW_DRONE_HIVE', 		 	 'IMPROVEMENT_FW_GENERATOR_WATER',		    'YIELD_FOOD', 		1),
	('BUILDING_FW_DRONE_HIVE', 		 	 'IMPROVEMENT_FW_GENERATOR', 			    'YIELD_PRODUCTION', 1),
	('BUILDING_FW_DRONE_HIVE', 		 	 'IMPROVEMENT_FW_GENERATOR', 			    'YIELD_FOOD', 		1),
	('BUILDING_FW_AEROSPACE_COMPLEX', 	 'IMPROVEMENT_FW_HYDROPONICS_DOME', 		'YIELD_CULTURE',    1),
	('BUILDING_FW_AEROSPACE_COMPLEX',    'IMPROVEMENT_FW_HYDROPONICS_DOME', 		'YIELD_GOLD',       1),
	('BUILDING_FW_SKYRAIL_HUB', 	     'IMPROVEMENT_TRADING_POST', 		     	'YIELD_CULTURE', 	1),
	('BUILDING_FW_SKYRAIL_HUB', 	     'IMPROVEMENT_TRADING_POST', 		    	'YIELD_TOURISM', 	1),
	('BUILDING_FW_SKYRAIL_HUB', 	     'IMPROVEMENT_CUSTOMS_HOUSE', 			    'YIELD_CULTURE', 	1),
	('BUILDING_FW_SKYRAIL_HUB', 	 	 'IMPROVEMENT_CUSTOMS_HOUSE', 			    'YIELD_TOURISM', 	1),
	('BUILDING_FW_GENETIC_EVOLUTION',    'IMPROVEMENT_FW_GENOCENTRE',   		    'YIELD_PRODUCTION', 2),
	('BUILDING_FW_GENETIC_EVOLUTION',    'IMPROVEMENT_FW_GENOCENTRE',   		    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_GENETIC_EVOLUTION',    'IMPROVEMENT_FW_WATER_GENOCENTRE',      	'YIELD_PRODUCTION', 2),
	('BUILDING_FW_GENETIC_EVOLUTION',    'IMPROVEMENT_FW_WATER_GENOCENTRE',   	    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FW_CORE', 				    'YIELD_GOLD', 		2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FW_CORE', 				    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FW_WATER_CORE', 			    'YIELD_GOLD', 		2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FW_WATER_CORE', 			    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FORT', 					    'YIELD_GOLD', 		2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FORT', 					    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_CITADEL', 				    'YIELD_GOLD', 		2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_CITADEL', 				    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_MONGOLIA_ORDO', 			    'YIELD_GOLD', 		2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_MONGOLIA_ORDO', 			    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_CHATEAU', 			    	'YIELD_GOLD', 		2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_CHATEAU', 				    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FEITORIA', 				    'YIELD_GOLD', 		2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_FEITORIA', 				    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_KASBAH', 					    'YIELD_GOLD', 		2),
	('BUILDING_FW_AI_NETWORK', 		 	 'IMPROVEMENT_KASBAH', 					    'YIELD_SCIENCE', 	2),
	('BUILDING_FW_CENTRAL_COMMAND', 	 'IMPROVEMENT_FW_ARCOLOGY',   			    'YIELD_GOLD', 		2),
	('BUILDING_FW_CENTRAL_COMMAND', 	 'IMPROVEMENT_FW_ARCOLOGY',   			    'YIELD_CULTURE', 	2),
	('BUILDING_FW_CENTRAL_COMMAND', 	 'IMPROVEMENT_FW_WATER_ARCOLOGY',   	    'YIELD_GOLD', 		2),
	('BUILDING_FW_CENTRAL_COMMAND', 	 'IMPROVEMENT_FW_WATER_ARCOLOGY',   	    'YIELD_CULTURE', 	2);

-- Network Backbone 관련
INSERT INTO Building_ImprovementYieldChanges
    (BuildingType, ImprovementType, YieldType, Yield)
SELECT 'BUILDING_FW_NETWORK_BACKBONE', 'IMPROVEMENT_OTTOMAN_TERSANE', 'YIELD_GOLD', 2
WHERE EXISTS (SELECT 1 FROM Buildings WHERE Type='BUILDING_FW_NETWORK_BACKBONE')
  AND EXISTS (SELECT 1 FROM Improvements WHERE Type='IMPROVEMENT_OTTOMAN_TERSANE')
  AND NOT EXISTS (
    SELECT 1 FROM Building_ImprovementYieldChanges
    WHERE BuildingType='BUILDING_FW_NETWORK_BACKBONE'
      AND ImprovementType='IMPROVEMENT_OTTOMAN_TERSANE'
      AND YieldType='YIELD_GOLD'
  );

INSERT INTO Building_ImprovementYieldChanges
    (BuildingType, ImprovementType, YieldType, Yield)
SELECT 'BUILDING_FW_NETWORK_BACKBONE', 'IMPROVEMENT_ENCAMPMENT_SHOSHONE', 'YIELD_GOLD', 2
WHERE EXISTS (SELECT 1 FROM Buildings WHERE Type='BUILDING_FW_NETWORK_BACKBONE')
  AND EXISTS (SELECT 1 FROM Improvements WHERE Type='IMPROVEMENT_ENCAMPMENT_SHOSHONE')
  AND NOT EXISTS (
    SELECT 1 FROM Building_ImprovementYieldChanges
    WHERE BuildingType='BUILDING_FW_NETWORK_BACKBONE'
      AND ImprovementType='IMPROVEMENT_ENCAMPMENT_SHOSHONE'
      AND YieldType='YIELD_GOLD'
  );

-- AI Network 관련
INSERT INTO Building_ImprovementYieldChanges
    (BuildingType, ImprovementType, YieldType, Yield)
SELECT 'BUILDING_FW_AI_NETWORK', 'IMPROVEMENT_OTTOMAN_TERSANE', 'YIELD_GOLD', 2
WHERE EXISTS (SELECT 1 FROM Buildings WHERE Type='BUILDING_FW_AI_NETWORK')
  AND EXISTS (SELECT 1 FROM Improvements WHERE Type='IMPROVEMENT_OTTOMAN_TERSANE')
  AND NOT EXISTS (
    SELECT 1 FROM Building_ImprovementYieldChanges
    WHERE BuildingType='BUILDING_FW_AI_NETWORK'
      AND ImprovementType='IMPROVEMENT_OTTOMAN_TERSANE'
      AND YieldType='YIELD_GOLD'
  );

INSERT INTO Building_ImprovementYieldChanges
    (BuildingType, ImprovementType, YieldType, Yield)
SELECT 'BUILDING_FW_AI_NETWORK', 'IMPROVEMENT_OTTOMAN_TERSANE', 'YIELD_SCIENCE', 2
WHERE EXISTS (SELECT 1 FROM Buildings WHERE Type='BUILDING_FW_AI_NETWORK')
  AND EXISTS (SELECT 1 FROM Improvements WHERE Type='IMPROVEMENT_OTTOMAN_TERSANE')
  AND NOT EXISTS (
    SELECT 1 FROM Building_ImprovementYieldChanges
    WHERE BuildingType='BUILDING_FW_AI_NETWORK'
      AND ImprovementType='IMPROVEMENT_OTTOMAN_TERSANE'
      AND YieldType='YIELD_SCIENCE'
  );

INSERT INTO Building_ImprovementYieldChanges
    (BuildingType, ImprovementType, YieldType, Yield)
SELECT 'BUILDING_FW_AI_NETWORK', 'IMPROVEMENT_CELTS_OPPIDUM', 'YIELD_SCIENCE', 2
WHERE EXISTS (SELECT 1 FROM Buildings WHERE Type='BUILDING_FW_AI_NETWORK')
  AND EXISTS (SELECT 1 FROM Improvements WHERE Type='IMPROVEMENT_CELTS_OPPIDUM')
  AND NOT EXISTS (
    SELECT 1 FROM Building_ImprovementYieldChanges
    WHERE BuildingType='BUILDING_FW_AI_NETWORK'
      AND ImprovementType='IMPROVEMENT_CELTS_OPPIDUM'
      AND YieldType='YIELD_SCIENCE'
  );


-----------------------------------------------------------------
-- Building Plus theme
------------------------------------------------------------------
INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_ORBITAL_HABITAT', 'YIELD_PRODUCTION', 15);

INSERT INTO Building_YieldFromInternalTR
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_SKYRAIL_HUB', 'YIELD_FOOD', 		8),
	('BUILDING_FW_SKYRAIL_HUB', 'YIELD_PRODUCTION', 	4);

INSERT INTO Building_YieldModifiers
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_BIOCOMPUTER', 	'YIELD_SCIENCE',        25),
	('BUILDING_FW_SKYRAIL_HUB', 	'YIELD_GOLD', 		    10),
	('BUILDING_FW_TIDAL_PORT', 		'YIELD_CULTURE', 	    10);

INSERT INTO Building_GreatWorkYieldChangesLocal
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_VIRTUAL_MUSEUM',  'YIELD_CULTURE', 1),
	('BUILDING_FW_VIRTUAL_MUSEUM',  'YIELD_TOURISM', 1);

INSERT INTO Building_ThemingYieldBonus
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FW_VIRTUAL_MUSEUM', 'YIELD_CULTURE', 6);

----------------------------------------------------------------------
-- Unit building
-----------------------------------------------------------------------
INSERT INTO Building_FreeUnits 
	(BuildingType,						UnitType,				NumUnits)
VALUES	
	('BUILDING_FW_CLONE_LAB', 			'UNIT_FW_CLONETROOPER',		1);
	
------------------------------	
-- Building_DomainFreeExperiences
------------------------------
INSERT INTO Building_DomainFreeExperiences
	(BuildingType, DomainType, Experience)
VALUES
	('BUILDING_FW_VR_TRAINING',    'DOMAIN_LAND', 25),
	('BUILDING_FW_VR_TRAINING',    'DOMAIN_SEA',  25),
	('BUILDING_FW_VR_TRAINING',    'DOMAIN_AIR',  25);

INSERT INTO Building_DomainProductionModifiers
	(BuildingType, DomainType, Modifier)
VALUES
	('BUILDING_FW_NANOFORGE', 		        'DOMAIN_SEA', 	        15),
	('BUILDING_FW_NANOFORGE', 		        'DOMAIN_LAND',        	15),
	('BUILDING_FW_NANOFORGE', 		        'DOMAIN_AIR', 	      	15);	

INSERT INTO Building_UnitCombatProductionModifiers 
	(BuildingType, UnitCombatType, Modifier) 
VALUES
	('BUILDING_FW_LAUNCH_FACILITY',       'UNITCOMBAT_RECON',      15),
	('BUILDING_FW_LAUNCH_FACILITY',       'UNITCOMBAT_GUN',        15),
	('BUILDING_FW_BIO_AUG_CLINIC',        'UNITCOMBAT_RECON',      15),
	('BUILDING_FW_BIO_AUG_CLINIC',        'UNITCOMBAT_GUN',        15),
	('BUILDING_FW_HUMONOID_FORGE',        'UNITCOMBAT_ARMOR',      15),
	('BUILDING_FW_HUMONOID_FORGE',        'UNITCOMBAT_SIEGE',      15),
	('BUILDING_FW_TRANSGENIC_NURSERY',    'UNITCOMBAT_MELEE',      15),
	('BUILDING_FW_TRANSGENIC_NURSERY',    'UNITCOMBAT_MOUNTED',    15),
	('BUILDING_FW_TRANSGENIC_NURSERY',    'UNITCOMBAT_HELICOPTER', 15),
	('BUILDING_FW_TIDAL_PORT',            'UNITCOMBAT_NAVALMELEE', 15),
	('BUILDING_FW_TIDAL_PORT',            'UNITCOMBAT_NAVALRANGED',15),
	('BUILDING_FW_TIDAL_PORT',            'UNITCOMBAT_SUBMARINE',  15),
	('BUILDING_FW_DRONE_HIVE',            'UNITCOMBAT_ARCHER',     15),
	('BUILDING_FW_SKYRAIL_HUB',           'UNITCOMBAT_FIGHTER',    15),
	('BUILDING_FW_SKYRAIL_HUB',           'UNITCOMBAT_BOMBER',     15),
	('BUILDING_FW_AEROSPACE_COMPLEX',     'UNITCOMBAT_CARRIER',    15),	
	('BUILDING_FW_ECTOGENESIS_POD',       'UNITCOMBAT_MELEE',      15),
	('BUILDING_FW_ECTOGENESIS_POD',       'UNITCOMBAT_MOUNTED',    15),
	('BUILDING_FW_ECTOGENESIS_POD',       'UNITCOMBAT_HELICOPTER', 15),
	('BUILDING_FW_BIOMOD_TANK',           'UNITCOMBAT_RECON',      15), 
	('BUILDING_FW_BIOMOD_TANK',           'UNITCOMBAT_GUN',        15),  	
	('BUILDING_FW_BIOMOD_TANK',           'UNITCOMBAT_NAVALMELEE', 15),
	('BUILDING_FW_BIOMOD_TANK',           'UNITCOMBAT_NAVALRANGED',15),
	('BUILDING_FW_QUANTUM_LINK',          'UNITCOMBAT_SUBMARINE',  15),
	('BUILDING_FW_BIGBROTHER_CONTROL',    'UNITCOMBAT_ARCHER',     15),
	('BUILDING_FW_FUSION_PLANT',          'UNITCOMBAT_ARMOR',      15),
	('BUILDING_FW_FUSION_PLANT',          'UNITCOMBAT_SIEGE',      15),
	('BUILDING_FW_ORBITAL_MINING',        'UNITCOMBAT_RECON',      15),
	('BUILDING_FW_ORBITAL_MINING',        'UNITCOMBAT_GUN',        15),
	('BUILDING_FW_ORBITAL_MINING',        'UNITCOMBAT_FIGHTER',    15),
	('BUILDING_FW_ORBITAL_MINING',        'UNITCOMBAT_BOMBER',     15),
	('BUILDING_FW_ORBITAL_HABITAT',       'UNITCOMBAT_CARRIER',    15);



INSERT INTO Unit_ProductionModifierBuildings (UnitType,	BuildingType,	ProductionModifier) VALUES
('UNIT_FW_GUNBOAT', 		'BUILDING_FW_AEROSPACE_COMPLEX', 	 15),
('UNIT_FW_ADV_GUNBOAT', 	'BUILDING_FW_AEROSPACE_COMPLEX', 	 15),
('UNIT_FW_RAILGUN_MISSILE',	'BUILDING_FW_AEROSPACE_COMPLEX', 	 15),
('UNIT_FW_GOD_ROD', 		'BUILDING_FW_AEROSPACE_COMPLEX', 	 15),
('UNIT_FW_GOD_ROD2', 		'BUILDING_FW_AEROSPACE_COMPLEX', 	 15),
('UNIT_FW_GUNBOAT', 		'BUILDING_FW_ORBITAL_HABITAT', 	     15),
('UNIT_FW_ADV_GUNBOAT', 	'BUILDING_FW_ORBITAL_HABITAT', 	     15),
('UNIT_FW_RAILGUN_MISSILE',	'BUILDING_FW_ORBITAL_HABITAT', 	     15),
('UNIT_FW_GOD_ROD', 		'BUILDING_FW_ORBITAL_HABITAT', 	     15),
('UNIT_FW_GOD_ROD2', 		'BUILDING_FW_ORBITAL_HABITAT', 	     15);




---===============================================================================
-- Religiion and Policies
---------------------------------------------------------------
--------------------------------------------------------------
-- Religion: Balance all delted, only improvement change
--------------------------------------------------------------
--------------------------------------------------------------
-- Policies: Balance all delted, only improvement change
---------------------------------------------------------------
------------------------
-- Flavors 
------------------------
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_FW_SERVER_HUB', 			     'FLAVOR_CULTURE', 				30),
('BUILDING_FW_SERVER_HUB', 			     'FLAVOR_SCIENCE', 				30),
('BUILDING_FW_SERVER_HUB', 		         'FLAVOR_PRODUCTION', 			30),
('BUILDING_FW_SERVER_HUB', 		    	 'FLAVOR_GOLD', 			    30),
('BUILDING_FW_SERVER_HUB', 		     	 'FLAVOR_RELIGION', 			20),
('BUILDING_FW_AQUACULTURE_LAB',          'FLAVOR_GROWTH', 				60),
('BUILDING_FW_AQUACULTURE_LAB',          'FLAVOR_GOLD', 				10),
('BUILDING_FW_AQUACULTURE_LAB',          'FLAVOR_CULTURE', 				 5),
('BUILDING_FW_AQUACULTURE_LAB',          'FLAVOR_TILE_IMPROVEMENT',     10),
('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'FLAVOR_SCIENCE', 		        40),
('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'FLAVOR_CULTURE', 	        	40),
('BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'FLAVOR_GOLD', 	             2),
('BUILDING_FW_UNDERSEA_MINING',          'FLAVOR_PRODUCTION', 			30),
('BUILDING_FW_UNDERSEA_MINING',          'FLAVOR_GOLD', 			    30),
('BUILDING_FW_UNDERSEA_MINING',          'FLAVOR_I_TRADE_ORIGIN', 		10),
('BUILDING_FW_UNDERSEA_MINING',          'FLAVOR_I_TRADE_DESTINATION', 	10),
('BUILDING_FW_FUNGAL_AGRIGENOMICS',      'FLAVOR_SCIENCE', 		    	30),
('BUILDING_FW_FUNGAL_AGRIGENOMICS',      'FLAVOR_CULTURE', 		    	30),
('BUILDING_FW_FUNGAL_AGRIGENOMICS',      'FLAVOR_OFFENSE',              40),
('BUILDING_FW_FUNGAL_AGRIGENOMICS',      'FLAVOR_DEFENSE',              10),
('BUILDING_FW_FUNGAL_AGRIGENOMICS',      'FLAVOR_CITY_DEFENSE',     	 5),
('BUILDING_FW_FUNGAL_AGRIGENOMICS',      'FLAVOR_EXPANSION', 		     5),
('BUILDING_FW_FUNGAL_AGRIGENOMICS',      'FLAVOR_MILITARY_TRAINING',    40),
('BUILDING_FW_FUNGAL_AGRIGENOMICS',      'FLAVOR_TILE_IMPROVEMENT',     20),
('BUILDING_FW_GENE_LAB', 			     'FLAVOR_HAPPINESS',            10),
('BUILDING_FW_GENE_LAB', 			     'FLAVOR_GROWTH',               40),
('BUILDING_FW_WORLD_SECURITY', 		     'FLAVOR_HAPPINESS',            20),
('BUILDING_FW_WORLD_SECURITY', 		     'FLAVOR_ESPIONAGE',            25),
('BUILDING_FW_WORLD_SECURITY', 		     'FLAVOR_DIPLOMACY',            25),
('BUILDING_FW_AUTOPLANT',                'FLAVOR_PRODUCTION',           50),
('BUILDING_FW_AUTOPLANT', 		         'FLAVOR_HAPPINESS', 			10),
('BUILDING_FW_NANOMAT_PLANT', 	         'FLAVOR_MILITARY_TRAINING',    50),
('BUILDING_FW_NANOMAT_PLANT',            'FLAVOR_EXPANSION', 	    	 5),
('BUILDING_FW_NANOMAT_PLANT',            'FLAVOR_PRODUCTION', 	    	30),
('BUILDING_FW_NANOMAT_PLANT',            'FLAVOR_SPACESHIP', 		    40),
('BUILDING_FW_NANOMAT_PLANT', 	         'FLAVOR_HAPPINESS', 	    	10),
('BUILDING_SPACESHIP_FACTORY', 	         'FLAVOR_MILITARY_TRAINING', 	20),
('BUILDING_SPACESHIP_FACTORY', 	         'FLAVOR_AIR',               	20),
('BUILDING_SPACESHIP_FACTORY', 	         'FLAVOR_SPACESHIP',            15),
('BUILDING_FW_ECOSANCTUARY', 	         'FLAVOR_TILE_IMPROVEMENT',     20),
('BUILDING_FW_ECOSANCTUARY', 	         'FLAVOR_CULTURE', 			    60),
('BUILDING_FW_ECOSANCTUARY', 	         'FLAVOR_PRODUCTION', 	    	40),
('BUILDING_FW_ECOSANCTUARY', 	         'FLAVOR_HAPPINESS', 	    	10),
('BUILDING_FW_CRYPTOBANK',               'FLAVOR_GOLD',                 50),
('BUILDING_FW_CRYPTOBANK',               'FLAVOR_HAPPINESS',            10),
('BUILDING_FW_CRYPTOBANK', 	             'FLAVOR_TILE_IMPROVEMENT',      5),
('BUILDING_FW_VR_TRAINING', 	         'FLAVOR_TILE_IMPROVEMENT',      5),
('BUILDING_FW_VR_TRAINING', 		     'FLAVOR_MILITARY_TRAINING', 	60),
('BUILDING_FW_VR_TRAINING', 		     'FLAVOR_SCIENCE', 				 2),
('BUILDING_FW_VR_TRAINING', 		     'FLAVOR_HAPPINESS', 			10),
('BUILDING_FW_VIRTUAL_MUSEUM', 		     'FLAVOR_CULTURE', 				25),
('BUILDING_FW_VIRTUAL_MUSEUM', 		     'FLAVOR_EXPANSION', 		     6),
('BUILDING_FW_VIRTUAL_MUSEUM', 		     'FLAVOR_HAPPINESS', 			10),
('BUILDING_FW_COMMERCE_SERVER', 	     'FLAVOR_GOLD', 				50),
('BUILDING_FW_COMMERCE_SERVER', 		 'FLAVOR_HAPPINESS', 			10),
('BUILDING_FW_ENTERTAINMENT_SERVER',     'FLAVOR_CULTURE', 				50),
('BUILDING_FW_ENTERTAINMENT_SERVER', 	 'FLAVOR_HAPPINESS', 			10),
('BUILDING_FW_CLOUD_COMPUTING', 	     'FLAVOR_PRODUCTION', 			50),
('BUILDING_FW_CLOUD_COMPUTING', 	     'FLAVOR_HAPPINESS', 			10),
('BUILDING_FW_RESEARCH_SERVER', 	     'FLAVOR_SCIENCE', 				50),
('BUILDING_FW_RESEARCH_SERVER', 		 'FLAVOR_HAPPINESS', 			10),
('BUILDING_FW_CONVERTER', 		         'FLAVOR_SPACESHIP', 		    50),
('BUILDING_FW_CONVERTER', 		         'FLAVOR_MILITARY_TRAINING',    50),
('BUILDING_FW_CONVERTER', 	             'FLAVOR_EXPANSION', 		    15),
('BUILDING_FW_CONVERTER_OIL', 	         'FLAVOR_SPACESHIP', 		    40),
('BUILDING_FW_CONVERTER_OIL',            'FLAVOR_MILITARY_TRAINING',    40),
('BUILDING_FW_CONVERTER_OIL',            'FLAVOR_EXPANSION',            15),
('BUILDING_FW_CONVERTER_IRON',           'FLAVOR_SPACESHIP', 		    40),
('BUILDING_FW_CONVERTER_IRON',           'FLAVOR_MILITARY_TRAINING',    40),
('BUILDING_FW_CONVERTER_IRON',           'FLAVOR_EXPANSION',            15),
('BUILDING_FW_NANOFORGE',                'FLAVOR_PRODUCTION',           50),
('BUILDING_FW_NANOFORGE',                'FLAVOR_OFFENSE',              35),
('BUILDING_FW_NANOFORGE',                'FLAVOR_DEFENSE',              35),
('BUILDING_FW_NANOFORGE',                'FLAVOR_MILITARY_TRAINING',    50),
('BUILDING_FW_NANOFORGE', 	             'FLAVOR_TILE_IMPROVEMENT',     10),
('BUILDING_FW_PARTICLE_ACCELERATOR',     'FLAVOR_SCIENCE', 		    	50),
('BUILDING_FW_PARTICLE_ACCELERATOR', 	 'FLAVOR_TILE_IMPROVEMENT',     10),
('BUILDING_FW_VERTICAL_FARM', 	         'FLAVOR_TILE_IMPROVEMENT', 	20),
('BUILDING_FW_VERTICAL_FARM', 		     'FLAVOR_GROWTH', 			    40),
('BUILDING_FW_VERTICAL_FARM', 	         'FLAVOR_SCIENCE', 		    	50),
('BUILDING_FW_VERTICAL_FARM', 	         'FLAVOR_HAPPINESS', 	         5),
('BUILDING_FW_VERTICAL_FARM',            'FLAVOR_SPACESHIP', 		    40),
('BUILDING_FW_BIOTEST_CENTER',           'FLAVOR_PRODUCTION', 		    10),
('BUILDING_FW_BIOTEST_CENTER', 	         'FLAVOR_OFFENSE', 			    25),
('BUILDING_FW_BIOTEST_CENTER', 	         'FLAVOR_DEFENSE', 			     5),
('BUILDING_FW_BIOTEST_CENTER', 	         'FLAVOR_SCIENCE', 			     5),
('BUILDING_FW_BIOTEST_CENTER', 	         'FLAVOR_MILITARY_TRAINING',    25),
('BUILDING_FW_BIOTEST_CENTER', 	         'FLAVOR_EXPANSION', 		     5),
('BUILDING_FW_BIOFACTORY', 		         'FLAVOR_TILE_IMPROVEMENT', 	 5),
('BUILDING_FW_BIOFACTORY', 		         'FLAVOR_GROWTH', 		    	20),
('BUILDING_FW_BIOFACTORY', 		         'FLAVOR_PRODUCTION', 		    40),
('BUILDING_FW_OCEAN_BIOHUB',             'FLAVOR_TILE_IMPROVEMENT',      5),
('BUILDING_FW_OCEAN_BIOHUB',             'FLAVOR_GROWTH', 		    	25),
('BUILDING_FW_OCEAN_BIOHUB',             'FLAVOR_SCIENCE', 		    	25),
('BUILDING_FW_OCEAN_BIOHUB',             'FLAVOR_PRODUCTION', 	    	25),
('BUILDING_FW_BIOTECH_CENTER',           'FLAVOR_PRODUCTION',           25),
('BUILDING_FW_BIOTECH_CENTER',           'FLAVOR_GOLD',                  5),
('BUILDING_FW_BIOTECH_CENTER',           'FLAVOR_GROWTH',                5),
('BUILDING_FW_BIOTECH_CENTER',           'FLAVOR_TILE_IMPROVEMENT',     15),
('BUILDING_FW_BIOTECH_CENTER', 	         'FLAVOR_OFFENSE', 			    10),
('BUILDING_FW_BIO_AUG_CLINIC',           'FLAVOR_HAPPINESS',            10),
('BUILDING_FW_BIO_AUG_CLINIC', 	         'FLAVOR_OFFENSE',              30),
('BUILDING_FW_BIO_AUG_CLINIC', 	         'FLAVOR_MILITARY_TRAINING',    45),
('BUILDING_FW_BIO_AUG_CLINIC',           'FLAVOR_RELIGION',             10),
('BUILDING_FW_BIO_AUG_CLINIC',           'FLAVOR_GROWTH',               10),
('BUILDING_FW_NETWORK_BACKBONE',         'FLAVOR_SCIENCE', 				30),
('BUILDING_FW_NETWORK_BACKBONE',         'FLAVOR_CULTURE', 				30),
('BUILDING_FW_NETWORK_BACKBONE',         'FLAVOR_PRODUCTION', 			30),
('BUILDING_FW_NETWORK_BACKBONE', 	     'FLAVOR_GOLD', 				30),
('BUILDING_FW_NETWORK_BACKBONE', 	     'FLAVOR_TILE_IMPROVEMENT', 	10),
('BUILDING_FW_LAUNCH_FACILITY', 	     'FLAVOR_SCIENCE', 			    10),
('BUILDING_FW_LAUNCH_FACILITY',          'FLAVOR_GOLD',     	    	10),
('BUILDING_FW_LAUNCH_FACILITY', 	     'FLAVOR_OFFENSE', 		    	15),
('BUILDING_FW_LAUNCH_FACILITY', 	     'FLAVOR_AIR', 			    	15),
('BUILDING_FW_LAUNCH_FACILITY', 	     'FLAVOR_AIRLIFT', 			   	15),
('BUILDING_FW_LAUNCH_FACILITY',          'FLAVOR_MILITARY_TRAINING',    15),
('BUILDING_FW_LAUNCH_FACILITY', 	     'FLAVOR_HAPPINESS', 	    	10),
('BUILDING_FW_LAUNCH_FACILITY',          'FLAVOR_SPACESHIP', 		    20),
('BUILDING_FW_BIOFUEL_REFINERY', 	     'FLAVOR_EXPANSION',            35),
('BUILDING_FW_BIOFUEL_REFINERY',         'FLAVOR_PRODUCTION',           25),
('BUILDING_FW_BIOFUEL_REFINERY_RICE', 	 'FLAVOR_EXPANSION',            35),
('BUILDING_FW_BIOFUEL_REFINERY_RICE',    'FLAVOR_PRODUCTION',           25),
('BUILDING_FW_BIOFUEL_REFINERY_BANANA',  'FLAVOR_EXPANSION',            35),
('BUILDING_FW_BIOFUEL_REFINERY_BANANA',  'FLAVOR_PRODUCTION',           25),
('BUILDING_FW_BIOFUEL_REFINERY_MAIZE', 	 'FLAVOR_EXPANSION',            35),
('BUILDING_FW_BIOFUEL_REFINERY_MAIZE',   'FLAVOR_PRODUCTION',           25),
('BUILDING_FW_GEOTHERMAL_FACTORY',       'FLAVOR_TILE_IMPROVEMENT', 	5),
('BUILDING_FW_GEOTHERMAL_FACTORY',       'FLAVOR_PRODUCTION', 		    50),
('BUILDING_FW_GEOTHERMAL_FACTORY', 	     'FLAVOR_GOLD', 				40),
('BUILDING_FW_BOREHOLE', 		         'FLAVOR_TILE_IMPROVEMENT', 	5),
('BUILDING_FW_BOREHOLE', 			     'FLAVOR_GOLD', 				50),
('BUILDING_FW_BOREHOLE', 		         'FLAVOR_PRODUCTION', 	    	40),
('BUILDING_FW_ANTIMATTER_RESEARCH',      'FLAVOR_TILE_IMPROVEMENT', 	5),
('BUILDING_FW_ANTIMATTER_RESEARCH', 	 'FLAVOR_SCIENCE', 			    40),
('BUILDING_FW_ANTIMATTER_RESEARCH',      'FLAVOR_PRODUCTION', 	    	20),
('BUILDING_FW_CLONE_LAB',                'FLAVOR_PRODUCTION',            5),
('BUILDING_FW_CLONE_LAB',                'FLAVOR_GROWTH',               20),
('BUILDING_FW_CLONE_LAB',                'FLAVOR_DEFENSE',               5),
('BUILDING_FW_CLONE_LAB',                'FLAVOR_OFFENSE',              25),
('BUILDING_FW_CLONE_LAB',                'FLAVOR_GREAT_PEOPLE',         10),
('BUILDING_FW_FEEDSITE_HUB', 	         'FLAVOR_GREAT_PEOPLE', 		 5),
('BUILDING_FW_FEEDSITE_HUB',        	 'FLAVOR_HAPPINESS', 		    40),
('BUILDING_FW_FEEDSITE_HUB', 		     'FLAVOR_CULTURE', 			    50),
('BUILDING_FW_FEEDSITE_HUB', 		     'FLAVOR_TILE_IMPROVEMENT', 	 5),
('BUILDING_FW_SIMULATION_HUB', 		     'FLAVOR_TILE_IMPROVEMENT', 	 5),
('BUILDING_FW_SIMULATION_HUB', 	         'FLAVOR_GREAT_PEOPLE', 		 5),
('BUILDING_FW_SIMULATION_HUB', 		     'FLAVOR_GOLD', 			     5),
('BUILDING_FW_SIMULATION_HUB', 	         'FLAVOR_SCIENCE', 			    50),
('BUILDING_FW_BIOCONVERTER_ADNF',        'FLAVOR_EXPANSION',            35),
('BUILDING_FW_BIOCONVERTER_ADNF',        'FLAVOR_PRODUCTION',           25),
('BUILDING_FW_BIOCONVERTER_ADNF',        'FLAVOR_OFFENSE',              25),
('BUILDING_FW_BIOCONVERTER_NANO',        'FLAVOR_EXPANSION',            35),
('BUILDING_FW_BIOCONVERTER_NANO',        'FLAVOR_PRODUCTION',           25),
('BUILDING_FW_BIOCONVERTER_NANO',        'FLAVOR_DEFENSE',              25),
('BUILDING_FW_BIOCONVERTER_NANO2',       'FLAVOR_EXPANSION',            35),
('BUILDING_FW_BIOCONVERTER_NANO2',       'FLAVOR_PRODUCTION',           25),
('BUILDING_FW_BIOCONVERTER_NANO2',       'FLAVOR_DEFENSE',              25),
('BUILDING_FW_HUMONOID_FORGE',           'FLAVOR_PRODUCTION',           25),
('BUILDING_FW_HUMONOID_FORGE',           'FLAVOR_CULTURE',              25),
('BUILDING_FW_HUMONOID_FORGE',           'FLAVOR_EXPANSION',            25),
('BUILDING_FW_HUMONOID_FORGE',           'FLAVOR_HAPPINESS',            25),
('BUILDING_FW_HUMONOID_FORGE',           'FLAVOR_OFFENSE',              25),
('BUILDING_FW_HUMONOID_FORGE',           'FLAVOR_DEFENSE',              25),
('BUILDING_FW_TELEPRESENCE_HUB',         'FLAVOR_PRODUCTION',           30),
('BUILDING_FW_TELEPRESENCE_HUB',         'FLAVOR_SCIENCE',              30),
('BUILDING_FW_TELEPRESENCE_HUB',         'FLAVOR_GOLD',                 30),
('BUILDING_FW_TELEPRESENCE_HUB',         'FLAVOR_CULTURE',              30),
('BUILDING_FW_DISTRIBUTION_HUB',         'FLAVOR_TILE_IMPROVEMENT', 	 5),
('BUILDING_FW_DISTRIBUTION_HUB',         'FLAVOR_GREAT_PEOPLE', 		 5),
('BUILDING_FW_DISTRIBUTION_HUB',         'FLAVOR_GOLD', 				 5),
('BUILDING_FW_DISTRIBUTION_HUB', 	     'FLAVOR_PRODUCTION', 		    50),
('BUILDING_FW_METROPLEX_HUB', 	         'FLAVOR_TILE_IMPROVEMENT', 	 5),
('BUILDING_FW_METROPLEX_HUB', 	         'FLAVOR_GREAT_PEOPLE', 		 5),
('BUILDING_FW_METROPLEX_HUB', 		     'FLAVOR_GOLD', 				55),
('BUILDING_FW_METAMATERIALS_CENTER',     'FLAVOR_EXPANSION',            25),
('BUILDING_FW_METAMATERIALS_CENTER',     'FLAVOR_PRODUCTION',           20),
('BUILDING_FW_MYCOPROTEIN_VATS', 	     'FLAVOR_GROWTH', 		        45),
('BUILDING_FW_MYCOPROTEIN_VATS', 	     'FLAVOR_HAPPINESS',         	20),
('BUILDING_FW_SOLAR_REFLECTOR',          'FLAVOR_GROWTH', 				5),
('BUILDING_FW_SOLAR_REFLECTOR',          'FLAVOR_PRODUCTION', 			5),
('BUILDING_FW_SOLAR_REFLECTOR',          'FLAVOR_SCIENCE', 		        5),
('BUILDING_FW_SOLAR_REFLECTOR',          'FLAVOR_ANTIAIR', 			    10),
('BUILDING_FW_SOLAR_REFLECTOR',          'FLAVOR_CITY_DEFENSE', 	    10),
('BUILDING_FW_SOLAR_REFLECTOR',          'FLAVOR_CULTURE', 			     5),
('BUILDING_FW_SOLAR_REFLECTOR',          'FLAVOR_HAPPINESS', 		     5),
('BUILDING_FW_TRANSGENIC_NURSERY',       'FLAVOR_TILE_IMPROVEMENT',     35),
('BUILDING_FW_TRANSGENIC_NURSERY',       'FLAVOR_GROWTH', 			    10),
('BUILDING_FW_TRANSGENIC_NURSERY', 	     'FLAVOR_MILITARY_TRAINING',    20),
('BUILDING_FW_TRANSGENIC_NURSERY', 	     'FLAVOR_SCIENCE',		 	    10),
('BUILDING_FW_TRANSGENIC_NURSERY', 	     'FLAVOR_MOBILE', 			    10),
('BUILDING_FW_TRANSGENIC_NURSERY',       'FLAVOR_OFFENSE', 	    	    50),
('BUILDING_FW_BIOCOMPUTER',              'FLAVOR_SCIENCE',              80),
('BUILDING_FW_BIOCOMPUTER',              'FLAVOR_HAPPINESS',            10),
('BUILDING_FW_TIDAL_PORT', 	             'FLAVOR_PRODUCTION', 			50),
('BUILDING_FW_TIDAL_PORT', 		         'FLAVOR_GOLD', 				40),
('BUILDING_FW_TIDAL_PORT', 	             'FLAVOR_I_SEA_TRADE_ROUTE', 	40),
('BUILDING_FW_TIDAL_PORT', 	             'FLAVOR_I_TRADE_DESTINATION', 	20),
('BUILDING_FW_TIDAL_PORT', 		         'FLAVOR_I_TRADE_ORIGIN', 		20),
('BUILDING_FW_TIDAL_PORT', 	             'FLAVOR_CULTURE', 				40),
('BUILDING_FW_TIDAL_PORT', 		         'FLAVOR_NAVAL', 				35),
('BUILDING_FW_TIDAL_PORT', 	             'FLAVOR_MILITARY_TRAINING', 	 5),
('BUILDING_FW_NANOMINES_FIELD',          'FLAVOR_DEFENSE', 		    	30),
('BUILDING_FW_NANOMINES_FIELD', 	     'FLAVOR_CITY_DEFENSE', 		60),
('BUILDING_FW_DEFENSE_FIELD', 	         'FLAVOR_DEFENSE',              30),
('BUILDING_FW_DEFENSE_FIELD', 	         'FLAVOR_CITY_DEFENSE',         60),
('BUILDING_FW_DRONE_HIVE', 		         'FLAVOR_TILE_IMPROVEMENT',     10),
('BUILDING_FW_DRONE_HIVE', 		       	 'FLAVOR_GOLD', 				  5),
('BUILDING_FW_DRONE_HIVE', 		         'FLAVOR_MILITARY_TRAINING', 	 10),
('BUILDING_FW_DRONE_HIVE', 			     'FLAVOR_PRODUCTION', 			 10),
('BUILDING_FW_DRONE_HIVE', 		         'FLAVOR_CITY_DEFENSE', 		 60),
('BUILDING_FW_DRONE_HIVE', 		         'FLAVOR_DEFENSE', 				 30),
('BUILDING_FW_SKYRAIL_HUB', 	         'FLAVOR_I_LAND_TRADE_ROUTE', 	 40),
('BUILDING_FW_SKYRAIL_HUB',              'FLAVOR_I_TRADE_DESTINATION',   15),
('BUILDING_FW_SKYRAIL_HUB',              'FLAVOR_I_TRADE_ORIGIN', 		 15),
('BUILDING_FW_SKYRAIL_HUB',              'FLAVOR_PRODUCTION', 			 50),
('BUILDING_FW_SKYRAIL_HUB',              'FLAVOR_GROWTH', 				 30),
('BUILDING_FW_SKYRAIL_HUB',              'FLAVOR_GOLD', 				 40),
('BUILDING_FW_SKYRAIL_HUB',              'FLAVOR_AIR', 				     40),
('BUILDING_FW_SKYRAIL_HUB', 	         'FLAVOR_INFRASTRUCTURE', 		 20),
('BUILDING_FW_SKYRAIL_HUB', 	         'FLAVOR_TILE_IMPROVEMENT', 	  5),
('BUILDING_FW_LAGRANGE_COMMERCIAL',      'FLAVOR_GOLD', 		    	 50),
('BUILDING_FW_LAGRANGE_COMMERCIAL',      'FLAVOR_HAPPINESS', 		     10),
('BUILDING_FW_LAGRANGE_COMMERCIAL',      'FLAVOR_AIR', 		             15),
('BUILDING_FW_LAGRANGE_RESEARCH', 	     'FLAVOR_SCIENCE', 	        	 50),
('BUILDING_FW_LAGRANGE_RESEARCH', 	     'FLAVOR_HAPPINESS', 	         10),
('BUILDING_FW_LAGRANGE_RESEARCH', 	     'FLAVOR_AIR', 	                 15),
('BUILDING_FW_LAGRANGE_INDUSTRIAL',      'FLAVOR_PRODUCTION',       	 50),
('BUILDING_FW_LAGRANGE_INDUSTRIAL',      'FLAVOR_HAPPINESS',        	 10),
('BUILDING_FW_LAGRANGE_INDUSTRIAL',      'FLAVOR_AIR',        	         15),
('BUILDING_FW_AEROSPACE_COMPLEX',        'FLAVOR_TILE_IMPROVEMENT',      10),
('BUILDING_FW_AEROSPACE_COMPLEX',        'FLAVOR_PRODUCTION', 		      5),
('BUILDING_FW_AEROSPACE_COMPLEX', 	     'FLAVOR_CULTURE', 				  5),
('BUILDING_FW_AEROSPACE_COMPLEX',        'FLAVOR_MILITARY_TRAINING',     10),
('BUILDING_FW_AEROSPACE_COMPLEX', 	     'FLAVOR_MOBILE', 				 10),
('BUILDING_FW_AEROSPACE_COMPLEX', 	     'FLAVOR_CITY_DEFENSE', 		 15),
('BUILDING_FW_AEROSPACE_COMPLEX',        'FLAVOR_ANTIAIR', 				 25),
('BUILDING_FW_AEROSPACE_COMPLEX', 	     'FLAVOR_AIR', 					 30),
('BUILDING_FW_AEROSPACE_COMPLEX',        'FLAVOR_AIRLIFT', 				 30),
('BUILDING_FW_AEROSPACE_COMPLEX',        'FLAVOR_SPACESHIP', 			 60),
('BUILDING_FW_ECTOGENESIS_POD', 	     'FLAVOR_MILITARY_TRAINING',     60),
('BUILDING_FW_ECTOGENESIS_POD', 	     'FLAVOR_OFFENSE',               30),
('BUILDING_FW_ECTOGENESIS_POD', 	     'FLAVOR_DEFENSE',               30),
('BUILDING_FW_ECTOGENESIS_POD', 	     'FLAVOR_PRODUCTION',            30),
('BUILDING_FW_MASS_DIGESTER', 		     'FLAVOR_GROWTH', 			     75),
('BUILDING_FW_MASS_DIGESTER', 		     'FLAVOR_HAPPINESS', 		      5),
('BUILDING_FW_BIOMOD_TANK', 	         'FLAVOR_MILITARY_TRAINING',     60),
('BUILDING_FW_BIOMOD_TANK', 	         'FLAVOR_OFFENSE',               60),
('BUILDING_FW_BIOMOD_TANK', 	         'FLAVOR_SCIENCE',               20),
('BUILDING_FW_BIOMOD_TANK', 	         'FLAVOR_GREAT_PEOPLE',          30),
('BUILDING_FW_QUANTUM_LINK', 		     'FLAVOR_MILITARY_TRAINING',     20),
('BUILDING_FW_QUANTUM_LINK', 		     'FLAVOR_SCIENCE',               35),
('BUILDING_FW_QUANTUM_LINK', 		     'FLAVOR_CULTURE',               10),
('BUILDING_FW_QUANTUM_LINK', 		     'FLAVOR_NAVAL',                 20),
('BUILDING_FW_QUANTUM_LINK', 		     'FLAVOR_HAPPINESS',             20),
('BUILDING_FW_BIGBROTHER_CONTROL', 	     'FLAVOR_HAPPINESS',             50),
('BUILDING_FW_BIGBROTHER_CONTROL', 	     'FLAVOR_ESPIONAGE',             30),
('BUILDING_FW_BIGBROTHER_CONTROL', 		 'FLAVOR_DEFENSE',               30),
('BUILDING_FW_BIGBROTHER_CONTROL', 		 'FLAVOR_DIPLOMACY',             30),
('BUILDING_FW_FUSION_PLANT',             'FLAVOR_GROWTH',                20),
('BUILDING_FW_FUSION_PLANT',             'FLAVOR_CULTURE',               20),
('BUILDING_FW_FUSION_PLANT',             'FLAVOR_GOLD',                  20),
('BUILDING_FW_FUSION_PLANT',             'FLAVOR_SCIENCE',               20),
('BUILDING_FW_FUSION_PLANT',             'FLAVOR_GREAT_PEOPLE',          40),
('BUILDING_FW_FUSION_PLANT',             'FLAVOR_PRODUCTION',            70),
('BUILDING_FW_ORBITAL_MINING', 			 'FLAVOR_PRODUCTION',            20),
('BUILDING_FW_ORBITAL_MINING', 		     'FLAVOR_SCIENCE',               20),
('BUILDING_FW_ORBITAL_MINING', 			 'FLAVOR_DEFENSE',               30),
('BUILDING_FW_ORBITAL_MINING', 			 'FLAVOR_OFFENSE',               30),
('BUILDING_FW_ORBITAL_MINING', 			 'FLAVOR_AIR',                   30),
('BUILDING_FW_ORBITAL_MINING', 			 'FLAVOR_GOLD',                  40),
('BUILDING_FW_ORBITAL_MINING', 			 'FLAVOR_EXPANSION',             10),
('BUILDING_FW_ORBITAL_MINING', 			 'FLAVOR_HAPPINESS',             10),
('BUILDING_FW_ORBITAL_MINING', 			 'FLAVOR_EXPANSION',             15),
('BUILDING_FW_ORBITAL_MINING', 			 'FLAVOR_SPACESHIP',             15),
('BUILDING_FW_ORBITAL_HABITAT',          'FLAVOR_GROWTH',                50),
('BUILDING_FW_ORBITAL_HABITAT',          'FLAVOR_PRODUCTION',            25),
('BUILDING_FW_ORBITAL_HABITAT',          'FLAVOR_GOLD', 	              5),
('BUILDING_FW_ORBITAL_HABITAT',          'FLAVOR_SCIENCE', 	              5),
('BUILDING_FW_ORBITAL_HABITAT',          'FLAVOR_GREAT_PEOPLE',          10),
('BUILDING_FW_ORBITAL_HABITAT',          'FLAVOR_HAPPINESS',             10),
('BUILDING_FW_PHOTOSYSTEMS', 	         'FLAVOR_PRODUCTION', 		     35),
('BUILDING_FW_PHOTOSYSTEMS', 	         'FLAVOR_GROWTH', 		         35),
('BUILDING_FW_PHOTOSYSTEMS', 		     'FLAVOR_MILITARY_TRAINING',      5),
('BUILDING_FW_PHOTOSYSTEMS',             'FLAVOR_TILE_IMPROVEMENT',      20),
('BUILDING_FW_PHOTOSYSTEMS',             'FLAVOR_OFFENSE',               20),
('BUILDING_FW_GENETIC_EVOLUTION',        'FLAVOR_MILITARY_TRAINING',      5),
('BUILDING_FW_GENETIC_EVOLUTION',        'FLAVOR_EXPANSION', 	          5),
('BUILDING_FW_GENETIC_EVOLUTION',    	 'FLAVOR_TILE_IMPROVEMENT', 	 10),
('BUILDING_FW_GENETIC_EVOLUTION', 	     'FLAVOR_PRODUCTION', 		     20),
('BUILDING_FW_GENETIC_EVOLUTION', 	     'FLAVOR_SCIENCE', 		    	 20),
('BUILDING_FW_BIRTHING_PODS', 		     'FLAVOR_GROWTH', 		         75),
('BUILDING_FW_BIRTHING_PODS', 	         'FLAVOR_HAPPINESS', 	         10),
('BUILDING_FW_BIRTHING_PODS', 	         'FLAVOR_SCIENCE', 		         10),
('BUILDING_FW_AI_NETWORK', 				 'FLAVOR_EXPANSION', 	          5),
('BUILDING_FW_AI_NETWORK', 				 'FLAVOR_DEFENSE', 			      5),
('BUILDING_FW_AI_NETWORK', 				 'FLAVOR_TILE_IMPROVEMENT', 	 10),
('BUILDING_FW_AI_NETWORK', 			     'FLAVOR_GREAT_PEOPLE', 		 10),
('BUILDING_FW_AI_NETWORK', 				 'FLAVOR_CITY_DEFENSE', 		 20),
('BUILDING_FW_AI_NETWORK', 				 'FLAVOR_DEFENSE', 		         20),
('BUILDING_FW_BRAIN_UPLOADING',          'FLAVOR_PRODUCTION',            40),
('BUILDING_FW_BRAIN_UPLOADING',          'FLAVOR_SCIENCE',               40),
('BUILDING_FW_BRAIN_UPLOADING',          'FLAVOR_GOLD',                  40),
('BUILDING_FW_BRAIN_UPLOADING',          'FLAVOR_CULTURE',               40),
('BUILDING_FW_ALLOY_FOUNDRY', 			 'FLAVOR_PRODUCTION',            40),
('BUILDING_FW_ALLOY_FOUNDRY', 			 'FLAVOR_MILITARY_TRAINING',     30),
('BUILDING_FW_ALLOY_FOUNDRY', 			 'FLAVOR_TILE_IMPROVEMENT',      20),
('BUILDING_FW_UTILITY_FOG', 		     'FLAVOR_PRODUCTION',            35),
('BUILDING_FW_UTILITY_FOG', 		     'FLAVOR_DEFENSE',               30),
('BUILDING_FW_UTILITY_FOG', 		     'FLAVOR_CITY_DEFENSE',          35),
('BUILDING_FW_UTILITY_FOG', 		     'FLAVOR_EXPANSION',             20),
('BUILDING_FW_UTILITY_FOG', 		     'FLAVOR_HAPPINESS',              5),
('BUILDING_FW_CENTRAL_COMMAND', 		 'FLAVOR_MILITARY_TRAINING',      5),
('BUILDING_FW_CENTRAL_COMMAND', 		 'FLAVOR_EXPANSION', 	          5),
('BUILDING_FW_CENTRAL_COMMAND',     	 'FLAVOR_SPACESHIP', 	          5),
('BUILDING_FW_CENTRAL_COMMAND', 		 'FLAVOR_SCIENCE', 			     10),
('BUILDING_FW_CENTRAL_COMMAND', 		 'FLAVOR_TILE_IMPROVEMENT',      10),
('BUILDING_FW_CENTRAL_COMMAND', 	     'FLAVOR_PRODUCTION', 		     20),
('BUILDING_FW_GENOME_PROJECT_1', 	     'FLAVOR_GROWTH', 		         25),
('BUILDING_FW_GENOME_PROJECT_1', 	     'FLAVOR_SCIENCE', 		         20),
('BUILDING_FW_GENOME_PROJECT_2', 	     'FLAVOR_GROWTH', 		         30),
('BUILDING_FW_GENOME_PROJECT_2', 	     'FLAVOR_SCIENCE', 		         10),
('BUILDING_FW_AI_DATANETWORK_1', 	     'FLAVOR_SCIENCE', 		         10),
('BUILDING_FW_AI_DATANETWORK_1', 	     'FLAVOR_PRODUCTION', 		     10),
('BUILDING_FW_AI_DATANETWORK_1', 	     'FLAVOR_CULTURE', 		         10),
('BUILDING_FW_AI_DATANETWORK_1', 	     'FLAVOR_RELIGION', 		     10),
('BUILDING_FW_AI_DATANETWORK_1', 	     'FLAVOR_GOLD', 		         10),
('BUILDING_FW_AI_DATANETWORK_2', 	     'FLAVOR_SCIENCE', 		         15),
('BUILDING_FW_AI_DATANETWORK_2', 	     'FLAVOR_CULTURE', 		         15),
('BUILDING_FW_AI_DATANETWORK_2', 	     'FLAVOR_GOLD', 		         15),
('BUILDING_FW_AI_DATANETWORK_2', 	     'FLAVOR_GREAT_PEOPLE',          30),
('BUILDING_FW_DEEP_RESOURCE_1', 	     'FLAVOR_EXPANSION',             10),
('BUILDING_FW_DEEP_RESOURCE_1', 	     'FLAVOR_SPACESHIP',             5),
('BUILDING_FW_DEEP_RESOURCE_2', 	     'FLAVOR_EXPANSION',             10),
('BUILDING_FW_DEEP_RESOURCE_2', 	     'FLAVOR_SPACESHIP',             30),
('BUILDING_FW_DEEP_RESOURCE_2', 	     'FLAVOR_OFFENSE',               20),
('BUILDING_FW_DEEP_RESOURCE_2', 	     'FLAVOR_DEFENSE',               20);

