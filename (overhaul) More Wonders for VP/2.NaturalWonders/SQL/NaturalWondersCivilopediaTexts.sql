----------------------------------------------------
-- Modifier of Historical data for NWs
-- Jul 15, 2021: Created, adan_eslavo
-----------------------------------------------------------
-- Corrected names with the "the" in their names
-----------------------------------------------------------
UPDATE Language_en_US SET Text = REPLACE(Text, 'The ', '') 	WHERE Tag = 'TXT_KEY_FEATURE_REEF';
UPDATE Language_en_US SET Text = REPLACE(Text, 'The ', '') 	WHERE Tag = 'TXT_KEY_FEATURE_MESA';
UPDATE Language_en_US SET Text = REPLACE(Text, 'The ', '') 	WHERE Tag = 'TXT_KEY_FEATURE_CRATER';
-----------------------------------------------------------
-- Moved Civilopedia entry from OLD_REEF to NEW_REEF
-----------------------------------------------------------
INSERT INTO Language_en_US
			(Tag,									Text)
SELECT		'TXT_KEY_CIV5_FEATURES_NEW_REEF_TEXT',	Text	FROM Language_en_US WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT';
-----------------------------------------------------------
-- Goddess of Nature change for multi-tile Natural Wonders
-----------------------------------------------------------
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_CULTURE]', '+3 [ICON_CULTURE]') WHERE Tag ='TXT_KEY_BELIEF_ONE_WITH_NATURE';
UPDATE Language_en_US SET Text = Text||' (split propotionally between all tiles of multi-tile Natural Wonders)' WHERE Tag ='TXT_KEY_BELIEF_ONE_WITH_NATURE';
-----------------------------------------------------------
-- One liners = Help texts (Game Info in Civilopedia)
-----------------------------------------------------------
UPDATE Language_en_US SET Text = 'Mythical fountain, whose water was believed to give everlasting youth to those drinking it.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_HELP';
UPDATE Language_en_US SET Text = 'Mythical city, believed to be hidden deep in the jungles of America, made of gold and full of riches Europeans searched for ages.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_HELP';
UPDATE Language_en_US SET Text = 'Volcano that is the highest peak in Africa and the highest single free-standing mountain above sea level in the world.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_HELP';
UPDATE Language_en_US SET Text = 'Mountain that contains, what is believed to be, a footprint of a holy person by four different religions (Hinduism, Buddhism, Islam and Indian Christianity).' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SRI_PADA_HELP';

INSERT INTO Language_en_US
			(Tag,											Text)
