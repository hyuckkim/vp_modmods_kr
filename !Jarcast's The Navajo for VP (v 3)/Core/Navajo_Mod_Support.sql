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
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_SHOSHONE")
		THEN "_SHOSHONE"
		ELSE "_AMER" END
	) WHERE Type = "CIVILIZATION_JAR_NAVAJO";
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,							CultureType,	CultureEra)
SELECT	('CIVILIZATION_JAR_NAVAJO'),		CultureType,	CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_SHOSHONE';
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------------------------------------
INSERT INTO Religions 
		(Type,					Description,					Civilopedia,					 	IconAtlas,	 			PortraitIndex,	IconString)						   
SELECT	'RELIGION_DINEBAHANE',	'TXT_KEY_RELIGION_DINEBAHANE',	'TXT_KEY_RELIGION_DINEBAHANE_PEDIA',	'RELIGION_ATLAS_DINEBAHANE',	0,	'[ICON_RELIGION_DINEBAHANE]' WHERE EXISTS (SELECT * FROM Religions WHERE Type='RELIGION_IMPERIAL_CULT');

INSERT INTO Language_en_US	(Tag, Text)
VALUES	('TXT_KEY_RELIGION_DINEBAHANE', 'Diné Bahaneʼ'),
		('TXT_KEY_RELIGION_DINEBAHANE_PEDIA', 'Diné Bahaneʼ ("Story of the People"), the Navajo creation story, describes the prehistoric emergence of the Navajos, and centers on the area known as the Dinétah, the traditional homeland of the Navajo people. This story forms the basis for the traditional Navajo way of life.
		[NEWLINE] The basic outline of Diné Bahaneʼ begins with the Niłchiʼ Diyin (Holy Wind) being created, the mists of lights which arose through the darkness to animate and bring purpose to the myriad Diyin Dineʼé (Holy People), supernatural and sacred in the different three lower worlds. All these things were spiritually created in the time before the earth existed and the physical aspect of humans did not exist yet, but the spiritual did.
		[NEWLINE] The First World, which was black, was small and centered on an island floating in a the middle of four seas. The inhabitants of the first world were Diyin Dineʼé, Coyote, mist beings and various insect people. The supernatural beings First Woman and First Man came into existence here and met for the first time after seeing each other''s fire. The various beings started fighting with one another and departed by flying out an opening in the east.
		[NEWLINE] They journeyed to the Second World, Niʼ Hodootlʼizh, which was blue and was inhabited by various blue-gray furred mammals and various birds, including blue swallows. The beings from the First World offended Swallow Chief, Tʼash Jíshi, and they were asked to leave. First Man created a wand of jet and other materials to allow the people to walk upon it up into the next world through an opening in the south.
		[NEWLINE] In the Third World, Niʼ Hałtsooí, which was yellow and there were two rivers that formed a cross and the Sacred Mountains but there was still no sun. More animal people lived here too. This time it was not discord among the people that drove them away but a great flood caused by Tééhoołtsódii when Coyote stole her child.
		[NEWLINE] When the people arrived in The Fourth World, Niʼ Hodisxǫs, which was white, they saw that they were on an island in the middle of a bubbling lake, surrounded by high cliffs . At first the people could not find a way to get across the water to the shore. They called on Baptizer God to help them. He had brought four great stones with him from the Third World. He threw one to the east. When it hit the cliff wall, it broke a hole through it, and water began to flow out of the lake. He threw a stone to the south. He threw one to the west. And to the north he threw one. Each stone created a hole in the cliff, and the water of the lake became lower. A lane now connected the island to the shore to the east, but it was deep with mud. The people called on Níòchʼi dilkooh, Smooth Wind, to help them. He blew steadily for a long time, and finally the people were able to leave the island.
		[NEWLINE] The Sacred Mountains were re-formed from soil taken from the original mountains in the Second World. First Man, First Woman, and the Holy People created the sun, moon, seasons, and stars. It was here that true death came into existence via Coyote tossing a stone into a lake and declaring that if it sank then the dead would go back to the previous world.
		[NEWLINE] The first human born in the Fourth World is Asdzaa Nádleehé who, in turn, gives birth to the Hero Twins called Naayééʼ Neizghání and Tóbájíshchíní. The twins have many adventures in which they helped to rid the world of various monsters. Multiple batches of modern humans were created a number of times in the Fourth World and the Diyin Dineʼé gave them ceremonies which are still practiced today.');

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DINEBAHANE' )
		THEN 'RELIGION_DINEBAHANE'
		ELSE 'RELIGION_CHRISTIANITY' END 
	) WHERE CivilizationType = 'CIVILIZATION_JAR_NAVAJO';

CREATE TRIGGER CivilizationTierNAVAJO
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_JAR_NAVAJO' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DINEBAHANE' )
			THEN 'RELIGION_DINEBAHANE'
			ELSE 'RELIGION_CHRISTIANITY' END 
		) WHERE CivilizationType = 'CIVILIZATION_JAR_NAVAJO';
END;
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24 / 25)
--==========================================================================================================================
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,		X,		Y,		AltX,	AltY)
		-- v23/24
VALUES	('CIVILIZATION_JAR_NAVAJO',	'Yagem',		138,	59,		null,	null),
		('CIVILIZATION_JAR_NAVAJO',	'Yahem',		18,		52,		null,	null),
		('CIVILIZATION_JAR_NAVAJO',	'Cordiform',	 8,		35,		null,	null),
		('CIVILIZATION_JAR_NAVAJO',	'GreatestEarth', 9,		42,		null,	null),
		('CIVILIZATION_JAR_NAVAJO',	'Americas',		34,		52,		null,	null),
		('CIVILIZATION_JAR_NAVAJO',	'AmericasGiant', 32,	112,	null,	null),
		('CIVILIZATION_JAR_NAVAJO',	'NorthAmericaGiant', 46, 47,	null,	null),
		('CIVILIZATION_JAR_NAVAJO',	'NorthAmericaHuge', 110,  3,	null,	null),
		('CIVILIZATION_JAR_NAVAJO',	'Pacific',		111,	51,		null,	null),
		-- v25
		('CIVILIZATION_JAR_NAVAJO',	'AtlanticGiant', 37,	84,		null,	null),
		('CIVILIZATION_JAR_NAVAJO',	'EarthMk3',		132,	63,		null,	null);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JAR_NAVAJO',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
-------------------------------------   
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JAR_NAVAJO',	ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, 'AS2D_SOUND_JFD_SIOUX'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--==========================================================================================================================
--==========================================================================================================================