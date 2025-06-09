----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- WONDERS
-- 2018-01-31 Reworked by Infixo from EE & VP-EE mods
-- 2023-08-25 Reworked by Caym
-- 2023-11-06 Updated by CAYM to be compatible with VP 4.2.7
----------------------------------------------------

----------------------------------------------------
-- Generic info
----------------------------------------------------

INSERT INTO Buildings (Type, PrereqTech, MaxStartEra, SpecialistType, GreatPeopleRateChange, PortraitIndex) VALUES
('BUILDING_EE_FASIL_GHEBBI',    'TECH_EE_FORTIFICATION', 'ERA_INDUSTRIAL',   'SPECIALIST_ENGINEER', 1, 6),
('BUILDING_EE_KRONBORG',        'TECH_EE_WARSHIPS',      'ERA_INDUSTRIAL',   'SPECIALIST_MERCHANT', 1, 2),
('BUILDING_EE_ROYALSOC',        'TECH_SCIENTIFIC_THEORY','ERA_INDUSTRIAL',   'SPECIALIST_SCIENTIST',2, 4),
('BUILDING_EE_TOPKAPI',         'TECH_BANKING',          'ERA_ENLIGHTENMENT', NULL,                 0, 0),
('BUILDING_EE_TORRE',           'TECH_NAVIGATION',       'ERA_INDUSTRIAL',   'SPECIALIST_MERCHANT', 1, 1),
('BUILDING_EE_VERSAILLES',      'TECH_EE_SOVEREIGNTY',   'ERA_ENLIGHTENMENT', NULL,                 0, 7),
('BUILDING_EE_WAT_PHRA_KAEW',   'TECH_EE_HUMANISM',      'ERA_INDUSTRIAL',   'SPECIALIST_SCIENTIST',1, 5);

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_'||SUBSTR(Type,10), Description = 'TXT_KEY_'||Type, 
	Civilopedia = 'TXT_KEY_WONDER_'||SUBSTR(Type,10)||'_PEDIA', Quote = 'TXT_KEY_WONDER_'||SUBSTR(Type,10)||'_QUOTE', Help = 'TXT_KEY_WONDER_'||SUBSTR(Type,10)||'_HELP',
	NukeImmune = 1, HurryCostModifier = -5, MinAreaSize = -1, ConquestProb = 100, IconAtlas = 'ENLIGHTENMENT_WONDER_ATLAS',
	WonderSplashImage = SUBSTR(Type,10)||'_splash.dds', WonderSplashAnchor = 'L,B', WonderSplashAudio = 'AS2D_WONDER_SPEECH_'||SUBSTR(Type,10)
WHERE Type IN (
'BUILDING_EE_FASIL_GHEBBI',
'BUILDING_EE_KRONBORG',
'BUILDING_EE_ROYALSOC',
'BUILDING_EE_TOPKAPI',
'BUILDING_EE_TORRE',
'BUILDING_EE_VERSAILLES',
'BUILDING_EE_WAT_PHRA_KAEW');

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxGlobalInstances)
SELECT 'BUILDINGCLASS_'||SUBSTR(Type,10), Type, 'TXT_KEY_'||Type, 1
FROM Buildings
WHERE Type IN (
'BUILDING_EE_FASIL_GHEBBI',
'BUILDING_EE_KRONBORG',
'BUILDING_EE_ROYALSOC',
'BUILDING_EE_TOPKAPI',
'BUILDING_EE_TORRE',
'BUILDING_EE_VERSAILLES',
'BUILDING_EE_WAT_PHRA_KAEW');

INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType) VALUES
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_FASIL_GHEBBI'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_KRONBORG'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_ROYALSOC'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_TOPKAPI'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_TORRE'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_VERSAILLES'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_WAT_PHRA_KAEW'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_FASIL_GHEBBI'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_KRONBORG'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_ROYALSOC'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_TOPKAPI'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_TORRE'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_VERSAILLES'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_WAT_PHRA_KAEW');

------------------------
-- Non-EE Wonders
------------------------

