UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'RESOURCES_PRODUCTION_COST_MODIFIERS';



INSERT INTO ArtDefine_LandmarkTypes (Type,										LandmarkType,	FriendlyName) 
VALUES
                             ('ART_DEF_RESOURCE_OAK',					'Resource',		'Timber');																
																	
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
	VALUES	('ART_DEF_RESOURCE_OAK', 'Resource', 'SV_Timber.dds');
	

	
INSERT INTO ArtDefine_Landmarks 
		(Era,			State,						Scale,				ImprovementType,					LayoutHandler,				ResourceType,								Model,										TerrainContour, Tech)
VALUES  ('Any',			'Any',						1,					'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',					'ART_DEF_RESOURCE_OAK',				'Lumbertrees.fxsxml',						1,				null);


INSERT INTO IconFontTextures (IconFontTexture, IconFontTextureFile)
SELECT 'ICON_FONT_TEXTURE_TIMBER', 'timber-fonticons';

INSERT INTO IconFontMapping (IconName, IconFontTexture, IconMapping)
SELECT 'ICON_RES_OAK', 'ICON_FONT_TEXTURE_TIMBER', 1 ;

	

INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
SELECT 'TimberMOD_ICON_ATLAS', '256', 'TimbermodIconAtlas256.dds', 8, 8 UNION ALL
SELECT 'TimberMOD_ICON_ATLAS', '128', 'TimbermodIconAtlas128.dds', 8, 8 UNION ALL
SELECT 'TimberMOD_ICON_ATLAS', '80', 'TimbermodIconAtlas80.dds', 8, 8 UNION ALL
SELECT 'TimberMOD_ICON_ATLAS', '64', 'TimbermodIconAtlas64.dds', 8, 8 UNION ALL
SELECT 'TimberMOD_ICON_ATLAS', '45', 'TimbermodIconAtlas45.dds', 8, 8;

	

--=========================



INSERT INTO Resources	(Type,							Description,							Civilopedia,								Help,										ResourceClassType,				ArtDefineTag,						AltArtDefineTag,					ArtDefineTagHeavy,					AltArtDefineTagHeavy,		TechReveal,							TechCityTrade,			TechImproveable,		TechObsolete,			Happiness,	WonderProductionMod,	WonderProductionModObsoleteEra, StartingResourceQuantity,	Normalize,		AITradeModifier,	AIObjective,	PlacementOrder, ConstAppearance,	MinAreaSize,	MinLatitude,	MaxLatitude,	RandApp1,	RandApp2,	RandApp3,	RandApp4,	Player, TilesPer,	MinLandPercent, GroupRange, GroupRand,	ResourceUsage,	PresentOnAllValidPlots, Area,	Hills,	Flatlands,	NoRiverSide,	OnlyMinorCivs,	IconString,		LandResource,			PortraitIndex,	IconAtlas, IsMonopoly,  MonopolyDefenseBonus, StrategicHelp) VALUES
					
					  ('RESOURCE_OAK',				'TXT_KEY_RESOURCE_OAK',					'TXT_KEY_CIV5_RESOURCE_OAK_TEXT',			'TXT_KEY_RESOURCE_MONOPOLY_YIELD_OAK',				'RESOURCECLASS_RUSH',			'ART_DEF_RESOURCE_OAK',			null,		                           'ART_DEF_RESOURCE_OAK',                   null,	         'TECH_AGRICULTURE',				'TECH_METAL_CASTING',		'TECH_METAL_CASTING',	    'TECH_ROCKETRY',		 0,			 0,						null,	        					0,					0,				20,					1,				2,				50,					3,				0,				90,				10,			10,			0,			0,			75,	  0,			0,				0,			0,			1,				0,						0,		0,		0,			0,				0,			'[ICON_RES_OAK]',			1,             	9,				'TimberMOD_ICON_ATLAS', 1, 1, 'TXT_KEY_RESOURCE_MONOPOLY_STRAT_OAK');


