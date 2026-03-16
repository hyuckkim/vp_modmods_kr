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
SELECT	'MINOR_CIV_SEORABEOL',		'seorabeol_leadericon.dds',		'the Silla Empire',				'Seondeok',		'Queen',			'DuskJockey'	UNION ALL
SELECT	'MINOR_CIV_OYO',			'oyo_leadericon.dds',			'the Òyó Empire',				'Obalókun',		'Alaafin',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_TONDO',			'tondo_leadericon.dds',			'the Tagalogs',					'Kalangitan',	'Dayang',			'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_TORSHAVN',		'torshavn_leadericon.dds',		'the Faroe Islands',			'Tróndur í Gøtu',	'Chief',		'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_ZAZZAU',			'zazzau_leadericon.dds',		'the Kingdom of Zazzau',		'Amina',		'Sarauniya',		'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_KEMZHIKET',		'kemzhiket_leadericon.dds',		'the Yenisei Kyrgyz Khaganate',	'Barsbek',		'Khagan',			'Grant'			UNION ALL
SELECT	'MINOR_CIV_NOGAI',			'nogai_leadericon.dds',			'the Nogai Horde',				'Edigu',		'Emir',				'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_DETTAH',			'dettah_leadericon.dds',		'the Yellowknives',				'Akaitcho',		'Chief',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_SARATOV',		'saratov_leadericon.dds',		'the Kalmyks',					'Ayuka',		'Khan',				'EmeraldRange'	UNION ALL
SELECT	'MINOR_CIV_SAGALA',			'sagala_leadericon.dds',		'the Indo-Greeks',				'Menander I',	'King',				'COF'			UNION ALL
SELECT	'MINOR_CIV_QARNAWU',		'qarnawu_leadericon.dds',		'Ma''in',						'Waqah''il Sadiq I','King',			'DMS'			UNION ALL
SELECT	'MINOR_CIV_PARIHAKA',		'parihaka_leadericon.dds',		'the Maori',					'Te Rauparaha',	'Rangatira',		'Janboruta'		UNION ALL
-- Unfinished
-- Cultured
SELECT	'MINOR_CIV_ANDORRA',		'andorra_leadericon2.dds',		'the Principality of Andorra',	'Roger-Bernard III','Count',		'Kiang'			UNION ALL
SELECT	'MINOR_CIV_YAIUWA',			'yaiuwa_leadericon.dds',		'the Haush',					'Tenenisk',		'Shaman',			'Grant'			UNION ALL
SELECT	'MINOR_CIV_SHAHRAZUR',		'sanandaj_leadericon.dds',		'the Principality of Ardalan',	'Bani Ardalan',	'King',				'Darth'			UNION ALL
SELECT	'MINOR_CIV_CARARIES',		'cararies_leadericon.dds',		'the Omagua',					'Payoreva',		'Chief',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_KITCISIPIRINIK',	'kitcisipirinik_leadericon.dds','the Algonquins',				'Tessouat',		'Chief',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_KOKAND',			'kokand_leadericon.dds',		'the Khanate of Kokand',		'Nodira',		'Regent',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_MUTAWAYNATJI',	'mutawaynatji_leadericon.dds',	'the Palawa',					'Tarenorerer',	'Leader',			'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_SHAMAKHI',		'shamakhi_leadericon.dds',		'Shirvan',						'Ibrahim I',	'Shah',				'Lungora'		UNION ALL
SELECT	'MINOR_CIV_THABA_BOSIU',	'thababosiu_leadericon.dds',	'the Kingdom of Lesotho',		'Moshoeshoe I',	'King',				'DMS'			UNION ALL
SELECT	'MINOR_CIV_VADUZ',			'vaduz_leadericon.dds',			'Liechtenstein',				'Johann II',	'Prince',			'DuskJockey'	UNION ALL
SELECT	'MINOR_CIV_VICTORIA',		'victoria_leadericon.dds',		'the Republic of Seychelles',	'France-Albert René',	'President','Grant'			UNION ALL
SELECT	'MINOR_CIV_SADDARVAZEH',	'saddarvazeh_leadericon.dds',	'the Parthian Empire',			'Arsaces I',	'Sarru',			'Gwennog'		UNION ALL
SELECT	'MINOR_CIV_TULA',			'tula_leadericon.dds',			'the Toltecs',					'Xochitl',		'Cihuatlahtoani',	''				UNION ALL
-- Maritime
SELECT	'MINOR_CIV_ASMARA',			'asmara_leadericon.dds',		'Eritrea',						'Hamad Idris Awate','Leader',		'DMS'			UNION ALL
SELECT	'MINOR_CIV_CARAL',			'caral_leadericon.dds',			'Caral–Supe',					'Qhapaq',		'',					'Leugi'			UNION ALL
SELECT	'MINOR_CIV_DAKAR',			'dakar_leadericon.dds',			'the Republic of Senegal',		'Leopold Sengor','President',		'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_KAGYRGYN',		'kagyrgyn_leadericon.dds',		'the Chukchi',					'Lawtiliwadlin','Chief',			'TPangolin'		UNION ALL
SELECT	'MINOR_CIV_KARIATEBIKE',	'kariatebike_leadericon.dds',	'Kiribati',						'Tembinoka',	'King',				'JakeWalrusWhale'	UNION ALL
SELECT	'MINOR_CIV_MADURAI',		'madurai_leadericon.dds',		'the Pandya Empire',			'Alli Rani',	'Queen',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_OKAK',			'okak_leadericon.dds',			'the Thule',					'Jabraganak',	'',					'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_REYKJAVIK',		'reykjavik_leadericon.dds',		'Iceland',						'Ingolfur Arnarson',	'',			'Sukritact'		UNION ALL
SELECT	'MINOR_CIV_SKARA_BRAE',		'skara_brae_leadericon.dds',	'the Pictish Confederation',	'Oengus mac Fergusa','King',		'Firebug'		UNION ALL
SELECT	'MINOR_CIV_BOGANIDA',		'boganida_leadericon.dds',		'the Dolgans',					'Ogdo Aksyonova','Leader',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_CAVVANBAH',		'cavvanbah_leadericon.dds',		'the Bundjalung',				'Nyimbunji',	'Weeum',			'TPangolin'		UNION ALL
-- Mercantile
SELECT	'MINOR_CIV_ABALESSA',		'abalessa_leadericon.dds',		'the Tuareg',					'Tin Hinan',	'Queen',			'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_AZEBA',			'azeba_leadericon.dds',			'the Kingdom of Saba',			'Makeda',		'Queen',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_GABORONE',		'gaborone_leadericon.dds',		'the Republic of Botswana',		'Seretse Khama','President',		'DMS'			UNION ALL
SELECT	'MINOR_CIV_LUXEMBOURG',		'luxembourg_leadericon2.dds',	'the Grand Duchy of Luxembourg','Ermesinde II',	'Countess',			'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_NYENI',			'nyeni_leadericon.dds',			'the Mali Empire',				'Musa I',		'Mansa',			'TPangolin'		UNION ALL
SELECT	'MINOR_CIV_PEGU',			'pegu_leadericon.dds',			'the Hanthawaddy Kingdom',		'Shin Sawbu',	'Queen',			'EmeraldRange'	UNION ALL
SELECT	'MINOR_CIV_POMBERUK',		'pomberuk_leadericon.dds',		'the Ngarrindjeri',				'Ngurunderi',	'Chief',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_UGARIT',			'ugarit_leadericon.dds',		'Ugarit',						'Ammittamru I',	'King',				'Jarcast'		UNION ALL
-- Militaristic
SELECT	'MINOR_CIV_DIEGO_GARCIA',	'diego_garcia_leadericon.dds',	'Chagos',						'Louis Olivier Bancoult',	'',		'Grant'			UNION ALL
SELECT	'MINOR_CIV_GUNGNAE',		'gungnae_leadericon.dds',		'Goguryeo',						'Gwanggaeto',	'King',				'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_MACACO',			'macaco_leadericon.dds',		'the Quilombo dos Palmares',	'Zumbi',		'Leader',			'TPangolin'		UNION ALL
SELECT	'MINOR_CIV_MANTHIMBA',		'manthimba_leadericon.dds',		'the Kingdom of Maravi',		'Muzura',		'Kalonga',			'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_ORISTANO',		'oristano_leadericon.dds',		'Arborea',						'Eleanor De Serra Bas',	'Judgess',	'Jarcast'		UNION ALL
SELECT	'MINOR_CIV_PONTOTOC',		'pontotoc_leadericon.dds',		'the Chickasaw',				'Chiksa''',		'Chief',			'RawSasquatch and DuskJockey'	UNION ALL
SELECT	'MINOR_CIV_PURUKCAHU',		'purukcahu_leadericon.dds',		'the Dayak',					'Pati Djaja Raja',	'Pangeran Dipati',	'EmeraldRange'	UNION ALL
SELECT	'MINOR_CIV_SCODRA',			'scodra_leadericon.dds',		'the Illyrians',				'Teuta',		'Queen',			'DMS'			UNION ALL
SELECT	'MINOR_CIV_TETOUAN',		'tittawan_leadericon.dds',		'Tétouan',						'Sayyida al-Hurra',	'Hakimat',		'JakeWalrusWhale'	UNION ALL
SELECT	'MINOR_CIV_TILANTONGO',		'tilantongo_leadericon.dds',	'the Mixtecs',					'Iya Nacuaa Teyusi Nana','Lord',	'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_VAITAPE',		'vaitape_leadericon.dds',		'the Kingdom of Bora-Bora',		'Puni',			'Ari''i Rahi',		'Arilasqueto'	UNION ALL
-- Religious
SELECT	'MINOR_CIV_ISHIYAMA',		'ishiyama_leadericon.dds',		'the Ikko-ikki',				'Kosa',			'Chief Abbot',		'PorkBean'		UNION ALL
SELECT	'MINOR_CIV_AVI_KWA_AME',	'avi_kwa_ame_leadericon.dds',	'the Mohave Nation',			'Irataba',		'Leader',			'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_CAHUACHI',		'cahuachi_leadericon.dds',		'the Nazca',					'Cahuachi',		'Chief',			'Sukritact'		UNION ALL
SELECT	'MINOR_CIV_CAIRO',			'cairo_leadericon.dds',			'the Fatimids',					'al-Mu''izz',	'Caliph',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_CAMUTINS',		'camutins_leadericon.dds',		'the Marajoara',				'P''kuee',		'Leader',			'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_DONGOLA',		'dongola_leadericon.dds',		'the Kingdom of Makuria',		'Merkurios',	'King',				'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_GONDAR',			'gondar_leadericon.dds',		'the Kingdom of Simien',		'Gudit',		'Queen',			'DMS'			UNION ALL
SELECT	'MINOR_CIV_GROZNY',			'grozny_leadericon.dds',		'the Vainakhs',					'Beibulat Taimin',	'Leader',		'DJSHenninger'	UNION ALL
SELECT	'MINOR_CIV_MATONJENI',		'matonjeni_leadericon.dds',		'the Kalanga',					'Njenjema',		'Ntungamili',		'LastSword'		UNION ALL
SELECT	'MINOR_CIV_SOMBAKE',		'somba_ke_leadericon.dds',		'the Dene',						'Thanadelthur',	'Leader',			'TarcisioCM'	UNION ALL
SELECT	'MINOR_CIV_TURA',			'tura_leadericon.dds',			'the Evenks',					'Dular Bombogor','Chief',			'TPangolin'		UNION ALL
SELECT	'MINOR_CIV_YIRRKALA',		'yirrkala_leadericon.dds',		'the Yolngu',					'Wonggu Mununggurr','',				'EmeraldRange'	;
--======================================================================================================================================
-- UCS RESERVES + NEW
--======================================================================================================================================
INSERT OR REPLACE INTO MinorCivLeaders
		(Type,						LeaderIcon,						LeaderPlace,					LeaderName,		LeaderTitle,		LeaderArtistName)
