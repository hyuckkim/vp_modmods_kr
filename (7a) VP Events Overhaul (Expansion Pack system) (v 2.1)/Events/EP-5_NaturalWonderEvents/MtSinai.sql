-- MT SINAI --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_MT_SINAI','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_MT_SINAI_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_MT_SINAI_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_MT_SINAI',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_MT_SINAI_CHOICE_1','CITY_EVENT_NW_MT_SINAI'),
('CITY_EVENT_NW_MT_SINAI_CHOICE_2','CITY_EVENT_NW_MT_SINAI'),
('CITY_EVENT_NW_MT_SINAI_CHOICE_3','CITY_EVENT_NW_MT_SINAI'),
('CITY_EVENT_NW_MT_SINAI_CHOICE_4','CITY_EVENT_NW_MT_SINAI');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- Dummy Building for Mt Sinai Event 3
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_MT_SINAI_CHURCH','BUILDING_MT_SINAI_CHURCH');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas,PortraitIndex,ReligiousUnrestFlatReduction,FreeBuildingThisCity) VALUES
('BUILDING_MT_SINAI_CHURCH','BUILDINGCLASS_MT_SINAI_CHURCH','TXT_KEY_BUILDING_MT_SINAI_CHURCH','TXT_KEY_BUILDING_MT_SINAI_CHURCH_HELP',-1,-1,1,0,1,1,'COMMUNITY_ATLAS',3,-5,'BUILDINGCLASS_CHURCH');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_MT_SINAI_CHURCH','Temple Mount Church');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_MT_SINAI_CHURCH_HELP','Causes 5 local Unhappiness due to Religious Unrest.');
--------------------------------------------------------------------------------------------------
-- End Dummy Building
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_MT_SINAI_CHOICE_1','TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_1','TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_SINAI_CHOICE_2','TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_2','TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_WRITING',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_SYNAGOGUE',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_SINAI_CHOICE_3','TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_3','TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_3_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_CHIVALRY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','true','false','false','false','BUILDINGCLASS_SYNAGOGUE','BUILDINGCLASS_CHURCH',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_SINAI_CHOICE_4','TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_4','TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,'ERA_MEDIEVAL','false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'true',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_MOSQUE',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_MT_SINAI_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_MT_SINAI_CHOICE_3','false','true','true');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_MT_SINAI_CHOICE_4','YIELD_FAITH',500);

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_MT_SINAI_CHOICE_1','FEATURE_MT_SINAI','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_MT_SINAI_CHOICE_1','FEATURE_MT_SINAI','YIELD_TOURISM',1);

-- INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_NW_MT_SINAI_CHOICE_2','RESOURCE_WINE',1);

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES
('CITY_EVENT_NW_MT_SINAI_CHOICE_4','UNIT_PROPHET',1);

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_MT_SINAI_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_MT_SINAI_CHOICE_2','FLAVOR_RELIGION',20),
('CITY_EVENT_NW_MT_SINAI_CHOICE_2','FLAVOR_PRODUCTION',20),
('CITY_EVENT_NW_MT_SINAI_CHOICE_3','FLAVOR_RELIGION',20),
('CITY_EVENT_NW_MT_SINAI_CHOICE_3','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_MT_SINAI_CHOICE_4','FLAVOR_RELIGION',20),
('CITY_EVENT_NW_MT_SINAI_CHOICE_4','FLAVOR_SCIENCE',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_SINAI_DESCRIPTION','The Holy Mountain of God');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_SINAI_HELP','Gracious Ruler! There appears to be some kind of religious happenings over near Mount Sinai. We might want to take a look and see what''s going on.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_1', 'A man claiming to be the prophet of God has come from Mount Sinai. He is saying something about signs and wonders.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_1_HELP','We are people of God? That''s got to be good news, right?[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_2','I hear that the man from the Mountain is saying someting about how God reached down from the heavens and blessed man with knowledge atop Mt Sinai');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_2_HELP','A burning bush? Columns of smoke and fire? What are you talking about? [NEWLINE][NEWLINE]A new Synagogue is built in the City and you acquire one copy of [ICON_RES_WINE] Wine.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_3','I just heard that group of knights just showed up near Mt Sinai and forcefully took over the area. It looks like they follow some other religion and burned the Synagogue to the ground.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_3_HELP','It''s too late for us to do anything about it now. ''Not for us, My Lord, not for us, but to your Name give the glory''[NEWLINE][NEWLINE]A new Church is built in the City. Unfortunately, the chaos destroys the City''s Synagogue, and religious factions earn the City 5 Unhappiness due to Religious Unrest.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_4','Yet another individual has come down from the mountaintop. He said something about visits from angels. He is calling himself the true Messenger of God.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_SINAI_CHOICE_4_HELP','I heard a wise man say, ''Whoever goes out in search of knowledge is on the Path of God until returning.'' Let us build a second place of worship at the site to honor this individual.[NEWLINE][NEWLINE]A new Mosque is built alongside the Church, and a Great Prophet appears!');