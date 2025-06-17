-- THEOCRATIC_RULE --
--
-- Belief = BELIEF_WORLD_CHURCH
-- ReligionName (for events) = 	THEOCRATIC_RULE (e.g. 'APOSTOLIC_TRADITION')
-- Dummy Policy Name =			POLICY_WORLD_CHURCH_DUMMY (e.g. 'POLICY_PAPAL_PRIMACY_DUMMY')
-- Event Promtion = 			PROMOTION_RELIGION_THEOCRATIC_RULE
--------------------------------------------------------------------------------------------------

INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_THEOCRATIC_RULE','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_DESCRIPTION','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',10,1,'false','false','false','true',30,7,0,0,NULL,NULL,NULL,'false','false',NULL,0,'false','POLICY_WORLD_CHURCH_DUMMY',NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'true',NULL,NULL,'false','false','false','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1','PLAYER_EVENT_THEOCRATIC_RULE'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_2','PLAYER_EVENT_THEOCRATIC_RULE'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_3','PLAYER_EVENT_THEOCRATIC_RULE'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_4','PLAYER_EVENT_THEOCRATIC_RULE'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_5','PLAYER_EVENT_THEOCRATIC_RULE'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_6','PLAYER_EVENT_THEOCRATIC_RULE');

INSERT INTO Event_MinimumStartYield (EventType,YieldType,Yield) VALUES 
('PLAYER_EVENT_THEOCRATIC_RULE','YIELD_FAITH',200);

--------------------------------------------------------------------------------------------------
-- Dummy Building for Bonus per Pop - Update Building_YieldChangesPerPop
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_THEOCRATIC_RULE_POPYIELD_DUMMY','BUILDING_THEOCRATIC_RULE_POPYIELD_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune) VALUES
('BUILDING_THEOCRATIC_RULE_POPYIELD_DUMMY','BUILDINGCLASS_THEOCRATIC_RULE_POPYIELD_DUMMY','TXT_KEY_BUILDING_THEOCRATIC_RULE_POPYIELD_DUMMY',-1,-1,1,-1,0,1,1);

INSERT INTO Building_YieldChangesPerPop (BuildingType,YieldType,Yield) VALUES
('BUILDING_THEOCRATIC_RULE_POPYIELD_DUMMY','YIELD_PRODUCTION',20);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_THEOCRATIC_RULE_POPYIELD_DUMMY','[ICON_PEACE] TheocraticRule PopYields Dummy');
--------------------------------------------------------------------------------------------------
-- Bonus Dummy Building - Adjust as necessary
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_THEOCRATIC_RULE_BONUS1_DUMMY','BUILDING_THEOCRATIC_RULE_BONUS1_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,ExtraLeagueVotes) VALUES
('BUILDING_THEOCRATIC_RULE_BONUS1_DUMMY','BUILDINGCLASS_THEOCRATIC_RULE_BONUS1_DUMMY','TXT_KEY_BUILDING_THEOCRATIC_RULE_BONUS1_DUMMY',-1,-1,1,-1,0,1,1,2);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_THEOCRATIC_RULE_BONUS1_DUMMY','[ICON_PEACE] TheocraticRule Bonus Feature Dummy');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_0','TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_DESCRIPTION','TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','false',30,'true',25,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1_DESCRIPTION','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_TEMPLE',NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_2','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_2_DESCRIPTION','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_2_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false','IMPROVEMENT_HOLY_SITE',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_3','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_3_DESCRIPTION','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_3_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'true','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,'PROMOTION_RELIGION_THEOCRATIC_RULE',NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate reformation builidng
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_4','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_4_DESCRIPTION','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_4_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_GRAND_OSSUARY',NULL,'false','false','false','false',NULL,NULL,NULL,'BUILDINGCLASS_THEOCRATIC_RULE_POPYIELD_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate Spy dummy building from setup or delete spy building AND capital only effect
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_5','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_5_DESCRIPTION','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_5_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','true','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate bonus dummy building. If not needed, delete building AND capital only effect
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_6','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_6_DESCRIPTION','TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_6_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','true','false',NULL,NULL,NULL,'BUILDINGCLASS_THEOCRATIC_RULE_BONUS1_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);

