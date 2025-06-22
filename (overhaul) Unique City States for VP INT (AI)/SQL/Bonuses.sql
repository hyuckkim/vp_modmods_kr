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
-- Updates - Language_ko_KR
---------------------------------------------------
UPDATE Language_ko_KR SET Text = REPLACE(Text, '가능![ENDCOLOR]', '[ENDCOLOR]가능!') WHERE Tag = 'TXT_KEY_CSTATE_CAN_EMBASSY';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '가능![ENDCOLOR]', '[ENDCOLOR]가능!') WHERE Tag = 'TXT_KEY_CSTATE_CAN_PROTECT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '  It rests at {2_InfluenceAnchor}.', ' It rests at {2_InfluenceAnchor} [ICON_INFLUENCE].') WHERE Tag = 'TXT_KEY_CSTATE_INFLUENCE_RATE';
UPDATE Language_ko_KR SET Text = REPLACE(Text, 'early.[NEWLINE][NEWLINE]', 'early.') WHERE Tag = 'TXT_KEY_CSTATE_JERK_STATUS';
UPDATE Language_ko_KR SET Text = REPLACE(Text, 'For the next', '[ICON_BULLET]For the next') WHERE Tag = 'TXT_KEY_CSTATE_JERK_STATUS';
UPDATE Language_ko_KR SET Text = REPLACE(Text, 'If you', '[ICON_BULLET]If you') WHERE Tag = 'TXT_KEY_CSTATE_JERK_STATUS';
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
INSERT INTO Language_ko_KR (Tag, Text)
-- main definitions
SELECT 'TXT_KEY_CITYSTATE_CLERMONT', 					'클레몬트' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CLERMONT_ADJ', 					'[COLOR:240:240:140:255]클레몬트[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_CLERMONT_TEXT', 						'클레몬트는 제1차 십자군 원정의 시작점이었고, 기독교는 예루살렘을 무슬림의 지배로부터 해방시키려고 했습니다. 교황 우르바노 2세는 1095년 제2차 클레몬트 공의회에서 십자군을 모았습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONDURAS', 					'테구시갈파' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONDURAS_ADJ', 					'[COLOR:240:240:140:255]온두라스[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_HONDURAS_TEXT', 						'온두라스는 16세기에 스페인이 점령하기 전에 몇몇 메소아메리카 문화의 고향이었습니다. 온두라스는 1821년에 독립했고 그 이후로 공화국이 되었습니다. 그러나 공화국은 그들의 정부가 외국인 투자자들로부터 바나나의 개발만을 지원받은 바나나 공화국의 모습으로 남아있습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AUCKLAND', 					'파리하카' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AUCKLAND_ADJ', 					'[COLOR:240:240:140:255]마오리[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_AUCKLAND_TEXT', 						'마오리족이 지금의 뉴질랜드 북부에 있는 지협에 정착했을 때, 그들은 비옥한 땅, 무성한 정글, 그리고 휴화산으로 가득한 주변 풍경을 발견했습니다. 지협 양쪽에 있는 자연 보호 항구는 풍부한 어업과 전쟁 카누의 기지를 제공했습니다. 정착민들은 그것을 ''타마키 마카오''라고 불렀는데, 대략 "백 명의 연인들이 찾는 소녀"로 번역됩니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ARMAGH', 						'아마' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ARMAGH_ADJ', 						'[COLOR:240:240:140:255]아마[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_ARMAGH_TEXT', 							'아일랜드의 마을인 아마는 오랫동안 종교를 알고 있었습니다. 고대 이교도들의 예배 장소였던 것으로 생각되는 이곳은 5세기에 기독교 선교사 성 패트릭이 언덕 꼭대기에 석조 교회를 세우고 봉헌하면서 유명해졌습니다. 그 주변에 수도원이 생겼고, 그리고 나서 신학의 첨탑인 아일랜드 전역에 기독교를 전파하는 데 헌신한 마을이 생겼습니다.[NEWLINE][NEWLINE]이것이 아마가 해안 도시라는 것을 의미하지는 않습니다. 북아일랜드에 위치한 이곳은 바다에서 불과 25마일(약 40km) 떨어져 있습니다. 그럼에도 불구하고 아일랜드 교회의 중심지라는 명성 때문에 부를 노리는 사람들에게는 매력적인 목표물이 되었습니다. 9세기에 바이킹들이 아마 수도원을 두 번이나 습격했는데, 그때마다 육로를 통해 수많은 종교 유물을 훔쳐 달아났습니다. 12세기 후반, 노르만 기사 존 드 쿠르시는 이 마을을 약탈하면서 이 전통을 되풀이했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUSCAT', 						'무스카트' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUSCAT_ADJ', 						'[COLOR:240:240:140:255]무스카트[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_MUSCAT_TEXT', 							'무스카트를 통해 흐르는 무역은 적어도 2천년 동안 그것의 생명선이었습니다. 알 하자르 산의 기슭에 둥지를 튼 프톨레마이오스는 이 곳을 1세기 초에 숨겨진 항구(''크립투스 포르투스'')라고 불렀습니다. 불행히도 이 도시는 잘 숨겨져 있지 않았습니다. 페르시아 만의 어귀에 위치한 이 도시의 주요 위치는 오랫동안 이곳을 정복하기 위한 매력적인 목표로 만들었습니다.[NEWLINE][NEWLINE]수세기 동안 무스카트 항구는 사산조, 아랍조(7세기에 이슬람으로 개종), 아바스조, 셀주크조, 페르시아조 등 수많은 왕조의 영향을 받아 왔습니다. 16세기 초, 포르투갈 제독이 대포를 이용해 무역 관계를 구축하려다 무스카트의 대부분을 불태웠습니다. 이후 무스카트는 재건되었고, 1650년 오만이 포르투갈을 몰아내고 항구 도시를 되찾을 때까지 포르투갈의 지배를 받았습니다.[NEWLINE][NEWLINE]무스카트는 오랫동안 오만 내륙 부족들과 갈등을 빚어 왔으며, 특히 자치권을 둘러싼 갈등이 잦았습니다. 18세기 이러한 혼란 속에서 알 부 사이드 왕조가 등장했고, 이 왕조는 현대까지 이어지고 있습니다. 오늘날, 대대적으로 현대화된 무스카트는 오만의 수도이자 중요한 무역항으로 자리 잡고 있습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GRANADA', 					'그라나다' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GRANADA_ADJ', 					'[COLOR:240:240:140:255]그라나다[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_GRANADA_TEXT', 						'8세기에 우마이야 칼리프는 이베리아 반도를 통해 퍼져나가 비시고딕 히스파니아를 빠르게 정복했습니다. 현재 스페인 남부에 있는 요새화된 정착지인 그라나다가 침공으로 휩쓸렸습니다. 15세기 후반에 이르러서는 가톨릭 군주들에게 항복함으로써 안달루시아의 레키스타는 막을 내리게 되었지만, 천년의 4분의 3 동안 그라나다는 무어인의 소유가 되었습니다.[NEWLINE][NEWLINE]시에라 네바다 산맥의 기슭에 위치한 그라나다는 낮은 평야에 위치해 있기 때문에 거의 방어할 수 없는 불운을 겪었습니다. 그곳의 무어 통치자들은 재빨리 이 사실을 깨닫고 그들의 권력을 마을을 내려다볼 수 있는 더 방어하기 쉬운 언덕으로 옮겼습니다. 그들의 계획 중 일부는 나중에 아름다운 알함브라로 개조될 알자르를 건설하는 것을 포함했습니다.[NEWLINE][NEWLINE]그라나다의 무어족 주인들은 수세기에 걸쳐 변화했습니다. 알모아 가문은 우마이야 왕조의 잔당을 이어받은 알모라비드 가문을 대체했습니다. 그 도시의 운명은 13세기에 가톨릭 왕국 카스티야 왕국과 동맹을 맺은 나스리드 왕조와 함께 그라나다 토후국으로 다시 바뀌었습니다. 사하라 이남 아프리카에 있는 무역 센터로의 직접 접근은 그라나다를 한동안 레콩키스타로부터 해방시켰습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NAN_MADOL', 					'레루' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NAN_MADOL_ADJ', 					'[COLOR:240:240:140:255]레루[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_NAN_MADOL_TEXT', 						'레루는 선사 시대와 역사적인 주요 고고학 유적지입니다. 그 유적들은 14세기와 15세기 경에 절정에 달했던 문명의 유적들로, 19세기 초 유럽인들의 접촉 당시에도 여전히 그 요소들을 볼 수 있습니다. 레루의 통치자들은 점차적으로 코스라에 섬을 정복하고 통일했습니다. 수도 레루에서, 그들은 고고학자들이 통가나 하와이의 왕국들과 비슷하다고 여기는 군주제로 그 섬을 통치했습니다.[NEWLINE][NEWLINE]대부분의 고고학자와 역사학자들은 미크로네시아 폰페이 섬 동쪽 해안에 인접한 버려진 도시 난 마돌의 유적이 사라진 무 대륙의 잔재라고 믿지 않습니다. 이 도시는 석호에 건설되었으며, 돌과 산호로 채워진 플랫폼 위에 지어진 약 100개의 작은 인공 섬으로 이루어져 있으며, 조수 운하로 분리되어 있습니다. 선사 시대 대륙 침몰의 잔재가 아니라, 이 섬들의 건설은 서기 8세기경에 시작되었고, 그 위에 거석 구조물들이 건설된 것은 12세기와 13세기에 이루어졌을 것으로 추정됩니다. 이는 샌들러 왕조의 엘리트 계층이 평민들과 섞일 필요가 없었기 때문입니다.[NEWLINE][NEWLINE]이 석호 도시의 원래 이름은 소운 난렝("천국의 암초")이었으며, 유럽 탐험가들은 이곳을 "태평양의 베니스"라고 불렀습니다. 이름이 붙은 섬들은 대부분 족장과 사제들의 주거지였습니다. 하지만 일부는 특별한 필요를 충족하기 위해 운영되기도 했습니다. 예를 들어, 음식 조리, 페이너링 섬에서의 코코넛 오일 생산, 다파후 섬에서의 카누 제작 등이 있었습니다. 장례 "동네"에는 무덤으로 덮인 약 58개의 섬이 있습니다. 난 마돌은 폰페이 섬과 템웬 섬의 씨족(약 2만 5천 명)을 통합하는 데 성공한 산델러의 정치적, 종교적, 문화적 중심지였습니다. 그 직후, 통치자는 부족 족장들을 감시할 수 있는 새로운 도시로 이주하도록 강요했습니다.[NEWLINE][NEWLINE]난 마돌의 인구는 전성기에는 약 1,000명이었습니다. 섬에는 식량이나 식수를 구할 수 없었기 때문에 모든 것을 폰페이에서 배를 타고 옮겨야 했습니다. 전설에 따르면, 모든 건물과 무덤에 사용된 돌은 산델러를 세운 쌍둥이 마법사 올리시파와 올로소파가 섬으로 날라 왔다고 합니다. 난마돌이 어떻게 만들어졌는지에 대한 사실이 무엇이든, 1800년대 초 유럽인들이 도착했을 당시 난마돌은 이미 버려져 있었는데, 아마도 1450년경 샌델러가 무너졌을 때였을 것입니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GWYNEDD', 					'아베르프라우' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GWYNEDD_ADJ', 					'[COLOR:240:240:140:255]웨일스[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_GWYNEDD_TEXT', 						'귀네드는 로마 시대 말기부터 독립적인 웨일스 왕국이었습니다. 13세기에 영국에 의해 정복되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUISCA', 						'수아모스' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUISCA_ADJ', 						'[COLOR:240:240:140:255]무이스카[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_MUISCA_TEXT', 							'무이스카는 16세기까지 서쪽의 판체, 북서쪽의 무조, 북쪽의 과네, 북동쪽의 라체, 동쪽의 아카과아, 그리고 남쪽의 수타가오와 같은 안데스 문화의 고향이었으나, 16세기에 스페인 정복자들이 이 문화들을 파괴했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LACONIA', 					'스파르타' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LACONIA_ADJ', 					'[COLOR:240:240:140:255]스파르타[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_LACONIA_TEXT', 						'도시 국가의 수도인 스파르타의 한 지역으로 여겨지는 라코니아는 펠로폰네소스 지역에서 지배권을 다투는 가장 강력한 지역 세력 중 하나입니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CHEVAK', 						'셰바크' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CHEVAK_ADJ', 						'[COLOR:240:240:140:255]셰바크[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_CHEVAK_TEXT', 							'알래스카의 셰바크족이 사는 지역입니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANTO_DOMINGO', 				'산토 도밍고' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANTO_DOMINGO_ADJ', 				'[COLOR:240:240:140:255]도미니카[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_SANTO_DOMINGO_TEXT', 					'산토 도밍고는 아메리카 대륙에서 가장 오래된 유럽 도시가 되었습니다. 원래 이름은 라 누에바 이사벨라였고, 1495년에 성 도미니크를 기념하기 위해 산토 도밍고로 이름이 바뀌었습니다. 산토 도밍고는 도시가 커지고 번창하면서 "캐리비안의 관문"으로 알려지게 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MANAGUA', 					'마나과' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MANAGUA_ADJ', 					'[COLOR:240:240:140:255]마나과[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_MANAGUA_TEXT', 						'메스티소와 스페인 상류층 백인들로 구성된 마나과로, 이 도시는 어촌 마을에서 번영하는 스페인 도시가 되었고, 현재 가장 잘 알려진 중앙아메리카의 발전된 도시가 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ODENSO', 						'헬싱키' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ODENSO_ADJ', 						'[COLOR:240:240:140:255]핀란드[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_ODENSO_TEXT', 							'문자 그대로 오딘의 섬으로 번역된 이 섬은 핀란드 왕국에 의해 북유럽 신화의 신 오딘을 인정받아 명명되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_YANGCHENG', 					'옌청' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_YANGCHENG_ADJ', 					'[COLOR:240:240:140:255]옌청[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_YANGCHENG_TEXT', 						'하 왕조의 첫 번째 수도로, 이허 강 위에 지어졌고 그들의 왕조가 멸망할 때까지 유지되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PHANOTEUS', 					'파노테우스' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PHANOTEUS_ADJ', 					'[COLOR:240:240:140:255]포키스[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_PHANOTEUS_TEXT', 						'파노테우스는 매우 오래된 마을로, 원래 플라레야에가 거주했습니다. 프로메테소스가 이곳에서 인류를 만들었다고 여겨집니다. 크세르크세스 휘하의 페르시아인, 필리포스 2세 휘하의 마케도니아인, 폼페이 대왕 휘하의 로마인들에 의해 시간이 지남에 따라 파괴되고 파괴될 때까지 유지되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DOUALA', 						'두알라' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DOUALA_ADJ', 						'[COLOR:240:240:140:255]두알라[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_DOUALA_TEXT', 							'두알라는 카메룬에서 가장 큰 도시이자 이 지역에서 가장 강력한 경제 성장을 한 도시입니다. 1960년 카메룬의 독립은 두알라의 경제적 중요성이 발전과 번영에 결정적이 되면서 두알라의 강력한 급속한 경제 성장을 낳았습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AMBRACIA', 					'암브라시아' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AMBRACIA_ADJ', 					'[COLOR:240:240:140:255]암브라시아[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_AMBRACIA_TEXT', 						'암브레시아는 고대 그리스 역사에서 마케도니아 왕 카산드로스가 에피로스의 왕 피로스에게 선물한 도시입니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DJIBOUTI', 					'지부티' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DJIBOUTI_ADJ', 					'[COLOR:240:240:140:255]지부티[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_DJIBOUTI_TEXT', 						'지부티는 프랑스의 지배하에 오복으로 정착하기 전까지 원래 무인도 해안 지역이었습니다. 프랑스로부터 독립한 후에 이름이 바뀌었고 또한 각각의 이름 있는 나라의 수도가 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DODOMA', 						'다르 에스 살람' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DODOMA_ADJ', 						'[COLOR:240:240:140:255]다르 에스 살람[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_DODOMA_TEXT', 							'스와힐리 해안에 위치한 다르에스살람(아랍어: "평화의 거처")은 탄자니아에서 가장 큰 도시이자 예술, 패션, 미디어, 영화, 텔레비전, 금융의 가장 유명한 중심지입니다. 인구 6백만 명이 넘는 다르는 동아프리카에서 가장 큰 도시이자 아프리카에서 6번째로 큰 도시입니다.[NEWLINE][NEWLINE]다르에스살람은 1862년 잔지바르의 초대 술탄인 마지드 빈 사이드가 음지지마(스와힐리어로 "건강한 마을") 마을이 있는 곳. 1887년 독일 동아프리카 회사가 그곳에 역을 세울 때까지 작은 항구에 불과했습니다. 1905년 이 도시는 도시의 성장과 산업 발전을 촉진한 중앙선 철도의 출발점이었습니다. 다르에스살람은 독일 동아프리카(1891~1916), 탕가니카(1961~64), 탄자니아(1964~74)의 수도였습니다. 1974년 도도마는 새 수도로 지정되었지만 공식 기능 이전은 1996년에 공식적으로 완료되었습니다. [NEWLINE][NEWLINE]다르에스살람의 건물은 종종 이 도시의 식민지 시대 과거를 반영하고 스와힐리어, 영국, 독일 및 아시아 전통을 통합하는 다양한 건축 양식을 보여줍니다. 제2차 세계대전 이후 현대화 및 확장으로 병원 단지, 기술 연구소, 고등 법원을 포함한 현대식 다층 건물이 들어섰습니다. 교육 시설로는 다르에스살람 대학교(1961), 여러 도서관 및 연구 기관, 국립 박물관이 있습니다.[NEWLINE][NEWLINE]다르에스살람의 거의 육지로 둘러싸인 자연 항구는 탄자니아 본토 대부분의 출구입니다. 농업 및 광물 수출은 우간다, 르완다, 부룬디, 콩고 민주 공화국, 잠비아 및 말라위와 같은 인근 내륙 국가에 서비스를 제공합니다. 또한 항해가 가능한 지류인 루알라바까지 철도로 도달할 수 있는 콩고 강의 환승 항구이기도 합니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_FAYA', 						'파야' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_FAYA_ADJ', 						'[COLOR:240:240:140:255]파야[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_FAYA_TEXT', 							'파야는 현대 차드 북부의 많은 인구를 자랑하는 열대의 더운 지역입니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KIGALI', 						'키갈리' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KIGALI_ADJ', 						'[COLOR:240:240:140:255]키갈리[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_KIGALI_TEXT', 							'키갈리는 14세기에 르완다 왕국에 의해 처음 개발되고 있는 르완다의 수도이며, 근대에 역사적인 수도가 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LEVUKA', 						'레브카' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LEVUKA_ADJ', 						'[COLOR:240:240:140:255]피지[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_LEVUKA_TEXT', 							'레브카는 오발라우 섬의 동해안에 있는 항구 도시이자 남태평양 국가 피지에 있는 로마위티주의 주도입니다. 1822년 미국 모험가에 의해 정착된 이 지역은 미국 남북 전쟁(1861~65) 동안 세계 면화 공급이 차질을 빚은 면화 붐의 중심지였습니다.[NEWLINE][NEWLINE]1871년 피지의 최초의 현대 민족 국가인 피지 왕국이 세워졌을 때 세루 에페니사 카코바우가 레부카에서 왕위에 올랐습니다. 1874년 피지가 영국 식민지로 합병된 후 레부카는 1877년까지 수도로 남아 있었는데, 그 때 행정부는 수바로 이전되었지만 공식적으로는 1882년 이전이 이루어지지 않았습니다.[NEWLINE][NEWLINE]지금은 주로 일본, 한국, 대만 어선이 공급하는 피지 참치 가공 산업의 중심지입니다. 마을의 19세기 건축물은 여전히 대부분 그대로 남아 있으며 2013년 레부카는 문화적, 역사적 가치로 인해 유네스코 세계 문화 유산으로 지정되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_QUELIMANE', 					'켈리마네' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_QUELIMANE_ADJ', 					'[COLOR:240:240:140:255]켈리마네[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_QUELIMANE_TEXT', 						'켈리마네는 홍수에 극도로 취약한 지역입니다. 스와힐리 교역소로 설립된 이곳은 번영하는 항구로 발전했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SIERRA_LEONE', 				'프리타운' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SIERRA_LEONE_ADJ', 				'[COLOR:240:240:140:255]시에라 리온[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_SIERRA_LEONE_TEXT', 					'프리타운은 사막과 습지로 다양한 지역입니다. 영국의 지배하에 세워진 이 나라는 독립성을 부여받았고 이웃 나라에 비해 종교적 관용을 자랑했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SURREY', 						'브루클랜드' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SURREY_ADJ', 						'[COLOR:240:240:140:255]서리[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_SURREY_TEXT', 							'서리는 영국 남동부에 있는 마을입니다. 비행장으로서의 첫 번째 용도로 알려진, 그 마을은 비행기와 항공기의 생산에 있어 중요시 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TAIWAN', 						'타이베이' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TAIWAN_ADJ', 						'[COLOR:240:240:140:255]타이베이[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_TAIWAN_TEXT', 							'타이베이는 중화민국의 수도이며, 대만의 문화, 정치, 경제의 중심입니다. 국민당의 중국 망명 정부가 수립되기 전에, 타이베이는 중국, 일본, 필리핀 사이의 무역로를 따라 위치한 작은 지방 수도였습니다. 주변 지역의 대부분은 한족에 의한 중국 본토의 지배와 구별되는 풍부한 문화적 구조를 형성하면서, 몇몇 타이완 원주민들이 계속해서 거주합니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OC_EO', 						'옥 에오' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OC_EO_ADJ', 						'[COLOR:240:240:140:255]푸난[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_OC_EO_TEXT', 							'푸난은 서기 1세기에 생겨난 캄보디아의 고대 국가로 6세기에 첸라 주에 편입되었습니다. 푸난(아마도 pnom, "산"의 중국어 필사본)은 동남아시아 최초의 중요한 힌두교 왕국이었습니다. 현재 베트남, 태국, 캄보디아의 일부를 포함했습니다. 푸난은 인도 및 중국과 무역 관계를 맺었으며 푸난 사람들은 3세기에서 6세기 사이에 황제에게 조공을 바쳤습니다.[NEWLINE][NEWLINE]푸난은 수이 메아라라고도 알려진 3세기 왕 판 시만 아래에서 권력의 정점에 도달했습니다. 판 시만은 제국의 해군을 확장하고 푸난의 관료제를 개선하여 특히 제국의 더 먼 곳에서 지역 관습과 정체성을 그대로 유지하는 준 봉건적 패턴을 만들었습니다. 판 시만과 그의 후계자들은 또한 해상 무역을 규제하기 위해 중국과 인도에 대사를 보냈습니다. 왕국은 동남아시아의 인도화 과정을 가속화했을 것입니다. 진랍과 같은 동남아시아의 후기 왕국은 푸난의 법원을 모방했을 수 있습니다. 푸난은 지역 제국의 패턴이 될 강력한 중상주의 및 상업적 독점 시스템을 구축했습니다.[NEWLINE][NEWLINE]푸난의 높은 해양 무역 의존도는 그들 몰락의 원인이었습니다. 그들의 해안 항구는 상품을 북쪽과 해안 인구로 보내는 외국 지역과의 무역을 허용했습니다. 그러나 해양 무역이 수마트라로 이동하고 스리위자야 무역 제국이 부상하고 중국이 동남아시아 전역의 무역로를 점령하면서 남쪽의 경제 불안정이 발생하고 정치와 경제가 북쪽으로 밀려났습니다. 푸난은 6세기에 첸라 왕국의 크메르 정치에 의해 대체되고 흡수되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_THIMPHU', 					'팀푸' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_THIMPHU_ADJ', 					'[COLOR:240:240:140:255]팀푸[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_THIMPHU_TEXT', 						'1955년부터 팀푸는 히말라야 동쪽 끝에 있는 남아시아의 내륙국인 부탄 왕국의 수도입니다. 북쪽으로는 티베트(중국), 남쪽, 동쪽, 서쪽으로는 인도와 접해 있습니다. 부탄은 17세기 초까지 소규모 전쟁 영지의 패치워크로 존재했습니다. 그 당시 티베트에서 종교적 박해를 피해 도망친 최초의 잡드룽 린포체인 라마이자 군사 지도자인 응아왕 남걀은 이 지역을 통합하고 뚜렷한 부탄 정체성을 발전시켰습니다. 20세기 초 부탄은 대영제국과 접촉했고 독립 후에도 인도와 강력한 양자 관계를 유지했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANDORRA', 					'안도라' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANDORRA_ADJ', 					'[COLOR:240:240:140:255]안도라[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_ANDORRA_TEXT', 						'피레네 산맥의 남쪽 경사면에 위치한 안도라 공국은 시내가 발리라 강을 형성하는 산골짜기로 구성되어 있습니다. 안도라의 독립은 전통적으로 서기 803년에 무슬림으로부터 이 지역을 회복한 샤를마뉴에게 귀속됩니다. 1278년에 푸아의 프랑스 백작과 우르겔의 스페인 주교의 공동 종주권 아래 놓였으며, 이후 우르겔의 스페인 주교와 프랑스 국가 원수가 공동으로 다스렸습니다. 유럽에서 마지막인 이 봉건 정부 제도는 1993년 헌법이 채택되어 대부분의 공동 공직자의 권한을 보통 선거로 선출되는 안도라 총평의회로 이양할 때까지 계속되었습니다.[NEWLINE][NEWLINE]안도라는 카탈로니아와의 길고 강한 친화성; 제도는 카탈루냐 법을 기반으로 하며 우르겔 교구(스페인)의 일부입니다.[NEWLINE][NEWLINE]전통 경제는 양 사육을 기반으로 했지만 1950년대 이후 관광의 중요성이 커져 21세기 초반에는 안도라의 중심이 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CANOSSA', 					'카노사' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CANOSSA_ADJ', 					'[COLOR:240:240:140:255]카노사[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_CANOSSA_TEXT', 						'카노사는 이탈리아의 레조넬레밀리아 남서쪽의 폐허가 된 10세기 성으로, 1077년 교황 그레고리오 7세와 황제 하인리히 4세의 만남의 장소로 유명합니다. 940년 아토 가문의 설립자이자 카노사의 첫 번째 백작인 아달베르트 아토에 의해 세워졌습니다. [NEWLINE]서위 논란에서 교황권의 강력한 지지자였던 카노사 백작부인 마틸다(토스카나의 마틸다)의 초청으로 그레고리오 7세는 1077년 적수에 대항하기 위해 독일로 가는 길에 요새에 머물렀습니다. 헨리 4세. 그의 증언을 미연에 방지하기 위해 헨리는 단순한 참회자로 카노사로 여행했고 1월 28일에 3일을 기다린 후 사면을 받았습니다.[NEWLINE][NEWLINE]이것이 교황권의 지속적인 승리를 의미하지는 않았지만 카노사의 이름은 세속 권력이 교회에 복종하는 것을 뜻하게 되었습니다. 따라서 독일에서 로마 카톨릭의 영향에 반대하는 프로이센의 문화투쟁 동안 비스마르크의 격언: "Nach Canossa gehen wir nicht"("우리는 카노사에 가지 않을 것이다") 도 등장했습니다.[NEWLINE][NEWLINE]이 성은 1255년 레지오 사람들에 의해 파괴되었습니다. 나중에 카노사 가문에게 반환되었습니다. 1321년 길베르토 다 코레지오가 사망한 후 시모네, 귀도 및 알베르토 카노사가 다시 되찾은 1402년까지 다시 레지오의 소유였습니다. 그러나 1409년에 그들은 그것을 에스테 가문에 양도했고, 1557년 파르마 공작 오타비오 파르네세 치하의 짧은 기간을 제외하고는 1796년까지 그것을 소유했다. 그것을 발렌티누스 가문에게 맡겼습니다. 후자는 시스파다네 공화국에 합류한 반항적인 지역 주민들에 의해 1796년에 축출되었습니다. 1819년 발렌티니에게 반환된 후 1878년에 성은 이탈리아 국가에 인수되었고 국가 기념물로 지정되었습니다.[NEWLINE][NEWLINE]지명 "카노사"는 1992년 인근 마을인 샤노 덴자가 역사적, 문화적 유산을 기리기 위해 이름을 카노사로 변경하기 전까지 폐허가 된 성과 인접한 작은 마을만을 지칭했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BEDULU', 						'브둘루' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BEDULU_ADJ', 						'[COLOR:240:240:140:255]발리[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_BEDULU_TEXT', 							'"천 개의 사원이 있는 섬"으로 알려진 발리의 역사는 인도네시아 힌두교의 마지막 보루 중 하나인 문화와 종교로 가득 차 있습니다.[NEWLINE][NEWLINE]발리는 원래 동남아시아와 오세아니아에서 해양 동남아시아를 통해 이주한 사람들이 기원전 2000년경에 거주했습니다.[NEWLINE][NEWLINE]언어적으로 발리인들은 인도네시아 군도, 말레이시아, 필리핀, 오세아니아 사람들과 밀접한 관련이 있습니다. 섬의 서쪽에 있는 세키크 마을 근처에서 이 시기의 석기가 발견되었습니다. 896년과 911년의 비문에는 스리 케사리바마가 언급된 914년까지 왕이 언급되어 있지 않습니다. 그들은 또한 불교와 시바교가 동시에 실천되었던 독특한 방언을 가진 독립적인 발리를 드러냅니다.[NEWLINE][NEWLINE]음푸 신독의 증손녀인 마헨드라다타는 989년경 발리 왕 우다야나 워마데와와 결혼하여 1001년경 아이랑가를 낳았습니다. 이 결혼은 발리에 더 많은 힌두교와 자바 문화를 가져왔습니다. 사칼렌두키라나 공주는 1098년에 나타났습니다. 수라디파는 1115년에서 1119년까지, 자야삭티는 1146년에서 1150년까지 통치했습니다. 자야판구스는 1178년에서 1181년 사이의 비문에 나타나고 아둔쿤티케타나와 그의 아들 파라메스바라는 1204년에 나타납니다.[NEWLINE][NEWLINE]발리 문화는 서기 1세기경부터 인도, 중국, 특히 힌두 문화의 영향을 강하게 받았습니다. 발리 드위파("발리 섬")라는 이름은 914년 스리 케사리 워마데와가 쓴 블란종 기둥 비문에서 왈리드위파를 언급하는 등 다양한 비문에서 발견되었습니다. 이 시기에 사람들은 습답 재배에서 쌀을 재배하기 위해 현지에서 수박이라고 불리는 복잡한 관개 시스템을 개발했습니다. 오늘날에도 여전히 행해지는 일부 종교적, 문화적 전통은 이 시기로 거슬러 올라갑니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DALI', 						'양저미' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DALI_ADJ', 						'[COLOR:240:240:140:255]대리국[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_DALI_TEXT', 							'"위대한 진리" 또는 "위대한 행정"이라는 뜻을 가진 대리국은 10세기부터 13세기까지 거의 3세기 동안 동남아시아에서 중요한 역할을 한 불교 왕국이었습니다. 수많은 사원과 거대한 석탑이 있는 경건한 왕국이었으며, 단일 민족이 아닌 다양한 민족과 부족으로 구성되었으며, 그 중 가장 큰 부족은 백이족과 이족이었습니다.[NEWLINE][NEWLINE]대리국은 불교를 보존하고 전파하는 데 큰 영향을 미쳤습니다. 두안 왕족은 그 이전의 난자오 선조들과 마찬가지로 독실한 불교 신자였으며, 달리 주변과 시바오산에 대형 불교 사원을 건설했습니다. 이 사원들은 곧 불교의 중심지가 되었습니다. 이곳에서 왕들은 인근 동남아시아 왕국의 불교를 신봉하는 왕들을 모델로 삼으려고 노력했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MULTAN', 						'물탄' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MULTAN_ADJ', 						'[COLOR:240:240:140:255]가즈나비드[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_MULTAN_TEXT', 							'물탄은 파키스탄 펀자브 주에 있는 도시이자 물탄 지구의 수도입니다. 주 남부에 위치하고 있으며 역사가 깊은 도시입니다. 인구는 380만 명 이상(1998년 인구 조사 기준)으로 파키스탄에서 6번째로 큰 도시입니다. 이 도시는 체납 강 바로 동쪽에 건설되었으며, 국가의 지리적 중심지이자 카라치에서 약 966km 떨어져 있습니다.[NEWLINE][NEWLINE]물탄은 "피르와 신전의 도시"로 알려져 있으며 바자르, 모스크, 멋진 디자인의 무덤이 있는 번영하는 도시입니다. 물탄 국제공항은 파키스탄의 주요 도시와 페르시아만의 도시로 가는 항공편을 연결합니다. 이 도시의 산업으로는 금속 가공, 밀가루, 설탕, 제분, 섬유 제조, 비료, 비누, 유리 등이 있습니다. 물탄은 수공예품, 특히 도자기 및 에나멜 작업으로도 유명합니다.[NEWLINE][NEWLINE]아대륙에서 가장 오래된 도시 중 하나인 물탄은 이슬람 이전 시대의 신전인 태양신 사원에 있던 우상에서 유래한 이름입니다.[NEWLINE][NEWLINE]이 도시는 알렉산더 대왕이 정복(기원전 326년경)하고, 중국 불교 학자 수안상이 방문(AD 641년)하고, 아랍인들이 점령(8세기)했으며, 1005년 무슬림 터키 정복자 가즈나의 마흐무드, 1398년 티무르가 점령했습니다. 16세기와 17세기에 물탄은 무굴 황제들의 통치 아래 평화를 누렸습니다. 1818년, 시크교의 지도자 란짓 싱이 이 도시를 점령했습니다. 영국은 1848년부터 1947년 파키스탄이 독립할 때까지 이곳을 점령했습니다. 랜드마크에는 두 명의 무슬림 성인의 14세기 무덤이 있는 오래된 요새가 있습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BAGAN', 						'바간' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BAGAN_ADJ', 						'[COLOR:240:240:140:255]버마[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_BAGAN_TEXT', 							'이 왕국은 난자오 왕국에서 이라와디 계곡으로 들어온 므란마/버만족이 9세기 파간(현재의 바간)에 세운 작은 정착촌에서 성장했습니다. 그 후 200년 동안 이 작은 공국은 점차 주변 지역을 흡수하며 성장하여 1050년대와 1060년대에 아나라아타 왕이 바간 제국을 세우고 이라와디 계곡과 그 주변을 처음으로 하나의 정치 체제로 통일했습니다. 12세기 후반에 이르러 아나으라타 왕의 후계자들은 남쪽으로는 말레이 반도 상류까지, 동쪽으로는 살윈 강까지, 북쪽으로는 현재의 중국 국경 아래까지, 서쪽으로는 아라칸 북부와 친 언덕까지 영향력을 확장했습니다. 12세기와 13세기에 파간은 크메르 제국과 함께 동남아시아 본토의 두 주요 제국 중 하나였습니다. 파간 왕국은 1280년대까지 면세 종교적 부의 지속적인 증가로 인해 궁정과 군인들의 충성심을 유지하는 왕실의 능력에 심각한 영향을 미치면서 13세기 중반에 쇠퇴하기 시작했습니다. 이로 인해 아라칸족, 몽족, 몽골족, 샨족에 의한 내부 혼란과 외부 도전의 악순환이 시작되었습니다. 반복되는 몽골의 침략(1277-1301)은 1287년 4세기 동안 이어져 온 왕국을 무너뜨렸습니다. 왕국 붕괴 이후 250년간의 정치적 분열은 16세기까지 지속되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_RISHIKESH', 					'리시케시' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_RISHIKESH_ADJ', 					'[COLOR:240:240:140:255]가르왈[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_RISHIKESH_TEXT', 						'"가르왈 히말라야의 관문", "세계 요가의 수도"로 알려진 리시케시는 히리시케시라고도 하며 인도 우타라칸드 주 데라둔 지구의 데라둔 근처에 있는 도시입니다. 갠지스 강 오른쪽 강변에 위치한 이곳은 힌두교도들의 순례 도시로, 고대 현자들과 성인들이 더 높은 지식을 얻기 위해 이곳에서 명상을 했던 곳입니다. 강변을 따라 수많은 사원과 아쉬람이 세워져 있습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUTITJULU', 					'무티출루' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUTITJULU_ADJ', 					'[COLOR:240:240:140:255]아난구[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_MUTITJULU_TEXT', 						'"아난구"는 서부 사막 언어를 사용하는 여러 호주 원주민 그룹을 설명하는 포괄적인 용어로, 핏잔자자라와 얀쿠니트자자라가 가장 두드러지게 사용합니다. 서부 사막 언어는 다른 어떤 원주민 언어보다 호주에서 더 많은 지역을 포괄하는 것으로 알려져 있습니다.[NEWLINE][NEWLINE]울룰루와 카타츄타는 아난구 신앙 체계에서 신성한 장소로, 11개의 송라인이 이곳을 통과하거나 그 근처를 지나갑니다. 1979년 원주민 중앙 토지 위원회)는 울룰루-카타츄타 국립공원에 대한 소유권을 주장하기 위해 법적 소송을 시작했고, 1985년 아난구족이 공원 관리위원회의 과반수를 차지하면서도 관광객의 방문을 허용하는 합의안이 시행되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ISKANWAYA', 					'이스칸와야' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ISKANWAYA_ADJ', 					'[COLOR:240:240:140:255]칼라와야[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_ISKANWAYA_TEXT', 						'이스칸와야는 라파스에서 북쪽으로 325km 떨어진 볼리비아의 리카 강 위 산등성이에 위치한 콜럼버스 이전 시대의 신성한 유적지입니다. 이스칸와야는 페루의 마추픽추를 능가하는 규모와 연륜을 자랑하지만 보존 상태가 좋지 않습니다. 이스칸와야 유적은 잉카 문명 이전의 몰로 문화로 거슬러 올라가며, 기원전 800년 또는 1145년부터 1425년까지 전성기 문화 시대에 사람들이 건축물을 지었을 것으로 추정됩니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TIWANAKU', 					'티와나쿠' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TIWANAKU_ADJ', 					'[COLOR:240:240:140:255]티와나쿠[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_TIWANAKU_TEXT', 						'티와나쿠(스페인어: 티아후아나코 또는 티아후아나쿠)는 남아메리카 볼리비아 서부에 있는 콜럼버스 이전 시대의 고고학 유적지입니다. 티와나쿠는 서기 300년부터 서기 1000년까지 번성했던 제국의 수도로, 현재의 페루와 칠레로 확장되었습니다. 안데스 학자들은 티와나쿠를 잉카 제국 이전의 가장 중요한 문명 중 하나로 인정하고 있으며, 약 500년 동안 주요 국가 세력의 의식 및 행정 수도로 사용되었습니다. 고대 도시 국가의 유적은 잉카 수도인 쿨라수유를 찾는 동안 라 파스.49에서 서쪽으로 약 72km(45마일) 떨어진 티와나쿠 지방의 잉가비 주의 라 파스 부서에 있는 티티카카 호수 남동쪽 해안 근처에 있습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DANO', 						'다노' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DANO_ADJ', 						'[COLOR:240:240:140:255]다가라[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_DANO_TEXT', 							'다노는 부르키나파소 이오바 주의 주도입니다. 직조와 도자기 시장이 있는 작은 마을로, 식민지 기독교의 영향에도 불구하고 전통적인 우주론과 의식 관습을 이어온 다가라족의 고향입니다. 이러한 관습에는 원소의 힘과 교감하고, 다른 세계의 존재와 소통하며, 소라 껍질로 점을 치는 것이 포함됩니다.[NEWLINE][NEWLINE]다가라족 정착촌은 부르키나파소 남서부의 약 3,500평방킬로미터와 가나 북서부의 거의 같은 면적에 걸쳐 있습니다. 다가라족의 정치 및 사회 조직은 다가라 공동체를 영적으로 보호하는 텡간을 기반으로 합니다.[NEWLINE][NEWLINE]대지 신사는 주로 큰 나무 아래 돌로 이루어진 제사 장소로, 규범에 따라 해당 지역에 처음 도착한 정착민들이 세워야 합니다. 대지 신사에서는 여성과 토양의 다산과 특정 지역의 평화를 책임지는 대지신에게 제사를 지냅니다. 대지 신사에 대한 의식적 통제는 동시에 토지를 분배하고 필요한 희생에 대한 기부금을 요구할 권리를 의미합니다. 따라서 신전을 책임지는 제사장인 대지 사제는 후발 정착민에게 토지를 분배하고 다른 자원에 대한 접근을 규제하며, 때로는 상당한 선물을 대가로 후발 정착민은 집을 짓고 죽은 사람을 묻기 위해 대지 사제의 허가를 요청해야 합니다.[NEWLINE][NEWLINE]이 지역의 비중앙집권 사회에서는 텐간소브 또는 틴다나라고 불리는 대지 사제가 지역 사회의 장로 역할을 수행했으며, 식민지 이전 시기에는 유일한 지역 권위자였습니다. 전통에 따르면 대지 사제의 직책은 정착촌의 창시자 또는 같은 씨족 내의 그의 후손 중 한 명에게 주어집니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KARYES', 						'카리에스' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KARYES_ADJ', 						'[COLOR:240:240:140:255]아토나이트[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_KARYES_TEXT', 							'아토스 산의 수도원 공동체는 그리스의 동방 정교회 수도사 공동체로, 아토스 산을 포함한 아토스 반도의 원위부를 포함하는 영토를 가진 자치 지역, 지방 자치 단체 및 지방 자치 단체의 통합 된 권리를 보유하고 있습니다. 반도의 접경 근위부는 중앙 마케도니아의 일반 아리스토텔레스 공동체에 속합니다.[NEWLINE][NEWLINE]963년 성 아타나시우스 아토나이트가 최초의 수도원을 설립하면서 체계적인 수도원 생활이 시작되었습니다. 1400년에는 40개의 수도원이 있었습니다. 오랫동안 그리스 정교회의 성산으로 여겨져 온 이곳은 1927년 신정 공화국으로 선포되었습니다. 아토나이트 수도원에는 잘 보존된 유물, 희귀 서적, 고대 문서, 엄청난 역사적 가치를 지닌 예술품이 풍부하게 소장되어 있으며, 아토스 산은 1988년부터 세계 문화유산으로 등재되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SGANG_GWAAY', 				'스구앵 과이' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SGANG_GWAAY_ADJ', 				'[COLOR:240:240:140:255]하이다[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_SGANG_GWAAY_TEXT', 					'북미의 많은 원주민 부족 중 하나인 하이다 부족은 섬에 사는 민족이라는 점이 특징입니다. 틀링잇족과 침시안족과 관련이 있는 하이다 사회는 귀족, 평민, 노예로 계층화된 씨족 제도를 중심으로 조직되었습니다. 씨족은 모계 혈통을 통해 결정되는 두 개의 주요 씨족이 있었습니다. 이 씨족은 다시 혈통으로 세분화되었습니다.[NEWLINE][NEWLINE]하이다족은 특히 목공예, 직조, 항해에 재능이 뛰어났으며 토템 폴을 최초로 사용한 것으로 알려져 있습니다. 해상에서 활약한 덕분에 식민지 개척자들과 평화로운 무역로를 많이 만들었지만, 현지에서는 노예 제도를 시행하는 두려운 전사였습니다. 이런 이유로 그들은 종종 "북아메리카의 바이킹"이라고 불렸습니다.[NEWLINE][NEWLINE]오늘날 하이다 가와이 본섬의 하이다 보호구역은 하이다 국가 의회를 만들기 위해 함께 뭉쳤습니다. 그들은 문화적 부활을 경험하고 있습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NYARYANA_MARQ', 				'나리얀 마르' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NYARYANA_MARQ_ADJ', 				'[COLOR:240:240:140:255]네네츠[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_NYARYANA_MARQ_TEXT', 					'사모예드족이라고도 알려진 네네츠족은 러시아 북극 북부의 원주민입니다. 2010년의 최신 인구 조사에 따르면 러시아 연방에는 44,857명의 네네츠족이 거주하고 있으며, 대부분은 야말로-네네츠 자치 오크루그와 네네츠 자치 오크루그에 살고 있습니다. 이들은 툰드라 또는 포레스트 품종의 네네츠어를 사용합니다. 러시아어의 문자 그대로 변형된 사모와 예드는 경멸적인 의미로 나타나는 "스스로 먹는 사람"이라는 의미를 전달합니다. 따라서 사모예드라는 이름은 20세기에 빠르게 사용되지 않았고, 사람들은 "사람"을 의미하는 네네츠족이라는 이름을 갖게 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ADEJE', 						'아데헤' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ADEJE_ADJ', 						'[COLOR:240:240:140:255]관체[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_ADEJE_TEXT', 							'관체족은 북아프리카 해안에서 서쪽으로 약 100킬로미터(60마일) 떨어진 대서양의 카나리아 제도에 거주하던 원주민이었습니다. 이들은 17세기에 멸종한 구안체어를 사용했는데, 이 언어는 베르베르어와 관련이 있는 것으로 추정됩니다. 기원전 천년경에 이 군도에 도착했을 것으로 추정됩니다.[NEWLINE][NEWLINE]관체족은 유럽인이 도착하기 전에 마카로네시안 군도 지역에 살았던 것으로 알려진 유일한 원주민으로, 다른 마카로네시안 군도(카보베르데 제도, 마데이라 제도, 아조레스 제도)에 사람이 살았다는 증거가 없기 때문이죠. 15세기 초 스페인의 카나리아 정복 이후 많은 원주민이 스페인 정복자들에 의해 전멸하고 나머지는 시간이 지나면서 정착민 인구와 문화에 동화되었지만, 실보(라 고메라 섬의 휘파람 언어)와 카나리아 스페인어의 일부 어휘와 같은 원래 문화의 요소가 카나리아 관습과 전통 안에 남아 있습니다.[NEWLINE][NEWLINE]일부 학자들은 관체족과 문화에 대한 파괴를 식민지 대량 학살의 초기 사례로 분류하기도 합니다. 2017년, 관체족의 게놈 전체 데이터를 최초로 분석한 결과, 관체족이 북아프리카에서 유래했으며 인근 북아프리카 본토의 고대 북아프리카 베르베르족과 유전적으로 가장 유사하다는 사실이 확인되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_WOOTEI_NIICIE', 				'우테이 니시' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_WOOTEI_NIICIE_ADJ', 				'[COLOR:240:240:140:255]아라파호[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_WOOTEI_NIICIE_TEXT', 					'약 3,000년 전, 아라파호족의 조상인 히테이노노''에이노''족은 현재 캐나다 매니토바와 미국 미네소타로 분류되는 레드 리버 계곡을 따라 서부 오대호 지역에 살았습니다. 그곳에서 아라파호 족은 옥수수를 비롯한 농작물을 재배하는 농경 민족이었습니다.[NEWLINE][NEWLINE]캐나다 동부의 유럽 식민지화 이후, 초기 샤이엔족인 히테시노족과 함께 아라파호족은 오지브웨족에 의해 동부 대평원으로 서쪽으로 이주해야만 했습니다. 그들은 프랑스 무역 동맹국으로부터 총을 얻어 수많은 무기를 보유하게 되었죠. 아라파호 족의 조상들은 1700년 이전에 오대호 서부 대평원 지역으로 들어왔습니다. 평원에서의 초기 역사 동안 아라파호 족은 캐나다 서스캐처원 강 남쪽에서 몬태나, 와이오밍, 사우스다코타 서부에 이르는 북부 평원에서 살았습니다.[NEWLINE][NEWLINE]아라파호 부족이 말을 얻기 전에는 가축인 개를 마차를 끄는 짐승으로 사용했습니다. 아라파호 부족은 1700년대 초에 다른 부족으로부터 말을 얻게 되면서 삶의 방식이 바뀌었습니다. 아라파호 부족은 말을 무리와 기마 동물로 사용하는 유목민이 되었습니다. 말을 타고 더 많은 짐을 운반하고 더 쉽게 이동할 수 있었기 때문에 평원에서 더 쉽고 광범위하게 사냥을 할 수 있었고, 사냥 성공률도 높아졌습니다. 점차 아라파호 부족은 남쪽으로 이동하여 긴밀히 연합한 북부 아라파호와 남부 아라파호로 나뉘어 몬태나 남부, 와이오밍 대부분, 네브라스카 팬핸들, 콜로라도 중부와 동부, 오클라호마 서부, 캔자스 극서부 지역에 걸쳐 넓은 공동 영토를 형성했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DAKKAR', 						'다카르' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DAKKAR_ADJ', 						'아달의' UNION ALL
SELECT 'TXT_KEY_CIV5_DAKKAR_TEXT', 							'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONIARA', 					'호니아라' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONIARA_ADJ', 					'솔로몬의' UNION ALL
SELECT 'TXT_KEY_CIV5_HONIARA_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KARASJOHKA', 					'카라쇼카' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KARASJOHKA_ADJ', 					'사미의' UNION ALL
SELECT 'TXT_KEY_CIV5_KARASJOHKA_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KATENDE', 					'카텐데' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KATENDE_ADJ', 					'루바의' UNION ALL
SELECT 'TXT_KEY_CIV5_KATENDE_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LAHORE', 						'라호르' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LAHORE_ADJ', 						'[COLOR:240:240:140:255]펀자브[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_LAHORE_TEXT', 							'라호르는 오늘날 주요 세계 도시이자 히말라야 남쪽의 건조한 지역이자 인도와 파키스탄에 걸쳐 있는 펀자브 지역의 상업 및 문화 중심지입니다. 라호르는 무굴 제국, 단명한 시크 제국, 그리고 영국령 인도 제국에서 중요한 역할을 했으며, 현재 파키스탄에서 두 번째로 큰 도시입니다. 아시아 전역의 내륙 무역로 교차로로서의 중요성 외에도, 라호르는 파키스탄을 비롯한 여러 지역의 중요한 문화 수도로 남아 있습니다.[NEWLINE][NEWLINE]라호르에 사람들이 처음 정착한 것은 아마도 서기 1천 년기였을 것이지만, 라호르의 진정한 전성기는 이슬람으로 개종하고 정착하여 문화를 받아들이고 16세기부터 19세기까지 남아시아를 지배했던 몽골 부족의 잔존 세력인 무굴 제국 시대였습니다. 무굴 제국의 통치자들은 라호르에 호화로운 건축물을 건설했는데, 그중에는 도시 밖으로 이어지는 도로의 거대한 문과 성인의 무덤, 왕실 모스크 등 성지가 있습니다. 18세기에 이르러 라호르의 부는 세계적으로 유명해졌습니다. 밀턴의 실낙원에서 라호르는 부와 권력의 도시, "위대한 무굴 제국의 왕좌"로 언급되기도 하며, 밀턴의 아담에게는 지구의 경이로움으로 비춰졌습니다. 다른 영국 작가들도 라호르에 매료되었습니다. 식민지 시대 영국 작가 러디어드 키플링은 라호르를 "한낮의 더위가 사람들의 목소리를 침묵시키고 모스크의 비둘기들을 잠에 들게 할 때에도 아름다움으로 가득하다"라고 묘사했으며, 어린 시절 라호르의 거대한 아르메니아산 "잠잠메" 대포를 보고 황홀해했습니다. 나가자르가무(혹은 가자르가모)는 오늘날 나이지리아 북동부에 위치한 지역에서 500년 동안 존속하며 차드 호 주변 지역을 지배했던 카넴-보르누 제국의 수도였습니다. 이 이슬람 왕국은 아프리카 북부의 무역망을 통해 부를 축적했으며, 우리가 아는 대부분의 정보는 아랍 작가들의 기록을 통해 전해졌습니다. 전성기에는 인구가 약 2만 명이었습니다.[NEWLINE][NEWLINE]이드리스 알라우마 왕(재위 1564-1596)은 카넴보르누 왕국의 가장 유능한 통치자였을 것입니다. 그는 오스만 제국에서 훈련받은 머스킷티어 부대를 군대에 도입하는 등 일련의 군사 개혁에 착수했으며, 이미 막강했던 왕국 기병대에 용병 베르베르 낙타 기병대와 코토코 해병대를 배치했습니다. 그는 모로코, 이집트, 그리고 오스만 궁정(오스만 궁정은 그에게 대규모 사절단을 파견하여 경의를 표했습니다)과 무역 관계를 구축했습니다. 그의 연대기 작가들은 그가 1,000회가 넘는 전투와 300회가 넘는 전쟁에서 거둔 승리를 극찬했습니다. 알라우마는 또한 무역 단위 표준화와 이슬람 법리에 따른 법률 개혁 등 경제 개혁을 이룬 것으로 평가받습니다.[NEWLINE][NEWLINE]이 도시는 1809년 풀라니 지하드 기간 동안 포위되어 파괴되었습니다. 오늘날에도 도시의 폐허가 남아 있으며, 한때 강력했던 이 수도를 새롭고 현대적인 도시로 재건하려는 움직임이 일고 있습니다.[NEWLINE][NEWLINE]무굴 제국이 쇠퇴하면서 이 지역에 새로운 세력이 부상하여 펀자브를 놓고 다투었습니다. 라호르를 가장 먼저 점령한 것은 마라타의 힌두 군대였는데, 이들은 1758년 무굴 제국으로부터 라호르를 탈환했습니다. 그러나 마라타는 무굴 제국만큼 오래 지속되지 못했고, 라호르는 다시 주인이 바뀌어 시크교와 아프가니스탄 세력에 함락되었습니다. 1799년, 라호르는 란지트 싱의 통치 아래 시크 제국의 수도가 되었습니다. "펀자브의 사자" 싱은 새로운 제국을 위한 새로운 군대를 건설하고자 했고, 이를 위해 국내외 세력에 손을 내밀어 나폴레옹 군대에서 병사들을 데려와 그의 군대를 훈련시키고, 니항의 사제들을 자신의 군대에 포함시켰습니다. 그러나 시크 제국은 싱 없이는 지속될 수 없었고, 싱의 사망 후 이 지역은 완전히 영국 제국에 합병되었습니다.[NEWLINE][NEWLINE]영국 통치 하의 라호르는 식민 관리들이 무굴 제국의 영토였던 지역을 버리고 새로운 지역을 건설하면서 완전히 새로운 도시가 개발되는 모습을 보였습니다. 영국에게 펀자브는 몇 가지 문제를 안겨주었습니다. 쟁투성이인 국경에 인접해 있었고, 영국군이 주둔했던 항구들과도 멀리 떨어져 있었기 때문입니다. 실제로 라호르는 1929년 판디트 네루가 영국으로부터 "완전한 독립"을 선언하고 인도 삼색기를 게양한 장소로서 인도 독립 운동의 중요한 중심지가 되었습니다.[NEWLINE][NEWLINE]하지만 독립 후, 유혈 사태가 벌어졌습니다. 스스로를 무슬림 국가라고 선언한 파키스탄이 인도에서 분리되면서 폭동이 일어났습니다. 힌두교도와 무슬림은 광란의 대량 폭력 속에서 서로를 죽였습니다. 라호르도 예외는 아니었으며, 힌두교도들이 대거 학살당하는 광경을 목격했습니다. 라호르에 거주하는 힌두교도 인디라 쿠마르는 어린 시절 폭력을 피해 산으로 피난을 가면서 "자유의 대가는 무엇이며, 어떤 목적을 위한 것인가?"라고 생각했습니다.[NEWLINE][NEWLINE]분단의 종식은 폭력의 종식을 의미하지 않았습니다. 라호르는 1965년 인도와 파키스탄이 다시 충돌하면서 또 다른 폭력 사태로 피해를 입었습니다. 오늘날 라호르는 여전히 건재합니다. 파키스탄령 펀자브의 수도이자 1천만 명이 넘는 주민이 거주하고 있습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OUIDAH', 						'위다' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OUIDAH_ADJ', 						'위다의' UNION ALL
SELECT 'TXT_KEY_CIV5_OUIDAH_TEXT', 							'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PELYM', 						'펠림' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PELYM_ADJ', 						'페름의' UNION ALL
SELECT 'TXT_KEY_CIV5_PELYM_TEXT', 							'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_POKROVKA', 					'다에르가에프스' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_POKROVKA_ADJ', 					'마사게타이의' UNION ALL
SELECT 'TXT_KEY_CIV5_POKROVKA_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SARNATH', 					'사르나트' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SARNATH_ADJ', 					'마우리아의' UNION ALL
SELECT 'TXT_KEY_CIV5_SARNATH_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SUCEAVA', 					'수체아바' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SUCEAVA_ADJ', 					'몰도바의' UNION ALL
SELECT 'TXT_KEY_CIV5_SUCEAVA_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TBILISI', 					'트빌리시' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TBILISI_ADJ', 					'조지아의' UNION ALL
SELECT 'TXT_KEY_CIV5_TBILISI_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANAA', 						'사나' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANAA_ADJ', 						'예멘의' UNION ALL
SELECT 'TXT_KEY_CIV5_SANAA_TEXT', 							'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_JUYUBIT', 					'주유비트' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_JUYUBIT_ADJ', 					'통바의' UNION ALL
SELECT 'TXT_KEY_CIV5_JUYUBIT_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANANGULA', 					'아난굴라' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANANGULA_ADJ', 					'알류트의' UNION ALL
SELECT 'TXT_KEY_CIV5_ANANGULA_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LONGYAN', 					'룽옌' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LONGYAN_ADJ', 					'하카의' UNION ALL
SELECT 'TXT_KEY_CIV5_LONGYAN_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AYUTTHAYA', 					'아유타야' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AYUTTHAYA_ADJ', 					'[COLOR:240:240:140:255]아유타야[ENDCOLOR]의' UNION ALL
SELECT 'TXT_KEY_CIV5_AYUTTHAYA_TEXT', 						'14세기에 크메르 제국이 쇠퇴하면서, 그 지배권을 장악했던 지역들이 스스로를 드러내기 시작했습니다. 오늘날 태국의 짜오프라야 계곡에는 태국어와 라오어를 사용하는 사람들이 거주하는 "므앙"이라는 일련의 상좌부 불교 도시 국가들이 크메르족으로부터 분리되어, 종교, 왕실 전통, 그리고 크메르족의 여러 문화적, 법적 특징을 유지하면서도 독자적인 언어적, 문화적 독립성을 주장했습니다. 므앙은 "만달라 국가", 즉 명확한 국경은 없지만 아름다움, 예술적 성취, 그리고 국제적인 관점을 강조하는 도시를 중심으로 한 왕국이었습니다. 당시 국가들은 오늘날 지도에서 볼 수 있는 경계가 있는 퍼즐 조각(또는 현재 게임 속 경계가 있는 문명)이 아니라, 주변 풍경에서 사람과 권력을 끌어들이는 자석과 같았습니다. 권력과 이익은 특정 상품, 특히 도자기나 향에 대한 왕실의 독점을 통해 이루어졌습니다(비엔티안이라는 이름은 라오스어의 "므앙"에서 유래했으며 "백단향의 도시"를 의미합니다).[NEWLINE][NEWLINE]무앙족이 크메르족에게서 벗어나자 서로 전쟁을 벌였습니다. 그리고 14세기와 15세기에 걸쳐 한 세력이 주도권을 잡았습니다. 힌두 서사시 라마야나(태국어로 라마끼엔)에 나오는 도시의 이름을 딴 아유타야는 처음에는 차오프라야 강 평원의 중심지가 되었고, 나중에는 동남아시아 본토의 중요한 세력이 되었는데, 유럽 여행자들은 이를 인도와 중국에 비유했습니다. 아유타야는 성장하는 과정에서 주변국, 특히 1500년대에 아유타야를 정복했지만 야심 찬 전사 왕 나레수안에게 격퇴당한 버마와 외교적, 군사적으로 어려움을 겪었습니다. 아유타야는 침략자일 수도 있었습니다. 아유타야가 절정에 달했을 당시 캄보디아, 말레이시아 일부 지역, 라오스는 아유타야 왕의 지배를 받았습니다.[NEWLINE][NEWLINE]이 도시는 1600년대에 번영했고, 일부 여행객은 이 왕국을 우리에게 더 친숙한 이름인 시암(Siam, 크메르어 또는 중국어에서 유래했을 가능성이 있음)으로 불렀습니다. 아유타야의 왕들은 세상에 호기심이 많고 열린 마음을 가지고 있었으며, 일본, 아랍, 유럽의 고문들을 고용하여 까다로운 국제 외교 문제를 해결하도록 도왔습니다. 짜오프라야 강 한가운데 있는 섬에 위치한 이 도시는 당시로서는 규모가 컸고, 약 25만 명의 주민이 거주했습니다. 또한 국제적인 다국어 사용 문화를 가지고 있었습니다. 일본, 중국, 유럽인 공동체가 형성되어 지역 주민들과 어울려 살았습니다. 성 역할 또한 동아시아, 남아시아, 유럽에 비해 상대적으로 진보적이었습니다. 한 중국인 여행객은 "[시암의] 관습은 모든 일을 아내가 처리한다"라고 말했고, 알렉산더 해밀턴은 "[시암의] 여성들은 물건을 사는 유일한 상인이다"라고 기록했습니다.[NEWLINE][NEWLINE]아유타야는 쇠퇴하지 않았습니다. 오히려 무너졌습니다. 정확히 말하면, 버마 군대에 또다시 무너졌습니다. 1767년, 버마는 아유타야를 약탈하고 파괴했습니다. 사원의 금과 수많은 숙련된 장인들을 약탈하고 도시의 대부분을 불태웠습니다. 몇 년 후, 시암은 남쪽으로 더 떨어진 크룽텝(일부는 크룽텝)이라는 도시에서 개혁을 단행했습니다. 외국인들에게는 방콕으로 알려진 도시입니다. 오늘날 시암, 즉 태국은 이 지역에서 유럽 열강의 정식 식민지 지배를 받지 않은 유일한 나라로 남아 있습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PALMYRA', 					'팔미라' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PALMYRA_ADJ', 					'팔미라의' UNION ALL
SELECT 'TXT_KEY_CIV5_PALMYRA_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AL_TIRABIN', 					'알-티라빈' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AL_TIRABIN_ADJ', 					'베두인의' UNION ALL
SELECT 'TXT_KEY_CIV5_AL_TIRABIN_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HANUABADA', 					'하누아바다' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HANUABADA_ADJ', 					'모투의' UNION ALL
SELECT 'TXT_KEY_CIV5_HANUABADA_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BALKH', 						'박트라' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BALKH_ADJ', 						'박트리아의' UNION ALL
SELECT 'TXT_KEY_CIV5_BALKH_TEXT', 							'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_IRUNEA', 						'도노스티아' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_IRUNEA_ADJ', 						'이루냐의' UNION ALL
SELECT 'TXT_KEY_CIV5_IRUNEA_TEXT', 							'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SADDARVAZEH', 				'사다르바제' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SADDARVAZEH_ADJ', 				'아케메네스의' UNION ALL
SELECT 'TXT_KEY_CIV5_SADDARVAZEH_TEXT', 					'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_JETARKTE', 					'제타르크테' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_JETARKTE_ADJ', 					'카웨스카르의' UNION ALL
SELECT 'TXT_KEY_CIV5_JETARKTE_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MBABANE', 					'음바바네' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MBABANE_ADJ', 					'에스와티니의' UNION ALL
SELECT 'TXT_KEY_CIV5_MBABANE_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TUNIS', 						'튀니스' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TUNIS_ADJ', 						'튀니지의' UNION ALL
SELECT 'TXT_KEY_CIV5_TUNIS_TEXT', 							'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MENDYARRUP', 					'멘디야럽' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MENDYARRUP_ADJ', 					'눙가르의' UNION ALL
SELECT 'TXT_KEY_CIV5_MENDYARRUP_TEXT', 						'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ISHIYAMA', 					'이시야마' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ISHIYAMA_ADJ', 					'잇코잇키의' UNION ALL
SELECT 'TXT_KEY_CIV5_ISHIYAMA_TEXT', 						'내용을 입력해주세요';

INSERT INTO Language_ko_KR (Tag, Text)
-- abilities
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ADEJE', 				'[COLOR_MAGENTA]베네스머:[ENDCOLOR] [COLOR_CITY_BLUE]평원[ENDCOLOR] 또는 [COLOR_CITY_BLUE]초원[ENDCOLOR] 언덕에 [ICON_RES_DOGO_CANARIO] [COLOR_GREY]도고 카나리오[ENDCOLOR] 자원 배치 가능 (인접 불가, [ICON_FOOD], [ICON_PRODUCTION], [ICON_GOLD], [ICON_CULTURE], [ICON_PEACE] 제공)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ALMATY', 				'[COLOR_MAGENTA]알마투:[ENDCOLOR] [ICON_TRADE] 도시 연결 및 국제 [ICON_CARAVAN] 육상 교역로에서 [ICON_RESEARCH] 과학 +1. 두려움 상태인 [ICON_CITY_STATE] 도시 국가에서 매 턴 [ICON_INFLUENCE] 영향력 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AL_TIRABIN', 			'[COLOR_MAGENTA]아사이르:[ENDCOLOR] 시대 2개마다 [ICON_INTERNATIONAL_TRADE] 교역로 +1. [COLOR_CITY_BLUE]사막[ENDCOLOR]에 도시와 인접하지 않은 [COLOR_CITY_BROWN]부류트 하자르[ENDCOLOR] 시설 건설 가능 (인접 불가, [ICON_FOOD], [ICON_PRODUCTION], [ICON_GOLD], [ICON_CULTURE] 제공).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AMBRACIA', 			'[COLOR_MAGENTA]피로스 전쟁:[ENDCOLOR] [ICON_WAR] 군사적 [ICON_CITY_STATE] 도시 국가의 선물 속도 +10%. [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]피로스의 용병[ENDCOLOR] 승급을 얻음 ([COLOR:255:230:85:255]지상에 주둔 시[ENDCOLOR] [ICON_PRODUCTION]+5%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANANGULA', 			'[COLOR_MAGENTA]숨겨진 이야기:[ENDCOLOR] 국제 [ICON_CARGO_SHIP] 해상 교역로 최대 거리 +10%. 국제 [ICON_CARGO_SHIP] 해상 교역로에서 [ICON_GOLD] 골드 +1, [ICON_CULTURE] 문화 +1. 유닛 사망 시 시대에 비례하여 각 도시에 [ICON_CULTURE] 문화 1 제공.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 			'[COLOR_MAGENTA]피레네 파레아쥬:[ENDCOLOR]작업 가능한 영역의 모든 [COLOR_CITY_BLUE]산[ENDCOLOR] 타일이 [ICON_TOURISM] 관광 +1. [COLOR_CITY_BLUE]산[ENDCOLOR] 근처 도시의 [ICON_HAPPINESS_3] 무료 -10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANTANANARIVO', 		'[COLOR_MAGENTA]리베르탈리아:[ENDCOLOR] 모든 야만인 주둔지를 볼 수 있음. 유닛에게 [COLOR_WATER_TEXT]해적의 천국[ENDCOLOR] 승급 부여. ([COLOR:255:230:85:255]처치[ENDCOLOR] 시 [ICON_GOLD] 골드 획득)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 			'[COLOR_MAGENTA]경제적 영향력:[ENDCOLOR] 상인이 [ICON_GOLD] 골드 +1. [ICON_GOLD] 구매 비용 -10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ARMAGH', 				'[COLOR_MAGENTA]성인들의 후원자:[ENDCOLOR] [ICON_PEACE] 신앙으로 [COLOR_YIELD_FOOD]아일랜드 성인[ENDCOLOR]을 (건물로) 구매 가능 (과반 종교 필요). 성인들은 [ICON_HAPPINESS_1] 행복 관리를 돕고 약간의 산출량을 제공합니다. 도시마다 네 명의 성인 중 한 명만 선택할 수 있습니다.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AUCKLAND', 			'[COLOR_MAGENTA]돛의 도시:[ENDCOLOR] 해안 도시의 식량 +3. [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]비폭력 저항[ENDCOLOR] 승급을 얻음. (유닛이 지상에 주둔 시 [ICON_FOOD], [ICON_GOLDEN_AGE]을 생산)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AYUTTHAYA', 			'[COLOR_MAGENTA]므앙:[ENDCOLOR] 플레이어에게 전쟁 선포 시 [ICON_GREAT_GENERAL] 위대한 장군 점수 50 획득. 플레이어가 전쟁 선포 시 모든 도시에서 시대에 비례하여 [ICON_PRODUCTION] 생산 10 획득. 건물 건설 시 가치의 5%만큼 [ICON_CULTURE] 문화 획득.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BAGAN', 				'[COLOR_MAGENTA]천 개의 탑이 있는 땅:[ENDCOLOR] [COLOR_YIELD_FOOD]사원[ENDCOLOR]의 [ICON_HAPPINESS_1] 행복 +1. 건물 건설 시 [ICON_PEACE] 신앙 10.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BALKH', 				'[COLOR_MAGENTA]정복되지 않은 자:[ENDCOLOR] [COLOR_POSITIVE_TEXT]담수[ENDCOLOR]에 인접하고 도시와 인접하지 않은 곳에 [COLOR_CITY_BROWN]프루리온[ENDCOLOR] 시설 건설 가능 (인접 불가, [ICON_FOOD], [ICON_PRODUCTION], [ICON_GOLD], [ICON_GOLDEN_AGE], [ICON_GREAT_GENERAL] 제공).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BEDULU', 				'[COLOR_MAGENTA]신들의 섬:[ENDCOLOR] [COLOR_GREY][COLOR_CITY_GREEN]정글[ENDCOLOR] 타일에서 작업 중인 시민 2명마다 도시에서 [ICON_PEACE] 신앙 +1. [ICON_CITY_STATE] 도시 국가 동맹마다 모든 도시에서 [ICON_PEACE] 신앙 +1, [ICON_GOLDEN_AGE] 황금기 점수 +1. [ICON_CARGO_SHIP] 국제 해양 교역로의 [ICON_PEACE] 신앙 +2[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BELGRADE', 			'[COLOR_MAGENTA]발칸의 화약고:[ENDCOLOR] [COLOR_YIELD_GOLD]공성 유닛[ENDCOLOR] 생산 시 [ICON_PRODUCTION] 도시 생산이 10% 증가합니다. [COLOR_YIELD_GOLD]공성 유닛이[ENDCOLOR] [COLOR_WATER_TEXT]하얀 요새[ENDCOLOR] 승급을 얻음. ([ICON_PLUS] 체력 +25)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BOGOTA', 				'[COLOR_MAGENTA]독립 연합:[ENDCOLOR] 도시 점령 시 시대에 비례하여 문화 30 획득. 도시 해방 시 시대 및 소유한 도시 수에 따라 문화 20-30 획득 (최대 6 도시)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BRATISLAVA', 			'[COLOR_MAGENTA]슬라브 문화의 심장:[ENDCOLOR] [COLOR_YIELD_FOOD]길드[ENDCOLOR] [ICON_CULTURE] 문화 +2, [ICON_TOURISM] 관광 +1. [ICON_CITY_STATE] 도시 국가와 동맹을 맺으면 몇 턴마다 무작위 [ICON_GREAT_PEOPLE] [COLOR_CITY_GOLD]위인[ENDCOLOR] 획득[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BRUSSELS', 			'[COLOR_MAGENTA]습지의 고향:[ENDCOLOR] [COLOR_CITY_GREEN]습지[ENDCOLOR]의 [ICON_GOLD] 골드 +1, [ICON_CULTURE] 문화 +1. 해안 타일에 [COLOR_CITY_GREEN]습지[ENDCOLOR] ([ICON_FOOD]) 건설 가능. [COLOR_YIELD_GOLD]지상 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]워터링그[ENDCOLOR] 승급 획득 ([COLOR:255:230:85:255]강 건널 시[ENDCOLOR] [ICON_MOVES]이동력 보너스. [COLOR:255:230:85:255]습지에서[ENDCOLOR] [ICON_MOVES]이동력 두 배)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUCHAREST', 			'[COLOR_MAGENTA]옛 왕궁:[ENDCOLOR] [ICON_GREAT_WORK] 걸작에서 오는 [ICON_CULTURE] 문화 +1. 역사적 사건의 [ICON_TOURISM] 관광 +25%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUDAPEST', 			'[COLOR_MAGENTA]다뉴브의 진주:[ENDCOLOR] [ICON_RES_HORSE] [COLOR_GREY]말[ENDCOLOR]의 [ICON_GOLDEN_AGE] 황금기 점수 +1. [ICON_RES_HORSE] [COLOR_GREY]말[ENDCOLOR] +5 제공. (교역할 수 있고 독점에 계산됨)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUENOS_AIRES', 		'[COLOR_MAGENTA]민중의 소리:[ENDCOLOR] 소유한 고유 [COLOR_GREY]사치 자원[ENDCOLOR]마다 [ICON_HAPPINESS_1] 행복 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BYBLOS', 				'[COLOR_MAGENTA]레바논 삼나무:[ENDCOLOR] [COLOR_CITY_BROWN]어선[ENDCOLOR]의 [ICON_FOOD] 식량 +1. [ICON_WONDER] 세계 불가사의 또는 모든 해군 유닛 생산 시  [ICON_PRODUCTION] 생산 +5%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CAHOKIA', 			'[COLOR_MAGENTA]수도사의 둔덕:[ENDCOLOR] [COLOR_CITY_BROWN]둔덕[ENDCOLOR] 시설 건설 가능 (인접 불가, [ICON_GOLD], [ICON_RESEARCH], [ICON_PEACE], [ICON_GOLDEN_AGE], [ICON_GREAT_GENERAL], [ICON_STRENGTH] 제공)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 			'[COLOR_MAGENTA]경건한 마음의 불꽃:[ENDCOLOR] [COLOR_YIELD_GOLD]공무원[ENDCOLOR]의 [ICON_PEACE] 신앙 +1. 도시에 [COLOR_YIELD_FOOD]사원[ENDCOLOR]이 있다면 [ICON_DIPLOMAT] 위대한 외교관 점수 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 			'[COLOR_MAGENTA]희망의 봉우리:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 최대 교역로 범위 +10%. [ICON_INTERNATIONAL_TRADE] 교역 완료 시 [ICON_GOLD] 골드 20-40 획득 (도착 도시의 [ICON_CITIZEN] 인구수에 비례하고, 활성화된 [ICON_INTERNATIONAL_TRADE] 교역로 수에 반비례하여 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 				'[COLOR_MAGENTA]아멜루타크:[ENDCOLOR] 작업 중인 [COLOR_CITY_BLUE]툰드라[ENDCOLOR] 타일 3개 또는 작업 가능한 [COLOR_CITY_BLUE]설원[ENDCOLOR] 타일 3개마다 [ICON_FOOD] 식량 +1. 도시의 [ICON_CULTURE_LOCAL] 국경 확장 속도 +10%. 도시의 [ICON_HAPPINESS_3] 낙후로 인한 불행 -1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CLERMONT', 			'[COLOR_MAGENTA]십자군:[ENDCOLOR] 새로 생산된 [COLOR_YIELD_GOLD]근접[ENDCOLOR] 및 [COLOR_YIELD_GOLD] 화약 유닛[ENDCOLOR]이 첫 전투 후 무작위 승급을 얻음 (6종류). [COLOR_YIELD_GOLD]군사 유닛이[ENDCOLOR] [COLOR_WATER_TEXT]성전사의 열의[ENDCOLOR] 승급을 얻음([COLOR:255:230:85:255]전투 시[ENDCOLOR] 경험치 +15%)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_COLOMBO', 			'[COLOR_MAGENTA]계피의 고장:[ENDCOLOR] [COLOR_CITY_GREEN]숲[ENDCOLOR], [COLOR_CITY_GREEN]정글[ENDCOLOR]의 [ICON_GOLD] 골드 +1. [COLOR_CYAN]콜롬보[ENDCOLOR]와 동맹인 플레이어의 도시에서 시작된 [ICON_INTERNATIONAL_TRADE] 교역로가 완료될 때마다 모든 유닛의 체력 10 회복[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DAKKAR', 				'[COLOR_MAGENTA]아비시니아 정복:[ENDCOLOR] [ICON_CITY_STATE] 도시 국가에 유닛 선물 시 [ICON_INFLUENCE] 영향력 20 추가 획득. [ICON_CITY_STATE] 도시 국가에 [COLOR_YIELD_GOLD]선물한 유닛[ENDCOLOR]은 [COLOR_WATER_TEXT]푸투 알-하바쉬[ENDCOLOR] 승급 획득 ([ICON_STRENGTH] 전투력 및/또는 [ICON_RANGE_STRENGTH] 원거리 전투력 +5).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DALI', 				'[COLOR_MAGENTA]차마고도:[ENDCOLOR] [ICON_PEACE] 신앙으로 [ICON_CARAVAN] [COLOR_YIELD_GOLD]대상[ENDCOLOR] 구매 가능. 모든 [ICON_INTERNATIONAL_TRADE] 교역로에서 [ICON_PEACE] 종교 압력 +10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DANO', 				'[COLOR_MAGENTA]텐달룬:[ENDCOLOR] [COLOR_YIELD_FOOD]성소[ENDCOLOR]의 [ICON_CULTURE_LOCAL] 국경 확장 점수 +2. 모든 도시의 [ICON_CULTURE] 국경 확장 비용 -10%. 국경이 확장될 때 시대에 비례하여 [ICON_PEACE] 신앙 3 획득[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DJIBOUTI', 			'[COLOR_MAGENTA]원향:[ENDCOLOR] [COLOR_YIELD_FOOD]곡창[ENDCOLOR]의 [ICON_CULTURE] 문화 +1. 도시에서 [COLOR_YIELD_GOLD]개척자[ENDCOLOR] 생산 시  [ICON_PRODUCTION] 생산 +80%,  [COLOR_YIELD_FOOD]곡창[ENDCOLOR] 생산 시 생산 +100%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 				'[COLOR_MAGENTA]평화의 보금자리:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 국제 교역로가 출발 도시와 목표 도시 모두에 [ICON_GOLD] 골드 +1. 국제 해양 교역로의 [ICON_TOURISM] 관광 +1. [COLOR_YIELD_GOLD]민간 해양 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]광야 항해[ENDCOLOR] 승급을 얻음. ([ICON_MOVES] 이동력 +2)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DOUALA', 				'[COLOR_MAGENTA]작은 대륙:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 교역로 +1. [COLOR_YIELD_GOLD]교역 유닛[ENDCOLOR] 생산 시 생산 +10%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_FAYA', 				'[COLOR_MAGENTA]격동의 독립:[ENDCOLOR] [COLOR_YIELD_GOLD]군사 유닛[ENDCOLOR]은 [COLOR_WATER_TEXT]전쟁의 수확[ENDCOLOR] 승급을 얻음. ([COLOR:255:230:85:255]유닛[ENDCOLOR] 처치 시 [ICON_RESEARCH] 과학 획득)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_FLORENCE', 			'[COLOR_MAGENTA]르네상스의 요람:[ENDCOLOR] [COLOR_CITY_BROWN]채석장[ENDCOLOR]의 [ICON_CULTURE] 문화 +1. 예술가의 [ICON_GOLDEN_AGE] 황금기 점수 +1. 매 턴 수도에 1%의 확률로 [ICON_GREAT_ARTIST] 위대한 예술가 또는 [ICON_GREAT_ENGINEER] 위대한 기술자 출현.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 				'[COLOR_MAGENTA]에스칼라드:[ENDCOLOR] 도시의 [ICON_GREAT_PEOPLE] 위인 포인트 +3%. [COLOR_YIELD_GOLD]위인[ENDCOLOR] 탄생 시 시대에 비례하여 [ICON_PEACE]신앙 25 획득[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GENOA', 				'[COLOR_MAGENTA]라 수페르바:[ENDCOLOR] [ICON_GREAT_PEOPLE] [COLOR_YIELD_GOLD]위인[ENDCOLOR] 탄생 시 시대에 비례하여 [ICON_GOLD] 골드 40,  [ICON_GOLDEN_AGE] 황금기 점수 10 획득.[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GRANADA', 			'[COLOR_MAGENTA]알카사르:[ENDCOLOR] [COLOR_CITY_BROWN]요새[ENDCOLOR], [COLOR_CITY_BROWN]성채[ENDCOLOR], [COLOR_CITY_BROWN]부교[ENDCOLOR]의 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +1. [ICON_WAR] 전쟁 점수 +20%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GWYNEDD', 			'[COLOR_MAGENTA]허우엘 법:[ENDCOLOR] [ICON_HAPPINESS_1] 국왕 경축일 동안 [ICON_CULTURE] 문화 +10%. [ICON_HAPPINESS_1] 국왕 경축일 길이 +33%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HANOI', 				'[COLOR_MAGENTA]구품제:[ENDCOLOR] 공무원의 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +1, [ICON_GREAT_ADMIRAL] 위대한 제독 포인트 +1. 군사 유닛이 [COLOR_WATER_TEXT]애국주의[ENDCOLOR] 승급을 얻음 ([COLOR:255:230:85:255]아군 영토 내에서[ENDCOLOR] [ICON_STRENGTH] 전투력 +10%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HANUABADA', 			'[COLOR_MAGENTA]히리 무역 주기:[ENDCOLOR] 도시에서 [COLOR_YIELD_GOLD]화물선[ENDCOLOR] 생산 시 [ICON_PRODUCTION] 생산 +15%. 해상 [ICON_CARGO_SHIP] 교역로 완료 시 도착 도시의 [ICON_CITIZEN] 인구수에 비례하고 활성화된 [ICON_INTERNATIONAL_TRADE] 교역로 수에 반비례하여 [ICON_GOLDEN_AGE] 황금기 점수 10-50 획득. 지상 유닛은 [COLOR_WATER_TEXT]파푸아 해상 전투력[ENDCOLOR] 승급 획득 ([COLOR:255:230:85:255]승선 시[ENDCOLOR] [ICON_VP_VISION] 시야 +2 및 [ICON_STRENGTH]방어력 +50%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HONDURAS', 			'[COLOR_MAGENTA]바나나 공화국:[ENDCOLOR] [ICON_CITY_STATE] 도시 국가가 제공하는 자원이 글로벌 독점에 계산됨 ([COLOR_CYAN]외환 시장[ENDCOLOR] 정책과 중복되지 않음).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 			'[COLOR_MAGENTA]국가 번영:[ENDCOLOR] [ICON_FOOD] 도시 성장률 +5%, [ICON_CITIZEN] 시민 6명마다 [ICON_GOLD] 골드 +1. 매 턴 플레이어 도시의 [ICON_CITIZEN] 시민 1명이 [COLOR_CYAN]홍콩[ENDCOLOR]으로 이주하여 [ICON_INFLUENCE] 영향력 30을 얻고, 시대와 [COLOR_CYAN]홍콩[COLOR:105:105:105:255]에 대한 [ICON_INFLUENCE] 영향력 단계에 따라 [ICON_GOLD] 골드를 100-150 얻을 확률이 있음.[ENDCOLOR][NEWLINE]' UNION ALL /* Chance of migration starts from 0%, if the City has equal [ICON_CITIZEN] Citizens to [COLOR_CYAN]Hong Kong[ENDCOLOR], and grows by 1% with each [ICON_CITIZEN] Citizen above that number.*/
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HONIARA', 			'[COLOR_MAGENTA]수아홍기 춤:[ENDCOLOR] [ICON_VP_GREATMUSIC] 위대한 음악 걸작에서 [ICON_FOOD] 식량 +2. 음악가가 [ICON_CULTURE_LOCAL] 국경 확장 점수 +1. [COLOR_GREY]보너스 자원[ENDCOLOR]으로 [ICON_CULTURE] 국경 확장 시 시대에 비례하여 육지에서 [ICON_FOOD] 식량 25, 바다에서 [ICON_FOOD] 식량 50 획득.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_IFE', 				'[COLOR_MAGENTA]오그보니:[ENDCOLOR] [COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR] 훈련 또는 생성 시 시대에 비례하여 신앙 30 획득 ([COLOR_YIELD_GOLD]위대한 외교관[ENDCOLOR]은 두 배). [COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]이와레파[ENDCOLOR] 승급을 얻음. ([ICON_MOVES]이동력 +1. [ICON_VIEW_CITY]시야 +1. [COLOR:255:230:85:255]외교 임무 후[ENDCOLOR] [ICON_INFLUENCE] 영향력 +10)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_IRUNEA', 				'[COLOR_MAGENTA]비스카이아:[ENDCOLOR] [COLOR_CITY_BROWN]어선[ENDCOLOR]의 [ICON_FOOD] 식량 +1, [ICON_GOLD] 골드 +1. 도시에서 [COLOR_YIELD_GOLD]작업선[ENDCOLOR] 생산 시 [ICON_PRODUCTION] 생산 +20%. 시대가 바뀔 때마다 가장 최근에 지은 해안 도시에 무료 [COLOR_YIELD_GOLD]작업선[ENDCOLOR] 제공. 새로운 해안 도시는 무료 [COLOR_YIELD_GOLD]작업선[ENDCOLOR]과 함께 시작.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ISHIYAMA', 			'[COLOR_MAGENTA]???:[ENDCOLOR] [NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ISKANWAYA', 			'[COLOR_MAGENTA]칼라와야 치유사:[ENDCOLOR] [COLOR_YIELD_FOOD]송수로[ENDCOLOR]의 [ICON_PEACE] 신앙 +1. 유닛이 [COLOR_WATER_TEXT]콜라 카파차유[ENDCOLOR] 승급을 얻음. ([COLOR:255:230:85:255]소유한 선교사, 성지, 산 근처에서[ENDCOLOR][COLOR:255:230:85:255]매 턴 회복[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_JERUSALEM', 			'[COLOR_MAGENTA]성지:[ENDCOLOR] [COLOR_CITY_BROWN]성지[ENDCOLOR]의 [ICON_PEACE] 신앙 +1. [COLOR_CYAN]예루살렘[ENDCOLOR]은 동맹의 과반 종교를 채택하고 영구적으로 종교 압력 +100%를 얻음 (정복되어도 유지). [COLOR_CYAN]예루살렘[ENDCOLOR]은 성도와 동일한 양의 종교 압력을 가짐. 세계 의회가 창설된 후 동맹이 변경되면 새로운 동맹은 [COLOR_CYAN]예루살렘[ENDCOLOR]에 대한 [COLOR_POSITIVE_TEXT]영향권[ENDCOLOR]을 얻음.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_JETARKTE', 			'[COLOR_MAGENTA]바다 유목민:[ENDCOLOR] 유닛이 해안 도시 간에 공수(문자 그대로 해상 수송) 가능.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_JUYUBIT', 			'[COLOR_MAGENTA]카누 형제단:[ENDCOLOR] [ICON_RES_FISH] [COLOR_GREY]물고기[ENDCOLOR]에서 [ICON_FOOD] 식량 +1. [COLOR_GREY]보너스 자원[ENDCOLOR]에서 [ICON_RESEARCH] 과학 +1. [COLOR_YIELD_GOLD]테아트[ENDCOLOR] 유닛 (고유 [COLOR_YIELD_GOLD]작업선[ENDCOLOR]) 훈련 가능.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 				'[COLOR_MAGENTA]지상 낙원:[ENDCOLOR] 작업 가능한 영역 안의 모든 [COLOR_CITY_BLUE]산[ENDCOLOR] 타일마다 도시에서 [ICON_CULTURE] +0.66 문화. [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]무자히딘[ENDCOLOR] 승급을 얻음. (산 근처에서 [ICON_STRENGTH]방어력 +25%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KARASJOHKA', 			'[COLOR_MAGENTA]사메비:[ENDCOLOR] [ICON_RES_DEER] [COLOR_GREY]사슴[ENDCOLOR]에서 [ICON_FOOD] 식량 +1, [ICON_PRODUCTION] 생산 +1. [COLOR_YIELD_GOLD]정찰 및 원거리 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]시다 훈련[ENDCOLOR] 승급 획득 ([ICON_STRENGTH] 공격력/[ICON_RANGE_STRENGTH] 원거리 공격력 +5%, 숲에서 추가 10%). [ICON_RES_DEER] [COLOR_GREY]사슴[ENDCOLOR]에 [COLOR_CITY_BROWN]야영지[ENDCOLOR] 건설 시, 인접한 [COLOR_CITY_BLUE]툰드라[ENDCOLOR] 또는 [COLOR_CITY_BLUE]설원[ENDCOLOR] 타일에 [ICON_RES_REINDEER] [COLOR_GREY]순록[ENDCOLOR]이 생성될 확률 80%, 추가로 하나 더 생성될 확률 10% (인접한 [COLOR_CITY_BLUE]설원[ENDCOLOR] 타일마다 확률 1% 증가).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KARYES', 				'[COLOR_MAGENTA]수도원 공화국:[ENDCOLOR] [COLOR_YIELD_GOLD]지상 민간 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]아토스 산 등반가[ENDCOLOR] 승급을 얻음. ([COLOR:255:230:85:255]산을 건널 수 있음[ENDCOLOR]). 언덕에 도시와 인접하지 않은 [COLOR_CITY_BROWN]수사원[ENDCOLOR] 시설 건설 가능 (인접 불가, [ICON_PRODUCTION], [ICON_GOLD], [ICON_CULTURE], [ICON_PEACE], [ICON_TOURISM] 제공). 작업 가능한 영역에 [COLOR_CITY_BROWN]수사원[ENDCOLOR]이 3개 이상 있다면 [ICON_DIPLOMAT] 위대한 외교관 점수 +1, [ICON_HAPPINESS_3] 종교 불안 -10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KATENDE', 			'[COLOR_MAGENTA]기억의 긴 발톱:[ENDCOLOR] [COLOR_YIELD_FOOD]서기 사무소[ENDCOLOR], [COLOR_YIELD_FOOD]인쇄소[ENDCOLOR], [COLOR_YIELD_FOOD]외무부[ENDCOLOR] 건설 시 도시에 [ICON_GREAT_ARTIST] 위대한 예술가 점수 +1, [ICON_GREAT_WRITER] 위대한 작가 점수 +1. [COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR]의 [ICON_INFLUENCE] 영향력 +15%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 			'[COLOR_MAGENTA]구르카 왕국:[ENDCOLOR]우호적인 [ICON_CITY_STATE] 도시 국가마다 [ICON_PEACE] 신앙 +1, 동맹 [ICON_CITY_STATE] 도시 국가마다 모든 도시의 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +1. [ICON_GOLD] 골드로 [COLOR_YIELD_GOLD]구르카[ENDCOLOR] 유닛 (고유 [COLOR_YIELD_GOLD]수발총병[ENDCOLOR]) 구매 가능.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 				'[COLOR_MAGENTA]오래된 이야기:[ENDCOLOR] [COLOR_YIELD_FOOD]빌리나[ENDCOLOR] 건설 가능 ([ICON_GREAT_MUSICIAN]). [ICON_GREAT_MUSICIAN] 위대한 음악가 출현률 +5%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 				'[COLOR_MAGENTA]진정한 마지막 르와부기리:[ENDCOLOR] 국경이 확장되면 [ICON_PRODUCTION] 생산 +1, [ICON_GOLD] 골드 +1. 적 처치 시 모든 도시의 [ICON_CULTURE_LOCAL] 국경 확장 점수 5. 제국의 [ICON_WAR] 전쟁 피로도 -10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 		'[COLOR_MAGENTA]진흙투성이 강:[ENDCOLOR] [COLOR_CITY_GREEN]강[ENDCOLOR] 타일의 [ICON_GOLD] 골드 +1. 건물 건설 시 [ICON_FOOD] 식량 +20. [ICON_CITIZEN] 시민 탄생 시 시대에 비례하여 [ICON_CULTURE] 문화 10 획득[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KYZYL', 				'[COLOR_MAGENTA]아시아의 중심:[ENDCOLOR] [COLOR_YIELD_FOOD]궁전[ENDCOLOR], [COLOR_YIELD_FOOD]기념비[ENDCOLOR]의 [ICON_RESEARCH] 과학 +1. 기술 연구 시 모든 도시에 [ICON_PRODUCTION] 생산 5-20 획득 (시대에 비례하고, 도시 수에 반비례하여 보정, 최대 8개 도시)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LACONIA', 			'[COLOR_MAGENTA]아고게:[ENDCOLOR] [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]스파르탄 규율[ENDCOLOR] 승급을 얻음 ([COLOR:255:230:85:255]아군 유닛에 인접 시[ENDCOLOR] [ICON_STRENGTH] 전투력 +15%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LAHORE', 				'[COLOR_MAGENTA]칼사:[ENDCOLOR] [ICON_PEACE] 신앙으로 [COLOR_YIELD_GOLD]니항[ENDCOLOR] 유닛 (고유 [COLOR_YIELD_GOLD]장검병[ENDCOLOR]) 구매 가능.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LA_VENTA', 			'[COLOR_MAGENTA]의례적 창조물:[ENDCOLOR] [ICON_GREAT_ARTIST] [COLOR_YIELD_GOLD]위대한 예술가[ENDCOLOR], [ICON_GREAT_ENGINEER] [COLOR_YIELD_GOLD]위대한 기술자[ENDCOLOR], [ICON_GREAT_SCIENTIST] [COLOR_YIELD_GOLD]위대한 과학자[ENDCOLOR], [ICON_PROPHET] [COLOR_YIELD_GOLD]위대한 선지자[ENDCOLOR]를 소모하여 [COLOR_CITY_GREEN]숲[ENDCOLOR] 또는 [COLOR_CITY_GREEN]정글[ENDCOLOR]이 있는 [COLOR_CITY_BLUE]평원[ENDCOLOR] 및 [COLOR_CITY_BLUE]초원[ENDCOLOR]에 [COLOR_CITY_BROWN]거대 두상[ENDCOLOR]건설 가능 ([ICON_PRODUCTION], [ICON_RESEARCH], [ICON_CULTURE], [ICON_GOLDEN_AGE], [ICON_GREAT_GENERAL], [ICON_GREAT_ADMIRAL] 제공)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 				'[COLOR_MAGENTA]라사카우 해양 전사:[ENDCOLOR] 정복한 도시마다 수도의 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +1. [COLOR_YIELD_GOLD]군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]바우의 파괴자[ENDCOLOR] 승급을 얻음. (야만인 처치, 야만인 주둔지 파괴(식량 30-75), 적 도시 점령(식량 100-200) 시 시대에 비례하여 [ICON_FOOD] 식량을 얻음)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 				'[COLOR_MAGENTA]신들의 땅:[ENDCOLOR] 작업 가능한 영역의 [COLOR_CITY_BLUE]산[ENDCOLOR] 타일마다 도시에서 신앙 +0.66. [COLOR_POSITIVE_TEXT]세계 의회[ENDCOLOR] 창설 및 [COLOR_CYAN]건축술[ENDCOLOR] 연구 후 [COLOR_YIELD_FOOD]포탈라궁[ENDCOLOR] 세계 불가사의 건설 가능. [COLOR_CYAN]포탈라궁[ENDCOLOR] 건설 시 [COLOR_CYAN]라사[ENDCOLOR]에 대한 [COLOR_POSITIVE_TEXT]영향권[ENDCOLOR]을 얻음.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LONGYAN', 			'[COLOR_MAGENTA]장군들의 고향:[ENDCOLOR] 도시 옆 언덕에 [COLOR_CITY_BROWN]토루[ENDCOLOR] 시설 건설 가능 ([ICON_FOOD], [ICON_PRODUCTION], [ICON_CULTURE], [ICON_GREAT_GENERAL], [ICON_STRENGTH], [ICON_SILVER_FIST], [ICON_CITIZEN] 제공).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MALACCA', 			'[COLOR_MAGENTA]해협 식민지:[ENDCOLOR] [COLOR_GREY]사치 자원[ENDCOLOR]의 [ICON_GOLD] 골드 +1. 도시의 [ICON_GREAT_MERCHANT] 위대한 상인 포인트 +10%. [ICON_GREAT_MERCHANT]위대한 상인과 [ICON_GREAT_ENGINEER] 위대한 기술자의 일회성 능력의 산출량 +10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MANAGUA', 			'[COLOR_MAGENTA]거인의 땅:[ENDCOLOR] 도시의 [ICON_SPY] 첩보 보안 +10. 성공적인 공격 [ICON_SPY] 첩보 임무는 시대에 비례하여 [ICON_FOOD] 식량 30, 성공적인 방어 [ICON_SPY] 첩보 임무는 시대에 비례하여 [ICON_CULTURE] 문화 20 제공.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MANILA', 				'[COLOR_MAGENTA]동양의 진주:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 국제 교역로의 산출 +5%. [ICON_INTERNATIONAL_TRADE] 교역로 완료 시 도시에 [ICON_FOOD] 식량, [ICON_PRODUCTION] 생산 25-50 획득 (도착 도시의 [ICON_CITIZEN] 인구수에 비례하고, 활성화된 [ICON_INTERNATIONAL_TRADE] 교역로 수에 반비례하여 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MBABANE', 			'[COLOR_MAGENTA]아프리카의 요새:[ENDCOLOR] 공무원이 [ICON_GREAT_GENERAL] 위대한 장군 점수 +1. 도시의 체력 +10, [ICON_STRENGTH] 방어력 +10.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MBANZA_KONGO', 		'[COLOR_MAGENTA]전사 여왕:[ENDCOLOR] [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]마니콩고의 영광[ENDCOLOR] 승급을 얻음. ([COLOR:255:230:85:255]숲, 정글, 습지, 범람원[ENDCOLOR]에서 [ICON_STRENGTH] 전투력 +15%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 			'[COLOR_MAGENTA]골드 러시:[ENDCOLOR] [COLOR_CITY_BROWN]광산[ENDCOLOR]의 [ICON_GOLD] 골드 +1. 도시 [ICON_GOLD] 골드의 10%가  [ICON_FOOD] 식량으로, 5%가 [ICON_CULTURE_LOCAL] 국경 확장 점수로 전환됨.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MENDYARRUP', 			'[COLOR_MAGENTA]카르디진의 유산:[ENDCOLOR] 약탈된 시설 수리 시 작업 도시의 1턴치에 해당하는 추가 [ICON_FOOD] 식량 획득. 시민 탄생 시 해당 도시 2타일 내 모든 유닛 경험치 +2. [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]칼라 니디니[ENDCOLOR] 승급 획득 ([COLOR:255:230:85:255]약탈 시[ENDCOLOR] [ICON_MOVES]이동력 소모 없음. [COLOR:255:230:85:255]약탈 시[ENDCOLOR] [ICON_MOVES]이동력 +1 및 경험치 +3).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 				'[COLOR_MAGENTA]비스콘티 가문:[ENDCOLOR][COLOR_YIELD_FOOD]비스콘티 특사[ENDCOLOR] 건설 가능 ([ICON_GREAT_ARTIST]). [ICON_GREAT_ARTIST] 위대한 예술가 출현률 +5%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MOGADISHU', 			'[COLOR_MAGENTA]해양 성장:[ENDCOLOR] [ICON_GOLDEN_AGE] 황금기 동안 [ICON_FOOD] 식량 +10%. [ICON_GOLDEN_AGE] 황금기 진입 비용 -5%. [COLOR_CITY_BLUE]평원[ENDCOLOR] 또는 [COLOR_CITY_BLUE]사막[ENDCOLOR] 언덕에 [COLOR_CITY_BROWN]다크 아[ENDCOLOR] 시설 건설 가능 ([ICON_FOOD], [ICON_PRODUCTION], [ICON_GOLD], [ICON_CULTURE], [ICON_CULTURE_LOCAL] 제공).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MOMBASA', 			'[COLOR_MAGENTA]테나샤라 타이파:[ENDCOLOR] [COLOR_GREY]보너스 자원[ENDCOLOR]의 [ICON_FOOD] 식량 +1. 도시 설립 시 시대에 비례하여 [ICON_PEACE] 신앙 40 획득[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MONACO', 				'[COLOR_MAGENTA]금융 천국:[ENDCOLOR] [COLOR_YIELD_FOOD]시장[ENDCOLOR], [COLOR_YIELD_FOOD]은행[ENDCOLOR]의 [ICON_CULTURE_LOCAL] 국경 확장 점수 +1. 모든 도시의 [ICON_GOLD] 타일 구매 비용 -33%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUISCA', 				'[COLOR_MAGENTA]황금 인간:[ENDCOLOR] 수도의 [ICON_CITIZEN] 시민 3명마다, 제국 전체의 [ICON_CITIZEN] 시민 20명마다 [ICON_GOLD] 골드 +1. [ICON_GOLDEN_AGE] 황금기 또는 [ICON_HAPPINESS_1] 국왕 경축일 동안 국경 확장 속도 두 배.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MULTAN', 				'[COLOR_MAGENTA]성인의 도시:[ENDCOLOR] [ICON_CITIZEN] 시민이 탄생할 때마다 시대에 비례하여 [ICON_PEACE] 신앙 10 획득[ENDCOLOR] [ICON_MISSIONARY] [COLOR_YIELD_GOLD]선교사[ENDCOLOR]가 추가로 1회 전도 가능.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUSCAT', 				'[COLOR_MAGENTA]은둔의 항구:[ENDCOLOR] [ICON_SPY] 적 스파이를 잡을 확률 +50%. 주둔 유닛이 있는 도시의 [ICON_STRENGTH] 전투력 +10%. 주둔한 유닛의 [ICON_GOLD] 골드 유지비가 들지 않음.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUTITJULU', 			'[COLOR_MAGENTA]추쿠르파:[ENDCOLOR] 작업 중인 [COLOR_CITY_BLUE]사막[ENDCOLOR] 2개마다 도시에서 황금기 점수 +1. [COLOR_WHITE]자연 불가사의[ENDCOLOR]의 [ICON_PEACE] 신앙 +3, [COLOR_CITY_BLUE]사막[ENDCOLOR]의 [ICON_PEACE] 신앙 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_NAN_MADOL', 			'[COLOR_MAGENTA]천상의 암초:[ENDCOLOR] [COLOR_CITY_BLUE]해양[ENDCOLOR] 타일의 [ICON_FOOD] 식량 +1, [ICON_CULTURE] 문화 +1. [COLOR_CITY_GREEN]환초[ENDCOLOR]에서 [ICON_PRODUCTION] 생산 +1. 유닛 사망 시 시대에 비례하여 모든 도시에 [ICON_PEACE] 신앙 2 제공.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_NYARYANA_MARQ', 		'[COLOR_MAGENTA]순록 목동:[ENDCOLOR] [COLOR_CITY_BLUE]설원[ENDCOLOR] 타일의 [ICON_CULTURE] 문화 +1. [COLOR_CITY_BLUE]툰드라[ENDCOLOR], [COLOR_CITY_BLUE]설원[ENDCOLOR] 타일에 [COLOR_CITY_BROWN]첨[ENDCOLOR] 건설 가능 (인접 불가, [ICON_FOOD], [ICON_PRODUCTION], [ICON_GOLD] 제공)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 				'[COLOR_MAGENTA]위대한 유리 강의 군주들:[ENDCOLOR] [ICON_CARGO_SHIP] 해양 교역로 최대 거리 +20%. 해안 도시의 [ICON_CULTURE_LOCAL] 국경 확장 점수 +1. 활성화된 국제 [ICON_CARGO_SHIP] 해양 교역로마다 제국에 [ICON_HAPPINESS_1] 행복 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ODENSO', 				'[COLOR_MAGENTA]겨울 전쟁:[ENDCOLOR] [COLOR_YIELD_GOLD]군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]사냥의 제왕[ENDCOLOR] 승급을 얻음. ([ICON_VIEW_CITY]시야 +1. [COLOR:255:230:85:255]중립 영토에서 회복 시[ENDCOLOR] +5).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ORMUS', 				'[COLOR_MAGENTA]반지의 보석:[ENDCOLOR] [COLOR_GREY]사치 자원[ENDCOLOR]의 [ICON_FOOD] 식량 +1. [ICON_CITY_STATE] 도시 국가로 향하는 [ICON_INTERNATIONAL_TRADE] 국제 교역로가 매 턴 [ICON_CITY_STATE] 도시 국가로 향하는 교역로 수마다 대상 [ICON_CITY_STATE] 도시 국가에 [ICON_INFLUENCE] 영향력 +0.4 (최대 [ICON_INFLUENCE] 영향력 +2)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_OUIDAH', 				'[COLOR_MAGENTA]노예 해안:[ENDCOLOR] [COLOR_YIELD_GOLD]노동자[ENDCOLOR] [ICON_WORKER]건설 속도 +15%. [COLOR_YIELD_GOLD]노동자[ENDCOLOR]마다 매 턴 [ICON_GOLD] 골드 +1. [COLOR_YIELD_GOLD]노동자[ENDCOLOR]가 시설 건설 시 해당 타일을 소유한 도시의 [ICON_GOLD] 골드 구매 비용 영구적으로 -1%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PALMYRA', 			'[COLOR_MAGENTA]사막의 진주:[ENDCOLOR] [ICON_TRADE] 도시 연결에서 [ICON_PRODUCTION] 생산 +1. 유닛 사망 시 시대에 비례하여 [ICON_GOLDEN_AGE] 황금기 점수 2, [ICON_GREAT_GENERAL] 위대한 장군 점수 2 획득. 평지 [COLOR_CITY_BLUE]사막[ENDCOLOR]에 [COLOR_CITY_BROWN]장례 탑[ENDCOLOR] 시설 건설 가능, 소유지 옆이라면 영토 밖에도 건설 가능 (완공 시 타일 획득) ([ICON_PRODUCTION], [ICON_CULTURE], [ICON_PEACE], [ICON_GOLDEN_AGE], [ICON_CULTURE_LOCAL] 제공).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 		'[COLOR_MAGENTA]파나마 운하:[ENDCOLOR] [COLOR_CITY_GREEN]호수[ENDCOLOR]의 [ICON_GOLD] 골드 +1. [ICON_CARGO_SHIP]해양 교역로 범위 +10%. [ICON_CARGO_SHIP] 국제 해양 교역로의 [ICON_GOLD] 골드 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PELYM', 				'[COLOR_MAGENTA]시베리아의 군벌:[ENDCOLOR] [COLOR_CITY_BLUE]툰드라[ENDCOLOR] 또는 [COLOR_CITY_BLUE]설원[ENDCOLOR] 위 도시의 [ICON_SILVER_FIST] 군사 유닛 보급 한도 +2. [COLOR_YIELD_GOLD]지상 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]시베리아 훈련[ENDCOLOR] 승급 획득 ([ICON_STRENGTH] 전투력 +10% 및 툰드라와 설원 타일에서 이동력 두 배).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PHANOTEUS', 			'[COLOR_MAGENTA]프로메테우스의 선물:[ENDCOLOR] [ICON_CITY_STATE] 도시 국가의 [COLOR_POSITIVE_TEXT]선거 조작[ENDCOLOR] 확률 +20%. 외국 도시에 주둔한 스파이가 턴당 네트워크 점수 +5 획득.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_POKROVKA', 			'[COLOR_MAGENTA]초원의 사람들:[ENDCOLOR] [COLOR_YIELD_GOLD]사카[ENDCOLOR] 유닛 (고유 [COLOR_YIELD_GOLD]척후병[ENDCOLOR]) 훈련 가능. [COLOR_YIELD_GOLD]기마 근접 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]스키타이 화살 세례[ENDCOLOR] 승급 획득 (턴 시작 시 인접 유닛에게 피해 5).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PRAGUE', 				'[COLOR_MAGENTA]비셰흐라트:[ENDCOLOR] [COLOR_YIELD_FOOD]성벽[ENDCOLOR], [COLOR_YIELD_FOOD]성[ENDCOLOR]의 [ICON_CULTURE] 문화 +1.종교를 퍼뜨릴 수 있는 유닛이 사망하거나 소모될 시 시대에 비례하여 [ICON_CULTURE] 문화를 4-13, [ICON_PEACE] 신앙을 두 배로 제공.[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_QUEBEC_CITY', 		'[COLOR_MAGENTA]모피와 통나무:[ENDCOLOR] [COLOR_CITY_BROWN]야영지[ENDCOLOR], [COLOR_CITY_BROWN]제재소[ENDCOLOR]의 [ICON_GOLD] 골드 +1. [COLOR_CITY_GREEN]숲[ENDCOLOR] 또는 [COLOR_CITY_GREEN]정글[ENDCOLOR] 제거 시 시대에 비례하여 도시에 [ICON_PRODUCTION] 생산 10, [ICON_GOLD] 골드 10 추가 획득[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 			'[COLOR_MAGENTA]길조의 강:[ENDCOLOR] [COLOR_CITY_GREEN]강[ENDCOLOR]의 [ICON_GOLDEN_AGE] 황금기 점수 +1. [ICON_GOLDEN_AGE] 황금기 길이 +25%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 				'[COLOR_MAGENTA]해양 종속국:[ENDCOLOR] [COLOR_CITY_BROWN]대사관[ENDCOLOR]의 [ICON_FOOD] 식량 +1.해안 도시의 [ICON_SILVER_FIST] 군사 유닛 보급 한도 +1. [ICON_CITY_STATE] 도시 국가 동맹마다 모든 도시에 [ICON_FOOD] 식량 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 				'[COLOR_MAGENTA]한자 동맹:[ENDCOLOR] 도시의 [ICON_FOOD]식량 +2%. [ICON_CITY_STATE] 도시 국가에 연결된 [ICON_INTERNATIONAL_TRADE] 국제 교역로마다 도시의 [ICON_PRODUCTION] 생산 +1%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RISHIKESH', 			'[COLOR_MAGENTA]히말라야 요가:[ENDCOLOR] [COLOR_CITY_GREEN]강[ENDCOLOR] 위 도시의 [ICON_PEACE] 신앙 +2. [COLOR_YIELD_FOOD]아쉬람[ENDCOLOR] 건물 건설 가능 ([ICON_RESEARCH], [ICON_PEACE], [ICON_TOURISM], [ICON_HAPPINESS_3]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SADDARVAZEH', 		'[COLOR_MAGENTA]차라투스트라는 이렇게 말했다:[ENDCOLOR] [ICON_VP_GREATWRITING] 위대한 문학 걸작에서 [ICON_PEACE] 신앙 +2. [COLOR_CITY_BROWN]성지[ENDCOLOR] 건설 또는 종교 창시, 강화, 개혁 시 [COLOR_CITY_BROWN]성지[ENDCOLOR]가 건설된 도시 또는 성도에 무료 [COLOR_YIELD_GOLD]선교사[ENDCOLOR] 제공 (자신 종교 과반수 필요).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 			'[COLOR_MAGENTA]소그드:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 국제 교역로가 출발 도시 및 목표 도시 서로에게 [ICON_GOLD] 골드 +4. [COLOR_YIELD_GOLD]교역 유닛[ENDCOLOR]의 [ICON_SIGHT] 시야 +2.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SANAA', 				'[COLOR_MAGENTA]아라비아 펠릭스:[ENDCOLOR] 수도에서 플레이어가 개발한 고유 [COLOR_GREY]사치 자원[ENDCOLOR]마다 [ICON_GOLD] 골드 +1 (거래 또는 수입된 [COLOR_GREY]사치 자원[ENDCOLOR]은 제외). 현재 적용 중인 모든 백분율 기반 [ICON_VP_MONOPOLY] 글로벌 독점 보너스에 추가 +5% 보너스.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SANTO_DOMINGO', 		'[COLOR_MAGENTA]카리브해의 관문:[ENDCOLOR] 현재 적용 중인 모든 행복 또는 고정 산출량 [ICON_VP_MONOPOLY] 글로벌 독점 보너스에 추가 +2 보너스.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SARNATH', 			'[COLOR_MAGENTA]다르마차크라:[ENDCOLOR] 정책 채택 시 시대에 비례하여 [ICON_RESEARCH] 과학 30 획득. 사회 정책 비용이 당신의 종교를 따르는 도시마다 1% 감소 (최대 10%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SGANG_GWAAY', 		'[COLOR_MAGENTA]갸앙 유산:[ENDCOLOR] [COLOR_YIELD_GOLD]해상 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]한랭 해역의 전문가[ENDCOLOR] 승급을 얻음 ([COLOR:255:230:85:255]빙하 통과 가능[ENDCOLOR]). [COLOR_CITY_BLUE]해안[ENDCOLOR], [COLOR_CITY_GREEN]호수[ENDCOLOR], 도시, [COLOR_CITY_BROWN]마을[ENDCOLOR] 또는 [COLOR_CITY_BROWN]소도시[ENDCOLOR]에 인접한 [COLOR_CITY_BLUE]툰드라[ENDCOLOR]에 [COLOR_CITY_BROWN]갸앙[ENDCOLOR] 시설 건설 가능 ([ICON_FOOD], [ICON_PRODUCTION], [ICON_CULTURE], [ICON_GOLDEN_AGE], [ICON_TOURISM] 제공).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SIDON', 				'[COLOR_MAGENTA]정복 도시:[ENDCOLOR] 다른 도시 국가에 공물 요구 시 [COLOR_CYAN]시돈[ENDCOLOR]에 대한 [COLOR_POSITIVE_TEXT]영향권[ENDCOLOR]을 얻음. [COLOR_YIELD_GOLD]군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]지역 불량배[ENDCOLOR] 승급을 얻음 ([COLOR:255:230:85:255]적 영토에서 회복 시[ENDCOLOR] 체력 +5).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SIERRA_LEONE', 		'[COLOR_MAGENTA]자유의 왕국:[ENDCOLOR] [COLOR_YIELD_GOLD]노동자[ENDCOLOR] [ICON_WORKER]건설 속도 +20%. 도시의 [ICON_HAPPINESS_3] 낙후 -5%. [COLOR_YIELD_GOLD]노동자[ENDCOLOR]마다 매 턴 [ICON_CULTURE]문화 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SINGAPORE', 			'[COLOR_MAGENTA]발전된 부:[ENDCOLOR]도시에서 [COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR] 생산 시 [ICON_PRODUCTION] 생산력 +5%. [COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR] 소모 시 시대 및 대상 도시 국가의 [ICON_INFLUENCE] 영향력에 따라 [ICON_GOLD] 골드 30 획득[ENDCOLOR] [COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]귀족[ENDCOLOR] 승급을 얻음 (외교 임무 수행 시 [ICON_INFLUENCE] 영향력 +15).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 				'[COLOR_MAGENTA]세르디카:[ENDCOLOR] 도시 시민이 믿는 종교 하나당 도시의 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +1,  [ICON_GREAT_ADMIRAL] 위대한 제독 포인트 +1. [ICON_GREAT_GENERAL] [COLOR_YIELD_GOLD]위대한 장군[ENDCOLOR] 및 [ICON_GREAT_ADMIRAL] [COLOR_YIELD_GOLD]위대한 제독[ENDCOLOR]의 [ICON_STRENGTH] 전투력 보너스 +10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SUCEAVA', 			'[COLOR_MAGENTA]그리스도의 수호자:[ENDCOLOR] [COLOR_YIELD_FOOD]종교 건물[ENDCOLOR], [COLOR_YIELD_GOLD]선교사[ENDCOLOR], [COLOR_YIELD_GOLD]종교 재판관[ENDCOLOR]의 [ICON_PEACE] 신앙 구매 비용 -10%. [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]바슬루이 전투[ENDCOLOR] 승급 획득 ([ICON_STRENGTH] 방어력 +10%. 군사적 처치 시 처치된 유닛의 [ICON_STRENGTH] 전투력 100%만큼 [ICON_PEACE] 신앙 생성).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SURREY', 				'[COLOR_MAGENTA]항공의 중심지:[ENDCOLOR] [COLOR_GREY]전략 자원[ENDCOLOR]에서 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +1. [COLOR_YIELD_GOLD]공중 유닛[ENDCOLOR] 생산 시 [ICON_PRODUCTION] 생산 +10%. [COLOR_YIELD_GOLD]공중 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]비행 기계의 장엄함[ENDCOLOR] 승급을 얻음 ([COLOR:255:230:85:255]지상 및 해양 유닛과 전투 시 [ENDCOLOR][ICON_RANGE_STRENGTH] 전투력 +10%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SYDNEY', 				'[COLOR_MAGENTA]자본 인프라:[ENDCOLOR] [ICON_HAPPINESS_1] 국왕 경축일 동안 [ICON_FOOD] 식량 +5%. [ICON_HAPPINESS_1] 국왕 경축일이 시작하면 시대에 비례하여 [ICON_GREAT_ARTIST] 위대한 예술가 포인트, [ICON_GREAT_ARTIST] 위대한 작가 포인트, [ICON_GREAT_ARTIST] 위대한 음악가 포인트를 5-20 얻음[ENDCOLOR] [NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 				'[COLOR_MAGENTA]대만의 기적:[ENDCOLOR] 도시에서 연구 과정으로 [ICON_RESEARCH] 과학 +10%. [ICON_RESEARCH] 과학의 15%를 [ICON_FOOD] 식량으로 전환.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TBILISI', 			'[COLOR_MAGENTA]파트론크모바:[ENDCOLOR] 아군 영토 내 전투에서 [ICON_GREAT_GENERAL] 위대한 장군 점수 +50%. 괴뢰 도시의 산출량 감소 페널티 -33%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 			'[COLOR_MAGENTA]전룡의 왕국:[ENDCOLOR] [COLOR_CYAN]언덕[ENDCOLOR] 위 도시의 [ICON_CULTURE] 문화 +3. 턴당 [ICON_CULTURE] 문화 10마다 도시의 [ICON_STRENGTH] 방어력 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TIWANAKU', 			'[COLOR_MAGENTA]하나 파차:[ENDCOLOR] [ICON_PEACE] 신앙으로 [COLOR_YIELD_GOLD]시스퀘노[ENDCOLOR] 유닛 (고유 [COLOR_YIELD_GOLD]선교사[ENDCOLOR]) 구매 가능. [ICON_MISSIONARY] [COLOR_YIELD_GOLD]선교사[ENDCOLOR]를 소모하여 평지 [COLOR_CITY_BLUE]평원[ENDCOLOR], [COLOR_CITY_BLUE]툰드라[ENDCOLOR], [COLOR_CITY_BLUE]사막[ENDCOLOR]에 [COLOR_CITY_BROWN]성큰 가든[ENDCOLOR] 시설 건설 가능. (인접 불가, [ICON_RESEARCH], [ICON_CULTURE], [ICON_PEACE], [ICON_TOURISM] 증가)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TUNIS', 				'[COLOR_MAGENTA]카르타고의 칼리프:[ENDCOLOR] [COLOR_CITY_BLUE]사막[ENDCOLOR]에 [COLOR_CITY_BROWN]리바트[ENDCOLOR] 시설 건설 가능 ([ICON_GOLD], [ICON_CULTURE], [ICON_PEACE], [ICON_GREAT_GENERAL] 제공).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TYRE', 				'[COLOR_MAGENTA]고대 세계의 유적:[ENDCOLOR] [ICON_VP_ARTIFACT] [COLOR_CITY_BROWN]랜드마크[ENDCOLOR]의 [ICON_GOLD] 골드 +2. 도시에서 [ICON_VP_ARTIFACT] [COLOR_YIELD_GOLD]고고학자[ENDCOLOR] 생산 시 생산 +10%.[ICON_WONDER] 불가사의 건설 시 시대 및 도시의 [ICON_WONDER] 불가사의 수에 따라 [ICON_TOURISM] 관광 20-40 획득[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_UR', 					'[COLOR_MAGENTA]문명의 요람:[ENDCOLOR] [ICON_TRADE] 도시 연결 시 [ICON_FOOD] 식량 +2. 새로 건설하는 도시의 [ICON_CITIZEN] 시민 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VALLETTA', 			'[COLOR_MAGENTA]대항만:[ENDCOLOR] [COLOR_YIELD_FOOD]대항만[ENDCOLOR] 건설 가능 ([ICON_FOOD], [ICON_RESEARCH], [ICON_STRENGTH]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 			'[COLOR_MAGENTA]터미널 도시:[ENDCOLOR] 각 도시마다 [ICON_TRADE] 도시 연결에서 오는 [ICON_GOLD] 골드 3% 증가. [ICON_GOLD] 도시 연결 유지비 -30%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 		'[COLOR_MAGENTA]콘클라베:[ENDCOLOR] [ICON_GREAT_PEOPLE] [COLOR_YIELD_GOLD]위인[ENDCOLOR] 소모 시 만난 모든 [ICON_CITY_STATE] 도시 국가에  [ICON_INFLUENCE] 영향력 10.  [ICON_GOLD] 골드 또는 [ICON_PEACE] 신앙으로 [COLOR_YIELD_GOLD]스위스 근위대[ENDCOLOR]유닛 (용병) 구매 가능[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VILNIUS', 			'[COLOR_MAGENTA]북방의 아테네:[ENDCOLOR] [COLOR_YIELD_FOOD]여명의 문[ENDCOLOR] 건설 가능 ([ICON_GREAT_WRITER]). 작가의 [ICON_GOLD] 골드 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 			'[COLOR_MAGENTA]테 황가누이-아-타라:[ENDCOLOR] [COLOR_GREY]전략 자원[ENDCOLOR]의 [ICON_FOOD] 식량 +1. 추가로 [COLOR_GREY] 전략 자원[ENDCOLOR]의 복사본을 얻음:[NEWLINE][ICON_BULLET] +1 (가지고 있지만 독점은 없을 때)[NEWLINE][ICON_BULLET] +2 (전략 독점)[NEWLINE][ICON_BULLET] +3 (글로벌 독점)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 			'[COLOR_MAGENTA]종교 개혁의 장:[ENDCOLOR] 도시 시민이 믿는 종교 하나당 도시의 [ICON_PRODUCTION] 생산 +1, [ICON_GOLD] 골드 +1, [ICON_CULTURE] 문화 +1. 도시의 [ICON_PEACE] 종교 압력 -10%, [ICON_PEACE] 개종 저항 -10%. 모든 도시의 [ICON_HAPPINESS_3] 종교 불안 -5%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WOOTEI_NIICIE', 		'[COLOR_MAGENTA]푸른 하늘의 인류:[ENDCOLOR] 도시에서 [COLOR_YIELD_GOLD]기병 및 화약 유닛[ENDCOLOR] 생산 시 [ICON_PRODUCTION] 생산 +10%. [COLOR_YIELD_FOOD]대상 숙소[ENDCOLOR]가 있거나 [ICON_RES_HORSE] [COLOR_GREY]말[ENDCOLOR] 근처에 있는 도시에서 생산한 [COLOR_YIELD_GOLD]지상 유닛[ENDCOLOR]의 경험치 +15. 유닛이 레벨업할 시 유닛 레벨에 비례하여 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +2 획득[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_YANGCHENG', 			'[COLOR_MAGENTA]동물의 해:[ENDCOLOR] [COLOR_GREY]동물 자원[ENDCOLOR]의 [ICON_PEACE] 신앙 +1. 매 시대가 시작될 때마다 시대에 비례하여 [ICON_PEACE] 신앙 70 획득 (시대에 처음으로 진입했다면 30% 추가), 12종류 중 무작위로 선택된 동물 후원자에 따라 추가 산출량 보너스를 얻음.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_YEREVAN', 			'[COLOR_MAGENTA]바다에서 바다까지 아르메니아:[ENDCOLOR] [ICON_RES_HORSE] [COLOR_GREY]말[ENDCOLOR]의 [ICON_CULTURE] 문화 +1. [COLOR_YIELD_GOLD]군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]손자병법[ENDCOLOR] 승급을 얻음([COLOR:255:230:85:255]처치 시[ENDCOLOR] [ICON_CULTURE] 문화, [ICON_GOLDEN_AGE] 황금기 점수).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ZANZIBAR', 			'[COLOR_MAGENTA]향신료의 섬:[ENDCOLOR] [COLOR_GREY]사치 자원[ENDCOLOR]의 [ICON_TOURISM] 관광 +1. [ICON_INTERNATIONAL_TRADE] 교역로마다 [ICON_HAPPINESS_1] 행복 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ZURICH', 				'[COLOR_MAGENTA]금융 기관:[ENDCOLOR] [COLOR_YIELD_FOOD]은행[ENDCOLOR], [COLOR_YIELD_FOOD]증권거래소[ENDCOLOR]의 [ICON_GOLD] 골드 +2. 매 턴 총 [ICON_GOLD] 골드가 +2% 이자로 생성 (시대별 최대 20 [ICON_GOLD] 골드로 제한)[NEWLINE]';

INSERT INTO Language_ko_KR (Tag, Text)
-- promotions
SELECT 'TXT_KEY_PROMOTION_AMBRACIA', 					'피로스의 용병' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AMBRACIA_HELP', 					' [COLOR_POSITIVE_TEXT]도시에 주둔 시[ENDCOLOR] [ICON_PRODUCTION] 생산 +5%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ANTANANARIVO', 				'해적의 천국' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ANTANANARIVO_HELP', 				'유닛 처치 시 처치된 유닛의 [ICON_STRENGTH] 전투력과 동일한 [ICON_GOLD] 골드 제공' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AUCKLAND', 					'비폭력 저항' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AUCKLAND_HELP', 					'주둔 시 도시의 [ICON_FOOD] 식량 +1, [ICON_GOLDEN_AGE] 황금기 점수 +1.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BELGRADE', 					'하얀 요새' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BELGRADE_HELP', 					'최대 체력 +25.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BRUSSELS', 					'워터링그' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BRUSSELS_HELP', 					'습지에서 [ICON_MOVES] 이동력 두 배. 강을 건널 때 [ICON_MOVES] 이동력 보너스.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT', 					'성전사의 열의' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT_HELP', 					'전투 경험치 +15%' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT1', 					'클레몬트의 축복' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT1_HELP', 					'첫 전투 시 무작위 전투 보너스 획득' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT2', 					'서둘러 전진하라!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT2_HELP', 					'[ICON_MOVES]이동력 +1. 공격 후 이동 가능' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT3', 					'뭉치면 산다!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT3_HELP', 					'[COLOR_POSITIVE_TEXT]아군 유닛에 인접 시[ENDCOLOR] [ICON_STRENGTH] 전투력 +15%' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT4', 					'돌격!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT4_HELP', 					'공격력 [ICON_STRENGTH] +5%. [COLOR_POSITIVE_TEXT]요새화한 유닛[ENDCOLOR] 상대로 [ICON_STRENGTH] +15%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT5', 					'강화하라!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT5_HELP', 					'방어력 [ICON_STRENGTH] +5%. 공격 후 회복 가능.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT6', 					'신께 영광을!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT6_HELP', 					'위대한 장군처럼 주변 유닛에 전투력 보너스 부여. 모든 인접 유닛이 매 턴 체력 5 추가 회복.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT7', 					'신의 뜻이다!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT7_HELP', 					'시야 +1. 유닛 처치 시 처치된 유닛의 [ICON_STRENGTH] 전투력 75% 만큼 [ICON_PEACE] 신앙 제공' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DAKKAR', 						'푸투 알-하바쉬' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DAKKAR_HELP', 					'[ICON_STRENGTH] 전투력 +5.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DODOMA', 						'광야 항해' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DODOMA_HELP', 					'[ICON_MOVES] 이동력 +2' UNION ALL
SELECT 'TXT_KEY_PROMOTION_FAYA', 						'전쟁의 수확' UNION ALL
SELECT 'TXT_KEY_PROMOTION_FAYA_HELP', 						'처치한 적의 [ICON_STRENGTH]전투력 50%만큼 [ICON_RESEARCH] 과학 제공' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANOI', 						'애국주의' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANOI_HELP', 						'[COLOR_POSITIVE_TEXT]아군 영토 내에서[ENDCOLOR] [ICON_STRENGTH] 전투력 +10%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANUABADA', 					'파푸아 해상 전투력' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANUABADA_HELP', 					'승선 시 [ICON_VIEW_CITY] 시야 +1 및 [ICON_STRENGTH] 방어력 +50%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_IFE', 						'이와레파' UNION ALL
SELECT 'TXT_KEY_PROMOTION_IFE_HELP', 						'[ICON_MOVES] 이동력 +1. [ICON_VIEW_CITY] 시야 +1. 외교 임무 수행 시 [ICON_INFLUENCE] 영향력 +10.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ISKANWAYA', 					'콜라 카파차유' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ISKANWAYA_HELP', 					'소유한 [COLOR_POSITIVE_TEXT]선교사[ENDCOLOR], [COLOR_POSITIVE_TEXT]성지[ENDCOLOR], [COLOR_POSITIVE_TEXT]산[ENDCOLOR] 근처에서 매턴 체력 +10.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KABUL', 						'무자히딘' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KABUL_HELP', 						'[ICON_STRENGTH] 방어력 +25%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KARASJOHKA', 					'시다 훈련' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KARASJOHKA_HELP', 				'[ICON_STRENGTH] 공격력/[ICON_RANGE_STRENGTH] 원거리 공격력 +5% 및 숲에서 추가 10%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KARYES', 						'아토스 산 등반가' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KARYES_HELP', 					'유닛이 산을 건널 수 있음.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LACONIA', 					'스파르탄 규율' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LACONIA_HELP', 					'[COLOR_POSITIVE_TEXT]아군 유닛에 인접 시[ENDCOLOR] [ICON_STRENGTH] 전투력 +15%' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LEVUKA', 						'바우의 파괴자' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LEVUKA_HELP', 					'[COLOR_POSITIVE_TEXT]야만인 처치[ENDCOLOR], [COLOR_POSITIVE_TEXT]야만인 주둔지 파괴[ENDCOLOR], [COLOR_POSITIVE_TEXT]도시 점령[ENDCOLOR] 시 [ICON_FOOD] 식량 획득.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MBANZA_KONGO', 				'마니콩고의 영광' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MBANZA_KONGO_HELP', 				'[COLOR_POSITIVE_TEXT]숲[ENDCOLOR], [COLOR_POSITIVE_TEXT]정글[ENDCOLOR], [COLOR_POSITIVE_TEXT]습지[ENDCOLOR], [COLOR_POSITIVE_TEXT]범람원[ENDCOLOR]에서 전투 시 [ICON_STRENGTH] 전투력 +15%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MENDYARRUP', 					'칼라 니디니' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MENDYARRUP_HELP', 				'타일 약탈 시 [ICON_MOVES] 이동력을 소모하지 않음. 타일 약탈 후 [ICON_MOVES] 이동력 +1 및 경험치 +3.[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ODENSO', 						'사냥의 제왕' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ODENSO_HELP', 					'[ICON_VIEW_CITY] 시야 +1, 중립 영토에서 회복 시 추가로 5 회복.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_PELYM', 						'시베리아 훈련' UNION ALL
SELECT 'TXT_KEY_PROMOTION_PELYM_HELP', 						'[ICON_STRENGTH] 전투력 +10% 및 툰드라와 설원 타일에서 이동력 두 배.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_POKROVKA', 					'스키타이 화살 세례' UNION ALL
SELECT 'TXT_KEY_PROMOTION_POKROVKA_HELP', 					'턴 시작 시 주변 적 유닛에게 피해 5.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SCYTHIAN_BARRAGE', 			'스키타이 화살 세례' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SCYTHIAN_BARRAGE_HELP', 			'턴 시작 시 주변 적 유닛에게 피해 5.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SGANG_GWAAY', 				'한랭 해역의 전문가' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SGANG_GWAAY_HELP', 				'유닛이 빙하를 건널 수 있음' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIDON', 						'지역 불량배' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIDON_HELP', 						'[COLOR_POSITIVE_TEXT]적 영토 내에서 회복 시[ENDCOLOR] 추가로 5 회복.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SUCEAVA', 					'바슬루이 전투' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SUCEAVA_HELP', 					'[ICON_STRENGTH] 방어력 +10%. 유닛 처치 시 처치된 유닛의 [ICON_STRENGTH] 전투력 100%만큼 [ICON_PEACE] 신앙 생성.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SURREY', 						'비행 기계의 장엄함' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SURREY_HELP', 					'[COLOR_POSITIVE_TEXT]지상[ENDCOLOR] 및 [COLOR_POSITIVE_TEXT]해상 유닛[ENDCOLOR] 대항 시 [ICON_STRENGTH]전투력 보너스 +10%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_YEREVAN', 					'손자병법' UNION ALL
SELECT 'TXT_KEY_PROMOTION_YEREVAN_HELP', 					'처치한 적의 [ICON_STRENGTH]전투력 50%만큼 [ICON_CULTURE] 문화 제공' UNION ALL
SELECT 'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA', 			'교황청 스위스 근위대' UNION ALL
SELECT 'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA_HELP', 			'처치 시 10의 피해 회복 (소유한 도시 범위 내), 30 (소유한 수도 범위 내) 또는 40 (소유한 성도 범위 내).' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KATZBALGER', 					'카츠발게르' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KATZBALGER_HELP', 				'유닛이 [ICON_PEACE] 신앙 +2, [COLOR_CYAN]라디오[ENDCOLOR] 연구 시 [ICON_CULTURE] 문화 +2, [COLOR_CYAN]통신[ENDCOLOR] 연구 시 [ICON_TOURISM] 관광 +2.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH', 						'시크 전사' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_HELP', 						'전투 경험치 +30%. 유닛 처치 시 처치된 유닛의 [ICON_STRENGTH] 전투력 50%만큼 [ICON_PEACE] 신앙 생성.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_SWORD', 					'칸다' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_SWORD_HELP', 				'[ICON_STRENGTH] 전투력 +1. 공격력 [ICON_STRENGTH] +10%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_KNIFE', 					'도리 키르판' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_KNIFE_HELP', 				'[ICON_STRENGTH] 전투력 +3. 체력이 50% 이하인 유닛 상대로 공격력 [ICON_STRENGTH] +15%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_DISC', 					'차크람' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_DISC_HELP', 					'아군 영토 내에서 [ICON_STRENGTH] 전투력 +20%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_TRIDENT', 				'트레술 무크' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_TRIDENT_HELP', 				'[ICON_STRENGTH] 전투력 +3. 공격받았을 때 받은 피해의 10%를 반사.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_DAGGER', 				'카타르' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_DAGGER_HELP', 				'[ICON_STRENGTH] 전투력 +4. 부상당한 유닛 상대로 [ICON_STRENGTH] 전투력 +20%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_BOW', 					'카만' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_BOW_HELP', 					'[ICON_STRENGTH] 전투력 +3. 체력이 가득 찬 유닛 상대로 공격력 [ICON_STRENGTH] +15%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_MUSKET', 				'토라다르' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_MUSKET_HELP', 				'[ICON_STRENGTH] 전투력 +4. 근접 공격 전 전투력의 50%로 원거리 공격 수행.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_SHIELD', 				'달' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_SHIELD_HELP', 				'[ICON_STRENGTH] 전투력 +1. 원거리 공격에 대한 [ICON_STRENGTH] 방어력 +20%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_CHAINMAIL', 				'산조' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_CHAINMAIL_HELP', 			'[ICON_STRENGTH] 전투력 +2. [ICON_STRENGTH] 방어력 +10%. 체력 +15.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_ROBE', 					'촐라' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_ROBE_HELP', 					'[ICON_STRENGTH] 전투력 +1. 전투 경험치 +10%. 적 유닛이 전투 후 25% 확률로 후퇴.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_SHOES', 					'장기 모제' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_SHOES_HELP', 				'[ICON_STRENGTH] 전투력 +3. [ICON_MOVES] 이동력 +1. 이동 시 모든 인접 유닛에게 피해 5.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_MARTIAL_ART', 			'샤스타르 비디아' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_MARTIAL_ART_HELP', 			'[ICON_STRENGTH] 전투력 +4. 처치 시 이동하여 모든 인접 유닛에게 피해 10.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_TURBAN', 				'다스타르 붕가' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_TURBAN_HELP', 				'[ICON_STRENGTH] 전투력 +1. 시야 +1. 전투 경험치 +25%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_BRACELET', 				'장기 카라' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIKH_BRACELET_HELP', 				'[ICON_STRENGTH] 전투력 +6. 유닛 처치 시 처치된 유닛의 [ICON_STRENGTH] 전투력 75%만큼 [ICON_PEACE] 신앙 생성.';

INSERT INTO Language_ko_KR (Tag, Text)
-- units
SELECT 'TXT_KEY_UNIT_SWISS_GUARD', 						'스위스 근위대' UNION ALL
SELECT 'TXT_KEY_UNIT_SWISS_GUARD_STRATEGY', 				'스위스 근위대는 바티칸시티의 고유 용병 유닛으로, [COLOR_POSITIVE_TEXT]자유용병대[ENDCOLOR]와 [COLOR_POSITIVE_TEXT]외인부대[ENDCOLOR] 사이에 위치합니다. 특정 정책 없이 골드 또는 신앙으로 구매할 수 있으며, 구매 이후 즉시 이동 가능합니다. 스위스 근위대는 시대가 지날수록 추가 전투력을 얻으며, 소유한 도시(조금), 수도(더 많이), 성도(가장 많이) 근처에서 적 유닛을 처치하면 회복합니다. 또한 발견한 기술([COLOR_CYAN]라디오[ENDCOLOR]와 [COLOR_CYAN]통신[ENDCOLOR])에 따라 추가 산출을 제공합니다. 이 유닛은 퇴보되지 않습니다.' UNION ALL
SELECT 'TXT_KEY_UNIT_SWISS_GUARD_HELP', 					'[COLOR_CYAN]바티칸시티[ENDCOLOR]와 동맹인 문명만이 스위스 근위대를 [ICON_GOLD] 골드 또는 [ICON_PEACE] 신앙으로 구매할 수 있습니다.[NEWLINE][NEWLINE]퇴보되지 않습니다. 구입 후 즉시 이동할 수 있습니다. 시대가 지날수록 추가 [ICON_STRENGTH] 전투력을 얻습니다. 소유한 도시(일반, 수도, 성도) 범위 내에서 적 유닛 처치 시 체력을 회복합니다. 신앙 +2를 생성하고, [COLOR_CYAN]라디오[ENDCOLOR] 연구 시 [ICON_CULTURE] 문화 +2, [COLOR_CYAN]통신[ENDCOLOR] 연구 시 [ICON_TOURISM] 관광 +2를 생성합니다.' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_SWISS_GUARD', 					'스위스 근위대는 역사적으로 중세와 르네상스 시대에 유럽의 궁정에서 경호원으로 활동했던 스위스 출신 용병들을 일컫는 말입니다. 변함없는 충성심과 용맹함으로 찬사를 받은 스위스 근위대는 의장대부터 최전방 부대까지 다양한 임무를 수행했으며 프랑스, 스페인, 나폴리 등 유럽 강대국의 군대에서 사용되었습니다. 1874년 스위스 헌법에 의해 외국 세력의 스위스 근위대 모집이 금지되었지만 교황청을 위해 복무한 교황청 스위스 근위대는 예외였으며, 오늘날에도 교황의 안전과 사도궁의 보안을 책임지는 바티칸의 주요 부대로 남아 있습니다.' UNION ALL
SELECT 'TXT_KEY_UNIT_GURKHA', 							'구르카' UNION ALL
SELECT 'TXT_KEY_UNIT_GURKHA_STRATEGY', 						'구르카는 수발총병을 대체하는 카트만두의 고유 유닛입니다. 수발총병보다 먼저 등장하며, 경험치를 더 많이 얻고 막힌 적 유닛 상대로 큰 핸디캡을 가집니다.' UNION ALL
SELECT 'TXT_KEY_UNIT_GURKHA_HELP', 							'[COLOR_CYAN]카트만두[ENDCOLOR]와 동맹인 문명만이 구르카를 훈련하거나 구매할 수 있습니다.[NEWLINE][NEWLINE]고유 수발총병 유닛으로 구매 시 즉시 이동할 수 있고, 더 일찍 훈련할 수 있으며 구매에 [COLOR_POSITIVE_TEXT]무기고[ENDCOLOR]가 필요하지 않습니다. 적을 밀어내는 승급([COLOR_POSITIVE_TEXT]육중한 돌격[ENDCOLOR])과 전투 경험치를 50% 더 얻는 승급([COLOR_POSITIVE_TEXT]빠른 학습[ENDCOLOR])을 보유하고 시작합니다.' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_GURKHA', 							'구르카족은 네팔 산악지대와 인도 고르칼란드 지역에 거주하는 민족입니다. 용감하고 두려움이 없으며 죽음을 두려워하지 않는 것으로 유명한 이들은 1814년 동인도회사가 네팔과 벌인 구르카 전쟁 당시 영국군 지휘관들에게 깊은 인상을 남겼습니다. 1815년, 전쟁이 끝나기도 전인 영국 인도 군대 내에 구르카족 최초의 연대가 창설되었습니다. 19세기부터 20세기까지 구르카족은 전쟁과 수많은 인도 반란에도 불구하고 영국 왕실에 충성을 다했습니다. 구르카족은 영국군의 일원으로 두 차례의 세계대전에 참전하여 15개의 소총 연대를 구성했습니다. 그들은 어떤 고난도 견뎌내는 능력으로 널리 존경받았으며 치명적인 쿠쿠리 칼을 다루는 기술로 두려움을 샀습니다. 구르카 연대는 오늘날까지 계속 복무하고 있습니다.' UNION ALL
SELECT 'TXT_KEY_UNIT_SISQENO', 							'시스퀘노' UNION ALL
SELECT 'TXT_KEY_UNIT_SISQENO_STRATEGY', 					'시스퀘노는 선교사를 대체하는 티와나쿠의 고유 유닛입니다. 약간 더 저렴하며, 성큰 가든 시설을 건설할 수 있는 추가 능력을 가집니다. 이 능력은 전도하기 전에만 사용할 수 있습니다.' UNION ALL
SELECT 'TXT_KEY_UNIT_SISQENO_HELP', 						'[COLOR_CYAN]티와나쿠[ENDCOLOR]와 동맹인 문명만이 시스퀘노를 [ICON_PEACE] 신앙으로 구매할 수 있습니다.[NEWLINE][NEWLINE]고유 선교사 유닛입니다. 약간 더 저렴하며 [COLOR_POSITIVE_TEXT]성큰 가든[ENDCOLOR] 시설을 건설할 수 있습니다 (모든 전도 횟수가 남아있을 때만 가능).' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_SISQENO', 						'티와나쿠 제국은 티티카카 호수의 물리적 공간과 티와나쿠의 고지대 유적지 사이에 영성, 힘, 권위를 연결했습니다. 두 유적지 모두에 사원이 세워졌으며 뱀, 콘도르, 퓨마의 공통된 이미지는 두 유적지를 연결한 종교적, 우주론적 표현에 있어 중요한 의미를 지니고 있습니다.[NEWLINE]여러 학자들은 티와나쿠의 영성, 농업 패턴, 기념비적인 건축물, 예술적 묘사가 치리파, 푸카라, 쿠스코와 같은 초기 및 다른 지역 문화와 연관성이 있다고 지적했습니다. 야야-마마 종교 전통으로 알려진 티티카카 호수 지역에서 발견된 많은 유물은 유사한 모티프를 특징으로 하며, 이 지역의 지리와 문화에 오랫동안 통합되어 있음을 보여줍니다. 티티카카 호수는 티와나쿠와 잉카 세계관에서는 우주의 정신적 발상지이자 중심지였으며, 지금도 이 지역에 살고 있는 원주민들에게 신성한 장소로 남아 있습니다. 티티카카 호수는 영적으로 강력한 동물인 퓨마의 이름을 따서 명명되었습니다.[NEWLINE]티와나쿠의 뒤를 이어 수백 년 동안 전해 내려온 잉카 신화에 따르면 신이자 위대한 창조자인 비라코차가 티티카카 호수에서 대홍수 후 세상을 창조하기 위해 등장했습니다. 그는 오늘날 볼리비아의 티티카카 호수 남쪽 기슭에 있는 태양의 섬에서 태양(인티)을, 동쪽의 달의 섬에서 달(마마 킬라)을 가져왔고 호수에서 태어난 별들로 우주를 창조했습니다. 그 후 티와나쿠에서 돌로 최초의 인간을 창조했습니다. 비라코차는 원소, 날씨, 농사의 운을 관장하는 전능한 신이었어요. 비라코차는 태양의 관문에 있는 티와나쿠에 묘사되어 있으며 고대 제국의 다른 조각과 이미지에도 등장합니다. 잉카의 신처럼 양손에 콘도르의 머리인 뱀을 들고 있는 모습을 볼 수 있습니다.[NEWLINE][NEWLINE]비라코차 숭배 외에도 티와나쿠 종교에 대한 다른 증거는 조상 숭배의 체계를 가리킵니다. 후기 잉카와 마찬가지로 미라 묶음과 골격 유골의 보존, 사용 및 재구성을 보면 이것이 사실임을 알 수 있습니다.[NEWLINE]이 지역의 후기 문화는 "철파"로 알려진 사회 엘리트들을 위한 대형 "지상 매장실"을 사용했습니다. 티와나쿠 유적지에서도 규모는 작지만 비슷한 구조물이 발견되었습니다. 후기 잉카와 마찬가지로 티와나쿠의 주민들도 죽은 자와 관련하여 비슷한 의식과 의례를 행했을 가능성이 있습니다.[NEWLINE]아카파나 이스트 빌딩에는 조상이 매장된 증거가 있습니다. 아카파나 이스트의 유골은 전시용이라기보다는 적절한 매장을 위한 것으로 보입니다. 해골에는 죽은 후 살을 발라내거나 환생할 때 생긴 상처가 많이 보입니다. 그런 다음 유골은 야외에 방치하지 않고 묶어서 묻었습니다.[NEWLINE][NEWLINE]티와나쿠는 아카파나라는 건물 꼭대기에서 인신 제사를 지냈습니다. 사람들은 죽은 직후 내장이 제거되고 찢겨져 모든 사람이 볼 수 있도록 배치되었습니다. 이 의식은 신에게 바치는 헌신의 한 형태였던 것으로 추측됩니다. 인간 희생의 유형에는 희생자가 조각난 채로 난도질 당하고, 토막 난 채로 비바람과 육식 동물에 노출된 후 쓰레기통에 버려지는 것이 포함되었습니다. 연구에 따르면 희생된 한 남성은 티티카카 분지 원주민이 아니었으며, 희생은 원래 다른 사회에서 온 사람들일 가능성이 높다고 생각할 여지를 남겼습니다.' UNION ALL
SELECT 'TXT_KEY_UNIT_NIHANG', 							'니항' UNION ALL
SELECT 'TXT_KEY_UNIT_NIHANG_STRATEGY', 						'니항은 장검병을 대체하는 라호르의 고유 유닛입니다. 매우 늦게 퇴보하며, 고유한 승급 계통을 가집니다. 추가 경험치와 [ICON_PEACE] 신앙을 제공하는 특별 승급으로 시작하며, 기본 유닛보다 약간 더 강합니다. [ICON_PEACE] 신앙으로만 구매할 수 있으며, 플레이어가 군사 건물을 건설할 때 추가 경험치를 얻습니다.' UNION ALL
SELECT 'TXT_KEY_UNIT_NIHANG_HELP', 							'[COLOR_CYAN]라호르[ENDCOLOR]와 동맹인 문명만이 이 유닛을 [ICON_PEACE] 신앙으로 구매할 수 있습니다.[NEWLINE][NEWLINE]고유 장검병 유닛으로 구매 후 즉시 이동할 수 있으며, 플레이어가 [COLOR_POSITIVE_TEXT]무기고[ENDCOLOR], [COLOR_POSITIVE_TEXT]사관학교[ENDCOLOR] 또는 [COLOR_POSITIVE_TEXT]군수공장[ENDCOLOR]을 건설할 때 경험치를 얻습니다. 30% 더 많은 경험치와 처치 시 약간의 [ICON_PEACE] 신앙을 제공하는 특별 승급([COLOR_POSITIVE_TEXT]시크 전사[ENDCOLOR])으로 시작하며, 이 유닛 전용의 고유 승급 계통에 접근할 수 있습니다.' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_NIHANG', 							'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_UNIT_SAKA', 							'사카' UNION ALL
SELECT 'TXT_KEY_UNIT_SAKA_STRATEGY', 						'사카는 다에르가에프스의 척후병 대체 유닛입니다. 기본 유닛보다 약간 더 강하며, 매 턴 주변의 모든 적에게 약간의 피해를 주는 승급으로 시작하고 [ICON_RES_HORSE] 말이 필요하지 않습니다.' UNION ALL
SELECT 'TXT_KEY_UNIT_SAKA_HELP', 							'[COLOR_CYAN]다에르가에프스[ENDCOLOR]와 동맹인 문명만이 이 유닛을 훈련하거나 구매할 수 있습니다.[NEWLINE][NEWLINE]고유 척후병 유닛입니다. [ICON_RES_HORSE] 말이 필요하지 않습니다. 매 턴 5의 광역 피해를 주는 추가 승급([COLOR_POSITIVE_TEXT]스키타이 화살 세례[ENDCOLOR])으로 시작합니다.' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_SAKA', 							'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_UNIT_TEAAT', 							'테아트' UNION ALL
SELECT 'TXT_KEY_UNIT_TEAAT_STRATEGY', 						'테아트는 주유비트의 작업선 대체 유닛입니다. 일반 작업선보다 저렴하고 약간 빠르며, 소모 시 추가 산출량을 제공합니다.' UNION ALL
SELECT 'TXT_KEY_UNIT_TEAAT_HELP', 							'[COLOR_CYAN]주유비트[ENDCOLOR]와 동맹인 문명만이 이 유닛을 훈련하거나 구매할 수 있습니다.[NEWLINE][NEWLINE]고유 작업선 유닛으로 기본 유닛보다 저렴하고 빠르며, 시설 건설 후 약간의 [ICON_FOOD] 식량과 [ICON_CULTURE] 문화를 제공합니다.' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_TEAAT', 							'내용을 입력해주세요';

INSERT INTO Language_ko_KR (Tag, Text)
-- improvements
	-- dummy (city-state)
	SELECT 'TXT_KEY_IMPROVEMENT_CITY', 						'도시 국가' UNION ALL
	-- marsh
	SELECT 'TXT_KEY_BUILD_MARSH', 							'습지 생성'  UNION ALL
	SELECT 'TXT_KEY_BUILD_MARSH_HELP', 						'[COLOR_CYAN]브뤼셀[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][NEWLINE]이곳의 지형을 [COLOR_CITY_GREEN]습지[ENDCOLOR]로 바꾸고 안정화시키는 시설을 설치합니다.[NEWLINE]'  UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MARSH', 					'습지' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MARSH', 				'어떤 지형에서든 습지를 복원하려면 물이 자연스럽게 흐르도록 하십시오. 물이 얼지 않는다면 설원에도 효과가 있습니다!' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MARSH_HELP', 				'브뤼셀 문명과 동맹을 맺어야만 습지 복원 프로젝트를 계속할 수 있습니다.' UNION ALL
	-- colossal head
	SELECT 'TXT_KEY_BUILD_BIG_HEAD', 						'거대 두상 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_BIG_HEAD_HELP', 					'[COLOR_CYAN]라벤타[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][COLOR_CITY_GREEN]숲[ENDCOLOR] 또는 [COLOR_CITY_GREEN]정글[ENDCOLOR]이 있는 [COLOR_CITY_BLUE]평원[ENDCOLOR] 또는 [COLOR_CITY_BLUE]초원[ENDCOLOR]에만 건설할 수 있습니다.[NEWLINE][NEWLINE]도시 옆에 건설 시 [ICON_GOLDEN_AGE] 황금기 점수 +1, [ICON_RES_STONE] [COLOR_GREY]석재[ENDCOLOR] 또는 [ICON_RES_MARBLE] [COLOR_GREY]대리석[ENDCOLOR] 옆에 건설 시 [ICON_PRODUCTION] 생산 +1. 인접한 [COLOR_CITY_BROWN]거대 두상[ENDCOLOR] 2개마다 [ICON_GOLDEN_AGE] 황금기 점수 +1, [ICON_GREAT_GENERAL] 위대한 장군 점수 +1, [ICON_GREAT_ADMIRAL] 위대한 제독 점수 +1. 인접한 [COLOR_CITY_BROWN]농장[ENDCOLOR], [COLOR_CITY_BROWN]광산[ENDCOLOR], [COLOR_CITY_BROWN]채석장[ENDCOLOR]에서 [ICON_PRODUCTION] 생산 +1.[NEWLINE][NEWLINE]기술 및 정책에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]석조 기술[ENDCOLOR] 연구 시 [ICON_PRODUCTION] 생산 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]기계[ENDCOLOR] 연구 시 [ICON_GOLDEN_AGE] 황금기 점수 +2[NEWLINE][ICON_BULLET][COLOR_CYAN]건축[ENDCOLOR] 연구 시 [ICON_RESEARCH] 과학 +3[NEWLINE][ICON_BULLET][COLOR_CYAN]과학 이론[ENDCOLOR] 연구 시 [ICON_PRODUCTION] 생산 +2[NEWLINE][ICON_BULLET][COLOR_MAGENTA]뉴딜 정책[ENDCOLOR] 채택 시 [ICON_CULTURE] 문화 +3[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_BIG_HEAD', 					'거대 두상' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_BIG_HEAD', 			'올멕 문명(기원전 1200년~기원전 400년)의 석기 머리 조각은 고대 세계에서 가장 신비롭고 논쟁의 여지가 많은 유물 중 하나입니다. 현재까지 이 지역에서는 커다란 현무암 바위로 조각한 17개의 기념비적인 석조 인간 머리 조각이 발굴되었습니다. 이 머리들은 적어도 기원전 900년 이전에 만들어진 것으로 올멕 문명의 독특한 특징입니다. 높이가 거의 3미터, 둘레가 4.5미터(9.8피트, 14.7피트), 평균 무게가 약 8톤에 달합니다. 모두 통통한 뺨과 오똑한 코, 살짝 교차된 눈을 가진 성숙한 남성을 묘사하고 있습니다. 하지만 머리 모양이 똑같지 않고 각기 독특한 머리 장식을 하고 있어 특정 인물을 표현한 것으로 추정됩니다.[NEWLINE][NEWLINE]올멕인들은 베라크루스의 시에라 데 로스 턱틀라스 산맥에서 돌들을 가져왔습니다. 제작에 사용 된 매우 큰 석판이 먼 거리에 걸쳐 운송되어 많은 인적 노력과 자원이 필요하다는 점을 고려하면, 기념비는 강력한 개별 올멕 통치자의 초상화를 나타내며 아마도 그들의 죽음을 기념하기 위해 조각되었을 것으로 생각됩니다. 머리는 올멕 중심에서 일렬 또는 단체로 배열되었지만 돌을 현장으로 운반하는 데 사용 된 방법과 물류는 불확실하며 가능한 한 거대한 발사 강 뗏목을 사용하고 육지에서는 통나무 롤러를 사용했을 것으로 추정됩니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_BIG_HEAD_HELP', 			'라벤타 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- sunken courtyard
	SELECT 'TXT_KEY_BUILD_SUNK_COURT', 						'성큰 가든 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_SUNK_COURT_HELP', 				'[COLOR_CYAN]티와나쿠[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][COLOR_CITY_BLUE]평원[ENDCOLOR], [COLOR_CITY_BLUE]툰드라[ENDCOLOR] 또는 [COLOR_CITY_BLUE]사막[ENDCOLOR]이 있는 평지에만 건설할 수 있습니다.[NEWLINE]다른 [COLOR_CITY_BROWN]성큰 가든[ENDCOLOR] 옆이나 [COLOR_GREY]자원[ENDCOLOR] 위에는 건설할 수 없습니다.[NEWLINE][NEWLINE]도시 옆에 건설 시 [ICON_RESEARCH] 과학 +1, [COLOR_CITY_BLUE]산[ENDCOLOR] 옆에 건설 시 [ICON_RESEARCH] 과학 +1 및 [ICON_CULTURE] 문화 +1.[NEWLINE][NEWLINE]기술에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]신학[ENDCOLOR] 연구 시 [ICON_PEACE] 신앙 +2[NEWLINE][ICON_BULLET][COLOR_CYAN]고고학[ENDCOLOR] 연구 시 [ICON_TOURISM] 관광 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]레이더[ENDCOLOR] 연구 시 [ICON_RESEARCH] 과학 +1[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_SUNK_COURT', 				'성큰 가든' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_SUNK_COURT', 			'티와나쿠는 전성기에는 최대 4만 명이 거주했으며 수많은 건물과 플랫폼, 안뜰을 갖춘 의식 중심지를 중심으로 가장 크고 중요한 반지하 궁전, 칼라사사야와 푸투니 콤플렉스(높은 플랫폼과 안뜰의 조합), 아카파나(킴사차타 산맥을 재현한 것으로 추정되는 복잡한 토루 구조), 후기 사원 단지인 푸마풍쿠가 있습니다.[NEWLINE][NEWLINE]가라앉은 궁정 스타일의 건물은 푸카라나 치리파 등 티티카카 호수 주변 지역의 티와나쿠 건국 이전의 고고학 유적지에서 많이 발견되지만, 반지하 궁정은 현재까지 발견된 것 중 가장 큰 규모입니다. 그 규모가 커진 것은 신흥 티와나쿠 정권의 정치력이 커졌음을 보여주는 증거일 가능성이 높습니다. 기원전 300~400년 사이에 완공된 이 건물은 중앙 의식 구역에 건설된 가장 초기의 기념비적인 석조 건물로 추정됩니다.[NEWLINE][NEWLINE]반지하 궁전의 세 벽(북쪽, 동쪽, 서쪽)에 있는 중앙 돌은 동지 및 춘분 일출과 일몰, 중요한 별의 일출과 일몰과 같은 다양한 천문학적 사건의 관측 지점을 표시하고 남반구의 중심인 천상의 남극으로 가는 길을 가리키기도 합니다. 이 돌들은 종교 의식 참가자들이 적절한 천체 행사를 위해 방향을 잡을 수 있도록 도와주는 보조 도구였습니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_SUNK_COURT_HELP', 			'티와나쿠 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- buryuut hajar (bedouin camp)
	SELECT 'TXT_KEY_BUILD_BEDOUIN_CAMP', 					'부류트 하자르 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_BEDOUIN_CAMP_HELP', 				'[COLOR_CYAN]알-티라빈[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][COLOR_CITY_BLUE]사막[ENDCOLOR]에만 건설할 수 있습니다.[NEWLINE]도시, 다른 [COLOR_CITY_BROWN]부류트 하자르[ENDCOLOR] 옆이나 [COLOR_GREY]자원[ENDCOLOR] 위에는 건설할 수 없습니다.[NEWLINE][NEWLINE][COLOR_CITY_GREEN]범람원[ENDCOLOR] 또는 [COLOR_CITY_GREEN]오아시스[ENDCOLOR] 옆에 건설 시 [ICON_FOOD] 식량 +1. [COLOR_GREY]사치 자원[ENDCOLOR] 옆에 건설 시 [ICON_PRODUCTION] 생산 +1. [COLOR_CITY_BROWN]도로[ENDCOLOR] 위에 건설 시 [ICON_GOLD] 골드 +1, [COLOR_CITY_BROWN]철도[ENDCOLOR] 위에 건설 시 [ICON_GOLD] 골드 +2.[NEWLINE][NEWLINE]기술에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]나침반[ENDCOLOR] 연구 시 [ICON_CULTURE] 문화 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]천문학[ENDCOLOR] 연구 시 [ICON_FOOD] 식량 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]경제학[ENDCOLOR] 연구 시 [ICON_GOLD] 골드 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]라디오[ENDCOLOR] 연구 시 [ICON_GOLD] 골드 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]레이더[ENDCOLOR] 연구 시 [ICON_FOOD] 식량 +1[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_BEDOUIN_CAMP', 				'부류트 하자르' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_BEDOUIN_CAMP', 		'내용을 입력해주세요' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_BEDOUIN_CAMP_HELP', 		'알-티라빈 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- chum
	SELECT 'TXT_KEY_BUILD_CHUM', 							'첨 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_CHUM_HELP', 						'[COLOR_CYAN]나리얀 마르[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][COLOR_CITY_BLUE]툰드라[ENDCOLOR] 또는 [COLOR_CITY_BLUE]설원[ENDCOLOR]에만 건설할 수 있습니다.[NEWLINE]다른 [COLOR_CITY_BROWN]첨[ENDCOLOR] 옆이나 [COLOR_GREY]자원[ENDCOLOR] 위에는 건설할 수 없습니다.[NEWLINE][NEWLINE][COLOR_GREY]보너스 자원[ENDCOLOR] 옆에 건설 시 [ICON_FOOD] 식량 +1, [COLOR_CITY_BROWN]야영지[ENDCOLOR], [COLOR_CITY_BROWN]목장[ENDCOLOR] 또는 [COLOR_CITY_BROWN]다크 아[ENDCOLOR] 옆에 건설 시 [ICON_PRODUCTION] 생산 +1. 인접한 [COLOR_CITY_BROWN]야영지[ENDCOLOR], [COLOR_CITY_BROWN]목장[ENDCOLOR], [COLOR_CITY_BROWN]다크 아[ENDCOLOR]에서 [ICON_GOLD] 골드 +1.[NEWLINE][NEWLINE]기술에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]철학[ENDCOLOR] 연구 시 [ICON_GOLD] 골드 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]교육[ENDCOLOR] 연구 시 [ICON_FOOD] 식량 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]비료[ENDCOLOR] 연구 시 [ICON_FOOD] 식량 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]냉동 기술[ENDCOLOR] 연구 시 [ICON_PRODUCTION] 생산 +1[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_CHUM', 						'첨' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_CHUM', 				'첨은 러시아 시베리아 북서부의 유목민 우랄족(네네츠, 응가나산, 에네츠, 칸티, 만시, 코미)의 순록 목동들이 사용하는 임시 거주지입니다. 러시아, 몽골, 중국의 퉁구스 민족, 부족인 이븐크족도 첨을 사용합니다. 또한 투바 공화국의 최남단 토차 지역과 몽골 북부의 국경을 넘는 친척들의 순록 목동들도 사용합니다. 아메리카 원주민의 티피와 비슷한 디자인이지만 일부 버전은 수직이 덜합니다. 사미 라브부와 건축 방식이 매우 밀접하게 관련되어 있지만 크기가 다소 더 큽니다. 일부 첨은 지름이 최대 10미터에 달하기도 합니다.[NEWLINE][NEWLINE]전통적인 첨은 순록 가죽을 함께 꿰매고 원으로 구성된 나무 기둥을 감싸는 순록 가죽으로 구성됩니다. 가운데에는 난방과 모기를 쫓는 데 사용되는 벽난로가 있습니다. 연기는 첨의 상단에 있는 구멍을 통해 빠져나갑니다. 캔버스와 나무 기둥은 보통 꽤 무겁지만 순록이 운반할 수 있습니다. 첨은 오늘날에도 러시아의 야말 네네츠, 칸티, 토차 타이반족의 연중 쉼터로 사용되고 있습니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_CHUM_HELP', 				'나리얀 마르 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- daaq ah
	SELECT 'TXT_KEY_BUILD_DAAQ_AH', 						'다크 아 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_DAAQ_AH_HELP', 					'[COLOR_CYAN]모가디슈[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][COLOR_GREY]보너스 목장 자원[ENDCOLOR]에 건설하여 연결할 수 있습니다.[NEWLINE][COLOR_CITY_BLUE]평원[ENDCOLOR] 또는 [COLOR_CITY_BLUE]사막[ENDCOLOR]이 있는 언덕에만 건설할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]담수[ENDCOLOR]원 옆에 건설 시 [ICON_FOOD] 식량 +2. 다른 [COLOR_CITY_BROWN]다크 아[ENDCOLOR] 옆에 건설 시 [ICON_CULTURE_LOCAL] 국경 확장 점수 +1. [COLOR_CITY_BROWN]다크 아[ENDCOLOR] 건설 시 타일에 자원(숨겨진 자원 포함)이 없으면 [ICON_RES_CATTLE] [COLOR_GREY]소[ENDCOLOR] 또는 [ICON_RES_SHEEP] [COLOR_GREY]양[ENDCOLOR]이 생성됩니다.[NEWLINE][NEWLINE]기술에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]철기[ENDCOLOR] 연구 시 [ICON_PRODUCTION] 생산 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]기사도[ENDCOLOR] 연구 시 [ICON_GOLD] 골드 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]비료[ENDCOLOR] 연구 시 [ICON_PRODUCTION] 생산 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]생물학[ENDCOLOR] 연구 시 [ICON_PRODUCTION] 생산 +1[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_DAAQ_AH', 					'다크 아' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_DAAQ_AH', 			'내용을 입력해주세요' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_DAAQ_AH_HELP', 				'모가디슈 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- funerary tower
	SELECT 'TXT_KEY_BUILD_FUNERARY_TOWER', 					'장례 탑 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_FUNERARY_TOWER_HELP', 			'[COLOR_CYAN]팔미라[ENDCOLOR]의 능력이 필요합니다.[NEWLINE]영토 밖에도 건설할 수 있지만, 소유한 타일 옆이어야 합니다 (완공 시 타일 획득).[NEWLINE][COLOR_CITY_BLUE]사막[ENDCOLOR]이 있는 평지에만 건설할 수 있습니다.[NEWLINE][COLOR_GREY]자원[ENDCOLOR] 위에는 건설할 수 없습니다.[NEWLINE][NEWLINE][COLOR_CITY_BROWN]도로[ENDCOLOR] 위에 건설 시 [ICON_PRODUCTION] 생산 +1, [COLOR_CITY_BROWN]철도[ENDCOLOR] 위에 건설 시 [ICON_PRODUCTION] 생산 +1 및 [ICON_GOLDEN_AGE] 황금기 점수 +1. 인접한 [COLOR_CITY_BROWN]장례 탑[ENDCOLOR]마다 [ICON_PEACE] 신앙 +1, 인접한 [COLOR_CITY_BROWN]장례 탑[ENDCOLOR] 2개마다 [ICON_CULTURE] 문화 +1. [COLOR_CITY_BROWN]장례 탑[ENDCOLOR] 건설 시 가장 가까운 도시에 영구적으로 [ICON_CULTURE_LOCAL] 국경 확장 점수 +1.[NEWLINE][NEWLINE]기술에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]문자[ENDCOLOR] 연구 시 [ICON_CULTURE] 문화 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]신학[ENDCOLOR] 연구 시 [ICON_PEACE] 신앙 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]건축[ENDCOLOR] 연구 시 [ICON_CULTURE] 문화 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]다이너마이트[ENDCOLOR] 연구 시 [ICON_PRODUCTION] 생산 +1[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_FUNERARY_TOWER', 			'장례 탑' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_FUNERARY_TOWER', 		'내용을 입력해주세요' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_FUNERARY_TOWER_HELP', 		'팔미라 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- monastery
	SELECT 'TXT_KEY_BUILD_MONASTERY', 						'수사원 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_MONASTERY_HELP', 					'[COLOR_CYAN]카리에스[ENDCOLOR]의 능력이 필요합니다.[NEWLINE]언덕에만 건설할 수 있습니다.[NEWLINE]다른 [COLOR_CITY_BROWN]수사원[ENDCOLOR], 도시 옆이나 [COLOR_GREY]자원[ENDCOLOR] 위에는 건설할 수 없습니다.[NEWLINE][NEWLINE][COLOR_CITY_BLUE]산[ENDCOLOR] 옆에 건설 시 [ICON_PEACE] 신앙 +1. 인접한 [COLOR_CITY_BROWN]마을[ENDCOLOR] 및 [COLOR_CITY_BROWN]소도시[ENDCOLOR]에서 [ICON_PRODUCTION] 생산 +1.[NEWLINE][NEWLINE]기술에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]건설[ENDCOLOR] 연구 시 [ICON_PEACE] 신앙 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]신학[ENDCOLOR] 연구 시 [ICON_CULTURE] 문화 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]과학 이론[ENDCOLOR] 연구 시 [ICON_TOURISM] 관광 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]전기[ENDCOLOR] 연구 시 [ICON_PEACE] 신앙 +1[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MONASTERY', 				'수사원' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MONASTERY', 			'수도원은 세속적인 재물을 멀리하고 기도와 헌신의 단순한 삶을 살기 위해 수도원장이 이끄는 수도사들의 폐쇄적이고 때로는 외딴 공동체였습니다. 기독교 수도원은 4세기에 이집트와 시리아에서 처음 발전했으며 5세기에는 서유럽으로 퍼져나갔습니다.[NEWLINE][NEWLINE]베네딕토회 수도회의 창시자이자 유럽 수도원 모델의 창시자인 누시아의 성 베네딕토(480년경-543년경)와 같은 인물은 수도사들이 지켜야 할 규칙을 정립했으며, 이러한 규칙은 오늘날 생존하는 수도원을 포함하여 이후 여러 세기 동안 다양한 수준으로 모방되고 따랐습니다.[NEWLINE][NEWLINE]수도원 회원들은 가난했지만 수도원 자체는 부유하고 강력한 기관이었으며, 기부받은 토지와 재산으로 부를 모았습니다. 수도원은 또한 젊은이들을 교육하는 중요한 배움의 중심지였으며, 오늘날 역사가들에게 가장 중요한 것은 중세 세계뿐만 아니라 고전 고대에 대한 우리의 지식을 크게 향상시킨 책을 힘들게 제작하고 고대 텍스트를 보존했다는 것입니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MONASTERY_HELP', 			'카리에스 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- mound
	SELECT 'TXT_KEY_BUILD_MOUND', 							'둔덕 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_MOUND_HELP', 						'[COLOR_CYAN]카호키아[ENDCOLOR]의 능력이 필요합니다.[NEWLINE]다른 [COLOR_CITY_BROWN]둔덕[ENDCOLOR] 옆이나 [COLOR_GREY]자원[ENDCOLOR] 위에는 건설할 수 없습니다.[NEWLINE][NEWLINE]도시 옆에 건설 시 [ICON_GOLDEN_AGE]황금기 점수 +1. 인접한 [COLOR_CITY_BROWN]마을[ENDCOLOR] 및 [COLOR_CITY_BROWN]소도시[ENDCOLOR]에서 [ICON_GOLD]골드 +1. [COLOR_CITY_BROWN]둔덕[ENDCOLOR]에 주둔한 유닛은 [ICON_STRENGTH]방어력 +15%.[NEWLINE][NEWLINE]기술에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]화폐[ENDCOLOR] 연구 시 [ICON_GOLD] 골드 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]길드[ENDCOLOR] 연구 시 [ICON_GOLD] 골드 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]건축[ENDCOLOR] 연구 시 [ICON_RESEARCH] 과학 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]군사 과학[ENDCOLOR] 연구 시 [ICON_GREAT_GENERAL] 위대한 장군 점수 +1[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MOUND', 					'둔덕' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MOUND', 				'운반된 흙과 점토로 지어진 피라미드입니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MOUND_HELP', 				'카호키아 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- phrourion
	SELECT 'TXT_KEY_BUILD_PHROURION', 						'프루리온 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_PHROURION_HELP', 					'[COLOR_CYAN]박트라[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][ICON_RES_IVORY] [COLOR_GREY]상아[ENDCOLOR]에 건설하여 연결할 수 있습니다.[NEWLINE][COLOR_POSITIVE_TEXT]담수[ENDCOLOR]에 인접해야 합니다.[NEWLINE]도시 옆이나 [COLOR_GREY]자원[ENDCOLOR] 위에는 건설할 수 없습니다.[NEWLINE][NEWLINE][COLOR_CITY_GREEN]숲[ENDCOLOR] 또는 [COLOR_CITY_GREEN]정글[ENDCOLOR]에 [COLOR_CITY_BROWN]프루리온[ENDCOLOR] 건설 시, 그 아래에 [ICON_RES_IVORY] [COLOR_GREY]상아[ENDCOLOR]가 생성됩니다. 공격 유닛은 적을 처치해도 [COLOR_CITY_BROWN]프루리온[ENDCOLOR]을 떠나지 않습니다. [COLOR_CITY_BROWN]프루리온[ENDCOLOR]에 주둔한 유닛은 [ICON_STRENGTH]방어력 +40%. 해군 유닛이 통과할 수 있는 [COLOR_POSITIVE_TEXT]운하[ENDCOLOR]를 생성합니다. [NEWLINE][NEWLINE]기술에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]수학[ENDCOLOR] 연구 시 [ICON_FOOD] 식량 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]기계[ENDCOLOR] 연구 시 [ICON_GREAT_GENERAL] 위대한 장군 점수 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]건축[ENDCOLOR] 연구 시 [ICON_GOLD] 골드 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]철도[ENDCOLOR] 연구 시 [ICON_PRODUCTION] 생산 +1[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_PHROURION', 				'프루리온' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_PHROURION', 			'내용을 입력해주세요' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_PHROURION_HELP', 			'박트라 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- ribat
	SELECT 'TXT_KEY_BUILD_RIBAT', 							'리바트 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_RIBAT_HELP', 						'[COLOR_CYAN]튀니스[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][COLOR_CITY_BLUE]사막[ENDCOLOR]에만 건설할 수 있습니다.[NEWLINE][COLOR_GREY]자원[ENDCOLOR] 위나 도시 옆에는 건설할 수 없습니다.[NEWLINE][NEWLINE][COLOR_CITY_BROWN]마을[ENDCOLOR] 또는 [COLOR_CITY_BROWN]소도시[ENDCOLOR] 옆에 건설 시 [ICON_CULTURE] 문화 +1. [COLOR_CITY_BROWN]도로[ENDCOLOR] 위에 건설 시 [ICON_PEACE] 신앙 +1, [COLOR_CITY_BROWN]철도[ENDCOLOR] 위에 건설 시 [ICON_GOLD] 골드 +1 및 [ICON_PEACE] 신앙 +1. [COLOR_CITY_BROWN]리바트[ENDCOLOR]에 주둔한 유닛은 [ICON_STRENGTH]방어력 +15%.[NEWLINE][NEWLINE]기술에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]공학[ENDCOLOR] 연구 시 [ICON_CULTURE] 문화 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]건축[ENDCOLOR] 연구 시 [ICON_PEACE] 신앙 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]군사 과학[ENDCOLOR] 연구 시 [ICON_PEACE] 신앙 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]합동 작전[ENDCOLOR] 연구 시 [ICON_GREAT_GENERAL] 위대한 장군 점수 +1[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_RIBAT', 					'리바트' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_RIBAT', 				'내용을 입력해주세요' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_RIBAT_HELP', 				'튀니스 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- torii (unfinished)
	SELECT 'TXT_KEY_BUILD_TORII', 							'도리이 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_TORII_HELP', 						'[COLOR_CYAN]이시야마[ENDCOLOR]의 능력이 필요합니다.[NEWLINE]도시 옆 언덕에만 건설할 수 있습니다.[NEWLINE][COLOR_GREY]자원[ENDCOLOR] 위에는 건설할 수 없습니다.[NEWLINE][NEWLINE][COLOR_CITY_BROWN]토루[ENDCOLOR] 건설 시 인접 도시에 [ICON_CITIZEN] 시민 +1. 공격 유닛은 적을 처치해도 [COLOR_CITY_BROWN]토루[ENDCOLOR]를 떠나지 않습니다. [COLOR_CITY_BROWN]토루[ENDCOLOR]에 주둔한 유닛은 [ICON_STRENGTH]방어력 +30%. 각 [COLOR_CITY_BROWN]토루[ENDCOLOR](약탈당해도)는 [ICON_SILVER_FIST] 군사 보급 한도를 1 증가시킵니다.[NEWLINE][NEWLINE]기술에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]공학[ENDCOLOR] 연구 시 [ICON_FOOD] 식량 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]공무원[ENDCOLOR] 연구 시 [ICON_PRODUCTION] 생산 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]건축[ENDCOLOR] 연구 시 [ICON_CULTURE] 문화 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]군사 복무[ENDCOLOR] 연구 시 [ICON_GREAT_GENERAL] 위대한 장군 점수 +1[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TORII', 					'도리이' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_TORII', 				'내용을 입력해주세요' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TORII_HELP', 				'이시야마 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- gyáa''aang (totem pole)
	SELECT 'TXT_KEY_BUILD_TOTEM_POLE', 						'갸앙 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_TOTEM_POLE_HELP', 				'[COLOR_CYAN]스구앵 과이[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][COLOR_CITY_BLUE]해안[ENDCOLOR], [COLOR_CITY_GREEN]호수[ENDCOLOR], 도시, [COLOR_CITY_BROWN]마을[ENDCOLOR] 또는 [COLOR_CITY_BROWN]소도시[ENDCOLOR]에 인접한 [COLOR_CITY_BLUE]툰드라[ENDCOLOR]에만 건설할 수 있습니다.[NEWLINE][COLOR_GREY]자원[ENDCOLOR] 위에는 건설할 수 없습니다.[NEWLINE][NEWLINE]도시, [COLOR_CITY_BROWN]마을[ENDCOLOR] 또는 [COLOR_CITY_BROWN]소도시[ENDCOLOR] 옆에 건설 시 [ICON_CULTURE] 문화 +1. 인접한 [COLOR_CITY_BROWN]갸앙[ENDCOLOR] 2개마다 [ICON_GOLDEN_AGE] 황금기 점수 +1. 인접한 [COLOR_CITY_BLUE]해안[ENDCOLOR]에서 [ICON_GOLDEN_AGE] 황금기 점수 +1.[NEWLINE][NEWLINE]기술에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]나침반[ENDCOLOR] 연구 시 [ICON_PRODUCTION] 생산 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]항해술[ENDCOLOR] 연구 시 [ICON_CULTURE] 문화 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]고고학[ENDCOLOR] 연구 시 [ICON_TOURISM] 관광 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]부품 교체[ENDCOLOR] 연구 시 [ICON_TOURISM] 관광 +1[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TOTEM_POLE', 				'갸앙' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_TOTEM_POLE', 			'토템 폴, 또는 하이다어로 갸아앙은 태평양 북서부에서 볼 수 있는 예술 및 문체 표현의 한 유형입니다. 토템 폴은 신화 속 인물과 사건을 상징하거나 최근의 조상 및 현존하는 사람들의 경험을 전달할 수 있습니다. 이러한 캐릭터 중 일부는 자연 속 사물을 문체적으로 표현한 것처럼 보이기도 하고, 더 사실적으로 조각된 캐릭터도 있습니다. 장대 조각에는 동물, 물고기, 식물, 곤충, 인간이 포함되거나 천둥새와 같은 초자연적인 존재를 나타낼 수 있습니다.[NEWLINE][NEWLINE]일반적으로 토템 폴이라고 불리는 직립형 기둥 조각에는 집 정면 기둥, 집 기둥, 장례식장 기둥, 기념 기둥, 환영 기둥, 수치/조롱 기둥 등 6가지 기본 유형이 있습니다. 각 문화권에는 일반적으로 기둥에 표시되는 전통적인 디자인에 관한 복잡한 규칙과 관습이 있습니다.[NEWLINE][NEWLINE]디자인은 일반적으로 특정 씨족 또는 전통 조각가 집단의 재산으로 간주되며, 이러한 디자인의 소유권은 조각을 의뢰한 사람에게 양도할 수 없습니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TOTEM_POLE_HELP', 			'스구앵 과이 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- tulou
	SELECT 'TXT_KEY_BUILD_TULOU', 							'토루 건설'  UNION ALL
	SELECT 'TXT_KEY_BUILD_TULOU_HELP', 						'[COLOR_CYAN]룽옌[ENDCOLOR]의 능력이 필요합니다.[NEWLINE]도시 옆 언덕에만 건설할 수 있습니다.[NEWLINE][COLOR_GREY]자원[ENDCOLOR] 위에는 건설할 수 없습니다.[NEWLINE][NEWLINE][COLOR_CITY_BROWN]토루[ENDCOLOR] 건설 시 인접 도시에 [ICON_CITIZEN] 시민 +1. 공격 유닛은 적을 처치해도 [COLOR_CITY_BROWN]토루[ENDCOLOR]를 떠나지 않습니다. [COLOR_CITY_BROWN]토루[ENDCOLOR]에 주둔한 유닛은 [ICON_STRENGTH]방어력 +30%. 각 [COLOR_CITY_BROWN]토루[ENDCOLOR](약탈당해도)는 [ICON_SILVER_FIST] 군사 보급 한도를 1 증가시킵니다.[NEWLINE][NEWLINE]기술에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_CYAN]공학[ENDCOLOR] 연구 시 [ICON_FOOD] 식량 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]공무원[ENDCOLOR] 연구 시 [ICON_PRODUCTION] 생산 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]건축[ENDCOLOR] 연구 시 [ICON_CULTURE] 문화 +1[NEWLINE][ICON_BULLET][COLOR_CYAN]군사 복무[ENDCOLOR] 연구 시 [ICON_GREAT_GENERAL] 위대한 장군 점수 +1[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TULOU', 					'토루' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_TULOU', 				'내용을 입력해주세요' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TULOU_HELP', 				'룽옌 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
	-- dogo canario
	SELECT 'TXT_KEY_BUILD_DOGO_CANARIO', 					'[ICON_RES_DOGO_CANARIO] 도고 카나리오 배치'  UNION ALL
	SELECT 'TXT_KEY_BUILD_DOGO_CANARIO_HELP', 				'[COLOR_CYAN]아데헤[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][COLOR_CITY_BLUE]평원[ENDCOLOR] 또는 [COLOR_CITY_BLUE]초원[ENDCOLOR]이 있는 언덕에만 배치할 수 있습니다.[NEWLINE]다른 [COLOR_GREY]도고 카나리오[ENDCOLOR] 옆에는 배치할 수 없습니다.[NEWLINE][NEWLINE][COLOR_CITY_BROWN]야영지[ENDCOLOR]로 개선할 수 있는 [ICON_RES_DOGO_CANARIO] [COLOR_GREY]도고 카나리오[ENDCOLOR]를 번식시키는 데 도움이 됩니다.[NEWLINE][NEWLINE]인접한 [COLOR_CITY_BROWN]목장[ENDCOLOR] 및 [COLOR_CITY_BROWN]다크 아[ENDCOLOR]에서 [ICON_FOOD] 식량 +1, [ICON_GOLD] 골드 +1.[NEWLINE][NEWLINE]건물에 따른 산출량 변화:[NEWLINE][ICON_BULLET][COLOR_YIELD_FOOD]농업 기업[ENDCOLOR] 건설 시 [ICON_PRODUCTION] 생산 +2[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_DOGO_CANARIO', 				'도고 카나리오' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_DOGO_CANARIO', 		'도고 카나리오는 카나리아 제도에 서식하는 개 품종으로 머리가 넓고 근육질의 몸을 가진 희귀견입니다. 도고 카나리오는 신화, 장례 풍습, 심지어 구안치의 식단에서도 중요한 역할을 담당했습니다. 일부는 주인과 함께 미라로 만들어지기도 했습니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_DOGO_CANARIO_HELP', 		'아데헤 문명과 동맹을 맺어야만 이 강아지의 아름다움을 누릴 수 있습니다.' UNION ALL
	-- llao llao
	SELECT 'TXT_KEY_BUILD_LLAO_LLAO', 						'[ICON_RES_LLAO_LLAO] 야오야오 배치'  UNION ALL
	SELECT 'TXT_KEY_BUILD_LLAO_LLAO_HELP', 					'[COLOR_CYAN]야이우아[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][COLOR_CITY_GREEN]숲[ENDCOLOR] 또는 [COLOR_CITY_GREEN]정글[ENDCOLOR]이 있는 해안 타일에만 배치할 수 있습니다.[NEWLINE][NEWLINE][COLOR_CITY_BROWN]농장[ENDCOLOR]으로 자동 개선되는 [ICON_RES_LLAO_LLAO] [COLOR_GREY]야오야오[ENDCOLOR] 균사체를 받을 나무를 준비합니다.[NEWLINE][NEWLINE]작업 반경 내 모든 도시에서 [ICON_RESEARCH] 과학 +1.[NEWLINE]' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_LLAO_LLAO', 				'야오야오' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_LLAO_LLAO', 			'내용을 입력해주세요' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_LLAO_LLAO_HELP', 			'야이우아 문명과 동맹을 맺어야만 이 아름다운 건축물을 즐길 수 있습니다.' UNION ALL
-- resources
SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO',					'도고 카나리오' UNION ALL
SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO_TEXT',			'도고 카나리오는 카나리아 제도에 서식하는 개 품종으로 머리가 넓고 근육질의 몸을 가진 희귀견입니다. 도고 카나리오는 신화, 장례 풍습, 심지어 구안치의 식단에서 중요한 역할을 담당했습니다. 일부는 주인과 함께 미라로 만들어지기도 했습니다.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO_MONOPOLY',		'[COLOR_CYAN]아데헤[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 제국 전체에 [ICON_FOOD] 식량 +3%, [ICON_PRODUCTION] 생산 +3%.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO_MONOPOLY_FULL',	'Requires an access to [COLOR_CYAN]Adeje[ENDCOLOR]''s ability to be finished.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +3% [ICON_FOOD] Food and +3% [ICON_PRODUCTION] Production in all owned Cities.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_LLAO_LLAO',					'야오야오' UNION ALL
SELECT 'TXT_KEY_RESOURCE_LLAO_LLAO_TEXT',				'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_RESOURCE_LLAO_LLAO_MONOPOLY',			'[COLOR_CYAN]야이우아[ENDCOLOR]의 능력이 필요합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 제국 전체에 [ICON_FOOD] 식량 +3%, [ICON_HAPPINESS_1] 행복 +2.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_LLAO_LLAO_MONOPOLY_FULL',	'Requires an access to [COLOR_CYAN]Yaiuwa[ENDCOLOR]''s ability to be placed.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +3% [ICON_FOOD] Food in all owned Cities. +2 [ICON_HAPPINESS_1] Empire-Wide Happiness.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_REINDEER',						'순록' UNION ALL
SELECT 'TXT_KEY_RESOURCE_REINDEER_TEXT',				'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_RESOURCE_REINDEER_MONOPOLY',			'[COLOR_CYAN]카라쇼카[ENDCOLOR]의 능력이 필요합니다.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_COINS',						'주화' UNION ALL
SELECT 'TXT_KEY_RESOURCE_COINS_TEXT',					'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_RESOURCE_COINS_MONOPOLY',				'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] [ICON_GOLD] 구매 비용 -10%.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_COINS_MONOPOLY_FULL',		'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] -10% [ICON_GOLD] Gold Purchase Cost.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_GUNPOWDER',					'화약' UNION ALL
SELECT 'TXT_KEY_RESOURCE_GUNPOWDER_TEXT',				'화약의 발명은 일반적으로 당나라 시대 중국 연금술사들에게 귀속되며, "중국의 4대 발명품" 중 하나입니다. 가장 오래된 기록인 송나라 후기의 유황, 숯, 질산칼륨으로 구성된 공식은 불멸의 비약으로 여겨졌지만... 전혀 그렇지 않았습니다. 하지만 중국인들은 그것이 폭발적으로 연소하고 생성된 가스가 열에 노출되면 빠르게 팽창한다는 것을 발견했습니다. 그래서 불꽃놀이를 만드는 데 유용했습니다. 중국인들은 화약을 조잡한 폭탄과 로켓에 더 실용적으로 사용하여 몽골에 대항했습니다... 몽골이 중국을 점령하고 서쪽으로 가는 길에 만나는 모든 사람에게 새로운 무기를 사용할 때까지 말이죠.[NEWLINE][NEWLINE]몽골인들이 화약을 사용하여 마주치는 유럽인들을 위협하는 동안, 아랍인들은 1240년에서 1280년 사이에 더 나은 조리법, 더 순수한 질산염, 그리고 더 치명적인 무기, 특히 대포와 원시적인 아쿼버스를 개발했습니다. 일부 역사 문헌에 따르면 맘루크 왕조는 1260년 아인 잘루트 전투에서 몽골에 대항하여 역사상 최초의 대포를 사용했다고 하지만, 이는 논란의 여지가 있습니다. 그러나 "휴대용 수포"에 대한 가장 오래된 설명은 14세기 아랍어 필사본에 나타납니다. 몽골을 물리친 후, 아랍인들은 이것을 다른 곳에서 사용했습니다.[NEWLINE][NEWLINE]하지만 대량 학살의 수단으로 화약을 진정으로 받아들인 것은 유럽인들이었습니다. 그들은 공식을 개선하고 "코닝"(액체를 사용하여 입도를 높여 안정성을 높이는 것)과 "무연 화약"과 같은 기술을 추가했을 뿐만 아니라, 그것을 사용하여 작고 큰 납과 철 조각을 사람들에게 던지는 온갖 종류의 장난감을 만들었습니다. 르네상스 시대부터 유럽의 군사 역사는 화약에 의해 형성되었으며, 이전의 어떤 기술과도 비교할 수 없을 정도로 전장을 지배하게 되었습니다.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_GUNPOWDER_MONOPOLY',			'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 제국 전체에 화약 유닛 생산 시 [ICON_PRODUCTION] 생산 +5%.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_GUNPOWDER_MONOPOLY_FULL',	'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +5% [ICON_PRODUCTION] Production towards Gunpowder Units in all owned Cities.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_BEER',							'맥주' UNION ALL
SELECT 'TXT_KEY_RESOURCE_BEER_TEXT',					'맥주는 세계에서 가장 오래되고 가장 널리 소비되는 알코올 음료 중 하나입니다. 또한 물과 차에 이어 세 번째로 인기 있는 음료입니다. 맥주는 곡물로 양조되며, 가장 일반적으로는 맥아 보리로 만들지만 밀, 옥수수, 쌀도 사용됩니다. 양조 과정에서 맥아즙의 전분당이 발효되어 맥주에 에탄올과 탄산이 생성됩니다.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_BEER_MONOPOLY',				'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 제국 전체에 [ICON_GREAT_ENGINEER] 위대한 기술자 점수 +10%.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_BEER_MONOPOLY_FULL',			'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_GREAT_ENGINEER] Great Engineer Points in all owned Cities.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_CHEESE',						'치즈' UNION ALL
SELECT 'TXT_KEY_RESOURCE_CHEESE_TEXT',					'치즈는 우유 단백질인 카제인의 응고에 의해 다양한 맛, 질감, 형태로 생산되는 유제품입니다. 다양한 국가에서 천 가지가 넘는 종류의 치즈가 생산됩니다. 그들의 스타일, 질감, 맛은 우유의 원산지(동물의 식단 포함), 저온 살균 여부, 버터 지방 함량, 박테리아 및 곰팡이, 가공 및 숙성에 따라 달라집니다. 치즈는 휴대성, 긴 유통기한, 높은 지방, 단백질, 칼슘, 인 함량으로 인해 가치가 있습니다.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_CHEESE_MONOPOLY',				'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 모든 [ICON_RES_COW] 소와 [ICON_RES_SHEEP] 양에서 [ICON_PRODUCTION] 생산 +2.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_CHEESE_MONOPOLY_FULL',		'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +2 [ICON_PRODUCTION] Production from all [ICON_RES_COW] Cattle and [ICON_RES_SHEEP] Sheep resources.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_HONEY',						'꿀' UNION ALL
SELECT 'TXT_KEY_RESOURCE_HONEY_TEXT',					'꿀은 벌과 일부 관련 곤충이 만드는 달콤하고 점성이 있는 식품입니다. 벌은 식물의 당분 분비물(꽃꿀)이나 다른 곤충의 분비물(감로)을 역류, 효소 활동, 수분 증발을 통해 꿀을 생산합니다. 벌은 벌집이라는 밀랍 구조에 꿀을 저장합니다. 꿀 사용과 생산은 고대 활동으로서 길고 다양한 역사를 가지고 있습니다. 스페인의 쿠에바스 데 라 아라냐에 있는 여러 동굴 벽화에는 적어도 8,000년 전에 꿀을 채집하는 인간의 모습이 묘사되어 있습니다.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_HONEY_MONOPOLY',				'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 모든 [ICON_RES_MAIZE] 옥수수, [ICON_RES_RICE] 쌀, [ICON_RES_WHEAT] 밀에서 [ICON_GOLD] 골드 +1.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_HONEY_MONOPOLY_FULL',		'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_GOLD] Gold from all [ICON_RES_MAIZE] Maize, [ICON_RES_RICE] Rice and [ICON_RES_WHEAT] Wheat resources.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_ROPES',						'밧줄' UNION ALL
SELECT 'TXT_KEY_RESOURCE_ROPES_TEXT',					'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_RESOURCE_ROPES_MONOPOLY',				'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 제국 전체에 해군 유닛 생산 시 [ICON_PRODUCTION] 생산 +10%.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_ROPES_MONOPOLY_FULL',		'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_PRODUCTION] Production towards Naval Units in all owned Cities.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_TAPESTRIES',					'태피스트리' UNION ALL
SELECT 'TXT_KEY_RESOURCE_TAPESTRIES_TEXT',				'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_RESOURCE_TAPESTRIES_MONOPOLY',			'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 궁전, 모든 종교 건물, 성에서 [ICON_CULTURE] 문화 +1.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_TAPESTRIES_MONOPOLY_FULL',	'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_CULTURE] Culture to Palace, all Religious Buildings and Castles.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_SCULPTURES',					'조각품' UNION ALL
SELECT 'TXT_KEY_RESOURCE_SCULPTURES_TEXT',				'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_RESOURCE_SCULPTURES_MONOPOLY',			'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 제국 전체에 [ICON_GREAT_ARTIST] 위대한 예술가 점수 +10%.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_SCULPTURES_MONOPOLY_FULL',	'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_GREAT_ARTIST] Great Artist Points in all owned Cities.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_CHAMPAGNE',					'샴페인' UNION ALL
SELECT 'TXT_KEY_RESOURCE_CHAMPAGNE_TEXT',				'샴페인은 프랑스 스파클링 와인입니다. 많은 사람들이 샴페인이라는 용어를 스파클링 와인의 일반적인 용어로 사용하지만, EU 및 일부 다른 국가에서는 프랑스 샹파뉴 지역에서 생산되고 해당 명칭의 규칙에 따라 생산되지 않은 제품에 샴페인이라는 라벨을 붙이는 것은 불법입니다.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_CHAMPAGNE_MONOPOLY',			'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 모든 사치 자원에서 [ICON_GOLDEN_AGE] 황금기 점수 +1.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_CHAMPAGNE_MONOPOLY_FULL',	'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_GOLDEN_AGE] Golden Age Point from all Luxury Resources.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_MANUSCRIPTS',					'필사본' UNION ALL
SELECT 'TXT_KEY_RESOURCE_MANUSCRIPTS_TEXT',				'필사본 또는 수서는 인쇄되거나 다른 방식으로 복제된 것이 아니라 한 명 이상의 사람이 수동으로 만든 서면 정보입니다. 이 용어는 또한 글쓰기 이외의 다른 방식으로 손으로 기록된 정보, 예를 들어 단단한 재료에 새겨진 비문이나 석고에 칼끝으로 긁은(그래피티의 원래 의미) 또는 밀랍판에 첨필로 쓴(로마인이 메모를 하던 방식) 또는 굽지 않은 점토판에 뾰족한 첨필로 찍은 설형 문자 쓰기와 같은 정보에도 사용될 수 있습니다.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_MANUSCRIPTS_MONOPOLY',			'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] [ICON_RES_PAPER] 종이 +1. 제국 전체에 외교 유닛 생산 시 [ICON_PRODUCTION] 생산 +10%.' UNION ALL
--SELECT 'TXT_KEY_RESOURCE_MANUSCRIPTS_MONOPOLY_FULL',	'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_RES_PAPER] Paper. +10% [ICON_PRODUCTION] Production towards Diplomatic Units in all owned Cities.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_MOSAICS',						'모자이크' UNION ALL
SELECT 'TXT_KEY_RESOURCE_MOSAICS_TEXT',					'내용을 입력해주세요' UNION ALL
SELECT 'TXT_KEY_RESOURCE_MOSAICS_MONOPOLY',				'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 모든 성지에서 [ICON_CULTURE] 문화 +1 및 [ICON_PEACE] 신앙 +1.';
--SELECT 'TXT_KEY_RESOURCE_MOSAICS_MONOPOLY_FULL',		'[COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +1 [ICON_CULTURE] Culture and +1 [ICON_PEACE] Faith from all Holy Sites.';

INSERT INTO Language_ko_KR (Tag, Text)
-- cs traits/buildings/policies
SELECT 'TXT_KEY_MARITIME_BONUS', 						'[COLOR:90:205:40:255]건축가 (해양적):[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_WORKER] [COLOR_CITY_BROWN]제조소[ENDCOLOR]와 추가 [COLOR_GREY]보너스 자원[ENDCOLOR]을 가짐'  UNION ALL
SELECT 'TXT_KEY_MARITIME_FRIENDLY_BONUS', 					'[COLOR:200:240:140:255]수확자 (해양적 우호적):[ENDCOLOR][NEWLINE][ICON_BULLET]1%의 확률로 우호적인 영토 내에 [COLOR_YIELD_GOLD]노동자[ENDCOLOR] 또는 [COLOR_YIELD_GOLD]어선[ENDCOLOR] 생성 (수도가 해안 도시여야 어선 획득)'  UNION ALL
SELECT 'TXT_KEY_MARITIME_NEUTRAL_BONUS', 					'[COLOR:110:160:70:255]보안 창고 (해양적 중립적):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
SELECT 'TXT_KEY_MARITIME_HOSTILE_BONUS', 					'[COLOR:60:125:40:255]탐욕스런 수집가 (해양적 배타적):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
SELECT 'TXT_KEY_MARITIME_IRRATIONAL_BONUS', 				'[COLOR:160:255:85:255]밀수업자 (해양적 불가해함):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
-------------------------------------------------
SELECT 'TXT_KEY_MERCANTILE_BONUS', 						'[COLOR:240:215:65:255]무역 센터 (상업적):[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_CITY_STATE] [COLOR_CITY_BROWN]소도시[ENDCOLOR]와 추가 [COLOR_GREY]사치 자원[ENDCOLOR]을 가짐'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_FRIENDLY_BONUS', 				'[COLOR:240:240:165:255]황금의 도시 (상업적 우호적):[ENDCOLOR][NEWLINE][ICON_BULLET]1%의 확률로 우호적인 영토 내에 [ICON_CARAVAN] [COLOR_YIELD_GOLD]대상[ENDCOLOR] 또는  [ICON_CARGO_SHIP] [COLOR_YIELD_GOLD]무역선[ENDCOLOR] 생성 (수도가 해안 도시여야 [ICON_CARGO_SHIP] 무역선 획득)'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_NEUTRAL_BONUS', 					'[COLOR:210:210:70:255]그림자 의회 (상업적 중립적):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_HOSTILE_BONUS', 					'[COLOR:130:130:20:255]자유 도시 (상업적 배타적):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_IRRATIONAL_BONUS', 				'[COLOR:255:255:120:255]암시장 (상업적 불가해함):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
-------------------------------------------------
SELECT 'TXT_KEY_MILITARISTIC_BONUS', 					'[COLOR:245:40:40:255]요새 (군사적):[ENDCOLOR][NEWLINE][ICON_BULLET] [ICON_WAR] [COLOR_CITY_BROWN]요새[ENDCOLOR]와 추가 [COLOR_GREY]전략 자원[ENDCOLOR]을 가짐[NEWLINE][ICON_BULLET] 고유 유닛 훈련 가능'  UNION ALL -- [NEWLINE][ICON_BULLET]Major Player can upgrade his units inside their territory, if Allied
SELECT 'TXT_KEY_MILITARISTIC_FRIENDLY_BONUS', 				'[COLOR:255:180:180:255]용병 허브 (군사적 우호적):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_NEUTRAL_BONUS', 				'[COLOR:245:90:90:255]고용된 군대 (군사적 중립적):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_HOSTILE_BONUS', 				'[COLOR:170:10:10:255]숨은 용 (군사적 배타적):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_IRRATIONAL_BONUS', 			'[COLOR:210:160:160:255]그림자 의회 (군사적 불가해함):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
-------------------------------------------------
SELECT 'TXT_KEY_CULTURED_BONUS', 						'[COLOR:210:65:200:255]학습의 장 (문화적):[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_RESEARCH] [COLOR_CITY_BROWN]아카데미[ENDCOLOR]와 [ICON_RES_ARTIFACTS] 고고학 유적지를 가짐[NEWLINE][ICON_BULLET]0.5%의 확률로 우호 또는 동맹에게 [ICON_GREAT_WORK] 걸작 생성'  UNION ALL
SELECT 'TXT_KEY_CULTURED_FRIENDLY_BONUS', 					'[COLOR:240:180:235:255]열린 대학 (문화적 우호적):[ENDCOLOR][NEWLINE][ICON_BULLET]1%의 확률로 우호적인 영토 내에 [ICON_VP_ARTIFACT] [COLOR_YIELD_GOLD]고고학자[ENDCOLOR] 생성 (고고학 연구 이후)'  UNION ALL
SELECT 'TXT_KEY_CULTURED_NEUTRAL_BONUS', 					'[COLOR:210:90:195:255]후원자 (문화적 중립적):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
SELECT 'TXT_KEY_CULTURED_HOSTILE_BONUS', 					'[COLOR:130:30:115:255]은둔 법원 (문화적 배타적):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
SELECT 'TXT_KEY_CULTURED_IRRATIONAL_BONUS', 				'[COLOR:255:125:240:255]점쟁이 (문화적 불가해함):[ENDCOLOR][NEWLINE][ICON_BULLET]능력 없음'  UNION ALL
-------------------------------------------------
SELECT 'TXT_KEY_RELIGIOUS_BONUS', 						'[COLOR:25:110:250:255]신앙의 중심 (종교적):[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_RELIGION] [COLOR_CITY_BROWN]성지[ENDCOLOR]를 가짐'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_FRIENDLY_BONUS', 					'[COLOR:160:220:250:255]열린 정신 (종교적 우호적):[ENDCOLOR][NEWLINE][ICON_BULLET]1%의 확률로 우호적인 영토 내에 [ICON_MISSIONARY] [COLOR_YIELD_GOLD]선교사[ENDCOLOR] 생성[NEWLINE][ICON_BULLET][ICON_PEACE] 종교 압력 +10%[NEWLINE][ICON_BULLET][ICON_PEACE] 개종 저항 -25%'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_NEUTRAL_BONUS', 					'[COLOR:105:155:230:255]탁발 수도회 (종교적 중립적):[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_PEACE] 종교 압력 +25%'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_HOSTILE_BONUS', 					'[COLOR:25:110:170:255]유일한 진리 (종교적 배타적):[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_PEACE] 종교 압력 +40%[NEWLINE][ICON_BULLET] [ICON_PEACE] 개종 저항 +25%'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_IRRATIONAL_BONUS', 				'[COLOR:50:130:255:255]숨겨진 수도원 (종교적 불가해함):[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_PEACE] 종교 압력 +30%[NEWLINE][ICON_BULLET][ICON_PEACE] 개종 저항 -15%'  UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_FRIENDLY', 			'작은 체력 부스트' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_FRIENDLY_HELP', 			'도시 체력 +1.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL', 				'중간 체력 부스트' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL_HELP', 			'도시 체력 +2.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE', 				'큰 체력 부스트' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE_HELP', 			'도시 체력 +3' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_FRIENDLY', 			'작은 영향력 부스트' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_FRIENDLY_HELP', 			'[ICON_PEACE] 종교 압력 +10% [ICON_PEACE] 개종 저항 -25%' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL', 				'중간 영향력 부스트' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL_HELP', 			'[ICON_PEACE] 종교 압력 +25%' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE', 				'큰 영향력 부스트' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE_HELP', 			'[ICON_PEACE] 종교 압력 +40%[NEWLINE][ICON_BULLET] [ICON_PEACE] 개종 저항 -25%' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_IRRATIONAL', 			'미정된 영향력 부스트' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_IRRATIONAL_HELP', 			'[ICON_PEACE] 종교 압력 +30% [ICON_PEACE] 개종 저항 -15%' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_MARITIME', 							'건축가' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_MERCANTILE', 							'무역 센터' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_MILITARISTIC', 						'요새' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_CULTURED', 							'학습의 장' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_RELIGIOUS', 							'신앙의 중심';

INSERT INTO Language_ko_KR (Tag, Text)
-- regular buildings
SELECT 'TXT_KEY_BUILDING_ARMAGH1', 						'성 게일' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH1_HELP', 				'[COLOR_CYAN]아마[ENDCOLOR]와 동맹 관계를 유지해야 합니다.[NEWLINE][NEWLINE]+5% [ICON_CULTURE] 문화, 그리고 각 [COLOR_YIELD_FOOD]나옴 가엘라흐[ENDCOLOR]마다 이 보너스가 1%씩 추가로 증가합니다. [ICON_HAPPINESS_3] 무료를 감소시킵니다.[NEWLINE][NEWLINE]10턴 동안 [ICON_HAPPINESS_1] 국왕 경축일을 시작합니다.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH2', 						'성 브랜든' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH2_HELP', 				'[COLOR_CYAN]아마[ENDCOLOR]와 동맹 관계를 유지해야 합니다.[NEWLINE][NEWLINE]+5% [ICON_RESEARCH] 과학, 그리고 각 [COLOR_YIELD_FOOD]나옴 브렌단[ENDCOLOR]마다 이 보너스가 1%씩 추가로 증가합니다. [ICON_HAPPINESS_3] 문맹을 감소시킵니다.[NEWLINE][NEWLINE]10턴 동안 [ICON_HAPPINESS_1] 국왕 경축일을 시작합니다.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH3', 						'성 패트릭' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH3_HELP', 				'[COLOR_CYAN]아마[ENDCOLOR]와 동맹 관계를 유지해야 합니다.[NEWLINE][NEWLINE]+5% [ICON_GOLD] 골드, 그리고 각 [COLOR_YIELD_FOOD]나옴 파드라그[ENDCOLOR]마다 이 보너스가 1%씩 추가로 증가합니다. [ICON_HAPPINESS_3] 빈곤을 감소시킵니다.[NEWLINE][NEWLINE]10턴 동안 [ICON_HAPPINESS_1] 국왕 경축일을 시작합니다.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH4', 						'성 브리지드' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH4_HELP', 				'[COLOR_CYAN]아마[ENDCOLOR]와 동맹 관계를 유지해야 합니다.[NEWLINE][NEWLINE]+2% [ICON_FOOD] 식량 및 +2% [ICON_PRODUCTION] 생산, 그리고 각 [COLOR_YIELD_FOOD]나옴 브리드[ENDCOLOR]마다 이 보너스가 1%씩 추가로 증가합니다. [ICON_HAPPINESS_3] 낙후를 감소시킵니다.[NEWLINE][NEWLINE]10턴 동안 [ICON_HAPPINESS_1] 국왕 경축일을 시작합니다.' UNION ALL
SELECT 'TXT_KEY_BUILDING_JERUSALEM', 					'성스러운 도시' UNION ALL
SELECT 'TXT_KEY_BUILDING_JERUSALEM_HELP', 				'동맹의 대중 종교를 채택한 후 건설됩니다.[NEWLINE][NEWLINE]이 도시가 성도가 됩니다. 많은 사람들이 그들의 종교를 위해 이 도시를 순례했습니다. [NEWLINE][NEWLINE][ICON_PEACE] 종교 압력 +100%' UNION ALL
SELECT 'TXT_KEY_BUILDING_KIEV', 						'빌리나' UNION ALL
SELECT 'TXT_KEY_BUILDING_KIEV_HELP', 					'[COLOR_POSITIVE_TEXT]키예프[ENDCOLOR]와 동맹 관계를 유지해야 합니다. [ICON_GREAT_MUSICIAN] +2, 음악가 슬롯 +1. [ICON_GREAT_WORK] 위대한 음악 걸작 슬롯 1개. 도시의 전문가 1명이 더 이상 [ICON_HAPPINESS_3] 도시화로 인한 불행을 생성하지 않습니다.' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILAN', 						'비스콘티 저택' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILAN_HELP', 					'[COLOR_POSITIVE_TEXT]밀란[ENDCOLOR]과 동맹 관계를 유지해야 합니다. [ICON_GREAT_ARTIST] +2, 예술가 슬롯 +1. [ICON_GREAT_WORK] 위대한 예술품 또는 유물 슬롯 1개. 도시의 전문가 1명이 더 이상 [ICON_HAPPINESS_3] 도시화로 인한 불행을 생성하지 않습니다.' UNION ALL
SELECT 'TXT_KEY_BUILDING_VILNIUS', 						'여명의 문' UNION ALL
SELECT 'TXT_KEY_BUILDING_VILNIUS_HELP', 				'[COLOR_POSITIVE_TEXT]빌뉴스[ENDCOLOR]와 동맹 관계를 유지해야 합니다. [ICON_GREAT_WRITER] +2, 작가 슬롯 +1. [ICON_GREAT_WORK] 위대한 문학 걸작 슬롯 1개. 도시의 전문가 1명이 더 이상 [ICON_HAPPINESS_3] 도시화로 인한 불행을 생성하지 않습니다.' UNION ALL
SELECT 'TXT_KEY_BUILDING_RISHIKESH', 					'아쉬람' UNION ALL
SELECT 'TXT_KEY_BUILDING_RISHIKESH_HELP', 				'[COLOR_POSITIVE_TEXT]리시케시[ENDCOLOR]와 동맹 관계를 유지해야 합니다. 작업 가능한 산 타일마다 [ICON_PEACE] 신앙 +1, [ICON_TOURISM] 관광 +1을 얻습니다.[ICON_HAPPINESS_3] 종교 불안, 도시화, 무료 -1.' UNION ALL
SELECT 'TXT_KEY_BUILDING_VALLETTA', 					'대항만' UNION ALL
SELECT 'TXT_KEY_BUILDING_VALLETTA_HELP', 				'[COLOR_POSITIVE_TEXT]발레타[ENDCOLOR]와 동맹 관계를 유지해야 합니다. 도시 주변에 어선이 건설된 해양 자원이 있어야 합니다.  [ICON_FOOD] +2, [ICON_RESEARCH] +2. 모든 해상 유닛의 경험치가 [COLOR_POSITIVE_TEXT]15[ENDCOLOR] 증가합니다. 도시 체력이 +25 증가합니다.' UNION ALL
-- world wonders
SELECT 'TXT_KEY_BUILDING_LHASA', 						'포탈라 궁' UNION ALL
SELECT 'TXT_KEY_BUILDING_LHASA_HELP', 					'[ICON_CULTURE]문화와 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR], [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 추가 대표단 [COLOR_POSITIVE_TEXT]1명[ENDCOLOR]을 확보합니다. 세계 의회가 열릴 때까지 [COLOR_POSITIVE_TEXT]라사[ENDCOLOR]와 동맹 관계를 유지해야 합니다. 동맹이 없으면 수확량 조정치가 절반으로 줄어듭니다.' UNION ALL
SELECT 'TXT_KEY_BUILDING_LHASA_QUOTE', 					'[NEWLINE][TAB][TAB]"내가 포탈라 궁의 옥상에 처음 발을 디뎠을 때, 이전에 느껴보지 못했고 이후로도 느껴보지 못한 신기한 느낌을 받았다. 내가 방문해보지 않은 무슨 의식의 차원 같은, 마치 내 존재의 옥상에 발을 디딘 것 같았다."[NEWLINE] – 피코 아이어';
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

INSERT INTO Language_ko_KR
			(Tag, 										Text)
SELECT		'TXT_KEY_RESOURCE_GLASS_MONOPOLY',			'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 현재 적용 중인 모든 행복 또는 고정 산출량 [ICON_VP_MONOPOLY] 글로벌 독점 보너스에 추가 +1 보너스를, 백분율 기반 [ICON_VP_MONOPOLY] 글로벌 독점 보너스에 추가 +1% 보너스를 얻습니다.' UNION ALL
SELECT		'TXT_KEY_RESOURCE_JEWELRY_MONOPOLY',		'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 모든 소유 도시에서 [ICON_GREAT_MERCHANT] 위대한 상인 점수 +10%.' UNION ALL
SELECT		'TXT_KEY_RESOURCE_PORCELAIN_MONOPOLY',		'[COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 모든 소유 도시에서 고고학자 유닛 생산 시 [ICON_PRODUCTION] 생산 +15%.';

UPDATE Resources SET Help = 'TXT_KEY_RESOURCE_GLASS_MONOPOLY' WHERE Type IN ('RESOURCE_GLASS');
UPDATE Resources SET Help = 'TXT_KEY_RESOURCE_JEWELRY_MONOPOLY' WHERE Type IN ('RESOURCE_JEWELRY');
UPDATE Resources SET Help = 'TXT_KEY_RESOURCE_PORCELAIN_MONOPOLY' WHERE Type IN ('RESOURCE_PORCELAIN');
---------------------------------------------------------
UPDATE Language_ko_KR SET Text = Text||'[NEWLINE][NEWLINE]인근 [ICON_RES_DOGO_CANARIO]: [ICON_PRODUCTION] 생산 +2.' WHERE Tag = 'TXT_KEY_BUILDING_STOCKYARD_HELP';
UPDATE Language_ko_KR SET Text = Text||'[NEWLINE][NEWLINE]인근 [ICON_RES_REINDEER]: [ICON_FOOD] 식량 +2.' WHERE Tag = 'TXT_KEY_BUILDING_STABLE_HELP';
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
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]포탈라궁[ENDCOLOR]은 [COLOR_CYAN]라사[ENDCOLOR]와의 동맹에 크게 의존합니다 (+10%[ICON_FOOD]; +10%[ICON_CULTURE]; [COLOR_CYAN]라사[ENDCOLOR]와 동맹이 아닐 경우 절반). 특별한 외교 기술을 사용하여 양국 간의 유대를 강화합니다 ([COLOR_CYAN]라사[ENDCOLOR]에 대한 [COLOR_YIELD_GOLD]영향권[ENDCOLOR], +1[ICON_DIPLOMAT] 세계 의회 투표권).'
WHERE Tag = 'TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_POSITIVE_TEXT]라사[ENDCOLOR]와의 동맹과 [COLOR_POSITIVE_TEXT]세계 의회[ENDCOLOR]의 활성 회기가 필요합니다. ', '') WHERE Tag ='TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-HELP' AND Value= 0) AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_LHASA_HELP_CUT',			Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);
				
UPDATE Language_ko_KR SET Text = '특별: [COLOR_CYAN]라사 도시 국가 동맹[ENDCOLOR] 및 [COLOR_CYAN]세계 의회 활성 회기[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);
--============================================--
-- VP FIXES (copy from MW)
--============================================--
-- additional combat classes for promotions
INSERT OR REPLACE INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_UNITCOMBAT_SPECIAL_PEOPLE',		'위인'),
			('TXT_KEY_UNITCOMBAT_SPACESHIP_PART',		'우주선 부품'),
			('TXT_KEY_UNITCOMBAT_MISSILE',				'미사일'),
			('TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST',		'고고학자');

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
	foreign key (Description) references Language_ko_KR(Tag), 
	foreign key (Civilopedia) references Language_ko_KR(Tag), 
	foreign key (ShortDescription) references Language_ko_KR(Tag), 
	foreign key (Adjective) references Language_ko_KR(Tag), 
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
