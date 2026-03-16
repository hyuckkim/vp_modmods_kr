--==============================
-- Goleyo (Chariot Archer)
-- tanky and kite in woods
--===============================

INSERT INTO ArtDefine_StrategicView
	(StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_UNIT_SAS_AZANDE_KPINGA', 'Unit', 'sv_goleyo.dds');

INSERT INTO ArtDefine_UnitInfos
	(Type, DamageStates, Formation)
SELECT 
	'ART_DEF_UNIT_SAS_AZANDE_KPINGA', DamageStates, Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_HAND_AXE_BARBARIAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos
	(UnitInfoType, UnitMemberInfoType, NumMembers)
SELECT
	'ART_DEF_UNIT_SAS_AZANDE_KPINGA', 'ART_DEF_UNIT_MEMBER_SAS_AZANDE_KPINGA', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_HAND_AXE_BARBARIAN';

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_SAS_AZANDE_KPINGA'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_HAND_AXE_BARBARIAN');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_SAS_AZANDE_KPINGA'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_HAND_AXE_BARBARIAN');

INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT
	'ART_DEF_UNIT_MEMBER_SAS_AZANDE_KPINGA', Scale, 'goleyo.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_HAND_AXE_BARBARIAN';
--====================================

UPDATE Units SET
Moves = 3,
Combat = Combat + 3,
RangedCombat = RangedCombat - 1,
IsMounted = 0
WHERE Type = 'UNIT_CD_GOLEYO';

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CD_GOLEYO' AND PromotionType IN ('PROMOTION_BEAM_AXLE', 'PROMOTION_NO_DEFENSIVE_BONUSES');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_GOLEYO', 'PROMOTION_WOODSMAN');

DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CD_GOLEYO';

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_GOLEYO_HELP', 'Requires the [ICON_CULTURE_JFD_CENTRAL_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CENTRAL_AFRICAN_SHORT_DESC}[ENDCOLOR] Cultural Group.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_HELP_CHARIOR_ARCHER';	

-- Has lower [ICON_RANGE_STRENGTH] Ranged Attack, but much higher [ICON_STRENGTH] Combat Strength than the Chariot Archer that it replaces, and does not suffer the same penalties or require [ICON_RES_HORSE] Horses. Starts with the [COLOR_POSITIVE_TEXT]Woodsman[ENDCOLOR] Promotion.

--==============================
-- Djeli (Great Musician)
-- Gwennog's fav
--==============================
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 	
			(UnitType, 			UniqueName,					GreatWorkType)
VALUES			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_01',	'GREAT_WORK_GRIOT_01'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_02',	'GREAT_WORK_GRIOT_02'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_03',	'GREAT_WORK_GRIOT_03'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_04',	'GREAT_WORK_GRIOT_04'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_05',	'GREAT_WORK_GRIOT_05'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_06',	'GREAT_WORK_GRIOT_06'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_07',	'GREAT_WORK_GRIOT_07'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_08',	'GREAT_WORK_GRIOT_08'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_09',	'GREAT_WORK_GRIOT_09'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_10',	'GREAT_WORK_GRIOT_10'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_11',	'GREAT_WORK_GRIOT_11'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_12',	'GREAT_WORK_GRIOT_12'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_13',	'GREAT_WORK_GRIOT_13'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_14',	'GREAT_WORK_GRIOT_14'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_15',	'GREAT_WORK_GRIOT_15'),
			('UNIT_CD_DJELI',	'TXT_KEY_GRIOT_UNIQUE_NAME_16',	'GREAT_WORK_GRIOT_16');
--==========================================================================================================================	
-- GreatWorks
--==========================================================================================================================	
INSERT INTO Audio_Sounds
	(SoundID, FileName, LoadType, DontCache)
