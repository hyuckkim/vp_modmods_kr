-- SOLOMON'S MINES --

--------------------------------------------------------------------------------------------------
-- Events boost mines so guaranteeing mines near NW
--------------------------------------------------------------------------------------------------
UPDATE Natural_Wonder_Placement SET AdjacentTilesRequireHills="1" WHERE NaturalWonderType = 'FEATURE_SOLOMONS_MINES';
UPDATE Natural_Wonder_Placement SET RequiredNumberofAdjacentHills="2" WHERE NaturalWonderType = 'FEATURE_SOLOMONS_MINES';
UPDATE Natural_Wonder_Placement SET AdjacentTilesAvoidHills="0" WHERE NaturalWonderType = 'FEATURE_SOLOMONS_MINES';
UPDATE Natural_Wonder_Placement SET MaximumAllowedAdjacentHills="10" WHERE NaturalWonderType = 'FEATURE_SOLOMONS_MINES';

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_SOLOMONS_MINES','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_SOLOMONS_MINES',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false'),

('CITY_EVENT_NW_SOLOMONS_MINES_BAD','EVENT_CLASS_BAD',NULL,NULL,'badeventdefaultbackground.dds','AS2D_EVENT_NOTIFICATION_VERY_BAD',50,1,'false','true','false',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_SOLOMONS_MINES',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_1','CITY_EVENT_NW_SOLOMONS_MINES'),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_2','CITY_EVENT_NW_SOLOMONS_MINES'),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a','CITY_EVENT_NW_SOLOMONS_MINES'),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3b','CITY_EVENT_NW_SOLOMONS_MINES_BAD'),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_4','CITY_EVENT_NW_SOLOMONS_MINES');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_1','TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_1','TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','true',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_2','TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_2','TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_BRONZE_WORKING',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_FORGE',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

--------------------------------------------------------------------------------------------------
-- No immediate negative effect for selecting Event Choice 3.
-- Selecting Event Choice 3 eventually will result in a second City Event, this one bad.
-- Event Choice 4 cannot be selected until the later bad Event.
--------------------------------------------------------------------------------------------------

('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a','TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_GUILDS',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3b','TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3b_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','true',30,'true',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,5,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_4','TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_4','TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_ARCHAEOLOGY',NULL,'false',NULL,NULL,'false','BUILDINGCLASS_UNIVERSITY',NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_SOLOMONS_MINES_BAD',NULL,NULL,NULL,'CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a','false','true','true');

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3b','false','true','true');

INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_4','YIELD_GOLD',200);

INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3b','YIELD_CULTURE',-200);

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_4','BUILDINGCLASS_UNIVERSITY','YIELD_CULTURE',2);

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_1','FEATURE_SOLOMONS_MINES','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_1','FEATURE_SOLOMONS_MINES','YIELD_TOURISM',1),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_4','FEATURE_SOLOMONS_MINES','YIELD_TOURISM',3);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a','IMPROVEMENT_MINE','YIELD_CULTURE',1),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a','IMPROVEMENT_MINE','YIELD_GOLD',2),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a','IMPROVEMENT_MINE','YIELD_PRODUCTION',1),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_4','IMPROVEMENT_MINE','YIELD_CULTURE',1);

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES ; 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3b','IMPROVEMENT_MINE',5);

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_2','RESOURCE_COPPER',1),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3b','RESOURCE_COPPER',-1);

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_2','UNIT_WORKER',1);

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_2','FLAVOR_PRODUCTION',25),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a','FLAVOR_CULTURE',5),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a','FLAVOR_PRODUCTION',5),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a','FLAVOR_GOLD',5),
('CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_4','FLAVOR_CULTURE',30);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_DESCRIPTION','All That Glitters');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_HELP','Excellency, there have been new developments at Solomon''s Mines...');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_1', 'Our miners seem to have unearthed relics from another time. I''ve heard that they have discovered all kinds of things over there: ancient shrines, cave drawings, even fossilized camel bones!.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_1_HELP','Camel bones! How positively Biblical! Maybe these mines really did belong to the son of David.[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_2','We have just discovered a very large seam of [ICON_RES_COPPER] Copper ore. We are requesting that you approve these construction plans for a new Forge and allow us to hire more workers for the site.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_2_HELP','These seem to be plans for a new Forge. This building should help with production in the Mines.[NEWLINE][NEWLINE]A new Forge is built in the City, and one Worker appears. You also gain one copy of [ICON_RES_COPPER] Copper.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a','Sir, our mining operations have uncovered an extremely rich deposit of raw goods. It is small, but it should boost productivity for a while. And I''ve heard rumors that they might have found some more ancient artifacts in the area.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3a_HELP','For {5_Turns}, local Mines gain +1 [ICON_CULTURE] Culture, +1 [ICON_PRODUCTION], and +2 [ICON_GOLD] Gold.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3b','Solomon''s Mines Under Seige');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_3b_HELP','An unknown force has taken over the area around Solomon''s Mines. They have destroyed {2_InstantYield} worth of priceless artifacts, and production of [ICON_RES_COPPER] has halted.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_4','''This letter is to humbly request funding from the state to develop an extended archeological dig site at Solomon''s Mines. Our team will make any discoveries immediately known to you and exhibit our findings in your local University.''');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_SOLOMONS_MINES_CHOICE_4_HELP','Write them back and tell them I''d be happy to fund their dig. Camel bones...ha![NEWLINE][NEWLINE]After investing {1_YieldCost} in the site, the Natural Wonder permanently gains +3 [ICON_TOURISM] Tourism. In addition, local Mines gain +1 [ICON_CULTURE] Culture and the City''s University gains +2 [ICON_CULTURE] Culture.');
