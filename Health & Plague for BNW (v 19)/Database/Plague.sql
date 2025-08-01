--------------------------------------------------------------------------------------------------
--GameOptions
--------------------------------------------------------------------------------------------------
INSERT INTO GameOptions (Type,				Description,									Help,												SupportsMultiplayer)	
SELECT 'GAMEOPTION_PLAGUE_DISABLED',		'TXT_KEY_GAMEOPTION_PLAGUE_DISABLED',			'TXT_KEY_GAMEOPTION_PLAGUE_DISABLED_HELP',			0 UNION ALL
SELECT 'GAMEOPTION_PLAGUE_DESTROYS_CITIES',	'TXT_KEY_GAMEOPTION_PLAGUE_DESTROYS_CITIES',	'TXT_KEY_GAMEOPTION_PLAGUE_DESTROYS_CITIES_HELP',	0 UNION ALL
SELECT 'GAMEOPTION_PLAGUE_NONHISTORIC',		'TXT_KEY_GAMEOPTION_PLAGUE_NONHISTORIC',		'TXT_KEY_GAMEOPTION_PLAGUE_NONHISTORIC_HELP',		0;

-----------------------------------------------------------------------------------------------------
--Yields
-----------------------------------------------------------------------------------------------------
INSERT INTO Yields (Type,	Description,				IconString,			MinCity,	AIWeightPercent)
SELECT 'YIELD_HEALTH',		'TXT_KEY_YIELD_HEALTH',		'[ICON_HEALTH]',	0,			100;

-----------------------------------------------------------------------------------------------------
--Traits (supported, but not active)
-----------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Trait_HealthModifier (TraitType TEXT DEFAULT NULL, HealthModifier INTEGER DEFAULT 0, EraPrereq TEXT DEFAULT NULL);

-----------------------------------------------------------------------------------------------------
--Specialists
-----------------------------------------------------------------------------------------------------
INSERT INTO Specialists (Type,	Visible,	Description,					Strategy,								GreatPeopleTitle,					IconAtlas,				PortraitIndex) 
SELECT 'SPECIALIST_DOCTOR',		1,			'TXT_KEY_SPECIALIST_DOCTOR',	'TXT_KEY_SPECIALIST_DOCTOR_STRATEGY',	'TXT_KEY_SPECIALIST_DOCTOR_TITLE',	'HEALTH_CITIZEN_ATLAS',	0;

INSERT INTO SpecialistYields (SpecialistType,	YieldType,			Yield)
SELECT 'SPECIALIST_DOCTOR',						'YIELD_SCIENCE',	1 UNION ALL
SELECT 'SPECIALIST_DOCTOR',						'YIELD_HEALTH',		3;

INSERT INTO SpecialistFlavors (SpecialistType,	FlavorType,			Flavor)
SELECT 'SPECIALIST_DOCTOR',						'FLAVOR_SCIENCE',	40 UNION ALL
SELECT 'SPECIALIST_DOCTOR',						'FLAVOR_GROWTH',	40;

--------------------------------------------------------------------------------------------------
--Beliefs
--------------------------------------------------------------------------------------------------
INSERT INTO Beliefs (Type,				Pantheon,	Founder,	Follower,	Description,							ShortDescription)
SELECT 'BELIEF_HEALTH_SHAMANS',			1,			0,			0,			'TXT_KEY_BELIEF_HEALTH_SHAMANS',		'TXT_KEY_BELIEF_HEALTH_SHAMANS_SHORT' UNION ALL
SELECT 'BELIEF_HEALTH_VAPORS',			1,			0,			0,			'TXT_KEY_BELIEF_HEALTH_VAPORS',			'TXT_KEY_BELIEF_HEALTH_VAPORS_SHORT' UNION ALL
SELECT 'BELIEF_HEALTH_PRAYER',			0,			1,			0,			'TXT_KEY_BELIEF_HEALTH_PRAYER',			'TXT_KEY_BELIEF_HEALTH_PRAYER_SHORT' UNION ALL
SELECT 'BELIEF_HEALTH_REINCARNATION',	0,			1,			0,			'TXT_KEY_BELIEF_HEALTH_REINCARNATION',	'TXT_KEY_BELIEF_HEALTH_REINCARNATION_SHORT' UNION ALL
SELECT 'BELIEF_HEALTH_SACRIFICE',		0,			0,			1,			'TXT_KEY_BELIEF_HEALTH_SACRIFICE',		'TXT_KEY_BELIEF_HEALTH_SACRIFICE_SHORT';

INSERT INTO Belief_CityYieldChanges (BeliefType,			YieldType,		Yield)
SELECT 'BELIEF_HEALTH_SHAMANS',								'YIELD_HEALTH',	1;

INSERT INTO Belief_YieldChangePerForeignCity (BeliefType,	YieldType,		Yield)
SELECT 'BELIEF_HEALTH_PRAYER',								'YIELD_HEALTH',	2;

INSERT INTO Belief_HolyCityYieldChanges (BeliefType,		YieldType,		Yield)
SELECT 'BELIEF_HEALTH_REINCARNATION',						'YIELD_HEALTH',	5;

