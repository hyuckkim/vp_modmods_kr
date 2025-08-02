--Audio

INSERT INTO Audio_Sounds 
			(SoundID, 										  Filename, 						LoadType)
VALUES		('SND_SOUND_TOMATEKH_SPY', 						'SpyTheme',		           'DynamicResident'),
			('SND_SOUND_TOMATEKH_SPY_OLD', 				 'SpyThemeOld',		           'DynamicResident'),
			('SND_SOUND_TOMATEKH_MOTHERLAND', 	    'MotherlandStatue',	               'DynamicResident');

INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 								SoundType, 			 Looping,		MinVolume, 			MaxVolume)
VALUES		('AS2D_SOUND_TOMATEKH_SPY', 		            'SND_SOUND_TOMATEKH_SPY', 		        'GAME_SFX',           	   0,              83, 		           83),
			('AS2D_SOUND_TOMATEKH_SPY_OLD', 		        'SND_SOUND_TOMATEKH_SPY_OLD', 		    'GAME_SFX',           	   0,              33, 		           33),
			('AS2D_SOUND_TOMATEKH_MOTHERLAND', 		        'SND_SOUND_TOMATEKH_MOTHERLAND', 		'GAME_MUSIC_STINGS',       0,              85, 		           85);