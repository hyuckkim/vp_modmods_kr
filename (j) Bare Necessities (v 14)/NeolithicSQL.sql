--=======================================================================================================================
-- Table with new Wonder Types
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS JarBareConfig (
	WType			TEXT			NOT NULL,		-- Wonder Type
	PRIMARY KEY (WType)
);
--=======================================================================================================================
-- CONFIGURATION
--=======================================================================================================================
INSERT INTO COMMUNITY	
		(Type,					Value)
VALUES	('JAR_NEOLITHIC_ENABLE', 	1);
-- SET TO ZERO IF YOU WANT TO DISABLE THE NEOLITHIC WONDERS

INSERT OR REPLACE INTO JarBareConfig	
(WType) VALUES
('BARNENEZ'),		-- Barnenez
('NEWGRANGE'),		-- Newgrange
('CATALHOYUK'),		-- Catalhoyuk
('LIANGZHU');		-- Liangzhu
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO BuildingClasses
				(Type,						Description,					DefaultBuilding,	MaxGlobalInstances)
SELECT DISTINCT	'BUILDINGCLASS_'||WType,	'TXT_KEY_BUILDING_'||WType,		'BUILDING_'||WType, 1
FROM JarBareConfig WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='JAR_NEOLITHIC_ENABLE' AND Value=1);
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Buildings
			(Type,               BuildingClass,           Description,                Civilopedia,                        Help,								Quote,								PrereqTech,	ThemingBonusHelp, Cost, FaithCost, NukeImmune, HurryCostModifier, MinAreaSize, ConquestProb, IconAtlas,		PortraitIndex, WonderSplashAnchor)
SELECT		'BUILDING_'||WType, 'BUILDINGCLASS_'||WType, 'TXT_KEY_BUILDING_'||WType, 'TXT_KEY_WONDER_'||WType||'_PEDIA', 'TXT_KEY_WONDER_'||WType||'_HELP',	'TXT_KEY_WONDER_'||WType||'_QUOTE', 'TECH_AGRICULTURE',		NULL,    1,    0,         1,          -5,                -1,          100,       'NW_ICONS',	0,             'R,T'
FROM JarBareConfig WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='JAR_NEOLITHIC_ENABLE' AND Value=1);
------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Civilization_BuildingClassOverrides 
			(CivilizationType,			BuildingClassType,			BuildingType)
SELECT		'CIVILIZATION_BARBARIAN',	'BUILDINGCLASS_'||WType,	NULL 
FROM JarBareConfig WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='JAR_NEOLITHIC_ENABLE' AND Value=1);

INSERT OR REPLACE INTO Civilization_BuildingClassOverrides 
			(CivilizationType,		BuildingClassType,			BuildingType)
SELECT		'CIVILIZATION_MINOR',	'BUILDINGCLASS_'||WType,	NULL 
FROM JarBareConfig WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='JAR_NEOLITHIC_ENABLE' AND Value=1);
DROP TABLE JarBareConfig;
--======================================================================================================================================--
-- Buildings
--======================================================================================================================================--
-- BARNENEZ
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET WonderSplashImage='Barnenez_splash.dds', Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_STONEHENGE'),
PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_LODGE'), WonderSplashAudio = 'AS2D_WONDER_BARNENEZ',
NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_STONEHENGE'), MaxStartEra = 'ERA_CLASSICAL',
SpecialistType='SPECIALIST_SCIENTIST', GreatPeopleRateChange=1, FreeBuildingThisCity = 'BUILDINGCLASS_LODGE'
WHERE Type = 'BUILDING_BARNENEZ';

INSERT INTO Building_YieldChanges (BuildingType,YieldType, Yield)
SELECT 'BUILDING_BARNENEZ', 'YIELD_CULTURE', 1  UNION ALL
SELECT 'BUILDING_BARNENEZ', 'YIELD_GOLDEN_AGE_POINTS', 1 UNION ALL
SELECT 'BUILDING_BARNENEZ', 'YIELD_PRODUCTION', 1;

INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType,			BuildingClassType,		YieldType,		YieldChange) 
VALUES	('BUILDING_BARNENEZ',	'BUILDINGCLASS_LODGE','YIELD_FAITH',	1);

INSERT INTO Building_InstantYield (BuildingType, YieldType, Yield)
SELECT 'BUILDING_BARNENEZ', 'YIELD_SCIENCE', 50;

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
SELECT 'BUILDING_BARNENEZ', 'FLAVOR_PRODUCTION', 50  UNION ALL
SELECT 'BUILDING_BARNENEZ', 'FLAVOR_SCIENCE', 10  UNION ALL
SELECT 'BUILDING_BARNENEZ', 'FLAVOR_WONDER', 20 ;

INSERT OR REPLACE INTO Language_en_US 
(Tag, 								Text) VALUES
('TXT_KEY_BUILDING_BARNENEZ',		'Barnenez'),
('TXT_KEY_WONDER_BARNENEZ_QUOTE',	'[NEWLINE]"Appearances are a glimpse of the unseen."[NEWLINE] - Anaxagoras[NEWLINE]'),
('TXT_KEY_WONDER_BARNENEZ_PEDIA',	'The Barnenez cairn, located in Brittany, France, is one of the oldest and largest megalithic monuments in Europe. Often called the "Parthenon of prehistory", it is a massive stone burial mound measuring about 70 meters long, 25 meters wide, and up to 9 meters high. Built primarily of granite and schist, the cairn contains eleven burial chambers, accessible through narrow passageways. The interior walls are decorated with carved symbols such as axes and serpentine motifs, reflecting the ritual and symbolic importance of the structure. Its sheer scale and complexity highlight the advanced organizational and architectural abilities of Neolithic communities. [NEWLINE][NEWLINE]The history of Barnenez dates back to around 4800–4200 BCE, during the early Neolithic period, making it older than Stonehenge and the Egyptian pyramids. It was constructed in two main phases: the first involved building smaller tombs, later unified into one vast cairn. Over millennia, the site was used for burials and ceremonial purposes, but it fell into obscurity until rediscovered in the 19th century. In the 1950s, quarrying activities threatened its survival, but archaeological excavations revealed its significance, leading to preservation efforts. Today, the Cairn of Barnenez stands as a remarkable testament to Europe''s prehistoric past and is recognized as one of the earliest examples of monumental stone architecture in human history.'),
('TXT_KEY_WONDER_BARNENEZ_HELP_CUT',	'+1 [ICON_GOLDEN_AGE] Golden Age Point. [NEWLINE]Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] {TXT_KEY_BUILDING_LODGE} and 50 [ICON_RESEARCH] Science in the City in which it is built. [NEWLINE]All owned Smokehouses gain +1 [ICON_PEACE] Faith.');

INSERT OR REPLACE INTO Language_en_US 
		(Tag, 							 Text)
SELECT	'TXT_KEY_WONDER_BARNENEZ_HELP', 'Wonder: [COLOR_NEGATIVE_TEXT]Newgrange[ENDCOLOR]. [NEWLINE][NEWLINE]'||Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BARNENEZ_HELP_CUT';
------------------------------------------------------------------------------------------------------------------------------------------
-- NEWGRANGE
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET WonderSplashImage='Newgrange_splash.dds', Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_STONEHENGE'),
PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_GRANARY'), WonderSplashAudio = 'AS2D_WONDER_NEWGRANGE',
NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_STONEHENGE'), MaxStartEra = 'ERA_CLASSICAL',
SpecialistType='SPECIALIST_MERCHANT', GreatPeopleRateChange=1, FreeBuildingThisCity = 'BUILDINGCLASS_GRANARY', PortraitIndex= 1
WHERE Type = 'BUILDING_NEWGRANGE';

INSERT INTO Building_YieldChanges (BuildingType,YieldType, Yield)
SELECT 'BUILDING_NEWGRANGE', 'YIELD_CULTURE', 1 UNION ALL
SELECT 'BUILDING_NEWGRANGE', 'YIELD_FOOD', 1  UNION ALL
SELECT 'BUILDING_NEWGRANGE', 'YIELD_PRODUCTION', 1;

INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType,			BuildingClassType,		YieldType,		YieldChange) 
VALUES	('BUILDING_NEWGRANGE',	'BUILDINGCLASS_GRANARY',	'YIELD_FAITH',	1);

INSERT INTO Building_YieldFromBirth (BuildingType, YieldType, Yield)
SELECT 'BUILDING_NEWGRANGE', 'YIELD_GOLDEN_AGE_POINTS', 20;

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
SELECT 'BUILDING_NEWGRANGE', 'FLAVOR_GROWTH', 35  UNION ALL
SELECT 'BUILDING_NEWGRANGE', 'FLAVOR_HAPPINESS', 20  UNION ALL
SELECT 'BUILDING_NEWGRANGE', 'FLAVOR_WONDER', 20 ;

INSERT OR REPLACE INTO Language_en_US 
(Tag, 								Text) VALUES
('TXT_KEY_BUILDING_NEWGRANGE',		'Newgrange'),
('TXT_KEY_WONDER_NEWGRANGE_QUOTE',	'[NEWLINE]"It is often said because of visions in dreams that the dead truly live."[NEWLINE] - Nicander of Colophon[NEWLINE]'),
('TXT_KEY_WONDER_NEWGRANGE_PEDIA',	'Newgrange, located in County Meath, Ireland, is a prehistoric passage tomb and one of the most iconic monuments of Neolithic Europe. Built around 3200 BCE, it predates Stonehenge and the Great Pyramids of Giza. The structure consists of a large circular mound over 85 meters in diameter and 13 meters high, covering a long passageway that leads to a central cruciform chamber. The mound is edged with 97 massive kerbstones, many of which are decorated with intricate megalithic art, including spirals, lozenges, and concentric circles. Newgrange is particularly famous for its alignment with the winter solstice sunrise: each year, on the shortest days, sunlight enters through a specially designed roof box and illuminates the inner chamber, demonstrating the builders'' advanced astronomical knowledge. [NEWLINE][NEWLINE]The history of Newgrange is tied to Ireland''s earliest farming communities, who constructed it as part of the Brú na Bóinne complex, alongside Knowth and Dowth. It is believed to have served both as a tomb and as a ceremonial site, with its alignment linking it to seasonal cycles and beliefs about life, death, and renewal. Over the centuries, Newgrange fell into disuse, becoming shrouded in myth and legend; in medieval times, it was associated with the Tuatha Dé Danann, the mythological deities of Ireland. Rediscovered and excavated in the late 17th and 20th centuries, it has since been restored and is now a UNESCO World Heritage Site. Today, Newgrange is celebrated as one of the most important archaeological and cultural treasures in Ireland, attracting thousands of visitors annually.'),
('TXT_KEY_WONDER_NEWGRANGE_HELP_CUT',	'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] {TXT_KEY_BUILDING_GRANARY} in the City in which it is built. [NEWLINE]Gain 20 [ICON_GOLDEN_AGE] Golden Age Points when a new [ICON_CITIZEN] Citizen is born in the City, scaling with Era. [NEWLINE]All owned Granaries gain +1 [ICON_PEACE] Faith.');

INSERT OR REPLACE INTO Language_en_US 
		(Tag, 							 Text)
SELECT	'TXT_KEY_WONDER_NEWGRANGE_HELP', 'Wonder: [COLOR_NEGATIVE_TEXT]Barnenez[ENDCOLOR]. [NEWLINE][NEWLINE]'||Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_NEWGRANGE_HELP_CUT';
------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassNeededNowhere
		(BuildingType,		BuildingClassType) 
