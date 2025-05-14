CREATE TABLE IF NOT EXISTS MinorCivLeaders (
	'ID' INTEGER PRIMARY KEY AUTOINCREMENT,
	'Type' TEXT NOT NULL UNIQUE,
	'LeaderIcon' TEXT NOT NULL,
	'ModernCountry' TEXT DEFAULT NULL,
	'ShortModernCountry' TEXT DEFAULT NULL,
	'LeaderPlace' TEXT DEFAULT NULL,
	'LeaderName' TEXT DEFAULT NULL,
	'LeaderTitle' TEXT DEFAULT NULL,
	'LeaderSuffix' TEXT DEFAULT NULL,
	'LeaderArtistName' TEXT DEFAULT NULL,
	FOREIGN KEY (Type) REFERENCES MinorCivilizations(Type));
	
------------
--CSL MODS--
------------

INSERT INTO MinorCivLeaders(
		Type,						LeaderIcon,						ModernCountry,								ShortModernCountry,	LeaderPlace,			LeaderName,				LeaderTitle,		LeaderSuffix,	LeaderArtistName)
--SELECT	'ARTPACK',				'MODS',							'',											'',					'',						'',						'',					'',				''						UNION ALL

--NEW CITY STATES
--===============

--"Asgard as a City State" by hdarmy
--56c24ab7-6307-40e9-9e61-3bedc7d01447
---------------------------------
SELECT	'MINOR_CIV_ASGARD',		'asgard_leadericon.dds',	'Asgard',	'Asgard',	'Asgard',	'Odin',	'',	'',	'Nutty'	UNION ALL

--"Atlantis City State" by hdarmy
--3b6115b6-96b9-4837-a12c-ede1955866c5
---------------------------------
SELECT	'MINOR_CIV_ATLANTIS',		'atlantis_leadericon.dds',	'Atlantis',	'Atlantis',	'Atlantis',	'Minos',	'King',	'',	'Nutty'	UNION ALL

--"City States Expansion" by Hiram
--4d02cc9f-0805-4988-ae84-1dc28d49e1f0 [G+K/BNW]
--ba741105-ccc2-4b97-a235-c9eefa22a868 [vanilla]
----------------------------------
--SELECT	'MINOR_CIV_ACCRA',		'accra_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_AKUTAN',		'akutan_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_ANDORRA_LA_VELLA', 'andorra_la_vella_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSL2: MINOR_CIV_ANTANANARIVO]
SELECT	'MINOR_CIV_ASUNCION',		'asuncion_leadericon.dds',		'The Republic of Paraguay',						'Paraguay',		'Paraguay',				'Jose Gaspar de Francia', 'Consul',			'',				'Leugi'					UNION ALL
--SELECT	'MINOR_CIV_BAAWITING',	'baawiting_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[More CS: MINOR_CIV_BAKU]
--SELECT	'MINOR_CIV_BAMAGA',		'bamaga_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_BANDAR_SERI_BEGAWAN', 'bandar_seri_begawan_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_BEHCHOKO',	'behchoko_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_BELMOPAN',	'belmopan_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_BENGHAZI',	'benghazi_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_BERMUDA',	'bermuda_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_BIROBIDZHAN', 'birobidzhan_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_BLOEMFONTEIN', 'bloemfontein_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_BORIKEN',	'boriken_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[X]MINOR_CIV_BRISBANE
--[X]MINOR_CIV_CHOTA
--[X]MINOR_CIV_DAKAR
--SELECT	'MINOR_CIV_DANZIG',		'danzig_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[More CS: MINOR_CIV_DHAK:]
SELECT	'MINOR_CIV_DHAKA',			'dhaka_leadericon.dds',			"The People's Republic of Bangladesh",			 'Bangladesh',	'Bangladesh',			'Sheikh Mujibur Rahman', 'President',		'',				''						UNION ALL
--SELECT	'MINOR_CIV_DILI',		'dili_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_DJIBOUTI',	'djibouti_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_DOHA',		'doha_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_DONGOLA',	'dongola_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
SELECT	'MINOR_CIV_DUBAI',			'dubai_leadericon.dds',			'The United Arab Emirates',					'the United Arab Emirates', 'the United Arab Emirates', 'Mohammed Al Maktoum', 'Prime Minister Shiekh', '', 'TPangolin'		UNION ALL
--SELECT	'MINOR_CIV_GEORGETOWN',	'georgetown_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_GONUR',		'gonur_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_GVEILINZ',	'gveilinz_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[YnAEMP: MINOR_CIV_HARAPPA]
--[More CS: MINOR_CIV_HAVA:]
SELECT	'MINOR_CIV_HAVANA',			'havana_leadericon.dds',		'The Republic of Cuba',							'Cuba',			'Cuba',					'Fidel Castro',			'President',		'',				''						UNION ALL
--SELECT	'MINOR_CIV_HONIARA',		'honiara_leadericon.dds',		'Solomon Islands',								'Solomon Islands', 'Solomon Islands',	'',						'',					'',				''						UNION ALL
--SELECT	'MINOR_CIV_IMMOKALEE',	'immokalee_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_ISHIKARI',	'ishikari_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[X]MINOR_CIV_IQUALUIT
--SELECT	'MINOR_CIV_JIROFT',		'jiroft_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_KAMPALA',	'kampala_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_KANO',		'kano_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_KARASJOKI',	'karasjoki_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_KAZAN',		'kazan_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_KHARTOUM',	'khartoum_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSL2: MINOR_CIV_KIEV]
--[X]MINOR_CIV_KINGSTON
--SELECT	'MINOR_CIV_KISONGO',	'kisongo_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_KOROR',		'koror_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_KUHIKUGU',	'kuhikugu_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[X]MINOR_CIV_KUL_OBA
--[X]MINOR_CIV_KUMASI
--SELECT	'MINOR_CIV_KUSA',		'kusa_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[MoreCS: MINOR_CIV_LA_PAZ]
--SELECT	'MINOR_CIV_LOME',		'lome_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_LUANDA',		'luanda_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_LUSAKA',		'lusaka_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_MALE',		'male_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSL2: MINOR_CIV_MELBOURNE]
--SELECT	'MINOR_CIV_MERIDA',		'merida_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[X]MINOR_CIV_MEROE
--[CSL2: MINOR_CIV_MOGADISHU]
SELECT	'MINOR_CIV_MONTEVIDEO',		'montevideo_leadericon.dds',	'Oriental Republic of Uruguay',				'Uruguay',			'Rio de la Plata',		'Bruno Mauricio de Zabala', 'Governor',		'',				'P. Alonso/TPangolin'	UNION ALL
--SELECT	'MINOR_CIV_MONROVIA',	'monrovia_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_NAIN',		'nain_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_NAMAGZA_TEPE', 'namagza_tepe_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_NANTES',		'nantes_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[More CS: MINOR_CIV_NAPO:]
SELECT	'MINOR_CIV_NAPLES',			'naples_leadericon.dds',		'Campania, Italian Republic',					'Campania',		'Naples',				'Luigi de Magistris',	'Mayor',			'',				''						UNION ALL
--SELECT	'MINOR_CIV_NEZ_PERCE',	'nez_perce_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_NISA',		'nisa_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_NJIMI',		'njimi_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_NOUAKCHOTT',	'nouakchott_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_NOUMEA',		'noumea_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_OPPIDUM_BATAVORUM', 'oppidum_batavorum_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PAIUTE',		'paiute_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PALANA',		'palana_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PALMYRA',	'palmyra_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSL2 MINOR_CIV_PANAMA_CITY:]
SELECT		'MINOR_CIV_PANAMA',		'panama_city_leadericon.dds',	'The Republic of Panama',						'Panama',		'Panama',				'Victoriano Lorenzo',	'General',			'',				'Leugi'					UNION ALL
--SELECT	'MINOR_CIV_PANAMARCA',	'panamarca_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PANTICAPAEUM', 'panticapaeum_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PARAMARIBO',	'paramaribo_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[X]MINOR_CIV_PERTH
--[X]MINOR_CIV_PITJANTJATJARA
--SELECT	'MINOR_CIV_PONDICHERRY', 'pondicherry_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PORT_LOUIS',	'port_louis_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PORT_MORESBY', 'port_moresby_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[X]MINOR_CIV_PORT_VILA
--SELECT	'MINOR_CIV_PRAIA',		'praia_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_RED_RIVER',	'red_river_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[YnAEMP MINOR_CIV_REYKJAVIK/MoreCS MINOR_CIV_REYK]
--[CSL2: MINOR_CIV_RIGA]
--SELECT	'MINOR_CIV_SAN_JOSE',	'san_jose_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_SAN_SALVADOR', 'san_salvador_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_SANAA',		'sanaa_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_SANGGYEONG',	'sanggyeong_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_SEROWE',		'serowe_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_SHARUHEN',	'sharuhen_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[X]MINOR_CIV_SKIDEGATE
SELECT	'MINOR_CIV_ST_JOHNS',		'st_johns_leadericon.dds',		'Newfoundland and Labrador, Canada',		'Newfoundland',		'Newfoundland',			'Thomas Cochrane',		'Admiral Sir',		'',				'Nutty'					UNION ALL
--SELECT	'MINOR_CIV_STANLEY',	'stanley_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_SUKHUMI',	'sukhumi_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_SUVA',		'suva_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[X]MINOR_CIV_SY_ARA
SELECT		'MINOR_CIV_TAIPEI',			'taipei_leadericon.dds',	'The Republic of China',						'Taiwan',		'Taiwan',				'Chiang Kai-shek',		'President',			'',				''						UNION ALL
SELECT		'MINOR_CIV_TBLISI',			'tblisi_leadericon.dds',	'Georgia',										'Georgia',		'Georgia',				'Tamar',				'Queen',			'the Great',	'davey_henninger'					UNION ALL
--[ALTERNATE]SELECT		'MINOR_CIV_TBLISI',			'tblisi_leadericon2.dds',	'Georgia',										'Georgia',		'Georgia',				'Tamar',				'Queen',			'the Great',	'Nutty'					UNION ALL
--[More CS: MINOR_CIV_THIM, Swiss Conf: MINOR_CIV_THIMPHU:]
SELECT		'MINOR_CIV_THIMBU',			'thimphu_leadericon.dds',	'The Kingdom of Bhutan',						'Bhutan',		'Bhutan',				'Jigme Khesar Wangchuck',	'King',				'',				''					UNION ALL
--SELECT	'MINOR_CIV_TRINIDAD',	'trinidad_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_TULA',	'tula_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_TYR',	'tyr_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_ULAN_UDE',	'ulan_ude_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[X]MINOR_CIV_URUMQI
--SELECT	'MINOR_CIV_USHUAIA',	'ushuaia_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PORT_VILA',	'port_vila_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_WATORIKI',	'watoriki_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSL2: MINOR_CIV_WELLINGTON]
--SELECT	'MINOR_CIV_WINDOW_ROCK',	'window_rock_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_YAKUTSK',	'yakutsk_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_YAOUNDE',	'yaounde_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL

