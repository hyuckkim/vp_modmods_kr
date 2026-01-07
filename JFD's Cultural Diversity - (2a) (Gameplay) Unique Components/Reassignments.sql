--- new art first
--------------------------------------------------------------------------------------------------------------------------
-- IconFontTextures
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconFontTextures 
		(IconFontTexture, 									IconFontTextureFile)
VALUES	
	('ICON_FONT_TEXTURE_CULDIV_CD_PATAGONIAN', 		'FontIcons_Nandu_22'),
	('ICON_FONT_TEXTURE_CULDIV_CD_SCANDINAVIAN', 		'FontIcons_Scandinavian_22'),
	('ICON_FONT_TEXTURE_CULDIV_CD_CRESCENT', 		'FontIcons_Crescent_22');
--------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconFontMapping 
	(IconName, IconFontTexture, IconMapping)
VALUES	
	('ICON_CULTURE_CD_PATAGONIAN',  'ICON_FONT_TEXTURE_CULDIV_CD_PATAGONIAN', 1),
	('ICON_CULTURE_CD_SCANDINAVIAN',  'ICON_FONT_TEXTURE_CULDIV_CD_SCANDINAVIAN', 1),
	('ICON_CULTURE_CD_CRESCENT',  'ICON_FONT_TEXTURE_CULDIV_CD_CRESCENT', 1);
--=========================================================================================================================
-- ICON ATLASES
--=========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO IconTextureAtlases 
	(Atlas, IconSize, 	Filename, 	IconsPerRow, 	IconsPerColumn)
VALUES	
	('CULDIV_CD_PATAGONIAN_ICON_ATLAS', 		256, 			'Nandu_256.dds',		1, 				1),
	('CULDIV_CD_PATAGONIAN_ICON_ATLAS', 		80, 			'Nandu_80.dds',			1, 				1),
	('CULDIV_CD_PATAGONIAN_ICON_ATLAS', 		64, 			'Nandu_64.dds',			1, 				1),
	('CULDIV_CD_PATAGONIAN_ICON_ATLAS', 		45, 			'Nandu_45.dds',			1, 				1),

	('CULDIV_CD_SCANDINAVIAN_ICON_ATLAS', 		256, 			'Scandinavian_256.dds',			1, 				1),
	('CULDIV_CD_SCANDINAVIAN_ICON_ATLAS', 		80, 			'Scandinavian_80.dds',			1, 				1),
	('CULDIV_CD_SCANDINAVIAN_ICON_ATLAS', 		64, 			'Scandinavian_64.dds',			1, 				1),
	('CULDIV_CD_SCANDINAVIAN_ICON_ATLAS', 		45, 			'Scandinavian_45.dds',			1, 				1),

	('CULDIV_CD_CRESCENT_ICON_ATLAS', 		256, 			'Crescent_256.dds',			1, 				1),
	('CULDIV_CD_CRESCENT_ICON_ATLAS', 		80, 			'Crescent_80.dds',			1, 				1),
	('CULDIV_CD_CRESCENT_ICON_ATLAS', 		64, 			'Crescent_64.dds',			1, 				1),
	('CULDIV_CD_CRESCENT_ICON_ATLAS', 		45, 			'Crescent_45.dds',			1, 				1);