INSERT INTO Belief_FeatureYieldChanges (BeliefType,	FeatureType,			YieldType,		Yield)
SELECT 'BELIEF_HEALTH_VAPORS',						'FEATURE_MARSH',		'YIELD_HEALTH',	1 UNION ALL
SELECT 'BELIEF_HEALTH_VAPORS',						'FEATURE_FLOOD_PLAINS',	'YIELD_HEALTH',	1;

INSERT INTO Belief_BuildingClassYieldChanges (BeliefType,	BuildingClassType,		YieldType,		YieldChange)
SELECT 'BELIEF_HEALTH_SACRIFICE',							'BUILDINGCLASS_TEMPLE',	'YIELD_HEALTH',	1;

-----------------------------------------------------------------------------------------------------
--Buildings
-----------------------------------------------------------------------------------------------------
ALTER TABLE Buildings ADD AddsFreshWaterHealth boolean DEFAULT 0;
UPDATE Buildings SET AddsFreshWaterHealth = 1 WHERE BuildingClass = 'BUILDINGCLASS_AQUEDUCT';

UPDATE Buildings SET SpecialistType = 'SPECIALIST_DOCTOR', SpecialistCount = 1 WHERE BuildingClass = 'BUILDINGCLASS_HOSPITAL';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_DOCTOR', SpecialistCount = 1 WHERE BuildingClass = 'BUILDINGCLASS_MEDICAL_LAB';

-----------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS BuildingClass_HealthYields (BuildingClassType TEXT DEFAULT NULL, Yield INTEGER DEFAULT 0);

INSERT INTO BuildingClass_HealthYields (BuildingClassType,	Yield)
SELECT 'BUILDINGCLASS_STABLE',								-1 UNION ALL
SELECT 'BUILDINGCLASS_STONE_WORKS',							-1 UNION ALL
SELECT 'BUILDINGCLASS_CIRCUS',								-1 UNION ALL
SELECT 'BUILDINGCLASS_FORGE',								-1 UNION ALL
SELECT 'BUILDINGCLASS_WORKSHOP',							-1 UNION ALL
SELECT 'BUILDINGCLASS_IRONWORKS',							-2 UNION ALL
SELECT 'BUILDINGCLASS_COLOSSEUM',							-1 UNION ALL
SELECT 'BUILDINGCLASS_THEATRE',								-1 UNION ALL
SELECT 'BUILDINGCLASS_HARBOR',								-1 UNION ALL
SELECT 'BUILDINGCLASS_SEAPORT',								-1 UNION ALL
SELECT 'BUILDINGCLASS_FACTORY',								-2 UNION ALL
SELECT 'BUILDINGCLASS_AIRPORT',								-1 UNION ALL
SELECT 'BUILDINGCLASS_TOURIST_CENTER',						-1 UNION ALL
SELECT 'BUILDINGCLASS_GRANARY',								1 UNION ALL	
SELECT 'BUILDINGCLASS_WINDMILL',							1 UNION ALL	
SELECT 'BUILDINGCLASS_GARDEN',								1 UNION ALL	
SELECT 'BUILDINGCLASS_UNIVERSITY',							1 UNION ALL	
SELECT 'BUILDINGCLASS_RECYCLING_CENTER',					1 UNION ALL	
SELECT 'BUILDINGCLASS_HOSPITAL',							2 UNION ALL	
SELECT 'BUILDINGCLASS_MEDICAL_LAB',							1 UNION ALL	
SELECT 'BUILDINGCLASS_LABORATORY',							2;

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) 
SELECT	b.Type, 'YIELD_HEALTH', h.Yield 
FROM Buildings AS b, BuildingClass_HealthYields AS h
WHERE b.BuildingClass = h.BuildingClassType;

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
SELECT	b.Type, 'FLAVOR_GROWTH', (h.Yield*5)
FROM Buildings AS b, BuildingClass_HealthYields AS h
WHERE b.BuildingClass = h.BuildingClassType;

--------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS BuildingClass_HealthModifiers (BuildingClassType TEXT DEFAULT NULL, Yield INTEGER DEFAULT 0);

INSERT INTO BuildingClass_HealthModifiers (BuildingClassType,	Yield)
SELECT 'BUILDINGCLASS_NATIONAL_TREASURY',						-1 UNION ALL
SELECT 'BUILDINGCLASS_FACTORY',									-2 UNION ALL
SELECT 'BUILDINGCLASS_NUCLEAR_PLANT',							-1 UNION ALL
SELECT 'BUILDINGCLASS_MEDICAL_LAB',								1 UNION ALL
SELECT 'BUILDINGCLASS_HYDRO_PLANT',								1 UNION ALL
SELECT 'BUILDINGCLASS_SOLAR_PLANT',								1;

INSERT INTO Building_YieldModifiers (BuildingType, YieldType, Yield) 
SELECT	b.Type, 'YIELD_HEALTH', h.Yield 
FROM Buildings AS b, BuildingClass_HealthModifiers AS h
WHERE b.BuildingClass = h.BuildingClassType;

--------------------------------------------------------------------------------------------------
--Resources
--------------------------------------------------------------------------------------------------
INSERT INTO Resource_YieldChanges (ResourceType,	YieldType,			Yield)
SELECT 'RESOURCE_FISH',								'YIELD_HEALTH',		1 UNION ALL	
SELECT 'RESOURCE_INCENSE',							'YIELD_HEALTH',		1 UNION ALL	
SELECT 'RESOURCE_URANIUM',							'YIELD_HEALTH',		-1;	

