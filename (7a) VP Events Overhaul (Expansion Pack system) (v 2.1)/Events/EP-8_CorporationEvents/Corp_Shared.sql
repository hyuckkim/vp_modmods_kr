-- SHARED CORPORATION EVENT ITEMS--

--------------------------------------------------------------------------------------------------
-- This file includes items that are shared across all corporate events, regardless of corporation type.
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
-- Shared City Corporation Evemt Choices
--------------------------------------------------------------------------------------------------
INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_CORP_SECOND_CHOICE_1','TXT_KEY_CITY_EVENT_CORP_SECOND_CHOICE_1','TXT_KEY_CITY_EVENT_CORP_SECOND_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_CORP_GS_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_CORP_SECOND_CHOICE_2','TXT_KEY_CITY_EVENT_CORP_SECOND_CHOICE_2','TXT_KEY_CITY_EVENT_CORP_SECOND_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_CORP_GE_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_CORP_SECOND_CHOICE_3','TXT_KEY_CITY_EVENT_CORP_SECOND_CHOICE_3','TXT_KEY_CITY_EVENT_CORP_SECOND_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,'BUILDINGCLASS_CORP_GM_DUMMY',0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_CORP_SECOND_CHOICE_4','TXT_KEY_CITY_EVENT_DO_NOTHING','TXT_KEY_CITY_EVENT_DO_NOTHING_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_CORP_THIRD_CHOICE_1','TXT_KEY_CITY_EVENT_CORP_THIRD_CHOICE_1','TXT_KEY_CITY_EVENT_CORP_THIRD_CHOICE_1_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_CORP_THIRD_CHOICE_2','TXT_KEY_CITY_EVENT_CORP_THIRD_CHOICE_2','TXT_KEY_CITY_EVENT_CORP_THIRD_CHOICE_2_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_CORP_THIRD_CHOICE_3','TXT_KEY_CITY_EVENT_CORP_THIRD_CHOICE_3','TXT_KEY_CITY_EVENT_CORP_THIRD_CHOICE_3_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0),

('CITY_EVENT_CORP_THIRD_CHOICE_4','TXT_KEY_CITY_EVENT_DO_NOTHING','TXT_KEY_CITY_EVENT_DO_NOTHING_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',30,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0);


--------------------------------------------------------------------------------------------------
-- Shared City Corporation Evemt Results & Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO CityEventChoice_InstantYield(CityEventChoiceType,YieldType,Yield) VALUES
('CITY_EVENT_CORP_SECOND_CHOICE_1','YIELD_GOLD', -1000),
('CITY_EVENT_CORP_SECOND_CHOICE_2','YIELD_GOLD', -1000),
('CITY_EVENT_CORP_SECOND_CHOICE_3','YIELD_GOLD', -1000),
('CITY_EVENT_CORP_THIRD_CHOICE_1','YIELD_GOLD', -2500),
('CITY_EVENT_CORP_THIRD_CHOICE_2','YIELD_GOLD', -2500),
('CITY_EVENT_CORP_THIRD_CHOICE_3','YIELD_GOLD', -2500);

INSERT INTO CityEventChoice_GreatPersonPoints(CityEventChoiceType,SpecialistType,Points) VALUES
('CITY_EVENT_CORP_THIRD_CHOICE_1','SPECIALIST_SCIENTIST',1000),
('CITY_EVENT_CORP_THIRD_CHOICE_2','SPECIALIST_ENGINEER',1000),
('CITY_EVENT_CORP_THIRD_CHOICE_3','SPECIALIST_MERCHANT',1000);

INSERT INTO CityEventChoiceFlavors(CityEventChoiceType,FlavorType,Flavor) VALUES
('CITY_EVENT_CORP_SECOND_CHOICE_1','FLAVOR_SCIENCE',10),
('CITY_EVENT_CORP_SECOND_CHOICE_2','FLAVOR_PRODUCTION',10),
('CITY_EVENT_CORP_SECOND_CHOICE_3','FLAVOR_GOLD',10),
('CITY_EVENT_CORP_SECOND_CHOICE_4','FLAVOR_GOLD',10),
('CITY_EVENT_CORP_THIRD_CHOICE_1','FLAVOR_GREAT_PEOPLE',10),
('CITY_EVENT_CORP_THIRD_CHOICE_1','FLAVOR_GREAT_PEOPLE',10),
('CITY_EVENT_CORP_THIRD_CHOICE_3','FLAVOR_GREAT_PEOPLE',10),
('CITY_EVENT_CORP_THIRD_CHOICE_4','FLAVOR_GOLD',40);