INSERT INTO EventChoice_EventLinks(EventChoiceType,Event,EventChoiceLinker,CityEvent,CityEventChoice,CheckKnownPlayers,CheckForActive) VALUES
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_2',NULL,'PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_3',NULL,'PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_4',NULL,'PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_5',NULL,'PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_6',NULL,'PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_2',NULL,NULL,'false','true'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_6',NULL,'PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_3',NULL,NULL,'false','true'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_6',NULL,'PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_4',NULL,NULL,'false','true'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_6',NULL,'PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_5',NULL,NULL,'false','true');

--------------------------------------------------------------------------------------------------
-- Event Yield Costs - Adjust Yields for Choice 4 as appropriate
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_EventCostYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1','YIELD_FAITH',100),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_2','YIELD_FAITH',300),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_3','YIELD_CULTURE',200),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_3','YIELD_SCIENCE',200),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_4','YIELD_PRODUCTION',200);

--------------------------------------------------------------------------------------------------
-- Temple Yield Change from Choice 1 - Adjust Yields as appropriate
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_BuildingClassYieldChange (EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1','BUILDINGCLASS_TEMPLE','YIELD_GOLD',4); 

--------------------------------------------------------------------------------------------------
-- Specialist Yield Change from Choice 5 - Adjust Yields, Delete if not applicable
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_SpecialistYieldChange(EventChoiceType,SpecialistType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_5','SPECIALIST_CIVIL_SERVANT','YIELD_FAITH',1),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_5','SPECIALIST_CIVIL_SERVANT','YIELD_CULTURE',1);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID) VALUES
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_THEOCRATIC_RULE_CHOICE_1','TXT_KEY_NOTIFICATION_EVENT_THEOCRATIC_RULE_CHOICE_1_S','true','true'),
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_6','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_THEOCRATIC_RULE_CHOICE_6','TXT_KEY_NOTIFICATION_EVENT_THEOCRATIC_RULE_CHOICE_6_S','true','true');

--------------------------------------------------------------------------------------------------
-- 'No Thanks' event choice setup
--------------------------------------------------------------------------------------------------
INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_0','PLAYER_EVENT_THEOCRATIC_RULE');

INSERT INTO EventChoice_EventCostYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_0','YIELD_FAITH',50);

