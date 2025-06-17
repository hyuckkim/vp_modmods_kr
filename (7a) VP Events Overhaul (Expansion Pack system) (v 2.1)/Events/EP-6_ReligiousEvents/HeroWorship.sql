-- HERO_WORSHIP --
--
-- Belief = BELIEF_INTERFAITH_DIALOGUE
-- ReligionName (for events) = 	HERO_WORSHIP (e.g. 'APOSTOLIC_TRADITION')
-- Dummy Policy Name =			POLICY_INTERFAITH_DIALOGUE_DUMMY (e.g. 'POLICY_PAPAL_PRIMACY_DUMMY')
-- Event Promtion = 			PROMOTION_RELIGION_HERO_WORSHIP
--------------------------------------------------------------------------------------------------

INSERT INTO Events(Type,EventClass,Description,Help,EventArt,EventAudio,RandomChance,RandomChanceDelta,IsOneShot,IgnoresGlobalCooldown,Global,EraScaling,EventCooldown,NumChoices,MinimumNationalPopulation,MinimumNumberCities,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,MinimumNumCoastalCities,LessThanMaximumTradeRoutes,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone) VALUES 

('PLAYER_EVENT_HERO_WORSHIP','EVENT_CLASS_GOOD','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_DESCRIPTION','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_HELP',NULL,'AS2D_INTERFACE_BORDERS_EXPAND',10,1,'false','false','false','true',30,7,0,0,NULL,NULL,NULL,'false','false',NULL,0,'false','POLICY_INTERFAITH_DIALOGUE_DUMMY',NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'true',NULL,NULL,'false','false','false','false','false','false','false');

INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_1','PLAYER_EVENT_HERO_WORSHIP'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_2','PLAYER_EVENT_HERO_WORSHIP'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_3','PLAYER_EVENT_HERO_WORSHIP'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_4','PLAYER_EVENT_HERO_WORSHIP'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_5','PLAYER_EVENT_HERO_WORSHIP'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_6','PLAYER_EVENT_HERO_WORSHIP');

INSERT INTO Event_MinimumStartYield (EventType,YieldType,Yield) VALUES 
('PLAYER_EVENT_HERO_WORSHIP','YIELD_FAITH',200);

--------------------------------------------------------------------------------------------------
-- Dummy Building for Bonus per Pop - Update Building_YieldChangesPerPop
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_HERO_WORSHIP_POPYIELD_DUMMY','BUILDING_HERO_WORSHIP_POPYIELD_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune) VALUES
('BUILDING_HERO_WORSHIP_POPYIELD_DUMMY','BUILDINGCLASS_HERO_WORSHIP_POPYIELD_DUMMY','TXT_KEY_BUILDING_HERO_WORSHIP_POPYIELD_DUMMY',-1,-1,1,-1,0,1,1);

INSERT INTO Building_YieldChangesPerPop (BuildingType,YieldType,Yield) VALUES
('BUILDING_HERO_WORSHIP_POPYIELD_DUMMY','YIELD_GOLD',40);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_HERO_WORSHIP_POPYIELD_DUMMY','[ICON_PEACE] HeroWorship PopYields Dummy');
--------------------------------------------------------------------------------------------------
-- Bonus Dummy Building - Adjust as necessary
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_HERO_WORSHIP_BONUS1_DUMMY','BUILDING_HERO_WORSHIP_BONUS1_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,ExtraLeagueVotes) VALUES
('BUILDING_HERO_WORSHIP_BONUS1_DUMMY','BUILDINGCLASS_HERO_WORSHIP_BONUS1_DUMMY','TXT_KEY_BUILDING_HERO_WORSHIP_BONUS1_DUMMY',-1,-1,1,-1,0,1,1,2);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_HERO_WORSHIP_BONUS1_DUMMY','[ICON_PEACE] HeroWorship Bonus Feature Dummy');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,IsOneShot,EventDuration,EraScaling,EventChance,Expires,MinimumNationalPopulation,MinimumNumberCities,MinimumNumCoastalCities,AffectsCoastalCitiesOnly,LessThanMaximumTradeRoutes,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,ImprovementAnywhereRequired,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,UnitClassRequired,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredAnywhereBuildingClass,RequiredNowhereBuildingClass,RequiresHolyCity,RequiresIdeology,CapitalEffectOnly,YieldBonusAllCities,EventPolicy,EventPromotion,EventTech,EventBuildingClassGlobal,EventFreePolicies,FreeGreatPeople,GoldenAgeTurns,WLTKDTurns,ResistanceTurns,PlayerHappiness,HappinessPerCity,RandomBarbarianSpawn,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,BasicNeedsMedianModifierGlobal,GoldMedianModifierGlobal,ScienceMedianModifierGlobal,CultureMedianModifierGlobal,ReligiousUnrestModifierGlobal) VALUES 

