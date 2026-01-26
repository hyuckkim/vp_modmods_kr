-- ============================
-- Cruzob (Commando)
-- faith purchase
-- ==============================

UPDATE ArtDefine_UnitInfoMemberInfos SET 
NumMembers = (SELECT NumMembers FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MUSKETMAN' LIMIT 1) 
WHERE UnitInfoType = 'ART_DEF_UNIT_CRUZOB';

UPDATE ArtDefine_UnitMemberInfos SET 
Scale = (SELECT Scale FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MUSKETMAN' LIMIT 1) 
WHERE Type = 'ART_DEF_UNIT_MEMBER_CRUZOB';

UPDATE Units SET
MoveAfterPurchase = 1,
Combat = Combat - 1,
RequiresFaithPurchaseEnabled = 0,
ProhibitsSpread = 1
WHERE Type = 'UNIT_CD_CRUZOB';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_CRUZOB', 'PROMOTION_SHOCK_1'),
	('UNIT_CD_CRUZOB', 'PROMOTION_SHOCK_2'),
	('UNIT_CD_CRUZOB', 'PROMOTION_SHOCK_3');

UPDATE Language_en_US SET
Text = 'Requires the [ICON_CULTURE_JFD_MESOAMERICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MESOAMERICAN_SHORT_DESC}[ENDCOLOR] Cultural Group.[NEWLINE]Can be purchased with [ICON_PEACE] Faith.'
WHERE Tag = 'TXT_KEY_UNIT_CD_CRUZOB_HELP';

-- Is slightly weaker than the Commando it replaces but starts with the [COLOR_POSITIVE_TEXT]Shock I[ENDCOLOR], [COLOR_POSITIVE_TEXT]II[ENDCOLOR], and [COLOR_POSITIVE_TEXT]III[ENDCOLOR] Promotions.[NEWLINE] Can move immediately after being purchased.[NEWLINE][NEWLINE]Cruzob stationed in Cities reduce foreign Missionary and Prophet spread power by 50%.

-- =======================
-- Milpa (Agribusiness)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_MILPA_HELP', 'Requires the [ICON_CULTURE_JFD_MESOAMERICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MESOAMERICAN_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_AGRIBUSINESS_HELP';

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_CD_MILPA', 'BUILDINGCLASS_AGRIBUSINESS', 'YIELD_FOOD', 1),
	('BUILDING_CD_MILPA', 'BUILDINGCLASS_AGRIBUSINESS', 'YIELD_GOLDEN_AGE_POINTS', 1);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
SELECT
	'BUILDING_CD_MILPA', 'IMPROVEMENT_FARM', 'YIELD_CULTURE', Yield
FROM Building_ImprovementYieldChanges WHERE BuildingType = 'BUILDING_AGRIBUSINESS' AND ImprovementType = 'IMPROVEMENT_FARM' AND YieldType = 'YIELD_GOLD';

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
SELECT
	'BUILDING_CD_MILPA', 'IMPROVEMENT_FARM', 'YIELD_FAITH', Yield
FROM Building_ImprovementYieldChanges WHERE BuildingType = 'BUILDING_AGRIBUSINESS' AND ImprovementType = 'IMPROVEMENT_FARM' AND YieldType = 'YIELD_GOLD';

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
SELECT
	'BUILDING_CD_MILPA', 'IMPROVEMENT_PASTURE', 'YIELD_CULTURE', Yield
FROM Building_ImprovementYieldChanges WHERE BuildingType = 'BUILDING_AGRIBUSINESS' AND ImprovementType = 'IMPROVEMENT_PASTURE' AND YieldType = 'YIELD_GOLD';

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
SELECT
	'BUILDING_CD_MILPA', 'IMPROVEMENT_PASTURE', 'YIELD_FAITH', Yield
FROM Building_ImprovementYieldChanges WHERE BuildingType = 'BUILDING_AGRIBUSINESS' AND ImprovementType = 'IMPROVEMENT_PASTURE' AND YieldType = 'YIELD_GOLD';

UPDATE Language_en_US SET
Text = Replace(Text, '[ICON_PRODUCTION] Production and [ICON_GOLD] Gold', '[ICON_PRODUCTION] Production, [ICON_GOLD] Gold, [ICON_CULTURE] Culture, and [ICON_PEACE] Faith')
WHERE Tag = 'TXT_KEY_BUILDING_CD_MILPA_HELP';

-- we dont update this currently but if we did, kill it off
DELETE FROM Building_ResourceQuantityRequirements WHERE BuildingType = 'BUILDING_CD_MILPA';

UPDATE Building_YieldChanges SET Yield = 2 WHERE YieldType = 'YIELD_FOOD' AND BuildingType = 'BUILDING_CD_MILPA';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_MILPA', 'YIELD_SCIENCE', 2);
