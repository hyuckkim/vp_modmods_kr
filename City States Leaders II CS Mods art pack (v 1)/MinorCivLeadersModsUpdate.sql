--SCENARIOS
--=========

--"Red Planet" by FramedArchitect
--ed90c71d-589b-4325-bf32-f2652a17b40c
---------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_RAGUSA', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_RED_PLANET_AUSTRALIA'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_RAGUSA'
	AND Text='Australian Mine No. 1'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_ALMATY', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_RED_PLANET_ASIA_UNITED'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_ALMATY'
	AND Text='Asia United Outpost'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_GENEVA', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_RED_PLANET_EUROPEAN_UNION'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_GENEVA'
	AND Text='Europaische Gemeinschaft'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_BUDAPEST', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_RED_PLANET_UNITED_NATIONS'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_BUDAPEST'
	AND Text='U.N. Mars Delegation'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_GENOA', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_RED_PLANET_OUTWORLD_MINING'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_GENOA'
	AND Text='Outworld Mining Corporation'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_MONACO', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_RED_PLANET_BRAZIL'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_MONACO'
	AND Text='Brasil em Marte'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_FLORENCE', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_RED_PLANET_INDONESIA'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_FLORENCE'
	AND Text='Stasiun Indonesia'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_BUCHAREST', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_RED_PLANET_SOUTH_AFRICA'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_BUCHAREST'
	AND Text='Nuwe Suid-Afrika'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_BELGRADE', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_RED_PLANET_SLAVIC_ALLIANCE'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_BELGRADE'
	AND Text='Slowianski Sojusz'));

--"Civilizations of Warcraft" by Bamington et al.
--790f1ef9-58ff-4a2f-bb49-b1a3f9a91b12
--"Civilizations of Warcraft - Warcraft Citystates" by Bamington et al.
--1c81be2b-edf4-4ccf-b836-46e7d1d2a2a2
-----------------------------------------------------------------------
--TXT_KEY_CITYSTATE_BRUSSELS --> 'Amber Ledge'
--TXT_KEY_CITYSTATE_KUALA_LUMPUR --> 'Caverns of Time'
--TXT_KEY_CITYSTATE_BUCHAREST --> 'Crypt of Remembrance'
--TXT_KEY_CITYSTATE_MILAN --> 'Timbermaw Hold'
--TXT_KEY_CITYSTATE_FLORENCE --> 'Thorium Point'
--TXT_KEY_CITYSTATE_MONACO --> 'Fuselight'
--TXT_KEY_CITYSTATE_PRAGUE --> 'Uldaman'
--TXT_KEY_CITYSTATE_VIENNA --> 'Dire Maul'
--TXT_KEY_CITYSTATE_YEREVAN --> 'Sanctum of the Sun'
--TXT_KEY_CITYSTATE_QUEBEC_CITY --> 'Kul Tiras'
--TXT_KEY_CITYSTATE_CAPE_TOWN --> 'Bloodsail Compound'
--TXT_KEY_CITYSTATE_SYDNEY --> 'Ravenholdt'
--TXT_KEY_CITYSTATE_RAGUSA --> 'Mao-ki Harbour'
--TXT_KEY_CITYSTATE_LISBON --> 'Kamagua'
--TXT_KEY_CITYSTATE_MANILA --> 'Nighthaven'
--TXT_KEY_CITYSTATE_MOMBASA --> 'Dawns Blossom'
--TXT_KEY_CITYSTATE_SINGAPORE --> 'Gadgetzan'
--TXT_KEY_CITYSTATE_ANTWERP --> 'Ratchet'
--TXT_KEY_CITYSTATE_CAHOKIA --> 'Booty Bay'
--TXT_KEY_CITYSTATE_COLOMBO --> 'Everlook' --> 'Bogpaddle'
--TXT_KEY_CITYSTATE_GENOA --> 'Syndicate Hold'
--TXT_KEY_CITYSTATE_HONG_KONG --> 'Aeris Landing'
--TXT_KEY_CITYSTATE_TYRE --> 'Cosmowrench'
--TXT_KEY_CITYSTATE_ZANZIBAR --> 'Everlook'
--TXT_KEY_CITYSTATE_ZURICH --> 'K3'
--TXT_KEY_CITYSTATE_ALMATY --> 'Cenarion Hold'
--TXT_KEY_CITYSTATE_BELGRADE --> 'Crusaders Pinnacle'
--TXT_KEY_CITYSTATE_BUDAPEST --> 'Skorn'
--TXT_KEY_CITYSTATE_VALLETTA --> 'Kaskala'
--TXT_KEY_CITYSTATE_SIDON --> 'Vermillion Redoubt'
--TXT_KEY_CITYSTATE_HANOI --> 'The Deadmines'
--TXT_KEY_CITYSTATE_GENEVA --> 'Bouldercrags Refuge'
--TXT_KEY_CITYSTATE_VATICAN_CITY --> 'Cenarion Refuge'
--TXT_KEY_CITYSTATE_JERUSALEM --> 'Darkmoon Faire'
--TXT_KEY_CITYSTATE_KATHMANDU --> 'Ramkahen'
--TXT_KEY_CITYSTATE_LA_VENTA --> 'Marshals Stand'
--TXT_KEY_CITYSTATE_LHASA --> 'Peak of Serenity'
--TXT_KEY_CITYSTATE_WITTENBERG --> 'Oshugun'


