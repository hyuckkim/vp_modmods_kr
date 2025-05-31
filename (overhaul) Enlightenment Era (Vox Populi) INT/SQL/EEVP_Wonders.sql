----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- WONDERS
-- 2018-01-31 Reworked by Infixo from EE & VP-EE mods
----------------------------------------------------

----------------------------------------------------
-- Generic info
----------------------------------------------------

INSERT INTO Buildings (Type, PrereqTech, MaxStartEra, SpecialistType, GreatPeopleRateChange, PortraitIndex) VALUES
('BUILDING_EE_FASIL_GHEBBI', 'TECH_EE_FORTIFICATION','ERA_INDUSTRIAL',   'SPECIALIST_ENGINEER', 1, 6),
('BUILDING_EE_KRONBORG',     'TECH_EE_WARSHIPS',     'ERA_INDUSTRIAL',   'SPECIALIST_MERCHANT', 1, 2),
('BUILDING_EE_SMITHSONIAN',  'TECH_EE_ROMANTICISM',  'ERA_MODERN',       'SPECIALIST_SCIENTIST',1, 4),
('BUILDING_EE_TOPKAPI',      'TECH_EE_SOVEREIGNTY',  'ERA_ENLIGHTENMENT', NULL,                 0, 0),
('BUILDING_EE_TORRE',        'TECH_NAVIGATION',      'ERA_INDUSTRIAL',   'SPECIALIST_MERCHANT', 1, 1),
('BUILDING_EE_VERSAILLES',   'TECH_EE_SOVEREIGNTY',  'ERA_ENLIGHTENMENT', NULL,                 0, 7),
('BUILDING_EE_WAT_PHRA_KAEW','TECH_EE_HUMANISM',     'ERA_INDUSTRIAL',   'SPECIALIST_SCIENTIST',1, 5);

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_'||SUBSTR(Type,10), Description = 'TXT_KEY_'||Type,
	Civilopedia = 'TXT_KEY_WONDER_'||SUBSTR(Type,10)||'_PEDIA', Quote = 'TXT_KEY_WONDER_'||SUBSTR(Type,10)||'_QUOTE', Help = 'TXT_KEY_WONDER_'||SUBSTR(Type,10)||'_HELP',
	NukeImmune = 1, HurryCostModifier = -5, MinAreaSize = -1, ConquestProb = 100, IconAtlas = 'ENLIGHTENMENT_WONDER_ATLAS',
	WonderSplashImage = SUBSTR(Type,10)||'_splash.dds', WonderSplashAnchor = 'L,B', WonderSplashAudio = 'AS2D_WONDER_SPEECH_'||SUBSTR(Type,10)
WHERE Type IN (
'BUILDING_EE_FASIL_GHEBBI',
'BUILDING_EE_KRONBORG',
'BUILDING_EE_SMITHSONIAN',
'BUILDING_EE_TOPKAPI',
'BUILDING_EE_TORRE',
'BUILDING_EE_VERSAILLES',
'BUILDING_EE_WAT_PHRA_KAEW');

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxGlobalInstances)
SELECT 'BUILDINGCLASS_'||SUBSTR(Type,10), Type, 'TXT_KEY_'||Type, 1
FROM Buildings
WHERE Type IN (
'BUILDING_EE_FASIL_GHEBBI',
'BUILDING_EE_KRONBORG',
'BUILDING_EE_SMITHSONIAN',
'BUILDING_EE_TOPKAPI',
'BUILDING_EE_TORRE',
'BUILDING_EE_VERSAILLES',
'BUILDING_EE_WAT_PHRA_KAEW');

INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType) VALUES
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_FASIL_GHEBBI'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_KRONBORG'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_SMITHSONIAN'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_TOPKAPI'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_TORRE'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_VERSAILLES'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_WAT_PHRA_KAEW'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_FASIL_GHEBBI'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_KRONBORG'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_SMITHSONIAN'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_TOPKAPI'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_TORRE'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_VERSAILLES'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_WAT_PHRA_KAEW');

------------------------
-- Non-EE Wonders
------------------------

UPDATE Buildings SET PrereqTech = 'TECH_EE_ROMANTICISM' WHERE Type = 'BUILDING_HERMITAGE';
UPDATE Buildings SET PrereqTech = 'TECH_EE_HUMANISM' WHERE Type = 'BUILDING_UFFIZI';

UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_EE_GALLERY' WHERE BuildingType = 'BUILDING_HERMITAGE';
/*
UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_EE_BASTION' -- Bastion is closer than Arsenal
WHERE Type = 'BUILDING_RED_FORT';
*/
UPDATE Buildings
SET IconAtlas = 'COMMUNITY_ATLAS', PortraitIndex = 20
WHERE Type = 'BUILDING_MOMA';

UPDATE Buildings
SET IconAtlas = 'EECBO_ICON_ATLAS', PortraitIndex = 0
WHERE Type = 'BUILDING_MAUSOLEUM';

------------------------
-- National Wonder: Tower of Buddhist Insence (aka Summer Palace)
------------------------

INSERT INTO Buildings
	(Type, BuildingClass, Description, Civilopedia, Strategy, Help,
	Cost, PrereqTech, NukeImmune, HurryCostModifier, MinAreaSize, IconAtlas, PortraitIndex, ArtDefineTag, FreeGreatPeople, NumCityCostMod, NeverCapture,
	ReligiousUnrestFlatReductionGlobal, NationalPopRequired, NumCityCostMod) -- Wonder unique features (Religious tension)
VALUES
	('BUILDING_EE_SUMMER_PALACE','BUILDINGCLASS_EE_SUMMER_PALACE','TXT_KEY_BUILDING_EE_SUMMER_PALACE','TXT_KEY_BUILDING_EE_SUMMER_PALACE_PEDIA','TXT_KEY_BUILDING_EE_SUMMER_PALACE_STRATEGY','TXT_KEY_BUILDING_EE_SUMMER_PALACE_HELP',
	125, 'TECH_EE_SOVEREIGNTY', 1, -20, -1, 'ENLIGHTENMENT_WONDER_ATLAS', 8, 'ART_DEF_BUILDING_HERMITAGE', 1, 10, 1,
	1, 40, 10);

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxPlayerInstances) VALUES
('BUILDINGCLASS_EE_SUMMER_PALACE', 'BUILDING_EE_SUMMER_PALACE', 'TXT_KEY_BUILDING_EE_SUMMER_PALACE', 1);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield)
VALUES ('BUILDING_EE_SUMMER_PALACE', 'YIELD_CULTURE', 2);

INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType) VALUES
('BUILDING_EE_SUMMER_PALACE', 'BUILDINGCLASS_GARDEN'),
('BUILDING_EE_SUMMER_PALACE', 'BUILDINGCLASS_EE_MANOR');

------------------------
-- Fasil Ghebbi
------------------------

UPDATE Buildings
SET ExtraCityHitPoints = 100, Defense = 500, CitySupplyFlat = 5
WHERE Type = 'BUILDING_EE_FASIL_GHEBBI';

------------------------
-- Kronborg
------------------------

-- Kronborg Dummy
INSERT INTO Buildings (Type, BuildingClass, Cost, Description, ArtDefineTag, MinAreaSize, IconAtlas, PortraitIndex, NeverCapture, GreatWorkCount, FaithCost, NukeImmune, IsDummy, ShowInPedia) VALUES
('BUILDING_EE_KRONBORG_DUMMY', 'BUILDINGCLASS_EE_KRONBORG_DUMMY', -1, 'TXT_KEY_EE_KRONBORG_DUMMY', 'NONE', -1, 'BW_ATLAS_1', 19, 1, -1, -1, 1, 1, 0);
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description) VALUES
('BUILDINGCLASS_EE_KRONBORG_DUMMY','BUILDING_EE_KRONBORG_DUMMY','TXT_KEY_EE_KRONBORG_DUMMY');

UPDATE Buildings SET ExtraCityHitPoints = 0, Defense = 0, Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_EE_KRONBORG';
UPDATE Buildings SET ExtraCityHitPoints = 50, Defense = 300, CitySupplyFlat = 1 WHERE Type = 'BUILDING_EE_KRONBORG_DUMMY';

INSERT INTO Building_UnitCombatProductionModifiers (BuildingType, UnitCombatType, Modifier) VALUES
('BUILDING_EE_KRONBORG', 'UNITCOMBAT_NAVALRANGED', 50),
('BUILDING_EE_KRONBORG', 'UNITCOMBAT_NAVALMELEE', 50),
('BUILDING_EE_KRONBORG', 'UNITCOMBAT_SUBMARINE', 50),
('BUILDING_EE_KRONBORG', 'UNITCOMBAT_CARRIER', 50);

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits)
VALUES ('BUILDING_EE_KRONBORG', 'UNIT_GREAT_ADMIRAL', 1);

