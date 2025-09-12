----------------------------------------------------
-- 자연 불가사의 역사 데이터 수정자
-- 2021년 7월 15일: 생성, adan_eslavo
-----------------------------------------------------------
-- 이름에 "The"가 포함된 이름 수정
-----------------------------------------------------------
UPDATE Language_ko_KR SET Text = REPLACE(Text, '그레이트배리어', '') 	WHERE Tag = 'TXT_KEY_FEATURE_REEF';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '그랜드 ', '') 	WHERE Tag = 'TXT_KEY_FEATURE_MESA';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '배링거 ', '') 	WHERE Tag = 'TXT_KEY_FEATURE_CRATER';
-----------------------------------------------------------
-- 문명 백과사전 항목을 OLD_REEF에서 NEW_REEF로 이동
-----------------------------------------------------------
INSERT INTO Language_ko_KR
			(Tag,										Text)
SELECT		'TXT_KEY_CIV5_FEATURES_NEW_REEF_A_TEXT',	Text	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT' UNION ALL
SELECT		'TXT_KEY_CIV5_FEATURES_NEW_REEF_B_TEXT',	Text	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT' UNION ALL
SELECT		'TXT_KEY_CIV5_FEATURES_NEW_REEF_C_TEXT',	Text	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT';
-----------------------------------------------------------
-- 다중 타일 자연 불가사의에 대한 자연의 여신 변경
-----------------------------------------------------------
UPDATE Language_ko_KR SET Text = REPLACE(Text, '+2 [ICON_CULTURE]', '+3 [ICON_CULTURE]') WHERE Tag ='TXT_KEY_BELIEF_ONE_WITH_NATURE';
UPDATE Language_ko_KR SET Text = Text||' (다중 타일 자연 불가사의의 모든 타일에 비례하여 분할됨)' WHERE Tag ='TXT_KEY_BELIEF_ONE_WITH_NATURE';
-----------------------------------------------------------
-- 한 줄 요약 = 도움말 텍스트 (문명 백과사전 게임 정보)
-----------------------------------------------------------
UPDATE Language_ko_KR SET Text = '신화 속의 샘으로, 그 물을 마시면 영원한 젊음을 얻는다고 믿어졌다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_HELP';
UPDATE Language_ko_KR SET Text = '신화 속의 도시로, 아메리카 정글 깊숙한 곳에 숨겨져 있으며 금으로 만들어져 유럽인들이 오랫동안 찾아 헤맸던 부로 가득 차 있다고 믿어졌다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_HELP';
UPDATE Language_ko_KR SET Text = '아프리카에서 가장 높은 봉우리이자 세계에서 가장 높은 단독 산.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_HELP';
UPDATE Language_ko_KR SET Text = '네 가지 다른 종교(힌두교, 불교, 이슬람교, 인도 기독교)에서 신성한 인물의 발자국이 있다고 믿어지는 산.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SRI_PADA_HELP';

INSERT INTO Language_ko_KR
			(Tag,											Text)
