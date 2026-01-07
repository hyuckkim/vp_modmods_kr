-- ============================
-- Mesopotamic Levy (Rifleman)
-- food
-- ==============================
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_UC_ASSYRIAN_LEVY',	'Unit', 	'mesopotamic_sv.dds');

INSERT INTO ArtDefine_UnitInfos (Type,			DamageStates,	Formation)
VALUES		('ART_DEF_UNIT_UC_ASSYRIAN_LEVY',	1,		'UnFormed');	
					
INSERT INTO ArtDefine_UnitMemberInfos (Type,	Scale,		Model,	MaterialTypeTag,	MaterialTypeSoundOverrideTag) 
SELECT
	'ART_DEF_UNIT_MEMBER_UC_ASSYRIAN_LEVY',	Scale,	'u_slovakian_dobrovolnik.fxsxml',	'CLOTH',	'FLESH'
FROM 	ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
							
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,	UnitMemberInfoType,		NumMembers) 
SELECT
	  'ART_DEF_UNIT_UC_ASSYRIAN_LEVY', 'ART_DEF_UNIT_MEMBER_UC_ASSYRIAN_LEVY',			NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';
								  
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType,	EnableActions,		ShortMoveRadius,	ShortMoveRate,		TargetHeight,	HasShortRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat) 
VALUES	('ART_DEF_UNIT_MEMBER_UC_ASSYRIAN_LEVY',			'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge',	12,					0.3499999940395355,	8,				1,						1,						1);									
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType,			"Index",	SubIndex,	WeaponTypeTag,	WeaponTypeSoundOverrideTag) 
VALUES					  ('ART_DEF_UNIT_MEMBER_UC_ASSYRIAN_LEVY',	0,			0,			'BULLET',		'BULLET');

INSERT INTO ArtDefine_StrategicView (StrategicViewType,		TileType,	Asset) 
VALUES	('ART_DEF_UNIT_MEMBER_UC_ASSYRIAN_LEVY',		'Unit',	  'u_slovakian_dobrovolnik.dds');
--------------------------------------------------------------------------
UPDATE Units SET
Food = 1,
Cost = Cost - 100,
FaithCost = FaithCost - 75
WHERE Type = 'UNIT_CD_IRAQ_LEVY';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_IRAQ_LEVY', 'PROMOTION_CD_TRIBAL');

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_IRAQ_LEVY_HELP', 'Requires the [ICON_CULTURE_CD_CRESCENT] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MESOPOTAMIC_SHORT_DESC}[ENDCOLOR] Cultural Group.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_HELP_RIFLEMAN';				

--  Is slightly cheaper than the Rifleman that it replaces. Starts with the [COLOR_POSITIVE_TEXT]Tribal Division[ENDCOLOR] Promotion, Ignoring Terrain Costs from and doubling Healing on [COLOR_POSITIVE_TEXT]Desert[ENDCOLOR] tiles, and removing the penalty for attacking across and doubling [ICON_MOVES] Movement along [COLOR_POSITIVE_TEXT]Rivers[ENDCOLOR].[NEWLINE][NEWLINE]The [ICON_FOOD] Growth of the City is stopped while this Unit is being Trained. 

-- =======================
-- Archaeological Park (Museum)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_ARCH_PARK_HELP', 'Requires the [ICON_CULTURE_CD_CRESCENT] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MESOPOTAMIC_SHORT_DESC}[ENDCOLOR] Cultural Group.';

INSERT INTO Building_UnitCombatProductionModifiers
	(BuildingType, UnitCombatType, Modifier)
VALUES
	('BUILDING_CD_ARCH_PARK', 'UNITCOMBAT_ARCHAEOLOGIST', 50);

INSERT OR REPLACE INTO Language_en_US 
	(Tag,	Text) 
VALUES	
	('TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST',	'Archaeologists');

INSERT OR REPLACE INTO UnitCombatInfos 
	(Type,	Description) 
VALUES	
	('UNITCOMBAT_ARCHAEOLOGIST',	'TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST');

UPDATE Units SET 
CombatClass = 'UNITCOMBAT_ARCHAEOLOGIST' 
WHERE Type = 'UNIT_ARCHAEOLOGIST';

--INSERT INTO UnitPromotions_UnitCombats
--	(PromotionType, UnitCombatType)
--VALUES
--	('PROMOTION_CD_MESOPOTAMIC', 'UNITCOMBAT_ARCHAEOLOGIST');

