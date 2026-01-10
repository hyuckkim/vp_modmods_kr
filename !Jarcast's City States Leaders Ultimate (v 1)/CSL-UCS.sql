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
-- UCS
--======================================================================================================================================
INSERT OR REPLACE INTO MinorCivLeaders
				(Type,							LeaderIcon,						LeaderPlace,									LeaderName,								LeaderTitle,			LeaderArtistName)
		SELECT	'MINOR_CIV_ADEJE',				'adeje_leadericon.dds',			'the Guanches',									'Tinerfe',								'Grand Mencey',			'DJSHenninger'						 UNION ALL	
		SELECT	'MINOR_CIV_AL_TIRABIN',			'al_tirabin_leadericon.dds',	'the Bedouins',									'Hamad Pasha as-Sufi',					'Leader',				'Grant'								 UNION ALL	
--		SELECT	'MINOR_CIV_AMBRACIA',			'ambracia_leadericon.dds',		'the Epirus',									'Pyrrhus',								'King',					'DMS'								 UNION ALL	
		SELECT	'MINOR_CIV_ANANGULA',			'anangula_leadericon.dds',		'the Aleuts',									'Agugux',								'Creator',				'TopHatPaladin'						 UNION ALL	
--		SELECT	'MINOR_CIV_ANDORRA',			'andorra_leadericon.dds',		'the Principality of Andorra',					'Roger-Bernard III',					'Count',				'Grant'								 UNION ALL	
--		SELECT	'MINOR_CIV_ARMAGH',				'armagh_leadericon.dds',		'the Gaelic Ireland',							'Patrick',								'Saint',				'Mosile'							 UNION ALL	
--		SELECT	'MINOR_CIV_AUCKLAND',			'parihaka_leadericon.dds',		'the Ngati Toa' /*Ngāti Toa*/,					'Te Rauparaha',							'Rangatira',			'Janboruta'							 UNION ALL
		SELECT	'MINOR_CIV_AYUTTHAYA',			'ayutthaya_leadericon.dds',		'the Kingdom of Ayutthaya',						'Naresuan',								'King',					'sukritact'							 UNION ALL	
		SELECT	'MINOR_CIV_BAGAN',				'bagan_leadericon.dds',			'the Kingdom of Pagan',							'Anawrahta Minsaw',						'King',					'Sukritact'							 UNION ALL	
		SELECT	'MINOR_CIV_BAGHCASARAY',		'baghcasaray_leadericon.dds',	'the Crimean Khanate',							'Haci I Giray',							'Khan',					'DarthKyofu'						 UNION ALL	
--		SELECT	'MINOR_CIV_BALLEY_CHASHTAL',	'balley_leadericon.dds',		'the Kingdom of Mann and the Isles',			'Somerled',								'King',					'Davey_henninger'					 UNION ALL	
		SELECT	'MINOR_CIV_BALKH',				'balkh_leadericon.dds',			'the Greco-Bactrian Kingdom',					'Demetrios I',							'King',					'tarcisiocm'						 UNION ALL	
		SELECT	'MINOR_CIV_BEDULU',				'bedulu_leadericon.dds',		'the Kingdom of Bali',							'Mahendradatta',						'Queen',				'TopHatPaladin'						 UNION ALL	
		SELECT	'MINOR_CIV_CANOSSA',			'canossa_leadericon.dds',		'the March of Tuscany',							'Matilda',								'Margravine',			'DuskJockey'						 UNION ALL
		SELECT	'MINOR_CIV_CHEVAK',				'chevak_leadericon.dds',		"the Yup'ik",									'Apanuugpak',							'General',				'Mosile'							 UNION ALL	