INSERT INTO Improvement_ResourceType_Yields (ResourceType,	ImprovementType,					YieldType,				Yield)
SELECT 'RESOURCE_IRON',										'IMPROVEMENT_MINE',					'YIELD_HEALTH',			-2 UNION ALL	
SELECT 'RESOURCE_COAL',										'IMPROVEMENT_MINE',					'YIELD_HEALTH',			-3 UNION ALL	
SELECT 'RESOURCE_ALUMINUM',									'IMPROVEMENT_MINE',					'YIELD_HEALTH',			-2 UNION ALL	
SELECT 'RESOURCE_URANIUM',									'IMPROVEMENT_MINE',					'YIELD_HEALTH',			-2 UNION ALL	
SELECT 'RESOURCE_OIL',										'IMPROVEMENT_WELL',					'YIELD_HEALTH',			-2 UNION ALL	
SELECT 'RESOURCE_OIL',										'IMPROVEMENT_OFFSHORE_PLATFORM',	'YIELD_HEALTH',			-2 UNION ALL	
SELECT 'RESOURCE_NUTMEG',									'IMPROVEMENT_PLANTATION',			'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_CLOVES',									'IMPROVEMENT_PLANTATION',			'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_PEPPER',									'IMPROVEMENT_PLANTATION',			'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_COCOA',									'IMPROVEMENT_PLANTATION',			'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_SALT',										'IMPROVEMENT_MINE',					'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_BANANA',									'IMPROVEMENT_PLANTATION',			'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_SPICES',									'IMPROVEMENT_PLANTATION',			'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_SUGAR',									'IMPROVEMENT_PLANTATION',			'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_WINE',										'IMPROVEMENT_PLANTATION',			'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_CITRUS',									'IMPROVEMENT_PLANTATION',			'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_TRUFFLES',									'IMPROVEMENT_CAMP',					'YIELD_HEALTH',			1 UNION ALL
SELECT 'RESOURCE_WHEAT',									'IMPROVEMENT_FARM',					'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_COW',										'IMPROVEMENT_PASTURE',				'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_SHEEP',									'IMPROVEMENT_PASTURE',				'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_DEER',										'IMPROVEMENT_CAMP',					'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_BISON',									'IMPROVEMENT_CAMP',					'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_WHALE',									'IMPROVEMENT_FISHING_BOATS',		'YIELD_HEALTH',			1 UNION ALL	
SELECT 'RESOURCE_CRAB',										'IMPROVEMENT_FISHING_BOATS',		'YIELD_HEALTH',			1 UNION ALL
SELECT 'RESOURCE_PEARLS',									'IMPROVEMENT_FISHING_BOATS',		'YIELD_HEALTH',			1;

-----------------------------------------------------------------------------------------------------
INSERT INTO Resource_Flavors (ResourceType, FlavorType, Flavor)
SELECT	ResourceType, 'FLAVOR_GROWTH', ROUND(Yield*5, 0)
FROM Improvement_ResourceType_Yields
WHERE YieldType = 'YIELD_HEALTH';

-----------------------------------------------------------------------------------------------------
INSERT INTO Resource_QuantityTypes (ResourceType, Quantity)
SELECT	h.ResourceType, 1
FROM Resources AS r, Improvement_ResourceType_Yields AS h
WHERE r.Type = h.ResourceType AND h.YieldType = 'YIELD_HEALTH' AND r.ResourceClassType = 'RESOURCECLASS_BONUS';

UPDATE Resources  
	SET ResourceClassType = 'RESOURCECLASS_RUSH',
		ResourceUsage = 1,
		AIObjective = 3,
		Player = 67
	WHERE Type IN (SELECT ResourceType FROM Improvement_ResourceType_Yields WHERE YieldType = 'YIELD_HEALTH' AND Yield > 0) AND ResourceClassType = 'RESOURCECLASS_BONUS';

UPDATE Resources  
	SET TechCityTrade = 'TECH_AGRICULTURE'
	WHERE Type IN (SELECT ResourceType FROM Improvement_ResourceType_Yields WHERE YieldType = 'YIELD_HEALTH' AND Yield > 0) AND TechCityTrade IS NULL;

--------------------------------------------------------------------------------------------------
--Features
--------------------------------------------------------------------------------------------------
ALTER TABLE Feature_YieldChanges ADD OnlyAdjacentCity boolean DEFAULT 0;

INSERT INTO Feature_YieldChanges (FeatureType,		YieldType,				Yield,	OnlyAdjacentCity)
SELECT 'FEATURE_LAKE_VICTORIA',						'YIELD_HEALTH',			1,		0 UNION ALL	
SELECT 'FEATURE_FOUNTAIN_YOUTH',					'YIELD_HEALTH',			3,		0 UNION ALL	
SELECT 'FEATURE_REEF',								'YIELD_HEALTH',			1,		0 UNION ALL	
SELECT 'FEATURE_ATOLL',								'YIELD_HEALTH',			1,		0 UNION ALL	
SELECT 'FEATURE_OASIS',								'YIELD_HEALTH',			1,		0 UNION ALL	
SELECT 'FEATURE_FALLOUT',							'YIELD_HEALTH',			-5,		0 UNION ALL	
SELECT 'FEATURE_FLOOD_PLAINS',						'YIELD_HEALTH',			-1,		1 UNION ALL	
SELECT 'FEATURE_MARSH',								'YIELD_HEALTH',			-1,		1 UNION ALL	
SELECT 'FEATURE_FOREST',							'YIELD_HEALTH',			1,		1;

