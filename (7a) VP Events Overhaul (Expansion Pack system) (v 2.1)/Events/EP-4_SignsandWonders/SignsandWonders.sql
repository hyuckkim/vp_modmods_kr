INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_COMET','EVENT_CLASS_NEUTRAL','TXT_KEY_PLAYER_EVENT_COMET_DESCRIPTION','TXT_KEY_PLAYER_EVENT_COMET_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',5,1,'false','false','true','true',200,4,5,1,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_METEOR','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_METEOR_DESCRIPTION','TXT_KEY_PLAYER_EVENT_METEOR_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',5,2,'false','false','true','true',150,3,5,2,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false'),
 
('PLAYER_EVENT_ECLIPSE','EVENT_CLASS_NEUTRAL','TXT_KEY_PLAYER_EVENT_ECLIPSE_DESCRIPTION','TXT_KEY_PLAYER_EVENT_ECLIPSE_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',20,1,'false','false','true','true',150,4,8,3,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_COMET_CHOICE_1','PLAYER_EVENT_COMET'),
('PLAYER_EVENT_COMET_CHOICE_2','PLAYER_EVENT_COMET'),
('PLAYER_EVENT_COMET_CHOICE_3','PLAYER_EVENT_COMET'),
('PLAYER_EVENT_COMET_CHOICE_4','PLAYER_EVENT_COMET'),
('PLAYER_EVENT_METEOR_CHOICE_1','PLAYER_EVENT_METEOR'),
('PLAYER_EVENT_METEOR_CHOICE_2','PLAYER_EVENT_METEOR'),
('PLAYER_EVENT_METEOR_CHOICE_3','PLAYER_EVENT_METEOR'),
('PLAYER_EVENT_METEOR_CHOICE_4','PLAYER_EVENT_METEOR'),
('PLAYER_EVENT_METEOR_CHOICE_5','PLAYER_EVENT_METEOR'),
('PLAYER_EVENT_ECLIPSE_CHOICE_1','PLAYER_EVENT_ECLIPSE'),
('PLAYER_EVENT_ECLIPSE_CHOICE_2','PLAYER_EVENT_ECLIPSE'),
('PLAYER_EVENT_ECLIPSE_CHOICE_3','PLAYER_EVENT_ECLIPSE'),
('PLAYER_EVENT_ECLIPSE_CHOICE_4','PLAYER_EVENT_ECLIPSE');

INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_COMET_CHOICE_1','TXT_KEY_EVENT_COMET_CHOICE_1','TXT_KEY_EVENT_COMET_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_COMET_CHOICE_2','TXT_KEY_EVENT_COMET_CHOICE_2','TXT_KEY_EVENT_COMET_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,1,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_COMET_CHOICE_3','TXT_KEY_EVENT_COMET_CHOICE_3','TXT_KEY_EVENT_COMET_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',50,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'true','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_COMET_CHOICE_4','TXT_KEY_EVENT_COMET_CHOICE_4','TXT_KEY_EVENT_COMET_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_OBSERVATORY',NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_METEOR_CHOICE_1','TXT_KEY_PLAYER_EVENT_METEOR_CHOICE_1','TXT_KEY_PLAYER_EVENT_METEOR_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',50,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_FORGE',NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_METEOR_CHOICE_2','TXT_KEY_PLAYER_EVENT_METEOR_CHOICE_2','TXT_KEY_PLAYER_EVENT_METEOR_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_METEOR_CHOICE_3','TXT_KEY_PLAYER_EVENT_METEOR_CHOICE_3','TXT_KEY_PLAYER_EVENT_METEOR_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_PALACE',NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_METEOR_CHOICE_4','TXT_KEY_PLAYER_EVENT_METEOR_CHOICE_4','TXT_KEY_PLAYER_EVENT_METEOR_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_UNIVERSITY',NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_METEOR_CHOICE_5','TXT_KEY_PLAYER_EVENT_METEOR_CHOICE_5','TXT_KEY_PLAYER_EVENT_METEOR_CHOICE_5_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_MUSEUM',NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_ECLIPSE_CHOICE_1','TXT_KEY_PLAYER_EVENT_ECLIPSE_CHOICE_1','TXT_KEY_PLAYER_EVENT_ECLIPSE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',75,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_ECLIPSE_CHOICE_2','TXT_KEY_PLAYER_EVENT_ECLIPSE_CHOICE_2','TXT_KEY_PLAYER_EVENT_ECLIPSE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'TECH_THEOLOGY','true',NULL,NULL,'false',NULL,NULL,'false','false','true','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_ECLIPSE_CHOICE_3','TXT_KEY_PLAYER_EVENT_ECLIPSE_CHOICE_3','TXT_KEY_PLAYER_EVENT_ECLIPSE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,'TECH_ASTRONOMY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_ECLIPSE_CHOICE_4','TXT_KEY_PLAYER_EVENT_ECLIPSE_CHOICE_4','TXT_KEY_PLAYER_EVENT_ECLIPSE_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,'TECH_REPLACEABLE_PARTS',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);
 
INSERT INTO Event_EventLinks(EventType,EventLinker,EventChoice,CityEvent,CityEventChoice,CheckKnownPlayers,CheckForActive) VALUES
('PLAYER_EVENT_COMET','PLAYER_EVENT_COMET',NULL,NULL,NULL,'false','false'),
('PLAYER_EVENT_METEOR','PLAYER_EVENT_METEOR',NULL,NULL,NULL,'false','false'),
('PLAYER_EVENT_ECLIPSE','PLAYER_EVENT_ECLIPSE',NULL,NULL,NULL,'false','false');

INSERT INTO EventChoice_ResourceQuantity(EventChoiceType,ResourceType,Quantity) VALUES
('PLAYER_EVENT_METEOR_CHOICE_1','RESOURCE_IRON',2);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID,Variable1,Variable2) VALUES
('PLAYER_EVENT_ECLIPSE_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_PLAYER_EVENT_ECLIPSE_CHOICE_1_SUCCESSFUL','TXT_KEY_PLAYER_EVENT_ECLIPSE_CHOICE_1_SUCCESSFUL_S','false','false',-1,-1),
('PLAYER_EVENT_METEOR_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_PLAYER_EVENT_METEOR_CHOICE_1_SUCCESSFUL','TXT_KEY_PLAYER_EVENT_METEOR_CHOICE_1_SUCCESSFUL_S','false','false',-1,-1),
('PLAYER_EVENT_COMET_CHOICE_3','NOTIFICATION_GENERIC','TXT_KEY_PLAYER_EVENT_COMET_CHOICE_3_SUCCESSFUL','TXT_KEY_PLAYER_EVENT_COMET_CHOICE_3_SUCCESSFUL_S','false','false',-1,-1);

