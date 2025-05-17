-----------------------------------------------------------------------------
--  Aircraft animation speed modifier
-----------------------------------------------------------------------------

--  Custom speed modifier similar to R.E.D. speed for additional air units from VP modmods
    --  SPAD S.VII
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.8 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FRANCE_SPAD'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4)
        AND EXISTS (SELECT * FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FRANCE_SPAD');

    --  MONOPLANE
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.0 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_EARLYMONOPLAN'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4)
        AND EXISTS (SELECT * FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_EARLYMONOPLAN');

    --  P-80 SHOOTING STAR
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.35 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_EARLYJET'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4)
        AND EXISTS (SELECT * FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_EARLYJET');

    --  JET FIGHTER [EAW]
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.6 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JET27'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4)
        AND EXISTS (SELECT * FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JET27');

    --  MIG-29
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.6 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MIG29'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4)
        AND EXISTS (SELECT * FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MIG29');

    --  ADVANCED FIGHTER
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 3.25 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ADVJET'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4)
        AND EXISTS (SELECT * FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ADVJET');


    --  MEDIUM BOMBER
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.75 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MEDIUMBOMBER'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4)
        AND EXISTS (SELECT * FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MEDIUMBOMBER');

    --  JET BOMBER
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.25 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ULTJETBOMB'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4)
        AND EXISTS (SELECT * FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ULTJETBOMB');

    --  B-52
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.2 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_B52'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4)
        AND EXISTS (SELECT * FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_B52');

    --  STRATEGIC BOMBER
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.2 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_STRBOMB'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4)
        AND EXISTS (SELECT * FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_STRBOMB');