--------------------------------------------------------------------------------------------------
--Improvements
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields (ImprovementType,	YieldType,				Yield)
SELECT 'IMPROVEMENT_QUARRY',						'YIELD_HEALTH',			-1 UNION ALL
SELECT 'IMPROVEMENT_ACADEMY',						'YIELD_HEALTH',			2 UNION ALL
SELECT 'IMPROVEMENT_MANUFACTORY',					'YIELD_HEALTH',			-2;

INSERT INTO Improvement_TechYieldChanges (ImprovementType,	TechType,			YieldType,		Yield)
SELECT 'IMPROVEMENT_CUSTOMS_HOUSE',							'TECH_NAVIGATION',	'YIELD_HEALTH',	1;

INSERT INTO Improvement_TechFreshWaterYieldChanges (ImprovementType,	TechType,				YieldType,		Yield)
SELECT 'IMPROVEMENT_TRADING_POST',										'TECH_ELECTRONICS',		'YIELD_HEALTH',	1;

INSERT INTO Improvement_Flavors (ImprovementType,	FlavorType,				Flavor)
SELECT 'IMPROVEMENT_CUSTOMS_HOUSE',					'FLAVOR_GROWTH',		1 UNION ALL
SELECT 'IMPROVEMENT_ACADEMY',						'FLAVOR_GROWTH',		5 UNION ALL
SELECT 'IMPROVEMENT_MANUFACTORY',					'FLAVOR_GROWTH',		-5;

-----------------------------------------------------------------------------------------------------
--Technologies
-----------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Technology_Health (TechType TEXT DEFAULT NULL, Yield INTEGER DEFAULT 0);

INSERT INTO Technology_Health (TechType,	Yield)
SELECT 'TECH_ANIMAL_HUSBANDRY',				-1 UNION ALL
SELECT 'TECH_THE_WHEEL',					-1 UNION ALL
SELECT 'TECH_SAILING',						-1 UNION ALL
SELECT 'TECH_IRON_WORKING',					-1 UNION ALL
SELECT 'TECH_OPTICS',						-1 UNION ALL
SELECT 'TECH_COMPASS',						-1 UNION ALL
SELECT 'TECH_ASTRONOMY',					-1 UNION ALL
SELECT 'TECH_NAVIGATION',					-1 UNION ALL
SELECT 'TECH_COMBUSTION',					-1 UNION ALL
SELECT 'TECH_FLIGHT',						-1 UNION ALL
SELECT 'TECH_GLOBALIZATION',				-1 UNION ALL
SELECT 'TECH_PRINTING_PRESS',				1 UNION ALL
SELECT 'TECH_ARCHITECTURE',					1 UNION ALL
SELECT 'TECH_EDUCATION',					1 UNION ALL
SELECT 'TECH_POTTERY',						1 UNION ALL
SELECT 'TECH_ENGINEERING',					1 UNION ALL
SELECT 'TECH_CHEMISTRY',					1 UNION ALL
SELECT 'TECH_SCIENTIFIC_THEORY',			1 UNION ALL
SELECT 'TECH_BIOLOGY',						1 UNION ALL
SELECT 'TECH_ELECTRICITY',					1 UNION ALL
SELECT 'TECH_REFRIGERATION',				1 UNION ALL
SELECT 'TECH_PENICILIN',					2 UNION ALL
SELECT 'TECH_ECOLOGY',						1 UNION ALL
SELECT 'TECH_SATELLITES',					1 UNION ALL
SELECT 'TECH_ROBOTICS',						1 UNION ALL
SELECT 'TECH_NANOTECHNOLOGY',				1;

-----------------------------------------------------------------------------------------------------
--Policies
-----------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS PolicyBranch_Health (PolicyBranchType TEXT DEFAULT NULL, Yield INTEGER DEFAULT 0);

INSERT INTO PolicyBranch_Health (PolicyBranchType,	Yield)
SELECT 'POLICY_BRANCH_EXPLORATION',					-1 UNION ALL	
SELECT 'POLICY_BRANCH_RATIONALISM',					1;

INSERT INTO Policy_YieldModifiers (PolicyType, YieldType, Yield) 
SELECT	Type, 'YIELD_HEALTH', 5 
FROM Policies
WHERE Type LIKE 'POLICY_UNIVERSAL_HEALTHCARE%';

INSERT INTO Policy_CapitalYieldPerPopChanges (PolicyType,	YieldType,			Yield)
SELECT 'POLICY_OLIGARCHY',									'YIELD_HEALTH',		20;

INSERT INTO Policy_BuildingClassYieldChanges (PolicyType,	BuildingClassType,			YieldType,			YieldChange)
SELECT 'POLICY_DISCIPLINE',									'BUILDINGCLASS_BARRACKS',	'YIELD_HEALTH',		1;

INSERT INTO Policy_BuildingClassYieldModifiers (PolicyType,	BuildingClassType,			YieldType,			YieldMod)
SELECT 'POLICY_MERITOCRACY',								'BUILDINGCLASS_LIBRARY',	'YIELD_HEALTH',		2;

