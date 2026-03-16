--======================================================================================================================================
-- Master Table
--======================================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCivLeaders (
	'ID' INTEGER PRIMARY KEY AUTOINCREMENT,
	'Type' TEXT NOT NULL UNIQUE,
	'LeaderIcon' TEXT NOT NULL,
	'LeaderPlace' TEXT DEFAULT NULL,
	'LeaderName' TEXT DEFAULT NULL,
	'LeaderTitle' TEXT DEFAULT NULL,
	'LeaderArtistName' TEXT DEFAULT NULL,
	FOREIGN KEY (Type) REFERENCES MinorCivilizations(Type));
--======================================================================================================================================
-- UCS REPLACEMENTS + UNFINISHED
--======================================================================================================================================
INSERT OR REPLACE INTO MinorCivLeaders
		(Type,						LeaderIcon,						LeaderPlace,					LeaderName,		LeaderTitle,		LeaderArtistName)
-- Replacements
SELECT	'MINOR_CIV_SEORABEOL',		'seorabeol_leadericon.dds',		'신라 제국',				'선덕',		'여왕',			'DuskJockey'	UNION ALL
SELECT	'MINOR_CIV_OYO',			'oyo_leadericon.dds',			'오요 제국',				'오발로쿤',		'알라핀',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_TONDO',			'tondo_leadericon.dds',			'타갈로그족',					'칼랑기탄',	'다양',			'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_TORSHAVN',		'torshavn_leadericon.dds',		'페로 제도',			'트론두르 이 괴투',	'추장',		'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_ZAZZAU',			'zazzau_leadericon.dds',		'자자우 왕국',		'아미나',		'사라우니야',		'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_KEMZHIKET',		'kemzhiket_leadericon.dds',		'예니세이 키르기스 카간국',	'바르스벡',		'카간',			'Grant'			UNION ALL
SELECT	'MINOR_CIV_NOGAI',			'nogai_leadericon.dds',			'노가이 칸국',				'에디구',		'에미르',				'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_DETTAH',			'dettah_leadericon.dds',		'옐로나이프족',				'아카이초',		'추장',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_SARATOV',		'saratov_leadericon.dds',		'칼미크족',					'아유카',		'칸',				'EmeraldRange'	UNION ALL
SELECT	'MINOR_CIV_SAGALA',			'sagala_leadericon.dds',		'인도-그리스인',				'메난드로스 1세',	'왕',				'COF'			UNION ALL
SELECT	'MINOR_CIV_QARNAWU',		'qarnawu_leadericon.dds',		'마인',						'와카일 사디크 1세','왕',			'DMS'			UNION ALL
SELECT	'MINOR_CIV_PARIHAKA',		'parihaka_leadericon.dds',		'마오리족',					'테 라우파라하',	'랑가티라',		'Janboruta'		UNION ALL
-- Unfinished
-- Cultured
SELECT	'MINOR_CIV_ANDORRA',		'andorra_leadericon2.dds',		'안도라 공국',	'로제-베르나르 3세','백작',		'Kiang'			UNION ALL
SELECT	'MINOR_CIV_YAIUWA',			'yaiuwa_leadericon.dds',		'하우시족',					'테네니스크',		'샤먼',			'Grant'			UNION ALL
SELECT	'MINOR_CIV_SHAHRAZUR',		'sanandaj_leadericon.dds',		'아르달란 공국',	'바니 아르달란',	'왕',				'Darth'			UNION ALL
SELECT	'MINOR_CIV_CARARIES',		'cararies_leadericon.dds',		'오마과족',					'파요레바',		'추장',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_KITCISIPIRINIK',	'kitcisipirinik_leadericon.dds','알곤킨족',				'테수아트',		'추장',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_KOKAND',			'kokand_leadericon.dds',		'코칸트 칸국',		'노디라',		'섭정',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_MUTAWAYNATJI',	'mutawaynatji_leadericon.dds',	'팔라와족',					'타레노레러',	'지도자',			'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_SHAMAKHI',		'shamakhi_leadericon.dds',		'시르반',						'이브라힘 1세',	'샤',				'Lungora'		UNION ALL
SELECT	'MINOR_CIV_THABA_BOSIU',	'thababosiu_leadericon.dds',	'레소토 왕국',		'모슈슈 1세',	'왕',				'DMS'			UNION ALL
SELECT	'MINOR_CIV_VADUZ',			'vaduz_leadericon.dds',			'리히텐슈타인',				'요한 2세',	'대공',			'DuskJockey'	UNION ALL
SELECT	'MINOR_CIV_VICTORIA',		'victoria_leadericon.dds',		'세이셸 공화국',	'프랑스-알베르 르네',	'대통령','Grant'			UNION ALL
SELECT	'MINOR_CIV_SADDARVAZEH',	'saddarvazeh_leadericon.dds',	'파르티아 제국',			'아르사케스 1세',	'사루',			'Gwennog'		UNION ALL
SELECT	'MINOR_CIV_TULA',			'tula_leadericon.dds',			'톨텍',					'소치틀',		'시우아틀라토아니',	''				UNION ALL
-- Maritime
SELECT	'MINOR_CIV_ASMARA',			'asmara_leadericon.dds',		'에리트레아',						'하마드 이드리스 아와테','지도자',		'DMS'			UNION ALL
SELECT	'MINOR_CIV_CARAL',			'caral_leadericon.dds',			'카랄-수페',					'카팍',		'',					'Leugi'			UNION ALL
SELECT	'MINOR_CIV_DAKAR',			'dakar_leadericon.dds',			'세네갈 공화국',		'레오폴드 셍고르','대통령',		'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_KAGYRGYN',		'kagyrgyn_leadericon.dds',		'축치족',					'라우틸리와들린','추장',			'TPangolin'		UNION ALL
SELECT	'MINOR_CIV_KARIATEBIKE',	'kariatebike_leadericon.dds',	'키리바시',						'템비노카',	'왕',				'JakeWalrusWhale'	UNION ALL
SELECT	'MINOR_CIV_MADURAI',		'madurai_leadericon.dds',		'판디아 제국',			'알리 라니',	'여왕',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_OKAK',			'okak_leadericon.dds',			'툴레',					'자브라가낙',	'',					'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_REYKJAVIK',		'reykjavik_leadericon.dds',		'아이슬란드',						'잉골푸르 아르나르손',	'',			'Sukritact'		UNION ALL
SELECT	'MINOR_CIV_SKARA_BRAE',		'skara_brae_leadericon.dds',	'픽트 연맹',	'오엥구스 막 페르구사','왕',		'Firebug'		UNION ALL
SELECT	'MINOR_CIV_BOGANIDA',		'boganida_leadericon.dds',		'돌간족',					'오그도 악쇼노바','지도자',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_CAVVANBAH',		'cavvanbah_leadericon.dds',		'분잘룽족',				'님분지',	'위움',			'TPangolin'		UNION ALL
-- Mercantile
SELECT	'MINOR_CIV_ABALESSA',		'abalessa_leadericon.dds',		'투아레그족',					'틴 히난',	'여왕',			'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_AZEBA',			'azeba_leadericon.dds',			'사바 왕국',			'마케다',		'여왕',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_GABORONE',		'gaborone_leadericon.dds',		'보츠와나 공화국',		'세레체 카마','대통령',		'DMS'			UNION ALL
SELECT	'MINOR_CIV_LUXEMBOURG',		'luxembourg_leadericon2.dds',	'룩셈부르크 대공국','에르메신데 2세',	'백작 부인',			'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_NYENI',			'nyeni_leadericon.dds',			'말리 제국',				'무사 1세',		'만사',			'TPangolin'		UNION ALL
SELECT	'MINOR_CIV_PEGU',			'pegu_leadericon.dds',			'한타와디 왕국',		'신 소부',	'여왕',			'EmeraldRange'	UNION ALL
SELECT	'MINOR_CIV_POMBERUK',		'pomberuk_leadericon.dds',		'나린제리족',				'응구룬데리',	'추장',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_UGARIT',			'ugarit_leadericon.dds',		'우가리트',						'암미탐루 1세',	'왕',				'Jarcast'		UNION ALL
-- Militaristic
SELECT	'MINOR_CIV_DIEGO_GARCIA',	'diego_garcia_leadericon.dds',	'차고스',						'루이 올리비에 방쿨',	'',		'Grant'			UNION ALL
SELECT	'MINOR_CIV_GUNGNAE',		'gungnae_leadericon.dds',		'고구려',						'광개토',	'왕',				'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_MACACO',			'macaco_leadericon.dds',		'팔마리스 킬롬보',	'줌비',		'지도자',			'TPangolin'		UNION ALL
SELECT	'MINOR_CIV_MANTHIMBA',		'manthimba_leadericon.dds',		'마라비 왕국',		'무주라',		'칼롱가',			'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_ORISTANO',		'oristano_leadericon.dds',		'아르보레아',						'엘레오노르 데 세라 바스',	'판사',	'Jarcast'		UNION ALL
SELECT	'MINOR_CIV_PONTOTOC',		'pontotoc_leadericon.dds',		'치카소족',				'칙사',		'추장',			'RawSasquatch and DuskJockey'	UNION ALL
SELECT	'MINOR_CIV_PURUKCAHU',		'purukcahu_leadericon.dds',		'다약족',					'파티 자자 라자',	'팡게란 디파티',	'EmeraldRange'	UNION ALL
SELECT	'MINOR_CIV_SCODRA',			'scodra_leadericon.dds',		'일리리아인',				'테우타',		'여왕',			'DMS'			UNION ALL
SELECT	'MINOR_CIV_TETOUAN',		'tittawan_leadericon.dds',		'테투안',						'사이다 알-후라',	'하키마트',		'JakeWalrusWhale'	UNION ALL
SELECT	'MINOR_CIV_TILANTONGO',		'tilantongo_leadericon.dds',	'믹스텍족',					'이야 나쿠아 테유시 나나','영주',	'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_VAITAPE',		'vaitape_leadericon.dds',		'보라보라 왕국',		'푸니',			'아리이 라히',		'Arilasqueto'	UNION ALL
-- Religious
SELECT	'MINOR_CIV_ISHIYAMA',		'ishiyama_leadericon.dds',		'잇코잇키',				'코사',			'주지',		'PorkBean'		UNION ALL
SELECT	'MINOR_CIV_AVI_KWA_AME',	'avi_kwa_ame_leadericon.dds',	'모하비 국가',			'이라타바',		'지도자',			'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_CAHUACHI',		'cahuachi_leadericon.dds',		'나스카',					'카와치',		'추장',			'Sukritact'		UNION ALL
SELECT	'MINOR_CIV_CAIRO',			'cairo_leadericon.dds',			'파티마 왕조',					'알 무이즈',	'칼리프',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_CAMUTINS',		'camutins_leadericon.dds',		'마라조아라',				'프쿠에',		'지도자',			'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_DONGOLA',		'dongola_leadericon.dds',		'마쿠리아 왕국',		'메르쿠리오스',	'왕',				'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_GONDAR',			'gondar_leadericon.dds',		'세미엔 왕국',		'구디트',		'여왕',			'DMS'			UNION ALL
SELECT	'MINOR_CIV_GROZNY',			'grozny_leadericon.dds',		'바이나흐족',					'베이불라트 타이민',	'지도자',		'DJSHenninger'	UNION ALL
SELECT	'MINOR_CIV_MATONJENI',		'matonjeni_leadericon.dds',		'칼랑가족',					'니엔제마',		'은퉁가밀리',		'LastSword'		UNION ALL
SELECT	'MINOR_CIV_SOMBAKE',		'somba_ke_leadericon.dds',		'데네족',						'타나델투르',	'지도자',			'TarcisioCM'	UNION ALL
SELECT	'MINOR_CIV_TURA',			'tura_leadericon.dds',			'에벤키족',					'둘라르 봄보고르','추장',			'TPangolin'		UNION ALL
SELECT	'MINOR_CIV_YIRRKALA',		'yirrkala_leadericon.dds',		'욜응우족',					'웡구 무눙구르','',				'EmeraldRange'	;
--======================================================================================================================================
-- UCS RESERVES + NEW
--======================================================================================================================================
INSERT OR REPLACE INTO MinorCivLeaders
		(Type,						LeaderIcon,						LeaderPlace,					LeaderName,		LeaderTitle,		LeaderArtistName)