-- Cultured
SELECT	'MINOR_CIV_ATOLAN',			'atolan_leadericon.dds',		'the Amis',						'Kolas Mahengheng',	'Chief',		'Jarcast'		UNION ALL
/*N*/SELECT	'MINOR_CIV_ZENU',		'zenu_leadericon.dds',			'the Zenú',						'Totó',			'Cacica',			'TraditionalBoywife'	UNION ALL
SELECT	'MINOR_CIV_ELEA',			'elea_leadericon.dds',			'Elea',							'Parmenides',	'Philosopher',		'Leugi'			UNION ALL
SELECT	'MINOR_CIV_HALICARNASSUS',	'halicarnassus_leadericon.dds',	'Caria',						'Artemisia II',	'Satrap',			''				UNION ALL
SELECT	'MINOR_CIV_MATURUCA',		'maturuca_leadericon.dds',		'the Macushi',					'Bernaldina José Pedro','Leader',	'RawSasquatch'	UNION ALL
/*N*/SELECT	'MINOR_CIV_NELEMNOYE',	'nelemnoye_leadericon.dds',		'the Yukaghirs',				'Teki Odulok',	'',					'ExplosiveWatermelon'	UNION ALL
/*N*/SELECT	'MINOR_CIV_ORUGALLU',	'orugallu_leadericon.dds',		'the Kakatiyas',				'Rudrama Devi',	'Queen',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_SANGGYEONG',		'sanggyeong_leadericon.dds',	'the Kingdom of Balhae',		'Dae-Heummu',	'King',				'Grant'			UNION ALL
-- Maritime
SELECT	'MINOR_CIV_BAGUIO',			'baguio_leadericon.dds',		'the Igorot',					'Aliguyon',		'',					'DuskJockey'	UNION ALL
SELECT	'MINOR_CIV_ASHDOD',			'ashdod_leadericon.dds',		'the Philistines',				'Abimelech',	'King',				'Leugi'			UNION ALL
SELECT	'MINOR_CIV_ITHACA',			'ithaca_leadericon.dds',		'Ithaca',						'Penelope',		'Queen',			'DMS'			UNION ALL
SELECT	'MINOR_CIV_NGYLVO',			'ngylvo_leadericon.dds',		'the Nivkhs',					'Umu',			'',					'Arilasqueto'	UNION ALL
/*N*/SELECT	'MINOR_CIV_CAILIN',		'cailin_leadericon.dds',		'the Chono',					'Martín Olleta','Chief',			'DarthKyofu'	UNION ALL
/*N*/SELECT	'MINOR_CIV_PAPEETE',	'papeete_leadericon.dds',		'Tahiti',						'Purea',		'Queen',			'LastSword'		UNION ALL
/*N*/SELECT	'MINOR_CIV_FITIUTA',	'fitiuta_leadericon.dds',		'Tui Manu''a Confederacy',		'Matelita',		'Tui Manu''a',		'RawSasquatch'	UNION ALL
/*N*/SELECT	'MINOR_CIV_MANGAAS',	'mangaas_leadericon.dds',		'Vanuatu',						'Roy Mata',		'Chief',			'Pineapple'		UNION ALL
-- Mercantile
SELECT	'MINOR_CIV_AGADEZ',			'agadez_leadericon.dds',		'the Sultanate of Air',			'Ilisawan',		'Sultan',			'DMS'			UNION ALL
/*N*/SELECT	'MINOR_CIV_GEORGETOWN',	'georgetown_leadericon.dds',	'Guyana',						'Cheddi Berret Jagan',	'President','EmeraldRange'	UNION ALL
SELECT	'MINOR_CIV_GONUR',			'gonur_leadericon.dds',			'Oxus',							'Frada',		'King',				'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_ISCA',			'isca_leadericon.dds',			'the Kingdom of Dumnonia',		'Gwendolen',	'Queen',			'DarthStarkiller'	UNION ALL
SELECT	'MINOR_CIV_SA_HUYN',		'sahuyn_leadericon.dds',		'Sa Huynh',						'Po Nagar',		'Lady',				'Lungora'		UNION ALL
SELECT	'MINOR_CIV_SHURI',			'shuri_leadericon2.dds',		'the Ryukyu Kingdom',			'Sho Shin',		'King',				'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_TARTESSOS',		'tartessos_leadericon.dds',		'the Kingdom of Tartessos',		'Arganthonios',	'King',				'DMS'			UNION ALL
SELECT	'MINOR_CIV_SIPIWININIWAK',	'sipiwininiwak_leadericon.dds',	'the Cree',						'Poundmaker',	'Chief',			'TPangolin'		UNION ALL
-- Militaristic
SELECT	'MINOR_CIV_BAGHCASARAY',	'baghcasaray_leadericon.dds',	'the Crimean Khanate',			'Haci I Giray',	'Khan',				'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_KANONWALOHALE',	'kanonwalohale_leadericon.dds',	'the Oneida',					'Shenandoah',	'Chief',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_LUANGPRABANG',	'luangprabang_leadericon.dds',	'the Kingdom of Lan Xang',		'Fa Ngum',		'King',				'Sukritact'		UNION ALL
SELECT	'MINOR_CIV_PAVIA',			'pavia_leadericon.dds',			'the Lombards',					'Theodelinda',	'Queen',			'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_PSKOV',			'pskov_leadericon.dds',			'the Pskov Republic',			'Daumantas',	'Prince',			'Grant'			UNION ALL
/*N*/SELECT	'MINOR_CIV_VALJALA',	'valjala_leadericon.dds',		'the Oeselians',				'Vesse',		'King',				'TopHatPaladin'	UNION ALL
/*N*/SELECT	'MINOR_CIV_WAITIKUBULI','waitikubuli_leadericon.dds',	'the Kalinago',					'Kairouane',	'Chief',			'DMS'			UNION ALL
SELECT	'MINOR_CIV_YAMBIO',			'yambio_leadericon.dds',		'the Azande',					'Gbudwe',		'King',				'RawSasquatch'	UNION ALL
-- Religious
SELECT	'MINOR_CIV_BOINNE',			'brunaboinne_leadericon.dds',	'the Boyne',					'Niall',			'King',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_BUKHARA',		'bukhara_leadericon.dds',		'the Khanate of Bukhara',		'Muhammad Shaybani','Khan',			'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_GHAZNI',			'ghazni_leadericon.dds',		'Zabulistan',					'Rutbil',		'Governor',			'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_MUARO_JAMBI',	'muarojambi_leadericon.dds',	'the Srivijaya Empire',			'Sri Jayanasa',		'Maharaja',		'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_SUSA',			'susa_leadericon.dds',			'Elam',							'Shutruk-Nakhunte',	'King',			'DMS'			UNION ALL
SELECT	'MINOR_CIV_THOLING',		'tholing_leadericon.dds',		'the Kingdom of Guge',			'Yeshe-O',			'King',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_UJJAIN',			'ujjain_leadericon.dds',		'Pratihara',					'Mihira Bhoja',	'King',				'DarthKyofu'	UNION ALL
SELECT	'MINOR_CIV_NGAZARGAMU',		'ngazargamu_leadericon.dds',	'the Kanem–Bornu Empire',		'Idris Alauma',	'Mai',				'Janboruta'		;
--======================================================================================================================================
-- NEW VP 5.0 + NEW TO BALANCE NUMBER
--======================================================================================================================================
INSERT OR REPLACE INTO MinorCivLeaders
		(Type,						LeaderIcon,						LeaderPlace,					LeaderName,		LeaderTitle,		LeaderArtistName)
