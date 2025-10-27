INSERT INTO BuildingClasses 	
	(Type,		DefaultBuilding,	Description)
VALUES		
	('BUILDINGCLASS_ORPHANAGE',	'BUILDING_ORPHANAGE',	 'TXT_KEY_BUILDING_ORPHANAGE');

INSERT INTO Buildings
	(Type,		Description,	Civilopedia,	Strategy,	Help,	
	GoldMaintenance, Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb,
	BuildingClass,	ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_ORPHANAGE',	'TXT_KEY_BUILDING_ORPHANAGE', 	'TXT_KEY_BUILDING_ORPHANAGE_TEXT', 'TXT_KEY_BUILDING_ORPHANAGE_STRATEGY',	'TXT_KEY_BUILDING_ORPHANAGE_HELP',	
	6, 		1250, -20, 	-1, 	80,
	'BUILDINGCLASS_ORPHANAGE', 'ART_DEF_BUILDING_MARKET', 'TECH_INDUSTRIALIZATION', 34, 'CORP2_ATLAS');

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_ORPHANAGE', 'YIELD_GOLDEN_AGE_POINTS', 1);

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	Type, 'BUILDINGCLASS_ORPHANAGE', 'YIELD_GOLD', 2
FROM Buildings WHERE Cost = -1 AND FaithCost > 0;

-- strong compatibility
CREATE TRIGGER OrphanageFaithBonus
AFTER INSERT ON Buildings WHEN NEW.FaithCost > 0 AND NEW.Cost = -1
BEGIN
	INSERT INTO Building_BuildingClassLocalYieldChanges
		(BuildingType, BuildingClassType, YieldType, YieldChange)
	SELECT
		NEW.Type, 'BUILDINGCLASS_ORPHANAGE', 'YIELD_GOLD', 2;
END;

INSERT INTO Building_BuildingClassLocalYieldChanges
    (BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	'BUILDING_ORPHANAGE', a.BuildingClass, b.Type, 3
FROM Buildings a, Yields b
WHERE a.Type IN ('BUILDING_FACTORY', 'BUILDING_STOCKYARD', 'BUILDING_SEAPORT')
AND b.Type IN ('YIELD_PRODUCTION');

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_ORPHANAGE', 'YIELD_FAITH', 25);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_ORPHANAGE', 'IMPROVEMENT_ACADEMY', 	            'YIELD_GOLD', 2),
	('BUILDING_ORPHANAGE', 'IMPROVEMENT_CUSTOMS_HOUSE',  	    'YIELD_FOOD', 4),
	('BUILDING_ORPHANAGE', 'IMPROVEMENT_MANUFACTORY', 	    'YIELD_PRODUCTION', 3);

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_ORPHANAGE', 'FLAVOR_RELIGION', 10),
	('BUILDING_ORPHANAGE', 'FLAVOR_GROWTH', 10),
	('BUILDING_ORPHANAGE', 'FLAVOR_GOLD', 5),
	('BUILDING_ORPHANAGE', 'FLAVOR_PRODUCTION', 5);

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	
	('TXT_KEY_BUILDING_ORPHANAGE',		'Orphanage'),
	('TXT_KEY_BUILDING_ORPHANAGE_TEXT',	'An orphanage is a residential institution devoted to the care of children who, for various reasons, cannot be cared by their biological families. The parents may be deceased, absent, or abusive. Orphanages existed in antiquity, with Athenian law supporting all orphans of those killed in military service until the age of eighteen. Over time the duty was taken up by religious groups. The growth of sentimental philanthropy in the 18th century led to the establishment of the first charitable institutions that would cater to orphans.[NEWLINE][NEWLINE]By the early nineteenth century, the problem of abandoned children in urban areas, especially London, began to reach alarming proportions. The workhouse system, instituted in 1834, although often brutal, was an attempt at the time to house orphans as well as other vulnerable people in society who could not support themselves in exchange for work. Common jobs saw children performing difficult and hazardous tasks, including labor in textile mills, coal mines, on farms, and as low-ranking urban services such as chimney sweeps. Government-run orphanages have been phased out in most developed countries during the latter half of the 20th century but continue to operate in many other regions internationally.'),
	('TXT_KEY_BUILDING_ORPHANAGE_STRATEGY',	'The Orphanage is a niche piece of infrastructure that offers many small bonuses that may not always justify its immediate construction. In developed Cities, your child labor can be put to good use, but it won''t necessarily be common to have all three of the boosted buildings, as they all have requirements. To pay for the maintenance costs you can look to Religion but, again, you won''t always be able to muster the support your kids deserve. Cities with Great Person Tile improvements also benefit, so in a City with many Academies, for example, an Orphanage is a sound investment.[NEWLINE][NEWLINE]The final niche use of the Orphanage is for its Faith boosting effects. Only a City with strong Faith that can also grow will gain a meaningful benefit from the Orphanage so, again, be careful.'),
	('TXT_KEY_BUILDING_ORPHANAGE_HELP', '25% of the [ICON_PEACE] Faith output of the City is added as an instant boost whenever a [ICON_CITIZEN] Citizen is born in this City. +4 [ICON_FOOD] Food from Towns. Factories, Agribusinesses, Seaports, and Manufactories in the City gain +3 [ICON_PRODUCTION] Production. +2 [ICON_GOLD] Gold from Academies and every Building in the City that must be purchased with [ICON_PEACE] Faith.');


