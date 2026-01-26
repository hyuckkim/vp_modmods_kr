-----------------------------------
-- EE Compatibility 
-----------------------------------
-- need to reassign the base class
UPDATE Buildings SET
BuildingClass = 'BUILDINGCLASS_EE_MANOR' 
WHERE Type = 'BUILDING_CD_DWOR' AND EXISTS (SELECT 1 FROM Buildings WHERE Type = 'BUILDING_EE_MANOR');

--------------------
-- Buildings columns
--------------------
UPDATE Buildings SET 
Cost = (
    SELECT b.Cost
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
FaithCost = (
    SELECT b.FaithCost
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
GoldMaintenance = (
    SELECT b.GoldMaintenance
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
PrereqTech = (
    SELECT b.PrereqTech
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
HurryCostModifier = (
    SELECT b.HurryCostModifier
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
ConquestProb = (
    SELECT b.ConquestProb
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
NukeImmune = (
    SELECT b.NukeImmune
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
NeverCapture = (
    SELECT b.NeverCapture
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
Happiness = (
    SELECT b.Happiness
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
WLTKDTurns = (
    SELECT b.WLTKDTurns
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
BoredomFlatReduction = (
    SELECT b.BoredomFlatReduction
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
DistressFlatReduction = (
    SELECT b.DistressFlatReduction
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
IlliteracyFlatReduction = (
    SELECT b.IlliteracyFlatReduction
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
PovertyFlatReduction = (
    SELECT b.PovertyFlatReduction
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
NoUnhappfromXSpecialists = (
    SELECT b.NoUnhappfromXSpecialists
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
SpecialistType = (
    SELECT b.SpecialistType
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
SpecialistCount = (
    SELECT b.SpecialistCount
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
SpySecurityModifier = (
    SELECT b.SpySecurityModifier
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
SpySecurityModifierPerXPop = (
    SELECT b.SpySecurityModifierPerXPop
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
BuildingProductionModifier = (
    SELECT b.BuildingProductionModifier
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
FoodKept = (
    SELECT b.FoodKept
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
MinorFriendshipChange = (
    SELECT b.MinorFriendshipChange
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
GreatWorksTourismModifier = (
    SELECT b.GreatWorksTourismModifier
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
TradeRouteRecipientBonus = (
    SELECT b.TradeRouteRecipientBonus
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
TradeRouteTargetBonus = (
    SELECT b.TradeRouteTargetBonus
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
GreatWorkSlotType = (
    SELECT b.GreatWorkSlotType
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
GreatWorkCount = (
    SELECT b.GreatWorkCount
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
TrainedFreePromotion = (
    SELECT b.TrainedFreePromotion
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
CitySupplyModifier = (
    SELECT b.CitySupplyModifier
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
ExtraCityHitPoints = (
    SELECT b.ExtraCityHitPoints
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
Defense = (
    SELECT b.Defense
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
),
ReligiousPressureModifier = (
    SELECT b.ReligiousPressureModifier
    FROM Buildings AS b
    JOIN BuildingClasses AS bc ON bc.DefaultBuilding = b.Type
    WHERE bc.Type = Buildings.BuildingClass
    LIMIT 1
)
WHERE IconAtlas = 'CD_ECONOMIC_ATLAS';

----------------
-- Prereq Classes
----------------
INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
SELECT
	a.Type, b.BuildingClassType
FROM Buildings a, Building_ClassesNeededInCity b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

----------------
-- Yield Changes
----------------
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
SELECT
	a.Type, b.YieldType, b.Yield
FROM Buildings a, Building_YieldChanges b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

-------------------------
-- Resource Yield Changes
-------------------------
INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
SELECT
	a.Type, b.ResourceType, b.YieldType, b.Yield
FROM Buildings a, Building_ResourceYieldChanges b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

--------------------
-- Pop Yield Changes
--------------------
INSERT INTO Building_YieldChangesPerPop
	(BuildingType, YieldType, Yield)
SELECT
	a.Type, b.YieldType, b.Yield
FROM Buildings a, Building_YieldChangesPerPop b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

------------------------------
-- Building Yield Changes Local
-------------------------------
INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	a.Type, b.BuildingClassType, b.YieldType, b.YieldChange
FROM Buildings a, Building_BuildingClassLocalYieldChanges b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

------------------------------
-- Building Yield Changes Global
-------------------------------
INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	a.Type, b.BuildingClassType, b.YieldType, b.YieldChange
FROM Buildings a, Building_BuildingClassYieldChanges b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

----------------------------
-- Improvement Yield Changes
----------------------------
INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
SELECT
	a.Type, b.ImprovementType, b.YieldType, b.Yield
FROM Buildings a, Building_ImprovementYieldChanges b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

----------------------------
-- Lake Yield Changes
----------------------------
INSERT INTO Building_LakePlotYieldChanges
	(BuildingType, YieldType, Yield)
SELECT
	a.Type, b.YieldType, b.Yield
FROM Buildings a, Building_LakePlotYieldChanges b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

----------------------------
-- Feature Yield Changes
----------------------------
INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	a.Type, b.FeatureType, b.YieldType, b.Yield
FROM Buildings a, Building_FeatureYieldChanges b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

----------------------------
-- Yield from Yield Changes
----------------------------
INSERT INTO Building_YieldFromYieldPercent
	(BuildingType, YieldIn, YieldOut, Value)
SELECT
	a.Type, b.YieldIn, b.YieldOut, b.Value
FROM Buildings a, Building_YieldFromYieldPercent b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

----------------------------
-- Free Resources
----------------------------
INSERT INTO Building_ResourceQuantity
	(BuildingType, ResourceType, Quantity)
SELECT
	a.Type, b.ResourceType, b.Quantity
FROM Buildings a, Building_ResourceQuantity b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

----------------------------
-- Yields if themed
----------------------------
INSERT INTO Building_ThemingYieldBonus
	(BuildingType, YieldType, Yield)
SELECT
	a.Type, b.YieldType, b.Yield
FROM Buildings a, Building_ThemingYieldBonus b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

-----------------------
-- instant yields
-----------------------
INSERT INTO Building_InstantYield
	(BuildingType, YieldType, Yield)
SELECT
	a.Type, b.YieldType, b.Yield
FROM Buildings a, Building_InstantYield b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

--------------------------------	
-- Building_FreeUnits
--------------------------------
INSERT INTO Building_FreeUnits
	(BuildingType, UnitType, NumUnits)
SELECT
	a.Type, b.UnitType, b.NumUnits
FROM Buildings a, Building_FreeUnits b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

---------------------------
-- Building_WLTKDYieldMod 
---------------------------
INSERT INTO Building_WLTKDYieldMod
	(BuildingType, YieldType, Yield)
SELECT
	a.Type, b.YieldType, b.Yield
FROM Buildings a, Building_WLTKDYieldMod b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

-------------------------
-- Building_YieldModifiers
-------------------------
INSERT INTO Building_YieldModifiers
	(BuildingType, YieldType, Yield)
SELECT
	a.Type, b.YieldType, b.Yield
FROM Buildings a, Building_YieldModifiers b, BuildingClasses bc 
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;

-------------------
-- flavors
-------------------
INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
SELECT
	a.Type, b.FlavorType, b.Flavor * 2
FROM Buildings a, Building_Flavors b, BuildingClasses bc
WHERE
a.IconAtlas = 'CD_ECONOMIC_ATLAS' AND
b.BuildingType = bc.DefaultBuilding AND bc.Type = a.BuildingClass;


	