-- Cultured
SELECT	'MINOR_CIV_ECBATANA',		'ecbatana_leadericon.dds',		'the Medes',					'Cyaxares',		'King',				'TarcisioCM'	UNION ALL
SELECT	'MINOR_CIV_HOLMUL',			'holmul_leadericon.dds',		'the Maya',						'Lady Xoc',		'Queen',			'Leugi'			UNION ALL
SELECT	'MINOR_CIV_WANGGEOM',		'wanggeom_leadericon.dds',		'Gojoseon',						'Tan''gun',		'King',				'GPuzzle'		UNION ALL
SELECT	'MINOR_CIV_YAMATAI',		'yamatai_leadericon.dds',		'Yamatai',						'Himiko',		'Queen',			'Jarcast & Lungora'		UNION ALL
SELECT	'MINOR_CIV_SEOUL',			'seoul_leadericon.dds',			'Joseon',						'Sejong',		'King',				'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_OVIEDO',			'andorra_leadericon.dds',		'Asturias',						'Alfonso I ',	'King',				'Grant'			UNION ALL
/*N*/SELECT	'MINOR_CIV_ETENHIRITIPA','etenhiritipa_leadericon.dds',	'the Xavante',					'Apoena',		'Chief',			'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_MANGOLA',		'mangola_leadericon.dds',		'the Hadza',					'Indaya',		'Hero',				'Grant'			UNION ALL
SELECT	'MINOR_CIV_MELGITAT',		'melgitat_leadericon.dds',		'the Beothuk',					'Nonosbawsut',	'Chief',			'DJSHenninger'	UNION ALL
/*N*/SELECT	'MINOR_CIV_STANDING_ROCK','standing_rock_leadericon.dds',	'the Sioux',				'Eagle Woman',	'Chief',			'Arilasqueto'	UNION ALL
-- Maritime
SELECT	'MINOR_CIV_TROWULAN',		'trowulan_leadericon.dds',		'the Majapahit Empire',			'Gajah Mada',	'Mahapatih',		'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_JAKARTA',		'jakarta_leadericon.dds',		'the Sunda Kingdom',			'Prabu Siliwangi',	'King',			'EmeraldRange'	UNION ALL
SELECT	'MINOR_CIV_VENICE',			'venice_leadericon.dds',		'the Republic of Venice',		'Enrico Dandolo ',	'Doge',			'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_RIO_DE_JANEIRO',	'rio_de_janeiro_leadericon.dds','Brazil',						'Pedro II',		'Emperor',			'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_LISBON',			'lisbon_leadericon.dds',		'the Kingdom of Portugal',		'Maria I',		'Queen',			'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_PERGE',			'perge_leadericon.dds',			'Perge',						'Apollonios',	'',					'Jarcast'		UNION ALL
SELECT	'MINOR_CIV_PAGO_PAGO',		'pagopago_leadericon.dds',		'Samoa',						'Salamasina',	'Tafa''ifa',		'TPangolin'		UNION ALL
/*N*/SELECT	'MINOR_CIV_KESPUKWITK',	'kespukwitk_leadericon.dds',	'the Wabanaki Confederacy',		'Henri Membertou',	'Grand Chief',	'TPangolin'		UNION ALL
/*N*/SELECT	'MINOR_CIV_KOTA_BATU',	'kota_batu_leadericon.dds',		'the Brunei Empire',			'Bolkiah ibn Sulaiman',	'Sultan',	'TopHatPaladin'	UNION ALL
/*N*/SELECT	'MINOR_CIV_LANTAU',		'lantau_leadericon.dds',		'the Guangdong Pirate Confederation','Ching Shih',	'Leader',		'TPangolin'		UNION ALL
-- Mercantile
SELECT	'MINOR_CIV_HARAPPA',		'harappa_leadericon.dds',		'the Harappans',				'Went-Antu',	'',					'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_NOVGOROD',		'novgorod_leadericon.dds',		'the Novgorod Republic',		'Aleksandr Nevsky',	'Prince',		'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_SEGOU',			'segou_leadericon.dds',			'the Bambara Kingdom',			'Bitòn Coulibaly',	'King',			'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_MARRAKECH',		'marrakech_leadericon.dds',		'the Almoravids',				'Zaynab an-Nafzawiyyah','Queen',	'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_HEIDABIR',		'heidabir_leadericon.dds',		'the Danes',					'Gudfred',		'King',				'JFD'			UNION ALL
SELECT	'MINOR_CIV_LUTETIA',		'lutetia_leadericon.dds',		'the Gauls',					'Vercingetorix','King',				'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_OUAGADOUGOU',	'ouagadougou_leadericon.dds',	'the Mossi Kingdoms',			'Yennenga',		'Queen',			'Arilasqueto'	UNION ALL
SELECT	'MINOR_CIV_UTICA',			'utica_leadericon.dds',			'Carthage',						'Dido',			'Queen',			'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_BORNU',			'bornu_leadericon.dds',			'the Bornu Empire',				'Rabih az-Zubayr','Emir',			'RawSasquatch'	UNION ALL
/*N*/SELECT	'MINOR_CIV_MANGAZEYA',	'mangazeya_leadericon.dds',		'Mangazeya',					'Davyd Zherebtsov',	'Voivode',		'Arilasqueto'	UNION ALL
-- Militaristic
SELECT	'MINOR_CIV_AZTLAN',			'aztlan_leadericon.dds',		'the Aztecs',					'Tenoch',		'Tlatoani',			'Grant'			UNION ALL
SELECT	'MINOR_CIV_ASSUR',			'assur_leadericon.dds',			'the Neo-Assyrian Empire',		'Shammuramat',	'Queen',			'TarcisioCM'	UNION ALL
SELECT	'MINOR_CIV_OKILIS',			'okilis_leadericon.dds',		'the Arevaci',					'Ambo',			'Leader',			'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_KWA_BULAWAYO',	'kwa_bulawayo_leadericon.dds',	'the Ndebele',					'Lobengula Khumalo',	'King',		'RawSasquatch'	UNION ALL
SELECT	'MINOR_CIV_LONGCHENG',		'longcheng_leadericon.dds',		'the Tang',						'Taizong',		'Emperor',			'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_SOKOTO',			'sokoto_leadericon.dds',		'the Sokoto Caliphate',			'Usman dan Fodio',	'Shehu',		'TopHatPaladin'	UNION ALL
SELECT	'MINOR_CIV_BAN_CHIANG',		'ban_chiang_leadericon.dds',	'Ban Chiang',					'Hawhna',		'',					'Jarcast'		UNION ALL -- Hawhna = chief/head/leader in Isan language
SELECT	'MINOR_CIV_ZUUNMOD',		'zuunmod_leadericon.dds',		'the Northern Yuan',			'Mandukhai the Wise',	'Khatun',	'Grant'			UNION ALL
SELECT	'MINOR_CIV_PALATIUM',		'palatium_leadericon.dds',		'the Romans',					'Romulus',		'King',				'TopHatPaladin'	UNION ALL
/*N*/SELECT	'MINOR_CIV_CO_LOA',		'co_loa_leadericon.dds',		'the Lac Viet',					'Trung Trac',	'Queen',			'Lungora'		UNION ALL
-- Religious
SELECT	'MINOR_CIV_AKSUM',			'aksum_leadericon.dds',			'Aksum',						'Kaleb',		'King',				'DMS'			UNION ALL
SELECT	'MINOR_CIV_DJENNE',			'djenne_leadericon.dds',		'Songhai',						'Askia Muhammad I',	'King',			'Firaxis'		UNION ALL
SELECT	'MINOR_CIV_NIPPUR',			'nippur_leadericon.dds',		'the Akkadian Empire',			'Sargon',		'Sarrum',			'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_RAQMU',			'raqmu_leadericon.dds',			'Nabatea',						'Aretas III',	'King',				'Sukritact'		UNION ALL
SELECT	'MINOR_CIV_SALEM',			'salem_leadericon.dds',			'the Province of Massachusetts Bay','William Stoughton','Governor',	'ExplosiveWatermelon'	UNION ALL
SELECT	'MINOR_CIV_ONONDAGA',		'onondaga_leadericon.dds',		'the Onondaga',					'Tadodaho',		'Chief',			'Leugi'			UNION ALL
SELECT	'MINOR_CIV_SHEDET',			'shedet_leadericon.dds',		'Egypt',						'Djoser',		'Pharaoh',			'Janboruta'		UNION ALL
SELECT	'MINOR_CIV_HUARI',			'huari_leadericon.dds',			'the Wari',						'Lady of Huarmey',		'',			'TopHatPaladin'	UNION ALL
/*N*/SELECT	'MINOR_CIV_PIR_E_SABZ',	'piresabz_leadericon.dds',		'the Sasanian Empire',			'Shapur II',	'Shahanshah',		'TopHatPaladin' UNION ALL
/*N*/SELECT	'MINOR_CIV_DELHI',		'delhi_leadericon.dds',			'the Delhi Sultanate',			'Raziyat al-Din',	'Sultan',		'DarthKyofu';

