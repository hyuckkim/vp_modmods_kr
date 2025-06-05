----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- UNITS
-- 2018-02-01 Reworked by Infixo from EE & VP-EE mods
----------------------------------------------------

----------------------------------------------------
-- Generic info
-- UNIT_EE_SKIRMISHER is Light Infantry
----------------------------------------------------

INSERT INTO Units (Type, PrereqTech, Combat, Moves, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI, AdvancedStartCost, UnitFlagIconOffset, PortraitIndex, GoodyHutUpgradeUnitClass) VALUES
('UNIT_EE_ADVENTURER',    'TECH_EE_EXPLORATION',  24, 3, 1, 'UNITCOMBAT_RECON',       'DOMAIN_LAND','UNITAI_EXPLORE',     10, 6, 6,'UNITCLASS_COMMANDO'), -- UNIT_EE_EXPLORER in original EE
('UNIT_EE_FIELD_GUN',     'TECH_EE_FLINTLOCK',    14, 2, 1, 'UNITCOMBAT_SIEGE',       'DOMAIN_LAND','UNITAI_CITY_BOMBARD',30, 4, 4,'UNITCLASS_FIELD_GUN'),
('UNIT_EE_LINE_INFANTRY', 'TECH_EE_FLINTLOCK',    31, 2, 1, 'UNITCOMBAT_GUN',         'DOMAIN_LAND','UNITAI_DEFENSE',     30, 1, 1,'UNITCLASS_RIFLEMAN'),
('UNIT_EE_SKIRMISHER',    'TECH_EE_FORTIFICATION',28, 2, 1, 'UNITCOMBAT_ARCHER',      'DOMAIN_LAND','UNITAI_RANGED',      30, 2, 2,'UNITCLASS_GATLINGGUN'),
('UNIT_EE_DRAGOON',		  'TECH_EE_FORTIFICATION',34, 5, 1, 'UNITCOMBAT_ARCHER',      'DOMAIN_LAND','UNITAI_RANGED',      30, 10,9,'UNITCLASS_CAVALRY'),
('UNIT_EE_UHLAN',         'TECH_RIFLING',         48, 4, 1, 'UNITCOMBAT_MOUNTED',     'DOMAIN_LAND','UNITAI_FAST_ATTACK', 30, 3, 3,'UNITCLASS_WWI_TANK'),
('UNIT_EE_CARRACK',       'TECH_ASTRONOMY',       32, 5, 0, 'UNITCOMBAT_NAVALMELEE',  'DOMAIN_SEA', 'UNITAI_ATTACK_SEA',  50, 9,19,'UNITCLASS_PRIVATEER'),
('UNIT_EE_GALLEON',       'TECH_EE_EXPLORATION',  20, 4, 0, 'UNITCOMBAT_NAVALRANGED', 'DOMAIN_SEA', 'UNITAI_ASSAULT_SEA', 50, 5, 5,'UNITCLASS_FRIGATE'),
('UNIT_EE_SHIP_OF_THE_LINE','TECH_EE_WARSHIPS',   45, 5, 0, 'UNITCOMBAT_NAVALMELEE',  'DOMAIN_SEA', 'UNITAI_ASSAULT_SEA', 50, 8, 9,'UNITCLASS_IRONCLAD');

UPDATE Units
SET Class = 'UNITCLASS_'||SUBSTR(Type,6), Description = 'TXT_KEY_'||Type,
	Civilopedia = 'TXT_KEY_'||Type||'_PEDIA', Strategy = 'TXT_KEY_'||Type||'_STRATEGY', Help = 'TXT_KEY_'||Type||'_HELP',
	MilitarySupport = 1, Pillage = 1, MilitaryProduction = 1, XPValueAttack = 3, XPValueDefense = 3, PurchaseCooldown = 1,
	UnitArtInfo = 'ART_DEF_'||Type, UnitFlagAtlas = 'ENLIGHTENMENT_UNIT_FLAG_ATLAS', IconAtlas = 'ENLIGHTENMENT_UNIT_ATLAS'
WHERE Type IN (
'UNIT_EE_ADVENTURER',
'UNIT_EE_FIELD_GUN',
'UNIT_EE_LINE_INFANTRY',
'UNIT_EE_SKIRMISHER',
'UNIT_EE_DRAGOON',
'UNIT_EE_UHLAN',
'UNIT_EE_CARRACK',
'UNIT_EE_GALLEON',
'UNIT_EE_SHIP_OF_THE_LINE');

-- Exceptions
UPDATE Units SET Civilopedia = 'TXT_KEY_CIVILOPEDIA_UNITS_RENAISSANCE_SHIPOFTHELINE_TEXT' WHERE Type = 'UNIT_EE_SHIP_OF_THE_LINE';
UPDATE Units SET UnitArtInfo = 'ART_DEF_UNIT_U_SPANISH_GALLEON' WHERE Type = 'UNIT_EE_GALLEON';
UPDATE Units SET UnitArtInfo = 'ART_DEF_UNIT_EE_EXPLORER' WHERE Type = 'UNIT_EE_ADVENTURER'; -- model has still an old name
UPDATE Units SET IconAtlas   = 'UNIT_ATLAS_2' WHERE Type = 'UNIT_EE_CARRACK' OR Type = 'UNIT_EE_SHIP_OF_THE_LINE';

-- Ships
UPDATE Units
SET MoveRate = 'WOODEN_BOAT', HurryCostModifier = 20, Mechanized = 1, MinAreaSize = 10
WHERE Type IN (
'UNIT_EE_CARRACK',
'UNIT_EE_GALLEON',
'UNIT_EE_SHIP_OF_THE_LINE');

INSERT INTO UnitClasses (Type, DefaultUnit, Description)
SELECT 'UNITCLASS_'||SUBSTR(Type,6), Type, 'TXT_KEY_'||Type
FROM Units
WHERE Type IN (
'UNIT_EE_ADVENTURER',
'UNIT_EE_FIELD_GUN',
'UNIT_EE_LINE_INFANTRY',
'UNIT_EE_SKIRMISHER',
'UNIT_EE_DRAGOON',
'UNIT_EE_UHLAN',
'UNIT_EE_CARRACK',
'UNIT_EE_GALLEON',
'UNIT_EE_SHIP_OF_THE_LINE');

----------------------------------------------------
-- Unit Lines - auto based on GoodyHutUpgradeUnitClass
----------------------------------------------------

INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
SELECT Type, GoodyHutUpgradeUnitClass
FROM Units
WHERE Type IN (
'UNIT_EE_ADVENTURER',
'UNIT_EE_FIELD_GUN',
'UNIT_EE_LINE_INFANTRY',
'UNIT_EE_SKIRMISHER',
'UNIT_EE_DRAGOON',
'UNIT_EE_UHLAN',
'UNIT_EE_CARRACK',
'UNIT_EE_GALLEON',
'UNIT_EE_SHIP_OF_THE_LINE');

-- Version 1.2 updates for existing units related to additonal era (courtesy of adan_eslavo)
--UPDATE Units Set ObsoleteTech = 'TECH_BALLISTICS' WHERE Type = 'UNIT_AUSTRIAN_HUSSAR';
--UPDATE Units Set ObsoleteTech = 'TECH_BALLISTICS' WHERE Type = 'UNIT_INDIAN_WARELEPHANT';
UPDATE Units Set GoodyHutUpgradeUnitClass = 'UNITCLASS_2HANDER' WHERE Type = 'UNIT_DANISH_BERSERKER';
UPDATE Units Set ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY') WHERE Type = 'UNIT_DANISH_BERSERKER';
UPDATE Units Set GoodyHutUpgradeUnitClass = 'UNITCLASS_2HANDER' WHERE Type = 'UNIT_JAPANESE_SAMURAI';
UPDATE Units Set ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY') WHERE Type = 'UNIT_JAPANESE_SAMURAI';
UPDATE Units Set GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_SKIRMISHER' WHERE Type = 'UNIT_OTTOMAN_JANISSARY';
UPDATE Units Set ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_GATLING_GUN') WHERE Type = 'UNIT_OTTOMAN_JANISSARY';

