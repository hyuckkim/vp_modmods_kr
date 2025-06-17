INSERT INTO Events (Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_CASTLE_DOCTRINE','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_CASTLE_DOCTRINE_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CASTLE_DOCTRINE_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',20,0,'true','false','false','false',30,4,25,4,NULL,NULL,'ERA_INDUSTRIAL','false','false',NULL,0,'false',NULL,NULL,'true','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_CASTLE',NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_BATHS_DECISION','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_BATHS_DECISION','TXT_KEY_PLAYER_EVENT_BATHS_DECISION_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',20,1,'true','false','false','false',60,3,20,3,NULL,NULL,'ERA_INDUSTRIAL','false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_BATH',NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_FOREIGNAID','EVENT_CLASS_NEUTRAL','TXT_KEY_PLAYER_EVENT_FOREIGNAID_DESCRIPTION','TXT_KEY_PLAYER_EVENT_FOREIGNAID_HELP','GoldStandard.dds','AS2D_INTERFACE_CITY_TILE',100,1,'false','false','false','true',100,2,0,0,NULL,NULL,NULL,'true','false',NULL,0,'false',NULL,NULL,'false','false',NULL,'TECH_BANKING',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','true','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_1','PLAYER_EVENT_CASTLE_DOCTRINE'),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_2','PLAYER_EVENT_CASTLE_DOCTRINE'),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_3','PLAYER_EVENT_CASTLE_DOCTRINE'),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_4','PLAYER_EVENT_CASTLE_DOCTRINE'),
('PLAYER_EVENT_BATHS_DECISION_CHOICE_1','PLAYER_EVENT_BATHS_DECISION'),
('PLAYER_EVENT_BATHS_DECISION_CHOICE_2','PLAYER_EVENT_BATHS_DECISION'),
('PLAYER_EVENT_BATHS_DECISION_CHOICE_3','PLAYER_EVENT_BATHS_DECISION'),
('PLAYER_EVENT_FOREIGNAID_CHOICE_1','PLAYER_EVENT_FOREIGNAID'),
('PLAYER_EVENT_FOREIGNAID_CHOICE_2','PLAYER_EVENT_FOREIGNAID');

INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_1','TXT_KEY_PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_1','TXT_KEY_PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',15,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_2','TXT_KEY_PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_2','TXT_KEY_PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','true',15,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_3','TXT_KEY_PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_3','TXT_KEY_PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','true',15,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_4','TXT_KEY_PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_4','TXT_KEY_PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE','true',15,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'true','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_BATHS_DECISION_CHOICE_1','TXT_KEY_PLAYER_EVENT_BATHS_DECISION_CHOICE_1','TXT_KEY_PLAYER_EVENT_BATHS_DECISION_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,1,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_BATHS_DECISION_CHOICE_2','TXT_KEY_PLAYER_EVENT_BATHS_DECISION_CHOICE_2','TXT_KEY_PLAYER_EVENT_BATHS_DECISION_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,1,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_BATHS_DECISION_CHOICE_3','TXT_KEY_PLAYER_EVENT_BATHS_DECISION_CHOICE_3','TXT_KEY_PLAYER_EVENT_BATHS_DECISION_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_FOREIGNAID_CHOICE_1','TXT_KEY_PLAYER_EVENT_FOREIGNAID_CHOICE_1','TXT_KEY_PLAYER_EVENT_FOREIGNAID_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_FOREIGNAID_CHOICE_2','TXT_KEY_PLAYER_EVENT_FOREIGNAID_CHOICE_2','TXT_KEY_PLAYER_EVENT_FOREIGNAID_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);

INSERT INTO EventChoice_InstantYield(EventChoiceType,YieldType,Yield) VALUES
('PLAYER_EVENT_FOREIGNAID_CHOICE_1','YIELD_GOLD',600);

INSERT INTO EventChoice_EventCostYield(EventChoiceType,YieldType,Yield) VALUES
('PLAYER_EVENT_FOREIGNAID_CHOICE_1','YIELD_TOURISM',30);

