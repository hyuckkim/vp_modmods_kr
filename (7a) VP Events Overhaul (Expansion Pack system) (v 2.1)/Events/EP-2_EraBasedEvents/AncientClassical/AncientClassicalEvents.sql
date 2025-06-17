INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_DEATH_MERCHANT','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_DEATH_MERCHANT','TXT_KEY_PLAYER_EVENT_DEATH_MERCHANT_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',10,1,'true','false','false','true',100,3,0,0,NULL,NULL,'ERA_INDUSTRIAL','false','false','IMPROVEMENT_ACADEMY',0,'true',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false'),
 
('PLAYER_EVENT_MARKET_DEVELOPMENT','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_MARKET_DEVELOPMENT','TXT_KEY_PLAYER_EVENT_MARKET_DEVELOPMENT_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',15,1,'true','false','false','false',100,4,15,3,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'true',NULL,NULL,'false','BUILDINGCLASS_MARKET',NULL,'false','false','true','false','false','false','false'),
 
('PLAYER_EVENT_MONUMENT_DEVELOPMENT','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_MONUMENT_DEVELOPMENT','TXT_KEY_PLAYER_EVENT_MONUMENT_DEVELOPMENT_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',15,1,'true','false','false','false',100,4,10,2,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_MONUMENT',NULL,'false','false','false','false','false','false','false'),
 
('PLAYER_EVENT_LOSTLUXURIES','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_LOSTLUXURIES','TXT_KEY_PLAYER_EVENT_LOSTLUXURIES_HELP','ExoticLuxury.dds','AS2D_INTERFACE_BORDERS_EXPAND',15,1,'false','true','false','true',30,3,0,0,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,0,'false',NULL,NULL,'false','false','UNITCLASS_SCOUT',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES 
('PLAYER_EVENT_DEATH_MERCHANT_CHOICE_1','PLAYER_EVENT_DEATH_MERCHANT'),
('PLAYER_EVENT_DEATH_MERCHANT_CHOICE_2','PLAYER_EVENT_DEATH_MERCHANT'),
('PLAYER_EVENT_DEATH_MERCHANT_CHOICE_3','PLAYER_EVENT_DEATH_MERCHANT'),
('PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_1','PLAYER_EVENT_MARKET_DEVELOPMENT'),
('PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_2','PLAYER_EVENT_MARKET_DEVELOPMENT'),
('PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_1','PLAYER_EVENT_MONUMENT_DEVELOPMENT'),
('PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_2','PLAYER_EVENT_MONUMENT_DEVELOPMENT'),
('PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_3','PLAYER_EVENT_MONUMENT_DEVELOPMENT'),
('PLAYER_EVENT_LOSTLUXURIES_CHOICE_1','PLAYER_EVENT_LOSTLUXURIES'),
('PLAYER_EVENT_LOSTLUXURIES_CHOICE_2','PLAYER_EVENT_LOSTLUXURIES'),
('PLAYER_EVENT_LOSTLUXURIES_CHOICE_3','PLAYER_EVENT_LOSTLUXURIES');

INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_DEATH_MERCHANT_CHOICE_1','TXT_KEY_PLAYER_EVENT_DEATH_MERCHANT_CHOICE_1','TXT_KEY_PLAYER_EVENT_DEATH_MERCHANT_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_DEATH_MERCHANT_CHOICE_2','TXT_KEY_PLAYER_EVENT_DEATH_MERCHANT_CHOICE_2','TXT_KEY_PLAYER_EVENT_DEATH_MERCHANT_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',0,'false',0,0,0,'false','true',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','true','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_DEATH_MERCHANT_CHOICE_3','TXT_KEY_PLAYER_EVENT_DEATH_MERCHANT_CHOICE_3','TXT_KEY_PLAYER_EVENT_DEATH_MERCHANT_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','false',30,'false',0,'false',0,0,1,'true','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_1','TXT_KEY_PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_1','TXT_KEY_PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_2','TXT_KEY_PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_2','TXT_KEY_PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_1','TXT_KEY_PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_1','TXT_KEY_PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_2','TXT_KEY_PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_2','TXT_KEY_PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_3','TXT_KEY_PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_3','TXT_KEY_PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_LOSTLUXURIES_CHOICE_1','TXT_KEY_PLAYER_EVENT_LOSTLUXURIES_CHOICE_1','TXT_KEY_PLAYER_EVENT_LOSTLUXURIES_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_LOSTLUXURIES_CHOICE_2','TXT_KEY_PLAYER_EVENT_LOSTLUXURIES_CHOICE_2','TXT_KEY_PLAYER_EVENT_LOSTLUXURIES_CHOICE_2_HELP','TXT_KEY_PLAYER_EVENT_LOSTLUXURIES_CHOICE_2_DISABLED','AS2D_EVENT_CHOICE','true',30,'false',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,3,0,0,0,'false','false','false','false','false',0,0,0,0,0),
 
('PLAYER_EVENT_LOSTLUXURIES_CHOICE_3','TXT_KEY_PLAYER_EVENT_LOSTLUXURIES_CHOICE_3','TXT_KEY_PLAYER_EVENT_LOSTLUXURIES_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'true',0,'true',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'true','false','false','false','false',0,0,0,0,0);
 
INSERT INTO EventChoice_InstantYield(EventChoiceType,YieldType,Yield) VALUES
('PLAYER_EVENT_DEATH_MERCHANT_CHOICE_1','YIELD_GOLD',250),
('PLAYER_EVENT_LOSTLUXURIES_CHOICE_2','YIELD_GOLD',-150),
('PLAYER_EVENT_LOSTLUXURIES_CHOICE_3','YIELD_GOLD',125);

INSERT INTO EventChoice_FreeUnitClasses(EventChoiceType,UnitClassType,Quantity) VALUES('PLAYER_EVENT_DEATH_MERCHANT_CHOICE_2','UNITCLASS_CARAVAN',1);

INSERT INTO EventChoice_CityYield(EventChoiceType,YieldType,Yield) VALUES
('PLAYER_EVENT_DEATH_MERCHANT_CHOICE_3','YIELD_GOLD',1);

INSERT INTO EventChoice_BuildingClassYieldChange(EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_1','BUILDINGCLASS_MARKET','YIELD_GOLD',-1),
('PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_1','BUILDINGCLASS_MARKET','YIELD_CULTURE',1),
('PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_2','BUILDINGCLASS_MARKET','YIELD_GOLD',1),
('PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_1','BUILDINGCLASS_MONUMENT','YIELD_FOOD',1),
('PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_2','BUILDINGCLASS_MONUMENT','YIELD_FAITH',1),
('PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_3','BUILDINGCLASS_MONUMENT','YIELD_GOLD',2);

INSERT INTO EventChoiceFlavors(EventChoiceType,FlavorType,Flavor) VALUES
('PLAYER_EVENT_DEATH_MERCHANT_CHOICE_1','FLAVOR_GOLD',20),
('PLAYER_EVENT_DEATH_MERCHANT_CHOICE_2','FLAVOR_I_LAND_TRADE_ROUTE',20),
('PLAYER_EVENT_DEATH_MERCHANT_CHOICE_3','FLAVOR_GOLD',20),
('PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_1','FLAVOR_CULTURE',20),
('PLAYER_EVENT_MARKET_DEVELOPMENT_CHOICE_2','FLAVOR_GOLD',20),
('PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_1','FLAVOR_GROWTH',20),
('PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_2','FLAVOR_RELIGION',20),
('PLAYER_EVENT_MONUMENT_DEVELOPMENT_CHOICE_3','FLAVOR_GOLD',20),
('PLAYER_EVENT_LOSTLUXURIES_CHOICE_1','FLAVOR_HAPPINESS',5),
('PLAYER_EVENT_LOSTLUXURIES_CHOICE_2','FLAVOR_RECON',5),
('PLAYER_EVENT_LOSTLUXURIES_CHOICE_3','FLAVOR_GOLD',5);

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_STONE_WORKS_DISCOVERY','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_STONE_WORKS_DISCOVERY','TXT_KEY_CITY_EVENT_STONE_WORKS_DISCOVERY_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',60,1,'true','false','false',100,3,5,0,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_STONE_WORKS',NULL,'false','false',NULL,NULL,'RESOURCE_MARBLE','false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_QUARRY','true','false','false','false','false','false','false','false','false'),

('CITY_EVENT_MINE_COLLAPSE','EVENT_CLASS_BAD','TXT_KEY_CITY_EVENT_MINE_COLLAPSE','TXT_KEY_CITY_EVENT_MINE_COLLAPSE_HELP','badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',20,0,'false','false','false',100,3,8,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,'TECH_METALLURGY','false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_MINE','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_MARKET_DAY','EVENT_CLASS_GOOD',NULL,NULL,NULL,'AS2D_INTERFACE_BORDERS_EXPAND',20,1,'false','true','false',75,1,6,0,NULL,NULL,'ERA_INDUSTRIAL','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_MARKET',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NOMADS_v1','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NOMADS','TXT_KEY_CITY_EVENT_NOMADS_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',25,0,'true','false','false',30,4,3,10,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NOMADS_v2','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NOMADS','TXT_KEY_CITY_EVENT_NOMADS_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',25,0,'true','false','false',30,4,3,10,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NOMADS_v3','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NOMADS','TXT_KEY_CITY_EVENT_NOMADS_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',25,0,'true','false','false',30,4,3,10,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_AA_MINEGLINT','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_AA_MINEGLINT','TXT_KEY_CITY_EVENT_AA_MINEGLINT_HELP','GlintMine.dds','AS2D_INTERFACE_BORDERS_EXPAND',30,0,'true','false','false',30,4,0,0,NULL,NULL,'ERA_MEDIEVAL','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','IMPROVEMENT_MINE','false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_AA_OLYMPICGAMES','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_AA_OLYMPICGAMES','TXT_KEY_CITY_EVENT_AA_OLYMPICGAMES_HELP','Gladiator.dds','AS2D_EVENT_ECROWDCHEER',30,0,'true','false','false',30,5,0,0,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_COLOSSEUM',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_EYEFOREYE','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_EYEFOREYE','TXT_KEY_CITY_EVENT_EYEFOREYE_HELP','EyeForEye.dds','AS2D_EVENT_ECROWDCHEER',5,1,'true','true','false',30,4,0,0,NULL,NULL,'ERA_RENAISSANCE','false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_COLOSSEUM',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_1','CITY_EVENT_STONE_WORKS_DISCOVERY'),
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_2','CITY_EVENT_STONE_WORKS_DISCOVERY'),
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_3','CITY_EVENT_STONE_WORKS_DISCOVERY'),
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_4','CITY_EVENT_STONE_WORKS_DISCOVERY'),
('CITY_EVENT_MINE_COLLAPSE_CHOICE_1','CITY_EVENT_MINE_COLLAPSE'),
('CITY_EVENT_MINE_COLLAPSE_CHOICE_2','CITY_EVENT_MINE_COLLAPSE'),
('CITY_EVENT_MINE_COLLAPSE_CHOICE_3','CITY_EVENT_MINE_COLLAPSE'),
('CITY_EVENT_MARKET_DAY_CHOICE_1','CITY_EVENT_MARKET_DAY'),
('CITY_EVENT_NOMADS_CHOICE_1','CITY_EVENT_NOMADS_v1'),
('CITY_EVENT_NOMADS_CHOICE_5','CITY_EVENT_NOMADS_v1'),
('CITY_EVENT_NOMADS_CHOICE_3','CITY_EVENT_NOMADS_v1'),
('CITY_EVENT_NOMADS_CHOICE_2','CITY_EVENT_NOMADS_v2'),
('CITY_EVENT_NOMADS_CHOICE_3','CITY_EVENT_NOMADS_v2'),
('CITY_EVENT_NOMADS_CHOICE_4','CITY_EVENT_NOMADS_v2'),
('CITY_EVENT_NOMADS_CHOICE_5','CITY_EVENT_NOMADS_v3'),
('CITY_EVENT_NOMADS_CHOICE_6','CITY_EVENT_NOMADS_v3'),
('CITY_EVENT_NOMADS_CHOICE_2','CITY_EVENT_NOMADS_v3'),
('CITY_EVENT_AA_MINEGLINT_CHOICE_1','CITY_EVENT_AA_MINEGLINT'),
('CITY_EVENT_AA_MINEGLINT_CHOICE_2','CITY_EVENT_AA_MINEGLINT'),
('CITY_EVENT_AA_MINEGLINT_CHOICE_3','CITY_EVENT_AA_MINEGLINT'),
('CITY_EVENT_AA_MINEGLINT_CHOICE_4','CITY_EVENT_AA_MINEGLINT'),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_1','CITY_EVENT_AA_OLYMPICGAMES'),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_2','CITY_EVENT_AA_OLYMPICGAMES'),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_3','CITY_EVENT_AA_OLYMPICGAMES'),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_4','CITY_EVENT_AA_OLYMPICGAMES'),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_5','CITY_EVENT_AA_OLYMPICGAMES'),
('CITY_EVENT_EYEFOREYE_CHOICE_1','CITY_EVENT_EYEFOREYE'),
('CITY_EVENT_EYEFOREYE_CHOICE_2','CITY_EVENT_EYEFOREYE'),
('CITY_EVENT_EYEFOREYE_CHOICE_3','CITY_EVENT_EYEFOREYE'),
('CITY_EVENT_EYEFOREYE_CHOICE_4','CITY_EVENT_EYEFOREYE');

--------------------------------------------------------------------------------------------------
-- Dummy Building for AA Olympic Games event
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding,NoLimit) VALUES 
('BUILDINGCLASS_AA_OLYMPICGAMES_DUMMY','BUILDING_AA_OLYMPICGAMES_DUMMY',0);

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune, IconAtlas) VALUES
('BUILDING_AA_OLYMPICGAMES_DUMMY','BUILDINGCLASS_AA_OLYMPICGAMES_DUMMY','TXT_KEY_BUILDING_AA_OLYMPICGAMES_DUMMY','TXT_KEY_BUILDING_AA_OLYMPICGAMES_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS');