------------------------
-- Smithsonian
------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_MUSEUM', ScienceMedianModifierGlobal = -10, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 2, ThemingBonusHelp = 'TXT_KEY_EE_SMITHSONIAN_THEMING_BONUS_HELP'
WHERE Type = 'BUILDING_EE_SMITHSONIAN';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_SMITHSONIAN', 'YIELD_SCIENCE', 5);

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_EE_SMITHSONIAN', 'BUILDINGCLASS_EE_GALLERY', 'YIELD_CULTURE', 1),
('BUILDING_EE_SMITHSONIAN', 'BUILDINGCLASS_MUSEUM', 'YIELD_CULTURE', 1);

INSERT INTO Building_ThemingBonuses (BuildingType, Description, Bonus, MustBeArtifact, RequiresUniquePlayers, AIPriority)
VALUES ('BUILDING_EE_SMITHSONIAN', 'TXT_KEY_THEMING_BONUS_EE_SMITHSONIAN', 6, 1, 1, 5);

INSERT INTO Building_ThemingYieldBonus (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_SMITHSONIAN', 'YIELD_SCIENCE', 6),
('BUILDING_EE_SMITHSONIAN', 'YIELD_GOLD', 6);

----------------------------------------------
-- Topkapi
-- Defensive buildings: Walls, Castle, etc.
----------------------------------------------

INSERT INTO Building_BuildingClassYieldChanges
				(BuildingType, 			BuildingClassType, 	YieldType, 		YieldChange)
SELECT DISTINCT 'BUILDING_EE_TOPKAPI', 	BuildingClass,		'YIELD_FAITH', 	1
FROM Buildings WHERE Defense > 0 AND ExtraCityHitPoints > 0 AND (Cost > 0 OR FaithCost > 0) AND WonderSplashImage IS NULL;

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_TOPKAPI', 'YIELD_CULTURE', 2);

-- fix: boosted a little +3G & +2T when Flight researched
UPDATE Buildings
SET EnhancedYieldTech = 'TECH_FLIGHT'
WHERE Type = 'BUILDING_EE_TOPKAPI';

INSERT INTO Building_TechEnhancedYieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_TOPKAPI', 'YIELD_GOLD', 3),
('BUILDING_EE_TOPKAPI', 'YIELD_TOURISM', 2);

------------------------
-- Torre del Oro
------------------------

UPDATE Buildings
SET Water = 1, MinAreaSize = 10, TradeRouteSeaDistanceModifier = 50, TradeRouteRecipientBonus = 3, TradeRouteTargetBonus = 3, NumTradeRouteBonus = 1, FreeBuildingThisCity = 'BUILDINGCLASS_EE_DRYDOCK'
WHERE Type = 'BUILDING_EE_TORRE';
-- TradeRouteSeaDistanceModifier -> increase range of sea trade route
-- gives a free Drydock and +1 Trade Route
-- TradeRouteRecipientBonus	-> incoming TR  // my gold from other TRs (ok)
-- TradeRouteTargetBonus	-> outgoing TR  // other TR owner gain (no) // other player's gain from mine TR outgoing to him

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_TORRE', 'YIELD_CULTURE', 2);

------------------------
-- Versailles
------------------------

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits)
VALUES ('BUILDING_EE_VERSAILLES', 'UNIT_WRITER', 1);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_VERSAILLES', 'YIELD_CULTURE', 5);

----------------------------------------------
-- Wat Phra Kaew
----------------------------------------------

UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_EE_WAT_PHRA_KAEW';

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_EE_WAT_PHRA_KAEW', 'BUILDINGCLASS_SHRINE', 'YIELD_SCIENCE', 1),
('BUILDING_EE_WAT_PHRA_KAEW', 'BUILDINGCLASS_TEMPLE', 'YIELD_SCIENCE', 2);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_WAT_PHRA_KAEW', 'YIELD_SCIENCE', 5);


