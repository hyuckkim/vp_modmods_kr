--------------------------------------------------------------------------------------------------
-- Turn Founding Religious Events on in CustomModOptions
--------------------------------------------------------------------------------------------------
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_FOUND_RELIGION';
INSERT INTO CustomModOptions (Name, Value, Class) VALUES ('BUGFIX_DUMMY_POLICIES', 1, 1);

--------------------------------------------------------------------------------------------------
-- Setup file for Religious Events
--------------------------------------------------------------------------------------------------
INSERT INTO	Policies (Type,Description,IsDummy) VALUES
('POLICY_PILGRIMAGE_DUMMY',	'TXT_KEY_POLICY_PILGRIMAGE_DUMMY', 1),
('POLICY_CEREMONIAL_BURIAL_DUMMY',	'TXT_KEY_POLICY_CEREMONIAL_BURIAL_DUMMY', 1),
('POLICY_PAPAL_PRIMACY_DUMMY',	'TXT_KEY_POLICY_PAPAL_PRIMACY_DUMMY', 1),
('POLICY_INTERFAITH_DIALOGUE_DUMMY',	'TXT_KEY_POLICY_INTERFAITH_DIALOGUE_DUMMY', 1),
('POLICY_CHURCH_PROPERTY_DUMMY',	'TXT_KEY_POLICY_CHURCH_PROPERTY_DUMMY', 1),
('POLICY_PEACE_LOVING_DUMMY',	'TXT_KEY_POLICY_PEACE_LOVING_DUMMY', 1),
('POLICY_WORLD_CHURCH_DUMMY',	'TXT_KEY_POLICY_WORLD_CHURCH_DUMMY', 1),
('POLICY_TITHE_DUMMY',	'TXT_KEY_POLICY_TITHE_DUMMY', 1),
('POLICY_INITIATION_RITES_DUMMY',	'TXT_KEY_POLICY_INITIATION_RITES_DUMMY', 1);

--------------------------------------------------------------------------------------------------
-- Text
--------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES 
('TXT_KEY_POLICY_PILGRIMAGE_DUMMY', 'Has Pilgrimage Founder'),
('TXT_KEY_POLICY_CEREMONIAL_BURIAL_DUMMY', 'Has Ceremonial Burial Founder'),
('TXT_KEY_POLICY_PAPAL_PRIMACY_DUMMY', 'Has Council of Elders Founder'),
('TXT_KEY_POLICY_INTERFAITH_DIALOGUE_DUMMY', 'Has Hero Worship Founder'),
('TXT_KEY_POLICY_CHURCH_PROPERTY_DUMMY', 'Has Holy Law Founder'),
('TXT_KEY_POLICY_PEACE_LOVING_DUMMY', 'Has Divine Inheritance Founder'),
('TXT_KEY_POLICY_WORLD_CHURCH_DUMMY', 'Has Theocratic Rule Founder'),
('TXT_KEY_POLICY_TITHE_DUMMY', 'Has Revelation Founder'),
('TXT_KEY_POLICY_INITIATION_RITES_DUMMY', 'Has Transcendent Thoughts Founder');

--------------------------------------------------------------------------------------------------
-- Disabled Religious event choice text
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_EVENT_RELIGION_DISABLED_HELP', 'Conditions are not quite right for this choice to be available.');
--
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
-- Dummy Buildings for Event 5
-- 'BUILDINGCLASS_RELIGION_FREESPY_DUMMY', 'BUILDINGCLASS_RELIGION_NOSPY_DUMMY', 'BUILDINGCLASS_RELIGION_GOODSPY_DUMMY'
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,DefaultBuilding) VALUES 
('BUILDINGCLASS_RELIGION_FREESPY_DUMMY','BUILDING_RELIGION_FREESPY_DUMMY'),
('BUILDINGCLASS_RELIGION_NOSPY_DUMMY','BUILDING_RELIGION_NOSPY_DUMMY'),
('BUILDINGCLASS_RELIGION_GOODSPY_DUMMY','BUILDING_RELIGION_GOODSPY_DUMMY');

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,ExtraSpies) VALUES
('BUILDING_RELIGION_FREESPY_DUMMY','BUILDINGCLASS_RELIGION_FREESPY_DUMMY','TXT_KEY_BUILDING_RELIGION_SPY_DUMMY',-1,-1,1,-1,0,1,1,1);

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,GlobalEspionageModifier) VALUES
('BUILDING_RELIGION_NOSPY_DUMMY','BUILDINGCLASS_RELIGION_NOSPY_DUMMY','TXT_KEY_BUILDING_RELIGION_SPY_DUMMY',-1,-1,1,-1,0,1,1,-15);

