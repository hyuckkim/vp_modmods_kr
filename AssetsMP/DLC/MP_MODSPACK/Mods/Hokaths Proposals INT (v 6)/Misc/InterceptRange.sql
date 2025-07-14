-- Anti-Aircraft Gun
UPDATE Language_ko_KR
SET Text = 'These specialized artillery units will automatically attack any air unit bombing a target within 1 tile. (They can only intercept one unit per turn.) They are quite weak in combat against other ground units and should be defended by stronger units when under threat of ground attack.'
WHERE Tag = 'TXT_KEY_UNIT_ANTI_AIRCRAFT_STRATEGY';

-- Mobile SAM
UPDATE Language_ko_KR
SET Text = 'Mobile SAM (surface-to-air) units provide an advancing army with anti-air defense. Mobile SAM units can intercept and shoot at enemy aircraft bombing targets within 2 hexes (but only one unit per turn). These units are fairly vulnerable to non-air attack and should be accompanied by infantry or armor.'
WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM_STRATEGY';

-- Carrier
UPDATE Language_ko_KR
SET Text = 'The Carrier is a specialized vessel which carries fighter airplanes, bombers, and atomic bombs. The Carrier itself is unable to attack, but the aircraft it carries make it the most powerful offensive weapon afloat. Defensively, however, the Carrier is weak and should be escorted by destroyers and submarines. Carriers are, however, armed with anti-air weaporny, and will automatically attack any air unit bombing a target within 2 tiles. (They can only intercept one unit per turn.)'
WHERE Tag = 'TXT_KEY_UNIT_CARRIER_STRATEGY';

-- Supercarrier
UPDATE Language_ko_KR
SET Text = 'Carries 5 aircrafts (up to 8 with promotions), has a high Air Interception range of 3 and can detect Submarines.[NEWLINE][NEWLINE]May only have [COLOR_POSITIVE_TEXT]2[ENDCOLOR] Supercarriers active at one time.'
WHERE Tag = 'TXT_KEY_UNIT_SUPERCARRIER_HELP';

-- other texts dont seem to mention specifics about the range
