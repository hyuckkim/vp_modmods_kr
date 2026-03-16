----------------------------
-- Move Stock Exchange
---------------------------
UPDATE Buildings SET
PrereqTech = 'TECH_CORPORATIONS'
WHERE BuildingClass = 'BUILDINGCLASS_STOCK_EXCHANGE';

------------------
-- BuildingClasses
INSERT INTO BuildingClasses
	(Type, 					DefaultBuilding,		Description)
VALUES	
	('BUILDINGCLASS_GEOLOGICAL_SURVEY',	'BUILDING_GEOLOGICAL_SURVEY',	'TXT_KEY_GEOLOGICAL_SURVEY'),
	('BUILDINGCLASS_SWITCHYARD', 		'BUILDING_SWITCHYARD', 		'TXT_KEY_SWITCHYARD'),
	('BUILDINGCLASS_NEWSROOM', 		'BUILDING_NEWSROOM', 		'TXT_KEY_NEWSROOM');

------------
-- Buildings
INSERT INTO Buildings
		(Type, 		BuildingClass, 		Cost,	HurryCostModifier,	GoldMaintenance,  MutuallyExclusiveGroup,	
	MinAreaSize,	PrereqTech,		NeverCapture,	ConquestProb, GreatPeopleRateChange, SpecialistType, IconAtlas, 		PortraitIndex,	
	Description,	Help,		Civilopedia, Strategy)
VALUES 	
	('BUILDING_GEOLOGICAL_SURVEY',  'BUILDINGCLASS_GEOLOGICAL_SURVEY',	1750,	-20,	7,	311,	
	0,	'TECH_ELECTRICITY',	0,	80, 3, 'SPECIALIST_SCIENTIST', 'CORP2_ATLAS',		32,	
	'TXT_KEY_GEOLOGICAL_SURVEY',	'TXT_KEY_GEOLOGICAL_SURVEY_HELP',	'TXT_KEY_CIV5_GEOLOGICAL_SURVEY_TEXT', 'TXT_KEY_GEOLOGICAL_SURVEY_STRATEGY'),
	('BUILDING_SWITCHYARD', 	'BUILDINGCLASS_SWITCHYARD',		1750,	-20,	7,	311,
	0,	'TECH_ELECTRICITY',	0,	80, 3, 'SPECIALIST_ENGINEER', 'CORP2_ATLAS',		33,				
	'TXT_KEY_SWITCHYARD',		'TXT_KEY_SWITCHYARD_HELP',		'TXT_KEY_CIV5_SWITCHYARD_TEXT', 'TXT_KEY_SWITCHYARD_STRATEGY'),
	('BUILDING_NEWSROOM', 		'BUILDINGCLASS_NEWSROOM',		1750,	-20,	7,	311,					
	0,	'TECH_ELECTRICITY',	0,	80, 3, 'SPECIALIST_MERCHANT', 'TECH_ATLAS_1',		59,		
	'TXT_KEY_NEWSROOM',	'TXT_KEY_NEWSROOM_HELP',	'TXT_KEY_CIV5_NEWSROOM_TEXT', 'TXT_KEY_NEWSROOM_STRATEGY');

------------------
-- shared effects 
------------------
INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
SELECT
	Type, SpecialistType, 33
FROM Buildings WHERE Type IN ('BUILDING_GEOLOGICAL_SURVEY', 'BUILDING_SWITCHYARD', 'BUILDING_NEWSROOM');

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES	
	('BUILDING_GEOLOGICAL_SURVEY',  'YIELD_CULTURE_LOCAL',  4),
	('BUILDING_GEOLOGICAL_SURVEY',  'YIELD_SCIENCE',  	2),
	('BUILDING_SWITCHYARD',		'YIELD_PRODUCTION', 	3),
	('BUILDING_SWITCHYARD',		'YIELD_GOLD', 		3),
	('BUILDING_NEWSROOM', 		'YIELD_TOURISM',	2),
	('BUILDING_NEWSROOM', 		'YIELD_CULTURE', 	1);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_GEOLOGICAL_SURVEY',  'BUILDINGCLASS_REFINERY',      'YIELD_SCIENCE', 1),
	('BUILDING_SWITCHYARD',		'BUILDINGCLASS_COALING_STATION', 'YIELD_GOLD',    2),
	('BUILDING_NEWSROOM', 		'BUILDINGCLASS_WIRE_SERVICE', 	 'YIELD_TOURISM', 1);

-- Building_Flavors
INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_NEWSROOM', 		'FLAVOR_ESPIONAGE',	30),
	('BUILDING_NEWSROOM',		'FLAVOR_CULTURE',	30),
	('BUILDING_GEOLOGICAL_SURVEY',  'FLAVOR_TILE_IMPROVEMENT', 30),
	('BUILDING_GEOLOGICAL_SURVEY',  'FLAVOR_SCIENCE',	30),
	('BUILDING_SWITCHYARD', 	'FLAVOR_GOLD',		30),	
	('BUILDING_SWITCHYARD', 	'FLAVOR_PRODUCTION',	30);

