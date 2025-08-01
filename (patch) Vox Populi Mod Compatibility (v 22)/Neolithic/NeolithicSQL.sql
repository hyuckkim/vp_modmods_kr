INSERT INTO Audio_Sounds
	(SoundID, Filename, LoadType)
VALUES
	('SND_WONDER_SKARABRAE', 'SkaraBrae', 'DynamicResident'),
	('SND_WONDER_NEWGRANGE', 'Newgrange', 'DynamicResident'),
	('SND_WONDER_GGANTIJA', 'Ggantija', 'DynamicResident'),
	('SND_WONDER_BARNENEZ', 'Barnenez', 'DynamicResident');

INSERT INTO Audio_2DSounds
	(ScriptID, SoundID, SoundType, MinVolume, MaxVolume, IsMusic, TaperSoundtrackVolume)
VALUES
	('AS2D_WONDER_SKARABRAE', 'SND_WONDER_SKARABRAE', 'GAME_MUSIC_STINGS', 120, 120, 'true', 0.0),
	('AS2D_WONDER_NEWGRANGE', 'SND_WONDER_NEWGRANGE', 'GAME_MUSIC_STINGS', 120, 120, 'true', 0.0),
	('AS2D_WONDER_GGANTIJA', 'SND_WONDER_GGANTIJA', 'GAME_MUSIC_STINGS', 120, 120, 'true', 0.0),
	('AS2D_WONDER_BARNENEZ', 'SND_WONDER_BARNENEZ', 'GAME_MUSIC_STINGS', 120, 120, 'true', 0.0);

UPDATE Buildings
SET Cost = 150, PrereqTech = 'TECH_MINING', EnhancedYieldTech = 'TECH_ARCHAEOLOGY', TechEnhancedTourism = 2, WonderSplashAudio = 'AS2D_WONDER_BARNENEZ', HurryCostModifier = -5, FreeBuildingThisCity = 'BUILDINGCLASS_STONE_WORKS', MutuallyExclusiveGroup = 600, SpecialistType = 'SPECIALIST_MERCHANT', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_BARNENEZ' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_BARNENEZ' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
UPDATE Building_YieldChanges SET Yield = 1 WHERE BuildingType = 'BUILDING_BARNENEZ' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) SELECT 'BUILDING_BARNENEZ', 'BUILDINGCLASS_STONE_WORKS', 'YIELD_PRODUCTION', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);

UPDATE Buildings
SET Cost = 150, PrereqTech = 'TECH_TRAPPING', EnhancedYieldTech = 'TECH_ARCHAEOLOGY', TechEnhancedTourism = 2, WonderSplashAudio = 'AS2D_WONDER_GGANTIJA', HurryCostModifier = -5, FreeBuildingThisCity = 'BUILDINGCLASS_SHRINE', MutuallyExclusiveGroup = 600
WHERE Type = 'BUILDING_GGANTIJA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
UPDATE Building_Flavors SET FlavorType = 'FLAVOR_RELIGION' WHERE BuildingType = 'BUILDING_GGANTIJA' AND Flavor = 10 AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GGANTIJA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
DELETE FROM Building_GlobalYieldModifiers WHERE BuildingType = 'BUILDING_GGANTIJA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
INSERT INTO Building_YieldChanges (BuildingType,YieldType, Yield) SELECT 'BUILDING_GGANTIJA', 'YIELD_FOOD', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
INSERT INTO Building_YieldChanges (BuildingType,YieldType, Yield) SELECT 'BUILDING_GGANTIJA', 'YIELD_CULTURE', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1); 
INSERT INTO Building_InstantYield (BuildingType, YieldType, Yield) SELECT 'BUILDING_GGANTIJA', 'YIELD_FOOD', 50 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits) SELECT 'BUILDING_GGANTIJA', 'UNIT_ARCHER', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);