--REPLACEMENTS FOR NEW CIVS
--=========================

--"Argentina Civilization" by Leugi
--4050cf28-434b-4df9-8689-c7d0a5a54358
-----------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_BUENOS_AIRES', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_MONTEVIDEO'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_BUENOS_AIRES'
	AND Text='Montevideo'));

--"The Kingdom of Armenia" by JFD
--bc011e1c-e076-4f9d-9efe-3e4d1a57679d
-----------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_YEREVAN', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_TBLISI'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_YEREVAN'
	AND Description='TXT_KEY_CITYSTATE_JFD_TBILISI_DESC'));

--"Colonialist Legacies: Australia Civilization" by TPangolin et al.
--d5306113-7b0c-4e49-b4b4-15d37157ceb8
--------------------------------------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_MELBOURNE', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_DUBAI'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_MELBOURNE'
	AND Description='TXT_KEY_CITYSTATE_DUBAI'));
--old version:
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_SYDNEY', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_MONTEVIDEO'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_SYDNEY'
	AND Description='TXT_KEY_CITYSTATE_MONTEVIDEO'));
--new version:
--INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
--	SELECT 'MINOR_CIV_SYDNEY', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
--	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_HONIARA'
--	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_SYDNEY'
--	AND Description='TXT_KEY_CITYSTATE_HONIARA'));

--Colonialist Legacies: Canada Civilization by TPangolin et al.
--f9507e9b-077f-4718-9389-87f7cb509ae5
---------------------------------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_QUEBEC_CITY', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_NUUK'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_QUEBEC_CITY'
	AND Description='TXT_KEY_CITYSTATE_NUUK'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_VANCOUVER', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_ST_JOHNS'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_VANCOUVER'
	AND Description='TXT_KEY_CITYSTATE_STJOHNSNEWF'));

--"Gran Colombia Civilization" by Leugi
--a8278e2d-2c9c-42ea-b08f-aa09313ff929
---------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_BOGOTA', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_QUITO'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_BOGOTA'
	AND Text='Quito'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_PANAMA_CITY', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_SAN_JUAN'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_PANAMA_CITY'
	AND Text='San Juan'));

--"Hungary" by LastSword
--9fbbe85b-3fad-4c64-a569-87c4da346273
---------------------------------
--INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
--	SELECT 'MINOR_CIV_BUDAPEST', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
--	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_PRISTINA'
--	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_BUDAPEST'
--	AND Description='TXT_KEY_CITYSTATE_LS_PRISTINA'));

--"The Kingdom of Hungary" by JFD
--1fcd9459-75d6-4e44-83e5-c88e4b00b795
---------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_BUDAPEST', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_TRIPOLI'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_BUDAPEST'
	AND Description='TXT_KEY_CITYSTATE_JFD_TRIPOLI'));

