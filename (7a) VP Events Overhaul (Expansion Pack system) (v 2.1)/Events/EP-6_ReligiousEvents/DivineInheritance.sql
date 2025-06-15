-- DIVINE_INHERITANCE --
--
-- Belief = BELIEF_PEACE_LOVING
-- ReligionName (for events) = 	DIVINE_INHERITANCE (e.g. 'APOSTOLIC_TRADITION')
-- Dummy Policy Name =			POLICY_PEACE_LOVING_DUMMY (e.g. 'POLICY_PAPAL_PRIMACY_DUMMY')
-- Event Promtion = 			PROMOTION_RELIGION_DIVINE_INHERITANCE
--------------------------------------------------------------------------------------------------

INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_DIVINE_INHERITANCE','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_DESCRIPTION','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',10,1,'false','false','false','true',30,7,0,0,NULL,NULL,NULL,'false','false',NULL,0,'false','POLICY_PEACE_LOVING_DUMMY',NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'true',NULL,NULL,'false','false','false','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1','PLAYER_EVENT_DIVINE_INHERITANCE'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_2','PLAYER_EVENT_DIVINE_INHERITANCE'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_3','PLAYER_EVENT_DIVINE_INHERITANCE'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_4','PLAYER_EVENT_DIVINE_INHERITANCE'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_5','PLAYER_EVENT_DIVINE_INHERITANCE'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6','PLAYER_EVENT_DIVINE_INHERITANCE');

INSERT INTO Event_MinimumStartYield (EventType,YieldType,Yield) VALUES 
('PLAYER_EVENT_DIVINE_INHERITANCE','YIELD_FAITH',200);

--------------------------------------------------------------------------------------------------
-- Dummy Building for Bonus per Pop - Update Building_YieldChangesPerPop
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_DIVINE_INHERITANCE_POPYIELD_DUMMY','BUILDING_DIVINE_INHERITANCE_POPYIELD_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune) VALUES
('BUILDING_DIVINE_INHERITANCE_POPYIELD_DUMMY','BUILDINGCLASS_DIVINE_INHERITANCE_POPYIELD_DUMMY','TXT_KEY_BUILDING_DIVINE_INHERITANCE_POPYIELD_DUMMY',-1,-1,1,-1,0,1,1);

INSERT INTO Building_YieldChangesPerPop (BuildingType,YieldType,Yield) VALUES
('BUILDING_DIVINE_INHERITANCE_POPYIELD_DUMMY','YIELD_FOOD',20);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_DIVINE_INHERITANCE_POPYIELD_DUMMY','[ICON_PEACE] DivineInheritance PopYields Dummy');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_0','TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_DESCRIPTION','TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','false',30,'true',25,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1_DESCRIPTION','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_TEMPLE',NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_2','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_2_DESCRIPTION','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_2_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false','IMPROVEMENT_HOLY_SITE',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_3','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_3_DESCRIPTION','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_3_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'true','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,'PROMOTION_RELIGION_DIVINE_INHERITANCE',NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate reformation builidng
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_4','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_4_DESCRIPTION','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_4_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_HEAVENLY_THRONE',NULL,'false','false','false','false',NULL,NULL,NULL,'BUILDINGCLASS_DIVINE_INHERITANCE_POPYIELD_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate Spy dummy building from setup or delete spy building AND capital only effect
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_5','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_5_DESCRIPTION','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_5_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','true','true','false',NULL,NULL,NULL,'BUILDINGCLASS_RELIGION_GOODSPY_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate bonus dummy building. If not needed, delete building AND capital only effect
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6_DESCRIPTION','TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);

INSERT INTO EventChoice_EventLinks(EventChoiceType,Event,EventChoiceLinker,CityEvent,CityEventChoice,CheckKnownPlayers,CheckForActive) VALUES
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_2',NULL,'PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_3',NULL,'PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_4',NULL,'PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_5',NULL,'PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6',NULL,'PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_2',NULL,NULL,'false','true'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6',NULL,'PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_3',NULL,NULL,'false','true'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6',NULL,'PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_4',NULL,NULL,'false','true'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6',NULL,'PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_5',NULL,NULL,'false','true');

