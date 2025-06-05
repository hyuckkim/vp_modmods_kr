----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- UNITS
-- 2018-02-01 Reworked by Infixo from EE & VP-EE mods + CAYM EDITED
-- 2023-11-06 Updated by CAYM to be compatible with VP 4.2.7
----------------------------------------------------

----------------------------------------------------
-- Generic info
-- UNIT_EE_SKIRMISHER is Light Infantry
----------------------------------------------------

INSERT INTO Units (Type, Class, PrereqTech, Combat, Moves, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI, AdvancedStartCost, UnitFlagIconOffset, PortraitIndex, GoodyHutUpgradeUnitClass) VALUES
('UNIT_EE_ADVENTURER',  'UNITCLASS_EE_ADVENTURER',  'TECH_EE_EXPLORATION',  24, 3, 1, 'UNITCOMBAT_RECON',       'DOMAIN_LAND','UNITAI_EXPLORE',     10, 6, 6,'UNITCLASS_COMMANDO'), -- UNIT_EE_EXPLORER in original EE
('UNIT_EE_FIELD_GUN',   'UNITCLASS_EE_FIELD_GUN',   'TECH_EE_FORTIFICATION',    14, 2, 1, 'UNITCOMBAT_SIEGE',       'DOMAIN_LAND','UNITAI_CITY_BOMBARD',30, 4, 4,'UNITCLASS_FIELD_GUN'),
('UNIT_EE_SKIRMISHER',  'UNITCLASS_EE_SKIRMISHER',  'TECH_EE_MANUFACTURING',28, 2, 1, 'UNITCOMBAT_ARCHER',      'DOMAIN_LAND','UNITAI_RANGED',      30, 2, 2,'UNITCLASS_GATLINGGUN'),
('UNIT_EE_DRAGOON',	'UNITCLASS_EE_DRAGOON',     'TECH_EE_MANUFACTURING',34, 5, 1, 'UNITCOMBAT_ARCHER',      'DOMAIN_LAND','UNITAI_RANGED',      30, 10,9,'UNITCLASS_CAVALRY'),
('UNIT_EE_UHLAN',       'UNITCLASS_EE_UHLAN',       'TECH_RIFLING',       48, 4, 1, 'UNITCOMBAT_MOUNTED',     'DOMAIN_LAND','UNITAI_FAST_ATTACK', 30, 3, 3,'UNITCLASS_WWI_TANK'),
('UNIT_EE_CARRACK',     'UNITCLASS_EE_CARRACK',     'TECH_EE_REFRACTION',   32, 4, 0, 'UNITCOMBAT_NAVALMELEE',  'DOMAIN_SEA', 'UNITAI_ATTACK_SEA',  50, 9,19,'UNITCLASS_PRIVATEER'),
('UNIT_EE_GALLEON',     'UNITCLASS_EE_GALLEON',     'TECH_NAVIGATION',      20, 4, 0, 'UNITCOMBAT_NAVALRANGED', 'DOMAIN_SEA', 'UNITAI_ASSAULT_SEA', 50, 5, 5,'UNITCLASS_CRUISER'),
('UNIT_EE_2HANDER',     'UNITCLASS_EE_2HANDER',     'TECH_CHEMISTRY',       28,  2, 1, 'UNITCOMBAT_MELEE',    'DOMAIN_LAND', 'UNITAI_ATTACK',  25,  33, 11, 'UNITCLASS_EE_LINE_INFANTRY'),
('UNIT_EE_LINE_INFANTRY', 'UNITCLASS_EE_LINE_INFANTRY', 'TECH_EE_FLINTLOCK',    31, 2, 1, 'UNITCOMBAT_GUN',         'DOMAIN_LAND','UNITAI_DEFENSE',     30, 1, 1,'UNITCLASS_RIFLEMAN');

UPDATE Units
SET Class = 'UNITCLASS_'||SUBSTR(Type,6), Description = 'TXT_KEY_'||Type,
	Civilopedia = 'TXT_KEY_'||Type||'_PEDIA', Strategy = 'TXT_KEY_'||Type||'_STRATEGY', Help = 'TXT_KEY_'||Type||'_HELP',
	MilitarySupport = 1, Pillage = 1, MilitaryProduction = 1, XPValueAttack = 3, XPValueDefense = 3, PurchaseCooldown = 1,
	UnitArtInfo = 'ART_DEF_'||Type, UnitFlagAtlas = 'ENLIGHTENMENT_UNIT_FLAG_ATLAS', IconAtlas = 'ENLIGHTENMENT_UNIT_ATLAS'
