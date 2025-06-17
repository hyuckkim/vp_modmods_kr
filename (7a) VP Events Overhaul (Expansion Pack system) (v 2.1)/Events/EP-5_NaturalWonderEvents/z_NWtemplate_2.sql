-- NATURAL WONDER NAME --

--------------------------------------------------------------------------------------------------
-- Use this version of the template when you want a non-immediate negative impact for Event Choice 3.
--------------------------------------------------------------------------------------------------

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_NATURALWONDERNAME','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_NAME',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NW_NATURALWONDERNAME_BAD','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',50,1,'true','false','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_NAME',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_1','CITY_EVENT_NW_NATURALWONDERNAME'),
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_2','CITY_EVENT_NW_NATURALWONDERNAME'),
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3a','CITY_EVENT_NW_NATURALWONDERNAME'),
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3b','CITY_EVENT_NW_NATURALWONDERNAME_BAD'),
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_4','CITY_EVENT_NW_NATURALWONDERNAME');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_1','TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_1','TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_2','TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_2','TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- No immediate negative effect for selecting Event Choice 3.
-- Selecting Event Choice 3 eventually will result in a second City Event, this one bad.
-- Event Choice 4 cannot be selected until the later bad Event.
--------------------------------------------------------------------------------------------------

('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3a_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3b_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_4','TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_4','TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_NATURALWONDERNAME_BAD',NULL,NULL,NULL,'CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3a','false','true','true');

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3b','false','true','true');

-- INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_1','FEATURE_NAME','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_1','FEATURE_NAME','YIELD_TOURISM',1);

-- INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

-- INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_2','FLAVOR_PRODUCTION',20),
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3','FLAVOR_SCIENCE',20),
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3','FLAVOR_SCIENCE',20),
('CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_4','FLAVOR_GOLD',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_DESCRIPTION','text text text text');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_HELP','text text text text');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_1', 'This attention can only been good for our City. A new marketing campaign could bring renewed interest in the site.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_1_HELP','Get our tourism department on this as quickly as possible![NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_2','text text text text');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_2_HELP','text text text text');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3a','text text text text');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3a_HELP','text text text text');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3b','text text text text');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_3b_HELP','text text text text');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_4','text text text text');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_NATURALWONDERNAME_CHOICE_4_HELP','text text text text');
