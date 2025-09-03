--------------------------------------------------------------------------------------------------
--Icon Atlas 
--------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas,	IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
SELECT 'FA_NW_ATLAS',					256,		3,				3,				'NWAtlas256.dds' UNION ALL
SELECT 'FA_NW_ATLAS',					128,		3,				3,				'NWAtlas128.dds' UNION ALL
SELECT 'FA_NW_ATLAS',					80,			3,				3,				'NWAtlas80.dds' UNION ALL
SELECT 'FA_NW_ATLAS',					64,			3,				3,				'NWAtlas64.dds' UNION ALL
SELECT 'FA_NW_ATLAS',					45,			3,				3,				'NWAtlas45.dds';