INSERT INTO EventChoice_BuildingClassYieldChange(EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_1','BUILDINGCLASS_CASTLE','YIELD_PRODUCTION',2),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_1','BUILDINGCLASS_CASTLE','YIELD_FOOD',-1),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_2','BUILDINGCLASS_CASTLE','YIELD_GOLD',2),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_2','BUILDINGCLASS_CASTLE','YIELD_PRODUCTION',1),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_2','BUILDINGCLASS_CASTLE','YIELD_FOOD',-2),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_3','BUILDINGCLASS_CASTLE','YIELD_FOOD',2),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_4','BUILDINGCLASS_CASTLE','YIELD_FAITH',2),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_4','BUILDINGCLASS_CASTLE','YIELD_FOOD',-2),
('PLAYER_EVENT_BATHS_DECISION_CHOICE_2','BUILDINGCLASS_BATH','YIELD_GOLD',-3),
('PLAYER_EVENT_BATHS_DECISION_CHOICE_3','BUILDINGCLASS_AQUEDUCT','YIELD_CULTURE',1);

INSERT INTO EventChoiceFlavors(EventChoiceType,FlavorType,Flavor) VALUES
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_1','FLAVOR_PRODUCTION',20),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_2','FLAVOR_GOLD',20),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_3','FLAVOR_GROWTH',20),
('PLAYER_EVENT_CASTLE_DOCTRINE_CHOICE_4','FLAVOR_RELIGION',20),
('PLAYER_EVENT_BATHS_DECISION_CHOICE_1','FLAVOR_GREAT_PEOPLE',20),
('PLAYER_EVENT_BATHS_DECISION_CHOICE_2','FLAVOR_HAPPINESS',20),
('PLAYER_EVENT_BATHS_DECISION_CHOICE_3','FLAVOR_CULTURE',20),
('PLAYER_EVENT_FOREIGNAID_CHOICE_1','FLAVOR_GOLD',25),
('PLAYER_EVENT_FOREIGNAID_CHOICE_2','FLAVOR_CULTURE',10);

