-- Polynesia and Shoshone swap
UPDATE Traits
SET
	CombatBonusImprovement = 'IMPROVEMENT_MOAI',
	NearbyImprovementBonusRange = 2,
	NearbyImprovementCombatBonus = 20
WHERE Type = 'TRAIT_WAYFINDING';

UPDATE Traits
SET
	CombatBonusImprovement = NULL,
	NearbyImprovementBonusRange = 0,
	NearbyImprovementCombatBonus = 0
WHERE Type = 'TRAIT_GREAT_EXPANSE';

INSERT INTO Trait_FreePromotionUnitCombats
	(TraitType, UnitCombatType, PromotionType)
SELECT
	'TRAIT_GREAT_EXPANSE', Type, 'PROMOTION_HOMELAND_GUARDIAN_BOOGALOO'
FROM UnitCombatInfos
WHERE IsMilitary = 1 AND IsNaval = 0 AND IsAerial = 0;

UPDATE UnitPromotions
SET
	FriendlyLandsModifier = 20,
	OrderPriority = 793
WHERE Type = 'PROMOTION_HOMELAND_GUARDIAN_BOOGALOO';

UPDATE Language_en_US
SET Text = '+20% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Inside Friendly Territory[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_HOMELAND_GUARDIAN_BOOGALOO_HELP';

-- Maori Warrior = Longswordsman
UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_LONGSWORDSMAN' WHERE UnitType = 'UNIT_POLYNESIAN_MAORI_WARRIOR';