INSERT INTO Building_YieldChangesPerPop (BuildingType,YieldType,Yield) VALUES
('BUILDING_AA_OLYMPICGAMES_DUMMY','YIELD_FAITH',50);	
--------------------------------------------------------------------------------------------------
-- End Dummy Building
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_1','TXT_KEY_CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_1','TXT_KEY_CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,10,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_2','TXT_KEY_CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_2','TXT_KEY_CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_TEMPLE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_3','TXT_KEY_CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_3','TXT_KEY_CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'true',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_4','TXT_KEY_CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_4','TXT_KEY_CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',25,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_MINE_COLLAPSE_CHOICE_1','TXT_KEY_CITY_EVENT_MINE_COLLAPSE_CHOICE_1','TXT_KEY_CITY_EVENT_MINE_COLLAPSE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_MINE_COLLAPSE_CHOICE_2','TXT_KEY_CITY_EVENT_MINE_COLLAPSE_CHOICE_2','TXT_KEY_CITY_EVENT_MINE_COLLAPSE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_MINE_COLLAPSE_CHOICE_3','TXT_KEY_CITY_EVENT_MINE_COLLAPSE_CHOICE_3','TXT_KEY_CITY_EVENT_MINE_COLLAPSE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',20,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_MARKET_DAY_CHOICE_1','TXT_KEY_CITY_EVENT_MARKET_DAY_CHOICE_1','TXT_KEY_CITY_EVENT_MARKET_DAY_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NOMADS_CHOICE_1','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_1','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NOMADS_CHOICE_2','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_2','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',50,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,2,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NOMADS_CHOICE_3','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_3','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,1,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NOMADS_CHOICE_4','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_4','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',75,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NOMADS_CHOICE_5','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_5','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_5_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NOMADS_CHOICE_6','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_6','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_6_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_MINEGLINT_CHOICE_1','TXT_KEY_CITY_EVENT_AA_MINEGLINT_CHOICE_1','TXT_KEY_CITY_EVENT_AA_MINEGLINT_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'true',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_MINEGLINT_CHOICE_2','TXT_KEY_CITY_EVENT_AA_MINEGLINT_CHOICE_2','TXT_KEY_CITY_EVENT_AA_MINEGLINT_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_SHRINE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_MINEGLINT_CHOICE_3','TXT_KEY_CITY_EVENT_AA_MINEGLINT_CHOICE_3','TXT_KEY_CITY_EVENT_AA_MINEGLINT_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_GROVE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_MINEGLINT_CHOICE_4','TXT_KEY_CITY_EVENT_AA_MINEGLINT_CHOICE_4','TXT_KEY_CITY_EVENT_AA_MINEGLINT_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_MARKET',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_1','TXT_KEY_CITY_EVENT_AA_OLYMPICGAMES_CHOICE_1','TXT_KEY_CITY_EVENT_AA_OLYMPICGAMES_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,1,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_2','TXT_KEY_CITY_EVENT_AA_OLYMPICGAMES_CHOICE_2','TXT_KEY_CITY_EVENT_AA_OLYMPICGAMES_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','true','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_3','TXT_KEY_CITY_EVENT_AA_OLYMPICGAMES_CHOICE_3','TXT_KEY_CITY_EVENT_AA_OLYMPICGAMES_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_CHANCERY',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_4','TXT_KEY_CITY_EVENT_AA_OLYMPICGAMES_CHOICE_4','TXT_KEY_CITY_EVENT_AA_OLYMPICGAMES_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_MARKET',NULL,'false','false',NULL,NULL,NULL,'true','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_5','TXT_KEY_CITY_EVENT_AA_OLYMPICGAMES_CHOICE_5','TXT_KEY_CITY_EVENT_AA_OLYMPICGAMES_CHOICE_5_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'true',NULL,NULL,'false','BUILDINGCLASS_MARKET',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','BUILDINGCLASS_AA_OLYMPICGAMES_DUMMY',NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_EYEFOREYE_CHOICE_1','TXT_KEY_CITY_EVENT_EYEFOREYE_CHOICE_1','TXT_KEY_CITY_EVENT_EYEFOREYE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',25,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,5,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_EYEFOREYE_CHOICE_2','TXT_KEY_CITY_EVENT_EYEFOREYE_CHOICE_2','TXT_KEY_CITY_EVENT_EYEFOREYE_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_EYEFOREYE_CHOICE_3','TXT_KEY_CITY_EVENT_EYEFOREYE_CHOICE_3','TXT_KEY_CITY_EVENT_EYEFOREYE_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_EYEFOREYE_CHOICE_4','TXT_KEY_CITY_EVENT_EYEFOREYE_CHOICE_4','TXT_KEY_CITY_EVENT_EYEFOREYE_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE',50,'false','false',10,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,2,2,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_STONE_WORKS_DISCOVERY',NULL,NULL,'CITY_EVENT_STONE_WORKS_DISCOVERY',NULL,'false','false','false'),
('CITY_EVENT_MINE_COLLAPSE',NULL,NULL,'CITY_EVENT_AVALANCHE',NULL,'false','true','false'),
('CITY_EVENT_AA_MINEGLINT',NULL,NULL,'CITY_EVENT_AA_MINEGLINT',NULL,'false','false','false'),
('CITY_EVENT_NOMADS_v1',NULL,NULL,'CITY_EVENT_NOMADS_v2',NULL,'false','true','false'),
('CITY_EVENT_NOMADS_v1',NULL,NULL,'CITY_EVENT_NOMADS_v3',NULL,'false','true','false'),
('CITY_EVENT_NOMADS_v2',NULL,NULL,'CITY_EVENT_NOMADS_v1',NULL,'false','true','false'),
('CITY_EVENT_NOMADS_v2',NULL,NULL,'CITY_EVENT_NOMADS_v3',NULL,'false','true','false'),
('CITY_EVENT_NOMADS_v3',NULL,NULL,'CITY_EVENT_NOMADS_v1',NULL,'false','true','false'),
('CITY_EVENT_NOMADS_v3',NULL,NULL,'CITY_EVENT_NOMADS_v2',NULL,'false','true','false');