WHERE Type IN (
'UNIT_EE_ADVENTURER',
'UNIT_EE_FIELD_GUN',
'UNIT_EE_SKIRMISHER',
'UNIT_EE_DRAGOON',
'UNIT_EE_UHLAN',
'UNIT_EE_CARRACK',
'UNIT_EE_GALLEON',
'UNIT_EE_2HANDER',
'UNIT_EE_LINE_INFANTRY');

-- Exceptions
UPDATE Units SET UnitArtInfo = 'ART_DEF_UNIT_EE_EXPLORER' WHERE Type = 'UNIT_EE_ADVENTURER'; -- model has still an old name
UPDATE Units SET IconAtlas   = 'UNIT_ATLAS_2' WHERE Type = 'UNIT_EE_CARRACK';
UPDATE Units SET UnitFlagAtlas = 'UNIT_FLAG_ATLAS', UnitFlagIconOffset = 33 WHERE Type = 'UNIT_EE_2HANDER';  -- old landsknecht flag
-- Spanish Galleon Model Tweaks
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 1 WHERE UnitInfoType = 'ART_DEF_UNIT_U_SPANISH_GALLEON';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13, Model = 'mod_spanish_galleon.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SPANISH_GALLEON';
UPDATE Units SET UnitArtInfo = 'ART_DEF_UNIT_U_SPANISH_GALLEON' WHERE Type = 'UNIT_EE_GALLEON';

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_UNIT_U_SPANISH_GALLEON', 'Unit', 'sv_Galleon.dds');

-- Ships
UPDATE Units
SET MoveRate = 'WOODEN_BOAT', HurryCostModifier = 20, Mechanized = 1, MinAreaSize = 10
WHERE Type IN (
'UNIT_EE_CARRACK',
'UNIT_EE_GALLEON');

INSERT INTO UnitClasses (Type, DefaultUnit, Description)
SELECT 'UNITCLASS_'||SUBSTR(Type,6), Type, 'TXT_KEY_'||Type
FROM Units
WHERE Type IN (
'UNIT_EE_ADVENTURER',
'UNIT_EE_FIELD_GUN',
'UNIT_EE_SKIRMISHER',
'UNIT_EE_DRAGOON',
'UNIT_EE_UHLAN',
'UNIT_EE_CARRACK',
'UNIT_EE_GALLEON',
'UNIT_EE_2HANDER',
'UNIT_EE_LINE_INFANTRY');

----------------------------------------------------
-- Unit Lines - auto based on GoodyHutUpgradeUnitClass
----------------------------------------------------

INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
SELECT Type, GoodyHutUpgradeUnitClass
FROM Units
WHERE Type IN (
'UNIT_EE_ADVENTURER',
'UNIT_EE_FIELD_GUN',
'UNIT_EE_SKIRMISHER',
'UNIT_EE_DRAGOON',
'UNIT_EE_UHLAN',
'UNIT_EE_CARRACK',
'UNIT_EE_GALLEON',
'UNIT_EE_2HANDER',
'UNIT_EE_LINE_INFANTRY');

----------------------------------------------------
-- Unit AI
----------------------------------------------------

INSERT INTO Unit_AITypes (UnitType, UnitAIType) VALUES
('UNIT_EE_ADVENTURER','UNITAI_EXPLORE'),
('UNIT_EE_FIELD_GUN', 'UNITAI_CITY_BOMBARD'),
('UNIT_EE_FIELD_GUN', 'UNITAI_RANGED'),
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
('UNIT_EE_2HANDER', 'UNITAI_ATTACK'),
('UNIT_EE_2HANDER', 'UNITAI_DEFENSE'),
('UNIT_EE_LINE_INFANTRY', 'UNITAI_ATTACK'),
('UNIT_EE_LINE_INFANTRY', 'UNITAI_DEFENSE'),
('UNIT_EE_LINE_INFANTRY', 'UNITAI_EXPLORE');

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