UPDATE Units
SET
	Class = 'UNITCLASS_LONGSWORDSMAN',
	CombatClass = (SELECT CombatClass FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN'),
	DefaultUnitAI = (SELECT DefaultUnitAI FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN'),
	PrereqTech = (SELECT PrereqTech FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN'),
	ObsoleteTech = (
		SELECT ObsoleteTech FROM Units WHERE Type = (
			SELECT DefaultUnit FROM UnitClasses WHERE Type = (
				SELECT UnitClassType FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LONGSWORDSMAN'
			)
		)
	),
	Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN') + 1,
	Cost = 140,
	FaithCost = 280,
	Moves = 2,
	BaseSightRange = 2,
	GoodyHutUpgradeUnitClass = NULL
WHERE Type = 'UNIT_POLYNESIAN_MAORI_WARRIOR';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_TERCIO'
WHERE UnitType = 'UNIT_POLYNESIAN_MAORI_WARRIOR';

DELETE FROM Unit_FreePromotions
WHERE UnitType = 'UNIT_POLYNESIAN_MAORI_WARRIOR'
AND PromotionType IN ('PROMOTION_IGNORE_TERRAIN_COST', 'PROMOTION_RECON_EXPERIENCE', 'PROMOTION_AMPHIBIOUS');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_POLYNESIAN_MAORI_WARRIOR', 'PROMOTION_FIELD_WORKS_0');

INSERT INTO Unit_BuildingClassPurchaseRequireds
	(UnitType, BuildingClassType)
VALUES
	('UNIT_POLYNESIAN_MAORI_WARRIOR', 'BUILDINGCLASS_BARRACKS');

DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_POLYNESIAN_MAORI_WARRIOR';
INSERT INTO Unit_AITypes
	(UnitType, UnitAIType)
SELECT
	'UNIT_POLYNESIAN_MAORI_WARRIOR', UnitAIType
FROM Unit_AITypes
WHERE UnitType = 'UNIT_LONGSWORDSMAN';

DELETE FROM Unit_Flavors WHERE UnitType = 'UNIT_POLYNESIAN_MAORI_WARRIOR';
INSERT INTO Unit_Flavors
	(UnitType, FlavorType, Flavor)
SELECT
	'UNIT_POLYNESIAN_MAORI_WARRIOR', FlavorType, Flavor + 1
FROM Unit_Flavors
WHERE UnitType = 'UNIT_LONGSWORDSMAN';

DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_POLYNESIAN_MAORI_WARRIOR';
INSERT INTO ArtDefine_UnitInfoMemberInfos
	(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES
	('ART_DEF_UNIT_U_POLYNESIAN_MAORI_WARRIOR', 'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_MAORI_WARRIOR', 10);

UPDATE UnitPromotions SET NearbyEnemyCombatMod = -20, EmbarkFlatCost = 1, DisembarkFlatCost = 1 WHERE Type = 'PROMOTION_HAKA_WAR_DANCE';

-- Text
UPDATE Language_en_US
SET Text = '+2 [ICON_VP_VISION] Sight when Embarked, can always Embark and move over Oceans. +2 [ICON_PRODUCTION] Production from Fishing Boats and Atolls. Melee and Gunpowder Units can construct Fishing Boats. Units gain +20% [ICON_STRENGTH] Combat Strength within 2 tiles of an owned {TXT_KEY_IMPROVEMENT_MOAI}. No [ICON_HAPPINESS_3] Unhappiness from Isolation.'
WHERE Tag = 'TXT_KEY_TRAIT_WAYFINDING';

UPDATE Language_en_US
SET Text = 'Can only be built on coastal tiles. +1 [ICON_CULTURE] for each adjacent Moai and City. If within 2 tiles of an Moai in Polynesian territory, all Polynesian units gain +20% [ICON_STRENGTH] Combat Strength.[NEWLINE][NEWLINE]Can be built on Resources but does not connect them.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_MOAI_HELP';

UPDATE Language_en_US
SET Text = '+1 [ICON_CULTURE] for each adjacent Moai and City. +20% [ICON_STRENGTH] Combat Strength to any nearby Polynesian Units within a 2-tile radius.[NEWLINE][NEWLINE]Can only be built on coastal tiles. Can be built on Resources but does not connect them.'
WHERE Tag = 'TXT_KEY_BUILD_MOAI_HELP';

UPDATE Language_en_US
SET Text = 'It will increase [ICON_CULTURE] Culture and [ICON_CULTURE_LOCAL] Border Growth. Removes any feature on the tile.[NEWLINE]Provides additional [ICON_CULTURE] Culture if adjacent to cities or other Moai.[NEWLINE]Provides a combat bonus for nearby Polynesian units.[NEWLINE]It will not [COLOR_NEGATIVE_TEXT]connect the resource[ENDCOLOR] on this tile (if any).'
WHERE Tag = 'TXT_KEY_BUILD_MOAI_REC';

UPDATE Language_en_US
SET Text = 'Cities claim up to 4 additional tiles when acquired, and claim adjacent unowned tiles when their borders expand to a land tile of the same type. All Recon Units can choose rewards from Ancient Ruins. Land Units gain +20% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Inside Friendly Territory[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_TRAIT_GREAT_EXPANSE';

UPDATE Language_en_US
SET Text = 'Can only be built on flat land tiles, and cannot be adjacent to another Encampment.[NEWLINE][NEWLINE]+15% [ICON_STRENGTH] Defensive Strength for any Unit stationed in this tile. Any enemy unit which ends its turn next to this tile takes 5 damage (damage does not stack with other improvements).'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_ENCAMPMENT_SHOSHONE_HELP';

UPDATE Language_en_US
SET Text = '+15% [ICON_STRENGTH] Defensive Strength for any Unit stationed in this tile. Any enemy unit which ends its turn next to the Encampment takes 5 damage.[NEWLINE][NEWLINE]Can only be built on flat land tiles, and cannot be adjacent to another Encampment.'
WHERE Tag = 'TXT_KEY_BUILD_ENCAMPMENT_SHOSHONE_HELP';

UPDATE Language_en_US
SET Text = 'It will increase [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_CULTURE] Culture. Removes any feature on the tile.[NEWLINE]Provides a defensive bonus for own units on the tile, and lightly damages adjacent enemy units.'
WHERE Tag = 'TXT_KEY_BUILD_ENCAMPMENT_SHOSHONE_REC';

UPDATE Language_en_US
SET Text = 'Unique Polynesian {TXT_KEY_UNIT_LONGSWORDSMAN} that weakens adjacent enemy Units, can embark and disembark quickly, and does not require [ICON_RES_IRON] {TXT_KEY_RESOURCE_IRON}.'
WHERE Tag = 'TXT_KEY_CIV5_POLYNESIAN_MAORI_WARRIOR_HELP';

UPDATE Language_en_US
SET Text = 'The {TXT_KEY_UNIT_POLYNESIAN_MAORI_WARRIOR} is the Polynesian unique unit, replacing the {TXT_KEY_UNIT_LONGSWORDSMAN}. It has a unique debuffing aura that decreases the [ICON_STRENGTH] Combat Strength of adjacent enemies. It can also embark and disembark with just one [ICON_MOVES] Movement. It is a lot cheaper and does not require [ICON_RES_IRON] {TXT_KEY_RESOURCE_IRON} to be trained.'
WHERE Tag = 'TXT_KEY_CIV5_POLYNESIAN_MAORI_WARRIOR_STRATEGY';

UPDATE Language_en_US
SET Text = '-20% [ICON_STRENGTH] Combat Strength for [COLOR_POSITIVE_TEXT]Adjacent Enemy Units[ENDCOLOR].[NEWLINE]Embarking and Disembarking cost only 1 [ICON_MOVES] Movement.'
WHERE Tag = 'TXT_KEY_PROMOTION_HAKA_WAR_DANCE_HELP';