--		SELECT	'MINOR_CIV_CLERMONT',			'clermont_leadericon.dds',		'the Duchy of Aquitaine',						'Urban II',								'Pope',					'DarthKyofu'						 UNION ALL	
		SELECT	'MINOR_CIV_DAKKAR',				'dakkar_leadericon.dds',		'the Adal Empire',								'Sabr ad-Din III',						'Sultan',				'Lime'								 UNION ALL	
		SELECT	'MINOR_CIV_DALI',				'dali_leadericon.dds',			'the Kingdom of Dali',							'Duan Siping',							'Commander',			'Grant'								 UNION ALL	
		SELECT	'MINOR_CIV_DANO',				'dano_leadericon.dds',			'the Kingdom of Dagara',						'Salifu Diayor',						'Naa',					'LastSword'							 UNION ALL	
		SELECT	'MINOR_CIV_DJIBOUTI',			'djibouti_leadericon.dds',		'the Republic of Djibouti',						'Hassan Gouled Aptidon',				'President',			'adan_eslavo'						 UNION ALL	
		SELECT	'MINOR_CIV_DODOMA',				'dodoma_leadericon.dds',		'the United Republic of Tanzania',				'Ali Hassan Mwinyi',					'President',			'DMS'								 UNION ALL	
		SELECT	'MINOR_CIV_DOUALA',				'douala_leadericon.dds',		'the Republic of Cameroon',						'Ahmadou Ahidjo',						'President',			'Mosile'							 UNION ALL	
		SELECT	'MINOR_CIV_FAYA',				'faya_leadericon.dds',			'the Republic of Chad',							'Idriss Deby',							'President',			'RawSasquatch'						 UNION ALL	
		SELECT	'MINOR_CIV_GRANADA',			'granada_leadericon.dds',		'the Emirate of Granada',						'Muhammad I ibn Yusuf',					'Emir',					'sukritact'							 UNION ALL
--		SELECT	'MINOR_CIV_GWYNEDD',			'gwynedd_leadericon.dds',		'the Kingdom of Gwynedd',						'Owain Glyndwr' /*Owain Glyndŵr*/,		'Prince',				'Janboruta'							 UNION ALL	
		SELECT	'MINOR_CIV_HANUABADA',			'hanuabada_leadericon.dds',		'the Motu people',								'Edai Siabo',							'Champion',				'RawSasquatch'						 UNION ALL	
		SELECT	'MINOR_CIV_HONDURAS',			'honduras_leadericon.dds',		'the Republic of Honduras',						'Manuel Bonilla Chirinos',				'President',			'Mosile'							 UNION ALL	
		SELECT	'MINOR_CIV_HONIARA',			'honiara_leadericon.dds',		'the Solomon Islands',							'Peter Kenilorea',						'Prime Minister sir',	'adan_eslavo'						 UNION ALL	
--		SELECT	'MINOR_CIV_IRUNEA',				'irunea_leadericon.dds',		'the Kingdom of Iruñea',						'Antso VI.a, Jakituna',					'King',					'Gwennog'							 UNION ALL	
		SELECT	'MINOR_CIV_ISKANWAYA',			'iskanwaya_leadericon.dds',		'the Kallawaya people',							'Mallku',								'',						'Leugi'								 UNION ALL	
		SELECT	'MINOR_CIV_JETARKTE',			'jetarkte_leadericon.dds',		'the Kawesqar' /*Kawésqar*/,					'Terwa Koyo',							'',						'HoopThrower and DarthStarKiller'	 UNION ALL	
		SELECT	'MINOR_CIV_JUYUBIT',			'juyubit_leadericon.dds',		'the Tongva',									'Toypurina',							'Healer',				'Rawsasquatch'						 UNION ALL	
		SELECT	'MINOR_CIV_KAGYRGYN',			'kagyrgyn_leadericon.dds',		'the Chukchi',									'Lawtiliwadlin',						'Principal Warrior',	'TPangolin'							 UNION ALL	
		SELECT	'MINOR_CIV_KARASJOHKA',			'karasjohka_leadericon.dds',	'the Sami',										'Eadni',								'Mother',				'Sukritact'							 UNION ALL	
		SELECT	'MINOR_CIV_KARYES',				'karyes_leadericon.dds',		'the Roman province of Athos',					'Constantine I',						'Emperor',				'Janboruta'							 UNION ALL	
		SELECT	'MINOR_CIV_KATENDE',			'katende_leadericon.dds',		'the Kingdom of Luba',							'Ilunga Sungu',							'King',					'TopHatPaladin'						 UNION ALL	
		SELECT	'MINOR_CIV_KIGALI',				'kigali_leadericon.dds',		'the Kingdom of Rwanda',						'Kigeli IV Rwabugiri',					'Mwami',				'DMS'								 UNION ALL	
