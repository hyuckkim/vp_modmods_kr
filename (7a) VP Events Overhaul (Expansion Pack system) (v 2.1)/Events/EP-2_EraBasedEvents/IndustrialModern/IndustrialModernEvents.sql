INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_BANK_DECISION','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_BANK_DECISION_DESCRIPTION','TXT_KEY_PLAYER_EVENT_BANK_DECISION_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',20,1,'true','false','false','false',30,3,30,4,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_BANK',NULL,'false','false','false','false','true','false','false'),

('PLAYER_EVENT_WINDMILLS_MODERNIZE','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_WINDMILLS_MODERNIZE_DESCRIPTION','TXT_KEY_PLAYER_EVENT_WINDMILLS_MODERNIZE_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',20,1,'true','false','true','false',30,3,0,0,NULL,'ERA_MODERN',NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_WINDMILL',NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_CORRUPTION_SCIENCE_FAILURE','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',20,1,'false','false','false','true',75,1,10,3,NULL,NULL,NULL,'true','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_BABY_BOOM','EVENT_CLASS_GOOD',NULL,NULL,NULL,'AS2D_INTERFACE_BORDERS_EXPAND',15,1,'false','false','false','false',100,1,0,3,NULL,'ERA_INDUSTRIAL',NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_ADVISOR_DEBATE','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_ADVISOR_DEBATE','TXT_KEY_PLAYER_EVENT_ADVISOR_DEBATE_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',20,1,'false','false','true','true',100,4,15,3,NULL,'ERA_INDUSTRIAL',NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','true','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_BANK_DECISION_CHOICE_1','PLAYER_EVENT_BANK_DECISION'),
('PLAYER_EVENT_BANK_DECISION_CHOICE_2','PLAYER_EVENT_BANK_DECISION'),
('PLAYER_EVENT_BANK_DECISION_CHOICE_3','PLAYER_EVENT_BANK_DECISION'),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_1','PLAYER_EVENT_WINDMILLS_MODERNIZE'),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_2','PLAYER_EVENT_WINDMILLS_MODERNIZE'),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_3','PLAYER_EVENT_WINDMILLS_MODERNIZE'),
('PLAYER_EVENT_NO_CHOICE','PLAYER_EVENT_WINDMILLS_MODERNIZE'),
('PLAYER_EVENT_CORRUPTION_SCIENCE_FAILURE_CHOICE_1','PLAYER_EVENT_CORRUPTION_SCIENCE_FAILURE'),
('PLAYER_EVENT_BABY_BOOM_CHOICE_1','PLAYER_EVENT_BABY_BOOM'),
('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_1','PLAYER_EVENT_ADVISOR_DEBATE'),
('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_2','PLAYER_EVENT_ADVISOR_DEBATE'),
('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_3','PLAYER_EVENT_ADVISOR_DEBATE'),
('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_4','PLAYER_EVENT_ADVISOR_DEBATE');

--------------------------------------------------------------------------------------------------
-- New Peacekeeping Promotion for Advisor Debate Choice 4 --
--------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions(Type, Description, Help, Sound, OrderPriority, PortraitIndex, IconAtlas, PediaType, FriendlyLandsModifier, OutsideFriendlyLandsModifier, CannotBeChosen, PediaEntry) VALUES
('PROMOTION_PEACEKEEPER', 'TXT_KEY_PROMOTION_PEACEKEEPER', 'TXT_KEY_PROMOTION_PEACEKEEPER_HELP', 'AS2D_IF_LEVELUP', 99, 7, 'promoVP_atlas_01', 'PEDIA_SHARED', 10, -10, 'true', 'TXT_KEY_PROMOTION_PEACEKEEPER');

INSERT INTO UnitPromotions_UnitCombats (PromotionType, UnitCombatType) VALUES
('PROMOTION_PEACEKEEPER','UNITCOMBAT_MELEE'),
('PROMOTION_PEACEKEEPER','UNITCOMBAT_ARCHER'),
('PROMOTION_PEACEKEEPER','UNITCOMBAT_RECON'),
('PROMOTION_PEACEKEEPER','UNITCOMBAT_MOUNTED'),
('PROMOTION_PEACEKEEPER','UNITCOMBAT_SIEGE'),
('PROMOTION_PEACEKEEPER','UNITCOMBAT_GUN'),
('PROMOTION_PEACEKEEPER','UNITCOMBAT_ARMOR');
--------------------------------------------------------------------------------------------------
-- End Promotion Addition
--------------------------------------------------------------------------------------------------

INSERT INTO Event_MinimumStartYield(EventType,YieldType,Yield) VALUES
('PLAYER_EVENT_WINDMILLS_MODERNIZE','YIELD_GOLD',250),
('PLAYER_EVENT_CORRUPTION_SCIENCE_FAILURE','YIELD_SCIENCE',75);

INSERT INTO Event_MinimumResourceRequired(EventType,ResourceType,Quantity) VALUES
('PLAYER_EVENT_WINDMILLS_MODERNIZE','RESOURCE_IRON',2);

INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_BANK_DECISION_CHOICE_1','TXT_KEY_PLAYER_EVENT_BANK_DECISION_CHOICE_1','TXT_KEY_PLAYER_EVENT_BANK_DECISION_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false','IMPROVEMENT_ACADEMY',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,-5,0,0,0),

('PLAYER_EVENT_BANK_DECISION_CHOICE_2','TXT_KEY_PLAYER_EVENT_BANK_DECISION_CHOICE_2','TXT_KEY_PLAYER_EVENT_BANK_DECISION_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_BANK_DECISION_CHOICE_3','TXT_KEY_PLAYER_EVENT_BANK_DECISION_CHOICE_3','TXT_KEY_PLAYER_EVENT_BANK_DECISION_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_1','TXT_KEY_PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_1','TXT_KEY_PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false','IMPROVEMENT_FARM',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_2','TXT_KEY_PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_2','TXT_KEY_PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_3','TXT_KEY_PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_3','TXT_KEY_PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0), 

('PLAYER_EVENT_NO_CHOICE','TXT_KEY_PLAYER_EVENT_NO_CHOICE','TXT_KEY_PLAYER_EVENT_NO_CHOICE_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_CORRUPTION_SCIENCE_FAILURE_CHOICE_1','TXT_KEY_PLAYER_EVENT_CORRUPTION_SCIENCE_FAILURE_CHOICE_1','TXT_KEY_PLAYER_EVENT_CORRUPTION_SCIENCE_FAILURE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_BABY_BOOM_CHOICE_1','TXT_KEY_PLAYER_EVENT_BABY_BOOM_CHOICE_1','TXT_KEY_PLAYER_EVENT_BABY_BOOM_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','true',NULL,NULL,NULL,NULL,0,0,0,5,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_1','TXT_KEY_PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_1','TXT_KEY_PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_MINT',NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_2','TXT_KEY_PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_2','TXT_KEY_PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',17,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','true','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_3','TXT_KEY_PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_3','TXT_KEY_PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_BANK',NULL,'false','false','true','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_4','TXT_KEY_PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_4','TXT_KEY_PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE','false',50,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,'PROMOTION_PEACEKEEPER',NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);

UPDATE EventChoices
SET EventFreeTechs = 1
WHERE Type = 'PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_2';

INSERT INTO EventChoice_ResourceQuantity(EventChoiceType,ResourceType,Quantity) VALUES
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_1','RESOURCE_IRON',-2),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_2','RESOURCE_IRON',-2);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID,Variable1,Variable2) VALUES
('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_2','NOTIFICATION_GENERIC','TXT_KEY_PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_2_SUCCESSFUL','TXT_KEY_PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_2_SUCCESSFUL_S','false','false',-1,-1);

INSERT INTO EventChoice_MinimumStartYield(EventChoiceType,YieldType,Yield) VALUES
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_1','YIELD_GOLD',250),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_2','YIELD_GOLD',250),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_3','YIELD_GOLD',150);

INSERT INTO EventChoice_MinimumResourceRequired(EventChoiceType,ResourceType,Quantity) VALUES
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_1','RESOURCE_IRON',2),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_2','RESOURCE_IRON',2);

INSERT INTO EventChoice_InstantYield(EventChoiceType,YieldType,Yield) VALUES
('PLAYER_EVENT_BABY_BOOM_CHOICE_1','YIELD_POPULATION',1);

INSERT INTO EventChoice_EventCostYield(EventChoiceType,YieldType,Yield) VALUES
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_1','YIELD_GOLD',250),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_2','YIELD_GOLD',250),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_3','YIELD_GOLD',150),
('PLAYER_EVENT_CORRUPTION_SCIENCE_FAILURE_CHOICE_1','YIELD_SCIENCE',75);

INSERT INTO EventChoice_BuildingClassYieldModifier(EventChoiceType,BuildingClassType,YieldType,Modifier) VALUES
('PLAYER_EVENT_BANK_DECISION_CHOICE_3','BUILDINGCLASS_PALACE','YIELD_GOLD',5),
('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_3','BUILDINGCLASS_BANK','YIELD_GOLD',5);

INSERT INTO EventChoice_BuildingClassYieldChange(EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_BANK_DECISION_CHOICE_2','BUILDINGCLASS_BANK','YIELD_GOLD',3),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_3','BUILDINGCLASS_WINDMILL','YIELD_PRODUCTION',2),
('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_1','BUILDINGCLASS_MINT','YIELD_TOURISM',2);

INSERT INTO EventChoice_ImprovementYieldChange(EventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_1','IMPROVEMENT_FARM','YIELD_PRODUCTION',1),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_2','IMPROVEMENT_MINE','YIELD_PRODUCTION',1);

