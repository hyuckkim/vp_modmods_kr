INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_CITY_FIRE','EVENT_CLASS_BAD','TXT_KEY_CITY_EVENT_CITY_FIRE_DESCRIPTION','TXT_KEY_CITY_EVENT_CITY_FIRE_HELP','badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',10,1,'false','false','false',50,2,6,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_DRY_TOWN_DUMMY',NULL,'false','false',NUlL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_CITY_FIRE_FLAVOR','EVENT_CLASS_NEUTRAL',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_INTERFACE_CITY_TILE',10,1,'false','false','false',50,1,5,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NUlL,NULL,NULL,'false','false','false','false','false','true','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_CITY_FIRE_NOMORE','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_CITY_FIRE_NOMORE_DESCRIPTION','TXT_KEY_CITY_EVENT_CITY_FIRE_NOMORE_HELP','cityeventdefaultbackground.dds','AS2D_INTERFACE_CITY_TILE',25,1,'false','true','false',50,2,6,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false','TECH_MASONRY',NULL,'false',NULL,NULL,'false','BUILDINGCLASS_DRY_TOWN_DUMMY',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NUCLEAR_MELTDOWN','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',10,0,'false','false','false',100,1,15,0,NULL,NULL,NULL,'true','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_NUCLEAR_PLANT',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_HURRICANE_LEVEE','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_HURRICANE_LEVEE','TXT_KEY_CITY_EVENT_HURRICANE_LEVEE_HELP','cityeventdefaultbackground.dds','AS2D_EVENT_CHOICE',25,1,'false','true','false',50,2,8,0,NULL,'ERA_INDUSTRIAL',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','true','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_MINOR_HURRICANE','EVENT_CLASS_BAD','TXT_KEY_CITY_EVENT_MINOR_HURRICANE_DESCRIPTION','TXT_KEY_CITY_EVENT_MINOR_HURRICANE_HELP','badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',4,2,'false','true','false',50,5,8,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','true','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_MAJOR_HURRICANE','EVENT_CLASS_BAD','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_DESCRIPTION','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_HELP','badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',4,0,'false','true','false',125,5,8,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,'BUILDINGCLASS_HURRICANE_LEVEE','false','false',NULL,NULL,NULL,'false','false','false','false','true','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_MAJOR_HURRICANE2','EVENT_CLASS_BAD','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_DESCRIPTION','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_HELP','badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',4,0,'false','true','false',125,5,8,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_HURRICANE_LEVEE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','true','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_PESTILENCE','EVENT_CLASS_BAD','TXT_KEY_CITY_EVENT_PESTILENCE','TXT_KEY_CITY_EVENT_PESTILENCE_HELP','badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',5,1,'false','false','false',150,3,10,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_PESTILENCE2','EVENT_CLASS_BAD','TXT_KEY_CITY_EVENT_PESTILENCE2','TXT_KEY_CITY_EVENT_PESTILENCE_HELP','badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',5,1,'false','false','false',150,3,10,0,NULL,'ERA_INDUSTRIAL',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_FARM','false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_CITY_FIRE_CHOICE_1','CITY_EVENT_CITY_FIRE'),
('CITY_EVENT_CITY_FIRE_CHOICE_2','CITY_EVENT_CITY_FIRE'),
('CITY_EVENT_CITY_FIRE_FLAVOR_CHOICE_1','CITY_EVENT_CITY_FIRE_FLAVOR'),
('CITY_EVENT_CITY_FIRE_NOMORE_CHOICE_1','CITY_EVENT_CITY_FIRE_NOMORE'),
('CITY_EVENT_CITY_FIRE_NOMORE_CHOICE_2','CITY_EVENT_CITY_FIRE_NOMORE'),
('CITY_EVENT_NUCLEAR_MELTDOWN_CHOICE_1','CITY_EVENT_NUCLEAR_MELTDOWN'),
('CITY_EVENT_HURRICANE_LEVEE_CHOICE_1','CITY_EVENT_HURRICANE_LEVEE'),
('CITY_EVENT_HURRICANE_LEVEE_CHOICE_2','CITY_EVENT_HURRICANE_LEVEE'),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_1','CITY_EVENT_MINOR_HURRICANE'),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_2','CITY_EVENT_MINOR_HURRICANE'),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_3','CITY_EVENT_MINOR_HURRICANE'),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_4','CITY_EVENT_MINOR_HURRICANE'),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_1','CITY_EVENT_MAJOR_HURRICANE'),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_2','CITY_EVENT_MAJOR_HURRICANE'),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_3','CITY_EVENT_MAJOR_HURRICANE'),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_4','CITY_EVENT_MAJOR_HURRICANE'),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_1','CITY_EVENT_MAJOR_HURRICANE2'),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_2','CITY_EVENT_MAJOR_HURRICANE2'),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_3','CITY_EVENT_MAJOR_HURRICANE2'),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_5','CITY_EVENT_MAJOR_HURRICANE2'),
('CITY_EVENT_PESTILENCE_CHOICE_1','CITY_EVENT_PESTILENCE'),
('CITY_EVENT_PESTILENCE_CHOICE_2','CITY_EVENT_PESTILENCE'),
('CITY_EVENT_PESTILENCE_CHOICE_3','CITY_EVENT_PESTILENCE'),
('CITY_EVENT_PESTILENCE2_CHOICE_1','CITY_EVENT_PESTILENCE2'),
('CITY_EVENT_PESTILENCE2_CHOICE_2','CITY_EVENT_PESTILENCE2'),
('CITY_EVENT_PESTILENCE2_CHOICE_3','CITY_EVENT_PESTILENCE2');

INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES
('CITY_EVENT_CITY_FIRE_NOMORE','YIELD_GOLD',125),
('CITY_EVENT_HURRICANE_LEVEE','YIELD_GOLD',500);

--------------------------------------------------------------------------------------------------
-- Dummy Building for Hurrican Levee Event
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding,NoLimit) VALUES 
('BUILDINGCLASS_HURRICANE_LEVEE','BUILDING_HURRICANE_LEVEE',0);

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,GoldMaintenance,IsDummy,NeverCapture,NukeImmune) VALUES
('BUILDING_HURRICANE_LEVEE','BUILDINGCLASS_HURRICANE_LEVEE','TXT_KEY_BUILDING_HURRICANE_LEVEE','TXT_KEY_BUILDING_HURRICANE_LEVEE_HELP',-1,-1,3,1,1,1);
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,GrowthMod,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_CITY_FIRE_CHOICE_1','TXT_KEY_CITY_EVENT_CITY_FIRE_CHOICE_1_DESCRIPTION','TXT_KEY_CITY_EVENT_CITY_FIRE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,15,5,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_CITY_FIRE_CHOICE_2','TXT_KEY_CITY_EVENT_CITY_FIRE_CHOICE_2_DESCRIPTION','TXT_KEY_CITY_EVENT_CITY_FIRE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,5,0,2,-2,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_CITY_FIRE_FLAVOR_CHOICE_1','TXT_KEY_CITY_EVENT_CITY_FIRE_FLAVOR_CHOICE_1_DESCRIPTION','TXT_KEY_CITY_EVENT_CITY_FIRE_FLAVOR_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_CITY_FIRE_NOMORE_CHOICE_1','TXT_KEY_CITY_EVENT_CITY_FIRE_NOMORE_CHOICE_1_DESCRIPTION','TXT_KEY_CITY_EVENT_CITY_FIRE_NOMORE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_CITY_FIRE_NOMORE_CHOICE_2','TXT_KEY_CITY_EVENT_CITY_FIRE_NOMORE_CHOICE_2_DESCRIPTION','TXT_KEY_CITY_EVENT_CITY_FIRE_NOMORE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_NUCLEAR_MELTDOWN_CHOICE_1','TXT_KEY_CITY_EVENT_NUCLEAR_MELTDOWN_DESCRIPTION','TXT_KEY_CITY_EVENT_NUCLEAR_MELTDOWN_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',15,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','BUILDINGCLASS_NUCLEAR_PLANT',NULL,15,0,3,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_HURRICANE_LEVEE_CHOICE_1','TXT_KEY_CITY_EVENT_HURRICANE_LEVEE_CHOICE_1_DESCRIPTION','TXT_KEY_CITY_EVENT_HURRICANE_LEVEE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_HURRICANE_LEVEE',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_HURRICANE_LEVEE_CHOICE_2','TXT_KEY_CITY_EVENT_HURRICANE_LEVEE_CHOICE_2_DESCRIPTION','TXT_KEY_CITY_EVENT_DO_NOTHING_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_MINOR_HURRICANE_CHOICE_1','TXT_KEY_CITY_EVENT_MINOR_HURRICANE_CHOICE_1_DESCRIPTION','TXT_KEY_CITY_EVENT_MINOR_HURRICANE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',33,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_MINOR_HURRICANE_CHOICE_2','TXT_KEY_CITY_EVENT_MINOR_HURRICANE_CHOICE_2_DESCRIPTION','TXT_KEY_CITY_EVENT_MINOR_HURRICANE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',33,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,7,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_MINOR_HURRICANE_CHOICE_3','TXT_KEY_CITY_EVENT_MINOR_HURRICANE_CHOICE_3_DESCRIPTION','TXT_KEY_CITY_EVENT_MINOR_HURRICANE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',33,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_MINOR_HURRICANE_CHOICE_4','TXT_KEY_CITY_EVENT_MINOR_HURRICANE_CHOICE_4_DESCRIPTION','TXT_KEY_CITY_EVENT_MINOR_HURRICANE_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',33,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,7,0,2,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_MAJOR_HURRICANE_CHOICE_1','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_1_DESCRIPTION','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',33,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,5,0,1,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_MAJOR_HURRICANE_CHOICE_2','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_2_DESCRIPTION','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',33,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,15,0,1,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_MAJOR_HURRICANE_CHOICE_3','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_3_DESCRIPTION','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',33,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','true','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,5,0,1,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_MAJOR_HURRICANE_CHOICE_4','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_4_DESCRIPTION','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',33,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','true','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_HURRICANE_LEVEE',15,0,3,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_MAJOR_HURRICANE_CHOICE_5','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_5_DESCRIPTION','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_5_HELP',NULL,'AS2D_EVENT_CHOICE',10,'false','false',30,'false',0,0,NULL,'ERA_INDUSTRIAL','false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','true','false','false','false','false','false','false','false','false','BUILDINGCLASS_HURRICANE_LEVEE',NULL,10,0,1,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_PESTILENCE_CHOICE_1','TXT_KEY_CITY_EVENT_PESTILENCE_CHOICE_1_DESCRIPTION','TXT_KEY_CITY_EVENT_PESTILENCE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',-1,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_EDUCATION',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_PESTILENCE_CHOICE_2','TXT_KEY_CITY_EVENT_PESTILENCE_CHOICE_2_DESCRIPTION','TXT_KEY_CITY_EVENT_PESTILENCE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_PESTILENCE_CHOICE_3','TXT_KEY_CITY_EVENT_PESTILENCE_CHOICE_3_DESCRIPTION','TXT_KEY_CITY_EVENT_PESTILENCE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',15,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_PESTILENCE2_CHOICE_1','TXT_KEY_CITY_EVENT_PESTILENCE2_CHOICE_1_DESCRIPTION','TXT_KEY_CITY_EVENT_PESTILENCE2_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',-1,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_EDUCATION',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_PESTILENCE2_CHOICE_2','TXT_KEY_CITY_EVENT_PESTILENCE2_CHOICE_2_DESCRIPTION','TXT_KEY_CITY_EVENT_PESTILENCE2_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0),

