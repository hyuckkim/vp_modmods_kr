-- ----------------------------------------------
-- -- Spaceship Factory & HUBBLE
-- ----------------------------------------------
UPDATE Buildings
SET PrereqTech = 'TECH_ORBITAL_DEV', Cost = 3500, GoldMaintenance = 15
WHERE Type = 'BUILDING_SPACESHIP_FACTORY';
UPDATE Language_ko_KR SET Text = Text||'[NEWLINE][NEWLINE]이 도시에서 훈련된 우주선, 스페이스 마린, ODST 및 XCOM 유닛의 [ICON_STRENGTH] 전투력이 +15%  증가합니다.' WHERE Tag IN ('TXT_KEY_BUILDING_SPACESHIP_FACTORY_HELP');