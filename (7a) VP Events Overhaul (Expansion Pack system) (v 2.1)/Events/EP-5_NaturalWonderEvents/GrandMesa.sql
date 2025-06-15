-- NATURAL WONDER NAME --

INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_GRAND_MESA','EVENT_CLASS_GOOD','TXT_KEY_CITY_EVENT_NW_GRAND_MESA_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_GRAND_MESA_HELP','naturalwonderpopup.dds','AS2D_EVENT_EFIRSTTOSOMETHING',50,1,'false','true','false',30,4,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false','FEATURE_MESA',NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_GRAND_MESA_CHOICE_1','CITY_EVENT_NW_GRAND_MESA'),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_2','CITY_EVENT_NW_GRAND_MESA'),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_3','CITY_EVENT_NW_GRAND_MESA'),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_4','CITY_EVENT_NW_GRAND_MESA');

-- INSERT INTO CityEvent_MinimumStartYield(CityEventType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_GRAND_MESA_CHOICE_1','TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_1','TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_1_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_GRAND_MESA_CHOICE_2','TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_2','TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_2_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_METAL_CASTING',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_GRAND_MESA_CHOICE_3','TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_3','TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_3_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_SCIENTIFIC_THEORY',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_NW_GRAND_MESA_CHOICE_4','TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_4','TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_4_HELP','TXT_KEY_CITY_EVENT_NW_DISABLED_HELP','AS2D_EVENT_CHOICE',0,'true','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','TECH_RAILROAD',NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_HOTEL',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);

INSERT INTO CityEventChoice_EventLinks(CityEventChoiceType,Event,EventChoice,CityEvent,CityEventChoiceLinker,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_GRAND_MESA_CHOICE_4',NULL,NULL,NULL,'CITY_EVENT_NW_GRAND_MESA_CHOICE_3','false','true','true');

-- INSERT INTO CityEventChoice_EventCostYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYield(CityEventChoiceType,YieldType,Yield) VALUES ;

-- INSERT INTO CityEventChoice_CityYieldModifier (CityEventChoiceType,YieldType,Yield) VALUES ;

INSERT INTO CityEventChoice_BuildingClassYieldChange(CityEventChoiceType,BuildingClassType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_GRAND_MESA_CHOICE_4','BUILDINGCLASS_HOTEL','YIELD_GOLD',10),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_4','BUILDINGCLASS_HOTEL','YIELD_TOURISM',5);

-- INSERT INTO CityEventChoice_BuildingClassYieldModifier (CityEventChoiceType,BuildingClassType,YieldType,YieldModifier) VALUES ;

INSERT INTO CityEventChoice_FeatureYieldChange (CityEventChoiceType,FeatureType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_GRAND_MESA_CHOICE_1','FEATURE_MESA','YIELD_GOLDEN_AGE_POINTS',2),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_1','FEATURE_MESA','YIELD_TOURISM',1),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_3','FEATURE_FOREST','YIELD_PRODUCTION',-1),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_3','FEATURE_MESA','YIELD_TOURISM',2);

INSERT INTO CityEventChoice_ImprovementYieldChange(CityEventChoiceType,ImprovementType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_GRAND_MESA_CHOICE_2','IMPROVEMENT_PASTURE','YIELD_PRODUCTION',1),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_2','IMPROVEMENT_LUMBERMILL','YIELD_PRODUCTION',1);

-- INSERT INTO CityEventChoice_ResourceYieldChange(CityEventChoiceType,ResourceType,YieldType,YieldChange) VALUES ;

INSERT INTO CityEventChoice_TerrainYieldChange (CityEventChoiceType,TerrainType,YieldType,YieldChange) VALUES
('CITY_EVENT_NW_GRAND_MESA_CHOICE_3','TERRAIN_GRASS','YIELD_FOOD',-1),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_3','TERRAIN_PLAINS','YIELD_FOOD',-1); 

-- INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES ;

-- INSERT INTO CityEventChoice_SpecialistYieldChange (CityEventChoiceType,SpecialistType,YieldType,YieldChange) VALUES ;

-- INSERT INTO CityEventChoice_ImprovementDestructionRandom (CityEventChoiceType,ImprovementType,Number) VALUES ;

-- INSERT INTO CityEventChoice_BuildingClassDestructionChance (CityEventChoiceType,BuildingClassType,Chance) VALUES ;

INSERT INTO CityEventChoice_ResourceQuantity (CityEventChoiceType,ResourceType,Quantity) VALUES
('CITY_EVENT_NW_GRAND_MESA_CHOICE_2','RESOURCE_FUR',1);

-- INSERT INTO CityEventChoice_FreeUnitClasses (CityEventChoiceType,UnitClassType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_FreeUnits(CityEventChoiceType,UnitType,Quantity) VALUES ;

-- INSERT INTO CityEventChoice_ConvertNumPopToReligion(CityEventChoiceType,ReligionType,Population) VALUES ;

-- INSERT INTO CityEventChoice_ConvertPercentPopToReligion(CityEventChoiceType,ReligionType,Percent) VALUES ;

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_NW_GRAND_MESA_CHOICE_1','FLAVOR_TILE_IMPROVEMENT',5),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_2','FLAVOR_PRODUCTION',20),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_3','FLAVOR_CULTURE',30),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_3','FLAVOR_GROWTH',-5),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_3','FLAVOR_PRODUCTION',-5),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_3','FLAVOR_GOLD',10),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_4','FLAVOR_CULTURE',20),
('CITY_EVENT_NW_GRAND_MESA_CHOICE_4','FLAVOR_GOLD',20);

--------------------------------------------------------------------------------------------------
-- Text for Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GRAND_MESA_DESCRIPTION','Making a Mesa Things');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GRAND_MESA_HELP','It is a delegation from the Grand Mesa Development Board again, Your Gloriousness. I am not sure what they are after. You never can tell with these guys.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_1', 'Representatives from the Board have a group of interested investors who would like to visit the Mesa. What do you think?');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_1_HELP','I know they are looking out for our best interests. Let them have a chance to bring in some visitors.[NEWLINE][NEWLINE]The Natural Wonder permanently yields +2 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_2','Apparently, the area surrounding the Mesa is covered in the finest hardwoods and just teeming with wildlife. The Board sees some real opportunities for new businesses in the area.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_2_HELP','New business is always good. Let''s do what we can to help the Board attract these companies.[NEWLINE][NEWLINE]Local Pastures and Lumbermills gain +1 [ICON_PRODUCTION] Production. You also gain 1 copy of [ICON_RES_FUR] Furs.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_3','The Development Board has now decided that this site is part of our national heritage and should be protected at all costs. They are suggesting we restrict farming and forestry activies in the area.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_3_HELP','I know it will hurt in the short term, but you can only save the environment once. Let''s get some new regulations to protect this land.[NEWLINE][NEWLINE]Local forests lose 1 [ICON_PRODUCTION] Production. Both grasslands and plains lose 1 [ICON_FOOD] Food. At least the Natural Wonder gains +2 [ICON_TOURISM] Tourism.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_4','The Board would now like to build a ski resort on top of this big rock. I''ve been looking at this brochure, and apparently, when the sun hits that ridge just right, these hills sing.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_GRAND_MESA_CHOICE_4_HELP','It''s a good thing we protected the area while we could. They can build their Hotel as long as they reserve a room for me.[NEWLINE][NEWLINE]A new Hotel is built in the City. This Hotel provides as additional +10 [ICON_GOLD] Gold and +5 [ICON_TOURISM] Tourism.');