-- Cultured
SELECT	'MINOR_CIV_ATOLAN',			'atolan_leadericon.dds',		'아미족',						'콜라스 마헹헹',	'추장',		'Jarcast'		UNION ALL
/*N*/SELECT	'MINOR_CIV_ZENU',		'zenu_leadericon.dds',			'제누족',						'토토',			'카시카',			'TraditionalBoywife'	UNION ALL
SELECT	'MINOR_CIV_ELEA',			'elea_leadericon.dds',			'엘레아',							'파르메니데스',	'철학자',		'Leugi'			UNION ALL
SELECT	'MINOR_CIV_HALICARNASSUS',	'halicarnassus_leadericon.dds',	'카리아',						'아르테미시아 2세',	'사트라프',			''				UNION ALL
SELECT	'MINOR_CIV_MATURUCA',		'maturuca_leadericon.dds',		'마쿠시족',					'베르날디나 호세 페드로','지도자',	'RawSasquatch'	UNION ALL
/*N*/SELECT	'MINOR_CIV_NELEMNOYE',	'nelemnoye_leadericon.dds',		'유카기르족',				'테키 오둘록',	'',					'ExplosiveWatermelon'	UNION ALL
/*N*/SELECT	'MINOR_CIV_ORUGALLU',	'orugallu_leadericon.dds',		'카카티야 왕조',				'루드라마 데비',	'여왕',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_SANGGYEONG',		'sanggyeong_leadericon.dds',	'발해 왕국',		'대흠무',	'왕',				'Grant'			UNION ALL
-- Maritime
SELECT	'MINOR_CIV_BAGUIO',			'baguio_leadericon.dds',		'이고로트족',					'알리구욘',		'',					'DuskJockey'	UNION ALL
SELECT	'MINOR_CIV_ASHDOD',			'ashdod_leadericon.dds',		'블레셋인',				'아비멜렉',	'왕',				'Leugi'			UNION ALL
SELECT	'MINOR_CIV_ITHACA',			'ithaca_leadericon.dds',		'이타카',						'페넬로페',		'여왕',			'DMS'			UNION ALL
SELECT	'MINOR_CIV_NGYLVO',			'ngylvo_leadericon.dds',		'니브흐족',					'우무',			'',					'Arilasqueto'	UNION ALL
/*N*/SELECT	'MINOR_CIV_CAILIN',		'cailin_leadericon.dds',		'초노족',					'마르틴 올레타','추장',			'DarthKyofu'	UNION ALL
/*N*/SELECT	'MINOR_CIV_PAPEETE',	'papeete_leadericon.dds',		'타히티',						'푸레아',		'여왕',			'LastSword'		UNION ALL
/*N*/SELECT	'MINOR_CIV_FITIUTA',	'fitiuta_leadericon.dds',		'투이 마누아 연맹',		'마텔리타',		'투이 마누아',		'RawSasquatch'	UNION ALL
/*N*/SELECT	'MINOR_CIV_MANGAAS',	'mangaas_leadericon.dds',		'바누아투',						'로이 마타',		'추장',			'Pineapple'		UNION ALL
-- Mercantile
SELECT	'MINOR_CIV_AGADEZ',			'agadez_leadericon.dds',		'아이르 술탄국',			'일리사완',		'술탄',			'DMS'			UNION ALL
/*N*/SELECT	'MINOR_CIV_GEORGETOWN',	'georgetown_leadericon.dds',	'가이아나',						'체디 베렛 자간',	'대통령','EmeraldRange'	UNION ALL
SELECT	'MINOR_CIV_GONUR',			'gonur_leadericon.dds',			'옥수스',							'프라다',		'왕',				'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_ISCA',			'isca_leadericon.dds',			'둠노니아 왕국',		'그웬돌렌',	'여왕',			'DarthStarkiller'	UNION ALL
SELECT	'MINOR_CIV_SA_HUYN',		'sahuyn_leadericon.dds',		'사후인',						'포 나가르',		'여인',				'Lungora'		UNION ALL
SELECT	'MINOR_CIV_SHURI',			'shuri_leadericon2.dds',		'류큐 왕국',			'쇼 신',		'왕',				'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_TARTESSOS',		'tartessos_leadericon.dds',		'타르테소스 왕국',		'아르간토니오스',	'왕',				'DMS'			UNION ALL
SELECT	'MINOR_CIV_SIPIWININIWAK',	'sipiwininiwak_leadericon.dds',	'크리족',						'파운드메이커',	'추장',			'TPangolin'		UNION ALL
-- Militaristic
SELECT	'MINOR_CIV_BAGHCASARAY',	'baghcasaray_leadericon.dds',	'크림 칸국',			'하지 1세 기라이',	'칸',				'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_KANONWALOHALE',	'kanonwalohale_leadericon.dds',	'오나이다족',					'셰넌도어',	'추장',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_LUANGPRABANG',	'luangprabang_leadericon.dds',	'란쌍 왕국',		'파응움',		'왕',				'Sukritact'		UNION ALL
SELECT	'MINOR_CIV_PAVIA',			'pavia_leadericon.dds',			'롬바르드족',					'테오델린다',	'여왕',			'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_PSKOV',			'pskov_leadericon.dds',			'프스코프 공화국',			'다우만타스',	'공작',			'Grant'			UNION ALL
/*N*/SELECT	'MINOR_CIV_VALJALA',	'valjala_leadericon.dds',		'외셀인',				'베세',		'왕',				'TopHatPaladin'	UNION ALL
/*N*/SELECT	'MINOR_CIV_WAITIKUBULI','waitikubuli_leadericon.dds',	'칼리나고족',					'카이루안',	'추장',			'DMS'			UNION ALL
SELECT	'MINOR_CIV_YAMBIO',			'yambio_leadericon.dds',		'아잔데족',					'그부드웨',		'왕',				'RawSasquatch'	UNION ALL
-- Religious
SELECT	'MINOR_CIV_BOINNE',			'brunaboinne_leadericon.dds',	'보인',					'니얼',			'왕',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_BUKHARA',		'bukhara_leadericon.dds',		'부하라 칸국',		'무함마드 샤이바니','칸',			'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_GHAZNI',			'ghazni_leadericon.dds',		'자불리스탄',					'루트빌',		'총독',			'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_MUARO_JAMBI',	'muarojambi_leadericon.dds',	'스리비자야 제국',			'스리 자야나사',		'마하라자',		'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_SUSA',			'susa_leadericon.dds',			'엘람',							'슈트루크-나훈테',	'왕',			'DMS'			UNION ALL
SELECT	'MINOR_CIV_THOLING',		'tholing_leadericon.dds',		'구게 왕국',			'예셰오',			'왕',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_UJJAIN',			'ujjain_leadericon.dds',		'프라티하라',					'미히라 보자',	'왕',				'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_NGAZARGAMU',		'ngazargamu_leadericon.dds',	'카넴-보르누 제국',		'이드리스 알라우마',	'마이',				'Janboruta'		;
--======================================================================================================================================
-- NEW VP 5.0 + NEW TO BALANCE NUMBER
--======================================================================================================================================
INSERT OR REPLACE INTO MinorCivLeaders
		(Type,						LeaderIcon,						LeaderPlace,					LeaderName,		LeaderTitle,		LeaderArtistName)
