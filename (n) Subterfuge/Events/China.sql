
INSERT INTO CityEvent_ParentEvents
	(CityEventChoiceType, CityEventType)
VALUES
	('ESPIONAGE_EVENT_CHOICE_CHINA_UA', 'ESPIONAGE_EVENT_CHOICE_SELECT_FOCUS'),
	-- Counterspy
	('ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', 'ESPIONAGE_EVENT_CHOICE_COUNTERSPY_FOCUS');

INSERT INTO CityEventChoice_EventLinks
	(CityEventChoiceType, Event, EventChoice, CityEvent, CityEventChoiceLinker, 
		CheckKnownPlayers, CheckOnlyEventCity, CheckForActive)
VALUES
	('ESPIONAGE_EVENT_CHOICE_CHINA_UA', NULL, NULL, NULL, 'ESPIONAGE_EVENT_CHOICE_CHINA_UA', 
		1, 0, 0),
	('ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', NULL, NULL, NULL, 'ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', 
		0, 0, 0);

INSERT INTO CityEventChoice_ImprovementYieldChange
	(CityEventChoiceType, ImprovementType, YieldType, YieldChange)
VALUES
	('ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', 'IMPROVEMENT_FARM', 'YIELD_GOLD', 1),
	('ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', 'IMPROVEMENT_FARM', 'YIELD_PRODUCTION', 1),
	('ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', 'IMPROVEMENT_FARM', 'YIELD_SCIENCE', 1);

INSERT INTO CityEventChoice_SpecialistYieldChange
	(CityEventChoiceType, SpecialistType, YieldType, YieldChange)
VALUES
	('ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', 'SPECIALIST_CIVIL_SERVANT', 'YIELD_GOLD', 1),
	('ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', 'SPECIALIST_CIVIL_SERVANT', 'YIELD_PRODUCTION', 1),
	('ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', 'SPECIALIST_CIVIL_SERVANT', 'YIELD_SCIENCE', 1);

INSERT INTO CityEventChoice_YieldOnSpyIdentified
	(CityEventChoiceType, YieldType, Yield)
VALUES
	('ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', 'YIELD_GOLD', 50),
	('ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', 'YIELD_CULTURE', 50);

INSERT INTO CityEventChoice_YieldOnSpyKilled
	(CityEventChoiceType, YieldType, Yield)
VALUES
	('ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', 'YIELD_GOLD', 150),
	('ESPIONAGE_EVENT_CHOICE_COUNTERSPY_CHINA_UA', 'YIELD_CULTURE', 150);

-----------------------------

UPDATE Language_en_US
SET Text = 'Silent Decree'
WHERE Tag = 'TXT_KEY_TRAIT_ART_OF_WAR_SHORT';

UPDATE Language_en_US
SET Text = 'All [ICON_SPY] Spies generate +25% Network Points. Can access the [COLOR_POSITIVE_TEXT][ICON_TEAM_9] Embolden Local Warlord[ENDCOLOR] Spy Mission and [COLOR_POSITIVE_TEXT][ICON_TEAM_4] Imperial Inspection[ENDCOLOR] Counterspy Focus. When a [ICON_GREAT_PEOPLE] Great Person is born in a City it enters "[COLOR_POSITIVE_TEXT]We Love the Empress Day[ENDCOLOR]."' 
WHERE Tag = 'TXT_KEY_TRAIT_ART_OF_WAR';

UPDATE Traits
SET
	GreatGeneralRateModifier = 0,
	GreatGeneralExtraBonus = 0,
	GreatWorkWLTKD = 0,
	ExpansionWLTKD = 0,
	PermanentYieldsDecreaseEveryEra = 0,
--	SpyMoveRateModifier = 3,
	SpyOffensiveStrengthModifier = 25,
	GPWLTKD = 1
WHERE Type = 'TRAIT_ART_OF_WAR';

