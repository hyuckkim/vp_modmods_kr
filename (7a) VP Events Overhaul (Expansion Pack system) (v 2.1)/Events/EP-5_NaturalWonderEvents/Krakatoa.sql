-- MT KRAKATOA --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_MT_KRAKATOA','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_VOLCANO',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NW_MT_KRAKATOA_ERUPTION','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',50,1,'true','false','false',30,1,10,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_VOLCANO',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_1','CITY_EVENT_NW_MT_KRAKATOA'),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_2','CITY_EVENT_NW_MT_KRAKATOA'),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3a','CITY_EVENT_NW_MT_KRAKATOA'),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','CITY_EVENT_NW_MT_KRAKATOA_ERUPTION'),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_4','CITY_EVENT_NW_MT_KRAKATOA');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_1','TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_1','TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_2','TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_2','TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_LIGHTHOUSE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- No immediate negative event for selecting Event Choice 3.
-- Selecting Event Choice 3 eventually will cause Mt Fuji to erupt with a second City Event.
-- Event Choice 4 cannot be selected until after the eruption.
--------------------------------------------------------------------------------------------------

('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3a_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,'ERA_INDUSTRIAL','false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_HARBOR',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,10,0,3,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_4','TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_4','TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_BIOLOGY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_MT_KRAKATOA_ERUPTION',NULL,NULL,NULL,'CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3a','false','true','true');

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','false','true','true');

-- INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','YIELD_POPULATION',-2);

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_1','FEATURE_VOLCANO','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_1','FEATURE_VOLCANO','YIELD_TOURISM',1),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3a','FEATURE_VOLCANO','YIELD_CULTURE',2),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3a','FEATURE_VOLCANO','YIELD_TOURISM',3),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_4','FEATURE_VOLCANO','YIELD_SCIENCE',5),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_4','FEATURE_VOLCANO','YIELD_TOURISM',5);

-- INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES ;

INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_2','RESOURCE_FISH','YIELD_FOOD',1);

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','IMPROVEMENT_FARM',2),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','IMPROVEMENT_TRADING_POST',2),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','IMPROVEMENT_QUARRY',2),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','IMPROVEMENT_MINE',2),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','IMPROVEMENT_LUMBERMILL',2),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','IMPROVEMENT_PASTURE',2),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','IMPROVEMENT_PLANTATION',2),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','IMPROVEMENT_CAMP',2),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','IMPROVEMENT_TERRACE_FARM',2),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','IMPROVEMENT_ACADEMY',1),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','IMPROVEMENT_CUSTOMS_HOUSE',1),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','IMPROVEMENT_MANUFACTORY',1);

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_2','RESOURCE_CORAL',1);

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_2','FLAVOR_GROWTH',20),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_2','FLAVOR_HAPPINESS',20),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3a','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_4','FLAVOR_SCIENCE',20),
('CITY_EVENT_NW_MT_KRAKATOA_CHOICE_4','FLAVOR_CULTURE',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_DESCRIPTION','Fire Mountain');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_HELP','Sire, there are villagers from near Mount Krakatoa here to see you...');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_1', 'Oh noble ruler! We have sent some boys to the top of the mountain, and they said it was like peering into the gates of hell. Fire and ash, steam and sulphur.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_1_HELP','How remarkable! I wonder if any other civilizations would be interested in learning about this place.[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_2','Majesty, our fishing industry wanted to report that the waters around the caldera seem to be more fertile than other waters they work in. Maybe it has something to do with the volcano?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_2_HELP','This is great news! We could always use the extra resources for our people.[NEWLINE][NEWLINE]The City acquires 1 copy of [ICON_RES_CORAL] Coral, and nearby [ICON_RES_FISH] Fish gain +1 [ICON_FOOD] Food.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3a','Our elders thought you should be informed there are a lot of strange visitors to the island. We''ve had ships from a large number of other civilizations coming to survey the island.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3a_HELP','[NEWLINE][NEWLINE]This adds +2 [ICON_CULTURE] Culture and +3 [ICON_TOURISM] Tourism to the Natural Wonder.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b','Mt Krakatoa Erupts!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_3b_HELP','Mt Krakatoa has erupted! Massive plumes of ash, smoke, and lava have enveloped the nearby City and its countryside. The City has lost {2_InstantYield}, multiple Improvements are damaged, and many City buildings are destroyed!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_4','Sir, we have discussed it among ourselves, and we believe the island should be a nature preserve. Is this acceptable to you?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KRAKATOA_CHOICE_4_HELP','I had heard that the island was complete sterlized after the eruption. And now it''s teeming with new life? Yes! Let''s create a wildlife refuge on the island. [NEWLINE][NEWLINE]This adds +5 [ICON_RESEARCH] Science and +5 [ICON_TOURISM] Tourism to the Natural Wonder.');