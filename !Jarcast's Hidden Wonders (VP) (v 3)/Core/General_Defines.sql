--======================================================================================================================================--
-- DEFINES
--======================================================================================================================================--
UPDATE Defines SET Value = 50 WHERE Name = 'BALANCE_CORE_WORLD_WONDER_SAME_ERA_COST_MODIFIER'; --original: 25
UPDATE Defines SET Value = 30 WHERE Name = 'BALANCE_CORE_WORLD_WONDER_PREVIOUS_ERA_COST_MODIFIER'; --original: 15
UPDATE Defines SET Value = 20 WHERE Name = 'BALANCE_CORE_WORLD_WONDER_SECOND_PREVIOUS_ERA_COST_MODIFIER'; --original: 10
UPDATE Defines SET Value = 10 WHERE Name = 'BALANCE_CORE_WORLD_WONDER_EARLIER_ERA_COST_MODIFIER'; --original: 5

UPDATE Language_en_US
SET Text = 'Additional [ICON_PRODUCTION] Production Cost due to owned World Wonders: [COLOR_NEGATIVE_TEXT]{1_Num}%[ENDCOLOR].
[NEWLINE][ICON_PRODUCTION] Production Cost increase factors:
[NEWLINE][ICON_BULLET] Wonders from the same Era: [COLOR_NEGATIVE_TEXT]50%[ENDCOLOR].
[NEWLINE][ICON_BULLET] Wonders from the previous Era: [COLOR_NEGATIVE_TEXT]30%[ENDCOLOR].
[NEWLINE][ICON_BULLET] Wonders from two Eras earlier: [COLOR_NEGATIVE_TEXT]20%[ENDCOLOR].
[NEWLINE][ICON_BULLET] Wonders from three Eras earlier or more: [COLOR_NEGATIVE_TEXT]10%[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_WONDER_COST_INCREASE_METRIC';
--======================================================================================================================================--
-- Table with new Wonder Types
--======================================================================================================================================--
CREATE TABLE IF NOT EXISTS JHWfVPConfig (
	WType			TEXT			NOT NULL);
--======================================================================================================================================--
-- CONFIGURATION
--======================================================================================================================================--
INSERT INTO JHWfVPConfig	
	(WType) VALUES
	--------------ANCIENT--------------------------------------------------------------
	('NIPISAT'),			-- Nipisat
	--------------CLASSICAL------------------------------------------------------------
	('AKRAGATOS'),			-- Temple of Heracles Akragatos
	('PISCINA_MIR'),		-- Piscina Mirabilis
	('BANAUE'),				-- Banaue Rice Terraces
	--------------MEDIEVAL-------------------------------------------------------------
	('KYZ_KALA'),			-- Kyz Kala 
	('ST_CATHERINE'),		-- Saint Catherine's Monastery
	('ASSISI'),				-- Basilica of Saint Francis of Assisi
	('CHURCH_NATIVITY'),	-- Church of the Nativity
	('JETAVANARAMAYA'),		-- Jetavanaramaya (D)
	('OLD_NEW_SYNAGOGUE'),	-- Old New Synagogue of Prague
	('HOSPITAL_STJOHN'),	-- Hospital of Saint John
	('SONGYUE_PAGODA'),		-- Songyue Pagoda
	('HORYUJI'),			-- Horyu-ji
	('TLACHIHUALTEPETL'),	-- Tlachihualtepetl 
	('KELDUR_HALL'),		-- Keldur Hall
	('SHAOLIN'),			-- Shaolin Temple
	--------------RENAISSANCE----------------------------------------------------------
	('PADUA_GARDEN'),		-- Botanical Garden of Padua
	('CHANGDEOKGUNG'),		-- Changdeokgung
	('HARMANDIR_SAHIB'),	-- Harmandir Sahib
	('LARABANGA'),			-- Larabanga Mosque
	('DAMNOEN_SADUAK'),		-- Damnoen Saduak Kesgarh Qila
	('KESHGARH_QILA'),		-- Keshgarh Qila
	('TAKTSANG'),			-- Paro Taktsang
	--------------INDUSTRIAL-----------------------------------------------------------
	('CAPITOLINE'),			-- Capitoline Museums
	('VICTORIA_TERMINUS'),	-- Victoria Terminus
	('LAFERRIERE'),			-- Citadelle Laferrière 
--	('HUMBERSTONE_STLAURA'),-- Humberstone-Santa Laura
--	('OMBILIN_MINE'),		-- Ombilin Coal Mine
	('TE_TII_MARAE'),		-- Te Tii Marae
	('KASUBI_TOMBS'),		-- Muzibu Azaala Mpanga
	--------------MODERN---------------------------------------------------------------
	('GOLDEN_GATE'),		-- Golden Gate Bridge
	('JOHNS_HOPKINS'),		-- Johns Hopkins Hospital
--	('MAX_PLANCK_SOC'),		-- Max Planck Society 
	--------------ATOMIC---------------------------------------------------------------	
--	('NEFT_DASHLARI'),		-- Neft Dashlari
	('CHANGI_AIRPORT'),		-- Singapore Airport
	('WATSON_RC');			-- IBM Watson Research Center
--	('KARAKORAM_HIGHWAY'),	-- Karakoram Highway
	--------------INFORMATION----------------------------------------------------------	
--	('BURJ_KHALIFA');		-- Burj Khalifa
--======================================================================================================================================--
-- WONDERS INITIAL CONFIGURATION
--======================================================================================================================================--
-- BuildingClasses
INSERT INTO BuildingClasses 
		(Type,						Description,					DefaultBuilding,	MaxGlobalInstances)
SELECT	'BUILDINGCLASS_'||WType,	'TXT_KEY_BUILDING_'||WType,		'BUILDING_'||WType, 1
FROM JHWfVPConfig;
--------------------------------------------------------------
-- Buildings
--------------------------------------------------------------
INSERT INTO Buildings
		(Type,               BuildingClass,           Description,                Civilopedia,                       	 Help,								Quote,								ThemingBonusHelp, Cost, FaithCost, NukeImmune, HurryCostModifier, MinAreaSize, ConquestProb, IconAtlas,					PortraitIndex, WonderSplashImage,	WonderSplashAnchor)
SELECT	'BUILDING_'||WType, 'BUILDINGCLASS_'||WType, 'TXT_KEY_BUILDING_'||WType, 'TXT_KEY_BUILDING_'||WType||'_PEDIA', 'TXT_KEY_BUILDING_'||WType||'_HELP',	'TXT_KEY_BUILDING_'||WType||'_QUOTE', NULL,             1,    0,         1,          -5,                -1,          100,          'ATLAS_JAR_WONDERS',		0,             WType||'_splash.dds', 'R,T'
FROM JHWfVPConfig;
--------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType,			BuildingClassType,			BuildingType)
SELECT	'CIVILIZATION_BARBARIAN',	'BUILDINGCLASS_'||WType,	NULL  FROM JHWfVPConfig UNION ALL
SELECT	'CIVILIZATION_MINOR',		'BUILDINGCLASS_'||WType,	NULL  FROM JHWfVPConfig;
--------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType,		FlavorType,			Flavor)
SELECT	'BUILDING_'||WType, 'FLAVOR_WONDER',	20 FROM JHWfVPConfig;
--======================================================================================================================================--
-- Icons Atlas
--======================================================================================================================================--
-- IconTextureAtlases
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
SELECT 'ATLAS_JAR_WONDERS', 256, 'Jar_Wonders_256.dds',	8, 5 UNION ALL
SELECT 'ATLAS_JAR_WONDERS', 128, 'Jar_Wonders_128.dds',	8, 5 UNION ALL
SELECT 'ATLAS_JAR_WONDERS',  80, 'Jar_Wonders_80.dds',	8, 5 UNION ALL
SELECT 'ATLAS_JAR_WONDERS',  64, 'Jar_Wonders_64.dds',	8, 5 UNION ALL
SELECT 'ATLAS_JAR_WONDERS',  45, 'Jar_Wonders_45.dds',	8, 5 ;