UPDATE Language_en_US
SET Text = 'By the Empress''s Silent Decree, the birth of a {1_Resource:textkey} causes the City of {2_CityName:textkey} to enter "We Love the Empress Day."' 
WHERE Tag = 'TXT_KEY_NOTIFICATION_CITY_WLTKD_UA';

DELETE FROM Trait_PermanentYieldChangeWLTKD WHERE TraitType = 'TRAIT_ART_OF_WAR';

UPDATE Leader_Flavors SET Flavor = 10 WHERE FlavorType = 'FLAVOR_ESPIONAGE' AND LeaderType = 'LEADER_WU_ZETIAN';
UPDATE Leader_Flavors SET Flavor = 9 WHERE FlavorType = 'FLAVOR_ESPIONAGE' AND LeaderType = 'LEADER_ELIZABETH';

-- ------------------------
-- remove the UI
-- ------------------------

UPDATE Improvements
SET
	CivilizationType = NULL,
	SpecificCivRequired = 0
WHERE Type = 'IMPROVEMENT_SIHEYUAN';

DELETE FROM Unit_Builds WHERE BuildType = 'BUILD_SIHEYUAN';

DELETE FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_SIHEYUAN';

UPDATE Builds SET ShowInTechTree = 0 WHERE Type = 'BUILD_SIHEYUAN';
/*
-- this crashes the game T1 apparently rip
DELETE FROM Builds WHERE Type = 'BUILD_SIHEYUAN';
DELETE FROM BuildFeatures WHERE BuildType = 'BUILD_SIHEYUAN';
*/

--------------------------------------
-- New UNW
--------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_CHINA',	'BUILDINGCLASS_COURT_SCRIBE',	'BUILDING_CHINA_TAICHANGSI');

-- Scrivener's Office copies
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
SELECT
	'BUILDING_CHINA_TAICHANGSI', YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_COURT_SCRIBE';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CHINA_TAICHANGSI', 'YIELD_GOLD', 1),
	('BUILDING_CHINA_TAICHANGSI', 'YIELD_FAITH', 1);

INSERT INTO Building_FreeUnits
	(BuildingType, UnitType, NumUnits)
SELECT
	'BUILDING_CHINA_TAICHANGSI', UnitType, NumUnits
FROM Building_FreeUnits  WHERE BuildingType = 'BUILDING_COURT_SCRIBE';

INSERT INTO Building_ResourceQuantity
	(BuildingType, ResourceType, Quantity)
SELECT
	'BUILDING_CHINA_TAICHANGSI', ResourceType, Quantity
FROM Building_ResourceQuantity WHERE BuildingType = 'BUILDING_COURT_SCRIBE';

INSERT INTO Building_UnitCombatProductionModifiers
	(BuildingType, UnitCombatType, Modifier)
SELECT
	'BUILDING_CHINA_TAICHANGSI', UnitCombatType, Modifier
FROM Building_UnitCombatProductionModifiers WHERE BuildingType = 'BUILDING_COURT_SCRIBE';

INSERT INTO Building_YieldPerFriend
	(BuildingType, YieldType, Yield)
SELECT
	'BUILDING_CHINA_TAICHANGSI', YieldType, Yield
FROM Building_YieldPerFriend WHERE BuildingType = 'BUILDING_COURT_SCRIBE';

INSERT INTO Building_YieldPerAlly
	(BuildingType, YieldType, Yield)
SELECT
	'BUILDING_CHINA_TAICHANGSI', YieldType, Yield
FROM Building_YieldPerAlly WHERE BuildingType = 'BUILDING_COURT_SCRIBE';

INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
SELECT
	'BUILDING_CHINA_TAICHANGSI', FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_COURT_SCRIBE';

INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_CHINA_TAICHANGSI', 'FLAVOR_ESPIONAGE', 20);

