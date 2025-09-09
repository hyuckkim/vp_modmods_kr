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
VALUES	('TXT_KEY_RELIGION_DINEBAHANE', '디네 바하네ʼ'),
		('TXT_KEY_RELIGION_DINEBAHANE_PEDIA', '디네 바하네ʼ("사람들의 이야기")는 나바호 창조 신화로, 나바호 부족의 태초의 기원을 설명하며 전통적인 나바호의 고향인 디네타(Dinétah)를 중심으로 전개됩니다. 이 이야기는 전통적인 나바호 생활방식의 근간을 이룹니다.
		[NEWLINE] 디네 바하네ʼ의 기본 골자는 니흘치 디인(성스러운 바람)이 창조되어 어둠 속에서 빛의 안개로 일어나, 다양한 디인 디네ʼ에(성스러운 사람들)에게 생명과 목적을 불어넣는 데서 시작됩니다. 이들은 초자연적 존재로, 세 개의 하위 세계에서 각각 신성한 형상을 띠었습니다. 이 모든 것은 지구가 존재하기 전, 인간의 육체가 존재하지 않고 영혼만 있었던 시기에 영적으로 창조된 것이었습니다.
		[NEWLINE] 첫 번째 세계는 검은 세계로, 네 개의 바다 가운데 떠 있는 작은 섬에 자리했습니다. 그곳의 거주자는 성스러운 사람들, 코요테, 안개의 존재들, 그리고 곤충 부족이었습니다. 초자연적 존재인 첫 번째 남자와 첫 번째 여자가 이곳에서 태어나 서로의 불빛을 보고 처음 만났습니다. 그러나 여러 존재가 서로 다투기 시작했고, 결국 동쪽의 출구를 통해 떠나게 됩니다.
		[NEWLINE] 그들은 두 번째 세계 니ʼ 호두틀ʼ이즈(푸른 세계)로 갔는데, 이곳에는 푸른빛의 포유류와 파랑제비 같은 새들이 살고 있었습니다. 그러나 첫 번째 세계에서 온 이들이 제비 추장, 타쉬 지쉬를 노하게 하여 결국 이곳에서도 쫓겨납니다. 첫 번째 남자는 흑옥 등으로 만든 지팡이를 사용해 남쪽 출구를 통해 다음 세계로 올라갈 길을 만들었습니다.
		[NEWLINE] 세 번째 세계 니ʼ 할초이(노란 세계)에는 두 개의 강이 십자를 이루고 성스러운 산들이 있었지만, 아직 태양은 없었습니다. 이곳에도 많은 동물 부족이 있었으나, 이번에는 코요테가 테호올초디의 아이를 훔쳐 대홍수를 일으키자 사람들은 떠나야 했습니다.
		[NEWLINE] 네 번째 세계 니ʼ 호디스쏘스(흰 세계)에 도착했을 때, 사람들은 거품 이는 호수 가운데 섬에 있었고 사방은 절벽으로 둘러싸여 있었습니다. 처음에는 육지로 나갈 길이 없었지만, 성스러운 존재의 도움으로 물이 흘러나가고 바람이 길을 말려주어 마침내 섬을 떠날 수 있었습니다. 이곳에서 성스러운 산이 다시 세워지고, 첫 번째 남자와 첫 번째 여인, 그리고 성스러운 존재들은 태양, 달, 별, 계절을 창조했습니다. 또한 코요테가 돌을 호수에 던져 가라앉게 함으로써 ‘죽음’이 세상에 들어왔습니다.
		[NEWLINE] 네 번째 세계에서 처음 태어난 인간은 아즈자 나들레에였고, 그녀는 곧 영웅 쌍둥이인 나예 네이즈가니와 토바지쉬치니를 낳았습니다. 쌍둥이는 수많은 모험을 통해 세상의 괴물들을 물리쳤습니다. 현대의 인간도 여러 차례 이 세계에서 창조되었으며, 성스러운 존재들은 그들에게 오늘날까지 이어지는 의식을 전해주었습니다.');

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