INSERT INTO Building_ClassesNeededInCity 	
	(BuildingType, 		BuildingClassType)
VALUES
	('BUILDING_GEOLOGICAL_SURVEY',  'BUILDINGCLASS_MUSEUM'),
	('BUILDING_NEWSROOM', 		'BUILDINGCLASS_PUBLIC_SCHOOL'),
	('BUILDING_SWITCHYARD', 	'BUILDINGCLASS_FACTORY');

------------------------------------
-- switchyard
------------------------------------
UPDATE Buildings SET
GlobalBuildingGoldMaintenanceMod = -1 
WHERE Type = 'BUILDING_SWITCHYARD';

INSERT INTO Building_YieldChangesFromPassingTR
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SWITCHYARD', 'YIELD_GOLD', 5),
	('BUILDING_SWITCHYARD', 'YIELD_PRODUCTION', 5);

INSERT INTO Building_YieldFromConstruction
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SWITCHYARD', 'YIELD_PRODUCTION', 25);

------------------------------------
-- geology 
------------------------------------
INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_GEOLOGICAL_SURVEY', 'IMPROVEMENT_MINE', 	'YIELD_SCIENCE', 1),
	('BUILDING_GEOLOGICAL_SURVEY', 'IMPROVEMENT_QUARRY', 	'YIELD_SCIENCE', 2),
	('BUILDING_GEOLOGICAL_SURVEY', 'IMPROVEMENT_WELL', 	'YIELD_SCIENCE', 3);

INSERT INTO Building_ResourceClaim
	(BuildingType, ResourceType, IncludeOwnedByOtherPlayer)
VALUES
	('BUILDING_GEOLOGICAL_SURVEY', 'RESOURCE_OIL', 1);

INSERT INTO Building_YieldChangesPerXTiles
	(BuildingType, YieldType, Yield, NumRequired)
VALUES
	('BUILDING_GEOLOGICAL_SURVEY', 'YIELD_FOOD', 1, 4);

-------------------------------------
-- Newsroom
-------------------------------------
UPDATE Buildings SET
RequiresIndustrialCityConnection = 1 
WHERE Type = 'BUILDING_NEWSROOM';

INSERT INTO Building_YieldFromSpyIdentify
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_NEWSROOM', 'YIELD_CULTURE', 50);

INSERT INTO Building_YieldFromSpyDefense
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_NEWSROOM', 'YIELD_CULTURE', 100);

INSERT INTO Building_YieldFromSpyRigElection
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_NEWSROOM', 'YIELD_CULTURE', 20);

INSERT INTO Building_YieldFromVictoryGlobal
	(BuildingType, YieldType, Yield, IsEraScaling, GoldenAgeOnly)
VALUES
	('BUILDING_NEWSROOM', 'YIELD_CULTURE', 10, 1, 0);

INSERT INTO Building_YieldFromDeath
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_NEWSROOM', 'YIELD_CULTURE', 25);

INSERT INTO Building_ResourceQuantity
	(BuildingType, ResourceType, Quantity)
VALUES	
	('BUILDING_NEWSROOM', 'RESOURCE_PAPER', 1);

INSERT INTO Building_YieldChangesPerPop
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_NEWSROOM', 'YIELD_GOLD', 13);

----------------
-- text
----------------
INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_GEOLOGICAL_SURVEY_HELP', ''),
-- +33% [ICON_GREAT_SCIENTIST] Great Scientist Rate. +1 [ICON_RESEARCH] Science to all owned Refineries in the Empire.[NEWLINE][NEWLINE]+1 [ICON_RESEARCH] Science to nearby Mines, +2 [ICON_RESEARCH] Science to Quarries, and +3 [ICON_RESEARCH] Science to Oil Wells. +1 [ICON_FOOD] Food for every 4 tiles owned by the City. Claims all nearby [ICON_RES_OIL] Oil when constructed.[NEWLINE][NEWLINE]City [COLOR_NEGATIVE_TEXT]cannot have[ENDCOLOR] a Newsroom or a Switchyard.
	('TXT_KEY_GEOLOGICAL_SURVEY', 'Geological Survey'),
	('TXT_KEY_CIV5_GEOLOGICAL_SURVEY_TEXT', 'As a practice, a geological survey refers to the systematic investigation of the geology beneath a given piece of ground for the purpose of creating a geological map or model. As an institution, the world''s first geological survey was founded in London in 1835 to carry out the practice and also organize the training of students in mineralogy and metallurgy.[NEWLINE][NEWLINE]Geological maps are important for many reasons, such as locating ground water sources, guiding infrastructure development, and locating natural resources. The first stage of the geological analysis of a territory is called prospecting. Traditionally prospecting relied on direct observation of mineralization in rock outcrops or in sediments. Modern prospecting also includes the use of geologic, geophysical, and geochemical tools to search for anomalies.'),	
	('TXT_KEY_GEOLOGICAL_SURVEY_STRATEGY', 'Establishing a Geology Survey is most useful in Cities on your Empire''s frontier, and you gain bonuses to Food and Border Growth which feed off each other, but importantly seize control of all nearby Oil, even if someone else thought they owned it first! Extracting minerals, and working Mines generally, will further your Science output, so consider chopping down any Forest or Jungles on your Hills. Indeed if a City already had many Mines, Quarries, and Wells, it might make sense to construct a Survey without further considerations. Empires in search of more Science output will naturally lean towards this Building because of its bonuses to Great Scientists and stacking Science bonus on your Empire''s Refineries, which can become substantial!'),	

	('TXT_KEY_SWITCHYARD_HELP', ''),
