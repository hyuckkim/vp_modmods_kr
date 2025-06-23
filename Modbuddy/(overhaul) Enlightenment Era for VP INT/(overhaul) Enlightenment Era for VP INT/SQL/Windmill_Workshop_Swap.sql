---------------------------------
-- compatibility with custom civs
---------------------------------
UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = (CASE 
	WHEN BuildingClassType='BUILDINGCLASS_WINDMILL' THEN 'BUILDINGCLASS_WORKSHOP'
	WHEN BuildingClassType='BUILDINGCLASS_WORKSHOP' THEN 'BUILDINGCLASS_WINDMILL'
	ELSE BuildingClassType END);
	
UPDATE Buildings SET BuildingClass = (CASE 
	WHEN BuildingClass='BUILDINGCLASS_WINDMILL' AND Type != 'BUILDING_WINDMILL' THEN 'BUILDINGCLASS_WORKSHOP'
	WHEN BuildingClass='BUILDINGCLASS_WORKSHOP' AND Type != 'BUILDING_WORKSHOP' THEN 'BUILDINGCLASS_WINDMILL'
	ELSE BuildingClass END);

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility01 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN (NEW.BuildingClassType='BUILDINGCLASS_WINDMILL' OR NEW.BuildingClassType='BUILDINGCLASS_WORKSHOP') AND NEW.BuildingType IS NOT NULL
BEGIN
	UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = (CASE 
	WHEN NEW.BuildingClassType='BUILDINGCLASS_WINDMILL' THEN 'BUILDINGCLASS_WORKSHOP'
	WHEN NEW.BuildingClassType='BUILDINGCLASS_WORKSHOP' THEN 'BUILDINGCLASS_WINDMILL'
	ELSE NEW.BuildingClassType END) WHERE BuildingType = NEW.BuildingType;
END;

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility02 AFTER INSERT ON Buildings
WHEN NEW.BuildingClass='BUILDINGCLASS_WINDMILL'
AND NEW.Type != 'BUILDING_WINDMILL'
BEGIN
	UPDATE Buildings SET 
	BuildingClass = 'BUILDINGCLASS_WORKSHOP',
	PrereqTech = 'TECH_ARCHITECTURE',
	Cost = 600,
	GoldMaintenance = 3,
	BuildingProductionModifier = 15,
	SpecialistType = 'SPECIALIST_ENGINEER',
	SpecialistCount = 0,
	AllowsProductionTradeRoutes=0
	WHERE Type = NEW.Type;

	INSERT INTO Building_GrowthExtraYield
		(BuildingType, YieldType, Yield)
	SELECT
		NEW.Type, 'YIELD_PRODUCTION', 25;
END;

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility03 AFTER INSERT ON Buildings
WHEN NEW.BuildingClass='BUILDINGCLASS_WORKSHOP'
AND NEW.Type != 'BUILDING_WORKSHOP'
BEGIN
	UPDATE Buildings SET 
	BuildingClass = 'BUILDINGCLASS_WINDMILL',
	PrereqTech = 'TECH_MACHINERY',
	Cost = 350,
	GoldMaintenance = 2,
	BuildingProductionModifier = 0,
	SpecialistType = 'SPECIALIST_ENGINEER',
	SpecialistCount = 1,
	AllowsProductionTradeRoutes=1
	WHERE Type = NEW.Type;

	INSERT INTO Building_BuildingClassLocalYieldChanges
		(BuildingType, BuildingClassType, YieldType, YieldChange)
	SELECT
		NEW.Type, Type, 'YIELD_FOOD', 2
	FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_STABLE', 'BUILDINGCLASS_GROCER');
	
	INSERT INTO Building_ImprovementYieldChanges
		(BuildingType, ImprovementType, YieldType, Yield)
	SELECT
		NEW.Type, 'IMPROVEMENT_FARM', Type, 1
	FROM Yields WHERE Type IN ('YIELD_PRODUCTION', 'YIELD_GOLD');

	INSERT INTO Building_FeatureYieldChanges
		(BuildingType, FeatureType, YieldType, Yield)
	SELECT
		NEW.Type, 'FEATURE_FOREST', 'YIELD_PRODUCTION', 1
	WHERE New.Type != 'BUILDING_JAR_ATLOOH';

	INSERT INTO Building_FeatureYieldChanges
		(BuildingType, FeatureType, YieldType, Yield)
	SELECT
		NEW.Type, 'FEATURE_MARSH', Type, 1
	FROM Yields WHERE Type IN ('YIELD_PRODUCTION', 'YIELD_GOLD');

	INSERT INTO Building_LakePlotYieldChanges
		(BuildingType, YieldType, Yield)
	SELECT
		NEW.Type, YieldType, 1
	FROM Building_LakePlotYieldChanges WHERE BuildingType = 'BUILDING_WINDMILL';
