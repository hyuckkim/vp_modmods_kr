-- Observatory
-- bit dangerous to up this for e.g. Inca
--UPDATE Building_YieldPerXTerrainTimes100 SET Yield = 100 WHERE BuildingType = 'BUILDING_OBSERVATORY';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_OBSERVATORY', 'FEATURE_ATOLL', 'YIELD_SCIENCE', 2);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_OBSERVATORY', 'BUILDINGCLASS_HARBOR', 'YIELD_SCIENCE', 1),
	('BUILDING_OBSERVATORY', 'BUILDINGCLASS_HARBOR', 'YIELD_GOLDEN_AGE_POINTS', 1);

UPDATE Buildings SET
	PolicyType = NULL,  -- so have to change the policy too
	Mountain = 0,
	SpecialistCount = 1,
	ConquestProb = 80,
	TradeRouteSeaDistanceModifier = 25,
	EnhancedYieldTech = 'TECH_EE_REFRACTION'
WHERE Type = 'BUILDING_OBSERVATORY';

INSERT INTO Building_TechEnhancedYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_OBSERVATORY', 'YIELD_SCIENCE', 4);

DELETE FROM Policy_GoldenAgeGreatPersonRateModifier WHERE PolicyType = 'POLICY_SECULARISM';
INSERT INTO Policy_GoldenAgeGreatPersonRateModifier
	(PolicyType, GreatPersonType, Modifier)
SELECT
	'POLICY_SECULARISM', Type, 25
FROM GreatPersons
WHERE Specialist IS NOT NULL;

UPDATE Language_ko_KR
SET Text = Replace(Text, '[COLOR_POSITIVE_TEXT]천문대[ENDCOLOR]를 건설할 수 있습니다. ([ICON_RESEARCH] 과학 +6, 근처 산에서 [ICON_RESEARCH] 과학 +1, [ICON_VP_SCIENTIST] 과학자 슬롯 2개)', '[ICON_GOLDEN_AGE] 황금기 동안 [ICON_GREAT_PEOPLE] 위인 비율 +25%')
WHERE Tag = 'TXT_KEY_POLICY_SECULARISM_HELP';

-- Harbor
UPDATE Buildings SET
	TradeRouteSeaDistanceModifier = 25
WHERE BuildingClass = 'BUILDINGCLASS_HARBOR';

UPDATE Language_ko_KR
SET Text = Replace(Text, '[ICON_CARGO_SHIP] 해상 교역로 거리 +50%', '[ICON_CARGO_SHIP] 해상 교역로 거리 +25%')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HARBOR');

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_OBSERVATORY';

INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_OBSERVATORY', 'BUILDINGCLASS_UNIVERSITY');

-- branches off instead
--UPDATE Building_ClassesNeededInCity SET
--BuildingClassType = 'BUILDINGCLASS_OBSERVATORY'
--WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PUBLIC_SCHOOL');

INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_OBSERVATORY', 'FLAVOR_I_SEA_TRADE_ROUTE', 10),
	('BUILDING_OBSERVATORY', 'FLAVOR_NAVAL', 10),
	('BUILDING_OBSERVATORY', 'FLAVOR_RELIGION', 5);

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	Type, 'BUILDINGCLASS_OBSERVATORY', 'YIELD_FAITH', 1
FROM Buildings WHERE Cost = -1 AND FaithCost > 0;

-- strong compatibility
CREATE TRIGGER ObservatoryFaithBonus
AFTER INSERT ON Buildings WHEN NEW.FaithCost > 0 AND NEW.Cost = -1
BEGIN
	INSERT INTO Building_BuildingClassLocalYieldChanges
		(BuildingType, BuildingClassType, YieldType, YieldChange)
	SELECT
		NEW.Type, 'BUILDINGCLASS_OBSERVATORY', 'YIELD_FAITH', 1;
END;

UPDATE Language_ko_KR
SET Text = '도시는 작업 가능한 타일 내의 산 하나당 [ICON_RESEARCH] 과학 +1을 얻습니다. 도시에 의해 작동 중인 산호섬은 [ICON_RESEARCH] 과학 +2를 얻습니다. [ICON_PEACE] 신앙으로 구매해야 하는 도시 내 모든 건물에서 [ICON_PEACE] 신앙이 +1 증가합니다.[NEWLINE][NEWLINE][ICON_CARGO_SHIP] 해상 교역로의 범위가 +25% 증가합니다. 도시 내 항구는 [ICON_RESEARCH] 과학과 [ICON_GOLDEN_AGE] 황금기 점수가 +1 증가합니다.[NEWLINE][NEWLINE][COLOR_CYAN]{TXT_KEY_TECH_EE_REFRACTION}[ENDCOLOR]이 발견되면 [ICON_RESEARCH] 과학이 +4 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_HELP';

UPDATE Language_ko_KR
SET Text = '천문대는 [ICON_RESEARCH] 과학 산출량을 증가시키며, 특히 산이 많거나 산호섬에 접근할 수 있는 도시의 경우 더욱 그렇습니다. 해안 도시, 특히 해상 교역로를 운영하는 도시에도 천문대를 고려해 볼 수 있습니다. 마지막으로, 종교 문명을 운영한다면 천문학을 통해 신앙을 강화할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_STRATEGY';