-- Cultured
SELECT	'MINOR_CIV_ECBATANA',		'ecbatana_leadericon.dds',		'메디아',					'키악사레스',		'왕',				'TarcisioCM'	UNION ALL
SELECT	'MINOR_CIV_HOLMUL',			'holmul_leadericon.dds',		'마야',						'속 여왕',		'여왕',			'Leugi'			UNION ALL
SELECT	'MINOR_CIV_WANGGEOM',		'wanggeom_leadericon.dds',		'고조선',						'단군',		'왕',				'GPuzzle'		UNION ALL
SELECT	'MINOR_CIV_YAMATAI',		'yamatai_leadericon.dds',		'야마타이',						'히미코',		'여왕',			'Jarcast & Lungora'		UNION ALL
SELECT	'MINOR_CIV_SEOUL',			'seoul_leadericon.dds',			'조선',						'세종',		'왕',				'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_OVIEDO',			'andorra_leadericon.dds',		'아스투리아스',						'알폰소 1세 ',	'왕',				'Grant'			UNION ALL
/*N*/SELECT	'MINOR_CIV_ETENHIRITIPA','etenhiritipa_leadericon.dds',	'샤반테족',					'아포에나',		'추장',			'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_MANGOLA',		'mangola_leadericon.dds',		'하자족',					'인다야',		'영웅',				'Grant'			UNION ALL
SELECT	'MINOR_CIV_MELGITAT',		'melgitat_leadericon.dds',		'베오투크족',					'노노스보수트',	'추장',			'DJSHenninger'	UNION ALL
/*N*/SELECT	'MINOR_CIV_STANDING_ROCK','standing_rock_leadericon.dds',	'수족',				'이글 우먼',	'추장',			'Arilasqueto'	UNION ALL
-- Maritime
SELECT	'MINOR_CIV_TROWULAN',		'trowulan_leadericon.dds',		'마자파힛 제국',			'가자 마다',	'마하파티',		'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_JAKARTA',		'jakarta_leadericon.dds',		'순다 왕국',			'프라부 실리왕기',	'왕',			'EmeraldRange'	UNION ALL
SELECT	'MINOR_CIV_VENICE',			'venice_leadericon.dds',		'베네치아 공화국',		'엔리코 단돌로 ',	'도제',			'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_RIO_DE_JANEIRO',	'rio_de_janeiro_leadericon.dds','브라질',						'페드로 2세',		'황제',			'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_LISBON',			'lisbon_leadericon.dds',		'포르투갈 왕국',		'마리아 1세',		'여왕',			'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_PERGE',			'perge_leadericon.dds',			'페르게',						'아폴로니오스',	'',					'Jarcast'		UNION ALL
SELECT	'MINOR_CIV_PAGO_PAGO',		'pagopago_leadericon.dds',		'사모아',						'살라마시나',	'타파이파',		'TPangolin'		UNION ALL
/*N*/SELECT	'MINOR_CIV_KESPUKWITK',	'kespukwitk_leadericon.dds',	'와바나키 연맹',		'앙리 멤베르투',	'대추장',	'TPangolin'		UNION ALL
/*N*/SELECT	'MINOR_CIV_KOTA_BATU',	'kota_batu_leadericon.dds',		'브루나이 제국',			'볼키아 이븐 술라이만',	'술탄',	'TopHatPaladin'	UNION ALL
/*N*/SELECT	'MINOR_CIV_LANTAU',		'lantau_leadericon.dds',		'광동 해적 연맹','정일수',	'지도자',		'TPangolin'		UNION ALL
-- Mercantile
SELECT	'MINOR_CIV_HARAPPA',		'mohenjodaro_leadericon.dds',	'하라파인',				'웬트-안투',	'',					'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_NOVGOROD',		'novgorod_leadericon.dds',		'노브고로드 공화국',		'알렉산드르 넵스키',	'공작',		'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_SEGOU',			'segou_leadericon.dds',			'밤바라 왕국',			'비톤 쿨리발리',	'왕',			'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_MARRAKECH',		'marrakech_leadericon.dds',		'알모라비드 왕조',				'자이나브 안-나프자위야','여왕',	'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_HEIDABIR',		'heidabir_leadericon.dds',		'데인족',					'구드프레드',		'왕',				'JFD'			UNION ALL
SELECT	'MINOR_CIV_LUTETIA',		'lutetia_leadericon.dds',		'갈리아인',					'베르킨게토릭스','왕',				'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_OUAGADOUGOU',	'ouagadougou_leadericon.dds',	'모시 왕국',			'옌넨가',		'여왕',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_UTICA',			'utica_leadericon.dds',			'카르타고',						'디도',			'여왕',			'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_BORNU',			'bornu_leadericon.dds',			'보르누 제국',				'라비 아즈-주바이르','에미르',			'RawSasquatch'	UNION ALL
/*N*/SELECT	'MINOR_CIV_MANGAZEYA',	'mangazeya_leadericon.dds',		'망가제야',					'다비드 제레브초프',	'보이보드',		'Arilasqueto'	UNION ALL
-- Militaristic
SELECT	'MINOR_CIV_AZTLAN',			'aztlan_leadericon.dds',		'아즈텍',					'테노치',		'틀라토아니',			'Grant'			UNION ALL
SELECT	'MINOR_CIV_ASSUR',			'assur_leadericon.dds',			'신아시리아 제국',		'샤무라마트',	'여왕',			'TarcisioCM'	UNION ALL
SELECT	'MINOR_CIV_OKILIS',			'okilis_leadericon.dds',		'아레바키족',					'암보',			'지도자',			'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_KWA_BULAWAYO',	'kwa_bulawayo_leadericon.dds',	'은데벨레족',					'로벵굴라 쿠말로',	'왕',		'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_LONGCHENG',		'longcheng_leadericon.dds',		'당나라',						'태종',		'황제',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_SOKOTO',			'sokoto_leadericon.dds',		'소코토 칼리프조',			'우스만 단 포디오',	'셰후',		'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_BAN_CHIANG',		'ban_chiang_leadericon.dds',	'반치앙',					'하우나',		'',					'Jarcast'		UNION ALL -- Hawhna = chief/head/leader in Isan language
SELECT	'MINOR_CIV_ZUUNMOD',		'zuunmod_leadericon.dds',		'북원',			'만두하이 현명왕후',	'카툰',	'Grant'			UNION ALL
SELECT	'MINOR_CIV_PALATIUM',		'palatium_leadericon.dds',		'로마인',					'로물루스',		'왕',				'TopHatPaladin'	UNION ALL
/*N*/SELECT	'MINOR_CIV_CO_LOA',		'co_loa_leadericon.dds',		'락비엣',					'쯩짝',	'여왕',			'Lungora'		UNION ALL
-- Religious
SELECT	'MINOR_CIV_AKSUM',			'aksum_leadericon.dds',			'악슘',						'칼레브',		'왕',				'DMS'			UNION ALL
SELECT	'MINOR_CIV_DJENNE',			'djenne_leadericon.dds',		'송하이',						'아스키아 무함마드 1세',	'왕',			'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_NIPPUR',			'nippur_leadericon.dds',		'아카드 제국',			'사르곤',		'사룸',			'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_RAQMU',			'raqmu_leadericon.dds',			'나바테아',						'아레타스 3세',	'왕',				'Sukritact'		UNION ALL
SELECT	'MINOR_CIV_SALEM',			'salem_leadericon.dds',			'매사추세츠만 식민지','윌리엄 스토튼','총독',	'ExplosiveWatermelon'	UNION ALL
SELECT	'MINOR_CIV_ONONDAGA',		'onondaga_leadericon.dds',		'오논다가족',					'타도다호',		'추장',			'Leugi'			UNION ALL
SELECT	'MINOR_CIV_SHEDET',			'shedet_leadericon.dds',		'이집트',						'조세르',		'파라오',			'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_HUARI',			'huari_leadericon.dds',			'와리',						'와르메이의 여인',		'',			'TopHatPaladin'	UNION ALL
/*N*/SELECT	'MINOR_CIV_PIR_E_SABZ',	'piresabz_leadericon.dds',		'사산 제국',			'샤푸르 2세',	'샤한샤',		'TopHatPaladin' UNION ALL
/*N*/SELECT	'MINOR_CIV_DELHI',		'delhi_leadericon.dds',			'델리 술탄국',			'라지야트 알딘',	'술탄',		'DarthKyofu';
--======================================================================================================================================
-- BASE 
--======================================================================================================================================
UPDATE MinorCivLeaders SET LeaderIcon = 'almaty_leadericon2.dds', LeaderPlace = '카자흐 칸국', LeaderName = '아블라이 칸',
	LeaderTitle = '', LeaderArtistName = 'DuskJockey'
