--============================================--
-- TEXTS
--============================================--			
INSERT INTO Language_ko_KR 
			(Tag,											Text) 
VALUES		('TXT_KEY_RESOURCE_TERN',						'제비갈매기 알'),
			('TXT_KEY_RESOURCE_TERN_TEXT',					'TODO'),
			('TXT_KEY_RESOURCE_TERN_MONOPOLY',				'[ICON_WONDER] 아후 통가리키가 부여합니다. [COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] 문명에 [ICON_PEACE] 신앙 +5%'),
			--('TXT_KEY_RESOURCE_TERN_MONOPOLY_FULL',		'1 copy is granted by Ahu Tongariki [ICON_WONDER] World Wonder.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +5% [ICON_PEACE] Faith in all owned Cities.'),
			('TXT_KEY_RESOURCE_SYLVITE',					'실바이트'),
			('TXT_KEY_RESOURCE_SYLVITE_TEXT',				'TODO'),
			('TXT_KEY_RESOURCE_SYLVITE_MONOPOLY',			'달롤이 부여합니다. [COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] [COLOR_WATER_TEXT]폭발성 혼합물[ENDCOLOR]/[COLOR_YIELD_GOLD]공성 유닛[ENDCOLOR]'),
			--('TXT_KEY_RESOURCE_SYLVITE_MONOPOLY_FULL',	'1 copy is granted by Dallol Natural Wonder.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] Promotion [COLOR_POSITIVE_TEXT]Explosive Mixture[ENDCOLOR] for owned [COLOR:255:230:85:255]Siege[ENDCOLOR] units (tied to dummy building).'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH',				'열대어'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH_TEXT',			'TODO'),
			('TXT_KEY_RESOURCE_TROPICAL_FISH_MONOPOLY',		'그레이트배리어리프와 갈라파고스 자연경관에 의해 생성될 수 있습니다.'),
			('TXT_KEY_RESOURCE_TORTOISE',					'거대 거북'),
			('TXT_KEY_RESOURCE_TORTOISE_TEXT',				'TODO'),
			('TXT_KEY_RESOURCE_TORTOISE_MONOPOLY',			'갈라파고스에서 생성됩니다. [COLOR_POSITIVE_TEXT]독점 보너스:[ENDCOLOR] [ICON_GOLDEN_AGE] 황금기 기간 +10%');
			--('TXT_KEY_RESOURCE_TORTOISE_MONOPOLY_FULL',	'Can be spawned by Galapagos Natural Wonder.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +10% [ICON_GOLDEN_AGE] Golden Age Length.');

UPDATE Language_ko_KR SET Text = Text||'[NEWLINE][NEWLINE][ICON_RES_TORTOISE] 거대 거북: [ICON_RESEARCH] 과학 +2' WHERE Tag = 'TXT_KEY_BUILDING_LABORATORY_HELP';