SELECT 'BUILDING_NEWGRANGE','BUILDINGCLASS_BARNENEZ' UNION ALL
SELECT 'BUILDING_BARNENEZ','BUILDINGCLASS_NEWGRANGE';
------------------------------------------------------------------------------------------------------------------------------------------
-- CATALHOYUK
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_STONEHENGE'),  WonderSplashImage='CATALHOYUK.dds',
PrereqTech = 'TECH_ANIMAL_HUSBANDRY', NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_STONEHENGE'),
SpecialistType = 'SPECIALIST_CIVIL_SERVANT', GreatPeopleRateChange=1, MaxStartEra = 'ERA_CLASSICAL',NearbyTerrainRequired = 'TERRAIN_PLAINS',
PortraitIndex= 2 WHERE Type = 'BUILDING_CATALHOYUK';

INSERT OR REPLACE INTO Building_LocalResourceOrs 
		(BuildingType,			ResourceType)
SELECT	'BUILDING_CATALHOYUK',	 Type FROM Resources
WHERE AnimalResource=1 AND LandResource=1 AND ResourceClassType!='RESOURCECLASS_LUXURY';

INSERT INTO Building_YieldChanges 
(BuildingType,			YieldType,		Yield) VALUES
('BUILDING_CATALHOYUK',	'YIELD_CULTURE',1),
('BUILDING_CATALHOYUK',	'YIELD_FOOD',	2);

INSERT INTO Building_InstantYield (BuildingType, YieldType, Yield)
SELECT 'BUILDING_CATALHOYUK', 'YIELD_POPULATION', 2;

INSERT OR REPLACE INTO Building_ResourceYieldChangesGlobal 
		(BuildingType,			ResourceType,		YieldType,		Yield)
SELECT	'BUILDING_CATALHOYUK',	 Type,				'YIELD_FAITH',	1 FROM Resources
WHERE AnimalResource=1 AND LandResource=1 AND ResourceClassType!='RESOURCECLASS_LUXURY';

INSERT OR REPLACE INTO Building_Flavors
(BuildingType,			FlavorType,			Flavor) 	VALUES 
('BUILDING_CATALHOYUK',	'FLAVOR_WONDER',	20),
('BUILDING_CATALHOYUK',	'FLAVOR_CITY_DEFENSE',	10),
('BUILDING_CATALHOYUK',	'FLAVOR_GROWTH',	50),
('BUILDING_CATALHOYUK',	'FLAVOR_RELIGION',	20),
('BUILDING_CATALHOYUK',	'FLAVOR_GREAT_PEOPLE',	2);

INSERT OR REPLACE INTO Language_en_US 
(Tag, 									Text) VALUES
('TXT_KEY_BUILDING_CATALHOYUK',		'Catalhoyuk'),
('TXT_KEY_WONDER_CATALHOYUK_QUOTE',	'[NEWLINE]"Society is the union of men and not the men themselves."[NEWLINE] - Montesquieu[NEWLINE]'),
('TXT_KEY_WONDER_CATALHOYUK_PEDIA',	'Catalhoyuk, situated in central Turkey, stands as a captivating archaeological marvel, providing a window into the complex social and cultural dynamics of one of the world''s earliest known urban centers. Inhabited around 7500 BCE during the Neolithic period, Catalhoyuk represents an extraordinary example of early urbanization. The settlement''s unique layout consists of tightly packed mud-brick houses, interconnected in a maze-like fashion. The absence of streets and the interconnected rooftops suggest a communal lifestyle with shared spaces and a close-knit community, reflecting the sophisticated organization of this ancient society. [NEWLINE][NEWLINE]One of the most remarkable aspects of Catalhoyuk is the rich array of wall paintings found within the houses. These murals depict scenes of daily life, including hunting, farming, and intricate symbolic imagery. The vibrant artwork provides valuable insights into the inhabitants'' beliefs, rituals, and activities, offering a unique glimpse into the cultural and spiritual dimensions of Neolithic life. The prevalence of bull motifs in the art has sparked discussions about the possible existence of a bull cult, emphasizing the significance of religious practices in the community. [NEWLINE][NEWLINE]Catalhoyuk holds a pivotal role in the history of agriculture and animal domestication. Excavations have revealed evidence of early agricultural practices, including the cultivation of cereals, and the domestication of animals such as sheep and cattle. The site''s importance in understanding the transition from hunter-gatherer lifestyles to settled agricultural communities is underscored by its designation as a UNESCO World Heritage Site in 2012. Catalhoyuk remains a focal point for archaeologists and historians, shedding light on the foundations of human civilization during the Neolithic era.'),
('TXT_KEY_WONDER_CATALHOYUK_HELP_CUT',		'+2 [ICON_CITIZEN] Population in the City. [NEWLINE]All Bonus and Strategic animal resources ([ICON_RES_SHEEP]/ [ICON_RES_COW]/ [ICON_RES_DEER]/ [ICON_RES_BISON]/ [ICON_RES_HORSE]): +1 [ICON_PEACE] Faith.');

INSERT OR REPLACE INTO Language_en_US 
		(Tag, 							 Text)
SELECT	'TXT_KEY_WONDER_CATALHOYUK_HELP', 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Improved Resource: [ICON_RES_SHEEP] [COLOR_CYAN]Sheep[ENDCOLOR]/ [ICON_RES_COW] [COLOR_CYAN]Cattle[ENDCOLOR]/ [ICON_RES_DEER] [COLOR_CYAN]Deer[ENDCOLOR]/ [ICON_RES_BISON] [COLOR_CYAN]Bison[ENDCOLOR]/ [ICON_RES_HORSE] [COLOR_CYAN]Horse[ENDCOLOR]. [NEWLINE][NEWLINE]'||Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CATALHOYUK_HELP_CUT';
------------------------------------------------------------------------------------------------------------------------------------------
-- LIANGZHU
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_MAUSOLEUM_HALICARNASSUS'), PrereqTech = 'TECH_MASONRY',
MaxStartEra = 'ERA_CLASSICAL', WonderSplashImage='LIANGZHU.dds', River = 1, CapitalOnly=1, ProhibitedCityTerrain = 'TERRAIN_DESERT',
NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_MAUSOLEUM_HALICARNASSUS'),
SpecialistType='SPECIALIST_WRITER', GreatPeopleRateChange=1, PortraitIndex= 3 WHERE Type = 'BUILDING_LIANGZHU';
---------------------------------------------------------
INSERT INTO Building_YieldChanges 
(BuildingType,			YieldType,			Yield) VALUES
('BUILDING_LIANGZHU',	'YIELD_CULTURE',	1),
('BUILDING_LIANGZHU',	'YIELD_GOLD',		2);

INSERT INTO Building_ImprovementYieldChanges
		(BuildingType,			ImprovementType,		YieldType,		Yield) 
VALUES	('BUILDING_LIANGZHU',	'IMPROVEMENT_QUARRY',	'YIELD_CULTURE',	1);

INSERT INTO Building_ResourceYieldChangesGlobal
		(BuildingType, ResourceType, YieldType, 	Yield)
SELECT	'BUILDING_LIANGZHU',	Type,'YIELD_FOOD',	1
FROM Resources WHERE RockResource=1 AND ResourceClassType='RESOURCECLASS_LUXURY';

INSERT OR REPLACE INTO Building_Flavors
(BuildingType,			FlavorType,				Flavor) 	VALUES
('BUILDING_LIANGZHU',	'FLAVOR_WONDER',		20),
('BUILDING_LIANGZHU',	'FLAVOR_GOLD',			10),
('BUILDING_LIANGZHU',	'FLAVOR_SCIENCE',		10),
('BUILDING_LIANGZHU',	'FLAVOR_CULTURE',		10),
('BUILDING_LIANGZHU',	'FLAVOR_HAPPINESS',		10), 
('BUILDING_LIANGZHU',	'FLAVOR_GREAT_PEOPLE',	2);