------------------------------------------------------------------------------------------------------------------------
-- Wonder costs and requirements
------------------------------------------------------------------------------------------------------------------------
-- Ren1: Chitzen Itza 12, Globe Theatre 11, Himeji 12, Leaning Tower 13
-- Ren2: Porcelain 11, Taj Mahal 12, Topkapi *13, Versailles *12, Sistine 11, Summer Palace 12, Red Fort 13
-- EE1: Uffizi 0, Wat Phra *14, Torre del Oro *14
-- EE2: Kronborg *15, Fasil *15
-- Ind1: Smithsonian*17, Neuschwanstein 16/18, Slater Mill 15/17,
-- Ind2: Louvre 17/19, BigBen 0, Eiffel 17/19, Brandenburg Gate 0
-- Mod1: Statue of Liberty 20, Empire State Building 0, Motherland Calls 8,
-- Infixo: new values as of VP907

UPDATE Buildings
SET NumPoliciesNeeded =  NumPoliciesNeeded + 1
WHERE NumPoliciesNeeded >= 14;

-- column 7 (REN1)

-- column 8 (REN2)
UPDATE Buildings SET Cost = 800, NumPoliciesNeeded = 11 WHERE Type = 'BUILDING_EE_TOPKAPI';
UPDATE Buildings SET Cost = 800, NumPoliciesNeeded = 11 WHERE Type = 'BUILDING_EE_VERSAILLES';

-- column 9 (EE1)
UPDATE Buildings SET Cost = 1000, NumPoliciesNeeded = 12 WHERE Type = 'BUILDING_EE_WAT_PHRA_KAEW';
UPDATE Buildings SET Cost = 1000, NumPoliciesNeeded = 12 WHERE Type = 'BUILDING_EE_TORRE';

-- column 10 (EE2)
UPDATE Buildings SET Cost = 1150, NumPoliciesNeeded = 13 WHERE Type = 'BUILDING_EE_KRONBORG';
UPDATE Buildings SET Cost = 1150, NumPoliciesNeeded = 13 WHERE Type = 'BUILDING_EE_FASIL_GHEBBI';

-- column 11 (IND1)
UPDATE Buildings SET Cost = 1400, NumPoliciesNeeded = 14 WHERE Type = 'BUILDING_EE_SMITHSONIAN';

-- column 12 (IND2)


------------------------
-- Flavors
------------------------

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
SELECT Type, 'FLAVOR_WONDER', 30
FROM Buildings
WHERE Type IN (
'BUILDING_EE_FASIL_GHEBBI',
'BUILDING_EE_KRONBORG',
'BUILDING_EE_SMITHSONIAN',
'BUILDING_EE_TOPKAPI',
'BUILDING_EE_TORRE',
'BUILDING_EE_VERSAILLES',
'BUILDING_EE_WAT_PHRA_KAEW');

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_WONDER', 25),
('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_DEFENSE', 25),
('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_CITY_DEFENSE', 30),
('BUILDING_EE_KRONBORG', 'FLAVOR_DEFENSE', 25),
('BUILDING_EE_KRONBORG', 'FLAVOR_CITY_DEFENSE', 15),
('BUILDING_EE_KRONBORG', 'FLAVOR_NAVAL', 40), -- production
('BUILDING_EE_KRONBORG', 'FLAVOR_GREAT_PEOPLE', 15), -- GA
('BUILDING_EE_SMITHSONIAN', 'FLAVOR_CULTURE', 30),
('BUILDING_EE_TOPKAPI', 'FLAVOR_RELIGION', 40), -- faith
('BUILDING_EE_TORRE', 'FLAVOR_GOLD', 30),
('BUILDING_EE_TORRE', 'FLAVOR_I_SEA_TRADE_ROUTE', 20), -- range
('BUILDING_EE_TORRE', 'FLAVOR_I_TRADE_DESTINATION', 20), -- gold
('BUILDING_EE_TORRE', 'FLAVOR_I_TRADE_ORIGIN', 20), -- gold
('BUILDING_EE_VERSAILLES', 'FLAVOR_CULTURE', 25),
('BUILDING_EE_VERSAILLES', 'FLAVOR_WONDER', 25),
('BUILDING_EE_VERSAILLES', 'FLAVOR_EXPANSION', 5),
('BUILDING_EE_VERSAILLES', 'FLAVOR_GREAT_PEOPLE', 15),
('BUILDING_EE_WAT_PHRA_KAEW', 'FLAVOR_SCIENCE', 25),
-- Tower of Buddhist Incense
('BUILDING_EE_SUMMER_PALACE', 'FLAVOR_WONDER', 25),
('BUILDING_EE_SUMMER_PALACE', 'FLAVOR_GREAT_PEOPLE', 15),
('BUILDING_EE_SUMMER_PALACE', 'FLAVOR_RELIGION', 15); -- religious unrest


