----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- TECHNOLOGIES
-- 2018-01-30 Reworked by Infixo from EE & VP-EE mods
-- 2018-02-03 Infixo: Optimized tech tree updates
----------------------------------------------------

-- Make space for EE techs
UPDATE Technologies SET GridX = 20 WHERE GridX = 18; -- Future Tech
UPDATE Technologies SET GridX = 19 WHERE GridX = 17; -- INF3
UPDATE Technologies SET GridX = 18 WHERE GridX = 16; -- INF2
UPDATE Technologies SET GridX = 17 WHERE GridX = 15; -- INF1
UPDATE Technologies SET GridX = 16 WHERE GridX = 14; -- ATO2
UPDATE Technologies SET GridX = 15 WHERE GridX = 13; -- ATO1
UPDATE Technologies SET GridX = 14 WHERE GridX = 12; -- MOD2
UPDATE Technologies SET GridX = 13 WHERE GridX = 11; -- MOD1

INSERT INTO Technologies (Type, Description, Civilopedia, Help, Era, Trade, GridX, GridY, Quote, PortraitIndex, IconAtlas, AudioIntro, AudioIntroHeader) VALUES
('TECH_EE_SOVEREIGNTY',  'TXT_KEY_TECH_EE_SOVEREIGNTY',  'TXT_KEY_TECH_EE_SOVEREIGNTY_DESC',  'TXT_KEY_TECH_EE_SOVEREIGNTY_HELP',  'ERA_RENAISSANCE',  1,  8, 3, 'TXT_KEY_TECH_EE_SOVEREIGNTY_QUOTE',  2, 'ENLIGHTENMENT_TECH_ATLAS', 'AS2D_TECH_EE_SOVEREIGNTY',  'AS2D_TECH_EE_SOVEREIGNTY'),
('TECH_EE_EXPLORATION',  'TXT_KEY_TECH_EE_EXPLORATION',  'TXT_KEY_TECH_EXPLORATION_DESC',     'TXT_KEY_TECH_EE_EXPLORATION_HELP',  'ERA_RENAISSANCE',  1,  8, 7, 'TXT_KEY_TECH_EE_EXPLORATION_QUOTE',  1, 'ENLIGHTENMENT_TECH_ATLAS', 'AS2D_TECH_MED_EXPLORATION', 'AS2D_TECH_MED_EXPLORATION'),
('TECH_EE_HUMANISM',     'TXT_KEY_TECH_EE_HUMANISM',     'TXT_KEY_TECH_HUMANISM_DESC',        'TXT_KEY_TECH_EE_HUMANISM_HELP',     'ERA_ENLIGHTENMENT',1,  9, 2, 'TXT_KEY_TECH_EE_HUMANISM_QUOTE',     6, 'ENLIGHTENMENT_TECH_ATLAS', 'AS2D_TECH_EE_HUMANISM',     'AS2D_TECH_EE_HUMANISM'),
('TECH_EE_FLINTLOCK',    'TXT_KEY_TECH_EE_FLINTLOCK',    'TXT_KEY_TECH_EE_FLINTLOCK_DESC',    'TXT_KEY_TECH_EE_FLINTLOCK_HELP',    'ERA_ENLIGHTENMENT',1,  9, 8, 'TXT_KEY_TECH_EE_FLINTLOCK_QUOTE',    0, 'CIVIL_WAR_RESOURCE_ATLAS_EXP2','AS2D_TECH_EE_FLINTLOCK','AS2D_TECH_EE_FLINTLOCK'),
('TECH_EE_MANUFACTURING','TXT_KEY_TECH_EE_MANUFACTURING','TXT_KEY_TECH_EE_MANUFACTURING_DESC','TXT_KEY_TECH_EE_MANUFACTURING_HELP','ERA_ENLIGHTENMENT',1, 10, 4, 'TXT_KEY_TECH_EE_MANUFACTURING_QUOTE',7, 'ENLIGHTENMENT_TECH_ATLAS', 'AS2D_TECH_EE_MANUFACTURING','AS2D_TECH_EE_MANUFACTURING'),
('TECH_EE_WARSHIPS',     'TXT_KEY_TECH_EE_WARSHIPS',     'TXT_KEY_TECH_EE_WARSHIPS_DESC',     'TXT_KEY_TECH_EE_WARSHIPS_HELP',     'ERA_ENLIGHTENMENT',1, 10, 6, 'TXT_KEY_TECH_EE_WARSHIPS_QUOTE',     4, 'TECH_ATLAS_DLC_07',        'AS2D_TECH_WARSHIPS',        'AS2D_TECH_WARSHIPS'),
('TECH_EE_FORTIFICATION','TXT_KEY_TECH_EE_FORTIFICATION','TXT_KEY_TECH_EE_FORTIFICATION_DESC','TXT_KEY_TECH_EE_FORTIFICATION_HELP','ERA_ENLIGHTENMENT',1, 10, 8, 'TXT_KEY_TECH_EE_FORTIFICATION_QUOTE',3, 'ENLIGHTENMENT_TECH_ATLAS', 'AS2D_TECH_EE_FORTIFICATION','AS2D_TECH_EE_FORTIFICATION'),
('TECH_EE_ROMANTICISM',  'TXT_KEY_TECH_EE_ROMANTICISM',  'TXT_KEY_TECH_EE_ROMANTICISM_DESC',  'TXT_KEY_TECH_EE_ROMANTICISM_HELP',  'ERA_INDUSTRIAL',   1, 11, 2, 'TXT_KEY_TECH_EE_ROMANTICISM_QUOTE',  5, 'ENLIGHTENMENT_TECH_ATLAS', 'AS2D_TECH_EE_ROMANTICISM',  'AS2D_TECH_EE_ROMANTICISM');


