--==========================================================================================================================
-- REGIONS
--==========================================================================================================================
-- Resource_AegeanRegionPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AegeanRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AegeanRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		61,		51),
		('GREECE',						0,		0,		26,		51),
		('TURKEY',						26,		0,		35,		51);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfricaLargeRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfricaLargeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AfricaLargeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		65,		74),
		('WEST_AFRICA',					0,		40,		44,		13),
		('SOUTHEN_AFRICA',				0,		0,		64,		22),
		('CENTRAL_AFRICA',				0,		22,		43,		18),
		('EAST_AFRICA',					44,		22,		20,		31),
		('NORTH_AFRICA',				0,		53,		64,		20);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AmericasRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AmericasRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AmericasRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		66,		79),
		('NORTH_AMERICA',				0,		48,		66,		31),
		('SOUTH_AMERICA',				0,		0,		66,		48);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_ApennineRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_ApennineRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_ApennineRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		60,		58),
		('AFRICA',						0,		0,		11,		25),
		('BALKANS',						45,		20,		15,		38),
		('ITALY',						0,		0,		44,		43);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AsiaRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AsiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AsiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		103,	63);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_BritishIslesRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_BritishIslesRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_BritishIslesRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		61,		79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CaribbeanRegionPosition (Caribbean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CaribbeanRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_CaribbeanRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		99,		69);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EastAsiaRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EastAsiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_EastAsiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		79,		79),
		('INDIA',						0,		24,		13,		53),
		('NORTH_ASIA',					0,		0,		11,		25),
		('SOUTHEAST_ASIA',				16,		0,		64,		79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MediterraneanRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MediterraneanRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_MediterraneanRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		103,	63),
		('EUROPE',						0,		25,		102,	38),
		('AFRICA',						0,		0,		102,	25);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MesopotamiaRegionPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MesopotamiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_MesopotamiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		79,		49);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NileVallyRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NileValleyRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NileValleyRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		80,		79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAtlanticRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAtlanticRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthAtlanticRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		105,	57),
		('EUROPE',						50,		0,		55,		57),
		('AMERICA',						0,		0,		55,		57);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthEastAsiaRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthEastAsiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthEastAsiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		63,		55);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthWestEuropeRegionPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthWestEuropeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthWestEuropeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		56,		67);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_PacificRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_PacificRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_PacificRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		114,	79),
		('ASIA',						0,		0,		74,		79),
		('AMERICA',						74,		0,		40,		79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthPacificRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthPacificRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthPacificRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		99,		95);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MesopotamiaGiantRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MesopotamiaGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_MesopotamiaGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93),
		('LEVANT',						0,		0,		179,	93),
		('ANATOLIA',					0,		54,		132,	40),
		('AFRICA',						0,		0,		52,		53),
		('ARABIA',						23,		0,		80,		53),
		('ASIA',						133,	0,		46,		93);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AsiaSmallRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AsiaSmallRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AsiaSmallRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		55,		47);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EuroLargeNewRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EuroLargeNewRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_EuroLargeNewRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		85,		75),
		('AFRICA',						0,		0,		64,		8),
		('MIDDLE_EAST',					64,		0,		21,		8),
		('WEST_EUROPE',					0,		9,		41,		34),
		('NORTHERN_EUROPE',				0,		44,		85,		31),
		('EASTERN_EUROPE',				42,		9,		43,		34);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AdriaticRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AdriaticRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AdriaticRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_WestAfricaRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_WestAfricaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_WestAfricaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		100,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CaucasusRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CaucasusRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_CaucasusRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AsiaSteppeGiantRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AsiaSteppeGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AsiaSteppeGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CentralAsiaRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CentralAsiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_CentralAsiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EuroEasternRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EuroEasternRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_EuroEasternRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		102,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthSeaEuropeRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthSeaEuropeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthSeaEuropeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		126,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfriAsiaAustRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfriAsiaAustRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AfriAsiaAustRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93),
		('AFRICA',						0,		0,		50,		67),
		('EUROPE',						0,		68,		50,		11),
		('CENTRAL_ASIA',				51,		32,		22,		48),
		('EAST_ASIA',					74,		28,		53,		52),
		('AUSTRALIA',					101,	0,		26,		27);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfriSouthEuroRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfriSouthEuroRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AfriSouthEuroRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93),
		('NORTH_AFRICA',				0,		48,		60,		14),
		('WEST_AFRICA',					0,		20,		42,		28),
		('EAST_AFRICA',					43,		20,		17,		28),
		('SOUTH_AFRICA',				0,		0,		79,		19),
		('EUROPE',						0,		62,		51,		17),
		('ANATOLIA',					52,		62,		27,		17),
		('MIDDLE_EAST',					61,		49,		18,		13);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfriGiantRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfriGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AfriGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		140,	140),
		('NORTH_AFRICA',				0,		95,		95,		45),
		('WEST_AFRICA',					0,		76,		95,		19),
		('EAST_AFRICA',					90,		33,		50,		43),
		('CENTRAL_AFRICA',				0,		33,		90,		43),
		('SOUTHEN_AFRICA',				0,		0,		140,	33),
		('MIDDLE_EAST',					95,		95,		45,		45);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaGiantRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthAmericaGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		120,	145),
		('SOUTH_AMERICA_WEST_SOUTHERN',	0,		10,		62,		80),
		('SOUTH_AMERICA_WEST_NORTHERN',	0,		91,		44,		55),
		('SOUTH_AMERICA_EAST_SOUTHERN',	62,		10,		58,		80),
		('SOUTH_AMERICA_EAST_NORTHERN',	45,		91,		75,		55),
		('SOUTH_AMERICA_ANTARCTIC',		0,		0,		120,	10);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AustralasiaGiantRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AustralasiaGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AustralasiaGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		140,	135),
		('AUSTRALIA',					0,		0,		140,	70)	;
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IndianOceanRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IndianOceanRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_IndianOceanRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		97,		72),
		('AUSTRALIA',					81,		0,		66,		16),
		('SOUTHEAST_ASIA',				67,		24,		30,		48),
		('AFRICA',						0,		0,		14,		56),
		('INDIA',						42,		41,		25,		31),
		('MIDDLE_EAST',					0,		56,		41,		16);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AmericasGiantRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AmericasGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AmericasGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		128,	155),
		('ANTARCTIC_AMERICA',			0,		138,	128,	17),
		('NORTH_AMERICA',				18,		102,	110,	36),
		('CENTRAL_AMERICA',				31,		81,		97,		20),
		('HAWAII',						0,		0,		13,		101),
		('SOUTH_AMERICA',				55,		0,		73,		80);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IndiaGiantRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IndiaGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_IndiaGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		110,	130);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaCentralHugeRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaCentralHugeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthAmericaCentralHugeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		100,	105),
		('SOUTH_AMERICA',				0,		0,		100,	83),
		('CENTRAL_AMERICA',				0,		84,		100,	21);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaCentralGiantRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaCentralGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthAmericaCentralGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		130,	140),
		('SOUTH_AMERICA',				0,		0,		130,	116),
		('CENTRAL_AMERICA',				0,		118,	130,	24);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_ScotlandIrelandHugeRegionPosition
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_ScotlandIrelandHugeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_ScotlandIrelandHugeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	80);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaLargeRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaLargeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthAmericaLargeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		85,		90),
		('SOUTH_AMERICA_CENTRAL',		0,		15,		85,		76),
		('SOUTH_AMERICA_ANTARCTIC',		0,		0,		85,		14);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAsiaHugeRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAsiaHugeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthAsiaHugeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		128,	80);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthPacificGiantRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthPacificGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthPacificGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		180,	94);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAmericaGiantRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAmericaGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthAmericaGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		140,	110),
		('ANTARCTIC_AMERICA',			0,		91,		140,	19),
		('NORTH_AMERICA',				0,		25,		140,	66),
		('CENTRAL_AMERICA',				0,		0,		140,	25);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAmericaHugeRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAmericaHugeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthAmericaHugeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		128,	80),
		('ANTARCTIC_AMERICA',			0,		65,		128,	15),
		('NORTH_AMERICA',				0,		16,		128,	49),
		('CENTRAL_AMERICA',				0,		0,		128,	15);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AtlanticGiantRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AtlanticGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AtlanticGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93),
		('AFRICA',						100,	0,		78,		30),
		('CENTRAL_AMERICA',				30,		43,		35,		15),
		('EUROPE',						122,	52,		57,		49),
		('NORTH_AMERICA',				23,		58,		128,	35),
		('SOUTH_AMERICA',				0,		0,		76,		40);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AustraliaRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AustraliaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_AustraliaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		70,		79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CaribbeanHugeRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CaribbeanHugeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_CaribbeanHugeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CentralAfricaLargeRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CentralAfricaLargeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_CentralAfricaLargeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		101,	59);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_DenmarkRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_DenmarkRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_DenmarkRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		51,		65);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EarthMk3RegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EarthMk3RegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_EarthMk3RegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93),
		('GROENLAND',					163,	81,		16,		12),
		('NORTH_AMERICA',				108,	52,		71,		27),
		('ARCTIC_AMERICA',				108,	79,		71,		14),
		('CENTRAL_AMERICA',				108,	42,		71,		10),
		('SOUTH_AMERICA_WEST',			145,	2,		9,		42),
		('SOUTH_AMERICA_EAST',			155,	2,		24,		42),
		('AUSTRALIA',					88,		5,		23,		18),
		('OCEANIA',						111,	1,		24,		33),
		('SOUTH_ASIA',					56,		29,		18,		20),
		('CENTRAL_ASIA',				57,		55,		19,		17),
		('EAST_ASIA',					73,		25,		40,		24),
		('NORTH_ASIA',					75,		51,		33,		28),
		('MIDDLE_EAST',					38,		33,		16,		21),
		('TURKEY',						32,		51,		9,		7),
		('MEDITERRANEAN',				5,		46,		29,		12),
		('WEST_EUROPA',					3,		55,		21,		14),
		('NORTH_EUROPA',				5,		62,		29,		31),
		('EAST_EUROPA',					23,		57,		23,		36),
		('NORTH_AFRICA',				4,		37,		34,		10),
		('CENTRAL_AFRICA',				9,		19,		25,		14),
		('SOUTH_AFRICA',				22,		3,		16,		16),
		('MADAGASCAR',					43,		8,		6,		13);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_GermanyHugeRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_GermanyHugeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_GermanyHugeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IberiaRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IberiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_IberiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		71,		79),
		('AFRICA',						0,		0,		71,		27),
		('EUROPE',						0,		28,		71,		51);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IndiaRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IndiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_IndiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		91,		79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IndonesiaRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IndonesiaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_IndonesiaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_JapanHugeRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_JapanHugeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_JapanHugeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MediterraneanHugeRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MediterraneanHugeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_MediterraneanHugeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	71),
		('EUROPE',						0,		0,		65,		71),
		('MIDDLE_EAST',					65,		0,		62,		71);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NetherlandsRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NetherlandsRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NetherlandsRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		74,		49);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthSeaGiantRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthSeaGiantRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_NorthSeaGiantRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		179,	93),
		('EUROPE',						35,		0,		144,	93),
		('NORTH_AMERICA',				0,		0,		35,		93);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_OrientRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_OrientRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_OrientRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	79),
		('AFRICA',						0,		0,		40,		32),
		('INDIA',						96,		0,		31,		35),
		('EUROPE',						0,		58,		30,		50),
		('MIDDLE_EAST',					40,		0,		43,		42),
		('TURKEY',						30,		53,		15,		13);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_RussiaLargeRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_RussiaLargeRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_RussiaLargeRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		107,	67),
		('ASIA',						24,		0,		83,		67),
		('EUROPE',						0,		0,		24,		67);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_PatagoniaRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_PatagoniaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_PatagoniaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	101);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SeaOfJapanRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SeaOfJapanRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SeaOfJapanRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		127,	79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthernAfricaRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthernAfricaRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_SouthernAfricaRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		165,	117),
		('CENTRAL_AFRICA',				0,		82,		84,		35),
		('MADAGASCAR',					126,	32,		21,		47),
		('SOUTH_AFRICA',				0,		0,		165,	82);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_TexcocoRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_TexcocoRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_TexcocoRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		56,		76);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_VietnamRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_VietnamRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_VietnamRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		38,		79);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_WalesRegionPosition 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_WalesRegionPosition(Type, X, Y, Width, Height);
