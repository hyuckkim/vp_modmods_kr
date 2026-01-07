--------------------
-- Unit columns
--------------------
UPDATE Units SET 
Cost = (
    SELECT b.Cost
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
Domain = (
    SELECT b.Domain
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
Combat = (
    SELECT b.Combat
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
CombatClass = (
    SELECT b.CombatClass
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
RangedCombat = (
    SELECT b.RangedCombat
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
FaithCost = (
    SELECT b.FaithCost
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
GlobalFaithPurchaseCooldown = (
    SELECT b.GlobalFaithPurchaseCooldown
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
Moves = (
    SELECT b.Moves
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
Range = (
    SELECT b.Range
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
BaseSightRange = (
    SELECT b.BaseSightRange
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
Special = (
    SELECT b.Special
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
Domain = (
    SELECT b.Domain
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
CivilianAttackPriority = (
    SELECT b.CivilianAttackPriority
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
DefaultUnitAI = (
    SELECT b.DefaultUnitAI
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
MilitarySupport = (
    SELECT b.MilitarySupport
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
MilitaryProduction = (
    SELECT b.MilitaryProduction
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
Pillage = (
    SELECT b.Pillage
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
PrereqTech = (
    SELECT b.PrereqTech
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
MinAreaSize = (
    SELECT b.MinAreaSize
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
WorkRate = (
    SELECT b.WorkRate
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
MoveRate = (
    SELECT b.MoveRate
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
BaseLandAirDefense = (
    SELECT b.BaseLandAirDefense
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
PurchaseCooldown = (
    SELECT b.PurchaseCooldown
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
IsMounted = (
    SELECT b.IsMounted
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
RequiresFaithPurchaseEnabled = (
    SELECT b.RequiresFaithPurchaseEnabled
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
),
Mechanized = (
    SELECT b.Mechanized
    FROM Units AS b
    JOIN UnitClasses AS bc ON bc.DefaultUnit = b.Type
    WHERE bc.Type = Units.Class
    LIMIT 1
)
WHERE IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS');

-----------------------
-- class upgrade 
-----------------------
INSERT INTO Unit_ClassUpgrades
	(UnitType, UnitClassType)
SELECT
	a.Type, b.UnitClassType
FROM Units a, Unit_ClassUpgrades b, UnitClasses bc
WHERE
a.IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS') AND
b.UnitType = bc.DefaultUnit AND bc.Type = a.Class;

-- now we can also set obsolete techs
UPDATE Units SET
ObsoleteTech = (SELECT a.ObsoleteTech FROM Units a, Unit_ClassUpgrades b, UnitClasses c WHERE b.UnitType=Units.Type and b.UnitClassType=c.Type and c.DefaultUnit=a.Type),
GoodyHutUpgradeUnitClass = (SELECT UnitClassType FROM Unit_ClassUpgrades WHERE UnitType = Units.Type)
WHERE IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS');

----------------
-- AI types
----------------
INSERT INTO Unit_AITypes
	(UnitType, UnitAIType)
SELECT
	a.Type, b.UnitAIType
FROM Units a, Unit_AITypes b, UnitClasses bc
WHERE
a.IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS') AND
b.UnitType = bc.DefaultUnit AND bc.Type = a.Class;

----------------
-- free promos
----------------
INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
SELECT
	a.Type, b.PromotionType
FROM Units a, Unit_FreePromotions b, UnitClasses bc
WHERE
a.IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS') AND
b.UnitType = bc.DefaultUnit AND bc.Type = a.Class;

------------------------
-- building purchase req
------------------------
INSERT INTO Unit_BuildingClassPurchaseRequireds
	(UnitType, BuildingClassType)
SELECT
	a.Type, b.BuildingClassType
FROM Units a, Unit_BuildingClassPurchaseRequireds b, UnitClasses bc
WHERE
a.IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS') AND
b.UnitType = bc.DefaultUnit AND bc.Type = a.Class LIMIT 1 ;

---------------
-- unit builds
---------------
INSERT INTO Unit_Builds
	(UnitType, BuildType)
SELECT
	a.Type, b.BuildType
FROM Units a, Unit_Builds b, UnitClasses bc
WHERE
a.IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS') AND
b.UnitType = bc.DefaultUnit AND bc.Type = a.Class;

-----------------
-- resource costs
-----------------
INSERT INTO Unit_ResourceQuantityRequirements
	(UnitType, ResourceType, Cost)
SELECT
	a.Type, b.ResourceType, b.Cost
FROM Units a, Unit_ResourceQuantityRequirements b, UnitClasses bc
WHERE
a.IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS') AND
b.UnitType = bc.DefaultUnit AND bc.Type = a.Class;

-------------------
-- flavors
-------------------
INSERT INTO Unit_Flavors
	(UnitType, FlavorType, Flavor)
SELECT
	a.Type, b.FlavorType, b.Flavor * 2
FROM Units a, Unit_Flavors b, UnitClasses bc
WHERE
a.IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS') AND
b.UnitType = bc.DefaultUnit AND bc.Type = a.Class;

----------------
-- scripts
----------------
INSERT INTO UnitGameplay2DScripts 
	(UnitType, SelectionSound, FirstSelectionSound)
SELECT
	a.Type, b.SelectionSound, b.FirstSelectionSound
FROM Units a, UnitGameplay2DScripts  b, UnitClasses bc
WHERE
a.IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS') AND
b.UnitType = bc.DefaultUnit AND bc.Type = a.Class;