--"Israel Civilization" by Leugi
--35e27828-cf22-4aec-b087-08169fa4e429
--------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_JERUSALEM', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_BALKH'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_JERUSALEM'
	AND Text='Balkh'));

--"LS Civilization Set II: Kingdom of Jerusalem" by LastSword
--ccc4e2ba-83f8-4ab0-b3b3-de82f6e878ff
-------------------------------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_JERUSALEM', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_HAIFA_AKKA'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_JERUSALEM'
	AND Description='TXT_KEY_CITYSTATE_HAIFA_AKKA'));

--"Kongo" by Tomatekh et al.
--684ce03a-e1d4-4df9-84f8-f4543d6a435d
----------------------------
--INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
--	SELECT 'MINOR_CIV_MBANZA_KONGO', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
--	FROM MinorCivLeaders WHERE Type='MINOR_CIV_LUBA'
--	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_MBANZA_KONGO'
--	AND Description='TXT_KEY_CITYSTATE_LUBA');

--"Latvia" by Hiram
--17697195-2cc5-4ff6-984d-29f3ad206840
-------------------
--MINOR_CIV_GASTEIZ

--"The Grand Duchy of Lithuania" by JFD
--575a3187-ced4-47de-990b-53ce965035a1
---------------------------------------
--INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
--	SELECT 'MINOR_CIV_VILNIUS', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
--	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_DORPAT'
--	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_VILNIUS'
--	AND Description='TXT_KEY_CITYSTATE_JFD_DORPAT_DESC'));

--"LS Civilization Set VI: Lithuania" by LastSword
--392f5317-2467-460e-ab40-9b1b600e331c
--------------------------------------------------
--INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
--	SELECT 'MINOR_CIV_VILNIUS', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
--	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_KITION'
--	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_VILNIUS'
--	AND Description='TXT_KEY_CITYSTATE_KITION'));

--"LS Civilization Set IV: Kingdom of Nepal" by LastSword
--04760492-5523-4cee-85b3-9146f5edc34f
---------------------------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_KATHMANDU', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_MONTEVIDEO'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_KATHMANDU'
	AND Description='TXT_KEY_CITYSTATE_LS_MONTEVIDEO'));

--"LS Civilization Set V: Olmec Empire" by LastSword
--2b06b560-17b0-4103-9fdb-fb6c2a0fbc6e
----------------------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_LA_VENTA', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_SALASAR'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_LA_VENTA'
	AND Description='TXT_KEY_CITYSTATE_SALASAR_LS'));

--"Colonialist Legacies: Philippines Civilization" by TPangolin et al.
--2b5ad645-8094-4ed7-a488-1e49eb9277aa
----------------------------------------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_MANILA', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_TAIPEI'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_MANILA'
	AND Description='TXT_KEY_CITYSTATE_JFD_TAIPEI_DESC'));

--"Phoenicia Civ" by the Mayor of steve
--b1861c23-92a7-46ef-9180-38adee419369
---------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_SIDON', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_MOZAMBIQUE'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_SIDON'
	AND Text='Mozambique'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_SIDON', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_MOZAMBIQUE'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_SIDON'
	AND Text='Mozambique'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_TYRE', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_ABU_DHABI'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_TYRE'
	AND Text='Abu Dhabi'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_TYRE', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_ABU_DHABI'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_TYRE'
	AND Text='Abu Dhabi'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_BYBLOS', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_KUWAIT_CITY'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_BYBLOS'
	AND Text='Kuwait City'));

--"Phoenician Civilization" by sukritact et al.
--c4eff830-2f6b-46d5-988e-b6ed61e7e236
-----------------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_SIDON', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_GALATIA'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_SIDON'
	AND Text='Galatia'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_SIDON', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_GALATIA'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_SIDON'
	AND Text='Galatia'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_TYRE', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_CYRENE'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_TYRE'
	AND Text='Cyrene'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_TYRE', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_CYRENE'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_TYRE'
	AND Text='Cyrene'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_BYBLOS', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_SYRACUSE'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_BYBLOS'
	AND Text='Syracuse'));