UPDATE Buildings
SET Cost = 150, PrereqTech = 'TECH_POTTERY', EnhancedYieldTech = 'TECH_ARCHAEOLOGY', TechEnhancedTourism = 2, WonderSplashAudio = 'AS2D_WONDER_NEWGRANGE', HurryCostModifier = -5, FreeBuildingThisCity = 'BUILDINGCLASS_MONUMENT', MutuallyExclusiveGroup = 600
WHERE Type = 'BUILDING_NEWGRANGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_NEWGRANGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
INSERT INTO Building_YieldChanges (BuildingType,YieldType, Yield) SELECT 'BUILDING_NEWGRANGE', 'YIELD_CULTURE', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1); 
INSERT INTO Building_YieldFromDeath (BuildingType, YieldType, Yield) SELECT 'BUILDING_NEWGRANGE', 'YIELD_FAITH', 3 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits) SELECT 'BUILDING_NEWGRANGE', 'UNIT_WORKER', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);

UPDATE Buildings
SET Cost = 150, PrereqTech = 'TECH_ANIMAL_HUSBANDRY', EnhancedYieldTech = 'TECH_ARCHAEOLOGY', TechEnhancedTourism = 2, WonderSplashAudio = 'AS2D_WONDER_SKARABRAE', HurryCostModifier = -5, FreeBuildingThisCity = 'BUILDINGCLASS_GRANARY', MutuallyExclusiveGroup = 600, SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_SKARABRAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_SKARABRAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
INSERT INTO Building_YieldChanges (BuildingType,YieldType, Yield) SELECT 'BUILDING_SKARABRAE', 'YIELD_CULTURE', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_SKARABRAE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) SELECT 'BUILDING_SKARABRAE', 'BUILDINGCLASS_GRANARY', 'YIELD_FOOD', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
INSERT INTO Building_ResourceQuantity (BuildingType, ResourceType, Quantity) SELECT 'BUILDING_SKARABRAE', 'RESOURCE_HORSE', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);
UPDATE Buildings
SET EnhancedYieldTech = 'TECH_ARCHAEOLOGY', TechEnhancedTourism = 2, MutuallyExclusiveGroup = 600
WHERE Type = 'BUILDING_STONEHENGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);

UPDATE Language_en_US
SET Text = 'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Stone Works in the city. All Stone Works generate +1 [ICON_PRODUCTION] Production. Receive +2 [ICON_TOURISM] Tourism when [COLOR_RESEARCH_STORED]Archaeology[ENDCOLOR] has been researched.'
WHERE Tag = 'TXT_KEY_WONDER_BARNENEZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);

UPDATE Language_en_US
SET Text = 'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Monument in the city. A Worker appears near the City. Gain 3 [ICON_PEACE] Faith when an owned unit is killed in battle. Bonus scales with Era. Receive +2 [ICON_TOURISM] Tourism when [COLOR_RESEARCH_STORED]Archaeology[ENDCOLOR] has been researched.'
WHERE Tag = 'TXT_KEY_WONDER_NEWGRANGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);

UPDATE Language_en_US
SET Text = 'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Granary and 1 [ICON_RES_HORSE] Horse in the city. All Granaries generate +1 [ICON_FOOD] Food.  Receive +2 [ICON_TOURISM] Tourism when [COLOR_RESEARCH_STORED]Archaeology[ENDCOLOR] has been researched.'
WHERE Tag = 'TXT_KEY_WONDER_SKARABRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);

UPDATE Language_en_US
SET Text = 'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Shrine and 50 [ICON_FOOD] Food in the City in which it is built. An Archer appears near the City. Receive +2 [ICON_TOURISM] Tourism when [COLOR_RESEARCH_STORED]Archaeology[ENDCOLOR] has been researched.'
WHERE Tag = 'TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);

UPDATE Language_en_US
SET Text = 'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Council and 50 [ICON_PEACE] Faith in the City in which it is built. Receive +2 [ICON_TOURISM] Tourism when [COLOR_RESEARCH_STORED]Archaeology[ENDCOLOR] has been researched.'
WHERE Tag = 'TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 1);