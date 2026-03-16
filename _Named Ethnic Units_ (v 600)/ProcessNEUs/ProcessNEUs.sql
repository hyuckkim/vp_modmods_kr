-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('ProcessEthnicUnits');
--=======================================================================================================================
-- COMPATIBILITY FIRST
--=======================================================================================================================
UPDATE GAIA_EU_Config SET EU_Type = 'RIFLEMAN', EU_Art = 'RIFLEMAN', EU_Member = 'RIFLEMAN' WHERE EU_Model = 'civ5_danrm1'
	AND NOT EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_GAIA_LINEINFANTRY');	-- Denmark
UPDATE GAIA_EU_Config SET EU_Type = 'MUSKETMAN', EU_Art = 'MUSKETMAN', EU_Member = 'MUSKETMAN' WHERE EU_Model = 'redcoat'
	AND NOT EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_GAIA_LINEINFANTRY'); -- England
UPDATE GAIA_EU_Config SET EU_Type = 'RIFLEMAN', EU_Art = 'RIFLEMAN', EU_Member = 'RIFLEMAN' WHERE EU_Model = 'civ5_gerrm'
	AND NOT EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_GAIA_LINEINFANTRY'); -- Germany
DELETE FROM GAIA_EU_Config WHERE EU_Type = 'SKIRMISHER' AND NOT EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_GAIA_SKIRMISHER');
DELETE FROM GAIA_EU_Config WHERE EU_Type = 'GALLEON' AND NOT EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_GAIA_GALLEON');
UPDATE GAIA_EU_Config SET EU_Type = 'ARMOREDHALFTRACK', EU_Art = 'ARMOREDHALFTRACK', EU_Member = 'ARMOREDHALFTRACK' WHERE EU_Model IN ('Type1_Ho-Ni_I', 'PVKV_M43') 
	AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_GAIA_ARMOREDHALFTRACK'); -- Indonesia, Sweden
UPDATE GAIA_EU_Config SET EU_Type = 'CARABINIER', EU_Art = 'CARABINIER', EU_Member = 'CARABINIER' WHERE EU_Type = 'DRAGOON';

--=======================================================================================================================
-- DON'T CHANGE ANYTHING BELOW THIS LINE
--=======================================================================================================================
UPDATE GAIA_EU_Config SET EU_Name = EU_Type;
UPDATE GAIA_EU_Config SET EU_Art = EU_Type;
UPDATE GAIA_EU_Config SET EU_Member = EU_Type WHERE NOT EU_Model IS NULL;
UPDATE GAIA_EU_Config SET EU_Art = '_WARRIOR' WHERE EU_Type = 'WARRIOR';

UPDATE GAIA_EU_Config SET EU_Member = 'U_ROMAN_LEGION'			WHERE EU_Civ = '_BYZANTIUM' AND EU_Type = 'SWORDSMAN';
UPDATE GAIA_EU_Config SET EU_Member = 'U_ENGLISH_LONGBOWMAN'	WHERE EU_Civ = '_CELTS'		AND EU_Type = 'CROSSBOWMAN';
UPDATE GAIA_EU_Config SET EU_Member = 'U_POLYNESIAN_WAR_CANOE'	WHERE EU_Civ = '_POLYNESIA' AND EU_Type = 'TRIREME';
UPDATE GAIA_EU_Config SET EU_Member = 'U_MAYAN_ATLALIST'		WHERE EU_Civ = '_POLYNESIA' AND EU_Type = 'COMPOSITE_BOWMAN';

UPDATE GAIA_EU_Config SET EU_Art = 'WW1_INFANTRY',			EU_Member = 'WW1_INFANTRY'		WHERE EU_Type = 'GREAT_WAR_INFANTRY';
UPDATE GAIA_EU_Config SET EU_Art = 'WW2_INFANTRY',			EU_Member = 'WW2_INFANTRY'		WHERE EU_Type = 'INFANTRY';
UPDATE GAIA_EU_Config SET EU_Art = 'BAZOOKA_INFANTRY',		EU_Member = 'BAZOOKA_INFANTRY'	WHERE EU_Type = 'BAZOOKA';
UPDATE GAIA_EU_Config SET EU_Art = 'WW1_FIGHTER',			EU_Member = 'WW1_FIGHTER'		WHERE EU_Type = 'TRIPLANE';
UPDATE GAIA_EU_Config SET EU_Art = 'WW1_BOMBER',			EU_Member = 'WW1_BOMBER'		WHERE EU_Type = 'WWI_BOMBER';
UPDATE GAIA_EU_Config SET EU_Art = 'WW1_TANK',				EU_Member = 'WW1_TANK'			WHERE EU_Type = 'WWI_TANK';
UPDATE GAIA_EU_Config SET EU_Art = 'XP_PRIVATEER',			EU_Member = 'XP_PRIVATEER'		WHERE EU_Type = 'PRIVATEER';

