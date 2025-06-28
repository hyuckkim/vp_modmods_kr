--======================
-- Trait Changes 
--======================
--UPDATE Language_en_US
--SET Text = '+1 [ICON_WAR] Attack[NEWLINE]Gain [ICON_CULTURE] Culture [COLOR_POSITIVE_TEXT]on Promotion[ENDCOLOR].'
--WHERE Tag = 'TXT_KEY_PROMOTION_MONGOL_TERROR_HELP';

UPDATE Language_en_US
SET Text = 'Skirmisher Units have an extra [ICON_WAR] Attack. +1 [ICON_FOOD] Food, [ICON_CULTURE] Culture, [ICON_CULTURE_LOCAL] Border Growth Point, and [ICON_GREAT_GENERAL] Great General Point from [ICON_RES_HORSE] Horse Resources, Stables, and Agribusinesses.'
WHERE Tag = 'TXT_KEY_TRAIT_TERROR';

UPDATE Language_en_US
SET Text = 'Khiimori'
WHERE Tag = 'TXT_KEY_TRAIT_TERROR_SHORT';

--==================
-- UB Changes
--==================
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_MONGOLIA_TUVAN',			'Tuvan Ail'),
		('TXT_KEY_BUILDING_MONGOLIA_TUVAN_TEXT',		'Tuvan-Mongol throat singing, the main technique of which is known as khoomei is a style of singing practiced by people in Tuva and Mongolia. It is noted for including overtone singing. In 2009, it was included in the Representative List of the Intangible Cultural Heritage of Humanity of UNESCO. The open landscape of Tuva allows for the sounds to carry a great distance. Ethnomusicologists studying throat singing in these areas mark khoomei as an integral part in the ancient pastoral animism still practiced today.[NEWLINE][NEWLINE]Tuvan is most often performed outdoors, and often singers travel far into the countryside looking for the right river, or go up to the steppes of the mountainside to create the proper environment for throat singing. The most traditional and intimate venue is the "Ail",  an Turkic and Mongolic word meaning village, encampment, or family camp. In Tuvan and Kyrgyz contexts, it refers specifically to the cluster of yurts (gers) of a small nomadic community or extended family settlement on the steppe. Singing often happens inside a ger, especially during family gatherings, storytelling, or celebrations, where the acoustics of a felt-covered ger enhance the resonance of throat singing.'),
		('TXT_KEY_BUILDING_MONGOLIA_TUVAN_STRATEGY',	'Beyond the usual bonuses of the Musicians Guild, the Tuvan Ali generates additional bonuses which are amplified based on the location of the City. Mountains, abundant Plains or Grassland, and Pastures all lead to large bonuses including the lucrative yields of Culture, Faith, and Tourism. It has only limited instances in your Empire, so choose the Cities in which you build it carefully for maximum effect to play into your grand strategy!'),
		('TXT_KEY_BUILDING_MONGOLIA_TUVAN_HELP',		'+2 [ICON_FOOD] Food, [ICON_CULTURE] Culture, and [ICON_CULTURE_LOCAL] Border Growth Points, and [ICON_GREAT_GENERAL] Great General Points from [ICON_VP_MUSICIAN] Musicians and Pastures worked by the City. +3 [ICON_CULTURE] Culture, [ICON_PEACE] Faith, and [ICON_TOURISM] Tourism for every Mountain within the workable tiles.[NEWLINE][NEWLINE]Nearby Grassland: +1 [ICON_FOOD] Food and [ICON_TOURISM] Tourism.[NEWLINE]Nearby Plains: +1 [ICON_PRODUCTION] Production and [ICON_PEACE] Faith.[NEWLINE][NEWLINE]1 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.[NEWLINE][NEWLINE]Maximum of 3 of these Buildings in your Empire.');

------------------------------------------------
--UPDATE Language_en_US
--SET Text = 'Unique MONGOLIA replacement for the {TXT_KEY_BUILDING_LODGE}. In addition to the {TXT_KEY_BUILDING_LODGE}''s bonuses, {TXT_KEY_BUILDING_YURT} generates [ICON_GOLD] Gold; boosts pastures; provides [ICON_PRODUCTION] Production when borders expand; and makes borders expand faster.'
--WHERE Tag = 'TXT_KEY_BUILDING_YURT_STRATEGY';