('CITY_EVENT_PESTILENCE2_CHOICE_3','TXT_KEY_CITY_EVENT_PESTILENCE2_CHOICE_3_DESCRIPTION','TXT_KEY_CITY_EVENT_PESTILENCE2_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',15,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_CITY_FIRE',NULL,NULL,NULL,'CITY_EVENT_CITY_FIRE_NOMORE_CHOICE_1','false','true','false'),
('CITY_EVENT_MINOR_HURRICANE',NULL,NULL,NULL,'CITY_EVENT_HURRICANE_LEVEE_CHOICE_1','false','true','false'),
('CITY_EVENT_PESTILENCE',NULL,NULL,NULL,'CITY_EVENT_PESTILENCE_CHOICE_1','false','true','false'),
('CITY_EVENT_PESTILENCE2',NULL,NULL,NULL,'CITY_EVENT_PESTILENCE2_CHOICE_1','false','true','false');

INSERT INTO CityEventChoice_MinimumStartYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_MINOR_HURRICANE_CHOICE_1','YIELD_PRODUCTION',125),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_2','YIELD_GOLD',250),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_3','YIELD_PRODUCTION',125),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_3','YIELD_GOLD',250),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_1','YIELD_PRODUCTION',125),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_2','YIELD_GOLD',250),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_3','YIELD_PRODUCTION',125),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_3','YIELD_GOLD',250);

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_MINOR_HURRICANE_CHOICE_1','YIELD_PRODUCTION',125),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_2','YIELD_GOLD',250),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_3','YIELD_PRODUCTION',125),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_3','YIELD_GOLD',250),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_1','YIELD_PRODUCTION',125),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_2','YIELD_GOLD',250),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_3','YIELD_PRODUCTION',125),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_3','YIELD_GOLD',250),
('CITY_EVENT_PESTILENCE_CHOICE_1','YIELD_SCIENCE',225),
('CITY_EVENT_PESTILENCE_CHOICE_2','YIELD_FOOD',200),
('CITY_EVENT_PESTILENCE2_CHOICE_1','YIELD_SCIENCE',225),
('CITY_EVENT_PESTILENCE2_CHOICE_2','YIELD_FOOD',200);

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_CITY_FIRE_CHOICE_2','YIELD_POPULATION',-1),
('CITY_EVENT_CITY_FIRE_NOMORE_CHOICE_1','YIELD_GOLD',-100),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_1','YIELD_POPULATION',-1),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_4','YIELD_POPULATION',-2),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_1','YIELD_POPULATION',-3),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_4','YIELD_POPULATION',-4),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_5','YIELD_POPULATION',-2),
('CITY_EVENT_HURRICANE_LEVEE_CHOICE_1','YIELD_GOLD',-500);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_PESTILENCE_CHOICE_3','IMPROVEMENT_FARM','YIELD_FOOD',-1),
('CITY_EVENT_PESTILENCE2_CHOICE_3','IMPROVEMENT_FARM','YIELD_FOOD',-1);

