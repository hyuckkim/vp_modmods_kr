----------------------------------------------------
-- ArtDef
----------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_2HANDER'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_LONGSWORDSMAN');

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 										Scale,  ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_2HANDER'),	Scale,	ZOffset, Domain, ('2hswordsman_black.fxsxml'),	('ARMOR'), ('ARMOR')
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,			NumMembers)
SELECT		('ART_DEF_UNIT_2HANDER'),		('ART_DEF_UNIT_MEMBER_2HANDER'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_LONGSWORDSMAN');

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_2HANDER'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN');

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_2HANDER'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, ('METAL'), ('SWORD')
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN');

INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_2HANDER', 		'Unit', 	'sv_2hander.dds');

----------------------------------------------------
-- Icons
----------------------------------------------------

INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('RER_UNITS_ATLAS',	256, 'RER_UNITS_atlas_256.dds', 2, 1),
('RER_UNITS_ATLAS',	128, 'RER_UNITS_atlas_128.dds', 2, 1),
('RER_UNITS_ATLAS',	 80, 'RER_UNITS_atlas_80.dds',  2, 1),
('RER_UNITS_ATLAS',	 64, 'RER_UNITS_atlas_64.dds',  2, 1),
('RER_UNITS_ATLAS',	 45, 'RER_UNITS_atlas_45.dds',  2, 1),
('vpee_promoAtlas', 256, 'VPEE_promo_icons_256.dds', '8', '1'),
('vpee_promoAtlas', 64, 'VPEE_promo_icons_064.dds', '8', '1'),
('vpee_promoAtlas', 45, 'VPEE_promo_icons_045.dds', '8', '1'),
('vpee_promoAtlas', 32, 'VPEE_promo_icons_032.dds', '8', '1'),
('vpee_promoAtlas', 16, 'VPEE_promo_icons_016.dds', '8', '1'),
('LandsknechtAtlas', 32, 'AGLA_BAVMAX_UnitFlag_32.dds', '1', '1');

----------------------------------------------------
-- Unit
----------------------------------------------------
INSERT INTO UnitClasses (Type, DefaultUnit, Description)
VALUES ('UNITCLASS_2HANDER', 'UNIT_2HANDER', 'TXT_KEY_UNIT_2HANDER');

INSERT INTO Units 
	(Class, Type, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 
	Description, Civilopedia, Strategy, Help,
	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, GoodyHutUpgradeUnitClass, AdvancedStartCost, PurchaseCooldown,
	XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, UnitFlagIconOffset, IconAtlas, PortraitIndex)
VALUES
	('UNITCLASS_2HANDER', 'UNIT_2HANDER','TECH_CHEMISTRY', 28, 325, 425, 1, 2, 'UNITCOMBAT_MELEE', 'DOMAIN_LAND', 'UNITAI_ATTACK',
	'TXT_KEY_UNIT_2HANDER',	'TXT_KEY_CIV5_2HANDER_TEXT', 'TXT_KEY_UNIT_2HANDER_STRATEGY', 'TXT_KEY_UNIT_HELP_2HANDER',
	1, 1, 1, 'TECH_RIFLING', 'UNITCLASS_RIFLEMAN', 25, 1,
	3, 3, 3, 'ART_DEF_UNIT_2HANDER', 33, 'RER_UNITS_ATLAS', 0);

INSERT INTO Unit_ClassUpgrades
	(UnitType, UnitClassType)
VALUES
	('UNIT_2HANDER', 'UNITCLASS_RIFLEMAN');

INSERT INTO Unit_BuildingClassPurchaseRequireds
	(UnitType, BuildingClassType)
VALUES 
	('UNIT_2HANDER', 'BUILDINGCLASS_ARMORY');

UPDATE Units SET UnitFlagAtlas = 'LandsknechtAtlas' WHERE Type = 'UNIT_GERMAN_LANDSKNECHT';
UPDATE Units SET UnitFlagIconOffset = 0 WHERE Type = 'UNIT_GERMAN_LANDSKNECHT';

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_2HANDER', 'AS2D_SELECT_SWORDSMAN', 'AS2D_BIRTH_SWORDSMAN');

-- update Longswordsman
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_2HANDER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_LONGSWORDSMAN');

UPDATE Units SET 
ObsoleteTech = 'TECH_CHEMISTRY', 
GoodyHutUpgradeUnitClass = 'UNITCLASS_2HANDER'
WHERE Type = 'UNIT_LONGSWORDSMAN';

