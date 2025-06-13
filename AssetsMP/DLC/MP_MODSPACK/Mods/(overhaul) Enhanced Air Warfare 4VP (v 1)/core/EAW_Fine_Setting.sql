
--Rev 04

/*
'UNIT_TRIPLANE'                 Triplane
'UNIT_EARLYMONOPLAN';           Monoplane
'UNIT_FIGHTER'                  Fighter
'UNIT_JAPANESE_ZERO'            Zero
'UNIT_EARLYJET'                 P-80 Shooting Star
'UNIT_JET27'                    Jet Fighter
'UNIT_MIG29'                    MiG-29
'UNIT_JET_FIGHTER'              Stealth Fighter
'UNIT_ADVJET'                   Advanced Fighter

'UNIT_WWI_BOMBER'               Biplane Bomber
'UNIT_MEDIUMBOMBER'             Medium Bomber
'UNIT_BOMBER'                   Heavy Bomber
'UNIT_AMERICAN_B17'             B-17
'UNIT_STRBOMB'                  Jet Bomber
'UNIT_B52'                      B-52
'UNIT_ULTJETBOMB'               Strategic Bomber
'UNIT_STEALTH_BOMBER'           Stealth Bomber
*/


----- RCS

UPDATE Units SET RangedCombat = 44 WHERE Type = 'UNIT_TRIPLANE'; --         VP : 45  EAW : 44
UPDATE Units SET RangedCombat = 50 WHERE Type = 'UNIT_EARLYMONOPLAN'; --    VP : _   EAW : 50
UPDATE Units SET RangedCombat = 57 WHERE Type = 'UNIT_FIGHTER'; --          VP : 60  EAW : 57
UPDATE Units SET RangedCombat = 58 WHERE Type = 'UNIT_JAPANESE_ZERO'; --    VP : 60  EAW : 58
UPDATE Units SET RangedCombat = 61 WHERE Type = 'UNIT_EARLYJET'; --         VP : _   EAW : 61
UPDATE Units SET RangedCombat = 65 WHERE Type = 'UNIT_JET27'; --            VP : _   EAW : 65
UPDATE Units SET RangedCombat = 66 WHERE Type = 'UNIT_MIG29'; --            VP : _   EAW : 66
UPDATE Units SET RangedCombat = 74 WHERE Type = 'UNIT_JET_FIGHTER'; --      VP : 70  EAW : 74
UPDATE Units SET RangedCombat = 84 WHERE Type = 'UNIT_ADVJET'; --           VP : _   EAW : 84

UPDATE Units SET RangedCombat = 48 WHERE Type = 'UNIT_WWI_BOMBER'; --       VP : 50  EAW : 48
UPDATE Units SET RangedCombat = 55 WHERE Type = 'UNIT_MEDIUMBOMBER'; --     VP : _   EAW : 55
UPDATE Units SET RangedCombat = 63 WHERE Type = 'UNIT_BOMBER'; --           VP : 65  EAW : 63
UPDATE Units SET RangedCombat = 67 WHERE Type = 'UNIT_AMERICAN_B17'; --     VP : 70  EAW : 67
UPDATE Units SET RangedCombat = 72 WHERE Type = 'UNIT_STRBOMB'; --          VP : _   EAW : 72
UPDATE Units SET RangedCombat = 76 WHERE Type = 'UNIT_B52'; --              VP : _   EAW : 76
UPDATE Units SET RangedCombat = 82 WHERE Type = 'UNIT_ULTJETBOMB'; --       VP : 80  EAW : 82
UPDATE Units SET RangedCombat = 93 WHERE Type = 'UNIT_STEALTH_BOMBER'; --   VP : _   EAW : 93


----- Range

UPDATE Units SET Range = 6 WHERE Type = 'UNIT_TRIPLANE'; --         VP : 6  EAW : 6
UPDATE Units SET Range = 7 WHERE Type = 'UNIT_EARLYMONOPLAN'; --    VP : _  EAW : 7
UPDATE Units SET Range = 8 WHERE Type = 'UNIT_FIGHTER'; --          VP : 8  EAW : 8
UPDATE Units SET Range = 8 WHERE Type = 'UNIT_JAPANESE_ZERO'; --    VP : 9  EAW : 8
UPDATE Units SET Range = 8 WHERE Type = 'UNIT_EARLYJET'; --         VP : _  EAW : 8
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_JET27'; --            VP : _  EAW : 9
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_MIG29'; --            VP : _  EAW : 9
UPDATE Units SET Range = 10 WHERE Type = 'UNIT_JET_FIGHTER'; --     VP : 10 EAW : 10
UPDATE Units SET Range = 11 WHERE Type = 'UNIT_ADVJET'; --          VP : _  EAW : 11

