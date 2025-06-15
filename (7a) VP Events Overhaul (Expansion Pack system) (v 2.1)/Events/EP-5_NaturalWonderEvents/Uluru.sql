-- ULURU --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_ULURU','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_ULURU_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_ULURU_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_ULURU',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_ULURU_CHOICE_1','CITY_EVENT_NW_ULURU'),
('CITY_EVENT_NW_ULURU_CHOICE_2','CITY_EVENT_NW_ULURU'),
('CITY_EVENT_NW_ULURU_CHOICE_3','CITY_EVENT_NW_ULURU'),
('CITY_EVENT_NW_ULURU_CHOICE_4','CITY_EVENT_NW_ULURU');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- New DreamWalker Promotion for Event Choice 4 --
--------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions(Type, Description, Help, Sound, OrderPriority, PortraitIndex, IconAtlas, PediaType, CannotBeChosen, PediaEntry) VALUES
('PROMOTION_DREAMWALKER', 'TXT_KEY_PROMOTION_DREAMWALKER', 'TXT_KEY_PROMOTION_DREAMWALKER_HELP', 'AS2D_IF_LEVELUP', 99, 34, 'promoMUC_atlas_00', 'PEDIA_SHARED', 'true', 'TXT_KEY_PROMOTION_DREAMWALKER');

INSERT INTO UnitPromotions_Terrains (PromotionType,TerrainType,DoubleMove) VALUES
('PROMOTION_DREAMWALKER','TERRAIN_DESERT','true'),
('PROMOTION_DREAMWALKER','TERRAIN_HILL','true'); 

INSERT INTO UnitPromotions_UnitCombats (PromotionType, UnitCombatType) VALUES
('PROMOTION_DREAMWALKER','UNITCOMBAT_MELEE'),
('PROMOTION_DREAMWALKER','UNITCOMBAT_ARCHER'),
('PROMOTION_DREAMWALKER','UNITCOMBAT_GUN');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_DREAMWALKER','Dreamwalker');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_DREAMWALKER_HELP','Provides double movement on hills and in deserts for all owned Melee, Archery, and Gunpowder Units');
--------------------------------------------------------------------------------------------------
-- End Promotion Addition
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-- Dummy Building for Uluru Events 3 & 4
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_ULURU_DUMMY','BUILDING_ULURU_DUMMY'),
('BUILDINGCLASS_ULURU_DUMMY2','BUILDING_ULURU_DUMMY2');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas,FreePromotion) VALUES
('BUILDING_ULURU_DUMMY','BUILDINGCLASS_ULURU_DUMMY','TXT_KEY_BUILDING_ULURU_DUMMY','TXT_KEY_BUILDING_ULURU_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS',NULL),
('BUILDING_ULURU_DUMMY2','BUILDINGCLASS_ULURU_DUMMY2','TXT_KEY_BUILDING_ULURU_DUMMY2','TXT_KEY_BUILDING_ULURU_DUMMY2_HELP',-1,-1,1,0,1,1,'CE123_ATLAS','PROMOTION_DREAMWALKER');

INSERT INTO Building_ResourceYieldChanges (BuildingType,ResourceType,YieldType,Yield) VALUES
('BUILDING_ULURU_DUMMY','RESOURCE_COW','YIELD_CULTURE',2),
('BUILDING_ULURU_DUMMY','RESOURCE_SHEEP','YIELD_CULTURE',2),
('BUILDING_ULURU_DUMMY','RESOURCE_HORSE','YIELD_CULTURE',2),
('BUILDING_ULURU_DUMMY','RESOURCE_COW','YIELD_PRODUCTION',1),
('BUILDING_ULURU_DUMMY','RESOURCE_SHEEP','YIELD_PRODUCTION',1),
('BUILDING_ULURU_DUMMY','RESOURCE_HORSE','YIELD_FAITH',1);

