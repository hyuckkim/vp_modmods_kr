--------------------------------------------------
-- one text fix moved from SQL
UPDATE Language_ko_KR 
SET Text='이 자원들은 도시 국가의 도시와 가까운 거리에 있습니다. 모든 [COLOR:0:155:255:255]전략[ENDCOLOR] 및 [COLOR:205:205:0:255]사치[ENDCOLOR] 자원은 플레이어가 [COLOR_CYAN]동맹[ENDCOLOR]이 되고 도시 국가가 자원을 연결하면 플레이어에게 제공됩니다.'
WHERE Tag='TXT_KEY_CITY_STATE_RESOURCES_TT';
--------------------------------------------------
-- text replacements
UPDATE Language_ko_KR SET Text = REPLACE(Text, '동맹.  당신', '동맹. 당신') WHERE Tag = 'TXT_KEY_CITY_STATE_ALLY_NOBODY_TT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '도시 국가.  공격중', '도시 국가. 공격중') WHERE Tag = 'TXT_KEY_POP_CSTATE_PROTECTED_BY_TT';
--------------------------------------------------

CREATE TABLE IF NOT EXISTS MinorCivLeaders (
	'ID' INTEGER PRIMARY KEY AUTOINCREMENT,
	'Type' TEXT NOT NULL UNIQUE,
	'LeaderIcon' TEXT NOT NULL,
	'LeaderPlace' TEXT DEFAULT NULL,
	'LeaderName' TEXT DEFAULT NULL,
	'LeaderTitle' TEXT DEFAULT NULL,
	'LeaderArtistName' TEXT DEFAULT NULL,
	FOREIGN KEY (Type) REFERENCES MinorCivilizations(Type));

