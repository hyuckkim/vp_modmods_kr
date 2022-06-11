---------------------------------------------------
-- Compatibility
---------------------------------------------------
-- Even More Resources by @HungryForFood	
INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('UCS-EMR', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'UCS-EMR' AND EXISTS (SELECT * FROM Resources WHERE Type='RESOURCE_LAVENDER') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='UCS-EMR' AND Value= 0);

-- Enlightenment Era by @Infixo	
INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('UCS-EE', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'UCS-EE' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_DRYDOCK') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='UCS-EE' AND Value= 0);
---------------------------------------------------
-- Updates - Units
---------------------------------------------------
UPDATE Units SET NumInfPerEra = 20 WHERE Class = 'UNITCLASS_GREAT_DIPLOMAT';
---------------------------------------------------
-- Updates - Traits
---------------------------------------------------
UPDATE Traits SET InfluenceMeetCS = 45 WHERE Type = 'TRAIT_CITY_STATE_BONUSES';
---------------------------------------------------
-- Updates - Defines
---------------------------------------------------
UPDATE Defines SET Value = 50 WHERE Name = 'FRIENDSHIP_THRESHOLD_FRIENDS';
UPDATE Defines SET Value = 100 WHERE Name = 'FRIENDSHIP_THRESHOLD_ALLIES';

UPDATE Defines SET Value = 10 WHERE Name = 'MINOR_FRIENDSHIP_ANCHOR_MOD_PROTECTED';

UPDATE Defines SET Value = 50 WHERE Name = 'MOD_BALANCE_CORE_MINIMUM_RANKING_PTP';

UPDATE Defines SET Value = 100 WHERE Name = 'ALLIES_CAPITAL_FOOD_BONUS_AMOUNT';
UPDATE Defines SET Value = 100 WHERE Name = 'ALLIES_OTHER_CITIES_FOOD_BONUS_AMOUNT';

-- CS Yield Rewards VP * 0.66
UPDATE Defines SET Value = 3 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 2 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 4 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 3 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 3 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 2 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 1 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 7 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 4 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 3 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 7 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 5 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 4 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 3 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 2 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 8 WHERE Name = 'ALLIES_CULTURE_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 4 WHERE Name = 'ALLIES_CULTURE_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 1 WHERE Name = 'ALLIES_CULTURE_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 7 WHERE Name = 'FRIENDS_CULTURE_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 3 WHERE Name = 'FRIENDS_CULTURE_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_CULTURE_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 8 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 6 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 5 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 2 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 8 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 6 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 5 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 3 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 2 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 2 WHERE Name = 'NEED_DIPLOMAT_DESIRE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 1);
UPDATE Defines SET Value = 6 WHERE Name = 'NEED_DIPLOMAT_DISTASTE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 1);
UPDATE Defines SET Value = 3 WHERE Name = 'NEED_DIPLOMAT_DESIRE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 2);
UPDATE Defines SET Value = 5 WHERE Name = 'NEED_DIPLOMAT_DISTASTE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 2);
UPDATE Defines SET Value = 4 WHERE Name = 'NEED_DIPLOMAT_DESIRE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 3);
UPDATE Defines SET Value = 4 WHERE Name = 'NEED_DIPLOMAT_DISTASTE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 3);
UPDATE Defines SET Value = 5 WHERE Name = 'NEED_DIPLOMAT_DESIRE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 4);
UPDATE Defines SET Value = 3 WHERE Name = 'NEED_DIPLOMAT_DISTASTE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 4);
---------------------------------------------------
-- Updates - CustomModOptions - Events
---------------------------------------------------
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_MINORS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RESOLUTIONS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_LIBERATION';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_PLOT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_TRADE_ROUTES';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_FOUNDED';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_MINORS_INTERACTION';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_CITY';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_BARBARIANS';
---------------------------------------------------
-- Updates - CustomModOptions - CS Abilities
---------------------------------------------------
-- CS Overseas Territory
-- City States allied to a major act as an "overseas territoriy" of the major - other units may not enter CS territory unless they could enter the allied major's territory
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CS_OVERSEAS_TERRITORY';
	
-- CS Gift Ships
-- City States will (occasionally) gift ships
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CS_GIFT_SHIPS';	

-- CS Militaristic upgrade
-- Units in allied militaristic City States can upgrade - requires a (cosmetic) patch to UnitPanel.lua to fix the incorrect message about being in friendly territory
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CS_UPGRADES';	
	
-- CS Gifts
-- City States give different gifts depending on their type (cultural, religious, maritime, etc)
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CS_GIFTS';	
	
-- CS Allied Inquisitors
-- Inquisitors will keep religion out of allied City State cities if positioned adjacent
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'RELIGION_ALLIED_INQUISITORS';
---------------------------------------------------
-- Updates - Language_en_US
---------------------------------------------------
UPDATE Language_en_US SET Text = '[NEWLINE][COLOR_WARNING_TEXT][ICON_BULLET] Must be in the top 50% of the world in terms of Military Power. Yours is ranked at {1_Num}% of world Military Power.[ENDCOLOR]' WHERE Tag = 'TXT_KEY_POP_CSTATE_PLEDGE_NEED_MORE_MILITARY_TT';
UPDATE Language_en_US SET Text = 'You are [COLOR_POSITIVE_TEXT]Allies[ENDCOLOR] with {1_CityStateName:textkey}. Their bonuses will persist for [COLOR_FONT_RED]3[ENDCOLOR] turns if you lose the [COLOR_POSITIVE_TEXT]Allied[ENDCOLOR] status. Each turn, your [ICON_INFLUENCE] Influence with them will change by {2_Num}. If {1_CityStateName:textkey} is damaged and you have a [COLOR_POSITIVE_TEXT]Pledge of Protection[ENDCOLOR] with them, this decay value will triple.' WHERE Tag = 'TXT_KEY_ALLIES_CSTATE_TT';
UPDATE Language_en_US SET Text = '[ICON_INFLUENCE] Influence with City-States starts at 45. Yields from friendly and allied City-States increased by 75%. +25% to [ICON_STRENGTH] Combat Strength of Allied City-State [ICON_CAPITAL] Capitals. +10 Experience to Units gifted from City-States.' WHERE Tag = 'TXT_KEY_TRAIT_CITY_STATE_BONUSES';