UPDATE Technologies SET EmbarkedMoveChange = 0 WHERE Type = 'TECH_NAVIGATION';
UPDATE Technologies SET EmbarkedMoveChange = 1 WHERE Type = 'TECH_EE_EXPLORATION';

UPDATE Technologies SET InternationalTradeRoutesChange = 1 WHERE Type = 'TECH_EE_MANUFACTURING';
UPDATE Technologies SET InternationalTradeRoutesChange = 0 WHERE Type = 'TECH_ECONOMICS';
UPDATE Technologies SET InternationalTradeRoutesChange = 1 WHERE Type = 'TECH_EE_EXPLORATION';

UPDATE Technologies SET IconAtlas = 'ENLIGHTENMENT_TECH_ATLAS', PortraitIndex = 0 WHERE Type = 'TECH_ARCHAEOLOGY';

DELETE FROM Tech_SpecialistYieldChanges WHERE TechType = 'TECH_NAVIGATION' AND SpecialistType = 'SPECIALIST_CIVIL_SERVANT';

INSERT INTO Tech_SpecialistYieldChanges (TechType, SpecialistType, YieldType, Yield)
VALUES
	('TECH_RAILROAD',		'SPECIALIST_MERCHANT',	'YIELD_GOLD', 1),
	('TECH_EE_FORTIFICATION','SPECIALIST_ENGINEER',	'YIELD_PRODUCTION', 1),
	('TECH_EE_HUMANISM',	'SPECIALIST_WRITER',	'YIELD_CULTURE', 1),
	('TECH_EE_ROMANTICISM', 'SPECIALIST_MUSICIAN',	'YIELD_CULTURE', 1),
	('TECH_DYNAMITE',		'SPECIALIST_SCIENTIST',	'YIELD_SCIENCE', 1),
	('TECH_EE_ROMANTICISM',	'SPECIALIST_ARTIST',	'YIELD_CULTURE', 1),
	('TECH_EE_SOVEREIGNTY',	'SPECIALIST_CIVIL_SERVANT', 'YIELD_GOLD', 1);

-- Move Coal to Manufacturing
UPDATE Resources SET TechReveal = 'TECH_EE_MANUFACTURING' WHERE Type = 'RESOURCE_COAL';
UPDATE Resources SET TechCityTrade = 'TECH_EE_MANUFACTURING' WHERE Type = 'RESOURCE_COAL';

-- Manufactory
UPDATE Improvement_TechYieldChanges SET TechType = 'TECH_EE_MANUFACTURING' WHERE ImprovementType = 'IMPROVEMENT_MANUFACTORY' AND TechType = 'TECH_FERTILIZER';


--==========================================================================================================================
-- Technology Tree
--==========================================================================================================================

-- Grid X=9 (EE)
UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX = 9, GridY = 4 WHERE Type = 'TECH_ECONOMICS';
UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX = 9, GridY = 6 WHERE Type = 'TECH_NAVIGATION';