---UNIQUE UNITS----

-- all sword UU need to obsolete at 2Hander instead
UPDATE Units
SET ObsoleteTech = 'TECH_CHEMISTRY'
WHERE Type IN (SELECT UnitType FROM Civilization_UnitClassOverrides WHERE UnitClassType = 'UNITCLASS_SWORDSMAN');

UPDATE Civilization_UnitClassOverrides 
SET UnitClassType = 'UNITCLASS_2HANDER'
WHERE UnitType IN ('UNIT_FRENCH_MUSKETEER', 'UNIT_GERMAN_LANDSKNECHT');

UPDATE Units SET
Class = 'UNITCLASS_2HANDER',
Combat = 30,
PrereqTech = 'TECH_CHEMISTRY'
WHERE Type = 'UNIT_FRENCH_MUSKETEER';

UPDATE Language_en_US
SET Text = 'Unique French {TXT_KEY_UNIT_2HANDER} that excels at delivering a fast attack into the enemy. Instead of the [COLOR_POSITIVE_TEXT]Two Hander[ENDCOLOR] Promotion, it can move faster and ignore Zone of Control.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MUSKETEER';

UPDATE Language_en_US
SET Text = 'The {TXT_KEY_UNIT_FRENCH_MUSKETEER} is a French Unique Unit, replacing the {TXT_KEY_UNIT_2HANDER}. It is more powerful, and has different promotions which allow it to move faster and ignore Zone of Control.'
WHERE Tag = 'TXT_KEY_UNIT_FRENCH_MUSKETEER_STRATEGY';

UPDATE Units SET
Class = 'UNITCLASS_2HANDER', 
PrereqTech = 'TECH_CHEMISTRY',
Combat = 28,
Cost = 300,
IconAtlas = 'CORP2_ATLAS',
PortraitIndex = 12
WHERE Type = 'UNIT_GERMAN_LANDSKNECHT';

UPDATE Language_en_US
SET Text = 'Unique French {TXT_KEY_UNIT_2HANDER} that excels at delivering a fast attack into the enemy. Instead of the [COLOR_POSITIVE_TEXT]Two Hander[ENDCOLOR] Promotion, it can move faster and ignore Zone of Control.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MUSKETEER';

UPDATE Language_en_US
SET Text = 'The {TXT_KEY_UNIT_FRENCH_MUSKETEER} is a French Unique Unit, replacing the {TXT_KEY_UNIT_2HANDER}. It is more powerful, and has different promotions which allow it to move faster and ignore Zone of Control.'
WHERE Tag = 'TXT_KEY_UNIT_FRENCH_MUSKETEER_STRATEGY';

UPDATE Language_en_US
SET Text = 'Doppelsoeldner'
WHERE Tag = 'TXT_KEY_UNIT_GERMAN_LANDSKNECHT';

UPDATE Language_en_US
SET Text = 'Unique German {TXT_KEY_UNIT_2HANDER} that specializes as mercenaries, having no experience penalty or cooldown while being able to move immediately when purchased. Starts with [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_FORMATION_1}[ENDCOLOR] and [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_FORMATION_2}[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_UNIT_HELP_LANDSKNECHT';

UPDATE Language_en_US
SET Text = 'The {TXT_KEY_UNIT_GERMAN_LANDSKNECHT} is the German unique unit, replacing the {TXT_KEY_UNIT_2HANDER}. It has a combat bonus against full health units, and a increased bonus against mounted units. It is also slightly cheaper to train or purchase, and gain full XP and can move immediately when bought.[NEWLINE][NEWLINE]Use their fast deployment and their bonus against full health units to surprise your opponents in the first turns of your wars and break their lines quickly. Its cheap cost also makes it an excellent gift. Buy several units at once, walk them over to a nearby City-State, and reap the benefits of both short- and long-term influence.'
WHERE Tag = 'TXT_KEY_UNIT_GERMAN_LANDSKNECHT_STRATEGY';

UPDATE Language_en_US
SET Text = 'Doppelsoeldner or "double-pay men" were part of the pike-and-shot era of warfare in Europe who volunteered to fight in the front line, in exchange for double payment. Roughly one-in-four men in a composition were front line soldiers who formed wings in front of the pikemen, who themselves defended to crossbowmen and/or arquebusiers. Although aimed with light ranged weapons, the main tool of the doppelsoeldner was the Zweihaender, a gigantic two-handed sword used to decapitate enemy pikes, and their wielders!'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_LANDSKNECHT_TEXT';