INSERT OR REPLACE INTO MinorCivLeaders
		(Type,						LeaderIcon,					LeaderPlace,						LeaderName,					LeaderTitle,	LeaderArtistName)
SELECT	'MINOR_CIV_SINGALEK',		'singalek_leadericon.dds',	'the Silvaeji-Neo Silvae Ministry',	'Silver Midnight Wishes',	'',				''	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='JAR_CSL_ITA_VTUBERS' AND Value= 1 ) UNION ALL
SELECT	'MINOR_CIV_LULENA',			'lulena_leadericon.dds',	'Silvandral',						'Lulena',					'Dragon',		''	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='JAR_CSL_ITA_VTUBERS' AND Value= 1 ) UNION ALL
SELECT	'MINOR_CIV_LALLAWAFFLE',	'lalla_leadericon.dds',		'Poponzo',							'Lalla Waffle',				'Witch Apprentice',	''	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='JAR_CSL_ITA_VTUBERS' AND Value= 1 ) UNION ALL
SELECT	'MINOR_CIV_NYMELINE',		'nymeline_leadericon.dds',	'La Clinica',						'Nymeline',					'Bunny Nurse',	''	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='JAR_CSL_ITA_VTUBERS' AND Value= 1 ) UNION ALL
SELECT	'MINOR_CIV_CHEN_MEI_LING',	'meiling_leadericon.dds',	'the Garden of Oblivion',			'Chen Mei Ling',			'Kumiho',		''	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='JAR_CSL_ITA_VTUBERS' AND Value= 1 );
--======================================================================================================================================
-- BASE 
--======================================================================================================================================
UPDATE MinorCivLeaders SET LeaderIcon = 'almaty_leadericon2.dds', LeaderPlace = 'the Kazakh Khanate', LeaderName = 'Ablai Khan',
	LeaderTitle = '', LeaderArtistName = 'DuskJockey'
