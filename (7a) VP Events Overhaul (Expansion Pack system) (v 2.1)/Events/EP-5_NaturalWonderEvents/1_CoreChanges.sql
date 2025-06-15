--------------------------------------------------------------------------------------------------
-- CITY_EVENT_NW_TUTORIAL adds an Event to explain to players that Cities built away near Natural Wonders can have specific events that can be positive or negative. Only fires once.
--------------------------------------------------------------------------------------------------
INSERT INTO CityEvents(Type,EventClass,Description,Help,CityEventArt,CityEventAudio,RandomChance,RandomChanceDelta,IsOneShot,EraScaling,IgnoresGlobalCooldown,EventCooldown,NumChoices,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,ObsoleteEra,IsUnhappy,IsSuperUnhappy,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,ImprovementRequired,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion) VALUES

('CITY_EVENT_NW_TUTORIAL','EVENT_CLASS_TRADE',NULL,NULL,'cityeventdefaultbackground.dds','AS2D_INTERFACE_CITY_TILE',1000,0,'true','false','true',30,1,0,0,NULL,NULL,NULL,'false','false',NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','true','false',NULL,'false','false','false','false','false','false','false','false','false');

INSERT INTO CityEvent_ParentEvents(CityEventChoiceType,CityEventType) VALUES
('CITY_EVENT_NW_TUTORIAL_CHOICE_1','CITY_EVENT_NW_TUTORIAL');

INSERT INTO CityEventChoices(Type,Description,Help,DisabledTooltip,EventChoiceAudio,EventChance,IsOneShot,EraScaling,EventDuration,Expires,MinimumCityPopulation,MaximumCityPopulation,RequiredCiv,RequiredEra,IsUnhappy,IsSuperUnhappy,ObsoleteEra,RequiredPolicy,RequiredIdeology,RequiresWar,RequiresWarMinor,PrereqTech,ObsoleteTech,RequiresPantheon,RequiredReligion,RequiredStateReligion,RequiresAnyStateReligion,RequiredBuildingClass,CannotHaveBuildingClass,RequiresHolyCity,RequiresIdeology,NearbyFeature,NearbyTerrain,LocalResourceRequired,HasTradeConnection,HasCityConnection,RequiresGarrison,CapitalOnly,CoastalOnly,RiverOnly,RequiresResistance,RequiresWLTKD,RequiresOccupied,RequiresRazing,HasAnyReligion,RequiresPuppet,RequiresNearbyNaturalWonder,RequiresNearbyMountain,EventBuildingClassDestruction,EventBuildingClass,CityWideBuildingDestructionChance,WLTKDTurns,ResistanceTurns,CityHappiness,RandomBarbarianSpawn,ConvertToPlayerReligionPercent,ConvertToPlayerMajorityReligionPercent,ImprovementRequired,FreeUnitsTechAppropriate,HasMetAMajorCiv,InDebt,LosingMoney,IsVassalOfSomeone,IsMasterOfSomeone,CityHasPlayerReligion,CityLacksPlayerReligion,CityHasPlayerMajorityReligion,CityLacksPlayerMajorityReligion,GrowthMod,BasicNeedsMedianModifier,GoldMedianModifier,ScienceMedianModifier,CultureMedianModifier,ReligiousUnrestModifier) VALUES

('CITY_EVENT_NW_TUTORIAL_CHOICE_1','TXT_KEY_CITY_EVENT_NW_TUTORIAL_DESCRIPTION','TXT_KEY_CITY_EVENT_NW_TUTORIAL_HELP',NULL,'AS2D_EVENT_CHOICE',0,'false','false',5,'false',0,0,NULL,NULL,'false','false',NULL,NULL,NULL,'false','false',NULL,NULL,'false',NULL,NULL,'false',NULL,NULL,'false','false',NULL,NULL,NULL,'false','false','false','false','false','false','false','false','false','false','false','false','false','false',NULL,NULL,0,0,0,0,0,0,0,NULL,0,'false','false','false','false','false','false','false','false','false',0,0,0,0,0,0);

INSERT INTO CityEvent_EventLinks(CityEventType,Event,EventChoice,CityEventLinker,CityEventChoice,CheckKnownPlayers,CheckOnlyEventCity,CheckForActive) VALUES
('CITY_EVENT_NW_TUTORIAL',NULL,NULL,'CITY_EVENT_NW_TUTORIAL',NULL,'false','false','false');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_TUTORIAL_DESCRIPTION', 'Natural Wonder Events');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CITY_EVENT_NW_TUTORIAL_HELP', 'When you settle cities near Natural Wonders, you can recieve events that are specific to that Wonder. While these are generally positive occurences, negative events do occasionally happen. Rest assured though...these negative events lead to even greater good events.');

