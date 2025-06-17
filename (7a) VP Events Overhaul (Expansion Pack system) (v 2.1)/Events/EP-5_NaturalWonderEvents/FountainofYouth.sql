-- Fountain of Youth --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_FOUNTAIN_YOUTH','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_FOUNTAIN_YOUTH',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_1','CITY_EVENT_NW_FOUNTAIN_YOUTH'),
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_2','CITY_EVENT_NW_FOUNTAIN_YOUTH'),
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_3','CITY_EVENT_NW_FOUNTAIN_YOUTH'),
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_4','CITY_EVENT_NW_FOUNTAIN_YOUTH');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

--------------------------------------------------------------------------------------------------
-- Dummy Building for Fountain of Youth Event 4
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_FOUNTAIN_YOUTH_DUMMY','BUILDING_FOUNTAIN_YOUTH_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas,FreePromotion) VALUES
('BUILDING_FOUNTAIN_YOUTH_DUMMY','BUILDINGCLASS_FOUNTAIN_YOUTH_DUMMY','TXT_KEY_BUILDING_FOUNTAIN_YOUTH_DUMMY','TXT_KEY_BUILDING_FOUNTAIN_YOUTH_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS','PROMOTION_EVERLASTING_YOUTH');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_FOUNTAIN_YOUTH_DUMMY','Healing Waters');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_FOUNTAIN_YOUTH_DUMMY_HELP','Grants Everlasting Youth promotion to all owned Units.');
--------------------------------------------------------------------------------------------------
-- End Dummy Building
--------------------------------------------------------------------------------------------------

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_1','TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_1','TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_2','TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_2','TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false','BUILDINGCLASS_AQUEDUCT',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_3','TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_3','TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_3_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,'ERA_MEDIEVAL','false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,-2,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_4','TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_4','TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_CHEMISTRY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_FOUNTAIN_YOUTH_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_3','false','true','true');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_3','YIELD_POPULATION',3),
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_4','YIELD_SCIENCE',200);

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_2','YIELD_FOOD',5);

-- INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_1','FEATURE_FOUNTAIN_YOUTH','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_1','FEATURE_FOUNTAIN_YOUTH','YIELD_TOURISM',1);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_2','IMPROVEMENT_FARM','YIELD_FOOD',1);

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

INSERT INTO CityEventChoice_ResourceQuantity(CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_3','RESOURCE_SUGAR',1);

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_2','FLAVOR_GROWTH',20),
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_3','FLAVOR_HAPPINESS',20),
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_4','FLAVOR_OFFENSE',20),
('CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_4','FLAVOR_DEFENSE',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_DESCRIPTION','A Cure For All Ills');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_HELP','Cloaked figures await you in the antechamber, Your Greatness. I think they wish to discuss... the Fountain.[NEWLINE]');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_1', 'Whether it''s really magic or all in their heads, they claim there is no doubt that the so-called ''Fountain of Youth'' has a noticeable effect on those who imbibe from its waters.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_1_HELP','Oh....a secret spy agency! We have to keep this quiet. *wink* [NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_2','The secret society would like to test a theory by distributing the well''s waters in... well, secret. They wish to roll the scheme out to farmland irrigation and see what could happen. What do you think?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_2_HELP','Our own diabolical plot...how fun![NEWLINE][NEWLINE]Local Farms gain +1 [ICON_FOOD] Food, and population growth is increased by 5%.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_3','To continue funding their ''research projects'', this agency wants to start growing sugar cane. Apparently, the local climate is perfect for it. Granted, they might need a little involuntary ''help'' from the local population.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_3_HELP','In for a penny...in for a pound. We can provide workers as long as we get some of the spoils.[NEWLINE][NEWLINE]The City provides 1 copy of [ICON_RES_SUGAR] Sugar at a ''mere'' cost of {1_YieldCost}. [ICON_HAPPINESS_3] Unhappiness permanently increases in the City by 2.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_4','These figures have revealed themselves to be a legitimate scientific agency who believe they can use the Fountain''s waters to heal all kinds of illness. With help from our own scientists, they believe they can probably speed this research up.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_FOUNTAIN_YOUTH_CHOICE_4_HELP','Oh wow...these guys really were a secret agency. Of course, I''m going to agree to this.[NEWLINE][NEWLINE]After spending {1_YieldCost} of the City''s own research, all of your owned Units now gain the Everlasting Youth promotion, granting them an additional 5 HP healing.');