-- Grid X=10 (EE)
UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX = 10, GridY = 2 WHERE Type = 'TECH_SCIENTIFIC_THEORY';

-- Grid X=11 (IND)
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX = 11, GridY = 4 WHERE Type = 'TECH_RAILROAD';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX = 11, GridY = 6 WHERE Type = 'TECH_STEAM_POWER';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX = 11, GridY = 8 WHERE Type = 'TECH_RIFLING';

UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX = 12, GridY = 1 WHERE Type = 'TECH_ARCHAEOLOGY';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX = 12, GridY = 3 WHERE Type = 'TECH_FERTILIZER';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX = 12, GridY = 5 WHERE Type = 'TECH_INDUSTRIALIZATION';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX = 12, GridY = 7 WHERE Type = 'TECH_DYNAMITE';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX = 12, GridY = 9 WHERE Type = 'TECH_MILITARY_SCIENCE';

--==========================================================================================================================
-- Prereq Technologies
--==========================================================================================================================

-- Fixing imbalanced tech tree routes for outer techs (before Renaissance)
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_BANKING', 'TECH_GUILDS'),
	('TECH_CHEMISTRY', 'TECH_COMPASS');

-- Grid X=8 (REN)
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_ARCHITECTURE';

INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_ARCHITECTURE', 'TECH_BANKING'),
	('TECH_ARCHITECTURE', 'TECH_PRINTING_PRESS'),
	('TECH_ARCHITECTURE', 'TECH_ASTRONOMY'),
	('TECH_EE_SOVEREIGNTY', 'TECH_BANKING'),
	('TECH_EE_SOVEREIGNTY', 'TECH_PRINTING_PRESS'),
	('TECH_EE_SOVEREIGNTY', 'TECH_ASTRONOMY'),
	('TECH_EE_EXPLORATION', 'TECH_ASTRONOMY'),
	('TECH_EE_EXPLORATION', 'TECH_GUNPOWDER'),
	('TECH_EE_EXPLORATION', 'TECH_CHEMISTRY'),
	('TECH_METALLURGY', 'TECH_ASTRONOMY');

-- Grid X=9 (EE)
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_ECONOMICS';
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_NAVIGATION';

INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_EE_HUMANISM', 'TECH_ARCHITECTURE'),
	('TECH_EE_HUMANISM', 'TECH_EE_SOVEREIGNTY'),
	--('TECH_EE_HUMANISM', 'TECH_GUNPOWDER'), --Gunpowder to Humanism overlaps with Exploration
	('TECH_ECONOMICS', 'TECH_EE_SOVEREIGNTY'),
	('TECH_ECONOMICS', 'TECH_ACOUSTICS'),
	('TECH_NAVIGATION', 'TECH_ACOUSTICS'),
	('TECH_NAVIGATION', 'TECH_EE_EXPLORATION'),
	--('TECH_EE_FLINTLOCK', 'TECH_PRINTING_PRESS'), --Printing Press to Flintlock overlaps with Sovereignty
	('TECH_EE_FLINTLOCK', 'TECH_EE_EXPLORATION'),
	('TECH_EE_FLINTLOCK', 'TECH_METALLURGY');

-- Grid X=10 (EE)
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_SCIENTIFIC_THEORY';

INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_SCIENTIFIC_THEORY', 'TECH_EE_HUMANISM'),
	('TECH_SCIENTIFIC_THEORY', 'TECH_ECONOMICS'),
	('TECH_SCIENTIFIC_THEORY', 'TECH_NAVIGATION'),
	('TECH_EE_MANUFACTURING', 'TECH_EE_HUMANISM'),
	('TECH_EE_MANUFACTURING', 'TECH_ECONOMICS'),
	('TECH_EE_MANUFACTURING', 'TECH_NAVIGATION'),
	('TECH_EE_WARSHIPS', 'TECH_ECONOMICS'),
	('TECH_EE_WARSHIPS', 'TECH_NAVIGATION'),
	('TECH_EE_WARSHIPS', 'TECH_EE_FLINTLOCK'),
	('TECH_EE_FORTIFICATION', 'TECH_ECONOMICS'),
	('TECH_EE_FORTIFICATION', 'TECH_NAVIGATION'),
	('TECH_EE_FORTIFICATION', 'TECH_EE_FLINTLOCK');

