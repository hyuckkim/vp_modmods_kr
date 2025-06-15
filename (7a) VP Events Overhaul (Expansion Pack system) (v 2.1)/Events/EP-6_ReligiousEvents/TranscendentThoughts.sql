-- TRANSCENDENT_THOUGHTS --
--
-- Belief = BELIEF_INITIATION_RITES
-- ReligionName (for events) = 	TRANSCENDENT_THOUGHTS (e.g. 'APOSTOLIC_TRADITION')
-- Dummy Policy Name =			POLICY_INITIATION_RITES_DUMMY (e.g. 'POLICY_PAPAL_PRIMACY_DUMMY')
-- Event Promtion = 			PROMOTION_RELIGION_TRANSCENDENT_THOUGHTS
--------------------------------------------------------------------------------------------------

INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_TRANSCENDENT_THOUGHTS','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_DESCRIPTION','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',10,1,'false','false','false','true',30,7,0,0,NULL,NULL,NULL,'false','false',NULL,0,'false','POLICY_INITIATION_RITES_DUMMY',NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'true',NULL,NULL,'false','false','false','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1','PLAYER_EVENT_TRANSCENDENT_THOUGHTS'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_2','PLAYER_EVENT_TRANSCENDENT_THOUGHTS'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_3','PLAYER_EVENT_TRANSCENDENT_THOUGHTS'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_4','PLAYER_EVENT_TRANSCENDENT_THOUGHTS'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_5','PLAYER_EVENT_TRANSCENDENT_THOUGHTS'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6','PLAYER_EVENT_TRANSCENDENT_THOUGHTS');

INSERT INTO Event_MinimumStartYield (EventType,YieldType,Yield) VALUES 
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS','YIELD_FAITH',200);

--------------------------------------------------------------------------------------------------
-- Dummy Building for Bonus per Pop - Update Building_YieldChangesPerPop
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_TRANSCENDENT_THOUGHTS_POPYIELD_DUMMY','BUILDING_TRANSCENDENT_THOUGHTS_POPYIELD_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune) VALUES
('BUILDING_TRANSCENDENT_THOUGHTS_POPYIELD_DUMMY','BUILDINGCLASS_TRANSCENDENT_THOUGHTS_POPYIELD_DUMMY','TXT_KEY_BUILDING_TRANSCENDENT_THOUGHTS_POPYIELD_DUMMY',-1,-1,1,-1,0,1,1);

INSERT INTO Building_YieldChangesPerPop (BuildingType,YieldType,Yield) VALUES
('BUILDING_TRANSCENDENT_THOUGHTS_POPYIELD_DUMMY','YIELD_FOOD',20);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_TRANSCENDENT_THOUGHTS_POPYIELD_DUMMY','[ICON_PEACE] Transcendent PopYields Dummy');
--------------------------------------------------------------------------------------------------
-- Bonus Dummy Building - Adjust as necessary
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_TRANSCENDENT_THOUGHTS_BONUS1_DUMMY','BUILDING_TRANSCENDENT_THOUGHTS_BONUS1_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,GlobalCityWorkingChange) VALUES
('BUILDING_TRANSCENDENT_THOUGHTS_BONUS1_DUMMY','BUILDINGCLASS_TRANSCENDENT_THOUGHTS_BONUS1_DUMMY','TXT_KEY_BUILDING_TRANSCENDENT_THOUGHTS_BONUS1_DUMMY',-1,-1,1,-1,0,1,1,1);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_TRANSCENDENT_THOUGHTS_BONUS1_DUMMY','[ICON_PEACE] Transcendent Bonus Feature Dummy');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_0','TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_DESCRIPTION','TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','false',30,'true',25,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1_DESCRIPTION','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_TEMPLE',NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_2','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_2_DESCRIPTION','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_2_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false','IMPROVEMENT_HOLY_SITE',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_3','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_3_DESCRIPTION','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_3_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'true','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,'PROMOTION_RELIGION_TRANSCENDENT_THOUGHTS',NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate reformation builidng
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_4','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_4_DESCRIPTION','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_4_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_SACRED_GARDEN',NULL,'false','false','false','false',NULL,NULL,NULL,'BUILDINGCLASS_TRANSCENDENT_THOUGHTS_POPYIELD_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate Spy dummy building from setup or delete spy building AND capital only effect
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_5','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_5_DESCRIPTION','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_5_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','true','true','false',NULL,NULL,NULL,'BUILDINGCLASS_RELIGION_NOSPY_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate bonus dummy building. If not needed, delete building AND capital only effect
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6_DESCRIPTION','TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','true','false',NULL,NULL,NULL,'BUILDINGCLASS_TRANSCENDENT_THOUGHTS_BONUS1_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);