WHERE Type = 'MINOR_CIV_ALMATY';

UPDATE MinorCivLeaders SET LeaderIcon = 'antananarivo_leadericon2.dds',	LeaderPlace = 'the Kingdom of Imerina',	LeaderName = 'Ranavalona I',
	LeaderTitle = 'Queen',	LeaderArtistName = 'DMS'
WHERE Type = 'MINOR_CIV_ANTANANARIVO';

UPDATE MinorCivLeaders SET LeaderIcon = 'belgrade_leadericon2.dds', LeaderPlace = 'the Kingdom of Serbia', LeaderName = 'Peter I',
	LeaderTitle = 'King', LeaderArtistName = 'Janboruta'
WHERE Type = 'MINOR_CIV_BELGRADE';

UPDATE MinorCivLeaders SET LeaderIcon = 'bucharest_leadericonX.dds'
WHERE Type = 'MINOR_CIV_BUCHAREST';

UPDATE MinorCivLeaders SET LeaderIcon = 'cahokia_leadericon2.dds', LeaderName = 'Birdman', LeaderTitle = 'King', LeaderArtistName = 'H. Roe/TPangolin'
WHERE Type = 'MINOR_CIV_CAHOKIA';

UPDATE MinorCivLeaders SET LeaderIcon = 'hanoi_leadericon2.dds', LeaderName = 'Le Loi', LeaderTitle = 'Emperor', LeaderArtistName = 'LastSword'
WHERE Type = 'MINOR_CIV_HANOI';