UPDATE Buildings SET PrereqTech = 'TECH_EE_ROMANTICISM' WHERE Type = 'BUILDING_HERMITAGE';

UPDATE Buildings SET 
PrereqTech = 'TECH_EE_REFRACTION',
NumPoliciesNeeded = 12
WHERE Type = 'BUILDING_SISTINE_CHAPEL';

UPDATE Buildings
SET IconAtlas = 'EECBO_ICON_ATLAS', PortraitIndex = 0
WHERE Type = 'BUILDING_MAUSOLEUM';

------------------------
-- National Wonder: Tower of Buddhist Incense (aka Summer Palace). 
-- Hokath: Rename current one as extension 
------------------------

INSERT INTO Buildings
	(Type, BuildingClass, Description, Civilopedia, Strategy, Help,
	Cost, PrereqTech, NukeImmune, HurryCostModifier, MinAreaSize, IconAtlas, PortraitIndex, ArtDefineTag, FreeGreatPeople, NumCityCostMod, NeverCapture,
	NationalPopRequired, NumCityCostMod)
VALUES
	('BUILDING_EE_SUMMER_PALACE','BUILDINGCLASS_EE_SUMMER_PALACE','TXT_KEY_BUILDING_EE_SUMMER_PALACE','TXT_KEY_BUILDING_EE_SUMMER_PALACE_PEDIA','TXT_KEY_BUILDING_EE_SUMMER_PALACE_STRATEGY','TXT_KEY_BUILDING_EE_SUMMER_PALACE_HELP',
	240, 'TECH_EE_SOVEREIGNTY', 1, -20, -1, 'CSDBUILDINGS_ATLAS', 32, 'ART_DEF_BUILDING_HERMITAGE', 1, 10, 1,
	30, 10);

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxPlayerInstances) VALUES
('BUILDINGCLASS_EE_SUMMER_PALACE', 'BUILDING_EE_SUMMER_PALACE', 'TXT_KEY_BUILDING_EE_SUMMER_PALACE', 1);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield)
VALUES ('BUILDING_EE_SUMMER_PALACE', 'YIELD_CULTURE', 1);

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_EE_SUMMER_PALACE', 'BUILDINGCLASS_EE_MENAGERIE', 'YIELD_TOURISM', 2);

INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType) VALUES
('BUILDING_EE_SUMMER_PALACE', 'BUILDINGCLASS_EE_MANOR');

UPDATE Buildings SET
IconAtlas = 'ENLIGHTENMENT_WONDER_ATLAS', 
PortraitIndex = 8,
Cost = 1000, NumPoliciesNeeded = 14
WHERE Type = 'BUILDING_SUMMER_PALACE';

INSERT INTO Building_ClassesNeededInCity 
	(BuildingType, BuildingClassType) 
VALUES
	('BUILDING_SUMMER_PALACE', 'BUILDINGCLASS_EE_SUMMER_PALACE');

-- HERMITAGE POP UP CHANGE
UPDATE Buildings SET NationalPopRequired = '40'
WHERE Type IN ('BUILDING_HERMITAGE');

------------------------
-- Fasil Ghebbi
------------------------

UPDATE Buildings
SET ExtraCityHitPoints = 100, Defense = 500, CitySupplyFlat = 5
WHERE Type = 'BUILDING_EE_FASIL_GHEBBI';

------------------------
-- Kronborg
------------------------

-- Kronborg Dummy
INSERT INTO Buildings (Type, BuildingClass, Cost, Description, ArtDefineTag, MinAreaSize, IconAtlas, PortraitIndex, NeverCapture, GreatWorkCount, FaithCost, NukeImmune) VALUES
('BUILDING_EE_KRONBORG_DUMMY', 'BUILDINGCLASS_EE_KRONBORG_DUMMY', -1, 'TXT_KEY_EE_KRONBORG_DUMMY', 'NONE', -1, 'BW_ATLAS_1', 19, 1, -1, -1, 1);
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description) VALUES
('BUILDINGCLASS_EE_KRONBORG_DUMMY','BUILDING_EE_KRONBORG_DUMMY','TXT_KEY_EE_KRONBORG_DUMMY');

