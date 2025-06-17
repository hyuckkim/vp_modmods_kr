INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_UNIVERSITY_POLICY','EVENT_CLASS_NEUTRAL',NULL,NULL,NULL,'AS2D_INTERFACE_BORDERS_EXPAND',20,0,'true','false','false','false',30,1,25,5,NULL,NULL,'ERA_INDUSTRIAL','false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_UNIVERSITY',NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_PUBLIC_SCHOOL_DECISION','EVENT_CLASS_NEUTRAL',NULL,NULL,NULL,'AS2D_INTERFACE_BORDERS_EXPAND',15,1,'true','false','false','false',100,1,40,4,NULL,NULL,'ERA_POSTMODERN','false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_PUBLIC_SCHOOL',NULL,'false','false','false','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_UNIVERSITY_POLICY_CHOICE_1','PLAYER_EVENT_UNIVERSITY_POLICY'),
('PLAYER_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1','PLAYER_EVENT_PUBLIC_SCHOOL_DECISION');

INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_UNIVERSITY_POLICY_CHOICE_1','TXT_KEY_PLAYER_EVENT_UNIVERSITY_POLICY_CHOICE_1','TXT_KEY_PLAYER_EVENT_UNIVERSITY_POLICY_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1','TXT_KEY_PLAYER_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1','TXT_KEY_PLAYER_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);
 
-- INSERT INTO Event_EventLinks(EventType,EventLinker,EventChoice,CityEvent,CityEventChoice,CheckKnownPlayers,CheckForActive) VALUES ;

-- INSERT INTO EventChoice_ResourceQuantity(EventChoiceType,ResourceType,Quantity) VALUES ;

-- INSERT INTO EventChoice_InstantYield(EventChoiceType,YieldType,Yield) VALUES ;

--INSERT INTO EventChoice_MinimumStartYield (EventChoiceType,YieldType,Yield) ;