UPDATE Buildings SET 
TrainedFreePromotion = 'PROMOTION_CD_MESOPOTAMIC'
WHERE Type = 'BUILDING_CD_ARCH_PARK';

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_CD_ARCH_PARK', 'IMPROVEMENT_LANDMARK', 'YIELD_CULTURE', 4),
	('BUILDING_CD_ARCH_PARK', 'IMPROVEMENT_LANDMARK', 'YIELD_TOURISM', 4),
	('BUILDING_CD_ARCH_PARK', 'IMPROVEMENT_LANDMARK', 'YIELD_GOLD', 4);

INSERT INTO Building_ThemingYieldBonus
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_ARCH_PARK', 'YIELD_GOLD', 4),
	('BUILDING_CD_ARCH_PARK', 'YIELD_TOURISM', 4);

INSERT INTO Building_ThemingBonuses
	(BuildingType, Description, Bonus, 
	SameEra, UniqueEras, MustBeArt, MustBeArtifact, MustBeEqualArtArtifact, 
	RequiresOwner, RequiresAnyButOwner, RequiresSamePlayer, RequiresUniquePlayers, 
	AIPriority, ConsecutiveEras)
SELECT
	'BUILDING_CD_ARCH_PARK', Description, Bonus-1, 
	SameEra, UniqueEras, MustBeArt, MustBeArtifact, MustBeEqualArtArtifact, 
	RequiresOwner, RequiresAnyButOwner, RequiresSamePlayer, RequiresUniquePlayers, 
	AIPriority, ConsecutiveEras
FROM Building_ThemingBonuses WHERE BuildingType = 'BUILDING_MUSEUM';

UPDATE Building_ThemingBonuses SET
AIPriority = AIPriority + 1,
Bonus = Bonus * 2
WHERE MustBeArtifact = 1 AND
BuildingType = 'BUILDING_CD_ARCH_PARK';

UPDATE Building_ThemingBonuses SET
AIPriority = AIPriority + 1,
Bonus = Bonus * 1.5
WHERE MustBeEqualArtArtifact = 1 AND
BuildingType = 'BUILDING_CD_ARCH_PARK';

UPDATE Building_ThemingBonuses SET
AIPriority = AIPriority + 1,
Bonus = Bonus * 2
WHERE RequiresOwner = 1 AND
BuildingType = 'BUILDING_CD_ARCH_PARK';

UPDATE Language_en_US SET
Text = Text || '[NEWLINE]Possible Theming Bonuses:
  [NEWLINE][ICON_BULLET] +10 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] [ICON_GW_ART] Great Works of Art from the [COLOR_CYAN]same Era[ENDCOLOR].
  [NEWLINE][ICON_BULLET] +20 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] [ICON_ARTIFACT] Artifacts from the [COLOR_CYAN]same Era[ENDCOLOR].
  [NEWLINE][ICON_BULLET] +12 [ICON_CULTURE] and [ICON_TOURISM] for a pair of [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] one [ICON_GW_ART] Great Work of Art and an [ICON_ARTIFACT] Artifact from the [COLOR_CYAN]same Era[ENDCOLOR].
  [NEWLINE][ICON_BULLET] +8 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] [ICON_GW_ART] Great Works of Art.
  [NEWLINE][ICON_BULLET] +16 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] [ICON_ARTIFACT] Artifacts.
  [NEWLINE]All the above can be achieved with [COLOR_POSITIVE_TEXT]Foreign[ENDCOLOR] [ICON_GREAT_WORK] Great Works for [COLOR_NEGATIVE_TEXT]half[ENDCOLOR] the value.'
WHERE Tag = 'TXT_KEY_BUILDING_CD_ARCH_PARK_HELP';

--   [NEWLINE][ICON_BULLET] +5 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Foreign[ENDCOLOR] [ICON_GW_ART] Great Works of Art from the [COLOR_CYAN]same Era[ENDCOLOR].
--  [NEWLINE][ICON_BULLET] +10 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Foreign[ENDCOLOR] [ICON_ARTIFACT] Artifacts from the [COLOR_CYAN]same Era[ENDCOLOR].
--  [NEWLINE][ICON_BULLET] +4 [ICON_CULTURE] and [ICON_TOURISM] for a pair of [COLOR_POSITIVE_TEXT]Foreign[ENDCOLOR] one [ICON_GW_ART] Great Work of Art and an [ICON_ARTIFACT] Artifact from the [COLOR_CYAN]same Era[ENDCOLOR].
--  [NEWLINE][ICON_BULLET] +4 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Foreign[ENDCOLOR] [ICON_GW_ART] Great Works of Art.
--  [NEWLINE][ICON_BULLET] +8 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Foreign[ENDCOLOR] [ICON_ARTIFACT] Artifacts.
