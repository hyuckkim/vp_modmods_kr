--==================================================
--New Building
--==================================================
INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_PIPELINE',	'BUILDING_PIPELINE',	'TXT_KEY_BUILDING_PIPELINE');

INSERT INTO	Buildings
		(Type,						Description,						Civilopedia,							Strategy,									Help,									GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 					ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas, 
	RequiresIndustrialCityConnection, CityConnectionGoldModifier)
VALUES	('BUILDING_PIPELINE',	'TXT_KEY_BUILDING_PIPELINE', 	'TXT_KEY_BUILDING_PIPELINE_TEXT',	'TXT_KEY_BUILDING_PIPELINE_STRATEGY',	'TXT_KEY_BUILDING_PIPELINE_HELP',	8, 				2250, -20, 					-1, 			66, 			'BUILDINGCLASS_PIPELINE', 	'ART_DEF_BUILDING_MARKET', 	'TECH_COMBINED_ARMS', 	24,				'CORP2_ATLAS', 
	1, 50);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PIPELINE', 'YIELD_SCIENCE', 2);

INSERT INTO Building_YieldFromInternalTR
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PIPELINE', 'YIELD_PRODUCTION', 6);

INSERT INTO Building_LocalResourceOrs
	(BuildingType, ResourceType)
VALUES
	('BUILDING_PIPELINE', 'RESOURCE_OIL');

INSERT INTO Building_ResourceYieldChangesGlobal
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_PIPELINE', 'RESOURCE_OIL', 'YIELD_GOLD', 2),	
	('BUILDING_PIPELINE', 'RESOURCE_OIL', 'YIELD_PRODUCTION', 2),
	('BUILDING_PIPELINE', 'RESOURCE_OIL', 'YIELD_CULTURE_LOCAL', 2);

INSERT INTO Building_YieldFromBorderGrowth
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PIPELINE', 'YIELD_PRODUCTION', 20),
	('BUILDING_PIPELINE', 'YIELD_SCIENCE', 20);

-- this is a nutty restricted building. if you can build it you probs should!
INSERT INTO	Building_Flavors
		(BuildingType,			FlavorType,	Flavor)
VALUES
	('BUILDING_PIPELINE',	'FLAVOR_EXPANSION',	20),
	('BUILDING_PIPELINE',	'FLAVOR_SCIENCE',	5),
	('BUILDING_PIPELINE',	'FLAVOR_GOLD',	10),
	('BUILDING_PIPELINE',	'FLAVOR_PRODUCTION',	15);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_PIPELINE',	'BUILDINGCLASS_FACTORY');
------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_PIPELINE',			'Pipeline'),
		('TXT_KEY_BUILDING_PIPELINE_TEXT',		'Pipelines exist for the transport of crude and refined petroleum, fuels - such as oil, natural gas and biofuels - and other fluids including sewage, slurry, water, beer, hot water or steam for shorter distances and even pneumatic systems which allow for the generation of suction pressure for useful work and in transporting solid objects. Like the Aqueduct before them, Pipelines are useful for transporting water for drinking or irrigation over long distances when it needs to move over hills, or where canals or channels are poor choices due to considerations of evaporation, pollution, or environmental impact.[NEWLINE][NEWLINE]Pipelines are one of the safest ways of transporting materials as compared to road or rail, and hence in war, pipelines are often the target of military attacks. Indeed, in the United States, 70% of crude oil and petroleum products are shipped by pipeline. (23% are by ship, 4% by truck, and 3% by rail) In Canada for natural gas and petroleum products, 97% are shipped by pipeline.'),
		('TXT_KEY_BUILDING_PIPELINE_STRATEGY',	'The Pipeline is an Atomic-era Building that boosts the value of Oil everywhere in your Empire. Specifically it grants Gold and Border Growth Points, which combine with the Pipeline''s bonuses to border expansion to make your Oil-producing Cities much more productive. This works especially well if the City is relatively new, since its borders will expand much more readily! However, you must establish an Industrial City Connection before you can start exploiting the Pipeline''s power.'),
		('TXT_KEY_BUILDING_PIPELINE_HELP',		'Gain 20 [ICON_PRODUCTION] Production and [ICON_RESEARCH] Science in the City when its borders expand, scaling with Era. +50% [ICON_GOLD] Gold and [ICON_PRODUCTION] Production from the local [ICON_INDUSTRIAL_CONNECTED] City Connection. Internal [ICON_INTERNATIONAL_TRADE] Trade Routes from this City generate +6 [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]+2 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, and [ICON_CULTURE_LOCAL] Border Growth Point to all [ICON_RES_OIL] Oil in the Empire.[NEWLINE][NEWLINE]Requires a nearby [ICON_RES_OIL] Oil Resource and an [ICON_INDUSTRIAL_CONNECTED] Industrial City Connection before it can be constructed.');