UPDATE Buildings SET ExtraCityHitPoints = 0, Defense = 0, Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_EE_KRONBORG';
UPDATE Buildings SET ExtraCityHitPoints = 50, Defense = 300, CitySupplyFlat = 1 WHERE Type = 'BUILDING_EE_KRONBORG_DUMMY';

INSERT INTO Building_UnitCombatProductionModifiers (BuildingType, UnitCombatType, Modifier) VALUES
('BUILDING_EE_KRONBORG', 'UNITCOMBAT_NAVALRANGED', 50),
('BUILDING_EE_KRONBORG', 'UNITCOMBAT_NAVALMELEE', 50),
('BUILDING_EE_KRONBORG', 'UNITCOMBAT_SUBMARINE', 50),
('BUILDING_EE_KRONBORG', 'UNITCOMBAT_CARRIER', 50);

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits)
VALUES ('BUILDING_EE_KRONBORG', 'UNIT_GREAT_ADMIRAL', 1);

------------------------
-- Royal Society (Hokath)
------------------------

INSERT INTO Building_FreeUnits 
	(BuildingType,		   UnitType,	   NumUnits)
VALUES	
	('BUILDING_EE_ROYALSOC',  'UNIT_SCIENTIST',  1);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_ROYALSOC', 'YIELD_SCIENCE', 5);

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_EE_ROYALSOC', 'BUILDINGCLASS_UNIVERSITY', 'YIELD_SCIENCE', 2),
('BUILDING_EE_ROYALSOC', 'BUILDINGCLASS_LABORATORY',      'YIELD_SCIENCE', 2),
('BUILDING_EE_ROYALSOC', 'BUILDINGCLASS_EE_ACADEMY',    'YIELD_SCIENCE', 2);

INSERT INTO Building_ImprovementYieldChangesGlobal
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_EE_ROYALSOC', 'IMPROVEMENT_ACADEMY', 'YIELD_SCIENCE', 2),
	('BUILDING_EE_ROYALSOC', 'IMPROVEMENT_ACADEMY', 'YIELD_GOLDEN_AGE_POINTS', 2);
	
----------------------------------------------
-- Topkapi
-- Defensive ones (Walls, Castle, etc.)
----------------------------------------------

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, 	     BuildingClassType, 	YieldType, 	YieldChange)
SELECT DISTINCT 'BUILDING_EE_TOPKAPI', 	bc.Type,    'YIELD_FAITH', 	1
FROM Buildings b, BuildingClasses bc WHERE b.Type = bc.DefaultBuilding AND (b.Cost>0 OR b.FaithCost>0) AND b.Defense>0 AND b.WonderSplashImage IS NULL;

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_TOPKAPI', 'YIELD_CULTURE', 2);

UPDATE Buildings SET
FreeArtifacts = 1,
GreatWorkCount = 2, 
GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT',
ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_EE_TOPKAPI_HELP'
WHERE Type = 'BUILDING_EE_TOPKAPI';

INSERT INTO Building_ThemingYieldBonus
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EE_TOPKAPI', 'YIELD_PRODUCTION', 3),
	('BUILDING_EE_TOPKAPI', 'YIELD_SCIENCE', 3);

INSERT INTO Building_ThemingBonuses
	(BuildingType, Description, Bonus, SameEra, UniqueEras, MustBeArt,  MustBeArtifact, MustBeEqualArtArtifact, 
	RequiresOwner, RequiresAnyButOwner, RequiresSamePlayer, RequiresUniquePlayers, AIPriority, ConsecutiveEras)
VALUES
	('BUILDING_EE_TOPKAPI', 'TXT_KEY_THEMING_BONUS_EE_TOPKAPI', 8, 0, 1, NULL, NULL, 1, 
								  0, 0, 0, 1, 4, 1);
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_THEMING_BONUS_EE_TOPKAPI', '왕실 보물 박물관'),
	('TXT_KEY_THEMING_BONUS_EE_TOPKAPI_HELP', '보너스를 극대화하려면 걸작 슬롯에 연속된 시대 그리고 다른 문명의 예술 작품과 유물을 채워 넣으세요.');