INSERT INTO MinorCivLeaders(
				Type,						LeaderIcon,						LeaderPlace,					LeaderName,										LeaderTitle,		LeaderArtistName)
		SELECT  'MINOR_CIV_ALMATY',			'almaty_leadericon.dds',		'카자흐 칸국',			'자니벡 칸',									'',					'knightmare13'				UNION ALL
		SELECT  'MINOR_CIV_ANTANANARIVO',	'antananarivo_leadericon.dds',	'이메리나 왕국',		'라나발로나 1세',									'여왕',			'Nutty'						UNION ALL
		SELECT  'MINOR_CIV_ANTWERP',		'antwerp_leadericon.dds',		'플랑드르',						'로베르 3세',									'백작',			'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_BELGRADE',		'belgrade_leadericon.dds',		'세르비아',						'카라조르제 페트로비치' /*Karađorđe Petrović*/,	'대보즈드',		'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_BOGOTA',			'bogota_leadericon.dds',		'그란 콜롬비아',				'시몬 볼리바르',								'대통령',		'Leugi'						UNION ALL
		SELECT  'MINOR_CIV_BRATISLAVA',		'bratislava_leadericon.dds',	'대모라비아',				'스바토플루크 1세',									'왕',				'J. Kohler/Nutty'			UNION ALL
		SELECT  'MINOR_CIV_BRUSSELS',		'brussels_leadericon.dds',		'벨기에 왕국',		'알베르 1세',										'왕',				'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_BUCHAREST',		'bucharest_leadericon.dds',		'왈라키아',					'블라드 3세',										'보이보드',			'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_BUDAPEST',		'budapest_leadericon.dds',		'헝가리 왕국',		'이슈트반 1세',									'성왕',		'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_BUENOS_AIRES',	'buenos_aires_leadericon.dds',	'아르헨티나 공화국',		'에바 페론',									'',					'Leugi'						UNION ALL
		SELECT  'MINOR_CIV_BYBLOS',			'byblos_leadericon.dds',		'비블로스 왕국 ',		'아히람',										'왕',				'LastSword'					UNION ALL
		SELECT  'MINOR_CIV_CAHOKIA',		'cahokia_leadericon.dds',		'미시시피인',			'투스칼루사',									'추장',			'H. Roe/Nutty'				UNION ALL
		SELECT  'MINOR_CIV_CAPE_TOWN',		'cape_town_leadericon.dds',		'네덜란드 동인도 회사',	'얀 반 리베크',								'사령관',		'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_COLOMBO',		'colombo_leadericon.dds',		'실론 자치령',		'D.S. 세나나야케',								'총리',	'knightmare13'				UNION ALL
		SELECT  'MINOR_CIV_FLORENCE',		'florence_leadericon.dds',		'피렌체 공화국',		"로렌초 데 메디치",	 						'',					'sukritact'					UNION ALL
		SELECT  'MINOR_CIV_GENEVA',			'geneva_leadericon.dds',		'구 스위스 연방',	'장 칼뱅',									'목사',			'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_GENOA',			'genoa_leadericon.dds',			'제노바 공화국',		'안드레아 도리아',									'콘도티에로',		'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_HANOI',			'hanoi_leadericon.dds',			'대월',						'리타이또' /*Lý Thái Tổ*/,					'황제',			'DJSHenninger'				UNION ALL
		SELECT  'MINOR_CIV_HONG_KONG',		'hong_kong_leadericon.dds',		'영국령 홍콩',		'카이 호',										'경',				'TPangolin'					UNION ALL
		SELECT  'MINOR_CIV_IFE',			'ife_leadericon.dds',			'일레-이페' /*Ilé-Ifẹ̀*/,			'오두두와',										'오니',				'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_JERUSALEM',		'jerusalem_leadericon.dds',		'이스라엘 왕국',		'솔로몬',										'왕',				'Leugi'						UNION ALL
		SELECT  'MINOR_CIV_KABUL',			'kabul_leadericon.dds',			'두라니 제국',			'아흐마드 샤 두라니',							'에미르',				'LastSword'					UNION ALL
		SELECT  'MINOR_CIV_KATHMANDU',		'kathmandu_leadericon.dds',		'네팔 왕국',			'트리부반',									'왕',				'DarthKyofu'				UNION ALL
		SELECT  'MINOR_CIV_KIEV',			'kiev_leadericon.dds',			"키예프 루스",				'야로슬라프 1세',									'대공',		'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_KUALA_LUMPUR',	'kuala_lumpur_leadericon.dds',	'쿠알라룸푸르 연방 직할구','Yap Ah Loy' /*Yè Yǎlái*/,						'카피탄 치나',		'TPangolin'					UNION ALL
		SELECT  'MINOR_CIV_KYZYL',			'kyzyl_leadericon.dds',			'소후랄',			'헤르텍 안치마-토카', 						'의장',		'Nutty'						UNION ALL
		SELECT  'MINOR_CIV_LA_VENTA',		'la_venta_leadericon.dds',		'올멕',					'투',											'쿠',				'DJSHenninger'				UNION ALL
		SELECT  'MINOR_CIV_LHASA',			'lhasa_leadericon.dds',			'티베트',						'툽텐 갸초',								'제13대 달라이 라마',	'sukritact'					UNION ALL
		SELECT  'MINOR_CIV_MALACCA',		'malacca_leadericon.dds',		'말라카 술탄국',		'파라메스와라',									'술탄',			'DarthKyofu'				UNION ALL
		SELECT  'MINOR_CIV_MANILA',			'manila_leadericon.dds',		'필리핀 공화국',		'호세 리잘',									'',					'knightmare13'				UNION ALL
		SELECT  'MINOR_CIV_MBANZA_KONGO',	'mbanza_kongo_leadericon.dds',	'암분두 왕국',			'아나 은징가 음반데',							'응골라',			'LastSword'					UNION ALL
		SELECT  'MINOR_CIV_MELBOURNE',		'melbourne_leadericon.dds',		'뉴사우스웨일스 식민지','존 배트맨',									'',					'TPangolin'					UNION ALL
		SELECT  'MINOR_CIV_MILAN',			'milan_leadericon.dds',			'밀라노 공국',			'잔 갈레아초 비스콘티', 						'공작',				'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_MOGADISHU',		'mogadishu_leadericon.dds',		'모가디슈 술탄국',	'아부 바크르 이븐 우마르',							'셰이크',			'EmeraldRange'				UNION ALL
		SELECT  'MINOR_CIV_MOMBASA',		'mombasa_leadericon.dds',		'케냐 공화국',		'조모 케냐타',								'대통령',		'knightmare13'				UNION ALL
		SELECT  'MINOR_CIV_MONACO',			'monaco_leadericon.dds',		'모나코 공국',	'레니에 3세',									'대공',			'knightmare13'				UNION ALL
		SELECT  'MINOR_CIV_ORMUS',			'ormus_leadericon.dds',			'오만 술탄국',		"카부스 빈 사이드",								'술탄',			'knightmare13'				UNION ALL
		SELECT  'MINOR_CIV_PANAMA_CITY',	'panama_city_leadericon.dds',	'파나마 공화국',		'마누엘 아마도르 게레로',						'대통령',		'DuskJockey and DarthKyofu'	UNION ALL
		SELECT  'MINOR_CIV_PRAGUE',			'prague_leadericon.dds',		'보헤미아 왕국',		'바츨라프 2세',								'왕',				'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_QUEBEC_CITY',	'quebec_city_leadericon.dds',	'캐나다',						'존 A. 맥도널드',							'총리',	'DJSHenninger'				UNION ALL
		SELECT  'MINOR_CIV_RAGUSA',			'ragusa_leadericon.dds',		'라구사 공화국',		'니콜로 비토 디 고체',							'렉터',			'DMS'						UNION ALL
		SELECT  'MINOR_CIV_RIGA',			'riga_leadericon.dds',			'라트비아 공화국',		'야니스 착스테' /*Jānis Čakste*/,				'대통령',		'TPangolin'					UNION ALL
		SELECT  'MINOR_CIV_SAMARKAND',		'samarkand_leadericon.dds',		'티무르 제국',			'테무르',										'에미르',				'M. Gerasimov/LastSword' 	UNION ALL
		SELECT  'MINOR_CIV_SIDON',			'sidon_leadericon.dds',			'시돈 왕국',			'에슈무나자르 2세',								'왕',				'Leugi'						UNION ALL
		SELECT  'MINOR_CIV_SINGAPORE',		'singapore_leadericon.dds',		'싱가포르 공화국',	'리콴유' /*Lǐ Guāngyào*/,					'총리',	'EmeraldRange'				UNION ALL
		SELECT  'MINOR_CIV_SOFIA',			'sofia_leadericon.dds',			'불가리아인과 로마인',	'시메온 1세',										'차르',				'D. Giudjenov/Nutty'		UNION ALL
		SELECT  'MINOR_CIV_SYDNEY',			'sydney_leadericon.dds',		'뉴사우스웨일스 식민지','아서 필립',								'총독',			'TPangolin'					UNION ALL
		SELECT  'MINOR_CIV_TYRE',			'tyre_leadericon.dds',			'티레 왕국',			'히람 1세',										'왕',				'LastSword'					UNION ALL
		SELECT  'MINOR_CIV_UR',				'ur_leadericon.dds',			'수메르',						'에안나툼',										'왕',				'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_VALLETTA',		'valletta_leadericon.dds',		'몰타 기사단',			'조반니 파올로 라스카리스', 						'그랜드 마스터',		'TPangolin'					UNION ALL
		SELECT  'MINOR_CIV_VANCOUVER',		'vancouver_leadericon.dds',		'캐나다',						'윌리엄 라이언 매켄지 킹',					'총리',	'TPangolin'					UNION ALL
		SELECT  'MINOR_CIV_VATICAN_CITY',	'vatican_city_leadericon.dds',	'바티칸',						'비오 9세',										'교황',				'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_VILNIUS',		'vilnius_leadericon.dds',		'리투아니아 대공국',	'게디미나스',									'대공',		'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_WELLINGTON',		'wellington_leadericon.dds',	'뉴질랜드',					'리처드 세던',								'총리',	'TPangolin'					UNION ALL
		SELECT  'MINOR_CIV_WITTENBERG',		'wittenberg_leadericon.dds',	'작센 왕국',		'프리드리히 3세',								'선제후',	'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_YEREVAN',		'yerevan_leadericon.dds',		'아르메니아 왕국',		'티리다테스 3세',								'왕',				'Janboruta'					UNION ALL
		SELECT  'MINOR_CIV_ZANZIBAR',		'zanzibar_leadericon.dds',		'잔지바르 술탄국',	"바르가시 빈 사이드",							'술탄',			'TopHatPaladin'				UNION ALL
		SELECT  'MINOR_CIV_ZURICH',			'zurich_leadericon.dds',		'스위스 연방', 		'기욤 앙리 뒤푸르', 						'장군',			'JFD'						;