----------------------------------------------------
-- Text (en_US)
----------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
-- Fassil Ghebbi
('TXT_KEY_BUILDING_EE_FASIL_GHEBBI', 'Fasil Ghebbi'),
('TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP', 'Friendly military units within 3-tile range of Fasil Ghebbi gain +25% [ICON_STRENGTH] Combat Strength. City gets additional +100 HP and +5 [ICON_STRENGTH] Defense. Increases the Military Unit Supply Cap by 5.'),
('TXT_KEY_WONDER_EE_FASIL_GHEBBI_QUOTE', '[NEWLINE]"When spiders unite, they can bring down a lion."[NEWLINE] - Ethiopian Proverb[NEWLINE]'),
('TXT_KEY_WONDER_EE_FASIL_GHEBBI_PEDIA', 'Fasil Ghebbi is a fortress in Gondar, along the hillside of Ethiopia. During the 17th and 18th centuries it served as the enclosure for Ethiopia''s emperors. The architecture of the fort is unique to Ethiopia, bending the styles of Nubian, Arabian and Baroque architecture. The site houses castles, Iyasu''s Palace, stables and three churches amongst other rooms. Before the building of the fort in about 1635 the emperors of Ethiopia travelled and lived off the land, resting in tents. Emperor Fasilides broke this tradition by founding the city of Gondar and establishing it as his capital. Upon founding the city Fasilides then instructed the creation of ‘Fasil Gemb’ - Fasilides Castle. Since his death later emperors expanded on Fasil Gemb to eventually cover roughly 70,000 square meters of fortified space. The historian Thomas Pakenham visited the site during the 1950’s, noting that among the halls and palaces were what appeared to be pavilions and kiosks of the imperial city therein. Since 1979 Fasil Ghebbi is a World Heritage Site.'),
-- Kronborg
('TXT_KEY_BUILDING_EE_KRONBORG', 'Kronborg'),
('TXT_KEY_WONDER_EE_KRONBORG_HELP', '+50 HP, +3 [ICON_STRENGTH] Defense and +1 [ICON_SILVER_FIST] Military Unit Supply Cap in all coastal cities, +50% [ICON_PRODUCTION] Production for Naval Units in the City where the wonder is built in. City must be built on the Coast. [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_ADMIRAL] Great Admiral appears near the City where the wonder was built.'),
('TXT_KEY_WONDER_EE_KRONBORG_QUOTE', '[NEWLINE]"Where there is no discipline, there is no honour."[NEWLINE] - Norse Saying[NEWLINE]'),
('TXT_KEY_WONDER_EE_KRONBORG_PEDIA', 'Kronborg is a large star fortress located on the North-eastern tip of the Danish island of Zealand, near the town of Helsingør. It was constructed under the reign of Eric of Pomerania during the 1420s. Along with Kärnan, another Danish fortress situated across the 4km wide Øresund, it was built predominantly to control the entrance to the Baltic Sea. This allowed for the Danish King to demand Øresundstolden, or Sound Dues. This was where all ships entering the Baltic had to pay a tax to the Danish king. If they refused, the cannons on either side of the sound would open fire on the ship and sink it. [NEWLINE][NEWLINE]In 1585 the castle was rebuilt under Frederick II of Denmark. This is when the castle became the large Rennaisance castle which it is now. In 1639 the castle was rebuilt by King Christian IV, after a fire ten years earlier. Less than 20 years later the castle was conquered by a Swedish army under Carl Gustaf Wrangel. Following this, the castle was heavily fortified moreso than before.'),
('TXT_KEY_EE_KRONBORG_DUMMY', 'EE: Kronborg Dummy'),
-- Smithsonian
('TXT_KEY_BUILDING_EE_SMITHSONIAN', 'Smithsonian Institute'),
('TXT_KEY_WONDER_EE_SMITHSONIAN_HELP', 'Receive a free {TXT_KEY_BUILDING_MUSEUM} and +5 [ICON_RESEARCH] Science in the City where the wonder is built. All Galleries and Museums gain +1 [ICON_CULTURE] Culture. Contains 2 slots for Great Works of Art.[NEWLINE][NEWLINE]+3 [ICON_RESEARCH] Science and +3 [ICON_GOLD] Gold if Themed.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Illiteracy all Cities.'),
('TXT_KEY_WONDER_EE_SMITHSONIAN_QUOTE', '[NEWLINE]"The best prophet of the future is the past."[NEWLINE] - Lord George Gordon Byron[NEWLINE]'),
('TXT_KEY_WONDER_EE_SMITHSONIAN_PEDIA', 'Established in 1846 "for the increase and diffusion of knowledge," the Smithsonian Institute is a group of museums and research centers administered by the United States government. Originally organized as the "United States National Museum," that name ceased to exist as an administrative entity in 1967 in favour of the current name, which refers to the British scientist James Smithson, the money of whom served as the basis for the establishment of the institution. Colloquially referred to as "the Nation''s Attic" for its eclectic holdings of some 137 million items, the Institute''s Washington, D.C. nucleus of nineteen museums, nine research centers, and a zoo — many of them historical or architectural landmarks of their own right — is the largest such complex in the world. Additional facilities are located across the United States and her former holdings, with such establishments being found in Arizona and New York City (among others in American territory) and as far afield as Panama. In addition to this, 168 other museums across the world are Smithsonian affiliates.'),
('TXT_KEY_EE_SMITHSONIAN_THEMING_BONUS_HELP', 'To maximize your bonus, make sure all Great Works are Artifacts and are all from different civilizations.'),
('TXT_KEY_THEMING_BONUS_EE_SMITHSONIAN', 'The Nation''s Attic'),
-- Topkapi
('TXT_KEY_BUILDING_EE_TOPKAPI', 'Topkapi Palace'),
('TXT_KEY_WONDER_EE_TOPKAPI_HELP', '+1 [ICON_PEACE] Faith from Defensive Buildings. Does not apply to gifted ones. +3 [ICON_GOLD] Gold and +2 [ICON_TOURISM] Tourism after you researched [COLOR_CYAN]{TXT_KEY_TECH_FLIGHT_TITLE}[ENDCOLOR].'),
('TXT_KEY_WONDER_EE_TOPKAPI_QUOTE', '[NEWLINE]"The city and the buildings are mine; but I resign to your valor the captives and the spoil, the treasures of gold and beauty; be rich and be happy"[NEWLINE] - Mehmet II[NEWLINE]'),
('TXT_KEY_WONDER_EE_TOPKAPI_PEDIA', 'Overlooking the waters of the Bosphorous, Topkapi Palace is a large palace complex located on the European side of Istanbul, Turkey. It was constructed under the orders of Mehmed II "The Conqueror", under whom the city was captured from the Byzantines and renamed Istanbul, as part of a scheme to re-build the city following the sucessful Ottoman siege. The palace served as the official residence of the Ottoman sultans for nearly four centuries of their rule, lasting until Sultan Abdul Mecid I moved the court to a newly-built palace further up the Bosphorous in 1856. Topkapi Palace is in fact more of a walled village than a palace, with several small buildings and many courtyards as opposed to one central structure. The site is home to many relics and artefacts collected both by the Sultans and following the end of the Ottoman empire when the palace was turned into a Museum. Among these are relics sacred to the Islamic world, including a door to the Great Mosque of Mecca, as well as what is said to be the cloak and sword of the prophet Muhammed. Other items include many collected from Silk Road trade, such as various pieces of Chinese porcelain from across four different dynasties of rule, and a collection of Islamic weaponry spanning approximately 13 centuries. Although the palace is largely still intact, some parts have since been lost as a result of either Earthquakes or fire.'),
-- Torre del Oro
('TXT_KEY_BUILDING_EE_TORRE', 'Torre Del Oro'),
('TXT_KEY_WONDER_EE_TORRE_HELP', 'Incoming [ICON_INTERNATIONAL_TRADE] Trade Routes generate +3 [ICON_GOLD] Gold for the City, and +3 [ICON_GOLD] Gold for [ICON_INTERNATIONAL_TRADE] Trade Route owner. Sea Trade Routes gain +50% Range. Grants +1 [ICON_INTERNATIONAL_TRADE] Trade Route and a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] {TXT_KEY_BUILDING_EE_DRYDOCK}.[NEWLINE][NEWLINE]City must be built on the [COLOR_CYAN]Coast[ENDCOLOR].'),
('TXT_KEY_WONDER_EE_TORRE_QUOTE', '[NEWLINE]"Gold is a treasure, and he who possesses it does all he wishes to in this world, and succeeds in helping souls into paradise"[NEWLINE] - Christopher Columbus[NEWLINE]'),
('TXT_KEY_WONDER_EE_TORRE_PEDIA', 'Torre Del Oro (Spanish for Tower of Gold) was constructed in the Spanish city of Seville during the 13th century by Berbers who were occupying Southern Spain at the time. It was originally constructed as a military watchtower, however after the Reconquista and discovery of the new world it was used as a treasury of sorts, storing precious metals which had been shipped from the new worlds aboard Spanish treasure fleets, inadvertedly transforming Seville into a very wealthy city and "gateway to the new world".'),
-- Versailles
('TXT_KEY_BUILDING_EE_VERSAILLES', 'Versailles'),
('TXT_KEY_WONDER_EE_VERSAILLES_HELP', 'Extends the length of [ICON_HAPPINESS_1] We Love The King Day by 50% Empire-wide. A [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_WRITER] Great Writer appears near the City where the wonder was built.'),
('TXT_KEY_WONDER_EE_VERSAILLES_QUOTE', '[NEWLINE]"Every time I create an appointment, I create a hundred malcontents and one ingrate."[NEWLINE] - Louis XIV[NEWLINE]'),
('TXT_KEY_WONDER_EE_VERSAILLES_PEDIA', 'The Château de Versailles is one of the most beautiful achievements of 18th-century French art. The site began as Louis XIII''s hunting lodge before his son Louis XIV transformed and expanded it, moving the court and government of France to Versailles in 1682. Each of the three French kings who lived there until the French Revolution added improvements to make it more beautiful.[NEWLINE][NEWLINE]The château lost its standing as the official seat of power in 1789 but acquired a new role in the 19th century as the Museum of the History of France, which was founded at the behest of Louis-Philippe, who ascended to the throne in 1830. That is when many of the château''s rooms were taken over to house the new collections, which were added to until the early 20th century, tracing milestones in French history.'),
-- Wat Phra Kaew
('TXT_KEY_BUILDING_EE_WAT_PHRA_KAEW', 'Wat Phra Kaew'),
('TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP', '+1 [ICON_RESEARCH] Science from [COLOR_CYAN]Shrines[ENDCOLOR]. +2 [ICON_RESEARCH] Science from [COLOR_CYAN]Temples[ENDCOLOR]. +5 [ICON_RESEARCH] Science in the City.[NEWLINE][NEWLINE]City must be built on a [COLOR_CYAN]River[ENDCOLOR].'),
('TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_QUOTE', '[NEWLINE]"Better than a thousand useless words is one useful word, hearing which one attains peace."[NEWLINE] - The Dhammapada, verse 100[NEWLINE]'),
('TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_PEDIA', 'Wat Phra Kaew, or the Temple of the Emerald Buddha, (officially known as Wat Phra Sri Rattana Satsadaram) is regarded as the most important Buddhist temple in Thailand. Located in the historic centre of Bangkok, within the grounds of the Grand Palace, it enshrines Phra Kaew Morakot (the Emerald Buddha), the highly revered Buddha image meticulously carved from a single block of jade. The Emerald Buddha (Phra Putta Maha Mani Ratana Patimakorn) is a Buddha image in the meditating position in the style of the Lanna school of the north, dating from the 15th century AD.[NEWLINE][NEWLINE]Raised high on a series of platforms, no one is allowed near the Buddha except the King. A seasonal cloak, changed three times a year to correspond to the summer, winter, and rainy season covers the statue. A very important ritual, the changing of the robes is performed only by the King to bring good fortune to the country during each season.[NEWLINE][NEWLINE]The construction of the temple started when King Buddha Yodfa Chulaloke (Rama I) moved the capital from Thonburi to Bangkok in 1785. Unlike other temples, it does not contain living quarters for monks; rather, it has only elaborately decorated holy buildings, statues, and pagodas. The main building is the central "ubosot" (ordination hall), which houses the Emerald Buddha.'),
-- Tower of Buddhist Incense
('TXT_KEY_BUILDING_EE_SUMMER_PALACE', 'Tower of Buddhist Incense'),
('TXT_KEY_BUILDING_EE_SUMMER_PALACE_HELP', 'Provides a free [ICON_GREAT_PEOPLE] Great Person of your choice near the [ICON_CAPITAL] Capital.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_RELIGION] Religious Unrest in all Cities.[NEWLINE][NEWLINE]Must have built a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_EE_MANOR}[ENDCOLOR] and a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_GARDEN}[ENDCOLOR] in the city. The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'),
('TXT_KEY_BUILDING_EE_SUMMER_PALACE_PEDIA', 'Located right in the centre of the front hill of Longevity Mountain in the Summer Palace, the tower was originally meant to be a nine-storey Buddhist pagoda built to resemble the Yellow Crane Tower. The Qianlong Emperor ordered the construction to be stopped just after the eighth storey was built. On the first day and fifteenth day of each lunar month, Empress Dowager Cixi visited the tower to offer incense and pray. [NEWLINE][NEWLINE] The Summer Palace is a complex of gardens, lakes and buildings that was constructed in Beijing under the order of the Qianlong Emperor, of the Qing Dynasty, in 1749.  The project required the creation of artificial lakes in the area, as the palace and surrounding farmland required waterworks and irrigation.  The palace''s design was based off of various aspects of China''s myths, legends, and natural and man-made wonders.  The palace fell into decline along with the Qing dynasty, and was damaged by the British and French during the Second Opium War.  After the fall of Qing, the complex fell into the possession of the former imperial family, now powerless.  It was opened to the public in 1924, after the last emperor, Puyi, was expelled.  Since 1953, the government of the People''s Republic of China have renovated the palace, which is now a World Heritage Site.'),
('TXT_KEY_BUILDING_EE_SUMMER_PALACE_STRATEGY', 'This National Wonder provides a free [ICON_GREAT_PEOPLE] Great Person of your choice in the [ICON_CAPITAL] Capital. A city must have a Manor and a Garden before it can construct the The Tower of Buddhist Incense.');

