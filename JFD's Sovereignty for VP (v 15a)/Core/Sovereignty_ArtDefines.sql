--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_Sounds 	
		(SoundID, 													Filename, 								LoadType)
VALUES	('SND_SOUND_JFD_GENERIC_CHOICE', 							'GenericChoice',						'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_ESTABLISHED', 					'GovernmentEstablished',				'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_RELIGIOUS_ESTABLISHED', 			'GovernmentReligiousEstablished',		'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_DICTATORSHIP_ESTABLISHED', 		'GovernmentDictatorshipEstablished',	'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_THEOCRACY_ESTABLISHED', 			'GovernmentTheocracyEstablished',		'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_CALIPHATE_ESTABLISHED', 			'GovernmentCaliphateEstablished',		'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_HOLY_ROMAN_EMPIRE_ESTABLISHED', 	'GovernmentHREEstablished',				'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_MANDATE_OF_HEAVEN_ESTABLISHED', 	'GovernmentMandateEstablished',			'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_PAPACY_ESTABLISHED', 			'GovernmentPapacyEstablished',			'DynamicResident'),
		('SND_SOUND_JFD_GOVERNMENT_SHOGUNATE_ESTABLISHED', 			'GovernmentShogunateEstablished',		'DynamicResident'),
		('SND_SOUND_JFD_ANARCHY', 									'Anarchy',								'DynamicResident'),
		('SND_SOUND_JFD_LEGISLATURE_RESET', 						'LegislatureReset',						'DynamicResident'),
		('SND_SOUND_JFD_REFORM_PASSABLE', 							'ReformPassable',						'DynamicResident'),
		('SND_SOUND_JFD_REFORM_PASSED', 							'ReformPassed',							'DynamicResident');
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_2DSounds 
		(ScriptID, 													SoundID, 													SoundType,   Looping,   DontTriggerDuplicates,	DontPlayMoreThan,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume)
