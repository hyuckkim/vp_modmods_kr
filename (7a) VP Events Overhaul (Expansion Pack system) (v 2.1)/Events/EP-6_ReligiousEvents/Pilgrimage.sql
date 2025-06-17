-- PILGRIMAGE --
--
-- Belief = BELIEF_PILGRIMAGE
-- PILGRIMAGE (for events) = 	 (e.g. 'APOSTOLIC_TRADITION')
-- Dummy Policy Name =			POLICY_PILGRIMAGE_DUMMY (e.g. 'POLICY_PAPAL_PRIMACY_DUMMY')
-- Event Promtion = 			'PROMOTION_RELIGION_PILGRIMAGE'
--------------------------------------------------------------------------------------------------

INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_PILGRIMAGE','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_DESCRIPTION','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',10,1,'false','false','false','true',30,7,0,0,NULL,NULL,NULL,'false','false',NULL,0,'false','POLICY_PILGRIMAGE_DUMMY',NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'true',NULL,NULL,'false','false','false','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_PILGRIMAGE_CHOICE_1','PLAYER_EVENT_PILGRIMAGE'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_2','PLAYER_EVENT_PILGRIMAGE'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_3','PLAYER_EVENT_PILGRIMAGE'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_4','PLAYER_EVENT_PILGRIMAGE'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_5','PLAYER_EVENT_PILGRIMAGE'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_6','PLAYER_EVENT_PILGRIMAGE');

INSERT INTO Event_MinimumStartYield (EventType,YieldType,Yield) VALUES 
('PLAYER_EVENT_PILGRIMAGE','YIELD_FAITH',200);

--------------------------------------------------------------------------------------------------
-- Dummy Building for Bonus per Pop 
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_PILGRIMAGE_POPYIELD_DUMMY','BUILDING_PILGRIMAGE_POPYIELD_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune) VALUES
('BUILDING_PILGRIMAGE_POPYIELD_DUMMY','BUILDINGCLASS_PILGRIMAGE_POPYIELD_DUMMY','TXT_KEY_BUILDING_PILGRIMAGE_POPYIELD_DUMMY',-1,-1,1,-1,0,1,1);

INSERT INTO Building_YieldChangesPerPop (BuildingType,YieldType,Yield) VALUES
('BUILDING_PILGRIMAGE_POPYIELD_DUMMY','YIELD_PRODUCTION',20);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_PILGRIMAGE_POPYIELD_DUMMY','[ICON_PEACE] Pilgrimage PopYields Dummy');
--------------------------------------------------------------------------------------------------
-- Bonus Dummy Building - Adjust as necessary
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_PILGRIMAGE_BONUS1_DUMMY','BUILDING_PILGRIMAGE_BONUS1_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,NumTradeRouteBonus) VALUES
('BUILDING_PILGRIMAGE_BONUS1_DUMMY','BUILDINGCLASS_PILGRIMAGE_BONUS1_DUMMY','TXT_KEY_BUILDING_PILGRIMAGE_BONUS1_DUMMY',-1,-1,1,-1,0,1,1,2);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_PILGRIMAGE_BONUS1_DUMMY','[ICON_PEACE] Pilgrimage Bonus Feature Dummy');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------

INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_PILGRIMAGE_CHOICE_0','TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_DESCRIPTION','TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','false',30,'true',25,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_PILGRIMAGE_CHOICE_1','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_1_DESCRIPTION','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_1_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_TEMPLE',NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_PILGRIMAGE_CHOICE_2','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_2_DESCRIPTION','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_2_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false','IMPROVEMENT_HOLY_SITE',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_PILGRIMAGE_CHOICE_3','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_3_DESCRIPTION','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_3_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'true','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,'PROMOTION_RELIGION_PILGRIMAGE',NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_PILGRIMAGE_CHOICE_4','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_4_DESCRIPTION','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_4_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_APOSTOLIC_PALACE',NULL,'false','false','false','false',NULL,NULL,NULL,'BUILDINGCLASS_PILGRIMAGE_POPYIELD_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_PILGRIMAGE_CHOICE_5','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_5_DESCRIPTION','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_5_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','true','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_PILGRIMAGE_CHOICE_6','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_6_DESCRIPTION','TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_6_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','true','false',NULL,NULL,NULL,'BUILDINGCLASS_PILGRIMAGE_BONUS1_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);

