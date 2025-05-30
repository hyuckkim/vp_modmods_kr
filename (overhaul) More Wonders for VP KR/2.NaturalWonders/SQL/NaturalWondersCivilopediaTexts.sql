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

INSERT INTO Language_ko_KR
			(Tag,										Text)
SELECT		'TXT_KEY_CIV5_FEATURES_NEW_REEF_A_TEXT',	Text	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT' UNION ALL
SELECT		'TXT_KEY_CIV5_FEATURES_NEW_REEF_B_TEXT',	Text	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT' UNION ALL
SELECT		'TXT_KEY_CIV5_FEATURES_NEW_REEF_C_TEXT',	Text	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT';
-----------------------------------------------------------
-- Goddess of Nature change for multi-tile Natural Wonders
-----------------------------------------------------------
UPDATE Language_en_US SET Text = REPLACE(Text, '+2 [ICON_CULTURE]', '+3 [ICON_CULTURE]') WHERE Tag ='TXT_KEY_BELIEF_ONE_WITH_NATURE';
UPDATE Language_en_US SET Text = Text||' (split propotionally between all tiles of multi-tile Natural Wonders)' WHERE Tag ='TXT_KEY_BELIEF_ONE_WITH_NATURE';

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]', '[ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR]') WHERE Tag ='TXT_KEY_BELIEF_ONE_WITH_NATURE';
UPDATE Language_ko_KR SET Text = Text||' (타일이 여러개인 자연 경관의 경우 모든 타일 간에 비례적으로 분할)' WHERE Tag ='TXT_KEY_BELIEF_ONE_WITH_NATURE';
-----------------------------------------------------------
-- One liners = Help texts (Game Info in Civilopedia)
-----------------------------------------------------------
UPDATE Language_en_US SET Text = 'Mythical fountain, whose water was believed to give everlasting youth to those drinking it.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_HELP';
UPDATE Language_en_US SET Text = 'Mythical city, believed to be hidden deep in the jungles of America, made of gold and full of riches Europeans searched for ages.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_HELP';
UPDATE Language_en_US SET Text = 'Volcano that is the highest peak in Africa and the highest single free-standing mountain above sea level in the world.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_HELP';

UPDATE Language_ko_KR SET Text = '물을 마시는 사람들에게 영원한 젊음을 준다고 믿었던 신화 속의 분수입니다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_HELP';
UPDATE Language_ko_KR SET Text = '아메리카의 정글 깊숙이 숨겨져 있다고 믿어지는 신화의 도시로 유럽인들이 오랫동안 찾아 헤매던 황금과 부로 가득합니다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_HELP';
UPDATE Language_ko_KR SET Text = '아프리카에서 가장 높은 봉우리이자 세계에서 가장 높은 독립된 산인 화산입니다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_HELP';

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
			('TXT_KEY_CIV5_FEATURES_SRI_PADA_HELP',			'Mountain that contains, what is believed to be, a footprint of a holy person by four different religions (Hinduism, Buddhism, Islam and Indian Christianity).'),
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
			('TXT_KEY_CIV5_FEATURES_BLUE_HOLE_HELP',		'Giant marine sinkhole surrounded by coral reefs and atolls.');
			
INSERT INTO Language_ko_KR
			(Tag,											Text)