INSERT INTO CityEvents (Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_FISHING_EXPEDITION','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_FISHING_EXPEDITION','TXT_KEY_CITY_EVENT_FISHING_EXPEDITION_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',50,1,'false','true','false',100,4,3,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_LIGHTHOUSE',NULL,'false','false',NULL,NULL,'RESOURCE_FISH','false','true','false','false','true','false','false','false','false','false','false','false','false','false','IMPROVEMENT_FISHING_BOATS','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_AMPHITHEATER_NEW_DRAMA','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_AMPHITHEATER_NEW_DRAMA','TXT_KEY_CITY_EVENT_AMPHITHEATER_NEW_DRAMA_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',50,1,'true','true','false',100,4,6,0,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_AMPHITHEATER',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_TEMPLE_CONCERNS','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_TEMPLE_CONCERNS','TXT_KEY_CITY_EVENT_TEMPLE_CONCERNS_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',40,1,'true','false','false',30,3,5,0,NULL,NULL,'ERA_INDUSTRIAL','true','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_TEMPLE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','true','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_LIGHTHOUSE','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_LIGHTHOUSE','TXT_KEY_CITY_EVENT_LIGHTHOUSE_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',50,1,'true','false','false',30,2,6,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_LIGHTHOUSE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','true','false','false','false','false','false','false','false','false','false','IMPROVEMENT_FISHING_BOATS','false','false','true','false','false','false','false','false','false'),

('CITY_EVENT_MUSKETEERS','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_MUSKETEERS_DESCRIPTION','TXT_KEY_CITY_EVENT_MUSKETEERS_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',50,1,'true','false','false',0,4,0,0,NULL,NULL,'ERA_MODERN','false','false',NULL,NULL,'true','false','TECH_GUNPOWDER',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','true','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NOTORIOUS_PIRATE','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_NOTORIOUS_PIRATE_DESCRIPTION','TXT_KEY_CITY_EVENT_NOTORIOUS_PIRATE_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',15,1,'true','false','true',25,3,0,0,NULL,'ERA_MEDIEVAL','ERA_MODERN','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_HARBOR',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FIREWORKS','EVENT_CLASS_GOOD',NULL,NULL,'FireWorks.dds','AS2D_INTERFACE_CITY_TILE',50,0,'true','false','false',0,1,0,0,NULL,NULL,'ERA_POSTMODERN','false','false',NULL,NULL,'false','false','TECH_GUNPOWDER',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','true','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_HARBORTRADE','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_HARBORTRADE_DESCRIPTION','TXT_KEY_CITY_EVENT_HARBORTRADE_HELP',NULL,'AS2D_INTERFACE_CITY_TILE',15,1,'true','false','true',10,3,0,0,NULL,'ERA_MEDIEVAL','ERA_MODERN','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_HARBOR',NULL,'false','false',NULL,NULL,NULL,'true','true','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents (CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_FISHING_EXPEDITION_CHOICE_1','CITY_EVENT_FISHING_EXPEDITION'),
('CITY_EVENT_FISHING_EXPEDITION_CHOICE_2','CITY_EVENT_FISHING_EXPEDITION'),
('CITY_EVENT_FISHING_EXPEDITION_CHOICE_3','CITY_EVENT_FISHING_EXPEDITION'),
('CITY_EVENT_DO_NOTHING_CHOICE','CITY_EVENT_FISHING_EXPEDITION'),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_1','CITY_EVENT_AMPHITHEATER_NEW_DRAMA'),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_2','CITY_EVENT_AMPHITHEATER_NEW_DRAMA'),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_3','CITY_EVENT_AMPHITHEATER_NEW_DRAMA'),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_4','CITY_EVENT_AMPHITHEATER_NEW_DRAMA'),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_1','CITY_EVENT_TEMPLE_CONCERNS'),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_2','CITY_EVENT_TEMPLE_CONCERNS'),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_3','CITY_EVENT_TEMPLE_CONCERNS'),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_4','CITY_EVENT_TEMPLE_CONCERNS'),
('CITY_EVENT_LIGHTHOUSE_CHOICE_1','CITY_EVENT_LIGHTHOUSE'),
('CITY_EVENT_LIGHTHOUSE_CHOICE_2','CITY_EVENT_LIGHTHOUSE'),
('CITY_EVENT_LIGHTHOUSE_CHOICE_3','CITY_EVENT_LIGHTHOUSE'),
('CITY_EVENT_MUSKETEERS_CHOICE_1','CITY_EVENT_MUSKETEERS'),
('CITY_EVENT_MUSKETEERS_CHOICE_2','CITY_EVENT_MUSKETEERS'),
('CITY_EVENT_MUSKETEERS_CHOICE_3','CITY_EVENT_MUSKETEERS'),
('CITY_EVENT_MUSKETEERS_CHOICE_4','CITY_EVENT_MUSKETEERS'),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_1','CITY_EVENT_NOTORIOUS_PIRATE'),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_2','CITY_EVENT_NOTORIOUS_PIRATE'),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_3','CITY_EVENT_NOTORIOUS_PIRATE'),
('CITY_EVENT_FIREWORKS_CHOICE_1','CITY_EVENT_FIREWORKS'),
('CITY_EVENT_HARBORTRADE_CHOICE_1','CITY_EVENT_HARBORTRADE'),
('CITY_EVENT_HARBORTRADE_CHOICE_2','CITY_EVENT_HARBORTRADE'),
('CITY_EVENT_HARBORTRADE_CHOICE_3','CITY_EVENT_HARBORTRADE');

-- Dummy Building for Musketeers event

INSERT INTO BuildingClasses (Type,DefaultBuilding,NoLimit) VALUES 
('BUILDINGCLASS_MUSKETEERS_DUMMY','BUILDING_MUSKETEERS_DUMMY',0);

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune, IconAtlas) VALUES
('BUILDING_MUSKETEERS_DUMMY','BUILDINGCLASS_MUSKETEERS_DUMMY','TXT_KEY_BUILDING_MUSKETEERS_DUMMY','TXT_KEY_BUILDING_MUSKETEERS_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS');

INSERT INTO Building_YieldFromSpyDefense (BuildingType,YieldType,Yield) VALUES
('BUILDING_MUSKETEERS_DUMMY','YIELD_GOLDEN_AGE_POINTS',50);

-- End Dummy Builidng