UPDATE MinorCivLeaders SET LeaderIcon = 'kabul_leadericon2.dds', LeaderArtistName = 'Janboruta'
WHERE Type = 'MINOR_CIV_KABUL';

UPDATE MinorCivLeaders SET LeaderIcon = 'mbanza_kongo_leadericonX.dds', LeaderPlace = 'the Kingdom of Kongo', LeaderName = 'Afonso I',
	LeaderTitle = 'Manikongo', LeaderArtistName= 'JFD'
WHERE Type = 'MINOR_CIV_MBANZA_KONGO';

UPDATE MinorCivLeaders SET LeaderIcon = 'melbourne_leadericon2.dds', LeaderPlace = 'the Commonwealth of Australia',
	LeaderName = 'Billy Hughes', LeaderTitle = 'Prime Minister', LeaderArtistName = 'DarthKyofu'
WHERE Type = 'MINOR_CIV_MELBOURNE';

UPDATE MinorCivLeaders SET LeaderIcon = 'mombasa_leadericon2.dds', LeaderArtistName= 'DMS'
WHERE Type = 'MINOR_CIV_MOMBASA';

UPDATE MinorCivLeaders SET LeaderIcon = 'monaco_leadericonX.dds', LeaderName = 'Albert I', LeaderArtistName = 'JFD'
WHERE Type = 'MINOR_CIV_MONACO';

