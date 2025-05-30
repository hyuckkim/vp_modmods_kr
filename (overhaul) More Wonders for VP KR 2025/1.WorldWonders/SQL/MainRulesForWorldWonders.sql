--------------------------------------------------------------
-- Automatic changes applied to all new Wonders
-- Dec 9, 2017: Created, Infixo
-- Jan 6, 2020: Improved, adan_eslavo
--------------------------------------------------------------
--============================================--
-- DEFINES
--============================================--
UPDATE Defines SET Value = 50 WHERE Name = 'BALANCE_CORE_WORLD_WONDER_SAME_ERA_COST_MODIFIER'; --original: 25
UPDATE Defines SET Value = 30 WHERE Name = 'BALANCE_CORE_WORLD_WONDER_PREVIOUS_ERA_COST_MODIFIER'; --original: 15
UPDATE Defines SET Value = 20 WHERE Name = 'BALANCE_CORE_WORLD_WONDER_SECOND_PREVIOUS_ERA_COST_MODIFIER'; --original: 10
UPDATE Defines SET Value = 10 WHERE Name = 'BALANCE_CORE_WORLD_WONDER_EARLIER_ERA_COST_MODIFIER'; --original: 5

UPDATE Language_en_US
SET Text = 'Additional [ICON_PRODUCTION] Production Cost due to owned World Wonders: [COLOR_NEGATIVE_TEXT]{1_Num}%[ENDCOLOR].[NEWLINE][ICON_PRODUCTION] Production Cost increase factors:[NEWLINE][ICON_BULLET] Wonders from the same Era: [COLOR_NEGATIVE_TEXT]40%.[ENDCOLOR][NEWLINE][ICON_BULLET] Wonders from the previous Era: [COLOR_NEGATIVE_TEXT]35%[ENDCOLOR].[NEWLINE][ICON_BULLET] Wonders from two Eras earlier: [COLOR_NEGATIVE_TEXT]30%.[ENDCOLOR][NEWLINE][ICON_BULLET] Wonders from three Eras earlier or more do not add any penalties.'
WHERE Tag = 'TXT_KEY_WONDER_COST_INCREASE_METRIC';

