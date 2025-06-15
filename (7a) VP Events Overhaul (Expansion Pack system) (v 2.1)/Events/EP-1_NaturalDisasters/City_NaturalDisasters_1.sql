INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_DROUGHT','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',25,1,'false','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','true','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_DROUGHT_SEVERE','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',25,1,'false','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_DROUGHT_CRITICAL','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',25,1,'false','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_DROUGHT_FOREST_FIRE','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',25,1,'false','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_FOREST',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_ICE_AGE_EXPOSURE','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',20,1,'false','false','false',50,1,8,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,'TECH_STEAM_POWER','false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_ICE_AGE_NO_FUEL','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',33,1,'false','true','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,'TECH_STEAM_POWER','false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_ICE_AGE_FROZEN_WATER','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',33,1,'false','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,'TECH_STEAM_POWER','false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','true','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_ICE_AGE_BITTER_WINDS','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',33,1,'false','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,'TECH_STEAM_POWER','false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_RAINRAINRAIN1','EVENT_CLASS_GOOD',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_INTERFACE_CITY_TILE',20,1,'false','true','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_RAINRAINRAIN2','EVENT_CLASS_GOOD',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_INTERFACE_CITY_TILE',20,1,'false','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,'TERRAIN_DESERT',NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_RAINRAINRAIN3','EVENT_CLASS_GOOD',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_INTERFACE_CITY_TILE',20,1,'false','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_RAINRAINRAIN4','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',30,1,'false','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','true','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_RAINRAINRAIN5','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',20,1,'false','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_RAINRAINRAIN6','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',15,1,'false','true','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','true',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_RAINRAINRAIN7','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',15,1,'false','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','true','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_POLLUTION_MINOR','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',10,5,'true','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_POLLUTION_CLEANUP1','EVENT_CLASS_NEUTRAL',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_EVENT_CHOICE',10,5,'true','true','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_POLLUTION_MAJOR','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',10,5,'true','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_POLLUTION_CLEANUP2','EVENT_CLASS_NEUTRAL',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_EVENT_CHOICE',10,5,'true','true','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_POLLUTION_BAD_ACTOR','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',25,2,'false','true','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_PLAGUE1','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',5,1,'false','false','false',50,1,7,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'true','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_PLAGUE2','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',15,1,'false','false','false',50,1,7,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'true','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_VOLCANO','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',3,0,'false','false','false',125,1,8,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','true',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_VOLCANO_SPECIAL','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',5,0,'false','false','false',125,1,8,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_VOLCANO',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_EARTHQUAKE_MINOR','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',7,0,'false','false','false',125,1,8,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','true',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_EARTHQUAKE_MAJOR','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',3,0,'false','false','false',125,1,8,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','true',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_AVALANCHE','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',20,0,'false','false','false',100,1,6,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,'TERRAIN_TUNDRA',NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','true',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FOREST_FIRE','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',10,0,'false','false','false',50,1,6,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_FOREST',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FOREST_FIRE_REGROWTH','EVENT_CLASS_GOOD',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_INTERFACE_CITY_TILE',30,0,'false','false','false',50,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_DROUGHT_CHOICE_1','CITY_EVENT_DROUGHT'),
('CITY_EVENT_SEVERE_DROUGHT_CHOICE_1','CITY_EVENT_DROUGHT_SEVERE'),
('CITY_EVENT_CRITICAL_DROUGHT_CHOICE_1','CITY_EVENT_DROUGHT_CRITICAL'),
('CITY_EVENT_DROUGHT_FOREST_FIRE_CHOICE_1','CITY_EVENT_DROUGHT_FOREST_FIRE'),
('CITY_EVENT_ICE_AGE_EXPOSURE_CHOICE_1','CITY_EVENT_ICE_AGE_EXPOSURE'),
('CITY_EVENT_ICE_AGE_NO_FUEL_CHOICE_1','CITY_EVENT_ICE_AGE_NO_FUEL'),
('CITY_EVENT_ICE_AGE_FROZEN_WATER_CHOICE_1','CITY_EVENT_ICE_AGE_FROZEN_WATER'),
('CITY_EVENT_ICE_AGE_BITTER_WINDS_CHOICE_1','CITY_EVENT_ICE_AGE_BITTER_WINDS'),
('CITY_EVENT_RAINRAINRAIN1_CHOICE_1','CITY_EVENT_RAINRAINRAIN1'),
('CITY_EVENT_RAINRAINRAIN2_CHOICE_1','CITY_EVENT_RAINRAINRAIN2'),
('CITY_EVENT_RAINRAINRAIN3_CHOICE_1','CITY_EVENT_RAINRAINRAIN3'),
('CITY_EVENT_RAINRAINRAIN4_CHOICE_1','CITY_EVENT_RAINRAINRAIN4'),
('CITY_EVENT_RAINRAINRAIN5_CHOICE_1','CITY_EVENT_RAINRAINRAIN5'),
('CITY_EVENT_RAINRAINRAIN6_CHOICE_1','CITY_EVENT_RAINRAINRAIN6'),
('CITY_EVENT_RAINRAINRAIN7_CHOICE_1','CITY_EVENT_RAINRAINRAIN7'),
('CITY_EVENT_POLLUTION_MINOR_CHOICE_1','CITY_EVENT_POLLUTION_MINOR'),
('CITY_EVENT_POLLUTION_CLEANUP1_CHOICE_1','CITY_EVENT_POLLUTION_CLEANUP1'),
('CITY_EVENT_POLLUTION_MAJOR_CHOICE_1','CITY_EVENT_POLLUTION_MAJOR'),
('CITY_EVENT_POLLUTION_CLEANUP2_CHOICE_1','CITY_EVENT_POLLUTION_CLEANUP2'),
('CITY_EVENT_POLLUTION_BAD_ACTOR_CHOICE_1','CITY_EVENT_POLLUTION_BAD_ACTOR'),
('CITY_EVENT_PLAGUE1_CHOICE_1','CITY_EVENT_PLAGUE1'),
('CITY_EVENT_PLAGUE2_CHOICE_1','CITY_EVENT_PLAGUE2'),
('CITY_EVENT_VOLCANO_CHOICE_1','CITY_EVENT_VOLCANO'),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','CITY_EVENT_VOLCANO_SPECIAL'),
('CITY_EVENT_EARTHQUAKE_MINOR_CHOICE_1','CITY_EVENT_EARTHQUAKE_MINOR'),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','CITY_EVENT_EARTHQUAKE_MAJOR'),
('CITY_EVENT_AVALANCHE_CHOICE_1','CITY_EVENT_AVALANCHE'),
('CITY_EVENT_FOREST_FIRE_CHOICE_1','CITY_EVENT_FOREST_FIRE'),
('CITY_EVENT_FOREST_FIRE_REGROWTH_CHOICE_1','CITY_EVENT_FOREST_FIRE_REGROWTH');

INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES
('CITY_EVENT_POLLUTION_CLEANUP1','YIELD_GOLD',125),
('CITY_EVENT_POLLUTION_CLEANUP2','YIELD_GOLD',250),
('CITY_EVENT_POLLUTION_BAD_ACTOR','YIELD_GOLD',50);


INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,GrowthMod,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_DROUGHT_CHOICE_1','TXT_KEY_CITY_EVENT_DROUGHT_DESCRIPTION','TXT_KEY_CITY_EVENT_DROUGHT_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_SEVERE_DROUGHT_CHOICE_1','TXT_KEY_CITY_EVENT_SEVERE_DROUGHT_DESCRIPTION','TXT_KEY_CITY_EVENT_SEVERE_DROUGHT_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_CRITICAL_DROUGHT_CHOICE_1','TXT_KEY_CITY_EVENT_CRITICAL_DROUGHT_DESCRIPTION','TXT_KEY_CITY_EVENT_CRITICAL_DROUGHT_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_DROUGHT_FOREST_FIRE_CHOICE_1','TXT_KEY_CITY_EVENT_DROUGHT_FOREST_FIRE_DESCRIPTION','TXT_KEY_CITY_EVENT_DROUGHT_FOREST_FIRE_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_FOREST',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_ICE_AGE_EXPOSURE_CHOICE_1','TXT_KEY_CITY_EVENT_ICE_AGE_EXPOSURE_DESCRIPTION','TXT_KEY_CITY_EVENT_ICE_AGE_EXPOSURE_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_ICE_AGE_NO_FUEL_CHOICE_1','TXT_KEY_CITY_EVENT_ICE_AGE_NO_FUEL_DESCRIPTION','TXT_KEY_CITY_EVENT_ICE_AGE_NO_FUEL_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_ICE_AGE_FROZEN_WATER_CHOICE_1','TXT_KEY_CITY_EVENT_ICE_AGE_FROZEN_WATER_DESCRIPTION','TXT_KEY_CITY_EVENT_ICE_AGE_FROZEN_WATER_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_ICE_AGE_BITTER_WINDS_CHOICE_1','TXT_KEY_CITY_EVENT_ICE_AGE_BITTER_WINDS_DESCRIPTION','TXT_KEY_CITY_EVENT_ICE_AGE_BITTER_WINDS_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_RAINRAINRAIN1_CHOICE_1','TXT_KEY_CITY_EVENT_RAINRAINRAIN1_DESCRIPTION','TXT_KEY_CITY_EVENT_RAINRAINRAIN1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_RAINRAINRAIN2_CHOICE_1','TXT_KEY_CITY_EVENT_RAINRAINRAIN2_DESCRIPTION','TXT_KEY_CITY_EVENT_RAINRAINRAIN2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_RAINRAINRAIN3_CHOICE_1','TXT_KEY_CITY_EVENT_RAINRAINRAIN3_DESCRIPTION','TXT_KEY_CITY_EVENT_RAINRAINRAIN3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_RAINRAINRAIN4_CHOICE_1','TXT_KEY_CITY_EVENT_RAINRAINRAIN4_DESCRIPTION','TXT_KEY_CITY_EVENT_RAINRAINRAIN4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_RAINRAINRAIN5_CHOICE_1','TXT_KEY_CITY_EVENT_RAINRAINRAIN5_DESCRIPTION','TXT_KEY_CITY_EVENT_RAINRAINRAIN5_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_RAINRAINRAIN6_CHOICE_1','TXT_KEY_CITY_EVENT_RAINRAINRAIN6_DESCRIPTION','TXT_KEY_CITY_EVENT_RAINRAINRAIN6_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_RAINRAINRAIN7_CHOICE_1','TXT_KEY_CITY_EVENT_RAINRAINRAIN7_DESCRIPTION','TXT_KEY_CITY_EVENT_RAINRAINRAIN7_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,15,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_POLLUTION_MINOR_CHOICE_1','TXT_KEY_CITY_EVENT_POLLUTION_MINOR_DESCRIPTION','TXT_KEY_CITY_EVENT_POLLUTION_MINOR_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_POLLUTION_CLEANUP1_CHOICE_1','TXT_KEY_CITY_EVENT_POLLUTION_CLEANUP1_DESCRIPTION','TXT_KEY_CITY_EVENT_POLLUTION_CLEANUP1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_POLLUTION_MAJOR_CHOICE_1','TXT_KEY_CITY_EVENT_POLLUTION_MAJOR_DESCRIPTION','TXT_KEY_CITY_EVENT_POLLUTION_MAJOR_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_POLLUTION_CLEANUP2_CHOICE_1','TXT_KEY_CITY_EVENT_POLLUTION_CLEANUP2_DESCRIPTION','TXT_KEY_CITY_EVENT_POLLUTION_CLEANUP2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_POLLUTION_BAD_ACTOR_CHOICE_1','TXT_KEY_CITY_EVENT_POLLUTION_BAD_ACTOR_DESCRIPTION','TXT_KEY_CITY_EVENT_POLLUTION_BAD_ACTOR_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',10,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_ENVIRONMENTAL_REGULATIONS_DUMMY',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_PLAGUE1_CHOICE_1','TXT_KEY_CITY_EVENT_PLAGUE_DESCRIPTION','TXT_KEY_CITY_EVENT_PLAGUE_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',20,'true',6,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_PLAGUE2_CHOICE_1','TXT_KEY_CITY_EVENT_PLAGUE_DESCRIPTION','TXT_KEY_CITY_EVENT_PLAGUE_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',20,'true',6,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_VOLCANO_CHOICE_1','TXT_KEY_CITY_EVENT_VOLCANO_DESCRIPTION','TXT_KEY_CITY_EVENT_VOLCANO_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,10,0,1,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','TXT_KEY_CITY_EVENT_VOLCANO_SPECIAL_DESCRIPTION','TXT_KEY_CITY_EVENT_VOLCANO_SPECIAL_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,12,0,1,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_EARTHQUAKE_MINOR_CHOICE_1','TXT_KEY_CITY_EVENT_EARTHQUAKE_MINOR_DESCRIPTION','TXT_KEY_CITY_EVENT_EARTHQUAKE_MINOR_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,7,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','TXT_KEY_CITY_EVENT_EARTHQUAKE_MAJOR_DESCRIPTION','TXT_KEY_CITY_EVENT_EARTHQUAKE_MAJOR_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,15,0,1,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_AVALANCHE_CHOICE_1','TXT_KEY_CITY_EVENT_AVALANCHE_DESCRIPTION','TXT_KEY_CITY_EVENT_AVALANCHE_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_FOREST_FIRE_CHOICE_1','TXT_KEY_CITY_EVENT_FOREST_FIRE_DESCRIPTION','TXT_KEY_CITY_EVENT_FOREST_FIRE_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',15,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_FOREST',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_FOREST_FIRE_REGROWTH_CHOICE_1','TXT_KEY_CITY_EVENT_FOREST_FIRE_REGROWTH_DESCRIPTION','TXT_KEY_CITY_EVENT_FOREST_FIRE_REGROWTH_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',5,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_DROUGHT',NULL,'PLAYER_EVENT_HEAT_WAVE_CHOICE_2',NULL,NULL,'false','false','true'),
('CITY_EVENT_DROUGHT_SEVERE',NULL,'PLAYER_EVENT_HEAT_WAVE_CHOICE_3',NULL,NULL,'false','false','true'),
('CITY_EVENT_DROUGHT_CRITICAL',NULL,'PLAYER_EVENT_HEAT_WAVE_CHOICE_3',NULL,NULL,'false','false','true'),
('CITY_EVENT_DROUGHT_FOREST_FIRE','PLAYER_EVENT_HEAT_WAVE',NULL,NULL,NULL,'false','false','true'),
('CITY_EVENT_ICE_AGE_EXPOSURE',NULL,'PLAYER_EVENT_ICE_AGE_CHOICE_3',NULL,NULL,'false','false','true'),
('CITY_EVENT_ICE_AGE_NO_FUEL',NULL,'PLAYER_EVENT_ICE_AGE_CHOICE_3',NULL,NULL,'false','false','true'),
('CITY_EVENT_ICE_AGE_FROZEN_WATER',NULL,'PLAYER_EVENT_ICE_AGE_CHOICE_3',NULL,NULL,'false','false','true'),
('CITY_EVENT_ICE_AGE_BITTER_WINDS',NULL,'PLAYER_EVENT_ICE_AGE_CHOICE_3',NULL,NULL,'false','false','true'),
('CITY_EVENT_RAINRAINRAIN1','PLAYER_EVENT_RAINRAINRAIN',NULL,NULL,NULL,'false','false','true'),
('CITY_EVENT_RAINRAINRAIN2','PLAYER_EVENT_RAINRAINRAIN',NULL,NULL,NULL,'false','false','true'),
('CITY_EVENT_RAINRAINRAIN3','PLAYER_EVENT_RAINRAINRAIN',NULL,NULL,NULL,'false','false','true'),
('CITY_EVENT_RAINRAINRAIN4','PLAYER_EVENT_RAINRAINRAIN',NULL,NULL,NULL,'false','false','true'),
('CITY_EVENT_RAINRAINRAIN5','PLAYER_EVENT_RAINRAINRAIN',NULL,NULL,NULL,'false','false','true'),
('CITY_EVENT_RAINRAINRAIN6','PLAYER_EVENT_RAINRAINRAIN',NULL,NULL,NULL,'false','false','true'),
('CITY_EVENT_RAINRAINRAIN7',NULL,'PLAYER_EVENT_RAINRAINRAIN_CHOICE_3',NULL,NULL,'false','true','true'),
('CITY_EVENT_RAINRAINRAIN3',NULL,NULL,'CITY_EVENT_RAINRAINRAIN4',NULL,'false','true','false'),
('CITY_EVENT_RAINRAINRAIN3',NULL,NULL,'CITY_EVENT_RAINRAINRAIN7',NULL,'false','true','false'),
('CITY_EVENT_RAINRAINRAIN4',NULL,NULL,'CITY_EVENT_RAINRAINRAIN3',NULL,'false','true','false'),
('CITY_EVENT_RAINRAINRAIN4',NULL,NULL,'CITY_EVENT_RAINRAINRAIN7',NULL,'false','true','false'),
('CITY_EVENT_RAINRAINRAIN7',NULL,NULL,'CITY_EVENT_RAINRAINRAIN3',NULL,'false','true','false'),
('CITY_EVENT_RAINRAINRAIN7',NULL,NULL,'CITY_EVENT_RAINRAINRAIN4',NULL,'false','true','false'),
('CITY_EVENT_POLLUTION_MINOR',NULL,'PLAYER_EVENT_POLLUTION_CHOICE_2',NULL,NULL,'false','false','true'),
('CITY_EVENT_POLLUTION_MAJOR',NULL,'PLAYER_EVENT_POLLUTION_CLEANUP1_CHOICE_2',NULL,NULL,'false','false','true'),
('CITY_EVENT_POLLUTION_MAJOR',NULL,NULL,'CITY_EVENT_POLLUTION_MINOR',NULL,'false','true','true'),
('CITY_EVENT_POLLUTION_CLEANUP1',NULL,NULL,'CITY_EVENT_POLLUTION_MINOR',NULL,'false','true','true'),
('CITY_EVENT_POLLUTION_CLEANUP1',NULL,NULL,'CITY_EVENT_POLLUTION_MAJOR',NULL,'false','true','false'),
('CITY_EVENT_POLLUTION_CLEANUP2',NULL,'PLAYER_EVENT_POLLUTION_CLEANUP2_CHOICE_1',NULL,NULL,'false','false','true'),
('CITY_EVENT_POLLUTION_BAD_ACTOR',NULL,'PLAYER_EVENT_POLLUTION_CLEANUP2_CHOICE_1',NULL,NULL,'false','false','true'),
('CITY_EVENT_PLAGUE1',NULL,'PLAYER_EVENT_PLAGUE_CHOICE_1',NULL,NULL,'false','false','true'),
('CITY_EVENT_PLAGUE2',NULL,'PLAYER_EVENT_PLAGUE_CHOICE_2',NULL,NULL,'false','false','true'),
('CITY_EVENT_VOLCANO',NULL,NULL,'CITY_EVENT_VOLCANO_SPECIAL',NULL,'false','true','false'),
('CITY_EVENT_VOLCANO_SPECIAL',NULL,NULL,'CITY_EVENT_VOLCANO',NULL,'false','true','false'),
('CITY_EVENT_EARTHQUAKE_MINOR',NULL,NULL,'CITY_EVENT_EARTHQUAKE_MAJOR',NULL,'false','true','false'),
('CITY_EVENT_EARTHQUAKE_MAJOR',NULL,NULL,'CITY_EVENT_EARTHQUAKE_MINOR',NULL,'false','true','false'),
('CITY_EVENT_AVALANCHE',NULL,NULL,'CITY_EVENT_FOREST_FIRE',NULL,'false','true','false'),
('CITY_EVENT_FOREST_FIRE',NULL,NULL,'CITY_EVENT_FOREST_FIRE',NULL,'false','true','false'),
('CITY_EVENT_FOREST_FIRE','PLAYER_EVENT_RAINRAINRAIN',NULL,NULL,NULL,'false','true','false'),
('CITY_EVENT_FOREST_FIRE',NULL,NULL,'CITY_EVENT_AVALANCHE',NULL,'false','true','false'),
('CITY_EVENT_FOREST_FIRE_REGROWTH',NULL,NULL,'CITY_EVENT_FOREST_FIRE',NULL,'false','true','true');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_ICE_AGE_NO_FUEL_CHOICE_1','YIELD_PRODUCTION',50),
('CITY_EVENT_ICE_AGE_EXPOSURE_CHOICE_1','YIELD_POPULATION',1),
('CITY_EVENT_PLAGUE1_CHOICE_1','YIELD_POPULATION',2),
('CITY_EVENT_PLAGUE2_CHOICE_1','YIELD_POPULATION',2),
('CITY_EVENT_NUCLEAR_MELTDOWN_CHOICE_1','YIELD_POPULATION',5),
('CITY_EVENT_VOLCANO_CHOICE_1','YIELD_POPULATION',3),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','YIELD_POPULATION',3);

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_RAINRAINRAIN1_CHOICE_1','YIELD_FOOD',50),
('CITY_EVENT_POLLUTION_CLEANUP1_CHOICE_1','YIELD_GOLD',-125),
('CITY_EVENT_POLLUTION_CLEANUP2_CHOICE_1','YIELD_GOLD',-250),
('CITY_EVENT_POLLUTION_BAD_ACTOR_CHOICE_1','YIELD_GOLD',-50);

INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_ICE_AGE_FROZEN_WATER_CHOICE_1','YIELD_GOLD',-3),
('CITY_EVENT_RAINRAINRAIN6_CHOICE_1','YIELD_GOLD',-3);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_DROUGHT_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',-1),
('CITY_EVENT_SEVERE_DROUGHT_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',-1),
('CITY_EVENT_CRITICAL_DROUGHT_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',-2),
('CITY_EVENT_ICE_AGE_BITTER_WINDS_CHOICE_1','IMPROVEMENT_LUMBERMILL','YIELD_PRODUCTION',-1),
('CITY_EVENT_ICE_AGE_BITTER_WINDS_CHOICE_1','IMPROVEMENT_PASTURE','YIELD_PRODUCTION',-1),
('CITY_EVENT_ICE_AGE_BITTER_WINDS_CHOICE_1','IMPROVEMENT_QUARRY','YIELD_PRODUCTION',-1),
('CITY_EVENT_ICE_AGE_BITTER_WINDS_CHOICE_1','IMPROVEMENT_FARM','YIELD_PRODUCTION',-1),
('CITY_EVENT_RAINRAINRAIN3_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',1),
('CITY_EVENT_RAINRAINRAIN3_CHOICE_1','IMPROVEMENT_PLANTATION','YIELD_FOOD',1),
('CITY_EVENT_RAINRAINRAIN4_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',-1),
('CITY_EVENT_RAINRAINRAIN5_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',-1),
('CITY_EVENT_RAINRAINRAIN7_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',-2),
('CITY_EVENT_POLLUTION_MINOR_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',-1),
('CITY_EVENT_POLLUTION_CLEANUP1_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',1),
('CITY_EVENT_POLLUTION_MAJOR_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',-1),
('CITY_EVENT_POLLUTION_CLEANUP2_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',2),
('CITY_EVENT_POLLUTION_BAD_ACTOR_CHOICE_1','IMPROVEMENT_FARM','YIELD_FOOD',-1);

