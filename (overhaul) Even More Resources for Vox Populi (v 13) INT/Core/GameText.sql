--==========================================================================================================================
-- GAME TEXT
--==========================================================================================================================
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------
-- Update policy text
UPDATE Language_en_US
SET Text = REPLACE(Text, 'Yield and [ICON_GOLDEN_AGE] Golden Age duration', 'Yield, [ICON_GOLDEN_AGE] Golden Age duration, [ICON_GREAT_PEOPLE] Great Person generation, and [ICON_STRENGTH] Combat')
WHERE Tag = 'TXT_KEY_POLICY_NAVAL_TRADITION_HELP';

-- Update belief text
UPDATE Language_en_US
SET Text = REPLACE(Text, '[ICON_RES_WHEAT] Wheat', 'improved resources')
WHERE Tag = 'TXT_KEY_BELIEF_SUN_GOD';

-- Windmills
UPDATE Language_en_US
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_LAVENDER] Lavender: +3 [ICON_CULTURE] Culture.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL' AND ((Type = 'BUILDING_WINDMILL' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Herbalists
UPDATE Language_en_US
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_OBSIDIAN] Obsidian: +2 [ICON_PEACE] Faith.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HERBALIST' AND ((Type = 'BUILDING_HERBALIST' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Public Schools
UPDATE Language_en_US
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_PLATINUM] Platinum: +3 [ICON_RESEARCH] Science.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PUBLIC_SCHOOL' AND ((Type = 'BUILDING_PUBLIC_SCHOOL' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Gardens
UPDATE Language_en_US
SET Text = Text || '[NEWLINE]Nearby [ICON_RES_POPPY] Poppy: +2 [ICON_RESEARCH] Science.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GARDEN' AND ((Type = 'BUILDING_GARDEN' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Forges
UPDATE Language_en_US
SET Text = Text || '[NEWLINE]Nearby [ICON_RES_TIN] Tin: +1 [ICON_PRODUCTION] Production, +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_LEAD] Lead: +2 [ICON_PRODUCTION] Production.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FORGE' AND ((Type = 'BUILDING_FORGE' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Workshops
UPDATE Language_en_US
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_COCONUT] Coconut: +2 [ICON_PRODUCTION] Production.[NEWLINE]Nearby [ICON_RES_HARDWOOD] Hardwood: +1 [ICON_PRODUCTION] Production, +1 [ICON_GOLD] Gold.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP' AND ((Type = 'BUILDING_WORKSHOP' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Granaries
UPDATE Language_en_US
SET Text = REPLACE(Text, 'Nearby [ICON_RES_WHEAT] Wheat: +1 [ICON_FOOD] Food.', 'Nearby [ICON_RES_WHEAT] Wheat: +1 [ICON_GOLD] Gold.')
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GRANARY' AND ((Type = 'BUILDING_GRANARY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Grocers
UPDATE Language_en_US
SET Text = REPLACE(Text, '[NEWLINE][NEWLINE]Requires an Aqueduct in the City.','[NEWLINE]Nearby [ICON_RES_POTATO] Potato: +2 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_PINEAPPLE] Pineapple: +3 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires an Aqueduct in the City.')
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER' AND ((Type = 'BUILDING_GROCER' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Factories
UPDATE Language_en_US
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_RUBBER] Rubber: +3 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_SULFUR] Sulfur: +3 [ICON_PRODUCTION] Production.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FACTORY' AND ((Type = 'BUILDING_FACTORY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Research Labs
UPDATE Language_en_US
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_ALUMINUM] Aluminum: +4 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_URANIUM] Uranium: +4 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_TITANIUM] Titanium: +1 [ICON_PRODUCTION] Production, +3 [ICON_RESEARCH] Science.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_LABORATORY' AND ((Type = 'BUILDING_LABORATORY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