INSERT INTO CityEventChoice_Notification(CityEventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedCityCoordinates,NeedPlayerID,ExtraVariable) VALUES
('CITY_EVENT_MINE_COLLAPSE_CHOICE_3','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_MINE_COLLAPSE_CHOICE_3_SUCCESSFUL','TXT_KEY_CITY_EVENT_MINE_COLLAPSE_CHOICE_3_SUCCESSFUL_S','false','true','false',-1),
('CITY_EVENT_NOMADS_CHOICE_2','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_2_SUCCESSFUL','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_2_SUCCESSFUL_S','false','true','false',-1),
('CITY_EVENT_NOMADS_CHOICE_4','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_4_SUCCESSFUL','TXT_KEY_CITY_EVENT_NOMADS_CHOICE_4_SUCCESSFUL_S','false','true','false',-1),
('CITY_EVENT_EYEFOREYE_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_EYEFOREYE_CHOICE_1_SUCCESSFUL','TXT_KEY_CITY_EVENT_EYEFOREYE_CHOICE_1_SUCCESSFUL_S','false','true','false',-1),
('CITY_EVENT_EYEFOREYE_CHOICE_4','NOTIFICATION_GENERIC','TXT_KEY_CITY_EVENT_EYEFOREYE_CHOICE_4_SUCCESSFUL','TXT_KEY_CITY_EVENT_EYEFOREYE_CHOICE_4_SUCCESSFUL_S','false','true','false',-1);

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_1','YIELD_GOLD',50),
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_2','YIELD_FAITH',50),
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_3','YIELD_FAITH',35),
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_3','YIELD_CULTURE',30),
('CITY_EVENT_MINE_COLLAPSE_CHOICE_3','YIELD_POPULATION',-1),
('CITY_EVENT_NOMADS_CHOICE_1','YIELD_CULTURE_LOCAL',125),
('CITY_EVENT_NOMADS_CHOICE_4','YIELD_POPULATION',1),
('CITY_EVENT_NOMADS_CHOICE_5','YIELD_CULTURE',50),
('CITY_EVENT_AA_MINEGLINT_CHOICE_1','YIELD_FAITH',20),
('CITY_EVENT_EYEFOREYE_CHOICE_2','YIELD_FAITH',30),
('CITY_EVENT_EYEFOREYE_CHOICE_3','YIELD_GOLD',45);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_AA_MINEGLINT_CHOICE_3','IMPROVEMENT_MINE','YIELD_PRODUCTION',1);

