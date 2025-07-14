---------------------------------------------------
-- Base Settings
---------------------------------------------------
INSERT INTO Community	
			(Type,					Value)
VALUES		('UCS-PASSIVES-ON',		1),	-- enables CS passive abilities (GW gifts for Cultured CSs; religious pressure for Religious CSs)
			('UCS-PASSIVES-TILE',	1),	-- enables CS free UGPTI on Classical Era for each CS
			('UCS-PASSIVES-RES',	1),	-- enables CS additional resources (Maritime/ Mercantile/Militaristic);
			('UCS-PASSIVES-LUX',	1),	-- enables new Unique Luxuries for CSs
			('UCS-PASSIVES-UNIT',	1),	-- enables civilian unit gifts from friendly CSs
			('UCS-PASSIVES-BGP',	1), -- enables Border Growth Points gain in City-States after Diplomatic Mission
			('UCS-PASSIVES-HP',		1), -- enables City Hit Points gain in City-States after Diplomatic Mission
			('UCS-PASSIVES-SHOW',	0); -- hides passives in the CS tootlip
---------------------------------------------------
-- Compatibility
---------------------------------------------------
-- Even More Resources by @HungryForFood	
/*INSERT INTO Community	
		(Type,			Value)
VALUES	('UCS-EMR', 2);

UPDATE Community
SET Value = '1'
WHERE Type = 'UCS-EMR' AND EXISTS (SELECT * FROM Resources WHERE Type='RESOURCE_LAVENDER') AND NOT EXISTS (SELECT * FROM Community WHERE Type='UCS-EMR' AND Value= 0);*/

-- More Wonders by @adan_eslavo and @Infixo
INSERT INTO Community	
		(Type,			Value)
VALUES	('UCS-MW', 2);

UPDATE Community
SET Value = '1'
WHERE Type = 'UCS-MW' AND EXISTS (SELECT * FROM Resources WHERE Type='RESOURCE_TROPICAL_FISH') AND NOT EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 0);

/*
Custom Civilizations compatibility patches!
0 = Disabled disregarding if its detects new custom civilizations.
1 = Enabled if it detects new custom civilizations.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,								Value)
VALUES	('UCS-CIVILIZATION-BASQUE', 		2);

UPDATE Community SET Value = '1' WHERE Type = 'UCS-CIVILIZATION-BASQUE' AND EXISTS (SELECT * FROM Civilizations WHERE Type='CIVILIZATION_GT_BASQUES') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='UCS-CIVILIZATION-BASQUE' AND Value=0);
--==========================================================================================================================
-- UPDATES AND DEFINES
--==========================================================================================================================	
---------------------------------------------------
-- Updates - Units
---------------------------------------------------
UPDATE Units SET NumInfPerEra = 20 WHERE Class = 'UNITCLASS_GREAT_DIPLOMAT';
---------------------------------------------------
-- Updates - Defines
---------------------------------------------------
UPDATE Defines SET Value = 40 WHERE Name = 'FRIENDSHIP_THRESHOLD_FRIENDS';
UPDATE Defines SET Value = 80 WHERE Name = 'FRIENDSHIP_THRESHOLD_ALLIES';

UPDATE Defines SET Value = 10 WHERE Name = 'MINOR_FRIENDSHIP_ANCHOR_MOD_PROTECTED';

UPDATE Defines SET Value = 50 WHERE Name = 'MOD_BALANCE_CORE_MINIMUM_RANKING_PTP';

UPDATE Defines SET Value = 100 WHERE Name = 'ALLIES_CAPITAL_FOOD_BONUS_AMOUNT';
UPDATE Defines SET Value = 100 WHERE Name = 'ALLIES_OTHER_CITIES_FOOD_BONUS_AMOUNT';

-- CS Yield Rewards VP * 0.66
UPDATE Defines SET Value = 133 WHERE Name = 'ALLIES_CAPITAL_FOOD_BONUS_AMOUNT';
UPDATE Defines SET Value = 133 WHERE Name = 'ALLIES_OTHER_CITIES_FOOD_BONUS_AMOUNT';
	UPDATE Defines SET Value = 200 WHERE Name = 'FRIENDS_CAPITAL_FOOD_BONUS_AMOUNT_PRE_RENAISSANCE';
	UPDATE Defines SET Value = 33 WHERE Name = 'FRIENDS_OTHER_CITIES_FOOD_BONUS_AMOUNT_PRE_RENAISSANCE';
	UPDATE Defines SET Value = 300 WHERE Name = 'FRIENDS_CAPITAL_FOOD_BONUS_AMOUNT_POST_RENAISSANCE';
	UPDATE Defines SET Value = 66 WHERE Name = 'FRIENDS_OTHER_CITIES_FOOD_BONUS_AMOUNT_POST_RENAISSANCE';

UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_ANCIENT';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 2 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 2 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_INDUSTRIAL';
	UPDATE Defines SET Value = 1 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_ANCIENT';			-- 2
	UPDATE Defines SET Value = 2 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_CLASSICAL';		-- 3
	UPDATE Defines SET Value = 3 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_MEDIEVAL';			-- 4
	UPDATE Defines SET Value = 3 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_RENAISSANCE';		-- 5
	UPDATE Defines SET Value = 4 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_INDUSTRIAL';		-- 6

UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_ANCIENT';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 3 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 4 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 7 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_INDUSTRIAL';
	UPDATE Defines SET Value = 2 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_ANCIENT';		-- 3
	UPDATE Defines SET Value = 3 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_CLASSICAL';		-- 4
	UPDATE Defines SET Value = 4 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_MEDIEVAL';		-- 7
	UPDATE Defines SET Value = 6 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_RENAISSANCE';	-- 10
	UPDATE Defines SET Value = 7 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_INDUSTRIAL';	-- 14

UPDATE Defines SET Value = 1 WHERE Name = 'ALLIES_CULTURE_BONUS_AMOUNT_ANCIENT';
UPDATE Defines SET Value = 4 WHERE Name = 'ALLIES_CULTURE_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 8 WHERE Name = 'ALLIES_CULTURE_BONUS_AMOUNT_INDUSTRIAL';
	UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_CULTURE_BONUS_AMOUNT_ANCIENT';			-- 2
	UPDATE Defines SET Value = 3 WHERE Name = 'FRIENDS_CULTURE_BONUS_AMOUNT_MEDIEVAL';			-- 7
	UPDATE Defines SET Value = 7 WHERE Name = 'FRIENDS_CULTURE_BONUS_AMOUNT_INDUSTRIAL';		-- 15

UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_ANCIENT';
UPDATE Defines SET Value = 2 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 4 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 6 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 8 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_INDUSTRIAL';
	UPDATE Defines SET Value = 2 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_ANCIENT';			-- 3
	UPDATE Defines SET Value = 3 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_CLASSICAL';		-- 5
	UPDATE Defines SET Value = 4 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_MEDIEVAL';		-- 8
	UPDATE Defines SET Value = 6 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_RENAISSANCE';		-- 12
	UPDATE Defines SET Value = 8 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_INDUSTRIAL';		-- 16
---------------------------------------------------
-- Updates - CustomModOptions - Events
---------------------------------------------------
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_PLOT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_CITY';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_TRADE_ROUTES';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_FOUND_RELIGION';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_FOUNDED';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_CREATED';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_PREKILL';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_UPGRADES';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RESOLUTIONS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_MINORS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_MINORS_INTERACTION';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_BARBARIANS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_LIBERATION';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_NEW_ERA';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_CUSTOM_MISSIONS';

UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_TURN';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_MISSION';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_ABORT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_RESULT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_ENDED';

UPDATE CustomModOptions SET Value = 1 WHERE Name = 'YIELD_MODIFIER_FROM_UNITS';
---------------------------------------------------
-- Updates - CustomModOptions - CS Abilities
---------------------------------------------------
-- CS Overseas Territory
-- City States allied to a major act as an "overseas territoriy" of the major - other units may not enter CS territory unless they could enter the allied major's territory
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CS_OVERSEAS_TERRITORY';
	
-- CS Gift Ships
-- City States will (occasionally) gift ships
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CS_GIFT_SHIPS';	

-- CS Militaristic upgrade (enabled by default; not working as intended --> look at policy Regimental System)
-- Units in allied militaristic City States can upgrade - requires a (cosmetic) patch to UnitPanel.lua to fix the incorrect message about being in friendly territory
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CS_UPGRADES';	
	
-- CS Gifts
-- City States give different gifts depending on their type (cultural, religious, maritime, etc)
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CS_GIFTS';	
	
-- CS Allied Inquisitors
-- Inquisitors will keep religion out of allied City State cities if positioned adjacent
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'RELIGION_ALLIED_INQUISITORS';
---------------------------------------------------
-- Updates - New colours
---------------------------------------------------
INSERT INTO MinorCivTraits_Status
			(Type,									StatusIcon,						PositiveStatusMeter,	NegativeStatusMeter,			StatusMeterIconAtlasIndex)
VALUES		('MINOR_FRIENDSHIP_STATUS_TERRIFIED',	'CityStateMeterOrange32.dds',	NULL,					'CityStateMeterBaseOrange.dds',	3);

UPDATE MinorCivTraits_Status SET StatusIcon = 'CityStateMeterTan32.dds', NegativeStatusMeter = 'CityStateMeterBaseTan.dds', StatusMeterIconAtlasIndex = 5 WHERE Type = 'MINOR_FRIENDSHIP_STATUS_AFRAID';
UPDATE MinorCivTraits_Status SET StatusIcon = 'CityStateMeterMagenta32.dds', NegativeStatusMeter = 'CityStateMeterBaseMagenta.dds', StatusMeterIconAtlasIndex = 6 WHERE Type = 'MINOR_FRIENDSHIP_STATUS_ANGRY';

UPDATE IconTextureAtlases SET IconsPerColumn = 7 WHERE Atlas = 'CITY_STATE_INFLUENCE_METER_ICON_ATLAS';
---------------------------------------------------
-- Updates - Language_en_US
---------------------------------------------------
UPDATE Language_en_US SET Text = REPLACE(Text, 'Available![ENDCOLOR]', '[ENDCOLOR]available!') WHERE Tag = 'TXT_KEY_CSTATE_CAN_EMBASSY';
UPDATE Language_en_US SET Text = REPLACE(Text, 'Available![ENDCOLOR]', '[ENDCOLOR]available!') WHERE Tag = 'TXT_KEY_CSTATE_CAN_PROTECT';
UPDATE Language_en_US SET Text = REPLACE(Text, '  It rests at {2_InfluenceAnchor}.', ' It rests at {2_InfluenceAnchor} [ICON_INFLUENCE].') WHERE Tag = 'TXT_KEY_CSTATE_INFLUENCE_RATE';
UPDATE Language_en_US SET Text = REPLACE(Text, 'early.[NEWLINE][NEWLINE]', 'early.') WHERE Tag = 'TXT_KEY_CSTATE_JERK_STATUS';
UPDATE Language_en_US SET Text = REPLACE(Text, 'For the next', '[ICON_BULLET]For the next') WHERE Tag = 'TXT_KEY_CSTATE_JERK_STATUS';
UPDATE Language_en_US SET Text = REPLACE(Text, 'If you', '[ICON_BULLET]If you') WHERE Tag = 'TXT_KEY_CSTATE_JERK_STATUS';
--==========================================================================================================================
-- ATLASES
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
SELECT 		'UCS_BUILDING_ATLAS', 					'256', 		'UCS_Buildings_256.dds', 			8, 				2 UNION ALL
SELECT 		'UCS_BUILDING_ATLAS', 					'128', 		'UCS_Buildings_128.dds', 			8, 				2 UNION ALL
SELECT 		'UCS_BUILDING_ATLAS', 					'80', 		'UCS_Buildings_080.dds', 			8, 				2 UNION ALL
SELECT 		'UCS_BUILDING_ATLAS', 					'64', 		'UCS_Buildings_064.dds', 			8, 				2 UNION ALL
SELECT 		'UCS_BUILDING_ATLAS', 					'45', 		'UCS_Buildings_045.dds', 			8, 				2 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'256', 		'UCS_Promotions_256.dds', 			8, 				8 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'64', 		'UCS_Promotions_064.dds', 			8, 				8 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'45', 		'UCS_Promotions_045.dds', 			8, 				8 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'32', 		'UCS_Promotions_032.dds', 			8, 				8 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'16', 		'UCS_Promotions_016.dds', 			8, 				8 UNION ALL
SELECT 		'UCS_IMPROVEMENT_ATLAS', 				'256', 		'UCS_Improvements_256.dds',			8, 				4 UNION ALL
SELECT 		'UCS_IMPROVEMENT_ATLAS', 				'64', 		'UCS_Improvements_064.dds',			8, 				4 UNION ALL
SELECT 		'UCS_IMPROVEMENT_ATLAS', 				'45', 		'UCS_Improvements_045.dds',			8, 				4 UNION ALL
SELECT 		'UCS_UNIT_ATLAS', 						'256', 		'UCS_Units_256.dds',				6, 				1 UNION ALL
SELECT 		'UCS_UNIT_ATLAS', 						'128', 		'UCS_Units_128.dds',				6, 				1 UNION ALL
SELECT 		'UCS_UNIT_ATLAS', 						'80', 		'UCS_Units_080.dds',				6, 				1 UNION ALL
SELECT 		'UCS_UNIT_ATLAS', 						'64', 		'UCS_Units_064.dds',				6, 				1 UNION ALL
SELECT 		'UCS_UNIT_ATLAS', 						'45', 		'UCS_Units_045.dds',				6, 				1 UNION ALL
SELECT 		'UCS_UNIT_FLAG_ATLAS', 					'32', 		'UCS_UnitsFlags_032.dds',			6, 				1 UNION ALL
SELECT 		'UCS_RESOURCE_ATLAS', 					'256', 		'UCS_Resources_256.dds',			4, 				6 UNION ALL
SELECT 		'UCS_RESOURCE_ATLAS', 					'80', 		'UCS_Resources_080.dds',			4, 				6 UNION ALL
SELECT 		'UCS_RESOURCE_ATLAS', 					'64', 		'UCS_Resources_064.dds',			4, 				6 UNION ALL
SELECT 		'UCS_RESOURCE_ATLAS', 					'45', 		'UCS_Resources_045.dds',			4, 				6;
---------------------------------------------------
INSERT INTO IconFontTextures 
			(IconFontTexture, 				IconFontTextureFile)
VALUES		('UCS_RESOURCE_FONT_ATLAS', 	'UCS_ResourcesFontIcons_022');
--==========================================================================================================================
-- TEXTS
--==========================================================================================================================	
INSERT INTO Language_en_US (Tag, Text)
-- main definitions
SELECT 'TXT_KEY_CITYSTATE_CLERMONT', 					'Clermont' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CLERMONT_ADJ', 					'The Clermont' UNION ALL
SELECT 'TXT_KEY_CIV5_CLERMONT_TEXT', 						'Clermont was the starting point of the First Crusade, in which Christendom sought to free Jerusalem from Muslim domination: Pope Urban II preached the crusade in 1095 at the Second Council of Clermont.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONDURAS', 					'Tegucigalpa' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONDURAS_ADJ', 					'Honduran' UNION ALL
SELECT 'TXT_KEY_CIV5_HONDURAS_TEXT', 						'Honduras was home to several Mesoamerican cultures before the Spanish took over in the 16th century. Honduras became independent in 1821 and has since been a republic. However the republic remains a figure of a banana republic where their government encouraged developments from foreign investors which these developments came out with bananas.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AUCKLAND', 					'Parihaka' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AUCKLAND_ADJ', 					'the Maori' UNION ALL
SELECT 'TXT_KEY_CIV5_AUCKLAND_TEXT', 						'When the Maori settled upon an isthmus in what is now northern New Zealand, they found the surrounding landscape full of fertile land, lush jungle, and dormant volcanos. Protected natural harbors on either side of the isthmus offered plentiful fishing and a base for war canoes ("waka taua"). The settlers named it "Tamaki Makaurau" - roughly translating to "the maiden sought by a hundred lovers".' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ARMAGH', 						'Armagh' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ARMAGH_ADJ', 						'The Armagh' UNION ALL
SELECT 'TXT_KEY_CIV5_ARMAGH_TEXT', 							'The Irish town of Armagh has long known religion. Thought to have been a worship site for ancient pagans, it gained prominence in the 5th Century when Saint Patrick, a Christian missionary, constructed and consecrated a stone church on the summit of a hill. Around that sprang a monastery, and then a town devoted to spreading Christianity throughout Ireland - a beachhead of theology.[NEWLINE][NEWLINE]This is not to imply that Armagh is a coastal city. Its location in Northern Ireland is a short 25 miles to the ocean. Nevertheless, its reputation as the seat of the Church of Ireland made it a tempting target for those looking to score riches. Vikings raided Armagh''s monastery twice in the 9th Century, each time making the overland trek to abscond with armloads of religious relics. John de Courcy, an invading Norman knight, thought to repeat the tradition when he plundered the town in the late 12th Century.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUSCAT', 						'Muscat' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUSCAT_ADJ', 						'The Muscat' UNION ALL
SELECT 'TXT_KEY_CIV5_MUSCAT_TEXT', 							'The trade flowing through Muscat has been its lifeblood for at least two millennia. Nestled against the foothillls of the Al Hajar mountains, Ptolemy called it the Hidden Port ("Cryptus Portus") as early as the 1st Century. Unfortunately the city was not hidden well enough - its prime location at the mouth of the Persian Gulf has long since made it a tempting target for conquest.[NEWLINE][NEWLINE]Over the centuries Muscat''s port has flown many banners: Sassanid, Arabian (under which it converted to Islam in the 7th Century), Abbasid, Seljuk, and Persian, to name a few. In the early 16th Century, a Portuguese admiral sought to open trade relations - with cannons, burning most of Muscat to the ground. It was rebuilt and remained under Portuguese rule until 1650, when the Omani forced them out and reclaimed the port city.[NEWLINE][NEWLINE]Muscat has long come to conflict with the interior tribes of Oman, most commonly over self-governance. Amidst one such period of turmoil in the 18th Century rose the Al Bu Sa''id dynasty, which has remained unbroken through modern times. Today, an extensively modernized Muscat serves as Oman''s capital and remains an important trading port.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GRANADA', 					'Granada' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GRANADA_ADJ', 					'The Granada' UNION ALL
SELECT 'TXT_KEY_CIV5_GRANADA_TEXT', 						'In the 8th Century the Umayyad Caliphate spread through the Iberian Peninsula, rapidly conquering Visigothic Hispania. Granada, a fortified settlement in what is now southern Spain, was swept up in the invasion. In time to come (the late 15th Century, to be exact) its surrender to the Catholic Monarchs ("Los Reyes Católicos") would end the Reconquista of Andalusia—but for three quarters of a millennium, Granada belonged to the Moors.[NEWLINE][NEWLINE]Located at the base of the Sierra Nevada range, Granada had the misfortune of being nearly indefensible due to its location on a low-lying plain. Its Moorish rulers quickly realized this and transferred their seat of power to the more defensible foothills overlooking the town. Part of their plans involved the building of alcazars, one of which would in later years be renovated into the beautiful Alhambra.[NEWLINE][NEWLINE]Granada''s Moorish masters shifted through the centuries. The Almohad replaced the Almoravids, who had themselves succeeded the remnants of the Umayyad. The city''s fortunes changed again in the 13th Century with the Nasrid dynasty, whose alliance with the Catholic kingdom of Castile led to the Emirate of Granada. Direct access to trade centers in sub-Saharan Africa bought Granada freedom from the Reconquista - for a time.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NAN_MADOL', 					'Leluh' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NAN_MADOL_ADJ', 					'The Leluh' UNION ALL
SELECT 'TXT_KEY_CIV5_NAN_MADOL_TEXT', 						'Leluh is a major prehistoric and historic archaeological site. The remains are those of a civilization that peaked around the 14th and 15th centuries, with elements still visible at the time of European contact in the early 19th century. The rulers of Leluh gradually conquered and thus unified the island of Kosrae. From the capital at Leluh, they ruled the island with a monarchy that archaeologists believe was similar to the kingdoms of Tonga or Hawaii.[NEWLINE][NEWLINE]Most archaeologists and historians do not believe that the ruins of the abandoned city of Nan Madol, lying adjacent to the eastern shore of the island of Pohnpei in Micronesia, are a remnant of the lost continent of Mu. The city was instead constructed in a lagoon and consisted of about 100 small artificial islets built on stone and coral fill platforms separated by tidal canals. Instead of being left over from the prehistoric sinking of a continent, best guess is that construction of these islets started c. 8th Century AD, and that the construction of the megalithic structures upon these took place in the 12th and 13th centuries. All so the elite castes of the Sandeleur dynasty didn''t have to mix with the commoners.[NEWLINE][NEWLINE]The original name for the lagoon-city was Soun Nan-leng ("Reef of Heaven"), and European explorers dubbed it the "Venice of the Pacific". Most of the named islets were residential, homes for chieftains and priests... although some served special needs: food preparation, coconut oil production on Peinering, canoe construction on Dapahu. The mortuary "neighborhood" includes some 58 islets, covered with graves. Nan Madol was the political, religious and cultural seat of power for the Sandeleur, who had succeeded in uniting the clans (which totaled around 25 thousand people) on Pohnpei and Temwen islands. Shortly thereafter the ruler forced the tribal chieftains to move to the new city where he could keep an eye on them.[NEWLINE][NEWLINE]At its peak, the population of Nan Madol was perhaps about 1000. Since there are no sources of food or fresh water on the islets, everything had to be rowed over from Pohnpei. According to legend, the stones used for all the buildings and tombs were flown to the island by twin sorcerers Olisihpa and Olosohpa, who founded the Sandeleur. Whatever the facts of its creation, by the time the Europeans arrived in the early 1800s, Nan Madol had been abandoned, likely around 1450 when the Sandeleur collapsed.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GWYNEDD', 					'Aberffraw' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GWYNEDD_ADJ', 					'Welsh' UNION ALL
SELECT 'TXT_KEY_CIV5_GWYNEDD_TEXT', 						'Gwynedd was an independent Welsh kingdom from the end of the Roman period until the 13th century, when it was conquered by England.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUISCA', 						'Suamox' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUISCA_ADJ', 						'Muiscan' UNION ALL
SELECT 'TXT_KEY_CIV5_MUISCA_TEXT', 							'Muisca was home to several Andean cultures such as the Panche in the west, Muzo in the northwest, Guane in the north, Lache in the northeast, Achagua in the east, and Sutagao in the south until the 16th century where Spanish Conquistadors laid ruin to them.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LACONIA', 					'Sparta' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LACONIA_ADJ', 					'Spartan' UNION ALL
SELECT 'TXT_KEY_CIV5_LACONIA_TEXT', 						'Considered a region of its city-state capital, Sparta, Laconia became one of the strongest local powers to contest control in the Peloponnese region.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CHEVAK', 						'Chevak' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CHEVAK_ADJ', 						'The Chevak' UNION ALL
SELECT 'TXT_KEY_CIV5_CHEVAK_TEXT', 							'An area in Alaska native to the Chevak people.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANTO_DOMINGO', 				'Santo Domingo' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANTO_DOMINGO_ADJ', 				'Dominican' UNION ALL
SELECT 'TXT_KEY_CIV5_SANTO_DOMINGO_TEXT', 					'Santo Domingo became the oldest European city in the Americas continent. Originally named La Nueva Isabela, it was renamed in 1495 to ''Santo Domingo'', in honor of Saint Dominic. Santo Domingo came to be known as the ''Gateway to the Caribbean'' as the city grew bigger and prosperous.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MANAGUA', 					'Managua' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MANAGUA_ADJ', 					'Managuense' UNION ALL
SELECT 'TXT_KEY_CIV5_MANAGUA_TEXT', 						'Managua composed of mestizos and whites of Spanish decent, the city became from a fishing town to a thriving Spanish to now being the most well-known Central American developed city.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ODENSO', 						'Helsinki' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ODENSO_ADJ', 						'Finnish' UNION ALL
SELECT 'TXT_KEY_CIV5_ODENSO_TEXT', 							'Translated literally as Odin''s Island, it was named by the Finnish Kingdom in recognition to a Norse Mythologial God, Odin.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_YANGCHENG', 					'Yangcheng' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_YANGCHENG_ADJ', 					'The Yangcheng' UNION ALL
SELECT 'TXT_KEY_CIV5_YANGCHENG_TEXT', 						'Considered the first capital of the Xia Dynasty, it was built upon the Yin River and held until the fall of their dynasty.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PHANOTEUS', 					'Phanoteus' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PHANOTEUS_ADJ', 					'Phocisan' UNION ALL
SELECT 'TXT_KEY_CIV5_PHANOTEUS_TEXT', 						'Phanoteus was a very ancient town, originally inhabited by the Phlegyae. It is believed that Promethesus made the human race here. It held until damaged and damaged until destroyed in the passage of time by the Persians under Xerxes, Macedonians under Philip II, and the Romans under Pompey the Great.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DOUALA', 						'Douala' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DOUALA_ADJ', 						'The Douala' UNION ALL
SELECT 'TXT_KEY_CIV5_DOUALA_TEXT', 							'Douala is the largest city in Cameroon along as its city with the strongest economic growth in the region. Cameroon independence in 1960 gave rise to the strong rapid economic growth of Douala as its economic importance became critical to develop and prosper.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AMBRACIA', 					'Ambracia' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AMBRACIA_ADJ', 					'Ambracian' UNION ALL
SELECT 'TXT_KEY_CIV5_AMBRACIA_TEXT', 						'Ambracia is a city among Ancient Greece history that was gifted by Macedonian ruler Cassander to Pyrrhus, king of Epirus' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DJIBOUTI', 					'Djibouti' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DJIBOUTI_ADJ', 					'Djiboutian' UNION ALL
SELECT 'TXT_KEY_CIV5_DJIBOUTI_TEXT', 						'Djibouti was a region that originally was uninhabited coast until settled as Obock under French control. It was renamed and also became the capital of its respective named country after its independence from France.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DODOMA', 						'Dar es Salaam' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DODOMA_ADJ', 						'Dar es Salaam' UNION ALL
SELECT 'TXT_KEY_CIV5_DODOMA_TEXT', 							'Located on the Swahili coast, Dar es Salaam (Arabic: "Abode of Peace") is Tanzania''s largest city and most prominent centre for arts, fashion, media, film, television, and finance. With a population of over six million people, Dar is the largest city in East Africa and the sixth-largest in Africa.[NEWLINE][NEWLINE]Dar es Salaam was founded in 1862 by Majid bin Said, the first Sultan of Zanzibar, on the site of the village of Mzizima ("healthy town" in Swahili). It remained only a small port until the German East Africa Company established a station there in 1887. In 1905, the city was the starting point for the Central Line railroad, which facilitated the town''s growth and industrial development. Dar es Salaam served as the capital of German East Africa (1891-1916), Tanganyika (1961-64), and Tanzania (1964-74). In 1974, Dodoma was designated as new capital, although the transfer of official functions was officially completed in 1996. [NEWLINE][NEWLINE]Buildings in Dar es Salaam often reflect the city''s colonial past and display a rich mix of architectural styles, incorporating Swahili, British, German, and Asian traditions. Post-World War II modernization and expansion brought contemporary multistory buildings, including a hospital complex, a technical institute, and a high court. Educational facilities include the University of Dar es Salaam (1961), several libraries and research institutes, and the National Museum.[NEWLINE][NEWLINE]Dar es Salaam''s natural, nearly landlocked harbour is the outlet for most of mainland Tanzania''s agricultural and mineral exports and in addition serves the nearby land-locked countries of Uganda, Rwanda, Burundi, the Democratic Republic of the Congo, Zambia, and Malawi. It is also a transit port for the Congo River, whose navigable tributary, the Lualaba, can be reached by rail.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_FAYA', 						'Faya' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_FAYA_ADJ', 						'The Faya' UNION ALL
SELECT 'TXT_KEY_CIV5_FAYA_TEXT', 							'Faya is a tropical hot region that boast its large population in modern northern Chad.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KIGALI', 						'Kigali' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KIGALI_ADJ', 						'Kigalian' UNION ALL
SELECT 'TXT_KEY_CIV5_KIGALI_TEXT', 							'Kigali is the capital city of Rwanda being initially developed by the Kingdom of Rwanda in the 14th century, and has been its historical capital in modern times.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LEVUKA', 						'Levuka' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LEVUKA_ADJ', 						'Fijian' UNION ALL
SELECT 'TXT_KEY_CIV5_LEVUKA_TEXT', 							'Levuka is a port town on the east coast of Ovalau island and capital of Lomaiviti province in the South Pacific country of Fiji. Settled by a U.S. adventurer in 1822, the area was the centre of a cotton boom during the American Civil War (1861-65), when world cotton supplies were disrupted.[NEWLINE][NEWLINE]When the first modern nation state of Fiji, the Kingdom of Fiji, was founded in 1871, Seru Epenisa Cakobau was crowned King at Levuka. After Fiji was annexed as a British colony in 1874, Levuka remained the capital until 1877, when the administration was moved to Suva, although the move was not made official until 1882.[NEWLINE][NEWLINE]It is now the centre of Fiji''s tuna-processing industry, supplied mainly by Japanese, South Korean, and Taiwanese fishing boats. The town''s 19th-century architecture is still largely intact, and in 2013 Levuka was designated a UNESCO World Heritage site for its cultural and historical value.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_QUELIMANE', 					'Quelimane' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_QUELIMANE_ADJ', 					'Quelimanean' UNION ALL
SELECT 'TXT_KEY_CIV5_QUELIMANE_TEXT', 						'Quelimane is a region extremely vulnerable to flooding. Founded as a Swahili trading post, it developed into a prosperous seaport.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SIERRA_LEONE', 				'Freetown' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SIERRA_LEONE_ADJ', 				'Sierra Leonean' UNION ALL
SELECT 'TXT_KEY_CIV5_SIERRA_LEONE_TEXT', 					'Freetown is a diverse region of deserts and wetlands. Founded under British control, it was given its independence and boast its religious tolerance compared to its neighbor.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SURREY', 						'Brooklands' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SURREY_ADJ', 						'The Surreys' UNION ALL
SELECT 'TXT_KEY_CIV5_SURREY_TEXT', 							'Surrey is a county in the south-east of the United Kingdoms. Known for its first usage as an airfield, the county became critical for its production of airplanes and aero testing.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TAIWAN', 						'Taipei' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TAIWAN_ADJ', 						'Taipei' UNION ALL
SELECT 'TXT_KEY_CIV5_TAIWAN_TEXT', 							'Taipei is the capital city of the Republic of China, and forms the cultural, political, and economic center of Taiwan. Prior to the establishment of the Kuomintang''s Chinese government in exile, Taipei was a minor provincial capital, situated along trade routes between China, Japan, and the Philippines. Much of the surrounding area continues to be inhabited by several Formosan indigenous groups, creating a rich cultural fabric distinct from mainland China''s domination by Han Chinese influence.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OC_EO', 						'Óc Eo' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OC_EO_ADJ', 						'The Funan' UNION ALL
SELECT 'TXT_KEY_CIV5_OC_EO_TEXT', 							'Funan was an ancient state in Cambodia that arose in the 1st century ad and was incorporated into the state of Chenla in the 6th century. Funan (perhaps a Chinese transcription of pnom, “mountain”) was the first important Hinduized kingdom in southeast Asia. It covered portions of what are now Vietnam, Thailand, and Cambodia. Funan had trade relations with India as well as China, to whose emperor the people of Funan sent tribute between the 3rd and 6th centuries.[NEWLINE][NEWLINE]Funan reached the apex of its power under the 3rd-century king Fan Shiman, also known as Srei Meara. Fan Shiman expanded his empire''s navy and improved the Funanese bureaucracy, creating a quasi-feudal pattern that left local customs and identities largely intact, particularly in the empire''s further reaches. Fan Shiman and his successors also sent ambassadors to China and India to regulate sea trade. The kingdom likely accelerated the process of Indianization of Southeast Asia. Later kingdoms of Southeast Asia such as Chenla may have emulated the Funanese court. The Funanese established a strong system of mercantilism and commercial monopolies that would become a pattern for empires in the region.[NEWLINE][NEWLINE]Funan''s dependence on maritime trade is seen as a cause for the beginning of Funan''s downfall. Their coastal ports allowed trade with foreign regions that funnelled goods to the north and coastal populations. However, the shift in maritime trade to Sumatra, the rise in the Srivijaya trade empire, and the taking of trade routes all throughout Southeast Asia by China, leads to economic instability in the south, and forces politics and economy northward. Funan was superseded and absorbed in the 6th century by the Khmer polity of the Chenla Kingdom.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_THIMPHU', 					'Thimphu' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_THIMPHU_ADJ', 					'Thimphu' UNION ALL
SELECT 'TXT_KEY_CIV5_THIMPHU_TEXT', 						'Since 1955 Thimphu is the capital of the Kingdom of Bhutan, a landlocked country in South Asia at the eastern end of the Himalayas. It is bordered to the north by Tibet (China), and to the south, east, and west by India. Bhutan existed as a patchwork of minor warring fiefs until the early 17th century. At that time the lama and military leader Ngawang Namgyal, the first Zhabdrung Rinpoche, who was fleeing religious persecution in Tibet, unified the area and cultivated a distinct Bhutanese identity. In the early 20th century, Bhutan came into contact with the British Empire and retained strong bilateral relations with India upon its independence.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANDORRA', 					'Andorra' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANDORRA_ADJ', 					'Andorran' UNION ALL
SELECT 'TXT_KEY_CIV5_ANDORRA_TEXT', 						'Lying on the southern slopes of the Pyrenees, the Principality of Andorra consists of a cluster of mountain valleys whose streams form the Valira River. Andorra''s independence is traditionally ascribed to Charlemagne, who recovered the region from the Muslims in 803 CE. It was placed under the joint suzerainty of the French counts of Foix and the Spanish bishops of Urgel in 1278, and it was subsequently governed jointly by the Spanish bishop of Urgel and the French head of state. This feudal system of government, the last in Europe, continued until 1993, when a constitution was adopted that transferred most of the coprinces'' powers to the Andorran General Council, which is elected by universal suffrage.[NEWLINE][NEWLINE]Andorra has long and a strong affinity with Catalonia; its institutions are based in Catalonian law, and it is part of the diocese of Urgel (Spain).[NEWLINE][NEWLINE]The traditional economy was based on sheep raising, but tourism grew in importance since the 1950s and became central to Andorra''s economy by the early 21st century.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CANOSSA', 					'Canossa' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CANOSSA_ADJ', 					'Canossan' UNION ALL
SELECT 'TXT_KEY_CIV5_CANOSSA_TEXT', 						'Canossa is a ruined 10th-century castle southwest of Reggio nell''Emilia in Italy, famous as the meeting place of Pope Gregory VII and Emperor Henry IV in 1077. The stronghold was built c. 940 by Atto Adalbert, the founder of the House of Attoni and first count of Canossa. [NEWLINE]At the invitation of Matilda, countess of Canossa (Matilda of Tuscany), a strong supporter of the papacy in the Investiture Controversy, Gregory VII stayed at the fortress in 1077 while on his way to Germany to take action against his opponent, Henry IV. To forestall his deposition, Henry journeyed to Canossa as a simple penitent and, on January 28, after waiting for three days, received absolution.[NEWLINE][NEWLINE]Though this did not mark any lasting victory for the papacy, the name Canossa became associated with the submission of the secular power to the church; hence Bismarck''s dictum, during Prussia''s Kulturkampf against Roman Catholic influences in Germany: "Nach Canossa gehen wir nicht" ("We are not going to Canossa").[NEWLINE][NEWLINE]The castle was destroyed in 1255 by the people of Reggio. Later it was returned to the Canossa family. After the death of Giberto da Correggio in 1321, it was again a possession of Reggio until 1402, when Simone, Guido and Alberto Canossa gained it back; in 1409, however, they ceded it to the House of Este, who (apart a short period under Ottavio Farnese, Duke of Parma in 1557) held it until 1796. In 1642 Francesco I d''Este, Duke of Modena and Reggio, entrusted it to the Valentini family. The latter were ousted in 1796 by the rebellious local population, who joined the Cispadane Republic. After being returned to the Valentini in 1819, in 1878 the Castle was acquired by the Italian State, and was declared a national monument.[NEWLINE][NEWLINE]The toponym "Canossa" was referring only to the ruined castle and the adjacent hamlet until 1992, when the nearby town of Ciano d''Enza changed name into Canossa to honor its historical and cultural legacy.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BEDULU', 						'Bedulu' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BEDULU_ADJ', 						'Bali' UNION ALL
SELECT 'TXT_KEY_CIV5_BEDULU_TEXT', 							'Known as "the island of a thousand temples", Bali and its history are steeped in culture and religion, being one of the last bastions of Hinduism in Indonesia.[NEWLINE][NEWLINE]Bali was inhabited around 2000 BCE by Austronesian people who migrated originally from Southeast Asia and Oceania through Maritime Southeast Asia.[NEWLINE][NEWLINE]Culturally and linguistically, the Balinese are closely related to the people of the Indonesian archipelago, Malaysia, the Philippines and Oceania. Stone tools dating from this time have been found near the village of Cekik in the island''s west. Inscriptions from 896 and 911 do not mention a king, until 914, when Sri Kesarivarma is mentioned. They also reveal an independent Bali, with a distinct dialect, where Buddhism and Shivaism were practiced simultaneously.[NEWLINE][NEWLINE]Mpu Sindok''s great-granddaughter, Mahendradatta, married the Bali king Udayana Warmadewa around 989, giving birth to Airlangga around 1001. This marriage also brought more Hinduism and Javanese culture to Bali. Princess Sakalendukirana appeared in 1098. Suradhipa reigned from 1115 to 1119, and Jayasakti from 1146 until 1150. Jayapangus appears on inscriptions between 1178 and 1181, while Adikuntiketana and his son Paramesvara in 1204.[NEWLINE][NEWLINE]Balinese culture was strongly influenced by Indian, Chinese, and particularly Hindu culture, beginning around the 1st century AD. The name Bali dwipa ("Bali island") has been discovered from various inscriptions, including the Blanjong pillar inscription written by Sri Kesari Warmadewa in 914 and mentioning Walidwipa. It was during this time that the people developed their complex irrigation system, locally called subak, to grow rice in wet-field cultivation. Some religious and cultural traditions still practiced today can be traced to this period.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DALI', 						'Yangjumie' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DALI_ADJ', 						'Dali' UNION ALL
SELECT 'TXT_KEY_CIV5_DALI_TEXT', 							'The Kingdom of Dali, which meant "the great truth" or "the great administration", was a buddhist kingdom that played a vital role in south-east asia for nearly three centuries, from the 10th to the 13th century. It was a kingdom of piety, of many temples and giant stone pagodas, and was composed not of a homogeneous people but of many people and many tribes, the largest of which being the Bai and Yi.[NEWLINE][NEWLINE]The Dali kingdom was notable for its influence in preserving and spreading Buddhism. The royal Duan clan, like that of their Nanzhao predecessors before them were devout Buddhists, and they constructed large Buddhist temples around Dali and on the Shibaoshan Mountain. These soon became centers for Buddhist teaching. Here the Kings attempted to model themselves on the models of the Buddhist- divine kings of the nearby South East Asian kingdoms.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MULTAN', 						'Multan' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MULTAN_ADJ', 						'Ghaznavid' UNION ALL
SELECT 'TXT_KEY_CIV5_MULTAN_TEXT', 							'Multan is a city in the Punjab Province of Pakistan, and capital of Multan District. It is located in the southern part of the province, and is steeped in history. It has a population of over 3.8 million (according to 1998 census), making it the sixth largest city in Pakistan. It is built just east of the Chenab River, more or less in the geographic center of the country and about 966 km from Karachi.[NEWLINE][NEWLINE]Multan is known as the "City of Pirs and Shrines", and is a prosperous city of bazaars, mosques and superbly designed tombs. The Multan International Airport connects flights to major cities in Pakistan and to cities in the Persian Gulf. The city''s industries include metal working, flour, sugar, oil milling, textiles manufacturing, fertilizer, soap, and glass. Multan is also known for its handicrafts, especially pottery and enamel work.[NEWLINE][NEWLINE]One of the subcontinent''s oldest cities, Multan derives its name from an idol in the temple of the sun god, a shrine of the pre-Muslim period.[NEWLINE][NEWLINE]The city was conquered (c. 326 BC) by Alexander the Great, visited (AD 641) by the Chinese Buddhist scholar Hsüan-tsang, taken (8th cent.) by the Arabs, and captured by Muslim Turkish conqueror Mahmud of Ghazna in 1005 and by Timur in 1398. In the 16th and 17th century, Multan enjoyed peace under the rule of Mughal emperors. In 1818, the city was seized by Ranjit Singh, leader of the Sikhs. The British held it from 1848 until Pakistan achieved independence in 1947. Landmarks include an old fort containing the 14th-century tombs of two Muslim saints.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BAGAN', 						'Pagan' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BAGAN_ADJ', 						'Burmese' UNION ALL
SELECT 'TXT_KEY_CIV5_BAGAN_TEXT', 							'The kingdom grew out of a small 9th-century settlement at Pagan (present-day Bagan) by the Mranma/Burmans, who had recently entered the Irrawaddy valley from the Kingdom of Nanzhao. Over the next two hundred years, the small principality gradually grew to absorb its surrounding regions until the 1050s and 1060s when King Anawrahta founded the Pagan Empire, for the first time unifying under one polity the Irrawaddy valley and its periphery. By the late 12th century, Anawrahta''s successors had extended their influence farther to the south into the upper Malay peninsula, to the east at least to the Salween river, in the farther north to below the current China border, and to the west, in northern Arakan and the Chin Hills. In the 12th and 13th centuries, Pagan, alongside the Khmer Empire, was one of two main empires in mainland Southeast Asia. The kingdom went into decline in the mid-13th century as the continuous growth of tax-free religious wealth by the 1280s had severely affected the crown''s ability to retain the loyalty of courtiers and military servicemen. This ushered in a vicious circle of internal disorders and external challenges by the Arakanese, Mons, Mongols and Shans. Repeated Mongol invasions (1277-1301) toppled the four-century-old kingdom in 1287. The collapse was followed by 250 years of political fragmentation that lasted well into the 16th century.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_RISHIKESH', 					'Rishikesh' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_RISHIKESH_ADJ', 					'Garhwal' UNION ALL
SELECT 'TXT_KEY_CIV5_RISHIKESH_TEXT', 						'Known as the "Gateway to the Garhwal Himalayas" and "Yoga Capital of the World", Rishikesh, also spelt as Hrishikesh, is a city near Dehradun in Dehradun district of the Indian state Uttarakhand. It is situated on the right bank of the Ganges River and is a pilgrimage town for Hindus, with ancient sages and saints meditating here in search of higher knowledge. There are numerous temples and ashrams built along the banks of the river.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUTITJULU', 					'Mutitjulu' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUTITJULU_ADJ', 					'Anangu' UNION ALL
SELECT 'TXT_KEY_CIV5_MUTITJULU_TEXT', 						'"Anangu" is an umbrella term that describes several Australian Aboriginal groups who speak Western Desert languages; the term is most prominently used by the Pitjantjatjara and the Yankunytjatjara. The Western Desert languages have been described as covering more of Australia''s area than any other indigenous language.[NEWLINE][NEWLINE]Uluru and Kata Tjuta are sacred sites in the Anangu belief system, with eleven songlines passing through or near them. In 1979, the indigenous Central Land Council began a legal battle to lay claim to the Uluru-Kata Tjuta National Park; in 1985, the resulting settlement plan was implemented, which granted the Anangu a majority of the park''s Board of Management but still allowed tourists to visit the park.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ISKANWAYA', 					'Iskanwaya' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ISKANWAYA_ADJ', 					'Kallawaya' UNION ALL
SELECT 'TXT_KEY_CIV5_ISKANWAYA_TEXT', 						'Iskanwaya is a pre-Columbian sacred site, situated on a mountain ridge above the Llica River in Bolivia, 325 km north of La Paz. In its extension and its age Iskanwaya surpasses Machu Picchu in Peru, but it is less well preserved. The Iskanwaya ruins go back to the Mollo culture which predated the Inca civilization and whose people presumably built the constructions as early as 800 BC or in their prime cultural period from 1145 to 1425.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TIWANAKU', 					'Tiwanaku' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TIWANAKU_ADJ', 					'Tiwanaku' UNION ALL
SELECT 'TXT_KEY_CIV5_TIWANAKU_TEXT', 						'Tiwanaku (Spanish: Tiahuanaco and Tiahuanacu) is a Pre-Columbian archaeological site in western Bolivia, South America. It is the capital of an empire that extended into present-day Peru and Chile, flourishing from AD 300 to AD 1000. Tiwanaku is recognized by Andean scholars as one of the most important civilizations prior to the Inca Empire; it was the ritual and administrative capital of a major state power for approximately five hundred years. The ruins of the ancient city state are near the south-eastern shore of Lake Titicaca in the La Paz Department, Ingavi Province, Tiwanaku Municipality, about 72 km (45 mi) west of La Paz.49 while searching for the Inca capital Qullasuyu.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DANO', 						'Dano' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DANO_ADJ', 						'Dagara' UNION ALL
SELECT 'TXT_KEY_CIV5_DANO_TEXT', 							'Dano is the capital of the Ioba province in Burkina Faso. It is a small town with a market for weaving and pottery and is home to the Dagara people, whose traditional cosmology and ritual practices have persisted in spite of colonial Christian influences. These practices involve communing with elemental powers, channeling otherworldly beings, and performing divination with cowrie shells.[NEWLINE][NEWLINE]Dagara settlements occupy an area of about 3,500 square kilometres in south-western Burkina Faso and roughly the same area in north-western Ghana. The political and social organization of the Dagara is based on the "tengan system", i.e. a network of earth shrines that identify, delimit and spiritually protect Dagara communities.[NEWLINE][NEWLINE]Earth shrines are sacrificial sites, mostly consisting of stones under a large tree, which, according to the norms, must be erected by the first settlers to arrive in an area. At an earth shrine, sacrifices are made to the earth god held responsible for the fertility of women and the soil and for the peace of a particular area. Ritual control of the earth shrine simultaneously implies the right to distribute land and demand contributions for the required sacrifices. The earth priests, that is the sacrificers responsible for the shrine, thus distribute land to later settlers and regulate the access to other resources, sometimes in exchange for quite substantial gifts, and the late-comers must also request the earth priest''s permission to build houses and bury their dead.[NEWLINE][NEWLINE]In the non-centralized societies of the region, the earth priest, called tengansob or tindana, fulfilled the role of community elder, and during the pre-colonial period was the only local figure of authority. According to the tradition, the office of earth priest goes to the founder of the settlement or to one of his descendants within the same clan.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KARYES', 						'Karyes' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KARYES_ADJ', 						'Athonite' UNION ALL
SELECT 'TXT_KEY_CIV5_KARYES_TEXT', 							'The monastic community of Mount Athos is an Eastern Orthodox community of monks in Greece who hold the status of an autonomous region as well as the combined rights of a decentralized administration, a region and a municipality, with a territory encompassing the distal part of the Athos peninsula including Mount Athos. The bordering proximal part of the peninsula belongs to the regular Aristotelis community in Central Macedonia.[NEWLINE][NEWLINE]Organized monastic life began there in 963, when St. Athanasius the Athonite founded the first monastery. By 1400 there were 40 monasteries. Long regarded as the holy mountain of the Greek Orthodox Church, it was declared a theocratic republic in 1927. The Athonite monasteries feature a rich collection of well-preserved artifacts, rare books, ancient documents, and artworks of immense historical value, and Mount Athos has been listed as a World Heritage Site since 1988.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SGANG_GWAAY', 				'SGang Gwaay' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SGANG_GWAAY_ADJ', 				'Haida' UNION ALL
SELECT 'TXT_KEY_CIV5_SGANG_GWAAY_TEXT', 					'One of the many indigenous tribes of North America, the Haida stand apart as an island people. Related to the Tlingit and Tsimshian peoples, Haida society was organised around a clan system with stratified ranks of noble, commoner and slave. There were two major clans, determined through the maternal line. These clans were then subdivided into lineages.[NEWLINE][NEWLINE]The Haida are especially talented woodworkers, weavers and sailors; they have been credited with the first use of the totem pole. While their maritime behaviour lead them to establish many peaceful trade routes with the colonialists, locally they were feared warriors who practised slavery. For this reason they have often been called "the Vikings of North America".[NEWLINE][NEWLINE]Today the Haida reserves on the main island of Haida Gawaii have banded together to create the Council of the Haida Nation. They are experiencing a cultural resurgence.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NYARYANA_MARQ', 				'Nyar''yana Marq' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NYARYANA_MARQ_ADJ', 				'Nenet' UNION ALL
SELECT 'TXT_KEY_CIV5_NYARYANA_MARQ_TEXT', 					'The Nenets, also known as the Samoyeds, are an indigenous people in northern arctic Russia. According to the latest census in 2010, there are 44,857 Nenets in the Russian Federation, most of them living in the Yamalo-Nenets Autonomous Okrug and Nenets Autonomous Okrug. They speak either the Tundra or Forest varieties of Nenets. The literal morphs samo and yed in Russian convey the meaning "self-eater", which appears as derogatory. Therefore, the name Samoyed quickly went out of usage in the 20th century, and the people bear the name of Nenets, which means "man".' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ADEJE', 						'Adeje' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ADEJE_ADJ', 						'Guanche' UNION ALL
SELECT 'TXT_KEY_CIV5_ADEJE_TEXT', 							'The Guanches were the indigenous inhabitants of the Canary Islands in the Atlantic Ocean some 100 kilometres (60 mi) west of the North African coast. They spoke the Guanche language, which went extinct in the 17th century and is believed to have been related to Berber languages. It is believed that they may have arrived on the archipelago some time in the first millennium BC.[NEWLINE][NEWLINE]The Guanches were the only native people known to have lived in the Macaronesian archipelago region before the arrival of Europeans, as there is no accepted evidence that the other Macaronesian archipelagos (the Cape Verde Islands, Madeira and the Azores) were inhabited. After the Spanish conquest of the Canaries starting in the early 15th century, many natives were wiped out by the Spanish conquerors while the rest assimilated over time into the settler population and culture, although elements of their original culture survive within Canarian customs and traditions, such as Silbo (the whistled language of La Gomera Island), as well as some lexicon of Canarian Spanish.[NEWLINE][NEWLINE]Some scholars have classified the destruction of the Guanche people and culture as an early example of colonial genocide. In 2017, the first genome-wide data from the Guanches confirmed a North African origin and that they were genetically most similar to ancient North African Berber peoples of the nearby North African mainland.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_WOOTEI_NIICIE', 				'Wootei-niicie' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_WOOTEI_NIICIE_ADJ', 				'Arapaho' UNION ALL
SELECT 'TXT_KEY_CIV5_WOOTEI_NIICIE_TEXT', 					'Around 3,000 years ago, the ancestral Arapaho-speaking people, the Heeteinono''eino'' lived in the western Great Lakes region along the Red River Valley in what is classified as present-day Manitoba, Canada and Minnesota, United States. There the Arapaho were an agricultural people who grew crops, including maize.[NEWLINE][NEWLINE]Following European colonization in eastern Canada, together with the early Cheyenne people, the Hitesiino'', the Arapaho were forced to migrate westward onto the eastern Great Plains by the Ojibwe. They were numerous and powerful, having obtained guns from their French trading allies. The ancestors of the Arapaho people entered the Great Plains the western Great Lakes region sometime before 1700. During their early history on the plains, the Arapaho lived on the northern plains from the South Saskatchewan River in Canada south to Montana, Wyoming, and western South Dakota.[NEWLINE][NEWLINE]Before the Arapaho acquired horses, they used domestic dogs as pack animals to pull their travois. The Arapaho acquired horses in the early 1700s from other tribes, which changed their way of life. They became a nomadic people, using the horses as pack and riding animals. They could transport greater loads and travel more easily by horseback to hunt more easily and widely, increasing their success in hunting on the Plains. Gradually, the Arapaho moved farther south, split into the closely allied Northern and Southern Arapaho, and established a large joint territory spanning land in southern Montana, most of Wyoming, the Nebraska Panhandle, central and eastern Colorado, western Oklahoma, and extreme western Kansas.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DAKKAR', 						'Dakkar' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DAKKAR_ADJ', 						'Adalite' UNION ALL
SELECT 'TXT_KEY_CIV5_DAKKAR_TEXT', 							'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONIARA', 					'Honiara' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONIARA_ADJ', 					'Solomonian' UNION ALL
SELECT 'TXT_KEY_CIV5_HONIARA_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KARASJOHKA', 					'Karasjohka' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KARASJOHKA_ADJ', 					'Sami' UNION ALL
SELECT 'TXT_KEY_CIV5_KARASJOHKA_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KATENDE', 					'Katende' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KATENDE_ADJ', 					'Luba' UNION ALL
SELECT 'TXT_KEY_CIV5_KATENDE_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LAHORE', 						'Lahore' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LAHORE_ADJ', 						'Punjabi' UNION ALL
SELECT 'TXT_KEY_CIV5_LAHORE_TEXT', 							'Lahore is, today, a major world city, and a commercial and cultural center in the Punjab region, an arid stretch south of the Himalayas and split between India and Pakistan. The city played significant roles in the Mughal Empire, the short-lived Sikh Empire, British India, and is presently the second largest city in Pakistan. In addition to its importance as a crossroads of inland trade routes across Asia, Lahore remains a significant cultural capital for Pakistan and beyond.[NEWLINE][NEWLINE]Lahore was likely first settled in the first millennium A.D., but its real height came during the Mughal Empire, that remnant of the Mongol hordes that converted to Islam, settled, became acculturated, and ruled South Asia from the 16th century to the 19th. Mughal rulers built lavishly in Lahore, including the massive gates at the roads leading out of the city and its holy sites: saints’ graves and royal mosques. By the 18th century, Lahore’s wealth became world-famous; Lahore even secures a mention in Milton’s Paradise Lost as a city of wealth and power, "the Seat of the Great Mughal", revealed to Milton’s Adam as a wonder of the earth. Other British writers were similarly enamored of the city: the colonial British author Rudyard Kipling describes Lahore as "full of beauty even when the noonday heat silences the voices of men and puts the pigeons of the mosque to sleep," and raptured at having seen Lahore’s great, Armenian-made "Zam-Zammeh" cannon as a child.Nagazargamu (or Gazargamo) was the capital of the Kanem-Bornu Empire, which existed in for five hundred years in what is today northeastern Nigeria, controlling the region around Lake Chad. This Islamic kingdom grew rich through trade networks in the north of Africa, and much of what we know about it comes through records of Arabic writers. At its height, it had a population of about 20,000.[NEWLINE][NEWLINE]The city was established by Ali Dunamami of the Sefuwa Dynasty, around 1460 as part of the rise of the Bornu kingdom. The land around their new capital was rich, agricultural and pastoral land, and the Bornu used this prosperity to launch a campaign to reconquer lands they had previously ruled in the old Kanem empire.[NEWLINE][NEWLINE]King Idris Alauma (reign 1564 - 1596) was perhaps the most effective ruler of Kanem-Bornu, embarking on a series of military reforms, including the introduction of Ottoman-trained musketeers to his army, as well as employing mercenary Berber camel cavalry and Kotoko marines to the already-formidable cavalry of the kingdom. He established trade relations with Morocco, Egypt, and the Ottoman court (who paid him the compliment of a large ambassadorial delegation.) His chroniclers praised his victories in over a thousand battles and three hundred wars. Alauma is also credited with economic reforms, such as standardized measures in trade, and legal reforms in accord with Islamic jurisprudence.[NEWLINE][NEWLINE]The city was besieged and destroyed in 1809 during the Fulani jihad. Today the ruins of the city are still visible, and there is some interest in rebuilding this once-mighty capital into a new, modern city. [NEWLINE][NEWLINE]As the Mughal Empire went into decline, new powers arose in the region and fought over Punjab. First to take Lahore were the Hindu armies of the Maratha, who took the city from the Mughals in 1758. But the Maratha were not as long-lived as the Mughals, and Lahore again changed hands, falling to Sikh and Afghan forces. In 1799, the city became the seat of the Sikh Empire under Ranjit Singh. Singh, the "Lion of Punjab", sought to build a new army for a new empire, and in so doing reached out both to international and local sources of power, bringing soldiers from Napoleon’s army to train his troops and co-opting the fierce Nihang warrior-priests into his forces. But the Sikh empire could not last without Singh, and after Singh’s death the region was entirely annexed into the British empire.[NEWLINE][NEWLINE]Lahore under the British saw the development of an entirely new quarter of the city, as colonial officials abandoned the Mughal district for new construction. Punjab, for the British, presented some problems: it was close to a fractious frontier and away from the ports where the British concentrated. And, indeed, Lahore became an important center for the Indian independence movement as, in 1929, the site where Pandit Nehru declared "complete independence" from Britain and raised the Indian tricolor flag.[NEWLINE][NEWLINE]But after independence came the bloody affair of partition. As Pakistan, declaring itself a Muslim nation, split from India, riots erupted. Hindus and Muslims killed each other in a frenzy of mass violence. Lahore was no exception, and saw the widespread slaughter of Hindus. Indira Kumar, a Hindu resident of Lahore, wondered as she, as a child, fled into the mountains from the violence, "What price Freedom and to what end?"[NEWLINE][NEWLINE]The end of partition did not mean the end of violence. Lahore was damaged during another bout of violence, as India and Pakistan fought again in 1965. Today, Lahore persists. It is the capital of Pakistani Punjab, and hosts over 10 million residents.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OUIDAH', 						'Ouidah' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OUIDAH_ADJ', 						'Ouidah' UNION ALL
SELECT 'TXT_KEY_CIV5_OUIDAH_TEXT', 							'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PELYM', 						'Pelym' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PELYM_ADJ', 						'Permian' UNION ALL
SELECT 'TXT_KEY_CIV5_PELYM_TEXT', 							'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_POKROVKA', 					'Daergaevs' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_POKROVKA_ADJ', 					'Massagetaen' UNION ALL
SELECT 'TXT_KEY_CIV5_POKROVKA_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SARNATH', 					'Sarnath' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SARNATH_ADJ', 					'Mauryan' UNION ALL
SELECT 'TXT_KEY_CIV5_SARNATH_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SUCEAVA', 					'Suceava' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SUCEAVA_ADJ', 					'Moldovian' UNION ALL
SELECT 'TXT_KEY_CIV5_SUCEAVA_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TBILISI', 					'Tbilisi' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TBILISI_ADJ', 					'Georgian' UNION ALL
SELECT 'TXT_KEY_CIV5_TBILISI_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANAA', 						'Sanaa' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANAA_ADJ', 						'Yemenian' UNION ALL
SELECT 'TXT_KEY_CIV5_SANAA_TEXT', 							'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_JUYUBIT', 					'Juyubit' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_JUYUBIT_ADJ', 					'Tongva' UNION ALL
SELECT 'TXT_KEY_CIV5_JUYUBIT_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANANGULA', 					'Anangula' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANANGULA_ADJ', 					'Aleutic' UNION ALL
SELECT 'TXT_KEY_CIV5_ANANGULA_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LONGYAN', 					'Longyan' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LONGYAN_ADJ', 					'Hakkan' UNION ALL
SELECT 'TXT_KEY_CIV5_LONGYAN_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AYUTTHAYA', 					'Ayutthaya' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AYUTTHAYA_ADJ', 					'Ayutthaya' UNION ALL
SELECT 'TXT_KEY_CIV5_AYUTTHAYA_TEXT', 						'As the Khmer Empire declined in the 14th century, the lands that it dominated started to assert themselves. In the Chao Phraya valley, in modern-day Thailand, a series of Theravada Buddhist city-states called "mueang", populated by Thai-speaking and Lao-speaking peoples, began to split off from the Khmer, asserting their own linguistic and cultural independence while retaining the religion, royal traditions, and many other cultural and legal features of the Khmer. Mueang were "mandala states", kingdoms without defined borders but centered on a city that stressed beauty, artistic achievements, and cosmopolitan outlook - think of countries in that time not as the bounded puzzle pieces we see on a map today (or the bordered civilizations in your current game), but as magnets, drawing in people and power from the landscape. Power and profits came via royal monopolies on certain goods - especially porcelain or incense (the name of Vientiane, a Lao "mueang" from the same time, means "city of sandalwood").[NEWLINE][NEWLINE]Once the mueang were free of the Khmer, they made war on each other. And, through the course of the 14th and 15th centuries, one became dominant. Ayutthaya, named after the city in the Hindu epic Ramayana (Ramakien, in Thai), became first the center of the Chao Phraya river plain, and, later, a significant power in mainland Southeast Asia, one that European travelers compared with India and China. In the course of its rise, Ayutthaya struggled diplomatically and militarily with its neighbors, especially the Burmese, who conquered Ayutthaya in the 1500s, but were rebuffed by the ambitious warrior-king Naresuan. Ayutthaya could also be the aggressor: at its height, Cambodia, parts of Malaysia, and Laos were controlled by the kings of Ayutthaya.[NEWLINE][NEWLINE]The city flourished in the 1600s, and the kingdom was called by some travelers a name we might find more familiar - Siam (itself derived from a Khmer word, or possibly a Chinese term). The kings of Ayutthaya were curious about the world and open to it, and employed Japanese, Arab, and European councilors to help them navigate the tricky realm of international diplomacy. The city itself, situated on an island in the middle of the Chao Phraya river, was large for the time, with about a quarter million residents, and had a cosmopolitan, polyglot nature - communities of Japanese, Chinese, and Europeans were established in the city and mingled with the locals. Gender roles, too, were relatively progressive in comparison with East Asia, South Asia, or Europe. One Chinese traveler remarked that "it is [Siamese] custom that all affairs are managed by their wives", and Alexander Hamilton noted that the "Women in Siam are the only Merchants in buying Goods".[NEWLINE][NEWLINE]Ayutthaya did not decline; it crashed. Specifically, it crashed against the Burmese army, yet again. In 1767, the Burmese sacked Ayutthaya and destroyed it, carrying off the gold of its temples, many of its skilled artisans, and putting most of the city to the torch. Siam reformed some years later further south, in a city called (in part) Krung Thep, a city known to foreigners as Bangkok. Today, Siam - Thailand - remains the only country in the region not to be formally colonized by a European power. ' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PALMYRA', 					'Palmyra' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PALMYRA_ADJ', 					'Palmyrene' UNION ALL
SELECT 'TXT_KEY_CIV5_PALMYRA_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AL_TIRABIN', 					'Al-Tirabin' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AL_TIRABIN_ADJ', 					'Bedouin' UNION ALL
SELECT 'TXT_KEY_CIV5_AL_TIRABIN_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HANUABADA', 					'Hanuabada' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HANUABADA_ADJ', 					'Motu' UNION ALL
SELECT 'TXT_KEY_CIV5_HANUABADA_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BALKH', 						'Bactra' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BALKH_ADJ', 						'Bactrian' UNION ALL
SELECT 'TXT_KEY_CIV5_BALKH_TEXT', 							'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_IRUNEA', 						'Donostia' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_IRUNEA_ADJ', 						'Iruñean' UNION ALL
SELECT 'TXT_KEY_CIV5_IRUNEA_TEXT', 							'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SADDARVAZEH', 				'Saddarvazeh' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SADDARVAZEH_ADJ', 				'Achaemenid' UNION ALL
SELECT 'TXT_KEY_CIV5_SADDARVAZEH_TEXT', 					'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_JETARKTE', 					'Jetarkte' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_JETARKTE_ADJ', 					'Kaweskar' UNION ALL
SELECT 'TXT_KEY_CIV5_JETARKTE_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MBABANE', 					'Mbabane' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MBABANE_ADJ', 					'Eswatinian' UNION ALL
SELECT 'TXT_KEY_CIV5_MBABANE_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TUNIS', 						'Tunis' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TUNIS_ADJ', 						'Tunisian' UNION ALL
SELECT 'TXT_KEY_CIV5_TUNIS_TEXT', 							'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MENDYARRUP', 					'Mendyarrup' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MENDYARRUP_ADJ', 					'Noongar' UNION ALL
SELECT 'TXT_KEY_CIV5_MENDYARRUP_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ISHIYAMA', 					'Ishiyama' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ISHIYAMA_ADJ', 					'Ikko-ikki' UNION ALL
SELECT 'TXT_KEY_CIV5_ISHIYAMA_TEXT', 						'TODO';

INSERT INTO Language_en_US (Tag, Text)
-- abilities
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ADEJE', 				'[COLOR_MAGENTA]Benesmer:[ENDCOLOR] Player can place a [ICON_RES_DOGO_CANARIO] [COLOR_GREY]Dogo Canario[ENDCOLOR] resource on Hills with [COLOR_CITY_BLUE]Plains[ENDCOLOR] or [COLOR_CITY_BLUE]Grassland[ENDCOLOR] (not adjacent) ([ICON_FOOD], [ICON_PRODUCTION], [ICON_GOLD], [ICON_CULTURE], [ICON_PEACE]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ALMATY', 				'[COLOR_MAGENTA]Almatu:[ENDCOLOR] [ICON_TRADE] City Connections and International [ICON_CARAVAN] Land Trade Routes generate +1 [ICON_RESEARCH] Science. Player gains +1 [ICON_INFLUENCE] Influence per turn with Afraid [ICON_CITY_STATE] City-States.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AL_TIRABIN', 			'[COLOR_MAGENTA]Asa''ir:[ENDCOLOR] +1 [ICON_INTERNATIONAL_TRADE] Trade Route per 2 Eras. Player can build a [COLOR_CITY_BROWN]Buryuut Hajar[ENDCOLOR] improvement on [COLOR_CITY_BLUE]Desert[ENDCOLOR] not adjacent to a City (not adjacent) ([ICON_FOOD], [ICON_PRODUCTION], [ICON_GOLD], [ICON_CULTURE]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AMBRACIA', 			'[COLOR_MAGENTA]Pyrrhic War:[ENDCOLOR] +10% [ICON_WAR] Militaristic [ICON_CITY_STATE] City-State Gift Rate. [COLOR_YIELD_GOLD]Land Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Mercenaries of Pyrrhus[ENDCOLOR] promotion (Unit gains +5% [ICON_PRODUCTION], if it [COLOR:255:230:85:255]is Garrisoned on Land[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANANGULA', 			'[COLOR_MAGENTA]Untold Stories:[ENDCOLOR] +10% International [ICON_CARGO_SHIP] Sea Trade Route Maximum Range. International [ICON_CARGO_SHIP] Sea Trade Routes gain +1 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture. Unit''s death grants 1 [ICON_CULTURE] Culture in each City, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 			'[COLOR_MAGENTA]Pyrenean Paréage:[ENDCOLOR] +1 [ICON_TOURISM] Tourism for every [COLOR_CITY_BLUE]Mountain[ENDCOLOR] tile within their workable radius. -10% [ICON_HAPPINESS_3] Boredom in Cities with [COLOR_CITY_BLUE]Mountains[ENDCOLOR] nearby.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANTANANARIVO', 		'[COLOR_MAGENTA]Libertalia:[ENDCOLOR] Player can see all Barbarian Encampments. Units gain [COLOR_WATER_TEXT]Pirate Haven[ENDCOLOR] promotion (Unit gains [ICON_GOLD] [COLOR:255:230:85:255]on Kill[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 			'[COLOR_MAGENTA]Economic Prominence:[ENDCOLOR] Merchants gain +1 [ICON_GOLD] Gold. -10% [ICON_GOLD] Gold Purchase Cost.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ARMAGH', 				'[COLOR_MAGENTA]Patron of Saints:[ENDCOLOR] Player can purchase [COLOR_YIELD_FOOD]Irish Saints[ENDCOLOR] (as buildings) with [ICON_PEACE] Faith (requires a Majority Religion). Saints help with [ICON_HAPPINESS_1] Happiness management and provide some yields. You can choose only one Saint out of four possible in each City.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AUCKLAND', 			'[COLOR_MAGENTA]City of Sails:[ENDCOLOR] Coastal Cities gain +3 [ICON_FOOD] Food. [COLOR_YIELD_GOLD]Land Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Peaceful Resistance[ENDCOLOR] promotion (Unit generates [ICON_FOOD] and [ICON_GOLDEN_AGE], if it [COLOR:255:230:85:255]is Garrisoned on Land[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AYUTTHAYA', 			'[COLOR_MAGENTA]Mueang:[ENDCOLOR] Each War declaration to a Player grants 50 [ICON_GREAT_GENERAL] Great General Points. Each War declaration by a Player grants 10 [ICON_PRODUCTION] Production, scaling with Era, in all Cities. Building construction grants [ICON_CULTURE] Culture equal to 5% of its value.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BAGAN', 				'[COLOR_MAGENTA]Land of Thousand Pagodas:[ENDCOLOR] [COLOR_YIELD_FOOD]Temples[ENDCOLOR] gain +1 [ICON_HAPPINESS_1] Happiness. Building construction grants 10 [ICON_PEACE] Faith.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BALKH', 				'[COLOR_MAGENTA]The Unconquered:[ENDCOLOR] Player can build a [COLOR_CITY_BROWN]Phroúrion[ENDCOLOR] improvement adjacent to [COLOR_POSITIVE_TEXT]Fresh Water[ENDCOLOR] and not adjacent to a City (not adjacent) ([ICON_FOOD], [ICON_PRODUCTION], [ICON_GOLD], [ICON_GOLDEN_AGE], [ICON_GREAT_GENERAL]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BEDULU', 				'[COLOR_MAGENTA]Isle of Gods:[ENDCOLOR] Cities gain +1 [ICON_PEACE] Faith for every 2 worked [COLOR_CITY_GREEN]Jungle[ENDCOLOR] tiles. Each [ICON_CITY_STATE] City-State Alliance grants +1 [ICON_PEACE] Faith and +1 [ICON_GOLDEN_AGE] Golden Age Points to all Cities. International [ICON_CARGO_SHIP] Sea Trade Routes generate +2 [ICON_PEACE] Faith.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BELGRADE', 			'[COLOR_MAGENTA]Balkan Powder Keg:[ENDCOLOR] Cities gain +10% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Siege Units[ENDCOLOR]. [COLOR_YIELD_GOLD]Siege Units[ENDCOLOR] gain [COLOR_WATER_TEXT]The White Fortress[ENDCOLOR] promotion (+25[ICON_PLUS]Total HP).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BOGOTA', 				'[COLOR_MAGENTA]United Independence:[ENDCOLOR] Capturing a City grants 30 [ICON_CULTURE] Culture, scaling with Era. Liberating a City grants 20-30 [ICON_CULTURE] Culture, scaling with Era and owned Cities (caps at 6 Cities).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BRATISLAVA', 			'[COLOR_MAGENTA]Heart of Slavic Culture:[ENDCOLOR] [COLOR_YIELD_FOOD]Guilds[ENDCOLOR] gain +2 [ICON_CULTURE] Culture and +1 [ICON_TOURISM] Tourism.  When you are Allied with a [ICON_CITY_STATE] City-State, a random [ICON_GREAT_PEOPLE] [COLOR_CITY_GOLD]Great Person[ENDCOLOR] is given every couple of turns.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BRUSSELS', 			'[COLOR_MAGENTA]Home of the Marsh:[ENDCOLOR] [COLOR_CITY_GREEN]Marshes[ENDCOLOR] gain +1 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture. Player can build [COLOR_CITY_GREEN]Marshes[ENDCOLOR] on coastal tiles ([ICON_FOOD]). [COLOR_YIELD_GOLD]Land Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Watringue[ENDCOLOR] promotion (Bonus[ICON_MOVES]Movement Point[COLOR:255:230:85:255] after crossing Rivers[ENDCOLOR]. Double[ICON_MOVES]Movement [COLOR:255:230:85:255]on Marsh[ENDCOLOR])[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUCHAREST', 			'[COLOR_MAGENTA]Curtea Veche:[ENDCOLOR] [ICON_GREAT_WORK] Great Works gain +1 [ICON_CULTURE] Culture. Player gains +25% [ICON_TOURISM] Tourism from Historic Events.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUDAPEST', 			'[COLOR_MAGENTA]Pearl of Danube:[ENDCOLOR] [ICON_RES_HORSE] [COLOR_GREY]Horses[ENDCOLOR] gain +1 [ICON_GOLDEN_AGE] Golden Age Point. Player receives +5 [ICON_RES_HORSE] [COLOR_GREY]Horses[ENDCOLOR] (can be traded and they are counted toward Monopolies).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUENOS_AIRES', 		'[COLOR_MAGENTA]Vox Populi:[ENDCOLOR] +1 [ICON_HAPPINESS_1] Happiness per each unique owned [COLOR_GREY]Luxury Resource[ENDCOLOR].[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BYBLOS', 				'[COLOR_MAGENTA]Byblos Cedar:[ENDCOLOR] [COLOR_CITY_BROWN]Fishing Boats[ENDCOLOR] gain +1 [ICON_FOOD] Food. Cities gain +5% [ICON_PRODUCTION] Production towards [ICON_WONDER] World Wonders and all Naval Units.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CAHOKIA', 			'[COLOR_MAGENTA]Monks Mound:[ENDCOLOR] Player can build a [COLOR_CITY_BROWN]Mound[ENDCOLOR] improvement (not adjacent) ([ICON_GOLD], [ICON_RESEARCH], [ICON_PEACE], [ICON_GOLDEN_AGE], [ICON_GREAT_GENERAL], [ICON_STRENGTH]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 			'[COLOR_MAGENTA]Ardent Flame in Pious Heart:[ENDCOLOR] [COLOR_YIELD_GOLD]Civil Servants[ENDCOLOR] gain +1 [ICON_PEACE] Faith. +1 [ICON_DIPLOMAT] Great Diplomat Point, if City has a [COLOR_YIELD_FOOD]Temple[ENDCOLOR].[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 			'[COLOR_MAGENTA]Cape of Good Hope:[ENDCOLOR] +10% [ICON_INTERNATIONAL_TRADE] Trade Route Maximum Range. Finishing a [ICON_INTERNATIONAL_TRADE] Trade Route grants 20-40 [ICON_GOLD] Gold, scaling up with the Destination City''s [ICON_CITIZEN] Population and down with the actual number of active [ICON_INTERNATIONAL_TRADE] Trade Routes.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 				'[COLOR_MAGENTA]Amellrutaq:[ENDCOLOR] +1 [ICON_FOOD] Food for every 3 worked [COLOR_CITY_BLUE]Tundra[ENDCOLOR] tiles, or 3 [COLOR_CITY_BLUE]Snow[ENDCOLOR] tiles within workable radius. Cities gain +10% [ICON_CULTURE_LOCAL] Border Growth Rate. Cities gain -1 [ICON_HAPPINESS_3] Unhappiness from Distress.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CLERMONT', 			'[COLOR_MAGENTA]Crusade:[ENDCOLOR] Newly-produced [COLOR_YIELD_GOLD]Melee[ENDCOLOR] and [COLOR_YIELD_GOLD]Gunpowder Units[ENDCOLOR] gain a random promotion after their first combat (out of 6). [COLOR_YIELD_GOLD]Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Crusader''s Zeal[ENDCOLOR] promotion (+15% XP [COLOR:255:230:85:255]on Fight[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_COLOMBO', 			'[COLOR_MAGENTA]Home of Cinnamon:[ENDCOLOR] [COLOR_CITY_GREEN]Forests[ENDCOLOR] and [COLOR_CITY_GREEN]Jungles[ENDCOLOR] gain +1 [ICON_GOLD] Gold. Player allied with [COLOR_CYAN]Colombo[ENDCOLOR] heals all his units by 10 HP each time the [ICON_INTERNATIONAL_TRADE] Trade Route originated from a City owned by that Player finishes.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DAKKAR', 				'[COLOR_MAGENTA]The Conquest of Abyssinia:[ENDCOLOR] Each unit gift to a [ICON_CITY_STATE] City-State grants additional 20 [ICON_INFLUENCE] Influence. [COLOR_YIELD_GOLD]Units Gifted[ENDCOLOR] to a [ICON_CITY_STATE] City-State gain [COLOR_WATER_TEXT]Futuh Al-Habash[ENDCOLOR] promotion (+5 [ICON_STRENGTH] CS and/or +5 [ICON_RANGE_STRENGTH] RCS).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DALI', 				'[COLOR_MAGENTA]Tea Horse Road:[ENDCOLOR] Player can purchase [ICON_CARAVAN] [COLOR_YIELD_GOLD]Caravans[ENDCOLOR] with [ICON_PEACE] Faith. All [ICON_INTERNATIONAL_TRADE] Trade Routes gain +10% [ICON_PEACE] Religious Presure.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DANO', 				'[COLOR_MAGENTA]Tendaalun:[ENDCOLOR] [COLOR_YIELD_FOOD]Shrines[ENDCOLOR] gain +2 [ICON_CULTURE_LOCAL] Border Growth Points. -10% [ICON_CULTURE] Tile Culture Expansion Cost in all Cities. Border expansion grants 3 [ICON_PEACE] Faith, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DJIBOUTI', 			'[COLOR_MAGENTA]Urheimat:[ENDCOLOR] [COLOR_YIELD_FOOD]Granaries[ENDCOLOR] gain +1 [ICON_CULTURE] Culture. Cities gain +80% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Settlers[ENDCOLOR] and +100% [ICON_PRODUCTION] Production towards [COLOR_YIELD_FOOD]Granaries[ENDCOLOR].[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 				'[COLOR_MAGENTA]Abode of Peace:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] International Trade Routes grant +1 [ICON_GOLD] Gold to both: Origin and Destination City. International [ICON_CARGO_SHIP] Sea Trade Routes generate +1 [ICON_TOURISM] Tourism. [COLOR_YIELD_GOLD]Civilian Naval Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Sail in the Wilderness[ENDCOLOR] promotion (+2[ICON_MOVES]Movement Points).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DOUALA', 				'[COLOR_MAGENTA]Minature Continent:[ENDCOLOR] +1 [ICON_INTERNATIONAL_TRADE] Trade Route. +10% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Trade Units[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_FAYA', 				'[COLOR_MAGENTA]Turbulent Independence:[ENDCOLOR] [COLOR_YIELD_GOLD]Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Spoils of War[ENDCOLOR] promotion (Unit gains [ICON_RESEARCH] [COLOR:255:230:85:255]on Kill[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_FLORENCE', 			'[COLOR_MAGENTA]Cradle of the Renaissance:[ENDCOLOR] [COLOR_CITY_BROWN]Quarries[ENDCOLOR] gain +1 [ICON_CULTURE] Culture. Artists gain +1 [ICON_GOLDEN_AGE] Golden Age Points. Player has 1% chance per turn of spawning the [ICON_GREAT_ARTIST] Great Artist or [ICON_GREAT_ENGINEER] Great Engineer in the Capital.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 				'[COLOR_MAGENTA]L''Escalade:[ENDCOLOR] Cities gain +3% [ICON_GREAT_PEOPLE] Great People Points. Birth of a [ICON_GREAT_PEOPLE] [COLOR_YIELD_GOLD]Great Person[ENDCOLOR] grants 25 [ICON_PEACE] Faith, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GENOA', 				'[COLOR_MAGENTA]La Superba:[ENDCOLOR] Birth of a [ICON_GREAT_PEOPLE] [COLOR_YIELD_GOLD]Great Person[ENDCOLOR] grants 40 [ICON_GOLD] Gold and 10 [ICON_GOLDEN_AGE] Golden Age Points, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GRANADA', 			'[COLOR_MAGENTA]Alcázars:[ENDCOLOR] [COLOR_CITY_BROWN]Forts[ENDCOLOR], [COLOR_CITY_BROWN]Citadels[ENDCOLOR] and [COLOR_CITY_BROWN]Pontoon Bridges[ENDCOLOR] gain +1 [ICON_GREAT_GENERAL] Great General Point. Player gains +10% [ICON_WAR] War Score.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GWYNEDD', 			'[COLOR_MAGENTA]Cyfraith Hywel:[ENDCOLOR] +10% [ICON_CULTURE] Culture during the [ICON_HAPPINESS_1] WLTKD. +33% [ICON_HAPPINESS_1] WLTKD Length.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HANOI', 				'[COLOR_MAGENTA]Nine-tiered Hierarchy:[ENDCOLOR] Civil Servants gain +1 [ICON_GREAT_GENERAL] Great General Point and +1 [ICON_GREAT_ADMIRAL] Great Admiral Point. Military Units gain [COLOR_WATER_TEXT]Patriotism[ENDCOLOR] promotion (+10%[ICON_STRENGTH]CS [COLOR:255:230:85:255]inside Friendly Territory[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HANUABADA', 			'[COLOR_MAGENTA]Hiri Trade Cycles:[ENDCOLOR] Cities gain +15% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Cargo Ships[ENDCOLOR]. Finishing a Sea [ICON_CARGO_SHIP] Trade Route grants 10-50 [ICON_GOLDEN_AGE] Golden Age Points, scaling up with the Destination City''s [ICON_CITIZEN] Population and down with the actual number of active [ICON_INTERNATIONAL_TRADE] Trade Routes. Land Units gain [COLOR_WATER_TEXT]Papuan Seafaring Prowess[ENDCOLOR] promotion (+2 [ICON_VP_VISION] Sight and +50%[ICON_STRENGTH]Defensive CS if unit [COLOR:255:230:85:255]is Embarked[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HONDURAS', 			'[COLOR_MAGENTA]Banana Republic:[ENDCOLOR] Resources granted from [ICON_CITY_STATE] City-States count toward Global Monopolies (doesn''t stack with [COLOR_CYAN]Exchange Markets[ENDCOLOR] policy).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 			'[COLOR_MAGENTA]Prosperous:[ENDCOLOR] Cities gain +5% [ICON_FOOD] Growth and +1 [ICON_GOLD] Gold for every 6 [ICON_CITIZEN] Citizens. Each turn there''s a chance that 1 [ICON_CITIZEN] Citizen from 1 Player''s City will migrate to [COLOR_CYAN]Hong Kong[ENDCOLOR] granting 30 [ICON_INFLUENCE] Influence and 100-150 [ICON_GOLD] Gold, scaling with Era and current [ICON_INFLUENCE] Influence level with [COLOR_CYAN]Hong Kong[ENDCOLOR].[NEWLINE]' UNION ALL /* Chance of migration starts from 0%, if the City has equal [ICON_CITIZEN] Citizens to [COLOR_CYAN]Hong Kong[ENDCOLOR], and grows by 1% with each [ICON_CITIZEN] Citizen above that number.*/
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HONIARA', 			'[COLOR_MAGENTA]Suahongi Dance:[ENDCOLOR] [ICON_VP_GREATMUSIC] Great Works of Music gain +2 [ICON_FOOD] Food. Musicians gain +1 [ICON_CULTURE_LOCAL] Border Growth Point. Each [ICON_CULTURE] Culture Expansion to a [COLOR_GREY]Bonus Resource[ENDCOLOR] grants 25 [ICON_FOOD] Food on land and 50 [ICON_FOOD] Food on sea, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_IFE', 				'[COLOR_MAGENTA]Ogbuni:[ENDCOLOR] Training or spawning a [COLOR_YIELD_GOLD]Diplomatic Unit[ENDCOLOR] grants 30 [ICON_PEACE] Faith, scaling with Era (doubled for [COLOR_YIELD_GOLD]Great Diplomat[ENDCOLOR]). [COLOR_YIELD_GOLD]Diplomatic Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Iwarefa[ENDCOLOR] promotion (+1[ICON_MOVES]Movement Point. +1[ICON_VIEW_CITY]Sight. +10 [ICON_INFLUENCE] Influence [COLOR:255:230:85:255]after Diplomatic Mission[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_IRUNEA', 				'[COLOR_MAGENTA]Bizkaia:[ENDCOLOR] [COLOR_CITY_BROWN]Fishing Boats[ENDCOLOR] gain +1 [ICON_FOOD] Food and +1 [ICON_GOLD] Gold. Cities gain +20% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Workboats[ENDCOLOR]. Each Era change grants a free [COLOR_YIELD_GOLD]Workboat[ENDCOLOR] to a youngest Coastal City. Each new Coastal City starts with a free [COLOR_YIELD_GOLD]Workboat[ENDCOLOR].[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ISHIYAMA', 			'[COLOR_MAGENTA]???:[ENDCOLOR] [NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ISKANWAYA', 			'[COLOR_MAGENTA]Kallawaya Healers:[ENDCOLOR] [COLOR_YIELD_FOOD]Aqueducts[ENDCOLOR] gain +1 [ICON_PEACE] Faith. Units gain [COLOR_WATER_TEXT]Qolla Kapachayuh[ENDCOLOR] promotion (Unit [COLOR:255:230:85:255]Heals every turn[ENDCOLOR], if it [COLOR:255:230:85:255]is next to owned Missionary, Holy Site or Mountain[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_JERUSALEM', 			'[COLOR_MAGENTA]Holy Lands:[ENDCOLOR] [COLOR_CITY_BROWN]Holy Sites[ENDCOLOR] gain +1 [ICON_PEACE] Faith. [COLOR_CYAN]Jerusalem[ENDCOLOR] will adopt the Majority Religion of its Ally and gains at the same time permanent +100% Religious Pressure (stays on Capture). [COLOR_CYAN]Jerusalem[ENDCOLOR] has a religious pressure equal to a Holy City. When there''s a change of alliance, new Ally will gain a [COLOR_POSITIVE_TEXT]Sphere of Influence[ENDCOLOR] with [COLOR_CYAN]Jerusalem[ENDCOLOR], if the World Congress has been founded.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_JETARKTE', 			'[COLOR_MAGENTA]Sea Nomads:[ENDCOLOR] Units can Airlift (lit. Sealift) between Coastal Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_JUYUBIT', 			'[COLOR_MAGENTA]Brotherhood of the Canoe:[ENDCOLOR] [ICON_RES_FISH] [COLOR_GREY]Fish[ENDCOLOR] gain +1 [ICON_FOOD] Food. [COLOR_GREY]Bonus Resources[ENDCOLOR] gain +1 [ICON_RESEARCH] Science. Player can train [COLOR_YIELD_GOLD]Te''aat[ENDCOLOR] unit (unique [COLOR_YIELD_GOLD]Workboat[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 				'[COLOR_MAGENTA]Paradise on Earth:[ENDCOLOR] Cities gain +0.66 [ICON_CULTURE] Culture for every [COLOR_CITY_BLUE]Mountain[ENDCOLOR] tile within their workable radius. [COLOR_YIELD_GOLD]Land Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Mujahideen[ENDCOLOR] promotion (+25%[ICON_STRENGTH]Defensive CS, if standing next to a Mountain).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KARASJOHKA', 			'[COLOR_MAGENTA]Sameby:[ENDCOLOR] [ICON_RES_DEER] [COLOR_GREY]Deers[ENDCOLOR] gain +1 [ICON_FOOD] Food and +1 [ICON_PRODUCTION] Production. [COLOR_YIELD_GOLD]Recon and Ranged Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Siida Training[ENDCOLOR] promotion (+5% [ICON_STRENGTH] Attack CS/[ICON_RANGE_STRENGTH] Attack RCS and additional 10% in Forest). When a [COLOR_CITY_BROWN]Camp[ENDCOLOR] on [ICON_RES_DEER] [COLOR_GREY]Deer[ENDCOLOR] is built, there''s 80% chance of spawning a [ICON_RES_REINDEER] [COLOR_GREY]Reindeer[ENDCOLOR] on adjacent [COLOR_CITY_BLUE]Tundra[ENDCOLOR] or [COLOR_CITY_BLUE]Snow[ENDCOLOR] tile, and another 10% for additional one (chances are increased by 1% for each adjacent [COLOR_CITY_BLUE]Snow[ENDCOLOR] tile).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KARYES', 				'[COLOR_MAGENTA]Monastic Republic:[ENDCOLOR] [COLOR_YIELD_GOLD]Land Civilian Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Climber of Mount Athos[ENDCOLOR] promotion (Unit [COLOR:255:230:85:255]can cross Mountains[ENDCOLOR]). Player can build a [COLOR_CITY_BROWN]Monastery[ENDCOLOR] improvement on Hills not adjacent to a City (not adjacent) ([ICON_PRODUCTION], [ICON_GOLD], [ICON_CULTURE], [ICON_PEACE], [ICON_TOURISM]). +1 [ICON_DIPLOMAT] Great Diplomat Point and -10% [ICON_HAPPINESS_3] Religious Unrest in City, if there are at least 3 [COLOR_CITY_BROWN]Monasteries[ENDCOLOR] within their workable radius.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KATENDE', 			'[COLOR_MAGENTA]Long Claw of Memory:[ENDCOLOR] Construction of the [COLOR_YIELD_FOOD]Scrivener''s Office[ENDCOLOR], [COLOR_YIELD_FOOD]Printing Press[ENDCOLOR] and [COLOR_YIELD_FOOD]Foreign Bureau[ENDCOLOR] grants +1 [ICON_GREAT_ARTIST] Great Artist Point and +1 [ICON_GREAT_WRITER] Great Writer Point in the City. [COLOR_YIELD_GOLD]Diplomatic Units[ENDCOLOR] gain +15% [ICON_INFLUENCE] Influence.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 			'[COLOR_MAGENTA]Gorkha Kingdom:[ENDCOLOR] Each [ICON_CITY_STATE] City-State Friend grants +1 [ICON_PEACE] Faith and each [ICON_CITY_STATE] City-State Ally grants +1 [ICON_GREAT_GENERAL] Great General Point to all Cities. Player can purchase [COLOR_YIELD_GOLD]Gurkha[ENDCOLOR] unit (unique [COLOR_YIELD_GOLD]Fusilier[ENDCOLOR]) with [ICON_GOLD] Gold.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 				'[COLOR_MAGENTA]Stories of Old:[ENDCOLOR] Player can construct [COLOR_YIELD_FOOD]Bylina[ENDCOLOR] ([ICON_GREAT_MUSICIAN]). +5% [ICON_GREAT_MUSICIAN] Great Musicians generation.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 				'[COLOR_MAGENTA]Last True Rwabugiri:[ENDCOLOR] Border expansion grants +1 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold. Killing an Enemy Unit grants 5 [ICON_CULTURE_LOCAL] Border Growth Points in all Cities. -10% [ICON_WAR] War Weariness in the Empire.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 		'[COLOR_MAGENTA]Muddy Confluence:[ENDCOLOR] [COLOR_CITY_GREEN]River[ENDCOLOR] tiles gain +1 [ICON_GOLD] Gold. Building construction grants 20 [ICON_FOOD] Food. Birth of a [ICON_CITIZEN] Citizen grants 10 [ICON_CULTURE] Culture, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KYZYL', 				'[COLOR_MAGENTA]Center of Asia:[ENDCOLOR] [COLOR_YIELD_FOOD]Palace[ENDCOLOR] and [COLOR_YIELD_FOOD]Monuments[ENDCOLOR] gain +1 [ICON_RESEARCH] Science. Researching a Technology grants 5-20 [ICON_PRODUCTION] Production in all Cities, scaling up with Era and down with the number of Cities (caps at 8 Cities).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LACONIA', 			'[COLOR_MAGENTA]Agoge:[ENDCOLOR] [COLOR_YIELD_GOLD]Land Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Spartan Discipline[ENDCOLOR] promotion (+15%[ICON_STRENGTH]CS if unit [COLOR:255:230:85:255]is adjacent to another Friendly Unit[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LAHORE', 				'[COLOR_MAGENTA]Khalsa:[ENDCOLOR] Player can purchase [COLOR_YIELD_GOLD]Nihang[ENDCOLOR] unit (unique [COLOR_YIELD_GOLD]Longswordsman[ENDCOLOR]) with [ICON_PEACE] Faith.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LA_VENTA', 			'[COLOR_MAGENTA]Ceremonial Creations:[ENDCOLOR] Player can build a [COLOR_CITY_BROWN]Colossal Head[ENDCOLOR] improvement on [COLOR_CITY_BLUE]Plains[ENDCOLOR] or [COLOR_CITY_BLUE]Grassland[ENDCOLOR] with [COLOR_CITY_GREEN]Forest[ENDCOLOR] or [COLOR_CITY_GREEN]Jungle[ENDCOLOR] by expending the [ICON_GREAT_ARTIST] [COLOR_YIELD_GOLD]G. Artist[ENDCOLOR], [ICON_GREAT_ENGINEER] [COLOR_YIELD_GOLD]G. Engineer[ENDCOLOR], [ICON_GREAT_SCIENTIST] [COLOR_YIELD_GOLD]G. Scientist[ENDCOLOR] or [ICON_PROPHET] [COLOR_YIELD_GOLD]G. Prophet[ENDCOLOR] ([ICON_PRODUCTION], [ICON_RESEARCH], [ICON_CULTURE], [ICON_GOLDEN_AGE], [ICON_GREAT_GENERAL], [ICON_GREAT_ADMIRAL]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 				'[COLOR_MAGENTA]Lasakau Sea Warriors:[ENDCOLOR] +1 [ICON_GREAT_GENERAL] Great General Point in the Capital per owned conquered City. [COLOR_YIELD_GOLD]Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Destroyers of Bau[ENDCOLOR] promotion (Gain [ICON_FOOD], scaling with Era, when killing Barbarians, clearing Barbarian Encampments (30-75 [ICON_FOOD] Food) or conquering enemy Cities (100-200 [ICON_FOOD] Food)).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 				'[COLOR_MAGENTA]A Place Among the Gods:[ENDCOLOR] Cities gain +0.66 [ICON_PEACE] Faith for every [COLOR_CITY_BLUE]Mountain[ENDCOLOR] tile within their workable radius. The [COLOR_YIELD_FOOD]Potala Palace[ENDCOLOR] World Wonder will be available for construction after the foundation of [COLOR_POSITIVE_TEXT]World Congress[ENDCOLOR] and at [COLOR_CYAN]Architecture[ENDCOLOR]. Constructing the [COLOR_CYAN]Potala Palace[ENDCOLOR] grants a [COLOR_POSITIVE_TEXT]Sphere of Influence[ENDCOLOR] with [COLOR_CYAN]Lhasa[ENDCOLOR].[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LONGYAN', 			'[COLOR_MAGENTA]Home of Generals:[ENDCOLOR] Player can build a [COLOR_CITY_BROWN]Tulou[ENDCOLOR] improvement on Hills next to a City ([ICON_FOOD], [ICON_PRODUCTION], [ICON_CULTURE], [ICON_GREAT_GENERAL], [ICON_STRENGTH], [ICON_SILVER_FIST], [ICON_CITIZEN]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MALACCA', 			'[COLOR_MAGENTA]Strait Settlements:[ENDCOLOR] [COLOR_GREY]Luxury Resources[ENDCOLOR] gain +1 [ICON_GOLD] Gold. Cities gain +10% [ICON_GREAT_MERCHANT] Great Merchant Points. [ICON_GREAT_MERCHANT] Great Merchants'' and [ICON_GREAT_ENGINEER] Great Engineers'' instant abilities gain +10% Yields.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MANAGUA', 			'[COLOR_MAGENTA]Place of the Big Man:[ENDCOLOR] Cities gain +10 [ICON_SPY] Spy Security. Successful offensive [ICON_SPY] Spy Mission grants 30 [ICON_FOOD] Food, scaling with Era, and successful defensive [ICON_SPY] Spy Missio - 20 [ICON_CULTURE] Culture, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MANILA', 				'[COLOR_MAGENTA]Pearl of the Orient:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] International Trade Routes gain +5% Yields. Finishing a [ICON_INTERNATIONAL_TRADE] Trade Route grants 25-50 [ICON_FOOD] Food and [ICON_PRODUCTION] Production in the City, scaling up with the Destination City''s [ICON_CITIZEN] Population and down with the actual number of active [ICON_INTERNATIONAL_TRADE] Trade Routes.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MBABANE', 			'[COLOR_MAGENTA]Fortress of Africa:[ENDCOLOR] Civil Servants gain +1 [ICON_GREAT_GENERAL] Great General Point. Cities gain +10 HP and +10 [ICON_STRENGTH] Defense.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MBANZA_KONGO', 		'[COLOR_MAGENTA]Warrior Queen:[ENDCOLOR] [COLOR_YIELD_GOLD]Land Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Manikongo Glory[ENDCOLOR] promotion (+15%[ICON_STRENGTH]CS [COLOR:255:230:85:255]in Forest, Jungle, Marsh and Flood Plains[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 			'[COLOR_MAGENTA]Gold Rush:[ENDCOLOR] [COLOR_CITY_BROWN]Mines[ENDCOLOR] gain +1 [ICON_GOLD] Gold. Cities convert 10% of [ICON_GOLD] Gold into [ICON_FOOD] Food and 5% of [ICON_GOLD] Gold into [ICON_CULTURE_LOCAL] Border Growth Points.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MENDYARRUP', 			'[COLOR_MAGENTA]Inheritance of the Kaartdijin:[ENDCOLOR] Repairing pillaged improvement grants extra [ICON_FOOD] Food equal to 1-turn gain in the working City. Birth of a [ICON_CITIZEN] Citizen grants 2 XP to all units within 2 tiles from that City. [COLOR_YIELD_GOLD]Land Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Karla Nyidiny[ENDCOLOR] promotion (Unit uses [COLOR:255:230:85:255]no[ENDCOLOR][ICON_MOVES]Movement Points [COLOR:255:230:85:255]on Pillage[ENDCOLOR]. +1[ICON_MOVES]Movement Point and +3 XP [COLOR:255:230:85:255]on Pillage[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 				'[COLOR_MAGENTA]House of Visconti:[ENDCOLOR] Player can construct [COLOR_YIELD_FOOD]Visconti Emissaries[ENDCOLOR] ([ICON_GREAT_ARTIST]). +5% [ICON_GREAT_ARTIST] Great Artists generation.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MOGADISHU', 			'[COLOR_MAGENTA]Maritime Growth:[ENDCOLOR] +10% [ICON_FOOD] Food during the [ICON_GOLDEN_AGE] Golden Ages. -5% [ICON_GOLDEN_AGE] Golden Age Cost. Player can build a [COLOR_CITY_BROWN]Daaq Ah[ENDCOLOR] improvement on Hills with [COLOR_CITY_BLUE]Plains[ENDCOLOR] or [COLOR_CITY_BLUE]Desert[ENDCOLOR] ([ICON_FOOD], [ICON_PRODUCTION], [ICON_GOLD], [ICON_CULTURE], [ICON_CULTURE_LOCAL]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MOMBASA', 			'[COLOR_MAGENTA]Thenashara Taifa:[ENDCOLOR] [COLOR_GREY]Bonus Resources[ENDCOLOR] gain +1 [ICON_FOOD] Food. Founding a City grants 40 [ICON_PEACE] Faith, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MONACO', 				'[COLOR_MAGENTA]Banking Haven:[ENDCOLOR] [COLOR_YIELD_FOOD]Markets[ENDCOLOR] and [COLOR_YIELD_FOOD]Banks[ENDCOLOR] gain +1 [ICON_CULTURE_LOCAL] Border Growth Point. -33% [ICON_GOLD] Tile Gold Purchase Cost in all Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUISCA', 				'[COLOR_MAGENTA]The Golden One:[ENDCOLOR] Capital gains +1 [ICON_GOLD] Gold for its every 3 [ICON_CITIZEN] Citizens and +1 [ICON_GOLD] Gold for every 20 [ICON_CITIZEN] Citizens in your Empire. Border expansion doubled during [ICON_GOLDEN_AGE] Golden Ages and [ICON_HAPPINESS_1] WLTKDs.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MULTAN', 				'[COLOR_MAGENTA]City of Saints:[ENDCOLOR] Birth of a [ICON_CITIZEN] Citizen grants 10 [ICON_PEACE] Faith, scaling with Era. Owned [ICON_MISSIONARY] [COLOR_YIELD_GOLD]Missionaries[ENDCOLOR] can spread Religion 1 additional time.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUSCAT', 				'[COLOR_MAGENTA]Cryptus Portus:[ENDCOLOR] Player gains +50% Modfier for Catching [ICON_SPY] Enemy Spies. Cities with garrisoned units gain +10% [ICON_STRENGTH] Strength. Garrisoned units have no [ICON_GOLD] Gold Maintenance.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUTITJULU', 			'[COLOR_MAGENTA]Tjukurpa:[ENDCOLOR] Cities gain +1 [ICON_GOLDEN_AGE] Golden Age Point for every 2 worked [COLOR_CITY_BLUE]Deserts[ENDCOLOR]. [COLOR_WHITE]Natural Wonders[ENDCOLOR] gain +3 [ICON_PEACE] Faith and [COLOR_CITY_BLUE]Deserts[ENDCOLOR] gain +1 [ICON_PEACE] Faith.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_NAN_MADOL', 			'[COLOR_MAGENTA]Reef of Heaven:[ENDCOLOR] [COLOR_CITY_BLUE]Oceans[ENDCOLOR] gain +1 [ICON_FOOD] Food and +1 [ICON_CULTURE] Culture. [COLOR_CITY_GREEN]Atolls[ENDCOLOR] gain +1 [ICON_PRODUCTION] Production. Unit''s death grants 2 [ICON_PEACE] Faith in every City, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_NYARYANA_MARQ', 		'[COLOR_MAGENTA]Reindeer Herders:[ENDCOLOR] [COLOR_CITY_BLUE]Snow[ENDCOLOR] gain +1 [ICON_CULTURE] Culture. Player can build a [COLOR_CITY_BROWN]Chum[ENDCOLOR] improvement on [COLOR_CITY_BLUE]Tundra[ENDCOLOR] and [COLOR_CITY_BLUE]Snow[ENDCOLOR] (not adjacent) ([ICON_FOOD], [ICON_PRODUCTION], [ICON_GOLD]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 				'[COLOR_MAGENTA]Lords of the Great Glass River:[ENDCOLOR] +20% [ICON_CARGO_SHIP] Sea Trade Route Maximum Range. Coastal Cities gain +1 [ICON_CULTURE_LOCAL] Border Growth Point. +1 [ICON_HAPPINESS_1] Happiness in Empire for each active International [ICON_CARGO_SHIP] Sea Trade Route.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ODENSO', 				'[COLOR_MAGENTA]Winter War:[ENDCOLOR] [COLOR_YIELD_GOLD]Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Lord of the Hunt[ENDCOLOR] promotion (+1[ICON_VIEW_CITY]Sight. +5 HP [COLOR:255:230:85:255]on Heal inside Neutral Territory[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ORMUS', 				'[COLOR_MAGENTA]Jewel of the Ring:[ENDCOLOR] [COLOR_GREY]Luxury Resources[ENDCOLOR] gain +1 [ICON_FOOD] Food. [ICON_INTERNATIONAL_TRADE] International Trade Routes to a [ICON_CITY_STATE] City-State generate +0.4 [ICON_INFLUENCE] Influence per turn (with the target [ICON_CITY_STATE] City-State) per each owned [ICON_INTERNATIONAL_TRADE] Trade Route to a [ICON_CITY_STATE] City-State (caps at +2 [ICON_INFLUENCE] Influence).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_OUIDAH', 				'[COLOR_MAGENTA]Slave Coast:[ENDCOLOR] [COLOR_YIELD_GOLD]Workers[ENDCOLOR] gain +15% [ICON_WORKER] Construction Modifier. Each [COLOR_YIELD_GOLD]Worker[ENDCOLOR] generates 1 [ICON_GOLD] Gold per turn. Each improvement construction by a [COLOR_YIELD_GOLD]Worker[ENDCOLOR] grants permanent -1% [ICON_GOLD] Gold Purchase Cost in the City that owns this tile.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PALMYRA', 			'[COLOR_MAGENTA]Pearl of the Desert:[ENDCOLOR] [ICON_TRADE] City Connections generate +1 [ICON_PRODUCTION] Production. Unit''s death grants 2 [ICON_GOLDEN_AGE] Golden Age Points and 2 [ICON_GREAT_GENERAL] Great General Points, scaling with Era. Player can build a [COLOR_CITY_BROWN]Funerary Tower[ENDCOLOR] improvement on a Flatland with [COLOR_CITY_BLUE]Desert[ENDCOLOR], also outside owned territory if adjacent to owned land (claims the tile, when build is finished) ([ICON_PRODUCTION], [ICON_CULTURE], [ICON_PEACE], [ICON_GOLDEN_AGE], [ICON_CULTURE_LOCAL]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 		'[COLOR_MAGENTA]Panama Canal:[ENDCOLOR] [COLOR_CITY_GREEN]Lakes[ENDCOLOR] gain +1 [ICON_GOLD] Gold. +10% [ICON_CARGO_SHIP] Sea Trade Route Maximum Range. International [ICON_CARGO_SHIP] Sea Trade Routes gain +1 [ICON_GOLD] Gold.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PELYM', 				'[COLOR_MAGENTA]Siberian Warlords:[ENDCOLOR] Cities on [COLOR_CITY_BLUE]Tundra[ENDCOLOR] or [COLOR_CITY_BLUE]Snow[ENDCOLOR] gain +2 [ICON_SILVER_FIST] Military Supply Cap. [COLOR_YIELD_GOLD]Land Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Siberian Education[ENDCOLOR] promotion (+10% [ICON_STRENGTH] CS and Double Movement on Tundra and Snow tiles).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PHANOTEUS', 			'[COLOR_MAGENTA]Gift of Prometheus:[ENDCOLOR] +20% chance to [COLOR_POSITIVE_TEXT]Rig Elections[ENDCOLOR] in [ICON_CITY_STATE] City-States. Spies stationed in a foreign City gain +5 Network Points per turn.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_POKROVKA', 			'[COLOR_MAGENTA]People of the Steppes:[ENDCOLOR] Player can train [COLOR_YIELD_GOLD]Saka[ENDCOLOR] unit (unique [COLOR_YIELD_GOLD]Skirmisher[ENDCOLOR]). [COLOR_YIELD_GOLD]Mounted Melee Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Scythian Arrow Barrage[ENDCOLOR] promotion (Unit deals 5 Damage to adjacent units on turn start).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PRAGUE', 				'[COLOR_MAGENTA]Vysehrad:[ENDCOLOR] [COLOR_YIELD_FOOD]Walls[ENDCOLOR] and [COLOR_YIELD_FOOD]Castles[ENDCOLOR] gain +1 [ICON_CULTURE] Culture. Killed or expended units that can spread a Religion grant 4-13 [ICON_CULTURE] Culture and twice as much [ICON_PEACE] Faith, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_QUEBEC_CITY', 		'[COLOR_MAGENTA]Fur and Lumber:[ENDCOLOR] [COLOR_CITY_BROWN]Camps[ENDCOLOR] and [COLOR_CITY_BROWN]Lumbermills[ENDCOLOR] gain +1 [ICON_GOLD] Gold. Cutting a [COLOR_CITY_GREEN]Forest[ENDCOLOR] or [COLOR_CITY_GREEN]Jungle[ENDCOLOR] grants additional 10 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold in the City, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 			'[COLOR_MAGENTA]River of the Good Signs:[ENDCOLOR] [COLOR_CITY_GREEN]River[ENDCOLOR] tiles gain +1 [ICON_GOLDEN_AGE] Golden Age Point. +25% [ICON_GOLDEN_AGE] Golden Age Length[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 				'[COLOR_MAGENTA]Maritime Suzerainty:[ENDCOLOR] [COLOR_CITY_BROWN]Embassies[ENDCOLOR] gain +1 [ICON_FOOD] Food. Coastal Cities gain +1 [ICON_SILVER_FIST] Military Supply Cap. Each [ICON_CITY_STATE] City-State Alliance grants +1 [ICON_FOOD] Food to all Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 				'[COLOR_MAGENTA]Hanseatic League:[ENDCOLOR] Cities gain +2% [ICON_FOOD] Food. Cities gain +1% [ICON_PRODUCTION] Production with each [ICON_INTERNATIONAL_TRADE] Trade Route to a [ICON_CITY_STATE] City-State .[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RISHIKESH', 			'[COLOR_MAGENTA]Himalayan Yogi:[ENDCOLOR] Cities on [COLOR_CITY_GREEN]River[ENDCOLOR] gain +2 [ICON_PEACE] Faith. Player can construct an [COLOR_YIELD_FOOD]Ashram[ENDCOLOR] ([ICON_RESEARCH], [ICON_PEACE], [ICON_TOURISM], [ICON_HAPPINESS_3]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SADDARVAZEH', 		'[COLOR_MAGENTA]Thus Spoke Zarathustra:[ENDCOLOR] [ICON_VP_GREATWRITING] Great Works of Literature gain +2 [ICON_PEACE] Faith. Building a [COLOR_CITY_BROWN]Holy Site[ENDCOLOR] or Founding, Enhancing or Reforming the Religion grants a free [COLOR_YIELD_GOLD]Missionary[ENDCOLOR] in the City, where a [COLOR_CITY_BROWN]Holy Site[ENDCOLOR] was built or in a Holy City (must have a majority of own Religion).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 			'[COLOR_MAGENTA]The Sogd:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] International Trade Routes grant +4 [ICON_GOLD] Gold to both: Origin and Destination City. [COLOR_YIELD_GOLD]Trade Units[ENDCOLOR] gain +2 [ICON_SIGHT] Sight.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SANAA', 				'[COLOR_MAGENTA]Arabia Felix:[ENDCOLOR] Capital gains +1 [ICON_GOLD] Gold for each different [COLOR_GREY]Luxury Resource[ENDCOLOR] improved by the Player (traded or imported [COLOR_GREY]Luxury Resources[ENDCOLOR] do not count). Each currently applied percentage-based [ICON_VP_MONOPOLY] Global Monopoly modifier gains an additional +5% bonus.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SANTO_DOMINGO', 		'[COLOR_MAGENTA]Caribbean''s Gateway:[ENDCOLOR] Each currently applied Happiness or flat-yield [ICON_VP_MONOPOLY] Global Monopoly modifier gains an additional +2 bonus.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SARNATH', 			'[COLOR_MAGENTA]Dharmachakra:[ENDCOLOR] Adopting a Policy grants 30 [ICON_RESEARCH] Science, scaling with Era. Cost of Social Policies is reduced by 1% for every City following your Religion (caps at 10%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SGANG_GWAAY', 		'[COLOR_MAGENTA]Gyaa''aang Heritage:[ENDCOLOR] [COLOR_YIELD_GOLD]Naval Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Master of Cold Waters[ENDCOLOR] promotion (Unit [COLOR:255:230:85:255]can enter Ice[ENDCOLOR]). Player can build a [COLOR_CITY_BROWN]Gyáa''aang[ENDCOLOR] improvement on [COLOR_CITY_BLUE]Tundra[ENDCOLOR] with adjacent [COLOR_CITY_BLUE]Coast[ENDCOLOR], [COLOR_CITY_GREEN]Lake[ENDCOLOR], City, [COLOR_CITY_BROWN]Town[ENDCOLOR] or [COLOR_CITY_BROWN]Village[ENDCOLOR] ([ICON_FOOD], [ICON_PRODUCTION], [ICON_CULTURE], [ICON_GOLDEN_AGE], [ICON_TOURISM]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SIDON', 				'[COLOR_MAGENTA]City for Conquest:[ENDCOLOR] Player can gain a [COLOR_POSITIVE_TEXT]Sphere of Influence[ENDCOLOR] with [COLOR_CYAN]Sidon[ENDCOLOR] for demanding a Tribute from another [ICON_CITY_STATE] City-State. [COLOR_YIELD_GOLD]Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Neighborhood Bully[ENDCOLOR] promotion (+5 HP [COLOR:255:230:85:255]on Heal inside Enemy Territory[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SIERRA_LEONE', 		'[COLOR_MAGENTA]Realm of the Free:[ENDCOLOR] [COLOR_YIELD_GOLD]Workers[ENDCOLOR] gain +20% [ICON_WORKER] Construction Modifier. Cities gain -5% [ICON_HAPPINESS_3] Distress. Each [COLOR_YIELD_GOLD]Worker[ENDCOLOR] generates 1 [ICON_CULTURE] Culture per turn.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SINGAPORE', 			'[COLOR_MAGENTA]Developed Wealth:[ENDCOLOR] Cities gain +5% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Diplomatic Units[ENDCOLOR]. Expended [COLOR_YIELD_GOLD]Diplomatic Units[ENDCOLOR] grant 30 [ICON_GOLD] Gold, scaling with Era and current [ICON_INFLUENCE] Influence level with with a [ICON_CITY_STATE] City-State, where they were located. [COLOR_YIELD_GOLD]Diplomatic Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Noble[ENDCOLOR] promotion (+15 [ICON_INFLUENCE] Influence to Diplomatic Missions).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 				'[COLOR_MAGENTA]Serdica:[ENDCOLOR] Cities gain +1 [ICON_GREAT_GENERAL] Great General Point and +1 [ICON_GREAT_ADMIRAL] Great Admiral Point per Religion present in this City. [ICON_GREAT_GENERAL] [COLOR_YIELD_GOLD]Great Generals[ENDCOLOR] and [ICON_GREAT_ADMIRAL] [COLOR_YIELD_GOLD]Great Admirals[ENDCOLOR] gain +10% [ICON_STRENGTH] Combat Effectiveness Bonus.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SUCEAVA', 			'[COLOR_MAGENTA]Athleta Christi:[ENDCOLOR] -10% [ICON_PEACE] Faith Purchase Cost for [COLOR_YIELD_FOOD]Religious Buildings[ENDCOLOR], [COLOR_YIELD_GOLD]Missionaries[ENDCOLOR] and [COLOR_YIELD_GOLD]Inquisitors[ENDCOLOR]. [COLOR_YIELD_GOLD]Land Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Battle of Vaslui[ENDCOLOR] promotion (+10% [ICON_STRENGTH] Defensive CS. Military kills generate [ICON_PEACE] Faith equivalent to 100% of the killed''s [ICON_STRENGTH] Combat Strength.)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SURREY', 				'[COLOR_MAGENTA]Center of Aviation:[ENDCOLOR] [COLOR_GREY]Strategic Resources[ENDCOLOR] gain +1 [ICON_GREAT_GENERAL] Great General Point. Cities gain +10% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Air Units[ENDCOLOR]. [COLOR_YIELD_GOLD]Air Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Magnificence in Flying Machines[ENDCOLOR] promotion (+10%[ICON_RANGE_STRENGTH]RCS [COLOR:255:230:85:255]vs Land and Naval Units[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SYDNEY', 				'[COLOR_MAGENTA]Capital Infrastructure:[ENDCOLOR] [ICON_HAPPINESS_1] WLTKD generate +5% [ICON_FOOD] Food. [ICON_HAPPINESS_1] WLTKD start grants 5-20 [ICON_GREAT_ARTIST] Great Artist Points, [ICON_GREAT_ARTIST] Great Writer Points and [ICON_GREAT_ARTIST] Great Musician Points, scaling with Era [NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 				'[COLOR_MAGENTA]Taiwanese Miracle:[ENDCOLOR] Cities gain +10% [ICON_RESEARCH] Science from the Research Process. Converts 15% of [ICON_RESEARCH] Science into [ICON_FOOD] Food.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TBILISI', 			'[COLOR_MAGENTA]Patronqmoba:[ENDCOLOR] +50% [ICON_GREAT_GENERAL] Great General Points from combat in Friendly territory. -33% Yield Penalty for Puppeted Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 			'[COLOR_MAGENTA]Druk Tsendhen:[ENDCOLOR] Cities on [COLOR_CYAN]Hill[ENDCOLOR] gain +3 [ICON_CULTURE] Culture. Cities 1 [ICON_STRENGTH] Defense for each 10 [ICON_CULTURE] Culture per turn.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TIWANAKU', 			'[COLOR_MAGENTA]Hana Pacha:[ENDCOLOR] Player can purchase [COLOR_YIELD_GOLD]Sisqeno[ENDCOLOR] unit (unique [COLOR_YIELD_GOLD]Missionary[ENDCOLOR]) with [ICON_PEACE] Faith. Player can build a [COLOR_CITY_BROWN]Sunken Courtyard[ENDCOLOR] improvement on a Flatland with [COLOR_CITY_BLUE]Plains[ENDCOLOR], [COLOR_CITY_BLUE]Tundra[ENDCOLOR] or [COLOR_CITY_BLUE]Desert[ENDCOLOR] by expending a [ICON_MISSIONARY] [COLOR_YIELD_GOLD]Missionary[ENDCOLOR] (not adjacent) ([ICON_RESEARCH], [ICON_CULTURE], [ICON_PEACE], [ICON_TOURISM]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TUNIS', 				'[COLOR_MAGENTA]Caliphs of Carthage:[ENDCOLOR] Player can build a [COLOR_CITY_BROWN]Ribat[ENDCOLOR] improvement on a [COLOR_CITY_BLUE]Desert[ENDCOLOR] ([ICON_GOLD], [ICON_CULTURE], [ICON_PEACE], [ICON_GREAT_GENERAL]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TYRE', 				'[COLOR_MAGENTA]Ruins of the Ancient World:[ENDCOLOR] [ICON_VP_ARTIFACT] [COLOR_CITY_BROWN]Landmarks[ENDCOLOR] gain +2 [ICON_GOLD] Gold. Cities gain +10% Production towards [ICON_VP_ARTIFACT] [COLOR_YIELD_GOLD]Archaeologists[ENDCOLOR]. [ICON_WONDER] World Wonder construction grants 20-40 [ICON_TOURISM] Tourism, scaling with Era and number of [ICON_WONDER] World Wonders in that City.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_UR', 					'[COLOR_MAGENTA]Cradle of Civilization:[ENDCOLOR] [ICON_TRADE] City Connections generate +2 [ICON_FOOD] Food. Newly founded Cities gain 1 additional [ICON_CITIZEN] Citizen.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VALLETTA', 			'[COLOR_MAGENTA]The Grand Harbor:[ENDCOLOR] Player can construct [COLOR_YIELD_FOOD]The Grand Harbor[ENDCOLOR] ([ICON_FOOD], [ICON_RESEARCH], [ICON_STRENGTH]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 			'[COLOR_MAGENTA]Terminal City:[ENDCOLOR] Each City increases [ICON_GOLD] Gold from [ICON_TRADE] City Connections by 3%. -30% [ICON_GOLD] City Connections Gold Maintenance.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 		'[COLOR_MAGENTA]Conclave:[ENDCOLOR] Expending a [ICON_GREAT_PEOPLE] [COLOR_YIELD_GOLD]Great Person[ENDCOLOR] grants 10 [ICON_INFLUENCE] Influence with all met [ICON_CITY_STATE] City-States. Player can purchase [COLOR_YIELD_GOLD]Swiss Guard[ENDCOLOR] unit (mercenary) with [ICON_GOLD] Gold or [ICON_PEACE] Faith.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VILNIUS', 			'[COLOR_MAGENTA]Athens of the North:[ENDCOLOR] Player can construct [COLOR_YIELD_FOOD]The Gate of Dawn[ENDCOLOR] ([ICON_GREAT_WRITER]). Writers gain +1 [ICON_GOLD] Gold.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 			'[COLOR_MAGENTA]Te Whanga-nui-a-Tara:[ENDCOLOR] [COLOR_GREY]Strategic Resources[ENDCOLOR] gain +1 [ICON_FOOD] Food. Player gains additional copies of [COLOR_GREY]Strategic Resource[ENDCOLOR]:[NEWLINE][ICON_BULLET] +1, if he has at least 1 copy and no Monopolies[NEWLINE][ICON_BULLET] +2, if he has a [ICON_VP_MONOPOLY] Strategic Monopoly[NEWLINE][ICON_BULLET] +3, if he has a [ICON_VP_MONOPOLY] Global Monopoly[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 			'[COLOR_MAGENTA]Birth of the Reformation:[ENDCOLOR] Cities gain +1 [ICON_PRODUCTION] Production, +1 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture per Religion present in this City. Cities gain -10% [ICON_PEACE] Religious Pressure and -10% [ICON_PEACE] Conversion Resistance. -5% [ICON_HAPPINESS_3] Religious Unrest in all Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WOOTEI_NIICIE', 		'[COLOR_MAGENTA]People of the Blue Sky:[ENDCOLOR] Cities gain +10% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Mounted and Gunpowder Units[ENDCOLOR]. [COLOR_YIELD_GOLD]Land Units[ENDCOLOR] trained in Cities with a [COLOR_YIELD_FOOD]Caravansary[ENDCOLOR] or [ICON_RES_HORSE] [COLOR_GREY]Horses[ENDCOLOR] nearby gain +15 XP. Levelling up a unit grants 2 [ICON_GREAT_GENERAL] Great General Points, scaling with unit level.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_YANGCHENG', 			'[COLOR_MAGENTA]Year of the Animal:[ENDCOLOR] [COLOR_GREY]Animal Resources[ENDCOLOR] gain +1 [ICON_PEACE] Faith. Each Era change grants 70 [ICON_PEACE] Faith, scaling with Era, increased by 30%, if Player entered that Era first, as well as an additional yield reward depending on the randomly chosen animal patron (out of 12).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_YEREVAN', 			'[COLOR_MAGENTA]Sea to Sea Armenia:[ENDCOLOR] [ICON_RES_HORSE] [COLOR_GREY]Horses[ENDCOLOR] gain +1 [ICON_CULTURE] Culture. [COLOR_YIELD_GOLD]Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Art of War[ENDCOLOR] promotion (Unit gains [ICON_CULTURE] and [ICON_GOLDEN_AGE] [COLOR:255:230:85:255]on Kill[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ZANZIBAR', 			'[COLOR_MAGENTA]The Spice Islands:[ENDCOLOR] [COLOR_GREY]Luxury Resources[ENDCOLOR] gain +1 [ICON_TOURISM] Tourism. Player gains +1 [ICON_HAPPINESS_1] Happiness for each [ICON_INTERNATIONAL_TRADE] Trade Route.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ZURICH', 				'[COLOR_MAGENTA]Banking Establishments:[ENDCOLOR] [COLOR_YIELD_FOOD]Banks[ENDCOLOR] and [COLOR_YIELD_FOOD]Stock Exchanges[ENDCOLOR] gain +2 [ICON_GOLD] Gold. Treasury generates +2% [ICON_GOLD] Gold as interest (caps at 20 [ICON_GOLD] Gold for each Era) per turn.[NEWLINE]';

INSERT INTO Language_en_US (Tag, Text)
-- promotions
SELECT 'TXT_KEY_PROMOTION_AMBRACIA', 					'Mercenaries of Pyrrhus' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AMBRACIA_HELP', 					'Generates +5% [ICON_PRODUCTION] Production when [COLOR_POSITIVE_TEXT]Garrisoned in the City[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ANTANANARIVO', 				'Pirate Haven' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ANTANANARIVO_HELP', 				'Military kills generate [ICON_GOLD] Gold equivalent to the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AUCKLAND', 					'Peaceful Resistance' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AUCKLAND_HELP', 					'+1 [ICON_FOOD] Food and +1 [ICON_GOLDEN_AGE] Golden Age Point in the City when Garrisoned.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BELGRADE', 					'The White Fortress' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BELGRADE_HELP', 					'+25 Max HP.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BRUSSELS', 					'Watringue' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BRUSSELS_HELP', 					'Double [ICON_MOVES] Movement on Marsh. Bonus [ICON_MOVES] Movement Point while crossing Rivers.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT', 					'Crusader''s Zeal' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT_HELP', 					'+15% XP gained from Combat.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT1', 					'Blessing of Clermont' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT1_HELP', 					'Receive a random combat bonus upon the first combat.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT2', 					'Onward with Haste!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT2_HELP', 					'+1 [ICON_MOVES] Moves. Can move after attacking.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT3', 					'United We Stand!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT3_HELP', 					'+15% [ICON_STRENGTH] Combat Strength when [COLOR_POSITIVE_TEXT]adjacent to a friendly unit[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT4', 					'Charge!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT4_HELP', 					'+5% [ICON_STRENGTH] Attack. +15% [ICON_STRENGTH] against [COLOR_POSITIVE_TEXT]Fortified Units[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT5', 					'Reinforce!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT5_HELP', 					'+5% [ICON_STRENGTH] Defense. Can heal after attacking.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT6', 					'Glory to God!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT6_HELP', 					'Unit awards combat bonus to nearby units as if it is a Great General. All adjacent units heal 5 additional HP per turn.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT7', 					'Deus Vult!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT7_HELP', 					'+1 Sight. Military kills generate [ICON_PEACE] Faith equivalent to 75% of the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DAKKAR', 						'Futuh Al-Habash' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DAKKAR_HELP', 					'+5 [ICON_STRENGTH] CS.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DODOMA', 						'Sail in the Wilderness' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DODOMA_HELP', 					'+2 [ICON_MOVES] Movement Points.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_FAYA', 						'Spoils of War' UNION ALL
SELECT 'TXT_KEY_PROMOTION_FAYA_HELP', 						'Military kills generate [ICON_RESEARCH] Science equivalent to 50% of the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANOI', 						'Patriotism' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANOI_HELP', 						'+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]inside Friendly Territories[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANUABADA', 					'Papuean Seafaring Prowess' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANUABADA_HELP', 					'+1 [ICON_VIEW_CITY] Sight and +50% [ICON_STRENGTH] Defensive Combat Strength when unit is Embarked.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_IFE', 						'Iwarefa' UNION ALL
SELECT 'TXT_KEY_PROMOTION_IFE_HELP', 						'+1 [ICON_MOVES] Movement Point. +1 [ICON_VIEW_CITY] Sight. +10 [ICON_INFLUENCE] Influence from Diplomatic Missions.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ISKANWAYA', 					'Qolla Kapachayuh' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ISKANWAYA_HELP', 					'Unit automatically Heals 10 HP each turn, if next to owned [COLOR_POSITIVE_TEXT]Missionary[ENDCOLOR], [COLOR_POSITIVE_TEXT]Holy Site[ENDCOLOR] or [COLOR_POSITIVE_TEXT]Mountain[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KABUL', 						'Mujahideen' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KABUL_HELP', 						'+25% [ICON_STRENGTH] Defensive CS.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KARASJOHKA', 					'Siida Training' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KARASJOHKA_HELP', 				'+5% [ICON_STRENGTH] Attack CS/[ICON_RANGE_STRENGTH] Attack RCS and additional 10% in Forest.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KARYES', 						'Climber of Mount Athos' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KARYES_HELP', 					'Unit can cross Mountains.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LACONIA', 					'Spartan Discipline' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LACONIA_HELP', 					'+15% [ICON_STRENGTH] Combat Strength when [COLOR_POSITIVE_TEXT]adjacent to a Friendly Unit[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LEVUKA', 						'Destroyers of Bau' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LEVUKA_HELP', 					'Gain [ICON_FOOD] for [COLOR_POSITIVE_TEXT]killing Barbarians[ENDCOLOR], [COLOR_POSITIVE_TEXT]taking Barbarian Encampements[ENDCOLOR] and [COLOR_POSITIVE_TEXT]capturing Cities[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MBANZA_KONGO', 				'Manikongo Glory' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MBANZA_KONGO_HELP', 				'+15% [ICON_STRENGTH] Combat Strength when fighting in [COLOR_POSITIVE_TEXT]Forest[ENDCOLOR], [COLOR_POSITIVE_TEXT]Jungle[ENDCOLOR], [COLOR_POSITIVE_TEXT]Marsh[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Flood Plains[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MENDYARRUP', 					'Karla Nyidiny' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MENDYARRUP_HELP', 				'Unit uses no [ICON_MOVES] Movement Points when Pillaging tiles. +1 [ICON_MOVES] Movement Point and +3 XP after Pillaging the tile[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ODENSO', 						'Lord of the Hunt' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ODENSO_HELP', 					'+1 [ICON_VIEW_CITY] Sight and heal an additional 5 HP per turn inside Neutral Territories.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_PELYM', 						'Siberian Education' UNION ALL
SELECT 'TXT_KEY_PROMOTION_PELYM_HELP', 						'+10% [ICON_STRENGTH] CS and Double Movement on Tundra and Snow tiles.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_POKROVKA', 					'Scythian Arrow Barrage' UNION ALL
SELECT 'TXT_KEY_PROMOTION_POKROVKA_HELP', 					'Unit deals 5 Damage to nearby Enemy Units on turn begin.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SCYTHIAN_BARRAGE', 			'Scythian Arrow Barrage' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SCYTHIAN_BARRAGE_HELP', 			'Unit deals 5 Damage to nearby Enemy Units on turn begin.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SGANG_GWAAY', 				'Master of Cold Waters' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SGANG_GWAAY_HELP', 				'Unit can cross Ice.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIDON', 						'Neighborhood Bully' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIDON_HELP', 						'Heal an additional 5 HP per turn [COLOR_POSITIVE_TEXT]inside Enemy Territories[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SUCEAVA', 					'Battle of Vaslui' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SUCEAVA_HELP', 					'+10% [ICON_STRENGTH] Defensive CS. Military kills generate [ICON_PEACE] Faith equivalent to 100% of the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SURREY', 						'Magnificence in Flying Machines' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SURREY_HELP', 					'+10% [ICON_STRENGTH] Combat Strength against [COLOR_POSITIVE_TEXT]Land[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Naval Units[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_YEREVAN', 					'Art of War' UNION ALL
SELECT 'TXT_KEY_PROMOTION_YEREVAN_HELP', 					'Military kills generate [ICON_CULTURE] Culture equivalent to 50% of the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA', 			'Guardia Svizzera Pontificia' UNION ALL
SELECT 'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA_HELP', 			'On Kill heals 10 Damage (if in range of owned City), 30 (if in range of owned Capital) or 40 (if in range of owned Holy City).' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KATZBALGER', 					'Katzbalger' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KATZBALGER_HELP', 				'Unit generates +2 [ICON_PEACE] Faith, +2 [ICON_CULTURE] Culture with [COLOR_CYAN]Radio[ENDCOLOR] and +2 [ICON_TOURISM] Tourism with [COLOR_CYAN]Telecommunications[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH', 						'Sikh Warrior' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_HELP', 						'+30% XP gained from Combat. Military kills generate [ICON_PEACE] Faith equivalent to 50% of the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_SWORD', 					'Khanda' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_SWORD_HELP', 				'+1 [ICON_STRENGTH] CS. +10% [ICON_STRENGTH] Attacking CS.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_KNIFE', 					'Dori Kirpan' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_KNIFE_HELP', 				'+3 [ICON_STRENGTH] CS. +15% [ICON_STRENGTH] Attacking CS against units below or equal to 50% HP.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_DISC', 					'Chakram' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_DISC_HELP', 					'+20% [ICON_STRENGTH] CS inside friendly territory. ' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_TRIDENT', 				'Trehsool Mukh' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_TRIDENT_HELP', 				'+3 [ICON_STRENGTH] CS. When attacked, unit returns 10% of the damage taken.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_DAGGER', 				'Katar' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_DAGGER_HELP', 				'+4 [ICON_STRENGTH] CS. +20% [ICON_STRENGTH] CS against Wounded units.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_BOW', 					'Kamaan' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_BOW_HELP', 					'+3 [ICON_STRENGTH] CS. +15% [ICON_STRENGTH] Attack CS against full HP.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_MUSKET', 				'Toradar' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_MUSKET_HELP', 				'+4 [ICON_STRENGTH] CS. Before melee Attack unit performs a Range attack at 50% of its CS.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_SHIELD', 				'Dhal' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_SHIELD_HELP', 				'+1 [ICON_STRENGTH] CS. +20% [ICON_STRENGTH] Defensive CS against Ranged Attacks.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_CHAINMAIL', 				'Sanjo' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_CHAINMAIL_HELP', 			'+2 [ICON_STRENGTH] CS. +10% [ICON_STRENGTH] Defensive CS. +15 HP.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_ROBE', 					'Chola' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_ROBE_HELP', 					'+1 [ICON_STRENGTH] CS. +10% XP gained from Combat. 25% chance that enemy unit retreats after fight.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_SHOES', 					'Jangi Mojeh' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_SHOES_HELP', 				'+3 [ICON_STRENGTH] CS. +1 [ICON_MOVES] Movement Point. On move, attacks all adjacent units by 5 HP.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_MARTIAL_ART', 			'Shastar Vidia' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_MARTIAL_ART_HELP', 			'+4 [ICON_STRENGTH] CS. On kill, moves and attacks all adjacent units by 10 HP.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_TURBAN', 				'Dastar Bunga' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_TURBAN_HELP', 				'+1 [ICON_STRENGTH] CS. +1 Sight. +25% XP gained from Combat.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_BRACELET', 				'Jangi Kara' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_BRACELET_HELP', 				'+6 [ICON_STRENGTH] CS. Military kills generate [ICON_PEACE] Faith equivalent to 75% of the killed''s [ICON_STRENGTH] Combat Strength.';

INSERT INTO Language_en_US (Tag, Text)
-- units
SELECT 'TXT_KEY_UNIT_SWISS_GUARD', 						'Swiss Guard' UNION ALL
SELECT 'TXT_KEY_UNIT_SWISS_GUARD_STRATEGY', 				'The Swiss Guard is a unique mercenary unit of the Vatican City, located in the tech tree between [COLOR_POSITIVE_TEXT]Free Company[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Foreign Legion[ENDCOLOR]. It can only be purchased (with either [ICON_GOLD] Gold or [ICON_PEACE] Faith) and does move after purchase; though it does not require any policies to do so. The Swiss Guard gains extra [ICON_STRENGTH] Strength each consecutive Era and heals after killing an enemy unit, if it is close to owned City (a little), Capital (more) or Holy City (the most). It also generates yields depending on techs discovered ([COLOR_CYAN]Radio[ENDCOLOR] and [COLOR_CYAN]Telecommunications[ENDCOLOR]). This unit does not obsolete.' UNION ALL
SELECT 'TXT_KEY_UNIT_SWISS_GUARD_HELP', 					'This unit can only be purchased with [ICON_GOLD] Gold or [ICON_PEACE] Faith (requires an access to [COLOR_CYAN]Vatican City[ENDCOLOR]''s ability).[NEWLINE][NEWLINE]Does not obsolete and may move immediately after purchase. Gains additional [ICON_STRENGTH] Strength each consecutive Era. Unit heals itself after killing an Enemy Unit by a value depending on the owned City it is in range of (regular, Capital, Holy City). Generates +2 [ICON_PEACE] Faith, +2 [ICON_CULTURE] Culture after [COLOR_CYAN]Radio[ENDCOLOR] and +2 [ICON_TOURISM] Tourism after [COLOR_CYAN]Telecommunications[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_SWISS_GUARD', 					'Swiss Guards describe, historically, the mercenaries who from Switzerland sought to serve as bodyguards throughout courts of Europe during the Middle Ages and the Renaissance. Lauded for their enduring loyalty and bravery, Swiss Guards served a wide variety of functions: from ceremonial guards to front-line troops, and were in use by the armies of some of Europe''s greatest powers: including France, Spain and Naples. Although in 1874 the recruitment of Swiss Guards by foreign powers was forbidden by the Swiss Constitution, the Pontifical Swiss Guard that served the Holy See was an exception, and today remains the primary force of the Vatican; responsible for the safety of the Pope and the security of the Apostolic Palace.' UNION ALL
SELECT 'TXT_KEY_UNIT_GURKHA', 							'Gurkha' UNION ALL
SELECT 'TXT_KEY_UNIT_GURKHA_STRATEGY', 						'The Gurkha is the Kathmandu''s replacement for the Fusilier. In addition to being unlocked earlier than the Fusilier, the Gurkha gains more experience from fights and has huge handicap against blocked enemy units.' UNION ALL
SELECT 'TXT_KEY_UNIT_GURKHA_HELP', 							'This unit can be trained or purchased (requires an access to [COLOR_CYAN]Kathmandu[ENDCOLOR]''s ability).[NEWLINE][NEWLINE]Unique Fusilier Unit that may move immediately after purchase, can be trained earlier and does not require [COLOR_POSITIVE_TEXT]Armory[ENDCOLOR] when buying. Unit starts with additional promotions that crush enemy units ([COLOR_POSITIVE_TEXT]Heavy Charge[ENDCOLOR]) and allow gaining 50% more experience from fights ([COLOR_POSITIVE_TEXT]Quick Study[ENDCOLOR]).' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_GURKHA', 							'The Gurkhas are a people native to mountainous Nepal and Gorkhaland region of India. Famed for their bravery, fearlessness and disregard for death, they impressed British military commanders as early as in 1814, during the Gurkha War waged by the East India Company against Nepal. In 1815, even before the war ended, the first regiment of Gurkhas was formed within the British Indian army. Throughout 19th and well into the 20th century, the Gurkhas remained loyal to the British crown, despite wars and numerous Indian rebellions. They fought in both World Wars as a part of the British Army, where they formed fifteen rifle regiments. They were widely admired for their ability to withstand any hardship and feared of their skill with the deadly khukuri knife. Gurkha regiments remain in service to this day.' UNION ALL
SELECT 'TXT_KEY_UNIT_SISQENO', 							'Sisqeno' UNION ALL
SELECT 'TXT_KEY_UNIT_SISQENO_STRATEGY', 					'The Sisqeno is the Tiwanaku''s replacement for the Missionary. It is slightly cheaper and gains additional active ability, that allows it to build Sunken Courtyard improvements. This action may only be used when unit has all of its spreads (before using spread action).' UNION ALL
SELECT 'TXT_KEY_UNIT_SISQENO_HELP', 						'This unit can only be purchased with [ICON_PEACE] Faith (requires an access to [COLOR_CYAN]Tiwanaku[ENDCOLOR]''s ability).[NEWLINE][NEWLINE]Unique Missionary Unit. It is slightly cheaper and can build a [COLOR_POSITIVE_TEXT]Sunken Courtyard[ENDCOLOR] improvement (only when all of its Spread Religion charges are active).' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_SISQENO', 						'The Tiwanaku Empire connected spirituality, power and authority between the physical space of Lake Titikaka and the highland site of Tiwanaku. Temples were built at both sites and the shared imagery of the snake, condor and puma are significant in the religious and cosmological expressions that linked the two sites. [NEWLINE]Several scholars have pointed to the connection between the spirituality, agricultural patterns, monumental architecture and artistic depictions of the Tiwanaku to earlier and other regional cultures, such as Chiripa, Pucara and Cusco. Known as the Yaya-Mama Religious Tradition, many artifacts discovered in the Lake Titikaka region feature similar motifs and show a long integration within the geography and cultures of the region. Lake Titikaka was the spiritual birthplace and center of the cosmos in the Tiwanaku and Incan worldviews and remains a sacred site for the indigenous peoples who continue to live in the region. Lake Titikaka is named after the puma, a spiritually powerful animal. [NEWLINE]According to Incan mythology, which followed the Tiwanaku by hundreds of years, the god and great creator Viracocha emerged from Lake Titikaka to create the world after a great flood. He brought the Sun (Inti) out of the Island of the Sun near the southern shore of Lake Titikaka in present-day Bolivia, the Moon (Mama Killa) out of the Island of the Moon to the east, and created the cosmos with stars born from the lake. He then created the first humans at Tiwanaku out of stone. Viracocha was an omnipotent god who controlled the elements, the weather and agricultural fortune. Viracocha is depicted at Tiwanaku on the Gateway of the Sun and is featured in other carvings and imagery of the ancient empire. Like the god of the Incas, he is seen holding a snake in each hand whose head is that of a condor. [NEWLINE][NEWLINE]Beside the cult of Viracocha, other evidence on Tiwanaku religion points to a system of ancestor worship. The preservation, use, and reconfiguration of mummy bundles and skeletal remains, as with the later Inca, may suggest that this is the case. [NEWLINE]Later cultures within the area made use of large "above ground burial chambers for the social elite ... known as "chullpas". Similar, though smaller, structures were found within the site of Tiwanaku. It is possible that, like the later Inca, the inhabitants of Tiwanaku may have practiced similar rituals and rites in relation to the dead. [NEWLINE]The Akapana East Building has evidence of ancestor burial. The human remains at Akapana East seem to be less for show and more for proper burial. The skeletons show many cut marks that were most likely made by defleshing or excarnation after death. The remains were then bundled up and buried rather than left out in the open. [NEWLINE][NEWLINE]The Tiwanaku conducted human sacrifices on top of a building known as the Akapana. People were disemboweled and torn apart shortly after death and laid out for all to see. It is speculated that this ritual was a form of dedication to the gods. The type of human sacrifice included victims being hacked in pieces, dismembered, exposed to the elements and carnivores before being deposited in trash. Research showed that one man who was sacrificed was not a native to the Titicaca Basin, leaving room to think that sacrifices were most likely of people originally from other societies.' UNION ALL
SELECT 'TXT_KEY_UNIT_NIHANG', 							'Nihang' UNION ALL
SELECT 'TXT_KEY_UNIT_NIHANG_STRATEGY', 						'The Nihang is the Lahore''s replacement for the Longswordsman. It obsoletes very late, and has access to unique promotion branch. It starts with special promotion giving additional experience and [ICON_PEACE] Faith, and is slightly stronger at start from the base unit. It can be only bought with [ICON_PEACE] Faith and gains additional experience when player constructs military buildings.' UNION ALL
SELECT 'TXT_KEY_UNIT_NIHANG_HELP', 							'This unit can only be purchased with [ICON_PEACE] Faith (requires an access to [COLOR_CYAN]Lahore[ENDCOLOR]''s ability).[NEWLINE][NEWLINE]Unique Longswordsman Unit that may move immediately after purchase and gains experience when player constructs [COLOR_POSITIVE_TEXT]Armory[ENDCOLOR], [COLOR_POSITIVE_TEXT]Military Academy[ENDCOLOR] or [COLOR_POSITIVE_TEXT]Arsenal[ENDCOLOR]. Unit starts with special promotion giving 30% more experience, and some [ICON_PEACE] Faith on kills ([COLOR_POSITIVE_TEXT]Sikh Warrior[ENDCOLOR]), and granting an access to unique promotion branch exclusive only for this unit.' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_NIHANG', 							'TODO' UNION ALL
SELECT 'TXT_KEY_UNIT_SAKA', 							'Saka' UNION ALL
SELECT 'TXT_KEY_UNIT_SAKA_STRATEGY', 						'The Saka is the Daergraevs'' replacement for the Skirmisher. It is slightly stronger than the base unit, starts with promotion dealing small damage to all enemies around each turn and does not require [ICON_RES_HORSE] Horses.' UNION ALL
SELECT 'TXT_KEY_UNIT_SAKA_HELP', 							'This unit can be trained or purchased (requires an access to [COLOR_CYAN]Daergraevs[ENDCOLOR]'' ability).[NEWLINE][NEWLINE]Unique Skirmisher Unit. Does not require [ICON_RES_HORSE] Horses. Unit starts with additional promotion that deals 5 AOE damage each turn ([COLOR_POSITIVE_TEXT]Scythian Arrow Barrage[ENDCOLOR]).' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_SAKA', 							'TODO' UNION ALL
SELECT 'TXT_KEY_UNIT_TEAAT', 							'Te''aat' UNION ALL
SELECT 'TXT_KEY_UNIT_TEAAT_STRATEGY', 						'The Te''aat is the Juyubit''s replacement for the Workboat. It is cheaper and slightly faster than a regular Workboat and grants additional yields when expended.' UNION ALL
SELECT 'TXT_KEY_UNIT_TEAAT_HELP', 							'This unit can be trained or purchased (requires an access to [COLOR_CYAN]Juyubit[ENDCOLOR]''s ability).[NEWLINE][NEWLINE]Unique Workboat Unit that is cheaper and faster than base unit, and grants some [ICON_FOOD] Food and [ICON_CULTURE] Culture after creating an improvement.' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_TEAAT', 							'TODO';

INSERT INTO Language_en_US (Tag, Text)
-- improvements
	-- dummy (city-state)
	SELECT 'TXT_KEY_IMPROVEMENT_CITY', 						'City-State' UNION ALL
	-- marsh
	SELECT 'TXT_KEY_BUILD_MARSH', 							'Create a Marsh'  UNION ALL
	SELECT 'TXT_KEY_BUILD_MARSH_HELP', 						'Requires an access to [COLOR_CYAN]Brussels[ENDCOLOR]'' ability.[NEWLINE][NEWLINE]Terraforms the landscape here into the [COLOR_CITY_GREEN]Marsh[ENDCOLOR], while installing an improvement that''ll stabilize it.[NEWLINE]'  UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MARSH', 					'Marsh' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MARSH', 				'To restore the marshlands on any terrain, just allow water to flow to it naturally. It should even work on snow! If the water doesn''t freeze that is.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MARSH_HELP', 				'Only with the Alliance of the Brussel people can a civilization continue a restoration project of marshlands.' UNION ALL
	-- colossal head
	SELECT 'TXT_KEY_BUILD_BIG_HEAD', 						'Construct a Colossal Head'  UNION ALL
	SELECT 'TXT_KEY_BUILD_BIG_HEAD_HELP', 					'Requires an access to [COLOR_CYAN]La Venta[ENDCOLOR]''s ability to be finished.[NEWLINE]Can only be built on [COLOR_CITY_BLUE]Plains[ENDCOLOR] or [COLOR_CITY_BLUE]Grassland[ENDCOLOR] with [COLOR_CITY_GREEN]Forest[ENDCOLOR] or [COLOR_CITY_GREEN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]+1 [ICON_GOLDEN_AGE] Golden Age Point, if next to a City and +1 [ICON_PRODUCTION] Production if next to a [ICON_RES_STONE] [COLOR_GREY]Stone[ENDCOLOR] or [ICON_RES_MARBLE] [COLOR_GREY]Marble[ENDCOLOR]. +1 [ICON_GOLDEN_AGE] Golden Age Point, +1 [ICON_GREAT_GENERAL] Great General Point and +1 [ICON_GREAT_ADMIRAL] Great Admiral Point, for each 2 adjacent [COLOR_CITY_BROWN]Colossal Heads[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Farms[ENDCOLOR], [COLOR_CITY_BROWN]Mines[ENDCOLOR] and [COLOR_CITY_BROWN]Quarries[ENDCOLOR] gain +1 [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]Yield changes from Technologies and Policies:[NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production with [COLOR_CYAN]Masonry[ENDCOLOR][NEWLINE][ICON_BULLET]+2 [ICON_GOLDEN_AGE] Golden Age Points with [COLOR_CYAN]Machinery[ENDCOLOR][NEWLINE][ICON_BULLET]+3 [ICON_RESEARCH] Science with [COLOR_CYAN]Architecture[ENDCOLOR][NEWLINE][ICON_BULLET]+2 [ICON_PRODUCTION] Production with [COLOR_CYAN]Scientific Theory[ENDCOLOR][NEWLINE][ICON_BULLET]+3 [ICON_CULTURE] Culture with [COLOR_MAGENTA]New Deal[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_BIG_HEAD', 					'Colossal Head' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_BIG_HEAD', 			'The stone head sculptures of the Olmec civilization (1200 BCE - 400 BCE) are amongst the most mysterious and debated artefacts from the ancient world. Seventeen monumental stone representations of human heads sculpted from large basalt boulders have been unearthed in the region to date. The heads date from at least before 900 BCE and are a distinctive feature of the Olmec civilization. They can be nearly 3 metres high, 4.5 metres in circumference (9.8 feet, 14.7 feet) and average around 8 tons in weight. All portray mature men with fleshy cheeks, flat noses, and slightly crossed eyes. However, none of the heads are alike, and each boasts a unique headdress, which suggests they represent specific individuals.[NEWLINE][NEWLINE]The Olmec brought these boulders from the Sierra de los Tuxtlas mountains of Veracruz. Given that the extremely large slabs of stone used in their production were transported over large distances, requiring a great deal of human effort and resources, it is thought that the monuments represent portraits of powerful individual Olmec rulers, perhaps carved to commemorate their deaths. The heads were arranged in either lines or groups at major Olmec centers, but the method and logistics used to transport the stone to the sites remain uncertain, presumably using huge balsa river rafts wherever possible and log rollers on land.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_BIG_HEAD_HELP', 			'Only with the Alliance of the La Venta people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- sunken courtyard
	SELECT 'TXT_KEY_BUILD_SUNK_COURT', 						'Construct a Sunken Courtyard'  UNION ALL
	SELECT 'TXT_KEY_BUILD_SUNK_COURT_HELP', 				'Requires an access to [COLOR_CYAN]Tiwanaku[ENDCOLOR]''s ability to be finished.[NEWLINE]Can only be built on a Flatland with [COLOR_CITY_BLUE]Plains[ENDCOLOR], [COLOR_CITY_BLUE]Tundra[ENDCOLOR] or [COLOR_CITY_BLUE]Desert[ENDCOLOR].[NEWLINE]Cannot be built next to another [COLOR_CITY_BROWN]Sunken Courtyard[ENDCOLOR] or on a [COLOR_GREY]Resource[ENDCOLOR].[NEWLINE][NEWLINE]+1 [ICON_RESEARCH] Science, if next to a City, and +1 [ICON_RESEARCH] Science and +1 [ICON_CULTURE] Culture, if next to a [COLOR_CITY_BLUE]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]Yield changes from Technologies:[NEWLINE][ICON_BULLET]+2 [ICON_PEACE] Faith with [COLOR_CYAN]Theology[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_TOURISM] Tourism with [COLOR_CYAN]Archaeology[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_RESEARCH] Science with [COLOR_CYAN]Radar[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_SUNK_COURT', 				'Sunken Courtyard' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_SUNK_COURT', 			'At its height, Tiwanaku was home to up to 40,000 people and was centered around a ceremonial core featuring numerous buildings, platforms, and courtyards, the largest and most important being the Semi-subterranean Court, the Kalasasaya and Putuni Complex (a combination of raised platforms and courtyards), the Akapana (a complicated mound structure believed to be a recreation of the Quimsachata mountains), and a later temple complex, the Pumapunku.[NEWLINE][NEWLINE]The sunken court style of building is found in many of the archaeological sites which pre-date the founding of Tiwanaku in the regions surrounding Lake Titicaca such as Pucara and Chiripa, but the Semi-subterranean Court is the largest found to date. Its increased size was likely a statement of growing political power by the emerging Tiwanaku polity. Completed between 300-400 C.E., it is estimated to be the earliest monumental stone building constructed in the central ceremonial area.[NEWLINE][NEWLINE]The central stones on three of the walls (north, east, and west) of the Semi-subterranean Court mark viewing points for various astronomical events, such as solstice and equinox sunrises and sunsets, the rising and setting of important stars, and even point the way to the celestial South Pole, the pivot of the southern hemisphere. Those stones were auxiliary for participants of religious rituals to orient themselves for the appropriate celestial event.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_SUNK_COURT_HELP', 			'Only with the Alliance of the Tiwanaku people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- buryuut hajar (bedouin camp)
	SELECT 'TXT_KEY_BUILD_BEDOUIN_CAMP', 					'Construct a Buryuut Hajar'  UNION ALL
	SELECT 'TXT_KEY_BUILD_BEDOUIN_CAMP_HELP', 				'Requires an access to [COLOR_CYAN]Al-Tirabin[ENDCOLOR]''s ability to be finished.[NEWLINE]Can only be built on [COLOR_CITY_BLUE]Desert[ENDCOLOR].[NEWLINE]Cannot be built next to a City, another [COLOR_CITY_BROWN]Buryuut Hajar[ENDCOLOR] or on a [COLOR_GREY]Resource[ENDCOLOR].[NEWLINE][NEWLINE]+1 [ICON_FOOD] Food, if next to a [COLOR_CITY_GREEN]Flood Plains[ENDCOLOR] or [COLOR_CITY_GREEN]Oasis[ENDCOLOR]. +1 [ICON_PRODUCTION] Production, if next to a [COLOR_GREY]Luxury Resource[ENDCOLOR]. +1 [ICON_GOLD] Gold, if on a [COLOR_CITY_BROWN]Road[ENDCOLOR] or +2 [ICON_GOLD] Gold, if on a [COLOR_CITY_BROWN]Railroad[ENDCOLOR].[NEWLINE][NEWLINE]Yield changes from Technologies:[NEWLINE][ICON_BULLET]+1 [ICON_CULTURE] Culture with [COLOR_CYAN]Compass[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_FOOD] Food with [COLOR_CYAN]Astronomy[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_GOLD] Gold with [COLOR_CYAN]Economics[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_GOLD] Gold with [COLOR_CYAN]Radio[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_FOOD] Food with [COLOR_CYAN]Radar[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_BEDOUIN_CAMP', 				'Buryuut Hajar' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_BEDOUIN_CAMP', 		'TODO' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_BEDOUIN_CAMP_HELP', 		'Only with the Alliance of the Al-Tirabin people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- chum
	SELECT 'TXT_KEY_BUILD_CHUM', 							'Construct a Chum'  UNION ALL
	SELECT 'TXT_KEY_BUILD_CHUM_HELP', 						'Requires an access to [COLOR_CYAN]Nyar''yana Marq[ENDCOLOR]''s ability to be finished.[NEWLINE]Can only be built on [COLOR_CITY_BLUE]Tundra[ENDCOLOR] or [COLOR_CITY_BLUE]Snow[ENDCOLOR].[NEWLINE]Cannot be built next to another [COLOR_CITY_BROWN]Chum[ENDCOLOR] or on a [COLOR_GREY]Resource[ENDCOLOR].[NEWLINE][NEWLINE]+1 [ICON_FOOD] Food, if next to a [COLOR_GREY]Bonus Resource[ENDCOLOR] and +1 [ICON_PRODUCTION] Production, if next to a [COLOR_CITY_BROWN]Camp[ENDCOLOR], [COLOR_CITY_BROWN]Pasture[ENDCOLOR] or [COLOR_CITY_BROWN]Daaq Ah[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Camps[ENDCOLOR], [COLOR_CITY_BROWN]Pastures[ENDCOLOR] and [COLOR_CITY_BROWN]Daaq Ah[ENDCOLOR] gain +1 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Yield changes from Technologies:[NEWLINE][ICON_BULLET]+1 [ICON_GOLD] Gold with [COLOR_CYAN]Philosophy[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_FOOD] Food with [COLOR_CYAN]Education[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_FOOD] Food with [COLOR_CYAN]Fertilizer[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production with [COLOR_CYAN]Refrigeration[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_CHUM', 						'Chum' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_CHUM', 				'A chum is a temporary dwelling used by the nomadic Uralic (Nenets, Nganasans, Enets, Khanty, Mansi, Komi) reindeer herders of northwestern Siberia of Russia. The Evenks, Tungusic peoples, tribes, in Russia, Mongolia and China also use chums. They are also used by the southernmost reindeer herders, of the Todzha region of the Republic of Tuva and their cross-border relatives in northern Mongolia. It has a design similar to a Native American tipi but some versions are less vertical. It is very closely related to the Sami lavvu in construction, but is somewhat larger in size. Some chums can be up to ten meters in diameter. [NEWLINE][NEWLINE]The traditional chum consists of reindeer hides sewn together and wrapped around wooden poles that are organized in a circle. In the middle there is a fireplace used for heating and to keep mosquitoes away. The smoke escapes through a hole at the top of the chum. The canvas and wooden poles are usually quite heavy, but could be carried by their reindeer. The chum is still in use today as a year-round shelter for the Yamal-Nenets, Khanty and Todzha Tyvan people of Russia.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_CHUM_HELP', 				'Only with the Alliance of the Nyar''ana Marq people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- daaq ah
	SELECT 'TXT_KEY_BUILD_DAAQ_AH', 						'Construct a Daaq Ah'  UNION ALL
	SELECT 'TXT_KEY_BUILD_DAAQ_AH_HELP', 					'Requires an access to [COLOR_CYAN]Mogadishu[ENDCOLOR]''s ability to be finished.[NEWLINE]Can be built on [COLOR_GREY]Bonus Pasture Resources[ENDCOLOR] to connect them.[NEWLINE]Can only be built on Hills with [COLOR_CITY_BLUE]Plains[ENDCOLOR] or [COLOR_CITY_BLUE]Desert[ENDCOLOR].[NEWLINE][NEWLINE]+2 [ICON_FOOD] Food, if next to a source of [COLOR_POSITIVE_TEXT]Fresh Water[ENDCOLOR]. +1 [ICON_CULTURE_LOCAL] Border Growth Point, if next to another [COLOR_CITY_BROWN]Daaq Ah[ENDCOLOR]. When a [COLOR_CITY_BROWN]Daaq Ah[ENDCOLOR] is built, and there''s no resource on its tile (including hidden), [ICON_RES_CATTLE] [COLOR_GREY]Cattle[ENDCOLOR] or [ICON_RES_SHEEP] [COLOR_GREY]Sheep[ENDCOLOR] is spawned underneath.[NEWLINE][NEWLINE]Yield changes from Technologies:[NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production with [COLOR_CYAN]Iron Working[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_GOLD] Gold Food with [COLOR_CYAN]Chivalry[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production with [COLOR_CYAN]Fertilizer[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production with [COLOR_CYAN]Biology[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_DAAQ_AH', 					'Daaq Ah' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_DAAQ_AH', 			'TODO' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_DAAQ_AH_HELP', 				'Only with the Alliance of the Mogadishu people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- funerary tower
	SELECT 'TXT_KEY_BUILD_FUNERARY_TOWER', 					'Construct a Funerary Tower'  UNION ALL
	SELECT 'TXT_KEY_BUILD_FUNERARY_TOWER_HELP', 			'Requires an access to [COLOR_CYAN]Palmyra[ENDCOLOR]''s ability to be finished.[NEWLINE]Can be built outside your territory, but must be adjacent to owned tile (claims the tile, when build is finished).[NEWLINE]Can only be built on a Flatland with [COLOR_CITY_BLUE]Desert[ENDCOLOR].[NEWLINE]Cannot be built on a [COLOR_GREY]Resource[ENDCOLOR].[NEWLINE][NEWLINE]+1 [ICON_PRODUCTION] Production, if on a [COLOR_CITY_BROWN]Road[ENDCOLOR] or +1 [ICON_PRODUCTION] Production and +1 [ICON_GOLDEN_AGE] Golden Age Point, if on a [COLOR_CITY_BROWN]Railroad[ENDCOLOR]. +1 [ICON_PEACE] Faith, for each adjacent [COLOR_CITY_BROWN]Funerary Tower[ENDCOLOR], and +1 [ICON_CULTURE] Culture, for each 2 adjacent [COLOR_CITY_BROWN]Funerary Towers[ENDCOLOR]. Closest City gains permanent +1 [ICON_CULTURE_LOCAL] Border Growth Point, when a [COLOR_CITY_BROWN]Funerary Tower[ENDCOLOR] is built.[NEWLINE][NEWLINE]Yield changes from Technologies:[NEWLINE][ICON_BULLET]+1 [ICON_CULTURE] Culture with [COLOR_CYAN]Writing[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PEACE] Faith with [COLOR_CYAN]Theology[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_CULTURE] Culture with [COLOR_CYAN]Architecture[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production with [COLOR_CYAN]Dynamite[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_FUNERARY_TOWER', 			'Funerary Tower' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_FUNERARY_TOWER', 		'TODO' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_FUNERARY_TOWER_HELP', 		'Only with the Alliance of the Palmyra people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- monastery
	SELECT 'TXT_KEY_BUILD_MONASTERY', 						'Construct a Monastery'  UNION ALL
	SELECT 'TXT_KEY_BUILD_MONASTERY_HELP', 					'Requires an access to [COLOR_CYAN]Karyes[ENDCOLOR]'' ability to be finished.[NEWLINE]Can only be built on a Hill.[NEWLINE]Cannot be built next to another [COLOR_CITY_BROWN]Monastery[ENDCOLOR], next to a City or on a [COLOR_GREY]Resource[ENDCOLOR].[NEWLINE][NEWLINE]+1 [ICON_PEACE] Faith, if next to a [COLOR_CITY_BLUE]Mountain[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Villages[ENDCOLOR] and [COLOR_CITY_BROWN]Towns[ENDCOLOR] gain +1 [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]Yield changes from Technologies:[NEWLINE][ICON_BULLET]+1 [ICON_PEACE] Faith with [COLOR_CYAN]Construction[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_CULTURE] Culture with [COLOR_CYAN]Theology[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_TOURISM] Tourism with [COLOR_CYAN]Scientific Theory[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PEACE] Faith with [COLOR_CYAN]Electricity[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MONASTERY', 				'Monastery' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MONASTERY', 			'A monastery was an enclosed and sometimes remote community of monks led by an abbot who shunned worldly goods to live a simple life of prayer and devotion. Christian monasteries first developed in the 4th century in Egypt and Syria and by the 5th century the idea had spread to Western Europe.[NEWLINE][NEWLINE]Such figures as Saint Benedict of Nursia (c. 480-c. 543), the founder of the Benedictine order and of the European monastery model, established rules by which the monks should live and these were, to various degrees, imitated and followed in subsequent centuries, including in those monasteries which survive today.[NEWLINE][NEWLINE]Although their members were poor, the monasteries themselves were rich and powerful institutions, gathering wealth from land and property donated to them. Monasteries were also important centres of learning which educated the young, and, perhaps most significantly for today''s historians, laboriously produced books and preserved ancient texts which have greatly enhanced our knowledge of not only the medieval world but also classical antiquity.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MONASTERY_HELP', 			'Only with the Alliance of the Karyes people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- mound
	SELECT 'TXT_KEY_BUILD_MOUND', 							'Construct a Mound'  UNION ALL
	SELECT 'TXT_KEY_BUILD_MOUND_HELP', 						'Requires an access to [COLOR_CYAN]Cahokia[ENDCOLOR]''s ability to be finished.[NEWLINE]Cannot be built next to another [COLOR_CITY_BROWN]Mound[ENDCOLOR] or on a [COLOR_GREY]Resource[ENDCOLOR].[NEWLINE][NEWLINE]+1 [ICON_GOLDEN_AGE] Golden Age Point, if next to a City. Adjacent [COLOR_CITY_BROWN]Villages[ENDCOLOR] and [COLOR_CITY_BROWN]Towns[ENDCOLOR] gain +1 [ICON_GOLD] Gold. +15% [ICON_STRENGTH] Defensive CS for units standing on a [COLOR_CITY_BROWN]Mound[ENDCOLOR].[NEWLINE][NEWLINE]Yield changes from Technologies:[NEWLINE][ICON_BULLET]+1 [ICON_GOLD] Gold with [COLOR_CYAN]Currency[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_GOLD] Gold with [COLOR_CYAN]Guilds[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_RESEARCH] Science with [COLOR_CYAN]Architecture[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_GREAT_GENERAL] Great General Point with [COLOR_CYAN]Military Science[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MOUND', 					'Mound' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MOUND', 				'It is a pyramid built of transported soil and clay.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MOUND_HELP', 				'Only with the Alliance of the Cahokia people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- phrourion
	SELECT 'TXT_KEY_BUILD_PHROURION', 						'Construct a Phroúrion'  UNION ALL
	SELECT 'TXT_KEY_BUILD_PHROURION_HELP', 					'Requires an access to [COLOR_CYAN]Bactra[ENDCOLOR]''s ability to be finished.[NEWLINE]Can be built on [ICON_RES_IVORY] [COLOR_GREY]Ivory[ENDCOLOR] to connect it.[NEWLINE]Can only be built adjacent to [COLOR_POSITIVE_TEXT]Fresh Water[ENDCOLOR].[NEWLINE]Cannot be built next to a City or on a [COLOR_GREY]Resource[ENDCOLOR].[NEWLINE][NEWLINE]When a [COLOR_CITY_BROWN]Phroúrion[ENDCOLOR] is built in a [COLOR_CITY_GREEN]Forest[ENDCOLOR] or [COLOR_CITY_GREEN]Jungle[ENDCOLOR], [ICON_RES_IVORY] [COLOR_GREY]Ivory[ENDCOLOR] is spawned underneath. Atacking unit will not leave a [COLOR_CITY_BROWN]Phroúrion[ENDCOLOR], if the enemy is killed. +40% [ICON_STRENGTH] Defensive CS for units standing on a [COLOR_CITY_BROWN]Phroúrion[ENDCOLOR]. Creates a [COLOR_POSITIVE_TEXT]Canal[ENDCOLOR], that allows Naval Units to move through it. [NEWLINE][NEWLINE]Yield changes from Technologies:[NEWLINE][ICON_BULLET]+1 [ICON_FOOD] Food with [COLOR_CYAN]Mathematics[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_GREAT_GENERAL] Great General Points with [COLOR_CYAN]Machinery[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_GOLD] Gold with [COLOR_CYAN]Architecture[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production with [COLOR_CYAN]Railroad[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_PHROURION', 				'Phroúrion' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_PHROURION', 			'TODO' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_PHROURION_HELP', 			'Only with the Alliance of the Bactra people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- ribat
	SELECT 'TXT_KEY_BUILD_RIBAT', 							'Construct a Ribat'  UNION ALL
	SELECT 'TXT_KEY_BUILD_RIBAT_HELP', 						'Requires an access to [COLOR_CYAN]Tunis[ENDCOLOR]'' ability to be finished.[NEWLINE]Can only be built on a [COLOR_CITY_BLUE]Desert[ENDCOLOR].[NEWLINE]Cannot be built on a [COLOR_GREY]Resource[ENDCOLOR] or next to a City.[NEWLINE][NEWLINE]+1 [ICON_CULTURE] Culture, if next to a [COLOR_CITY_BROWN]Town[ENDCOLOR] or [COLOR_CITY_BROWN]Village[ENDCOLOR]. +1 [ICON_PEACE] Faith, if on a [COLOR_CITY_BROWN]Road[ENDCOLOR] or +1 [ICON_GOLD] Gold and +1 [ICON_PEACE] Faith, if on a [COLOR_CITY_BROWN]Railroad[ENDCOLOR]. +15% [ICON_STRENGTH] Defensive CS for units standing on a [COLOR_CITY_BROWN]Ribat[ENDCOLOR].[NEWLINE][NEWLINE]Yield changes from Technologies:[NEWLINE][ICON_BULLET]+1 [ICON_CULTURE] Culture with [COLOR_CYAN]Engineering[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PEACE] Faith with [COLOR_CYAN]Architecture[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PEACE] Faith with [COLOR_CYAN]Military Science[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_GREAT_GENERAL] Great General Points with [COLOR_CYAN]Combined Arms[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_RIBAT', 					'Ribat' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_RIBAT', 				'TODO' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_RIBAT_HELP', 				'Only with the Alliance of the Tunis people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- torii (unfinished)
	SELECT 'TXT_KEY_BUILD_TORII', 							'Construct a Torii'  UNION ALL
	SELECT 'TXT_KEY_BUILD_TORII_HELP', 						'Requires an access to [COLOR_CYAN]Ishiyama[ENDCOLOR]''s ability to be finished.[NEWLINE]Can only be built on a Hill next to a City.[NEWLINE]Cannot be built on a [COLOR_GREY]Resource[ENDCOLOR].[NEWLINE][NEWLINE]Adjacent City gains 1 [ICON_CITIZEN] Citizen, when a [COLOR_CITY_BROWN]Tulou[ENDCOLOR] is built. Atacking unit will not leave a [COLOR_CITY_BROWN]Tulou[ENDCOLOR], if the enemy is killed. +30% [ICON_STRENGTH] Defensive CS for units standing on a [COLOR_CITY_BROWN]Tulou[ENDCOLOR]. Each [COLOR_CITY_BROWN]Tulou[ENDCOLOR] (even pillaged) increases [ICON_SILVER_FIST] Military Supply Cap by 1.[NEWLINE][NEWLINE]Yield changes from Technologies:[NEWLINE][ICON_BULLET]+1 [ICON_FOOD] Food with [COLOR_CYAN]Engineering[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production with [COLOR_CYAN]Civil Service[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_CULTURE] Culture with [COLOR_CYAN]Architecture[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_GREAT_GENERAL] Great General Points with [COLOR_CYAN]Military Service[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TORII', 					'Torii' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_TORII', 				'TODO' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TORII_HELP', 				'Only with the Alliance of the Ishiyama people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- gyáa''aang (totem pole)
	SELECT 'TXT_KEY_BUILD_TOTEM_POLE', 						'Construct a Gyáa''aang'  UNION ALL
	SELECT 'TXT_KEY_BUILD_TOTEM_POLE_HELP', 				'Requires an access to [COLOR_CYAN]SGang Gwaay[ENDCOLOR]''s ability to be finished.[NEWLINE]Can only be built on [COLOR_CITY_BLUE]Tundra[ENDCOLOR] with adjacent [COLOR_CITY_BLUE]Coast[ENDCOLOR], [COLOR_CITY_GREEN]Lake[ENDCOLOR], City, [COLOR_CITY_BROWN]Town[ENDCOLOR] or [COLOR_CITY_BROWN]Village[ENDCOLOR].[NEWLINE]Cannot be built on a [COLOR_GREY]Resource[ENDCOLOR].[NEWLINE][NEWLINE]+1 [ICON_CULTURE] Culture, if next to a City, [COLOR_CITY_BROWN]Town[ENDCOLOR] or [COLOR_CITY_BROWN]Village[ENDCOLOR]. +1 [ICON_GOLDEN_AGE] Golden Age Point, for each 2 adjacent [COLOR_CITY_BROWN]Gyáa''aang[ENDCOLOR]. Adjacent [COLOR_CITY_BLUE]Coast[ENDCOLOR] gain +1 [ICON_GOLDEN_AGE] Golden Age Point.[NEWLINE][NEWLINE]Yield changes from Technologies:[NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production with [COLOR_CYAN]Compass[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_CULTURE] Culture with [COLOR_CYAN]Navigation[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_TOURISM] Tourism with [COLOR_CYAN]Archaeology[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_TOURISM] Tourism with [COLOR_CYAN]Replaceable Parts[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TOTEM_POLE', 				'Gyáa''aang' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_TOTEM_POLE', 			'Totem poles, or in Haida, gyáa''aang, are a type of art and stylistic representation found in the Pacific North-west. Totem poles can symbolize the characters and events in mythology, or convey the experiences of recent ancestors and living people. Some of these characters may appear as stylistic representations of objects in nature, while others are more realistically carved. Pole carvings may include animals, fish, plants, insects, and humans, or they may represent supernatural beings such as the Thunderbird.[NEWLINE][NEWLINE]There are six basic types of upright, pole carvings that are commonly referred to as totem poles; House frontal poles, House posts, Mortuary poles, Memorial poles, Welcome poles, and Shame/ridicule poles. Each culture typically has complex rules and customs regarding the traditional designs represented on poles.[NEWLINE][NEWLINE]The designs are generally considered the property of a particular clan or family group of traditional carvers, and this ownership of the designs may not be transferred to the person who has commissioned the carvings.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TOTEM_POLE_HELP', 			'Only with the Alliance of the SGang Gwaay people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- tulou
	SELECT 'TXT_KEY_BUILD_TULOU', 							'Construct a Tulou'  UNION ALL
	SELECT 'TXT_KEY_BUILD_TULOU_HELP', 						'Requires an access to [COLOR_CYAN]Longyan[ENDCOLOR]''s ability to be finished.[NEWLINE]Can only be built on a Hill next to a City.[NEWLINE]Cannot be built on a [COLOR_GREY]Resource[ENDCOLOR].[NEWLINE][NEWLINE]Adjacent City gains 1 [ICON_CITIZEN] Citizen, when a [COLOR_CITY_BROWN]Tulou[ENDCOLOR] is built. Atacking unit will not leave a [COLOR_CITY_BROWN]Tulou[ENDCOLOR], if the enemy is killed. +30% [ICON_STRENGTH] Defensive CS for units standing on a [COLOR_CITY_BROWN]Tulou[ENDCOLOR]. Each [COLOR_CITY_BROWN]Tulou[ENDCOLOR] (even pillaged) increases [ICON_SILVER_FIST] Military Supply Cap by 1.[NEWLINE][NEWLINE]Yield changes from Technologies:[NEWLINE][ICON_BULLET]+1 [ICON_FOOD] Food with [COLOR_CYAN]Engineering[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production with [COLOR_CYAN]Civil Service[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_CULTURE] Culture with [COLOR_CYAN]Architecture[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_GREAT_GENERAL] Great General Points with [COLOR_CYAN]Military Service[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TULOU', 					'Tulou' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_TULOU', 				'TODO' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TULOU_HELP', 				'Only with the Alliance of the Longyan people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- dogo canario
	SELECT 'TXT_KEY_BUILD_DOGO_CANARIO', 					'Place a [ICON_RES_DOGO_CANARIO] Dogo Canario'  UNION ALL
	SELECT 'TXT_KEY_BUILD_DOGO_CANARIO_HELP', 				'Requires an access to [COLOR_CYAN]Adeje[ENDCOLOR]''s ability to be finished.[NEWLINE]Can only be placed on a Hill with [COLOR_CITY_BLUE]Plains[ENDCOLOR] or [COLOR_CITY_BLUE]Grassland[ENDCOLOR].[NEWLINE]Cannot be placed next to another [COLOR_GREY]Dogo Canario[ENDCOLOR].[NEWLINE][NEWLINE]Helps in breeding the [ICON_RES_DOGO_CANARIO] [COLOR_GREY]Dogo Canarios[ENDCOLOR], that can be improved with a [COLOR_CITY_BROWN]Camp[ENDCOLOR].[NEWLINE][NEWLINE]Adjacent [COLOR_CITY_BROWN]Pastures[ENDCOLOR] and [COLOR_CITY_BROWN]Daaq Ah[ENDCOLOR] gain +1 [ICON_FOOD] Food and +1 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Yield changes with Buildings:[NEWLINE][ICON_BULLET]+2 [ICON_PRODUCTION] Production with [COLOR_YIELD_FOOD]Agribusiness[ENDCOLOR][NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_DOGO_CANARIO', 				'Dogo Canario' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_DOGO_CANARIO', 		'Dogo Canario are a breed of dog native to the canary islands, a rare dog with a broad head and muscular body. They played a role in the myth, funeral customs and even diet of the guanches. Some were even mummified along with their owners.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_DOGO_CANARIO_HELP', 		'Only with the Alliance of the Adeje people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- llao llao
	SELECT 'TXT_KEY_BUILD_LLAO_LLAO', 						'Place a [ICON_RES_LLAO_LLAO] Llao Llao'  UNION ALL
	SELECT 'TXT_KEY_BUILD_LLAO_LLAO_HELP', 					'Requires an access to [COLOR_CYAN]Yaiuwa[ENDCOLOR]''s ability to be finished.[NEWLINE]Can only be placed on a coastal tile with [COLOR_CITY_GREEN]Forest[ENDCOLOR] or [COLOR_CITY_GREEN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]Prepares trees to take a [ICON_RES_LLAO_LLAO] [COLOR_GREY]Llao Llao[ENDCOLOR] mycelium, that is automatically improved with a [COLOR_CITY_BROWN]Plantation[ENDCOLOR].[NEWLINE][NEWLINE]All cities within a working radius gain +1 [ICON_RESEARCH] Science.[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_LLAO_LLAO', 				'Llao Llao' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_LLAO_LLAO', 			'TODO' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_LLAO_LLAO_HELP', 			'Only with the Alliance of the Yaiuwa people allow a civilization enjoy such a beauty of a structure.' UNION ALL
-- resources
SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO',					'Dogo Canario' UNION ALL
SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO_TEXT',			'Dogo Canario are a breed of dog native to the canary islands, a rare dog with a broad head and muscular body. They played a role in the myth, funeral customs and even diet of the guanches. Some were even mummified along with their owners.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO_MONOPOLY',		'Requires an access to [COLOR_CYAN]Adeje[ENDCOLOR]''s ability to be finished.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +3% [ICON_FOOD] and +3% [ICON_PRODUCTION] on Empire.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO_MONOPOLY_FULL',	'Requires an access to [COLOR_CYAN]Adeje[ENDCOLOR]''s ability to be finished.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +3% [ICON_FOOD] Food and +3% [ICON_PRODUCTION] Production in all owned Cities.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_LLAO_LLAO',					'Llao Llao' UNION ALL
SELECT 'TXT_KEY_RESOURCE_LLAO_LLAO_TEXT',				'TODO' UNION ALL
SELECT 'TXT_KEY_RESOURCE_LLAO_LLAO_MONOPOLY',			'Requires an access to [COLOR_CYAN]Yaiuwa[ENDCOLOR]''s ability to be placed.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +3% [ICON_FOOD] and +2 [ICON_HAPPINESS_1] on Empire.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_LLAO_LLAO_MONOPOLY_FULL',	'Requires an access to [COLOR_CYAN]Yaiuwa[ENDCOLOR]''s ability to be placed.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +3% [ICON_FOOD] Food in all owned Cities. +2 [ICON_HAPPINESS_1] Empire-Wide Happiness.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_REINDEER',						'Reindeer' UNION ALL
SELECT 'TXT_KEY_RESOURCE_REINDEER_TEXT',				'TODO' UNION ALL
SELECT 'TXT_KEY_RESOURCE_REINDEER_MONOPOLY',			'Requires an access to [COLOR_CYAN]Karasjohka[ENDCOLOR]''s ability to be placed.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_COINS',						'Coins' UNION ALL
SELECT 'TXT_KEY_RESOURCE_COINS_TEXT',					'TODO' UNION ALL
SELECT 'TXT_KEY_RESOURCE_COINS_MONOPOLY',				'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] -10% [ICON_GOLD] Purchase Cost.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_COINS_MONOPOLY_FULL',		'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] -10% [ICON_GOLD] Gold Purchase Cost.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_GUNPOWDER',					'Gunpowder' UNION ALL
SELECT 'TXT_KEY_RESOURCE_GUNPOWDER_TEXT',				'The invention of gunpowder is usually attributed to Chinese alchemists during the Tang dynasty, one of the "Four Great Inventions of China." The earliest written record of it - a formula composed of sulfur, charcoal and potassium nitrate dating to the later Song dynasty - was supposed to be an elixir for immortality... it was anything but. But the Chinese did discover that it burned explosively and the resultant gases expanded rapidly when exposed to heat; so it was useful for making fireworks. The Chinese found a more practical use for gunpowder in crude bombs and rockets which they used against the Mongols... until the Mongols overran China and then used the new weapon against everyone else on their path westward.[NEWLINE][NEWLINE]While the Mongols were using gunpowder to intimidate the Europeans they encountered, the Arabs sometime between 1240 and 1280 AD developed better recipes, purer niter, and more deadly weapons - notably cannon and a primitive arquebus. Some historical texts state that the Mamluks used the first cannon in history against the Mongols during the battle at Ain Jalut in 1260, but this is open to debate. The earliest description of a "portable hand cannon", however, does appear in an Arabic manuscript from the 14th Century. Once they''d turned back the Mongols, the Arabs put these to use elsewhere.[NEWLINE][NEWLINE]But it was the Europeans who really took to gunpowder as a means of wholesale slaughter. Not only did they improve the formula and add touches such as "corning" - using liquid to increase granularity and hence stability - and "smokeless" powder, but they created all sorts of toys that used it to hurl small and large bits of lead and iron at people. From the days of the Renaissance, military history in Europe was shaped by gunpowder, as it came to dominate the battlefield like no technology before.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_GUNPOWDER_MONOPOLY',			'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +5% [ICON_PRODUCTION] towards Gunpowder Units on Empire.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_GUNPOWDER_MONOPOLY_FULL',	'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +5% [ICON_PRODUCTION] Production towards Gunpowder Units in all owned Cities.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_BEER',							'Beer' UNION ALL
SELECT 'TXT_KEY_RESOURCE_BEER_TEXT',					'Beer is one of the oldest and most widely consumed alcoholic drinks in the world. It is also the third most popular drink overall after water and tea. Beer is brewed from cereal grains—most commonly from malted barley, though wheat, maize (corn), and rice are also used. During the brewing process, fermentation of the starch sugars in the wort produces ethanol and carbonation in the resulting beer.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_BEER_MONOPOLY',				'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_GREAT_ENGINEER] Great Engineer Points on Empire.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_BEER_MONOPOLY_FULL',			'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_GREAT_ENGINEER] Great Engineer Points in all owned Cities.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_CHEESE',						'Cheese' UNION ALL
SELECT 'TXT_KEY_RESOURCE_CHEESE_TEXT',					'Cheese is a dairy product derived from milk that is produced in a wide range of flavors, textures, and forms by coagulation of the milk protein casein. Over a thousand types of cheese from various countries are produced. Their styles, textures and flavors depend on the origin of the milk (including the animal''s diet), whether they have been pasteurized, the butterfat content, the bacteria and mold, the processing, and aging. Cheese is valued for its portability, long life, and high content of fat, protein, calcium, and phosphorus.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_CHEESE_MONOPOLY',				'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +2 [ICON_PRODUCTION] from all [ICON_RES_COW] Cattle and [ICON_RES_SHEEP] Sheep.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_CHEESE_MONOPOLY_FULL',		'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +2 [ICON_PRODUCTION] Production from all [ICON_RES_COW] Cattle and [ICON_RES_SHEEP] Sheep resources.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_HONEY',						'Honey' UNION ALL
SELECT 'TXT_KEY_RESOURCE_HONEY_TEXT',					'Honey is a sweet, viscous food substance made by bees and some related insects. Bees produce honey from the sugary secretions of plants (floral nectar) or from secretions of other insects (such as honeydew), by regurgitation, enzymatic activity, and water evaporation. Bees store honey in wax structures called honeycombs. Honey use and production have a long and varied history as an ancient activity. Several cave paintings in Cuevas de la Araña in Spain depict humans foraging for honey at least 8,000 years ago.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_HONEY_MONOPOLY',				'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_GOLD] from all [ICON_RES_MAIZE] Maizes, [ICON_RES_RICE] Rices and [ICON_RES_WHEAT] Wheats.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_HONEY_MONOPOLY_FULL',		'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_GOLD] Gold from all [ICON_RES_MAIZE] Maize, [ICON_RES_RICE] Rice and [ICON_RES_WHEAT] Wheat resources.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_ROPES',						'Ropes' UNION ALL
SELECT 'TXT_KEY_RESOURCE_ROPES_TEXT',					'TODO' UNION ALL
SELECT 'TXT_KEY_RESOURCE_ROPES_MONOPOLY',				'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_PRODUCTION] towards Naval Units on Empire.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_ROPES_MONOPOLY_FULL',		'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_PRODUCTION] Production towards Naval Units in all owned Cities.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_TAPESTRIES',					'Tapestries' UNION ALL
SELECT 'TXT_KEY_RESOURCE_TAPESTRIES_TEXT',				'TODO' UNION ALL
SELECT 'TXT_KEY_RESOURCE_TAPESTRIES_MONOPOLY',			'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_CULTURE] to Palace, all Religious Buildings and Castles.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_TAPESTRIES_MONOPOLY_FULL',	'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_CULTURE] Culture to Palace, all Religious Buildings and Castles.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_SCULPTURES',					'Sculptures' UNION ALL
SELECT 'TXT_KEY_RESOURCE_SCULPTURES_TEXT',				'TODO' UNION ALL
SELECT 'TXT_KEY_RESOURCE_SCULPTURES_MONOPOLY',			'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_GREAT_ARTIST] Great Artist Points on Empire.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_SCULPTURES_MONOPOLY_FULL',	'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_GREAT_ARTIST] Great Artist Points in all owned Cities.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_CHAMPAGNE',					'Champagne' UNION ALL
SELECT 'TXT_KEY_RESOURCE_CHAMPAGNE_TEXT',				'Champagne is a French sparkling wine. Many people use the term Champagne as a generic term for sparkling wine, but in the EU and some other countries, it is illegal to label any product Champagne unless it comes from the Champagne region of France and is produced under the rules of the appellation.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_CHAMPAGNE_MONOPOLY',			'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_GOLDEN_AGE] from all Luxuries.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_CHAMPAGNE_MONOPOLY_FULL',	'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_GOLDEN_AGE] Golden Age Point from all Luxury Resources.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_MANUSCRIPTS',					'Manuscripts' UNION ALL
SELECT 'TXT_KEY_RESOURCE_MANUSCRIPTS_TEXT',				'A Manuscript or Handwrit is written information that has been manually created by one or more people, such as a hand-written letter, as opposed to being printed or reproduced some other way. The term may also be used for information that is hand-recorded in other ways than writing, for example inscriptions that are chiselled upon a hard material or scratched (the original meaning of graffiti) as with a knife point in plaster or with a stylus on a waxed tablet (the way Romans made notes), or are in cuneiform writing, impressed with a pointed stylus in a flat tablet of unbaked clay.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_MANUSCRIPTS_MONOPOLY',			'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_RES_PAPER]. +10% [ICON_PRODUCTION] towards Diplomatic Units on Empire.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_MANUSCRIPTS_MONOPOLY_FULL',	'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_RES_PAPER] Paper. +10% [ICON_PRODUCTION] Production towards Diplomatic Units in all owned Cities.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_MOSAICS',						'Mosaics' UNION ALL
SELECT 'TXT_KEY_RESOURCE_MOSAICS_TEXT',					'TODO' UNION ALL
SELECT 'TXT_KEY_RESOURCE_MOSAICS_MONOPOLY',				'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_CULTURE] and +1 [ICON_PEACE] from all Holy Sites.';
--SELECT 'TXT_KEY_RESOURCE_MOSAICS_MONOPOLY_FULL',		'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_CULTURE] Culture and +1 [ICON_PEACE] Faith from all Holy Sites.';

INSERT INTO Language_en_US (Tag, Text)
-- cs traits/buildings/policies
SELECT 'TXT_KEY_MARITIME_BONUS', 						'[COLOR:90:205:40:255]Builders (Maritime):[ENDCOLOR][NEWLINE][ICON_BULLET]has a [ICON_WORKER] [COLOR_CITY_BROWN]Manufactory[ENDCOLOR] and an additional [COLOR_GREY]Bonus Resource[ENDCOLOR] nearby'  UNION ALL
SELECT 'TXT_KEY_MARITIME_FRIENDLY_BONUS', 					'[COLOR:200:240:140:255]Harvesters (Maritime Affable):[ENDCOLOR][NEWLINE][ICON_BULLET]1% Chance for spawning a [COLOR_YIELD_GOLD]Worker[ENDCOLOR] or a [COLOR_YIELD_GOLD]Fishing Boat[ENDCOLOR] inside Friends'' Territory (his Capital must be on a Coast to get a Fishing Boat)'  UNION ALL
SELECT 'TXT_KEY_MARITIME_NEUTRAL_BONUS', 					'[COLOR:110:160:70:255]Secured Warehouse (Maritime Pragmatic):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_MARITIME_HOSTILE_BONUS', 					'[COLOR:60:125:40:255]Selfish Gatherers (Maritime Reclusive):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_MARITIME_IRRATIONAL_BONUS', 				'[COLOR:160:255:85:255]Smugglers (Maritime Enigmatic):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
-------------------------------------------------
SELECT 'TXT_KEY_MERCANTILE_BONUS', 						'[COLOR:240:215:65:255]Trade Center (Mercantile):[ENDCOLOR][NEWLINE][ICON_BULLET]has a [ICON_CITY_STATE] [COLOR_CITY_BROWN]Town[ENDCOLOR] and an additional [COLOR_GREY]Luxury Resource[ENDCOLOR] nearby'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_FRIENDLY_BONUS', 				'[COLOR:240:240:165:255]Golden City (Mercantile Affable):[ENDCOLOR][NEWLINE][ICON_BULLET]1% Chance for spawning a [ICON_CARAVAN] [COLOR_YIELD_GOLD]Caravan[ENDCOLOR] or a [ICON_CARGO_SHIP] [COLOR_YIELD_GOLD]Cargo Ship[ENDCOLOR] inside Friends'' Territory (his Capital must be on a Coast to get a [ICON_CARGO_SHIP] Cargo Ship)'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_NEUTRAL_BONUS', 					'[COLOR:210:210:70:255]Shadow Council (Mercantile Pragmatic):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_HOSTILE_BONUS', 					'[COLOR:130:130:20:255]Free City (Mercantile Reclusive):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_IRRATIONAL_BONUS', 				'[COLOR:255:255:120:255]Black Market (Mercantile Enigmatic):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
-------------------------------------------------
SELECT 'TXT_KEY_MILITARISTIC_BONUS', 					'[COLOR:245:40:40:255]Fortress (Militaristic):[ENDCOLOR][NEWLINE][ICON_BULLET]has a [ICON_WAR] [COLOR_CITY_BROWN]Fort[ENDCOLOR] and an additional [COLOR_GREY]Strategic Resource[ENDCOLOR] nearby[NEWLINE][ICON_BULLET]can train its Unique Unit'  UNION ALL -- [NEWLINE][ICON_BULLET]Major Player can upgrade his units inside their territory, if Allied
SELECT 'TXT_KEY_MILITARISTIC_FRIENDLY_BONUS', 				'[COLOR:255:180:180:255]Mercenary Hub (Militaristic Affable):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_NEUTRAL_BONUS', 				'[COLOR:245:90:90:255]Sellsword Army (Militaristic Pragmatic):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_HOSTILE_BONUS', 				'[COLOR:170:10:10:255]Hermit Dragon (Militaristic Reclusive):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_IRRATIONAL_BONUS', 			'[COLOR:210:160:160:255]Shadow Council (Militaristic Enigmatic):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
-------------------------------------------------
SELECT 'TXT_KEY_CULTURED_BONUS', 						'[COLOR:210:65:200:255]Center of Learning (Cultured):[ENDCOLOR][NEWLINE][ICON_BULLET]has an [ICON_RESEARCH] [COLOR_CITY_BROWN]Academy[ENDCOLOR] and an [ICON_RES_ARTIFACTS] Archaeological Site nearby[NEWLINE][ICON_BULLET]0.5% Chance for creating a [ICON_GREAT_WORK] Great Work for any Friend or Ally'  UNION ALL
SELECT 'TXT_KEY_CULTURED_FRIENDLY_BONUS', 					'[COLOR:240:180:235:255]Open University (Cultured Affable):[ENDCOLOR][NEWLINE][ICON_BULLET]1% Chance for spawning an [ICON_VP_ARTIFACT] [COLOR_YIELD_GOLD]Archaeologist[ENDCOLOR] inside Friends'' Territory (after researching Archaeology)'  UNION ALL
SELECT 'TXT_KEY_CULTURED_NEUTRAL_BONUS', 					'[COLOR:210:90:195:255]Patronage (Cultured Pragmatic):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_CULTURED_HOSTILE_BONUS', 					'[COLOR:130:30:115:255]Reclusive Court (Cultured Reclusive):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_CULTURED_IRRATIONAL_BONUS', 				'[COLOR:255:125:240:255]Fortune Tellers (Cultured Enigmatic):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
-------------------------------------------------
SELECT 'TXT_KEY_RELIGIOUS_BONUS', 						'[COLOR:25:110:250:255]Center of Faith (Religious):[ENDCOLOR][NEWLINE][ICON_BULLET]has a [ICON_RELIGION] [COLOR_CITY_BROWN]Holy Site[ENDCOLOR] nearby'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_FRIENDLY_BONUS', 					'[COLOR:160:220:250:255]Open Mind (Religious Affable):[ENDCOLOR][NEWLINE][ICON_BULLET]1% Chance for spawning a [ICON_MISSIONARY] [COLOR_YIELD_GOLD]Missionary[ENDCOLOR] inside Friends'' Territory[NEWLINE][ICON_BULLET]+10% [ICON_PEACE] Religious Pressure[NEWLINE][ICON_BULLET]-25% [ICON_PEACE] Conversion Resistance'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_NEUTRAL_BONUS', 					'[COLOR:105:155:230:255]Medicant Orders (Religious Pragmatic):[ENDCOLOR][NEWLINE][ICON_BULLET]+25% [ICON_PEACE] Religious Pressure'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_HOSTILE_BONUS', 					'[COLOR:25:110:170:255]One Truth (Religious Reclusive):[ENDCOLOR][NEWLINE][ICON_BULLET]+40% [ICON_PEACE] Religious Pressure[NEWLINE][ICON_BULLET]+25% [ICON_PEACE] Conversion Resistance'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_IRRATIONAL_BONUS', 				'[COLOR:50:130:255:255]Hidden Monastery (Religious Enigmatic):[ENDCOLOR][NEWLINE][ICON_BULLET]+30% [ICON_PEACE] Religious Pressure[NEWLINE][ICON_BULLET]-15% [ICON_PEACE] Conversion Resistance'  UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_FRIENDLY', 			'_HP boost small' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_FRIENDLY_HELP', 			'+1 City HP.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL', 				'_HP boost medium' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL_HELP', 			'+2 City HP.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE', 				'_HP boost huge' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE_HELP', 			'+3 City HP.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_FRIENDLY', 			'_Pressure boost small' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_FRIENDLY_HELP', 			'+10% [ICON_PEACE] Religious Pressure and -25% [ICON_PEACE] Conversion Resistance.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL', 				'_Pressure boost medium' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL_HELP', 			'+25% [ICON_PEACE] Religious Pressure.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE', 				'_Pressure boost huge' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE_HELP', 			'+40% [ICON_PEACE] Religious Pressure and +25% [ICON_PEACE] Conversion Resistance.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_IRRATIONAL', 			'_Pressure boost undecided' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_IRRATIONAL_HELP', 			'+30% [ICON_PEACE] Religious Pressure and -15% [ICON_PEACE] Conversion Resistance.' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_MARITIME', 							'Builders' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_MERCANTILE', 							'Trade Center' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_MILITARISTIC', 						'Fortress' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_CULTURED', 							'Center of Learning' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_RELIGIOUS', 							'Center of Faith';

INSERT INTO Language_en_US (Tag, Text)
-- regular buildings
SELECT 'TXT_KEY_BUILDING_ARMAGH1', 						'Naomh Gaelach' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH1_HELP', 				'Requires an access to [COLOR_CYAN]Armagh[ENDCOLOR]''s ability.[NEWLINE][NEWLINE]+5% [ICON_CULTURE] Culture, and for each [COLOR_YIELD_FOOD]Naomh Gaelach[ENDCOLOR] this modifier is increased by an additional 1%. Reduces [ICON_HAPPINESS_3] Boredom.[NEWLINE][NEWLINE]Starts 10-turn [ICON_HAPPINESS_1] WLTKD.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH2', 						'Naomh Breandán' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH2_HELP', 				'Requires an access to [COLOR_CYAN]Armagh[ENDCOLOR]''s ability.[NEWLINE][NEWLINE]+5% [ICON_RESEARCH] Science, and for each [COLOR_YIELD_FOOD]Naomh Breandán[ENDCOLOR] this modifier is increased by an additional 1%. Reduces [ICON_HAPPINESS_3] Illiteracy.[NEWLINE][NEWLINE]Starts 10-turn [ICON_HAPPINESS_1] WLTKD.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH3', 						'Naomh Pádraig' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH3_HELP', 				'Requires an access to [COLOR_CYAN]Armagh[ENDCOLOR]''s ability.[NEWLINE][NEWLINE]+5% [ICON_GOLD] Gold, and for each [COLOR_YIELD_FOOD]Naomh Pádraig[ENDCOLOR] this modifier is increased by an additional 1%. Reduces [ICON_HAPPINESS_3] Poverty.[NEWLINE][NEWLINE]Starts 10-turn [ICON_HAPPINESS_1] WLTKD.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH4', 						'Naomh Bríd' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH4_HELP', 				'Requires an access to [COLOR_CYAN]Armagh[ENDCOLOR]''s ability.[NEWLINE][NEWLINE]+2% [ICON_FOOD] Food and +2% [ICON_PRODUCTION] Production, and for each [COLOR_YIELD_FOOD]Naomh Bríd[ENDCOLOR] this modifier is increased by an additional 1%. Reduces [ICON_HAPPINESS_3] Distress.[NEWLINE][NEWLINE]Starts 10-turn [ICON_HAPPINESS_1] WLTKD.' UNION ALL
SELECT 'TXT_KEY_BUILDING_JERUSALEM', 					'Holy City' UNION ALL
SELECT 'TXT_KEY_BUILDING_JERUSALEM_HELP', 				'Built after adopting Majority Religion of its Ally.[NEWLINE][NEWLINE]This city becomes a Holy City. Too many have made the pilgrimage to this city for their religion.[NEWLINE][NEWLINE]+100% [ICON_PEACE] Religious Pressure.' UNION ALL
SELECT 'TXT_KEY_BUILDING_KIEV', 						'Bylina' UNION ALL
SELECT 'TXT_KEY_BUILDING_KIEV_HELP', 					'Requires an access to [COLOR_CYAN]Kyiv[ENDCOLOR]''s ability.[NEWLINE][NEWLINE]+2 [ICON_GREAT_MUSICIAN]. 1 Musician slot. 1 slot for [ICON_GREAT_WORK] Great Work of Music. 1 Specialist in the City no longer generates [ICON_HAPPINESS_3] Unhappiness from Urbanization.' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILAN', 						'Visconti Emissary' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILAN_HELP', 					'Requires an access to [COLOR_CYAN]Milan[ENDCOLOR]''s ability.[NEWLINE][NEWLINE]+2 [ICON_GREAT_ARTIST]. 1 Artist slot. 1 slot for [ICON_GREAT_WORK] Great Work of Art or Artifact. 1 Specialist in the City no longer generates [ICON_HAPPINESS_3] Unhappiness from Urbanization.' UNION ALL
SELECT 'TXT_KEY_BUILDING_VILNIUS', 						'The Gate of Dawn' UNION ALL
SELECT 'TXT_KEY_BUILDING_VILNIUS_HELP', 				'Requires an access to [COLOR_CYAN]Vilnius[ENDCOLOR]''s ability.[NEWLINE][NEWLINE]+2 [ICON_GREAT_WRITER]. 1 Writer slot. 1 slot for [ICON_GREAT_WORK] Great Work of Writing. 1 Specialist in the City no longer generates [ICON_HAPPINESS_3] Unhappiness from Urbanization.' UNION ALL
SELECT 'TXT_KEY_BUILDING_RISHIKESH', 					'Ashram' UNION ALL
SELECT 'TXT_KEY_BUILDING_RISHIKESH_HELP', 				'Requires an access to [COLOR_CYAN]Rishikesh[ENDCOLOR]''s ability.[NEWLINE][NEWLINE]+1 [ICON_CULTURE] and +1 [ICON_PEACE] Faith for every 2 Mountain tiles within their workable radius. -1 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest, Urbanization and Boredom.' UNION ALL
SELECT 'TXT_KEY_BUILDING_VALLETTA', 					'The Grand Harbor' UNION ALL
SELECT 'TXT_KEY_BUILDING_VALLETTA_HELP', 				'City must be on Coast and Player must have an access to [COLOR_CYAN]Valletta[ENDCOLOR]''s ability.[NEWLINE][NEWLINE]+2 [ICON_FOOD] Food and +2 [ICON_RESEARCH] Science (lost without the Alliance). +15 XP to all newly trained Naval Units. +25 City HP.' UNION ALL
-- world wonders
SELECT 'TXT_KEY_BUILDING_LHASA', 						'Potala Palace' UNION ALL
SELECT 'TXT_KEY_BUILDING_LHASA_HELP', 					'+10% [ICON_CULTURE] Culture and +10% [ICON_FOOD] Food. Grants 1 additional delegate in the World Congress. Requires an access to [COLOR_CYAN]Lhasa[ENDCOLOR]''s ability and an active session of the [COLOR_POSITIVE_TEXT]World Congress[ENDCOLOR]. Yield modifiers halved without the Alliance.' UNION ALL
SELECT 'TXT_KEY_BUILDING_LHASA_QUOTE', 					'[NEWLINE]"The first time I stepped onto the rooftop of the Potala Palace, I felt, as never before or since, as if I were stepping onto the rooftop of my being; onto some dimension of consciousness that I''d never visited before."[NEWLINE] - Pico Iyer[NEWLINE]';
---------------------------------------------------
---------------------------------------------------
--==========================================================================================================================
-- DEFINITIONS
--==========================================================================================================================	
---------------------------------------------------
-- Definitions - Minor Civilizations
---------------------------------------------------
INSERT INTO MinorCivilizations 
			(Type, 						ShortDescription, 					Civilopedia, 						Description, 						Adjective, 								ArtDefineTag, 					DefaultPlayerColor, 				ArtStyleType, 				ArtStyleSuffix, 	ArtStylePrefix, 	MinorCivTrait,					FixedPersonality,	BullyUnitClass)
SELECT 		'MINOR_CIV_ADEJE', 			'TXT_KEY_CITYSTATE_ADEJE', 			'TXT_KEY_CIV5_ADEJE_TEXT', 			'TXT_KEY_CITYSTATE_ADEJE', 			'TXT_KEY_CITYSTATE_ADEJE_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MARITIME',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_AL_TIRABIN', 	'TXT_KEY_CITYSTATE_AL_TIRABIN', 	'TXT_KEY_CIV5_AL_TIRABIN_TEXT', 	'TXT_KEY_CITYSTATE_AL_TIRABIN', 	'TXT_KEY_CITYSTATE_AL_TIRABIN_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'TXT_KEY_CITYSTATE_AMBRACIA', 		'TXT_KEY_CIV5_AMBRACIA_TEXT', 		'TXT_KEY_CITYSTATE_AMBRACIA', 		'TXT_KEY_CITYSTATE_AMBRACIA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_ANANGULA', 		'TXT_KEY_CITYSTATE_ANANGULA', 		'TXT_KEY_CIV5_ANANGULA_TEXT',		'TXT_KEY_CITYSTATE_ANANGULA',		'TXT_KEY_CITYSTATE_ANANGULA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_CULTURED',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_ANDORRA', 		'TXT_KEY_CITYSTATE_ANDORRA', 		'TXT_KEY_CIV5_ANDORRA_TEXT', 		'TXT_KEY_CITYSTATE_ANDORRA', 		'TXT_KEY_CITYSTATE_ANDORRA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_BLUE', 			'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_CULTURED',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_ARMAGH', 		'TXT_KEY_CITYSTATE_ARMAGH', 		'TXT_KEY_CIV5_ARMAGH_TEXT', 		'TXT_KEY_CITYSTATE_ARMAGH', 		'TXT_KEY_CITYSTATE_ARMAGH_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'TXT_KEY_CITYSTATE_AUCKLAND', 		'TXT_KEY_CIV5_AUCKLAND_TEXT', 		'TXT_KEY_CITYSTATE_AUCKLAND', 		'TXT_KEY_CITYSTATE_AUCKLAND_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_BLUE', 			'ARTSTYLE_POLYNESIAN', 		'_POLYNESIA', 		'ASIAN', 			'MINOR_TRAIT_MARITIME',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_AYUTTHAYA', 		'TXT_KEY_CITYSTATE_AYUTTHAYA', 		'TXT_KEY_CIV5_AYUTTHAYA_TEXT', 		'TXT_KEY_CITYSTATE_AYUTTHAYA', 		'TXT_KEY_CITYSTATE_AYUTTHAYA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_CULTURED',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_BAGAN', 			'TXT_KEY_CITYSTATE_BAGAN', 			'TXT_KEY_CIV5_BAGAN_TEXT', 			'TXT_KEY_CITYSTATE_BAGAN', 			'TXT_KEY_CITYSTATE_BAGAN_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_BALKH', 			'TXT_KEY_CITYSTATE_BALKH', 			'TXT_KEY_CIV5_BALKH_TEXT', 			'TXT_KEY_CITYSTATE_BALKH', 			'TXT_KEY_CITYSTATE_BALKH_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_BEDULU', 		'TXT_KEY_CITYSTATE_BEDULU', 		'TXT_KEY_CIV5_BEDULU_TEXT', 		'TXT_KEY_CITYSTATE_BEDULU', 		'TXT_KEY_CITYSTATE_BEDULU_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'TXT_KEY_CITYSTATE_CANOSSA', 		'TXT_KEY_CIV5_CANOSSA_TEXT', 		'TXT_KEY_CITYSTATE_CANOSSA', 		'TXT_KEY_CITYSTATE_CANOSSA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_CHEVAK', 		'TXT_KEY_CITYSTATE_CHEVAK', 		'TXT_KEY_CIV5_CHEVAK_TEXT', 		'TXT_KEY_CITYSTATE_CHEVAK', 		'TXT_KEY_CITYSTATE_CHEVAK_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MARITIME',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_CLERMONT', 		'TXT_KEY_CITYSTATE_CLERMONT', 		'TXT_KEY_CIV5_CLERMONT_TEXT', 		'TXT_KEY_CITYSTATE_CLERMONT', 		'TXT_KEY_CITYSTATE_CLERMONT_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DAKKAR', 		'TXT_KEY_CITYSTATE_DAKKAR', 		'TXT_KEY_CIV5_DAKKAR_TEXT', 		'TXT_KEY_CITYSTATE_DAKKAR', 		'TXT_KEY_CITYSTATE_DAKKAR_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DALI', 			'TXT_KEY_CITYSTATE_DALI', 			'TXT_KEY_CIV5_DALI_TEXT', 			'TXT_KEY_CITYSTATE_DALI', 			'TXT_KEY_CITYSTATE_DALI_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DANO', 			'TXT_KEY_CITYSTATE_DANO', 			'TXT_KEY_CIV5_DANO_TEXT', 			'TXT_KEY_CITYSTATE_DANO', 			'TXT_KEY_CITYSTATE_DANO_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_BLUE', 	'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'TXT_KEY_CITYSTATE_DJIBOUTI', 		'TXT_KEY_CIV5_DJIBOUTI_TEXT', 		'TXT_KEY_CITYSTATE_DJIBOUTI', 		'TXT_KEY_CITYSTATE_DJIBOUTI_ADJ', 		'ART_DEF_CIVILIZATION_MINOR',	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MARITIME',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'TXT_KEY_CITYSTATE_DODOMA', 		'TXT_KEY_CIV5_DODOMA_TEXT', 		'TXT_KEY_CITYSTATE_DODOMA', 		'TXT_KEY_CITYSTATE_DODOMA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_YELLOW', 		'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DOUALA', 		'TXT_KEY_CITYSTATE_DOUALA', 		'TXT_KEY_CIV5_DOUALA_TEXT', 		'TXT_KEY_CITYSTATE_DOUALA', 		'TXT_KEY_CITYSTATE_DOUALA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_BLUE', 	'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'TXT_KEY_CITYSTATE_FAYA', 			'TXT_KEY_CIV5_FAYA_TEXT', 			'TXT_KEY_CITYSTATE_FAYA', 			'TXT_KEY_CITYSTATE_FAYA_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'TXT_KEY_CITYSTATE_GRANADA', 		'TXT_KEY_CIV5_GRANADA_TEXT', 		'TXT_KEY_CITYSTATE_GRANADA', 		'TXT_KEY_CITYSTATE_GRANADA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_YELLOW', 		'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'TXT_KEY_CITYSTATE_GWYNEDD', 		'TXT_KEY_CIV5_GWYNEDD_TEXT', 		'TXT_KEY_CITYSTATE_GWYNEDD', 		'TXT_KEY_CITYSTATE_GWYNEDD_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_CULTURED',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_HANUABADA', 		'TXT_KEY_CITYSTATE_HANUABADA', 		'TXT_KEY_CIV5_HANUABADA_TEXT', 		'TXT_KEY_CITYSTATE_HANUABADA', 		'TXT_KEY_CITYSTATE_HANUABADA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_PURPLE', 	'ARTSTYLE_POLYNESIAN', 		'_POLYNESIA', 		'ASIAN', 			'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'TXT_KEY_CITYSTATE_HONDURAS', 		'TXT_KEY_CIV5_HONDURAS_TEXT', 		'TXT_KEY_CITYSTATE_HONDURAS', 		'TXT_KEY_CITYSTATE_HONDURAS_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_HONIARA', 		'TXT_KEY_CITYSTATE_HONIARA', 		'TXT_KEY_CIV5_HONIARA_TEXT', 		'TXT_KEY_CITYSTATE_HONIARA', 		'TXT_KEY_CITYSTATE_HONIARA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_PURPLE', 	'ARTSTYLE_POLYNESIAN', 		'_POLYNESIA', 		'ASIAN', 			'MINOR_TRAIT_MARITIME',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_IRUNEA', 		'TXT_KEY_CITYSTATE_IRUNEA', 		'TXT_KEY_CIV5_IRUNEA_TEXT', 		'TXT_KEY_CITYSTATE_IRUNEA', 		'TXT_KEY_CITYSTATE_IRUNEA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_PURPLE', 	'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MARITIME',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_ISKANWAYA', 		'TXT_KEY_CITYSTATE_ISKANWAYA', 		'TXT_KEY_CIV5_ISKANWAYA_TEXT', 		'TXT_KEY_CITYSTATE_ISKANWAYA', 		'TXT_KEY_CITYSTATE_ISKANWAYA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_BLUE', 			'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_JETARKTE', 		'TXT_KEY_CITYSTATE_JETARKTE', 		'TXT_KEY_CIV5_JETARKTE_TEXT',		'TXT_KEY_CITYSTATE_JETARKTE',		'TXT_KEY_CITYSTATE_JETARKTE_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_YELLOW',			'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MARITIME',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_JUYUBIT', 		'TXT_KEY_CITYSTATE_JUYUBIT', 		'TXT_KEY_CIV5_JUYUBIT_TEXT',		'TXT_KEY_CITYSTATE_JUYUBIT',		'TXT_KEY_CITYSTATE_JUYUBIT_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN',			'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MARITIME',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_KARASJOHKA', 	'TXT_KEY_CITYSTATE_KARASJOHKA', 	'TXT_KEY_CIV5_KARASJOHKA_TEXT', 	'TXT_KEY_CITYSTATE_KARASJOHKA', 	'TXT_KEY_CITYSTATE_KARASJOHKA_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_CULTURED',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_KARYES', 		'TXT_KEY_CITYSTATE_KARYES', 		'TXT_KEY_CIV5_KARYES_TEXT', 		'TXT_KEY_CITYSTATE_KARYES', 		'TXT_KEY_CITYSTATE_KARYES_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_GRECO_ROMAN', 	'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_KATENDE', 		'TXT_KEY_CITYSTATE_KATENDE', 		'TXT_KEY_CIV5_KATENDE_TEXT', 		'TXT_KEY_CITYSTATE_KATENDE', 		'TXT_KEY_CITYSTATE_KATENDE_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_PURPLE', 	'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_CULTURED',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'TXT_KEY_CITYSTATE_KIGALI', 		'TXT_KEY_CIV5_KIGALI_TEXT', 		'TXT_KEY_CITYSTATE_KIGALI', 		'TXT_KEY_CITYSTATE_KIGALI_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'TXT_KEY_CITYSTATE_LACONIA', 		'TXT_KEY_CIV5_LACONIA_TEXT', 		'TXT_KEY_CITYSTATE_LACONIA', 		'TXT_KEY_CITYSTATE_LACONIA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_LAHORE', 		'TXT_KEY_CITYSTATE_LAHORE', 		'TXT_KEY_CIV5_LAHORE_TEXT', 		'TXT_KEY_CITYSTATE_LAHORE', 		'TXT_KEY_CITYSTATE_LAHORE_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'TXT_KEY_CITYSTATE_LEVUKA', 		'TXT_KEY_CIV5_LEVUKA_TEXT', 		'TXT_KEY_CITYSTATE_LEVUKA', 		'TXT_KEY_CITYSTATE_LEVUKA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_BLUE', 			'ARTSTYLE_POLYNESIAN', 		'_POLYNESIA', 		'ASIAN', 			'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_LONGYAN', 		'TXT_KEY_CITYSTATE_LONGYAN', 		'TXT_KEY_CIV5_LONGYAN_TEXT', 		'TXT_KEY_CITYSTATE_LONGYAN', 		'TXT_KEY_CITYSTATE_LONGYAN_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_PURPLE', 	'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'TXT_KEY_CITYSTATE_MANAGUA', 		'TXT_KEY_CIV5_MANAGUA_TEXT', 		'TXT_KEY_CITYSTATE_MANAGUA', 		'TXT_KEY_CITYSTATE_MANAGUA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_CULTURED',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MBABANE', 		'TXT_KEY_CITYSTATE_MBABANE', 		'TXT_KEY_CIV5_MBABANE_TEXT', 		'TXT_KEY_CITYSTATE_MBABANE', 		'TXT_KEY_CITYSTATE_MBABANE_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MENDYARRUP', 	'TXT_KEY_CITYSTATE_MENDYARRUP', 	'TXT_KEY_CIV5_MENDYARRUP_TEXT', 	'TXT_KEY_CITYSTATE_MENDYARRUP', 	'TXT_KEY_CITYSTATE_MENDYARRUP_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_PURPLE', 	'ARTSTYLE_POLYNESIAN', 		'_POLYNESIA', 		'ASIAN', 			'MINOR_TRAIT_MARITIME',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MUISCA', 		'TXT_KEY_CITYSTATE_MUISCA', 		'TXT_KEY_CIV5_MUISCA_TEXT', 		'TXT_KEY_CITYSTATE_MUISCA', 		'TXT_KEY_CITYSTATE_MUISCA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MULTAN', 		'TXT_KEY_CITYSTATE_MULTAN', 		'TXT_KEY_CIV5_MULTAN_TEXT', 		'TXT_KEY_CITYSTATE_MULTAN', 		'TXT_KEY_CITYSTATE_MULTAN_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'TXT_KEY_CITYSTATE_MUSCAT', 		'TXT_KEY_CIV5_MUSCAT_TEXT', 		'TXT_KEY_CITYSTATE_MUSCAT', 		'TXT_KEY_CITYSTATE_MUSCAT_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MUTITJULU', 		'TXT_KEY_CITYSTATE_MUTITJULU', 		'TXT_KEY_CIV5_MUTITJULU_TEXT', 		'TXT_KEY_CITYSTATE_MUTITJULU', 		'TXT_KEY_CITYSTATE_MUTITJULU_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_PURPLE', 	'ARTSTYLE_POLYNESIAN', 		'_POLYNESIA', 		'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_NAN_MADOL', 		'TXT_KEY_CITYSTATE_NAN_MADOL', 		'TXT_KEY_CIV5_NAN_MADOL_TEXT', 		'TXT_KEY_CITYSTATE_NAN_MADOL',		'TXT_KEY_CITYSTATE_NAN_MADOL_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_POLYNESIAN', 		'_POLYNESIA', 		'ASIAN', 			'MINOR_TRAIT_CULTURED',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_NYARYANA_MARQ', 	'TXT_KEY_CITYSTATE_NYARYANA_MARQ', 	'TXT_KEY_CIV5_NYARYANA_MARQ_TEXT', 	'TXT_KEY_CITYSTATE_NYARYANA_MARQ', 	'TXT_KEY_CITYSTATE_NYARYANA_MARQ_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GRAY', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_CULTURED',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'TXT_KEY_CITYSTATE_OC_EO', 			'TXT_KEY_CIV5_OC_EO_TEXT', 			'TXT_KEY_CITYSTATE_OC_EO', 			'TXT_KEY_CITYSTATE_OC_EO_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'TXT_KEY_CITYSTATE_ODENSO', 		'TXT_KEY_CIV5_ODENSO_TEXT', 		'TXT_KEY_CITYSTATE_ODENSO', 		'TXT_KEY_CITYSTATE_ODENSO_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_PURPLE', 	'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_OUIDAH', 		'TXT_KEY_CITYSTATE_OUIDAH', 		'TXT_KEY_CIV5_OUIDAH_TEXT', 		'TXT_KEY_CITYSTATE_OUIDAH', 		'TXT_KEY_CITYSTATE_OUIDAH_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_BLUE', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_PALMYRA', 		'TXT_KEY_CITYSTATE_PALMYRA', 		'TXT_KEY_CIV5_PALMYRA_TEXT', 		'TXT_KEY_CITYSTATE_PALMYRA', 		'TXT_KEY_CITYSTATE_PALMYRA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_PELYM', 			'TXT_KEY_CITYSTATE_PELYM', 			'TXT_KEY_CIV5_PELYM_TEXT', 			'TXT_KEY_CITYSTATE_PELYM', 			'TXT_KEY_CITYSTATE_PELYM_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'TXT_KEY_CITYSTATE_PHANOTEUS', 		'TXT_KEY_CIV5_PHANOTEUS_TEXT', 		'TXT_KEY_CITYSTATE_PHANOTEUS', 		'TXT_KEY_CITYSTATE_PHANOTEUS_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_BLUE', 	'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_POKROVKA', 		'TXT_KEY_CITYSTATE_POKROVKA', 		'TXT_KEY_CIV5_POKROVKA_TEXT', 		'TXT_KEY_CITYSTATE_POKROVKA', 		'TXT_KEY_CITYSTATE_POKROVKA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_YELLOW', 	'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'TXT_KEY_CITYSTATE_QUELIMANE', 		'TXT_KEY_CIV5_QUELIMANE_TEXT', 		'TXT_KEY_CITYSTATE_QUELIMANE', 		'TXT_KEY_CITYSTATE_QUELIMANE_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_RISHIKESH', 		'TXT_KEY_CITYSTATE_RISHIKESH', 		'TXT_KEY_CIV5_RISHIKESH_TEXT', 		'TXT_KEY_CITYSTATE_RISHIKESH', 		'TXT_KEY_CITYSTATE_RISHIKESH_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GRAY', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SADDARVAZEH', 	'TXT_KEY_CITYSTATE_SADDARVAZEH', 	'TXT_KEY_CIV5_SADDARVAZEH_TEXT', 	'TXT_KEY_CITYSTATE_SADDARVAZEH',	'TXT_KEY_CITYSTATE_SADDARVAZEH_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SANAA', 			'TXT_KEY_CITYSTATE_SANAA', 			'TXT_KEY_CIV5_SANAA_TEXT', 			'TXT_KEY_CITYSTATE_SANAA', 			'TXT_KEY_CITYSTATE_SANAA_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_YELLOW', 	'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO', 	'TXT_KEY_CIV5_SANTO_DOMINGO_TEXT', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_BLUE', 	'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SARNATH', 		'TXT_KEY_CITYSTATE_SARNATH', 		'TXT_KEY_CIV5_SARNATH_TEXT', 		'TXT_KEY_CITYSTATE_SARNATH', 		'TXT_KEY_CITYSTATE_SARNATH_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_YELLOW', 	'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SGANG_GWAAY', 	'TXT_KEY_CITYSTATE_SGANG_GWAAY', 	'TXT_KEY_CIV5_SGANG_GWAAY_TEXT',	'TXT_KEY_CITYSTATE_SGANG_GWAAY',	'TXT_KEY_CITYSTATE_SGANG_GWAAY_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MARITIME',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'TXT_KEY_CITYSTATE_SIERRA_LEONE', 	'TXT_KEY_CIV5_SIERRA_LEONE_TEXT',	'TXT_KEY_CITYSTATE_SIERRA_LEONE',	'TXT_KEY_CITYSTATE_SIERRA_LEONE_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_BLUE', 	'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_CULTURED',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SUCEAVA', 		'TXT_KEY_CITYSTATE_SUCEAVA', 		'TXT_KEY_CIV5_SUCEAVA_TEXT', 		'TXT_KEY_CITYSTATE_SUCEAVA', 		'TXT_KEY_CITYSTATE_SUCEAVA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_PURPLE', 	'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'TXT_KEY_CITYSTATE_SURREY', 		'TXT_KEY_CIV5_SURREY_TEXT', 		'TXT_KEY_CITYSTATE_SURREY', 		'TXT_KEY_CITYSTATE_SURREY_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GRAY', 			'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'TXT_KEY_CITYSTATE_TAIWAN', 		'TXT_KEY_CIV5_TAIWAN_TEXT', 		'TXT_KEY_CITYSTATE_TAIWAN', 		'TXT_KEY_CITYSTATE_TAIWAN_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MARITIME',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_TBILISI', 		'TXT_KEY_CITYSTATE_TBILISI', 		'TXT_KEY_CIV5_TBILISI_TEXT', 		'TXT_KEY_CITYSTATE_TBILISI', 		'TXT_KEY_CITYSTATE_TBILISI_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GRAY', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_THIMPHU', 		'TXT_KEY_CITYSTATE_THIMPHU', 		'TXT_KEY_CIV5_THIMPHU_TEXT', 		'TXT_KEY_CITYSTATE_THIMPHU', 		'TXT_KEY_CITYSTATE_THIMPHU_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_BLUE', 	'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_CULTURED',			NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_TIWANAKU', 		'TXT_KEY_CITYSTATE_TIWANAKU', 		'TXT_KEY_CIV5_TIWANAKU_TEXT', 		'TXT_KEY_CITYSTATE_TIWANAKU', 		'TXT_KEY_CITYSTATE_TIWANAKU_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_YELLOW', 	'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_TUNIS', 			'TXT_KEY_CITYSTATE_TUNIS', 			'TXT_KEY_CIV5_TUNIS_TEXT', 			'TXT_KEY_CITYSTATE_TUNIS', 			'TXT_KEY_CITYSTATE_TUNIS_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GRAY', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_WOOTEI_NIICIE', 	'TXT_KEY_CITYSTATE_WOOTEI_NIICIE', 	'TXT_KEY_CIV5_WOOTEI_NIICIE_TEXT',	'TXT_KEY_CITYSTATE_WOOTEI_NIICIE',	'TXT_KEY_CITYSTATE_WOOTEI_NIICIE_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MILITARISTIC',		NULL,				'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_YANGCHENG', 		'TXT_KEY_CITYSTATE_YANGCHENG', 		'TXT_KEY_CIV5_YANGCHENG_TEXT', 		'TXT_KEY_CITYSTATE_YANGCHENG', 		'TXT_KEY_CITYSTATE_YANGCHENG_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GRAY', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		NULL,				'UNITCLASS_WORKER';

INSERT INTO MinorCivilization_CityNames 
			(MinorCivType, 				CityName)
SELECT 		'MINOR_CIV_ADEJE', 			'TXT_KEY_CITYSTATE_ADEJE' UNION ALL
SELECT 		'MINOR_CIV_AL_TIRABIN', 	'TXT_KEY_CITYSTATE_AL_TIRABIN' UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'TXT_KEY_CITYSTATE_AMBRACIA' UNION ALL
SELECT 		'MINOR_CIV_ANANGULA', 		'TXT_KEY_CITYSTATE_ANANGULA' UNION ALL
SELECT 		'MINOR_CIV_ANDORRA', 		'TXT_KEY_CITYSTATE_ANDORRA' UNION ALL
SELECT 		'MINOR_CIV_ARMAGH', 		'TXT_KEY_CITYSTATE_ARMAGH' UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'TXT_KEY_CITYSTATE_AUCKLAND' UNION ALL
SELECT 		'MINOR_CIV_AYUTTHAYA', 		'TXT_KEY_CITYSTATE_AYUTTHAYA' UNION ALL
SELECT 		'MINOR_CIV_BAGAN', 			'TXT_KEY_CITYSTATE_BAGAN' UNION ALL
SELECT 		'MINOR_CIV_BALKH', 			'TXT_KEY_CITYSTATE_BALKH' UNION ALL
SELECT 		'MINOR_CIV_BEDULU', 		'TXT_KEY_CITYSTATE_BEDULU' UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'TXT_KEY_CITYSTATE_CANOSSA' UNION ALL
SELECT 		'MINOR_CIV_CHEVAK', 		'TXT_KEY_CITYSTATE_CHEVAK' UNION ALL
SELECT 		'MINOR_CIV_CLERMONT', 		'TXT_KEY_CITYSTATE_CLERMONT' UNION ALL
SELECT 		'MINOR_CIV_DAKKAR', 		'TXT_KEY_CITYSTATE_DAKKAR' UNION ALL
SELECT 		'MINOR_CIV_DALI', 			'TXT_KEY_CITYSTATE_DALI' UNION ALL
SELECT 		'MINOR_CIV_DANO', 			'TXT_KEY_CITYSTATE_DANO' UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'TXT_KEY_CITYSTATE_DJIBOUTI' UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'TXT_KEY_CITYSTATE_DODOMA' UNION ALL
SELECT 		'MINOR_CIV_DOUALA', 		'TXT_KEY_CITYSTATE_DOUALA' UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'TXT_KEY_CITYSTATE_FAYA' UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'TXT_KEY_CITYSTATE_GRANADA' UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'TXT_KEY_CITYSTATE_GWYNEDD' UNION ALL
SELECT 		'MINOR_CIV_HANUABADA', 		'TXT_KEY_CITYSTATE_HANUABADA' UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'TXT_KEY_CITYSTATE_HONDURAS' UNION ALL
SELECT 		'MINOR_CIV_HONIARA', 		'TXT_KEY_CITYSTATE_HONIARA' UNION ALL
SELECT 		'MINOR_CIV_IRUNEA', 		'TXT_KEY_CITYSTATE_IRUNEA' UNION ALL
SELECT 		'MINOR_CIV_ISKANWAYA', 		'TXT_KEY_CITYSTATE_ISKANWAYA' UNION ALL
SELECT 		'MINOR_CIV_JETARKTE', 		'TXT_KEY_CITYSTATE_JETARKTE' UNION ALL
SELECT 		'MINOR_CIV_JUYUBIT', 		'TXT_KEY_CITYSTATE_JUYUBIT' UNION ALL
SELECT 		'MINOR_CIV_KARASJOHKA', 	'TXT_KEY_CITYSTATE_KARASJOHKA' UNION ALL
SELECT 		'MINOR_CIV_KARYES', 		'TXT_KEY_CITYSTATE_KARYES' UNION ALL
SELECT 		'MINOR_CIV_KATENDE', 		'TXT_KEY_CITYSTATE_KATENDE' UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'TXT_KEY_CITYSTATE_KIGALI' UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'TXT_KEY_CITYSTATE_LACONIA' UNION ALL
SELECT 		'MINOR_CIV_LAHORE', 		'TXT_KEY_CITYSTATE_LAHORE' UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'TXT_KEY_CITYSTATE_LEVUKA' UNION ALL
SELECT 		'MINOR_CIV_LONGYAN', 		'TXT_KEY_CITYSTATE_LONGYAN' UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'TXT_KEY_CITYSTATE_MANAGUA' UNION ALL
SELECT 		'MINOR_CIV_MBABANE', 		'TXT_KEY_CITYSTATE_MBABANE' UNION ALL
SELECT 		'MINOR_CIV_MENDYARRUP', 	'TXT_KEY_CITYSTATE_MENDYARRUP' UNION ALL
SELECT 		'MINOR_CIV_MUISCA', 		'TXT_KEY_CITYSTATE_MUISCA' UNION ALL
SELECT 		'MINOR_CIV_MULTAN', 		'TXT_KEY_CITYSTATE_MULTAN' UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'TXT_KEY_CITYSTATE_MUSCAT' UNION ALL
SELECT 		'MINOR_CIV_MUTITJULU', 		'TXT_KEY_CITYSTATE_MUTITJULU' UNION ALL
SELECT 		'MINOR_CIV_NAN_MADOL', 		'TXT_KEY_CITYSTATE_NAN_MADOL' UNION ALL
SELECT 		'MINOR_CIV_NYARYANA_MARQ', 	'TXT_KEY_CITYSTATE_NYARYANA_MARQ' UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'TXT_KEY_CITYSTATE_OC_EO' UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'TXT_KEY_CITYSTATE_ODENSO' UNION ALL
SELECT 		'MINOR_CIV_OUIDAH', 		'TXT_KEY_CITYSTATE_OUIDAH' UNION ALL
SELECT 		'MINOR_CIV_PALMYRA', 		'TXT_KEY_CITYSTATE_PALMYRA' UNION ALL
SELECT 		'MINOR_CIV_PELYM', 			'TXT_KEY_CITYSTATE_PELYM' UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'TXT_KEY_CITYSTATE_PHANOTEUS' UNION ALL
SELECT 		'MINOR_CIV_POKROVKA', 		'TXT_KEY_CITYSTATE_POKROVKA' UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'TXT_KEY_CITYSTATE_QUELIMANE' UNION ALL
SELECT 		'MINOR_CIV_RISHIKESH', 		'TXT_KEY_CITYSTATE_RISHIKESH' UNION ALL
SELECT 		'MINOR_CIV_SADDARVAZEH', 	'TXT_KEY_CITYSTATE_SADDARVAZEH' UNION ALL
SELECT 		'MINOR_CIV_SANAA', 			'TXT_KEY_CITYSTATE_SANAA' UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO' UNION ALL
SELECT 		'MINOR_CIV_SARNATH', 		'TXT_KEY_CITYSTATE_SARNATH' UNION ALL
SELECT 		'MINOR_CIV_SGANG_GWAAY', 	'TXT_KEY_CITYSTATE_SGANG_GWAAY' UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'TXT_KEY_CITYSTATE_SIERRA_LEONE' UNION ALL
SELECT 		'MINOR_CIV_SUCEAVA', 		'TXT_KEY_CITYSTATE_SUCEAVA' UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'TXT_KEY_CITYSTATE_SURREY' UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'TXT_KEY_CITYSTATE_TAIWAN' UNION ALL
SELECT 		'MINOR_CIV_TBILISI', 		'TXT_KEY_CITYSTATE_TBILISI' UNION ALL
SELECT 		'MINOR_CIV_THIMPHU', 		'TXT_KEY_CITYSTATE_THIMPHU' UNION ALL
SELECT 		'MINOR_CIV_TIWANAKU', 		'TXT_KEY_CITYSTATE_TIWANAKU' UNION ALL
SELECT 		'MINOR_CIV_TUNIS', 			'TXT_KEY_CITYSTATE_TUNIS' UNION ALL
SELECT 		'MINOR_CIV_WOOTEI_NIICIE', 	'TXT_KEY_CITYSTATE_WOOTEI_NIICIE' UNION ALL
SELECT 		'MINOR_CIV_YANGCHENG', 		'TXT_KEY_CITYSTATE_YANGCHENG';

DELETE FROM MinorCivilization_Flavors;

INSERT INTO MinorCivilization_Flavors
			(MinorCivType, 				FlavorType, 				Flavor)
-- Base
SELECT		'MINOR_CIV_ALMATY', 		'FLAVOR_EXPANSION', 		9 UNION ALL
SELECT		'MINOR_CIV_ALMATY', 		'FLAVOR_OFFENSE', 			4 UNION ALL
SELECT		'MINOR_CIV_ALMATY', 		'FLAVOR_RELIGION', 			2 UNION ALL
SELECT 		'MINOR_CIV_ANTANANARIVO', 	'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_ANTANANARIVO', 	'FLAVOR_NAVAL', 			5 UNION ALL
SELECT 		'MINOR_CIV_ANTANANARIVO', 	'FLAVOR_OFFENSE', 			3 UNION ALL
SELECT 		'MINOR_CIV_ANTWERP', 		'FLAVOR_GOLD', 				8 UNION ALL
SELECT 		'MINOR_CIV_ANTWERP', 		'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_BELGRADE', 		'FLAVOR_CITY_DEFENSE', 		7 UNION ALL
SELECT 		'MINOR_CIV_BELGRADE', 		'FLAVOR_OFFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_BELGRADE', 		'FLAVOR_DEFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_BOGOTA', 		'FLAVOR_CULTURE', 			7 UNION ALL
SELECT 		'MINOR_CIV_BOGOTA', 		'FLAVOR_WONDER', 			6 UNION ALL
SELECT 		'MINOR_CIV_BOGOTA', 		'FLAVOR_GROWTH', 			2 UNION ALL
SELECT 		'MINOR_CIV_BRATISLAVA', 	'FLAVOR_CULTURE', 			9 UNION ALL
SELECT 		'MINOR_CIV_BRATISLAVA', 	'FLAVOR_EXPANSION', 		4 UNION ALL
SELECT 		'MINOR_CIV_BRATISLAVA', 	'FLAVOR_RELIGION', 			2 UNION ALL
SELECT 		'MINOR_CIV_BRUSSELS', 		'FLAVOR_WONDER', 			7 UNION ALL
SELECT 		'MINOR_CIV_BRUSSELS', 		'FLAVOR_GROWTH', 			5 UNION ALL
SELECT 		'MINOR_CIV_BRUSSELS', 		'FLAVOR_OFFENSE', 			3 UNION ALL
SELECT 		'MINOR_CIV_BUCHAREST', 		'FLAVOR_CULTURE', 			9 UNION ALL
SELECT 		'MINOR_CIV_BUCHAREST', 		'FLAVOR_DEFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_BUDAPEST', 		'FLAVOR_EXPANSION', 		7 UNION ALL
SELECT 		'MINOR_CIV_BUDAPEST', 		'FLAVOR_RELIGION', 			5 UNION ALL
SELECT 		'MINOR_CIV_BUDAPEST', 		'FLAVOR_WONDER', 			3 UNION ALL
SELECT 		'MINOR_CIV_BUENOS_AIRES', 	'FLAVOR_CULTURE', 			8 UNION ALL
SELECT 		'MINOR_CIV_BUENOS_AIRES', 	'FLAVOR_GROWTH', 			4 UNION ALL
SELECT 		'MINOR_CIV_BUENOS_AIRES', 	'FLAVOR_WONDER', 			3 UNION ALL
SELECT 		'MINOR_CIV_BYBLOS', 		'FLAVOR_GROWTH', 			10 UNION ALL
SELECT 		'MINOR_CIV_BYBLOS', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_BYBLOS', 		'FLAVOR_WONDER', 			2 UNION ALL
SELECT 		'MINOR_CIV_CAHOKIA', 		'FLAVOR_WONDER', 			9 UNION ALL
SELECT 		'MINOR_CIV_CAHOKIA', 		'FLAVOR_GOLD', 				6 UNION ALL
SELECT 		'MINOR_CIV_CAPE_TOWN', 		'FLAVOR_GOLD', 				9 UNION ALL
SELECT 		'MINOR_CIV_CAPE_TOWN', 		'FLAVOR_GROWTH', 			4 UNION ALL
SELECT 		'MINOR_CIV_CAPE_TOWN', 		'FLAVOR_DEFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_COLOMBO', 		'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_COLOMBO', 		'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_FLORENCE', 		'FLAVOR_WONDER', 			10 UNION ALL
SELECT 		'MINOR_CIV_FLORENCE', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_GENEVA', 		'FLAVOR_RELIGION', 			8 UNION ALL
SELECT 		'MINOR_CIV_GENEVA', 		'FLAVOR_EXPANSION', 		3 UNION ALL
SELECT 		'MINOR_CIV_GENEVA', 		'FLAVOR_WONDER', 			2 UNION ALL
SELECT 		'MINOR_CIV_GENEVA', 		'FLAVOR_OFFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_GENOA', 			'FLAVOR_NAVAL', 			7 UNION ALL
SELECT 		'MINOR_CIV_GENOA', 			'FLAVOR_GOLD', 				6 UNION ALL
SELECT 		'MINOR_CIV_GENOA', 			'FLAVOR_MILITARY_TRAINING', 2 UNION ALL
SELECT 		'MINOR_CIV_HANOI', 			'FLAVOR_GROWTH', 			5 UNION ALL
SELECT 		'MINOR_CIV_HANOI', 			'FLAVOR_GOLD', 				4 UNION ALL
SELECT 		'MINOR_CIV_HANOI', 			'FLAVOR_CITY_DEFENSE', 		4 UNION ALL
SELECT 		'MINOR_CIV_HANOI', 			'FLAVOR_RELIGION', 			2 UNION ALL
SELECT 		'MINOR_CIV_HONG_KONG', 		'FLAVOR_GROWTH', 			7 UNION ALL
SELECT 		'MINOR_CIV_HONG_KONG', 		'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_HONG_KONG', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_IFE', 			'FLAVOR_CULTURE', 			6 UNION ALL
SELECT 		'MINOR_CIV_IFE', 			'FLAVOR_RELIGION', 			4 UNION ALL
SELECT 		'MINOR_CIV_IFE', 			'FLAVOR_GOLD', 				3 UNION ALL
SELECT 		'MINOR_CIV_IFE', 			'FLAVOR_GROWTH', 			2 UNION ALL
SELECT 		'MINOR_CIV_JERUSALEM', 		'FLAVOR_RELIGION', 			10 UNION ALL
SELECT 		'MINOR_CIV_JERUSALEM', 		'FLAVOR_EXPANSION', 		3 UNION ALL
SELECT 		'MINOR_CIV_JERUSALEM', 		'FLAVOR_GOLD', 				2 UNION ALL
SELECT 		'MINOR_CIV_KABUL', 			'FLAVOR_CULTURE', 			8 UNION ALL
SELECT 		'MINOR_CIV_KABUL', 			'FLAVOR_OFFENSE', 			4 UNION ALL
SELECT 		'MINOR_CIV_KABUL', 			'FLAVOR_WONDER', 			3 UNION ALL
SELECT 		'MINOR_CIV_KATHMANDU', 		'FLAVOR_RELIGION', 			6 UNION ALL
SELECT 		'MINOR_CIV_KATHMANDU', 		'FLAVOR_WONDER', 			5 UNION ALL
SELECT 		'MINOR_CIV_KATHMANDU', 		'FLAVOR_GROWTH', 			4 UNION ALL
SELECT 		'MINOR_CIV_KIEV', 			'FLAVOR_OFFENSE', 			8 UNION ALL
SELECT 		'MINOR_CIV_KIEV', 			'FLAVOR_CULTURE', 			4 UNION ALL
SELECT 		'MINOR_CIV_KIEV', 			'FLAVOR_RELIGION', 			3 UNION ALL
SELECT 		'MINOR_CIV_KUALA_LUMPUR', 	'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_KUALA_LUMPUR', 	'FLAVOR_GROWTH', 			6 UNION ALL
SELECT 		'MINOR_CIV_KUALA_LUMPUR', 	'FLAVOR_CITY_DEFENSE', 		2 UNION ALL
SELECT 		'MINOR_CIV_KYZYL', 			'FLAVOR_CULTURE', 			9 UNION ALL
SELECT 		'MINOR_CIV_KYZYL', 			'FLAVOR_DEFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_KYZYL', 			'FLAVOR_RELIGION', 			2 UNION ALL
SELECT 		'MINOR_CIV_KYZYL', 			'FLAVOR_OFFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_LA_VENTA', 		'FLAVOR_RELIGION', 			6 UNION ALL
SELECT 		'MINOR_CIV_LA_VENTA', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_LA_VENTA', 		'FLAVOR_WONDER', 			4 UNION ALL
SELECT 		'MINOR_CIV_LHASA', 			'FLAVOR_RELIGION', 			9 UNION ALL
SELECT 		'MINOR_CIV_LHASA', 			'FLAVOR_CITY_DEFENSE', 		3 UNION ALL
SELECT 		'MINOR_CIV_LHASA', 			'FLAVOR_DEFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_LHASA', 			'FLAVOR_WONDER', 			1 UNION ALL
SELECT 		'MINOR_CIV_MALACCA', 		'FLAVOR_GOLD', 				8 UNION ALL
SELECT 		'MINOR_CIV_MALACCA', 		'FLAVOR_EXPANSION', 		4 UNION ALL
SELECT 		'MINOR_CIV_MALACCA', 		'FLAVOR_RELIGION', 			3 UNION ALL
SELECT 		'MINOR_CIV_MANILA', 		'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_MANILA', 		'FLAVOR_CULTURE', 			6 UNION ALL
SELECT 		'MINOR_CIV_MANILA', 		'FLAVOR_WONDER', 			1 UNION ALL
SELECT 		'MINOR_CIV_MBANZA_KONGO', 	'FLAVOR_DEFENSE', 			8 UNION ALL
SELECT 		'MINOR_CIV_MBANZA_KONGO', 	'FLAVOR_OFFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MBANZA_KONGO', 	'FLAVOR_RELIGION', 			2 UNION ALL
SELECT 		'MINOR_CIV_MELBOURNE', 		'FLAVOR_EXPANSION', 		6 UNION ALL
SELECT 		'MINOR_CIV_MELBOURNE', 		'FLAVOR_OFFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MELBOURNE', 		'FLAVOR_GOLD', 				4 UNION ALL
SELECT 		'MINOR_CIV_MILAN', 			'FLAVOR_CULTURE', 			10 UNION ALL
SELECT 		'MINOR_CIV_MILAN', 			'FLAVOR_GROWTH', 			3 UNION ALL
SELECT 		'MINOR_CIV_MILAN', 			'FLAVOR_WONDER', 			2 UNION ALL
SELECT 		'MINOR_CIV_MOGADISHU', 		'FLAVOR_GROWTH', 			5 UNION ALL
SELECT 		'MINOR_CIV_MOGADISHU', 		'FLAVOR_DEFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MOGADISHU', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MOMBASA', 		'FLAVOR_GROWTH', 			6 UNION ALL
SELECT 		'MINOR_CIV_MOMBASA', 		'FLAVOR_GOLD', 				6 UNION ALL
SELECT 		'MINOR_CIV_MOMBASA', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_MONACO', 		'FLAVOR_EXPANSION', 		8 UNION ALL
SELECT 		'MINOR_CIV_MONACO', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MONACO', 		'FLAVOR_GOLD', 				2 UNION ALL
SELECT 		'MINOR_CIV_ORMUS', 			'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_ORMUS', 			'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_PANAMA_CITY', 	'FLAVOR_GOLD', 				6 UNION ALL
SELECT 		'MINOR_CIV_PANAMA_CITY', 	'FLAVOR_NAVAL', 			5 UNION ALL
SELECT 		'MINOR_CIV_PANAMA_CITY', 	'FLAVOR_GROWTH', 			4 UNION ALL
SELECT 		'MINOR_CIV_PRAGUE', 		'FLAVOR_RELIGION', 			7 UNION ALL
SELECT 		'MINOR_CIV_PRAGUE', 		'FLAVOR_EXPANSION', 		5 UNION ALL
SELECT 		'MINOR_CIV_PRAGUE', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_QUEBEC_CITY', 	'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_QUEBEC_CITY', 	'FLAVOR_GROWTH', 			7 UNION ALL
SELECT 		'MINOR_CIV_QUEBEC_CITY', 	'FLAVOR_EXPANSION', 		1 UNION ALL
SELECT 		'MINOR_CIV_RAGUSA', 		'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_RAGUSA', 		'FLAVOR_NAVAL', 			5 UNION ALL
SELECT 		'MINOR_CIV_RAGUSA', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_RAGUSA', 		'FLAVOR_EXPANSION', 		2 UNION ALL
SELECT 		'MINOR_CIV_RIGA', 			'FLAVOR_GROWTH', 			9 UNION ALL
SELECT 		'MINOR_CIV_RIGA', 			'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_RIGA', 			'FLAVOR_CULTURE', 			1 UNION ALL
SELECT 		'MINOR_CIV_SAMARKAND', 		'FLAVOR_GOLD', 				10 UNION ALL
SELECT 		'MINOR_CIV_SAMARKAND', 		'FLAVOR_EXPANSION', 		5 UNION ALL
SELECT 		'MINOR_CIV_SIDON', 			'FLAVOR_OFFENSE', 			9 UNION ALL
SELECT 		'MINOR_CIV_SIDON', 			'FLAVOR_EXPANSION', 		3 UNION ALL
SELECT 		'MINOR_CIV_SIDON', 			'FLAVOR_MILITARY_TRAINING', 3 UNION ALL
SELECT 		'MINOR_CIV_SINGAPORE', 		'FLAVOR_GOLD', 				9 UNION ALL
SELECT 		'MINOR_CIV_SINGAPORE', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_SINGAPORE', 		'FLAVOR_NAVAL', 			3 UNION ALL
SELECT 		'MINOR_CIV_SOFIA', 			'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_SOFIA', 			'FLAVOR_OFFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_SOFIA', 			'FLAVOR_EXPANSION', 		3 UNION ALL
SELECT 		'MINOR_CIV_SYDNEY', 		'FLAVOR_CULTURE', 			8 UNION ALL
SELECT 		'MINOR_CIV_SYDNEY', 		'FLAVOR_GROWTH', 			4 UNION ALL
SELECT 		'MINOR_CIV_SYDNEY', 		'FLAVOR_WONDER', 			3 UNION ALL
SELECT 		'MINOR_CIV_TYRE', 			'FLAVOR_CITY_DEFENSE', 		10 UNION ALL
SELECT 		'MINOR_CIV_TYRE', 			'FLAVOR_GROWTH', 			3 UNION ALL
SELECT 		'MINOR_CIV_TYRE', 			'FLAVOR_WONDER', 			2 UNION ALL
SELECT 		'MINOR_CIV_UR', 			'FLAVOR_GROWTH', 			9 UNION ALL
SELECT 		'MINOR_CIV_UR', 			'FLAVOR_DEFENSE', 			4 UNION ALL
SELECT 		'MINOR_CIV_UR', 			'FLAVOR_CULTURE', 			2 UNION ALL
SELECT 		'MINOR_CIV_VALLETTA', 		'FLAVOR_NAVAL', 			10 UNION ALL
SELECT 		'MINOR_CIV_VALLETTA', 		'FLAVOR_DEFENSE', 			3 UNION ALL
SELECT 		'MINOR_CIV_VALLETTA', 		'FLAVOR_GROWTH', 			2 UNION ALL
SELECT 		'MINOR_CIV_VANCOUVER', 		'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_VANCOUVER', 		'FLAVOR_EXPANSION', 		5 UNION ALL
SELECT 		'MINOR_CIV_VANCOUVER', 		'FLAVOR_GROWTH', 			5 UNION ALL
SELECT 		'MINOR_CIV_VATICAN_CITY', 	'FLAVOR_RELIGION', 			8 UNION ALL
SELECT 		'MINOR_CIV_VATICAN_CITY', 	'FLAVOR_EXPANSION', 		5 UNION ALL
SELECT 		'MINOR_CIV_VATICAN_CITY', 	'FLAVOR_GOLD', 				2 UNION ALL
SELECT 		'MINOR_CIV_VILNIUS', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_VILNIUS', 		'FLAVOR_GROWTH', 			5 UNION ALL
SELECT 		'MINOR_CIV_VILNIUS', 		'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_WELLINGTON', 	'FLAVOR_GROWTH', 			9 UNION ALL
SELECT 		'MINOR_CIV_WELLINGTON', 	'FLAVOR_GOLD', 				4 UNION ALL
SELECT 		'MINOR_CIV_WELLINGTON', 	'FLAVOR_DEFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_WITTENBERG', 	'FLAVOR_RELIGION', 			7 UNION ALL
SELECT 		'MINOR_CIV_WITTENBERG', 	'FLAVOR_DEFENSE', 			4 UNION ALL
SELECT 		'MINOR_CIV_WITTENBERG', 	'FLAVOR_CULTURE', 			4 UNION ALL
SELECT 		'MINOR_CIV_YEREVAN', 		'FLAVOR_CULTURE', 			6 UNION ALL
SELECT 		'MINOR_CIV_YEREVAN', 		'FLAVOR_EXPANSION', 		5 UNION ALL
SELECT 		'MINOR_CIV_YEREVAN', 		'FLAVOR_MILITARY_TRAINING', 4 UNION ALL
SELECT 		'MINOR_CIV_ZANZIBAR', 		'FLAVOR_GOLD', 				8 UNION ALL
SELECT 		'MINOR_CIV_ZANZIBAR', 		'FLAVOR_GROWTH', 			4 UNION ALL
SELECT 		'MINOR_CIV_ZANZIBAR', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_ZURICH', 		'FLAVOR_GOLD', 				10  UNION ALL
SELECT 		'MINOR_CIV_ZURICH', 		'FLAVOR_CITY_DEFENSE', 		2  UNION ALL
SELECT 		'MINOR_CIV_ZURICH', 		'FLAVOR_DEFENSE', 			2  UNION ALL
SELECT 		'MINOR_CIV_ZURICH', 		'FLAVOR_MILITARY_TRAINING', 1;

INSERT INTO MinorCivilization_Flavors
			(MinorCivType, 				FlavorType, 				Flavor)
-- UCS
SELECT 		'MINOR_CIV_CLERMONT', 		'FLAVOR_OFFENSE', 			9 UNION ALL
SELECT 		'MINOR_CIV_CLERMONT', 		'FLAVOR_RELIGION', 			6 UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'FLAVOR_GROWTH', 			5 UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'FLAVOR_NAVAL', 			3 UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'FLAVOR_GROWTH', 			7 UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'FLAVOR_NAVAL', 			6 UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'FLAVOR_DEFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_ARMAGH', 		'FLAVOR_RELIGION', 			10 UNION ALL
SELECT 		'MINOR_CIV_ARMAGH', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'FLAVOR_NAVAL', 			5 UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'FLAVOR_DEFENSE', 			8 UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'FLAVOR_CITY_DEFENSE', 		4 UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'FLAVOR_MILITARY_TRAINING', 2 UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'FLAVOR_OFFENSE', 			1 UNION ALL
SELECT 		'MINOR_CIV_NAN_MADOL', 		'FLAVOR_NAVAL', 			9 UNION ALL
SELECT 		'MINOR_CIV_NAN_MADOL', 		'FLAVOR_CULTURE', 			4 UNION ALL
SELECT 		'MINOR_CIV_NAN_MADOL', 		'FLAVOR_RELIGION', 			2 UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'FLAVOR_OFFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'FLAVOR_DEFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MUISCA', 		'FLAVOR_GOLD', 				9 UNION ALL
SELECT 		'MINOR_CIV_MUISCA', 		'FLAVOR_RELIGION', 			6 UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'FLAVOR_MILITARY_TRAINING', 9 UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'FLAVOR_DEFENSE', 			4 UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'FLAVOR_CITY_DEFENSE', 		2 UNION ALL
SELECT 		'MINOR_CIV_CHEVAK', 		'FLAVOR_NAVAL', 			8 UNION ALL
SELECT 		'MINOR_CIV_CHEVAK', 		'FLAVOR_GROWTH', 			7 UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'FLAVOR_EXPANSION', 		5 UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'FLAVOR_GROWTH', 			3 UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'FLAVOR_GOLD', 				6 UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'FLAVOR_NAVAL', 			6 UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'FLAVOR_GROWTH', 			3 UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'FLAVOR_DEFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'FLAVOR_MILITARY_TRAINING', 5 UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'FLAVOR_CITY_DEFENSE', 		5 UNION ALL
SELECT 		'MINOR_CIV_YANGCHENG', 		'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_YANGCHENG', 		'FLAVOR_RELIGION', 			7 UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'FLAVOR_NAVAL', 			7 UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'FLAVOR_OFFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'FLAVOR_MILITARY_TRAINING', 3 UNION ALL
SELECT 		'MINOR_CIV_DOUALA', 		'FLAVOR_GOLD', 				9 UNION ALL
SELECT 		'MINOR_CIV_DOUALA', 		'FLAVOR_NAVAL', 			6 UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'FLAVOR_OFFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'FLAVOR_MILITARY_TRAINING', 3 UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'FLAVOR_NAVAL', 			3 UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'FLAVOR_GOLD', 				8 UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'FLAVOR_MILITARY_TRAINING', 4 UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'FLAVOR_RELIGION', 			3 UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'FLAVOR_GOLD', 				9 UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'FLAVOR_EXPANSION', 		3 UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'FLAVOR_MILITARY_TRAINING', 2 UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'FLAVOR_DEFENSE', 			1 UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'FLAVOR_DEFENSE', 			8 UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'FLAVOR_CITY_DEFENSE', 		4 UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'FLAVOR_MILITARY_TRAINING', 3 UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'FLAVOR_GOLD', 				9 UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'FLAVOR_DEFENSE', 			4 UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'FLAVOR_CULTURE', 			2 UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'FLAVOR_OFFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'FLAVOR_NAVAL', 			6 UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'FLAVOR_GROWTH', 			3 UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'FLAVOR_NAVAL', 			2 UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'FLAVOR_MILITARY_TRAINING', 3 UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'FLAVOR_OFFENSE', 			3 UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'FLAVOR_MILITARY_TRAINING', 3 UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'FLAVOR_EXPANSION', 		2 UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'FLAVOR_CITY_DEFENSE', 		3 UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'FLAVOR_GOLD', 				3 UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'FLAVOR_WONDER', 			2 UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'FLAVOR_EXPANSION', 		6 UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'FLAVOR_NAVAL', 			4 UNION ALL
SELECT 		'MINOR_CIV_THIMPHU', 		'FLAVOR_CULTURE', 			9 UNION ALL
SELECT 		'MINOR_CIV_THIMPHU', 		'FLAVOR_WONDER', 			6 UNION ALL
SELECT 		'MINOR_CIV_ANDORRA', 		'FLAVOR_CITY_DEFENSE', 		8 UNION ALL
SELECT 		'MINOR_CIV_ANDORRA', 		'FLAVOR_CULTURE', 			7 UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'FLAVOR_RELIGION', 			8 UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'FLAVOR_CITY_DEFENSE', 		5 UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'FLAVOR_MILITARY_TRAINING', 2 UNION ALL
SELECT 		'MINOR_CIV_BEDULU', 		'FLAVOR_RELIGION', 			10 UNION ALL
SELECT 		'MINOR_CIV_BEDULU', 		'FLAVOR_NAVAL', 			2 UNION ALL
SELECT 		'MINOR_CIV_BEDULU', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_DALI', 			'FLAVOR_RELIGION', 			4 UNION ALL
SELECT 		'MINOR_CIV_DALI', 			'FLAVOR_GOLD', 				6 UNION ALL
SELECT 		'MINOR_CIV_DALI', 			'FLAVOR_CULTURE', 			4 UNION ALL
SELECT 		'MINOR_CIV_DALI', 			'FLAVOR_MILITARY_TRAINING', 1 UNION ALL
SELECT 		'MINOR_CIV_MULTAN', 		'FLAVOR_RELIGION', 			3 UNION ALL
SELECT 		'MINOR_CIV_MULTAN', 		'FLAVOR_EXPANSION', 		8 UNION ALL
SELECT 		'MINOR_CIV_MULTAN', 		'FLAVOR_OFFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_MULTAN', 		'FLAVOR_MILITARY_TRAINING', 2 UNION ALL
SELECT 		'MINOR_CIV_BAGAN', 			'FLAVOR_RELIGION', 			8 UNION ALL
SELECT 		'MINOR_CIV_BAGAN', 			'FLAVOR_EXPANSION', 		7 UNION ALL
SELECT 		'MINOR_CIV_RISHIKESH', 		'FLAVOR_RELIGION', 			6 UNION ALL
SELECT 		'MINOR_CIV_RISHIKESH', 		'FLAVOR_CITY_DEFENSE', 		6 UNION ALL
SELECT 		'MINOR_CIV_RISHIKESH', 		'FLAVOR_DEFENSE', 			3 UNION ALL
SELECT 		'MINOR_CIV_MUTITJULU', 		'FLAVOR_RELIGION', 			8 UNION ALL
SELECT 		'MINOR_CIV_MUTITJULU', 		'FLAVOR_WONDER', 			7 UNION ALL
SELECT 		'MINOR_CIV_ISKANWAYA', 		'FLAVOR_RELIGION', 			7 UNION ALL
SELECT 		'MINOR_CIV_ISKANWAYA', 		'FLAVOR_CULTURE', 			7 UNION ALL
SELECT 		'MINOR_CIV_ISKANWAYA', 		'FLAVOR_MILITARY_TRAINING', 1 UNION ALL
SELECT 		'MINOR_CIV_TIWANAKU', 		'FLAVOR_RELIGION', 			7 UNION ALL
SELECT 		'MINOR_CIV_TIWANAKU', 		'FLAVOR_GOLD', 				4 UNION ALL
SELECT 		'MINOR_CIV_TIWANAKU', 		'FLAVOR_WONDER',			4 UNION ALL
SELECT 		'MINOR_CIV_DANO', 			'FLAVOR_RELIGION', 			7 UNION ALL
SELECT 		'MINOR_CIV_DANO', 			'FLAVOR_EXPANSION', 		6 UNION ALL
SELECT 		'MINOR_CIV_DANO', 			'FLAVOR_CULTURE',			2 UNION ALL
SELECT 		'MINOR_CIV_KARYES', 		'FLAVOR_RELIGION', 			6 UNION ALL
SELECT 		'MINOR_CIV_KARYES', 		'FLAVOR_CITY_DEFENSE', 		5 UNION ALL
SELECT 		'MINOR_CIV_KARYES', 		'FLAVOR_DEFENSE',			4 UNION ALL
SELECT 		'MINOR_CIV_SGANG_GWAAY', 	'FLAVOR_GROWTH', 			7 UNION ALL
SELECT 		'MINOR_CIV_SGANG_GWAAY', 	'FLAVOR_NAVAL', 			6 UNION ALL
SELECT 		'MINOR_CIV_SGANG_GWAAY', 	'FLAVOR_CULTURE',			2 UNION ALL
SELECT 		'MINOR_CIV_ADEJE', 			'FLAVOR_GROWTH', 			6 UNION ALL
SELECT 		'MINOR_CIV_ADEJE', 			'FLAVOR_CULTURE', 			6 UNION ALL
SELECT 		'MINOR_CIV_ADEJE', 			'FLAVOR_RELIGION',			3 UNION ALL
SELECT 		'MINOR_CIV_NYARYANA_MARQ', 	'FLAVOR_GROWTH', 			6 UNION ALL
SELECT 		'MINOR_CIV_NYARYANA_MARQ', 	'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_NYARYANA_MARQ', 	'FLAVOR_GOLD',				4 UNION ALL
SELECT 		'MINOR_CIV_WOOTEI_NIICIE', 	'FLAVOR_MILITARY_TRAINING', 9 UNION ALL
SELECT 		'MINOR_CIV_WOOTEI_NIICIE', 	'FLAVOR_OFFENSE', 			4 UNION ALL
SELECT 		'MINOR_CIV_WOOTEI_NIICIE', 	'FLAVOR_DEFENSE',			2 UNION ALL
SELECT 		'MINOR_CIV_DAKKAR', 		'FLAVOR_MILITARY_TRAINING',	9 UNION ALL
SELECT 		'MINOR_CIV_DAKKAR', 		'FLAVOR_EXPANSION',			6 UNION ALL
SELECT 		'MINOR_CIV_HONIARA', 		'FLAVOR_GROWTH',			8 UNION ALL
SELECT 		'MINOR_CIV_HONIARA', 		'FLAVOR_CULTURE',			5 UNION ALL
SELECT 		'MINOR_CIV_HONIARA', 		'FLAVOR_EXPANSION',			2 UNION ALL
SELECT 		'MINOR_CIV_KARASJOHKA', 	'FLAVOR_GROWTH',			8 UNION ALL
SELECT 		'MINOR_CIV_KARASJOHKA', 	'FLAVOR_CULTURE',			6 UNION ALL
SELECT 		'MINOR_CIV_KARASJOHKA', 	'FLAVOR_MILITARY_TRAINING',	1 UNION ALL
SELECT 		'MINOR_CIV_KATENDE', 		'FLAVOR_CULTURE',			8 UNION ALL
SELECT 		'MINOR_CIV_KATENDE', 		'FLAVOR_EXPANSION',			7 UNION ALL
SELECT 		'MINOR_CIV_LAHORE', 		'FLAVOR_RELIGION',			9 UNION ALL
SELECT 		'MINOR_CIV_LAHORE', 		'FLAVOR_OFFENSE',			3 UNION ALL
SELECT 		'MINOR_CIV_LAHORE', 		'FLAVOR_DEFENSE',			3 UNION ALL
SELECT 		'MINOR_CIV_LAHORE', 		'FLAVOR_MILITARY_TRAINING',	3 UNION ALL
SELECT 		'MINOR_CIV_OUIDAH', 		'FLAVOR_GOLD',				10 UNION ALL
SELECT 		'MINOR_CIV_OUIDAH', 		'FLAVOR_GROWTH',			4 UNION ALL
SELECT 		'MINOR_CIV_OUIDAH', 		'FLAVOR_CULTURE',			1 UNION ALL
SELECT 		'MINOR_CIV_PELYM', 			'FLAVOR_MILITARY_TRAINING',	8 UNION ALL
SELECT 		'MINOR_CIV_PELYM', 			'FLAVOR_OFFENSE',			7 UNION ALL
SELECT 		'MINOR_CIV_POKROVKA', 		'FLAVOR_OFFENSE',			10 UNION ALL
SELECT 		'MINOR_CIV_POKROVKA', 		'FLAVOR_MILITARY_TRAINING',	5 UNION ALL
SELECT 		'MINOR_CIV_SARNATH', 		'FLAVOR_RELIGION',			8 UNION ALL
SELECT 		'MINOR_CIV_SARNATH', 		'FLAVOR_CULTURE',			7 UNION ALL
SELECT 		'MINOR_CIV_SUCEAVA', 		'FLAVOR_RELIGION',			6 UNION ALL
SELECT 		'MINOR_CIV_SUCEAVA', 		'FLAVOR_CITY_DEFENSE',		4 UNION ALL
SELECT 		'MINOR_CIV_SUCEAVA', 		'FLAVOR_DEFENSE',			5 UNION ALL
SELECT 		'MINOR_CIV_TBILISI', 		'FLAVOR_OFFENSE',			9 UNION ALL
SELECT 		'MINOR_CIV_TBILISI', 		'FLAVOR_EXPANSION',			4 UNION ALL
SELECT 		'MINOR_CIV_TBILISI', 		'FLAVOR_GROWTH',			2 UNION ALL
SELECT 		'MINOR_CIV_SANAA', 			'FLAVOR_GOLD',				9 UNION ALL
SELECT 		'MINOR_CIV_SANAA', 			'FLAVOR_GROWTH',			4 UNION ALL
SELECT 		'MINOR_CIV_SANAA', 			'FLAVOR_WONDER',			2 UNION ALL
SELECT 		'MINOR_CIV_ANANGULA', 		'FLAVOR_CULTURE',			10 UNION ALL
SELECT 		'MINOR_CIV_ANANGULA', 		'FLAVOR_GROWTH',			3 UNION ALL
SELECT 		'MINOR_CIV_ANANGULA', 		'FLAVOR_NAVAL',				2 UNION ALL
SELECT 		'MINOR_CIV_JUYUBIT', 		'FLAVOR_GOLD',				7 UNION ALL
SELECT 		'MINOR_CIV_JUYUBIT', 		'FLAVOR_EXPANSION',			7 UNION ALL
SELECT 		'MINOR_CIV_JUYUBIT', 		'FLAVOR_GROWTH',			1 UNION ALL
SELECT 		'MINOR_CIV_LONGYAN', 		'FLAVOR_EXPANSION',			9 UNION ALL
SELECT 		'MINOR_CIV_LONGYAN', 		'FLAVOR_CITY_DEFENSE',		5 UNION ALL
SELECT 		'MINOR_CIV_LONGYAN', 		'FLAVOR_GROWTH',			1 UNION ALL
SELECT 		'MINOR_CIV_AYUTTHAYA', 		'FLAVOR_EXPANSION',			5 UNION ALL
SELECT 		'MINOR_CIV_AYUTTHAYA', 		'FLAVOR_CULTURE',			5 UNION ALL
SELECT 		'MINOR_CIV_AYUTTHAYA', 		'FLAVOR_WONDER',			5 UNION ALL
SELECT 		'MINOR_CIV_PALMYRA', 		'FLAVOR_EXPANSION',			7 UNION ALL
SELECT 		'MINOR_CIV_PALMYRA', 		'FLAVOR_RELIGION',			4 UNION ALL
SELECT 		'MINOR_CIV_PALMYRA', 		'FLAVOR_CULTURE',			2 UNION ALL
SELECT 		'MINOR_CIV_PALMYRA', 		'FLAVOR_OFFENSE',			2 UNION ALL
SELECT 		'MINOR_CIV_AL_TIRABIN', 	'FLAVOR_GROWTH',			8 UNION ALL
SELECT 		'MINOR_CIV_AL_TIRABIN', 	'FLAVOR_GOLD',				7 UNION ALL
SELECT 		'MINOR_CIV_HANUABADA', 		'FLAVOR_NAVAL', 			8 UNION ALL
SELECT 		'MINOR_CIV_HANUABADA', 		'FLAVOR_GROWTH',			4 UNION ALL
SELECT 		'MINOR_CIV_HANUABADA', 		'FLAVOR_CULTURE',			2 UNION ALL
SELECT 		'MINOR_CIV_HANUABADA', 		'FLAVOR_GOLD',				1 UNION ALL
SELECT 		'MINOR_CIV_BALKH', 			'FLAVOR_RELIGION', 			8 UNION ALL
SELECT 		'MINOR_CIV_BALKH', 			'FLAVOR_DEFENSE',			6 UNION ALL
SELECT 		'MINOR_CIV_BALKH', 			'FLAVOR_CITY_DEFENSE',		1 UNION ALL
SELECT 		'MINOR_CIV_IRUNEA', 		'FLAVOR_NAVAL', 			7 UNION ALL
SELECT 		'MINOR_CIV_IRUNEA', 		'FLAVOR_GROWTH',			5 UNION ALL
SELECT 		'MINOR_CIV_IRUNEA', 		'FLAVOR_DEFENSE',			3 UNION ALL
SELECT 		'MINOR_CIV_JETARKTE', 		'FLAVOR_GROWTH',			5 UNION ALL
SELECT 		'MINOR_CIV_JETARKTE', 		'FLAVOR_NAVAL',				5 UNION ALL
SELECT 		'MINOR_CIV_JETARKTE', 		'FLAVOR_CULTURE',			5 UNION ALL
SELECT 		'MINOR_CIV_MBABANE', 		'FLAVOR_DEFENSE',			7 UNION ALL
SELECT 		'MINOR_CIV_MBABANE', 		'FLAVOR_CITY_DEFENSE',		6 UNION ALL
SELECT 		'MINOR_CIV_MBABANE', 		'FLAVOR_GROWTH',			2 UNION ALL
SELECT 		'MINOR_CIV_SADDARVAZEH', 	'FLAVOR_RELIGION',			9 UNION ALL
SELECT 		'MINOR_CIV_SADDARVAZEH', 	'FLAVOR_GOLD',				3 UNION ALL
SELECT 		'MINOR_CIV_SADDARVAZEH', 	'FLAVOR_CULTURE',			3 UNION ALL
SELECT 		'MINOR_CIV_TUNIS', 			'FLAVOR_GOLD',				8 UNION ALL
SELECT 		'MINOR_CIV_TUNIS', 			'FLAVOR_CITY_DEFENSE',		6 UNION ALL
SELECT 		'MINOR_CIV_TUNIS', 			'FLAVOR_EXPANSION',			1 UNION ALL
SELECT 		'MINOR_CIV_MENDYARRUP', 	'FLAVOR_GOLD',				5 UNION ALL
SELECT 		'MINOR_CIV_MENDYARRUP', 	'FLAVOR_GROWTH',			5 UNION ALL
SELECT 		'MINOR_CIV_MENDYARRUP', 	'FLAVOR_OFFENSE',			5;

-- base blocks
INSERT INTO MajorBlocksMinor
			(MajorCiv, 					MinorCiv)
SELECT 		'CIVILIZATION_ARABIA',		'MINOR_CIV_MUSCAT' UNION ALL
SELECT 		'CIVILIZATION_ARABIA',		'MINOR_CIV_TUNIS' UNION ALL
SELECT 		'CIVILIZATION_CHINA',		'MINOR_CIV_TAIWAN' UNION ALL
SELECT 		'CIVILIZATION_GREECE',		'MINOR_CIV_AMBRACIA' UNION ALL
SELECT 		'CIVILIZATION_GREECE',		'MINOR_CIV_LACONIA' UNION ALL
SELECT 		'CIVILIZATION_INCA',		'MINOR_CIV_TIWANAKU' UNION ALL
SELECT 		'CIVILIZATION_INDIA',		'MINOR_CIV_LAHORE' UNION ALL
SELECT 		'CIVILIZATION_PERSIA',		'MINOR_CIV_BALKH' UNION ALL
SELECT 		'CIVILIZATION_PERSIA',		'MINOR_CIV_SADDARVAZEH' UNION ALL
SELECT 		'CIVILIZATION_ROME',		'MINOR_CIV_PALMYRA' UNION ALL
SELECT 		'CIVILIZATION_SIAM',		'MINOR_CIV_AYUTTHAYA' UNION ALL
SELECT 		'CIVILIZATION_SPAIN',		'MINOR_CIV_GRANADA' UNION ALL
SELECT 		'CIVILIZATION_SWEDEN',		'MINOR_CIV_ODENSO';

-- civ blocks
INSERT INTO MajorBlocksMinor
			(MajorCiv, 						MinorCiv)
SELECT 		'CIVILIZATION_GT_BASQUES',		'MINOR_CIV_IRUNEA' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='UCS-CIVILIZATION-BASQUE' AND Value= 1);
---------------------------------------------------
-- Definitions - Technologies
---------------------------------------------------
INSERT INTO Technologies 
			(Type,				Cost,	Description,	Civilopedia,	Help,	Era,	Quote,	Trade,	GoodyTech,	Disable,	GridX,	GridY,	PortraitIndex,	IconAtlas)
SELECT		Type||'_UCS_DUMMY',	-1,		Description,	Civilopedia,	Help,	Era,	Quote,	0,		0,			1,			0,		50,		PortraitIndex,	IconAtlas
FROM Technologies WHERE Type = 'TECH_HORSEBACK_RIDING';
---------------------------------------------------
-- Definitions - Policies
---------------------------------------------------
INSERT INTO Policies (Type, Description)
SELECT 'POLICY_ALMATY', 				'TXT_KEY_CITYSTATE_ALMATY' UNION ALL
SELECT 'POLICY_AMBRACIA', 				'TXT_KEY_CITYSTATE_AMBRACIA' UNION ALL
SELECT 'POLICY_ANANGULA', 				'TXT_KEY_CITYSTATE_ANANGULA' UNION ALL
SELECT 'POLICY_ANTANANARIVO', 			'TXT_KEY_CITYSTATE_ANTANANARIVO' UNION ALL
SELECT 'POLICY_AUCKLAND', 				'TXT_KEY_CITYSTATE_AUCKLAND' UNION ALL
SELECT 'POLICY_BAGAN', 					'TXT_KEY_CITYSTATE_BAGAN' UNION ALL
SELECT 'POLICY_BEDULU', 				'TXT_KEY_CITYSTATE_BEDULU' UNION ALL
SELECT 'POLICY_BELGRADE', 				'TXT_KEY_CITYSTATE_BELGRADE' UNION ALL
SELECT 'POLICY_BOGOTA', 				'TXT_KEY_CITYSTATE_BOGOTA' UNION ALL
SELECT 'POLICY_BRATISLAVA', 			'TXT_KEY_CITYSTATE_BRATISLAVA' UNION ALL
SELECT 'POLICY_BUCHAREST', 				'TXT_KEY_CITYSTATE_BUCHAREST' UNION ALL
SELECT 'POLICY_BUENOS_AIRES', 			'TXT_KEY_CITYSTATE_BUENOS_AIRES' UNION ALL
SELECT 'POLICY_BYBLOS', 				'TXT_KEY_CITYSTATE_BYBLOS' UNION ALL
SELECT 'POLICY_DAKKAR', 				'TXT_KEY_CITYSTATE_DAKKAR' UNION ALL
SELECT 'POLICY_DALI', 					'TXT_KEY_CITYSTATE_DALI' UNION ALL
SELECT 'POLICY_DANO', 					'TXT_KEY_CITYSTATE_DANO' UNION ALL
SELECT 'POLICY_DJIBOUTI', 				'TXT_KEY_CITYSTATE_DJIBOUTI' UNION ALL
SELECT 'POLICY_DODOMA', 				'TXT_KEY_CITYSTATE_DODOMA' UNION ALL
SELECT 'POLICY_DOUALA', 				'TXT_KEY_CITYSTATE_DOUALA' UNION ALL
SELECT 'POLICY_GENEVA', 				'TXT_KEY_CITYSTATE_GENEVA' UNION ALL
SELECT 'POLICY_GENOA', 					'TXT_KEY_CITYSTATE_GENOA' UNION ALL
SELECT 'POLICY_GRANADA', 				'TXT_KEY_CITYSTATE_GRANADA' UNION ALL
SELECT 'POLICY_GWYNEDD', 				'TXT_KEY_CITYSTATE_GWYNEDD' UNION ALL
SELECT 'POLICY_HANUABADA', 				'TXT_KEY_CITYSTATE_HANUABADA' UNION ALL
SELECT 'POLICY_HONDURAS', 				'TXT_KEY_CITYSTATE_HONDURAS' UNION ALL
SELECT 'POLICY_HONG_KONG', 				'TXT_KEY_CITYSTATE_HONG_KONG' UNION ALL
SELECT 'POLICY_HONIARA', 				'TXT_KEY_CITYSTATE_HONIARA' UNION ALL
SELECT 'POLICY_IRUNEA', 				'TXT_KEY_CITYSTATE_IRUNEA' UNION ALL
SELECT 'POLICY_KATENDE', 				'TXT_KEY_CITYSTATE_KATENDE' UNION ALL
SELECT 'POLICY_KATHMANDU', 				'TXT_KEY_CITYSTATE_KATHMANDU' UNION ALL
SELECT 'POLICY_KIGALI', 				'TXT_KEY_CITYSTATE_KIGALI' UNION ALL
SELECT 'POLICY_KUALA_LUMPUR', 			'TXT_KEY_CITYSTATE_KUALA_LUMPUR' UNION ALL
SELECT 'POLICY_LAHORE', 				'TXT_KEY_CITYSTATE_LAHORE' UNION ALL
SELECT 'POLICY_MALACCA', 				'TXT_KEY_CITYSTATE_MALACCA' UNION ALL
SELECT 'POLICY_MANILA', 				'TXT_KEY_CITYSTATE_MANILA' UNION ALL
SELECT 'POLICY_MOGADISHU', 				'TXT_KEY_CITYSTATE_MOGADISHU' UNION ALL
SELECT 'POLICY_MOMBASA', 				'TXT_KEY_CITYSTATE_MOMBASA' UNION ALL
SELECT 'POLICY_MONACO', 				'TXT_KEY_CITYSTATE_MONACO' UNION ALL
SELECT 'POLICY_MUISCA', 				'TXT_KEY_CITYSTATE_MUISCA' UNION ALL
SELECT 'POLICY_MULTAN', 				'TXT_KEY_CITYSTATE_MULTAN' UNION ALL
SELECT 'POLICY_MUSCAT', 				'TXT_KEY_CITYSTATE_MUSCAT' UNION ALL
SELECT 'POLICY_MUTITJULU', 				'TXT_KEY_CITYSTATE_MUTITJULU' UNION ALL
SELECT 'POLICY_ORMUS', 					'TXT_KEY_CITYSTATE_ORMUS' UNION ALL
SELECT 'POLICY_OUIDAH', 				'TXT_KEY_CITYSTATE_OUIDAH' UNION ALL
SELECT 'POLICY_PALMYRA', 				'TXT_KEY_CITYSTATE_PALMYRA' UNION ALL
SELECT 'POLICY_PHANOTEUS', 				'TXT_KEY_CITYSTATE_PHANOTEUS' UNION ALL
SELECT 'POLICY_POKROVKA', 				'TXT_KEY_CITYSTATE_POKROVKA' UNION ALL
SELECT 'POLICY_QUELIMANE', 				'TXT_KEY_CITYSTATE_QUELIMANE' UNION ALL
SELECT 'POLICY_SADDARVAZEH', 			'TXT_KEY_CITYSTATE_SADDARVAZEH' UNION ALL
SELECT 'POLICY_SAMARKAND', 				'TXT_KEY_CITYSTATE_SAMARKAND' UNION ALL
SELECT 'POLICY_SANAA', 					'TXT_KEY_CITYSTATE_SANAA' UNION ALL
SELECT 'POLICY_SANTO_DOMINGO', 			'TXT_KEY_CITYSTATE_SANTO_DOMINGO' UNION ALL
SELECT 'POLICY_SIERRA_LEONE', 			'TXT_KEY_CITYSTATE_SIERRA_LEONE' UNION ALL
SELECT 'POLICY_SINGAPORE', 				'TXT_KEY_CITYSTATE_SINGAPORE' UNION ALL
SELECT 'POLICY_SOFIA', 					'TXT_KEY_CITYSTATE_SOFIA' UNION ALL
SELECT 'POLICY_SUCEAVA', 				'TXT_KEY_CITYSTATE_SUCEAVA' UNION ALL
SELECT 'POLICY_SURREY', 				'TXT_KEY_CITYSTATE_SURREY' UNION ALL
SELECT 'POLICY_SYDNEY', 				'TXT_KEY_CITYSTATE_SYDNEY' UNION ALL
SELECT 'POLICY_TBILISI', 				'TXT_KEY_CITYSTATE_TBILISI' UNION ALL
SELECT 'POLICY_TYRE', 					'TXT_KEY_CITYSTATE_TYRE' UNION ALL
SELECT 'POLICY_UR', 					'TXT_KEY_CITYSTATE_UR' UNION ALL
SELECT 'POLICY_VANCOUVER', 				'TXT_KEY_CITYSTATE_VANCOUVER' UNION ALL
SELECT 'POLICY_VATICAN_CITY', 			'TXT_KEY_CITYSTATE_VATICAN_CITY' UNION ALL
SELECT 'POLICY_WOOTEI_NIICIE', 			'TXT_KEY_CITYSTATE_WOOTEI_NIICIE' UNION ALL
SELECT 'POLICY_ZANZIBAR', 				'TXT_KEY_CITYSTATE_ZANZIBAR' UNION ALL
SELECT 'POLICY_CS_MARITIME', 			'TXT_KEY_POLICY_CS_MARITIME' UNION ALL
SELECT 'POLICY_CS_MERCANTILE', 			'TXT_KEY_POLICY_CS_MERCANTILE' UNION ALL
SELECT 'POLICY_CS_MILITARISTIC', 		'TXT_KEY_POLICY_CS_MILITARISTIC' UNION ALL
SELECT 'POLICY_CS_CULTURED', 			'TXT_KEY_POLICY_CS_CULTURED' UNION ALL
SELECT 'POLICY_CS_RELIGIOUS', 			'TXT_KEY_POLICY_CS_RELIGIOUS' UNION ALL
SELECT 'POLICY_MONOPOLY_GLASS', 		'TXT_KEY_RESOURCE_GLASS' UNION ALL
SELECT 'POLICY_MONOPOLY_CHEESE', 		'TXT_KEY_RESOURCE_CHEESE' UNION ALL
SELECT 'POLICY_MONOPOLY_HONEY', 		'TXT_KEY_RESOURCE_HONEY' UNION ALL
SELECT 'POLICY_MONOPOLY_ROPES', 		'TXT_KEY_RESOURCE_ROPES' UNION ALL
SELECT 'POLICY_MONOPOLY_PORCELAIN', 	'TXT_KEY_RESOURCE_PORCELAIN' UNION ALL
SELECT 'POLICY_MONOPOLY_TAPESTRIES', 	'TXT_KEY_RESOURCE_TAPESTRIES' UNION ALL
SELECT 'POLICY_MONOPOLY_MANUSCRIPTS', 	'TXT_KEY_RESOURCE_MANUSCRIPTS' UNION ALL
SELECT 'POLICY_MONOPOLY_CHAMPAGNE', 	'TXT_KEY_RESOURCE_CHAMPAGNE' UNION ALL
SELECT 'POLICY_MONOPOLY_MOSAICS', 		'TXT_KEY_RESOURCE_MOSAICS' UNION ALL
SELECT 'POLICY_MONOPOLY_GUNPOWDER', 	'TXT_KEY_RESOURCE_GUNPOWDER';

UPDATE Policies SET AfraidMinorPerTurnInfluence = 100 WHERE Type = 'POLICY_ALMATY';
UPDATE Policies SET CityStateUnitFrequencyModifier = 10 WHERE Type = 'POLICY_AMBRACIA';
UPDATE Policies SET AlwaysSeeBarbCamps = 1 WHERE Type = 'POLICY_ANTANANARIVO'; 
UPDATE Policies SET EventTourism = 2 WHERE Type = 'POLICY_BUCHAREST'; 
UPDATE Policies SET ExtraHappinessPerLuxury = 1 WHERE Type = 'POLICY_BUENOS_AIRES'; 
UPDATE Policies SET MinorGreatPeopleAllies = 1 WHERE Type = 'POLICY_BRATISLAVA';
UPDATE Policies SET WonderProductionModifier = 5 WHERE Type = 'POLICY_BYBLOS';
UPDATE Policies SET MilitaryUnitGiftExtraInfluence = 20 WHERE Type = 'POLICY_DAKKAR';
UPDATE Policies SET TradeReligionModifier = 10 WHERE Type = 'POLICY_DALI';
UPDATE Policies SET PlotCultureCostModifier = -10 WHERE Type = 'POLICY_DANO';
UPDATE Policies SET SettlerProductionModifier = 80 WHERE Type = 'POLICY_DJIBOUTI';
UPDATE Policies SET FreeTradeRoute = 1 WHERE Type = 'POLICY_DOUALA';
UPDATE Policies SET WarScoreModifier = 20 WHERE Type = 'POLICY_GRANADA';
UPDATE Policies SET CSResourcesCountForMonopolies = 1 WHERE Type = 'POLICY_HONDURAS';
UPDATE Policies SET CityGrowthMod = 5 WHERE Type = 'POLICY_HONG_KONG';
UPDATE Policies SET MissionInfluenceModifier = 15 WHERE Type = 'POLICY_KATENDE';
UPDATE Policies SET WarWearinessModifier = 10 WHERE Type = 'POLICY_KIGALI';
UPDATE Policies SET TradeMissionGoldModifier = 10, GreatMerchantRateModifier = 10 WHERE Type = 'POLICY_MALACCA'; 
UPDATE Policies SET TradeRouteYieldModifier = 5 WHERE Type = 'POLICY_MANILA';
UPDATE Policies SET GoldenAgeMeterMod = -5 WHERE Type = 'POLICY_MOGADISHU';
UPDATE Policies SET PlotGoldCostMod = -33 WHERE Type = 'POLICY_MONACO';
UPDATE Policies SET DoubleBorderGrowthGA = 1, DoubleBorderGrowthWLTKD = 1 WHERE Type = 'POLICY_MUISCA'; 
UPDATE Policies SET ExtraMissionarySpreads = 1 WHERE Type = 'POLICY_MULTAN';
UPDATE Policies SET CatchSpiesModifier = 50, GarrisonedCityRangeStrikeModifier = 10, GarrisonFreeMaintenance = 1 WHERE Type = 'POLICY_MUSCAT';
UPDATE Policies SET ProtectedMinorPerTurnInfluence = 40 WHERE Type = 'POLICY_ORMUS';
UPDATE Policies SET WorkerSpeedModifier = 15 WHERE Type = 'POLICY_OUIDAH';
UPDATE Policies SET EspionageNetworkPoints = 5, RiggingElectionModifier = 20 WHERE Type = 'POLICY_PHANOTEUS';
UPDATE Policies SET GoldenAgeDurationMod = 25 WHERE Type = 'POLICY_QUELIMANE';
UPDATE Policies SET TRVisionBoost = 2 WHERE Type = 'POLICY_SAMARKAND';
UPDATE Policies SET MonopolyModPercent = 5 WHERE Type = 'POLICY_SANAA';
UPDATE Policies SET MonopolyModFlat = 2 WHERE Type = 'POLICY_SANTO_DOMINGO';
UPDATE Policies SET WorkerSpeedModifier = 20 WHERE Type = 'POLICY_SIERRA_LEONE';
UPDATE Policies SET GreatGeneralExtraBonus = 10 WHERE Type = 'POLICY_SOFIA';
UPDATE Policies SET FaithCostModifier = -10 WHERE Type = 'POLICY_SUCEAVA';
UPDATE Policies SET DomesticGreatGeneralRateModifier = 50, PuppetYieldPenaltyMod = 33 WHERE Type = 'POLICY_TBILISI';
UPDATE Policies SET NewCityExtraPopulation = 1 WHERE Type = 'POLICY_UR';
UPDATE Policies SET RouteGoldMaintenanceMod = -30 WHERE Type = 'POLICY_VANCOUVER';
UPDATE Policies SET HappinessPerActiveTradeRoute = 1 WHERE Type = 'POLICY_ZANZIBAR'; -- "HappinessPerTradeRoute = 75" means City connections :(

UPDATE Policies SET MonopolyModFlat = 1, MonopolyModPercent = 2 WHERE Type = 'POLICY_MONOPOLY_GLASS';

--UPDATE Policies SET CityStateUnitFrequencyModifier = 1 WHERE Type = 'POLICY_CS_MILITARISTIC_FRIENDLY'

INSERT INTO Policy_BuildingClassHappiness
    		(PolicyType, 		BuildingClassType, 			Happiness)
SELECT 		'POLICY_BAGAN',		'BUILDINGCLASS_TEMPLE', 	1;

INSERT INTO Policy_BuildingClassProductionModifiers 
			(PolicyType, 		BuildingClassType, 		ProductionModifier)
SELECT 		'POLICY_DJIBOUTI', 'BUILDINGCLASS_GRANARY', 	100;

INSERT INTO Policy_YieldChangesNaturalWonder 
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_MUTITJULU', 'YIELD_FAITH', 	3;

INSERT INTO Policy_YieldChangeTradeRoute /* City Connections */
			(PolicyType, 		YieldType, 							Yield)
SELECT 		'POLICY_ALMATY', 	'YIELD_SCIENCE', 					1 UNION ALL
SELECT 		'POLICY_PALMYRA', 	'YIELD_PRODUCTION', 				1 UNION ALL
SELECT 		'POLICY_UR', 		'YIELD_FOOD', 						2;

INSERT INTO Policy_TradeRouteYieldChange /* Actual Trade Routes */
			(PolicyType, 					DomainType,			YieldType, 					Yield)
SELECT 		'POLICY_ALMATY', 				'DOMAIN_LAND',		'YIELD_SCIENCE', 			1 UNION ALL
SELECT 		'POLICY_ANANGULA', 				'DOMAIN_SEA',		'YIELD_GOLD', 				1 UNION ALL
SELECT 		'POLICY_ANANGULA', 				'DOMAIN_SEA',		'YIELD_CULTURE', 			1 UNION ALL
SELECT 		'POLICY_BEDULU', 				'DOMAIN_SEA',		'YIELD_FAITH', 				2 UNION ALL
SELECT 		'POLICY_DODOMA', 				'DOMAIN_SEA',		'YIELD_TOURISM', 			1;

INSERT INTO Policy_CapitalYieldPerPopChanges
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_MUISCA', 	'YIELD_GOLD', 	34;

INSERT INTO Policy_CapitalYieldPerPopChangeEmpire
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_MUISCA', 	'YIELD_GOLD', 	20;

INSERT INTO Policy_CoastalCityYieldChanges 
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_AUCKLAND', 	'YIELD_FOOD', 	3;

INSERT INTO Policy_GreatWorkYieldChanges 
			(PolicyType, 			YieldType, 			Yield)
SELECT 		'POLICY_BUCHAREST',		'YIELD_CULTURE', 	1;

INSERT INTO Policy_LitYieldChanges 
			(PolicyType, 			YieldType, 			Yield)
SELECT 		'POLICY_SADDARVAZEH',	'YIELD_FAITH', 		2;

INSERT INTO Policy_MusicYieldChanges 
			(PolicyType, 			YieldType, 			Yield)
SELECT 		'POLICY_HONIARA',		'YIELD_FOOD', 		2;

INSERT INTO Policy_WLTKDYieldMod 
			(PolicyType, 		YieldType, 			Yield)
SELECT 		'POLICY_GWYNEDD', 	'YIELD_CULTURE', 	10;
SELECT 		'POLICY_SYDNEY', 	'YIELD_FOOD', 		5;

INSERT INTO Policy_GoldenAgeYieldMod
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_MOGADISHU', 'YIELD_FOOD', 	10;

INSERT INTO Policy_YieldFromBirth
			(PolicyType, 			YieldType, 			Yield)
SELECT 		'POLICY_KUALA_LUMPUR', 	'YIELD_CULTURE',	10 UNION ALL
SELECT 		'POLICY_MULTAN', 		'YIELD_FAITH', 		10;

INSERT INTO Policy_YieldFromConstruction 
			(PolicyType, 			YieldType, 		Yield)
SELECT 		'POLICY_KUALA_LUMPUR', 	'YIELD_FOOD', 	20 UNION ALL
SELECT 		'POLICY_BAGAN',			'YIELD_FAITH', 	10;

INSERT INTO Policy_YieldFromBorderGrowth 
			(PolicyType, 		YieldType, 			Yield)
SELECT 		'POLICY_DANO',		'YIELD_FAITH', 		3 UNION ALL
SELECT 		'POLICY_KIGALI',	'YIELD_PRODUCTION',	1 UNION ALL
SELECT 		'POLICY_KIGALI',	'YIELD_GOLD',		1;

INSERT INTO Policy_ConquerorYield 
			(PolicyType, 		YieldType, 			Yield)
SELECT 		'POLICY_BOGOTA', 	'YIELD_CULTURE', 	40;

INSERT INTO Policy_FounderYield 
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_MOMBASA',	'YIELD_FAITH', 	40;

INSERT INTO Policy_UnitCombatProductionModifiers
			(PolicyType,					UnitCombatType,				ProductionModifier)
SELECT 		'POLICY_BELGRADE', 				'UNITCOMBAT_SIEGE', 		10 UNION ALL
SELECT 		'POLICY_BYBLOS', 				'UNITCOMBAT_NAVALMELEE', 	5 UNION ALL
SELECT 		'POLICY_BYBLOS', 				'UNITCOMBAT_NAVALRANGED', 	5 UNION ALL
SELECT 		'POLICY_BYBLOS', 				'UNITCOMBAT_CARRIER', 		5 UNION ALL
SELECT 		'POLICY_BYBLOS', 				'UNITCOMBAT_SUBMARINE', 	5 UNION ALL
SELECT 		'POLICY_BYBLOS', 				'UNITCOMBAT_CARGO', 		5 UNION ALL
SELECT 		'POLICY_BYBLOS', 				'UNITCOMBAT_WORKBOAT', 		5 UNION ALL
SELECT 		'POLICY_DOUALA', 				'UNITCOMBAT_CARGO', 		10 UNION ALL
SELECT 		'POLICY_DOUALA', 				'UNITCOMBAT_CARAVAN', 		10 UNION ALL
SELECT 		'POLICY_HANUABADA', 			'UNITCOMBAT_CARGO',			15 UNION ALL
SELECT 		'POLICY_IRUNEA', 				'UNITCOMBAT_WORKBOAT',		20 UNION ALL
SELECT 		'POLICY_SINGAPORE', 			'UNITCOMBAT_DIPLOMACY',		5 UNION ALL
SELECT 		'POLICY_SURREY', 				'UNITCOMBAT_FIGHTER',		10 UNION ALL
SELECT 		'POLICY_SURREY', 				'UNITCOMBAT_BOMBER',		10 UNION ALL
SELECT 		'POLICY_TYRE', 					'UNITCOMBAT_ARCHAEOLOGIST', 10 UNION ALL
SELECT 		'POLICY_WOOTEI_NIICIE', 		'UNITCOMBAT_MOUNTED',		10 UNION ALL
SELECT 		'POLICY_WOOTEI_NIICIE', 		'UNITCOMBAT_GUN',			10 UNION ALL
SELECT 		'POLICY_MONOPOLY_MANUSCRIPTS', 	'UNITCOMBAT_DIPLOMACY',		10 UNION ALL
SELECT 		'POLICY_MONOPOLY_ROPES', 		'UNITCOMBAT_NAVALMELEE',	10 UNION ALL
SELECT 		'POLICY_MONOPOLY_ROPES', 		'UNITCOMBAT_NAVALRANGED',	10 UNION ALL
SELECT 		'POLICY_MONOPOLY_ROPES', 		'UNITCOMBAT_CARRIER',		10 UNION ALL
SELECT 		'POLICY_MONOPOLY_ROPES', 		'UNITCOMBAT_SUBMARINE',		10 UNION ALL
SELECT 		'POLICY_MONOPOLY_ROPES', 		'UNITCOMBAT_CARGO',			10 UNION ALL
SELECT 		'POLICY_MONOPOLY_ROPES', 		'UNITCOMBAT_WORKBOAT',		10 UNION ALL
SELECT 		'POLICY_MONOPOLY_PORCELAIN', 	'UNITCOMBAT_ARCHAEOLOGIST',	15 UNION ALL
SELECT 		'POLICY_MONOPOLY_GUNPOWDER', 	'UNITCOMBAT_GUN',			5;

INSERT INTO Policy_ResourceYieldChanges
			(PolicyType,					ResourceType,			YieldType,				Yield)
SELECT 		'POLICY_MONOPOLY_CHEESE', 		'RESOURCE_COW',			'YIELD_PRODUCTION',		2 UNION ALL
SELECT 		'POLICY_MONOPOLY_CHEESE', 		'RESOURCE_SHEEP',		'YIELD_PRODUCTION',		2 UNION ALL
SELECT 		'POLICY_MONOPOLY_HONEY', 		'RESOURCE_MAIZE',		'YIELD_GOLD',			1 UNION ALL
SELECT 		'POLICY_MONOPOLY_HONEY', 		'RESOURCE_RICE',		'YIELD_GOLD',			1 UNION ALL
SELECT 		'POLICY_MONOPOLY_HONEY', 		'RESOURCE_WHEAT',		'YIELD_GOLD',			1;

INSERT INTO Policy_ResourceYieldChanges (PolicyType,  					YieldType, 					Yield, 	ResourceType)
SELECT DISTINCT							'POLICY_MONOPOLY_CHAMPAGNE', 	'YIELD_GOLDEN_AGE_POINTS', 	1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

INSERT INTO Policy_BuildingClassCulturechanges
			(PolicyType,					BuildingClassType,			CultureChange)
SELECT 		'POLICY_MONOPOLY_TAPESTRIES', 	'BUILDINGCLASS_PALACE',		1 UNION ALL
SELECT 		'POLICY_MONOPOLY_TAPESTRIES', 	'BUILDINGCLASS_CASTLE',		1;

INSERT INTO Policy_BuildingClassCulturechanges (PolicyType,				BuildingClassType,	CultureChange)
SELECT DISTINCT							'POLICY_MONOPOLY_TAPESTRIES',	BuildingClass,		1
FROM Buildings WHERE Cost = -1 and FaithCost > 0 AND WonderSplashImage IS NULL;

INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType, 					ImprovementType, 			YieldType, 			Yield)
SELECT 		'POLICY_MONOPOLY_MOSAICS', 		'IMPROVEMENT_HOLY_SITE', 	'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'POLICY_MONOPOLY_MOSAICS', 		'IMPROVEMENT_HOLY_SITE', 	'YIELD_FAITH',		1;
---------------------------------------------------
-- Definitions - Unit Promotions
-- #22 icon is unused starting from v14
---------------------------------------------------
INSERT INTO UnitPromotions 
			(Type, 										Description, 								Help, 											CannotBeChosen, Sound, 				PortraitIndex, 	IconAtlas, 				PediaType, 			PediaEntry)
SELECT 		'PROMOTION_AMBRACIA', 						'TXT_KEY_PROMOTION_AMBRACIA', 				'TXT_KEY_PROMOTION_AMBRACIA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	17, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_AMBRACIA' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 					'TXT_KEY_PROMOTION_ANTANANARIVO', 			'TXT_KEY_PROMOTION_ANTANANARIVO_HELP', 			1, 				'AS2D_IF_LEVELUP', 	8, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_ANTANANARIVO' UNION ALL
SELECT 		'PROMOTION_AUCKLAND', 						'TXT_KEY_PROMOTION_AUCKLAND', 				'TXT_KEY_PROMOTION_AUCKLAND_HELP', 				1, 				'AS2D_IF_LEVELUP', 	26, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_AUCKLAND' UNION ALL
SELECT 		'PROMOTION_BELGRADE', 						'TXT_KEY_PROMOTION_BELGRADE', 				'TXT_KEY_PROMOTION_BELGRADE_HELP', 				1, 				'AS2D_IF_LEVELUP', 	9, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SIEGE', 		'TXT_KEY_PROMOTION_BELGRADE' UNION ALL
SELECT 		'PROMOTION_BRUSSELS', 						'TXT_KEY_PROMOTION_BRUSSELS', 				'TXT_KEY_PROMOTION_BRUSSELS_HELP', 				1, 				'AS2D_IF_LEVELUP', 	50, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_BRUSSELS' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 						'TXT_KEY_PROMOTION_CLERMONT', 				'TXT_KEY_PROMOTION_CLERMONT_HELP', 				1, 				'AS2D_IF_LEVELUP', 	0, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 						'TXT_KEY_PROMOTION_CLERMONT1', 				'TXT_KEY_PROMOTION_CLERMONT1_HELP', 			1, 				'AS2D_IF_LEVELUP', 	1, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT1' UNION ALL
SELECT 		'PROMOTION_CLERMONT2', 						'TXT_KEY_PROMOTION_CLERMONT2', 				'TXT_KEY_PROMOTION_CLERMONT2_HELP', 			1, 				'AS2D_IF_LEVELUP', 	2, 				'UCS_PROMOTION_ATLAS',	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT2' UNION ALL
SELECT 		'PROMOTION_CLERMONT3', 						'TXT_KEY_PROMOTION_CLERMONT3', 				'TXT_KEY_PROMOTION_CLERMONT3_HELP', 			1, 				'AS2D_IF_LEVELUP', 	3, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT3' UNION ALL
SELECT 		'PROMOTION_CLERMONT4', 						'TXT_KEY_PROMOTION_CLERMONT4', 				'TXT_KEY_PROMOTION_CLERMONT4_HELP', 			1, 				'AS2D_IF_LEVELUP', 	4, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT4' UNION ALL
SELECT 		'PROMOTION_CLERMONT5', 						'TXT_KEY_PROMOTION_CLERMONT5', 				'TXT_KEY_PROMOTION_CLERMONT5_HELP', 			1, 				'AS2D_IF_LEVELUP', 	5, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT5' UNION ALL
SELECT 		'PROMOTION_CLERMONT6', 						'TXT_KEY_PROMOTION_CLERMONT6', 				'TXT_KEY_PROMOTION_CLERMONT6_HELP', 			1, 				'AS2D_IF_LEVELUP', 	6, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT6' UNION ALL
SELECT 		'PROMOTION_CLERMONT7', 						'TXT_KEY_PROMOTION_CLERMONT7', 				'TXT_KEY_PROMOTION_CLERMONT7_HELP', 			1, 				'AS2D_IF_LEVELUP', 	7, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT7' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 						'TXT_KEY_PROMOTION_DAKKAR', 				'TXT_KEY_PROMOTION_DAKKAR_HELP', 				1, 				'AS2D_IF_LEVELUP', 	47, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_DIPLO', 		'TXT_KEY_PROMOTION_DAKKAR' UNION ALL
SELECT 		'PROMOTION_DODOMA', 						'TXT_KEY_PROMOTION_DODOMA', 				'TXT_KEY_PROMOTION_DODOMA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	16, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_CIVILIAN', 	'TXT_KEY_PROMOTION_DODOMA' UNION ALL
SELECT 		'PROMOTION_FAYA', 							'TXT_KEY_PROMOTION_FAYA', 					'TXT_KEY_PROMOTION_FAYA_HELP', 					1, 				'AS2D_IF_LEVELUP', 	18, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_FAYA' UNION ALL
SELECT 		'PROMOTION_HANOI', 							'TXT_KEY_PROMOTION_HANOI', 					'TXT_KEY_PROMOTION_HANOI_HELP', 				1, 				'AS2D_IF_LEVELUP', 	10, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_HANOI' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 						'TXT_KEY_PROMOTION_HANUABADA', 				'TXT_KEY_PROMOTION_HANUABADA_HELP', 			1, 				'AS2D_IF_LEVELUP', 	51, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_CIVILIAN', 	'TXT_KEY_PROMOTION_HANUABADA' UNION ALL
SELECT 		'PROMOTION_IFE', 							'TXT_KEY_PROMOTION_IFE', 					'TXT_KEY_PROMOTION_IFE_HELP', 					1, 				'AS2D_IF_LEVELUP', 	27, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_DIPLO', 		'TXT_KEY_PROMOTION_IFE' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 						'TXT_KEY_PROMOTION_ISKANWAYA', 				'TXT_KEY_PROMOTION_ISKANWAYA_HELP', 			1, 				'AS2D_IF_LEVELUP', 	20, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_HEAL', 		'TXT_KEY_PROMOTION_ISKANWAYA' UNION ALL
SELECT 		'PROMOTION_KABUL', 							'TXT_KEY_PROMOTION_KABUL', 					'TXT_KEY_PROMOTION_KABUL_HELP', 				1, 				'AS2D_IF_LEVELUP', 	23, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_KABUL' UNION ALL
SELECT 		'PROMOTION_KARASJOHKA', 					'TXT_KEY_PROMOTION_KARASJOHKA', 			'TXT_KEY_PROMOTION_KARASJOHKA_HELP', 			1, 				'AS2D_IF_LEVELUP', 	31, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_KARASJOHKA' UNION ALL
SELECT 		'PROMOTION_KARYES', 						'TXT_KEY_PROMOTION_KARYES', 				'TXT_KEY_PROMOTION_KARYES_HELP', 				1, 				'AS2D_IF_LEVELUP', 	29, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_CIVILIAN', 	'TXT_KEY_PROMOTION_KARYES' UNION ALL
SELECT 		'PROMOTION_LACONIA', 						'TXT_KEY_PROMOTION_LACONIA', 				'TXT_KEY_PROMOTION_LACONIA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	11, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_LACONIA' UNION ALL
SELECT 		'PROMOTION_LEVUKA', 						'TXT_KEY_PROMOTION_LEVUKA', 				'TXT_KEY_PROMOTION_LEVUKA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	21, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_LEVUKA' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 					'TXT_KEY_PROMOTION_MBANZA_KONGO', 			'TXT_KEY_PROMOTION_MBANZA_KONGO_HELP', 			1, 				'AS2D_IF_LEVELUP', 	12, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_MBANZA_KONGO' UNION ALL
SELECT 		'PROMOTION_MENDYARRUP', 					'TXT_KEY_PROMOTION_MENDYARRUP', 			'TXT_KEY_PROMOTION_MENDYARRUP_HELP', 			1, 				'AS2D_IF_LEVELUP', 	52, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_MENDYARRUP' UNION ALL
SELECT 		'PROMOTION_ODENSO', 						'TXT_KEY_PROMOTION_ODENSO', 				'TXT_KEY_PROMOTION_ODENSO_HELP', 				1, 				'AS2D_IF_LEVELUP', 	13, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_ODENSO' UNION ALL
SELECT 		'PROMOTION_PELYM', 							'TXT_KEY_PROMOTION_PELYM', 					'TXT_KEY_PROMOTION_PELYM_HELP', 				1, 				'AS2D_IF_LEVELUP', 	30, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_PELYM' UNION ALL
SELECT 		'PROMOTION_POKROVKA', 						'TXT_KEY_PROMOTION_POKROVKA', 				'TXT_KEY_PROMOTION_POKROVKA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	48, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MOUNTED', 	'TXT_KEY_PROMOTION_POKROVKA' UNION ALL
SELECT 		'PROMOTION_SIDON', 							'TXT_KEY_PROMOTION_SIDON', 					'TXT_KEY_PROMOTION_SIDON_HELP', 				1, 				'AS2D_IF_LEVELUP', 	14, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_SIDON' UNION ALL
SELECT 		'PROMOTION_SGANG_GWAAY', 					'TXT_KEY_PROMOTION_SGANG_GWAAY', 			'TXT_KEY_PROMOTION_SGANG_GWAAY_HELP', 			1, 				'AS2D_IF_LEVELUP', 	28, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_NAVAL', 		'TXT_KEY_PROMOTION_SGANG_GWAAY' UNION ALL
SELECT 		'PROMOTION_SUCEAVA', 						'TXT_KEY_PROMOTION_SUCEAVA', 				'TXT_KEY_PROMOTION_SUCEAVA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	49, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_SUCEAVA' UNION ALL
SELECT 		'PROMOTION_SURREY', 						'TXT_KEY_PROMOTION_SURREY', 				'TXT_KEY_PROMOTION_SURREY_HELP', 				1, 				'AS2D_IF_LEVELUP', 	19, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_AIR', 		'TXT_KEY_PROMOTION_SURREY' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 						'TXT_KEY_PROMOTION_YEREVAN', 				'TXT_KEY_PROMOTION_YEREVAN_HELP', 				1, 				'AS2D_IF_LEVELUP', 	15, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_YEREVAN' UNION ALL
SELECT 		'PROMOTION_GUARDIA_SVIZZERA', 				'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA', 		'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA_HELP', 		1, 				'AS2D_IF_LEVELUP', 	25, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA' UNION ALL
SELECT 		'PROMOTION_KATZBALGER', 					'TXT_KEY_PROMOTION_KATZBALGER', 			'TXT_KEY_PROMOTION_KATZBALGER_HELP', 			1, 				'AS2D_IF_LEVELUP', 	24, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_KATZBALGER' UNION ALL
SELECT 		'PROMOTION_SIKH', 							'TXT_KEY_PROMOTION_SIKH', 					'TXT_KEY_PROMOTION_SIKH_HELP', 					1, 				'AS2D_IF_LEVELUP', 	32, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE',		'TXT_KEY_PROMOTION_SIKH' UNION ALL
SELECT 		'PROMOTION_SIKH_SWORD', 					'TXT_KEY_PROMOTION_SIKH_SWORD', 			'TXT_KEY_PROMOTION_SIKH_SWORD_HELP', 			0, 				'AS2D_IF_LEVELUP', 	33, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_SWORD' UNION ALL
SELECT 		'PROMOTION_SIKH_KNIFE', 					'TXT_KEY_PROMOTION_SIKH_KNIFE', 			'TXT_KEY_PROMOTION_SIKH_KNIFE_HELP', 			0, 				'AS2D_IF_LEVELUP', 	34, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_KNIFE' UNION ALL
SELECT 		'PROMOTION_SIKH_DISC', 						'TXT_KEY_PROMOTION_SIKH_DISC', 				'TXT_KEY_PROMOTION_SIKH_DISC_HELP', 			0, 				'AS2D_IF_LEVELUP', 	35, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_DISC' UNION ALL
SELECT 		'PROMOTION_SIKH_TRIDENT', 					'TXT_KEY_PROMOTION_SIKH_TRIDENT', 			'TXT_KEY_PROMOTION_SIKH_TRIDENT_HELP', 			0, 				'AS2D_IF_LEVELUP', 	36, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_TRIDENT' UNION ALL
SELECT 		'PROMOTION_SIKH_DAGGER', 					'TXT_KEY_PROMOTION_SIKH_DAGGER', 			'TXT_KEY_PROMOTION_SIKH_DAGGER_HELP', 			0, 				'AS2D_IF_LEVELUP', 	37, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_DAGGER' UNION ALL
SELECT 		'PROMOTION_SIKH_BOW', 						'TXT_KEY_PROMOTION_SIKH_BOW', 				'TXT_KEY_PROMOTION_SIKH_BOW_HELP', 				0, 				'AS2D_IF_LEVELUP', 	38, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_BOW' UNION ALL
SELECT 		'PROMOTION_SIKH_MUSKET', 					'TXT_KEY_PROMOTION_SIKH_MUSKET', 			'TXT_KEY_PROMOTION_SIKH_MUSKET_HELP', 			0, 				'AS2D_IF_LEVELUP', 	39, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_MUSKET' UNION ALL
SELECT 		'PROMOTION_SIKH_SHIELD', 					'TXT_KEY_PROMOTION_SIKH_SHIELD', 			'TXT_KEY_PROMOTION_SIKH_SHIELD_HELP', 			0, 				'AS2D_IF_LEVELUP', 	40, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_SHIELD' UNION ALL
SELECT 		'PROMOTION_SIKH_CHAINMAIL', 				'TXT_KEY_PROMOTION_SIKH_CHAINMAIL', 		'TXT_KEY_PROMOTION_SIKH_CHAINMAIL_HELP', 		0, 				'AS2D_IF_LEVELUP', 	41, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_CHAINMAIL' UNION ALL
SELECT 		'PROMOTION_SIKH_ROBE', 						'TXT_KEY_PROMOTION_SIKH_ROBE', 				'TXT_KEY_PROMOTION_SIKH_ROBE_HELP', 			0, 				'AS2D_IF_LEVELUP', 	42, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_ROBE' UNION ALL
SELECT 		'PROMOTION_SIKH_SHOES', 					'TXT_KEY_PROMOTION_SIKH_SHOES', 			'TXT_KEY_PROMOTION_SIKH_SHOES_HELP', 			0, 				'AS2D_IF_LEVELUP', 	43, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_SHOES' UNION ALL
SELECT 		'PROMOTION_SIKH_MARTIAL_ART', 				'TXT_KEY_PROMOTION_SIKH_MARTIAL_ART', 		'TXT_KEY_PROMOTION_SIKH_MARTIAL_ART_HELP', 		0, 				'AS2D_IF_LEVELUP', 	44, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_MARTIAL_ART' UNION ALL
SELECT 		'PROMOTION_SIKH_TURBAN', 					'TXT_KEY_PROMOTION_SIKH_TURBAN', 			'TXT_KEY_PROMOTION_SIKH_TURBAN_HELP', 			0, 				'AS2D_IF_LEVELUP', 	45, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_TURBAN' UNION ALL
SELECT 		'PROMOTION_SIKH_BRACELET', 					'TXT_KEY_PROMOTION_SIKH_BRACELET', 			'TXT_KEY_PROMOTION_SIKH_BRACELET_HELP', 		0, 				'AS2D_IF_LEVELUP', 	46, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_SIKH_BRACELET' UNION ALL
SELECT 		'PROMOTION_SCYTHIAN_BARRAGE', 				'TXT_KEY_PROMOTION_POKROVKA', 				'TXT_KEY_PROMOTION_POKROVKA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	48, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_RANGED', 	'TXT_KEY_PROMOTION_POKROVKA' /*UNION ALL
SELECT 		'PROMOTION_???', 							'TXT_KEY_PROMOTION_???', 					'TXT_KEY_PROMOTION_???_HELP', 					1, 				'AS2D_IF_LEVELUP', 	22, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_???', 		'TXT_KEY_PROMOTION_???'*/;

UPDATE UnitPromotions SET MaxHitPointsChange = 25 WHERE Type = 'PROMOTION_BELGRADE';
UPDATE UnitPromotions SET River = 1 WHERE Type = 'PROMOTION_BRUSSELS';
UPDATE UnitPromotions SET ExperiencePercent = 15 WHERE Type = 'PROMOTION_CLERMONT';
UPDATE UnitPromotions SET HasPostCombatPromotions = 1 WHERE Type = 'PROMOTION_CLERMONT1';
UPDATE UnitPromotions SET MovesChange = 1, CanMoveAfterAttacking = 1 WHERE Type = 'PROMOTION_CLERMONT2';
UPDATE UnitPromotions SET AdjacentMod = 15 WHERE Type = 'PROMOTION_CLERMONT3';
UPDATE UnitPromotions SET AttackMod = 5, AttackFortifiedMod = 15 WHERE Type = 'PROMOTION_CLERMONT4';
UPDATE UnitPromotions SET DefenseMod = 5, AlwaysHeal = 1 WHERE Type = 'PROMOTION_CLERMONT5';
UPDATE UnitPromotions SET GreatGeneral = 1, AdjacentTileHealChange = 5 WHERE Type = 'PROMOTION_CLERMONT6';
UPDATE UnitPromotions SET VisibilityChange = 1 WHERE Type = 'PROMOTION_CLERMONT7';
UPDATE UnitPromotions SET MovesChange = 2 WHERE Type = 'PROMOTION_DODOMA';
UPDATE UnitPromotions SET FriendlyLandsModifier = 10 WHERE Type = 'PROMOTION_HANOI';
UPDATE UnitPromotions SET EmbarkDefenseModifier = 50, EmbarkExtraVisibility = 2 WHERE Type = 'PROMOTION_HANUABADA';
UPDATE UnitPromotions SET DiploMissionInfluence = 10, MovesChange = 1, VisibilityChange = 1 WHERE Type = 'PROMOTION_IFE';
UPDATE UnitPromotions SET OpenDefense = 25, RoughDefense = 25 WHERE Type = 'PROMOTION_KABUL';
UPDATE UnitPromotions SET AttackMod = 5 WHERE Type = 'PROMOTION_KARASJOHKA';
UPDATE UnitPromotions SET CanCrossMountains = 1 WHERE Type = 'PROMOTION_KARYES';
UPDATE UnitPromotions SET AdjacentMod = 15 WHERE Type = 'PROMOTION_LACONIA';
UPDATE UnitPromotions SET FreePillageMoves = 1 WHERE Type = 'PROMOTION_MENDYARRUP';
UPDATE UnitPromotions SET NeutralHealChange = 5, VisibilityChange = 1 WHERE Type = 'PROMOTION_ODENSO';
UPDATE UnitPromotions SET NearbyEnemyDamage = 5 WHERE Type = 'PROMOTION_POKROVKA';
UPDATE UnitPromotions SET EnemyHealChange = 5 WHERE Type = 'PROMOTION_SIDON';
UPDATE UnitPromotions SET CanMoveImpassable = 1 WHERE Type = 'PROMOTION_SGANG_GWAAY';
UPDATE UnitPromotions SET DefenseMod = 10 WHERE Type = 'PROMOTION_SUCEAVA';

UPDATE UnitPromotions SET ExperiencePercent = 30 WHERE Type = 'PROMOTION_SIKH';
UPDATE UnitPromotions SET AttackMod = 10 WHERE Type = 'PROMOTION_SIKH_SWORD';
UPDATE UnitPromotions SET AttackBelowEqual50HealthMod = 15 WHERE Type = 'PROMOTION_SIKH_KNIFE';
UPDATE UnitPromotions SET FriendlyLandsModifier = 20 WHERE Type = 'PROMOTION_SIKH_DISC';
UPDATE UnitPromotions SET AttackWoundedMod = 20 WHERE Type = 'PROMOTION_SIKH_DAGGER';
UPDATE UnitPromotions SET AttackFullyHealedMod = 15 WHERE Type = 'PROMOTION_SIKH_BOW';
UPDATE UnitPromotions SET RangedSupportFire = 1 WHERE Type = 'PROMOTION_SIKH_MUSKET';
UPDATE UnitPromotions SET RangedDefenseMod = 20 WHERE Type = 'PROMOTION_SIKH_SHIELD';
UPDATE UnitPromotions SET DefenseMod = 10, MaxHitPointsChange = 15 WHERE Type = 'PROMOTION_SIKH_CHAINMAIL';
UPDATE UnitPromotions SET ExperiencePercent = 10, MoraleBreakChance = 20 WHERE Type = 'PROMOTION_SIKH_ROBE';
UPDATE UnitPromotions SET MovesChange = 1, AOEDamageOnMove = 5 WHERE Type = 'PROMOTION_SIKH_SHOES';
UPDATE UnitPromotions SET AOEDamageOnKill = 10 WHERE Type = 'PROMOTION_SIKH_MARTIAL_ART';
UPDATE UnitPromotions SET ExperiencePercent = 25, VisibilityChange = 1 WHERE Type = 'PROMOTION_SIKH_TURBAN';
UPDATE UnitPromotions SET NearbyEnemyDamage = 5 WHERE Type = 'PROMOTION_SCYTHIAN_BARRAGE';

UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH' WHERE Type = 'PROMOTION_SIKH_SWORD';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH_SWORD' WHERE Type = 'PROMOTION_SIKH_KNIFE';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH_KNIFE' WHERE Type = 'PROMOTION_SIKH_DISC';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH_DISC' WHERE Type = 'PROMOTION_SIKH_DAGGER';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH_DISC' WHERE Type = 'PROMOTION_SIKH_TRIDENT';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH_KNIFE' WHERE Type = 'PROMOTION_SIKH_BOW';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH_BOW' WHERE Type = 'PROMOTION_SIKH_MUSKET';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH' WHERE Type = 'PROMOTION_SIKH_SHIELD';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH_SHIELD' WHERE Type = 'PROMOTION_SIKH_CHAINMAIL';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH' WHERE Type = 'PROMOTION_SIKH_ROBE';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH_ROBE' WHERE Type = 'PROMOTION_SIKH_SHOES';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH_SHOES' WHERE Type = 'PROMOTION_SIKH_MARTIAL_ART';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH_ROBE' WHERE Type = 'PROMOTION_SIKH_TURBAN';
UPDATE UnitPromotions SET PromotionPrereqOr1  = 'PROMOTION_SIKH_TURBAN' WHERE Type = 'PROMOTION_SIKH_BRACELET';

UPDATE UnitPromotions SET TechPrereq = 'TECH_MACHINERY' WHERE Type = 'PROMOTION_SIKH_TURBAN';
UPDATE UnitPromotions SET TechPrereq = 'TECH_GUNPOWDER' WHERE Type = 'PROMOTION_SIKH_CHAINMAIL';
UPDATE UnitPromotions SET TechPrereq = 'TECH_CHEMISTRY' WHERE Type = 'PROMOTION_SIKH_KNIFE';
UPDATE UnitPromotions SET TechPrereq = 'TECH_METALLURGY' WHERE Type = 'PROMOTION_SIKH_DISC';
UPDATE UnitPromotions SET TechPrereq = 'TECH_METALLURGY' WHERE Type = 'PROMOTION_SIKH_SHOES';
UPDATE UnitPromotions SET TechPrereq = 'TECH_RIFLING' WHERE Type = 'PROMOTION_SIKH_BOW';
UPDATE UnitPromotions SET TechPrereq = 'TECH_DYNAMITE' WHERE Type = 'PROMOTION_SIKH_TRIDENT';
UPDATE UnitPromotions SET TechPrereq = 'TECH_DYNAMITE' WHERE Type = 'PROMOTION_SIKH_MUSKET';
UPDATE UnitPromotions SET TechPrereq = 'TECH_MILITARY_SCIENCE' WHERE Type = 'PROMOTION_SIKH_MARTIAL_ART';
UPDATE UnitPromotions SET TechPrereq = 'TECH_REPLACEABLE_PARTS' WHERE Type = 'PROMOTION_SIKH_DAGGER';
UPDATE UnitPromotions SET TechPrereq = 'TECH_BALLISTICS' WHERE Type = 'PROMOTION_SIKH_BRACELET';

UPDATE UnitPromotions SET OrderPriority = 50, FlagPromoOrder = 50 WHERE Type IN (
	'PROMOTION_SIKH',
	'PROMOTION_SIKH_SWORD',
	'PROMOTION_SIKH_KNIFE',
	'PROMOTION_SIKH_DISC',
	'PROMOTION_SIKH_TRIDENT',
	'PROMOTION_SIKH_DAGGER',
	'PROMOTION_SIKH_BOW',
	'PROMOTION_SIKH_MUSKET',
	'PROMOTION_SIKH_SHIELD',
	'PROMOTION_SIKH_CHAINMAIL',
	'PROMOTION_SIKH_ROBE',
	'PROMOTION_SIKH_SHOES',
	'PROMOTION_SIKH_TURBAN',
	'PROMOTION_SIKH_MARTIAL_ART',
	'PROMOTION_SIKH_BRACELET',
	'PROMOTION_GUARDIA_SVIZZERA',
	'PROMOTION_KATZBALGER',
	'PROMOTION_SCYTHIAN_BARRAGE'
);

UPDATE UnitPromotions SET OrderPriority = 110, FlagPromoOrder = 110 WHERE Type IN (
	'PROMOTION_CLERMONT',
	'PROMOTION_CLERMONT1',
	'PROMOTION_CLERMONT2',
	'PROMOTION_CLERMONT3',
	'PROMOTION_CLERMONT4',
	'PROMOTION_CLERMONT5',
	'PROMOTION_CLERMONT6',
	'PROMOTION_CLERMONT7'
);

UPDATE UnitPromotions SET OrderPriority = 180, FlagPromoOrder = 180 WHERE Type IN (
	'PROMOTION_AMBRACIA',
	'PROMOTION_ANTANANARIVO',
	'PROMOTION_AUCKLAND',
	'PROMOTION_BELGRADE',
	'PROMOTION_BRUSSELS',
	'PROMOTION_DAKKAR',
	'PROMOTION_DODOMA',
	'PROMOTION_FAYA',
	'PROMOTION_HANOI',
	'PROMOTION_HANUABADA',
	'PROMOTION_IFE',
	'PROMOTION_ISKANWAYA',
	'PROMOTION_KABUL',
	'PROMOTION_KARASJOHKA',
	'PROMOTION_KARYES',
	'PROMOTION_LACONIA',
	'PROMOTION_LEVUKA',
	'PROMOTION_MBANZA_KONGO',
	'PROMOTION_MENDYARRUP',
	'PROMOTION_ODENSO',
	'PROMOTION_PELYM',
	'PROMOTION_POKROVKA',
	'PROMOTION_SIDON',
	'PROMOTION_SGANG_GWAAY',
	'PROMOTION_SUCEAVA',
	'PROMOTION_SURREY',
	'PROMOTION_YEREVAN'
);

INSERT INTO UnitPromotions_UnitCombats 
			(PromotionType, 					UnitCombatType)
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_RECON' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_GUN' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_FIGHTER' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_BOMBER' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_RECON' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_GUN' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_BELGRADE', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT  	'PROMOTION_BRUSSELS', 				'UNITCOMBAT_RECON' UNION ALL
SELECT  	'PROMOTION_BRUSSELS', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT  	'PROMOTION_BRUSSELS', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT  	'PROMOTION_BRUSSELS', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT  	'PROMOTION_BRUSSELS', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT  	'PROMOTION_BRUSSELS', 				'UNITCOMBAT_GUN' UNION ALL
SELECT  	'PROMOTION_BRUSSELS', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_BRUSSELS', 				'UNITCOMBAT_WORKER' UNION ALL
SELECT 		'PROMOTION_BRUSSELS', 				'UNITCOMBAT_CARAVAN' UNION ALL
SELECT 		'PROMOTION_BRUSSELS', 				'UNITCOMBAT_INQUISITOR' UNION ALL
SELECT 		'PROMOTION_BRUSSELS', 				'UNITCOMBAT_MISSIONARY' UNION ALL
SELECT 		'PROMOTION_BRUSSELS', 				'UNITCOMBAT_DIPLOMACY' UNION ALL
SELECT 		'PROMOTION_BRUSSELS', 				'UNITCOMBAT_SPECIAL_PEOPLE' UNION ALL
SELECT 		'PROMOTION_BRUSSELS', 				'UNITCOMBAT_ARCHAEOLOGIST' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_FIGHTER' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_BOMBER' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT2', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT2', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT3', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT3', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT4', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT4', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT5', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT5', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT6', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT6', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT7', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT7', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_FIGHTER' UNION ALL
SELECT 		'PROMOTION_DAKKAR', 				'UNITCOMBAT_BOMBER' UNION ALL
SELECT  	'PROMOTION_DODOMA', 				'UNITCOMBAT_WORKBOAT' UNION ALL
SELECT  	'PROMOTION_DODOMA', 				'UNITCOMBAT_CARGO' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_RECON' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_ARCHER' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_MOUNTED' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_MELEE' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_SIEGE' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_GUN' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_ARMOR' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_FIGHTER' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_BOMBER' UNION ALL
SELECT 		'PROMOTION_FAYA', 					'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_FAYA', 					'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_SETTLER' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_WORKER' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_CARAVAN' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_INQUISITOR' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_MISSIONARY' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_DIPLOMACY' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_SPECIAL_PEOPLE' UNION ALL
SELECT 		'PROMOTION_HANUABADA', 				'UNITCOMBAT_ARCHAEOLOGIST' UNION ALL
SELECT 		'PROMOTION_IFE', 					'UNITCOMBAT_DIPLOMACY' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_KARASJOHKA', 			'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_KARASJOHKA', 			'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_WORKER' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_SETTLER' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_CARAVAN' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_INQUISITOR' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_MISSIONARY' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_DIPLOMACY' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_SPECIAL_PEOPLE' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_ARCHAEOLOGIST' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_RECON' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_GUN' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_FIGHTER' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_BOMBER' UNION ALL
SELECT 		'PROMOTION_LEVUKA', 				'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_LEVUKA', 				'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO',			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_MENDYARRUP', 			'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_MENDYARRUP', 			'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_MENDYARRUP', 			'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_MENDYARRUP', 			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_MENDYARRUP', 			'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_MENDYARRUP', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_MENDYARRUP', 			'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_PELYM',					'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_SETTLER' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_WORKER' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_CARAVAN' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_INQUISITOR' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_MISSIONARY' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_DIPLOMACY' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_SPECIAL_PEOPLE' UNION ALL
SELECT 		'PROMOTION_PELYM', 					'UNITCOMBAT_ARCHAEOLOGIST' UNION ALL
SELECT 		'PROMOTION_POKROVKA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_SGANG_GWAAY', 			'UNITCOMBAT_CARGO' UNION ALL
SELECT 		'PROMOTION_SGANG_GWAAY', 			'UNITCOMBAT_WORKBOAT' UNION ALL
SELECT 		'PROMOTION_SGANG_GWAAY', 			'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_SGANG_GWAAY', 			'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_SGANG_GWAAY', 			'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_SGANG_GWAAY', 			'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_SUCEAVA', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_SUCEAVA', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_SUCEAVA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_SUCEAVA',				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SUCEAVA', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_SUCEAVA', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SUCEAVA', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT  	'PROMOTION_SURREY', 				'UNITCOMBAT_FIGHTER' UNION ALL
SELECT  	'PROMOTION_SURREY', 				'UNITCOMBAT_BOMBER' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_FIGHTER' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_BOMBER' UNION ALL
SELECT 		'PROMOTION_SIKH', 					'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_SWORD', 			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_KNIFE', 			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_DISC', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_TRIDENT', 			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_DAGGER', 			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_BOW', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_MUSKET', 			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_SHIELD', 			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_CHAINMAIL', 		'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_ROBE', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_SHOES', 			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_MARTIAL_ART', 		'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_TURBAN', 			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH_BRACELET', 			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIKH', 					'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_SWORD', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_KNIFE', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_DISC', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_TRIDENT', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_DAGGER', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_BOW', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_MUSKET', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_SHIELD', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_CHAINMAIL', 		'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_ROBE', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_SHOES', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_MARTIAL_ART', 		'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_TURBAN', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIKH_BRACELET', 			'UNITCOMBAT_GUN';

INSERT INTO UnitPromotions_PostCombatRandomPromotion
			(PromotionType, 		NewPromotion)
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT2' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT3' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT4' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT5' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT6' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT7';

INSERT INTO UnitPromotions_Features
			(PromotionType, 			FeatureType, 			DoubleMove, DoubleHeal,	Attack, Defense)
SELECT 		'PROMOTION_KARASJOHKA', 	'FEATURE_FOREST', 		0, 			0,			10, 	0 UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 	'FEATURE_FOREST', 		0, 			0,			15, 	15 UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 	'FEATURE_JUNGLE', 		0, 			0,			15, 	15 UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 	'FEATURE_MARSH', 		0, 			0,			15, 	15 UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 	'FEATURE_FLOOD_PLAINS', 0, 			0,			15, 	15 UNION ALL
SELECT 		'PROMOTION_BRUSSELS', 		'FEATURE_MARSH', 		1, 			0,			0, 		0;

INSERT INTO UnitPromotions_Terrains
			(PromotionType, 			TerrainType, 			DoubleMove, Attack, Defense)
SELECT 		'PROMOTION_PELYM', 			'TERRAIN_TUNDRA',		1, 			10, 	10 UNION ALL
SELECT 		'PROMOTION_PELYM', 			'TERRAIN_SNOW',			1, 			10, 	10;

INSERT INTO UnitPromotions_YieldFromKills
			(PromotionType, 			YieldType, 			Yield)
SELECT 		'PROMOTION_ANTANANARIVO', 	'YIELD_GOLD', 		100 UNION ALL
SELECT 		'PROMOTION_CLERMONT7', 		'YIELD_FAITH', 		75 UNION ALL
SELECT 		'PROMOTION_FAYA', 			'YIELD_SCIENCE', 	50 UNION ALL
SELECT 		'PROMOTION_SUCEAVA', 		'YIELD_FAITH', 		100 UNION ALL
SELECT 		'PROMOTION_YEREVAN', 		'YIELD_CULTURE', 	50 UNION ALL
SELECT 		'PROMOTION_SIKH', 			'YIELD_FAITH', 		50 UNION ALL
SELECT 		'PROMOTION_SIKH_BRACELET', 	'YIELD_FAITH', 		75;

INSERT INTO UnitPromotions_YieldFromBarbarianKills
			(PromotionType, 		YieldType, 			Yield)
SELECT 		'PROMOTION_LEVUKA', 	'YIELD_FOOD', 		50;

INSERT INTO UnitPromotions_Domains 
			(PromotionType, 		DomainType, 	Modifier)
SELECT 		'PROMOTION_SURREY', 	'DOMAIN_LAND', 	10 UNION ALL
SELECT 		'PROMOTION_SURREY', 	'DOMAIN_SEA', 	10;

INSERT INTO UnitPromotions_YieldModifiers 
			(PromotionType, 		YieldType, 			Yield)
SELECT 		'PROMOTION_AMBRACIA', 	'YIELD_PRODUCTION', 5;

INSERT INTO UnitPromotions_GarrisonYield
			(PromotionType, 		YieldType, 					Yield)
SELECT 		'PROMOTION_AUCKLAND', 	'YIELD_FOOD',				1 UNION ALL
SELECT 		'PROMOTION_AUCKLAND', 	'YIELD_GOLDEN_AGE_POINTS',	1;

---------------------------------------------------
-- Definitions - Buildings
---------------------------------------------------
INSERT INTO BuildingClasses 
			(Type, 									DefaultBuilding, 					Description)
SELECT 		'BUILDINGCLASS_LHASA', 					'BUILDING_LHASA', 					'TXT_KEY_BUILDING_LHASA' UNION ALL
SELECT 		'BUILDINGCLASS_KIEV', 					'BUILDING_KIEV', 					'TXT_KEY_BUILDING_KIEV' UNION ALL
SELECT 		'BUILDINGCLASS_MILAN', 					'BUILDING_MILAN', 					'TXT_KEY_BUILDING_MILAN' UNION ALL
SELECT 		'BUILDINGCLASS_VALLETTA', 				'BUILDING_VALLETTA', 				'TXT_KEY_BUILDING_VALLETTA' UNION ALL
SELECT 		'BUILDINGCLASS_VILNIUS', 				'BUILDING_VILNIUS', 				'TXT_KEY_BUILDING_VILNIUS' UNION ALL
SELECT 		'BUILDINGCLASS_ARMAGH1', 				'BUILDING_ARMAGH1', 				'TXT_KEY_BUILDING_ARMAGH1' UNION ALL
SELECT 		'BUILDINGCLASS_ARMAGH2', 				'BUILDING_ARMAGH2', 				'TXT_KEY_BUILDING_ARMAGH2' UNION ALL
SELECT 		'BUILDINGCLASS_ARMAGH3', 				'BUILDING_ARMAGH3', 				'TXT_KEY_BUILDING_ARMAGH3' UNION ALL
SELECT 		'BUILDINGCLASS_ARMAGH4', 				'BUILDING_ARMAGH4', 				'TXT_KEY_BUILDING_ARMAGH4' UNION ALL
SELECT 		'BUILDINGCLASS_JERUSALEM', 				'BUILDING_JERUSALEM', 				'TXT_KEY_BUILDING_JERUSALEM' UNION ALL
SELECT 		'BUILDINGCLASS_RISHIKESH', 				'BUILDING_RISHIKESH', 				'TXT_KEY_BUILDING_RISHIKESH' UNION ALL
SELECT 		'BUILDINGCLASS_OUIDAH', 				'BUILDING_OUIDAH',	 				'TXT_KEY_CITYSTATE_OUIDAH' UNION ALL
SELECT 		'BUILDINGCLASS_AL_TIRABIN', 			'BUILDING_AL_TIRABIN', 				'TXT_KEY_CITYSTATE_AL_TIRABIN' UNION ALL
SELECT 		'BUILDINGCLASS_ANANGULA', 				'BUILDING_ANANGULA', 				'TXT_KEY_CITYSTATE_ANANGULA' UNION ALL
SELECT 		'BUILDINGCLASS_ANDORRA', 				'BUILDING_ANDORRA', 				'TXT_KEY_CITYSTATE_ANDORRA' UNION ALL
SELECT 		'BUILDINGCLASS_ANDORRA_2', 				'BUILDING_ANDORRA_2', 				'TXT_KEY_CITYSTATE_ANDORRA' UNION ALL
SELECT 		'BUILDINGCLASS_ANTWERP', 				'BUILDING_ANTWERP',	 				'TXT_KEY_CITYSTATE_ANTWERP' UNION ALL
SELECT 		'BUILDINGCLASS_BEDULU', 				'BUILDING_BEDULU',	 				'TXT_KEY_CITYSTATE_BEDULU' UNION ALL
SELECT 		'BUILDINGCLASS_CANOSSA', 				'BUILDING_CANOSSA', 				'TXT_KEY_CITYSTATE_CANOSSA' UNION ALL
SELECT 		'BUILDINGCLASS_CAPE_TOWN', 				'BUILDING_CAPE_TOWN', 				'TXT_KEY_CITYSTATE_CAPE_TOWN' UNION ALL
SELECT 		'BUILDINGCLASS_CHEVAK', 				'BUILDING_CHEVAK', 					'TXT_KEY_CITYSTATE_CHEVAK' UNION ALL
SELECT 		'BUILDINGCLASS_DODOMA', 				'BUILDING_DODOMA', 					'TXT_KEY_CITYSTATE_DODOMA' UNION ALL
SELECT 		'BUILDINGCLASS_GENEVA', 				'BUILDING_GENEVA', 					'TXT_KEY_CITYSTATE_GENEVA' UNION ALL
SELECT 		'BUILDINGCLASS_HONG_KONG', 				'BUILDING_HONG_KONG', 				'TXT_KEY_CITYSTATE_HONG_KONG' UNION ALL
SELECT 		'BUILDINGCLASS_IRUNEA', 				'BUILDING_IRUNEA', 					'TXT_KEY_CITYSTATE_IRUNEA' UNION ALL
SELECT 		'BUILDINGCLASS_JETARKTE', 				'BUILDING_JETARKTE', 				'TXT_KEY_CITYSTATE_JETARKTE' UNION ALL
SELECT 		'BUILDINGCLASS_KABUL', 					'BUILDING_KABUL', 					'TXT_KEY_CITYSTATE_KABUL' UNION ALL
SELECT 		'BUILDINGCLASS_KARYES', 				'BUILDING_KARYES', 					'TXT_KEY_CITYSTATE_KARYES' UNION ALL
SELECT 		'BUILDINGCLASS_KARYES_2', 				'BUILDING_KARYES_2', 				'TXT_KEY_CITYSTATE_KARYES' UNION ALL
SELECT 		'BUILDINGCLASS_KATENDE', 				'BUILDING_KATENDE', 				'TXT_KEY_CITYSTATE_KATENDE' UNION ALL
SELECT 		'BUILDINGCLASS_KATENDE_2', 				'BUILDING_KATENDE_2', 				'TXT_KEY_CITYSTATE_KATENDE_2' UNION ALL
SELECT 		'BUILDINGCLASS_KATHMANDU', 				'BUILDING_KATHMANDU', 				'TXT_KEY_CITYSTATE_KATHMANDU' UNION ALL
SELECT 		'BUILDINGCLASS_KIEV_2', 				'BUILDING_KIEV_2', 					'TXT_KEY_CITYSTATE_KIEV' UNION ALL
SELECT 		'BUILDINGCLASS_KIGALI', 				'BUILDING_KIGALI', 					'TXT_KEY_CITYSTATE_KIGALI' UNION ALL
SELECT 		'BUILDINGCLASS_KUALA_LUMPUR', 			'BUILDING_KUALA_LUMPUR', 			'TXT_KEY_CITYSTATE_KUALA_LUMPUR' UNION ALL
SELECT 		'BUILDINGCLASS_LEVUKA', 				'BUILDING_LEVUKA',	 				'TXT_KEY_CITYSTATE_LEVUKA' UNION ALL
SELECT 		'BUILDINGCLASS_LHASA_2', 				'BUILDING_LHASA_2', 				'TXT_KEY_CITYSTATE_LHASA' UNION ALL
SELECT 		'BUILDINGCLASS_LONGYAN', 				'BUILDING_LONGYAN',	 				'TXT_KEY_CITYSTATE_LONGYAN' UNION ALL
SELECT 		'BUILDINGCLASS_MANAGUA', 				'BUILDING_MANAGUA',	 				'TXT_KEY_CITYSTATE_MANAGUA' UNION ALL
SELECT 		'BUILDINGCLASS_MBABANE', 				'BUILDING_MBABANE',	 				'TXT_KEY_CITYSTATE_MBABANE' UNION ALL
SELECT 		'BUILDINGCLASS_MELBOURNE', 				'BUILDING_MELBOURNE',	 			'TXT_KEY_CITYSTATE_MELBOURNE' UNION ALL
SELECT 		'BUILDINGCLASS_MILAN_2', 				'BUILDING_MILAN_2', 				'TXT_KEY_CITYSTATE_MILAN' UNION ALL
SELECT 		'BUILDINGCLASS_MUTITJULU', 				'BUILDING_MUTITJULU',	 			'TXT_KEY_CITYSTATE_MUTITJULU' UNION ALL
SELECT 		'BUILDINGCLASS_NAN_MADOL', 				'BUILDING_NAN_MADOL',	 			'TXT_KEY_CITYSTATE_NAN_MADOL' UNION ALL
SELECT 		'BUILDINGCLASS_OC_EO', 					'BUILDING_OC_EO', 					'TXT_KEY_CITYSTATE_OC_EO' UNION ALL
SELECT 		'BUILDINGCLASS_OC_EO_2', 				'BUILDING_OC_EO_2', 				'TXT_KEY_CITYSTATE_OC_EO' UNION ALL
SELECT 		'BUILDINGCLASS_OC_EO_3', 				'BUILDING_OC_EO_3', 				'TXT_KEY_CITYSTATE_OC_EO' UNION ALL
SELECT 		'BUILDINGCLASS_PALMYRA', 				'BUILDING_PALMYRA',	 				'TXT_KEY_CITYSTATE_PALMYRA' UNION ALL
SELECT 		'BUILDINGCLASS_PALMYRA_2', 				'BUILDING_PALMYRA_2',	 			'TXT_KEY_CITYSTATE_PALMYRA' UNION ALL
SELECT 		'BUILDINGCLASS_PANAMA_CITY', 			'BUILDING_PANAMA_CITY',	 			'TXT_KEY_CITYSTATE_PANAMA_CITY' UNION ALL
SELECT 		'BUILDINGCLASS_PELYM', 					'BUILDING_PELYM',	 				'TXT_KEY_CITYSTATE_PELYM' UNION ALL
--SELECT 		'BUILDINGCLASS_PHANOTEUS', 				'BUILDING_PHANOTEUS',	 			'TXT_KEY_CITYSTATE_PHANOTEUS' UNION ALL
SELECT 		'BUILDINGCLASS_QUELIMANE', 				'BUILDING_QUELIMANE', 				'TXT_KEY_CITYSTATE_QUELIMANE' UNION ALL
SELECT 		'BUILDINGCLASS_RAGUSA', 				'BUILDING_RAGUSA', 					'TXT_KEY_CITYSTATE_RAGUSA' UNION ALL
SELECT 		'BUILDINGCLASS_RAGUSA_2', 				'BUILDING_RAGUSA_2', 				'TXT_KEY_CITYSTATE_RAGUSA' UNION ALL
SELECT 		'BUILDINGCLASS_RIGA', 					'BUILDING_RIGA', 					'TXT_KEY_CITYSTATE_RIGA' UNION ALL
SELECT 		'BUILDINGCLASS_RISHIKESH_2', 			'BUILDING_RISHIKESH_2',	 			'TXT_KEY_CITYSTATE_RISHIKESH' UNION ALL
SELECT 		'BUILDINGCLASS_SADDARVAZEH', 			'BUILDING_SADDARVAZEH', 			'TXT_KEY_CITYSTATE_SADDARVAZEH' UNION ALL
SELECT 		'BUILDINGCLASS_SAMARKAND', 				'BUILDING_SAMARKAND', 				'TXT_KEY_CITYSTATE_SAMARKAND' UNION ALL
SELECT 		'BUILDINGCLASS_SANAA', 					'BUILDING_SANAA', 					'TXT_KEY_CITYSTATE_SANAA' UNION ALL
SELECT 		'BUILDINGCLASS_SARNATH', 				'BUILDING_SARNATH', 				'TXT_KEY_CITYSTATE_SARNATH' UNION ALL
SELECT 		'BUILDINGCLASS_SARNATH_2', 				'BUILDING_SARNATH_2', 				'TXT_KEY_CITYSTATE_SARNATH_2' UNION ALL
SELECT 		'BUILDINGCLASS_SOFIA', 					'BUILDING_SOFIA', 					'TXT_KEY_CITYSTATE_SOFIA' UNION ALL
SELECT 		'BUILDINGCLASS_TAIWAN', 				'BUILDING_TAIWAN', 					'TXT_KEY_CITYSTATE_TAIWAN' UNION ALL
SELECT 		'BUILDINGCLASS_THIMPHU', 				'BUILDING_THIMPHU', 				'TXT_KEY_CITYSTATE_THIMPHU' UNION ALL
SELECT 		'BUILDINGCLASS_THIMPHU_2', 				'BUILDING_THIMPHU_2', 				'TXT_KEY_CITYSTATE_THIMPHU' UNION ALL
SELECT 		'BUILDINGCLASS_VANCOUVER', 				'BUILDING_VANCOUVER',	 			'TXT_KEY_CITYSTATE_VANCOUVER' UNION ALL
SELECT 		'BUILDINGCLASS_VATICAN_CITY', 			'BUILDING_VATICAN_CITY',	 		'TXT_KEY_CITYSTATE_VATICAN_CITY' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_HORSE', 		'BUILDING_WELLINGTON_HORSE',	 	'TXT_KEY_CITYSTATE_WELLINGTON_HORSE' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_IRON', 		'BUILDING_WELLINGTON_IRON',	 		'TXT_KEY_CITYSTATE_WELLINGTON_IRON' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_COAL', 		'BUILDING_WELLINGTON_COAL',	 		'TXT_KEY_CITYSTATE_WELLINGTON_COAL' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_OIL', 		'BUILDING_WELLINGTON_OIL',	 		'TXT_KEY_CITYSTATE_WELLINGTON_OIL' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_ALUMINUM', 	'BUILDING_WELLINGTON_ALUMINUM',	 	'TXT_KEY_CITYSTATE_WELLINGTON_ALUMINUM' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_URANIUM', 	'BUILDING_WELLINGTON_URANIUM',	 	'TXT_KEY_CITYSTATE_WELLINGTON_URANIUM' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_PAPER', 		'BUILDING_WELLINGTON_PAPER',	 	'TXT_KEY_CITYSTATE_WELLINGTON_PAPER' UNION ALL
SELECT 		'BUILDINGCLASS_WITTENBERG', 			'BUILDING_WITTENBERG',	 			'TXT_KEY_CITYSTATE_WITTENBERG' UNION ALL
SELECT 		'BUILDINGCLASS_WOOTEI_NIICIE', 			'BUILDING_WOOTEI_NIICIE',	 		'TXT_KEY_CITYSTATE_WOOTEI_NIICIE' UNION ALL
SELECT 		'BUILDINGCLASS_WOOTEI_NIICIE_2', 		'BUILDING_WOOTEI_NIICIE_2',	 		'TXT_KEY_CITYSTATE_WOOTEI_NIICIE' UNION ALL
SELECT 		'BUILDINGCLASS_CS_STRENGTH_FRIENDLY', 	'BUILDING_CS_STRENGTH_FRIENDLY', 	'TXT_KEY_BUILDING_CS_STRENGTH_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_CS_STRENGTH_NEUTRAL', 	'BUILDING_CS_STRENGTH_NEUTRAL', 	'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_CS_STRENGTH_HOSTILE', 	'BUILDING_CS_STRENGTH_HOSTILE', 	'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE' UNION ALL
SELECT 		'BUILDINGCLASS_CS_RELIGION_FRIENDLY', 	'BUILDING_CS_RELIGION_FRIENDLY', 	'TXT_KEY_BUILDING_CS_RELIGION_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_CS_RELIGION_NEUTRAL', 	'BUILDING_CS_RELIGION_NEUTRAL', 	'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_CS_RELIGION_HOSTILE', 	'BUILDING_CS_RELIGION_HOSTILE', 	'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE' UNION ALL
SELECT 		'BUILDINGCLASS_CS_RELIGION_IRRATIONAL', 'BUILDING_CS_RELIGION_IRRATIONAL', 	'TXT_KEY_BUILDING_CS_RELIGION_IRRATIONAL' UNION ALL
SELECT 		'BUILDINGCLASS_MONOPOLY_MANUSCRIPTS', 	'BUILDING_MONOPOLY_MANUSCRIPTS', 	'TXT_KEY_BUILDING_MONOPOLY_MANUSCRIPTS' UNION ALL
SELECT 		'BUILDINGCLASS_MONOPOLY_COINS', 		'BUILDING_MONOPOLY_COINS', 			'TXT_KEY_BUILDING_MONOPOLY_COINS';

UPDATE BuildingClasses SET MaxGlobalInstances = 1 WHERE Type = 'BUILDINGCLASS_LHASA';
UPDATE BuildingClasses SET MaxPlayerInstances = 3 WHERE Type = 'BUILDINGCLASS_KIEV';
UPDATE BuildingClasses SET MaxPlayerInstances = 3 WHERE Type = 'BUILDINGCLASS_MILAN';
UPDATE BuildingClasses SET MaxPlayerInstances = 3 WHERE Type = 'BUILDINGCLASS_VILNIUS';

INSERT INTO Audio_Sounds 
			(SoundID, 			Filename, 		LoadType)
SELECT 		'SND_WONDER_LHASA', 'PotalaPalace', 'DynamicResident';

INSERT INTo Audio_2DSounds 
			(ScriptID, 				SoundID, 			SoundType, 				MinVolume, 	MaxVolume, 	IsMusic, 	TaperSoundtrackVolume)
SELECT 		'AS2D_WONDER_LHASA', 	'SND_WONDER_LHASA', 'GAME_MUSIC_STINGS', 	85, 		85, 		1, 			'0.0';

INSERT INTO Buildings 
			(Type, 								BuildingClass, 							Cost, 	GoldMaintenance, 	PrereqTech, Description, 								Help, 											MinAreaSize, 	NukeImmune, ConquestProb, 	NeverCapture, 	HurryCostModifier, 	IconAtlas, 						PortraitIndex, 	IsDummy,	GreatWorkCount)
SELECT 		'BUILDING_LHASA', 					'BUILDINGCLASS_LHASA', 					650, 	0, 					NULL, 		'TXT_KEY_BUILDING_LHASA', 					'TXT_KEY_BUILDING_LHASA_HELP', 					-1, 			1, 			100, 			0, 				-5, 				'UCS_BUILDING_ATLAS', 			0, 				0,			0 UNION ALL
SELECT 		'BUILDING_KIEV', 					'BUILDINGCLASS_KIEV', 					350, 	2, 					NULL, 		'TXT_KEY_BUILDING_KIEV', 					'TXT_KEY_BUILDING_KIEV_HELP', 					-1, 			1, 			80, 			0, 				-20, 				'UCS_BUILDING_ATLAS', 			5, 				0,			0 UNION ALL
SELECT 		'BUILDING_MILAN', 					'BUILDINGCLASS_MILAN', 					350, 	2, 					NULL, 		'TXT_KEY_BUILDING_MILAN', 					'TXT_KEY_BUILDING_MILAN_HELP', 					-1, 			1, 			80, 			0, 				-20, 				'UCS_BUILDING_ATLAS', 			4, 				0,			0 UNION ALL
SELECT 		'BUILDING_VILNIUS', 				'BUILDINGCLASS_VILNIUS', 				350, 	2, 					NULL, 		'TXT_KEY_BUILDING_VILNIUS', 				'TXT_KEY_BUILDING_VILNIUS_HELP', 				-1, 			1, 			80, 			0, 				-20, 				'UCS_BUILDING_ATLAS', 			3, 				0,			0 UNION ALL
SELECT 		'BUILDING_VALLETTA', 				'BUILDINGCLASS_VALLETTA', 				250, 	1, 					NULL, 		'TXT_KEY_BUILDING_VALLETTA', 				'TXT_KEY_BUILDING_VALLETTA_HELP', 				-1, 			1, 			80, 			0, 				-20, 				'UCS_BUILDING_ATLAS', 			2, 				0,			0 UNION ALL
SELECT 		'BUILDING_ARMAGH1', 				'BUILDINGCLASS_ARMAGH1', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ARMAGH1', 				'TXT_KEY_BUILDING_ARMAGH1_HELP', 				-1, 			1, 			100, 			0, 				-20, 				'UCS_BUILDING_ATLAS', 			8, 				0,			0 UNION ALL
SELECT 		'BUILDING_ARMAGH2', 				'BUILDINGCLASS_ARMAGH2', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ARMAGH2', 				'TXT_KEY_BUILDING_ARMAGH2_HELP', 				-1, 			1, 			100, 			0, 				-20, 				'UCS_BUILDING_ATLAS', 			9, 				0,			0 UNION ALL
SELECT 		'BUILDING_ARMAGH3', 				'BUILDINGCLASS_ARMAGH3', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ARMAGH3', 				'TXT_KEY_BUILDING_ARMAGH3_HELP', 				-1, 			1, 			100, 			0, 				-20, 				'UCS_BUILDING_ATLAS', 			6, 				0,			0 UNION ALL
SELECT 		'BUILDING_ARMAGH4', 				'BUILDINGCLASS_ARMAGH4', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ARMAGH4', 				'TXT_KEY_BUILDING_ARMAGH4_HELP', 				-1, 			1, 			100, 			0, 				-20, 				'UCS_BUILDING_ATLAS', 			7, 				0,			0 UNION ALL
SELECT 		'BUILDING_JERUSALEM', 				'BUILDINGCLASS_JERUSALEM', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_JERUSALEM', 				'TXT_KEY_BUILDING_JERUSALEM_HELP', 				-1, 			1, 			100, 			0, 				-20, 				'UCS_BUILDING_ATLAS', 			10, 			0,			0 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 				'BUILDINGCLASS_RISHIKESH', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_RISHIKESH', 				'TXT_KEY_BUILDING_RISHIKESH_HELP', 				-1, 			1, 			100, 			0, 				-20, 				'UCS_BUILDING_ATLAS', 			11, 			0,			0 UNION ALL
SELECT 		'BUILDING_OUIDAH', 					'BUILDINGCLASS_OUIDAH', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_OUIDAH', 				'TXT_KEY_CSTRAIT_MINOR_CIV_OUIDAH', 			-1, 			1, 			100, 			0, 				-20, 				'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_AL_TIRABIN', 				'BUILDINGCLASS_AL_TIRABIN', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_AL_TIRABIN', 			'TXT_KEY_CSTRAIT_MINOR_CIV_AL_TIRABIN', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_ANANGULA', 				'BUILDINGCLASS_ANANGULA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_ANANGULA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_ANANGULA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_ANDORRA', 				'BUILDINGCLASS_ANDORRA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_ANDORRA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_ANDORRA_2', 				'BUILDINGCLASS_ANDORRA_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_ANDORRA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_ANTWERP', 				'BUILDINGCLASS_ANTWERP', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_ANTWERP', 				'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_BEDULU', 					'BUILDINGCLASS_BEDULU', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_BEDULU', 				'TXT_KEY_CSTRAIT_MINOR_CIV_BEDULU', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CANOSSA', 				'BUILDINGCLASS_CANOSSA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_CANOSSA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CAPE_TOWN', 				'BUILDINGCLASS_CAPE_TOWN', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_CAPE_TOWN', 				'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CHEVAK', 					'BUILDINGCLASS_CHEVAK', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_CHEVAK', 				'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_DODOMA', 					'BUILDINGCLASS_DODOMA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_DODOMA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_GENEVA', 					'BUILDINGCLASS_GENEVA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_GENEVA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_HONG_KONG', 				'BUILDINGCLASS_HONG_KONG', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_HONG_KONG', 				'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_IRUNEA', 					'BUILDINGCLASS_IRUNEA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_IRUNEA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_IRUNEA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_JETARKTE', 				'BUILDINGCLASS_JETARKTE', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_JETARKTE', 				'TXT_KEY_CSTRAIT_MINOR_CIV_JETARKTE', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KABUL', 					'BUILDINGCLASS_KABUL', 					-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KABUL', 					'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KARYES', 					'BUILDINGCLASS_KARYES', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KARYES', 				'TXT_KEY_CSTRAIT_MINOR_CIV_KARYES', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KARYES_2', 				'BUILDINGCLASS_KARYES_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KARYES', 				'TXT_KEY_CSTRAIT_MINOR_CIV_KARYES', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KATENDE', 				'BUILDINGCLASS_KATENDE', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KATENDE', 				'TXT_KEY_CSTRAIT_MINOR_CIV_KATENDE', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KATENDE_2', 				'BUILDINGCLASS_KATENDE_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KATENDE', 				'TXT_KEY_CSTRAIT_MINOR_CIV_KATENDE', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KATHMANDU', 				'BUILDINGCLASS_KATHMANDU', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KATHMANDU', 				'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KIEV_2', 					'BUILDINGCLASS_KIEV_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KIEV', 					'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KIGALI', 					'BUILDINGCLASS_KIGALI', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KIGALI', 				'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KUALA_LUMPUR', 			'BUILDINGCLASS_KUALA_LUMPUR', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KUALA_LUMPUR', 			'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_LEVUKA', 					'BUILDINGCLASS_LEVUKA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_LEVUKA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_LHASA_2', 				'BUILDINGCLASS_LHASA_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_LHASA', 					'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_LONGYAN', 				'BUILDINGCLASS_LONGYAN', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_LONGYAN', 				'TXT_KEY_CSTRAIT_MINOR_CIV_LONGYAN', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MANAGUA', 				'BUILDINGCLASS_MANAGUA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_MANAGUA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_MANAGUA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MBABANE', 				'BUILDINGCLASS_MBABANE', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_MBABANE', 				'TXT_KEY_CSTRAIT_MINOR_CIV_MBABANE', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MELBOURNE', 				'BUILDINGCLASS_MELBOURNE', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_MELBOURNE', 				'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MILAN_2', 				'BUILDINGCLASS_MILAN_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_MILAN', 					'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MUTITJULU', 				'BUILDINGCLASS_MUTITJULU', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_MUTITJULU', 				'TXT_KEY_CSTRAIT_MINOR_CIV_MUTITJULU', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_NAN_MADOL', 				'BUILDINGCLASS_NAN_MADOL', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_NAN_MADOL', 				'TXT_KEY_CSTRAIT_MINOR_CIV_NAN_MADOL', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_OC_EO', 					'BUILDINGCLASS_OC_EO', 					-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_OC_EO', 					'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_OC_EO_2', 				'BUILDINGCLASS_OC_EO_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_OC_EO', 					'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_OC_EO_3', 				'BUILDINGCLASS_OC_EO_3', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_OC_EO', 					'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_PALMYRA', 				'BUILDINGCLASS_PALMYRA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_PALMYRA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_PALMYRA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_PALMYRA_2', 				'BUILDINGCLASS_PALMYRA_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_PALMYRA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_PALMYRA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_PANAMA_CITY', 			'BUILDINGCLASS_PANAMA_CITY', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_PANAMA_CITY', 			'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_PELYM', 					'BUILDINGCLASS_PELYM', 					-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_PELYM', 					'TXT_KEY_CSTRAIT_MINOR_CIV_PELYM', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
--SELECT 		'BUILDING_PHANOTEUS', 				'BUILDINGCLASS_PHANOTEUS', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_PHANOTEUS', 				'TXT_KEY_CSTRAIT_MINOR_CIV_PHANOTEUS', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_QUELIMANE', 				'BUILDINGCLASS_QUELIMANE', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_QUELIMANE', 				'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_RAGUSA', 					'BUILDINGCLASS_RAGUSA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_RAGUSA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_RAGUSA_2', 				'BUILDINGCLASS_RAGUSA_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_RAGUSA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_RIGA', 					'BUILDINGCLASS_RIGA', 					-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_RIGA', 					'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_RISHIKESH_2', 			'BUILDINGCLASS_RISHIKESH_2', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_RISHIKESH', 				'TXT_KEY_CSTRAIT_MINOR_CIV_RISHIKESH', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_SADDARVAZEH', 			'BUILDINGCLASS_SADDARVAZEH', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_SADDARVAZEH', 			'TXT_KEY_CSTRAIT_MINOR_CIV_SADDARVAZEH', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_SAMARKAND', 				'BUILDINGCLASS_SAMARKAND', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_SAMARKAND', 				'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_SANAA', 					'BUILDINGCLASS_SANAA', 					-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_SANAA', 					'TXT_KEY_CSTRAIT_MINOR_CIV_SANAA', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_SARNATH', 				'BUILDINGCLASS_SARNATH', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_SARNATH', 				'TXT_KEY_CSTRAIT_MINOR_CIV_SARNATH', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_SARNATH_2', 				'BUILDINGCLASS_SARNATH_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_SARNATH', 				'TXT_KEY_CSTRAIT_MINOR_CIV_SARNATH', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_SOFIA', 					'BUILDINGCLASS_SOFIA', 					-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_SOFIA', 					'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_TAIWAN', 					'BUILDINGCLASS_TAIWAN', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_TAIWAN', 				'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_THIMPHU', 				'BUILDINGCLASS_THIMPHU', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_THIMPHU', 				'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_THIMPHU_2', 				'BUILDINGCLASS_THIMPHU_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_THIMPHU', 				'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_VANCOUVER', 				'BUILDINGCLASS_VANCOUVER', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_VANCOUVER', 				'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_VATICAN_CITY', 			'BUILDINGCLASS_VATICAN_CITY', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_VATICAN_CITY', 			'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_HORSE', 		'BUILDINGCLASS_WELLINGTON_HORSE', 		-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_IRON', 		'BUILDINGCLASS_WELLINGTON_IRON', 		-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_COAL', 		'BUILDINGCLASS_WELLINGTON_COAL', 		-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_OIL', 			'BUILDINGCLASS_WELLINGTON_OIL', 		-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_ALUMINUM', 	'BUILDINGCLASS_WELLINGTON_ALUMINUM', 	-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_URANIUM', 		'BUILDINGCLASS_WELLINGTON_URANIUM', 	-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_PAPER', 		'BUILDINGCLASS_WELLINGTON_PAPER', 		-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WITTENBERG', 				'BUILDINGCLASS_WITTENBERG', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WITTENBERG', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WOOTEI_NIICIE', 			'BUILDINGCLASS_WOOTEI_NIICIE', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WOOTEI_NIICIE', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WOOTEI_NIICIE', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WOOTEI_NIICIE_2', 		'BUILDINGCLASS_WOOTEI_NIICIE_2', 		-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WOOTEI_NIICIE', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WOOTEI_NIICIE', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CS_STRENGTH_FRIENDLY', 	'BUILDINGCLASS_CS_STRENGTH_FRIENDLY', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_STRENGTH_FRIENDLY', 	'TXT_KEY_BUILDING_CS_STRENGTH_FRIENDLY_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CS_STRENGTH_NEUTRAL', 	'BUILDINGCLASS_CS_STRENGTH_NEUTRAL', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL', 	'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CS_STRENGTH_HOSTILE', 	'BUILDINGCLASS_CS_STRENGTH_HOSTILE', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE', 	'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CS_RELIGION_FRIENDLY', 	'BUILDINGCLASS_CS_RELIGION_FRIENDLY', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_RELIGION_FRIENDLY', 	'TXT_KEY_BUILDING_CS_RELIGION_FRIENDLY_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CS_RELIGION_NEUTRAL', 	'BUILDINGCLASS_CS_RELIGION_NEUTRAL', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL', 	'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CS_RELIGION_HOSTILE', 	'BUILDINGCLASS_CS_RELIGION_HOSTILE', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE', 	'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CS_RELIGION_IRRATIONAL', 	'BUILDINGCLASS_CS_RELIGION_IRRATIONAL', -1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_RELIGION_IRRATIONAL', 	'TXT_KEY_BUILDING_CS_RELIGION_IRRATIONAL_HELP', -1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MONOPOLY_MANUSCRIPTS', 	'BUILDINGCLASS_MONOPOLY_MANUSCRIPTS', 	-1, 	0, 					NULL, 		'TXT_KEY_RESOURCE_MANUSCRIPTS', 			'TXT_KEY_RESOURCE_MANUSCRIPTS_MONOPOLY', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MONOPOLY_COINS', 			'BUILDINGCLASS_MONOPOLY_COINS', 		-1, 	0, 					NULL, 		'TXT_KEY_RESOURCE_COINS', 					'TXT_KEY_RESOURCE_COINS_MONOPOLY', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1;

UPDATE Buildings SET FaithCost = 250, WLTKDTurns = 10, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', CultureMedianModifier = -10, MutuallyExclusiveGroup = 113 WHERE Type = 'BUILDING_ARMAGH1';
UPDATE Buildings SET FaithCost = 250, WLTKDTurns = 10, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', ScienceMedianModifier = -10, MutuallyExclusiveGroup = 113 WHERE Type = 'BUILDING_ARMAGH2';
UPDATE Buildings SET FaithCost = 250, WLTKDTurns = 10, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', GoldMedianModifier = -10, MutuallyExclusiveGroup = 113 WHERE Type = 'BUILDING_ARMAGH3';
UPDATE Buildings SET FaithCost = 250, WLTKDTurns = 10, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', BasicNeedsMedianModifier = -10, MutuallyExclusiveGroup = 113 WHERE Type = 'BUILDING_ARMAGH4';
UPDATE Buildings SET NoUnhappfromXSpecialists = 1, SpecialistType = 'SPECIALIST_ARTIST', GreatPeopleRateChange = 2, SpecialistCount = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 1, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_MILAN' WHERE Type = 'BUILDING_MILAN';
UPDATE Buildings SET NoUnhappfromXSpecialists = 1, SpecialistType = 'SPECIALIST_MUSICIAN', GreatPeopleRateChange = 2, SpecialistCount = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC', GreatWorkCount = 1, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_KIEV' WHERE Type = 'BUILDING_KIEV';
UPDATE Buildings SET NoUnhappfromXSpecialists = 1, SpecialistType = 'SPECIALIST_WRITER', GreatPeopleRateChange = 2, SpecialistCount = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 1, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_VILNIUS' WHERE Type = 'BUILDING_VILNIUS';
UPDATE Buildings SET ReligiousPressureModifier = 100 WHERE Type = 'BUILDING_JERUSALEM';
UPDATE Buildings SET WonderSplashImage = 'UCS_Potala_Palace_splash.dds', WonderSplashAudio = 'AS2D_WONDER_LHASA', WonderSplashAnchor = 'L,B', Quote = 'TXT_KEY_BUILDING_LHASA_QUOTE', SingleLeagueVotes = 1, PrereqTech = 'TECH_ARCHITECTURE', EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA' WHERE Type = 'BUILDING_LHASA';
UPDATE Buildings SET FaithCost = 200, ReligiousUnrestFlatReduction = 1, BoredomFlatReduction = 1, NoUnhappfromXSpecialists = 1,  EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_RISHIKESH' WHERE Type = 'BUILDING_RISHIKESH';
UPDATE Buildings SET ExtraCityHitPoints = 25, Water = 1, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA' WHERE Type = 'BUILDING_VALLETTA';

UPDATE Buildings SET NumTradeRouteBonus = 1 WHERE Type = 'BUILDING_AL_TIRABIN';
UPDATE Buildings SET TradeRouteSeaDistanceModifier = 10 WHERE Type = 'BUILDING_ANANGULA';
UPDATE Buildings SET CultureMedianModifier = -10 WHERE Type = 'BUILDING_ANDORRA_2';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_CIVIL_SERVANT', GreatPeopleRateChange = 1 WHERE Type = 'BUILDING_CANOSSA';
UPDATE Buildings SET TradeRouteSeaDistanceModifier = 10, TradeRouteLandDistanceModifier = 10 WHERE Type = 'BUILDING_CAPE_TOWN';
UPDATE Buildings SET BorderGrowthRateIncrease = 10, DistressFlatReduction = 1 WHERE Type = 'BUILDING_CHEVAK';
UPDATE Buildings SET TradeRouteTargetBonus = 1, TradeRouteRecipientBonus = 1 WHERE Type = 'BUILDING_DODOMA';
UPDATE Buildings SET GreatPeopleRateModifier = 3 WHERE Type = 'BUILDING_GENEVA';
UPDATE Buildings SET Airlift = 1 WHERE Type = 'BUILDING_JETARKTE';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_CIVIL_SERVANT', GreatPeopleRateChange = 1, ReligiousUnrestModifier = -10 WHERE Type = 'BUILDING_KARYES';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_WRITER', GreatPeopleRateChange = 1 WHERE Type = 'BUILDING_KATENDE';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_ARTIST', GreatPeopleRateChange = 1 WHERE Type = 'BUILDING_KATENDE_2';
UPDATE Buildings SET CitySupplyFlat = 1 WHERE Type = 'BUILDING_LONGYAN';
UPDATE Buildings SET SpySecurityModifier = 10 WHERE Type = 'BUILDING_MANAGUA';
UPDATE Buildings SET ExtraCityHitPoints = 10, Defense = 1000 WHERE Type = 'BUILDING_MBABANE';
UPDATE Buildings SET TradeRouteSeaDistanceModifier = 20 WHERE Type = 'BUILDING_OC_EO';
UPDATE Buildings SET Happiness = 1 WHERE Type = 'BUILDING_OC_EO_3';
UPDATE Buildings SET TradeRouteSeaDistanceModifier = 10, TradeRouteSeaGoldBonus = 100 WHERE Type = 'BUILDING_PANAMA_CITY';
UPDATE Buildings SET CitySupplyFlat = 2 WHERE Type = 'BUILDING_PELYM';
--UPDATE Buildings SET SpySecurityModifier = 10 WHERE Type = 'BUILDING_PHANOTEUS';
UPDATE Buildings SET CitySupplyFlat = 1 WHERE Type = 'BUILDING_RAGUSA_2';
UPDATE Buildings SET CityStateTradeRouteProductionModifier = 1 WHERE Type = 'BUILDING_RIGA';
UPDATE Buildings SET TradeRouteTargetBonus = 4, TradeRouteRecipientBonus = 4 WHERE Type = 'BUILDING_SAMARKAND';
UPDATE Buildings SET PolicyCostModifier = -1 WHERE Type = 'BUILDING_SARNATH_2';
UPDATE Buildings SET Defense = 10 WHERE Type = 'BUILDING_THIMPHU_2';
UPDATE Buildings SET CityConnectionTradeRouteModifier = 3 WHERE Type = 'BUILDING_VANCOUVER';
UPDATE Buildings SET GPExpendInfluence = 10 WHERE Type = 'BUILDING_VATICAN_CITY';
UPDATE Buildings SET ReligiousPressureModifier = -10, ConversionModifier = 10 WHERE Type = 'BUILDING_WITTENBERG';

UPDATE Buildings SET ExtraCityHitPoints = 1 /*Defense = 20*/ WHERE Type = 'BUILDING_CS_STRENGTH_FRIENDLY';
UPDATE Buildings SET ExtraCityHitPoints = 2 /*Defense = 50*/ WHERE Type = 'BUILDING_CS_STRENGTH_NEUTRAL';
UPDATE Buildings SET ExtraCityHitPoints = 3 /*Defense = 100*/ WHERE Type = 'BUILDING_CS_STRENGTH_HOSTILE';
UPDATE Buildings SET ReligiousPressureModifier = 10, ConversionModifier = 25 WHERE Type = 'BUILDING_CS_RELIGION_FRIENDLY';
UPDATE Buildings SET ReligiousPressureModifier = 25 WHERE Type = 'BUILDING_CS_RELIGION_NEUTRAL';
UPDATE Buildings SET ReligiousPressureModifier = 40, ConversionModifier = -25 WHERE Type = 'BUILDING_CS_RELIGION_HOSTILE';
UPDATE Buildings SET ReligiousPressureModifier = 30, ConversionModifier = 15 WHERE Type = 'BUILDING_CS_RELIGION_IRRATIONAL';

INSERT INTO Building_ClassesNeededInCity
			(BuildingType, 			BuildingClassType)
SELECT 		'BUILDING_CANOSSA', 	'BUILDINGCLASS_TEMPLE';

INSERT INTO Building_YieldPerXTerrainTimes100 	
			(BuildingType, 			TerrainType,		YieldType, 					Yield)
SELECT 		'BUILDING_ANDORRA', 	'TERRAIN_MOUNTAIN', 'YIELD_TOURISM', 			100 UNION ALL
SELECT 		'BUILDING_CHEVAK', 		'TERRAIN_TUNDRA', 	'YIELD_FOOD', 				34 UNION ALL
SELECT 		'BUILDING_CHEVAK', 		'TERRAIN_SNOW', 	'YIELD_FOOD', 				34 UNION ALL
SELECT 		'BUILDING_KABUL', 		'TERRAIN_MOUNTAIN', 'YIELD_CULTURE', 			67 UNION ALL
SELECT 		'BUILDING_LHASA_2', 	'TERRAIN_MOUNTAIN', 'YIELD_FAITH', 				67 UNION ALL
SELECT 		'BUILDING_MUTITJULU', 	'TERRAIN_DESERT',	'YIELD_GOLDEN_AGE_POINTS', 	50 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'TERRAIN_MOUNTAIN', 'YIELD_FAITH', 				50 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'TERRAIN_MOUNTAIN', 'YIELD_CULTURE', 			50;

INSERT INTO Building_YieldPerXFeatureTimes100 	
			(BuildingType, 			FeatureType,		YieldType, 			Yield)
SELECT 		'BUILDING_BEDULU', 		'FEATURE_JUNGLE', 	'YIELD_FAITH', 		50;

INSERT INTO Building_YieldChangesPerPop 
			(BuildingType, 					YieldType, 				Yield)
SELECT 		'BUILDING_HONG_KONG', 			'YIELD_GOLD', 			16;

INSERT INTO Building_YieldChangesPerReligion
			(BuildingType,					YieldType,						Yield)
SELECT		'BUILDING_SOFIA',				'YIELD_GREAT_GENERAL_POINTS',	100 UNION ALL
SELECT		'BUILDING_SOFIA',				'YIELD_GREAT_ADMIRAL_POINTS',	100 UNION ALL
SELECT		'BUILDING_WITTENBERG',			'YIELD_PRODUCTION',				100 UNION ALL
SELECT		'BUILDING_WITTENBERG',			'YIELD_GOLD',					100 UNION ALL
SELECT		'BUILDING_WITTENBERG',			'YIELD_CULTURE',				100;

INSERT INTO Building_YieldPerFriend 
			(BuildingType, 			YieldType, 		Yield)
SELECT 		'BUILDING_KATHMANDU', 	'YIELD_FAITH', 	1;

INSERT INTO Building_YieldPerAlly 
			(BuildingType, 			YieldType, 						Yield)
SELECT 		'BUILDING_BEDULU', 		'YIELD_FAITH', 					1 UNION ALL
SELECT 		'BUILDING_BEDULU', 		'YIELD_GOLDEN_AGE_POINTS', 		1 UNION ALL
SELECT 		'BUILDING_RAGUSA', 		'YIELD_FOOD', 					1 UNION ALL
SELECT 		'BUILDING_KATHMANDU', 	'YIELD_FAITH', 					1 UNION ALL
SELECT 		'BUILDING_KATHMANDU', 	'YIELD_GREAT_GENERAL_POINTS', 	1;

INSERT INTO Building_YieldChanges
			(BuildingType, 			YieldType, 							Yield)
SELECT 		'BUILDING_LHASA', 		'YIELD_FOOD', 						1 UNION ALL
SELECT 		'BUILDING_LHASA', 		'YIELD_CULTURE', 					1 UNION ALL
SELECT 		'BUILDING_LEVUKA', 		'YIELD_GREAT_GENERAL_POINTS', 		1 UNION ALL
SELECT 		'BUILDING_PALMYRA_2', 	'YIELD_CULTURE_LOCAL',				1 UNION ALL
SELECT 		'BUILDING_OC_EO_2', 	'YIELD_CULTURE_LOCAL',				1 UNION ALL
SELECT 		'BUILDING_SANAA', 		'YIELD_GOLD', 						1 UNION ALL
SELECT 		'BUILDING_THIMPHU', 	'YIELD_CULTURE', 					3 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'YIELD_SCIENCE', 					1 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'YIELD_FAITH', 						1 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'YIELD_CULTURE', 					1 UNION ALL
SELECT 		'BUILDING_RISHIKESH_2', 'YIELD_FAITH', 						2;

INSERT INTO Building_LakePlotYieldChanges 
			(BuildingType, 					YieldType, 		Yield)
SELECT 		'BUILDING_PANAMA_CITY', 		'YIELD_GOLD', 	1;

INSERT INTO Building_RiverPlotYieldChanges 
			(BuildingType, 					YieldType, 					Yield)
SELECT 		'BUILDING_KUALA_LUMPUR', 		'YIELD_GOLD', 				1 UNION ALL
SELECT 		'BUILDING_QUELIMANE', 			'YIELD_GOLDEN_AGE_POINTS', 	1;

INSERT INTO Building_YieldModifiers 
			(BuildingType, 				YieldType, 				Yield)
SELECT 		'BUILDING_LHASA', 			'YIELD_CULTURE', 		5 UNION ALL
SELECT 		'BUILDING_LHASA', 			'YIELD_FOOD', 			5 UNION ALL
SELECT 		'BUILDING_RIGA', 			'YIELD_FOOD', 			2 UNION ALL
SELECT 		'BUILDING_ARMAGH1', 		'YIELD_CULTURE', 		4 UNION ALL
SELECT 		'BUILDING_ARMAGH2', 		'YIELD_SCIENCE', 		4 UNION ALL
SELECT 		'BUILDING_ARMAGH3', 		'YIELD_GOLD', 			4 UNION ALL
SELECT 		'BUILDING_ARMAGH4', 		'YIELD_FOOD', 			1 UNION ALL
SELECT 		'BUILDING_ARMAGH4', 		'YIELD_PRODUCTION',		1;

INSERT INTO Building_BuildingClassYieldModifiers 
			(BuildingType, 				BuildingClassType,			YieldType, 				Modifier)
SELECT 		'BUILDING_ARMAGH1', 		'BUILDINGCLASS_ARMAGH1',	'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'BUILDING_ARMAGH2', 		'BUILDINGCLASS_ARMAGH2',	'YIELD_SCIENCE', 		1 UNION ALL
SELECT 		'BUILDING_ARMAGH3', 		'BUILDINGCLASS_ARMAGH3',	'YIELD_GOLD', 			1 UNION ALL
SELECT 		'BUILDING_ARMAGH4', 		'BUILDINGCLASS_ARMAGH4',	'YIELD_FOOD', 			1 UNION ALL
SELECT 		'BUILDING_ARMAGH4', 		'BUILDINGCLASS_ARMAGH4',	'YIELD_PRODUCTION',		1;

INSERT INTO Building_SpecificGreatPersonRateModifier 
			(BuildingType,			SpecialistType,			Modifier)
SELECT		'BUILDING_KIEV_2',		'SPECIALIST_MUSICIAN',	5 UNION ALL
SELECT		'BUILDING_MILAN_2',		'SPECIALIST_ARTIST',	5;

INSERT INTO Building_YieldFromDeath
			(BuildingType, 				YieldType, 						Yield)
SELECT 		'BUILDING_ANANGULA', 		'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'BUILDING_NAN_MADOL', 		'YIELD_FAITH', 					2 UNION ALL
SELECT 		'BUILDING_PALMYRA', 		'YIELD_GOLDEN_AGE_POINTS', 		2 UNION ALL
SELECT 		'BUILDING_PALMYRA', 		'YIELD_GREAT_GENERAL_POINTS', 	2;

INSERT INTO Building_YieldFromVictoryGlobal
			(BuildingType,			YieldType,				Yield)
SELECT		'BUILDING_KIGALI',		'YIELD_CULTURE_LOCAL',	5;

INSERT INTO Building_YieldFromProcessModifier
			(BuildingType, 			YieldType, 			Yield)
SELECT 		'BUILDING_TAIWAN', 		'YIELD_SCIENCE', 	10;

INSERT INTO Building_YieldFromYieldPercent
			(BuildingType,			YieldIn,			YieldOut,				Value) 
SELECT		'BUILDING_TAIWAN',		'YIELD_SCIENCE',	'YIELD_FOOD',			15 UNION ALL
SELECT		'BUILDING_MELBOURNE',	'YIELD_GOLD',		'YIELD_FOOD',			10 UNION ALL
SELECT		'BUILDING_MELBOURNE',	'YIELD_GOLD',		'YIELD_CULTURE_LOCAL',	5;

INSERT INTO Building_YieldFromUnitLevelUp
			(BuildingType, 					YieldType, 						Yield)
SELECT 		'BUILDING_WOOTEI_NIICIE', 		'YIELD_GREAT_GENERAL_POINTS', 	2;

INSERT INTO Building_YieldFromPolicyUnlock
    		(BuildingType, 		YieldType, 			Yield)
SELECT	    'BUILDING_SARNATH', 'YIELD_SCIENCE',	30;

INSERT INTO Building_YieldFromSpyAttack
			(BuildingType,		YieldType,			Yield)
SELECT	    'BUILDING_MANAGUA',	'YIELD_FOOD',		30;

INSERT INTO Building_YieldFromSpyDefense
			(BuildingType,		YieldType,			Yield)
SELECT	    'BUILDING_MANAGUA',	'YIELD_CULTURE',	20;

INSERT INTO Building_DomainFreeExperiences 
			(BuildingType, 						DomainType,		Experience)
SELECT 		'BUILDING_VALLETTA', 				'DOMAIN_SEA', 	15 UNION ALL
SELECT 		'BUILDING_WOOTEI_NIICIE_2', 		'DOMAIN_LAND', 	15;

INSERT INTO Building_ResourceQuantity
			(BuildingType, 						ResourceType, 			Quantity)
SELECT 		'BUILDING_WELLINGTON_HORSE', 		'RESOURCE_HORSE', 		1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_IRON', 		'RESOURCE_IRON', 		1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_COAL', 		'RESOURCE_COAL', 		1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_OIL', 			'RESOURCE_OIL', 		1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_ALUMINUM',		'RESOURCE_ALUMINUM', 	1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_URANIUM', 		'RESOURCE_URANIUM', 	1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_PAPER', 		'RESOURCE_PAPER', 		1 UNION ALL
SELECT 		'BUILDING_MONOPOLY_MANUSCRIPTS', 	'RESOURCE_PAPER', 		1;

INSERT INTO Building_FreeUnits
			(BuildingType, 			UnitType, 			NumUnits)
SELECT 		'BUILDING_SADDARVAZEH', 'UNIT_MISSIONARY', 	1 UNION ALL
SELECT 		'BUILDING_IRUNEA', 		'UNIT_WORKBOAT', 	1;

INSERT INTO Building_HurryModifiersLocal
			(BuildingType,				HurryType,		HurryCostModifier)
SELECT		'BUILDING_ANTWERP',			'HURRY_GOLD',	-10 UNION ALL
SELECT		'BUILDING_OUIDAH',			'HURRY_GOLD',	-1;

INSERT INTO Building_HurryModifiers
			(BuildingType,				HurryType,		HurryCostModifier)
SELECT		'BUILDING_MONOPOLY_COINS',	'HURRY_GOLD',	-10;

INSERT INTO Building_Flavors 
			(BuildingType, 			FlavorType, 				Flavor)
SELECT 		'BUILDING_KIEV', 		'FLAVOR_GREAT_PEOPLE', 		3 UNION ALL
SELECT 		'BUILDING_LHASA', 		'FLAVOR_WONDER', 			10 UNION ALL
SELECT 		'BUILDING_MILAN', 		'FLAVOR_GREAT_PEOPLE', 		3 UNION ALL
SELECT 		'BUILDING_VALLETTA', 	'FLAVOR_CITY_DEFENSE', 		10 UNION ALL
SELECT 		'BUILDING_VALLETTA', 	'FLAVOR_MILITARY_TRAINING', 10 UNION ALL
SELECT 		'BUILDING_VILNIUS', 	'FLAVOR_GREAT_PEOPLE', 		3 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'FLAVOR_HAPPINESS', 		10 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'FLAVOR_RELIGION', 			5 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'FLAVOR_SCIENCE', 			1;
---------------------------------------------------
-- Definitions - Events
---------------------------------------------------		
INSERT INTO Events 
			(Type, 									Description, 					Help, 										EventArt, RandomChance, NumChoices, IgnoresGlobalCooldown, EventCooldown)
SELECT  	'PLAYER_EVENT_MINOR_CIV_ADEJE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ADEJE', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ALMATY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ALMATY', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_AL_TIRABIN', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AL_TIRABIN', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_AMBRACIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AMBRACIA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ANANGULA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANANGULA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ANDORRA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ANTANANARIVO', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANTANANARIVO', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ANTWERP', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ARMAGH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ARMAGH', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_AUCKLAND', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AUCKLAND', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_AYUTTHAYA', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AYUTTHAYA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BAGAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BAGAN', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BALKH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BALKH', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BEDULU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BEDULU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BELGRADE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BELGRADE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BOGOTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BOGOTA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BRATISLAVA', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BRATISLAVA', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BRUSSELS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BRUSSELS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BUCHAREST', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUCHAREST', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BUDAPEST', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUDAPEST', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BUENOS_AIRES', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUENOS_AIRES', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BYBLOS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BYBLOS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CAHOKIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CAHOKIA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CANOSSA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CAPE_TOWN', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CHEVAK', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CLERMONT', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CLERMONT', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_COLOMBO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_COLOMBO', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DAKKAR', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DAKKAR', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DALI', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DALI', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DANO', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DANO', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DJIBOUTI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DJIBOUTI', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DODOMA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DOUALA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DOUALA',			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_FAYA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_FAYA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_FLORENCE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_FLORENCE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_GENEVA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_GENOA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GENOA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_GRANADA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GRANADA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_GWYNEDD', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GWYNEDD', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_HANOI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HANOI', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_HANUABADA', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HANUABADA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_HONDURAS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HONDURAS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_HONG_KONG', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_HONIARA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HONIARA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_IFE', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_IFE', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_IRUNEA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_IRUNEA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ISKANWAYA', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ISKANWAYA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_JERUSALEM', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_JERUSALEM', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_JETARKTE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_JETARKTE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_JUYUBIT', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_JUYUBIT', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KABUL', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KARASJOHKA', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KARASJOHKA',		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KARYES', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KARYES', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KATENDE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KATENDE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KATHMANDU', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KIEV', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KIGALI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KUALA_LUMPUR', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT 		'PLAYER_EVENT_MINOR_CIV_KYZYL', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KYZYL', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LACONIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LACONIA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LAHORE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LAHORE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LA_VENTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LA_VENTA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LEVUKA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LHASA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LONGYAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LONGYAN', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MALACCA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MALACCA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MANAGUA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MANAGUA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MANILA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MANILA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MBABANE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MBABANE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MBANZA_KONGO', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MBANZA_KONGO', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MELBOURNE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MENDYARRUP', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MENDYARRUP', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MILAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MOGADISHU', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MOGADISHU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MOMBASA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MOMBASA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MONACO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MONACO', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MUISCA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUISCA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MULTAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MULTAN', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MUSCAT', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUSCAT', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MUTITJULU', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUTITJULU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_NAN_MADOL', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_NAN_MADOL', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_NYARYANA_MARQ', 'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_NYARYANA_MARQ', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_OC_EO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ORMUS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ORMUS', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ODENSO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ODENSO', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_OUIDAH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_OUIDAH', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_PALMYRA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PALMYRA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_PANAMA_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_PELYM', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PELYM', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_PHANOTEUS', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PHANOTEUS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_PRAGUE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PRAGUE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_POKROVKA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_POKROVKA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_QUEBEC_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_QUEBEC_CITY', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_QUELIMANE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_RAGUSA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_RIGA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_RISHIKESH', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RISHIKESH', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SADDARVAZEH', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SADDARVAZEH', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SAMARKAND', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SANAA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SANAA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SANTO_DOMINGO', 'TXT_KEY_CSTRAIT_MINOR_CIV',	'TXT_KEY_CSTRAIT_MINOR_CIV_SANTO_DOMINGO', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SARNATH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SARNATH', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SGANG_GWAAY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SGANG_GWAAY', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SIDON', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SIDON', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SIERRA_LEONE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SIERRA_LEONE', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SINGAPORE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SINGAPORE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SOFIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SUCEAVA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SUCEAVA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SURREY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SURREY', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SYDNEY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SYDNEY', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_TAIWAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_TBILISI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TBILISI', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_THIMPHU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_TIWANAKU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TIWANAKU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_TUNIS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TUNIS', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_TYRE', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TYRE', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_UR', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_UR', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_VALLETTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VALLETTA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_VANCOUVER', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_VATICAN_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_VILNIUS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VILNIUS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_WELLINGTON', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_WITTENBERG', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_WOOTEI_NIICIE', 'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WOOTEI_NIICIE', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_YANGCHENG', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_YANGCHENG', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_YEREVAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_YEREVAN', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ZANZIBAR', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ZANZIBAR', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ZURICH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ZURICH', 		'AllianceShift.dds', -1, 1, 1, 1;

INSERT INTO EventChoices 
			(Type, 											Description, 						Help, 										EventDuration, 	Expires, 	CapitalEffectOnly,	EventPolicy, 			EventPromotion, 			EventBuildingClassGlobal)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE', 			'TXT_KEY_CITYSTATE_ADEJE', 			'TXT_KEY_CSTRAIT_MINOR_CIV_ADEJE', 			3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ALMATY', 		'TXT_KEY_CITYSTATE_ALMATY', 		'TXT_KEY_CSTRAIT_MINOR_CIV_ALMATY', 		3, 				1, 			0,					'POLICY_ALMATY', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AL_TIRABIN', 	'TXT_KEY_CITYSTATE_AL_TIRABIN', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AL_TIRABIN', 	3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AMBRACIA', 		'TXT_KEY_CITYSTATE_AMBRACIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_AMBRACIA', 		3, 				1, 			0,					'POLICY_AMBRACIA', 		'PROMOTION_AMBRACIA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANANGULA', 		'TXT_KEY_CITYSTATE_ANANGULA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_ANANGULA', 		3, 				1, 			0,					'POLICY_ANANGULA', 		NULL, 						'BUILDINGCLASS_ANANGULA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANDORRA', 		'TXT_KEY_CITYSTATE_ANDORRA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_ANDORRA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTANANARIVO', 	'TXT_KEY_CITYSTATE_ANTANANARIVO', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANTANANARIVO', 	3, 				1, 			0,					'POLICY_ANTANANARIVO', 	'PROMOTION_ANTANANARIVO', 	NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTWERP', 		'TXT_KEY_CITYSTATE_ANTWERP', 		'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 		3, 				1,			0,					NULL, 					NULL, 						'BUILDINGCLASS_ANTWERP' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'TXT_KEY_CITYSTATE_ARMAGH', 		'TXT_KEY_CSTRAIT_MINOR_CIV_ARMAGH', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AUCKLAND', 		'TXT_KEY_CITYSTATE_AUCKLAND', 		'TXT_KEY_CSTRAIT_MINOR_CIV_AUCKLAND', 		3, 				1, 			0,					'POLICY_AUCKLAND', 		'PROMOTION_AUCKLAND', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AYUTTHAYA', 		'TXT_KEY_CITYSTATE_AYUTTHAYA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_AYUTTHAYA', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BAGAN', 			'TXT_KEY_CITYSTATE_BAGAN', 			'TXT_KEY_CSTRAIT_MINOR_CIV_BAGAN', 			3, 				1, 			0,					'POLICY_BAGAN', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BALKH', 			'TXT_KEY_CITYSTATE_BALKH', 			'TXT_KEY_CSTRAIT_MINOR_CIV_BALKH', 			3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BEDULU', 		'TXT_KEY_CITYSTATE_BEDULU', 		'TXT_KEY_CSTRAIT_MINOR_CIV_BEDULU', 		3, 				1, 			0,					'POLICY_BEDULU', 		NULL, 						'BUILDINGCLASS_BEDULU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BELGRADE', 		'TXT_KEY_CITYSTATE_BELGRADE', 		'TXT_KEY_CSTRAIT_MINOR_CIV_BELGRADE', 		3, 				1, 			0,					'POLICY_BELGRADE', 		'PROMOTION_BELGRADE', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BOGOTA', 		'TXT_KEY_CITYSTATE_BOGOTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_BOGOTA', 		3, 				1, 			0,					'POLICY_BOGOTA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'TXT_KEY_CITYSTATE_BRATISLAVA', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BRATISLAVA', 	3, 				1, 			0,					'POLICY_BRATISLAVA', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 		'TXT_KEY_CITYSTATE_BRUSSELS', 		'TXT_KEY_CSTRAIT_MINOR_CIV_BRUSSELS', 		3, 				1, 			0,					NULL, 					'PROMOTION_BRUSSELS', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUCHAREST', 		'TXT_KEY_CITYSTATE_BUCHAREST', 		'TXT_KEY_CSTRAIT_MINOR_CIV_BUCHAREST', 		3, 				1, 			0,					'POLICY_BUCHAREST', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUDAPEST', 		'TXT_KEY_CITYSTATE_BUDAPEST', 		'TXT_KEY_CSTRAIT_MINOR_CIV_BUDAPEST', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'TXT_KEY_CITYSTATE_BUENOS_AIRES', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUENOS_AIRES', 	3, 				1, 			0,					'POLICY_BUENOS_AIRES', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BYBLOS', 		'TXT_KEY_CITYSTATE_BYBLOS', 		'TXT_KEY_CSTRAIT_MINOR_CIV_BYBLOS', 		3, 				1, 			0,					'POLICY_BYBLOS', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA', 		'TXT_KEY_CITYSTATE_CAHOKIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_CAHOKIA', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CANOSSA', 		'TXT_KEY_CITYSTATE_CANOSSA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAPE_TOWN', 		'TXT_KEY_CITYSTATE_CAPE_TOWN', 		'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_CAPE_TOWN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CHEVAK', 		'TXT_KEY_CITYSTATE_CHEVAK',			'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_CHEVAK' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CLERMONT', 		'TXT_KEY_CITYSTATE_CLERMONT', 		'TXT_KEY_CSTRAIT_MINOR_CIV_CLERMONT', 		3, 				1, 			0,					NULL, 					'PROMOTION_CLERMONT', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 		'TXT_KEY_CITYSTATE_COLOMBO', 		'TXT_KEY_CSTRAIT_MINOR_CIV_COLOMBO', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DAKKAR', 		'TXT_KEY_CITYSTATE_DAKKAR', 		'TXT_KEY_CSTRAIT_MINOR_CIV_DAKKAR', 		3, 				1, 			0,					'POLICY_DAKKAR', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DALI', 			'TXT_KEY_CITYSTATE_DALI', 			'TXT_KEY_CSTRAIT_MINOR_CIV_DALI', 			3, 				1, 			0,					'POLICY_DALI', 			NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DANO', 			'TXT_KEY_CITYSTATE_DANO', 			'TXT_KEY_CSTRAIT_MINOR_CIV_DANO', 			3, 				1, 			0,					'POLICY_DANO', 			NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DJIBOUTI', 		'TXT_KEY_CITYSTATE_DJIBOUTI',		'TXT_KEY_CSTRAIT_MINOR_CIV_DJIBOUTI', 		3, 				1, 			0,					'POLICY_DJIBOUTI', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DODOMA', 		'TXT_KEY_CITYSTATE_DODOMA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 		3, 				1, 			0,					'POLICY_DODOMA', 		'PROMOTION_DODOMA', 		'BUILDINGCLASS_DODOMA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DOUALA', 		'TXT_KEY_CITYSTATE_DOUALA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_DOUALA', 		3, 				1, 			0,					'POLICY_DOUALA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FAYA', 			'TXT_KEY_CITYSTATE_FAYA', 			'TXT_KEY_CSTRAIT_MINOR_CIV_FAYA', 			3, 				1, 			0,					NULL, 					'PROMOTION_FAYA', 			NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE', 		'TXT_KEY_CITYSTATE_FLORENCE', 		'TXT_KEY_CSTRAIT_MINOR_CIV_FLORENCE', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GENEVA', 		'TXT_KEY_CITYSTATE_GENEVA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 		3, 				1, 			0,					'POLICY_GENEVA', 		NULL, 						'BUILDINGCLASS_GENEVA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GENOA', 			'TXT_KEY_CITYSTATE_GENOA', 			'TXT_KEY_CSTRAIT_MINOR_CIV_GENOA', 			3, 				1, 			0,					'POLICY_GENOA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'TXT_KEY_CITYSTATE_GRANADA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_GRANADA', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GWYNEDD', 		'TXT_KEY_CITYSTATE_GWYNEDD', 		'TXT_KEY_CSTRAIT_MINOR_CIV_GWYNEDD', 		3, 				1, 			0,					'POLICY_GWYNEDD', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HANOI', 			'TXT_KEY_CITYSTATE_HANOI', 			'TXT_KEY_CSTRAIT_MINOR_CIV_HANOI', 			3, 				1, 			0,					NULL, 					'PROMOTION_HANOI', 			NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HANUABADA', 		'TXT_KEY_CITYSTATE_HANUABADA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_HANUABADA', 		3, 				1, 			0,					'POLICY_HANUABADA', 	'PROMOTION_HANUABADA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONDURAS', 		'TXT_KEY_CITYSTATE_HONDURAS', 		'TXT_KEY_CSTRAIT_MINOR_CIV_HONDURAS', 		3, 				1, 			0,					'POLICY_HONDURAS', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONG_KONG', 		'TXT_KEY_CITYSTATE_HONG_KONG', 		'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 		3, 				1, 			0,					'POLICY_HONG_KONG', 	NULL, 						'BUILDINGCLASS_HONG_KONG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONIARA', 		'TXT_KEY_CITYSTATE_HONIARA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_HONIARA', 		3, 				1, 			0,					'POLICY_HONIARA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_IFE', 			'TXT_KEY_CITYSTATE_IFE', 			'TXT_KEY_CSTRAIT_MINOR_CIV_IFE', 			3, 				1, 			0,					NULL, 					'PROMOTION_IFE', 			NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_IRUNEA', 		'TXT_KEY_CITYSTATE_IRUNEA',			'TXT_KEY_CSTRAIT_MINOR_CIV_IRUNEA', 		3, 				1, 			0,					'POLICY_IRUNEA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ISKANWAYA', 		'TXT_KEY_CITYSTATE_ISKANWAYA',		'TXT_KEY_CSTRAIT_MINOR_CIV_ISKANWAYA', 		3, 				1, 			0,					NULL, 					'PROMOTION_ISKANWAYA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JERUSALEM', 		'TXT_KEY_CITYSTATE_JERUSALEM', 		'TXT_KEY_CSTRAIT_MINOR_CIV_JERUSALEM', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JETARKTE', 		'TXT_KEY_CITYSTATE_JETARKTE', 		'TXT_KEY_CSTRAIT_MINOR_CIV_JETARKTE', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JUYUBIT', 		'TXT_KEY_CITYSTATE_JUYUBIT', 		'TXT_KEY_CSTRAIT_MINOR_CIV_JUYUBIT', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KABUL', 			'TXT_KEY_CITYSTATE_KABUL', 			'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 			3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_KABUL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARASJOHKA', 	'TXT_KEY_CITYSTATE_KARASJOHKA', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KARASJOHKA', 	3, 				1, 			0,					NULL, 					'PROMOTION_KARASJOHKA', 	NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARYES', 		'TXT_KEY_CITYSTATE_KARYES', 		'TXT_KEY_CSTRAIT_MINOR_CIV_KARYES', 		3, 				1, 			0,					NULL, 					'PROMOTION_KARYES', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KATENDE', 		'TXT_KEY_CITYSTATE_KATENDE', 		'TXT_KEY_CSTRAIT_MINOR_CIV_KATENDE', 		3, 				1, 			0,					'POLICY_KATENDE', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KATHMANDU', 		'TXT_KEY_CITYSTATE_KATHMANDU', 		'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 		3, 				1, 			0,					'POLICY_KATHMANDU', 	NULL, 						'BUILDINGCLASS_KATHMANDU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIEV', 			'TXT_KEY_CITYSTATE_KIEV', 			'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 			3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_KIEV_2' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIGALI', 		'TXT_KEY_CITYSTATE_KIGALI', 		'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 		3, 				1, 			0,					'POLICY_KIGALI', 		NULL, 						'BUILDINGCLASS_KIGALI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KUALA_LUMPUR', 	'TXT_KEY_CITYSTATE_KUALA_LUMPUR', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 	3, 				1, 			0,					'POLICY_KUALA_LUMPUR', 	NULL, 						'BUILDINGCLASS_KUALA_LUMPUR' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL', 			'TXT_KEY_CITYSTATE_KYZYL', 			'TXT_KEY_CSTRAIT_MINOR_CIV_KYZYL', 			3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LACONIA', 		'TXT_KEY_CITYSTATE_LACONIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_LACONIA', 		3, 				1, 			0,					NULL, 					'PROMOTION_LACONIA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LAHORE', 		'TXT_KEY_CITYSTATE_LAHORE', 		'TXT_KEY_CSTRAIT_MINOR_CIV_LAHORE', 		3, 				1, 			0,					'POLICY_LAHORE', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'TXT_KEY_CITYSTATE_LA_VENTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_LA_VENTA', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LEVUKA', 		'TXT_KEY_CITYSTATE_LEVUKA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 		3, 				1, 			0,					NULL,					'PROMOTION_LEVUKA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA', 			'TXT_KEY_CITYSTATE_LHASA', 			'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 			3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_LHASA_2' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LONGYAN', 		'TXT_KEY_CITYSTATE_LONGYAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV_LONGYAN', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'TXT_KEY_CITYSTATE_MALACCA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_MALACCA', 		3, 				1, 			0,					'POLICY_MALACCA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MANAGUA', 		'TXT_KEY_CITYSTATE_MANAGUA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_MANAGUA', 		3, 				1, 			1,					NULL, 					NULL, 						'BUILDINGCLASS_MANAGUA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MANILA', 		'TXT_KEY_CITYSTATE_MANILA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_MANILA', 		3, 				1, 			0,					'POLICY_MANILA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MBABANE', 		'TXT_KEY_CITYSTATE_MBABANE', 		'TXT_KEY_CSTRAIT_MINOR_CIV_MBABANE', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_MBABANE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MBANZA_KONGO', 	'TXT_KEY_CITYSTATE_MBANZA_KONGO', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MBANZA_KONGO', 	3, 				1, 			0,					NULL, 					'PROMOTION_MBANZA_KONGO', 	NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'TXT_KEY_CITYSTATE_MELBOURNE', 		'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_MELBOURNE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MENDYARRUP', 	'TXT_KEY_CITYSTATE_MENDYARRUP', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MENDYARRUP', 	3, 				1, 			0,					NULL, 					'PROMOTION_MENDYARRUP', 	NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MILAN', 			'TXT_KEY_CITYSTATE_MILAN', 			'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 			3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_MILAN_2' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU', 		'TXT_KEY_CITYSTATE_MOGADISHU', 		'TXT_KEY_CSTRAIT_MINOR_CIV_MOGADISHU', 		3, 				1, 			0,					'POLICY_MOGADISHU', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'TXT_KEY_CITYSTATE_MOMBASA',		'TXT_KEY_CSTRAIT_MINOR_CIV_MOMBASA', 		3, 				1, 			0,					'POLICY_MOMBASA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MONACO', 		'TXT_KEY_CITYSTATE_MONACO', 		'TXT_KEY_CSTRAIT_MINOR_CIV_MONACO', 		3, 				1, 			0,					'POLICY_MONACO', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUISCA', 		'TXT_KEY_CITYSTATE_MUISCA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_MUISCA', 		3, 				1, 			0,					'POLICY_MUISCA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MULTAN', 		'TXT_KEY_CITYSTATE_MULTAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV_MULTAN', 		3, 				1, 			0,					'POLICY_MULTAN', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUSCAT', 		'TXT_KEY_CITYSTATE_MUSCAT', 		'TXT_KEY_CSTRAIT_MINOR_CIV_MUSCAT', 		3, 				1, 			0,					'POLICY_MUSCAT', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUTITJULU', 		'TXT_KEY_CITYSTATE_MUTITJULU',		'TXT_KEY_CSTRAIT_MINOR_CIV_MUTITJULU', 		3, 				1, 			0,					'POLICY_MUTITJULU', 	NULL, 						'BUILDINGCLASS_MUTITJULU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NAN_MADOL', 		'TXT_KEY_CITYSTATE_NAN_MADOL',		'TXT_KEY_CSTRAIT_MINOR_CIV_NAN_MADOL', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_NAN_MADOL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NYARYANA_MARQ', 	'TXT_KEY_CITYSTATE_NYARYANA_MARQ', 	'TXT_KEY_CSTRAIT_MINOR_CIV_NYARYANA_MARQ', 	3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_OC_EO', 			'TXT_KEY_CITYSTATE_OC_EO', 			'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 			3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_OC_EO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ODENSO', 		'TXT_KEY_CITYSTATE_ODENSO', 		'TXT_KEY_CSTRAIT_MINOR_CIV_ODENSO', 		3, 				1, 			0,					NULL, 					'PROMOTION_ODENSO', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'TXT_KEY_CITYSTATE_ORMUS', 			'TXT_KEY_CSTRAIT_MINOR_CIV_ORMUS', 			3, 				1, 			0,					'POLICY_ORMUS', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_OUIDAH', 		'TXT_KEY_CITYSTATE_OUIDAH', 		'TXT_KEY_CSTRAIT_MINOR_CIV_OUIDAH', 		3, 				1, 			0,					'POLICY_OUIDAH', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PALMYRA', 		'TXT_KEY_CITYSTATE_PALMYRA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_PALMYRA', 		3, 				1, 			1,					'POLICY_PALMYRA', 		NULL, 						'BUILDINGCLASS_PALMYRA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PANAMA_CITY', 	'TXT_KEY_CITYSTATE_PANAMA_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 	3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_PANAMA_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PELYM', 			'TXT_KEY_CITYSTATE_PELYM', 			'TXT_KEY_CSTRAIT_MINOR_CIV_PELYM', 			3, 				1, 			0,					NULL, 					'PROMOTION_PELYM', 			NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PHANOTEUS', 		'TXT_KEY_CITYSTATE_PHANOTEUS',		'TXT_KEY_CSTRAIT_MINOR_CIV_PHANOTEUS', 		3, 				1, 			0,					'POLICY_PHANOTEUS', 	NULL, 						NULL /*'BUILDINGCLASS_PHANOTEUS'*/ UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_POKROVKA', 		'TXT_KEY_CITYSTATE_POKROVKA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_POKROVKA', 		3, 				1, 			0,					'POLICY_POKROVKA', 		'PROMOTION_POKROVKA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE', 		'TXT_KEY_CITYSTATE_PRAGUE', 		'TXT_KEY_CSTRAIT_MINOR_CIV_PRAGUE', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'TXT_KEY_CITYSTATE_QUEBEC_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV_QUEBEC_CITY', 	3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUELIMANE', 		'TXT_KEY_CITYSTATE_QUELIMANE',		'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 		3, 				1, 			0,					'POLICY_QUELIMANE', 	NULL, 						'BUILDINGCLASS_QUELIMANE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RAGUSA', 		'TXT_KEY_CITYSTATE_RAGUSA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_RAGUSA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RIGA', 			'TXT_KEY_CITYSTATE_RIGA', 			'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 			3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_RIGA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RISHIKESH', 		'TXT_KEY_CITYSTATE_RISHIKESH', 		'TXT_KEY_CSTRAIT_MINOR_CIV_RISHIKESH', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SADDARVAZEH', 	'TXT_KEY_CITYSTATE_SADDARVAZEH', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SADDARVAZEH', 	3, 				1, 			0,					'POLICY_SADDARVAZEH', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SAMARKAND', 		'TXT_KEY_CITYSTATE_SAMARKAND', 		'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 		3, 				1, 			0,					'POLICY_SAMARKAND', 	NULL, 						'BUILDINGCLASS_SAMARKAND' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SANAA', 			'TXT_KEY_CITYSTATE_SANAA', 			'TXT_KEY_CSTRAIT_MINOR_CIV_SANAA', 			3, 				1, 			0,					'POLICY_SANAA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SANTO_DOMINGO', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO',	'TXT_KEY_CSTRAIT_MINOR_CIV_SANTO_DOMINGO', 	3, 				1, 			0,					'POLICY_SANTO_DOMINGO', NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SARNATH', 		'TXT_KEY_CITYSTATE_SARNATH', 		'TXT_KEY_CSTRAIT_MINOR_CIV_SARNATH', 		3, 				1, 			1,					NULL, 					NULL, 						'BUILDINGCLASS_SARNATH' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SGANG_GWAAY', 	'TXT_KEY_CITYSTATE_SGANG_GWAAY', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SGANG_GWAAY', 	3, 				1, 			0,					NULL, 					'PROMOTION_SGANG_GWAAY', 	NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIDON', 			'TXT_KEY_CITYSTATE_SIDON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_SIDON', 			3, 				1, 			0,					NULL, 					'PROMOTION_SIDON', 			NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIERRA_LEONE', 	'TXT_KEY_CITYSTATE_SIERRA_LEONE', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SIERRA_LEONE', 	3, 				1, 			0,					'POLICY_SIERRA_LEONE', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SINGAPORE', 		'TXT_KEY_CITYSTATE_SINGAPORE',		'TXT_KEY_CSTRAIT_MINOR_CIV_SINGAPORE', 		3, 				1, 			0,					'POLICY_SINGAPORE', 	'PROMOTION_NOBILITY', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SOFIA', 			'TXT_KEY_CITYSTATE_SOFIA', 			'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 			3, 				1, 			0,					'POLICY_SOFIA', 		NULL, 						'BUILDINGCLASS_SOFIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SUCEAVA', 		'TXT_KEY_CITYSTATE_SUCEAVA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_SUCEAVA', 		3, 				1, 			0,					'POLICY_SUCEAVA', 		'PROMOTION_SUCEAVA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SURREY', 		'TXT_KEY_CITYSTATE_SURREY', 		'TXT_KEY_CSTRAIT_MINOR_CIV_SURREY', 		3, 				1, 			0,					'POLICY_SURREY', 		'PROMOTION_SURREY', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SYDNEY', 		'TXT_KEY_CITYSTATE_SYDNEY', 		'TXT_KEY_CSTRAIT_MINOR_CIV_SYDNEY', 		3, 				1, 			0,					'POLICY_SYDNEY', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TAIWAN', 		'TXT_KEY_CITYSTATE_TAIWAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_TAIWAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TBILISI', 		'TXT_KEY_CITYSTATE_TBILISI', 		'TXT_KEY_CSTRAIT_MINOR_CIV_TBILISI', 		3, 				1, 			0,					'POLICY_TBILISI', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_THIMPHU', 		'TXT_KEY_CITYSTATE_THIMPHU', 		'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TIWANAKU', 		'TXT_KEY_CITYSTATE_TIWANAKU', 		'TXT_KEY_CSTRAIT_MINOR_CIV_TIWANAKU', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TUNIS', 			'TXT_KEY_CITYSTATE_TUNIS', 			'TXT_KEY_CSTRAIT_MINOR_CIV_TUNIS', 			3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TYRE', 			'TXT_KEY_CITYSTATE_TYRE', 			'TXT_KEY_CSTRAIT_MINOR_CIV_TYRE', 			3, 				1, 			0,					'POLICY_TYRE', 			NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_UR', 			'TXT_KEY_CITYSTATE_UR', 			'TXT_KEY_CSTRAIT_MINOR_CIV_UR', 			3, 				1, 			0,					'POLICY_UR', 			NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA', 		'TXT_KEY_CITYSTATE_VALLETTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV_VALLETTA', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'TXT_KEY_CITYSTATE_VANCOUVER', 		'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 		3, 				1, 			0,					'POLICY_VANCOUVER', 	NULL, 						'BUILDINGCLASS_VANCOUVER' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VATICAN_CITY', 	'TXT_KEY_CITYSTATE_VATICAN_CITY',	'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 	3, 				1, 			1,					'POLICY_VATICAN_CITY', 	NULL, 						'BUILDINGCLASS_VATICAN_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VILNIUS', 		'TXT_KEY_CITYSTATE_VILNIUS', 		'TXT_KEY_CSTRAIT_MINOR_CIV_VILNIUS', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'TXT_KEY_CITYSTATE_WELLINGTON', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 	3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WITTENBERG', 	'TXT_KEY_CITYSTATE_WITTENBERG', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 	3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_WITTENBERG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WOOTEI_NIICIE', 	'TXT_KEY_CITYSTATE_WOOTEI_NIICIE', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WOOTEI_NIICIE', 	3, 				1, 			1,					'POLICY_WOOTEI_NIICIE', NULL, 						'BUILDINGCLASS_WOOTEI_NIICIE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'TXT_KEY_CITYSTATE_YANGCHENG',		'TXT_KEY_CSTRAIT_MINOR_CIV_YANGCHENG', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YEREVAN', 		'TXT_KEY_CITYSTATE_YEREVAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV_YEREVAN', 		3, 				1, 			0,					NULL, 					'PROMOTION_YEREVAN', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'TXT_KEY_CITYSTATE_ZANZIBAR', 		'TXT_KEY_CSTRAIT_MINOR_CIV_ZANZIBAR', 		3, 				1, 			0,					'POLICY_ZANZIBAR', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH', 		'TXT_KEY_CITYSTATE_ZURICH', 		'TXT_KEY_CSTRAIT_MINOR_CIV_ZURICH', 		3, 				1, 			0,					NULL, 					NULL, 						NULL;

INSERT INTO Event_ParentEvents 
			(EventChoiceType, 								EventType)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE', 			'PLAYER_EVENT_MINOR_CIV_ADEJE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ALMATY', 		'PLAYER_EVENT_MINOR_CIV_ALMATY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AL_TIRABIN', 	'PLAYER_EVENT_MINOR_CIV_AL_TIRABIN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AMBRACIA', 		'PLAYER_EVENT_MINOR_CIV_AMBRACIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANANGULA', 		'PLAYER_EVENT_MINOR_CIV_ANANGULA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANDORRA', 		'PLAYER_EVENT_MINOR_CIV_ANDORRA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTANANARIVO', 	'PLAYER_EVENT_MINOR_CIV_ANTANANARIVO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTWERP', 		'PLAYER_EVENT_MINOR_CIV_ANTWERP' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'PLAYER_EVENT_MINOR_CIV_ARMAGH' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AUCKLAND', 		'PLAYER_EVENT_MINOR_CIV_AUCKLAND' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AYUTTHAYA', 		'PLAYER_EVENT_MINOR_CIV_AYUTTHAYA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BAGAN', 			'PLAYER_EVENT_MINOR_CIV_BAGAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BALKH', 			'PLAYER_EVENT_MINOR_CIV_BALKH' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BEDULU', 		'PLAYER_EVENT_MINOR_CIV_BEDULU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BELGRADE', 		'PLAYER_EVENT_MINOR_CIV_BELGRADE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BOGOTA', 		'PLAYER_EVENT_MINOR_CIV_BOGOTA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'PLAYER_EVENT_MINOR_CIV_BRATISLAVA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 		'PLAYER_EVENT_MINOR_CIV_BRUSSELS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUCHAREST', 		'PLAYER_EVENT_MINOR_CIV_BUCHAREST' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUDAPEST', 		'PLAYER_EVENT_MINOR_CIV_BUDAPEST' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'PLAYER_EVENT_MINOR_CIV_BUENOS_AIRES' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BYBLOS', 		'PLAYER_EVENT_MINOR_CIV_BYBLOS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA', 		'PLAYER_EVENT_MINOR_CIV_CAHOKIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CANOSSA', 		'PLAYER_EVENT_MINOR_CIV_CANOSSA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAPE_TOWN', 		'PLAYER_EVENT_MINOR_CIV_CAPE_TOWN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CHEVAK', 		'PLAYER_EVENT_MINOR_CIV_CHEVAK' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CLERMONT', 		'PLAYER_EVENT_MINOR_CIV_CLERMONT' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 		'PLAYER_EVENT_MINOR_CIV_COLOMBO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DAKKAR', 		'PLAYER_EVENT_MINOR_CIV_DAKKAR' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DALI', 			'PLAYER_EVENT_MINOR_CIV_DALI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DANO', 			'PLAYER_EVENT_MINOR_CIV_DANO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DJIBOUTI', 		'PLAYER_EVENT_MINOR_CIV_DJIBOUTI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DODOMA', 		'PLAYER_EVENT_MINOR_CIV_DODOMA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DOUALA', 		'PLAYER_EVENT_MINOR_CIV_DOUALA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FAYA', 			'PLAYER_EVENT_MINOR_CIV_FAYA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE', 		'PLAYER_EVENT_MINOR_CIV_FLORENCE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GENEVA', 		'PLAYER_EVENT_MINOR_CIV_GENEVA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GENOA', 			'PLAYER_EVENT_MINOR_CIV_GENOA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'PLAYER_EVENT_MINOR_CIV_GRANADA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GWYNEDD', 		'PLAYER_EVENT_MINOR_CIV_GWYNEDD' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HANOI', 			'PLAYER_EVENT_MINOR_CIV_HANOI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HANUABADA', 		'PLAYER_EVENT_MINOR_CIV_HANUABADA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONDURAS', 		'PLAYER_EVENT_MINOR_CIV_HONDURAS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONG_KONG', 		'PLAYER_EVENT_MINOR_CIV_HONG_KONG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONIARA', 		'PLAYER_EVENT_MINOR_CIV_HONIARA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_IFE', 			'PLAYER_EVENT_MINOR_CIV_IFE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_IRUNEA', 		'PLAYER_EVENT_MINOR_CIV_IRUNEA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ISKANWAYA', 		'PLAYER_EVENT_MINOR_CIV_ISKANWAYA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JERUSALEM', 		'PLAYER_EVENT_MINOR_CIV_JERUSALEM' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JETARKTE', 		'PLAYER_EVENT_MINOR_CIV_JETARKTE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JUYUBIT', 		'PLAYER_EVENT_MINOR_CIV_JUYUBIT' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KABUL', 			'PLAYER_EVENT_MINOR_CIV_KABUL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARASJOHKA', 	'PLAYER_EVENT_MINOR_CIV_KARASJOHKA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARYES', 		'PLAYER_EVENT_MINOR_CIV_KARYES' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KATENDE', 		'PLAYER_EVENT_MINOR_CIV_KATENDE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KATHMANDU', 		'PLAYER_EVENT_MINOR_CIV_KATHMANDU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIEV', 			'PLAYER_EVENT_MINOR_CIV_KIEV' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIGALI', 		'PLAYER_EVENT_MINOR_CIV_KIGALI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KUALA_LUMPUR', 	'PLAYER_EVENT_MINOR_CIV_KUALA_LUMPUR' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL', 			'PLAYER_EVENT_MINOR_CIV_KYZYL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LAHORE', 		'PLAYER_EVENT_MINOR_CIV_LAHORE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LACONIA', 		'PLAYER_EVENT_MINOR_CIV_LACONIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'PLAYER_EVENT_MINOR_CIV_LA_VENTA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LEVUKA', 		'PLAYER_EVENT_MINOR_CIV_LEVUKA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA', 			'PLAYER_EVENT_MINOR_CIV_LHASA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LONGYAN', 		'PLAYER_EVENT_MINOR_CIV_LONGYAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'PLAYER_EVENT_MINOR_CIV_MALACCA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MANAGUA', 		'PLAYER_EVENT_MINOR_CIV_MANAGUA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MANILA', 		'PLAYER_EVENT_MINOR_CIV_MANILA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MBABANE', 		'PLAYER_EVENT_MINOR_CIV_MBABANE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MBANZA_KONGO', 	'PLAYER_EVENT_MINOR_CIV_MBANZA_KONGO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'PLAYER_EVENT_MINOR_CIV_MELBOURNE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MENDYARRUP', 	'PLAYER_EVENT_MINOR_CIV_MENDYARRUP' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MILAN', 			'PLAYER_EVENT_MINOR_CIV_MILAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU', 		'PLAYER_EVENT_MINOR_CIV_MOGADISHU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'PLAYER_EVENT_MINOR_CIV_MOMBASA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MONACO', 		'PLAYER_EVENT_MINOR_CIV_MONACO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUISCA', 		'PLAYER_EVENT_MINOR_CIV_MUISCA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MULTAN', 		'PLAYER_EVENT_MINOR_CIV_MULTAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUSCAT', 		'PLAYER_EVENT_MINOR_CIV_MUSCAT' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUTITJULU', 		'PLAYER_EVENT_MINOR_CIV_MUTITJULU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NAN_MADOL', 		'PLAYER_EVENT_MINOR_CIV_NAN_MADOL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NYARYANA_MARQ', 	'PLAYER_EVENT_MINOR_CIV_NYARYANA_MARQ' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_OC_EO', 			'PLAYER_EVENT_MINOR_CIV_OC_EO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ODENSO', 		'PLAYER_EVENT_MINOR_CIV_ODENSO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'PLAYER_EVENT_MINOR_CIV_ORMUS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_OUIDAH', 		'PLAYER_EVENT_MINOR_CIV_OUIDAH' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PALMYRA', 		'PLAYER_EVENT_MINOR_CIV_PALMYRA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PANAMA_CITY', 	'PLAYER_EVENT_MINOR_CIV_PANAMA_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PELYM', 			'PLAYER_EVENT_MINOR_CIV_PELYM' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PHANOTEUS', 		'PLAYER_EVENT_MINOR_CIV_PHANOTEUS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE', 		'PLAYER_EVENT_MINOR_CIV_PRAGUE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_POKROVKA', 		'PLAYER_EVENT_MINOR_CIV_POKROVKA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'PLAYER_EVENT_MINOR_CIV_QUEBEC_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUELIMANE', 		'PLAYER_EVENT_MINOR_CIV_QUELIMANE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RAGUSA', 		'PLAYER_EVENT_MINOR_CIV_RAGUSA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RIGA', 			'PLAYER_EVENT_MINOR_CIV_RIGA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RISHIKESH', 		'PLAYER_EVENT_MINOR_CIV_RISHIKESH' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SADDARVAZEH', 	'PLAYER_EVENT_MINOR_CIV_SADDARVAZEH' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SAMARKAND', 		'PLAYER_EVENT_MINOR_CIV_SAMARKAND' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SANAA', 			'PLAYER_EVENT_MINOR_CIV_SANAA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SANTO_DOMINGO', 	'PLAYER_EVENT_MINOR_CIV_SANTO_DOMINGO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SARNATH', 		'PLAYER_EVENT_MINOR_CIV_SARNATH' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SGANG_GWAAY', 	'PLAYER_EVENT_MINOR_CIV_SGANG_GWAAY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIDON', 			'PLAYER_EVENT_MINOR_CIV_SIDON' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIERRA_LEONE', 	'PLAYER_EVENT_MINOR_CIV_SIERRA_LEONE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SINGAPORE', 		'PLAYER_EVENT_MINOR_CIV_SINGAPORE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SOFIA', 			'PLAYER_EVENT_MINOR_CIV_SOFIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SYDNEY', 		'PLAYER_EVENT_MINOR_CIV_SYDNEY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SUCEAVA', 		'PLAYER_EVENT_MINOR_CIV_SUCEAVA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SURREY', 		'PLAYER_EVENT_MINOR_CIV_SURREY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TAIWAN', 		'PLAYER_EVENT_MINOR_CIV_TAIWAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TBILISI', 		'PLAYER_EVENT_MINOR_CIV_TBILISI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_THIMPHU', 		'PLAYER_EVENT_MINOR_CIV_THIMPHU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TIWANAKU', 		'PLAYER_EVENT_MINOR_CIV_TIWANAKU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TUNIS', 			'PLAYER_EVENT_MINOR_CIV_TUNIS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TYRE', 			'PLAYER_EVENT_MINOR_CIV_TYRE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_UR', 			'PLAYER_EVENT_MINOR_CIV_UR' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA', 		'PLAYER_EVENT_MINOR_CIV_VALLETTA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'PLAYER_EVENT_MINOR_CIV_VANCOUVER' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VATICAN_CITY', 	'PLAYER_EVENT_MINOR_CIV_VATICAN_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VILNIUS', 		'PLAYER_EVENT_MINOR_CIV_VILNIUS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'PLAYER_EVENT_MINOR_CIV_WELLINGTON' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WOOTEI_NIICIE', 	'PLAYER_EVENT_MINOR_CIV_WOOTEI_NIICIE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WITTENBERG', 	'PLAYER_EVENT_MINOR_CIV_WITTENBERG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'PLAYER_EVENT_MINOR_CIV_YANGCHENG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YEREVAN', 		'PLAYER_EVENT_MINOR_CIV_YEREVAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'PLAYER_EVENT_MINOR_CIV_ZANZIBAR' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH', 		'PLAYER_EVENT_MINOR_CIV_ZURICH';

INSERT INTO EventChoice_ResourceQuantity 
			(EventChoiceType, 							ResourceType, 		Quantity)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUDAPEST', 	'RESOURCE_HORSE', 	5;

INSERT INTO EventChoice_BuildingClassYieldChange 
			(EventChoiceType, 								BuildingClassType, 					YieldType, 				YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA', 		'BUILDINGCLASS_VALLETTA', 			'YIELD_FOOD', 			2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA', 		'BUILDINGCLASS_VALLETTA', 			'YIELD_SCIENCE', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_WRITERS_GUILD', 		'YIELD_CULTURE', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_ARTISTS_GUILD', 		'YIELD_CULTURE', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_MUSICIANS_GUILD', 	'YIELD_CULTURE', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_WRITERS_GUILD', 		'YIELD_TOURISM', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_ARTISTS_GUILD', 		'YIELD_TOURISM', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_MUSICIANS_GUILD', 	'YIELD_TOURISM', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONDURAS', 		'BUILDINGCLASS_HARBOR', 			'YIELD_GOLD', 			1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DANO', 			'BUILDINGCLASS_SHRINE', 			'YIELD_CULTURE_LOCAL', 	2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DJIBOUTI', 		'BUILDINGCLASS_GRANARY', 			'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ISKANWAYA', 		'BUILDINGCLASS_AQUEDUCT', 			'YIELD_FAITH', 			1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL', 			'BUILDINGCLASS_PALACE', 			'YIELD_SCIENCE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL', 			'BUILDINGCLASS_MONUMENT', 			'YIELD_SCIENCE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MONACO', 		'BUILDINGCLASS_MARKET', 			'YIELD_CULTURE_LOCAL', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MONACO', 		'BUILDINGCLASS_BANK', 				'YIELD_CULTURE_LOCAL', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE', 		'BUILDINGCLASS_WALLS', 				'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE', 		'BUILDINGCLASS_CASTLE', 			'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH', 		'BUILDINGCLASS_BANK', 				'YIELD_GOLD', 			1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH', 		'BUILDINGCLASS_STOCK_EXCHANGE',		'YIELD_GOLD', 			1;

INSERT INTO EventChoice_BuildingClassYieldModifier 
			(EventChoiceType, 								BuildingClassType, 				YieldType, 			Modifier)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA', 			'BUILDINGCLASS_LHASA', 			'YIELD_FOOD', 		5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA', 			'BUILDINGCLASS_LHASA', 			'YIELD_CULTURE', 	5;

INSERT INTO EventChoice_SpecialistYieldChange 
			(EventChoiceType, 							SpecialistType, 			YieldType, 						YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTWERP', 	'SPECIALIST_MERCHANT', 		'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CANOSSA', 	'SPECIALIST_CIVIL_SERVANT', 'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HANOI', 		'SPECIALIST_CIVIL_SERVANT', 'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HANOI', 		'SPECIALIST_CIVIL_SERVANT', 'YIELD_GREAT_ADMIRAL_POINTS', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONIARA', 	'SPECIALIST_MUSICIAN',		'YIELD_CULTURE_LOCAL', 			1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE', 	'SPECIALIST_ARTIST', 		'YIELD_GOLDEN_AGE_POINTS',	 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MBABANE', 	'SPECIALIST_CIVIL_SERVANT', 'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VILNIUS', 	'SPECIALIST_WRITER', 		'YIELD_GOLD', 					1;

INSERT INTO EventChoice_ImprovementYieldChange 
			(EventChoiceType, 								ImprovementType, 					YieldType, 						YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE', 			'IMPROVEMENT_DOGO_CANARIO', 		'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE', 			'IMPROVEMENT_DOGO_CANARIO', 		'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AL_TIRABIN', 	'IMPROVEMENT_BEDOUIN_CAMP', 		'YIELD_FOOD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AL_TIRABIN', 	'IMPROVEMENT_BEDOUIN_CAMP', 		'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BALKH', 			'IMPROVEMENT_PHROURION', 			'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BALKH', 			'IMPROVEMENT_PHROURION', 			'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 		'IMPROVEMENT_MARSH', 				'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 		'IMPROVEMENT_MARSH', 				'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BYBLOS', 		'IMPROVEMENT_FISHING_BOATS', 		'YIELD_FOOD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA', 		'IMPROVEMENT_MOUND', 				'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA', 		'IMPROVEMENT_MOUND', 				'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE', 		'IMPROVEMENT_QUARRY', 				'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'IMPROVEMENT_FORT', 				'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'IMPROVEMENT_CITADEL', 				'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'IMPROVEMENT_PONTOON_BRIDGE', 		'YIELD_GREAT_GENERAL_POINTS', 	1 WHERE EXISTS (SELECT * FROM Improvements WHERE Type='IMPROVEMENT_PONTOON_BRIDGE') UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_IRUNEA', 		'IMPROVEMENT_FISHING_BOATS', 		'YIELD_FOOD',					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_IRUNEA', 		'IMPROVEMENT_FISHING_BOATS', 		'YIELD_GOLD',					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JERUSALEM', 		'IMPROVEMENT_HOLY_SITE', 			'YIELD_FAITH',					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARYES', 		'IMPROVEMENT_MONASTERY', 			'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARYES', 		'IMPROVEMENT_MONASTERY', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'IMPROVEMENT_BIG_HEAD', 			'YIELD_SCIENCE', 				2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'IMPROVEMENT_BIG_HEAD', 			'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LONGYAN', 		'IMPROVEMENT_TULOU', 				'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LONGYAN', 		'IMPROVEMENT_TULOU', 				'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'IMPROVEMENT_MINE', 				'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU', 		'IMPROVEMENT_DAAQ_AH', 				'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU', 		'IMPROVEMENT_DAAQ_AH', 				'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NYARYANA_MARQ', 	'IMPROVEMENT_CHUM', 				'YIELD_FOOD', 					2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PALMYRA', 		'IMPROVEMENT_FUNERARY_TOWER', 		'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PALMYRA', 		'IMPROVEMENT_FUNERARY_TOWER', 		'YIELD_GOLDEN_AGE_POINTS', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'IMPROVEMENT_CAMP', 				'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'IMPROVEMENT_LUMBERMILL', 			'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RAGUSA', 		'IMPROVEMENT_EMBASSY', 				'YIELD_FOOD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SGANG_GWAAY', 	'IMPROVEMENT_TOTEM_POLE', 			'YIELD_FOOD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SGANG_GWAAY', 	'IMPROVEMENT_TOTEM_POLE', 			'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TIWANAKU', 		'IMPROVEMENT_SUNK_COURT', 			'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TIWANAKU', 		'IMPROVEMENT_SUNK_COURT', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TUNIS', 			'IMPROVEMENT_RIBAT', 				'YIELD_FAITH', 					2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TYRE', 			'IMPROVEMENT_LANDMARK', 			'YIELD_GOLD', 					2;
--SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YAIUWA', 	'IMPROVEMENT_LLAO_LLAO', 			'YIELD_FOOD', 			1 UNION ALL
--SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YAIUWA', 	'IMPROVEMENT_LLAO_LLAO', 			'YIELD_SCIENCE', 			1;

INSERT INTO EventChoice_FeatureYieldChange 
			(EventChoiceType, 							FeatureType, 			YieldType, 			YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 	'FEATURE_MARSH', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 	'FEATURE_MARSH', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 	'FEATURE_FOREST', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 	'FEATURE_JUNGLE', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NAN_MADOL', 	'FEATURE_ATOLL',		'YIELD_PRODUCTION',	1;

INSERT INTO EventChoice_TerrainYieldChange 
			(EventChoiceType, 								TerrainType, 		YieldType, 			YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NAN_MADOL', 		'TERRAIN_OCEAN', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NAN_MADOL', 		'TERRAIN_OCEAN', 	'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NYARYANA_MARQ', 	'TERRAIN_SNOW', 	'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUTITJULU', 		'TERRAIN_DESERT', 	'YIELD_FAITH', 		1;

INSERT INTO EventChoice_ResourceYieldChange 
			(EventChoiceType, 								ResourceType, 				YieldType, 						YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE', 			'RESOURCE_DOGO_CANARIO', 	'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE', 			'RESOURCE_DOGO_CANARIO', 	'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUDAPEST', 		'RESOURCE_HORSE', 			'YIELD_GOLDEN_AGE_POINTS', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JUYUBIT', 		'RESOURCE_FISH', 			'YIELD_FOOD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARASJOHKA', 	'RESOURCE_DEER', 			'YIELD_FOOD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARASJOHKA', 	'RESOURCE_DEER', 			'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARASJOHKA', 	'RESOURCE_REINDEER', 		'YIELD_PRODUCTION', 			2 UNION ALL
--SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YAIUWA', 	'RESOURCE_LLAO_LLAO', 			'YIELD_FOOD', 			1 UNION ALL
--SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YAIUWA', 	'RESOURCE_LLAO_LLAO', 			'YIELD_SCIENCE', 			1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YEREVAN', 		'RESOURCE_HORSE', 			'YIELD_CULTURE', 				1;

-- bonus
INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_JUYUBIT', 		'YIELD_SCIENCE', 					1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_BONUS';

INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'YIELD_FOOD', 						1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_BONUS';

-- luxury
INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'YIELD_GOLD', 						1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'YIELD_FOOD', 						1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'YIELD_TOURISM', 					1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

-- strategic
INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_SURREY',			'YIELD_GREAT_GENERAL_POINTS', 		1, 				Type
FROM Resources WHERE ResourceUsage = 1;

INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'YIELD_FOOD', 						1, 				Type
FROM Resources WHERE ResourceUsage = 1;

-- animals
INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG',		'YIELD_FAITH', 						1, 				Type
FROM Resources WHERE AnimalResource = 1;


UPDATE EventChoices SET ReligiousUnrestModifierGlobal = -5 WHERE Type = 'PLAYER_EVENT_CHOICE_MINOR_CIV_WITTENBERG';
UPDATE EventChoices SET BasicNeedsMedianModifierGlobal = -5 WHERE Type = 'PLAYER_EVENT_CHOICE_MINOR_CIV_SIERRA_LEONE';
---------------------------------------------------
-- Definitions - Improvements and Resources
---------------------------------------------------	
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 									LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_IMPROVEMENT_MARSH', 			'Improvement', 	'Brussels'' Marsh'),
			('ART_DEF_IMPROVEMENT_BIG_HEAD', 		'Improvement', 	'Colossal Head'),
			('ART_DEF_IMPROVEMENT_SUNK_COURT', 		'Improvement', 	'Sunken Courtyard'),
			('ART_DEF_IMPROVEMENT_BEDOUIN_CAMP', 	'Improvement', 	'Bedouin Camp'),
			('ART_DEF_IMPROVEMENT_CHUM', 			'Improvement', 	'Chum'),
			('ART_DEF_IMPROVEMENT_DAAQ_AH', 		'Improvement', 	'Daaq Ah'),
			('ART_DEF_IMPROVEMENT_FUNERARY_TOWER', 	'Improvement', 	'Funerary Tower'),
			('ART_DEF_IMPROVEMENT_MONASTERY', 		'Improvement', 	'Monastery'),
			('ART_DEF_IMPROVEMENT_MOUND', 			'Improvement', 	'Mound'),
			('ART_DEF_IMPROVEMENT_PHROURION', 		'Improvement', 	'Phroúrion'),
			('ART_DEF_IMPROVEMENT_RIBAT', 			'Improvement', 	'Ribat'),
			('ART_DEF_IMPROVEMENT_TORII', 			'Improvement', 	'Torii'),
			('ART_DEF_IMPROVEMENT_TOTEM_POLE', 		'Improvement', 	'Gyáa''aang'),
			('ART_DEF_IMPROVEMENT_TULOU', 			'Improvement', 	'Tulou'),
			('ART_DEF_IMPROVEMENT_DOGO_CANARIO',	'Improvement', 	'Dogo Canario'),
			('ART_DEF_RESOURCE_DOGO_CANARIO',		'Resource', 	'Dogo Canario'),
			('ART_DEF_IMPROVEMENT_LLAO_LLAO',		'Improvement', 	'Llao Llao'),
			('ART_DEF_RESOURCE_LLAO_LLAO',			'Resource', 	'Llao Llao'),
			('ART_DEF_RESOURCE_REINDEER',			'Resource', 	'Reindeer');

INSERT INTO ArtDefine_Landmarks
			(Era, State, 	Scale, 	ImprovementType, 				LayoutHandler, 	ResourceType,	Model, TerrainContour)
SELECT 		Era, State, 	Scale, 	'ART_DEF_IMPROVEMENT_MARSH', 	LayoutHandler, 	ResourceType,	Model, TerrainContour
FROM ArtDefine_Landmarks WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_POLDER';

INSERT INTO ArtDefine_Landmarks
			(Era, State, 	Scale, 	ImprovementType, LayoutHandler, ResourceType,					Model, TerrainContour)
SELECT 		Era, State, 	Scale, 	ImprovementType, LayoutHandler, 'ART_DEF_RESOURCE_REINDEER',	Model, TerrainContour
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_DEER';

INSERT INTO ArtDefine_Landmarks
			(Era, State, 	Scale, 	ImprovementType, LayoutHandler, ResourceType,					Model, TerrainContour)
SELECT 		Era, State, 	Scale, 	ImprovementType, LayoutHandler, 'ART_DEF_RESOURCE_LLAO_LLAO',	Model, TerrainContour
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_CITRUS';

INSERT INTO ArtDefine_Landmarks
			(Era,			State, 					Scale, 	ImprovementType, 						LayoutHandler, 	ResourceType,						Model,									TerrainContour)
VALUES 		('Any',			'Constructed', 			1, 		'ART_DEF_IMPROVEMENT_BIG_HEAD', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'olmec_colossalheads.fxsxml',			1),
			('Any',			'Pillaged', 			1, 		'ART_DEF_IMPROVEMENT_BIG_HEAD', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'olmec_colossalheads_pl.fxsxml',		1),
			('Any',			'Constructed', 			0.65, 	'ART_DEF_IMPROVEMENT_SUNK_COURT', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'chatallata_6.fxsxml',					1),
			('Any',			'Pillaged', 			0.65, 	'ART_DEF_IMPROVEMENT_SUNK_COURT', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'chatallata_6.fxsxml',					1), -- "chatallata_pl.fxsxml" place this after fixing the model
			('Any',			'UnderConstruction', 	0.55, 	'ART_DEF_IMPROVEMENT_BEDOUIN_CAMP', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Tribe_Bedouin.fxsxml',					1), -- add two missing states
			('Any',			'Constructed', 			0.55, 	'ART_DEF_IMPROVEMENT_BEDOUIN_CAMP', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Tribe_Bedouin.fxsxml',					1),
			('Any',			'Pillaged', 			0.55, 	'ART_DEF_IMPROVEMENT_BEDOUIN_CAMP', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Tribe_Bedouin.fxsxml',					1), -- add two missing states
			('Any',			'UnderConstruction', 	1, 		'ART_DEF_IMPROVEMENT_CHUM', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'WoodenTent_HB.fxsxml',					1),
			('Any',			'Constructed', 			1, 		'ART_DEF_IMPROVEMENT_CHUM', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'WoodenTent_B.fxsxml',					1),
			('Any',			'Pillaged', 			1, 		'ART_DEF_IMPROVEMENT_CHUM', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'WoodenTent_PL.fxsxml',					1),
			('Any',			'UnderConstruction', 	0.8, 	'ART_DEF_IMPROVEMENT_DAAQ_AH', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'hb_er_daaq_ah.fxsxml',					1),
			('Any',			'Constructed', 			0.8, 	'ART_DEF_IMPROVEMENT_DAAQ_AH', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'er_daaq_ah.fxsxml',					1),
			('Any',			'Pillaged', 			0.8, 	'ART_DEF_IMPROVEMENT_DAAQ_AH', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'pl_er_daaq_ah.fxsxml',					1),
			('Any',			'UnderConstruction', 	0.8, 	'ART_DEF_IMPROVEMENT_DAAQ_AH', 			'RANDOM', 		'ART_DEF_RESOURCE_COW',				'hb_er_daaq_ah.fxsxml',					1),
			('Any',			'Constructed', 			0.8, 	'ART_DEF_IMPROVEMENT_DAAQ_AH', 			'RANDOM', 		'ART_DEF_RESOURCE_COW',				'er_daaq_ah.fxsxml',					1),
			('Any',			'Pillaged', 			0.8, 	'ART_DEF_IMPROVEMENT_DAAQ_AH', 			'RANDOM', 		'ART_DEF_RESOURCE_COW',				'pl_er_daaq_ah.fxsxml',					1),
			('Any',			'UnderConstruction', 	0.8, 	'ART_DEF_IMPROVEMENT_DAAQ_AH', 			'RANDOM', 		'ART_DEF_RESOURCE_SHEEP',			'hb_er_daaq_ah.fxsxml',					1), -- no support for horses, no goat resource
			('Any',			'Constructed', 			0.8, 	'ART_DEF_IMPROVEMENT_DAAQ_AH', 			'RANDOM', 		'ART_DEF_RESOURCE_SHEEP',			'er_daaq_ah.fxsxml',					1),
			('Any',			'Pillaged', 			0.8, 	'ART_DEF_IMPROVEMENT_DAAQ_AH', 			'RANDOM', 		'ART_DEF_RESOURCE_SHEEP',			'pl_er_daaq_ah.fxsxml',					1),
			('Any',			'UnderConstruction', 	0.9, 	'ART_DEF_IMPROVEMENT_FUNERARY_TOWER', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Palmyra Funerary Towers_HB.fxsxml',	1),
			('Any',			'Constructed', 			0.9, 	'ART_DEF_IMPROVEMENT_FUNERARY_TOWER', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Palmyra Funerary Towers_B.fxsxml',		1),
			('Any',			'Pillaged', 			0.9, 	'ART_DEF_IMPROVEMENT_FUNERARY_TOWER', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Palmyra Funerary Towers_PL.fxsxml',	1),
			('Any',			'UnderConstruction', 	1, 		'ART_DEF_IMPROVEMENT_MONASTERY', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'WTI_HB.fxsxml',						1), -- sistineTI_HB.fxsxml
			('Any',			'Constructed', 			1, 		'ART_DEF_IMPROVEMENT_MONASTERY', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'WTI_B.fxsxml',							1), -- sistineTI_B.fxsxml
			('Any',			'Pillaged', 			1, 		'ART_DEF_IMPROVEMENT_MONASTERY', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'WTI_PL.fxsxml',						1),
			('Any',			'UnderConstruction', 	1.2, 	'ART_DEF_IMPROVEMENT_MOUND', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Serpent Mound_HB.fxsxml',				1),
			('Ancient',		'Constructed', 			1.2, 	'ART_DEF_IMPROVEMENT_MOUND', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Serpent Mound_B.fxsxml',				1),
			('Industrial',	'Constructed', 			1.2, 	'ART_DEF_IMPROVEMENT_MOUND', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Serpent Mound_B_Ex.fxsxml',			1),
			('Any',			'Pillaged', 			1.2, 	'ART_DEF_IMPROVEMENT_MOUND', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Serpent Mound_PL.fxsxml',				1),
			('Any',			'UnderConstruction', 	0.6, 	'ART_DEF_IMPROVEMENT_PHROURION', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Oriental Fort HB.fxsxml',				1),
			('Any',			'Constructed', 			0.6, 	'ART_DEF_IMPROVEMENT_PHROURION', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Oriental Fort B.fxsxml',				1),
			('Any',			'Pillaged', 			0.6, 	'ART_DEF_IMPROVEMENT_PHROURION', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Oriental Fort PL.fxsxml',				1),
			('Any',			'UnderConstruction', 	0.6, 	'ART_DEF_IMPROVEMENT_PHROURION', 		'RANDOM', 		'ART_DEF_RESOURCE_IVORY',			'Oriental Fort HB.fxsxml',				1),
			('Any',			'Constructed', 			0.6, 	'ART_DEF_IMPROVEMENT_PHROURION', 		'RANDOM', 		'ART_DEF_RESOURCE_IVORY',			'Oriental Fort B.fxsxml',				1),
			('Any',			'Pillaged', 			0.6, 	'ART_DEF_IMPROVEMENT_PHROURION', 		'RANDOM', 		'ART_DEF_RESOURCE_IVORY',			'Oriental Fort PL.fxsxml',				1),
			('Any',			'UnderConstruction', 	0.25, 	'ART_DEF_IMPROVEMENT_RIBAT', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'great_mosque_dejenne.fxsxml',			1), -- create separate model
			('Any',			'Constructed', 			0.25, 	'ART_DEF_IMPROVEMENT_RIBAT', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'african_castle.fxsxml',				1), -- create separate model
			('Any',			'Pillaged', 			0.6, 	'ART_DEF_IMPROVEMENT_RIBAT', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Oriental Fort PL.fxsxml',				1), -- create separate model
			('Any',			'UnderConstruction', 	1.2, 	'ART_DEF_IMPROVEMENT_TORII', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Assets/Buildings/Improvements/Monolith/Monolith_ASIA.fxsxml',		1), -- make a model out of Firaxis' one
			('Any',			'Constructed', 			1.2, 	'ART_DEF_IMPROVEMENT_TORII', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Assets/Buildings/Improvements/Monolith/Monolith_ASIA.fxsxml',		1),
			('Any',			'Pillaged', 			1.2, 	'ART_DEF_IMPROVEMENT_TORII', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'Assets/Buildings/Improvements/Monolith/Monolith_PL_ASIA.fxsxml',	1),
			('Any',			'UnderConstruction', 	1, 		'ART_DEF_IMPROVEMENT_TOTEM_POLE', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'totem_pole_HB.fxsxml',					1),
			('Any',			'Constructed', 			1, 		'ART_DEF_IMPROVEMENT_TOTEM_POLE', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'totem_pole_CN.fxsxml',					1),
			('Any',			'Pillaged', 			1, 		'ART_DEF_IMPROVEMENT_TOTEM_POLE', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'totem_pole_PL.fxsxml',					1),
			('Any',			'UnderConstruction', 	0.75, 	'ART_DEF_IMPROVEMENT_TULOU', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'TULOU_HB.fxsxml',						1),
			('Any',			'Constructed', 			0.75, 	'ART_DEF_IMPROVEMENT_TULOU', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'TULOU.fxsxml',							1),
			('Any',			'Pillaged', 			0.75, 	'ART_DEF_IMPROVEMENT_TULOU', 			'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'TULOU_PL.fxsxml',						1),
			('Any',			'UnderConstruction', 	1, 		'ART_DEF_IMPROVEMENT_DOGO_CANARIO',		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'dogs_dummy.fxsxml',					1),
			('Any',			'Any', 					1, 		'ART_DEF_IMPROVEMENT_NONE', 			'RANDOM', 		'ART_DEF_RESOURCE_DOGO_CANARIO',	'dogs_resource.fxsxml',					1),
			('Any',			'UnderConstruction', 	1, 		'ART_DEF_IMPROVEMENT_CAMP', 			'RANDOM', 		'ART_DEF_RESOURCE_DOGO_CANARIO',	'dogs_canario_HB.fxsxml',				1),
			('Any',			'Constructed', 			1, 		'ART_DEF_IMPROVEMENT_CAMP', 			'RANDOM', 		'ART_DEF_RESOURCE_DOGO_CANARIO',	'dogs_canario_CN.fxsxml',				1),
			('Any',			'Pillaged', 			1, 		'ART_DEF_IMPROVEMENT_CAMP', 			'RANDOM', 		'ART_DEF_RESOURCE_DOGO_CANARIO',	'dogs_canario_PL.fxsxml',				1),
			('Any',			'Any', 					0.12, 	'ART_DEF_IMPROVEMENT_NONE', 			'ANIMATED', 	'ART_DEF_RESOURCE_REINDEER',		'resource_reindeer.fxsxml',				1),
			('Any',			'UnderConstruction', 	0.12, 	'ART_DEF_IMPROVEMENT_CAMP', 			'ANIMATED', 	'ART_DEF_RESOURCE_REINDEER',		'resource_reindeer.fxsxml',				1),
			('Any',			'Constructed', 			0.12, 	'ART_DEF_IMPROVEMENT_CAMP', 			'ANIMATED', 	'ART_DEF_RESOURCE_REINDEER',		'resource_reindeer.fxsxml',				1),
			('Any',			'Pillaged', 			0.12, 	'ART_DEF_IMPROVEMENT_CAMP', 			'ANIMATED', 	'ART_DEF_RESOURCE_REINDEER',		'resource_reindeer.fxsxml',				1);
			
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 					TileType, 		Asset)
VALUES 		('ART_DEF_IMPROVEMENT_MARSH', 			'Improvement', 	'sv_BuildMarsh.dds'),
			('ART_DEF_IMPROVEMENT_BIG_HEAD', 		'Improvement', 	'sv_BuildColossalHead.dds'),
			('ART_DEF_IMPROVEMENT_SUNK_COURT', 		'Improvement', 	'sv_BuildSunkenCourtyard.dds'),
			('ART_DEF_IMPROVEMENT_BEDOUIN_CAMP', 	'Improvement', 	'sv_BuildBedouinCamp.dds'),
			('ART_DEF_IMPROVEMENT_CHUM', 			'Improvement', 	'sv_BuildChum.dds'),
			('ART_DEF_IMPROVEMENT_DAAQ_AH', 		'Improvement', 	'sv_BuildDaaqAh.dds'),
			('ART_DEF_IMPROVEMENT_FUNERARY_TOWER', 	'Improvement', 	'sv_BuildFuneraryTower.dds'),
			('ART_DEF_IMPROVEMENT_MONASTERY', 		'Improvement', 	'sv_BuildMonastery2.dds'), -- sv_BuildMonastery1 optional
			('ART_DEF_IMPROVEMENT_MOUND', 			'Improvement', 	'sv_BuildMound.dds'),
			('ART_DEF_IMPROVEMENT_PHROURION', 		'Improvement', 	'sv_BuildPhrourion.dds'),
			('ART_DEF_IMPROVEMENT_RIBAT', 			'Improvement', 	'sv_BuildRibat.dds'),
			('ART_DEF_IMPROVEMENT_TORII', 			'Improvement', 	'sv_BuildTorii.dds'),
			('ART_DEF_IMPROVEMENT_TOTEM_POLE', 		'Improvement', 	'sv_BuildTotemPole.dds'),
			('ART_DEF_IMPROVEMENT_TULOU', 			'Improvement', 	'sv_BuildTulou.dds'),
			('ART_DEF_IMPROVEMENT_DOGO_CANARIO',	'Improvement', 	'sv_ResourceDogoCanario.dds'),
			('ART_DEF_RESOURCE_DOGO_CANARIO', 		'Resource', 	'sv_ResourceDogoCanario.dds'),
			('ART_DEF_IMPROVEMENT_LLAO_LLAO',		'Improvement', 	'sv_ResourceLlaoLlao.dds'),
			('ART_DEF_RESOURCE_LLAO_LLAO', 			'Resource', 	'sv_ResourceLlaoLlao.dds'),
			('ART_DEF_RESOURCE_REINDEER', 			'Resource', 	'sv_ResourceReindeer.dds');

INSERT INTO IconFontMapping 
			(IconName, 					IconFontTexture,			IconMapping)
			-- standard
VALUES		('ICON_RES_DOGO_CANARIO', 	'UCS_RESOURCE_FONT_ATLAS',	1),
			('ICON_RES_LLAO_LLAO', 		'UCS_RESOURCE_FONT_ATLAS',	2),
			('ICON_RES_REINDEER', 		'UCS_RESOURCE_FONT_ATLAS',	3),
			('ICON_RES_4', 				'UCS_RESOURCE_FONT_ATLAS',	4),
			-- city-state
			('ICON_RES_BEER', 			'UCS_RESOURCE_FONT_ATLAS',	5),
			('ICON_RES_CHEESE', 		'UCS_RESOURCE_FONT_ATLAS',	6),
			('ICON_RES_HONEY', 			'UCS_RESOURCE_FONT_ATLAS',	7),
			('ICON_RES_ROPES', 			'UCS_RESOURCE_FONT_ATLAS',	8),
			('ICON_RES_TAPESTRIES', 	'UCS_RESOURCE_FONT_ATLAS',	9),
			('ICON_RES_SCULPTURES', 	'UCS_RESOURCE_FONT_ATLAS',	10),
			('ICON_RES_C3', 			'UCS_RESOURCE_FONT_ATLAS',	11),
			('ICON_RES_C4', 			'UCS_RESOURCE_FONT_ATLAS',	12),
			('ICON_RES_MANUSCRIPTS', 	'UCS_RESOURCE_FONT_ATLAS',	13),
			('ICON_RES_CHAMPAGNE', 		'UCS_RESOURCE_FONT_ATLAS',	14),
			('ICON_RES_MOSAICS', 		'UCS_RESOURCE_FONT_ATLAS',	15),
			('ICON_RES_R4', 			'UCS_RESOURCE_FONT_ATLAS',	16),
			('ICON_RES_GUNPOWDER', 		'UCS_RESOURCE_FONT_ATLAS',	17),
			('ICON_RES_O2', 			'UCS_RESOURCE_FONT_ATLAS',	18),
			('ICON_RES_O3', 			'UCS_RESOURCE_FONT_ATLAS',	19),
			('ICON_RES_O4', 			'UCS_RESOURCE_FONT_ATLAS',	20),
			('ICON_RES_COINS', 			'UCS_RESOURCE_FONT_ATLAS',	21),
			('ICON_RES_M2', 			'UCS_RESOURCE_FONT_ATLAS',	22),
			('ICON_RES_M3', 			'UCS_RESOURCE_FONT_ATLAS',	23),
			('ICON_RES_M4', 			'UCS_RESOURCE_FONT_ATLAS',	24);
---------------------------------------------------
-- Definitions - Improvements
---------------------------------------------------	
INSERT INTO Builds 
			(Type, 						Time, 	ImprovementType, 				Description, 					Help, 									EntityEvent, 				Kill,	HotKey, 	OrderPriority, 	IconIndex, 	IconAtlas)
SELECT 		'BUILD_MARSH', 				600, 	'IMPROVEMENT_MARSH', 			'TXT_KEY_BUILD_MARSH',			'TXT_KEY_BUILD_MARSH_HELP',				'ENTITY_EVENT_IRRIGATE', 	0,		'KB_M', 	97, 			1, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_BIG_HEAD', 			NULL, 	'IMPROVEMENT_BIG_HEAD', 		'TXT_KEY_BUILD_BIG_HEAD', 		'TXT_KEY_BUILD_BIG_HEAD_HELP',			'ENTITY_EVENT_BUILD', 		1,		'KB_H', 	1, 				5, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_SUNK_COURT_HUMAN', 	1, 		'IMPROVEMENT_SUNK_COURT', 		'TXT_KEY_BUILD_SUNK_COURT', 	'TXT_KEY_BUILD_SUNK_COURT_HELP',		'ENTITY_EVENT_BUILD', 		0,		'KB_S', 	1, 				3, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_SUNK_COURT_AI', 		1, 		'IMPROVEMENT_SUNK_COURT', 		'TXT_KEY_BUILD_SUNK_COURT', 	'TXT_KEY_BUILD_SUNK_COURT_HELP',		'ENTITY_EVENT_BUILD', 		1,		'KB_S', 	1, 				3, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_BEDOUIN_CAMP',		500, 	'IMPROVEMENT_BEDOUIN_CAMP', 	'TXT_KEY_BUILD_BEDOUIN_CAMP',	'TXT_KEY_BUILD_BEDOUIN_CAMP_HELP',		'ENTITY_EVENT_BUILD', 		0,		'KB_B', 	1, 				21, 		'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_CHUM',				300, 	'IMPROVEMENT_CHUM', 			'TXT_KEY_BUILD_CHUM',			'TXT_KEY_BUILD_CHUM_HELP',				'ENTITY_EVENT_BUILD', 		0,		'KB_C', 	1, 				13, 		'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_DAAQ_AH',			400, 	'IMPROVEMENT_DAAQ_AH', 			'TXT_KEY_BUILD_DAAQ_AH',		'TXT_KEY_BUILD_DAAQ_AH_HELP',			'ENTITY_EVENT_BUILD', 		0,		'KB_C', 	1, 				23, 		'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_FUNERARY_TOWER',		800, 	'IMPROVEMENT_FUNERARY_TOWER', 	'TXT_KEY_BUILD_FUNERARY_TOWER',	'TXT_KEY_BUILD_FUNERARY_TOWER_HELP',	'ENTITY_EVENT_BUILD', 		0,		'KB_F', 	1, 				7, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_MONASTERY',			800, 	'IMPROVEMENT_MONASTERY', 		'TXT_KEY_BUILD_MONASTERY',		'TXT_KEY_BUILD_MONASTERY_HELP',			'ENTITY_EVENT_BUILD', 		0,		'KB_O', 	1, 				25, /*11*/	'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_MOUND',				800, 	'IMPROVEMENT_MOUND', 			'TXT_KEY_BUILD_MOUND',			'TXT_KEY_BUILD_MOUND_HELP',				'ENTITY_EVENT_BUILD', 		0,		'KB_N', 	1, 				19, 		'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_PHROURION',			900, 	'IMPROVEMENT_PHROURION', 		'TXT_KEY_BUILD_PHROURION',		'TXT_KEY_BUILD_PHROURION_HELP',			'ENTITY_EVENT_BUILD', 		0,		'KB_C', 	1, 				27, 		'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_RIBAT',				900, 	'IMPROVEMENT_RIBAT', 			'TXT_KEY_BUILD_RIBAT',			'TXT_KEY_BUILD_RIBAT_HELP',				'ENTITY_EVENT_BUILD', 		0,		'KB_C', 	1, 				29, 		'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_TORII',				100, 	'IMPROVEMENT_TORII', 			'TXT_KEY_BUILD_TORII',			'TXT_KEY_BUILD_TORII_HELP',				'ENTITY_EVENT_BUILD', 		0,		'KB_C', 	1, 				13, 		'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_TOTEM_POLE',			500, 	'IMPROVEMENT_TOTEM_POLE', 		'TXT_KEY_BUILD_TOTEM_POLE',		'TXT_KEY_BUILD_TOTEM_POLE_HELP',		'ENTITY_EVENT_BUILD', 		0,		'KB_T', 	1, 				9, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_TULOU',				1300, 	'IMPROVEMENT_TULOU', 			'TXT_KEY_BUILD_TULOU',			'TXT_KEY_BUILD_TULOU_HELP',				'ENTITY_EVENT_BUILD', 		0,		'KB_U', 	1, 				17, 		'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_DOGO_CANARIO',		700, 	'IMPROVEMENT_DOGO_CANARIO',		'TXT_KEY_BUILD_DOGO_CANARIO',	'TXT_KEY_BUILD_DOGO_CANARIO_HELP',		'ENTITY_EVENT_BUILD', 		0,		'KB_D', 	1, 				15, 		'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_LLAO_LLAO',			1000, 	'IMPROVEMENT_LLAO_LLAO',		'TXT_KEY_BUILD_LLAO_LLAO',		'TXT_KEY_BUILD_LLAO_LLAO_HELP',			'ENTITY_EVENT_BUILD', 		0,		'KB_L', 	1, 				1, 			'UCS_IMPROVEMENT_ATLAS';

INSERT INTO Unit_Builds 
			(UnitType, 				BuildType)
SELECT 		'UNIT_WORKER', 			'BUILD_MARSH' UNION ALL
SELECT 		'UNIT_ENGINEER', 		'BUILD_BIG_HEAD' UNION ALL
SELECT 		'UNIT_SCIENTIST', 		'BUILD_BIG_HEAD' UNION ALL
SELECT 		'UNIT_ARTIST', 			'BUILD_BIG_HEAD' UNION ALL
SELECT 		'UNIT_PROPHET', 		'BUILD_BIG_HEAD' UNION ALL
SELECT 		'UNIT_SISQENO', 		'BUILD_SUNK_COURT_HUMAN' UNION ALL
SELECT 		'UNIT_SISQENO_WORKER', 	'BUILD_SUNK_COURT_AI' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_BEDOUIN_CAMP' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_CHUM' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_DAAQ_AH' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_FUNERARY_TOWER' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_MONASTERY' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_MOUND' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_PHROURION' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_RIBAT' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_TORII' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_TOTEM_POLE' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_TULOU' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_DOGO_CANARIO' UNION ALL
SELECT 		'UNIT_WORKER', 			'BUILD_LLAO_LLAO';

INSERT INTO Unit_Builds 
			(UnitType, 				BuildType)
SELECT 		'UNIT_TEAAT', 			BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_WORKBOAT';

INSERT INTO BuildFeatures 
			(BuildType, 				FeatureType, 		PrereqTech, 			Time, 	Production, 	Remove)
SELECT 		'BUILD_MARSH', 				'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40,			 	1 UNION ALL
SELECT 		'BUILD_MARSH', 				'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_SUNK_COURT_HUMAN', 	'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		NULL, 	0, 				1 UNION ALL
SELECT 		'BUILD_SUNK_COURT_HUMAN', 	'FEATURE_FOREST', 	'TECH_MINING', 			NULL, 	0, 				1 UNION ALL
SELECT 		'BUILD_SUNK_COURT_HUMAN', 	'FEATURE_MARSH',	'TECH_MASONRY', 		NULL, 	0, 				1 UNION ALL
SELECT 		'BUILD_SUNK_COURT_AI', 		'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		NULL, 	0, 				1 UNION ALL
SELECT 		'BUILD_SUNK_COURT_AI', 		'FEATURE_FOREST', 	'TECH_MINING', 			NULL, 	0, 				1 UNION ALL
SELECT 		'BUILD_SUNK_COURT_AI', 		'FEATURE_MARSH',	'TECH_MASONRY', 		NULL, 	0, 				1 UNION ALL
SELECT 		'BUILD_BEDOUIN_CAMP', 		'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_BEDOUIN_CAMP', 		'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_BEDOUIN_CAMP', 		'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1 UNION ALL
SELECT 		'BUILD_DAAQ_AH', 			'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_DAAQ_AH', 			'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_DAAQ_AH', 			'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1 UNION ALL
SELECT 		'BUILD_FUNERARY_TOWER', 	'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_FUNERARY_TOWER', 	'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_FUNERARY_TOWER', 	'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1 UNION ALL
SELECT 		'BUILD_MONASTERY', 			'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_MONASTERY', 			'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_MONASTERY', 			'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1 UNION ALL
SELECT 		'BUILD_MOUND', 				'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_MOUND', 				'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_MOUND', 				'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1 UNION ALL
SELECT 		'BUILD_RIBAT', 				'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_RIBAT', 				'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_RIBAT', 				'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1 UNION ALL
SELECT 		'BUILD_TOTEM_POLE', 		'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_TOTEM_POLE', 		'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_TOTEM_POLE', 		'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1 UNION ALL
SELECT 		'BUILD_TULOU', 				'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_TULOU', 				'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_TULOU', 				'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1 UNION ALL
SELECT 		'BUILD_DOGO_CANARIO', 		'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_DOGO_CANARIO',		'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_DOGO_CANARIO', 		'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1;
------------------------------
INSERT INTO Improvements 
			(Type, 							Description, 							Civilopedia, 								Help, 										ArtDefineTag, 							PortraitIndex, 	IconAtlas)
SELECT 		'IMPROVEMENT_CITY', 			'TXT_KEY_IMPROVEMENT_CITY', 			NULL, 										NULL, 										'ART_DEF_IMPROVEMENT_NONE', 			39, 			'TERRAIN_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_MARSH', 			'TXT_KEY_IMPROVEMENT_MARSH', 			'TXT_KEY_CIV5_IMPROVEMENTS_MARSH', 			'TXT_KEY_IMPROVEMENT_MARSH_HELP', 			'ART_DEF_IMPROVEMENT_MARSH', 			0, 				'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'TXT_KEY_IMPROVEMENT_BIG_HEAD', 		'TXT_KEY_CIV5_IMPROVEMENTS_BIG_HEAD', 		'TXT_KEY_IMPROVEMENT_BIG_HEAD_HELP', 		'ART_DEF_IMPROVEMENT_BIG_HEAD', 		4, 				'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 		'TXT_KEY_IMPROVEMENT_SUNK_COURT', 		'TXT_KEY_CIV5_IMPROVEMENTS_SUNK_COURT', 	'TXT_KEY_IMPROVEMENT_SUNK_COURT_HELP', 		'ART_DEF_IMPROVEMENT_SUNK_COURT', 		2, 				'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_BEDOUIN_CAMP', 	'TXT_KEY_IMPROVEMENT_BEDOUIN_CAMP', 	'TXT_KEY_CIV5_IMPROVEMENTS_BEDOUIN_CAMP', 	'TXT_KEY_IMPROVEMENT_BEDOUIN_CAMP_HELP', 	'ART_DEF_IMPROVEMENT_BEDOUIN_CAMP', 	20, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 			'TXT_KEY_IMPROVEMENT_CHUM', 			'TXT_KEY_CIV5_IMPROVEMENTS_CHUM', 			'TXT_KEY_IMPROVEMENT_CHUM_HELP', 			'ART_DEF_IMPROVEMENT_CHUM', 			12, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_DAAQ_AH', 			'TXT_KEY_IMPROVEMENT_DAAQ_AH', 			'TXT_KEY_CIV5_IMPROVEMENTS_DAAQ_AH', 		'TXT_KEY_IMPROVEMENT_DAAQ_AH_HELP', 		'ART_DEF_IMPROVEMENT_DAAQ_AH', 			22, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_FUNERARY_TOWER', 	'TXT_KEY_IMPROVEMENT_FUNERARY_TOWER', 	'TXT_KEY_CIV5_IMPROVEMENTS_FUNERARY_TOWER', 'TXT_KEY_IMPROVEMENT_FUNERARY_TOWER_HELP', 	'ART_DEF_IMPROVEMENT_FUNERARY_TOWER', 	6, 				'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 		'TXT_KEY_IMPROVEMENT_MONASTERY', 		'TXT_KEY_CIV5_IMPROVEMENTS_MONASTERY', 		'TXT_KEY_IMPROVEMENT_MONASTERY_HELP', 		'ART_DEF_IMPROVEMENT_MONASTERY', 		24, /*10*/		'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 			'TXT_KEY_IMPROVEMENT_MOUND', 			'TXT_KEY_CIV5_IMPROVEMENTS_MOUND', 			'TXT_KEY_IMPROVEMENT_MOUND_HELP', 			'ART_DEF_IMPROVEMENT_MOUND', 			18, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 		'TXT_KEY_IMPROVEMENT_PHROURION', 		'TXT_KEY_CIV5_IMPROVEMENTS_PHROURION', 		'TXT_KEY_IMPROVEMENT_PHROURION_HELP', 		'ART_DEF_IMPROVEMENT_PHROURION', 		26, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_RIBAT', 			'TXT_KEY_IMPROVEMENT_RIBAT', 			'TXT_KEY_CIV5_IMPROVEMENTS_RIBAT', 			'TXT_KEY_IMPROVEMENT_RIBAT_HELP', 			'ART_DEF_IMPROVEMENT_RIBAT', 			28, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_TORII', 			'TXT_KEY_IMPROVEMENT_TORII', 			'TXT_KEY_CIV5_IMPROVEMENTS_TORII', 			'TXT_KEY_IMPROVEMENT_TORII_HELP', 			'ART_DEF_IMPROVEMENT_TORII', 			12, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 		'TXT_KEY_IMPROVEMENT_TOTEM_POLE', 		'TXT_KEY_CIV5_IMPROVEMENTS_TOTEM_POLE', 	'TXT_KEY_IMPROVEMENT_TOTEM_POLE_HELP', 		'ART_DEF_IMPROVEMENT_TOTEM_POLE', 		8, 				'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_TULOU', 			'TXT_KEY_IMPROVEMENT_TULOU', 			'TXT_KEY_CIV5_IMPROVEMENTS_TULOU', 			'TXT_KEY_IMPROVEMENT_TULOU_HELP', 			'ART_DEF_IMPROVEMENT_TULOU', 			16, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_DOGO_CANARIO',		'TXT_KEY_IMPROVEMENT_DOGO_CANARIO',		'TXT_KEY_CIV5_IMPROVEMENTS_DOGO_CANARIO', 	'TXT_KEY_IMPROVEMENT_DOGO_CANARIO_HELP',	'ART_DEF_IMPROVEMENT_DOGO_CANARIO', 	14, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_LLAO_LLAO',		'TXT_KEY_IMPROVEMENT_LLAO_LLAO',		'TXT_KEY_CIV5_IMPROVEMENTS_LLAO_LLAO', 		'TXT_KEY_IMPROVEMENT_LLAO_LLAO_HELP',		'ART_DEF_IMPROVEMENT_LLAO_LLAO', 		0, 				'UCS_IMPROVEMENT_ATLAS';

UPDATE Improvements SET Coastal = 1, RemoveWhenComplete = 1, CreatesFeature = 'FEATURE_MARSH' WHERE Type = 'IMPROVEMENT_MARSH';
UPDATE Improvements SET PillageGold = 12, CreatedByGreatPerson = 1 WHERE Type = 'IMPROVEMENT_BIG_HEAD';
UPDATE Improvements SET NoTwoAdjacent = 1, RequiresFlatlands = 1, PillageGold = 15 WHERE Type = 'IMPROVEMENT_SUNK_COURT';
UPDATE Improvements SET NoTwoAdjacent = 1, NoAdjacentCity = 1, PillageGold = 24 WHERE Type = 'IMPROVEMENT_BEDOUIN_CAMP';
UPDATE Improvements SET NoTwoAdjacent = 1, PillageGold = 15 WHERE Type = 'IMPROVEMENT_CHUM';
UPDATE Improvements SET PillageGold = 13 WHERE Type = 'IMPROVEMENT_DAAQ_AH';
UPDATE Improvements SET RequiresFlatlands = 1, PillageGold = 23, OutsideBorders = 1 WHERE Type = 'IMPROVEMENT_FUNERARY_TOWER';
UPDATE Improvements SET NoTwoAdjacent = 1, NoAdjacentCity = 1, HillsMakesValid = 1, PillageGold = 18 WHERE Type = 'IMPROVEMENT_MONASTERY';
UPDATE Improvements SET NoTwoAdjacent = 1, DefenseModifier = 15, PillageGold = 17 WHERE Type = 'IMPROVEMENT_MOUND';
UPDATE Improvements SET FreshWaterMakesValid = 1, NoTwoAdjacent = 1, NoAdjacentCity = 1, DefenseModifier = 40, NoFollowUp = 1, MakesPassable = 1, PillageGold = 27 WHERE Type = 'IMPROVEMENT_PHROURION';
UPDATE Improvements SET NoTwoAdjacent = 1, NoAdjacentCity = 1, DefenseModifier = 15, PillageGold = 24 WHERE Type = 'IMPROVEMENT_RIBAT';
UPDATE Improvements SET PillageGold = 9 WHERE Type = 'IMPROVEMENT_TOTEM_POLE'; -- Coastal requirement is now one of the possibilities, so moved to lua
UPDATE Improvements SET HillsMakesValid = 1, DefenseModifier = 30, NoFollowUp = 1, PillageGold = 25 WHERE Type = 'IMPROVEMENT_TULOU';
UPDATE Improvements SET NoTwoAdjacent = 1 WHERE Type = 'IMPROVEMENT_DOGO_CANARIO'; -- Hill requirement is moved to lua, as it conflicts with valid terrains?
UPDATE Improvements SET Coastal = 1 WHERE Type = 'IMPROVEMENT_LLAO_LLAO';

UPDATE ArtDefine_Landmarks SET Scale = 0.75 WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_MOTTE_BAILEY';
UPDATE Units SET WorkRate = 100 WHERE Type = 'UNIT_MISSIONARY';

INSERT INTO Improvement_ValidTerrains 
			(ImprovementType, 				TerrainType)
SELECT 		'IMPROVEMENT_MARSH', 			'TERRAIN_PLAINS' UNION ALL
SELECT 		'IMPROVEMENT_MARSH', 			'TERRAIN_GRASS' UNION ALL
SELECT 		'IMPROVEMENT_MARSH', 			'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_MARSH', 			'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_MARSH', 			'TERRAIN_SNOW' UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 		'TERRAIN_PLAINS' UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 		'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 		'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_BEDOUIN_CAMP', 	'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 			'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 			'TERRAIN_SNOW' UNION ALL
SELECT 		'IMPROVEMENT_DAAQ_AH', 			'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_DAAQ_AH', 			'TERRAIN_PLAINS' UNION ALL
SELECT 		'IMPROVEMENT_FUNERARY_TOWER', 	'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 			'TERRAIN_GRASS' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 			'TERRAIN_PLAINS' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 			'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 			'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 		'TERRAIN_PLAINS' UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 		'TERRAIN_GRASS' UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 		'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 		'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 		'TERRAIN_SNOW' UNION ALL
SELECT 		'IMPROVEMENT_RIBAT', 			'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE',		'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_DOGO_CANARIO',		'TERRAIN_PLAINS' UNION ALL
SELECT 		'IMPROVEMENT_DOGO_CANARIO',		'TERRAIN_GRASS';

INSERT INTO Improvement_ValidFeatures
			(ImprovementType, 			FeatureType)
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'FEATURE_FOREST' UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'FEATURE_JUNGLE' UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 	'FEATURE_FOREST' UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 	'FEATURE_JUNGLE' UNION ALL
SELECT 		'IMPROVEMENT_LLAO_LLAO', 	'FEATURE_FOREST' UNION ALL
SELECT 		'IMPROVEMENT_LLAO_LLAO', 	'FEATURE_JUNGLE';

INSERT INTO Improvement_Yields 
			(ImprovementType, 				YieldType, 						Yield)
SELECT 		'IMPROVEMENT_MARSH', 			'YIELD_FOOD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'YIELD_SCIENCE', 				1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'YIELD_CULTURE', 				2 UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 		'YIELD_FAITH', 					2 UNION ALL
SELECT 		'IMPROVEMENT_BEDOUIN_CAMP', 	'YIELD_GOLD',					1 UNION ALL
SELECT 		'IMPROVEMENT_DAAQ_AH', 			'YIELD_FOOD',					1 UNION ALL
SELECT 		'IMPROVEMENT_FUNERARY_TOWER', 	'YIELD_FAITH',					1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 		'YIELD_GOLD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 		'YIELD_FAITH', 					1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 			'YIELD_GOLD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 		'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_RIBAT', 			'YIELD_FAITH',					1 UNION ALL
SELECT 		'IMPROVEMENT_RIBAT', 			'YIELD_GREAT_GENERAL_POINTS',	1 UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 		'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_TULOU', 			'YIELD_FOOD',					1 UNION ALL
SELECT 		'IMPROVEMENT_TULOU', 			'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_TULOU', 			'YIELD_CULTURE',				1 UNION ALL
SELECT 		'IMPROVEMENT_DOGO_CANARIO',		'YIELD_FOOD',					1 UNION ALL
SELECT 		'IMPROVEMENT_LLAO_LLAO',		'YIELD_FOOD',					1;

INSERT INTO Improvement_FreshWaterYields
			(ImprovementType, 		YieldType, 		Yield)
SELECT 		'IMPROVEMENT_DAAQ_AH', 	'YIELD_FOOD', 	2;

/*INSERT INTO Improvement_FeatureYieldChanges
			(ImprovementType, 			FeatureType, 			YieldType, 				Yield)
SELECT 		'IMPROVEMENT_PHROURION', 	'FEATURE_FOREST',		'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 	'FEATURE_JUNGLE',		'YIELD_GOLD', 			1;*/

INSERT INTO Improvement_YieldPerXAdjacentImprovement
			(ImprovementType,				OtherImprovementType,			YieldType,						Yield,	NumRequired)
SELECT		'IMPROVEMENT_FARM',				'IMPROVEMENT_BIG_HEAD',			'YIELD_PRODUCTION',				1,		1 UNION ALL -- former Improvement_AdjacentImprovementYieldChanges
SELECT		'IMPROVEMENT_MINE',				'IMPROVEMENT_BIG_HEAD',			'YIELD_PRODUCTION',				1,		1 UNION ALL
SELECT		'IMPROVEMENT_QUARRY',			'IMPROVEMENT_BIG_HEAD',			'YIELD_PRODUCTION',				1,		1 UNION ALL
SELECT		'IMPROVEMENT_CAMP',				'IMPROVEMENT_CHUM',				'YIELD_GOLD',					1,		1 UNION ALL
SELECT		'IMPROVEMENT_PASTURE',			'IMPROVEMENT_CHUM',				'YIELD_GOLD',					1,		1 UNION ALL
SELECT		'IMPROVEMENT_DAAQ_AH',			'IMPROVEMENT_CHUM',				'YIELD_GOLD',					1,		1 UNION ALL
SELECT		'IMPROVEMENT_CHUM',				'IMPROVEMENT_CAMP',				'YIELD_PRODUCTION',				1,		1 UNION ALL
SELECT		'IMPROVEMENT_CHUM',				'IMPROVEMENT_PASTURE',			'YIELD_PRODUCTION',				1,		1 UNION ALL
SELECT		'IMPROVEMENT_CHUM',				'IMPROVEMENT_DAAQ_AH',			'YIELD_PRODUCTION',				1,		1 UNION ALL
SELECT		'IMPROVEMENT_TRADING_POST',		'IMPROVEMENT_MONASTERY',		'YIELD_PRODUCTION',				1,		1 UNION ALL
SELECT		'IMPROVEMENT_CUSTOMS_HOUSE',	'IMPROVEMENT_MONASTERY',		'YIELD_PRODUCTION',				1,		1 UNION ALL
SELECT		'IMPROVEMENT_TRADING_POST',		'IMPROVEMENT_MOUND',			'YIELD_GOLD',					1,		1 UNION ALL
SELECT		'IMPROVEMENT_CUSTOMS_HOUSE',	'IMPROVEMENT_MOUND',			'YIELD_GOLD',					1,		1 UNION ALL
SELECT		'IMPROVEMENT_RIBAT',			'IMPROVEMENT_TRADING_POST',		'YIELD_CULTURE',				1,		1 UNION ALL
SELECT		'IMPROVEMENT_RIBAT',			'IMPROVEMENT_CUSTOMS_HOUSE',	'YIELD_CULTURE',				1,		1 UNION ALL
SELECT		'IMPROVEMENT_TOTEM_POLE',		'IMPROVEMENT_TRADING_POST',		'YIELD_CULTURE',				1,		1 UNION ALL
SELECT		'IMPROVEMENT_TOTEM_POLE',		'IMPROVEMENT_CUSTOMS_HOUSE',	'YIELD_CULTURE',				1,		1 UNION ALL
SELECT		'IMPROVEMENT_DAAQ_AH',			'IMPROVEMENT_DAAQ_AH',			'YIELD_CULTURE_LOCAL',			1,		1 UNION ALL -- former Improvement_YieldAdjacentSameType
SELECT		'IMPROVEMENT_FUNERARY_TOWER',	'IMPROVEMENT_FUNERARY_TOWER',	'YIELD_FAITH',					1,		1 UNION ALL
SELECT		'IMPROVEMENT_BIG_HEAD',			'IMPROVEMENT_BIG_HEAD',			'YIELD_GOLDEN_AGE_POINTS',		1,		2 UNION ALL -- former Improvement_YieldAdjacentTwoSameType
SELECT		'IMPROVEMENT_BIG_HEAD',			'IMPROVEMENT_BIG_HEAD',			'YIELD_GREAT_GENERAL_POINTS',	1,		2 UNION ALL
SELECT		'IMPROVEMENT_BIG_HEAD',			'IMPROVEMENT_BIG_HEAD',			'YIELD_GREAT_ADMIRAL_POINTS',	1,		2 UNION ALL
SELECT		'IMPROVEMENT_FUNERARY_TOWER',	'IMPROVEMENT_FUNERARY_TOWER',	'YIELD_CULTURE',				1,		2 UNION ALL
SELECT		'IMPROVEMENT_TOTEM_POLE',		'IMPROVEMENT_TOTEM_POLE',		'YIELD_GOLDEN_AGE_POINTS',		1,		2;

-- obsoleted
/*INSERT INTO Improvement_AdjacentImprovementYieldChanges
			(ImprovementType, 				OtherImprovementType, 			YieldType, 				Yield)
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'IMPROVEMENT_FARM',				'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'IMPROVEMENT_MINE',				'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'IMPROVEMENT_QUARRY',			'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 			'IMPROVEMENT_CAMP',				'YIELD_GOLD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 			'IMPROVEMENT_PASTURE',			'YIELD_GOLD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 			'IMPROVEMENT_DAAQ_AH',			'YIELD_GOLD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_CAMP', 			'IMPROVEMENT_CHUM',				'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_PASTURE', 			'IMPROVEMENT_CHUM',				'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_DAAQ_AH', 			'IMPROVEMENT_CHUM',				'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 		'IMPROVEMENT_TRADING_POST',		'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 		'IMPROVEMENT_CUSTOMS_HOUSE',	'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 			'IMPROVEMENT_TRADING_POST',		'YIELD_GOLD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 			'IMPROVEMENT_CUSTOMS_HOUSE',	'YIELD_GOLD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_TRADING_POST',		'IMPROVEMENT_RIBAT',			'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'IMPROVEMENT_CUSTOMS_HOUSE', 	'IMPROVEMENT_RIBAT',			'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'IMPROVEMENT_TRADING_POST',		'IMPROVEMENT_TOTEM_POLE',		'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'IMPROVEMENT_CUSTOMS_HOUSE', 	'IMPROVEMENT_TOTEM_POLE',		'YIELD_CULTURE', 		1;

INSERT INTO Improvement_YieldAdjacentSameType
			(ImprovementType, 				YieldType, 				Yield)
SELECT 		'IMPROVEMENT_DAAQ_AH', 			'YIELD_CULTURE_LOCAL', 	1 UNION ALL
SELECT 		'IMPROVEMENT_FUNERARY_TOWER', 	'YIELD_FAITH', 			1;

INSERT INTO Improvement_YieldAdjacentTwoSameType
			(ImprovementType, 				YieldType, 						Yield)
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'YIELD_GOLDEN_AGE_POINTS', 		1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'YIELD_GREAT_ADMIRAL_POINTS', 	1 UNION ALL
SELECT 		'IMPROVEMENT_FUNERARY_TOWER', 	'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 		'YIELD_GOLDEN_AGE_POINTS', 		1;*/

INSERT INTO Improvement_AdjacentTerrainYieldChanges
			(ImprovementType, 			TerrainType, 		YieldType, 						Yield)
SELECT 		'IMPROVEMENT_TOTEM_POLE', 	'TERRAIN_COAST',	'YIELD_GOLDEN_AGE_POINTS', 		1;

INSERT INTO Improvement_AdjacentFeatureYieldChanges
			(ImprovementType, 				FeatureType, 				YieldType, 			Yield)
SELECT 		'IMPROVEMENT_BEDOUIN_CAMP', 	'FEATURE_OASIS',			'YIELD_FOOD', 		1 UNION ALL
SELECT 		'IMPROVEMENT_BEDOUIN_CAMP', 	'FEATURE_FLOOD_PLAINS',		'YIELD_FOOD', 		1;

INSERT INTO Improvement_RouteYieldChanges
			(ImprovementType, 				RouteType, 			YieldType, 					Yield)
SELECT 		'IMPROVEMENT_FUNERARY_TOWER', 	'ROUTE_ROAD',		'YIELD_PRODUCTION', 		1 UNION ALL
SELECT 		'IMPROVEMENT_FUNERARY_TOWER', 	'ROUTE_RAILROAD',	'YIELD_PRODUCTION', 		1 UNION ALL
SELECT 		'IMPROVEMENT_FUNERARY_TOWER', 	'ROUTE_RAILROAD',	'YIELD_GOLDEN_AGE_POINTS', 	1 UNION ALL
SELECT 		'IMPROVEMENT_BEDOUIN_CAMP', 	'ROUTE_ROAD',		'YIELD_GOLD', 				1 UNION ALL
SELECT 		'IMPROVEMENT_BEDOUIN_CAMP', 	'ROUTE_RAILROAD',	'YIELD_GOLD',				2 UNION ALL
SELECT 		'IMPROVEMENT_RIBAT', 			'ROUTE_ROAD',		'YIELD_FAITH', 				1 UNION ALL
SELECT 		'IMPROVEMENT_RIBAT', 			'ROUTE_RAILROAD',	'YIELD_FAITH',				1 UNION ALL
SELECT 		'IMPROVEMENT_RIBAT', 			'ROUTE_RAILROAD',	'YIELD_GOLD',				1;

INSERT INTO Improvement_AdjacentCityYields
			(ImprovementType, 			YieldType, 					Yield)
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'YIELD_GOLDEN_AGE_POINTS', 	1 UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'YIELD_SCIENCE', 			1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 		'YIELD_GOLDEN_AGE_POINTS', 	1 UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 	'YIELD_CULTURE', 			1;

INSERT INTO Improvement_AdjacentMountainYieldChanges
			(ImprovementType, 			YieldType, 			Yield)
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'YIELD_SCIENCE', 	1 UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 	'YIELD_FAITH', 		1;

INSERT INTO Improvement_TechYieldChanges
			(ImprovementType, 				TechType, 					YieldType, 						Yield)
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'TECH_CONSTRUCTION',		'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'TECH_MACHINERY',			'YIELD_GOLDEN_AGE_POINTS', 		2 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'TECH_ARCHITECTURE',		'YIELD_SCIENCE', 				3 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 		'TECH_SCIENTIFIC_THEORY',	'YIELD_PRODUCTION', 			2 UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 		'TECH_THEOLOGY',			'YIELD_FAITH', 					2 UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 		'TECH_ARCHAEOLOGY',			'YIELD_TOURISM', 				1 UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 		'TECH_RADAR',				'YIELD_SCIENCE', 				1 UNION ALL
SELECT 		'IMPROVEMENT_BEDOUIN_CAMP', 	'TECH_COMPASS',				'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'IMPROVEMENT_BEDOUIN_CAMP', 	'TECH_ASTRONOMY',			'YIELD_FOOD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_BEDOUIN_CAMP', 	'TECH_ECONOMICS',			'YIELD_GOLD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_BEDOUIN_CAMP', 	'TECH_RADIO',				'YIELD_GOLD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_BEDOUIN_CAMP', 	'TECH_RADAR',				'YIELD_FOOD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 			'TECH_PHILOSOPHY',			'YIELD_GOLD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 			'TECH_EDUCATION',			'YIELD_FOOD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 			'TECH_FERTILIZER',			'YIELD_FOOD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 			'TECH_REFRIGERATION',		'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_DAAQ_AH', 			'TECH_IRON_WORKING',		'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_DAAQ_AH', 			'TECH_CHIVALRY',			'YIELD_GOLD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_DAAQ_AH', 			'TECH_FERTILIZER',			'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_DAAQ_AH', 			'TECH_BIOLOGY',				'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_FUNERARY_TOWER', 	'TECH_WRITING',				'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'IMPROVEMENT_FUNERARY_TOWER', 	'TECH_THEOLOGY',			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'IMPROVEMENT_FUNERARY_TOWER', 	'TECH_ARCHITECTURE',		'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'IMPROVEMENT_FUNERARY_TOWER', 	'TECH_DYNAMITE',			'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 		'TECH_MASONRY',				'YIELD_FAITH', 					1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 		'TECH_THEOLOGY',			'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 		'TECH_SCIENTIFIC_THEORY',	'YIELD_TOURISM', 				1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 		'TECH_ELECTRICITY',			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 			'TECH_CURRENCY',			'YIELD_GOLD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 			'TECH_GUILDS',				'YIELD_GOLD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 			'TECH_ARCHITECTURE',		'YIELD_SCIENCE', 				1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 			'TECH_MILITARY_SCIENCE',	'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 		'TECH_MATHEMATICS',			'YIELD_FOOD',					1 UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 		'TECH_MACHINERY',			'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 		'TECH_ARCHITECTURE',		'YIELD_GOLD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_PHROURION', 		'TECH_RAILROAD',			'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_RIBAT', 			'TECH_ENGINEERING',			'YIELD_CULTURE',				1 UNION ALL
SELECT 		'IMPROVEMENT_RIBAT', 			'TECH_ARCHITECTURE',		'YIELD_FAITH', 					1 UNION ALL
SELECT 		'IMPROVEMENT_RIBAT', 			'TECH_MILITARY_SCIENCE',	'YIELD_FAITH', 					1 UNION ALL
SELECT 		'IMPROVEMENT_RIBAT', 			'TECH_COMBINED_ARMS',		'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 		'TECH_COMPASS',				'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 		'TECH_NAVIGATION',			'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 		'TECH_ARCHAEOLOGY',			'YIELD_TOURISM', 				1 UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 		'TECH_REPLACEABLE_PARTS',	'YIELD_TOURISM', 				1 UNION ALL
SELECT 		'IMPROVEMENT_TULOU', 			'TECH_ENGINEERING',			'YIELD_FOOD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_TULOU', 			'TECH_CIVIL_SERVICE',		'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_TULOU', 			'TECH_ARCHITECTURE',		'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'IMPROVEMENT_TULOU', 			'TECH_MILITARY_SCIENCE',	'YIELD_GREAT_GENERAL_POINTS', 	1;

INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType, 				ImprovementType, 			YieldType, 			Yield)
SELECT 		'POLICY_NEW_DEAL', 			'IMPROVEMENT_BIG_HEAD', 	'YIELD_CULTURE', 	3/* UNION ALL
SELECT 		'POLICY_CIVIL_SOCIETY', 	'IMPROVEMENT_MOUND', 		'YIELD_FOOD', 		4 UNION ALL
SELECT 		'POLICY_FIVE_YEAR_PLAN', 	'IMPROVEMENT_MOUND', 		'YIELD_PRODUCTION', 3 UNION ALL
SELECT 		'POLICY_MOBILIZATION', 		'IMPROVEMENT_MOUND', 		'YIELD_SCIENCE', 	3 UNION ALL
SELECT 		'POLICY_CIVIL_SOCIETY', 	'IMPROVEMENT_SUNK_COURT', 	'YIELD_FOOD', 		4 UNION ALL
SELECT 		'POLICY_FIVE_YEAR_PLAN', 	'IMPROVEMENT_SUNK_COURT', 	'YIELD_PRODUCTION', 3 UNION ALL
SELECT 		'POLICY_MOBILIZATION', 		'IMPROVEMENT_SUNK_COURT', 	'YIELD_SCIENCE', 	3 UNION ALL
SELECT 		'POLICY_CIVIL_SOCIETY', 	'IMPROVEMENT_MONASTERY', 	'YIELD_FOOD', 		4 UNION ALL
SELECT 		'POLICY_FIVE_YEAR_PLAN', 	'IMPROVEMENT_MONASTERY', 	'YIELD_PRODUCTION', 3 UNION ALL
SELECT 		'POLICY_MOBILIZATION', 		'IMPROVEMENT_MONASTERY', 	'YIELD_SCIENCE', 	3 UNION ALL
SELECT 		'POLICY_CIVIL_SOCIETY', 	'IMPROVEMENT_TOTEM_POLE', 	'YIELD_FOOD', 		4 UNION ALL
SELECT 		'POLICY_FIVE_YEAR_PLAN', 	'IMPROVEMENT_TOTEM_POLE', 	'YIELD_PRODUCTION', 3 UNION ALL
SELECT 		'POLICY_MOBILIZATION', 		'IMPROVEMENT_TOTEM_POLE', 	'YIELD_SCIENCE', 	3 UNION ALL
SELECT 		'POLICY_CIVIL_SOCIETY', 	'IMPROVEMENT_CHUM', 		'YIELD_FOOD', 		4 UNION ALL
SELECT 		'POLICY_FIVE_YEAR_PLAN', 	'IMPROVEMENT_CHUM', 		'YIELD_PRODUCTION', 3 UNION ALL
SELECT 		'POLICY_MOBILIZATION', 		'IMPROVEMENT_CHUM', 		'YIELD_SCIENCE', 	3 UNION ALL
SELECT 		'POLICY_CIVIL_SOCIETY', 	'IMPROVEMENT_TULOU', 		'YIELD_FOOD', 		4 UNION ALL
SELECT 		'POLICY_FIVE_YEAR_PLAN', 	'IMPROVEMENT_TULOU', 		'YIELD_PRODUCTION', 3 UNION ALL
SELECT 		'POLICY_MOBILIZATION', 		'IMPROVEMENT_TULOU', 		'YIELD_SCIENCE', 	3*/;

-- Resource-Improvement relations moved further!!!
-- Resource yields moved further!!!

INSERT INTO Improvement_Flavors 	
			(ImprovementType, 				FlavorType, 			Flavor)
VALUES		('IMPROVEMENT_MARSH',			'FLAVOR_GROWTH',		30),
			('IMPROVEMENT_MARSH',			'FLAVOR_CULTURE',		30),
			('IMPROVEMENT_MARSH',			'FLAVOR_GOLD',			30),
			('IMPROVEMENT_BIG_HEAD',		'FLAVOR_SCIENCE',		100),
			('IMPROVEMENT_BIG_HEAD',		'FLAVOR_PRODUCTION',	90),
			('IMPROVEMENT_BIG_HEAD',		'FLAVOR_CULTURE',		80),
			('IMPROVEMENT_BIG_HEAD',		'FLAVOR_OFFENSE',		30),
			('IMPROVEMENT_SUNK_COURT',		'FLAVOR_RELIGION',		100),
			('IMPROVEMENT_SUNK_COURT',		'FLAVOR_CULTURE',		80),
			('IMPROVEMENT_SUNK_COURT',		'FLAVOR_SCIENCE',		20),
			('IMPROVEMENT_BEDOUIN_CAMP',	'FLAVOR_GROWTH',		80),
			('IMPROVEMENT_BEDOUIN_CAMP',	'FLAVOR_GOLD',			80),
			('IMPROVEMENT_BEDOUIN_CAMP',	'FLAVOR_CULTURE',		40),
			('IMPROVEMENT_CHUM',			'FLAVOR_GROWTH',		100),
			('IMPROVEMENT_CHUM',			'FLAVOR_PRODUCTION',	70),
			('IMPROVEMENT_CHUM',			'FLAVOR_GOLD',			30),
			('IMPROVEMENT_FUNERARY_TOWER',	'FLAVOR_RELIGION',		100),
			('IMPROVEMENT_FUNERARY_TOWER',	'FLAVOR_CULTURE',		30),
			('IMPROVEMENT_FUNERARY_TOWER',	'FLAVOR_PRODUCTION',	30),
			('IMPROVEMENT_FUNERARY_TOWER',	'FLAVOR_GOLD',			30),
			('IMPROVEMENT_FUNERARY_TOWER',	'FLAVOR_SCIENCE',		10),
			('IMPROVEMENT_MONASTERY',		'FLAVOR_RELIGION',		100),
			('IMPROVEMENT_MONASTERY',		'FLAVOR_PRODUCTION',	70),
			('IMPROVEMENT_MONASTERY',		'FLAVOR_CULTURE',		10),
			('IMPROVEMENT_MONASTERY',		'FLAVOR_GOLD',			10),
			('IMPROVEMENT_MONASTERY',		'FLAVOR_DIPLOMACY',		10),
			('IMPROVEMENT_MOUND',			'FLAVOR_GOLD',			100),
			('IMPROVEMENT_MOUND',			'FLAVOR_DEFENSE',		30),
			('IMPROVEMENT_MOUND',			'FLAVOR_PRODUCTION',	20),
			('IMPROVEMENT_MOUND',			'FLAVOR_CULTURE',		20),
			('IMPROVEMENT_MOUND',			'FLAVOR_OFFENSE',		10),
			('IMPROVEMENT_MOUND',			'FLAVOR_SCIENCE',		10),
			('IMPROVEMENT_MOUND',			'FLAVOR_RELIGION',		10),
			('IMPROVEMENT_PHROURION',		'FLAVOR_PRODUCTION',	90),
			('IMPROVEMENT_PHROURION',		'FLAVOR_RELIGION',		90),
			('IMPROVEMENT_PHROURION',		'FLAVOR_GOLD',			10),
			('IMPROVEMENT_PHROURION',		'FLAVOR_GROWTH',		10),
			('IMPROVEMENT_RIBAT',			'FLAVOR_RELIGION',		60),
			('IMPROVEMENT_RIBAT',			'FLAVOR_DEFENSE',		50),
			('IMPROVEMENT_RIBAT',			'FLAVOR_OFFENSE',		50),
			('IMPROVEMENT_RIBAT',			'FLAVOR_CULTURE',		30),
			('IMPROVEMENT_RIBAT',			'FLAVOR_GOLD',			10),
			('IMPROVEMENT_TOTEM_POLE',		'FLAVOR_PRODUCTION',	90),
			('IMPROVEMENT_TOTEM_POLE',		'FLAVOR_CULTURE',		70),
			('IMPROVEMENT_TOTEM_POLE',		'FLAVOR_GROWTH',		20),
			('IMPROVEMENT_TOTEM_POLE',		'FLAVOR_NAVAL',			20),
			('IMPROVEMENT_TULOU',			'FLAVOR_DEFENSE',		90),
			('IMPROVEMENT_TULOU',			'FLAVOR_CULTURE',		40),
			('IMPROVEMENT_TULOU',			'FLAVOR_PRODUCTION',	30),
			('IMPROVEMENT_TULOU',			'FLAVOR_GROWTH',		30),
			('IMPROVEMENT_TULOU',			'FLAVOR_OFFENSE',		10),
			('IMPROVEMENT_DOGO_CANARIO',	'FLAVOR_GROWTH',		100),
			('IMPROVEMENT_DOGO_CANARIO',	'FLAVOR_PRODUCTION',	70),
			('IMPROVEMENT_DOGO_CANARIO',	'FLAVOR_GOLD',			30),
			('IMPROVEMENT_DOGO_CANARIO',	'FLAVOR_CULTURE',		10),
			('IMPROVEMENT_DOGO_CANARIO',	'FLAVOR_RELIGION',		10),
			('IMPROVEMENT_LLAO_LLAO',		'FLAVOR_GROWTH',		100),
			('IMPROVEMENT_LLAO_LLAO',		'FLAVOR_HAPPINESS',		80),
			('IMPROVEMENT_LLAO_LLAO',		'FLAVOR_CULTURE',		10),
			('IMPROVEMENT_LLAO_LLAO',		'FLAVOR_SCIENCE',		10);
---------------------------------------------------
-- Definitions - Resources
---------------------------------------------------	
INSERT INTO Resources 
			(Type,						TechReveal,		TechImproveable,		TechCityTrade, 			Description,						Civilopedia, 							Help,										ResourceClassType, 			IsMonopoly, 	ArtDefineTag, 						CivilizationType,		OnlyMinorCivs,  Happiness,  ResourceUsage, SeaResource,	AnimalResource,	PlantResource,	RockResource,	IconString, 				PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_DOGO_CANARIO',	null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_DOGO_CANARIO',	'TXT_KEY_RESOURCE_DOGO_CANARIO_TEXT',	'TXT_KEY_RESOURCE_DOGO_CANARIO_MONOPOLY',	'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_DOGO_CANARIO',	null,					0,				2,			2,				0,			1,				0,				0,				'[ICON_RES_DOGO_CANARIO]',	0, 				'UCS_RESOURCE_ATLAS'),
			('RESOURCE_LLAO_LLAO',		null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_LLAO_LLAO',		'TXT_KEY_RESOURCE_LLAO_LLAO_TEXT',		'TXT_KEY_RESOURCE_LLAO_LLAO_MONOPOLY',		'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_LLAO_LLAO',		null,					0,				2,			2,				0,			0,				1,				0,				'[ICON_RES_LLAO_LLAO]',		1, 				'UCS_RESOURCE_ATLAS'),
			('RESOURCE_REINDEER',		null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_REINDEER',		'TXT_KEY_RESOURCE_REINDEER_TEXT',		'TXT_KEY_RESOURCE_REINDEER_MONOPOLY',		'RESOURCECLASS_BONUS',		0,				'ART_DEF_RESOURCE_REINDEER',		null,					0,				0,			0,				0,			1,				0,				0,				'[ICON_RES_REINDEER]',		2, 				'UCS_RESOURCE_ATLAS'),
			('RESOURCE_BEER',			null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_BEER',			'TXT_KEY_RESOURCE_BEER_TEXT',			'TXT_KEY_RESOURCE_BEER_MONOPOLY',			'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_BEER',			null,					0,				2,			2,				0,			0,				0,				0,				'[ICON_RES_BEER]',			4, 				'UCS_RESOURCE_ATLAS'),
			('RESOURCE_CHEESE',			null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_CHEESE',			'TXT_KEY_RESOURCE_CHEESE_TEXT',			'TXT_KEY_RESOURCE_CHEESE_MONOPOLY',			'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_CHEESE',			null,					0,				2,			2,				0,			0,				0,				0,				'[ICON_RES_CHEESE]',		5, 				'UCS_RESOURCE_ATLAS'),
			('RESOURCE_HONEY',			null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_HONEY',			'TXT_KEY_RESOURCE_HONEY_TEXT',			'TXT_KEY_RESOURCE_HONEY_MONOPOLY',			'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_HONEY',			null,					0,				2,			2,				0,			0,				0,				0,				'[ICON_RES_HONEY]',			6, 				'UCS_RESOURCE_ATLAS'),
			('RESOURCE_ROPES',			null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_ROPES',			'TXT_KEY_RESOURCE_ROPES_TEXT',			'TXT_KEY_RESOURCE_ROPES_MONOPOLY',			'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_ROPES',			null,					0,				2,			2,				0,			0,				0,				0,				'[ICON_RES_ROPES]',			7, 				'UCS_RESOURCE_ATLAS'),
			('RESOURCE_TAPESTRIES',		null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_TAPESTRIES',		'TXT_KEY_RESOURCE_TAPESTRIES_TEXT',		'TXT_KEY_RESOURCE_TAPESTRIES_MONOPOLY',		'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_TAPESTRIES',		null,					0,				2,			2,				0,			0,				0,				0,				'[ICON_RES_TAPESTRIES]',	8, 				'UCS_RESOURCE_ATLAS'),
			('RESOURCE_SCULPTURES',		null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_SCULPTURES',		'TXT_KEY_RESOURCE_SCULPTURES_TEXT',		'TXT_KEY_RESOURCE_SCULPTURES_MONOPOLY',		'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_SCULPTURES',		null,					0,				2,			2,				0,			0,				0,				0,				'[ICON_RES_SCULPTURES]',	9, 				'UCS_RESOURCE_ATLAS'),
			('RESOURCE_MANUSCRIPTS',	null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_MANUSCRIPTS',		'TXT_KEY_RESOURCE_MANUSCRIPTS_TEXT',	'TXT_KEY_RESOURCE_MANUSCRIPTS_MONOPOLY',	'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_MANUSCRIPTS',		null,					0,				2,			2,				0,			0,				0,				0,				'[ICON_RES_MANUSCRIPTS]',	12, 			'UCS_RESOURCE_ATLAS'), -- 2, 'EXPANSION_SCEN_TECH_ATLAS'
			('RESOURCE_CHAMPAGNE',		null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_CHAMPAGNE',		'TXT_KEY_RESOURCE_CHAMPAGNE_TEXT',		'TXT_KEY_RESOURCE_CHAMPAGNE_MONOPOLY',		'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_CHAMPAGNE',		null,					0,				2,			2,				0,			0,				0,				0,				'[ICON_RES_CHAMPAGNE]',		13, 			'UCS_RESOURCE_ATLAS'),
			('RESOURCE_MOSAICS',		null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_MOSAICS',			'TXT_KEY_RESOURCE_MOSAICS_TEXT',		'TXT_KEY_RESOURCE_MOSAICS_MONOPOLY',		'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_MOSAICS',			null,					0,				2,			2,				0,			0,				0,				0,				'[ICON_RES_MOSAICS]',		14, 			'UCS_RESOURCE_ATLAS'),
			('RESOURCE_GUNPOWDER',		null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_GUNPOWDER',		'TXT_KEY_RESOURCE_GUNPOWDER_TEXT',		'TXT_KEY_RESOURCE_GUNPOWDER_MONOPOLY',		'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_GUNPOWDER',		null,					0,				2,			2,				0,			0,				0,				0,				'[ICON_RES_GUNPOWDER]',		16, 			'UCS_RESOURCE_ATLAS'),
			('RESOURCE_COINS',			null,			'TECH_AGRICULTURE',		'TECH_AGRICULTURE',		'TXT_KEY_RESOURCE_COINS',			'TXT_KEY_RESOURCE_COINS_TEXT',			'TXT_KEY_RESOURCE_COINS_MONOPOLY',			'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_COINS',			null,					1,				2,			2,				0,			0,				0,				0,				'[ICON_RES_COINS]',			20, 			'UCS_RESOURCE_ATLAS');
---------------------------------------------------------
DELETE FROM Resource_YieldChanges WHERE ResourceType IN ('RESOURCE_GLASS', 'RESOURCE_JEWELRY', 'RESOURCE_PORCELAIN');
UPDATE Resources SET MonopolyHappiness = 0 WHERE Type IN ('RESOURCE_GLASS', 'RESOURCE_JEWELRY');
UPDATE Resources SET MonopolyGALength = 0, OnlyMinorCivs = 0 WHERE Type IN ('RESOURCE_PORCELAIN');

INSERT INTO Language_en_US
			(Tag, 										Text)
SELECT		'TXT_KEY_RESOURCE_GLASS_MONOPOLY',			'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] Each currently applied Happiness or flat-yield [ICON_VP_MONOPOLY] Global Monopoly modifier gains an additional +1 bonus, and percentage-based [ICON_VP_MONOPOLY] Global Monopoly modifier gains an additional +1% bonus.' UNION ALL
SELECT		'TXT_KEY_RESOURCE_JEWELRY_MONOPOLY',		'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_GREAT_MERCHANT] Great Merchant Points in all owned Cities.' UNION ALL
SELECT		'TXT_KEY_RESOURCE_PORCELAIN_MONOPOLY',		'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +15% [ICON_PRODUCTION] Production towards Archaeologist Units in all owned Cities.';

UPDATE Resources SET Help = 'TXT_KEY_RESOURCE_GLASS_MONOPOLY' WHERE Type IN ('RESOURCE_GLASS');
UPDATE Resources SET Help = 'TXT_KEY_RESOURCE_JEWELRY_MONOPOLY' WHERE Type IN ('RESOURCE_JEWELRY');
UPDATE Resources SET Help = 'TXT_KEY_RESOURCE_PORCELAIN_MONOPOLY' WHERE Type IN ('RESOURCE_PORCELAIN');
---------------------------------------------------------
UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]Nearby [ICON_RES_DOGO_CANARIO]: +2 [ICON_PRODUCTION] Production.' WHERE Tag = 'TXT_KEY_BUILDING_STOCKYARD_HELP';
UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]Nearby [ICON_RES_REINDEER]: +2 [ICON_FOOD] Food.' WHERE Tag = 'TXT_KEY_BUILDING_STABLE_HELP';
---------------------------------------------------------
UPDATE Resources SET MonopolyHappiness = 2 WHERE Type = 'RESOURCE_LLAO_LLAO';

INSERT INTO Resource_CityYieldModFromMonopoly
			(ResourceType, 				YieldType, 				Yield)
VALUES		('RESOURCE_DOGO_CANARIO',	'YIELD_FOOD',			3),
			('RESOURCE_DOGO_CANARIO',	'YIELD_PRODUCTION',		3),
			('RESOURCE_LLAO_LLAO',		'YIELD_FOOD',			3);

INSERT INTO Resource_MonopolyGreatPersonRateModifiers
			(ResourceType, 			SpecialistType, 		IsGlobalMonopoly,	IsStrategicMonopoly,	Modifier)
VALUES		('RESOURCE_BEER',		'SPECIALIST_ENGINEER',	1,					0,						10),
			('RESOURCE_JEWELRY',	'SPECIALIST_MERCHANT',	1,					0,						10),
			('RESOURCE_SCULPTURES',	'SPECIALIST_ARTIST',	1,					0,						10);
---------------------------------------------------------
INSERT INTO Resource_YieldChanges
			(ResourceType, 				YieldType, 				Yield)
VALUES		('RESOURCE_DOGO_CANARIO',	'YIELD_FOOD',			1),
			('RESOURCE_LLAO_LLAO',		'YIELD_FOOD',			1),
			('RESOURCE_REINDEER',		'YIELD_FOOD',			1),
			('RESOURCE_REINDEER',		'YIELD_CULTURE',		1);

INSERT INTO Building_ResourceYieldChanges
			(BuildingType,				ResourceType, 				YieldType, 				Yield)
VALUES		('BUILDING_STOCKYARD',		'RESOURCE_DOGO_CANARIO',	'YIELD_PRODUCTION',		2),
			('BUILDING_STABLE',			'RESOURCE_REINDEER',		'YIELD_FOOD',			2);

INSERT INTO Improvement_ResourceTypes
			(ImprovementType,			ResourceType, 				ResourceMakesValid, ResourceTrade)
VALUES		('IMPROVEMENT_CAMP',		'RESOURCE_DOGO_CANARIO',	1,					1),
			('IMPROVEMENT_PLANTATION',	'RESOURCE_LLAO_LLAO',		1,					1),
			('IMPROVEMENT_CAMP',		'RESOURCE_REINDEER',		1,					1),
			('IMPROVEMENT_CITY',		'RESOURCE_BEER',			1,					1),
			('IMPROVEMENT_CITY',		'RESOURCE_CHEESE',			1,					1),
			('IMPROVEMENT_CITY',		'RESOURCE_HONEY',			1,					1),
			('IMPROVEMENT_CITY',		'RESOURCE_ROPES',			1,					1),
			('IMPROVEMENT_CITY',		'RESOURCE_PORCELAIN',		1,					1),
			('IMPROVEMENT_CITY',		'RESOURCE_TAPESTRIES',		1,					1),
			('IMPROVEMENT_CITY',		'RESOURCE_SCULPTURES',		1,					1),
			('IMPROVEMENT_CITY',		'RESOURCE_CHAMPAGNE',		1,					1),
			('IMPROVEMENT_CITY',		'RESOURCE_MANUSCRIPTS',		1,					1),
			('IMPROVEMENT_CITY',		'RESOURCE_MOSAICS',			1,					1),
			('IMPROVEMENT_CITY',		'RESOURCE_GUNPOWDER',		1,					1);

INSERT INTO Improvement_ResourceType_Yields
			(ImprovementType,			ResourceType, 				YieldType, 				Yield)
VALUES		('IMPROVEMENT_CAMP',		'RESOURCE_DOGO_CANARIO',	'YIELD_FOOD',			1),
			('IMPROVEMENT_CAMP',		'RESOURCE_DOGO_CANARIO',	'YIELD_PRODUCTION',		1),
			('IMPROVEMENT_PLANTATION',	'RESOURCE_LLAO_LLAO',		'YIELD_FOOD',			1),
			('IMPROVEMENT_PLANTATION',	'RESOURCE_LLAO_LLAO',		'YIELD_CULTURE',		1);

INSERT INTO Improvement_ResourceType_Yields
			(ImprovementType,		ResourceType, 				YieldType, 				Yield)
SELECT		ImprovementType,		'RESOURCE_REINDEER',		YieldType,				Yield
FROM Improvement_ResourceType_Yields WHERE ResourceType = 'RESOURCE_DEER';
---------------------------------------------------------
-- moved from improvements for the compatibility!!!
INSERT INTO Improvement_ResourceTypes	(ImprovementType, 			ResourceType, 	ResourceMakesValid, ResourceTrade,	DiscoveryRand,	QuantityRequirement)
SELECT DISTINCT							'IMPROVEMENT_BIG_HEAD',		Type,			1,					1,				0,				0
FROM Resources WHERE ResourceUsage = 1;

INSERT INTO Improvement_ResourceTypes	(ImprovementType, 			ResourceType, 	ResourceMakesValid, ResourceTrade,	DiscoveryRand,	QuantityRequirement)
SELECT DISTINCT							'IMPROVEMENT_DAAQ_AH',		Type,			1,					1,				0,				0
FROM Resources WHERE Type IN ('RESOURCE_COW', 'RESOURCE_SHEEP'/*, 'RESOURCE_HORSE'*/);

INSERT INTO Improvement_ResourceTypes	(ImprovementType, 			ResourceType, 	ResourceMakesValid, ResourceTrade,	DiscoveryRand,	QuantityRequirement)
SELECT DISTINCT							'IMPROVEMENT_PHROURION',	Type,			1,					1,				0,				0
FROM Resources WHERE Type IN ('RESOURCE_IVORY');


INSERT INTO Improvement_AdjacentResourceYieldChanges
			(ImprovementType, 			ResourceType, 				YieldType, 				Yield)
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'RESOURCE_STONE',			'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'RESOURCE_MARBLE',			'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_DAAQ_AH', 		'RESOURCE_DOGO_CANARIO',	'YIELD_FOOD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_DAAQ_AH', 		'RESOURCE_DOGO_CANARIO',	'YIELD_GOLD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_PASTURE', 		'RESOURCE_DOGO_CANARIO',	'YIELD_FOOD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_PASTURE', 		'RESOURCE_DOGO_CANARIO',	'YIELD_GOLD', 			1;

INSERT INTO Improvement_AdjacentResourceYieldChanges	(ImprovementType, 			ResourceType, 	YieldType, 				Yield)
SELECT DISTINCT											'IMPROVEMENT_CHUM',			Type,			'YIELD_FOOD', 			1
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_BONUS';

INSERT INTO Improvement_AdjacentResourceYieldChanges	(ImprovementType, 			ResourceType, 	YieldType, 				Yield)
SELECT DISTINCT											'IMPROVEMENT_BEDOUIN_CAMP',	Type,			'YIELD_PRODUCTION', 	1
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';
---------------------------------------------------------
INSERT INTO Resource_Flavors 	
			(ResourceType, 				FlavorType, 			Flavor)
VALUES		('RESOURCE_DOGO_CANARIO',	'FLAVOR_GROWTH',		40),
			('RESOURCE_DOGO_CANARIO',	'FLAVOR_PRODUCTION',	20),
			('RESOURCE_DOGO_CANARIO',	'FLAVOR_CULTURE',		10),
			('RESOURCE_DOGO_CANARIO',	'FLAVOR_GOLD',			10),
			('RESOURCE_DOGO_CANARIO',	'FLAVOR_RELIGION',		10),
			('RESOURCE_LLAO_LLAO',		'FLAVOR_GROWTH',		30),
			('RESOURCE_LLAO_LLAO',		'FLAVOR_HAPPINESS',		30),
			('RESOURCE_LLAO_LLAO',		'FLAVOR_CULTURE',		10),
			('RESOURCE_LLAO_LLAO',		'FLAVOR_SCIENCE',		10),
			('RESOURCE_REINDEER',		'FLAVOR_PRODUCTION',	30),
			('RESOURCE_REINDEER',		'FLAVOR_GROWTH',		20),
			('RESOURCE_REINDEER',		'FLAVOR_CULTURE',		10);
---------------------------------------------------
-- Definitions - Mercenary and Unique Units
---------------------------------------------------	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_SWISS_GUARD', 	'Unit', 	'sv_UnitSwissGuard.dds'),
			('ART_DEF_UNIT_GURKHA', 		'Unit', 	'sv_UnitGurkha.dds'),
			('ART_DEF_UNIT_SISQENO', 		'Unit', 	'sv_UnitSisqeno.dds'),
			('ART_DEF_UNIT_NIHANG', 		'Unit', 	'sv_UnitNihang.dds'),
			('ART_DEF_UNIT_SAKA', 			'Unit', 	'sv_UnitSaka.dds'),
			('ART_DEF_UNIT_TEAAT', 			'Unit', 	'sv_UnitTeaat.dds');
------------------------------
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_TEAAT', 			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_WORKBOAT';

INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_SISQENO', 		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MISSIONARY';

INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_SWISS_GUARD', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PIKEMAN';

INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_NIHANG', 			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_LONGSWORDSMAN';

INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_GURKHA', 			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_RIFLEMAN';

INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_SAKA', 			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_MONGOLIAN_KESHIK';
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		'ART_DEF_UNIT_TEAAT', 			'ART_DEF_UNIT_MEMBER_TEAAT', 		3
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_WORKBOAT';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		'ART_DEF_UNIT_SISQENO', 		'ART_DEF_UNIT_MEMBER_SISQENO', 		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MISSIONARY';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		'ART_DEF_UNIT_SWISS_GUARD', 	'ART_DEF_UNIT_MEMBER_SWISS_GUARD', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PIKEMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		'ART_DEF_UNIT_NIHANG', 			'ART_DEF_UNIT_MEMBER_NIHANG', 		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_LONGSWORDSMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		'ART_DEF_UNIT_GURKHA', 			'ART_DEF_UNIT_MEMBER_GURKHA', 		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		'ART_DEF_UNIT_SAKA', 			'ART_DEF_UNIT_MEMBER_SAKA', 		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_MONGOLIAN_KESHIK';
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_TEAAT',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WORKBOAT';

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_SISQENO',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MISSIONARY';

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_SWISS_GUARD',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_NIHANG',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_GURKHA',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_SAKA',			EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_MONGOLIAN_KESHIK';
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_TEAAT',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WORKBOAT';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_SISQENO',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MISSIONARY';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_SWISS_GUARD',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_NIHANG',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_GURKHA',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_SAKA',			"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_MONGOLIAN_KESHIK';
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_TEAAT',		0.040,	ZOffset, Domain, 'anan_model.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_WORKBOAT';

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_SISQENO',		Scale,	ZOffset, Domain, 'amauta.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MISSIONARY';

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_SWISS_GUARD',	Scale,	ZOffset, Domain, 'reislaufer.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_NIHANG',		Scale,	ZOffset, Domain, 'Akali_blue.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_GURKHA',		Scale,	ZOffset, Domain, 'gurkha.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_SAKA',			Scale,	ZOffset, Domain, 'Horseman_Mongol.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_MONGOLIAN_KESHIK';
------------------------------
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		UnitType||'_OF_DALI', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType IN ('UNIT_CARAVAN'/*, 'UNIT_CARGO_SHIP'*/);

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_TEAAT',			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WORKBOAT';

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_SISQENO',			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_SWISS_GUARD', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PIKEMAN';

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_NIHANG',			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_LONGSWORDSMAN';

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_GURKHA',			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_SAKA',			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MONGOLIAN_KESHIK';
------------------------------
INSERT INTO UnitClasses
					(Type,				Description, MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
SELECT DISTINCT 	Type||'_OF_DALI',	Description, MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit||'_OF_DALI'
FROM UnitClasses WHERE Type IN ('UNITCLASS_CARAVAN'/*, 'UNIT_CARGO_SHIP'*/);

INSERT INTO UnitClasses
					(Type,						Description,					MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
SELECT DISTINCT 	'UNITCLASS_TEAAT',			'TXT_KEY_UNIT_TEAAT',			MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, 'UNIT_TEAAT'
FROM UnitClasses WHERE Type = 'UNITCLASS_WORKBOAT';

INSERT INTO UnitClasses
					(Type,						Description,					MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
SELECT DISTINCT 	'UNITCLASS_SISQENO',		'TXT_KEY_UNIT_SISQENO',			MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, 'UNIT_SISQENO'
FROM UnitClasses WHERE Type = 'UNITCLASS_MISSIONARY';

INSERT INTO UnitClasses
					(Type,						Description,					MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
SELECT DISTINCT 	'UNITCLASS_SISQENO_WORKER',	'TXT_KEY_UNIT_SISQENO_WORKER',	MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, 'UNIT_SISQENO_WORKER'
FROM UnitClasses WHERE Type = 'UNITCLASS_MISSIONARY';

INSERT INTO UnitClasses
					(Type,						Description,					MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
SELECT DISTINCT 	'UNITCLASS_SWISS_GUARD',	'TXT_KEY_UNIT_SWISS_GUARD',		MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, 'UNIT_SWISS_GUARD'
FROM UnitClasses WHERE Type = 'UNITCLASS_FCOMPANY';

INSERT INTO UnitClasses
					(Type,						Description,					MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
SELECT DISTINCT 	'UNITCLASS_NIHANG',			'TXT_KEY_UNIT_NIHANG',			MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, 'UNIT_NIHANG'
FROM UnitClasses WHERE Type = 'UNITCLASS_LONGSWORDSMAN';

INSERT INTO UnitClasses
					(Type,						Description,					MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
SELECT DISTINCT 	'UNITCLASS_GURKHA',			'TXT_KEY_UNIT_GURKHA',			MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, 'UNIT_GURKHA'
FROM UnitClasses WHERE Type = 'UNITCLASS_RIFLEMAN';

INSERT INTO UnitClasses
					(Type,						Description,					MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
SELECT DISTINCT 	'UNITCLASS_SAKA',			'TXT_KEY_UNIT_SAKA',			MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, 'UNIT_SAKA'
FROM UnitClasses WHERE Type = 'UNITCLASS_HORSE_ARCHER';
------------------------------
------------------------------
-- civilians
INSERT INTO Units
					(Type,					Class,						Description,				Civilopedia,						Strategy,								Help,								NoMinorCivGift,	NoMinorGifts,	Cost,		FaithCost,		Moves,		Immobile, BaseSightRange, PurchaseOnly,	MoveAfterPurchase,	Capture,	CombatClass, Domain, CivilianAttackPriority,	DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, PrereqTech,				ObsoleteTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	WorkRate,	MinAreaSize, NukeDamageLevel,	SpreadReligion,	ReligionSpreads, ReligiousStrength,	CombatLimit, Trade, XPValueAttack,	XPValueDefense, Conscription,	NoMaintenance, UnitArtInfo,				UnitArtInfoEraVariation,	ShowInPedia, MoveRate, UnitFlagIconOffset, PortraitIndex, IconAtlas,			UnitFlagAtlas,			MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted, ProductionCostAddedPerEra)
SELECT DISTINCT 	Type||'_OF_DALI',		Class||'_OF_DALI',			Description,				Civilopedia,						Strategy,								Help,								1,				1,				-1,			200,			Moves,		Immobile, BaseSightRange, PurchaseOnly,	MoveAfterPurchase,	Capture,	CombatClass, Domain, CivilianAttackPriority,	DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, PrereqTech||'_UCS_DUMMY', ObsoleteTech,	GoodyHutUpgradeUnitClass,	-1,					WorkRate,	MinAreaSize, NukeDamageLevel,	SpreadReligion,	ReligionSpreads, ReligiousStrength,	CombatLimit, Trade, XPValueAttack,	XPValueDefense, Conscription,	NoMaintenance, UnitArtInfo,				UnitArtInfoEraVariation,	ShowInPedia, MoveRate, UnitFlagIconOffset, PortraitIndex, IconAtlas,			UnitFlagAtlas,			MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted, ProductionCostAddedPerEra
FROM Units WHERE Type IN ('UNIT_CARAVAN'/*, 'UNIT_CARGO_SHIP'*/);

INSERT INTO Units
					(Type,					Class,						Description,				Civilopedia,						Strategy,								Help,								NoMinorCivGift,	NoMinorGifts,	Cost,		FaithCost,		Moves,		Immobile, BaseSightRange, PurchaseOnly,	MoveAfterPurchase,	Capture,	CombatClass, Domain, CivilianAttackPriority,	DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, PrereqTech,				ObsoleteTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	WorkRate,	MinAreaSize, NukeDamageLevel,	SpreadReligion,	ReligionSpreads, ReligiousStrength,	CombatLimit, Trade, XPValueAttack,	XPValueDefense, Conscription,	NoMaintenance, UnitArtInfo,				UnitArtInfoEraVariation,	ShowInPedia, MoveRate, UnitFlagIconOffset,	PortraitIndex,	IconAtlas,			UnitFlagAtlas,			MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted, ProductionCostAddedPerEra)
SELECT DISTINCT 	'UNIT_TEAAT',			'UNITCLASS_TEAAT',			'TXT_KEY_UNIT_TEAAT',		'TXT_KEY_CIV5_UNIT_TEAAT',			'TXT_KEY_UNIT_TEAAT_STRATEGY',			'TXT_KEY_UNIT_TEAAT_HELP',			1,				1,				Cost-15,	FaithCost,		Moves+1,	Immobile, BaseSightRange, PurchaseOnly,	MoveAfterPurchase,	Capture,	CombatClass, Domain, CivilianAttackPriority,	DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, PrereqTech,				ObsoleteTech,	GoodyHutUpgradeUnitClass,	-1,					WorkRate,	MinAreaSize, NukeDamageLevel,	SpreadReligion,	ReligionSpreads, ReligiousStrength,	CombatLimit, Trade, XPValueAttack,	XPValueDefense, Conscription,	NoMaintenance, 'ART_DEF_UNIT_TEAAT',	0,							ShowInPedia, MoveRate, 5,					5,				'UCS_UNIT_ATLAS',	'UCS_UNIT_FLAG_ATLAS',	MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted, ProductionCostAddedPerEra
FROM Units WHERE Type = 'UNIT_WORKBOAT';

INSERT INTO Units
					(Type,					Class,						Description,				Civilopedia,						Strategy,								Help,								NoMinorCivGift,	NoMinorGifts,	Cost,		FaithCost,		Moves,		Immobile, BaseSightRange, PurchaseOnly,	MoveAfterPurchase,	Capture,	CombatClass, Domain, CivilianAttackPriority,	DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, PrereqTech,				ObsoleteTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	WorkRate,	MinAreaSize, NukeDamageLevel,	SpreadReligion,	ReligionSpreads, ReligiousStrength,	CombatLimit, Trade, XPValueAttack,	XPValueDefense, Conscription,	NoMaintenance, UnitArtInfo,				UnitArtInfoEraVariation,	ShowInPedia, MoveRate, UnitFlagIconOffset,	PortraitIndex,	IconAtlas,			UnitFlagAtlas,			MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted, ProductionCostAddedPerEra)
SELECT DISTINCT 	'UNIT_SISQENO',			'UNITCLASS_SISQENO',		'TXT_KEY_UNIT_SISQENO',		'TXT_KEY_CIV5_UNIT_SISQENO',		'TXT_KEY_UNIT_SISQENO_STRATEGY',		'TXT_KEY_UNIT_SISQENO_HELP',		1,				1,				Cost,		FaithCost-20,	Moves,		Immobile, BaseSightRange, PurchaseOnly,	MoveAfterPurchase,	Capture,	CombatClass, Domain, CivilianAttackPriority,	DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, PrereqTech,				ObsoleteTech,	GoodyHutUpgradeUnitClass,	-1,					WorkRate,	MinAreaSize, NukeDamageLevel,	SpreadReligion,	ReligionSpreads, ReligiousStrength,	CombatLimit, Trade, XPValueAttack,	XPValueDefense, Conscription,	NoMaintenance, 'ART_DEF_UNIT_SISQENO',	UnitArtInfoEraVariation,	ShowInPedia, MoveRate, 3,					3,				'UCS_UNIT_ATLAS',	'UCS_UNIT_FLAG_ATLAS',	MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted, ProductionCostAddedPerEra
FROM Units WHERE Type = 'UNIT_MISSIONARY';

INSERT INTO Units
					(Type,					Class,						Description,				Civilopedia,						Strategy,								Help,								NoMinorCivGift,	NoMinorGifts,	Cost,		FaithCost,		Moves,		Immobile, BaseSightRange, PurchaseOnly,	MoveAfterPurchase,	Capture,	CombatClass, Domain, CivilianAttackPriority,	DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, PrereqTech,				ObsoleteTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	WorkRate,	MinAreaSize, NukeDamageLevel,	SpreadReligion,	ReligionSpreads, ReligiousStrength,	CombatLimit, Trade, XPValueAttack,	XPValueDefense, Conscription,	NoMaintenance, UnitArtInfo,				UnitArtInfoEraVariation,	ShowInPedia, MoveRate, UnitFlagIconOffset,	PortraitIndex,	IconAtlas,			UnitFlagAtlas,			MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted, ProductionCostAddedPerEra)
SELECT DISTINCT 	'UNIT_SISQENO_WORKER',	'UNITCLASS_SISQENO_WORKER',	'TXT_KEY_UNIT_SISQENO',		'TXT_KEY_CIV5_UNIT_SISQENO',		'TXT_KEY_UNIT_SISQENO_STRATEGY',		'TXT_KEY_UNIT_SISQENO_HELP',		1,				1,				-1,			-1,				Moves,		Immobile, BaseSightRange, PurchaseOnly,	MoveAfterPurchase,	Capture,	CombatClass, Domain, CivilianAttackPriority,	'UNITAI_WORKER',	MilitarySupport, MilitaryProduction, Pillage, Mechanized, PrereqTech,				ObsoleteTech,	GoodyHutUpgradeUnitClass,	-1,					WorkRate,	MinAreaSize, NukeDamageLevel,	0,				0,				 0,					CombatLimit, Trade, XPValueAttack,	XPValueDefense, Conscription,	NoMaintenance, 'ART_DEF_UNIT_SISQENO',	UnitArtInfoEraVariation,	ShowInPedia, MoveRate, 3,					3,				'UCS_UNIT_ATLAS',	'UCS_UNIT_FLAG_ATLAS',	MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted, ProductionCostAddedPerEra
FROM Units WHERE Type = 'UNIT_MISSIONARY';

-- mercenaries
INSERT INTO Units
					(Type,					Class,						Description,				Civilopedia,						Strategy,								Help,								NoMinorCivGift,	NoMinorGifts,	Combat,		RangedCombat,	Cost,	FaithCost,		RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange, Range,	PurchaseOnly,	MoveAfterPurchase,	CombatClass, Domain, DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, IgnoreBuildingDefense,	PrereqTech,				ObsoleteTech,			GoodyHutUpgradeUnitClass,	AdvancedStartCost,	MinAreaSize, NukeDamageLevel, CombatLimit, XPValueAttack, XPValueDefense, Conscription,	NoMaintenance, UnitArtInfo,					UnitArtInfoEraVariation, ShowInPedia, MoveRate, UnitFlagIconOffset, PortraitIndex,	IconAtlas,			UnitFlagAtlas,			MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted,	UnitEraUpgrade)
SELECT DISTINCT 	'UNIT_SWISS_GUARD',		'UNITCLASS_SWISS_GUARD',	'TXT_KEY_UNIT_SWISS_GUARD',	'TXT_KEY_CIV5_UNIT_SWISS_GUARD',	'TXT_KEY_UNIT_SWISS_GUARD_STRATEGY',	'TXT_KEY_UNIT_SWISS_GUARD_HELP',	1,				1,				28,			RangedCombat,	500,	500,			RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange, Range,	PurchaseOnly,	MoveAfterPurchase,	CombatClass, Domain, 'UNITAI_DEFENSE',	MilitarySupport, MilitaryProduction, Pillage, Mechanized, IgnoreBuildingDefense,	'TECH_BANKING',			NULL,					NULL,						-1,					MinAreaSize, NukeDamageLevel, CombatLimit, XPValueAttack, XPValueDefense, Conscription,	NoMaintenance, 'ART_DEF_UNIT_SWISS_GUARD',	UnitArtInfoEraVariation, ShowInPedia, MoveRate, 0,					0,				'UCS_UNIT_ATLAS',	'UCS_UNIT_FLAG_ATLAS',	MaxHitPoints, 1,					PurchaseCooldown, IsMounted,	1
FROM Units WHERE Type = 'UNIT_FCOMPANY';

-- religious mercenaries
INSERT INTO Units
					(Type,					Class,						Description,				Civilopedia,						Strategy,								Help,								NoMinorCivGift,	NoMinorGifts,	Combat,		RangedCombat,	Cost,	FaithCost,		RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange, Range,	PurchaseOnly,	MoveAfterPurchase,	CombatClass, Domain, DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, IgnoreBuildingDefense,	PrereqTech,				ObsoleteTech,			GoodyHutUpgradeUnitClass,	AdvancedStartCost,	MinAreaSize, NukeDamageLevel, CombatLimit, XPValueAttack, XPValueDefense, Conscription,	NoMaintenance, UnitArtInfo,					UnitArtInfoEraVariation, ShowInPedia, MoveRate, UnitFlagIconOffset, PortraitIndex,	IconAtlas,			UnitFlagAtlas,			MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted,	UnitEraUpgrade)
SELECT DISTINCT 	'UNIT_NIHANG',			'UNITCLASS_NIHANG',			'TXT_KEY_UNIT_NIHANG',		'TXT_KEY_CIV5_UNIT_NIHANG',			'TXT_KEY_UNIT_NIHANG_STRATEGY',			'TXT_KEY_UNIT_NIHANG_HELP',			1,				1,				Combat+2,	RangedCombat,	-1,		400,			0,								Moves,	BaseSightRange, Range,	PurchaseOnly,	1,					CombatClass, Domain, DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, IgnoreBuildingDefense,	'TECH_THEOLOGY',		'TECH_MOBILE_TACTICS',	NULL,						-1,					MinAreaSize, NukeDamageLevel, CombatLimit, XPValueAttack, XPValueDefense, Conscription,	NoMaintenance, 'ART_DEF_UNIT_NIHANG',		UnitArtInfoEraVariation, ShowInPedia, MoveRate, 2,					2,				'UCS_UNIT_ATLAS',	'UCS_UNIT_FLAG_ATLAS',	MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted,	UnitEraUpgrade
FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN';

-- UUs
INSERT INTO Units
					(Type,					Class,						Description,				Civilopedia,						Strategy,								Help,								NoMinorCivGift,	NoMinorGifts,	Combat,		RangedCombat,	Cost,	FaithCost,		RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange, Range,	PurchaseOnly,	MoveAfterPurchase,	CombatClass, Domain, DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, IgnoreBuildingDefense,	PrereqTech,				ObsoleteTech,			GoodyHutUpgradeUnitClass,	AdvancedStartCost,	MinAreaSize, NukeDamageLevel, CombatLimit, XPValueAttack, XPValueDefense, Conscription,	NoMaintenance, UnitArtInfo,					UnitArtInfoEraVariation, ShowInPedia, MoveRate, UnitFlagIconOffset, PortraitIndex,	IconAtlas,			UnitFlagAtlas,			MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted,	UnitEraUpgrade)
SELECT DISTINCT 	'UNIT_GURKHA',			'UNITCLASS_GURKHA',			'TXT_KEY_UNIT_GURKHA',		'TXT_KEY_CIV5_UNIT_GURKHA',			'TXT_KEY_UNIT_GURKHA_STRATEGY',			'TXT_KEY_UNIT_GURKHA_HELP',			1,				1,				42,			RangedCombat,	575,	FaithCost,		RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange, Range,	PurchaseOnly,	1,					CombatClass, Domain, DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, IgnoreBuildingDefense,	PrereqTech,				'TECH_COMBINED_ARMS',	GoodyHutUpgradeUnitClass,	-1,					MinAreaSize, NukeDamageLevel, CombatLimit, XPValueAttack, XPValueDefense, Conscription,	NoMaintenance, 'ART_DEF_UNIT_GURKHA',		UnitArtInfoEraVariation, ShowInPedia, MoveRate, 1,					1,				'UCS_UNIT_ATLAS',	'UCS_UNIT_FLAG_ATLAS',	MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted,	UnitEraUpgrade
FROM Units WHERE Type = 'UNIT_RIFLEMAN';

INSERT INTO Units
					(Type,					Class,						Description,				Civilopedia,						Strategy,								Help,								NoMinorCivGift,	NoMinorGifts,	Combat,		RangedCombat,	Cost,	FaithCost,		RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange, Range,	PurchaseOnly,	MoveAfterPurchase,	CombatClass, Domain, DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, IgnoreBuildingDefense,	PrereqTech,				ObsoleteTech,			GoodyHutUpgradeUnitClass,	AdvancedStartCost,	MinAreaSize, NukeDamageLevel, CombatLimit, XPValueAttack, XPValueDefense, Conscription,	NoMaintenance, UnitArtInfo,					UnitArtInfoEraVariation, ShowInPedia, MoveRate, UnitFlagIconOffset, PortraitIndex,	IconAtlas,			UnitFlagAtlas,			MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted,	UnitEraUpgrade)
SELECT DISTINCT 	'UNIT_SAKA',			'UNITCLASS_SAKA',			'TXT_KEY_UNIT_SAKA',		'TXT_KEY_CIV5_UNIT_SAKA',			'TXT_KEY_UNIT_SAKA_STRATEGY',			'TXT_KEY_UNIT_SAKA_HELP',			1,				1,				Combat,		RangedCombat+2,	Cost,	FaithCost,		RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange, Range,	PurchaseOnly,	MoveAfterPurchase,	CombatClass, Domain, DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, IgnoreBuildingDefense,	PrereqTech,				'TECH_METALLURGY',		GoodyHutUpgradeUnitClass,	-1,					MinAreaSize, NukeDamageLevel, CombatLimit, XPValueAttack, XPValueDefense, Conscription,	NoMaintenance, 'ART_DEF_UNIT_SAKA',			UnitArtInfoEraVariation, ShowInPedia, MoveRate, 4,					4,				'UCS_UNIT_ATLAS',	'UCS_UNIT_FLAG_ATLAS',	MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown, IsMounted,	UnitEraUpgrade
FROM Units WHERE Type = 'UNIT_MONGOLIAN_KESHIK';
------------------------------
------------------------------
INSERT INTO Unit_AITypes
					(UnitType,				UnitAIType)
SELECT DISTINCT 	UnitType||'_OF_DALI',	UnitAIType
FROM Unit_AITypes WHERE UnitType IN ('UNIT_CARAVAN'/*, 'UNIT_CARGO_SHIP'*/);

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_TEAAT', 			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKBOAT';

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_SISQENO', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_SISQENO_WORKER', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKER';

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_SWISS_GUARD', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SPANISH_TERCIO';

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_NIHANG', 			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_LONGSWORDSMAN';

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_GURKHA', 			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_SAKA', 			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MONGOLIAN_KESHIK';
------------------------------
INSERT INTO Unit_Flavors
					(UnitType,				FlavorType,	Flavor)
SELECT DISTINCT 	UnitType||'_OF_DALI',	FlavorType,	Flavor
FROM Unit_Flavors WHERE UnitType IN ('UNIT_CARAVAN'/*, 'UNIT_CARGO_SHIP'*/);

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		'UNIT_TEAAT', 			FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKBOAT';

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		'UNIT_SISQENO', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		'UNIT_SWISS_GUARD', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SPANISH_TERCIO';

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		'UNIT_NIHANG', 			FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_LONGSWORDSMAN';

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		'UNIT_GURKHA', 			FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		'UNIT_SAKA', 			FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MONGOLIAN_KESHIK';

INSERT INTO Unit_Flavors 
			(UnitType, 				FlavorType, 				Flavor)
VALUES		('UNIT_TEAAT', 			'FLAVOR_GOLD', 				3),
			('UNIT_TEAAT', 			'FLAVOR_CULTURE', 			2),
			('UNIT_SISQENO', 		'FLAVOR_TILE_IMPROVEMENT', 	2),
			('UNIT_SWISS_GUARD', 	'FLAVOR_CULTURE', 			4),
			('UNIT_SWISS_GUARD', 	'FLAVOR_RELIGION', 			3);
------------------------------
INSERT INTO Unit_FreePromotions
			(UnitType,				PromotionType)
SELECT  	UnitType||'_OF_DALI',	PromotionType
FROM Unit_FreePromotions WHERE UnitType IN ('UNIT_CARAVAN'/*, 'UNIT_CARGO_SHIP'*/);

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		'UNIT_TEAAT', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_WORKBOAT';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		'UNIT_SISQENO', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		'UNIT_SISQENO_WORKER', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		'UNIT_SWISS_GUARD', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SPANISH_TERCIO';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		'UNIT_NIHANG', 			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_LONGSWORDSMAN';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		'UNIT_GURKHA', 			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		'UNIT_SAKA', 			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MONGOLIAN_KESHIK';

INSERT INTO Unit_FreePromotions 
			(UnitType, 				PromotionType)
VALUES		('UNIT_SWISS_GUARD', 	'PROMOTION_GUARDIA_SVIZZERA'),
			('UNIT_SWISS_GUARD', 	'PROMOTION_KATZBALGER'),
			('UNIT_NIHANG', 		'PROMOTION_SIKH'),
			('UNIT_GURKHA', 		'PROMOTION_HEAVY_CHARGE'),
			('UNIT_GURKHA', 		'PROMOTION_GAIN_EXPERIENCE'),
			('UNIT_SAKA', 			'PROMOTION_SCYTHIAN_BARRAGE');

UPDATE UnitPromotions SET PediaType = 'PEDIA_SHARED' WHERE Type = 'PROMOTION_HEAVY_CHARGE';
------------------------------
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
VALUES		('UNIT_NIHANG', 	'UNITCLASS_MECHANIZED_INFANTRY');

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
SELECT		'UNIT_GURKHA', 		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
SELECT		'UNIT_SAKA', 		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MONGOLIAN_KESHIK';
------------------------------
/*INSERT INTO Policy_UnitClassReplacements
			(PolicyType,				ReplacedUnitClassType,			ReplacementUnitClassType)
VALUES	    ('POLICY_VATICAN_CITY',		'UNITCLASS_TERCIO',				'UNITCLASS_SWISS_GUARD'),
			('POLICY_LAHORE',			'UNITCLASS_LONGSWORDSMAN',		'UNITCLASS_NIHANG'),
			('POLICY_KATHMANDU',		'UNITCLASS_RIFLEMAN',			'UNITCLASS_GURKHA'),
			('POLICY_POKROVKA',			'UNITCLASS_HORSE_ARCHER',		'UNITCLASS_SAKA');*/

CREATE TABLE IF NOT EXISTS Civilization_UnitClassOverrides_Temp (UnitClassType_Temp TEXT NOT NULL);

INSERT INTO Civilization_UnitClassOverrides_Temp
			(UnitClassType_Temp)
VALUES		('UNITCLASS_CARAVAN_OF_DALI'),
			/*('UNITCLASS_CARGO_SHIP_OF_DALI'),*/
			('UNITCLASS_TEAAT'),
			('UNITCLASS_SISQENO'),
			('UNITCLASS_SISQENO_WORKER'),
			('UNITCLASS_SWISS_GUARD'),
			('UNITCLASS_NIHANG'),
			('UNITCLASS_GURKHA'),
			('UNITCLASS_SAKA');

INSERT INTO Civilization_UnitClassOverrides
			(CivilizationType,			UnitClassType,		UnitType)
SELECT		'CIVILIZATION_BARBARIAN',	UnitClassType_Temp, NULL
FROM Civilization_UnitClassOverrides_Temp;

INSERT INTO Civilization_UnitClassOverrides
			(CivilizationType,			UnitClassType,		UnitType)
SELECT		'CIVILIZATION_MINOR',		UnitClassType_Temp, NULL
FROM Civilization_UnitClassOverrides_Temp;

DROP TABLE Civilization_UnitClassOverrides_Temp;
------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
			(UnitType, 			ResourceType,	Cost)
SELECT		'UNIT_NIHANG', 		ResourceType,	Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_LONGSWORDSMAN';
------------------------------
INSERT INTO Unit_EraCombatStrength
			(UnitType, 				EraType,			CombatStrength)
VALUES		('UNIT_SWISS_GUARD', 	'ERA_RENAISSANCE',	28), -- +3 from Tercio (25)
			('UNIT_SWISS_GUARD', 	'ERA_INDUSTRIAL',	37), -- -1 from Fusilier (38) !!!UNIT_RIFLEMAN
			('UNIT_SWISS_GUARD', 	'ERA_MODERN',		45), -- -5 from Rifleman (50) !!!UNIT_GREAT_WAR_INFANTRY
			('UNIT_SWISS_GUARD', 	'ERA_POSTMODERN',	53), -- -9 from Infantry (62)
			('UNIT_SWISS_GUARD', 	'ERA_FUTURE',		67); -- -13 from Mechanized Infantry (80)
--==========================================================================================================================
-- COMPATIBLITY
--==========================================================================================================================
-- POTALA PALACE - More Wonders
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Potala Palace[ENDCOLOR] depends strongly on alliance with [COLOR_CYAN]Lhasa[ENDCOLOR] (+10%[ICON_FOOD]; +10%[ICON_CULTURE]; halved when not allied with [COLOR_CYAN]Lhasa[ENDCOLOR]). Ties bonds between these two countries ([COLOR_YIELD_GOLD]Sphere of Influence[ENDCOLOR] over [COLOR_CYAN]Lhasa[ENDCOLOR]) using special diplomatic techniques (+1[ICON_DIPLOMAT] League Vote).'
WHERE Tag = 'TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires and alliance with [COLOR_POSITIVE_TEXT]Lhasa[ENDCOLOR] and an active session of the [COLOR_POSITIVE_TEXT]World Congress[ENDCOLOR]. ', '') WHERE Tag ='TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-HELP' AND Value= 0) AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_LHASA_HELP_CUT',			Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_CYAN]Lhasa CS Ally[ENDCOLOR] and an [COLOR_CYAN]active session of WC[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);
--============================================--
-- VP FIXES (copy from MW)
--============================================--
-- additional combat classes for promotions
INSERT OR REPLACE INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_UNITCOMBAT_SPECIAL_PEOPLE',		'Great People'),
			('TXT_KEY_UNITCOMBAT_SPACESHIP_PART',		'Space Parts'),
			('TXT_KEY_UNITCOMBAT_MISSILE',				'Missiles'),
			('TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST',		'Archaeologists');

INSERT OR REPLACE INTO UnitCombatInfos 
			(Type,							Description) 
VALUES		('UNITCOMBAT_SPECIAL_PEOPLE',	'TXT_KEY_UNITCOMBAT_SPECIAL_PEOPLE'),
			('UNITCOMBAT_SPACESHIP_PART',	'TXT_KEY_UNITCOMBAT_SPACESHIP_PART'),
			('UNITCOMBAT_MISSILE',			'TXT_KEY_UNITCOMBAT_MISSILE'),
			('UNITCOMBAT_ARCHAEOLOGIST',	'TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST');

UPDATE Units SET CombatClass = 'UNITCOMBAT_ARCHAEOLOGIST'	WHERE Type ='UNIT_ARCHAEOLOGIST';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SIEGE'			WHERE Type ='UNIT_ASSYRIAN_SIEGE_TOWER';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SPECIAL_PEOPLE'	WHERE Special ='SPECIALUNIT_PEOPLE';
UPDATE Units SET CombatClass = 'UNITCOMBAT_MISSILE'			WHERE Special ='SPECIALUNIT_MISSILE';
UPDATE Units SET CombatClass = 'UNITCOMBAT_MISSILE'			WHERE Type ='UNIT_ATOMIC_BOMB';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SPACESHIP_PART'	WHERE DefaultUnitAI ='UNITAI_SPACESHIP_PART';
------------------------------
--UPDATE Technologies SET GridY = 0 WHERE Type ='TECH_SAILING';
--UPDATE Technologies SET GridY = 10 WHERE Type ='TECH_BRONZE_WORKING';
--============================================--
-- The Trick (by @Jarcast2)!
--============================================--
CREATE TABLE IF NOT EXISTS MinorCivilizations_Copy (
	'ID' integer primary key autoincrement, 
	'Type' text  not null unique , 
	'Description' text , 
	'Civilopedia' text , 
	'ShortDescription' text , 
	'Adjective' text , 
	'ArtDefineTag' text , 
	'DefaultPlayerColor' text default NULL , 
	'ArtStyleType' text default NULL , 
	'ArtStyleSuffix' text default NULL , 
	'ArtStylePrefix' text default NULL , 
	'MinorCivTrait' text  not null , 
	'FixedPersonality' text default NULL, 
	'BullyUnitClass' TEXT DEFAULT NULL, 
	foreign key (Description) references Language_en_US(Tag), 
	foreign key (Civilopedia) references Language_en_US(Tag), 
	foreign key (ShortDescription) references Language_en_US(Tag), 
	foreign key (Adjective) references Language_en_US(Tag), 
	foreign key (MinorCivTrait) references MinorCivTraits(Type));

INSERT INTO MinorCivilizations_Copy
			(Type,	Description, ShortDescription, Adjective, Civilopedia, DefaultPlayerColor, ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, MinorCivTrait,	FixedPersonality, BullyUnitClass)
SELECT		Type,	Description, ShortDescription, Adjective, Civilopedia, DefaultPlayerColor, ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, MinorCivTrait,	FixedPersonality, BullyUnitClass
FROM MinorCivilizations
ORDER BY (abs(random()) % (SELECT max(_ROWID_) FROM MinorCivilizations));

DELETE FROM MinorCivilizations;
INSERT INTO MinorCivilizations SELECT * FROM MinorCivilizations_Copy;
DROP TABLE IF EXISTS MinorCivilizations_Copy;
---------------------------------------------------
