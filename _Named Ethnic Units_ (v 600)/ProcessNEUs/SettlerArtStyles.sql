-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('SettlerArtStyles');
--======================================================================================================================
-- SETTLER ART STYLES
--======================================================================================================================
INSERT OR REPLACE INTO ArtDefine_UnitInfos
				(Type,										DamageStates,	Formation)
SELECT DISTINCT 'ART_DEF_UNIT__SETTLER'||SUBSTR(Type,13),	1,				'LooseCivilian'
FROM Civilizations WHERE ArtStyleSuffix IN ('_AFRI', '_AMER', '_ASIA');
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Civilizations (Type, Description, Civilopedia, CivilopediaTag, Strategy, Playable, AIPlayable, ShortDescription, Adjective, DefaultPlayerColor, ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, DerivativeCiv, PortraitIndex, IconAtlas, AlphaIconAtlas, MapImage, DawnOfManQuote, DawnOfManImage, DawnOfManAudio, PackageID, SoundtrackTag)
	SELECT Type, Description, Civilopedia, CivilopediaTag, Strategy, Playable, AIPlayable, ShortDescription, Adjective, DefaultPlayerColor, ArtDefineTag, ArtStyleType, 
	SUBSTR(Type,13), ArtStylePrefix, DerivativeCiv, PortraitIndex, IconAtlas, AlphaIconAtlas, MapImage, DawnOfManQuote, DawnOfManImage, DawnOfManAudio, PackageID, SoundtrackTag
FROM Civilizations;
------------------------------------------------------------------------------------------------------------------------
CREATE TEMP TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Civilizations ORDER BY ID;
UPDATE Civilizations SET ID = ( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Civilizations.Type = IDRemapper.Type);
DROP TABLE IDRemapper;

UPDATE sqlite_sequence
SET seq = (SELECT COUNT(ID) FROM Civilizations)-1
WHERE name = 'Civilizations';
------------------------------------------------------------------------------------------------------------------------
UPDATE Units SET UnitArtInfoCulturalVariation = 1 WHERE UnitArtInfoEraVariation <> 1;
CREATE TEMP TABLE GAIA_ArtDefine_UnitInfoMemberInfos AS SELECT * FROM ArtDefine_UnitInfoMemberInfos;
DELETE FROM ArtDefine_UnitInfoMemberInfos;
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_BRAZIL',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER';

--_AFRI
INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_ARABIA',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AFRI';
		
INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_EGYPT',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AFRI';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_ETHIOPIA',	UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AFRI';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_MOROCCO',	UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AFRI';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_OTTOMAN',	UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AFRI';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_PERSIA',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AFRI';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_SONGHAI',	UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AFRI';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_ZULU',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AFRI';

--_AMER
INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_AZTEC',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AMER';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_INCA',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AMER';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_IROQUOIS',	UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AMER';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_MAYA',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AMER';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_SHOSHONE',	UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AMER';

--_ASIA
INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_CHINA',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_ASIA';
		
INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_HUNS',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_ASIA';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_INDIA',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_ASIA';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_INDONESIA',	UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_ASIA';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_JAPAN',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_ASIA';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_KOREA',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_ASIA';

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT__SETTLER_SIAM',		UnitMemberInfoType, NumMembers
FROM GAIA_ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_ASIA';

------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos SELECT * FROM GAIA_ArtDefine_UnitInfoMemberInfos AS t
	WHERE NOT EXISTS (SELECT 1 FROM ArtDefine_UnitInfoMemberInfos AS a WHERE a.UnitInfoType = t.UnitInfoType);
DROP TABLE GAIA_ArtDefine_UnitInfoMemberInfos;

--======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'SettlerArtStyles';