WHERE Type = 'MINOR_CIV_ALMATY';

UPDATE MinorCivLeaders SET LeaderIcon = 'antananarivo_leadericon2.dds',	LeaderPlace = '이메리나 왕국',	LeaderName = '라나발로나 1세',
	LeaderTitle = '여왕',	LeaderArtistName = 'DMS'
WHERE Type = 'MINOR_CIV_ANTANANARIVO';

UPDATE MinorCivLeaders SET LeaderIcon = 'belgrade_leadericon2.dds', LeaderPlace = '세르비아 왕국', LeaderName = '페타르 1세',
	LeaderTitle = '왕', LeaderArtistName = 'Janboruta'
WHERE Type = 'MINOR_CIV_BELGRADE';

UPDATE MinorCivLeaders SET LeaderIcon = 'bucharest_leadericonX.dds'
WHERE Type = 'MINOR_CIV_BUCHAREST';

UPDATE MinorCivLeaders SET LeaderIcon = 'cahokia_leadericon2.dds', LeaderName = '버드맨', LeaderTitle = '왕', LeaderArtistName = 'H. Roe/TPangolin'
WHERE Type = 'MINOR_CIV_CAHOKIA';

UPDATE MinorCivLeaders SET LeaderIcon = 'hanoi_leadericon2.dds', LeaderName = '레러이', LeaderTitle = '황제', LeaderArtistName = 'LastSword'
WHERE Type = 'MINOR_CIV_HANOI';