INSERT INTO EventChoice_InstantYield(EventChoiceType,YieldType,Yield) VALUES
('PLAYER_EVENT_COMET_CHOICE_1','YIELD_GOLDEN_AGE_POINTS',100),
('PLAYER_EVENT_COMET_CHOICE_3','YIELD_FAITH',200),
('PLAYER_EVENT_ECLIPSE_CHOICE_1','YIELD_GOLDEN_AGE_POINTS',250),
('PLAYER_EVENT_ECLIPSE_CHOICE_2','YIELD_FAITH',50),
('PLAYER_EVENT_ECLIPSE_CHOICE_3','YIELD_SCIENCE',100),
('PLAYER_EVENT_ECLIPSE_CHOICE_4','YIELD_CULTURE',150);

INSERT INTO EventChoice_MinimumStartYield (EventChoiceType,YieldType,Yield) 
VALUES ('PLAYER_EVENT_ECLIPSE_CHOICE_1','YIELD_GOLDEN_AGE_POINTS',100);

INSERT INTO EventChoice_EventCostYield(EventChoiceType,YieldType,Yield) VALUES
('PLAYER_EVENT_ECLIPSE_CHOICE_1','YIELD_GOLDEN_AGE_POINTS',100),
('PLAYER_EVENT_ECLIPSE_CHOICE_2','YIELD_FOOD',25);

