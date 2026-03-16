INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_RESTAURANT',	'BUILDING_RESTAURANT',	'TXT_KEY_BUILDING_RESTAURANT');

INSERT INTO	 Buildings
	(Type,						Description,						Civilopedia,							Strategy,					Help,									GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 				ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_RESTAURANT',	'TXT_KEY_BUILDING_RESTAURANT', 	'TXT_KEY_BUILDING_RESTAURANT_TEXT',	'TXT_KEY_BUILDING_RESTAURANT_STRATEGY',	'TXT_KEY_BUILDING_RESTAURANT_HELP',	7, 				1800, -20, 					-1, 			80, 			'BUILDINGCLASS_RESTAURANT', 	'ART_DEF_BUILDING_MARKET', 	'TECH_BIOLOGY', 	25,				'CORP2_ATLAS');

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_RESTAURANT', 'YIELD_FOOD', 2),
	('BUILDING_RESTAURANT', 'YIELD_CULTURE', 1);

UPDATE Buildings
SET
	NoUnhappfromXSpecialists = 1
WHERE BuildingClass = 'BUILDINGCLASS_RESTAURANT';

--INSERT INTO Building_YieldFromYieldPercent
--	(BuildingType, YieldOut, YieldIn, Value)
--VALUES
--	('BUILDING_RESTAURANT', 'YIELD_CULTURE', 'YIELD_FOOD', 5);


INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_RESTAURANT', 'IMPROVEMENT_FARM', 'YIELD_CULTURE', 1),
	('BUILDING_RESTAURANT', 'IMPROVEMENT_PLANTATION', 'YIELD_CULTURE', 2);

INSERT INTO Building_InstantYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_RESTAURANT', 'YIELD_GOLD', 400);

INSERT INTO Building_BuildingClassLocalYieldChanges
    (BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_RESTAURANT', 'BUILDINGCLASS_HOTEL', 'YIELD_GOLD', 2),
	('BUILDING_RESTAURANT', 'BUILDINGCLASS_HOTEL', 'YIELD_TOURISM', 2),
	('BUILDING_RESTAURANT', 'BUILDINGCLASS_AGRIBUSINESS', 'YIELD_GOLD', 2),
	('BUILDING_RESTAURANT', 'BUILDINGCLASS_AGRIBUSINESS', 'YIELD_TOURISM', 2),
	('BUILDING_RESTAURANT', 'BUILDINGCLASS_MARINA', 'YIELD_GOLD', 2),
	('BUILDING_RESTAURANT', 'BUILDINGCLASS_MARINA', 'YIELD_TOURISM', 2);

DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_STADIUM';

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
VALUES
	('BUILDING_RESTAURANT', 'BUILDINGCLASS_THEATRE'),	
	('BUILDING_STADIUM', 'BUILDINGCLASS_RESTAURANT');

UPDATE Language_en_US
SET Text = Replace(Text, ' Requires a Zoo in the City.', '')
WHERE Tag = 'TXT_KEY_BUILDING_STADIUM_HELP';

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_RESTAURANT', 'FLAVOR_GOLD', 10),
	('BUILDING_RESTAURANT', 'FLAVOR_CULTURE', 5);

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_RESTAURANT',			'Restaurant'),
		('TXT_KEY_BUILDING_RESTAURANT_TEXT',		'The earliest modern-format "restaurants" to use that word in Paris were the establishments which served bouillon, a broth made of meat and egg which was said to restore health and vigour. The first restaurant of this kind was opened in 1765 or 1766 by Mathurin Roze de Chantoiseau on rue des Poulies, now part of the Rue de Louvre. Unlike earlier eating places, it was elegantly decorated, and besides meat broth offered a menu of several other "restorative" dishes, including macaroni. While not the first establishment where one could order food, or even soups, it is thought to be the first to offer a menu of available choices.[NEWLINE][NEWLINE]The restaurant of Hotel Ritz Paris, opened in 1898, was made famous by its chef of haute cuisine, Auguste Escoffier. In a time when kitchens were loud, riotous places where drinking on the job was commonplace, Escoffier demanded cleanliness, discipline, and silence from his staff. In bringing order to the kitchen, he tapped into his own military experience to develop the hierarchical brigade de cuisine system for organizing the kitchen staff which is still standard in many restaurants today. This elevated the profession to new heights of artistry and also profit.'),
		('TXT_KEY_BUILDING_RESTAURANT_STRATEGY',	'The Restaurant continues the building line that began with the Arena, and in addition to instant Gold when constructed, it increases the value of Food producing Farms, and also Plantations, allowing them to increase the Culture output of your City. With a focus on Food you can work more Specialists, and the Restaurant makes an additional Specialist Unhappiness-free. Additionally, you can alleviate the Gold Maintenance of the building by pairing it with a Hotel, Agribusiness, and Marina, and you''ll even receive Tourism for doing so!'),
		('TXT_KEY_BUILDING_RESTAURANT_HELP',		'');

-- +400 [ICON_GOLD] Gold when completed. +2 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism from Hotels, Agribusinesses, and Marina in this City.[NEWLINE][NEWLINE]Nearby Farm: +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby Plantation: +2 [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]1 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.