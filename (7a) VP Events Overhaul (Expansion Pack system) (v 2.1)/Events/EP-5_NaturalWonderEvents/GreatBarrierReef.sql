-- GREAT BARRIER REEF --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_GREAT_REEF','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_GREAT_REEF_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_GREAT_REEF_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_REEF',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NW_REEF_DAMAGE','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',50,1,'true','false','false',30,1,10,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_REEF_PROMO1',NULL,'false','false','FEATURE_REEF',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_GREAT_REEF_CHOICE_1','CITY_EVENT_NW_GREAT_REEF'),
('CITY_EVENT_NW_GREAT_REEF_CHOICE_2','CITY_EVENT_NW_GREAT_REEF'),
('CITY_EVENT_NW_GREAT_REEF_CHOICE_3a','CITY_EVENT_NW_GREAT_REEF'),
('CITY_EVENT_NW_GREAT_REEF_CHOICE_3b','CITY_EVENT_NW_REEF_DAMAGE'),
('CITY_EVENT_NW_GREAT_REEF_CHOICE_4','CITY_EVENT_NW_GREAT_REEF');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- Dummy Buildings for Great Barrier Reef Events 3 & 4
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_REEF_PROMO1','BUILDING_REEF_PROMO1'),
('BUILDINGCLASS_REEF_PROMO2','BUILDING_REEF_PROMO2');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas,FreePromotion, TrainedFreePromotion) VALUES
('BUILDING_REEF_PROMO','BUILDINGCLASS_REEF_PROMO1','TXT_KEY_BUILDING_REEF_PROMO1','TXT_KEY_BUILDING_REEF_PROMO1_HELP',-1,-1,1,0,1,1,'CE123_ATLAS','PROMOTION_SUPPLY','PROMOTION_OCEAN_MOVEMENT'),
('BUILDING_REEF_PROMO2','BUILDINGCLASS_REEF_PROMO2','TXT_KEY_BUILDING_REEF_PROMO2','TXT_KEY_BUILDING_REEF_PROMO2_HELP',-1,-1,1,0,1,1,'CE123_ATLAS','PROMOTION_SUPPLY','PROMOTION_OCEAN_MOVEMENT');

INSERT INTO Building_UnitCombatFreeExperiences(BuildingType,UnitCombatType,Experience) VALUES
('BUILDING_REEF_PROMO2','UNITCOMBAT_NAVALRANGED',10),
('BUILDING_REEF_PROMO2','UNITCOMBAT_NAVALMELEE',10),
('BUILDING_REEF_PROMO2','UNITCOMBAT_SUBMARINE',10),
('BUILDING_REEF_PROMO2','UNITCOMBAT_CARRIER',10);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_REEF_PROMO1','Great Barrier Reef Training Facility');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_REEF_PROMO2','Great Barrier Reef Naval College');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_REEF_PROMO1_HELP','Naval Units constructed in this City gain +1 [ICON_MOVES] Movement, and all owned Naval Units can Heal outside Friendly Territory.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_REEF_PROMO2_HELP','Naval Units constructed in this City gain +1 [ICON_MOVES] Movement and 10 extra XP. All owned Naval Units can Heal outside Friendly Territory.');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings 
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_GREAT_REEF_CHOICE_1','TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_1','TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_GREAT_REEF_CHOICE_2','TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_2','TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',75,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_LIGHTHOUSE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- No immediate negative event for selecting Event Choice 3.
-- Selecting Event Choice 3 eventually will cause damage to the Reef with a second City Event.
-- Event Choice 4 cannot be selected until after the damage.
--------------------------------------------------------------------------------------------------

('CITY_EVENT_NW_GREAT_REEF_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_3a_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',75,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_COMPASS',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_REEF_PROMO1',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_GREAT_REEF_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_3b_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','BUILDINGCLASS_REEF_PROMO1',NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_GREAT_REEF_CHOICE_4','TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_4','TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,'ERA_INDUSTRIAL','false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_HARBOR',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_REEF_PROMO2',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_REEF_DAMAGE',NULL,NULL,NULL,'CITY_EVENT_NW_GREAT_REEF_CHOICE_3a','false','true','true');

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_GREAT_REEF_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_GREAT_REEF_CHOICE_3b','false','true','true');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_GREAT_REEF_CHOICE_3a','YIELD_GOLD',200),
('CITY_EVENT_NW_GREAT_REEF_CHOICE_4','YIELD_GOLD',400);

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_GREAT_REEF_CHOICE_1','FEATURE_REEF','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_GREAT_REEF_CHOICE_1','FEATURE_REEF','YIELD_TOURISM',1),
('CITY_EVENT_NW_GREAT_REEF_CHOICE_3b','FEATURE_REEF','YIELD_SCIENCE',-2),
('CITY_EVENT_NW_GREAT_REEF_CHOICE_3b','FEATURE_REEF','YIELD_CULTURE',-2);

-- INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

INSERT INTO CityEventChoice_ResourceQuantity(CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_NW_GREAT_REEF_CHOICE_2','RESOURCE_CRAB',2);

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_GREAT_REEF_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_GREAT_REEF_CHOICE_2','FLAVOR_HAPPINESS',20),
('CITY_EVENT_NW_GREAT_REEF_CHOICE_2','FLAVOR_GOLD',10),
('CITY_EVENT_NW_GREAT_REEF_CHOICE_3a','FLAVOR_NAVAL',30),
('CITY_EVENT_NW_GREAT_REEF_CHOICE_4','FLAVOR_NAVAL',30);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GREAT_REEF_DESCRIPTION','A Sea of Diversity');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GREAT_REEF_HELP','The local fishermen and the sailor''s guild are talking about how we can more greatly utilize the Great Reef, Your Masterfulness. They have a variety of options that they wish to bring to your attention.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_1', 'This attention can only been good for our City. A new marketing campaign could bring renewed interest in the site.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_1_HELP','We appreciate the job these fine fishermen are asked to perform. See to it they are supported with fresh vessels.[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_2','Our fisherman believe they have found a new location teeming with exotic seafood. They want permission to go and retrieve them.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_2_HELP','Sounds delicious...make sure some make it to the Palace kitchens.[NEWLINE][NEWLINE]Gain two copies of [ICON_RES_CRAB] Crab for 75 turns.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_3a','The sailors wish to establish a temporary Naval Training Facility in the local City to deal with the unique challenges presented by the reef.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_3a_HELP','An excellent suggestion! The Palace is happy to finance this venture.[NEWLINE][NEWLINE]Spend {2_InstantYield} on the Naval Training Facility. Naval Units constructed in this City temporarily gain +1 [ICON_MOVES] Movement and all Naval Units can Heal outside Friendly Territory.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_3b','Great Barrier Reef damaged!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_3b_HELP','Naval activies around the Great Barrier Reef have caused irreversible damage to the Natural Wonder. As a result, the Reef loses 2 [ICON_CULTURE] Culture and 2 [ICON_RESEARCH} Science!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_4','The sailors wish to make the temporary Naval Training Facility a permanent Naval College.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GREAT_REEF_CHOICE_4_HELP','It''s a dangerous world out there. We need to stay strong to protect ourselves from our enemies.[NEWLINE][NEWLINE]You spend {2_InstantYield} on the new College. Naval Units constructed in this City permanently gain +1 [ICON_MOVES] Movement and all Naval Units can Heal outside Friendly Territory.');