UPDATE MinorCivLeaders SET LeaderIcon = 'prague_leadericonX.dds'
WHERE Type = 'MINOR_CIV_PRAGUE';

UPDATE MinorCivLeaders SET LeaderIcon = 'riga_leadericonX.dds',	LeaderPlace = 'the Republic of Latvia',	LeaderName = 'Karlis Ulmanis',
	LeaderTitle = 'Prime Minister',	LeaderArtistName = 'TopHatPaladin'
WHERE Type = 'MINOR_CIV_RIGA';

UPDATE MinorCivLeaders SET LeaderIcon = 'samarkand_leadericon2.dds',	LeaderName = 'Timur', LeaderArtistName = 'Tomatekh'
WHERE Type = 'MINOR_CIV_SAMARKAND';

/*UPDATE MinorCivLeaders SET LeaderIcon = 'sofia_leadericonX.dds', LeaderPlace = 'Bulgaria', LeaderName = 'Vasil Levski', LeaderTitle = '',
	LeaderArtistName = 'Merrick'
WHERE Type = 'MINOR_CIV_SOFIA';*/

UPDATE MinorCivLeaders SET LeaderIcon = 'sofia_leadericon3.dds', LeaderArtistName = 'DarthKyofu'
WHERE Type = 'MINOR_CIV_SOFIA';

UPDATE MinorCivLeaders SET LeaderIcon = 'sydney_leadericon2.dds', LeaderPlace = 'New South Wales', LeaderName = 'Henry Parkes',
	LeaderTitle = 'Premier', LeaderArtistName = 'TPangolin'
WHERE Type = 'MINOR_CIV_SYDNEY';

UPDATE MinorCivLeaders SET 	LeaderIcon = 'ur_leadericonX.dds'
WHERE Type = 'MINOR_CIV_UR';

UPDATE MinorCivLeaders SET LeaderIcon = 'valletta_leadericonX.dds', LeaderName = 'Jean La Valette', LeaderArtistName = 'JFD'
WHERE Type = 'MINOR_CIV_VALLETTA';

UPDATE MinorCivLeaders SET 	LeaderIcon = 'vancouver_leadericon2.dds'
WHERE Type = 'MINOR_CIV_VANCOUVER';

UPDATE MinorCivLeaders SET LeaderIcon = 'vatican_city_leadericon2.dds', LeaderName = 'John Paul II', LeaderArtistName = 'DMS'
WHERE Type = 'MINOR_CIV_VATICAN_CITY';

UPDATE MinorCivLeaders SET LeaderIcon = 'wellington_leadericon2.dds', LeaderArtistName = 'Janboruta'
WHERE Type = 'MINOR_CIV_WELLINGTON';
--======================================================================================================================================
--======================================================================================================================================
CREATE TRIGGER Jar_CSUBaseReplacement
AFTER INSERT ON MinorCivLeaders WHEN (NEW.Type ='MINOR_CIV_ZURICH')
BEGIN
UPDATE MinorCivLeaders SET LeaderIcon = 'almaty_leadericon2.dds', LeaderPlace = 'the Kazakh Khanate', LeaderName = 'Ablai Khan',
	LeaderTitle = '', LeaderArtistName = 'DuskJockey'
WHERE Type = 'MINOR_CIV_ALMATY';

UPDATE MinorCivLeaders SET LeaderIcon = 'antananarivo_leadericon2.dds',	LeaderPlace = 'the Kingdom of Imerina',	LeaderName = 'Ranavalona I',
	LeaderTitle = 'Queen',	LeaderArtistName = 'DMS'
