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

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]', '[ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR]') WHERE Tag ='TXT_KEY_BELIEF_ONE_WITH_NATURE';
UPDATE Language_ko_KR SET Text = Text||' (타일이 여러개인 자연 경관의 경우 모든 타일 간에 비례적으로 분할)' WHERE Tag ='TXT_KEY_BELIEF_ONE_WITH_NATURE';
-----------------------------------------------------------
-- One liners = Help texts (Game Info in Civilopedia)
-----------------------------------------------------------
UPDATE Language_en_US SET Text = 'Mythical fountain, whose water was believed to give everlasting youth to those drinking it.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_HELP';
UPDATE Language_en_US SET Text = 'Mythical city, believed to be hidden deep in the jungles of America, made of gold and full of riches Europeans searched for ages.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_HELP';
UPDATE Language_en_US SET Text = 'Volcano that is the highest peak in Africa and the highest single free-standing mountain above sea level in the world.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_HELP';
UPDATE Language_en_US SET Text = 'Mountain that contains, what is believed to be, a footprint of a holy person by four different religions (Hinduism, Buddhism, Islam and Indian Christianity).' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SRI_PADA_HELP';

UPDATE Language_ko_KR SET Text = '신화 속의 샘으로, 그 물을 마시는 사람들에게 영원한 젊음을 준다고 믿어졌습니다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_HELP';
UPDATE Language_ko_KR SET Text = '아메리카 정글 깊숙한 곳에 숨겨져 있다고 믿어졌던 신화 속의 도시로, 황금으로 이루어져 있으며 유럽인들이 오랫동안 찾아 헤맨 부로 가득했습니다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_HELP';
UPDATE Language_ko_KR SET Text = '아프리카에서 가장 높은 봉우리이자 세계에서 해발 고도가 가장 높은 단일 독립형 산인 화산입니다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_HELP';
UPDATE Language_ko_KR SET Text = '힌두교, 불교, 이슬람교, 인도 기독교의 네 가지 다른 종교에서 성인의 발자국이라고 믿어지는 것을 담고 있는 산입니다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SRI_PADA_HELP';

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

INSERT INTO Language_ko_KR
			(Tag,											Text)
