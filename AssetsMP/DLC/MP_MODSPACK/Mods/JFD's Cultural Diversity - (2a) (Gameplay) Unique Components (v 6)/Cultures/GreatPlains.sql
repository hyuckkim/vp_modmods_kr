-- ============================
-- Indian Scout (Commando)
-- sick icon
-- ==============================
-- indian scout
INSERT INTO ArtDefine_UnitInfos
	(Type, DamageStates, Formation)
VALUES 
	('ART_DEF_UNIT_SAS_CHEETDAAKE', 1, 'UnFormed');

INSERT INTO ArtDefine_UnitInfoMemberInfos
	(UnitInfoType, UnitMemberInfoType, NumMembers)
SELECT 
	'ART_DEF_UNIT_SAS_CHEETDAAKE', 'ART_DEF_UNIT_MEMBER_UNION_RIFLEMAN', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_COMMANDO';

INSERT INTO ArtDefine_StrategicView
	(StrategicViewType, TileType, Asset)
VALUES
	('ART_DEF_UNIT_SAS_CHEETDAAKE', 'Unit', 'indianscout_sv.dds');
--=============================================================

UPDATE Units SET
Combat = 36
WHERE Type = 'UNIT_CD_INDIAN_SCOUT';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_INDIAN_SCOUT', 'PROMOTION_HOMELAND_GUARDIAN_BOOGALOO'),  -- old UA promo
	('UNIT_CD_INDIAN_SCOUT', 'PROMOTION_SCOUTING_1'),
	('UNIT_CD_INDIAN_SCOUT', 'PROMOTION_SCOUTING_2');

UPDATE UnitPromotions SET LostWithUpgrade = 1 WHERE Type = 'PROMOTION_HOMELAND_GUARDIAN_BOOGALOO';

UPDATE Language_en_US SET
Text = '+15% [ICON_STRENGTH] Combat Strength in [COLOR_POSITIVE_TEXT]Friendly Territory[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_HOMELAND_GUARDIAN_BOOGALOO_HELP';

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_INDIAN_SCOUT_HELP', 'Requires the [ICON_CULTURE_JFD_GREAT_PLAINS] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_GREAT_PLAINS_SHORT_DESC}[ENDCOLOR] Cultural Group. '
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_HELP_COMMANDO_CBP';	

-- Is stronger than the Commando that it replaces. Starts with the [COLOR_POSITIVE_TEXT]Scouting I[ENDCOLOR], and [COLOR_POSITIVE_TEXT]Scouting II[ENDCOLOR] Promotions. Fights with +15% [ICON_STRENGTH] Combat Strength in [COLOR_POSITIVE_TEXT]Friendly Territory[ENDCOLOR]. 


-- =======================
-- Sun Dance Site (Circus Maximus)
-- =======================
REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_SUN_DANCE_HELP', 'Requires the [ICON_CULTURE_JFD_GREAT_PLAINS] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_GREAT_PLAINS_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_CIRCUS_MAXIMUS_HELP';

-- All Cities generate +25% [ICON_CULTURE_LOCAL] Border Growth Points. Melee, Gun, and Recon Units born in this City start with the [COLOR_POSITIVE_TEXT]Sun Dancer[ENDCOLOR] Promotion. Completing a Public Works Project in this City starts 20 turns of "We Love the King Day".[NEWLINE][NEWLINE]

UPDATE Buildings SET
BorderGrowthRateIncreaseGlobal = 25,
FreePromotion = 'PROMOTION_CD_SUN_DANCE'
WHERE Type = 'BUILDING_CD_SUN_DANCE';

INSERT INTO UnitPromotions_BlockedPromotions
	(PromotionType, BlockedPromotionType)
VALUES
	('PROMOTION_CD_SUN_DANCE_COYOTE', 'PROMOTION_CD_SUN_DANCE'),
	('PROMOTION_CD_SUN_DANCE_EAGLE', 'PROMOTION_CD_SUN_DANCE'),
	('PROMOTION_CD_SUN_DANCE_RAVEN', 'PROMOTION_CD_SUN_DANCE'),
	('PROMOTION_CD_SUN_DANCE_BUFFALO', 'PROMOTION_CD_SUN_DANCE'),
	('PROMOTION_CD_SUN_DANCE_TURTLE', 'PROMOTION_CD_SUN_DANCE');

-- prevent multiple animals stacking

INSERT INTO Building_WLTKDFromProject
	(BuildingType, ProjectType, Turns)
VALUES
	('BUILDING_CD_SUN_DANCE', 'PROJECT_PUBLIC_WORKS', 10);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType,	BuildingClassType,	YieldType,	YieldChange)
VALUES
	('BUILDING_CD_SUN_DANCE', 'BUILDINGCLASS_CIRCUS', 'YIELD_FAITH', 3);

UPDATE Language_en_US SET
Text = Replace(Text, 'gain +2 [ICON_GOLD] Gold.', 'gain +2 [ICON_GOLD] Gold and all Circuses gain +3 [ICON_PEACE] Faith.')
WHERE Tag = 'TXT_KEY_BUILDING_CD_SUN_DANCE_HELP';

INSERT INTO Building_WLTKDYieldMod
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_SUN_DANCE', 'YIELD_FAITH', 10);

UPDATE Building_WLTKDYieldMod SET Yield = 15 WHERE BuildingType = 'BUILDING_CD_SUN_DANCE';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_SUN_DANCE', 'YIELD_CULTURE', 2),  -- has 1 already
	('BUILDING_CD_SUN_DANCE', 'YIELD_FAITH', 3);

