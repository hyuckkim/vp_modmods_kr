-- MT KAILASH --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_MT_KAILASH','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_MT_KAILASH_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_MT_KAILASH_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_MT_KAILASH',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_MT_KAILASH_CHOICE_1','CITY_EVENT_NW_MT_KAILASH'),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_2','CITY_EVENT_NW_MT_KAILASH'),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_3','CITY_EVENT_NW_MT_KAILASH'),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_4','CITY_EVENT_NW_MT_KAILASH');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- Dummy Building for Mt Kailash Event 4
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_MT_KAILASH_DUMMY','BUILDING_MT_KAILASH_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas,FreePromotion) VALUES
('BUILDING_MT_KAILASH_DUMMY','BUILDINGCLASS_MT_KAILASH_DUMMY','TXT_KEY_BUILDING_MT_KAILASH_DUMMY','TXT_KEY_BUILDING_MT_KAILASH_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS','PROMOTION_ALTITUDE_TRAINING');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_MT_KAILASH_DUMMY','High Altitude Training Facility');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_MT_KAILASH_DUMMY_HELP','Grants Altitude Training Promotion to all owned Units.');
--------------------------------------------------------------------------------------------------
-- End Dummy Building
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_MT_KAILASH_CHOICE_1','TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_1','TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_KAILASH_CHOICE_2','TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_2','TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_CURRENCY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_MANDIR',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_KAILASH_CHOICE_3','TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_3','TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_3_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_THEOLOGY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_KAILASH_CHOICE_4','TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_4','TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_MILITARY_SCIENCE',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_MT_KAILASH_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_MT_KAILASH_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_MT_KAILASH_CHOICE_3','false','true','true');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_MT_KAILASH_CHOICE_3','YIELD_FAITH',200);

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_MT_KAILASH_CHOICE_2','BUILDINGCLASS_MANDIR','YIELD_CULTURE',1);

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_MT_KAILASH_CHOICE_1','FEATURE_MT_KAILASH','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_1','FEATURE_MT_KAILASH','YIELD_TOURISM',1);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_MT_KAILASH_CHOICE_2','IMPROVEMENT_TRADING_POST','YIELD_GOLD',1),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_2','IMPROVEMENT_CUSTOMS_HOUSE','YIELD_GOLD',1),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_3','IMPROVEMENT_TRADING_POST','YIELD_CULTURE',1),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_3','IMPROVEMENT_CUSTOMS_HOUSE','YIELD_CULTURE',1),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_3','IMPROVEMENT_FARM','YIELD_FOOD',-1),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_3','IMPROVEMENT_LUMBERMILL','YIELD_PRODUCTION',-2),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_4','IMPROVEMENT_TRADING_POST','YIELD_TOURISM',1),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_4','IMPROVEMENT_CUSTOMS_HOUSE','YIELD_TOURISM',1);

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
('CITY_EVENT_NW_MT_KAILASH_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_2','FLAVOR_RELIGION',20),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_2','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_2','FLAVOR_GOLD',20),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_3','FLAVOR_CULTURE',30),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_4','FLAVOR_MILITARY_TRAINING',40),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_3','FLAVOR_PRODUCTION',-20),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_3','FLAVOR_GROWTH',-20),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_4','FLAVOR_MILITARY_TRAINING',40),
('CITY_EVENT_NW_MT_KAILASH_CHOICE_4','FLAVOR_CULTURE',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KAILASH_DESCRIPTION','Pillar Of The Earth');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KAILASH_HELP','Honored One, we have a group of pilgrims from lands far away who are here to walk around the base of the Mt Kailash. I thought to bring them here in case you wanted to question them about their holy practices.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_1', 'According to these pilgrims, in their holy traditions, they believe a ''parikrama'', or journey around a holy site, can bring be a spiritually beneficial practice that can bring various positive effects meritorious karma, the cleansing of sins from one''s consciousness, and good fortune.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_1_HELP','How very interesting! And you say that this spiritual pilgrimage is practiced by many different faith groups?[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_2','Yes, people travel to the holy site from many different places to complete a parikrama. Unfortunately, the site itself is particularly remote and inhospitable.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_2_HELP','Well, I must do something about that. Let me build these pilgrims a waystation to help ease their journey.[NEWLINE][NEWLINE]A new Mandir is built in the City. In addition to normal yields, this Mandir gains +1 [ICON_CULTURE] Culture. Local towns and villages also gain +1 [ICON_GOLD] Gold.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_3','Sire! Sire! The number of pilgrims coming to the Mountain is getting out of hand. It is getting so crowded that local farmers and saw mills are starting to complain about the traffic in the area.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_3_HELP','We cannot prevent these pilgrims from making this journey. Offer a stipend to the farmers and mills to relocate to a different area.[NEWLINE][NEWLINE]After spending {1_YieldCost}, local towns and villages gain +1 [ICON_CULTURE] Culture; however, local Lumbermills lose 2 [ICON_PRODUCTION] Production, and local Farms lose 1 [ICON_FOOD] Food.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_4','We are learning more and more from these travelers. It seems like a typical parikrama can take three days to complete, but some of the hardier types are able to complete it in a single day!  We hear that the pilgrims who complete the pilgrimage so quickly are most often from high altitude regions of the world.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KAILASH_CHOICE_4_HELP','That gives me an idea...what if we required our military to train at high elevations? Do you think there could be any benefit to such training?[NEWLINE][NEWLINE]All eligible owned Units earn the Altitude Training promotion. Additionally, local towns and villages gain +1 [ICON_TOURISM] Tourism.');