----------------------------------------------------
-- Promotions
----------------------------------------------------
DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_FIELD_WORKS_0' AND UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_TERCIO');

DELETE FROM Unit_FreePromotions WHERE UnitType IN ('UNIT_GERMAN_LANDSKNECHT');

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_2HANDER', 'PROMOTION_FIELD_WORKS_0'),
('UNIT_2HANDER', 'PROMOTION_2HANDER'),
('UNIT_GERMAN_LANDSKNECHT', 'PROMOTION_FIELD_WORKS_0'),
('UNIT_GERMAN_LANDSKNECHT', 'PROMOTION_2HANDER'),
('UNIT_GERMAN_LANDSKNECHT', 'PROMOTION_FORMATION_1'),
('UNIT_GERMAN_LANDSKNECHT', 'PROMOTION_FORMATION_2'),
('UNIT_ZULU_IMPI', 'PROMOTION_COVER_1');

-- impi
UPDATE Language_en_US
SET Text = 'Unique Zulu {TXT_KEY_UNIT_SPANISH_TERCIO} that excels at defeating Gunpowder Units. Starts with the Javelin Volley Promotion. Also starts with Cover I.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_ZULU_IMPI';

UPDATE Language_en_US
SET Text = 'Javelin Volley'
WHERE Tag = 'TXT_KEY_PROMOTION_RANGED_SUPPORT_FIRE';

UPDATE Language_en_US
SET Text = 'The {TXT_KEY_UNIT_ZULU_IMPI} is a Zulu Unique Unit, replacing the {TXT_KEY_UNIT_SPANISH_TERCIO}. Besides being much stronger and more expensive to build than the {TXT_KEY_UNIT_PIKEMAN}, it takes notably less compared to other contemporary units. Its shield gives it Cover I, reducing damage from ranged attacks, and before engaging in an melee attack, it performs a spear throw attack that weakens the defender before melee combat ensues. It also has a [ICON_STRENGTH] Combat Strength bonus when fighting against Gunpowder Units, making it a deadly unit well into the Industrial Era.'
WHERE Tag = 'TXT_KEY_UNIT_ZULU_IMPI_STRATEGY';

INSERT OR REPLACE INTO UnitPromotions_UnitCombatMods
	(PromotionType, UnitCombatType, Modifier)
VALUES
	('PROMOTION_KNOCKOUT', 'UNITCOMBAT_GUN', 33);

INSERT OR REPLACE INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PROMOTION_KNOCKOUT_HELP', '+33% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Gunpowder Units[ENDCOLOR].');

-- yellow brow

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
VALUES 
('UNIT_SHOSHONE_YELLOW_BROW', 'PROMOTION_FORMATION_2');

UPDATE Language_en_US
SET Text = Replace(Text, 'Formation I', 'Formation I and Formation II')
WHERE Tag = 'TXT_KEY_UNIT_SHOSHONE_YELLOW_BROW_HELP';

----------------------------------------------------
-- Other features
----------------------------------------------------

INSERT INTO Unit_ResourceQuantityRequirements 
	(UnitType, ResourceType, Cost)
VALUES 
	('UNIT_2HANDER', 'RESOURCE_IRON', 1),
	('UNIT_FRENCH_MUSKETEER', 'RESOURCE_IRON', 1),
	('UNIT_GERMAN_LANDSKNECHT', 'RESOURCE_IRON', 1);

----------------------------------------------------
-- AI
----------------------------------------------------

INSERT INTO Unit_AITypes (UnitType, UnitAIType) VALUES
('UNIT_2HANDER', 'UNITAI_ATTACK'),
('UNIT_2HANDER', 'UNITAI_DEFENSE');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_2HANDER', 'FLAVOR_OFFENSE', 7),
('UNIT_2HANDER', 'FLAVOR_DEFENSE', 6);