VALUES
	('SND_GRIOT_M__01', 'M_CD__010', 'Streamed', 0),
	('SND_GRIOT_M__02', 'M_CD__020', 'Streamed', 0),
	('SND_GRIOT_M__03', 'M_CD__030', 'Streamed', 0),
	('SND_GRIOT_M__04', 'M_CD__040', 'Streamed', 0),
	('SND_GRIOT_M__05', 'M_CD__050', 'Streamed', 0),
	('SND_GRIOT_M__06', 'M_CD__060', 'Streamed', 0),
	('SND_GRIOT_M__07', 'M_CD__070', 'Streamed', 0),
	('SND_GRIOT_M__08', 'M_CD__080', 'Streamed', 0),
	('SND_GRIOT_M__09', 'M_CD__090', 'Streamed', 0),
	('SND_GRIOT_M__10', 'M_CD__100', 'Streamed', 0),
	('SND_GRIOT_M__11', 'M_CD__110', 'Streamed', 0),
	('SND_GRIOT_M__12', 'M_CD__120', 'Streamed', 0),
	('SND_GRIOT_M__13', 'M_CD__130', 'Streamed', 0),
	('SND_GRIOT_M__14', 'M_CD__140', 'Streamed', 0),
	('SND_GRIOT_M__15', 'M_CD__150', 'Streamed', 0),
	('SND_GRIOT_M__16', 'M_CD__160', 'Streamed', 0),
	('SND_GRIOT_M__17', 'M_CD__170', 'Streamed', 0);

INSERT INTO Audio_2DSounds
	(ScriptID, SoundID, SoundType, TaperSoundtrackVolume)