--"Fallout" by Masterhummel
--8c2a6190-c958-4cac-8693-a8c8a2ff73f1
-------------------------------------
SELECT	'MINOR_CIV_AREFU',			'arefu_leadericon.dds',			'Arefu',										'Arefu',		'Arefu',				'Evan King',			'Mayor',			'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_ARROYO',			'arroyo_leadericon.dds',		'Arroyo',										'Arroyo',		'Arroyo',				'Arroyo Elder',			'',					'',		'Black Isle'					UNION ALL
SELECT	'MINOR_CIV_BIG_TOWN',		'big_town_leadericon.dds',		'Big Town',										'Big Town',		'Big Town',				'Red',					'Doctor',			'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_BROKENH',		'broken_hills_leadericon.dds',	'Broken Hills',									'Broken Hills',	'Broken Hills',			'Marcus',				'Mayor Sheriff',	'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_CANTERBURY',		'canterbury_commonsleadericon.dds',	'Canterbury Commons',						'Canterbury Commons', 'Canterbury Commons', 'Ernest "Uncle" Roe', 'Mayor',			'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_DENVER',			'denver_leadericon.dds',		'Denver',										'Denver',		'the Salvagers',		'Porter',				'',					'',		'Black Isle'					UNION ALL
SELECT	'MINOR_CIV_FREEPORT',		'freeport_leadericon.dds',		'Freeport',										'Freeport',		'the Raiders',			"O'Reilly",				'',					'',		'Micro Forte'					UNION ALL
SELECT	'MINOR_CIV_GECKO',			'gecko_leadericon.dds',			'Gecko',										'Gecko',		'Gecko',				'Harold',				'Mayor',			'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_GOODSPRINGS',	'goodsprings_leadericon.dds',	'Goodsprings',									'Goodsprings',	'Goodsprings',			'Trudy',				'Mayor',			'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_HUB',			'the_hub_leadericon.dds',		'The Hub',										'the Hub',		'the Hub',				'Justin Greene',		'Sheriff',			'',		'Black Isle'					UNION ALL
SELECT	'MINOR_CIV_JUNCTION',		'junction_city_leadericon.dds',	'Junction City',								'Junction City', 'Junction City',		'John Levis',			'Mayor',			'',		'Micro Forte'					UNION ALL
SELECT	'MINOR_CIV_JUNKTOWN',		'junktown_leadericon.dds',		'Junktown',										'Junktown',		'Junktown',				'Killian Darkwater',	'Mayor',			'',		'Interplay'						UNION ALL
SELECT	'MINOR_CIV_KLAMATH',		'klamath_leadericon.dds',		'Klamath Falls',								'Klamath Falls', 'Trapper Town',		'Slim Picket',			'',					'',		'Black Isle'					UNION ALL
SELECT	'MINOR_CIV_MEGATON',		'megaton_leadericon.dds',		'Megaton',										'Megaton',		'Megaton',				'Lucas Simms',			'Mayor Sheriff',	'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_NECRO',			'necropolis_leadericon.dds',	'Bakersfield',									'Bakersfield',	'Necropolis',			'Set',					'',					'',		'Black Isle'					UNION ALL
SELECT	'MINOR_CIV_RENO',			'new_reno_leadericon.dds',		'New Reno',										'New Reno',		'New Reno',				'Jesus Mordino',		'Big',				'',		'Black Isle'					UNION ALL
SELECT	'MINOR_CIV_NEWTON',			'newton_leadericon.dds',		'Newton',										'Newton',		'the Reavers',			'Rodger Gaire',			'',					'',		'Micro Forte'					UNION ALL
SELECT	'MINOR_CIV_NOVAC',			'novac_leadericon.dds',			'Novac',										'Novac',		'Novac',				'Jeannie May Crawford',	'',					'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_OASIS',			'oasis_leadericon.dds',			'Oasis',										'Oasis',		'the Treeminders',		'Birch',				'Tree Father',		'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_PARADISE',		'paradise_falls_leadericon.dds', 'Paradise Falls',								'Paradise Falls', 'the Slavers',		'Eulogy Jones',			'',					'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_PIT',			'the_pitt_leadericon.dds',		'Pittsburgh',									'the Pitt',		'the Pitt',				'Ishmael Ashur',		'Lord',				'',		'Bethesda'						UNION ALL
--SELECT	'MINOR_CIV_PIT',			'the_pit_leadericon.dds',		'The Pit',										'the Pit',		'the Vipers',			'Daughter of Hecate',	'',					'',		'Black Isle'					UNION ALL
SELECT	'MINOR_CIV_PRIMM',			'primm_leadericon.dds',			'Primm',										'Primm',		'Primm',				'Primm Slim',			'Sheriff',			'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_RIVET',			'rivet_city_leadericon.dds',	'Rivet City',									'Rivet City',	'Rivet City',			'Madison Li',			'Doctor',			'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_SCOTT',			'scott_city_leadericon.dds',	'Scott City',									'Scott City',	'Scott City',			'The Calculator',		'',					'',		'Micro Forte'					UNION ALL
SELECT	'MINOR_CIV_TOWER',			'tenpenny_tower_leadericon.dds', 'Tenpenny Tower',								'Tenpenny Tower', 'Tenpenny Tower',		'Allistair Tenpenny',	'',					'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_DEN',			'the_den_leadericon.dds',		'The Den',										'the Den',		"Becky's",				'Rebecca Dyer',			'',					'',		'Black Isle'					UNION ALL
SELECT	'MINOR_CIV_VCITY',			'vault_city_leadericon.dds',	'Vault City',									'Vault City',	'Vault City',			'Joanne Lynette',		'First Citizen',	'',		'Bethesda'						UNION ALL
SELECT	'MINOR_CIV_UNDERWORLD',		'underworld_leadericon.dds',	'Underworld',									'Underworld',	'Underworld',			'Barrows',				'Mayor Dr.',		'',		'Bethesda'						UNION ALL