INSERT INTO EventChoice_BuildingClassYieldChange(EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_METEOR_CHOICE_3','BUILDINGCLASS_PALACE','YIELD_CULTURE',2),
('PLAYER_EVENT_METEOR_CHOICE_4','BUILDINGCLASS_UNIVERSITY','YIELD_SCIENCE',1),
('PLAYER_EVENT_METEOR_CHOICE_5','BUILDINGCLASS_MUSEUM','YIELD_CULTURE',1),
('PLAYER_EVENT_METEOR_CHOICE_2','BUILDINGCLASS_SHRINE','YIELD_FAITH',1);

INSERT INTO EventChoiceFlavors(EventChoiceType,FlavorType,Flavor) VALUES
('PLAYER_EVENT_COMET_CHOICE_1','FLAVOR_HAPPINESS',20),
('PLAYER_EVENT_COMET_CHOICE_2','FLAVOR_HAPPINESS',20),
('PLAYER_EVENT_COMET_CHOICE_3','FLAVOR_RELIGION',20),
('PLAYER_EVENT_COMET_CHOICE_4','FLAVOR_SCIENCE',20),
('PLAYER_EVENT_METEOR_CHOICE_1','FLAVOR_OFFENSE',20),
('PLAYER_EVENT_METEOR_CHOICE_2','FLAVOR_RELIGION',20),
('PLAYER_EVENT_METEOR_CHOICE_3','FLAVOR_CULTURE',20),
('PLAYER_EVENT_METEOR_CHOICE_4','FLAVOR_SCIENCE',20),
('PLAYER_EVENT_METEOR_CHOICE_5','FLAVOR_CULTURE',25),
('PLAYER_EVENT_ECLIPSE_CHOICE_1','FLAVOR_HAPPINESS',20),
('PLAYER_EVENT_ECLIPSE_CHOICE_2','FLAVOR_RELIGION',20),
('PLAYER_EVENT_ECLIPSE_CHOICE_3','FLAVOR_SCIENCE',20),
('PLAYER_EVENT_ECLIPSE_CHOICE_4','FLAVOR_CULTURE',20);

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_MOUNTAINVOICES','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_MOUNTAINVOICES_DESCRIPTION','TXT_KEY_CITY_EVENT_MOUNTAINVOICES_HELP',NULL,'AS2D_EVENT_CHOICE',10,1,'true','false','false',30,3,3,4,NULL,NULL,'ERA_MEDIEVAL','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','true',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FORESTVOICES','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_FORESTVOICES_DESCRIPTION','TXT_KEY_CITY_EVENT_FORESTVOICES_HELP',NULL,'AS2D_EVENT_CHOICE',10,1,'true','false','false',30,3,3,4,NULL,NULL,'ERA_MEDIEVAL','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_FOREST',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_DESERTVOICES','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_DESERTVOICES_DESCRIPTION','TXT_KEY_CITY_EVENT_DESERTVOICES_HELP',NULL,'AS2D_EVENT_CHOICE',10,1,'true','false','false',30,3,3,4,NULL,NULL,'ERA_MEDIEVAL','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,'TERRAIN_DESERT',NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_WANDERER_v1','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_WANDERER','TXT_KEY_CITY_EVENT_WANDERER_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',50,0,'true','false','false',100,4,5,0,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_WALLS',NULL,'false','false',NULL,NULL,NULL,'true','false','false','false','false','true','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_WANDERER_v2','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_WANDERER','TXT_KEY_CITY_EVENT_WANDERER_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',50,0,'true','false','false',100,4,5,0,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_WALLS',NULL,'false','false',NULL,NULL,NULL,'true','false','false','false','false','true','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_WANDERER_v3','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_WANDERER','TXT_KEY_CITY_EVENT_WANDERER_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',50,0,'true','false','false',100,4,5,0,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_WALLS',NULL,'false','false',NULL,NULL,NULL,'true','false','false','false','false','true','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_PRIZE_HIDE','EVENT_CLASS_GOOD',NULL,NULL,NULL,'AS2D_INTERFACE_BORDERS_EXPAND',20,0,'true','false','false',0,1,0,0,NULL,NULL,'ERA_INDUSTRIAL','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_LODGE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_CAMP','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_AA_EARLY_FARMBONES','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_AA_EARLY_FARMBONES_DESCRIPTION','TXT_KEY_CITY_EVENT_AA_EARLY_FARMBONES_HELP',NULL,'AS2D_EVENT_CHOICE',20,1,'true','true','false',0,5,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,'TECH_ARCHAEOLOGY','false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,'TERRAIN_TUNDRA',NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_AA_LATE_FARMBONES','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_AA_LATE_FARMBONES_DESCRIPTION','TXT_KEY_CITY_EVENT_AA_LATE_FARMBONES_HELP',NULL,'AS2D_EVENT_CHOICE',20,1,'true','true','false',0,5,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false','TECH_ARCHAEOLOGY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,'TERRAIN_TUNDRA',NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_RELIGIOUS_RELICS','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_RELIGIOUS_RELICS_DESCRIPTION','TXT_KEY_CITY_EVENT_RELIGIOUS_RELICS_HELP',NULL,'AS2D_EVENT_CHOICE',20,1,'true','false','false',0,3,0,0,NULL,'ERA_MEDIEVAL','ERA_INDUSTRIAL','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','true','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_THEVOICES_CHOICE_1','CITY_EVENT_MOUNTAINVOICES'),
('CITY_EVENT_THEVOICES_CHOICE_2','CITY_EVENT_MOUNTAINVOICES'),
('CITY_EVENT_THEVOICES_CHOICE_3','CITY_EVENT_MOUNTAINVOICES'),
('CITY_EVENT_THEVOICES_CHOICE_1','CITY_EVENT_FORESTVOICES'),
('CITY_EVENT_THEVOICES_CHOICE_2','CITY_EVENT_FORESTVOICES'),
('CITY_EVENT_THEVOICES_CHOICE_3','CITY_EVENT_FORESTVOICES'),
('CITY_EVENT_THEVOICES_CHOICE_1','CITY_EVENT_DESERTVOICES'),
('CITY_EVENT_THEVOICES_CHOICE_2','CITY_EVENT_DESERTVOICES'),
('CITY_EVENT_THEVOICES_CHOICE_3','CITY_EVENT_DESERTVOICES'),
('CITY_EVENT_WANDERER_CHOICE_5','CITY_EVENT_WANDERER_v1'),
('CITY_EVENT_WANDERER_CHOICE_3','CITY_EVENT_WANDERER_v1'),
('CITY_EVENT_WANDERER_CHOICE_2','CITY_EVENT_WANDERER_v1'),
('CITY_EVENT_WANDERER_CHOICE_4','CITY_EVENT_WANDERER_v2'),
('CITY_EVENT_WANDERER_CHOICE_2','CITY_EVENT_WANDERER_v2'),
('CITY_EVENT_WANDERER_CHOICE_1','CITY_EVENT_WANDERER_v2'),
('CITY_EVENT_WANDERER_CHOICE_4','CITY_EVENT_WANDERER_v3'),
('CITY_EVENT_WANDERER_CHOICE_5','CITY_EVENT_WANDERER_v3'),
('CITY_EVENT_WANDERER_CHOICE_6','CITY_EVENT_WANDERER_v3'),
('CITY_EVENT_PRIZE_HIDE_CHOICE_1','CITY_EVENT_PRIZE_HIDE'),
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_1','CITY_EVENT_AA_EARLY_FARMBONES'),
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_2','CITY_EVENT_AA_EARLY_FARMBONES'),
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_3','CITY_EVENT_AA_EARLY_FARMBONES'),
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_4','CITY_EVENT_AA_EARLY_FARMBONES'),
('CITY_EVENT_NO_CHOICE','CITY_EVENT_AA_EARLY_FARMBONES'),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_1','CITY_EVENT_AA_LATE_FARMBONES'),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_2','CITY_EVENT_AA_LATE_FARMBONES'),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_3','CITY_EVENT_AA_LATE_FARMBONES'),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_4','CITY_EVENT_AA_LATE_FARMBONES'),
('CITY_EVENT_NO_CHOICE','CITY_EVENT_AA_LATE_FARMBONES'),
('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_1','CITY_EVENT_RELIGIOUS_RELICS'),
('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_2','CITY_EVENT_RELIGIOUS_RELICS'),
('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_3','CITY_EVENT_RELIGIOUS_RELICS');

INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES
('CITY_EVENT_AA_EARLY_FARMBONES','YIELD_GOLD',200),
('CITY_EVENT_AA_EARLY_FARMBONES','YIELD_PRODUCTION',75),
('CITY_EVENT_AA_LATE_FARMBONES','YIELD_SCIENCE',200),
('CITY_EVENT_AA_LATE_FARMBONES','YIELD_GOLD',150);

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NO_CHOICE','TXT_KEY_PLAYER_EVENT_NO_CHOICE','TXT_KEY_PLAYER_EVENT_NO_CHOICE_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_THEVOICES_CHOICE_1','TXT_KEY_CITY_EVENT_THEVOICES_CHOICE_1','TXT_KEY_CITY_EVENT_THEVOICES_ALL_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_THEVOICES_CHOICE_2','TXT_KEY_CITY_EVENT_THEVOICES_CHOICE_2','TXT_KEY_CITY_EVENT_THEVOICES_ALL_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_THEVOICES_CHOICE_3','TXT_KEY_CITY_EVENT_THEVOICES_CHOICE_3','TXT_KEY_CITY_EVENT_THEVOICES_ALL_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_WANDERER_CHOICE_1','TXT_KEY_CITY_EVENT_WANDERER_CHOICE_1','TXT_KEY_CITY_EVENT_WANDERER_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_WANDERER_CHOICE_2','TXT_KEY_CITY_EVENT_WANDERER_CHOICE_2','TXT_KEY_CITY_EVENT_WANDERER_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_WANDERER_CHOICE_3','TXT_KEY_CITY_EVENT_WANDERER_CHOICE_3','TXT_KEY_CITY_EVENT_WANDERER_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_WANDERER_CHOICE_4','TXT_KEY_CITY_EVENT_WANDERER_CHOICE_4','TXT_KEY_CITY_EVENT_WANDERER_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_WANDERER_CHOICE_5','TXT_KEY_CITY_EVENT_WANDERER_CHOICE_5','TXT_KEY_CITY_EVENT_WANDERER_CHOICE_5_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_WANDERER_CHOICE_6','TXT_KEY_CITY_EVENT_WANDERER_CHOICE_6','TXT_KEY_CITY_EVENT_WANDERER_CHOICE_6_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_PRIZE_HIDE_CHOICE_1','TXT_KEY_CITY_EVENT_PRIZE_HIDE_DESCRIPTION_CHOICE_1','TXT_KEY_CITY_EVENT_PRIZE_HIDE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,5,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_1','TXT_KEY_CITY_EVENT_AA_EARLY_FARMBONES_DESCRIPTION_CHOICE_1','TXT_KEY_CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,5,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_2','TXT_KEY_CITY_EVENT_AA_EARLY_FARMBONES_DESCRIPTION_CHOICE_2','TXT_KEY_CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_3','TXT_KEY_CITY_EVENT_AA_EARLY_FARMBONES_DESCRIPTION_CHOICE_3','TXT_KEY_CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,2,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_4','TXT_KEY_CITY_EVENT_AA_EARLY_FARMBONES_DESCRIPTION_CHOICE_4','TXT_KEY_CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',20,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_1','TXT_KEY_CITY_EVENT_AA_LATE_FARMBONES_DESCRIPTION_CHOICE_1','TXT_KEY_CITY_EVENT_AA_LATE_FARMBONES_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_2','TXT_KEY_CITY_EVENT_AA_LATE_FARMBONES_DESCRIPTION_CHOICE_2','TXT_KEY_CITY_EVENT_AA_LATE_FARMBONES_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_3','TXT_KEY_CITY_EVENT_AA_LATE_FARMBONES_DESCRIPTION_CHOICE_3','TXT_KEY_CITY_EVENT_AA_LATE_FARMBONES_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_UNIVERSITY',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_4','TXT_KEY_CITY_EVENT_AA_LATE_FARMBONES_DESCRIPTION_CHOICE_4','TXT_KEY_CITY_EVENT_AA_LATE_FARMBONES_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',20,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_MUSEUM',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_1','TXT_KEY_CITY_EVENT_RELIGIOUS_RELICS_DESCRIPTION_CHOICE_1','TXT_KEY_CITY_EVENT_RELIGIOUS_RELICS_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_2','TXT_KEY_CITY_EVENT_RELIGIOUS_RELICS_DESCRIPTION_CHOICE_2','TXT_KEY_CITY_EVENT_RELIGIOUS_RELICS_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',20,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_TEMPLE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_3','TXT_KEY_CITY_EVENT_RELIGIOUS_RELICS_DESCRIPTION_CHOICE_3','TXT_KEY_CITY_EVENT_RELIGIOUS_RELICS_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_MOUNTAINVOICES',NULL,NULL,'CITY_EVENT_MOUNTAINVOICES',NULL,'false','false','false'),
('CITY_EVENT_MOUNTAINVOICES',NULL,NULL,'CITY_EVENT_FORESTVOICES',NULL,'false','false','false'),
('CITY_EVENT_MOUNTAINVOICES',NULL,NULL,'CITY_EVENT_DESERTVOICES',NULL,'false','false','false'),
('CITY_EVENT_FORESTVOICES',NULL,NULL,'CITY_EVENT_MOUNTAINVOICES',NULL,'false','false','false'),
('CITY_EVENT_FORESTVOICES',NULL,NULL,'CITY_EVENT_FORESTVOICES',NULL,'false','false','false'),
('CITY_EVENT_FORESTVOICES',NULL,NULL,'CITY_EVENT_DESERTVOICES',NULL,'false','false','false'),
('CITY_EVENT_DESERTVOICES',NULL,NULL,'CITY_EVENT_MOUNTAINVOICES',NULL,'false','false','false'),
('CITY_EVENT_DESERTVOICES',NULL,NULL,'CITY_EVENT_FORESTVOICES',NULL,'false','false','false'),
('CITY_EVENT_DESERTVOICES',NULL,NULL,'CITY_EVENT_DESERTVOICES',NULL,'false','false','false'),
('CITY_EVENT_WANDERER_v1',NULL,NULL,'CITY_EVENT_WANDERER_v1',NULL,'false','true','false'),
('CITY_EVENT_WANDERER_v1',NULL,NULL,'CITY_EVENT_WANDERER_v2',NULL,'false','true','false'),
('CITY_EVENT_WANDERER_v1',NULL,NULL,'CITY_EVENT_WANDERER_v3',NULL,'false','true','false'),
('CITY_EVENT_WANDERER_v2',NULL,NULL,'CITY_EVENT_WANDERER_v1',NULL,'false','true','false'),
('CITY_EVENT_WANDERER_v2',NULL,NULL,'CITY_EVENT_WANDERER_v2',NULL,'false','true','false'),
('CITY_EVENT_WANDERER_v2',NULL,NULL,'CITY_EVENT_WANDERER_v3',NULL,'false','true','false'),
('CITY_EVENT_WANDERER_v3',NULL,NULL,'CITY_EVENT_WANDERER_v1',NULL,'false','true','false'),
('CITY_EVENT_WANDERER_v3',NULL,NULL,'CITY_EVENT_WANDERER_v2',NULL,'false','true','false'),
('CITY_EVENT_WANDERER_v3',NULL,NULL,'CITY_EVENT_WANDERER_v3',NULL,'false','true','false'),
('CITY_EVENT_RELIGIOUS_RELICS',NULL,NULL,'CITY_EVENT_RELIGIOUS_RELICS',NULL,'false','false','false');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_2','YIELD_GOLD',200),
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_4','YIELD_PRODUCTION',50),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_1','YIELD_SCIENCE',200),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_2','YIELD_SCIENCE',50);

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_THEVOICES_CHOICE_1','YIELD_SCIENCE',15),
('CITY_EVENT_THEVOICES_CHOICE_2','YIELD_CULTURE',15),
('CITY_EVENT_THEVOICES_CHOICE_3','YIELD_FAITH',15),
('CITY_EVENT_WANDERER_CHOICE_5','YIELD_GREAT_GENERAL_POINTS',100),
('CITY_EVENT_WANDERER_CHOICE_6','YIELD_GREAT_ADMIRAL_POINTS',100),
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_1','YIELD_CULTURE_LOCAL',50),
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_3','YIELD_GOLD',200),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_2','YIELD_FAITH',100),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_4','YIELD_GOLD',150),
('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_3','YIELD_GOLD',120);

INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_4','YIELD_GOLD',3);

INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES
('CITY_EVENT_WANDERER_CHOICE_1','SPECIALIST_ARTIST',100),
('CITY_EVENT_WANDERER_CHOICE_2','SPECIALIST_ENGINEER',100),
('CITY_EVENT_WANDERER_CHOICE_3','SPECIALIST_SCIENTIST',100),
('CITY_EVENT_WANDERER_CHOICE_4','SPECIALIST_MERCHANT',100),
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_2','SPECIALIST_WRITER',50),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_3','SPECIALIST_SCIENTIST',250);

INSERT INTO CityEventChoice_ResourceQuantity(CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_1','RESOURCE_IVORY',1);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',-1);

INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES 
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_3','TERRAIN_TUNDRA','YIELD_FOOD',-1);

INSERT INTO CityEventChoice_ResourceYieldChange (CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES 
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_3','RESOURCE_STONE','YIELD_SCIENCE',1);

INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_4','BUILDINGCLASS_MUSEUM','YIELD_CULTURE',2),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_4','BUILDINGCLASS_MUSEUM','YIELD_TOURISM',1),
('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_2','BUILDINGCLASS_TEMPLE','YIELD_FAITH',2),
('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_2','BUILDINGCLASS_TEMPLE','YIELD_TOURISM',1);

INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES
('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_1','UNIT_MISSIONARY',1);

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_WANDERER_CHOICE_1','FLAVOR_CULTURE',20),
('CITY_EVENT_WANDERER_CHOICE_2','FLAVOR_PRODUCTION',20),
('CITY_EVENT_WANDERER_CHOICE_3','FLAVOR_SCIENCE',20),
('CITY_EVENT_WANDERER_CHOICE_4','FLAVOR_GOLD',20),
('CITY_EVENT_WANDERER_CHOICE_5','FLAVOR_OFFENSE',20),
('CITY_EVENT_WANDERER_CHOICE_6','FLAVOR_NAVAL',20),
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_1','FLAVOR_GROWTH',20),
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_2','FLAVOR_GREAT_PEOPLE',20),
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_3','FLAVOR_GOLD',20),
('CITY_EVENT_AA_EARLY_FARMBONES_CHOICE_4','FLAVOR_GOLD',20),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_1','FLAVOR_HAPPINESS',20),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_2','FLAVOR_RELIGION',20),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_3','FLAVOR_SCIENCE',20),
('CITY_EVENT_AA_LATE_FARMBONES_CHOICE_4','FLAVOR_CULTURE',20),
('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_1','FLAVOR_RELIGION',20),
('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_2','FLAVOR_CULTURE',20),
('CITY_EVENT_RELIGIOUS_RELICS_CHOICE_3','FLAVOR_GOLD',20);