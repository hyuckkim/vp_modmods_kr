-- LAKE VICTORIA --

--------------------------------------------------------------------------------------------------
-- Events boost rivers so guaranteeing river at NW
--------------------------------------------------------------------------------------------------
-- UPDATE Features SET RequiresRiver = 'true' WHERE Type = 'FEATURE_LAKE_VICTORIA'; 				-- Let's see how placement is first.

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_LAKE_VICTORIA','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_LAKE_VICTORIA',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NW_LAKE_VICTORIA_POLLUTED','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',50,1,'true','false','false',30,1,10,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_LAKE_VICTORIA',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_1','CITY_EVENT_NW_LAKE_VICTORIA'),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_2','CITY_EVENT_NW_LAKE_VICTORIA'),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3a','CITY_EVENT_NW_LAKE_VICTORIA'),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3b','CITY_EVENT_NW_LAKE_VICTORIA_POLLUTED'),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_4','CITY_EVENT_NW_LAKE_VICTORIA');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- Dummy Building for Lake Victoria Events 3a & 4
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_LAKE_VICTORIA_DUMMY','BUILDING_LAKE_VICTORIA_DUMMY'),
('BUILDINGCLASS_LAKE_VICTORIA_DUMMY2','BUILDING_LAKE_VICTORIA_DUMMY2');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas) VALUES
('BUILDING_LAKE_VICTORIA_DUMMY','BUILDINGCLASS_LAKE_VICTORIA_DUMMY','TXT_KEY_BUILDING_LAKE_VICTORIA_DUMMY','TXT_KEY_BUILDING_LAKE_VICTORIA_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS'),
('BUILDING_LAKE_VICTORIA_DUMMY2','BUILDINGCLASS_LAKE_VICTORIA_DUMMY2','TXT_KEY_BUILDING_LAKE_VICTORIA_DUMMY','TXT_KEY_BUILDING_LAKE_VICTORIA_DUMMY2_HELP',-1,-1,1,0,1,1,'CE123_ATLAS');

INSERT INTO Building_RiverPlotYieldChanges(BuildingType,YieldType,Yield) VALUES
('BUILDING_LAKE_VICTORIA_DUMMY','YIELD_GOLD',1),
('BUILDING_LAKE_VICTORIA_DUMMY2','YIELD_GOLD',1),
('BUILDING_LAKE_VICTORIA_DUMMY2','YIELD_PRODUCTION',1);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_LAKE_VICTORIA_DUMMY','Lake Victoria River Trade');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_LAKE_VICTORIA_DUMMY_HELP','Adds +1 [ICON_GOLD] Gold to river tiles.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_LAKE_VICTORIA_DUMMY2_HELP','Adds +1 [ICON_GOLD] Gold and +1 [ICON_PRODUCTION] Production to river tiles.');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings 
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_1','TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_1','TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_2','TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_2','TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,'ERA_MEDIEVAL','false','false',NULL,NULL,NULL,'false','false','TECH_CURRENCY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- No immediate negative event for selecting Event Choice 3.
-- Selecting Event Choice 3 eventually will cause Lake Victoria to be polluted with a second City Event.
-- Event Choice 4 cannot be selected until after the pollution.
--------------------------------------------------------------------------------------------------

('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3a_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',10,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_INDUSTRIALIZATION',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_LAKE_VICTORIA_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3b_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_4','TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_4','TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_ELECTRICITY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','BUILDINGCLASS_LAKE_VICTORIA_DUMMY','BUILDINGCLASS_LAKE_VICTORIA_DUMMY2',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_LAKE_VICTORIA_POLLUTED',NULL,NULL,NULL,'CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3a','false','true','true');

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3b','false','true','true');

-- INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_1','FEATURE_LAKE_VICTORIA','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_1','FEATURE_LAKE_VICTORIA','YIELD_TOURISM',1),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3a','FEATURE_LAKE_VICTORIA','YIELD_FOOD',-6),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_4','FEATURE_LAKE_VICTORIA','YIELD_FOOD',6);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_2','IMPROVEMENT_TRADING_POST','YIELD_SCIENCE',1),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_2','IMPROVEMENT_CUSTOMS_HOUSE','YIELD_SCIENCE',1),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_4','IMPROVEMENT_FARM','YIELD_FOOD',2);

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

-- INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_2','UNIT_EXPLORER',1);

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_2','FLAVOR_SCIENCE',20),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3a','FLAVOR_RECON',20),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3a','FLAVOR_GOLD',5),
('CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_4','FLAVOR_GROWTH',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_DESCRIPTION','Dr Livingstone, I Presume');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_HELP','Sovereign, the Comissioner of the Lakeside Water Authority is here with a two-and-a-half step plan for encouraging investment in our City. We just need you to sign some papers for us that I have brought along.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_1', 'We like to call this a half-step because it isn''t quite as clear. For this half-step, we are recommending that we reach out to the geological and scientific communities and push the idea that this is our ''Great Lake''. People would start talking about the site different, more Wonder-like and, after all, all publicity is good publicity.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_1_HELP','I like it! Our own ''Great Lake''. Let the records show that Lake Victoria is a Great Lake.[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_2','Sir, there has been some dispute as to the range of the Great Lake''s watershed. The Water Authority believes we should commission a geological survey and hire some scientists to help us figure out where all this water is going.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_2_HELP','[NEWLINE][NEWLINE]A new Explorer appears near the City. Local towns and villages also gain 1 [ICON_RESEARCH] Science.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3a','Lord, the area around the Great Lake is thriving, and our City is continuing to grow. With all this growth, we need more food. Our fisheries are proposing that we introduce a new kind of fish into its waters that is known to grow larger and faster than anything we currently have. It should help the economy all across the region.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3a_HELP','Ehhh....I don''t know about that. But you are the experts, and you need to know what you don''t know. Go ahead and give it a shot.[NEWLINE][NEWLINE]River tiles around the City gain 1 [ICON_GOLD] Gold.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3b','Lake Victoria Polluted!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_3b_HELP','Farming and industrial pollutants continue to be dumped into Lake Victoria. Between the pollutants and the new species of fish wrecking havoc with the Lake''s delicate ecosytem, the Natural Wonder loses 6 [ICON_FOOD] Food!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_4','Sir, I want to humbly apologize for that latest mishap and express my overwhelming gratitude that you didn''t force me to resign. The Water Authority has come up with a final step that should help alleviate all of the earlier problems. We would like to use waters from the Great Lake to help both with the irrigation of local farms and development of new industry. We also think we can help develop new fisheries using native species to repair the damage from the last experiment. This time, we will make sure all the environmental checks are in place to prevent another disaster like before. Use lake to boost food and production.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_LAKE_VICTORIA_CHOICE_4_HELP','I hesitate to say yes, but I fail to see how this can be a bigger disaster than last time. You may proceed...cautiously.[NEWLINE][NEWLINE]As a result, the City''s Farms earn 2 more [ICON_FOOD] Food, and the Natural Wonder gains 6 [ICON_FOOD] Food. Local river tiles also gain 1 [ICON_PRODUCTION] Production.');