--"Fallout Equestria" by artisticMink
--6827e7ec-5329-4763-8b70-8ca3b4ec0e0c
-------------------------------------
--SELECT	'MINOR_CIV_ARBU',		'arbu_leadericon.dds',		'Arbu',		'Arbu',		'Arbu',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_FILLYDELPHIA',	'fillydelphia_leadericon.dds',	'Fillydelphia',	'Fillydelphia',	'Fillydelphia',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_BUCKLYN',		'bucklyn_cross_leadericon.dds',	'Bucklyn Cross',	'Bucklyn Cross',	'Bucklyn Cross',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_CHAPEL',		'chapel_leadericon.dds',	'Chapel',	'Chapel',	'Chapel',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_FRIENDSHIP',		'friendship_city_leadericon.dds',	'Friendship City',	'Friendship City',	'Friendship City',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_APPLELOOSA',		'new_appleloosa_leadericon.dds',	'New Appleloosa',	'New Appleloosa',	'New Appleloosa',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_GLYPHMARK',		'glyphmark_leadericon.dds',	'Glyphmark',	'Glyphmark',	'Glyphmark',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_TENPONY',		'tenpony_tower_leadericon.dds',	'Tenpony Tower',	'Tenpony Tower',	'Tenpony Tower',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_STALLIONGRAD',	'stalliongrad_leadericon.dds',	'Stalliongrad',	'Stalliongrad',	'Stalliongrad',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_JUNCTION',		'junction_r7_leadericon.dds',	'Junction R-7',	'Junction R-7',	'Junction R-7',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_STABLECITY',		'stable_city_leadericon.dds',	'Stable City',	'Stable City',	'Stable City',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_GLOW',		'the_glow_leadericon.dds',	'The Glow',	'The Glow',	'The Glow',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_VERGE',		'verge_leadericon.dds',		'Verge',	'Verge',	'Verge',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_FORUM',		'forum_leadericon.dds',		'Forum',	'Forum',	'the Forum',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_WELL',		'colts_well_leadericon.dds',	'Colts Well',	'Colts Well',	'Colts Well',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PEGASUS',		'new_pegasus_leadericon.dds',	'New Pegasus',	'New Pegasus',	'New Pegasus',	'',	'',	'',	''	UNION ALL

--"Leusbroek" by Martijn
--a8f61db1-df9d-4e43-a698-ead9c26bfd22
------------------------
--SELECT	'MINOR_CIV_LEUSBROEK',		'leusbroek_leadericon.dds',	'Utrecht, The Netherlands',	'Utrecht',	'Leusbroek',	'',	'',	'',	''	UNION ALL