INSERT INTO CityEventChoice_ResourceYieldChange (CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES 
('CITY_EVENT_SEVERE_DROUGHT_CHOICE_1','RESOURCE_SHEEP','YIELD_FOOD',-1),
('CITY_EVENT_SEVERE_DROUGHT_CHOICE_1','RESOURCE_COW','YIELD_FOOD',-1),
('CITY_EVENT_CRITICAL_DROUGHT_CHOICE_1','RESOURCE_SHEEP','YIELD_FOOD',-1),
('CITY_EVENT_CRITICAL_DROUGHT_CHOICE_1','RESOURCE_COW','YIELD_FOOD',-1);

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES 
('CITY_EVENT_DROUGHT_FOREST_FIRE_CHOICE_1','FEATURE_FOREST','YIELD_PRODUCTION',-1),
('CITY_EVENT_RAINRAINRAIN2_CHOICE_1','FEATURE_FLOOD_PLAINS','YIELD_FOOD',-1),
('CITY_EVENT_RAINRAINRAIN2_CHOICE_1','FEATURE_OASIS','YIELD_FOOD',-1),
('CITY_EVENT_FOREST_FIRE_CHOICE_1','FEATURE_FOREST','YIELD_PRODUCTION',-1),
('CITY_EVENT_FOREST_FIRE_REGROWTH_CHOICE_1','FEATURE_FOREST','YIELD_FOOD',1);

INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES 
('CITY_EVENT_RAINRAINRAIN2_CHOICE_1','TERRAIN_DESERT','YIELD_FOOD',1);

INSERT INTO CityEventChoice_ImprovementDestructionRandom(CityEventChoiceType,ImprovementType,Number) VALUES
('CITY_EVENT_VOLCANO_CHOICE_1','IMPROVEMENT_FARM',2),
('CITY_EVENT_VOLCANO_CHOICE_1','IMPROVEMENT_TRADING_POST',2),
('CITY_EVENT_VOLCANO_CHOICE_1','IMPROVEMENT_QUARRY',2),
('CITY_EVENT_VOLCANO_CHOICE_1','IMPROVEMENT_MINE',2),
('CITY_EVENT_VOLCANO_CHOICE_1','IMPROVEMENT_LUMBERMILL',2),
('CITY_EVENT_VOLCANO_CHOICE_1','IMPROVEMENT_PASTURE',2),
('CITY_EVENT_VOLCANO_CHOICE_1','IMPROVEMENT_PLANTATION',2),
('CITY_EVENT_VOLCANO_CHOICE_1','IMPROVEMENT_CAMP',2),
('CITY_EVENT_VOLCANO_CHOICE_1','IMPROVEMENT_TERRACE_FARM',2),
('CITY_EVENT_VOLCANO_CHOICE_1','IMPROVEMENT_ACADEMY',1),
('CITY_EVENT_VOLCANO_CHOICE_1','IMPROVEMENT_CUSTOMS_HOUSE',1),
('CITY_EVENT_VOLCANO_CHOICE_1','IMPROVEMENT_MANUFACTORY',1),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','IMPROVEMENT_FARM',2),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','IMPROVEMENT_TRADING_POST',2),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','IMPROVEMENT_QUARRY',2),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','IMPROVEMENT_MINE',2),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','IMPROVEMENT_LUMBERMILL',2),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','IMPROVEMENT_PASTURE',2),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','IMPROVEMENT_PLANTATION',2),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','IMPROVEMENT_CAMP',2),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','IMPROVEMENT_TERRACE_FARM',2),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','IMPROVEMENT_ACADEMY',1),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','IMPROVEMENT_CUSTOMS_HOUSE',1),
('CITY_EVENT_VOLCANO_SPECIAL_CHOICE_1','IMPROVEMENT_MANUFACTORY',1),
('CITY_EVENT_EARTHQUAKE_MINOR_CHOICE_1','IMPROVEMENT_FARM',1),
('CITY_EVENT_EARTHQUAKE_MINOR_CHOICE_1','IMPROVEMENT_TRADING_POST',1),
('CITY_EVENT_EARTHQUAKE_MINOR_CHOICE_1','IMPROVEMENT_QUARRY',1),
('CITY_EVENT_EARTHQUAKE_MINOR_CHOICE_1','IMPROVEMENT_MINE',1),
('CITY_EVENT_EARTHQUAKE_MINOR_CHOICE_1','IMPROVEMENT_LUMBERMILL',1),
('CITY_EVENT_EARTHQUAKE_MINOR_CHOICE_1','IMPROVEMENT_PASTURE',1),
('CITY_EVENT_EARTHQUAKE_MINOR_CHOICE_1','IMPROVEMENT_PLANTATION',1),
('CITY_EVENT_EARTHQUAKE_MINOR_CHOICE_1','IMPROVEMENT_CAMP',1),
('CITY_EVENT_EARTHQUAKE_MINOR_CHOICE_1','IMPROVEMENT_TERRACE_FARM',1),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','IMPROVEMENT_FARM',3),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','IMPROVEMENT_TRADING_POST',3),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','IMPROVEMENT_QUARRY',3),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','IMPROVEMENT_MINE',3),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','IMPROVEMENT_LUMBERMILL',3),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','IMPROVEMENT_PASTURE',3),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','IMPROVEMENT_PLANTATION',3),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','IMPROVEMENT_CAMP',3),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','IMPROVEMENT_TERRACE_FARM',3),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','IMPROVEMENT_ACADEMY',2),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','IMPROVEMENT_CUSTOMS_HOUSE',2),
('CITY_EVENT_EARTHQUAKE_MAJOR_CHOICE_1','IMPROVEMENT_MANUFACTORY',2),
('CITY_EVENT_AVALANCHE_CHOICE_1','IMPROVEMENT_FARM',1),
('CITY_EVENT_AVALANCHE_CHOICE_1','IMPROVEMENT_TRADING_POST',1),
('CITY_EVENT_AVALANCHE_CHOICE_1','IMPROVEMENT_QUARRY',1),
('CITY_EVENT_AVALANCHE_CHOICE_1','IMPROVEMENT_MINE',1),
('CITY_EVENT_AVALANCHE_CHOICE_1','IMPROVEMENT_LUMBERMILL',1),
('CITY_EVENT_AVALANCHE_CHOICE_1','IMPROVEMENT_PASTURE',1),
('CITY_EVENT_AVALANCHE_CHOICE_1','IMPROVEMENT_PLANTATION',1),
('CITY_EVENT_AVALANCHE_CHOICE_1','IMPROVEMENT_CAMP',1),
('CITY_EVENT_AVALANCHE_CHOICE_1','IMPROVEMENT_TERRACE_FARM',1),
('CITY_EVENT_FOREST_FIRE_CHOICE_1','IMPROVEMENT_LUMBERMILL',3);