-- INSERT INTO EventChoice_EventCostYield(EventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO EventChoice_BuildingClassYieldChange(EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO EventChoiceFlavors(EventChoiceType,FlavorType,Flavor) VALUES ;

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_FIELDS_OF_GOLD_v1','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_HELP',NULL,'AS2D_EVENT_CHOICE',20,1,'true','false','false',0,4,5,0,NULL,'ERA_CLASSICAL','ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FIELDS_OF_GOLD_v2','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_HELP',NULL,'AS2D_EVENT_CHOICE',20,1,'true','false','false',0,4,5,0,NULL,'ERA_CLASSICAL','ERA_RENAISSANCE','false','false',NULL,NULL,'false','false','TECH_OPTICS',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','true','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FIELDS_OF_GOLD_v3a','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_HELP',NULL,'AS2D_EVENT_CHOICE',20,1,'true','false','false',0,4,5,0,NULL,'ERA_CLASSICAL','ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_NOCOAST_TOWN_DUMMY',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FIELDS_OF_GOLD_v3b','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_HELP',NULL,'AS2D_EVENT_CHOICE',20,1,'true','false','false',0,4,5,0,NULL,'ERA_CLASSICAL','ERA_RENAISSANCE','false','false',NULL,NULL,'false','false','TECH_OPTICS',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','true','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FIELDS_OF_GOLD_v4a','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_HELP',NULL,'AS2D_EVENT_CHOICE',20,1,'true','false','false',0,4,5,0,NULL,'ERA_CLASSICAL','ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_NOCOAST_TOWN_DUMMY',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FIELDS_OF_GOLD_v4b','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_HELP',NULL,'AS2D_EVENT_CHOICE',20,1,'true','false','false',0,4,5,0,NULL,'ERA_CLASSICAL','ERA_RENAISSANCE','false','false',NULL,NULL,'false','false','TECH_OPTICS',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','true','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_UNIVERSITY_POLICY','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_DESCRIPTION','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',10,2,'true','false','false',30,6,10,0,NULL,NULL,'ERA_INDUSTRIAL','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_UNIVERSITY',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_UNIVERSITY_POLICY_REDO','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_DESCRIPTION','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',10,2,'true','false','false',30,5,10,0,NULL,NULL,'ERA_INDUSTRIAL','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_UNIVERSITY',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_GUILD_SPONSORSHIP_v1','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_DESCRIPTION','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',10,2,'true','false','false',30,4,15,0,NULL,'ERA_RENAISSANCE','ERA_MODERN','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_GUILD_SPONSORSHIP_v2','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_DESCRIPTION','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',10,2,'true','false','false',30,4,15,0,NULL,'ERA_RENAISSANCE','ERA_MODERN','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_GUILD_SPONSORSHIP_v3','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_DESCRIPTION','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',10,2,'true','false','false',30,4,15,0,NULL,'ERA_RENAISSANCE','ERA_MODERN','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_PUBLIC_SCHOOL_DECISION','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_DESCRIPTION','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',10,2,'true','false','false',30,6,20,0,NULL,NULL,'ERA_POSTMODERN','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_PUBLIC_SCHOOL',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_PUBLIC_SCHOOL_DECISION_REDO','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_DESCRIPTION','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',10,2,'true','false','false',30,5,20,0,NULL,NULL,'ERA_POSTMODERN','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_PUBLIC_SCHOOL',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_3','CITY_EVENT_FIELDS_OF_GOLD_v1'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_2','CITY_EVENT_FIELDS_OF_GOLD_v1'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_7','CITY_EVENT_FIELDS_OF_GOLD_v1'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_6','CITY_EVENT_FIELDS_OF_GOLD_v1'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_8','CITY_EVENT_FIELDS_OF_GOLD_v2'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_5','CITY_EVENT_FIELDS_OF_GOLD_v2'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_7','CITY_EVENT_FIELDS_OF_GOLD_v2'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_4','CITY_EVENT_FIELDS_OF_GOLD_v2'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_8','CITY_EVENT_FIELDS_OF_GOLD_v3a'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_2','CITY_EVENT_FIELDS_OF_GOLD_v3a'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_1a','CITY_EVENT_FIELDS_OF_GOLD_v3a'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_3','CITY_EVENT_FIELDS_OF_GOLD_v3a'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_8','CITY_EVENT_FIELDS_OF_GOLD_v3b'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_2','CITY_EVENT_FIELDS_OF_GOLD_v3b'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_1b','CITY_EVENT_FIELDS_OF_GOLD_v3b'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_3','CITY_EVENT_FIELDS_OF_GOLD_v3b'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_4','CITY_EVENT_FIELDS_OF_GOLD_v4a'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_1a','CITY_EVENT_FIELDS_OF_GOLD_v4a'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_6','CITY_EVENT_FIELDS_OF_GOLD_v4a'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_5','CITY_EVENT_FIELDS_OF_GOLD_v4a'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_4','CITY_EVENT_FIELDS_OF_GOLD_v4b'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_1b','CITY_EVENT_FIELDS_OF_GOLD_v4b'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_6','CITY_EVENT_FIELDS_OF_GOLD_v4b'),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_5','CITY_EVENT_FIELDS_OF_GOLD_v4b'),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_1','CITY_EVENT_UNIVERSITY_POLICY'),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_2','CITY_EVENT_UNIVERSITY_POLICY'),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_3','CITY_EVENT_UNIVERSITY_POLICY'),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_4','CITY_EVENT_UNIVERSITY_POLICY'),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_5','CITY_EVENT_UNIVERSITY_POLICY'),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_6','CITY_EVENT_UNIVERSITY_POLICY'),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_1','CITY_EVENT_UNIVERSITY_POLICY_REDO'),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_2','CITY_EVENT_UNIVERSITY_POLICY_REDO'),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_3','CITY_EVENT_UNIVERSITY_POLICY_REDO'),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_4','CITY_EVENT_UNIVERSITY_POLICY_REDO'),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_6','CITY_EVENT_UNIVERSITY_POLICY_REDO'),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_1','CITY_EVENT_GUILD_SPONSORSHIP_v1'),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_4','CITY_EVENT_GUILD_SPONSORSHIP_v1'),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_3','CITY_EVENT_GUILD_SPONSORSHIP_v1'),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_5','CITY_EVENT_GUILD_SPONSORSHIP_v1'),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_2','CITY_EVENT_GUILD_SPONSORSHIP_v2'),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_1','CITY_EVENT_GUILD_SPONSORSHIP_v2'),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_3','CITY_EVENT_GUILD_SPONSORSHIP_v2'),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_5','CITY_EVENT_GUILD_SPONSORSHIP_v2'),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_2','CITY_EVENT_GUILD_SPONSORSHIP_v3'),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_4','CITY_EVENT_GUILD_SPONSORSHIP_v3'),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_1','CITY_EVENT_GUILD_SPONSORSHIP_v3'),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_5','CITY_EVENT_GUILD_SPONSORSHIP_v3'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1','CITY_EVENT_PUBLIC_SCHOOL_DECISION'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_2','CITY_EVENT_PUBLIC_SCHOOL_DECISION'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_3','CITY_EVENT_PUBLIC_SCHOOL_DECISION'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_4','CITY_EVENT_PUBLIC_SCHOOL_DECISION'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_5','CITY_EVENT_PUBLIC_SCHOOL_DECISION'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_6','CITY_EVENT_PUBLIC_SCHOOL_DECISION'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1','CITY_EVENT_PUBLIC_SCHOOL_DECISION_REDO'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_2','CITY_EVENT_PUBLIC_SCHOOL_DECISION_REDO'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_3','CITY_EVENT_PUBLIC_SCHOOL_DECISION_REDO'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_4','CITY_EVENT_PUBLIC_SCHOOL_DECISION_REDO'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_6','CITY_EVENT_PUBLIC_SCHOOL_DECISION_REDO');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- New Celebration Promotion for Fields of Gold Event Choice 4 --
--------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions(Type, Description, Help, Sound, OrderPriority, PortraitIndex, IconAtlas, PediaType, WorkRateMod, CannotBeChosen, PediaEntry) VALUES
('PROMOTION_CELEBRATION', 'TXT_KEY_PROMOTION_CELEBRATION', 'TXT_KEY_PROMOTION_CELEBRATION_HELP', 'AS2D_IF_LEVELUP', 99, 33, 'PROMOTION_ATLAS', 'PEDIA_CIVILIAN',15, 'true', 'TXT_KEY_PROMOTION_CELEBRATION');

