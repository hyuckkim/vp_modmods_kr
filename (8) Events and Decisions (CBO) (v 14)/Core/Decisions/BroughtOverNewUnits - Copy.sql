-- Great Galleass
UPDATE Language_en_US
SET Text = 'The Great Galleass can only be gifted by Minor Civilizations or unlocked for Venice through the ''Found the Arsenale'' Decision.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_VENETIAN_GALLEASS';
UPDATE Language_en_US
SET Text = 'The Great Galleass is can only be gifted by Minor Civilizations or unlocked for Venice through the ''Found the Arsenale'' Decision. Has a stronger ranged attack, and is more resilient in battle.'
WHERE Tag = 'TXT_KEY_UNIT_VENETIAN_GALLEASS_STRATEGY';
INSERT INTO UnitClasses
			(Type, 										Description,							DefaultUnit)
VALUES		('UNITCLASS_DECISIONS_GALLEASS', 		'TXT_KEY_DECISIONS_VENETIANARSENALE',		'UNIT_DECISIONS_GALLEASS');
INSERT INTO Units 	
			(Class, 									Type, 										PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 		XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, Range)
SELECT		('UNITCLASS_DECISIONS_GALLEASS'), 		('UNIT_DECISIONS_GALLEASS'), 			('TECH_GUILDS'),		Combat, (155), 	(155),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ('TECH_NAVIGATION'), XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, Range
FROM Units WHERE (Type = 'UNIT_VENETIAN_GALLEASS');
UPDATE Units
	SET ShowInPedia = 0, PurchaseCooldown = 1, NoMinorCivGift = 1
	WHERE Type = 'UNIT_DECISIONS_GALLEASS';	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DECISIONS_GALLEASS'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_VENETIAN_GALLEASS');		
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_DECISIONS_GALLEASS'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_VENETIAN_GALLEASS');	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_DECISIONS_GALLEASS'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_VENETIAN_GALLEASS');		
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_DECISIONS_GALLEASS'), 	FlavorType, (20)
FROM Unit_Flavors WHERE (UnitType = 'UNIT_VENETIAN_GALLEASS');	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_DECISIONS_GALLEASS'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_VENETIAN_GALLEASS');
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_GALLEASS','BUILDINGCLASS_HARBOR';
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) SELECT 'CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_GALLEASS', NULL;


--Hakkapeliitta
UPDATE Language_en_US
SET Text = 'The Hakkapeliitta can only be gifted by Minor Civilizations or unlocked for Sweden through the ''Create Indelningsverket'' Decision.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_SWEDISH_HAKKAPELIITTA';
UPDATE Language_en_US
SET Text = 'Stack a Great General with them if possible. The Great General receives the movement allowance of the Hakkapeliitta if they start the turn stacked. In addition, the Hakkapeliitta receive a 15% combat bonus when stacked with a Great General.'
WHERE Tag = 'TXT_KEY_UNIT_SWEDISH_HAKKAPELIITTA_STRATEGY';
INSERT INTO UnitClasses
			(Type, 										Description,							DefaultUnit)
VALUES		('UNITCLASS_DECISIONS_HAKKAPELIITTA', 		'TXT_KEY_DECISIONS_SWEDENINDELNINGSVERKET',		'UNIT_DECISIONS_HAKKAPELIITTA');
INSERT INTO Units 	
			(Class, 									Type, 										PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 		XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		('UNITCLASS_DECISIONS_HAKKAPELIITTA'), 		('UNIT_DECISIONS_HAKKAPELIITTA'), 			('TECH_METALLURGY'),		Combat, (345), 	(345),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ('TECH_MILITARY_SCIENCE'), XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_SWEDISH_HAKKAPELIITTA');
UPDATE Units
	SET ShowInPedia = 0, PurchaseCooldown = 1, NoMinorCivGift = 1
	WHERE Type = 'UNIT_DECISIONS_HAKKAPELIITTA';	
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 							ResourceType)
SELECT		('UNIT_DECISIONS_HAKKAPELIITTA'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA');
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DECISIONS_HAKKAPELIITTA'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA');		
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_DECISIONS_HAKKAPELIITTA'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA');	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_DECISIONS_HAKKAPELIITTA'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_LANCER');		
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_DECISIONS_HAKKAPELIITTA'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA');	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_DECISIONS_HAKKAPELIITTA'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA');
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_HAKKAPELIITTA','BUILDINGCLASS_ARMORY'; 
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_HAKKAPELIITTA','BUILDINGCLASS_STABLE';
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) SELECT 'CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_HAKKAPELIITTA', NULL;

