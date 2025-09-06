-----------------------------------------------------------
-- "the"가 이름에 포함된 이름 수정
-----------------------------------------------------------
UPDATE Language_ko_KR SET Text = REPLACE(Text, 'The ', '') 	WHERE Tag = 'TXT_KEY_FEATURE_REEF';
UPDATE Language_ko_KR SET Text = REPLACE(Text, 'The ', '') 	WHERE Tag = 'TXT_KEY_FEATURE_MESA';
UPDATE Language_ko_KR SET Text = REPLACE(Text, 'The ', '') 	WHERE Tag = 'TXT_KEY_FEATURE_CRATER';
-----------------------------------------------------------
-- 문명 백과사전 항목을 OLD_REEF에서 NEW_REEF로 이동
-----------------------------------------------------------
INSERT INTO Language_ko_KR
			(Tag,									Text)
SELECT		'TXT_KEY_CIV5_FEATURES_NEW_REEF_TEXT',	Text	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT';
-----------------------------------------------------------
-- 여러 타일 자연경관을 위한 자연의 여신 변경
-----------------------------------------------------------
UPDATE Language_ko_KR SET Text = REPLACE(Text, '[ICON_CULTURE] 문화 +2', '[ICON_CULTURE] 문화 +3') WHERE Tag ='TXT_KEY_BELIEF_ONE_WITH_NATURE';
UPDATE Language_ko_KR SET Text = Text||' (여러 타일로 이루어진 자연경관의 모든 타일에 비례하여 분배됩니다)' WHERE Tag ='TXT_KEY_BELIEF_ONE_WITH_NATURE';
-----------------------------------------------------------
-- 한 줄 요약 = 도움말 텍스트 (문명 백과사전 게임 정보)
-----------------------------------------------------------
UPDATE Language_ko_KR SET Text = '전설 속의 샘으로, 그 물을 마시는 사람에게 영원한 젊음을 준다고 믿어졌습니다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_HELP';
UPDATE Language_ko_KR SET Text = '전설 속의 도시로, 아메리카 정글 깊숙한 곳에 숨겨져 있으며 황금으로 만들어져 유럽인들이 오랫동안 찾아 헤맨 부로 가득 차 있다고 믿어졌습니다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_HELP';
UPDATE Language_ko_KR SET Text = '아프리카 최고봉이자 세계에서 가장 높은 단독 산인 화산입니다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_HELP';
UPDATE Language_ko_KR SET Text = '네 가지 다른 종교(힌두교, 불교, 이슬람교, 인도 기독교)에서 신성한 인물의 발자국으로 믿어지는 것이 있는 산입니다.' WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SRI_PADA_HELP';

INSERT INTO Language_ko_KR
			(Tag,											Text)
