INSERT INTO BuildingClasses 	
	(Type,	DefaultBuilding,		Description)
VALUES		
	('BUILDINGCLASS_SYNCHROTRON',	'BUILDING_SYNCHROTRON',	'TXT_KEY_BUILDING_SYNCHROTRON');

-----------------------
-- cern gives free one
----------------------
UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_SYNCHROTRON' WHERE Type = 'BUILDING_CERN';

UPDATE Language_en_US SET 
Text = 'Receive 2 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Technologies, +100 [ICON_INFLUENCE] Influence with all [ICON_CITY_STATE] City-States in the world, and a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Synchrotron in the City.'
WHERE Tag = 'TXT_KEY_BUILDING_CERN_HELP';
----------------------

INSERT INTO	 Buildings
		(Type,		Description,	Civilopedia,	Strategy,	Help,									
		GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	
		BuildingClass, 	ArtDefineTag, 		PrereqTech, 		PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_SYNCHROTRON',	'TXT_KEY_BUILDING_SYNCHROTRON', 	'TXT_KEY_BUILDING_SYNCHROTRON_TEXT',	'TXT_KEY_BUILDING_SYNCHROTRON_STRATEGY',	'TXT_KEY_BUILDING_SYNCHROTRON_HELP',	
	12, 				3200, -20, 					-1, 			80, 			
	'BUILDINGCLASS_SYNCHROTRON', 	'ART_DEF_BUILDING_MARKET', 	'TECH_PARTICLE_PHYSICS', 	41,				'CORP2_ATLAS');

UPDATE Buildings SET
	SpecialistType = 'SPECIALIST_SCIENTIST',
	GreatPeopleRateChange = 3,
	SpecialistCount = 1
WHERE BuildingClass = 'BUILDINGCLASS_SYNCHROTRON';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES	
	('BUILDING_SYNCHROTRON', 	'YIELD_SCIENCE',	5);

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
SELECT
	Type, SpecialistType, 67
FROM Buildings WHERE Type IN ('BUILDING_SYNCHROTRON');

INSERT INTO Building_SpecialistYieldChanges
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_SYNCHROTRON',  'SPECIALIST_SCIENTIST', 'YIELD_SCIENCE', 1),
	('BUILDING_SYNCHROTRON',  'SPECIALIST_SCIENTIST', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_YieldFromProcessModifier
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SYNCHROTRON', 'YIELD_SCIENCE', 20);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 	BuildingClassType)
VALUES
	('BUILDING_SYNCHROTRON', 'BUILDINGCLASS_LABORATORY');

INSERT INTO Building_ResourceQuantityRequirements
	(BuildingType, ResourceType, Cost)
VALUES
	('BUILDING_SYNCHROTRON', 'RESOURCE_ALUMINUM', 1);

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_SYNCHROTRON', 'FLAVOR_SCIENCE', 80),
	('BUILDING_SYNCHROTRON', 'FLAVOR_SPACESHIP', 30);

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_SYNCHROTRON',			'Synchrotron'),
		('TXT_KEY_BUILDING_SYNCHROTRON_TEXT',		'A synchrotron is a particular type of cyclic particle accelerator, descended from the cyclotron, in which the accelerating particle beam travels around a fixed closed-loop path. The strength of the magnetic field which bends the particle beam into its closed path increases with time during the accelerating process, being synchronized to the increasing kinetic energy of the particles. The synchrotron is one of the first accelerator concepts to enable the construction of large-scale facilities, since bending, beam focusing and acceleration can be separated into different components.[NEWLINE][NEWLINE]Synchrotron radiation has a wide range of applications: protein crystallography, lithography, chemical and material spectroscopy, radiometry, and even in some cancer therapies. As each beamline (there may be 20 to 50 at a large synchrotron) costs another two or three million dollars on average, these installations are mostly built by the science funding agencies of governments of developed countries, or by collaborations between several countries in a region, and operated as infrastructure facilities available to scientists from universities and research organisations throughout the country, region, or world.'),
		('TXT_KEY_BUILDING_SYNCHROTRON_STRATEGY',	'The final Science building, the Synchrotron gives the final push to get to the Spaceship Victory. Soon you will want every Scientist slot filled, especially in the City where you can make use of the Great Person Rate boost. Indeed every Synchrotron City should be pumping its Production into the Research Process to wind down the clock to Future Tech.'),
		('TXT_KEY_BUILDING_SYNCHROTRON_HELP',		'The [COLOR_YELLOW]Research[ENDCOLOR] Process is 20% more efficient at converting [ICON_PRODUCTION] Production into [ICON_RESEARCH] Science. +1 [ICON_PRODUCTION] Production and [ICON_RESEARCH] Science from every [ICON_VP_SCIENTIST] Scientist in the Empire. +67% [ICON_GREAT_SCIENTIST] Great Scientist Rate.[NEWLINE][NEWLINE]Requires 1 [ICON_RES_ALUMINUM] Aluminum.');