-----------------------------
-- Bandeirantes
-------------------------------------------------------
-- BANDEIRANTES
UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_EE_ADVENTURER' WHERE UnitType = 'UNIT_BANDEIRANTES';
UPDATE Units SET Class = 'UNITCLASS_EE_ADVENTURER' WHERE Type = 'UNIT_BANDEIRANTES';
UPDATE Units SET PrereqTech = 'TECH_GUNPOWDER' WHERE Type = 'UNIT_BANDEIRANTES';
UPDATE Units SET Combat = '28' WHERE Type = 'UNIT_BANDEIRANTES';
UPDATE Units SET Cost = '300' WHERE Type = 'UNIT_BANDEIRANTES';
UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_COMMANDO' WHERE UnitType = 'UNIT_BANDEIRANTES';

-------------------------------------------------------
-- Dragoon
-------------------------------------------------------

INSERT INTO Trait_FreePromotionUnitClass
	(TraitType, UnitClassType, PromotionType)
VALUES
	('TRAIT_TERROR', 'UNITCLASS_EE_DRAGOON', 'PROMOTION_MONGOL_TERROR');

UPDATE Units
SET RangedCombat = 26, Range = 1, MoveRate = 'QUADRUPED',
	IsMounted = (SELECT IsMounted FROM Units WHERE Type = 'UNIT_CUIRASSIER'),
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

---------------------------------------------
-- Austrian Hussar to Dragoon
---------------------------------------------

UPDATE Units SET
ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_ANTI_TANK_GUN'),
GoodyHutUpgradeUnitClass = 'UNITCLASS_CAVALRY',
PrereqTech = 'TECH_EE_MANUFACTURING',
Class = 'UNITCLASS_EE_DRAGOON'
WHERE Type IN ('UNIT_AUSTRIAN_HUSSAR');

UPDATE Civilization_UnitClassOverrides SET 
UnitClassType = 'UNITCLASS_EE_DRAGOON' 
WHERE UnitType IN ('UNIT_AUSTRIAN_HUSSAR');

UPDATE Unit_BuildingClassPurchaseRequireds SET 
BuildingClassType = 'BUILDINGCLASS_EE_GUNSMITH' 
WHERE BuildingClassType = 'BUILDINGCLASS_ARMORY' AND
UnitType IN ('UNIT_AUSTRIAN_HUSSAR');

UPDATE Unit_ClassUpgrades
SET UnitClassType = (SELECT GoodyHutUpgradeUnitClass FROM Units WHERE Type = UnitType)
WHERE UnitType IN ('UNIT_AUSTRIAN_HUSSAR');

UPDATE Units SET 
Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_EE_DRAGOON') + 1,
RangedCombat = (SELECT RangedCombat FROM Units WHERE Type = 'UNIT_EE_DRAGOON') + 1
WHERE Type = 'UNIT_AUSTRIAN_HUSSAR';

-------------------------------------------------------
-- Uhlan
-------------------------------------------------------

UPDATE Units
SET MoveRate = 'QUADRUPED', BaseLandAirDefense = 2,
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

-- lancer doesnt have this no more
--INSERT INTO Unit_FreePromotions
--		(UnitType, PromotionType)
--VALUES
--('UNIT_EE_UHLAN', 'PROMOTION_ANTI_MOUNTED_I');

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

UPDATE Units SET 
ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_TANK'),
GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_UHLAN'
WHERE Type IN ('UNIT_OTTOMAN_SIPAHI', 'UNIT_POLISH_WINGED_HUSSAR');

UPDATE Unit_ClassUpgrades
SET UnitClassType = (SELECT GoodyHutUpgradeUnitClass FROM Units WHERE Type = UnitType)
WHERE UnitType IN ('UNIT_OTTOMAN_SIPAHI', 'UNIT_POLISH_WINGED_HUSSAR');

UPDATE Units SET Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_LANCER') + 1 WHERE Type = 'UNIT_POLISH_WINGED_HUSSAR';

-- Hakkapeliitta
UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_EE_UHLAN' WHERE UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA';
UPDATE Units SET 
ObsoleteTech = 'TECH_COMBUSTION',
GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_UHLAN' 
WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';

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