INSERT INTO Resource_WalesRegionPosition
		(Type,							X,		Y,		Width,	Height)
VALUES	('WHOLE_MAP',					0,		0,		75,		101);
--==========================================================================================================================
--==========================================================================================================================
-- Resource_AegeanRegionExclude
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AegeanRegionExclude(Type, Resource);
INSERT INTO Resource_AegeanRegionExclude
		(Type,				Resource)
VALUES	('GREECE',			'RESOURCE_WINE'),
		('GREECE',			'RESOURCE_INCENSE'),
		('GREECE',			'RESOURCE_FUR'),
		('GREECE',			'RESOURCE_TRUFFLES'),
		('GREECE',			'RESOURCE_BISON'),
		('GREECE',			'RESOURCE_COCOA'),
		('GREECE',			'RESOURCE_IVORY'),
		('GREECE',			'RESOURCE_SUGAR'),
		('TURKEY',			'RESOURCE_FUR'),
		('TURKEY',			'RESOURCE_SUGAR'),
		('TURKEY',			'RESOURCE_IVORY'),
		('TURKEY',			'RESOURCE_PEARLS'),
		('TURKEY',			'RESOURCE_MARBLE'),
		('TURKEY',			'RESOURCE_SPICES'),
		('TURKEY',			'RESOURCE_SUGAR'),
		('TURKEY',			'RESOURCE_COTTON'),
		('TURKEY',			'RESOURCE_WINE'),
		('TURKEY',			'RESOURCE_CITRUS'),
		('TURKEY',			'RESOURCE_TRUFFLES'),
		('TURKEY',			'RESOURCE_COCOA'),
		('TURKEY',			'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfricaLargeRegionExclude
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfricaLargeRegionExclude(Type, Resource);
INSERT INTO Resource_AfricaLargeRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_FUR'),
		('WHOLE_MAP',		'RESOURCE_BISON'),			
		('WHOLE_MAP',		'RESOURCE_JADE'),			
		('WEST_AFRICA',		'RESOURCE_WHEAT'),
		('WEST_AFRICA',		'RESOURCE_SPICES'),
		('WEST_AFRICA',		'RESOURCE_SILK'),			
		('WEST_AFRICA',		'RESOURCE_INCENSE'),
		('WEST_AFRICA',		'RESOURCE_WINE'),
		('WEST_AFRICA',		'RESOURCE_SILVER'),
		('WEST_AFRICA',		'RESOURCE_PEARLS'),
		('WEST_AFRICA',		'RESOURCE_CITRUS'),
		('WEST_AFRICA',		'RESOURCE_TRUFFLES'),	
		('WEST_AFRICA',		'RESOURCE_TOBACCO'),	
		('SOUTHEN_AFRICA',	'RESOURCE_TOBACCO'),
		('SOUTHEN_AFRICA',	'RESOURCE_SPICES'),
		('SOUTHEN_AFRICA',	'RESOURCE_SILK'),			
		('SOUTHEN_AFRICA',	'RESOURCE_INCENSE'),
		('SOUTHEN_AFRICA',	'RESOURCE_MARBLE'),
		('SOUTHEN_AFRICA',	'RESOURCE_COCOA'),
		('CENTRAL_AFRICA',	'RESOURCE_WHEAT'),
		('CENTRAL_AFRICA',	'RESOURCE_SHEEP'),
		('CENTRAL_AFRICA',	'RESOURCE_SPICES'),			
		('CENTRAL_AFRICA',	'RESOURCE_SILK'),
		('CENTRAL_AFRICA',	'RESOURCE_INCENSE'),
		('CENTRAL_AFRICA',	'RESOURCE_WINE'),
		('CENTRAL_AFRICA',	'RESOURCE_SILVER'),
		('CENTRAL_AFRICA',	'RESOURCE_MARBLE'),
		('CENTRAL_AFRICA',	'RESOURCE_PEARLS'),
		('CENTRAL_AFRICA',	'RESOURCE_TOBACCO'),
		('CENTRAL_AFRICA',	'RESOURCE_CITRUS'),
		('EAST_AFRICA',		'RESOURCE_SILK'),
		('EAST_AFRICA',		'RESOURCE_COPPER'),
		('EAST_AFRICA',		'RESOURCE_SILVER'),
		('EAST_AFRICA',		'RESOURCE_MARBLE'),
		('EAST_AFRICA',		'RESOURCE_CITRUS'),
		('EAST_AFRICA',		'RESOURCE_COCOA'),
		('EAST_AFRICA',		'RESOURCE_TRUFFLES'),
		('EAST_AFRICA',		'RESOURCE_GEMS'),			
		('EAST_AFRICA',		'RESOURCE_TOBACCO'),			
		('NORTH_AFRICA',	'RESOURCE_TOBACCO'),
		('NORTH_AFRICA',	'RESOURCE_BANANA'),
		('NORTH_AFRICA',	'RESOURCE_CATTLE'),
		('NORTH_AFRICA',	'RESOURCE_SUGAR'),
		('NORTH_AFRICA',	'RESOURCE_COCOA'),
		('NORTH_AFRICA',	'RESOURCE_TRUFFLES'),
		('NORTH_AFRICA',	'RESOURCE_GEMS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AmericasRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AmericasRegionExclude(Type, Resource);
INSERT INTO Resource_AmericasRegionExclude
		(Type,				Resource)
VALUES	('SOUTH_AMERICA',	'RESOURCE_BISON'),
		('SOUTH_AMERICA',	'RESOURCE_COW'),
		('SOUTH_AMERICA',	'RESOURCE_SHEEP'),
		('SOUTH_AMERICA',	'RESOURCE_HORSE'),
		('SOUTH_AMERICA',	'RESOURCE_SILK'),
		('SOUTH_AMERICA',	'RESOURCE_IVORY'),
		('SOUTH_AMERICA',	'RESOURCE_INCENSE'),
		('SOUTH_AMERICA',	'RESOURCE_JADE'),
		('SOUTH_AMERICA',	'RESOURCE_TEA'),
		('SOUTH_AMERICA',	'RESOURCE_OLIVE'),
		('SOUTH_AMERICA',	'RESOURCE_SPICES'),
		('SOUTH_AMERICA',	'RESOURCE_COFFEE'),
		('NORTH_AMERICA',	'RESOURCE_CITRUS'),
		('NORTH_AMERICA',	'RESOURCE_COW'),
		('NORTH_AMERICA',	'RESOURCE_SPICES'),
		('NORTH_AMERICA',	'RESOURCE_SHEEP'),
		('NORTH_AMERICA',	'RESOURCE_HORSE'),
		('NORTH_AMERICA',	'RESOURCE_SILK'),
		('NORTH_AMERICA',	'RESOURCE_IVORY'),
		('NORTH_AMERICA',	'RESOURCE_INCENSE'),
		('NORTH_AMERICA',	'RESOURCE_JADE'),
		('NORTH_AMERICA',	'RESOURCE_TEA'),
		('NORTH_AMERICA',	'RESOURCE_OLIVE'),
		('NORTH_AMERICA',	'RESOURCE_COFFEE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_ApennineRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_ApennineRegionExclude(Type, Resource);
INSERT INTO Resource_ApennineRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_FUR'),
		('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_TOBACCO'),
		('WHOLE_MAP',		'RESOURCE_TEA'),
		('WHOLE_MAP',		'RESOURCE_SILK'),
		('WHOLE_MAP',		'RESOURCE_JADE'),
		('WHOLE_MAP',		'RESOURCE_COFFEE'),
		('AFRICA',			'RESOURCE_COW'),
		('AFRICA',			'RESOURCE_MARBLE'),
		('BALKANS',			'RESOURCE_IVORY'),
		('BALKANS',			'RESOURCE_PEARLS'),
		('BALKANS',			'RESOURCE_SPICES'),
		('BALKANS',			'RESOURCE_INCENSE'),
		('BALKANS',			'RESOURCE_WINE'),
		('ITALY',			'RESOURCE_IVORY'),
		('ITALY',			'RESOURCE_PEARLS'),
		('ITALY',			'RESOURCE_SPICES'),
		('ITALY',			'RESOURCE_INCENSE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AsiaRegionExclude
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AsiaRegionExclude(Type, Resource);
INSERT INTO Resource_AsiaRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_OLIVE'),
		('WHOLE_MAP',		'RESOURCE_IVORY'),
		('WHOLE_MAP',		'RESOURCE_FUR'),
		('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_SUGAR'),
		('WHOLE_MAP',		'RESOURCE_COTTON'),
		('WHOLE_MAP',		'RESOURCE_WINE'),
		('WHOLE_MAP',		'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_TOBACCO');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_BritishIslesRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_BritishIslesRegionExclude(Type, Resource);
INSERT INTO Resource_BritishIslesRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_BANANA'),
		('WHOLE_MAP',		'RESOURCE_SILK'),
		('WHOLE_MAP',		'RESOURCE_TOBACCO'),
		('WHOLE_MAP',		'RESOURCE_SILK'),
		('WHOLE_MAP',		'RESOURCE_COTTON'),
		('WHOLE_MAP',		'RESOURCE_TEA'),
		('WHOLE_MAP',		'RESOURCE_IVORY'),
		('WHOLE_MAP',		'RESOURCE_SPICES'),
		('WHOLE_MAP',		'RESOURCE_CITRUS'),
		('WHOLE_MAP',		'RESOURCE_WINE'),
		('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_SUGAR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CaribbeanRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CaribbeanRegionExclude(Type, Resource);
INSERT INTO Resource_CaribbeanRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_COW'),
		('WHOLE_MAP',		'RESOURCE_SHEEP'),
		('WHOLE_MAP',		'RESOURCE_HORSE'),
		('WHOLE_MAP',		'RESOURCE_SILK'),
		('WHOLE_MAP',		'RESOURCE_IVORY'),
		('WHOLE_MAP',		'RESOURCE_SPICES'),
		('WHOLE_MAP',		'RESOURCE_MARBLE'),
		('WHOLE_MAP',		'RESOURCE_CITRUS'),
		('WHOLE_MAP',		'RESOURCE_WINE'),
		('WHOLE_MAP',		'RESOURCE_INCENSE'),
		('WHOLE_MAP',		'RESOURCE_JADE'),
		('WHOLE_MAP',		'RESOURCE_TEA'),
		('WHOLE_MAP',		'RESOURCE_OLIVE'),
		('WHOLE_MAP',		'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',		'RESOURCE_COFFEE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EastAsiaRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EastAsiaRegionExclude(Type, Resource);
INSERT INTO Resource_EastAsiaRegionExclude
		(Type,				Resource)
VALUES	('INDIA',			'RESOURCE_WINE'),
		('INDIA',			'RESOURCE_INCENSE'),
		('INDIA',			'RESOURCE_FUR'),
		('INDIA',			'RESOURCE_TRUFFLES'),
		('INDIA',			'RESOURCE_BISON'),
		('INDIA',			'RESOURCE_COCOA'),
		('INDIA',			'RESOURCE_TOBACCO'),
		('INDIA',			'RESOURCE_OLIVE'),
		('NORTH_ASIA',		'RESOURCE_OLIVE'),
		('NORTH_ASIA',		'RESOURCE_IVORY'),
		('NORTH_ASIA',		'RESOURCE_PEARLS'),
		('NORTH_ASIA',		'RESOURCE_MARBLE'),
		('NORTH_ASIA',		'RESOURCE_SPICES'),
		('NORTH_ASIA',		'RESOURCE_SUGAR'),
		('NORTH_ASIA',		'RESOURCE_COTTON'),
		('NORTH_ASIA',		'RESOURCE_WINE'),
		('NORTH_ASIA',		'RESOURCE_CITRUS'),
		('NORTH_ASIA',		'RESOURCE_TRUFFLES'),
		('NORTH_ASIA',		'RESOURCE_COCOA'),
		('NORTH_ASIA',		'RESOURCE_TOBACCO'),
		('SOUTHEAST_ASIA',	'RESOURCE_OLIVE'),
		('SOUTHEAST_ASIA',	'RESOURCE_IVORY'),
		('SOUTHEAST_ASIA',	'RESOURCE_IVORY'),
		('SOUTHEAST_ASIA',	'RESOURCE_SPICES'),
		('SOUTHEAST_ASIA',	'RESOURCE_SUGAR'),
		('SOUTHEAST_ASIA',	'RESOURCE_INCENSE'),
		('SOUTHEAST_ASIA',	'RESOURCE_BISON'),
		('SOUTHEAST_ASIA',	'RESOURCE_FUR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MediterraneanRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MediterraneanRegionExclude(Type, Resource);
INSERT INTO Resource_MediterraneanRegionExclude
		(Type,				Resource)
VALUES	('EUROPE',			'RESOURCE_BISON'),
		('EUROPE',			'RESOURCE_FUR'),
		('EUROPE',			'RESOURCE_COCOA'),
		('EUROPE',			'RESOURCE_TOBACCO'),
		('EUROPE',			'RESOURCE_TEA'),
		('EUROPE',			'RESOURCE_SILK'),
		('EUROPE',			'RESOURCE_JADE'),
		('EUROPE',			'RESOURCE_COFFEE'),
		('EUROPE',			'RESOURCE_IVORY'),
		('EUROPE',			'RESOURCE_SPICES'),
		('EUROPE',			'RESOURCE_INCENSE'),
		('AFRICA',			'RESOURCE_BISON'),
		('AFRICA',			'RESOURCE_FUR'),
		('AFRICA',			'RESOURCE_COCOA'),
		('AFRICA',			'RESOURCE_TOBACCO'),
		('AFRICA',			'RESOURCE_TEA'),
		('AFRICA',			'RESOURCE_SILK'),
		('AFRICA',			'RESOURCE_JADE'),
		('AFRICA',			'RESOURCE_COFFEE'),
		('AFRICA',			'RESOURCE_SPICES');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MesopotamiaRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MesopotamiaRegionExclude(Type, Resource);
INSERT INTO Resource_MesopotamiaRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_BANANA'),
		('WHOLE_MAP',		'RESOURCE_FUR'),
		('WHOLE_MAP',		'RESOURCE_COTTON'),
		('WHOLE_MAP',		'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_JADE'),
		('WHOLE_MAP',		'RESOURCE_SILK'),
		('WHOLE_MAP',		'RESOURCE_SPICES'),
		('WHOLE_MAP',		'RESOURCE_TEA'),
		('WHOLE_MAP',		'RESOURCE_TOBACCO'),
		('WHOLE_MAP',		'RESOURCE_COFFEE'),
		('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_SUGAR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NileValleyRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NileValleyRegionExclude(Type, Resource);
INSERT INTO Resource_NileValleyRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_BANANA'),
		('WHOLE_MAP',		'RESOURCE_WINE'),
		('WHOLE_MAP',		'RESOURCE_FUR'),
		('WHOLE_MAP',		'RESOURCE_COTTON'),
		('WHOLE_MAP',		'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_SPICES'),
		('WHOLE_MAP',		'RESOURCE_TEA'),
		('WHOLE_MAP',		'RESOURCE_TOBACCO'),
		('WHOLE_MAP',		'RESOURCE_COFFEE'),
		('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_SUGAR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAtlanticRegionExclude
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAtlanticRegionExclude(Type, Resource);
INSERT INTO Resource_NorthAtlanticRegionExclude
		(Type,				Resource)
VALUES	('AMERICA',			'RESOURCE_HORSE'),
		('AMERICA',			'RESOURCE_SILK'),
		('AMERICA',			'RESOURCE_JADE'),
		('AMERICA',			'RESOURCE_IVORY'),
		('EUROPE',			'RESOURCE_BANANA'),
		('EUROPE',			'RESOURCE_JADE'),
		('EUROPE',			'RESOURCE_SILK'),
		('EUROPE',			'RESOURCE_TOBACCO'),
		('EUROPE',			'RESOURCE_SILK'),
		('EUROPE',			'RESOURCE_COTTON'),
		('EUROPE',			'RESOURCE_TEA'),
		('EUROPE',			'RESOURCE_IVORY'),
		('EUROPE',			'RESOURCE_SPICES'),
		('EUROPE',			'RESOURCE_CITRUS'),
		('EUROPE',			'RESOURCE_BISON'),
		('EUROPE',			'RESOURCE_COFFEE'),
		('EUROPE',			'RESOURCE_COCOA'),
		('EUROPE',			'RESOURCE_SUGAR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthEastAsiaRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthEastAsiaRegionExclude(Type, Resource);
INSERT INTO Resource_NorthEastAsiaRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_WINE'),
		('WHOLE_MAP',		'RESOURCE_INCENSE'),
		('WHOLE_MAP',		'RESOURCE_FUR'),
		('WHOLE_MAP',		'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_TOBACCO'),
		('WHOLE_MAP',		'RESOURCE_SUGAR'),
		('WHOLE_MAP',		'RESOURCE_OLIVE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthWestEuropeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthWestEuropeRegionExclude(Type, Resource);
INSERT INTO Resource_NorthWestEuropeRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_BANANA'),
		('WHOLE_MAP',		'RESOURCE_SILK'),
		('WHOLE_MAP',		'RESOURCE_TOBACCO'),
		('WHOLE_MAP',		'RESOURCE_JADE'),
		('WHOLE_MAP',		'RESOURCE_SILK'),
		('WHOLE_MAP',		'RESOURCE_COTTON'),
		('WHOLE_MAP',		'RESOURCE_TEA'),
		('WHOLE_MAP',		'RESOURCE_IVORY'),
		('WHOLE_MAP',		'RESOURCE_SPICES'),
		('WHOLE_MAP',		'RESOURCE_CITRUS'),
		('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_SUGAR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_PacificRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_PacificRegionExclude(Type, Resource);
INSERT INTO Resource_PacificRegionExclude
		(Type,				Resource)
VALUES	('AMERICA',			'RESOURCE_WINE'),
		('AMERICA',			'RESOURCE_INCENSE'),
		('AMERICA',			'RESOURCE_TRUFFLES'),
		('AMERICA',			'RESOURCE_HORSE'),
		('AMERICA',			'RESOURCE_COW'),
		('AMERICA',			'RESOURCE_SHEEP'),
		('AMERICA',			'RESOURCE_SILK'),
		('AMERICA',			'RESOURCE_COCOA'),
		('AMERICA',			'RESOURCE_JADE'),
		('AMERICA',			'RESOURCE_OLIVE'),
		('ASIA',			'RESOURCE_WINE'),
		('ASIA',			'RESOURCE_TRUFFLES'),
		('ASIA',			'RESOURCE_BISON'),
		('ASIA',			'RESOURCE_COCOA'),
		('ASIA',			'RESOURCE_TOBACCO'),
		('ASIA',			'RESOURCE_SUGAR'),
		('ASIA',			'RESOURCE_OLIVE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthPacificRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthPacificRegionExclude(Type, Resource);
INSERT INTO Resource_SouthPacificRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_BANANA'),
		('WHOLE_MAP',		'RESOURCE_HORSE'),
		('WHOLE_MAP',		'RESOURCE_IVORY'),
		('WHOLE_MAP',		'RESOURCE_MARBLE'),
		('WHOLE_MAP',		'RESOURCE_SPICES'),
		('WHOLE_MAP',		'RESOURCE_SILK'),
		('WHOLE_MAP',		'RESOURCE_SUGAR'),
		('WHOLE_MAP',		'RESOURCE_INCENSE'),
		('WHOLE_MAP',		'RESOURCE_TOBACCO'),
		('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_OLIVE'),
		('WHOLE_MAP',		'RESOURCE_TEA'),
		('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_JADE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MesopotamiaGiantRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MesopotamiaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_MesopotamiaGiantRegionExclude
		(Type,				Resource)
VALUES	('LEVANT',			'RESOURCE_BANANA'),
		('LEVANT',			'RESOURCE_SUGAR'),
		('LEVANT',			'RESOURCE_BISON'),
		('LEVANT',			'RESOURCE_FUR'),
		('LEVANT',			'RESOURCE_TRUFFLES'),
		('LEVANT',			'RESOURCE_SILK'),
		('LEVANT',			'RESOURCE_JADE'),
		('LEVANT',			'RESOURCE_COCOA'),
		('LEVANT',			'RESOURCE_COFFEE'),
		('ANATOLIA',		'RESOURCE_SPICES'),
		('ANATOLIA',		'RESOURCE_IVORY'),
		('AFRICA',			'RESOURCE_WINE'),
		('AFRICA',			'RESOURCE_SPICES'),
		('AFRICA',			'RESOURCE_TOBACCO'),
		('AFRICA',			'RESOURCE_TEA'),
		('AFRICA',			'RESOURCE_CITRUS'),
		('ARABIA',			'RESOURCE_WINE'),
		('ARABIA',			'RESOURCE_SPICES'),
		('ARABIA',			'RESOURCE_TOBACCO'),
		('ARABIA',			'RESOURCE_TEA'),
		('ARABIA',			'RESOURCE_IVORY'),
		('ASIA',			'RESOURCE_WINE'),
		('ASIA',			'RESOURCE_TOBACCO'),
		('ASIA',			'RESOURCE_IVORY'),
		('ASIA',			'RESOURCE_WINE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AsiaSmallRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AsiaSmallRegionExclude(Type, Resource);
INSERT INTO Resource_AsiaSmallRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_OLIVE'),
		('WHOLE_MAP',		'RESOURCE_WINE'),
		('WHOLE_MAP',		'RESOURCE_SUGAR'),
		('WHOLE_MAP',		'RESOURCE_TRUFFLES');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EuroLargeNewRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EuroLargeNewRegionExclude(Type, Resource);
INSERT INTO Resource_EuroLargeNewRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_SUGAR'),
		('WHOLE_MAP',		'RESOURCE_BANANA'),
		('WHOLE_MAP',		'RESOURCE_JADE'),
		('AFRICA',			'RESOURCE_BISON'),
		('AFRICA',			'RESOURCE_SILK'),
		('AFRICA',			'RESOURCE_COW'),
		('AFRICA',			'RESOURCE_FUR'),
		('AFRICA',			'RESOURCE_DYE'),
		('AFRICA',			'RESOURCE_TOBACCO'),
		('AFRICA',			'RESOURCE_MARBLE'),	
		('AFRICA',			'RESOURCE_TEA'),			
		('MIDDLE_EAST',		'RESOURCE_IVORY'),
		('MIDDLE_EAST',		'RESOURCE_COFFEE'),
		('MIDDLE_EAST',		'RESOURCE_COW'),
		('MIDDLE_EAST',		'RESOURCE_FUR'),
		('MIDDLE_EAST',		'RESOURCE_WINE'),
		('MIDDLE_EAST',		'RESOURCE_GEMS'),
		('MIDDLE_EAST',		'RESOURCE_WHALE'),
		('MIDDLE_EAST',		'RESOURCE_DYE'),
		('MIDDLE_EAST',		'RESOURCE_BISON'),
		('MIDDLE_EAST',		'RESOURCE_LAPIS'),			
		('WEST_EUROPE',		'RESOURCE_IVORY'),
		('WEST_EUROPE',		'RESOURCE_COFFEE'),
		('WEST_EUROPE',		'RESOURCE_BISON'),
		('WEST_EUROPE',		'RESOURCE_PEARLS'),
		('WEST_EUROPE',		'RESOURCE_SPICES'),
		('WEST_EUROPE',		'RESOURCE_SILK'),
		('WEST_EUROPE',		'RESOURCE_INCENSE'),
		('WEST_EUROPE',		'RESOURCE_FUR'),	
		('WEST_EUROPE',		'RESOURCE_TOBACCO'),
		('WEST_EUROPE',		'RESOURCE_TEA'),	
		('WEST_EUROPE',		'RESOURCE_LAPIS'),
		('NORTHERN_EUROPE',	'RESOURCE_IVORY'),
		('NORTHERN_EUROPE',	'RESOURCE_PERFUME'),
		('NORTHERN_EUROPE',	'RESOURCE_OLIVE'),
		('NORTHERN_EUROPE',	'RESOURCE_COFFEE'),
		('NORTHERN_EUROPE',	'RESOURCE_PEARLS'),
		('NORTHERN_EUROPE',	'RESOURCE_MARBLE'),
		('NORTHERN_EUROPE',	'RESOURCE_INCENSE'),
		('NORTHERN_EUROPE',	'RESOURCE_WINE'),
		('NORTHERN_EUROPE',	'RESOURCE_COTTON'),
		('NORTHERN_EUROPE',	'RESOURCE_SILK'),
		('NORTHERN_EUROPE',	'RESOURCE_SPICES'),
		('NORTHERN_EUROPE',	'RESOURCE_TOBACCO'),
		('NORTHERN_EUROPE',	'RESOURCE_TEA'),	
		('NORTHERN_EUROPE',	'RESOURCE_LAPIS'),
		('EASTERN_EUROPE',	'RESOURCE_COFFEE'),
		('EASTERN_EUROPE',	'RESOURCE_OLIVE'),			
		('EASTERN_EUROPE',	'RESOURCE_IVORY'),
		('EASTERN_EUROPE',	'RESOURCE_PEARLS'),
		('EASTERN_EUROPE',	'RESOURCE_SPICES'),
		('EASTERN_EUROPE',	'RESOURCE_SILK'),
		('EASTERN_EUROPE',	'RESOURCE_INCENSE'),
		('EASTERN_EUROPE',	'RESOURCE_PERFUME'),
		('EASTERN_EUROPE',	'RESOURCE_TEA'),
		('EASTERN_EUROPE',	'RESOURCE_LAPIS'),	
		('EASTERN_EUROPE',	'RESOURCE_TOBACCO');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AdriaticRegionExclude
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AdriaticRegionExclude(Type, Resource);
INSERT INTO Resource_AdriaticRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_SUGAR'),
		('WHOLE_MAP',		'RESOURCE_BANANA'),
		('WHOLE_MAP',		'RESOURCE_INCENSE'),
		('WHOLE_MAP',		'RESOURCE_IVORY'),
		('WHOLE_MAP',		'RESOURCE_SILK'),
		('WHOLE_MAP',		'RESOURCE_SPICES'),
		('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_LAPIS'),
		('WHOLE_MAP',		'RESOURCE_JADE'),
		('WHOLE_MAP',		'RESOURCE_COFFEE'),
		('WHOLE_MAP',		'RESOURCE_TEA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_WestAfricaRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_WestAfricaRegionExclude(Type, Resource);
INSERT INTO Resource_WestAfricaRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_MARBLE'),
		('WHOLE_MAP',		'RESOURCE_SPICES'),
		('WHOLE_MAP',		'RESOURCE_SILK'),
		('WHOLE_MAP',		'RESOURCE_FUR'),
		('WHOLE_MAP',		'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',		'RESOURCE_BISON'),
		('WHOLE_MAP',		'RESOURCE_COCOA'),
		('WHOLE_MAP',		'RESOURCE_SUGAR'),
		('WHOLE_MAP',		'RESOURCE_WINE'),
		('WHOLE_MAP',		'RESOURCE_CITRUS'),
		('WHOLE_MAP',		'RESOURCE_PERFUME'),
		('WHOLE_MAP',		'RESOURCE_TEA'),
		('WHOLE_MAP',		'RESOURCE_JADE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CaucasusRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CaucasusRegionExclude(Type, Resource);
INSERT INTO Resource_CaucasusRegionExclude
		(Type,					Resource)
VALUES	('WHOLE_MAP',			'RESOURCE_FUR'),
		('WHOLE_MAP',			'RESOURCE_SUGAR'),
		('WHOLE_MAP',			'RESOURCE_IVORY'),
		('WHOLE_MAP',			'RESOURCE_PEARLS'),
		('WHOLE_MAP',			'RESOURCE_MARBLE'),
		('WHOLE_MAP',			'RESOURCE_SPICES'),
		('WHOLE_MAP',			'RESOURCE_SUGAR'),
		('WHOLE_MAP',			'RESOURCE_COTTON'),
		('WHOLE_MAP',			'RESOURCE_WINE'),
		('WHOLE_MAP',			'RESOURCE_CITRUS'),
		('WHOLE_MAP',			'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',			'RESOURCE_COCOA'),
		('WHOLE_MAP',			'RESOURCE_BISON'),
		('WHOLE_MAP',			'RESOURCE_COFFEE'),
		('WHOLE_MAP',			'RESOURCE_TOBACCO'),
		('WHOLE_MAP',			'RESOURCE_PERFUME'),
		('WHOLE_MAP',			'RESOURCE_LAPIS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AsiaSteppeGiantGiantRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AsiaSteppeGiantGiantRegionExclude(Type, Resource);
INSERT INTO Resource_AsiaSteppeGiantGiantRegionExclude
		(Type,					Resource)
VALUES	('WHOLE_MAP',			'RESOURCE_SUGAR'),
		('WHOLE_MAP',			'RESOURCE_BANANA'),
		('WHOLE_MAP',			'RESOURCE_IVORY'),
		('WHOLE_MAP',			'RESOURCE_PEARLS'),
		('WHOLE_MAP',			'RESOURCE_MARBLE'),
		('WHOLE_MAP',			'RESOURCE_SPICES'),
		('WHOLE_MAP',			'RESOURCE_CITRUS'),
		('WHOLE_MAP',			'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',			'RESOURCE_COCOA'),
		('WHOLE_MAP',			'RESOURCE_BISON'),
		('WHOLE_MAP',			'RESOURCE_COFFEE'),
		('WHOLE_MAP',			'RESOURCE_PERFUME'),
		('WHOLE_MAP',			'RESOURCE_TOBACCO'),
		('WHOLE_MAP',			'RESOURCE_TEA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CentralAsiaRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CentralAsiaRegionExclude(Type, Resource);
INSERT INTO Resource_CentralAsiaRegionExclude
		(Type,					Resource)
VALUES	('WHOLE_MAP',			'RESOURCE_SUGAR'),
		('WHOLE_MAP',			'RESOURCE_BANANA'),
		('WHOLE_MAP',			'RESOURCE_IVORY'),
		('WHOLE_MAP',			'RESOURCE_MARBLE'),
		('WHOLE_MAP',			'RESOURCE_CITRUS'),
		('WHOLE_MAP',			'RESOURCE_WINE'),
		('WHOLE_MAP',			'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',			'RESOURCE_COCOA'),
		('WHOLE_MAP',			'RESOURCE_BISON'),
		('WHOLE_MAP',			'RESOURCE_OLIVE'),
		('WHOLE_MAP',			'RESOURCE_PERFUME');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EuroEasternRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EuroEasternRegionExclude(Type, Resource);
INSERT INTO Resource_EuroEasternRegionExclude
		(Type,					Resource)
VALUES	('WHOLE_MAP',			'RESOURCE_SUGAR'),
		('WHOLE_MAP',			'RESOURCE_BANANA'),
		('WHOLE_MAP',			'RESOURCE_IVORY'),
		('WHOLE_MAP',			'RESOURCE_PEARLS'),
		('WHOLE_MAP',			'RESOURCE_SPICES'),
		('WHOLE_MAP',			'RESOURCE_CITRUS'),
		('WHOLE_MAP',			'RESOURCE_INCENSE'),
		('WHOLE_MAP',			'RESOURCE_COCOA'),
		('WHOLE_MAP',			'RESOURCE_WINE'),
		('WHOLE_MAP',			'RESOURCE_SILK'),
		('WHOLE_MAP',			'RESOURCE_COTTON'),
		('WHOLE_MAP',			'RESOURCE_COFFEE'),
		('WHOLE_MAP',			'RESOURCE_TEA'),
		('WHOLE_MAP',			'RESOURCE_TOBACCO'),
		('WHOLE_MAP',			'RESOURCE_JADE'),
		('WHOLE_MAP',			'RESOURCE_OLIVE'),
		('WHOLE_MAP',			'RESOURCE_PERFUME'),
		('WHOLE_MAP',			'RESOURCE_LAPIS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthSeaEuropeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthSeaEuropeRegionExclude(Type, Resource);
INSERT INTO Resource_NorthSeaEuropeRegionExclude
		(Type,					Resource)
VALUES	('WHOLE_MAP',			'RESOURCE_SUGAR'),
		('WHOLE_MAP',			'RESOURCE_BANANA'),
		('WHOLE_MAP',			'RESOURCE_IVORY'),
		('WHOLE_MAP',			'RESOURCE_PEARLS'),
		('WHOLE_MAP',			'RESOURCE_MARBLE'),
		('WHOLE_MAP',			'RESOURCE_SPICES'),
		('WHOLE_MAP',			'RESOURCE_CITRUS'),
		('WHOLE_MAP',			'RESOURCE_COCOA'),
		('WHOLE_MAP',			'RESOURCE_INCENSE'),
		('WHOLE_MAP',			'RESOURCE_COTTON'),
		('WHOLE_MAP',			'RESOURCE_COFFEE'),
		('WHOLE_MAP',			'RESOURCE_TEA'),
		('WHOLE_MAP',			'RESOURCE_TOBACCO'),
		('WHOLE_MAP',			'RESOURCE_JADE'),
		('WHOLE_MAP',			'RESOURCE_OLIVE'),
		('WHOLE_MAP',			'RESOURCE_PERFUME'),
		('WHOLE_MAP',			'RESOURCE_LAPIS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfriAsiaAustRegionExclude
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfriAsiaAustRegionExclude(Type, Resource);
INSERT INTO Resource_AfriAsiaAustRegionExclude
		(Type,				Resource)
VALUES	('AFRICA',			'RESOURCE_PEARLS'),
		('AFRICA',			'RESOURCE_MARBLE'),
		('AFRICA',			'RESOURCE_SILK'),
		('AFRICA',			'RESOURCE_SUGAR'),
		('AFRICA',			'RESOURCE_WINE'),
		('AFRICA',			'RESOURCE_INCENSE'),
		('AFRICA',			'RESOURCE_FUR'),
		('AFRICA',			'RESOURCE_CITRUS'),
		('AFRICA',			'RESOURCE_TRUFFLES'),
		('AFRICA',			'RESOURCE_BISON'),
		('AFRICA',			'RESOURCE_PERFUME'),
		('AFRICA',			'RESOURCE_JADE'),
		('AFRICA',			'RESOURCE_TEA'),
		('EUROPE',			'RESOURCE_IVORY'),
		('EUROPE',			'RESOURCE_PEARLS'),
		('EUROPE',			'RESOURCE_SPICES'),
		('EUROPE',			'RESOURCE_SILK'),
		('EUROPE',			'RESOURCE_INCENSE'),
		('EUROPE',			'RESOURCE_FUR'),
		('EUROPE',			'RESOURCE_BISON'),
		('EUROPE',			'RESOURCE_COCOA'),
		('EUROPE',			'RESOURCE_COFFEE'),
		('EUROPE',			'RESOURCE_TEA'),
		('EUROPE',			'RESOURCE_TOBACCO'),
		('EUROPE',			'RESOURCE_JADE'),
		('EUROPE',			'RESOURCE_LAPIS'),
		('CENTRAL_ASIA',	'RESOURCE_IVORY'),
		('CENTRAL_ASIA',	'RESOURCE_MARBLE'),
		('CENTRAL_ASIA',	'RESOURCE_SPICES'),
		('CENTRAL_ASIA',	'RESOURCE_SUGAR'),
		('CENTRAL_ASIA',	'RESOURCE_WINE'),
		('CENTRAL_ASIA',	'RESOURCE_FUR'),
		('CENTRAL_ASIA',	'RESOURCE_CITRUS'),
		('CENTRAL_ASIA',	'RESOURCE_TRUFFLES'),
		('CENTRAL_ASIA',	'RESOURCE_BISON'),
		('CENTRAL_ASIA',	'RESOURCE_COCOA'),
		('CENTRAL_ASIA',	'RESOURCE_COFFEE'),
		('CENTRAL_ASIA',	'RESOURCE_PERFUME'),
		('CENTRAL_ASIA',	'RESOURCE_LAPIS'),
		('EAST_ASIA',		'RESOURCE_WINE'),
		('EAST_ASIA',		'RESOURCE_INCENSE'),
		('EAST_ASIA',		'RESOURCE_FUR'),
		('EAST_ASIA',		'RESOURCE_TRUFFLES'),
		('EAST_ASIA',		'RESOURCE_BISON'),
		('EAST_ASIA',		'RESOURCE_COCOA'),
		('EAST_ASIA',		'RESOURCE_TOBACCO'),
		('EAST_ASIA',		'RESOURCE_SUGAR'),
		('EAST_ASIA',		'RESOURCE_OLIVE'),
		('EAST_ASIA',		'RESOURCE_LAPIS'),
		('EAST_ASIA',		'RESOURCE_COFFEE'),
		('AUSTRALIA',		'RESOURCE_HORSE'),
		('AUSTRALIA',		'RESOURCE_IVORY'),
		('AUSTRALIA',		'RESOURCE_MARBLE'),
		('AUSTRALIA',		'RESOURCE_SPICES'),
		('AUSTRALIA',		'RESOURCE_SILK'),
		('AUSTRALIA',		'RESOURCE_SUGAR'),
		('AUSTRALIA',		'RESOURCE_INCENSE'),
		('AUSTRALIA',		'RESOURCE_BISON'),
		('AUSTRALIA',		'RESOURCE_COCOA'),
		('AUSTRALIA',		'RESOURCE_COFFEE'),
		('AUSTRALIA',		'RESOURCE_JADE'),
		('AUSTRALIA',		'RESOURCE_OLIVE'),
		('AUSTRALIA',		'RESOURCE_PERFUME'),
		('AUSTRALIA',		'RESOURCE_LAPIS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfriSouthEuroRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfriSouthEuroRegionExclude(Type, Resource);
INSERT INTO Resource_AfriSouthEuroRegionExclude
		(Type,					Resource)
VALUES	('WHOLE_MAP',			'RESOURCE_BISON'),
		('WHOLE_MAP',			'RESOURCE_JADE'),
		('WHOLE_MAP',			'RESOURCE_FUR'),
		('WHOLE_MAP',			'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',			'RESOURCE_SILK'),
		('NORTH_AFRICA',		'RESOURCE_COW'),
		('NORTH_AFRICA',		'RESOURCE_CATTLE'),
		('NORTH_AFRICA',		'RESOURCE_MARBLE'),
		('NORTH_AFRICA',		'RESOURCE_COCOA'),
		('NORTH_AFRICA',		'RESOURCE_SUGAR'),
		('NORTH_AFRICA',		'RESOURCE_TOBACCO'),
		('NORTH_AFRICA',		'RESOURCE_BANANA'),
		('NORTH_AFRICA',		'RESOURCE_GEMS'),
		('NORTH_AFRICA',		'RESOURCE_TEA'),
		('NORTH_AFRICA',		'RESOURCE_COFFEE'),
		('WEST_AFRICA',			'RESOURCE_WHEAT'),
		('WEST_AFRICA',			'RESOURCE_PEARLS'),
		('WEST_AFRICA',			'RESOURCE_SPICES'),
		('WEST_AFRICA',			'RESOURCE_INCENSE'),
		('WEST_AFRICA',			'RESOURCE_WINE'),
		('WEST_AFRICA',			'RESOURCE_SILVER'),
		('WEST_AFRICA',			'RESOURCE_CITRUS'),
		('WEST_AFRICA',			'RESOURCE_TOBACCO'),
		('WEST_AFRICA',			'RESOURCE_TEA'),
		('WEST_AFRICA',			'RESOURCE_MARBLE'),
		('EAST_AFRICA',			'RESOURCE_COPPER'),
		('EAST_AFRICA',			'RESOURCE_SILVER'),
		('EAST_AFRICA',			'RESOURCE_MARBLE'),
		('EAST_AFRICA',			'RESOURCE_CITRUS'),
		('EAST_AFRICA',			'RESOURCE_COCOA'),
		('EAST_AFRICA',			'RESOURCE_TOBACCO'),
		('EAST_AFRICA',			'RESOURCE_TEA'),
		('SOUTH_AFRICA',		'RESOURCE_TOBACCO'),
		('SOUTH_AFRICA',		'RESOURCE_SPICES'),
		('SOUTH_AFRICA',		'RESOURCE_INCENSE'),
		('SOUTH_AFRICA',		'RESOURCE_MARBLE'),
		('SOUTH_AFRICA',		'RESOURCE_COCOA'),
		('SOUTH_AFRICA',		'RESOURCE_TEA'),
		('EUROPE',				'RESOURCE_COCOA'),
		('EUROPE',				'RESOURCE_COFFEE'),
		('EUROPE',				'RESOURCE_SUGAR'),
		('EUROPE',				'RESOURCE_TEA'),
		('EUROPE',				'RESOURCE_COTTON'),
		('EUROPE',				'RESOURCE_BANANA'),
		('EUROPE',				'RESOURCE_BISON'),
		('ANATOLIA',			'RESOURCE_COCOA'),
		('ANATOLIA',			'RESOURCE_COFFEE'),
		('ANATOLIA',			'RESOURCE_WINE'),
		('ANATOLIA',			'RESOURCE_BANANA'),
		('ANATOLIA',			'RESOURCE_BISON'),
		('ANATOLIA',			'RESOURCE_BISON'),
		('ANATOLIA',			'RESOURCE_BISON'),
		('MIDDLE_EAST',			'RESOURCE_COCOA'),
		('MIDDLE_EAST',			'RESOURCE_COFFEE'),
		('MIDDLE_EAST',			'RESOURCE_TOBACCO'),
		('MIDDLE_EAST',			'RESOURCE_WINE'),
		('MIDDLE_EAST',			'RESOURCE_BANANA'),
		('MIDDLE_EAST',			'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfricaGiantRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfricaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_AfricaGiantRegionExclude
		(Type,				Resource)
VALUES	('WHOLE_MAP',		'RESOURCE_FUR'),
		('WHOLE_MAP',		'RESOURCE_BISON'),			
		('WHOLE_MAP',		'RESOURCE_JADE'),			
		('WEST_AFRICA',		'RESOURCE_WHEAT'),
		('WEST_AFRICA',		'RESOURCE_SPICES'),
		('WEST_AFRICA',		'RESOURCE_SILK'),			
		('WEST_AFRICA',		'RESOURCE_INCENSE'),
		('WEST_AFRICA',		'RESOURCE_WINE'),
		('WEST_AFRICA',		'RESOURCE_SILVER'),
		('WEST_AFRICA',		'RESOURCE_PEARLS'),
		('WEST_AFRICA',		'RESOURCE_CITRUS'),
		('WEST_AFRICA',		'RESOURCE_TRUFFLES'),	
		('WEST_AFRICA',		'RESOURCE_TOBACCO'),	
		('SOUTHEN_AFRICA',	'RESOURCE_TOBACCO'),
		('SOUTHEN_AFRICA',	'RESOURCE_SPICES'),
		('SOUTHEN_AFRICA',	'RESOURCE_SILK'),			
		('SOUTHEN_AFRICA',	'RESOURCE_INCENSE'),
		('SOUTHEN_AFRICA',	'RESOURCE_MARBLE'),
		('SOUTHEN_AFRICA',	'RESOURCE_COCOA'),
		('CENTRAL_AFRICA',	'RESOURCE_WHEAT'),
		('CENTRAL_AFRICA',	'RESOURCE_SHEEP'),
		('CENTRAL_AFRICA',	'RESOURCE_SPICES'),			
		('CENTRAL_AFRICA',	'RESOURCE_SILK'),
		('CENTRAL_AFRICA',	'RESOURCE_INCENSE'),
		('CENTRAL_AFRICA',	'RESOURCE_WINE'),
		('CENTRAL_AFRICA',	'RESOURCE_SILVER'),
		('CENTRAL_AFRICA',	'RESOURCE_MARBLE'),
		('CENTRAL_AFRICA',	'RESOURCE_PEARLS'),
		('CENTRAL_AFRICA',	'RESOURCE_TOBACCO'),
		('CENTRAL_AFRICA',	'RESOURCE_CITRUS'),
		('EAST_AFRICA',		'RESOURCE_SILK'),
		('EAST_AFRICA',		'RESOURCE_COPPER'),
		('EAST_AFRICA',		'RESOURCE_SILVER'),
		('EAST_AFRICA',		'RESOURCE_MARBLE'),
		('EAST_AFRICA',		'RESOURCE_CITRUS'),
		('EAST_AFRICA',		'RESOURCE_COCOA'),
		('EAST_AFRICA',		'RESOURCE_TRUFFLES'),
		('EAST_AFRICA',		'RESOURCE_GEMS'),			
		('EAST_AFRICA',		'RESOURCE_TOBACCO'),			
		('NORTH_AFRICA',	'RESOURCE_TOBACCO'),
		('NORTH_AFRICA',	'RESOURCE_BANANA'),
		('NORTH_AFRICA',	'RESOURCE_CATTLE'),
		('NORTH_AFRICA',	'RESOURCE_SUGAR'),
		('NORTH_AFRICA',	'RESOURCE_COCOA'),
		('NORTH_AFRICA',	'RESOURCE_TRUFFLES'),
		('NORTH_AFRICA',	'RESOURCE_GEMS'),
		('MIDDLE_EAST',		'RESOURCE_COCOA'),
		('MIDDLE_EAST',		'RESOURCE_COFFEE'),
		('MIDDLE_EAST',		'RESOURCE_TOBACCO'),
		('MIDDLE_EAST',		'RESOURCE_WINE'),
		('MIDDLE_EAST',		'RESOURCE_BANANA'),
		('MIDDLE_EAST',		'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaGiantRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_SouthAmericaGiantRegionExclude
		(Type,							Resource)
VALUES	('WHOLE_MAP',					'RESOURCE_IVORY'),
		('WHOLE_MAP',					'RESOURCE_MARBLE'),
		('WHOLE_MAP',					'RESOURCE_INCENSE'),
		('WHOLE_MAP',					'RESOURCE_JADE'),
		('WHOLE_MAP',					'RESOURCE_SILK'),
		('WHOLE_MAP',					'RESOURCE_BISON'),
		('WHOLE_MAP',					'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',					'RESOURCE_FUR'),
		('WHOLE_MAP',					'RESOURCE_COFFEE'),
		('WHOLE_MAP',					'RESOURCE_SPICES'),
		('WHOLE_MAP',					'RESOURCE_OLIVE'),
		--('WHOLE_MAP',					'RESOURCE_HORSE'), -- not excluded as several SA custom civs needs horses for their UU
		('WHOLE_MAP',					'RESOURCE_COW'),
		('WHOLE_MAP',					'RESOURCE_SHEEP'),
		('SOUTH_AMERICA_WEST_SOUTHERN',	'RESOURCE_SUGAR'),
		('SOUTH_AMERICA_WEST_NORTHERN',	'RESOURCE_SUGAR'),
		('SOUTH_AMERICA_EAST_SOUTHERN',	'RESOURCE_COTTON'),
		('SOUTH_AMERICA_EAST_SOUTHERN',	'RESOURCE_WINE'),
		('SOUTH_AMERICA_EAST_NORTHERN',	'RESOURCE_COTTON'),
		('SOUTH_AMERICA_EAST_NORTHERN',	'RESOURCE_WINE'),
		('SOUTH_AMERICA_ANTARCTIC',		'RESOURCE_COCOA'),
		('SOUTH_AMERICA_ANTARCTIC',		'RESOURCE_CITRUS'),
		('SOUTH_AMERICA_ANTARCTIC',		'RESOURCE_WINE'),
		('SOUTH_AMERICA_ANTARCTIC',		'RESOURCE_COTTON'),
		('SOUTH_AMERICA_ANTARCTIC',		'RESOURCE_PEARLS'),
		('SOUTH_AMERICA_ANTARCTIC',		'RESOURCE_TOBACCO');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AustralasiaGiantRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AustralasiaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_AustralasiaGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('AUSTRALIA',				'RESOURCE_HORSE'),
		('AUSTRALIA',				'RESOURCE_SPICES'),
		('AUSTRALIA',				'RESOURCE_SILK'),
		('AUSTRALIA',				'RESOURCE_SUGAR'),
		('AUSTRALIA',				'RESOURCE_INCENSE'),
		('AUSTRALIA',				'RESOURCE_COCOA'),
		('AUSTRALIA',				'RESOURCE_COFFEE'),
		('AUSTRALIA',				'RESOURCE_JADE'),
		('AUSTRALIA',				'RESOURCE_PERFUME'),
		('AUSTRALIA',				'RESOURCE_LAPIS');	
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IndianOceanRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IndianOceanRegionExclude(Type, Resource);
INSERT INTO Resource_IndianOceanRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('AUSTRALIA',				'RESOURCE_HORSE'),
		('AUSTRALIA',				'RESOURCE_SPICES'),
		('AUSTRALIA',				'RESOURCE_SILK'),
		('AUSTRALIA',				'RESOURCE_SUGAR'),
		('AUSTRALIA',				'RESOURCE_INCENSE'),
		('AUSTRALIA',				'RESOURCE_COCOA'),
		('AUSTRALIA',				'RESOURCE_COFFEE'),
		('AUSTRALIA',				'RESOURCE_JADE'),
		('AUSTRALIA',				'RESOURCE_PERFUME'),
		('AUSTRALIA',				'RESOURCE_LAPIS'),
		('SOUTHEAST_ASIA',			'RESOURCE_OLIVE'),
		('SOUTHEAST_ASIA',			'RESOURCE_IVORY'),
		('SOUTHEAST_ASIA',			'RESOURCE_IVORY'),
		('SOUTHEAST_ASIA',			'RESOURCE_SPICES'),
		('SOUTHEAST_ASIA',			'RESOURCE_SUGAR'),
		('SOUTHEAST_ASIA',			'RESOURCE_INCENSE'),
		('SOUTHEAST_ASIA',			'RESOURCE_BISON'),
		('SOUTHEAST_ASIA',			'RESOURCE_FUR'),
		('AFRICA',					'RESOURCE_PEARLS'),
		('AFRICA',					'RESOURCE_MARBLE'),
		('AFRICA',					'RESOURCE_SILK'),
		('AFRICA',					'RESOURCE_SUGAR'),
		('AFRICA',					'RESOURCE_WINE'),
		('AFRICA',					'RESOURCE_INCENSE'),
		('AFRICA',					'RESOURCE_FUR'),
		('AFRICA',					'RESOURCE_CITRUS'),
		('AFRICA',					'RESOURCE_TRUFFLES'),
		('AFRICA',					'RESOURCE_BISON'),
		('AFRICA',					'RESOURCE_PERFUME'),
		('AFRICA',					'RESOURCE_JADE'),
		('AFRICA',					'RESOURCE_TEA'),
		('INDIA',					'RESOURCE_WINE'),
		('INDIA',					'RESOURCE_INCENSE'),
		('INDIA',					'RESOURCE_FUR'),
		('INDIA',					'RESOURCE_TRUFFLES'),
		('INDIA',					'RESOURCE_BISON'),
		('INDIA',					'RESOURCE_COCOA'),
		('INDIA',					'RESOURCE_TOBACCO'),
		('INDIA',					'RESOURCE_OLIVE'),
		('MIDDLE_EAST',				'RESOURCE_COCOA'),
		('MIDDLE_EAST',				'RESOURCE_COFFEE'),
		('MIDDLE_EAST',				'RESOURCE_TOBACCO'),
		('MIDDLE_EAST',				'RESOURCE_WINE'),
		('MIDDLE_EAST',				'RESOURCE_BANANA'),
		('MIDDLE_EAST',				'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AmericasGiantRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AmericasGiantRegionExclude(Type, Resource);
INSERT INTO Resource_AmericasGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		--('WHOLE_MAP',				'RESOURCE_HORSE'), -- not excluded as several SA custom civs needs horses for their UU
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('ANTARCTIC_AMERICA',		'RESOURCE_PEARLS'),
		('ANTARCTIC_AMERICA',		'RESOURCE_COTTON'),
		('ANTARCTIC_AMERICA',		'RESOURCE_CITRUS'),
		('ANTARCTIC_AMERICA',		'RESOURCE_COCOA'),
		('ANTARCTIC_AMERICA',		'RESOURCE_SUGAR'),
		('ANTARCTIC_AMERICA',		'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_SUGAR'),
		('NORTH_AMERICA',			'RESOURCE_COCOA'),
		('NORTH_AMERICA',			'RESOURCE_CITRUS'),
		('CENTRAL_AMERICA',			'RESOURCE_FUR'),
		('CENTRAL_AMERICA',			'RESOURCE_TRUFFLES'),
		('CENTRAL_AMERICA',			'RESOURCE_BISON'),
		('CENTRAL_AMERICA',			'RESOURCE_COTTON'),
		('HAWAII',					'RESOURCE_FUR'),
		('HAWAII',					'RESOURCE_TRUFFLES'),
		('SOUTH_AMERICA',			'RESOURCE_FUR'),
		('SOUTH_AMERICA',			'RESOURCE_TRUFFLES'),
		('SOUTH_AMERICA',			'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IndiaGiantRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IndiaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_IndiaGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_SUGAR'),
		('WHOLE_MAP',				'RESOURCE_BANANA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaCentralHugeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaCentralHugeRegionExclude(Type, Resource);
INSERT INTO Resource_SouthAmericaCentralHugeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		--('WHOLE_MAP',				'RESOURCE_HORSE'), -- not excluded as several SA custom civs needs horses for their UU
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('WHOLE_MAP',				'RESOURCE_COTTON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaCentralGiantRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaCentralGiantRegionExclude(Type, Resource);
INSERT INTO Resource_SouthAmericaCentralGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		--('WHOLE_MAP',				'RESOURCE_HORSE'), -- not excluded as several SA custom civs needs horses for their UU
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('WHOLE_MAP',				'RESOURCE_COTTON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_ScotlandIrelandHugeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_ScotlandIrelandHugeRegionExclude(Type, Resource);
INSERT INTO Resource_ScotlandIrelandHugeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_CITRUS'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_SUGAR'),
		('WHOLE_MAP',				'RESOURCE_COTTON'),
		('WHOLE_MAP',				'RESOURCE_BANANA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAmericaLargeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAmericaLargeRegionExclude(Type, Resource);
INSERT INTO Resource_SouthAmericaLargeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		--('WHOLE_MAP',				'RESOURCE_HORSE'), -- not excluded as several SA custom civs needs horses for their UU
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('WHOLE_MAP',				'RESOURCE_COTTON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthAsiaHugeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthAsiaHugeRegionExclude(Type, Resource);
INSERT INTO Resource_SouthAsiaHugeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthPacificGiantRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthPacificGiantRegionExclude(Type, Resource);
INSERT INTO Resource_SouthPacificGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_HORSE'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_LAPIS'),
		('WHOLE_MAP',				'RESOURCE_FUR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAmericaGiantRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAmericaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_NorthAmericaGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('ANTARCTIC_AMERICA',		'RESOURCE_PEARLS'),
		('ANTARCTIC_AMERICA',		'RESOURCE_COTTON'),
		('ANTARCTIC_AMERICA',		'RESOURCE_CITRUS'),
		('ANTARCTIC_AMERICA',		'RESOURCE_COCOA'),
		('ANTARCTIC_AMERICA',		'RESOURCE_SUGAR'),
		('ANTARCTIC_AMERICA',		'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_SUGAR'),
		('NORTH_AMERICA',			'RESOURCE_COCOA'),
		('NORTH_AMERICA',			'RESOURCE_CITRUS'),
		('CENTRAL_AMERICA',			'RESOURCE_FUR'),
		('CENTRAL_AMERICA',			'RESOURCE_TRUFFLES'),
		('CENTRAL_AMERICA',			'RESOURCE_BISON'),
		('CENTRAL_AMERICA',			'RESOURCE_COTTON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAmericaHugeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAmericaHugeRegionExclude(Type, Resource);
INSERT INTO Resource_NorthAmericaHugeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('ANTARCTIC_AMERICA',		'RESOURCE_PEARLS'),
		('ANTARCTIC_AMERICA',		'RESOURCE_COTTON'),
		('ANTARCTIC_AMERICA',		'RESOURCE_CITRUS'),
		('ANTARCTIC_AMERICA',		'RESOURCE_COCOA'),
		('ANTARCTIC_AMERICA',		'RESOURCE_SUGAR'),
		('ANTARCTIC_AMERICA',		'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_SUGAR'),
		('NORTH_AMERICA',			'RESOURCE_COCOA'),
		('NORTH_AMERICA',			'RESOURCE_CITRUS'),
		('CENTRAL_AMERICA',			'RESOURCE_FUR'),
		('CENTRAL_AMERICA',			'RESOURCE_TRUFFLES'),
		('CENTRAL_AMERICA',			'RESOURCE_BISON'),
		('CENTRAL_AMERICA',			'RESOURCE_COTTON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AtlanticGiantRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AtlanticGiantRegionExclude(Type, Resource);
INSERT INTO Resource_AtlanticGiantRegionExclude
		(Type,						Resource)
VALUES	('AFRICA',					'RESOURCE_PEARLS'),
		('AFRICA',					'RESOURCE_MARBLE'),
		('AFRICA',					'RESOURCE_SILK'),
		('AFRICA',					'RESOURCE_SUGAR'),
		('AFRICA',					'RESOURCE_WINE'),
		('AFRICA',					'RESOURCE_INCENSE'),
		('AFRICA',					'RESOURCE_FUR'),
		('AFRICA',					'RESOURCE_CITRUS'),
		('AFRICA',					'RESOURCE_TRUFFLES'),
		('AFRICA',					'RESOURCE_BISON'),
		('AFRICA',					'RESOURCE_PERFUME'),
		('AFRICA',					'RESOURCE_JADE'),
		('AFRICA',					'RESOURCE_TEA'),
		('CENTRAL_AMERICA',			'RESOURCE_FUR'),
		('CENTRAL_AMERICA',			'RESOURCE_TRUFFLES'),
		('CENTRAL_AMERICA',			'RESOURCE_BISON'),
		('CENTRAL_AMERICA',			'RESOURCE_COTTON'),
		('EUROPE',					'RESOURCE_BISON'),
		('EUROPE',					'RESOURCE_FUR'),
		('EUROPE',					'RESOURCE_COCOA'),
		('EUROPE',					'RESOURCE_TOBACCO'),
		('EUROPE',					'RESOURCE_TEA'),
		('EUROPE',					'RESOURCE_SILK'),
		('EUROPE',					'RESOURCE_JADE'),
		('EUROPE',					'RESOURCE_COFFEE'),
		('EUROPE',					'RESOURCE_IVORY'),
		('EUROPE',					'RESOURCE_SPICES'),
		('EUROPE',					'RESOURCE_INCENSE'),
		('NORTH_AMERICA',			'RESOURCE_BANANA'),
		('NORTH_AMERICA',			'RESOURCE_SUGAR'),
		('NORTH_AMERICA',			'RESOURCE_COCOA'),
		('NORTH_AMERICA',			'RESOURCE_CITRUS'),
		('SOUTH_AMERICA',			'RESOURCE_FUR'),
		('SOUTH_AMERICA',			'RESOURCE_TRUFFLES'),
		('SOUTH_AMERICA',			'RESOURCE_BISON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AustraliaRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AustraliaRegionExclude(Type, Resource);
INSERT INTO Resource_AustraliaRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_HORSE'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_SUGAR'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_PERFUME'),
		('WHOLE_MAP',				'RESOURCE_LAPIS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CaribbeanHugeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CaribbeanHugeRegionExclude(Type, Resource);
INSERT INTO Resource_CaribbeanHugeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('WHOLE_MAP',				'RESOURCE_HORSE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_CITRUS'),
		('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_TEA'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_COFFEE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CentralAfricaLargeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CentralAfricaLargeRegionExclude(Type, Resource);
INSERT INTO Resource_CentralAfricaLargeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_WHEAT'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),			
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_SILVER'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_PEARLS'),
		('WHOLE_MAP',				'RESOURCE_TOBACCO'),
		('WHOLE_MAP',				'RESOURCE_CITRUS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_DenmarkRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_DenmarkRegionExclude(Type, Resource);
INSERT INTO Resource_DenmarkRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_TOBACCO'),
		('WHOLE_MAP',				'RESOURCE_TEA'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_INCENSE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EarthMk3RegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EarthMk3RegionExclude(Type, Resource);
INSERT INTO Resource_EarthMk3RegionExclude
		(Type,						Resource)
VALUES	('NORTH_AMERICA',			'RESOURCE_CITRUS'),
		('NORTH_AMERICA',			'RESOURCE_COW'),
		('NORTH_AMERICA',			'RESOURCE_SPICES'),
		('NORTH_AMERICA',			'RESOURCE_SHEEP'),
		('NORTH_AMERICA',			'RESOURCE_HORSE'),
		('NORTH_AMERICA',			'RESOURCE_SILK'),
		('NORTH_AMERICA',			'RESOURCE_IVORY'),
		('NORTH_AMERICA',			'RESOURCE_INCENSE'),
		('NORTH_AMERICA',			'RESOURCE_JADE'),
		('NORTH_AMERICA',			'RESOURCE_TEA'),
		('NORTH_AMERICA',			'RESOURCE_OLIVE'),
		('NORTH_AMERICA',			'RESOURCE_COFFEE'),
		('ARCTIC_AMERICA',			'RESOURCE_IVORY'),
		('ARCTIC_AMERICA',			'RESOURCE_HORSE'),
		('ARCTIC_AMERICA',			'RESOURCE_MARBLE'),
		('ARCTIC_AMERICA',			'RESOURCE_SPICES'),
		('ARCTIC_AMERICA',			'RESOURCE_SILK'),
		('ARCTIC_AMERICA',			'RESOURCE_COTTON'),
		('ARCTIC_AMERICA',			'RESOURCE_WINE'),
		('ARCTIC_AMERICA',			'RESOURCE_INCENSE'),
		('ARCTIC_AMERICA',			'RESOURCE_PEARLS'),
		('ARCTIC_AMERICA',			'RESOURCE_CITRUS'),
		('ARCTIC_AMERICA',			'RESOURCE_TRUFFLES'),
		('ARCTIC_AMERICA',			'RESOURCE_COCOA'),
		('CENTRAL_AMERICA',			'RESOURCE_FUR'),
		('CENTRAL_AMERICA',			'RESOURCE_TRUFFLES'),
		('CENTRAL_AMERICA',			'RESOURCE_BISON'),
		('CENTRAL_AMERICA',			'RESOURCE_COTTON'),
		('SOUTH_AMERICA_WEST',		'RESOURCE_SUGAR'),
		('SOUTH_AMERICA_EAST',		'RESOURCE_COTTON'),
		('SOUTH_AMERICA_EAST',		'RESOURCE_WINE'),
		('AUSTRALIA',				'RESOURCE_HORSE'),
		('AUSTRALIA',				'RESOURCE_IVORY'),
		('AUSTRALIA',				'RESOURCE_MARBLE'),
		('AUSTRALIA',				'RESOURCE_SPICES'),
		('AUSTRALIA',				'RESOURCE_SILK'),
		('AUSTRALIA',				'RESOURCE_SUGAR'),
		('AUSTRALIA',				'RESOURCE_INCENSE'),
		('AUSTRALIA',				'RESOURCE_BISON'),
		('AUSTRALIA',				'RESOURCE_COCOA'),
		('AUSTRALIA',				'RESOURCE_COFFEE'),
		('AUSTRALIA',				'RESOURCE_JADE'),
		('AUSTRALIA',				'RESOURCE_OLIVE'),
		('AUSTRALIA',				'RESOURCE_PERFUME'),
		('AUSTRALIA',				'RESOURCE_LAPIS'),
		('OCEANIA',					'RESOURCE_IVORY'),
		('OCEANIA',					'RESOURCE_HORSE'),
		('OCEANIA',					'RESOURCE_MARBLE'),
		('OCEANIA',					'RESOURCE_SPICES'),
		('OCEANIA',					'RESOURCE_SILK'),
		('OCEANIA',					'RESOURCE_COTTON'),
		('OCEANIA',					'RESOURCE_WINE'),
		('OCEANIA',					'RESOURCE_INCENSE'),
		('OCEANIA',					'RESOURCE_TRUFFLES'),
		('OCEANIA',					'RESOURCE_COCOA'),
		('SOUTH_ASIA',				'RESOURCE_WINE'),
		('SOUTH_ASIA',				'RESOURCE_INCENSE'),
		('SOUTH_ASIA',				'RESOURCE_FUR'),
		('SOUTH_ASIA',				'RESOURCE_TRUFFLES'),
		('SOUTH_ASIA',				'RESOURCE_BISON'),
		('CENTRAL_ASIA',			'RESOURCE_BISON'),
		('CENTRAL_ASIA',			'RESOURCE_IVORY'),
		('CENTRAL_ASIA',			'RESOURCE_MARBLE'),
		('CENTRAL_ASIA',			'RESOURCE_SUGAR'),
		('CENTRAL_ASIA',			'RESOURCE_WINE'),
		('CENTRAL_ASIA',			'RESOURCE_CITRUS'),
		('CENTRAL_ASIA',			'RESOURCE_TRUFFLES'),
		('CENTRAL_ASIA',			'RESOURCE_COCOA'),
		('NORTH_ASIA',				'RESOURCE_OLIVE'),
		('NORTH_ASIA',				'RESOURCE_IVORY'),
		('NORTH_ASIA',				'RESOURCE_PEARLS'),
		('NORTH_ASIA',				'RESOURCE_MARBLE'),
		('NORTH_ASIA',				'RESOURCE_SPICES'),
		('NORTH_ASIA',				'RESOURCE_SUGAR'),
		('NORTH_ASIA',				'RESOURCE_COTTON'),
		('NORTH_ASIA',				'RESOURCE_WINE'),
		('NORTH_ASIA',				'RESOURCE_CITRUS'),
		('NORTH_ASIA',				'RESOURCE_TRUFFLES'),
		('NORTH_ASIA',				'RESOURCE_COCOA'),
		('NORTH_ASIA',				'RESOURCE_TOBACCO'),
		('EAST_ASIA',				'RESOURCE_OLIVE'),
		('EAST_ASIA',				'RESOURCE_IVORY'),
		('EAST_ASIA',				'RESOURCE_IVORY'),
		('EAST_ASIA',				'RESOURCE_SPICES'),
		('EAST_ASIA',				'RESOURCE_SUGAR'),
		('EAST_ASIA',				'RESOURCE_INCENSE'),
		('EAST_ASIA',				'RESOURCE_BISON'),
		('EAST_ASIA',				'RESOURCE_FUR'),
		('TURKEY',					'RESOURCE_FUR'),
		('TURKEY',					'RESOURCE_SUGAR'),
		('TURKEY',					'RESOURCE_IVORY'),
		('TURKEY',					'RESOURCE_PEARLS'),
		('TURKEY',					'RESOURCE_MARBLE'),
		('TURKEY',					'RESOURCE_SPICES'),
		('TURKEY',					'RESOURCE_SUGAR'),
		('TURKEY',					'RESOURCE_COTTON'),
		('TURKEY',					'RESOURCE_WINE'),
		('TURKEY',					'RESOURCE_CITRUS'),
		('TURKEY',					'RESOURCE_TRUFFLES'),
		('TURKEY',					'RESOURCE_COCOA'),
		('TURKEY',					'RESOURCE_BISON'),
		('MEDITERRANEAN',			'RESOURCE_WINE'),
		('MEDITERRANEAN',			'RESOURCE_INCENSE'),
		('MEDITERRANEAN',			'RESOURCE_FUR'),
		('MEDITERRANEAN',			'RESOURCE_TRUFFLES'),
		('MEDITERRANEAN',			'RESOURCE_BISON'),
		('MEDITERRANEAN',			'RESOURCE_COCOA'),
		('MEDITERRANEAN',			'RESOURCE_IVORY'),
		('MEDITERRANEAN',			'RESOURCE_SUGAR'),
		('NORTH_AFRICA',			'RESOURCE_TOBACCO'),
		('NORTH_AFRICA',			'RESOURCE_BANANA'),
		('NORTH_AFRICA',			'RESOURCE_CATTLE'),
		('NORTH_AFRICA',			'RESOURCE_SUGAR'),
		('NORTH_AFRICA',			'RESOURCE_COCOA'),
		('NORTH_AFRICA',			'RESOURCE_TRUFFLES'),
		('NORTH_AFRICA',			'RESOURCE_GEMS'),
		('SOUTH_AFRICA',			'RESOURCE_TOBACCO'),
		('SOUTH_AFRICA',			'RESOURCE_SPICES'),
		('SOUTH_AFRICA',			'RESOURCE_SILK'),			
		('SOUTH_AFRICA',			'RESOURCE_INCENSE'),
		('SOUTH_AFRICA',			'RESOURCE_MARBLE'),
		('SOUTH_AFRICA',			'RESOURCE_COCOA'),
		('CENTRAL_AFRICA',			'RESOURCE_WHEAT'),
		('CENTRAL_AFRICA',			'RESOURCE_SHEEP'),
		('CENTRAL_AFRICA',			'RESOURCE_SPICES'),			
		('CENTRAL_AFRICA',			'RESOURCE_SILK'),
		('CENTRAL_AFRICA',			'RESOURCE_INCENSE'),
		('CENTRAL_AFRICA',			'RESOURCE_WINE'),
		('CENTRAL_AFRICA',			'RESOURCE_SILVER'),
		('CENTRAL_AFRICA',			'RESOURCE_MARBLE'),
		('CENTRAL_AFRICA',			'RESOURCE_PEARLS'),
		('CENTRAL_AFRICA',			'RESOURCE_TOBACCO'),
		('CENTRAL_AFRICA',			'RESOURCE_CITRUS'),
		('MIDDLE_EAST',				'RESOURCE_IVORY'),
		('MIDDLE_EAST',				'RESOURCE_COFFEE'),
		('MIDDLE_EAST',				'RESOURCE_COW'),
		('MIDDLE_EAST',				'RESOURCE_FUR'),
		('MIDDLE_EAST',				'RESOURCE_WINE'),
		('MIDDLE_EAST',				'RESOURCE_GEMS'),
		('MIDDLE_EAST',				'RESOURCE_WHALE'),
		('MIDDLE_EAST',				'RESOURCE_DYE'),
		('MIDDLE_EAST',				'RESOURCE_BISON'),
		('MIDDLE_EAST',				'RESOURCE_LAPIS'),			
		('WEST_EUROPA',				'RESOURCE_IVORY'),
		('WEST_EUROPA',				'RESOURCE_COFFEE'),
		('WEST_EUROPA',				'RESOURCE_BISON'),
		('WEST_EUROPA',				'RESOURCE_PEARLS'),
		('WEST_EUROPA',				'RESOURCE_SPICES'),
		('WEST_EUROPA',				'RESOURCE_SILK'),
		('WEST_EUROPA',				'RESOURCE_INCENSE'),
		('WEST_EUROPA',				'RESOURCE_FUR'),	
		('WEST_EUROPA',				'RESOURCE_TOBACCO'),
		('WEST_EUROPA',				'RESOURCE_TEA'),	
		('WEST_EUROPA',				'RESOURCE_LAPIS'),
		('NORTH_EUROPA',			'RESOURCE_IVORY'),
		('NORTH_EUROPA',			'RESOURCE_PERFUME'),
		('NORTH_EUROPA',			'RESOURCE_OLIVE'),
		('NORTH_EUROPA',			'RESOURCE_COFFEE'),
		('NORTH_EUROPA',			'RESOURCE_PEARLS'),
		('NORTH_EUROPA',			'RESOURCE_MARBLE'),
		('NORTH_EUROPA',			'RESOURCE_INCENSE'),
		('NORTH_EUROPA',			'RESOURCE_WINE'),
		('NORTH_EUROPA',			'RESOURCE_COTTON'),
		('NORTH_EUROPA',			'RESOURCE_SILK'),
		('NORTH_EUROPA',			'RESOURCE_SPICES'),
		('NORTH_EUROPA',			'RESOURCE_TOBACCO'),
		('NORTH_EUROPA',			'RESOURCE_TEA'),	
		('NORTH_EUROPA',			'RESOURCE_LAPIS'),
		('EAST_EUROPA',				'RESOURCE_COFFEE'),
		('EAST_EUROPA',				'RESOURCE_OLIVE'),			
		('EAST_EUROPA',				'RESOURCE_IVORY'),
		('EAST_EUROPA',				'RESOURCE_PEARLS'),
		('EAST_EUROPA',				'RESOURCE_SPICES'),
		('EAST_EUROPA',				'RESOURCE_SILK'),
		('EAST_EUROPA',				'RESOURCE_INCENSE'),
		('EAST_EUROPA',				'RESOURCE_PERFUME'),
		('EAST_EUROPA',				'RESOURCE_TEA'),
		('EAST_EUROPA',				'RESOURCE_LAPIS'),	
		('EAST_EUROPA',				'RESOURCE_TOBACCO');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_GermanyHugeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_GermanyHugeRegionExclude(Type, Resource);
INSERT INTO Resource_GermanyHugeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_TOBACCO'),
		('WHOLE_MAP',				'RESOURCE_TEA'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_INCENSE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IberiaRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IberiaRegionExclude(Type, Resource);
INSERT INTO Resource_IberiaRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_TOBACCO'),
		('WHOLE_MAP',				'RESOURCE_TEA'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_INCENSE');		
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IndiaRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IndiaRegionExclude(Type, Resource);
INSERT INTO Resource_IndiaRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_TOBACCO'),
		('WHOLE_MAP',				'RESOURCE_OLIVE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_IndonesiaRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_IndonesiaRegionExclude(Type, Resource);
INSERT INTO Resource_IndonesiaRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_SUGAR'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_FUR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_JapanHugeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_JapanHugeRegionExclude(Type, Resource);
INSERT INTO Resource_JapanHugeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_PEARLS'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_SUGAR'),
		('WHOLE_MAP',				'RESOURCE_COTTON'),
		('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_CITRUS'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_TOBACCO');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MediterraneanHugeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MediterraneanHugeRegionExclude(Type, Resource);
INSERT INTO Resource_MediterraneanHugeRegionExclude
		(Type,						Resource)
VALUES	('EUROPE',					'RESOURCE_BISON'),
		('EUROPE',					'RESOURCE_FUR'),
		('EUROPE',					'RESOURCE_COCOA'),
		('EUROPE',					'RESOURCE_TOBACCO'),
		('EUROPE',					'RESOURCE_TEA'),
		('EUROPE',					'RESOURCE_SILK'),
		('EUROPE',					'RESOURCE_JADE'),
		('EUROPE',					'RESOURCE_COFFEE'),
		('EUROPE',					'RESOURCE_IVORY'),
		('EUROPE',					'RESOURCE_SPICES'),
		('EUROPE',					'RESOURCE_INCENSE'),
		('AFRICA',					'RESOURCE_BISON'),
		('AFRICA',					'RESOURCE_FUR'),
		('AFRICA',					'RESOURCE_COCOA'),
		('AFRICA',					'RESOURCE_TOBACCO'),
		('AFRICA',					'RESOURCE_TEA'),
		('AFRICA',					'RESOURCE_SILK'),
		('AFRICA',					'RESOURCE_JADE'),
		('AFRICA',					'RESOURCE_COFFEE'),
		('AFRICA',					'RESOURCE_SPICES');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_OrientRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_OrientRegionExclude(Type, Resource);
INSERT INTO Resource_OrientRegionExclude
		(Type,						Resource)
VALUES	('INDIA',					'RESOURCE_WINE'),
		('INDIA',					'RESOURCE_INCENSE'),
		('INDIA',					'RESOURCE_FUR'),
		('INDIA',					'RESOURCE_TRUFFLES'),
		('INDIA',					'RESOURCE_BISON'),
		('INDIA',					'RESOURCE_COCOA'),
		('INDIA',					'RESOURCE_TOBACCO'),
		('INDIA',					'RESOURCE_OLIVE'),
		('MIDDLE_EAST',				'RESOURCE_IVORY'),
		('MIDDLE_EAST',				'RESOURCE_COFFEE'),
		('MIDDLE_EAST',				'RESOURCE_COW'),
		('MIDDLE_EAST',				'RESOURCE_FUR'),
		('MIDDLE_EAST',				'RESOURCE_WINE'),
		('MIDDLE_EAST',				'RESOURCE_GEMS'),
		('MIDDLE_EAST',				'RESOURCE_WHALE'),
		('MIDDLE_EAST',				'RESOURCE_DYE'),
		('MIDDLE_EAST',				'RESOURCE_BISON'),
		('MIDDLE_EAST',				'RESOURCE_LAPIS'),			
		('TURKEY',					'RESOURCE_FUR'),
		('TURKEY',					'RESOURCE_SUGAR'),
		('TURKEY',					'RESOURCE_IVORY'),
		('TURKEY',					'RESOURCE_PEARLS'),
		('TURKEY',					'RESOURCE_MARBLE'),
		('TURKEY',					'RESOURCE_SPICES'),
		('TURKEY',					'RESOURCE_SUGAR'),
		('TURKEY',					'RESOURCE_COTTON'),
		('TURKEY',					'RESOURCE_WINE'),
		('TURKEY',					'RESOURCE_CITRUS'),
		('TURKEY',					'RESOURCE_TRUFFLES'),
		('TURKEY',					'RESOURCE_COCOA'),
		('TURKEY',					'RESOURCE_BISON'),
		('EUROPE',					'RESOURCE_BISON'),
		('EUROPE',					'RESOURCE_FUR'),
		('EUROPE',					'RESOURCE_COCOA'),
		('EUROPE',					'RESOURCE_TOBACCO'),
		('EUROPE',					'RESOURCE_TEA'),
		('EUROPE',					'RESOURCE_SILK'),
		('EUROPE',					'RESOURCE_JADE'),
		('EUROPE',					'RESOURCE_COFFEE'),
		('EUROPE',					'RESOURCE_IVORY'),
		('EUROPE',					'RESOURCE_SPICES'),
		('EUROPE',					'RESOURCE_INCENSE'),
		('AFRICA',					'RESOURCE_BISON'),
		('AFRICA',					'RESOURCE_FUR'),
		('AFRICA',					'RESOURCE_COCOA'),
		('AFRICA',					'RESOURCE_TOBACCO'),
		('AFRICA',					'RESOURCE_TEA'),
		('AFRICA',					'RESOURCE_SILK'),
		('AFRICA',					'RESOURCE_JADE'),
		('AFRICA',					'RESOURCE_COFFEE'),
		('AFRICA',					'RESOURCE_SPICES');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NetherlandsRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NetherlandsRegionExclude(Type, Resource);
INSERT INTO Resource_NetherlandsRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_SUGAR'),
		('WHOLE_MAP',				'RESOURCE_BANANA'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_PEARLS'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_CITRUS'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_COTTON'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_TEA'),
		('WHOLE_MAP',				'RESOURCE_TOBACCO'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_PERFUME'),
		('WHOLE_MAP',				'RESOURCE_LAPIS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthSeaGiantRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthSeaGiantRegionExclude(Type, Resource);
INSERT INTO Resource_NorthSeaGiantRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_SUGAR'),
		('WHOLE_MAP',				'RESOURCE_BANANA'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_PEARLS'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_CITRUS'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_COTTON'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_TEA'),
		('WHOLE_MAP',				'RESOURCE_TOBACCO'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_PERFUME'),
		('WHOLE_MAP',				'RESOURCE_LAPIS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_RussiaLargeRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_RussiaLargeRegionExclude(Type, Resource);
INSERT INTO Resource_RussiaLargeRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_SUGAR'),
		('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_CITRUS'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_COFFEE'),
		('WHOLE_MAP',				'RESOURCE_PERFUME'),
		('WHOLE_MAP',				'RESOURCE_LAPIS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_PatagoniaRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_PatagoniaRegionExclude(Type, Resource);
INSERT INTO Resource_PatagoniaRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_COW'),
		('WHOLE_MAP',				'RESOURCE_SHEEP'),
		('WHOLE_MAP',				'RESOURCE_HORSE'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_JADE'),
		('WHOLE_MAP',				'RESOURCE_TEA'),
		('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_COFFEE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SeaOfJapanRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SeaOfJapanRegionExclude(Type, Resource);
INSERT INTO Resource_SeaOfJapanRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_PEARLS'),
		('WHOLE_MAP',				'RESOURCE_MARBLE'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_SUGAR'),
		('WHOLE_MAP',				'RESOURCE_COTTON'),
		('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_CITRUS'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_TOBACCO');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthernAfricaRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthernAfricaRegionExclude(Type, Resource);
INSERT INTO Resource_SouthernAfricaRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_BISON'),			
		('WHOLE_MAP',				'RESOURCE_JADE'),			
		('CENTRAL_AFRICA',			'RESOURCE_WHEAT'),
		('CENTRAL_AFRICA',			'RESOURCE_SHEEP'),
		('CENTRAL_AFRICA',			'RESOURCE_SPICES'),			
		('CENTRAL_AFRICA',			'RESOURCE_SILK'),
		('CENTRAL_AFRICA',			'RESOURCE_INCENSE'),
		('CENTRAL_AFRICA',			'RESOURCE_WINE'),
		('CENTRAL_AFRICA',			'RESOURCE_SILVER'),
		('CENTRAL_AFRICA',			'RESOURCE_MARBLE'),
		('CENTRAL_AFRICA',			'RESOURCE_PEARLS'),
		('CENTRAL_AFRICA',			'RESOURCE_TOBACCO'),
		('CENTRAL_AFRICA',			'RESOURCE_CITRUS'),
		('SOUTH_AFRICA',			'RESOURCE_TOBACCO'),
		('SOUTH_AFRICA',			'RESOURCE_SPICES'),
		('SOUTH_AFRICA',			'RESOURCE_INCENSE'),
		('SOUTH_AFRICA',			'RESOURCE_MARBLE'),
		('SOUTH_AFRICA',			'RESOURCE_COCOA'),
		('SOUTH_AFRICA',			'RESOURCE_TEA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_TexcocoRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_TexcocoRegionExclude(Type, Resource);
INSERT INTO Resource_TexcocoRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_FUR'),
		('WHOLE_MAP',				'RESOURCE_TRUFFLES'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_COTTON');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_VietnamRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_VietnamRegionExclude(Type, Resource);
INSERT INTO Resource_VietnamRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_OLIVE'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_SUGAR'),
		('WHOLE_MAP',				'RESOURCE_INCENSE'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_FUR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_WalesRegionExclude 
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_WalesRegionExclude(Type, Resource);
INSERT INTO Resource_WalesRegionExclude
		(Type,						Resource)
VALUES	('WHOLE_MAP',				'RESOURCE_BANANA'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_TOBACCO'),
		('WHOLE_MAP',				'RESOURCE_SILK'),
		('WHOLE_MAP',				'RESOURCE_COTTON'),
		('WHOLE_MAP',				'RESOURCE_TEA'),
		('WHOLE_MAP',				'RESOURCE_IVORY'),
		('WHOLE_MAP',				'RESOURCE_SPICES'),
		('WHOLE_MAP',				'RESOURCE_CITRUS'),
		('WHOLE_MAP',				'RESOURCE_WINE'),
		('WHOLE_MAP',				'RESOURCE_BISON'),
		('WHOLE_MAP',				'RESOURCE_COCOA'),
		('WHOLE_MAP',				'RESOURCE_SUGAR');
--==========================================================================================================================
--==========================================================================================================================