-----------------------------------------------------------------------------------------------------
--Eras
-----------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Era_PlagueDefines (EraType TEXT DEFAULT NULL, HealthMin INTEGER DEFAULT 0, MaxRange INTEGER DEFAULT 0, MaxDuration INTEGER DEFAULT 0);

INSERT INTO Era_PlagueDefines (EraType, HealthMin,	MaxRange,	MaxDuration)
SELECT 'ERA_ANCIENT',					5,			5,			5 UNION ALL		
SELECT 'ERA_CLASSICAL',					6,			6,			6 UNION ALL		
SELECT 'ERA_MEDIEVAL',					7,			7,			8 UNION ALL		
SELECT 'ERA_RENAISSANCE',				6,			7,			6 UNION ALL		
SELECT 'ERA_INDUSTRIAL',				5,			8,			5 UNION ALL		
SELECT 'ERA_MODERN',					4,			10,			5 UNION ALL		
SELECT 'ERA_POSTMODERN',				4,			12,			4 UNION ALL		
SELECT 'ERA_FUTURE',					4,			15,			4;

-----------------------------------------------------------------------------------------------------
--Plague Names
-----------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS PlagueNames (ID integer primary key autoincrement, Type TEXT not null unique, AncientDesc text DEFAULT null, ModernDesc text DEFAULT null, OnlyModern boolean DEFAULT 0);

INSERT INTO PlagueNames (Type,		OnlyModern,	AncientDesc,							ModernDesc)
SELECT 'PLAGUE_AIDS',				1,			'TXT_KEY_PLAGUE_AIDS',					'TXT_KEY_PLAGUE_AIDS' UNION ALL		
SELECT 'PLAGUE_EBOLA',				1,			'TXT_KEY_PLAGUE_EBOLA',					'TXT_KEY_PLAGUE_EBOLA' UNION ALL		
SELECT 'PLAGUE_HEMORRHAGIC',		1,			'TXT_KEY_PLAGUE_HEMORRHAGIC',			'TXT_KEY_PLAGUE_HEMORRHAGIC' UNION ALL		
SELECT 'PLAGUE_SARS',				1,			'TXT_KEY_PLAGUE_SARS',					'TXT_KEY_PLAGUE_SARS' UNION ALL		
SELECT 'PLAGUE_BUBONIC_PLAGUE',		0,			'TXT_KEY_PLAGUE_BLACK_DEATH',			'TXT_KEY_PLAGUE_BUBONIC_PLAGUE' UNION ALL		
SELECT 'PLAGUE_CHOLERA',			0,			'TXT_KEY_PLAGUE_BILIOUS_FEVER',			'TXT_KEY_PLAGUE_CHOLERA' UNION ALL		
SELECT 'PLAGUE_DENGUE_FEVER',		0,			'TXT_KEY_PLAGUE_WATER_FEVER',			'TXT_KEY_PLAGUE_DENGUE_FEVER' UNION ALL		
SELECT 'PLAGUE_HEPATITIS',			0,			'TXT_KEY_PLAGUE_JAUNDICE',				'TXT_KEY_PLAGUE_HEPATITIS' UNION ALL		
SELECT 'PLAGUE_INFLUENZA',			0,			'TXT_KEY_PLAGUE_THE_GRIPPE',			'TXT_KEY_PLAGUE_INFLUENZA' UNION ALL			
SELECT 'PLAGUE_LEISHMANIASIS',		0,			'TXT_KEY_PLAGUE_BLACK_FEVER',			'TXT_KEY_PLAGUE_LEISHMANIASIS' UNION ALL			
SELECT 'PLAGUE_LEPTOSPIROSIS',		0,			'TXT_KEY_PLAGUE_RAT_CATCHER_YELLOWS',	'TXT_KEY_PLAGUE_LEPTOSPIROSIS' UNION ALL	
SELECT 'PLAGUE_MALARIA',			0,			'TXT_KEY_PLAGUE_ROMAN_FEVER',			'TXT_KEY_PLAGUE_MALARIA' UNION ALL		
SELECT 'PLAGUE_MEASLES',			0,			'TXT_KEY_PLAGUE_MEASLES',				'TXT_KEY_PLAGUE_MEASLES' UNION ALL		
SELECT 'PLAGUE_MENINGITIS',			0,			'TXT_KEY_PLAGUE_DROPSY',				'TXT_KEY_PLAGUE_MENINGITIS' UNION ALL				
SELECT 'PLAGUE_MUMPS',				0,			'TXT_KEY_PLAGUE_MUMPS',					'TXT_KEY_PLAGUE_MUMPS' UNION ALL		
SELECT 'PLAGUE_POLIO',				0,			'TXT_KEY_PLAGUE_TEETHING_FEVER',		'TXT_KEY_PLAGUE_POLIO' UNION ALL		
SELECT 'PLAGUE_SMALLPOX',			0,			'TXT_KEY_PLAGUE_RED_PLAGUE',			'TXT_KEY_PLAGUE_SMALLPOX' UNION ALL		
SELECT 'PLAGUE_TRYPANOSOMIASIS',	0,			'TXT_KEY_PLAGUE_SLEEPING_SICKNESS',		'TXT_KEY_PLAGUE_TRYPANOSOMIASIS' UNION ALL		
SELECT 'PLAGUE_TUBERCULOSIS',		0,			'TXT_KEY_PLAGUE_CONSUMPTION',			'TXT_KEY_PLAGUE_TUBERCULOSIS' UNION ALL		
SELECT 'PLAGUE_TYPHOID',			0,			'TXT_KEY_PLAGUE_SLOW_FEVER',			'TXT_KEY_PLAGUE_TYPHOID' UNION ALL		
SELECT 'PLAGUE_TYPHUS',				0,			'TXT_KEY_PLAGUE_BLACK_ASSIZE',			'TXT_KEY_PLAGUE_TYPHUS' UNION ALL		
SELECT 'PLAGUE_YELLOW_FEVER',		0,			'TXT_KEY_PLAGUE_YELLOW_PLAGUE',			'TXT_KEY_PLAGUE_YELLOW_FEVER';	

