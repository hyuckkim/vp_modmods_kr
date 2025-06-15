--------------------------------------------------------------------------------------------------
-- This file is to create setup events.
-- Setup events are to create "dummy" parent events with no effects to get information (e.g. a City's lack of river adjacency) into the Events system.
-- Not including this file can cause other events to mis-fire. 
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
-- Generic text used for multiple events
--------------------------------------------------------------------------------------------------
--INSERT INTO Language_en_US (Tag, Text) VALUES ('TXT_KEY_PLAYER_EVENT_NO_CHOICE', 'I''m not interested in this.');  -- This text is already in the base VP.
--INSERT INTO Language_en_US (Tag, Text) VALUES ('TXT_KEY_PLAYER_EVENT_NO_CHOICE_HELP', 'Nothing happens.');  -- This text is already in the base VP.
--INSERT INTO Language_en_US (Tag, Text) VALUES ('TXT_KEY_CITY_EVENT_DO_NOTHING', 'I''m not interested in this.');  -- This text is already in the base VP.
--INSERT INTO Language_en_US (Tag, Text) VALUES ('TXT_KEY_CITY_EVENT_DO_NOTHING_HELP', 'Nothing happens.');  -- This text is already in the base VP.


--------------------------------------------------------------------------------------------------
-- Dummy Buildings for NoRiver / NoCoast / DryTown tags - Added via CityCreatedStatus LUA script
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_NORIVER_TOWN_DUMMY','BUILDING_NORIVER_TOWN_DUMMY'),
('BUILDINGCLASS_NOCOAST_TOWN_DUMMY','BUILDING_NOCOAST_TOWN_DUMMY'),
('BUILDINGCLASS_DRY_TOWN_DUMMY','BUILDING_DRY_TOWN_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NukeImmune) VALUES
('BUILDING_NORIVER_TOWN_DUMMY','BUILDINGCLASS_NORIVER_TOWN_DUMMY','TXT_KEY_BUILDING_NORIVER_TOWN_DUMMY',-1,-1,1,-1,100,1),
('BUILDING_NOCOAST_TOWN_DUMMY','BUILDINGCLASS_NOCOAST_TOWN_DUMMY','TXT_KEY_BUILDING_NOCOAST_TOWN_DUMMY',-1,-1,1,-1,100,1),
('BUILDING_DRY_TOWN_DUMMY','BUILDINGCLASS_DRY_TOWN_DUMMY','TXT_KEY_BUILDING_DRY_TOWN_DUMMY',-1,-1,1,-1,100,1);

INSERT INTO Language_en_US (Tag, Text) VALUES 
('TXT_KEY_BUILDING_NORIVER_TOWN_DUMMY','Tag - NoRiver'),
('TXT_KEY_BUILDING_NOCOAST_TOWN_DUMMY','Tag - No Coast'),
('TXT_KEY_BUILDING_DRY_TOWN_DUMMY','Tag - DryTown');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------

