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
SELECT		('UNITCLASS_DECISIONS_GALLEASS'), 		('UNIT_DECISIONS_GALLEASS'), 			('TECH_GUILDS'),		Combat, (175), 	(350),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, Range
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
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GALLEASS');		
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_DECISIONS_GALLEASS'), 	FlavorType, Flavor
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
SELECT		('UNITCLASS_DECISIONS_HAKKAPELIITTA'), 		('UNIT_DECISIONS_HAKKAPELIITTA'), 			('TECH_METALLURGY'),		Combat, (350), 	(400),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
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
SELECT		('UNITCLASS_DECISIONS_BALLISTA'), 		('UNIT_DECISIONS_BALLISTA'), 			('TECH_IRON_WORKING'),		Combat, (100), 	(200),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, Range
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
SELECT		('UNITCLASS_DECISIONS_LONGBOWMAN'), 		('UNIT_DECISIONS_LONGBOWMAN'), 			('TECH_MACHINERY'),		Combat, (160), 	(300),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, Range
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
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CROSSBOWMAN');		
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
SELECT		('UNITCLASS_DECISIONS_TURTLESHIP'), 		('UNIT_DECISIONS_TURTLESHIP'), 			('TECH_COMPASS'),		Combat, (160), 	(350),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
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
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CARAVEL');		
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
SELECT		('UNITCLASS_DECISIONS_SIPAHI'), 		('UNIT_DECISIONS_SIPAHI'), ('TECH_METALLURGY'), Combat, (350), 	(400),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
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
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_LANCER');		
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
SELECT		('UNITCLASS_DECISIONS_CC'), 		('UNIT_DECISIONS_CC'), 			('TECH_ARCHERY'),		Combat, (90), 	(100),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
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
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_HORSEMAN');		
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

UPDATE Units SET Cost = '175' WHERE Type = 'UNIT_VENETIAN_GALLEASS';
UPDATE Units SET FaithCost = '350' WHERE Type = 'UNIT_VENETIAN_GALLEASS';

UPDATE Units SET Cost = '160' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';
UPDATE Units SET FaithCost = '350' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';

UPDATE Units SET Cost = '100' WHERE Type = 'UNIT_HUN_BATTERING_RAM';
UPDATE Units SET FaithCost = '200' WHERE Type = 'UNIT_HUN_BATTERING_RAM';

UPDATE Units SET Cost = '100' WHERE Type = 'UNIT_ROMAN_BALLISTA';
UPDATE Units SET FaithCost = '200' WHERE Type = 'UNIT_ROMAN_BALLISTA';

UPDATE Units SET Cost = '350' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';
UPDATE Units SET FaithCost = '400' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';

UPDATE Units SET Cost = '350' WHERE Type = 'UNIT_OTTOMAN_SIPAHI';
UPDATE Units SET FaithCost = '400' WHERE Type = 'UNIT_OTTOMAN_SIPAHI';

UPDATE Units SET Cost = '160' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
UPDATE Units SET FaithCost = '300' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';

UPDATE Units SET Cost = '90' WHERE Type = 'UNIT_GREEK_COMPANIONCAVALRY';
UPDATE Units SET FaithCost = '100' WHERE Type = 'UNIT_GREEK_COMPANIONCAVALRY';

UPDATE Units SET ObsoleteTech = 'TECH_NAVIGATION' WHERE Type = 'UNIT_VENETIAN_GALLEASS';
UPDATE Units SET ObsoleteTech = 'TECH_NAVIGATION' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';
UPDATE Units SET ObsoleteTech = 'TECH_PHYSICS' WHERE Type = 'UNIT_HUN_BATTERING_RAM';
UPDATE Units SET ObsoleteTech = 'TECH_PHYSICS' WHERE Type = 'UNIT_ROMAN_BALLISTA';
UPDATE Units SET ObsoleteTech = 'TECH_METALLURGY' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
UPDATE Units SET ObsoleteTech = 'TECH_CHIVALRY' WHERE Type = 'UNIT_GREEK_COMPANIONCAVALRY';


--Norwegian Ski Infantry
UPDATE Language_en_US
SET Text = 'The Norwegian Ski Infantry can only be gifted by Minor Civilizations or unlocked for Denmark through the ''Formalise the Thing'' Decision.'
WHERE Tag = 'TXT_KEY_CIV5_DENMARK_SKI_INFANTRY_HELP';
INSERT INTO UnitClasses
			(Type, 										Description,							DefaultUnit)