UPDATE MinorCivLeaders SET LeaderIcon = 'kabul_leadericon2.dds', LeaderArtistName = 'Janboruta'
WHERE Type = 'MINOR_CIV_KABUL';

UPDATE MinorCivLeaders SET LeaderIcon = 'mbanza_kongo_leadericonX.dds', LeaderPlace = '콩고 왕국', LeaderName = '아폰소 1세',
	LeaderTitle = '마니콩고', LeaderArtistName= 'JFD'
WHERE Type = 'MINOR_CIV_MBANZA_KONGO';

UPDATE MinorCivLeaders SET LeaderIcon = 'melbourne_leadericon2.dds', LeaderPlace = '호주 연방',
	LeaderName = '빌리 휴스', LeaderTitle = '총리', LeaderArtistName = 'DarthKyofu'
WHERE Type = 'MINOR_CIV_MELBOURNE';

UPDATE MinorCivLeaders SET LeaderIcon = 'mombasa_leadericon2.dds', LeaderArtistName= 'DMS'
WHERE Type = 'MINOR_CIV_MOMBASA';

UPDATE MinorCivLeaders SET LeaderIcon = 'monaco_leadericonX.dds', LeaderName = '알베르 1세', LeaderArtistName = 'JFD'
WHERE Type = 'MINOR_CIV_MONACO';