--		SELECT	'MINOR_CIV_LACONIA',			'lacedaemon_leadericon.dds',	'the Laconia',									'Leonidas I',							'King',					'Janboruta'							 UNION ALL	
		SELECT	'MINOR_CIV_LAHORE',				'lahore_leadericon.dds',		'the Sikh Empire',								'Ranjit Singh',							'Great Maharaja',		'RawSasquatch'						 UNION ALL	
		SELECT	'MINOR_CIV_LEVUKA',				'levuka_leadericon.dds',		'the Kingdom of Fiji',							'Seru Epenisa Cakobau',					'Ratu',					'Arilasqueto'						 UNION ALL	
		SELECT	'MINOR_CIV_LONGYAN',			'longyan_leadericon.dds',		'the Hakka',									'Chen Lanjisi',							'Rebellion Leader',		'Janboruta'							 UNION ALL	
		SELECT	'MINOR_CIV_MANAGUA',			'managua_leadericon.dds',		'the Republic of Nicaragua',					'Augusto Cesar Sandino',				'',						'Senshi'							 UNION ALL	
		SELECT	'MINOR_CIV_MATONJENI',			'matonjeni_leadericon.dds',		'the BaKalanga',								'Njenjema',								'Founding Priest',		'LastSword'							 UNION ALL	
		SELECT	'MINOR_CIV_MBABANE',			'mbabane_leadericon.dds',		'the Kingdom of Eswatini',						'Labotsibeni Mdluli',					'Queen Mother',			'DMS'								 UNION ALL	
		SELECT	'MINOR_CIV_MENDYARRUP',			'mendyarrup_leadericon.dds',	'the Noongar',									'Yagan',								'Warrior',				'TopHatPaladin'						 UNION ALL	
		SELECT	'MINOR_CIV_MUISCA',				'muisca_leadericon.dds',		'the Muisca Confederation',						'Nemequene',							'Zipa',					'Leugi'								 UNION ALL	
		SELECT	'MINOR_CIV_MULTAN',				'multan_leadericon.dds',		'the Ghazhnavid Empire',						'Mahmud ibn Sabuktigin',				'Sultan',				'TopHatPaladin'						 UNION ALL	
		SELECT	'MINOR_CIV_MUSCAT',				'muscat_leadericon.dds',		'the Sultanate of Oman',						'Saif bin Sultan',						'Imam',					'Janboruta'							 UNION ALL	
		SELECT	'MINOR_CIV_MUTITJULU',			'mutitjulu_leadericon.dds',		'the Anangu',									'Robert James Randall',					'Tjilpi',				'TopHatPaladin and DarthKyofu'		 UNION ALL	
		SELECT	'MINOR_CIV_NAN_MADOL',			'leluh_leadericon.dds',			'the Nan Madol',								'Isokelekel',							'Conqueror',			'Jarcast'							 UNION ALL
--		SELECT	'MINOR_CIV_NGAZARGAMU',			'ngazargamu_leadericon.dds',	'the Kanem-Bornu Empire',						'Idris Alooma',							'Mai',					'Janboruta'							 UNION ALL	
		SELECT	'MINOR_CIV_NYARYANA_MARQ',		'nyaryana_marq_leadericon.dds',	'the Nenets',									'Vavlyo Neniang',						'',						'TPangolin'							 UNION ALL	
		SELECT	'MINOR_CIV_OC_EO',				'oc_eo_leadericon.dds',			'the Funan Kingdom' /*Fúnán*/,					'Soma',									'Queen',				'Grant'								 UNION ALL	
		SELECT	'MINOR_CIV_ODENSO',				'odenso_leadericon.dds',		'the Republic of Finland',						'Karl Gustaf Mannerheim',				'Baron',				'Hypereon'							 UNION ALL	
		SELECT	'MINOR_CIV_OUIDAH',				'ouidah_leadericon.dds',		'the Kingdom of Whydah',						'Haffon',								'King',					'Hoop Thrower'						 UNION ALL	
		SELECT	'MINOR_CIV_PALMYRA',			'palmyra_leadericon.dds',		'the Palmyrene Empire',							'Zenobia' /*Septima Zenobia*/,			'Queen',				'TPangolin'							 UNION ALL	
		SELECT	'MINOR_CIV_PELYM',				'pelym_leadericon.dds',			'the Permians',									'Azykay',								'Grand Duke',			'Grant'								 UNION ALL	
		SELECT	'MINOR_CIV_PHANOTEUS',			'phanoteus_leadericon.dds',		'the Phocis',									'Onomarchus',							'General',				'Mosile'							 UNION ALL	
		SELECT	'MINOR_CIV_POKROVKA',			'pokrovka_leadericon.dds',		'the Massagetae Confederation',					'Tomyris',								'Queen',				'TarcisioCM'						 UNION ALL	
		SELECT	'MINOR_CIV_QUELIMANE',			'quelimane_leadericon.dds',		'the Republic of Mozambique' /*Moçambique*/,	'Manuel de Araújo',						'Mayor',				'adan_eslavo'						 UNION ALL	
		SELECT	'MINOR_CIV_RISHIKESH',			'rishikesh_leadericon.dds',		'the Kingdom of Garhwal',						'Kanak Pal Paramara',					'Raja',					'EmeraldRange'						 UNION ALL	