--------------------------------------------------------------------------------------------------
-- Disabled Natural Wonder event choice text
INSERT INTO Language_en_US (Tag, Text) VALUES 
('TXT_KEY_CITY_EVENT_NW_DISABLED_HELP', 'Your civilization has not advanced far enough for this choice to be available.');
--
--------------------------------------------------------------------------------------------------


-- BEGIN BALANCING ORIGINAL NATURAL WONDERS --

UPDATE Features SET FreePromotionIfOwned = NULL WHERE Type = 'FEATURE_FOUNTAIN_YOUTH';
UPDATE Features SET FreePromotionIfOwned = NULL WHERE Type = 'FEATURE_KILIMANJARO';

DELETE FROM Feature_YieldChanges WHERE FeatureType = 'FEATURE_CRATER';
DELETE FROM Feature_YieldChanges WHERE FeatureType = 'FEATURE_MESA';
DELETE FROM Feature_YieldChanges WHERE FeatureType = 'FEATURE_REEF';
DELETE FROM Feature_YieldChanges WHERE FeatureType = 'FEATURE_MT_SINAI';
DELETE FROM Feature_YieldChanges WHERE FeatureType = 'FEATURE_GEYSER';
DELETE FROM Feature_YieldChanges WHERE FeatureType = 'FEATURE_GIBRALTAR';

INSERT INTO Feature_YieldChanges(FeatureType, YieldType, Yield) VALUES
('FEATURE_CRATER', 'YIELD_PRODUCTION', 2),
('FEATURE_CRATER', 'YIELD_SCIENCE', 3),
('FEATURE_EL_DORADO','YIELD_CULTURE',2),
('FEATURE_FOUNTAIN_YOUTH','YIELD_SCIENCE',1),
('FEATURE_MESA', 'YIELD_FOOD', 2),
('FEATURE_MESA', 'YIELD_CULTURE', 2),
('FEATURE_REEF', 'YIELD_FOOD', 1),
('FEATURE_REEF', 'YIELD_SCIENCE', 1),
('FEATURE_REEF', 'YIELD_CULTURE', 1),
('FEATURE_MT_SINAI', 'YIELD_FOOD', 2),
('FEATURE_MT_SINAI', 'YIELD_FAITH', 2),
('FEATURE_GEYSER', 'YIELD_SCIENCE', 5),
('FEATURE_GIBRALTAR', 'YIELD_FOOD', 2),
('FEATURE_GIBRALTAR', 'YIELD_PRODUCTION', 2),
('FEATURE_GIBRALTAR', 'YIELD_GOLD', 2);