----------------------------------------------------
-- Unit AI
----------------------------------------------------

INSERT INTO Unit_AITypes (UnitType, UnitAIType) VALUES
('UNIT_EE_ADVENTURER','UNITAI_EXPLORE'),
('UNIT_EE_FIELD_GUN', 'UNITAI_CITY_BOMBARD'),
('UNIT_EE_FIELD_GUN', 'UNITAI_RANGED'),
('UNIT_EE_LINE_INFANTRY', 'UNITAI_ATTACK'),
('UNIT_EE_LINE_INFANTRY', 'UNITAI_DEFENSE'),
('UNIT_EE_LINE_INFANTRY', 'UNITAI_EXPLORE'),
('UNIT_EE_SKIRMISHER', 'UNITAI_RANGED'),
('UNIT_EE_DRAGOON',    'UNITAI_RANGED'),
('UNIT_EE_DRAGOON',    'UNITAI_COUNTER'),
('UNIT_EE_UHLAN',    'UNITAI_DEFENSE'),
('UNIT_EE_UHLAN',    'UNITAI_FAST_ATTACK'),
('UNIT_EE_CARRACK',  'UNITAI_ATTACK_SEA'),
('UNIT_EE_CARRACK',  'UNITAI_RESERVE_SEA'),
('UNIT_EE_CARRACK',  'UNITAI_ESCORT_SEA'),
('UNIT_EE_CARRACK',  'UNITAI_EXPLORE_SEA'),
('UNIT_EE_GALLEON',  'UNITAI_ASSAULT_SEA'),
('UNIT_EE_GALLEON',  'UNITAI_RESERVE_SEA'),
('UNIT_EE_GALLEON',  'UNITAI_ESCORT_SEA'),
('UNIT_EE_SHIP_OF_THE_LINE', 'UNITAI_ASSAULT_SEA'),
('UNIT_EE_SHIP_OF_THE_LINE', 'UNITAI_RESERVE_SEA'),
('UNIT_EE_SHIP_OF_THE_LINE', 'UNITAI_ESCORT_SEA');

-------------------------------------------------------
-- Spanish Galleon Model Tweaks
-------------------------------------------------------

UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 1 WHERE UnitInfoType = 'ART_DEF_UNIT_U_SPANISH_GALLEON';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SPANISH_GALLEON';

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_UNIT_U_SPANISH_GALLEON', 'Unit', 'sv_Galleon.dds');

-------------------------------------------------------
-- Change VP Corvette model due to same model with Carrack
-------------------------------------------------------

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.11, Model = 'WarGalleon.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_CORVETTE';

-------------------------------------------------------
-- Adventurer
-------------------------------------------------------

UPDATE Units
SET BaseSightRange = 3, NoBadGoodies = 1,
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_COMMANDO')
WHERE Type = 'UNIT_EE_ADVENTURER';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT
'UNIT_EE_ADVENTURER', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EXPLORER';

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
SELECT	Type, 'UNITCLASS_EE_ADVENTURER', NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR');

-- Explorer -> Adventurer
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_ADVENTURER' -- Adventurer
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_EXPLORER');

UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_ADVENTURER'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_ADVENTURER'
WHERE Type = 'UNIT_EXPLORER';

-- Scout UUs now obsolete on Adventurer
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_ADVENTURER')
WHERE Class = 'UNITCLASS_SCOUT' AND Type != 'UNIT_SCOUT';

CREATE TRIGGER EE_ADVENTURER_ScoutCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_SCOUT'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_ADVENTURER')
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

-- Explorer UUs now obsolete on Commando and upgrade to Adventurer
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_COMMANDO'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_ADVENTURER'
WHERE Class = 'UNITCLASS_EXPLORER' AND Type != 'UNIT_EXPLORER';

CREATE TRIGGER EE_ADVENTURER_ExplorerCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_EXPLORER'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_COMMANDO'),
		GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_ADVENTURER'
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

-------------------------------------------------------
-- Line Infantry
-------------------------------------------------------

UPDATE Units
SET IgnoreBuildingDefense = 1, Conscription = 5,
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_RIFLEMAN')
WHERE Type = 'UNIT_EE_LINE_INFANTRY';

INSERT INTO Unit_FreePromotions
		(UnitType, PromotionType)
SELECT 'UNIT_EE_LINE_INFANTRY', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SPANISH_TERCIO';

-- Tercio -> Line Infantry
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_TERCIO');

UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE Type = 'UNIT_SPANISH_TERCIO';

-- Pikeman/Longswordsman UUs now obsolete on Line Infantry
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY')
WHERE Class IN ('UNITCLASS_PIKEMAN', 'UNITCLASS_LONGSWORDSMAN') AND Type NOT IN ('UNIT_PIKEMAN', 'UNIT_LONGSWORDSMAN');

CREATE TRIGGER EE_LINE_INFANTRY_PikemanLongswordsmanCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType IN ('UNITCLASS_PIKEMAN', 'UNITCLASS_LONGSWORDSMAN')
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY')
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

-- Tercio UUs now obsolete on Fusilier and upgrade to Line Infantry
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_RIFLEMAN'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE Class = 'UNITCLASS_TERCIO' AND Type != 'UNIT_SPANISH_TERCIO';

CREATE TRIGGER EE_LINE_INFANTRY_TercioCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_TERCIO'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_RIFLEMAN'),
		GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_LINE_INFANTRY'
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

--UPDATE Units
--SET Class = 'UNITCLASS_EE_LINE_INFANTRY', PrereqTech = 'TECH_EE_FLINTLOCK', GoodyHutUpgradeUnitClass = 'UNITCLASS_RIFLEMAN', ObsoleteTech = 'TECH_RIFLING' -- Combat, Cost, FaithCost
--WHERE Type = 'UNIT_DANISH_SKI_INFANTRY';

-------------------------------------------------------
-- French Musketeer
-------------------------------------------------------

UPDATE Units
SET Cost = (SELECT Cost FROM Units WHERE Type = 'UNIT_SPANISH_TERCIO') - 25,
	Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_SPANISH_TERCIO') + 3
WHERE Type = 'UNIT_FRENCH_MUSKETEER';

-------------------------------------------------------
-- Swedish Carolean, used in period 1680-1720
-- Most of the infantry were equipped with modern flintlock muskets, although older versions still were in use. They were also equipped with rapiers and a bag for ammunition.
-- Switch to Line Infantry, available early EE
-------------------------------------------------------

UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY' WHERE  UnitType = 'UNIT_SWEDISH_CAROLEAN';

UPDATE Units
SET Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY') + 2,
	Class = 'UNITCLASS_EE_LINE_INFANTRY',
	PrereqTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY'),
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_GREAT_WAR_INFANTRY'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_RIFLEMAN'
WHERE Type = 'UNIT_SWEDISH_CAROLEAN';

UPDATE Unit_ClassUpgrades SET UnitClassType = (SELECT GoodyHutUpgradeUnitClass FROM Units WHERE Type = UnitType) WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN';

-------------------------------------------------------
-- American Minuteman
-------------------------------------------------------

UPDATE Civilization_UnitClassOverrides Set UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY' WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';

UPDATE Units
SET Class = 'UNITCLASS_EE_LINE_INFANTRY', CombatClass = 'UNITCOMBAT_GUN',
	Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY') + 2,
	Range = 0,
	RangedCombat = 0,
	PrereqTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY'),
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_GREAT_WAR_INFANTRY'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_RIFLEMAN',
	DefaultUnitAI = 'UNITAI_DEFENSE'
