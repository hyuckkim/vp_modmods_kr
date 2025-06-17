-- MT KILIMANJARO --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_MT_KILIMANJARO','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_KILIMANJARO',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_1','CITY_EVENT_NW_MT_KILIMANJARO'),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_2','CITY_EVENT_NW_MT_KILIMANJARO'),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3','CITY_EVENT_NW_MT_KILIMANJARO'),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_4','CITY_EVENT_NW_MT_KILIMANJARO');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_1','TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_1','TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_2','TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_2','TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_HORSEBACK_RIDING',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3','TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3','TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_COMPASS',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_4','TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_4','TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_FLIGHT',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3','false','false','true');

-- INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_1','FEATURE_KILIMANJARO','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_1','FEATURE_KILIMANJARO','YIELD_TOURISM',1),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_4','FEATURE_KILIMANJARO','YIELD_GOLD',10),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_4','FEATURE_KILIMANJARO','YIELD_TOURISM',5);

-- INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_2','RESOURCE_GEMS',1),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3','RESOURCE_GEMS',-1);

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3','UNIT_BANDEIRANTES',2) ;

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_2','FLAVOR_HAPPINESS',20),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3','FLAVOR_RECON',20),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3','FLAVOR_GOLD',10),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3','FLAVOR_CULTURE',10),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3','FLAVOR_HAPPINESS',-15),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_4','FLAVOR_GOLD',10),
('CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_4','FLAVOR_CULTURE',10);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_DESCRIPTION','I Bless the Rains');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_HELP','The National Park is honored to receive you, wise and powerful Leader. Perhaps we could walk by Kilimanjaro for this discussion. It is a lovely day for it.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_1', 'Kilimanjaro is so important to local peoples. The National Park wants permission to start a large ad campaign to tell everyone about its glories.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_1_HELP','I hear the drums echoing tonight. I know that I must do what''s right[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_2','Park officials are reporting that locals have discovered a rare and beautiful type of gemstone on the slopes of the mountain. They would like to enlist a group of people to look for more of these precious stones.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_2_HELP','We will be happy to provide some individuals as long as we get our share.[NEWLINE][NEWLINE]The Natural Wonder provides one copy of [ICON_RES_GEMS] Gems.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3','Word about the discovery of the gemstones has spread into the world. Unfortunately, the entire area is being overrun with treasure hunters. Park leadership is strongly suggesting that we prohibit any more prospecing.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_3_HELP','That''s unfortunate. I was hoping about getting a new crown.[NEWLINE][NEWLINE]The Natural Wonder loses one copy of [ICON_RES_GEMS] Gems; however, two Bandeirantes are recruited to continue exploration.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_4','The striking form of Kilimanjaro has seduced travelers from far and wide. Our Park Service is telling us that more and more, people are coming to experience Kilimanjaro. They would like to set up a permanent international excursion to the top of the Mountain.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_MT_KILIMANJARO_CHOICE_4_HELP','Sounds like a great idea. Save me a spot on the first trip to the top.[NEWLINE][NEWLINE]The Natural Wonder permanently gains +10 [ICON_GOLD] Gold and +5 [ICON_TOURISM] Tourism.');