UPDATE Unit_Flavors SET Flavor = '0' WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND FlavorType = 'FLAVOR_RANGED';
UPDATE Unit_Flavors SET Flavor = '20' WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND FlavorType = 'FLAVOR_OFFENSE';
UPDATE Unit_Flavors SET Flavor = '15' WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND FlavorType = 'FLAVOR_DEFENSE';
UPDATE Unit_Flavors SET Flavor = '10' WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND FlavorType = 'FLAVOR_MOBILE';

-------------------------------------------------------
-- Marksman
-------------------------------------------------------
UPDATE Units SET 
RangedCombat = 37, 
Range = 2,
ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_GATLINGGUN')
WHERE Type = 'UNIT_EE_SKIRMISHER';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
SELECT 'UNIT_EE_SKIRMISHER', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MUSKETMAN';

-- Musketman -> Light Infantry
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_SKIRMISHER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_MUSKETMAN');

UPDATE Units SET 
ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_SKIRMISHER'),
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

-----------------------------
-- Minuteman
-----------------------------

UPDATE Units SET 
ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_MACHINE_GUN'),
GoodyHutUpgradeUnitClass = 'UNITCLASS_GATLINGGUN',
Class = 'UNITCLASS_EE_SKIRMISHER',
PrereqTech = 'TECH_EE_MANUFACTURING',
Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_EE_SKIRMISHER') + 1,
RangedCombat = (SELECT RangedCombat FROM Units WHERE Type = 'UNIT_EE_SKIRMISHER') + 1 
WHERE Type IN ('UNIT_AMERICAN_MINUTEMAN');

UPDATE Civilization_UnitClassOverrides SET 
UnitClassType = 'UNITCLASS_EE_SKIRMISHER' 
WHERE UnitType IN ('UNIT_AMERICAN_MINUTEMAN');

UPDATE Unit_ClassUpgrades
SET UnitClassType = (SELECT GoodyHutUpgradeUnitClass FROM Units WHERE Type = UnitType)
WHERE UnitType IN ('UNIT_AMERICAN_MINUTEMAN');

UPDATE Unit_BuildingClassPurchaseRequireds SET 
BuildingClassType = 'BUILDINGCLASS_EE_GUNSMITH' 
WHERE BuildingClassType = 'BUILDINGCLASS_ARMORY' AND
UnitType IN ('UNIT_AMERICAN_MINUTEMAN');

-------------------------------------------------------
-- Field Gun and Howitzer
-------------------------------------------------------
-- UNIT_FIELD_GUN is VP's Field Gun, which will be renamed to Howitzer

UPDATE Units
SET RangedCombat = 35, 
Range = 2, 
MoveRate = 'ARTILLERY',
ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_FIELD_GUN')
WHERE Type = 'UNIT_EE_FIELD_GUN';

INSERT INTO Unit_ResourceQuantityRequirements
	(UnitType, ResourceType, Cost)
SELECT 'UNIT_EE_FIELD_GUN', ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_FIELD_GUN';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_EE_FIELD_GUN', PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_FIELD_GUN';

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EE_FIELD_GUN' AND PromotionType = 'PROMOTION_INDIRECT_FIRE';

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_FIELD_GUN'
WHERE Type = 'UNITCLASS_FIELD_GUN';

UPDATE Units
SET Description = 'TXT_KEY_UNIT_FIELD_GUN', 
Civilopedia = 'TXT_KEY_UNIT_FIELD_GUN_PEDIA', 
Strategy = 'TXT_KEY_UNIT_FIELD_GUN_STRATEGY', 
Help = 'TXT_KEY_UNIT_FIELD_GUN_HELP'
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

UPDATE Units SET 
Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_EE_CARRACK') + 4, 
Moves = 5,
Class = 'UNITCLASS_EE_CARRACK',
PrereqTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_CARRACK'),
ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_IRONCLAD'),
GoodyHutUpgradeUnitClass = 'UNITCLASS_PRIVATEER'
WHERE Type = 'UNIT_PORTUGUESE_NAU';

UPDATE Unit_ClassUpgrades SET UnitClassType = (SELECT GoodyHutUpgradeUnitClass FROM Units WHERE Type = UnitType) WHERE UnitType = 'UNIT_PORTUGUESE_NAU';