WHERE Type = 'UNIT_AMERICAN_MINUTEMAN';

UPDATE Unit_ClassUpgrades SET UnitClassType = (SELECT GoodyHutUpgradeUnitClass FROM Units WHERE Type = UnitType) WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';

DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';
INSERT INTO Unit_AITypes (UnitType, UnitAIType) VALUES
('UNIT_AMERICAN_MINUTEMAN', 'UNITAI_EXPLORE'),
('UNIT_AMERICAN_MINUTEMAN', 'UNITAI_ATTACK'),
('UNIT_AMERICAN_MINUTEMAN', 'UNITAI_DEFENSE');

DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN' AND PromotionType IN('PROMOTION_NAVAL_MISFIRE', 'PROMOTION_ONLY_DEFENSIVE', 'PROMOTION_BARRAGE_1', 'PROMOTION_ACCURACY_1');
INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_AMERICAN_MINUTEMAN', PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EE_LINE_INFANTRY';
INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_AMERICAN_MINUTEMAN', 'PROMOTION_DRILL_1';

-------------------------------------------------------
-- Dragoon
-------------------------------------------------------

UPDATE Units
SET RangedCombat = 26, Range = 1, IgnoreBuildingDefense = 1, MoveRate = 'QUADRUPED',
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_CAVALRY')
WHERE Type = 'UNIT_EE_DRAGOON';

INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, ResourceType, Cost)
SELECT 'UNIT_EE_DRAGOON', ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CUIRASSIER';

INSERT INTO Unit_FreePromotions
		(UnitType, PromotionType)
SELECT 'UNIT_EE_DRAGOON', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CUIRASSIER';

-- Cuirassier -> Dragoon
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_DRAGOON'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_CUIRASSIER');

UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_DRAGOON'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_DRAGOON'
WHERE Type = 'UNIT_CUIRASSIER';

-- Heavy Skirmisher UUs now obsolete on Dragoon
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_DRAGOON')
WHERE Class = 'UNITCLASS_MOUNTED_BOWMAN' AND Type != 'UNIT_MOUNTED_BOWMAN';

CREATE TRIGGER EE_DRAGOON_HeavySkirmisherCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_MOUNTED_BOWMAN'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_DRAGOON')
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

-- Cuirassier UUs now obsolete on Cavalry and upgrade to Dragoon
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_CAVALRY'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_DRAGOON'
WHERE Class = 'UNITCLASS_CUIRASSIER' AND Type != 'UNIT_CUIRASSIER';

CREATE TRIGGER EE_DRAGOON_CuirassierCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_CUIRASSIER'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_CAVALRY'),
		GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_DRAGOON'
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

-------------------------------------------------------
-- Uhlan
-------------------------------------------------------

UPDATE Units
SET IgnoreBuildingDefense = 1, MoveRate = 'QUADRUPED', BaseLandAirDefense = 2,
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_WWI_TANK')
WHERE Type = 'UNIT_EE_UHLAN';

INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, ResourceType, Cost)
SELECT 'UNIT_EE_UHLAN', ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_LANCER';

INSERT INTO Unit_FreePromotions
		(UnitType, PromotionType)
SELECT 'UNIT_EE_UHLAN', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_LANCER';

INSERT INTO Unit_FreePromotions
		(UnitType, PromotionType)
VALUES
('UNIT_EE_UHLAN', 'PROMOTION_ANTI_MOUNTED_I');

-- Lancer -> Uhlan
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_UHLAN'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_LANCER');

UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_UHLAN'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_UHLAN'
WHERE Type = 'UNIT_LANCER';

-- Knight UUs now obsolete on Uhlan
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_UHLAN')
WHERE Class = 'UNITCLASS_KNIGHT' AND Type != 'UNIT_KNIGHT';

CREATE TRIGGER EE_UHLAN_KnightCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_KNIGHT'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_UHLAN')
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

-- Lancer UUs now obsolete on Landship and upgrade to Uhlan
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_WWI_TANK'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_UHLAN'
WHERE Class = 'UNITCLASS_LANCER' AND Type != 'UNIT_LANCER';

CREATE TRIGGER EE_UHLAN_LancerCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_LANCER'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_WWI_TANK'),
		GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_UHLAN'
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

-------------------------------------------------------
-- Polish Winged Hussar (replaces Lancer, upgrades to Uhlan)
-- The Polish Hussars or Winged Hussars, were one of the main types of the cavalry in the Polish-Lithuanian Commonwealth between the 16th and 18th centuries
-- (Ottoman) Sipahi (gifted by minors, "replaces" Lancer)
-- Sipahi were two types of Ottoman cavalry corps
-------------------------------------------------------

UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_TANK'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_UHLAN'
WHERE Type IN ('UNIT_OTTOMAN_SIPAHI', 'UNIT_POLISH_WINGED_HUSSAR');

UPDATE Unit_ClassUpgrades
SET UnitClassType = (SELECT GoodyHutUpgradeUnitClass FROM Units WHERE Type = UnitType)
WHERE UnitType IN ('UNIT_OTTOMAN_SIPAHI', 'UNIT_POLISH_WINGED_HUSSAR');

UPDATE Units SET Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_LANCER') + 1 WHERE Type = 'UNIT_POLISH_WINGED_HUSSAR';

-------------------------------------------------------
-- Russian Cossack
-- The most popular weapons used by Cossack cavalrymen were usually sabres and long spears.
-- move Cossack into Enlightenment and make it melee
-------------------------------------------------------

UPDATE Civilization_UnitClassOverrides Set UnitClassType = 'UNITCLASS_EE_UHLAN' WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';

UPDATE Units
SET Class = 'UNITCLASS_EE_UHLAN', CombatClass = 'UNITCOMBAT_MOUNTED',
	Range = 0, RangedCombat = 0,
	Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_EE_UHLAN') + 4,
	PrereqTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_UHLAN'),
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_TANK'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_WWI_TANK',
	DefaultUnitAI = 'UNITAI_FAST_ATTACK'
WHERE Type = 'UNIT_RUSSIAN_COSSACK';

UPDATE Unit_ClassUpgrades SET UnitClassType = (SELECT GoodyHutUpgradeUnitClass FROM Units WHERE Type = UnitType) WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';

DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND PromotionType = 'PROMOTION_SKIRMISHER_DOCTRINE';
DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND PromotionType = 'PROMOTION_ESPRIT_DE_CORPS';
DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND PromotionType = 'PROMOTION_NAVAL_MISFIRE';
DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND PromotionType = 'PROMOTION_ONLY_DEFENSIVE';

-- Infixo: resambles original CBO Cossack
INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_RUSSIAN_COSSACK' , 'PROMOTION_ANTI_MOUNTED_I';
INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_RUSSIAN_COSSACK' , 'PROMOTION_HEAVY_CHARGE';

-- Infixo: AI same as Knight and Lancer
DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';
INSERT INTO Unit_AITypes (UnitType, UnitAIType) VALUES
('UNIT_RUSSIAN_COSSACK', 'UNITAI_FAST_ATTACK'),
('UNIT_RUSSIAN_COSSACK', 'UNITAI_DEFENSE');

-------------------------------------------------------
-- Light Infantry
-------------------------------------------------------

UPDATE Units
SET RangedCombat = 37, Range = 2,
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_GATLINGGUN')
WHERE Type = 'UNIT_EE_SKIRMISHER';

INSERT INTO Unit_FreePromotions
		(UnitType, PromotionType)
SELECT 'UNIT_EE_SKIRMISHER', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MUSKETMAN';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_EE_SKIRMISHER', 'PROMOTION_CBOEE_SKIRMISH');

-- Musketman -> Light Infantry
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_SKIRMISHER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_MUSKETMAN');

UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_SKIRMISHER'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_SKIRMISHER'
WHERE Type = 'UNIT_MUSKETMAN';

