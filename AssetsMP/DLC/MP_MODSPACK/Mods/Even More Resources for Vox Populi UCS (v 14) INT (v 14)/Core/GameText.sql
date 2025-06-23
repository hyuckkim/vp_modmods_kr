--==========================================================================================================================
-- 게임 텍스트
--==========================================================================================================================
-- Language_ko_KR
--------------------------------------------------------------------------------------------------------------------------
-- 정책 텍스트 업데이트
UPDATE Language_ko_KR
SET Text = REPLACE(Text, '산출량 및 [ICON_GOLDEN_AGE] 황금기 기간', '산출량, [ICON_GOLDEN_AGE] 황금기 기간, [ICON_GREAT_PEOPLE] 위인 생성, 그리고 [ICON_STRENGTH] 전투력')
WHERE Tag = 'TXT_KEY_POLICY_NAVAL_TRADITION_HELP';

-- 신앙 텍스트 업데이트
UPDATE Language_ko_KR
SET Text = REPLACE(Text, '[ICON_RES_WHEAT] 밀', '향상된 자원')
WHERE Tag = 'TXT_KEY_BELIEF_SUN_GOD';

-- 풍차
UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_LAVENDER] 라벤더: [ICON_CULTURE] 문화 +3'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL' AND ((Type = 'BUILDING_WINDMILL' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Herbalists
UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_OBSIDIAN] 흑요석: [ICON_PEACE] 신앙 +2'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HERBALIST' AND ((Type = 'BUILDING_HERBALIST' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- 공립학교
UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_PLATINUM] 백금:  [ICON_RESEARCH] 과학 +3'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PUBLIC_SCHOOL' AND ((Type = 'BUILDING_PUBLIC_SCHOOL' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- 정원
UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][ICON_RES_POPPY] 양귀비: [ICON_RESEARCH] 과학 +2'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GARDEN' AND ((Type = 'BUILDING_GARDEN' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- 대장간
UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][ICON_RES_TIN] 주석: [ICON_PRODUCTION] 생산력 +1 ,  [ICON_RESEARCH] 과학 +1[NEWLINE][ICON_RES_LEAD] 납: [ICON_PRODUCTION] 생산력 +2'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FORGE' AND ((Type = 'BUILDING_FORGE' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Workshops
UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_COCONUT] 코코넛: [ICON_PRODUCTION] 생산력 +2[NEWLINE][ICON_RES_HARDWOOD] 견목: [ICON_PRODUCTION] 생산력 +1, [ICON_GOLD] 골드 +1 '
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP' AND ((Type = 'BUILDING_WORKSHOP' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Granaries
UPDATE Language_ko_KR
SET Text = REPLACE(Text, '[ICON_RES_WHEAT] 밀: [ICON_FOOD] 식량 +1', '[ICON_RES_WHEAT] 밀: [ICON_GOLD] 골드 +1')
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GRANARY' AND ((Type = 'BUILDING_GRANARY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Grocers
UPDATE Language_ko_KR
SET Text = REPLACE(Text, '[NEWLINE][NEWLINE]도시에 송수로가 필요합니다.','[NEWLINE][ICON_RES_POTATO] 감자: [ICON_FOOD] 식량 +2, [ICON_GOLD] 골드 +1[NEWLINE][ICON_RES_PINEAPPLE] 파인애플: [ICON_GOLD] 골드 +3[NEWLINE][NEWLINE]도시에 송수로가 필요합니다.')
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER' AND ((Type = 'BUILDING_GROCER' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- 공장
UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_RUBBER] 고무: [ICON_GOLD] 골드 +3[NEWLINE][ICON_RES_SULFUR] 유황: [ICON_PRODUCTION] 생산력 +3'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FACTORY' AND ((Type = 'BUILDING_FACTORY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- 연구소
UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_ALUMINUM] 알루미늄: [ICON_RESEARCH] 과학 +4[NEWLINE][ICON_RES_URANIUM] 우라늄: [ICON_RESEARCH] 과학 +4[NEWLINE][ICON_RES_TITANIUM] 티타늄: [ICON_PRODUCTION] 생산력 +1, [ICON_RESEARCH] 과학 +3'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_LABORATORY' AND ((Type = 'BUILDING_LABORATORY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

UPDATE Language_ko_KR
SET Text = REPLACE(Text, '[ICON_RES_ALUMINUM] 알루미늄, [ICON_RES_URANIUM] 우라늄, 그리고 ', '')
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_LABORATORY' AND ((Type = 'BUILDING_LABORATORY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- 시장
UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][ICON_RES_PINEAPPLE] 파인애플: [ICON_GOLD] 골드 +2'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MARKET' AND ((Type = 'BUILDING_MARKET' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Councils
UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_MAIZE] 옥수수: [ICON_PRODUCTION] 생산력 +1'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROVE' AND ((Type = 'BUILDING_GROVE' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- 물레방아
UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_POTATO] 감자: [ICON_FOOD] 식량 +1[NEWLINE][ICON_RES_RICE] 쌀: [ICON_FOOD] 식량 +1'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WATERMILL' AND ((Type = 'BUILDING_WATERMILL' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- 우물
UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_POTATO] 감자: [ICON_FOOD] 식량 +1[NEWLINE][ICON_RES_RICE] 쌀: [ICON_FOOD] 식량 +1'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WELL' AND ((Type = 'BUILDING_WELL' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- 호환성 (커스텀 문명, 4UC, 기타 등등)
-- load order 문제로 인해 사용할 수 없습니다..
---- 트리거는 모드가 Civilization_BuildingClassOverrides보다 먼저 Language_ko_KR을 업데이트한 경우에만 작동하며, 그렇지 않으면 트리거가 작동하지 않습니다.
/*CREATE TRIGGER EvenMoreResourcesForVP_BuildingResourceYieldsText
AFTER INSERT ON Civilization_BuildingClassOverrides 
WHEN NEW.BuildingClassType
IN(
	SELECT b.BuildingClass
	FROM Buildings b, Resources r, Building_ResourceYieldChanges ryc
	WHERE r.Type IN('RESOURCE_LAVENDER', 'RESOURCE_OBSIDIAN', 'RESOURCE_PLATINUM', 'RESOURCE_POPPY', 'RESOURCE_TIN', 'RESOURCE_COCONUT', 'RESOURCE_HARDWOOD', 'RESOURCE_LEAD', 'RESOURCE_MAIZE', 'RESOURCE_PINEAPPLE', 'RESOURCE_POTATO', 'RESOURCE_RICE', 'RESOURCE_RUBBER', 'RESOURCE_SULFUR', 'RESOURCE_TITANIUM')
	AND ryc.ResourceType = r.Type
	AND b.Type = ryc.BuildingType
)
BEGIN
	-- 풍차
	UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_LAVENDER] 라벤더: [ICON_CULTURE] 문화 +3'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL' AND Type = NEW.BuildingType);

	-- Herbalists
	UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_OBSIDIAN] 흑요석: [ICON_PEACE] 신앙 +2'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HERBALIST' AND Type = NEW.BuildingType);

	--  공립학교
	UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_PLATINUM] 백금: [ICON_RESEARCH] 과학 +3'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PUBLIC_SCHOOL' AND Type = NEW.BuildingType);

	-- 정원
	UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][ICON_RES_POPPY] 양귀비: [ICON_RESEARCH] 과학 +2'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GARDEN' AND Type = NEW.BuildingType);

	-- 대장간
	UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][ICON_RES_TIN] 주석: [ICON_PRODUCTION] 생산력 +1, [ICON_RESEARCH] 과학 +1[NEWLINE][ICON_RES_LEAD] 납: [ICON_PRODUCTION] 생산력 +2'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FORGE' AND Type = NEW.BuildingType);

	-- Workshops
	UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_COCONUT] 코코넛: [ICON_PRODUCTION] 생산력 +2[NEWLINE][ICON_RES_HARDWOOD] 견목: [ICON_PRODUCTION] 생산력 +1, [ICON_GOLD] 골드 +1'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP' AND Type = NEW.BuildingType);

	-- Granaries
	UPDATE Language_ko_KR
	SET Text = REPLACE(Text, '[ICON_RES_WHEAT] 밀: [ICON_FOOD] 식량 +1', '[ICON_RES_WHEAT] 밀: [ICON_GOLD] 골드 +1')
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GRANARY' AND Type = NEW.BuildingType);

	-- Grocers
	UPDATE Language_ko_KR
	SET Text = REPLACE(Text, '[NEWLINE][NEWLINE]도시에 송수로가 필요합니다.','[NEWLINE][ICON_RES_POTATO] 감자: [ICON_FOOD] 식량 +2, [ICON_GOLD] 골드 +1[NEWLINE][ICON_RES_PINEAPPLE] 파인애플: [ICON_GOLD] 골드 +3.[NEWLINE][NEWLINE]도시에 송수로가 필요합니다.')
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER' AND Type = NEW.BuildingType);

	-- 공장
	UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_RUBBER] 고무: [ICON_GOLD] 골드 +3[NEWLINE][ICON_RES_SULFUR] 유황: [ICON_PRODUCTION] 생산력 +3'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FACTORY' AND Type = NEW.BuildingType);

	-- 연구소
	UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][ICON_RES_TITANIUM] 티타늄: [ICON_PRODUCTION] 생산력 +1, [ICON_RESEARCH] 과학 +3'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_LABORATORY' AND Type = NEW.BuildingType);

	-- 시장
	UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][ICON_RES_PINEAPPLE] 파인애플: [ICON_GOLD] 골드 +2'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MARKET' AND Type = NEW.BuildingType);

	-- Councils
	UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_MAIZE] 옥수수: [ICON_PRODUCTION] 생산력 +1'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROVE' AND Type = NEW.BuildingType);

	-- 물레방아
	UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_POTATO] 감자: [ICON_FOOD] 식량 +1[NEWLINE][ICON_RES_RICE] 쌀: [ICON_FOOD] 식량 +1'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WATERMILL' AND Type = NEW.BuildingType);

	-- 우물
	UPDATE Language_ko_KR
	SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_POTATO] 감자: [ICON_FOOD] 식량 +1[NEWLINE][ICON_RES_RICE] 쌀: [ICON_FOOD] 식량 +1'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WELL' AND Type = NEW.BuildingType);
END;*/