VALUES		('TXT_KEY_CIV5_FEATURES_CRATER_HELP',			'One of the biggests, and the surely the best preserved meteor crater in the world.'),
			('TXT_KEY_CIV5_FEATURES_FUJI_HELP',				'Volcano that has one of the most epic and beautiful cones, being inspiration for many artists.'),
			('TXT_KEY_CIV5_FEATURES_MESA_HELP',				'Largest flat-topped mountain in the world.'),
			('TXT_KEY_CIV5_FEATURES_NEW_REEF_HELP',			'The biggest coral reef in the world.'),
			('TXT_KEY_CIV5_FEATURES_VOLCANO_HELP',			'Volcano that performed one of the greatest erruptions of human age, devastating life, destroying and creating lands, and killing tousands of people.'),
			('TXT_KEY_CIV5_FEATURES_GIBRALTAR_HELP',		'Lonely rock marking the gateway to the Mediterranean Sea, and being used as a defensive feature.'),
			('TXT_KEY_CIV5_FEATURES_GEYSER_HELP',			'One of the most regular geysers in the world, with one of the most frequent eruptions rate.'),
			('TXT_KEY_CIV5_FEATURES_POTOSI_HELP',			'Silver, gold and other resources mined by slaves from this mountain was constantly carried to Europe on enormous scale and broke the economics of that time.'),
			('TXT_KEY_CIV5_FEATURES_MT_SINAI_HELP',			'Mountain, where according to the Bible, the Decalogue was given to Moses in form of the tablets.'),
			('TXT_KEY_CIV5_FEATURES_MT_KAILASH_HELP',		'Mountain that is a holy peak of four different religions: Hinduism, Buddhism, Jainism and Bon.'),
			('TXT_KEY_CIV5_FEATURES_ULURU_HELP',			'Lonely rock of unknown origin, being a sacred place of local Aboriginal tribes.'),
			('TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_HELP',	'The biggest tropical lake feeding numerous african countries and tribes around.'),
			('TXT_KEY_CIV5_FEATURES_SOLOMONS_MINES_HELP',	'Mythical mines that helped biblical ruler to accumulate enormous amonts of gold.'),
			('TXT_KEY_CIV5_FEATURES_SALAR_HELP',			'The biggest salt flat in the world, where speed records are often broken and satellites calibrate their devices using its surface.'),
			('TXT_KEY_CIV5_FEATURES_CAUSEWAY_HELP',			'Unusual hexagonal basalt columns growing up from the water and land.'),
			('TXT_KEY_CIV5_FEATURES_MT_EVEREST_HELP',		'Highest and the most famous peak in the world, and surely the most besieged mountain of all known.'),
			('TXT_KEY_CIV5_FEATURES_RETBA_HELP',			'Salt lake inhabited by unusual pink algae.'),
			('TXT_KEY_CIV5_FEATURES_BERMUDA_HELP',			'Mysterious area, where ships and planes seemed to disappear and never happened to be found.'),
			('TXT_KEY_CIV5_FEATURES_LUMI_BAY_HELP',			'Bay inhabited by unusual kinds of phytoplancton glowing blue and giving wonderful visual effects.'),
			('TXT_KEY_CIV5_FEATURES_DALLOL_HELP',			'Cinder cone volcano in Ethiopia that holds a record of highest average temperatures on Earth (34.4°C). It is known of unearthly colors and mineral patterns, and the very acidic fluids that discharge from its hydrothermal springs. The coexistence of such extreme physicochemical characteristics (pH, salinity, high temperature, lack of oxygen, etc.) render Dallol one of the very few "poly-extreme" sites on Earth.'),
			('TXT_KEY_CIV5_FEATURES_MT_PAEKTU_HELP',		'Holy mountain of both Korean nations and still active volcano that erupts appx. every 100 years. At 2,744 m, it is the tallest mountain in North Korea and Northeast China, and it contains huge volcanic crater lake, being the source of three rivers: Songhua, Tumen and Yalu. The eruption in 946, one that created the Heaven Lake, was among the largest and most powerful eruptions on Earth in the last 5,000 years.'),
			('TXT_KEY_CIV5_FEATURES_EYE_OF_SAHARA_HELP',	'Prominent circular geological feature located in the heart of Sahara desert. It is an eroded geological dome, 40 kilometres in diameter, caused by a subsurface igneous intrusion deforming the overlying sedimentary rock layers. Oldest layers are exposed at the centre of the structure. It looks like concentric rings and it can be seen in its full shape only from the air or space.'),
			('TXT_KEY_CIV5_FEATURES_BLUE_HOLE_HELP',		'Large marine sinkhole off the coast of Belize. Surrounded by coral reefs and atolls, it was formed during several phases of the "Quaternary glaciation" when sea levels were much lower. Because of its depth of 124 m (width of 300 m) it is very popular scuba diving place and huge tourist attraction. It also hosted few marine scientific expeditions, including the most famous one, of Jacques Cousteau.'),
			('TXT_KEY_CIV5_FEATURES_GALAPAGOS_HELP',		'Isolated pacific archipelago full of active volcanoes. Estimation says that almost 80% of birds, 97% mammals and reptiles and 30% of plants living there are endemic species. In 19th century British biologist Charles Darwin visited Galapagos Islands on HMS "Beagle" to research and catalogue plants and animals met there. His notes and sketches were an inspiration and proof of the "theory of evolution", he published few years later.'),
			('TXT_KEY_CIV5_FEATURES_HA_LONG_HELP',			'Bay that features thousands of limestone karsts and islets in various shapes and sizes. The limestone in this bay has gone through 500 million years of formation, and the karst about 20 million years. It hosted prehistorical human beings and numerous cultures. Legend says that "Descending dragons" came to the the bay to protect the Vietnamese people and defend their country.'),
			('TXT_KEY_CIV5_FEATURES_ZHANGJIAJIE_HELP',		'Pillar-like formations created by many years of physical, rather than chemical, erosion, which is not a standard for karst terrain. In 2002, the Bailong Elevator, literally "hundred dragons sky lift", was opened to the public. At 326 m, it is the world''s tallest outdoor lift. Zhangjiajie mountains were also an inspiration for the unique scenography of planet Pandora in "Avatar" science-fiction movie.'),
			('TXT_KEY_CIV5_FEATURES_AURORA_HELP',			'Beautiful light effects on the sky created by Earth''s magnetosphere as a result of solar wind from coronal holes and coronal mass ejections. It can be seen on high-latitude regions, mostly on the poles, but from time to time also in lower latitudes. It can form different shapes like surfaces, arcs or coronas in different colurs from red and green to blue and ultraviolet.'),
			('TXT_KEY_CIV5_FEATURES_ARCH_HELP',				'Delicate sand formation discovered by an erosion. The arch is the most widely recognized landmark in Arches National Park and is depicted on Utah license plates and a postage stamp. The Olympic torch relay for the 2002 Winter Olympics passed through the arch. It was also a challenge for mountain climbers, but after its continuous degeneration, climbing is now forbidden.'),
			('TXT_KEY_CIV5_FEATURES_DANXIA_HELP',			'Beautiful multicoloured hills and mountains created around 24 million years ago from sandstone and other minerals. They look like multi-layered cake and thanks to wind, rain, and time which sculpted extraordinary shapes, including towers, pillars, and ravines, with varying colours, patterns, and sizes, it is huge tourism attraction of Northern China.'),
			('TXT_KEY_CIV5_FEATURES_JEJU_DO_HELP',			'Huge volcanic caldera made of tuff, being the leftover of emerging magma. Created appx. 6,700 years ago, initially separated from the island Jejudo, it finally connected and now serves as one of the best tourism attraction of South Korea. It is said, that the most beautiful sunrises can be captured right there, and because of that, it hosts Seongsan Sunrise Festival.'),
			('TXT_KEY_CIV5_FEATURES_MARIANA_HELP',			'');

-----------------------------------------------------------
-- Civilopedia replacements (deleted texts out of date)
-----------------------------------------------------------
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_RESEARCH] Science from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_BARRINGER_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_PRODUCTION] Production from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_POTOSI_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_CULTURE] Culture from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_RESEARCH] Science from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_FOOD] Food from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GRANDMESA_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_RESEARCH] Science from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_A_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_RESEARCH] Science from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_B_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_RESEARCH] Science from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_C_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_CULTURE] Culture from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_PRODUCTION] Production from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SOLOMONS_MINES_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_RESEARCH] Science from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KRAKATOA_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_FOOD] Food from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_CULTURE] Culture from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FUJI_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_PEACE] Faith from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_MT_KAILASH_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_PEACE] Faith from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_MT_SINAI_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_CULTURE] Culture from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_OLDFAITHFUL_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_GOLD] Gold from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GIBRALTER_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_FOOD] Food from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SRI_PADA_TEXT';
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_PRODUCTION] Production from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_ULURU_TEXT';