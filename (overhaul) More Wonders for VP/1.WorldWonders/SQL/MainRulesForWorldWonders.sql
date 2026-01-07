--------------------------------------------------------------
-- Automatic changes applied to all new Wonders
-- Dec 9, 2017: Created, Infixo
-- Jan 6, 2020: Improved, adan_eslavo
--------------------------------------------------------------
--============================================--
-- DEFINES
--============================================--
UPDATE Defines SET Value = 50 WHERE Name = 'BALANCE_WORLD_WONDER_SAME_ERA_COST_MODIFIER'; --original: 25
UPDATE Defines SET Value = 30 WHERE Name = 'BALANCE_WORLD_WONDER_PREVIOUS_ERA_COST_MODIFIER'; --original: 15
UPDATE Defines SET Value = 20 WHERE Name = 'BALANCE_WORLD_WONDER_SECOND_PREVIOUS_ERA_COST_MODIFIER'; --original: 10
UPDATE Defines SET Value = 10 WHERE Name = 'BALANCE_WORLD_WONDER_EARLIER_ERA_COST_MODIFIER'; --original: 5

UPDATE Language_en_US
SET Text = 'Additional [ICON_PRODUCTION] Production Cost due to owned World Wonders: [COLOR_NEGATIVE_TEXT]{1_Num}%[ENDCOLOR].[NEWLINE][ICON_PRODUCTION] Production Cost increase factors:[NEWLINE][ICON_BULLET] Wonders from the same Era: [COLOR_NEGATIVE_TEXT]40%.[ENDCOLOR][NEWLINE][ICON_BULLET] Wonders from the previous Era: [COLOR_NEGATIVE_TEXT]35%[ENDCOLOR].[NEWLINE][ICON_BULLET] Wonders from two Eras earlier: [COLOR_NEGATIVE_TEXT]30%.[ENDCOLOR][NEWLINE][ICON_BULLET] Wonders from three Eras earlier or more do not add any penalties.'
WHERE Tag = 'TXT_KEY_WONDER_COST_INCREASE_METRIC';
--============================================--
-- Table with new Wonder Types
--============================================--
CREATE TABLE MWfVPConfig (
	WType			TEXT			NOT NULL,		-- Wonder Type
	WHelp			TEXT					,		-- Tag for dummy buildings
	WDummy			TEXT					,		-- Name for dummy buildings
	WActive			INTEGER			NOT NULL,		-- 1 = Wonder active / 0 = Wonder not active
	WHasSound		INTEGER			NOT NULL,		-- 1 = Quote recorded / 0 = Quote not recorded
	PRIMARY KEY (WType)
);
--============================================--
-- CONFIGURATION
--============================================--
-- Use below table to DISABLE a specific Wonder
-- Change the 1st number to 0 (ZERO) to disable.
-- DO NOT CHANGE ANY OTHER NUMBER!
-- Example:
-- (WType,		WDummy,	WActive,	WHasSound)
-- ('NAZCA',	'None'	1,			1),			-- Nazca is ENABLED
-- ('NAZCA',	'None'	0,			1),			-- Nazca is DISABLED
--------------------------------------------------------------
INSERT INTO MWfVPConfig	
			(WType,						WHelp,	WDummy,		WActive,	WHasSound)