--------------------------------------------------------------------------------------------------
-- Event Yield Costs - Adjust Yields for Choice 4 as appropriate
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_EventCostYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1','YIELD_FAITH',100),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_2','YIELD_FAITH',300),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_3','YIELD_CULTURE',200),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_3','YIELD_SCIENCE',200),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_4','YIELD_FOOD',200);

--------------------------------------------------------------------------------------------------
-- Temple Yield Change from Choice 1 - Adjust Yields as appropriate
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_BuildingClassYieldChange (EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1','BUILDINGCLASS_TEMPLE','YIELD_GOLDEN_AGE_POINTS',4),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6','BUILDINGCLASS_HEAVENLY_THRONE','YIELD_FOOD',10),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6','BUILDINGCLASS_HEAVENLY_THRONE','YIELD_PRODUCTION',10),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6','BUILDINGCLASS_HEAVENLY_THRONE','YIELD_SCIENCE',10),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6','BUILDINGCLASS_HEAVENLY_THRONE','YIELD_CULTURE',10),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6','BUILDINGCLASS_HEAVENLY_THRONE','YIELD_GOLD',10),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6','BUILDINGCLASS_HEAVENLY_THRONE','YIELD_GOLDEN_AGE_POINTS',10),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6','BUILDINGCLASS_HEAVENLY_THRONE','YIELD_FAITH',10),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6','BUILDINGCLASS_HEAVENLY_THRONE','YIELD_TOURISM',10); 

--------------------------------------------------------------------------------------------------
-- Specialist Yield Change from Choice 5 - Adjust Yields, Delete if not applicable
--------------------------------------------------------------------------------------------------
--INSERT INTO EventChoice_SpecialistYieldChange(EventChoiceType,SpecialistType,YieldType,YieldChange) VALUES
--('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_5','SPECIALIST_CIVIL_SERVANT','YIELD_FAITH',2),
--('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_5','SPECIALIST_CIVIL_SERVANT','YIELD_GOLDEN_AGE_POINTS',2);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID) VALUES
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_DIVINE_INHERITANCE_CHOICE_1','TXT_KEY_NOTIFICATION_EVENT_DIVINE_INHERITANCE_CHOICE_1_S','true','true'),
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_DIVINE_INHERITANCE_CHOICE_6','TXT_KEY_NOTIFICATION_EVENT_DIVINE_INHERITANCE_CHOICE_6_S','true','true');

--------------------------------------------------------------------------------------------------
-- 'No Thanks' event choice setup
--------------------------------------------------------------------------------------------------
INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_0','PLAYER_EVENT_DIVINE_INHERITANCE');

INSERT INTO EventChoice_EventCostYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_0','YIELD_FAITH',50);