UPDATE Units SET Range = 6 WHERE Type = 'UNIT_WWI_BOMBER'; --       VP : 6  EAW : 6
UPDATE Units SET Range = 7 WHERE Type = 'UNIT_MEDIUMBOMBER'; --     VP : _  EAW : 7
UPDATE Units SET Range = 8 WHERE Type = 'UNIT_BOMBER'; --           VP : 8  EAW : 8
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_AMERICAN_B17'; --     VP : 10 EAW : 9
UPDATE Units SET Range = 9 WHERE Type = 'UNIT_STRBOMB'; --          VP : _  EAW : 9
UPDATE Units SET Range = 10 WHERE Type = 'UNIT_B52'; --             VP : _  EAW : 10 
UPDATE Units SET Range = 10 WHERE Type = 'UNIT_ULTJETBOMB'; --      VP : 12 EAW : 10
UPDATE Units SET Range = 11 WHERE Type = 'UNIT_STEALTH_BOMBER'; --  VP : _  EAW : 11


----- Interception Range

UPDATE Units SET AirInterceptRange = 6 WHERE Type = 'UNIT_TRIPLANE'; --         VP : 6  EAW : 6
UPDATE Units SET AirInterceptRange = 7 WHERE Type = 'UNIT_EARLYMONOPLAN'; --    VP : _  EAW : 7
UPDATE Units SET AirInterceptRange = 8 WHERE Type = 'UNIT_FIGHTER'; --          VP : 8  EAW : 8
UPDATE Units SET AirInterceptRange = 8 WHERE Type = 'UNIT_JAPANESE_ZERO'; --    VP : 8  EAW : 8
UPDATE Units SET AirInterceptRange = 8 WHERE Type = 'UNIT_EARLYJET'; --         VP : _  EAW : 8
UPDATE Units SET AirInterceptRange = 9 WHERE Type = 'UNIT_JET27'; --            VP : _  EAW : 9
UPDATE Units SET AirInterceptRange = 9 WHERE Type = 'UNIT_MIG29'; --            VP : _  EAW : 9
UPDATE Units SET AirInterceptRange = 10 WHERE Type = 'UNIT_JET_FIGHTER'; --     VP : 10 EAW : 10
UPDATE Units SET AirInterceptRange = 11 WHERE Type = 'UNIT_ADVJET'; --          VP : _  EAW : 11


----- Cost

UPDATE Units SET Cost = 800 WHERE Type = 'UNIT_TRIPLANE'; --          VP : 800    EAW : 800
UPDATE Units SET Cost = 1050 WHERE Type = 'UNIT_EARLYMONOPLAN'; --    VP : _      EAW : 1050
UPDATE Units SET Cost = 1400 WHERE Type = 'UNIT_FIGHTER'; --          VP : 1400   EAW : 1400
UPDATE Units SET Cost = 1400 WHERE Type = 'UNIT_JAPANESE_ZERO'; --    VP : 1400   EAW : 1400
UPDATE Units SET Cost = 1700 WHERE Type = 'UNIT_JET27'; --            VP : _      EAW : 1700
UPDATE Units SET Cost = 1700 WHERE Type = 'UNIT_MIG29'; --            VP : _      EAW : 1700
UPDATE Units SET Cost = 2100 WHERE Type = 'UNIT_JET_FIGHTER'; --      VP : 2100   EAW : 2100
UPDATE Units SET Cost = 2500 WHERE Type = 'UNIT_ADVJET'; --           VP : _      EAW : 2500

UPDATE Units SET Cost = 850 WHERE Type = 'UNIT_WWI_BOMBER'; --        VP : 850    EAW : 850
UPDATE Units SET Cost = 1150 WHERE Type = 'UNIT_MEDIUMBOMBER'; --     VP : _      EAW : 1150
UPDATE Units SET Cost = 1500 WHERE Type = 'UNIT_BOMBER'; --           VP : 1500   EAW : 1500
UPDATE Units SET Cost = 1500 WHERE Type = 'UNIT_AMERICAN_B17'; --     VP : 1500   EAW : 1500
UPDATE Units SET Cost = 1800 WHERE Type = 'UNIT_STRBOMB'; --          VP : _      EAW : 1800
UPDATE Units SET Cost = 1800 WHERE Type = 'UNIT_B52'; --              VP : _      EAW : 1800
UPDATE Units SET Cost = 2200 WHERE Type = 'UNIT_ULTJETBOMB'; --       VP : 2200   EAW : 2200
UPDATE Units SET Cost = 2600 WHERE Type = 'UNIT_STEALTH_BOMBER'; --   VP : _      EAW : 2600