--"More City States" by jc/crawf0rd
--5059d899-bc14-451e-971d-b34deabaf59e [BNW]
--cd0f69db-13b1-4715-bd0c-437d914e283d [G+K]
--e5ae90a4-c91f-42f9-830a-80558199bb97 [vanilla]
----------------------------------
SELECT	'MINOR_CIV_ABDI',			'abidjan_leadericon.dds',		'The Republic of Cameroon',						'Cameroon',		'Cameroon',				'Felix Houphouet-Boigny', 'President',		'',				''						UNION ALL
SELECT	'MINOR_CIV_ADEL',			'adelaide_leadericon.dds',		'South Australia, Commonwealth of Australia',	'South Australia', 'South Australia',	'Roma Mitchell',		'Governor Dame',	'',				''						UNION ALL
--[CSL2: MINOR_CIV_WELLINGTON:]
SELECT	'MINOR_CIV_AUCK',			'wellington_leadericon.dds',	'New Zealand',									'New Zealand',	'New Zealand',			'Henry Sewell',			'Premier',			'',				''						UNION ALL
SELECT	'MINOR_CIV_BAKU',			'baku_leadericon.dds',			'The Republic of Azerbaijan',					'Azerbaijan',	'Azerbaijan',			'Heydar Aliyev',		'President',		'',				''						UNION ALL
SELECT	'MINOR_CIV_BETH',			'bethlehem_leadericon.dds',		'Bethlehem, Palestinian Territory',				'Bethlehem',	'the Kingdom of Jerusalem', 'Guy of Lusignan',	'King',				'',				'J. Lievens/Nutty'		UNION ALL
--[CSL2: MINOR_CIV_BUENOS_AIRES:]
SELECT	'MINOR_CIV_BA',				'buenos_aires_leadericon.dds',	'The Argentine Republic',						'Argentina',	'Argentina',			'Eva Peron',			'',					'',				'Leugi'					UNION ALL
--[ALTERNATE]SELECT	'MINOR_CIV_BA',	'buenos_aires_leadericon2.dds',	'The Argentine Republic',	'Argentina',	'Argentina',	'Juan de Garay',	'Governor',	'',	'Leugi'	UNION ALL
SELECT	'MINOR_CIV_CASABLANCA',		'casablanca_leadericon.dds',	'Grand Casablanca, Kingdom of Morocco',			'Grand Casablanca', 'Morocco',			'Mohammed Sajid',		'Mayor',			'',				''						UNION ALL
--[CSE: MINOR_CIV_DHAKA:]
SELECT	'MINOR_CIV_DHAK',			'dhaka_leadericon.dds',			"The People's Republic of Bangladesh",			'Bangladesh',	'Bangladesh',			'Sheikh Mujibur Rahman', 'President',		'',				''						UNION ALL
--[many: MINOR_CIV_DUBAI]
SELECT	'MINOR_CIV_FAIS',			'faisalabad_leadericon.dds',	'The Islamic Republic of Pakistan',				'Pakistan',		'Pakistan',				'Benazir Bhutto',		'Prime Minister',	'',				''						UNION ALL
SELECT	'MINOR_CIV_GIBR',			'gibraltar_leadericon.dds',		'Gibraltar',									'Gibraltar',	'Gibraltar',			'Adrian Johns',			'Governor Sir',		'',				''						UNION ALL
SELECT	'MINOR_CIV_GUAD',			'guadalajara_leadericon.dds',	'Jalisco, The United Mexican States',			'Jalisco',		'New Galicia',			'Nuno de Guzman',		'Governor',			'',				''						UNION ALL
SELECT	'MINOR_CIV_HAIF',			'haifa_leadericon.dds',			'Haifa, State of Israel',						'Haifa',		'Haifa',				'Abba Hushi',			'Mayor',			'',				''						UNION ALL
--[YnAEMP Madeira: MINOR_CIV_HATUSSA:]
SELECT	'MINOR_CIV_HATT',			'hattusa_leadericon.dds',		'The Republic of Turkey',						'Turkey',		'the Hittites',			'Tudhaliya IV',			'King',				'',				''						UNION ALL
SELECT	'MINOR_CIV_HAVA',			'havana_leadericon.dds',		'The Republic of Cuba',							'Cuba',			'Cuba',					'Fidel Castro',			'President',		'',				''						UNION ALL
SELECT	'MINOR_CIV_JOHA',			'johannesburg_leadericon.dds',	'The Republic of South Africa',					'South Africa',	'South Africa',			'Nelson Mandela',		'President',		'',				''						UNION ALL
--[CSL2: MINOR_CIV_KABUL]
--[CSL2: MINOR_CIV_KIEV]
--[YnAEMP: MINOR_CIV_KINSHASA]
SELECT	'MINOR_CIV_LA_PAZ',			'la_paz_leadericon.dds',		'The Plurinational State of Bolivia',			'Bolivia',		'Bolivia',				'Evo Morales',			'President',		'',				'Nutty'					UNION ALL
--[ALTERNATE]SELECT	'MINOR_CIV_LA_PAZ',			'la_paz_leadericon2.dds',		'The Plurinational State of Bolivia',			'Bolivia',		'Bolivia',				'Alonso de Mendoza',	'Captain',			'',				''						UNION ALL
SELECT	'MINOR_CIV_LAGOS',			'lagos_leadericon.dds',			'The Federal Republic of Nigeria',				'Nigeria',		'Nigeria',				'Nnamdi Azikiwe',		'President',		'',				''						UNION ALL
--[New CS Types: MINOR_CIV_LUXEMBOURG]
SELECT	'MINOR_CIV_LUXE',			'luxembourg_leadericon.dds',	'The Grand Duchy of Luxembourg',				'Luxembourg',	'Luxembourg',			'Charlotte',			'Grand Duchess',	'',				''						UNION ALL
SELECT	'MINOR_CIV_MAPU',			'maputo_leadericon.dds',		'The Republic of Mozambique',					'Mozambique',	'Mozambique',			'Joaquim Chissano',		'President',		'',				''						UNION ALL
--[CSE: MINOR_CIV_NAPLES:]
SELECT	'MINOR_CIV_NAPO',			'naples_leadericon.dds',		'Campania, Italian Republic',					'Campania',		'Naples',				'Luigi de Magistris',	'Mayor',			'',				''						UNION ALL
SELECT	'MINOR_CIV_NURE',			'nuremberg_leadericon.dds',		'Bavaria, Federal Republic of Germany',			'Bavaria',		'Bavaria',				'Maximilian von Montgelas', 'Count',		'',				''						UNION ALL
SELECT	'MINOR_CIV_QUFU',			'qufu_leadericon.dds',			"Shandong, People's Republic of China",			'Shandong',		'Lu',					'Confucius',			'Master',			'the Sage',		''						UNION ALL
--[ALTERNATE]SELECT	'MINOR_CIV_QUFU',			'qufu_leadericon2.dds',			"Shandong, People's Republic of China",			'Shandong', 'Shandong',		'Kang Sheng',			'Governor',			'',				''						UNION ALL
--[YnAEMP/CSE: MINOR_CIV_REYKJAVIK:]
SELECT	'MINOR_CIV_REYK',			'reykjavik_leadericon.dds',		'Iceland',										'Iceland',		'Iceland',				'Sveinn Bjornsson',		'President',		'',				''						UNION ALL
SELECT	'MINOR_CIV_PERTH',			'perth_leadericon.dds',			'Western Australia, Commonwealth of Australia',	'Western Australia', 'Western Australia', 'Charles Gairdner',	'General Sir',		'',				''						UNION ALL
SELECT	'MINOR_CIV_SALT',			'salt_lake_city_leadericon.dds', 'Utah',										'Utah',			'Utah',					'Brigham Young',		'Governor',			'',				''						UNION ALL
SELECT	'MINOR_CIV_SANT',			'santiago_leadericon.dds',		'The Republic of Chile',						'Chile',		'Chile',				'Manuel Bulnes',		'President',		'',				''						UNION ALL
SELECT	'MINOR_CIV_SAO',			'rio_de_janeiro_leadericon.dds', 'The Federative Republic of Brazil',			'Brazil',		'Brazil',				'Pedro II',				'Emperor',			'the Magnanimous', 'Firaxis'			UNION ALL
--[CSE/New CS Types: MINOR_CIV_TAIPEI', NACSM: MINOR_CIV_TAIWAN]
SELECT	'MINOR_CIV_TAIP',			'taipei_leadericon.dds',		'The Republic of China',						'Taiwan',		'Taiwan',				'Chiang Kai-shek',		'President',		'',				''						UNION ALL
SELECT	'MINOR_CIV_TEHRAN',			'tehran_leadericon.dds',		'The Islamic Republic of Iran',					'Iran',			'Iran',					'Mohammad Reza Shah',	'',					'',				''						UNION ALL
--[CSE: MINOR_CIV_THIMBU, Swiss Conf: MINOR_CIV_THIMPHU:]
SELECT	'MINOR_CIV_THIM',			'thimphu_leadericon.dds',		'The Kingdom of Bhutan',						'Bhutan',		'Bhutan',				'Jigme Khesar Wangchuck', 'King',			'',				''						UNION ALL
SELECT	'MINOR_CIV_TORO',			'toronto_leadericon.dds',		'Ontario, Canada',								'Ontario',		'Toronto',				'William Lyon Mackenzie', 'Mayor',			'',				''						UNION ALL
--[ALTERNATE]SELECT	'MINOR_CIV_TORO',		'toronto_leadericon2.dds',		'Ontario, Canada',								'Ontario',		'Toronto',				'Rob Ford', 'Mayor',			'',				'SCask'						UNION ALL
SELECT	'MINOR_CIV_TRIPOLI',		'tripoli_leadericon.dds',		'The State of Libya',							'Libya',			'Libya',			'Turgut Reis',			'Admiral',			'',				'F. Duran'				UNION ALL
--[CSL2 MINOR_CIV_VANCOUVER:]
SELECT	'MINOR_CIV_VANC',			'vancouver_leadericon.dds',		'British Columbia, Canada',						'British Columbia', 'Canada',			'Mackenzie King',		'Prime Minister',	'',				''						UNION ALL
SELECT	'MINOR_CIV_YANG',			'yangon_leadericon.dds',		'The Republic of the Union of Myanmar',			'Myanmar',		'Burma',				'Anawrahta',			'King',				'',				'sukritact'				UNION ALL

--"Native American Minor Civilizations" by Faustaud
--f1eab253-2f00-4740-b3e6-2d191df4ddee
---------------------------------------------------
--SELECT	'MINOR_CIV_HURON',		'huron_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_CHOCTAW',		'choctaw_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_SHOSHONE',		'shoshone_leadericon.dds',	'Utah',	'Utah',	'the Shoshone',	'Pocatello',	'Chief',	'',	'Firaxis'	UNION ALL
--SELECT	'MINOR_CIV_SHAWNEE',		'shawnee_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PUEBLO',		'pueblo_leadericon.dds',	'Rio Arriba, New Mexico',	'Rio Arriba',	'the Tewa',	'Po'pay',	'',	'',	'Firaxis'	UNION ALL
--SELECT	'MINOR_CIV_LENAPE',		'lenape_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_BLACKFOOT',		'blackfoot_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_ARAPAHO',		'arapaho_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PAWNEE',		'pawnee_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_POWHATAN',		'powhatan_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_ALGONQUIN',		'algonquin_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_CHICKASAW',		'chickasaw_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_NAVAJO',		'navajo_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_CROW',		'crow_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_CHIPPEWA',		'chippewa_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_TOHONO_OODHAM',	'tohono_oodham_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL

--"New City State Types" by Moriboe
--29aaace7-d79a-467c-a579-f5cdb94dcc55
-----------------------------------
--SELECT 'MINOR_CIV_AINU',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_ABORIGINES',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_AMRITSAR',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_BOGOTA',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_BRUGES',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_BUKHARA',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_CAIRO',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[many: MINOR_CIV_DUBAI]
--SELECT 'MINOR_CIV_GREAT_ZIMBABWE',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSE: MINOR_CIV_HAVANA]
--SELECT 'MINOR_CIV_JERSEY',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_KHOISAN',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSL2: MINOR_CIV_KIEV]
--SELECT 'MINOR_CIV_LAGOS',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_MAPUCHE',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSL2: MINOR_CIV_MELBOURNE]
--SELECT 'MINOR_CIV_NAVAJO',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[More CS: MINOR_CIV_LUXE]
SELECT	'MINOR_CIV_LUXEMBOURG',		'luxembourg_leadericon.dds',	'The Grand Duchy of Luxembourg',				'Luxembourg',	'Luxembourg',			'Charlotte',			'Grand Duchess',	'',				''						UNION ALL
--SELECT 'MINOR_CIV_PAGAN',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--MINOR_CIV_PANAMA
--SELECT 'MINOR_CIV_QATAR',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[More CS: MINOR_CIV_QUFU]
--[CSL2: MINOR_CIV_RIGA]
--SELECT 'MINOR_CIV_SAMI',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[YnAEMP: MINOR_CIV_SIOUX]
--[many: MINOR_CIV_TAIPEI]
--[More CS: MINOR_CIV_TORO:]
SELECT	'MINOR_CIV_TORONTO',		'toronto_leadericon.dds',		'Ontario, Canada',								'Ontario',		'Toronto',				'William Lyon Mackenzie', 'Mayor',			'',				''						UNION ALL
--[ALTERNATE]SELECT	'MINOR_CIV_TORONTO',		'toronto_leadericon2.dds',		'Ontario, Canada',								'Ontario',		'Toronto',				'Rob Ford', 'Mayor',			'',				'SCask'						UNION ALL
--SELECT 'MINOR_CIV_TOUAREG',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_TUPI',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSL2: MINOR_CIV_VILNIUS]
--[CSL2: MINOR_CIV_WELLINGTON]