-- Alternative icons
--[ALT]	SELECT  'MINOR_CIV_ALMATY',			'almaty_leadericon2.dds',		'카자흐 칸국',			'아블라이 칸',									'',					'DuskJockey'				UNION ALL
--[ALT]	SELECT  'MINOR_CIV_ANTANANARIVO',	'antananarivo_leadericon2.dds',	'이메리나 왕국',		'라나발로나 1세',									'여왕',			'DMS'						UNION ALL
--[ALT]	SELECT  'MINOR_CIV_ANTANANARIVO',	'antananarivo_leadericon3.dds',	'이메리나 왕국',		'안드리아남포이니메리나',							'왕',				'TPangolin'					UNION ALL
--[ALT]	SELECT  'MINOR_CIV_BELGRADE',		'belgrade_leadericon2.dds',		'세르비아 왕국',		'페타르 1세',										'왕',				'Janboruta'					UNION ALL
--[ALT] SELECT  'MINOR_CIV_BRUSSELS',		'brussels_leadericon2.dds',		'벨기에 왕국',		'레오폴드 2세',									'왕',				'Janboruta'					UNION ALL
--[ALT] SELECT  'MINOR_CIV_BUENOS_AIRES',	'buenos_aires_leadericon2.dds',	'쿠요, 연합주', 		'호세 데 산 마르틴',							'돈 장군',		'Leugi'						UNION ALL
--[ALT]	SELECT  'MINOR_CIV_CAHOKIA',		'cahokia_leadericon2.dds',		'미시시피인',			'버드맨',										'왕',				'H. Roe/TPangolin'			UNION ALL
--[ALT]	SELECT  'MINOR_CIV_HANOI',			'hanoi_leadericon2.dds',		'대월',						'레러이',										'황제',			'LastSword'					UNION ALL
--[ALT]	SELECT  'MINOR_CIV_HANOI',			'hanoi_leadericon3.dds',		'베트남',						'호치민',									'대통령',		'knightmare13'				UNION ALL
--[ALT]	SELECT  'MINOR_CIV_IFE',			'ife_leadericon.dds',			'이페-이페',						'아킨모예로',									'오니',				'Janboruta'					UNION ALL
--[ALT]	SELECT  'MINOR_CIV_KABUL',			'kabul_leadericon2.dds',		'두라니 제국',			'아흐마드 샤 두라니',							'에미르',				'Janboruta'					UNION ALL
--[ALT]	SELECT  'MINOR_CIV_KABUL',			'kabul_leadericon3.dds',		'두라니 제국',			'아흐마드 샤 두라니',							'에미르',				'TPangolin'					UNION ALL
--[ALT] SELECT  'MINOR_CIV_KATHMANDU',		'kathmandu_leadericon2.dds',	'네팔 왕국',			'트리부반',									'왕',				'Leugi'						UNION ALL
--[ALT]	SELECT  'MINOR_CIV_LA_VENTA',		'la_venta_leadericon2.dds',		'올멕',					'포 응베',										'쿠',				'LastSword'					UNION ALL
--[ALT]	SELECT  'MINOR_CIV_LA_VENTA',		'la_venta_leadericon3.dds',		'올멕',					'우 킥스 찬',									'쿠',				'Janboruta'					UNION ALL
--[ALT]	SELECT  'MINOR_CIV_LA_VENTA',		'la_venta_leadericon4.dds',		'올멕',					'포 응베',										'쿠',				'Leugi'						UNION ALL
--[ALT] SELECT  'MINOR_CIV_MALACCA',		'malacca_leadericon2.dds',		'말라카 술탄국',		'파라메스와라',									'술탄',			'TPangolin'					UNION ALL
--[ALT]	SELECT  'MINOR_CIV_MALACCA',		'malacca_leadericon3.dds',		'케다',						'압둘 할림',									'술탄',			'Nutty'						UNION ALL
--[ALT]	SELECT  'MINOR_CIV_MBANZA_KONGO',	'mbanza_kongo_leadericon2.dds',	'암분두 왕국',			'아나 은징가 음반데',							'응골라',			'Leugi'						UNION ALL
--[ALT]	SELECT  'MINOR_CIV_MELBOURNE',		'melbourne_leadericon2.dds',	'호주 연방','빌리 휴스',									'총리',	'DarthKyofu'				UNION ALL
--[ALT]	SELECT  'MINOR_CIV_MOMBASA',		'mombasa_leadericon2.dds',		'케냐 공화국',		'조모 케냐타',								'대통령',		'DMS'						UNION ALL
--[ALT]	SELECT  'MINOR_CIV_MOGADISHU',		'mogadishu_leadericon2.dds',	'소말리아 연방 공화국',		'아덴 아데',									'대통령',		'TPangolin'					UNION ALL
--[ALT]	SELECT  'MINOR_CIV_MOGADISHU',		'mogadishu_leadericon3.dds',	'소말리아 연방 공화국',		'시아드 바레',									'대통령',		'TopHatPaladin'				UNION ALL
--[ALT] SELECT  'MINOR_CIV_PANAMA_CITY',	'panama_city_leadericon2.dds',	'파나마 공화국',		'빅토리아노 로렌조',							'장군',			'Leugi'						UNION ALL
--[ALT] SELECT  'MINOR_CIV_RAGUSA',			'ragusa_leadericon2.dds',		'라구사',						'오귀스트 드 마르몽',							'공작',				'Nutty'						UNION ALL
--[ALT]	SELECT  'MINOR_CIV_SAMARKAND',		'samarkand_leadericon2.dds',	'티무르 제국',			'티무르',										'에미르',				'Tomatekh'					UNION ALL
--[ALT]	SELECT  'MINOR_CIV_SINGAPORE',		'singapore_leadericon2.dds',	'싱가포르 공화국',	'리콴유' /*Lǐ Guāngyào*/,					'총리',	'TPangolin'					UNION ALL
--[ALT]	SELECT  'MINOR_CIV_SINGAPORE',		'singapore_leadericon3.dds',	'싱가포르',					'토마스 스탬포드 래플스',						'경',				'adan_eslavo'				UNION ALL
--[ALT]	SELECT  'MINOR_CIV_SOFIA',			'sofia_leadericon2.dds',		'불가리아인',				'시메온 1세',										'차르',				'D. Giudjenov/TPangolin'	UNION ALL
--[ALT]	SELECT  'MINOR_CIV_SYDNEY',			'sydney_leadericon2.dds',		'뉴사우스웨일스',				'헨리 파크스 경',								'주총리',			'TPangolin'					UNION ALL
--[ALT] SELECT  'MINOR_CIV_VANCOUVER',		'vancouver_leadericon2.dds',	'캐나다',						'윌리엄 라이언 매켄지 킹',					'총리',	'TPangolin'					UNION ALL
--[ALT] SELECT  'MINOR_CIV_VILNIUS',		'vilnius_leadericon2.dds',		'리투아니아 대공국',	'게디미나스',									'대공',		'LastSword'					UNION ALL
--[ALT]	SELECT  'MINOR_CIV_VATICAN_CITY',	'vatican_city_leadericon2.dds',	'바티칸',						'요한 바오로 2세',									'교황',				'DMS'						UNION ALL
--[ALT]	SELECT  'MINOR_CIV_WELLINGTON',		'wellington_leadericon2.dds',	'뉴질랜드',					'리처드 세던',								'총리',	'Janboruta'					UNION ALL
--[ALT]	SELECT  'MINOR_CIV_WELLINGTON',		'wellington_leadericon3.dds',	'뉴질랜드',					'헨리 슈얼',									'주총리',			'TPangolin'					UNION ALL
--[ALT] SELECT  'MINOR_CIV_YEREVAN',		'yerevan_leadericon2.dds',		'아르메니아 왕국',		'티그라네스 2세',									'왕',				'DarthKyofu'				UNION ALL
--[ALT] SELECT  'MINOR_CIV_YEREVAN',		'yerevan_leadericon3.dds',		'아르메니아 왕국',		'티그라네스 2세',									'왕',				'Leugi'						UNION ALL
--[ALT]	SELECT  'MINOR_CIV_ZURICH', 		'zurich_leadericon2.dds', 		'스위스 연방', 		'마테우스 쉬너', 							'추기경', 		'Krateng' 					UNION ALL
	
--[OLD] SELECT  'MINOR_CIV_DUBLIN',			'dublin_leadericon.dds',		'더블린',				 		"다니엘 오코넬",								'시장',		'B. Mulrenin/Nutty'			UNION ALL
--[OLD] SELECT  'MINOR_CIV_EDINBURGH',		'edinburgh_leadericon.dds',		'스코틀랜드인',					'제임스 6세',										'왕',				'LastSword'					UNION ALL
--[OLD] SELECT  'MINOR_CIV_HELSINKI',		'helsinki_leadericon.dds',		'핀란드',						'구스타프 만네르헤임',							'대통령',		'Hypereon'					UNION ALL
--[OLD] SELECT  'MINOR_CIV_LISBON',			'lisbon_leadericon.dds',		'포르투갈',						'주앙 2세',										'왕',				'Janboruta'					UNION ALL