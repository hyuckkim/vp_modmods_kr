INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_HEAT_WAVE','EVENT_CLASS_BAD','TXT_KEY_PLAYER_EVENT_HEAT_WAVE_DESCRIPTION','TXT_KEY_PLAYER_EVENT_HEAT_WAVE_HELP','badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',15,0,'false','false','true','true',150,4,15,3,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_ICE_AGE','EVENT_CLASS_BAD','TXT_KEY_PLAYER_EVENT_ICE_AGE_DESCRIPTION','TXT_KEY_PLAYER_EVENT_ICE_AGE_HELP','badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',15,0,'false','false','true','true',150,3,15,3,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,'TECH_STEAM_POWER','false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_RAINRAINRAIN','EVENT_CLASS_NEUTRAL','TXT_KEY_PLAYER_EVENT_RAINRAINRAIN_DESCRIPTION','TXT_KEY_PLAYER_EVENT_RAINRAINRAIN_HELP','playereventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',15,0,'false','false','true','false',150,3,15,3,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_POLLUTION','EVENT_CLASS_BAD','TXT_KEY_PLAYER_EVENT_POLLUTION_DESCRIPTION','TXT_KEY_PLAYER_EVENT_POLLUTION_HELP','playereventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',10,5,'true','false','false','false',30,2,NULL,NULL,NULL,'ERA_INDUSTRIAL',NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_POLLUTION_CLEANUP1','EVENT_CLASS_NEUTRAL','TXT_KEY_PLAYER_EVENT_POLLUTION_CLEANUP1_DESCRIPTION','TXT_KEY_PLAYER_EVENT_POLLUTION_CLEANUP1_HELP','playereventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',10,5,'true','false','false','false',30,2,NULL,NULL,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_POLLUTION_CLEANUP2','EVENT_CLASS_NEUTRAL','TXT_KEY_PLAYER_EVENT_POLLUTION_CLEANUP2_DESCRIPTION','TXT_KEY_PLAYER_EVENT_POLLUTION_CLEANUP2_HELP','playereventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',10,5,'true','false','false','false',30,2,NULL,NULL,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_PLAGUE','EVENT_CLASS_BAD','TXT_KEY_PLAYER_EVENT_PLAGUE_DESCRIPTION','TXT_KEY_PLAYER_EVENT_PLAGUE_HELP','badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',10,1,'false','false','true','false',200,2,20,4,NULL,'ERA_CLASSICAL','ERA_MODERN','false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false');
 
INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES 
('PLAYER_EVENT_HEAT_WAVE_CHOICE_1','PLAYER_EVENT_HEAT_WAVE'),
('PLAYER_EVENT_HEAT_WAVE_CHOICE_2','PLAYER_EVENT_HEAT_WAVE'),
('PLAYER_EVENT_HEAT_WAVE_CHOICE_3','PLAYER_EVENT_HEAT_WAVE'),
('PLAYER_EVENT_HEAT_WAVE_CHOICE_4','PLAYER_EVENT_HEAT_WAVE'),
('PLAYER_EVENT_ICE_AGE_CHOICE_1','PLAYER_EVENT_ICE_AGE'),
('PLAYER_EVENT_ICE_AGE_CHOICE_2','PLAYER_EVENT_ICE_AGE'),
('PLAYER_EVENT_ICE_AGE_CHOICE_3','PLAYER_EVENT_ICE_AGE'),
('PLAYER_EVENT_RAINRAINRAIN_CHOICE_1','PLAYER_EVENT_RAINRAINRAIN'),
('PLAYER_EVENT_RAINRAINRAIN_CHOICE_2','PLAYER_EVENT_RAINRAINRAIN'),
('PLAYER_EVENT_RAINRAINRAIN_CHOICE_3','PLAYER_EVENT_RAINRAINRAIN'),
('PLAYER_EVENT_POLLUTION_CHOICE_1','PLAYER_EVENT_POLLUTION'),
('PLAYER_EVENT_POLLUTION_CHOICE_2','PLAYER_EVENT_POLLUTION'),
('PLAYER_EVENT_POLLUTION_CLEANUP1_CHOICE_1','PLAYER_EVENT_POLLUTION_CLEANUP1'),
('PLAYER_EVENT_POLLUTION_CLEANUP1_CHOICE_2','PLAYER_EVENT_POLLUTION_CLEANUP1'),
('PLAYER_EVENT_POLLUTION_CLEANUP2_CHOICE_1','PLAYER_EVENT_POLLUTION_CLEANUP2'),
('PLAYER_EVENT_POLLUTION_CLEANUP2_CHOICE_2','PLAYER_EVENT_POLLUTION_CLEANUP2'),
('PLAYER_EVENT_PLAGUE_CHOICE_1','PLAYER_EVENT_PLAGUE'),
('PLAYER_EVENT_PLAGUE_CHOICE_2','PLAYER_EVENT_PLAGUE');

-- Dummy Building for POLLUTION event

