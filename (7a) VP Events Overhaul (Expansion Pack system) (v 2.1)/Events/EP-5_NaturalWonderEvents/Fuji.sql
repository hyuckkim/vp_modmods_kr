-- MT FUJI --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_MT_FUJI','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_MT_FUJI_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_MT_FUJI_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','true',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_FUJI',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NW_MT_FUJI_ERUPTION','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',50,1,'true','false','false',30,1,10,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_FUJI',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_MT_FUJI_CHOICE_1','CITY_EVENT_NW_MT_FUJI'),
('CITY_EVENT_NW_MT_FUJI_CHOICE_2','CITY_EVENT_NW_MT_FUJI'),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3a','CITY_EVENT_NW_MT_FUJI'),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','CITY_EVENT_NW_MT_FUJI_ERUPTION'),
('CITY_EVENT_NW_MT_FUJI_CHOICE_4','CITY_EVENT_NW_MT_FUJI');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- New Building for Mt Fuji Event 4
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_FUJI_PAGODA','BUILDING_FUJI_PAGODA');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas,SpecialistType,SpecialistCount) VALUES
('BUILDING_FUJI_PAGODA','BUILDINGCLASS_FUJI_PAGODA','TXT_KEY_BUILDING_FUJI_PAGODA','TXT_KEY_BUILDING_FUJI_PAGODA_HELP',-1,-1,0,0,1,1,'EXPANSION_BW_ATLAS_1','SPECIALIST_ARTIST',1);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_FUJI_PAGODA', 'YIELD_FAITH', 2);

INSERT INTO Building_YieldChangesPerReligion (BuildingType, YieldType, Yield) VALUES
('BUILDING_FUJI_PAGODA', 'YIELD_FOOD', 100),
('BUILDING_FUJI_PAGODA', 'YIELD_GOLD', 100),
('BUILDING_FUJI_PAGODA', 'YIELD_CULTURE', 100),
('BUILDING_FUJI_PAGODA', 'YIELD_SCIENCE', 100),
('BUILDING_FUJI_PAGODA', 'YIELD_FAITH', 100),
('BUILDING_FUJI_PAGODA', 'YIELD_PRODUCTION', 100);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_FUJI_PAGODA','Lotus Pagoda');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_FUJI_PAGODA_HELP','This is a special Pagoda that also provides an additional [ICON_VP_ARTIST] Artist slot in the City.');
--------------------------------------------------------------------------------------------------
-- End New Building
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_MT_FUJI_CHOICE_1','TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_1','TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_FUJI_CHOICE_2','TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_2','TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_ARTISTS_GUILD',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- No immediate negative event for selecting Event Choice 3.
-- Selecting Event Choice 3 eventually will cause Mt Fuji to erupt with a second City Event.
-- Event Choice 4 cannot be selected until after the eruption.
--------------------------------------------------------------------------------------------------

('CITY_EVENT_NW_MT_FUJI_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_3a_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_THEOLOGY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_3b_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,10,0,3,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_FUJI_CHOICE_4','TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_4','TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_ARCHITECTURE',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_FUJI_PAGODA',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_MT_FUJI_ERUPTION',NULL,NULL,NULL,'CITY_EVENT_NW_MT_FUJI_CHOICE_3a','false','true','true');

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_MT_FUJI_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_MT_FUJI_CHOICE_3b','false','true','true');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_MT_FUJI_CHOICE_4','YIELD_FAITH',300);

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','YIELD_POPULATION',-2);

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_MT_FUJI_CHOICE_3a','BUILDINGCLASS_BARRACKS','YIELD_CULTURE',1),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3a','BUILDINGCLASS_ARMORY','YIELD_CULTURE',1);

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_MT_FUJI_CHOICE_1','FEATURE_FUJI','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_MT_FUJI_CHOICE_1','FEATURE_FUJI','YIELD_TOURISM',1),
('CITY_EVENT_NW_MT_FUJI_CHOICE_2','FEATURE_FUJI','YIELD_FAITH',4);

-- INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_MT_FUJI_CHOICE_2','SPECIALIST_ARTIST','YIELD_CULTURE',1);

INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','IMPROVEMENT_FARM',2),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','IMPROVEMENT_TRADING_POST',2),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','IMPROVEMENT_QUARRY',2),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','IMPROVEMENT_MINE',2),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','IMPROVEMENT_LUMBERMILL',2),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','IMPROVEMENT_PASTURE',2),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','IMPROVEMENT_PLANTATION',2),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','IMPROVEMENT_CAMP',2),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','IMPROVEMENT_TERRACE_FARM',2),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','IMPROVEMENT_ACADEMY',1),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','IMPROVEMENT_CUSTOMS_HOUSE',1),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3b','IMPROVEMENT_MANUFACTORY',1);

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

-- INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_MT_FUJI_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_MT_FUJI_CHOICE_2','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_MT_FUJI_CHOICE_2','FLAVOR_RELIGION',20),
('CITY_EVENT_NW_MT_FUJI_CHOICE_3a','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_MT_FUJI_CHOICE_4','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_MT_FUJI_CHOICE_4','FLAVOR_RELIGION',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_FUJI_DESCRIPTION','The Lotus Peak');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_FUJI_HELP','Your Eminence, one of the monks on has come down from the Holy Mountain to discuss some religious matters with you.[NEWLINE][NEWLINE]I will send him into the throne room when you are ready for him.[NEWLINE]');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_1', 'Blessed Father, there is a new group of believers gathered around the Mountain who are telling themselves that climbing to the peak will result in their spiritual rebirth, enabling them to be purified and find happiness. What would you like me to do with them?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_1_HELP','I have no problem with these people. As long as they remain peaceful, let them climb the Mountain.[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_2','Most High, there is an increased amount of worship pertaining to the Mountain. We would like to build a shrine in the foothills to offer a place of respite for visitors.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_2_HELP','Yes. Build the shrine and make it available to our priests and artists as well.[NEWLINE][NEWLINE]The Natural Wonder gains +2 [ICON_PEACE] Faith, and local [ICON_VP_ARTIST] Artists gain +1 [ICON_CULTURE] Culture.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_3a','Are those rumblings we hear from the mountain, Your Majesty?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_3a_HELP','Maybe we should base some troops here, just in case.[NEWLINE][NEWLINE]The Barracks and Armory each gain +1 [ICON_CULTURE] Culture.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_3b','Mt Fuji Erupts!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_3b_HELP','Mt Fuji has erupted! Massive plumes of ash, smoke, and lava have enveloped the nearby City and its countryside. The City has lost {2_InstantYield}, multiple Improvements are damaged, and many City buildings are destroyed!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_4','Honored Leader, I know that we have historically forbidden women from accessing the Holy Mountain, but don''t you think it''s time we revisited that policy?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_FUJI_CHOICE_4_HELP','I agree. And to celebrate this new edict, I am going to build a special Pagoda on the top of the mountain.[NEWLINE][NEWLINE]The Lotus Pagoda is built. In addition to the regular Pagoda yields, this Pagoda includes one slot for an [ICON_VP_ARTIST] Artist. [NEWLINE](Can be built in the same City as a regular Pagoda. Does not recieve any other religious building bonuses.)');