INSERT INTO CityEvent_MinimumStartYield (CityEventType,YieldType,Yield) VALUES
('CITY_EVENT_FISHING_EXPEDITION','YIELD_GOLD',250);

INSERT INTO CityEventChoices (Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_DO_NOTHING_CHOICE','TXT_KEY_CITY_EVENT_DO_NOTHING','TXT_KEY_CITY_EVENT_DO_NOTHING_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FISHING_EXPEDITION_CHOICE_1','TXT_KEY_CITY_EVENT_FISHING_EXPEDITION_CHOICE_1','TXT_KEY_CITY_EVENT_FISHING_EXPEDITION_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FISHING_EXPEDITION_CHOICE_2','TXT_KEY_CITY_EVENT_FISHING_EXPEDITION_CHOICE_2','TXT_KEY_CITY_EVENT_FISHING_EXPEDITION_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',75,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FISHING_EXPEDITION_CHOICE_3','TXT_KEY_CITY_EVENT_FISHING_EXPEDITION_CHOICE_3','TXT_KEY_CITY_EVENT_FISHING_EXPEDITION_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',33,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,'BUILDINGCLASS_HARBOR','false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_HARBOR',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_1','TXT_KEY_CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_1','TXT_KEY_CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'true','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_2','TXT_KEY_CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_2','TXT_KEY_CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_3','TXT_KEY_CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_3','TXT_KEY_CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_4','TXT_KEY_CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_4','TXT_KEY_CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'true','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_1','TXT_KEY_CITY_EVENT_TEMPLE_CONCERNS_CHOICE_1','TXT_KEY_CITY_EVENT_TEMPLE_CONCERNS_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'true','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,2,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_2','TXT_KEY_CITY_EVENT_TEMPLE_CONCERNS_CHOICE_2','TXT_KEY_CITY_EVENT_TEMPLE_CONCERNS_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,-1,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_3','TXT_KEY_CITY_EVENT_TEMPLE_CONCERNS_CHOICE_3','TXT_KEY_CITY_EVENT_TEMPLE_CONCERNS_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',50,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','BUILDINGCLASS_TEMPLE',NULL,0,0,0,1,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_4','TXT_KEY_CITY_EVENT_TEMPLE_CONCERNS_CHOICE_4','TXT_KEY_CITY_EVENT_TEMPLE_CONCERNS_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,'BUILDINGCLASS_GRAND_TEMPLE','true','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','BUILDINGCLASS_TEMPLE','BUILDINGCLASS_GRAND_TEMPLE',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_LIGHTHOUSE_CHOICE_1','TXT_KEY_CITY_EVENT_LIGHTHOUSE_CHOICE_1','TXT_KEY_CITY_EVENT_LIGHTHOUSE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_LIGHTHOUSE_CHOICE_2','TXT_KEY_CITY_EVENT_LIGHTHOUSE_CHOICE_2','TXT_KEY_CITY_EVENT_LIGHTHOUSE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_LIGHTHOUSE_CHOICE_3','TXT_KEY_CITY_EVENT_LIGHTHOUSE_CHOICE_3','TXT_KEY_CITY_EVENT_LIGHTHOUSE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','BUILDINGCLASS_LIGHTHOUSE',NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_MUSKETEERS_CHOICE_1','TXT_KEY_CITY_EVENT_MUSKETEERS_CHOICE_1','TXT_KEY_CITY_EVENT_MUSKETEERS_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_MUSKETEERS_CHOICE_2','TXT_KEY_CITY_EVENT_MUSKETEERS_CHOICE_2','TXT_KEY_CITY_EVENT_MUSKETEERS_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_MUSKETEERS_CHOICE_3','TXT_KEY_CITY_EVENT_MUSKETEERS_CHOICE_3','TXT_KEY_CITY_EVENT_MUSKETEERS_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_MUSKETEERS_CHOICE_4','TXT_KEY_CITY_EVENT_MUSKETEERS_CHOICE_4','TXT_KEY_CITY_EVENT_MUSKETEERS_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_MUSKETEERS_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_1','TXT_KEY_CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_1','TXT_KEY_CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',50,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','BUILDINGCLASS_HARBOR',NULL,0,0,0,0,2,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_2','TXT_KEY_CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_2','TXT_KEY_CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_3','TXT_KEY_CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_3','TXT_KEY_CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,'IMPROVEMENT_FISHING_BOATS',0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FIREWORKS_CHOICE_1','TXT_KEY_CITY_EVENT_FIREWORKS_CHOICE_1','TXT_KEY_CITY_EVENT_FIREWORKS_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',10,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,2,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_HARBORTRADE_CHOICE_1','TXT_KEY_CITY_EVENT_HARBORTRADE_CHOICE_1','TXT_KEY_CITY_EVENT_HARBORTRADE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',20,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_HARBORTRADE_CHOICE_2','TXT_KEY_CITY_EVENT_HARBORTRADE_CHOICE_2','TXT_KEY_CITY_EVENT_HARBORTRADE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',20,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_HARBORTRADE_CHOICE_3','TXT_KEY_CITY_EVENT_HARBORTRADE_CHOICE_3','TXT_KEY_CITY_EVENT_HARBORTRADE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',20,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks (CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_FISHING_EXPEDITION',NULL,NULL,'CITY_EVENT_FISHING_EXPEDITION',NULL,'false','false','false'),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA',NULL,NULL,'CITY_EVENT_AMPHITHEATER_NEW_DRAMA',NULL,'false','false','false'),
('CITY_EVENT_TEMPLE_CONCERNS',NULL,NULL,'CITY_EVENT_TEMPLE_CONCERNS',NULL,'false','false','false'),
('CITY_EVENT_LIGHTHOUSE',NULL,NULL,'CITY_EVENT_LIGHTHOUSE',NULL,'false','false','false'),
('CITY_EVENT_NOTORIOUS_PIRATE',NULL,NULL,'CITY_EVENT_NOTORIOUS_PIRATE',NULL,'false','false','false'),
('CITY_EVENT_HARBORTRADE',NULL,NULL,NULL,'CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_2','false','true','false'),
('CITY_EVENT_HARBORTRADE',NULL,NULL,NULL,'CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_3','false','true','false');

INSERT INTO CityEventChoice_Notification (CityEventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedCityCoordinates,NeedPlayerID,ExtraVariable) VALUES
('CITY_EVENT_FISHING_EXPEDITION_CHOICE_3','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_FISHING_EXPEDITION_CHOICE_3_SUCCESSFUL','TXT_KEY_CITY_EVENT_FISHING_EXPEDITION_CHOICE_3_SUCCESSFUL_S','false','true','false',-1),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_1_SUCCESSFUL','TXT_KEY_CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_1_SUCCESSFUL_S','true','true','false',-1),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_3','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_TEMPLE_CONCERNS_CHOICE_3_SUCCESSFUL','TXT_KEY_CITY_EVENT_TEMPLE_CONCERNS_CHOICE_3_SUCCESSFUL_S','false','true','false',-1),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_1_SUCCESSFUL','TXT_KEY_CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_1_SUCCESSFUL_S','false','true','false',-1);

