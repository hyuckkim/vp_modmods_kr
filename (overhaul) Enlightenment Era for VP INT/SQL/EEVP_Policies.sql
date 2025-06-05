----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- POLICIES
-- 2018-02-01 Reworked by Infixo from EE & VP-EE mods
----------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------

UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_ENLIGHTENMENT'
WHERE Type IN ('POLICY_BRANCH_RATIONALISM', 'POLICY_BRANCH_EXPLORATION', 'POLICY_BRANCH_COMMERCE');

--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------

-- Creative Expression (Freedom)
INSERT INTO Policy_BuildingClassYieldChanges (PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_GALLERY', YieldType, YieldChange
FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_CREATIVE_EXPRESSION';
/*
-- Military-Industrial Complex (Autocracy)
INSERT INTO Policy_BuildingClassYieldChanges (PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_BASTION', YieldType, YieldChange
FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_MOBILIZATION';
*/
-- Colonialism (Imperialism)
INSERT INTO Policy_BuildingClassYieldChanges (PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_GUNSMITH', YieldType, YieldChange
FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_NAVAL_TRADITION';

INSERT INTO Policy_BuildingClassCultureChanges (PolicyType, BuildingClassType, CultureChange)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_GUNSMITH', CultureChange
FROM Policy_BuildingClassCultureChanges WHERE PolicyType = 'POLICY_NAVAL_TRADITION';

-- Mercantilism (Industry)
INSERT INTO Policy_BuildingClassYieldModifiers (PolicyType, BuildingClassType, YieldType, YieldMod)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_WEIGH_HOUSE', YieldType, YieldMod
FROM Policy_BuildingClassYieldModifiers WHERE PolicyType = 'POLICY_MERCANTILISM';

-- Division of Labor (Industry)
INSERT INTO Policy_BuildingClassYieldModifiers (PolicyType, BuildingClassType, YieldType, YieldMod)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_CLOTH_MILL', YieldType, YieldMod
FROM Policy_BuildingClassYieldModifiers WHERE PolicyType = 'POLICY_TRADE_UNIONS';

-- Ceremony (Tradition)
INSERT INTO Policy_BuildingClassHappiness (PolicyType, BuildingClassType, Happiness)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_SUMMER_PALACE', Happiness
FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_LEGALISM';

-- Creative Expression (Freedom)
-- Update belief text
UPDATE Language_en_US
SET Text = REPLACE(Text, 'Museums, Broadcast Towers,', 'Museums, Galleries, Broadcast Towers,')
WHERE Tag = 'TXT_KEY_POLICY_CREATIVE_EXPRESSION_HELP';

-- Military-Industrial Complex
-- TXT_KEY_POLICY_MOBILIZATION_HELP - no need to change, uses "Defense Buildings" phrase

-- Division of Labor
UPDATE Language_en_US
SET Text = REPLACE(Text, 'Workshops, Factories,', 'Workshops, Cloth Mills, Factories,')
WHERE Tag = 'TXT_KEY_POLICY_TRADE_UNIONS_HELP';

-- Mercantilism (Industry)
UPDATE Language_en_US
SET Text = REPLACE(Text, 'Banks, and Stock Exchanges', 'Banks, Weigh Houses, and Stock Exchanges')
WHERE Tag = 'TXT_KEY_POLICY_MERCANTILISM_HELP';

-- Colonialism (Naval Tradition)
UPDATE Language_en_US
SET Text = REPLACE(Text, 'Armories, Military Academies,', 'Armories, Gunsmiths, Military Academies,')
WHERE Tag = 'TXT_KEY_POLICY_NAVAL_TRADITION_HELP';