INSERT INTO BuildingClasses 	
	(Type,	DefaultBuilding,		Description)
VALUES		
	('BUILDINGCLASS_ELECTROLYSER',	'BUILDING_ELECTROLYSER',	'TXT_KEY_BUILDING_ELECTROLYSER');

INSERT INTO	 Buildings
		(Type,		Description,	Civilopedia,	Strategy,	Help,									
		GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	
		BuildingClass, 	ArtDefineTag, 		PrereqTech, 		PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_ELECTROLYSER',	'TXT_KEY_BUILDING_ELECTROLYSER', 	'TXT_KEY_BUILDING_ELECTROLYSER_TEXT',	'TXT_KEY_BUILDING_ELECTROLYSER_STRATEGY',	'TXT_KEY_BUILDING_ELECTROLYSER_HELP',	
	12, 				3200, -20, 					-1, 			80, 			
	'BUILDINGCLASS_ELECTROLYSER', 	'ART_DEF_BUILDING_MARKET', 	'TECH_NANOTECHNOLOGY', 	43,				'CORP2_ATLAS');

UPDATE Buildings SET
	SpecialistType = 'SPECIALIST_ENGINEER',
	GreatPeopleRateChange = 3,
	SpecialistCount = 1,
	AddsFreshWater = 1
WHERE BuildingClass = 'BUILDINGCLASS_ELECTROLYSER';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES	
	('BUILDING_ELECTROLYSER',  'YIELD_PRODUCTION',	5);

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
SELECT
	Type, SpecialistType, 67
FROM Buildings WHERE Type IN ('BUILDING_ELECTROLYSER');

INSERT INTO Building_YieldFromProcessModifier
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_ELECTROLYSER', 'YIELD_FOOD', 20);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_ELECTROLYSER',  'BUILDINGCLASS_WELL',      'YIELD_FOOD', 5),
	('BUILDING_ELECTROLYSER',  'BUILDINGCLASS_WATERMILL', 'YIELD_PRODUCTION', 5);

INSERT INTO Building_BuildingClassYieldModifiers
	(BuildingType, BuildingClassType, YieldType, Modifier)
VALUES
	('BUILDING_ELECTROLYSER',  'BUILDINGCLASS_RECYCLING_CENTER',      'YIELD_GOLD', 4);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 	BuildingClassType)
VALUES
	('BUILDING_ELECTROLYSER', 'BUILDINGCLASS_RECYCLING_CENTER');

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_ELECTROLYSER', 'FLAVOR_GROWTH', 80),
	('BUILDING_ELECTROLYSER', 'FLAVOR_GOLD', 30),
	('BUILDING_ELECTROLYSER', 'FLAVOR_PRODUCTION', 30);

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	
	('TXT_KEY_BUILDING_ELECTROLYSER',	 'Electrolyser'),
	('TXT_KEY_BUILDING_ELECTROLYSER_TEXT',		'Electrolysers are a core component in the production of hydrogen fuel from water and play an emerging role in water treatment. Through an exploratory process of advancement in nanotechnology, catalysts and membranes have been designed that are both efficient, durable, and affordable. Using electricity or solar energy, water splitting cells produce hydrogen gas, which is a clean energy carrier that can be stored and used in reverse-operation fuel cells to generate electricity (producing only water as a byproduct) or used as a feedstock in industrial processes (e.g., ammonia production).[NEWLINE][NEWLINE]High-purity water (often produced using reverse osmosis and deionization, which may employ nanofiltration systems) is required as an input for most commercial electrolysers to prevent damage to the delicate internal components. Nanostructured electrodes within electrochemical treatment systems can be designed to produce reactive oxygen species or have specific surface properties to selectively trap and degrade target pollutants in industrial wastewater or contaminated potable water sources. Integrated systems are being researched where treated wastewater is used as the feedstock for the electrolyser, creating a sustainable loop that produces hydrogen fuel while simultaneously treating the water.'),
	('TXT_KEY_BUILDING_ELECTROLYSER_STRATEGY', 'Electrolysers boost Engineers like other final-tier buildings boost Scientists or Merchants. However as you require a local Recycling Center, you are limited in how many you can construct. The benefits are large, giving yields across the Empire based on whether or not Cities are on Rivers. What is more, all Electrolyser Cities can produce their own Fresh Water, unlocking certain buildings that may have been locked to them, so you may find that some reorganiztion is required to best leverage your advanced technology. There is a final local benefit: an empowered Farming process, meaning an Electrolyser can be combined with other growth-boosting buildings that arrive in the late game to turbo boost your yield output.'),
	('TXT_KEY_BUILDING_ELECTROLYSER_HELP',  'The City is a source of [COLOR_POSITIVE_TEXT]Fresh Water[ENDCOLOR].');

-- The [COLOR_YELLOW]Farming[ENDCOLOR] Process is 20% more efficient at converting [ICON_PRODUCTION] Production into [ICON_FOOD] Food. +67% [ICON_GREAT_ENGINEER] Great Engineer Rate. All Recycling Centers in the Empire boost [ICON_GOLD] Gold output by 4%, all Wells produce +5 [ICON_FOOD] Food, and all Watermills +5 [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]


