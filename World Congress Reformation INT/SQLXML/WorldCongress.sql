UPDATE Units 
SET ObsoleteTech = NULL 
WHERE Type = 'UNIT_MARINE';

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost) 
SELECT 'UNIT_XCOM_SQUAD', 'RESOURCE_ALUMINUM', 1;

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) 
SELECT 'UNIT_XCOM_SQUAD', 'PROMOTION_AMPHIBIOUS';

UPDATE LeagueSpecialSessions
Set CivDelegates = 1, HostDelegates = 2, CityStateDelegates = 1
WHERE Type = 'LEAGUE_SPECIAL_SESSION_START_WORLD_CONGRESS';

UPDATE LeagueSpecialSessions
Set CivDelegates = 1, HostDelegates = 3
WHERE Type = 'LEAGUE_SPECIAL_SESSION_WELCOME_CITY_STATES';

UPDATE LeagueSpecialSessions
Set CivDelegates = 1, HostDelegates = 4, CityStateDelegates = 1
WHERE Type = 'LEAGUE_SPECIAL_SESSION_LEADERSHIP_COUNCIL';

UPDATE LeagueSpecialSessions
Set CivDelegates = 2, HostDelegates = 5
WHERE Type = 'LEAGUE_SPECIAL_SESSION_START_UNITED_NATIONS';

/*UPDATE Resolutions
Set NoProposalByPlayer = 0
WHERE Type = 'RESOLUTION_CHANGE_LEAGUE_HOST';*/

UPDATE Language_ko_KR
SET Text = '[NEWLINE][ICON_BULLET]세계 불가사의와 인구에서 {1_NumVotes}표'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_MEMBER_DETAILS_WONDER_VOTES';

/*UPDATE Language_ko_KR
SET Text = '의회를 주최할 문명을 지정하세요. 주최자가 되면 추가 대표가 생기고 결의안을 제안할 수 있는 권한이 부여됩니다.[NEWLINE][NEWLINE]문명이 후기 시대로 발전함에 따라 자동으로 제안되지만 언제든지 제안될 수 있습니다.'
WHERE Tag = 'TXT_KEY_RESOLUTION_CHANGE_LEAGUE_HOST_HELP';*/

UPDATE Language_ko_KR
SET Text = '전 세계의 지도자와 가신들이 세계 대회에 모여 국제 문제를 논의합니다. 도시 국가들은 세계 무대에 등장하고, 독립 국가로서 공식적으로 국제 외교에 참여합니다. 그들의 첫 번째 업무는 누가 의회를 주최할 것인지 결정하는 것입니다.'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_START_WORLD_CONGRESS_HELP';

UPDATE Language_ko_KR
SET Text = '세계 의회 인프라 확장'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_WELCOME_CITY_STATES';

UPDATE Language_ko_KR
SET Text = '크고 작은 나라의 목소리가 들리기 위해 서로 다투고, 국제 관계는 더욱 복잡해집니다. 이러한 상황 속에서 세계 의회는 차기 대회 개최지를 결정하기 위해 특별회의를 소집했습니다.'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_WELCOME_CITY_STATES_HELP';

UPDATE Language_ko_KR
SET Text = '세계 의회가 국제 연맹으로 거듭나다.'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_LEADERSHIP_COUNCIL';

UPDATE Language_ko_KR
SET Text = '세계 의회는 국제 연맹으로 발전하려고 시도했습니다. 국제 관계는 훨씬 더 복잡해지고 뒤얽혀졌습니다. 이 새롭게 발전하는 연맹의 주최자를 선택하기 위해 특별 회의가 소집되었습니다.'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_LEADERSHIP_COUNCIL_HELP';

UPDATE Language_ko_KR
SET Text = '국제 연맹이 국제 연합으로 거듭나다.'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_START_UNITED_NATIONS';

UPDATE Language_ko_KR
SET Text = '국제 연맹이 국제 연합으로 다시 태어났습니다.  이 강력한 새로운 외교적 세력의 주최자를 선택하기 위해 특별 회의가 소집되었습니다. 국제 연합은 이전과 마찬가지로 운영되지만, 정기 회의와 문명이 세계적 패권을 주장할 수 있는 회의가 번갈아 열리며, 이를 통해 [COLOR_POSITIVE_TEXT]외교적 승리[ENDCOLOR]가 가능해집니다. 이러한 세션을 활성화하려면 [COLOR_POSITIVE_TEXT]세계 이념 결의안[ENDCOLOR]이 활성화되어야 합니다.'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_START_UNITED_NATIONS_HELP';

UPDATE Language_ko_KR
SET Text = '세계적 패권을 달성할 수 있는 플레이어를 지정하세요. 문명이 의회에서 충분한 수의 대표자로부터 지지를 받으면, 그 지도자는 [COLOR_POSITIVE_TEXT]외교적 승리[ENDCOLOR]를 달성하게 됩니다. 필요한 대표의 수는 게임 내 문명과 도시 국가의 수에 따라 달라지며, 세계 의회 화면에서 확인할 수 있습니다.[NEWLINE][NEWLINE]문명에 의해 제안될 수 없습니다. [COLOR_POSITIVE_TEXT]세계 이념 결의안[ENDCOLOR]이 활성화되면 정기적으로 자동으로 제안됩니다.'
WHERE Tag = 'TXT_KEY_RESOLUTION_DIPLO_VICTORY_HELP';