-- Ballista
UPDATE Language_en_US
SET Text = 'The Ballista can only be gifted by Minor Civilizations or unlocked for Rome through the ''Ballista Fulminalis'' Decision.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_BALLISTA';
INSERT INTO UnitClasses
			(Type, 										Description,							DefaultUnit)
VALUES		('UNITCLASS_DECISIONS_BALLISTA', 		'TXT_KEY_DECISIONS_ROMANPANEM',		'UNIT_DECISIONS_BALLISTA');
INSERT INTO Units 	
			(Class, 									Type, 										PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 		XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, Range)
SELECT		('UNITCLASS_DECISIONS_BALLISTA'), 		('UNIT_DECISIONS_BALLISTA'), 			('TECH_IRON_WORKING'),		Combat, (95), 	(95),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, Range
FROM Units WHERE (Type = 'UNIT_ROMAN_BALLISTA');
UPDATE Units
	SET ShowInPedia = 0, PurchaseCooldown = 1, NoMinorCivGift = 1
	WHERE Type = 'UNIT_DECISIONS_BALLISTA';
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 							ResourceType)
SELECT		('UNIT_DECISIONS_BALLISTA'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_CATAPULT');
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DECISIONS_BALLISTA'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ROMAN_BALLISTA');		
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_DECISIONS_BALLISTA'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_ROMAN_BALLISTA');	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_DECISIONS_BALLISTA'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CATAPULT');		
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_DECISIONS_BALLISTA'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_ROMAN_BALLISTA');	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_DECISIONS_BALLISTA'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_ROMAN_BALLISTA');
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_BALLISTA','BUILDINGCLASS_BARRACKS';
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) SELECT 'CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_BALLISTA', NULL;

--Longbowman
UPDATE Language_en_US
SET Text = 'The Longbowman can only be gifted by Minor Civilizations or unlocked for England through the ''Adoption of the Welsh Bow'' Decision.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_LONGBOWMAN';
INSERT INTO UnitClasses
			(Type, 										Description,							DefaultUnit)
VALUES		('UNITCLASS_DECISIONS_LONGBOWMAN', 		'TXT_KEY_DECISIONS_ENGLISHARMADA',		'UNIT_DECISIONS_LONGBOWMAN');
INSERT INTO Units 	
			(Class, 									Type, 										PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 		XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, Range)
SELECT		('UNITCLASS_DECISIONS_LONGBOWMAN'), 		('UNIT_DECISIONS_LONGBOWMAN'), 			('TECH_MACHINERY'),		Combat, (155), 	(155),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, Range
FROM Units WHERE (Type = 'UNIT_ENGLISH_LONGBOWMAN');
UPDATE Units
	SET ShowInPedia = 0, PurchaseCooldown = 1, NoMinorCivGift = 1
	WHERE Type = 'UNIT_DECISIONS_LONGBOWMAN';	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DECISIONS_LONGBOWMAN'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ENGLISH_LONGBOWMAN');		
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_DECISIONS_LONGBOWMAN'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_ENGLISH_LONGBOWMAN');	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_DECISIONS_LONGBOWMAN'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_ENGLISH_LONGBOWMAN');		
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_DECISIONS_LONGBOWMAN'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_ENGLISH_LONGBOWMAN');
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_DECISIONS_LONGBOWMAN'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_ENGLISH_LONGBOWMAN');
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_LONGBOWMAN','BUILDINGCLASS_BARRACKS';
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) SELECT 'CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_LONGBOWMAN', NULL;

