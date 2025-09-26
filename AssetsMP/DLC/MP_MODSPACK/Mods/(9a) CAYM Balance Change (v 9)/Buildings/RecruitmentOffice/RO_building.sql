 --=====================================
--2023.09.03 CAYM
--=====================================
-- Original Author : Asterix Rage
--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('BUILDING_RO_ATLAS',256,'building_RO_256.dds',1,1),
('BUILDING_RO_ATLAS',128,'building_RO_128.dds',1,1),
('BUILDING_RO_ATLAS',80,'building_RO_080.dds',1,1),
('BUILDING_RO_ATLAS',64,'building_RO_064.dds',1,1),
('BUILDING_RO_ATLAS',45,'building_RO_045.dds',1,1);
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
-- BuildingClasses
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description) VALUES
('BUILDINGCLASS_RO', 'BUILDING_RO', 'TXT_KEY_BUILDING_RO');

------------
-- Buildings
INSERT INTO Buildings (Type, BuildingClass, Cost, HurryCostModifier, GoldMaintenance, PrereqTech, ConquestProb, CitySupplyFlat, IconAtlas, PortraitIndex, Description, Help, Civilopedia, Strategy, NeverCapture) VALUES
('BUILDING_RO', 'BUILDINGCLASS_RO', 2250, -20, 8, 'TECH_COMBINED_ARMS', 0, 1, 'BUILDING_RO_ATLAS', 0, 'TXT_KEY_BUILDING_RO', 'TXT_KEY_BUILDING_RO_HELP', 'TXT_KEY_BUILDING_RO_TEXT', 'TXT_KEY_BUILDING_RO_STRATEGY', 1);

-- Building_ClassesNeededInCity
INSERT INTO Building_ClassesNeededInCity(BuildingType, BuildingClassType) VALUES
('BUILDING_RO', 'BUILDINGCLASS_MILITARY_ACADEMY');

-- Building_DomainFreeExperiences
INSERT INTO Building_DomainFreeExperiences(BuildingType, DomainType, Experience) VALUES
('BUILDING_RO', 'DOMAIN_LAND',  15),
('BUILDING_RO', 'DOMAIN_SEA',   15),
('BUILDING_RO', 'DOMAIN_AIR',   15),
('BUILDING_RO', 'DOMAIN_HOVER', 15);

UPDATE Buildings
SET TrainedFreePromotion = 'PROMOTION_MORALE_EVENT',
	PolicyType = 'POLICY_VOLUNTEER_ARMY'
WHERE Type = 'BUILDING_RO';

-- Building_Flavors
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_RO', 'FLAVOR_MILITARY_TRAINING', 30),
('BUILDING_RO', 'FLAVOR_OFFENSE', 30);

------------------------------------------------
---Text (en_US)
-------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_RO','Recruitment Office'),
('TXT_KEY_BUILDING_RO_HELP','Increases the [ICON_WAR] Military Unit Supply Cap by 1.[NEWLINE]Grants +15 XP and the [COLOR_PLAYER_PURPLE] FERVOR [ENDCOLOR] promotion to all Units when built. [NEWLINE][NEWLINE]Only available to Civilizations following the [COLOR_MAGENTA]Freedom[ENDCOLOR] Ideology. Requires the [COLOR_MAGENTA]Draft Registration[ENDCOLOR] Tenet to be unlocked'),
('TXT_KEY_BUILDING_RO_STRATEGY','The Recruitment Office is a late game building which provides an experience boost for military units. The City must already have a Military Academy before the Recruitment Office can be constructed.'),
('TXT_KEY_BUILDING_RO_TEXT',"A recruitment office is a location where individuals are recruited for the military or other public service organizations, typically on a voluntary basis. It usually targets individuals with specific job skills or special abilities.[NEWLINE][NEWLINE]Recruitment offices played a particularly crucial role during World War I and World War II. During WWI, the U.S. launched extensive recruitment campaigns with famous slogans like 'Your Country Needs You' on posters. Similarly, in WWII, recruitment offices used phrases like 'Uncle Sam Wants You' to attract a large number of recruits.[NEWLINE][NEWLINE]Recruitment offices exist in various forms not just in times of war but also during peace. They are used to secure manpower not only for the military but also for other public service organizations like the police force, fire departments, and emergency rescue services.");

------------------------------------------------
---Text (ko_KR)
-------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_BUILDING_RO','모병소'),
('TXT_KEY_BUILDING_RO_HELP','도시에서 생산하는 유닛의 경험치가 [COLOR_POSITIVE_TEXT]15[ENDCOLOR] 증가합니다. 도시에서 생산하는 모든 유닛에 [COLOR_PLAYER_PURPLE]열의[ENDCOLOR] 승급을 부여합니다.  [ICON_WAR] 전역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]사관학교[ENDCOLOR]가 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_IDEOLOGY_FREEDOM][COLOR_MAGENTA]평등[ENDCOLOR] 이념을 따르는 문명만 건설할 수 있고 [COLOR_MAGENTA]징집[ENDCOLOR] 이념주의를 채택해야 합니다.'),
('TXT_KEY_BUILDING_RO_STRATEGY','모병소는 게임 후반 건물로 군사 유닛에 열의 승급을를 부여합니다. 모병소를 건설하려면 도시에 사관 학교가 있어야 합니다.'),
('TXT_KEY_BUILDING_RO_TEXT',"모병소는 군대나 다른 공공 기관에 필요한 인원을 모집하는 곳으로, 주로 자원봉사자 기반의 모집 방식을 따른다. 여기서는 일반적으로 특정 직업군이나 특수 능력을 가진 인원을 대상으로 모집한다.[NEWLINE][NEWLINE]모병소는 국가나 정부가 군대에 필요한 병력을 자원 봉사자의 형태로 모집하기 위해 설치되는 곳이다. 1차 세계대전과 2차 세계대전 시기에 이런 모병소는 특히 중요한 역할을 했다. 1차 세계대전 때는 미국이 'Your Country Needs You' 등의 슬로건으로 유명한 포스터를 통해 집중적으로 병력을 모집했다. 2차 세계대전에서도 모병소는 'Uncle Sam Wants You' 같은 표어로 많은 병력을 모집했다.모병소는 전쟁뿐만 아니라 평화 시기에도 다양한 형태로 존재한다. 이는 군대 뿐만 아니라 경찰, 소방서, 긴급 구조대 등 다양한 공공기관에서 필요로 하는 인력을 확보하기 위한 수단으로 쓰인다.");
