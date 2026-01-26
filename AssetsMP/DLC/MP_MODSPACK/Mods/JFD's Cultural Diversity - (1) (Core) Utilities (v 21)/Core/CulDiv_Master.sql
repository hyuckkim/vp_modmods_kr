--==========================================================================================================================
-- COMMUNITY BALANCE PATCH
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--==========================================================================================================================
-- CULTURE BRANCHES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureBranches
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_CultureBranches(
	ID  									integer 							   primary key autoincrement,
	Type 									text												default null,
	ShortDescription						text												default null);
--==========================================================================================================================
-- CULTURES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_CultureTypes(
	ID  									integer 							   primary key autoincrement,
	Type 									text												default null,
	BranchType 								text												default null,
	LowerTag								text												default null,	
	ShortDescription						text												default null,
	StartDistance							integer												default	0,
	StartingEraTag							text												default null,
	FontIcon								text												default	null,
	IconAtlas								text		REFERENCES IconTextureAtlases(Atlas)	default	null,
	IconAlphaAtlas							text		REFERENCES IconTextureAtlases(Atlas)	default	null,
	PortraitIndex							integer												default	0,
	AlphaIndex								integer												default	0);

ALTER TABLE JFD_CultureTypes ADD DefeatScreenTag  text	default null;
ALTER TABLE JFD_CultureTypes ADD SplashScreenTag  text	default null;
ALTER TABLE JFD_CultureTypes ADD SoundtrackTag    text	default null;
ALTER TABLE JFD_CultureTypes ADD UnitDialogueTag  text	default null;
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureType_OldTags
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_CultureType_OldTags(
	CultureType 							text												default null,
	OldTag									text												default null);
--==========================================================================================================================
-- SUBCULTURES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SubCultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_CultureSubTypes(
	ID  									integer 							   primary key autoincrement,
	Type 									text												default null,
	CultureType								text												default null,	
	LowerTag								text												default null,	
	ShortDescription						text												default null);
	
ALTER TABLE JFD_CultureSubTypes ADD DefeatScreenEarlyTag	text default null;
ALTER TABLE JFD_CultureSubTypes ADD DefeatScreenMidTag		text default null;
ALTER TABLE JFD_CultureSubTypes ADD DefeatScreenLateTag		text default null;
ALTER TABLE JFD_CultureSubTypes ADD SplashScreenTag			text default null;
ALTER TABLE JFD_CultureSubTypes ADD SoundtrackTag			text default null;
ALTER TABLE JFD_CultureSubTypes ADD UnitDialogueTag			text default null;
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureSubType_OldTags
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_CultureSubType_OldTags(
	CultureSubType 							text												default null,
	OldTag									text												default null);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE Civilizations ADD CultureType			text	default null;
ALTER TABLE Civilizations ADD CultureSubType		text	default null;
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 											default null,
	CultureType 								text											default null,
	SubCultureType 								text											default null,
	ArtDefineTag								text											default	null,
	DecisionsTag								text											default null,
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

CREATE TABLE Civilization_JFD_CultureTypes_Temp AS SELECT * FROM (SELECT * FROM Civilization_JFD_CultureTypes ORDER BY rowid DESC) GROUP BY CivilizationType;
INSERT INTO Civilization_JFD_CultureTypes_Temp SELECT DISTINCT * FROM Civilization_JFD_CultureTypes 
WHERE NOT EXISTS (SELECT * FROM Civilization_JFD_CultureTypes_Temp WHERE CultureType = Civilization_JFD_CultureTypes.CultureType);
DELETE FROM Civilization_JFD_CultureTypes;
INSERT INTO Civilization_JFD_CultureTypes SELECT * FROM Civilization_JFD_CultureTypes_Temp ORDER BY rowid ASC;
DROP TABLE Civilization_JFD_CultureTypes_Temp;
--==========================================================================================================================
-- ERAS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Era_SplashScreenTag
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Era_SplashScreenTag (
	EraType										text 											default null,
	SplashTag	 								text											default null);
--==========================================================================================================================
-- MINOR CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilizations
--------------------------------------------------------------------------------------------------------------------------	
ALTER TABLE MinorCivilizations ADD CultureType	text	default null;
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
MinorCivilization_JFD_CultureTypes(
	MinorCivilizationType 						text 										 	default null,
	CultureType 								text											default null);
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_JFD_UnitDialogues
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
UnitPromotions_JFD_UnitDialogues(
	PromotionType 								text 	REFERENCES UnitPromotions(Type) 		default null,
	UnitDialogue 								text											default null);
--==========================================================================================================================
--==========================================================================================================================