INSERT INTO UnitPromotions_CivilianUnitType (PromotionType, UnitType) VALUES
('PROMOTION_CELEBRATION','UNIT_WORKER');
--------------------------------------------------------------------------------------------------
-- End Promotion Addition
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
-- Dummy Buildings for Fields of Gold Event
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding,MaxPlayerInstances) VALUES 
('BUILDINGCLASS_FIELDS_GENERAL_DUMMY','BUILDING_FIELDS_GENERAL_DUMMY',5),
('BUILDINGCLASS_FIELDS_ADMIRAL_DUMMY','BUILDING_FIELDS_ADMIRAL_DUMMY',5),
('BUILDINGCLASS_FIELDS_GROWTH_DUMMY','BUILDING_FIELDS_GROWTH_DUMMY',-1),
('BUILDINGCLASS_FIELDS_BORDER_DUMMY','BUILDING_FIELDS_BORDER_DUMMY',-1),
('BUILDINGCLASS_FIELDS_WORKER_DUMMY','BUILDING_FIELDS_WORKER_DUMMY',-1),
('BUILDINGCLASS_FIELDS_GOLDEN_DUMMY','BUILDING_FIELDS_GOLDEN_DUMMY',-1),
('BUILDINGCLASS_FIELDS_FAITH_DUMMY','BUILDING_FIELDS_FAITH_DUMMY',-1),
('BUILDINGCLASS_FIELDS_GRAVE_DUMMY','BUILDING_FIELDS_GRAVE_DUMMY',-1);

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,GoldMaintenance,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune, IconAtlas, FoodKept, BorderGrowthRateIncrease, TrainedFreePromotion) VALUES
('BUILDING_FIELDS_GENERAL_DUMMY','BUILDINGCLASS_FIELDS_GENERAL_DUMMY','TXT_KEY_BUILDING_FIELDS_GENERAL_DUMMY','TXT_KEY_BUILDING_FIELDS_GENERAL_DUMMY_HELP',-1,1,-1,1,0,1,1,'CE123_ATLAS',0,0,NULL),
('BUILDING_FIELDS_ADMIRAL_DUMMY','BUILDINGCLASS_FIELDS_ADMIRAL_DUMMY','TXT_KEY_BUILDING_FIELDS_ADMIRAL_DUMMY','TXT_KEY_BUILDING_FIELDS_ADMIRAL_DUMMY_HELP',-1,1,-1,1,0,1,1,'CE123_ATLAS',0,0,NULL),
('BUILDING_FIELDS_GROWTH_DUMMY','BUILDINGCLASS_FIELDS_GROWTH_DUMMY','TXT_KEY_BUILDING_FIELDS_GROWTH_DUMMY','TXT_KEY_BUILDING_FIELDS_GROWTH_DUMMY_HELP',-1,2,-1,1,0,1,1,'CE123_ATLAS',5,0,NULL),
('BUILDING_FIELDS_BORDER_DUMMY','BUILDINGCLASS_FIELDS_BORDER_DUMMY','TXT_KEY_BUILDING_FIELDS_BORDER_DUMMY','TXT_KEY_BUILDING_FIELDS_BORDER_DUMMY_HELP',-1,0,-1,1,0,1,1,'CE123_ATLAS',0,5,NULL),
('BUILDING_FIELDS_WORKER_DUMMY','BUILDINGCLASS_FIELDS_WORKER_DUMMY','TXT_KEY_BUILDING_FIELDS_WORKER_DUMMY','TXT_KEY_BUILDING_FIELDS_WORKER_DUMMY_HELP',-1,1,-1,1,0,1,1,'CE123_ATLAS',0,0,'PROMOTION_CELEBRATION'),
('BUILDING_FIELDS_GOLDEN_DUMMY','BUILDINGCLASS_FIELDS_GOLDEN_DUMMY','TXT_KEY_BUILDING_FIELDS_GOLDEN_DUMMY','TXT_KEY_BUILDING_FIELDS_GOLDEN_DUMMY_HELP',-1,0,-1,1,0,1,1,'CE123_ATLAS',0,0,NULL),
('BUILDING_FIELDS_FAITH_DUMMY','BUILDINGCLASS_FIELDS_FAITH_DUMMY','TXT_KEY_BUILDING_FIELDS_FAITH_DUMMY','TXT_KEY_BUILDING_FIELDS_FAITH_DUMMY_HELP',-1,2,-1,1,0,1,1,'CE123_ATLAS',0,0,NULL),
('BUILDING_FIELDS_GRAVE_DUMMY','BUILDINGCLASS_FIELDS_GRAVE_DUMMY','TXT_KEY_BUILDING_FIELDS_GRAVE_DUMMY','TXT_KEY_BUILDING_FIELDS_GRAVE_DUMMY_HELP',-1,0,-1,1,0,1,1,'CE123_ATLAS',0,0,NULL);