--"Not Another City States Mod" [vanilla] by Iceco
--4abf8487-1194-4170-bf2e-acfb78a93ca5
--------------------------------------------------
--SELECT 'MINOR_CIV_ABORIGINALS',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
SELECT 'MINOR_CIV_ABU_DHABI',	'abu_dhabi_leadericon.dds',	'United Arab Emirates',	'the United Arab Emirates',	'the United Arab Emirates',	'Zayed bin Sultan Al Nahyan',	'President',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_ADDIS_ABABA',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_AMSTERDAM',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_ANDORRA',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_ANFA',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_BAHRAIN',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
SELECT	'MINOR_CIV_BASQUE',		'gasteiz_leadericon.dds',		'Basque Country',	'Basque Country',		'Basque Country',			'Jose Antonio Aguirre',			'President',					'',				''				UNION ALL
--SELECT 'MINOR_CIV_BERN',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_BRUNEI',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[YnAEMP: MINOR_CIV_CARTHAGE]
--SELECT 'MINOR_CIV_CONSTANTINOPLE',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[many: MINOR_CIV_DUBAI]
--SELECT 'MINOR_CIV_ERITREA',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_FIJI',	'fiji_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_GAZA',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_GUERNSEY',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSE: MINOR_CIV_HAVANA]
--Firaxis Polynesia:
--SELECT 'MINOR_CIV_HAWAII',	'hawaii_leadericon.dds',	'Hawaii, United States of America',	'Hawaii',	'Hawaii',	'Kamehameha I',	'King',	'the Great',	'Firaxis'	UNION ALL
--SELECT 'MINOR_CIV_INUIT',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_ISLEOFMAN',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_JERICHO',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSL2: MINOR_CIV_JERUSALEM]
--SELECT 'MINOR_CIV_KURDISTAN',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_LAISABELA',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_LIECHTENSTEIN',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSL2: MINOR_CIV_LISBON]
--[Swiss Confederacy: MINOR_CIV_LUBECK:]
SELECT	'MINOR_CIV_LUEBECK',		'lubeck_leadericon.dds',		'Schleswig-Holstein, Federal Republic of Germany', 'Schleswig-Holstein', 'the Hanseatic League', 'Heinrich Sudermann', 'Syndic',	'',				'Nutty'					UNION ALL
--MINOR_CIV_LUXEMBOURG
--SELECT 'MINOR_CIV_MACAU',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[YnAEMP: MINOR_CIV_MADRID]
--SELECT 'MINOR_CIV_MALTA',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_MASADA',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_PUNTLAND',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_PYGMY',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_RAPANUI',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SRILANKA',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_STRASBOURG',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SWAZILAND',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSE: MINOR_CIV_TAIPEI, MoreCS: MINOR_CIV_TAIP:]
SELECT		'MINOR_CIV_TAIWAN',			'taipei_leadericon.dds',	'The Republic of China',						'Taiwan',		'Taiwan',				'Chiang Kai-shek',		'President',			'',				''						UNION ALL
--[YnAEMP: MINOR_CIV_MAYA:]
SELECT	'MINOR_CIV_TIKAL',			'maya_leadericon.dds',			'The Maya',									'the Maya',			'the Maya',				'Pacal',				'King',				'the Great',	'Firaxis'				UNION ALL
--SELECT 'MINOR_CIV_TROY',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_UR',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--[CSL2: MINOR_CIV_VATICAN_CITY:]
SELECT	'MINOR_CIV_VATICAN',		'vatican_city_leadericon.dds',	'The Vatican City State',				'the Vatican',			'the Vatican',			'Pius IX',				'Pope',	'the Blessed',				'janboruta'				UNION ALL

--"Saints Row: Steelport City-State" by Vice Virtuoso
--0d207775-a020-4e44-aebe-585807eee8cc
-----------------------------------------------------
SELECT	'MINOR_CIV_STEELPORT',		'steelport_leadericon.dds',		'Steelport, Base of the Third Street Saints', 'Steelport',		'Steelport',			'Joe Magarac',			'',					'',				'Volition'				UNION ALL

--"YnAEMP City States" by Gedemon
--b7069e24-fb9c-4393-b836-44ec5c3dea98 [BNW]
--c78ebfe1-2667-4f48-b5cc-f2db7edebcef [G+K]
--53da86d6-4a0d-4f92-a489-4d1a7fb7cd30 [vanilla]
---------------------------------
SELECT	'MINOR_CIV_AKSUM',			'aksum_leadericon.dds',			'Federal Democratic Republic of Ethiopia',	'Ethiopia',			'Ethiopia',				'Haile Selassie I',		'Emperor',			'',				'Firaxis'				UNION ALL
SELECT	'MINOR_CIV_CARTHAGE',		'carthage_leadericon.dds',		'The Tunisian Republic',					'Tunisia',			'Carthage',				'Dido',					'Queen',			'',				'Firaxis'				UNION ALL
SELECT	'MINOR_CIV_CHEYENNE',		'cheyenne_leadericon.dds',		'The Cheyenne Tribe',						'the Cheyenne',		'the Cheyenne',			'Dull Knife',			'Chief',			'',				''						UNION ALL
SELECT	'MINOR_CIV_DAKAR',			'dakar_leadericon.dds',			'The Republic of Senegal',					'Senegal',			'Senegal',				'Leopold Sedar Senghor', 'President',		'',				''						UNION ALL
SELECT	'MINOR_CIV_HARAPPA',		'harappa_leadericon.dds',		'Punjab, Islamic Republic of Pakistan',		'the Punjab Region', 'the Indus Valley',	'Bhadra',				'',					'',				''						UNION ALL
--[CSL2: MINOR_CIV_IFE]
SELECT	'MINOR_CIV_INCA',			'inca_leadericon.dds',			'The Republic of Peru',						'Peru',				'the Inca',				'Pachacuti',			'Emperor',			'',				'Firaxis'				UNION ALL
--[CSL2: MINOR_CIV_JAKARTA]
--[CSL2: MINOR_CIV_KIEV]
--[MoreCS]
SELECT	'MINOR_CIV_KINSHASA',		'kinshasa_leadericon.dds',		'The Democratic Republic of the Congo',		'Congo-Kinshasa',	'Congo-Kinshasa',		'Joseph Kabila',		'President',		'',				''						UNION ALL
--[CSL2: MINOR_CIV_LISBON]
SELECT	'MINOR_CIV_MADRID',			'madrid_leadericon.dds',		'Spain',									'Spain',			'Spain',				'Isabella I',			'Queen',			'',				'Firaxis'				UNION ALL
SELECT	'MINOR_CIV_MAYA',			'maya_leadericon.dds',			'The Maya',									'the Maya',			'the Maya',				'Pacal',				'King',				'the Great',	'Firaxis'				UNION ALL
--[CSL2: MINOR_CIV_MOGADISHU]
--[CSL2: MINOR_CIV_MARRAKECH:]
SELECT	'MINOR_CIV_RABAT',			'marrakech_leadericon.dds',		'The Kingdom of Morocco',					'Morocco',			'Morocco',				'Ahmad al-Mansur',		'Sultan',			'',				'Firaxis'				UNION ALL
--[MoreCS: MINOR_CIV_REYK]
SELECT	'MINOR_CIV_REYKJAVIK',		'reykjavik_leadericon.dds',		'Iceland',									'Iceland',			'Iceland',				'Sveinn Bjornsson',		'President',		'',				''						UNION ALL
--[CSL2: MINOR_CIV_RIGA]
SELECT	'MINOR_CIV_ROTTERDAM',		'rotterdam_leadericon.dds',		'The Netherlands',							'the Netherlands',	'the Netherlands',		'William I',			'Prince',			'',				'Firaxis'				UNION ALL
--[CSL2: MINOR_CIV_SAMARKAND]
SELECT	'MINOR_CIV_SIOUX',			'sioux_leadericon.dds',			'The Great Sioux Nation',					'the Sioux',		'the Lakota',			'Sitting Bull',			'Chief',			'',				'Firaxis'				UNION ALL
SELECT	'MINOR_CIV_ULUNDI',			'ulundi_leadericon.dds',		'KwaZulu-Natal, Republic of South Africa',	'KwaZulu-Natal',	'the Zulu Kingdom',		'Shaka',				'King',				'',				'Firaxis'				UNION ALL

--"YnAEMP City States Madeira" by Gedemon and Madeira
-----------------------------------------------------
--SELECT	'MINOR_CIV_ANSHAN',		'anshan_leadericon.dds',	'Anshan',	'Anshan',	'Anshan',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_BACTRIA',	'bactria_leadericon.dds',	'Bactria',	'Bactria',	'Bactria',	'',	'',	'',	''	UNION ALL
--[CSL2: MINOR_CIV_CAKOKIA]
--SELECT	'MINOR_CIV_CHACO',		'chaco_leadericon.dds',	'Chaco',	'Chaco',	'Chaco',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_ECBATANA',	'ecbatana_leadericon.dds',	'Ecbatana',	'Ecbatana',	'Ecbatana',	'',	'',	'',	''	UNION ALL
--[More CS: MINOR_CIV_HATT]
SELECT	'MINOR_CIV_HATUSSA',		'hattusa_leadericon.dds',		'The Republic of Turkey',					'Turkey',			'the Hittites',			'Tudhaliya IV',			'King',				'',				''						UNION ALL
--SELECT	'MINOR_CIV_MARIB',		'marib_leadericon.dds',	'Marib',	'Marib',	'Marib',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_MEROE',		'meroe_leadericon.dds',	'Meroe',	'Meroe',	'Meroe',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_NANJING',	'nanjing_leadericon.dds', "Jiangsu, People's Republic of China", 'Jiangsu Province',	'',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PETRA',		'petra_leadericon.dds',	'The Hashemite Kingdom of Jordan',	'Jordan',	'Nabatene',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_PYONGYANG',	'pyongyang_leadericon.dds',	'The Democratic People's Republic of Korea',	'North Korea',	'North Korea',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_TAGAUNG',	'tagaung_leadericon.dds',	'The Republic of the Union of Myanmar',	'Myanmar',	'Burma',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_TARTESSOS',	'tartessos_leadericon.dds',	'Tartessos',	'Tartessos',	'Tartessos',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_TEOTIHUACAN', 'teotihuacan_leadericon.dds',	'Teotihuacan',	'Teotihuacan',	'Teotihuacan',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_THANJAVUR',	'thanjavur_leadericon.dds',	'Tamil Nadu, Republic of India',	'Tamil Nadu',	'Chola Empire',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_TROY',		'troy_leadericon.dds',	'Troy',	'Troy',	'Troy',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_XIAN',		'xian_leadericon.dds', "Shaanxi, People's Republic of China", 'Shaanxi Province',	'Shaanxi',	'',	'',	'',	''	UNION ALL
--SELECT	'MINOR_CIV_ZIMBABWE',	'zimbabwe_leadericon.dds',	'Zimbabwe',	'Zimbabwe',	'Zimbabwe',	'',	'',	'',	''	UNION ALL