INSERT OR REPLACE INTO Language_en_US 
(Tag, 									Text) VALUES
('TXT_KEY_BUILDING_LIANGZHU',		'Liangzhu'),
('TXT_KEY_WONDER_LIANGZHU_QUOTE',	'[NEWLINE]"He who is unable to live in society, or who has no need because he is sufficient for himself, must be either a beast or a god."[NEWLINE] - Aristotle[NEWLINE]'),
('TXT_KEY_WONDER_LIANGZHU_PEDIA',	'Liangzhu, an ancient cultural and archaeological site near Hangzhou in the Yangtze River Delta, represents a remarkable testament to the sophistication of one of the earliest complex societies in ancient China. Flourishing during the Late Neolithic period from around 3300 BCE to 2200 BCE, the Liangzhu culture has left an indelible mark on our understanding of early Chinese civilization. At the heart of Liangzhu''s cultural legacy lies its exquisite jade artifacts, including bi disks and cong tubes, reflecting the society''s reverence for jade as a symbol of prestige, ritual significance, and spiritual beliefs. The intricate craftsmanship of these artifacts exemplifies the advanced technical skills and artistic sensibilities of the Liangzhu people. [NEWLINE][NEWLINE]The Liangzhu archaeological site reveals evidence of complex urban planning, showcasing carefully designed earthenware structures, raised roads, and artificial ponds. The presence of large burial mounds with ceremonial offerings suggests a socially stratified society, indicating the existence of a ruling elite. The layout of the Liangzhu city points to a high level of organization and the implementation of advanced agricultural techniques, notably wetland agriculture, which utilized the region''s abundant water resources for rice cultivation. These elements collectively reflect the cultural, social, and technological achievements of the Liangzhu people, positioning them as pioneers in early Chinese civilization. [NEWLINE][NEWLINE]Recognizing its significance, Liangzhu was inscribed as a UNESCO World Heritage Site in 2019, underscoring its importance in advancing our knowledge of early urban development, social complexity, and cultural innovation in ancient China. The site stands as a testament to the enduring legacy of the Liangzhu culture and its role in shaping the foundations of Chinese civilization.'),
('TXT_KEY_WONDER_LIANGZHU_HELP_CUT',	'Places 2 new [ICON_RES_JADE] Jade resources inside City range if possible. [NEWLINE]+1 [ICON_CULTURE] Culture from Quarries worked by the City. [NEWLINE][NEWLINE]All Luxury rock resources ([ICON_RES_GOLD]/ [ICON_RES_SILVER]/ [ICON_RES_GEMS]/ [ICON_RES_MARBLE]/ [ICON_RES_COPPER]/ [ICON_RES_SALT]/ [ICON_RES_AMBER]/ [ICON_RES_JADE]/ [ICON_RES_LAPIS]): +1 [ICON_FOOD] Food.[NEWLINE]');

INSERT OR REPLACE INTO Language_en_US 
		(Tag, 							 Text)
SELECT	'TXT_KEY_WONDER_LIANGZHU_HELP', 'Terrain: [COLOR_NEGATIVE_TEXT]Desert[ENDCOLOR]; [COLOR_YIELD_GOLD]Capital[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; City [COLOR_CYAN]place for Jade[ENDCOLOR]. [NEWLINE][NEWLINE]'||Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_LIANGZHU_HELP_CUT';
------------------------------------------------------------------------------------------------------------------------------------------
-- GOEBEKLI TEPE
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET MaxStartEra = 'ERA_CLASSICAL' WHERE Type IN
('BUILDING_ALTAMIRA', 'BUILDING_GGANTIJA', 'BUILDING_GOEBEKLI_TEPE', 'BUILDING_KUK', 'BUILDING_MAJORVILLE', 'BUILDING_SKARA_BRAE')
AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_GOEBEKLI_TEPE');

UPDATE Buildings SET SpecialistType = 'SPECIALIST_ARTIST', GreatPeopleRateChange=1 WHERE Type = 'BUILDING_ALTAMIRA'
AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_ALTAMIRA');

UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_SHRINE' WHERE Type = 'BUILDING_GOEBEKLI_TEPE'
AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_GOEBEKLI_TEPE')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT OR REPLACE INTO Building_BuildingClassYieldChanges 
		(BuildingType,				BuildingClassType,		YieldType,		YieldChange) 
