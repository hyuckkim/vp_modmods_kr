
-- rev 11

-----------------------------------------------------------------------------------------------------------
-----  TXT UPDATE

-----  VP renamed the "Great War Bomber" to "Bomber". EAW renames it "Biplane Bomber"SET UPDATE
UPDATE Language_ko_KR
SET Text = '복엽 폭격기'
WHERE Tag = 'TXT_KEY_UNIT_WWI_BOMBER';
UPDATE Language_ko_KR
SET Text = '복엽 폭격기는 초기형 공중 유닛입니다. 지상 목표물에는 효과적이지만 해상 목표물에는 덜 효과적이며 적 항공기에 상당히 취약합니다. 복엽 폭격기는 플레이어 소유 도시나 항공모함에 배치할 수 있습니다. 기지 간을 이동하며 사정거리 내에서 임무를 수행할 수 있습니다. 적 유닛과 도시를 공격하는 데 사용하세요. 가능하다면 삼엽기나 단엽기를 먼저 투입하여 해당 턴의 적 대공 방어 시설을 "소모"하세요. 자세한 내용은 항공기 규칙을 참조하세요.'
WHERE Tag = 'TXT_KEY_UNIT_WWI_BOMBER_STRATEGY';

-----  The Civ5 Jet Fighter(F-22 model) is renamed "Stealth Fighter" because it is!
UPDATE Language_ko_KR
SET Text = '스텔스 전투기'
WHERE Tag = 'TXT_KEY_UNIT_JET_FIGHTER';
UPDATE Language_ko_KR
SET Text = '제공권을 장악하고 적 항공기의 접근을 차단하도록 설계된 공군 유닛입니다. [COLOR_POSITIVE_TEXT]군사 보급 한도를 차지하지 않습니다.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_UNIT_HELP_JET_FIGHTER';
UPDATE Language_ko_KR
SET Text = '스텔스 전투기는 매우 강력한 공중 유닛입니다. 자신이 소유한 도시나 항공모함에 주둔할 수 있습니다. 기지 간 이동이 가능하며, 사거리 내에서 "임무"를 수행할 수 있습니다. 스텔스 전투기를 사용하여 적 항공기와 지상 유닛을 공격하고, 적의 위치를 ​​정찰하고, 적의 공중 공격을 방어하세요. 스텔스 전투기는 특히 적 헬리콥터에 효과적입니다. 스텔스 전투기는 "공중 정찰" 능력을 가지고 있어, 턴 시작 시 시작 지점으로부터 6타일 이내의 모든 것을 볼 수 있습니다. 자세한 내용은 항공기 규칙을 참조하세요.'
WHERE Tag = 'TXT_KEY_UNIT_JET_FIGHTER_STRATEGY';
UPDATE Language_ko_KR
SET Text = '전투기를 투명하게 만드는 아이디어는 다른 위장 기법과 마찬가지로 항공 역사 초기부터 자연스럽게 등장했습니다. 1917년, 독일의 링케-호프만은 투명한 셀론(Cellon)으로 덮인 중폭격기 시제품인 링케-호프만 R.I를 제작했습니다. 이후 제2차 세계 대전 말 나치 독일에서 개발된 호르텐 Ho 229 전익 전폭기 또한 또 다른 시도였습니다.[NEWLINE]마지막으로, 최초의 스텔스 항공기는 1983년 지상 공격 전용 항공기인 록히드 마틴 F-117 나이트호크였고, 그 뒤를 이어 1997년에는 20억 달러 규모의 중형 전략 폭격기인 노스롭 그루먼 B-2 스피릿, 그리고 2005년에는 전천후 스텔스 전술 전투기인 록히드 마틴 F-22 랩터가 등장했습니다.[NEWLINE]스텔스 항공기의 전반적인 설계는 항상 레이더와 열 탐지를 줄이는 것을 목표로 합니다. 여기서 핵심 단어는 "줄인다"입니다. 스텔스 기술이 발전함에 따라 레이더 시스템의 성능도 향상됩니다. 수동 레이더, 바이스태틱 레이더, 멀티스태틱 레이더 시스템, VHF AESA, OTH 레이더, 그리고 적외선 탐색 및 추적(IRST) 시스템은 자신을 투명인간으로 여기는 전투기나 폭격기를 격파할 수 있을 것으로 기대됩니다.[NEWLINE]최근 많은 조종사와 전쟁 전략가들은 섬세한 임무 수행을 위해 현대적이고 효율적이며 스텔스 기능이 없는 항공기의 높은 전술적 역량에 의존하는 것을 선호했습니다. 미래 항공기의 스텔스 기능은 기동성, 속도, 탑재량, 대응 기술, 그리고 대량 효과와 마찬가지로 전투에서 중요한 역할을 할 것입니다.'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_UNITS_MODERN_JETFIGHTER_TEXT';