-----------------------------------------------------------------------------------------------------
--Defines
-----------------------------------------------------------------------------------------------------
INSERT INTO Defines (Name,						Value)
SELECT 'PLAGUE_BASE_INIT_THRESHOLD',			5 UNION ALL
SELECT 'PLAGUE_BASE_DURATION_TURNS',			7 UNION ALL
SELECT 'PLAGUE_BASE_COOLDOWN_TURNS',			16 UNION ALL 
SELECT 'PLAGUE_BASE_BORDER_PERMEABILITY',		1.25 UNION ALL
SELECT 'PLAGUE_BASE_INFLUENCE_MOD',				0.85 UNION ALL
SELECT 'PLAGUE_BASE_PROPAGATE_THRESHOLD',		15 UNION ALL
SELECT 'PLAGUE_CITY_POPULATION_MOD',			2 UNION ALL
SELECT 'PLAGUE_CITY_BASE_AOE_DAMAGE',			20 UNION ALL
SELECT 'PLAGUE_CITY_TRADE_RANGE_MOD',			0.65 UNION ALL
SELECT 'PLAGUE_CITY_TRADE_LOCAL_MOD',			0.8 UNION ALL
SELECT 'PLAGUE_MINOR_EMPIRE_BONUS',				10 UNION ALL
SELECT 'PLAGUE_BASE_SPY_SABOTAGE_THRESHOLD',	2;

-----------------------------------------------------------------------------------------------------
--Font Mapping
----------------------------------------------------------------------------------------------------- 
INSERT INTO IconFontTextures (IconFontTexture,	IconFontTextureFile)
SELECT 'ICON_FONT_TEXTURE_PLAGUE',				'Plague-FontIcons';

INSERT INTO IconFontMapping (IconName,	IconFontTexture,				IconMapping)
SELECT 'ICON_HEALTH',					'ICON_FONT_TEXTURE_PLAGUE',		1 UNION ALL
SELECT 'ICON_PLAGUE',					'ICON_FONT_TEXTURE_PLAGUE',		2;

--------------------------------------------------------------------------------------------------
--Icon Atlas 
--------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas,	IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
SELECT 'PLAGUE_PROMOTION_ATLAS',		256,		1,				1,				'Plague_Promotion256.dds' UNION ALL
SELECT 'PLAGUE_PROMOTION_ATLAS',		64,			1,				1,				'Plague_Promotion64.dds' UNION ALL
SELECT 'PLAGUE_PROMOTION_ATLAS',		45,			1,				1,				'Plague_Promotion45.dds' UNION ALL
SELECT 'PLAGUE_PROMOTION_ATLAS',		32,			1,				1,				'Plague_Promotion32.dds' UNION ALL
SELECT 'HEALTH_CITIZEN_ATLAS',			256,		1,				1,				'Doctor_Icon256.dds' UNION ALL
SELECT 'HEALTH_CITIZEN_ATLAS',			128,		1,				1,				'Doctor_Icon128.dds' UNION ALL
SELECT 'HEALTH_CITIZEN_ATLAS',			64,			1,				1,				'Doctor_Icon64.dds' UNION ALL
SELECT 'HEALTH_CITIZEN_ATLAS',			45,			1,				1,				'Doctor_Icon45.dds' UNION ALL
SELECT 'HEALTH_CITIZEN_ATLAS',			32,			1,				1,				'Doctor_Icon32.dds';

-----------------------------------------------------------------------------------------------------
--Promotions
----------------------------------------------------------------------------------------------------- 
INSERT INTO UnitPromotions (Type,	CannotBeChosen,	DefenseMod,	Description,					Help,								PediaEntry,						IconAtlas,					PortraitIndex,	Sound,				PediaType)
SELECT 'PROMOTION_PLAGUED',			1,				-50,		'TXT_KEY_PROMOTION_PLAGUED',	'TXT_KEY_PROMOTION_PLAGUED_HELP',	'TXT_KEY_PROMOTION_PLAGUED',	'PLAGUE_PROMOTION_ATLAS',	0,				'AS2D_IF_LEVELUP',	'PEDIA_ATTRIBUTES';	

