--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,		X,		Y,		AltX,	AltY)
		-- v23/24
VALUES	('CIVILIZATION_JAR_TIBET',	'Yagem',		70,		55,		null,	null),
		('CIVILIZATION_JAR_TIBET',	'Yahem',		95,		50,		null,	null),
		('CIVILIZATION_JAR_TIBET',	'Cordiform',	61,		25,		null,	null),
		('CIVILIZATION_JAR_TIBET',	'GreatestEarth', 56,	27,		null,	null),
		('CIVILIZATION_JAR_TIBET',	'AfriAsiaAust',  86,	63,		null,	null),
		-- v25
		('CIVILIZATION_JAR_TIBET',	'EarthMk3',		73,		56,		null,	null);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JAR_TIBET',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- R.E.D. / Ethnic Units
--==========================================================================================================================
-- Civilizations
------------------------------  
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_CHINA' )
	THEN '_CHINA'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_JAR_TIBET';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,					CultureType, CultureEra)
SELECT	'CIVILIZATION_JAR_TIBET',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_CHINA';
--=======================================================================================================================	
-- Historical Religions Support
--=======================================================================================================================	
UPDATE Civilization_Religions 
SET ReligionType = ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_VAJRAYANA' )
		THEN 'RELIGION_VAJRAYANA'
		ELSE 'RELIGION_BUDDHISM' END) 
WHERE CivilizationType = 'CIVILIZATION_JAR_TIBET';

CREATE TRIGGER ReligionMCTibet
AFTER INSERT ON Religions WHEN 'RELIGION_VAJRAYANA' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_VAJRAYANA'
	WHERE CivilizationType = 'CIVILIZATION_JAR_TIBET';
END;
--==========================================================================================================================
-- RYOGA's UNIQUE CULTURAL INFLUENCE
--==========================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES(
		'TXT_KEY_GENERIC_JAR_TIBET_INFLUENTIAL_ON_AI_1',
		'Our people are now wearing your Khatas and eating your yak yoghurt. I worry the rest of the world will also succumb to the influence of your culture.'
	);
INSERT OR REPLACE INTO Language_ko_KR (Tag, Text)
VALUES(
		'TXT_KEY_GENERIC_JAR_TIBET_INFLUENTIAL_ON_AI_1',
		'우리 백성들이 이제는 당신들의 카타를 목에 걸고, 야크 요구르트를 먹고 있소. 온 세상이 당신 문화의 영향력에 굴복할까 걱정이 되는군요.'
	);
--==========================================================================================================================
-- Unit Scaling and Formation for VP
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS  ArtDefine_USnF (
						  	USnF_id INTEGER PRIMARY KEY AUTOINCREMENT, 
							USnF_Type TEXT DEFAULT NULL, 
							USnF_UnitInfo TEXT NOT NULL, 
							USnF_UnitMemberInfo TEXT NOT NULL, 
							USnF_Domain TEXT DEFAULT NULL, 
							USnF_ModMod TEXT DEFAULT NULL, 
							USnF_Scale FLOAT DEFAULT 0, 
							USnF_NumMembers INTEGER DEFAULT -1, 
							USnF_Formation TEXT DEFAULT NULL, 
							USnF_ScaleMultiplier FLOAT DEFAULT 1);
							
CREATE TABLE IF NOT EXISTS  ArtDefine_USnFModCompatibility (
						  	USnF_id INTEGER PRIMARY KEY AUTOINCREMENT, 
							USnF_ModMod TEXT UNIQUE ON CONFLICT IGNORE);
													
INSERT  INTO ArtDefine_USnF
(USnF_UnitInfo, 			USnF_UnitMemberInfo, USnF_Type, USnF_Domain, USnF_ModMod, USnF_Scale, USnF_NumMembers, USnF_Formation) VALUES
('ART_DEF_UNIT_JAR_DOBDOB',	'ART_DEF_UNIT_MEMBER_JAR_DOBDOB',	'RED',	'LAND',	'TibetVP',   0.078, 	15, 'EarlyGreatArtist'),
('ART_DEF_UNIT_JAR_DOBDOB',	'ART_DEF_UNIT_MEMBER_JAR_DOBDOB',	'RUG',	'LAND',	'TibetVP',   0.162, 	3, 'EarlyGreatArtistRUG'),
('ART_DEF_UNIT_JAR_DOBDOB',	'ART_DEF_UNIT_MEMBER_JAR_DOBDOB',	'SUG',	'LAND',	'TibetVP',   0.25, 		1, 'EarlyGreatArtist');

INSERT INTO ArtDefine_USnFModCompatibility (USnF_ModMod)
SELECT 'TibetVP' WHERE EXISTS (SELECT * FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_JAR_DOBDOB');
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
-------------------------------------
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			CultureType,				UnitDialogueTag)
SELECT	'CIVILIZATION_JAR_TIBET',	'CULTURE_JFD_HIMALAYAN', 	'AS2D_SOUND_JFD_INDIAN';
--==========================================================================================================================
--==========================================================================================================================