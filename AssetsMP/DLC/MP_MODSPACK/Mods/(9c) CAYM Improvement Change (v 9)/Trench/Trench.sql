------=========================
--           ATTACK TRENCH 
--------=============================================

INSERT OR REPLACE INTO LocalizedText
	(Language, Tag, Text)
VALUES	
    ('en_US','TXT_KEY_ATTACK_TRENCH','Trench'),
	('en_US','TXT_KEY_ATTACK_TRENCH_HELP','Trench provides +25% [ICON_STRENGTH] Defensive Strength in this Tile. Can be built on enemy territory.'),
	('en_US','TXT_KEY_ATTACK_TRENCH_TEXT', 'Trench (motte-and-bailey fort) is a fortification with a wooden or stone keep situated on a raised earthwork called a motte, accompanied by an enclosed courtyard, or bailey, surrounded by a protective ditch and palisade. Relatively easy to build with unskilled, often forced labour, but still militarily formidable, these forts were built across northern Europe from the 10th century onwards, spreading from Normandy and Anjou in France, into the Holy Roman Empire in the 11th century. The Normans introduced the design into England and Wales following their invasion in 1066. Motte-and-bailey forts were adopted in Scotland, Ireland, the Low Countries and Denmark in the 12th and 13th centuries. Motte-and-bailey earthworks were put to various uses over later years; in some cases, reused as military defences during the Second World War.'),
	('en_US','TXT_KEY_BUILD_ATTACK_TRENCH', 'Construct Trench'),
	('en_US','TXT_KEY_BUILD_ATTACK_TRENCH_REC','Build near enemy cities to strengthen ground units.');

INSERT OR REPLACE INTO LocalizedText
	(Language, Tag, Text)
VALUES
	('ko_KR','TXT_KEY_ATTACK_TRENCH', '참호'),
	('ko_KR','TXT_KEY_ATTACK_TRENCH_HELP','적의 도시 근처에 건설하여 지상유닛을 보호합니다.[NEWLINE]이 타일에 주둔하는 유닛의 방어력이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다.'),
	('ko_KR','TXT_KEY_ATTACK_TRENCH_TEXT', '참호는 보호용 도랑과 방벽으로 둘러싸인 돌출된 토공 위에 위치한 나무 또는 돌로 된 요새입니다. 비숙련 노동과 강제 노동으로 비교적 쉽게 건설할 수 있지만 여전히 군사적으로 강력한 이 요새는 10세기부터 북유럽 전역에 걸쳐 건설되었으며 프랑스의 노르망디와 앙주에서 11세기에 신성 로마 제국으로 퍼졌습니다. 아시아에서는 토성으로 구축하였습니다. 노르만인은 1066년에 잉글랜드와 웨일즈에 이 디자인을 도입했습니다. 참호는 12세기와 13세기에 스코틀랜드, 아일랜드, 저지대 및 덴마크에서 채택되었습니다. 참호 공사는 이후 몇 년 동안 다양한 용도로 사용되었습니다. 어떤 경우에는 제 2 차 세계 대전 중 군사 방어 수단으로 재사용되었습니다. '),
	('ko_KR','TXT_KEY_BUILD_ATTACK_TRENCH', '참호 건설'),
    ('ko_KR','TXT_KEY_BUILD_ATTACK_TRENCH_REC','적의 도시 근처에 건설하여 지상유닛을 보호합니다.');

INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) 
VALUES 
	('UNIT_ACTION_DLC04_ATLAS', 64, 'UnitAction64_DLC_Denmark.dds', 1, 1),
	('UNIT_ACTION_DLC04_ATLAS', 45, 'UnitAction45_DLC_Denmark.dds', 1, 1),
	('UNIT_ACTION_DLC04_GOLD_ATLAS', 64, 'UnitActionGold64_DLC_Denmark.dds', 1, 1),
	('UNIT_ACTION_DLC04_GOLD_ATLAS', 45, 'UnitActionGold45_DLC_Denmark.dds', 1, 1),
	('DENMARK_TERRAIN_ATLAS', 256, 'TerrainIcons256_DLC_Denmark.dds', 2, 1),
	('DENMARK_TERRAIN_ATLAS', 64, 'TerrainIcons64_DLC_Denmark.dds', 2, 1);

INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
SELECT 'IMPROVEMENT_ATTACK_TRENCH', 'TERRAIN_GRASS'  UNION ALL
SELECT 'IMPROVEMENT_ATTACK_TRENCH', 'TERRAIN_PLAINS' UNION ALL
SELECT 'IMPROVEMENT_ATTACK_TRENCH', 'TERRAIN_DESERT' UNION ALL
SELECT 'IMPROVEMENT_ATTACK_TRENCH', 'TERRAIN_TUNDRA' UNION ALL
SELECT 'IMPROVEMENT_ATTACK_TRENCH', 'TERRAIN_SNOW';


INSERT INTO Improvements
  (Type, Description, Civilopedia, Help, ArtDefineTag, PortraitIndex, IconAtlas)
VALUES
  ('IMPROVEMENT_ATTACK_TRENCH','TXT_KEY_ATTACK_TRENCH','TXT_KEY_ATTACK_TRENCH_TEXT',
   'TXT_KEY_ATTACK_TRENCH_HELP','ART_DEF_IMPROVEMENT_MOTTE_BAILEY',1,'DENMARK_TERRAIN_ATLAS');

UPDATE Improvements
SET OutsideBorders = 1,
    DestroyedWhenPillaged = 1,
    DisplacePillager = 1,
    NoTwoAdjacent = 1,
    Water = 0
WHERE Type = 'IMPROVEMENT_ATTACK_TRENCH';

INSERT INTO Improvement_ResourceTypes
  (ImprovementType, ResourceType, ResourceMakesValid)
VALUES
  ('IMPROVEMENT_ATTACK_TRENCH', 'RESOURCE_IRON', 1),
  ('IMPROVEMENT_ATTACK_TRENCH', 'RESOURCE_HORSE', 1),
  ('IMPROVEMENT_ATTACK_TRENCH', 'RESOURCE_COAL', 1);


INSERT INTO Builds
  (Type, PrereqTech, Time, ImprovementType, Description, Help, Recommendation,
   Water, CanBeEmbarked, EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas)
VALUES
  ('BUILD_ATTACK_TRENCH','TECH_IRON_WORKING',300,'IMPROVEMENT_ATTACK_TRENCH',
   'TXT_KEY_BUILD_ATTACK_TRENCH','TXT_KEY_BUILD_ATTACK_TRENCH_HELP','TXT_KEY_BUILD_ATTACK_TRENCH_REC',
   0,0,'ENTITY_EVENT_BUILD','KB_P',98,0,'UNIT_ACTION_DLC04_ATLAS');

INSERT OR IGNORE INTO Unit_Builds (UnitType, BuildType) VALUES
('UNIT_ROMAN_LEGION','BUILD_ATTACK_TRENCH'),
('UNIT_WORKER','BUILD_ATTACK_TRENCH');

UPDATE Builds SET ObsoleteTech = 'TECH_RAILROAD' WHERE Type = 'BUILD_ATTACK_TRENCH';

INSERT INTO BuildFeatures (BuildType, FeatureType, PrereqTech, Time, Production, Remove) VALUES
('BUILD_ATTACK_TRENCH','FEATURE_FOREST','TECH_MINING',300,NULL,NULL),
('BUILD_ATTACK_TRENCH','FEATURE_JUNGLE','TECH_BRONZE_WORKING',300,NULL,NULL),
('BUILD_ATTACK_TRENCH','FEATURE_MARSH','TECH_MASONRY',300,NULL,NULL);

UPDATE Improvements
SET DefenseModifier = 25
WHERE Type = 'IMPROVEMENT_ATTACK_TRENCH';

INSERT INTO Improvement_Flavors (ImprovementType, FlavorType, Flavor)
VALUES
  ('IMPROVEMENT_ATTACK_TRENCH', 'FLAVOR_OFFENSE', 12),      
  ('IMPROVEMENT_ATTACK_TRENCH', 'FLAVOR_MILITARY_TRAINING', 6), 
  ('IMPROVEMENT_ATTACK_TRENCH', 'FLAVOR_DEFENSE', 5),     
  ('IMPROVEMENT_ATTACK_TRENCH', 'FLAVOR_TILE_IMPROVEMENT', 4); 