SELECT	'BUILDING_GOEBEKLI_TEPE',	'BUILDINGCLASS_SHRINE',	'YIELD_SCIENCE',	1
WHERE EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_GOEBEKLI_TEPE')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GOEBEKLI_TEPE' AND YieldType='YIELD_SCIENCE'
AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_GOEBEKLI_TEPE')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

DELETE FROM Building_YieldPerXTerrainTimes100 WHERE BuildingType = 'BUILDING_GOEBEKLI_TEPE'
AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_GOEBEKLI_TEPE')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	
INSERT INTO Language_en_US (Tag, Text)
SELECT	'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP2_CUT', 'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] {TXT_KEY_BUILDING_SHRINE} in the City in which it is built. [NEWLINE]All Shrines gain +1 [ICON_RESEARCH] Science. [NEWLINE][NEWLINE]All [ICON_RES_STONE] Stone: +1 [ICON_RESEARCH] Science.';
INSERT INTO Language_en_US (Tag, Text)
SELECT	'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP2', 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR].[NEWLINE][NEWLINE]'||Text
FROM Language_en_US WHERE Tag='TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP2_CUT';
	
UPDATE Buildings SET Help = 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP2' WHERE Type = 'BUILDING_GOEBEKLI_TEPE'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

CREATE TRIGGER IF NOT EXISTS Jar_MoreWondersTweak AFTER UPDATE ON Buildings
WHEN OLD.Type = 'BUILDING_KARNAK' AND NEW.Cost = 150
BEGIN	
	UPDATE Buildings SET MaxStartEra = 'ERA_CLASSICAL' WHERE Type IN
	('BUILDING_ALTAMIRA', 'BUILDING_GGANTIJA', 'BUILDING_GOEBEKLI_TEPE', 'BUILDING_KUK', 'BUILDING_MAJORVILLE', 'BUILDING_SKARA_BRAE');
	
	UPDATE Buildings SET SpecialistType = 'SPECIALIST_ARTIST', GreatPeopleRateChange=1 WHERE Type = 'BUILDING_ALTAMIRA';
	
	UPDATE Buildings SET FreeBuildingThisCity = 'BUILDINGCLASS_SHRINE' WHERE Type = 'BUILDING_GOEBEKLI_TEPE'
	AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

	INSERT OR REPLACE INTO Building_BuildingClassYieldChanges 
			(BuildingType,				BuildingClassType,		YieldType,		YieldChange) 
	SELECT 'BUILDING_GOEBEKLI_TEPE',	'BUILDINGCLASS_SHRINE',	'YIELD_SCIENCE',	1
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

	DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GOEBEKLI_TEPE' AND YieldType='YIELD_SCIENCE'
	AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	
	DELETE FROM Building_YieldPerXTerrainTimes100 WHERE BuildingType = 'BUILDING_GOEBEKLI_TEPE'
	AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	
	UPDATE Buildings SET Help = 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP2' WHERE Type = 'BUILDING_GOEBEKLI_TEPE'
	AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
END;
--======================================================================================================================================--
-- Audio_Sounds
--======================================================================================================================================--
INSERT INTO Audio_Sounds
(SoundID, Filename, LoadType) VALUES
('SND_WONDER_NEWGRANGE', 'Newgrange', 'DynamicResident'),
('SND_WONDER_BARNENEZ', 'Barnenez', 'DynamicResident');

INSERT INTO Audio_2DSounds
(ScriptID, SoundID, SoundType, MinVolume, MaxVolume, IsMusic, TaperSoundtrackVolume) VALUES
('AS2D_WONDER_NEWGRANGE', 'SND_WONDER_NEWGRANGE', 'GAME_MUSIC_STINGS', 120, 120, 'true', 0.0),
('AS2D_WONDER_BARNENEZ', 'SND_WONDER_BARNENEZ', 'GAME_MUSIC_STINGS', 120, 120, 'true', 0.0);
--======================================================================================================================================--
--======================================================================================================================================--