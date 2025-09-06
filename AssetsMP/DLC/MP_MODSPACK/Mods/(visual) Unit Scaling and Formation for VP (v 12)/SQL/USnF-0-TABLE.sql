/*

    Unit Scaling and Formation
	Table creation setup
	by N.Core

	These tables are essential parts of the mod.
	Read the description of each column to know its usage.

*/
-----------------------------------------------------------------------------
--  Create table for store all things that will be used with this mod
-----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS  USnF_Config (
							Type TEXT NOT NULL,
							Value INTEGER DEFAULT 0
							);

CREATE TABLE IF NOT EXISTS  ArtDefine_USnF (
						  	USnF_id INTEGER PRIMARY KEY AUTOINCREMENT, 
							USnF_Type TEXT DEFAULT NULL, 
							USnF_UnitInfo TEXT NOT NULL, 
							USnF_UnitMemberInfo TEXT NOT NULL, 
							USnF_Domain TEXT DEFAULT NULL, 
							USnF_ModMod TEXT DEFAULT NULL, 
							USnF_Scale FLOAT DEFAULT 0, 
							USnF_NumMembers INTEGER DEFAULT -1, 
							USnF_Formation TEXT DEFAULT NULL, 
							USnF_ScaleMultiplier FLOAT DEFAULT 1);

/*
	Type				=	Specify what type of rescaling you make for the unit.
							Choose between the already available rescaling type that other units already use (RED, RUG, SUG), or custom scaling method.

	UnitInfo			=	As in '[ART_DEF_UNIT_YOURUNIT]' used in ArtDefines_UnitInfos and ArtDefines_UnitInfoMemberInfos.

	UnitMemberInfo		=	As in '[ART_DEF_UNIT_MEMBER_YOURUNIT]' used in ArtDefines_UnitMemberInfos and ArtDefines_UnitInfoMemberInfos.

	Domain				=	Type of domain the unit belongs to. (LAND, SEA, AIR)

	ModMod				=	Specify a value tag of which modmod the unit came from, preferably a short name for easier typing.
							This value will be used as a tag for the unit, so make sure that the value is the exact matching value on ArtDefine_USnFModCompatibility table, so this mod can execute the right unit.
	
	Scale				=	The amount of scaling value for the unit, used in ArtDefine_UnitMemberInfos.
							This value will change the Scale value for the unit on table ArtDefine_UnitMemberInfos.

	NumMembers			=	The number amount of unit members that will appear on formation for an UnitInfo, used in ArtDefines_UnitInfoMemberInfos.
							If your unit has multiple figures, then that amount of unit members will stack with number of other figure members on a single UnitInfo.

							Example: 	YOURUNIT has 3 variant models (A, B, and C), and you want to make a formation of 12 unit members.
										Consisting of 2 Model_A, 1 Model_B, 3 Model_C, 3 Model_B, 1 Model_C, and 2 Model_A; so it'll looked diverse.
										
										Then all you have to do is put it like this:
										USnF_UnitInfo,				USnF_UnitMemberInfo,					USnF_NumMembers
										('ART_DEF_UNIT_YOURUNIT',	'ART_DEF_UNIT_MEMBER_YOURUNIT_MODEL_A',	2),
										('ART_DEF_UNIT_YOURUNIT',	'ART_DEF_UNIT_MEMBER_YOURUNIT_MODEL_B',	1),
										('ART_DEF_UNIT_YOURUNIT',	'ART_DEF_UNIT_MEMBER_YOURUNIT_MODEL_C',	3),
										('ART_DEF_UNIT_YOURUNIT',	'ART_DEF_UNIT_MEMBER_YOURUNIT_MODEL_B',	3),
										('ART_DEF_UNIT_YOURUNIT',	'ART_DEF_UNIT_MEMBER_YOURUNIT_MODEL_C',	1),
										('ART_DEF_UNIT_YOURUNIT',	'ART_DEF_UNIT_MEMBER_YOURUNIT_MODEL_A',	2);

	Formation			=	Specify what type of unit formation you want to use.
							Please refer the value with UnitFormation.xml file for available types of formation.

	ScaleMultiplier		=	Value that can be used as a multiplier for the unit scaling. (Scale * ScaleMultiplier)
							Set the value greater than 1.00 to increase, or between 0.00 and 1.00 to decrease.
							Leave it at 1 if you want to stay the unit scaling value as it is.

*/

CREATE TABLE IF NOT EXISTS  ArtDefine_USnFSetup (
							USnF_id INTEGER PRIMARY KEY AUTOINCREMENT, 
							USnF_Domain TEXT UNIQUE, 
							USnF_Type TEXT DEFAULT NULL);

INSERT INTO ArtDefine_USnFSetup (USnF_Domain) VALUES
('LAND'),
('SEA'),
('AIR');

/*
	These are values that will be used as a proxy for the setup.
	Just leave it as it is and edit through USnF-CONFIG.SQL file instead.

	Domain				=	Setup profile for which type of domain. (LAND, SEA, AIR)
	Type				=	Which scaling type you choose for the unit domain.
*/

CREATE TABLE IF NOT EXISTS  ArtDefine_USnFModCompatibility (
						  	USnF_id INTEGER PRIMARY KEY AUTOINCREMENT, 
							USnF_ModMod TEXT UNIQUE ON CONFLICT IGNORE);

/*
	ModMod				=	This value will be used as a setup check, so make sure that the value is the exact matching value in the ArtDefine_USnF table.
							Without this value, the code won't execute the additional units added into the ArtDefine_USnF table.
*/


CREATE TABLE IF NOT EXISTS  ArtDefine_USnFScaleMultiplier (
						  	USnF_id INTEGER PRIMARY KEY AUTOINCREMENT, 
							USnF_Domain TEXT UNIQUE, 
							USnF_ScaleMultiplier FLOAT DEFAULT 1);

INSERT INTO ArtDefine_USnFScaleMultiplier (USnF_Domain) VALUES
('LAND'),
('SEA'),
('AIR');
