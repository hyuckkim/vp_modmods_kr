-- CORPORATION NAME --

--------------------------------------------------------------------------------------------------
--
-- Corporate events are designed two give players two ways to experience these events: one choice where that choice
-- has the same effect on every City or another choice that creates City-level events so each City can be unique.
-- These two ways of experiencing corporate events are mutually exclusive. Players also have the option of delaying
-- this event selection one time after which they must select an option or do nothing.
--
-- By choosing the second option, players can create more powerful Cities, but they are have increased risks.
--------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------
--
-- Player Level Events ---------------------------------------------------------------------------
--
--------------------------------------------------------------------------------------------------
INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_CORPORATION_INITIAL','EVENT_CLASS_NEUTRAL','TXT_KEY_PLAYER_EVENT_CORP1_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CORPORATION_INITIAL_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',20,10,'true','false','false','false',30,3,0,0,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','HEADQUARTERS',NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_CORPORATION_FINAL','EVENT_CLASS_NEUTRAL','TXT_KEY_PLAYER_EVENT_CORP2_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CORPORATION_FINAL_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',20,10,'true','false','false','false',30,3,0,0,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','HEADQUARTERS',NULL,'false','false','false','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_CORPORATION_CHOICE_1','PLAYER_EVENT_CORPORATION_INITIAL'),
('PLAYER_EVENT_CORPORATION_CHOICE_2','PLAYER_EVENT_CORPORATION_INITIAL'),
('PLAYER_EVENT_CORPORATION_CHOICE_3','PLAYER_EVENT_CORPORATION_INITIAL'),
('PLAYER_EVENT_CORPORATION_CHOICE_1','PLAYER_EVENT_CORPORATION_FINAL'),
('PLAYER_EVENT_CORPORATION_CHOICE_2','PLAYER_EVENT_CORPORATION_FINAL'),
('PLAYER_EVENT_CORPORATION_CHOICE_4','PLAYER_EVENT_CORPORATION_FINAL');

-- INSERT INTO Event_MinimumStartYield(EventType,YieldType,Yield) VALUES ;

-- INSERT INTO Event_MinimumResourceRequired(EventType,ResourceType,Quantity) VALUES ;

-- INSERT INTO Event_MinimumFeatureRequired(EventType,FeatureType,Quantity) VALUES ;

INSERT INTO Event_EventLinks(EventType,EventLinker,EventChoice,CityEvent,CityEventChoice,CheckKnownPlayers,CheckForActive) VALUES
('PLAYER_EVENT_CORPORATION_FINAL',NULL,'PLAYER_EVENT_CORPORATION_CHOICE_3',NULL,NULL,'false','true');

INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES

('PLAYER_EVENT_CORPORATION_CHOICE_1','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_1_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CORPORATION_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_CORPORATION_CHOICE_2','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_2_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_CORPORATION_CHOICE_3','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_3_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_CORPORATION_CHOICE_4','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_4_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);

-- INSERT INTO EventChoice_MinimumStartYield(EventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO EventChoice_MinimumResourceRequired(EventChoiceType,ResourceType,Quantity) VALUES ;

-- INSERT INTO EventChoice_MinimumFeatureRequired(EventChoiceType,FeatureType,Quantity) VALUES ;

-- INSERT INTO EventChoice_EventCostYield(EventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO EventChoice_InstantYield(EventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO EventChoice_CityYield(EventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO EventChoice_BuildingClassYieldChange(EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES 
('PLAYER_EVENT_CORPORATION_CHOICE_1','OFFICE','YIELD_SCIENCE',-1);

-- INSERT INTO EventChoice_BuildingClassYieldModifier (EventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

-- INSERT INTO EventChoice_ResourceQuantity (EventChoiceType,ResourceType,Quantity) VALUES ;

-- INSERT INTO EventChoice_FeatureYieldChange (EventChoiceType,FeatureType,YieldType,YieldChange) VALUES ;

-- INSERT INTO EventChoice_ImprovementYieldChange(EventChoiceType,ImprovementType,YieldType,YieldChange) VALUES ;

INSERT INTO EventChoice_ResourceYieldChange(EventChoiceType,ResourceType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_CORPORATION_CHOICE_1','RESOURCE_CORAL','YIELD_GOLD',6),
('PLAYER_EVENT_CORPORATION_CHOICE_1','RESOURCE_CRAB','YIELD_GOLD',6),
('PLAYER_EVENT_CORPORATION_CHOICE_1','RESOURCE_HORSE','YIELD_GOLD',6),
('PLAYER_EVENT_CORPORATION_CHOICE_1','RESOURCE_IVORY','YIELD_GOLD',6),
('PLAYER_EVENT_CORPORATION_CHOICE_1','RESOURCE_WHALE','YIELD_GOLD',6);

-- INSERT INTO EventChoice_TerrainYieldChange (EventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO EventChoice_SpecialistYieldChange (EventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO EventChoice_FreeUnitClasses (EventChoiceType,UnitClassType,Quantity) VALUES ;

-- INSERT INTO EventChoice_FreeUnits(EventChoiceType,UnitType,Quantity) VALUES ;

-- INSERT INTO EventChoice_ConvertNumPopToReligion(EventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO EventChoice_ConvertPercentPopToReligion(EventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO EventChoiceFlavors(EventChoiceType,FlavorType,Flavor) VALUES
('PLAYER_EVENT_CORPORATION_CHOICE_1','FLAVOR_GOLD',10),
('PLAYER_EVENT_CORPORATION_CHOICE_2','FLAVOR_PRODUCTION',20);

--------------------------------------------------------------------------------------------------
-- Text for Player Level Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_CORPORATION_INITIAL_HELP', 'A large group of investors has reached out and asked for an opportunity to invest some of their resources into CORPORATION. They are suggesting that their experience and business acumen will lead to a more efficient use of company resources and, ultimately, greater profits. Are you willing to let these investors assume control of CORPORATION, under your watchful eye, of course?');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_CORPORATION_FINAL_HELP', 'Those investors are back and still would like to invest some of their resources into CORPORATION. They strongly believe that their experience and business acumen will lead to a more efficient use of company resources and, ultimately, greater profits. Are you willing to let these investors assume control of CORPORATION, under your watchful eye, of course?');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_CORPORATION_CHOICE_1_HELP', 'As a result of private investment, all resources associated with the Corporation gain +6 [ICON_GOLD] Gold; however, local corporate offices have 1 [ICON_RESEARCH] and 2 [ICON_PRODUCTION] Production siphoned off for use by the investment team.');


--------------------------------------------------------------------------------------------------
--
-- City Level Events -----------------------------------------------------------------------------
--
--------------------------------------------------------------------------------------------------
INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_CORPORATION_FIRST','EVENT_CLASS_GOOD',NULL,NULL,'naturalwonderpopup.dds','AS2D_EVENT_CHOICE',50,1,'true','false','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','OFFICE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_CORPORATION_SECOND','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_CORP_SECOND_DESCRIPTION','TXT_KEY_CITY_EVENT_CORPORATION_SECOND_HELP','naturalwonderpopup.dds','AS2D_EVENT_CHOICE',50,1,'true','false','false',30,4,0,0,NULL,'ERA_POSTMODERN',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','OFFICE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_CORPORATION_THIRD_v1','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_CORP_THIRD_DESCRIPTION','TXT_KEY_CITY_EVENT_CORPORATION_THIRD_HELP','naturalwonderpopup.dds','AS2D_EVENT_CHOICE',50,1,'true','false','false',30,2,0,0,NULL,'ERA_FUTURE',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','OFFICE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_CORPORATION_THIRD_v2','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_CORP_THIRD_DESCRIPTION','TXT_KEY_CITY_EVENT_CORPORATION_THIRD_HELP','naturalwonderpopup.dds','AS2D_EVENT_CHOICE',50,1,'true','false','false',30,2,0,0,NULL,'ERA_FUTURE',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','OFFICE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_CORPORATION_THIRD_v3','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_CORP_THIRD_DESCRIPTION','TXT_KEY_CITY_EVENT_CORPORATION_THIRD_HELP','naturalwonderpopup.dds','AS2D_EVENT_CHOICE',50,1,'true','false','false',30,2,0,0,NULL,'ERA_FUTURE',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','OFFICE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_CORPORATION_THISISBAD','EVENT_CLASS_BAD',NULL,NULL,'naturalwonderpopup.dds','AS2D_EVENT_CHOICE',15,0,'false','true','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','OFFICE',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_CORPORATION_FIRST_CHOICE_1','CITY_EVENT_CORPORATION_FIRST'),
('CITY_EVENT_CORP_SECOND_CHOICE_1','CITY_EVENT_CORPORATION_SECOND'),
('CITY_EVENT_CORP_SECOND_CHOICE_2','CITY_EVENT_CORPORATION_SECOND'),
('CITY_EVENT_CORP_SECOND_CHOICE_3','CITY_EVENT_CORPORATION_SECOND'),
('CITY_EVENT_CORP_SECOND_CHOICE_4','CITY_EVENT_CORPORATION_SECOND'),
('CITY_EVENT_CORP_THIRD_CHOICE_1','CITY_EVENT_CORPORATION_THIRD_v1'),
('CITY_EVENT_CORP_THIRD_CHOICE_4','CITY_EVENT_CORPORATION_THIRD_v1'),
('CITY_EVENT_CORP_THIRD_CHOICE_2','CITY_EVENT_CORPORATION_THIRD_v2'),
('CITY_EVENT_CORP_THIRD_CHOICE_4','CITY_EVENT_CORPORATION_THIRD_v2'),
('CITY_EVENT_CORP_THIRD_CHOICE_3','CITY_EVENT_CORPORATION_THIRD_v3'),
('CITY_EVENT_CORP_THIRD_CHOICE_4','CITY_EVENT_CORPORATION_THIRD_v3'),
('CITY_EVENT_CORPORATION_THISISBAD_CHOICE_1','CITY_EVENT_CORPORATION_THISISBAD');

INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES 
('CITY_EVENT_CORPORATION_SECOND','YIELD_GOLD',1000),
('CITY_EVENT_CORPORATION_THIRD_v1','YIELD_GOLD',2500),
('CITY_EVENT_CORPORATION_THIRD_v2','YIELD_GOLD',2500),
('CITY_EVENT_CORPORATION_THIRD_v3','YIELD_GOLD',2500);

--------------------------------------------------------------------------------------------------
-- Dummy Building for Corporate City Event 2 
--------------------------------------------------------------------------------------------------
/*-- 
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_CORPORATEBONUS_DUMMY','BUILDING_CORPORATEBONUS_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas) VALUES
('BUILDING_CORPORATEBONUS_DUMMY','BUILDINGCLASS_CORPORATEBONUS_DUMMY','TXT_KEY_BUILDING_CORPORATEBONUS_DUMMY','TXT_KEY_BUILDING_CORPORATEBONUS_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS');

INSERT INTO Building_SpecificGreatPersonRateModifier(BuildingType,SpecialistType,Modifier) VALUES
('BUILDING_CORPORATEBONUS_DUMMY','SPECIALIST_MERCHANT',10);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_CORPORATEBONUS_DUMMY', 'City of Gold Merchant');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_CORPORATEBONUS_DUMMY_HELP', 'Provides a 10% bonus to local [ICON_GREAT_MERCHANT] Great Merchant growth.'); 
--*/
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings 
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_CORPORATION_FIRST_CHOICE_1','TXT_KEY_CITY_EVENT_CORP_FIRST_CHOICE_1','TXT_KEY_CITY_EVENT_CORPORATION_FIRST_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_CORPORATION_THISISBAD_CHOICE_1','TXT_KEY_CITY_EVENT_CORP_THISISBAD_DESCRIPTION','TXT_KEY_CITY_EVENT_CORPORATION_THISISBAD_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','OFFICE',NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_CORPORATION_SECOND',NULL,NULL,'CITY_EVENT_CORPORATION_FIRST',NULL,'false','true','true'),
('CITY_EVENT_CORPORATION_THIRD_v1',NULL,NULL,NULL,'CITY_EVENT_CORP_SECOND_CHOICE_1','false','true','true'),
('CITY_EVENT_CORPORATION_THIRD_v2',NULL,NULL,NULL,'CITY_EVENT_CORP_SECOND_CHOICE_2','false','true','true'),
('CITY_EVENT_CORPORATION_THIRD_v3',NULL,NULL,NULL,'CITY_EVENT_CORP_SECOND_CHOICE_3','false','true','true'),
('CITY_EVENT_CORPORATION_THISISBAD',NULL,NULL,'CITY_EVENT_CORPORATION_THISISBAD',NULL,'false','false','true');

-- INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_CORPORATION_THISISBAD_CHOICE_1','YIELD_GOLD', -500);

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

-- INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

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

-- INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES ;

--------------------------------------------------------------------------------------------------
-- Text for City Level Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORPORATION_FIRST_CHOICE_1_HELP','Allowing investment into Trader Sid''s has lead in a local increase in Company revenues. As a result, each local [ICON_VP_MERCHANT] Merchant now provides an additional 4 [ICON_GOLD] Gold into the City coffers.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORPORATION_SECOND_HELP','One of the investors in Trader Sid''s is a major pharmaceutical company, and they are telling us that they think some of our resources are strong candidates for a new class of drug they are developing. They are asking permission to divert some production in the City into research to see what they can discover.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORPORATION_THIRD_HELP','The management team at the local Trader Sid''s office has identified one of the assistants to the regional manager as having real potential. They are requesting permission create a new division in the Company and promote him into a leadership position.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORPORATION_THISISBAD_HELP','A scandal at the local Trader Sid''s branch has created a huge public backlash. Rioting has destroyed the local branch office, and the Company is being forced to pay major fines as restitution.');