-- Grid X=11 (IND)
DELETE FROM Technology_PrereqTechs WHERE TechType IN (
	'TECH_RAILROAD',
	'TECH_STEAM_POWER',
	'TECH_RIFLING');

INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_EE_ROMANTICISM', 'TECH_SCIENTIFIC_THEORY'),
	('TECH_EE_ROMANTICISM', 'TECH_EE_MANUFACTURING'),
	('TECH_EE_ROMANTICISM', 'TECH_EE_WARSHIPS'),
	('TECH_RAILROAD', 'TECH_SCIENTIFIC_THEORY'),
	('TECH_RAILROAD', 'TECH_EE_MANUFACTURING'),
	('TECH_RAILROAD', 'TECH_EE_WARSHIPS'),
	('TECH_STEAM_POWER', 'TECH_EE_MANUFACTURING'),
	('TECH_STEAM_POWER', 'TECH_EE_WARSHIPS'),
	('TECH_STEAM_POWER', 'TECH_EE_FORTIFICATION'),
	('TECH_RIFLING', 'TECH_EE_MANUFACTURING'),
	('TECH_RIFLING', 'TECH_EE_WARSHIPS'),
	('TECH_RIFLING', 'TECH_EE_FORTIFICATION');

-- Grid X=12 (IND)
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_ARCHAEOLOGY';
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_FERTILIZER';

INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_ARCHAEOLOGY', 'TECH_EE_ROMANTICISM'),
	('TECH_ARCHAEOLOGY', 'TECH_RAILROAD'),
	('TECH_FERTILIZER', 'TECH_EE_ROMANTICISM'),
	('TECH_FERTILIZER', 'TECH_RAILROAD'),
	('TECH_MILITARY_SCIENCE', 'TECH_STEAM_POWER');

-- Grid X=13 (MOD)
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_BIOLOGY', 'TECH_INDUSTRIALIZATION'),
	('TECH_COMBUSTION', 'TECH_INDUSTRIALIZATION');

INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_PENICILIN', 'TECH_RADIO'),
	('TECH_COMBINED_ARMS', 'TECH_FLIGHT'),
	('TECH_ECOLOGY', 'TECH_COMPUTERS'),
	('TECH_MOBILE_TACTICS', 'TECH_NUCLEAR_FISSION');

--==========================================================================================================================
-- Flavors
--==========================================================================================================================

INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor)
VALUES
	('TECH_EE_EXPLORATION', 'FLAVOR_RECON', 10),
	('TECH_EE_EXPLORATION', 'FLAVOR_NAVAL_RECON', 10),
	('TECH_EE_EXPLORATION', 'FLAVOR_GOLD', 5),
	('TECH_EE_EXPLORATION', 'FLAVOR_WATER_CONNECTION', 10),
	('TECH_EE_FLINTLOCK', 'FLAVOR_SCIENCE', 8),
	('TECH_EE_FLINTLOCK', 'FLAVOR_DEFENSE', 10),
	('TECH_EE_FLINTLOCK', 'FLAVOR_OFFENSE', 10),
	('TECH_EE_FLINTLOCK', 'FLAVOR_MILITARY_TRAINING', 3),
	('TECH_EE_FLINTLOCK', 'FLAVOR_RANGED', 15),
	('TECH_EE_FORTIFICATION', 'FLAVOR_WONDER', 2),
	('TECH_EE_FORTIFICATION', 'FLAVOR_CITY_DEFENSE', 5),
	('TECH_EE_FORTIFICATION', 'FLAVOR_SCIENCE', 5),
	('TECH_EE_FORTIFICATION', 'FLAVOR_RANGED', 8),
	('TECH_EE_HUMANISM', 'FLAVOR_SCIENCE', 10),
	('TECH_EE_HUMANISM', 'FLAVOR_WONDER', 4),
	('TECH_EE_HUMANISM', 'FLAVOR_CULTURE', 10),
	('TECH_EE_MANUFACTURING', 'FLAVOR_EXPANSION', 5),
	('TECH_EE_MANUFACTURING', 'FLAVOR_GROWTH', 10),
	('TECH_EE_MANUFACTURING', 'FLAVOR_PRODUCTION', 10),
	('TECH_EE_MANUFACTURING', 'FLAVOR_TILE_IMPROVEMENT', 2),
	('TECH_EE_ROMANTICISM', 'FLAVOR_CULTURE', 15),
	('TECH_EE_ROMANTICISM', 'FLAVOR_GOLD', 4),
	('TECH_EE_ROMANTICISM', 'FLAVOR_WONDER', 2),
	('TECH_EE_ROMANTICISM', 'FLAVOR_GROWTH', 2),
	('TECH_EE_SOVEREIGNTY', 'FLAVOR_DIPLOMACY', 4),
	('TECH_EE_SOVEREIGNTY', 'FLAVOR_GREAT_PEOPLE', 3),
	('TECH_EE_SOVEREIGNTY', 'FLAVOR_PRODUCTION', 3),
	('TECH_EE_SOVEREIGNTY', 'FLAVOR_WONDER', 5),
	('TECH_EE_WARSHIPS', 'FLAVOR_NAVAL', 15),
	('TECH_EE_WARSHIPS', 'FLAVOR_MILITARY_TRAINING', 3),
	('TECH_EE_WARSHIPS', 'FLAVOR_NAVAL_RECON', 5),
	('TECH_EE_WARSHIPS', 'FLAVOR_CITY_DEFENSE', 5),
	('TECH_EE_WARSHIPS', 'FLAVOR_WONDER', 2),
	('TECH_EE_WARSHIPS', 'FLAVOR_NAVAL_GROWTH', 5);

