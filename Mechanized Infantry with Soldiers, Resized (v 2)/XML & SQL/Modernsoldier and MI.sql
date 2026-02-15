
-- Modern soldier


INSERT INTO "ArtDefine_UnitMemberCombats" VALUES ("ART_DEF_UNIT_MEMBER_MODERNSOLDIER","Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge","",null,"12",null,null,null,null,"0.3499999940395355",null,null,null,null,null,null,null,null,null,null,"8","1",null,null,null,null,"1","1",null,null,null,null,null,null,"",null);

INSERT INTO "ArtDefine_UnitMemberCombatWeapons" VALUES ("ART_DEF_UNIT_MEMBER_MODERNSOLDIER","0","0","",null,null,null,null,null,"",null,null,null,null,null,null,null,null,"BULLET","BULLET",null);

INSERT INTO "ArtDefine_UnitMemberInfos" VALUES ("ART_DEF_UNIT_MEMBER_MODERNSOLDIER","0.10000000059604645",null,"","modernsoldier.fxsxml","CLOTH","FLESH");

--Unit Members and Formation

UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 1 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_MECHANIZEDINFANTRY';

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	VALUES ('ART_DEF_UNIT_MECHANIZED_INFANTRY', 'ART_DEF_UNIT_MEMBER_MODERNSOLDIER', 2);

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	VALUES ('ART_DEF_UNIT_MECHANIZED_INFANTRY', 'ART_DEF_UNIT_MEMBER_MECHANIZEDINFANTRY', 1);

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	VALUES ('ART_DEF_UNIT_MECHANIZED_INFANTRY', 'ART_DEF_UNIT_MEMBER_MODERNSOLDIER', 2);


UPDATE ArtDefine_UnitInfos SET Formation = 'MechanizedInfantry' WHERE Type = 'ART_DEF_UNIT_MECHANIZED_INFANTRY';