--Turtle Ship
UPDATE Language_en_US
SET Text = 'The Turtle Ship can only be gifted by Minor Civilizations or unlocked for Korea through the ''Fund the Development of Gunpowder'' Decision.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_TURTLESHIP_HELP';
INSERT INTO UnitClasses
			(Type, 										Description,							DefaultUnit)
VALUES		('UNITCLASS_DECISIONS_TURTLESHIP', 		'TXT_KEY_DECISIONS_KOREANGUNPOWDER',		'UNIT_DECISIONS_TURTLESHIP');
INSERT INTO Units 	
			(Class, 									Type, 										PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 		XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		('UNITCLASS_DECISIONS_TURTLESHIP'), 		('UNIT_DECISIONS_TURTLESHIP'), 			('TECH_COMPASS'),		Combat, (140), 	(140),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_KOREAN_TURTLE_SHIP');
UPDATE Units
	SET ShowInPedia = 0, PurchaseCooldown = 1, NoMinorCivGift = 1
	WHERE Type = 'UNIT_DECISIONS_TURTLESHIP';	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DECISIONS_TURTLESHIP'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_KOREAN_TURTLE_SHIP');		
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_DECISIONS_TURTLESHIP'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_KOREAN_TURTLE_SHIP');	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_DECISIONS_TURTLESHIP'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_KOREAN_TURTLE_SHIP');		
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_DECISIONS_TURTLESHIP'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_KOREAN_TURTLE_SHIP');
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_DECISIONS_TURTLESHIP'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_KOREAN_TURTLE_SHIP');
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_TURTLESHIP','BUILDINGCLASS_HARBOR';
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) SELECT 'CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_TURTLESHIP', NULL;

--Sipahi
UPDATE Language_en_US
SET Text = 'The Sipahi can only be gifted by Minor Civilizations or unlocked for Ottoman through the ''Reform the Ottoman State'' Decision.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_SIPAHI';
INSERT INTO UnitClasses
			(Type, 										Description,							DefaultUnit)
VALUES		('UNITCLASS_DECISIONS_SIPAHI', 		'TXT_KEY_DECISIONS_OTTOMANGUNPOWDER',		'UNIT_DECISIONS_SIPAHI');
INSERT INTO Units 	
			(Class, 									Type, 							PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 		XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		('UNITCLASS_DECISIONS_SIPAHI'), 		('UNIT_DECISIONS_SIPAHI'), ('TECH_METALLURGY'), Combat, (345), 	(345),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_OTTOMAN_SIPAHI');
UPDATE Units
	SET ShowInPedia = 0, PurchaseCooldown = 1, NoMinorCivGift = 1
	WHERE Type = 'UNIT_DECISIONS_SIPAHI';
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 							ResourceType)
SELECT		('UNIT_DECISIONS_SIPAHI'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_LANCER');
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DECISIONS_SIPAHI'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_OTTOMAN_SIPAHI');		
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_DECISIONS_SIPAHI'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_OTTOMAN_SIPAHI');	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_DECISIONS_SIPAHI'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_OTTOMAN_SIPAHI');		
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_DECISIONS_SIPAHI'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_OTTOMAN_SIPAHI');
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_DECISIONS_SIPAHI'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_OTTOMAN_SIPAHI');
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_SIPAHI','BUILDINGCLASS_ARMORY'; 
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_SIPAHI','BUILDINGCLASS_STABLE';
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) SELECT 'CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_SIPAHI', NULL;