-----------------------------
-- Beggar changed
------------------------------
UPDATE Units SET 
PrereqTech = 'TECH_EE_REFRACTION',	
ObsoleteTech = 'TECH_INDUSTRIALIZATION',
Class = 'UNITCLASS_EE_CARRACK'
WHERE Type = 'UNIT_DUTCH_SEA_BEGGAR';

UPDATE Civilization_UnitClassOverrides SET 
UnitClassType = 'UNITCLASS_EE_CARRACK' 
WHERE UnitType IN ('UNIT_DUTCH_SEA_BEGGAR');

-------------------------------------------------------
-- Carrack
-------------------------------------------------------

UPDATE Units SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_PRIVATEER') WHERE Type = 'UNIT_EE_CARRACK';

-- Caravel -> Carrack
UPDATE Units
SET 
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_CARRACK'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_CARRACK'
WHERE Type = 'UNIT_CARAVEL';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_CARRACK'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_CARAVEL');

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

-- Caravel UUs now obsolete on Corvette and upgrade to Carrack
UPDATE Units SET PrereqTech = 'TECH_EE_WARSHIPS' WHERE Class = 'UNITCLASS_PRIVATEER';

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
END;

-------------------------------------------------------
-- Ranged Ships
-------------------------------------------------------

-- Frigate changes
UPDATE Units
SET PrereqTech = 'TECH_EE_WARSHIPS'
WHERE Class IN ('UNITCLASS_FRIGATE', 'UNITCLASS_PRIVATEER');

UPDATE Units SET 
RangedCombat = 29, Range = 1,
ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_CRUISER')
WHERE Type = 'UNIT_EE_GALLEON';

-- compatibility with torpedo boat
UPDATE Units
SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_TORPEDO')
WHERE Type = 'UNIT_EE_GALLEON' AND EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_TORPEDO');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
SELECT 'UNIT_EE_GALLEON', PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GALLEASS';
-- but galleon can move over ocean fine
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EE_GALLEON' AND PromotionType = 'PROMOTION_OCEAN_HALF_MOVES';

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

-- Dromon UUs now obsolete on Galleon
UPDATE Units
SET Combat = Combat + 2, Cost = Cost + 10,
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_GALLEON')
WHERE Class = 'UNITCLASS_BYZANTINE_DROMON' AND Type != 'UNIT_BYZANTINE_DROMON';

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

---------------------------------------------------
-- 2Hander
---------------------------------------------------
UPDATE Units SET 
ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY')
WHERE Type = 'UNIT_EE_2HANDER';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_2HANDER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_LONGSWORDSMAN');

UPDATE Units
SET ObsoleteTech = 'TECH_CHEMISTRY', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_2HANDER'
WHERE Type = 'UNIT_LONGSWORDSMAN';

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_EE_2HANDER', 'RESOURCE_IRON', 1);

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_EE_2HANDER','PROMOTION_FIELD_WORKS_0'),
('UNIT_EE_2HANDER', 'PROMOTION_2HANDER');

--------------------------
-- Musketeer and Landsknecht
-------------------------

INSERT INTO Unit_ResourceQuantityRequirements 
	(UnitType, ResourceType, Cost)
VALUES 
	('UNIT_FRENCH_MUSKETEER', 'RESOURCE_IRON', 1),
	('UNIT_GERMAN_LANDSKNECHT', 'RESOURCE_IRON', 1);

UPDATE Civilization_UnitClassOverrides 
SET UnitClassType = 'UNITCLASS_EE_2HANDER'
WHERE UnitType IN ('UNIT_FRENCH_MUSKETEER', 'UNIT_GERMAN_LANDSKNECHT');

UPDATE Units SET
Class = 'UNITCLASS_EE_2HANDER',
Combat = 30,
PrereqTech = 'TECH_CHEMISTRY'
WHERE Type = 'UNIT_FRENCH_MUSKETEER';

UPDATE Units SET
Class = 'UNITCLASS_EE_2HANDER', 
PrereqTech = 'TECH_CHEMISTRY',
Combat = 28,
Cost = 300,
IconAtlas = 'ENLIGHTENMENT_UNIT_ATLAS',
PortraitIndex = 10,
UnitFlagIconOffset = 0, UnitFlagAtlas = 'UNIT_FLAG_LANDSKNECHT_ATLAS'
WHERE Type = 'UNIT_GERMAN_LANDSKNECHT';

