-- ============================
-- Ranger (Paratrooper)
-- the return, the revenge
-- ==============================

CREATE TRIGGER ColonialRanger
AFTER INSERT ON Civilization_JFD_CultureTypes WHEN NEW.CultureType = 'CULTURE_JFD_COLONIAL'
BEGIN
	INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
	SELECT
		NEW.CivilizationType, 'UNITCLASS_PARATROOPER', 'UNIT_BRAZILIAN_PRACINHA';
END;

INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
SELECT
	CivilizationType, 'UNITCLASS_PARATROOPER', 'UNIT_BRAZILIAN_PRACINHA'
FROM Civilization_JFD_CultureTypes WHERE CultureType = 'CULTURE_JFD_COLONIAL';

UPDATE Units SET
Combat = 50,
Cost = 950,
FaithCost = 900,
MinorCivGift = 0,
Class = 'UNITCLASS_PARATROOPER',
CombatClass = 'UNITCOMBAT_RECON',
--UnitArtInfo = 'ART_DEF_UNIT_PARATROOPER',
--UnitFlagAtlas = 'UNIT_FLAG_ATLAS',
--UnitFlagIconOffset = 59,
IconAtlas = 'CD_MILITARY_ATLAS',
PortraitIndex = 9,
DefaultUnitAI = 'UNITAI_PARADROP',
BaseLandAirDefense = 5,
PrereqTech = 'TECH_FLIGHT',
ObsoleteTech = 'TECH_LASERS'
WHERE Type = 'UNIT_BRAZILIAN_PRACINHA';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
SELECT
	'UNIT_BRAZILIAN_PRACINHA', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PARATROOPER';

--VALUES
--	('UNIT_BRAZILIAN_PRACINHA', 'PROMOTION_DFPS'),
--	('UNIT_BRAZILIAN_PRACINHA', 'PROMOTION_SURVIVALISM_1'),
--	('UNIT_BRAZILIAN_PRACINHA', 'PROMOTION_PRIDE_OF_THE_NATION');

INSERT INTO Unit_AITypes
	(UnitType, UnitAIType)
VALUES
	('UNIT_BRAZILIAN_PRACINHA', 'UNITAI_EXPLORE'),
	('UNIT_BRAZILIAN_PRACINHA', 'UNITAI_PARADROP');

UPDATE Unit_ClassUpgrades SET
UnitClassType = 'UNITCLASS_MARINE'
WHERE UnitType = 'UNIT_BRAZILIAN_PRACINHA';

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_MARINE' WHERE UnitType = 'UNIT_BRAZILIAN_PRACINHA';

UPDATE Language_en_US
SET Text = 'Airborne Ranger'
WHERE Tag = 'TXT_KEY_UNIT_BRAZILIAN_PRACINHA';

UPDATE Language_en_US
SET Text = 'Requires the [ICON_CULTURE_JFD_COLONIAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_COLONIAL_SHORT_DESC}[ENDCOLOR] Cultural Group.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_BRAZILIAN_PRACINHA';

-- Is stronger than the Paratrooper it replaces, and starts with the [COLOR_POSITIVE_TEXT]DFPs[ENDCOLOR] Promotion usually given to Gun Units like an Infantry. Starts with the [COLOR_POSITIVE_TEXT]Survivalism I[ENDCOLOR] Promotion. Earns [ICON_GOLDEN_AGE] Golden Age Points equal to 10x the [ICON_STRENGTH] Combat Strength of defeated Enemy Units.

UPDATE Language_en_US
SET Text = 'The Airborne Ranger is significantly tougher than the Paratrooper. In particular, between Survivalism I and DFPs it is much bulkier and can therefore hold the ground it drops into much more effectively. If you can successfully use these Units in an assault, you will be rewarded with large amounts of Golden Age Points -- Rangers lead the way!'
WHERE Tag = 'TXT_KEY_UNIT_BRAZILIAN_PRACINHA_STRATEGY';

UPDATE Language_en_US
SET Text = 'The term "ranger" has been used since the 17th century to describe specialized, elite light infantry. In America today the 75th Ranger Regiment is an elite airborne light infantry combat formation within the United States Army Special Operations Command (USASOC), and traces its lineage to three of six battalions raised in World War II, and to the 5307th Composite Unit known as "Merrill''s Marauders", which fought in the Southeast Asian theater. The six battalions of the modern Rangers have been deployed in Korea, Vietnam, Grenada, Panama, Afghanistan and Iraq.[NEWLINE][NEWLINE]Similarly in South America, the Brazilian Expeditionary Force, nicknamed Cobras Fumantes, was a military division of the Brazilian Army and Air Force that fought as part of Allied forces in the Mediterranean Theatre of World War II. It numbered around 25,900 men, including a full infantry division, liaison flight, and fighter squadron. By the end of the war, it took 20,573 Axis prisoners, including two generals and close to 900 officers.'
WHERE Tag = 'TXT_KEY_CIV5_BRAZILIAN_PRACINHA_TEXT';

-- =======================
-- Rum (Unique Improvement and Resource)
-- =======================

INSERT INTO Trait_BuildsUnitClasses
	(TraitType, UnitClassType, BuildType)
SELECT
	Type, 'UNITCLASS_WORKER', 'BUILD_MC_BUCCANEER_DISTILLERY' 
FROM Traits a, Leader_Traits b, Civilization_Leaders c, Civilization_JFD_CultureTypes d
WHERE a.Type = b.TraitType AND b.LeaderType = c.LeaderheadType AND 
c.CivilizationType = d.CivilizationType AND d.CultureType = 'CULTURE_JFD_COLONIAL';

INSERT INTO Building_ResourceYieldChanges
	(BuildingType,	ResourceType, YieldType, Yield)