INSERT INTO EventChoice_EventLinks(EventChoiceType,Event,EventChoiceLinker,CityEvent,CityEventChoice,CheckKnownPlayers,CheckForActive) VALUES
('PLAYER_EVENT_PILGRIMAGE_CHOICE_2',NULL,'PLAYER_EVENT_PILGRIMAGE_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_3',NULL,'PLAYER_EVENT_PILGRIMAGE_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_4',NULL,'PLAYER_EVENT_PILGRIMAGE_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_5',NULL,'PLAYER_EVENT_PILGRIMAGE_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_6',NULL,'PLAYER_EVENT_PILGRIMAGE_CHOICE_2',NULL,NULL,'false','true'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_6',NULL,'PLAYER_EVENT_PILGRIMAGE_CHOICE_3',NULL,NULL,'false','true'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_6',NULL,'PLAYER_EVENT_PILGRIMAGE_CHOICE_4',NULL,NULL,'false','true'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_6',NULL,'PLAYER_EVENT_PILGRIMAGE_CHOICE_5',NULL,NULL,'false','true');

INSERT INTO EventChoice_EventCostYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_PILGRIMAGE_CHOICE_1','YIELD_FAITH',100),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_2','YIELD_FAITH',300),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_3','YIELD_CULTURE',200),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_3','YIELD_SCIENCE',200),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_4','YIELD_PRODUCTION',200);

--------------------------------------------------------------------------------------------------
-- Temple Yield Change from Choice 1 - Adjust Yields as appropriate
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_BuildingClassYieldChange (EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_PILGRIMAGE_CHOICE_1','BUILDINGCLASS_TEMPLE','YIELD_GOLDEN_AGE_POINTS',4); 

--------------------------------------------------------------------------------------------------
-- Specialist Yield Change from Choice 5 - Adjust Yields, Delete if not applicable
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_SpecialistYieldChange(EventChoiceType,SpecialistType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_PILGRIMAGE_CHOICE_5','SPECIALIST_CIVIL_SERVANT','YIELD_FAITH',2),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_5','SPECIALIST_CIVIL_SERVANT','YIELD_GOLDEN_AGE_POINTS',2);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID) VALUES
('PLAYER_EVENT_PILGRIMAGE_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_PILGRIMAGE_CHOICE_1','TXT_KEY_NOTIFICATION_EVENT_PILGRIMAGE_CHOICE_1_S','true','true'),
('PLAYER_EVENT_PILGRIMAGE_CHOICE_6','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_PILGRIMAGE_CHOICE_6','TXT_KEY_NOTIFICATION_EVENT_PILGRIMAGE_CHOICE_6_S','true','true');

--------------------------------------------------------------------------------------------------
-- 'No Thanks' event choice setup
--------------------------------------------------------------------------------------------------
INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_PILGRIMAGE_CHOICE_0','PLAYER_EVENT_PILGRIMAGE');

INSERT INTO EventChoice_EventCostYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_PILGRIMAGE_CHOICE_0','YIELD_FAITH',50);

