-- wall street

INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_PROSPERITY_WALL_STREET', 'BUILDINGCLASS_STOCK_EXCHANGE');

INSERT INTO Building_YieldModifiers
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PROSPERITY_WALL_STREET', 'YIELD_GOLD', 5),
	('BUILDING_PROSPERITY_WALL_STREET', 'YIELD_PRODUCTION', 5);

-- lds

UPDATE Buildings SET 
MutuallyExclusiveGroup = 665
WHERE Type = 'BUILDING_PROSPERITY_LDS';

UPDATE Buildings SET
MutuallyExclusiveGroup = 665
WHERE BuildingClass = 'BUILDINGCLASS_PALACE';
-- that's not a great way to do that but i don't see another...


INSERT INTO Building_YieldFromFaithPurchase
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PROSPERITY_LDS', 'YIELD_FOOD', 25);

INSERT INTO Building_YieldFromPurchase
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PROSPERITY_LDS', 'YIELD_FOOD', 25);

INSERT INTO Building_YieldFromBirth
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PROSPERITY_LDS', 'YIELD_FAITH', 25);

INSERT INTO Building_LakePlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PROSPERITY_LDS', 'YIELD_FOOD', 2),
	('BUILDING_PROSPERITY_LDS', 'YIELD_CULTURE', 2),
	('BUILDING_PROSPERITY_LDS', 'YIELD_CULTURE_LOCAL', 2);

INSERT INTO Building_YieldPerXTerrainTimes100
	(BuildingType, TerrainType, YieldType, Yield)
VALUES 
	('BUILDING_PROSPERITY_LDS', 'TERRAIN_MOUNTAIN',	'YIELD_CULTURE_LOCAL', 200),
	('BUILDING_PROSPERITY_LDS', 'TERRAIN_MOUNTAIN',	'YIELD_GOLD', 200),
	('BUILDING_PROSPERITY_LDS', 'TERRAIN_MOUNTAIN',	'YIELD_CULTURE', 200);	

-- epcot

INSERT INTO Building_YieldFromTech
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EPCOT', 'YIELD_CULTURE', 75);

INSERT INTO Building_GreatWorkYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EPCOT', 'YIELD_SCIENCE', 1);

-- cadet

INSERT INTO Building_DomainFreeExperiencesGlobal
	(BuildingType, DomainType, Experience)
VALUES
	('BUILDING_CADET', 'DOMAIN_AIR', 30);

INSERT INTO Building_YieldFromCombatExperienceTimes100
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CADET', 'YIELD_FAITH', 500);

INSERT INTO Building_YieldChangesPerReligion
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CADET', 'YIELD_PRODUCTION', 300);

-- rio

INSERT INTO Building_GreatPersonProgressFromConstruction
		(BuildingType, 	GreatPersonType, EraType, Value)
VALUES 	('BUILDING_RIO_CATHEDRAL', 'GREATPERSON_ARTIST', 'ERA_MODERN', 	25);

-- megachurches baby

INSERT INTO Building_YieldFromFaithPurchase
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_GOLD', 15
FROM Buildings WHERE MutuallyExclusiveGroup = 666;

INSERT INTO Building_YieldFromSpyRigElection
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_DREAM_CITY', 'YIELD_CULTURE', 50),
	('BUILDING_DREAM_CITY', 'YIELD_FAITH', 50);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_GRAHA_NGINDEN', 'BUILDINGCLASS_WIRE_SERVICE', 'YIELD_FOOD', 5),
	('BUILDING_GRAHA_NGINDEN', 'BUILDINGCLASS_WIRE_SERVICE', 'YIELD_FAITH', 5),
	('BUILDING_CRYSTAL_CATHEDRAL', 'BUILDINGCLASS_BROADCAST_TOWER', 'YIELD_GOLD', 5),
	('BUILDING_CRYSTAL_CATHEDRAL', 'BUILDINGCLASS_BROADCAST_TOWER', 'YIELD_FAITH', 5);

