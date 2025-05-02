
--change Lake yields
UPDATE Yields
SET LakeChange = '0'
WHERE Type = 'YIELD_FOOD';

-- hacienda doesn't get food from lake salt
DELETE FROM Improvement_AdjacentResourceYieldChanges WHERE ResourceType = 'RESOURCE_IA_SALT_LAKE';

----------Dummy Buildings-----------

-- Harbors give sea resources +1 production,
-- we're making it so that it doesn't apply to salt lakes and lake fish


--Building Classes
INSERT INTO BuildingClasses
		(Type,							   DefaultBuilding,		       Description)
VALUES  ('BUILDINGCLASS_IA_HARBOR_DUMMY', 'BUILDING_IA_HARBOR_DUMMY', 'TXT_KEY_BUILDING_IA_HARBOR_DUMMY');


--Building
INSERT INTO Buildings 	
			(Type,							BuildingClass,						Description,							CapitalOnly, 	GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex, IsDummy)
VALUES		('BUILDING_IA_HARBOR_DUMMY',   'BUILDINGCLASS_IA_HARBOR_DUMMY',	   'TXT_KEY_BUILDING_IA_HARBOR_DUMMY',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'IA_LAKE_ATLAS',	2,             1);

-- Building_ResourceYieldChanges
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,					 ResourceType,			     YieldType,				Yield)
VALUES		('BUILDING_IA_HARBOR_DUMMY',	'RESOURCE_IA_SALT_LAKE',	'YIELD_PRODUCTION',		-1),
			('BUILDING_IA_HARBOR_DUMMY',	'RESOURCE_IA_LAKE_FISH',	'YIELD_PRODUCTION',		-1);


-- Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_HARBOR_DUMMY', 'Ignore This'); --shows up in ui

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_IA_HARBOR_DUMMY'
WHERE BuildingClass = 'BUILDINGCLASS_HARBOR';


-- Unique City States compatibility
-- what do you mean this is the wrong file to add to
INSERT INTO EventChoice_ResourceYieldChange
		(EventChoiceType,							ResourceType,				YieldType,		YieldChange)
SELECT	'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG',	'RESOURCE_IA_LAKE_FISH',	'YIELD_FAITH',	1
WHERE EXISTS (SELECT * FROM MinorCivilizations WHERE Type='MINOR_CIV_YANGCHENG');