INSERT INTO EventChoiceFlavors(EventChoiceType,FlavorType,Flavor) VALUES
('PLAYER_EVENT_BANK_DECISION_CHOICE_1','FLAVOR_GOLD',10),
('PLAYER_EVENT_BANK_DECISION_CHOICE_2','FLAVOR_GOLD',10),
('PLAYER_EVENT_BANK_DECISION_CHOICE_3','FLAVOR_GOLD',10),
('PLAYER_EVENT_NO_CHOICE','FLAVOR_GOLD',5),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_1','FLAVOR_GROWTH',15),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_2','FLAVOR_PRODUCTION',15),
('PLAYER_EVENT_WINDMILLS_MODERNIZE_CHOICE_3','FLAVOR_GOLD',10),
('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_1','FLAVOR_CULTURE',20),
('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_2','FLAVOR_SCIENCE',20),
('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_3','FLAVOR_GOLD',20),
('PLAYER_EVENT_ADVISOR_DEBATE_CHOICE_4','FLAVOR_MILITARY_TRAINING',20);

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_PLANTATION_RARE_CROP','EVENT_CLASS_GOOD',NULL,NULL,NULL,'AS2D_INTERFACE_CITY_TILE',10,0,'true','true','false',40,1,5,0,NULL,'ERA_INDUSTRIAL',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_PLANTATION','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_HOSPITAL_OVERCROWDING','EVENT_CLASS_BAD','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',30,1,'true','false','false',30,3,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'true','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_HOSPITAL',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_HOTEL_ESTABLISHED','EVENT_CLASS_GOOD',NULL,NULL,NULL,'AS2D_INTERFACE_BORDERS_EXPAND',10,0,'true','false','false',30,1,0,0,NULL,'ERA_INDUSTRIAL',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,'BUILDINGCLASS_HOTEL','false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','true','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FIRST_SUMMIT','EVENT_CLASS_GOOD',NULL,NULL,NULL,'AS2D_INTERFACE_BORDERS_EXPAND',10,2,'true','false','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false','TECH_FLIGHT',NULL,'false',NULL,NULL,'false','BUILDINGCLASS_HOTEL',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','true','true',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_PLANTATION_RARE_CROP_CHOICE_1','CITY_EVENT_PLANTATION_RARE_CROP'),
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_1','CITY_EVENT_HOSPITAL_OVERCROWDING'),
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_2','CITY_EVENT_HOSPITAL_OVERCROWDING'),
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_3','CITY_EVENT_HOSPITAL_OVERCROWDING'),
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_4','CITY_EVENT_HOSPITAL_OVERCROWDING'),
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_5','CITY_EVENT_HOSPITAL_OVERCROWDING'),
('CITY_EVENT_HOTEL_ESTABLISHED_CHOICE_1','CITY_EVENT_HOTEL_ESTABLISHED'),
('CITY_EVENT_FIRST_SUMMIT_CHOICE_1','CITY_EVENT_FIRST_SUMMIT');

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_PLANTATION_RARE_CROP_CHOICE_1','TXT_KEY_CITY_EVENT_PLANTATION_RARE_CROP_CHOICE_1','TXT_KEY_CITY_EVENT_PLANTATION_RARE_CROP_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',50,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_1','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_1','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_2','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_2','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',5,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_3','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_3','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,-1,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_4','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_4','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,1,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_5','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_5','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_5_HELP',NULL,'AS2D_EVENT_CHOICE',50,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_LABORATORY',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,3,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_HOTEL_ESTABLISHED_CHOICE_1','TXT_KEY_CITY_EVENT_HOTEL_ESTABLISHED_CHOICE_1','TXT_KEY_CITY_EVENT_HOTEL_ESTABLISHED_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_HOTEL',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FIRST_SUMMIT_CHOICE_1','TXT_KEY_CITY_EVENT_FIRST_SUMMIT_CHOICE_1','TXT_KEY_CITY_EVENT_FIRST_SUMMIT_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',15,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_HOSPITAL_OVERCROWDING',NULL,NULL,'CITY_EVENT_HOSPITAL_OVERCROWDING',NULL,'false','false','false');

INSERT INTO CityEventChoice_Notification(CityEventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedCityCoordinates,NeedPlayerID,ExtraVariable) VALUES
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_5','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_5_SUCCESSFUL','TXT_KEY_CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_5_SUCCESSFUL_S','false','true','false',-1);

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_PLANTATION_RARE_CROP_CHOICE_1','YIELD_SCIENCE',50),
('CITY_EVENT_FIRST_SUMMIT_CHOICE_1','YIELD_GOLDEN_AGE_POINTS',250);

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_2','YIELD_POPULATION',1);

INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_1','YIELD_GOLD',-5),
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_4','YIELD_GOLD',-10),
('CITY_EVENT_FIRST_SUMMIT_CHOICE_1','YIELD_TOURISM',2);

INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_5','BUILDINGCLASS_HOSPITAL','YIELD_SCIENCE',4);
 
INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_1','FLAVOR_GOLD',20),
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_2','FLAVOR_GROWTH',20),
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_3','FLAVOR_HAPPINESS',15),
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_4','FLAVOR_GOLD',15),
('CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_5','FLAVOR_SCIENCE',20);