-- yields
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PROSPERITY_WALL_STREET', 'YIELD_CULTURE', 4),
	('BUILDING_PROSPERITY_LDS', 'YIELD_FAITH', 6),
	('BUILDING_EPCOT', 'YIELD_CULTURE', 1),
	('BUILDING_CADET', 'YIELD_CULTURE', 1),
	('BUILDING_CADET', 'YIELD_FAITH', 3),
	('BUILDING_RIO_CATHEDRAL', 'YIELD_CULTURE', 1),
	('BUILDING_RIO_CATHEDRAL', 'YIELD_FAITH', 4),
	('BUILDING_CRYSTAL_CATHEDRAL', 'YIELD_FAITH', 5),
	('BUILDING_CRYSTAL_CATHEDRAL', 'YIELD_CULTURE', 1),
	('BUILDING_DREAM_CITY', 'YIELD_FAITH', 5),
	('BUILDING_DREAM_CITY', 'YIELD_CULTURE', 1),
	('BUILDING_YOIDO_GOSPEL', 'YIELD_FAITH', 5),
	('BUILDING_YOIDO_GOSPEL', 'YIELD_CULTURE', 1),
	('BUILDING_GRAHA_NGINDEN', 'YIELD_FAITH', 5),
	('BUILDING_GRAHA_NGINDEN', 'YIELD_CULTURE', 1);

-- --------------------------------
-- ----------text------------------
-- --------------------------------
INSERT INTO Language_en_US
	(Tag, Text)
