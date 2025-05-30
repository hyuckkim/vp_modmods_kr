--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================

UPDATE Buildings
SET IconAtlas = 'JFD_SOVEREIGNTY_WONDER_ATLAS', PortraitIndex = 1
WHERE Type = 'BUILDING_FORUM';

UPDATE Buildings
SET UnlocksGovernment = 1
WHERE Type IN ('BUILDING_FORUM', 'BUILDING_SISTINE_CHAPEL', 'BUILDING_HAGIA_SOPHIA', 'BUILDING_SUMMER_PALACE', 'BUILDING_HIMEJI_CASTLE');

UPDATE Language_ko_KR SET Text = Text ||'[NEWLINE][NEWLINE]신성 로마 제국 [ICON_JFD_GOVERNMENT] 정부를 수립할 수 있습니다.' WHERE Tag ='TXT_KEY_BUILDING_FORUM_HELP';
UPDATE Language_ko_KR SET Text = Text ||'[NEWLINE][NEWLINE]교황청 [ICON_JFD_GOVERNMENT] 정부를 수립할 수 있습니다.'         WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP';
UPDATE Language_ko_KR SET Text = Text ||'[NEWLINE][NEWLINE]칼리파국 [ICON_JFD_GOVERNMENT] 정부를 수립할 수 있습니다.'       WHERE Tag ='TXT_KEY_WONDER_HAGIA_SOPHIA_HELP';
UPDATE Language_ko_KR SET Text = Text ||'[NEWLINE][NEWLINE]천자국 [ICON_JFD_GOVERNMENT] 정부를 수립할 수 있습니다.'         WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP';
UPDATE Language_ko_KR SET Text = Text ||'[NEWLINE][NEWLINE]막부정 [ICON_JFD_GOVERNMENT] 정부를 수립할 수 있습니다.'         WHERE Tag ='TXT_KEY_WONDER_HIMEJI_CASTLE_HELP';

------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers
		(BuildingType, 					YieldType,					Yield)
SELECT	Type, 							'YIELD_JFD_SOVEREIGNTY',	10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_PALACE');