VALUES		('ALTAMIRA',				'',		'',			1,			1),		-- Cave of Altamira										(@pineappledan)
			('GGANTIJA',				'',		'',			1,			1),		-- Ggantija												(@pineappledan)
			('GOEBEKLI_TEPE',			'',		'',			1,			1),		-- Goebekli Tepe										(@pineappledan)
			('KUK',						'',		'',			1,			1),		-- Kuk Swamp											(@pineappledan)
			('MAJORVILLE',				'',		'',			1,			1),		-- Majorville Medicine Wheel/Iniskim Umaapi				(@pineappledan)
			('MOHENJO_DARO',			'',		'',			1,			1),		-- Mohenjo-Daro											(@pineappledan)
			('SKARA_BRAE',				'',		'',			1,			1),		-- Skara Brae											(@pineappledan)
			-------------------ANCIENT---------------------------------------------------------------------------------------------------------------------
			('KARNAK',					'',		'',			1,			1),		-- Karnak Temple										(@pineappledan)
			('NAZCA',					'',		'',			1,			1),		-- Nazca Lines											(@pineappledan)
			('WIELICZKA',				'',		'',			1,			1),		-- Wieliczka Salt Mine									(@pineappledan)
			('THONG_HAI_HIN',			'',		'',			1,			1),		-- Plain of Jars/Thong Hai Hin							(@hokath)/man version copied
			-------------------CLASSICAL-------------------------------------------------------------------------------------------------------------------
			('MALWIYA',					'',		'',			1,			1),		-- Malwiya Minaret (Great Mosque of Samarra)			(@pineappledan)
			('GATE_OF_SUN',				'',		'',			1,			1),		-- Gate of the Sun										(@pineappledan)
			('BAMYAN',					'',		'',			1,			1),		-- Buddhas of Bamiyan									(@pineappledan)
			('EL_GHRIBA',				'',		'',			1,			1),		-- El Ghriba Synagougue									(@pineappledan)
			('ETCHMIADZIN',				'',		'',			1,			1),		-- Etchmiadzin Cathedral								(@pineappledan)
			('SIGIRIYA',				'',		'',			1,			1),		-- Sirigiya												(@hokath)/man version copied
			('CHAND_BAORI',				'',		'',			1,			1),		-- Chand Baori											(@pineappledan)
			('SONGYUE',					'',		'',			1,			1),		-- Songyue Pagoda										(@hokath)/man version copied
			-------------------MEDIEVAL--------------------------------------------------------------------------------------------------------------------
			('NABAWI',					'',		'',			1,			1),		-- Prophet's Mosque/Al-Masjid an-Nabawi					(@pineappledan)
			('MORAY',					'',		'',			1,			1),		-- Moray												(@hokath)/man version copied
			('LAVAUX',					'',		'',			1,			1),		-- Lavaux												(@pineappledan)
			('WARTBURG',				'',		'',			1,			1),		-- Wartburg												(@pineappledan)
			('GREAT_ZIMBABWE',			'',		'',			1,			1),		-- Great Zimbabwe										(@pineappledan)
			('FALUN',					'',		'',			1,			1),		-- Falun Mine											(@pineappledan)
			('AHU',						'',		'',			1,			1),		-- Ahu Tongariki										(@pineappledan)
			('DAMASCUS',				'',		'',			1,			1),		-- Forge of Damascus									(@pineappledan)
			('SHWEDAGON',				'',		'',			1,			1),		-- Shwedagon Pagoda/Golden Dagon Pagoda					(@pineappledan)
			('HOSPITALLER',				'',		'',			1,			1),		-- Knights Hospitaller/Hospital of St. John				(@hokath)/man version copied
			('MICHEL',					'',		'',			1,			1),		-- Mont-Saint-Michel									(@pineappledan)
			('BUYUK_HAN',				'',		'',			1,			1),		-- Buyuk Han/Great Inn									(@hokath)/man version copied
			('ITSUKUSHIMA',				'',		'',			1,			1),		-- Itsukushima Shrine									(@pineappledan)
			('QALHAT',					'',		'',			1,			1),		-- Qalhat												(@pineappledan)
			('CHEVALIERS',				'',		'',			1,			1),		-- Krak des Chevaliers									(@pineappledan)
			('TLACHIHUALTEPETL',		'',		'',			1,			1),		-- Tlachihualtepetl										(@hokath)/man version copied
			-------------------RENAISSANCE-----------------------------------------------------------------------------------------------------------------
			('BENHADDOU',				'',		'',			1,			1),		-- Ait Benhaddou										(@pineappledan)
			('KILWA_KISIWANI',			'',		'',			1,			1),		-- Kilwa Kisiwani										(@pineappledan)
			('ST_PETERS',				'',		'',			1,			1),		-- Papal Basilica of St. Peter in the Vatican			(@pineappledan)
			('KINKAKU_JI',				'',		'',			1,			1),		-- Golden Pavilion/Kikaku-Ji							(@pineappledan)
			('MARAE_ARAHURAHU',			'',		'',			1,			1),		-- Marae Arahurahu										(@pineappledan)
			('HARMANDIR',				'',		'',			1,			1),		-- Harmandir Sahib										(@hokath)/man version copied
			('OLD_BRIDGE',				'',		'',			1,			1),		-- Old Bridge											(@pineappledan)
			('MEENAKSHI',				'',		'',			1,			1),		-- Meenakshi Temple										(@pineappledan)
			('PETERHOF',				'',		'',			1,			1),		-- Peterhof Palace										(@pineappledan)
			('BAKKEN',					'',		'',			1,			1),		-- Bakken												(@pineappledan)
			('HOUSE_OF_TRADE',			'',		'',			1,			1),		-- House of Trade of the Indies/Casa de Contratación	(@pineappledan)
			('SOLOVIETSKY',				'',		'',			1,			1),		-- Solovietsky Monastery								(@pineappledan)
			('TEMBLEQUE',				'',		'',			1,			1),		-- Tembleque Aqueduct/Aqueduct del Padre Tembleque		(@hokath)/man version copied
			-------------------ENLIGHTENMENT---------------------------------------------------------------------------------------------------------------
			--('BOLSHOI',				'',		'',			1,			1),		-- Bolshoi Theater
			-------------------INDUSTRIAL------------------------------------------------------------------------------------------------------------------
			('MUSEUM_ISLAND',			'',		'',			1,			1),		-- Museum Island										(@pineappledan)
			('SIKU_QUANSHU',			'',		'',			1,			1),		-- Siku Quanshu											(@pineappledan)
			('BROOKLYN',				'',		'',			1,			1),		-- Brooklyn Bridge										(@pineappledan)
			('SIBERIAN_RAILWAY',		'',		'',			1,			1),		-- Trans-Siberian Railway								(@pineappledan)
			('PANAMA_CANAL',			'',		'',			1,			1),		-- Panama Canal											(@pineappledan)
			('ZOCALO',					'',		'',			1,			1),		-- Zocalo												(@pineappledan)
			('KEW_GARDENS',				'',		'',			1,			1),		-- Kew Gardens											(@pineappledan)
			('MONTE_CARLO',				'',		'',			1,			1),		-- Monte Carlo Casino									(@pineappledan)
			('RUHR_VALLEY',				'',		'',			1,			1),		-- Ruhr Valley											(@pineappledan)/man version copied
			('DARJEELING',				'',		'',			1,			1),		-- Darjeeling Himalayan Railway							(@pineappledan)
			('BANFF',					'',		'',			1,			1),		-- Banff Springs Hotel									(@pineappledan)
			('ORSZAGHAZ',				'',		'',			1,			1),		-- Orszaghaz											(@pineappledan)
			-------------------MODERN----------------------------------------------------------------------------------------------------------------------
			('POLAR_EXPEDITION',		'',		'',			1,			1),		-- Polar Expedition										(@pineappledan)/man version copied
			('AKIHABARA',				'',		'',			1,			1),		-- Akihabara Trade Center								(@pineappledan)/man version copied
			('ROCKEFELLER',				'',		'',			1,			1),		-- Rockefeller Center									(@pineappledan)/man version copied
			('AUTOBAHN',				'',		'',			1,			1),		-- Autobahn												(@hokath)/man version copied
			('INTERSTATE',				'',		'',			1,			1),		-- Interstate Highway System							(@hokath)/man version copied
			('HOLLYWOOD',				'',		'',			1,			1),		-- Hollywood											(@hokath)/man version copied
			('CONCORDE',				'',		'',			1,			1),		-- Concorde												(@hokath)/man version copied
			('SANBO',					'',		'',			1,			1),		-- Sanbo Honbu											(@pineappledan)/man version copied
			('RUSHMORE',				'',		'',			1,			1),		-- Mount Rushmore										(@pineappledan)/man version copied
			-------------------ATOMIC----------------------------------------------------------------------------------------------------------------------
			('GREAT_HALL',				'',		'',			1,			1),		-- Great Hall of the People								(@hokath)/man version copied
			('HABITAT',					'',		'',			1,			1),		-- Habitat-67											(@hokath)/man version copied
			--('MARACANA',				'',		'',			1,			0),		-- Maracana
			('VOSTOK',					'',		'',			1,			1),		-- Vostok Station										(@hokath)/man version copied
			('MILESTII_MICI',			'',		'',			1,			1),		-- Milestii Mici Winery									(@hokath)/man version copied
			('TEHRAN_FACILITY',			'',		'',			1,			1),		-- (Tehran) Nuclear Research Center						(@hokath)/man version copied
			('JFK',						'',		'',			1,			1),		-- JFK Space Center										(@hokath)/man version copied
			('SPUTNIK',					'',		'',			1,			1),		-- Sputnik Program										(@hokath)/man version copied
			('ANITKABIR',				'',		'',			1,			1),		-- Anitkabir											(@hokath)/man version copied
			('THULE',					'',		'',			1,			1),		-- Thule Airbase										(@hokath)/man version copied
			('WHITE_SANDS',				'',		'',			1,			1),		-- White Sands Missile Range							(@pineappledan)/man version copied
			('MILLAU',					'',		'',			1,			1),		-- Millau Viaduct										(@pineappledan)/man version copied
			('REVOLUTIONARY_MUSEUM',	'',		'',			1,			1),		-- Revolutionary Museum/Kumsusan Palace					(@hokath)/man version copied
			('ARECIBO',					'',		'',			1,			1),		-- Arecibo Observatory									(@pineappledan)/man version copied
			-------------------INFORMATION-A---------------------------------------------------------------------------------------------------------------
			--('NORTHERN_LIGHT',		'',		'',			1,			0),		-- Northern Light Cathedral
			('SEED_VAULT',				'',		'',			1,			1),		-- Svalbard Global Seed Vault							(@hokath)/man version copied
			('THREE_GORGES_DAM',		'',		'',			1,			1),		-- Three Gorges Dam										(@hokath)/man version copied
			('JUMEIRAH',				'',		'',			1,			1),		-- Palm Jumeirah										(@pineappledan)/man version copied
			('TAIPEI',					'',		'',			1,			1),		-- Taipei 101											(@pineappledan)/man version copied
			--('PETRONAS',				'',		'',			1,			0);		-- Petronas Towers
			-------------------INFORMATION-B---------------------------------------------------------------------------------------------------------------
			('CURIOSITY',				'',		'',			1,			1),		-- Curiosity Rover										(@hokath)/man version copied
			--('SKYTREE',				'',		'',			1,			0),		-- Skytree
			('GPS',						'',		'',			1,			1);		-- Global Positioning System							(@hokath)/man version copied
			--('ICE_HOTEL',				'',		'',			1,			0),		-- Ice Hotel
			-------------------INFORMATION-C---------------------------------------------------------------------------------------------------------------
			--('MARINA_BAY_SANDS',		'',		'',			1,			0),		-- Marina Bay Sands
			--('ONKALO',				'',		'',			1,			0),		-- Onkalo Nuclear Waste Repository
			--('ITER',					'',		'',			1,			0),		-- ITER
			--('HUMANKIND',				'',		'',			1,			0);		-- Museum of Humankind