INSERT INTO CityEventChoice_ImprovementDestructionRandom(CityEventChoiceType,ImprovementType,Number) VALUES
('CITY_EVENT_MINE_COLLAPSE_CHOICE_1','IMPROVEMENT_MINE',3);

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_MINE_COLLAPSE_CHOICE_2','YIELD_PRODUCTION',50),
('CITY_EVENT_NOMADS_CHOICE_2','YIELD_GOLD',-175);

INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_4','YIELD_CULTURE',2),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_4','YIELD_GOLD',2),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_4','YIELD_SCIENCE',1);

INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('CITY_EVENT_MARKET_DAY_CHOICE_1','BUILDINGCLASS_MARKET','YIELD_GOLD',2),
('CITY_EVENT_AA_MINEGLINT_CHOICE_2','BUILDINGCLASS_SHRINE','YIELD_FAITH',1),
('CITY_EVENT_AA_MINEGLINT_CHOICE_4','BUILDINGCLASS_MARKET','YIELD_GOLD',2),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_2','BUILDINGCLASS_COLOSSEUM','YIELD_CULTURE',1),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_2','BUILDINGCLASS_COLOSSEUM','YIELD_TOURISM',1);

INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES
('CITY_EVENT_NOMADS_CHOICE_6','UNIT_WORKER',1),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_3','UNIT_EMISSARY',1);

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_DO_NOTHING_CHOICE','FLAVOR_GOLD',15),
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_1','FLAVOR_GOLD',20),
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_2','FLAVOR_RELIGION',20),
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_3','FLAVOR_RELIGION',10),
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_3','FLAVOR_CULTURE',10),
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_4','FLAVOR_GROWTH',10),
('CITY_EVENT_STONE_WORKS_DISCOVERY_CHOICE_4','FLAVOR_CULTURE',10),
('CITY_EVENT_MINE_COLLAPSE_CHOICE_2','FLAVOR_PRODUCTION',5),
('CITY_EVENT_MINE_COLLAPSE_CHOICE_3','FLAVOR_PRODUCTION',-5),
('CITY_EVENT_MINE_COLLAPSE_CHOICE_3','FLAVOR_GROWTH',-3),
('CITY_EVENT_NOMADS_CHOICE_1','FLAVOR_EXPANSION',20),
('CITY_EVENT_NOMADS_CHOICE_2','FLAVOR_GOLD',20),
('CITY_EVENT_NOMADS_CHOICE_3','FLAVOR_OFFENSE',20),
('CITY_EVENT_NOMADS_CHOICE_4','FLAVOR_GROWTH',20),
('CITY_EVENT_NOMADS_CHOICE_5','FLAVOR_CULTURE',20),
('CITY_EVENT_NOMADS_CHOICE_6','FLAVOR_TILE_IMPROVEMENT',20),
('CITY_EVENT_AA_MINEGLINT_CHOICE_1','FLAVOR_RELIGION',5),
('CITY_EVENT_AA_MINEGLINT_CHOICE_2','FLAVOR_RELIGION',5),
('CITY_EVENT_AA_MINEGLINT_CHOICE_3','FLAVOR_PRODUCTION',5),
('CITY_EVENT_AA_MINEGLINT_CHOICE_4','FLAVOR_GOLD',5),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_1','FLAVOR_OFFENSE',5),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_2','FLAVOR_CULTURE',5),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_3','FLAVOR_DIPLOMACY',5),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_4','FLAVOR_SCIENCE',5),
('CITY_EVENT_AA_OLYMPICGAMES_CHOICE_5','FLAVOR_RELIGION',5),
('CITY_EVENT_EYEFOREYE_CHOICE_1','FLAVOR_GROWTH',2),
('CITY_EVENT_EYEFOREYE_CHOICE_2','FLAVOR_RELIGION',5),
('CITY_EVENT_EYEFOREYE_CHOICE_3','FLAVOR_GOLD',5),
('CITY_EVENT_EYEFOREYE_CHOICE_4','FLAVOR_HAPPINESS',2);