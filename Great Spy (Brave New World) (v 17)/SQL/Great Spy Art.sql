--Atlas

INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	  Filename, 						IconsPerRow, 	 IconsPerColumn)
VALUES	('TOMATEKH_SPY_ATLAS', 				256, 		  'SpyModAtlas256.dds',				8, 				 1),
		('TOMATEKH_SPY_ATLAS', 				214, 		  'SpyModAtlas214.dds',				8, 				 1),
		('TOMATEKH_SPY_ATLAS', 				128, 		  'SpyModAtlas128.dds',				8, 				 1),
		('TOMATEKH_SPY_ATLAS', 				80, 		  'SpyModAtlas80.dds',				8, 				 1),
		('TOMATEKH_SPY_ATLAS', 				64, 		  'SpyModAtlas64.dds',				8, 				 1),
		('TOMATEKH_SPY_ATLAS', 				45, 		  'SpyModAtlas45.dds',			    8, 				 1),
		('TOMATEKH_SPY_ATLAS', 				32, 		  'SpyModAtlas32.dds',			    8, 				 1),	
		('TOMATEKH_SPY_UI_ATLAS', 			256, 		  'SpyModUIAtlas256.dds',			1, 				 1),
		('TOMATEKH_SPY_UI_ATLAS', 			214, 		  'SpyModUIAtlas214.dds',			1, 				 1),
		('TOMATEKH_SPY_UI_ATLAS', 			128, 		  'SpyModUIAtlas128.dds',			1, 				 1),
		('TOMATEKH_SPY_UI_ATLAS', 			80, 		  'SpyModUIAtlas80.dds',			1, 				 1),
		('TOMATEKH_SPY_UI_ATLAS', 			64, 		  'SpyModUIAtlas64.dds',			1, 				 1),
		('TOMATEKH_SPY_UI_ATLAS', 			52, 		  'SpyModUIAtlas52.dds',			1, 				 1),
		('TOMATEKH_SPY_UI_ATLAS', 			45, 		  'SpyModUIAtlas45.dds',			1, 				 1),
		('TOMATEKH_SPY_UI_ATLAS', 			32, 		  'SpyModUIAtlas32.dds',			1, 				 1),
		('TOMATEKH_OPERATIVE_ATLAS', 		256, 		  'Operative256.dds',				1, 				 1),
		('TOMATEKH_OPERATIVE_ATLAS', 		214, 		  'Operative214.dds',				1, 				 1),
		('TOMATEKH_OPERATIVE_ATLAS', 		128, 		  'Operative128.dds',				1, 				 1),
		('TOMATEKH_OPERATIVE_ATLAS', 		80, 		  'Operative80.dds',				1, 				 1),
		('TOMATEKH_OPERATIVE_ATLAS', 		64, 		  'Operative64.dds',				1, 				 1),
		('TOMATEKH_OPERATIVE_ATLAS', 		45, 		  'Operative45.dds',			    1, 				 1),
		('TOMATEKH_OPERATIVE_ATLAS', 		32, 		  'Operative32.dds',			    1, 				 1),	
		('TOMATEKH_SPY_ALPHA_ATLAS', 		32,			  'SpyModUnitAlphaAtlas.dds',		1, 				 1),
		('TOMATEKH_SPY_MISSION_ATLAS',	    256, 		  'SpyMissionAtlas256.dds',			8, 				 2),
		('TOMATEKH_SPY_MISSION_ATLAS',      214, 		  'SpyMissionAtlas214.dds',			8, 				 2),
		('TOMATEKH_SPY_MISSION_ATLAS',      128, 		  'SpyMissionAtlas128.dds',			8, 				 2),
		('TOMATEKH_SPY_MISSION_ATLAS', 	    80, 		  'SpyMissionAtlas80.dds',			8, 				 2),
		('TOMATEKH_SPY_MISSION_ATLAS', 	    64, 		  'SpyMissionAtlas64.dds',			8, 				 2),
		('TOMATEKH_SPY_MISSION_ATLAS', 	    45, 		  'SpyMissionAtlas45.dds',			8, 				 2),
		('TOMATEKH_SPY_MISSION_ATLAS', 	    32, 		  'SpyMissionAtlas32.dds',			8, 				 2),
		('TOMATEKH_SPY_PROMOTION_ATLAS',	256,          'SpyPromotion256.dds',			2, 				 1),
		('TOMATEKH_SPY_PROMOTION_ATLAS',	64,           'SpyPromotion64.dds',				2, 				 1),
		('TOMATEKH_SPY_PROMOTION_ATLAS',	45,           'SpyPromotion45.dds',				2, 				 1),
		('TOMATEKH_SPY_PROMOTION_ATLAS',	32,           'SpyPromotion32.dds',				2, 				 1),
		('TOMATEKH_SPY_ACTION_ATLAS', 		64, 	      'SpyModBuild64.dds',				1, 				 1),
		('TOMATEKH_SPY_ACTION_ATLAS', 		45, 	      'SpyModBuild45.dds',				1, 				 1),
		('TOMATEKH_SPY_ACTION_GOLD_ATLAS', 	64,           'SpyModBuildGold64.dds',			1, 				 1),
		('TOMATEKH_SPY_ACTION_GOLD_ATLAS', 	45,           'SpyModBuildGold45.dds',			1, 				 1);