UPDATE MinorCivLeaders SET LeaderIcon = 'prague_leadericonX.dds'
WHERE Type = 'MINOR_CIV_PRAGUE';

UPDATE MinorCivLeaders SET LeaderIcon = 'riga_leadericonX.dds',	LeaderPlace = '라트비아 공화국',	LeaderName = '카를리스 울마니스',
	LeaderTitle = '총리',	LeaderArtistName = 'TopHatPaladin'
WHERE Type = 'MINOR_CIV_RIGA';

UPDATE MinorCivLeaders SET LeaderIcon = 'samarkand_leadericon2.dds',	LeaderName = '티무르', LeaderArtistName = 'Tomatekh'
WHERE Type = 'MINOR_CIV_SAMARKAND';

/*UPDATE MinorCivLeaders SET LeaderIcon = 'sofia_leadericonX.dds', LeaderPlace = 'Bulgaria', LeaderName = 'Vasil Levski', LeaderTitle = '',
	LeaderArtistName = 'Merrick'
WHERE Type = 'MINOR_CIV_SOFIA';*/

UPDATE MinorCivLeaders SET LeaderIcon = 'sofia_leadericon3.dds', LeaderArtistName = 'DarthKyofu'
WHERE Type = 'MINOR_CIV_SOFIA';

