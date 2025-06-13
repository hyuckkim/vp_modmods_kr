
-- Resources
INSERT INTO Resources 
		(Type,						ArtDefineTag, 						Description,						 Civilopedia, 								 ResourceClassType,		TechReveal,      TechCityTrade,	  IconString, 					PortraitIndex, 	IconAtlas)
VALUES	('RESOURCE_IA_LAKE_FISH',	'ART_DEF_RESOURCE_IA_LAKE_FISH',    'TXT_KEY_RESOURCE_LAKE_FISH',	    'TXT_KEY_RESOURCE_IA_LAKE_FISH_TEXT',	    'RESOURCECLASS_BONUS', 'TECH_POTTERY',  'TECH_POTTERY',	 '[ICON_RES_IA_LAKE_FISH]',    	0, 				'IA_LAKE_ATLAS');


--Resource Yield Changes
INSERT INTO Resource_YieldChanges
		(ResourceType, YieldType, Yield)
VALUES	('RESOURCE_IA_LAKE_FISH', 'YIELD_FOOD', 1);


--Resource_Flavors
INSERT INTO Resource_Flavors
		(ResourceType, 			   FlavorType, 		Flavor)
VALUES	('RESOURCE_IA_LAKE_FISH', 'FLAVOR_GROWTH',	10);



-- IconFontTextures
INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_IA_LAKE_FISH',      	'LakeFishResIcon22');


-- IconFontMapping
INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
VALUES	('ICON_RES_IA_LAKE_FISH', 			   'ICON_FONT_TEXTURE_IA_LAKE_FISH',    	1);

--Make a new improvement so that normal work boats can't put a fishing boat improvement, 

INSERT INTO Improvements
		(Type,									Description,							Civilopedia,									ArtDefineTag,							Water,  PortraitIndex, IconAtlas)
VALUES  ('IMPROVEMENT_IA_LAKE_FISHING_BOATS',   'TXT_KEY_IMPROVEMENT_FISHING_BOATS',    'TXT_KEY_CIV5_IMPROVEMENTS_FISHINGBOATS_TEXT',  'ART_DEF_IMPROVEMENT_FISHING_BOATS',	1,		23,			   'TERRAIN_ATLAS');

--Improvement_ResourceTypes
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,					   ResourceType)
VALUES  ('IMPROVEMENT_IA_LAKE_FISHING_BOATS', 'RESOURCE_IA_LAKE_FISH');

--Improvement_ResourceType_Yields
INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType,						ResourceType,				YieldType,			Yield)
VALUES  ('IMPROVEMENT_IA_LAKE_FISHING_BOATS',  'RESOURCE_IA_LAKE_FISH',    'YIELD_PRODUCTION',  1),
		('IMPROVEMENT_IA_LAKE_FISHING_BOATS',  'RESOURCE_IA_LAKE_FISH',    'YIELD_GOLD',		1);
		
INSERT INTO Improvement_Flavors
		(ImprovementType,						FlavorType,		Flavor)
VALUES	('IMPROVEMENT_IA_LAKE_FISHING_BOATS',	'FLAVOR_GROWTH',	10),
		('IMPROVEMENT_IA_LAKE_FISHING_BOATS',	'FLAVOR_GOLD',		10);	

INSERT INTO Builds
		(Type, 						PrereqTech, ImprovementType, 						RouteType, 		Description, Help, Recommendation, Water, CanBeEmbarked,  Kill,	Time,	EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas)
SELECT 'BUILD_LAKE_FISHING_BOATS', 	PrereqTech, 'IMPROVEMENT_IA_LAKE_FISHING_BOATS', 	RouteType, 		Description, Help, Recommendation, 1, 				  1,	 0,  400,	EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas
FROM Builds WHERE Type = 'BUILD_FISHING_BOATS';

INSERT INTO Unit_Builds 
		(UnitType, 		BuildType)
VALUES	('UNIT_WORKER',	'BUILD_LAKE_FISHING_BOATS');

--Text
INSERT INTO Language_ko_KR (Tag, Text)
VALUES
('TXT_KEY_RESOURCE_LAKE_FISH', '민물고기'),
('TXT_KEY_RESOURCE_IA_LAKE_FISH_TEXT', '물고기는 고대부터 중요한 식량과 단백질 공급원이었고, 호수에서의 어업은 오늘날까지도 계속되고 있습니다. 실제로 많은 호수에서는 수요 증가로 인해 물고기가 부족하거나 너무 많은 물고기가 방류되고 있습니다.');