WHERE Type = 'MINOR_CIV_ANTANANARIVO';

UPDATE MinorCivLeaders SET LeaderIcon = 'belgrade_leadericon2.dds', LeaderPlace = 'the Kingdom of Serbia', LeaderName = 'Peter I',
	LeaderTitle = 'King', LeaderArtistName = 'Janboruta'
WHERE Type = 'MINOR_CIV_BELGRADE';

UPDATE MinorCivLeaders SET LeaderIcon = 'bucharest_leadericonX.dds'
WHERE Type = 'MINOR_CIV_BUCHAREST';

UPDATE MinorCivLeaders SET LeaderIcon = 'cahokia_leadericon2.dds', LeaderName = 'Birdman', LeaderTitle = 'King', LeaderArtistName = 'H. Roe/TPangolin'
WHERE Type = 'MINOR_CIV_CAHOKIA';

UPDATE MinorCivLeaders SET LeaderIcon = 'hanoi_leadericon2.dds', LeaderName = 'Le Loi', LeaderTitle = 'Emperor', LeaderArtistName = 'LastSword'
WHERE Type = 'MINOR_CIV_HANOI';

UPDATE MinorCivLeaders SET LeaderIcon = 'kabul_leadericon2.dds', LeaderArtistName = 'Janboruta'
WHERE Type = 'MINOR_CIV_KABUL';

UPDATE MinorCivLeaders SET LeaderIcon = 'mbanza_kongo_leadericonX.dds', LeaderPlace = 'the Kingdom of Kongo', LeaderName = 'Afonso I',
	LeaderTitle = 'Manikongo', LeaderArtistName= 'JFD'
WHERE Type = 'MINOR_CIV_MBANZA_KONGO';

UPDATE MinorCivLeaders SET LeaderIcon = 'melbourne_leadericon2.dds', LeaderPlace = 'the Commonwealth of Australia',
	LeaderName = 'Billy Hughes', LeaderTitle = 'Prime Minister', LeaderArtistName = 'DarthKyofu'
WHERE Type = 'MINOR_CIV_MELBOURNE';

UPDATE MinorCivLeaders SET LeaderIcon = 'mombasa_leadericon2.dds', LeaderArtistName= 'DMS'
WHERE Type = 'MINOR_CIV_MOMBASA';

UPDATE MinorCivLeaders SET LeaderIcon = 'monaco_leadericonX.dds', LeaderName = 'Albert I', LeaderArtistName = 'JFD'
WHERE Type = 'MINOR_CIV_MONACO';

UPDATE MinorCivLeaders SET LeaderIcon = 'prague_leadericonX.dds'
WHERE Type = 'MINOR_CIV_PRAGUE';

UPDATE MinorCivLeaders SET LeaderIcon = 'riga_leadericonX.dds',	LeaderPlace = 'the Republic of Latvia',	LeaderName = 'Karlis Ulmanis',
	LeaderTitle = 'Prime Minister',	LeaderArtistName = 'TopHatPaladin'
WHERE Type = 'MINOR_CIV_RIGA';

UPDATE MinorCivLeaders SET LeaderIcon = 'samarkand_leadericon2.dds',	LeaderName = 'Timur', LeaderArtistName = 'Tomatekh'
WHERE Type = 'MINOR_CIV_SAMARKAND';

/*UPDATE MinorCivLeaders SET LeaderIcon = 'sofia_leadericonX.dds', LeaderPlace = 'Bulgaria', LeaderName = 'Vasil Levski', LeaderTitle = '',
	LeaderArtistName = 'Merrick'
WHERE Type = 'MINOR_CIV_SOFIA';*/

UPDATE MinorCivLeaders SET LeaderIcon = 'sofia_leadericon3.dds', LeaderArtistName = 'DarthKyofu'
WHERE Type = 'MINOR_CIV_SOFIA';

UPDATE MinorCivLeaders SET LeaderIcon = 'sydney_leadericon2.dds', LeaderPlace = 'New South Wales', LeaderName = 'Henry Parkes',
	LeaderTitle = 'Premier', LeaderArtistName = 'TPangolin'
WHERE Type = 'MINOR_CIV_SYDNEY';

UPDATE MinorCivLeaders SET 	LeaderIcon = 'ur_leadericonX.dds'
WHERE Type = 'MINOR_CIV_UR';

UPDATE MinorCivLeaders SET LeaderIcon = 'valletta_leadericonX.dds', LeaderName = 'Jean La Valette', LeaderArtistName = 'JFD'
WHERE Type = 'MINOR_CIV_VALLETTA';

UPDATE MinorCivLeaders SET 	LeaderIcon = 'vancouver_leadericon2.dds'
WHERE Type = 'MINOR_CIV_VANCOUVER';

UPDATE MinorCivLeaders SET LeaderIcon = 'vatican_city_leadericon2.dds', LeaderName = 'John Paul II', LeaderArtistName = 'DMS'
WHERE Type = 'MINOR_CIV_VATICAN_CITY';

UPDATE MinorCivLeaders SET LeaderIcon = 'wellington_leadericon2.dds', LeaderArtistName = 'Janboruta'
WHERE Type = 'MINOR_CIV_WELLINGTON';

END;
--======================================================================================================================================
--======================================================================================================================================