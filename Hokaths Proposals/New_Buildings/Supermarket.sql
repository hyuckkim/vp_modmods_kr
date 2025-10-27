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
		(Type,		Description,			Civilopedia,		Strategy,		Help,			
		GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 	FoodKept,				
		ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas, RequiresIndustrialCityConnection)
VALUES	
	('BUILDING_SUPERMARKET',	'TXT_KEY_BUILDING_SUPERMARKET', 	'TXT_KEY_BUILDING_SUPERMARKET_TEXT',	'TXT_KEY_BUILDING_SUPERMARKET_STRATEGY',	'TXT_KEY_BUILDING_SUPERMARKET_HELP',	
	8, 				2250, -20, 					-1, 			66, 			'BUILDINGCLASS_SUPERMARKET', 	10,
	'ART_DEF_BUILDING_MARKET', 	'TECH_REFRIGERATION', 	41,				'BW_ATLAS_1', 1);

UPDATE Buildings SET 
	NoUnhappfromXSpecialists = 1,
	CityConnectionGoldModifier = 50
WHERE Type = 'BUILDING_SUPERMARKET';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SUPERMARKET', 'YIELD_FOOD', 4);

INSERT INTO Building_YieldFromPurchase
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SUPERMARKET', 'YIELD_FOOD', 25);

INSERT INTO Building_YieldFromInternalTR
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SUPERMARKET', 'YIELD_FOOD', 10);

INSERT INTO	 Building_Flavors
		(BuildingType,			FlavorType,	Flavor)
SELECT	'BUILDING_SUPERMARKET',	FlavorType,	Flavor+10
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GROCER';

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_SUPERMARKET',	'BUILDINGCLASS_HOSPITAL');
------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_SUPERMARKET',			'Supermarket'),
		('TXT_KEY_BUILDING_SUPERMARKET_TEXT',		'Supermarkets are massive stores that contain a wide variety of food, drinks, and household goods that customers can pick off the shelves themselves. The first self-service Supermarket was opened in Memphis, Tennessee, in 1916, and the idea spread like wildfire throughout North America. The modern supermarket has revolutionized shopping for city-dwellers, drastically lowering the amount of labour and the cost of everyday necessities.'),
		('TXT_KEY_BUILDING_SUPERMARKET_STRATEGY',	'The Supermarket is an Atomic-era Building for growing large cities. Large Gold expenditure can be converted into increased population with ease, and the Yields produced from having a large City Connected to the Capital is further enhanced! Although your City must already be quite developed to build a Supermarket, the rewards are significant!'),
		('TXT_KEY_BUILDING_SUPERMARKET_HELP',		'10% of [ICON_FOOD] Food is carried over when a [ICON_CITIZEN] Citizen is born in this City. When you spend [ICON_INVEST] Gold to purchase Units or invest in Buildings in this City, 25% of the cost is converted into [ICON_FOOD] Food. +50% [ICON_GOLD] Gold and [ICON_PRODUCTION] Production from the local [ICON_INDUSTRIAL_CONNECTED] City Connection. Internal [ICON_INTERNATIONAL_TRADE] Trade Routes from this City generate +10 [ICON_FOOD] Food.[NEWLINE][NEWLINE]1 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.[NEWLINE][NEWLINE]Requires an [ICON_INDUSTRIAL_CONNECTED] Industrial City Connection before it can be constructed.');

