

--BuildingClasses
INSERT INTO BuildingClasses 	
			(Type,									DefaultBuilding,				NoLimit)
VALUES		('BUILDINGCLASS_IA_GOLD_BONUS_D',       'BUILDING_IA_GOLD_BONUS_D',     1),
			('BUILDINGCLASS_IA_FARM_BONUS_D',       'BUILDING_IA_FARM_BONUS_D',     1),
			('BUILDINGCLASS_IA_JEWELER_DUMMY',		'BUILDING_IA_JEWELER_DUMMY',	1);


--Buildings
INSERT INTO Buildings 	
			(Type,								BuildingClass,						Description,							CapitalOnly, 	GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,		PortraitIndex, IsDummy)
VALUES		('BUILDING_IA_FARM_BONUS_D',		'BUILDINGCLASS_IA_FARM_BONUS_D',	'TXT_KEY_BUILDING_IA_FARM_BONUS_D',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'BW_ATLAS_1',	19,            1),
			('BUILDING_IA_GOLD_BONUS_D',		'BUILDINGCLASS_IA_GOLD_BONUS_D',	'TXT_KEY_BUILDING_IA_GOLD_BONUS_D',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'BW_ATLAS_1',	19,            1),
			('BUILDING_IA_JEWELER_DUMMY',		'BUILDINGCLASS_IA_JEWELER_DUMMY',	'TXT_KEY_BUILDING_IA_JEWELER_DUMMY',	0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'BW_ATLAS_1',	19,            1);

--Building_ResourceYieldChanges, Jeweler Dummy
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,					 ResourceType,			 YieldType,					Yield)
VALUES		('BUILDING_IA_JEWELER_DUMMY',	'RESOURCE_JADE',		'YIELD_TOURISM',			1),
			('BUILDING_IA_JEWELER_DUMMY',	'RESOURCE_LAPIS',		'YIELD_TOURISM',			1),
			('BUILDING_IA_JEWELER_DUMMY',	'RESOURCE_GEMS',		'YIELD_TOURISM',			1),
			('BUILDING_IA_JEWELER_DUMMY',	'RESOURCE_AMBER',		'YIELD_TOURISM',			1);


--Building_YieldChanges, Farmers' Market Dummy, Coinage Mint Dummy
INSERT INTO Building_YieldChanges
			(BuildingType,							YieldType,			Yield)
VALUES		('BUILDING_IA_FARM_BONUS_D',			'YIELD_FOOD',		1),
			('BUILDING_IA_GOLD_BONUS_D',			'YIELD_GOLD',		1);


--Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_FARM_BONUS_D', 'Farmers Market Farm Bonus Dummy'),
('TXT_KEY_BUILDING_IA_GOLD_BONUS_D', 'Gold Bonus Dummy'),
('TXT_KEY_BUILDING_IA_JEWELER_DUMMY', 'Jeweler [COLOR_RESEARCH_STORED](After Archaeology)[ENDCOLOR]'); -- Shows up when hovering over tiles it improves, so have to give it name to explain that