--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================

UPDATE Buildings
SET IconAtlas = 'JFD_SOVEREIGNTY_WONDER_ATLAS', PortraitIndex = 1
WHERE Type = 'BUILDING_FORUM';

UPDATE Buildings
SET UnlocksGovernment = 1
WHERE Type IN ('BUILDING_FORUM', 'BUILDING_SISTINE_CHAPEL', 'BUILDING_HAGIA_SOPHIA', 'BUILDING_SUMMER_PALACE', 'BUILDING_HIMEJI_CASTLE');

UPDATE Language_en_US SET Text = Text ||'[NEWLINE][NEWLINE]Unlocks Holy Roman Empire unique [ICON_JFD_GOVERNMENT] Government.' WHERE Tag ='TXT_KEY_BUILDING_FORUM_HELP';
UPDATE Language_en_US SET Text = Text ||'[NEWLINE][NEWLINE]Unlocks Papacy unique [ICON_JFD_GOVERNMENT] Government.'            WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP';
UPDATE Language_en_US SET Text = Text ||'[NEWLINE][NEWLINE]Unlocks Caliphate unique [ICON_JFD_GOVERNMENT] Government.'         WHERE Tag ='TXT_KEY_WONDER_HAGIA_SOPHIA_HELP';
UPDATE Language_en_US SET Text = Text ||'[NEWLINE][NEWLINE]Unlocks Mandate of Heaven unique [ICON_JFD_GOVERNMENT] Government.' WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP';
UPDATE Language_en_US SET Text = Text ||'[NEWLINE][NEWLINE]Unlocks Shogunate unique [ICON_JFD_GOVERNMENT] Government.'         WHERE Tag ='TXT_KEY_WONDER_HIMEJI_CASTLE_HELP';

------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers
		(BuildingType, 					YieldType,					Yield)
SELECT	Type, 							'YIELD_JFD_SOVEREIGNTY',	10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_PALACE');