UPDATE Resources SET StrategicPriority = StrategicPriority + 1 WHERE StrategicPriority > 0;
UPDATE Resources SET StrategicPriority = 1 WHERE Type = 'RESOURCE_OAK';	
		



INSERT INTO Resource_FeatureBooleans	(ResourceType,			FeatureType) VALUES
                                        ('RESOURCE_OAK',		'FEATURE_JUNGLE'),
										('RESOURCE_OAK',		'FEATURE_FOREST');	
	
INSERT INTO Resource_QuantityTypes
	(ResourceType, Quantity)
VALUES ('RESOURCE_OAK', 3),
       ('RESOURCE_OAK', 2),
       ('RESOURCE_OAK', 4);




INSERT INTO Resource_YieldChanges	(ResourceType,			YieldType,				Yield) VALUES
							
								 ('RESOURCE_OAK',		'YIELD_PRODUCTION',		1);



INSERT INTO Improvement_ResourceTypes
		(ResourceType, 			ImprovementType)		
SELECT	'RESOURCE_OAK',		'IMPROVEMENT_LUMBERMILL';

INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType, ResourceType, YieldType, Yield)
VALUES ('IMPROVEMENT_LUMBERMILL', 'RESOURCE_OAK', 'YIELD_PRODUCTION', 1);

INSERT INTO Resource_YieldChangeFromMonopoly
	(ResourceType, YieldType, Yield)
VALUES
    ('RESOURCE_OAK', 'YIELD_GOLD', 1),
	('RESOURCE_OAK', 'YIELD_PRODUCTION', 1);	
	
INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
    ('BUILDING_WORKSHOP', 'RESOURCE_OAK', 'YIELD_GOLD', 2),
	('BUILDING_KREPOST', 'RESOURCE_OAK', 'YIELD_PRODUCTION', 2),
    ('BUILDING_KREPOST', 'RESOURCE_OAK', 'YIELD_GOLD', 2);



INSERT INTO Corporation_ResourceMonopolyOrs
	(CorporationType, ResourceType)
VALUES
    ('CORPORATION_FIRAXITE_MATERIALS', 'RESOURCE_OAK');
	
INSERT INTO Policy_ResourcefromCSAlly
	(PolicyType, ResourceType, Number)
VALUES
	('POLICY_PHILANTHROPY', 'RESOURCE_OAK', 34);
	
	
INSERT INTO Corporation_ResourceYieldChanges
	(CorporationType, ResourceType, YieldType, Yield)
VALUES
 ('CORPORATION_FIRAXITE_MATERIALS', 'RESOURCE_OAK', 'YIELD_SCIENCE', 1);

 UPDATE Language_en_US
SET Text = REPLACE(Text, '[ICON_RES_IRON] Iron,', '[ICON_RES_OAK] Timber, [ICON_RES_IRON] Iron,')
WHERE Tag = 'TXT_KEY_CORPORATION_RESOURCE_BONUS_FIRAXITE_MATERIALS';
	
	
	INSERT INTO Belief_ResourceQuantityModifiers
	(BeliefType, ResourceType, ResourceQuantityModifier)
VALUES
	('BELIEF_HEATHEN_CONVERSION', 'RESOURCE_OAK', 1);	
	

INSERT INTO Policy_ResourceYieldChanges
	(PolicyType, ResourceType, YieldType, Yield)
VALUES
    ('POLICY_RATIONALISM', 'RESOURCE_OAK', 'YIELD_SCIENCE', 3),
	('POLICY_RATIONALISM', 'RESOURCE_OAK', 'YIELD_PRODUCTION', 2);
	
INSERT INTO Trait_ResourceQuantityModifiers (TraitType, ResourceType, ResourceQuantityModifier) 
VALUES 	('TRAIT_STRATEGIC_RICHES', 'RESOURCE_OAK', '100');


INSERT INTO Belief_ImprovementYieldChanges
	(BeliefType, ImprovementType, YieldType, Yield)