INSERT INTO Buildings (Type,BuildingClass,Description,Cost,FaithCost,IsDummy,GreatWorkCount,ConquestProb,NeverCapture,NukeImmune,InstantSpyRankChange) VALUES
('BUILDING_RELIGION_GOODSPY_DUMMY','BUILDINGCLASS_RELIGION_GOODSPY_DUMMY','TXT_KEY_BUILDING_RELIGION_SPY_DUMMY',-1,-1,1,-1,0,1,1,1);

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_RELIGION_SPY_DUMMY','[ICON_PEACE] ReligiousEvent Spy Dummy Building');
--------------------------------------------------------------------------------------------------
-- End Dummy Buildings
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
-- Promotions
--------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions(Type,Description,Help,CannotbeChosen,PortraitIndex,IconAtlas,PediaType,PediaEntry) VALUES 
('PROMOTION_RELIGION_PILGRIMAGE','TXT_KEY_PROMOTION_RELIGION_PILGRIMAGE','TXT_KEY_PROMOTION_RELIGION_PILGRIMAGE_HELP','true',4,'KRIS_SWORDSMAN_PROMOTION_ATLAS','PEDIA_SHARED','TXT_KEY_PROMOTION_RELIGION_PILGRIMAGE'),
('PROMOTION_RELIGION_CEREMONIAL_BURIAL','TXT_KEY_PROMOTION_RELIGION_CEREMONIAL_BURIAL','TXT_KEY_PROMOTION_RELIGION_CEREMONIAL_BURIAL_HELP','true',4,'KRIS_SWORDSMAN_PROMOTION_ATLAS','PEDIA_SHARED','TXT_KEY_PROMOTION_RELIGION_CEREMONIAL_BURIAL'),
('PROMOTION_RELIGION_HERO_WORSHIP','TXT_KEY_PROMOTION_RELIGION_HERO_WORSHIP','TXT_KEY_PROMOTION_RELIGION_HERO_WORSHIP_HELP','true',4,'KRIS_SWORDSMAN_PROMOTION_ATLAS','PEDIA_SHARED','TXT_KEY_PROMOTION_RELIGION_HERO_WORSHIP'),
('PROMOTION_RELIGION_THEOCRATIC_RULE','TXT_KEY_PROMOTION_RELIGION_THEOCRATIC_RULE','TXT_KEY_PROMOTION_RELIGION_THEOCRATIC_RULE_HELP','true',4,'KRIS_SWORDSMAN_PROMOTION_ATLAS','PEDIA_SHARED','TXT_KEY_PROMOTION_RELIGION_THEOCRATIC_RULE');

INSERT INTO UnitPromotions(Type,Description,Help,CannotbeChosen,PortraitIndex,IconAtlas,PediaType,PediaEntry,EnemyHealChange,NeutralHealChange) VALUES 
('PROMOTION_RELIGION_DIVINE_INHERITANCE','TXT_KEY_PROMOTION_RELIGION_DIVINE_INHERITANCE','TXT_KEY_PROMOTION_RELIGION_DIVINE_INHERITANCE_HELP','true',4,'KRIS_SWORDSMAN_PROMOTION_ATLAS','PEDIA_SHARED','TXT_KEY_PROMOTION_RELIGION_DIVINE_INHERITANCE',5,5);

INSERT INTO UnitPromotions(Type,Description,Help,CannotbeChosen,PortraitIndex,IconAtlas,PediaType,PediaEntry,GreatGeneralModifier) VALUES 
('PROMOTION_RELIGION_TRANSCENDENT_THOUGHTS','TXT_KEY_PROMOTION_RELIGION_TRANSCENDENT_THOUGHTS','TXT_KEY_PROMOTION_RELIGION_TRANSCENDENT_THOUGHTS_HELP','true',4,'KRIS_SWORDSMAN_PROMOTION_ATLAS','PEDIA_SHARED','TXT_KEY_PROMOTION_RELIGION_TRANSCENDENT_THOUGHTS',100);