--==========================================================================================================================
-- Costs
-- N.Core:	VP changed tech cost with VP v2.7.3, but this mod hasn't been updated to keep up with the new change.
--			So I did a tech cost overhaul to make tech cost (kinda) balanced and have the same accumulation tech spent as VP.
--			Still needs to be tested thoroughly. All the tech cost analysis are on the spreadsheet link down below.
--==========================================================================================================================
														--New VP Cost|Old EEVP Cost|Old VP Cost|BNW Cost|BNW+EE Cost
-- Ancient Era:
UPDATE Technologies SET Cost =    60 WHERE GridX =  1;	--(5 Techs = 300)		--60|60|60|35|35
UPDATE Technologies SET Cost =   100 WHERE GridX =  2;	--(6 Techs = 600)		--100|100|100|55|55
-- Classical Era:
UPDATE Technologies SET Cost =   125 WHERE GridX =  3;	--(5 Techs = 625)		--130|125|130|105|105
UPDATE Technologies SET Cost =   250 WHERE GridX =  4;	--(5 Techs = 1250)		--275|250|275|175|175
-- Medieval Era:
UPDATE Technologies SET Cost =   450 WHERE GridX =  5;	--(5 Techs = 2250)		--500|450|500|275|275
UPDATE Technologies SET Cost =   675 WHERE GridX =  6;	--(4 Techs = 2700)		--700|750|850|485|485
-- Renaissance Era:
UPDATE Technologies SET Cost =  1400 WHERE GridX =  7;	--(5 Techs = 7000)		--1750|1500|1800|780|700
UPDATE Technologies SET Cost =  1900 WHERE GridX =  8;	--(5 Techs = 9500)		--2400|2100|2500|1150|895
-- Enlightenment Era:
UPDATE Technologies SET Cost =  2500 WHERE GridX =  9;	--(4 Techs = 10000)		--n/a|3200|n/a|n/a|1150
UPDATE Technologies SET Cost =  3100 WHERE GridX = 10;	--(4 Techs = 12400)		--n/a|5000|n/a|n/a|1450
-- Industrial Era:
UPDATE Technologies SET Cost =  4000 WHERE GridX = 11;	--(4 Techs = 16000)		--3600|7000|3500|1600|1800
UPDATE Technologies SET Cost =  5500 WHERE GridX = 12;	--(5 Techs = 27500)		--5150|8500|5500|2350|2100
-- Modern Era:
UPDATE Technologies SET Cost =  8300 WHERE GridX = 13;	--(5 Techs = 41500)		--8100|9500|7500|3100|2600
UPDATE Technologies SET Cost = 11000 WHERE GridX = 14;	--(4 Techs = 44000)		--11000|10500|9000|4100|3600
-- Atomic Era:
UPDATE Technologies SET Cost = 13500 WHERE GridX = 15;	--(5 Techs = 67500)		--14500|11000|9500|5100|5100
UPDATE Technologies SET Cost = 16700 WHERE GridX = 16;	--(4 Techs = 66800)		--17700|12500|10000|6400|6400
-- Information Era:
UPDATE Technologies SET Cost = 20250 WHERE GridX = 17;	--(5 Techs = 101250)	--21250|14000|11000|7700|7700
UPDATE Technologies SET Cost = 25000 WHERE GridX = 18;	--(4 Techs = 100000)	--26000|15000|12000|8800|8800
UPDATE Technologies SET Cost = 26150 WHERE GridX = 19;	--(4 Techs = 104600)	--27150|16000|13000|9500|9500
-- Future Era:
UPDATE Technologies SET Cost = 31700 WHERE GridX = 20;							--31700|17000|14000|n/a|n/a
														-- OLD EE  = 534825
														-- OLD VP  = 401825
														-- NEW EE  = 647475
														-- VP	   = 647475

