INSERT INTO BuildingClasses 	
	(Type,	DefaultBuilding,  Description)
VALUES		
	('BUILDINGCLASS_AIRFIELD',	'BUILDING_AIRFIELD',	'TXT_KEY_BUILDING_AIRFIELD');

INSERT INTO Buildings
	(Type,	Description,	Civilopedia,	Strategy,	Help,
	GoldMaintenance, Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 			
	ArtDefineTag, 	PrereqTech, 	PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_AIRFIELD',	'TXT_KEY_BUILDING_AIRFIELD', 	'TXT_KEY_BUILDING_AIRFIELD_TEXT',	'TXT_KEY_BUILDING_AIRFIELD_STRATEGY',	'TXT_KEY_BUILDING_AIRFIELD_HELP',	
			7, 		2250, 		-20, 		-1, 		80, 	'BUILDINGCLASS_AIRFIELD', 
	'ART_DEF_BUILDING_MARKET', 'TECH_REPLACEABLE_PARTS',  19, 'CORP2_ATLAS');

UPDATE Buildings SET
	CityAirStrikeDefense = 5,
	AirModifier = 1,
	ExtraCityHitPoints = 50
WHERE BuildingClass = 'BUILDINGCLASS_AIRFIELD';

UPDATE Buildings SET
	AirModifier = 2
WHERE BuildingClass = 'BUILDINGCLASS_AIRPORT';

UPDATE Buildings SET
	AirModifier = 1
WHERE BuildingClass = 'BUILDINGCLASS_MILITARY_BASE';

INSERT INTO Building_YieldChangeWorldWonder
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_AIRFIELD', 'YIELD_GOLD', 2),
	('BUILDING_AIRFIELD', 'YIELD_TOURISM', 2);

INSERT INTO Building_UnitCombatProductionModifiers
	(BuildingType, UnitCombatType, Modifier)
VALUES
	('BUILDING_AIRFIELD', 'UNITCOMBAT_FIGHTER', 20),
	('BUILDING_AIRFIELD', 'UNITCOMBAT_BOMBER', 20),
	('BUILDING_AIRFIELD', 'UNITCOMBAT_HELICOPTER', 20);

INSERT INTO Building_UnitCombatProductionModifiers
	(BuildingType, UnitCombatType, Modifier)
SELECT
	'BUILDING_AIRFIELD', 'UNITCOMBAT_AIRSHIP', 20 
WHERE EXISTS (SELECT * FROM UnitCombatInfos WHERE Type = 'UNITCOMBAT_AIRSHIP');

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES	
	('BUILDING_AIRFIELD', 'YIELD_SCIENCE', 2);

INSERT INTO	 Building_Flavors
		(BuildingType,	FlavorType, Flavor)
VALUES
	('BUILDING_AIRFIELD',	'FLAVOR_AIR', 20),	
	('BUILDING_AIRFIELD',	'FLAVOR_ANTIAIR', 20),	
	('BUILDING_AIRFIELD',	'FLAVOR_WONDER', 5),	
	('BUILDING_AIRFIELD',	'FLAVOR_SCIENCE', 5);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	
	('BUILDING_MILITARY_BASE', 'BUILDINGCLASS_AIRFIELD'),
	('BUILDING_AIRPORT',	'BUILDINGCLASS_AIRFIELD');

INSERT INTO Unit_BuildingClassPurchaseRequireds
	(UnitType, BuildingClassType)
SELECT
	Type, 'BUILDINGCLASS_AIRFIELD'
FROM Units WHERE CombatClass IN ('UNITCOMBAT_BOMBER', 'UNITCOMBAT_FIGHTER', 'UNITCOMBAT_HELICOPTER');

----------------------------
-- cargo cult compatibility
----------------------------

INSERT INTO Belief_BuildingClassFaithPurchase
	(BeliefType, BuildingClassType)
VALUES
	('BELIEF_CARGO_CULT', 'BUILDINGCLASS_AIRFIELD');

UPDATE Buildings SET FaithCost = 600, UnlockedByBelief = 1 WHERE BuildingClass = 'BUILDINGCLASS_AIRFIELD';

UPDATE Language_en_US SET Text = Replace(Text, 'Airports', 'Airfields and Airports') WHERE Tag = 'TXT_KEY_BELIEF_CARGO_CULT';

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_AIRFIELD',	 'Airfield'),
		('TXT_KEY_BUILDING_AIRFIELD_TEXT',  'An airfield is a location from which aircraft flight operations take place, regardless of whether they involve air cargo, passengers, or neither, and regardless of whether it is for public or private use. They are a type of aerodrome, which is a designation that includes small general aviation airfields and remote airstrips, large commercial airports, and military air bases. In the early days of aviation, when there were no paved runways and all landing fields were grass, a typical airfield might permit takeoffs and landings in only a couple of directions, much like today''s airports.[NEWLINE][NEWLINE]Later, more modern aerodromes were distinguished by virtue of their much greater size, allowing them to handle landings and takeoffs in any direction. The ability to always take off and land directly into the wind, regardless of the wind''s direction, was an important advantage in the earliest days of aviation when an aeroplane or dirigible''s performance in a crosswind takeoff or landing might be poor or even dangerous.'),
		('TXT_KEY_BUILDING_AIRFIELD_STRATEGY',	'The airfield is the first piece of Air infrastructure, required for the powerful Airport and Military Base buildings. Although you might only have hot air balloons to launch at this point in the game, you can invest ahead of time if you know the air war is going to be important. The building also offers yields based on World Wonders present in the City, making it a niche investment where a scenic view from the sky might be in demand.'),
		('TXT_KEY_BUILDING_AIRFIELD_HELP', '+2 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism from every [ICON_WONDER] World Wonder in the City. Grants +20% [ICON_PRODUCTION] Production towards Air and Hovering Units.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Increases Air Unit Capacity of the City by 1[ENDCOLOR]. +5 [ICON_STRENGTH] Damage to Air Units during Air Strikes on City.');

UPDATE Language_en_US SET
Text = Replace(Text, 'Increases Air Unit Capacity of the City from 2 to 6.', 'Increases Air Unit Capacity of the City by 2.')
WHERE Tag = 'TXT_KEY_BUILDING_AIRPORT_HELP';

UPDATE Language_en_US SET
Text = Replace(Text, 'Air Strikes on City.', '[COLOR_POSITIVE_TEXT]Increases Air Unit Capacity of the City by 1[ENDCOLOR].')
WHERE Tag = 'TXT_KEY_BUILDING_MILITARY_BASE_HELP';




