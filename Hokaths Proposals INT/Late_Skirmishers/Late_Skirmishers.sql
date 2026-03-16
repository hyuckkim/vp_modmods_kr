--=========================================================================================================================
-- Update art and text on Light Tank (Anti-Tank Gun)
------------------------------------------------------------------------------------
UPDATE Language_ko_KR
SET Text = 'Armored Car'
WHERE Tag = 'TXT_KEY_UNIT_AT_GUN';

UPDATE Language_ko_KR
SET Text = 'The Armored Car is a specialized combat unit designed for hit-and-run tactics. Back them up with Zone of Control and other forms of support for a potent Modern Era fighting force.'
WHERE Tag = 'TXT_KEY_UNIT_AT_GUN_STRATEGY';

-- A light tank is a tank variant initially designed for rapid movement, and now primarily employed in the reconnaissance role, or in support of expeditionary forces where main battle tanks cannot be made available. Early light tanks were generally armed and armored similar to an armored car, but used tracks in order to provide better cross-country mobility. The fast light tank was a major feature of the pre-WWII buildup, where it was expected they would be used to exploit breakthroughs in enemy lines created by slower, heavier tanks. Numerous small tank designs and "tankettes" were developed during this period and known under a variety of names, including the ''combat car''.

UPDATE Language_ko_KR
SET Text = 'An armored car is a wheeled armoured fighting vehicle, historically employed for reconnaissance, internal security, armed escort, and other subordinate battlefield tasks. With the gradual decline of mounted cavalry, armored cars were developed for carrying out duties formerly assigned to light cavalry. Following the invention of the tank, the armoured car remained popular due to its faster speed, comparatively simple maintenance and low production cost. in WWII, some cars equipped with heavier armament could even substitute for tracked combat vehicles in favorable conditions—such as pursuit or flanking maneuvers during the North African campaign.'
WHERE Tag = 'TXT_KEY_CIV5_INDUSTRIAL_ANTITANKGUN_TEXT';

--=========================================================================================================================
-- Text 
------------------------------------------------------
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_UNIT_UTILITY_HELICOPTER', 'Utility Helicopter'),
	('TXT_KEY_UNIT_UTILITY_HELICOPTER_HELP', ''),  -- Highly mobile Skirmisher Unit. Is capable of hovering over Mountains and Coast.
	('TXT_KEY_UNIT_UTILITY_HELICOPTER_STRATEGY', 'As the first hovering Unit, you can use the Helicopter to attack across new terrain that was previously impassable. This includes coastal regions and therefore even allows you to leverage your force of Skirmisher units to aid your Navy, or defend against those of the enemy.'),
	('TXT_KEY_UNIT_UTILITY_HELICOPTER_PEDIA', 'The first turbine-powered helicopter in service with the United States military was the Bell UH-1 Iroquois (nickname Huey). Development of the Iroquois started in the early 1950s, a major impetus being a requirement issued by the United States Army for a new medical evacuation and utility helicopter. In military terms, a utility helicopter is an aircraft designed to transport troops, but is versatile in performing various combat roles. These tasks include command and control, logistics, casualty evacuation, and fire support. Their lightweight frames make them capable of quick maneuvers, but the cost of construction is also considerable.');

UPDATE Language_ko_KR SET
Text = 'Hovering Units'
WHERE Tag = 'TXT_KEY_AIRPOWER_HELIGUNSHIPS_HEADING2_TITLE';

UPDATE Language_ko_KR SET
Text = 'Hovering Units, such as the Utility Helicopter and Helicopter Gunship, move over both Land and Coastal tiles at the cost of 1[ICON_MOVES] Movement. This includes normally Impassable Terrain. As a result, Hovering Units can attack enemies from novel and possible undefended locations and retreat behind natural barriers and bodies of water to avoid counterattack. However they cannot attack while over Ocean tiles.'
WHERE Tag = 'TXT_KEY_AIRPOWER_HELIGUNSHIPS_HEADING2_BODY';

UPDATE Language_ko_KR SET
Text = Replace(Text, ' gunships', 's')  -- so it says helicopters
WHERE Tag = 'TXT_KEY_AIRPOWER_AIRUNITS_HEADING2_BODY';