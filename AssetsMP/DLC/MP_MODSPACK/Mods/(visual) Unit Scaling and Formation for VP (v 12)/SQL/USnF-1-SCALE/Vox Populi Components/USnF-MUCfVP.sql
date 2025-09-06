/*
    Unit Scaling and Formation

    ArtDefine configuration file
    by N.Core

    For unique units from More Unique Components for VP.

    Note for inserting into ArtDefine_UnitInfoMemberInfos:
    To adjust what kind of UnitMemberInfo model you want to use for a UnitInfo,
    just simply add/remove the comment syntax '--' on the desired UnitMemberInfo insertion.
*/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT  INTO ArtDefine_USnF (USnF_UnitInfo, USnF_UnitMemberInfo, USnF_Type, USnF_Domain, USnF_ModMod, USnF_Scale, USnF_NumMembers, USnF_Formation) VALUES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Base Civilizations
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  ARABIA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  HASHEMITE RAIDER [MUCfVP]
            (   'ART_DEF_UNIT_HASHEMITE',                       'ART_DEF_UNIT_MEMBER_HASHEMITE',                        'RED',  'LAND', 'MUCfVP',   0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_HASHEMITE',                       'ART_DEF_UNIT_MEMBER_HASHEMITE',                        'RUG',  'LAND', 'MUCfVP',   0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_HASHEMITE',                       'ART_DEF_UNIT_MEMBER_HASHEMITE',                        'SUG',  'LAND', 'MUCfVP',   0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  ASSYRIA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  CHARIOT ARCHER
            (   'ART_DEF_UNIT_IRON_CHARIOT',                    'ART_DEF_UNIT_MEMBER_IRON_CHARIOT',                     'RED',  'LAND', 'MUCfVP',   0.085,  3,          'ChariotElephantRED'),
            (   'ART_DEF_UNIT_IRON_CHARIOT',                    'ART_DEF_UNIT_MEMBER_IRON_CHARIOT',                     'RUG',  'LAND', 'MUCfVP',   0.17,   2,          'ChariotElephantRUG'),
            (   'ART_DEF_UNIT_IRON_CHARIOT',                    'ART_DEF_UNIT_MEMBER_IRON_CHARIOT',                     'SUG',  'LAND', 'MUCfVP',   0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  AUSTRIA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  GRENZER (LANDWEHR) [MUCfVP]
            (   'ART_DEF_UNIT_LANDWEHR',                        'ART_DEF_UNIT_MEMBER_LANDWEHR',                         'RED',  'LAND', 'MUCfVP',   0.09,   19,         'HonorableGunpowderRED'),
            (   'ART_DEF_UNIT_LANDWEHR',                        'ART_DEF_UNIT_MEMBER_LANDWEHR',                         'RUG',  'LAND', 'MUCfVP',   0.18,   3,          'HonorableGunpowderRUG'),
            (   'ART_DEF_UNIT_LANDWEHR',                        'ART_DEF_UNIT_MEMBER_LANDWEHR',                         'SUG',  'LAND', 'MUCfVP',   0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  AZTEC
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  EAGLE [MUCfVP]
            (   'ART_DEF_UNIT_EAGLE',                           'ART_DEF_UNIT_MEMBER_EAGLE',                            'RED',  'LAND', 'MUCfVP',   0.09,   16,         'ArcherRED'),
            (   'ART_DEF_UNIT_EAGLE',                           'ART_DEF_UNIT_MEMBER_EAGLE',                            'RUG',  'LAND', 'MUCfVP',   0.18,   3,          'ArcherRUG'),
            (   'ART_DEF_UNIT_EAGLE',                           'ART_DEF_UNIT_MEMBER_EAGLE',                            'SUG',  'LAND', 'MUCfVP',   0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  BABYLON
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  SABUM KIBITUM [MUCfVP]
            (   'ART_DEF_UNIT_BABYLON_KIBITUM',                 'ART_DEF_UNIT_MEMBER_BABYLON_KIBITUM',                  'RED',  'LAND', 'MUCfVP',   0.09,   20,         'PhalanxRED'),
            (   'ART_DEF_UNIT_BABYLON_KIBITUM',                 'ART_DEF_UNIT_MEMBER_BABYLON_KIBITUM',                  'RUG',  'LAND', 'MUCfVP',   0.18,   3,          'PhalanxRUG'),
            (   'ART_DEF_UNIT_BABYLON_KIBITUM',                 'ART_DEF_UNIT_MEMBER_BABYLON_KIBITUM',                  'SUG',  'LAND', 'MUCfVP',   0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  BRAZIL
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  AMAZONAS [MUCfVP]
            (   'ART_DEF_UNIT_AMAZONAS',                        'ART_DEF_UNIT_MEMBER_AMAZONAS',                         'RED',  'SEA',  'MUCfVP',   0.116,  1,          ''),
            (   'ART_DEF_UNIT_AMAZONAS',                        'ART_DEF_UNIT_MEMBER_AMAZONAS',                         'RUG',  'SEA',  'MUCfVP',   0.165,  1,          ''),
            (   'ART_DEF_UNIT_AMAZONAS',                        'ART_DEF_UNIT_MEMBER_AMAZONAS',                         'SUG',  'SEA',  'MUCfVP',   0.238,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  BYZANTIUM
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  DROMON [MUCfVP]
            (   'ART_DEF_UNIT_BYZANTIUM_DROMON',                'ART_DEF_UNIT_MEMBER_BYZANTIUM_DROMON',                 'RED',  'SEA',  'MUCfVP',   0.11,   2,          'Flotilla'),
            (   'ART_DEF_UNIT_BYZANTIUM_DROMON',                'ART_DEF_UNIT_MEMBER_BYZANTIUM_DROMON',                 'RUG',  'SEA',  'MUCfVP',   0.165,  1,          ''),
            (   'ART_DEF_UNIT_BYZANTIUM_DROMON',                'ART_DEF_UNIT_MEMBER_BYZANTIUM_DROMON',                 'SUG',  'SEA',  'MUCfVP',   0.21,   1,          'Flotilla'),
        --  PENTECONTER [MUCfVP]
            --MUCfVP brought Dromon back as Byzantium's UU, and replaced VP's Dromon with Penteconter for a base naval ranged unit
            (   'ART_DEF_UNIT_U_BYZANTIUM_DROMON',              'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON',               'RED',  'SEA',  'MUCfVP',   0.06,   -1,         'Flotilla'),
            (   'ART_DEF_UNIT_U_BYZANTIUM_DROMON',              'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON',               'RUG',  'SEA',  'MUCfVP',   0.108,  -1,         ''),
            (   'ART_DEF_UNIT_U_BYZANTIUM_DROMON',              'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON',               'SUG',  'SEA',  'MUCfVP',   0.148,  -1,         ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  CARTHAGE
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  SUFFET [MUCfVP]
            (   'ART_DEF_UNIT_CARTHAGE_SHOPHET',                'ART_DEF_UNIT_MEMBER_JFD_SHOPHET',                      'RED',  'LAND', 'MUCfVP',   0.09,   1,          ''),
            (   'ART_DEF_UNIT_CARTHAGE_SHOPHET',                'ART_DEF_UNIT_MEMBER_JFD_SHOPHET',                      'RUG',  'LAND', 'MUCfVP',   0.17,   1,          ''),
            (   'ART_DEF_UNIT_CARTHAGE_SHOPHET',                'ART_DEF_UNIT_MEMBER_JFD_SHOPHET',                      'SUG',  'LAND', 'MUCfVP',   0.24,   1,          ''),
            (   'ART_DEF_UNIT_CARTHAGE_SHOPHET_BOAT',           'ART_DEF_UNIT_MEMBER_CARTHAGE_SHOPHET_BOAT',            'RED',  'SEA',  'MUCfVP',   0.072,  1,          ''),
            (   'ART_DEF_UNIT_CARTHAGE_SHOPHET_BOAT',           'ART_DEF_UNIT_MEMBER_CARTHAGE_SHOPHET_BOAT',            'RUG',  'SEA',  'MUCfVP',   0.113,  1,          ''),
            (   'ART_DEF_UNIT_CARTHAGE_SHOPHET_BOAT',           'ART_DEF_UNIT_MEMBER_CARTHAGE_SHOPHET_BOAT',            'SUG',  'SEA',  'MUCfVP',   0.14,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  CELTS
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  SCYTHED CHARIOT [MUCfVP]
            (   'ART_DEF_UNIT_CELTS_SCYTHED_CHARIOT',           'ART_DEF_UNIT_MEMBER_CELTS_SCYTHED_CHARIOT',            'RED',  'LAND', 'MUCfVP',   0.085,  3,          'ChariotElephantRED'),
            (   'ART_DEF_UNIT_CELTS_SCYTHED_CHARIOT',           'ART_DEF_UNIT_MEMBER_CELTS_SCYTHED_CHARIOT',            'RUG',  'LAND', 'MUCfVP',   0.17,   2,          'ChariotElephantRUG'),
            (   'ART_DEF_UNIT_CELTS_SCYTHED_CHARIOT',           'ART_DEF_UNIT_MEMBER_CELTS_SCYTHED_CHARIOT',            'SUG',  'LAND', 'MUCfVP',   0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  CHINA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  BAOCHUAN [MUCfVP]
            (   'ART_DEF_UNIT_WARJUNK',                         'ART_DEF_UNIT_MEMBER_WARJUNK',                          'RED',  'SEA',  'MUCfVP',   0.11,   2,          'Colomb'),
            (   'ART_DEF_UNIT_WARJUNK',                         'ART_DEF_UNIT_MEMBER_WARJUNK',                          'RUG',  'SEA',  'MUCfVP',   0.165,  1,          ''),
            (   'ART_DEF_UNIT_WARJUNK',                         'ART_DEF_UNIT_MEMBER_WARJUNK',                          'SUG',  'SEA',  'MUCfVP',   0.235,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  DENMARK
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  LONGSHIP [MUCfVP]
            (   'ART_DEF_UNIT_DENMARK_LANGSKIB',                'ART_DEF_UNIT_MEMBER_DENMARK_LANGSKIB',                 'RED',  'SEA',  'MUCfVP',   0.063,  3,          'Colomb'),
            (   'ART_DEF_UNIT_DENMARK_LANGSKIB',                'ART_DEF_UNIT_MEMBER_DENMARK_LANGSKIB',                 'RUG',  'SEA',  'MUCfVP',   0.112,  1,          ''),
            (   'ART_DEF_UNIT_DENMARK_LANGSKIB',                'ART_DEF_UNIT_MEMBER_DENMARK_LANGSKIB',                 'SUG',  'SEA',  'MUCfVP',   0.145,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  EGYPT
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  KHOPESH [MUCfVP]
            --MUCfVP used to have Khopesh as a UU for Egypt, but then replaced it with Mamluk instead
            --You can put it into the game manually by editing the code on that mod
            (   'ART_DEF_UNIT_KHOPESH_SWORDSMAN',               'ART_DEF_UNIT_MEMBER_KHOPESH_SWORDSMAN',                'RED',  'LAND', 'MUCfVP',   0.09,   16,         'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_KHOPESH_SWORDSMAN',               'ART_DEF_UNIT_MEMBER_KHOPESH_SWORDSMAN',                'RUG',  'LAND', 'MUCfVP',   0.18,   3,          'DefaultMeleeRUG'),
            (   'ART_DEF_UNIT_KHOPESH_SWORDSMAN',               'ART_DEF_UNIT_MEMBER_KHOPESH_SWORDSMAN',                'SUG',  'LAND', 'MUCfVP',   0.25,   1,          ''),
        --  MAMLUK [MUCfVP]
            (   'ART_DEF_UNIT_EGYPT_MAMLUK',                    'ART_DEF_UNIT_MEMBER_EGYPT_MAMLUK',                     'RED',  'LAND', 'MUCfVP',   0.085,  7,          'WedgeCavalry'),
            (   'ART_DEF_UNIT_EGYPT_MAMLUK',                    'ART_DEF_UNIT_MEMBER_EGYPT_MAMLUK',                     'RUG',  'LAND', 'MUCfVP',   0.18,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_EGYPT_MAMLUK',                    'ART_DEF_UNIT_MEMBER_EGYPT_MAMLUK',                     'SUG',  'LAND', 'MUCfVP',   0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  ETHIOPIA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  CHEWA [MUCfVP]
            (   'ART_DEF_UNIT_ETHIOPIA_SHOTELAI',               'ART_DEF_UNIT_MEMBER_ETHIOPIA_SHOTELAI',                'RED',  'LAND', 'MUCfVP',   0.09,   16,         'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_ETHIOPIA_SHOTELAI',               'ART_DEF_UNIT_MEMBER_ETHIOPIA_SHOTELAI',                'RUG',  'LAND', 'MUCfVP',   0.18,   3,          'DefaultMeleeRUG'),
            (   'ART_DEF_UNIT_ETHIOPIA_SHOTELAI',               'ART_DEF_UNIT_MEMBER_ETHIOPIA_SHOTELAI',                'SUG',  'LAND', 'MUCfVP',   0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  FRANCE
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  SPAD S.VII [MUCfVP]
            (   'ART_DEF_UNIT_FRANCE_SPAD',                     'ART_DEF_UNIT_MEMBER_FRANCE_SPAD',                      'RED',  'AIR',  'MUCfVP',   0.07,   3,          'FighterWingRED'),
            (   'ART_DEF_UNIT_FRANCE_SPAD',                     'ART_DEF_UNIT_MEMBER_FRANCE_SPAD',                      'RUG',  'AIR',  'MUCfVP',   0.105,  2,          'FighterWingRUG'),
            (   'ART_DEF_UNIT_FRANCE_SPAD',                     'ART_DEF_UNIT_MEMBER_FRANCE_SPAD',                      'SUG',  'AIR',  'MUCfVP',   0.168,  1,          ''),
            (   'ART_DEF_UNIT_FRANCE_SPAD',                     'ART_DEF_UNIT_MEMBER_FRANCE_SPAD',                      'EAW',  'AIR',  'MUCfVP',   0.078,  3,          'FighterWing'),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  GERMANY
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  KRUPP GUN [MUCfVP]
            (   'ART_DEF_UNIT_GERMANY_KRUPP_GUN',               'ART_DEF_UNIT_MEMBER_GERMANY_KRUPP_GUN',                'RED',  'LAND', 'MUCfVP',   0.09,   3,          'Vehicle'),
            (   'ART_DEF_UNIT_GERMANY_KRUPP_GUN',               'ART_DEF_UNIT_MEMBER_GERMANY_KRUPP_GUN',                'RUG',  'LAND', 'MUCfVP',   0.17,   2,          'VehicleRUG'),
            (   'ART_DEF_UNIT_GERMANY_KRUPP_GUN',               'ART_DEF_UNIT_MEMBER_GERMANY_KRUPP_GUN',                'SUG',  'LAND', 'MUCfVP',   0.242,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  GREECE
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  KLEPHT [MUCfVP]
            (   'ART_DEF_UNIT_GREECE_KLEPHT',                   'ART_DEF_UNIT_MEMBER_GREECE_KLEPHT',                    'RED',  'LAND', 'MUCfVP',   0.09,   13,         'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_GREECE_KLEPHT',                   'ART_DEF_UNIT_MEMBER_GREECE_KLEPHT',                    'RUG',  'LAND', 'MUCfVP',   0.18,   3,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_GREECE_KLEPHT',                   'ART_DEF_UNIT_MEMBER_GREECE_KLEPHT',                    'SUG',  'LAND', 'MUCfVP',   0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  HUNS
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  TARKHAN [MUCfVP]
            (   'ART_DEF_UNIT_HUNS_TARKHAN',                    'ART_DEF_UNIT_MEMBER_HUNS_TARKHAN',                     'RED',  'LAND', 'MUCfVP',   0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_HUNS_TARKHAN',                    'ART_DEF_UNIT_MEMBER_HUNS_TARKHAN',                     'RUG',  'LAND', 'MUCfVP',   0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_HUNS_TARKHAN',                    'ART_DEF_UNIT_MEMBER_HUNS_TARKHAN',                     'SUG',  'LAND', 'MUCfVP',   0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  INCA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  CHASQUI [MUCfVP]
            (   'ART_DEF_UNIT_CHASQUI',                         'ART_DEF_UNIT_MEMBER_CHASQUI',                          'RED',  'LAND', 'MUCfVP',   0.085,   12,        'ScoutRED'),
            (   'ART_DEF_UNIT_CHASQUI',                         'ART_DEF_UNIT_MEMBER_CHASQUI',                          'RUG',  'LAND', 'MUCfVP',   0.175,   3,         'ScoutRUG'),
            (   'ART_DEF_UNIT_CHASQUI',                         'ART_DEF_UNIT_MEMBER_CHASQUI',                          'SUG',  'LAND', 'MUCfVP',   0.245,   1,         ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  INDIA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  DARURDHARA [MUCfVP]
            (   'ART_DEF_UNIT_INDIA_DHANURAASHI',               'ART_DEF_UNIT_MEMBER_INDIA_DHANURAASHI',                'RED',  'LAND', 'MUCfVP',   0.09,   16,         'ArcherRED'),
            (   'ART_DEF_UNIT_INDIA_DHANURAASHI',               'ART_DEF_UNIT_MEMBER_INDIA_DHANURAASHI',                'RUG',  'LAND', 'MUCfVP',   0.18,   3,         'ArcherRUG'),
            (   'ART_DEF_UNIT_INDIA_DHANURAASHI',               'ART_DEF_UNIT_MEMBER_INDIA_DHANURAASHI',                'SUG',  'LAND', 'MUCfVP',   0.25,   1,         ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  INDONESIA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  DJONG [MUCfVP]
            (   'ART_DEF_UNIT_DJONG',                           'ART_DEF_UNIT_MEMBER_DJONG',                            'RED',  'SEA',  'MUCfVP',   0.083,  3,          'Nelson'),
            (   'ART_DEF_UNIT_DJONG',                           'ART_DEF_UNIT_MEMBER_DJONG',                            'RUG',  'SEA',  'MUCfVP',   0.155,  1,          ''),
            (   'ART_DEF_UNIT_DJONG',                           'ART_DEF_UNIT_MEMBER_DJONG',                            'SUG',  'SEA',  'MUCfVP',   0.175,    1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  IROQUOIS
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  PROWLER [MUCfVP]
            (   'ART_DEF_UNIT_IROQUOIS_PROWLER',                'ART_DEF_UNIT_MEMBER_IROQUOIS_PROWLER',                 'RED',  'LAND', 'MUCfVP',   0.09,   18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_IROQUOIS_PROWLER',                'ART_DEF_UNIT_MEMBER_IROQUOIS_PROWLER',                 'RUG',  'LAND', 'MUCfVP',   0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_IROQUOIS_PROWLER',                'ART_DEF_UNIT_MEMBER_IROQUOIS_PROWLER',                 'SUG',  'LAND', 'MUCfVP',   0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  JAPAN
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  YAMATO [MUCfVP]
            (   'ART_DEF_UNIT_JAPAN_YAMATO',                    'ART_DEF_UNIT_MEMBER_YAMATO',                           'RED',  'SEA',  'MUCfVP',   0.105,  1,          ''),
            (   'ART_DEF_UNIT_JAPAN_YAMATO',                    'ART_DEF_UNIT_MEMBER_YAMATO',                           'RUG',  'SEA',  'MUCfVP',   0.123,  1,          ''),
            (   'ART_DEF_UNIT_JAPAN_YAMATO',                    'ART_DEF_UNIT_MEMBER_YAMATO',                           'SUG',  'SEA',  'MUCfVP',   0.173,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  MAYA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  HOLKAN [MUCfVP]
            (   'ART_DEF_UNIT_MAYA_HOLKAN',                     'ART_DEF_UNIT_MEMBER_MAYA_HOLKAN',                      'RED',  'LAND', 'MUCfVP',   0.088,  12,         'ScoutRED'),
            (   'ART_DEF_UNIT_MAYA_HOLKAN',                     'ART_DEF_UNIT_MEMBER_MAYA_HOLKAN',                      'RUG',  'LAND', 'MUCfVP',   0.178,  3,          'ScoutRUG'),
            (   'ART_DEF_UNIT_MAYA_HOLKAN',                     'ART_DEF_UNIT_MEMBER_MAYA_HOLKAN',                      'SUG',  'LAND', 'MUCfVP',   0.248,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  MONGOLIA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  BLACK TUG [MUCfVP]
            (   'ART_DEF_UNIT_MONGOLIA_BLACK_TUG',              'ART_DEF_UNIT_MEMBER_MONGOLIA_BLACK_TUG',               'RED',  'LAND', 'MUCfVP',   0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_MONGOLIA_BLACK_TUG',              'ART_DEF_UNIT_MEMBER_MONGOLIA_BLACK_TUG',               'RUG',  'LAND', 'MUCfVP',   0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_MONGOLIA_BLACK_TUG',              'ART_DEF_UNIT_MEMBER_MONGOLIA_BLACK_TUG',               'SUG',  'LAND', 'MUCfVP',   0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  MOROCCO
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  CORSAIR [MUCfVP]
            (   'ART_DEF_UNIT_CORSAIR',                         'ART_DEF_UNIT_MEMBER_CORSAIR',                          'RED',  'SEA',  'MUCfVP',   0.11,   2,          'Nelson'),
            (   'ART_DEF_UNIT_CORSAIR',                         'ART_DEF_UNIT_MEMBER_CORSAIR',                          'RUG',  'SEA',  'MUCfVP',   0.172,   1,          ''),
            (   'ART_DEF_UNIT_CORSAIR',                         'ART_DEF_UNIT_MEMBER_CORSAIR',                          'SUG',  'SEA',  'MUCfVP',   0.242,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  NETHERLANDS
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  GOEDENDAG [MUCfVP]
            (   'ART_DEF_UNIT_NETHERLANDS_GOEDENDAG',           'ART_DEF_UNIT_MEMBER_NETHERLANDS_GOEDENDAG',            'RED',  'LAND', 'MUCfVP',   0.09,   16,         'PikemanRED'),
            (   'ART_DEF_UNIT_NETHERLANDS_GOEDENDAG',           'ART_DEF_UNIT_MEMBER_NETHERLANDS_GOEDENDAG',            'RUG',  'LAND', 'MUCfVP',   0.18,   3,          'PikemanRUG'),
            (   'ART_DEF_UNIT_NETHERLANDS_GOEDENDAG',           'ART_DEF_UNIT_MEMBER_NETHERLANDS_GOEDENDAG',            'SUG',  'LAND', 'MUCfVP',   0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  OTTOMAN
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  GREAT BOMBARD [MUCfVP]
            (   'ART_DEF_UNIT_OTTOMANS_GREAT_TURKISH_BOMBARD',  'ART_DEF_UNIT_MEMBER_OTTOMANS_GREAT_TURKISH_BOMBARD',   'RED',  'LAND', 'MUCfVP',   0.10,   1,          'CannonLine'),
            (   'ART_DEF_UNIT_OTTOMANS_GREAT_TURKISH_BOMBARD',  'ART_DEF_UNIT_MEMBER_OTTOMANS_GREAT_TURKISH_BOMBARD',   'RUG',  'LAND', 'MUCfVP',   0.168,  1,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_OTTOMANS_GREAT_TURKISH_BOMBARD',  'ART_DEF_UNIT_MEMBER_OTTOMANS_GREAT_TURKISH_BOMBARD',   'SUG',  'LAND', 'MUCfVP',   0.17,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  PERSIA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  QIZILBASH [MUCfVP]
            (   'ART_DEF_UNIT_PERSIA_QIZILBASH',                'ART_DEF_UNIT_MEMBER_PERSIA_QIZILBASH',                 'RED',  'LAND', 'MUCfVP',   0.085,  7,          'WedgeCavalry'),
            (   'ART_DEF_UNIT_PERSIA_QIZILBASH',                'ART_DEF_UNIT_MEMBER_PERSIA_QIZILBASH',                 'RUG',  'LAND', 'MUCfVP',   0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_PERSIA_QIZILBASH',                'ART_DEF_UNIT_MEMBER_PERSIA_QIZILBASH',                 'SUG',  'LAND', 'MUCfVP',   0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  POLAND
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  PANCERNY [MUCfVP]
            (   'ART_DEF_UNIT_POLAND_PANCERNY',                 'ART_DEF_UNIT_MEMBER_POLAND_PANCERNY',                  'RED',  'LAND', 'MUCfVP',   0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_POLAND_PANCERNY',                 'ART_DEF_UNIT_MEMBER_POLAND_PANCERNY',                  'RUG',  'LAND', 'MUCfVP',   0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_POLAND_PANCERNY',                 'ART_DEF_UNIT_MEMBER_POLAND_PANCERNY',                  'SUG',  'LAND', 'MUCfVP',   0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  POLYNESIA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  KOA [MUCfVP]
            (   'ART_DEF_UNIT_POLYNESIA_KOA',                   'ART_DEF_UNIT_MEMBER_POLYNESIA_KOA',                    'RED',  'LAND', 'MUCfVP',   0.088,  12,         'ScoutRED'),
            (   'ART_DEF_UNIT_POLYNESIA_KOA',                   'ART_DEF_UNIT_MEMBER_POLYNESIA_KOA',                    'RUG',  'LAND', 'MUCfVP',   0.178,  3,          'ScoutRUG'),
            (   'ART_DEF_UNIT_POLYNESIA_KOA',                   'ART_DEF_UNIT_MEMBER_POLYNESIA_KOA',                    'SUG',  'LAND', 'MUCfVP',   0.248,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  PORTUGAL
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  CACADOR [MUCfVP]
            (   'ART_DEF_UNIT_4UC_CACADOR',                     'ART_DEF_UNIT_MEMBER_4UC_CACADOR',                      'RED',  'LAND', 'MUCfVP',   0.09,   18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_4UC_CACADOR',                     'ART_DEF_UNIT_MEMBER_4UC_CACADOR',                      'RUG',  'LAND', 'MUCfVP',   0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_4UC_CACADOR',                     'ART_DEF_UNIT_MEMBER_4UC_CACADOR',                      'SUG',  'LAND', 'MUCfVP',   0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  RUSSIA
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  LICORNE [MUCfVP]
            (   'ART_DEF_UNIT_RUSSIA_LICORNE',                  'ART_DEF_UNIT_MEMBER_RUSSIA_LICORNE',                   'RED',  'LAND', 'MUCfVP',   0.09,   3,          'CannonLine'),
            (   'ART_DEF_UNIT_RUSSIA_LICORNE',                  'ART_DEF_UNIT_MEMBER_RUSSIA_LICORNE',                   'RUG',  'LAND', 'MUCfVP',   0.175,  2,          'VehicleRUG'),
            (   'ART_DEF_UNIT_RUSSIA_LICORNE',                  'ART_DEF_UNIT_MEMBER_RUSSIA_LICORNE',                   'SUG',  'LAND', 'MUCfVP',   0.245,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  SHOSHONE
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  YELLOW BROW [MUCfVP]
            (   'ART_DEF_UNIT_SHOSHONE_YELLOW_BROW',            'ART_DEF_UNIT_MEMBER_SHOSHONE_YELLOW_BROW',             'RED',  'LAND', 'MUCfVP',   0.09,   18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_SHOSHONE_YELLOW_BROW',            'ART_DEF_UNIT_MEMBER_SHOSHONE_YELLOW_BROW',             'RUG',  'LAND', 'MUCfVP',   0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_SHOSHONE_YELLOW_BROW',            'ART_DEF_UNIT_MEMBER_SHOSHONE_YELLOW_BROW',             'SUG',  'LAND', 'MUCfVP',   0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  SIAM
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  SEIR MORB [MUCfVP]
            (   'ART_DEF_UNIT_SIAM_SEIR_MORB',                  'ART_DEF_UNIT_MEMBER_SIAM_SEIR_MORB',                   'RED',  'LAND', 'MUCfVP',   0.09,   3,          'Vehicle'),
            (   'ART_DEF_UNIT_SIAM_SEIR_MORB',                  'ART_DEF_UNIT_MEMBER_SIAM_SEIR_MORB',                   'RUG',  'LAND', 'MUCfVP',   0.175,  2,          'VehicleRUG'),
            (   'ART_DEF_UNIT_SIAM_SEIR_MORB',                  'ART_DEF_UNIT_MEMBER_SIAM_SEIR_MORB',                   'SUG',  'LAND', 'MUCfVP',   0.245,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  SONGHAI
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  SOFA [MUCfVP]
            (   'ART_DEF_UNIT_SOFA',                            'ART_DEF_UNIT_MEMBER_SOFA',                             'RED',  'LAND', 'MUCfVP',   0.09,   15,         'Crossbowman'),
            (   'ART_DEF_UNIT_SOFA',                            'ART_DEF_UNIT_MEMBER_SOFA',                             'RUG',  'LAND', 'MUCfVP',   0.18,   3,          'CrossbowmanRUG'),
            (   'ART_DEF_UNIT_SOFA',                            'ART_DEF_UNIT_MEMBER_SOFA',                             'SUG',  'LAND', 'MUCfVP',   0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  SPAIN
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  ARMADA [MUCfVP]
            (   'ART_DEF_UNIT_SPAIN_ARMADA',                    'ART_DEF_UNIT_MEMBER_SPAIN_ARMADA',                     'RED',  'SEA',  'MUCfVP',   0.13,   2,          'Colomb'),
            (   'ART_DEF_UNIT_SPAIN_ARMADA',                    'ART_DEF_UNIT_MEMBER_SPAIN_ARMADA',                     'RUG',  'SEA',  'MUCfVP',   0.165,  1,          ''),
            (   'ART_DEF_UNIT_SPAIN_ARMADA',                    'ART_DEF_UNIT_MEMBER_SPAIN_ARMADA',                     'SUG',  'SEA',  'MUCfVP',   0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  VENICE
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  FUSTA [MUCfVP]
            (   'ART_DEF_UNIT_VENICE_FUSTA',                    'ART_DEF_UNIT_MEMBER_JFD_LANTERNAS',                    'RED',  'SEA',  'MUCfVP',   0.085,  3,          'Colomb'),
            (   'ART_DEF_UNIT_VENICE_FUSTA',                    'ART_DEF_UNIT_MEMBER_JFD_LANTERNAS',                    'RUG',  'SEA',  'MUCfVP',   0.155,  1,          ''),
            (   'ART_DEF_UNIT_VENICE_FUSTA',                    'ART_DEF_UNIT_MEMBER_JFD_LANTERNAS',                    'SUG',  'SEA',  'MUCfVP',   0.2,    1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  ZULU
        ------- UnitInfo -------------------------------------- UnitMemberInfo ---------------------------------------- Type -- Domain  ModMod ---- Scale - NumMembers  Formation
        --  INDUNA [MUCfVP]
            (   'ART_DEF_UNIT_ZULU_INDABA',                     'ART_DEF_UNIT_ZULU_INDABA_MEMBER',                      'RED',  'LAND', 'MUCfVP',   0.088,  3,          'UnFormedRED'),
            (   'ART_DEF_UNIT_ZULU_INDABA',                     'ART_DEF_UNIT_ZULU_INDABA_MEMBER',                      'RUG',  'LAND', 'MUCfVP',   0.178,  1,          ''),
            (   'ART_DEF_UNIT_ZULU_INDABA',                     'ART_DEF_UNIT_ZULU_INDABA_MEMBER',                      'SUG',  'LAND', 'MUCfVP',   0.248,  1,          ''),
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  END OF INSERT 

            (   'END_OF_INSERT', '', '', NULL, NULL, 0, 0, '');

DELETE  FROM ArtDefine_USnF WHERE USnF_UnitInfo = 'END_OF_INSERT';

--  Support for More Unique Components for VP
INSERT INTO ArtDefine_USnFModCompatibility (USnF_ModMod)
SELECT 'MUCfVP' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'MUCfVP-ENW');