-- Tech cost calculation: https://docs.google.com/spreadsheets/d/1cCWCDfSeKgDomiO2jMnPWiSHoedv57hnM9PT2CECKEw/

--==========================================================================================================================
-- Technical Fix for IconHookup error - icon index:	13	icon size:	45	atlas:	TECH_ATLAS_2	image control:	TechIcon
--==========================================================================================================================
--UPDATE IconTextureAtlases
--SET Atlas = 'TECH_ATLAS_DLC_07'
--WHERE Atlas = 'TECH_ATLAS_2' AND Filename = 'TechnologyAtlas45_DLC_07.dds'

----------------------------------------------------
-- Text (en_US)
----------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_TECH_EE_EXPLORATION', 'Exploration'),
--TXT_KEY_TECH_EE_EXPLORATION_DESC - uses TXT_KEY_TECH_EXPLORATION_DESC from vanilla game
('TXT_KEY_TECH_EE_EXPLORATION_HELP', 'Allows you to build the [COLOR_POSITIVE_TEXT]Galleon[ENDCOLOR], a strong late-Renaissance melee naval unit, and the [COLOR_POSITIVE_TEXT]Explorer[ENDCOLOR], a mid-game scouting unit.'),
('TXT_KEY_TECH_EE_EXPLORATION_QUOTE', '[NEWLINE][TAB][TAB]"We shall not cease from exploration, and the end of all our exploring will be to arrive where we started and know the place for the first time."[NEWLINE][TAB][TAB] - T. S. Eliot[NEWLINE][TAB]'),
('TXT_KEY_TECH_EE_FLINTLOCK', 'Flintlock'),
('TXT_KEY_TECH_EE_FLINTLOCK_DESC', 'The flintlock can either describe a certain lock mechanism which employed a flint to ignite the gunpowder in a musket or rifle, or it can refer to the weapons of the 17th, 18th, and 19th centuries as a whole. These weapons, first developed in France, contained a piece of flint which, when struck with steel (called the "frizzen") would create a spark, which would then fall into a pan containing gunpowder and ignite it, causing the weapon to fire.[NEWLINE][NEWLINE]Because of their improvement over the previous matchlock rifle, the flintlock quickly became popular, gaining prominence during the 1630s as the favoured arm of dragoons serving in the English Civil War, and then in the 1700s as the standard arm for most European footsoldiers. They retained this status up until the mid 19th century, when they were gradually phased out and replaced with the percussion lock and, later, the cartridge-based systems.'),
('TXT_KEY_TECH_EE_FLINTLOCK_HELP', 'Allows you to build the [COLOR_POSITIVE_TEXT]Line Infantry[ENDCOLOR] and the [COLOR_POSITIVE_TEXT]Skirmisher[ENDCOLOR], the basic infantry and ranged units of the Enlightenment Era respectively.'),
('TXT_KEY_TECH_EE_FLINTLOCK_QUOTE', '[NEWLINE][TAB][TAB]"To be prepared for war is one of the most effectual means of preserving peace."[NEWLINE][TAB][TAB] - George Washington[NEWLINE][TAB]'),
('TXT_KEY_TECH_EE_FORTIFICATION', 'Fortification'),
('TXT_KEY_TECH_EE_FORTIFICATION_DESC', 'Fortifications are those structures built to withstand the conditions of warfare. In early history, walls and castles often served as checks against the imposing threat of invasion or conquest, whilst also signifying the residence or territory of a ruling monarch or noble. As the arrival of cannons in the 15th century began to render traditional forts obsolete, new designs which focused upon safeguarding walls behind ditches and ramparts were developed. Like castles before them, however, these structures quickly fell to the advances of military technology, and today, most large-scale fortifications have been made obsolete.'),
('TXT_KEY_TECH_EE_FORTIFICATION_HELP', 'Allows you to build the [COLOR_POSITIVE_TEXT]Field Gun[ENDCOLOR], a strong and effective siege unit. Also allows you to build the [COLOR_POSITIVE_TEXT]Bastion[ENDCOLOR] to further improve the [ICON_STRENGTH] Defense of your cities.'),
('TXT_KEY_TECH_EE_FORTIFICATION_QUOTE', '[NEWLINE][TAB][TAB]"Greatness is nothing unless it be lasting."[NEWLINE][TAB][TAB] - Napoleon Bonaparte[NEWLINE][TAB]'),
('TXT_KEY_TECH_EE_HUMANISM', 'Humanism'),
--TXT_KEY_TECH_EE_HUMANISM_DESC - uses TXT_KEY_TECH_HUMANISM_DESC from vanilla game
('TXT_KEY_TECH_EE_HUMANISM_QUOTE', '[NEWLINE][TAB][TAB]"What is a man? A miserable little pile of secrets."[NEWLINE][TAB][TAB] - Count Dracula [NEWLINE][TAB]'),
('TXT_KEY_TECH_EE_HUMANISM_HELP', 'Allows you to build both the [COLOR_POSITIVE_TEXT]Academy[ENDCOLOR] and the [COLOR_POSITIVE_TEXT]Salon[ENDCOLOR], two mutually-exclusive buildings which boost either the science or culture output of your cities respectively.'),
('TXT_KEY_TECH_EE_MANUFACTURING', 'Manufacturing'),
('TXT_KEY_TECH_EE_MANUFACTURING_DESC', 'Manufacturing is the process of producing goods that can then be sold or used, most often by turning raw materials into merchandise. In pre-industrial societies, the production of such merchandise was often carried out by artisans, overseen by collective guilds which ensured the protection and enterprise of their craft. Alongside the development of factories, and, particularly, with the advent of the Assembly Line in the 1910s, manufacturing became an industrial process, often concerned with the mass production of goods for profit. Manufactories - complexes of factories, assembly plants, foundries, etc. - thus became highly mechanized, and the need for such skilled artisans in the manufacturing process became obsolete.'),
('TXT_KEY_TECH_EE_MANUFACTURING_HELP', 'Reveals [ICON_RES_COAL] [COLOR_POSITIVE_TEXT]Coal[ENDCOLOR] and allows you to build the [COLOR_POSITIVE_TEXT]Cloth Mill[ENDCOLOR], which increases production in the city.'),
('TXT_KEY_TECH_EE_MANUFACTURING_QUOTE', '[NEWLINE][TAB][TAB]"Let us rather run the risk of wearing out than rusting out."[NEWLINE][TAB][TAB] - Theodore Roosevelt[NEWLINE][TAB]'),
('TXT_KEY_TECH_EE_ROMANTICISM', 'Romanticism'),
('TXT_KEY_TECH_EE_ROMANTICISM_DESC', 'The Romantic era was an age of literary and artistic expression which grew out of opposition to the scientific Enlightenment. It was characterised by ideals of freedom and idealism versus ideals of rationalism and realism. Many romantic thinkers were great artists, musicians, and writers, who sought to elicit intense emotion as a means to see the world around them. These thinkers would come to shape the political ideas of liberalism and radicalism which contrast so deeply with the pessimistic and cynical ideas of conservatism and realism of the modern age.[NEWLINE][NEWLINE]Romanticism reached its peak during the 19th Century, at the height of the Industrial Revolution. Artists and writers from England to Russia all celebrated in an idealistic view of humankind. Its emphasis on imagination and individual heroism was a popular distraction from the rapid changes heralded by an age dominated by global and urban empires seeking wealth and gain. It criticised authority and intellectual objectivity, and gave society a sense of quality and unity which would come to inspire ideals of the nationalism and fraternity.'),
('TXT_KEY_TECH_EE_ROMANTICISM_HELP', 'Allows you to build the [COLOR_POSITIVE_TEXT]Menagerie[ENDCOLOR], which increases [ICON_HAPPINESS_1] Happiness in the empire and makes [ICON_GOLDEN_AGE] Golden Ages more likely.'),
('TXT_KEY_TECH_EE_ROMANTICISM_QUOTE', '[NEWLINE][TAB][TAB]"The greatest happiness for the thinking man is to have fathomed the fathomable, and to quietly revere the unfathomable."[NEWLINE][TAB][TAB] - Johann Wolfgang Goethe[NEWLINE][TAB]'),
('TXT_KEY_TECH_EE_SOVEREIGNTY', 'Sovereignty'),
('TXT_KEY_TECH_EE_SOVEREIGNTY_DESC', 'Sovereignty is the political concept of supreme authority. Although in the modern sense sovereignty is usually associated with the highest authority of or within a state, it can also refer to the highest means of any individual to take independent action. This was the traditional sense of the word during the Middle Ages, when sovereignty was merely translated as being the legal or assertive capability of any individual to act independent of others. It was not until the Age of Enlightenment and the Peace of Westphalia that sovereignty became regarded legally as being the power of states to act autonomously of one another.[NEWLINE][NEWLINE]Sovereignty first became popularised by the idea of the “Social Contract,” which was first conceived by the political philosopher Thomas Hobbes as a means to explain the inception of society. Hobbes stipulated that, in order to avoid a state of perpetual conflict between mankind, or a state of “war of all against all,” individuals consent to giving up certain freedoms and benefits to an absolute and indivisible authority that can compel mankind to act in the common interest.[NEWLINE][NEWLINE]On this basis was created the ideal of Absolute Monarchy, which would be practiced in states such as Sweden and Prussia during the 17th and 18th centuries. The French philosopher Jean-Jacques Rousseau, however, would conceive of the notion of popular sovereignty, which instead considers supreme authority as being legitimately held by the people, and merely entrusted into a government to be exercised. It was on the basis of this popular sovereignty that nations such as the United States of America and the French Republic were conceived.[NEWLINE][NEWLINE]Today, most legitimate forms of sovereignty are either popular (as in a Presidential Republic, or as in the Kingdoms of Belgium and Sweden, and the State of Japan) or Parliamentary (as in a Constitutional Monarchy or Parliamentary Republic). In the case of the latter, sovereignty is retained by a supreme authority (the people or the monarch), but exercised on that authority’s behalf by a Parliament, which is usually democratically elected. In this way, most forms of sovereignty are, at least hypothetically, de facto exercised by popular consent, differing greatly from the indivisible form of which Hobbes first conceived.'),
('TXT_KEY_TECH_EE_SOVEREIGNTY_HELP', 'Allows you to build a range of buildings and wonders focused on great person generation.'),
('TXT_KEY_TECH_EE_SOVEREIGNTY_QUOTE', '[NEWLINE][TAB][TAB]"A State is but an Artificial Man in which the Sovereignty is an Artificial Soul, as giving life and motion to the whole body."[NEWLINE][TAB][TAB] - Thomas Hobbes[NEWLINE][TAB]'),
('TXT_KEY_TECH_EE_WARSHIPS', 'Warships'),
('TXT_KEY_TECH_EE_WARSHIPS_DESC', 'While many ships are engineered to cross oceans quickly or take the greatest amount of cargo in the smallest possible space, warships were designed for one purpose alone - destroying other ships.  Besides obviously being armed with some form of weapon (traditionally things like cannon or rams), warships can also withstand more damage and are much more maneuverable than something like a merchant or passenger vessel.[NEWLINE][NEWLINE]As naval technologies have advanced, so has the warship.  Galleys and triremes were early forms of warships capable of ramming enemy vessels, but usually combat was performed by the army onboard.  However, once cannon became capable of quick reloads, large sail-driven ships were employed which held rows of cannon along each side of the craft. Eventually these wooden ships were given up for ones made of iron and steel, and sails were abandoned for steam and nuclear power. While modern warships bear little resemblance to the earliest galleys, they still keep to the same basic design principles - be capable of destroying the other guy first, before he can take out you.'),
('TXT_KEY_TECH_EE_WARSHIPS_HELP', 'Allows you to build the [COLOR_POSITIVE_TEXT]Frigate[ENDCOLOR], an integral ranged unit in Enlightenment era navies.'),
('TXT_KEY_TECH_EE_WARSHIPS_QUOTE', '[NEWLINE][TAB][TAB]"Damn the torpedoes, Full speed ahead!"[NEWLINE][TAB][TAB] - Admiral David Glasgow Farragut[NEWLINE][TAB]');