INSERT INTO EventChoice_EventLinks(EventChoiceType,Event,EventChoiceLinker,CityEvent,CityEventChoice,CheckKnownPlayers,CheckForActive) VALUES
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_2',NULL,'PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_3',NULL,'PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_4',NULL,'PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_5',NULL,'PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6',NULL,'PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_2',NULL,NULL,'false','true'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6',NULL,'PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_3',NULL,NULL,'false','true'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6',NULL,'PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_4',NULL,NULL,'false','true'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6',NULL,'PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_5',NULL,NULL,'false','true');

--------------------------------------------------------------------------------------------------
-- Event Yield Costs - Adjust Yields for Choice 4 as appropriate
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_EventCostYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1','YIELD_FAITH',100),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_2','YIELD_FAITH',300),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_3','YIELD_CULTURE',200),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_3','YIELD_SCIENCE',200),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_4','YIELD_FOOD',200);

--------------------------------------------------------------------------------------------------
-- Temple Yield Change from Choice 1 - Adjust Yields as appropriate
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_BuildingClassYieldChange (EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1','BUILDINGCLASS_TEMPLE','YIELD_FOOD',2); 

--------------------------------------------------------------------------------------------------
-- Specialist Yield Change from Choice 5 - Adjust Yields, Delete if not applicable
--------------------------------------------------------------------------------------------------
--INSERT INTO EventChoice_SpecialistYieldChange(EventChoiceType,SpecialistType,YieldType,YieldChange) VALUES
--('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_5','SPECIALIST_CIVIL_SERVANT','YIELD_FAITH',2),
--('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_5','SPECIALIST_CIVIL_SERVANT','YIELD_GOLDEN_AGE_POINTS',2);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID) VALUES
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1','TXT_KEY_NOTIFICATION_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1_S','true','true'),
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6','TXT_KEY_NOTIFICATION_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6_S','true','true');

--------------------------------------------------------------------------------------------------
-- 'No Thanks' event choice setup
--------------------------------------------------------------------------------------------------
INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_0','PLAYER_EVENT_TRANSCENDENT_THOUGHTS');

INSERT INTO EventChoice_EventCostYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_0','YIELD_FAITH',50);