--		SELECT	'MINOR_CIV_SADDARVAZEH',		'saddarvazeh_leadericon.dds',	'the Achaemenid Empire',						'Vistaspa' /*Vištāspa*/,				'Satrap',				'Gwennog'							 UNION ALL	
		SELECT	'MINOR_CIV_SANAA',				'sanaa_leadericon.dds',			'the Sultanate of Yemen',						'Arwa al-Sulayhi',						'Queen',				'Urdnot '							 UNION ALL	
--		SELECT	'MINOR_CIV_SANANDAJ',			'sanandaj_leadericon.dds',		'the Principality of Ardalan',					'Bani Ardalan',							'King',					'Darth'								 UNION ALL	
		SELECT	'MINOR_CIV_SANTO_DOMINGO',		'santo_domingo_leadericon.dds',	'the Dominican Republic',						'Juan Pablo Duarte',					'',						'Mosile'							 UNION ALL	
		SELECT	'MINOR_CIV_SARNATH',			'sarnath_leadericon.dds',		'the Maurya Empire',							'Ashoka',								'Emperor',				'Janboruta'							 UNION ALL
		SELECT	'MINOR_CIV_SGANG_GWAAY',		'sgang_leadericon.dds',			'the Haida',									'Koyah',								'Chief',				'RawSasquatch'						 UNION ALL	
--		SELECT	'MINOR_CIV_SIERRA_LEONE',		'sierra_leone_leadericon.dds',	'the Republic of Sierra Leone',					'Sir Milton Margai',					'Prime Minister',		'adan_eslavo'						 UNION ALL	
		SELECT	'MINOR_CIV_SUCEAVA',			'suceava_leadericon.dds',		'the Moldavian Empire',							'Stephen III',							'King',					'DJSHenninger'						 UNION ALL	
--		SELECT	'MINOR_CIV_SURREY',				'surrey_leadericon.dds',		'the Kingdom of Great Britain',					'George V',								'King',					'Janboruta'							 UNION ALL	
		SELECT	'MINOR_CIV_TAIWAN',				'taipei_leadericon.dds',		'the Republic of China',						'Sun Yat-sen',							'President',			'DJSHenninger'						 UNION ALL	
		SELECT	'MINOR_CIV_TBILISI',			'tbilisi_leadericon.dds',		'the Kingdom of Georgia',						'Tamar',								'Queen',				'Urdnot'							 UNION ALL
		SELECT	'MINOR_CIV_THIMPHU',			'thimphu_leadericon.dds',		'the Kingdom of Bhutan',						'Jigme Dorji Wangchuck',				'Druk Gyalpo',			'Janboruta'							 UNION ALL	
		SELECT	'MINOR_CIV_TIWANAKU',			'tiwanaku_leadericon.dds',		'the Tiwanaku Empire',							'Huyustus',								'Cacique',				'Leugi'								 UNION ALL	
		SELECT	'MINOR_CIV_TUNIS',				'tunis_leadericon.dds',			'the Hafsid Sultanate',							'Abu Zakariya Yahya',					'Sultan',				'Regalman'							 UNION ALL	
		SELECT	'MINOR_CIV_VADUZ',				'vaduz_leadericon.dds',			'the Principality of Liechtenstein',			'Johann II',							'Prince',				'DuskJockey'						 UNION ALL	
		SELECT	'MINOR_CIV_WOOTEI_NIICIE',		'wootei_niicie_leadericon.dds',	'the Arapaho',									'Pretty Nose',							'War Chief',			'Arilasqueto'						 UNION ALL	
		SELECT	'MINOR_CIV_YANGCHENG',			'yangcheng_leadericon.dds',		'the Xia Dynasty',								'Yu',									'Emperor',				'Janboruta'							;

DELETE FROM MinorCivLeaders WHERE Type IN
('MINOR_CIV_AMBRACIA', 'MINOR_CIV_ARMAGH', 'MINOR_CIV_BALLEY_CHASHTAL', 'MINOR_CIV_CLERMONT', 'MINOR_CIV_GWYNEDD',
'MINOR_CIV_IRUNEA', 'MINOR_CIV_LACONIA', 'MINOR_CIV_SANANDAJ', 'MINOR_CIV_SIERRA_LEONE', 'MINOR_CIV_SURREY');
--======================================================================================================================================
--======================================================================================================================================