END;

---------------------------------------------------
---------------------------------------------------
-- windmills came quite early, 9-12 centuries
UPDATE Buildings SET 
PrereqTech = 'TECH_MACHINERY',
Cost = 350,
GoldMaintenance = 2,
BuildingProductionModifier = 0,
SpecialistType = 'SPECIALIST_ENGINEER',
SpecialistCount = 1,
Help = 'TXT_KEY_BUILDING_WORKSHOP_HELP',
AllowsProductionTradeRoutes=1
WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL';

UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_FORGE' WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL');

-- presumable the class swap already happened
CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility04 AFTER INSERT ON Building_ClassesNeededInCity
WHEN NEW.BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL')
BEGIN
	UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_FORGE' WHERE BuildingType = NEW.BuildingType;
END;

-- whilst workshops refer to the renaissance in their pedia text
UPDATE Buildings SET 
PrereqTech = 'TECH_ARCHITECTURE',
Cost = 600,
GoldMaintenance = 3,
BuildingProductionModifier = 15,
SpecialistType = 'SPECIALIST_ENGINEER',
SpecialistCount = 0,
Help = 'TXT_KEY_BUILDING_WINDMILL_HELP',
AllowsProductionTradeRoutes=0
WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP';

UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_WINDMILL' WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP');

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility05 AFTER INSERT ON Building_ClassesNeededInCity
WHEN NEW.BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP')
BEGIN
	UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_WINDMILL' WHERE BuildingType = NEW.BuildingType;
END;

-- now update their effects
----------------------
-- Windmill
----------------------
UPDATE Building_BuildingClassLocalYieldChanges SET YieldChange = 2 WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL');
UPDATE Building_BuildingClassLocalYieldChanges SET BuildingClassType = 'BUILDINGCLASS_STABLE' WHERE BuildingClassType = 'BUILDINGCLASS_GRANARY' AND BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL');

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
SELECT
	a.Type, 'IMPROVEMENT_FARM', b.Type, 1
FROM Buildings a, Yields b WHERE a.BuildingClass = 'BUILDINGCLASS_WINDMILL' 
AND b.Type IN ('YIELD_PRODUCTION', 'YIELD_GOLD');

UPDATE Building_ImprovementYieldChanges SET Yield = 1 WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_STOCKYARD');

UPDATE Building_FeatureYieldChanges SET Yield = 1 WHERE BuildingType = 'BUILDING_WINDMILL';

UPDATE Building_LakePlotYieldChanges SET Yield = 1 WHERE BuildingType = 'BUILDING_WINDMILL';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	Type, 'FEATURE_FOREST', 'YIELD_PRODUCTION', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL';

--swap the help texts for modded civ to grab
UPDATE Language_ko_KR
SET Text = '도시 내 {TXT_KEY_BUILDING_STABLE}과 {TXT_KEY_BUILDING_GROCER}에서 +2 [ICON_FOOD] 식량 +2를 생산합니다. 이 도시에서 경작하는 숲에서 [ICON_PRODUCTION] 생산력 +1을 생산합니다. 농장, 습지, 호수에서 [ICON_PRODUCTION] 생산력과 [ICON_GOLD] 골드 +1을 생산합니다.[NEWLINE][NEWLINE]이 도시에서 문명 내부의 교역로를 따라 [ICON_PRODUCTION] 생산력을 이동할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_HELP';