INSERT INTO EventChoice_InstantYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_0','YIELD_FOOD',200);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID) VALUES
('PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_0','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0','TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0_S','false','false');

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_DESCRIPTION', 'The Eightfold Way');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_HELP', 'Who is the noblest man in the Empire? Is it the Emperor? Or the High Priest? Perhaps an unknown soldier, sacrificing everything for his friends? In truth, it is the humble gardener. Only a man who sees the world exactly as it is, and seeks to live in harmony with it, will become one with eternity.[NEWLINE][NEWLINE]You wish to learn, but there is no one to teach you but yourself.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1_DESCRIPTION', 'There may be no one man who has mastered the Way, but together we can discover the secret!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1_HELP', 'Invoke {1_YieldCost} of new doctrine, causing your Temples to generate +2 [ICON_FOOD] Food.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1', '{3_PlayerName}''s religious men and women begin scouring ancient texts for clues to the secrets of the Way of Transcendence.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_1_S', '{3_PlayerName} begins on the quest of the Way of Transcendence.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_2_DESCRIPTION', 'Once occupying but a small site in the City, hundreds have given their land to the expansion of the Sacred Garden[NEWLINE]The peace and tranquility of the Garden is the door to paradise. But only within can we find true eternity');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_2_HELP', 'Contentment with life causes a reduction in {1_YieldCost} in the Holy City, but has also resulted in a reduction of 2 for local [ICON_HAPPINESS_3] Unhappiness caused by Poverty.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_3_DESCRIPTION', 'The movement grows strong, but we must be strong as a people if we are to be successful.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_3_HELP', 'The concept of a united strength permeates through the military. Leaders confiscate {1_YieldCost] amd use this in training and now Melee and Gun Units earn [ICON_GREAT_GENERAL] Great Generals 100% faster.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_4_DESCRIPTION', 'As the Garden expands, it reveals exquisite patterns and interelationships in such a way that I feel as if the secrets of the very Universe itself are being revealed to me!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_4_HELP', 'By spending {1_YieldCost} to emulate the Sacred Garden in every City, all Cities gain +1 [ICON_FOOD] Food for every 5 [ICON_CITIZEN] Citizens.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_5_DESCRIPTION', 'Our enemies are surely aware of our quest by now. We must protect the Garden at all costs!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_5_HELP', 'Protecting the final stage of the quest, all enemy [ICON_SPY] Spies are reduced in effectiveness by 15%.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6_DESCRIPTION', 'It was then I realised. There is no Garden. No Empire. That this game has played out hundreds of times before, and will hundrends of times again. I am at peace.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6_HELP', 'Recognizing that everyone and everywhere is the Garden has broadened our horizons. The working radius of every City has increased by +1.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6', '{3_PlayerName} has discovers the secrets of the Way of Transcendence!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_6_S', '{3_PlayerName} completes the quest of the Way of Transcendence.');

--------------------------------------------------------------------------------------------------
-- The following is a city-event that triggers to force building construction in the Holy City
--------------------------------------------------------------------------------------------------
INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_TRANSCENDENT_THOUGHTS_NEEDS','EVENT_CLASS_NEUTRAL',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_EVENT_CHOICE',1000,0,'true','false','true',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'true','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_TRANSCENDENT_THOUGHTS_NEEDS',NULL,'PLAYER_EVENT_TRANSCENDENT_THOUGHTS_CHOICE_2',NULL,NULL,'false','false','true');

--------------------------------------------------------------------------------------------------
-- Dummy Building for Needs reduction in Holy City - Delete the unneccessary inserts
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_TRANSCENDENT_THOUGHTS_NEEDS_DUMMY','BUILDING_TRANSCENDENT_THOUGHTS_NEEDS_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,PovertyFlatReduction) VALUES
('BUILDING_TRANSCENDENT_THOUGHTS_NEEDS_DUMMY','BUILDINGCLASS_TRANSCENDENT_THOUGHTS_NEEDS_DUMMY','TXT_KEY_BUILDING_TRANSCENDENT_THOUGHTS_NEEDS_DUMMY',-1,-1,1,-1,0,1,1,2);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_TRANSCENDENT_THOUGHTS_NEEDS_DUMMY','Holy Needs Dummy Building');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_TRANSCENDENT_THOUGHTS_NEEDS_CHOICE_1','CITY_EVENT_TRANSCENDENT_THOUGHTS_NEEDS');

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,GrowthMod,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_TRANSCENDENT_THOUGHTS_NEEDS_CHOICE_1','TXT_KEY_TRANSCENDENT_THOUGHTS_NEEDS_CHOICE_1_DESCRIPTION','TXT_KEY_TRANSCENDENT_THOUGHTS_NEEDS_CHOICE_1_DESCRIPTION','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_TRANSCENDENT_THOUGHTS_NEEDS_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_TRANSCENDENT_THOUGHTS_NEEDS_CHOICE_1_DESCRIPTION', 'Religious Bonus');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_TRANSCENDENT_THOUGHTS_NEEDS_CHOICE_1_HELP', 'Unhappiness from Poverty has been reduced by 2 in {3_CityName}.');
--------------------------------------------------------------------------------------------------
-- End triggered event
--------------------------------------------------------------------------------------------------