INSERT INTO IconTextureAtlases 
		(Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES	
	('CULDIV_CD_SCANDINAVIAN_ALPHA_ATLAS', 45, 	'ScandinavianAlpha_48.dds', 1, 	1);
--========================================================================================================================
----------------------------------------------
-- new cultures
----------------------------------------------
INSERT INTO JFD_CultureTypes
	(Type, BranchType, LowerTag, ShortDescription, 
	StartDistance, StartingEraTag, FontIcon, IconAtlas, IconAlphaAtlas, PortraitIndex, AlphaIndex, 
	DefeatScreenTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT
	'CULTURE_CD_CELTIC', BranchType, LowerTag, ShortDescription, 
	StartDistance, StartingEraTag, FontIcon, IconAtlas, IconAlphaAtlas, PortraitIndex, AlphaIndex, 
	DefeatScreenTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM JFD_CultureTypes WHERE Type = 'CULTURE_JFD_NORTHERN';

INSERT INTO JFD_CultureTypes
	(Type, BranchType, LowerTag, ShortDescription, 
	StartDistance, StartingEraTag, FontIcon, IconAtlas, IconAlphaAtlas, PortraitIndex, AlphaIndex, 
	DefeatScreenTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT
	'CULTURE_CD_PATAGONIAN', BranchType, LowerTag, ShortDescription, 
	StartDistance, StartingEraTag, FontIcon, IconAtlas, IconAlphaAtlas, PortraitIndex, AlphaIndex, 
	DefeatScreenTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM JFD_CultureTypes WHERE Type = 'CULTURE_JFD_ANDEAN';

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_CULTURE_CD_PATAGONIAN_SHORT_DESC', 'Patagonian'),
	('TXT_KEY_CULTURE_CD_CELTIC_SHORT_DESC', 'Celtic');

UPDATE JFD_CultureTypes SET
FontIcon = '[ICON_CULTURE_CD_PATAGONIAN]',
IconAtlas = 'CULDIV_CD_PATAGONIAN_ICON_ATLAS',
ShortDescription = 'TXT_KEY_CULTURE_CD_PATAGONIAN_SHORT_DESC'
WHERE Type = 'CULTURE_CD_PATAGONIAN';

UPDATE JFD_CultureTypes SET ShortDescription = 'TXT_KEY_CULTURE_CD_CELTIC_SHORT_DESC' WHERE Type = 'CULTURE_CD_CELTIC';

-----------------
-- sub cultures 
-----------------
INSERT INTO JFD_CultureSubTypes
		(CultureType,					Type,										LowerTag,						ShortDescription)
VALUES	('CULTURE_JFD_CENTRAL',		'SUBCULTURE_JFD_CENTRAL_SLAVIC',			'JFD_CentralSlavic',			'TXT_KEY_CULTURE_SUB_JFD_CENTRAL_SLAVIC_SHORT_DESC');

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_CULTURE_SUB_JFD_CENTRAL_SLAVIC_SHORT_DESC', 'West Slavic');

UPDATE Civilization_JFD_CultureTypes SET
SubCultureType = 'SUBCULTURE_JFD_CENTRAL_SLAVIC'
WHERE CivilizationType = 'CIVILIZATION_POLAND';

----------------------------------------------
-- changes to existing cultures
----------------------------------------------
-- first some outdated (Eurocentric) terms
UPDATE Language_en_US SET
Text = 'Central European'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_CENTRAL_SHORT_DESC';

UPDATE Language_en_US SET
Text = 'East Asian'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_FAR_EASTERN_SHORT_DESC';

UPDATE Language_en_US SET
Text = 'East European'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_EASTERN_SHORT_DESC';

UPDATE Language_en_US SET
Text = 'West European'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_WESTERN_SHORT_DESC';

UPDATE Language_en_US SET
Text = 'South European'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_SOUTHERN_SHORT_DESC';
------------------------------------------------
UPDATE JFD_CultureTypes SET
FontIcon = '[ICON_CULTURE_CD_SCANDINAVIAN]',
IconAtlas = 'CULDIV_CD_SCANDINAVIAN_ICON_ATLAS'
WHERE Type = 'CULTURE_JFD_NORTHERN';

UPDATE Language_en_US SET
Text = 'Scandinavian'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_NORTHERN_SHORT_DESC';

--------------------------------------------------
UPDATE Language_en_US SET
Text = 'Guinean'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_CENTRAL_AFRICAN_SHORT_DESC';

-- load order might be an issue so do it both ways
-- do this again with a trigger in DummyPolicies.sql
UPDATE Civilization_JFD_CultureTypes SET
CultureType = 'CULTURE_JFD_CENTRAL_AFRICAN'
WHERE CivilizationType IN ('CIVILIZATION_CL_NIGERIA');

---------------------------------------------
UPDATE Language_en_US SET
Text = 'Levantine'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_MESOPOTAMIC_SHORT_DESC';

UPDATE JFD_CultureTypes SET
FontIcon = '[ICON_CULTURE_CD_CRESCENT]',
IconAtlas = 'CULDIV_CD_CRESCENT_ICON_ATLAS'
WHERE Type = 'CULTURE_JFD_MESOPOTAMIC';

UPDATE Civilization_JFD_CultureTypes SET
CultureType = 'CULTURE_JFD_MESOPOTAMIC'
WHERE CultureType = 'CULTURE_JFD_LEVANTINE';

---------------------------------------------
UPDATE Language_en_US SET
Text = 'Saharan'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_WEST_AFRICAN_SHORT_DESC';

--------------------------------------------
-- changes to cultural groups default
--------------------------------------------
UPDATE Civilization_JFD_CultureTypes SET
CultureType = 'CULTURE_CD_CELTIC'
WHERE CivilizationType = 'CIVILIZATION_CELTS';

UPDATE Civilization_JFD_CultureTypes SET
CultureType = 'CULTURE_JFD_NORTHERN'
WHERE CivilizationType = 'CIVILIZATION_SWEDEN';

UPDATE Civilization_JFD_CultureTypes SET
CultureType = 'CULTURE_JFD_WEST_AFRICAN'
WHERE CivilizationType = 'CIVILIZATION_MOROCCO';

-- this means garamantes should be treated separately as they copy morocco
-- load order might be an issue so do it both ways
-- do this again with a trigger in DummyPolicies.sql
UPDATE Civilization_JFD_CultureTypes SET
CultureType = 'CULTURE_JFD_WEST_AFRICAN'
WHERE CivilizationType IN ('CIVILIZATION_ANCIENT_LIBYA_MOD');

UPDATE Civilization_JFD_CultureTypes SET
CultureType = 'CULTURE_JFD_WESTERN'
WHERE CivilizationType = 'CIVILIZATION_SPAIN';

UPDATE Civilization_JFD_CultureTypes SET
CultureType = 'CULTURE_JFD_MID_EASTERN'
WHERE CivilizationType = 'CIVILIZATION_PERSIA';

UPDATE Civilization_JFD_CultureTypes SET
CultureType = 'CULTURE_JFD_CLASSICAL'
WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';

-- for testing
/*
UPDATE Civilization_JFD_CultureTypes SET
CultureType = 'CULTURE_JFD_AMAZONIAN'
WHERE CivilizationType = 'CIVILIZATION_BRAZIL';

UPDATE Civilization_JFD_CultureTypes SET
CultureType = 'CULTURE_JFD_POLAR'
WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
*/





