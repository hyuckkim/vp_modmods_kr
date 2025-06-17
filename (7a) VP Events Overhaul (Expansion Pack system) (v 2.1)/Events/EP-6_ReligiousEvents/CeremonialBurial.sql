-- CEREMONIAL_BURIAL --
--
-- Belief = BELIEF_CEREMONIAL_BURIAL
-- ReligionName (for events) = 	CEREMONIAL_BURIAL (e.g. 'APOSTOLIC_TRADITION')
-- Dummy Policy Name =			POLICY_CEREMONIAL_BURIAL_DUMMY (e.g. 'POLICY_PAPAL_PRIMACY_DUMMY')
-- Event Promtion = 			'PROMOTION_RELIGION_CEREMONIAL_BURIAL'
--------------------------------------------------------------------------------------------------

INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_CEREMONIAL_BURIAL','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',10,1,'false','false','false','true',30,7,0,0,NULL,NULL,NULL,'false','false',NULL,0,'false','POLICY_CEREMONIAL_BURIAL_DUMMY',NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'true',NULL,NULL,'false','false','false','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1','PLAYER_EVENT_CEREMONIAL_BURIAL'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_2','PLAYER_EVENT_CEREMONIAL_BURIAL'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_3','PLAYER_EVENT_CEREMONIAL_BURIAL'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_4','PLAYER_EVENT_CEREMONIAL_BURIAL'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_5','PLAYER_EVENT_CEREMONIAL_BURIAL'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_6','PLAYER_EVENT_CEREMONIAL_BURIAL');

INSERT INTO Event_MinimumStartYield (EventType,YieldType,Yield) VALUES 
('PLAYER_EVENT_CEREMONIAL_BURIAL','YIELD_FAITH',200);

--------------------------------------------------------------------------------------------------
-- Dummy Building for Bonus per Pop - Update Building_YieldChangesPerPop
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_CEREMONIAL_BURIAL_POPYIELD_DUMMY','BUILDING_CEREMONIAL_BURIAL_POPYIELD_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune) VALUES
('BUILDING_CEREMONIAL_BURIAL_POPYIELD_DUMMY','BUILDINGCLASS_CEREMONIAL_BURIAL_POPYIELD_DUMMY','TXT_KEY_BUILDING_CEREMONIAL_BURIAL_POPYIELD_DUMMY',-1,-1,1,-1,0,1,1);

INSERT INTO Building_YieldChangesPerPop (BuildingType,YieldType,Yield) VALUES
('BUILDING_CEREMONIAL_BURIAL_POPYIELD_DUMMY','YIELD_TOURISM',10);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_CEREMONIAL_BURIAL_POPYIELD_DUMMY','[ICON_PEACE] CeremonialBurial PopYields Dummy');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------

INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_0','TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_DESCRIPTION','TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','false',30,'true',25,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_TEMPLE',NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_2','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_2_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_2_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false','IMPROVEMENT_HOLY_SITE',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_3','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_3_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_3_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'true','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,'PROMOTION_RELIGION_CEREMONIAL_BURIAL',NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate reformation builidng
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_4','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_4_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_4_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_MAUSOLEUM',NULL,'false','false','false','false',NULL,NULL,NULL,'BUILDINGCLASS_CEREMONIAL_BURIAL_POPYIELD_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate Spy dummy building from setup or delete spy builidng AND capital only effect
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_5','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_5_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_5_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','true','true','false',NULL,NULL,NULL,'BUILDINGCLASS_RELIGION_FREESPY_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate bonus dummy building. If not needed, delete building AND capital only effect
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_6','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_6_DESCRIPTION','TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_6_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);

INSERT INTO EventChoice_EventLinks(EventChoiceType,Event,EventChoiceLinker,CityEvent,CityEventChoice,CheckKnownPlayers,CheckForActive) VALUES
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_2',NULL,'PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_3',NULL,'PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_4',NULL,'PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_5',NULL,'PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_6',NULL,'PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_2',NULL,NULL,'false','true'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_6',NULL,'PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_3',NULL,NULL,'false','true'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_6',NULL,'PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_4',NULL,NULL,'false','true'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_6',NULL,'PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_5',NULL,NULL,'false','true');

--------------------------------------------------------------------------------------------------
-- Event Yield Costs - Adjust Yields for Choice 4 as appropriate
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_EventCostYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1','YIELD_FAITH',100),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_2','YIELD_FAITH',300),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_3','YIELD_CULTURE',200),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_3','YIELD_SCIENCE',200),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_4','YIELD_TOURISM',200);

--------------------------------------------------------------------------------------------------
-- Temple Yield Change from Choice 1 - Adjust Yields as appropriate
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_BuildingClassYieldChange (EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1','BUILDINGCLASS_TEMPLE','YIELD_FAITH',2); 

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID) VALUES
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_CEREMONIAL_BURIAL_CHOICE_1','TXT_KEY_NOTIFICATION_EVENT_CEREMONIAL_BURIAL_CHOICE_1_S','true','true'),
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_6','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_CEREMONIAL_BURIAL_CHOICE_6','TXT_KEY_NOTIFICATION_EVENT_CEREMONIAL_BURIAL_CHOICE_6_S','true','true');

--------------------------------------------------------------------------------------------------
-- 'No Thanks' event choice setup
--------------------------------------------------------------------------------------------------
INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_0','PLAYER_EVENT_CEREMONIAL_BURIAL');

INSERT INTO EventChoice_EventCostYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_0','YIELD_FAITH',50);