--SCENARIOS
--=========

--"Ancient Mediterranean City States" by
--ddb76bf3-e847-4b70-a211-6cc9435eab93
-------------------------------------
--SELECT 'MINOR_CIV_ANSHAN',	'anshan_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_APOLLONIA',	'appollonia_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_ARHEIMAR',	'arheimar_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_ARTABRIA',	'artabria_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_AQUINCUM',	'aquincum_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_ATIL',	'atil_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_BEIDHA',	'beidha_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_CHELLAH',	'chellah_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_CROCIATONUM',	'crociatonum_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_EBLA',	'ebla_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_EREBUNI',	'erebuni_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_GARAMA',	'garama_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_JERICHO',	'jericho_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_KNOSSOS',	'knossos_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_MAGETOBRIA',	'magetobria_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_MASSALIA',	'massalia_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_MEGIDDO',	'megiddo_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_MILETUS',	'miletus_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_NAMAZGA-TEPE',	'namazga_tepe_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_PHASIS',	'phasis_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SAGUNTUM',	'saguntum_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SARKEL',	'sarkel_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SCODRA',	'scodra_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SETIDAVA',	'setidava_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SEUTHOPOLIS',	'seuthopolis_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_TAPURIA',	'tapuria_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_TARTESSOS',	'tartessos_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_TELMESSOS',	'telmessos_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_TROY',	'troy_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_UR',	'ur_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL

--"Anno Domini" (G+K) by Rob (R8XFT)
--23dff3fb-cf43-4a66-892b-fb994354e90b
------------------------------------
--[includes its own version of City States Leaders]
--SELECT 'MINOR_CIV_AQUINCUM',		'aquincum_leadericon.dds',		'', '', '', 'Aelianus', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_ARHEIMAR',		'arheimar_leadericon.dds',		'', '', '', 'Angantyr', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_ARTABRIA',		'artabria_leadericon.dds',		'', '', '', 'Bile', 'Chief', '', '' UNION ALL
--SELECT 'MINOR_CIV_ATIL',			'atil_leadericon.dds',			'', '', '', 'Bagha Shad', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_BEIDHA',		'beidha_leadericon.dds',		'', '', '', 'Elthemus', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_BETHLEHEM',		'bethlehem_leadericon.dds',		'', '', '', 'Rachel', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_BYBLOS',		'byblos_leadericon.dds',		'', '', '', 'Rib Hadda', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_CHELLAH',		'chellah_leadericon.dds',		'', '', '', 'Juba', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_CROCIATONUM',	'crociatonum_leadericon.dds',	'', '', '', 'Viridovix', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_ENKOMI',		'enkomi_leadericon.dds',		'', '', '', 'Hatbi', 'Princess', '', '' UNION ALL
--SELECT 'MINOR_CIV_EPHESUS',		'ephesus_leadericon.dds',		'', '', '', 'Androklos', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_EREBUNI',		'erebuni_leadericon.dds',		'', '', '', 'Argishti', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_HYRCANIA',		'hyrcania_leadericon.dds',		'', '', '', 'Xerxes', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_JERICHO',		'jericho_leadericon.dds',		'', '', '', 'Herod', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_KYRENE',		'kyrene_leadericon.dds',		'', '', '', 'Battus', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_MAGETOBRIA',	'magetobria_leadericon.dds',	'', '', '', 'Catamantaloedis', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_MASSALIA',		'massalia_leadericon.dds',		'', '', '', 'Protis', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_MEGIDDO',		'megiddo_leadericon.dds',		'', '', '', 'Biridiya', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_MILETUS',		'miletus_leadericon.dds',		'', '', '', 'Thrasybulus', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_NAKHCHIVAN',	'nakhchivan_leadericon.dds',	'', '', '', 'Artaxias', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_NAMAZGA-TEPE',	'namazgatepe_leadericon.dds',	'', '', '', 'Narseh', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_PALMYRA',		'palmyra_leadericon.dds',		'', '', '', 'Zenobia', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_PHASIS',		'phasis_leadericon.dds',		'', '', '', 'Servilius', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_SAGUNTUM',		'saguntum_leadericon.dds',		'', '', '', 'Imilce', 'Princess', '', '' UNION ALL
--SELECT 'MINOR_CIV_SARKEL',		'sarkel_leadericon.dds',		'', '', '', 'Petronas Kamateros', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_SETIDAVA',		'setidava_leadericon.dds',		'', '', '', 'Drilgisa', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_SEUTHOPOLIS',	'seuthopolis_leadericon.dds',	'', '', '', 'Seuthes', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_SHARUHEN',		'sharuhen_leadericon.dds',		'', '', '', 'Apophis', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_STOBI',			'stobi_leadericon.dds',			'', '', '', 'Theodosius', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_TAPURIA',		'tapuria_leadericon.dds',		'', '', '', 'Zarmehr', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_TARTESSOS',		'tartessos_leadericon.dds',		'', '', '', 'Argantonio', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_TELMESSOS',		'telmessos_leadericon.dds',		'', '', '', 'Aristander', '', '', '' UNION ALL
--SELECT 'MINOR_CIV_UGARIT',		'ugarit_leadericon.dds',		'', '', '', 'Ammittamru', '', '', '' UNION ALL

--"Centauri City States" by HandyVac
--a556bb27-8ae6-4d7b-970d-30cc54170974
------------------------------------
--SELECT 'MINOR_CIV_ALPHA_PRIME',	'alpha_prime_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_CRAFTSMAN_KEEP',	'craftsman_keep_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_DATA_DECENTRAL',	'data_decentral_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_DAWN_OF_PLANET',	'dawn_of_planet_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_FREE_DRONE_CENTRAL',	'free_drone_central_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_PORT_SVENSGAARD',	'port_svensgaard_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_WHIPSAW_BASE',	'whipsaw_base_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SANCTUARY_DOME',	'sanctuary_dome_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_GUILD_HOUSE',	'guild_house_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_ATLANTISVILLE',	'atlantisville_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_CHILDHOODS_END',	'childhoods_end_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_CALYPSO_BEAT',	'calypso_beat_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_TROJAN_SOURCE',	'trojan_source_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SEALURK_CITY',	'sealurk_city_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_STEELFOUNT',	'steelfount_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_UPSILON_DEPOT',	'upsilon_depot_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL

--"Faerun Scenario" (G+K) by FramedArchitect
--fe9e9cde-f9f4-4e80-9331-6ebd49c28ca7 [BNW]
--1c764b19-c940-47ce-b993-d371a7d7814b [G+K]
--0157c620-ef58-4087-b9da-52bc9df6703e [vanilla]
--------------------------------------------
--SELECT 'MINOR_CIV_ALMOREL,		'almorel_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_ANKHAPUR',		'ankhapur_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_BELUIR',		'beluir_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_CAER_CALIDYRR',	'calidyrr_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_CHAVYONDAT',	'chavyondat_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_DHAZTANAR',		'dhaztanar_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_FLYNDAGOL',		'flyndagol_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_INNARLITH',		'innarlith_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_IRIAEBOR',		'iriaebor_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_KONIGHEIM',		'konigheim_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_KUO_TOA',		'kuo_toa_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_LANTAN',		'lantan_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_LUSKAN',		'luskan_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_MELVAUNT',		'melvaunt_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_MESSEMPRAR',	'messemprar_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_MINTAR',		'mintar_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_MULMASTER',		'mulmaster_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_MURGHYR',		'murghyr_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_NEVERWINTER',	'neverwinter_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_RAVENS_BLUFF',	'ravens_bluff_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SCORNUBEL',		'scornubel_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SHEIRTALAR',	'sheirtalar_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SILVERYMOON',	'silverymoon_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_STARMANTLE',	'starmantle_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SURKH',			'surkh_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SVIRFNEBLIN',	'svirfneblin_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_TELFLAMM',		'telflamm_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_THINDAR',		'thindar_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_WESTGATE',		'westgate_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_ZHENTIL_KEEP',	'zhentil_keep_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL

