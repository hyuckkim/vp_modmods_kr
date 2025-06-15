-- POTOSI --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_POTOSI','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_POTOSI_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_POTOSI_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_POTOSI',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NW_POTOSI_BAD','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',50,1,'true','false','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_POTOSI',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_POTOSI_CHOICE_1','CITY_EVENT_NW_POTOSI'),
('CITY_EVENT_NW_POTOSI_CHOICE_2','CITY_EVENT_NW_POTOSI'),
('CITY_EVENT_NW_POTOSI_CHOICE_3a','CITY_EVENT_NW_POTOSI'),
('CITY_EVENT_NW_POTOSI_CHOICE_3b','CITY_EVENT_NW_POTOSI_BAD'),
('CITY_EVENT_NW_POTOSI_CHOICE_4','CITY_EVENT_NW_POTOSI');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- Dummy Building for Potosi Events 3 & 4
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_POTOSI_DUMMY','BUILDING_POTOSI_DUMMY'),
('BUILDINGCLASS_POTOSI_DUMMY2','BUILDING_POTOSI_DUMMY2');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas,SpecialistType,SpecialistCount) VALUES
('BUILDING_POTOSI_DUMMY','BUILDINGCLASS_POTOSI_DUMMY','TXT_KEY_BUILDING_POTOSI_DUMMY','TXT_KEY_BUILDING_POTOSI_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS',NULL,0),
('BUILDING_POTOSI_DUMMY2','BUILDINGCLASS_POTOSI_DUMMY2','TXT_KEY_BUILDING_POTOSI_DUMMY2','TXT_KEY_BUILDING_POTOSI_DUMMY2_HELP',-1,-1,1,0,1,1,'CE123_ATLAS','SPECIALIST_MERCHANT',1);

INSERT INTO Building_YieldChangesPerPop(BuildingType,YieldType,Yield) VALUES
('BUILDING_POTOSI_DUMMY','YIELD_PRODUCTION',20),
('BUILDING_POTOSI_DUMMY2','YIELD_PRODUCTION',20);

INSERT INTO Building_SpecificGreatPersonRateModifier(BuildingType,SpecialistType,Modifier) VALUES
('BUILDING_POTOSI_DUMMY2','SPECIALIST_MERCHANT',10);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_POTOSI_DUMMY','Forge Enhancements');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_POTOSI_DUMMY_HELP', 'Boosts [ICON_PRODUCTION] Production by 2 for every 10 [ICON_CITIZEN] Citizens in the City.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_POTOSI_DUMMY2','Potosi Mining Company');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_POTOSI_DUMMY2_HELP','Provides an additional [ICON_VP_MERCHANT] Merchant slot in the City and 10% bonus to local [ICON_GREAT_MERCHANT] Great Merchant growth.');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings 
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_POTOSI_CHOICE_1','TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_1','TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_POTOSI_CHOICE_2','TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_2','TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_IRON_WORKING',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- No immediate negative effect for selecting Event Choice 3.
-- Selecting Event Choice 3 eventually will result in a second City Event, this one bad.
-- Event Choice 4 cannot be selected until the later bad Event.
--------------------------------------------------------------------------------------------------

('CITY_EVENT_NW_POTOSI_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_3a_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',9,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_MACHINERY',NULL,'false',NULL,NULL,'false','BUILDINGCLASS_FORGE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_POTOSI_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_POTOSI_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_3b_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',9,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,5,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_POTOSI_CHOICE_4','TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_4','TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_BANK',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_POTOSI_DUMMY2',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_POTOSI_BAD',NULL,NULL,NULL,'CITY_EVENT_NW_POTOSI_CHOICE_3a','false','true','true');

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_POTOSI_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_POTOSI_CHOICE_3b','false','true','true');

-- INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_POTOSI_CHOICE_3b','YIELD_POPULATION',-2);

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_POTOSI_CHOICE_1','FEATURE_POTOSI','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_POTOSI_CHOICE_1','FEATURE_POTOSI','YIELD_TOURISM',1);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_POTOSI_CHOICE_2','IMPROVEMENT_MINE','YIELD_PRODUCTION',1),
('CITY_EVENT_NW_POTOSI_CHOICE_3a','IMPROVEMENT_FARM','YIELD_FOOD',1),
('CITY_EVENT_NW_POTOSI_CHOICE_3b','IMPROVEMENT_MINE','YIELD_PRODUCTION',-1),
('CITY_EVENT_NW_POTOSI_CHOICE_4','IMPROVEMENT_MINE','YIELD_PRODUCTION',1);

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES
('CITY_EVENT_NW_POTOSI_CHOICE_3a','SPECIALIST_ENGINEER',150);

INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_POTOSI_CHOICE_4','SPECIALIST_MERCHANT','YIELD_CULTURE',1);

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_NW_POTOSI_CHOICE_2','RESOURCE_SILVER',2);

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_POTOSI_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_POTOSI_CHOICE_2','FLAVOR_HAPPINESS',20),
('CITY_EVENT_NW_POTOSI_CHOICE_2','FLAVOR_PRODUCTION',10),
('CITY_EVENT_NW_POTOSI_CHOICE_3a','FLAVOR_PRODUCTION',10),
('CITY_EVENT_NW_POTOSI_CHOICE_3a','FLAVOR_PRODUCTION',10),
('CITY_EVENT_NW_POTOSI_CHOICE_4','FLAVOR_GOLD',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_POTOSI_DESCRIPTION','Villa Imperial de Potosí');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_POTOSI_HELP','Su Majestad, news from the Potosi mines...');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_1', 'I have heard that people are now saying ''to be worth a Potosi'' when talking about things of great value. It seems that our Potosi mines has become renowned.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_1_HELP','Renowned? Maybe I should change my name to Potosi.[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_2','We have discovered silver! We just need some workers now, and  Where do you think we could find these workers?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_2_HELP','You need workers? There are people all around. I am authorizing you to conscript one out of every seven adult males to work in the mines.[NEWLINE][NEWLINE]The City gains 2 copies of [ICON_RES_SILVER] Silver, and local mines increase [ICON_PRODUCTION] Production by 1.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_3a','The forge master at the City has developed a method to simplify extraction of the precious Silver ore of the mountain. We should be able to devote more labor to our farms now.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_3a_HELP','Excellent news! Give this man a raise.[NEWLINE][NEWLINE]Enhancements to the City''s Forge now boost [ICON_PRODUCTION] Production by 2 for every 10 [ICON_CITIZEN] Citizens. Additionally, Farms in the area increase yields by +1 [ICON_FOOD] Food.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_3b','Miner''s Revolt!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_3b_HELP','After losing 2 [ICON_CITIZEN] Citizens in the mines, the conscripted miners at Potosi have revolted due to the harsh working conditions. The City is in rebellion, and Mines have lost 1 [ICON_PRODUCTION] Production.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_4','With your permission, the Potosi Mining Company has agreed to step in and take over the mines. They''ve also formed a joint venture with the local Bank which should prove beneficial.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_POTOSI_CHOICE_4_HELP','And who said all banks were bad? Give them my permission.[NEWLINE][NEWLINE]Changes instituted by the Potosi Mining Company have increased Mine [ICON_PRODUCTION] by +1 and given you an additional [ICON_VP_MERCHANT] Merchant slot in the City, as well as a 10% bonus to local [ICON_GREAT_MERCHANT] Great Merchant growth. Given the cultural significance of the area, [ICON_VP_MERCHANT] Merchants also gain +1 [ICON_CULTURE] Culture.');