--------------------------------------------------------------------------------------------------
-- Text for Player Level Corporation Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_CORP1_DESCRIPTION', 'The Merits of an Invisible Hand');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_CORP2_DESCRIPTION', 'The Invisible Hand Reaches Forth Again');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_CORP_CHOICE_1_DESCRIPTION', 'I''m willing to let them provide overall guidance of our business interests, but they cannot manage the day-to-day affairs of the Company.');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_CORP_CHOICE_2_DESCRIPTION', 'I want to let them manage day-to-day affairs of the Company, but our own people will handle the big picture stuff.');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_CORP_CHOICE_2_HELP', 'Very good. I suspect that some of the local corporate offices will be looking to you for guidance in the days ahead.');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_CORP_CHOICE_3_DESCRIPTION', 'I am not quite sure what I want to do at this time. Let me think about it a little bit more.');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_CORP_CHOICE_3_HELP', 'Nothing happens at this time. Maybe later?');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_CORP_CHOICE_4_DESCRIPTION', 'I am not really interested in this.');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PLAYER_EVENT_CORP_CHOICE_4_HELP', 'You tell the investors ''no'', and they depart. Nothing changes.');


--------------------------------------------------------------------------------------------------
-- Text for City Level Corporation Events
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_FIRST_CHOICE_1', 'Investments Pay Dividends');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_SECOND_DESCRIPTION','Planning Today for the City of Tomorrow');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_SECOND_CHOICE_1', 'A small sacrifice today for great technological advancements tomorrow. I approve this sponsorship for a new Corporate Research Center.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_SECOND_CHOICE_1_HELP','A new Corporate Research Center is built in the City that provides a 10% bonus to local [ICON_GREAT_SCIENTIST] Great Scientist growth; however, local [ICON_GREAT_ENGINEER] Great Engineer and [ICON_GREAT_MERCHANT] Great Merchant growth is reduced by 10% each');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_SECOND_CHOICE_2', 'This City needs to be really focus on workforce development and training. Those factories aren''t going to run themselves. I approve the development of a new Corporate Employee Training Facility.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_SECOND_CHOICE_2_HELP','A new Corporate Employee Training Facility is built in the City that provides a 10% bonus to local [ICON_GREAT_ENGINEER] Great Engineer growth; however, local [ICON_GREAT_SCIENTIST] Great Scientist and [ICON_GREAT_MERCHANT] Great Merchant growth is reduced by 10% each');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_SECOND_CHOICE_3', 'Our first and foremost mission with this Corporation is the pursuit of profit. I approve the funding of a new Corporate Bank.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_SECOND_CHOICE_3_HELP','A new Corporate Banking Center is built in the City that provides a 10% bonus to local [ICON_GREAT_MERCHANT] Great Merchant growth; however, local [ICON_GREAT_SCIENTIST] Great Scientist and [ICON_GREAT_ENGINEER] Great Engineer growth is reduced by 10% each');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_THIRD_DESCRIPTION','Possible Promotion of a Great Person');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_THIRD_CHOICE_1', 'A great scientist said, ''Wherever the art of medicine is loved, there is also a love of humanity.'' We must show our love for humanity here and raise up one of our own.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_THIRD_CHOICE_1_HELP','Spend {2_InstantYield} and gain an additional 1000 [ICON_GREAT_SCIENTIST] Great Scientist points in the City.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_THIRD_CHOICE_2', 'A great industrialist once said, ''Nothing can be made except by makers, nothing can be managed except by managers.'' Let us make some more makers and manage some more managers.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_THIRD_CHOICE_2_HELP','Spend {2_InstantYield} and gain an additional 1000 [ICON_GREAT_ENGINEER] Great Engineer points in the City.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_THIRD_CHOICE_3', '''Although gold and silver are not by nature money, money is by nature gold and silver.'' They should promote this expert.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_THIRD_CHOICE_3_HELP','Spend {2_InstantYield} and gain an additional 1000 [ICON_GREAT_MERCHANT] Great Merchant points in the City.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_CORP_THISISBAD_DESCRIPTION','Corporate Greed Destroys Trust');