('PLAYER_EVENT_HERO_WORSHIP_CHOICE_0','TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_DESCRIPTION','TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','false',30,'true',25,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_HERO_WORSHIP_CHOICE_1','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_1_DESCRIPTION','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_1_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','false',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_TEMPLE',NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_HERO_WORSHIP_CHOICE_2','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_2_DESCRIPTION','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_2_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false','IMPROVEMENT_HOLY_SITE',NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

('PLAYER_EVENT_HERO_WORSHIP_CHOICE_3','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_3_DESCRIPTION','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_3_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'true','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','false','false',NULL,'PROMOTION_RELIGION_HERO_WORSHIP',NULL,NULL,0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate reformation builidng
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_4','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_4_DESCRIPTION','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_4_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'true',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_GREAT_ALTAR',NULL,'false','false','false','false',NULL,NULL,NULL,'BUILDINGCLASS_HERO_WORSHIP_POPYIELD_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate Spy dummy building from setup or delete spy building AND capital only effect
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_5','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_5_DESCRIPTION','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_5_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','true','true','false',NULL,NULL,NULL,'BUILDINGCLASS_RELIGION_FREESPY_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- Add appropriate bonus dummy building. If not needed, delete building AND capital only effect
--------------------------------------------------------------------------------------------------
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_6','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_6_DESCRIPTION','TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_6_HELP','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE','true',30,'false',0,'false',0,0,0,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','true','false',NULL,NULL,NULL,'BUILDINGCLASS_HERO_WORSHIP_BONUS1_DUMMY',0,0,0,0,0,0,0,0,0,'false','false','false','false','false',0,0,0,0,0);

INSERT INTO EventChoice_EventLinks(EventChoiceType,Event,EventChoiceLinker,CityEvent,CityEventChoice,CheckKnownPlayers,CheckForActive) VALUES
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_2',NULL,'PLAYER_EVENT_HERO_WORSHIP_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_3',NULL,'PLAYER_EVENT_HERO_WORSHIP_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_4',NULL,'PLAYER_EVENT_HERO_WORSHIP_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_5',NULL,'PLAYER_EVENT_HERO_WORSHIP_CHOICE_1',NULL,NULL,'false','true'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_6',NULL,'PLAYER_EVENT_HERO_WORSHIP_CHOICE_2',NULL,NULL,'false','true'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_6',NULL,'PLAYER_EVENT_HERO_WORSHIP_CHOICE_3',NULL,NULL,'false','true'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_6',NULL,'PLAYER_EVENT_HERO_WORSHIP_CHOICE_4',NULL,NULL,'false','true'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_6',NULL,'PLAYER_EVENT_HERO_WORSHIP_CHOICE_5',NULL,NULL,'false','true');

--------------------------------------------------------------------------------------------------
-- Event Yield Costs - Adjust Yields for Choice 4 as appropriate
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_EventCostYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_1','YIELD_FAITH',100),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_2','YIELD_FAITH',300),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_3','YIELD_CULTURE',200),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_3','YIELD_SCIENCE',200),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_4','YIELD_GOLD',400);