INSERT INTO UnitPromotions_UnitCombats(PromotionType,UnitCombatType) VALUES
('PROMOTION_RELIGION_PILGRIMAGE', 'UNITCOMBAT_MELEE'),
('PROMOTION_RELIGION_PILGRIMAGE', 'UNITCOMBAT_ARCHER'),
('PROMOTION_RELIGION_PILGRIMAGE', 'UNITCOMBAT_SIEGE'),
('PROMOTION_RELIGION_PILGRIMAGE', 'UNITCOMBAT_GUN'),
('PROMOTION_RELIGION_CEREMONIAL_BURIAL', 'UNITCOMBAT_MELEE'),
('PROMOTION_RELIGION_CEREMONIAL_BURIAL', 'UNITCOMBAT_ARCHER'),
('PROMOTION_RELIGION_CEREMONIAL_BURIAL', 'UNITCOMBAT_SIEGE'),
('PROMOTION_RELIGION_CEREMONIAL_BURIAL', 'UNITCOMBAT_GUN'),
('PROMOTION_RELIGION_HERO_WORSHIP', 'UNITCOMBAT_MELEE'),
('PROMOTION_RELIGION_HERO_WORSHIP', 'UNITCOMBAT_GUN'),
('PROMOTION_RELIGION_TRANSCENDENT_THOUGHTS', 'UNITCOMBAT_MELEE'),
('PROMOTION_RELIGION_TRANSCENDENT_THOUGHTS', 'UNITCOMBAT_GUN');

INSERT INTO UnitPromotions_UnitCombatMods(PromotionType,UnitCombatType,Modifier) VALUES
('PROMOTION_RELIGION_CEREMONIAL_BURIAL','UNITCOMBAT_MELEE',15),
('PROMOTION_RELIGION_CEREMONIAL_BURIAL','UNITCOMBAT_GUN',15);

INSERT INTO UnitPromotions_YieldFromKills(PromotionType,YieldType,Yield) VALUES
('PROMOTION_RELIGION_HERO_WORSHIP','YIELD_GOLDEN_AGE_POINTS',10);

INSERT INTO Language_en_US (Tag, Text) VALUES 
('TXT_KEY_PROMOTION_RELIGION_PILGRIMAGE','Mastery'),
('TXT_KEY_PROMOTION_RELIGION_PILGRIMAGE_HELP','Earn additional XP on kills'),
('TXT_KEY_PROMOTION_RELIGION_CEREMONIAL_BURIAL','Steadfast'),
('TXT_KEY_PROMOTION_RELIGION_CEREMONIAL_BURIAL_HELP','Increases both combat and defensive effectiveness by 15% against Melee and Gun Units'),
('TXT_KEY_PROMOTION_RELIGION_HERO_WORSHIP','Victory'),
('TXT_KEY_PROMOTION_RELIGION_HERO_WORSHIP_HELP','Earns [ICON_GOLDEN_AGE] Golden Age Points from kills'),
('TXT_KEY_PROMOTION_RELIGION_DIVINE_INHERITANCE','Blessed'),
('TXT_KEY_PROMOTION_RELIGION_DIVINE_INHERITANCE_HELP','Gains +5 additional HP in neutral and enemy lands'),
('TXT_KEY_PROMOTION_RELIGION_THEOCRATIC_RULE','Studious'),
('TXT_KEY_PROMOTION_RELIGION_THEOCRATIC_RULE_HELP','Earns [ICON_RESEARCH] Science from leveling up'),
('TXT_KEY_PROMOTION_RELIGION_TRANSCENDENT_THOUGHTS','Disciplined'),
('TXT_KEY_PROMOTION_RELIGION_TRANSCENDENT_THOUGHTS_HELP','Earns Great Generals 100% faster'),
('TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_DESCRIPTION', 'Unforunately, our resources are committed elsewhere at this moment. Have the priesthood maintain their current focus.'),
('TXT_KEY_PLAYER_EVENT_NOTHANKS_RELIGION_CHOICE_0_HELP', 'Invest [1_YieldCost] for a 25% chance to earn {2_InstantYield}.'),
('TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0', 'The priesthood made a new discovery that resulted in {2_InstantYield]'),
('TXT_KEY_NOTIFICATION_EVENT_NOTHANKS_RELIGION_CHOICE_0_S', 'Focused Success!');