DELETE FROM Unit_FreePromotions WHERE UnitType IN ('UNIT_GERMAN_LANDSKNECHT');

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_GERMAN_LANDSKNECHT', 'PROMOTION_FIELD_WORKS_0'),
('UNIT_GERMAN_LANDSKNECHT', 'PROMOTION_2HANDER'),
('UNIT_GERMAN_LANDSKNECHT', 'PROMOTION_FORMATION_1'),
('UNIT_GERMAN_LANDSKNECHT', 'PROMOTION_FORMATION_2');

--------------------------------
-- Tercio
------------------------------

DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_FIELD_WORKS_0' AND UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_TERCIO');

-- impi
INSERT INTO Unit_FreePromotions (UnitType, PromotionType) 
VALUES ('UNIT_ZULU_IMPI', 'PROMOTION_COVER_1');

INSERT OR REPLACE INTO UnitPromotions_UnitCombatMods
	(PromotionType, UnitCombatType, Modifier)
VALUES
	('PROMOTION_KNOCKOUT', 'UNITCOMBAT_GUN', 33);

----------------------------
-- pioneers
---------------------------
UPDATE Units SET PrereqTech = 'TECH_ASTRONOMY' WHERE Type = 'UNIT_PIONEER';

------------------------------
-- Line Infantry 
-----------------------------

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE Type = 'UNIT_2HANDER';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE UnitType = 'UNIT_2HANDER';

UPDATE Units Set GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_2HANDER' WHERE Type = 'UNIT_DANISH_BERSERKER';
UPDATE Units Set ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY') WHERE Type = 'UNIT_DANISH_BERSERKER';
UPDATE Units Set GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_2HANDER' WHERE Type = 'UNIT_JAPANESE_SAMURAI';
UPDATE Units Set ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY') WHERE Type = 'UNIT_JAPANESE_SAMURAI';

UPDATE Units
SET Conscription = 5,
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

-------------------------------------------------------
-- Swedish Carolean, used in period 1680-1720
-- Most of the infantry were equipped with modern flintlock muskets, although older versions still were in use. They were also equipped with rapiers and a bag for ammunition.
-- Switch to Line Infantry, available early EE
-------------------------------------------------------

UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY' WHERE  UnitType = 'UNIT_SWEDISH_CAROLEAN';

UPDATE Units
SET Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY') + 3,
	Class = 'UNITCLASS_EE_LINE_INFANTRY',
	PrereqTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY'),
	ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_GREAT_WAR_INFANTRY'),
	GoodyHutUpgradeUnitClass = 'UNITCLASS_RIFLEMAN'
WHERE Type = 'UNIT_SWEDISH_CAROLEAN';

UPDATE Unit_ClassUpgrades SET UnitClassType = (SELECT GoodyHutUpgradeUnitClass FROM Units WHERE Type = UnitType) WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN';

UPDATE Unit_Flavors SET Flavor = '20' WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN' AND FlavorType = 'FLAVOR_OFFENSE';
UPDATE Unit_Flavors SET Flavor = '20' WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN' AND FlavorType = 'FLAVOR_DEFENSE';

UPDATE Unit_BuildingClassPurchaseRequireds SET 
BuildingClassType = 'BUILDINGCLASS_EE_GUNSMITH' 
WHERE BuildingClassType = 'BUILDINGCLASS_ARMORY' AND
UnitType IN ('UNIT_SWEDISH_CAROLEAN');

