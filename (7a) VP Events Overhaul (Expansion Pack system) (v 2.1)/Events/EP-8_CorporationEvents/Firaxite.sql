-- FIRAXITE MATERIALS --

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

('PLAYER_EVENT_FIRAXITE_INITIAL','EVENT_CLASS_NEUTRAL','TXT_KEY_PLAYER_EVENT_CORP1_DESCRIPTION','TXT_KEY_PLAYER_EVENT_FIRAXITE_INITIAL_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',20,10,'true','false','false','false',30,3,0,0,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_FIRAXITE_MATERIALS_HQ',NULL,'false','false','false','false','false','false','false'),

('PLAYER_EVENT_FIRAXITE_FINAL','EVENT_CLASS_NEUTRAL','TXT_KEY_PLAYER_EVENT_CORP2_DESCRIPTION','TXT_KEY_PLAYER_EVENT_FIRAXITE_FINAL_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',20,10,'true','false','false','false',30,3,0,0,NULL,NULL,NULL,'false','false',NULL,0,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_FIRAXITE_MATERIALS_HQ',NULL,'false','false','false','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_FIRAXITE_CHOICE_1','PLAYER_EVENT_FIRAXITE_INITIAL'),
('PLAYER_EVENT_FIRAXITE_CHOICE_2','PLAYER_EVENT_FIRAXITE_INITIAL'),
('PLAYER_EVENT_FIRAXITE_CHOICE_3','PLAYER_EVENT_FIRAXITE_INITIAL'),
('PLAYER_EVENT_FIRAXITE_CHOICE_1','PLAYER_EVENT_FIRAXITE_FINAL'),
('PLAYER_EVENT_FIRAXITE_CHOICE_2','PLAYER_EVENT_FIRAXITE_FINAL'),
('PLAYER_EVENT_FIRAXITE_CHOICE_4','PLAYER_EVENT_FIRAXITE_FINAL');

-- INSERT INTO Event_MinimumStartYield(EventType,YieldType,Yield) VALUES ;

-- INSERT INTO Event_MinimumResourceRequired(EventType,ResourceType,Quantity) VALUES ;

-- INSERT INTO Event_MinimumFeatureRequired(EventType,FeatureType,Quantity) VALUES ;

INSERT INTO Event_EventLinks(EventType,EventLinker,EventChoice,CityEvent,CityEventChoice,CheckKnownPlayers,CheckForActive) VALUES
('PLAYER_EVENT_FIRAXITE_FINAL',NULL,'PLAYER_EVENT_FIRAXITE_CHOICE_3',NULL,NULL,'false','true');

INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES

('PLAYER_EVENT_FIRAXITE_CHOICE_1','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_1_DESCRIPTION','TXT_KEY_PLAYER_EVENT_FIRAXITE_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_FIRAXITE_CHOICE_2','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_2_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_FIRAXITE_CHOICE_3','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_3_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_FIRAXITE_CHOICE_4','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_4_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CORP_CHOICE_4_HELP',NULL,'AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);

-- INSERT INTO EventChoice_MinimumStartYield(EventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO EventChoice_MinimumResourceRequired(EventChoiceType,ResourceType,Quantity) VALUES ;

-- INSERT INTO EventChoice_MinimumFeatureRequired(EventChoiceType,FeatureType,Quantity) VALUES ;

-- INSERT INTO EventChoice_EventCostYield(EventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO EventChoice_InstantYield(EventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO EventChoice_CityYield(EventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO EventChoice_BuildingClassYieldChange(EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES 
('PLAYER_EVENT_FIRAXITE_CHOICE_1','BUILDINGCLASS_FIRAXITE_MATERIALS','YIELD_SCIENCE',-2);

-- INSERT INTO EventChoice_BuildingClassYieldModifier (EventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

-- INSERT INTO EventChoice_ResourceQuantity (EventChoiceType,ResourceType,Quantity) VALUES ;

-- INSERT INTO EventChoice_FeatureYieldChange (EventChoiceType,FeatureType,YieldType,YieldChange) VALUES ;

-- INSERT INTO EventChoice_ImprovementYieldChange(EventChoiceType,ImprovementType,YieldType,YieldChange) VALUES ;

INSERT INTO EventChoice_ResourceYieldChange(EventChoiceType,ResourceType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_FIRAXITE_CHOICE_1','RESOURCE_IRON','YIELD_GOLD',6),
('PLAYER_EVENT_FIRAXITE_CHOICE_1','RESOURCE_ALUMINUM','YIELD_GOLD',6),
('PLAYER_EVENT_FIRAXITE_CHOICE_1','RESOURCE_MARBLE','YIELD_GOLD',6),
('PLAYER_EVENT_FIRAXITE_CHOICE_1','RESOURCE_COPPER','YIELD_GOLD',6),
('PLAYER_EVENT_FIRAXITE_CHOICE_1','RESOURCE_JADE','YIELD_GOLD',6);

-- INSERT INTO EventChoice_TerrainYieldChange (EventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO EventChoice_SpecialistYieldChange (EventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO EventChoice_FreeUnitClasses (EventChoiceType,UnitClassType,Quantity) VALUES ;

-- INSERT INTO EventChoice_FreeUnits(EventChoiceType,UnitType,Quantity) VALUES ;

-- INSERT INTO EventChoice_ConvertNumPopToReligion(EventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO EventChoice_ConvertPercentPopToReligion(EventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO EventChoiceFlavors(EventChoiceType,FlavorType,Flavor) VALUES
('PLAYER_EVENT_FIRAXITE_CHOICE_1','FLAVOR_GOLD',10),
('PLAYER_EVENT_FIRAXITE_CHOICE_2','FLAVOR_GOLD',10);

--------------------------------------------------------------------------------------------------
-- Text for Player Level Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_FIRAXITE_INITIAL_HELP', 'A large group of investors has reached out and asked for an opportunity to invest some of their resources into Firaxite Materials. They are suggesting that their experience and business acumen will lead to a more efficient use of company resources and, ultimately, greater profits. Are you willing to let these investors assume control of Firaxite Materials, under your watchful eye, of course?');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_FIRAXITE_FINAL_HELP', 'Those investors are back and still would like to invest some of their resources into Firaxite Materials. They strongly believe that their experience and business acumen will lead to a more efficient use of company resources and, ultimately, greater profits. Are you willing to let these investors assume control of Firaxite Materials, under your watchful eye, of course?');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_FIRAXITE_CHOICE_1_HELP', 'As a result of private investment, all resources associated with the Corporation gain +6 [ICON_GOLD] Gold; however, local corporate offices have 2 [ICON_RESEARCH] Science siphoned off for use by the investment team.');


--------------------------------------------------------------------------------------------------
--
-- City Level Events -----------------------------------------------------------------------------
--
--------------------------------------------------------------------------------------------------
INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_FIRAXITE_FIRST','EVENT_CLASS_GOOD',NULL,NULL,'naturalwonderpopup.dds','AS2D_EVENT_CHOICE',50,1,'true','false','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_FIRAXITE_MATERIALS',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FIRAXITE_SECOND','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_CORP_SECOND_DESCRIPTION','TXT_KEY_CITY_EVENT_FIRAXITE_SECOND_HELP','naturalwonderpopup.dds','AS2D_EVENT_CHOICE',50,1,'true','false','false',30,4,0,0,NULL,'ERA_POSTMODERN',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_FIRAXITE_MATERIALS',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FIRAXITE_THIRD_v1','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_CORP_THIRD_DESCRIPTION','TXT_KEY_CITY_EVENT_FIRAXITE_THIRD_HELP','naturalwonderpopup.dds','AS2D_EVENT_CHOICE',50,1,'true','false','false',30,2,0,0,NULL,'ERA_FUTURE',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_FIRAXITE_MATERIALS',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FIRAXITE_THIRD_v2','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_CORP_THIRD_DESCRIPTION','TXT_KEY_CITY_EVENT_FIRAXITE_THIRD_HELP','naturalwonderpopup.dds','AS2D_EVENT_CHOICE',50,1,'true','false','false',30,2,0,0,NULL,'ERA_FUTURE',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_FIRAXITE_MATERIALS',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FIRAXITE_THIRD_v3','EVENT_CLASS_NEUTRAL','TXT_KEY_CITY_EVENT_CORP_THIRD_DESCRIPTION','TXT_KEY_CITY_EVENT_FIRAXITE_THIRD_HELP','naturalwonderpopup.dds','AS2D_EVENT_CHOICE',50,1,'true','false','false',30,2,0,0,NULL,'ERA_FUTURE',NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_FIRAXITE_MATERIALS',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_FIRAXITE_THISISBAD','EVENT_CLASS_BAD',NULL,NULL,'naturalwonderpopup.dds','AS2D_EVENT_CHOICE',15,0,'false','true','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_FIRAXITE_MATERIALS',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_FIRAXITE_FIRST_CHOICE_1','CITY_EVENT_FIRAXITE_FIRST'),
('CITY_EVENT_CORP_SECOND_CHOICE_1','CITY_EVENT_FIRAXITE_SECOND'),
('CITY_EVENT_CORP_SECOND_CHOICE_2','CITY_EVENT_FIRAXITE_SECOND'),
('CITY_EVENT_CORP_SECOND_CHOICE_3','CITY_EVENT_FIRAXITE_SECOND'),
('CITY_EVENT_CORP_SECOND_CHOICE_4','CITY_EVENT_FIRAXITE_SECOND'),
('CITY_EVENT_CORP_THIRD_CHOICE_1','CITY_EVENT_FIRAXITE_THIRD_v1'),
('CITY_EVENT_CORP_THIRD_CHOICE_4','CITY_EVENT_FIRAXITE_THIRD_v1'),
('CITY_EVENT_CORP_THIRD_CHOICE_2','CITY_EVENT_FIRAXITE_THIRD_v2'),
('CITY_EVENT_CORP_THIRD_CHOICE_4','CITY_EVENT_FIRAXITE_THIRD_v2'),
('CITY_EVENT_CORP_THIRD_CHOICE_3','CITY_EVENT_FIRAXITE_THIRD_v3'),
('CITY_EVENT_CORP_THIRD_CHOICE_4','CITY_EVENT_FIRAXITE_THIRD_v3'),
('CITY_EVENT_FIRAXITE_THISISBAD_CHOICE_1','CITY_EVENT_FIRAXITE_THISISBAD');

INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES 
('CITY_EVENT_FIRAXITE_SECOND','YIELD_GOLD',1000),
('CITY_EVENT_FIRAXITE_THIRD_v1','YIELD_GOLD',2500),
('CITY_EVENT_FIRAXITE_THIRD_v2','YIELD_GOLD',2500),
('CITY_EVENT_FIRAXITE_THIRD_v3','YIELD_GOLD',2500);

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_FIRAXITE_FIRST_CHOICE_1','TXT_KEY_CITY_EVENT_CORP_FIRST_CHOICE_1','TXT_KEY_CITY_EVENT_FIRAXITE_FIRST_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_FIRAXITE_THISISBAD_CHOICE_1','TXT_KEY_CITY_EVENT_CORP_THISISBAD_DESCRIPTION','TXT_KEY_CITY_EVENT_FIRAXITE_THISISBAD_HELP',NULL,'AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false','BUILDINGCLASS_FIRAXITE_MATERIALS',NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_FIRAXITE_SECOND',NULL,NULL,'CITY_EVENT_FIRAXITE_FIRST',NULL,'false','true','true'),
('CITY_EVENT_FIRAXITE_THIRD_v1',NULL,NULL,NULL,'CITY_EVENT_CORP_SECOND_CHOICE_1','false','true','true'),
('CITY_EVENT_FIRAXITE_THIRD_v2',NULL,NULL,NULL,'CITY_EVENT_CORP_SECOND_CHOICE_2','false','true','true'),
('CITY_EVENT_FIRAXITE_THIRD_v3',NULL,NULL,NULL,'CITY_EVENT_CORP_SECOND_CHOICE_3','false','true','true'),
('CITY_EVENT_FIRAXITE_THISISBAD',NULL,NULL,'CITY_EVENT_FIRAXITE_THISISBAD',NULL,'false','false','true');

-- INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_FIRAXITE_THISISBAD_CHOICE_1','YIELD_GOLD', -500);

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

-- INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES ;

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES 
('CITY_EVENT_FIRAXITE_FIRST_CHOICE_1','IMPROVEMENT_MINE','YIELD_GOLD',4),
('CITY_EVENT_FIRAXITE_FIRST_CHOICE_1','IMPROVEMENT_MANUFACTORY','YIELD_GOLD',4);

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
VALUES ('TXT_KEY_CITY_EVENT_FIRAXITE_FIRST_CHOICE_1_HELP','Allowing investment into Firaxite Materials has lead in a local increase in Company revenues. As a result, each local Mine and Manufactory worked by the City now provides an additional +4 [ICON_GOLD] Gold into the City coffers.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_FIRAXITE_SECOND_HELP','One of the investors in Firaxite Materials thinks the Company would be better off if we really focused our local efforts on a particular strategic goal. The team has put together three different options: one focused on R&D, a second that is geared towards production efficiencies, and a third that should significantly increase our profit margins. What would you like to do?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_FIRAXITE_THIRD_HELP','The management team at the local Firaxite Materials office has identified one of the assistants to the regional manager as having real potential. They are requesting permission create a new division in the Company and promote him into a leadership position.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_FIRAXITE_THISISBAD_HELP','A scandal at the local Firaxite Materials branch has created a huge public backlash. Rioting has destroyed the local branch office, and the Company is being forced to pay major fines as restitution.');
