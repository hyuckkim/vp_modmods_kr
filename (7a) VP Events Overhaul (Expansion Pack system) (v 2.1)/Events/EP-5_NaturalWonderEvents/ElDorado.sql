-- EL DORADO --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_EL_DORADO','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_EL_DORADO_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_EL_DORADO_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_EL_DORADO',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NW_EL_DORADO_BAD1','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',50,1,'true','false','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_EL_DORADO',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NW_EL_DORADO_BAD2','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',50,1,'true','false','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_EL_DORADO',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NW_EL_DORADO_BAD3','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',50,1,'true','false','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_EL_DORADO',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NW_EL_DORADO_BAD4','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',50,1,'true','false','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_EL_DORADO',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_EL_DORADO_CHOICE_1','CITY_EVENT_NW_EL_DORADO'),
('CITY_EVENT_NW_EL_DORADO_CHOICE_2','CITY_EVENT_NW_EL_DORADO'),
('CITY_EVENT_NW_EL_DORADO_CHOICE_3','CITY_EVENT_NW_EL_DORADO'),
('CITY_EVENT_NW_EL_DORADO_BAD_CHOICE','CITY_EVENT_NW_EL_DORADO_BAD1'),
('CITY_EVENT_NW_EL_DORADO_BAD_CHOICE','CITY_EVENT_NW_EL_DORADO_BAD2'),
('CITY_EVENT_NW_EL_DORADO_BAD_CHOICE','CITY_EVENT_NW_EL_DORADO_BAD3'),
('CITY_EVENT_NW_EL_DORADO_BAD_CHOICE','CITY_EVENT_NW_EL_DORADO_BAD4'),
('CITY_EVENT_NW_EL_DORADO_CHOICE_4','CITY_EVENT_NW_EL_DORADO');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- Dummy Building for El Dorado Events 3 & 4
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_ELDORADO_DUMMY','BUILDING_ELDORADO_DUMMY'),
('BUILDINGCLASS_ELDORADO_DUMMY2','BUILDING_ELDORADO_DUMMY2');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas,SpecialistType,SpecialistCount) VALUES
('BUILDING_ELDORADO_DUMMY','BUILDINGCLASS_ELDORADO_DUMMY','TXT_KEY_BUILDING_ELDORADO_DUMMY','TXT_KEY_BUILDING_ELDORADO_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS','SPECIALIST_MERCHANT',1),
('BUILDING_ELDORADO_DUMMY2','BUILDINGCLASS_ELDORADO_DUMMY2','TXT_KEY_BUILDING_ELDORADO_DUMMY','TXT_KEY_BUILDING_ELDORADO_DUMMY2_HELP',-1,-1,1,0,1,1,'CE123_ATLAS','SPECIALIST_MERCHANT',1);

INSERT INTO Building_SpecificGreatPersonRateModifier(BuildingType,SpecialistType,Modifier) VALUES
('BUILDING_ELDORADO_DUMMY2','SPECIALIST_MERCHANT',10);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_ELDORADO_DUMMY', 'City of Gold Merchant');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_ELDORADO_DUMMY_HELP', 'Provides an additional [ICON_VP_MERCHANT] Merchant slot in the City.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_ELDORADO_DUMMY2_HELP', 'Provides an additional [ICON_VP_MERCHANT] Merchant slot in the City and 10% bonus to local [ICON_GREAT_MERCHANT] Great Merchant growth.');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings 
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_EL_DORADO_CHOICE_1','TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_1','TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_EL_DORADO_CHOICE_2','TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_2','TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_CURRENCY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_EL_DORADO_CHOICE_3','TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_3','TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_3_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_BANK',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_ELDORADO_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_EL_DORADO_BAD_CHOICE','TXT_KEY_CITY_EVENT_NW_EL_DORADO_BAD_CHOICE','TXT_KEY_CITY_EVENT_NW_EL_DORADO_BAD_CHOICE_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',10,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,6,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_EL_DORADO_CHOICE_4','TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_4','TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_ARCHAEOLOGY',NULL,'false',NULL,NULL,'false','BUILDINGCLASS_UNIVERSITY',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','BUILDINGCLASS_ELDORADO_DUMMY','BUILDINGCLASS_ELDORADO_DUMMY2',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_EL_DORADO_BAD1',NULL,NULL,NULL,'CITY_EVENT_NW_EL_DORADO_CHOICE_3','false','true','true'),
('CITY_EVENT_NW_EL_DORADO_BAD2',NULL,NULL,'CITY_EVENT_NW_EL_DORADO_BAD1',NULL,'false','true','true'),
('CITY_EVENT_NW_EL_DORADO_BAD3',NULL,NULL,'CITY_EVENT_NW_EL_DORADO_BAD2',NULL,'false','true','true'),
('CITY_EVENT_NW_EL_DORADO_BAD4',NULL,NULL,'CITY_EVENT_NW_EL_DORADO_BAD3',NULL,'false','true','true');

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_EL_DORADO_CHOICE_4',NULL,NULL,'CITY_EVENT_NW_EL_DORADO_BAD4',NULL,'false','true','true');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_EL_DORADO_CHOICE_3','YIELD_POPULATION',2),
('CITY_EVENT_NW_EL_DORADO_CHOICE_4','YIELD_GOLD',400);

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_EL_DORADO_CHOICE_4','BUILDINGCLASS_UNIVERSITY','YIELD_SCIENCE',1),
('CITY_EVENT_NW_EL_DORADO_CHOICE_4','BUILDINGCLASS_UNIVERSITY','YIELD_CULTURE',1);

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_EL_DORADO_CHOICE_1','FEATURE_EL_DORADO','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_EL_DORADO_CHOICE_1','FEATURE_EL_DORADO','YIELD_TOURISM',1);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_EL_DORADO_CHOICE_2','IMPROVEMENT_MINE','YIELD_GOLD',2);

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

