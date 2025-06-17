-- NATURAL WONDER NAME --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_SRI_PADA','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_SRI_PADA_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_SRI_PADA_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_SRI_PADA',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_SRI_PADA_CHOICE_1','CITY_EVENT_NW_SRI_PADA'),
('CITY_EVENT_NW_SRI_PADA_CHOICE_2','CITY_EVENT_NW_SRI_PADA'),
('CITY_EVENT_NW_SRI_PADA_CHOICE_3','CITY_EVENT_NW_SRI_PADA'),
('CITY_EVENT_NW_SRI_PADA_CHOICE_4','CITY_EVENT_NW_SRI_PADA');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- Dummy Building for Sri Pada Event 2
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_SRI_PADA_DUMMY','BUILDING_SRI_PADA_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas) VALUES
('BUILDING_SRI_PADA_DUMMY','BUILDINGCLASS_SRI_PADA_DUMMY','TXT_KEY_BUILDING_SRI_PADA_DUMMY','TXT_KEY_BUILDING_SRI_PADA_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS');

INSERT INTO Building_RiverPlotYieldChanges(BuildingType,YieldType,Yield) VALUES
('BUILDING_SRI_PADA_DUMMY','YIELD_FOOD',1);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_SRI_PADA_DUMMY','Sri Pada Watershed Project');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_SRI_PADA_DUMMY_HELP','Adds +1 [ICON_Food] Food to river tiles.');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings 
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_SRI_PADA_CHOICE_1','TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_1','TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_SRI_PADA_CHOICE_2','TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_2','TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_CURRENCY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_SRI_PADA_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_SRI_PADA_CHOICE_3','TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_3','TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_3_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_ECONOMICS',NULL,'false',NULL,NULL,'false','BUILDINGCLASS_TEMPLE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_SRI_PADA_CHOICE_4','TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_4','TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,'ERA_MEDIEVAL','false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'true',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_SRI_PADA_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_SRI_PADA_CHOICE_3','false','true','true');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_SRI_PADA_CHOICE_4','YIELD_FAITH',300);

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES 
('CITY_EVENT_NW_SRI_PADA_CHOICE_3','YIELD_PRODUCTION',10);

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_SRI_PADA_CHOICE_1','FEATURE_SRI_PADA','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_SRI_PADA_CHOICE_1','FEATURE_SRI_PADA','YIELD_TOURISM',1),
('CITY_EVENT_NW_SRI_PADA_CHOICE_4','FEATURE_SRI_PADA','YIELD_CULTURE',3),
('CITY_EVENT_NW_SRI_PADA_CHOICE_4','FEATURE_SRI_PADA','YIELD_TOURISM',2);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_SRI_PADA_CHOICE_2','IMPROVEMENT_FARM','YIELD_FOOD',1),
('CITY_EVENT_NW_SRI_PADA_CHOICE_3','IMPROVEMENT_TRADING_POST','YIELD_CULTURE',1),
('CITY_EVENT_NW_SRI_PADA_CHOICE_3','IMPROVEMENT_TRADING_POST','YIELD_GOLD',1),
('CITY_EVENT_NW_SRI_PADA_CHOICE_3','IMPROVEMENT_CUSTOMS_HOUSE','YIELD_CULTURE',1),
('CITY_EVENT_NW_SRI_PADA_CHOICE_3','IMPROVEMENT_CUSTOMS_HOUSE','YIELD_GOLD',1);

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES 
('CITY_EVENT_NW_SRI_PADA_CHOICE_2','RESOURCE_GEMS',1);

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES
('CITY_EVENT_NW_SRI_PADA_CHOICE_4','UNIT_PROPHET',1);

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_SRI_PADA_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_SRI_PADA_CHOICE_2','FLAVOR_HAPPINESS',20),
('CITY_EVENT_NW_SRI_PADA_CHOICE_2','FLAVOR_GROWTH',20),
('CITY_EVENT_NW_SRI_PADA_CHOICE_3','FLAVOR_PRODUCTION',-20),
('CITY_EVENT_NW_SRI_PADA_CHOICE_3','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_SRI_PADA_CHOICE_3','FLAVOR_GOLD',20),
('CITY_EVENT_NW_SRI_PADA_CHOICE_4','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_SRI_PADA_CHOICE_4','FLAVOR_GREAT_PEOPLE',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SRI_PADA_DESCRIPTION','Feeling Adam''s Peakish');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SRI_PADA_HELP','Glorious Leader, we have a man waiting for you with a desire to discuss Sri Pada. Shall I direct him to your audience chamber?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_1', 'This man has heard that there are many monuments located on the mountain and would like to build another one to honor his ancestors. What say you?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_1_HELP','To honour one''s ancestors is a noble cause. We shall not refuse our subject.[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_2','This man claims to be part of something called the ''Sri Pada Watershed Project''. He is suggesting some kind of new irrigation project utilizing the local rivers to help out our local farmers. He even thinks we can use the project to pan for precious gemstones.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_2_HELP','Emeralds, rubies and sapphires...I have been thinking about a new throne.[NEWLINE][NEWLINE]Local river tiles and farms gain +1 [ICON FOOD] Food (can stack). You also gain a copy of [ICON_RES_GEMS] Gems.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_3','This man is developing new routes up to the top of the mountain for all the pilgrims that have been showing up. He has requested your blessing for this venture.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_3_HELP','Mo people...mo taxes. He has my blessing.[NEWLINE][NEWLINE]Due to the increase in visitors, local towns and villages gain +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold; however, the extra work of managing all these people has reduced [ICON_PRODUCTION] Production in the City by 10%.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_4','Apparently, this is some kind of holy man who wants to climb to the top of Sri Pada and look for some kind of footprint in the rocks.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SRI_PADA_CHOICE_4_HELP','I have heard about this footprint and know that many religions claim it is a sacred site. Tell him he can climb his holy mountain.[NEWLINE][NEWLINE]The Natural Wonder gains +3 [ICON_CULTURE] Culture and +2 [ICON_TOURISM] Tourism, and a Great Prophet appears!');
