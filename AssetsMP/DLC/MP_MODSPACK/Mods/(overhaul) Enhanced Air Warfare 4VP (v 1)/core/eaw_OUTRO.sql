
-- rev 11

-----------------------------------------------------------------------------------------------------------
-----  TXT UPDATE

-----  VP renamed the "Great War Bomber" to "Bomber". EAW renames it "Biplane Bomber"SET UPDATE
UPDATE Language_en_US
SET Text = 'Biplane Bomber'
WHERE Tag = 'TXT_KEY_UNIT_WWI_BOMBER';
UPDATE Language_en_US
SET Text = 'The Biplane Bomber is an early air unit. It is effective against ground targets, less so against naval targets, and it is quite vulnerable to enemy aircraft. The Biplane Bomber can be based on a player-owned city or aboard a carrier. It can move from base to base and perform missions within its range. Use it to attack enemy units and cities. When possible, send in Triplanes or Monoplanes first to "use up" enemy anti-aircraft defenses for that turn. See the rules on Aircraft for more information.'
WHERE Tag = 'TXT_KEY_UNIT_WWI_BOMBER_STRATEGY';

-----  The Civ5 Jet Fighter(F-22 model) is renamed "Stealth Fighter" because it is!
UPDATE Language_en_US
SET Text = 'Stealth Fighter'
WHERE Tag = 'TXT_KEY_UNIT_JET_FIGHTER';
UPDATE Language_en_US
SET Text = 'Air Unit designed to wrest control of the skies and intercept incoming Enemy Aircraft. [COLOR_POSITIVE_TEXT]Does not use Military Supply.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_UNIT_HELP_JET_FIGHTER';
UPDATE Language_en_US
SET Text = 'The Stealth Fighter is a very powerful air unit. It can be based in any city you own or aboard an aircraft carrier. It can move from base to base and can perform "missions" within its range. Use Stealth Fighters to attack enemy aircraft and ground units, to scout enemy positions, and to defend against enemy air attacks. Stealth Fighters are especially effective against enemy helicopters. The Stealth Fighter has the "air recon" ability, which means that everything within 6 tiles of its starting location is visible at the beginning of the turn. See the rules on Aircraft for more information.'
WHERE Tag = 'TXT_KEY_UNIT_JET_FIGHTER_STRATEGY';
UPDATE Language_en_US
SET Text = 'The idea of making combat aircrafts invisible came naturally, like any camouflage techniques, since the very beginning of the aviation history. In 1917, the German manufacturer Linke-Hofmann built the prototype of a heavy bomber, the Linke-Hofmann R.I, covered by transparent Cellon. Later on, The Horten Ho 229 flying wing fighter-bomber, developed in Nazi Germany during the last years of WW2 was an other attempt.[NEWLINE] Finally, the firt operational stealth aircraft was the Lockheed F-117 Nighthawk, a strictly ground-attack aircraft in 1983, followed by the Northrop Grumman B-2 Spirit in 1997, a $2 billion heavy strategic bomber, and the Lockheed Martin F-22 Raptor in 2005, an all-weather stealth tactical fighter aircraft.[NEWLINE]The general design of a stealth aircraft is always aimed at reducing radar and thermal detection. ''Reducing'' is the Key word here. As stealth technology advances so does the capability of radar systems. Passive radar, bistatic radar, multistatic radar systems, VHF AESA, OTH radar and infrared search and track (IRST) system, promise to defeat any fighter or bomber that takes himself for the invisible Man.[NEWLINE]On recent events, many pilots and war strategists prefered to rely on the high tactical capabilities of modern, efficient and no-stealth aircrafts to succeed in delicate missions. The stealth aspect of future planes will play an important role in combat, as will maneuverability, speed, load capacities, countermeasure techniques and mass effect.'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_UNITS_MODERN_JETFIGHTER_TEXT';

