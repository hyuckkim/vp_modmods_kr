--------------------------------------------------------------------------------------------------
--Icon Atlas 
--------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas,	IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
SELECT 'MALL_ATLAS',					256,		5,				5,				'MallAtlas256.dds' UNION ALL
SELECT 'MALL_ATLAS',					128,		5,				5,				'MallAtlas128.dds' UNION ALL
SELECT 'MALL_ATLAS',					80,			5,				5,				'MallAtlas80.dds' UNION ALL
SELECT 'MALL_ATLAS',					64,			5,				5,				'MallAtlas64.dds' UNION ALL
SELECT 'MALL_ATLAS',					45,			5,				5,				'MallAtlas45.dds' UNION ALL
SELECT 'WTC_ATLAS',					256,		1,				1,				'WTC256.dds' UNION ALL
SELECT 'WTC_ATLAS',					128,		1,				1,				'WTC128.dds' UNION ALL
SELECT 'WTC_ATLAS',					80,		1,				1,				'WTC80.dds' UNION ALL
SELECT 'WTC_ATLAS',					64,		1,				1,				'WTC64.dds' UNION ALL
SELECT 'WTC_ATLAS',					45,		1,				1,				'WTC45.dds';

--------------------------------------------------------------------------------------------------
--Font Mapping
-------------------------------------------------------------------------------------------------- 
INSERT INTO IconFontTextures (IconFontTexture,	IconFontTextureFile)
SELECT 'ICON_FONT_TEXTURE_MALL',					'Mall-FontIcons';