-- Crossbowman UUs now obsolete on Light Infantry
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_SKIRMISHER')
WHERE Class = 'UNITCLASS_CROSSBOWMAN' AND Type != 'UNIT_CROSSBOWMAN';

CREATE TRIGGER EE_SKIRMISHER_CrossbowmanCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_CROSSBOWMAN'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_SKIRMISHER')
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

-- Musketman UUs now obsolete on Gatling Gun and upgrade to Light Infantry
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_GATLINGGUN'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_SKIRMISHER'
WHERE Class = 'UNITCLASS_MUSKETMAN' AND Type != 'UNIT_MUSKETMAN';

CREATE TRIGGER EE_SKIRMISHER_MusketmanCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_MUSKETMAN'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_GATLINGGUN'),
		GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_SKIRMISHER'
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

-------------------------------------------------------
-- Field Gun and Howitzer
-------------------------------------------------------
-- UNIT_FIELD_GUN is VP's Field Gun, which will be renamed to Howitzer

UPDATE Units
SET RangedCombat = 35, Range = 2, IgnoreBuildingDefense = 1, MoveRate = 'ARTILLERY',
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_FIELD_GUN')
WHERE Type = 'UNIT_EE_FIELD_GUN';

INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, ResourceType, Cost)
SELECT 'UNIT_EE_FIELD_GUN', ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_FIELD_GUN';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_EE_FIELD_GUN', PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_FIELD_GUN';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_FIELD_GUN'
WHERE Type = 'UNITCLASS_FIELD_GUN';

UPDATE Units
SET Description = 'TXT_KEY_UNIT_FIELD_GUN', Civilopedia = 'TXT_KEY_UNIT_FIELD_GUN_PEDIA', Strategy = 'TXT_KEY_UNIT_FIELD_GUN_STRATEGY', Help = 'TXT_KEY_UNIT_FIELD_GUN_HELP'
WHERE Type = 'UNIT_FIELD_GUN';

-- Cannon -> Field Gun
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_FIELD_GUN'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_CANNON');

UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_FIELD_GUN'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_FIELD_GUN'
WHERE Type = 'UNIT_CANNON';

-- Trebuchet UUs now obsolete on Field Gun
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_FIELD_GUN')
WHERE Class = 'UNITCLASS_TREBUCHET' AND Type != 'UNIT_TREBUCHET';

CREATE TRIGGER EE_FIELD_GUN_TrebuchetCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_TREBUCHET'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_FIELD_GUN')
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

-- Cannon UUs now obsolete on Howitzer and upgrade to Field Gun
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_FIELD_GUN'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_FIELD_GUN'
WHERE Class = 'UNITCLASS_CANNON' AND Type != 'UNIT_CANNON';

CREATE TRIGGER EE_FIELD_GUN_CannonCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_CANNON'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_FIELD_GUN'),
		GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_FIELD_GUN'
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

-------------------------------------------------------
-- Portuguese Nau
-------------------------------------------------------

UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_EE_CARRACK' WHERE UnitType = 'UNIT_PORTUGUESE_NAU';

UPDATE Units
SET Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_EE_CARRACK') + 4, Moves = 5,
	Class = 'UNITCLASS_EE_CARRACK',
	PrereqTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_CARRACK'),
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_IRONCLAD'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_PRIVATEER'
WHERE Type = 'UNIT_PORTUGUESE_NAU';

UPDATE Unit_ClassUpgrades SET UnitClassType = (SELECT GoodyHutUpgradeUnitClass FROM Units WHERE Type = UnitType) WHERE UnitType = 'UNIT_PORTUGUESE_NAU';

-------------------------------------------------------
-- Carrack
-------------------------------------------------------

UPDATE Units SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_PRIVATEER') WHERE Type = 'UNIT_EE_CARRACK';

-- Caravel -> Carrack; CS decreased to 23 from 25; production cost decreased to 150 from 160; unlocked in Chivalry (moved from Compass)
UPDATE Units
SET Combat = Combat - 2, Cost = Cost - 10,
	PrereqTech = 'TECH_CHIVALRY',
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_CARRACK'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_CARRACK'
WHERE Type = 'UNIT_CARAVEL';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_CARRACK'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_CARAVEL');

-- Trireme obsolete in Chivalry
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_CARAVEL')
WHERE Type = 'UNIT_TRIREME';

-- Trireme UUs now obsolete on Carrack
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_CARRACK')
WHERE Class = 'UNITCLASS_TRIREME' AND Type != 'UNIT_TRIREME';

CREATE TRIGGER EE_CARRACK_TriremeCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_TRIREME'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_CARRACK')
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

-- Caravel UUs unlocked in Chivalry if it previously unlocked in Compass, else then manually change it
UPDATE Units
SET PrereqTech = 'TECH_CHIVALRY'
WHERE Class = 'UNITCLASS_CARAVEL' AND Type != 'UNIT_CARAVEL' AND PrereqTech = 'TECH_COMPASS';

-- Caravel UUs now obsolete on Corvette and upgrade to Carrack
UPDATE Units
SET Combat = Combat - 2, Cost = Cost - 10,
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_PRIVATEER'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_CARRACK'
WHERE Class = 'UNITCLASS_CARAVEL' AND Type != 'UNIT_CARAVEL';

CREATE TRIGGER EE_CARRACK_CaravelCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_CARAVEL'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET Combat = Combat - 2, Cost = Cost - 10,
		ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_PRIVATEER'),
		GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_CARRACK'
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;

	UPDATE Units
	SET PrereqTech = 'TECH_CHIVALRY'
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType AND PrereqTech = 'TECH_COMPASS';
END;

-------------------------------------------------------
-- English UU - classic CBP SotL
-------------------------------------------------------

UPDATE Units SET
	PrereqTech = 'TECH_NAVIGATION', -- up to 6 techs earlier than Frigate in EE
	Civilopedia = 'TXT_KEY_UNIT_EE_ENGLISH_FIRST_RATE_PEDIA',
	IconAtlas = 'ENLIGHTENMENT_UNIT_ATLAS',
	PortraitIndex = 8
WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
VALUES ('UNIT_ENGLISH_SHIPOFTHELINE', 'PROMOTION_EE_FIRST_RATE');

-------------------------------------------------------
-- Galleon, Frigate and ranged ships
-------------------------------------------------------

-- Frigate changes
UPDATE Units
SET PrereqTech = 'TECH_EE_WARSHIPS'
WHERE Type = 'UNIT_FRIGATE';

UPDATE Units
SET RangedCombat = 29, Range = 2,
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_FRIGATE')
WHERE Type = 'UNIT_EE_GALLEON';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
SELECT 'UNIT_EE_GALLEON', PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_FRIGATE';

-- Galleass -> Galleon; RCS decreased to 23 from 24
UPDATE Units
SET RangedCombat = RangedCombat - 1,
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_GALLEON'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_GALLEON'
WHERE Type = 'UNIT_GALLEASS';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_GALLEON'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_GALLEASS');

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_GALLEON'
WHERE UnitType = 'UNIT_VENETIAN_GALLEASS';

-- Dromon CS increased to 9 from 7; production cost increased to 110 from 100; unlocked in Engineering (moved from Sailing)
UPDATE Units
SET Combat = Combat + 2, Cost = Cost + 10,
	PrereqTech = 'TECH_ENGINEERING'
WHERE Type = 'UNIT_BYZANTINE_DROMON';

-- Dromon UUs unlocked in Engineering if it previously unlocked in Sailing, else then manually change it
UPDATE Units
SET PrereqTech = 'TECH_ENGINEERING'
WHERE Class = 'UNITCLASS_BYZANTINE_DROMON' AND Type != 'UNIT_BYZANTINE_DROMON' AND PrereqTech = 'TECH_OPTICS';