----- Finest Hour TXT Update
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]그들의 최고의 순간[ENDCOLOR]: [ICON_STRENGTH] 도시에서의 전투력이 33% 증가합니다. 모든 도시의 항공 유닛 [ICON_PRODUCTION] 생산력이 +25% 증가합니다. [COLOR_YELLOW]B-17 폭격기[ENDCOLOR]와 [COLOR_YELLOW]B-52 폭격기[ENDCOLOR]를 제작할 수 있습니다.'
WHERE Tag = 'TXT_KEY_POLICY_THEIR_FINEST_HOUR_HELP';

----- Policy Military TXT Update
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]공중 우세[ENDCOLOR]: 모든 도시에서 무료 공항을 받습니다. 항공 유닛 생산 시 [ICON_PRODUCTION] 생산량이 +25% 증가합니다. [COLOR_YELLOW]제로센[ENDCOLOR]과 [COLOR_YELLOW]MiG-29[ENDCOLOR]를 제작할 수 있습니다.'
WHERE Tag = 'TXT_KEY_POLICY_MILITARISM_HELP';

----- AMERICAN_B17 TXT Update .Range 9
UPDATE Language_ko_KR
SET Text = 'B-17 폭격기는 자유 이념의 고유 무기입니다. "그들의 최고의 순간" 교리를 해제해야 합니다. 폭격기와 유사하지만, 적 대공포와 전투기의 조준이 더 어렵습니다. 또한 B-17은 적 도시를 공격할 때 보너스를 받습니다. 폭격기와 달리 사거리는 9입니다. 자세한 내용은 항공기 규칙을 참조하세요.'
WHERE Tag = 'TXT_KEY_UNIT_AMERICAN_B17_STRATEGY';

----- JAPANESE_ZERO TXT Update .Range 8
UPDATE Language_ko_KR
SET Text = '제로센은 독재 이념의 고유 유닛입니다. 공중 우위 교리를 해제해야 합니다. 제로센은 중간 정도의 위력을 가진 항공 유닛입니다. 일반 전투기와 유사하지만, 다른 전투기와 전투 시 상당한 전투 보너스를 받으며 [COLOR_POSITIVE_TEXT]석유 자원이 필요하지 않습니다[ENDCOLOR]. 제로센은 자신이 소유한 도시나 항공모함에 주둔할 수 있습니다. 도시에서 도시(또는 항공모함)로 이동할 수 있으며, 8타일 범위 내에서 "임무"를 수행할 수 있습니다. 자세한 내용은 항공기 규칙을 참조하세요.'
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

UPDATE Language_ko_KR
SET Text = '[COLOR_MAGENTA]제국주의[ENDCOLOR] 계열 정책 완료가 필요합니다. 모든 도시의 군사 유닛 보급 한도가 1만큼, 항공 유닛 보급 한도가 2만큼 증가합니다. 완료 시 도시에 전용으로 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] P-80 슈팅스타 2대를 획득합니다. 도시 내 항공 유닛 [ICON_PRODUCTION] 생산력이 +50% 증가하고, 도시 내에서 항공 유닛을 생산할 시 +20 XP를 획득합니다. 소유한 [ICON_SPY] 스파이는 고급 행동을 통해 유닛 [ICON_PRODUCTION] 생산을 방해할 가능성이 훨씬 더 높습니다.'
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