--"LS Civilization Set III: Phoenician Empire" by LastSword
--55a68ae4-64cc-4eec-8981-5b6ec31d6e88
-----------------------------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_TYRE', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_NAPATA'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_TYRE'
	AND Description='TXT_KEY_CITYSTATE_LS_NAPATA'));

--"LS Civilization Set VIII: Romania Civ" by LastSword
--0474fd37-a41e-43b9-88be-81da4b112d52
---------------------------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_BUCHAREST', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_LA_PAZ'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_BUCHAREST'
	AND Description='TXT_KEY_CITYSTATE_LA_PAZ'));

--"The Swiss Confederacy" by JFD
--205aa32b-9ee1-4ad8-8c42-4fcde1d4f417
--------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_GENEVA', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_THIMPHU'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_GENEVA'
	AND Description='TXT_KEY_CITYSTATE_JFD_THIMPHU_DESC'));
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_ZURICH', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_LUBECK'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_ZURICH'
	AND Description='TXT_KEY_CITYSTATE_JFD_LUBECK_DESC'));

--"Tibetan Civilization" by Pouakai
--184ce8f0-91ef-46d1-9aa2-6f72cc492a85
-----------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_LHASA', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_VARANASI'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_LHASA'
	AND Text='Varanasi'));

--"LS Civilization Set VIII: Tibetan Empire" by LastSword
--0474fd37-a41e-43b9-88be-81da4b112d52
---------------------------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_LHASA', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_SARNARTH'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_LHASA'
	AND Description='TXT_KEY_CITYSTATE_SARNARTH'));

--"LS Civilization Set III: Timurid Empire" by LastSword
--55a68ae4-64cc-4eec-8981-5b6ec31d6e88
--------------------------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_SAMARKAND', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_BASEL'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_SAMARKAND'
	AND Description='TXT_KEY_CITYSTATE_LS_BASEL'));

--"Tuscan Civilization" by sukritact
--b8bba8fe-c7b7-4fe1-9e21-950fd6180e98
------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_FLORENCE', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_MANTUA'
	AND EXISTS (SELECT * FROM Language_en_US WHERE Tag='TXT_KEY_CITYSTATE_FLORENCE'
	AND Text='Mantua'));

--"Kievan Rus" [Ukraine] by Tomatekh
--fb32237f-8e78-42ac-aaff-21af31dc415a
------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_KIEV', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_MINSK'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_KIEV'
	AND Description='TXT_KEY_CITYSTATE_MOD_MINSK'));

--"LS Civilization Set I: Hetmanate" by LastSword
--4481702e-758e-4fd3-9760-308f8efafa74
----------------------------------------------------
--INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
--	SELECT 'MINOR_CIV_KIEV', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
--	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_TORONTO'
--	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_KIEV'
--	AND Description='TXT_KEY_CITYSTATE_TORONTO'));

--"LS Civilization Set II: The Papal States" by LastSword
--ccc4e2ba-83f8-4ab0-b3b3-de82f6e878ff
---------------------------------------------------------
INSERT OR REPLACE INTO MinorCivLeaders (Type, LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName)
	SELECT 'MINOR_CIV_VATICAN_CITY', LeaderIcon, ModernCountry, ShortModernCountry, LeaderPlace, LeaderName, LeaderTitle, LeaderSuffix, LeaderArtistName
	FROM MinorCivLeaders WHERE (Type='MINOR_CIV_TOUBA'
	AND EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_VATICAN_CITY'
	AND Description='TXT_KEY_CITYSTATE_TOUBA'));


--Mods that just delete the offending city-states:
--================================================
--"Belgian Kingdom" by SibCDC [MINOR_CIV_BRUSSELS/MINOR_CIV_ANTWERP]
--"Bulgaria (Krum)" by davey_henninger [MINOR_CIV_SOFIA]
--"Phoenicia" by Davii Adams [MINOR_TYRE/MINOR_SIDON]
--"Romania" by davey_henninger [MINOR_CIV_BUCHAREST]
--"Switzerland" by Krateng [MINOR_CIV_GENEVA/MINOR_CIV_ZURICH]