VALUES	('AS2D_SOUND_JFD_GENERIC_CHOICE', 							'SND_SOUND_JFD_GENERIC_CHOICE', 							'GAME_SFX',  0,		    1,						1,					-1.0,					100, 		100),			
		('AS2D_SOUND_JFD_ANARCHY', 									'SND_SOUND_JFD_ANARCHY', 									'GAME_SFX',  0,		    1,						1,					-1.0,					75, 		75),			
		('AS2D_SOUND_JFD_GOVERNMENT_ESTABLISHED', 					'SND_SOUND_JFD_GOVERNMENT_ESTABLISHED', 					'GAME_SFX',  0,		    1,						1,					-1.0,					100, 		100),			
		('AS2D_SOUND_JFD_GOVERNMENT_RELIGIOUS_ESTABLISHED', 		'SND_SOUND_JFD_GOVERNMENT_RELIGIOUS_ESTABLISHED', 			'GAME_SFX',  0,		    1,						1,					-1.0,					100, 		100),			
		('AS2D_SOUND_JFD_GOVERNMENT_DICTATORSHIP_ESTABLISHED', 		'SND_SOUND_JFD_GOVERNMENT_DICTATORSHIP_ESTABLISHED', 		'GAME_SFX',  0,		    1,						1,					-1.0,					100, 		100),			
		('AS2D_SOUND_JFD_GOVERNMENT_CALIPHATE_ESTABLISHED', 		'SND_SOUND_JFD_GOVERNMENT_CALIPHATE_ESTABLISHED', 			'GAME_SFX',  0,		    1,						1,					-1.0,					100, 		100),			
		('AS2D_SOUND_JFD_GOVERNMENT_THEOCRACY_ESTABLISHED', 		'SND_SOUND_JFD_GOVERNMENT_THEOCRACY_ESTABLISHED', 			'GAME_SFX',  0,		    1,						1,					-1.0,					100, 		100),			
		('AS2D_SOUND_JFD_GOVERNMENT_HOLY_ROMAN_EMPIRE_ESTABLISHED', 'SND_SOUND_JFD_GOVERNMENT_HOLY_ROMAN_EMPIRE_ESTABLISHED', 	'GAME_SFX',  0,		    1,						1,					-1.0,					100, 		100),			
		('AS2D_SOUND_JFD_GOVERNMENT_MANDATE_OF_HEAVEN_ESTABLISHED', 'SND_SOUND_JFD_GOVERNMENT_MANDATE_OF_HEAVEN_ESTABLISHED', 	'GAME_SFX',  0,		    1,						1,					-1.0,					100, 		100),			
		('AS2D_SOUND_JFD_GOVERNMENT_PAPACY_ESTABLISHED', 			'SND_SOUND_JFD_GOVERNMENT_PAPACY_ESTABLISHED', 				'GAME_SFX',  0,		    1,						1,					-1.0,					100, 		100),			
		('AS2D_SOUND_JFD_GOVERNMENT_SHOGUNATE_ESTABLISHED', 		'SND_SOUND_JFD_GOVERNMENT_SHOGUNATE_ESTABLISHED', 			'GAME_SFX',  0,		    1,						1,					-1.0,					100, 		100),			
		('AS2D_SOUND_JFD_LEGISLATURE_RESET', 						'SND_SOUND_JFD_LEGISLATURE_RESET', 							'GAME_SFX',  0,		    1,						1,					-1.0,					75, 		75),			
		('AS2D_SOUND_JFD_REFORM_PASSABLE', 							'SND_SOUND_JFD_REFORM_PASSABLE', 							'GAME_SFX',  0,		    1,						1,					-1.0,					100, 		100),			
		('AS2D_SOUND_JFD_REFORM_PASSED', 							'SND_SOUND_JFD_REFORM_PASSED', 								'GAME_SFX',  0,		    1,						1,					-1.0,					100, 		100);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Colors 
		(Type, 								Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_JFD_SOVEREIGNTY', 			0.847,	0.631, 	0.070, 	1),
		('COLOR_JFD_SOVEREIGNTY_FADING', 	0.698, 	0.588, 	0.313, 	1),
        ('COLOR_JFD_ALPHA', 	        	1,		1,		1, 		0.3);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- IconFontTextures
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO IconFontTextures 
		(IconFontTexture, 											IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JFD_GOVERNMENT',						'FontIcons_JFD_Government_22'),
		('ICON_FONT_TEXTURE_JFD_GOVERNMENT_COOLDOWN',				'FontIcons_JFD_LegislatureCooldown_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_DHIMMI',					'FontIcons_JFD_FactionDhimmi_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_BOURGEOISIE',				'FontIcons_JFD_FactionBourgeoisie_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_CARDINAL',					'FontIcons_JFD_FactionCardinal_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_CARDINAL_1',				'FontIcons_JFD_FactionCardinal1_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_CARDINAL_2',				'FontIcons_JFD_FactionCardinal2_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_CARDINAL_3',				'FontIcons_JFD_FactionCardinal3_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_CARDINAL_4',				'FontIcons_JFD_FactionCardinal4_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_CARDINAL_5',				'FontIcons_JFD_FactionCardinal5_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_CITIZENS',					'FontIcons_JFD_FactionCitizens_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_CLERGY',					'FontIcons_JFD_FactionClergy_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_COMMONS',					'FontIcons_JFD_FactionCommons_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_COMMUNIST',					'FontIcons_JFD_FactionCommunist_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_CONSERVATIVE',				'FontIcons_JFD_FactionConservative_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_DAIMYO',					'FontIcons_JFD_FactionDaimyo_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_ELDERS',					'FontIcons_JFD_FactionElders_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_FASCIST',					'FontIcons_JFD_FactionFascist_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_GREEN',						'FontIcons_JFD_FactionGreen_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_HEALERS',					'FontIcons_JFD_FactionHealers_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_HOLY_SEE',					'FontIcons_JFD_FactionHolySee_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_HUMANIST',					'FontIcons_JFD_FactionHumanist_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_IMPERIALIST',				'FontIcons_JFD_FactionImperialist_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_IMPERIAL_CROWN',			'FontIcons_JFD_FactionImperialCrown_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_IMPERIAL_MANDATE',			'FontIcons_JFD_FactionImperialMandate_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_IMPERIAL_MANDATE_LOST',		'FontIcons_JFD_FactionImperialMandateLost_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_INDEPENDENT',				'FontIcons_JFD_FactionIndependent_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_INFIDELS',					'FontIcons_JFD_FactionInfidels_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_INTEGRALIST',				'FontIcons_JFD_FactionIntegralist_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_LIBERAL',					'FontIcons_JFD_FactionLiberal_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_LIBERTARIAN',				'FontIcons_JFD_FactionLibertarian_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_MESSENGERS',				'FontIcons_JFD_FactionMessengers_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_MODERATE',					'FontIcons_JFD_FactionModerate_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_NATIONAL',					'FontIcons_JFD_FactionNational_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_NOBILITY',					'FontIcons_JFD_FactionNobility_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_OLIGARCHS',					'FontIcons_JFD_FactionOligarchs_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_PACIFIST',					'FontIcons_JFD_FactionPacifist_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_PEASANTRY',					'FontIcons_JFD_FactionPeasantry_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_POPULISTS',					'FontIcons_JFD_FactionPopulists_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_PRIESTHOOD',				'FontIcons_JFD_FactionPriesthood_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_PRINCE_CAPTAIN',			'FontIcons_JFD_FactionPrinceCaptain_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_PRINCE_BISHOP',				'FontIcons_JFD_FactionPrinceBishop_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_PRINCE_ELECTOR',			'FontIcons_JFD_FactionPrinceElector_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_PRINCE_MAGRAVE',			'FontIcons_JFD_FactionPrinceMagrave_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_PRINCE_MAYOR',				'FontIcons_JFD_FactionPrinceMayor_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_PROGRESSIVE',				'FontIcons_JFD_FactionProgressive_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_RELIGIOUS',					'FontIcons_JFD_FactionReligious_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_REVOLUTIONARIES',			'FontIcons_JFD_FactionRevolutionaries_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_SOCIALIST',					'FontIcons_JFD_FactionSocialist_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_SOLDIERS',					'FontIcons_JFD_FactionSoldiers_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_THIRD_POSITIONIST',			'FontIcons_JFD_FactionThirdPositionist_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_TENNO',						'FontIcons_JFD_FactionTenno_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_TRADERS',					'FontIcons_JFD_FactionTraders_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_ULTRANATIONALIST',			'FontIcons_JFD_FactionUltranationalist_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_UMMAH',						'FontIcons_JFD_FactionUmmah_22'),
		('ICON_FONT_TEXTURE_JFD_FACTION_WARRIORS',					'FontIcons_JFD_FactionWarriors_22'),
		('ICON_FONT_TEXTURE_JFD_LEGISLATURE',						'FontIcons_JFD_Legislature_22'),
		('ICON_FONT_TEXTURE_JFD_REFORM',							'FontIcons_JFD_Reform_22'),
		('ICON_FONT_TEXTURE_JFD_REFORM_COOLDOWN',					'FontIcons_JFD_ReformCooldown_22'),
		('ICON_FONT_TEXTURE_JFD_REFORM_NEW',						'FontIcons_JFD_NewReform_22'),
		('ICON_FONT_TEXTURE_JFD_REFORM_SUPPORT',					'FontIcons_JFD_ReformSupport_22'),
		('ICON_FONT_TEXTURE_JFD_REVOLUTIONARY_SENTIMENT',			'FontIcons_JFD_RevolutionarySentiment_22'),
		('ICON_FONT_TEXTURE_JFD_SOVEREIGNTY',						'FontIcons_JFD_Sovereignty_22'),
        ('ICON_FONT_TEXTURE_JFD_CROSS',		                        'FontIcons_JFD_Cross_22'),
		('ICON_FONT_TEXTURE_JFD_IDEOLOGY',	                        'FontIcons_JFD_Ideology_22');
--------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
VALUES	('ICON_JFD_GOVERNMENT',						'ICON_FONT_TEXTURE_JFD_GOVERNMENT',						1),
		('ICON_JFD_GOVERNMENT_COOLDOWN',			'ICON_FONT_TEXTURE_JFD_GOVERNMENT_COOLDOWN',			1),
		('ICON_JFD_FACTION_BOURGEOISIE',			'ICON_FONT_TEXTURE_JFD_FACTION_BOURGEOISIE',			1),
		('ICON_JFD_FACTION_CARDINAL',				'ICON_FONT_TEXTURE_JFD_FACTION_CARDINAL',				1),
		('ICON_JFD_FACTION_CARDINAL_1',				'ICON_FONT_TEXTURE_JFD_FACTION_CARDINAL_1',				1),
		('ICON_JFD_FACTION_CARDINAL_2',				'ICON_FONT_TEXTURE_JFD_FACTION_CARDINAL_2',				1),
		('ICON_JFD_FACTION_CARDINAL_3',				'ICON_FONT_TEXTURE_JFD_FACTION_CARDINAL_3',				1),
		('ICON_JFD_FACTION_CARDINAL_4',				'ICON_FONT_TEXTURE_JFD_FACTION_CARDINAL_4',				1),
		('ICON_JFD_FACTION_CARDINAL_5',				'ICON_FONT_TEXTURE_JFD_FACTION_CARDINAL_5',				1),
		('ICON_JFD_FACTION_CITIZENS',				'ICON_FONT_TEXTURE_JFD_FACTION_CITIZENS',				1),
		('ICON_JFD_FACTION_CLERGY',					'ICON_FONT_TEXTURE_JFD_FACTION_CLERGY',					1),
		('ICON_JFD_FACTION_COMMONS',				'ICON_FONT_TEXTURE_JFD_FACTION_COMMONS',				1),
		('ICON_JFD_FACTION_COMMUNIST',				'ICON_FONT_TEXTURE_JFD_FACTION_COMMUNIST',				1),
		('ICON_JFD_FACTION_CONSERVATIVE',			'ICON_FONT_TEXTURE_JFD_FACTION_CONSERVATIVE',			1),
		('ICON_JFD_FACTION_DAIMYO',					'ICON_FONT_TEXTURE_JFD_FACTION_DAIMYO',					1),
		('ICON_JFD_FACTION_DHIMMI',					'ICON_FONT_TEXTURE_JFD_FACTION_DHIMMI',					1),
		('ICON_JFD_FACTION_ELDERS',					'ICON_FONT_TEXTURE_JFD_FACTION_ELDERS',					1),
		('ICON_JFD_FACTION_FASCIST',				'ICON_FONT_TEXTURE_JFD_FACTION_FASCIST',				1),
		('ICON_JFD_FACTION_GREEN',					'ICON_FONT_TEXTURE_JFD_FACTION_GREEN',					1),
		('ICON_JFD_FACTION_HEALERS',				'ICON_FONT_TEXTURE_JFD_FACTION_HEALERS',				1),
		('ICON_JFD_FACTION_HOLY_SEE',				'ICON_FONT_TEXTURE_JFD_FACTION_HOLY_SEE',				1),
		('ICON_JFD_FACTION_IMPERIALIST',			'ICON_FONT_TEXTURE_JFD_FACTION_IMPERIALIST',			1),
		('ICON_JFD_FACTION_IMPERIAL_CROWN',			'ICON_FONT_TEXTURE_JFD_FACTION_IMPERIAL_CROWN',			1),
		('ICON_JFD_FACTION_IMPERIAL_MANDATE',		'ICON_FONT_TEXTURE_JFD_FACTION_IMPERIAL_MANDATE',		1),
		('ICON_JFD_FACTION_IMPERIAL_MANDATE_LOST',	'ICON_FONT_TEXTURE_JFD_FACTION_IMPERIAL_MANDATE_LOST',	1),
		('ICON_JFD_FACTION_INDEPENDENT',			'ICON_FONT_TEXTURE_JFD_FACTION_INDEPENDENT',			1),
		('ICON_JFD_FACTION_INFIDELS',				'ICON_FONT_TEXTURE_JFD_FACTION_INFIDELS',				1),
		('ICON_JFD_FACTION_LIBERAL',				'ICON_FONT_TEXTURE_JFD_FACTION_LIBERAL',				1),
		('ICON_JFD_FACTION_LIBERTARIAN',			'ICON_FONT_TEXTURE_JFD_FACTION_LIBERTARIAN',			1),
		('ICON_JFD_FACTION_MESSENGERS',				'ICON_FONT_TEXTURE_JFD_FACTION_MESSENGERS',				1),
		('ICON_JFD_FACTION_MODERATE',				'ICON_FONT_TEXTURE_JFD_FACTION_MODERATE',				1),
		('ICON_JFD_FACTION_NATIONAL',				'ICON_FONT_TEXTURE_JFD_FACTION_NATIONAL',				1),
		('ICON_JFD_FACTION_NOBILITY',				'ICON_FONT_TEXTURE_JFD_FACTION_NOBILITY',				1),
		('ICON_JFD_FACTION_OLIGARCHS',				'ICON_FONT_TEXTURE_JFD_FACTION_OLIGARCHS',				1),
		('ICON_JFD_FACTION_PACIFIST',				'ICON_FONT_TEXTURE_JFD_FACTION_PACIFIST',				1),
		('ICON_JFD_FACTION_PEASANTRY',				'ICON_FONT_TEXTURE_JFD_FACTION_PEASANTRY',				1),
		('ICON_JFD_FACTION_POPULISTS',				'ICON_FONT_TEXTURE_JFD_FACTION_POPULISTS',				1),
		('ICON_JFD_FACTION_PRIESTHOOD',				'ICON_FONT_TEXTURE_JFD_FACTION_PRIESTHOOD',				1),
		('ICON_JFD_FACTION_PRINCE_CAPTAIN',			'ICON_FONT_TEXTURE_JFD_FACTION_PRINCE_CAPTAIN',			1),
		('ICON_JFD_FACTION_PRINCE_BISHOP',			'ICON_FONT_TEXTURE_JFD_FACTION_PRINCE_BISHOP',			1),
		('ICON_JFD_FACTION_PRINCE_ELECTOR',			'ICON_FONT_TEXTURE_JFD_FACTION_PRINCE_ELECTOR',			1),
		('ICON_JFD_FACTION_PRINCE_MAGRAVE',			'ICON_FONT_TEXTURE_JFD_FACTION_PRINCE_MAGRAVE',			1),
		('ICON_JFD_FACTION_PRINCE_MAYOR',			'ICON_FONT_TEXTURE_JFD_FACTION_PRINCE_MAYOR',			1),
		('ICON_JFD_FACTION_PROGRESSIVE',			'ICON_FONT_TEXTURE_JFD_FACTION_PROGRESSIVE',			1),
		('ICON_JFD_FACTION_RELIGIOUS',				'ICON_FONT_TEXTURE_JFD_FACTION_RELIGIOUS',				1),
		('ICON_JFD_FACTION_REVOLUTIONARIES',		'ICON_FONT_TEXTURE_JFD_FACTION_REVOLUTIONARIES',		1),
		('ICON_JFD_FACTION_SOCIALIST',				'ICON_FONT_TEXTURE_JFD_FACTION_SOCIALIST',				1),
		('ICON_JFD_FACTION_SOLDIERS',				'ICON_FONT_TEXTURE_JFD_FACTION_SOLDIERS',				1),
		('ICON_JFD_FACTION_TENNO',					'ICON_FONT_TEXTURE_JFD_FACTION_TENNO',					1),
		('ICON_JFD_FACTION_THIRD_POSITIONIST',		'ICON_FONT_TEXTURE_JFD_FACTION_THIRD_POSITIONIST',		1),
		('ICON_JFD_FACTION_TRADERS',				'ICON_FONT_TEXTURE_JFD_FACTION_TRADERS',				1),
		('ICON_JFD_FACTION_ULTRANATIONALIST',		'ICON_FONT_TEXTURE_JFD_FACTION_ULTRANATIONALIST',		1),
		('ICON_JFD_FACTION_UMMAH',					'ICON_FONT_TEXTURE_JFD_FACTION_UMMAH',					1),
		('ICON_JFD_FACTION_WARRIORS',				'ICON_FONT_TEXTURE_JFD_FACTION_WARRIORS',				1),
		('ICON_JFD_LEGISLATURE',					'ICON_FONT_TEXTURE_JFD_LEGISLATURE',					1),
		('ICON_JFD_LEGISLATURE',					'ICON_FONT_TEXTURE_JFD_LEGISLATURE',					1),
		('ICON_JFD_REFORM',							'ICON_FONT_TEXTURE_JFD_REFORM',							1),
		('ICON_JFD_REFORM_COOLDOWN',				'ICON_FONT_TEXTURE_JFD_REFORM_COOLDOWN',				1),
		('ICON_JFD_REFORM_NEW',						'ICON_FONT_TEXTURE_JFD_REFORM_NEW',						1),
		('ICON_JFD_REFORM_OPPOSE',					'ICON_FONT_TEXTURE_DEFAULT',							109),
		('ICON_JFD_REFORM_SUPPORT',					'ICON_FONT_TEXTURE_JFD_REFORM_SUPPORT',					1),
		('ICON_JFD_REVOLUTIONARY_SENTIMENT',		'ICON_FONT_TEXTURE_JFD_REVOLUTIONARY_SENTIMENT',		1),
		('ICON_JFD_SOVEREIGNTY',					'ICON_FONT_TEXTURE_JFD_SOVEREIGNTY',					1),
        ('ICON_CROSS',		                        'ICON_FONT_TEXTURE_JFD_CROSS',		                    1),
		('ICON_IDEOLOGY',	                        'ICON_FONT_TEXTURE_JFD_IDEOLOGY',	                    1);
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_SOVEREIGNTY_ALPHA_ATLAS',			256, 		'JFD_Sovereignty_AlphaAtlas_256.dds',			16, 			1),
		('JFD_SOVEREIGNTY_ALPHA_ATLAS',			48, 		'JFD_Sovereignty_AlphaAtlas_48.dds',			16, 			1),
		('JFD_SOVEREIGNTY_BUILDING_ATLAS',		256, 		'JFD_Sovereignty_BuildingAtlas_256.dds',		4, 				1),
		('JFD_SOVEREIGNTY_BUILDING_ATLAS',		128, 		'JFD_Sovereignty_BuildingAtlas_128.dds',		4, 				1),
		('JFD_SOVEREIGNTY_BUILDING_ATLAS',		80, 		'JFD_Sovereignty_BuildingAtlas_80.dds',			4, 				1),
		('JFD_SOVEREIGNTY_BUILDING_ATLAS',		64, 		'JFD_Sovereignty_BuildingAtlas_64.dds',			4, 				1),
		('JFD_SOVEREIGNTY_BUILDING_ATLAS',		45, 		'JFD_Sovereignty_BuildingAtlas_45.dds',			4, 				1),
		('JFD_SOVEREIGNTY_BUILDING_ATLAS',		32, 		'JFD_Sovereignty_BuildingAtlas_32.dds',			4, 				1),
		('JFD_SOVEREIGNTY_NOTIFICATION_ATLAS', 	256, 		'JFD_Sovereignty_NotificationAtlas_256.dds',	16, 			1),
		('JFD_SOVEREIGNTY_NOTIFICATION_ATLAS', 	128, 		'JFD_Sovereignty_NotificationAtlas_128.dds',	16, 			1),
		('JFD_SOVEREIGNTY_NOTIFICATION_ATLAS', 	80, 		'JFD_Sovereignty_NotificationAtlas_80.dds',		16, 			1),
		('JFD_SOVEREIGNTY_NOTIFICATION_ATLAS', 	64, 		'JFD_Sovereignty_NotificationAtlas_64.dds',		16, 			1),
		('JFD_SOVEREIGNTY_NOTIFICATION_ATLAS', 	45, 		'JFD_Sovereignty_NotificationAtlas_45.dds',		16, 			1),
		('JFD_SOVEREIGNTY_TECH_ATLAS',			256, 		'JFD_Sovereignty_TechAtlas_256.dds',			2, 				2),
		('JFD_SOVEREIGNTY_TECH_ATLAS',			214, 		'JFD_Sovereignty_TechAtlas_214.dds',			2, 				2),
		('JFD_SOVEREIGNTY_TECH_ATLAS',			128, 		'JFD_Sovereignty_TechAtlas_128.dds',			2, 				2),
		('JFD_SOVEREIGNTY_TECH_ATLAS',			80, 		'JFD_Sovereignty_TechAtlas_80.dds',				2, 				2),
		('JFD_SOVEREIGNTY_TECH_ATLAS',			64, 		'JFD_Sovereignty_TechAtlas_64.dds',				2, 				2),
		('JFD_SOVEREIGNTY_TECH_ATLAS',			45, 		'JFD_Sovereignty_TechAtlas_45.dds',				2, 				2),
		('JFD_SOVEREIGNTY_TECH_ATLAS',			32, 		'JFD_Sovereignty_TechAtlas_32.dds',				2, 				2),
		('JFD_SOVEREIGNTY_WONDER_ATLAS',		256, 		'JFD_Sovereignty_WonderAtlas_256.dds',			4, 				4),
		('JFD_SOVEREIGNTY_WONDER_ATLAS',		128, 		'JFD_Sovereignty_WonderAtlas_128.dds',			4, 				4),
		('JFD_SOVEREIGNTY_WONDER_ATLAS',		80, 		'JFD_Sovereignty_WonderAtlas_80.dds',			4, 				4),
		('JFD_SOVEREIGNTY_WONDER_ATLAS',		64, 		'JFD_Sovereignty_WonderAtlas_64.dds',			4, 				4),
		('JFD_SOVEREIGNTY_WONDER_ATLAS',		45, 		'JFD_Sovereignty_WonderAtlas_45.dds',			4, 				4),
		('JFD_SOVEREIGNTY_WONDER_ATLAS',		32, 		'JFD_Sovereignty_WonderAtlas_32.dds',			4, 				4);

--==========================================================================================================================
-- POLICY BRANCHES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------
UPDATE PolicyBranchTypes
SET IconString = '[ICON_IDEOLOGY_FREEDOM]'
WHERE Type = 'POLICY_BRANCH_FREEDOM';

UPDATE PolicyBranchTypes
SET IconString = '[ICON_IDEOLOGY_AUTOCRACY]'
WHERE Type = 'POLICY_BRANCH_AUTOCRACY';

UPDATE PolicyBranchTypes
SET IconString = '[ICON_IDEOLOGY_ORDER]'
WHERE Type = 'POLICY_BRANCH_ORDER';

UPDATE PolicyBranchTypes
SET IconString = '[ICON_IDEOLOGY_JFD_SPIRIT]'
WHERE Type = 'POLICY_BRANCH_JFD_SPIRIT';
--==========================================================================================================================
--==========================================================================================================================