UPDATE Feature_EraYieldChanges SET Yield='1' WHERE FeatureType IN (
	'FEATURE_POTOSI'			,
	'FEATURE_EL_DORADO'			,
	'FEATURE_FOUNTAIN_YOUTH'	,
	'FEATURE_SOLOMONS_MINES'	,
	'FEATURE_VOLCANO'			,
	'FEATURE_LAKE_VICTORIA'		,
	'FEATURE_FUJI'				,
	'FEATURE_MT_KAILASH'		,
	'FEATURE_KILIMANJARO'		,
	'FEATURE_MT_SINAI'			,
	'FEATURE_GEYSER'			,
	'FEATURE_GIBRALTAR'			,
	'FEATURE_SRI_PADA'			,
	'FEATURE_CRATER'			,
	'FEATURE_MESA'				,
	'FEATURE_REEF'				,
	'FEATURE_ULURU'				
);


	UPDATE Language_en_US
	SET Text = '+1 [ICON_RESEARCH] Science from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]The Barringer Crater is a huge meteorite crater located in Arizona in the United States of America. The crater is four thousand feet in diameter, and scientists believe that it was created some 50,000 years ago when the site was hit by a large nickel-iron meteorite weighing, at time of impact, 160,000 tons and moving at perhaps 27,000 miles per hour.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_BARRINGER_TEXT';

	UPDATE Language_en_US
	SET Text = '+1 [ICON_CULTURE] Culture from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]An active volcano, Mount Fuji is the highest mountain in Japan. Standing some 12,000 feet high and often wreathed in clouds, its famous snow-capped silhouette can be seen from Tokyo. The stately mountain is the subject of uncounted works of art - poems, songs, photographs, sculptures and paintings. Mount Fuji is a symbol of pride and beauty for all of Japan.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FUJI_TEXT';

	UPDATE Language_en_US
	SET Text = '+1 [ICON_GOLD] Gold from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]Gibraltar is a peninsula containing a remarkable rock formation at the mouth of the Mediterranean Sea. Captured from Spain by the English and Dutch in 1704 and ceded to England in 1713, Gibraltar has been a British possession ever since(much to the annoyance of Spain,which wants it back). Commanding the entrance to the Atlantic from the Mediterranean, Gibraltar has been a major British naval base for three hundred years.[NEWLINE]Most of Gibraltar is covered by the "Rock", a huge formation of shale, sandstone and limestone thrust up by the unimaginable power of plate tectonics. The Rock stands some 1400 feet in height.  At one time Gibraltar was a massive fortification allowing Britain to dominate the narrow Mediterranean-Atlantic passage, but today the peninsula is more of a nature preserve and tourist destination than it is a military base.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GIBRALTER_TEXT';
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_FOOD] Food from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]The Grand Mesa is a large geologic formation in Colorado, the United States of America. Rising some 5,000 feet above the surrounding territory and with an area of 500 square miles, it is the largest mesa in the world. The Grand Mesa has a layer of volcanic basalt on top, which resists erosion. It did not so much rise into the air, as it remained at its original height as the surrounding terrain was eroded by the action of the Colorado and Gunnison rivers.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GRANDMESA_TEXT';
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_RESEARCH] Science from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]The Great Barrier Reef is the world''s largest reef. A chain of almost 3000 reefs and 1000 islands, it stretches almost 1600 miles along the coast of north-east Australia. Constructed over 500,000 years by billions of coral polyps, the Great Barrier Reef is the largest single structure made by living creatures. The Great Barrier Reef is home to a hugely diverse population of whales,dolphins, porpoises, dugongs, turtles, fish, octopi, and snakes, not to mention over 200 species of birds.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT';
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_RESEARCH] Science from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]Krakatoa is a volcanic island located in Indonesia, between the islands of Java and Sumatra. The volcano exploded violently in August 1883 with a force equivalent to 13,000 times the power of the Hiroshima nuclear bomb. The eruption destroyed over half of the island and was heard in parts of Australia, some 2,000 miles away. Some 37,000 people were killed by the eruption and subsequent tsunamis. The volcano has been emitting lava steadily for the past eighty years, rebuilding the cone at a rate of about 15 feet per year.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KRAKATOA_TEXT';
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_CULTURE] Culture from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]Old Faithful is a geyser found in Yellowstone National Park in Wyoming, United States of America. First seen by Europeans in 1870(and by natives some 10,000 years before that), Old Faithful was thus named because of the regularity of its eruption. The geyser shoots a column of boiling water to a height of some 100-175 feet every 60-90 minutes(the interval determined by the ferocity of the previous eruption). Geysers occur when subterranean water hits magma(molten rock). The water is instantly turned to steam which rushes out the nearest available opening at tremendously high pressure. Old Faithful and the other 250 geysers in Yellowstone are enjoyed by some three million visitors each year.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_OLDFAITHFUL_TEXT';
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_FOOD] Food from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]Towering above Sri Lanka, Sri Pada is a large mountain peak with an unusually conical shape that is held sacred by a number of religions for the "footprint" found at its peak. The footprint, a large depression found in a rock formation on the mountain''s summit,has been attributed to Buddha, Shiva, and the biblical figure Adam, leading to the mountain''s reverence among followers of Buddhism, Hinduism,and Islam. Each year, thousands of pilgrims trek for hours up the mountain to pay their respects at the holy site.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SRI_PADA_TEXT';
	
	UPDATE Language_en_US
	SET Text = 'Workers, Work Boats, Missionaries, Inquisitors, and Settlers produced by the owner of this Natural Wonder gain the [COLOR_POSITIVE_TEXT]Sacred Steps[ENDCOLOR] Promotion,granting them +2 [ICON_MOVES] Movement.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SRI_PADA_HELP';
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_PEACE] Faith from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]Found on the Sinai Peninsula of Egypt, Mount Sinai is among the most revered holy sites recognized by the followers of Judaism, Christianity, and Islam. Mount Sinai is believed to be the location where Moses first received the Ten Commandments from God during the Israelites'' exodus from Egypt, making the peak an important site for religious pilgrims from around the world.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_MT_SINAI_TEXT';
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_PEACE] Faith from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]The sacred peak of Mount Kailash, found in the Himalayas of Tibet, is cherished by a number of religions, particularly the followers of Hinduism. It is believed to be the home of Lord Shiva, who dwells on the mountain in a state of eternal bliss. Mount Kailash is said to be among the most difficult of all religious pilgrimages,as the harsh conditions dissuade many would-be pilgrims,and the mountain is not accessible by any forms of modern transportation.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_MT_KAILASH_TEXT';
	
	INSERT INTO Language_en_US (Tag, Text)
	VALUES ('TXT_KEY_CIV5_FEATURES_MT_KAILASH_HELP','Through the Events system, all Military Units can eventually gain the [COLOR_POSITIVE_TEXT]Altitude Training[ENDCOLOR] Promotion, doubling movement speed through Hills and granting a combat bonus on Hills for the rest of the game.');
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_PRODUCTION] Production from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]Commonly referred to as "Ayers Rock", the massive red sandstone formation in central Australia has,over the past century,become one of Australia''s most recognizable landmarks. Long before it was discovered by English explorers in the late 1800s, the mountain was known as "Uluru", a name given by the indigenous tribesmen of the area who share varying legends as to its creation and significance. Designated as a UNESCO World Heritage Site in 1987, this led to an immediate upsurge in tourism with several hundred thousand visitors exploring the site each year.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_ULURU_TEXT';

	INSERT INTO Language_en_US (Tag, Text)
	VALUES ('TXT_KEY_CIV5_FEATURES_ULURU_HELP', 'Through the Events system, all Melee Units produced by the owner of this Natural Wonder can eventually gain the [COLOR_POSITIVE_TEXT]Desert Walker[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Hill Walker[ENDCOLOR] Promotions (typically reserved for Barbarians), doubling movement speed through Deserts and Hills.');
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_FOOD] Food from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]With a surface area over 26,000 square miles, Lake Victoria is the largest lake in Africa, the second largest freshwater lake on Earth, and the largest tropical lake in the world. Two large rivers leave the lake, the White Nile and the Katonga. The first historical records of the lake come from Arab traders seeking gold, ivory and other commodities from the natives as they pushed inland from the coast. The search by European explorers for the source of the Nile led to the discovery of the lake by the Englishman John Speke in 1858 AD, who named it after the then British monarch.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_TEXT';
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_CULTURE] Culture from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]Composed of three volcanic cones, the highest reaching 19,340 feet - making it the highest point in Africa and the highest free-standing mountain in the world - the Kilimanjaro massif lies in northeastern Tanzania. Considered a strato-volcano, two of its peaks(Mawenzi and Shira) are extinct,while its highest(Kibo) is dormant; its last eruption dates back approximately 150 thousand years. According to Johann Krapf, in 1860 the mountain was called "Kilimanjaro" by the Swahilis along the coast, meaning either "mountain of greatness" or "mountain of caravans".'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_TEXT';

	UPDATE Features SET Help = NULL WHERE Type = 'FEATURE_KILIMANJARO';
	
	/*	
	UPDATE Language_en_US
	SET Text = 'All Military Units on adjacent tiles gain the [COLOR_POSITIVE_TEXT]Altitude Training[ENDCOLOR] Promotion,doubling movement speed through Hills and granting a combat bonus on Hills for the rest of the game.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_HELP';
	*/
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_PRODUCTION] Production from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]King Solomon''s Mines exerted a pull on European explorers in 19th Century Africa akin to that of El Dorado on Spanish conquistadors in the 16th Century New World. When Europeans first encountered the mysterious ruins of the ancient city of Zimbabwe in East Africa, they were baffled by its location. Numerous explanations were put forth for its existence, but the one that captured the popular imagination was that Great Zimbabwe served to shelter and protect the workers in King Solomon''s mines in the nearby Chimanimani Mountains. Here, it was believed, could be found the source of the Biblical king''s legendary treasure of precious metals and gems. For several decades, adventurers and fortune hunters sought the legendary mines without success.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SOLOMONS_MINES_TEXT';

	UPDATE Language_en_US
	SET Text = 'Through the Events system, all Melee, Recon, Mounted Melee, Gunpowder and Armor Units produced by the owner of this Natural Wonder can eventually gain the [COLOR_POSITIVE_TEXT]Everlasting Youth[ENDCOLOR] Promotion, allowing them to heal for much higher amounts than normal.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_HELP';
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_RESEARCH] Science from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]One of the earliest accounts of this legendary spring comes from Herodotus, who describes it as a special "Water of Life" giving any who drinks of it exceptionally long life.  Similar stories have also been told among the indigenous people of the Caribbean and South America,which brought the Fountain of Youth to prominence during Spain''s era of exploration.  According to one popular story, in 1513 the Spanish conquistador Juan Ponce de Leon heard tales of the fountain during his travels in Puerto Rico and set sail to search for eternal life.  In doing so, he discovered Florida(and become one of the first Europeans to set foot on American soil) but never did locate the mythical fountain.  The Fountain of Youth continues to captivate audiences today - movies, books, comics,and games have all featured the fabled spring and man''s eternal quest to obtain it.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_TEXT';
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_PRODUCTION] Production from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]Located in southern Bolivia, the mountain of Potosi produced nearly all of the silver mined by the Spanish during their imperial days.  Once removed from the mountain, it was taken by llama and mule to the coast where it was then loaded onto treasure ships sailing back to Europe.  Nearly 41,000 tons of pure silver were mined over the course of 200 years, 8,200 of which went directly to the Spanish crown.  After 1800, the main silver mines were depleted, but the mining of Potosi still continues today - some for silver but now mostly for tin.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_POTOSI_TEXT';
	
	UPDATE Language_en_US
	SET Text = '+1 [ICON_CULTURE] Culture from this Natural Wonder for every Era after the Ancient Era.[NEWLINE][NEWLINE]This fabled "Lost City of Gold" drew many Spanish conquistadors to the New World, all hoping to stumble upon its untold riches. For nearly three centuries, the myth of precious gems and gold drew explorers to the South American coasts, who often sacked other cities they found along the way. El Dorado has captivated explorers throughout the centuries, and expeditions as late as 1804 were arranged to divine its location. However, it is now believed that the mythical city was inspired by the name of a Muisca chief, who reportedly,as part of an initiation, covered himself in a fine layer of gold dust and dove into the Guatavita Lake.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_TEXT';
	/*
	UPDATE Language_en_US
	SET Text = 'Workers,Work Boats,Missionaries,Inquisitors,and Settlers produced by the owner of this Natural Wonder gain the [COLOR_POSITIVE_TEXT]Sacred Steps[ENDCOLOR] Promotion,granting them +2 [ICON_MOVES] Movement.'
	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_HELP';
	*/