-- Dromon UUs now obsolete on Galleon
UPDATE Units
SET Combat = Combat + 2, Cost = Cost + 10,
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_GALLEON')
WHERE Class = 'UNITCLASS_BYZANTINE_DROMON' AND Type != 'UNIT_BYZANTINE_DROMON';

CREATE TRIGGER EE_GALLEON_DromonCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_BYZANTINE_DROMON'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET Combat = Combat + 2, Cost = Cost + 10,
		ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_GALLEON')
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;

	UPDATE Units
	SET PrereqTech = 'TECH_ENGINEERING'
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType AND PrereqTech = 'TECH_OPTICS';
END;

-- Galleass UUs now obsolete on Frigate and upgrade to Galleon
UPDATE Units
SET RangedCombat = RangedCombat - 1,
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_FRIGATE'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_GALLEON'
WHERE Class = 'UNITCLASS_GALLEASS' AND Type != 'UNIT_GALLEASS';

CREATE TRIGGER EE_GALLEON_GalleassCompatibility
AFTER INSERT ON Civilization_UnitClassOverrides
WHEN NEW.UnitClassType = 'UNITCLASS_GALLEASS'
AND NEW.UnitType NOT NULL
BEGIN
	UPDATE Units
	SET RangedCombat = RangedCombat - 1,
		ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_FRIGATE'),
		GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_GALLEON'
	WHERE Type = NEW.UnitType AND Class = NEW.UnitClassType;
END;

UPDATE Units
SET IconAtlas = 'ENLIGHTENMENT_UNIT_ATLAS', PortraitIndex = 7
WHERE Type = 'UNIT_CRUISER';

-------------------------------------------------------
-- Ship of the Line - new strong naval melee unit
-------------------------------------------------------
UPDATE Units SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_IRONCLAD') WHERE Type = 'UNIT_EE_SHIP_OF_THE_LINE';

INSERT INTO Unit_FreePromotions
		(UnitType, PromotionType)
SELECT 'UNIT_EE_SHIP_OF_THE_LINE', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PRIVATEER';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_EE_SHIP_OF_THE_LINE', 'PROMOTION_EE_FIRST_RATE'),
('UNIT_EE_SHIP_OF_THE_LINE', 'PROMOTION_EXTRA_SIGHT_I');

-------------------------------------------------------
-- Align flavors
-------------------------------------------------------

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_EE_ADVENTURER',	'FLAVOR_RECON',  12),
('UNIT_EE_FIELD_GUN',	'FLAVOR_OFFENSE', 11),
('UNIT_EE_FIELD_GUN',	'FLAVOR_DEFENSE', 8),
('UNIT_EE_FIELD_GUN',	'FLAVOR_RANGED', 11),
('UNIT_EE_LINE_INFANTRY','FLAVOR_OFFENSE', 13),
('UNIT_EE_LINE_INFANTRY','FLAVOR_DEFENSE', 10),
('UNIT_EE_SKIRMISHER',	'FLAVOR_OFFENSE', 9),
('UNIT_EE_SKIRMISHER',	'FLAVOR_DEFENSE', 10),
('UNIT_EE_SKIRMISHER',	'FLAVOR_RANGED',  12),
('UNIT_EE_DRAGOON',		'FLAVOR_OFFENSE', 9),
('UNIT_EE_DRAGOON',		'FLAVOR_DEFENSE', 7),
('UNIT_EE_DRAGOON',		'FLAVOR_RANGED',  8),
('UNIT_EE_DRAGOON',		'FLAVOR_MOBILE',  10),
('UNIT_EE_UHLAN',		'FLAVOR_OFFENSE', 12),
('UNIT_EE_UHLAN',		'FLAVOR_DEFENSE', 4),
('UNIT_EE_UHLAN',		'FLAVOR_MOBILE',  9),
('UNIT_EE_CARRACK',		'FLAVOR_NAVAL',  18),
('UNIT_EE_CARRACK',		'FLAVOR_NAVAL_RECON', 23),
('UNIT_EE_GALLEON',		'FLAVOR_NAVAL',  20),
('UNIT_EE_GALLEON',		'FLAVOR_NAVAL_RECON', 10),
('UNIT_EE_SHIP_OF_THE_LINE','FLAVOR_NAVAL', 25),
('UNIT_EE_SHIP_OF_THE_LINE','FLAVOR_NAVAL_RECON', 25);

-------------------------------------------------------
-- Align unit costs and make gold purchases available
-- Guidelines: Cost is 300-450, FaithCost is 250
-- VP 2/27 guidelines
-- MED:(135)160-200, 300 faith
-- REN:     300-375, 400 faith
-- ENL: 400-550, 500 faith
-- IND: 600-900, 600 faith
-- MOD: 800-1300, 700 faith
-------------------------------------------------------

-- Allow for Faith purchases
INSERT INTO Belief_EraFaithUnitPurchase (BeliefType, EraType)
VALUES ('BELIEF_HEATHEN_CONVERSION', 'ERA_ENLIGHTENMENT');

-- Renaissance
UPDATE Units SET Cost = 300, FaithCost = 400 WHERE Type = 'UNIT_EE_ADVENTURER';
UPDATE Units SET Cost = 300, FaithCost = 400 WHERE Type = 'UNIT_2HANDER';
UPDATE Units SET Cost = 250, FaithCost = 370 WHERE Type = 'UNIT_EE_CARRACK'; -- Renaissance, takes place of PRIVATEER
UPDATE Units SET Cost = 250, FaithCost = 370 WHERE Type = 'UNIT_PORTUGUESE_NAU'; -- replaces EE_CARRACK (originally PRIVATEER)
UPDATE Units SET Cost = 310, FaithCost = 410 WHERE Type = 'UNIT_EE_GALLEON'; -- Renaissance, takes place of FRIGATE
-- Enlightenment
UPDATE Units SET Cost = 400, FaithCost = 500 WHERE Type = 'UNIT_EE_LINE_INFANTRY';
UPDATE Units SET Cost = 400, FaithCost = 500 WHERE Type = 'UNIT_SWEDISH_CAROLEAN'; -- replaces EE_LINE_INF (originally TERCIO)
UPDATE Units SET Cost = 400, FaithCost = 500 WHERE Type = 'UNIT_AMERICAN_MINUTEMAN'; -- replaces EE_LINE_INF(originally MUSKETMAN)
UPDATE Units SET Cost = 450, FaithCost = 500 WHERE Type = 'UNIT_EE_SKIRMISHER';
UPDATE Units SET Cost = 475, FaithCost = 500 WHERE Type = 'UNIT_EE_DRAGOON';
UPDATE Units SET Cost = 475, FaithCost = 500 WHERE Type = 'UNIT_EE_FIELD_GUN';
UPDATE Units SET Cost = 475, FaithCost = 550 WHERE Type = 'UNIT_PRIVATEER'; -- (350p)
UPDATE Units SET Cost = 500, FaithCost = 550 WHERE Type = 'UNIT_FRIGATE'; -- (375p)
UPDATE Units SET Cost = 550, FaithCost = 550 WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE'; -- (375p) replaces FRIGATE
UPDATE Units SET Cost = 550, FaithCost = 550 WHERE Type = 'UNIT_EE_SHIP_OF_THE_LINE';
-- Industrial
UPDATE Units SET Cost = 700, FaithCost = 600 WHERE Type = 'UNIT_EE_UHLAN';
UPDATE Units SET Cost = 700, FaithCost = 600 WHERE Type = 'UNIT_RUSSIAN_COSSACK'; -- replaces EE_UHLAN

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) VALUES
('UNIT_2HANDER',		'BUILDINGCLASS_ARMORY'),
('UNIT_EE_CARRACK',		'BUILDINGCLASS_HARBOR'),
('UNIT_EE_GALLEON',		'BUILDINGCLASS_HARBOR'),
('UNIT_EE_SHIP_OF_THE_LINE','BUILDINGCLASS_HARBOR'),
('UNIT_EE_LINE_INFANTRY','BUILDINGCLASS_ARMORY'),
('UNIT_EE_FIELD_GUN', 	'BUILDINGCLASS_ARMORY'),
('UNIT_EE_ADVENTURER',	'BUILDINGCLASS_ARMORY'),
('UNIT_EE_SKIRMISHER',	'BUILDINGCLASS_ARMORY'),
('UNIT_EE_DRAGOON',		'BUILDINGCLASS_STABLE'),
('UNIT_EE_DRAGOON',     'BUILDINGCLASS_ARMORY'),
('UNIT_EE_UHLAN',		'BUILDINGCLASS_STABLE'),
('UNIT_EE_UHLAN',		'BUILDINGCLASS_ARMORY');

