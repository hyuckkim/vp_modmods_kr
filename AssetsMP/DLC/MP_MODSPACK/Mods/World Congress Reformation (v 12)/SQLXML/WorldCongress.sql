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

UPDATE Language_en_US
SET Text = '[NEWLINE][ICON_BULLET]{1_NumVotes} from World Wonders and Population'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_MEMBER_DETAILS_WONDER_VOTES';

/*UPDATE Language_en_US
SET Text = 'Designate a Civilization to host the Congress. Being the host grants additional Delegates and the ability to propose resolutions.[NEWLINE][NEWLINE]Automatically proposed as Civilizations advance to later eras, but may be proposed anytime.'
WHERE Tag = 'TXT_KEY_RESOLUTION_CHANGE_LEAGUE_HOST_HELP';*/

UPDATE Language_en_US
SET Text = 'Leaders and their vassals from around the world meet together in the World Congress to discuss international affairs. City-States enter their place on the world stage and formally enter international diplomacy as independent nations. Their first order of business is to determine who will host the Congress.'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_START_WORLD_CONGRESS_HELP';

UPDATE Language_en_US
SET Text = 'World Congress Expands Infrastructure'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_WELCOME_CITY_STATES';

UPDATE Language_en_US
SET Text = 'The voices of nations large and small fight to be heard and international affairs become more complex. Amidst this development, the World Congress calls a special session to determine the next host of the Congress.'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_WELCOME_CITY_STATES_HELP';

UPDATE Language_en_US
SET Text = 'World Congress Becomes League of Nations'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_LEADERSHIP_COUNCIL';

UPDATE Language_en_US
SET Text = 'The World Congress attempts at development into a League of Nations. International affairs become much more involved and complex. A special session is called to choose the host of this newly-developing League.'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_LEADERSHIP_COUNCIL_HELP';

UPDATE Language_en_US
SET Text = 'League of Nations Becomes United Nations'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_START_UNITED_NATIONS';

UPDATE Language_en_US
SET Text = 'The League of Nations is reborn as the United Nations.  A special session to is called to choose the host of this powerful new diplomatic force. The United Nations will continue as before, but regular sessions will alternate with sessions allowing civilizations to try and claim Global Hegemony, making [COLOR_POSITIVE_TEXT]Diplomatic Victory[ENDCOLOR] possible. To enable these sessions, a [COLOR_POSITIVE_TEXT]World Ideology Resolution[ENDCOLOR] must be active.'
WHERE Tag = 'TXT_KEY_LEAGUE_SPECIAL_SESSION_START_UNITED_NATIONS_HELP';

UPDATE Language_en_US
SET Text = 'Designate a player that could achieve Global Hegemony. If a Civilization receives support from enough Delegates in the Congress, that leader will attain [COLOR_POSITIVE_TEXT]Diplomatic Victory[ENDCOLOR].  The number of Delegates needed depends on the number of Civilizations and City-States in the game, and can be seen on the World Congress screen.[NEWLINE][NEWLINE]May not be proposed by a Civilization.  Automatically proposed at regular intervals once a [COLOR_POSITIVE_TEXT]World Ideology Resolution[ENDCOLOR] is active.'
WHERE Tag = 'TXT_KEY_RESOLUTION_DIPLO_VICTORY_HELP';

UPDATE Language_en_US SET
Text = REPLACE(Text, 'City-State''s Ally until', 'City-State''s Ally or bully the City-State until')
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

UPDATE Language_en_US SET
Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '')
WHERE Tag IN ('TXT_KEY_BUILDING_HOLLYWOOD_HEADQUARTERS_HELP', 'TXT_KEY_BUILDING_ROCKNROLL_HEADQUARTERS_HELP', 'TXT_KEY_BUILDING_THREEGORGESDAM_HEADQUARTERS_HELP', 'TXT_KEY_BUILDING_WALL_STREET_HEADQUARTERS_HELP', 'TXT_KEY_BUILDING_THEBOOK_HELP')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP');

UPDATE Language_en_US SET
Text = 'Special: [COLOR:45:150:50:255]Victory in "{TXT_KEY_LEAGUE_PROJECT_HOLLYWOOD}" project[ENDCOLOR].[NEWLINE][NEWLINE]'|| Text
WHERE Tag IN ('TXT_KEY_BUILDING_HOLLYWOOD_HEADQUARTERS_HELP')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP');

UPDATE Language_en_US SET
Text = 'Special: [COLOR:45:150:50:255]Victory in "{TXT_KEY_LEAGUE_PROJECT_ROCKNROLL}" project[ENDCOLOR].[NEWLINE][NEWLINE]'|| Text
WHERE Tag IN ('TXT_KEY_BUILDING_ROCKNROLL_HEADQUARTERS_HELP')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP');

UPDATE Language_en_US SET
Text = 'Special: [COLOR:45:150:50:255]Victory in "{TXT_KEY_LEAGUE_PROJECT_THREEGORGESDAM}" project[ENDCOLOR].[NEWLINE][NEWLINE]'|| Text
WHERE Tag IN ('TXT_KEY_BUILDING_THREEGORGESDAM_HEADQUARTERS_HELP')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP');

UPDATE Language_en_US SET
Text = 'Special: [COLOR:45:150:50:255]Victory in "{TXT_KEY_LEAGUE_PROJECT_WALL_STREET}" project[ENDCOLOR].[NEWLINE][NEWLINE]'|| Text
WHERE Tag IN ('TXT_KEY_BUILDING_WALL_STREET_HEADQUARTERS_HELP')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP');

UPDATE Language_en_US SET
Text = 'Special: [COLOR:45:150:50:255]Victory in "{TXT_KEY_LEAGUE_PROJECT_WRITER}" project[ENDCOLOR].[NEWLINE][NEWLINE]'|| Text
WHERE Tag IN ('TXT_KEY_BUILDING_THEBOOK_HELP')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP');