--------------------------------------------------------------------------------------------------
-- Dummy Buildings for Corporate City Event 2 (GS/GE/GM) Bonus 
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_CORP_GS_DUMMY','BUILDING_CORP_GS_DUMMY'),
('BUILDINGCLASS_CORP_GE_DUMMY','BUILDING_CORP_GE_DUMMY'),
('BUILDINGCLASS_CORP_GM_DUMMY','BUILDING_CORP_GM_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Help,Cost,FaithCost,IsDummy,ConquestProb,NeverCapture,NukeImmune,IconAtlas) VALUES
('BUILDING_CORP_GS_DUMMY','BUILDINGCLASS_CORP_GS_DUMMY','TXT_KEY_BUILDING_CORP_GS_DUMMY','TXT_KEY_BUILDING_CORP_GS_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS'),
('BUILDING_CORP_GE_DUMMY','BUILDINGCLASS_CORP_GE_DUMMY','TXT_KEY_BUILDING_CORP_GE_DUMMY','TXT_KEY_BUILDING_CORP_GE_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS'),
('BUILDING_CORP_GM_DUMMY','BUILDINGCLASS_CORP_GM_DUMMY','TXT_KEY_BUILDING_CORP_GM_DUMMY','TXT_KEY_BUILDING_CORP_GM_DUMMY_HELP',-1,-1,1,0,1,1,'CE123_ATLAS');

INSERT INTO Building_SpecificGreatPersonRateModifier(BuildingType,SpecialistType,Modifier) VALUES
('BUILDING_CORP_GS_DUMMY','SPECIALIST_SCIENTIST',10),
('BUILDING_CORP_GS_DUMMY','SPECIALIST_ENGINEER',-10),
('BUILDING_CORP_GS_DUMMY','SPECIALIST_MERCHANT',-10),
('BUILDING_CORP_GE_DUMMY','SPECIALIST_SCIENTIST',-10),
('BUILDING_CORP_GE_DUMMY','SPECIALIST_ENGINEER',10),
('BUILDING_CORP_GE_DUMMY','SPECIALIST_MERCHANT',-10),
('BUILDING_CORP_GM_DUMMY','SPECIALIST_SCIENTIST',-10),
('BUILDING_CORP_GM_DUMMY','SPECIALIST_ENGINEER',-10),
('BUILDING_CORP_GM_DUMMY','SPECIALIST_MERCHANT',10);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_CORP_GS_DUMMY', 'Corporate Research Center');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_CORP_GE_DUMMY', 'Corporate Employee Training Facility');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_CORP_GM_DUMMY', 'Corporate Banking Center');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_CORP_GS_DUMMY_HELP', 'Provides a 10% bonus to local [ICON_GREAT_SCIENTIST] Great Scientist growth but reduces local [ICON_GREAT_ENGINEER] Great Engineer and [ICON_GREAT_MERCHANT] Great Merchant growth by 10% each.'); 

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_CORP_GE_DUMMY_HELP', 'Provides a 10% bonus to local [ICON_GREAT_ENGINEER] Great Engineer growth but reduces local [ICON_GREAT_SCIENTIST] Great Scientist and [ICON_GREAT_MERCHANT] Great Merchant growth by 10% each.'); 

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_CORP_GM_DUMMY_HELP', 'Provides a 10% bonus to local [ICON_GREAT_MERCHANT] Great Merchant growth but reduces local [ICON_GREAT_SCIENTIST] Great Scientist  and [ICON_GREAT_ENGINEER] Great Engineer growth by 10% each.'); 
