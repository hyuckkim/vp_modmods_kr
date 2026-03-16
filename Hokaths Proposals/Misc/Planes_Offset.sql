-- needs to load before zeppelin
------------------------------------------------------------------------------------------------------------------------

UPDATE ArtDefine_UnitMemberInfos SET 
ZOffset = 76
WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN (SELECT UnitArtInfo FROM Units WHERE CombatClass = 'UNITCOMBAT_MISSILE'));

UPDATE ArtDefine_UnitMemberInfos SET 
ZOffset = 76  -- 15
WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN (SELECT UnitArtInfo FROM Units WHERE CombatClass = 'UNITCOMBAT_FIGHTER'));

UPDATE ArtDefine_UnitMemberInfos SET 
ZOffset = 78
WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN (SELECT UnitArtInfo FROM Units WHERE CombatClass = 'UNITCOMBAT_BOMBER'));

UPDATE ArtDefine_UnitMemberInfos SET 
ZOffset = 80  -- they midpoint seems a bit lower in the model
WHERE Type IN ('ART_DEF_UNIT_MEMBER_WW1_BOMBER', 'ART_DEF_UNIT_MEMBER_STEALTHBOMBER', 'ART_DEF_UNIT_MEMBER_ATOMICBOMB');
-----------------------------------