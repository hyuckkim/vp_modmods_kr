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
INSERT INTO Language_ko_KR (Tag, Text)
VALUES
('TXT_KEY_RESOURCE_IA_SALT_LAKE', '염호'),
('TXT_KEY_CIV5_RESOURCE_IA_SALT_LAKE_TEXT', '염호는 배출구가 없는 내륙 호수로 염분이 있습니다. 예시로는 유타의 그레이트솔트호, 이스라엘과 요르단의 사해, 세네갈의 레트바 호수가 있습니다.'); --Add more


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

INSERT INTO Language_ko_KR (Tag, Text)
VALUES	('TXT_KEY_IMPROVEMENT_IA_SALT_LAKE', '염전'),
		('TXT_KEY_IMPROVEMENT_IA_SALT_LAKE_HELP', '[ICON_RES_IA_SALT_LAKE] 염호를 개선합니다.'),
		('TXT_KEY_IMPROVEMENT_IA_SALT_LAKE_TEXT', '염전은 염호에서 소금을 채취합니다. 역사적으로 소금은 필수 영양소일 뿐만 아니라 풍미를 더하고 식품을 보존하는 데에도 사용되어 귀중한 가치를 지녔습니다. 소금은 채굴되는 경우가 많지만, 염호에서도 채취할 수 있습니다. 채취한 후에는 방부제로 사용하는 것이 일반적이었고, 냉장 보관이 어려웠기 때문에 많은 식품의 변질을 막는 유일한 방법이었습니다.'),
		('TXT_KEY_BUILD_SALT_LAKE', '[LINK=IMPROVEMENT_IA_SALT_LAKE]염전[\LINK] 건설'),
		('TXT_KEY_BUILD_SALT_LAKE_REC', '[ICON_RES_IA_SALT_LAKE] 염호를 개선합니다.');