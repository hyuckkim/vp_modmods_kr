-- ============================
-- Dapon (Composite Bowman)
-- competition
-- ==============================

UPDATE ArtDefine_UnitInfoMemberInfos SET 
NumMembers = (SELECT NumMembers FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARCHER' LIMIT 1) 
WHERE UnitInfoType = 'ART_DEF_UNIT_DAPON';

UPDATE ArtDefine_UnitMemberInfos SET 
Scale = (SELECT Scale FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_ARCHER' LIMIT 1) 
WHERE Type = 'ART_DEF_UNIT_MEMBER_DAPON';

UPDATE Units SET
-- MoveAfterPurchase = 1,
RequiresFaithPurchaseEnabled = 0,
Combat = Combat + 1,
RangedCombat = RangedCombat + 2
WHERE Type = 'UNIT_CD_DAPON';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_DAPON', 'PROMOTION_CD_KHASHED');

UPDATE Language_en_US SET
Text = 'Requires the [ICON_CULTURE_JFD_HIMALAYAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_HIMALAYAN_SHORT_DESC}[ENDCOLOR] Cultural Group.[NEWLINE]Can be purchased with [ICON_PEACE] Faith.'
WHERE Tag = 'TXT_KEY_UNIT_CD_DAPON_HELP';

--   Is stronger than the Composite Bowman it replaces. Starts with the [COLOR_POSITIVE_TEXT]Kha Shed[ENDCOLOR] Promotion, which increases strength for every adjacent friendly Archery Unit, and earns [ICON_TOURISM] Tourism when gaining XP.[NEWLINE]

-- =======================
-- Dzong (Unique GPTI)
-- =======================

INSERT INTO Trait_BuildsUnitClasses
	(TraitType, UnitClassType, BuildType)
SELECT
	Type, 'UNITCLASS_PROPHET', 'BUILD_JAR_DZONG' 
FROM Traits a, Leader_Traits b, Civilization_Leaders c, Civilization_JFD_CultureTypes d
WHERE a.Type = b.TraitType AND b.LeaderType = c.LeaderheadType AND 
c.CivilizationType = d.CivilizationType AND d.CultureType = 'CULTURE_JFD_HIMALAYAN';

INSERT INTO Trait_BuildsUnitClasses
	(TraitType, UnitClassType, BuildType)
SELECT
	Type, 'UNITCLASS_GREAT_GENERAL', 'BUILD_JAR_DZONG' 
FROM Traits a, Leader_Traits b, Civilization_Leaders c, Civilization_JFD_CultureTypes d
WHERE a.Type = b.TraitType AND b.LeaderType = c.LeaderheadType AND 
c.CivilizationType = d.CivilizationType AND d.CultureType = 'CULTURE_JFD_HIMALAYAN';

INSERT INTO Trait_NoBuilds	
			(TraitType, 		BuildType)
SELECT	
	Type,	'BUILD_CITADEL'
FROM Traits a, Leader_Traits b, Civilization_Leaders c, Civilization_JFD_CultureTypes d
WHERE a.Type = b.TraitType AND b.LeaderType = c.LeaderheadType AND 
c.CivilizationType = d.CivilizationType AND d.CultureType = 'CULTURE_JFD_HIMALAYAN';

INSERT INTO Trait_NoBuilds	
			(TraitType, 		BuildType)
SELECT	
	Type,	'BUILD_HOLY_SITE'
FROM Traits a, Leader_Traits b, Civilization_Leaders c, Civilization_JFD_CultureTypes d
WHERE a.Type = b.TraitType AND b.LeaderType = c.LeaderheadType AND 
c.CivilizationType = d.CivilizationType AND d.CultureType = 'CULTURE_JFD_HIMALAYAN';

CREATE TRIGGER DzongTrait
AFTER INSERT ON Civilization_JFD_CultureTypes WHEN NEW.CultureType = 'CULTURE_JFD_HIMALAYAN'
BEGIN
	INSERT INTO Trait_BuildsUnitClasses
		(TraitType, UnitClassType, BuildType)
	SELECT
		lt.TraitType, uc.Type, 'BUILD_JAR_DZONG'
	FROM Leader_Traits lt, Civilization_Leaders cl, UnitClasses uc
	WHERE 
	uc.Type IN ('UNITCLASS_PROPHET', 'UNITCLASS_GREAT_GENERAL') AND
	NEW.CivilizationType = cl.CivilizationType AND 
	cl.LeaderheadType = lt.LeaderType;

	INSERT INTO Trait_NoBuilds
		(TraitType, BuildType)
	SELECT
		lt.TraitType, b.Type
	FROM Leader_Traits lt, Civilization_Leaders cl, Builds b
	WHERE 
	b.Type IN ('BUILD_CITADEL', 'BUILD_HOLY_SITE') AND
	NEW.CivilizationType = cl.CivilizationType AND 
	cl.LeaderheadType = lt.LeaderType;
END;