VALUES
	('BELIEF_RHIANNON', 'IMPROVEMENT_LUMBERMILL', 'YIELD_PRODUCTION', 1),
	('BELIEF_RHIANNON', 'IMPROVEMENT_LUMBERMILL', 'YIELD_GOLD', 1);
	
UPDATE Policies SET StrategicResourceMod = 50 WHERE Type = 'POLICY_THIRD_ALTERNATIVE';
UPDATE Language_en_US
SET Text = REPLACE(Text, '100%', '50%')
WHERE Tag = 'TXT_KEY_POLICY_THIRD_ALTERNATIVE_HELP';

INSERT INTO Resource_UnitCombatProductionCostModifiersLocal 
		(ResourceType, 		UnitCombatType,				RequiredEra, 	   ObsoleteEra, 				CostModifier)
VALUES	('RESOURCE_OAK',  'UNITCOMBAT_SIEGE',                null, 		'ERA_RENAISSANCE',		 		-20),
        ('RESOURCE_OAK',  'UNITCOMBAT_NAVALMELEE',           null, 		'ERA_INDUSTRIAL',		 		-20),
        ('RESOURCE_OAK',  'UNITCOMBAT_NAVALRANGED',          null, 		'ERA_MODERN',		 	    	-20),
		('RESOURCE_OAK',  'UNITCOMBAT_CARRIER',              null, 	   'ERA_MODERN',		 		   -20);
		 
	

INSERT INTO Building_ResourceQuantityRequirements
	(BuildingType, ResourceType, Cost)
VALUES
    ('BUILDING_REFINERY', 'RESOURCE_OAK', 3);

UPDATE BuildingClasses SET MaxPlayerInstances = -1 WHERE Type = 'BUILDINGCLASS_REFINERY';
					 
																						   
											   



DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType IN ('UNIT_BB_IRONCLAD', 'UNIT_CRUISER', 'UNIT_BB_SHIP_OF_THE_LINE', 'UNIT_ENGLISH_SHIPOFTHELINE');

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_BB_IRONCLAD', 'RESOURCE_IRON', 1);

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES 
('UNIT_TREASURE_SHIP',	'RESOURCE_OAK',	1),
('UNIT_DJONG',	'RESOURCE_OAK',	1),
('UNIT_TREBUCHET',	'RESOURCE_OAK',	1),
('UNIT_KOREAN_HWACHA',	'RESOURCE_OAK',	1),
('UNIT_FRIGATE',	'RESOURCE_OAK',	1),
('UNIT_ENGLISH_SHIPOFTHELINE',	'RESOURCE_OAK',	2),
('UNIT_GALLEASS',	'RESOURCE_OAK',	1),
('UNIT_VENETIAN_GALLEASS',	'RESOURCE_OAK',	1),
('UNIT_CRUISER',	'RESOURCE_OAK',	1),
('UNIT_BB_IRONCLAD',	'RESOURCE_OAK',	1),
('UNIT_BB_SHIP_OF_THE_LINE',	'RESOURCE_OAK',	2);

UPDATE CustomModOptions SET Value = 1 WHERE Name = 'UNITS_RESOURCE_QUANTITY_TOTALS';

INSERT INTO Unit_ResourceQuantityTotals (UnitType, ResourceType, Amount)
VALUES ('UNIT_BB_SHIP_OF_THE_LINE', 'RESOURCE_OAK', 4),
       ('UNIT_BB_DREADNOUGHT', 'RESOURCE_COAL', 6),
       ('UNIT_BB_BATTLESHIP', 'RESOURCE_OIL', 8);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_RESOURCE_OAK', 'Timber'),