------------------------
-- Torre del Oro
------------------------

UPDATE Buildings
SET Water = 1, MinAreaSize = 10, TradeRouteSeaDistanceModifier = 50, TradeRouteRecipientBonus = 3, TradeRouteTargetBonus = 3, NumTradeRouteBonus = 1, FreeBuildingThisCity = 'BUILDINGCLASS_EE_DRYDOCK'
WHERE Type = 'BUILDING_EE_TORRE';
-- TradeRouteSeaGoldBonus = 200 -> +2 Gold
-- gives a free Harbor
-- TradeRouteRecipientBonus	-> incoming TR  // my gold from other TRs (ok)
-- TradeRouteTargetBonus	-> outgoing TR  // other TR owner gain (no) // other player's gain from mine TR outgoing to him

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_TORRE', 'YIELD_CULTURE', 2);

------------------------
-- Versailles
------------------------
UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_GALLERY' WHERE Type = 'BUILDING_EE_VERSAILLES';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_VERSAILLES', 'YIELD_CULTURE', 5);

INSERT INTO Building_YieldFromYieldPercentGlobal
        (BuildingType, YieldIn, YieldOut, Value)
VALUES    ('BUILDING_EE_VERSAILLES', 'YIELD_GOLD', 'YIELD_CULTURE', 10);

INSERT INTO Building_BuildingClassYieldChanges
        (BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES    
	('BUILDING_EE_VERSAILLES', 'BUILDINGCLASS_MONUMENT',     'YIELD_GOLD', 2),
        ('BUILDING_EE_VERSAILLES', 'BUILDINGCLASS_AMPHITHEATER', 'YIELD_GOLD', 2),
        ('BUILDING_EE_VERSAILLES', 'BUILDINGCLASS_GALLERY',     'YIELD_GOLD', 2),
        ('BUILDING_EE_VERSAILLES', 'BUILDINGCLASS_OPERA_HOUSE', 'YIELD_GOLD', 2);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_VERSAILLES', 'YIELD_CULTURE', 2),
('BUILDING_EE_VERSAILLES', 'YIELD_TOURISM', 3);

----------------------------------------------
-- Wat Phra Kaew
----------------------------------------------

UPDATE Buildings SET 
River = 1,
FreeBuildingThisCity = 'BUILDINGCLASS_STUPA'
WHERE Type = 'BUILDING_EE_WAT_PHRA_KAEW';

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_EE_WAT_PHRA_KAEW', 'BUILDINGCLASS_EE_SEMINARY', 'YIELD_SCIENCE', 1),
('BUILDING_EE_WAT_PHRA_KAEW', 'BUILDINGCLASS_TEMPLE', 'YIELD_SCIENCE', 2);

INSERT INTO Building_ImprovementYieldChangesGlobal
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_EE_WAT_PHRA_KAEW', 'IMPROVEMENT_HOLY_SITE', 'YIELD_FAITH', 2),
	('BUILDING_EE_WAT_PHRA_KAEW', 'IMPROVEMENT_HOLY_SITE', 'YIELD_TOURISM', 2);

INSERT INTO Building_YieldChanges 
	(BuildingType, YieldType, Yield) 
VALUES
	('BUILDING_EE_WAT_PHRA_KAEW', 'YIELD_SCIENCE', 2),
	('BUILDING_EE_WAT_PHRA_KAEW', 'YIELD_FAITH', 2),
	('BUILDING_EE_WAT_PHRA_KAEW', 'YIELD_TOURISM', 2);

--============================
-- CAYM  ADD. 
-- hokath has changed the mill to a better, cooler mill.
--==========================
INSERT INTO Buildings 
	(Type,           		       PrereqTech,           MaxStartEra,         SpecialistType, GreatPeopleRateChange, PortraitIndex) 
VALUES
	('BUILDING_EE_DERWENT_MILLS',  'TECH_EE_MANUFACTURING',      'ERA_INDUSTRIAL',  'SPECIALIST_ENGINEER',               1,             3),
	('BUILDING_EE_BELEM_TOWER',     'TECH_EE_EXPLORATION',    'ERA_ENLIGHTENMENT',      NULL,                            0,             9);

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_'||SUBSTR(Type,10), Description = 'TXT_KEY_'||Type, 
	Civilopedia = 'TXT_KEY_WONDER_'||SUBSTR(Type,10)||'_PEDIA', Quote = 'TXT_KEY_WONDER_'||SUBSTR(Type,10)||'_QUOTE', Help = 'TXT_KEY_WONDER_'||SUBSTR(Type,10)||'_HELP',
	NukeImmune = 1, HurryCostModifier = -5, MinAreaSize = -1, ConquestProb = 100, IconAtlas = 'ENLIGHTENMENT_WONDER_ATLAS',
	WonderSplashImage = SUBSTR(Type,10)||'_splash.dds', WonderSplashAnchor = 'L,B', WonderSplashAudio = 'AS2D_WONDER_SPEECH_'||SUBSTR(Type,10)
WHERE Type IN (
'BUILDING_EE_DERWENT_MILLS', 
'BUILDING_EE_BELEM_TOWER');

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxGlobalInstances)
SELECT 'BUILDINGCLASS_'||SUBSTR(Type,10), Type, 'TXT_KEY_'||Type, 1
FROM Buildings
WHERE Type IN (
'BUILDING_EE_DERWENT_MILLS', 
'BUILDING_EE_BELEM_TOWER');

INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType) VALUES
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_DERWENT_MILLS'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_BELEM_TOWER'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_DERWENT_MILLS'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_BELEM_TOWER');

----------------------------------------------
-- Derwent Mills
----------------------------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_EE_CLOTH_MILL'
WHERE Type = 'BUILDING_EE_DERWENT_MILLS';

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_EE_DERWENT_MILLS', 'BUILDINGCLASS_EE_CLOTH_MILL',   'YIELD_GOLD', 2),
('BUILDING_EE_DERWENT_MILLS', 'BUILDINGCLASS_SEAPORT',         'YIELD_GOLD', 2),
('BUILDING_EE_DERWENT_MILLS', 'BUILDINGCLASS_COAL_PLANT',      'YIELD_GOLD', 2);
	
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_DERWENT_MILLS', 'YIELD_PRODUCTION', 5);

INSERT INTO Building_ImprovementYieldChangesGlobal
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_EE_DERWENT_MILLS', 'IMPROVEMENT_CUSTOMS_HOUSE', 'YIELD_PRODUCTION', 2),
	('BUILDING_EE_DERWENT_MILLS', 'IMPROVEMENT_CUSTOMS_HOUSE', 'YIELD_GOLDEN_AGE_POINTS', 2);

------------------------
-- Belem tower
------------------------

UPDATE Buildings
SET Water = 1, MinAreaSize = 10, TrainedFreePromotion = 'PROMOTION_EE_ADVENTURER'
WHERE Type = 'BUILDING_EE_BELEM_TOWER';

INSERT INTO Building_FreeUnits 
	(BuildingType,						UnitType,				NumUnits)
VALUES	
	('BUILDING_EE_BELEM_TOWER', 	'UNIT_EE_ADVENTURER',		2),
	('BUILDING_EE_BELEM_TOWER', 	'UNIT_GREAT_ADMIRAL',		1);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_BELEM_TOWER', 'YIELD_GOLD', 2);

-----------------------------------
-- Sistine Chapel update to interact with new building
-----------------------------------
INSERT INTO Building_BuildingClassYieldChanges 
	(BuildingType, BuildingClassType, YieldType, YieldChange) 
VALUES
	('BUILDING_SISTINE_CHAPEL', 'BUILDINGCLASS_EE_SEMINARY', 'YIELD_FAITH', 2),
	('BUILDING_SISTINE_CHAPEL', 'BUILDINGCLASS_EE_SEMINARY', 'YIELD_TOURISM', 2);