--"Red Planet" by FramedArchitect
--ed90c71d-589b-4325-bf32-f2652a17b40c
---------------------------------
--[placeholders for testing]
SELECT 'MINOR_CIV_RED_PLANET_AUSTRALIA',	'sydney_leadericon.dds',	'Australian Mine No. 1',	'Australian Mine No. 1',	'Australian Mine No. 1',	'Arthur Phillip',	'Governor',	'',	'TPangolin'	UNION ALL
SELECT 'MINOR_CIV_RED_PLANET_ASIA_UNITED',		'hanoi_leadericon.dds',		'Asia United Outpost',	'Asia United Outpost',	'Asia United Outpost',	'Ly Thai To',	'Emperor',	'the Revered',	'davey_henninger'	UNION ALL
SELECT 'MINOR_CIV_RED_PLANET_EUROPEAN_UNION',			'european_union_leadericon.dds',			'Europaische Gemeinschaft',	'Europaische Gemeinschaft',	'Europaische Gemeinschaft',	'Commission President',	'',	'',	''	UNION ALL
SELECT 'MINOR_CIV_RED_PLANET_UNITED_NATIONS',	'united_nations_leadericon.dds',			'U.N. Mars Delegation',	'U.N. Mars Delegation',	'U.N. Mars Delegation',	'Secretary-General',	'',	'',	''	UNION ALL
SELECT 'MINOR_CIV_RED_PLANET_OUTWORLD_MINING',	'steelport_leadericon.dds',	'Outworld Mining Corporation',	'Outworld Mining Corporation',	'Outworld Mining Corporation',	'Joe Magarac',	'',	'',	'Volition'	UNION ALL
SELECT 'MINOR_CIV_RED_PLANET_BRAZIL',		'rio_de_janeiro_leadericon.dds',		'Brasil em Marte',	'Brasil em Marte',	'Brasil em Marte',	'Pedro II',	'Emperor',	'',	'Firaxis'	UNION ALL
SELECT 'MINOR_CIV_RED_PLANET_INDONESIA',	'jakarta_leadericon.dds',	'Stasiun Indonesia',	'Stasiun Indonesia',	'Stasiun Indonesia',	'Gajah Mada',	'Prime Minister',	'',	'Firaxis'	UNION ALL
SELECT 'MINOR_CIV_RED_PLANET_SOUTH_AFRICA',	'cape_town_leadericon.dds',	'Nuwe Suid-Afrika',	'Nuwe Suid-Afrika',	'Nuwe Suid-Afrika',	'Jan van Riebeeck',	'Commander',	'',	'janboruta'	UNION ALL
SELECT 'MINOR_CIV_RED_PLANET_SLAVIC_ALLIANCE',		'belgrade_leadericon.dds',		'Slowianski Sojusz',	'Slowianski Sojusz',	'Slowianski Sojusz',	'Karadorde Petrovic',	'Grand Leader',	'',	'janboruta'	UNION ALL

--"Regional New World" by DelasGoodfellow
--a741a0e8-f633-4760-9e21-d2c60f814afc
-----------------------------------------
--[NACS: MINOR_CIV_INUIT "Iqualuit"]
--[YnAEMP: MINOR_CIV_CHEYENNE "Lame Deer" (Sutaio)]
--[NACS: MINOR_CIV_RAPANUI "Hanga Roa"]
----"Monte Alban"
--SELECT 'MINOR_CIV_ZAPOTEC',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--"Guapondelig" (El Dorado)
--SELECT 'MINOR_CIV_CANARIS',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--"Caral-Supe"
--SELECT 'MINOR_CIV_CARAL',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--"Bogota" [New CS Types]
--SELECT 'MINOR_CIV_MUISCA',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--"San Miguel"
--SELECT 'MINOR_CIV_GUARANI',	'_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL

--"Regional Africa" by DelasGoodfellow
--------------------------------------
--???

--"Video Game City States" by Ultrarobprime
--a22d758d-f501-455c-a560-412b3e614b75
-------------------------------------------
--SELECT 'MINOR_CIV_GOLDENROD_CITY',	'goldenrod_city_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
SELECT 'MINOR_CIV_HAPPY_HAPPY_VILLAGE',	'happy_happy_village_leadericon.dds',	'Happy Happy Village',	'Happy Happy Village',	'the Happy-Happyist Cult',	'Carpainter',	'Mr.',	'',	'Nintendo/Nutty'	UNION ALL
SELECT 'MINOR_CIV_HYRULE',			'hyrule_leadericon.dds',	'The Kingdom of Hyrule',	'Hyrule',	'the Kingdom of Hyrule',	'Zelda',	'Princess',	'',	'Nintendo/Nutty'	UNION ALL
SELECT 'MINOR_CIV_MUSHROOM_KINGDOM',	'mushroom_kingdom_leadericon.dds',	'The Mushroom Kingdom',	'the Mushroom Kingdom',	'the Mushroom Kingdom',	'Peach',	'Princess',	'',	'Nintendo/Nutty'	UNION ALL
--SELECT 'MINOR_CIV_MUTE_CITY',		'mute_city_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
SELECT 'MINOR_CIV_ORGRIMMAR',		'orgrimmar_leadericon.dds',	'Orgrimmar',	'Orgrimmar',	'the Warsong Clan',	'Garrosh Hellscream',	'Warchief',	'',	'Blizzard/Nutty'	UNION ALL
--SELECT 'MINOR_CIV_PANAU',			'panau_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_RAPTURE',			'rapture_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
--SELECT 'MINOR_CIV_SAN_ANDREAS',		'san_andreas_leadericon.dds',	'',	'',	'',	'',	'',	'',	''	UNION ALL
SELECT 'MINOR_CIV_STORMWIND',		'stormwind_leadericon.dds',	'Stormwind',	'Stormwind',	'the Kingdom of Stormwind',	'Varian Wrynn',	'King',	'the Ghost Wolf',	'Blizzard/Nutty'	UNION ALL

--"Civilizations of Warcraft - Overhaul Project" by Bamflux et al.
--790f1ef9-58ff-4a2f-bb49-b1a3f9a91b12
--"Civilizations of Warcraft - Warcraft Citystates" by Bamflux et al.
--1c81be2b-edf4-4ccf-b836-46e7d1d2a2a2


--REPLACEMENTS FOR NEW CIVS
--=========================

--"Argentina Civilization" by Leugi
--4050cf28-434b-4df9-8689-c7d0a5a54358
-----------------------------------
--[CSE: MINOR_CIV_MONTEVIDEO]

--"The Kingdom of Armenia" by JFD
--bc011e1c-e076-4f9d-9efe-3e4d1a57679d
---------------------------------
--[CSE: MINOR_CIV_TBLISI]

--"Colonialist Legacies: Australia Civilization" by TPangolin et al.
--d5306113-7b0c-4e49-b4b4-15d37157ceb8
--------------------------------------------------------------------
--[many: MINOR_CIV_DUBAI]
--[CSE: MINOR_CIV_MONTEVIDEO]
--[CSE: MINOR_CIV_HONIARA]

--"Colonialist Legacies: Canada Civilization" by TPangolin et al.
--f9507e9b-077f-4718-9389-87f7cb509ae5
-----------------------------------------------------------------
SELECT	'MINOR_CIV_NUUK',			'nuuk_leadericon.dds',			'Greenland',								'Greenland',		'Greenland',			'Kuupik Kleist',		'Prime Minister',	'',				'Nutty'					UNION ALL
--[CSE: MINOR_CIV_ST_JOHNS]

--"Gran Colombia Civilization" by Leugi
--a8278e2d-2c9c-42ea-b08f-aa09313ff929
---------------------------------------
SELECT	'MINOR_CIV_QUITO',		'quito_leadericon.dds',			'Republic of Ecuador',						'Ecuador',			'Ecuador',				'Gabriel Garcia Moreno',			'President',			'',				''				UNION ALL
SELECT	'MINOR_CIV_SAN_JUAN',	'san_juan_leadericon.dds',		'Commonwealth of Puerto Rico',						'Puerto Rico',			'Puerto Rico',				'Luis Munoz Marin',			'Governor',			'the Architect',				'E.Diaz/Nutty'				UNION ALL

--"Hungary" by LastSword
--9fbbe85b-3fad-4c64-a569-87c4da346273
---------------------------------
--SELECT	'MINOR_CIV_PRISTINA',		'pristina_leadericon.dds',			'Republic of Kosovo',						'Kosovo',			'Kosovo',				'',			'',			'',				''				UNION ALL

--"The Kingdom of Hungary" by JFD
--1fcd9459-75d6-4e44-83e5-c88e4b00b795
---------------------------------
--[More CS: MINOR_CIV_TRIPOLI]

--"Israel Civilization" by Leugi
--35e27828-cf22-4aec-b087-08169fa4e429
--------------------------------
SELECT	'MINOR_CIV_BALKH',		'balkh_leadericon.dds',			'Balkh, Islamic Republic of Afghanistan',						'Balkh',			'the Yaz',				'Zoroaster',			'',			'',				'Nutty'				UNION ALL