VALUES
	('BUILDING_EMBRAPA', 'RESOURCE_MC_RUM', 'YIELD_GOLD', 2),
	('BUILDING_EMBRAPA', 'RESOURCE_MC_RUM', 'YIELD_SCIENCE', 2),
	('BUILDING_EMBRAPA', 'RESOURCE_MC_RUM', 'YIELD_CULTURE', 2);

INSERT INTO Building_ResourceYieldChanges
	(BuildingType,	ResourceType, YieldType, Yield)
SELECT
	a.Type, 'RESOURCE_MC_RUM', b.Type, 1
FROM Buildings a, Yields b
WHERE a.BuildingClass  = 'BUILDINGCLASS_GROCER' AND
b.Type IN ('YIELD_FOOD', 'YIELD_SCIENCE');

INSERT OR REPLACE INTO Improvement_TechYieldChanges
		(ImprovementType,	TechType, YieldType, Yield)
VALUES
	('IMPROVEMENT_MC_BUCCANEER_DISTILLERY', 'TECH_ECONOMICS', 'YIELD_GOLD', 2),
	('IMPROVEMENT_MC_BUCCANEER_DISTILLERY', 'TECH_SCIENTIFIC_THEORY', 'YIELD_SCIENCE', 3),
	('IMPROVEMENT_MC_BUCCANEER_DISTILLERY', 'TECH_CORPORATIONS', 'YIELD_GOLD', 1),	
	('IMPROVEMENT_MC_BUCCANEER_DISTILLERY', 'TECH_CORPORATIONS', 'YIELD_SCIENCE', 1),
	('IMPROVEMENT_MC_BUCCANEER_DISTILLERY', 'TECH_REFRIGERATION', 'YIELD_FOOD', 2),
	('IMPROVEMENT_MC_BUCCANEER_DISTILLERY', 'TECH_REFRIGERATION', 'YIELD_SCIENCE', 1);

INSERT OR REPLACE INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,			YieldType,	Yield)
SELECT	 PolicyType,	'IMPROVEMENT_MC_BUCCANEER_DISTILLERY', YieldType,	Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_POLDER';

INSERT INTO Trait_ResourceYieldChangesFromGoldenAge
	(TraitType, ResourceType, YieldType, Yield, YieldCap)
SELECT
	lt.TraitType, 'RESOURCE_MC_RUM', 'YIELD_CULTURE', 1, 5
FROM Civilization_JFD_CultureTypes c, Leader_Traits lt, Civilization_Leaders cl
WHERE 
c.CultureType = 'CULTURE_JFD_COLONIAL' AND 
c.CivilizationType = cl.CivilizationType AND 
cl.LeaderheadType = lt.LeaderType;

CREATE TRIGGER DistilleryTrait
AFTER INSERT ON Civilization_JFD_CultureTypes WHEN NEW.CultureType = 'CULTURE_JFD_COLONIAL'
BEGIN
	INSERT INTO Trait_ResourceYieldChangesFromGoldenAge
		(TraitType, ResourceType, YieldType, Yield, YieldCap)
	SELECT
		lt.TraitType, 'RESOURCE_MC_RUM', 'YIELD_CULTURE', 1, 5
	FROM Leader_Traits lt, Civilization_Leaders cl
	WHERE 
	NEW.CivilizationType = cl.CivilizationType AND 
	cl.LeaderheadType = lt.LeaderType;
END;

/*
---------------------
-- vintage event
---------------------
INSERT INTO CityEvents 
	(Type, EventClass, NumChoices, RandomChance, RandomChanceDelta, IgnoresGlobalCooldown, ImprovementRequired)
VALUES
	('CITY_EVENT_CD_VINTAGE', 'EVENT_CLASS_CIV_SPECIFIC', 1, 2, 0, 1, 'IMPROVEMENT_MC_BUCCANEER_DISTILLERY');

INSERT INTO CityEventChoices
	(Type, Description, Help, 
	EraScaling, EventDuration, IsOneShot)
VALUES
	('CITY_EVENT_CD_VINTAGE_CHOICE', 'TXT_KEY_CITY_EVENT_CD_VINTAGE', 'TXT_KEY_CITY_EVENT_CD_VINTAGE_HELP', 
	1, 30, 1);

INSERT INTO CityEvent_ParentEvents
	(CityEventChoiceType, CityEventType)
VALUES
	('CITY_EVENT_CD_VINTAGE_CHOICE', 'CITY_EVENT_CD_VINTAGE');

INSERT INTO CityEventChoice_ImprovementYieldChange
	(CityEventChoiceType, ImprovementType, YieldType, YieldChange)
VALUES
	('CITY_EVENT_CD_VINTAGE_CHOICE', 'IMPROVEMENT_MC_BUCCANEER_DISTILLERY', 'YIELD_GOLD', 3),
	('CITY_EVENT_CD_VINTAGE_CHOICE', 'IMPROVEMENT_MC_BUCCANEER_DISTILLERY', 'YIELD_CULTURE', 3);

INSERT INTO CityEventChoice_GreatPersonPoints
	(CityEventChoiceType, SpecialistType, Points)
VALUES
	('CITY_EVENT_CD_VINTAGE_CHOICE', 'SPECIALIST_MERCHANT', 50);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_CITY_EVENT_CD_VINTAGE', 'A Fine Vintage'),
	('TXT_KEY_CITY_EVENT_CD_VINTAGE_HELP', 'The liquor industry has grown sufficiently established to begin aging a portion of their output to create a deeper, more complex flavor.[NEWLINE][NEWLINE]Nearby Distilleries gain +3 [ICON_GOLD] Gold and [ICON_CULTURE] Culture. Receive {4_GPChange}.');
*/