INSERT INTO EventChoice_InstantYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_0','YIELD_FAITH',200);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID) VALUES
('PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_0','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0','TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0_S','false','false');

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_DESCRIPTION', 'Body And Soul');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_HELP', 'When our first Prophet founded our great Religion, he disappeared from the realm. Some say he ascended to heaven, but others whisper of a more sinister fate. If our interpretations of the text are correct, his potential lack of an interment would hold his soul in limbo. What is more, without the guidance of our Prophet, who knows if our fallen brothers have been able to navigate their way through the afterlife?[NEWLINE][NEWLINE]This is our quest: to recover the Relics of the Prophet, and in so doing save us all.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1_DESCRIPTION', 'Where do we even begin? We need to study the ancient records, and find out everything we can about the life of the Prophet!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_1_HELP', 'Invoke {1_YieldCost} of new doctrine, causing your Temples to generate +2 [ICON_PEACE] Faith.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_CEREMONIAL_BURIAL_CHOICE_1', '{3_PlayerName}''s religious men and women begin scouring ancient texts for clues to the secrets of Ceremonial Burial.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_CEREMONIAL_BURIAL_CHOICE_1_S', '{3_PlayerName} begins on the quest of Ceremonial Burial.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_2_DESCRIPTION', 'The search continues, and I am not satisfied with our current progress. If we are to understand the mind of the Prophet, to understand his motives and whims, we must live and pray as he did.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_2_HELP', 'After committing {1_YieldCost} into the faith, the citizens of your Holy City rededicate their lives to the Prophet, reducing local [ICON_HAPPINESS_3] Unhappiness by 2 from Distress.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_3_DESCRIPTION', 'Study into the central tenets of our belief have emphasised the key practices of a life bound for heaven*[NEWLINE]Those who believe in the promise of paradise will do anything to safeguard their immortal soul. This will profit us greatly.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_3_HELP', 'By committing {1_YieldCost} to your military, Melee, Gun, Archer, and Siege Units gain the Steadfast promotion, resulting in additional combat and defensive bonuses against Melee and Gun Units.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_4_DESCRIPTION', 'Finally, success! A sanctuary, forgotten to the world, has been uncovered. Inside were scrolls and trinkets that seem to have belonged to the Prophet! We must share this with the world!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_4_HELP', 'By spending {1_YieldCost} to share these writings, all Cities gain +1 [ICON_TOURISM] Tourism for every 10 [ICON_CITIZEN] Citizens.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_5_DESCRIPTION', 'The final scrolls have been translated. Locations that could be the Prophet''s last resting place have been identified. We need to recover our most holy relics before they are lost to the ever-changing world!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_5_HELP', 'In the quest for the final resting place, receive an extra [ICON_SPY] Spy.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_6_DESCRIPTION', 'Our efforts have finally been rewarded. The body of the Prophet was recovered, still miraculously whole. He may now be interred in the place of honour of the Mausoleum. Finally, we have perhaps secured all our places in the world beyond this one!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_6_HELP', 'Gain a free Social Policy.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_CEREMONIAL_BURIAL_CHOICE_6', '{3_PlayerName} has uncovered the holy relic of Ceremonial Burial!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_CEREMONIAL_BURIAL_CHOICE_6_S', '{3_PlayerName} completes the quest of Ceremonial Burial.');


--------------------------------------------------------------------------------------------------
-- The following is a city-event that triggers to force building construction in the Holy City
--------------------------------------------------------------------------------------------------
INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_CEREMONIAL_BURIAL_NEEDS','EVENT_CLASS_NEUTRAL',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_EVENT_CHOICE',1000,0,'true','false','true',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'true','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_CEREMONIAL_BURIAL_NEEDS',NULL,'PLAYER_EVENT_CEREMONIAL_BURIAL_CHOICE_2',NULL,NULL,'false','false','true');

--------------------------------------------------------------------------------------------------
-- Dummy Building for Needs reduction in Holy City - Delete the unneccessary inserts
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_CEREMONIAL_BURIAL_NEEDS_DUMMY','BUILDING_CEREMONIAL_BURIAL_NEEDS_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,DistressFlatReduction) VALUES
('BUILDING_CEREMONIAL_BURIAL_NEEDS_DUMMY','BUILDINGCLASS_CEREMONIAL_BURIAL_NEEDS_DUMMY','TXT_KEY_BUILDING_CEREMONIAL_BURIAL_NEEDS_DUMMY',-1,-1,1,-1,0,1,1,2);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_CEREMONIAL_BURIAL_NEEDS_DUMMY','Holy Needs Dummy Building');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_CEREMONIAL_BURIAL_NEEDS_CHOICE_1','CITY_EVENT_CEREMONIAL_BURIAL_NEEDS');

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,GrowthMod,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_CEREMONIAL_BURIAL_NEEDS_CHOICE_1','TXT_KEY_CEREMONIAL_BURIAL_NEEDS_CHOICE_1_DESCRIPTION','TXT_KEY_CEREMONIAL_BURIAL_NEEDS_CHOICE_1_DESCRIPTION','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_CEREMONIAL_BURIAL_NEEDS_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CEREMONIAL_BURIAL_NEEDS_CHOICE_1_DESCRIPTION', 'Religious Bonus');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CEREMONIAL_BURIAL_NEEDS_CHOICE_1_HELP', 'Unhappiness from Distress has been reduced by 2 in {3_CityName}.');
--------------------------------------------------------------------------------------------------
-- End triggered event
--------------------------------------------------------------------------------------------------