INSERT INTO CityEventChoice_MinimumStartYield (CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_1','YIELD_GOLD',200),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_4','YIELD_GOLD',500),
('CITY_EVENT_LIGHTHOUSE_CHOICE_2','YIELD_GOLD',50),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_2','YIELD_GOLD',1000);

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_FISHING_EXPEDITION_CHOICE_1','YIELD_FOOD',200),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_1','YIELD_TOURISM',100),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_2','YIELD_CULTURE',100),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_4','YIELD_FAITH',100),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_1','YIELD_FAITH',100),
('CITY_EVENT_LIGHTHOUSE_CHOICE_3','YIELD_GOLD',100),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_2','YIELD_GOLD',-1000);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_FISHING_EXPEDITION_CHOICE_2','IMPROVEMENT_FISHING_BOATS','YIELD_FOOD',5),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_3','IMPROVEMENT_FISHING_BOATS','YIELD_FOOD',-3),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_3','IMPROVEMENT_FISHING_BOATS','YIELD_GOLD',-1);

INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_3','SPECIALIST_WRITER',100);

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_FISHING_EXPEDITION_CHOICE_1','YIELD_GOLD',75),
('CITY_EVENT_FISHING_EXPEDITION_CHOICE_2','YIELD_GOLD',125),
('CITY_EVENT_FISHING_EXPEDITION_CHOICE_3','YIELD_GOLD',500),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_1','YIELD_GOLD',200),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_1','YIELD_POPULATION',1),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_4','YIELD_GOLD',500),
('CITY_EVENT_LIGHTHOUSE_CHOICE_2','YIELD_GOLD',50);

INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_3','YIELD_FAITH',1);

INSERT INTO CityEventChoice_FreeUnits (CityEventChoiceType,UnitType,Quantity) VALUES
('CITY_EVENT_MUSKETEERS_CHOICE_1','UNIT_FRENCH_MUSKETEER',3),
('CITY_EVENT_MUSKETEERS_CHOICE_2','UNIT_INQUISITOR',3),
('CITY_EVENT_MUSKETEERS_CHOICE_3','UNIT_ENVOY',3),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_2','UNIT_PRIVATEER',1);

INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_2','BUILDINGCLASS_TEMPLE','YIELD_GOLD',2),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_2','BUILDINGCLASS_TEMPLE','YIELD_FAITH',1),
('CITY_EVENT_LIGHTHOUSE_CHOICE_1','BUILDINGCLASS_LIGHTHOUSE','YIELD_GOLD',2),
('CITY_EVENT_LIGHTHOUSE_CHOICE_2','BUILDINGCLASS_LIGHTHOUSE','YIELD_PRODUCTION',1),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_3','BUILDINGCLASS_HARBOR','YIELD_CULTURE',2),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_3','BUILDINGCLASS_HARBOR','YIELD_TOURISM',2),
('CITY_EVENT_HARBORTRADE_CHOICE_1','BUILDINGCLASS_HARBOR','YIELD_SCIENCE',1),
('CITY_EVENT_HARBORTRADE_CHOICE_2','BUILDINGCLASS_HARBOR','YIELD_CULTURE',1),
('CITY_EVENT_HARBORTRADE_CHOICE_3','BUILDINGCLASS_HARBOR','YIELD_GOLD',2);
 
INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_DO_NOTHING_CHOICE','FLAVOR_GOLD',15),
('CITY_EVENT_FISHING_EXPEDITION_CHOICE_1','FLAVOR_GROWTH',20),
('CITY_EVENT_FISHING_EXPEDITION_CHOICE_2','FLAVOR_GROWTH',20),
('CITY_EVENT_FISHING_EXPEDITION_CHOICE_3','FLAVOR_GROWTH',25),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_1','FLAVOR_CULTURE',25),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_2','FLAVOR_CULTURE',20),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_3','FLAVOR_GREAT_PEOPLE',20),
('CITY_EVENT_AMPHITHEATER_NEW_DRAMA_CHOICE_4','FLAVOR_RELIGION',20),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_1','FLAVOR_RELIGION',20),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_2','FLAVOR_GOLD',20),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_3','FLAVOR_HAPPINESS',20),
('CITY_EVENT_TEMPLE_CONCERNS_CHOICE_4','FLAVOR_RELIGION',25),
('CITY_EVENT_MUSKETEERS_CHOICE_1','FLAVOR_MILITARY_TRAINING',10),
('CITY_EVENT_MUSKETEERS_CHOICE_2','FLAVOR_RELIGION',10),
('CITY_EVENT_MUSKETEERS_CHOICE_3','FLAVOR_DIPLOMACY',10),
('CITY_EVENT_MUSKETEERS_CHOICE_4','FLAVOR_ESPIONAGE',10),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_2','FLAVOR_NAVAL',10),
('CITY_EVENT_NOTORIOUS_PIRATE_CHOICE_3','FLAVOR_CULTURE',5),
('CITY_EVENT_HARBORTRADE_CHOICE_1','FLAVOR_SCIENCE',10),
('CITY_EVENT_HARBORTRADE_CHOICE_2','FLAVOR_CULTURE',10),
('CITY_EVENT_HARBORTRADE_CHOICE_3','FLAVOR_GOLD',10);