UPDATE Buildings SET PortraitIndex = 1  WHERE Type='BUILDING_AKRAGATOS';
UPDATE Buildings SET PortraitIndex = 2  WHERE Type='BUILDING_PISCINA_MIR';
UPDATE Buildings SET PortraitIndex = 3  WHERE Type='BUILDING_KYZ_KALA';
UPDATE Buildings SET PortraitIndex = 4  WHERE Type='BUILDING_ST_CATHERINE';
UPDATE Buildings SET PortraitIndex = 5  WHERE Type='BUILDING_ASSISI';
UPDATE Buildings SET PortraitIndex = 6  WHERE Type='BUILDING_CHURCH_NATIVITY';
UPDATE Buildings SET PortraitIndex = 7  WHERE Type='BUILDING_JETAVANARAMAYA';
UPDATE Buildings SET PortraitIndex = 8  WHERE Type='BUILDING_OLD_NEW_SYNAGOGUE';
UPDATE Buildings SET PortraitIndex = 9  WHERE Type='BUILDING_HOSPITAL_STJOHN';
UPDATE Buildings SET PortraitIndex = 10 WHERE Type='BUILDING_SONGYUE_PAGODA';
UPDATE Buildings SET PortraitIndex = 11 WHERE Type='BUILDING_TLACHIHUALTEPETL';
UPDATE Buildings SET PortraitIndex = 12 WHERE Type='BUILDING_PADUA_GARDEN';
UPDATE Buildings SET PortraitIndex = 13 WHERE Type='BUILDING_CHANGDEOKGUNG';
UPDATE Buildings SET PortraitIndex = 14 WHERE Type='BUILDING_HARMANDIR_SAHIB';
UPDATE Buildings SET PortraitIndex = 15 WHERE Type='BUILDING_LARABANGA';
UPDATE Buildings SET PortraitIndex = 16 WHERE Type='BUILDING_CAPITOLINE';
UPDATE Buildings SET PortraitIndex = 17 WHERE Type='BUILDING_DAMNOEN_SADUAK';
UPDATE Buildings SET PortraitIndex = 18 WHERE Type='BUILDING_KESHGARH_QILA';
UPDATE Buildings SET PortraitIndex = 19 WHERE Type='BUILDING_VICTORIA_TERMINUS';
UPDATE Buildings SET PortraitIndex = 20 WHERE Type='BUILDING_LAFERRIERE';
UPDATE Buildings SET PortraitIndex = 21 WHERE Type='BUILDING_TAKTSANG';
--UPDATE Buildings SET PortraitIndex = 22 WHERE Type='BUILDING_HUMBERSTONE_STLAURA';
--UPDATE Buildings SET PortraitIndex = 23 WHERE Type='BUILDING_OMBILIN_MINE';
UPDATE Buildings SET PortraitIndex = 24 WHERE Type='BUILDING_HORYUJI';
UPDATE Buildings SET PortraitIndex = 25 WHERE Type='BUILDING_TE_TII_MARAE';
UPDATE Buildings SET PortraitIndex = 26 WHERE Type='BUILDING_JOHNS_HOPKINS';
--UPDATE Buildings SET PortraitIndex = 27 WHERE Type='BUILDING_MAX_PLANCK_SOC';
UPDATE Buildings SET PortraitIndex = 28 WHERE Type='BUILDING_GOLDEN_GATE';
--UPDATE Buildings SET PortraitIndex = 29 WHERE Type='BUILDING_NEFT_DASHLARI';
UPDATE Buildings SET PortraitIndex = 30 WHERE Type='BUILDING_CHANGI_AIRPORT';
UPDATE Buildings SET PortraitIndex = 31 WHERE Type='BUILDING_WATSON_RC';
UPDATE Buildings SET PortraitIndex = 32 WHERE Type='BUILDING_KELDUR_HALL';
UPDATE Buildings SET PortraitIndex = 33 WHERE Type='BUILDING_KASUBI_TOMBS';
UPDATE Buildings SET PortraitIndex = 34 WHERE Type='BUILDING_BANAUE';
UPDATE Buildings SET PortraitIndex = 35 WHERE Type='BUILDING_SHAOLIN';
--UPDATE Buildings SET PortraitIndex = 37 WHERE Type='BUILDING_BURJ_KHALIFA';
--UPDATE Buildings SET PortraitIndex = 38 WHERE Type='BUILDING_KARAKORAM_HIGHWAY';

UPDATE Buildings SET PortraitIndex = 36, IconAtlas='ATLAS_JAR_WONDERS' WHERE Type='BUILDING_PALACE_GARDEN';
--======================================================================================================================================--
--======================================================================================================================================--