INSERT INTO CityEventChoice_ResourceQuantity(CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_NW_EL_DORADO_CHOICE_2','RESOURCE_GOLD',1);

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_EL_DORADO_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_EL_DORADO_CHOICE_2','FLAVOR_GOLD',20),
('CITY_EVENT_NW_EL_DORADO_CHOICE_3','FLAVOR_GOLD',20),
('CITY_EVENT_NW_EL_DORADO_CHOICE_3','FLAVOR_GREAT_PEOPLE',20),
('CITY_EVENT_NW_EL_DORADO_CHOICE_3','FLAVOR_GROWTH',-10),
('CITY_EVENT_NW_EL_DORADO_CHOICE_4','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_EL_DORADO_CHOICE_4','FLAVOR_SCIENCE',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_EL_DORADO_DESCRIPTION', 'A City of Gold!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_EL_DORADO_HELP', 'The curator of the El Dorado Historical Society announces the successful completion of the latest stage of the excavation of El Dorado.[NEWLINE][NEWLINE]There are several avenues open to us now, how do you wish to proceed?[NEWLINE]');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_1', 'The curator believes the further restoration of the site could win the accolades of the public.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_1_HELP', 'I am in agreement. You may proceed as requested.[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_2', 'He would like to inform you that they have discovered an untapped seam of gold running through El Dorado.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_2_HELP', 'There is still gold on that site? Get everyone to digging![NEWLINE][NEWLINE]You gain one copy of [ICON_RES_GOLD] Gold. In addition, local mines now produce an extra +2 [ICON_GOLD] Gold.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_3', 'The curator says there is a major need for new people to work the El Dorado mines. A local banking group has offered to step in and help finance the venture if you can provide more laborers.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_3_HELP', 'I said get everyone to digging. I meant EVERYONE.[NEWLINE][NEWLINE]Forced labor and mining conditions cost the City {1_YieldCost}. However, the City gains another [ICON_VP_MERCHANT] Merchant slot.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_EL_DORADO_BAD_CHOICE', 'Local uprising!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_EL_DORADO_BAD_CHOICE_HELP', 'The forced labor conditions at El Dorado have resulted in a local uprising. Rebels are attacking the City.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_4', 'The Society is happy to inform you that they have recruited a major researcher who wants to start a department at the University dedicated to the study of the City of Gold. Unfortunately there isn''t any more room in the budget for a new position.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_EL_DORADO_CHOICE_4_HELP', 'That this wonderous city could rise and fall before we were even aware of its existence is incredible. What else remains lost to the jungle? I must know! We will fund the new position. [NEWLINE][NEWLINE]After providing {1_YieldCost} in new funding, the local University gains +1 [ICON_RESEARCH] Science and +1 [ICON_CULTURE] Culture. There is also a 10% bonus to local [ICON_GREAT_MERCHANT] Great Merchant growth.');