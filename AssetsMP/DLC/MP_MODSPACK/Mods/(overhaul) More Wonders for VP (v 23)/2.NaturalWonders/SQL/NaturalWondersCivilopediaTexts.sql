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
			(Tag,										Text)
SELECT		'TXT_KEY_CIV5_FEATURES_NEW_REEF_A_TEXT',	Text	FROM Language_en_US WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT' UNION ALL
SELECT		'TXT_KEY_CIV5_FEATURES_NEW_REEF_B_TEXT',	Text	FROM Language_en_US WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT' UNION ALL
SELECT		'TXT_KEY_CIV5_FEATURES_NEW_REEF_C_TEXT',	Text	FROM Language_en_US WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT';
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
			('TXT_KEY_CIV5_FEATURES_DALLOL_HELP',			'Flat volcanoes, creating unusual lake structures formed by huge african rifts.'),
			('TXT_KEY_CIV5_FEATURES_MT_PAEKTU_HELP',		'Holy mountain of both Korean nations, and the highest volcanic lake of all known.'),
			('TXT_KEY_CIV5_FEATURES_EYE_OF_SAHARA_HELP',	'Huge sand formation of unknown origin, which is seen in its full shape only from the air or space.'),
			('TXT_KEY_CIV5_FEATURES_BLUE_HOLE_HELP',		'Giant marine sinkhole surrounded by coral reefs and atolls.'),
			('TXT_KEY_CIV5_FEATURES_GALAPAGOS_HELP',		'Isolated archipelago with endemic flora and fauna.'),
			('TXT_KEY_CIV5_FEATURES_HA_LONG_HELP',			'Bay with enormous amount of islands and unique rock formations.'),
			('TXT_KEY_CIV5_FEATURES_ZHANGJIAJIE_HELP',		'Unique rock formations being an inspiration for the unique scenes in science-fiction movie.'),
			('TXT_KEY_CIV5_FEATURES_AURORA_HELP',			'Beautiful light effects on the sky created by the magnetic field of Earth, and seen mostly on the poles.');

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