VALUES		('UNITCLASS_DECISIONS_SKI', 		'TXT_KEY_DECISIONS_DENMARKTHING',		'UNIT_DECISIONS_SKI');
INSERT INTO Units 	
			(Class, 									Type, 										PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 		XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, BaseLandAirDefense, Range)
SELECT		('UNITCLASS_DECISIONS_SKI'), 		('UNIT_DECISIONS_SKI'), 			('TECH_RIFLING'),		Combat, (625), 	(600),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, BaseLandAirDefense, Range
FROM Units WHERE (Type = 'UNIT_DANISH_SKI_INFANTRY');
UPDATE Units
	SET ShowInPedia = 0, PurchaseCooldown = 1, NoMinorCivGift = 1
	WHERE Type = 'UNIT_DECISIONS_SKI';	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DECISIONS_SKI'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_DANISH_SKI_INFANTRY');		
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_DECISIONS_SKI'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_DANISH_SKI_INFANTRY');	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_DECISIONS_SKI'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_RIFLEMAN');		
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_DECISIONS_SKI'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_DANISH_SKI_INFANTRY');
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_DECISIONS_SKI'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_DANISH_SKI_INFANTRY');
--INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_SKI','BUILDINGCLASS_BARRACKS';
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_SKI','BUILDINGCLASS_ARMORY';
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) SELECT 'CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_SKI', NULL;

UPDATE Units SET Cost = '625' WHERE Type = 'UNIT_DANISH_SKI_INFANTRY';
UPDATE Units SET FaithCost = '600' WHERE Type = 'UNIT_DANISH_SKI_INFANTRY';

UPDATE Units SET ObsoleteTech = 'TECH_REPLACEABLE_PARTS' WHERE Type = 'UNIT_DANISH_SKI_INFANTRY';


--Pracinha
UPDATE Language_en_US
SET Text = 'The Pracinha can only be gifted by Minor Civilizations or unlocked for Brazil through the ''Brazilian Miracle'' Decision.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_BRAZILIAN_PRACINHA';
INSERT INTO UnitClasses
			(Type, 										Description,							DefaultUnit)
VALUES		('UNITCLASS_DECISIONS_PRA', 		'TXT_KEY_DECISIONS_BRAZILETHANOL',		'UNIT_DECISIONS_PRA');
INSERT INTO Units 	
			(Class, 									Type, 										PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 		XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, BaseLandAirDefense, Range)
SELECT		('UNITCLASS_DECISIONS_PRA'), 		('UNIT_DECISIONS_PRA'), 			('TECH_COMBINED_ARMS'),		Combat, (1300), 	(800),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate, RangedCombat, BaseLandAirDefense, Range
FROM Units WHERE (Type = 'UNIT_BRAZILIAN_PRACINHA');
UPDATE Units
	SET ShowInPedia = 0, PurchaseCooldown = 1, NoMinorCivGift = 1
	WHERE Type = 'UNIT_DECISIONS_PRA';	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DECISIONS_PRA'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_BRAZILIAN_PRACINHA');		
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_DECISIONS_PRA'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_BRAZILIAN_PRACINHA');	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_DECISIONS_PRA'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_INFANTRY');		
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_DECISIONS_PRA'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_BRAZILIAN_PRACINHA');
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_DECISIONS_PRA'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_BRAZILIAN_PRACINHA');
--INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_PRA','BUILDINGCLASS_BARRACKS';
--INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_PRA','BUILDINGCLASS_ARMORY';
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_PRA','BUILDINGCLASS_MILITARY_ACADEMY';
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) SELECT 'CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_PRA', NULL;

UPDATE Units SET Cost = '1300' WHERE Type = 'UNIT_BRAZILIAN_PRACINHA';
UPDATE Units SET FaithCost = '800' WHERE Type = 'UNIT_BRAZILIAN_PRACINHA';

UPDATE Units SET ObsoleteTech = 'TECH_MOBILE_TACTICS' WHERE Type = 'UNIT_BRAZILIAN_PRACINHA';

