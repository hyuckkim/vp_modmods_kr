UPDATE Units SET 
Moves = 2
WHERE CombatClass = 'UNITCOMBAT_RECON';

UPDATE Units SET
Moves = 3
WHERE Type = 'UNIT_SPANISH_CONQUISTADOR';

UPDATE Units SET
Combat = Combat + 2
WHERE Class = 'UNITCLASS_SCOUT';

UPDATE Units SET
Combat = Combat + 2
WHERE Class = 'UNITCLASS_EXPLORER';

UPDATE Units SET
Combat = Combat + 3
WHERE Class = 'UNITCLASS_COMMANDO';

UPDATE Units SET
Combat = Combat + 4
WHERE Class = 'UNITCLASS_PARATROOPER';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
SELECT
	Type, 'PROMOTION_ROUGH_WALKER'
FROM Units WHERE CombatClass = 'UNITCOMBAT_RECON';


-- and tech trade at navigation. it's so late atm
UPDATE Technologies SET MapTrading = 0 WHERE Type = 'TECH_MILITARY_SCIENCE';

UPDATE Technologies SET MapTrading = 1 WHERE Type = 'TECH_NAVIGATION';