--------------------------------------------------------------------------------------------------
-- Temple Yield Change from Choice 1 - Adjust Yields as appropriate
--------------------------------------------------------------------------------------------------
INSERT INTO EventChoice_BuildingClassYieldChange (EventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_1','BUILDINGCLASS_TEMPLE','YIELD_PRODUCTION',2); 

--------------------------------------------------------------------------------------------------
-- Specialist Yield Change from Choice 5 - Adjust Yields, Delete if not applicable
--------------------------------------------------------------------------------------------------
--INSERT INTO EventChoice_SpecialistYieldChange(EventChoiceType,SpecialistType,YieldType,YieldChange) VALUES
--('PLAYER_EVENT_HERO_WORSHIP_CHOICE_5','SPECIALIST_CIVIL_SERVANT','YIELD_FAITH',2),
--('PLAYER_EVENT_HERO_WORSHIP_CHOICE_5','SPECIALIST_CIVIL_SERVANT','YIELD_GOLDEN_AGE_POINTS',2);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID) VALUES
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_1','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_HERO_WORSHIP_CHOICE_1','TXT_KEY_NOTIFICATION_EVENT_HERO_WORSHIP_CHOICE_1_S','true','true'),
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_6','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_HERO_WORSHIP_CHOICE_6','TXT_KEY_NOTIFICATION_EVENT_HERO_WORSHIP_CHOICE_6_S','true','true');

--------------------------------------------------------------------------------------------------
-- 'No Thanks' event choice setup
--------------------------------------------------------------------------------------------------
INSERT INTO Event_ParentEvents(EventChoiceType,EventType) VALUES
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_0','PLAYER_EVENT_HERO_WORSHIP');

INSERT INTO EventChoice_EventCostYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_0','YIELD_FAITH',50);

INSERT INTO EventChoice_InstantYield (EventChoiceType,YieldType,Yield) VALUES 
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_0','YIELD_PRODUCTION',200);

INSERT INTO EventChoice_Notification(EventChoiceType,NotificationType,Description,ShortDescription,IsWorldEvent,NeedPlayerID) VALUES
('PLAYER_EVENT_HERO_WORSHIP_CHOICE_0','NOTIFICATION_GENERIC','TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0','TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0_S','false','false');

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_DESCRIPTION', 'A pure soul');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_HELP', 'Only with great effort do the cogs of the divine world continue to turn. Only with great power... and the power is in the blood. Uncountable multitudes have yet to give their lives to sate the thirst of creation.[NEWLINE][NEWLINE]Unless... unless we can find the chosen one. One pure soul, to die the final death and break the cycle.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_1_DESCRIPTION', 'Where would we even find such a person? Surely we must, in fact, manufacture them. We must bring up our children, and our childrens'' children, to be perfect examples of humanity. We must continue until a totally pure soul is born. And then... we cut out their heart!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_1_HELP', 'Invoke {1_YieldCost} of new doctrine, causing your Temples to generate +1 [ICON_PRODUCTION] Production.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_HERO_WORSHIP_CHOICE_1', 'Under {3_PlayerName}''s direction, the people of {1_CivShortDescription} work towards birthing a person of total purity!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_HERO_WORSHIP_CHOICE_1_S', '{3_PlayerName} begins on the quest of Hero Worship.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_2_DESCRIPTION', 'With our population becoming more and more pious, sacrifices are becoming more difficult to come by*[NEWLINE]The blood must flow. In a country where there is so much purity, the punishment for even the most menial crime... must be death.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_2_HELP', 'Authorize the sacrifice of prisoners and criminals with {1_YieldCost} in your Holy City. As a result, local [ICON_HAPPINESS_3] Unhappiness from Specialists is reduced by 2.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_3_DESCRIPTION', 'We grow as a people yet. The auguers believe that we are getting very close to witnessing the birth of the Chosen One.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_3_HELP', 'Integrate {1_YieldCost} of new doctrine into your military, granting Melee and Gun Units [ICON_GOLDEN_AGE] Golden Age points for each kill they make.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_4_DESCRIPTION', 'The Universe is pleased with us. Our priests grow powerful, and we are able to accomplish feats unheard of in the dreary and distant past!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_4_HELP', 'Begin the empowerment of citizens with {1_YieldCost}. The Great Altar increases [ICON_GOLD] Gold by +4 for every 10 [ICON_CITIZEN] Citizens across the Empire.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_5_DESCRIPTION', 'The auguers say the time is now. Somewhere in the kingdom, the Pure One will soon come into being. No doubt those who meet them will instantly recognise the destiny within them, perhaps even try to keep them from us. We will not be denied.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_5_HELP', 'Scouring the world for the Chosen One, receive extra [ICON_SPY] Spies.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_6_DESCRIPTION', 'It is done. Do you feel the calm? As if the burden of all these years has suddenly been lifted, such that it may have never been there at all. Our future is secured, we can fight and die in the knowledge that our souls'' salvation is finally secure.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PLAYER_EVENT_HERO_WORSHIP_CHOICE_6_HELP', 'The calm can be felt worldwide. As a result, you gain +2 [ICON_CSD_CIVIL_SERVANT] Delegates in the World Congress.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_HERO_WORSHIP_CHOICE_6', '{3_PlayerName} personally cuts out the heart of the Chosen One, fulfilling the prophecy central to their religion!');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_NOTIFICATION_EVENT_HERO_WORSHIP_CHOICE_6_S', '{3_PlayerName} continues on the quest of Hero Worship.');