/*
-- Red Fort
UPDATE Language_en_US
SET Text = 'Requires completion of [COLOR_MAGENTA]Fealty[ENDCOLOR] Branch. Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_ENGINEER] Great Engineer and a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Bastion. Greatly increases [ICON_STRENGTH] Strength and HP of the City and increases the Military Unit Supply Cap from population by 5% in all Cities.'
WHERE Tag = 'TXT_KEY_WONDER_RED_FORT_HELP';
*/

-- Museum of Modern Art
UPDATE Language_en_US
SET Text = 'Museum of Modern Art'
WHERE Tag IN ('TXT_KEY_BUILDING_MOMA');
UPDATE Language_en_US
SET Text = 'Museum of Modern Art'
WHERE Tag IN ('TXT_KEY_THEMING_BONUS_MOMA');
UPDATE Language_en_US
SET Text = 'The Museum of Modern Art (MoMA) is an art museum located in Midtown Manhattan in New York City, on 53rd Street between Fifth and Sixth Avenues. It has been important in developing and collecting modernist art, and is often identified as the most influential museum of modern art in the world. The museum''s collection offers an overview of modern and contemporary art, including works of architecture and design, drawing, painting, sculpture, photography, prints, illustrated books and artist''s books, film and electronic media. The Library''s holdings include approximately 300,000 books and exhibition catalogs, over 1,000 periodical titles, and over 40,000 files of ephemera about individual artists and groups. The archives holds primary source material related to the history of modern and contemporary art.'
WHERE Tag IN ('TXT_KEY_CIV5_BUILDINGS_MOMA_TEXT');
/*
UPDATE Language_en_US
SET Text = 'Unique American replacement for the Hermitage. A city must have a Museum before it can construct the Museum of Modern Art.[NEWLINE][NEWLINE]+25% [ICON_CULTURE] Culture in the City, and 50% of the [ICON_CULTURE] Culture from Great Works, World Wonders, Natural Wonders, and Improvements is added to the [ICON_TOURISM] Tourism output of the city. Boosts [ICON_CULTURE] Culture and [ICON_RESEARCH] Science output of Museums in all Cities by +5. Contains 3 Slots for Great Works of Art or Artifacts.[NEWLINE][NEWLINE]Requires a Museum in the City. The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own. [NEWLINE][NEWLINE]+5 [ICON_RESEARCH] Science and +5 [ICON_CULTURE] Culture if Themed.'
WHERE Tag IN ('TXT_KEY_BUILDING_MOMA_HELP');
*/
UPDATE Language_en_US
SET Text = REPLACE(Text, 'Smithsonian Institute', 'Museum of Modern Art')
WHERE Tag = 'TXT_KEY_BUILDING_MOMA_STRATEGY';
