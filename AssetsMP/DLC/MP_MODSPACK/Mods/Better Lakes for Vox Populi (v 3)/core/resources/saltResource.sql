-- Resources
INSERT INTO Resources 
		(Type,					  ArtDefineTag,		Description,							Civilopedia, 									ResourceClassType, 	    TechReveal,          TechCityTrade,	     IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_IA_SALT_LAKE',  ArtDefineTag,	    'TXT_KEY_RESOURCE_IA_SALT_LAKE',	    'TXT_KEY_CIV5_RESOURCE_IA_SALT_LAKE_TEXT',	    'RESOURCECLASS_BONUS', 'TECH_AGRICULTURE',  'TECH_AGRICULTURE',	 '[ICON_RES_IA_SALT_LAKE]',    	1, 				'IA_LAKE_ATLAS'
FROM Resources WHERE Type='RESOURCE_SALT';


-- IconFontTextures
INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_IA_SALT_LAKE',      	'SaltResIcon22');


-- IconFontMapping
INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
VALUES	('ICON_RES_IA_SALT_LAKE', 			   'ICON_FONT_TEXTURE_IA_SALT_LAKE',    	1);


--Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_RESOURCE_IA_SALT_LAKE', 'Salt Lake'),
('TXT_KEY_CIV5_RESOURCE_IA_SALT_LAKE_TEXT', 'Salt Lakes are inland lakes with no outlets, causing them to be saline. Notable examples include The Great Salt Lake in Utah, The Dead Sea in Israel and Jordan, and Lake Retba in Senegal.'); --Add more


--Resource Yield Changes
INSERT INTO Resource_YieldChanges
		(ResourceType, YieldType, Yield)
VALUES	('RESOURCE_IA_SALT_LAKE', 'YIELD_FOOD', -1);


--Resource_Flavors
INSERT INTO Resource_Flavors
		(ResourceType, 			   FlavorType, 		Flavor)
VALUES	('RESOURCE_IA_SALT_LAKE', 'FLAVOR_GROWTH',	10);

INSERT INTO Improvements
		(Type,						Description,						Civilopedia,								Help, 									 ArtDefineTag,	Water,  PortraitIndex, IconAtlas)
SELECT	'IMPROVEMENT_IA_SALT_LAKE', 'TXT_KEY_IMPROVEMENT_IA_SALT_LAKE',	'TXT_KEY_IMPROVEMENT_IA_SALT_LAKE_TEXT',	'TXT_KEY_IMPROVEMENT_IA_SALT_LAKE_HELP', ArtDefineTag,		1,  			1, 'TERRAIN_IMPROVEMENT_ICON_ATLAS_EXP2'
FROM Improvements WHERE Type='IMPROVEMENT_MINE';

--Improvement_ResourceTypes
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,					   ResourceType)
VALUES  ('IMPROVEMENT_IA_SALT_LAKE', 'RESOURCE_IA_SALT_LAKE');

--Improvement_ResourceType_Yields
INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType,				ResourceType,				YieldType,			Yield)
VALUES	('IMPROVEMENT_IA_SALT_LAKE',	'RESOURCE_IA_SALT_LAKE',	'YIELD_FOOD',			2),
		('IMPROVEMENT_IA_SALT_LAKE',	'RESOURCE_IA_SALT_LAKE',	'YIELD_PRODUCTION',		1);
		
INSERT INTO Improvement_Flavors
		(ImprovementType,				FlavorType,		 Flavor)
VALUES	('IMPROVEMENT_IA_SALT_LAKE',	'FLAVOR_GROWTH',	 15),
		('IMPROVEMENT_IA_SALT_LAKE',	'FLAVOR_PRODUCTION', 10);	

INSERT INTO Builds
		(Type, 				PrereqTech, 			ImprovementType, 			Description,				 Help, 									 Recommendation, 			Water, CanBeEmbarked, Kill,	Time,	EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas)
SELECT 'BUILD_SALT_LAKE', 	'TECH_CONSTRUCTION', 	'IMPROVEMENT_IA_SALT_LAKE', 'TXT_KEY_BUILD_SALT_LAKE', 'TXT_KEY_IMPROVEMENT_IA_SALT_LAKE_HELP', 'TXT_KEY_BUILD_SALT_LAKE_REC', 1, 		1, 			0,	400,	EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas
FROM Builds WHERE Type = 'BUILD_BRAZILWOOD_CAMP';

INSERT INTO Unit_Builds 
		(UnitType, 		BuildType)
VALUES	('UNIT_WORKER',	'BUILD_SALT_LAKE');

INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_IMPROVEMENT_IA_SALT_LAKE', 'Salt Gatherer'),
		('TXT_KEY_IMPROVEMENT_IA_SALT_LAKE_HELP', 'Improves [ICON_RES_IA_SALT_LAKE] Lake Salt.'),
		('TXT_KEY_IMPROVEMENT_IA_SALT_LAKE_TEXT', 'Salt Gatherers gather salt from saline lakes. Historically, salt has been valuable as it is not only an essential nutrient but it also adds flavor and can be used to preserve food. Salt is often mined, but it can also be gathered from saline lakes. After it was gathered, use as a preservative was common, and as refrigeration was not available, this was often the only way to keep many food items from deteriorating.'),
		('TXT_KEY_BUILD_SALT_LAKE', 'Construct a [LINK=IMPROVEMENT_IA_SALT_LAKE]Salt Gatherer[\LINK]'),
		('TXT_KEY_BUILD_SALT_LAKE_REC', 'Improves [ICON_RES_IA_SALT_LAKE] Lake Salt.');