VALUES		('TXT_KEY_CIV5_FEATURES_CRATER_HELP',			'세계에서 가장 크고 확실히 가장 잘 보존된 운석 충돌구 중 하나입니다.'),
			('TXT_KEY_CIV5_FEATURES_FUJI_HELP',				'가장 웅장하고 아름다운 원뿔을 가진 화산으로, 많은 예술가에게 영감을 주었습니다.'),
			('TXT_KEY_CIV5_FEATURES_MESA_HELP',				'세계에서 가장 큰 평평한 꼭대기를 가진 산입니다.'),
			('TXT_KEY_CIV5_FEATURES_NEW_REEF_HELP',			'세계에서 가장 큰 산호초입니다.'),
			('TXT_KEY_CIV5_FEATURES_VOLCANO_HELP',			'인류 시대의 가장 큰 분화 중 하나를 일으켜 생명을 파괴하고, 땅을 파괴하고 생성하며, 수천 명의 사람을 죽인 화산입니다.'),
			('TXT_KEY_CIV5_FEATURES_GIBRALTAR_HELP',		'지중해로 가는 관문을 표시하는 외로운 바위로, 방어적 지형으로 사용됩니다.'),
			('TXT_KEY_CIV5_FEATURES_GEYSER_HELP',			'세계에서 가장 규칙적인 간헐천 중 하나로, 가장 빈번한 분출률을 보입니다.'),
			('TXT_KEY_CIV5_FEATURES_POTOSI_HELP',			'이 산에서 노예들이 채굴한 은, 금 및 기타 자원은 끊임없이 막대한 규모로 유럽으로 운반되어 당시의 경제를 파괴했습니다.'),
			('TXT_KEY_CIV5_FEATURES_MT_SINAI_HELP',			'성경에 따르면, 모세가 십계명을 석판 형태로 받은 산입니다.'),
			('TXT_KEY_CIV5_FEATURES_MT_KAILASH_HELP',		'네 가지 다른 종교인 힌두교, 불교, 자이나교, 뵌교의 성스러운 봉우리인 산입니다.'),
			('TXT_KEY_CIV5_FEATURES_ULURU_HELP',			'기원을 알 수 없는 외로운 바위로, 지역 원주민 부족의 신성한 장소입니다.'),
			('TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_HELP',	'주변의 수많은 아프리카 국가와 부족에게 젖줄이 되어주는 가장 큰 열대 호수입니다.'),
			('TXT_KEY_CIV5_FEATURES_SOLOMONS_MINES_HELP',	'성경 속 통치자가 막대한 양의 금을 축적하는 데 도움을 준 전설적인 광산입니다.'),
			('TXT_KEY_CIV5_FEATURES_SALAR_HELP',			'세계에서 가장 큰 소금 평원으로, 종종 속도 기록이 깨지고 위성이 그 표면을 사용하여 장치를 보정하는 곳입니다.'),
			('TXT_KEY_CIV5_FEATURES_CAUSEWAY_HELP',			'물과 땅에서 솟아나는 특이한 육각형 현무암 기둥입니다.'),
			('TXT_KEY_CIV5_FEATURES_MT_EVEREST_HELP',		'세계에서 가장 높고 유명한 봉우리이며, 알려진 모든 산 중에서 가장 많이 포위된 산입니다.'),
			('TXT_KEY_CIV5_FEATURES_RETBA_HELP',			'특이한 분홍색 조류가 서식하는 소금 호수입니다.'),
			('TXT_KEY_CIV5_FEATURES_BERMUDA_HELP',			'배와 비행기가 사라지고 다시는 발견되지 않는 것처럼 보이는 신비한 지역입니다.'),
			('TXT_KEY_CIV5_FEATURES_LUMI_BAY_HELP',			'푸른빛을 내며 멋진 시각 효과를 주는 특이한 종류의 식물성 플랑크톤이 서식하는 만입니다.'),
			('TXT_KEY_CIV5_FEATURES_DALLOL_HELP',			'에티오피아에 있는 분석구 화산으로, 지구상에서 가장 높은 평균 기온(34.4℃) 기록을 보유하고 있습니다. 비현실적인 색상과 광물 패턴, 그리고 열수천에서 분출되는 매우 산성인 유체로 유명합니다. 이러한 극한의 물리화학적 특성(pH, 염도, 고온, 산소 부족 등)의 공존은 달롤을 지구상에서 몇 안 되는 "다중 극한" 지역 중 하나로 만듭니다.'),
			('TXT_KEY_CIV5_FEATURES_MT_PAEKTU_HELP',		'남북한 모두의 성산이자 약 100년마다 분화하는 활화산입니다. 2,744m로 북한과 중국 동북부에서 가장 높은 산이며, 쑹화강, 두만강, 압록강 세 강의 발원지인 거대한 화산 분화구 호수를 품고 있습니다. 946년의 분화는 천지를 만든 분화 중 하나로, 지난 5,000년 동안 지구상에서 가장 크고 강력한 분화 중 하나였습니다.'),
			('TXT_KEY_CIV5_FEATURES_EYE_OF_SAHARA_HELP',	'사하라 사막 중심부에 위치한 눈에 띄는 원형 지질학적 특징입니다. 직경 40km의 침식된 지질 돔으로, 지하 화성암 관입이 상부 퇴적암층을 변형시켜 발생했습니다. 가장 오래된 지층은 구조의 중심에 노출되어 있습니다. 동심원처럼 보이며, 전체 모습은 공중이나 우주에서만 볼 수 있습니다.'),
			('TXT_KEY_CIV5_FEATURES_BLUE_HOLE_HELP',		'벨리즈 해안에 있는 거대한 해양 싱크홀입니다. 산호초와 환초로 둘러싸여 있으며, 해수면이 훨씬 낮았던 "제4기 빙하기"의 여러 단계 동안 형성되었습니다. 깊이 124m(너비 300m) 때문에 매우 인기 있는 스쿠버 다이빙 장소이자 거대한 관광 명소입니다. 또한 자크 쿠스토의 가장 유명한 탐험을 포함하여 몇 차례의 해양 과학 탐사를 주최했습니다.'),
			('TXT_KEY_CIV5_FEATURES_GALAPAGOS_HELP',		'활화산으로 가득한 고립된 태평양 군도입니다. 추정에 따르면 그곳에 사는 조류의 거의 80%, 포유류와 파충류의 97%, 식물의 30%가 고유종입니다. 19세기에 영국 생물학자 찰스 다윈은 HMS "비글"호를 타고 갈라파고스 제도를 방문하여 그곳에서 만난 식물과 동물을 연구하고 목록을 작성했습니다. 그의 노트와 스케치는 그가 몇 년 후 발표한 "진화론"의 영감이이자 증거가 되었습니다.'),
			('TXT_KEY_CIV5_FEATURES_HA_LONG_HELP',			'다양한 모양과 크기의 수천 개의 석회암 카르스트와 작은 섬이 특징인 만입니다. 이 만의 석회암은 5억 년의 형성 과정을 거쳤고, 카르스트는 약 2천만 년의 역사를 가지고 있습니다. 선사 시대 인류와 수많은 문화가 이곳에 거주했습니다. 전설에 따르면 "하강하는 용"이 베트남 사람들을 보호하고 나라를 지키기 위해 만으로 왔다고 합니다.'),
			('TXT_KEY_CIV5_FEATURES_ZHANGJIAJIE_HELP',		'카르스트 지형의 표준이 아닌 화학적 침식이 아닌 물리적 침식으로 수년에 걸쳐 만들어진 기둥 모양의 지형입니다. 2002년에는 문자 그대로 "백룡 하늘 리프트"인 바이룽 엘리베이터가 대중에게 공개되었습니다. 326m로 세계에서 가장 높은 야외 리프트입니다. 장가계 산은 또한 공상 과학 영화 "아바타"에서 판도라 행성의 독특한 배경에 영감을 주었습니다.'),
			('TXT_KEY_CIV5_FEATURES_AURORA_HELP',			'코로나 홀과 코로나 질량 방출에서 나오는 태양풍의 결과로 지구 자기권에 의해 만들어지는 하늘의 아름다운 빛 효과입니다. 주로 극지방과 같은 고위도 지역에서 볼 수 있지만, 때때로 저위도에서도 볼 수 있습니다. 표면, 호 또는 코로나와 같은 다양한 모양을 형성할 수 있으며, 빨간색과 녹색에서 파란색과 자외선에 이르기까지 다양한 색상을 띱니다.'),
			('TXT_KEY_CIV5_FEATURES_ARCH_HELP',				'침식에 의해 발견된 섬세한 모래 지형입니다. 이 아치는 아치스 국립공원에서 가장 널리 알려진 랜드마크이며 유타주 번호판과 우표에 그려져 있습니다. 2002년 동계 올림픽 성화 봉송이 이 아치를 통과했습니다. 등반가들에게도 도전 과제였지만, 지속적인 퇴화 이후 등반은 현재 금지되어 있습니다.'),
			('TXT_KEY_CIV5_FEATURES_DANXIA_HELP',			'약 2,400만 년 전에 사암과 다른 광물로 만들어진 아름다운 다색 언덕과 산입니다. 여러 겹의 케이크처럼 보이며, 바람, 비, 그리고 시간이 탑, 기둥, 협곡을 포함한 비범한 모양을 조각하여 다양한 색상, 패턴, 크기를 가지게 되어 중국 북부의 거대한 관광 명소입니다.'),
			('TXT_KEY_CIV5_FEATURES_JEJU_DO_HELP',			'응회암으로 만들어진 거대한 화산 칼데라로, 솟아오르는 마그마의 잔해입니다. 약 6,700년 전에 생성되었으며, 처음에는 제주도와 분리되어 있었지만 마침내 연결되어 현재는 대한민국 최고의 관광 명소 중 하나로 기능합니다. 가장 아름다운 일출을 바로 그곳에서 포착할 수 있다고 하여 성산일출축제가 열립니다.'),
			('TXT_KEY_CIV5_FEATURES_MARIANA_HELP',			'');

