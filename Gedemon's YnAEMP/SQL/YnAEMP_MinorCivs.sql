--==========================================================================================================================
-- MINOR CIV START POSITIONS
--==========================================================================================================================
-- MinorCiv_AdriaticStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AdriaticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AdriaticStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_RAGUSA',			51,		39,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AegeanStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AegeanStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AfriAsiaAustStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AfriAsiaAustStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ALMATY',            78,     73,     null,   null),
		('MINOR_CIV_ANTANANARIVO',      18,     19,     null,   null),
		('MINOR_CIV_BELGRADE',          34,     79,     null,   null),
		('MINOR_CIV_BUCHAREST',         37,     79,     null,   null),
		('MINOR_CIV_BYBLOS',            45,     66,     null,   null),
		('MINOR_CIV_CAPE_TOWN',         32,     6,      null,   null),
		('MINOR_CIV_COLOMBO',           77,     39,     null,   null),
		('MINOR_CIV_FLORENCE',          28,     78,     null,   null),
		('MINOR_CIV_HANOI',             97,     52,     null,   null),
		('MINOR_CIV_HONG_KONG',         106,    57,     null,   null),
		('MINOR_CIV_IFE',               22,     43,     null,   null),
		('MINOR_CIV_JERUSALEM',         46,     66,     null,   null),
		('MINOR_CIV_KABUL',             72,     67,     null,   null),
		('MINOR_CIV_KATHMANDU',         85,     62,     null,   null),
		('MINOR_CIV_KUALA_LUMPUR',      93,     39,     null,   null),
		('MINOR_CIV_KYZYL',             91,     74,     null,   null),
		('MINOR_CIV_LHASA',             87,     58,     null,   null),
		('MINOR_CIV_MALACCA',           94,     37,     null,   null),
		('MINOR_CIV_MANILA',            108,    47,     null,   null),
		('MINOR_CIV_MBANZA_KONGO',      29,     32,     null,   null),
		('MINOR_CIV_MELBOURNE',         124,    4,      null,   null),
		('MINOR_CIV_MOGADISHU',         52,     39,     null,   null),
		('MINOR_CIV_MOMBASA',           37,     42,     null,   null),
		('MINOR_CIV_ORMUS',             64,     61,     null,   null),
		('MINOR_CIV_RAGUSA',            33,     78,     null,   null),
		('MINOR_CIV_SAMARKAND',         75,     69,     null,   null),
		('MINOR_CIV_SIDON',             45,     65,     null,   null),
		('MINOR_CIV_SINGAPORE',         95,     36,     null,   null),
		('MINOR_CIV_TYRE',              45,     67,     null,   null),
		('MINOR_CIV_UR',                56,     63,     null,   null),
		('MINOR_CIV_YEREVAN',           55,     75,     null,   null),
		('MINOR_CIV_ZANZIBAR',          51,     27,     null,   null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AfricaLargeStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AfricaLargeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_IFE',				22,		46,		null,	null),
		('MINOR_CIV_MBANZA_KONGO',		30,		28,		null,	null),
		('MINOR_CIV_ZANZIBAR',			53,		30,		null,	null),
		('MINOR_CIV_MARRAKECH',			13,		67,		null,	null),
		('MINOR_CIV_ANTANANARIVO',		56,		17,		null,	null),
		('MINOR_CIV_MOMBASA',			52,		33,		null,	null),
		('MINOR_CIV_MOGADISHU',			57,		40,		null,	null),
		('MINOR_CIV_CAPE_TOWN',			32,		3,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AfriGiantStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AfriGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AfriGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BYBLOS',			98,		131,	null,	null),
		('MINOR_CIV_CAPE_TOWN',			70,		6,		null,	null),
		('MINOR_CIV_MOGADISHU',			119,	74,		null,	null),
		('MINOR_CIV_MOMBASA',			107,	59,		null,	null),
		('MINOR_CIV_ORMUS',				132,	120,	null,	null),
		('MINOR_CIV_UR',				116,	130,	null,	null),
		('MINOR_CIV_MARRAKECH',			31,		128,	null,	null),
		('MINOR_TYRE',					96,		128,	null,	null),
		('MINOR_CIV_ZANZIBAR',			107,	54,		null,	null),
		('MINOR_CIV_MBANZA_KONGO',		65,		56,		null,	null),
		('MINOR_SIDON',					96,		129,	null,	null),
		('MINOR_CIV_VALLETTA',			68,		135,	null,	null),
		('MINOR_CIV_IFE',				46,		83,		null,	null),
		('MINOR_CIV_JERUSALEM',			96,		125,	null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AfriSouthEuroStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AfriSouthEuroStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AfriSouthEuroStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BUCHAREST',			49,		77,		null,	null),
		('MINOR_CIV_FLORENCE',			34,		73,		null,	null),
		('MINOR_CIV_MILAN',				33,		76,		null,	null),
		('MINOR_CIV_MONACO',			30,		74,		null,	null),
		('MINOR_CIV_BYBLOS',			57,		62,		null,	null),
		('MINOR_CIV_CAPE_TOWN',			39,		1,		null,	null),
		('MINOR_CIV_LISBON',			12,		66,		null,	null),
		('MINOR_CIV_MOGADISHU',			59,		33,		null,	null),
		('MINOR_CIV_MOMBASA',			54,		29,		null,	null),
		('MINOR_CIV_ORMUS',				70,		54,		null,	null),
		('MINOR_CIV_RAGUSA',			41,		72,		null,	null),
		('MINOR_CIV_UR',				64,		56,		null,	null),
		('MINOR_CIV_VENICE',			37,		76,		null,	null),
		('MINOR_CIV_GENOA',				32,		74,		null,	null),
		('MINOR_CIV_MARRAKECH',			17,		56,		null,	null),
		('MINOR_TYRE',					57,		60,		null,	null),
		('MINOR_CIV_ZANZIBAR',			55,		25,		null,	null),
		('MINOR_CIV_BELGRADE',			44,		75,		null,	null),
		('MINOR_CIV_MBANZA_KONGO',		37,		24,		null,	null),
		('MINOR_SIDON',					57,		61,		null,	null),
		('MINOR_CIV_SOFIA',				46,		73,		null,	null),
		('MINOR_CIV_VALLETTA',			36,		60,		null,	null),
		('MINOR_CIV_GENEVA',			29,		77,		null,	null),
		('MINOR_CIV_IFE',				31,		39,		null,	null),
		('MINOR_CIV_JERUSALEM',			57,		59,		null,	null),
		('MINOR_CIV_VATICAN_CITY',		57,		59,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AmericasStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AmericasStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BUENOS_AIRES',		53,		15,		null,	null),
		('MINOR_CIV_QUEBEC',			50,		60,		null,	null),
		('MINOR_CIV_VANCOUVER',			29,		61,		null,	null),
		('MINOR_CIV_CAHOKIA',			40,		54,		null,	null),
		('MINOR_CIV_LA_VENTA',			41,		41,		null,	null),
		('MINOR_CIV_PANAMA_CITY',		42,		39,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AmericasGiantStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AmericasGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AmericasGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BUENOS_AIRES',		97,		24,		null,	null),
		('MINOR_CIV_QUEBEC',			69,		126,	null,	null),
		('MINOR_CIV_VANCOUVER',			25,		131,	null,	null),
		('MINOR_CIV_CAHOKIA',			55,		118,	null,	null),
		('MINOR_CIV_LA_VENTA',			51,		92,		null,	null),
		('MINOR_CIV_PANAMA_CITY',		70,		80,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_ApennineStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_ApennineStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_ApennineStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_FLORENCE',			25,		45,		null,	null),
		('MINOR_CIV_GENOA',				17,		50,		null,	null),
		('MINOR_CIV_MILAN',				16,		63,		null,	null),
		('MINOR_CIV_RAGUSA',			16,		63,		null,	null),
		('MINOR_CIV_VALETTA',			35,		2,		null,	null),
		('MINOR_CIV_VATICAN_CITY',		29,		33,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AsiaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AsiaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_HONG_KONG',			68,		31,		null,	null),
		('MINOR_CIV_HANOI',				59,		30,		null,	null),
		('MINOR_CIV_MANILA',			79,		20,		null,	null),
		('MINOR_CIV_KABUL',				20,		43,		null,	null),
		('MINOR_CIV_SAMARKAND',			17,		49,		null,	null),
		('MINOR_CIV_ALMATY',			24,		43,		null,	null),
		('MINOR_CIV_LHASA',				38,		42,		null,	null),
		('MINOR_CIV_KATHMANDU',			34,		38,		null,	null),
		('MINOR_CIV_SINGAPORE',			58,		1,		null,	null),
		('MINOR_CIV_MALACCA',			56,		3,		null,	null),
		('MINOR_CIV_KUALA_LUMPUR',		55,		5,		null,	null),
		('MINOR_CIV_KYZYL',				33,		60,		null,	null),
		('MINOR_CIV_ORMUS',				3,		33,		null,	null),
		('MINOR_CIV_COLOMBO',			31,		10,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AsiaSmallStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AsiaSmallStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AsiaSmallStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_MANILA',			32,		9,		null,	null),
		('MINOR_CIV_HONG_KONG',			20,		15,		null,	null),
		('MINOR_CIV_KUALA_LUMPUR',		5,		1,		null,	null),
		('MINOR_CIV_HANOI',				11,		13,		null,	null),
		('MINOR_CIV_KATHMANDU',			1,		21,		null,	null),
		('MINOR_CIV_LHASA',				2,		26,		null,	null),
		('MINOR_CIV_ALMATY',			1,		43,		null,	null),
		('MINOR_CIV_KYZYL',				22,		46,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AsiaSteppeGiantStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AsiaSteppeGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AsiaSteppeGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ALMATY',			70,		29,		null,	null),
		('MINOR_CIV_SAMARKAND',			54,		18,		null,	null),
		('MINOR_CIV_YEREVAN',			5,		19,		null,	null),
		('MINOR_CIV_KYZYL',				110,	58,		null,	null),
		('MINOR_CIV_KABUL',				58,		2,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AtlanticGiantStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AtlanticGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AtlanticGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			148,	61,		null,	null),
		('MINOR_CIV_BELGRADE',			162,	47,		null,	null),
		('MINOR_CIV_BOGOTA',			45,		37,		null,	null),
		('MINOR_CIV_BRATISLAVA',		161,	52,		null,	null),
		('MINOR_CIV_BRUSSELS',			147,	60,		null,	null),
		('MINOR_CIV_BUCHAREST',			169,	38,		null,	null),
		('MINOR_CIV_BUDAPEST',			164,	50,		null,	null),
		('MINOR_CIV_BYBLOS',			175,	14,		null,	null),
		('MINOR_CIV_CAHOKIA',			56,		80,		null,	null),
		('MINOR_CIV_FLORENCE',			153,	48,		null,	null),
		('MINOR_CIV_GENEVA',			148,	53,		null,	null),
		('MINOR_CIV_GENOA',				151,	49,		null,	null),
		('MINOR_CIV_IFE',				135,	12,		null,	null),
		('MINOR_CIV_JERUSALEM',			174,	12,		null,	null),
		('MINOR_CIV_KIEV',				177,	45,		null,	null),
		('MINOR_CIV_LA_VENTA',			43,		56,		null,	null),
		('MINOR_CIV_MILAN',				152,	51,		null,	null),
		('MINOR_CIV_MONACO',			149,	50,		null,	null),
		('MINOR_CIV_PANAMA_CITY',		46,		46,		null,	null),
		('MINOR_CIV_PRAGUE',			158,	56,		null,	null),
		('MINOR_CIV_QUEBEC_CITY',		70,		81,		null,	null),
		('MINOR_CIV_RAGUSA',			159,	53,		null,	null),
		('MINOR_CIV_RIGA',				175,	59,		null,	null),
		('MINOR_CIV_SIDON',				175,	14,		null,	null),
		('MINOR_CIV_SOFIA',				165,	40,		null,	null),
		('MINOR_CIV_TYRE',				173,	13,		null,	null),
		('MINOR_CIV_VALLETTA',			148,	31,		null,	null),
		('MINOR_CIV_VATICAN_CITY',		153,	45,		null,	null),
		('MINOR_CIV_VILNIUS',			176,	55,		null,	null),
		('MINOR_CIV_WITTENBERG',		158,	57,		null,	null),
		('MINOR_CIV_ZURICH',			151,	54,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AustraliaStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AustraliaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AustraliaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_MELBOURNE',			53,		15,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_AustralasiaGiantStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AustralasiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_AustralasiaGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_SINGAPORE',			13,		97,		null,	null),
		('MINOR_CIV_MELBOURNE',			80,		18,		null,	null),
		('MINOR_CIV_MALACCA',			10,		100,	null,	null),
		('MINOR_CIV_WELLINGTON',		133,	19,		null,	null),
		('MINOR_CIV_SYDNEY',			89,		26,		null,	null),
		('MINOR_CIV_MANILA',			43,		124,	null,	null),
		('MINOR_CIV_JAKARTA',			19,		77,		null,	null),
		('MINOR_CIV_KUALA_LUMPUR',		10,		103,	null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_BritishIslesStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_BritishIslesStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_CaribbeanStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_CaribbeanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_CaribbeanStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_LA_VENTA',			32,		23,		null,	null),
		('MINOR_CIV_PANAMA_CITY',		48,		5,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_CaribbeanHugeStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_CaribbeanHugeStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_CaucasusStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_CaucasusStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_CaucasusStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_SOFIA',				19,		49,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_CentralAfricaLargeStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_CentralAfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_CentralAfricaLargeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_IFE',				21,		52,		null,	null),
		('MINOR_CIV_MBANZA_KONGO',		50,		15,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_CentralAsiaStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_CentralAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_CentralAsiaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_SAMARKAND',			77,		64,		null,	null),
		('MINOR_CIV_KABUL',				81,		43,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_DenmarkStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_DenmarkStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_EastAsiaStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_EastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_EastAsiaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_COLOMBO',			3,		26,		null,	null),
		('MINOR_CIV_KUALA_LUMPUR',		24,		24,		null,	null),
		('MINOR_CIV_HANOI',				28,		42,		null,	null),
		('MINOR_CIV_HONG_KONG',			36,		43,		null,	null),
		('MINOR_CIV_KATHMANDU',			9,		53,		null,	null),
		('MINOR_CIV_LHASA',				15,		50,		null,	null),
		('MINOR_CIV_MALACCA',			25,		22,		null,	null),
		('MINOR_CIV_MANILA',			44,		36,		null,	null),
		('MINOR_CIV_SINGAPORE',			26,		20,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_EarthMk3StartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_EarthMk3StartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_EarthMk3StartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ALMATY',			69,		60,		null,	null),
		('MINOR_CIV_ANTANANARIVO',		46,		14,		null,	null),
		('MINOR_CIV_ANTWERP',			16,		66,		null,	null),
		('MINOR_CIV_BELGRADE',			28,		58,		null,	null),
		('MINOR_CIV_BOGOTA',			150,	39,		null,	null),
		('MINOR_CIV_BRATISLAVA',		22,		63,		null,	null),
		('MINOR_CIV_BRUSSELS',			16,		64,		null,	null),
		('MINOR_CIV_BUCHAREST',			30,		59,		null,	null),
		('MINOR_CIV_BUDAPEST',			28,		60,		null,	null),
		('MINOR_CIV_BUENOS_AIRES',		158,	19,		null,	null),
		('MINOR_CIV_BYBLOS',			37,		49,		null,	null),
		('MINOR_CIV_CAHOKIA',			140,	70,		null,	null),
		('MINOR_CIV_CAPE_TOWN',			28,		6,		null,	null),
		('MINOR_CIV_COLOMBO',			67,		30,		null,	null),
		('MINOR_CIV_FLORENCE',			20,		56,		null,	null),
		('MINOR_CIV_GENEVA',			15,		59,		null,	null),
		('MINOR_CIV_GENOA',				18,		56,		null,	null),
		('MINOR_CIV_HANOI',				81,		49,		null,	null),
		('MINOR_CIV_HONG_KONG',			88,		51,		null,	null),
		('MINOR_CIV_IFE',				22,		30,		null,	null),
		('MINOR_CIV_JERUSALEM',			40,		48,		null,	null),
		('MINOR_CIV_KABUL',				60,		50,		null,	null),
		('MINOR_CIV_KATHMANDU',			69,		51,		null,	null),
		('MINOR_CIV_KIEV',				36,		65,		null,	null),
		('MINOR_CIV_KUALA_LUMPUR',		80,		35,		null,	null),
		('MINOR_CIV_KYZYL',				66,		64,		null,	null),
		('MINOR_CIV_LA_VENTA',			138,	51,		null,	null),
		('MINOR_CIV_LHASA',				74,		59,		null,	null),
		('MINOR_CIV_MALACCA',			81,		33,		null,	null),
		('MINOR_CIV_MANILA',			92,		45,		null,	null),
		('MINOR_CIV_MBANZA_KONGO',		28,		24,		null,	null),
		('MINOR_CIV_MELBOURNE',			105,	8,		null,	null),
		('MINOR_CIV_MILAN',				18,		58,		null,	null),
		('MINOR_CIV_MOGADISHU',			41,		25,		null,	null),
		('MINOR_CIV_MOMBASA',			40,		22,		null,	null),
		('MINOR_CIV_MONACO',			16,		55,		null,	null),
		('MINOR_CIV_ORMUS',				50,		42,		null,	null),
		('MINOR_CIV_PANAMA_CITY',		145,	55,		null,	null),
		('MINOR_CIV_PRAGUE',			25,		64,		null,	null),
		('MINOR_CIV_QUEBEC_CITY',		149,	73,		null,	null),
		('MINOR_CIV_RAGUSA',			27,		56,		null,	null),
		('MINOR_CIV_RIGA',				29,		71,		null,	null),
		('MINOR_CIV_SAMARKAND',			65,		59,		null,	null),
		('MINOR_CIV_SIDON',				38,		50,		null,	null),
		('MINOR_CIV_SINGAPORE',			83,		32,		null,	null),
		('MINOR_CIV_SOFIA',				28,		57,		null,	null),
		('MINOR_CIV_SYDNEY',			108,	11,		null,	null),
		('MINOR_CIV_TYRE',				36,		47,		null,	null),
		('MINOR_CIV_UR',				46,		47,		null,	null),
		('MINOR_CIV_VALLETTA',			24,		47,		null,	null),
		('MINOR_CIV_VANCOUVER',			125,	77,		null,	null),
		('MINOR_CIV_VATICAN_CITY',		21,		54,		null,	null),
		('MINOR_CIV_VILNIUS',			31,		68,		null,	null),
		('MINOR_CIV_WELLINGTON',		118,	9,		null,	null),
		('MINOR_CIV_WITTENBERG',		23,		65,		null,	null),
		('MINOR_CIV_YEREVAN',			44,		58,		null,	null),
		('MINOR_CIV_ZANZIBAR',			41,		21,		null,	null),
		('MINOR_CIV_ZURICH',			17,		60,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_EuroEasternStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_EuroEasternStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_EuroEasternStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BUDAPEST',			18,		18,		null,	null),
		('MINOR_CIV_BUCHAREST',			45,		6,		null,	null),
		('MINOR_CIV_BELGRADE',			26,		8,		null,	null),
		('MINOR_CIV_KIEV',				56,		29,		null,	null),
		('MINOR_CIV_RIGA',				37,		55,		null,	null),
		('MINOR_CIV_PRAGUE',			5,		26,		null,	null),
		('MINOR_CIV_BRATISLAVA',		12,		19,		null,	null),
		('MINOR_CIV_VILNIUS',			38,		45,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_EuroLargeNewStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeNewStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_EuroLargeNewStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_RAGUSA',			47,		23,		null,	null),
		('MINOR_CIV_BUDAPEST',			47,		65,		null,	null),
		('MINOR_TYRE',					69,		9,		null,	null),
		('MINOR_CIV_GENEVA',			31,		32,		null,	null),
		('MINOR_CIV_GENOA',				34,		29,		null,	null),
		('MINOR_CIV_FLORENCE',			37,		27,		null,	null),
		('MINOR_CIV_BUCHAREST',			54,		29,		null,	null),
		('MINOR_CIV_BELGRADE',			49,		28,		null,	null),
		('MINOR_CIV_VIENNA',			43,		36,		null,	null),
		('MINOR_CIV_BRUSSELS',			28,		43,		null,	null),
		('MINOR_CIV_MONACO',			31,		27,		null,	null),
		('MINOR_SIDON',					70,		11,		null,	null),
		('MINOR_CIV_VALLETTA',			39,		10,		null,	null),
		('MINOR_CIV_YEREVAN',			76,		24,		null,	null),
		('MINOR_CIV_JERUSALEM',			69,		6,		null,	null),
		('MINOR_CIV_KIEV',				58,		43,		null,	null),
		('MINOR_CIV_RIGA',				52,		57,		null,	null),
		('MINOR_CIV_ANTWERP',			27,		45,		null,	null),
		('MINOR_CIV_MARRAKECH',			10,		5,		null,	null),
		('MINOR_CIV_MILAN',				37,		32,		null,	null),
		('MINOR_CIV_PRAGUE',			42,		40,		null,	null),
		('MINOR_CIV_VATICAN_CITY',		39,		23,		null,	null),
		('MINOR_CIV_WITTENBERG',		38,		45,		null,	null),
		('MINOR_CIV_ZURICH',			33,		35,		null,	null),
		('MINOR_CIV_UR',				81,		5,		null,	null),
		('MINOR_CIV_SOFIA',				53,		24,		null,	null),
		('MINOR_CIV_BYBLOS',			71,		12,		null,	null),
		('MINOR_CIV_BRATISLAVA',		46,		37,		null,	null),
		('MINOR_CIV_VILNIUS',			52,		52,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_GermanyHugeStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_GermanyHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_GermanyHugeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ATNWERP',			35,		27,		null,	null),
		('MINOR_CIV_BRUSSELS',			32,		23,		null,	null),
		('MINOR_CIV_PRAGUE',			72,		6,		null,	null),
		('MINOR_CIV_RIGA',				126,	67,		null,	null),
		('MINOR_CIV_VILNIUS',			124,	52,		null,	null),
		('MINOR_CIV_WITTENBERG',		73,		35,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_IberiaStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_IberiaStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_IndiaStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_IndiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_IndiaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_COLOMBO',			58,		5,		null,	null),
		('MINOR_CIV_KABUL',				22,		60,		null,	null),
		('MINOR_CIV_KATHMANDU',			45,		66,		null,	null),
		('MINOR_CIV_LHASA',				58,		71,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_IndiaGiantStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_IndiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_IndiaGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_KABUL',				15,		124,	null,	null),
		('MINOR_CIV_COLOMBO',			51,		7,		null,	null),
		('MINOR_CIV_KATHMANDU',			70,		94,		null,	null),
		('MINOR_CIV_LHASA',				94,		112,	null,	null);
--------------------------------------------------------------------------------------------------------------------------          
-- MinorCiv_IndianOceanStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_IndianOceanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_IndianOceanStartPosition
        (Type,                        		X,      Y,      AltX,   AltY)
VALUES  ('MINOR_CIV_ANTANANARIVO',      	53,     20,     null,   null),
        ('MINOR_CIV_COLOMBO',           	52,     46,     null,   null),
        ('MINOR_CIV_HANOI',             	73,     61,     null,   null),
        ('MINOR_CIV_HONG_KONG',         	82,     63,     null,   null),
        ('MINOR_CIV_KABUL',             	38,     71,     null,   null),
        ('MINOR_CIV_KATHMANDU',         	60,     70,     null,   null),
        ('MINOR_CIV_KUALA_LUMPUR',      	71,     42,     null,   null),
        ('MINOR_CIV_LHASA',            	 	59,     66,     null,   null),
        ('MINOR_CIV_MALACCA',           	71,     41,     null,   null),
        ('MINOR_CIV_MANILA',            	89,     54,     null,   null),
        ('MINOR_CIV_MOGADISHU',         	17,     40,     null,   null),
        ('MINOR_CIV_MOMBASA',           	13,     36,     null,   null),
        ('MINOR_CIV_ORMUS',             	28,     68,     null,   null),
        ('MINOR_CIV_SINGAPORE',         	73,     40,     null,   null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_IndonesiaStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_IndonesiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_IndonesiaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_KUALA_LUMPUR',		22,		36,		null,	null),
		('MINOR_CIV_MALACCA',			25,		34,		null,	null),
		('MINOR_CIV_MANILA',			58,		70,		null,	null),
		('MINOR_CIV_SINGAPORE',			27,		33,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_JapanHugeStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_JapanHugeStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_MediterraneanStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_MediterraneanStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_VATICAN_CITY',		43,		42,		null,	null),
		('MINOR_CIV_ZURICH',			36,		56,		null,	null),
		('MINOR_CIV_GENEVA',			32,		52,		null,	null),
		('MINOR_CIV_FLORENCE',			40,		51,		null,	null),
		('MINOR_CIV_GENOA',				36,		50,		null,	null),
		('MINOR_CIV_MONACO',			31,		47,		null,	null),
		('MINOR_CIV_RAGUSA',			47,		49,		null,	null),
		('MINOR_CIV_VALETTA',			49,		24,		null,	null),
		('MINOR_CIV_BUCHAREST',			72,		52,		null,	null),
		('MINOR_CIV_BELGRADE',			61,		46,		null,	null),
		('MINOR_CIV_MILAN',				35,		52,		null,	null),
		('MINOR_CIV_BUDAPEST',			54,		56,		null,	null),
		('MINOR_CIV_BRATISLAVA',		55,		60,		null,	null),
		('MINOR_CIV_PRAGUE',			47,		62,		null,	null),
		('MINOR_CIV_SOFIA',				66,		44,		null,	null),
		('MINOR_CIV_BYBLOS',			91,		28,		null,	null),
		('MINOR_CIV_SIDON',				90,		25,		null,	null),
		('MINOR_CIV_JERUSALEM',			91,		17,		null,	null),
		('MINOR_CIV_TYRE',				90,		19,		null,	null),
		('MINOR_CIV_YEREVAN',			100,	44,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_MediterraneanHugeStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_MediterraneanHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_MediterraneanHugeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			20,		63,		null,	null),
		('MINOR_CIV_BELGRADE',			51,		48,		null,	null),
		('MINOR_CIV_BRATISLAVA',		45,		56,		null,	null),
		('MINOR_CIV_BRUSSELS',			20,		60,		null,	null),
		('MINOR_CIV_BUCHAREST',			58,		40,		null,	null),
		('MINOR_CIV_BUDAPEST',			48,		50,		null,	null),
		('MINOR_CIV_BYBLOS',			84,		31,		null,	null),
		('MINOR_CIV_FLORENCE',			33,		41,		null,	null),
		('MINOR_CIV_GENEVA',			26,		43,		null,	null),
		('MINOR_CIV_GENOA',				32,		40,		null,	null),
		('MINOR_CIV_JERUSALEM',			87,		26,		null,	null),
		('MINOR_CIV_KIEV',				59,		69,		null,	null),
		('MINOR_CIV_MILAN',				30,		44,		null,	null),
		('MINOR_CIV_MONACO',			31,		39,		null,	null),
		('MINOR_CIV_ORMUS',				117,	38,		null,	null),
		('MINOR_CIV_PRAGUE',			35,		60,		null,	null),
		('MINOR_CIV_RAGUSA',			46,		41,		null,	null),
		('MINOR_CIV_SIDON',				56,		44,		null,	null),
		('MINOR_CIV_SOFIA',				28,		57,		null,	null),
		('MINOR_CIV_TYRE',				84,		31,		null,	null),
		('MINOR_CIV_UR',				100,	41,		null,	null),
		('MINOR_CIV_VALLETTA',			49,		10,		null,	null),
		('MINOR_CIV_VATICAN_CITY',		38,		33,		null,	null),
		('MINOR_CIV_VILNIUS',			47,		69,		null,	null),
		('MINOR_CIV_WITTENBERG',		31,		62,		null,	null),
		('MINOR_CIV_YEREVAN',			88,		65,		null,	null),
		('MINOR_CIV_ZURICH',			27,		50,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_MesopotamiaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_MesopotamiaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_SOFIA',				0,		45,		null,	null),
		('MINOR_CIV_BYBLOS',			31,		33,		null,	null),
		('MINOR_CIV_SIDON',				32,		28,		null,	null),
		('MINOR_CIV_JERUSALEM',			35,		16,		null,	null),
		('MINOR_CIV_TYRE',				32,		22,		null,	null),
		('MINOR_CIV_YEREVAN',			35,		46,		null,	null),
		('MINOR_CIV_UR',				56,		23,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_MesopotamiaGiantStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_MesopotamiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_MesopotamiaGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_YEREVAN',			117,	88,		null,	null),
		('MINOR_CIV_UR',				141,	80,		null,	null),
		('MINOR_CIV_ORMUS',				178,	15,		null,	null),
		('MINOR_CIV_BYBLOS',			66,		56,		null,	null),
		('MINOR_TYRE',					61,		49,		null,	null),
		('MINOR_SIDON',					63,		52,		null,	null),
		('MINOR_CIV_JERUSALEM',			63,		41,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NetherlandsStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NetherlandsStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NetherlandsStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			20,		10,		null,	null),
		('MINOR_CIV_BRUSSELS',			18,		4,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NileValleyStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NileValleyStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthAmericaGiantStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthAmericaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthAmericaGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_QUEBEC',			96,		64,		null,	null),
		('MINOR_CIV_VANCOUVER',			39,		66,		null,	null),
		('MINOR_CIV_CAHOKIA',			76,		54,		null,	null),
		('MINOR_CIV_LA_VENTA',			76,		19,		null,	null),
		('MINOR_CIV_PANAMA_CITY',		98,		3,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthAmericaHugeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthAmericaHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthAmericaHugeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_QUEBEC',			97,		51,		null,	null),
		('MINOR_CIV_VANCOUVER',			35,		51,		null,	null),
		('MINOR_CIV_CAHOKIA',			75,		41,		null,	null),
		('MINOR_CIV_LA_VENTA',			70,		5,		null,	null),
		('MINOR_CIV_PANAMA_CITY',		85,		0,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthAtlanticStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthAtlanticStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_RIGA',				53,		36,		null,	null),
		('MINOR_CIV_VALETTA',			103,	13,		null,	null),
		('MINOR_CIV_ANTWERP',			87,		33,		null,	null),
		('MINOR_CIV_RAGUSA',			99,		27,		null,	null),
		('MINOR_CIV_SOFIA',				105,	31,		null,	null),
		('MINOR_CIV_BRUSSELS',			89,		32,		null,	null),
		('MINOR_CIV_ZURICH',			92,		29,		null,	null),
		('MINOR_CIV_BRATISLAVA',		98,		35,		null,	null),
		('MINOR_CIV_QUEBEC',			22,		45,		null,	null),
		('MINOR_CIV_CAHOKIA',			4,		38,		null,	null),
		('MINOR_CIV_BUDAPEST',			99,		33,		null,	null),
		('MINOR_CIV_WITTENBERG',		94,		37,		null,	null),
		('MINOR_CIV_GENEVA',			92,		25,		null,	null),
		('MINOR_CIV_FLORENCE',			95,		25,		null,	null),
		('MINOR_CIV_MILAN',				93,		24,		null,	null),
		('MINOR_CIV_MONACO',			92,		21,		null,	null),
		('MINOR_CIV_GENOA',				93,		23,		null,	null),
		('MINOR_CIV_VATICAN_CITY',		98,		21,		null,	null),
		('MINOR_CIV_PRAGUE',			98,		36,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthEastAsiaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthEastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthEastAsiaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_HONG_KONG',			0,		6,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthSeaEuropeStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthSeaEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthSeaEuropeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			62,		12,		null,	null),
		('MINOR_CIV_BRUSSELS',			61,		7,		null,	null),
		('MINOR_CIV_PRAGUE',			98,		2,		null,	null),
		('MINOR_CIV_WITTENBERG',		87,		14,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthSeaGiantStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthSeaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthSeaGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			94,		0,		null,	null),
		('MINOR_CIV_RIGA',				128,	9,		null,	null),
		('MINOR_CIV_VILNIUS',			136,	8,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_NorthWestEuropeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_NorthWestEuropeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_RIGA',				95,		50,		null,	null),
		('MINOR_CIV_ZURICH',			37,		2,		null,	null),
		('MINOR_CIV_BUDAPEST',			50,		7,		null,	null),
		('MINOR_CIV_BRATISLAVA',		48,		11,		null,	null),
		('MINOR_CIV_ANTWERP',			27,		18,		null,	null),
		('MINOR_CIV_BRUSSELS',			29,		15,		null,	null),
		('MINOR_CIV_WITTENBERG',		39,		15,		null,	null),
		('MINOR_CIV_PRAGUE',			46,		13,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_OrientStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_OrientStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_OrientStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BELGRADE',			24,		72,		null,	null),
		('MINOR_CIV_BRATISLAVA',		25,		75,		null,	null),
		('MINOR_CIV_BUCHAREST',			29,		70,		null,	null),
		('MINOR_CIV_BUDAPEST',			24,		76,		null,	null),
		('MINOR_CIV_BYBLOS',			41,		47,		null,	null),
		('MINOR_CIV_COLOMBO',			123,	2,		null,	null),
		('MINOR_CIV_FLORENCE',			10,		78,		null,	null),
		('MINOR_CIV_GENOA',				7,		79,		null,	null),
		('MINOR_CIV_JERUSALEM',			41,		44,		null,	null),
		('MINOR_CIV_KABUL',				98,		48,		null,	null),
		('MINOR_CIV_KATHMANDU',			121,	48,		null,	null),
		('MINOR_CIV_KIEV',				37,		78,		null,	null),
		('MINOR_CIV_MONACO',			0,		79,		null,	null),
		('MINOR_CIV_ORMUS',				74,		30,		null,	null),
		('MINOR_CIV_RAGUSA',			19,		73,		null,	null),
		('MINOR_CIV_SAMARKAND',			73,		56,		null,	null),
		('MINOR_CIV_SIDON',				42,		48,		null,	null),
		('MINOR_CIV_SOFIA',				28,		70,		null,	null),
		('MINOR_CIV_TYRE',				41,		46,		null,	null),
		('MINOR_CIV_UR',				60,		40,		null,	null),
		('MINOR_CIV_VALLETTA',			11,		60,		null,	null),
		('MINOR_CIV_VATICAN_CITY',		11,		73,		null,	null),
		('MINOR_CIV_YEREVAN',			55,		63,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_PacificStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_PacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_PacificStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_SYDNEY',			50,		7,		null,	null),
		('MINOR_CIV_WELLINGTON',		61,		5,		null,	null),
		('MINOR_CIV_HANOI',				26,		45,		null,	null),
		('MINOR_CIV_HONG_KONG',			33,		47,		null,	null),
		('MINOR_CIV_KATHMANDU',			15,		51,		null,	null),
		('MINOR_CIV_MANILA',			37,		39,		null,	null),
		('MINOR_CIV_VANCOUVER',			102,	62,		null,	null),
		('MINOR_CIV_LHASA',				17,		55,		null,	null),
		('MINOR_CIV_MELBOURNE',			48,		4,		null,	null),
		('MINOR_CIV_KUALA_LUMPUR',		31,		36,		null,	null),
		('MINOR_CIV_COLOMBO',			10,		33,		null,	null),
		('MINOR_CIV_MALACCA',			22,		34,		null,	null),
		('MINOR_CIV_SINGAPORE',			24,		32,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_PatagoniaStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_PatagoniaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_PatagoniaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BUENOS_AIRES',		42,		76,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_RussiaLargeStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_RussiaLargeStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_ScotlandIrelandHugeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_ScotlandIrelandHugeStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SeaOfJapanStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SeaOfJapanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SeaOfJapanStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ALMATY',			70,		29,		null,	null),
		('MINOR_CIV_SAMARKAND',			54,		18,		null,	null),
		('MINOR_CIV_YEREVAN',			5,		19,		null,	null),
		('MINOR_CIV_KYZYL',				110,	58,		null,	null),
		('MINOR_CIV_KABUL',				58,		2,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthAmericaGiantStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthAmericaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthAmericaGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BOGOTA',            38,     127,    null,   null),
		('MINOR_CIV_BUENOS_AIRES',      67,     47,     null,   null),
		('MINOR_CIV_PANAMA_CITY',       25,     137,    null,   null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthAmericaCentralGiantStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthAmericaCentralGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthAmericaCentralGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BOGOTA',            61,     103,    null,   null),
		('MINOR_CIV_BUENOS_AIRES',      86,     42,     null,   null),
		('MINOR_CIV_LA_VENTA',  	    29,     128,    null,   null),
		('MINOR_CIV_PANAMA_CITY',       51,     111,    null,   null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthAmericaCentralHugeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthAmericaCentralHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthAmericaCentralHugeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BOGOTA',            47,     75,    null,   null),
		('MINOR_CIV_BUENOS_AIRES',      65,     31,     null,   null),
		('MINOR_CIV_LA_VENTA',  	    22,     97,     null,   null),
		('MINOR_CIV_PANAMA_CITY',       38,     85,     null,   null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthernAfricaStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthernAfricaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthernAfricaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTANANARIVO',		139,	62,		null,	null),
		('MINOR_CIV_CAPE_TOWN',			54,		5,		null,	null),
		('MINOR_CIV_MOGADISHU',			117,	108,	null,	null),
		('MINOR_CIV_MOMBASA',			111,	94,		null,	null),
		('MINOR_CIV_ZANZIBAR',			112,	93,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthPacificStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthPacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_PacificStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_WELLINGTON',		20,		11,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthAmericaLargeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthAmericaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthAmericaLargeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_BOGOTA',            34,		76,     null,   null),
		('MINOR_CIV_BUENOS_AIRES',      50,     29,     null,   null),
		('MINOR_CIV_PANAMA_CITY',       23,     83,     null,   null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthAsiaHugeStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthAsiaHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthAsiaHugeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_COLOMBO',           59,     4,      null,   null),
		('MINOR_CIV_HANOI',             105,    71,     null,   null),
		('MINOR_CIV_HONG_KONG',         117,    75,     null,   null),
		('MINOR_CIV_KABUL',             12,     70,     null,   null),
		('MINOR_CIV_KATHMANDU',         57,     72,     null,   null),
		('MINOR_CIV_KUALA_LUMPUR',      109,    16,     null,   null),
		('MINOR_CIV_LHASA',             68,     73,     null,   null),
		('MINOR_CIV_MALACCA',           111,    14,     null,   null),
		('MINOR_CIV_SINGAPORE',         116,    12,     null,   null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_SouthPacificGiantStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_SouthPacificGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_SouthAmericaLargeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_MELBOURNE',         7,		16,     null,   null),
		('MINOR_CIV_SYDNEY',    		18,     21,     null,   null),
		('MINOR_CIV_WELLINGTON',        69,     9,      null,   null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_TexcocoStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_TexcocoStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_VietnamStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_VietnamStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_VietnamStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_HANOI',				17,		70,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_WalesStartPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_WalesStartPosition(Type, X, Y, AltX, AltY);
--------------------------------------------------------------------------------------------------------------------------
-- MinorCiv_WestAfricaStartPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_WestAfricaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO MinorCiv_WestAfricaStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_MARRAKECH',			26,		60,		null,	null),
		('MINOR_CIV_CARTHAGE',			72,		77,		null,	null);
--==========================================================================================================================
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Adriatic'  
FROM MinorCiv_AdriaticStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Aegean'  
FROM MinorCiv_AegeanStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'AfriAsiaAust'  
FROM MinorCiv_AfriAsiaAustStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'AfricaLarge'  
FROM MinorCiv_AfricaLargeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'AfriGiant'  
FROM MinorCiv_AfriGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'AfriSouthEuro'  
FROM MinorCiv_AfriSouthEuroStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'AmericasGiant'  
FROM MinorCiv_AmericasGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Americas'  
FROM MinorCiv_AmericasStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Apennine'  
FROM MinorCiv_ApennineStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'AsiaSmall'  
FROM MinorCiv_AsiaSmallStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Asia'  
FROM MinorCiv_AsiaStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'AsiaSteppeGiant'  
FROM MinorCiv_AsiaSteppeGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'AtlanticGiant'  
FROM MinorCiv_AtlanticGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Australia'  
FROM MinorCiv_AustraliaStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'AustralasiaGiant'  
FROM MinorCiv_AustralasiaGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'BritishIsles'  
FROM MinorCiv_BritishIslesStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'CaribbeanHuge'  
FROM MinorCiv_CaribbeanHugeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Caribbean'  
FROM MinorCiv_CaribbeanStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Caucasus'  
FROM MinorCiv_CaucasusStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'CentralAfricaLarge'  
FROM MinorCiv_CentralAfricaLargeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'CentralAsia'  
FROM MinorCiv_CentralAsiaStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Cordiform'  
FROM MinorCiv_CordiformStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'EarthMk3'  
FROM MinorCiv_EarthMk3StartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'EastAsia'  
FROM MinorCiv_EastAsiaStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'EuroEastern'  
FROM MinorCiv_EuroEasternStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'EuroGiant'  
FROM MinorCiv_EuroGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'EuroLargeNew'  
FROM MinorCiv_EuroLargeNewStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'EuroLarge'  
FROM MinorCiv_EuroLargeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'GermanyHuge'  
FROM MinorCiv_GermanyHugeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'GreatestEarth'  
FROM MinorCiv_GreatestEarthStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Iberia'  
FROM MinorCiv_IberiaStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'IndiaGiant'  
FROM MinorCiv_IndiaGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'India'  
FROM MinorCiv_IndiaStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'IndianOcean'  
FROM MinorCiv_IndianOceanStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Indonesia'  
FROM MinorCiv_IndonesiaStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'JapanHuge'  
FROM MinorCiv_JapanHugeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'MediterraneanHuge'  
FROM MinorCiv_MediterraneanHugeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Mediterranean'  
FROM MinorCiv_MediterraneanStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'MesopotamiaGiant'  
FROM MinorCiv_MesopotamiaGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Mesopotamia'  
FROM MinorCiv_MesopotamiaStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Netherlands'  
FROM MinorCiv_NetherlandsStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'NileValley'  
FROM MinorCiv_NileValleyStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'NorthAmericaGiant'  
FROM MinorCiv_NorthAmericaGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'NorthAmericaHuge'  
FROM MinorCiv_NorthAmericaHugeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'NorthAtlantic'  
FROM MinorCiv_NorthAtlanticStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'NorthEastAsia'  
FROM MinorCiv_NorthEastAsiaStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'NorthSeaEurope'  
FROM MinorCiv_NorthSeaEuropeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'NorthSeaGiant'  
FROM MinorCiv_NorthSeaGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'NorthWestEurope'  
FROM MinorCiv_NorthWestEuropeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Pacific'  
FROM MinorCiv_PacificStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Patagonia'  
FROM MinorCiv_PatagoniaStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'RussiaLarge'  
FROM MinorCiv_RussiaLargeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'SeaOfJapan'  
FROM MinorCiv_SeaOfJapanStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'ScotlandIrelandHuge'  
FROM MinorCiv_ScotlandIrelandHugeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'SouthAmericaCentralGiant'  
FROM MinorCiv_SouthAmericaCentralGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'SouthAmericaCentralHuge'  
FROM MinorCiv_SouthAmericaCentralHugeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'SouthAmericaGiant'  
FROM MinorCiv_SouthAmericaGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'SouthAmericaLarge'  
FROM MinorCiv_SouthAmericaLargeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'SouthAsiaHuge'  
FROM MinorCiv_SouthAsiaHugeStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'SouthernAfrica'  
FROM MinorCiv_SouthernAfricaStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'SouthPacificGiant'  
FROM MinorCiv_SouthPacificGiantStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'SouthPacific'  
FROM MinorCiv_SouthPacificStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Texcoco'  
FROM MinorCiv_TexcocoStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Vietnam'  
FROM MinorCiv_VietnamStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Wales'  
FROM MinorCiv_WalesStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'WestAfrica'  
FROM MinorCiv_WestAfricaStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Yagem'  
FROM MinorCiv_YagemStartPosition;

INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,  X, Y, AltX, AltY, MapPrefix)
SELECT	 Type, 			X, Y, AltX, AltY, 'Yahem'  
FROM MinorCiv_YahemStartPosition;
--==========================================================================================================================
--==========================================================================================================================