VALUES
        -- national wonders
	('TXT_KEY_BUILDING_PROSPERITY_WALL_STREET', 'Financial District'),
	('TXT_KEY_BUILDING_PROSPERITY_WALL_STREET_HELP', 'Requires [COLOR_MAGENTA]Prosperity[ENDCOLOR]. +5% [ICON_GOLD] Gold and +5% [ICON_PEACE] Faith in the City in which it is built. Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DIPLOMAT] Delegate in the World Congress for every 2000 [ICON_GOLD] Gold per turn produced (caps at 25% of all [ICON_CITY_STATE] City-States ever alive). [NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own.'),
	('TXT_KEY_BUILDING_PROSPERITY_WALL_STREET_STRATEGY', 'Prosperity is nothing without a healthy income. Keep it up and you will be rewarded with free votes at the World Congress. Well... "free".'),
	('TXT_KEY_BUILDING_PROSPERITY_WALL_STREET_TEXT', 'A Financial District is home to a large number of internationally significant banks, businesses, and stock exchanges. An International Financial Center, sometimes abbreviated to IFC, is a non-specific term usually used to describe an important participant in international financial market trading, usually having at least one major stock market. During much of the 20th century, the United States and its financial capital, New York City, were the leaders. But since the 1990s, with the rise of a multipolar world with new regional powers and global capitalism, numerous financial centres have challenged the predominance of Wall Street, particularly from Asia, which some analysts believe will be the focus of new worldwide growth.'),

	('TXT_KEY_BUILDING_PROSPERITY_LDS', 'House of the Lord'),
	('TXT_KEY_BUILDING_PROSPERITY_LDS_HELP', 'Requires the [COLOR_MAGENTA]Exaltation[ENDCOLOR] Policy. 25% of the cost of [ICON_PEACE] Faith and [ICON_INVEST] Gold Purchases are converted into [ICON_FOOD] Food. Receive 25 [ICON_PEACE] Faith when a [ICON_CITIZEN] Citizen is born in this City, scaling with Era. Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 25%.[NEWLINE][NEWLINE]+2 [ICON_FOOD] Food, [ICON_CULTURE] Culture, and [ICON_CULTURE_LOCAL] Border Growth Points from Lake tiles worked by this City.[NEWLINE]+2 [ICON_GOLD] Gold, [ICON_CULTURE] Culture, and [ICON_CULTURE_LOCAL] Border Growth Points for every Mountain tile within the workable territory of this City.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own. Cannot be built in the [ICON_CAPITAL] Capital.'),
	('TXT_KEY_BUILDING_PROSPERITY_LDS_STRATEGY', 'This National Wonder gives large boosts to growth in the City, especially if Lakes or Mountains are nearby. However it cannot be built in the Capital so you have to commit to growing one of your smaller Cities. Be careful of the Unhappiness this might lead to! You will have to keep investing heavily in infrastructure to keep your new Citizens happy, but this will grow the City even more!'),
	('TXT_KEY_BUILDING_PROSPERITY_LDS_TEXT', 'The Salt Lake Temple is a temple of the Church of Jesus Christ of Latter-day Saints on Temple Square in Salt Lake City, Utah, United States. At 253,015 square feet (23,505.9 m2), it is the largest Latter-day Saint temple by floor area. Dedicated in 1893, it is the sixth temple completed by the church, requiring 40 years to complete, and the fourth temple built since the Mormon exodus from Nauvoo, Illinois, in 1846. Like other Latter-day Saint temples, the church and its members consider it sacred and a temple recommend is required to enter, so there are no public tours inside the temple as there are for other adjacent buildings on Temple Square.'),

	-- world wonders
	('TXT_KEY_WONDER_EPCOT', 'Epcot'),
	('TXT_KEY_WONDER_EPCOT_HELP', 'Requires [COLOR_MAGENTA]Prosperity[ENDCOLOR]. Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Social Policy. Receive 75 [ICON_CULTURE] Culture when you discover a Technology, scaling with Era. +1 [ICON_RESEARCH] Science from [ICON_GREAT_WORK] Great Works in all Cities.'),
	('TXT_KEY_WONDER_EPCOT_QUOTE', '[NEWLINE]"The best way to get started? Quit talking and start doing!"[NEWLINE] - Walt Disney[NEWLINE]'),
	('TXT_KEY_WONDER_EPCOT_TEXT', 'The Experimental Prototype Community of Tomorrow, shortened to EPCOT, was an unfinished concept for a planned community, intended to sit on a swath of undeveloped land near Orlando, Florida. It was created by Walt Disney in collaboration with the designers at Walt Disney Imagineering in the 1960s. Based on ideas stemming from modernism and futurism, and inspired by architectural literature about city planning, Disney intended EPCOT to be a utopian autocratic company town.[NEWLINE][NEWLINE]After Disney''s death in 1966, the company felt his grand vision was impractical. However, it laid the groundwork for EPCOT Center, a theme park that retained the core spirit of Disney''s vision. The park was divided into two distinct areas: Future World reprises the idea of showcasing modern innovation through educational entertainment attractions within avant-garde pavilions, while World Showcase highlights the diversity of human cultures from various nations. The enormous geodesic sphere houses a 15-minute ride that takes guests on a time machine-themed experience, demonstrating how advancements in human communication have helped to create the future one step at a time.'),

	('TXT_KEY_WONDER_RIO_CATHEDRAL', 'Cathedral of St. Sebastian'),
	('TXT_KEY_WONDER_RIO_CATHEDRAL_HELP', 'Requires [COLOR_MAGENTA]Prosperity[ENDCOLOR]. Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Social Policy. When you complete a building from the Modern Era or later, gain 25% progress towards a [ICON_GREAT_ARTIST] Great Artist. Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Cathedral in the City. Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 33%.[NEWLINE][NEWLINE]Requires a Teocalli anywhere in the Empire.'),
	('TXT_KEY_WONDER_RIO_CATHEDRAL_QUOTE', '[NEWLINE]"Every time I drive into Rio from the airport, I see the city for the first time and think how strange it is."[NEWLINE] - Chico Buarque[NEWLINE]'),
	('TXT_KEY_WONDER_RIO_CATHEDRAL_TEXT', 'The Metropolitan Cathedral of Saint Sebastian is home to the cathedra of the Archbishops of the city of Rio de Janeiro, Brazil. The church is dedicated to Saint Sebastian, the patron saint of Rio de Janeiro. The cathedral was designed by Edgar de Oliveira da Fonseca in a modern style based on Mayan architectural style of pyramids. The current cathedral was built between 1964 and 1979 and replaced as seat of the Archdiocese. The New Cathedral, as it is sometimes called, is located in the center of the city. Conical in form and with a 96 metres (315 ft) internal diameter - 106 metres of external diameter - and an overall height of 75 metres (246 ft). Inside, the area measures 8,000 square meters and sufficient 5,000 seats (it has a standing-room capacity of 20,000 people). The cathedral''s four rectilinear stained glass windows soar 64 metres (210 ft) from floor to ceiling.'),

	('TXT_KEY_WONDER_CADET', 'Cadet Chapel'),
	('TXT_KEY_WONDER_CADET_HELP', 'Requires [COLOR_MAGENTA]Prosperity[ENDCOLOR]. Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Social Policy. +30 XP for all Air Units constructed in the Empire. +3 [ICON_WAR] Military Supply. Gain +3 [ICON_PRODUCTION] Production for every World Religion that has [COLOR_POSITIVE_TEXT]at least one[ENDCOLOR] follower in this City.[NEWLINE][NEWLINE]When Units created by this City gain Experience through combat, receive [ICON_PEACE] Faith equal to 5x the gained Experience.'),
	('TXT_KEY_WONDER_CADET_QUOTE', '[NEWLINE]"We better be prepared to dominate the skies above the surface of the earth or be prepared to be buried beneath it."[NEWLINE] - USAF Rotorheads[NEWLINE]'),
	('TXT_KEY_WONDER_CADET_TEXT', 'The United States Air Force Academy Cadet Chapel, completed in 1962, is the distinguishing feature of the Cadet Area at the United States Air Force Academy north of Colorado Springs. Originally controversial in its design, the Cadet Chapel has become a classic and highly regarded example of modernist architecture, and was named a U.S. National Historic Landmark in 2004.[NELWINE][NEWLINE]The most striking aspect of the chapel is its row of seventeen spires. The structure is a tubular steel frame of 100 identical tetrahedrons, each 75 feet (23 m) long, weighing five tons, and enclosed with aluminum panels. The tetrahedrons are spaced a foot apart, creating gaps in the framework that are filled with 1-inch-thick (25 mm) colored glass. The Cadet Chapel itself is 150 feet (46 m) high, 280 feet (85 m) long, and 84 feet (26 m) wide. The front façade, on the south, has a wide granite stairway with steel railings capped by aluminum handrails leading up one story to a landing. At the landing is a band of gold anodized aluminum doors, flanked by gold anodized aluminum panels, designed and detailed to match the doors.[NEWLINE][NEWLINE]Inspired by chapels at Sainte-Chapelle in France and the Basilica of San Francesco d''Assisi in Italy, architect Walter Netsch stacked the spaces on two main levels. The Protestant nave is located on the upper level, while the Catholic and Jewish chapels and a Buddhist room are located beneath it. Beneath this level is a larger room used for Islamic services and two meeting rooms. Each chapel has its own entrance, and services may be held simultaneously without interfering with one another.'),

	-- megachurches
	('TXT_KEY_WONDER_CRYSTAL_CATHEDRAL', '[COLOR_MAGENTA]Megachurch:[ENDCOLOR] Crystal Cathedral'),
	('TXT_KEY_WONDER_CRYSTAL_CATHEDRAL_HELP', 'Requires the [COLOR_MAGENTA]Charmismata[ENDCOLOR] Policy. Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Cathedral in the City. Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 100%. 15% of the cost of [ICON_PEACE] Faith Purchases are converted into [ICON_GOLD] Gold.  +5 [ICON_GOLD] Gold and [ICON_PEACE] Faith from all Broadcast Towers in the Empire.'),
	('TXT_KEY_WONDER_CRYSTAL_CATHEDRAL_QUOTE', '[NEWLINE]"We all know that a church is not a building."[NEWLINE] - Robert H. Schuller[NEWLINE]'),
	('TXT_KEY_WONDER_CRYSTAL_CATHEDRAL_TEXT', 'The Crystal Cathedral is an large glass church in Garden Grove, California. The church was touted as "the largest glass building in the world" when it was completed in 1981. The building has one of the largest musical instruments in the world, the Hazel Wright Organ. The signature rectangular panes of glass comprising the building are not bolted to the structure; they are glued to it using a silicone-based glue. This and other measures are intended to allow the building to withstand an earthquake of magnitude 8.0. The building was constructed using over 10,000 rectangular panes of glass.[NEWLINE][NEWLINE]From its opening in 1981 to 2013, the building was the principal place of worship for Crystal Cathedral Ministries (now Shepherd''s Grove), a congregation of the Reformed Church in America, founded in 1955 by Robert H. Schuller. The ministry''s weekly television program Hour of Power was formerly produced from the building. Crystal Cathedral Ministries filed for bankruptcy in October 2010 and in February 2012 sold the building and its adjacent campus to the Diocese of Orange for use as the diocese''s new cathedral. The building, especially the interior, was renovated to accommodate the Catholic liturgy.'),

	('TXT_KEY_WONDER_DREAM_CITY', '[COLOR_MAGENTA]Megachurch:[ENDCOLOR] Dream City'),
	('TXT_KEY_WONDER_DREAM_CITY_HELP', 'Requires the [COLOR_MAGENTA]Charmismata[ENDCOLOR] Policy. Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Cathedral in the City. Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 100%. 15% of the cost of [ICON_PEACE] Faith Purchases are converted into [ICON_GOLD] Gold. +50 [ICON_CULTURE] Culture and [ICON_PEACE] Faith when you successfully rig an election in a [ICON_CITY_STATE] City-State, scaling with Era.'),
	('TXT_KEY_WONDER_DREAM_CITY_QUOTE', '[NEWLINE]"If your church isn''t winning souls, I hope you go out of business."[NEWLINE] - Tommy Barnett[NEWLINE]'),
	('TXT_KEY_WONDER_DREAM_CITY_TEXT', 'Dream City Church (formerly Phoenix First Assembly of God) is a multi-site Pentecostal megachurch based in Phoenix, Arizona. The weekly attendance was around 22,500 in 2013. In 1979, Tommy Barnett became the senior pastor.[NEWLINE][NEWLINE]The construction of the current building  in 1984 was overseen by Roe Messner, who having divorced his first wife, he married televangelist Tammy Faye Bakker in 1993 after her divorce from husband and PTL Club founder Jim Bakker. The church''s association with scandles has only worsened over time. On June 26, 2020, Arizona Attorney General Mark Brnovich sent cease-and-desist letters to the church and its air-purification spinout firm (CleanAir EXP), demanding that they stop making fraudulent statements about preventing COVID-19. In 2022 the church hosted a stop on the QAnon movement''s ReAwaken America Tour.'),

	('TXT_KEY_WONDER_YOIDO_GOSPEL', '[COLOR_MAGENTA]Megachurch:[ENDCOLOR] Yoido Full Gospel'),
	('TXT_KEY_WONDER_YOIDO_GOSPEL_HELP', 'Requires the [COLOR_MAGENTA]Charmismata[ENDCOLOR] Policy. Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Cathedral in the City. Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 100%. 15% of the cost of [ICON_PEACE] Faith Purchases are converted into [ICON_GOLD] Gold. Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Church in every City in the Empire.'),
	('TXT_KEY_WONDER_YOIDO_GOSPEL_QUOTE', '[NEWLINE]"God has to deliver us from the fear of what others will think!"[NEWLINE] - David Yonggi Cho[NEWLINE]'),
	('TXT_KEY_WONDER_YOIDO_GOSPEL_TEXT', 'Yoido Full Gospel Church is a Pentecostal church in Seoul, South Korea. With about 480,000 members, it is the largest Pentecostal Christian congregation in South Korea. Founded by David Yonggi Cho and Choi Ja-shil in 1958, Pastor Cho began preaching on the Three-Fold Blessing (the blessing of the spirit, soul, and body), proclaiming that physical health and financial prosperity are as much a part of God''s will for Christians as the salvation of the soul.[NEWLINE][NEWLINE]Inspired by his message of hope and monetary wealth, many previously uncommitted people joined the church, and by the beginning of 1961, membership had grown to a thousand. By the end of the decade the church''s organization was restructured into the first "cell" system that is now widespread in charismatic churches around the world. As such, the church has several satellite locations throughout the city of Seoul.[NEWLINE][NEWLINE]The current main church building is on Yoi Island, which before construction was little more than sand dunes, without even a bridge to connect it to the city of Seoul. Believing that he had heard from God, Cho and the other leaders of the church decided to purchase a plot of land on Yoi Island, directly across from Korea''s National Assembly. Economic problems, including the 1973 "oil shock," which led to spiraling inflation and the loss of jobs for many church members, delayed construction of the new auditorium. However, it was finally finished in 1973, and its inaugural worship service in the auditorium of 12,000 seats was held on 19 August of that year.[NEWLINE][NEWLINE]The church was renamed Yoido Full Gospel Church in the 1990s. Its founder, Mr David Yonggi Cho, retired as head pastor several times, but the church ran into immediate infighting among the remaining ministers, causing him to come out of retirement, most recently late in 2006. In November 2013, the Church Reform Prayer Meeting exposed allegations of an affair involving David Yonggi Cho, revealing that Cho had allegedly given 1.5 billion won to Jeong Gwi-sun, author of the novel Butterfly Lady of Paris, as hush money. On 20 February 2014 Pastor Cho and his son (Hee-jun) were convicted of embezzling US$12 million in church funds.'),

	('TXT_KEY_WONDER_GRAHA_NGINDEN', '[COLOR_MAGENTA]Megachurch:[ENDCOLOR] Graha Nginden'),
	('TXT_KEY_WONDER_GRAHA_NGINDEN_HELP', 'Requires the [COLOR_MAGENTA]Charmismata[ENDCOLOR] Policy. Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Cathedral in the City. Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 100%. 15% of the cost of [ICON_PEACE] Faith Purchases are converted into [ICON_GOLD] Gold. +5 [ICON_FOOD] Food and [ICON_PEACE] Faith from all Wire Services in the Empire.'),
	('TXT_KEY_WONDER_GRAHA_NGINDEN_QUOTE', '[NEWLINE]"God provides all our needs, even the licenses."[NEWLINE] - Abraham Alex Tanuseputra[NEWLINE]'),
	('TXT_KEY_WONDER_GRAHA_NGINDEN_TEXT', 'Nginden Bethany Church is an evangelical megachurch in Surabaya, Indonesia. The senior pastor of this community is Pdt. David Aswin Tanuseputra since 2012, replacing his father Pdt. Abraham Alex Tanuseputra who founded the church after a child he hit with his car was "resurrected". In 2020, the attendance is 140,000 people. Graha Bethany Nginden founded Bethany Care, a health center open to everyone that assists the needy and works frequently with the Red Cross.[NEWLINE][NEWLINE]American missionaries brought Pentecostal doctrines to Indonesia in 1921. The Union of Pentecostal Churches was founded in 1924, later renamed to Pentecostal Church of Indonesia. In 1946, a group split from Pentecostal Church of Indonesia, founding Bethel Full Gospel Church. In 1998, the church numbered 725,000 believers in 1320 churches. By 2010, the number of believers increased to 2.5 million. Half of the members are Chinese people living in Indonesia.');