-- +33% [ICON_GREAT_ENGINEER] Great Engineer Rate. +2 [ICON_GOLD] Gold to all owned Coaling Stations in the Empire.[NEWLINE][NEWLINE]-1% Building [ICON_GOLD] Gold Maintenance in the Empire. +5 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold if a [ICON_INTERNATIONAL_TRADE] Trade Route passes through this City. Gain an instant boost of 25 [ICON_PRODUCTION] Production after constructing a Building, scaling with Era.[NEWLINE][NEWLINE]City [COLOR_NEGATIVE_TEXT]cannot have[ENDCOLOR] a Geological Survey or a Newsroom.
	('TXT_KEY_SWITCHYARD', 'Switchyard'),
	('TXT_KEY_CIV5_SWITCHYARD_TEXT', 'A switchyard (or ''substation'') is a part of an electrical generation, transmission, and distribution system. Substations transform voltage from high to low, or the reverse, or perform any of several other important functions like regulating the voltage and reactive power of the power system. In large distribution systems with many generators connected in parallel, it may be necessary to use a series switchyard reactor to prevent excessively large current flow during a short circuit; this protects transmission line conductors and switching apparatus from damage due to high currents and forces produced.'),	
	('TXT_KEY_SWITCHYARD_STRATEGY', 'Setting up a Switchyard is always useful to reduce your Gold expenditure everywhere. Indeed, Empires in search of more Gold output will naturally lean towards this Building because of its stacking Gold bonus on your Empire''s Coaling Stations, which can become substantial! If you do build one, this City will benefit from churning out infrastructure, and you can consider sending an Internal Trade Route to speed that up, because a passing Trade Route will also grant additional yields! Working Engineers will also grant additional Great Engineer Points.'),

	('TXT_KEY_NEWSROOM_HELP', ''),
-- +33% [ICON_GREAT_MERCHANT] Great Merchant Rate. +1 [ICON_TOURISM] Tourism to all owned Wire Services in the Empire.[NEWLINE][NEWLINE]+1 [ICON_RES_PAPER] Paper and 1 [ICON_GOLD] Gold for every 6 [ICON_CITIZEN] Citizens. Identifying a foreign [ICON_SPY] Spy in this City gain 50 [ICON_CULTURE] Culture, when you kill a foreign [ICON_SPY] Spy in this City gain 100 [ICON_CULTURE] Culture, and when you successfully [ICON_PUPPET] Rig an Election in a [ICON_CITY_STATE] City-State gain 20 [ICON_CULTURE] Culture, all scaling with Era. Gain 10 [ICON_CULTURE] Culture whenever you kill an Enemy Unit and 25 [ICON_CULTURE] Culture whenever an Owned Unit dies, both scaling with Era.[NEWLINE][NEWLINE]Requires an [ICON_INDUSTRIAL_CONNECTED] Industrial City Connection. City [COLOR_NEGATIVE_TEXT]cannot have[ENDCOLOR] a Geological Survey or a Switchyard.
	('TXT_KEY_NEWSROOM', 'Newsroom'),
	('TXT_KEY_CIV5_NEWSROOM_TEXT', 'A newsroom is the central place where journalists (reporters, editors, photojournalists, along with other staffers) work to gather news to be published in a newspaper, an online newspaper or magazine, or broadcast on radio, television, or cable. In a print publication''s newsroom, reporters sit at desks, gather information, and write articles or stories, on typewriters (after the early 1980s, on personal computers). These stories are submitted to editors, who usually sit together at one large desk, where the stories are reviewed and possibly rewritten. Once finished, editors write a headline for the story and begin to lay it out (see publishing) on a newspaper or magazine page. Editors also review photographs or other graphics to be used with a story before sending for print.'),	
	('TXT_KEY_NEWSROOM_STRATEGY', 'Founding a successful Newsroom can be an engine for generating large amounts of Culture. However the triggers are unusual: reacting to foreign Spies, rigging Elections, and finally Unit kills and deaths. These last two are obvious how to generate, but the first is quite rare. When foreign Spies are Identified, they might not be Killed, and vice-versa. If both happen then you get really lucky, so this creates a disincentive for your opponents to conduct the most risky operations in your Cities with good journalists! You don''t have to just be a victim though, as sending your Spies to City-States will also make headlines, and extra Paper (which can be hard to come by) is a strong boost in the diplomacy game! Indeed, your Wire Services will all generate more Tourism for every Newsroom, a bonus which can become substantial! Finally, Cities with lots of Merchant Specialists are good candidates for a Newsroom, since you receive more Great Merchant Points.');