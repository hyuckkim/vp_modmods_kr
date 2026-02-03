--=============================================--
-- UCS compatibility check (part I)
--=============================================--
/* Unique City-States */
INSERT INTO BuildingClasses (Type)
SELECT		'BUILDINGCLASS_DUMMY_CSL_UCS'
WHERE EXISTS (SELECT * FROM Resources WHERE Type='RESOURCE_DOGO_CANARIO');
--=============================================--
-- Adding art for new CSs from UCS
--=============================================--
	INSERT INTO MinorCivLeaders
				(Type,							LeaderIcon,						LeaderPlace,									LeaderName,								LeaderTitle,			LeaderArtistName)
		SELECT	'MINOR_CIV_ADEJE',				'adeje_leadericon.dds',			'관체족',									'티네르페',								'대멘세이',			'DJSHenninger'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_AL_TIRABIN',			'al_tirabin_leadericon.dds',	'베두인족',									'하마드 파샤 아스-수피',					'지도자',				'Grant'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL
		SELECT	'MINOR_CIV_AMBRACIA',			'ambracia_leadericon.dds',		'에피루스',									'피로스',								'왕',					'Danmacsch'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_ANANGULA',			'anangula_leadericon.dds',		'알류트족',									'아구국스',								'창조자',				'TopHatPaladin'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_ANDORRA',			'andorra_leadericon.dds',		'안도라 공국',					'로제-베르나르 3세',					'백작',				'Grant'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_ARMAGH',				'armagh_leadericon.dds',		'게일 아일랜드',							'패트릭',								'성인',				'Mosile'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_AUCKLAND',			'parihaka_leadericon.dds',		'응가티 토아' /*Ngāti Toa*/,					'테 라우파라하',							'랑가티라',			'janboruta'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL
		SELECT	'MINOR_CIV_AYUTTHAYA',			'ayutthaya_leadericon.dds',		'아유타야 왕국',						'나레수안',								'왕',					'sukritact'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_BAGAN',				'bagan_leadericon.dds',			'파간 왕국',							'아나우라타 민소',						'왕',					'Sukritact'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_BAGHCASARAY',		'baghcasaray_leadericon.dds',	'크림 칸국',							'하지 1세 기라이',							'칸',					'Darth'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_BALLEY_CHASHTAL',	'balley_leadericon.dds',		'맨섬과 군도 왕국',			'소머레드',								'왕',					'Davey_henninger'					WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_BALKH',				'balkh_leadericon.dds',			'그리스-박트리아 왕국',					'데메트리오스 1세',							'왕',					'tarcisiocm'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_BEDULU',				'bedulu_leadericon.dds',		'발리 왕국',							'마헨드라다타',						'여왕',				'TopHatPaladin'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_CANOSSA',			'canossa_leadericon.dds',		'토스카나 변경백령',							'마틸다',								'변경백',			'DuskJockey'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL
		SELECT	'MINOR_CIV_CHEVAK',				'chevak_leadericon.dds',		"유픽족",									'아파누그팍',							'장군',				'Mosile'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_CLERMONT',			'clermont_leadericon.dds',		'아키텐 공국',						'우르바노 2세',								'교황',					'DarthKyofu'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_DAKKAR',				'dakkar_leadericon.dds',		'아달 제국',								'사브르 아드 딘 3세',						'술탄',				'Lime'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_DALI',				'dali_leadericon.dds',			'대리국',							'단사평',							'사령관',			'Grant'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_DANO',				'dano_leadericon.dds',			'다가라 왕국',						'살리푸 디아요르',						'나아',					'LastSword'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_DJIBOUTI',			'djibouti_leadericon.dds',		'지부티 공화국',						'하산 굴레드 압티돈',				'대통령',			'adan_eslavo'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_DODOMA',				'dodoma_leadericon.dds',		'탄자니아 연합 공화국',				'알리 하산 므위니',					'대통령',			'Danmacsch'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_DOUALA',				'douala_leadericon.dds',		'카메룬 공화국',						'아흐마두 아히조',						'대통령',			'Mosile'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_FAYA',				'faya_leadericon.dds',			'차드 공화국',							'이드리스 데비',							'대통령',			'RawSasquatch'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_GRANADA',			'granada_leadericon.dds',		'그라나다 토후국',						'무함마드 1세 이븐 유수프',					'에미르',					'sukritact'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL
		SELECT	'MINOR_CIV_GWYNEDD',			'gwynedd_leadericon.dds',		'귀네드 왕국',						'오와인 글린두르' /*Owain Glyndŵr*/,		'왕자',				'janboruta'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_HANUABADA',			'hanuabada_leadericon.dds',		'모투족',								'에다이 시아보',							'챔피언',				'RawSasquatch'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_HONDURAS',			'honduras_leadericon.dds',		'온두라스 공화국',						'마누엘 보니야 치리노스',				'대통령',			'Mosile'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_HONIARA',			'honiara_leadericon.dds',		'솔로몬 제도',							'피터 케닐로레아',						'총리 경',	'adan_eslavo'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_IRUNEA',				'irunea_leadericon.dds',		'이루네아 왕국',						'안초 6세, 현명왕',					'왕',					'Gwennog'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_ISKANWAYA',			'iskanwaya_leadericon.dds',		'칼라와야족',							'말쿠',								'',						'Leugi'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_JETARKTE',			'jetarkte_leadericon.dds',		'카웨스카족' /*Kawésqar*/,					'테르와 코요',							'',						'HoopThrower and DarthStarKiller'	WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_JUYUBIT',			'juyubit_leadericon.dds',		'통바족',									'토이푸리나',							'치유사',				'Rawsasquatch'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_KAGYRGYN',			'kagyrgyn_leadericon.dds',		'축치족',									'라우틸리와들린',						'수석 전사',	'TPangolin'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_KARASJOHKA',			'karasjohka_leadericon.dds',	'사미족',										'에아드니',								'어머니',				'Sukritact'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_KARYES',				'karyes_leadericon.dds',		'아토스 로마 속주',					'콘스탄티누스 1세',						'황제',				'janboruta'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_KATENDE',			'katende_leadericon.dds',		'루바 왕국',							'일룽가 숭구',							'왕',					'TopHatPaladin'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_KIGALI',				'kigali_leadericon.dds',		'르완다 왕국',						'키겔리 4세 르와부기리',					'음와미',				'Danmacsch'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_LACONIA',			'lacedaemon_leadericon.dds',	'라코니아',									'레오니다스 1세',							'왕',					'janboruta'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_LAHORE',				'lahore_leadericon.dds',		'시크 제국',								'란지트 싱',							'위대한 마하라자',		'RawSasquatch'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_LEVUKA',				'levuka_leadericon.dds',		'피지 왕국',							'세루 에페니사 카코바우',					'라투',					'Arilasqueto'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_LONGYAN',			'longyan_leadericon.dds',		'객가족',									'진란지시',							'반란 지도자',		'janboruta'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_MANAGUA',			'managua_leadericon.dds',		'니카라과 공화국',					'아우구스토 세사르 산디노',				'',						'Senshi'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_MATONJENI',			'matonjeni_leadericon.dds',		'바칼랑가족',									'니엔제마',								'창립 사제',		'LastSword'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_MBABANE',			'mbabane_leadericon.dds',		'에스와티니 왕국',						'라보치베니 음들룰리',					'대비',			'Danmacsch'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_MENDYARRUP',			'mendyarrup_leadericon.dds',	'눙가르족',									'야간',								'전사',				'TopHatPaladin'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_MUISCA',				'muisca_leadericon.dds',		'무이스카 연방',						'네메케네',							'지파',					'Leugi'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_MULTAN',				'multan_leadericon.dds',		'가즈나 제국',						'마흐무드 이븐 사북티긴',				'술탄',				'TopHatPaladin'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_MUSCAT',				'muscat_leadericon.dds',		'오만 술탄국',						'사이프 빈 술탄',						'이맘',					'janboruta'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_MUTITJULU',			'mutitjulu_leadericon.dds',		'아난구 부족',							'로버트 제임스 랜달',					'칠피',				'TopHatPaladin and DarthKyofu'		WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_NAN_MADOL',			'leluh_leadericon.dds',			'난마돌',								'이소켈레켈',							'정복자',			'Jarcast'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL
		SELECT	'MINOR_CIV_NGAZARGAMU',			'ngazargamu_leadericon.dds',	'카넴-보르누 제국',						'이드리스 알루마',							'마이',					'Janboruta'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_NYARYANA_MARQ',		'nyaryana_marq_leadericon.dds',	'네네츠족',									'바블료 네니앙',						'',						'TPangolin'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_OC_EO',				'oc_eo_leadericon.dds',			'푸난 왕국' /*Fúnán*/,					'소마',									'여왕',				'Grant'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_ODENSO',				'odenso_leadericon.dds',		'핀란드 공화국',						'카를 구스타프 만네르헤임',				'남작',				'Hypereon'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_OUIDAH',				'ouidah_leadericon.dds',		'위다 왕국',						'하폰',								'왕',					'Hoop Thrower'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_PALMYRA',			'palmyra_leadericon.dds',		'팔미라 제국',							'바트-자바이' /*Septima Zenobia*/,		'여왕',				'TPangolin'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_PELYM',				'pelym_leadericon.dds',			'페름인',									'아지카이',								'대공',			'Grant'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_PHANOTEUS',			'phanoteus_leadericon.dds',		'포키스',									'오노마르쿠스',							'장군',				'Mosile'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_POKROVKA',			'pokrovka_leadericon.dds',		'마사게타이 연맹',					'토미리스',								'여왕',				'TarcisioCM'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_QUELIMANE',			'quelimane_leadericon.dds',		'모잠비크 공화국' /*Moçambique*/,	'마누엘 데 아라우조',						'시장',				'adan_eslavo'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_RISHIKESH',			'rishikesh_leadericon.dds',		'가르왈 왕국',						'카낙 팔 파라마라',					'라자',					'EmeraldRange'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_SADDARVAZEH',		'saddarvazeh_leadericon.dds',	'아케메네스 제국',						'비스타스파' /*Vištāspa*/,				'사트라프',				'Gwennog'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_SANAA',				'sanaa_leadericon.dds',			'예멘 술탄국',						'아르와 알-술라이히',						'여왕',				'Urdnot '							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_SANANDAJ',			'sanandaj_leadericon.dds',		'아르달란 공국',					'바니 아르달란',							'왕',					'Darth'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_SANTO_DOMINGO',		'santo_domingo_leadericon.dds',	'도미니카 공화국',							'후안 파블로 두아르테',					'',						'Mosile'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_SARNATH',			'sarnath_leadericon.dds',		'마우리아 제국',							'아소카',								'황제',				'janboruta'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL
		SELECT	'MINOR_CIV_SGANG_GWAAY',		'sgang_leadericon.dds',			'하이다족',									'코야',								'추장',				'RawSasquatch'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_SIERRA_LEONE',		'sierra_leone_leadericon.dds',	'시에라리온 공화국',					'밀턴 마가이 경',					'총리',		'adan_eslavo'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_SUCEAVA',			'suceava_leadericon.dds',		'몰다비아 공국',							'스테판 3세',							'왕',					'DJSHenninger'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_SURREY',				'surrey_leadericon.dds',		'웨식스 왕국',					'에설울프',							'왕',					'janboruta'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_TAIWAN',				'taipei_leadericon.dds',		'중화민국',						'쑨원',							'총통',			'DJSHenninger'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_TBILISI',			'tbilisi_leadericon.dds',		'조지아 왕국',						'타마르',								'여왕',				'Urdnot'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL
		SELECT	'MINOR_CIV_THIMPHU',			'thimphu_leadericon.dds',		'부탄 왕국',						'지그메 도르지 왕추크',				'용왕',			'janboruta'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_TIWANAKU',			'tiwanaku_leadericon.dds',		'티와나쿠-와리 제국',						'후유스투스',								'카시케',				'Leugi'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_TUNIS',				'tunis_leadericon.dds',			'하프스 술탄국',							'아부 자카리야 야히야',					'술탄',				'Regalman'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_VADUZ',				'vaduz_leadericon.dds',			'리히텐슈타인 공국',			'요한 2세',							'대공',				'DuskJockey'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_WOOTEI_NIICIE',		'wootei_niicie_leadericon.dds',	'아라파호족',									'프리티 노즈',							'전쟁 추장',			'Arilasqueto'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_YANGCHENG',			'yangcheng_leadericon.dds',		'하나라',								'우',									'황제',				'janboruta'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS');
		
		/*
		SELECT	'MINOR_CIV_ISHIYAMA',			'ishiyama_leadericon.dds',		'잇코잇키' Ikkō-ikki,						'코사',	Kōsa							'주지',			'PorkBean'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_YAIUWA',				'yaiuwa_leadericon.dds',		'하우시족',									'테네니스크',								'샤먼',				'Grant'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		*/
		
		/*
		SELECT	'MINOR_CIV_SKARA_BRAE',			'skara_brae_leadericon.dds',	'픽트 연맹',					'오엥구스 막 페르구사',					'왕',					'Firebug'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		SELECT	'MINOR_CIV_LUXEMBOURG',			'luxembourg_leadericon.dds',	'룩셈부르크 대공국',				'에르메신데 2세',							'백작 부인',				'DJSHenninger'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
		*/

