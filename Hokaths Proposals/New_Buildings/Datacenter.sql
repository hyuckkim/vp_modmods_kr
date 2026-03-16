INSERT INTO BuildingClasses 	
	(Type,	DefaultBuilding,		Description)
VALUES		
	('BUILDINGCLASS_DATACENTER',	'BUILDING_DATACENTER',	'TXT_KEY_BUILDING_DATACENTER');

INSERT INTO	 Buildings
		(Type,		Description,	Civilopedia,	Strategy,	Help,									
		GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	
		BuildingClass, 	ArtDefineTag, 		PrereqTech, 		PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_DATACENTER',	'TXT_KEY_BUILDING_DATACENTER', 	'TXT_KEY_BUILDING_DATACENTER_TEXT',	'TXT_KEY_BUILDING_DATACENTER_STRATEGY',	'TXT_KEY_BUILDING_DATACENTER_HELP',	
	12, 				3200, -20, 					-1, 			80, 			
	'BUILDINGCLASS_DATACENTER', 	'ART_DEF_BUILDING_MARKET', 	'TECH_GLOBALIZATION', 	42,				'CORP2_ATLAS');

UPDATE CustomModOptions SET Value = 1 WHERE Name IN ('GLOBAL_CITY_AUTOMATON_WORKERS', 'BUILDINGS_CITY_AUTOMATON_WORKERS');

UPDATE Buildings SET
	SpecialistType = 'SPECIALIST_MERCHANT',
	GreatPeopleRateChange = 3,
	SpecialistCount = 1,
	GlobalCityAutomatonWorkersChange = 1
WHERE BuildingClass = 'BUILDINGCLASS_DATACENTER';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES	
	('BUILDING_DATACENTER',  'YIELD_GOLD',	5);

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
SELECT
	Type, SpecialistType, 67
FROM Buildings WHERE Type IN ('BUILDING_DATACENTER');

INSERT INTO Building_YieldFromProcessModifier
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_DATACENTER', 'YIELD_GOLD', 20);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 	BuildingClassType)
VALUES
	('BUILDING_DATACENTER', 'BUILDINGCLASS_INDUSTRIAL_ESTATE');

INSERT INTO Building_ResourceQuantityRequirements
	(BuildingType, ResourceType, Cost)
VALUES
	('BUILDING_DATACENTER', 'RESOURCE_ALUMINUM', 2);

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_DATACENTER', 'FLAVOR_GROWTH', 30),
	('BUILDING_DATACENTER', 'FLAVOR_GOLD', 70),
	('BUILDING_DATACENTER', 'FLAVOR_PRODUCTION', 30),
	('BUILDING_DATACENTER', 'FLAVOR_SCIENCE', 30),
	('BUILDING_DATACENTER', 'FLAVOR_CULTURE', 30);

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_DATACENTER',	 'Data Center'),
		('TXT_KEY_BUILDING_DATACENTER_TEXT',		'A data center is a place used to house computer systems and associated components, such as telecommunications and storage systems. Since IT operations are crucial for business continuity, it generally includes redundant or backup components and infrastructure for power supply, data communication connections, environmental controls (e.g., air conditioning, fire suppression), and various security devices. A large data center is an industrial-scale operation using as much electricity as a medium town. High demand for electricity from data centers, including by cryptomining and artificial intelligence, has also increased strain on local electric grids and increased electricity prices in some markets. The United States is currently the foremost leader in data center infrastructure, hosting 5,381 data centers as of March 2024, the highest number of any country worldwide, and their energy demand is expected to reach 35 gigawatts (GW) by 2030.'),
		('TXT_KEY_BUILDING_DATACENTER_STRATEGY', 'The Data Center boosts Merchants like other final-tier buildings boost Scientists or Engineers. However the really significant effect is the global +1 Automaton, which can in principle increase your workforce by an amount that is only limited by how much Aluminium you control!'),
		('TXT_KEY_BUILDING_DATACENTER_HELP',  '');

-- The [COLOR_YELLOW]Wealth[ENDCOLOR] Process is 20% more efficient at converting [ICON_PRODUCTION] Production into [ICON_GOLD] Gold. +67% [ICON_GREAT_MERCHANT] Great Merchant Rate.[NEWLINE][NEWLINE]Every City in the Empire gains +1 Automaton, which behaves like a [ICON_CITIZEN] Citizen but does not change the City''s population.[NEWLINE][NEWLINE]Requires 2 [ICON_RES_ALUMINUM] Aluminum.