-----------------------------------------------------------------------------------------------------
--Pedia Entries
----------------------------------------------------------------------------------------------------- 
INSERT INTO Concepts (Type,		Topic,					Description,							Summary,								AdvisorQuestion,			Advisor,	CivilopediaHeaderType,	InsertBefore)
SELECT 'CONCEPT_HEALTH_CITY',	'TXT_KEY_TOPIC_CITIES',	'TXT_KEY_CITIES_HEALTH_HEADING3_TITLE',	'TXT_KEY_CITIES_HEALTH_HEADING3_BODY',	'TXT_KEY_CITIES_ADV_QUEST',	'ECONOMIC',	'HEADER_CITIES',		'CONCEPT_CITIES' UNION ALL
SELECT 'CONCEPT_HEALTH_EMPIRE',	'TXT_KEY_TOPIC_CITIES',	'TXT_KEY_EMPIRE_HEALTH_HEADING3_TITLE',	'TXT_KEY_EMPIRE_HEALTH_HEADING3_BODY',	'TXT_KEY_CITIES_ADV_QUEST',	'ECONOMIC',	'HEADER_CITIES',		'CONCEPT_CITIES' UNION ALL
SELECT 'CONCEPT_HEALTH_PLAGUE',	'TXT_KEY_TOPIC_CITIES',	'TXT_KEY_CITIES_PLAGUE_HEADING3_TITLE',	'TXT_KEY_CITIES_PLAGUE_HEADING3_BODY',	'TXT_KEY_CITIES_ADV_QUEST',	'ECONOMIC',	'HEADER_CITIES',		'CONCEPT_CITIES';

-----------------------------------------------------------------------------------------------------
--Tooltip Addenda
----------------------------------------------------------------------------------------------------- 
UPDATE LocalizedText
	SET Text = Text||'[NEWLINE]Removes the [ICON_HEALTH] Health malus in cities without access to fresh water.'
	WHERE Tag IN (SELECT Help FROM Buildings WHERE AddsFreshWaterHealth = 1);
-----------------------------------------------------------------------------------------------------
CREATE TABLE Temp (Key text, Value text);

INSERT INTO Temp (Key, Value)
SELECT	t.Help, h.Yield
FROM Technologies AS t, Technology_Health AS h
WHERE t.Type = h.TechType;

UPDATE LocalizedText
	SET Text = Text||'[NEWLINE][NEWLINE]Changes Empire [ICON_HEALTH] Health by '||(SELECT Value FROM Temp WHERE Tag = Temp.Key)||'%.'
	WHERE Tag IN (SELECT Key FROM Temp);

DROP TABLE Temp;
-----------------------------------------------------------------------------------------------------
CREATE TABLE Temp (Key text, Value text);

INSERT INTO Temp (Key, Value)
SELECT	p.Help, h.Yield
FROM PolicyBranchTypes AS p, PolicyBranch_Health AS h
WHERE p.Type = h.PolicyBranchType;

UPDATE LocalizedText
	SET Text = Text||'[NEWLINE][NEWLINE]Each adopted policy changes Empire [ICON_HEALTH] Health by '||(SELECT Value FROM Temp WHERE Tag = Temp.Key)||'%.'
	WHERE Tag IN (SELECT Key FROM Temp);

DROP TABLE Temp;
-----------------------------------------------------------------------------------------------------
CREATE TABLE Temp (Key text, Value text);

INSERT INTO Temp (Key, Value)
SELECT	p.Help, h.Yield
FROM Policies AS p, Policy_YieldModifiers AS h
WHERE p.Type = h.PolicyType AND h.YieldType = 'YIELD_HEALTH';

UPDATE LocalizedText
	SET Text = Text||'[NEWLINE]Changes Empire [ICON_HEALTH] Health by '||(SELECT Value FROM Temp WHERE Tag = Temp.Key)||'%.'
	WHERE Tag IN (SELECT Key FROM Temp);

DROP TABLE Temp;
-----------------------------------------------------------------------------------------------------
CREATE TABLE Temp (Key text, Value integer);

INSERT INTO Temp (Key, Value)
SELECT	p.Help, ROUND(100/h.Yield)
FROM Policies AS p, Policy_CapitalYieldPerPopChanges AS h
WHERE p.Type = h.PolicyType AND h.YieldType = 'YIELD_HEALTH';

UPDATE LocalizedText
	SET Text = Text||'[NEWLINE]+1 [ICON_HEALTH] Health for every '||(SELECT Value FROM Temp WHERE Tag = Temp.Key)||' [ICON_CITIZEN] Citizens in the [ICON_CAPITAL] Capital.'
	WHERE Tag IN (SELECT Key FROM Temp);

DROP TABLE Temp;
-----------------------------------------------------------------------------------------------------
CREATE TABLE Temp (Key text, Value text, Building text);

INSERT INTO Temp (Key, Value, Building)
SELECT	p.Help, h.YieldChange, h.BuildingClassType
FROM Policies AS p, Policy_BuildingClassYieldChanges AS h
WHERE p.Type = h.PolicyType AND h.YieldType = 'YIELD_HEALTH';

UPDATE Temp SET Building = (SELECT Description FROM BuildingClasses WHERE Building = Type);
UPDATE Temp SET Building = (SELECT Text FROM LocalizedText WHERE Building = Tag);

UPDATE LocalizedText
	SET Text = Text||'[NEWLINE]Cities with a '||(SELECT Building FROM Temp WHERE Tag = Temp.Key)||': '||(SELECT Value FROM Temp WHERE Tag = Temp.Key)||' [ICON_HEALTH] Health.'
	WHERE Tag IN (SELECT Key FROM Temp);

