--==========================================================================================================================
--JAPAN
--==========================================================================================================================
UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_TRADE_ROUTES';
---------------------
--New UA
---------------------
UPDATE Traits SET NoOpenTrade = 0 WHERE Type = 'TRAIT_FIGHT_WELL_DAMAGED';

UPDATE Trait_GreatPersonBirthGWAM SET Value = 33 WHERE TraitType = 'TRAIT_FIGHT_WELL_DAMAGED';
DELETE FROM Trait_BuildingClassYieldChanges WHERE TraitType = 'TRAIT_FIGHT_WELL_DAMAGED';
---------------------
--Dummy Building
---------------------
INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,			NoLimit)
VALUES		('BUILDINGCLASS_SAKOKU_DUMMY',	'BUILDING_SAKOKU_DUMMY',	1);
			
INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						HappinessPerCity, 	GlobalGreatPeopleRateModifier, 	CapitalOnly, 	GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex, 	IsDummy)
VALUES		('BUILDING_SAKOKU_DUMMY',	'BUILDINGCLASS_SAKOKU_DUMMY',	'TXT_KEY_BUILDING_SAKOKU_DUMMY',	1, 					10, 							0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1);
--------------------------------
-- GameText Update
--------------------------------
UPDATE Language_en_US
SET Text = 'Sakoku'
WHERE Tag = 'TXT_KEY_TRAIT_FIGHT_WELL_DAMAGED_SHORT';

UPDATE Language_en_US
SET Text = 'When a [ICON_GREAT_ADMIRAL] Great Admiral or [ICON_GREAT_GENERAL] Great General is born, gain 33% progress toward a [ICON_GREAT_WORK] Great Artist, Writer, and Musician in your [ICON_CAPITAL] Capital. Other civilizations cannot send [ICON_INTERNATIONAL_TRADE] Trade Routes to you unless you have an [COLOR_POSITIVE_TEXT]Embassy[ENDCOLOR] with them. +1 [ICON_HAPPINESS_1] Happiness and +10% [ICON_GREAT_PEOPLE] Great People generation in all Cities for each unassigned [ICON_INTERNATIONAL_TRADE] Trade Route Slot.'
WHERE Tag = 'TXT_KEY_TRAIT_FIGHT_WELL_DAMAGED';

INSERT INTO Language_en_US (Tag, Text)
VALUES
	('TXT_KEY_BUILDING_SAKOKU_DUMMY', 'Sakoku Dummy');