--============================================--
-- WONDERS INITIAL CONFIGURATION
--============================================--
-- BuildingClasses
INSERT INTO BuildingClasses 
			(Type,						Description,					DefaultBuilding,		MaxGlobalInstances)
SELECT		'BUILDINGCLASS_'||WType,	'TXT_KEY_BUILDING_'||WType,		'BUILDING_'||WType,		1
FROM MWfVPConfig;
--------------------------------------------------------------
-- Buildings
-- MinAreaSize - change to 10 for Coastal Wonders!
-- Set Cost = -1 and later apply proper value for enabled buildings
-- GreatWorkCount defaults to 0, PrereqTech defaults to NULL
INSERT INTO Buildings
			(Type,               BuildingClass,           Description,                Civilopedia,							Help,									Quote,								ThemingBonusHelp, Cost, FaithCost, NukeImmune, HurryCostModifier, MinAreaSize, ConquestProb, IconAtlas,							PortraitIndex, WonderSplashImage,				WonderSplashAnchor)
SELECT		'BUILDING_'||WType, 'BUILDINGCLASS_'||WType, 'TXT_KEY_BUILDING_'||WType, 'TXT_KEY_BUILDING_'||WType||'_PEDIA',	'TXT_KEY_BUILDING_'||WType||'_HELP',	'TXT_KEY_WONDER_'||WType||'_QUOTE', NULL,             1,    0,         1,          -5,                -1,          100,          'ATLAS_MORE_WONDERS_'||WType,		0,             'Wonder_'||WType||'_splash.dds', 'R,T'
FROM MWfVPConfig;
--------------------------------------------------------------
-- Panama Canal is already in the game
UPDATE Buildings SET IconAtlas = 'BW_ATLAS_2', PortraitIndex = 25, WonderSplashImage = 'WonderConceptPanamaCanal.dds' WHERE Type = 'BUILDING_PANAMA_CANAL';
--------------------------------------------------------------
-- Also, for reasons, an icon for St. Peter's Basilica is available
UPDATE Buildings SET IconAtlas = 'EXPANSION_SCEN_WONDER_ATLAS', PortraitIndex = 6 WHERE Type = 'BUILDING_ST_PETERS';
--------------------------------------------------------------
-- Civilization_BuildingClassOverrides
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType,			BuildingClassType,			BuildingType)
SELECT		'CIVILIZATION_BARBARIAN',	'BUILDINGCLASS_'||WType,	NULL 
FROM MWfVPConfig;

INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType,		BuildingClassType,			BuildingType)
SELECT		'CIVILIZATION_MINOR',	'BUILDINGCLASS_'||WType,	NULL 
FROM MWfVPConfig;
--------------------------------------------------------------
-- Building_Flavors
-- Let's start with a default 20, can change later for specific Wonders
INSERT INTO Building_Flavors 
			(BuildingType,		FlavorType,			Flavor)
SELECT		'BUILDING_'||WType, 'FLAVOR_WONDER',	20
FROM MWfVPConfig;
--------------------------------------------------------------
-- Audio_Sounds
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 						LoadType)
SELECT		'SND_WONDER_SPEECH_'||WType||'_MAN',		'wonder_'||WType||'_man',		'DynamicResident'
FROM MWfVPConfig WHERE WHasSound = 1;

INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 						LoadType)
SELECT		'SND_WONDER_SPEECH_'||WType||'_WOMAN',		'wonder_'||WType||'_woman',		'DynamicResident'
FROM MWfVPConfig WHERE WHasSound = 1;

INSERT INTO Audio_Sounds 
			(SoundID, 													Filename, 										LoadType)
VALUES		('SND_WONDER_SPEECH_AMERICA_SLATER_MILL_MAN', 				'wonder_america_slater_mill_man', 				'DynamicResident'), -- (@pineappledan)
			('SND_WONDER_SPEECH_AMERICA_SLATER_MILL_WOMAN',				'wonder_america_slater_mill_woman', 			'DynamicResident'), -- (@pineappledan)/man version copied
			('SND_WONDER_SPEECH_AMERICA_SMITHSONIAN_INSTITUTION_MAN', 	'wonder_america_smithsonian_institution_man', 	'DynamicResident'), -- (@hokath)
			('SND_WONDER_SPEECH_AMERICA_SMITHSONIAN_INSTITUTION_WOMAN',	'wonder_america_smithsonian_institution_woman', 'DynamicResident'), -- (@hokath)/man version copied
			('SND_WONDER_SPEECH_AMERICA_WEST_POINT_MAN', 				'wonder_america_west_point_man', 				'DynamicResident'), -- (@hokath)
			('SND_WONDER_SPEECH_AMERICA_WEST_POINT_WOMAN',				'wonder_america_west_point_woman', 				'DynamicResident'), -- (@hokath)/man version copied
			('SND_WONDER_SPEECH_BLETCHLEY_MAN', 						'wonder_bletchley_man', 						'DynamicResident'), -- (@pineappledan)
			('SND_WONDER_SPEECH_BLETCHLEY_WOMAN',						'wonder_bletchley_woman', 						'DynamicResident'), -- (@pineappledan)/man version copied
			('SND_WONDER_SPEECH_CERN_MAN', 								'wonder_cern_man', 								'DynamicResident'), -- (@pineappledan)
			('SND_WONDER_SPEECH_CERN_WOMAN',							'wonder_cern_woman', 							'DynamicResident'), -- (@pineappledan)/man version copied
			('SND_WONDER_SPEECH_EMPIRE_STATE_MAN', 						'wonder_empire_state_man', 						'DynamicResident'), -- (@pineappledan)
			('SND_WONDER_SPEECH_EMPIRE_STATE_WOMAN',					'wonder_empire_state_woman', 					'DynamicResident'), -- (@pineappledan)/man version copied
			('SND_WONDER_SPEECH_NALANDA_MAN', 							'wonder_nalanda_man', 							'DynamicResident'), -- (@hokath)
			('SND_WONDER_SPEECH_NALANDA_WOMAN',							'wonder_nalanda_woman', 						'DynamicResident'), -- (@hokath)/man version copied
			('SND_WONDER_SPEECH_ROMAN_FORUM_MAN', 						'wonder_roman_forum_man', 						'DynamicResident'), -- (@pineappledan)
			('SND_WONDER_SPEECH_ROMAN_FORUM_WOMAN',						'wonder_roman_forum_woman', 					'DynamicResident'), -- (@pineappledan)/man version copied
			('SND_WONDER_SPEECH_SOHO_FOUNDRY_MAN', 						'wonder_soho_foundry_man', 						'DynamicResident'), -- (@pineappledan)
			('SND_WONDER_SPEECH_SOHO_FOUNDRY_WOMAN',					'wonder_soho_foundry_woman', 					'DynamicResident'), -- (@pineappledan)/man version copied
			('SND_WONDER_SPEECH_SUMMER_PALACE_MAN', 					'wonder_summer_palace_man', 					'DynamicResident'), -- (@pineappledan)
			('SND_WONDER_SPEECH_SUMMER_PALACE_WOMAN',					'wonder_summer_palace_woman', 					'DynamicResident'), -- (@pineappledan)/man version copied
			('SND_WONDER_SPEECH_CRYSTAL_PALACE_MAN', 					'wonder_crystal_palace_man', 					'DynamicResident'), -- (@pineappledan)
			('SND_WONDER_SPEECH_CRYSTAL_PALACE_WOMAN',					'wonder_crystal_palace_woman', 					'DynamicResident'), -- (@pineappledan)/man version copied
			('SND_WONDER_SPEECH_GRAND_CANAL_MAN', 						'wonder_grand_canal_man', 						'DynamicResident'), -- (@pineappledan)
			('SND_WONDER_SPEECH_GRAND_CANAL_WOMAN',						'wonder_grand_canal_woman', 					'DynamicResident'), -- (@pineappledan)/man version copied
			('SND_WONDER_SPEECH_MENIN_GATE_MAN', 						'wonder_menin_gate_man', 						'DynamicResident'), -- (@pineappledan)
			('SND_WONDER_SPEECH_MENIN_GATE_WOMAN',						'wonder_menin_gate_woman', 						'DynamicResident'), -- (@pineappledan)/man version copied
			('SND_WONDER_SPEECH_OLYMPIC_VILLAGE_MAN', 					'wonder_olympic_village_man', 					'DynamicResident'), -- (@pineappledan)
			('SND_WONDER_SPEECH_OLYMPIC_VILLAGE_WOMAN',					'wonder_olympic_village_woman', 				'DynamicResident'); -- (@pineappledan)/man version copied

