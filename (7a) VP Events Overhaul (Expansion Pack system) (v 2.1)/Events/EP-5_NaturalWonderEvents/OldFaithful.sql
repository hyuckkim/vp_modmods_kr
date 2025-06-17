-- OLD FAITHFUL --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_OLD_FAITHFUL','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_GEYSER',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_1','CITY_EVENT_NW_OLD_FAITHFUL'),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2','CITY_EVENT_NW_OLD_FAITHFUL'),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3','CITY_EVENT_NW_OLD_FAITHFUL'),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','CITY_EVENT_NW_OLD_FAITHFUL');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- Dummy Building for Old Faithful Event 4
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_OLD_FAITHFUL_DUMMY','BUILDING_OLD_FAITHFUL_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas,SpecialistType,SpecialistCount) VALUES
('BUILDING_OLD_FAITHFUL_DUMMY','BUILDINGCLASS_OLD_FAITHFUL_DUMMY','TXT_KEY_BUILDING_OLD_FAITHFUL_DUMMY','TXT_KEY_BUILDING_OLD_FAITHFUL_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS','SPECIALIST_SCIENTIST',1);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_OLD_FAITHFUL_DUMMY','Yellowstone Geological Survey Center');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_OLD_FAITHFUL_DUMMY_HELP','Provides an additional [ICON_VP_SCIENTIST] Scientist slot in the City.');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings 
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_1','TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_1','TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2','TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2','TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_CURRENCY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3','TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3','TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_MACHINERY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_RAILROAD',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_OLD_FAITHFUL_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3','false','true','true');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3','YIELD_GOLD',400);

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_1','FEATURE_GEYSER','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_1','FEATURE_GEYSER','YIELD_TOURISM',1),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3','FEATURE_GEYSER','YIELD_CULTURE',-2),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3','FEATURE_GEYSER','YIELD_SCIENCE',-2);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3','IMPROVEMENT_PASTURE','YIELD_PRODUCTION',1),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3','IMPROVEMENT_LUMBERMILL','YIELD_PRODUCTION',1),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','IMPROVEMENT_CAMP','YIELD_SCIENCE',1),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','IMPROVEMENT_PASTURE','YIELD_TOURISM',1),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','IMPROVEMENT_CAMP','YIELD_SCIENCE',1),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','IMPROVEMENT_PASTURE','YIELD_TOURISM',1),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','IMPROVEMENT_LUMBERMILL','YIELD_PRODUCTION',-2),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','IMPROVEMENT_QUARRY','YIELD_PRODUCTION',-2);

INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2','RESOURCE_BISON','YIELD_GOLD',1),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2','RESOURCE_HORSE','YIELD_GOLD',1),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2','RESOURCE_SHEEP','YIELD_GOLD',1);

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','SPECIALIST_SCIENTIST',100);

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2','RESOURCE_FUR',1);

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2','FLAVOR_HAPPINESS',20),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2','FLAVOR_GOLD',20),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2','FLAVOR_PRODUCTION',20),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3','FLAVOR_SCIENCE',20),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','FLAVOR_PRODUCTION',-20),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','FLAVOR_SCIENCE',20),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','FLAVOR_GREAT_PEOPLE',40),
('CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','FLAVOR_CULTURE',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_DESCRIPTION','That is a super volcano!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_HELP','News from the Yellowstone Park, sir. The park rangers have come by with an update. Do you want to hear what they have to say?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_1', 'One of the rangers came by to inform you that the expansive cultural history of our park is continuing to be documented, and they found another archeological site.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_1_HELP','I''m smarter than the average bear. And even the average bear could see that this is a good thing.[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2','Our rangers are telling us that we are getting thousands of visitors to the Park interested in all the wildlife in the area. Lions and tigers and bears, oh my! Well, yes bears...no lions or tigers. We also have bison and cougars and wolves and elk and....');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_2_HELP','[ICON_RES_SHEEP] Sheep, [ICON_RES_BISON] Bison, and [ICON_RES_HORSE] Horses around the City gain an extra +1 [ICON_GOLD] Gold.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3','Sir, I regret to inform you that we have seen evidence of illegal poaching and mining in the region. We are doing our best to catch the guilty parties.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_3_HELP','After spending {1_YieldCost}, the Pastures and Lumbermills around the Geyser earn an extra +1 [ICON_PRODUCTION] Production; however, the Natural Wonder loses 2 [ICON_CULTURE] Culture and [ICON_RESEARCH] Science.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4','Sir, after that latest snafu, we managed to catch the criminals. We have also put together a team of scientific experts that can help preserve the integrity of the region around Old Faithful. They want us to limit logging and quarrying operations to help prevent any further damage.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_OLD_FAITHFUL_CHOICE_4_HELP','Place restrictions on how much these companies can remove. We must ensure such a bountiful resource is not damaged, accidentally or otherwise.[NEWLINE][NEWLINE]Founding the Yellowstone Geological Survey Center results in {4_GPChange} and provides an additional [ICON_VP_SCIENTIST] Scientist slot in the City. Local Camps and Pastures also gain +1 [ICON_RESEARCH] Science and [ICON_TOURISM] Tourism, but local Lumbermills and Quarries lose 2 [ICON_PRODUCTION] Production.');