UPDATE MinorCivLeaders SET LeaderIcon = 'sydney_leadericon2.dds', LeaderPlace = '뉴사우스웨일스', LeaderName = '헨리 파크스',
	LeaderTitle = '주총리', LeaderArtistName = 'TPangolin'
WHERE Type = 'MINOR_CIV_SYDNEY';

UPDATE MinorCivLeaders SET 	LeaderIcon = 'ur_leadericonX.dds'
WHERE Type = 'MINOR_CIV_UR';

UPDATE MinorCivLeaders SET LeaderIcon = 'valletta_leadericonX.dds', LeaderName = '장 라 발레트', LeaderArtistName = 'JFD'
WHERE Type = 'MINOR_CIV_VALLETTA';

UPDATE MinorCivLeaders SET 	LeaderIcon = 'vancouver_leadericon2.dds'
WHERE Type = 'MINOR_CIV_VANCOUVER';

UPDATE MinorCivLeaders SET LeaderIcon = 'vatican_city_leadericon2.dds', LeaderName = '요한 바오로 2세', LeaderArtistName = 'DMS'
WHERE Type = 'MINOR_CIV_VATICAN_CITY';

UPDATE MinorCivLeaders SET LeaderIcon = 'wellington_leadericon2.dds', LeaderArtistName = 'Janboruta'
WHERE Type = 'MINOR_CIV_WELLINGTON';
-- UCS Finished
UPDATE MinorCivLeaders SET LeaderIcon = 'karasjohka_leadericonX.dds', LeaderName = '리쿠오-마야', LeaderTitle = '노아이디',
	LeaderArtistName = 'Arilasqueto'
WHERE Type = 'MINOR_CIV_KARASJOHKA';

UPDATE MinorCivLeaders SET LeaderIcon = 'granada_leadericonX.dds', LeaderName = '무함마드 5세', LeaderArtistName = 'Urdnot'
WHERE Type = 'MINOR_CIV_GRANADA';
--======================================================================================================================================
--======================================================================================================================================
CREATE TRIGGER Jar_CSUBaseReplacement
AFTER INSERT ON MinorCivLeaders WHEN (NEW.Type ='MINOR_CIV_YANGCHENG')
BEGIN
UPDATE MinorCivLeaders SET LeaderIcon = 'almaty_leadericon2.dds', LeaderPlace = '카자흐 칸국', LeaderName = '아블라이 칸',
	LeaderTitle = '', LeaderArtistName = 'DuskJockey'
WHERE Type = 'MINOR_CIV_ALMATY';

UPDATE MinorCivLeaders SET LeaderIcon = 'antananarivo_leadericon2.dds',	LeaderPlace = '이메리나 왕국',	LeaderName = '라나발로나 1세',
	LeaderTitle = '여왕',	LeaderArtistName = 'DMS'
WHERE Type = 'MINOR_CIV_ANTANANARIVO';

UPDATE MinorCivLeaders SET LeaderIcon = 'belgrade_leadericon2.dds', LeaderPlace = '세르비아 왕국', LeaderName = '페타르 1세',
	LeaderTitle = '왕', LeaderArtistName = 'Janboruta'
WHERE Type = 'MINOR_CIV_BELGRADE';

UPDATE MinorCivLeaders SET LeaderIcon = 'bucharest_leadericonX.dds'
WHERE Type = 'MINOR_CIV_BUCHAREST';