--=======================================================================================================================
-- IMPROVEMENT
--=======================================================================================================================
INSERT OR REPLACE INTO Improvement_TechYieldChanges
		(ImprovementType,					TechType, YieldType, Yield)
SELECT 	'IMPROVEMENT_IA_LAKE_FISHING_BOATS',TechType, YieldType, Yield
FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS';

INSERT OR REPLACE INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,			YieldType,	Yield)
SELECT	 PolicyType,	'IMPROVEMENT_IA_LAKE_FISHING_BOATS',YieldType,	Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS';

INSERT OR REPLACE INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 			YieldType, Yield)
SELECT	 BeliefType,	'IMPROVEMENT_IA_LAKE_FISHING_BOATS',YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS';

INSERT OR REPLACE INTO Building_ImprovementYieldChanges
		(BuildingType, ImprovementType, 			YieldType, Yield)
SELECT	BuildingType, 'IMPROVEMENT_IA_LAKE_FISHING_BOATS', 	YieldType, Yield
FROM Building_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_FISHING_BOATS';

INSERT OR REPLACE INTO Building_ImprovementYieldChangesGlobal
		(BuildingType, ImprovementType, 			YieldType, Yield)
SELECT	BuildingType, 'IMPROVEMENT_IA_LAKE_FISHING_BOATS', 	YieldType, Yield
FROM Building_ImprovementYieldChangesGlobal WHERE ImprovementType='IMPROVEMENT_FISHING_BOATS';
--------------------------------------------
-- SQL TRIGGERS for strong compatibility
--------------------------------------------
CREATE TRIGGER Jar_LakeFishingBoat01
AFTER INSERT ON Improvement_TechYieldChanges WHEN (NEW.ImprovementType ='IMPROVEMENT_FISHING_BOATS')
BEGIN
	INSERT OR REPLACE  INTO Improvement_TechYieldChanges
			(ImprovementType, 					TechType, YieldType, Yield)
	SELECT	'IMPROVEMENT_IA_LAKE_FISHING_BOATS', NEW.TechType, NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_LakeFishingBoat02
AFTER INSERT ON Policy_ImprovementYieldChanges WHEN (NEW.ImprovementType ='IMPROVEMENT_FISHING_BOATS')
BEGIN
	INSERT OR REPLACE  INTO Policy_ImprovementYieldChanges
			(ImprovementType, 					PolicyType, YieldType, Yield)
	SELECT	'IMPROVEMENT_IA_LAKE_FISHING_BOATS', NEW.PolicyType, NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_LakeFishingBoat03
AFTER INSERT ON Belief_ImprovementYieldChanges WHEN (NEW.ImprovementType ='IMPROVEMENT_FISHING_BOATS')
BEGIN
	INSERT OR REPLACE  INTO Belief_ImprovementYieldChanges
			(ImprovementType, 					BeliefType, YieldType, Yield)
	SELECT	'IMPROVEMENT_IA_LAKE_FISHING_BOATS', NEW.BeliefType, NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_LakeFishingBoat04
AFTER INSERT ON Building_ImprovementYieldChanges WHEN (NEW.ImprovementType ='IMPROVEMENT_FISHING_BOATS')
BEGIN
	INSERT OR REPLACE  INTO Building_ImprovementYieldChanges
			(ImprovementType, 					BuildingType, YieldType, Yield)
	SELECT	'IMPROVEMENT_IA_LAKE_FISHING_BOATS', NEW.BuildingType, NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_LakeFishingBoat05
AFTER INSERT ON Building_ImprovementYieldChangesGlobal WHEN (NEW.ImprovementType ='IMPROVEMENT_FISHING_BOATS')
BEGIN
	INSERT OR REPLACE  INTO Building_ImprovementYieldChangesGlobal
			(ImprovementType, 					BuildingType, YieldType, Yield)
	SELECT	'IMPROVEMENT_IA_LAKE_FISHING_BOATS', NEW.BuildingType, NEW.YieldType, NEW.Yield;
END;
--=======================================================================================================================
--=======================================================================================================================