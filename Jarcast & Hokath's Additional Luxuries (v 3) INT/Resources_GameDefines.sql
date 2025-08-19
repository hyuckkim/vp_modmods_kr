--==========================================================================================================================
-- GAME TEXT
--==========================================================================================================================
UPDATE Language_ko_KR SET Text = REPLACE(Text, '[ICON_RES_HORSE] Horse', '[ICON_RES_HORSE] Horse, [ICON_RES_CAMEL] Camel')
WHERE Tag ='TXT_KEY_CORPORATION_RESOURCE_BONUS_LANDSEA_EXTRACTORS';

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[ICON_RES_MARBLE] Marble', '[ICON_RES_QUARTZ] Quartz, [ICON_RES_MARBLE] Marble')
WHERE Tag ='TXT_KEY_CORPORATION_RESOURCE_BONUS_FIRAXITE_MATERIALS';

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[ICON_RES_SILK] Silk', '[ICON_RES_ALPACA] Alpaca, [ICON_RES_SILK] Silk')
WHERE Tag ='TXT_KEY_CORPORATION_RESOURCE_BONUS_GIORGIO_ARMEIER';

UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE]Nearby [ICON_RES_ALPACA] Alpaca: +3 [ICON_GOLD] Gold.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MINT' AND ((Type = 'BUILDING_MINT' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_QUARTZ] Quartz: +1 [ICON_RESEARCH] Science.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP' AND ((Type = 'BUILDING_WORKSHOP' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_QUARTZ] Quartz: +3 [ICON_RESEARCH] Science.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_LABORATORY' AND ((Type = 'BUILDING_LABORATORY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE]Nearby [ICON_RES_CAMEL] Camel: +1 [ICON_PRODUCTION] Production, +1 [ICON_GOLD] Gold.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CARAVANSARY' AND ((Type = 'BUILDING_CARAVANSARY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

INSERT OR REPLACE INTO Language_ko_KR 
(Tag, Text) VALUES
('TXT_KEY_RESOURCE_ALPACA', 'Alpaca'),
('TXT_KEY_RESOURCE_ALPACA_TEXT', 'Alpacas are domesticated animals native to the Andes Mountains in South America, particularly in countries like Peru, Bolivia, and Chile. They are closely related to llamas and are valued primarily for their soft, luxurious fleece, which comes in a variety of natural colors. Domesticated over 6,000 years ago by the indigenous peoples of the Andes Mountains, alpacas are social creatures that live in herds and are known for their gentle and curious demeanor. They primarily graze on grasses and have a unique digestive system that allows them to thrive in harsh mountainous environments. In addition to their fleece, alpacas are often kept as pets and for their charming personalities, making them popular in farms and educational settings.'),
('TXT_KEY_RESOURCE_CAMEL', 'Camel'),
('TXT_KEY_RESOURCE_CAMEL_TEXT', 'Camels are a sort of domesticated ungulate that, as livestock, provide food (camel milk and meat) and textiles (fiber and felt from camel hair), in a similar way to sheep. However camels are also working animals that can carry passengers and cargo in the same way as horses. Indeed between 500 and 100 BC, Bactrian camels came into military use, something that continued even into the First World War. However, in contrast to horses, because they have evolved in extremely dry habitats, they are able to effectively work in desert terrain. Despite popular belief, camels do not store water in the humps on their backs (which are reserves of fatty tissue) but instead retain water through a series of less evident adaptations. For example, they have oval shaped red blood cells that have much improved performance under highly osmotic conditions: both dehydration and rapid rehydration. A camel can drink 200 litres of water in three minutes!'),
('TXT_KEY_RESOURCE_QUARTZ', 'Quartz'),
('TXT_KEY_RESOURCE_QUARTZ_TEXT', 'Roman naturalist Pliny the Elder believed quartz to be water ice, permanently frozen after great lengths of time. We now know that it is silicon dioxide, the second most abundant mineral in Earth''s continental crust. In antiquity it was often present in a burial context, such as in at Newgrange in Ireland, and as a material for jewelry and small sculptures. Archaeologists have also found it was used for stone tools, since it is harder than the more common feldspar. Most commonly colorless and transparent, different microscopic habitats and impurities lead to both colored (e.g. Amethyst) and opaque (e.g. Onyz) varieties. However, only the purest quartz is suitable for scientific applications, and by the 1930s the electronics industry had become dependent on a grade of silicon that could only be sourced in Brazil. This rarity prompted a search for alternative ways to grow quartz, and today synthetic preparation techniques allow for the creation of precisely structured crystals even on the nanoscale. An essential resource, quartz-based components are exploited for all manner of technological applications, from microbalances to solar cells.');