---------------------------------------------------------------------------------------------------------
-- Add new EE buildings as required for purchases
-- Gunsmith: Replace Armory and Military Academy for units in Industrial Era and Modern Era respectively.
-- Drydock: Replace Seaport, because Seaport is mutual exclusive with Train Station.
--			Coastal cities without Seaport are punished by not having able to purchase navy, this will fix that.
---------------------------------------------------------------------------------------------------------
/*
insert into Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
	select Type, 'BUILDINGCLASS_EE_DRYDOCK'
	from Units
	where Domain = 'DOMAIN_SEA' and PrereqTech in(
		select Type
		from Technologies
		where Era in ('ERA_INDUSTRIAL', 'ERA_MODERN', 'ERA_POSTMODERN', 'ERA_FUTURE'));

insert into Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
	select Type, 'BUILDINGCLASS_EE_GUNSMITH'
	from Units
	where Domain = 'DOMAIN_LAND' and PrereqTech in(
		select Type
		from Technologies
		where Era in ('ERA_INDUSTRIAL', 'ERA_MODERN'));
*/

UPDATE Unit_BuildingClassPurchaseRequireds SET
BuildingClassType = 'BUILDINGCLASS_EE_DRYDOCK'
WHERE BuildingClassType = 'BUILDINGCLASS_SEAPORT'
AND UnitType IN (SELECT Type FROM Units
				WHERE Domain = 'DOMAIN_SEA');