----- Faith Cost

UPDATE Units SET FaithCost = 700 WHERE Type = 'UNIT_TRIPLANE'; --         VP : 700    EAW : 700
UPDATE Units SET FaithCost = 750 WHERE Type = 'UNIT_EARLYMONOPLAN'; --    VP : _      EAW : 750
UPDATE Units SET FaithCost = 800 WHERE Type = 'UNIT_FIGHTER'; --          VP : 800    EAW : 800
UPDATE Units SET FaithCost = 800 WHERE Type = 'UNIT_JAPANESE_ZERO'; --    VP : 800    EAW : 800
UPDATE Units SET FaithCost = 900 WHERE Type = 'UNIT_JET27'; --            VP : _      EAW : 900
UPDATE Units SET FaithCost = 900 WHERE Type = 'UNIT_MIG29'; --            VP : _      EAW : 900
UPDATE Units SET FaithCost = 1000 WHERE Type = 'UNIT_JET_FIGHTER'; --     VP : 1000   EAW : 1000
UPDATE Units SET FaithCost = 1200 WHERE Type = 'UNIT_ADVJET'; --          VP : _      EAW : 1200

UPDATE Units SET FaithCost = 700 WHERE Type = 'UNIT_WWI_BOMBER'; --       VP : 700    EAW : 700
UPDATE Units SET FaithCost = 750 WHERE Type = 'UNIT_MEDIUMBOMBER'; --     VP : _      EAW : 750
UPDATE Units SET FaithCost = 800 WHERE Type = 'UNIT_BOMBER'; --           VP : 800    EAW : 800
UPDATE Units SET FaithCost = 800 WHERE Type = 'UNIT_AMERICAN_B17'; --     VP : 800    EAW : 800
UPDATE Units SET FaithCost = 900 WHERE Type = 'UNIT_STRBOMB'; --          VP : _      EAW : 900
UPDATE Units SET FaithCost = 900 WHERE Type = 'UNIT_B52'; --              VP : _      EAW : 900
UPDATE Units SET FaithCost = 1000 WHERE Type = 'UNIT_ULTJETBOMB'; --      VP : 1000   EAW : 1000
UPDATE Units SET FaithCost = 1200 WHERE Type = 'UNIT_STEALTH_BOMBER'; --  VP : _      EAW : 1200


----- ArtScale

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.078 WHERE Type = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER'; --       VP : 0.09    EAW : 0.078
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.082 WHERE Type = 'ART_DEF_UNIT_MEMBER_EARLYMONOPLAN'; --     VP : _       EAW : 0.082
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.085 WHERE Type = 'ART_DEF_UNIT_MEMBER_FIGHTER'; --           VP : 0.08    EAW : 0.085
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.077 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO'; --   VP : 0.07    EAW : 0.077
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.1 WHERE Type = 'ART_DEF_UNIT_MEMBER_EARLYJET'; --            VP : _       EAW : 0.1
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.093 WHERE Type = 'ART_DEF_UNIT_MEMBER_JET27'; --             VP : _       EAW : 0.093
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.118 WHERE Type = 'ART_DEF_UNIT_MEMBER_MIG29'; --             VP : _       EAW : 0.118
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.097 WHERE Type = 'ART_DEF_UNIT_MEMBER_JETFIGHTER'; --        VP : 0.09    EAW : 0.097
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.1 WHERE Type = 'ART_DEF_UNIT_MEMBER_ADVJET'; --              VP : _       EAW : 0.1

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.063 WHERE Type = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER'; --        VP : 0.08    EAW : 0.063
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.089 WHERE Type = 'ART_DEF_UNIT_MEMBER_MEDIUMBOMBER'; --      VP : _       EAW : 0.089
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.085 WHERE Type = 'ART_DEF_UNIT_MEMBER_BOMBER'; --            VP : 0.08    EAW : 0.085
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.087 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_B17'; --    VP : 0.08    EAW : 0.087
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.115 WHERE Type = 'ART_DEF_UNIT_MEMBER_STRBOMB'; --           VP : _       EAW : 0.115
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.128 WHERE Type = 'ART_DEF_UNIT_MEMBER_B52'; --               VP : _       EAW : 0.128
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.125 WHERE Type = 'ART_DEF_UNIT_MEMBER_ULTJETBOMB'; --        VP : _       EAW : 0.125
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.088 WHERE Type = 'ART_DEF_UNIT_MEMBER_STEALTHBOMBER'; --     VP : 0.08    EAW : 0.088