-- new abilities
INSERT INTO Building_GreatWorkYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CHINA_TAICHANGSI', 'YIELD_FOOD', 2),
	('BUILDING_CHINA_TAICHANGSI', 'YIELD_CULTURE_LOCAL', 2);

INSERT INTO Building_WLTKDYieldMod
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CHINA_TAICHANGSI', 'YIELD_FOOD', 15),
	('BUILDING_CHINA_TAICHANGSI', 'YIELD_GOLD', 15),
	('BUILDING_CHINA_TAICHANGSI', 'YIELD_FAITH', 15);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_CHINA_TAICHANGSI', 'BUILDINGCLASS_TEMPLE', 'YIELD_GOLD', 2),
	('BUILDING_CHINA_TAICHANGSI', 'BUILDINGCLASS_LIBRARY', 'YIELD_GOLD', 2);

----------------------------
-- unique chancery updates
----------------------------
DELETE FROM Building_GreatWorkYieldChangesLocal WHERE BuildingType = 'BUILDING_CHINA_EXAMINATION_HALL';

--INSERT INTO Building_YieldFromWLTKD
--			(BuildingType,	YieldType, Yield)
--VALUES		
--	('BUILDING_CHINA_EXAMINATION_HALL',	'YIELD_PRODUCTION', 	50),
--	('BUILDING_CHINA_EXAMINATION_HALL',	'YIELD_CULTURE_LOCAL', 	50);

INSERT INTO Building_WLTKDYieldMod
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CHINA_EXAMINATION_HALL', 'YIELD_PRODUCTION', 10),
	('BUILDING_CHINA_EXAMINATION_HALL', 'YIELD_CULTURE_LOCAL', 50);

UPDATE Buildings SET
ExtraSpies = 2
WHERE Type = 'BUILDING_CHINA_EXAMINATION_HALL';

INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_CHINA_EXAMINATION_HALL', 'FLAVOR_ESPIONAGE', 15);

-- Gain 50 [ICON_PRODUCTION] Production and [ICON_CULTURE_LOCAL] Border Growth Points when entering "[COLOR_POSITIVE_TEXT]We Love the Empress Day[ENDCOLOR]", scaling with Era.

UPDATE Language_en_US SET
Text = '+10% [ICON_PRODUCTION] Production of Diplomatic Units. Grants the [COLOR_POSITIVE_TEXT]Royal Signet[ENDCOLOR] Promotion to all Diplomatic Units built in this City. Receive 20 [ICON_VP_SPY_POINTS] Spy Points. +10% [ICON_PRODUCTION] Production and +50% [ICON_CULTURE_LOCAL] Border Growth Points during "[COLOR_POSITIVE_TEXT]We Love the Empress Day[ENDCOLOR]" in the City.[NEWLINE][NEWLINE]Whenever a [ICON_CITIZEN] Citizen is born, gain +15 [ICON_GREAT_PEOPLE] points toward the [ICON_GREAT_PEOPLE] Great Person with the highest progress, scaling with Era.[NEWLINE][NEWLINE][ICON_CITY_STATE] City-State [COLOR_CYAN]Ally[ENDCOLOR] Bonus: +2 [ICON_PRODUCTION] Production each.'
WHERE Tag = 'TXT_KEY_BUILDING_CHINA_EXAMINATION_HALL_HELP';

UPDATE Language_en_US SET
Text = 'The Examination Hall is a Chinese unique building, replacing the Chancery. In addition to the normal bonuses of a Chancery, it provides Spy Points, allowing China the unique ability to gain Spies by Founding more Cities. In addition, moving Great Works to your new Cities becomes even more effective in growing developing them. Finally, you can channel growth into additional Great People Points; with the ability to decide which Specialist will receive them you can spread all different types across your booming Empire. Taken together, China''s bonuses mean you are flexible in chasing whichever Victory suits you desire.'
WHERE Tag = 'TXT_KEY_BUILDING_CHINA_EXAMINATION_HALL_STRATEGY';
