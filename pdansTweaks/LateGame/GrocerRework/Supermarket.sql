--==================================================
--Change Grocer into Pharmacy
--==================================================
--------------------------------
-- Language_en_US
--------------------------------
UPDATE Language_en_US
SET Text = 'Pharmacy'
WHERE Tag = 'TXT_KEY_BUILDING_GROCER';

UPDATE Language_en_US
SET Text = 'The Grocer is a Renaissance-era building which can only be constructed if you have already built an Aqueduct in the City. The Grocer helps your City grow more quickly, combats Poverty, and improves the tile yield of Bananas.'
WHERE Tag = 'TXT_KEY_BUILDING_GROCER_STRATEGY';

UPDATE Language_en_US
SET Text = 'A Pharmacy, or Apothecary, is a type of shop that sells medicinal goods such as drugs, ointments, herbal remedies and dressings for wounds. Shops were maintained by specialists who could dispense advice for how to use the medicines they sold as well as other home remedies. Pharmacies in Medieval and Renaissance Europe were often family businesses, or operated out of local monasteries by nuns, which resulted in a large proportion of pharmacies being run by women.[NEWLINE][NEWLINE]The work of a pharmacist requires a great deal of knowledge and specialized education, which brought status and respectability to the job. The role of pharmacists and apothecaries formed the precursor to the modern disciplines of chemistry and pharmacology.'
WHERE Tag = 'TXT_KEY_CIV5_BUILDINGS_GROCER_TEXT';

UPDATE Buildings SET 
	PortraitIndex = 0, 
	IconAtlas = 'BUILDING_PHARMACY_ATLAS'
WHERE Type = 'BUILDING_GROCER';
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 					IconSize, 	Filename, 			IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_PHARMACY_ATLAS', 256, 		'Pharmacy256.dds',	1, 				1),
			('BUILDING_PHARMACY_ATLAS', 128, 		'Pharmacy128.dds',	1, 				1),
			('BUILDING_PHARMACY_ATLAS', 64, 		'Pharmacy064.dds',	1, 				1),
			('BUILDING_PHARMACY_ATLAS', 45, 		'Pharmacy045.dds',	1, 				1);

--==================================================
--Add new Late Game Supermarket Building
--==================================================
------------------------------
-- Supermarket Building
------------------------------
INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_SUPERMARKET',	'BUILDING_SUPERMARKET',	'TXT_KEY_BUILDING_SUPERMARKET');

INSERT INTO	Buildings
		(Type,						Description,						Civilopedia,							Strategy,									Help,									GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 					ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas)
VALUES	('BUILDING_SUPERMARKET',	'TXT_KEY_BUILDING_SUPERMARKET', 	'TXT_KEY_BUILDING_SUPERMARKET_TEXT',	'TXT_KEY_BUILDING_SUPERMARKET_STRATEGY',	'TXT_KEY_BUILDING_SUPERMARKET_HELP',	10, 				2250, -20, 					-1, 			66, 			'BUILDINGCLASS_SUPERMARKET', 	'ART_DEF_BUILDING_MARKET', 	'TECH_REFRIGERATION', 	41,				'BW_ATLAS_1');

UPDATE Buildings SET 
	NoUnhappfromXSpecialists = 2,
	CityConnectionGoldModifier = 200
WHERE Type = 'BUILDING_SUPERMARKET';

INSERT INTO	Building_Flavors
		(BuildingType,			FlavorType,	Flavor)
SELECT	'BUILDING_SUPERMARKET',	FlavorType,	Flavor+10
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GROCER';

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_SUPERMARKET',	'BUILDINGCLASS_HOSPITAL');
------------------------------
-- Dummy Building
------------------------------
INSERT INTO BuildingClasses 	
			(Type,								DefaultBuilding,				NoLimit)
VALUES		('BUILDINGCLASS_D_FOR_SUPERMARKET',	'BUILDING_D_FOR_SUPERMARKET',	1);

INSERT INTO Buildings 	
			(Type,							BuildingClass,						Description,							CapitalOnly, 	GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex, 	IsDummy)
VALUES		('BUILDING_D_FOR_SUPERMARKET',	'BUILDINGCLASS_D_FOR_SUPERMARKET',	'TXT_KEY_BUILDING_D_FOR_SUPERMARKET',	1, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1);

INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType,					BuildingClassType,				YieldType,		YieldChange)
VALUES		('BUILDING_D_FOR_SUPERMARKET',	'BUILDINGCLASS_SUPERMARKET',	'YIELD_FOOD',	1);
------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_D_FOR_SUPERMARKET',		'Supermarket Dummy'),
		('TXT_KEY_BUILDING_SUPERMARKET',			'Supermarket'),
		('TXT_KEY_BUILDING_SUPERMARKET_TEXT',		'Supermarkets are massive stores that contain a wide variety of food, drinks, and household goods that customers can pick off the shelves themselves. The first self-service Supermarket was opened in Memphis, Tennessee, in 1916, and the idea spread like wildfire throughout North America. The modern supermarket has revolutionized shopping for city-dwellers, drastically lowering the amount of labour and the cost of everyday necessities.'),
		('TXT_KEY_BUILDING_SUPERMARKET_STRATEGY',	'The Supermarket is the ultimate building for growing large cities. All Farms and Pastures in your empire provide food to all Supermarkets in your empire, no matter where they are or if they are being worked. Clear forests and exploit as much land as possible to maximize the power of your Supermarkets.'),
		('TXT_KEY_BUILDING_SUPERMARKET_HELP',		'+1 [ICON_FOOD] Food for each [COLOR_POSITIVE_TEXT]Farm[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Pasture[ENDCOLOR] on Empire. The amount of [ICON_GOLD] Gold from [ICON_CONNECTED] City Connections is tripled.[NEWLINE][NEWLINE]2 Specialists in this City no longer produce [ICON_HAPPINESS_3] Unhappiness from Urbanization. Requires a Hospital in the City.');
