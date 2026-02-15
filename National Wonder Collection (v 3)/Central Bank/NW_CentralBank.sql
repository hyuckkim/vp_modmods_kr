--------------------------------------------------------------------------------------------------
--Building Classes
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,			DefaultBuilding,				MaxPlayerInstances,	Description)
SELECT 'BUILDINGCLASS_FA_CENTRAL_BANK',		'BUILDING_FA_CENTRAL_BANK',		1,					'TXT_KEY_BUILDING_FA_CENTRAL_BANK';

--------------------------------------------------------------------------------------------------
--Civilization Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,					BuildingType)
SELECT 'CIVILIZATION_MINOR',											'BUILDINGCLASS_FA_CENTRAL_BANK',	NULL;

--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
ALTER TABLE Buildings ADD COLUMN MaxInterestRate integer DEFAULT 0;

INSERT INTO Buildings (Type,				BuildingClass,							PrereqTech,					Cost,	NumCityCostMod,	SpecialistType,			GreatPeopleRateChange,	MaxInterestRate,	NukeImmune,	NeverCapture,	HurryCostModifier,	IconAtlas,		PortraitIndex,	Description,							Help,										Strategy,										Civilopedia,									ArtDefineTag,					MinAreaSize) 
SELECT 'BUILDING_FA_CENTRAL_BANK',			'BUILDINGCLASS_FA_CENTRAL_BANK',		'TECH_SCIENTIFIC_THEORY',	360,	20,				'SPECIALIST_MERCHANT',	2,						8,					1,			1,				-1,					'FA_NW_ATLAS',	2,				'TXT_KEY_BUILDING_FA_CENTRAL_BANK',		'TXT_KEY_BUILDING_FA_CENTRAL_BANK_HELP',	'TXT_KEY_BUILDING_FA_CENTRAL_BANK_STRATEGY',	'TXT_KEY_BUILDING_FA_CENTRAL_BANK_PEDIA',		'ART_DEF_BUILDING_IRONWORKS',	-1;

--------------------------------------------------------------------------------------------------
--Building Class Reqs
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity (BuildingType,		BuildingClassType)
SELECT 'BUILDING_FA_CENTRAL_BANK',							'BUILDINGCLASS_PALACE';

INSERT INTO Building_PrereqBuildingClasses (BuildingType,	BuildingClassType,			NumBuildingNeeded) 
SELECT 'BUILDING_FA_CENTRAL_BANK',							'BUILDINGCLASS_BANK',		-1;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,						Flavor)
SELECT 'BUILDING_FA_CENTRAL_BANK',				'FLAVOR_DIPLOMACY',				5 UNION ALL
SELECT 'BUILDING_FA_CENTRAL_BANK',				'FLAVOR_GOLD',					60 UNION ALL
SELECT 'BUILDING_FA_CENTRAL_BANK',				'FLAVOR_GREAT_PEOPLE',			20 UNION ALL
SELECT 'BUILDING_FA_CENTRAL_BANK',				'FLAVOR_WONDER',				20;