UPDATE GAIA_EU_Config SET EU_Member = 'ANTIAIRCRAFTGUN'		WHERE EU_Art = 'ANTI_AIRCRAFT_GUN';
UPDATE GAIA_EU_Config SET EU_Member = 'ANTITANKGUN'			WHERE EU_Art = 'ANTI_TANK_GUN';
UPDATE GAIA_EU_Config SET EU_Member = 'HELICOPTERGUNSHIP'	WHERE EU_Art = 'HELICOPTER_GUNSHIP';
UPDATE GAIA_EU_Config SET EU_Member = 'JETFIGHTER'			WHERE EU_Art = 'JET_FIGHTER';
UPDATE GAIA_EU_Config SET EU_Member = 'MACHINEGUN'			WHERE EU_Art = 'MACHINE_GUN';
UPDATE GAIA_EU_Config SET EU_Member = 'MECHANIZEDINFANTRY'	WHERE EU_Art = 'MECHANIZED_INFANTRY';
UPDATE GAIA_EU_Config SET EU_Member = 'MISSILECRUISER'		WHERE EU_Art = 'MISSILE_CRUISER';
UPDATE GAIA_EU_Config SET EU_Member = 'MODERNARMOR'			WHERE EU_Art = 'MODERN_ARMOR';
UPDATE GAIA_EU_Config SET EU_Member = 'NUCLEARSUBMARINE'	WHERE EU_Art = 'NUCLEAR_SUBMARINE';

--------------------------------------------
-- SAPIENS UNITS
--------------------------------------------

UPDATE GAIA_EU_Config SET EU_Type   = 'GAIA_' || EU_Type, EU_Art    = 'GAIA_' || EU_Type, EU_Member = 'GAIA_' || EU_Type
WHERE EU_Type IN (
	'HEAVYHORSEARCHER','HORSEBACKARCHER','PIKEANDSHOT','SLINGER','ZWEIHANDER','CUIRASSIER','DRAGOON','ARMOREDHALFTRACK',
	'ROCKETLAUNCHER','PENTECONTER','COG','ARMOREDCRUISER','DREADNOUGHT','TORPEDOGUNBOAT','MISSILEDESTROYER','ATTACKSUBMARINE',
	'NUCLEARCARRIER','STEALTHFIGHTER','JETBOMBER', 'EXPLORER', 'RANGER', 'COMMANDO', 'ENVOY', 'GREATEMISSARY',
	'LINEINFANTRY', 'FUSILIER', 'FIELDGUN'
)
AND substr(EU_Type, 1, 5) != 'GAIA_';

DELETE FROM GAIA_EU_Config  WHERE EU_Type LIKE 'GAIA_%' AND NOT EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_' || EU_Type);

--=======================================================================================================================
-- ETHNIC UNIT ART DEFINES
--=======================================================================================================================
UPDATE Units SET UnitArtInfoCulturalVariation = 1 WHERE UnitArtInfoEraVariation <> 1;
CREATE TABLE GAIA_ArtDefine_UnitInfoMemberInfos AS SELECT * FROM ArtDefine_UnitInfoMemberInfos;
DELETE FROM ArtDefine_UnitInfoMemberInfos;
INSERT OR REPLACE INTO ArtDefine_UnitInfos
				(Type,											DamageStates,		Formation)
SELECT DISTINCT 'ART_DEF_UNIT_'||config.EU_Art||config.EU_Civ,	def.DamageStates,	def.Formation
FROM ArtDefine_UnitInfos AS def, GAIA_EU_Config AS config WHERE Type = 'ART_DEF_UNIT_'||config.EU_Art;

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers) SELECT
	'ART_DEF_UNIT_' || EU_Art || EU_Civ, 'ART_DEF_UNIT_MEMBER_' || EU_Member || EU_Civ, EU_NumMembers
FROM GAIA_EU_Config WHERE EU_Model IS NOT NULL;

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers) SELECT
	'ART_DEF_UNIT_' || EU_Art || EU_Civ, 'ART_DEF_UNIT_MEMBER_' || EU_Member, EU_NumMembers
FROM GAIA_EU_Config WHERE EU_Model IS NULL;

INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos
		(Type,														Scale,		ZOffset,		Domain,		Model,						MaterialTypeTag,		MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_'||config.EU_Member||config.EU_Civ,	def.Scale,	def.ZOffset,	def.Domain, config.EU_Model||'.fxsxml', def.MaterialTypeTag,	def.MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos AS def, GAIA_EU_Config AS config WHERE Type = 'ART_DEF_UNIT_MEMBER_'||config.EU_Member AND config.EU_Model IS NOT NULL;

INSERT OR REPLACE INTO ArtDefine_UnitMemberCombats
		(UnitMemberType,										EnableActions,		DisableActions,		MoveRadius,		ShortMoveRadius,		ChargeRadius,		AttackRadius,		RangedAttackRadius,		MoveRate,		ShortMoveRate,		TurnRateMin,		TurnRateMax,		TurnFacingRateMin,		TurnFacingRateMax,		RollRateMin,		RollRateMax,		PitchRateMin,		PitchRateMax,		LOSRadiusScale,		TargetRadius,		TargetHeight,		HasShortRangedAttack,		HasLongRangedAttack,		HasLeftRightAttack,		HasStationaryMelee,		HasStationaryRangedAttack,		HasRefaceAfterCombat,		ReformBeforeCombat,		HasIndependentWeaponFacing,		HasOpponentTracking,		HasCollisionAttack,		AttackAltitude,		AltitudeDecelerationDistance,		OnlyTurnInMovementActions,		RushAttackFormation)
SELECT 'ART_DEF_UNIT_MEMBER_'||config.EU_Member||config.EU_Civ,	def.EnableActions,	def.DisableActions,	def.MoveRadius,	def.ShortMoveRadius,	def.ChargeRadius,	def.AttackRadius,	def.RangedAttackRadius,	def.MoveRate,	def.ShortMoveRate,	def.TurnRateMin,	def.TurnRateMax,	def.TurnFacingRateMin,	def.TurnFacingRateMax,	def.RollRateMin,	def.RollRateMax,	def.PitchRateMin,	def.PitchRateMax,	def.LOSRadiusScale,	def.TargetRadius,	def.TargetHeight,	def.HasShortRangedAttack,	def.HasLongRangedAttack,	def.HasLeftRightAttack,	def.HasStationaryMelee,	def.HasStationaryRangedAttack,	def.HasRefaceAfterCombat,	def.ReformBeforeCombat, def.HasIndependentWeaponFacing, def.HasOpponentTracking,	def.HasCollisionAttack, def.AttackAltitude, def.AltitudeDecelerationDistance,	def.OnlyTurnInMovementActions,	def.RushAttackFormation
FROM ArtDefine_UnitMemberCombats AS def, GAIA_EU_Config AS config WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_'||config.EU_Member AND config.EU_Model IS NOT NULL;

INSERT OR REPLACE INTO ArtDefine_UnitMemberCombatWeapons
		(UnitMemberType,											"Index",		SubIndex,		"ID",		VisKillStrengthMin,		VisKillStrengthMax,		ProjectileSpeed,		ProjectileTurnRateMin,		ProjectileTurnRateMax,		HitEffect,		HitEffectScale,		HitRadius,		ProjectileChildEffectScale,		AreaDamageDelay,		ContinuousFire,		WaitForEffectCompletion,		TargetGround,		IsDropped,		WeaponTypeTag,		WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_'||config.EU_Member||config.EU_Civ,	def."Index",	def.SubIndex,	def."ID",	def.VisKillStrengthMin, def.VisKillStrengthMax, def.ProjectileSpeed,	def.ProjectileTurnRateMin,	def.ProjectileTurnRateMax,	def.HitEffect,	def.HitEffectScale, def.HitRadius,	def.ProjectileChildEffectScale, def.AreaDamageDelay,	def.ContinuousFire, def.WaitForEffectCompletion,	def.TargetGround,	def.IsDropped,	def.WeaponTypeTag,	def.WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons AS def, GAIA_EU_Config AS config WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_'||config.EU_Member AND config.EU_Model IS NOT NULL;

------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos SELECT * FROM GAIA_ArtDefine_UnitInfoMemberInfos AS t
	WHERE NOT EXISTS (SELECT 1 FROM ArtDefine_UnitInfoMemberInfos AS a WHERE a.UnitInfoType = t.UnitInfoType);
DROP TABLE GAIA_ArtDefine_UnitInfoMemberInfos;

--=======================================================================================================================
-- ETHNIC UNIT OVERRIDES
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS _Civilization_UnitNameOverrides (CivilizationType TEXT REFERENCES Civilizations(Type), 
	UnitType TEXT REFERENCES Units(Type), EthnicUnitName TEXT REFERENCES Language_en_US(Tag)
);
INSERT INTO _Civilization_UnitNameOverrides (CivilizationType, UnitType, EthnicUnitName) 
	SELECT DISTINCT 'CIVILIZATION' || EU_Civ, 'UNIT_' || EU_Type, 'TXT_KEY_ETHNIC_UNIT' || EU_Civ || '_' || EU_Name 
	FROM GAIA_EU_Config WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_' || EU_Type);

DROP TABLE GAIA_EU_Config;
--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'ProcessEthnicUnits';