INSERT INTO IconFontTextures 
			(IconFontTexture, 											       IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_SPY_BLUE', 			                                     'SpyFont'),
			('ICON_FONT_TEXTURE_SPY_GREY', 			                                    'SpyFont2'),
			('ICON_FONT_TEXTURE_SPY_RED', 			                                    'SpyFont3'),
			('ICON_FONT_TEXTURE_SPY_GLASS', 			                                'SpyFont4'),
			('ICON_FONT_TEXTURE_SPY_PURPLE', 			                                'SpyFont5');

INSERT INTO IconFontMapping 
			(IconName, 								     IconFontTexture,	 IconMapping)
VALUES		('ICON_SPY_FACE_BLUE',			'ICON_FONT_TEXTURE_SPY_BLUE',			   1),
			('ICON_SPY_FACE_GREY',			'ICON_FONT_TEXTURE_SPY_GREY',			   1),
			('ICON_SPY_UNEMPLOYED',			 'ICON_FONT_TEXTURE_SPY_RED',			   1),
			('ICON_SPY_GLASS',			   'ICON_FONT_TEXTURE_SPY_GLASS',			   1),
			('ICON_SPY_FACE_PURPLE',	  'ICON_FONT_TEXTURE_SPY_PURPLE',			   1);


----------------------
--INSERT INTO ArtDefine_UnitInfos(Type, DamageStates)
--  VALUES ('ART_DEF_UNIT_TOMATEKH_SPY', 1);

INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, IconAtlas, PortraitIndex)
  VALUES ('ART_DEF_UNIT_TOMATEKH_SPY', 1, 'TOMATEKH_SPY_ATLAS', 0);

INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TOMATEKH_SPY', 'ART_DEF_UNIT_MEMBER_TOMATEKH_SPY', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TOMATEKH_SPY', 0.15, 'Ninja_Japan.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_TOMATEKH_SPY', 'Idle Death BombardDefend Run', 1);

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TOMATEKH_SPY', 'Unit', 'sv_Great_Spy_Mod.dds');


INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, IconAtlas, PortraitIndex)
  VALUES ('ART_DEF_UNIT_TOMATEKH_SPY_LATE', 1, 'TOMATEKH_SPY_ATLAS', 1);

INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TOMATEKH_SPY_LATE', 'ART_DEF_UNIT_MEMBER_TOMATEKH_SPY_LATE', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TOMATEKH_SPY_LATE', 0.15, 'Ninja_Japan.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_TOMATEKH_SPY_LATE', 'Idle Death BombardDefend Run', 1);

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TOMATEKH_SPY_LATE', 'Unit', 'sv_Great_Spy_Mod.dds');





 