INSERT INTO Building_YieldChanges (BuildingType,YieldType,Yield) VALUES
('BUILDING_FIELDS_GENERAL_DUMMY','YIELD_GREAT_GENERAL_POINTS',1),
('BUILDING_FIELDS_ADMIRAL_DUMMY','YIELD_GREAT_ADMIRAL_POINTS',1),
('BUILDING_FIELDS_GOLDEN_DUMMY','YIELD_GOLD',1),
('BUILDING_FIELDS_GRAVE_DUMMY','YIELD_GOLDEN_AGE_POINTS',1);

INSERT INTO Building_YieldChangesPerPop (BuildingType,YieldType,Yield) VALUES
('BUILDING_FIELDS_FAITH_DUMMY','YIELD_FAITH',20);

--------------------------------------------------------------------------------------------------
-- Dummy Buildings for University Event
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding,NoLimit) VALUES 
('BUILDINGCLASS_UNIVERSITY_FAITH_DUMMY','BUILDING_UNIVERSITY_FAITH_DUMMY',0),
('BUILDINGCLASS_UNIVERSITY_MILITARY_DUMMY','BUILDING_UNIVERSITY_MILITARY_DUMMY',0);

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune, IconAtlas, ReligiousPressureModifier) VALUES
('BUILDING_UNIVERSITY_FAITH_DUMMY','BUILDINGCLASS_UNIVERSITY_FAITH_DUMMY','TXT_KEY_BUILDING_UNIVERSITY_FAITH_DUMMY','TXT_KEY_BUILDING_UNIVERSITY_FAITH_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS',10),
('BUILDING_UNIVERSITY_MILITARY_DUMMY','BUILDINGCLASS_UNIVERSITY_MILITARY_DUMMY','TXT_KEY_BUILDING_UNIVERSITY_MILITARY_DUMMY','TXT_KEY_BUILDING_UNIVERSITY_MILITARY_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS',0);