UPDATE Language_ko_KR SET
Text = REPLACE(Text, '도시 국가의 동맹까지', '도시 국가의 동맹 또는 도시 국가를 괴롭히는')
WHERE Tag = 'TXT_KEY_RESOLUTION_OPEN_DOOR_HELP';

UPDATE Resolutions
Set LeadersVoteBonusOnFail = 0
WHERE Type = 'RESOLUTION_DIPLOMATIC_VICTORY';

UPDATE LeagueSpecialSessions
Set TurnsBetweenSessions = TurnsBetweenSessions/1.25
WHERE Type = 'LEAGUE_SPECIAL_SESSION_START_WORLD_CONGRESS' ;

UPDATE LeagueSpecialSessions
Set TurnsBetweenSessions = TurnsBetweenSessions/1.25
WHERE Type = 'LEAGUE_SPECIAL_SESSION_WELCOME_CITY_STATES';

UPDATE LeagueSpecialSessions
Set TurnsBetweenSessions = TurnsBetweenSessions/1.25
WHERE Type = 'LEAGUE_SPECIAL_SESSION_LEADERSHIP_COUNCIL';

UPDATE LeagueSpecialSessions
Set TurnsBetweenSessions = TurnsBetweenSessions/1.25
WHERE Type = 'LEAGUE_SPECIAL_SESSION_START_UNITED_NATIONS';

UPDATE Defines
SET Value = '-3.758'
WHERE Name = 'DIPLO_VICTORY_CS_DELEGATES_CONSTANT';

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_LIBERATION' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_MINORS_INTERACTION' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_UNIT_UPGRADES' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_RESOLUTIONS' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'GLOBAL_CITY_AUTOMATON_WORKERS' AND Value = 0;

UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'BUILDINGS_CITY_AUTOMATON_WORKERS' AND Value = 0;

UPDATE UnitPromotions
SET IconAtlas = 'extraPromo_Atlas', PortraitIndex = 7
WHERE Type = 'PROMOTION_WALL_STREET'
AND EXISTS (SELECT * FROM IconTextureAtlases WHERE Atlas = 'extraPromo_Atlas');

UPDATE Language_ko_KR SET
Text = REPLACE(Text, '세계 의회를 통해 협력적으로만 건설할 수 있습니다.', '')
WHERE Tag IN ('TXT_KEY_BUILDING_HOLLYWOOD_HEADQUARTERS_HELP', 'TXT_KEY_BUILDING_ROCKNROLL_HEADQUARTERS_HELP', 'TXT_KEY_BUILDING_THREEGORGESDAM_HEADQUARTERS_HELP', 'TXT_KEY_BUILDING_WALL_STREET_HEADQUARTERS_HELP', 'TXT_KEY_BUILDING_THEBOOK_HELP')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP');

UPDATE Language_ko_KR SET
Text = '특수: [COLOR:45:150:50:255]"{TXT_KEY_LEAGUE_PROJECT_HOLLYWOOD}" 프로젝트에서 승리[ENDCOLOR].[NEWLINE][NEWLINE]'|| Text
WHERE Tag IN ('TXT_KEY_BUILDING_HOLLYWOOD_HEADQUARTERS_HELP')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP');

UPDATE Language_ko_KR SET
Text = '특수: [COLOR:45:150:50:255]"{TXT_KEY_LEAGUE_PROJECT_ROCKNROLL}" 프로젝트에서 승리[ENDCOLOR].[NEWLINE][NEWLINE]'|| Text
WHERE Tag IN ('TXT_KEY_BUILDING_ROCKNROLL_HEADQUARTERS_HELP')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP');

UPDATE Language_ko_KR SET
Text = '특수: [COLOR:45:150:50:255]"{TXT_KEY_LEAGUE_PROJECT_THREEGORGESDAM}" 프로젝트에서 승리[ENDCOLOR].[NEWLINE][NEWLINE]'|| Text
WHERE Tag IN ('TXT_KEY_BUILDING_THREEGORGESDAM_HEADQUARTERS_HELP')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP');

UPDATE Language_ko_KR SET
Text = '특수: [COLOR:45:150:50:255]"{TXT_KEY_LEAGUE_PROJECT_WALL_STREET}" 프로젝트에서 승리[ENDCOLOR].[NEWLINE][NEWLINE]'|| Text
WHERE Tag IN ('TXT_KEY_BUILDING_WALL_STREET_HEADQUARTERS_HELP')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP');

UPDATE Language_ko_KR SET
Text = '특수: [COLOR:45:150:50:255]"{TXT_KEY_LEAGUE_PROJECT_WRITER}" 프로젝트에서 승리[ENDCOLOR].[NEWLINE][NEWLINE]'|| Text
WHERE Tag IN ('TXT_KEY_BUILDING_THEBOOK_HELP')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP');