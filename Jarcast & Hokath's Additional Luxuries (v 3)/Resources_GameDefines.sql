--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
---- Resources
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resources
		(Type, 				AnimalResource, LandResource, Description, 				Civilopedia, 					ResourceClassType, Happiness, IsMonopoly, Hills, ArtDefineTag, 				IconString, PortraitIndex, IconAtlas)
SELECT	'RESOURCE_ALPACA', 	AnimalResource, LandResource, 'TXT_KEY_RESOURCE_ALPACA','TXT_KEY_RESOURCE_ALPACA_TEXT',	ResourceClassType, Happiness, IsMonopoly, Hills, 'ART_DEF_RESOURCE_ALPACA', '[ICON_RES_ALPACA]', 0, 'JAR_ADDLUX_ATLAS' 
FROM Resources WHERE Type = 'RESOURCE_IVORY';

INSERT INTO Resources
		(Type, 				AnimalResource, LandResource, Description, 				Civilopedia, 					ResourceClassType, Happiness, IsMonopoly, Flatlands, ArtDefineTag, 				IconString, PortraitIndex, IconAtlas)
SELECT	'RESOURCE_CAMEL', 	AnimalResource, LandResource, 'TXT_KEY_RESOURCE_CAMEL',	'TXT_KEY_RESOURCE_CAMEL_TEXT',	ResourceClassType, Happiness, IsMonopoly, Flatlands, 'ART_DEF_RESOURCE_CAMEL', '[ICON_RES_CAMEL]', 1, 'JAR_ADDLUX_ATLAS' 
FROM Resources WHERE Type = 'RESOURCE_IVORY';

INSERT INTO Resources
		(Type, 				RockResource, LandResource, Description, 				Civilopedia, 					ResourceClassType, Happiness, IsMonopoly, Hills, ArtDefineTag, 				IconString, PortraitIndex, IconAtlas)
SELECT	'RESOURCE_QUARTZ', 	RockResource, LandResource, 'TXT_KEY_RESOURCE_QUARTZ',	'TXT_KEY_RESOURCE_QUARTZ_TEXT',	ResourceClassType, Happiness, IsMonopoly, Hills, 'ART_DEF_RESOURCE_QUARTZ', '[ICON_RES_QUARTZ]', 2, 'JAR_ADDLUX_ATLAS'
FROM Resources WHERE Type = 'RESOURCE_AMBER';
----------------------------------------------------------------------------------------------------------------------------
---- Resource_TerrainBooleans
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_TerrainBooleans
(ResourceType,		TerrainType) VALUES
('RESOURCE_ALPACA',	'TERRAIN_HILL'),
('RESOURCE_CAMEL',	'TERRAIN_DESERT'),
('RESOURCE_QUARTZ',	'TERRAIN_DESERT'),
('RESOURCE_QUARTZ',	'TERRAIN_PLAINS'),
('RESOURCE_QUARTZ',	'TERRAIN_GRASS'),
('RESOURCE_QUARTZ',	'TERRAIN_TUNDRA');
----------------------------------------------------------------------------------------------------------------------------
---- Resource_YieldChanges
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_YieldChanges
(ResourceType, 		YieldType, Yield) VALUES
('RESOURCE_ALPACA', 'YIELD_FOOD', 		1),
('RESOURCE_ALPACA', 'YIELD_PRODUCTION', 1),
('RESOURCE_CAMEL', 	'YIELD_FOOD', 		2),
('RESOURCE_QUARTZ', 'YIELD_PRODUCTION', 1),
('RESOURCE_QUARTZ', 'YIELD_GOLD', 		1);
----------------------------------------------------------------------------------------------------------------------------
---- Resource_Flavors
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_Flavors 	
		(ResourceType, FlavorType, Flavor)
SELECT	Type, 'FLAVOR_HAPPINESS', 10
FROM Resources WHERE Type IN ('RESOURCE_ALPACA', 'RESOURCE_CAMEL', 'RESOURCE_QUARTZ');
----------------------------------------------------------------------------------------------------------------------------
---- Resource_CityYieldModFromMonopoly
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_CityYieldModFromMonopoly
(ResourceType,	 YieldType, Yield) VALUES
('RESOURCE_CAMEL', 'YIELD_GOLD', 10),
('RESOURCE_QUARTZ', 'YIELD_SCIENCE', 10);
----------------------------------------------------------------------------------------------------------------------------
---- Resource_YieldChangeFromMonopoly
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_YieldChangeFromMonopoly
		(ResourceType,		YieldType, 			Yield)
VALUES	('RESOURCE_ALPACA', 'YIELD_CULTURE', 	2);

UPDATE Resources SET Help='TXT_KEY_RESOURCE_MONOPOLY_YIELD_CULTURE' WHERE Type='RESOURCE_ALPACA';
UPDATE Resources SET Help='TXT_KEY_RESOURCE_MONOPOLY_MOD_GOLD' WHERE Type='RESOURCE_CAMEL';
UPDATE Resources SET Help='TXT_KEY_RESOURCE_MONOPOLY_MOD_SCIENCE' WHERE Type='RESOURCE_QUARTZ';
----------------------------------------------------------------------------------------------------------------------------
-- Corporation_ResourceMonopolyOrs
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Corporation_ResourceMonopolyOrs
		(CorporationType, 					ResourceType)
SELECT	'CORPORATION_GIORGIO_ARMEIER',		'RESOURCE_ALPACA' UNION ALL
SELECT	'CORPORATION_LANDSEA_EXTRACTORS',	'RESOURCE_CAMEL' UNION ALL
SELECT	'CORPORATION_FIRAXITE_MATERIALS',	'RESOURCE_QUARTZ';
----------------------------------------------------------------------------------------------------------------------------
-- Corporation_ResourceYieldChanges
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Corporation_ResourceYieldChanges
		(CorporationType, ResourceType, 		YieldType, Yield)
SELECT	 CorporationType, 'RESOURCE_ALPACA',	YieldType, Yield FROM Corporation_ResourceYieldChanges WHERE CorporationType='CORPORATION_GIORGIO_ARMEIER' UNION ALL
SELECT	 CorporationType, 'RESOURCE_CAMEL',		YieldType, Yield FROM Corporation_ResourceYieldChanges WHERE CorporationType='CORPORATION_LANDSEA_EXTRACTORS' UNION ALL
SELECT	 CorporationType, 'RESOURCE_QUARTZ',	YieldType, Yield FROM Corporation_ResourceYieldChanges WHERE CorporationType='CORPORATION_FIRAXITE_MATERIALS';
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
---- Improvement_ResourceTypes
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ResourceTypes
		(ResourceType, 		ImprovementType)
SELECT	'RESOURCE_ALPACA', 	'IMPROVEMENT_PASTURE' UNION ALL
SELECT	'RESOURCE_CAMEL', 	'IMPROVEMENT_PASTURE' UNION ALL
SELECT	'RESOURCE_QUARTZ', 	'IMPROVEMENT_QUARRY';
----------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceType_Yields
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ResourceType_Yields
(ImprovementType, 		ResourceType, 		YieldType, Yield) VALUES
('IMPROVEMENT_PASTURE', 'RESOURCE_ALPACA', 	'YIELD_GOLD', 		2),
('IMPROVEMENT_PASTURE', 'RESOURCE_ALPACA', 	'YIELD_CULTURE', 	1),
('IMPROVEMENT_PASTURE', 'RESOURCE_CAMEL', 	'YIELD_GOLD', 		2),
('IMPROVEMENT_PASTURE', 'RESOURCE_CAMEL', 	'YIELD_PRODUCTION', 1),
('IMPROVEMENT_QUARRY', 	'RESOURCE_QUARTZ', 	'YIELD_PRODUCTION', 1),
('IMPROVEMENT_QUARRY', 	'RESOURCE_QUARTZ', 	'YIELD_CULTURE', 	1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
---- Building_LocalResourceOrs
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_LocalResourceOrs
		(BuildingType, 			ResourceType)
SELECT	'BUILDING_STONE_WORKS',	'RESOURCE_QUARTZ';
----------------------------------------------------------------------------------------------------------------------------
---- Building_ResourceYieldChanges
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceYieldChanges
(BuildingType, 				ResourceType, 		YieldType, Yield) VALUES
('BUILDING_MINT', 			'RESOURCE_ALPACA', 	'YIELD_GOLD', 		3),
('BUILDING_CARAVANSARY', 	'RESOURCE_CAMEL', 	'YIELD_PRODUCTION', 2),
('BUILDING_WORKSHOP', 		'RESOURCE_QUARTZ', 	'YIELD_SCIENCE', 	1),
('BUILDING_LABORATORY', 	'RESOURCE_QUARTZ', 	'YIELD_SCIENCE', 	3);

--- Unique buildings
INSERT INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType, YieldType, Yield)
SELECT	DISTINCT bco.BuildingType, r.Type, ryc.YieldType, ryc.Yield
FROM Buildings b, Resources r, Civilization_BuildingClassOverrides bco, Building_ResourceYieldChanges ryc
WHERE r.Type IN('RESOURCE_ALPACA','RESOURCE_QUARTZ', 'RESOURCE_CAMEL') AND ryc.ResourceType = r.Type AND b.Type = ryc.BuildingType AND bco.BuildingClassType = b.BuildingClass;

CREATE TRIGGER JarAdditionalLuxuries_BuildingResourceYields
AFTER INSERT ON Civilization_BuildingClassOverrides 
WHEN NEW.BuildingClassType
IN(
	SELECT b.BuildingClass
	FROM Buildings b, Resources r, Building_ResourceYieldChanges ryc
	WHERE r.Type IN('RESOURCE_ALPACA','RESOURCE_QUARTZ', 'RESOURCE_CAMEL')
	AND ryc.ResourceType = r.Type
	AND b.Type = ryc.BuildingType
)
AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_ResourceYieldChanges
					(BuildingType, ResourceType, YieldType, Yield)
	SELECT DISTINCT	NEW.BuildingType, r.Type, ryc.YieldType, ryc.Yield
	FROM Resources r, Building_ResourceYieldChanges ryc, BuildingClasses bc
	WHERE r.Type IN('RESOURCE_ALPACA','RESOURCE_QUARTZ', 'RESOURCE_CAMEL') AND ryc.ResourceType = r.Type AND bc.Type = NEW.BuildingClassType AND ryc.BuildingType = bc.DefaultBuilding;
END;
--==========================================================================================================================
-- GAME TEXT
--==========================================================================================================================
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------
UPDATE Language_en_US SET Text = REPLACE(Text, '[ICON_RES_HORSE] Horse', '[ICON_RES_HORSE] Horse, [ICON_RES_CAMEL] Camel')
WHERE Tag ='TXT_KEY_CORPORATION_RESOURCE_BONUS_LANDSEA_EXTRACTORS';

UPDATE Language_en_US SET Text = REPLACE(Text, '[ICON_RES_MARBLE] Marble', '[ICON_RES_QUARTZ] Quartz, [ICON_RES_MARBLE] Marble')
WHERE Tag ='TXT_KEY_CORPORATION_RESOURCE_BONUS_FIRAXITE_MATERIALS';

UPDATE Language_en_US SET Text = REPLACE(Text, '[ICON_RES_SILK] Silk', '[ICON_RES_ALPACA] Alpaca, [ICON_RES_SILK] Silk')
WHERE Tag ='TXT_KEY_CORPORATION_RESOURCE_BONUS_GIORGIO_ARMEIER';

UPDATE Language_en_US
SET Text = Text || '[NEWLINE]Nearby [ICON_RES_ALPACA] Alpaca: +3 [ICON_GOLD] Gold.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MINT' AND ((Type = 'BUILDING_MINT' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

UPDATE Language_en_US
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_QUARTZ] Quartz: +1 [ICON_RESEARCH] Science.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP' AND ((Type = 'BUILDING_WORKSHOP' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

UPDATE Language_en_US
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_QUARTZ] Quartz: +3 [ICON_RESEARCH] Science.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_LABORATORY' AND ((Type = 'BUILDING_LABORATORY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

UPDATE Language_en_US
SET Text = Text || '[NEWLINE]Nearby [ICON_RES_CAMEL] Camel: +1 [ICON_PRODUCTION] Production, +1 [ICON_GOLD] Gold.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CARAVANSARY' AND ((Type = 'BUILDING_CARAVANSARY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

INSERT OR REPLACE INTO Language_en_US 
(Tag, Text) VALUES
('TXT_KEY_RESOURCE_ALPACA', 'Alpaca'),
('TXT_KEY_RESOURCE_ALPACA_TEXT', 'Alpacas are domesticated animals native to the Andes Mountains in South America, particularly in countries like Peru, Bolivia, and Chile. They are closely related to llamas and are valued primarily for their soft, luxurious fleece, which comes in a variety of natural colors. Domesticated over 6,000 years ago by the indigenous peoples of the Andes Mountains, alpacas are social creatures that live in herds and are known for their gentle and curious demeanor. They primarily graze on grasses and have a unique digestive system that allows them to thrive in harsh mountainous environments. In addition to their fleece, alpacas are often kept as pets and for their charming personalities, making them popular in farms and educational settings.'),
('TXT_KEY_RESOURCE_CAMEL', 'Camel'),
('TXT_KEY_RESOURCE_CAMEL_TEXT', 'Camels are a sort of domesticated ungulate that, as livestock, provide food (camel milk and meat) and textiles (fiber and felt from camel hair), in a similar way to sheep. However camels are also working animals that can carry passengers and cargo in the same way as horses. Indeed between 500 and 100 BC, Bactrian camels came into military use, something that continued even into the First World War. However, in contrast to horses, because they have evolved in extremely dry habitats, they are able to effectively work in desert terrain. Despite popular belief, camels do not store water in the humps on their backs (which are reserves of fatty tissue) but instead retain water through a series of less evident adaptations. For example, they have oval shaped red blood cells that have much improved performance under highly osmotic conditions: both dehydration and rapid rehydration. A camel can drink 200 litres of water in three minutes!'),
('TXT_KEY_RESOURCE_QUARTZ', 'Quartz'),
('TXT_KEY_RESOURCE_QUARTZ_TEXT', 'Roman naturalist Pliny the Elder believed quartz to be water ice, permanently frozen after great lengths of time. We now know that it is silicon dioxide, the second most abundant mineral in Earth''s continental crust. In antiquity it was often present in a burial context, such as in at Newgrange in Ireland, and as a material for jewelry and small sculptures. Archaeologists have also found it was used for stone tools, since it is harder than the more common feldspar. Most commonly colorless and transparent, different microscopic habitats and impurities lead to both colored (e.g. Amethyst) and opaque (e.g. Onyz) varieties. However, only the purest quartz is suitable for scientific applications, and by the 1930s the electronics industry had become dependent on a grade of silicon that could only be sourced in Brazil. This rarity prompted a search for alternative ways to grow quartz, and today synthetic preparation techniques allow for the creation of precisely structured crystals even on the nanoscale. An essential resource, quartz-based components are exploited for all manner of technological applications, from microbalances to solar cells.');
--==========================================================================================================================
--==========================================================================================================================