INSERT INTO Audio_Sounds 
			(SoundID, 													Filename, 										LoadType)
VALUES		('SND_WONDER_SPEECH_ARK_OF_THE_COVENANT_MAN', 				'art_ark_of_the_covenant_man', 					'DynamicResident'),
			('SND_WONDER_SPEECH_ARK_OF_THE_COVENANT_WOMAN', 			'art_ark_of_the_covenant_woman',				'DynamicResident'),
			('SND_WONDER_SPEECH_HOLY_LANCE_MAN', 						'art_holy_lance_man', 							'DynamicResident'),
			('SND_WONDER_SPEECH_HOLY_LANCE_WOMAN', 						'art_holy_lance_woman',							'DynamicResident'),
			('SND_WONDER_SPEECH_HOLY_CROWN_MAN', 						'art_holy_crown_man', 							'DynamicResident'),
			('SND_WONDER_SPEECH_HOLY_CROWN_WOMAN', 						'art_holy_crown_woman',							'DynamicResident');
--------------------------------------------------------------
-- Audio_2DSounds
INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 									SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
SELECT		'AS2D_WONDER_SPEECH_'||WType||'_MAN',		'SND_WONDER_SPEECH_'||WType||'_MAN',		'GAME_SPEECH', 	80, 		170, 		0, 			0
FROM MWfVPConfig WHERE WHasSound = 1;

INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 									SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
SELECT		'AS2D_WONDER_SPEECH_'||WType||'_WOMAN',		'SND_WONDER_SPEECH_'||WType||'_WOMAN',		'GAME_SPEECH', 	80, 		170, 		0, 			0
FROM MWfVPConfig WHERE WHasSound = 1;