UPDATE Unit_BuildingClassPurchaseRequireds SET
BuildingClassType = 'BUILDINGCLASS_EE_GUNSMITH'
WHERE BuildingClassType IN ('BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
AND UnitType IN (SELECT Type FROM Units
				WHERE Domain = 'DOMAIN_LAND' AND PrereqTech IN (SELECT Type FROM Technologies
																WHERE Era IN ('ERA_INDUSTRIAL', 'ERA_MODERN')));

CREATE TRIGGER EE_DRYDOCK_BuildingClassPurchaseRequireds
AFTER INSERT ON Unit_BuildingClassPurchaseRequireds
WHEN NEW.BuildingClassType = 'BUILDINGCLASS_SEAPORT'
AND NEW.UnitType IN (SELECT Type FROM Units
					WHERE Domain = 'DOMAIN_SEA')
BEGIN
	UPDATE Unit_BuildingClassPurchaseRequireds SET
	BuildingClassType = 'BUILDINGCLASS_EE_DRYDOCK'
	WHERE BuildingClassType = NEW.BuildingClassType
	AND UnitType = NEW.UnitType;
END;

CREATE TRIGGER EE_GUNSMITH_BuildingClassPurchaseRequireds
AFTER INSERT ON Unit_BuildingClassPurchaseRequireds
WHEN NEW.BuildingClassType IN ('BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
AND NEW.UnitType IN (SELECT Type FROM Units
					WHERE Domain = 'DOMAIN_LAND' AND PrereqTech IN (SELECT Type FROM Technologies
																	WHERE Era IN ('ERA_INDUSTRIAL', 'ERA_MODERN')))
BEGIN
	UPDATE Unit_BuildingClassPurchaseRequireds SET
	BuildingClassType = 'BUILDINGCLASS_EE_GUNSMITH'
	WHERE NEW.BuildingClassType IN ('BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
	AND UnitType = NEW.UnitType;
END;

-------------------------------------------------------
-- Sounds
-------------------------------------------------------

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound) VALUES
('UNIT_EE_ADVENTURER',   'AS2D_SELECT_SCOUT',     'AS2D_BIRTH_SCOUT'),
('UNIT_EE_FIELD_GUN',    'AS2D_SELECT_CANNON',    'AS2D_BIRTH_CANNON'),
('UNIT_EE_LINE_INFANTRY','AS2D_SELECT_MUSKETMAN', 'AS2D_BIRTH_MUSKETMAN'),
('UNIT_EE_SKIRMISHER',   'AS2D_SELECT_CROSSBOWMAN','AS2D_BIRTH_CROSSBOWMAN'),
('UNIT_EE_DRAGOON',      'AS2D_SELECT_CAVALRY',   'AS2D_BIRTH_CAVALRY'),
('UNIT_EE_UHLAN',        'AS2D_SELECT_CAVALRY',   'AS2D_BIRTH_CAVALRY'),
('UNIT_EE_CARRACK',      'AS2D_SELECT_CARAVEL',   'AS2D_BIRTH_CARAVEL'),
('UNIT_EE_GALLEON',      'AS2D_SELECT_FRIGATE',   'AS2D_BIRTH_FRIGATE'),
('UNIT_EE_SHIP_OF_THE_LINE','AS2D_SELECT_CARAVEL','AS2D_BIRTH_CARAVEL');


----------------------------------------------------
-- Text (en_US)
----------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
-- Adventurer
('TXT_KEY_UNIT_EE_ADVENTURER', 'Adventurer'),
('TXT_KEY_UNIT_EE_ADVENTURER_HELP', 'Recon unit. Can see further and has additional movement while embarked.'),
('TXT_KEY_UNIT_EE_ADVENTURER_PEDIA', 'Throughout history there are those whose thirst for adventure led them from the safe confines of civilized lands. These adventurers, frequently funded by government stipends, would then journey into the unknown, charting their progress all the way. These expeditions, and the maps they helped create, became blueprints for the conquest and domestication of the once uncharted regions of the world.'),
('TXT_KEY_UNIT_EE_ADVENTURER_STRATEGY', 'An upgrade to the Explorer. The Adventurer has even more movement and strength, although is still quite weak. The Adventurer excels at sea exploration, as it is able to move further while embarked. Use it to finish meeting all the other Civilizations, or scout out locations for overseas colonies.'),
-- Carrack
('TXT_KEY_UNIT_EE_CARRACK', 'Carrack'),
('TXT_KEY_UNIT_EE_CARRACK_HELP', 'Early Renaissance Era melee naval unit used to gain early naval supremacy.'),
('TXT_KEY_UNIT_EE_CARRACK_PEDIA', 'Developed by the Genoese Republic for commercial purposes, a carrack is three- or four-masted sailing vessel. Utilized by Spain and Portugal for oceanic travel and exploration, the carrack was one of the most influential ship designs in history. Large and roomy to carry cargo across vast distances, they were used heavily across the Atlantic and Indian oceans, carrying new found wealth and resources back to the great cities of Europe. One of the most famous ships to go down a history, the Santa Maria, was a carrack that carried Columbus and his crew to discover the new world. Another famous ship of this design belongs to Vasco Da Gama, the Portuguese explorer who circumnavigated Africa, discovering a new route to spices of India. The end of the carrack came at the hands of the galleon. Developed from the carrack, the first galleons became a reality in the mid 16th century, though the carrack would persist for several more decades.'),
('TXT_KEY_UNIT_EE_CARRACK_STRATEGY', 'The Carrack upgrades from the Caravel. It allows you to better secure your coastal cities from seafaring Barbarians or counterattacks from enemy Civilizations. Its early increased combat strength means it can be used, with support, to take small cities with low Defensive Strength.'),
-- Dragoon
('TXT_KEY_UNIT_EE_DRAGOON', 'Dragoon'),
('TXT_KEY_UNIT_EE_DRAGOON_HELP', 'Ranged Enlightenment Era mounted unit, useful for flanking, harassment, and hit-and-run tactics.'),
('TXT_KEY_UNIT_EE_DRAGOON_PEDIA', 'The term "Dragoon" originally referred to a type of mounted infantry soldier that was used extensively in Europe during the 17th and 18th centuries. The name is thought to have come from the French word "dragon", which was a type of firearm that was carried by these soldiers. Dragoons were typically armed with muskets or carbines, as well as swords or sabers for close combat. They were highly versatile soldiers, capable of both fighting on horseback and dismounting to fight on foot. They were also often used for reconnaissance and other tasks that required mobility and speed. The Dragoon unit saw action in a number of major conflicts throughout history, including the Thirty Years'' War, the English Civil War, and the Napoleonic Wars. They were also used extensively in the colonization of the Americas, as well as in various conflicts in Asia and Africa. Today, the term "Dragoon" is often used to refer to mounted troops in general, regardless of whether they are actually part of a dragoon regiment or not. In many modern armies, units similar to the historical Dragoons continue to serve in a variety of roles, including reconnaissance, security, and special operations.'),
('TXT_KEY_UNIT_EE_DRAGOON_STRATEGY', 'Dragoons are Enlightenment Era units capable of rapid movement and ranged attacks. The Dragoon upgrades from the Cuirassier and fulfills largely the same role as its Renaissance predecessor. Use them to harass the enemy and support your war effort, but be careful about letting them get caught alone.'),
-- Field Gun
('TXT_KEY_UNIT_EE_FIELD_GUN', 'Field Gun'),
('TXT_KEY_UNIT_EE_FIELD_GUN_HELP', 'Enlightenment Era artillery unit. Moves at half-speed in enemy territory.'),
('TXT_KEY_UNIT_EE_FIELD_GUN_PEDIA', 'A field gun is a piece of light artillery that can be easily moved around the battlefield. During his wars in Europe, Napoleon used field guns to great effect. His employment of very large wheels allowed his guns to be quickly moved in the midst of battle, meaning enemy formations could be easily broken up. This strategy gradually became obsolete, however, as the development of road and rail, and the changing nature of the battlefield, allowed for most kinds of artillery to be moved at respectable speed.[NEWLINE][NEWLINE]By the beginning of the Second World War, the term "field gun" had come to mean any long-range artillery piece that fired at a low angle. However, because of the demand for artillery which could fire at both long-range and a high angle during the later stages of World War II, field guns became largely supplanted by howitzers, and today the term sees no widespread application.'),
('TXT_KEY_UNIT_EE_FIELD_GUN_STRATEGY', 'The Field Gun is the Enlightenment Era artillery unit. While its range remains the same as the Cannon, from which it upgrades, it is much stronger. Like other siege units, it cannot see very far and must be protected. It also moves at half-speed in enemy territory, but Field Guns are essential to Enlightenment conquests.'),
-- First Rate
('TXT_KEY_UNIT_EE_ENGLISH_FIRST_RATE', 'First Rate'),
('TXT_KEY_UNIT_EE_ENGLISH_FIRST_RATE_HELP', 'Powerful Enlightenment Era naval melee unit which boosts the defensive strength of adjacent friendly units.  Only the English may build it.'),
('TXT_KEY_UNIT_EE_ENGLISH_FIRST_RATE_PEDIA', '"First-rate" is the classification used for the largest ships of the line maintained by the British Royal Navy.  Throughout the existence of the rating system, the threshold armament and crew for a ship to be considered first-rate changed.  However, it was established in the early 1700s that a first-rate ship loaded for wartime carried at least 100 guns.  First-rates were very expensive, heavy and slow in exchange for their massive firepower.  As a result, few were maintained at any given time, and they often served as flagships.  HMS Victory, Admrial Nelson''s famous flagship from the Battle of Trafalgar, is the only surviving first-rate.'),
('TXT_KEY_UNIT_EE_ENGLISH_FIRST_RATE_STRATEGY', 'The First Rate is England''s unique unit, replacing the Ship of the Line. Like the Ship of the Line, it is a strong melee ship. However, it is even stronger than the unit it replaces. It also provides combat boosts to nearby allied ships when defending.  Use it as part of a larger fleet to greatly increase your naval firepower.'),
-- Galleon
('TXT_KEY_UNIT_EE_GALLEON', 'Galleon'),
('TXT_KEY_UNIT_EE_GALLEON_HELP', 'Renaissance Era ranged naval Unit. Can enter ocean tiles.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Land attacks can only be performed on Coastal Tiles.[ENDCOLOR]'),
('TXT_KEY_UNIT_EE_GALLEON_PEDIA', 'A galleon is the design of a multi-story sailing vessel attributed to the Venetians. Employed extensively in the fleets of Spain and other European states to further their naval militaristic interests, the galleon were formidable warships that weighed up to 2000 metric tonnes. The galleon was powered entirely by wind, using sails carried on three or four masts, with a lateen sail continuing to be used on the last (usually third and fourth) masts. They were used in both military and trade applications, most famously in the Spanish treasure fleet, and the Manila Galleons. Demoting the carrack to be used just for cargo, these vessels became the forefront of European armadas and went on to colonize the world.'),
('TXT_KEY_UNIT_EE_GALLEON_STRATEGY', 'The Galleon is a Renaissance naval unit. Upgrading from the Galleass, the Galleon is the first ranged ship to be able to enter Oceans. Use a fleet of Galleons, supported by larger ships, to conquer overseas cities and protect your overseas holdings.'),
-- Line Infantry
('TXT_KEY_UNIT_EE_LINE_INFANTRY', 'Line Infantry'),
('TXT_KEY_UNIT_EE_LINE_INFANTRY_HELP', 'Basic front-line infantry unit of the Enlightenment Era.'),
('TXT_KEY_UNIT_EE_LINE_INFANTRY_PEDIA', 'With the massive proliferation of guns from the middle of the 17th century, the battlefield became dominated by linear tactics, according to which infantry were arranged into long thin lines and fired volleys. A line consisted of 2, 3, or 4 ranks of soldiers. The relatively short range at which smooth bore muskets could accurately hit a target, added to the slow reload, meant that massed formation firing was essential for maximizing enemy casualties. The line was considered the fundamental battle formation as it allowed for the largest deployment of firepower. In the years following the Napoleonic Wars, line infantry continued to be deployed as the main battle force, while light infantry provided fire support and covered the movement of units. With the invention of new weaponry, the concept of line infantry began to wane; men walking in formation line-abreast became far too easy a target. The growing accuracy and rate of fire of rifles, together with the invention of the gatling gun and machine gun, meant that close order line infantry would suffer huge losses before being able to close with their foe. With the turn of the 20th Century, this slowly led to infantry increasingly adopting skirmisher style light infantry tactics in battle, while retaining line infantry drills for training.'),
('TXT_KEY_UNIT_EE_LINE_INFANTRY_STRATEGY', 'The standard gunpowder unit of the Enlightenment Era, upgrading from and significantly outclassing the Tercio. The Line Infantry will form the backbone of Enlightenment armies, being used to fight other melee units and protect siege and ranged units.'),
-- Light Infantry
('TXT_KEY_UNIT_EE_SKIRMISHER', 'Light Infantry'),
('TXT_KEY_UNIT_EE_SKIRMISHER_HELP', 'Primary ranged unit of the Enlightenment era which must be adjacent to attack.'),
('TXT_KEY_UNIT_EE_SKIRMISHER_PEDIA', 'Light Infantry act as a skirmish force stationed ahead or alongside a larger body of friendly troops to harass the enemy. In ancient and medieval warfare, skirmishers typically carried bows, javelins, or slings. Acting as light infantry with minimal armor, they could run ahead of the main battle line, release a volley, and retreat before the clash of the opposing main forces. During the Napoleonic Wars the role of the skirmisher took on new notability, attempting to disrupt enemy forces by firing into their close-packed ranks and potentially causing early casualties and breaking enemy formation. A skirmish force screening the main body of infantry became so important that eventually all the major European powers developed specialized skirmishing infantry, e.g. the German Jaeger and the French Voltigeurs. While muskets were the predominant weapon at the time, the British Army experimented with rifles, which soon became the predominant firearm. A consequence of these wars was a trend to train line troops to adopt skirmisher tactics. By the late 19th century, the concept of fighting in formation was on the wane, and the distinctions between skirmisher and heavy infantry have largely disappeared.'),
('TXT_KEY_UNIT_EE_SKIRMISHER_STRATEGY', 'The Light Infantry is a primary ranged unit of the Enlightenment Era. It is very well suited to fight in difficult terrain, like hills and forests.'),
-- Ship of the Line
('TXT_KEY_UNIT_EE_SHIP_OF_THE_LINE', 'Ship of the Line'),
('TXT_KEY_UNIT_EE_SHIP_OF_THE_LINE_HELP', 'Powerful Enlightenment Era naval melee Unit. Grants adjacent ships combat bonus.'),
('TXT_KEY_UNIT_EE_SHIP_OF_THE_LINE_STRATEGY', 'The Ship of the Line is a melee naval unit of the Enlightenment Era. Unlike the Corvette, the Ship of the Line requires Iron to build and maintain. However, a boost to combat strength and a critical boost to movement speed make it worth the price. Use it to crush outdated fleets with superior firepower and speed.'),
-- Uhlan
('TXT_KEY_UNIT_EE_UHLAN', 'Uhlan'),
('TXT_KEY_UNIT_EE_UHLAN_HELP', 'Mid game light cavalry unit good against other mounted units.'),
('TXT_KEY_UNIT_EE_UHLAN_PEDIA', 'The Uhlan was a Polish light cavalry unit armed with lances, sabres, and pistols which came to frequent the armies of 18th and 19th century Russia, Prussia, and Austria. Descendents of the Tartar settlers of Lithuania, the first Uhlan regiment was created by the Polish-Lithuanian Commonwealth in the early 1700s. Swift and unobstructed by the cumbersome armor which had previously dominated mounted warfare, the Uhlan quickly grew in popular use for their versatility and speed; able to conduct reconnaissance, skirmishes, or to head-on charges. Today, a ceremonial regiment of Uhlans is retained by the Polish Armed Forces.'),
('TXT_KEY_UNIT_EE_UHLAN_STRATEGY', 'The anti-cavalry movement unit of the Industrial Era, the Uhlan upgrades from the Lancer and fulfills largely the same role as its Renaissance predecessor.  Use it to directly counter the fast cavalry that enemies harass your invading armies with');

-- Caravel
UPDATE Language_en_US
SET Text = REPLACE(Text, 'Late-Medieval', 'Early-Medieval')
WHERE Tag IN ('TXT_KEY_UNIT_CARAVEL_HELP');

-- Corvette (ex. Privateer)
UPDATE Language_en_US
SET Text = 'Naval Unit that attacks as a melee unit. It is stronger and faster than the Carrack.'
WHERE Tag IN ('TXT_KEY_UNIT_PRIVATEER_STRATEGY');

-- Portugese Nau
UPDATE Language_en_US
SET Text = 'Melee naval unit which excels at sea exploration. Has higher Combat Strength than the Carrack, and can perform an ability when adjacent to City-States to earn [ICON_GOLD] Gold and XP. May only be built by the Portuguese. [NEWLINE][NEWLINE]If possible, when a Nau sells its Exotic Cargo, a Feitoria is [COLOR_POSITIVE_TEXT]automatically created[ENDCOLOR] in its territory.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_PORTUGUESE_NAU';
UPDATE Language_en_US
SET Text = 'This melee naval unit replaces the Carrack and is skilled at exploration. When it is in a tile next to land owned by another Civilization or City-State you are at peace with, it may perform a one-time trade mission to earn [ICON_GOLD] Gold and XP. The further the land is from your own capital, the greater the bonus, so it is best to use on distant players. Use this unit to explore the map and uncover the locations of other players.'
WHERE Tag = 'TXT_KEY_UNIT_PORTUGUESE_NAU_STRATEGY';

-- Swedish Carolean
UPDATE Language_en_US
SET Text = 'Caroleans are the backbone of the Enlightenment era Swedish army. They start with the March promotion that allows it to Heal every turn, even if it performs an action. The Carolean also receives a 15% combat bonus when stacked with a Great General, and deals damage to all adjacent units after advancing from killing a unit.'
WHERE Tag = 'TXT_KEY_UNIT_SWEDISH_CAROLEAN_STRATEGY';

-- Russian Cossack
UPDATE Language_en_US
SET Text = 'Only the Russians may build it. This Unit has a combat bonus when fighting enemies that have already taken damage, and is stronger than the Uhlan, which it replaces.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_COSSACK';
UPDATE Language_en_US
SET Text = 'The Cossack is the Russian unique unit, replacing the Uhlan. They are stronger than the Uhlan, and can also move after attacking. They get a combat bonus when battling damaged units. This makes Cossacks exceptionally strong at counter attacking, let the enemy chew up the front line peasants, then tear the weakened foe apart with a Cossack charge!'
WHERE Tag = 'TXT_KEY_UNIT_RUSSIAN_COSSACK_STRATEGY';

-- American Minuteman
UPDATE Language_en_US
SET Text = 'The Minuteman is the American unique unit, replacing the Line Infantry. The Minuteman can move through difficult terrain without penalty.'
WHERE Tag = 'TXT_KEY_UNIT_AMERICAN_MINUTEMAN_STRATEGY';
UPDATE Language_en_US
SET Text = 'Only the Americans may build it. This Unit may move through rough ground as though it were flat, unlike the Line Infantry which it replaces.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MINUTEMAN';

-- English First Rate (ranged)
UPDATE Language_en_US
SET Text = 'First Rate'
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE';



UPDATE Language_en_US
SET Text = 'The First Rate is the English unique unit, replacing the Frigate. The Ship of the Line has a higher Ranged Combat strength than the Frigate. It can also see one hex farther than the Frigate, allowing it to spot enemies in a significantly larger section of ocean. Like the frigate, it cannot fire on non-coastal land tiles.'
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE_STRATEGY';

-- Howitzer (VP's Field Gun)
DELETE FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_FIELD_GUN';
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_UNIT_FIELD_GUN', 'Howitzer'),
('TXT_KEY_UNIT_FIELD_GUN_HELP', 'Industrial Era artillery unit, more powerful than a Field Gun. Moves at half-speed in enemy territory.'),
('TXT_KEY_UNIT_FIELD_GUN_PEDIA', 'A howitzer is a type of artillery piece characterized by a relatively short barrel and the use of comparatively small propellant charges to propel projectiles over relatively high trajectories, with a steep angle of descent. Introduced to European armies in the middle of 18th century, these field howitzers were also able to fire explosive shells. In the 1860s, artillery officers discovered that rifled siege howitzers (substantially larger than field howitzers) were a more efficient means of destroying walls than smoothbore siege guns or siege mortars. The lightest of these weapons (later known as "light siege howitzers") had calibers around 150 mm and fired shells that weighed between 40 and 50 kilograms. The heaviest (later called "medium siege howitzers") had calibers between 200 mm and 220 mm and fired shells that weighed about 100 kilograms (220 pounds).'),
('TXT_KEY_UNIT_FIELD_GUN_STRATEGY', 'Industrial Era artillery unit, more powerful than a Field Gun. Moves at half-speed in enemy territory.');