UPDATE Language_en_US
SET Text = REPLACE(Text, '[ICON_RES_ALUMINUM] Aluminum, [ICON_RES_URANIUM] Uranium, and ', '')
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_LABORATORY' AND ((Type = 'BUILDING_LABORATORY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Markets
UPDATE Language_en_US
SET Text = Text || '[NEWLINE]Nearby [ICON_RES_PINEAPPLE] Pineapple: +2 [ICON_GOLD] Gold.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MARKET' AND ((Type = 'BUILDING_MARKET' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Councils
UPDATE Language_en_US
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_MAIZE] Maize: +1 [ICON_PRODUCTION] Production.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROVE' AND ((Type = 'BUILDING_GROVE' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Watermills
UPDATE Language_en_US
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_POTATO] Potato: +1 [ICON_FOOD] Food.[NEWLINE]Nearby [ICON_RES_RICE] Rice: +1 [ICON_FOOD] Food.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WATERMILL' AND ((Type = 'BUILDING_WATERMILL' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Well
UPDATE Language_en_US
SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_POTATO] Potato: +1 [ICON_FOOD] Food.[NEWLINE]Nearby [ICON_RES_RICE] Rice: +1 [ICON_FOOD] Food.'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WELL' AND ((Type = 'BUILDING_WELL' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

-- Compatibility (with custom civs, 4UC, etc)
-- Disabled because of load order issues.
---- The trigger can only work if mods update Language_en_US before Civilization_BuildingClassOverrides, otherwise the trigger breaks.
/*CREATE TRIGGER EvenMoreResourcesForVP_BuildingResourceYieldsText
AFTER INSERT ON Civilization_BuildingClassOverrides 
WHEN NEW.BuildingClassType
IN(
	SELECT b.BuildingClass
	FROM Buildings b, Resources r, Building_ResourceYieldChanges ryc
	WHERE r.Type IN('RESOURCE_LAVENDER', 'RESOURCE_OBSIDIAN', 'RESOURCE_PLATINUM', 'RESOURCE_POPPY', 'RESOURCE_TIN', 'RESOURCE_COCONUT', 'RESOURCE_HARDWOOD', 'RESOURCE_LEAD', 'RESOURCE_MAIZE', 'RESOURCE_PINEAPPLE', 'RESOURCE_POTATO', 'RESOURCE_RICE', 'RESOURCE_RUBBER', 'RESOURCE_SULFUR', 'RESOURCE_TITANIUM')
	AND ryc.ResourceType = r.Type
	AND b.Type = ryc.BuildingType
)
BEGIN
	-- Windmills
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_LAVENDER] Lavender: +3 [ICON_CULTURE] Culture.'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL' AND Type = NEW.BuildingType);

	-- Herbalists
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_OBSIDIAN] Obsidian: +2 [ICON_PEACE] Faith.'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HERBALIST' AND Type = NEW.BuildingType);

	-- Public Schools
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_PLATINUM] Platinum: +3 [ICON_RESEARCH] Science.'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PUBLIC_SCHOOL' AND Type = NEW.BuildingType);

	-- Gardens
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE]Nearby [ICON_RES_POPPY] Poppy: +2 [ICON_RESEARCH] Science.'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GARDEN' AND Type = NEW.BuildingType);

	-- Forges
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE]Nearby [ICON_RES_TIN] Tin: +1 [ICON_PRODUCTION] Production, +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_LEAD] Lead: +2 [ICON_PRODUCTION] Production.'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FORGE' AND Type = NEW.BuildingType);

	-- Workshops
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_COCONUT] Coconut: +2 [ICON_PRODUCTION] Production.[NEWLINE]Nearby [ICON_RES_HARDWOOD] Hardwood: +1 [ICON_PRODUCTION] Production, +1 [ICON_GOLD] Gold.'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP' AND Type = NEW.BuildingType);

	-- Granaries
	UPDATE Language_en_US
	SET Text = REPLACE(Text, 'Nearby [ICON_RES_WHEAT] Wheat: +1 [ICON_FOOD] Food.', 'Nearby [ICON_RES_WHEAT] Wheat: +1 [ICON_GOLD] Gold.')
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GRANARY' AND Type = NEW.BuildingType);

	-- Grocers
	UPDATE Language_en_US
	SET Text = REPLACE(Text, '[NEWLINE][NEWLINE]Requires an Aqueduct in the City.','[NEWLINE]Nearby [ICON_RES_POTATO] Potato: +2 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_PINEAPPLE] Pineapple: +3 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires an Aqueduct in the City.')
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER' AND Type = NEW.BuildingType);

	-- Factories
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_RUBBER] Rubber: +3 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_SULFUR] Sulfur: +3 [ICON_PRODUCTION] Production.'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FACTORY' AND Type = NEW.BuildingType);

	-- Research Labs
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE]Nearby [ICON_RES_TITANIUM] Titanium: +1 [ICON_PRODUCTION] Production, +3 [ICON_RESEARCH] Science.'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_LABORATORY' AND Type = NEW.BuildingType);

	-- Markets
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE]Nearby [ICON_RES_PINEAPPLE] Pineapple: +2 [ICON_GOLD] Gold.'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MARKET' AND Type = NEW.BuildingType);

	-- Councils
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_MAIZE] Maize: +1 [ICON_PRODUCTION] Production.'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROVE' AND Type = NEW.BuildingType);

	-- Watermills
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_POTATO] Potato: +1 [ICON_FOOD] Food.[NEWLINE]Nearby [ICON_RES_RICE] Rice: +1 [ICON_FOOD] Food.'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WATERMILL' AND Type = NEW.BuildingType);

	-- Well
	UPDATE Language_en_US
	SET Text = Text || '[NEWLINE][NEWLINE]Nearby [ICON_RES_POTATO] Potato: +1 [ICON_FOOD] Food.[NEWLINE]Nearby [ICON_RES_RICE] Rice: +1 [ICON_FOOD] Food.'
	WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WELL' AND Type = NEW.BuildingType);
END;*/