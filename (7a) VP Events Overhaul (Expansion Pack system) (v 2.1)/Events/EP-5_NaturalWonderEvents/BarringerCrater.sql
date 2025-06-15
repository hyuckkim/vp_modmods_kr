-- BARRINGER CRATER --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_BARRINGER_CRATER','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','false','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_CRATER',NULL,NULL,'false','false','false','false','false','true','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_1','CITY_EVENT_NW_BARRINGER_CRATER'),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_2','CITY_EVENT_NW_BARRINGER_CRATER'),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_3','CITY_EVENT_NW_BARRINGER_CRATER'),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_4','CITY_EVENT_NW_BARRINGER_CRATER');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_1','TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_1','TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_2','TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_2','TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_GUILDS',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_3','TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_3','TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_3_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_GUNPOWDER',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_4','TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_4','TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_RADIO',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

-- INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES ;

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_3','false','true','true');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_3','YIELD_GOLD',200),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_4','YIELD_GOLD',200);

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_1','FEATURE_CRATER','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_1','FEATURE_CRATER','YIELD_TOURISM',1),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_3','FEATURE_CRATER','YIELD_SCIENCE',-3);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_2','IMPROVEMENT_TRADING_POST','YIELD_CULTURE',1),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_2','IMPROVEMENT_TRADING_POST','YIELD_GOLD',2),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_2','IMPROVEMENT_CUSTOMS_HOUSE','YIELD_CULTURE',1),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_2','IMPROVEMENT_CUSTOMS_HOUSE','YIELD_GOLD',2);

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_4','SPECIALIST_SCIENTIST','YIELD_SCIENCE',2);

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_3','RESOURCE_IRON',3);

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_2','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_2','FLAVOR_GOLD',20),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_3','FLAVOR_SCIENCE',20),
('CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_4','FLAVOR_SCIENCE',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_DESCRIPTION', 'Earthshattering Kaboom');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_HELP', 'Sir, a small mining company has bought up a bunch of land interests around the Crater. The owner, a Mr. Barringer has some proposals, and he would like your opinion on these various ideas.[NEWLINE][NEWLINE]He awaits you in the conference room.[NEWLINE]');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_1', 'This attention can only been good for our City. A new marketing campaign could bring renewed interest in the site.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_1_HELP', 'Get our tourism department on this as quickly as possible![NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_2', 'He is suggesting that the site could be a major attraction and would like permission to build a Visitor Center on the rim');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_2_HELP', 'Of course he has our permission! Let''s get those outside dollars into our local business.[NEWLINE][NEWLINE]Local towns and villages gain +1 [ICON_CULTURE] Culture and +2 [ICON_GOLD] Gold.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_3', 'Mr. Barringer thinks there might be valuable minerals in the crater. He would like your help in funding an exploratory survey of the area.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_3_HELP', 'He can have some funding but only if we can have a portion of anything that he finds.[NEWLINE][NEWLINE]After providing {1_YieldCost} to the company for initial surveys, you gain 3 new sources of [ICON_RES_IRON] Iron. Unfortunately, the mining operations cause major damage to the site, resulting in a loss of 3 [ICON_RESEARCH] Science at the Wonder.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_4', 'The mining company is happy to report that it has made some fascinating discoveries in the crater. He is asking for a small grant to do more research about the cause of the Crater.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_BARRINGER_CRATER_CHOICE_4_HELP', 'I hear they are finding meteorite fragments all over the area. One was more than 600 pounds! I want to know more.[NEWLINE][NEWLINE]With the {1_YieldCost} grant you have funded, local [ICON_VP_SCIENTIST] scientists now earn an additional +2 [ICON_RESEARCH] Science.');