VALUES		('TXT_KEY_CIV5_FEATURES_CRATER_HELP',			'세계에서 가장 크고 확실히 가장 잘 보존된 운석 충돌구 중 하나.'),
			('TXT_KEY_CIV5_FEATURES_FUJI_HELP',				'가장 장엄하고 아름다운 원뿔 중 하나를 가진 화산으로, 많은 예술가들에게 영감을 주었다.'),
			('TXT_KEY_CIV5_FEATURES_MESA_HELP',				'세계에서 가장 큰 평평한 꼭대기의 산.'),
			('TXT_KEY_CIV5_FEATURES_NEW_REEF_HELP',			'세계에서 가장 큰 산호초.'),
			('TXT_KEY_CIV5_FEATURES_VOLCANO_HELP',			'인류 시대의 가장 큰 분화 중 하나를 일으킨 화산으로, 생명을 파괴하고 땅을 파괴하고 창조했으며 수천 명의 사람들을 죽였다.'),
			('TXT_KEY_CIV5_FEATURES_GIBRALTAR_HELP',		'지중해로 가는 관문을 표시하고 방어 시설로 사용되는 외로운 바위.'),
			('TXT_KEY_CIV5_FEATURES_GEYSER_HELP',			'세계에서 가장 규칙적인 간헐천 중 하나로, 가장 빈번한 분출률을 자랑한다.'),
			('TXT_KEY_CIV5_FEATURES_POTOSI_HELP',			'이 산에서 노예들이 채굴한 은, 금 및 기타 자원은 거대한 규모로 유럽으로 지속적으로 운반되어 당시의 경제를 파괴했다.'),
			('TXT_KEY_CIV5_FEATURES_MT_SINAI_HELP',			'성경에 따르면, 십계명이 석판 형태로 모세에게 주어진 산.'),
			('TXT_KEY_CIV5_FEATURES_MT_KAILASH_HELP',		'힌두교, 불교, 자이나교, 본교 등 네 가지 다른 종교의 신성한 봉우리인 산.'),
			('TXT_KEY_CIV5_FEATURES_ULURU_HELP',			'기원을 알 수 없는 외로운 바위로, 지역 원주민 부족의 신성한 장소이다.'),
			('TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_HELP',	'주변의 수많은 아프리카 국가와 부족을 먹여 살리는 가장 큰 열대 호수.'),
			('TXT_KEY_CIV5_FEATURES_SOLOMONS_MINES_HELP',	'성경 속 통치자가 막대한 양의 금을 축적하는 데 도움을 준 신화 속의 광산.'),
			('TXT_KEY_CIV5_FEATURES_SALAR_HELP',			'세계에서 가장 큰 소금 평원으로, 속도 기록이 자주 깨지고 위성이 그 표면을 사용하여 장치를 보정하는 곳.'),
			('TXT_KEY_CIV5_FEATURES_CAUSEWAY_HELP',			'물과 땅에서 솟아나는 특이한 육각형 현무암 기둥.'),
			('TXT_KEY_CIV5_FEATURES_MT_EVEREST_HELP',		'세계에서 가장 높고 가장 유명한 봉우리이며, 확실히 알려진 모든 산 중에서 가장 많이 포위된 산.'),
			('TXT_KEY_CIV5_FEATURES_RETBA_HELP',			'특이한 분홍색 조류가 서식하는 소금 호수.'),
			('TXT_KEY_CIV5_FEATURES_BERMUDA_HELP',			'배와 비행기가 사라지고 다시는 발견되지 않는 것처럼 보이는 신비한 지역.'),
			('TXT_KEY_CIV5_FEATURES_LUMI_BAY_HELP',			'푸른 빛을 내며 멋진 시각 효과를 내는 특이한 종류의 식물성 플랑크톤이 서식하는 만.'),
			('TXT_KEY_CIV5_FEATURES_DALLOL_HELP',			'거대한 아프리카 열곡에 의해 형성된 특이한 호수 구조를 만드는 평평한 화산.'),
			('TXT_KEY_CIV5_FEATURES_MT_PAEKTU_HELP',		'남북한 모두의 성산이자 알려진 모든 화산호 중 가장 높은 곳.'),
			('TXT_KEY_CIV5_FEATURES_EYE_OF_SAHARA_HELP',	'기원을 알 수 없는 거대한 모래 지형으로, 공중이나 우주에서만 전체 모양을 볼 수 있다.'),
			('TXT_KEY_CIV5_FEATURES_BLUE_HOLE_HELP',		'산호초와 환초로 둘러싸인 거대한 해양 싱크홀.'),
			('TXT_KEY_CIV5_FEATURES_GALAPAGOS_HELP',		'고유의 동식물이 있는 고립된 군도.'),
			('TXT_KEY_CIV5_FEATURES_HA_LONG_HELP',			'막대한 양의 섬과 독특한 암석 지형이 있는 만.'),
			('TXT_KEY_CIV5_FEATURES_ZHANGJIAJIE_HELP',		'공상 과학 영화의 독특한 장면에 영감을 준 독특한 암석 지형.'),
			('TXT_KEY_CIV5_FEATURES_AURORA_HELP',			'지구의 자기장에 의해 만들어져 주로 극지방에서 볼 수 있는 아름다운 하늘의 빛 효과.');

-----------------------------------------------------------
-- 문명 백과사전 교체 (오래된 텍스트 삭제)
-----------------------------------------------------------
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_BARRINGER_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_PRODUCTION] 생산력 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_POTOSI_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_CULTURE] 문화 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_FOOD] 식량 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GRANDMESA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_A_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_B_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_C_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_CULTURE] 문화 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_PRODUCTION] 생산력 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SOLOMONS_MINES_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KRAKATOA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_FOOD] 식량 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_CULTURE] 문화 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FUJI_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_PEACE] 신앙 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_MT_KAILASH_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_PEACE] 신앙 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_MT_SINAI_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_CULTURE] 문화 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_OLDFAITHFUL_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_GOLD] 골드 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GIBRALTER_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_FOOD] 식량 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SRI_PADA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후 모든 시대마다 이 자연 불가사의에서 [ICON_PRODUCTION] 생산력 +2.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_ULURU_TEXT';