INSERT INTO Beliefs
	(Type, 	Description, 	ShortDescription, Tooltip, 
	Pantheon,  Founder,  Follower, 	Enhancer,  Reformation)
VALUES	
	('BELIEF_UNITY_OF_PROPHETS_ANCIENT',  'TXT_KEY_BELIEF_UNITY_OF_PROPHETS_ANCIENT',   'TXT_KEY_BELIEF_UNITY_OF_PROPHETS_ANCIENT_SHORT', 'TXT_KEY_BELIEF_UNITY_OF_PROPHETS_ANCIENT',		
	0, 	0, 	  0, 	 0, 	 1),
	('BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL',  'TXT_KEY_BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL',   'TXT_KEY_BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL_SHORT', 'TXT_KEY_BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL',		
	0, 	0, 	  0, 	 0, 	 1);

INSERT INTO Language_en_US 
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_UNITY_OF_PROPHETS_ANCIENT_SHORT', 'Radical Sects'),
	('TXT_KEY_BELIEF_UNITY_OF_PROPHETS_ANCIENT', '+1 [ICON_CULTURE] Culture and [ICON_PEACE] Faith from [ICON_ENGINEER] Engineers, [ICON_CITIZEN_RED] Labourers, and [ICON_WRITER] Writers. Gain 15 [ICON_FOOD] Food, [ICON_CULTURE] Culture, and [ICON_PEACE] Faith every time the City expands its borders naturally, scaling with Era.'),

	('TXT_KEY_BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL_SHORT', 'Charitable Fundraising'),
	('TXT_KEY_BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL', '+1 [ICON_GOLD] Gold and [ICON_PEACE] Faith from [ICON_SCIENTIST] Scientists, [ICON_CITIZEN_RED] Labourers, and [ICON_MERCHANT] Merchants. +1 [ICON_FOOD] Food in a City for every 10 [ICON_GOLD] Gold per turn it produces, capped at half the number of Followers in the City. +8 [ICON_GOLD] Gold and [ICON_PEACE] Faith when a Building is constructed, scaling with Era.');

--------------------------
-- split to the glory of god 
--------------------------
UPDATE Beliefs SET 
FaithPurchaseAllGreatPeople = 0,
CityScalerLimiter = 30 
WHERE Type = 'BELIEF_TO_GLORY_OF_GOD';

UPDATE Belief_GreatPersonExpendedYield SET
Yield = 5 
WHERE BeliefType = 'BELIEF_TO_GLORY_OF_GOD';

UPDATE Language_en_US
SET Text = '+1 [ICON_PEACE] Faith and [ICON_TOURISM] Tourism from [ICON_ARTIST] Artists, [ICON_CIVIL_SERVANT] Civil Servants, and [ICON_MUSICIAN] Musicians. When you expend a [ICON_GREAT_PEOPLE] Great Person, gain 5 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture per City following your Religion (max 30 Cities).'
WHERE Tag = 'TXT_KEY_BELIEF_TO_GLORY_OF_GOD';

-- ancient

INSERT INTO Belief_YieldPerBorderGrowth
	(BeliefType, YieldType, Yield, IsEraScaling)
VALUES
	('BELIEF_UNITY_OF_PROPHETS_ANCIENT', 'YIELD_FAITH', 15, 1),
	('BELIEF_UNITY_OF_PROPHETS_ANCIENT', 'YIELD_CULTURE', 15, 1),
	('BELIEF_UNITY_OF_PROPHETS_ANCIENT', 'YIELD_FOOD', 15, 1);

-- industrial

INSERT INTO Belief_YieldPerConstruction
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL', 'YIELD_GOLD', 8), 
	('BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL', 'YIELD_FAITH', 8);

INSERT INTO Belief_YieldPerGPT
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL', 'YIELD_FOOD', 10);

-- temporary 
INSERT INTO Belief_SpecialistYieldChanges
	(BeliefType, SpecialistType, YieldType, Yield)
SELECT
	'BELIEF_UNITY_OF_PROPHETS_ANCIENT', a.Type, b.Type, 1
FROM Specialists a, Yields b
WHERE a.Type IN ('SPECIALIST_ENGINEER', 'SPECIALIST_WRITER', 'SPECIALIST_CITIZEN')
AND b.Type IN ('YIELD_CULTURE', 'YIELD_FAITH');

INSERT INTO Belief_SpecialistYieldChanges
	(BeliefType, SpecialistType, YieldType, Yield)
SELECT
	'BELIEF_UNITY_OF_PROPHETS', a.Type, b.Type, 1
FROM Specialists a, Yields b
WHERE a.Type IN ('SPECIALIST_ARTIST', 'SPECIALIST_CIVIL_SERVANT', 'SPECIALIST_MUSICIAN')
AND b.Type IN ('YIELD_TOURISM', 'YIELD_FAITH');

INSERT INTO Belief_SpecialistYieldChanges
	(BeliefType, SpecialistType, YieldType, Yield)
SELECT
	'BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL', a.Type, b.Type, 1
FROM Specialists a, Yields b
WHERE a.Type IN ('SPECIALIST_SCIENTIST', 'SPECIALIST_CITIZEN', 'SPECIALIST_MERCHANT')
AND b.Type IN ('YIELD_GOLD', 'YIELD_FAITH');