-------------------------------------------------------
-- Align flavors
-------------------------------------------------------

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_EE_ADVENTURER',	'FLAVOR_RECON',  12),
('UNIT_EE_FIELD_GUN',	'FLAVOR_OFFENSE', 11),
('UNIT_EE_FIELD_GUN',	'FLAVOR_DEFENSE', 8),
('UNIT_EE_FIELD_GUN',	'FLAVOR_RANGED', 11),
('UNIT_EE_SKIRMISHER',	'FLAVOR_OFFENSE', 9),
('UNIT_EE_SKIRMISHER',	'FLAVOR_DEFENSE', 10),
('UNIT_EE_SKIRMISHER',	'FLAVOR_RANGED',  12),
('UNIT_EE_DRAGOON',	'FLAVOR_OFFENSE', 9),
('UNIT_EE_DRAGOON',	'FLAVOR_DEFENSE', 7),
('UNIT_EE_DRAGOON',	'FLAVOR_RANGED',  8),
('UNIT_EE_DRAGOON',	'FLAVOR_MOBILE',  10),
('UNIT_EE_UHLAN',	'FLAVOR_OFFENSE', 12),
('UNIT_EE_UHLAN',	'FLAVOR_DEFENSE', 4),
('UNIT_EE_UHLAN',	'FLAVOR_MOBILE',  9),
('UNIT_EE_CARRACK',	'FLAVOR_NAVAL',  18),
('UNIT_EE_CARRACK',	'FLAVOR_NAVAL_RECON', 23),
('UNIT_EE_GALLEON',	'FLAVOR_NAVAL',  20),
('UNIT_EE_GALLEON',	'FLAVOR_NAVAL_RECON', 10),
('UNIT_EE_2HANDER', 'FLAVOR_OFFENSE', 13),
('UNIT_EE_2HANDER', 'FLAVOR_DEFENSE', 12),
('UNIT_EE_LINE_INFANTRY','FLAVOR_OFFENSE', 14),
('UNIT_EE_LINE_INFANTRY','FLAVOR_DEFENSE', 14);

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
UPDATE Units SET Cost = 325, FaithCost = 400 WHERE Type = 'UNIT_EE_2HANDER';
UPDATE Units SET Cost = 350, FaithCost = 400 WHERE Type = 'UNIT_EE_CARRACK'; -- Renaissance
UPDATE Units SET Cost = 350, FaithCost = 400 WHERE Type = 'UNIT_DUTCH_SEA_BEGGAR'; -- (350p)
UPDATE Units SET Cost = 350, FaithCost = 400 WHERE Type = 'UNIT_PORTUGUESE_NAU'; -- replaces EE_CARRACK (originally PRIVATEER)
UPDATE Units SET Cost = 325, FaithCost = 450 WHERE Type = 'UNIT_EE_ADVENTURER';
UPDATE Units SET Cost = 400, FaithCost = 450 WHERE Type = 'UNIT_EE_GALLEON'; 
-- Enlightenment 
UPDATE Units SET Cost = 500, FaithCost = 500 WHERE Type = 'UNIT_EE_FIELD_GUN';
UPDATE Units SET Cost = 400, FaithCost = 500 WHERE Type = 'UNIT_PRIVATEER'; -- (350p)
UPDATE Units SET Cost = 475, FaithCost = 550 WHERE Type = 'UNIT_EE_SKIRMISHER';
UPDATE Units SET Cost = 475, FaithCost = 500 WHERE Type = 'UNIT_AMERICAN_MINUTEMAN';
UPDATE Units SET Cost = 500, FaithCost = 550 WHERE Type = 'UNIT_EE_DRAGOON';
UPDATE Units SET Cost = 500, FaithCost = 550 WHERE Type = 'UNIT_FRIGATE'; -- (475p)
UPDATE Units SET Cost = 500, FaithCost = 550 WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE'; -- (375p) replaces FRIGATE
UPDATE Units SET Cost = 400, FaithCost = 500 WHERE Type = 'UNIT_EE_LINE_INFANTRY';
UPDATE Units SET Cost = 400, FaithCost = 500 WHERE Type = 'UNIT_SWEDISH_CAROLEAN'; -- replaces EE_LINE_INF (originally TERCIO)
-- Industrial
UPDATE Units SET Cost = 700, FaithCost = 600 WHERE Type = 'UNIT_EE_UHLAN';
UPDATE Units SET Cost = 700, FaithCost = 600 WHERE Type = 'UNIT_RUSSIAN_COSSACK'; -- replaces EE_UHLAN

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) VALUES
('UNIT_EE_2HANDER',		'BUILDINGCLASS_ARMORY'),
('UNIT_EE_CARRACK',		'BUILDINGCLASS_HARBOR'),
('UNIT_EE_GALLEON',		'BUILDINGCLASS_HARBOR'),
('UNIT_EE_FIELD_GUN', 		'BUILDINGCLASS_ARMORY'),
('UNIT_EE_FIELD_GUN', 		'BUILDINGCLASS_WORKSHOP'),
('UNIT_EE_ADVENTURER',		'BUILDINGCLASS_ARMORY'),
('UNIT_EE_SKIRMISHER',		'BUILDINGCLASS_EE_GUNSMITH'),
('UNIT_EE_DRAGOON',		'BUILDINGCLASS_STABLE'),
('UNIT_EE_DRAGOON',     	'BUILDINGCLASS_EE_GUNSMITH'),
('UNIT_EE_UHLAN',		'BUILDINGCLASS_STABLE'),
('UNIT_EE_UHLAN',		'BUILDINGCLASS_EE_GUNSMITH'),
('UNIT_EE_LINE_INFANTRY',       'BUILDINGCLASS_EE_GUNSMITH');