-------------------------------------
-- move chartered company and prereq weigh house
-------------------------------------
UPDATE Buildings SET 
PrereqTech = 'TECH_ECONOMICS',
Cost = 240
WHERE BuildingClass = 'BUILDINGCLASS_NATIONAL_TREASURY';

UPDATE Building_ClassesNeededInCity SET 
BuildingClassType = 'BUILDINGCLASS_EE_WEIGH_HOUSE'
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_NATIONAL_TREASURY');
----------------------------------
-- and carthage UNW goes to ironworks
----------------------------------
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_GREAT_COTHON', 'YIELD_PRODUCTION', 10);

INSERT INTO Building_ResourceQuantity
	(BuildingType, ResourceType, Quantity)
VALUES
	('BUILDING_GREAT_COTHON', 'RESOURCE_IRON', 2);

INSERT INTO Building_YieldFromConstruction
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_GREAT_COTHON', 'YIELD_SCIENCE', 25);

DELETE FROM Civilization_BuildingClassOverrides WHERE BuildingType = 'BUILDING_GREAT_COTHON';

INSERT INTO Civilization_BuildingClassOverrides
	(CivilizationType, BuildingClassType, BuildingType)
VALUES
	('CIVILIZATION_CARTHAGE', 'BUILDINGCLASS_IRONWORKS', 'BUILDING_GREAT_COTHON');

UPDATE Buildings
SET
	BuildingClass = 'BUILDINGCLASS_IRONWORKS',
	PrereqTech = 'TECH_CURRENCY',
	TradeRouteRecipientBonus = 2,
	TradeRouteTargetBonus = 1,
	ExtraLuxuries = 0,
	ResourceDiversityModifier = 0,
	NumTradeRouteBonus = 2,
	Water = 1,
	PovertyFlatReductionGlobal = 0,
	PovertyFlatReduction = 1,
	FreeBuilding = 'BUILDINGCLASS_HARBOR'
WHERE Type = 'BUILDING_GREAT_COTHON';

UPDATE Language_ko_KR SET
Text = '모든 해안 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] {TXT_KEY_BUILDING_HARBOR}가 생깁니다. 유입되는 [ICON_ARROW_LEFT] 교역로를 통해 도시는 [ICON_GOLD] 골드 +2를 얻고, 교역로 소유자는 [ICON_GOLD] 골드 +1을 얻습니다. [ICON_INTERNATIONAL_TRADE] 교역로 2개를 [COLOR_POSITIVE_TEXT]추가[ENDCOLOR]로 얻습니다. 모든 항구는 [ICON_PRODUCTION] 생산력이 +3 증가하고, 모든 등대는 [ICON_CULTURE] 문화가 +2 증가합니다.[NEWLINE][NEWLINE][ICON_RES_IRON] 철 2개를 제공합니다. 이 도시에 건물을 건설하면 [ICON_RESEARCH] 과학이 +25 증가합니다. (시대에 따라 조정됨)[NEWLINE][NEWLINE]이 도시의 [ICON_GOLD] 빈곤으로 인해 [ICON_HAPPINESS_3] 불행 -1을 얻습니다.[NEWLINE][NEWLINE][ICON_PRODUCTION] 생산 비용은 소유한 도시의 수에 따라 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_COTHON_HELP';

UPDATE Language_ko_KR SET
Text = '{TXT_KEY_BUILDING_IRONWORKS}를 대체하는 고유한 카르타고식 건물입니다. {TXT_KEY_BUILDING_IRONWORKS}의 보너스에 더해, {TXT_KEY_BUILDING_GREAT_COTHON}은 모든 해안 도시에 무료 {TXT_KEY_BUILDING_HARBOR}, 2 개의 [ICON_INTERNATIONAL_TRADE] 교역로, [ICON_GOLD] 교역로에서 보내고 받는 양쪽이 모두 골드를 획득하고, 건설된 도시의 빈곤 감소 효과를 일정량만큼 획득하며, 문명 내 모든 등대와 항구의 생산력을 향상시킵니다. {TXT_KEY_BUILDING_IRONWORKS}와 달리, {TXT_KEY_BUILDING_GREAT_COTHON}은 [COLOR_CYAN]고전 시대[ENDCOLOR]에 [COLOR_CYAN]{TXT_KEY_TECH_CURRENCY_TITLE}[ENDCOLOR] 발견과 함께 만들 수 있습니다. {TXT_KEY_BUILDING_GREAT_COTHON}은 건설에 필요한 어떠한 조건도 없지만, 해안 도시에서만 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_COTHON_STRATEGY';