DELETE FROM Civilization_UnitClassOverrides
WHERE CivilizationType = 'CIVILIZATION_BARBARIAN' AND
UnitClassType IN (
	'UNITCLASS_DECISIONS_GALLEASS',
	'UNITCLASS_DECISIONS_HAKKAPELIITTA',
	'UNITCLASS_DECISIONS_BALLISTA',
	'UNITCLASS_DECISIONS_LONGBOWMAN',
	'UNITCLASS_DECISIONS_TURTLESHIP',
	'UNITCLASS_DECISIONS_SIPAHI',
	'UNITCLASS_DECISIONS_CC',
	'UNITCLASS_DECISIONS_SKI',
	'UNITCLASS_DECISIONS_PRA',
	'UNITCLASS_DECISIONS_PERSIASAVARAN',
	'UNITCLASS_BRAZILIAN_PRACINHA',
	'UNITCLASS_SKI_INFANTRY',
	'UNITCLASS_LONGBOWMAN',
	'UNITCLASS_COMPANIONCAVALRY',
	'UNITCLASS_HUNNIC_BATTERING_RAM',
	'UNITCLASS_KOREAN_TURTLE_SHIP',
	'UNITCLASS_SIPAHI',
	'UNITCLASS_BALLISTA',
	'UNITCLASS_SWEDISH_HAKKAPELIITTA',
	'UNITCLASS_VENETIAN_GALLEASS');
--	'UNITCLASS_CAVALRY',
--	'UNITCLASS_MECHANIZED_INFANTRY',
--	'UNITCLASS_IRONCLAD',
--	'UNITCLASS_MISSILE_CRUISER');

DELETE FROM Civilization_UnitClassOverrides
WHERE CivilizationType = 'CIVILIZATION_MINOR' AND
UnitClassType IN (
	'UNITCLASS_DECISIONS_GALLEASS',
	'UNITCLASS_DECISIONS_HAKKAPELIITTA',
	'UNITCLASS_DECISIONS_BALLISTA',
	'UNITCLASS_DECISIONS_LONGBOWMAN',
	'UNITCLASS_DECISIONS_TURTLESHIP',
	'UNITCLASS_DECISIONS_SIPAHI',
	'UNITCLASS_DECISIONS_CC',
	'UNITCLASS_DECISIONS_SKI',
	'UNITCLASS_DECISIONS_PRA',
	'UNITCLASS_DECISIONS_PERSIASAVARAN',
	'UNITCLASS_BRAZILIAN_PRACINHA',
	'UNITCLASS_SKI_INFANTRY',
	'UNITCLASS_LONGBOWMAN',
	'UNITCLASS_COMPANIONCAVALRY',
	'UNITCLASS_HUNNIC_BATTERING_RAM',
	'UNITCLASS_KOREAN_TURTLE_SHIP',
	'UNITCLASS_SIPAHI',
	'UNITCLASS_BALLISTA',
	'UNITCLASS_SWEDISH_HAKKAPELIITTA',
	'UNITCLASS_VENETIAN_GALLEASS');

--INSERT INTO Civilization_UnitClassOverrides
--	(CivilizationType, UnitClassType, UnitType)
--VALUES
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_GALLEASS', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_GALLEASS', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_HAKKAPELIITTA', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_HAKKAPELIITTA', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_BALLISTA', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_BALLISTA', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_LONGBOWMAN', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_LONGBOWMAN', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_TURTLESHIP', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_TURTLESHIP', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_SIPAHI', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_SIPAHI', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_CC', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_CC', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_SKI', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_SKI', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_PRA', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_PRA', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_PERSIASAVARAN', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_PERSIASAVARAN', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_BRAZILIAN_PRACINHA', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_BRAZILIAN_PRACINHA', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SKI_INFANTRY', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_SKI_INFANTRY', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_LONGBOWMAN', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_LONGBOWMAN', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_COMPANIONCAVALRY', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_COMPANIONCAVALRY', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_HUNNIC_BATTERING_RAM', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_HUNNIC_BATTERING_RAM', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_KOREAN_TURTLE_SHIP', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_KOREAN_TURTLE_SHIP', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SIPAHI', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_SIPAHI', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_BALLISTA', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_BALLISTA', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SWEDISH_HAKKAPELIITTA', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_SWEDISH_HAKKAPELIITTA', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_VENETIAN_GALLEASS', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_VENETIAN_GALLEASS', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_CAVALRY', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_MECHANIZED_INFANTRY', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_IRONCLAD', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_MISSILE_CRUISER', NULL);