VALUES		('TXT_KEY_CIV5_FEATURES_CRATER_HELP',			'세계에서 가장 크고, 확실히 가장 잘 보존된 운석 분화구입니다.'),
			('TXT_KEY_CIV5_FEATURES_FUJI_HELP',				'가장 서사적이고 아름다운 원추형의 화산은 많은 예술가들에게 영감을 줍니다.'),
			('TXT_KEY_CIV5_FEATURES_MESA_HELP',				'세계에서 가장 큰 정상이 평평한 산입니다.'),
			('TXT_KEY_CIV5_FEATURES_NEW_REEF_HELP',			'세계에서 가장 큰 산호초입니다.'),
			('TXT_KEY_CIV5_FEATURES_VOLCANO_HELP',			'인간 시대의 가장 큰 폭발 중 하나를 수행한 화산으로 삶을 황폐화시키고 땅을 파괴하고 창조하며 수천 명의 목숨을 앗아갔습니다.'),
			('TXT_KEY_CIV5_FEATURES_GIBRALTAR_HELP',		'지중해의 관문을 표시하는 외로운 바위로 방어적인 특징으로 사용되고 있습니다.'),
			('TXT_KEY_CIV5_FEATURES_GEYSER_HELP',			'세계에서 가장 정기적인 간헐천 중 하나이며, 가장 빈번한 분출 중 하나입니다.'),
			('TXT_KEY_CIV5_FEATURES_POTOSI_HELP',			'이 산에서 노예들이 채굴한 은, 금 및 기타 자원은 막대한 규모로 끊임없이 유럽으로 운반되어 당시의 경제를 무너뜨렸습니다.'),
			('TXT_KEY_CIV5_FEATURES_SRI_PADA_HELP',			'4개의 다른 종교(힌두교, 불교, 이슬람교, 인도 기독교)에 의한 거룩한 사람의 발자국이 포함된 산입니다.'),
			('TXT_KEY_CIV5_FEATURES_MT_SINAI_HELP',			'산, 성경에 따르면 십계명이 모세에게 명판의 형태로 주어졌습니다.'),
			('TXT_KEY_CIV5_FEATURES_MT_KAILASH_HELP',		'힌두교, 불교, 자이나교, 본교의 4개 종교의 성지인 산입니다.'),
			('TXT_KEY_CIV5_FEATURES_ULURU_HELP',			'원주민 부족의 성지인 미지의 외로운 바위입니다.'),
			('TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_HELP',	'수많은 아프리카 국가와 부족에게 먹이를 주는 가장 큰 열대 호수입니다.'),
			('TXT_KEY_CIV5_FEATURES_SOLOMONS_MINES_HELP',	'성경의 통치자가 엄청난 양의 금을 축적하는 데 도움을 준 신화적인 광산입니다.'),
			('TXT_KEY_CIV5_FEATURES_SALAR_HELP',			'속도 기록이 자주 깨지고 위성이 표면을 사용하여 장치를 보정하는 세계에서 가장 큰 소금 평원입니다.'),
			('TXT_KEY_CIV5_FEATURES_CAUSEWAY_HELP',			'물과 땅에서 자라는 특이한 육각형 현무암 기둥입니다.'),
			('TXT_KEY_CIV5_FEATURES_MT_EVEREST_HELP',		'세계에서 가장 높고 유명한 봉우리이며, 확실히 알려진 모든 산 중에서 가장 포위된 산입니다.'),
			('TXT_KEY_CIV5_FEATURES_RETBA_HELP',			'특이한 분홍조류가 서식하는 염수호입니다.'),
			('TXT_KEY_CIV5_FEATURES_BERMUDA_HELP',			'배와 비행기가 사라지는 것 같았지만 결코 발견되지 않았던 신비한 지역입니다.'),
			('TXT_KEY_CIV5_FEATURES_LUMI_BAY_HELP',			'독특한 종류의 식물성 플랑크톤이 푸른 빛을 내며 멋진 시각적 효과를 주는 구역입니다.'),
			('TXT_KEY_CIV5_FEATURES_DALLOL_HELP',			'거대한 아프리카 균열에 의해 형성된 특이한 호수 구조를 만드는 평평한 화산입니다.'),
			('TXT_KEY_CIV5_FEATURES_MT_PAEKTU_HELP',		'남북한의 신성한 산이자 모든 알려진 화산호 중 가장 높은 화산호입니다.'),
			('TXT_KEY_CIV5_FEATURES_EYE_OF_SAHARA_HELP',	'공기나 우주에서만 전체 형태를 볼 수 있는 원인을 알 수 없는 거대한 모래 형성물입니다.'),
			('TXT_KEY_CIV5_FEATURES_BLUE_HOLE_HELP',		'산호초와 환초로 둘러싸인 거대한 해양 싱크홀입니다.');
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

UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_RESEARCH]과학이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_BARRINGER_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_PRODUCTION]생산이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_POTOSI_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_CULTURE]문화가 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_RESEARCH]과학이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_FOOD]식량이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GRANDMESA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_RESEARCH]과학이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_A_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_RESEARCH]과학이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_B_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_RESEARCH]과학이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_C_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_CULTURE]문화가 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_PRODUCTION]생산이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SOLOMONS_MINES_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_RESEARCH]과학이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KRAKATOA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_FOOD]식량이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_CULTURE]문화가 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FUJI_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_PEACE]신앙이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_MT_KAILASH_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_PEACE]신앙이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_MT_SINAI_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_CULTURE]문화가 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_OLDFAITHFUL_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_GOLD]골드가 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GIBRALTER_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_FOOD]식량이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SRI_PADA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 경관의 [ICON_PRODUCTION]생산이 +2 증가합니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_ULURU_TEXT';