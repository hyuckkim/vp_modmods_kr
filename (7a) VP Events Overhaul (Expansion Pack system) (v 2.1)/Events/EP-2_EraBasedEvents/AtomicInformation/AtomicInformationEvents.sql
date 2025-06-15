INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_STADIUM_WORLD_EVENT','EVENT_CLASS_GOOD',NULL,NULL,NULL,'AS2D_INTERFACE_BORDERS_EXPAND',10,1,'false','false','false','false',50,1,0,4,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_STADIUM',NULL,'false','true','true','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_STADIUM_WORLD_EVENT_CHOICE_1','PLAYER_EVENT_STADIUM_WORLD_EVENT');

INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_STADIUM_WORLD_EVENT_CHOICE_1','TXT_KEY_PLAYER_EVENT_STADIUM_WORLD_EVENT_CHOICE_1','TXT_KEY_PLAYER_EVENT_STADIUM_WORLD_EVENT_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);
 
INSERT INTO Event_EventLinks(EventType,EventLinker,EventChoice,CityEvent,CityEventChoice,CheckKnownPlayers,CheckForActive) VALUES
('PLAYER_EVENT_STADIUM_WORLD_EVENT','PLAYER_EVENT_STADIUM_WORLD_EVENT',NULL,NULL,NULL,'false','false');

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID,Variable1,Variable2) VALUES
('PLAYER_EVENT_STADIUM_WORLD_EVENT_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_PLAYER_EVENT_STADIUM_WORLD_EVENT_CHOICE_1_SUCCESSFUL','TXT_KEY_PLAYER_EVENT_STADIUM_WORLD_EVENT_CHOICE_1_SUCCESSFUL_S','true','false',-1,-1);

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_STADIUM_WORLD_EVENT','EVENT_CLASS_GOOD',NULL,NULL,NULL,'AS2D_INTERFACE_BORDERS_EXPAND',75,1,'false','false','false',50,1,20,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_STADIUM',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_WORLD_FESTIVAL_EVENT','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_WORLD_FESTIVAL_EVENT','TXT_KEY_CITY_EVENT_WORLD_FESTIVAL_EVENT_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',40,1,'false','false','false',50,5,20,0,NULL,'ERA_POSTMODERN',NULL,'false','false',NULL,NULL,'false','false','TECH_FLIGHT',NULL,'false',NULL,NULL,'false','BUILDINGCLASS_HOTEL',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FAKE_PAINTING','EVENT_CLASS_BAD','TXT_KEY_CITY_EVENT_FAKE_PAINTING_DESCRIPTION','TXT_KEY_CITY_EVENT_FAKE_PAINTING_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',10,1,'true','false','false',25,2,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false','TECH_ATOMIC_THEORY',NULL,'false',NULL,NULL,'false','BUILDINGCLASS_ARTISTS_GUILD',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_PETA','EVENT_CLASS_BAD','TXT_KEY_CITY_EVENT_PETA_DESCRIPTION','TXT_KEY_CITY_EVENT_PETA_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',20,0,'false','true','false',20,1,0,0,NULL,'ERA_POSTMODERN',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_CAMP','false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_MinimumStartYield (CityEventType,YieldType,Yield) 
VALUES ('CITY_EVENT_PETA','YIELD_GOLD',100);

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_STADIUM_WORLD_EVENT_CHOICE_1','CITY_EVENT_STADIUM_WORLD_EVENT'),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_1','CITY_EVENT_WORLD_FESTIVAL_EVENT'),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_2','CITY_EVENT_WORLD_FESTIVAL_EVENT'),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_3','CITY_EVENT_WORLD_FESTIVAL_EVENT'),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_4','CITY_EVENT_WORLD_FESTIVAL_EVENT'),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_5','CITY_EVENT_WORLD_FESTIVAL_EVENT'),
('CITY_EVENT_FAKE_PAINTING_CHOICE_1','CITY_EVENT_FAKE_PAINTING'),
('CITY_EVENT_FAKE_PAINTING_CHOICE_2','CITY_EVENT_FAKE_PAINTING'),
('CITY_EVENT_PETA_CHOICE_1','CITY_EVENT_PETA');

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_STADIUM_WORLD_EVENT_CHOICE_1','TXT_KEY_CITY_EVENT_STADIUM_WORLD_EVENT_CHOICE_1','TXT_KEY_CITY_EVENT_STADIUM_WORLD_EVENT_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_1','TXT_KEY_CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_1','TXT_KEY_CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,10,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_2','TXT_KEY_CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_2','TXT_KEY_CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_3','TXT_KEY_CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_3','TXT_KEY_CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_4','TXT_KEY_CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_4','TXT_KEY_CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_STADIUM',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_5','TXT_KEY_CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_5','TXT_KEY_CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_5_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',50,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FAKE_PAINTING_CHOICE_1','TXT_KEY_CITY_EVENT_FAKE_PAINTING_DESCRIPTION_CHOICE_1','TXT_KEY_CITY_EVENT_FAKE_PAINTING_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FAKE_PAINTING_CHOICE_2','TXT_KEY_CITY_EVENT_FAKE_PAINTING_DESCRIPTION_CHOICE_2','TXT_KEY_CITY_EVENT_FAKE_PAINTING_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_PETA_CHOICE_1','TXT_KEY_CITY_EVENT_PETA_DESCRIPTION_CHOICE_1','TXT_KEY_CITY_EVENT_PETA_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_STADIUM_WORLD_EVENT',NULL,'PLAYER_EVENT_STADIUM_WORLD_EVENT_CHOICE_1',NULL,NULL,'false','false','true');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_STADIUM_WORLD_EVENT_CHOICE_1','YIELD_TOURISM',-100),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_4','YIELD_TOURISM',-100);

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_STADIUM_WORLD_EVENT_CHOICE_1','YIELD_GOLD',100),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_1','YIELD_CULTURE',100),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_4','YIELD_GOLDEN_AGE_POINTS',100),
('CITY_EVENT_FAKE_PAINTING_CHOICE_2','YIELD_CULTURE',-200),
('CITY_EVENT_PETA_CHOICE_1','YIELD_GOLD',-100);

INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_2','SPECIALIST_MUSICIAN',500),
('CITY_EVENT_FAKE_PAINTING_CHOICE_1','SPECIALIST_ARTIST',-75);

INSERT INTO CityEventChoice_SpecialistYieldChange(CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_3','SPECIALIST_ENGINEER','YIELD_SCIENCE',3),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_3','SPECIALIST_MERCHANT','YIELD_SCIENCE',3);

INSERT INTO CityEventChoice_ResourceQuantity(CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_5','RESOURCE_PEPPER',1);

INSERT INTO CityEventChoice_ImprovementDestructionRandom(CityEventChoiceType,ImprovementType,Number) VALUES
('CITY_EVENT_PETA_CHOICE_1','IMPROVEMENT_CAMP',3);

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_1','FLAVOR_CULTURE',20),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_2','FLAVOR_GREAT_PEOPLE',20),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_3','FLAVOR_SCIENCE',20),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_4','FLAVOR_GOLD',20),
('CITY_EVENT_WORLD_FESTIVAL_EVENT_CHOICE_5','FLAVOR_HAPPINESS',20),
('CITY_EVENT_FAKE_PAINTING_CHOICE_1','FLAVOR_GREAT_PEOPLE',20),
('CITY_EVENT_FAKE_PAINTING_CHOICE_2','FLAVOR_CULTURE',20);