---------------------------------------------------------------------------------------------------------
-- Add new EE buildings as required for purchases
-- Gunsmith: Replace Armory and Military Academy for units in Industrial Era and Modern Era respectively.
-- Drydock: Replaces Seaport temporarily
---------------------------------------------------------------------------------------------------------

UPDATE Unit_BuildingClassPurchaseRequireds SET
BuildingClassType = 'BUILDINGCLASS_EE_DRYDOCK'
WHERE BuildingClassType = 'BUILDINGCLASS_SEAPORT'
AND UnitType IN (SELECT Type FROM Units	WHERE Domain = 'DOMAIN_SEA' AND 
  PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_INDUSTRIAL')));

UPDATE Unit_BuildingClassPurchaseRequireds SET
BuildingClassType = 'BUILDINGCLASS_EE_GUNSMITH'
WHERE BuildingClassType IN ('BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
AND UnitType IN (SELECT Type FROM Units	WHERE Domain = 'DOMAIN_LAND' AND 
  PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_INDUSTRIAL', 'ERA_MODERN')));

CREATE TRIGGER EE_DRYDOCK_BuildingClassPurchaseRequireds
AFTER INSERT ON Unit_BuildingClassPurchaseRequireds
WHEN NEW.BuildingClassType = 'BUILDINGCLASS_SEAPORT'
AND NEW.UnitType IN (SELECT Type FROM Units WHERE Domain = 'DOMAIN_SEA' AND 
  PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_INDUSTRIAL')))

BEGIN
	UPDATE Unit_BuildingClassPurchaseRequireds SET
	BuildingClassType = 'BUILDINGCLASS_EE_DRYDOCK'
	WHERE BuildingClassType = NEW.BuildingClassType
	AND UnitType = NEW.UnitType;
END;

CREATE TRIGGER EE_GUNSMITH_BuildingClassPurchaseRequireds
AFTER INSERT ON Unit_BuildingClassPurchaseRequireds
WHEN NEW.BuildingClassType IN ('BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
AND NEW.UnitType IN (SELECT Type FROM Units WHERE Domain = 'DOMAIN_LAND' AND 
  PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_INDUSTRIAL', 'ERA_MODERN')))
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
('UNIT_EE_SKIRMISHER',   'AS2D_SELECT_CROSSBOWMAN','AS2D_BIRTH_CROSSBOWMAN'),
('UNIT_EE_DRAGOON',      'AS2D_SELECT_CAVALRY',   'AS2D_BIRTH_CAVALRY'),
('UNIT_EE_UHLAN',        'AS2D_SELECT_CAVALRY',   'AS2D_BIRTH_CAVALRY'),
('UNIT_EE_CARRACK',      'AS2D_SELECT_CARAVEL',   'AS2D_BIRTH_CARAVEL'),
('UNIT_EE_GALLEON',      'AS2D_SELECT_FRIGATE',   'AS2D_BIRTH_FRIGATE'),
('UNIT_EE_2HANDER',      'AS2D_SELECT_LONGSWORDSMAN',   'AS2D_BIRTH_LONGSWORDSMAN'),
('UNIT_EE_LINE_INFANTRY','AS2D_SELECT_MUSKETMAN', 'AS2D_BIRTH_MUSKETMAN');
