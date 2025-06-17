-- ROCK OF GIBRALTAR --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_GIBRALTAR','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_GIBRALTAR_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_GIBRALTAR_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_GIBRALTAR',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NW_GIBRALTAR_BAD','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',50,1,'true','false','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_GIBRALTAR',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_GIBRALTAR_CHOICE_1','CITY_EVENT_NW_GIBRALTAR'),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_2','CITY_EVENT_NW_GIBRALTAR'),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_3a','CITY_EVENT_NW_GIBRALTAR'),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_3b','CITY_EVENT_NW_GIBRALTAR_BAD'),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_4','CITY_EVENT_NW_GIBRALTAR');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- Dummy Building for Gibraltar Event 4
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_GIBRALTAR_DEFENSE','BUILDING_GIBRALTAR_DEFENSE');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas,PortraitIndex,FreeBuildingThisCity,BorderObstacleWater) VALUES
('BUILDING_GIBRALTAR_DEFENSE','BUILDINGCLASS_GIBRALTAR_DEFENSE','TXT_KEY_BUILDING_GIBRALTAR_DEFENSE','TXT_KEY_BUILDING_GIBRALTAR_DEFENSE_HELP',-1,-1,1,0,1,1,'COMMUNITY_ATLAS',18,'BUILDINGCLASS_THEATRE',1);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_GIBRALTAR_DEFENSE','Gibraltar Defense System');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_GIBRALTAR_DEFENSE_HELP','Enemy naval ships lose all movement when entering city tiles.');
--------------------------------------------------------------------------------------------------
-- End Dummy Building
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_GIBRALTAR_CHOICE_1','TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_1','TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_GIBRALTAR_CHOICE_2','TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_2','TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_CONSTRUCTION',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_CASTLE',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- No immediate negative effect for selecting Event Choice 3.
-- Selecting Event Choice 3 eventually will result in a second City Event, this one bad.
-- Event Choice 4 cannot be selected until the later bad Event.
--------------------------------------------------------------------------------------------------

('CITY_EVENT_NW_GIBRALTAR_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_3a_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_COMPASS',NULL,'false',NULL,NULL,'false','BUILDINGCLASS_HARBOR',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_GIBRALTAR_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_3b_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'true','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','BUILDINGCLASS_HARBOR',NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_GIBRALTAR_CHOICE_4','TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_4','TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_NAVIGATION',NULL,'false',NULL,NULL,'false','BUILDINGCLASS_HARBOR',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_GIBRALTAR_DEFENSE',10,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_GIBRALTAR_BAD',NULL,NULL,NULL,'CITY_EVENT_NW_GIBRALTAR_CHOICE_3a','false','true','true');

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_GIBRALTAR_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_GIBRALTAR_CHOICE_3b','false','true','true');

-- INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_GIBRALTAR_CHOICE_3b','YIELD_POPULATION',-1);

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_GIBRALTAR_CHOICE_2','BUILDINGCLASS_CASTLE','YIELD_CULTURE',2),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_3b','BUILDINGCLASS_CASTLE','YIELD_CULTURE',-2),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_4','BUILDINGCLASS_THEATRE','YIELD_CULTURE',2),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_4','BUILDINGCLASS_THEATRE','YIELD_SCIENCE',2);

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_GIBRALTAR_CHOICE_1','FEATURE_GIBRALTAR','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_1','FEATURE_GIBRALTAR','YIELD_TOURISM',1);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_GIBRALTAR_CHOICE_2','IMPROVEMENT_FISHING_BOATS','YIELD_GOLD',1);

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

-- INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES
('CITY_EVENT_NW_GIBRALTAR_CHOICE_3a','UNIT_GREAT_ADMIRAL',1);

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_GIBRALTAR_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_2','FLAVOR_DEFENSE',20),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_2','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_3a','FLAVOR_GREAT_PEOPLE',20),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_3a','FLAVOR_NAVAL',20),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_4','FLAVOR_DEFENSE',20),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_4','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_GIBRALTAR_CHOICE_4','FLAVOR_SCIENCE',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GIBRALTAR_DESCRIPTION','On this solid Rock, I''ll stand...');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GIBRALTAR_HELP','Sir, your Defense Ministry have turned in their latest reports for the Rock of Gibraltar? Shall I summarize them for you?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_1', 'Reports from Royal Gibraltar Regiment are that things over there are ''solid as the Rock of Gibraltar'' They are telling us that, ''No enemy shall expel us.''');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_1_HELP','''Solid as the Rock of Gibraltar''...''No enemy shall expel us.''...I like that. Let''s use the second phrase as the new motto for the Regiment.[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_2','Their engineers are telling us that the Rock seems like a prime site for boosting our City defenses.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_2_HELP','Not a bad idea...let''s build a new Castle there. But I want to throw ocean-themed parties there, so make it nice![NEWLINE][NEWLINE]As a result, a new Castle is built that provides +2 [ICON_CULTURE] Culture. The extra security also results in a +1 [ICON_GOLD] Gold increase for all Fishing Boats.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_3a','One minister has been heard bragging that the Rock cannot be taken by force.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_3a_HELP','A wise man builds his house on the Rock. He is right to brag! Give him a promotion.[NEWLINE][NEWLINE]A [ICON_GREAT_ADMIRAL] Great Admiral appears near the City.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_3b','Gibraltar Attacked!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_3b_HELP','The City around Gibraltar has been attacked. The Harbor is destroyed, and there is reported to be widespread damage in the City. We have even lost {2_InstantYield}. Refocusing our attention at the Castle as resulted in the loss of 2 [ICON_CULTURE] Culture for the building.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_4','To strengthening our City''s defenses after that cowardly attack, our Defense Ministry has improved our Harbor to slow down any incoming naval vessels. The variety of local flora and fauna has also inspired our Science and Culture Ministries to help boost morale in the City by building a new Zoo.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GIBRALTAR_CHOICE_4_HELP','I''m just glad we were able to hold the City. Tell them to proceed with construction. And thank the other two Ministries for me![NEWLINE][NEWLINE]All enemy ships entering the City''s borders immediate lose any remaining movements for that turn.  A new Zoo is built with +2 [ICON_RESEARCH] Science and +2 [ICON_CULTURE] Culture.');