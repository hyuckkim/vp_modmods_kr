INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_PUBLIC_TRANSPORT',	'BUILDING_PUBLIC_TRANSPORT',	 'TXT_KEY_BUILDING_PUBLIC_TRANSPORT');

INSERT INTO	 Buildings
		(Type,						Description,						Civilopedia,							Strategy,									Help,									GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 					ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas)
VALUES	('BUILDING_PUBLIC_TRANSPORT',	'TXT_KEY_BUILDING_PUBLIC_TRANSPORT', 	'TXT_KEY_BUILDING_PUBLIC_TRANSPORT_TEXT',	'TXT_KEY_BUILDING_PUBLIC_TRANSPORT_STRATEGY',	'TXT_KEY_BUILDING_PUBLIC_TRANSPORT_HELP',	8, 				2250, -20, 					-1, 			80, 			'BUILDINGCLASS_PUBLIC_TRANSPORT', 	'ART_DEF_BUILDING_MARKET', 	'TECH_ELECTRONICS', 	22,				'CORP2_ATLAS');

UPDATE Buildings SET 
	PrereqTech = 'TECH_RADAR' 
WHERE BuildingClass = 'BUILDINGCLASS_POLICE_STATION';

UPDATE Buildings SET 
	PrereqTech = 'TECH_MOBILE_TACTICS' 
WHERE Type = 'BUILDING_INTELLIGENCE_AGENCY';

UPDATE Buildings SET
	RequiresIndustrialCityConnection = 1,
	PovertyFlatReduction = 1
WHERE BuildingClass = 'BUILDINGCLASS_PUBLIC_TRANSPORT';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PUBLIC_TRANSPORT', 'YIELD_PRODUCTION', 3),
	('BUILDING_PUBLIC_TRANSPORT', 'YIELD_TOURISM', 3);

INSERT INTO Building_BuildingClassLocalYieldChanges
    (BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	'BUILDING_PUBLIC_TRANSPORT', BuildingClass, 'YIELD_FOOD', 10
FROM Buildings WHERE MutuallyExclusiveGroup = 1;

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
SELECT
	'BUILDING_PUBLIC_TRANSPORT', Type, 20
FROM Yields WHERE ID < 6;

INSERT INTO Building_ResourceQuantityRequirements
	(BuildingType, ResourceType, Cost)
VALUES
	('BUILDING_PUBLIC_TRANSPORT', 'RESOURCE_IRON', 2);

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_PUBLIC_TRANSPORT', 'FLAVOR_GROWTH', 70);
	--('BUILDING_PUBLIC_TRANSPORT', 'FLAVOR_MILITARY_TRAINING', -30);

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_PUBLIC_TRANSPORT',			'Mass Transit'),
		('TXT_KEY_BUILDING_PUBLIC_TRANSPORT_TEXT',		'Examples of mass transit include city buses, trolleybuses, trams (or light rail) and passenger trains, rapid transit (metro/subway/underground, etc.) and ferries. Buses are known to have operated in Nantes in 1826, not long before the world''s first steam-powered underground railway opened in London in 1863. Today, commuter rail, subways, buses (and trams) are essential infrastructure for the world''s metropolitan hubs. Of the over one million people who commute to London each day, 80% use public transport. Because of the reduced emissions and other environmental impacts of using public transportation over private transportation, many experts have pointed to an increased investment in public transit as an important climate change mitigation tactic.'),
		('TXT_KEY_BUILDING_PUBLIC_TRANSPORT_STRATEGY',	'While the Agribusiness requires Horses after they have become militarily obsolete, Mass Transit requires Iron when it is still important for producing Units. Therefore the construction of these late game buildings should be carefully rationed to only the Cities where their growth-based yields will be best utilised. The greedier you want to be, the more you can have!'),
		('TXT_KEY_BUILDING_PUBLIC_TRANSPORT_HELP',		'Gain 20% of the output of [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] in the City as an instant boost when a [ICON_CITIZEN] Citizen is born in this City. +10 [ICON_FOOD] Food if the City has a [COLOR_POSITIVE_TEXT]Power Plant[ENDCOLOR].[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty.[NEWLINE][NEWLINE]Requires 2 [ICON_RES_IRON] Iron and an [ICON_INDUSTRIAL_CONNECTED] Industrial City Connection.');


