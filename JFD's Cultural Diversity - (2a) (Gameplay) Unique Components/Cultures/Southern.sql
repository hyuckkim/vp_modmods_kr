-- ============================
-- Stradioti (Heavy Skirmisher)
-- mercenary
-- ==============================

UPDATE ArtDefine_UnitInfoMemberInfos SET 
NumMembers = (SELECT NumMembers FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_HEAVY_SKIRMISHER' LIMIT 1) 
WHERE UnitInfoType = 'ART_DEF_UNIT_DJSH_STRADIOT';

UPDATE ArtDefine_UnitMemberInfos SET 
Scale = (SELECT Scale FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_HEAVY_SKIRMISHER' LIMIT 1) 
WHERE Type = 'ART_DEF_UNIT_MEMBER_DJSH_STRADIOT';

UPDATE Units SET
PurchaseOnly = 1,
MoveAfterPurchase = 1,
Combat = Combat + 1,
RangedCombat = RangedCombat + 2
WHERE Type = 'UNIT_CD_STRADIOTI';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_STRADIOTI', 'PROMOTION_AMBUSH_1'),
	('UNIT_CD_STRADIOTI', 'PROMOTION_AMBUSH_2'),
	('UNIT_CD_STRADIOTI', 'PROMOTION_CD_GJAKMARRJA');

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_STRADIOTI_HELP', 'Requires the [ICON_CULTURE_JFD_SOUTHERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_SOUTHERN_SHORT_DESC}[ENDCOLOR] Cultural Group.[NEWLINE]May only be purchased with [ICON_GOLD] Gold or [ICON_PEACE] Faith.';

--  Is slightly stronger than the Heavy Skirmisher that it replaces. Starts with the [COLOR_POSITIVE_TEXT]Ambush I[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Ambush II[ENDCOLOR] Promotions, increasing attack into [COLOR_POSITIVE_TEXT]Rough Terrain[ENDCOLOR]. Also starts with the [COLOR_POSITIVE_TEXT]Gjakmarrja[ENDCOLOR] Promotion, gaining [ICON_GOLD] Gold, [ICON_CULTURE] Culture, and healing 30 HP on kills.

-- =======================
-- Banco dei Cambi (Bank)
-- =======================

DELETE FROM Civilization_BuildingClassOverrides  WHERE BuildingType = 'BUILDING_VENICE_BANCOGIRO';
UPDATE Buildings SET Cost = -1 WHERE Type = 'BUILDING_VENICE_BANCOGIRO';

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_BANCO_DEI_CAMBI_HELP', 'Requires the [ICON_CULTURE_JFD_SOUTHERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_SOUTHERN_SHORT_DESC}[ENDCOLOR] Cultural Group.';

INSERT INTO Building_YieldFromProcessModifier
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_BANCO_DEI_CAMBI', 'YIELD_GOLD', 15);

INSERT INTO Building_DomainProductionModifiers
	(BuildingType, DomainType, Modifier)
VALUES
	('BUILDING_CD_BANCO_DEI_CAMBI', 'DOMAIN_SEA', 20);

INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_CD_BANCO_DEI_CAMBI', 'SPECIALIST_MERCHANT', 'YIELD_CULTURE', 1);

INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_CD_BANCO_DEI_CAMBI', 'FLAVOR_NAVAL', 20);

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_CD_BANCO_DEI_CAMBI', 'BUILDINGCLASS_HARBOR', 'YIELD_GOLD', 3),
	('BUILDING_CD_BANCO_DEI_CAMBI', 'BUILDINGCLASS_SEAPORT', 'YIELD_GOLD', 3);

INSERT INTO Building_BuildingClassLocalYieldChanges 
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	BuildingType, BuildingClassType, 'YIELD_TOURISM', 2
FROM Building_BuildingClassLocalYieldChanges WHERE BuildingType = 'BUILDING_CD_BANCO_DEI_CAMBI';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_BANCO_DEI_CAMBI', 'YIELD_GOLD', 1),
	('BUILDING_CD_BANCO_DEI_CAMBI', 'YIELD_TOURISM', 2);