----------------------------------------------------
-- Text (en_US)
----------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_UNIT_2HANDER', 'Greatswordsman'),
('TXT_KEY_CIV5_2HANDER_TEXT', 'Renaissance two-handed swords are monstrous weapons, longer and larger than even the medieval longsword, with a hilt of over a foot and a blade that measures nearly five feet in length, taller than some people. They are primarily in use during the early decades of the 16th century. These swords represent the final stage in the trend of increasing size that started in the 14th century. They can be used to fight against pike formations and cut off pike heads.'),
('TXT_KEY_UNIT_2HANDER_STRATEGY', 'The Greatswordsman is much stronger than the Longswordsman, and gains a devastating combat bonus against Melee Units that start with Formation I.'),
('TXT_KEY_UNIT_HELP_2HANDER', 'Early Renaissance Era Melee Unit. Additional +33% [ICON_STRENGTH] Strength [COLOR_POSITIVE_TEXT]Attacking[ENDCOLOR] VS Spearmen, {TXT_KEY_UNIT_PIKEMAN}, Free Companies, and {TXT_KEY_UNIT_SPANISH_TERCIO}.');
------------------------------------------------
----------------------------------------------------
-- Promo stuff
----------------------------------------------------

INSERT INTO UnitPromotions (Type, PediaType, IconAtlas, PortraitIndex, Sound) VALUES
('PROMOTION_2HANDER',    'PEDIA_MELEE',      'vpee_promoAtlas', 00,'AS2D_IF_LEVELUP');

UPDATE UnitPromotions
SET Description = 'TXT_KEY_'||Type, Help = 'TXT_KEY_'||Type||'_HELP', PediaEntry = 'TXT_KEY_'||Type, CannotBeChosen = 1
WHERE Type = 'PROMOTION_2HANDER';

----------------------------------------------------
-- Promotions' unique features
----------------------------------------------------

UPDATE UnitPromotions SET LostWithUpgrade = 1 WHERE Type = 'PROMOTION_2HANDER';
INSERT INTO UnitPromotions_UnitClasses (PromotionType, UnitClassType, Attack) VALUES
('PROMOTION_2HANDER', 'UNITCLASS_PIKEMAN', 33),
('PROMOTION_2HANDER', 'UNITCLASS_SPEARMAN', 33),
('PROMOTION_2HANDER', 'UNITCLASS_TERCIO', 33),
('PROMOTION_2HANDER', 'UNITCLASS_FCOMPANY', 33);

----------------------------------------------------
-- Text (en_US)
----------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PROMOTION_2HANDER', 'Two Hander'),
('TXT_KEY_PROMOTION_2HANDER_HELP', '+33% [ICON_STRENGTH] Strength [COLOR_POSITIVE_TEXT]Attacking[ENDCOLOR] VS Spearman, {TXT_KEY_UNIT_PIKEMAN}, Free Company, and {TXT_KEY_UNIT_SPANISH_TERCIO}[NEWLINE][COLOR_NEGATIVE_TEXT]Lost on upgrade[ENDCOLOR].');

-- rename the Tercio

UPDATE Language_en_US
SET Text = 'Pike-and-Shot'
WHERE Tag = 'TXT_KEY_UNIT_SPANISH_TERCIO';

UPDATE Language_en_US
SET Text = 'The Pike-and-Shot is the basic Melee Unit of the Renaissance Era, able to easily stand up to the terrifying Knights of the Medieval Era.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_HELP';

UPDATE Language_en_US
SET Text = 'Like previous defensive Units that also did not require Iron, the Pike-and-Shot is the bread-and-butter frontline troop. It also has access to [COLOR_POSITIVE_TEXT]Pike Tactics[ENDCOLOR], which can enable it to be used offensively when initiating against the foe. However, in the Renaissance period the powerful Greatswordsman also becomes available, which for the first time represents a direct counter. Therefore although Mounted Units are less intimidating, care must still be taken to design an effective army composition without a single point of failure.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_STRATEGY';

UPDATE Language_en_US
SET Text = 'Pike-and-Shot referes to a tactical formation that first appeared during the late 15th and early 16th centuries, and was used until the development of the bayonet in the late 17th century. This type of formation combined soldiers armed with pikes and soldiers armed with arquebuses and/or muskets. Other weapons such as swords, halberds, and crossbows were also sometimes used. The formation was initially developed by the Holy Roman Imperial (Landsknechte) and Spanish (Tercios) infantries.[NEWLINE][NEWLINE]The tactic hinges on the control offered by the Pike, a reinforced polearm often well-over 4 metres long. Although excellent defensively, its unwieldiness made it vulnerable to being outmaneuvered, and only well-trained units could use it in an effective offensive manner. To overcome these weaknesses, Pikemen were paired with Arquebusiers, extremely primitive (matchlock) firearms. Pike-and-Shot was so successful many battles of the time devolved into large numbers of immobilized men pushed up against each other in a deadly crush known as a "push of pike", and massive two-handed swords were constructed specifically to disarm Pikemen.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_TEXT';