INSERT INTO BuildingClasses (Type,DefaultBuilding,NoLimit) VALUES 
('BUILDINGCLASS_ENVIRONMENTAL_REGULATIONS_DUMMY','BUILDING_ENVIRONMENTAL_REGULATIONS_DUMMY',0);

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune) VALUES
('BUILDING_ENVIRONMENTAL_REGULATIONS_DUMMY','BUILDINGCLASS_ENVIRONMENTAL_REGULATIONS_DUMMY','TXT_KEY_BUILDING_ENVIRONMENTAL_REGULATIONS_DUMMY','TXT_KEY_BUILDING_ENVIRONMENTAL_REGULATIONS_DUMMY_HELP',-1,-1,1,0,1,1);

INSERT INTO Building_BuildingClassYieldModifiers (BuildingType,BuildingClassType,YieldType,Modifier) VALUES
('BUILDING_ENVIRONMENTAL_REGULATIONS_DUMMY','BUILDINGCLASS_ENVIRONMENTAL_REGULATIONS_DUMMY','YIELD_PRODUCTION',-5);	

--

INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_HEAT_WAVE_CHOICE_1','TXT_KEY_PLAYER_EVENT_HEAT_WAVE_CHOICE_1','TXT_KEY_PLAYER_EVENT_HEAT_WAVE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,'TECH_ELECTRICITY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_HEAT_WAVE_CHOICE_2','TXT_KEY_PLAYER_EVENT_HEAT_WAVE_CHOICE_2','TXT_KEY_PLAYER_EVENT_HEAT_WAVE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,'TECH_ECONOMICS',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_HEAT_WAVE_CHOICE_3','TXT_KEY_PLAYER_EVENT_HEAT_WAVE_CHOICE_3','TXT_KEY_PLAYER_EVENT_HEAT_WAVE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_HEAT_WAVE_CHOICE_4','TXT_KEY_PLAYER_EVENT_HEAT_WAVE_CHOICE_4','TXT_KEY_PLAYER_EVENT_HEAT_WAVE_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_ICE_AGE_CHOICE_1','TXT_KEY_PLAYER_EVENT_ICE_AGE_CHOICE_1','TXT_KEY_PLAYER_EVENT_ICE_AGE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_ICE_AGE_CHOICE_2','TXT_KEY_PLAYER_EVENT_ICE_AGE_CHOICE_2','TXT_KEY_PLAYER_EVENT_ICE_AGE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_ICE_AGE_CHOICE_3','TXT_KEY_PLAYER_EVENT_ICE_AGE_CHOICE_3','TXT_KEY_PLAYER_EVENT_ICE_AGE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_RAINRAINRAIN_CHOICE_1','TXT_KEY_PLAYER_EVENT_RAINRAINRAIN_CHOICE_1','TXT_KEY_PLAYER_EVENT_RAINRAINRAIN_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,'TECH_MASONRY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_RAINRAINRAIN_CHOICE_2','TXT_KEY_PLAYER_EVENT_RAINRAINRAIN_CHOICE_2','TXT_KEY_PLAYER_EVENT_RAINRAINRAIN_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,'TECH_MASONRY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_RAINRAINRAIN_CHOICE_3','TXT_KEY_PLAYER_EVENT_RAINRAINRAIN_CHOICE_3','TXT_KEY_PLAYER_EVENT_RAINRAINRAIN_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_POLLUTION_CHOICE_1','TXT_KEY_PLAYER_EVENT_POLLUTION_CHOICE_1','TXT_KEY_PLAYER_EVENT_POLLUTION_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',40,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,'BUILDINGCLASS_ENVIRONMENTAL_REGULATIONS_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_POLLUTION_CHOICE_2','TXT_KEY_PLAYER_EVENT_POLLUTION_CHOICE_2','TXT_KEY_PLAYER_EVENT_POLLUTION_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','true',40,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_POLLUTION_CLEANUP1_CHOICE_1','TXT_KEY_PLAYER_EVENT_POLLUTION_CLEANUP1_CHOICE_1','TXT_KEY_PLAYER_EVENT_POLLUTION_CLEANUP1_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',40,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,'BUILDINGCLASS_ENVIRONMENTAL_REGULATIONS_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_POLLUTION_CLEANUP1_CHOICE_2','TXT_KEY_PLAYER_EVENT_POLLUTION_CLEANUP1_CHOICE_2','TXT_KEY_PLAYER_EVENT_POLLUTION_CLEANUP1_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','true',40,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_POLLUTION_CLEANUP2_CHOICE_1','TXT_KEY_PLAYER_EVENT_POLLUTION_CLEANUP2_CHOICE_1','TXT_KEY_PLAYER_EVENT_POLLUTION_CLEANUP2_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',40,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,'BUILDINGCLASS_ENVIRONMENTAL_REGULATIONS_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_POLLUTION_CLEANUP2_CHOICE_2','TXT_KEY_PLAYER_EVENT_POLLUTION_CLEANUP2_CHOICE_2','TXT_KEY_PLAYER_EVENT_POLLUTION_CLEANUP2_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','true',40,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_PLAGUE_CHOICE_1','TXT_KEY_PLAYER_EVENT_PLAGUE_CHOICE_1','TXT_KEY_PLAYER_EVENT_PLAGUE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',25,'true',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_PLAGUE_CHOICE_2','TXT_KEY_PLAYER_EVENT_PLAGUE_CHOICE_2','TXT_KEY_PLAYER_EVENT_PLAGUE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','false',25,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);

