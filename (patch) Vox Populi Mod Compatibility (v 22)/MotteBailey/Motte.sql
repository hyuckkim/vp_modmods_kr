UPDATE ArtDefine_Landmarks
SET Scale= '0.80'
WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_MOTTE_BAILEY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE Improvements
SET DefenseModifier = '20'
WHERE Type = 'IMPROVEMENT_MAB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE Improvements
SET MakesPassable = '1'
WHERE Type = 'IMPROVEMENT_MAB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE Improvements
SET BuildableOnResources = '0'
WHERE Type = 'IMPROVEMENT_MAB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE Improvements
SET DestroyedWhenPillaged = '0'
WHERE Type = 'IMPROVEMENT_MAB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE Improvements
SET OutsideBorders = '0'
WHERE Type = 'IMPROVEMENT_MAB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE Improvements
SET NoTwoAdjacent = '1'
WHERE Type = 'IMPROVEMENT_MAB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE BuildFeatures
SET Remove = '0'
WHERE BuildType = 'BUILD_MAB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE BuildFeatures
SET Time = '0'
WHERE BuildType = 'BUILD_MAB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE Builds
SET PrereqTech = 'TECH_CONSTRUCTION'
WHERE Type = 'BUILD_MAB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

INSERT INTO Improvement_TechYieldChanges (ImprovementType, TechType, YieldType, Yield)
SELECT 'IMPROVEMENT_MAB', 'TECH_ARCHAEOLOGY', 'YIELD_CULTURE', 2 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1) UNION ALL
SELECT 'IMPROVEMENT_MAB', 'TECH_ENGINEERING', 'YIELD_PRODUCTION', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

INSERT INTO Improvement_RouteYieldChanges (ImprovementType, RouteType, YieldType, Yield)
SELECT 'IMPROVEMENT_MAB', 'ROUTE_ROAD', 'YIELD_GOLD', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1) UNION ALL
SELECT 'IMPROVEMENT_MAB', 'ROUTE_RAILROAD', 'YIELD_GOLD', 1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE Language_en_US
SET Text = 'The Motte-and-Bailey Fort provides +20% [ICON_STRENGTH] Defensive Strength for any Unit stationed in this Tile. Any enemy unit which ends its turn next to the Motte and Bailey Fort takes 10 damage.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_MAB_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE Language_en_US
SET Text = '+15% [ICON_STRENGTH] Defensive Strength for any Unit stationed in this Tile. Any enemy unit which ends its turn next to the Motte and Bailey takes 10 damage. If the fort is connected by roads or railroads, +1 [ICON_GOLD] gold.'
WHERE Tag = 'TXT_KEY_BUILD_MAB_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE Language_en_US
SET Text = 'It will improve the [ICON_STRENGTH] Defense of any military unit stationed in this tile and cause damage to enemy units that end their turn adjacent.'
WHERE Tag = 'TXT_KEY_BUILD_MMAB_REC' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);

UPDATE Language_en_US
SET Text = 'A motte-and-bailey fort is a fortification with a wooden or stone keep situated on a raised earthwork called a motte, accompanied by an enclosed courtyard, or bailey, surrounded by a protective ditch and palisade. Relatively easy to build with unskilled, often forced labour, but still militarily formidable, these forts were built across northern Europe from the 10th century onwards, spreading from Normandy and Anjou in France, into the Holy Roman Empire in the 11th century. The Normans introduced the design into England and Wales following their invasion in 1066. Motte-and-bailey forts were adopted in Scotland, Ireland, the Low Countries and Denmark in the 12th and 13th centuries. Motte-and-bailey earthworks were put to various uses over later years; in some cases, reused as military defences during the Second World War. Any unit stationed within a Motte-and-Bailey fort receives a 15% defensive strength bonus. Additionally, any enemy unit which ends its turn next to it takes 10 damage.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_MAB_TEXT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 1);