VALUES		('TXT_KEY_CIV5_FEATURES_CRATER_HELP',			'세계에서 가장 크고 확실히 가장 잘 보존된 운석구 중 하나입니다.'),
			('TXT_KEY_CIV5_FEATURES_FUJI_HELP',				'가장 장엄하고 아름다운 원뿔형 화산 중 하나이며, 많은 예술가들에게 영감을 주었습니다.'),
			('TXT_KEY_CIV5_FEATURES_MESA_HELP',				'세계에서 가장 큰 평평한 정상의 산입니다.'),
			('TXT_KEY_CIV5_FEATURES_NEW_REEF_HELP',			'세계에서 가장 큰 산호초입니다.'),
			('TXT_KEY_CIV5_FEATURES_VOLCANO_HELP',			'인류 역사상 가장 큰 폭발 중 하나를 일으켜 생명을 황폐화시키고, 땅을 파괴하고 창조하며, 수천 명의 사람들을 죽인 화산입니다.'),
			('TXT_KEY_CIV5_FEATURES_GIBRALTAR_HELP',		'지중해로 가는 관문을 표시하며 방어 특징으로 사용되는 외로운 바위입니다.'),
			('TXT_KEY_CIV5_FEATURES_GEYSER_HELP',			'세계에서 가장 규칙적인 간헐천 중 하나이며, 가장 빈번한 분출률을 자랑합니다.'),
			('TXT_KEY_CIV5_FEATURES_POTOSI_HELP',			'이 산에서 노예들에 의해 채굴된 은, 금 및 기타 자원은 엄청난 규모로 끊임없이 유럽으로 운반되었고 당시의 경제를 파탄시켰습니다.'),
			('TXT_KEY_CIV5_FEATURES_MT_SINAI_HELP',			'성경에 따르면 모세에게 석판 형태로 십계명이 주어졌다고 하는 산입니다.'),
			('TXT_KEY_CIV5_FEATURES_MT_KAILASH_HELP',		'힌두교, 불교, 자이나교, 본교의 네 가지 다른 종교의 성스러운 봉우리인 산입니다.'),
			('TXT_KEY_CIV5_FEATURES_ULURU_HELP',			'기원을 알 수 없는 외로운 바위로, 지역 애버리진 부족의 성지입니다.'),
			('TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_HELP',	'수많은 아프리카 국가와 부족들에게 식량을 공급하는 가장 큰 열대 호수입니다.'),
			('TXT_KEY_CIV5_FEATURES_SOLOMONS_MINES_HELP',	'성경 속의 통치자가 막대한 양의 금을 축적하는 데 도움이 된 신화 속의 광산입니다.'),
			('TXT_KEY_CIV5_FEATURES_SALAR_HELP',			'세계에서 가장 큰 소금 평원으로, 속도 기록이 자주 깨지고 위성들이 그 표면을 사용하여 장치를 보정합니다.'),
			('TXT_KEY_CIV5_FEATURES_CAUSEWAY_HELP',			'물과 땅에서 솟아오르는 특이한 육각형 현무암 기둥입니다.'),
			('TXT_KEY_CIV5_FEATURES_MT_EVEREST_HELP',		'세계에서 가장 높고 가장 유명한 봉우리이며, 알려진 모든 산 중에서 확실히 가장 많은 공격을 받은 산입니다.'),
			('TXT_KEY_CIV5_FEATURES_RETBA_HELP',			'특이한 분홍색 조류가 서식하는 염호입니다.'),
			('TXT_KEY_CIV5_FEATURES_BERMUDA_HELP',			'배와 비행기가 사라지는 것처럼 보였고 결코 발견되지 않았던 신비한 지역입니다.'),
			('TXT_KEY_CIV5_FEATURES_LUMI_BAY_HELP',			'특이한 종류의 식물성 플랑크톤이 서식하며 파랗게 빛나며 멋진 시각 효과를 제공하는 만입니다.'),
			('TXT_KEY_CIV5_FEATURES_DALLOL_HELP',			'거대한 아프리카 열곡에 의해 형성된 특이한 호수 구조를 만드는 평평한 화산입니다.'),
			('TXT_KEY_CIV5_FEATURES_MT_PAEKTU_HELP',		'남북한 모두의 성스러운 산이며, 알려진 모든 화산 호수 중 가장 높은 곳에 위치한 호수입니다.'),
			('TXT_KEY_CIV5_FEATURES_EYE_OF_SAHARA_HELP',	'알 수 없는 기원의 거대한 모래 형성으로, 공중이나 우주에서만 온전한 형태를 볼 수 있습니다.'),
			('TXT_KEY_CIV5_FEATURES_BLUE_HOLE_HELP',		'산호초와 환초로 둘러싸인 거대한 해양 싱크홀입니다.'),
			('TXT_KEY_CIV5_FEATURES_GALAPAGOS_HELP',		'고유한 동식물이 서식하는 고립된 군도입니다.'),
			('TXT_KEY_CIV5_FEATURES_HA_LONG_HELP',			'엄청난 수의 섬과 독특한 암석 형성을 가진 만입니다.'),
			('TXT_KEY_CIV5_FEATURES_ZHANGJIAJIE_HELP',		'공상 과학 영화의 독특한 장면에 영감을 준 독특한 암석 형성입니다.'),
			('TXT_KEY_CIV5_FEATURES_AURORA_HELP',			'지구의 자기장에 의해 생성되며 주로 극지방에서 볼 수 있는 하늘의 아름다운 빛 효과입니다.');
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

UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_BARRINGER_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_PRODUCTION] 생산력 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_POTOSI_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_CULTURE] 문화 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_FOOD] 식량 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GRANDMESA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_A_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_B_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_C_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_CULTURE] 문화 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_PRODUCTION] 생산력 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SOLOMONS_MINES_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KRAKATOA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_FOOD] 식량 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_CULTURE] 문화 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FUJI_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_PEACE] 신앙 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_MT_KAILASH_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_PEACE] 신앙 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_MT_SINAI_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_CULTURE] 문화 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_OLDFAITHFUL_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_GOLD] 금 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GIBRALTER_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_FOOD] 식량 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SRI_PADA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 매 시대마다 이 자연 불가사의에서 [ICON_PRODUCTION] 생산력 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_ULURU_TEXT';