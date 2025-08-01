--==========================================================================================================================
-- WHOWARD's DLL
--==========================================================================================================================
-- CustomModOptions
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions (Name TEXT, Value INTEGER);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_RESOLUTIONS', 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Building_JFD_ContractModifiers
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_ContractModifiers (
	BuildingType 									text 	REFERENCES Buildings(Type)			default null,
	CostModifier 									integer 									default 0,
	MaintenanceModifier 							integer 									default 0,
	TurnsModifier 									integer 									default 0);
--==========================================================================================================================
-- CONTRACTS
--==========================================================================================================================
-- JFD_Contracts
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Contracts (
	ID  											integer 						   primary key autoincrement,
	Type 											text 										default null,
	Category 										text 										default null,
	Description 									text 										default null,
	Adjective 										text 										default null,
	Civilopedia 									text 										default null,
	IconAtlas 										text 										default null,
	PortraitIndex									integer 									default 0,
	PrereqCivilization								text	REFERENCES Civilizations(Type)		default	null,
	PrereqEra										text	REFERENCES Eras(Type)				default	'ERA_ANCIENT',
	PrereqReligion									text	REFERENCES Religions(Type)			default	null,
	PrereqPietyLevel								text										default	null,
	PurchaseDing									text										default	'AS2D_INTERFACE_CITY_SCREEN_PURCHASE',
	ObsoleteEra										text	REFERENCES Eras(Type)				default	null,
	IsHolyOrder										boolean										default	0,
	IsSlavery										boolean										default	0,
	Maintenance										integer 									default 3,
	Rating											integer 									default 0,
	DisbandChance									integer 									default 0,	
	MutinyChance									integer 									default 0,
	PolicyType										text	REFERENCES Policies(Type)			default	null,
	PromotionType									text	REFERENCES UnitPromotions(Type)		default	null,
	Turns											integer 									default 25,
	YieldCost										text										default	'YIELD_GOLD');
-------------------------------------
-- JFD_Contract_Flavors
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Contract_Flavors (
	ContractType 									text 										default null,
	FlavorType 										text	REFERENCES Flavors(Type)			default null);
-------------------------------------
-- JFD_Contract_Units
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Contract_Units (
	ContractType 									text 										default null,
	UnitType 										text	REFERENCES Units(Type)				default null,
	UseUniqueIfAvailable 							boolean										default	0);
-------------------------------------
-- JFD_Contract_UnitClasses
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Contract_UnitClasses (
	ContractType 									text 										default null,
	CultureType										text 										default null,
	UnitClassType 									text	REFERENCES UnitClasses(Type)		default null,
	UseOnlyCultureType								boolean										default	0);
-------------------------------------
-- JFD_Contract_UnitCombats
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Contract_UnitCombats (
	ContractType 									text 										default null,
	CultureType										text 										default null,
	UnitCombatType 									text	REFERENCES UnitCombatInfos(Type)	default null,
	UseOnlyCultureType								boolean										default	0);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policy_JFD_ContractModifiers
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Policy_JFD_ContractModifiers (
	PolicyType 										text 	REFERENCES Policies(Type)			default null,
	CostModifier 									integer 									default 0,
	MaintenanceModifier 							integer 									default 0,
	TurnsModifier 									integer 									default 0);
--==========================================================================================================================
-- TECHS
--==========================================================================================================================
-- Technologies_JFD_MiscEffects
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Technologies_JFD_MiscEffects (
	TechType										text 	REFERENCES Technologies(Type) 		default null,	
	EffectToolTip									text										default null,
	PortraitIndex									integer										default	0,
	IconAtlas										text										default 'GENERIC_FUNC_ATLAS',
	UnitAction										text										default	null);
	
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowBusinessContracts		boolean					default	0;
ALTER TABLE Technologies_JFD_MiscEffects ADD AllowMercenaryContracts	boolean					default	0;
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Trait_JFD_ContractModifiers
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_ContractModifiers (
	TraitType 										text 	REFERENCES Traits(Type)				default null,
	CostModifier 									integer 									default 0,
	MaintenanceModifier 							integer 									default 0,
	TurnsModifier 									integer 									default 0);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
-------------------------------------	
ALTER TABLE Units ADD JFD_CannnotBeMercenary	boolean	default	0;
ALTER TABLE Units ADD JFD_OnlyMercenary			boolean	default	0;
-------------------------------------
-- UnitPromotions
-------------------------------------	
ALTER TABLE UnitPromotions ADD JFD_Mercenary	boolean default	0;
-------------------------------------
-- UnitPromotions_JFD_UnitDialogues
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
UnitPromotions_JFD_UnitDialogues(
	PromotionType 								text 	REFERENCES UnitPromotions(Type) 		default null,
	UnitDialogue 								text											default null);
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================
--==========================================================================================================================