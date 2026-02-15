------------ zoo ----------
UPDATE Buildings
SET
	FinishLandTRTourism = 0,
	FinishSeaTRTourism = 0
WHERE BuildingClass = 'BUILDINGCLASS_THEATRE';
-- this is the zoo

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_THEATRE', 'IMPROVEMENT_CAMP', 'YIELD_CULTURE', 1);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_THEATRE';

-- Zoo
UPDATE Language_ko_KR
SET Text = '완료 시 [ICON_RESEARCH] 과학이 +500 증가합니다. 이 도시가 운영하는 야영지에서 [ICON_CULTURE] 문화 +1을 획득합니다. 근처 정글과 숲 타일은 [ICON_CULTURE] 문화와 [ICON_TOURISM] 관광이 +1 증가합니다.[NEWLINE][NEWLINE][ICON_CULTURE] 무료로 인한 [ICON_HAPPINESS_3] 불행이 -1 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_HELP';

UPDATE Language_ko_KR
SET Text = '모든 도시에 동물원을 대량 건설하면 과학이 폭발적으로 증가하여 더욱 발전된 기술을 얻을 수 있습니다. 동물원은 또한 타일에서 관광을 얻는 첫 번째 원천 중 하나입니다. 문명에 숲이 우거져 있거나 야영지 사치 자원이 많을 경우 동물원을 잠금 해제하는 것이 훨씬 더 중요합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_STRATEGY';

------------ hotel -------------

UPDATE Buildings
SET
	FinishLandTRTourism = 5,
	FinishSeaTRTourism = 5,
	LandmarksTourismPercent = 34
WHERE BuildingClass = 'BUILDINGCLASS_HOTEL';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	Type, 'FEATURE_OASIS', 'YIELD_TOURISM', 5
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL';

INSERT INTO Building_YieldPerXTerrainTimes100
	(BuildingType, TerrainType, YieldType, Yield)
SELECT
	Type, 'TERRAIN_MOUNTAIN', 'YIELD_GOLD', 100
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL';

INSERT INTO Building_YieldPerXTerrainTimes100
	(BuildingType, TerrainType, YieldType, Yield)
SELECT
	Type, 'TERRAIN_MOUNTAIN', 'YIELD_TOURISM', 100
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL';

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 	BuildingClassType)
SELECT
	Type, 'BUILDINGCLASS_EE_SALON'	
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL';

INSERT INTO Building_TerrainYieldChanges
	(BuildingType, TerrainType, YieldType, Yield)
SELECT 
	Type, 'TERRAIN_SNOW', 'YIELD_GOLD', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL' UNION ALL
SELECT 
	Type, 'TERRAIN_SNOW', 'YIELD_TOURISM', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HOTEL';

-- Hotels
UPDATE Language_ko_KR
SET Text = '도시는 작업 가능한 타일 내에 있는 눈이 내린 땅과 모든 산에 대해 [ICON_GOLD] 골드와 [ICON_TOURISM] 관광이 +1 증가합니다. 이 도시에서 생산되는 오아시스의 [ICON_TOURISM] 관광이 +5 증가합니다.[NEWLINE][NEWLINE][ICON_WONDER] 세계 불가사의와 타일에서 얻은 [ICON_CULTURE] 문화의 33%가 도시의 [ICON_TOURISM] 관광 산출량에 추가됩니다. 걸작으로 인한 [ICON_TOURISM] 관광 산출량이 25% 증가합니다.[NEWLINE][NEWLINE]여기에서 시작하여 다른 문명을 대상으로 하는 [ICON_CARAVAN]/[ICON_CARGO_SHIP] 교역로를 완료하면 [COLOR_POSITIVE_TEXT]역사적 이벤트[ENDCOLOR]가 발생하거나 기존 이벤트가 강화됩니다.'
WHERE Tag = 'TXT_KEY_BUILDING_HOTEL_HELP';

DELETE FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_MOAI' AND TechType = 'TECH_ARCHAEOLOGY' and YieldType = 'YIELD_TOURISM';