VALUES
	('AS2D_GRIOT_M__01', 'SND_GRIOT_M__01', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__02', 'SND_GRIOT_M__02', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__03', 'SND_GRIOT_M__03', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__04', 'SND_GRIOT_M__04', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__05', 'SND_GRIOT_M__05', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__06', 'SND_GRIOT_M__06', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__07', 'SND_GRIOT_M__07', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__08', 'SND_GRIOT_M__08', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__09', 'SND_GRIOT_M__09', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__10', 'SND_GRIOT_M__10', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__11', 'SND_GRIOT_M__11', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__12', 'SND_GRIOT_M__12', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__13', 'SND_GRIOT_M__13', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__14', 'SND_GRIOT_M__14', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__15', 'SND_GRIOT_M__15', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__16', 'SND_GRIOT_M__16', 'GAME_MUSIC_STINGS', 0.0),
	('AS2D_GRIOT_M__17', 'SND_GRIOT_M__17', 'GAME_MUSIC_STINGS', 0.0);

INSERT INTO GreatWorks 
			(Type, 				GreatWorkClassType,			Description,					Audio,				Image)
VALUES			('GREAT_WORK_GRIOT_01', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_01',	'AS2D_GRIOT_M__01',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_02', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_02',	'AS2D_GRIOT_M__02',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_03', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_03',	'AS2D_GRIOT_M__03',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_04', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_04',	'AS2D_GRIOT_M__04',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_05', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_05',	'AS2D_GRIOT_M__05',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_06', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_06',	'AS2D_GRIOT_M__06',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_07', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_07',	'AS2D_GRIOT_M__07',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_08', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_08',	'AS2D_GRIOT_M__08',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_09', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_09',	'AS2D_GRIOT_M__09',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_10', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_10',	'AS2D_GRIOT_M__10',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_11', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_11',	'AS2D_GRIOT_M__11',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_12', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_12',	'AS2D_GRIOT_M__12',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_13', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_13',	'AS2D_GRIOT_M__13',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_14', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_14',	'AS2D_GRIOT_M__14',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_15', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_15',	'AS2D_GRIOT_M__15',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_16', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_16',	'AS2D_GRIOT_M__16',	'griotbackground.dds'),
			('GREAT_WORK_GRIOT_17', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_GRIOT_17',	'AS2D_GRIOT_M__17',	'griotbackground.dds');
--==========================================================================================================================		
--==========================================================================================================================	

INSERT INTO Trait_GreatPersonProgressFromKills
	(TraitType, GreatPersonType, Value)
SELECT
	lt.TraitType, 'GREATPERSON_MUSICIAN', 2
FROM Civilization_JFD_CultureTypes c, Leader_Traits lt, Civilization_Leaders cl
WHERE 
c.CultureType = 'CULTURE_JFD_CENTRAL_AFRICAN' AND 
c.CivilizationType = cl.CivilizationType AND 
cl.LeaderheadType = lt.LeaderType;

CREATE TRIGGER DjeliTrait
AFTER INSERT ON Civilization_JFD_CultureTypes WHEN NEW.CultureType = 'CULTURE_JFD_CENTRAL_AFRICAN'
BEGIN
	INSERT INTO Trait_GreatPersonProgressFromKills
		(TraitType, GreatPersonType, Value)
	SELECT
		lt.TraitType, 'GREATPERSON_MUSICIAN', 2
	FROM Leader_Traits lt, Civilization_Leaders cl
	WHERE 
	NEW.CivilizationType = cl.CivilizationType AND 
	cl.LeaderheadType = lt.LeaderType;
END;

-- this didnt help
/*
CREATE TRIGGER DjeliTrait
AFTER INSERT ON Traits
BEGIN
	INSERT INTO Trait_GreatPersonProgressFromKills
		(TraitType, GreatPersonType, Value)
	SELECT
		lt.TraitType, 'GREATPERSON_MUSICIAN', 2
	FROM Leader_Traits lt, Civilization_Leaders cl, Civilization_JFD_CultureTypes jfc
	WHERE 
	jfc.CultureType = 'CULTURE_JFD_CENTRAL_AFRICAN' AND
	jfc.CivilizationType = cl.CivilizationType AND 
	cl.LeaderheadType = lt.LeaderType AND
	NEW.Type = lt.TraitType;
END;
*/

UPDATE Units SET
TourismBonusTurns = 10
WHERE Type = 'UNIT_CD_DJELI';

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_DJELI_HELP', 'Requires the [ICON_CULTURE_JFD_CENTRAL_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CENTRAL_AFRICAN_SHORT_DESC}[ENDCOLOR] Cultural Group. Defeating an Enemy Unit grants 2% of the progress to the next [ICON_GREAT_MUSICIAN] Djeli in the [ICON_CAPITAL] Capital. Expending a Djeli gives +3 [ICON_CULTURE] Culture to all [ICON_GREAT_WORK] Great Works, +2 [ICON_PEACE] Faith to all National Wonders, and +5 [ICON_TOURISM] Tourism to all [ICON_MUSICIAN] Musicians and Musicians'' Guilds for 15 Turns.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_HELP_WARRIOR';	

--===============
-- event for Djeli
-- will need dummy policy for GWM buff
--===============
INSERT INTO Events 
	(Type, Description, Help, EventClass, NumChoices, RandomChance, RequiredPolicy)
VALUES
	('EVENT_DJELI', 'TXT_KEY_DJELI_EVENT', 'TXT_KEY_DJELI_EVENT_HELP', 'EVENT_CLASS_CIV_SPECIFIC', 1, -1, 'POLICY_CD_EAST_AFRICAN');

INSERT INTO EventChoices
	(Type, Description, Help, EventDuration, IsOneShot, Expires, CapitalEffectOnly, EventBuildingClassGlobal)
VALUES
	('EVENT_DJELI_CHOICE', 'TXT_KEY_DJELI_EVENT', 'TXT_KEY_DJELI_EVENT_HELP', 15, 0, 1, 1, 'BUILDINGCLASS_D_FOR_DJELI');

-- we have to use a dummy building because if you trigger the event twice it will not just refresh duration, but also stack! (gets crazy)

INSERT INTO Event_ParentEvents
	(EventChoiceType, EventType)
VALUES
	('EVENT_DJELI_CHOICE', 'EVENT_DJELI');

INSERT INTO Building_SpecialistYieldChanges
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_D_FOR_DJELI', 'SPECIALIST_MUSICIAN', 'YIELD_TOURISM', 5);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_D_FOR_DJELI', 'BUILDINGCLASS_MUSICIANS_GUILD', 'YIELD_TOURISM', 5);

INSERT INTO Building_GreatWorkYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_D_FOR_DJELI', 'YIELD_CULTURE', 3);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	'BUILDING_D_FOR_DJELI', Type, 'YIELD_FAITH', 2
FROM BuildingClasses WHERE MaxPlayerInstances = 1;

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_DJELI_EVENT', 'Bardic Inspiration'),
	('TXT_KEY_DJELI_EVENT_HELP', 'For the next {4_Turns}[NEWLINE][ICON_BULLET] All [ICON_MUSICIAN] Musicians and Musicians'' Guilds generate +5 [ICON_TOURISM] Tourism[NEWLINE][ICON_BULLET] All [ICON_GREAT_WORK] Great Works gain +3 [ICON_CULTURE] Culture[NEWLINE][ICON_BULLET] All National Wonders yield +2 [ICON_PEACE] Faith.[NEWLINE][NEWLINE]Additional triggers extend the duration.');