--Companion Cavalry
UPDATE Language_en_US
SET Text = 'The Companion Cavalry can only be gifted by Minor Civilizations or unlocked for Greece through the ''Establish the Hetairoi''.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_COMPANION_CAVALRY';
INSERT INTO UnitClasses
			(Type, 										Description,							DefaultUnit)
VALUES		('UNITCLASS_DECISIONS_CC', 		'TXT_KEY_DECISIONS_GREECEPHALANX',		'UNIT_DECISIONS_CC');
INSERT INTO Units 	
			(Class, 									Type, 										PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 		XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		('UNITCLASS_DECISIONS_CC'), 		('UNIT_DECISIONS_CC'), 			('TECH_ARCHERY'),		Combat, (85), 	(85),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_GREEK_COMPANIONCAVALRY');
UPDATE Units
	SET ShowInPedia = 0, PurchaseCooldown = 1, NoMinorCivGift = 1
	WHERE Type = 'UNIT_DECISIONS_CC';
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 							ResourceType)
SELECT		('UNIT_DECISIONS_CC'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_GREEK_COMPANIONCAVALRY');
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DECISIONS_CC'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREEK_COMPANIONCAVALRY');		
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_DECISIONS_CC'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREEK_COMPANIONCAVALRY');	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_DECISIONS_CC'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GREEK_COMPANIONCAVALRY');		
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_DECISIONS_CC'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREEK_COMPANIONCAVALRY');
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_DECISIONS_CC'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREEK_COMPANIONCAVALRY');
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) SELECT 'CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_CC', NULL;

UPDATE Language_en_US
SET Text = 'The Battering Ram can only be gifted by Minor Civilizations or unlocked for Persia through the ''Create the Persian War Machine'' Decision.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_HUN_BATTERING_RAM';

UPDATE Units SET Cost = '155' WHERE Type = 'UNIT_VENETIAN_GALLEASS';
UPDATE Units SET FaithCost = '310' WHERE Type = 'UNIT_VENETIAN_GALLEASS';

UPDATE Units SET Cost = '140' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';
UPDATE Units SET FaithCost = '306' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';

UPDATE Units SET Cost = '95' WHERE Type = 'UNIT_HUN_BATTERING_RAM';
UPDATE Units SET FaithCost = '190' WHERE Type = 'UNIT_HUN_BATTERING_RAM';

UPDATE Units SET Cost = '95' WHERE Type = 'UNIT_ROMAN_BALLISTA';
UPDATE Units SET FaithCost = '190' WHERE Type = 'UNIT_ROMAN_BALLISTA';

UPDATE Units SET Cost = '345' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';
UPDATE Units SET FaithCost = '395' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';

UPDATE Units SET Cost = '345' WHERE Type = 'UNIT_OTTOMAN_SIPAHI';
UPDATE Units SET FaithCost = '395' WHERE Type = 'UNIT_OTTOMAN_SIPAHI';

UPDATE Units SET Cost = '155' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
UPDATE Units SET FaithCost = '290' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';

UPDATE Units SET Cost = '85' WHERE Type = 'UNIT_GREEK_COMPANIONCAVALRY';
UPDATE Units SET FaithCost = '95' WHERE Type = 'UNIT_GREEK_COMPANIONCAVALRY';

UPDATE Units SET ObsoleteTech = 'TECH_NAVIGATION' WHERE Type = 'UNIT_VENETIAN_GALLEASS';
UPDATE Units SET ObsoleteTech = 'TECH_NAVIGATION' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';
UPDATE Units SET ObsoleteTech = 'TECH_PHYSICS' WHERE Type = 'UNIT_HUN_BATTERING_RAM';
UPDATE Units SET ObsoleteTech = 'TECH_PHYSICS' WHERE Type = 'UNIT_ROMAN_BALLISTA';
UPDATE Units SET ObsoleteTech = 'TECH_METALLURGY' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
UPDATE Units SET ObsoleteTech = 'TECH_CHIVALRY' WHERE Type = 'UNIT_GREEK_COMPANIONCAVALRY';