INSERT INTO EventChoice_InstantYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_0','YIELD_GOLD',400);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID) VALUES
('PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_0','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0','TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0_S','false','false');

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_DESCRIPTION', 'A Featherweight Heart');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_HELP', 'We all know that to pass into the afterlife, the great guardian will weigh our hearts against a single feather. For most a life of good deeds can outweigh our darker acts. But you, of Great One, you are destined to live a thousand mortal life times, and send a thousand thousand souls to next world.[NEWLINE][NEWLINE]All our work will be for naught if we cannot save your immortal soul!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1_DESCRIPTION', 'It is known that a man buried with his servants may bring them to bear witnesses to his good character. We must find a way that I may bring all of you, my subjects, to my judgment!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_1_HELP', 'Invoke {1_YieldCost} of new doctrine, causing your Temples to generate +4 [ICON_GOLD] Gold.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_THEOCRATIC_RULE_CHOICE_1', '{3_PlayerName}''s religious men and women proclaim their ruler''s divinity.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_THEOCRATIC_RULE_CHOICE_1_S', '{3_PlayerName} begins on the quest of Theocratic Rule');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_2_DESCRIPTION', 'Devotion to you has led to the annual celebrations of your life lavish and splendid[NEWLINE]You see! They love me. They really love me!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_2_HELP', '{1_YieldCost} is spent on local celebrations of your life in the Holy City. The lingering effects reduce local [ICON_HAPPINESS_3] Unhappiness from Specialists by 2.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_3_DESCRIPTION', 'All who live under {3_PlayerName}''s rule are pledged to travel with me through the next world. But what about all those who lived in ages gone by? Set the priests to it!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_3_HELP', 'Knowledge gained from the priesthood is used to benefit the military. Incorporate {1_YieldCost} into military training, and all Units will recieve bonus [ICON_RESEARCH] Science when leveling up.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_4_DESCRIPTION', 'We must dig deeper tunnels and grander chambers in the Grand Ossuary if all the children of the faith are to be interred together! Bring me all the able men you can find to work on the excavation. If they die in the process... well, at least we won''t have to move them far.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_4_HELP', 'Use {1_YieldCost} to expand our mass grave. By working together, all Cities are able to gain +1 [ICON_PRODUCTION] Production for every 5 [ICON_CITIZEN] Citizens.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_5_DESCRIPTION', 'Now all the practicalities are finally in place, we need to organise the burials. Summon all Civil Servants to the Ossuary!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_5_HELP', 'In the final stage of the quest, all [ICON_DIPLOMAT] Civil Servants generate +1 [ICON_PEACE] Faith and +1 [ICON_CULTURE] Culture.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_6_DESCRIPTION', 'As you walk through the catacombs, the sense of peace is palpable. Millions of souls all waiting here, to stand witness to your greatness before the God of Death.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_6_HELP', 'The world stands in awe of the granduer of the Ossuary. As a result, you gain +2 [ICON_CSD_CIVIL_SERVANT] Delegates in the World Congress.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_THEOCRATIC_RULE_CHOICE_6', '{3_PlayerName}''s vast burial halls are a wonder of the world unparalleled in history!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_THEOCRATIC_RULE_CHOICE_6_S', '{3_PlayerName} completes the quest of  Theocratic Rule.');


--------------------------------------------------------------------------------------------------
-- The following is a city-event that triggers to force building construction in the Holy City
--------------------------------------------------------------------------------------------------
INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_THEOCRATIC_RULE_NEEDS','EVENT_CLASS_NEUTRAL',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_EVENT_CHOICE',1000,0,'true','false','true',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'true','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_THEOCRATIC_RULE_NEEDS',NULL,'PLAYER_EVENT_THEOCRATIC_RULE_CHOICE_2',NULL,NULL,'false','false','true');

--------------------------------------------------------------------------------------------------
-- Dummy Building for Needs reduction in Holy City - Delete the unneccessary inserts
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_THEOCRATIC_RULE_NEEDS_DUMMY','BUILDING_THEOCRATIC_RULE_NEEDS_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,NoUnhappfromXSpecialists) VALUES
('BUILDING_THEOCRATIC_RULE_NEEDS_DUMMY','BUILDINGCLASS_THEOCRATIC_RULE_NEEDS_DUMMY','TXT_KEY_BUILDING_THEOCRATIC_RULE_NEEDS_DUMMY',-1,-1,1,-1,0,1,1,2);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_THEOCRATIC_RULE_NEEDS_DUMMY','Holy Needs Dummy Building');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_THEOCRATIC_RULE_NEEDS_CHOICE_1','CITY_EVENT_THEOCRATIC_RULE_NEEDS');

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,GrowthMod,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_THEOCRATIC_RULE_NEEDS_CHOICE_1','TXT_KEY_THEOCRATIC_RULE_NEEDS_CHOICE_1_DESCRIPTION','TXT_KEY_THEOCRATIC_RULE_NEEDS_CHOICE_1_DESCRIPTION','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_THEOCRATIC_RULE_NEEDS_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_THEOCRATIC_RULE_NEEDS_CHOICE_1_DESCRIPTION', 'Religious Bonus');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_THEOCRATIC_RULE_NEEDS_CHOICE_1_HELP', 'Unhappiness from Specialists has been reduced by 2 in {3_CityName}.');
--------------------------------------------------------------------------------------------------
-- End triggered event
--------------------------------------------------------------------------------------------------