UPDATE Language_ko_KR
SET Text = '소유한 세계 불가사의로 인한 추가 [ICON_PRODUCTION]생산 비용: [COLOR_NEGATIVE_TEXT]{1_Num}%[ENDCOLOR][NEWLINE][ICON_PRODUCTION] 생산 비용 증가 요소:[NEWLINE][ICON_BULLET] 같은 시대의 불가사의: [COLOR_NEGATIVE_TEXT]40 %[ENDCOLOR][NEWLINE][ICON_BULLET] 이전 시대의 불가사의: [COLOR_NEGATIVE_TEXT]35%[ENDCOLOR][NEWLINE][ICON_BULLET] 이전 두 시대의 불가사의: [COLOR_NEGATIVE_TEXT]30%[ENDCOLOR][NEWLINE] [ICON_BULLET] 3개 시대 이전의 불가사의는 페널티를 추가하지 않습니다.'
WHERE Tag = 'TXT_KEY_WONDER_COST_INCREASE_METRIC';
--============================================--
-- Table with new Wonder Types
--============================================--
CREATE TABLE MWfVPConfig (
	WType			TEXT			NOT NULL,		-- Wonder Type
	WDummy			TEXT			NOT NULL,		-- Name for dummy buildings
	WActive			INTEGER			NOT NULL,		-- 1 = Wonder active / 0 = Wonder not active
	WHasSound		INTEGER			NOT NULL,		-- 1 = Quote recording / 0 = No recording
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
			(WType,						WDummy,		WActive,	WHasSound)
VALUES		('ALTAMIRA',				'None',		1,			1),		-- Altamira Cave
			('GGANTIJA',				'None',		1,			1),		-- Ggantija
			('GOEBEKLI_TEPE',			'None',		1,			1),		-- Goebekli Tepe
			('KUK',						'None',		1,			1),		-- Kuk Swamp
			('MAJORVILLE',				'None',		1,			1),		-- Majorville Medicine Wheel
			('MOHENJO_DARO',			'None',		1,			1),		-- Mohenjo-Daro
			('SKARA_BRAE',				'None',		1,			1),		-- Skara Brae
			-------------------ANCIENT--------------------------------------------------------------
			('KARNAK',					'None',		1,			1),		-- Karnak Temple
			('NAZCA',					'None',		1,			1),		-- Nazca Lines
			('WIELICZKA',				'None',		1,			1),		-- Wieliczka Salt Mine
			('THONG_HAI_HIN',			'None',		1,			0),		-- Thong Hai Hin (Plain of Jars)
			-------------------CLASSICAL------------------------------------------------------------
			('MALWIYA',					'None',		1,			1),		-- Malwiya Minaret (Great Mosque of Samarra)
			('GATE_OF_SUN',				'None',		1,			1),		-- Gate of the Sun
			('BAMYAN',					'None',		1,			1),		-- Buddhas of Bamiyan
			('EL_GHRIBA',				'None',		1,			1),		-- El Ghriba Synagougue
			('ETCHMIADZIN',				'None',		1,			1),		-- Etchmiadzin Cathedral
			('SIGIRIYA',				'None',		1,			0),		-- Sirigiya
			('CHAND_BAORI',				'None',		1,			1),		-- Chand Baori Well
			-------------------MEDIEVAL-------------------------------------------------------------
			('NABAWI',					'None',		1,			1),		-- Al-Masjid an-Nabawi (Prophet's Mosque)
			('MORAY',					'None',		1,			0),		-- Moray (Moray Terraces)
			('LAVAUX',					'None',		1,			1),		-- Lavaux
			('WARTBURG',				'None',		1,			1),		-- Wartburg Castle
			('GREAT_ZIMBABWE',			'None',		1,			1),		-- Great Zimbabwe
			('FALUN',					'None',		1,			1),		-- Falun Mine
			('AHU',						'None',		1,			1),		-- Ahu Tongariki
			('DAMASCUS',				'None',		1,			1),		-- Forge of Damascus
			('SHWEDAGON',				'None',		1,			1),		-- Shwedagon Pagoda / Shwedagon Zedi Daw / Great Dagon Pagoda  / Golden Pagoda
			('MICHEL',					'None',		1,			1),		-- Mont Saint Michel
			('BUYUK_HAN',				'None',		1,			0),		-- Büyük Han (Great Inn)
			('ITSUKUSHIMA',				'None',		1,			1),		-- Itsukushima Shrine
			('QALHAT',					'None',		1,			1),		-- Qalhat
			('CHEVALIERS',				'None',		1,			1),		-- Krak des Chevaliers
			-------------------RENAISSANCE----------------------------------------------------------
			('BENHADDOU',				'None',		1,			1),		-- Ait Benhaddou
			('KILWA_KISIWANI',			'None',		1,			1),		-- Kilwa Kisiwani
			('ST_PETERS',				'None',		1,			1),		-- Papal Basilica of St. Peter in the Vatican
			('KINKAKU_JI',				'None',		1,			1),		-- Golden Pavilion (Kikaku-Ji)
			('MARAE',					'None',		1,			1),		-- Marae Arahurahu
			('OLD_BRIDGE',				'None',		1,			1),		-- Old Bridge in Mostar
			('MEENAKSHI',				'None',		1,			1),		-- Meenakshi Temple
			('PETERHOF',				'None',		1,			1),		-- Peterhof Palace
			('BAKKEN',					'None',		1,			1),		-- Bakken
			('HOUSE_OF_TRADE',			'None',		1,			1),		-- House of Trade of the Indies (Casa de Contratación)
			('SOLOVIETSKY',				'None',		1,			1),		-- Solovietsky Monastery
			('TEMBLEQUE',				'None',		1,			0),		-- Aqueducto del Padre Tembleque
			-------------------ENLIGHTENMENT--------------------------------------------------------
			--('BOLSHOI',				'None',		1,			1),		-- Bolshoi Theater
			-------------------INDUSTRIAL-----------------------------------------------------------
			('MUSEUM_ISLAND',			'None',		1,			1),		-- Museum Island
			('SIKU_QUANSHU',			'None',		1,			1),		-- Siku Quanshu
			('BROOKLYN',				'None',		1,			1),		-- Brooklyn Bridge
			('SIBERIAN_RAILWAY',		'None',		1,			1),		-- Trans-Siberian Railway
			('PANAMA_CANAL',			'None',		1,			1),		-- Panama Canal
			('ZOCALO',					'None',		1,			1),		-- Zocalo
			('KEW_GARDENS',				'None',		1,			1),		-- Kew Gardens
			('MONTE_CARLO',				'None',		1,			1),		-- Monte Carlo Casino
			('RUHR_VALLEY',				'None',		1,			1),		-- Ruhr Valley
			('DARJEELING',				'None',		1,			1),		-- Darjeeling Himalayan Railway
			('BANFF',					'None',		1,			1),		-- Banff Springs Hotel
			('ORSZAGHAZ',				'None',		1,			1),		-- Orszaghaz
			-------------------MODERN---------------------------------------------------------------
			('POLAR_EXPEDITION',		'None',		1,			1),		-- First Polar Expedition
			('AKIHABARA',				'None',		1,			1),		-- Akihabara Trade Center
			('ROCKEFELLER',				'None',		1,			1),		-- Rockefeller Center
			('AUTOBAHN',				'None',		1,			0),		-- Autobahn
			('INTERSTATE',				'None',		1,			0),		-- Highway Interstate System
			('HOLLYWOOD',				'None',		1,			0),		-- Hollywood
			('CONCORDE',				'None',		1,			0),		-- Concorde
			('SANBO',					'None',		1,			1),		-- Sanbo Honbu
			('RUSHMORE',				'None',		1,			1),		-- Mount Rushmore
			-------------------ATOMIC---------------------------------------------------------------
			--('GREAT_HALL',			'None',		1,			0),		-- Great Hall of China
			('HABITAT',					'None',		1,			0),		-- Habitat 67
			--('MARACANA',				'None',		1,			0),		-- Estadio do Maracana
			('VOSTOK',					'None',		1,			0),		-- Vostok Station
			('MILESTII_MICI',			'None',		1,			0),		-- Milestii Mici Winery
			--('NUCLEAR_FACILITY',		'None',		1,			0),		-- Tehran Nuclear Research Facility
			('JFK',						'None',		1,			0),		-- JFK Space Center
			('SPUTNIK',					'None',		1,			0),		-- Sputnik Program
			('ANITKABIR',				'None',		1,			0),		-- Anitkabir Mausoleum
			('THULE',					'None',		1,			0),		-- Thule Airbase
			('WHITE_SANDS',				'None',		1,			1),		-- White Sands Missile Range
			('MILLAU',					'None',		1,			1),		-- Millau Viaduct
			('REVOLUTIONARY_MUSEUM',	'None',		1,			0),		-- Kumsusan Palace
			('ARECIBO',					'None',		1,			1),		-- Arecibo Observatory
			-------------------INFORMATION-A--------------------------------------------------------
			--('NORTHERN_LIGHT',		'None',		1,			0),		-- Northern Light Cathedral
			('SEED_VAULT',				'None',		1,			0),		-- Svalbard Global Seed Vault
			--('THREE_GORGES_DAM',		'None',		1,			0),		-- Three Gorges Dam
			('JUMEIRAH',				'None',		1,			1),		-- Palm Jumeirah
			('TAIPEI',					'None',		1,			1),		-- Taipei 101
			--('PETRONAS',				'None',		1,			0);		-- Petronas Towers
			-------------------INFORMATION-B--------------------------------------------------------
			('CURIOSITY',				'None',		1,			0),		-- Curiosity Rover
			--('SKYTREE',				'None',		1,			0),		-- Skytree
			('GPS',						'None',		1,			0);		-- Global Positioning System
			--('ICE_HOTEL',				'None',		1,			0),		-- Ice Hotel
			-------------------INFORMATION-C--------------------------------------------------------
			--('MARINA_BAY_SANDS',		'None',		1,			0),		-- Marina Bay Sands
			--('ONKALO',				'None',		1,			0),		-- Onkalo Nuclear Waste Repository
			--('ITER',					'None',		1,			0),		-- ITER
			--('HUMANKIND',				'None',		1,			0);		-- Museum of Humankind
--============================================--
-- WONDERS INITIAL CONFIGURATION
--============================================--
-- BuildingClasses
INSERT INTO BuildingClasses 
			(Type,						Description,					DefaultBuilding,	MaxGlobalInstances)
SELECT		'BUILDINGCLASS_'||WType,	'TXT_KEY_BUILDING_'||WType,		'BUILDING_'||WType, 1
FROM MWfVPConfig;
--------------------------------------------------------------
-- Buildings
-- MinAreaSize - change to 10 for Coastal Wonders!
-- Set Cost = -1 and later apply proper value for enabled buildings
-- GreatWorkCount defaults to 0, PrereqTech defaults to NULL
INSERT INTO Buildings
			(Type,               BuildingClass,           Description,                Civilopedia,                        Help,								Quote,								ThemingBonusHelp, Cost, FaithCost, NukeImmune, HurryCostModifier, MinAreaSize, ConquestProb, IconAtlas,							PortraitIndex, WonderSplashImage,				WonderSplashAnchor)
SELECT		'BUILDING_'||WType, 'BUILDINGCLASS_'||WType, 'TXT_KEY_BUILDING_'||WType, 'TXT_KEY_WONDER_'||WType||'_PEDIA', 'TXT_KEY_WONDER_'||WType||'_HELP',	'TXT_KEY_WONDER_'||WType||'_QUOTE', NULL,             1,    0,         1,          -5,                -1,          100,          'ATLAS_MORE_WONDERS_'||WType,		0,             'Wonder_'||WType||'_splash.dds', 'R,T'
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
			(SoundID, 											Filename, 								LoadType)
VALUES		('SND_WONDER_SPEECH_AMERICA_SLATTER_MILL_MAN', 		'wonder_america_slatter_mill_man', 		'DynamicResident'),
			('SND_WONDER_SPEECH_AMERICA_SLATTER_MILL_WOMAN',	'wonder_america_slatter_mill_woman', 	'DynamicResident'),
			('SND_WONDER_SPEECH_BLETCHEY_MAN', 					'wonder_bletchey_man', 					'DynamicResident'),
			('SND_WONDER_SPEECH_BLETCHEY_WOMAN',				'wonder_bletchey_woman', 				'DynamicResident'),
			('SND_WONDER_SPEECH_CERN_MAN', 						'wonder_cern_man', 						'DynamicResident'),
			('SND_WONDER_SPEECH_CERN_WOMAN',					'wonder_cern_woman', 					'DynamicResident'),
			('SND_WONDER_SPEECH_EMPIRE_STATE_MAN', 				'wonder_empire_state_man', 				'DynamicResident'),
			('SND_WONDER_SPEECH_EMPIRE_STATE_WOMAN',			'wonder_empire_state_woman', 			'DynamicResident'),
			('SND_WONDER_SPEECH_FORUM_MAN', 					'wonder_forum_man', 					'DynamicResident'),
			('SND_WONDER_SPEECH_FORUM_WOMAN',					'wonder_forum_woman', 					'DynamicResident'),
			('SND_WONDER_SPEECH_MOTHERLAND_MAN', 				'wonder_motherland_man', 				'DynamicResident'),
			('SND_WONDER_SPEECH_MOTHERLAND_WOMAN',				'wonder_motherland_woman', 				'DynamicResident'),
			('SND_WONDER_SPEECH_CRYSTAL_PALACE_MAN', 			'wonder_crystal_palace_man', 			'DynamicResident'),
			('SND_WONDER_SPEECH_CRYSTAL_PALACE_WOMAN',			'wonder_crystal_palace_woman', 			'DynamicResident'),
			('SND_WONDER_SPEECH_GRAND_CANAL_MAN', 				'wonder_grand_canal_man', 				'DynamicResident'),
			('SND_WONDER_SPEECH_GRAND_CANAL_WOMAN',				'wonder_grand_canal_woman', 			'DynamicResident'),
			('SND_WONDER_SPEECH_MENIN_GATE_MAN', 				'wonder_menin_gate_man', 				'DynamicResident'),
			('SND_WONDER_SPEECH_MENIN_GATE_WOMAN',				'wonder_menin_gate_woman', 				'DynamicResident'),
			('SND_WONDER_SPEECH_OLYMPIC_VILLAGE_MAN', 			'wonder_olympic_village_man', 			'DynamicResident'),
			('SND_WONDER_SPEECH_OLYMPIC_VILLAGE_WOMAN',			'wonder_olympic_village_woman', 		'DynamicResident'),
			('SND_WONDER_SPEECH_SUMMER_PALACE_MAN', 			'wonder_summer_palace_man', 			'DynamicResident'),
			('SND_WONDER_SPEECH_SUMMER_PALACE_WOMAN',			'wonder_summer_palace_woman', 			'DynamicResident');

INSERT INTO Audio_Sounds 
			(SoundID, 											Filename, 							LoadType)
VALUES		('SND_WONDER_SPEECH_ARK_OF_THE_COVENANT_MAN', 		'art_ark_of_the_covenant_man', 		'DynamicResident'),
			('SND_WONDER_SPEECH_ARK_OF_THE_COVENANT_WOMAN', 	'art_ark_of_the_covenant_woman',	'DynamicResident'),
			('SND_WONDER_SPEECH_HOLY_LANCE_MAN', 				'art_holy_lance_man', 				'DynamicResident'),
			('SND_WONDER_SPEECH_HOLY_LANCE_WOMAN', 				'art_holy_lance_woman',				'DynamicResident'),
			('SND_WONDER_SPEECH_HOLY_CROWN_MAN', 				'art_holy_crown_man', 				'DynamicResident'),
			('SND_WONDER_SPEECH_HOLY_CROWN_WOMAN', 				'art_holy_crown_woman',				'DynamicResident');
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
			(ScriptID, 											SoundID, 											SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_WONDER_SPEECH_AMERICA_SLATTER_MILL_MAN', 	'SND_WONDER_SPEECH_AMERICA_SLATTER_MILL_MAN', 		'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_AMERICA_SLATTER_MILL_WOMAN', 	'SND_WONDER_SPEECH_AMERICA_SLATTER_MILL_WOMAN',		'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_BLETCHEY_MAN', 				'SND_WONDER_SPEECH_BLETCHEY_MAN', 					'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_BLETCHEY_WOMAN', 				'SND_WONDER_SPEECH_BLETCHEY_WOMAN',					'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_CERN_MAN', 					'SND_WONDER_SPEECH_CERN_MAN', 						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_CERN_WOMAN', 					'SND_WONDER_SPEECH_CERN_WOMAN',						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_EMPIRE_STATE_MAN', 			'SND_WONDER_SPEECH_EMPIRE_STATE_MAN', 				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_EMPIRE_STATE_WOMAN', 			'SND_WONDER_SPEECH_EMPIRE_STATE_WOMAN',				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_MOTHERLAND_MAN', 				'SND_WONDER_SPEECH_MOTHERLAND_MAN', 				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_MOTHERLAND_WOMAN', 			'SND_WONDER_SPEECH_MOTHERLAND_WOMAN',				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_CRYSTAL_PALACE_MAN', 			'SND_WONDER_SPEECH_CRYSTAL_PALACE_MAN', 			'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_CRYSTAL_PALACE_WOMAN', 		'SND_WONDER_SPEECH_CRYSTAL_PALACE_WOMAN',			'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_MENIN_GATE_MAN', 				'SND_WONDER_SPEECH_MENIN_GATE_MAN', 				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_MENIN_GATE_WOMAN', 			'SND_WONDER_SPEECH_MENIN_GATE_WOMAN',				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_FORUM_MAN', 					'SND_WONDER_SPEECH_FORUM_MAN', 						'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_FORUM_WOMAN', 					'SND_WONDER_SPEECH_FORUM_WOMAN',					'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_GRAND_CANAL_MAN', 				'SND_WONDER_SPEECH_GRAND_CANAL_MAN', 				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_GRAND_CANAL_WOMAN', 			'SND_WONDER_SPEECH_GRAND_CANAL_WOMAN',				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_OLYMPIC_VILLAGE_MAN', 			'SND_WONDER_SPEECH_OLYMPIC_VILLAGE_MAN', 			'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_OLYMPIC_VILLAGE_WOMAN', 		'SND_WONDER_SPEECH_OLYMPIC_VILLAGE_WOMAN',			'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_SUMMER_PALACE_MAN', 			'SND_WONDER_SPEECH_SUMMER_PALACE_MAN', 				'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_SUMMER_PALACE_WOMAN', 			'SND_WONDER_SPEECH_SUMMER_PALACE_WOMAN',			'GAME_SPEECH', 	80, 		170, 		0, 			0);

INSERT INTO Audio_2DSounds 
			(ScriptID, 											SoundID, 										SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_WONDER_SPEECH_ARK_OF_THE_COVENANT_MAN', 		'SND_WONDER_SPEECH_ARK_OF_THE_COVENANT_MAN', 	'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_ARK_OF_THE_COVENANT_WOMAN', 	'SND_WONDER_SPEECH_ARK_OF_THE_COVENANT_WOMAN',	'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_HOLY_LANCE_MAN', 				'SND_WONDER_SPEECH_HOLY_LANCE_MAN', 			'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_HOLY_LANCE_WOMAN', 			'SND_WONDER_SPEECH_HOLY_LANCE_WOMAN',			'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_HOLY_CROWN_MAN', 				'SND_WONDER_SPEECH_HOLY_CROWN_MAN', 			'GAME_SPEECH', 	80, 		170, 		0, 			0),
			('AS2D_WONDER_SPEECH_HOLY_CROWN_WOMAN', 			'SND_WONDER_SPEECH_HOLY_CROWN_WOMAN',			'GAME_SPEECH', 	80, 		170, 		0, 			0);
------------------------------
-- Buildings (Quotes)
	-- Man
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AHU_MAN'					WHERE Type = 'BUILDING_AHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AKIHABARA_MAN'				WHERE Type = 'BUILDING_AKIHABARA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ALTAMIRA_MAN'				WHERE Type = 'BUILDING_ALTAMIRA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ARECIBO_MAN'				WHERE Type = 'BUILDING_ARECIBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BAKKEN_MAN'				WHERE Type = 'BUILDING_BAKKEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BAMYAN_MAN'				WHERE Type = 'BUILDING_BAMYAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BANFF_MAN'					WHERE Type = 'BUILDING_BANFF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BENHADDOU_MAN'				WHERE Type = 'BUILDING_BENHADDOU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BROOKLYN_MAN'				WHERE Type = 'BUILDING_BROOKLYN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CHAND_BAORI_MAN'			WHERE Type = 'BUILDING_CHAND_BAORI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CHEVALIERS_MAN'			WHERE Type = 'BUILDING_CHEVALIERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_DAMASCUS_MAN'				WHERE Type = 'BUILDING_DAMASCUS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_DARJEELING_MAN'			WHERE Type = 'BUILDING_DARJEELING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_EL_GHRIBA_MAN'				WHERE Type = 'BUILDING_EL_GHRIBA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ETCHMIADZIN_MAN'			WHERE Type = 'BUILDING_ETCHMIADZIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_FALUN_MAN'					WHERE Type = 'BUILDING_FALUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GATE_OF_SUN_MAN'			WHERE Type = 'BUILDING_GATE_OF_SUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GGANTIJA_MAN'				WHERE Type = 'BUILDING_GGANTIJA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GOEBEKLI_TEPE_MAN'			WHERE Type = 'BUILDING_GOEBEKLI_TEPE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GREAT_ZIMBABWE_MAN'		WHERE Type = 'BUILDING_GREAT_ZIMBABWE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_HOUSE_OF_TRADE_MAN'		WHERE Type = 'BUILDING_HOUSE_OF_TRADE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ITSUKUSHIMA_MAN'			WHERE Type = 'BUILDING_ITSUKUSHIMA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_JUMEIRAH_MAN'				WHERE Type = 'BUILDING_JUMEIRAH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KARNAK_MAN'				WHERE Type = 'BUILDING_KARNAK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KEW_GARDENS_MAN'			WHERE Type = 'BUILDING_KEW_GARDENS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KILWA_KISIWANI_MAN'		WHERE Type = 'BUILDING_KILWA_KISIWANI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KINKAKU_JI_MAN'			WHERE Type = 'BUILDING_KINKAKU_JI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KUK_MAN'					WHERE Type = 'BUILDING_KUK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_LAVAUX_MAN'				WHERE Type = 'BUILDING_LAVAUX' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MAJORVILLE_MAN'			WHERE Type = 'BUILDING_MAJORVILLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MALWIYA_MAN'				WHERE Type = 'BUILDING_MALWIYA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MARAE_MAN'					WHERE Type = 'BUILDING_MARAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MEENAKSHI_MAN'				WHERE Type = 'BUILDING_MEENAKSHI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MICHEL_MAN'				WHERE Type = 'BUILDING_MICHEL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MILLAU_MAN'				WHERE Type = 'BUILDING_MILLAU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MOHENJO_DARO_MAN'			WHERE Type = 'BUILDING_MOHENJO_DARO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MONTE_CARLO_MAN'			WHERE Type = 'BUILDING_MONTE_CARLO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MUSEUM_ISLAND_MAN'			WHERE Type = 'BUILDING_MUSEUM_ISLAND' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_NABAWI_MAN'				WHERE Type = 'BUILDING_NABAWI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_NAZCA_MAN'					WHERE Type = 'BUILDING_NAZCA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_OLD_BRIDGE_MAN'			WHERE Type = 'BUILDING_OLD_BRIDGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ORSZAGHAZ_MAN'				WHERE Type = 'BUILDING_ORSZAGHAZ' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_PANAMA_CANAL_MAN'			WHERE Type = 'BUILDING_PANAMA_CANAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_PETERHOF_MAN'				WHERE Type = 'BUILDING_PETERHOF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_POLAR_EXPEDITION_MAN'		WHERE Type = 'BUILDING_POLAR_EXPEDITION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_QALHAT_MAN'				WHERE Type = 'BUILDING_QALHAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ROCKEFELLER_MAN'			WHERE Type = 'BUILDING_ROCKEFELLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_RUHR_VALLEY_MAN'			WHERE Type = 'BUILDING_RUHR_VALLEY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_RUSHMORE_MAN'				WHERE Type = 'BUILDING_RUSHMORE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SANBO_MAN'					WHERE Type = 'BUILDING_SANBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SHWEDAGON_MAN'				WHERE Type = 'BUILDING_SHWEDAGON' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SIBERIAN_RAILWAY_MAN'		WHERE Type = 'BUILDING_SIBERIAN_RAILWAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SIKU_QUANSHU_MAN'			WHERE Type = 'BUILDING_SIKU_QUANSHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SKARA_BRAE_MAN'			WHERE Type = 'BUILDING_SKARA_BRAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SOLOVIETSKY_MAN'			WHERE Type = 'BUILDING_SOLOVIETSKY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ST_PETERS_MAN'				WHERE Type = 'BUILDING_ST_PETERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_TAIPEI_MAN'				WHERE Type = 'BUILDING_TAIPEI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_WARTBURG_MAN'				WHERE Type = 'BUILDING_WARTBURG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_WIELICZKA_MAN'				WHERE Type = 'BUILDING_WIELICZKA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_WHITE_SANDS_MAN'			WHERE Type = 'BUILDING_WHITE_SANDS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ZOCALO_MAN'				WHERE Type = 'BUILDING_ZOCALO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AMERICA_SLATER_MILL_MAN'	WHERE Type = 'BUILDING_AMERICA_SLATERMILL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	-- America Smithsonian
	-- America West Point

	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BLETCHLEY_MAN'				WHERE Type = 'BUILDING_BLETCHLEY_PARK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CERN_MAN'					WHERE Type = 'BUILDING_CERN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_EMPIRE_STATE_MAN'			WHERE Type = 'BUILDING_EMPIRE_STATE_BUILDING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_FORUM_MAN'					WHERE Type = 'BUILDING_FORUM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MOTHERLAND_MAN'			WHERE Type = 'BUILDING_MOTHERLAND' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	-- Soho Foundry

	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CRYSTAL_PALACE_MAN'		WHERE Type = 'BUILDING_CRYSTAL_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GRAND_CANAL_MAN'			WHERE Type = 'BUILDING_GRAND_CANAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MENIN_GATE_MAN'			WHERE Type = 'BUILDING_MENIN_GATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_OLYMPIC_VILLAGE_MAN'		WHERE Type = 'BUILDING_OLYMPIC_VILLAGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SUMMER_PALACE_MAN'			WHERE Type = 'BUILDING_SUMMER_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 0);
	
	------------------------------
	-- Woman
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AHU_WOMAN'					WHERE Type = 'BUILDING_AHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AKIHABARA_WOMAN'			WHERE Type = 'BUILDING_AKIHABARA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ALTAMIRA_WOMAN'			WHERE Type = 'BUILDING_ALTAMIRA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ARECIBO_WOMAN'				WHERE Type = 'BUILDING_ARECIBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BAKKEN_WOMAN'				WHERE Type = 'BUILDING_BAKKEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BAMYAN_WOMAN'				WHERE Type = 'BUILDING_BAMYAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BANFF_WOMAN'				WHERE Type = 'BUILDING_BANFF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BENHADDOU_WOMAN'			WHERE Type = 'BUILDING_BENHADDOU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BROOKLYN_WOMAN'			WHERE Type = 'BUILDING_BROOKLYN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CHAND_BAORI_WOMAN'			WHERE Type = 'BUILDING_CHAND_BAORI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CHEVALIERS_WOMAN'			WHERE Type = 'BUILDING_CHEVALIERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_DAMASCUS_WOMAN'			WHERE Type = 'BUILDING_DAMASCUS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_DARJEELING_WOMAN'			WHERE Type = 'BUILDING_DARJEELING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_EL_GHRIBA_WOMAN'			WHERE Type = 'BUILDING_EL_GHRIBA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ETCHMIADZIN_WOMAN'			WHERE Type = 'BUILDING_ETCHMIADZIN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_FALUN_WOMAN'				WHERE Type = 'BUILDING_FALUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GATE_OF_SUN_WOMAN'			WHERE Type = 'BUILDING_GATE_OF_SUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GGANTIJA_WOMAN'			WHERE Type = 'BUILDING_GGANTIJA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GOEBEKLI_TEPE_WOMAN'		WHERE Type = 'BUILDING_GOEBEKLI_TEPE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GREAT_ZIMBABWE_WOMAN'		WHERE Type = 'BUILDING_GREAT_ZIMBABWE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_HOUSE_OF_TRADE_WOMAN'		WHERE Type = 'BUILDING_HOUSE_OF_TRADE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ITSUKUSHIMA_WOMAN'			WHERE Type = 'BUILDING_ITSUKUSHIMA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_JUMEIRAH_WOMAN'			WHERE Type = 'BUILDING_JUMEIRAH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KARNAK_WOMAN'				WHERE Type = 'BUILDING_KARNAK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KEW_GARDENS_WOMAN'			WHERE Type = 'BUILDING_KEW_GARDENS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KILWA_KISIWANI_WOMAN'		WHERE Type = 'BUILDING_KILWA_KISIWANI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KINKAKU_JI_WOMAN'			WHERE Type = 'BUILDING_KINKAKU_JI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_KUK_WOMAN'					WHERE Type = 'BUILDING_KUK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_LAVAUX_WOMAN'				WHERE Type = 'BUILDING_LAVAUX' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MAJORVILLE_WOMAN'			WHERE Type = 'BUILDING_MAJORVILLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MALWIYA_WOMAN'				WHERE Type = 'BUILDING_MALWIYA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MARAE_WOMAN'				WHERE Type = 'BUILDING_MARAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MEENAKSHI_WOMAN'			WHERE Type = 'BUILDING_MEENAKSHI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MICHEL_WOMAN'				WHERE Type = 'BUILDING_MICHEL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MILLAU_WOMAN'				WHERE Type = 'BUILDING_MILLAU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MOHENJO_DARO_WOMAN'		WHERE Type = 'BUILDING_MOHENJO_DARO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MONTE_CARLO_WOMAN'			WHERE Type = 'BUILDING_MONTE_CARLO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MUSEUM_ISLAND_WOMAN'		WHERE Type = 'BUILDING_MUSEUM_ISLAND' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_NABAWI_WOMAN'				WHERE Type = 'BUILDING_NABAWI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_NAZCA_WOMAN'				WHERE Type = 'BUILDING_NAZCA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_OLD_BRIDGE_WOMAN'			WHERE Type = 'BUILDING_OLD_BRIDGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ORSZAGHAZ_WOMAN'			WHERE Type = 'BUILDING_ORSZAGHAZ' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_PANAMA_CANAL_WOMAN'		WHERE Type = 'BUILDING_PANAMA_CANAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_PETERHOF_WOMAN'			WHERE Type = 'BUILDING_PETERHOF' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_POLAR_EXPEDITION_WOMAN'	WHERE Type = 'BUILDING_POLAR_EXPEDITION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_QALHAT_WOMAN'				WHERE Type = 'BUILDING_QALHAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ROCKEFELLER_WOMAN'			WHERE Type = 'BUILDING_ROCKEFELLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_RUHR_VALLEY_WOMAN'			WHERE Type = 'BUILDING_RUHR_VALLEY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_RUSHMORE_WOMAN'			WHERE Type = 'BUILDING_RUSHMORE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SANBO_WOMAN'				WHERE Type = 'BUILDING_SANBO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SHWEDAGON_WOMAN'			WHERE Type = 'BUILDING_SHWEDAGON' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SIBERIAN_RAILWAY_WOMAN'	WHERE Type = 'BUILDING_SIBERIAN_RAILWAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SIKU_QUANSHU_WOMAN'		WHERE Type = 'BUILDING_SIKU_QUANSHU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SKARA_BRAE_WOMAN'			WHERE Type = 'BUILDING_SKARA_BRAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SOLOVIETSKY_WOMAN'			WHERE Type = 'BUILDING_SOLOVIETSKY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ST_PETERS_WOMAN'			WHERE Type = 'BUILDING_ST_PETERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_TAIPEI_WOMAN'				WHERE Type = 'BUILDING_TAIPEI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_WARTBURG_WOMAN'			WHERE Type = 'BUILDING_WARTBURG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_WIELICZKA_WOMAN'			WHERE Type = 'BUILDING_WIELICZKA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_WHITE_SANDS_WOMAN'			WHERE Type = 'BUILDING_WHITE_SANDS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_ZOCALO_WOMAN'				WHERE Type = 'BUILDING_ZOCALO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_AMERICA_SLATER_MILL_WOMAN'	WHERE Type = 'BUILDING_AMERICA_SLATERMILL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	-- America Smithsonian
	-- America West Point

	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_BLETCHLEY_WOMAN'			WHERE Type = 'BUILDING_BLETCHLEY_PARK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CERN_WOMAN'				WHERE Type = 'BUILDING_CERN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_EMPIRE_STATE_WOMAN'		WHERE Type = 'BUILDING_EMPIRE_STATE_BUILDING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_FORUM_WOMAN'				WHERE Type = 'BUILDING_FORUM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MOTHERLAND_WOMAN'			WHERE Type = 'BUILDING_MOTHERLAND' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	-- Soho Foundry

	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_CRYSTAL_PALACE_WOMAN'		WHERE Type = 'BUILDING_CRYSTAL_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_GRAND_CANAL_WOMAN'			WHERE Type = 'BUILDING_GRAND_CANAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_MENIN_GATE_WOMAN'			WHERE Type = 'BUILDING_MENIN_GATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_OLYMPIC_VILLAGE_WOMAN'		WHERE Type = 'BUILDING_OLYMPIC_VILLAGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	UPDATE Buildings SET WonderSplashAudio = 'AS2D_WONDER_SPEECH_SUMMER_PALACE_WOMAN'		WHERE Type = 'BUILDING_SUMMER_PALACE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-SPEECH' AND Value= 1);
	
--============================================--
-- DUMMY BUILDINGS
-- HolyCity doesn't need one because it is usually 1 city; 2nd religion and 2nd Holy City might allow for 2nd Wonder
--============================================--
INSERT INTO MWfVPConfig 
			(WType,							WDummy,									WActive,	WHasSound)
VALUES		('KUK_DUMMY',					'Kuk Swamp',							2,			0),
			('GATE_OF_SUN_DUMMY',			'Gate of the Sun',						2,			0),
			('GREAT_ZIMBABWE_DUMMY',		'Great Zimbabwe',						2,			0),
			('ITSUKUSHIMA_DUMMY',			'Itsukushima Shrine',					2,			0),
			('QALHAT_DUMMY',				'Qalhat',								2,			0),
			('CHEVALIERS_DUMMY',			'Krak des Chevaliers',					2,			0),
			('KILWA_KISIWANI_DUMMY',		'Kilwa Kisiwani',						2,			0),
			('MARAE_DUMMY',					'Marae Arahurahu',						2,			0),
			('ST_PETERS_DUMMY',				'St. Peter''s Basilica',				2,			0),
			('PANAMA_CANAL_DUMMY',			'Panama Canal',							2,			0),
			('ROCKEFELLER_DUMMY',			'Rockefeller Center',					2,			0),
			('ARECIBO_DUMMY',				'Arecibo Observatory',					2,			0),
			('JUMEIRAH_DUMMY',				'Palm Jumeirah',						2,			0),
			('DARJEELING_DUMMY',			'Darjeeling Himalayan Railway',			2,			0),
			('SANBO_DUMMY',					'Sanbo Honbu',							2,			0),
			('SANBO_2_DUMMY',				'Sanbo Honbu',							2,			0),
			('AUTOBAHN_DUMMY',				'Autobahn',								2,			0),
			('INTERSTATE_DUMMY',			'Interstate',							2,			0),
			('MUSEUM_ISLAND_DUMMY',			'Museum Island',						2,			0),
			('CURIOSITY_DUMMY',				'Curiosity Rover',						2,			0),
			('SEED_VAULT_DUMMY',			'Svalbard Global Seed Vault',			2,			0),
			('TEMBLEQUE_DUMMY',				'Aqueduct of Padre Tembleque',			2,			0);

INSERT INTO BuildingClasses 
			(Type,						Description,				DefaultBuilding)
SELECT		'BUILDINGCLASS_'||WType,	'TXT_KEY_BUILDING_'||WType, 'BUILDING_'||WType
FROM MWfVPConfig WHERE WActive = 2;

INSERT INTO Buildings
			(Type,               BuildingClass,           Description,					PrereqTech, Cost, FaithCost, GreatWorkCount , NukeImmune, ConquestProb, IsDummy)
SELECT		'BUILDING_'||WType, 'BUILDINGCLASS_'||WType, 'TXT_KEY_BUILDING_'||WType,	NULL,       -1,   -1,        -1,              1,          0,			1
FROM MWfVPConfig WHERE WActive = 2;

INSERT INTO Language_en_US 
			(Tag,						Text) 
SELECT		'TXT_KEY_BUILDING_'||WType, WDummy
FROM MWfVPConfig WHERE WActive = 2;				
--============================================--
-- Icons Atlas
--============================================--
-- IconTextureAtlases
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_MORE_WONDERS_'||WType, 256, 'Wonder_'||WType||'_256.dds',	'1', '1' FROM MWfVPConfig;
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_MORE_WONDERS_'||WType, 128, 'Wonder_'||WType||'_128.dds',	'1', '1' FROM MWfVPConfig;
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_MORE_WONDERS_'||WType,  80, 'Wonder_'||WType||'_80.dds',	'1', '1' FROM MWfVPConfig;
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_MORE_WONDERS_'||WType,  64, 'Wonder_'||WType||'_64.dds',	'1', '1' FROM MWfVPConfig;
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_MORE_WONDERS_'||WType,  45, 'Wonder_'||WType||'_45.dds',	'1', '1' FROM MWfVPConfig;
--------------------------------------------------------------
--------------------------------------------------------------