DROP TABLE Temp;
-----------------------------------------------------------------------------------------------------
CREATE TABLE Temp (Key text, Value text, Building text);

INSERT INTO Temp (Key, Value, Building)
SELECT	p.Help, h.YieldMod, h.BuildingClassType
FROM Policies AS p, Policy_BuildingClassYieldModifiers AS h
WHERE p.Type = h.PolicyType AND h.YieldType = 'YIELD_HEALTH';

UPDATE Temp SET Building = (SELECT Description FROM BuildingClasses WHERE Building = Type);
UPDATE Temp SET Building = (SELECT Text FROM LocalizedText WHERE Building = Tag);

UPDATE LocalizedText
	SET Text = Text||'[NEWLINE]Each '||(SELECT Building FROM Temp WHERE Tag = Temp.Key)||' increases Empire [ICON_HEALTH] Health by '||(SELECT Value FROM Temp WHERE Tag = Temp.Key)||'% (10% Max).'
	WHERE Tag IN (SELECT Key FROM Temp);

DROP TABLE Temp;

-----------------------------------------------------------------------------------------------------
--Compatibility
----------------------------------------------------------------------------------------------------- 
ALTER TABLE Buildings ADD IsVisible boolean DEFAULT 1;
----------------------------------------------------------------------------------------------------- 
CREATE TRIGGER HealthPlagueMod_01
AFTER INSERT ON Buildings
WHEN 'BUILDINGCLASS_AQUEDUCT' = NEW.BuildingClass
BEGIN
	UPDATE Buildings SET AddsFreshWaterHealth = 1
	WHERE NEW.BuildingClass = 'BUILDINGCLASS_AQUEDUCT';
END;
--------------------------------------------------------------------------------------------------
CREATE TRIGGER HealthPlagueMod_02
AFTER INSERT ON Buildings
WHEN 'BUILDINGCLASS_HOSPITAL' = NEW.BuildingClass OR 'BUILDINGCLASS_MEDICAL_LAB' = NEW.BuildingClass
BEGIN
	UPDATE Buildings SET SpecialistType = 'SPECIALIST_DOCTOR', SpecialistCount = 1 
	WHERE NEW.BuildingClass = 'BUILDINGCLASS_HOSPITAL';

	UPDATE Buildings SET SpecialistType = 'SPECIALIST_DOCTOR', SpecialistCount = 1 
	WHERE NEW.BuildingClass = 'BUILDINGCLASS_MEDICAL_LAB';
END;
--------------------------------------------------------------------------------------------------
CREATE TRIGGER HealthPlagueMod_03
AFTER INSERT ON Buildings
WHEN EXISTS (SELECT BuildingClassType FROM BuildingClass_HealthYields WHERE BuildingClassType = NEW.BuildingClass)
BEGIN
	INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) 
	SELECT	NEW.Type, 'YIELD_HEALTH', h.Yield 
	FROM BuildingClass_HealthYields AS h
	WHERE NEW.BuildingClass = h.BuildingClassType;

	INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
	SELECT	NEW.Type, 'FLAVOR_GROWTH', (h.Yield*5)
	FROM BuildingClass_HealthYields AS h
	WHERE NEW.BuildingClass = h.BuildingClassType;
END;
--------------------------------------------------------------------------------------------------
CREATE TRIGGER HealthPlagueMod_04
AFTER INSERT ON Buildings
WHEN EXISTS (SELECT BuildingClassType FROM BuildingClass_HealthModifiers WHERE BuildingClassType = NEW.BuildingClass)
BEGIN
	INSERT INTO Building_YieldModifiers (BuildingType, YieldType, Yield) 
	SELECT	NEW.Type, 'YIELD_HEALTH', h.Yield 
	FROM BuildingClass_HealthModifiers AS h
	WHERE NEW.BuildingClass = h.BuildingClassType;

	INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
	SELECT	NEW.Type, 'FLAVOR_GROWTH', (h.Yield*3)
	FROM BuildingClass_HealthModifiers AS h
	WHERE NEW.BuildingClass = h.BuildingClassType;
END;
-----------------------------------------------------------------------------------------------------
CREATE TRIGGER HealthPlagueMod_05
AFTER INSERT ON Improvement_ResourceType_Yields
WHEN NEW.YieldType = 'YIELD_HEALTH' AND NEW.Yield > 0
BEGIN
	INSERT INTO Resource_QuantityTypes (ResourceType, Quantity)
	SELECT	NEW.ResourceType, 1
	FROM Resources
	WHERE Type = NEW.ResourceType AND NEW.YieldType = 'YIELD_HEALTH' AND ResourceClassType = 'RESOURCECLASS_BONUS';

	UPDATE Resources  
	SET ResourceClassType = 'RESOURCECLASS_RUSH', 
		ResourceUsage = 1,
		AIObjective = 3,
		Player = 67
	WHERE Type = NEW.ResourceType AND ResourceClassType = 'RESOURCECLASS_BONUS';

	UPDATE Resources  
	SET TechCityTrade = 'TECH_AGRICULTURE'
	WHERE Type = NEW.ResourceType AND TechCityTrade IS NULL;
END;
-----------------------------------------------------------------------------------------------------