INSERT INTO EventChoice_InstantYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_PILGRIMAGE_CHOICE_0','YIELD_GOLDEN_AGE_POINTS',400);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID) VALUES
('PLAYER_EVENT_PILGRIMAGE_CHOICE_0','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0','TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0_S','false','false');

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_DESCRIPTION', 'On Earth As It Is In Heaven');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_HELP', 'When God came to Earth he took apostles to be his witnesses. Now he has returned to Heaven, and left their legacy to guide us in his stead. Our holy men are guided by the recording of his life and works on Earth, but the record is incomplete. They call it the Lost Gospel. [NEWLINE][NEWLINE]If we were to recover this artifact, it would solidify the foundations of our faith such that none would question us ever again!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_1_DESCRIPTION', 'Where do we even begin? We need to study the ancient records, and find out everything we can about the life of this apostle!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_1_HELP', 'Invoke {1_YieldCost} of new doctrine, causing your Temples to generate +4 [ICON_GOLDEN_AGE] Golden Age Points.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_PILGRIMAGE_CHOICE_1', '{3_PlayerName}''s religious men and women begin scouring ancient texts for clues to the secrets of Pilgrimage.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_PILGRIMAGE_CHOICE_1_S', '{3_PlayerName} begins on the quest of Pilgrimage.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_2_DESCRIPTION', 'Study into the central tenets of our belief have emphasised the practices of a virtuous life. [NEWLINE]When all live together in harmony, as He showed us, there is nothing we cannot achieve!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_2_HELP', 'Invoke an additional {1_YieldCost} of new doctrines of virtuous living, reducing [ICON_HAPPINESS_3] Unhappiness by 2 from Poverty in the Holy City.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_3_DESCRIPTION', 'The search for the Lost Gospel continues, but we are beseiged by enemies on every side. We must win the battle to maintain progress');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_3_HELP', 'Melee, Gun, Archer, and Siege Units gain the Mastery promotion, resulting in bonus experience from kills.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_4_DESCRIPTION', 'Finally, success! A old tomb, buried by rockfall, has been uncovered. Inside were scrolls and trinkets that seem to have belonged to the lost apostle! Among them, secrets for a more productive life!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_4_HELP', 'Reveal {1_YieldCost} worth of religious mysteries. As a result, all Cities gain +1 [ICON_PRODUCTION] Production for every 5 [ICON_CITIZEN] Citizens.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_5_DESCRIPTION', 'The scrolls are extensive. In order to transcribe all of them would take our priests an enormous amount of time. Perhaps we can find a more efficient way using our sophisticated infrastructure...');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_5_HELP', 'In the final stage of the quest for the book, all [ICON_DIPLOMAT] Civil Servants generate +2 [ICON_PEACE] Faith and +2 [ICON_GOLDEN_AGE] Golden Age Points.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_6_DESCRIPTION', 'Our efforts have finally been rewarded. The Lost Gospel was recovered, still miraculously whole. From it we will complete our understanding of God''s example to us on Earth, and perhaps make the Empire that little bit more like Heaven!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_PILGRIMAGE_CHOICE_6_HELP', 'The fame resulting from the recovery of the Lost Gospel earns you +2 additional trade routes.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_PILGRIMAGE_CHOICE_6', '{3_PlayerName} has recovered a Lost Gospel!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_PILGRIMAGE_CHOICE_6_S', '{3_PlayerName} completes the quest of Pilgrimage!');

--------------------------------------------------------------------------------------------------
-- The following is a city-event that triggers to force building construction in the Holy City
--------------------------------------------------------------------------------------------------
INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_PILGRIMAGE_NEEDS','EVENT_CLASS_NEUTRAL',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_EVENT_CHOICE',1000,0,'true','false','true',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'true','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_PILGRIMAGE_NEEDS',NULL,'PLAYER_EVENT_PILGRIMAGE_CHOICE_2',NULL,NULL,'false','false','true');

--------------------------------------------------------------------------------------------------
-- Dummy Building for Needs reduction in Holy City
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_PILGRIMAGE_NEEDS_DUMMY','BUILDING_PILGRIMAGE_NEEDS_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,PovertyFlatReduction) VALUES
('BUILDING_PILGRIMAGE_NEEDS_DUMMY','BUILDINGCLASS_PILGRIMAGE_NEEDS_DUMMY','TXT_KEY_BUILDING_PILGRIMAGE_NEEDS_DUMMY',-1,-1,1,-1,0,1,1,2);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_PILGRIMAGE_NEEDS_DUMMY','Holy Needs Dummy Building');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_PILGRIMAGE_NEEDS_CHOICE_1','CITY_EVENT_PILGRIMAGE_NEEDS');

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,GrowthMod,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_PILGRIMAGE_NEEDS_CHOICE_1','TXT_KEY_PILGRIMAGE_NEEDS_CHOICE_1_DESCRIPTION','TXT_KEY_PILGRIMAGE_NEEDS_CHOICE_1_DESCRIPTION','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_PILGRIMAGE_NEEDS_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PILGRIMAGE_NEEDS_CHOICE_1_DESCRIPTION', 'Religious Bonus');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PILGRIMAGE_NEEDS_CHOICE_1_HELP', 'Unhappiness from Poverty has been reduced by 2 in {3_CityName}.');
--------------------------------------------------------------------------------------------------
-- End triggered event
--------------------------------------------------------------------------------------------------