INSERT INTO Building_ImprovementYieldChanges (BuildingType,ImprovementType,YieldType,Yield) VALUES
('BUILDING_ULURU_DUMMY','IMPROVEMENT_PASTURE','YIELD_CULTURE',-2),
('BUILDING_ULURU_DUMMY','IMPROVEMENT_PASTURE','YIELD_FAITH',-1);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_ULURU_DUMMY','Uluru Naturalist Project');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_ULURU_DUMMY_HELP','Adds +2 [ICON_CULTURE] Culture and +1 [ICON_PEACE] Faith to unimproved [ICON_RES_COW] Cows, [ICON_RES_SHEEP] Sheep, and [ICON_RES_HORSES] Horses.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_ULURU_DUMMY2','Uluru DreamWalker Training Facility');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_ULURU_DUMMY2_HELP','Provides double movement on hills and in deserts for all owned Melee, non-mounted Archer, and Gunpowder Units');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings 
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_ULURU_CHOICE_1','TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_1','TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_ULURU_CHOICE_2','TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_2','TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,'ERA_CLASSICAL','false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'true',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_ULURU_CHOICE_3','TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_3','TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_3_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_CHIVALRY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_ULURU_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_ULURU_CHOICE_4','TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_4','TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_ASTRONOMY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_ULURU_DUMMY2',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_ULURU_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_ULURU_CHOICE_3','false','true','true');

-- INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_ULURU_CHOICE_2','BUILDINGCLASS_SHRINE','YIELD_FAITH',1);

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_ULURU_CHOICE_1','FEATURE_ULURU','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_ULURU_CHOICE_1','FEATURE_ULURU','YIELD_TOURISM',1);

-- INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES ;

INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_ULURU_CHOICE_2','RESOURCE_STONE','YIELD_FAITH',1),
('CITY_EVENT_NW_ULURU_CHOICE_2','RESOURCE_STONE','YIELD_CULTURE',1);

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
('CITY_EVENT_NW_ULURU_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_ULURU_CHOICE_2','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_ULURU_CHOICE_2','FLAVOR_RELIGION',20),
('CITY_EVENT_NW_ULURU_CHOICE_3','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_ULURU_CHOICE_4','FLAVOR_OFFENSE',25),
('CITY_EVENT_NW_ULURU_CHOICE_4','FLAVOR_DEFENSE',25);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_ULURU_DESCRIPTION','Ayers on the Right Side of Caution');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_ULURU_HELP','The tribes living around Uluru have sent a delegate to treat with us, Your Mightiness[NEWLINE]He''s in the reception chamber, lecturing the guards on some Lizard Woman.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_1', 'The elders from these tribes are concerned that their ancestral property rights around Uluru are being trampled on. They are asking you to intercede with the other locals in the area.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_1_HELP','We''ll be happy to step in and tell people to stop stepping on this rock.[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_2','To our people, Uluru is more than just a rock. It is a symbol of the very protection of our people. We would like to tell you the story of Mala...');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_2_HELP','Scribes, write down what they are fixing to tell us![NEWLINE][NEWLINE]The City''s Shrine gains +1 [ICON_FAITH] Faith. Local [ICON_RES_STONE] Stone resources also gain +1 [ICON_FAITH] Faith and +2 [ICON_CULTURE] Culture.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_3','The tribes do not wish our researchers to continue interfering with the local wildlife. They are telling us that this is deeply troubling to the land.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_3_HELP','In this matter, your people must trust me to have both our best interests at heart. A mix of conservation and responsible stewardship is the only way to protect these unique species.[NEWLINE][NEWLINE]All unimproved [ICON_RES_COW] Cows, [ICON_RES_SHEEP] Sheep, and [ICON_RES_HORSES] Horses gain +2 [ICON_CULTURE] Culture and +1 [ICON_PEACE] Faith.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_4','Due to your continuing support, our tribal elders are wanting to offer you a chance to learn the practice of Dreamwalking.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_ULURU_CHOICE_4_HELP','We would be thrilled to learn this practice. Do you mind if I invite a few of my friends? [NEWLINE][NEWLINE]The Uluru DreamWalker Training Facility is built. It provides double movement on hills and in deserts for all owned Melee, non-mounted Archer, and Gunpowder Units.');