INSERT INTO EventChoice_InstantYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_0','YIELD_GOLDEN_AGE_POINTS',400);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID) VALUES
('PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_0','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0','TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0_S','false','false');

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_DESCRIPTION', 'Elixir Of Life');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_HELP', 'In the early days of the Empire, a lowly Herbalist came to the Palace professing to have discovered the Elixir of Life - a potion that could render the drinker immortal. Not having need of it, and not wanting others to ascend to our status, we had the man executed.[NEWLINE][NEWLINE]Now there are rumours he has risen from the dead. This is unacceptable! This wraith must be found and sent back to the underworld!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1_DESCRIPTION', 'This is unlike any foe before, they are patient, they will strike us from the shadows, there is no way to hurt them. We must immediately turn the people against them, or all is lost!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_1_HELP', 'Invoke {1_YieldCost} of new doctrine, causing your Temples to generate +4 [ICON_GOLDEN_AGE] Golden Age Points.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_DIVINE_INHERITANCE_CHOICE_1', '{3_PlayerName}''s begins a campaign of propaganda against their ancient enemy, in the struggle for Divine Inheritance.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_DIVINE_INHERITANCE_CHOICE_1_S', '{3_PlayerName} begins on the quest of Divine Inheritance.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_2_DESCRIPTION', 'We must find this devil, how can he still be evading our grasp? See if we can find out how he achieved this!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_2_HELP', 'After committing {1_YieldCost} into the faith, the citizens of your Holy City adoptes new doctrine, reducing local [ICON_HAPPINESS_3] Unhappiness by 2 from Illiteracy.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_3_DESCRIPTION', 'The exaltation of the Celestial Throne has birthed a fanatical militia movement[NEWLINE]Incorporation of these zealots into the army will bring great honour to the Empire!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_3_HELP', 'Use {1_YieldCost} to gain near immortality. All Units receive the Blessed Promotion which allows them to heal an additional +5 HP in neutral and enemy lands.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_4_DESCRIPTION', 'At last, progress! The Herbalist''s most devoted servant is ours. Find out everything she knows, and then hang her above my throne. Let her grizzly fate strike fear into my enemies forever!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_4_HELP', 'Implement {1_YieldCost} worth of auspicious rituals. The Celestial Throne causes all Cities to gain +1 [ICON_FOOD] Food for every 5 [ICON_CITIZEN] Citizens.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_5_DESCRIPTION', 'Our foe is backed into a corner. The killing blow will soon be struck. Send out my best agents, bring him to me!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_5_HELP', 'To outwit your adversary, level up all your [ICON_SPY] Spies.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6_DESCRIPTION', 'To have the pleasure of executing this man myself was too much to hope for. It is been so long I did not in truth recognise the man, but it is no matter: for it was surely him. No one remains to contend my divinity!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_6_HELP', 'The people rejoice in your victory over the enemy. As a result, the Holy City gains +10 for all yields.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_DIVINE_INHERITANCE_CHOICE_6', '{3_PlayerName} executes his long term rival, securing the Divine Inheritance!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_DIVINE_INHERITANCE_CHOICE_6_S', '{3_PlayerName} completes the quest of Divine Inheritance');


--------------------------------------------------------------------------------------------------
-- The following is a city-event that triggers to force building construction in the Holy City
--------------------------------------------------------------------------------------------------
INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_DIVINE_INHERITANCE_NEEDS','EVENT_CLASS_NEUTRAL',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_EVENT_CHOICE',1000,0,'true','false','true',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'true','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_DIVINE_INHERITANCE_NEEDS',NULL,'PLAYER_EVENT_DIVINE_INHERITANCE_CHOICE_2',NULL,NULL,'false','false','true');

--------------------------------------------------------------------------------------------------
-- Dummy Building for Needs reduction in Holy City - Delete the unneccessary inserts
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_DIVINE_INHERITANCE_NEEDS_DUMMY','BUILDING_DIVINE_INHERITANCE_NEEDS_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,IlliteracyFlatReduction) VALUES
('BUILDING_DIVINE_INHERITANCE_NEEDS_DUMMY','BUILDINGCLASS_DIVINE_INHERITANCE_NEEDS_DUMMY','TXT_KEY_BUILDING_DIVINE_INHERITANCE_NEEDS_DUMMY',-1,-1,1,-1,0,1,1,2);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_DIVINE_INHERITANCE_NEEDS_DUMMY','Holy Needs Dummy Building');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_DIVINE_INHERITANCE_NEEDS_CHOICE_1','CITY_EVENT_DIVINE_INHERITANCE_NEEDS');

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,GrowthMod,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_DIVINE_INHERITANCE_NEEDS_CHOICE_1','TXT_KEY_DIVINE_INHERITANCE_NEEDS_CHOICE_1_DESCRIPTION','TXT_KEY_DIVINE_INHERITANCE_NEEDS_CHOICE_1_DESCRIPTION','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_DIVINE_INHERITANCE_NEEDS_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_DIVINE_INHERITANCE_NEEDS_CHOICE_1_DESCRIPTION', 'Religious Bonus');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_DIVINE_INHERITANCE_NEEDS_CHOICE_1_HELP', 'Unhappiness from Illiteracy has been reduced by 2 in {3_CityName}.');
--------------------------------------------------------------------------------------------------
-- End triggered event
--------------------------------------------------------------------------------------------------