--"LS Civilization Set II: Kingdom of Jerusalem" by LastSword
--ccc4e2ba-83f8-4ab0-b3b3-de82f6e878ff
-------------------------------------------------------------
SELECT	'MINOR_CIV_HAIFA_AKKA',		'acre_leadericon.dds',			'Haifa, State of Israel',						'Haifa',			'Acre',				'Jezzar Pasha',			'Governor',			'the Butcher',				'F.Spilbury'				UNION ALL

--"Kongo" by Tomatekh et al.
--684ce03a-e1d4-4df9-84f8-f4543d6a435d
----------------------------
--SELECT	'MINOR_CIV_LUBA',		'luba_leadericon.dds',			'Katanga, Democratic Republic of the Congo',						'Katanga',			'Upemba',				'',			'',			'',				''				UNION ALL

--"Latvia" by Hiram
--17697195-2cc5-4ff6-984d-29f3ad206840
-------------------
SELECT	'MINOR_CIV_GASTEIZ',		'gasteiz_leadericon.dds',		'Basque Country',	'Basque Country',		'Basque Country',			'Jose Antonio Aguirre',			'President',					'',				''				UNION ALL

--"The Grand Duchy of Lithuania" by JFD
--575a3187-ced4-47de-990b-53ce965035a1
---------------------------------------
--SELECT	'MINOR_CIV_DORPAT',			'dorpat_leadericon.dds',		'Republic of Estonia',		'Estonia',		'Dorpat',			'',				'',			'',	''					UNION ALL

--"LS Civilization Set VI: Lithuania" by LastSword
--392f5317-2467-460e-ab40-9b1b600e331c
--------------------------------------------------
--SELECT	'MINOR_CIV_KITION',		'kition_leadericon.dds',			'Larnaca, Cyprus',						'Larnaca',			'',				'',			'',			'',				''				UNION ALL

--"LS Civilization Set IV: Kingdom of Nepal" by LastSword
--04760492-5523-4cee-85b3-9146f5edc34f
---------------------------------------------------------
--[CSE: MINOR_CIV_MONTEVIDEO]

--"LS Civilization Set V: Olmec Empire" by LastSword
--2b06b560-17b0-4103-9fdb-fb6c2a0fbc6e
----------------------------------------------------
--SELECT	'MINOR_CIV_SALASAR',		'salasar_leadericon.dds',			'Rajasthan, State of India',						'Rajasthan',			'',				'',			'',			'',				''				UNION ALL

--"Colonialist Legacies: Philippines Civilization" by TPangolin et al.
--2b5ad645-8094-4ed7-a488-1e49eb9277aa
----------------------------------------------------------------------
--[many: MINOR_CIV_TAIPEI]

--"Phoenicia Civ" by the Mayor of steve
--b1861c23-92a7-46ef-9180-38adee419369
---------------------------------------
--[NACSM: MINOR_CIV_ABU_DHABI]
SELECT	'MINOR_CIV_KUWAIT_CITY',	'kuwait_city_leadericon.dds',		'State of Kuwait',						'Kuwait',			'Kuwait',				'Abdullah III Al-Salim',			'Emir',			'',				''				UNION ALL
--[More CS: MINOR_CIV_MAPU:]
SELECT	'MINOR_CIV_MOZAMBIQUE',		'maputo_leadericon.dds',			'The Republic of Mozambique',			'Mozambique',	'Mozambique',			'Joaquim Chissano',		'President',		'',				'Nutty'						UNION ALL

--"Phoenician Civilization" by sukritact et al.
--c4eff830-2f6b-46d5-988e-b6ed61e7e236
-----------------------------------------------
SELECT	'MINOR_CIV_CYRENE',			'cyrene_leadericon.dds',			'Cyrenaica, Libya',						'Cyrenaica',			'Cyrene',				'Aristippus',			'',			'',				'Nutty'				UNION ALL
SELECT	'MINOR_CIV_GALATIA',		'galatia_leadericon.dds',			'Ankara, Republic of Turkey',			'Ankara',			'Galatia',				'Leonnorius',			'',			'',				'Aranor'				UNION ALL
SELECT	'MINOR_CIV_SYRACUSE',		'syracuse_leadericon.dds',			'Sicily, Italy',						'Sicily',			'Syracuse',				'Dionysius II',			'Tyrant',			'',				'R.Westall/Nutty'				UNION ALL

--"LS Civilization Set III: Phoenician Empire" by LastSword
--55a68ae4-64cc-4eec-8981-5b6ec31d6e88
-----------------------------------------------------------
SELECT	'MINOR_CIV_NAPATA',		'napata_leadericon.dds',			'Northern, Republic of the Sudan',						'Northern Sudan',			'Kush',				'Tantamani',			'King',			'',				''				UNION ALL

--"LS Civilization Set VIII: Romania Civ" by LastSword
--0474fd37-a41e-43b9-88be-81da4b112d52
------------------------------------------------------
--[CSE/More CS: MINOR_CIV_LA_PAZ]

--"The Swiss Confederacy" by JFD
--205aa32b-9ee1-4ad8-8c42-4fcde1d4f417
--------------------------------
--[NACSM: MINOR_CIV_LUEBECK:]
SELECT	'MINOR_CIV_LUBECK',			'lubeck_leadericon.dds',		'Schleswig-Holstein, Federal Republic of Germany', 'Schleswig-Holstein', 'the Hanseatic League', 'Heinrich Sudermann', 'Syndic',	'',				'Nutty'					UNION ALL
SELECT	'MINOR_CIV_THIMPHU',		'thimphu_leadericon.dds',		'The Kingdom of Bhutan',					'Bhutan',			'Bhutan',				'Jigme Khesar Wangchuck', 'King',			'',				''						UNION ALL

--"Tibetan Civilization" by Pouakai
--184ce8f0-91ef-46d1-9aa2-6f72cc492a85
-----------------------------------
SELECT	'MINOR_CIV_VARANASI',		'varanasi_leadericon.dds',	'Uttar Pradesh, State of India',				'Uttar Pradesh',			'Benares',				'Vibhuti Narayan Singh',			'King',			'',				'Nutty'				UNION ALL

--"LS Civilization Set VIII: Tibetan Empire" by LastSword
--0474fd37-a41e-43b9-88be-81da4b112d52
---------------------------------------------------------
SELECT	'MINOR_CIV_SARNARTH',		'sarnath_leadericon.dds',	'Uttar Pradesh, State of India',				'Uttar Pradesh',			'Shakya Clan',				'Siddharta Gautama',			'Prince',			'',				'Nutty'				UNION ALL

--"LS Civilization Set III: Timurid Empire" by LastSword
--55a68ae4-64cc-4eec-8981-5b6ec31d6e88
--------------------------------------------------------
SELECT 'MINOR_CIV_BASEL', 'basel_leadericon.dds', 'Basel-Stadt, The Swiss Confederation', 'Basel-Stadt', 'Basel', 'Pantalus', 'Bishop St.', '', '', UNION ALL
--[ALTERNATE]SELECT 'MINOR_CIV_BASEL', 'basel_leadericon2.dds', 'Basel-Stadt, The Swiss Confederation', 'Basel-Stadt', 'Basel', 'Felix V', 'Antipope', 'the Peaceful', '', UNION ALL

--"Tuscan Civilization" by sukritact
--b8bba8fe-c7b7-4fe1-9e21-950fd6180e98
------------------------------------
SELECT	'MINOR_CIV_MANTUA',		'mantua_leadericon.dds',		'Lombardy, Italian Republic',					'Lombardy',			'Mantua',				'Vincenzo II Gonzaga',			'Duke',			'',				'J.Sustermans/Nutty'				UNION ALL

--"Kievan Rus" [Ukraine] by Tomatekh
--fb32237f-8e78-42ac-aaff-21af31dc415a
------------------------------------
SELECT	'MINOR_CIV_MINSK',		'minsk_leadericon.dds',			'Republic of Belarus',					'Belarus',			'Belarus',				'Alexander Lukashenko',	'President',			'',				'Nutty'						UNION ALL

--"LS Civilization Set I: Hetmanate" by LastSword
--4481702e-758e-4fd3-9760-308f8efafa74
----------------------------------------------------
--[More CS/New CS Types: MINOR_CIV_TORONTO]

--"LS Civilization Set II: The Papal States" by LastSword
--ccc4e2ba-83f8-4ab0-b3b3-de82f6e878ff
---------------------------------------------------------
SELECT	'MINOR_CIV_TOUBA',		'touba_leadericon.dds',			'Diourbel, Republic of Senegal',						'Diourbel',			'Touba',				'Amadou Bamba',			'Shaikh',			'',				'Nutty'	;