--[ALT]	SELECT	'MINOR_CIV_ANDORRA',			'andorra_leadericon2.dds',		'안도라 공국',					'로제-베르나르 3세',					'백작',				'Kiang'								WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
--[ALT]	SELECT	'MINOR_CIV_ANDORRA',			'tintagel_leadericon2.dds',		'안도라 공국',					'로제-베르나르 3세',					'백작',				'DuskJockey'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
--[ALT]	SELECT	'MINOR_CIV_AUCKLAND',			'wellington_leadericon2.dds',	'뉴질랜드',									'헨리 슈얼',							'총리',		'TPangolin'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL
--[ALT]	SELECT	'MINOR_CIV_CLERMONT',			'clermont_leadericon2.dds',		'아키텐 공국',						'우르바노 2세',								'교황',					'Mosile'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
--[ALT]	SELECT	'MINOR_CIV_FAYA',				'faya_leadericon2.dds',			'차드 공화국',							'이드리스 데비',							'대통령',			'adan_eslavo'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
--[ALT]	SELECT	'MINOR_CIV_GRANADA',			'granada_leadericon2.dds',		'그라나다 토후국',						'무함마드 1세 이븐 유수프',					'에미르',					'Mosile'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL
--[ALT]	SELECT	'MINOR_CIV_IRUNEA',				'irunea_leadericon2.dds',		'이루네아 왕국',						'에네코 아리차',							'왕',					'Gwennog'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
--[ALT]	SELECT	'MINOR_CIV_LONGYAN',			'longyan_leadericon2.dds',		'객가족',									'진란지시',							'반란 지도자',		'janboruta'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
--[ALT]	SELECT	'MINOR_CIV_MANAGUA',			'managua_leadericon2.dds',		'니카라과 공화국',					'아나스타시오 소모사 가르시아',				'대통령',			'Mosile'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
--[ALT]	SELECT	'MINOR_CIV_NAN_MADOL',			'leluh_leadericon2.dds',		'난마돌',								'올로소파',								'',						'Gedemo'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL
--[ALT]	SELECT	'MINOR_CIV_PHANOTEUS',			'phanoteus_leadericon2.dds',	'포키스',									'오노마르쿠스',							'장군',				'Merrick'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
--[ALT]	SELECT	'MINOR_CIV_SANAA',				'sanaa_leadericon2.dds',		'시바',										'야히야',								'이맘',					'adan_eslavo'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
--[ALT]	SELECT	'MINOR_CIV_SARNATH',			'sarnath_leadericon2.dds',		'마우리아 제국',							'아소카',								'황제',				'LastSword'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL
--[ALT]	SELECT	'MINOR_CIV_SGANG_GWAAY',		'sgang_leadericon2.dds',		'하이다족',									'코야',								'추장',				'LastSword'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
--[ALT]	SELECT	'MINOR_CIV_SURREY',				'surrey_leadericon2.dds',		'웨식스 왕국',					'에설울프',							'왕',					'adan_eslavo'						WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
--[ALT]	SELECT	'MINOR_CIV_TAIWAN',				'taipei_leadericon2.dds',		'중화민국',						'쑨원',							'총통',			'JakeWalrusWhale'					WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL	
--[ALT]	SELECT	'MINOR_CIV_TBILISI',			'tbilisi_leadericon2.dds',		'조지아 왕국',						'타마르',								'여왕',				'Urdnot'							WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_CSL_UCS') UNION ALL
--=============================================--
-- UCS compatibility trigger (part II)
--=============================================--
/* Unique City-States */
CREATE TRIGGER IF NOT EXISTS CSLCompatibilityUCS
AFTER INSERT ON Resources
WHEN NEW.Type = 'RESOURCE_DOGO_CANARIO'
BEGIN
    INSERT INTO BuildingClasses (Type)
	VALUES		('BUILDINGCLASS_DUMMY_CSL_UCS_TRG');

	INSERT INTO MinorCivLeaders
				(Type,							LeaderIcon,						LeaderPlace,									LeaderName,								LeaderTitle,			LeaderArtistName)
		SELECT	'MINOR_CIV_ADEJE',				'adeje_leadericon.dds',			'관체족',									'티네르페',								'대멘세이',			'DJSHenninger' UNION ALL	
		SELECT	'MINOR_CIV_AL_TIRABIN',			'al_tirabin_leadericon.dds',	'베두인족',									'하마드 파샤 아스-수피',					'지도자',				'Grant' UNION ALL
		SELECT	'MINOR_CIV_AMBRACIA',			'ambracia_leadericon.dds',		'에피루스',									'피로스',								'왕',					'Danmacsch' UNION ALL	
		SELECT	'MINOR_CIV_ANANGULA',			'anangula_leadericon.dds',		'알류트족',									'아구국스',								'창조자',				'TopHatPaladin' UNION ALL	
		SELECT	'MINOR_CIV_ANDORRA',			'andorra_leadericon.dds',		'안도라 공국',					'로제-베르나르 3세',					'백작',				'Grant' UNION ALL	
		SELECT	'MINOR_CIV_ARMAGH',				'armagh_leadericon.dds',		'게일 아일랜드',							'패트릭',								'성인',				'Mosile' UNION ALL	
		SELECT	'MINOR_CIV_AUCKLAND',			'parihaka_leadericon.dds',		'응가티 토아' /*Ngāti Toa*/,					'테 라우파라하',							'랑가티라',			'janboruta' UNION ALL
		SELECT	'MINOR_CIV_AYUTTHAYA',			'ayutthaya_leadericon.dds',		'아유타야 왕국',						'나레수안',								'왕',					'sukritact' UNION ALL	
		SELECT	'MINOR_CIV_BAGAN',				'bagan_leadericon.dds',			'파간 왕국',							'아나우라타 민소',						'왕',					'Sukritact' UNION ALL	
		SELECT	'MINOR_CIV_BAGHCASARAY',		'baghcasaray_leadericon.dds',	'크림 칸국',							'하지 1세 기라이',							'칸',					'Darth' UNION ALL	
		SELECT	'MINOR_CIV_BALLEY_CHASHTAL',	'balley_leadericon.dds',		'맨섬과 군도 왕국',			'소머레드',								'왕',					'Davey_henninger' UNION ALL	
		SELECT	'MINOR_CIV_BALKH',				'balkh_leadericon.dds',			'그리스-박트리아 왕국',					'데메트리오스 1세',							'왕',					'tarcisiocm' UNION ALL	
		SELECT	'MINOR_CIV_BEDULU',				'bedulu_leadericon.dds',		'발리 왕국',							'마헨드라다타',						'여왕',				'TopHatPaladin' UNION ALL	
		SELECT	'MINOR_CIV_CANOSSA',			'canossa_leadericon.dds',		'토스카나 변경백령',							'마틸다',								'변경백',			'DuskJockey' UNION ALL
		SELECT	'MINOR_CIV_CHEVAK',				'chevak_leadericon.dds',		"유픽족",									'아파누그팍',							'장군',				'Mosile' UNION ALL	
		SELECT	'MINOR_CIV_CLERMONT',			'clermont_leadericon.dds',		'아키텐 공국',						'우르바노 2세',								'교황',					'DarthKyofu' UNION ALL	
		SELECT	'MINOR_CIV_DAKKAR',				'dakkar_leadericon.dds',		'아달 제국',								'사브르 아드 딘 3세',						'술탄',				'Lime' UNION ALL	
		SELECT	'MINOR_CIV_DALI',				'dali_leadericon.dds',			'대리국',							'단사평',							'사령관',			'Grant' UNION ALL	
		SELECT	'MINOR_CIV_DANO',				'dano_leadericon.dds',			'다가라 왕국',						'살리푸 디아요르',						'나아',					'LastSword' UNION ALL	
		SELECT	'MINOR_CIV_DJIBOUTI',			'djibouti_leadericon.dds',		'지부티 공화국',						'하산 굴레드 압티돈',				'대통령',			'adan_eslavo' UNION ALL	
		SELECT	'MINOR_CIV_DODOMA',				'dodoma_leadericon.dds',		'탄자니아 연합 공화국',				'알리 하산 므위니',					'대통령',			'Danmacsch' UNION ALL	
		SELECT	'MINOR_CIV_DOUALA',				'douala_leadericon.dds',		'카메룬 공화국',						'아흐마두 아히조',						'대통령',			'Mosile' UNION ALL	
		SELECT	'MINOR_CIV_FAYA',				'faya_leadericon.dds',			'차드 공화국',							'이드리스 데비',							'대통령',			'RawSasquatch' UNION ALL	
		SELECT	'MINOR_CIV_GRANADA',			'granada_leadericon.dds',		'그라나다 토후국',						'무함마드 1세 이븐 유수프',					'에미르',					'sukritact' UNION ALL
		SELECT	'MINOR_CIV_GWYNEDD',			'gwynedd_leadericon.dds',		'귀네드 왕국',						'오와인 글린두르' /*Owain Glyndŵr*/,		'왕자',				'janboruta' UNION ALL	
		SELECT	'MINOR_CIV_HANUABADA',			'hanuabada_leadericon.dds',		'모투족',								'에다이 시아보',							'챔피언',				'RawSasquatch' UNION ALL	
		SELECT	'MINOR_CIV_HONDURAS',			'honduras_leadericon.dds',		'온두라스 공화국',						'마누엘 보니야 치리노스',				'대통령',			'Mosile' UNION ALL	
		SELECT	'MINOR_CIV_HONIARA',			'honiara_leadericon.dds',		'솔로몬 제도',							'피터 케닐로레아',						'총리 경',	'adan_eslavo' UNION ALL	
		SELECT	'MINOR_CIV_IRUNEA',				'irunea_leadericon.dds',		'이루네아 왕국',						'안초 6세, 현명왕',					'왕',					'Gwennog' UNION ALL	
		SELECT	'MINOR_CIV_ISKANWAYA',			'iskanwaya_leadericon.dds',		'칼라와야족',							'말쿠',								'',						'Leugi' UNION ALL	
		SELECT	'MINOR_CIV_JETARKTE',			'jetarkte_leadericon.dds',		'카웨스카족' /*Kawésqar*/,					'테르와 코요',							'',						'HoopThrower and DarthStarKiller' UNION ALL	
		SELECT	'MINOR_CIV_JUYUBIT',			'juyubit_leadericon.dds',		'통바족',									'토이푸리나',							'치유사',				'Rawsasquatch' UNION ALL	
		SELECT	'MINOR_CIV_KAGYRGYN',			'kagyrgyn_leadericon.dds',		'축치족',									'라우틸리와들린',						'수석 전사',	'TPangolin' UNION ALL	
		SELECT	'MINOR_CIV_KARASJOHKA',			'karasjohka_leadericon.dds',	'사미족',										'에아드니',								'어머니',				'Sukritact' UNION ALL	
		SELECT	'MINOR_CIV_KARYES',				'karyes_leadericon.dds',		'아토스 로마 속주',					'콘스탄티누스 1세',						'황제',				'janboruta' UNION ALL	
		SELECT	'MINOR_CIV_KATENDE',			'katende_leadericon.dds',		'루바 왕국',							'일룽가 숭구',							'왕',					'TopHatPaladin' UNION ALL	
		SELECT	'MINOR_CIV_KIGALI',				'kigali_leadericon.dds',		'르완다 왕국',						'키겔리 4세 르와부기리',					'음와미',				'Danmacsch' UNION ALL	
		SELECT	'MINOR_CIV_LACONIA',			'lacedaemon_leadericon.dds',	'라코니아',									'레오니다스 1세',							'왕',					'janboruta' UNION ALL	
		SELECT	'MINOR_CIV_LAHORE',				'lahore_leadericon.dds',		'시크 제국',								'란지트 싱',							'위대한 마하라자',		'RawSasquatch' UNION ALL	
		SELECT	'MINOR_CIV_LEVUKA',				'levuka_leadericon.dds',		'피지 왕국',							'세루 에페니사 카코바우',					'라투',					'Arilasqueto' UNION ALL	
		SELECT	'MINOR_CIV_LONGYAN',			'longyan_leadericon.dds',		'객가족',									'진란지시',							'반란 지도자',		'janboruta' UNION ALL	
		SELECT	'MINOR_CIV_MANAGUA',			'managua_leadericon.dds',		'니카라과 공화국',					'아우구스토 세사르 산디노',				'',						'Senshi' UNION ALL	
		SELECT	'MINOR_CIV_MATONJENI',			'matonjeni_leadericon.dds',		'바칼랑가족',									'니엔제마',								'창립 사제',		'LastSword' UNION ALL	
		SELECT	'MINOR_CIV_MBABANE',			'mbabane_leadericon.dds',		'에스와티니 왕국',						'라보치베니 음들룰리',					'대비',			'Danmacsch' UNION ALL	
		SELECT	'MINOR_CIV_MENDYARRUP',			'mendyarrup_leadericon.dds',	'눙가르족',									'야간',								'전사',				'TopHatPaladin' UNION ALL	
		SELECT	'MINOR_CIV_MUISCA',				'muisca_leadericon.dds',		'무이스카 연방',						'네메케네',							'지파',					'Leugi' UNION ALL	
		SELECT	'MINOR_CIV_MULTAN',				'multan_leadericon.dds',		'가즈나 제국',						'마흐무드 이븐 사북티긴',				'술탄',				'TopHatPaladin' UNION ALL	
		SELECT	'MINOR_CIV_MUSCAT',				'muscat_leadericon.dds',		'오만 술탄국',						'사이프 빈 술탄',						'이맘',					'janboruta' UNION ALL	
		SELECT	'MINOR_CIV_MUTITJULU',			'mutitjulu_leadericon.dds',		'아난구 부족',							'로버트 제임스 랜달',					'칠피',				'TopHatPaladin and DarthKyofu' UNION ALL	
		SELECT	'MINOR_CIV_NAN_MADOL',			'leluh_leadericon.dds',			'난마돌',								'이소켈레켈',							'정복자',			'Jarcast' UNION ALL
		SELECT	'MINOR_CIV_NGAZARGAMU',			'ngazargamu_leadericon.dds',	'카넴-보르누 제국',						'이드리스 알루마',							'마이',					'Janboruta' UNION ALL	
		SELECT	'MINOR_CIV_NYARYANA_MARQ',		'nyaryana_marq_leadericon.dds',	'네네츠족',									'바블료 네니앙',						'',						'TPangolin' UNION ALL	
		SELECT	'MINOR_CIV_OC_EO',				'oc_eo_leadericon.dds',			'푸난 왕국' /*Fúnán*/,					'소마',									'여왕',				'Grant' UNION ALL	
		SELECT	'MINOR_CIV_ODENSO',				'odenso_leadericon.dds',		'핀란드 공화국',						'카를 구스타프 만네르헤임',				'남작',				'Hypereon' UNION ALL	
		SELECT	'MINOR_CIV_OUIDAH',				'ouidah_leadericon.dds',		'위다 왕국',						'하폰',								'왕',					'Hoop Thrower' UNION ALL	
		SELECT	'MINOR_CIV_PALMYRA',			'palmyra_leadericon.dds',		'팔미라 제국',							'바트-자바이' /*Septima Zenobia*/,		'여왕',				'TPangolin' UNION ALL	
		SELECT	'MINOR_CIV_PELYM',				'pelym_leadericon.dds',			'페름인',									'아지카이',								'대공',			'Grant' UNION ALL	
		SELECT	'MINOR_CIV_PHANOTEUS',			'phanoteus_leadericon.dds',		'포키스',									'오노마르쿠스',							'장군',				'Mosile' UNION ALL	
		SELECT	'MINOR_CIV_POKROVKA',			'pokrovka_leadericon.dds',		'마사게타이 연맹',					'토미리스',								'여왕',				'TarcisioCM' UNION ALL	
		SELECT	'MINOR_CIV_QUELIMANE',			'quelimane_leadericon.dds',		'모잠비크 공화국' /*Moçambique*/,	'마누엘 데 아라우조',						'시장',				'adan_eslavo' UNION ALL	
		SELECT	'MINOR_CIV_RISHIKESH',			'rishikesh_leadericon.dds',		'가르왈 왕국',						'카낙 팔 파라마라',					'라자',					'EmeraldRange' UNION ALL	
		SELECT	'MINOR_CIV_SADDARVAZEH',		'saddarvazeh_leadericon.dds',	'아케메네스 제국',						'비스타스파' /*Vištāspa*/,				'사트라프',				'Gwennog' UNION ALL	
		SELECT	'MINOR_CIV_SANAA',				'sanaa_leadericon.dds',			'예멘 술탄국',						'아르와 알-술라이히',						'여왕',				'Urdnot ' UNION ALL	
		SELECT	'MINOR_CIV_SANANDAJ',			'sanandaj_leadericon.dds',		'아르달란 공국',					'바니 아르달란',							'왕',					'Darth' UNION ALL	
		SELECT	'MINOR_CIV_SANTO_DOMINGO',		'santo_domingo_leadericon.dds',	'도미니카 공화국',							'후안 파블로 두아르테',					'',						'Mosile' UNION ALL	
		SELECT	'MINOR_CIV_SARNATH',			'sarnath_leadericon.dds',		'마우리아 제국',							'아소카',								'황제',				'janboruta' UNION ALL
		SELECT	'MINOR_CIV_SGANG_GWAAY',		'sgang_leadericon.dds',			'하이다족',									'코야',								'추장',				'RawSasquatch' UNION ALL	
		SELECT	'MINOR_CIV_SIERRA_LEONE',		'sierra_leone_leadericon.dds',	'시에라리온 공화국',					'밀턴 마가이 경',					'총리',		'adan_eslavo' UNION ALL	
		SELECT	'MINOR_CIV_SUCEAVA',			'suceava_leadericon.dds',		'몰다비아 공국',							'스테판 3세',							'왕',					'DJSHenninger' UNION ALL	
		SELECT	'MINOR_CIV_SURREY',				'surrey_leadericon.dds',		'웨식스 왕국',					'에설울프',							'왕',					'janboruta' UNION ALL	
		SELECT	'MINOR_CIV_TAIWAN',				'taipei_leadericon.dds',		'중화민국',						'쑨원',							'총통',			'DJSHenninger' UNION ALL	
		SELECT	'MINOR_CIV_TBILISI',			'tbilisi_leadericon.dds',		'조지아 왕국',						'타마르',								'여왕',				'Urdnot' UNION ALL
		SELECT	'MINOR_CIV_THIMPHU',			'thimphu_leadericon.dds',		'부탄 왕국',						'지그메 도르지 왕추크',				'용왕',			'janboruta' UNION ALL	
		SELECT	'MINOR_CIV_TIWANAKU',			'tiwanaku_leadericon.dds',		'티와나쿠-와리 제국',						'후유스투스',								'카시케',				'Leugi' UNION ALL	
		SELECT	'MINOR_CIV_TUNIS',				'tunis_leadericon.dds',			'하프스 술탄국',							'아부 자카리야 야히야',					'술탄',				'Regalman' UNION ALL	
		SELECT	'MINOR_CIV_VADUZ',				'vaduz_leadericon.dds',			'리히텐슈타인 공국',			'요한 2세',							'대공',				'DuskJockey' UNION ALL	
		SELECT	'MINOR_CIV_WOOTEI_NIICIE',		'wootei_niicie_leadericon.dds',	'아라파호족',									'프리티 노즈',							'전쟁 추장',			'Arilasqueto' UNION ALL	
		SELECT	'MINOR_CIV_YANGCHENG',			'yangcheng_leadericon.dds',		'하나라',								'우',									'황제',				'janboruta';
END;