------------------------
-- Flavors
------------------------

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
SELECT Type, 'FLAVOR_WONDER', 30
FROM Buildings
WHERE Type IN (
'BUILDING_EE_FASIL_GHEBBI',
'BUILDING_EE_KRONBORG',
'BUILDING_EE_ROYALSOC',
'BUILDING_EE_TOPKAPI',
'BUILDING_EE_TORRE',
'BUILDING_EE_VERSAILLES',
'BUILDING_EE_WAT_PHRA_KAEW',
'BUILDING_EE_BELEM_TOWER',
'BUILDING_EE_DERWENT_MILLS');

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_WONDER', 25),
('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_DEFENSE', 25),
('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_CITY_DEFENSE', 30),
('BUILDING_EE_KRONBORG', 'FLAVOR_DEFENSE', 25),
('BUILDING_EE_KRONBORG', 'FLAVOR_CITY_DEFENSE', 15),
('BUILDING_EE_KRONBORG', 'FLAVOR_NAVAL', 40), -- production
('BUILDING_EE_KRONBORG', 'FLAVOR_GREAT_PEOPLE', 15), -- GA
('BUILDING_EE_ROYALSOC', 'FLAVOR_SCIENCE', 30),
('BUILDING_EE_TOPKAPI', 'FLAVOR_RELIGION', 40), -- faith
('BUILDING_EE_TORRE', 'FLAVOR_GOLD', 30),
('BUILDING_EE_TORRE', 'FLAVOR_I_SEA_TRADE_ROUTE', 20), -- range
('BUILDING_EE_TORRE', 'FLAVOR_I_TRADE_DESTINATION', 20), -- gold
('BUILDING_EE_TORRE', 'FLAVOR_I_TRADE_ORIGIN', 20), -- gold
('BUILDING_EE_VERSAILLES', 'FLAVOR_CULTURE', 25),
('BUILDING_EE_VERSAILLES', 'FLAVOR_WONDER', 25),
('BUILDING_EE_VERSAILLES', 'FLAVOR_EXPANSION', 5),
('BUILDING_EE_VERSAILLES', 'FLAVOR_GREAT_PEOPLE', 15),
('BUILDING_EE_WAT_PHRA_KAEW', 'FLAVOR_SCIENCE', 25),
-- Tower of Buddhist Incense
('BUILDING_EE_SUMMER_PALACE', 'FLAVOR_WONDER', 25),
('BUILDING_EE_SUMMER_PALACE', 'FLAVOR_GREAT_PEOPLE', 15),
('BUILDING_EE_SUMMER_PALACE', 'FLAVOR_RELIGION', 15), -- religious unrest
('BUILDING_EE_DERWENT_MILLS', 'FLAVOR_PRODUCTION', 20),
('BUILDING_EE_DERWENT_MILLS', 'FLAVOR_CULTURE', 20),
('BUILDING_EE_DERWENT_MILLS', 'FLAVOR_GOLD', 20),
('BUILDING_EE_BELEM_TOWER', 'FLAVOR_NAVAL', 20), 
('BUILDING_EE_BELEM_TOWER', 'FLAVOR_GOLD', 10), 
('BUILDING_EE_BELEM_TOWER', 'FLAVOR_GREAT_PEOPLE', 20),
('BUILDING_EE_BELEM_TOWER', 'FLAVOR_MILITARY_TRAINING', 20),
('BUILDING_EE_BELEM_TOWER', 'FLAVOR_EXPANSION', 20);