----- Finest Hour TXT Update
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Their Finest Hour[ENDCOLOR]: [ICON_STRENGTH] Combat Strength of Cities increased by 33%. +25% [ICON_PRODUCTION] Production towards Air Units in all Cities. Can build [COLOR_YELLOW]B17 Bombers[ENDCOLOR] and [COLOR_YELLOW]B-52 Bombers[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_POLICY_THEIR_FINEST_HOUR_HELP';

----- Policy Military TXT Update
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Air Supremacy[ENDCOLOR]: Receive a free Airport in every City. +25% [ICON_PRODUCTION] Production when building Air units. Can build [COLOR_YELLOW]Zeroes[ENDCOLOR] and [COLOR_YELLOW]MiG-29[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_POLICY_MILITARISM_HELP';

----- AMERICAN_B17 TXT Update .Range 9
UPDATE Language_en_US
SET Text = 'The B17 Bomber is unique to the Freedom Ideology. Requires the Their Finest Hour Tenet to be unlocked. It is similar to the bomber, but it is more difficult for enemy anti-aircraft and fighters to target. The B17 also receives a bonus when attacking enemy cities. Unlike the bomber, its range is 9. See the rules on Aircraft for more details.'
WHERE Tag = 'TXT_KEY_UNIT_AMERICAN_B17_STRATEGY';

----- JAPANESE_ZERO TXT Update .Range 8
UPDATE Language_en_US
SET Text = 'The Zero is unique to the Autocracy Ideology. Requires the Air Supremacy Tenet to be unlocked. The Zero is a moderately-powerful air unit. It is like the standard fighter, except that it gets a significant combat bonus when battling other fighters and [COLOR_POSITIVE_TEXT]does not require the Oil resource[ENDCOLOR]. It can be based in any city you own or aboard an aircraft carrier. It can move from city to city (or carrier) and can perform "missions" within its range of 8 tiles. See the rules on Aircraft for more information.'
WHERE Tag = 'TXT_KEY_UNIT_JAPANESE_ZERO_STRATEGY';

-----------------------------------------------------------------------------------------------------------
----- TECH UPDATE

----- Stealth Bomber @ TECH_NANOTECHNOLOGY 
UPDATE Units SET PrereqTech = 'TECH_NANOTECHNOLOGY' WHERE Type = 'UNIT_STEALTH_BOMBER';

----- Stealth Fighter @ TECH_STEALTH
UPDATE Units SET PrereqTech = 'TECH_STEALTH' WHERE Type = 'UNIT_JET_FIGHTER';

-----------------------------------------------------------------------------------------------------------
----- UNITS UPGRADE SET

----- Upgrades: Stealth Fighter > Advanced Fighter
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JET_FIGHTER';
INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
VALUES ('UNIT_JET_FIGHTER', 'UNITCLASS_ADVJET');

----- Upgrades: B-17 / Bomber > Strategic Bomber
UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_ULTJETBOMB' WHERE UnitType = 'UNIT_AMERICAN_B17';
UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_ULTJETBOMB' WHERE UnitType = 'UNIT_BOMBER';

-----------------------------------------------------------------------------------------------------------
----- OBSOLETE SET

----- New obsolescence rules
UPDATE Units SET ObsoleteTech = 'TECH_STEALTH' WHERE Type = 'UNIT_FIGHTER'; -- Jet Fighter (Oil SR) is never obsolete
UPDATE Units SET ObsoleteTech = 'TECH_LASERS' WHERE Type = 'UNIT_BOMBER'; -- Jet Bomber (Oil SR) is never obsolete
UPDATE Units SET ObsoleteTech = 'TECH_GLOBALIZATION' WHERE Type = 'UNIT_JET_FIGHTER'; -- Advanced Fighter (Alu SR) is superior tan Stealth Fighter
UPDATE Units SET ObsoleteTech = 'TECH_LASERS' WHERE Type = 'UNIT_AMERICAN_B17'; -- B-52 is never obsolete
UPDATE Units SET ObsoleteTech = 'TECH_STEALTH' WHERE Type = 'UNIT_JAPANESE_ZERO'; -- MiG-29 is never obsolete

-----------------------------------------------------------------------------------------------------------
----- P-80 INSERT

----- Pentagon gives 2x P-80 Shooting Star instead of 2x Stealth Fighters
UPDATE Building_FreeUnits SET UnitType = 'UNIT_EARLYJET' WHERE BuildingType = 'BUILDING_PENTAGON' AND NumUnits = '2';

UPDATE Language_en_US
SET Text = 'Requires completion of [COLOR_MAGENTA]Imperialism[ENDCOLOR] Branch. Increases the Military Unit Supply Cap by 1, and the Air Unit Cap by 2 in every City. Receive 2 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] exclusive P-80 Shooting Star in the City when completed. +50% [ICON_PRODUCTION] Production of Air Units in the City, and Air Units created in the City gain +20 XP. Owned [ICON_SPY] Spies are much more likely to disrupt Unit [ICON_PRODUCTION] Production via Advanced Actions.'
WHERE Tag = 'TXT_KEY_WONDER_PENTAGON_HELP';

-----------------------------------------------------------------------------------------------------------
----- Upgrades / Tenet

----- Medium Bomber now upgrades into B-52 if you have POLICY_THEIR_FINEST_HOUR
----- Monoplane now upgrades into MiG-29 if you have POLICY_MILITARISM
INSERT INTO Policy_UnitClassReplacements
	(PolicyType, ReplacedUnitClassType, ReplacementUnitClassType)
VALUES
	('POLICY_MILITARISM', 'UNITCLASS_JET27', 'UNITCLASS_MIG29');
	
INSERT INTO Policy_UnitClassReplacements
	(PolicyType, ReplacedUnitClassType, ReplacementUnitClassType)
VALUES
	('POLICY_THEIR_FINEST_HOUR', 'UNITCLASS_STRBOMB', 'UNITCLASS_B52');

-----------------------------------------------------------------------------------------------------------
----- ArtDefine_ UPDATE

UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.6 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BOMBER'; -- was 1.79999995231628
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.7 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_B17'; -- was 1.20000004768372
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.3 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER'; -- was 1.60000002384186
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.7 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIGHTER'; -- was 1.60000002384186
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.72 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO'; -- was 1.60000002384186
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.5 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JETFIGHTER'; -- was 3
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_STEALTHBOMBER'; -- was more
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.36 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER'; -- was more

UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 0.37 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER'; -- was 0.25
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 0.41 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER'; -- was 0.5
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 0.35 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO'; -- was 0.25
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 0.45 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO'; -- was 0.5
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 0.21 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER'; -- was more
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 0.31 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER'; -- was more
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 0.32 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BOMBER'; -- was more
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 0.42 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BOMBER'; -- was more

UPDATE ArtDefine_UnitMemberCombats SET AttackRadius = 125 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JETFIGHTER'; -- was 135

UPDATE ArtDefine_UnitMemberCombatWeapons SET ProjectileSpeed = 1 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER' AND "Index" = 1 AND SubIndex = 1; -- was 1.29999995231628
UPDATE ArtDefine_UnitMemberCombatWeapons SET ProjectileSpeed = 1.5 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIGHTER' AND "Index" = 0 AND SubIndex = 1; -- was 3
UPDATE ArtDefine_UnitMemberCombatWeapons SET ProjectileSpeed = 1.6 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO' AND "Index" = 0 AND SubIndex = 1; -- was 1.29999995231628
UPDATE ArtDefine_UnitMemberCombatWeapons SET ProjectileSpeed = 2.3 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JETFIGHTER' AND "Index" = 0 AND SubIndex = 0; -- was 3
UPDATE ArtDefine_UnitMemberCombatWeapons SET ProjectileSpeed = 2.4 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JETFIGHTER' AND "Index" = 1 AND SubIndex = 1; -- was 3

UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 3 WHERE UnitInfoType = 'ART_DEF_UNIT_JET_FIGHTER'; -- was 1

-----------------------------------------------------------------------------------------------------------
----- UnitGameplay2DScripts / Audio_3DSounds UPDATE

UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_GOTHA', FirstSelectionSound = 'AS2D_SELECT_GOTHA' WHERE UnitType = 'UNIT_WWI_BOMBER'; -- was vanilla UNIT_BOMBER sound
UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_AVROL', FirstSelectionSound = 'AS2D_SELECT_AVROL' WHERE UnitType = 'UNIT_BOMBER'; -- was vanilla UNIT_BOMBER sound
UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_B17', FirstSelectionSound = 'AS2D_SELECT_B17' WHERE UnitType = 'UNIT_AMERICAN_B17'; -- was vanilla UNIT_BOMBER sound
UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_B2', FirstSelectionSound = 'AS2D_SELECT_B2' WHERE UnitType = 'UNIT_STEALTH_BOMBER'; -- was weird!
UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_FOK', FirstSelectionSound = 'AS2D_SELECT_FOK' WHERE UnitType = 'UNIT_TRIPLANE'; -- was vanilla UNIT_FIGHTER

UPDATE Audio_3DSounds SET MaxVolume = 59,	MinVolume = 41 WHERE ScriptID = 'AS3D_UNIT_STEALTH_BOMBER_STEALTH_BOMBER_TURN' AND SoundID = 'SND_UNIT_STEALTH_BOMBER_TURN' AND SoundType = 'GAME_SFX'; -- was 75,75

-----------------------------------------------------------------------------------------------------------
----- FLAVOR SET

----- Unit_Flavors
UPDATE Unit_Flavors SET Flavor = 17 WHERE UnitType = 'UNIT_JET_FIGHTER' AND FlavorType = 'FLAVOR_ANTIAIR'; -- was 15

----- Technology_Flavors
UPDATE Technology_Flavors SET Flavor = 20 WHERE TechType = 'TECH_STEALTH' AND FlavorType = 'FLAVOR_AIR'; -- was 10
UPDATE Technology_Flavors SET Flavor = 20 WHERE TechType = 'TECH_LASERS' AND FlavorType = 'FLAVOR_AIR'; -- was 10
UPDATE Technology_Flavors SET Flavor = 10 WHERE TechType = 'TECH_LASERS' AND FlavorType = 'FLAVOR_OFFENSE'; -- was 5

INSERT INTO Technology_Flavors
	(TechType, FlavorType, Flavor)
VALUES
	('TECH_ATOMIC_THEORY', 'FLAVOR_AIR', 25),             -- _EARLYMONOPLAN and _MEDIUMBOMBER
	('TECH_ATOMIC_THEORY', 'FLAVOR_OFFENSE', 15),
	
	('TECH_TELECOM', 'FLAVOR_AIR', 25),                   -- _JET27 and _JETBOMB
	('TECH_TELECOM', 'FLAVOR_OFFENSE', 15),
	
	('TECH_PARTICLE_PHYSICS', 'FLAVOR_AIR', 25),          -- _STEALTH_BOMBER
	('TECH_PARTICLE_PHYSICS', 'FLAVOR_OFFENSE', 15),
	
	('TECH_GLOBALIZATION', 'FLAVOR_AIR', 25),             -- _ADVJET
	('TECH_GLOBALIZATION', 'FLAVOR_OFFENSE', 15),
	
	('TECH_STEALTH', 'FLAVOR_OFFENSE', 12);               -- _JET_FIGHTER