INSERT INTO Audio_2DSounds 
			(ScriptID, 														SoundID, 													SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_WONDER_SPEECH_AMERICA_SLATER_MILL_MAN', 					'SND_WONDER_SPEECH_AMERICA_SLATER_MILL_MAN', 				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_AMERICA_SLATER_MILL_WOMAN', 				'SND_WONDER_SPEECH_AMERICA_SLATER_MILL_WOMAN',				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_AMERICA_SMITHSONIAN_INSTITUTION_MAN', 		'SND_WONDER_SPEECH_AMERICA_SMITHSONIAN_INSTITUTION_MAN', 	'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_AMERICA_SMITHSONIAN_INSTITUTION_WOMAN',	'SND_WONDER_SPEECH_AMERICA_SMITHSONIAN_INSTITUTION_WOMAN',	'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_AMERICA_WEST_POINT_MAN', 					'SND_WONDER_SPEECH_AMERICA_WEST_POINT_MAN', 				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_AMERICA_WEST_POINT_WOMAN', 				'SND_WONDER_SPEECH_AMERICA_WEST_POINT_WOMAN',				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_BLETCHLEY_MAN', 							'SND_WONDER_SPEECH_BLETCHLEY_MAN', 							'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_BLETCHLEY_WOMAN', 							'SND_WONDER_SPEECH_BLETCHLEY_WOMAN',						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_CERN_MAN', 								'SND_WONDER_SPEECH_CERN_MAN', 								'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_CERN_WOMAN', 								'SND_WONDER_SPEECH_CERN_WOMAN',								'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_EMPIRE_STATE_MAN', 						'SND_WONDER_SPEECH_EMPIRE_STATE_MAN', 						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_EMPIRE_STATE_WOMAN', 						'SND_WONDER_SPEECH_EMPIRE_STATE_WOMAN',						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_NALANDA_MAN', 								'SND_WONDER_SPEECH_NALANDA_MAN', 							'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_NALANDA_WOMAN', 							'SND_WONDER_SPEECH_NALANDA_WOMAN',							'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_ROMAN_FORUM_MAN', 							'SND_WONDER_SPEECH_ROMAN_FORUM_MAN', 						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_ROMAN_FORUM_WOMAN', 						'SND_WONDER_SPEECH_ROMAN_FORUM_WOMAN',						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_SOHO_FOUNDRY_MAN', 						'SND_WONDER_SPEECH_SOHO_FOUNDRY_MAN', 						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_SOHO_FOUNDRY_WOMAN', 						'SND_WONDER_SPEECH_SOHO_FOUNDRY_WOMAN',						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_SUMMER_PALACE_MAN', 						'SND_WONDER_SPEECH_SUMMER_PALACE_MAN', 						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_SUMMER_PALACE_WOMAN', 						'SND_WONDER_SPEECH_SUMMER_PALACE_WOMAN',					'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_CRYSTAL_PALACE_MAN', 						'SND_WONDER_SPEECH_CRYSTAL_PALACE_MAN', 					'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_CRYSTAL_PALACE_WOMAN', 					'SND_WONDER_SPEECH_CRYSTAL_PALACE_WOMAN',					'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_MENIN_GATE_MAN', 							'SND_WONDER_SPEECH_MENIN_GATE_MAN', 						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_MENIN_GATE_WOMAN', 						'SND_WONDER_SPEECH_MENIN_GATE_WOMAN',						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_GRAND_CANAL_MAN', 							'SND_WONDER_SPEECH_GRAND_CANAL_MAN', 						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_GRAND_CANAL_WOMAN', 						'SND_WONDER_SPEECH_GRAND_CANAL_WOMAN',						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_OLYMPIC_VILLAGE_MAN', 						'SND_WONDER_SPEECH_OLYMPIC_VILLAGE_MAN', 					'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_OLYMPIC_VILLAGE_WOMAN', 					'SND_WONDER_SPEECH_OLYMPIC_VILLAGE_WOMAN',					'GAME_SPEECH', 	80, 		170, 		0, 			0);

INSERT INTO Audio_2DSounds 
			(ScriptID, 														SoundID, 													SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_WONDER_SPEECH_ARK_OF_THE_COVENANT_MAN', 					'SND_WONDER_SPEECH_ARK_OF_THE_COVENANT_MAN', 				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_ARK_OF_THE_COVENANT_WOMAN', 				'SND_WONDER_SPEECH_ARK_OF_THE_COVENANT_WOMAN',				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_HOLY_LANCE_MAN', 							'SND_WONDER_SPEECH_HOLY_LANCE_MAN', 						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_HOLY_LANCE_WOMAN', 						'SND_WONDER_SPEECH_HOLY_LANCE_WOMAN',						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_HOLY_CROWN_MAN', 							'SND_WONDER_SPEECH_HOLY_CROWN_MAN', 						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_HOLY_CROWN_WOMAN', 						'SND_WONDER_SPEECH_HOLY_CROWN_WOMAN',						'GAME_SPEECH', 	80, 		170, 		0, 			0);
------------------------------
-- Buildings (Quotes)
	-- Man
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AHU_MAN'								WHERE Type = 'BUILDING_AHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AKIHABARA_MAN'							WHERE Type = 'BUILDING_AKIHABARA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ALTAMIRA_MAN'							WHERE Type = 'BUILDING_ALTAMIRA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ANITKABIR_MAN'							WHERE Type = 'BUILDING_ANITKABIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ARECIBO_MAN'							WHERE Type = 'BUILDING_ARECIBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AUTOBAHN_MAN'							WHERE Type = 'BUILDING_AUTOBAHN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BAKKEN_MAN'							WHERE Type = 'BUILDING_BAKKEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BAMYAN_MAN'							WHERE Type = 'BUILDING_BAMYAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BANFF_MAN'								WHERE Type = 'BUILDING_BANFF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BENHADDOU_MAN'							WHERE Type = 'BUILDING_BENHADDOU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BROOKLYN_MAN'							WHERE Type = 'BUILDING_BROOKLYN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BUYUK_HAN_MAN'							WHERE Type = 'BUILDING_BUYUK_HAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CHAND_BAORI_MAN'						WHERE Type = 'BUILDING_CHAND_BAORI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CHEVALIERS_MAN'						WHERE Type = 'BUILDING_CHEVALIERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CONCORDE_MAN'							WHERE Type = 'BUILDING_CONCORDE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CURIOSITY_MAN'							WHERE Type = 'BUILDING_CURIOSITY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_DAMASCUS_MAN'							WHERE Type = 'BUILDING_DAMASCUS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_DARJEELING_MAN'						WHERE Type = 'BUILDING_DARJEELING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_EL_GHRIBA_MAN'							WHERE Type = 'BUILDING_EL_GHRIBA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ETCHMIADZIN_MAN'						WHERE Type = 'BUILDING_ETCHMIADZIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_FALUN_MAN'								WHERE Type = 'BUILDING_FALUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GATE_OF_SUN_MAN'						WHERE Type = 'BUILDING_GATE_OF_SUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GGANTIJA_MAN'							WHERE Type = 'BUILDING_GGANTIJA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GOEBEKLI_TEPE_MAN'						WHERE Type = 'BUILDING_GOEBEKLI_TEPE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GPS_MAN'								WHERE Type = 'BUILDING_GPS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GREAT_HALL_MAN'						WHERE Type = 'BUILDING_GREAT_HALL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GREAT_ZIMBABWE_MAN'					WHERE Type = 'BUILDING_GREAT_ZIMBABWE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_HABITAT_MAN'							WHERE Type = 'BUILDING_HABITAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_HARMANDIR_MAN'							WHERE Type = 'BUILDING_HARMANDIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_HOLLYWOOD_MAN'							WHERE Type = 'BUILDING_HOLLYWOOD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_HOSPITALLER_MAN'						WHERE Type = 'BUILDING_HOSPITALLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_HOUSE_OF_TRADE_MAN'					WHERE Type = 'BUILDING_HOUSE_OF_TRADE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_INTERSTATE_MAN'						WHERE Type = 'BUILDING_INTERSTATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ITSUKUSHIMA_MAN'						WHERE Type = 'BUILDING_ITSUKUSHIMA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_JFK_MAN'								WHERE Type = 'BUILDING_JFK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_JUMEIRAH_MAN'							WHERE Type = 'BUILDING_JUMEIRAH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KARNAK_MAN'							WHERE Type = 'BUILDING_KARNAK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KEW_GARDENS_MAN'						WHERE Type = 'BUILDING_KEW_GARDENS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KILWA_KISIWANI_MAN'					WHERE Type = 'BUILDING_KILWA_KISIWANI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KINKAKU_JI_MAN'						WHERE Type = 'BUILDING_KINKAKU_JI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KUK_MAN'								WHERE Type = 'BUILDING_KUK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_LAVAUX_MAN'							WHERE Type = 'BUILDING_LAVAUX' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MAJORVILLE_MAN'						WHERE Type = 'BUILDING_MAJORVILLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MALWIYA_MAN'							WHERE Type = 'BUILDING_MALWIYA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MARAE_MAN'								WHERE Type = 'BUILDING_MARAE_ARAHURAHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MEENAKSHI_MAN'							WHERE Type = 'BUILDING_MEENAKSHI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MICHEL_MAN'							WHERE Type = 'BUILDING_MICHEL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MILESTII_MICI_MAN'						WHERE Type = 'BUILDING_MILESTII_MICI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MILLAU_MAN'							WHERE Type = 'BUILDING_MILLAU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MOHENJO_DARO_MAN'						WHERE Type = 'BUILDING_MOHENJO_DARO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MONTE_CARLO_MAN'						WHERE Type = 'BUILDING_MONTE_CARLO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MORAY_MAN'								WHERE Type = 'BUILDING_MORAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MUSEUM_ISLAND_MAN'						WHERE Type = 'BUILDING_MUSEUM_ISLAND' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_NABAWI_MAN'							WHERE Type = 'BUILDING_NABAWI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_NAZCA_MAN'								WHERE Type = 'BUILDING_NAZCA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_OLD_BRIDGE_MAN'						WHERE Type = 'BUILDING_OLD_BRIDGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ORSZAGHAZ_MAN'							WHERE Type = 'BUILDING_ORSZAGHAZ' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_PANAMA_CANAL_MAN'						WHERE Type = 'BUILDING_PANAMA_CANAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_PETERHOF_MAN'							WHERE Type = 'BUILDING_PETERHOF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_POLAR_EXPEDITION_MAN'					WHERE Type = 'BUILDING_POLAR_EXPEDITION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_QALHAT_MAN'							WHERE Type = 'BUILDING_QALHAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_REVOLUTIONARY_MUSEUM_MAN'				WHERE Type = 'BUILDING_REVOLUTIONARY_MUSEUM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ROCKEFELLER_MAN'						WHERE Type = 'BUILDING_ROCKEFELLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_RUHR_VALLEY_MAN'						WHERE Type = 'BUILDING_RUHR_VALLEY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_RUSHMORE_MAN'							WHERE Type = 'BUILDING_RUSHMORE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SANBO_MAN'								WHERE Type = 'BUILDING_SANBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SEED_VAULT_MAN'						WHERE Type = 'BUILDING_SEED_VAULT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SHWEDAGON_MAN'							WHERE Type = 'BUILDING_SHWEDAGON' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SIBERIAN_RAILWAY_MAN'					WHERE Type = 'BUILDING_SIBERIAN_RAILWAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SIGIRIYA_MAN'							WHERE Type = 'BUILDING_SIGIRIYA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SIKU_QUANSHU_MAN'						WHERE Type = 'BUILDING_SIKU_QUANSHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SKARA_BRAE_MAN'						WHERE Type = 'BUILDING_SKARA_BRAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SOLOVIETSKY_MAN'						WHERE Type = 'BUILDING_SOLOVIETSKY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SONGYUE_MAN'							WHERE Type = 'BUILDING_SONGYUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SPUTNIK_MAN'							WHERE Type = 'BUILDING_SPUTNIK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ST_PETERS_MAN'							WHERE Type = 'BUILDING_ST_PETERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_TAIPEI_MAN'							WHERE Type = 'BUILDING_TAIPEI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_TEHRAN_FACILITY_MAN'					WHERE Type = 'BUILDING_TEHRAN_FACILITY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_TEMBLEQUE_MAN'							WHERE Type = 'BUILDING_TEMBLEQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_THONG_HAI_HIN_MAN'						WHERE Type = 'BUILDING_THONG_HAI_HIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_THREE_GORGES_DAM_MAN'					WHERE Type = 'BUILDING_THREE_GORGES_DAM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_THULE_MAN'								WHERE Type = 'BUILDING_THULE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_TLACHIHUALTEPETL_MAN'					WHERE Type = 'BUILDING_TLACHIHUALTEPETL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_VOSTOK_MAN'							WHERE Type = 'BUILDING_VOSTOK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_WARTBURG_MAN'							WHERE Type = 'BUILDING_WARTBURG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_WIELICZKA_MAN'							WHERE Type = 'BUILDING_WIELICZKA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_WHITE_SANDS_MAN'						WHERE Type = 'BUILDING_WHITE_SANDS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ZOCALO_MAN'							WHERE Type = 'BUILDING_ZOCALO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AMERICA_SLATER_MILL_MAN'				WHERE Type = 'BUILDING_SLATER_MILL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AMERICA_SMITHSONIAN_INSTITUTION_MAN'	WHERE Type = 'BUILDING_SMITHSONIAN_INSTITUTION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AMERICA_WEST_POINT_MAN'				WHERE Type = 'BUILDING_WEST_POINT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BLETCHLEY_MAN'							WHERE Type = 'BUILDING_BLETCHLEY_PARK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CERN_MAN'								WHERE Type = 'BUILDING_CERN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_EMPIRE_STATE_MAN'						WHERE Type = 'BUILDING_EMPIRE_STATE_BUILDING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_NALANDA_MAN'							WHERE Type = 'BUILDING_NALANDA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ROMAN_FORUM_MAN'						WHERE Type = 'BUILDING_ROMAN_FORUM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SOHO_FOUNDRY_MAN'						WHERE Type = 'BUILDING_SOHO_FOUNDRY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SUMMER_PALACE_MAN'						WHERE Type = 'BUILDING_SUMMER_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CRYSTAL_PALACE_MAN'					WHERE Type = 'BUILDING_CRYSTAL_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GRAND_CANAL_MAN'						WHERE Type = 'BUILDING_GRAND_CANAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MENIN_GATE_MAN'						WHERE Type = 'BUILDING_MENIN_GATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_OLYMPIC_VILLAGE_MAN'					WHERE Type = 'BUILDING_OLYMPIC_VILLAGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	
	------------------------------
	-- Woman
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AHU_WOMAN'								WHERE Type = 'BUILDING_AHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AKIHABARA_WOMAN'						WHERE Type = 'BUILDING_AKIHABARA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ALTAMIRA_WOMAN'						WHERE Type = 'BUILDING_ALTAMIRA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ANITKABIR_WOMAN'						WHERE Type = 'BUILDING_ANITKABIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ARECIBO_WOMAN'							WHERE Type = 'BUILDING_ARECIBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AUTOBAHN_WOMAN'						WHERE Type = 'BUILDING_AUTOBAHN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BAKKEN_WOMAN'							WHERE Type = 'BUILDING_BAKKEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BAMYAN_WOMAN'							WHERE Type = 'BUILDING_BAMYAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BANFF_WOMAN'							WHERE Type = 'BUILDING_BANFF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BENHADDOU_WOMAN'						WHERE Type = 'BUILDING_BENHADDOU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BROOKLYN_WOMAN'						WHERE Type = 'BUILDING_BROOKLYN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BUYUK_HAN_WOMAN'						WHERE Type = 'BUILDING_BUYUK_HAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CHAND_BAORI_WOMAN'						WHERE Type = 'BUILDING_CHAND_BAORI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CHEVALIERS_WOMAN'						WHERE Type = 'BUILDING_CHEVALIERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CONCORDE_WOMAN'						WHERE Type = 'BUILDING_CONCORDE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CURIOSITY_WOMAN'						WHERE Type = 'BUILDING_CURIOSITY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_DAMASCUS_WOMAN'						WHERE Type = 'BUILDING_DAMASCUS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_DARJEELING_WOMAN'						WHERE Type = 'BUILDING_DARJEELING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_EL_GHRIBA_WOMAN'						WHERE Type = 'BUILDING_EL_GHRIBA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ETCHMIADZIN_WOMAN'						WHERE Type = 'BUILDING_ETCHMIADZIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_FALUN_WOMAN'							WHERE Type = 'BUILDING_FALUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GATE_OF_SUN_WOMAN'						WHERE Type = 'BUILDING_GATE_OF_SUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GGANTIJA_WOMAN'						WHERE Type = 'BUILDING_GGANTIJA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GOEBEKLI_TEPE_WOMAN'					WHERE Type = 'BUILDING_GOEBEKLI_TEPE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GPS_WOMAN'								WHERE Type = 'BUILDING_GPS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GREAT_HALL_WOMAN'						WHERE Type = 'BUILDING_GREAT_HALL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GREAT_ZIMBABWE_WOMAN'					WHERE Type = 'BUILDING_GREAT_ZIMBABWE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_HABITAT_WOMAN'							WHERE Type = 'BUILDING_HABITAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_HARMANDIR_WOMAN'						WHERE Type = 'BUILDING_HARMANDIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_HOLLYWOOD_WOMAN'						WHERE Type = 'BUILDING_HOLLYWOOD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_HOSPITALLER_WOMAN'						WHERE Type = 'BUILDING_HOSPITALLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_HOUSE_OF_TRADE_WOMAN'					WHERE Type = 'BUILDING_HOUSE_OF_TRADE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_INTERSTATE_WOMAN'						WHERE Type = 'BUILDING_INTERSTATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ITSUKUSHIMA_WOMAN'						WHERE Type = 'BUILDING_ITSUKUSHIMA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_JFK_WOMAN'								WHERE Type = 'BUILDING_JFK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_JUMEIRAH_WOMAN'						WHERE Type = 'BUILDING_JUMEIRAH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KARNAK_WOMAN'							WHERE Type = 'BUILDING_KARNAK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KEW_GARDENS_WOMAN'						WHERE Type = 'BUILDING_KEW_GARDENS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KILWA_KISIWANI_WOMAN'					WHERE Type = 'BUILDING_KILWA_KISIWANI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KINKAKU_JI_WOMAN'						WHERE Type = 'BUILDING_KINKAKU_JI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KUK_WOMAN'								WHERE Type = 'BUILDING_KUK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_LAVAUX_WOMAN'							WHERE Type = 'BUILDING_LAVAUX' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MAJORVILLE_WOMAN'						WHERE Type = 'BUILDING_MAJORVILLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MALWIYA_WOMAN'							WHERE Type = 'BUILDING_MALWIYA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MARAE_WOMAN'							WHERE Type = 'BUILDING_MARAE_ARAHURAHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MEENAKSHI_WOMAN'						WHERE Type = 'BUILDING_MEENAKSHI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MICHEL_WOMAN'							WHERE Type = 'BUILDING_MICHEL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MILESTII_MICI_WOMAN'					WHERE Type = 'BUILDING_MILESTII_MICI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MILLAU_WOMAN'							WHERE Type = 'BUILDING_MILLAU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MOHENJO_DARO_WOMAN'					WHERE Type = 'BUILDING_MOHENJO_DARO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MONTE_CARLO_WOMAN'						WHERE Type = 'BUILDING_MONTE_CARLO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MORAY_WOMAN'							WHERE Type = 'BUILDING_MORAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MUSEUM_ISLAND_WOMAN'					WHERE Type = 'BUILDING_MUSEUM_ISLAND' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_NABAWI_WOMAN'							WHERE Type = 'BUILDING_NABAWI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_NAZCA_WOMAN'							WHERE Type = 'BUILDING_NAZCA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_OLD_BRIDGE_WOMAN'						WHERE Type = 'BUILDING_OLD_BRIDGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ORSZAGHAZ_WOMAN'						WHERE Type = 'BUILDING_ORSZAGHAZ' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_PANAMA_CANAL_WOMAN'					WHERE Type = 'BUILDING_PANAMA_CANAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_PETERHOF_WOMAN'						WHERE Type = 'BUILDING_PETERHOF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_POLAR_EXPEDITION_WOMAN'				WHERE Type = 'BUILDING_POLAR_EXPEDITION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_QALHAT_WOMAN'							WHERE Type = 'BUILDING_QALHAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_REVOLUTIONARY_MUSEUM_WOMAN'			WHERE Type = 'BUILDING_REVOLUTIONARY_MUSEUM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ROCKEFELLER_WOMAN'						WHERE Type = 'BUILDING_ROCKEFELLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_RUHR_VALLEY_WOMAN'						WHERE Type = 'BUILDING_RUHR_VALLEY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_RUSHMORE_WOMAN'						WHERE Type = 'BUILDING_RUSHMORE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SANBO_WOMAN'							WHERE Type = 'BUILDING_SANBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SEED_VAULT_WOMAN'						WHERE Type = 'BUILDING_SEED_VAULT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SHWEDAGON_WOMAN'						WHERE Type = 'BUILDING_SHWEDAGON' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SIBERIAN_RAILWAY_WOMAN'				WHERE Type = 'BUILDING_SIBERIAN_RAILWAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SIGIRIYA_WOMAN'						WHERE Type = 'BUILDING_SIGIRIYA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SIKU_QUANSHU_WOMAN'					WHERE Type = 'BUILDING_SIKU_QUANSHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SKARA_BRAE_WOMAN'						WHERE Type = 'BUILDING_SKARA_BRAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SOLOVIETSKY_WOMAN'						WHERE Type = 'BUILDING_SOLOVIETSKY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SONGYUE_WOMAN'							WHERE Type = 'BUILDING_SONGYUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SPUTNIK_WOMAN'							WHERE Type = 'BUILDING_SPUTNIK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ST_PETERS_WOMAN'						WHERE Type = 'BUILDING_ST_PETERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_TAIPEI_WOMAN'							WHERE Type = 'BUILDING_TAIPEI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_TEHRAN_FACILITY_WOMAN'					WHERE Type = 'BUILDING_TEHRAN_FACILITY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_TEMBLEQUE_WOMAN'						WHERE Type = 'BUILDING_TEMBLEQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_THONG_HAI_HIN_WOMAN'					WHERE Type = 'BUILDING_THONG_HAI_HIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_THREE_GORGES_DAM_WOMAN'				WHERE Type = 'BUILDING_THREE_GORGES_DAM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_THULE_WOMAN'							WHERE Type = 'BUILDING_THULE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_TLACHIHUALTEPETL_WOMAN'				WHERE Type = 'BUILDING_TLACHIHUALTEPETL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_VOSTOK_WOMAN'							WHERE Type = 'BUILDING_VOSTOK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_WARTBURG_WOMAN'						WHERE Type = 'BUILDING_WARTBURG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_WIELICZKA_WOMAN'						WHERE Type = 'BUILDING_WIELICZKA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_WHITE_SANDS_WOMAN'						WHERE Type = 'BUILDING_WHITE_SANDS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ZOCALO_WOMAN'							WHERE Type = 'BUILDING_ZOCALO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AMERICA_SLATER_MILL_WOMAN'				WHERE Type = 'BUILDING_SLATER_MILL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AMERICA_SMITHSONIAN_INSTITUTION_WOMAN'	WHERE Type = 'BUILDING_SMITHSONIAN_INSTITUTION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AMERICA_WEST_POINT_WOMAN'				WHERE Type = 'BUILDING_WEST_POINT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BLETCHLEY_WOMAN'						WHERE Type = 'BUILDING_BLETCHLEY_PARK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CERN_WOMAN'							WHERE Type = 'BUILDING_CERN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_EMPIRE_STATE_WOMAN'					WHERE Type = 'BUILDING_EMPIRE_STATE_BUILDING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_NALANDA_WOMAN'							WHERE Type = 'BUILDING_NALANDA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ROMAN_FORUM_WOMAN'						WHERE Type = 'BUILDING_ROMAN_FORUM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SOHO_FOUNDRY_WOMAN'					WHERE Type = 'BUILDING_SOHO_FOUNDRY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SUMMER_PALACE_WOMAN'					WHERE Type = 'BUILDING_SUMMER_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CRYSTAL_PALACE_WOMAN'					WHERE Type = 'BUILDING_CRYSTAL_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GRAND_CANAL_WOMAN'						WHERE Type = 'BUILDING_GRAND_CANAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MENIN_GATE_WOMAN'						WHERE Type = 'BUILDING_MENIN_GATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_OLYMPIC_VILLAGE_WOMAN'					WHERE Type = 'BUILDING_OLYMPIC_VILLAGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	
--============================================--
-- DUMMY BUILDINGS
--============================================--
INSERT INTO MWfVPConfig 
			(WType,							WHelp,					WDummy,									WActive,	WHasSound)
VALUES		('DUMMY_KUK',					'KUK',					'MW-WW Kuk',							2,			0),
			('DUMMY_GATE_OF_SUN',			'GATE_OF_SUN',			'MW-WW Gate of the Sun',				2,			0),
			('DUMMY_GREAT_ZIMBABWE',		'GREAT_ZIMBABWE',		'MW-WW Great Zimbabwe',					2,			0),
			('DUMMY_ITSUKUSHIMA',			'ITSUKUSHIMA',			'MW-WW Itsukushima Shrine',				2,			0),
			('DUMMY_QALHAT',				'QALHAT',				'MW-WW Qalhat',							2,			0),
			('DUMMY_CHEVALIERS',			'CHEVALIERS',			'MW-WW Krak des Chevaliers',			2,			0),
			('DUMMY_KILWA_KISIWANI',		'KILWA_KISIWANI',		'MW-WW Kilwa Kisiwani',					2,			0),
			('DUMMY_MARAE_ARAHURAHU',		'MARAE_ARAHURAHU',		'MW-WW Marae Arahurahu',				2,			0),
			('DUMMY_ST_PETERS',				'ST_PETERS',			'MW-WW St. Peter''s Basilica',			2,			0),
			('DUMMY_PANAMA_CANAL',			'PANAMA_CANAL',			'MW-WW Panama Canal',					2,			0),
			('DUMMY_ROCKEFELLER',			'ROCKEFELLER',			'MW-WW Rockefeller Center',				2,			0),
			('DUMMY_ARECIBO',				'ARECIBO',				'MW-WW Arecibo Observatory',			2,			0),
			('DUMMY_JUMEIRAH',				'JUMEIRAH',				'MW-WW Palm Jumeirah',					2,			0),
			('DUMMY_DARJEELING',			'DARJEELING',			'MW-WW Darjeeling Himalayan Railway',	2,			0),
			('DUMMY_SANBO',					'SANBO',				'MW-WW Sanbo Honbu',					2,			0),
			('DUMMY_SANBO_2',				'SANBO',				'MW-WW Sanbo Honbu',					2,			0),
			('DUMMY_AUTOBAHN',				'AUTOBAHN',				'MW-WW Autobahn',						2,			0),
			('DUMMY_INTERSTATE',			'INTERSTATE',			'MW-WW Interstate Highway System',		2,			0),
			('DUMMY_MUSEUM_ISLAND',			'MUSEUM_ISLAND',		'MW-WW Museum Island',					2,			0),
			('DUMMY_CURIOSITY',				'CURIOSITY',			'MW-WW Curiosity Rover',				2,			0),
			('DUMMY_SEED_VAULT',			'SEED_VAULT',			'MW-WW Svalbard Global Seed Vault',		2,			0),
			('DUMMY_TEMBLEQUE',				'TEMBLEQUE',			'MW-WW Tembleque Aqueduct',				2,			0),
			--('DUMMY_ANGKOR_WAT',			'',						'Angkor Wat',							2,			0), -- POLICY!!!
			--('DUMMY_TLACHIHUALTEPETL',	'',						'Tlachihualtepetl',						2,			0), -- POLICY!!!
			('DUMMY_HOSPITALLER',			'HOSPITALLER',			'MW-WW Knights Hospitaller',			2,			0),
			('DUMMY_SONGYUE',				'SONGYUE',				'MW-WW Songyue Pagoda',					2,			0);

INSERT INTO BuildingClasses 
			(Type,						Description,					DefaultBuilding)
SELECT		'BUILDINGCLASS_'||WType,	'TXT_KEY_BUILDING_'||WType,		'BUILDING_'||WType
FROM MWfVPConfig WHERE WActive = 2;

INSERT INTO Buildings
			(Type,               BuildingClass,           Description,					Help,									PrereqTech, Cost, FaithCost, GreatWorkCount , NukeImmune, ConquestProb, IsDummy)
SELECT		'BUILDING_'||WType, 'BUILDINGCLASS_'||WType, 'TXT_KEY_BUILDING_'||WType,	'TXT_KEY_BUILDING_'||WHelp||'_HELP',	NULL,       -1,   -1,        -1,              1,          0,			1
FROM MWfVPConfig WHERE WActive = 2;

INSERT INTO Language_en_US 
			(Tag,						Text) 
SELECT		'TXT_KEY_BUILDING_'||WType, WDummy
FROM MWfVPConfig WHERE WActive = 2;

--============================================--
-- DUMMY POLICIES
--============================================--
INSERT INTO	Policies
			(Type, 								Description, 								IsDummy)
VALUES		('POLICY_DUMMY_TLACHIHUALTEPETL',	'TXT_KEY_POLICY_DUMMY_TLACHIHUALTEPETL',	1),		
			('POLICY_DUMMY_ANGKOR_WAT',			'TXT_KEY_POLICY_DUMMY_ANGKOR_WAT',			1);	
--============================================--
-- Icons Atlas
--============================================--
-- IconTextureAtlases
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_MORE_WONDERS_'||WType, 256, 'Wonder_'||WType||'_256.dds',	'1', '1' FROM MWfVPConfig;
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_MORE_WONDERS_'||WType, 128, 'Wonder_'||WType||'_128.dds',	'1', '1' FROM MWfVPConfig;
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_MORE_WONDERS_'||WType,  80, 'Wonder_'||WType||'_80.dds',	'1', '1' FROM MWfVPConfig;
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_MORE_WONDERS_'||WType,  64, 'Wonder_'||WType||'_64.dds',	'1', '1' FROM MWfVPConfig;
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_MORE_WONDERS_'||WType,  45, 'Wonder_'||WType||'_45.dds',	'1', '1' FROM MWfVPConfig;

INSERT INTO IconTextureAtlases 
			(Atlas, 					IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
SELECT 		'MW_DIPLO_UNIT_ATLAS',		'256', 		'MW_DiploUnits_256.dds', 		4, 				1 UNION ALL
SELECT 		'MW_DIPLO_UNIT_ATLAS', 		'128', 		'MW_DiploUnits_128.dds', 		4, 				1 UNION ALL
SELECT 		'MW_DIPLO_UNIT_ATLAS', 		'80', 		'MW_DiploUnits_80.dds', 		4, 				1 UNION ALL
SELECT 		'MW_DIPLO_UNIT_ATLAS', 		'64', 		'MW_DiploUnits_64.dds', 		4, 				1 UNION ALL
SELECT 		'MW_DIPLO_UNIT_ATLAS', 		'45', 		'MW_DiploUnits_45.dds', 		4, 				1;
--------------------------------------------------------------
--------------------------------------------------------------