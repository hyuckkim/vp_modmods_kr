--=========================================================================================================================
-- Atlases for icons
--=========================================================================================================================
INSERT INTO IconTextureAtlases 
	(Atlas,	   IconSize,  	Filename, 		IconsPerRow, 	IconsPerColumn)
VALUES	
	('Barbarians_Atlas', 256,  'Barbarians_256.dds',	4, 		1),
	('Barbarians_Atlas', 128,  'Barbarians_128.dds',	4, 		1),
	('Barbarians_Atlas',  80,   'Barbarians_80.dds',	4, 		1),
	('Barbarians_Atlas',  64,   'Barbarians_64.dds',	4, 		1),
	('Barbarians_Atlas',  45,   'Barbarians_45.dds',	4, 		1);


UPDATE Units SET
Description = 'TXT_KEY_UNIT_BARBARIAN_ARCHER',
IconAtlas = 'Barbarians_Atlas',
PortraitIndex = 3
WHERE Type = 'UNIT_BARBARIAN_ARCHER';

UPDATE Units SET
Description = 'TXT_KEY_UNIT_BARBARIAN_HORSEMAN',
IconAtlas = 'Barbarians_Atlas',
PortraitIndex = 1
WHERE Type = 'UNIT_BARBARIAN_HORSEMAN';

UPDATE Units SET
Description = 'TXT_KEY_UNIT_BARBARIAN_SPEARMAN',
IconAtlas = 'Barbarians_Atlas',
PortraitIndex = 0
WHERE Type = 'UNIT_BARBARIAN_SPEARMAN';

UPDATE Units SET
Description = 'TXT_KEY_UNIT_BARBARIAN_SWORDSMAN',
IconAtlas = 'Barbarians_Atlas',
PortraitIndex = 2
WHERE Type = 'UNIT_BARBARIAN_SWORDSMAN';

UPDATE Units SET
Description = 'TXT_KEY_UNIT_BARBARIAN_GALLEY',
Help = 'TXT_KEY_UNIT_GALLEY_HELP'
WHERE Type = 'UNIT_GALLEY';

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_UNIT_BARBARIAN_ARCHER', 'Thief'),
	('TXT_KEY_UNIT_BARBARIAN_HORSEMAN', 'Marauder'),
	('TXT_KEY_UNIT_BARBARIAN_SPEARMAN', 'Poacher'),
	('TXT_KEY_UNIT_BARBARIAN_SWORDSMAN', 'Reaver'),
	('TXT_KEY_UNIT_BARBARIAN_GALLEY', 'Raider'),
	('TXT_KEY_UNIT_GALLEY_HELP', '');