INSERT INTO CityEventChoice_ResourceYieldChange (CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES 
('CITY_EVENT_PESTILENCE_CHOICE_3','RESOURCE_SHEEP','YIELD_FOOD',-1),
('CITY_EVENT_PESTILENCE_CHOICE_3','RESOURCE_COW','YIELD_FOOD',-1);

INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES 
('CITY_EVENT_PESTILENCE2_CHOICE_3','TERRAIN_GRASS','YIELD_FOOD',-1);

INSERT INTO CityEventChoice_ImprovementDestructionRandom(CityEventChoiceType,ImprovementType,Number) VALUES
('CITY_EVENT_PESTILENCE_CHOICE_1','IMPROVEMENT_FARM',2);

INSERT INTO CityEventChoice_Notification(CityEventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedCityCoordinates,NeedPlayerID,ExtraVariable) VALUES
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_1_SUCCESSFUL','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_SUCCESSFUL_S','true','true','false',-1),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_2','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_2_SUCCESSFUL','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_SUCCESSFUL_S','true','true','false',-1),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_3','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_3_SUCCESSFUL','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_SUCCESSFUL_S','true','true','false',-1),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_4','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_4_SUCCESSFUL','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_SUCCESSFUL_S','true','true','false',-1),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_5','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_CHOICE_5_SUCCESSFUL','TXT_KEY_CITY_EVENT_MAJOR_HURRICANE_SUCCESSFUL_S','true','true','false',-1);

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_CITY_FIRE_CHOICE_1','FLAVOR_GROWTH',15),
('CITY_EVENT_CITY_FIRE_CHOICE_1','FLAVOR_HAPPINESS',5),
('CITY_EVENT_CITY_FIRE_CHOICE_2','FLAVOR_INFRASTRUCTURE',20),
('CITY_EVENT_CITY_FIRE_NOMORE_CHOICE_1','FLAVOR_INFRASTRUCTURE',20),
('CITY_EVENT_CITY_FIRE_NOMORE_CHOICE_2','FLAVOR_GOLD',20),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_1','FLAVOR_INFRASTRUCTURE',20),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_2','FLAVOR_GROWTH',20),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_3','FLAVOR_HAPPINESS',30),
('CITY_EVENT_MINOR_HURRICANE_CHOICE_4','FLAVOR_GOLD',20),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_1','FLAVOR_INFRASTRUCTURE',20),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_2','FLAVOR_GROWTH',20),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_3','FLAVOR_HAPPINESS',30),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_4','FLAVOR_GOLD',20),
('CITY_EVENT_MAJOR_HURRICANE_CHOICE_5','FLAVOR_GOLD',20),
('CITY_EVENT_PESTILENCE_CHOICE_2','FLAVOR_GROWTH',2),
('CITY_EVENT_PESTILENCE_CHOICE_3','FLAVOR_GROWTH',5);