UPDATE MinorCivLeaders SET LeaderIcon = 'cahokia_leadericon2.dds', LeaderName = '버드맨', LeaderTitle = '왕', LeaderArtistName = 'H. Roe/TPangolin'
WHERE Type = 'MINOR_CIV_CAHOKIA';

UPDATE MinorCivLeaders SET LeaderIcon = 'hanoi_leadericon2.dds', LeaderName = '레러이', LeaderTitle = '황제', LeaderArtistName = 'LastSword'
WHERE Type = 'MINOR_CIV_HANOI';

UPDATE MinorCivLeaders SET LeaderIcon = 'kabul_leadericon2.dds', LeaderArtistName = 'Janboruta'
WHERE Type = 'MINOR_CIV_KABUL';

UPDATE MinorCivLeaders SET LeaderIcon = 'mbanza_kongo_leadericonX.dds', LeaderPlace = '콩고 왕국', LeaderName = '아폰소 1세',
	LeaderTitle = '마니콩고', LeaderArtistName= 'JFD'
WHERE Type = 'MINOR_CIV_MBANZA_KONGO';

UPDATE MinorCivLeaders SET LeaderIcon = 'melbourne_leadericon2.dds', LeaderPlace = '호주 연방',
	LeaderName = '빌리 휴스', LeaderTitle = '총리', LeaderArtistName = 'DarthKyofu'
WHERE Type = 'MINOR_CIV_MELBOURNE';

UPDATE MinorCivLeaders SET LeaderIcon = 'mombasa_leadericon2.dds', LeaderArtistName= 'DMS'
WHERE Type = 'MINOR_CIV_MOMBASA';

UPDATE MinorCivLeaders SET LeaderIcon = 'monaco_leadericonX.dds', LeaderName = '알베르 1세', LeaderArtistName = 'JFD'
WHERE Type = 'MINOR_CIV_MONACO';

UPDATE MinorCivLeaders SET LeaderIcon = 'prague_leadericonX.dds'
WHERE Type = 'MINOR_CIV_PRAGUE';

UPDATE MinorCivLeaders SET LeaderIcon = 'riga_leadericonX.dds',	LeaderPlace = '라트비아 공화국',	LeaderName = '카를리스 울마니스',
	LeaderTitle = '총리',	LeaderArtistName = 'TopHatPaladin'
WHERE Type = 'MINOR_CIV_RIGA';

UPDATE MinorCivLeaders SET LeaderIcon = 'samarkand_leadericon2.dds',	LeaderName = '티무르', LeaderArtistName = 'Tomatekh'
WHERE Type = 'MINOR_CIV_SAMARKAND';

/*UPDATE MinorCivLeaders SET LeaderIcon = 'sofia_leadericonX.dds', LeaderPlace = 'Bulgaria', LeaderName = 'Vasil Levski', LeaderTitle = '',
	LeaderArtistName = 'Merrick'
WHERE Type = 'MINOR_CIV_SOFIA';*/

UPDATE MinorCivLeaders SET LeaderIcon = 'sofia_leadericon3.dds', LeaderArtistName = 'DarthKyofu'
WHERE Type = 'MINOR_CIV_SOFIA';

UPDATE MinorCivLeaders SET LeaderIcon = 'sydney_leadericon2.dds', LeaderPlace = '뉴사우스웨일스', LeaderName = '헨리 파크스',
	LeaderTitle = '주총리', LeaderArtistName = 'TPangolin'
WHERE Type = 'MINOR_CIV_SYDNEY';

UPDATE MinorCivLeaders SET 	LeaderIcon = 'ur_leadericonX.dds'
WHERE Type = 'MINOR_CIV_UR';

UPDATE MinorCivLeaders SET LeaderIcon = 'valletta_leadericonX.dds', LeaderName = '장 라 발레트', LeaderArtistName = 'JFD'
WHERE Type = 'MINOR_CIV_VALLETTA';

UPDATE MinorCivLeaders SET 	LeaderIcon = 'vancouver_leadericon2.dds'
WHERE Type = 'MINOR_CIV_VANCOUVER';

UPDATE MinorCivLeaders SET LeaderIcon = 'vatican_city_leadericon2.dds', LeaderName = '요한 바오로 2세', LeaderArtistName = 'DMS'
WHERE Type = 'MINOR_CIV_VATICAN_CITY';

UPDATE MinorCivLeaders SET LeaderIcon = 'wellington_leadericon2.dds', LeaderArtistName = 'Janboruta'
WHERE Type = 'MINOR_CIV_WELLINGTON';
-- UCS Finished
UPDATE MinorCivLeaders SET LeaderIcon = 'karasjohka_leadericonX.dds', LeaderName = '리쿠오-마야', LeaderTitle = ' 노아이디',
	LeaderArtistName = 'Arilasqueto'
WHERE Type = 'MINOR_CIV_KARASJOHKA';

UPDATE MinorCivLeaders SET LeaderIcon = 'granada_leadericonX.dds', LeaderName = '무함마드 5세', LeaderArtistName = 'Urdnot'
WHERE Type = 'MINOR_CIV_GRANADA';

END;
--======================================================================================================================================
--======================================================================================================================================