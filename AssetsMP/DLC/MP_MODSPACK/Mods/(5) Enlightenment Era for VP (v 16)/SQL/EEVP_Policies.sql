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
-- Policies
--------------------------------------------------------------------------------------------------------------------------
-- Colonialism (Imperialism)
INSERT INTO Policy_BuildingClassYieldChanges (PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_GUNSMITH', YieldType, YieldChange
FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_NAVAL_TRADITION';

INSERT INTO Policy_BuildingClassCultureChanges (PolicyType, BuildingClassType, CultureChange)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_GUNSMITH', CultureChange
FROM Policy_BuildingClassCultureChanges WHERE PolicyType = 'POLICY_NAVAL_TRADITION';

-- right now, 3% extra i think is too much for the tree (its too much already anyway)
-- Mercantilism (Industry)
--INSERT INTO Policy_BuildingClassYieldModifiers (PolicyType, BuildingClassType, YieldType, YieldMod)
--SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_WEIGH_HOUSE', YieldType, YieldMod
--FROM Policy_BuildingClassYieldModifiers WHERE PolicyType = 'POLICY_MERCANTILISM';

-- Division of Labor (Industry)
--INSERT INTO Policy_BuildingClassYieldModifiers (PolicyType, BuildingClassType, YieldType, YieldMod)
--SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_CLOTH_MILL', YieldType, YieldMod
--FROM Policy_BuildingClassYieldModifiers WHERE PolicyType = 'POLICY_TRADE_UNIONS';

-- Ceremony (Tradition)	
INSERT INTO Policy_BuildingClassHappiness (PolicyType, BuildingClassType, Happiness)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_EE_SUMMER_PALACE', Happiness
FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_LEGALISM';