UPDATE Language_en_US SET Text = REPLACE(Text, 'Available![ENDCOLOR]', '[ENDCOLOR]available!') WHERE Tag = 'TXT_KEY_CSTATE_CAN_EMBASSY';
UPDATE Language_en_US SET Text = REPLACE(Text, 'Available![ENDCOLOR].', '[ENDCOLOR]available!') WHERE Tag = 'TXT_KEY_CSTATE_CAN_PROTECT';
UPDATE Language_en_US SET Text = REPLACE(Text, 'early.[NEWLINE][NEWLINE]', 'early.') WHERE Tag = 'TXT_KEY_CSTATE_JERK_STATUS';	
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
-- Art
---------------------------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn)
SELECT 		'UCS_BUILDING_ATLAS', 					'256', 		'UCS_Buildings_256.dds', 	8, 				2 UNION ALL
SELECT 		'UCS_BUILDING_ATLAS', 					'128', 		'UCS_Buildings_128.dds', 	8, 				2 UNION ALL
SELECT 		'UCS_BUILDING_ATLAS', 					'80', 		'UCS_Buildings_080.dds', 	8, 				2 UNION ALL
SELECT 		'UCS_BUILDING_ATLAS', 					'64', 		'UCS_Buildings_064.dds', 	8, 				2 UNION ALL
SELECT 		'UCS_BUILDING_ATLAS', 					'45', 		'UCS_Buildings_045.dds', 	8, 				2 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'256', 		'UCS_Promotions_256.dds', 	5, 				5 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'64', 		'UCS_Promotions_064.dds', 	5, 				5 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'45', 		'UCS_Promotions_045.dds', 	5, 				5 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'32', 		'UCS_Promotions_032.dds', 	5, 				5 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'16', 		'UCS_Promotions_016.dds', 	5, 				5 UNION ALL
SELECT 		'UCS_IMPROVEMENT_ATLAS', 				'256', 		'UCS_Improvements_256.dds', 2, 				1 UNION ALL
SELECT 		'UCS_IMPROVEMENT_ATLAS', 				'64', 		'UCS_Improvements_064.dds', 2, 				1 UNION ALL
SELECT 		'UCS_IMPROVEMENT_ATLAS', 				'45', 		'UCS_Improvements_045.dds', 2, 				1;
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
-- Texts
---------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
-- different texts
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV', 					'A Shift in Alliance'  UNION ALL
SELECT 'TXT_KEY_CS_ACTIVE_BONUS_HEADER', 				'[COLOR_LIGHT_GREY]City-State''s bonuses given to Major Player:[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_CS_PASSIVE_BONUS_HEADER', 				'[COLOR_LIGHT_GREY]City-State''s passive abilities:[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_CS_UU_QUICK_INFO', 						'Unique Unit: [COLOR_YIELD_FOOD]{1_Unique_Unit}[ENDCOLOR] available at [COLOR_CYAN]{2_Tech}[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_MARITIME_BONUS', 						'[COLOR:90:205:40:255]Builders (Maritime):[ENDCOLOR][NEWLINE][ICON_BULLET] City-State has a Manufactory and an additional Bonus Resource nearby[NEWLINE][ICON_BULLET] +15% [ICON_FOOD] Growth[NEWLINE][ICON_BULLET] 10 [ICON_CULTURE_LOCAL] Border Growth Points on [ICON_CITIZEN] Birth[NEWLINE][ICON_BULLET] [COLOR_NEGATIVE_TEXT]+20% [ICON_SPY] Enemy Spy Effectiveness[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_MARITIME_FRIENDLY_BONUS', 				'[COLOR:200:240:140:255]Harvesters (Maritime Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET] 5% Chance for spawning a Worker or a Fishing Boat inside Friends'' Territory (their Capital must be on a Coast to get a Fishing Boat)[NEWLINE][ICON_BULLET] +50% [ICON_PRODUCTION] Production towards Workers and Fishing Boats[NEWLINE][ICON_BULLET] +1 [ICON_FOOD] Food to Bonus Resources'  UNION ALL
SELECT 'TXT_KEY_MARITIME_NEUTRAL_BONUS', 				'[COLOR:110:160:70:255]Secured Warehouse (Maritime Neutral):[ENDCOLOR][NEWLINE][ICON_BULLET] +10 [ICON_FOOD] Food per 4 [ICON_CITIZEN] Citizens[NEWLINE][ICON_BULLET] +10 [ICON_STRENGTH] Defense and +50 City HP'  UNION ALL
SELECT 'TXT_KEY_MARITIME_HOSTILE_BONUS', 				'[COLOR:60:125:40:255]Selfish Gatherers (Maritime Hostile):[ENDCOLOR][NEWLINE][ICON_BULLET] +20% [ICON_PRODUCTION] Production towards all Naval Units[NEWLINE][ICON_BULLET] 50 [ICON_FOOD] Food and 20 [ICON_CULTURE_LOCAL] Border Growth Points on [ICON_PRODUCTION] Unit Production[NEWLINE][ICON_BULLET] +1 [ICON_PRODUCTION] Production per 2 [ICON_CITIZEN] Citizens.'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_BONUS', 						'[COLOR:240:215:65:255]Trade Center (Mercantile):[ENDCOLOR][NEWLINE][ICON_BULLET] City-State has a Town and an additional Luxury Resource nearby[NEWLINE][ICON_BULLET] +10% [ICON_GOLD] Gold[NEWLINE][ICON_BULLET] 5% of [ICON_GOLD] Gold is converted to [ICON_FOOD] Food and another 5% to [ICON_PRODUCTION] Production[NEWLINE][ICON_BULLET] -20% [ICON_GOLD] Hurry Cost Modifiers[NEWLINE][ICON_BULLET] [COLOR_NEGATIVE_TEXT]-20% [ICON_PRODUCTION] Production towards all Military Units[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_FRIENDLY_BONUS', 			'[COLOR:240:240:165:255]Golden City (Mercantile Friendly):[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_NEUTRAL_BONUS', 				'[COLOR:210:210:70:255]Shadow Council (Mercantile Neutral):[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_HOSTILE_BONUS', 				'[COLOR:130:130:20:255]Free City (Mercantile Hostile):[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_CULTURED_BONUS', 						'[COLOR:210:65:200:255]Center of Learning (Cultured):[ENDCOLOR][NEWLINE][ICON_BULLET] City-State has an Academy nearby'  UNION ALL
SELECT 'TXT_KEY_CULTURED_FRIENDLY_BONUS', 				'[COLOR:240:180:235:255]Open University (Cultured Friendly):[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_CULTURED_NEUTRAL_BONUS', 				'[COLOR:210:90:195:255]Patronage (Cultured Neutral):[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_CULTURED_HOSTILE_BONUS', 				'[COLOR:130:30:115:255]Recluse Court (Cultured Hostile):[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_BONUS', 						'[COLOR:25:110:250:255]Center of Faith (Religious):[ENDCOLOR][NEWLINE][ICON_BULLET] City-State has a Holy Site nearby[NEWLINE][ICON_BULLET] +33% [ICON_PEACE] Religious Pressure[NEWLINE][ICON_BULLET] +2 [ICON_GOLD] Gold, +2 [ICON_CULTURE] Culture and +2 [ICON_PEACE] Faith to Natural Wonders, and same from Mountains and Atolls[NEWLINE][ICON_BULLET] [COLOR_NEGATIVE_TEXT]-5 [ICON_CULTURE_LOCAL] Border Growth Points[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_FRIENDLY_BONUS', 				'[COLOR:160:220:250:255]Open Mind (Religious Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET] 5% Chance for spawning a Missionary inside Friends'' Territory[NEWLINE][ICON_BULLET] -25% [ICON_PEACE] Conversion Resistance[NEWLINE][ICON_BULLET] +2 [ICON_CULTURE] Culture per incoming [ICON_INTERNATIONAL_TRADE] Trade Route'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_NEUTRAL_BONUS', 				'[COLOR:105:155:230:255]Medicant Orders (Religious Neutral):[ENDCOLOR][NEWLINE][ICON_BULLET] +10% [ICON_PEACE] Conversion Resistance[NEWLINE][ICON_BULLET] +5 [ICON_PRODUCTION] Production for every World Religion that has at least one Follower in this City-State[NEWLINE][ICON_BULLET] +1 [ICON_FOOD] Food to Rivers and +2 [ICON_FOOD] Food to Lakes'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_HOSTILE_BONUS', 				'[COLOR:25:110:170:255]One Truth (Religious Hostile):[ENDCOLOR][NEWLINE][ICON_BULLET] +25% [ICON_PEACE] Conversion Resistance[NEWLINE][ICON_BULLET] +25% [ICON_PEACE] Religious Pressure[NEWLINE][ICON_BULLET] 10 [ICON_CULTURE] Culture on Unit''s Death'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_BONUS', 					'[COLOR:245:40:40:255]Fortress (Militaristic):[ENDCOLOR][NEWLINE][ICON_BULLET] City-State has a Fort and an additional Strategic Resource nearby[NEWLINE][ICON_BULLET] City-State can train its Unique Unit[NEWLINE][ICON_BULLET] Player can upgrade his units inside their territory if Allied[NEWLINE][ICON_BULLET] +10 [ICON_PRODUCTION] Production towards all Military Units[NEWLINE][ICON_BULLET] [COLOR_NEGATIVE_TEXT]-33% [ICON_FOOD] Growth[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_FRIENDLY_BONUS', 			'[COLOR:255:180:180:255]Mercenary Hub (Militaristic Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET] +5% Rate of Unit Gifts to its Friends[NEWLINE][ICON_BULLET] All Military Units gain 30 XP when trained in this City-State'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_NEUTRAL_BONUS', 			'[COLOR:245:90:90:255]Sellsword Army (Militaristic Neutral):[ENDCOLOR][NEWLINE][ICON_BULLET] +25% [ICON_WAR] Unit Supply Cap Global[NEWLINE][ICON_BULLET] +20% XP gained from Combat for units trained in this City-State[NEWLINE][ICON_BULLET] All Military Units gain 10 XP when trained in this City-State'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_HOSTILE_BONUS', 			'[COLOR:170:10:10:255]Hermit Dragon (Militaristic Hostile):[ENDCOLOR][NEWLINE][ICON_BULLET] +50% [ICON_WAR] Unit Supply Cap Global[NEWLINE][ICON_BULLET] +33% [ICON_PRODUCTION] Production towards all Military Units'  UNION ALL
-- main definitions
SELECT 'TXT_KEY_CITYSTATE_CLERMONT', 					'Clermont' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CLERMONT_ADJ', 				'The Clermont' UNION ALL
SELECT 'TXT_KEY_CIV5_CLERMONT_TEXT', 					'Clermont was the starting point of the First Crusade, in which Christendom sought to free Jerusalem from Muslim domination: Pope Urban II preached the crusade in 1095 at the Second Council of Clermont.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONDURAS', 					'Tegucigalpa' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONDURAS_ADJ', 				'Honduran' UNION ALL
SELECT 'TXT_KEY_CIV5_HONDURAS_TEXT', 					'Honduras was home to several Mesoamerican cultures before the Spanish took over in the 16th century. Honduras became independent in 1821 and has since been a republic. However the republic remains a figure of a banana republic where their government encouraged developments from foreign investors which these developments came out with bananas.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AUCKLAND', 					'Parihaka' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AUCKLAND_ADJ', 				'the Maori' UNION ALL
SELECT 'TXT_KEY_CIV5_AUCKLAND_TEXT', 					'When the Maori settled upon an isthmus in what is now northern New Zealand, they found the surrounding landscape full of fertile land, lush jungle, and dormant volcanos. Protected natural harbors on either side of the isthmus offered plentiful fishing and a base for war canoes (''waka taua''). The settlers named it ''Tamaki Makaurau''—roughly translating to "the maiden sought by a hundred lovers."' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ARMAGH', 						'Armagh' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ARMAGH_ADJ', 					'The Armagh' UNION ALL
SELECT 'TXT_KEY_CIV5_ARMAGH_TEXT', 						'The Irish town of Armagh has long known religion. Thought to have been a worship site for ancient pagans, it gained prominence in the 5th Century when Saint Patrick, a Christian missionary, constructed and consecrated a stone church on the summit of a hill. Around that sprang a monastery, and then a town devoted to spreading Christianity throughout Ireland—a beachhead of theology.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUSCAT', 						'Muscat' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUSCAT_ADJ', 					'The Muscat' UNION ALL
SELECT 'TXT_KEY_CIV5_MUSCAT_TEXT', 						'The trade flowing through Muscat has been its lifeblood for at least two millennia. Nestled against the foothillls of the Al Hajar mountains, Ptolemy called it the Hidden Port (''Cryptus Portus'') as early as the 1st Century. Unfortunately the city was not hidden well enough—its prime location at the mouth of the Persian Gulf has long since made it a tempting target for conquest.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GRANADA', 					'Granada' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GRANADA_ADJ', 				'The Granada' UNION ALL
SELECT 'TXT_KEY_CIV5_GRANADA_TEXT', 					'In the 8th Century the Umayyad Caliphate spread through the Iberian Peninsula, rapidly conquering Visigothic Hispania. Granada, a fortified settlement in what is now southern Spain, was swept up in the invasion. In time to come (the late 15th Century, to be exact) its surrender to the Catholic Monarchs (''Los Reyes Católicos'') would end the Reconquista of Andalusia—but for three quarters of a millennium, Granada belonged to the Moors.
Located at the base of the Sierra Nevada range, Granada had the misfortune of being nearly indefensible due to its location on a low-lying plain. Its Moorish rulers quickly realized this and transferred their seat of power to the more defensible foothills overlooking the town. Part of their plans involved the building of alcazars, one of which would in later years be renovated into the beautiful Alhambra.
Granada''s Moorish masters shifted through the centuries. The Almohad replaced the Almoravids, who had themselves succeeded the remnants of the Umayyad. The city''s fortunes changed again in the 13th Century with the Nasrid dynasty, whose alliance with the Catholic kingdom of Castile led to the Emirate of Granada. Direct access to trade centers in sub-Saharan Africa bought Granada freedom from the Reconquista—for a time.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NANMANDOL', 					'Leluh' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NANMANDOL_ADJ', 				'The Leluh' UNION ALL
SELECT 'TXT_KEY_CIV5_NANMANDOL_TEXT', 					'Leluh is a major prehistoric and historic archaeological site. The remains are those of a civilization that peaked around the 14th and 15th centuries, with elements still visible at the time of European contact in the early 19th century. The rulers of Leluh gradually conquered and thus unified the island of Kosrae. From the capital at Leluh, they ruled the island with a monarchy that archaeologists believe was similar to the kingdoms of Tonga or Hawaii.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GWYNEDD', 					'Aberffraw' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GWYNEDD_ADJ', 				'Welsh' UNION ALL
SELECT 'TXT_KEY_CIV5_GWYNEDD_TEXT', 					'Gwynedd was an independent Welsh kingdom from the end of the Roman period until the 13th century, when it was conquered by England.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUISCA', 						'Suamox' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUISCA_ADJ', 					'Muiscan' UNION ALL
SELECT 'TXT_KEY_CIV5_MUISCA_TEXT', 						'Muisca was home to several Andean cultures such as the Panche in the west, Muzo in the northwest, Guane in the north, Lache in the northeast, Achagua in the east, and Sutagao in the south until the 16th century where Spanish Conquistadors laid ruin to them.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LACONIA', 					'Sparta' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LACONIA_ADJ', 				'Spartans' UNION ALL
SELECT 'TXT_KEY_CIV5_LACONIA_TEXT', 					'Considered a region of its city-state capital, Sparta, Laconia became one of the strongest local powers to contest control in the Peloponnese region.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CHEVAK', 						'Chevak' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CHEVAK_ADJ', 					'The Chevak' UNION ALL
SELECT 'TXT_KEY_CIV5_CHEVAK_TEXT', 						'An area in Alaska native to the Chevak people.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANTO_DOMINGO', 				'Santo Domingo' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANTO_DOMINGO_ADJ', 			'Dominican' UNION ALL
SELECT 'TXT_KEY_CIV5_SANTO_DOMINGO_TEXT', 				'Santo Domingo became the oldest European city in the Americas continent. Originally named La Nueva Isabela, it was renamed in 1495 to ''Santo Domingo'', in honor of Saint Dominic. Santo Domingo came to be known as the ''Gateway to the Caribbean'' as the city grew bigger and prosperous.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MANAGUA', 					'Managua' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MANAGUA_ADJ', 				'Managuense' UNION ALL
SELECT 'TXT_KEY_CIV5_MANAGUA_TEXT', 					'Managua composed of mestizos and whites of Spanish decent, the city became from a fishing town to a thriving Spanish to now being the most well-known Central American developed city.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ODENSO', 						'Odenso' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ODENSO_ADJ', 					'The Odenso' UNION ALL
SELECT 'TXT_KEY_CIV5_ODENSO_TEXT', 						'Translated literally as Odin''s Island, it was named by the Finnish Kingdom in recognition to a Norse Mythologial God, Odin.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_YANGCHENG', 					'Yangcheng' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_YANGCHENG_ADJ', 				'The Yangcheng' UNION ALL
SELECT 'TXT_KEY_CIV5_YANGCHENG_TEXT', 					'Considered the first capital of the Xia Dynasty, it was built upon the Yin River and held until the fall of their dynasty.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PHANOTEUS', 					'Phanoteus' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PHANOTEUS_ADJ', 				'Phocisan' UNION ALL
SELECT 'TXT_KEY_CIV5_PHANOTEUS_TEXT', 					'Phanoteus was a very ancient town, originally inhabited by the Phlegyae. It is believed that Promethesus made the human race here. It held until damaged and damaged until destroyed in the passage of time by the Persians under Xerxes, Macedonians under Philip II, and the Romans under Pompey the Great.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DOUALA', 						'Douala' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DOUALA_ADJ', 					'The Douala' UNION ALL
SELECT 'TXT_KEY_CIV5_DOUALA_TEXT', 						'Douala is the largest city in Cameroon along as its city with the strongest economic growth in the region. Cameroon independence in 1960 gave rise to the strong rapid economic growth of Douala as its economic importance became critical to develop and prosper.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AMBRACIA', 					'Ambracia' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AMBRACIA_ADJ', 				'Ambracian' UNION ALL
SELECT 'TXT_KEY_CIV5_AMBRACIA_TEXT', 					'Ambracia is a city among Ancient Greece history that was gifted by Macedonian ruler Cassander to Pyrrhus, king of Epirus' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DJIBOUTI', 					'Djibouti' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DJIBOUTI_ADJ', 				'Djiboutian' UNION ALL
SELECT 'TXT_KEY_CIV5_DJIBOUTI_TEXT', 					'Djibouti was a region that originally was uninhabited coast until settled as Obock under French control. It was renamed and also became the capital of its respective named country after its independence from France.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DODOMA', 						'Dodoma' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DODOMA_ADJ', 					'Dodoma' UNION ALL
SELECT 'TXT_KEY_CIV5_DODOMA_TEXT', 						'Dodoma is a region composed as a small trading town that became chosen as the capital of Tanzania after the realization of its small adequate population size, crossroads for Tanzania itself and possibilty of cheap development cost.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_FAYA', 						'Faya' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_FAYA_ADJ', 					'The Faya' UNION ALL
SELECT 'TXT_KEY_CIV5_FAYA_TEXT', 						'Faya is a tropical hot region that boast its large population in modern northern Chad.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KIGALI', 						'Kigali' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KIGALI_ADJ', 					'Kigalian' UNION ALL
SELECT 'TXT_KEY_CIV5_KIGALI_TEXT', 						'Kigali is the capital city of Rwanda being initially developed by the Kingdom of Rwanda in the 14th century, and has been its historical capital in modern times.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LEVUKA', 						'Levuka' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LEVUKA_ADJ', 					'Fijian' UNION ALL
SELECT 'TXT_KEY_CIV5_LEVUKA_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_QUELIMANE', 					'Quelimane' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_QUELIMANE_ADJ', 				'Quelimanean' UNION ALL
SELECT 'TXT_KEY_CIV5_QUELIMANE_TEXT', 					'Quelimane is a region extremely vulnerable to flooding. Founded as a Swahili trading post, it developed into a prosperous seaport.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SIERRA_LEONE', 				'Freetown' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SIERRA_LEONE_ADJ', 			'Sierra Leonean' UNION ALL
SELECT 'TXT_KEY_CIV5_SIERRA_LEONE_TEXT', 				'Freetown is a diverse region of deserts and wetlands. Founded under British control, it was given its independence and boast its religious tolerance compared to its neighbor.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SURREY', 						'Surrey' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SURREY_ADJ', 					'The Surreys' UNION ALL
SELECT 'TXT_KEY_CIV5_SURREY_TEXT', 						'Surrey is a county in the south-east of the United Kingdoms. Known for its first usage as an airfield, the county became critical for its production of airplanes and aero testing.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TAIWAN', 						'Taipei' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TAIWAN_ADJ', 					'Taipei' UNION ALL
SELECT 'TXT_KEY_CIV5_TAIWAN_TEXT', 						'Taipei is the capital city of the Republic of China, and forms the cultural, political, and economic center of Taiwan. Prior to the establishment of the Kuomintang''s Chinese government in exile, Taipei was a minor provincial capital, situated along trade routes between China, Japan, and the Philippines. Much of the surrounding area continues to be inhabited by several Formosan indigenous groups, creating a rich cultural fabric distinct from mainland China''s domination by Han Chinese influence.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OC_EO', 						'Óc Eo' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OC_EO_ADJ', 					'The Funan' UNION ALL
SELECT 'TXT_KEY_CIV5_OC_EO_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_THIMPHU', 					'Thimphu' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_THIMPHU_ADJ', 				'Thimphu' UNION ALL
SELECT 'TXT_KEY_CIV5_THIMPHU_TEXT', 					'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANDORRA', 					'Andorra' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANDORRA_ADJ', 				'Andorran' UNION ALL
SELECT 'TXT_KEY_CIV5_ANDORRA_TEXT', 					'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CANOSSA', 					'Canossa' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CANOSSA_ADJ', 				'Canossan' UNION ALL
SELECT 'TXT_KEY_CIV5_CANOSSA_TEXT', 					'TODO' UNION ALL
-- abilities
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ALMATY', 				'[COLOR_MAGENTA]Almatu:[ENDCOLOR] [ICON_TRADE] City Connections produce +1 [ICON_RESEARCH] Science.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANTANANARIVO', 		'[COLOR_MAGENTA]Pirate Haven:[ENDCOLOR] Military kills generate [ICON_GOLD] Gold equivalent to the killed''s [ICON_STRENGTH] Combat Strength.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 			'[COLOR_MAGENTA]Economic Prominence:[ENDCOLOR] Merchants gain +2 [ICON_GOLD] Gold.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BELGRADE', 			'[COLOR_MAGENTA]The White Fortress:[ENDCOLOR] Siege Units gain +25 Max HP.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BOGOTA', 				'[COLOR_MAGENTA]United Independence:[ENDCOLOR] Capturing a City grants 20 [ICON_CULTURE] Culture, scaling with Era. Liberating a City grants 15-45 [ICON_CULTURE] Culture, scaling with Era and Cities (City scaling caps at 6).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BRATISLAVA', 			'[COLOR_MAGENTA]Heart of Slavic Culture:[ENDCOLOR] Guilds gain +2 [ICON_CULTURE] Culture and +1 [ICON_TOURISM] Tourism.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BRUSSELS', 			'[COLOR_MAGENTA]Home of the Marsh:[ENDCOLOR] Marshes gain +1 [ICON_CULTURE] Culture. Player can build [COLOR_CYAN]Marshes[ENDCOLOR] (+1 [ICON_FOOD] Food) on coastal Desert, Tundra and Snow tiles.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUCHAREST', 			'[COLOR_MAGENTA]Paris of the East:[ENDCOLOR] [ICON_GREAT_WORK] Great Works gain +1 [ICON_CULTURE] Culture.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUDAPEST', 			'[COLOR_MAGENTA]Pearl of Danube:[ENDCOLOR] Player receives +5 [ICON_RES_HORSE] Horses (can be traded and they are counted toward Monopolies).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUENOS_AIRES', 		'[COLOR_MAGENTA]Vox Populi:[ENDCOLOR] Bonus Resources gain +1 [ICON_CULTURE] Culture.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BYBLOS', 				'[COLOR_MAGENTA]Byblos Cedar:[ENDCOLOR] Fishing Boats, Lakes and Oases gain +1 [ICON_FOOD] Food.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CAHOKIA', 			'[COLOR_MAGENTA]Monks Mound:[ENDCOLOR] Player can build [COLOR_CYAN]Mounds[ENDCOLOR] (+1 [ICON_GOLD] Gold) on his tiles. +1 [ICON_GOLD] Gold and [ICON_PEACE] Faith to Mounds if the Player is allied with Cahokia. Mounds add +1 [ICON_GOLD] Gold and [ICON_PEACE] Faith to adjacent Villages, and gain +1 [ICON_GOLDEN_AGE] Golden Age Point, if they are adjacent to City.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 			'[COLOR_MAGENTA]Cape of Good Hope:[ENDCOLOR] +10% [ICON_INTERNATIONAL_TRADE] Trade Route Maximum Range. Finishing a [ICON_INTERNATIONAL_TRADE] Trade Route grants 20-40 [ICON_GOLD] Gold, scaling with the Destination City''s [ICON_CITIZEN] Population.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_COLOMBO', 			'[COLOR_MAGENTA]Kubera:[ENDCOLOR] +2 [ICON_GOLD] Gold to Jungles and Forests. -2 [ICON_GOLD] Gold to Logging Camps and Lumbermills.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_FLORENCE', 			'[COLOR_MAGENTA]Cradle of the Renaissance:[ENDCOLOR] +1 [ICON_CULTURE] Culture to Quarries. Artists gain +2 [ICON_GOLDEN_AGE] Golden Age Points.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 				'[COLOR_MAGENTA]Ecclesiastical:[ENDCOLOR] Cities gain +1 [ICON_PEACE] Faith for every 5 [ICON_CITIZEN] Citizens.[NEWLINE]'UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GENOA', 				'[COLOR_MAGENTA]La Superba:[ENDCOLOR] Player gains 50 [ICON_GOLD] Gold and 15 [ICON_GOLDEN_AGE] Golden Age Points upon a birth of a [ICON_GREAT_PEOPLE] Great Person, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HANOI', 				'[COLOR_MAGENTA]Patriotism:[ENDCOLOR] Military Units gain +10% [ICON_STRENGTH] Combat Strength inside Friendly Territories.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 			'[COLOR_MAGENTA]Prosperous:[ENDCOLOR] Cities gain +1 [ICON_GOLD] Gold for every 6 [ICON_CITIZEN] Citizens in their City.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_IFE', 				'[COLOR_MAGENTA]Yoruba:[ENDCOLOR] When a City expands its borders, Player gains 3 [ICON_PEACE] Faith, scaling with Era. +2 [ICON_CULTURE_LOCAL] Border Growth Points to Shrines.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_JERUSALEM', 			'[COLOR_MAGENTA]Holy Lands:[ENDCOLOR] +1 [ICON_PEACE] Faith to Holy Sites. [COLOR_CYAN]Jerusalem[ENDCOLOR] will adopt the Majority Religion of its Ally. [COLOR_CYAN]Jerusalem[ENDCOLOR] has a religious pressure equal to a Holy City. Ally will gain a [COLOR_POSITIVE_TEXT]Sphere of Influence[ENDCOLOR] with [COLOR_CYAN]Jerusalem[ENDCOLOR], if the World Congress has been founded.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 				'[COLOR_MAGENTA]Paradise on Earth:[ENDCOLOR] Cities gain +0.66 [ICON_CULTURE] Culture for every Mountain within their workable radius.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 			'[COLOR_MAGENTA]The Mountain:[ENDCOLOR] Cities gain +0.66 [ICON_PEACE] Faith for every Mountain within their workable radius.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 				'[COLOR_MAGENTA]Stories of Old:[ENDCOLOR] +5% [ICON_GREAT_MUSICIAN] Great Musicians generation. Player can construct [COLOR_POSITIVE_TEXT]Bylina[ENDCOLOR] (+1 slot for [ICON_GREAT_MUSICIAN] Musician).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 		'[COLOR_MAGENTA]Muddy Rivers:[ENDCOLOR] +5% [ICON_CULTURE] Culture to Wells and +2 [ICON_CULTURE] Culture to Watermills.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KYZYL', 				'[COLOR_MAGENTA]Center of Asia:[ENDCOLOR] Palace and Monuments gain +2 [ICON_TOURISM] Tourism.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LA_VENTA', 			'[COLOR_MAGENTA]Ceremonial Creations:[ENDCOLOR] [ICON_GREAT_PEOPLE] Great People Improvements gain +1 [ICON_PEACE] Faith. Shrines gain +1 [ICON_PEACE] Faith.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 				'[COLOR_MAGENTA]A Place Among the Gods:[ENDCOLOR] Player gains 25 [ICON_PEACE] Faith upon a birth of a [ICON_GREAT_PEOPLE] Great Person, scaling with Era. The [COLOR_CYAN]Potala Palace[ENDCOLOR] World Wonder will be available for construction after the foundation of World Congress. Constructing the [COLOR_CYAN]Potala Palace[ENDCOLOR] grants a [COLOR_POSITIVE_TEXT]Sphere of Influence[ENDCOLOR] with [COLOR_CYAN]Lhasa[ENDCOLOR].[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MALACCA', 			'[COLOR_MAGENTA]Strait Settlements:[ENDCOLOR] Luxury Resources gain +1 [ICON_GOLD] Gold.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MANILA', 				'[COLOR_MAGENTA]Pearl of the Orient:[ENDCOLOR] Finishing a [ICON_INTERNATIONAL_TRADE] Trade Route grants 1-15 [ICON_FOOD] Food and [ICON_PRODUCTION] Production scaling with the Destination City''s [ICON_CITIZEN] Population.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MBANZA_KONGO', 		'[COLOR_MAGENTA]Manikongo Glory:[ENDCOLOR] Land Military Units gain +15% [ICON_STRENGTH] Combat Strength when fighting in Forest, Jungle, Marsh and Flood Plains.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 			'[COLOR_MAGENTA]Gold Rush:[ENDCOLOR] Mines and [ICON_GREAT_PEOPLE] Great People Improvements gain +1 [ICON_GOLD] Gold.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 				'[COLOR_MAGENTA]House of Visconti:[ENDCOLOR] +5% [ICON_GREAT_ARTIST] Great Artists generation. Player can construct [COLOR_CYAN]Visconti Emissaries[ENDCOLOR] (+1 slot for [ICON_GREAT_ARTIST] Artist).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MOGADISHU', 			'[COLOR_MAGENTA]Maritime Growth:[ENDCOLOR] +1 [ICON_FOOD] Food to Oceans and Flood Plains.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MOMBASA', 			'[COLOR_MAGENTA]Unity for Development:[ENDCOLOR] +1 [ICON_FOOD] Food to Bonus Resources.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MONACO', 				'[COLOR_MAGENTA]Banking Haven:[ENDCOLOR] Markets and Banks gain +1 [ICON_CULTURE] Culture.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ORMUS', 				'[COLOR_MAGENTA]Jewel of the Ring:[ENDCOLOR] +1 [ICON_FOOD] Food to Luxury Resources.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 		'[COLOR_MAGENTA]Panama Canal:[ENDCOLOR] Forts, Citadels and Pontoon Bridges gain +1 [ICON_FOOD] Food.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PRAGUE', 				'[COLOR_MAGENTA]The Hrad:[ENDCOLOR] Walls and Castles gain +1 [ICON_CULTURE] Culture.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_QUEBEC_CITY', 		'[COLOR_MAGENTA]Fur and Lumber:[ENDCOLOR] +1 [ICON_GOLD] Gold from Camps, Lumbermills and Logging Camps.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 				'[COLOR_MAGENTA]Maritime Suzerainty:[ENDCOLOR] Each City-State Alliance grants +1 [ICON_FOOD] Food to all Cities. +1 [ICON_FOOD] Food to Embassies.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 				'[COLOR_MAGENTA]Latvian Commercialism:[ENDCOLOR] Cities gain +3% [ICON_FOOD] Food.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 			'[COLOR_MAGENTA]The Sogd:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] International Trade Routes grant +4 [ICON_GOLD] Gold to both: Origin and Destination City.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SIDON', 				'[COLOR_MAGENTA]Neighborhood Bully:[ENDCOLOR] Player can gain a [COLOR_POSITIVE_TEXT]Sphere of Influence[ENDCOLOR] with [COLOR_CYAN]Sidon[ENDCOLOR] for bullying another City-State. Military Units inside Enemy Territories heal an additional 5 HP per turn.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SINGAPORE', 			'[COLOR_MAGENTA]Developed Wealth:[ENDCOLOR] Diplomatic Units gain the [COLOR_POSITIVE_TEXT]Nobility[ENDCOLOR] promotion (+15 [ICON_INFLUENCE] to Diplomatic Missions).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 				'[COLOR_MAGENTA]Serdica:[ENDCOLOR] +5% [ICON_STRENGTH] Combat Effectiveness Bonus to [ICON_GREAT_GENERAL] Great Generals and [ICON_GREAT_ADMIRAL] Great Admirals.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SYDNEY', 				'[COLOR_MAGENTA]Capital Infrastructure:[ENDCOLOR] [ICON_HAPPINESS_1] WLTKD generate +5% [ICON_FOOD] Food.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TYRE', 				'[COLOR_MAGENTA]Ruins of the Ancient World:[ENDCOLOR] [ICON_GREAT_WORK] Great Works and Landmarks gain +2 [ICON_GOLD] Gold.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_UR', 					'[COLOR_MAGENTA]Cradle of Civilization:[ENDCOLOR] [ICON_TRADE] City Connections generate +2 [ICON_FOOD] Food.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VALLETTA', 			'[COLOR_MAGENTA]The Grand Harbor:[ENDCOLOR] Player can construct [COLOR_CYAN]The Grand Harbor[ENDCOLOR] (+25 City HP, +15 XP to newly trained Naval Units).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 			'[COLOR_MAGENTA]Terminal City:[ENDCOLOR] Villages and [ICON_GREAT_PEOPLE] Great People Improvements gain +1 [ICON_FOOD] Food.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 		'[COLOR_MAGENTA]Absolute Faith:[ENDCOLOR] -10% [ICON_PEACE] Faith Purchase Cost.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VILNIUS', 			'[COLOR_MAGENTA]Athens of the North:[ENDCOLOR] Writers gain +1 [ICON_GOLD] Gold. Player can construct [COLOR_CYAN]The Gate of Dawn[ENDCOLOR] (+1 slot for [ICON_GREAT_WRITER] Writer).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 			'[COLOR_MAGENTA]Te Whanga-nui-a-Tara:[ENDCOLOR] Strategic Resources gain +1 [ICON_FOOD] Food.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 			'[COLOR_MAGENTA]Birth of the Reformation:[ENDCOLOR] -5% [ICON_HAPPINESS_3] Religion Unrest in all Cities. Civil Servants and Laborers gain +1 [ICON_PEACE] Faith.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_YEREVAN', 			'[COLOR_MAGENTA]Art of War:[ENDCOLOR] Military kills generate [ICON_CULTURE] Culture equivalent to 50% of the killed''s [ICON_STRENGTH] Combat Strength.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ZANZIBAR', 			'[COLOR_MAGENTA]The Spice Islands:[ENDCOLOR] Bonus and Strategic Resources gain +1 [ICON_GOLD] Gold.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ZURICH', 				'[COLOR_MAGENTA]Banking Establishments:[ENDCOLOR] Treasury produces +2% [ICON_GOLD] Gold as interest (caps at 50 [ICON_GOLD] Gold/Era).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CLERMONT', 			'[COLOR_MAGENTA]Crusader''s Zeal:[ENDCOLOR] Newly-produced Melee and Gunpowder Units gain a random 10-turn promotion after their first combat. Military Units gain +15% XP from combat.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HONDURAS', 			'[COLOR_MAGENTA]Banana Republic:[ENDCOLOR] Resources granted from City-States count toward Global Monopolies (doesn''t stack with [COLOR_CYAN]Exchange Markets[ENDCOLOR] policy).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AUCKLAND', 			'[COLOR_MAGENTA]City of Sails:[ENDCOLOR] +3 [ICON_FOOD] Food to Coastal Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ARMAGH', 				'[COLOR_MAGENTA]Patron of Saints:[ENDCOLOR] Player can Purchase Irish Saints (as buildings) with [ICON_PEACE] Faith (requires a Majority Religion). Saints help with [ICON_HAPPINESS_1] Happiness management and provide some yields. You can choose only one Saint out of four possible.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUSCAT', 				'[COLOR_MAGENTA]Cryptus Portus:[ENDCOLOR] Lighthouses, Harbors, Seaports and Drydocks gain +1 [ICON_GOLD] Gold.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GRANADA', 			'[COLOR_MAGENTA]Alcázars:[ENDCOLOR] Forts and Citadels gain +1 [ICON_CULTURE] Culture.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_NANMANDOL', 			'[COLOR_MAGENTA]Reef of Heaven:[ENDCOLOR] +1 [ICON_CULTURE] Culture to Oceans.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GWYNEDD', 			'[COLOR_MAGENTA]Cyfraith Hywel:[ENDCOLOR] +10% [ICON_CULTURE] Culture during [ICON_GOLDEN_AGE] Golden Ages.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUISCA', 				'[COLOR_MAGENTA]The Golden One:[ENDCOLOR] +1 [ICON_GOLD] Gold for every 2 [ICON_CITIZEN] Citizens in the Capital and +1 [ICON_GOLD] Gold for every 30 [ICON_CITIZEN] Citizens in your Empire.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LACONIA', 			'[COLOR_MAGENTA]Spartan Discipline:[ENDCOLOR] Land Military Units gain +10% [ICON_STRENGTH] Combat Strength when adjacent to a Friendly Unit.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 				'[COLOR_MAGENTA]Cev''aq:[ENDCOLOR] +1 [ICON_FOOD] Food for every 4 Tundra tiles or 3 Snow tiles within workable radius. Those tiles must be worked by the City to apply the bonus.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SANTO_DOMINGO', 		'[COLOR_MAGENTA]Caribbean''s Gateway:[ENDCOLOR] Each currently applied Happiness or flat-yield Global Monopoly modifier gains an additional +3 bonus.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MANAGUA', 			'[COLOR_MAGENTA]Place of the Big Man:[ENDCOLOR] Each currently applied percentage-based Global Monopoly modifier gains an additional +7% bonus.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ODENSO', 				'[COLOR_MAGENTA]Lord of the Hunt:[ENDCOLOR] Military Units gain +1 [ICON_VIEW_CITY] Sight and heal an additional 5 HP per turn inside Neutral Territories.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_YANGCHENG', 			'[COLOR_MAGENTA]Year of the Animal:[ENDCOLOR] +1 [ICON_PEACE] Faith to Animal Resources.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PHANOTEUS', 			'[COLOR_MAGENTA]Gift of Promethesus:[ENDCOLOR] Adds a flat chance to [COLOR_POSITIVE_TEXT]Rig Elections[ENDCOLOR] or [COLOR_POSITIVE_TEXT]Start a Coup[ENDCOLOR] in City-States. [ICON_SPY] Security Level and speed to complete Spy Events is increased by +20%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DOUALA', 				'[COLOR_MAGENTA]Minature Continent:[ENDCOLOR] +1 [ICON_INTERNATIONAL_TRADE] Trade Route.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AMBRACIA', 			'[COLOR_MAGENTA]Mercenaries of Pyrrhus:[ENDCOLOR] Land Military Units generate +5% [ICON_PRODUCTION] Production when Garrisoned in the City. +50% [ICON_WAR] Militaristic City-State Gift Rate.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DJIBOUTI', 			'[COLOR_MAGENTA]Ta Netjeru:[ENDCOLOR] -5% [ICON_HAPPINESS_3] Poverty in all Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 				'[COLOR_MAGENTA]Sail in the Wilderness:[ENDCOLOR] Military Naval Units gain +5% [ICON_STRENGTH] Combat Strength and +1 [ICON_MOVES] Movement Point.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_FAYA', 				'[COLOR_MAGENTA]Spoils of War:[ENDCOLOR] Military kills generate [ICON_RESEARCH] Science equivalent to 50% of the killed''s [ICON_STRENGTH] Combat Strength.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 				'[COLOR_MAGENTA]Double Shift Curriculum:[ENDCOLOR] -5% [ICON_HAPPINESS_3] Illiteracy in all Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 				'[COLOR_MAGENTA]Destroyer of Bau:[ENDCOLOR] Player gains [ICON_FOOD] Food when killing Barbarians, clearing Barbarian Encampments or conquering enemy Cities. +1 [ICON_GREAT_GENERAL] Great General Point in the Capital per owned conquered City.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 			'[COLOR_MAGENTA]River of the Good Signs:[ENDCOLOR] River tiles gain +1 [ICON_GOLDEN_AGE] Golden Age Point.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SIERRA_LEONE', 		'[COLOR_MAGENTA]Realm of the Free:[ENDCOLOR] -5% [ICON_HAPPINESS_3] Boredom in all Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SURREY', 				'[COLOR_MAGENTA]Magnificence in Flying Machines:[ENDCOLOR] Fighters and Bombers gain +10% [ICON_STRENGTH] Combat Strength against [COLOR_POSITIVE_TEXT]Land and Naval Units[ENDCOLOR].[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 				'[COLOR_MAGENTA]Taiwan Miracle:[ENDCOLOR] +5% [ICON_RESEARCH] Science from the Research Process. Converts 2% of [ICON_RESEARCH] Science into [ICON_FOOD] Food.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 				'[COLOR_MAGENTA]Lords of the Great Glass River:[ENDCOLOR] +1 [ICON_CULTURE_LOCAL] Border Growth Point in all Coastal Cities and +1 [ICON_HAPPINESS_1] Happiness in Empire for each active International Sea [ICON_INTERNATIONAL_TRADE] Trade Route.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 			'[COLOR_MAGENTA]Druk Tsendhen:[ENDCOLOR] +3 [ICON_CULTURE] Culture in Cities on Hill.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 			'[COLOR_MAGENTA]Pyrenean Paréage:[ENDCOLOR] +1 [ICON_TOURISM] Tourism for every Mountain within their workable radius. -10% [ICON_HAPPINESS_3] Boredom in Cities with Mountains nearby.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 			'[COLOR_MAGENTA]Ardent Flame in Pious Heart:[ENDCOLOR] +1 [ICON_PEACE] Faith to Civil Servants. +1 [ICON_DIPLOMAT] Great Diplomat Point if City has a Temple.[NEWLINE]' UNION ALL
-- promotions
SELECT 'TXT_KEY_PROMOTION_ANTANANARIVO', 				'Pirate Haven' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ANTANANARIVO_HELP', 			'Military kills generate [ICON_GOLD] Gold equivalent to the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BELGRADE', 					'The White Fortress' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BELGRADE_HELP', 				'+25 Max HP.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANOI', 						'Patriotism' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANOI_HELP', 					'+10% [ICON_STRENGTH] Combat Strength inside Friendly Territories.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MBANZA_KONGO', 				'Manikongo Glory' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MBANZA_KONGO_HELP', 			'+15% [ICON_STRENGTH] Combat Strength when fighting in Forest, Jungle, Marsh and Flood Plains.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIDON', 						'Neighborhood Bully' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIDON_HELP', 					'Heal an additional 5 HP per turn inside Enemy Territories.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_YEREVAN', 					'Art of War' UNION ALL
SELECT 'TXT_KEY_PROMOTION_YEREVAN_HELP', 				'Military kills generate [ICON_CULTURE] Culture equivalent to 50% of the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LACONIA', 					'Spartan Discipline' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LACONIA_HELP', 				'+15% [ICON_STRENGTH] Combat Strength when adjacent to a Friendly Unit.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ODENSO', 						'Lord of the Hunt' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ODENSO_HELP', 				'+1 [ICON_VIEW_CITY] Sight and heal an additional 5 HP per turn inside Neutral Territories.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AMBRACIA', 					'Mercenaries of Pyrrhus' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AMBRACIA_HELP', 				'+5% [ICON_PRODUCTION] Production when Garrisoned in the City.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DODOMA', 						'Sail in the Wilderness' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DODOMA_HELP', 				'+5% [ICON_STRENGTH] Combat Strength and +1 [ICON_MOVES] Movement Point.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_FAYA', 						'Spoils of War' UNION ALL
SELECT 'TXT_KEY_PROMOTION_FAYA_HELP', 					'Military kills generate [ICON_RESEARCH] Science equivalent to 50% of the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SURREY', 						'Magnificence in Flying Machines' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SURREY_HELP', 				'+10% [ICON_STRENGTH] Combat Strength against [COLOR_POSITIVE_TEXT]Land and Naval Units[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT', 					'Crusader''s Zeal' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT_HELP', 				'+15% Experience gained from Combat.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT1', 					'Blessing of Clermont' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT1_HELP', 				'Receive a temporary random combat bonus upon the first combat.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT2', 					'Onward with Haste!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT2_HELP', 				'+2 [ICON_MOVES] Moves. Can move after attacking.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT3', 					'United We Stand!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT3_HELP', 				'+20% [ICON_STRENGTH] Combat Strength when adjacent to a friendly unit.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT4', 					'Charge!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT4_HELP', 				'+10% [ICON_STRENGTH] Attack. +15% [ICON_STRENGTH] against Fortified Units.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT5', 					'Reinforce!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT5_HELP', 				'+15% [ICON_STRENGTH] Defense. Can heal after attacking.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT6', 					'Glory to God!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT6_HELP', 				'Unit awards combat bonus to nearby units as if it is a Great General. This unit and all others in adjacent tiles heal 5 additional HP per turn.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MILITARISTIC_NEUTRAL', 		'Sellsword Army' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MILITARISTIC_NEUTRAL_HELP', 	'+20% Experience gained from Combat.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LEVUKA', 						'Destroyers of Bau' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LEVUKA_HELP', 				'Gain [ICON_FOOD] for killing Barbarians.' UNION ALL
-- improvements
SELECT 'TXT_KEY_BUILD_MARSH', 							'Create a Marsh'  UNION ALL
SELECT 'TXT_KEY_BUILD_MARSH_HELP', 						'Terraforms the landscape here into the Marsh, while installing an improvement that''ll stabilize the Marsh. Requires an Alliance with [COLOR_POSITIVE_TEXT]Brussels[ENDCOLOR].'  UNION ALL
SELECT 'TXT_KEY_IMPROVEMENT_MARSH', 					'Marsh' UNION ALL
SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MARSH', 				'To restore the marshlands on any terrain, just allow water to flow to it naturally. It should even work on snow! If the water doesn''t freeze that is.' UNION ALL
SELECT 'TXT_KEY_IMPROVEMENT_MARSH_HELP', 				'Only with the Alliance of the Brussel people can a civilization continue a restoration project of marshlands.' UNION ALL
SELECT 'TXT_KEY_BUILD_MOUND', 							'Construct a Mound'  UNION ALL
SELECT 'TXT_KEY_BUILD_MOUND_HELP', 						'When built adjacent to cities, the improvement gains +1 [ICON_GOLDEN_AGE] Golden Age Point. Adjacent Villages and Towns receive +1 [ICON_GOLD] Gold and [ICON_PEACE] Faith. Mounds lose certain bonuses when the Alliance is not maintained. Requires an Alliance with [COLOR_POSITIVE_TEXT]Cahokia[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_IMPROVEMENT_MOUND', 					'Mound' UNION ALL
SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MOUND', 				'It is a pyramid built of transported soil and clay.' UNION ALL
SELECT 'TXT_KEY_IMPROVEMENT_MOUND_HELP', 				'Only with the Alliance of the Cahokia people can a civilization enjoy such a beauty of a structure.' UNION ALL
-- dummy buildings
SELECT 'TXT_KEY_BUILDING_MARITIME', 					'Builders' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_HELP', 				'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_FRIENDLY', 			'Harvesters' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_FRIENDLY_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_NEUTRAL', 			'Secured Warehouse' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_NEUTRAL_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_HOSTILE', 			'Selfish Gatherers' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_HOSTILE_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE', 					'Trade Center' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_HELP', 				'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_FRIENDLY', 			'Golden City' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_FRIENDLY_HELP', 	'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_NEUTRAL', 			'Shadow Council' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_NEUTRAL_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_HOSTILE', 			'Free City' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_HOSTILE_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED', 					'Center of Learning' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_HELP', 				'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_FRIENDLY', 			'Open University' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_FRIENDLY_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_NEUTRAL', 			'Patronage' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_NEUTRAL_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_HOSTILE', 			'Recluse Court' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_HOSTILE_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS', 					'Center of Faith' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_HELP', 				'+33% [ICON_PEACE] Religious Pressure. -10 [ICON_CULTURE_LOCAL] Border Growth.' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_FRIENDLY', 			'Open Mind' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_FRIENDLY_HELP', 		'-25% [ICON_PEACE] Conversion Resistance. 5% Chance for spawning a Missionary Unit in Friends territory.' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_NEUTRAL', 			'Mendicant Orders' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_NEUTRAL_HELP', 		'+3 [ICON_PRODUCTION] Production for every World Religion that has at least one Follower in this City-State.' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_HOSTILE', 			'One Truth' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_HOSTILE_HELP', 		'+25% [ICON_PEACE] Religious Pressure. +25% [ICON_PEACE] Conversion Resistance.' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC', 				'Fortress' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_HELP', 			'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_FRIENDLY', 		'Mercenary Hub' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_FRIENDLY_HELP', 	'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_NEUTRAL', 		'Sellsword Army' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_NEUTRAL_HELP', 	'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_HOSTILE', 		'Hermit Dragon' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_HOSTILE_HELP', 	'' UNION ALL
SELECT 'TXT_KEY_BUILDING_BYBLOS', 						'Byblos Cedar' UNION ALL
SELECT 'TXT_KEY_BUILDING_BYBLOS_HELP', 					'+1 [ICON_FOOD] Food to Oases, Lakes, and Fishing Boats.' UNION ALL
SELECT 'TXT_KEY_BUILDING_CAPE_TOWN', 					'Cape of Good Hope' UNION ALL
SELECT 'TXT_KEY_BUILDING_CAPE_TOWN_HELP', 				'+10% [ICON_INTERNATIONAL_TRADE] Trade Route Length. Finishing a [ICON_INTERNATIONAL_TRADE] Trade Route generates 20-40 [ICON_GOLD] Gold scaling on the Designated City''s [ICON_CITIZEN] Population.' UNION ALL
SELECT 'TXT_KEY_BUILDING_GENEVA', 						'Ecclesiastical' UNION ALL
SELECT 'TXT_KEY_BUILDING_GENEVA_HELP', 					'+1 [ICON_PEACE] Faith for every 5 [ICON_CITIZEN] Citizens. Requires an Alliance with [COLOR_POSITIVE_TEXT]Geneva[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_BUILDING_HONG_KONG', 					'Prosperous' UNION ALL
SELECT 'TXT_KEY_BUILDING_HONG_KONG_HELP', 				'+1 [ICON_GOLD] Gold for every 6 [ICON_CITIZEN] Citizens. Requires an Alliance with [COLOR_POSITIVE_TEXT]Hong Kong[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_BUILDING_JERUSALEM', 					'Holy City' UNION ALL
SELECT 'TXT_KEY_BUILDING_JERUSALEM_HELP', 				'This is the holy city. Too many have made the pilgrimage to this city for their religion.' UNION ALL
SELECT 'TXT_KEY_BUILDING_KABUL', 						'Paradise on Earth' UNION ALL
SELECT 'TXT_KEY_BUILDING_KABUL_HELP', 					'City gains +0.66 [ICON_CULTURE] Culture for every Mountain within 3 tiles of the City. Requires an Alliance with [COLOR_POSITIVE_TEXT]Kabul[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_BUILDING_KATHMANDU', 					'The Mountain' UNION ALL
SELECT 'TXT_KEY_BUILDING_KATHMANDU_HELP', 				'City gains +0.66 [ICON_PEACE] Faith for every Mountain within 3 tiles of the City. Requires an Alliance with [COLOR_POSITIVE_TEXT]Kathmandu[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_BUILDING_RAGUSA', 						'Maritime Suzeranity' UNION ALL
SELECT 'TXT_KEY_BUILDING_RAGUSA_HELP', 					'City-State Alliances generate +1 [ICON_FOOD] Food. Requires an Alliance with [COLOR_POSITIVE_TEXT]Ragusa[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_BUILDING_RIGA', 						'Latvian Commercialism' UNION ALL
SELECT 'TXT_KEY_BUILDING_RIGA_HELP', 					'+3% [ICON_FOOD] Food. Requires an Alliance with [COLOR_POSITIVE_TEXT]Riga[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_BUILDING_SAMARKAND', 					'The Sogd' UNION ALL
SELECT 'TXT_KEY_BUILDING_SAMARKAND_HELP', 				'+4 [ICON_GOLD] Gold from Foreign Trade Routes to both origin and designated civilization.' UNION ALL
SELECT 'TXT_KEY_BUILDING_CHEVAK', 						'Cev''aq' UNION ALL
SELECT 'TXT_KEY_BUILDING_CHEVAK_HELP', 					'+1 [ICON_FOOD] Food for every 4 Tundra Tiles or 3 Snow Tiles.' UNION ALL
SELECT 'TXT_KEY_BUILDING_QUELIMANE', 					'River of the Good Signs' UNION ALL
SELECT 'TXT_KEY_BUILDING_QUELIMANE_HELP', 				'+1 [ICON_GOLDEN_AGE] Golden Age Points on River Tiles.' UNION ALL
SELECT 'TXT_KEY_BUILDING_TAIWAN', 						'Taiwan Miracle' UNION ALL
SELECT 'TXT_KEY_BUILDING_TAIWAN_HELP', 					'+10% [ICON_RESEARCH] Science from the Research Process.' UNION ALL
SELECT 'TXT_KEY_BUILDING_KIEV_2', 						'Stories of Old' UNION ALL
SELECT 'TXT_KEY_BUILDING_KIEV_2_HELP', 					'+5% [ICON_GREAT_MUSICIAN] Great Musicians generation.' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILAN_2', 						'House of Visconti' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILAN_2_HELP', 				'+5% [ICON_GREAT_ARTIST] Great Artists generation.' UNION ALL
SELECT 'TXT_KEY_BUILDING_OC_EO', 						'Lords of the Great Glass River' UNION ALL
SELECT 'TXT_KEY_BUILDING_OC_EO_HELP', 					'+1 [ICON_CULTURE_LOCAL] Border Growth Point in all Coastal Cities for each active International Sea [ICON_INTERNATIONAL_TRADE] Trade Route.' UNION ALL
SELECT 'TXT_KEY_BUILDING_OC_EO_2', 						'Lords of the Great Glass River' UNION ALL
SELECT 'TXT_KEY_BUILDING_OC_EO_2_HELP', 				'+1 [ICON_HAPPINESS_1] Happiness in Empire for each active International Sea [ICON_INTERNATIONAL_TRADE] Trade Route.' UNION ALL
SELECT 'TXT_KEY_BUILDING_CLERMONT', 					'Blessing of Clermont' UNION ALL
SELECT 'TXT_KEY_BUILDING_CLERMONT_HELP', 				'Receive a temporary random combat bonus upon the first combat.' UNION ALL
SELECT 'TXT_KEY_BUILDING_THIMPHU', 						'Druk Tsendhen' UNION ALL
SELECT 'TXT_KEY_BUILDING_THIMPHU_HELP', 				'+3 [ICON_CULTURE] Culture in Cities on Hill.' UNION ALL
SELECT 'TXT_KEY_BUILDING_THIMPHU_2', 					'Druk Tsendhen' UNION ALL
SELECT 'TXT_KEY_BUILDING_THIMPHU_2_HELP', 				'10% of City''s [ICON_CULTURE] Culture converted to [ICON_STRENGTH] Defense.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ANDORRA', 						'Pyrenean Paréage' UNION ALL
SELECT 'TXT_KEY_BUILDING_ANDORRA_HELP', 				'-10% [ICON_HAPPINESS_3] Boredom in Cities with Mountains nearby.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ANDORRA_2', 					'Pyrenean Paréage' UNION ALL
SELECT 'TXT_KEY_BUILDING_ANDORRA_2_HELP', 				'+1 [ICON_TOURISM] Tourism from Mountains.' UNION ALL
SELECT 'TXT_KEY_BUILDING_CANOSSA', 						'Ardent Flame In Pious Heart' UNION ALL
SELECT 'TXT_KEY_BUILDING_CANOSSA_HELP', 				'+1 [ICON_DIPLOMAT] Great Diplomat Point if City has a Temple.' UNION ALL
-- regular buildings
SELECT 'TXT_KEY_BUILDING_KIEV', 						'Bylina' UNION ALL
SELECT 'TXT_KEY_BUILDING_KIEV_HELP', 					'Requires an Alliance with [COLOR_CYAN]Kyiv[ENDCOLOR]. +1 Musician Slot. Can never be destroyed.' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILAN', 						'Visconti Emissary' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILAN_HELP', 					'Requires an Alliance with [COLOR_CYAN]Milan[ENDCOLOR]. +1 Artist Slot. Can never be destroyed.' UNION ALL
SELECT 'TXT_KEY_BUILDING_VALLETTA', 					'The Grand Harbor' UNION ALL
SELECT 'TXT_KEY_BUILDING_VALLETTA_HELP', 				'City must have a Fishing Boat resource improved and Player must be the Ally of [COLOR_CYAN]Valletta[ENDCOLOR]. +2 [ICON_FOOD] Food and +2 [ICON_RESEARCH] Science (lost without the Alliance). +15 XP to all newly trained Naval Units. +25 City HP. Can never be destroyed.' UNION ALL
SELECT 'TXT_KEY_BUILDING_VILNIUS', 						'The Gate of Dawn' UNION ALL
SELECT 'TXT_KEY_BUILDING_VILNIUS_HELP', 				'Requires an Alliance with [COLOR_CYAN]Vilnius[ENDCOLOR]. +1 Writer Slot. Can never be destroyed.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH1', 						'Naomh Gaelach' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH1_HELP', 				'Requires an Alliance with [COLOR_CYAN]Armagh[ENDCOLOR]. Grants [ICON_CULTURE] Culture bonus based on number of Active Events (lost without the Alliance). Reduces [ICON_HAPPINESS_3] Boredom. Can never be destroyed.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH2', 						'Naomh Breandán' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH2_HELP', 				'Requires an Alliance with [COLOR_CYAN]Armagh[ENDCOLOR]. Grants [ICON_RESEARCH] Science bonus based on number of Active Events (lost without the Alliance). Reduces [ICON_HAPPINESS_3] Illiteracy. Can never be destroyed.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH3', 						'Naomh Pádraig' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH3_HELP', 				'Requires an Alliance with [COLOR_CYAN]Armagh[ENDCOLOR]. Grants [ICON_GOLD] Gold bonus based on number of Active Events (lost without the Alliance). Reduces [ICON_HAPPINESS_3] Poverty. Can never be destroyed.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH4', 						'Naomh Bríd' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH4_HELP', 				'Requires an Alliance with [COLOR_CYAN]Armagh[ENDCOLOR]. Grants [ICON_FOOD] Food and [ICON_PRODUCTION] Production bonus based on number of Active Events (lost without the Alliance). Reduces [ICON_HAPPINESS_3] Distress. Can never be destroyed.' UNION ALL
-- world wonders
SELECT 'TXT_KEY_BUILDING_LHASA', 						'Potala Palace' UNION ALL
SELECT 'TXT_KEY_BUILDING_LHASA_HELP', 					'+1 and +10% [ICON_CULTURE] Culture and [ICON_FOOD] Food. Grants 1 additional delegate in the World Congress. Requires an active bonus from [COLOR_POSITIVE_TEXT]Lhasa[ENDCOLOR] and an active session of the [COLOR_POSITIVE_TEXT]World Congress[ENDCOLOR]. Yield modifiers halved without the Alliance. Can never be destroyed.' UNION ALL
SELECT 'TXT_KEY_BUILDING_LHASA_QUOTE', 					'[NEWLINE][TAB][TAB]"The first time I stepped onto the rooftop of the Potala Palace, I felt, as never before or since, as if I were stepping onto the rooftop of my being; onto some dimension of consciousness that I''d never visited before."[NEWLINE] – Pico Iyer';
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
-- Definitions - Minor Civilizations
---------------------------------------------------
INSERT INTO MinorCivilizations 
			(Type, 						ShortDescription, 					Civilopedia, 						Description, 						Adjective, 								ArtDefineTag, 					DefaultPlayerColor, 				ArtStyleType, 				ArtStyleSuffix, 	ArtStylePrefix, 	MinorCivTrait,					BullyUnitClass)
SELECT 		'MINOR_CIV_CLERMONT', 		'TXT_KEY_CITYSTATE_CLERMONT', 		'TXT_KEY_CIV5_CLERMONT_TEXT', 		'TXT_KEY_CITYSTATE_CLERMONT', 		'TXT_KEY_CITYSTATE_CLERMONT_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'TXT_KEY_CITYSTATE_HONDURAS', 		'TXT_KEY_CIV5_HONDURAS_TEXT', 		'TXT_KEY_CITYSTATE_HONDURAS', 		'TXT_KEY_CITYSTATE_HONDURAS_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'TXT_KEY_CITYSTATE_AUCKLAND', 		'TXT_KEY_CIV5_AUCKLAND_TEXT', 		'TXT_KEY_CITYSTATE_AUCKLAND', 		'TXT_KEY_CITYSTATE_AUCKLAND_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_BLUE', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MARITIME',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_ARMAGH', 		'TXT_KEY_CITYSTATE_ARMAGH', 		'TXT_KEY_CIV5_ARMAGH_TEXT', 		'TXT_KEY_CITYSTATE_ARMAGH', 		'TXT_KEY_CITYSTATE_ARMAGH_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'TXT_KEY_CITYSTATE_MUSCAT', 		'TXT_KEY_CIV5_MUSCAT_TEXT', 		'TXT_KEY_CITYSTATE_MUSCAT', 		'TXT_KEY_CITYSTATE_MUSCAT_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'TXT_KEY_CITYSTATE_GRANADA', 		'TXT_KEY_CIV5_GRANADA_TEXT', 		'TXT_KEY_CITYSTATE_GRANADA', 		'TXT_KEY_CITYSTATE_GRANADA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_YELLOW', 		'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_NANMANDOL', 		'TXT_KEY_CITYSTATE_NANMANDOL', 		'TXT_KEY_CIV5_NANMANDOL_TEXT', 		'TXT_KEY_CITYSTATE_NANMANDOL',		'TXT_KEY_CITYSTATE_NANMANDOL_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_CULTURED',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'TXT_KEY_CITYSTATE_GWYNEDD', 		'TXT_KEY_CIV5_GWYNEDD_TEXT', 		'TXT_KEY_CITYSTATE_GWYNEDD', 		'TXT_KEY_CITYSTATE_GWYNEDD_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_PURPLE', 	'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_CULTURED',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MUISCA', 		'TXT_KEY_CITYSTATE_MUISCA', 		'TXT_KEY_CIV5_MUISCA_TEXT', 		'TXT_KEY_CITYSTATE_MUISCA', 		'TXT_KEY_CITYSTATE_MUISCA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'TXT_KEY_CITYSTATE_LACONIA', 		'TXT_KEY_CIV5_LACONIA_TEXT', 		'TXT_KEY_CITYSTATE_LACONIA', 		'TXT_KEY_CITYSTATE_LACONIA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_CHEVAK', 		'TXT_KEY_CITYSTATE_CHEVAK', 		'TXT_KEY_CIV5_CHEVAK_TEXT', 		'TXT_KEY_CITYSTATE_CHEVAK', 		'TXT_KEY_CITYSTATE_CHEVAK_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MARITIME',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO', 	'TXT_KEY_CIV5_SANTO_DOMINGO_TEXT', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_YELLOW', 	'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'TXT_KEY_CITYSTATE_MANAGUA', 		'TXT_KEY_CIV5_MANAGUA_TEXT', 		'TXT_KEY_CITYSTATE_MANAGUA', 		'TXT_KEY_CITYSTATE_MANAGUA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'TXT_KEY_CITYSTATE_ODENSO', 		'TXT_KEY_CIV5_ODENSO_TEXT', 		'TXT_KEY_CITYSTATE_ODENSO', 		'TXT_KEY_CITYSTATE_ODENSO_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_PURPLE', 	'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_YANGCHENG', 		'TXT_KEY_CITYSTATE_YANGCHENG', 		'TXT_KEY_CIV5_YANGCHENG_TEXT', 		'TXT_KEY_CITYSTATE_YANGCHENG', 		'TXT_KEY_CITYSTATE_YANGCHENG_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GRAY', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'TXT_KEY_CITYSTATE_PHANOTEUS', 		'TXT_KEY_CIV5_PHANOTEUS_TEXT', 		'TXT_KEY_CITYSTATE_PHANOTEUS', 		'TXT_KEY_CITYSTATE_PHANOTEUS_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_BLUE', 	'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DOUALA', 		'TXT_KEY_CITYSTATE_DOUALA', 		'TXT_KEY_CIV5_DOUALA_TEXT', 		'TXT_KEY_CITYSTATE_DOUALA', 		'TXT_KEY_CITYSTATE_DOUALA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_BLUE', 	'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'TXT_KEY_CITYSTATE_AMBRACIA', 		'TXT_KEY_CIV5_AMBRACIA_TEXT', 		'TXT_KEY_CITYSTATE_AMBRACIA', 		'TXT_KEY_CITYSTATE_AMBRACIA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'TXT_KEY_CITYSTATE_DJIBOUTI', 		'TXT_KEY_CIV5_DJIBOUTI_TEXT', 		'TXT_KEY_CITYSTATE_DJIBOUTI', 		'TXT_KEY_CITYSTATE_DJIBOUTI_ADJ', 		'ART_DEF_CIVILIZATION_MINOR',	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'TXT_KEY_CITYSTATE_DODOMA', 		'TXT_KEY_CIV5_DODOMA_TEXT', 		'TXT_KEY_CITYSTATE_DODOMA', 		'TXT_KEY_CITYSTATE_DODOMA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'TXT_KEY_CITYSTATE_FAYA', 			'TXT_KEY_CIV5_FAYA_TEXT', 			'TXT_KEY_CITYSTATE_FAYA', 			'TXT_KEY_CITYSTATE_FAYA_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'TXT_KEY_CITYSTATE_KIGALI', 		'TXT_KEY_CIV5_KIGALI_TEXT', 		'TXT_KEY_CITYSTATE_KIGALI', 		'TXT_KEY_CITYSTATE_KIGALI_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'TXT_KEY_CITYSTATE_LEVUKA', 		'TXT_KEY_CIV5_LEVUKA_TEXT', 		'TXT_KEY_CITYSTATE_LEVUKA', 		'TXT_KEY_CITYSTATE_LEVUKA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_BLUE', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MARITIME',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'TXT_KEY_CITYSTATE_QUELIMANE', 		'TXT_KEY_CIV5_QUELIMANE_TEXT', 		'TXT_KEY_CITYSTATE_QUELIMANE', 		'TXT_KEY_CITYSTATE_QUELIMANE_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'TXT_KEY_CITYSTATE_SIERRA_LEONE', 	'TXT_KEY_CIV5_SIERRA_LEONE_TEXT',	'TXT_KEY_CITYSTATE_SIERRA_LEONE',	'TXT_KEY_CITYSTATE_SIERRA_LEONE_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_PURPLE', 	'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_CULTURED',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'TXT_KEY_CITYSTATE_SURREY', 		'TXT_KEY_CIV5_SURREY_TEXT', 		'TXT_KEY_CITYSTATE_SURREY', 		'TXT_KEY_CITYSTATE_SURREY_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GRAY', 			'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'TXT_KEY_CITYSTATE_TAIWAN', 		'TXT_KEY_CIV5_TAIWAN_TEXT', 		'TXT_KEY_CITYSTATE_TAIWAN', 		'TXT_KEY_CITYSTATE_TAIWAN_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MARITIME',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'TXT_KEY_CITYSTATE_OC_EO', 			'TXT_KEY_CIV5_OC_EO_TEXT', 			'TXT_KEY_CITYSTATE_OC_EO', 			'TXT_KEY_CITYSTATE_OC_EO_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_THIMPHU', 		'TXT_KEY_CITYSTATE_THIMPHU', 		'TXT_KEY_CIV5_THIMPHU_TEXT', 		'TXT_KEY_CITYSTATE_THIMPHU', 		'TXT_KEY_CITYSTATE_THIMPHU_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_BLUE', 	'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_CULTURED',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_ANDORRA', 		'TXT_KEY_CITYSTATE_ANDORRA', 		'TXT_KEY_CIV5_ANDORRA_TEXT', 		'TXT_KEY_CITYSTATE_ANDORRA', 		'TXT_KEY_CITYSTATE_ANDORRA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_CULTURED',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'TXT_KEY_CITYSTATE_CANOSSA', 		'TXT_KEY_CIV5_CANOSSA_TEXT', 		'TXT_KEY_CITYSTATE_CANOSSA', 		'TXT_KEY_CITYSTATE_CANOSSA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER';

INSERT INTO MinorCivilization_CityNames 
			(MinorCivType, 				CityName)
SELECT 		'MINOR_CIV_CLERMONT', 		'TXT_KEY_CITYSTATE_CLERMONT' UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'TXT_KEY_CITYSTATE_HONDURAS' UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'TXT_KEY_CITYSTATE_AUCKLAND' UNION ALL
SELECT 		'MINOR_CIV_ARMAGH', 		'TXT_KEY_CITYSTATE_ARMAGH' UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'TXT_KEY_CITYSTATE_MUSCAT' UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'TXT_KEY_CITYSTATE_GRANADA' UNION ALL
SELECT 		'MINOR_CIV_NANMANDOL', 		'TXT_KEY_CITYSTATE_NANMANDOL' UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'TXT_KEY_CITYSTATE_GWYNEDD' UNION ALL
SELECT 		'MINOR_CIV_MUISCA', 		'TXT_KEY_CITYSTATE_MUISCA' UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'TXT_KEY_CITYSTATE_LACONIA' UNION ALL
SELECT 		'MINOR_CIV_CHEVAK', 		'TXT_KEY_CITYSTATE_CHEVAK' UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO' UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'TXT_KEY_CITYSTATE_MANAGUA' UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'TXT_KEY_CITYSTATE_ODENSO' UNION ALL
SELECT 		'MINOR_CIV_YANGCHENG', 		'TXT_KEY_CITYSTATE_YANGCHENG' UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'TXT_KEY_CITYSTATE_PHANOTEUS' UNION ALL
SELECT 		'MINOR_CIV_DOUALA', 		'TXT_KEY_CITYSTATE_DOUALA' UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'TXT_KEY_CITYSTATE_AMBRACIA' UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'TXT_KEY_CITYSTATE_DJIBOUTI' UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'TXT_KEY_CITYSTATE_DODOMA' UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'TXT_KEY_CITYSTATE_FAYA' UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'TXT_KEY_CITYSTATE_KIGALI' UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'TXT_KEY_CITYSTATE_LEVUKA' UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'TXT_KEY_CITYSTATE_QUELIMANE' UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'TXT_KEY_CITYSTATE_SIERRA_LEONE' UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'TXT_KEY_CITYSTATE_SURREY' UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'TXT_KEY_CITYSTATE_TAIWAN' UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'TXT_KEY_CITYSTATE_OC_EO' UNION ALL
SELECT 		'MINOR_CIV_THIMPHU', 		'TXT_KEY_CITYSTATE_THIMPHU' UNION ALL
SELECT 		'MINOR_CIV_ANDORRA', 		'TXT_KEY_CITYSTATE_ANDORRA' UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'TXT_KEY_CITYSTATE_CANOSSA';

INSERT INTO MinorCivilization_Flavors
			(MinorCivType, 				FlavorType, 				Flavor)
SELECT 		'MINOR_CIV_CLERMONT', 		'FLAVOR_OFFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_CLERMONT', 		'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_CLERMONT', 		'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_CLERMONT', 		'FLAVOR_CITY_DEFENSE', 		7 UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'FLAVOR_GOLD', 				10 UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'FLAVOR_NAVAL', 			8 UNION ALL
SELECT 		'MINOR_CIV_ARMAGH', 		'FLAVOR_RELIGION', 			10 UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'FLAVOR_GOLD', 				10 UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'FLAVOR_OFFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'FLAVOR_CITY_DEFENSE', 		7 UNION ALL
SELECT 		'MINOR_CIV_NANMANDOL', 		'FLAVOR_CULTURE', 			10 UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'FLAVOR_CULTURE', 			10 UNION ALL
SELECT 		'MINOR_CIV_MUISCA', 		'FLAVOR_GOLD', 				10 UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'FLAVOR_OFFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'FLAVOR_CITY_DEFENSE', 		7 UNION ALL
SELECT 		'MINOR_CIV_CHEVAK', 		'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_CHEVAK', 		'FLAVOR_NAVAL', 			8 UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'FLAVOR_GOLD', 				10 UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'FLAVOR_GOLD', 				10 UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'FLAVOR_OFFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'FLAVOR_CITY_DEFENSE', 		7 UNION ALL
SELECT 		'MINOR_CIV_YANGCHENG', 		'FLAVOR_RELIGION', 			10 UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'FLAVOR_OFFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'FLAVOR_CITY_DEFENSE', 		7 UNION ALL
SELECT 		'MINOR_CIV_DOUALA', 		'FLAVOR_GOLD', 				10 UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'FLAVOR_OFFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'FLAVOR_CITY_DEFENSE', 		7 UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'FLAVOR_GOLD', 				10 UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'FLAVOR_OFFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'FLAVOR_CITY_DEFENSE', 		7 UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'FLAVOR_OFFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'FLAVOR_CITY_DEFENSE', 		7 UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'FLAVOR_GOLD', 				10 UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'FLAVOR_OFFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'FLAVOR_NAVAL', 			2 UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'FLAVOR_NAVAL', 			8 UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'FLAVOR_CULTURE', 			10 UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'FLAVOR_OFFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'FLAVOR_CITY_DEFENSE', 		7 UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'FLAVOR_CITY_DEFENSE', 		10 UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'FLAVOR_DEFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'FLAVOR_GOLD', 				8 UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'FLAVOR_WONDER', 			2 UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'FLAVOR_NAVAL', 			10 UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'FLAVOR_EXPANSION', 		10 UNION ALL
SELECT 		'MINOR_CIV_THIMPHU', 		'FLAVOR_CULTURE', 			10 UNION ALL
SELECT 		'MINOR_CIV_THIMPHU', 		'FLAVOR_WONDER', 			3 UNION ALL
SELECT 		'MINOR_CIV_ANDORRA', 		'FLAVOR_CULTURE', 			7 UNION ALL
SELECT 		'MINOR_CIV_ANDORRA', 		'FLAVOR_CITY_DEFENSE', 		8 UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'FLAVOR_CITY_DEFENSE', 		5 UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'FLAVOR_MILITARY_TRAINING', 5 UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'FLAVOR_RELIGION', 			10;
---------------------------------------------------
-- Definitions - Policies
---------------------------------------------------
INSERT INTO Policies (Type, Description)
SELECT 'POLICY_ALMATY', 				'TXT_KEY_CITYSTATE_ALMATY'UNION ALL
SELECT 'POLICY_BOGOTA', 				'TXT_KEY_CITYSTATE_BOGOTA' UNION ALL
SELECT 'POLICY_BUCHAREST', 				'TXT_KEY_CITYSTATE_BUCHAREST' UNION ALL
SELECT 'POLICY_GENOA', 					'TXT_KEY_CITYSTATE_GENOA' UNION ALL
SELECT 'POLICY_IFE', 					'TXT_KEY_CITYSTATE_IFE' UNION ALL
SELECT 'POLICY_LHASA', 					'TXT_KEY_CITYSTATE_LHASA' UNION ALL
SELECT 'POLICY_SOFIA', 					'TXT_KEY_CITYSTATE_SOFIA' UNION ALL
SELECT 'POLICY_SYDNEY', 				'TXT_KEY_CITYSTATE_SYDNEY' UNION ALL
SELECT 'POLICY_TYRE', 					'TXT_KEY_CITYSTATE_TYRE' UNION ALL
SELECT 'POLICY_UR', 					'TXT_KEY_CITYSTATE_UR' UNION ALL
SELECT 'POLICY_VATICAN_CITY', 			'TXT_KEY_CITYSTATE_VATICAN_CITY' UNION ALL
SELECT 'POLICY_HONDURAS', 				'TXT_KEY_CITYSTATE_HONDURAS' UNION ALL
SELECT 'POLICY_AUCKLAND', 				'TXT_KEY_CITYSTATE_AUCKLAND' UNION ALL
SELECT 'POLICY_GWYNEDD', 				'TXT_KEY_CITYSTATE_GWYNEDD' UNION ALL
SELECT 'POLICY_MUISCA', 				'TXT_KEY_CITYSTATE_MUISCA' UNION ALL
SELECT 'POLICY_SANTO_DOMINGO', 			'TXT_KEY_CITYSTATE_SANTO_DOMINGO' UNION ALL
SELECT 'POLICY_MANAGUA', 				'TXT_KEY_CITYSTATE_MANAGUA' UNION ALL
SELECT 'POLICY_PHANOTEUS', 				'TXT_KEY_CITYSTATE_PHANOTEUS' UNION ALL
SELECT 'POLICY_DOUALA', 				'TXT_KEY_CITYSTATE_DOUALA' UNION ALL
SELECT 'POLICY_AMBRACIA', 				'TXT_KEY_CITYSTATE_AMBRACIA' UNION ALL
SELECT 'POLICY_MARITIME', 				'TXT_KEY_BUILDING_MARITIME' UNION ALL
SELECT 'POLICY_RELIGIOUS', 				'TXT_KEY_BUILDING_RELIGIOUS' UNION ALL
SELECT 'POLICY_RELIGIOUS_FRIENDLY', 	'TXT_KEY_BUILDING_RELIGIOUS_FRIENDLY' UNION ALL
SELECT 'POLICY_MILITARISTIC', 			'TXT_KEY_BUILDING_MILITARISTIC' UNION ALL
SELECT 'POLICY_MILITARISTIC_FRIENDLY', 	'TXT_KEY_BUILDING_MILITARISTIC_FRIENDLY';

UPDATE Policies SET GreatGeneralExtraBonus = 5 WHERE Type = 'POLICY_SOFIA';
UPDATE Policies SET FaithCostModifier = -10 WHERE Type = 'POLICY_VATICAN_CITY';
UPDATE Policies SET CSResourcesCountForMonopolies = 1 WHERE Type = 'POLICY_HONDURAS';
UPDATE Policies SET MonopolyModFlat = 3 WHERE Type = 'POLICY_SANTO_DOMINGO';
UPDATE Policies SET MonopolyModPercent = 7 WHERE Type = 'POLICY_MANAGUA';
UPDATE Policies SET EspionageModifier = -20, StealTechFasterModifier = 20, RiggingElectionModifier = 20 WHERE Type = 'POLICY_PHANOTEUS';
UPDATE Policies SET FreeTradeRoute = 1 WHERE Type = 'POLICY_DOUALA';
UPDATE Policies SET CityStateUnitFrequencyModifier = 50 WHERE Type = 'POLICY_AMBRACIA';

UPDATE Policies SET CityGrowthMod = 15 WHERE Type = 'POLICY_MARITIME';
UPDATE Policies SET CityGrowthMod = -33 WHERE Type = 'POLICY_MILITARISTIC';
UPDATE Policies SET CityStateUnitFrequencyModifier = 5 WHERE Type = 'POLICY_MILITARISTIC_FRIENDLY';


INSERT INTO Policy_YieldGPExpend 
			(PolicyType, 	YieldType, 					Yield)
SELECT 		'POLICY_GENOA', 'YIELD_GOLD', 				50 UNION ALL
SELECT 		'POLICY_GENOA', 'YIELD_GOLDEN_AGE_POINTS', 	15 UNION ALL
SELECT 		'POLICY_LHASA', 'YIELD_FAITH', 				25;

INSERT INTO Policy_ConquerorYield 
			(PolicyType, 		YieldType, 			Yield)
SELECT 		'POLICY_BOGOTA', 	'YIELD_CULTURE', 	20;

INSERT INTO Policy_YieldChangeTradeRoute 
			(PolicyType, 		YieldType, 			Yield)
SELECT 		'POLICY_ALMATY', 	'YIELD_SCIENCE', 	1 UNION ALL
SELECT 		'POLICY_UR', 		'YIELD_FOOD', 		2;

INSERT INTO Policy_TradeRouteYieldChange
			(PolicyType, 					DomainType,			YieldType, 			Yield)
SELECT 		'POLICY_RELIGIOUS_FRIENDLY', 	'DOMAIN_LAND',		'YIELD_CULTURE', 	2 UNION ALL
SELECT 		'POLICY_RELIGIOUS_FRIENDLY', 	'DOMAIN_SEA',		'YIELD_CULTURE', 	2;

INSERT INTO Policy_YieldFromBorderGrowth 
			(PolicyType, 	YieldType, 		Yield)
SELECT 		'POLICY_IFE', 	'YIELD_FAITH', 	3;

INSERT INTO Policy_CoastalCityYieldChanges 
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_AUCKLAND', 	'YIELD_FOOD', 	3;

INSERT INTO Policy_GreatWorkYieldChanges 
			(PolicyType, 		YieldType, 			Yield)
SELECT 		'POLICY_BUCHAREST', 'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'POLICY_TYRE', 		'YIELD_GOLD', 		2;

INSERT INTO Policy_WLTKDYieldMod 
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_SYDNEY', 	'YIELD_FOOD', 	5;

INSERT INTO Policy_GoldenAgeYieldMod
			(PolicyType, 		YieldType, 			Yield)
SELECT 		'POLICY_GWYNEDD', 	'YIELD_CULTURE', 	10;

INSERT INTO Policy_CapitalYieldPerPopChanges
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_MUISCA', 	'YIELD_GOLD', 	50;

INSERT INTO Policy_CapitalYieldPerPopChangeEmpire
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_MUISCA', 	'YIELD_GOLD', 	30;

INSERT INTO Policy_YieldChangesNaturalWonder
			(PolicyType, 			YieldType, 			Yield)
SELECT 		'POLICY_RELIGIOUS', 	'YIELD_GOLD', 		2 UNION ALL
SELECT		'POLICY_RELIGIOUS', 	'YIELD_CULTURE', 	2 UNION ALL
SELECT		'POLICY_RELIGIOUS', 	'YIELD_FAITH', 		2;
---------------------------------------------------
-- Definitions - Unit Promotions
---------------------------------------------------
INSERT INTO UnitPromotions 
			(Type, 									Description, 								Help, 											CannotBeChosen, Sound, 				PortraitIndex, 	IconAtlas, 				PediaType, 			PediaEntry)
SELECT 		'PROMOTION_ANTANANARIVO', 				'TXT_KEY_PROMOTION_ANTANANARIVO', 			'TXT_KEY_PROMOTION_ANTANANARIVO_HELP', 			1, 				'AS2D_IF_LEVELUP', 	7, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_ANTANANARIVO' UNION ALL
SELECT 		'PROMOTION_BELGRADE', 					'TXT_KEY_PROMOTION_BELGRADE', 				'TXT_KEY_PROMOTION_BELGRADE_HELP', 				1, 				'AS2D_IF_LEVELUP', 	8, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SIEGE', 		'TXT_KEY_PROMOTION_BELGRADE' UNION ALL
SELECT 		'PROMOTION_HANOI', 						'TXT_KEY_PROMOTION_HANOI', 					'TXT_KEY_PROMOTION_HANOI_HELP', 				1, 				'AS2D_IF_LEVELUP', 	9, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_HANOI' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 				'TXT_KEY_PROMOTION_MBANZA_KONGO', 			'TXT_KEY_PROMOTION_MBANZA_KONGO_HELP', 			1, 				'AS2D_IF_LEVELUP', 	11, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_MBANZA_KONGO' UNION ALL
SELECT 		'PROMOTION_SIDON', 						'TXT_KEY_PROMOTION_SIDON', 					'TXT_KEY_PROMOTION_SIDON_HELP', 				1, 				'AS2D_IF_LEVELUP', 	13, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_SIDON' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 					'TXT_KEY_PROMOTION_YEREVAN', 				'TXT_KEY_PROMOTION_YEREVAN_HELP', 				1, 				'AS2D_IF_LEVELUP', 	14, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_YEREVAN' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 					'TXT_KEY_PROMOTION_CLERMONT', 				'TXT_KEY_PROMOTION_CLERMONT_HELP', 				1, 				'AS2D_IF_LEVELUP', 	0, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 					'TXT_KEY_PROMOTION_CLERMONT1', 				'TXT_KEY_PROMOTION_CLERMONT1_HELP', 			1, 				'AS2D_IF_LEVELUP', 	1, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT1' UNION ALL
SELECT 		'PROMOTION_CLERMONT2', 					'TXT_KEY_PROMOTION_CLERMONT2', 				'TXT_KEY_PROMOTION_CLERMONT2_HELP', 			1, 				'AS2D_IF_LEVELUP', 	2, 				'UCS_PROMOTION_ATLAS',	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT2' UNION ALL
SELECT 		'PROMOTION_CLERMONT3', 					'TXT_KEY_PROMOTION_CLERMONT3', 				'TXT_KEY_PROMOTION_CLERMONT3_HELP', 			1, 				'AS2D_IF_LEVELUP', 	3, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT3' UNION ALL
SELECT 		'PROMOTION_CLERMONT4', 					'TXT_KEY_PROMOTION_CLERMONT4', 				'TXT_KEY_PROMOTION_CLERMONT4_HELP', 			1, 				'AS2D_IF_LEVELUP', 	4, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT4' UNION ALL
SELECT 		'PROMOTION_CLERMONT5', 					'TXT_KEY_PROMOTION_CLERMONT5', 				'TXT_KEY_PROMOTION_CLERMONT5_HELP', 			1, 				'AS2D_IF_LEVELUP', 	5, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT5' UNION ALL
SELECT 		'PROMOTION_CLERMONT6', 					'TXT_KEY_PROMOTION_CLERMONT6', 				'TXT_KEY_PROMOTION_CLERMONT6_HELP', 			1, 				'AS2D_IF_LEVELUP', 	6, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT6' UNION ALL
SELECT 		'PROMOTION_LACONIA', 					'TXT_KEY_PROMOTION_LACONIA', 				'TXT_KEY_PROMOTION_LACONIA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	10, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_LACONIA' UNION ALL
SELECT 		'PROMOTION_ODENSO', 					'TXT_KEY_PROMOTION_ODENSO', 				'TXT_KEY_PROMOTION_ODENSO_HELP', 				1, 				'AS2D_IF_LEVELUP', 	12, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_ODENSO' UNION ALL
SELECT 		'PROMOTION_AMBRACIA', 					'TXT_KEY_PROMOTION_AMBRACIA', 				'TXT_KEY_PROMOTION_AMBRACIA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	16, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_AMBRACIA' UNION ALL
SELECT 		'PROMOTION_DODOMA', 					'TXT_KEY_PROMOTION_DODOMA', 				'TXT_KEY_PROMOTION_DODOMA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	15, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_NAVAL', 		'TXT_KEY_PROMOTION_DODOMA' UNION ALL
SELECT 		'PROMOTION_FAYA', 						'TXT_KEY_PROMOTION_FAYA', 					'TXT_KEY_PROMOTION_FAYA_HELP', 					1, 				'AS2D_IF_LEVELUP', 	17, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_FAYA' UNION ALL
SELECT 		'PROMOTION_SURREY', 					'TXT_KEY_PROMOTION_SURREY', 				'TXT_KEY_PROMOTION_SURREY_HELP', 				1, 				'AS2D_IF_LEVELUP', 	18, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_AIR', 		'TXT_KEY_PROMOTION_SURREY' UNION ALL
SELECT 		'PROMOTION_LEVUKA', 					'TXT_KEY_PROMOTION_LEVUKA', 				'TXT_KEY_PROMOTION_LEVUKA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	20, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_LEVUKA' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 		'TXT_KEY_PROMOTION_MILITARISTIC_NEUTRAL', 	'TXT_KEY_PROMOTION_MILITARISTIC_NEUTRAL_HELP', 	1, 				'AS2D_IF_LEVELUP', 	21, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_MILITARISTIC_NEUTRAL';

UPDATE UnitPromotions SET MaxHitPointsChange = 25 WHERE Type = 'PROMOTION_BELGRADE';
UPDATE UnitPromotions SET FriendlyLandsModifier = 10 WHERE Type = 'PROMOTION_HANOI';
UPDATE UnitPromotions SET EnemyHealChange = 5 WHERE Type = 'PROMOTION_SIDON';
UPDATE UnitPromotions SET ExperiencePercent = 15 WHERE Type = 'PROMOTION_CLERMONT';
UPDATE UnitPromotions SET HasPostCombatPromotions = 1 WHERE Type = 'PROMOTION_CLERMONT1';
UPDATE UnitPromotions SET MovesChange = 2, CanMoveAfterAttacking = 1, PromotionDuration = 10 WHERE Type = 'PROMOTION_CLERMONT2';
UPDATE UnitPromotions SET AdjacentMod = 20, PromotionDuration = 10 WHERE Type = 'PROMOTION_CLERMONT3';
UPDATE UnitPromotions SET AttackMod = 10, AttackFortifiedMod = 15, PromotionDuration = 10 WHERE Type = 'PROMOTION_CLERMONT4';
UPDATE UnitPromotions SET DefenseMod = 15, AlwaysHeal = 1, PromotionDuration = 10 WHERE Type = 'PROMOTION_CLERMONT5';
UPDATE UnitPromotions SET GreatGeneral = 1, SameTileHealChange = 5, AdjacentTileHealChange = 5, PromotionDuration = 10 WHERE Type = 'PROMOTION_CLERMONT6';
UPDATE UnitPromotions SET AdjacentMod = 15 WHERE Type = 'PROMOTION_LACONIA';
UPDATE UnitPromotions SET NeutralHealChange = 5, VisibilityChange = 1 WHERE Type = 'PROMOTION_ODENSO';
UPDATE UnitPromotions SET MovesChange = 1, CombatPercent = 5 WHERE Type = 'PROMOTION_DODOMA';
UPDATE UnitPromotions SET ExperiencePercent = 20 WHERE Type = 'PROMOTION_MILITARISTIC_NEUTRAL';

INSERT INTO UnitPromotions_UnitCombats 
			(PromotionType, 					UnitCombatType)
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
SELECT 		'PROMOTION_BELGRADE', 				'UNITCOMBAT_SIEGE' UNION ALL
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
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO',			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_ARMOR' UNION ALL
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
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_ARMOR' UNION ALL
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
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_RECON' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_GUN' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT  	'PROMOTION_DODOMA', 				'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT  	'PROMOTION_DODOMA', 				'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT  	'PROMOTION_DODOMA', 				'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT  	'PROMOTION_DODOMA', 				'UNITCOMBAT_CARRIER' UNION ALL
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
SELECT  	'PROMOTION_SURREY', 				'UNITCOMBAT_FIGHTER' UNION ALL
SELECT  	'PROMOTION_SURREY', 				'UNITCOMBAT_BOMBER' UNION ALL
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
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_FIGHTER' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_BOMBER';

INSERT INTO UnitPromotions_PostCombatRandomPromotion
			(PromotionType, 		NewPromotion)
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT2' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT3' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT4' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT5' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT6';

INSERT INTO UnitPromotions_Features
			(PromotionType, 			FeatureType, 			DoubleMove, Attack, Defense)
SELECT 		'PROMOTION_MBANZA_KONGO', 	'FEATURE_FOREST', 		0, 			15, 	15 UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 	'FEATURE_JUNGLE', 		0, 			15, 	15 UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 	'FEATURE_MARSH', 		0, 			15, 	15 UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 	'FEATURE_FLOOD_PLAINS', 0, 			15, 	15;

INSERT INTO UnitPromotions_YieldFromKills
			(PromotionType, 			YieldType, 			Yield)
SELECT 		'PROMOTION_ANTANANARIVO', 	'YIELD_GOLD', 		100 UNION ALL
SELECT 		'PROMOTION_YEREVAN', 		'YIELD_CULTURE', 	50 UNION ALL
SELECT 		'PROMOTION_FAYA', 			'YIELD_SCIENCE', 	50;

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
---------------------------------------------------
-- Definitions - Buildings
---------------------------------------------------
INSERT INTO BuildingClasses 
			(Type, 									DefaultBuilding, 					Description)
SELECT 		'BUILDINGCLASS_BYBLOS', 				'BUILDING_BYBLOS', 					'TXT_KEY_BUILDING_BYBLOS' UNION ALL
SELECT 		'BUILDINGCLASS_CAPE_TOWN', 				'BUILDING_CAPE_TOWN', 				'TXT_KEY_BUILDING_CAPE_TOWN' UNION ALL
SELECT 		'BUILDINGCLASS_GENEVA', 				'BUILDING_GENEVA', 					'TXT_KEY_BUILDING_GENEVA' UNION ALL
SELECT 		'BUILDINGCLASS_HONG_KONG', 				'BUILDING_HONG_KONG', 				'TXT_KEY_BUILDING_HONG_KONG' UNION ALL
SELECT 		'BUILDINGCLASS_JERUSALEM', 				'BUILDING_JERUSALEM', 				'TXT_KEY_BUILDING_JERUSALEM' UNION ALL
SELECT 		'BUILDINGCLASS_KABUL', 					'BUILDING_KABUL', 					'TXT_KEY_BUILDING_KABUL' UNION ALL
SELECT 		'BUILDINGCLASS_KATHMANDU', 				'BUILDING_KATHMANDU', 				'TXT_KEY_BUILDING_KATHMANDU' UNION ALL
SELECT 		'BUILDINGCLASS_KIEV', 					'BUILDING_KIEV', 					'TXT_KEY_BUILDING_KIEV' UNION ALL
SELECT 		'BUILDINGCLASS_KIEV_2', 				'BUILDING_KIEV_2', 					'TXT_KEY_BUILDING_KIEV_2' UNION ALL
SELECT 		'BUILDINGCLASS_LHASA', 					'BUILDING_LHASA', 					'TXT_KEY_BUILDING_LHASA' UNION ALL
SELECT 		'BUILDINGCLASS_MILAN', 					'BUILDING_MILAN', 					'TXT_KEY_BUILDING_MILAN' UNION ALL
SELECT 		'BUILDINGCLASS_MILAN_2', 				'BUILDING_MILAN_2', 				'TXT_KEY_BUILDING_MILAN_2' UNION ALL
SELECT 		'BUILDINGCLASS_RAGUSA', 				'BUILDING_RAGUSA', 					'TXT_KEY_BUILDING_RAGUSA' UNION ALL
SELECT 		'BUILDINGCLASS_RIGA', 					'BUILDING_RIGA', 					'TXT_KEY_BUILDING_RIGA' UNION ALL
SELECT 		'BUILDINGCLASS_SAMARKAND', 				'BUILDING_SAMARKAND', 				'TXT_KEY_BUILDING_SAMARKAND' UNION ALL
SELECT 		'BUILDINGCLASS_VALLETTA', 				'BUILDING_VALLETTA', 				'TXT_KEY_BUILDING_VALLETTA' UNION ALL
SELECT 		'BUILDINGCLASS_VILNIUS', 				'BUILDING_VILNIUS', 				'TXT_KEY_BUILDING_VILNIUS' UNION ALL
SELECT 		'BUILDINGCLASS_CLERMONT', 				'BUILDING_CLERMONT', 				'TXT_KEY_BUILDING_CLERMONT' UNION ALL
SELECT 		'BUILDINGCLASS_ARMAGH1', 				'BUILDING_ARMAGH1', 				'TXT_KEY_BUILDING_ARMAGH1' UNION ALL
SELECT 		'BUILDINGCLASS_ARMAGH2', 				'BUILDING_ARMAGH2', 				'TXT_KEY_BUILDING_ARMAGH2' UNION ALL
SELECT 		'BUILDINGCLASS_ARMAGH3', 				'BUILDING_ARMAGH3', 				'TXT_KEY_BUILDING_ARMAGH3' UNION ALL
SELECT 		'BUILDINGCLASS_ARMAGH4', 				'BUILDING_ARMAGH4', 				'TXT_KEY_BUILDING_ARMAGH4' UNION ALL
SELECT 		'BUILDINGCLASS_CHEVAK', 				'BUILDING_CHEVAK', 					'TXT_KEY_BUILDING_CHEVAK' UNION ALL
SELECT 		'BUILDINGCLASS_QUELIMANE', 				'BUILDING_QUELIMANE', 				'TXT_KEY_BUILDING_QUELIMANE' UNION ALL
SELECT 		'BUILDINGCLASS_TAIWAN', 				'BUILDING_TAIWAN', 					'TXT_KEY_BUILDING_TAIWAN' UNION ALL
SELECT 		'BUILDINGCLASS_OC_EO', 					'BUILDING_OC_EO', 					'TXT_KEY_BUILDING_OC_EO' UNION ALL
SELECT 		'BUILDINGCLASS_OC_EO_2', 				'BUILDING_OC_EO_2', 				'TXT_KEY_BUILDING_OC_EO_2' UNION ALL
SELECT 		'BUILDINGCLASS_THIMPHU', 				'BUILDING_THIMPHU', 				'TXT_KEY_BUILDING_THIMPHU' UNION ALL
SELECT 		'BUILDINGCLASS_THIMPHU_2', 				'BUILDING_THIMPHU_2', 				'TXT_KEY_BUILDING_THIMPHU_2' UNION ALL
SELECT 		'BUILDINGCLASS_ANDORRA', 				'BUILDING_ANDORRA', 				'TXT_KEY_BUILDING_ANDORRA' UNION ALL
SELECT 		'BUILDINGCLASS_ANDORRA_2', 				'BUILDING_ANDORRA_2', 				'TXT_KEY_BUILDING_ANDORRA_2' UNION ALL
SELECT 		'BUILDINGCLASS_CANOSSA', 				'BUILDING_CANOSSA', 				'TXT_KEY_BUILDING_CANOSSA' UNION ALL
SELECT 		'BUILDINGCLASS_MARITIME', 				'BUILDING_MARITIME', 				'TXT_KEY_BUILDING_MARITIME' UNION ALL
SELECT 		'BUILDINGCLASS_MARITIME_FRIENDLY', 		'BUILDING_MARITIME_FRIENDLY', 		'TXT_KEY_BUILDING_MARITIME_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_MARITIME_NEUTRAL', 		'BUILDING_MARITIME_NEUTRAL', 		'TXT_KEY_BUILDING_MARITIME_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_MARITIME_HOSTILE', 		'BUILDING_MARITIME_HOSTILE', 		'TXT_KEY_BUILDING_MARITIME_HOSTILE' UNION ALL
SELECT 		'BUILDINGCLASS_MERCANTILE', 			'BUILDING_MERCANTILE', 				'TXT_KEY_BUILDING_MERCANTILE' UNION ALL
SELECT 		'BUILDINGCLASS_MERCANTILE_FRIENDLY', 	'BUILDING_MERCANTILE_FRIENDLY', 	'TXT_KEY_BUILDING_MERCANTILE_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_MERCANTILE_NEUTRAL', 	'BUILDING_MERCANTILE_NEUTRAL', 		'TXT_KEY_BUILDING_MERCANTILE_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_MERCANTILE_HOSTILE', 	'BUILDING_MERCANTILE_HOSTILE', 		'TXT_KEY_BUILDING_MERCANTILE_HOSTILE' UNION ALL
SELECT 		'BUILDINGCLASS_CULTURED', 				'BUILDING_CULTURED', 				'TXT_KEY_BUILDING_CULTURED' UNION ALL
SELECT 		'BUILDINGCLASS_CULTURED_FRIENDLY', 		'BUILDING_CULTURED_FRIENDLY', 		'TXT_KEY_BUILDING_CULTURED_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_CULTURED_NEUTRAL', 		'BUILDING_CULTURED_NEUTRAL', 		'TXT_KEY_BUILDING_CULTURED_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_CULTURED_HOSTILE', 		'BUILDING_CULTURED_HOSTILE', 		'TXT_KEY_BUILDING_CULTURED_HOSTILE' UNION ALL
SELECT 		'BUILDINGCLASS_RELIGIOUS', 				'BUILDING_RELIGIOUS', 				'TXT_KEY_BUILDING_RELIGIOUS' UNION ALL
SELECT 		'BUILDINGCLASS_RELIGIOUS_FRIENDLY', 	'BUILDING_RELIGIOUS_FRIENDLY', 		'TXT_KEY_BUILDING_RELIGIOUS_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_RELIGIOUS_NEUTRAL', 		'BUILDING_RELIGIOUS_NEUTRAL', 		'TXT_KEY_BUILDING_RELIGIOUS_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_RELIGIOUS_HOSTILE', 		'BUILDING_RELIGIOUS_HOSTILE', 		'TXT_KEY_BUILDING_RELIGIOUS_HOSTILE' UNION ALL
SELECT 		'BUILDINGCLASS_MILITARISTIC', 			'BUILDING_MILITARISTIC', 			'TXT_KEY_BUILDING_MILITARISTIC' UNION ALL
SELECT 		'BUILDINGCLASS_MILITARISTIC_FRIENDLY', 	'BUILDING_MILITARISTIC_FRIENDLY', 	'TXT_KEY_BUILDING_MILITARISTIC_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_MILITARISTIC_NEUTRAL', 	'BUILDING_MILITARISTIC_NEUTRAL', 	'TXT_KEY_BUILDING_MILITARISTIC_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_MILITARISTIC_HOSTILE', 	'BUILDING_MILITARISTIC_HOSTILE', 	'TXT_KEY_BUILDING_MILITARISTIC_HOSTILE';

UPDATE BuildingClasses SET MaxGlobalInstances = 1 WHERE Type = 'BUILDINGCLASS_LHASA';

INSERT INTO Audio_Sounds 
			(SoundID, 			Filename, 		LoadType)
SELECT 		'SND_WONDER_LHASA', 'PotalaPalace', 'DynamicResident';

INSERT INTo Audio_2DSounds 
			(ScriptID, 				SoundID, 			SoundType, 				MinVolume, 	MaxVolume, 	IsMusic, 	TaperSoundtrackVolume)
SELECT 		'AS2D_WONDER_LHASA', 	'SND_WONDER_LHASA', 'GAME_MUSIC_STINGS', 	85, 		85, 		1, 			'0.0';

INSERT INTO Buildings 
			(Type, 								BuildingClass, 							Cost, 	GoldMaintenance, 	PrereqTech, Description, 								Help, 											MinAreaSize, 	NukeImmune, ConquestProb, 	NeverCapture, 	HurryCostModifier, 	IconAtlas, 						PortraitIndex, 	IsDummy)
SELECT 		'BUILDING_LHASA', 					'BUILDINGCLASS_LHASA', 					650, 	0, 					NULL, 		'TXT_KEY_BUILDING_LHASA', 					'TXT_KEY_BUILDING_LHASA_HELP', 					-1, 			1, 			100, 			0, 				-5, 				'UCS_BUILDING_ATLAS', 			0, 				0 UNION ALL
SELECT 		'BUILDING_KIEV', 					'BUILDINGCLASS_KIEV', 					350, 	2, 					NULL, 		'TXT_KEY_BUILDING_KIEV', 					'TXT_KEY_BUILDING_KIEV_HELP', 					-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			5, 				0 UNION ALL
SELECT 		'BUILDING_MILAN', 					'BUILDINGCLASS_MILAN', 					350, 	2, 					NULL, 		'TXT_KEY_BUILDING_MILAN', 					'TXT_KEY_BUILDING_MILAN_HELP', 					-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			4, 				0 UNION ALL
SELECT 		'BUILDING_VILNIUS', 				'BUILDINGCLASS_VILNIUS', 				350, 	2, 					NULL, 		'TXT_KEY_BUILDING_VILNIUS', 				'TXT_KEY_BUILDING_VILNIUS_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			3, 				0 UNION ALL
SELECT 		'BUILDING_VALLETTA', 				'BUILDINGCLASS_VALLETTA', 				250, 	1, 					NULL, 		'TXT_KEY_BUILDING_VALLETTA', 				'TXT_KEY_BUILDING_VALLETTA_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			2, 				0 UNION ALL
SELECT 		'BUILDING_ARMAGH1', 				'BUILDINGCLASS_ARMAGH1', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ARMAGH1', 				'TXT_KEY_BUILDING_ARMAGH1_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			8, 				0 UNION ALL
SELECT 		'BUILDING_ARMAGH2', 				'BUILDINGCLASS_ARMAGH2', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ARMAGH2', 				'TXT_KEY_BUILDING_ARMAGH2_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			9, 				0 UNION ALL
SELECT 		'BUILDING_ARMAGH3', 				'BUILDINGCLASS_ARMAGH3', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ARMAGH3', 				'TXT_KEY_BUILDING_ARMAGH3_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			6, 				0 UNION ALL
SELECT 		'BUILDING_ARMAGH4', 				'BUILDINGCLASS_ARMAGH4', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ARMAGH4', 				'TXT_KEY_BUILDING_ARMAGH4_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			7, 				0 UNION ALL
SELECT 		'BUILDING_BYBLOS', 					'BUILDINGCLASS_BYBLOS', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_BYBLOS', 					'TXT_KEY_BUILDING_BYBLOS_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_CAPE_TOWN', 				'BUILDINGCLASS_CAPE_TOWN', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CAPE_TOWN', 				'TXT_KEY_BUILDING_CAPE_TOWN_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_GENEVA', 					'BUILDINGCLASS_GENEVA', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_GENEVA', 					'TXT_KEY_BUILDING_GENEVA_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_HONG_KONG', 				'BUILDINGCLASS_HONG_KONG', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_HONG_KONG', 				'TXT_KEY_BUILDING_HONG_KONG_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_JERUSALEM', 				'BUILDINGCLASS_JERUSALEM', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_JERUSALEM', 				'TXT_KEY_BUILDING_JERUSALEM_HELP', 				-1, 			1, 			100, 			0, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_KABUL', 					'BUILDINGCLASS_KABUL', 					-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_KABUL', 					'TXT_KEY_BUILDING_KABUL_HELP', 					-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_KATHMANDU', 				'BUILDINGCLASS_KATHMANDU', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_KATHMANDU', 				'TXT_KEY_BUILDING_KATHMANDU_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_RAGUSA', 					'BUILDINGCLASS_RAGUSA', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_RAGUSA', 					'TXT_KEY_BUILDING_RAGUSA_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_RIGA', 					'BUILDINGCLASS_RIGA', 					-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_RIGA', 					'TXT_KEY_BUILDING_RIGA_HELP', 					-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_SAMARKAND', 				'BUILDINGCLASS_SAMARKAND', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_SAMARKAND', 				'TXT_KEY_BUILDING_SAMARKAND_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_CLERMONT', 				'BUILDINGCLASS_CLERMONT', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CLERMONT', 				'TXT_KEY_BUILDING_CLERMONT_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_CHEVAK', 					'BUILDINGCLASS_CHEVAK', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CHEVAK', 					'TXT_KEY_BUILDING_CHEVAK_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_QUELIMANE', 				'BUILDINGCLASS_QUELIMANE', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_QUELIMANE', 				'TXT_KEY_BUILDING_QUELIMANE_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_TAIWAN', 					'BUILDINGCLASS_TAIWAN', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_TAIWAN', 					'TXT_KEY_BUILDING_TAIWAN_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_KIEV_2', 					'BUILDINGCLASS_KIEV_2', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_KIEV_2', 					'TXT_KEY_BUILDING_KIEV_2_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MILAN_2', 				'BUILDINGCLASS_MILAN_2', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MILAN_2', 				'TXT_KEY_BUILDING_MILAN_2_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_OC_EO', 					'BUILDINGCLASS_OC_EO', 					-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_OC_EO', 					'TXT_KEY_BUILDING_OC_EO_HELP', 					-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_OC_EO_2', 				'BUILDINGCLASS_OC_EO_2', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_OC_EO_2', 				'TXT_KEY_BUILDING_OC_EO_2_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_THIMPHU', 				'BUILDINGCLASS_THIMPHU', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_THIMPHU', 				'TXT_KEY_BUILDING_THIMPHU_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_THIMPHU_2', 				'BUILDINGCLASS_THIMPHU_2', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_THIMPHU_2', 				'TXT_KEY_BUILDING_THIMPHU_2_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_ANDORRA', 				'BUILDINGCLASS_ANDORRA', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ANDORRA', 				'TXT_KEY_BUILDING_ANDORRA_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_ANDORRA_2', 				'BUILDINGCLASS_ANDORRA_2', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ANDORRA_2', 				'TXT_KEY_BUILDING_ANDORRA_2_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_CANOSSA', 				'BUILDINGCLASS_CANOSSA', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CANOSSA', 				'TXT_KEY_BUILDING_CANOSSA_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MARITIME', 				'BUILDINGCLASS_MARITIME', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MARITIME', 				'TXT_KEY_BUILDING_MARITIME_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MARITIME_FRIENDLY', 		'BUILDINGCLASS_MARITIME_FRIENDLY', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MARITIME_FRIENDLY', 		'TXT_KEY_BUILDING_MARITIME_FRIENDLY_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MARITIME_NEUTRAL', 		'BUILDINGCLASS_MARITIME_NEUTRAL', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MARITIME_NEUTRAL', 		'TXT_KEY_BUILDING_MARITIME_NEUTRAL_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MARITIME_HOSTILE', 		'BUILDINGCLASS_MARITIME_HOSTILE', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MARITIME_HOSTILE', 		'TXT_KEY_BUILDING_MARITIME_HOSTILE_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MERCANTILE', 				'BUILDINGCLASS_MERCANTILE', 			-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MERCANTILE', 				'TXT_KEY_BUILDING_MERCANTILE_HELP', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MERCANTILE_FRIENDLY', 	'BUILDINGCLASS_MERCANTILE_FRIENDLY', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MERCANTILE_FRIENDLY', 	'TXT_KEY_BUILDING_MERCANTILE_FRIENDLY_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MERCANTILE_NEUTRAL', 		'BUILDINGCLASS_MERCANTILE_NEUTRAL', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MERCANTILE_NEUTRAL', 		'TXT_KEY_BUILDING_MERCANTILE_NEUTRAL_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MERCANTILE_HOSTILE', 		'BUILDINGCLASS_MERCANTILE_HOSTILE', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MERCANTILE_HOSTILE', 		'TXT_KEY_BUILDING_MERCANTILE_HOSTILE_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_CULTURED', 				'BUILDINGCLASS_CULTURED', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CULTURED', 				'TXT_KEY_BUILDING_CULTURED_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_CULTURED_FRIENDLY', 		'BUILDINGCLASS_CULTURED_FRIENDLY', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CULTURED_FRIENDLY', 		'TXT_KEY_BUILDING_CULTURED_FRIENDLY_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_CULTURED_NEUTRAL', 		'BUILDINGCLASS_CULTURED_NEUTRAL', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CULTURED_NEUTRAL', 		'TXT_KEY_BUILDING_CULTURED_NEUTRAL_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_CULTURED_HOSTILE', 		'BUILDINGCLASS_CULTURED_HOSTILE', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CULTURED_HOSTILE', 		'TXT_KEY_BUILDING_CULTURED_HOSTILE_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 				'BUILDINGCLASS_RELIGIOUS', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_RELIGIOUS', 				'TXT_KEY_BUILDING_RELIGIOUS_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_RELIGIOUS_FRIENDLY', 		'BUILDINGCLASS_RELIGIOUS_FRIENDLY', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_RELIGIOUS_FRIENDLY', 		'TXT_KEY_BUILDING_RELIGIOUS_FRIENDLY_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_RELIGIOUS_NEUTRAL', 		'BUILDINGCLASS_RELIGIOUS_NEUTRAL', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_RELIGIOUS_NEUTRAL', 		'TXT_KEY_BUILDING_RELIGIOUS_NEUTRAL_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_RELIGIOUS_HOSTILE', 		'BUILDINGCLASS_RELIGIOUS_HOSTILE', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_RELIGIOUS_HOSTILE', 		'TXT_KEY_BUILDING_RELIGIOUS_HOSTILE_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MILITARISTIC', 			'BUILDINGCLASS_MILITARISTIC', 			-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MILITARISTIC', 			'TXT_KEY_BUILDING_MILITARISTIC_HELP', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_FRIENDLY', 	'BUILDINGCLASS_MILITARISTIC_FRIENDLY', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MILITARISTIC_FRIENDLY', 	'TXT_KEY_BUILDING_MILITARISTIC_FRIENDLY_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_NEUTRAL', 	'BUILDINGCLASS_MILITARISTIC_NEUTRAL', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MILITARISTIC_NEUTRAL', 	'TXT_KEY_BUILDING_MILITARISTIC_NEUTRAL_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_HOSTILE', 	'BUILDINGCLASS_MILITARISTIC_HOSTILE', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MILITARISTIC_HOSTILE', 	'TXT_KEY_BUILDING_MILITARISTIC_HOSTILE_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1;

UPDATE Buildings SET TradeRouteSeaDistanceModifier = 10, TradeRouteLandDistanceModifier = 10 WHERE Type = 'BUILDING_CAPE_TOWN';
UPDATE Buildings SET ReligiousPressureModifier = 100, ConversionModifier = -50 WHERE Type = 'BUILDING_JERUSALEM';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_MUSICIAN', SpecialistCount = 1, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_KIEV' WHERE Type = 'BUILDING_KIEV';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_ARTIST', SpecialistCount = 1, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_MILAN' WHERE Type = 'BUILDING_MILAN';
UPDATE Buildings SET WonderSplashImage = 'UCS_Potala_Palace_splash.dds', WonderSplashAudio = 'AS2D_WONDER_LHASA', WonderSplashAnchor = 'L,B', PolicyType = 'POLICY_LHASA', Quote = 'TXT_KEY_BUILDING_LHASA_QUOTE', SingleLeagueVotes = 1 WHERE Type = 'BUILDING_LHASA';
UPDATE Buildings SET TradeRouteTargetBonus = 4, TradeRouteRecipientBonus = 4 WHERE Type = 'BUILDING_SAMARKAND';
UPDATE Buildings SET ExtraCityHitPoints = 25, Water = 1, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA' WHERE Type = 'BUILDING_VALLETTA';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_WRITER', SpecialistCount = 1, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_VILNIUS' WHERE Type = 'BUILDING_VILNIUS';
UPDATE Buildings SET TrainedFreePromotion = 'PROMOTION_CLERMONT1' WHERE Type = 'BUILDING_CLERMONT';
UPDATE Buildings SET FaithCost = 250, WLTKDTurns = 10, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', UnculturedHappinessChange = -10, MutuallyExclusiveGroup = 113 WHERE Type = 'BUILDING_ARMAGH1';
UPDATE Buildings SET FaithCost = 250, WLTKDTurns = 10, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', IlliteracyHappinessChange = -10, MutuallyExclusiveGroup = 113 WHERE Type = 'BUILDING_ARMAGH2';
UPDATE Buildings SET FaithCost = 250, WLTKDTurns = 10, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', PovertyHappinessChange = -10, MutuallyExclusiveGroup = 113 WHERE Type = 'BUILDING_ARMAGH3';
UPDATE Buildings SET FaithCost = 250, WLTKDTurns = 10, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', DefenseHappinessChange = -10, MutuallyExclusiveGroup = 113 WHERE Type = 'BUILDING_ARMAGH4';
UPDATE Buildings SET Happiness = 1 WHERE Type = 'BUILDING_OC_EO_2';
UPDATE Buildings SET Defense = 10 WHERE Type = 'BUILDING_THIMPHU';
UPDATE Buildings SET UnculturedHappinessChange = -10 WHERE Type = 'BUILDING_ANDORRA';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_CIVIL_SERVANT', GreatPeopleRateChange = 1 WHERE Type = 'BUILDING_CANOSSA';

UPDATE Buildings SET ReligiousPressureModifier = 33 WHERE Type = 'BUILDING_RELIGIOUS';
UPDATE Buildings SET ConversionModifier = 25, Happiness = 2 WHERE Type = 'BUILDING_RELIGIOUS_FRIENDLY';
UPDATE Buildings SET ConversionModifier = -10 WHERE Type = 'BUILDING_RELIGIOUS_NEUTRAL';
UPDATE Buildings SET ConversionModifier = -25, ReligiousPressureModifier = 25 WHERE Type = 'BUILDING_RELIGIOUS_HOSTILE';
UPDATE Buildings SET EspionageModifier = 20 WHERE Type = 'BUILDING_MARITIME';
UPDATE Buildings SET Defense = 1000, ExtraCityHitPoints = 100 WHERE Type = 'BUILDING_MARITIME_NEUTRAL';
UPDATE Buildings SET CitySupplyModifierGlobal = 25, TrainedFreePromotion = 'PROMOTION_MILITARISTIC_NEUTRAL' WHERE Type = 'BUILDING_MILITARISTIC_NEUTRAL';
UPDATE Buildings SET CitySupplyModifierGlobal = 50 WHERE Type = 'BUILDING_MILITARISTIC_HOSTILE';

INSERT INTO Building_YieldPerXTerrainTimes100 	
			(BuildingType, 			TerrainType,		YieldType, 			Yield)
SELECT 		'BUILDING_KABUL', 		'TERRAIN_MOUNTAIN', 'YIELD_CULTURE', 	66 UNION ALL
SELECT 		'BUILDING_KATHMANDU', 	'TERRAIN_MOUNTAIN', 'YIELD_FAITH', 		66 UNION ALL
SELECT 		'BUILDING_CHEVAK', 		'TERRAIN_TUNDRA', 	'YIELD_FOOD', 		25 UNION ALL
SELECT 		'BUILDING_CHEVAK', 		'TERRAIN_SNOW', 	'YIELD_FOOD', 		33 UNION ALL
SELECT 		'BUILDING_ANDORRA_2', 	'TERRAIN_MOUNTAIN', 'YIELD_TOURISM', 	100 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 	'TERRAIN_MOUNTAIN', 'YIELD_CULTURE', 	200 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 	'TERRAIN_MOUNTAIN', 'YIELD_FAITH', 		200 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 	'TERRAIN_MOUNTAIN', 'YIELD_GOLD', 		200;

INSERT INTO Building_YieldPerXFeatureTimes100 	
			(BuildingType, 			FeatureType,		YieldType, 			Yield)
SELECT 		'BUILDING_RELIGIOUS', 	'FEATURE_ATOLL', 	'YIELD_CULTURE', 	200 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 	'FEATURE_ATOLL', 	'YIELD_FAITH', 		200 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 	'FEATURE_ATOLL', 	'YIELD_GOLD', 		200;

INSERT INTO Building_YieldPerAlly 
			(BuildingType, 		YieldType, 		Yield)
SELECT 		'BUILDING_RAGUSA', 	'YIELD_FOOD', 	1;

INSERT INTO Building_YieldChanges
			(BuildingType, 			YieldType, 				Yield)
SELECT 		'BUILDING_LHASA', 		'YIELD_FOOD', 			1 UNION ALL
SELECT 		'BUILDING_LHASA', 		'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'BUILDING_OC_EO', 		'YIELD_CULTURE_LOCAL', 	1 UNION ALL
SELECT 		'BUILDING_THIMPHU', 	'YIELD_CULTURE', 		3 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 	'YIELD_CULTURE_LOCAL', 	-5;

INSERT INTO Building_YieldChangesPerPop 
			(BuildingType, 					YieldType, 				Yield)
SELECT 		'BUILDING_GENEVA', 				'YIELD_FAITH', 			20 UNION ALL
SELECT 		'BUILDING_HONG_KONG', 			'YIELD_GOLD', 			16 UNION ALL
SELECT 		'BUILDING_MARITIME_NEUTRAL', 	'YIELD_FOOD', 			250;
SELECT 		'BUILDING_MARITIME_HOSTILE', 	'YIELD_PRODUCTION', 	50;

INSERT INTO Building_YieldFromDeath
			(BuildingType, 					YieldType, 			Yield)
SELECT 		'BUILDING_RELIGIOUS_HOSTILE', 	'YIELD_CULTURE', 	10;

INSERT INTO Building_LakePlotYieldChanges 
			(BuildingType, 					YieldType, 		Yield)
SELECT 		'BUILDING_BYBLOS', 				'YIELD_FOOD', 	1 UNION ALL
SELECT 		'BUILDING_RELIGIOUS_NEUTRAL', 	'YIELD_FOOD', 	2;

INSERT INTO Building_YieldModifiers 
			(BuildingType, 				YieldType, 				Yield)
SELECT 		'BUILDING_LHASA', 			'YIELD_CULTURE', 		5 UNION ALL
SELECT 		'BUILDING_LHASA', 			'YIELD_FOOD', 			5 UNION ALL
SELECT 		'BUILDING_RIGA', 			'YIELD_FOOD', 			3 UNION ALL
SELECT 		'BUILDING_MERCANTILE', 		'YIELD_GOLD', 			10;

INSERT INTO Building_LocalResourceOrs 
			(BuildingType, 			ResourceType)
SELECT 		'BUILDING_VALLETTA', 	'RESOURCE_FISH' UNION ALL
SELECT 		'BUILDING_VALLETTA', 	'RESOURCE_CORAL' UNION ALL 
SELECT 		'BUILDING_VALLETTA', 	'RESOURCE_CRAB' UNION ALL 
SELECT 		'BUILDING_VALLETTA', 	'RESOURCE_PEARLS' UNION ALL 
SELECT 		'BUILDING_VALLETTA', 	'RESOURCE_WHALE';

INSERT INTO Building_ClassesNeededInCity
			(BuildingType, 			BuildingClassType)
SELECT 		'BUILDING_CANOSSA', 	'BUILDINGCLASS_TEMPLE';

INSERT INTO Building_DomainFreeExperiences 
			(BuildingType, 						DomainType,		Experience)
SELECT 		'BUILDING_VALLETTA', 				'DOMAIN_SEA', 	15 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_FRIENDLY', 	'DOMAIN_LAND', 	30 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_FRIENDLY', 	'DOMAIN_SEA', 	30 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_FRIENDLY', 	'DOMAIN_AIR', 	30 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_NEUTRAL', 	'DOMAIN_LAND', 	10 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_NEUTRAL', 	'DOMAIN_SEA', 	10 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_NEUTRAL', 	'DOMAIN_AIR', 	10;

INSERT INTO Building_RiverPlotYieldChanges 
			(BuildingType, 					YieldType, 					Yield)
SELECT 		'BUILDING_QUELIMANE', 			'YIELD_GOLDEN_AGE_POINTS', 	1 UNION ALL
SELECT 		'BUILDING_RELIGIOUS_NEUTRAL', 	'YIELD_FOOD', 				1;

INSERT INTO Building_YieldFromProcessModifier
			(BuildingType, 			YieldType, 			Yield)
SELECT 		'BUILDING_TAIWAN', 		'YIELD_SCIENCE', 	5;

INSERT INTO Building_YieldFromYieldPercent
			(BuildingType,			YieldIn,			YieldOut,			Value) 
SELECT		'BUILDING_TAIWAN',		'YIELD_SCIENCE',	'YIELD_FOOD',		5 UNION ALL
SELECT		'BUILDING_MERCANTILE',	'YIELD_GOLD',		'YIELD_FOOD',		5 UNION ALL
SELECT		'BUILDING_MERCANTILE',	'YIELD_GOLD',		'YIELD_PRODUCTION',	5;

INSERT INTO Building_SpecificGreatPersonRateModifier 
			(BuildingType,			SpecialistType,			Modifier)
SELECT		'BUILDING_KIEV_2',		'SPECIALIST_MUSICIAN',	50 UNION ALL
SELECT		'BUILDING_MILAN_2',		'SPECIALIST_ARTIST',	50;

INSERT INTO Building_YieldChangesPerReligion
			(BuildingType,					YieldType,			Yield)
SELECT		'BUILDING_RELIGIOUS_NEUTRAL',	'YIELD_PRODUCTION',	500;

INSERT INTO Building_YieldFromUnitProduction
			(BuildingType,					YieldType,				Yield)
SELECT		'BUILDING_MARITIME_HOSTILE',	'YIELD_FOOD',			50 UNION ALL
SELECT		'BUILDING_MARITIME_HOSTILE',	'YIELD_CULTURE_LOCAL',	20;

INSERT INTO Building_YieldFromBirth
			(BuildingType,			YieldType,				Yield)
SELECT		'BUILDING_MARITIME',	'YIELD_CULTURE_LOCAL',	10;

INSERT INTO Building_HurryModifiers
			(BuildingType,			HurryType,		HurryCostModifier)
SELECT		'BUILDING_MERCANTILE',	'HURRY_GOLD',	-20;

INSERT INTO Building_ResourceYieldChanges (BuildingType,  					YieldType, 		Yield, 	ResourceType)
SELECT DISTINCT							  'BUILDING_MARITIME_FRIENDLY', 	'YIELD_FOOD', 	1, 		Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_BONUS';

INSERT INTO Building_UnitCombatProductionModifiers
			(BuildingType,						UnitCombatType,				Modifier)
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_RECON',			10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_ARCHER',		10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_MOUNTED',		10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_MELEE',			10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_SIEGE',			10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_GUN',			10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_ARMOR',			10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_HELICOPTER',	10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_NAVALRANGED',	10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_NAVALMELEE',	10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_SUBMARINE',		10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_CARRIER',		10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_FIGHTER',		10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_BOMBER',		10 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_RECON',			33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_ARCHER',		33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_MOUNTED',		33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_MELEE',			33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_SIEGE',			33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_GUN',			33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_ARMOR',			33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_HELICOPTER',	33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_NAVALRANGED',	33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_NAVALMELEE',	33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_SUBMARINE',		33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_CARRIER',		33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_FIGHTER',		33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_BOMBER',		33 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_RECON',			-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_ARCHER',		-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_MOUNTED',		-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_MELEE',			-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_SIEGE',			-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_GUN',			-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_ARMOR',			-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_HELICOPTER',	-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_NAVALRANGED',	-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_NAVALMELEE',	-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_SUBMARINE',		-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_CARRIER',		-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_FIGHTER',		-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_BOMBER',		-50 UNION ALL
SELECT		'BUILDING_MARITIME_HOSTILE',		'UNITCOMBAT_NAVALRANGED',	20 UNION ALL
SELECT		'BUILDING_MARITIME_HOSTILE',		'UNITCOMBAT_NAVALMELEE',	20 UNION ALL
SELECT		'BUILDING_MARITIME_HOSTILE',		'UNITCOMBAT_SUBMARINE',		20 UNION ALL
SELECT		'BUILDING_MARITIME_HOSTILE',		'UNITCOMBAT_CARRIER',		20 UNION ALL
SELECT		'BUILDING_MARITIME_FRIENDLY',		'UNITCOMBAT_WORKER',		50 UNION ALL
SELECT		'BUILDING_MARITIME_FRIENDLY',		'UNITCOMBAT_WORKBOAT',		50;

INSERT INTO Building_Flavors 
			(BuildingType, 			FlavorType, 				Flavor)
SELECT 		'BUILDING_KIEV', 		'FLAVOR_GREAT_PEOPLE', 		3 UNION ALL
SELECT 		'BUILDING_LHASA', 		'FLAVOR_WONDER', 			10 UNION ALL
SELECT 		'BUILDING_MILAN', 		'FLAVOR_GREAT_PEOPLE', 		3 UNION ALL
SELECT 		'BUILDING_VALLETTA', 	'FLAVOR_CITY_DEFENSE', 		10 UNION ALL
SELECT 		'BUILDING_VALLETTA', 	'FLAVOR_MILITARY_TRAINING', 10 UNION ALL
SELECT 		'BUILDING_VILNIUS', 	'FLAVOR_GREAT_PEOPLE', 		3;
---------------------------------------------------
-- Definitions - Events
---------------------------------------------------		
INSERT INTO Events 
			(Type, 									Description, 					Help, 										EventArt, RandomChance, NumChoices, IgnoresGlobalCooldown, EventCooldown)
SELECT  	'PLAYER_EVENT_MINOR_CIV_ALMATY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ALMATY', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ANTANANARIVO', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANTANANARIVO', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ANTWERP', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BELGRADE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BELGRADE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BOGOTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BOGOTA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BRATISLAVA', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BRATISLAVA', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BRUSSELS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BRUSSELS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BUCHAREST', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUCHAREST', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BUDAPEST', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUDAPEST', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BUENOS_AIRES', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUENOS_AIRES', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BYBLOS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BYBLOS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CAHOKIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CAHOKIA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CAPE_TOWN', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_COLOMBO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_COLOMBO', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_FLORENCE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_FLORENCE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_GENEVA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_GENOA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GENOA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_HANOI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HANOI', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_HONG_KONG', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_IFE', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_IFE', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_JERUSALEM', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_JERUSALEM', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KABUL', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KATHMANDU', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KIEV', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KUALA_LUMPUR', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT 		'PLAYER_EVENT_MINOR_CIV_KYZYL', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KYZYL', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LA_VENTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LA_VENTA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LHASA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MALACCA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MALACCA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MANILA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MANILA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MBANZA_KONGO', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MBANZA_KONGO', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MELBOURNE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MILAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MOGADISHU', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MOGADISHU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MOMBASA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MOMBASA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MONACO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MONACO', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ORMUS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ORMUS', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_PANAMA_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_PRAGUE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PRAGUE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_QUEBEC_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_QUEBEC_CITY', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_RAGUSA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_RIGA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SAMARKAND', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SIDON', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SIDON', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SINGAPORE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SINGAPORE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SOFIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SYDNEY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SYDNEY', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_TYRE', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TYRE', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_UR', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_UR', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_VALLETTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VALLETTA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_VANCOUVER', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_VATICAN_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_VILNIUS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VILNIUS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_WELLINGTON', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_WITTENBERG', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_YEREVAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_YEREVAN', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ZANZIBAR', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ZANZIBAR', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ZURICH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ZURICH', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CLERMONT', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CLERMONT', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_HONDURAS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HONDURAS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_AUCKLAND', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AUCKLAND', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ARMAGH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ARMAGH', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MUSCAT', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUSCAT', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_GRANADA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GRANADA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_NANMANDOL', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_NANMANDOL', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_GWYNEDD', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GWYNEDD', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MUISCA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUISCA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LACONIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LACONIA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CHEVAK', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SANTO_DOMINGO', 'TXT_KEY_CSTRAIT_MINOR_CIV',	'TXT_KEY_CSTRAIT_MINOR_CIV_SANTO_DOMINGO', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MANAGUA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MANAGUA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ODENSO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ODENSO', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_YANGCHENG', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_YANGCHENG', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_PHANOTEUS', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PHANOTEUS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DOUALA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DOUALA',			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_AMBRACIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AMBRACIA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DJIBOUTI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DJIBOUTI', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DODOMA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_FAYA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_FAYA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KIGALI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LEVUKA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_QUELIMANE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SIERRA_LEONE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SIERRA_LEONE', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SURREY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SURREY', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_TAIWAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_OC_EO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_THIMPHU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ANDORRA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CANOSSA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 		'AllianceShift.dds', -1, 1, 1, 1;

INSERT INTO EventChoices 
			(Type, 											Description, 					Help, 										EventDuration, 	Expires, 	EventPolicy, 			EventPromotion, 			EventBuildingClassGlobal)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ALMATY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ALMATY', 		3, 				1, 			'POLICY_ALMATY', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTANANARIVO', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANTANANARIVO', 	3, 				1, 			NULL, 					'PROMOTION_ANTANANARIVO', 	NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTWERP', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 		3, 				1,			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BELGRADE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BELGRADE', 		3, 				1, 			NULL, 					'PROMOTION_BELGRADE', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BOGOTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BOGOTA', 		3, 				1, 			'POLICY_BOGOTA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BRATISLAVA', 	3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BRUSSELS', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUCHAREST', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUCHAREST', 		3, 				1, 			'POLICY_BUCHAREST', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUDAPEST', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUDAPEST', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUENOS_AIRES', 	3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BYBLOS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BYBLOS', 		3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_BYBLOS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CAHOKIA', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAPE_TOWN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 		3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_CAPE_TOWN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_COLOMBO', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_FLORENCE', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GENEVA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 		3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_GENEVA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GENOA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GENOA', 			3, 				1, 			'POLICY_GENOA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HANOI', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HANOI', 			3, 				1, 			NULL, 					'PROMOTION_HANOI', 			NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONG_KONG', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 		3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_HONG_KONG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_IFE', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_IFE', 			3, 				1, 			'POLICY_IFE', 			NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JERUSALEM', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_JERUSALEM', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KABUL', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 			3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_KABUL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KATHMANDU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 		3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_KATHMANDU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIEV', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 			3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KUALA_LUMPUR', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 	3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KYZYL', 			3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LA_VENTA', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 			3, 				1, 			'POLICY_LHASA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MALACCA', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MANILA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MANILA', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MBANZA_KONGO', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MBANZA_KONGO', 	3, 				1, 			NULL, 					'PROMOTION_MBANZA_KONGO', 	NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MILAN', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 			3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MOGADISHU', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'TXT_KEY_CSTRAIT_MINOR_CIV',	'TXT_KEY_CSTRAIT_MINOR_CIV_MOMBASA', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MONACO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MONACO', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ORMUS', 			3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PANAMA_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 	3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PRAGUE', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_QUEBEC_CITY', 	3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RAGUSA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 		3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_RAGUSA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RIGA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 			3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_RIGA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SAMARKAND', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 		3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_SAMARKAND' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIDON', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SIDON', 			3, 				1, 			NULL, 					'PROMOTION_SIDON', 			NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SINGAPORE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SINGAPORE', 		3, 				1, 			NULL, 					'PROMOTION_NOBILITY', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SOFIA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 			3, 				1, 			'POLICY_SOFIA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SYDNEY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SYDNEY', 		3, 				1, 			'POLICY_SYDNEY', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TYRE', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TYRE', 			3, 				1, 			'POLICY_TYRE', 			NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_UR', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_UR', 			3, 				1, 			'POLICY_UR', 			NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VALLETTA', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VATICAN_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 	3, 				1, 			'POLICY_VATICAN_CITY', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VILNIUS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VILNIUS', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 	3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WITTENBERG', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 	3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YEREVAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_YEREVAN', 		3, 				1, 			NULL, 					'PROMOTION_YEREVAN', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ZANZIBAR', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ZURICH', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CLERMONT', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CLERMONT', 		3, 				1, 			NULL, 					'PROMOTION_CLERMONT', 		'BUILDINGCLASS_CLERMONT' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONDURAS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HONDURAS', 		3, 				1, 			'POLICY_HONDURAS', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AUCKLAND', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AUCKLAND', 		3, 				1, 			'POLICY_AUCKLAND', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ARMAGH', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUSCAT', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUSCAT', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GRANADA', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NANMANDOL', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_NANMANDOL', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GWYNEDD', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GWYNEDD', 		3, 				1, 			'POLICY_GWYNEDD', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUISCA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUISCA', 		3, 				1, 			'POLICY_MUISCA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LACONIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LACONIA', 		3, 				1, 			NULL, 					'PROMOTION_LACONIA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CHEVAK', 		'TXT_KEY_CSTRAIT_MINOR_CIV',	'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 		3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_CHEVAK' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SANTO_DOMINGO', 	'TXT_KEY_CSTRAIT_MINOR_CIV',	'TXT_KEY_CSTRAIT_MINOR_CIV_SANTO_DOMINGO', 	3, 				1, 			'POLICY_SANTO_DOMINGO', NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MANAGUA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MANAGUA', 		3, 				1, 			'POLICY_MANAGUA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ODENSO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ODENSO', 		3, 				1, 			NULL, 					'PROMOTION_ODENSO', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_YANGCHENG', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PHANOTEUS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PHANOTEUS', 		3, 				1, 			'POLICY_PHANOTEUS', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DOUALA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DOUALA', 		3, 				1, 			'POLICY_DOUALA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AMBRACIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AMBRACIA', 		3, 				1, 			'POLICY_AMBRACIA', 		'PROMOTION_AMBRACIA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DJIBOUTI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DJIBOUTI', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DODOMA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 		3, 				1, 			NULL, 					'PROMOTION_DODOMA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FAYA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_FAYA', 			3, 				1, 			NULL, 					'PROMOTION_FAYA', 			NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIGALI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LEVUKA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 		3, 				1, 			NULL,					'PROMOTION_LEVUKA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUELIMANE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 		3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_QUELIMANE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIERRA_LEONE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SIERRA_LEONE', 	3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SURREY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SURREY', 		3, 				1, 			NULL, 					'PROMOTION_SURREY', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TAIWAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 		3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_TAIWAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_OC_EO', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 			3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_THIMPHU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 		3, 				1, 			NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANDORRA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 		3, 				1, 			NULL, 					NULL, 						'BUILDINGCLASS_ANDORRA_2' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CANOSSA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 		3, 				1, 			NULL, 					NULL, 						NULL;

INSERT INTO Event_ParentEvents 
			(EventChoiceType, 								EventType)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ALMATY', 		'PLAYER_EVENT_MINOR_CIV_ALMATY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTANANARIVO', 	'PLAYER_EVENT_MINOR_CIV_ANTANANARIVO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTWERP', 		'PLAYER_EVENT_MINOR_CIV_ANTWERP' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BELGRADE', 		'PLAYER_EVENT_MINOR_CIV_BELGRADE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BOGOTA', 		'PLAYER_EVENT_MINOR_CIV_BOGOTA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'PLAYER_EVENT_MINOR_CIV_BRATISLAVA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 		'PLAYER_EVENT_MINOR_CIV_BRUSSELS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUCHAREST', 		'PLAYER_EVENT_MINOR_CIV_BUCHAREST' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUDAPEST', 		'PLAYER_EVENT_MINOR_CIV_BUDAPEST' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'PLAYER_EVENT_MINOR_CIV_BUENOS_AIRES' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BYBLOS', 		'PLAYER_EVENT_MINOR_CIV_BYBLOS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA', 		'PLAYER_EVENT_MINOR_CIV_CAHOKIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAPE_TOWN', 		'PLAYER_EVENT_MINOR_CIV_CAPE_TOWN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 		'PLAYER_EVENT_MINOR_CIV_COLOMBO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE', 		'PLAYER_EVENT_MINOR_CIV_FLORENCE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GENEVA', 		'PLAYER_EVENT_MINOR_CIV_GENEVA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GENOA', 			'PLAYER_EVENT_MINOR_CIV_GENOA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HANOI', 			'PLAYER_EVENT_MINOR_CIV_HANOI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONG_KONG', 		'PLAYER_EVENT_MINOR_CIV_HONG_KONG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_IFE', 			'PLAYER_EVENT_MINOR_CIV_IFE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JERUSALEM', 		'PLAYER_EVENT_MINOR_CIV_JERUSALEM' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KABUL', 			'PLAYER_EVENT_MINOR_CIV_KABUL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KATHMANDU', 		'PLAYER_EVENT_MINOR_CIV_KATHMANDU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIEV', 			'PLAYER_EVENT_MINOR_CIV_KIEV' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KUALA_LUMPUR', 	'PLAYER_EVENT_MINOR_CIV_KUALA_LUMPUR' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL', 			'PLAYER_EVENT_MINOR_CIV_KYZYL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'PLAYER_EVENT_MINOR_CIV_LA_VENTA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA', 			'PLAYER_EVENT_MINOR_CIV_LHASA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'PLAYER_EVENT_MINOR_CIV_MALACCA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MANILA', 		'PLAYER_EVENT_MINOR_CIV_MANILA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MBANZA_KONGO', 	'PLAYER_EVENT_MINOR_CIV_MBANZA_KONGO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'PLAYER_EVENT_MINOR_CIV_MELBOURNE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MILAN', 			'PLAYER_EVENT_MINOR_CIV_MILAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU', 		'PLAYER_EVENT_MINOR_CIV_MOGADISHU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'PLAYER_EVENT_MINOR_CIV_MOMBASA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MONACO', 		'PLAYER_EVENT_MINOR_CIV_MONACO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'PLAYER_EVENT_MINOR_CIV_ORMUS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PANAMA_CITY', 	'PLAYER_EVENT_MINOR_CIV_PANAMA_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE', 		'PLAYER_EVENT_MINOR_CIV_PRAGUE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'PLAYER_EVENT_MINOR_CIV_QUEBEC_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RAGUSA', 		'PLAYER_EVENT_MINOR_CIV_RAGUSA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RIGA', 			'PLAYER_EVENT_MINOR_CIV_RIGA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SAMARKAND', 		'PLAYER_EVENT_MINOR_CIV_SAMARKAND' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIDON', 			'PLAYER_EVENT_MINOR_CIV_SIDON' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SINGAPORE', 		'PLAYER_EVENT_MINOR_CIV_SINGAPORE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SOFIA', 			'PLAYER_EVENT_MINOR_CIV_SOFIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SYDNEY', 		'PLAYER_EVENT_MINOR_CIV_SYDNEY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TYRE', 			'PLAYER_EVENT_MINOR_CIV_TYRE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_UR', 			'PLAYER_EVENT_MINOR_CIV_UR' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA', 		'PLAYER_EVENT_MINOR_CIV_VALLETTA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'PLAYER_EVENT_MINOR_CIV_VANCOUVER' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VATICAN_CITY', 	'PLAYER_EVENT_MINOR_CIV_VATICAN_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VILNIUS', 		'PLAYER_EVENT_MINOR_CIV_VILNIUS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'PLAYER_EVENT_MINOR_CIV_WELLINGTON' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WITTENBERG', 	'PLAYER_EVENT_MINOR_CIV_WITTENBERG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YEREVAN', 		'PLAYER_EVENT_MINOR_CIV_YEREVAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'PLAYER_EVENT_MINOR_CIV_ZANZIBAR' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH', 		'PLAYER_EVENT_MINOR_CIV_ZURICH' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CLERMONT', 		'PLAYER_EVENT_MINOR_CIV_CLERMONT' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONDURAS', 		'PLAYER_EVENT_MINOR_CIV_HONDURAS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AUCKLAND', 		'PLAYER_EVENT_MINOR_CIV_AUCKLAND' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'PLAYER_EVENT_MINOR_CIV_ARMAGH' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUSCAT', 		'PLAYER_EVENT_MINOR_CIV_MUSCAT' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'PLAYER_EVENT_MINOR_CIV_GRANADA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NANMANDOL', 		'PLAYER_EVENT_MINOR_CIV_NANMANDOL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GWYNEDD', 		'PLAYER_EVENT_MINOR_CIV_GWYNEDD' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUISCA', 		'PLAYER_EVENT_MINOR_CIV_MUISCA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LACONIA', 		'PLAYER_EVENT_MINOR_CIV_LACONIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CHEVAK', 		'PLAYER_EVENT_MINOR_CIV_CHEVAK' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SANTO_DOMINGO', 	'PLAYER_EVENT_MINOR_CIV_SANTO_DOMINGO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MANAGUA', 		'PLAYER_EVENT_MINOR_CIV_MANAGUA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ODENSO', 		'PLAYER_EVENT_MINOR_CIV_ODENSO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'PLAYER_EVENT_MINOR_CIV_YANGCHENG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PHANOTEUS', 		'PLAYER_EVENT_MINOR_CIV_PHANOTEUS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DOUALA', 		'PLAYER_EVENT_MINOR_CIV_DOUALA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AMBRACIA', 		'PLAYER_EVENT_MINOR_CIV_AMBRACIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DJIBOUTI', 		'PLAYER_EVENT_MINOR_CIV_DJIBOUTI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DODOMA', 		'PLAYER_EVENT_MINOR_CIV_DODOMA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FAYA', 			'PLAYER_EVENT_MINOR_CIV_FAYA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIGALI', 		'PLAYER_EVENT_MINOR_CIV_KIGALI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LEVUKA', 		'PLAYER_EVENT_MINOR_CIV_LEVUKA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUELIMANE', 		'PLAYER_EVENT_MINOR_CIV_QUELIMANE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIERRA_LEONE', 	'PLAYER_EVENT_MINOR_CIV_SIERRA_LEONE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SURREY', 		'PLAYER_EVENT_MINOR_CIV_SURREY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TAIWAN', 		'PLAYER_EVENT_MINOR_CIV_TAIWAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_OC_EO', 			'PLAYER_EVENT_MINOR_CIV_OC_EO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_THIMPHU', 		'PLAYER_EVENT_MINOR_CIV_THIMPHU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANDORRA', 		'PLAYER_EVENT_MINOR_CIV_ANDORRA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CANOSSA', 		'PLAYER_EVENT_MINOR_CIV_CANOSSA';

INSERT INTO EventChoice_ResourceQuantity 
			(EventChoiceType, 							ResourceType, 		Quantity)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUDAPEST', 	'RESOURCE_HORSE', 	5;

INSERT INTO EventChoice_BuildingClassYieldChange 
			(EventChoiceType, 							BuildingClassType, 			YieldType, 			YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA', 	'BUILDINGCLASS_VALLETTA', 	'YIELD_FOOD', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA', 	'BUILDINGCLASS_VALLETTA', 	'YIELD_SCIENCE', 	2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONDURAS', 	'BUILDINGCLASS_HARBOR', 	'YIELD_GOLD', 		1;

INSERT INTO EventChoice_BuildingClassYieldModifier 
			(EventChoiceType, 								BuildingClassType, 				YieldType, 			Modifier)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KUALA_LUMPUR', 	'BUILDINGCLASS_WELL', 			'YIELD_CULTURE', 	5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA', 			'BUILDINGCLASS_LHASA', 			'YIELD_FOOD', 		5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA', 			'BUILDINGCLASS_LHASA', 			'YIELD_CULTURE', 	5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'BUILDINGCLASS_ARMAGH1', 		'YIELD_CULTURE', 	5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'BUILDINGCLASS_ARMAGH2', 		'YIELD_SCIENCE', 	5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'BUILDINGCLASS_ARMAGH3', 		'YIELD_GOLD', 		5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'BUILDINGCLASS_ARMAGH4', 		'YIELD_FOOD', 		3 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'BUILDINGCLASS_ARMAGH4', 		'YIELD_PRODUCTION', 3 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUSCAT', 		'BUILDINGCLASS_LIGHTHOUSE', 	'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUSCAT', 		'BUILDINGCLASS_HARBOR', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUSCAT', 		'BUILDINGCLASS_EE_DRYDOCK', 	'YIELD_GOLD', 		1 WHERE EXISTS (SELECT * FROM Community WHERE Type='UCS-EE' AND Value = 1) UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUSCAT', 		'BUILDINGCLASS_SEAPORT', 		'YIELD_GOLD', 		1;

INSERT INTO EventChoice_SpecialistYieldChange 
			(EventChoiceType, 							SpecialistType, 			YieldType, 					YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTWERP', 	'SPECIALIST_MERCHANT', 		'YIELD_GOLD', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE', 	'SPECIALIST_ARTIST', 		'YIELD_GOLDEN_AGE_POINTS', 	2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WITTENBERG', 'SPECIALIST_CITIZEN', 		'YIELD_FAITH', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WITTENBERG', 'SPECIALIST_CIVIL_SERVANT', 'YIELD_FAITH', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VILNIUS', 	'SPECIALIST_WRITER', 		'YIELD_GOLD', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CANOSSA', 	'SPECIALIST_CIVIL_SERVANT', 'YIELD_FAITH', 				1;

INSERT INTO EventChoice_BuildingClassYieldChange 
			(EventChoiceType, 								BuildingClassType, 					YieldType, 				YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_WRITERS_GUILD', 		'YIELD_CULTURE', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_ARTISTS_GUILD', 		'YIELD_CULTURE', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_MUSICIANS_GUILD', 	'YIELD_CULTURE', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_WRITERS_GUILD', 		'YIELD_TOURISM', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_ARTISTS_GUILD', 		'YIELD_TOURISM', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_MUSICIANS_GUILD', 	'YIELD_TOURISM', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_IFE', 			'BUILDINGCLASS_SHRINE', 			'YIELD_CULTURE_LOCAL', 	2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KUALA_LUMPUR', 	'BUILDINGCLASS_WATERMILL', 			'YIELD_CULTURE', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL', 			'BUILDINGCLASS_PALACE', 			'YIELD_TOURISM', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL', 			'BUILDINGCLASS_MONUMENT', 			'YIELD_TOURISM', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'BUILDINGCLASS_SHRINE', 			'YIELD_FAITH', 			1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MONACO', 		'BUILDINGCLASS_MARKET', 			'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MONACO', 		'BUILDINGCLASS_BANK', 				'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE', 		'BUILDINGCLASS_WALLS', 				'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE', 		'BUILDINGCLASS_CASTLE', 			'YIELD_CULTURE', 		1;

INSERT INTO EventChoice_ImprovementYieldChange 
			(EventChoiceType, 								ImprovementType, 					YieldType, 			YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BYBLOS', 		'IMPROVEMENT_FISHING_BOATS', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA', 		'IMPROVEMENT_MOUND', 				'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA', 		'IMPROVEMENT_MOUND', 				'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 		'IMPROVEMENT_LUMBERMILL', 			'YIELD_GOLD', 		-2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 		'IMPROVEMENT_LUMBERMILL_JUNGLE', 	'YIELD_GOLD', 		-2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE', 		'IMPROVEMENT_QUARRY', 				'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'IMPROVEMENT_ACADEMY', 				'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'IMPROVEMENT_HOLY_SITE', 			'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'IMPROVEMENT_CUSTOMS_HOUSE', 		'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'IMPROVEMENT_MANUFACTORY', 			'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'IMPROVEMENT_CITADEL', 				'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'IMPROVEMENT_MONGOLIA_ORDO', 		'YIELD_FAITH', 		1 UNION ALL																										
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'IMPROVEMENT_EMBASSY', 				'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'IMPROVEMENT_MINE', 				'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'IMPROVEMENT_ACADEMY', 				'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'IMPROVEMENT_HOLY_SITE', 			'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'IMPROVEMENT_CUSTOMS_HOUSE', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'IMPROVEMENT_MANUFACTORY', 			'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'IMPROVEMENT_CITADEL', 				'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'IMPROVEMENT_MONGOLIA_ORDO', 		'YIELD_GOLD', 		1 UNION ALL																										
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'IMPROVEMENT_EMBASSY', 				'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PANAMA_CITY', 	'IMPROVEMENT_FORT', 				'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PANAMA_CITY', 	'IMPROVEMENT_CITADEL', 				'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PANAMA_CITY', 	'IMPROVEMENT_PONTOON_BRIDGE', 		'YIELD_FOOD', 		1 WHERE EXISTS (SELECT * FROM Improvements WHERE Type='IMPROVEMENT_PONTOON_BRIDGE') UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'IMPROVEMENT_CAMP', 				'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'IMPROVEMENT_LUMBERMILL', 			'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'IMPROVEMENT_LUMBERMILL_JUNGLE', 	'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RAGUSA', 		'IMPROVEMENT_EMBASSY', 				'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TYRE', 			'IMPROVEMENT_LANDMARK', 			'YIELD_GOLD', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'IMPROVEMENT_TRADING_POST', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'IMPROVEMENT_ACADEMY', 				'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'IMPROVEMENT_HOLY_SITE', 			'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'IMPROVEMENT_CUSTOMS_HOUSE', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'IMPROVEMENT_MANUFACTORY', 			'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'IMPROVEMENT_CITADEL', 				'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'IMPROVEMENT_EMBASSY', 				'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'IMPROVEMENT_MONGOLIA_ORDO', 		'YIELD_FOOD', 		1 UNION ALL																							   
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'IMPROVEMENT_FORT', 				'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'IMPROVEMENT_CITADEL', 				'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JERUSALEM', 		'IMPROVEMENT_HOLY_SITE', 			'YIELD_FAITH',		1;

INSERT INTO EventChoice_FeatureYieldChange 
			(EventChoiceType, 							FeatureType, 			YieldType, 			YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 	'FEATURE_MARSH', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 	'FEATURE_MARSH', 		'YIELD_FOOD', 		1 UNION ALL																						   
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BYBLOS', 	'FEATURE_OASIS', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 	'FEATURE_FOREST', 		'YIELD_GOLD', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 	'FEATURE_JUNGLE', 		'YIELD_GOLD', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU', 	'FEATURE_FLOOD_PLAINS', 'YIELD_FOOD', 		1;

INSERT INTO EventChoice_TerrainYieldChange 
			(EventChoiceType, 							TerrainType, 		YieldType, 			YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU', 	'TERRAIN_OCEAN', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NANMANDOL', 	'TERRAIN_OCEAN', 	'YIELD_CULTURE', 	1;

INSERT INTO EventChoice_ResourceYieldChange 
			(EventChoiceType, 								ResourceType, 			YieldType, 			YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'RESOURCE_WHEAT', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'RESOURCE_COW', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'RESOURCE_SHEEP', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'RESOURCE_DEER', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'RESOURCE_BANANA', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'RESOURCE_FISH', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'RESOURCE_STONE', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'RESOURCE_BISON', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_WHALE', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_PEARLS', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_GOLD', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_SILVER', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_GEMS', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_MARBLE', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_IVORY', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_FUR', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_DYE', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_SPICES', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_SILK', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_SUGAR', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_COTTON', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_WINE', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_INCENSE', 	'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_JEWELRY',		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_PORCELAIN', 	'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_COPPER', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_SALT', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_CRAB', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_TRUFFLES', 	'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_CITRUS', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_NUTMEG', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_CLOVES', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_PEPPER', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_COCOA', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_COFFEE', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_TEA', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_TOBACCO', 	'YIELD_GOLD',		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_AMBER', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_JADE', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_OLIVE', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_PERFUME', 	'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_CORAL', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_LAPIS', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'RESOURCE_GLASS', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'RESOURCE_WHEAT', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'RESOURCE_COW', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'RESOURCE_SHEEP', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'RESOURCE_DEER', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'RESOURCE_BANANA', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'RESOURCE_FISH', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'RESOURCE_STONE', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'RESOURCE_BISON', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_WHALE', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_PEARLS', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_GOLD', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_SILVER', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_GEMS', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS',			'RESOURCE_MARBLE', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_IVORY', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_FUR', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_DYE', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_SPICES', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_SILK', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_SUGAR', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_COTTON', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_WINE', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_INCENSE', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_JEWELRY', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_PORCELAIN', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_COPPER', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_SALT', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_CRAB', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_TRUFFLES', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_CITRUS', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_NUTMEG', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_CLOVES', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_PEPPER', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_COCOA', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_COFFEE', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_TEA', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_TOBACCO', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_AMBER', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_JADE', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS',			'RESOURCE_OLIVE', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_PERFUME', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_CORAL', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_LAPIS', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'RESOURCE_GLASS', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'RESOURCE_IRON', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'RESOURCE_HORSE', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'RESOURCE_COAL', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'RESOURCE_OIL', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'RESOURCE_ALUMINUM', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'RESOURCE_URANIUM', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_WHEAT',		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_COW', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_SHEEP', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_DEER', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_BANANA', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_FISH', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_STONE', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_BISON', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_IRON', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_HORSE', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_COAL', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_OIL', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_ALUMINUM', 	'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'RESOURCE_URANIUM', 	'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_COW', 		'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_SHEEP', 		'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_DEER', 		'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_FISH', 		'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_BISON', 		'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_WHALE', 		'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_PEARLS', 		'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_IVORY', 		'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_FUR', 		'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_CRAB', 		'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_TRUFFLES', 	'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_CORAL', 		'YIELD_FAITH', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_HORSE', 		'YIELD_FAITH', 		1;


-- bonus
INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 			YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'YIELD_CULTURE', 	1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_BONUS';

INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 			YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'YIELD_FOOD', 		1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_BONUS';

INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 			YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'YIELD_GOLD', 		1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_BONUS';

-- luxury
INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 			YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'YIELD_GOLD', 		1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 			YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'YIELD_FOOD', 		1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

--animals
INSERT INTO EventChoice_ResourceYieldChange 
			(EventChoiceType, 							ResourceType, 			YieldType, 		YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 	'RESOURCE_BIRDS_NEST', 	'YIELD_FAITH', 	1
WHERE EXISTS (SELECT * FROM Community WHERE Type='UCS-EMR' AND Value = 1);


INSERT INTO EventChoice_CityUnhappinessNeedMod 
			(EventChoiceType,							 	YieldType, 			Yield)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WITTENBERG', 	'YIELD_FAITH', 		-15 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DJIBOUTI', 		'YIELD_GOLD', 		-5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIGALI', 		'YIELD_SCIENCE', 	-5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIERRA_LEONE', 	'YIELD_CULTURE', 	-5;
---------------------------------------------------
-- Definitions - Improvements
---------------------------------------------------	
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 							LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_IMPROVEMENT_MARSH', 	'Improvement', 	'BRUSSELS_MARSH');

INSERT INTO ArtDefine_Landmarks
			(Era, State, 	Scale, 	ImprovementType, 				LayoutHandler, 	ResourceType, Model, TerrainContour)
SELECT 		Era, State, 	Scale, 	'ART_DEF_IMPROVEMENT_MARSH', 	LayoutHandler, 	ResourceType, Model, TerrainContour
FROM ArtDefine_Landmarks WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_POLDER';
			
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 			TileType, 		Asset)
VALUES 		('ART_DEF_IMPROVEMENT_MARSH', 	'Improvement', 	'sv_BuildMarsh.dds');
------------------------------
INSERT INTO Builds 
			(Type, 			Time, 	ImprovementType, 		Description, 			Help, 						EntityEvent, 				HotKey, 	OrderPriority, 	IconIndex, 	IconAtlas)
SELECT 		'BUILD_MARSH', 	700, 	'IMPROVEMENT_MARSH', 	'TXT_KEY_BUILD_MARSH', 	'TXT_KEY_BUILD_MARSH_HELP', 'ENTITY_EVENT_IRRIGATE', 	'KB_L', 	97, 			1, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_MOUND', 	700, 	'IMPROVEMENT_MOUND', 	'TXT_KEY_BUILD_MOUND', 	'TXT_KEY_BUILD_MOUND_HELP', 'ENTITY_EVENT_BUILD', 		'KB_F', 	1, 				0, 			'UNIT_ACTION_KUNA';

INSERT INTO Unit_Builds 
			(UnitType, 		BuildType)
SELECT 		'UNIT_WORKER', 	'BUILD_MARSH' UNION ALL
SELECT 		'UNIT_WORKER', 	'BUILD_MOUND';

INSERT INTO BuildFeatures 
			(BuildType, 	FeatureType, 		PrereqTech, 			Time, 	Production, 	Remove)
SELECT 		'BUILD_MARSH', 	'FEATURE_JUNGLE', 	'TECH_CALENDAR', 		500, 	40,			 	1 UNION ALL
SELECT 		'BUILD_MARSH', 	'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_MOUND', 	'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_MOUND', 	'FEATURE_JUNGLE', 	'TECH_CALENDAR', 		500, 	40, 			1 UNION ALL
SELECT 		'BUILD_MOUND', 	'FEATURE_MARSH',	'TECH_IRON_WORKING', 	600, 	0, 				1;
------------------------------
INSERT INTO Improvements 
			(Type, 					Description, 					Civilopedia, 						Help, 								ArtDefineTag, 							PortraitIndex, 	IconAtlas)
SELECT 		'IMPROVEMENT_MARSH', 	'TXT_KEY_IMPROVEMENT_MARSH', 	'TXT_KEY_CIV5_IMPROVEMENTS_MARSH', 	'TXT_KEY_IMPROVEMENT_MARSH_HELP', 	'ART_DEF_IMPROVEMENT_MARSH', 			0, 				'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 	'TXT_KEY_IMPROVEMENT_MOUND', 	'TXT_KEY_CIV5_IMPROVEMENTS_MOUND', 	'TXT_KEY_IMPROVEMENT_MOUND_HELP', 	'ART_DEF_IMPROVEMENT_MOTTE_BAILEY', 	0, 				'TERRAIN_IMPROVEMENT_KUNA';

UPDATE Improvements SET Coastal = 1, RemoveWhenComplete = 1, CreatesFeature = 'FEATURE_MARSH' WHERE Type = 'IMPROVEMENT_MARSH';
UPDATE Improvements SET NoTwoAdjacent = 1, DefenseModifier = 15 WHERE Type = 'IMPROVEMENT_MOUND';

UPDATE ArtDefine_Landmarks SET Scale= 0.75 WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_MOTTE_BAILEY';

INSERT INTO Improvement_ValidTerrains 
			(ImprovementType, 		TerrainType)
SELECT 		'IMPROVEMENT_MARSH', 	'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_MARSH', 	'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_MARSH', 	'TERRAIN_SNOW' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 	'TERRAIN_GRASS' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 	'TERRAIN_PLAINS' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 	'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 	'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 	'TERRAIN_SNOW';
	
INSERT INTO Improvement_Yields 
			(ImprovementType, 		YieldType, 			Yield)
SELECT 		'IMPROVEMENT_MARSH', 	'YIELD_CULTURE', 	1 UNION ALL														
SELECT 		'IMPROVEMENT_MARSH', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 	'YIELD_GOLD', 		1;

INSERT INTO Improvement_AdjacentImprovementYieldChanges
			(ImprovementType, 		OtherImprovementType, 		YieldType, 		Yield)
SELECT 		'IMPROVEMENT_MOUND', 	'IMPROVEMENT_TRADING_POST', 'YIELD_GOLD', 	1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 	'IMPROVEMENT_TRADING_POST', 'YIELD_FAITH', 	1;

INSERT INTO Improvement_AdjacentCityYields
			(ImprovementType, 		YieldType, 					Yield)
SELECT 		'IMPROVEMENT_MOUND', 	'YIELD_GOLDEN_AGE_POINTS', 	1;

INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType, 				ImprovementType, 		YieldType, 			Yield)
SELECT 		'POLICY_CIVIL_SOCIETY', 	'IMPROVEMENT_MOUND', 	'YIELD_FOOD', 		4 UNION ALL
SELECT 		'POLICY_MOBILIZATION', 		'IMPROVEMENT_MOUND', 	'YIELD_SCIENCE', 	3 UNION ALL
SELECT 		'POLICY_FIVE_YEAR_PLAN', 	'IMPROVEMENT_MOUND', 	'YIELD_PRODUCTION', 3; 