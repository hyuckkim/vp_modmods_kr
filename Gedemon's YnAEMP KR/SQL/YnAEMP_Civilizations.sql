--==========================================================================================================================
-- CIV START POSITIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AdriaticStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AdriaticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AdriaticStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_GREECE',					110,	58,		null,	null),
		('CIVILIZATION_VENICE',					7,		7,		null,	null);
--------------------------------------------------------------------------------------------------------------------------		
-- Civilizations_AegeanStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AegeanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AegeanStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_BYZANTIUM',				34,		43,		24,		47),
		('CIVILIZATION_GREECE',					13,		21,		null,	null),
		('CIVILIZATION_OTTOMAN',				49,		35,		22,		47);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfricaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CARTHAGE',				26,		69,		null,	null),
		('CIVILIZATION_EGYPT',					42,		64,		null,	null),
		('CIVILIZATION_ETHIOPIA',				52,		44,		null,	null),
		('CIVILIZATION_MOROCCO',				13,		67,		null,	null),
		('CIVILIZATION_SONGHAI',				19,		53,		null,	null),
		('CIVILIZATION_ZULU',					45,		12,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfriAsiaAustStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriAsiaAustStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ARABIA',					48,		57,		null,	null),
		('CIVILIZATION_EGYPT',					41,		63,		null,	null),
		('CIVILIZATION_CHINA',					106,	77,		null,	null),
		('CIVILIZATION_GREECE',					36,		70,		null,	null),
		('CIVILIZATION_INDIA',					77,		61,		null,	null),
		('CIVILIZATION_JAPAN',					122,	77,		null,	null),
		('CIVILIZATION_OTTOMAN',				44,		73,		36,		75),
		('CIVILIZATION_PERSIA',					64,		63,		null,	null),
		('CIVILIZATION_ROME',					29,		76,		null,	null),
		('CIVILIZATION_SIAM',					93,		50,		null,	null),
		('CIVILIZATION_SONGHAI',				18,		49,		null,	null),
		('CIVILIZATION_BABYLON',				57,		65,		null,	null),
		('CIVILIZATION_SPAIN',					15,		73,		null,	null),
		('CIVILIZATION_KOREA',					114,	76,		null,	null),
		('CIVILIZATION_BYZANTIUM',				40,		74,		39,		74),
		('CIVILIZATION_CARTHAGE',				25,		69,		null,	null),
		('CIVILIZATION_ETHIOPIA',				47,		43,		null,	null),
		('CIVILIZATION_PORTUGAL',				12,		72,		null,	null),
		('CIVILIZATION_ZULU',					40,		11,		null,	null),
		('CIVILIZATION_ASSYRIA',				55,		69,		null,	null),
		('CIVILIZATION_INDONESIA',				97,		31,		null,	null),
		('CIVILIZATION_MOROCCO',				13,		65,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfriGiantStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ARABIA',					105,	108,	null,	null),
		('CIVILIZATION_EGYPT',					90,		123,	null,	null),
		('CIVILIZATION_SONGHAI',				34,		99,		null,	null),
		('CIVILIZATION_BABYLON',				117,	130,	null,	null),
		('CIVILIZATION_CARTHAGE',				61,		135,	null,	null),
		('CIVILIZATION_ETHIOPIA',				105,	85,		null,	null),
		('CIVILIZATION_ZULU',					88,		14,		null,	null),
		('CIVILIZATION_ASSYRIA',				113,	135,	null,	null),
		('CIVILIZATION_MOROCCO',				31,		128,	null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfriSouthEuroStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriSouthEuroStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ARABIA',					57,		48,		null,	null),
		('CIVILIZATION_EGYPT',					49,		57,		null,	null),
		('CIVILIZATION_GREECE',					46,		55,		null,	null),
		('CIVILIZATION_OTTOMAN',				56,		70,		47,		73),
		('CIVILIZATION_PERSIA',					70,		59,		null,	null),
		('CIVILIZATION_ROME',					35,		70,		null,	null),
		('CIVILIZATION_SONGHAI',				27,		45,		null,	null),
		('CIVILIZATION_BABYLON',				63,		58,		null,	null),
		('CIVILIZATION_SPAIN',					18,		68,		null,	null),
		('CIVILIZATION_BYZANTIUM',				51,		71,		48,		73),
		('CIVILIZATION_CARTHAGE',				33,		62,		null,	null),
		('CIVILIZATION_ETHIOPIA',				56,		37,		null,	null),
		('CIVILIZATION_PORTUGAL',				12,		66,		null,	null),
		('CIVILIZATION_ZULU',					47,		7,		null,	null),
		('CIVILIZATION_ASSYRIA',				63,		64,		null,	null),
		('CIVILIZATION_VENICE',					37,		76,		null,	null),
		('CIVILIZATION_MOROCCO',				17,		56,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AmericasStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_POLYNESIA',				8,		45,		null,	null),
		('CIVILIZATION_BRAZIL',					58,		22,		null,	null),
		('CIVILIZATION_INCA',					46,		29,		null,	null),
		('CIVILIZATION_AMERICA',				46,		54,		null,	null),
		('CIVILIZATION_SHOSHONE',				34,		59,		null,	null),
		('CIVILIZATION_IROQUOIS',				45,		60,		null,	null),
		('CIVILIZATION_MAYA',					40,		42,		null,	null),
		('CIVILIZATION_AZTEC',					35,		45,		null,	null),
		('CIVILIZATION_ENGLAND',				48,		57,		null,	null),
		('CIVILIZATION_FRANCE',					51,		61,		null,	null),
		('CIVILIZATION_NETHERLANDS',			51,		37,		null,	null),
		('CIVILIZATION_RUSSIA',					20,		66,		null,	null),
		('CIVILIZATION_SWEDEN',					46,		56,		null,	null),
		('CIVILIZATION_PORTUGAL',				59,		26,		null,	null),
		('CIVILIZATION_SPAIN',					48,		43,		null,	null),
		('CIVILIZATION_DENMARK',				50,		43,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AmericasGiantStartPosition (Americas Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_POLYNESIA',				4,		98,		null,	null),
		('CIVILIZATION_BRAZIL',					114,	40,		null,	null),
		('CIVILIZATION_INCA',					79,		58,		null,	null),
		('CIVILIZATION_AMERICA',				68,		117,	null,	null),
		('CIVILIZATION_SHOSHONE',				31,		135,	null,	null),
		('CIVILIZATION_IROQUOIS',				62,		131,	null,	null),
		('CIVILIZATION_MAYA',					57,		94,		null,	null),
		('CIVILIZATION_AZTEC',					46,		95,		null,	null),
		('CIVILIZATION_ENGLAND',				63,		125,	null,	null),
		('CIVILIZATION_FRANCE',					78,		135,	null,	null),
		('CIVILIZATION_NETHERLANDS',			92,		82,		null,	null),
		('CIVILIZATION_RUSSIA',					5,		141,	null,	null),
		('CIVILIZATION_SWEDEN',					71,		120,	null,	null),
		('CIVILIZATION_PORTUGAL',				122,	54,		null,	null),
		('CIVILIZATION_SPAIN',					73,		98,		null,	null),
		('CIVILIZATION_DENMARK',				89,		92,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_ApennineStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_ApennineStartPosition(Type, X, Y, AltX, AltY);
INSERT OR REPLACE INTO Civilizations_ApennineStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CARTHAGE',				19,		7,		null,	null),
		('CIVILIZATION_ROME',					29,		33,		null,	null),
		('CIVILIZATION_VENICE',					29,		54,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INDIA',					25,		35,		null,	null),
		('CIVILIZATION_CHINA',					67,		55,		null,	null),
		('CIVILIZATION_JAPAN',					91,		50,		null,	null),
		('CIVILIZATION_MONGOL',					53,		55,		null,	null),
		('CIVILIZATION_PERSIA',					8,		40,		null,	null),
		('CIVILIZATION_INDONESIA',				55,		0,		null,	null),
		('CIVILIZATION_KOREA',					79,		54,		null,	null),
		('CIVILIZATION_SIAM',					57,		19,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaSmallStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaSmallStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaSmallStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CHINA',					28,		40,		null,	null),
		('CIVILIZATION_KOREA',					39,		34,		null,	null),
		('CIVILIZATION_JAPAN',					46,		31,		null,	null),
		('CIVILIZATION_SIAM',					7,		8,		null,	null),
		('CIVILIZATION_MONGOL',					11,		44,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaSteppeGiantStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaSteppeGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaSteppeGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CHINA',					156,	20,		null,	null),
		('CIVILIZATION_MONGOL',					126,	42,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AtlanticGiantStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AtlanticGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AtlanticGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AMERICA',				68,		72,		null,	null),
		('CIVILIZATION_AUSTRIA',				160,	54,		null,	null),
		('CIVILIZATION_AZTEC',					38,		59,		null,	null),
		('CIVILIZATION_BRAZIL',					54,		4,		null,	null),
		('CIVILIZATION_BYZANTIUM',				171,	34,		168,	38),
		('CIVILIZATION_CARTHAGE',				146,	34,		null,	null),
		('CIVILIZATION_DENMARK',				163,	66,		null,	null),
		('CIVILIZATION_EGYPT',					164,	11,		null,	null),
		('CIVILIZATION_ENGLAND',				142,	66,	 	null,	null),
		('CIVILIZATION_FRANCE',					144,	59,		null,	null),
		('CIVILIZATION_GERMANY',				158,	58,		null,	null),
		('CIVILIZATION_GREECE',					164,	29,		null,	null),
		('CIVILIZATION_HUNS',					162,	48,		null,	null),
		('CIVILIZATION_INCA',					40,		24,		null,	null),
		('CIVILIZATION_IROQUOIS',				70,		83,		null,	null),
		('CIVILIZATION_MAYA',					44,		55,		null,	null),
		('CIVILIZATION_MOROCCO',				116,	33,		null,	null),
		('CIVILIZATION_NETHERLANDS',			149,	62,		null,	null),
		('CIVILIZATION_OTTOMAN',				171,	34,		168,	37),
		('CIVILIZATION_POLAND',					165,	55,		null,	null),
		('CIVILIZATION_POLYNESIA',				1,		92,		null,	null),
		('CIVILIZATION_PORTUGAL',				128,	49,		null,	null),
		('CIVILIZATION_ROME',					153,	43,		null,	null),
		('CIVILIZATION_SHOSHONE',				33,		90,		null,	null),
		('CIVILIZATION_SONGHAI',				127,	21,		null,	null),
		('CIVILIZATION_SPAIN',					133,	48,		null,	null),
		('CIVILIZATION_SWEDEN',					172,	71,		null,	null),
		('CIVILIZATION_VENICE',					155,	49,		null,	null);		
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AustralasiaGiantStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AustralasiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AustralasiaGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INDONESIA',				19,		77,		null,	null),
		('CIVILIZATION_SIAM',					7,		130,	null,	null);	
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AustraliaStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AustraliaStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_BritishIslesStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_BritishIslesStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_BritishIslesStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CELTS',					32,		51,		null,	null),
		('CIVILIZATION_DENMARK',				61,		46,		null,	null),
		('CIVILIZATION_ENGLAND',				44,		16,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CaribbeanStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CaribbeanStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_MAYA',					24,		30,		null,	null),
		('CIVILIZATION_AZTEC',					6,		37,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CaribbeanHugeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CaribbeanHugeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_MAYA',					4,		29,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CaucasusStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CaucasusStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CaucasusStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_OTTOMAN',				58,		31,		33,		42),
		('CIVILIZATION_BYZANTIUM',				44,		39,		32,		44),
		('CIVILIZATION_GREECE',					18,		18,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CentralAfricaLargeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CentralAfricaLargeStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CentralAsiaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CentralAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CentralAsiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_PERSIA',					27,		32,		null,	null),
		('CIVILIZATION_BABYLON',				1,		37,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EarthMk3StartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EarthMk3StartPosition(Type, X, Y, AltX, AltY);
INSERT OR REPLACE INTO Civilizations_EarthMk3StartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AMERICA',				151,	67,		null,	null),
		('CIVILIZATION_ARABIA',					40,		40,		null,	null),
		('CIVILIZATION_ASSYRIA',				42,		51,		null,	null),
		('CIVILIZATION_AUSTRIA',				23,		61,		null,	null),
		('CIVILIZATION_AZTEC',					136,	52,		null,	null),
		('CIVILIZATION_BABYLON',				44,		49,		null,	null),
		('CIVILIZATION_BRAZIL',					164,	25,		null,	null),
		('CIVILIZATION_BYZANTIUM',				32,		57,		30,		58),
		('CIVILIZATION_CARTHAGE',				19,		48,		null,	null),
		('CIVILIZATION_CELTS',					8,		74,		null,	null),
		('CIVILIZATION_CHINA',					86,		68,		null,	null),
		('CIVILIZATION_DENMARK',				22,		72,		null,	null),
		('CIVILIZATION_EGYPT',					34,		44,		null,	null),
		('CIVILIZATION_ENGLAND',				10,		67,	 	null,	null),
		('CIVILIZATION_ETHIOPIA',				37,		31,		null,	null),
		('CIVILIZATION_FRANCE',					13,		63,		null,	null),
		('CIVILIZATION_GERMANY',				23,		66,		null,	null),
		('CIVILIZATION_GREECE',					31,		52,		null,	null),
		('CIVILIZATION_HUNS',					24,		61,		null,	null),
		('CIVILIZATION_INCA',					148,	27,		null,	null),
		('CIVILIZATION_INDIA',					63,		47,		null,	null),
		('CIVILIZATION_INDONESIA',				84,		25,		null,	null),
		('CIVILIZATION_IROQUOIS',				146,	73,		null,	null),
		('CIVILIZATION_JAPAN',					99,		67,		null,	null),
		('CIVILIZATION_KOREA',					93,		68,		null,	null),
		('CIVILIZATION_MAYA',					140,	51,		null,	null),
		('CIVILIZATION_MONGOL',					65,		56,		null,	null),
		('CIVILIZATION_MOROCCO',				8,		42,		null,	null),
		('CIVILIZATION_NETHERLANDS',			15,		66,		null,	null),
		('CIVILIZATION_OTTOMAN',				32,		57,		30,		58),
		('CIVILIZATION_PERSIA',					50,		50,		null,	null),
		('CIVILIZATION_POLAND',					29,		68,		null,	null),
		('CIVILIZATION_POLYNESIA',				113,	58,		null,	null),
		('CIVILIZATION_PORTUGAL',				5,		50,		null,	null),
		('CIVILIZATION_ROME',					22,		54,		null,	null),
		('CIVILIZATION_RUSSIA',					37,		70,		null,	null),
		('CIVILIZATION_SHOSHONE',				129,	68,		null,	null),
		('CIVILIZATION_SIAM',					78,		43,		null,	null),
		('CIVILIZATION_SONGHAI',				17,		36,		null,	null),
		('CIVILIZATION_SPAIN',					8,		52,		null,	null),
		('CIVILIZATION_SWEDEN',					27,		76,		null,	null),
		('CIVILIZATION_VENICE',					22,		58,		null,	null),
		('CIVILIZATION_ZULU',					37,		15,		null,	null);		
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EastAsiaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT OR REPLACE INTO Civilizations_EastAsiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CHINA',					40,		66,		null,	null),
		('CIVILIZATION_INDIA',					12,		46,		null,	null),
		('CIVILIZATION_INDONESIA',				30,		12,		null,	null),
		('CIVILIZATION_JAPAN',					59,		61,		null,	null),
		('CIVILIZATION_KOREA',					49,		63,		null,	null),
		('CIVILIZATION_MONGOL',					31,		70,		null,	null),
		('CIVILIZATION_SIAM',					22,		40,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EuroEasternStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroEasternStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroEasternStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_SWEDEN',					16,		70,		null,	null),
		('CIVILIZATION_POLAND',					22,		35,		null,	null),
		('CIVILIZATION_AUSTRIA',				10,		20,		null,	null),
		('CIVILIZATION_RUSSIA',					79,		53,		null,	null),
		('CIVILIZATION_HUNS',					25,		19,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EuroLargeNewStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeNewStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_EGYPT',					62,		1,		null,	null),
		--('CIVILIZATION_ARABIA',				?,		?,		null,	null),
		('CIVILIZATION_ENGLAND',				24,		47,		null,	null),
		('CIVILIZATION_FRANCE',					26,		39,		null,	null),
		('CIVILIZATION_GERMANY',				39,		47,		null,	null),
		('CIVILIZATION_GREECE',					54,		14,		null,	null),
		('CIVILIZATION_OTTOMAN',				66,		22,		56,		24),
		('CIVILIZATION_ROME',					39,		23,		null,	null),
		('CIVILIZATION_RUSSIA',					70,		56,		null,	null),
		('CIVILIZATION_BABYLON',				80,		8,		null,	null),
		('CIVILIZATION_SPAIN',					17,		22,		null,	null),
		('CIVILIZATION_DENMARK',				39,		54,		null,	null),
		('CIVILIZATION_AUSTRIA',				43,		36,		null,	null),
		('CIVILIZATION_BYZANTIUM',				58,		23,		55,		24),
		('CIVILIZATION_CARTHAGE',				35,		12,		null,	null),
		('CIVILIZATION_CELTS',					21,		56,		null,	null),
		('CIVILIZATION_HUNS',					82,		43,		null,	null),
		('CIVILIZATION_NETHERLANDS',			30,		47,		null,	null),
		('CIVILIZATION_SWEDEN',					46,		65,		null,	null),
		('CIVILIZATION_PORTUGAL',				9,		19,		null,	null),
		('CIVILIZATION_VENICE',					40,		30,		null,	null),
		('CIVILIZATION_POLAND',					48,		47,		null,	null),
		('CIVILIZATION_ASSYRIA',				76,		17,		null,	null),
		('CIVILIZATION_MOROCCO',				10,		5,		null,	null),
		('CIVILIZATION_PERSIA',					84,		12,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_DenmarkStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_DenmarkStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_DenmarkStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_DENMARK',				47,		24,		null,	null);	
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_GermanyHugeStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GermanyHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GermanyHugeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AUSTRIA',				99,		4,		null,	null),
		('CIVILIZATION_CELTS',					10,		43,		null,	null),
		('CIVILIZATION_DENMARK',				73,		63,		null,	null),
		('CIVILIZATION_ENGLAND',				3,		35,	 	null,	null),
		('CIVILIZATION_FRANCE',					20,		9,		null,	null),
		('CIVILIZATION_GERMANY',				78,		37,		null,	null),
		('CIVILIZATION_NETHERLANDS',			78,		37,		null,	null),
		('CIVILIZATION_POLAND',					115,	32,		null,	null),
		('CIVILIZATION_SWEDEN',					77,		65,		null,	null);		
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IberiaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IberiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IberiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_MOROCCO',				19,		5,		null,	null),
		('CIVILIZATION_PORTUGAL',				13,		45,		null,	null),
		('CIVILIZATION_SPAIN',					31,		55,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IndiaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INDIA',					31,		48,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IndiaGiantStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndiaGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INDIA',					43,		95,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IndianOceanStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndianOceanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndianOceanStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INDONESIA',				76,		31,		null,	null),
		('CIVILIZATION_SIAM',					70,		56,		null,	null),
		('CIVILIZATION_INDIA',					48,		69,		null,	null),
		('CIVILIZATION_PERSIA',					25,		70,		null,	null),
		('CIVILIZATION_ARABIA',					12,		62,		null,	null),
		('CIVILIZATION_ETHIOPIA',				9,		47,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IndonesiaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndonesiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndonesiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INDONESIA',				35,		12,		null,	null),
		('CIVILIZATION_SIAM',					18,		69,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_JapanHugeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_JapanHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_JapanHugeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_JAPAN',					64,		34,		null,	null),
		('CIVILIZATION_KOREA',					28,		90,		null,	null);
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations_MediterraneanStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ROME',					43,		42,		null,	null),
		('CIVILIZATION_SPAIN',					10,		40,		null,	null),
		('CIVILIZATION_PORTUGAL',				1,		40,		null,	null),
		('CIVILIZATION_GREECE',					64,		30,		null,	null),
		('CIVILIZATION_CARTHAGE',				38,		26,		null,	null),
		('CIVILIZATION_AUSTRIA',				47,		58,		null,	null),
		('CIVILIZATION_VENICE',					42,		51,		null,	null),
		('CIVILIZATION_ASSYRIA',				99,		29,		null,	null),
		('CIVILIZATION_FRANCE',					29,		63,		null,	null),
		('CIVILIZATION_MOROCCO',				2,		22,		null,	null),
		('CIVILIZATION_EGYPT',					83,		7,		null,	null),
		('CIVILIZATION_BYZANTIUM',				72,		41,		68,		44),
		('CIVILIZATION_OTTOMAN',				80,		37,		69,		42);
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations_MediterraneanHugeStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanHugeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ARABIA',					106,	17,		null,	null),
		('CIVILIZATION_ASSYRIA',				92,		47,		null,	null),
		('CIVILIZATION_AUSTRIA',				39,		58,		null,	null),
		('CIVILIZATION_BABYLON',				97,		47,		null,	null),
		('CIVILIZATION_BYZANTIUM',				66,		47,		59,		45),
		('CIVILIZATION_CARTHAGE',				42,		9,		null,	null),
		('CIVILIZATION_CELTS',					5,		68,		null,	null),
		('CIVILIZATION_EGYPT',					83,		15,		null,	null),
		('CIVILIZATION_FRANCE',					19,		53,		null,	null),
		('CIVILIZATION_GERMANY',				28,		64,		null,	null),
		('CIVILIZATION_GREECE',					62,		27,		null,	null),
		('CIVILIZATION_HUNS',					46,		49,		null,	null),
		('CIVILIZATION_NETHERLANDS',			19,		65,		null,	null),
		('CIVILIZATION_OTTOMAN',				66,		47,		62,		45),
		('CIVILIZATION_PERSIA',					111,	51,		null,	null),
		('CIVILIZATION_POLAND',					37,		65,		null,	null),
		('CIVILIZATION_PORTUGAL',				5,		7,		null,	null),
		('CIVILIZATION_ROME',					38,		33,		null,	null),
		('CIVILIZATION_SPAIN',					13,		15,		null,	null),
		('CIVILIZATION_VENICE',					36,		45,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_MesopotamiaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_BYZANTIUM',				12,		39,		6,		42),
		('CIVILIZATION_GREECE',					7,		22,		null,	null),
		('CIVILIZATION_OTTOMAN',				22,		38,		7,		41),
		('CIVILIZATION_ARABIA',					45,		0,		null,	null),
		('CIVILIZATION_EGYPT',					26,		6,		null,	null),
		('CIVILIZATION_PERSIA',					79,		25,		null,	null),
		('CIVILIZATION_ASSYRIA',				45,		38,		null,	null),
		('CIVILIZATION_BABYLON',				51,		26,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_MesopotamiaGiantStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_EGYPT',					42,		34,		null,	null),
		('CIVILIZATION_BABYLON',				114,	53,		null,	null),
		('CIVILIZATION_ASSYRIA',				110,	63,		null,	null),
		('CIVILIZATION_BYZANTIUM',				19,		91,		7,		93),
		('CIVILIZATION_OTTOMAN',				45,		88,		4,		91),
		('CIVILIZATION_ARABIA',					88,		3,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NetherlandsStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NetherlandsStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NetherlandsStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_NETHERLANDS',			33,		24,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NileValleyStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NileValleyStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NileValleyStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_EGYPT',					26,		62,		null,	null),
		('CIVILIZATION_ARABIA',					78,		32,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAmericaGiantStartPosition (North America Giant)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAmericaGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_POLYNESIA',				11,		29,		null,	null),
		('CIVILIZATION_AMERICA',				95,		51,		null,	null),
		('CIVILIZATION_IROQUOIS',				95,		60,		null,	null),
		('CIVILIZATION_SHOSHONE',				51,		62,		null,	null),
		('CIVILIZATION_AZTEC',					69,		22,		null,	null),
		('CIVILIZATION_MAYA',					78,		20,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAmericaHugeStartPosition (North America Huge)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAmericaHugeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_POLYNESIA',				14,		25,		null,	null),
		('CIVILIZATION_AMERICA',				91,		39,		null,	null),
		('CIVILIZATION_IROQUOIS',				93,		47,		null,	null),
		('CIVILIZATION_SHOSHONE',				46,		44,		null,	null),
		('CIVILIZATION_AZTEC',					65,		9,		null,	null),
		('CIVILIZATION_MAYA',					74,		6,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAtlanticStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AMERICA',				11,		34,		null,	null),
		('CIVILIZATION_IROQUOIS',				13,		40,		null,	null),
		('CIVILIZATION_GERMANY',				92,		37,		null,	null),
		('CIVILIZATION_AUSTRIA',				95,		33,		null,	null),
		('CIVILIZATION_RUSSIA',					103,	46,		null,	null),
		('CIVILIZATION_POLAND',					97,		43,		null,	null),
		('CIVILIZATION_CELTS',					79,		35,		null,	null),
		('CIVILIZATION_ENGLAND',				83,		31,		null,	null),
		('CIVILIZATION_VENICE',					96,		26,		null,	null),
		('CIVILIZATION_MOROCCO',				85,		0,		null,	null),
		('CIVILIZATION_DENMARK',				89,		42,		null,	null),
		('CIVILIZATION_SWEDEN',					88,		51,		null,	null),
		('CIVILIZATION_FRANCE',					88,		26,		null,	null),
		('CIVILIZATION_CARTHAGE',				99,		11,		null,	null),
		('CIVILIZATION_ROME',					98,		21,		null,	null),
		('CIVILIZATION_NETHERLANDS',			86,		34,		null,	null),
		('CIVILIZATION_SPAIN',					85,		9,		null,	null),
		('CIVILIZATION_PORTUGAL',				80,		5,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthEastAsiaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthEastAsiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CHINA',					6,		40,		null,	null),
		('CIVILIZATION_JAPAN',					45,		27,		null,	null),
		('CIVILIZATION_KOREA',					23,		35,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthSeaEuropeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthSeaEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthSeaEuropeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_DENMARK',				87,		39,		null,	null),
		('CIVILIZATION_ENGLAND',				39,		14,		null,	null),
		('CIVILIZATION_NETHERLANDS',			58,		19,		null,	null),
		('CIVILIZATION_CELTS',					29,		42,		null,	null),
		('CIVILIZATION_GERMANY',				89,		22,		null,	null),
		('CIVILIZATION_SWEDEN',					110,	68,		null,	null),
		('CIVILIZATION_POLAND',					115,	10,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthSeaGiantStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthSeaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthSeaGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CELTS',					80,		13,		null,	null),
		('CIVILIZATION_DENMARK',				105,	11,		null,	null),
		('CIVILIZATION_ENGLAND',				83,		1,	 	null,	null),
		('CIVILIZATION_RUSSIA',					149,	9,		null,	null),
		('CIVILIZATION_SWEDEN',					116,	19,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthWestEuropeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ENGLAND',				18,		18,		null,	null),
		('CIVILIZATION_CELTS',					16,		28,		null,	null),
		('CIVILIZATION_DENMARK',				36,		29,		null,	null),
		('CIVILIZATION_SWEDEN',					43,		43,		null,	null),
		('CIVILIZATION_FRANCE',					20,		8,		null,	null),
		('CIVILIZATION_GERMANY',				41,		19,		null,	null),
		('CIVILIZATION_POLAND',					46,		21,		null,	null),
		('CIVILIZATION_RUSSIA',					56,		27,		null,	null),
		('CIVILIZATION_AUSTRIA',				45,		6,		null,	null),
		('CIVILIZATION_NETHERLANDS',			25,		18,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_OrientStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_OrientStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_OrientStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ARABIA',					47,		21,		null,	null),
		('CIVILIZATION_ASSYRIA',				59,		52,		null,	null),
		('CIVILIZATION_BABYLON',				57,		44,		null,	null),
		('CIVILIZATION_BYZANTIUM',				32,		65,		30,		68),
		('CIVILIZATION_CARTHAGE',				2,		63,		null,	null),
		('CIVILIZATION_EGYPT',					33,		40,		null,	null),
		('CIVILIZATION_GREECE',					24,		62,		null,	null),
		('CIVILIZATION_HUNS',					21,		75,		null,	null),
		('CIVILIZATION_INDIA',					107,	40,		null,	null),
		('CIVILIZATION_OTTOMAN',				32,		65,		29,		68),
		('CIVILIZATION_PERSIA',					50,		50,		null,	null),
		('CIVILIZATION_POLAND',					70,		41,		null,	null),
		('CIVILIZATION_ROME',					11,		73,		null,	null);	
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_PacificStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_PacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_PacificStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_SHOSHONE',				111,	59,		null,	null),
		('CIVILIZATION_JAPAN',					43,		56,		null,	null),
		('CIVILIZATION_CHINA',					33,		59,		null,	null),
		('CIVILIZATION_POLYNESIA',				79,		44,		null,	null),
		('CIVILIZATION_KOREA',					39,		59,		null,	null),
		('CIVILIZATION_INDIA',					7,		49,		null,	null),
		('CIVILIZATION_INDONESIA',				27,		24,		null,	null),
		('CIVILIZATION_SIAM',					23,		44,		null,	null),
		('CIVILIZATION_MONGOL',					22,		64,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_PatagoniaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_PatagoniaStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_RussiaLargeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_RussiaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_RussiaLargeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CELTS',					2,		63,		null, 	null),
		('CIVILIZATION_DENMARK',				5,		52,		null, 	null),
		('CIVILIZATION_GERMANY',				1,		50,		null, 	null),
		('CIVILIZATION_HUNS',					4,		30,		null, 	null),
		('CIVILIZATION_JAPAN',					105,	1,		null, 	null),
		('CIVILIZATION_MONGOL',					71,		3,		null, 	null),
		('CIVILIZATION_POLAND',					2,		42,		null, 	null),
		('CIVILIZATION_RUSSIA',					13,		33,		null, 	null),
		('CIVILIZATION_SWEDEN',					10,		49,		null, 	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SeaOfJapanStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SeaOfJapanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SeaOfJapanStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CHINA',					9,		42,		null,	null),
		('CIVILIZATION_JAPAN',					77,		24,		null,	null),
		('CIVILIZATION_KOREA',					45,		35,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaCentralGiantStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAmericaCentralGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_BRAZIL',					109,	60,		null,	null),
		('CIVILIZATION_INCA',					64,		78,		null,	null),
		('CIVILIZATION_MAYA',					30,		128,	null,	null),
		('CIVILIZATION_AZTEC',					21,		130,	null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaGiantStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAmericaGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INCA',					44,		91,		null,	null),
		('CIVILIZATION_BRAZIL',					98,		71,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaCentralHugeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAmericaCentralHugeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_BRAZIL',					83,		45,		null,	null),
		('CIVILIZATION_INCA',					48,		58,		null,	null),
		('CIVILIZATION_MAYA',					23,		96,		null,	null),
		('CIVILIZATION_AZTEC',					17,		99,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthernAfricaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthernAfricaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthernAfricaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_ZULU',					91,		47,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthPacificStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthPacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthPacificStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_POLYNESIA',				49,		88,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_ScotlandIrelandHugeStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_ScotlandIrelandHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_ScotlandIrelandHugeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CELTS',					80,		12,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaLargeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAmericaLargeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_BRAZIL',					68,		43,		null,	null),
		('CIVILIZATION_INCA',					34,		55,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAsiaHugeStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAsiaHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAsiaHugeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_INDIA',					32,		65,		null,	null),
		('CIVILIZATION_SIAM',					95,		49,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthPacificGiantStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthPacificGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthPacificGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_POLYNESIA',				111,	85,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_TexcocoStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_TexcocoStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_TexcocoStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AZTEC',					21,		34,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_VietnamStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_VietnamStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_WalesStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_WalesStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_WestAfricaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_WestAfricaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_WestAfricaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_CARTHAGE',				72,		77,		null,	null),
		('CIVILIZATION_SONGHAI',				55,		29,		null,	null),
		('CIVILIZATION_MOROCCO',				26,		60,		null,	null);
--==========================================================================================================================		
--==========================================================================================================================		
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Adriatic'  
FROM Civilizations_AdriaticStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Aegean'  
FROM Civilizations_AegeanStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'AfriAsiaAust'  
FROM Civilizations_AfriAsiaAustStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'AfricaLarge'  
FROM Civilizations_AfricaLargeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'AfriGiant'  
FROM Civilizations_AfriGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'AfriSouthEuro'  
FROM Civilizations_AfriSouthEuroStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'AmericasGiant'  
FROM Civilizations_AmericasGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Americas'  
FROM Civilizations_AmericasStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Apennine'  
FROM Civilizations_ApennineStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'AsiaSmall'  
FROM Civilizations_AsiaSmallStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Asia'  
FROM Civilizations_AsiaStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'AsiaSteppeGiant'  
FROM Civilizations_AsiaSteppeGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'AtlanticGiant'  
FROM Civilizations_AtlanticGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Australia'  
FROM Civilizations_AustraliaStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'AustralasiaGiant'  
FROM Civilizations_AustralasiaGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'BritishIsles'  
FROM Civilizations_BritishIslesStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'CaribbeanHuge'  
FROM Civilizations_CaribbeanHugeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Caribbean'  
FROM Civilizations_CaribbeanStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Caucasus'  
FROM Civilizations_CaucasusStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'CentralAfricaLarge'  
FROM Civilizations_CentralAfricaLargeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'CentralAsia'  
FROM Civilizations_CentralAsiaStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Cordiform'  
FROM Civilizations_CordiformStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Denmark'  
FROM Civilizations_DenmarkStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'EarthMk3'  
FROM Civilizations_EarthMk3StartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'EastAsia'  
FROM Civilizations_EastAsiaStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'EuroEastern'  
FROM Civilizations_EuroEasternStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'EuroGiant'  
FROM Civilizations_EuroGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'EuroLargeNew'  
FROM Civilizations_EuroLargeNewStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'EuroLarge'  
FROM Civilizations_EuroLargeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'GermanyHuge'  
FROM Civilizations_GermanyHugeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'GreatestEarth'  
FROM Civilizations_GreatestEarthStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Iberia'  
FROM Civilizations_IberiaStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'IndiaGiant'  
FROM Civilizations_IndiaGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'India'  
FROM Civilizations_IndiaStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'IndianOcean'  
FROM Civilizations_IndianOceanStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Indonesia'  
FROM Civilizations_IndonesiaStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'JapanHuge'  
FROM Civilizations_JapanHugeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'MediterraneanHuge'  
FROM Civilizations_MediterraneanHugeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Mediterranean'  
FROM Civilizations_MediterraneanStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'MesopotamiaGiant'  
FROM Civilizations_MesopotamiaGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Mesopotamia'  
FROM Civilizations_MesopotamiaStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Netherlands'  
FROM Civilizations_NetherlandsStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'NileValley'  
FROM Civilizations_NileValleyStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'NorthAmericaGiant'  
FROM Civilizations_NorthAmericaGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'NorthAmericaHuge'  
FROM Civilizations_NorthAmericaHugeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'NorthAtlantic'  
FROM Civilizations_NorthAtlanticStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'NorthEastAsia'  
FROM Civilizations_NorthEastAsiaStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'NorthSeaEurope'  
FROM Civilizations_NorthSeaEuropeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'NorthSeaGiant'  
FROM Civilizations_NorthSeaGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'NorthWestEurope'  
FROM Civilizations_NorthWestEuropeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Orient'  
FROM Civilizations_OrientStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Pacific'  
FROM Civilizations_PacificStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Patagonia'  
FROM Civilizations_PatagoniaStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'RussiaLarge'  
FROM Civilizations_RussiaLargeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'SeaOfJapan'  
FROM Civilizations_SeaOfJapanStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'ScotlandIrelandHuge'  
FROM Civilizations_ScotlandIrelandHugeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'SouthAmericaCentralGiant'  
FROM Civilizations_SouthAmericaCentralGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'SouthAmericaCentralHuge'  
FROM Civilizations_SouthAmericaCentralHugeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'SouthAmericaGiant'  
FROM Civilizations_SouthAmericaGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'SouthAmericaLarge'  
FROM Civilizations_SouthAmericaLargeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'SouthAsiaHuge'  
FROM Civilizations_SouthAsiaHugeStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'SouthernAfrica'  
FROM Civilizations_SouthernAfricaStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'SouthPacificGiant'  
FROM Civilizations_SouthPacificGiantStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'SouthPacific'  
FROM Civilizations_SouthPacificStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Texcoco'  
FROM Civilizations_TexcocoStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Vietnam'  
FROM Civilizations_VietnamStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Wales'  
FROM Civilizations_WalesStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'WestAfrica'  
FROM Civilizations_WestAfricaStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Yagem'  
FROM Civilizations_YagemStartPosition;

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 				X, Y, AltX, AltY, 'Yahem'  
FROM Civilizations_YahemStartPosition;
--------------------------------------------------------------------------------------------------------------------------
UPDATE Civilizations_YnAEMP
SET AltCapitalName = 'TXT_KEY_CITY_NAME_ADRIANOPLE'
WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM' AND AltX IS NOT NULL AND AltY IS NOT NULL;

UPDATE Civilizations_YnAEMP
SET AltCapitalName = 'TXT_KEY_CITY_NAME_EDIRNE'
WHERE CivilizationType = 'CIVILIZATION_OTTOMAN' AND AltX IS NOT NULL AND AltY IS NOT NULL AND MapPrefix NOT IN ('Cordiform', 'GreatestEarth', 'EuroLarge', 'Yagem', 'Yahem');

UPDATE Civilizations_YnAEMP
SET AltCapitalName = 'TXT_KEY_CITY_NAME_ANKARA'
WHERE CivilizationType = 'CIVILIZATION_OTTOMAN' AND AltX IS NOT NULL AND AltY IS NOT NULL AND MapPrefix IN ('Cordiform', 'GreatestEarth', 'EuroLarge', 'Yagem', 'Yahem');
--==========================================================================================================================
--==========================================================================================================================