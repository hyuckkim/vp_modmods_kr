INSERT INTO BuildingClasses 	
	(Type,	DefaultBuilding, Description, MaxPlayerInstances)
VALUES		
	('BUILDINGCLASS_TOKAMAK', 'BUILDING_TOKAMAK', 'TXT_KEY_BUILDING_TOKAMAK', 1);

INSERT INTO	 Buildings
	(Type,	Description,	Civilopedia,  Strategy,		Help,		
		GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	BuildingClass, 	
		NumCityCostMod, NationalPopRequired, NeverCapture, NukeImmune,	
		ArtDefineTag, 	PrereqTech, 	PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_TOKAMAK',	'TXT_KEY_BUILDING_TOKAMAK', 	'TXT_KEY_BUILDING_TOKAMAK_TEXT',	'TXT_KEY_BUILDING_TOKAMAK_STRATEGY',	'TXT_KEY_BUILDING_TOKAMAK_HELP',	
		12, 	1400, -20, 	10, 	'BUILDINGCLASS_TOKAMAK', 	
 		25,  60, 1, 1, 
		'ART_DEF_BUILDING_MARKET', 	'TECH_NUCLEAR_FUSION', 	44,	'CORP2_ATLAS');

UPDATE Buildings SET
    FreeBuilding = 'BUILDINGCLASS_ELECTROLYSER'
WHERE Type = 'BUILDING_TOKAMAK';

INSERT INTO Building_YieldModifiers
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_TOKAMAK', 'YIELD_GOLD', 25),
	('BUILDING_TOKAMAK', 'YIELD_PRODUCTION', 25),
	('BUILDING_TOKAMAK', 'YIELD_SCIENCE', 25);

INSERT INTO Building_Flavors
	(BuildingType,	FlavorType,	Flavor)
VALUES
	('BUILDING_TOKAMAK',	'FLAVOR_PRODUCTION', 150),
	('BUILDING_TOKAMAK',	'FLAVOR_GOLD', 150),
	('BUILDING_TOKAMAK',	'FLAVOR_SCIENCE', 150);

INSERT INTO Building_ClassesNeededInCity 	
	(BuildingType, 	BuildingClassType)
VALUES	
	('BUILDING_TOKAMAK',	'BUILDINGCLASS_ELECTROLYSER');

INSERT INTO Language_en_US 
	(Tag, Text)
VALUES	
	('TXT_KEY_BUILDING_TOKAMAK',  'Tokamak Reactor'),
	('TXT_KEY_BUILDING_TOKAMAK_TEXT',   'A tokamak is a machine which uses a powerful magnetic field to confine plasma in the shape of a torus. The tokamak is the leading candidate of magnetic confinement fusion designs being developed to produce controlled thermonuclear fusion power. Tokamaks were first conceptualized in 1950 by Soviet physicists Andrei Sakharov and Igor Tamm; its name is an acronym of "toroidal chamber magnetic" in Russian. It took until December 5 2022, for the first plasma ignition to become self-sustaining and breakeven, achieving an energy gain factor of Q = 1.54.[NEWLINE][NEWLINE]Fusion was achieved in 1934 by Rutherford using a particle accelerator to collide hydrogen nuclei, but this scattering process consumes - rather than produces - energy. The first time fusion power hit global headlines was on 25 March 1951: Argentine President Juan Perón announced that a former German scientist, Ronald Richter, had succeeded in producing fusion at a laboratory scale as part of what is now known as the Huemul Project. Scientists around the world were excited by the announcement, but soon concluded it was not true; simple calculations showed that his experimental setup could not produce enough energy to heat the fusion fuel to the needed temperatures.[NEWLINE][NEWLINEResearch continued around the world, but it took almost two decades before, in 1968, British Culham Laboratory scientists verified high performance results of the Kurchatov Institute''s T-3 tokamak. Soviet scientists demonstrated that a stable plasma equilibrium requires magnetic field lines that wind around the torus in a helix shape. Unfortunately it had also been discovered that the electrical resistance of a plasma was reduced as the temperature increased, meaning the heating rate of the plasma would slow as the devices improved. Calculations at the time suggested that maximum temperatures were too low to harness nuclear fusion as an energy source.[NEWLINE][NEWLINE]In the United States research budgets were given a boost by the 1973 oil crisis, which led to greatly increased funding into alternative energy systems. Progress was made on neutral beam injection, where small particle accelerators would shoot fuel atoms through the surrounding magnetic field where they would collide with the plasma and heat it. The 1978 Princeton Large Torus tokamak design was an enormous success, continually raising its internal temperature until it hit 60 million Celsius, putting practical fusion within reach.[NEWLINE][NEWLINE]After an initial agreement between Ronald Reagan and Mikhail Gorbachev in November 1985, the International Thermonuclear Experimental Reactor (ITER) project emerged. It immediately became clear that none of the existing designs were working. A host of new instabilities were discovered, along with a number of more practical engineering problems that continued to interfere with their performance. On top of this, dangerous "excursions" of the plasma hitting with the walls of the reactor were evident. Major advances in materials, computational modelling, and control theory would be necessary before further progress could be made.'),
	('TXT_KEY_BUILDING_TOKAMAK_STRATEGY',	'Electrolysers are naturally limited in number by their prerequisite building. However, with Fusion power you don''t care about minor things like technical limitations! You have harnessed the power of the stars, and your yields will be matched only by the heat of your artificial sun! Once the Tokamak Reactor is constructed, the game is only a few turns from being decided. Let''s hope it''s by you!'),
	('TXT_KEY_BUILDING_TOKAMAK_HELP',    'All Cities receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Electrolyser.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own.');