--------------------------------------------------------------------------------------------------
-- The following is a city-event that triggers to force building construction in the Holy City
--------------------------------------------------------------------------------------------------
INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_HERO_WORSHIP_NEEDS','EVENT_CLASS_NEUTRAL',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_EVENT_CHOICE',1000,0,'true','false','true',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'true','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_HERO_WORSHIP_NEEDS',NULL,'PLAYER_EVENT_HERO_WORSHIP_CHOICE_2',NULL,NULL,'false','false','true');

--------------------------------------------------------------------------------------------------
-- Dummy Building for Needs reduction in Holy City - Delete the unneccessary inserts
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_HERO_WORSHIP_NEEDS_DUMMY','BUILDING_HERO_WORSHIP_NEEDS_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,NoUnhappfromXSpecialists) VALUES
('BUILDING_HERO_WORSHIP_NEEDS_DUMMY','BUILDINGCLASS_HERO_WORSHIP_NEEDS_DUMMY','TXT_KEY_BUILDING_HERO_WORSHIP_NEEDS_DUMMY',-1,-1,1,-1,0,1,1,2);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_HERO_WORSHIP_NEEDS_DUMMY','Holy Needs Dummy Building');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_HERO_WORSHIP_NEEDS_CHOICE_1','CITY_EVENT_HERO_WORSHIP_NEEDS');

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,GrowthMod,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_HERO_WORSHIP_NEEDS_CHOICE_1','TXT_KEY_HERO_WORSHIP_NEEDS_CHOICE_1_DESCRIPTION','TXT_KEY_HERO_WORSHIP_NEEDS_CHOICE_1_DESCRIPTION','TXT_KEY_EVENT_RELIGION_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_HERO_WORSHIP_NEEDS_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_HERO_WORSHIP_NEEDS_CHOICE_1_DESCRIPTION', 'Religious Bonus');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_HERO_WORSHIP_NEEDS_CHOICE_1_HELP', 'Unhappiness from Specialists has been reduced by 2 in {3_CityName}.');
--------------------------------------------------------------------------------------------------
-- End triggered event
--------------------------------------------------------------------------------------------------