INSERT INTO Event_EventLinks(EventType,EventLinker,EventChoice,CityEvent,CityEventChoice,CheckKnownPlayers,CheckForActive) VALUES
('PLAYER_EVENT_ICE_AGE','PLAYER_EVENT_HEAT_WAVE',NULL,NULL,NULL,'false','false'),
('PLAYER_EVENT_ICE_AGE','PLAYER_EVENT_RAINRAINRAIN',NULL,NULL,NULL,'false','false'),
('PLAYER_EVENT_HEAT_WAVE','PLAYER_EVENT_ICE_AGE',NULL,NULL,NULL,'false','false'),
('PLAYER_EVENT_HEAT_WAVE','PLAYER_EVENT_RAINRAINRAIN',NULL,NULL,NULL,'false','false'),
('PLAYER_EVENT_RAINRAINRAIN','PLAYER_EVENT_HEAT_WAVE',NULL,NULL,NULL,'false','false'),
('PLAYER_EVENT_RAINRAINRAIN','PLAYER_EVENT_ICE_AGE',NULL,NULL,NULL,'false','false'),
('PLAYER_EVENT_POLLUTION_CLEANUP1',NULL,'PLAYER_EVENT_POLLUTION_CHOICE_2',NULL,NULL,'false','true'),
('PLAYER_EVENT_POLLUTION_CLEANUP2',NULL,'PLAYER_EVENT_POLLUTION_CLEANUP1_CHOICE_2',NULL,NULL,'false','true');

INSERT INTO EventChoice_EventCostYield(EventChoiceType,YieldType,Yield) VALUES
('PLAYER_EVENT_HEAT_WAVE_CHOICE_1','YIELD_GOLD',500),
('PLAYER_EVENT_HEAT_WAVE_CHOICE_2','YIELD_GOLD',250),
('PLAYER_EVENT_HEAT_WAVE_CHOICE_3','YIELD_GOLD',100),
('PLAYER_EVENT_RAINRAINRAIN_CHOICE_1','YIELD_GOLD',300),
('PLAYER_EVENT_RAINRAINRAIN_CHOICE_2','YIELD_PRODUCTION',150);

INSERT INTO EventChoice_CityYield(EventChoiceType,YieldType,Yield) VALUES
('PLAYER_EVENT_ICE_AGE_CHOICE_1','YIELD_GOLD',-3),
('PLAYER_EVENT_ICE_AGE_CHOICE_2','YIELD_PRODUCTION',-2),
('PLAYER_EVENT_PLAGUE_CHOICE_1','YIELD_GOLD',-2);

INSERT INTO EventChoiceFlavors(EventChoiceType,FlavorType,Flavor) VALUES
('PLAYER_EVENT_HEAT_WAVE_CHOICE_1','FLAVOR_GROWTH',40),
('PLAYER_EVENT_HEAT_WAVE_CHOICE_2','FLAVOR_GROWTH',30),
('PLAYER_EVENT_HEAT_WAVE_CHOICE_3','FLAVOR_GROWTH',20),
('PLAYER_EVENT_HEAT_WAVE_CHOICE_4','FLAVOR_GROWTH',10),
('PLAYER_EVENT_ICE_AGE_CHOICE_1','FLAVOR_PRODUCTION',20),
('PLAYER_EVENT_ICE_AGE_CHOICE_2','FLAVOR_GOLD',20),
('PLAYER_EVENT_ICE_AGE_CHOICE_3','FLAVOR_GROWTH',20),
('PLAYER_EVENT_RAINRAINRAIN_CHOICE_1','FLAVOR_PRODUCTION',20),
('PLAYER_EVENT_RAINRAINRAIN_CHOICE_2','FLAVOR_GOLD',20),
('PLAYER_EVENT_RAINRAINRAIN_CHOICE_3','FLAVOR_GROWTH',20),
('PLAYER_EVENT_POLLUTION_CHOICE_1','FLAVOR_GROWTH',15),
('PLAYER_EVENT_POLLUTION_CHOICE_2','FLAVOR_PRODUCTION',15),
('PLAYER_EVENT_POLLUTION_CLEANUP1_CHOICE_1','FLAVOR_GROWTH',25),
('PLAYER_EVENT_POLLUTION_CLEANUP1_CHOICE_2','FLAVOR_PRODUCTION',15),
('PLAYER_EVENT_POLLUTION_CLEANUP2_CHOICE_1','FLAVOR_GROWTH',40),
('PLAYER_EVENT_POLLUTION_CLEANUP2_CHOICE_2','FLAVOR_PRODUCTION',15),
('PLAYER_EVENT_PLAGUE_CHOICE_1','FLAVOR_GROWTH',10),
('PLAYER_EVENT_PLAGUE_CHOICE_2','FLAVOR_GOLD',20);