/* 
NOT WORKING YET

INSERT INTO Belief_SpecificFaithUnitPurchase
	(BeliefType, UnitType)
SELECT
	'BELIEF_UNITY_OF_PROPHETS', Type
FROM Units
WHERE Class IN ('UNITCLASS_MUSICIAN', 'UNITCLASS_ARTIST', 'UNITCLASS_GREAT_DIPLOMAT');

Use [ICON_PEACE] Faith to purchase [ICON_GREAT_ARTIST] Great Artists, [ICON_DIPLOMAT] Great Diplomats, and [ICON_GREAT_MUSICIAN] Great Musicians. 


INSERT INTO Belief_SpecificFaithUnitPurchase
	(BeliefType, UnitType)
SELECT
	'BELIEF_UNITY_OF_PROPHETS_ANCIENT', Type
FROM Units
WHERE Class IN ('UNITCLASS_ENGINEER', 'UNITCLASS_WRITER', 'UNITCLASS_GREAT_GENERAL');

Use [ICON_PEACE] Faith to purchase [ICON_GREAT_ENGINEER] Great Engineers, [ICON_GREAT_WRITER] Great Writers, and [ICON_GREAT_GENERAL] Great Generals. 


INSERT INTO Belief_SpecificFaithUnitPurchase
	(BeliefType, UnitType)
SELECT
	'BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL', Type
FROM Units
WHERE Class IN ('UNITCLASS_SCIENTIST', 'UNITCLASS_GREAT_ADMIRAL', 'UNITCLASS_MERCHANT');

Use [ICON_PEACE] Faith to purchase [ICON_GREAT_SCIENTIST] Great Scientists, [ICON_GREAT_ADMIRAL] Great Admirals, and [ICON_GREAT_MERCHANT] Great Merchants. 


-- compatibility with new great people 
CREATE TRIGGER To_The_Glory_Split
AFTER INSERT ON Units 
WHEN NEW.Special = 'SPECIALUNIT_PEOPLE'
BEGIN
    INSERT INTO Belief_SpecificFaithUnitPurchase (BeliefType, UnitType)
    VALUES (
        CASE 
            WHEN NEW.Class IN ('UNITCLASS_ENGINEER', 'UNITCLASS_WRITER', 'UNITCLASS_GREAT_GENERAL') 
                THEN 'BELIEF_UNITY_OF_PROPHETS_ANCIENT'
            WHEN NEW.Class IN ('UNITCLASS_ARTIST', 'UNITCLASS_GREAT_DIPLOMAT', 'UNITCLASS_MUSICIAN') 
                THEN 'BELIEF_UNITY_OF_PROPHETS'
            WHEN NEW.Class IN ('UNITCLASS_SCIENTIST', 'UNITCLASS_GREAT_ADMIRAL', 'UNITCLASS_MERCHANT') 
                THEN 'BELIEF_UNITY_OF_PROPHETS_ANCIENT'
        END,
        NEW.Type
    );
END;
*/

---------------------------
-- change scaling on GP and improvement/GWork/etc
---------------------------

UPDATE Units SET
    BaseBeakersTurnsToCount = BaseBeakersTurnsToCount * 1.75,  -- rounds down to 5?
    BaseCultureTurnsToCount = BaseCultureTurnsToCount * 1.5,  -- rounds down to 7?
    ScaleFromNumGWs = ScaleFromNumGWs / 3,
    ScaleFromNumThemes = ScaleFromNumThemes / 2;

UPDATE Unit_ScalingFromOwnedImprovements SET
Amount = Amount / 2.5  -- 4 or 2 for celts
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_SCIENTIST');

UPDATE Language_en_US SET
Text = Replace(Text, '10%', '4%')
WHERE Tag = 'TXT_KEY_BUILD_CONSUMED_HELP_ACADEMY';

UPDATE Language_en_US SET
Text = Replace(Text, '10%', '4%')
WHERE Tag = 'TXT_KEY_SPECIALISTSANDGP_GREATSCIENTIST_HEADING3_BODY';

UPDATE Language_en_US SET
Text = Replace(Text, '10%', '4%')
WHERE Tag = 'TXT_KEY_MISSION_DISCOVER_TECH_HELP';

UPDATE Language_en_US SET
Text = Replace(Text, '3%', '1%')
WHERE Tag = 'TXT_KEY_SPECIALISTSANDGP_GREATWRITER_HEADING3_BODY';

UPDATE Language_en_US SET
Text = Replace(Text, '3%', '1%')
WHERE Tag = 'TXT_KEY_MISSION_GIVE_POLICIES_HELP';

UPDATE Language_en_US SET
Text = Replace(Text, '20%', '10%')
WHERE Tag = 'TXT_KEY_MISSION_START_GOLDENAGE_HELP';

-- compatibility with new great people
CREATE TRIGGER GP_Bulb_Scaling
AFTER INSERT ON Units 
WHEN NEW.BaseBeakersTurnsToCount > 0 OR NEW.BaseTurnsForGAPToCount > 0 OR NEW.BaseCultureTurnsToCount > 0
BEGIN
	UPDATE Units SET
	BaseBeakersTurnsToCount = BaseBeakersTurnsToCount * 1.75,  -- rounds down to 5?
	BaseCultureTurnsToCount = BaseCultureTurnsToCount * 1.5,  -- rounds down to 7?
	ScaleFromNumGWs = ScaleFromNumGWs / 3,
	ScaleFromNumThemes = ScaleFromNumThemes / 2
	WHERE Type = NEW.Type;
END;

CREATE TRIGGER GP_Bulb_Scaling_Improvements
AFTER INSERT ON Unit_ScalingFromOwnedImprovements 
WHEN NEW.UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_SCIENTIST') 
BEGIN
	UPDATE Unit_ScalingFromOwnedImprovements SET Amount = 3 WHERE UnitType = NEW.UnitType;
END;