('TXT_KEY_RESOURCE_MONOPOLY_YIELD_OAK', '[COLOR_POSITIVE_TEXT]Local City Bonus:[ENDCOLOR] -20% [ICON_PRODUCTION] Production Cost of Naval and Siege Units.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Strategic Monopoly Bonus (25%):[ENDCOLOR] Units gain +10% [ICON_STRENGTH] Strength when defending.
		  [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Global Monopoly Bonus (50%):[ENDCOLOR] +1 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold from Resource tiles.'),
('TXT_KEY_CIV5_RESOURCE_OAK_TEXT', 'Timber is a vital resource in the pre-industrial era, enabling the construction of ships and siege weapons. Like other strategic resources, Timber must be connected to your trade network to be used.'),
('TXT_KEY_RESOURCE_MONOPOLY_STRAT_OAK', '[COLOR_POSITIVE_TEXT]Strategic Monopoly Bonus:[ENDCOLOR] Units gain +10% [ICON_STRENGTH] Strength when defending.');

																																			
								 
					 
																												  


---------------------------------------------------------
-- EAST_INDIA
---------------------------------------------------------


INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxGlobalInstances)
VALUES ('BUILDINGCLASS_EAST_INDIA_COMP', 'BUILDING_EAST_INDIA_COMP', 'TXT_KEY_BUILDING_EAST_INDIA_COMP', 1);

INSERT INTO Buildings
	(Type, PrereqTech, MaxStartEra, 
	SpecialistType, GreatPeopleRateChange, PortraitIndex,
	BuildingClass, Description, Civilopedia, 
	Quote, Help, NukeImmune, 
	HurryCostModifier, Water, MinAreaSize, 
	ConquestProb, IconAtlas, WonderSplashImage, 
	WonderSplashAnchor, Cost, NumPoliciesNeeded)
VALUES
	('BUILDING_EAST_INDIA_COMP', 'TECH_ASTRONOMY', 'ERA_INDUSTRIAL',
	NULL, 0, 7,
   'BUILDINGCLASS_EAST_INDIA_COMP', 'TXT_KEY_BUILDING_EAST_INDIA_COMP', 'TXT_KEY_WONDER_EAST_INDIA_COMP_PEDIA',
   'TXT_KEY_WONDER_EAST_INDIA_COMP_QUOTE', 'TXT_KEY_WONDER_EAST_INDIA_COMP_HELP', 1, 
   -5, 1, 10, 
   100, 'TimberMOD_ICON_ATLAS', 'India_Company_splash.dds', 
   'R,B', 800, 10);

INSERT INTO Building_ResourceQuantity
	(BuildingType, ResourceType, Quantity)
VALUES
	('BUILDING_EAST_INDIA_COMP', 'RESOURCE_OAK', 4);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EAST_INDIA_COMP', 'YIELD_CULTURE', 1); 

	UPDATE Buildings SET NumTradeRouteBonus = 1 WHERE Type = 'BUILDING_EAST_INDIA_COMP';
	

	
	INSERT INTO Building_YieldChangesPerMonopoly
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EAST_INDIA_COMP', 'YIELD_GOLD', 10);
		

	
	INSERT INTO Building_UnitCombatProductionModifiersGlobal 	
				(BuildingType,				UnitCombatType,				Modifier) 
	VALUES		('BUILDING_EAST_INDIA_COMP',	'UNITCOMBAT_CARGO',			50);
														   

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_EAST_INDIA_COMP',	'FLAVOR_WONDER',		20),
('BUILDING_EAST_INDIA_COMP',	'FLAVOR_NAVAL',			25),
														
('BUILDING_EAST_INDIA_COMP',	'FLAVOR_PRODUCTION',	5);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_EAST_INDIA_COMP', 'East India Company'),
('TXT_KEY_WONDER_EAST_INDIA_COMP_HELP', ''),
('TXT_KEY_WONDER_EAST_INDIA_COMP_QUOTE', '[NEWLINE]"All other lands found on the western side of the boundary shall belong to the King and Queen of Castille - and their successors."[NEWLINE] - Treaty of Tordesillas[NEWLINE]'),
('TXT_KEY_WONDER_EAST_INDIA_COMP_PEDIA', 'The East India Company was an joint-stock company and was formed to trade in the Indian Ocean region.The company gained control of large parts of the Indian subcontinent and colonised parts of Southeast Asia and Hong Kong. At its peak, the company was the largest corporation in the world by various measures and had its own armed forces.');