INSERT INTO Building_UnitCombatFreeExperiences(BuildingType,UnitCombatType,Experience) VALUES
('BUILDING_UNIVERSITY_MILITARY_DUMMY','UNITCOMBAT_MELEE',5),
('BUILDING_UNIVERSITY_MILITARY_DUMMY','UNITCOMBAT_MOUNTED',5);
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings 
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_1a','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION_CHOICE_1','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_CHOICE_1a_HELP','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_FIELDS_GENERAL_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_1b','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION_CHOICE_1','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_CHOICE_1b_HELP','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_FIELDS_ADMIRAL_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_2','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION_CHOICE_2','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_FIELDS_GROWTH_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_3','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION_CHOICE_3','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_FIELDS_BORDER_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_4','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION_CHOICE_4','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_FIELDS_WORKER_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_5','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION_CHOICE_5','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_CHOICE_5_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_FIELDS_GOLDEN_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_6','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION_CHOICE_6','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_CHOICE_6_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_7','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION_CHOICE_7','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_CHOICE_7_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_FIELDS_FAITH_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_8','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_DESCRIPTION_CHOICE_8','TXT_KEY_CITY_EVENT_FIELDS_OF_GOLD_CHOICE_8_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_FIELDS_GRAVE_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_1','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_CHOICE_1','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_2','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_CHOICE_2','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_3','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_CHOICE_4','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','true','false','false','false',NULL,'BUILDINGCLASS_UNIVERSITY_FAITH_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_4','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_CHOICE_4','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_UNIVERSITY_MILITARY_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_5','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_CHOICE_5','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_CHOICE_5_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_6','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_CHOICE_6','TXT_KEY_CITY_EVENT_UNIVERSITY_POLICY_CHOICE_6_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_1','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_1','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_2','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_2','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_3','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_3','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_4','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_4','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_5','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_5','TXT_KEY_CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_5_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_2','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_2','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_3','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_4','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_4','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_4','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_5','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_5','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_5_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_6','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_6','TXT_KEY_CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_6_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_FIELDS_OF_GOLD_v1',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v2',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v1',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v3a',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v1',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v3b',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v1',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v4a',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v1',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v4b',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v2',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v1',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v2',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v3a',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v2',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v3b',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v2',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v4a',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v2',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v4b',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v3a',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v1',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v3a',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v2',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v3a',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v3b',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v3a',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v4a',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v3a',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v4b',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v3b',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v1',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v3b',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v2',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v3b',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v3a',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v3b',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v4a',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v3b',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v4b',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v4a',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v1',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v4a',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v2',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v4a',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v3a',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v4a',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v3b',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v4a',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v4b',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v4b',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v1',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v4b',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v2',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v4b',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v3a',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v4b',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v3b',NULL,'false','true','false'),
('CITY_EVENT_FIELDS_OF_GOLD_v4b',NULL,NULL,'CITY_EVENT_FIELDS_OF_GOLD_v4a',NULL,'false','true','false'),
('CITY_EVENT_UNIVERSITY_POLICY','PLAYER_EVENT_UNIVERSITY_POLICY',NULL,NULL,NULL,'false','false','true'),
('CITY_EVENT_UNIVERSITY_POLICY','PLAYER_EVENT_UNIVERSITY_POLICY',NULL,NULL,NULL,'false','false','true'),
('CITY_EVENT_GUILD_SPONSORSHIP_v1',NULL,NULL,'CITY_EVENT_GUILD_SPONSORSHIP_v2',NULL,'false','true','false'),
('CITY_EVENT_GUILD_SPONSORSHIP_v1',NULL,NULL,'CITY_EVENT_GUILD_SPONSORSHIP_v3',NULL,'false','true','false'),
('CITY_EVENT_GUILD_SPONSORSHIP_v2',NULL,NULL,'CITY_EVENT_GUILD_SPONSORSHIP_v1',NULL,'false','true','false'),
('CITY_EVENT_GUILD_SPONSORSHIP_v2',NULL,NULL,'CITY_EVENT_GUILD_SPONSORSHIP_v3',NULL,'false','true','false'),
('CITY_EVENT_GUILD_SPONSORSHIP_v3',NULL,NULL,'CITY_EVENT_GUILD_SPONSORSHIP_v1',NULL,'false','true','false'),
('CITY_EVENT_GUILD_SPONSORSHIP_v3',NULL,NULL,'CITY_EVENT_GUILD_SPONSORSHIP_v2',NULL,'false','true','false'),
('CITY_EVENT_UNIVERSITY_POLICY_REDO',NULL,NULL,NULL,'CITY_EVENT_UNIVERSITY_POLICY_CHOICE_5','false','true','true'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION','PLAYER_EVENT_PUBLIC_SCHOOL_DECISION',NULL,NULL,NULL,'false','false','true'),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_REDO',NULL,NULL,NULL,'CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_5','false','true','true');

-- INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_6','YIELD_GOLD',200);

INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_1','YIELD_GOLD',-5),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_2','YIELD_GOLD',-5),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_3','YIELD_GOLD',-5),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_4','YIELD_GOLD',-5),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1','YIELD_GOLD',-5),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_2','YIELD_GOLD',-5),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_3','YIELD_GOLD',-5);

INSERT INTO CityEventChoice_BuildingClassYieldModifier(CityEventChoiceType,BuildingClassType,YieldType,Modifier) VALUES
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1','BUILDINGCLASS_PUBLIC_SCHOOL','YIELD_SCIENCE',2),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_2','BUILDINGCLASS_PUBLIC_SCHOOL','YIELD_CULTURE',2),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_3','BUILDINGCLASS_PUBLIC_SCHOOL','YIELD_PRODUCTION',2);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_2','IMPROVEMENT_ACADEMY','YIELD_CULTURE',2);

INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_1','BUILDINGCLASS_UNIVERSITY','YIELD_SCIENCE',2),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_3','BUILDINGCLASS_UNIVERSITY','YIELD_FAITH',2),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_4','BUILDINGCLASS_PUBLIC_SCHOOL','YIELD_GOLD',5);

INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_1','SPECIALIST_SCIENTIST','YIELD_SCIENCE',1),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_1','SPECIALIST_SCIENTIST','YIELD_GOLD',-4),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_2','SPECIALIST_ENGINEER','YIELD_PRODUCTION',2),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_2','SPECIALIST_ENGINEER','YIELD_GOLD',-4),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_3','SPECIALIST_ARTIST','YIELD_CULTURE',1),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_3','SPECIALIST_ARTIST','YIELD_GOLD',-4),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_3','SPECIALIST_MUSICIAN','YIELD_CULTURE',1),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_3','SPECIALIST_MUSICIAN','YIELD_GOLD',-4),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_3','SPECIALIST_WRITER','YIELD_CULTURE',1),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_3','SPECIALIST_WRITER','YIELD_GOLD',-4),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_4','SPECIALIST_CIVIL_SERVANT','YIELD_TOURISM',2),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_4','SPECIALIST_CIVIL_SERVANT','YIELD_GOLD',-4);

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_1a','FLAVOR_OFFENSE',20),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_1b','FLAVOR_NAVAL',20),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_2','FLAVOR_GROWTH',20),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_3','FLAVOR_EXPANSION',20),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_4','FLAVOR_TILE_IMPROVEMENT',20),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_5','FLAVOR_GOLD',20),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_6','FLAVOR_GOLD',19),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_7','FLAVOR_RELIGION',20),
('CITY_EVENT_FIELDS_OF_GOLD_CHOICE_8','FLAVOR_HAPPINESS',20),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_1','FLAVOR_SCIENCE',20),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_2','FLAVOR_CULTURE',20),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_3','FLAVOR_RELIGION',20),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_4','FLAVOR_MILITARY_TRAINING',20),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_5','FLAVOR_GOLD',20),
('CITY_EVENT_UNIVERSITY_POLICY_CHOICE_6','FLAVOR_GOLD',10),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_1','FLAVOR_SCIENCE',20),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_2','FLAVOR_PRODUCTION',20),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_3','FLAVOR_CULTURE',20),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_4','FLAVOR_DIPLOMACY',20),
('CITY_EVENT_GUILD_SPONSORSHIP_CHOICE_5','FLAVOR_GOLD',20),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1','FLAVOR_SCIENCE',20),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_2','FLAVOR_CULTURE',20),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_3','FLAVOR_PRODUCTION',20),
('CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_4','FLAVOR_GOLD',20);