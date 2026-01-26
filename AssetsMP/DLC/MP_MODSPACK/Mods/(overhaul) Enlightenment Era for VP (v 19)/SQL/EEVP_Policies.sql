----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- POLICIES
-- 2018-02-01 Reworked by Infixo from EE & VP-EE mods
-- 2023-09-22 Updated by CAYM to be compatible with VP 3.10
-- 2023-11-06 Updated by CAYM to be compatible with VP 4.2.7
----------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------

UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_ENLIGHTENMENT'
WHERE Type IN ('POLICY_BRANCH_RATIONALISM', 'POLICY_BRANCH_EXPLORATION', 'POLICY_BRANCH_COMMERCE');

--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------

-- Ceremony (Tradition)	
INSERT INTO Policy_BuildingClassHappiness (PolicyType, BuildingClassType, Happiness)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_SUMMER_PALACE', Happiness
FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_LEGALISM';

-- Colonialism (Imperialism)
INSERT INTO Policy_BuildingClassYieldChanges (PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_GUNSMITH', YieldType, YieldChange
FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_NAVAL_TRADITION';

INSERT INTO Policy_BuildingClassCultureChanges (PolicyType, BuildingClassType, CultureChange)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_GUNSMITH', CultureChange
FROM Policy_BuildingClassCultureChanges WHERE PolicyType = 'POLICY_NAVAL_TRADITION';

-- Colonialism (Naval Tradition)
UPDATE Language_en_US
SET Text = REPLACE(Text, 'Barracks, Armories, Military Academies, ', 'Barracks, Armories, Gunsmiths, Military Academies, ')
WHERE Tag = 'TXT_KEY_POLICY_NAVAL_TRADITION_HELP';

-- right now, 3% extra i think is too much for the tree (its too much already anyway)
-- Mercantilism (Industry)
--INSERT INTO Policy_BuildingClassYieldModifiers (PolicyType, BuildingClassType, YieldType, YieldMod)
--SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_WEIGH_HOUSE', YieldType, YieldMod
--FROM Policy_BuildingClassYieldModifiers WHERE PolicyType = 'POLICY_MERCANTILISM';

-- Division of Labor (Industry)
--INSERT INTO Policy_BuildingClassYieldModifiers (PolicyType, BuildingClassType, YieldType, YieldMod)
--SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_CLOTH_MILL', YieldType, YieldMod
--FROM Policy_BuildingClassYieldModifiers WHERE PolicyType = 'POLICY_TRADE_UNIONS';

-- Division of Labor
--UPDATE Language_en_US
--SET Text = REPLACE(Text, 'Workshops, Factories,', 'Workshops, Cloth Mills, Factories,')
--WHERE Tag = 'TXT_KEY_POLICY_TRADE_UNIONS_HELP';

-- Mercantilism (Industry)
--UPDATE Language_en_US
--SET Text = REPLACE(Text, 'Banks, and Stock Exchanges', 'Banks, Weigh Houses, and Stock Exchanges')
--WHERE Tag = 'TXT_KEY_POLICY_MERCANTILISM_HELP';

-------------------------------------
-- rename Humanism + text due to new tech
--------------------------------------

UPDATE Language_en_US
SET Text = 'Patronage'
WHERE Tag = 'TXT_KEY_POLICY_CULTURAL_CENTERS';

UPDATE Language_en_US
SET Text = Replace(Text, 'Humanism', 'Patronage')
WHERE Tag = 'TXT_KEY_POLICY_CULTURAL_CENTERS_HELP';

--- from old statecraft description
UPDATE Language_en_US
SET Text = 'Patronage is the policy where the wealthy and powerful - often the nobility - support the talented artisans in a society. In many ancient societies, a society''s wealth was concentrated in a few individuals: the Royal Family, say, or the merchant princes. Painters, sculptors, musicians, and other gifted artists worked for the elite, as they were the only ones who could afford to pay them. While perhaps unfair to commoners, this system has produced brilliant works by the likes of Leonardo da Vinci, Ben Jonson, and Mozart. The system is enjoying something of a revival today, with the role of patron being taken by mega-corporations rather than individuals.'
WHERE Tag = 'TXT_KEY_POLICY_CULTURAL_CENTERS_TEXT';

-- old
--Humanism is a philosophical and ethical stance that emphasizes the value and agency of human beings, individually and collectively, and generally prefers critical thinking and evidence (rationalism, empiricism) over established doctrine or faith (fideism). The meaning of the term humanism has fluctuated, according to the successive intellectual movements which have identified with it. Generally, however, humanism refers to a perspective that affirms some notion of a "human nature" (sometimes contrasted with antihumanism).
