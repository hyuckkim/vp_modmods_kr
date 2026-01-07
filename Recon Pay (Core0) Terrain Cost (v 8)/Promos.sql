DELETE FROM Unit_FreePromotions
        WHERE PromotionType="PROMOTION_IGNORE_TERRAIN_COST" AND UnitType IN (SELECT Type FROM Units 
        WHERE CombatClass='UNITCOMBAT_RECON' AND Domain = 'DOMAIN_LAND');

UPDATE Units
SET Moves = 2
WHERE Class = 'UNITCLASS_SCOUT' OR Class = 'UNITCLASS_PATHFINDER';

UPDATE UnitPromotions
SET CannotBeChosen = 1
WHERE Type = 'PROMOTION_IGNORE_TERRAIN_COST';

UPDATE UnitPromotions_Terrains
SET IgnoreTerrainCostFrom = 1, IgnoreTerrainCostIn = 0
WHERE IgnoreTerrainCostIn = 1 AND PromotionType LIKE 'PROMOTION%TRAILBLAZER__';

UPDATE UnitPromotions_Features
SET IgnoreTerrainCostFrom = 1, IgnoreTerrainCostIn = 0
WHERE IgnoreTerrainCostIn = 1 AND PromotionType LIKE 'PROMOTION%TRAILBLAZER__';