UPDATE Language_ko_KR
SET Text = '풍차는 중세 시대의 건물로, 주변 지형(숲, 농장, 습지, 호수)에 따라 도시의 [ICON_PRODUCTION] 생산력과 [ICON_GOLD] 골드 산출량을 늘려줍니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL_STRATEGY';

UPDATE Language_ko_KR
SET Text = '도시에서 경작하는 농장에서 [ICON_PRODUCTION] 생산력과 [ICON_GOLD] 골드 +1, 초원에서 [ICON_PRODUCTION] 생산력과 [ICON_GOLD] 골드 +2를 얻습니다. 도시에서 생산하는 [ICON_FOOD] 식량의 10%가 턴 당 [ICON_GOLD] 골드로 계산됩니다.[NEWLINE][NEWLINE][ICON_RES_HORSE]말 2마리가 필요합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STOCKYARD_HELP';
----------------------
-- Workshop
----------------------
-- it was a windmill so remove these
CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility06 AFTER INSERT ON Building_BuildingClassLocalYieldChanges
WHEN NEW.BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP')
BEGIN
	DELETE FROM Building_BuildingClassLocalYieldChanges WHERE BuildingType = NEW.BuildingType;
END;

UPDATE Building_YieldChanges SET Yield = Yield + 1 WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP');
DELETE FROM Building_FeatureYieldChanges WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP');

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility07 AFTER INSERT ON Building_FeatureYieldChanges
WHEN NEW.BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP')
BEGIN
	DELETE FROM Building_FeatureYieldChanges WHERE BuildingType = NEW.BuildingType;
END;

DELETE FROM Building_YieldChangesPerPop WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP');

CREATE TRIGGER IF NOT EXISTS JarEECivCompatibility08 AFTER INSERT ON Building_YieldChangesPerPop
WHEN NEW.BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP')
BEGIN
	DELETE FROM Building_YieldChangesPerPop WHERE BuildingType = NEW.BuildingType;
END;

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_PRODUCTION', 25
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP';

-- swap the help text
UPDATE Language_ko_KR SET
Text = '이 도시에서 경작하는 숲에서 [ICON_PRODUCTION] 생산력이 +1 증가하고, 도시에 거주하는 [ICON_CITIZEN] 시민 4명 당 [ICON_PRODUCTION] 생산력이 +1 증가합니다. 이 도시의 내부 [ICON_INTERNATIONAL_TRADE] 교역로는 [ICON_PRODUCTION] 생산력 +4를 생성합니다.[NEWLINE][NEWLINE]문명 내부의 교역로를 따라 이 도시의 [ICON_PRODUCTION] 생산력을 이동할 수 있습니다.'
WHERE Tag='TXT_KEY_BUILDING_WINDMILL_HELP';

UPDATE Language_ko_KR
SET Text = Replace(Text, '이 도시에서 경작하는 숲에서 [ICON_PRODUCTION] 생산력이 +1 증가하고, 도시에 거주하는 [ICON_CITIZEN] 시민 4명 당 [ICON_PRODUCTION] 생산력이 +1 증가합니다.', '새로운 [ICON_CITIZEN] 시민이 태어난 후, 도시 [ICON_PRODUCTION] 생산력의 25%가 도시의 현재 [ICON_PRODUCTION] 생산력에 추가됩니다. 건물을 건설할 때 [ICON_PRODUCTION] 생산력이 15% 증가합니다.')
WHERE Tag ='TXT_KEY_BUILDING_WINDMILL_HELP';

UPDATE Language_ko_KR
SET Text = '작업장은 강력한 도시의 생산력을 높이고, 내부 교역로를 통해 약한 도시로 생산력을 이전하는 능력을 향상시킵니다. 또한 송수로 성장 보너스도 향상되는데, 이는 높은 생산력과 빠른 성장이 결합될 때 가장 효과적이며, 작은 도시가 시작되는 경우든, 풍부한 식량을 보유한 대규모 도시가 시작되는 경우든 마찬가지입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_STRATEGY';