-----------------------------------------------------------
-- 문명 백과사전 대체 (오래된 텍스트 삭제)
-----------------------------------------------------------
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_RESEARCH] 과학 +2를 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_BARRINGER_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_PRODUCTION] 생산력 +2을 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_POTOSI_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_CULTURE] 문화 +2를 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_EL_DORADO_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_RESEARCH] 과학 +2를 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FOUNTAIN_YOUTH_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_FOOD] 식량 +2을 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GRANDMESA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_RESEARCH] 과학 +2를 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_A_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_RESEARCH] 과학 +2를 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_B_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_RESEARCH] 과학 +2를 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_NEW_REEF_C_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_CULTURE] 문화 +2를 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KILIMANJARO_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_PRODUCTION] 생산력 +2을 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SOLOMONS_MINES_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_RESEARCH] 과학 +2를 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_KRAKATOA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_FOOD] 식량 +2을 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_CULTURE] 문화 +2를 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_FUJI_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_PEACE] 신앙 +2을 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_MT_KAILASH_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_PEACE] 신앙 +2을 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_MT_SINAI_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_CULTURE] 문화 +2를 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_OLDFAITHFUL_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_GOLD] 골드 +2을 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_GIBRALTER_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_FOOD] 식량 +2을 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_SRI_PADA_TEXT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '고대 시대 이후의 모든 시대마다 이 자연경관에서 [ICON_PRODUCTION] 생산력 +2을 얻습니다.[NEWLINE][NEWLINE]', '') 	WHERE Tag = 'TXT_KEY_CIV5_FEATURES_ULURU_TEXT';