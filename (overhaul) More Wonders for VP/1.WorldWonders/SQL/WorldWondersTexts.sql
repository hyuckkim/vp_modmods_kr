----------------------------------------------------
-- Text file for all Wonders
-- Feb 20, 2020: Created, adan_eslavo
----------------------------------------------------
-- Altamira Cave
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ALTAMIRA',			'Altamira Cave'),
			('TXT_KEY_WONDER_ALTAMIRA_QUOTE',		'[NEWLINE]"After Altamira everything seems decadent."[NEWLINE] - Pablo Picasso[NEWLINE]'),
			('TXT_KEY_WONDER_ALTAMIRA_PEDIA',		'Altamira Cave is approximately 1,000 m (3,280.84 ft) meters long and consists of a series of twisting passages and chambers. The main passage varies from two to six meters in height. The cave was formed through collapses following early karst phenomena in the calcareous rock of Mount Vispieres. Archaeological excavations in the cave floor found rich deposits of artifacts from the Upper Solutrean (c. 18,500 years ago) and Lower Magdalenian (between c. 16,590 and 14,000 years ago). Both periods belong to the Paleolithic or Old Stone Age. In the two millennia between these two occupations, the cave was evidently inhabited only by wild animals. Human occupants of the site were well-positioned to take advantage of the rich wildlife that grazed in the valleys of the surrounding mountains as well as the marine life available in nearby coastal areas. Around 13,000 years ago a rockfall sealed the cave''s entrance, preserving its contents until its eventual discovery, which occurred after a nearby tree fell and disturbed the fallen rocks. Human occupation was limited to the cave mouth, although paintings were created throughout the length of the cave. The artists used charcoal and ochre or hematite to create the images, often diluting these pigments to produce variations in intensity and creating an impression of chiaroscuro. They also exploited the natural contours of the cave walls to give their subjects a three-dimensional effect. The Polychrome Ceiling is the most impressive feature of the cave, depicting a herd of extinct steppe bison (Bison priscus) in different poses, two horses, a large doe, and possibly a wild boar. Dated to the Magdalenian occupation, these paintings include abstract shapes in addition to animal subjects. Solutrean paintings include images of horses and goats, as well as handprints that were created when artists placed their hands on the cave wall and blew pigment over them to leave a negative image. Numerous other caves in northern Spain contain Paleolithic art, but none is as complex or well-populated as Altamira.'),
			('TXT_KEY_WONDER_ALTAMIRA_HELP',		'Contains 1 slot for [ICON_GREAT_WORK] Great Work of Art or Artifact. +3 [ICON_CULTURE] Culture with [COLOR_CYAN]Archaeology[ENDCOLOR].[NEWLINE][NEWLINE]Nearby [ICON_RES_BISON] Bison: +1 [ICON_FOOD] Food and +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_DEER] Deer: +1 [ICON_FOOD] Food and +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_HORSE] Horses: +1 [ICON_FOOD] Food and +1 [ICON_CULTURE] Culture.');

UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Altamira Cave[ENDCOLOR] greatly supports early culture generation (+1[ICON_CULTURE]), especially if [COLOR_GREY]Bisons[ENDCOLOR], [COLOR_GREY]Deers[ENDCOLOR] or [COLOR_GREY]Horses[ENDCOLOR] (+1[ICON_FOOD], +1[ICON_CULTURE]/[ICON_RES_BISON], [ICON_RES_DEER], [ICON_RES_HORSE]) are present nearby. Maximize its effectiveness by filling empty art slot (+1[ICON_GREAT_WORK]) or by rushing advanced technologies ([COLOR_CYAN]Archaeology[ENDCOLOR]: +3[ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ALTAMIRA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ALTAMIRA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Improved Resource: [ICON_RES_BISON] [COLOR_CYAN]Bison[ENDCOLOR]/[ICON_RES_DEER] [COLOR_CYAN]Deer[ENDCOLOR]/[ICON_RES_HORSE] [COLOR_CYAN]Horses[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [ICON_RES_BISON] [COLOR_CYAN]Bison[ENDCOLOR]/[ICON_RES_DEER] [COLOR_CYAN]Deer[ENDCOLOR]/[ICON_RES_HORSE] [COLOR_CYAN]Horses[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Ggantija
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_GGANTIJA',			'Ggantija'),
			('TXT_KEY_WONDER_GGANTIJA_QUOTE',		'[NEWLINE]"We need to find God, and he cannot be found in noise and restlessness. God is the friend of silence. See how nature - trees, flowers, grass - grows in silence; see the stars, the moon and the sun, how they move in silence... We need silence to be able to touch souls."[NEWLINE] - Mother Teresa[NEWLINE]'),
			('TXT_KEY_WONDER_GGANTIJA_PEDIA',		'Ggantija (Giants'' Tower) is a megalithic temple complex in Malta on the Mediterranean island of Gozo. Its makers erected the two Ggantija temples during the Neolithic Age (c. 3600-2500 BC), which makes the buildings more than 5500 years old and the world''s second oldest manmade religious structures, after Gobekli Tepe. The temples were possibly the site of a Fertility cult - archeologists believe that the numerous figurines and statues found on site are connected with that cult.'),
			('TXT_KEY_WONDER_GGANTIJA_HELP',		'Grants 50 [ICON_FOOD] Food after construction. Converts 10% [ICON_PEACE] Faith produced by this City into [ICON_FOOD] Food. All Farms in the Empire receive +1 [ICON_FOOD] Food.');

UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Ggantija[ENDCOLOR] boosts your empire''s growth right after construction (50[ICON_FOOD]) and upgrades all [COLOR_CITY_BROWN]Farms[ENDCOLOR] (+1[ICON_FOOD]/[ICON_WORKER][ICON_WORKER]). To increase your city developement even more, you should fully focus on religion (10%[ICON_PEACE] into [ICON_FOOD]).'
WHERE Tag = 'TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GGANTIJA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GGANTIJA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR]; Improvement: [COLOR_CYAN]2 Farms[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------				
-- Goebekli Tepe	
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GOEBEKLI_TEPE',			'Goebekli Tepe'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_QUOTE',		'[NEWLINE]"Look up at the stars and not down at your feet. Try to make sense of what you see, and wonder about what makes the universe exist. Be curious."[NEWLINE] - Stephen Hawking[NEWLINE]'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_PEDIA',		'Göbekli Tepe is a religious site located in southern Turkey, near the Syrian border. It is the oldest known religious building on earth, dating to approximately 10000 BCE, during the Neolithic age of Human civilization, and predating all major civilizations and cities by several millenia. It was first observed during the 1960''s, when archeologists noted that the hill could not be natural due to the shape, yet dismissed it as a Byzantine burial ground. This belief persisted until 1994, and not excavated until a year later. The complex is similar in form to Stonehenge, with a round shape and large Monolithic stones. However, unlike Stonehenge, many of the pillars are carved with the figures of several animals, which are believed to have been sacred to the hunter-gatherers which constructed Göbekli Tepe.'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP',		'+1 [ICON_RESEARCH] Science and +1 [ICON_PEACE] Faith from Mountains worked by this City.[NEWLINE][NEWLINE]All [ICON_RES_STONE] Stone: +1 [ICON_RESEARCH] Science.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Goebekli Tepe[ENDCOLOR] is excellent wonder for area filled with [COLOR_CITY_BLUE]Mountains[ENDCOLOR] (+1[ICON_RESEARCH], +1[ICON_PEACE]/[ICON_FLOWER] to City), which increases important yield''s early output (+1[ICON_RESEARCH]; +1[ICON_CULTURE]; +1[ICON_PEACE]). Make sure to claim each [COLOR_GREY]Stone[ENDCOLOR] (+1[ICON_RESEARCH]/[ICON_RES_STONE][ICON_RES_STONE]) deposit you can find.'
WHERE Tag = 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------				
-- Kuk Swamp
INSERT INTO Language_en_US 
			(Tag,							Text) 
VALUES		('TXT_KEY_BUILDING_KUK',		'Kuk Swamp'),
			('TXT_KEY_WONDER_KUK_QUOTE',	'[NEWLINE]"If perfection is stagnation, then Heaven is a swamp."[NEWLINE] - Richard Bach[NEWLINE]'),
			('TXT_KEY_WONDER_KUK_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_KUK_HELP',		'10% [ICON_FOOD] Food is carried over after new [ICON_CITIZEN] Citizen is born. +1 [ICON_PRODUCTION] Production and +1 [ICON_RESEARCH] Science from Marshes worked in the Empire. +5 [ICON_PRODUCTION] Production in the City and +2 [ICON_PRODUCTION] Production in all other Cities with [COLOR_CYAN]Steam Power[ENDCOLOR]');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Kuk Swamp[ENDCOLOR], thanks to unique agricultural techniques, turned [COLOR_CITY_GREEN]Marshes[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[ICON_MUSHROOM][ICON_MUSHROOM]) into rich soil. Use its power to speed up developement of your huge city even more (+10%[ICON_FOOD]/New [ICON_CITIZEN]; [COLOR_CYAN]Steam Power[ENDCOLOR]: +3[ICON_PRODUCTION], +2[ICON_PRODUCTION][ICON_PRODUCTION]).'
WHERE Tag = 'TXT_KEY_WONDER_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KUK_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KUK_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Snow[ENDCOLOR]; Feature: [COLOR_CYAN]Jungle, Marsh[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Marsh[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Majorville Medicine Wheel
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MAJORVILLE',			'Majorville Medicine Wheel'),
			('TXT_KEY_WONDER_MAJORVILLE_QUOTE',		'[NEWLINE]"When the Earth is sick, the animals will begin to disappear, when that happens, The Warriors of the Rainbow will come to save them."[NEWLINE] - Chief Seattle[NEWLINE]'),
			('TXT_KEY_WONDER_MAJORVILLE_PEDIA',		'The Majorville Medicine Wheel is an archaeological site of the Blackfeet nation dating to 3200 BCE. It is a round stone cairn connected to a cobble circle by 28 stone spokes. Traditionally, in certain Native American cultures, medicine wheels are metaphors for a variety of spiritual concepts. However, as it is believed that the Majorville Medicine Wheel was improved upon for successive generations, the precise meaning of the wheel may differ for each generation. Offerings found at the site included sweet grass, willow, cloth, tobacco, and iniskim stones ("buffalo calling stones").'),
			('TXT_KEY_WONDER_MAJORVILLE_HELP',		'+1 [ICON_PEACE] Faith from Tundra tiles worked by this City. All Camps in the Empire receive +1 [ICON_FOOD] Food.[NEWLINE][NEWLINE]All [ICON_RES_BISON] Bison: +1 [ICON_CULTURE] Culture.');
			
UPDATE Language_en_US
SET Text = 'This [COLOR_YIELD_FOOD]Medicine Wheel[ENDCOLOR] strongly supports [COLOR_CITY_BLUE]Tundra[ENDCOLOR] (+1[ICON_PEACE]/[ICON_FLOWER]) developement. You should construct as many [COLOR_CITY_BROWN]Camps[ENDCOLOR] (+1[ICON_FOOD]/[ICON_WORKER][ICON_WORKER]) as possible to increase your growth and and catch all [COLOR_GREY]Bisons[ENDCOLOR] (+1[ICON_CULTURE]/[ICON_RES_BISON][ICON_RES_BISON]) to boost your culture output as well.'
WHERE Tag = 'TXT_KEY_WONDER_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MAJORVILLE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MAJORVILLE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Tundra[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Tundra[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Mohenjo-daro
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_MOHENJO_DARO',			'Mohenjo-daro'),
			('TXT_KEY_WONDER_MOHENJO_DARO_QUOTE',		'[NEWLINE]"A river is an ocean in a desert."[NEWLINE] - Matshona Dhliwayo[NEWLINE]'),
			('TXT_KEY_WONDER_MOHENJO_DARO_PEDIA',		'Built sometime around 2500 BC, Mohenjo-daro was one of the largest of the Harappan civilizations settlements, center of a thriving culture that spanned northern India and Pakistan. While the Egyptians were building pyramids for their pharaohs and the Minoans were leaping over bulls for sport, the 40,000 (or so) citizens of Mohenjo-daro were building striking structures of fired and mortared brick: public baths, a central market with a public well, spacious homes, a great granary (with air ducts to dry the grain), the Pillared Hall for assemblies, and the College Hall (78 rooms thought to have been a residence for priests). Mohenjo-daro was the most advanced city of its time, with remarkably sophisticated civil engineering and urban planning. When the Harappan civilization went into a sudden  and as yet unexplained, although historians have lots of theories  decline around 1900 BC, Mohenjo-daro was gradually abandoned, to be lost until 1920 AD. (Adapted from Sid Meier''s Civilization 6)'),
			('TXT_KEY_WONDER_MOHENJO_DARO_HELP',		'+1 [ICON_FOOD] Food from River tiles worked by this City.');
			
-- Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Well in the City in which it is built. 
-- makes special use from recently constructed [COLOR_YIELD_FOOD]Well[ENDCOLOR] ([ICON_FOOD]; [ICON_PRODUCTION])

UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Mohenjo-daro[ENDCOLOR] heavily supports local production (+1[ICON_PRODUCTION]/4 [ICON_CITIZEN]), increases potential of local [COLOR_CITY_GREEN]River[ENDCOLOR] (+1[ICON_FOOD]/[ICON_MUSHROOM]) and expands your culture and religion in the region (+2[ICON_CULTURE]; +1[ICON_PEACE]).'
WHERE Tag = 'TXT_KEY_WONDER_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MOHENJO_DARO_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MOHENJO_DARO_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Skara Brae
INSERT INTO Language_en_US 
			(Tag, Text)
VALUES		('TXT_KEY_BUILDING_SKARA_BRAE',			'Skara Brae'),
			('TXT_KEY_WONDER_SKARA_BRAE_QUOTE',		'[NEWLINE]"No great thing is created suddenly."[NEWLINE] - Epictetus[NEWLINE]'),
			('TXT_KEY_WONDER_SKARA_BRAE_PEDIA',		'Skara Brae is a stone-built Neolithic settlement, located on the Bay of Skaill on the west coast of Mainland, the largest island in the Orkney archipelago of Scotland. It consists of eight clustered houses, and was occupied from roughly 3180 BC - 2500 BC.[NEWLINE][NEWLINE]Given the number of homes, it seems likely that no more than fifty people lived in Skara Brae at any given time. Apart from being makers and users of grooved ware, a distinctive style of pottery that appeared in northern Scotland not long before the establishment of the village, they were primarily pastorialists who raised cattle and sheep.'),
			('TXT_KEY_WONDER_SKARA_BRAE_HELP',		'All Villages in the Empire receive +1 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]All [ICON_RES_COW] Cattle: +1 [ICON_FOOD] Food.[NEWLINE]All [ICON_RES_FISH] Fish: +1 [ICON_FOOD] Food.[NEWLINE]All [ICON_RES_SHEEP] Sheep: +1 [ICON_FOOD] Food.[NEWLINE]All [ICON_RES_WHEAT] Wheat: +1 [ICON_FOOD] Food.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Skara Brae[ENDCOLOR] gives major developement boost to all cities with improved basic resources (+1[ICON_FOOD]/[ICON_RES_COW][ICON_RES_COW], [ICON_RES_SHEEP][ICON_RES_SHEEP], [ICON_RES_FISH][ICON_RES_FISH], [ICON_RES_MAIZE][ICON_RES_MAIZE], [ICON_RES_RICE][ICON_RES_RICE], [ICON_RES_WHEAT][ICON_RES_WHEAT]). Starting from medieval era, you should create numerous upgraded [COLOR_CITY_BROWN]Villages[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_WORKER][ICON_WORKER]) with much more potential than standard ones.'
WHERE Tag = 'TXT_KEY_WONDER_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SKARA_BRAE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SKARA_BRAE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Improved Resource: [ICON_RES_COW] [COLOR_CYAN]Cattle[ENDCOLOR]/[ICON_RES_FISH] [COLOR_CYAN]Fish[ENDCOLOR]/[ICON_RES_SHEEP] [COLOR_CYAN]Sheep[ENDCOLOR]/[ICON_RES_WHEAT] [COLOR_CYAN]Maize[ENDCOLOR]/[ICON_RES_WHEAT] [COLOR_CYAN]Rice[ENDCOLOR]/[ICON_RES_WHEAT] [COLOR_CYAN]Wheat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Improved Resource: [ICON_RES_COW] [COLOR_CYAN]Cattle[ENDCOLOR]/[ICON_RES_FISH] [COLOR_CYAN]Fish[ENDCOLOR]/[ICON_RES_SHEEP] [COLOR_CYAN]Sheep[ENDCOLOR]/[ICON_RES_WHEAT] [COLOR_CYAN]Wheat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
----------------------------------------------------
-- Karnak
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_KARNAK',			'Karnak'),
			('TXT_KEY_WONDER_KARNAK_QUOTE',		'[NEWLINE]"I was sitting in the Temple of Karnak of the Nile, as the sun was going down, and I was all alone, and the great Hypostyle Hall was full of shadows and ghosts of the past, (...) and if you believe that, you''ll believe anything."[NEWLINE] - Wilbur A. Smith[NEWLINE]'),
			('TXT_KEY_WONDER_KARNAK_PEDIA',		'Karnak is a large temple complex located in Thebes (nowadays is Luxor). It was constructed during the reign of Ramesses II as a place of worship for many different gods and goddesses, instead of focusing on just one member of the Egyptian Pantheon.[NEWLINE][NEWLINE]  The complex is a vast open-air museum, and the second largest ancient religious site in the world (after the Angkor Wat in Cambodia). It is believed to be the second most visited historical site in Egypt, only the Giza Pyramids near Cairo receive more visits.[NEWLINE][NEWLINE]  One famous aspect of Karnak is the Hypostyle Hall in the Precinct of Amun-Re, a hall area of 50,000 sq ft (5,000 m2) with 134 massive columns arranged in 16 rows. 122 of these columns are 10 meters tall, and the other 12 are 21 meters tall with a diameter of over three meters.'),
			('TXT_KEY_WONDER_KARNAK_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Monument in the City in which it is built and all Monuments in the Empire receive +1 [ICON_CULTURE] Culture. +1 [ICON_PRODUCTION] Production and +1 [ICON_PEACE] Faith from each Oasis and every 2 Flood Plains worked by this City. +4 [ICON_TOURISM] Tourism with [COLOR_CYAN]Archeology[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Karnak[ENDCOLOR] temples turn rare [COLOR_CITY_GREEN]Oasis[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_PEACE]/[ICON_MUSHROOM]) and [COLOR_CITY_GREEN]Flood Plains[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_PEACE]/2 [ICON_MUSHROOM] to City) into very productive sacred places. Remember to build a [COLOR_YIELD_FOOD]Monument[ENDCOLOR] ([ICON_CULTURE]; [ICON_MOVES]; +1[ICON_CULTURE]) in all other cities to speed up your cultural progress.'
WHERE Tag = 'TXT_KEY_WONDER_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KARNAK_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KARNAK_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Flood Plains[ENDCOLOR]/[COLOR_CYAN]Oasis[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Flood Plains[ENDCOLOR]/[COLOR_CYAN]Oasis[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Nazca Lines
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_NAZCA',			'Nazca Lines'),
			('TXT_KEY_WONDER_NAZCA_QUOTE',		'[NEWLINE]"The true mystery of the world is the visible, not the invisible."[NEWLINE] - Oscar Wilde[NEWLINE]'),
			('TXT_KEY_WONDER_NAZCA_PEDIA',		'The Nazca Lines, located between the Peruvian towns of Nazca and Palpa, are a series of enormous Geoglyphs designed on a large plateau, spanning over 80 kilometres. The designs have long been a source of mystery for those who have gazed upon them. It is estimated that the lines were constructed by the Nazca culture, hense the name, between 450 and 600 CE. The level of complexity of design varies between designs. Some are simple lines hundreds of metres long, while others are incredibly complex patterns resembling a variety of zoological designs - Monkeys, Condors, Spiders and Orca (Killer whale) to name but a few.[NEWLINE][NEWLINE]  The Nazca Lines are particularily popular amongst circles which believe in the existance of extra-terrestrial life, which the Nazca culture mistook for their gods. They believe that the simpler, straight lines are in fact landing strips for interstellar crafts used by the extra-terrestrials to land, and that a humanoid figure represented in the patterns is one of the extraterrestrials. Modern science has had a range of theories, amongst which the lines serving a purpose similar to that of Stonehenge as an early form of an observatory / astronomical calendar. Other theories were that the geometric lines could indicate the flow of water, irrigation schemes, or be a part of rituals to "summon" water. However, to this day the exact purpose of the lines remains a mystery.'),
			('TXT_KEY_WONDER_NAZCA_HELP',		'+2 [ICON_FOOD] Food from nearby Plains, +1 [ICON_PEACE] Faith from nearby Hills and +1 [ICON_RESEARCH] Science from Camps worked by this City. +4 [ICON_RESEARCH] Science and +2 [ICON_TOURISM] Tourism with [COLOR_CYAN]Flight[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Nazca Lines[ENDCOLOR] hide awesome scientific secrets, fully discovered only with air reconaissance ([COLOR_CYAN]Flight[ENDCOLOR]: +4[ICON_RESEARCH], +2[ICON_TOURISM]). Boost your growth and religion by claiming local [COLOR_CITY_BLUE]Plains[ENDCOLOR] (+2[ICON_FOOD]/[ICON_FLOWER]) and [COLOR_CITY_BLUE]Hills[ENDCOLOR] (+1[ICON_PEACE]/[ICON_FLOWER]) or science by constructing [COLOR_CITY_BROWN]Camps[ENDCOLOR] (+1[ICON_RESEARCH]/[ICON_WORKER]).'
WHERE Tag = 'TXT_KEY_WONDER_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_NAZCA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_NAZCA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Wieliczka
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_WIELICZKA',			'Wieliczka Salt Mine'),
			('TXT_KEY_WONDER_WIELICZKA_QUOTE',		'[NEWLINE]"You are the salt of the earth. But remember that salt is useful when in association, but useless in isolation."[NEWLINE] - Israelmore Ayivor[NEWLINE]'),
			('TXT_KEY_WONDER_WIELICZKA_PEDIA',		'The Wieliczka Salt Mine, in the town of Wieliczka, southern Poland, lies within the Kraków metropolitan area. Sodium chloride (table salt) was formerly produced there from the upwelling brine - and had been since Neolithic times. The Wieliczka salt mine, excavated from the 13th century, produced table salt continuously until 2007, as one of the world''s oldest operating salt mines.'),
			('TXT_KEY_WONDER_WIELICZKA_HELP',		'Wonder places 2 new [ICON_RES_SALT] Salt resources inside City range if possible. +5% [ICON_FOOD] Food in all Cities. +1 [ICON_FOOD] Food from Mines worked by this City.[NEWLINE][NEWLINE]Nearby [ICON_RES_SALT] Salt: +1 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Wieliczka Salt Mine[ENDCOLOR] reveals hidden underground secret, greatly boosting your food generation (+5%[ICON_FOOD][ICON_FOOD]) and [COLOR_CITY_BROWN]Mining[ENDCOLOR] (+1[ICON_FOOD]/[ICON_WORKER]) efficiency, additionally supported by recently discovered richer deposits of [COLOR_GREY]Salt[ENDCOLOR] (+2[ICON_RES_SALT]; +1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_RES_SALT]).'
WHERE Tag = 'TXT_KEY_WONDER_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_WIELICZKA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_WIELICZKA_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Improvement: [COLOR_CYAN]2 Mines[ENDCOLOR]; City: [COLOR_CYAN]place for Salt[ENDCOLOR]; Map: [COLOR_CYAN]Salt on map[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; City: [COLOR_CYAN]place for Salt[ENDCOLOR]; Map: [COLOR_CYAN]Salt on map[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Plain of Jars
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_THONG_HAI_HIN',			'Plain of Jars'),
			('TXT_KEY_WONDER_THONG_HAI_HIN_QUOTE',		'[NEWLINE]"As a well-spent day brings happy sleep, so life well used brings happy death."[NEWLINE] - Leonardo da Vinci[NEWLINE]'),
			('TXT_KEY_WONDER_THONG_HAI_HIN_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_THONG_HAI_HIN_HELP',		'Units generate 5 [ICON_PEACE] Faith [COLOR_POSITIVE_TEXT]on their Death[ENDCOLOR], scaling with Era. Land [ICON_INTERNATIONAL_TRADE] Trade Routes gain +2 [ICON_GOLD] Gold. All local [ICON_INTERNATIONAL_TRADE] Trade Routes gain +2 [ICON_FOOD] Food.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Plain of Jars[ENDCOLOR] lays on the crossroad of multiple trade routes, so it must fulfill many different roles: a storehouse ([ICON_INTERNATIONAL_TRADE]: +2[ICON_FOOD]), a cemetery (+3[ICON_PEACE]; 5[ICON_PEACE]/Death) and a market (+2[ICON_GOLD]; Land [ICON_INTERNATIONAL_TRADE]: +2[ICON_GOLD]).'
WHERE Tag = 'TXT_KEY_WONDER_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_THONG_HAI_HIN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_THONG_HAI_HIN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Stonehenge
UPDATE Language_en_US
SET Text = 'Mysterious [COLOR_YIELD_FOOD]Stonehenge[ENDCOLOR] serves as an improved [COLOR_YIELD_FOOD]Council[ENDCOLOR] ([ICON_RESEARCH]), which provides instant faith boost (50[ICON_PEACE]), almost guaranteeing founding new religion and improving your engineering branch (+1[ICON_GREAT_ENGINEER]).'
WHERE Tag = 'TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_BUILDING_STONEHENGE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_STONEHENGE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR], Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Pyramids
UPDATE Language_en_US
SET Text = 'Great [COLOR_YIELD_FOOD]Pyramids[ENDCOLOR] are an engineering masterpiece (+1[ICON_GREAT_ENGINEER]), accelerating the coming of next golden age thanks to the efforts of prominent people (50[ICON_GOLDEN_AGE]/[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]). Use recently trained [COLOR_YIELD_GOLD]free Settler[ENDCOLOR] to found another great and prosperous city.'
WHERE Tag = 'TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_PYRAMIDS_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PYRAMIDS_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Tundra[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Snow[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Petra
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Petra[ENDCOLOR] complex uses surrounding [COLOR_CITY_BLUE]Desert[ENDCOLOR] (+1[ICON_GOLD]/[ICON_FLOWER]) to increase your income. Send new [COLOR_YIELD_GOLD]free Caravan[ENDCOLOR] along available trade routes (+1[ICON_INTERNATIONAL_TRADE]) to quickly spread your culture over the world ([COLOR_CYAN]Archaeology[ENDCOLOR]: +6[ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'City must be built on or next to Desert. ', '') WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);
		
INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_PETRA_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PETRA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR], [COLOR_CYAN]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Temple of Artemis
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Temple of Artemis[ENDCOLOR] strongly supports global growth (+10%[ICON_FOOD][ICON_FOOD]), promotes [COLOR_YIELD_FOOD]Herbalists[ENDCOLOR] ([ICON_FOOD]; [ICON_PRODUCTION]) and makes hired specialists in the city much less weighted (-2[ICON_HAPPINESS_3] Urbanization). As and addition, this city can spam ranged units to conquer even more valuable lands (+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Ranged[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Desert[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR]; Improvement: [COLOR_CYAN]Camp/Plantation[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Mausoleum of Halicarnassus
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Mausoleum of Halicarnassus[ENDCOLOR] starts new festival with greatly improved effect (20[ICON_HAPPINESS_1] WLTKD turns; +10%[ICON_PRODUCTION], +10%[ICON_GOLD], +10%[ICON_RESEARCH]/[ICON_HAPPINESS_1] WLTKD). Such a progress could be possible thanks to the effort of recenlty constructed [COLOR_YIELD_FOOD]Stone Works[ENDCOLOR] ([ICON_PRODUCTION]; [ICON_GOLD]).'
WHERE Tag = 'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,												Text) 
SELECT		'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Improvement: [COLOR_CYAN]Quarry[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Statue of Zeus
UPDATE Language_en_US
SET Text = 'Monumental [COLOR_YIELD_FOOD]Statue of Zeus[ENDCOLOR] along with local [COLOR_YIELD_FOOD]Barracks[ENDCOLOR] ([ICON_SILVER_FIST]; [ICON_RESEARCH]; [ICON_HAPPINESS_3]) increases your offensive capabilities, especially during city sieges ([COLOR_WATER_TEXT]Statue of Zeus[ENDCOLOR]/[COLOR_YIELD_GOLD]Military[ENDCOLOR]) and triples your efforts towards reducing local unrest (-1[ICON_HAPPINESS_3] Distress; [COLOR_YIELD_GOLD]Workers[ENDCOLOR] are immune to [COLOR_WATER_TEXT]Prisoners of War[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_STATUE_ZEUS_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_STATUE_ZEUS_HELP';
				
UPDATE Language_en_US SET Text = 'Other Player: [COLOR_CYAN]Guarded[ENDCOLOR]/[COLOR_CYAN]Afraid[ENDCOLOR]/[COLOR_CYAN]Hostile[ENDCOLOR]/[COLOR_CYAN]Warring[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Malwiya Minaret
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MALWIYA',			'Malwiya Minaret'),
			('TXT_KEY_WONDER_MALWIYA_QUOTE',		'[NEWLINE]"Aim at heaven and you will get Earth... Aim at Earth and you will get neither."[NEWLINE] - C.S. Lewis[NEWLINE]'),
			('TXT_KEY_WONDER_MALWIYA_PEDIA',		'The Malwiya Minaret (also known as the Spiral Minaret) is part of the Great Mosque of Samarra, located in Samarra, Iraq. The complex was built over a period of four years, from 848 to 852 CE. The main mosque was completed one year before the Minaret. The complex was constructed during the reign of Al-Mutawakkil, an Abbasid Caliph. For a time it was the largest mosque in the world.[NEWLINE][NEWLINE]  The minaret (tower) was constructed of sandstone, and is unique among other minarets because of its ascending spiral conical design. 52 metres high and 33 metres wide at the base, the spiral contains stairs reaching to the top. The word "malwiya" translates as "twisted" or "snail shell".[NEWLINE][NEWLINE]  With the turbulence of the Iraq war, the Malwiya Minaret has been damaged by bomb blasts, one in 2005 and one in 2011, when it was attacked by Iraqi insurgents.'),
			('TXT_KEY_WONDER_MALWIYA_HELP',			'All Stone Works in the Empire receive +2 [ICON_PRODUCTION] Production, all Quarries +1 [ICON_PRODUCTION] Production and +1 [ICON_PEACE] Faith and all Manufactories +3 [ICON_PEACE] Faith.');
				
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Malwiya Minaret[ENDCOLOR] is a result of engineering genious (+2[ICON_GREAT_ENGINEER]), that improved all [COLOR_CITY_BROWN]Quarried[ENDCOLOR] materials (+1[ICON_PRODUCTION], +1[ICON_PEACE]/[ICON_WORKER][ICON_WORKER]). Make sure to link your resources, construct many [COLOR_CITY_BROWN]Manufactories[ENDCOLOR] (+3[ICON_PEACE]/[ICON_WORKER][ICON_WORKER]) and rush [COLOR_YIELD_FOOD]Stone Works[ENDCOLOR] (+2[ICON_PRODUCTION][ICON_PRODUCTION]) in all your cities to support this wonderful project.'
WHERE Tag = 'TXT_KEY_WONDER_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MALWIYA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MALWIYA_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Building: [COLOR_CYAN]Stone Works[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Buddhas of Bamyan
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BAMYAN',			'Buddhas of Bamyan'),
			('TXT_KEY_WONDER_BAMYAN_QUOTE',		'[NEWLINE]"The past is already gone, the future is not yet here. There''s only one moment for you to live."[NEWLINE] - Buddha[NEWLINE]'),
			('TXT_KEY_WONDER_BAMYAN_PEDIA',		'Deep in the Hindu Kush, in the Bamyan Valley, along the Silk Road, the Buddhas of Bamyan once towered over the region. Bamyan was a religious site from the 2nd century until the later half of the 7th century, and the Buddhas were constructed throughout that time. The Chinese Buddhist pilgrim Xuanzang visited in 630 CE, describing Bamyan as a flourishing Buddhist center "with more than ten monstaries and more than a thousand monks". In 2001, the Buddhas were destroyed by the Taliban, either in protest of international aid priorities or as part of Islamic religious iconoclasm, to both international and domestic condemnation. Since then, international efforts have been made to reconstruct the Buddhas. Furthermore, after the destruction of the Buddhas, caves containing art from the 5th through 9th centuries were discovered, as well as Xuanzang''s translation of the Pratityasamutpada Sutra that spelled out the basic belief of Buddhism: all things are transient.While the original Buddhas of Bamyan may be gone, their message and cultural significance will echo for all eternity.'),
			('TXT_KEY_WONDER_BAMYAN_HELP',		'City generates +100% Religious Pressure. +2 [ICON_PEACE] per City-State Friend and +3 [ICON_GOLDEN_AGE] per City-State Ally. +1 [ICON_INFLUENCE] World Congress Vote for each 2 Declarations of Friendship. +2 [ICON_CULTURE] Culture and +2 [ICON_GOLDEN_AGE] Golden Age Points with [COLOR_CYAN]Rocketry[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = 'Gigantic [COLOR_YIELD_FOOD]Buddhas[ENDCOLOR] should be sign of your generosity passed to all nations in the world (+100%[ICON_RELIGION] Pressure). Make sure to keep peace around you and gather many friends and allies (+2[ICON_PEACE]/[ICON_CITY_STATE] Friend; +3[ICON_GOLDEN_AGE]/[ICON_CITY_STATE] Ally), even in distant future when world will be led by superpowers (+1[ICON_DIPLOMAT] League Vote/2 DoF).'
WHERE Tag = 'TXT_KEY_WONDER_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BAMYAN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BAMYAN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]2 Mountains[ENDCOLOR]; Player: [COLOR_CYAN]at Peace[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Gate of the Sun
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GATE_OF_SUN',			'Gate of the Sun'),
			('TXT_KEY_WONDER_GATE_OF_SUN_QUOTE',		'[NEWLINE]"May the sun set on where my love dwells."[NEWLINE] - Bolivian proverb[NEWLINE]'),
			('TXT_KEY_WONDER_GATE_OF_SUN_PEDIA',		'The Gate of the Sun is a stone arch constructed by the ancient Tiwanaku culture of Bolivia, dated to between 500-950 CE. The lintel is carved with 48 squars surrounding a central figure. The central figure is a man with his head surrounded by 24 rays. Some believe that the Gate of the Sun possesses an astronomical or astrological significance, or may have served as a calendar. No one knows for sure.'),
			('TXT_KEY_WONDER_GATE_OF_SUN_HELP',			'All Walls in the Empire receive +1 [ICON_RESEARCH] Science. +1 [ICON_CULTURE] Culture from Mountains and Lakes worked by this City. Has 1 slot for [ICON_GREAT_WORK] Great Work of Art. +5% [ICON_RESEARCH] Science produced by this City during [ICON_GOLDEN_AGE] Golden Age and +5% [ICON_RESEARCH] Science in Cities with Walls.');
			
UPDATE Language_en_US
SET Text = 'Mysterious [COLOR_YIELD_FOOD]Gate of the Sun[ENDCOLOR] hides unremarkable inscriptions (+1[ICON_GREAT_WORK]). Revealing their secrets can help your [COLOR_CITY_BLUE]Mountains[ENDCOLOR] (+1[ICON_CULTURE]/[ICON_FLOWER] to City) and [COLOR_CITY_GREEN]Lakes[ENDCOLOR] (+1[ICON_CULTURE]/[ICON_MUSHROOM]) become more influential and will be key factor in your developement (+5%[ICON_RESEARCH]/[ICON_GOLDEN_AGE]). Remember to pass the knowledge by building [COLOR_YIELD_FOOD]Walls[ENDCOLOR] (+1[ICON_RESEARCH][ICON_RESEARCH]; +5%[ICON_RESEARCH]/Cities with Walls) in all your cities.'
WHERE Tag = 'TXT_KEY_WONDER_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GATE_OF_SUN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GATE_OF_SUN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- El Ghriba Synagogue
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_EL_GHRIBA',			'El Ghriba Synagogue'),
			('TXT_KEY_WONDER_EL_GHRIBA_QUOTE',		'[NEWLINE]"Jesus was born a Jew, and he died a Jew. It never occurred to him to establish a new religion. He never crossed himself - he had no reason to. He never set one foot in a church. He went to synagogue."[NEWLINE] - Amos Oz[NEWLINE]'),
			('TXT_KEY_WONDER_EL_GHRIBA_PEDIA',		'El Ghriba Synagogue, located on the Tunisian island of Djerba, is the oldest synagogue in Tunisa and the center of the village''s holy life. According to legend, it was constructed with a door and a stone from the destruction of either Solomon''s Temple in 586 BCE or the Second Temple in 70 CE. Thus, it links the local Jewish community to the ancestral heart of Judaism and remains a pilgrimage site into the modern day.'),
			('TXT_KEY_GREAT_WORK_THE_ARK',			'Ark of the Covenant'),
			('TXT_KEY_GREAT_WORK_THE_ARK_QUOTE',	'[NEWLINE]"I had it in my heart to build a house of rest [NEWLINE]for the ark of the covenant of the Lord, [NEWLINE]and for the footstool of our God."[NEWLINE] - 1 Chronicles, 28:2[NEWLINE]'),
			('TXT_KEY_WONDER_EL_GHRIBA_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Synagogue in the City in which it is built. Converts 15% of [ICON_PEACE] Faith Purchase into [ICON_GOLD]. Has 1 slot for [ICON_GREAT_WORK] Great Work of Art, and starts with [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]Ark of the Covenant[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]El Ghriba[ENDCOLOR] is a [COLOR_YIELD_FOOD]Synagogue[ENDCOLOR] ([ICON_PRODUCTION]; [ICON_PEACE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]; [ICON_RESEARCH]) containing artifacts like [COLOR_CULTURE_STORED]Ark of the Covenant[ENDCOLOR] (+1[ICON_GREAT_WORK]), which is foundation stone of Jewish history. It can also successfully make all religious expenses profit some gold in return (15%[ICON_PEACE] Faith Purchase into [ICON_GOLD]).'
WHERE Tag = 'TXT_KEY_WONDER_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_EL_GHRIBA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EL_GHRIBA_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Etchmiadzin Cathedral
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ETCHMIADZIN',		'Etchmiadzin Cathedral'),
			('TXT_KEY_WONDER_ETCHMIADZIN_QUOTE',	'[NEWLINE]"The wound of a dagger heals, but that of the tongue, never."[NEWLINE] - Armenian proverb[NEWLINE]'),
			('TXT_KEY_WONDER_ETCHMIADZIN_PEDIA',	'Located in Vagharshapat, Armenia, Etchmiadzin Cathedral is often considered the oldest cathedral in the world. Following the adoption of Christianity as the Armenian state religion by King Tiridates III, tt was built between 301 and 303 CE by Saint Gregory the Illuminator over a pagan temple. Until the second half of the fifth century, Etchmiadzin was the seat of the supreme head of the Armenian Church.[NEWLINE]Etchmiadzin was the national and political center of the Armenian people for centuries, and is considered to be holy ground. It is crucial to the Armenian identity, and remains a popular pilgrimage site today. While Shah Abbas I of Persia plundered the cathedral in an attempt to diminish Armenian cultural identity, and the cathedral''s importance was diminished under the Soviet Union, it endured. In 2000, it was added to the list of UNESCO World Heritage Sites. Notably, the cathedral claims to house several relics, such as the Lance of Longingus, relics of the Twelve Apostles, and a fragment of Noah''s Ark.'),
			('TXT_KEY_GREAT_WORK_HOLY_LANCE',		'Holy Lance'),
			('TXT_KEY_GREAT_WORK_HOLY_LANCE_QUOTE',	'[NEWLINE]One of the[NEWLINE]soldiers[NEWLINE]pierced his[NEWLINE]side with[NEWLINE]a lance, and[NEWLINE]immediately[NEWLINE]there came[NEWLINE]out blood[NEWLINE]and water.[NEWLINE] - John, 19:34[NEWLINE]'),
			('TXT_KEY_WONDER_ETCHMIADZIN_HELP',		'Converts 10% of [ICON_PEACE] Faith produced by this City into [ICON_CULTURE] Culture and another 10% into [ICON_GOLDEN_AGE] Golden Age Points. Has 1 slot for [ICON_GREAT_WORK] Great Work of Art, and starts with [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]Holy Lance[ENDCOLOR]. All [ICON_GREAT_WORK] Great Works in the Empire receive +1 [ICON_PEACE] Faith.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Etchmiadzin Cathedral[ENDCOLOR] stores wonderful great works like [COLOR_CULTURE_STORED]Holy Lance[ENDCOLOR] (+1[ICON_GREAT_WORK]; +1[ICON_PEACE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]). Thanks to the support of high up nobles, it turns speeds up coming of next golden era and increase your culture output (10%[ICON_PEACE] into [ICON_CULTURE], [ICON_GOLDEN_AGE]).'
WHERE Tag = 'TXT_KEY_WONDER_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ETCHMIADZIN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ETCHMIADZIN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Chand Baori
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_CHAND_BAORI',		'Chand Baori'),
			('TXT_KEY_WONDER_CHAND_BAORI_QUOTE',	'[NEWLINE]"When the well''s dry, we know the worth of water."[NEWLINE] - Benjamin Franklin[NEWLINE]'),
			('TXT_KEY_WONDER_CHAND_BAORI_PEDIA',	'Built over a thousand years ago, Chand Baori is a stepwell located in the Abhaneri village of Rajasthan, India. Stepwells are unique to the Indian subcontinent, and are wells with steps leading down to the water. They were one of many developments to deal with the seasonal availability of water. [NEWLINE]Chand Baori is quite possibly the largest of the stepwells, and may be the most visually spectacular. It is a four-sided structure, with a temple to Harshat Mata, goddess of joy, at one face. In the modern era, Chand Baori has been included in several Bollywood films, though stepwells have fallen out of favor with the arrival of running water.'),
			('TXT_KEY_WONDER_CHAND_BAORI_HELP',		'Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_PEOPLE] Great Person of your choice. +10% generation of [ICON_GREAT_PEOPLE] Great People in this City. +1 [ICON_FOOD] Food from Desert tiles in this City. 3 Specialists in the City no longer generates [ICON_HAPPINESS_3] Unhappiness from Urbanization.');

UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Chand Baori[ENDCOLOR] guarantees, that your local [COLOR_CITY_BLUE]Desert[ENDCOLOR] (+1[ICON_FOOD]/[ICON_FLOWER]) will not be useless for your city. It is also place, where new specialists settle their offices (-3[ICON_HAPPINESS_3] Urbanization) and very important and profitable deals between nobles are agreed ([COLOR_YIELD_GOLD]free [ICON_GREAT_PEOPLE][ENDCOLOR]; +10%[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CHAND_BAORI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CHAND_BAORI_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Fresh Water[ENDCOLOR]; Building: [COLOR_CYAN]Well[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Feature: [COLOR_NEGATIVE_TEXT]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Sigiriya
INSERT INTO Language_en_US 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_SIGIRIYA',				'Sigiriya'),
			('TXT_KEY_WONDER_SIGIRIYA_QUOTE',			'[NEWLINE]"I am Budal. Came with hundreds of people to see Sigiriya. Since all the others wrote poems, I did not!"[NEWLINE] - Text of the poem from 10th century[NEWLINE]'),
			('TXT_KEY_WONDER_SIGIRIYA_PEDIA',			'TODO'),
			('TXT_KEY_THEMING_BONUS_SIGIRIYA',			'Beautiful collection of native art'),
			('TXT_KEY_THEMING_BONUS_SIGIRIYA_HELP',		'To maximize your bonus, make sure all the Great Work Slots are all filled with art created by you.'),
			('TXT_KEY_WONDER_SIGIRIYA_HELP',			'Greatly increase [ICON_STRENGTH] Combat Strength of this City. Instantly receive 200 [ICON_GOLD] Gold. All [ICON_GREAT_WORK] Great Works in the Empire receive +1 [ICON_CULTURE] Culture. Has 2 slots for [ICON_GREAT_WORK] Great Works of Art. +6 [ICON_GOLD] Gold and +3 [ICON_CULTURE] Culture if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Sigiriya[ENDCOLOR] contains huge treasures hidden underground (200[ICON_GOLD]) as well as many valuable artistic creations (+1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]; 2[ICON_GREAT_WORK], if themed: [ICON_GOLD], [ICON_CULTURE]). All of them are safe on top of the local unreachable hill (+10[ICON_STRENGTH]).'
WHERE Tag = 'TXT_KEY_WONDER_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SIGIRIYA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SIGIRIYA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Great Lighthouse
UPDATE Language_en_US
SET Text = 'Nothing can help sailors to achieve their destination more than [COLOR_YIELD_FOOD]Lighthouse[ENDCOLOR] ([ICON_FOOD]; [ICON_GOLD]; [ICON_CONNECTED]). [COLOR_YIELD_FOOD]Great Lighthouse[ENDCOLOR] additionally strengthens vision and movement of all your sea units ([COLOR_WATER_TEXT]Navigation II[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Naval[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'City must be built on the coast. ', '') WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Grassland[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Great Library
UPDATE Language_en_US
SET Text = 'Enormous collection of books from [COLOR_YIELD_FOOD]Great Library[ENDCOLOR], like all other [COLOR_YIELD_FOOD]Libraries[ENDCOLOR] ([ICON_RESEARCH]; [ICON_HAPPINESS_3]) provides massive scientific boost (+1[ICON_GREAT_SCIENTIST]), instant technological progress ([COLOR_CYAN]free Technology[ENDCOLOR]) and additional slots for literature granting even more science if themed (2[ICON_GREAT_WORK], if themed: [ICON_RESEARCH]).'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_GREAT_LIBRARY_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIBRARY_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Forum Romanum
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Forum Romanum[ENDCOLOR] uses variety of abilities to make you the most influential ruler in the world. Beside receiving support of experts ([COLOR_YIELD_GOLD]free [ICON_DIPLOMAT][ENDCOLOR]; +1[ICON_DIPLOMAT]), you have increased production of diplomatic units (+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Diplomatic[ENDCOLOR]), new [COLOR_GREY]Paper[ENDCOLOR] source available (+1[ICON_RES_PAPER]) and increased pitch in any diplomatic actions ([COLOR_WATER_TEXT]Imperial Seal[ENDCOLOR]/[COLOR_YIELD_GOLD]Diplomatic[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BUILDING_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_FORUM_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_FORUM_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR], [COLOR_CYAN]Marsh[ENDCOLOR]; Policy: [COLOR_MAGENTA]1 Policy less needed[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Marsh[ENDCOLOR]; Policy: [COLOR_MAGENTA]1 Policy less needed[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hanging Gardens
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Hanging Gardens[ENDCOLOR] are are much bigger and spectacular version of standard [COLOR_YIELD_FOOD]Garden[ENDCOLOR] ([ICON_GREAT_PEOPLE]; [ICON_GOLD]; [ICON_FOOD]; [ICON_HAPPINESS_3]), which provides massive amount of food (+10[ICON_FOOD]). Boost your population growth using its perks.'
WHERE Tag = 'TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_HANGING_GARDEN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HANGING_GARDEN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Terracota Army
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Terracota Army[ENDCOLOR] allows for creation incredible army (+5[ICON_SILVER_FIST]) and increases improvement construction speed (+25%[ICON_WORKER]) to create well-developed cities. Make sure to kill all your enemies (10[ICON_CULTURE]/Kill)!'
WHERE Tag = 'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR]; Improvement: [COLOR_CYAN]2 (Mines + Quarries)[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Parthenon
/*UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Parthenon[ENDCOLOR] focuses not only on artistry (2[ICON_GREAT_WORK], if themed: [ICON_CULTURE]; [COLOR_CULTURE_STORED]Phidias Showing the Frieze of the Parthenon to his Friends[ENDCOLOR]) entertaining your citizens (-1[ICON_HAPPINESS_3] Boredom), but also supports your army (+10% of [ICON_CITIZEN] as [ICON_SILVER_FIST]). Additionally it turns [COLOR_YIELD_FOOD]Amphitheaters[ENDCOLOR] (+1[ICON_RESEARCH][ICON_RESEARCH]; +1[ICON_CULTURE][ICON_CULTURE]) into scientific and cultural centers.'
WHERE Tag = 'TXT_KEY_WONDER_PARTHENON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Contains a prebuilt [ICON_GREAT_WORK] Great Work of Art in one of the [ICON_GREAT_WORK] Great Work slots.', 'Starts with [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]Phidias Showing the Frieze of the Parthenon to his Friends[ENDCOLOR].') WHERE Tag ='TXT_KEY_WONDER_PARTHENON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_PARTHENON_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PARTHENON_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PARTHENON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PARTHENON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
*/
----------------------------------------------------
-- Oracle
UPDATE Language_en_US
SET Text = 'Mysterious [COLOR_YIELD_FOOD]Oracle[ENDCOLOR], unlike other [COLOR_YIELD_FOOD]Temples[ENDCOLOR] ([ICON_PEACE]; [ICON_CULTURE]; [ICON_GOLD]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]), makes all your scientific projects possible (+1[ICON_GREAT_SCIENTIST]). It gives you massive instant yield injection (500[ICON_RESEARCH]; 500[ICON_CULTURE]) and makes your citizens more qualified (-1[ICON_HAPPINESS_3] Illiteracy).'
WHERE Tag = 'TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_ORACLE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ORACLE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Angkor Wat
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Angkor Wat[ENDCOLOR] boosts your empire''s expansion (+25%[ICON_CULTURE][ICON_CULTURE] Border Growth; -25%[ICON_GOLD][ICON_GOLD] Plot Cost) and, unlike other [COLOR_YIELD_FOOD]Mandirs[ENDCOLOR] ([ICON_FOOD]; [ICON_PEACE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]; [ICON_SPY]), supports your engineering projects (+1[ICON_GREAT_ENGINEER]).'
WHERE Tag = 'TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_ANGKOR_WAT_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ANGKOR_WAT_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR], [COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Great Wall
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Great Wall[ENDCOLOR] is unbelievably successful defensive project, modifying your [COLOR_YIELD_FOOD]Walls[ENDCOLOR] ([ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_RANGE_STRENGTH]; [ICON_HAPPINESS_3]) into monstrual barrier (-All [ICON_MOVES] if Enemy crosses your borders). It allows your soldiers, led by experienced general ([COLOR_YIELD_GOLD]free [ICON_GREAT_GENERAL][ENDCOLOR]), to compete with greatest armies in the world (+3[ICON_SILVER_FIST]).'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_GREAT_WALL_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GREAT_WALL_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Other Player: [COLOR_CYAN]Deceptive[ENDCOLOR]/[COLOR_CYAN]Hostile[ENDCOLOR]/[COLOR_CYAN]Warring[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Colossus
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Colossus[ENDCOLOR] will make from you the greatest merchant of all seas (+1[ICON_INTERNATIONAL_TRADE]; [COLOR_YIELD_GOLD]free Cargo Ship[ENDCOLOR]). You can only watch how your gold income in the city is growing more and more thanks to the recently established trade routes (+2[ICON_GOLD]/[ICON_INTERNATIONAL_TRADE]).'
WHERE Tag = 'TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'City must be built on the coast. ', '') WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_COLOSSUS_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_COLOSSUS_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Improved Resource: [ICON_RES_IRON] [COLOR_CYAN]Iron[ENDCOLOR]/[ICON_RES_COPPER] [COLOR_CYAN]Copper[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Prophet's Mosque
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_NABAWI',				'Prophet''s Mosque'),
			('TXT_KEY_WONDER_NABAWI_QUOTE',			'[NEWLINE]"When you see a person who has been given more than you in money and beauty, look to those, who have been given less."[NEWLINE] - Prophet Muhammad[NEWLINE]'),
			('TXT_KEY_WONDER_NABAWI_PEDIA',			'Al-Masjid al-Nabawi, often called the Prophet''s Mosque, is a mosque situated in the city of Medina. As the final resting place of the Islamic prophet Muhammad, it is considered the second holiest site in Islam by Muslims (the first being the Masjid al-Haram in Mecca) and is one of the largest mosques in the World. The mosque is under the control of the Custodian of the Two Holy Mosques. It is the second mosque built in history.[NEWLINE][NEWLINE]  One of the most notable features of the site is the Green Dome over the center of the mosque, where the tomb of Muhammad is located. It is not exactly known when the green dome was constructed but manuscripts dating to the early 12th century describe the dome. It is known as the Dome of the Prophet or the Green Dome. Subsequent Islamic rulers greatly expanded and decorated it. Early Muslim leaders Abu Bakr and Umar are buried in an adjacent area in the mosque.[NEWLINE][NEWLINE]  The site was originally Muhammad''s house; he settled there after his Hijra to Medina, later building a mosque on the grounds. He himself shared in the heavy work of construction. The original mosque was an open-air building. The basic plan of the building has been adopted in the building of other mosques throughout the world.'),
			('TXT_KEY_THEMING_BONUS_NABAWI',		'Islamic calligraphy works'),
			('TXT_KEY_THEMING_BONUS_NABAWI_HELP',	'To maximize your bonus, make sure both Great Works are filled with Writings created by you.'),
			('TXT_KEY_WONDER_NABAWI_HELP',			'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Mosque in the City in which it is built. All Cities generate +10% [ICON_PEACE] Faith. Has 2 slot for [ICON_GREAT_WORK] Great Works of Writing that provide +4 [ICON_PEACE] Faith and [ICON_GOLDEN_AGE] Golden Age Points if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR]. +20% generation of [ICON_GREAT_WRITER] Great Writers in this City.');
			
UPDATE Language_en_US
SET Text = 'This Wonder is an unique [COLOR_YIELD_FOOD]Mosque[ENDCOLOR] ([ICON_RESEARCH]; [ICON_PEACE]; [ICON_GREAT_WORK]; [ICON_CULTURE]; [ICON_GOLDEN_AGE]; [ICON_HAPPINESS_3]) where you can learn arabic religious literature (+20%[ICON_GREAT_WRITER]; 2[ICON_GREAT_WORK], if themed: [ICON_PEACE], [ICON_GOLDEN_AGE]). Massive faith output (+10%[ICON_PEACE][ICON_PEACE]) from your empire will help you in achieving religious domination.'
WHERE Tag = 'TXT_KEY_WONDER_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_NABAWI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_NABAWI_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Moray Terraces
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_MORAY',				'Moray Terraces'),
			('TXT_KEY_WONDER_MORAY_QUOTE',			'[NEWLINE]"Science is a way of thinking much more than it is a body of knowledge."[NEWLINE] - Carl Sagan[NEWLINE]'),
			('TXT_KEY_WONDER_MORAY_PEDIA',			'TODO'),
			('TXT_KEY_WONDER_MORAY_HELP',			'+5% [ICON_FOOD] Food in all Cities. +1 [ICON_FOOD] Food, +1 [ICON_PRODUCTION] Production and +1 [ICON_RESEARCH] Science from nearby Hills. Converts 15% of [ICON_RESEARCH] Science produced by this City into [ICON_FOOD] Food.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Moray Terraces[ENDCOLOR], mysterious farming structures made on [COLOR_CITY_BLUE]Hills[ENDCOLOR] allow you to grow unusual plants and crops in places where they are not naturally seen (+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[ICON_FLOWER]; +5%[ICON_FOOD][ICON_FOOD]). Use your scientific knowledge to boost your growth even more (15%[ICON_RESEARCH] into [ICON_FOOD])!'
WHERE Tag = 'TXT_KEY_WONDER_MORAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MORAY_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MORAY_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Improvement: [COLOR_CYAN]Farm[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MORAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MORAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Lavaux
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_LAVAUX',				'Lavaux'),
			('TXT_KEY_WONDER_LAVAUX_QUOTE',			'[NEWLINE]"A bottle of wine contains more philosophy than all the books in the world."[NEWLINE] - Louis Pasteur[NEWLINE]'),
			('TXT_KEY_WONDER_LAVAUX_PEDIA',			'TODO'),
			('TXT_KEY_WONDER_LAVAUX_HELP',			'Wonder places 2 new [ICON_RES_WINE] Wine resources inside City range if possible. Empire [ICON_HAPPINESS_3] Needs Modifier is reduced by 10% in all Cities. +1 [ICON_FOOD] Food from Lakes worked by this City.[NEWLINE][NEWLINE]Nearby [ICON_RES_WINE] Wine: +1 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold and +1 [ICON_PEACE] Faith.');
			
UPDATE Language_en_US
SET Text = 'Wineyards of [COLOR_YIELD_FOOD]Lavaux[ENDCOLOR] are well-known source of unique [COLOR_GREY]Grapes[ENDCOLOR] (+2[ICON_RES_WINE]; +1[ICON_FOOD], +1[ICON_GOLD], +1[ICON_PEACE]/[ICON_RES_WINE]). Try to make all your citizens much happier (-10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Needs) using these wonderful fruits, benefitting crystal clear waters of nearby [COLOR_CITY_GREEN]Lake[ENDCOLOR] (+1[ICON_FOOD][ICON_MUSHROOM]).'
WHERE Tag = 'TXT_KEY_WONDER_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_LAVAUX_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_LAVAUX_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR]; City: [COLOR_CYAN]place for Wine[ENDCOLOR]; Map: [COLOR_CYAN]Wine on map[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR]; City: [COLOR_CYAN]place for Wine[ENDCOLOR]; Map: [COLOR_CYAN]Wine on map[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Wartburg
INSERT INTO Language_en_US 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_WARTBURG',				'Wartburg'),
			('TXT_KEY_WONDER_WARTBURG_QUOTE',			'[NEWLINE]"In nature we never see anything isolated, but everything in connection with something else which is before it, beside it, under it and over it."[NEWLINE] - Johann Wolfgang von Goethe[NEWLINE]'),
			('TXT_KEY_WONDER_WARTBURG_PEDIA',			'Wartburg Castle was built in 1067 by Ludwig der Springer to secure his traditional territories. From 1172 to 1211, it was an important princely court in the Holy Roman Empire and a support for poets, thus becoming the setting of the legendary Sangerkrieg. Following his excommunication, Martin Luther stayed at Wartburg when he translated the New Testament from ancient Greek into German.[NEWLINE]For centuries, Wartburg has been a place of pilgrimage for its significance in German and Christian history. In the modern day, Wartburg remains a popular tourist attraction. It often stages the opera Tannhauser. While the castle still contains original structures from the 12th through 15th centuries, much of the interior dates back only to the 19th century, transformed under communist rule in the time of the GDR.'),
			('TXT_KEY_THEMING_BONUS_WARTBURG',			'Literature that inspired whole nations'),
			('TXT_KEY_THEMING_BONUS_WARTBURG_HELP',		'To maximize your bonus, make sure all the Great Work Slots are all filled with literature created by you.'),
			('TXT_KEY_WONDER_WARTBURG_HELP',			'+30% generation of [ICON_GREAT_WRITER] Great Writers in this City. Has 3 slots for [ICON_GREAT_WORK] Great Works of Literature. +3 [ICON_CULTURE] Culture and +3 [ICON_PEACE] Faith and 3 [ICON_GOLDEN_AGE] Golden Age Points if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR]. 5 XP per each [ICON_GREAT_WORK] Great Work in this wonder for Land units trained in this City. All Writer''s Guilds in the Empire receive +1 [ICON_PEACE] Faith.');
			
UPDATE Language_en_US
SET Text = 'With [COLOR_YIELD_FOOD]Wartburg[ENDCOLOR] you will become king of literature (+2[ICON_GREAT_WRITER]; +30%[ICON_GREAT_WRITER]), which can be stored on your new shelves (3[ICON_GREAT_WORK], if themed: [ICON_CULTURE], [ICON_PEACE], [ICON_GOLDEN_AGE]). Increase your faith output by constructing [COLOR_YIELD_FOOD]Writer''s Guilds[ENDCOLOR] (+1[ICON_PEACE][ICON_PEACE]) in your empire and raise up experience of your units using your city collection (+5 XP/[ICON_GREAT_WORK] inside/[COLOR_YIELD_GOLD]Land[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_WARTBURG_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_WARTBURG_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Progress Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR]; Building: [COLOR_CYAN]Writer''s Guild[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Progress Finisher[ENDCOLOR]; Building: [COLOR_CYAN]Writer''s Guild[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Great Zimbabwe
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GREAT_ZIMBABWE',			'Great Zimbabwe'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_QUOTE',		'[NEWLINE]"God is good, but never dance with a lion."[NEWLINE] - Zimbabwean proverb[NEWLINE]'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP',		'Gain 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route slot. [ICON_GOLD] Gold cost of aquiring new tiles reduced by 30% in all Cities. +2 [ICON_GOLDEN_AGE] Golden Age Points and +5% [ICON_PRODUCTION] Production towards Land Military Units in this City for each active [ICON_INTERNATIONAL_TRADE] Trade Route.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Great Zimbabwe[ENDCOLOR] makes use from your expanded trade network (+1[ICON_INTERNATIONAL_TRADE]), which supports your empire''s yields (+2[ICON_GOLDEN_AGE]/[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]) and army construction (+5% [ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Land[ENDCOLOR]/[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]). Make sure to use your treasury to expand your Cities more than your neighbours (-30%[ICON_GOLD][ICON_GOLD] Plot Cost).'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Authority Finisher[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Improvement: [COLOR_CYAN]3 (Mines + Camps)[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Authority Finisher[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Ahu Tongariki
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_AHU',			'Ahu Tongariki'),
			('TXT_KEY_WONDER_AHU_QUOTE',		'[NEWLINE]"The metaphor is so obvious. Easter Island isolated in the Pacific Ocean - once the island got into trouble, there was no way they could get free. There was no other people from whom they could get help. In the same way that we on planet Earth, if we ruin our own world, we won''t be able to get help."[NEWLINE] - Jared Diamond[NEWLINE]'),
			('TXT_KEY_WONDER_AHU_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_AHU_HELP',			'+10% [ICON_PEACE] in your Empire. +1 [ICON_PRODUCTION] Production from Forest or Jungle and +1 [ICON_PEACE] Faith from Coast tiles worked by this City. +1 [ICON_CULTURE] Culture from Quarries in your Empire. +20% [ICON_WORKER] Improvement Construction Rate. Grants 1 copy of unique luxury resource: Tern Egg.');
			
UPDATE Language_en_US
SET Text = 'Monumental platform, [COLOR_YIELD_FOOD]Ahu Tongariki[ENDCOLOR], boosts your production significantly, if you have [COLOR_CITY_GREEN]Forests[ENDCOLOR] or [COLOR_CITY_GREEN]Jungles[ENDCOLOR] (+1[ICON_PRODUCTION]/[ICON_MUSHROOM]) nearby or hire new workers (+20%[ICON_WORKER]). Cultural influence of all [COLOR_CITY_BROWN]Quarries[ENDCOLOR] (+1[ICON_CULTURE]/[ICON_WORKER][ICON_WORKER]) on your citizens, supported by new [COLOR_GREY]Unique Luxury[ENDCOLOR] resource (+1 flat [ICON_RES_TERN]; +10%[ICON_PEACE][ICON_PEACE]) will send you in much brighter future.'
WHERE Tag = 'TXT_KEY_WONDER_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_AHU_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_AHU_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]Forest/Jungle[ENDCOLOR]; Improved Resource: [ICON_RES_STONE] [COLOR_CYAN]Stone[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Falun Mine
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_FALUN',			'Falun Mine'),
			('TXT_KEY_WONDER_FALUN_QUOTE',		'[NEWLINE]"Mining is like a search-and-destroy mission."[NEWLINE] - Stewart Udall[NEWLINE]'),
			('TXT_KEY_WONDER_FALUN_PEDIA',		'Operating in Falun, Sweden from the tenth century to 1992, Falun Mine produced as much as two thirds of Europe''s copper needs and helped fund many of Sweden''s wars in the 17th century. The operation of the mine granted Sweden a virtual monopoly on copper through the 17th century, funding the various wars of Sweden during its great power era, though the output of the mine was a pittance by modern standards. In 1992, commercial mining ceased as the mine was no longer economically viable. In 2001, Falun Mine was selected as a UNESCO World Heritage site.'),
			('TXT_KEY_WONDER_FALUN_HELP',		'Wonder places 2 new [ICON_RES_COPPER] Copper resources inside City range if possible. +1 [ICON_GOLD] Gold from Mines worked by this City. Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_GENERAL] Great General and +100 [ICON_GREAT_ENGINEER] Great Engineers Progress on construction during Medieval or Renaissance Era.[NEWLINE][NEWLINE]Nearby [ICON_RES_COPPER] Copper: +1 [ICON_GOLD] and +1 [ICON_GOLDEN_AGE] Golden Age Point.');
			
UPDATE Language_en_US
SET Text = 'Mining complex at [COLOR_YIELD_FOOD]Falun[ENDCOLOR] makes all difficult investments possible. Huge support of engineers (2%[ICON_GREAT_ENGINEER]/Construction) or militarists ([COLOR_YIELD_GOLD]free [ICON_GREAT_GENERAL][ENDCOLOR]), new [COLOR_GREY]Copper[ENDCOLOR] deposits (+2[ICON_RES_COPPER]; +1[ICON_GOLD], +1[ICON_GOLDEN_AGE]/[ICON_RES_COPPER]) and more valuable local [COLOR_CITY_BROWN]Mines[ENDCOLOR] (+1[ICON_GOLD]/[ICON_WORKER]) can easily buy you leadership of the world.'
WHERE Tag = 'TXT_KEY_WONDER_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_FALUN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_FALUN_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Improvement: [COLOR_CYAN]2 Mines[ENDCOLOR]; City: [COLOR_CYAN]place for Copper[ENDCOLOR]; Map: [COLOR_CYAN]Copper on map[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; City: [COLOR_CYAN]place for Copper[ENDCOLOR]; Map: [COLOR_CYAN]Copper on map[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Forge of Damascus
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_DAMASCUS',			'Forge of Damascus'),
			('TXT_KEY_WONDER_DAMASCUS_QUOTE',		'[NEWLINE]"The reputation and history of Damascus steel has given rise to many legends, such as the ability to cut through a rifle barrel or to cut a hair falling across the blade. The manufacturing technique has yet to be reverse engineered, even in modern times."[NEWLINE] - from legends about Damascus Steel[NEWLINE]'),
			('TXT_KEY_WONDER_DAMASCUS_PEDIA',		'Damascus steel was a type of steel used for manufacturing sword blades in the Near East made with wootz steel. These swords are characterized by distinctive patterns of banding and mottling reminiscent of flowing water. Such blades were reputed to be tough, resistant to shattering and capable of being honed to a sharp, resilient edge.[NEWLINE][NEWLINE] The reputation and history of Damascus steel has given rise to many legends, such as the ability to cut through a rifle barrel or to cut a hair falling across the blade. Although many types of modern steel outperform ancient Damascus alloys, chemical reactions in the production process made the blades extraordinary for their time, as Damascus steel was superplastic and very hard at the same time. [COLOR_NEGATIVE_TEXT]Lost after unit upgrade[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_DAMASCUS',			'Damascus Steel'),
			('TXT_KEY_PROMOTION_DAMASCUS_HELP',		'+10%[ICON_STRENGTH]CS.'),
			('TXT_KEY_WONDER_DAMASCUS_HELP',		'+3 [ICON_PRODUCTION] Production with [COLOR_CYAN]Metallurgy[ENDCOLOR]. All Melee and Mounted Units in the Empire get [COLOR_POSITIVE_TEXT]Damascus Steel[ENDCOLOR] promotion.[NEWLINE][NEWLINE]All [ICON_RES_IRON] Iron: +1 [ICON_PRODUCTION] Production and +1 [ICON_RESEARCH] Science.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Forge of Damascus[ENDCOLOR], thanks to recent scientific discovery, turns your melee weaponry into a masterpiece ([COLOR_WATER_TEXT]Damascus Steel[ENDCOLOR]/[COLOR_YIELD_GOLD]Melee Land[ENDCOLOR]), which cannot be copied in any other forge. Your production and science literally explodes (+2[ICON_GREAT_SCIENTIST]), so remember to claim all available [COLOR_GREY]Iron[ENDCOLOR] deposits (+1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[ICON_RES_IRON][ICON_RES_IRON]).'
WHERE Tag = 'TXT_KEY_WONDER_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_DAMASCUS_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_DAMASCUS_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Authority Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR]; Improved Resource: [ICON_RES_IRON] [COLOR_CYAN]Iron[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Authority Finisher[ENDCOLOR]; Improved Resource: [ICON_RES_IRON] [COLOR_CYAN]Iron[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Golden Dagon Pagoda
INSERT INTO Language_en_US 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_SHWEDAGON',					'Golden Dagon Pagoda'),
			('TXT_KEY_WONDER_SHWEDAGON_QUOTE',				'[NEWLINE]"There was a tumult among men and spirits, the blind beheld objects, the deaf heard sounds. The earth quaked, lightning flashed, gems rained down until they were knee deep, and all trees of the Himalayas, though not in season, bore blossoms and fruit."[NEWLINE] - King Okkalapa[NEWLINE]'),
			('TXT_KEY_WONDER_SHWEDAGON_PEDIA',				'Shwedagon Paya (also known as Shwedagon Pagoda or the Great Dragon Pagoda) is a large Buddhist stupa located in the Burmese city of Rangoon. It is 99 metres tall in it''s current state, and is coated with gold donated by the Burmese populus to maintain the Stupa. It is not known when the gold was put in place, although the stupa itself is said to date back over 2,500 years. Each sucessive dynasty has built upon the Stupa, until it reached the current height of 99 metres during reconstruction following an earthquake in 1768. Shwedagon Paya also features a crown of 5,448 diamonds and 2317 Rubies.'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_KALPA',		'Relics of the four previous Buddhas of the present kalpa'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_CONSECUTIVE',	'Relics from most recent eras'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_PLAYERS',		'Relics from different creators'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_ARTIFACTS',	'Bunch of Relics'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_HELP',		'To maximize your bonus, make sure all the Great Work Slots are all filled with Artifacts created by different Players in consecutive Eras.'),
			('TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS',			'Diplomatic Passport'),
			('TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS_HELP',		'+20% [ICON_WORKER] Work Rate. Unit [COLOR:255:230:85:255]can Enter (cannot Dig on) Enemy Territory without Open Borders Agreement[ENDCOLOR].'),
			('TXT_KEY_WONDER_SHWEDAGON_HELP',				'All Archaeologist Units in the Empire get [COLOR_POSITIVE_TEXT]Diplomatic Passport[ENDCOLOR] promotion. +2 [ICON_PEACE] Faith from Artists. All [ICON_GREAT_WORK] Great Works in the Empire receive +1 [ICON_GOLD] Gold. Has 4 slots for [ICON_GREAT_WORK] Great Works of Art. +3 [ICON_GOLD] Gold, [ICON_CULTURE] Culture, [ICON_PEACE] Faith and [ICON_TOURISM] Tourism if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Golden Pagoda[ENDCOLOR] fully focuses on every aspect related to artistry. Religious and more frequent artists in this city (+2[ICON_GREAT_ARTIST]; +2[ICON_PEACE]/[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST]), more valuable great works of your empire (+1[ICON_GOLD]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) and much more space for new art (4[ICON_GREAT_WORK], if themed: [ICON_GOLD], [ICON_CULTURE], [ICON_PEACE], [ICON_TOURISM]) will make your city shine! Make sure to use your new forces to find hidden artifacts ([COLOR_WATER_TEXT]Diplomatic Passport[ENDCOLOR]/[COLOR_YIELD_GOLD]Archaeologist[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SHWEDAGON_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SHWEDAGON_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Tradition Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Tradition Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Mont St. Michel
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_MICHEL',			'Mont Saint-Michel'),
			('TXT_KEY_WONDER_MICHEL_QUOTE',		'[NEWLINE]"Church and State, Soul and Body, God and Man, are all one at Mont Saint Michel, and the business of all is to fight, each in his own way, or to stand guard for each other."[NEWLINE] - Henry Adams[NEWLINE]'),
			('TXT_KEY_WONDER_MICHEL_PEDIA',		'Perched on a rocky islet in the midst of vast sandbanks exposed to powerful tides between Normandy and Brittany stand the "Wonder of the West", a Gothic-style Benedictine abbey dedicated to the archangel St Michael, and the village that grew up in the shadow of its great walls. Built between the 11th and 16th centuries, the abbey is a technical and artistic tour de force, having had to adapt to the problems posed by this unique natural site.'),
			('TXT_KEY_WONDER_MICHEL_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Monastery in the City in which it is built. Greatly increase [ICON_STRENGTH] Combat Strength and Hit Points of this City. +3 [ICON_GOLD] Gold and +3 [ICON_TOURISM] Tourism with [COLOR_CYAN]Electricity[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = 'Lonely [COLOR_YIELD_FOOD]Mont Saint-Michel[ENDCOLOR] will turn your vulnerable [COLOR_YIELD_FOOD]Monastery[ENDCOLOR] ([ICON_FOOD]; [ICON_RESEARCH]; [ICON_PEACE]) into a fortress (+10[ICON_STRENGTH]; +100 HP), where you can focus on your soul (+2[ICON_PEACE]/5 [ICON_CITIZEN]) and plan next expenses for your growing treasury.'
WHERE Tag = 'TXT_KEY_WONDER_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MICHEL_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MICHEL_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Single-tile Island[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Single-tile Island[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Buyuk Han
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_BUYUK_HAN',		'Büyük Han'),
			('TXT_KEY_WONDER_BUYUK_HAN_QUOTE',	'[NEWLINE]"There is no friendship in trade."[NEWLINE] - Cornelius Vanderbilt[NEWLINE]'),
			('TXT_KEY_WONDER_BUYUK_HAN_PEDIA',	''),
			('TXT_KEY_WONDER_BUYUK_HAN_HELP',	'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Caravansary and a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Caravan in the City in which it is built. +2 [ICON_PRODUCTION] Production from Villages in your Empire. +2 [ICON_PRODUCTION] Production and +3 [ICON_GOLD] Gold with [COLOR_CYAN]Corporations[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Büyük Han[ENDCOLOR], a beautiful [COLOR_YIELD_FOOD]Caravansary[ENDCOLOR] ([ICON_FOOD]; [ICON_PRODUCTION]; [ICON_GOLD]; [ICON_CULTURE]; [ICON_INTERNATIONAL_TRADE]) provides wide trading opportunities. You can use brand new [COLOR_YIELD_GOLD]free Caravan[ENDCOLOR], use new tools to improve craftsmanship in your [COLOR_CITY_BROWN]Villages[ENDCOLOR] (+2[ICON_PRODUCTION]/[ICON_WORKER][ICON_WORKER]) or find new trading partners ([COLOR_CYAN]Corporations[ENDCOLOR]: +2[ICON_PRODUCTION], +3[ICON_GOLD]).'
WHERE Tag = 'TXT_KEY_WONDER_BUYUK_HAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BUYUK_HAN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BUYUK_HAN_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Progress Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Improvement: [COLOR_CYAN]Village[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BUYUK_HAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Progress Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BUYUK_HAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Itsukushima Shrine
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ITSUKUSHIMA',		'Itsukushima Shrine'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_QUOTE',	'[NEWLINE]"Faith is not the clinging to a shrine but an endless pilgrimage of the heart."[NEWLINE] - Abraham Joshua Heschel[NEWLINE]'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_PEDIA',	'Itsukushima shrine is one of the most iconic Shinto shrines in Japan. It is world renowned for it''s iconic "Floating" torii gate, which pilgrims had to steer their boat through before they could enter the shrine''s grounds. It is located on the island of Itsukushima, at the western end of Japan''s "inland sea". There has been a shrine at the location since approximately 628 CE, when one was constructed under the reign of Empresss Suiko. The current design, however, dates from 1168, when the shrine was constructed with funds provided by the warlord Taiya no Kiyomori.[NEWLINE][NEWLINE]  The shrine, and it''s floating Torii, are one of the "Three Views of Japan", along with the sandbar at Amanohashidate, and Matsushima bay. These have been designated as the most beautiful scenes of Japan, and are frequented by tourists.'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_HELP',		'+1 [ICON_FOOD] Food, +1 [ICON_CULTURE] Culture and +1 [ICON_PEACE] Faith to Atolls and [ICON_CULTURE] Culture cost of aquiring new tiles reduced by 50% in coastal Cities. +1 [ICON_PEACE] Faith from Sea tiles. All Fishing Boats in the Empire receive +1 [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Nearby [ICON_RES_CORAL] Coral: +2 [ICON_PEACE] Faith.[NEWLINE]Nearby [ICON_RES_CRAB] Crab: +2 [ICON_PEACE] Faith.[NEWLINE]Nearby [ICON_RES_PEARLS] Pearls: +2 [ICON_PEACE] Faith.[NEWLINE]Nearby [ICON_RES_WHALE] Whales: +2 [ICON_PEACE] Faith.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Itsukushima Shrine[ENDCOLOR] boost yields generated by nearby [COLOR_CITY_BLUE]Oceans[ENDCOLOR] (+1[ICON_PEACE]/[ICON_FLOWER]), [COLOR_GREY]Sea Luxuries[ENDCOLOR] (+2[ICON_PEACE]/[COLOR_GREY]Sea Luxury[ENDCOLOR]) and [COLOR_CITY_BROWN]Fishing Boats[ENDCOLOR] (+1[ICON_CULTURE]/[ICON_WORKER]) as well as all [COLOR_CITY_GREEN]Atolls[ENDCOLOR] (+1[ICON_FOOD], +1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_MUSHROOM][ICON_MUSHROOM]). Additionally expansion of your coastal cities is now much easier (+50%[ICON_CULTURE][ICON_CULTURE] Border Growth/all coastal Cities).'
WHERE Tag = 'TXT_KEY_WONDER_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ITSUKUSHIMA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ITSUKUSHIMA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Improved Resource: [ICON_RES_CORAL] [COLOR_CYAN]Coral[ENDCOLOR]/[ICON_RES_CRAB] [COLOR_CYAN]Crab[ENDCOLOR]/[ICON_RES_PEARLS] [COLOR_CYAN]Pearls[ENDCOLOR]/[ICON_RES_WHALE] [COLOR_CYAN]Whales[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Qalhat
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_QALHAT',			'Qalhat'),
			('TXT_KEY_WONDER_QALHAT_QUOTE',		'[NEWLINE]"The haven is very large and good, and is frequented by numerous ships with goods from India, and from this city the spices and other merchandize are distributed among the cities and towns of the interior. They also export many good Arab horses from this to India."[NEWLINE] - Marco Polo[NEWLINE]'),
			('TXT_KEY_WONDER_QALHAT_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_QALHAT_HELP',		'Gain 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route slot. Sea [ICON_INTERNATIONAL_TRADE] Trade Routes gain +1 [ICON_GOLD] Gold. +50% [ICON_PRODUCTION] Production of Cargo Ships. +3 [ICON_CULTURE] Culture for each [ICON_INTERNATIONAL_TRADE] Sea Trade Route from or to other major Player.[NEWLINE][NEWLINE]Nearby [ICON_RES_HORSE] Horses: +2 [ICON_GOLD].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Qalhat[ENDCOLOR], mentioned by some europeans sailors seeking unique supplies (+1[ICON_GOLD]/[ICON_RES_HORSE]; +50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Cargo Ship[ENDCOLOR]), is a wonderful place, where merchants of all seas meet and exchange their goods (Sea [ICON_INTERNATIONAL_TRADE]: +1[ICON_GOLD]). Learn foreign culture by monopolizing worldwide sea trade (3[ICON_CULTURE]/Sea [ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE] with Major).'
WHERE Tag = 'TXT_KEY_WONDER_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_QALHAT_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_QALHAT_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Improved Resource: [ICON_RES_HORSE] [COLOR_CYAN]Horses[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Improved Resource: [ICON_RES_HORSE] [COLOR_CYAN]Horses[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Krak des Chevaliers
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_CHEVALIERS',			'Krak des Chevaliers'),
			('TXT_KEY_WONDER_CHEVALIERS_QUOTE',		'[NEWLINE]"I have long since been aware that your king is a man of the greatest honor and bravery, but he is imprudent."[NEWLINE] - Saladin to Richard I the Lionheart[NEWLINE]'),
			('TXT_KEY_WONDER_CHEVALIERS_PEDIA',		'Krak des Chevaliers, also Crac des Chevaliers, is a Crusader castle in Syria and one of the most important preserved medieval castles in the world. The site was first inhabited in the 11th century by a settlement of Kurds; as a result it was known as Hisn al Akrad, meaning the "Castle of the Kurds". In 1142 it was given by Raymond II, Count of Tripoli, to the Knights Hospitaller. It remained in their possession until it fell in 1271. It became known as Crac de l''Ospital; the name Krak des Chevaliers was coined in the 19th century.'),
			('TXT_KEY_WONDER_CHEVALIERS_HELP',		'Greatly increase [ICON_STRENGTH] Combat Strength and +20% [ICON_PRODUCTION] Production of Mounted and Siege Units in this City. +1 [ICON_SILVER_FIST] Military Unit Supply Cap. All other [COLOR_POSITIVE_TEXT]non-coastal[ENDCOLOR] Cities receive +1 [ICON_PEACE] Faith, +5 [ICON_STRENGTH] City Defense and +1 [ICON_SILVER_FIST] Military Unit Supply Cap.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Krak des Chevaliers[ENDCOLOR], castle on top of a hill, a perfect place to defend against your enemies (20[ICON_STRENGTH]) and plan next offensive. Increased production of your troops (+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Mounted[ENDCOLOR], [COLOR_YIELD_GOLD]Siege[ENDCOLOR]), awesome leadership ([COLOR_YIELD_GOLD]free [ICON_GREAT_GENERAL][ENDCOLOR]), and improved management of your all other non-coastal cities (+1[ICON_PEACE], +5[ICON_STRENGTH], +1[ICON_SILVER_FIST]/non-coastal Cities) are just a beginning of your glory.'
WHERE Tag = 'TXT_KEY_WONDER_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CHEVALIERS_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CHEVALIERS_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- University of Sankore
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]University of Sankore[ENDCOLOR] successfully combines science and faith together. Nearby [COLOR_YIELD_FOOD]Mosque[ENDCOLOR] ([ICON_RESEARCH]; [ICON_PEACE]; [ICON_GREAT_WORK]; [ICON_CULTURE]; [ICON_GOLDEN_AGE]; [ICON_HAPPINESS_3]) will attract noble great people, who use their influence to boost your most important research projects (50[ICON_RESEARCH]/[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Tradition[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Tradition Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; Building: [COLOR_CYAN]Library[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Tradition Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Desert[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hagia Sophia
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Hagia Sophia[ENDCOLOR] profits from its rich history and fully reorganizes your religion. New prophet ([COLOR_YIELD_GOLD]Free [ICON_PROPHET][ENDCOLOR]), recently constructed [COLOR_YIELD_FOOD]Church[ENDCOLOR] ([ICON_PEACE]; [ICON_MISSIONARY]; [ICON_CULTURE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]) and increased pressure on dissenters (+25%[ICON_MISSIONARY] Strength) will force your will among other nations.'
WHERE Tag = 'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Borobudur
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Borobudur[ENDCOLOR] is a gigantic [COLOR_YIELD_FOOD]Stupa[ENDCOLOR] ([ICON_PEACE]; [ICON_MISSIONARY]; [ICON_RESEARCH]; [ICON_GOLDEN_AGE]; [ICON_TOURISM]; [ICON_HAPPINESS_3]), which focuses on small actions, that can flow other cities with your faith (+5[ICON_PEACE]). Use existing and produce new more powerful [COLOR_YIELD_GOLD]Missionaries[ENDCOLOR] (+1[ICON_MISSIONARY] Spread) to quickly convert your enemies.'
WHERE Tag = 'TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Must be built in a Holy City. ', '') WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP';
	
INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_BOROBUDUR_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BOROBUDUR_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Alhambra
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Alhambra[ENDCOLOR] is an architectural mix of two totally different cultures (+10%[ICON_CULTURE]) formed into unique [COLOR_YIELD_FOOD]Castle[ENDCOLOR] ([ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_PRODUCTION]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]), where special mounted melee units will be trained to support your expansion ([COLOR_WATER_TEXT]Jinete[ENDCOLOR]/[COLOR_YIELD_GOLD]Mounted[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Authority[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_ALHAMBRA_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ALHAMBRA_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Authority Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Authority Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Machu Picchu
UPDATE Language_en_US
SET Text = 'If your city is surrounded by [COLOR_CITY_BLUE]Mountains[ENDCOLOR] (+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_FLOWER] to City), then [COLOR_YIELD_FOOD]Machu Picchu[ENDCOLOR] is a perfect choice. All your city connections in this difficult terrain are more profitble (+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) and your treasury is supported by qualified specialists (+1[ICON_GREAT_MERCHANT]).'
WHERE Tag = 'TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'City must be built within 2 tiles of a Mountain that is inside your territory. ', '') WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP';
	
INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_MACHU_PICHU_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MACHU_PICHU_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]2 Mountains[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Forbidden Palace
UPDATE Language_en_US
SET Text = 'Rich [COLOR_YIELD_FOOD]Forbidden Palace[ENDCOLOR] will help you get out of crisis (-1[ICON_HAPPINESS_3] Poverty). Huge investments in empire developement (-15%[ICON_GOLD][ICON_GOLD] Purchase Cost) and brand new merchant district (+2[ICON_GREAT_MERCHANT]) will introduce you into new era.'
WHERE Tag = 'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Progress[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Progress Finishier[ENDCOLOR]; [COLOR_YIELD_GOLD]Capital[ENDCOLOR]; Building: [COLOR_CYAN]Walls[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Progress Finishier[ENDCOLOR]; [COLOR_YIELD_GOLD]Capital[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Rila Monastery (former Karlstejn)
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Rila Monastery[ENDCOLOR] takes care of all [COLOR_YIELD_FOOD]Orders[ENDCOLOR] ([ICON_PEACE]; [ICON_MISSIONARY]; [ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_HAPPINESS_3]), has high base yields (+3[ICON_CULTURE]; +4[ICON_PEACE]) and lowers requirement for reformation (-5%[ICON_RELIGION] Followers). Use it to gain new abilities just before your enemies do the same!'
WHERE Tag = 'TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Must be built in a Holy City. ', '') WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP';
	
INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_KARLSTEJN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_KARLSTEJN_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_en_US SET Text = 'Rila Monastery' WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN';
UPDATE Language_en_US SET Text = '[NEWLINE]"If you find that you have no love but desire to have it, do the works of love and the Lord will see your desire and effort and put love in your heart."[NEWLINE] - St. Ambrose of Optina[NEWLINE]' WHERE Tag ='TXT_KEY_WONDER_KARLSTEJN_QUOTE';
UPDATE Language_en_US SET Text = 'TODO'||Text WHERE Tag ='TXT_KEY_CIV5_BUILDINGS_KARLSTEJN_TEXT';
----------------------------------------------------
-- Notre Dame
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Notre Dame[ENDCOLOR], wonderful [COLOR_YIELD_FOOD]Cathedral[ENDCOLOR] ([ICON_GOLD]; [ICON_PEACE]; [ICON_MISSIONARY]; [ICON_HAPPINESS_3]), creates history and starts new religious era in your empire (+30% [ICON_PEACE] Religious Pressure/all your Cities of your Religion). Many impressing artwork (2[ICON_GREAT_WORK], if themed: [ICON_PEACE], [ICON_GOLDEN_AGE]) collected behind its walls will make your citizens much happier (+1[ICON_HAPPINESS_1]).'
WHERE Tag = 'TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_BUILDING_NOTRE_DAME_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_NOTRE_DAME_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Tradition Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Tradition Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Ait Benhaddou
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_BENHADDOU',			'Ait Benhaddou'),
			('TXT_KEY_WONDER_BENHADDOU_QUOTE',		'[NEWLINE]"Are you not entertained?"[NEWLINE] - Maximus Decimus Meridius[NEWLINE]'),
			('TXT_KEY_WONDER_BENHADDOU_PEDIA',		'At the foot of the Atlas Mountains, within Ouarzazate Province in Marrakesh, sits Aït Benhaddou. The site is famous for its ksar - a pre-Saharan fortification, famed for its southern Moroccan architecture and method of construction. While little evidence suggests their construction - the earliest known references date back to only the seventeenth century - the use of the southern Moroccan building style is evidenced far back in Djebel and the southern valleys. The typology of the fort is diverse; large houses connect to a central courtyard, four tall wings fortified with angle towers, in some areas their is a connection to the lower houses and courtyard of the fort. As well as an exhibit of Moroccan architecture, Aït Benhaddou has also been featured in several films; including ''Jesus of Nazareth'', ''the Mummy'', ''Gladiator'' and ''Prince of Persia''.'),
			('TXT_KEY_WONDER_BENHADDOU_HELP',		'Gain 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route slot. +1 [ICON_FOOD] Food from River tiles woked by this City. Nearby Villages receive +3 [ICON_GOLD] Gold and +3 [ICON_TOURISM] Tourism. +4 [ICON_TOURISM] Tourism with [COLOR_CYAN]Radio[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = 'Huge [COLOR_YIELD_FOOD]Ait Benhaddou[ENDCOLOR] [COLOR_CITY_BROWN]Village[ENDCOLOR] (+3[ICON_GOLD], +3[ICON_TOURISM]/[ICON_WORKER]) is awesome tourist attraction and an ideal scenography for numerous movie projects ([COLOR_CYAN]Radio[ENDCOLOR]: +4[ICON_TOURISM]). This desert settlement makes also profit from nearby [COLOR_CITY_GREEN]River[ENDCOLOR] (+1[ICON_FOOD]/[ICON_MUSHROOM]) to expand your current trade network (+1[ICON_INTERNATIONAL_TRADE]).'
WHERE Tag = 'TXT_KEY_WONDER_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BENHADDOU_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BENHADDOU_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Improvement: [COLOR_CYAN]Village[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Kilwa Kisiwani
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_KILWA_KISIWANI',			'Kilwa Kisiwani'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_QUOTE',		'[NEWLINE]"Kilwa is one of the most beautifully built cities in the world. The houses there are entirely made of wood, their rooftops out of rope grass, and it rains with great vigour."[NEWLINE] - Ibn Battuta[NEWLINE]'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_HELP',		'Receive 1 copy of [ICON_RES_PORCELAIN] Porcelain and [ICON_RES_JEWELRY] Jewelry. Gain 2 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route slots. +1 [ICON_PRODUCTION] Production from Strategic and +1 [ICON_GOLD] Gold from Luxury resources worked by this City.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Kilwa Kisiwani[ENDCOLOR] trade center (+2[ICON_INTERNATIONAL_TRADE]) acquires for you few copies of [COLOR_GREY]City-State Luxuries[ENDCOLOR] (+1 flat [ICON_RES_JEWELRY]; +1 flat [ICON_RES_PORCELAIN]). Moreover, you receive substantial bonus from resources available on your terrain (+1[ICON_PRODUCTION]/[COLOR_GREY]Strategic[ENDCOLOR]; +1[ICON_GOLD]/[COLOR_GREY]Luxury[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KILWA_KISIWANI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KILWA_KISIWANI_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Statecraft Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Improvement: [COLOR_CYAN]3 (Mines + Camps)[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Statecraft Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- St. Peter's Basilica
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ST_PETERS',			'St. Peter''s Basilica'),
			('TXT_KEY_WONDER_ST_PETERS_QUOTE',		'[NEWLINE]"A rock pile ceases to be a rock pile the moment a single man contemplates it, bearing within him the image of a cathedral."[NEWLINE] - Antoine de Saint-Exupery[NEWLINE]'),
			('TXT_KEY_WONDER_ST_PETERS_PEDIA',		'Basilica Papale di San Pietro in Vaticano, better known as St. Peter''s Basilica, is a late Renaissance church in Vatican City, with the largest interior of any Christian church in the world. The supposed burial site of the apostle Peter in 64 AD, some years later a shrine was constructed there. Replacing the shrine, construction of "old" St. Peter''s was begun by the Emperor Constantine between 319 and 333 AD.[NEWLINE][NEWLINE]  Having fallen into serious disrepair over the centuries, Pope Julius II in 1505 determined to demolish the old church and replace it with a monumental structure, a construction project that spanned the next 120 years under a succession of popes and architects. To finance the colossal project, a number of popes authorized the wholesale selling of indulgences, a practice that led in part to Martin Luther''s protestant movement.[NEWLINE][NEWLINE]  With work by some of the Renaissance''s leading figures - Michelangelo, Raphael, Bramante, Bernini and others - the church now stands as one of the great treasures of Western civilization.'),
			('TXT_KEY_WONDER_ST_PETERS_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Cathedral and 3 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Inquisitors in the City in which it is built. +1 [ICON_HAPPINESS_1] Happiness from all unique Religious buildings. Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DOPLOMAT] World Congress Delegate for every 6 [ICON_CITY_STATE] City-States at the game start.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]St. Peter''s Basilica[ENDCOLOR] is not only religious, but also diplomatic (3 [COLOR_YIELD_GOLD]free Inquisitors[ENDCOLOR]; +1[ICON_DIPLOMAT] League Vote/6[ICON_CITY_STATE] on start) [COLOR_YIELD_FOOD]Cathedral[ENDCOLOR] ([ICON_GOLD]; [ICON_PEACE]; [ICON_MISSIONARY]; [ICON_HAPPINESS_3]) as well. Grants massive happiness boost, if you invest in religion (+1[ICON_HAPPINESS_1]/all Religious buildings).'
WHERE Tag = 'TXT_KEY_WONDER_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ST_PETERS_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ST_PETERS_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Golden Pavilion
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_KINKAKU_JI',			'Golden Pavilion'),
			('TXT_KEY_WONDER_KINKAKU_JI_QUOTE',		'[NEWLINE]"A book holds a house of Gold."[NEWLINE] - Chinese Proverb[NEWLINE]'),
			('TXT_KEY_WONDER_KINKAKU_JI_PEDIA',		'Kinkaku-ji (literally "Temple of the Golden Pavilion") is a Buddhist temple in Kyoto, Japan. it was originally built as a villa at an unknown date, however was bought in 1397 by Shogun Ashikaga Yoshimitsu, who converted the villa into the Kinkaku-ji complex. Upon his death, it was converted to a Zen temple by his son.[NEWLINE][NEWLINE]  In July 1950 it was burnt down by a Monk with a mental illness, causing a massive renovation project to be undertaken. The renovations took five years, completed in 1955. The exterior of the upper two floors were covered in pure gold leave, giving the name "Golden Pavilion", however it is unclear wether the gold leaf was present in the pre-1950''s version.'),
			('TXT_KEY_WONDER_KINKAKU_JI_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Pagoda in the City in which it is built. +1 [ICON_FOOD] Food, +1 [ICON_PEACE] Faith and +1 [ICON_CULTURE] Culture from each Lake, +1 [ICON_PEACE] Faith and +1 [ICON_CULTURE] Culture from each Forest and Jungle, and +1 [ICON_FOOD] Food from each River tile worked by the City. Has 1 slot for [ICON_GREAT_WORK] Great Works of Literature.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Golden Pavilion[ENDCOLOR] is strongly tied to surrounding nature: [COLOR_CITY_GREEN]Lakes[ENDCOLOR] (+1[ICON_FOOD], +1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_MUSHROOM]), [COLOR_CITY_GREEN]Forests[ENDCOLOR], [COLOR_CITY_GREEN]Jungles[ENDCOLOR] (+1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_MUSHROOM]) and [COLOR_CITY_GREEN]Rivers[ENDCOLOR] (+1[ICON_FOOD]/[ICON_MUSHROOM]). Mentioned nature was always inspiration for writers (1[ICON_GREAT_WORK]) spending their leisure time in peaceful [COLOR_YIELD_FOOD]Pagodas[ENDCOLOR] ([ICON_RELIGION]; [ICON_HAPPINESS_3]).'
WHERE Tag = 'TXT_KEY_WONDER_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KINKAKU_JI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KINKAKU_JI_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Fealty Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR], [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Fealty Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Marae Arahurahu
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MARAE',				'Marae Arahurahu'),
			('TXT_KEY_WONDER_MARAE_QUOTE',			'[NEWLINE]"The leader at the front and the workers behind the scenes."[NEWLINE] - Maori proverb[NEWLINE]'),
			('TXT_KEY_WONDER_MARAE_PEDIA',			'TODO'),
			('TXT_KEY_THEMING_BONUS_MARAE',			'Pre-war pump-up songs'),
			('TXT_KEY_THEMING_BONUS_MARAE_HELP',	'To maximize your bonus, make sure all the Great Work Slots are all filled with Music created by you.'),
			('TXT_KEY_WONDER_MARAE_HELP',			'Has 2 slot for [ICON_GREAT_WORK] Great Works of Music. +8 [ICON_FOOD] Food and +3 [ICON_CULTURE] Culture if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR]. 15 XP per each [ICON_GREAT_WORK] Great Work in this wonder for Land and Sea Units trained in this City. All Ranged Land Units get [COLOR_POSITIVE_TEXT]Marae[ENDCOLOR] promotion and all Land Units get [COLOR_POSITIVE_TEXT]Arahurahu[ENDCOLOR] promotion. Units generate 10 [ICON_PEACE] Faith [COLOR_POSITIVE_TEXT]on their Death[ENDCOLOR], scaling with Era.'),
			('TXT_KEY_PROMOTION_MARAE',				'Marae'),
			('TXT_KEY_PROMOTION_MARAE_HELP',		'+10%[ICON_RANGE_STRENGTH]RCS.'),
			('TXT_KEY_PROMOTION_ARAHURAHU',			'Arahurahu'),
			('TXT_KEY_PROMOTION_ARAHURAHU_HELP',	'Gain 120% of an Enemy Unit''s [ICON_STRENGTH]CS as a [ICON_CULTURE] Culture [COLOR:255:230:85:255]on Kill[ENDCOLOR].');

UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Marae Arahurahu[ENDCOLOR] greatly supports your soldiers ([COLOR_WATER_TEXT]Marae[ENDCOLOR]/[COLOR_YIELD_GOLD]Ranged Land[ENDCOLOR]), which should be core of your army ever since. Motivated units are rewarded, regardless the result of the combat ([COLOR_WATER_TEXT]Arahurahu[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Land[ENDCOLOR]; 10[ICON_PEACE]/Death). Remember, that great works in the city increase experience gained by your units (+1[ICON_GREAT_MUSICIAN]; 2[ICON_GREAT_WORK], if themed: [ICON_FOOD], [ICON_CULTURE]; +15 XP/[ICON_GREAT_WORK] inside/[COLOR_YIELD_GOLD]Land[ENDCOLOR], [COLOR_YIELD_GOLD]Naval[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_MARAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MARAE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MARAE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR], [COLOR_CYAN]Coast[ENDCOLOR]; Building: [COLOR_CYAN]Garden[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MARAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MARAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Old Bridge
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_OLD_BRIDGE',			'Old Bridge in Mostar'),
			('TXT_KEY_WONDER_OLD_BRIDGE_QUOTE',		'[NEWLINE]"A refugee is someone who survived and who can create the future."[NEWLINE] - Amela Koluder[NEWLINE]'),
			('TXT_KEY_WONDER_OLD_BRIDGE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_OLD_BRIDGE_HELP',		'Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_DIPLOMAT] Great Diplomat and 2 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DOPLOMAT] World Congress Delegates.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Old Bridge in Mostar[ENDCOLOR] is your call for peace and prosperity (+2[ICON_DIPLOMAT] League Votes; +1[ICON_HAPPINESS_1]). Use your diplomatic strength ([COLOR_YIELD_GOLD]free [ICON_DIPLOMAT][ENDCOLOR]; +2[ICON_DIPLOMAT]) to bring nations on your site.'
WHERE Tag = 'TXT_KEY_WONDER_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_OLD_BRIDGE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_OLD_BRIDGE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Statecraft Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Player: [COLOR_CYAN]at Peace[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Statecraft Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Meenakshi Temple
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MEENAKSHI',			'Meenakshi Temple'),
			('TXT_KEY_WONDER_MEENAKSHI_QUOTE',		'[NEWLINE]"We greet you, Devi Meenakshi, she who shines like a thousand-million suns, adorned with bracelets and garlands... She who is auspicious, she who embodies existence. I always bow to you, whose compassion is an ocean."[NEWLINE] - Adi Shankara[NEWLINE]'),
			('TXT_KEY_WONDER_MEENAKSHI_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_MEENAKSHI_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Mandir in the City in which it is built. Converts 20% of [ICON_PEACE] Faith Purchase into [ICON_FOOD] Food. All [ICON_GREAT_WORK] Great Works in the Empire receive +1 [ICON_FOOD] Food. +1 [ICON_PEACE] Faith from Lake and River tiles worked by this City.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Mandir[ENDCOLOR] ([ICON_FOOD]; [ICON_PEACE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]; [ICON_SPY]) praising [COLOR_YIELD_FOOD]Meenakshi[ENDCOLOR] increases faith in your people (+1[ICON_PEACE]/4 [ICON_CITIZEN][ICON_CITIZEN]) amazed by this colorful wonder. Waters of nearby [COLOR_CITY_GREEN]Lakes[ENDCOLOR] and [COLOR_CITY_GREEN]Rivers[ENDCOLOR] (+1[ICON_PEACE]/[ICON_MUSHROOM]) boost your growth, which can be raised even more by investing in religious projects (20%[ICON_PEACE] Faith Purchase into [ICON_FOOD]) or devoting to artistry (+1[ICON_FOOD]/[ICON_GREAT_WORK][ICON_GREAT_WORK]).'
WHERE Tag = 'TXT_KEY_WONDER_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MEENAKSHI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MEENAKSHI_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Peterhof
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_PETERHOF',			'Peterhof'),
			('TXT_KEY_WONDER_PETERHOF_QUOTE',		'[NEWLINE]"It is my great desire to reform my subjects, and yet I am ashamed to confess that I am unable to reform myself."[NEWLINE] - Peter The Great[NEWLINE]'),
			('TXT_KEY_WONDER_PETERHOF_PEDIA',		'The Peterhof Palace is a series of palaces and gardens located in Saint Petersburg, Russia, laid out on the orders of Peter the Great. These Palaces and gardens are sometimes referred as the "Russian Versailles". The palace-ensemble along with the city center is recognised as a UNESCO World Heritage Site.'),
			('TXT_KEY_WONDER_PETERHOF_HELP',		'+10% generation of [ICON_GREAT_PEOPLE] Great People in this City. Starts 20 turn of [ICON_HAPPINESS_1] WLTKD in this City. +15% [ICON_PRODUCTION] Production and [ICON_GOLD] Gold and +25% [ICON_GOLDEN_AGE] Golden Age Points during [ICON_HAPPINESS_1] WLTKD.');
			
UPDATE Language_en_US
SET Text = 'Palace of [COLOR_YIELD_FOOD]Peterhof[ENDCOLOR] tells your citizens about your will to do everything possible to improve their lives (+6[ICON_GOLDEN_AGE]; 20[ICON_HAPPINESS_1] WLTKD turns), and they respond you with the same (+15%[ICON_PRODUCTION], +15%[ICON_GOLD], +25%[ICON_GOLDEN_AGE] during [ICON_HAPPINESS_1] WLTKD). Such a prosperity is strong invitation for any kind of nobles planning to visit your city (+10%[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_PETERHOF_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PETERHOF_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Improved Resource [COLOR_CYAN][ICON_RES_IRON] Iron[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Bakken
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_BAKKEN',			'Bakken'),
			('TXT_KEY_WONDER_BAKKEN_QUOTE',		'[NEWLINE]"Amusement is appealing because we don''t have to think. It spares us the fear and anxiety that might otherwise prey on our thoughts."[NEWLINE] - John Ortberg[NEWLINE]'),
			('TXT_KEY_WONDER_BAKKEN_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_BAKKEN_HELP',		'Starts 10 turn of [ICON_HAPPINESS_1] WLTKD in this City. +33% [ICON_TOURISM] Tourism during [ICON_HAPPINESS_1] WLTKD.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Bakken[ENDCOLOR] provides entertainment on maximum level (+3[ICON_HAPPINESS_1]), greatly increasing your tourism traffic and its profits (10[ICON_HAPPINESS_1] WLTKD turns; +33%[ICON_TOURISM]/[ICON_HAPPINESS_1] WLTKD).'
WHERE Tag = 'TXT_KEY_WONDER_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BAKKEN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BAKKEN_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Player: [COLOR_CYAN]Happiness > 70%[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- House of Trades of the Indies
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_HOUSE_OF_TRADE',			'House of Trade of the Indies'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_QUOTE',		'[NEWLINE]"All other lands found on the western side of the boundary shall belong to the King and Queen of Castille - and their successors."[NEWLINE] - Treaty of Tordesillas[NEWLINE]'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP',		'Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_ADMIRAL] Great Admiral. Gain 2 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route slots. +10% [ICON_PRODUCTION] Production towards Naval Military Units and Cargo Ships.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]House of Trade[ENDCOLOR] bonds your military with trade so tightly, that it feels natural (+10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Military Naval[ENDCOLOR], [COLOR_YIELD_GOLD]Cargo[ENDCOLOR]). Fresh naval leadership ([COLOR_YIELD_GOLD]free [ICON_GREAT_ADMIRAL][ENDCOLOR]) and new possible trade routes (+2[ICON_INTERNATIONAL_TRADE]) will make ruler of all seas.'
WHERE Tag = 'TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Player: [COLOR_CYAN]2 [ICON_CITY_STATE] Allies[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Solovietsky Monastery
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_SOLOVIETSKY',			'Solovietsky Monastery'),
			('TXT_KEY_WONDER_SOLOVIETSKY_QUOTE',		'[NEWLINE]"Everything is defeated before love."[NEWLINE] - Elder Thaddeus of Vitovnica[NEWLINE]'),
			('TXT_KEY_WONDER_SOLOVIETSKY_PEDIA',		'The Solovetsky Monastery is a fortified monastery located on the Solovetsky Islands in the White Sea in northern Russia. It was one of the largest Christian citadels in northern Russia before it was converted into a Soviet prison and labor camp in 1926-39, and served as a prototype for the camps of the Gulag system. The monastery has experienced several major changes and military sieges. Its most important structures date from the 16th century, when Filip Kolychev was its hegumen (comparable to an abbot).'),
			('TXT_KEY_WONDER_SOLOVIETSKY_HELP',			'+1 [ICON_PRODUCTION] Production and +1 [ICON_PEACE] Faith from Tundra tiles worked by this City. Greatly increase [ICON_STRENGTH] Combat Strength and Hit Points of this City. +1 [ICON_SILVER_FIST] Military Unit Supply Cap. +15% [ICON_PRODUCTION] Production towards Naval Military Units.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Solovietsky Monastery[ENDCOLOR] greatly supports your weak [COLOR_CITY_BLUE]Tundra[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_PEACE]/[ICON_FLOWER]) tiles. It helps you in quick navy reinforcement (+25%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Military Naval[ENDCOLOR]) and strengthen your offense and deffense in the city (+10[ICON_STRENGTH]; +50 HP; +1[ICON_SILVER_FIST]).'
WHERE Tag = 'TXT_KEY_WONDER_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SOLOVIETSKY_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SOLOVIETSKY_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Fealty Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Tundra[ENDCOLOR], [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Fealty Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Tundra[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Aqueduct of Padre Tembleque
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_TEMBLEQUE',			'Aqueduct of Padre Tembleque'),
			('TXT_KEY_WONDER_TEMBLEQUE_QUOTE',		'[NEWLINE]"Mexico is a mosaic of different realities and beauties."[NEWLINE] - Enrique Pena Nieto[NEWLINE]'),
			('TXT_KEY_WONDER_TEMBLEQUE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_TEMBLEQUE_HELP',		'+1 [ICON_FOOD] Food to Desert tiles in this City. All Aqueducts gain +1 [ICON_PRODUCTION] Production and +1 [ICON_PEACE] Faith. Converts 5% of [ICON_PEACE] Faith Purchase into [ICON_PRODUCTION] Production in your every City.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION] Distress in you Empire.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Aqueduct of Padre Tembleque[ENDCOLOR] makes inhabitable places like [COLOR_CITY_BLUE]Desert[ENDCOLOR] prosperous again (+1[ICON_FOOD]/[ICON_FLOWER]), making people happy, because water is not as scarce as before (-1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] from [ICON_FOOD]/[ICON_PRODUCTION]) and all of that is thanks to religious devotion of only one visionary monk (+1[ICON_PRODUCTION], +1[ICON_PEACE]/all [COLOR_YIELD_FOOD]Aqueducts[ENDCOLOR]; 5%[ICON_PEACE][ICON_PEACE] Faith Purchase into [ICON_PRODUCTION]).'
WHERE Tag = 'TXT_KEY_WONDER_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_TEMBLEQUE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_TEMBLEQUE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Globe Theater
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Globe Theater[ENDCOLOR] unites all artistic proffessions in one wonder (+2[ICON_GOLDEN_AGE]/[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST], [ICON_GREAT_WRITER][ICON_GREAT_WRITER], [ICON_GREAT_MUSICIAN][ICON_GREAT_MUSICIAN]), but its much stronger focus on literature is obvious ([COLOR_YIELD_GOLD]free [ICON_GREAT_WRITER][ENDCOLOR]; 2[ICON_GREAT_WORK], if themed: [ICON_GOLD]). This wonder is so influencial, that people''s tastes change accoridng to your will (-1[ICON_HAPPINESS_3] Boredom; -1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Urbanization).'
WHERE Tag = 'TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_GLOBE_THEATER_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GLOBE_THEATER_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR]; Building: [COLOR_CYAN]Amphitheater[ENDCOLOR], [COLOR_CYAN]Baths[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Building: [COLOR_CYAN]Amphitheater[ENDCOLOR], [COLOR_CYAN]Baths[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Chichen Itza
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Chichen Itza[ENDCOLOR] makes your golden ages much more important (+50%[ICON_GOLDEN_AGE] Length). Your citizens will become (-10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3]), especially when they visit brand new [COLOR_YIELD_FOOD]Teocalli[ENDCOLOR] (). Build it, and your people will awe you.'
WHERE Tag = 'TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_CHICHEN_ITZA_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CHICHEN_ITZA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Himeji Castle
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Himeji Castle[ENDCOLOR] turns typical [COLOR_YIELD_FOOD]Castle[ENDCOLOR] ([ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_PRODUCTION]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]) into impenetrable fortress (+10%[ICON_STRENGTH][ICON_STRENGTH]). Moreover, you can create bigger army (+5[ICON_SILVER_FIST]) and all units on your own land receive combat bonuses ([COLOR_WATER_TEXT]Himeji Castle[ENDCOLOR]/[COLOR_YIELD_GOLD]Military[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Leaning Tower of Pisa
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Leaning Tower of Piza[ENDCOLOR] brings attention of many influential nobles, who want to cooperate with you ([COLOR_YIELD_GOLD]free [ICON_GREAT_PEOPLE][ENDCOLOR]). Their final destination is not only this city (+25%[ICON_GREAT_PEOPLE]), but also all others in your empire (+10%[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_LEANING_TOWER_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_LEANING_TOWER_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Water[ENDCOLOR], [COLOR_CYAN]Marsh[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Water[ENDCOLOR], [COLOR_CYAN]Marsh[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Porcelain Tower
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Porcelain Tower[ENDCOLOR] is a wonderful scientific building which improves education of your citizens (-1[ICON_HAPPINESS_3] Illiteracy), invites new great people to the city ([COLOR_YIELD_GOLD]free [ICON_GREAT_SCIENTIST][ENDCOLOR]; +2[ICON_GREAT_SCIENTIST]) and makes use of overall research you produce (+10%[ICON_RESEARCH]).'
WHERE Tag = 'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR]; Player: [COLOR_CYAN]2 [ICON_CITY_STATE] Allies[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Taj Mahal
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Taj Mahal[ENDCOLOR] maximizes number of golden ages you enter (Start [ICON_GOLDEN_AGE]; +1[ICON_GOLDEN_AGE]/2[ICON_CITIZEN]) and benefits from multiple religions in your city (+3[ICON_RESEARCH], +3[ICON_CULTURE], +3[ICON_PEACE]/[ICON_RELIGION]). Do not let them go away!'
WHERE Tag = 'TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_TAJ_MAHAL_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_TAJ_MAHAL_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Uffizi
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Uffizi[ENDCOLOR], as a kind of [COLOR_YIELD_FOOD]Gallery[ENDCOLOR] ([ICON_GOLD], [ICON_GREAT_WORK], [ICON_GREAT_ARTIST], [ICON_TOURISM]) is perfect spot for any talented artist ([COLOR_YIELD_GOLD]free [ICON_GREAT_ARTISTS][ENDCOLOR]; 3[ICON_GREAT_WORK], if themed: [ICON_CULTURE]; +1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]). This wonder also resolves almost all problems with urbanization in your empire (-1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Urbanization)'
WHERE Tag = 'TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_UFFIZI_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_UFFIZI_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR]; Great Works: [COLOR_CYAN]3 [ICON_GREAT_WORK] GW of Art[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sistine Chapel
UPDATE Language_en_US
SET Text = 'Filled with wonderful frescos (2[ICON_GREAT_WORK], if themed: [ICON_CULTURE], [ICON_PEACE]) beautiful [COLOR_YIELD_FOOD]Sistine Chapel[ENDCOLOR] is literally an artistic bomb for your empire (+10%[ICON_CULTURE][ICON_CULTURE]). Make sure to built it, if you aim for a cultural victory.'
WHERE Tag = 'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP';
				
UPDATE Language_en_US SET Text = 'Building: [COLOR_CYAN]Artist''s Guild[ENDCOLOR]; Player: [COLOR_CYAN]Founded Religion[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Building: [COLOR_CYAN]Artist''s Guild[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Summer Palace
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Sumer Palace[ENDCOLOR] is another wonder fully focused on strengthening your diplomatic power ([COLOR_WATER_TEXT]Nobility[ENDCOLOR]/[COLOR_YIELD_GOLD]Diplomatic[ENDCOLOR]) and improving construction rate of your negotiators (+20%[ICON_PRODUCTION][ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Diplomatic[ENDCOLOR]). It also upgrades [COLOR_YIELD_FOOD]Chanceries[ENDCOLOR] (+3[ICON_GOLD][ICON_GOLD]; +1[ICON_CULTURE][ICON_CULTURE]) in your empire and creates new source of [COLOR_GREY]Paper[ENDCOLOR] (+1[ICON_RES_PAPER]).'
WHERE Tag = 'TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_SUMMER_PALACE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_SUMMER_PALACE_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR], [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Red Fort
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Red Fort[ENDCOLOR] is an ideal choice for a militaristic leader. Increased global army limit (+5% of [ICON_CITIZEN][ICON_CITIZEN] as [ICON_SILVER_FIST]), upgraded city''s offensive and defensive capabilities (+10%[ICON_RANGE_STRENGTH]; +1[ICON_SWAP]; +30[ICON_STRENGTH]; +100 HP), brand new [COLOR_YIELD_FOOD]Arsenal[ENDCOLOR] ([ICON_STRENGTH]; [ICON_RANGE_STRENGTH]; [ICON_SILVER_FIST]; [ICON_SPY]; [ICON_HAPPINESS_3]) as well as support of engineers ([COLOR_YIELD_GOLD]free [ICON_GREAT_ENGINEER][ENDCOLOR]) and scientists (+1[ICON_GREAT_SCIENTIST]) will make from you unquestionable leader of the world.'
WHERE Tag = 'TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Fealty[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_RED_FORT_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_RED_FORT_HELP';

UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Fealty Finisher[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Fealty Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Museum Island
INSERT INTO Language_en_US 
			(Tag,												Text)
VALUES		('TXT_KEY_BUILDING_MUSEUM_ISLAND',					'Museum Island'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_QUOTE',				'[NEWLINE]"Berlin is rather a part of the world than a city."[NEWLINE] - Jean Paul[NEWLINE]'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_PEDIA',				'Established in 1797, this museum complex in Central Berlin consists of 5 museums, each known for their extensive amount of holdings.'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_COMPOSITION',	'Wonders of Museumsinsel'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_ERAS',		'Wonders of all time'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_OTHERS',		'Wonders of all nations'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_ART',			'Artistic gallery'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_HELP',		'To maximize your bonus, make sure all the Great Work Slots are all filled with Art created by Players different than the owner, and from different Eras.'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_HELP',				'Grants [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Museum. +50% generation of [ICON_GREAT_ARTIST] Great Artists in Empire. +2 [ICON_TOURISM] Tourism to all Museums. Has 4 slots for [ICON_GREAT_WORK] Great Works of Art. +5 [ICON_RESEARCH] Science, [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Museum Island[ENDCOLOR] is the biggest composition of artistic work ever founded (4[ICON_GREAT_WORK], if themed: [ICON_RESEARCH], [ICON_CULTURE], [ICON_TOURISM]). It is an incentive for anyone eager to become an artist (+50%[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST]), whose art can be stored in one of recently created [COLOR_YIELD_FOOD]Museums[ENDCOLOR] ([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_TOURISM) (+2[ICON_TOURISM]).'
WHERE Tag = 'TXT_KEY_WONDER_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MUSEUM_ISLAND_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MUSEUM_ISLAND_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Artistry Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Great Works: [COLOR_CYAN]4 [ICON_GREAT_WORK] GW of Art[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Artistry Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Siku Quanshu
INSERT INTO Language_en_US 
			(Tag,												Text)
VALUES		('TXT_KEY_BUILDING_SIKU_QUANSHU',					'Siku Quanshu'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_QUOTE',				'[NEWLINE]"I have always imagined that Paradise will be a kind of a Library."[NEWLINE] - Jorge Luis Borges[NEWLINE]'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_PEDIA',				'TODO'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_COMPOSITION',	'Written legacy of all dynasties'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_ERAS',			'Literature of all time'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_OWNER',		'Literature from people'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_WRITINGS',		'Interesting composition of writings'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_HELP',			'To maximize your bonus, make sure all the Great Work Slots are all filled with Literature created by You, and from different Eras.'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_HELP',				'+1 [ICON_RESEARCH] Science from Writers in your Empire. +2 Writer slots. Has 4 slots for [ICON_GREAT_WORK] Great Works of Literature. +10 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR]. All [ICON_GREAT_WORK] Great Works in the Empire receive +1 [ICON_RESEARCH] Science and +1 [ICON_CULTURE] Culture. -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Illiteracy.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Siku Quanshu[ENDCOLOR] holds knowledge, creations and history of your people (4[ICON_GREAT_WORK], if themed: [ICON_RESEARCH], [ICON_CULTURE]). Each one of them has now increased value (+1[ICON_RESEARCH], +1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) and can be used by competent people for better good (+2 slots for [ICON_GREAT_WRITER]; +1[ICON_RESEARCH]/[ICON_GREAT_WRITER][ICON_GREAT_WRITER]). Also your citizens will be able to enjoy them in their free time (-1[ICON_HAPPINESS_3] Illiteracy).'
WHERE Tag = 'TXT_KEY_WONDER_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SIKU_QUANSHU_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SIKU_QUANSHU_HELP';
				
UPDATE Language_en_US SET Text = 'Great Works: [COLOR_CYAN]4 [ICON_GREAT_WORK] GW of Literature[ENDCOLOR]; Player: [COLOR_CYAN]7 Cities[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Brooklyn Bridge
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BROOKLYN',		'Brooklyn Bridge'),
			('TXT_KEY_WONDER_BROOKLYN_QUOTE',	'[NEWLINE]"Scientists are people who build the Brooklyn Bridge and then buy it."[NEWLINE] - William F. Buckley Jr.[NEWLINE]'),
			('TXT_KEY_WONDER_BROOKLYN_PEDIA',	'The Brooklyn Bridge is an iconic suspension bridge joining the boroughs of Manhattan and Brooklyn in New York City, New York across the East River. It was constructed between January 3 1870 and May 24, 1883 when it was opened to the public. The bridge is constructed in a Neo-Gothic style, as exhibited by the pointed arches in the towers.[NEWLINE][NEWLINE]  During scares of stability of the bridge in 1884, P.T. Barnum lead a herd of 21 elephants from his circus across the bridge. The bridge also has been used for exoduses of people following events such as 9/11, during which circumstances the bridge wobbled in a similar manner to the Millenium bridge in London.'),
			('TXT_KEY_WONDER_BROOKLYN_HELP',	'Grants [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_DIPLOMAT] Great Diplomat and 100 [ICON_INFLUENCE] on construction. Gain 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route slot.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Brooklyn Bridge[ENDCOLOR] has huge influence on people from all corners of the world (100[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). Additionally it hires new influencer ([COLOR_YIELD_GOLD]free [ICON_DIPLOMAT][ENDCOLOR]) and your word can be sent through recently established trade routes (+1[ICON_INTERNATIONAL_TRADE]).'
WHERE Tag = 'TXT_KEY_WONDER_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BROOKLYN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BROOKLYN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; City: [COLOR_CYAN]25 Citizens[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Trans-Siberian Railway
INSERT INTO Language_en_US 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_SIBERIAN_RAILWAY',			'Trans-Siberian Railway'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_QUOTE',		'[NEWLINE]"The Trans-Siberian is more than just a railway. It''s a journey into the psyche of modern Russia; a triumph of engineering; a movable feast through the largest - and, perhaps, most mysterious - nation on Earth."[NEWLINE] - Gavin Haines[NEWLINE]'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP',		'+25% [ICON_WORKER] Improvement Construction Rate. All Land Units receive [COLOR_POSITIVE_TEXT]Trans-Siberian Railway[ENDCOLOR] promotion. +15% [ICON_GOLD] Gold from City Connections.[NEWLINE][NEWLINE]All [ICON_RES_COAL] Coal: +5 [ICON_GOLDEN_AGE] Golden Age Points.[NEWLINE]All [ICON_RES_OIL] Oil: +5 [ICON_GOLDEN_AGE] Golden Age Points.[NEWLINE]All [ICON_RES_ALUMINUM] Aluminum: +5 [ICON_GOLDEN_AGE] Golden Age Points.[NEWLINE]All [ICON_RES_URANIUM] Uranium: +5 [ICON_GOLDEN_AGE] Golden Age Points.'),
			('TXT_KEY_PROMOTION_SIBERIAN_RAILWAY',			'Trans-Siberian Railway'),
			('TXT_KEY_PROMOTION_SIBERIAN_RAILWAY_HELP',		'Double [ICON_MOVES]Movement [COLOR:255:230:85:255]on Tundra and Snow[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Trans-Siberian Railway[ENDCOLOR] makes journey through wild parts of Earth much easier ([COLOR_WATER_TEXT]Trans-Siberian Railway[ENDCOLOR]/[COLOR_YIELD_GOLD]Land[ENDCOLOR]). It greatly boosts your income (+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) and productivity (+20%[ICON_WORKER] Worker Rate), as well as increases the value of all modern [COLOR_GREY]Strategic[ENDCOLOR] resources inside your territory (+5[ICON_GOLDEN_AGE]/[ICON_RES_COAL][ICON_RES_COAL],[ICON_RES_OIL][ICON_RES_OIL],[ICON_RES_ALUMINUM][ICON_RES_ALUMINUM],[ICON_RES_URANIUM][ICON_RES_URANIUM]).'
WHERE Tag = 'TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Tundra[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Building: [COLOR_CYAN]Train Station[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Tundra[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Panama Canal
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_PANAMA_CANAL',		'Panama Canal'),
			('TXT_KEY_WONDER_PANAMA_CANAL_QUOTE',	'[NEWLINE]"A stream cannot rise larger than its source"[NEWLINE] - Theodore Roosevelt[NEWLINE]'),
			('TXT_KEY_WONDER_PANAMA_CANAL_PEDIA',	'The Panama Canal is a manmade shipping lane located on the Panama Isthmus seperating the Pacific Ocean and Carribean Sea. The idea of a canal in the location was first proposed int he sixteenth century by Charles V, Holy Roman Emperor, who asked for a link to shorten the journey between Spain and their colony of Peru. In 1698 the Kingdom of Scotland launched a project to create an overland trade route in the area, which was abandoned due to inhospitiable conditions a year later.[NEWLINE][NEWLINE]  It was not until 1855 that a link was first established, the Panama Canal Railway, as a result of the 1849 discovery of Gold in the American state of California. This railway was used extensively in the American construction of the canal from 1904 to 1914. As opposed to the French plan of constructing a flat water canal, much like that of the Suez Canal, the American design featured a series of ship locks to rise the ships over a range that caused problems for the French design. The American design proved sucessful, and was opened on August 15, 1914. Railway cars had been used to transport approximately 152,910,972 cubic metres of excevations through the construction, while it had cost 27,500 lives across the whole project.'),
			('TXT_KEY_WONDER_PANAMA_CANAL_HELP',	'All Naval Units receive [COLOR_POSITIVE_TEXT]Panama Canal[ENDCOLOR] promotion. Sea [ICON_INTERNATIONAL_TRADE] Trade Routes gain +100% range and +3 [ICON_GOLD] Gold. +2 [ICON_GOLD] Gold to all Harbors and Seaports.'),
			('TXT_KEY_PROMOTION_PANAMA_CANAL',		'Panama Canal'),
			('TXT_KEY_PROMOTION_PANAMA_CANAL_HELP',	'+1[ICON_ARROW_RIGHT]Movement Point. +10 HP [COLOR:255:230:85:255]on Heal inside Friendly Territory[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = 'Important [COLOR_YIELD_FOOD]Panama Canal[ENDCOLOR] project strengthens your trade routes and allows for further voyages (+100% Sea [ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE] Range; +3[ICON_GOLD]/Sea [ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]). All maritime buildings gain additional support (+2[ICON_GOLD]/all [COLOR_YIELD_FOOD]Harbors[ENDCOLOR], [COLOR_YIELD_FOOD]Seaports[ENDCOLOR]) and all naval units have increased mobility and endurance ([COLOR_WATER_TEXT]Panama Canal[ENDCOLOR]/[COLOR_YIELD_GOLD]Naval[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_PANAMA_CANAL_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PANAMA_CANAL_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Isthmus on minimum 10-tile area[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Isthmus on minimum 10-tile area[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Zocalo
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ZOCALO',		'Zocalo'),
			('TXT_KEY_WONDER_ZOCALO_QUOTE',	'[NEWLINE]"The Zocalo is a magnificent space, at least four times the size of Trafalagar Square, with the National Palace on one side, the huge cathedral on the other, and in one corner part of the old Aztec City so brutally destroyed by Hernan Cortez and the Conquistadores."[NEWLINE] - Jeremy Corbyn[NEWLINE]'),
			('TXT_KEY_WONDER_ZOCALO_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_ZOCALO_HELP',	'Grants [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_DIPLOMAT] Great Diplomat. +1 [ICON_PEACE] Faith from Civil Servants in your Empire. +10% [ICON_PRODUCTION] Production towards Diplomatic units. +2 [ICON_TOURISM] Tourism from all Monuments in your Empire. +1 Civil Servant slot.');
			
UPDATE Language_en_US
SET Text = 'Huge [COLOR_YIELD_FOOD]Zocalo[ENDCOLOR] is a proof of political ([COLOR_YIELD_GOLD]free [ICON_DIPLOMAT][ENDCOLOR]; +1 slot for [ICON_DIPLOMAT]; +10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Diplomatic[ENDCOLOR]) and religious (+1[ICON_PEACE]/[ICON_DIPLOMAT][ICON_DIPLOMAT]) accents in history of the city. Such monuments attract tourists from all over the world (+2[ICON_TOURISM]/all [COLOR_YIELD_FOOD]Monuments[ENDCOLOR]), who want to be the part of these events.'
WHERE Tag = 'TXT_KEY_WONDER_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ZOCALO_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ZOCALO_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Kew Gardens
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_KEW_GARDENS',		'Kew Gardens'),
			('TXT_KEY_WONDER_KEW_GARDENS_QUOTE',	'[NEWLINE]"Stand in nature before anyone else has woken and most people find something to believe in."[NEWLINE] - Tor Udall[NEWLINE]'),
			('TXT_KEY_WONDER_KEW_GARDENS_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_KEW_GARDENS_HELP',		'+1 [ICON_FOOD] Food, +1 [ICON_RESEARCH] Science and +1 [ICON_TOURISM] Tourism from Farms in your Empire. Converts 10% of [ICON_FOOD] Food produced by this City into [ICON_RESEARCH] Science and further 10% of [ICON_RESEARCH] Science into [ICON_TOURISM] Tourism.');
			
UPDATE Language_en_US
SET Text = 'Rich [COLOR_YIELD_FOOD]Kew Gardens[ENDCOLOR] are filled with tousands of plants, huge database and human devotion to study their behaviour and support developement of [COLOR_CITY_BROWN]Farms[ENDCOLOR] in your empire (+1[ICON_FOOD], +1[ICON_RESEARCH], +1[ICON_TOURISM]/[ICON_WORKER][ICON_WORKER]). There''s a connection between growth, accumulated knowledge and also tourism traffic created by curious eco-visitors (+3[ICON_GREAT_SCIENTIST]; 10%[ICON_FOOD] into [ICON_RESEARCH]; 10%[ICON_RESEARCH] into [ICON_TOURISM]), which can be used to speed up your economy.'
WHERE Tag = 'TXT_KEY_WONDER_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KEW_GARDENS_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KEW_GARDENS_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Rationalism Finisher[ENDCOLOR]; Building: [COLOR_CYAN]Agribusiness[ENDCOLOR], [COLOR_CYAN]Garden[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Rationalism Finisher[ENDCOLOR]; Building: [COLOR_CYAN]Agribusiness[ENDCOLOR], [COLOR_CYAN]Garden[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Monte Carlo
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_MONTE_CARLO',		'Monte Carlo Casino'),
			('TXT_KEY_WONDER_MONTE_CARLO_QUOTE',	'[NEWLINE]"Luck was a servant and not a master. Luck had to be accepted with a shrug or taken advantage of up to the hilt. But it had to be understood and recognized for what it was and not confused with a faulty appreciation of the odds, for, at gambling, the deadly sin is to mistake bad play for bad luck."[NEWLINE] - Ian Fleming[NEWLINE]'),
			('TXT_KEY_WONDER_MONTE_CARLO_PEDIA',	'The Monte Carlo Casino is a gambling and entertainment complex located in Monte Carlo, Monaco. It includes a casino, the Grand Theatre de Monte Carlo, and the office of Les Ballets de Monte Carlo. The Monte Carlo Casino is owned and operated by the Société des bains de mer de Monaco, a public company in which the Monaco government and the ruling family have a majority interest. The company also owns the principal hotels, sports clubs, foodservice establishments, and nightclubs throughout Monaco.'),
			('TXT_KEY_WONDER_MONTE_CARLO_HELP',		'+10% [ICON_GOLD] Gold in your Empire. Converts 33% of [ICON_TOURISM] Tourism produced by this City into [ICON_GOLD] Gold. 20% of [ICON_GOLD] Gold Purchase is converted into [ICON_TOURISM] Tourism. Grants [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Hotel.');
			
UPDATE Language_en_US
SET Text = 'Casino of [COLOR_YIELD_FOOD]Monte Carlo[ENDCOLOR] invites anyone favoured by the fortune (+10%[ICON_GOLD][ICON_GOLD]). Promises of becoming rich attract tourists (20%[ICON_GOLD] Spent into [ICON_TOURISM]), and money they spend in your [COLOR_YIELD_FOOD]Hotels[ENDCOLOR] ([ICON_TOURISM]) (+2[ICON_GOLD]; +2[ICON_TOURISM]) is what your empire needs the most (33%[ICON_TOURISM] into [ICON_GOLD]).'
WHERE Tag = 'TXT_KEY_WONDER_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MONTE_CARLO_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MONTE_CARLO_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Artistry Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Mountain[ENDCOLOR], [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Artistry Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Ruhr Valley
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_RUHR_VALLEY',		'Ruhr Valley'),
			('TXT_KEY_WONDER_RUHR_VALLEY_QUOTE',	'[NEWLINE]"Art without engineering is dreaming. Engineering without art is calculating."[NEWLINE] - Steven Roberts[NEWLINE]'),
			('TXT_KEY_WONDER_RUHR_VALLEY_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_RUHR_VALLEY_HELP',		'Wonder places 1 new [ICON_RES_COAL] Coal resource inside City range if possible. +10% [ICON_PRODUCTION] Production in your Empire. +1 [ICON_PRODUCTION] Production from Mines and Quarries in your Empire. +1 [ICON_GOLD] Gold and +1 [ICON_GOLDEN_AGE] Golden Age Point from Coals in your Empire. +1 Working Range of this City.');
			
UPDATE Language_en_US
SET Text = 'Abundant [COLOR_YIELD_FOOD]Ruhr Valley[ENDCOLOR] agglomeration (+2[ICON_RANGE] City Working Range) is the heart of whole country (+10%[ICON_PRODUCTION][ICON_PRODUCTION]). It supports your industry thanks to new discoveries of [COLOR_GREY]Coal[ENDCOLOR] deposits (+1[ICON_RES_COAL](3); +1[ICON_GOLD], +1[ICON_GOLDEN_AGE]/[ICON_RES_COAL][ICON_RES_COAL]) and well-trained workforce spread across all [COLOR_CITY_BROWN]Mines[ENDCOLOR] and [COLOR_CITY_BROWN]Quarries[ENDCOLOR] (+1[ICON_PRODUCTION]/[ICON_WORKER][ICON_WORKER]).'
WHERE Tag = 'TXT_KEY_WONDER_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_RUHR_VALLEY_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_RUHR_VALLEY_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Industry Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; City: [COLOR_CYAN]place for Coal[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Industry Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; City: [COLOR_CYAN]place for Coal[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Darjeeling Himalayan Railway
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_DARJEELING',			'Darjeeling Himalayan Railway'),
			('TXT_KEY_WONDER_DARJEELING_QUOTE',		'[NEWLINE]"A traditional Englishman drinks tea to the point where his blood has long-since been replaced with an infusion of Ceylon, Assam, and Darjeeling."[NEWLINE] - Fennel Hudson[NEWLINE]'),
			('TXT_KEY_WONDER_DARJEELING_PEDIA',		'The Darjeeling Himalayan Railway is a narrow-gauge railway that operates between the Indian cities of Siliguri and Darjeeling, in the North-East of the country. It features a vertical ascent of approximately 2,100 metres along the 78 kilometre track, and was built during the British Raj period of the colonialism of the country in order to provide railroad access to the area, which was perfect for Tea plantations. It is often referred to as the ''Toy train'' due to the small size of the train and tracks, a design which was deliberate to allow the train to handle the steep ascent to Darjeeling. The railway was closed for a brief period in the late 1980''s during a violent Gorkhaland movement, in which residents of the area campaigned for a seperate state within India to recognise their ethnic heritage of Gorkhas.'),
			('TXT_KEY_WONDER_DARJEELING_HELP',		'All Pedestrian Military Units receive [COLOR_POSITIVE_TEXT]Toy Train[ENDCOLOR] promotion. +15% [ICON_GOLD] Gold from City Connections. +1 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism from Mountain tiles worked by this City.'),
			('TXT_KEY_PROMOTION_DARJEELING',		'Toy Train'),
			('TXT_KEY_PROMOTION_DARJEELING_HELP',	'Unit [COLOR:255:230:85:255]can Enter Mountain[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Darjeeling Himalayan Railway[ENDCOLOR] is excellent way to communicate difficult areas of your empire together ([COLOR_WATER_TEXT]Toy Train[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Pedestrian[ENDCOLOR]). Such a connection can also improve your income (+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) and populate [COLOR_CITY_BLUE]Mountainous[ENDCOLOR] (+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_FLOWER][ICON_FLOWER] to corresponding City) terrain surrounding your city.'
WHERE Tag = 'TXT_KEY_WONDER_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_DARJEELING_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_DARJEELING_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]2 Mountains[ENDCOLOR]; Building: [COLOR_CYAN]Train Station[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Banff Springs Hotel
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BANFF',			'Banff Springs Hotel'),
			('TXT_KEY_WONDER_BANFF_QUOTE',		'[NEWLINE]"A national park is not a playground. It''s a sanctuary for nature and for humans who will accept nature on nature''s own terms."[NEWLINE] - Michael Frome[NEWLINE]'),
			('TXT_KEY_WONDER_BANFF_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_BANFF_HELP',		'+1 [ICON_GOLD] Gold and +1 [ICON_TOURISM] Tourism from all Merchant Specialists in your Empire. +5 [ICON_GOLD] Gold and +5 [ICON_TOURISM] Tourism from all Mountain tiles worked by this City. Grants [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Hotel. -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Banff Springs Hotel[ENDCOLOR] is a perfect example how to make profits from [COLOR_CITY_BLUE]Mountains[ENDCOLOR] (+5[ICON_GOLD], +5[ICON_TOURISM]/[ICON_FLOWER] to City) using basic tourism infrastructure: [COLOR_YIELD_FOOD]Hotels[ENDCOLOR] ([ICON_TOURISM]), merchant districts (+1[ICON_GREAT_MERCHANT]; +5[ICON_GOLD], +5[ICON_TOURISM]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT]) and all kind of entertainment facilities (-1[ICON_HAPPINESS_3] Boredom).'
WHERE Tag = 'TXT_KEY_WONDER_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BANFF_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BANFF_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Industry Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Mountain[ENDCOLOR], [COLOR_CYAN]Tundra[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Industry Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Tundra[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Orszaghaz
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_ORSZAGHAZ',				'Orszaghaz'),
			('TXT_KEY_WONDER_ORSZAGHAZ_QUOTE',			'[NEWLINE]"With self-government is freedom, and with freedom is justice and patriotism."[NEWLINE] - Lajos Kossuth[NEWLINE]'),
			('TXT_KEY_WONDER_ORSZAGHAZ_PEDIA',			'TODO'),
			('TXT_KEY_GREAT_WORK_HOLY_CROWN',			'Holy Crown of Hungary'),
			('TXT_KEY_GREAT_WORK_HOLY_CROWN_QUOTE',		'[NEWLINE]You desire that which exceeds my humble powers, but I trust[NEWLINE]in the compassion and mercy of the All-powerful God.[NEWLINE] - Saint Stephen[NEWLINE]'),
			('TXT_KEY_WONDER_ORSZAGHAZ_HELP',			'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. +10% [ICON_GOLDEN_AGE] Golden Age Points in your Empire. +1 [ICON_INFLUENCE] World Congress Vote, +1 [ICON_INFLUENCE] World Congress Vote for each 2 Declarations of Friendship and +1 [ICON_INFLUENCE] World Congress Vote for each Defensive Pact. Has 1 slot for [ICON_GREAT_WORK] Great Work of Art, and starts with [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]Holy Crown of Hungary[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Orszaghaz[ENDCOLOR] is an evidence of your good will towards rest of the world (+1[ICON_DIPLOMAT] League Vote; +1[ICON_DIPLOMAT] League Vote/2 DoF; +1[ICON_DIPLOMAT] League Vote/DP) and also huge leap towards better future of your citizens ([COLOR_MAGENTA]free Policy[ENDCOLOR]). You also invite them to see the holiest artifact in your collection: [COLOR_CULTURE_STORED]Holy Crown of Hungary[ENDCOLOR], spreading the light of new age (+15%[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]).'
WHERE Tag = 'TXT_KEY_WONDER_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ORSZAGHAZ_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ORSZAGHAZ_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Building: [COLOR_CYAN]Constabulary[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Neuschwanstein
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Neuschwanstein[ENDCOLOR] gives you nice boost to your treasury (+6[ICON_GOLD]; +1[ICON_GREAT_MERCHANT]), culture output (+4[ICON_CULTURE]), and turns your [COLOR_YIELD_FOOD]Castles[ENDCOLOR] (+1[ICON_GOLD], +1[ICON_CULTURE], +1[ICON_HAPPINESS_1]) into most valuable buildings in your cities.'
WHERE Tag = 'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Can only be built in a City within 2 tiles of a Mountain that is inside your territory. ', '') WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Soho Foundry
UPDATE Language_en_US
SET Text = 'If you are looking for a nice industrial boost for your civilization, then [COLOR_YIELD_FOOD]Soho Foundry[ENDCOLOR] is for you. This [COLOR_YIELD_FOOD]Factory[ENDCOLOR] ([ICON_PRODUCTION]; [ICON_GREAT_PEOPLE]; [ICON_HAPPINESS_3]; [ICON_INTERNATIONAL_TRADE]) is great source of strategic [COLOR_GREY]Coal[ENDCOLOR] (+4 flat [ICON_RES_COAL]), supported by fresh engineering corps (+1[ICON_GREAT_ENGINEER]), that will increase your developement significantly.' WHERE Tag = 'TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR], [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Louvre
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Louvre[ENDCOLOR] is an ideal place for hiding precious artifacts (2 [COLOR_YIELD_GOLD]free Archaeologists[ENDCOLOR]). This huge [COLOR_YIELD_FOOD]Museum[ENDCOLOR] ([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_TOURISM) also contains wonderful pieces of global art (4[ICON_GREAT_WORK], if themed: [ICON_CULTURE]) and invites artists from all over the world ([COLOR_YIELD_GOLD]free [ICON_GREAT_ARTIST][ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Artistry[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_LOUVRE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_LOUVRE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Artistry Finisher[ENDCOLOR]; Improvement: [COLOR_CYAN]Landmark[ENDCOLOR]; Great Works: [COLOR_CYAN]4 [ICON_GREAT_WORK] GW of Art[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Artistry Finisher[ENDCOLOR]; Improvement: [COLOR_CYAN]Landmark[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Palace of Westminster
UPDATE Language_en_US
SET Text = 'Influential [COLOR_YIELD_FOOD]Palace of Westminster[ENDCOLOR] brings additional seats for your world congress delegtes (+2[ICON_DIPLOMAT] League Votes (scaling)). Additionally it increases your wealth by inviting merchants ([COLOR_YIELD_GOLD]free [ICON_GREAT_MERCHANT][ENDCOLOR]) and reducing your people''s needs (-1[ICON_HAPPINESS_3] Poverty).'
WHERE Tag = 'TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Statecraft[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_BIG_BEN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BIG_BEN_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Statecraft Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Player: [COLOR_CYAN]3 [ICON_CITY_STATE] Allies[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Statecraft Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Eiffel Tower
UPDATE Language_en_US
SET Text = 'Impressing [COLOR_YIELD_FOOD]Eiffel Tower[ENDCOLOR] can be a helpful tool for quick cultural developement of your civilization (-10%[ICON_CULTURE] Policy Cost), which is key to world domination.'
WHERE Tag = 'TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_EIFFEL_TOWER_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EIFFEL_TOWER_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Improved Resource: [COLOR_CYAN]Iron[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Brandenburg Gate
UPDATE Language_en_US
SET Text = 'Military potential of [COLOR_YIELD_FOOD]Brandenburg Gate[ENDCOLOR] is invaluable. Bigger (+10[ICON_SILVER_FIST]) and well-trained army (+15 global XP/[COLOR_YIELD_GOLD]Military[ENDCOLOR]) as well as a briliant leadership ([COLOR_YIELD_GOLD]free [ICON_GREAT_GENERAL][ENDCOLOR]; +2[ICON_GREAT_SCIENTIST]) will entrench your current position amongst other nations.'
WHERE Tag = 'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Imperialism Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Improvement: [COLOR_CYAN]Citadel[ENDCOLOR]/[COLOR_CYAN]Fort[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Imperialism Finisher[ENDCOLOR]; Improvement: [COLOR_CYAN]Citadel[ENDCOLOR]/[COLOR_CYAN]Fort[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Polar Expedition
INSERT INTO Language_en_US 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_POLAR_EXPEDITION',		'Polar Expedition'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_QUOTE',	'[NEWLINE]"Adventure is just bad planning."[NEWLINE] - Roald Amundsen[NEWLINE]'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_HELP',	'Wonder places 2 new [ICON_RES_OIL] Oil resources inside City range if possible. +2 [ICON_RESEARCH] Science from all Snow tiles worked by the City. +1 [ICON_RESEARCH] Science and +1 [ICON_GOLDEN_AGE] Golden Age Points from all Scientist Specialists in your Empire.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Polar Expedition[ENDCOLOR] vastly explores unvisited [COLOR_CITY_BLUE]Snow[ENDCOLOR] areas (+2[ICON_RESEARCH]/[ICON_FLOWER]) and looks for new underground [COLOR_GREY]Oil[ENDCOLOR] deposits (+1[ICON_RES_OIL](2), +1[ICON_RES_OIL](3)) hidden by white cover. New research facilities created there will surely expand our knowledge about Earth and its history (+1[ICON_RESEARCH], +1[ICON_GOLDEN_AGE]/[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]).'
WHERE Tag = 'TXT_KEY_WONDER_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_POLAR_EXPEDITION_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_POLAR_EXPEDITION_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR]; City: [COLOR_CYAN]Near Pole[ENDCOLOR], [COLOR_CYAN]place for Oil[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR]; City: [COLOR_CYAN]place for Oil[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Akihabara Electric Town
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_AKIHABARA',		'Akihabara Electric Town'),
			('TXT_KEY_WONDER_AKIHABARA_QUOTE',	'[NEWLINE]"It''s akin to the maddest Asian market you''ve ever been in, but instead of selling mangosteens they''re hawking manga and motherboards - and the sellers are not only pushy, they''re prerecorded."[NEWLINE] - "Lonely Planet" about Akihabara[NEWLINE]'),
			('TXT_KEY_WONDER_AKIHABARA_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_AKIHABARA_HELP',	'+2 Merchant slots. +1 [ICON_PRODUCTION] Production, +2 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture from all Markets in your Empire. +1 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold from all Customs Houses in your Empire. +2 [ICON_PRODUCTION] Production from all Merchant Specialists in your Empire.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Akihabara Electric Town[ENDCOLOR] is a place, where merchants (+2 slots for [ICON_GREAT_MERCHANT]; +2[ICON_PRODUCTION]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT]) sell all kind of electronic stuff you can imagine. Those [COLOR_YIELD_FOOD]Markets[ENDCOLOR] (+1[ICON_PRODUCTION], +2[ICON_GOLD], +1[ICON_CULTURE]/all [COLOR_YIELD_FOOD]Markets[ENDCOLOR]) work locally, but all those products can be sold abroad through [COLOR_CITY_BROWN]Customs Houses[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_MUSHROOM][ICON_MUSHROOM]) supporting electronic industry of the world, as well.'
WHERE Tag = 'TXT_KEY_WONDER_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_AKIHABARA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_AKIHABARA_HELP';
				
UPDATE Language_en_US SET Text = 'Improvement: [COLOR_CYAN]Town[ENDCOLOR]; City: [COLOR_CYAN]3 Merchant Specialists[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Rockefeller Center
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_ROCKEFELLER',		'Rockefeller Center'),
			('TXT_KEY_WONDER_ROCKEFELLER_QUOTE',	'[NEWLINE]"A friendship founded on business is better than a business founded on friendship."[NEWLINE] - John D. Rockefeller[NEWLINE]'),
			('TXT_KEY_WONDER_ROCKEFELLER_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_ROCKEFELLER_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Research Lab in the City in which it is built. +2 [ICON_RESEARCH] Science from all Hospitals in your Empire. +3 [ICON_GOLD] Gold to all your Cities in Empire. Receive 5% [ICON_CULTURE] Culture from each [ICON_GOLD] Gold Purchase in the Empire.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Rockefeller Center[ENDCOLOR] strongly supports many different branches of your country: economy (+3[ICON_GOLD]/City), culture (5%[ICON_CULTURE]/[ICON_GOLD][ICON_GOLD] Purchase) and research (+2[ICON_RESEARCH]/all [COLOR_YIELD_FOOD]Hospitals[ENDCOLOR]). Huge breakthroughs will be only matter of time thanks to new [COLOR_YIELD_FOOD]Research Labs[ENDCOLOR] ([ICON_RESEARCH]) working in this complex.'
WHERE Tag = 'TXT_KEY_WONDER_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ROCKEFELLER_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ROCKEFELLER_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Buidling: [COLOR_CYAN]Opera House[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Autobahn
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_AUTOBAHN',		'Autobahn'),
			('TXT_KEY_WONDER_AUTOBAHN_QUOTE',	'[NEWLINE]"A car for the people, an affordable Volkswagen, would bring great joy to the masses and the problems of building such a car must be faced with courage."[NEWLINE] - Adolf Hitler[NEWLINE]'),
			('TXT_KEY_WONDER_AUTOBAHN_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_AUTOBAHN_HELP',	'+10% [ICON_GOLDEN_AGE] Golden Age Points in your Empire. +30% [ICON_WORKER] Improvement Construction Rate. +15% [ICON_GOLD] Gold from City Connections. +7 [ICON_STRENGTH] City Defense in all Cities in your Empire.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Autobahn[ENDCOLOR] allows better troops'' maneuvering increasing your defensive capabilities (+7[ICON_STRENGTH][ICON_STRENGTH]) and pushing you toward the golden age (+5[ICON_GOLDEN_AGE]; +10%[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]). It also boosts flow of your products (+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) and increases overall productivity (+30%[ICON_WORKER] Worker Rate)'
WHERE Tag = 'TXT_KEY_WONDER_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_AUTOBAHN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_AUTOBAHN_HELP';
				
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Oil[ENDCOLOR]; Building: [COLOR_CYAN]Arsenal, Military Academy[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Oil[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Interstate Highway System
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_INTERSTATE',		'Interstate Highway System'),
			('TXT_KEY_WONDER_INTERSTATE_QUOTE',	'[NEWLINE]"I see an America where a mighty network of highways spreads across our country."[NEWLINE] - Dwight D. Eisenhower[NEWLINE]'),
			('TXT_KEY_WONDER_INTERSTATE_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_INTERSTATE_HELP',	'+1 [ICON_CITIZEN] Population in all Cities in your Empire. Empire [ICON_HAPPINESS_3] Needs Modifier is reduced by 5% in all Cities. +10% [ICON_PRODUCTION] Production in your Empire. +15% [ICON_GOLD] Gold from City Connections.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Interstate Highway System[ENDCOLOR] connects all corners of your country, which develops even the most neglected areas (+1[ICON_CITIZEN]; -5%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Needs). It increases your gold income (+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) and production capabilities (+10%[ICON_PRODUCTION][ICON_PRODUCTION]).'
WHERE Tag = 'TXT_KEY_WONDER_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_INTERSTATE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_INTERSTATE_HELP';
				
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Oil[ENDCOLOR]; City: [COLOR_CYAN]8 Cities[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Oil[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hollywood
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_HOLLYWOOD',		'Hollywood'),
			('TXT_KEY_WONDER_HOLLYWOOD_QUOTE',	'[NEWLINE]"Hollywood is a place where they''ll pay you a thousand dollars for a kiss and fifty cents for your soul. I know, because I turned down the first offer often enough and held out for the fifty cents."[NEWLINE] - Marilyn Monroe[NEWLINE]'),
			('TXT_KEY_WONDER_HOLLYWOOD_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_HOLLYWOOD_HELP',	'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. 75 [ICON_TOURISM] Tourism when you unlock new Policy scaling with Era. -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom in this City and -5% [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom in the Empire. +1 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture from all Broadcast Towers and +2 [ICON_GOLD] Gold, +2 [ICON_CULTURE] Culture and +2 [ICON_TOURISM] Tourism from all Guilds in your Empire.');
			
UPDATE Language_en_US
SET Text = 'If you want to make your empire happier, built [COLOR_YIELD_FOOD]Hollywood[ENDCOLOR] (-1[ICON_HAPPINESS_3] Boredom; -5%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Boredom). It will be a cultural center of your country (+1[ICON_TOURISM]; 75[ICON_TOURISM]/Policy unlock; [COLOR_MAGENTA]free Policy[ENDCOLOR]), that also make profits for you (+1[ICON_GOLD], +1[ICON_CULTURE]/all [COLOR_YIELD_FOOD]Broadcast Towers[ENDCOLOR]; +2[ICON_GOLD], +2[ICON_CULTURE], +2[ICON_TOURISM]/all [COLOR_YIELD_FOOD]Guilds[ENDCOLOR])!'
WHERE Tag = 'TXT_KEY_WONDER_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_HOLLYWOOD_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HOLLYWOOD_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR], [COLOR_CYAN]Grassland[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Concorde
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_CONCORDE',		'Concorde'),
			('TXT_KEY_WONDER_CONCORDE_QUOTE',	'[NEWLINE]"I should go to Paris and jump off of the Eiffel Tower. If I took the Concorde, I could be dead three hours earlier."[NEWLINE] - Woody Allen[NEWLINE]'),
			('TXT_KEY_WONDER_CONCORDE_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_CONCORDE_HELP',	'Grants 20 [ICON_INFLUENCE] on construction. +15% [ICON_GOLD] Gold from City Connections. +25% [ICON_TOURISM] Tourism during [ICON_HAPPINESS_1] WLTKD.[NEWLINE][NEWLINE]All [ICON_RES_OIL] Oil: +3 [ICON_TOURISM] Tourism.[NEWLINE]All [ICON_RES_ALUMINUM] Aluminum: +3 [ICON_TOURISM] Tourism.');
			
UPDATE Language_en_US
SET Text = 'Supersonic airliner [COLOR_YIELD_FOOD]Concorde[ENDCOLOR] drastically increases efficiency in passenger flights and boosts tourism income (+3[ICON_TOURISM]; +3[ICON_TOURISM]/[ICON_RES_OIL][ICON_RES_OIL], [ICON_RES_ALUMINUM][ICON_RES_ALUMINUM]; +25%[ICON_TOURISM] during [ICON_HAPPINESS_1]WLTKD). The world is your oyster (20[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). Just count the money (+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]).'
WHERE Tag = 'TXT_KEY_WONDER_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CONCORDE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CONCORDE_HELP';
				
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN][ICON_RES_ALUMINUM] Aluminum[ENDCOLOR]; City: [COLOR_CYAN]3 Engineer Specialists[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN][ICON_RES_ALUMINUM] Aluminum[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sanbo Honbu
INSERT INTO Language_en_US 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_SANBO',					'Sanbo Honbu'),
			('TXT_KEY_WONDER_SANBO_QUOTE',				'[NEWLINE]"Unite your total strength, to be devoted to construction for the future. Cultivate the ways of rectitude, foster nobility of spirit, and work with resolution - so that you may enhance the innate glory of the Imperial State and keep pace with the progress of the world."[NEWLINE] - Hirohito[NEWLINE]'),
			('TXT_KEY_WONDER_SANBO_PEDIA',				'TODO'),
			('TXT_KEY_WONDER_SANBO_HELP',				'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. All Miltary Land Units in the Empire get [COLOR_POSITIVE_TEXT]Imperial Army[ENDCOLOR] promotion, all Military Naval Melee Units in the Empire get [COLOR_POSITIVE_TEXT]Fleet of the Sun[ENDCOLOR] promotion and all Military Air Units in the Empire get [COLOR_POSITIVE_TEXT]Kamikaze[ENDCOLOR] promotion. +30% [ICON_PRODUCTION] Production towards Military Units.'),
			('TXT_KEY_PROMOTION_SANBO_LAND',			'Imperial Army'),
			('TXT_KEY_PROMOTION_SANBO_LAND_HELP',		'Bonus[ICON_MOVES]Movement Point[COLOR:255:230:85:255] after crossing Rivers[ENDCOLOR]. +10%[ICON_STRENGTH]CS/[ICON_RANGE_STRENGTH]RCS [COLOR:255:230:85:255]in Rough Terrain[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_SANBO_SEA',				'Fleet of the Sun'),
			('TXT_KEY_PROMOTION_SANBO_SEA_HELP',		'Unit deals Damage [COLOR:255:230:85:255]to attackng Air Unit[ENDCOLOR]. Requires [ICON_RESEARCH][COLOR_RESEARCH_STORED]Flight[ENDCOLOR] (excluding Submarines). +10%[ICON_STRENGTH]CS/[ICON_RANGE_STRENGTH]RCS if unit [COLOR:255:230:85:255]is adjacent to another Friendly Unit[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_SANBO_AIR',				'Kamikaze'),
			('TXT_KEY_PROMOTION_SANBO_AIR_HELP',		'+30%[ICON_RANGE_STRENGTH]RCS if unit [COLOR:255:230:85:255]has 20% of its maximum HP or less[ENDCOLOR] [COLOR_GREY](inactive)[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_SANBO_AIR_EFFECT',		'Kamikaze: For the Emperor!'),
			('TXT_KEY_PROMOTION_SANBO_AIR_EFFECT_HELP',	'+30%[ICON_RANGE_STRENGTH]RCS if unit [COLOR:255:230:85:255]has 20% of its maximum HP or less[ENDCOLOR] [COLOR_POSITIVE_TEXT](active)[ENDCOLOR].');

UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Sanbo Honbu[ENDCOLOR] strengthen all military branches of your army: land ([COLOR_WATER_TEXT]Imperial Army[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Land[ENDCOLOR]), naval ([COLOR_WATER_TEXT]Fleet of the Sun[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Naval[ENDCOLOR]) and air ([COLOR_WATER_TEXT]Kamikaze[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Air[ENDCOLOR]). It also speeds up build time of troops (+30%[ICON_PRODUCTION]/Miltary) and improve your internal power ([COLOR_MAGENTA]free Policy[ENDCOLOR]). As an cherry on top you can gain generals and admirals much quicker (+2[ICON_GREAT_GENERAL]; +3[ICON_GREAT_ADMIRAL]).'
WHERE Tag = 'TXT_KEY_WONDER_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SANBO_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SANBO_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Autocracy[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Building: [COLOR_CYAN]Arsenal, Military Academy[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Autocracy[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Mount Rushmore
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_RUSHMORE',		'Mount Rushmore'),
			('TXT_KEY_WONDER_RUSHMORE_QUOTE',	'[NEWLINE]"Guard against the impostures of pretended patriotism." - G. Washington;   "Only lay down true principles, and adhere to them inflexibly." - T. Jefferson;   "The government is us; we are the government, you and I." - T. Roosevelt;   "The dogmas of the quiet past are inadequate to the stormy present." - A. Lincoln[NEWLINE]'),
			('TXT_KEY_WONDER_RUSHMORE_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_RUSHMORE_HELP',	'+1 [ICON_INFLUENCE] World Congress Vote. +1 Artist slot. +1 [ICON_PRODUCTION] Production, +1 [ICON_CULTURE] Culture and +1 [ICON_TOURISM] Tourism from all Mountains inside the City borders. +1 [ICON_CULTURE] Culture and +1 [ICON_TOURISM] Tourism from all Great Works in the Empire.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Mount Rushmore[ENDCOLOR] is a fantastic artistic creation (+1 slot for [ICON_GREAT_ARTIST]) cut in the [COLOR_CITY_BLUE]Mountain[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_FLOWER]). This work is the main reason people visit this part of the world (+1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) and, as an addition, it conmemorates 4 greatest people in history of the country (+1[ICON_DIPLOMAT] League Vote).'
WHERE Tag = 'TXT_KEY_WONDER_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_RUSHMORE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_RUSHMORE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Statue of Liberty
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Statue of Liberty[ENDCOLOR] is your sign towards other communities, that your developement is the best way to rule the world ([COLOR_MAGENTA]free Policy[ENDCOLOR]). Such a confidence increase trust of your citizens, who become more productive in all spheres of life (+1[ICON_PRODUCTION]/All specialists).'
WHERE Tag = 'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires [COLOR_MAGENTA]Freedom[ENDCOLOR]. ', '') WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; City: [COLOR_CYAN]10 Specialists[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Empire State Building
UPDATE Language_en_US
SET Text = 'Becoming rich is in your blood, so construction of [COLOR_YIELD_FOOD]Empire State Building[ENDCOLOR] is inevitable (+1[ICON_GOLD]/All specialists). It is a [COLOR_YIELD_FOOD]Stock Exchange[ENDCOLOR] ([ICON_GOLD]; [ICON_GREAT_MERCHANT]), were bankers generate huge profits and people gather to change their future ([COLOR_YIELD_GOLD]free [ICON_GREAT_PEOPLE][ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,												Text) 
SELECT		'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Improved Resource: [COLOR_CYAN]Aluminum[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Kremlin
UPDATE Language_en_US
SET Text = 'Monumental [COLOR_YIELD_FOOD]Kremlin[ENDCOLOR] is the greatest effort showing your power. Tanks become the main part of your army (+33%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Armored[ENDCOLOR]) keeping your civilization safe (-1[ICON_HAPPINESS_3] Distress). This will be the sign of your culture ([COLOR_MAGENTA]free Policy[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Must be built in a Holy City. ', '') WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP';
	
INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_KREMLIN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KREMLIN_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Order[ENDCOLOR]; Terrain: [COLOR_CYAN]Tundra[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Order[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Motherland Calls
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Motherland Calls[ENDCOLOR] strengthen internal security using a [COLOR_YIELD_FOOD]Police Station[ENDCOLOR] ([ICON_SPY]; [ICON_HAPPINESS_3]; [ICON_CULTURE]; [ICON_RESEARCH]) and you will be able to motivate more troops in this city (+100% of [ICON_CITIZEN] as [ICON_SILVER_FIST]). Maintanence of your city infrastructure is much lower (-10%[ICON_GOLD][ICON_GOLD] Maintenance) and your enemies become less successful in pillaging (Enemies cannot restore HP or gain [ICON_GOLD] from Pillaging).'
WHERE Tag = 'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires [COLOR_MAGENTA]Order[ENDCOLOR]. ', '') WHERE Tag ='TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Cristo Redentor
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Cristo Redentor[ENDCOLOR] is an invitation for tourists from all over the world (+25[ICON_TOURISM]) and will make your [COLOR_YIELD_FOOD]Hotels[ENDCOLOR] (+2[ICON_CULTURE]; +2[ICON_GOLDEN_AGE]; +2[ICON_TOURISM]) an important part of your fortune.'
WHERE Tag = 'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest/Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Broadway
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Broadway[ENDCOLOR] is a perfect place for talented musicians ([COLOR_YIELD_GOLD]free [ICON_GREAT_MUSICIAN][ENDCOLOR]), who can present here fruits of their imagination (3[ICON_GREAT_WORK], if themed: [ICON_GOLD]), and every future construction in this city will be awarded by them (250[ICON_CULTURE]/Construction).'
WHERE Tag = 'TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Industry[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_BROADWAY_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BROADWAY_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Industry Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Great Works: [COLOR_CYAN]3 [ICON_GREAT_WORK] GW of Music[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Industry Finisher[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Prora
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Prora[ENDCOLOR] recreation center makes your citizens happier (+1[ICON_HAPPINESS_1]; +1[ICON_HAPPINESS_1]/2 [COLOR_MAGENTA]Policies[ENDCOLOR]) and pushes them to develop more efiiciently ([COLOR_MAGENTA]free Policy[ENDCOLOR]). Additionally it will protect your future wonder constructions (lower enemy chance to: Sabotage Wonder) and award soldiers devastating enemy lands (25[ICON_CULTURE]/Pillaging).'
WHERE Tag = 'TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires [COLOR_MAGENTA]Autocracy[ENDCOLOR] and can only be constructed in coastal City. ', '') WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_PRORA_RESORT_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PRORA_RESORT_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Autocracy[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Forest/Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Autocracy[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Habitat-67
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_HABITAT',		'Habitat-67'),
			('TXT_KEY_WONDER_HABITAT_QUOTE',	'[NEWLINE]"A house is made of walls and beams; a home is built with love and dreams."[NEWLINE] - Ralph Waldo Emerson[NEWLINE]'),
			('TXT_KEY_WONDER_HABITAT_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_HABITAT_HELP',		'Your City gains 3 [ICON_CITIZEN] Population. +1 [ICON_HAPPINESS_1] Happiness from local Garden, Museum, Hospital and Police Station, -3 [ICON_HAPPINESS_3] Unhappiness from Urbanization and -2 [ICON_HAPPINESS_3] Unhappiness from Distress in your City. +1 [ICON_CULTURE] Culture from all Engineer specialists.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Habitat-67[ENDCOLOR] fully focuses on turning your city into a paradise. It might become really crowded (+3[ICON_CITIZEN]), but the quality of life improves significantly (-3[ICON_HAPPINESS_3] Urbanization; -2[ICON_HAPPINESS_3] Distress), inhabitants can benefit from better infrastructure (+1[ICON_HAPPINESS_1]/[COLOR_YIELD_FOOD]Garden[ENDCOLOR], [COLOR_YIELD_FOOD]Museum[ENDCOLOR], [COLOR_YIELD_FOOD]Hospital[ENDCOLOR], [COLOR_YIELD_FOOD]Police Station[ENDCOLOR]) and engineers still look for more (+1[ICON_CULTURE]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER]).'
WHERE Tag = 'TXT_KEY_WONDER_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_HABITAT_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HABITAT_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Tundra[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Tundra[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Vostok Station
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_VOSTOK',			'Vostok Station'),
			('TXT_KEY_WONDER_VOSTOK_QUOTE',		'[NEWLINE]"On the barren shore, and on the lofty ice barrier in the background, myriads of grotesque penguins squawked and flapped their fins; while many fat seals were visible on the water, swimming or sprawling across large cakes of slowly drifting ice."[NEWLINE] - H.P. Lovecraft[NEWLINE]'),
			('TXT_KEY_WONDER_VOSTOK_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_VOSTOK_HELP',		'All Research Labs gain +2 [ICON_RESEARCH] Science and all Medical Labs gain +3 [ICON_FOOD] Food. +1 [ICON_FOOD] Food, +1 [ICON_PRODUCTION] Production and +4 [ICON_RESEARCH] Science to Snow tiles worked by this City. +5 [ICON_RESEARCH] Science to all Lake tiles worked by this City. +3 Scientist specialist slots in this City.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Vostok Station[ENDCOLOR], built in the coldest part of the world can perform many unusual researches (+3[ICON_GREAT_SCIENTIST]) related to [COLOR_CITY_BLUE]Snow[ENDCOLOR] (+1[ICON_FOOD], +1[ICON_PRODUCTION], +4[ICON_RESEARCH]/[ICON_FLOWER]) or underground [COLOR_CITY_GREEN]Lakes[ENDCOLOR] (+5[ICON_RESEARCH]/[ICON_MUSHROOM]). All samples are analyzed worldwide in all kind of research facilities (+3[ICON_FOOD]/all [COLOR_YIELD_FOOD]Medical Labs[ENDCOLOR]; +2[ICON_RESEARCH]/all [COLOR_YIELD_FOOD]Research Labs[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_VOSTOK_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_VOSTOK_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Milestii Mici Winery
INSERT INTO Language_en_US 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_MILESTII_MICI',			'Milestii Mici Winery'),
			('TXT_KEY_WONDER_MILESTII_MICI_QUOTE',		'[NEWLINE]"It''s quite true I''m not drinking anymore; however, I''m not drinking any less either."[NEWLINE] - W.C. Fields[NEWLINE]'),
			('TXT_KEY_WONDER_MILESTII_MICI_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_MILESTII_MICI_HELP',		'-10 [ICON_GOLD] Hurry Cost Modifiers in your Empire. +1 [ICON_FOOD] Food and +1 [ICON_GOLD] Gold per City-State Friend; +2 [ICON_FOOD] Food, +1 [ICON_PRODUCTION] Production, +2 [ICON_GOLD] Gold per City-State Ally. All Merchant specialists gain +1[ICON_FOOD] and +1[ICON_PRODUCTION].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Milestii Mici Winery[ENDCOLOR] contains the finest wines from all over the Europe, and the world, too (+1[ICON_FOOD], +1[ICON_GOLD]/[ICON_CITY_STATE] Friend; +2[ICON_FOOD], +1[ICON_PRODUCTION], +2[ICON_GOLD]/[ICON_CITY_STATE] Ally). Hired merchants do their best to gather them all in one place (+1[ICON_FOOD], +1[ICON_PRODUCTION]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT]) and all these traded goods can improve overall prices of new investments (-10[ICON_GOLD][ICON_GOLD] Hurry Cost Modifiers).'
WHERE Tag = 'TXT_KEY_WONDER_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MILESTII_MICI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MILESTII_MICI_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR], [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR], [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- JFK Space Center
INSERT INTO Language_en_US 
			(Tag,							Text)
VALUES		('TXT_KEY_BUILDING_JFK',		'JFK Space Center'),
			('TXT_KEY_WONDER_JFK_QUOTE',	'[NEWLINE]"The view of Earth is absolutely spectacular, and the feeling of looking back and seeing your planet as a planet is just an amazing feeling. It’s a totally different perspective, and it makes you appreciate, actually, how fragile our existence is."[NEWLINE] - Sally Ride[NEWLINE]'),
			('TXT_KEY_WONDER_JFK_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_JFK_HELP',		'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. +20% [ICON_PRODUCT-ION] Production towards Spaceship Parts. +2 Air slots in this City. -1 [ICON_HAPPINESS_3] Unhappiness from Illiteracy in your City. +3 [ICON_RESEARCH] Science with [COLOR_CYAN]Satellites[ENDCOLOR]');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]JFK Space Center[ENDCOLOR] is a voice of freedom that desires reaching the sky (+2[ICON_BULLET]Air slots; +20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Spaceship Part[ENDCOLOR]). Even though it is a military project, even civilians may benefit from new technologies (-2[ICON_HAPPINESS_3] Illiteracy; [COLOR_CYAN]Satellites[ENDCOLOR]: +3[ICON_RESEARCH]). But not only new technologies, yet also new reforms might come with it ([COLOR_MAGENTA]free Policy[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_JFK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_JFK_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_JFK_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Building: [COLOR_CYAN]Research Lab[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_JFK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_JFK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sputnik
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_SPUTNIK',		'Sputnik'),
			('TXT_KEY_WONDER_SPUTNIK_QUOTE',	'[NEWLINE]"Listen now for the sound that forevermore separates the old from the new. [Introducing the beep-beep chirp transmitted by the Sputnik satellite.]"[NEWLINE] - NBC Radio[NEWLINE]'),
			('TXT_KEY_WONDER_SPUTNIK_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_SPUTNIK_HELP',		'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. +20% [ICON_PRODUCTION] Production towards Spaceship Parts. Starts [ICON_GOLDEN_AGE] Golden Age. +33% generation of [ICON_GREAT_ENGINEER] Great Engineers and +25% generation of [ICON_GREAT_SCIENTIST] Great Scientists in this City.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Sputnik[ENDCOLOR] is a milestone on your way to the space (+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Spaceship Part[ENDCOLOR]; starts [ICON_GOLDEN_AGE]). Many different specialities in your empire will benefit from the discoveries made by this satellite (+33%[ICON_GREAT_ENGINEER]; +25%[ICON_GREAT_SCIENTIST]), not to mention about your citizens ([COLOR_MAGENTA]free Policy[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SPUTNIK_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SPUTNIK_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Order[ENDCOLOR]; Improved Resource: [COLOR_CYAN][ICON_RES_ALUMINUM] Aluminum[ENDCOLOR]; City: [COLOR_CYAN]3 Scientist Specialists[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Order[ENDCOLOR]; Improved Resource: [COLOR_CYAN][ICON_RES_ALUMINUM] Aluminum[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Anitkabir
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ANITKABIR',		'Anitkabir'),
			('TXT_KEY_WONDER_ANITKABIR_QUOTE',	'[NEWLINE]"Peace at home, peace in the world."[NEWLINE] - Mustafa Kemal Atatürk[NEWLINE]'),
			('TXT_KEY_WONDER_ANITKABIR_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_ANITKABIR_HELP',	'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. +1 [ICON_INFLUENCE] World Congress Vote and +1 [ICON_INFLUENCE] World Congress Vote for each controlled Enemy Capital. +50% [ICON_PRODUCTION] Production towards Diplomatic units.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Anitkabir[ENDCOLOR] fullfils a dream about world at peace. It makes diplomatic contacts much easier (+50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Diplomatic[ENDCOLOR]) and negotiations in World Congress more favourable to your side (+1[ICON_DIPLOMAT] League Vote; +1[ICON_DIPLOMAT] League Vote/controlled Enemy Capital). People will love you and your politics ([COLOR_MAGENTA]free Policy[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ANITKABIR_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ANITKABIR_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Autocracy[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Autocracy[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Thule Air Base
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_THULE',			'Thule Air Base'),
			('TXT_KEY_WONDER_THULE_QUOTE',		'[NEWLINE]"A modern, autonomous, and thoroughly trained Air Force in being at all times will not alone be sufficient, but without it, there can be no national security."[NEWLINE] - Henry H. Arnold[NEWLINE]'),
			('TXT_KEY_WONDER_THULE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_THULE_HELP',		'+10 XP to all Planes produced in this City and +5 XP to all Planes produced in your Empire. +3 Air slots in this City and +2 [ICON_SILVER_FIST] Military Unit Supply Cap in your Empire. All Planes get [COLOR_POSITIVE_TEXT]Operational Range[ENDCOLOR] promotion.'),
			('TXT_KEY_PROMOTION_THULE',			'Operational Range'),
			('TXT_KEY_PROMOTION_THULE_HELP',	'+5%[ICON_RANGE_STRENGTH]Offensive RCS. +2 [ICON_SWAP] Range.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Thule Air Base[ENDCOLOR] strengthen your air supremacy by keeping more planes in local hangars (+3[ICON_BULLET]Air slots; +2[ICON_SILVER_FIST]), training better pilots (+10 XP to local Planes; +5 XP to global Planes) or improving the overall units capabilities ([COLOR_WATER_TEXT]Operational Range[ENDCOLOR]/[COLOR_YIELD_GOLD]Planes[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_THULE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_THULE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR], [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- White Sands Missile Range
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_WHITE_SANDS',		'White Sands Missile Range'),
			('TXT_KEY_WONDER_WHITE_SANDS_QUOTE',	'[NEWLINE]"What is pride? A rocket that emulates the stars."[NEWLINE] - William Wordsworth[NEWLINE]'),
			('TXT_KEY_WONDER_WHITE_SANDS_PEDIA',	'The White Sands Missile Range is US largest military installation at almost 8300 square kilometres (3200 square miles) of New Mexico desert. The area was first designated a military site in 1941, when the Alamogordo Army Airfield was established. This site was used for the first Atomic bomb test (The Trinity test) in July 1945, by which time it had been renamed White Sands proving ground.[NEWLINE][NEWLINE]  Since then, the site has been heavily involved in experimental projects and test firings of both militaristic and exploratory projects, including captured V-2 ballistic missiles, the Apollo escape system and as a landing strip for the early Space Shuttle tests. It has been designated a National Historic Site for its role in Space Race testing, and continues to have frequent missile tests.'),
			('TXT_KEY_WONDER_WHITE_SANDS_HELP',		'Grants 3 free [COLOR_POSITIVE_TEXT]Guided Missiles[ENDCOLOR]. +33% [ICON_PRODUCTION] Production in this City when building Missiles and +10% [ICON_PRODUCTION] Production in this City when building Spaceship Parts. Missile units get [COLOR_POSITIVE_TEXT]White Sands Facility[ENDCOLOR] promotion which extends +2 [ICON_RANGE_STRENGTH] Operational Range.'),
			('TXT_KEY_PROMOTION_WHITE_SANDS',		'White Sands Facility'),
			('TXT_KEY_PROMOTION_WHITE_SANDS_HELP',	'+2 [ICON_SWAP] Range.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]White Sands Missile Range[ENDCOLOR] is a facility where numerous tests made rocket engineering reach the highest level ([COLOR_WATER_TEXT]White Sands Facility[ENDCOLOR]/[COLOR_YIELD_GOLD]Missile[ENDCOLOR]). Using latest technologies rockets are cheap and easy to manufacture (+33%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Missiles[ENDCOLOR]; +10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Spaceship Parts[ENDCOLOR]; 3 [COLOR_YIELD_GOLD]free Guided Missiles[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_WHITE_SANDS_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_WHITE_SANDS_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Imperialism Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Imperialism Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Millau Viaduct
INSERT INTO Language_en_US 
			(Tag,							Text)
VALUES		('TXT_KEY_BUILDING_MILLAU',		'Millau Viaduct'),
			('TXT_KEY_WONDER_MILLAU_QUOTE',	'[NEWLINE]"Above the cloud with its shadow is the star with its light. Above all things reverence thyself."[NEWLINE] - Pythagoras[NEWLINE]'),
			('TXT_KEY_WONDER_MILLAU_PEDIA',	'The Millau Viaduct is a cable stayed suspension bridge located in the South of France, spanning the Tarn River valley in Millau. It has a length of 2,460 metres and is the tallest bridge in the world, the highest point being 343 metres from the base. The Viaduct is part of a highway from Paris to Montpiller, in southern France. It is also the tallest structure in France, with the P2 Pillar being taller than the Eifel Tower. The route for the highway was chosen in 1989, with construction beginning in 2001 and taking 5 years.'),
			('TXT_KEY_WONDER_MILLAU_HELP',	'+5% [ICON_TOURISM] Tourism in your Empire. Converts 5% of [ICON_PRODUCTION] Production into [ICON_TOURISM] Tourism. 2 Specialists in the City no longer generates [ICON_HAPPINESS_3] Unhappiness from Urbanization. Land [ICON_INTERNATIONAL_TRADE] Trade Routes gain +100% range.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Millau Viaduct[ENDCOLOR] connects two sides of valley very difficult to pass without such construction, making life of local and more distant citizens (-3[ICON_HAPPINESS_3] Urbanization; +1[ICON_HAPPINESS_1]) or tourists (+5%[ICON_TOURISM][ICON_TOURISM]; 5%[ICON_PRODUCTION] into [ICON_TOURISM]) much easier. It also serves as a new shorter way of transporting goods in your country (Land [ICON_INTERNATIONAL_TRADE]: +100%[ICON_SWAP]).'
WHERE Tag = 'TXT_KEY_WONDER_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MILLAU_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MILLAU_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Improvement: [COLOR_CYAN]Village[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Revolutionary Museum
INSERT INTO Language_en_US 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_REVOLUTIONARY_MUSEUM',		'Revolutionary Museum'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_QUOTE',	'[NEWLINE]"The oppressed peoples can liberate themselves only through struggle. This is a simple and clear truth confirmed by history."[NEWLINE] - Kim Il-sung[NEWLINE]'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP',	'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. +3 [ICON_CULTURE] Culture from all Monuments and +2 [ICON_TOURISM] Tourism from all Police Stations and Constabularies in your Empire. +10% generation of [ICON_GREAT_PEOPLE] Great People in this City. 50 [ICON_CULTURE] Culture on Great Person expending scaling with Era.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Revolutionary Museum[ENDCOLOR] praise your civilization''s leaders like Gods (+3[ICON_CULTURE]/all [COLOR_YIELD_FOOD]Monuments[ENDCOLOR]; 50[ICON_CULTURE]/[ICON_GREAT_PEOPLE]; [COLOR_MAGENTA]free Policy[ENDCOLOR]). There''s also much higher chance to have a worthy successor on his place (+10%[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]). All security services do everything to show people from all over the world the most important parts of your country (+2[ICON_TOURISM]/all [COLOR_YIELD_FOOD]Police Stations[ENDCOLOR], [COLOR_YIELD_FOOD]Constabularies[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Order[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Building: [COLOR_CYAN]Broadcast Tower, Police Station[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Order[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Building: [COLOR_CYAN]Broadcast Tower[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Arecibo Observatory
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ARECIBO',		'Arecibo Observatory'),
			('TXT_KEY_WONDER_ARECIBO_QUOTE',	'[NEWLINE]"The surface of the Earth is the shore of the cosmic ocean. From it we have learned most of what we know. Recently, we have waded a little out to sea, enough to dampen our toes or, at most, wet our ankles. The water seems inviting. The ocean calls."[NEWLINE] - Carl Sagan[NEWLINE]'),
			('TXT_KEY_WONDER_ARECIBO_PEDIA',	'The Arecibo Observatory is the world''s largest Radio Telescope, at 305 metres (1000 feet) in width. It was constructed in 1963 in a naturally-formed sinkhole near Arecibo, Puerto Rico. It consists of the dish, which is on the ground, and a large reciever suspended above the dish by three towers which vary in height due to ground elevation.[NEWLINE][NEWLINE]  Since its construction in 1963, the observatory has been used for a variety of different purposes. Originally designed to study Earth''s Ionosphere (The layer of Earth''s atmosphere above 85 kilometres where solar radiation still affects the atmosphere. Auroras form in this layer), the Arecibo Observatory has since made a variety of discoveries and been used for several research projects. In 1990, the telescope was used to discover the first ever known Exo-planets (Planets existing outside our own Solar System). It was also used to discover Neutron stars (stars that half half a million times more mass than Earth in an area equivalent to the size of Brooklyn, New York). It has also been used for countless other astronomical discoveries.[NEWLINE][NEWLINE]  In 1974, the Observatory sent a message of binary characters, consisting of the numbers 1 to 10, DNA makeup, the solar system and more information, towards a star cluster known as globular cluser M13, around 25,000 light years away, in the hope of contacting intelligent life.'),
			('TXT_KEY_WONDER_ARECIBO_HELP',		'+2 Scientist slots. +1 [ICON_RESEARCH] Science from all Mountain tiles in your Empire. +1 [ICON_RESEARCH] Science from all Scientist Specialists in your Empire. +2 [ICON_RESEARCH] Science from Observatories in your Empire. Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DOPLOMAT] World Congress Delegate.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Arecibo Observatory[ENDCOLOR], scientific milestone, built on [COLOR_CITY_BLUE]Mountain[ENDCOLOR] (+1[ICON_RESEARCH]/[ICON_FLOWER][ICON_FLOWER] to corresponding City) and hiring specialists (+2 slots for [ICON_GREAT_SCIENTIST]; +1[ICON_RESEARCH]/[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]) to boost science in many knowledge domains (+2[ICON_GOLD]/all [COLOR_YIELD_FOOD]Observatories[ENDCOLOR]). This can be a solution to unify scientists from all over the world (+1[ICON_DIPLOMAT] League Vote).'
WHERE Tag = 'TXT_KEY_WONDER_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ARECIBO_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ARECIBO_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Rationalism Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Improvement: [COLOR_CYAN]Academy[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Rationalism Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Pentagon
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Pentagon[ENDCOLOR] focuses on military abilities of your cities (+1[ICON_SILVER_FIST][ICON_SILVER_FIST]; +2 global City Air Cap). Increased forces for production of your planes (+50%[ICON_PRODUCTION], +20 XP/[COLOR_YIELD_GOLD]Air[ENDCOLOR]; 2 [COLOR_YIELD_GOLD]free Jet Fighters[ENDCOLOR]. And it can even more, thanks to hidden intelligence agency, making your spies more effective (higher chance to: Disrupt [ICON_PRODUCTION]).'
WHERE Tag = 'TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Imperialism[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_PENTAGON_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PENTAGON_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Imperialism Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Improvement: [COLOR_CYAN]Citadel/Fort[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Imperialism Finisher[ENDCOLOR]; Improvement: [COLOR_CYAN]Citadel/Fort[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Bletchey Park
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Bletchey Park[ENDCOLOR] is place filled with scientists (+1[ICON_RESEARCH]/All Scientists) and spies (+200[ICON_VP_SPY_POINTS]; +20[ICON_SPY][ICON_SPY] City Security). The most advanced [COLOR_YIELD_FOOD]Research Lab[ENDCOLOR] ([ICON_RESEARCH]; [ICON_GREAT_SCIENTIST]; [ICON_HAPPINESS_3]) is constructed to increase your knowledge.'
WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Rationalism[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Rationalism Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Grassland[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Rationalism Finisher[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Svalbard Global Seed Vault
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_SEED_VAULT',		'Svalbard Global Seed Vault'),
			('TXT_KEY_WONDER_SEED_VAULT_QUOTE',	'[NEWLINE]"The fact that the seed collection destroyed in Syria during the civil war has been systematically rebuilt shows that the vault functions as an insurance for current and future food supply and for local food security."[NEWLINE] - Anne Beathe Tvinnereim[NEWLINE]'),
			('TXT_KEY_WONDER_SEED_VAULT_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_SEED_VAULT_HELP',	'+10% [ICON_FOOD] Food in your Empire. -15% [ICON_HAPPINESS_3] from [ICON_FOOD]/[ICON_PRODUCTION] Distress in your Empire. Every City adds 50% of its [ICON_PRODUCTION] Production to current [PRODUCTION] after new Citizen is born.[NEWLINE][NEWLINE]All [ICON_RES_WHEAT] Wheat: +2 [ICON_FOOD] Food.[NEWLINE]All [ICON_RES_MAIZE] Maize: +2 [ICON_FOOD] Food.[NEWLINE]All [ICON_RES_RICE] Rice: +2 [ICON_FOOD] Food.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Svalbard Global Seed Vault[ENDCOLOR] is an insurance policy in case of tragic events (+10%[ICON_FOOD][ICON_FOOD]). It contains seeds of most known plants (+2[ICON_FOOD]/[ICON_RES_WHEAT][ICON_RES_WHEAT], [ICON_RES_MAIZE][ICON_RES_MAIZE], [ICON_RES_RICE][ICON_RES_RICE]), boosts production in secured areas (50% of each city''s [ICON_PRODUCTION] is added to their current [ICON_PRODUCTION] on [ICON_CITIZEN] Birth) and supports the most affected people (-15%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Distress).'
WHERE Tag = 'TXT_KEY_WONDER_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SEED_VAULT_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SEED_VAULT_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Palm Jumeirah
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_JUMEIRAH',		'Palm Jumeirah'),
			('TXT_KEY_WONDER_JUMEIRAH_QUOTE',	'[NEWLINE]"Dubai''s world class physical infrastructure has already established it as a major player in terms of trade, tourism and as the leading conference and exhibition venue in this part of the world."[NEWLINE] - Abdul Aziz Al Ghurair[NEWLINE]'),
			('TXT_KEY_WONDER_JUMEIRAH_PEDIA',	'Located off the shore of Dubai in the United Arab Emirates (UAE), Palm Jumeirah is a large archipelago created by man in the shape of a palm tree. It was announced in 2001, and originally was intended to be one of three "Palm Islands" along with the Palm Jebel Ali and the Palm Deira, which was intended to be the largest of the three islands at the time. The archipelago has a total area of 25 square kilometres, comparable to over 800 American football pitches.[NEWLINE][NEWLINE] Palm Jumeirah consists of a central trunk, connected to the mainland by a 300 metre long bridge, sixteen fronds of the palm, and an 11 kilometre breakwater surrounding the construction. In total, the islands more than doubled Dubai''s existing coastline.[NEWLINE][NEWLINE] The islands are also a hotbed for new developments and resorts, much like the rest of Dubai. The Atlantis resort opened on the breakwater in 2008, which later became a symbol of the developments.'),
			('TXT_KEY_WONDER_JUMEIRAH_HELP',	'Converts 10% of [ICON_PRODUCTION] Production produced by this City into [ICON_GOLD] Gold and another 15% into [ICON_TOURISM] Tourism. +3 [ICON_PRODUCTION] Production from all Desert tiles worked by this City. +7 [ICON_TOURISM] Tourism from all Atolls in your Empire.[NEWLINE][NEWLINE]All [ICON_RES_OIL] Oil: +4 [ICON_GOLD] Gold.');
			
UPDATE Language_en_US
SET Text = 'Artificial islands called [COLOR_YIELD_FOOD]Palm Jumeirah[ENDCOLOR] create new space on [COLOR_CITY_GREEN]Atolls[ENDCOLOR] for rich tourists (+7[ICON_TOURISM]/[ICON_MUSHROOM][ICON_MUSHROOM]). Whole construction was possible thanks to the sand gathered from the local [COLOR_CITY_BLUE]Desert[ENDCOLOR] (+3[ICON_PRODUCTION]/[ICON_FLOWER]; 10%[ICON_PRODUCTION] into [ICON_GOLD]; 15%[ICON_PRODUCTION] into [ICON_TOURISM]) and [COLOR_GREY]Oil[ENDCOLOR] deposits found on your territory (+4[ICON_GOLD]/[ICON_RES_OIL][ICON_RES_OIL]).'
WHERE Tag = 'TXT_KEY_WONDER_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_JUMEIRAH_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_JUMEIRAH_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Improved Resource: [COLOR_CYAN]Oil[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Taipei 101
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_TAIPEI',			'Taipei 101'),
			('TXT_KEY_WONDER_TAIPEI_QUOTE',		'[NEWLINE]"Everything is designed. Few things are designed well."[NEWLINE] - Brian Reed[NEWLINE]'),
			('TXT_KEY_WONDER_TAIPEI_PEDIA',		'Taipei 101 is a financial tower in Taipei, the capital city of Taiwan. It was the tallest building in the world from 2004 to 2010, being surpassed by the Burj Khalifa in Dubai. Across five floors from the 87th to the 91st floors is a large turned mass damper, which stops the tower from suffering damage from amplitudinal waves caused by high winds. The tower is also designed with symbolism in mind. It is not only a large sundial with the shadow it casts, it is composed of 8 segments of 8 floors, eight being a traditional number for good luck. The design also takes into account ancient Chinese Pagoda design.'),
			('TXT_KEY_WONDER_TAIPEI_HELP',		'+1 [ICON_GOLD] Gold from all Engineer Specialists in your Empire. +2 [ICON_GOLD] Gold from Villages and Towns worked by this City. All Banks and Stock Exchanges in your Empire receive +2 [ICON_GOLD] Gold. Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DOPLOMAT] World Congress Delegate.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Taipei 101[ENDCOLOR] is a huge challenge for engineers (+1[ICON_RESEARCH]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER]). It serves as a diplomatic point (+1[ICON_DIPLOMAT] League Vote), business center (+2[ICON_GOLD]/all [COLOR_YIELD_FOOD]Banks[ENDCOLOR], [COLOR_YIELD_FOOD]Stock Exchanges[ENDCOLOR]) and commercial hub connecting local [COLOR_CITY_BROWN]Villages[ENDCOLOR] and [COLOR_CITY_BROWN]Towns[ENDCOLOR] together (+2[ICON_GOLD]/[ICON_WORKER]).'
WHERE Tag = 'TXT_KEY_WONDER_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_TAIPEI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_TAIPEI_HELP';
				
UPDATE Language_en_US SET Text = 'Improvement: [COLOR_CYAN]Village[ENDCOLOR]; Player: [COLOR_CYAN]3 [ICON_CITY_STATE] Allies[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Curiosity Rover
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_CURIOSITY',			'Curiosity Rover'),
			('TXT_KEY_WONDER_CURIOSITY_QUOTE',		'[NEWLINE]"Projects we have completed demonstrate what we know - future projects decide what we will learn."[NEWLINE] - Dr. Mohsin Tiwana[NEWLINE]'),
			('TXT_KEY_WONDER_CURIOSITY_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_CURIOSITY_HELP',		'Grants 50 [ICON_INFLUENCE] on construction. +3 [ICON_GOLDEN_AGE] Golden Age Points from all Scientist and Engineer Specialists in your Empire. +10 global [ICON_GOLDEN_AGE] Golden Age Points from each Research Agreement you sign.');
			
UPDATE Language_en_US
SET Text = 'Sending [COLOR_YIELD_FOOD]Curiosity Rover[ENDCOLOR] is an impuls for other nations, that you have the power and will to rule the Solar System (50[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). This is only the start for you glorious march from one golden age to another (+10[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]/Research Agreement; +3[ICON_GOLDEN_AGE]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER],[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]).'
WHERE Tag = 'TXT_KEY_WONDER_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CURIOSITY_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CURIOSITY_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR]; Improved Resource: [COLOR_CYAN]Aluminum[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Global Positioning System
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_GPS',			'Global Positioning System'),
			('TXT_KEY_WONDER_GPS_QUOTE',		'[NEWLINE]"Unknown airport with Cessna 150 circling overhead, identify yourself."[NEWLINE] - George W. Stewart[NEWLINE]'),
			('TXT_KEY_WONDER_GPS_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_GPS_HELP',			'Receive 2 or more [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_SPY] Spies (based on number of [ICON_CITY_STATE] City-States in game). Improves Empire Security Level by 20%. Gain 25 [ICON_GREAT_GENERAL] Great General Points and 25 [ICON_GREAT_ADMIRAL] Great Admiral Points for successful offensive Espionage action or 50 [ICON_PRODUCTION] Production and 50 [ICON_GOLD] Gold for successful defensive Espionage action.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Global Positioning System[ENDCOLOR] helps you maintain security in your country (+200[ICON_VP_SPY_POINTS]; +20[ICON_SPY][ICON_SPY] City Security). Both, your attacks (25[ICON_GREAT_GENERAL], 25[ICON_GREAT_ADMIRAL]/[ICON_SPY] Attack) and defense (50[ICON_PRODUCTION], 50[ICON_GOLD]/[ICON_SPY] Defense) are generously rewarded.'
WHERE Tag = 'TXT_KEY_WONDER_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GPS_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GPS_HELP';
				
UPDATE Language_en_US SET Text = 'Building: [COLOR_CYAN]Strategic Defense System[ENDCOLOR]; Improved Resource: [COLOR_CYAN]Uranium[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Uranium[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- CN Tower
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]CN Tower[ENDCOLOR] is unusual [COLOR_YIELD_FOOD]Broadcast Tower[ENDCOLOR] ([ICON_GREAT_WORK]; [ICON_CULTURE]; [ICON_TOURISM]; [ICON_HAPPINESS_3]), which serves for masses (+1[ICON_HAPPINESS_1]/City). All works become much more valuable (+2[ICON_GOLD], +2[ICON_TOURISM], +25%[ICON_TOURISM], +25%[ICON_TOURISM][ICON_TOURISM]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) and all wonders are now tourism centers (+25%[ICON_CULTURE] of all [ICON_WONDER] [COLOR_YIELD_FOOD]World Wonders[ENDCOLOR], [COLOR_CITY_GREEN]Natural Wonders[ENDCOLOR] and [COLOR_CITY_BLUE]Tiles[ENDCOLOR] is converted into [ICON_TOURISM][ICON_TOURISM] and another 25% into [ICON_TOURISM]).'
WHERE Tag = 'TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_CN_TOWER_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CN_TOWER_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR]; Player: [COLOR_CYAN]Happiness > 80%[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sydney Opera House
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Sydney Opera House[ENDCOLOR], amazing and original architectural wonder, brings to its halls many nobles, sharing with you with their culture and experience ([COLOR_MAGENTA]free Policy[ENDCOLOR]; +25%[ICON_CULTURE]). Here you can hear wonderful and inspiring music compositions from all over the world (2[ICON_GREAT_WORK], if themed: [ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Can only be constructed in a coastal City. ', '') WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Great Works: [COLOR_CYAN]4 [ICON_GREAT_WORK] GW of Music[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Great Firewall
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Great Firewall[ENDCOLOR] makes hacking to your city systems much harder (+50[ICON_SPY] City Security). You will be able to resist influence of other civilizations (foreign [ICON_TOURISM] bonus from technologies is negated) and your [COLOR_YIELD_FOOD]Research Labs[ENDCOLOR] (+10[ICON_RESEARCH]) become much more effective.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP';
				
UPDATE Language_en_US SET Text = 'Building: [COLOR_CYAN]Police Station, Wire Service[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hubble Space Telescope
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Hubble Space Telescope[ENDCOLOR] is last step to your scientific victory (+25%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Spaceship Part[ENDCOLOR]), supported by brand new [COLOR_YIELD_FOOD]Spaceship Factory[ENDCOLOR] ([ICON_PRODUCTION]; [ICON_RESEARCH]). This huge leap towards space can be an inspiration for further developement (1 [COLOR_YIELD_GOLD]free [ICON_GREAT_SCIENTIST][ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_HUBBLE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HUBBLE_HELP';
				
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Aluminum[ENDCOLOR]; Player: [COLOR_CYAN]Research Agreement[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Aluminum[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- CERN
UPDATE Language_en_US
SET Text = 'Hidden [COLOR_YIELD_FOOD]CERN[ENDCOLOR] facility gathers all scientists to create huge technological breakthrough (2 [COLOR_CYAN]free Technologies[ENDCOLOR] and amaze those, who can only watch how you drift away (+100[ICON_INFLUENCE]/[ICON_CITY_STATE]).'
WHERE Tag = 'TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_CERN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_CERN_HELP';
				
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Uranium[ENDCOLOR]; Building: [COLOR_CYAN]Research Lab[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Uranium[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Crystal Palace
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Crystal Palace[ENDCOLOR] is a result of huge industrial potential. It boosts all [COLOR_YIELD_FOOD]Factories[ENDCOLOR] (+2[ICON_PRODUCTION]; +2[ICON_RESEARCH]) and starts new age in your civilization (Start [ICON_GOLDEN_AGE]).'
WHERE Tag = 'TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR:45:150:50:255]Victory in "World''s Fair" project[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP';
----------------------------------------------------
-- UN
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]United Nations[ENDCOLOR] can be the most influential comission of all in the world (Start [ICON_GOLDEN_AGE]; Start [COLOR:45:150:50:255]World Congress Session[ENDCOLOR]), where your best delegates (+1[ICON_DIPLOMAT]) will show what is most important for your citizens and those small countries, whose voice is not represented here (25[ICON_INFLUENCE]/[ICON_CITY_STATE]/[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_UN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_UN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_UN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_UN_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR:45:150:50:255]Victory in "United Nations" project[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_UN_HELP';
----------------------------------------------------
-- Grand Canal
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Grand Canal[ENDCOLOR] shows your devotion to all those people, who risk their lives on sea frontline ([COLOR_WATER_TEXT]Treasure Fleet[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Naval (no Carriers, Submarines)[ENDCOLOR]). It also allows you to establish another trade route (+1[INTERNATIONAL_TRADE]), but it is your choice if it will be land or sea connection.'
WHERE Tag = 'TXT_KEY_BUILDING_GRAND_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_GRAND_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_GRAND_CANAL_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_GRAND_CANAL_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR:45:150:50:255]Victory in "Treasure Fleet" project[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_GRAND_CANAL_HELP';
----------------------------------------------------
-- International Space Station
UPDATE Language_en_US
SET Text = 'Scientists and engineers work together on [COLOR_YIELD_FOOD]International Space Station[ENDCOLOR] to break barriers (+1[ICON_RESEARCH]/All Engineers; (+1[ICON_PRODUCTION]/All Scientists). Their efforts gives you technological boost (+33%[ICON_RESEARCH]/[ICON_GREAT_SCIENTIST]), and are innovative solution for problems of your industry (200[ICON_PRODUCTION]/[COLOR_CYAN]Technology[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR:45:150:50:255]Victory in "International Space Station" project[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP';
----------------------------------------------------
-- Olympic Village
UPDATE Language_en_US
SET Text = 'Olympic Games are great source of joy in these difficult times (+3[ICON_HAPPINESS_1]). [COLOR_YIELD_FOOD]Olympic Village[ENDCOLOR] is here to gather people together, watching games and forgetting about surrounding pain (+25%[ICON_CULTURE] of all [ICON_WONDER] [COLOR_YIELD_FOOD]World Wonders[ENDCOLOR], [COLOR_CITY_GREEN]Natural Wonders[ENDCOLOR] and [COLOR_CITY_BROWN]Improvements[ENDCOLOR] into [ICON_TOURISM]). All constructed [COLOR_YIELD_FOOD]Stadiums[ENDCOLOR] (+2[ICON_GOLD]; +2[ICON_TOURISM]) become center of upcoming world events.'
WHERE Tag = 'TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR:45:150:50:255]Victory in "International Games" project[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP';
----------------------------------------------------
-- Menin Gate
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Menin Gate[ENDCOLOR] will be admonishment for future generations (+2[ICON_CULTURE], +2[ICON_GOLDEN_AGE]/Death). This monument, but also each site releated to recent battles represents the huge pain (+1[ICON_GREAT_WRITER], +1[ICON_GOLDEN_AGE]/All [COLOR_CITY_BROWN]Forts[ENDCOLOR], [COLOR_CITY_BROWN]Citadels[ENDCOLOR] and [COLOR_CITY_BROWN]Landmarks[ENDCOLOR]). Maybe there''s a chance to keep current prosperity (+2[ICON_HAPPINESS_1]).'
WHERE Tag = 'TXT_KEY_BUILDING_MENIN_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_MENIN_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_MENIN_GATE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_MENIN_GATE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR:45:150:50:255]Victory in "Global Wargames" project[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_MENIN_GATE_HELP';
----------------------------------------------------
-- AMERICA'S UNIQUE WORLD WONDERS (VP v3.8)
----------------------------------------------------
-- Smithsonian Institute
INSERT INTO Language_en_US 
			(Tag,											Text)
VALUES		('TXT_KEY_WONDER_AMERICA_SMITHSONIAN_QUOTE',	'[NEWLINE]"I read a book every night. I really am that nerd, so when I get to go to the Smithsonian and get to go in the back rooms and play with stuff, things like that, for a guy like me, that''s amazing."[NEWLINE] - Rick Harrison[NEWLINE]');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Smithsonian Institute[ENDCOLOR] is an unusual [COLOR_YIELD_FOOD]Museum[ENDCOLOR] ([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_TOURISM]) you should be proud of (+1[ICON_RESEARCH]/[ICON_GREAT_WORK][ICON_GREAT_WORK] and all Landmarks). Science is the key, but culture is the only thing that keeps a nation in one piece (+5[ICON_CULTURE], +5[ICON_RESEARCH]/all [COLOR_YIELD_FOOD]Museums[ENDCOLOR], [COLOR_YIELD_FOOD]Research Labs[ENDCOLOR]; +2[ICON_CULTURE], +2[ICON_RESEARCH]/all [ICON_WONDER] [COLOR_YIELD_FOOD]World Wonders[ENDCOLOR]), so you should invest in it at all cost (10%[ICON_GOLD][ICON_GOLD] into [ICON_CULTURE][ICON_CULTURE]; -25%[ICON_GOLD][ICON_GOLD] Tile Purchase Cost).'
WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_HELP';
				
UPDATE Language_en_US SET Text = 'Civlization: [COLOR_CYAN]America[ENDCOLOR]; Building: [COLOR_CYAN]Independence Hall[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Civlization: [COLOR_CYAN]America[ENDCOLOR]; Building: [COLOR_CYAN]Independence Hall[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- West Point
INSERT INTO Language_en_US 
			(Tag,											Text)
VALUES		('TXT_KEY_WONDER_AMERICA_WESTPOINT_QUOTE',		'[NEWLINE]"Give me an Army of West Point graduates and I''ll win a battle... Give me a handful of Texas Aggies and I''ll win a war."[NEWLINE] - George S. Patton[NEWLINE]');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]West Point[ENDCOLOR], as a high tier [COLOR_YIELD_FOOD]Military Academy[ENDCOLOR] ([ICON_PRODUCTION], [ICON_HAPPINESS_3], [ICON_SILVER_FIST]) improves all similar facilities (+5[ICON_PRODUCTION], +5[ICON_RESEARCH]/all [COLOR_YIELD_FOOD]Military Academies[ENDCOLOR], [COLOR_YIELD_FOOD]Arsenals[ENDCOLOR]) and your troops ([COLOR_WATER_TEXT]Splash[ENDCOLOR]/[COLOR_YIELD_GOLD]Siege[ENDCOLOR], [COLOR_YIELD_GOLD]Naval Ranged[ENDCOLOR]). New training techniques help with keeping your borders (-25%[ICON_GOLD][ICON_GOLD] Tile Purchase Cost) and maintaining crucial infrastructure in good shape (+2[ICON_PRODUCTION], +2[ICON_RESEARCH]/all [ICON_WONDER] [COLOR_YIELD_FOOD]World Wonders[ENDCOLOR]; 10%[ICON_GOLD][ICON_GOLD] into [ICON_RESEARCH][ICON_RESEARCH]).'
WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_WESTPOINT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_AMERICA_WESTPOINT_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_WESTPOINT_HELP';
				
UPDATE Language_en_US SET Text = 'Civlization: [COLOR_CYAN]America[ENDCOLOR]; Building: [COLOR_CYAN]Independence Hall[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AMERICA_WESTPOINT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Civlization: [COLOR_CYAN]America[ENDCOLOR]; Building: [COLOR_CYAN]Independence Hall[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AMERICA_WESTPOINT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Slater Mill
INSERT INTO Language_en_US 
			(Tag,											Text)
VALUES		('TXT_KEY_WONDER_AMERICA_SLATERMILL_QUOTE',		'[NEWLINE]"If I do not make a good yarn, as they do in England, I will have nothing for my services but will throw the whole of what I have attempted over the bridge."[NEWLINE] - Samuel Slater[NEWLINE]');
			
UPDATE Language_en_US
SET Text = 'To be a leader, you need the [COLOR_YIELD_FOOD]Slater Mill[ENDCOLOR]. This modern [COLOR_YIELD_FOOD]Factory[ENDCOLOR] ([ICON_PRODUCTION]; [ICON_GREAT_PEOPLE]; [ICON_HAPPINESS_3]; [ICON_INTERNATIONAL_TRADE]) introduces new quality to your industry (+5[ICON_PRODUCTION], +5[ICON_GOLD]/all [COLOR_YIELD_FOOD]Factories[ENDCOLOR], [COLOR_YIELD_FOOD]Stock Exchanges[ENDCOLOR]) and makes your expansion faster (-25%[ICON_GOLD][ICON_GOLD] Tile Purchase Cost; +1[ICON_INTERNATIONAL_TRADE]). Your investments should quickly grant you additional profits (+2[ICON_PRODUCTION], +2[ICON_GOLD]/all [ICON_WONDER] [COLOR_YIELD_FOOD]World Wonders[ENDCOLOR]; 10%[ICON_GOLD][ICON_GOLD] into [ICON_PRODUCTION][ICON_PRODUCTION]).'
WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_SLATERMILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_AMERICA_SLATERMILL_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_SLATERMILL_HELP';
				
UPDATE Language_en_US SET Text = 'Civlization: [COLOR_CYAN]America[ENDCOLOR]; Building: [COLOR_CYAN]Independence Hall[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AMERICA_SLATERMILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Civlization: [COLOR_CYAN]America[ENDCOLOR]; Building: [COLOR_CYAN]Independence Hall[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AMERICA_SLATERMILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--============================================--
-- EE Compatibility
--============================================--
-- Main Compatibility Code
	-- updating texts for new promotions
	----------------------------------------------------
	-- SMITHSONIAN INSTITUTE???
	UPDATE Language_en_US
	SET Text = '[COLOR_YIELD_FOOD]Smithsonian Institute[ENDCOLOR] is well-known [COLOR_YIELD_FOOD]Museum[ENDCOLOR] ([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_TOURISM) and contains some nice artwork (2[ICON_GREAT_WORK], if themed: [ICON_RESEARCH], [ICON_GOLD]). All other similar places profit of its influence (+1[ICON_CULTURE]/all [COLOR_YIELD_FOOD]Museums, Galleries[ENDCOLOR]). Thanks to that people are much happier (-10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Illiteracy).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_en_US 
				(Tag,										Text) 
	SELECT		'TXT_KEY_WONDER_EE_SMITHSONIAN_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_SMITHSONIAN_HELP';
				
	UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR]; Improvement: [COLOR_CYAN]Academy[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	----------------------------------------------------
	-- KRONBORG
	UPDATE Language_en_US
	SET Text = 'Your coastline is your defense. [COLOR_YIELD_FOOD]Kronborg[ENDCOLOR] is one way to make it stronger (+3[ICON_STRENGTH], +50 HP, +1[ICON_SILVER_FIST]/all coastal Cities). Your bigger navy (+50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Military Naval[ENDCOLOR]) will be led by powerful leader ([COLOR_YIELD_GOLD]free [ICON_GREAT_ADMIRAL][ENDCOLOR]) and your treasure will be controlled by smart merchants (+1[ICON_GREAT_MERCHANT]).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_KRONBORG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_en_US 
				(Tag,								Text) 
	SELECT		'TXT_KEY_WONDER_EE_KRONBORG_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_KRONBORG_HELP';
				
	UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Building: [COLOR_CYAN]Harbor[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_KRONBORG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=2 OR Value=1));
	----------------------------------------------------
	-- VERSAILLES
	UPDATE Language_en_US
	SET Text = '[COLOR_YIELD_FOOD]Versailles[ENDCOLOR] can be a nice place to spend some time and meet few famous nobles ([COLOR_YIELD_GOLD]free [ICON_GREAT_WRITER][ENDCOLOR]). Your people are aware of your power and hole empire organize long festivals to your name (+50%[ICON_HAPPINESS_1][ICON_HAPPINESS_1] WLTKD length).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_VERSAILLES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_en_US 
				(Tag,								Text) 
	SELECT		'TXT_KEY_WONDER_EE_VERSAILLES_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_VERSAILLES_HELP';
				
	UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_VERSAILLES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_VERSAILLES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	----------------------------------------------------
	-- TOPKAPI PALACE
	UPDATE Language_en_US
	SET Text = '[COLOR_YIELD_FOOD]Topkapi Palace[ENDCOLOR] strenghten your faith by praying the defense doctrine (+1[ICON_PEACE]/all [COLOR_YIELD_FOOD]defensive buildings[ENDCOLOR]). Additionally, when you build some planes, you will bring some tourists to new attractions ([COLOR_CYAN]Flight[ENDCOLOR]: +3[ICON_GOLD], +2[ICON_TOURISM]).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_TOPKAPI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_en_US 
				(Tag,									Text) 
	SELECT		'TXT_KEY_WONDER_EE_TOPKAPI_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_TOPKAPI_HELP';
				
	UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Building: [COLOR_CYAN]Manor[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_TOPKAPI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=2 OR Value=1));
	----------------------------------------------------
	-- TORRE DEL ORO
	UPDATE Language_en_US
	SET Text = '[COLOR_YIELD_FOOD]Torre del Oro[ENDCOLOR] concentrates on naval trade routes. It makes them easier and more profitable (+1[ICON_INTERNATIONAL_TRADE]; +1[ICON_GREAT_MERCHANT]; Sea [ICON_INTERNATIONAL_TRADE]: +3[ICON_GOLD], +50%[ICON_SWAP]). Bright new [COLOR_YIELD_FOOD]Drydock[ENDCOLOR] ([ICON_STRENGTH]; [ICON_SILVER_FIST]) will be a nice beginning to your naval supremacy.'
	WHERE Tag = 'TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	UPDATE Language_en_US SET Text = REPLACE(Text, '[NEWLINE][NEWLINE]City must be build on the [COLOR_CYAN]Coast[ENDCOLOR].', '') WHERE Tag ='TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

	INSERT INTO Language_en_US 
				(Tag,								Text) 
	SELECT		'TXT_KEY_WONDER_EE_TORRE_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_TORRE_HELP';
				
	UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR], [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	----------------------------------------------------
	-- WAT PHRA KAEW
	UPDATE Language_en_US
	SET Text = '[COLOR_YIELD_FOOD]Wat Phra Kaew[ENDCOLOR] connects body and mind (+1[ICON_RESEARCH]/all [COLOR_YIELD_FOOD]Shrines[ENDCOLOR]; +2[ICON_RESEARCH]/all [COLOR_YIELD_FOOD]Temples[ENDCOLOR]). What''s more, you gain serious boost to your discoveries (+5[ICON_RESEARCH]; +1[ICON_GREAT_SCIENTIST]).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_en_US 
				(Tag,										Text) 
	SELECT		'TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP';
				
	UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR]; Improvement: [COLOR_CYAN]Holy Site[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	----------------------------------------------------
	-- FASIL GHEBBI
	UPDATE Language_en_US
	SET Text = '[COLOR_YIELD_FOOD]Fasil Ghebbi[ENDCOLOR] answers for deep need of defense of your vulnerable territory (+5[ICON_STRENGTH]; +100 HP). Your troops will get unique buffs when around this wonder ([COLOR_WATER_TEXT]Fasil Ghebbi[ENDCOLOR]/[COLOR_YIELD_GOLD]Military in city range[ENDCOLOR]) and you can have them even more (+5[ICON_SILVER_FIST]). Your engineers may work on this project, too (+1[ICON_GREAT_ENGINEER]).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_en_US 
				(Tag,										Text) 
	SELECT		'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP';
				
	UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	
