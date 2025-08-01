
-- GTAS_ScrollText - Part of Really Advanced Setup Mod

local MODE_TEXT = 1;
local MODE_LINE = 2;

LINE_HEIGHT = 18;
TITLE_HEIGHT = 44;
SUB_TITLE_HEIGHT = 34;

ScrollTextDefaults = {
	mode = MODE_TEXT;
	text = "";
	anchor = "C,C";
	offsetX = 0;
	offsetY = 0;
	sizeX = 891;
	sizeY = 27;
	font = "TwCenMT20";
};

COLOR_LIGHT_BLUE = "[COLOR:120:200:255:255]";
COLOR_YELLOW = "[COLOR:200:200:70:255]";
COLOR_GREEN = "[COLOR_GREEN]";

function ColorText(colorType, text)
	return colorType .. text .. "[/COLOR]";
end

TerrainCivText = {
	rootControl = "TerrainHelpRoot";
	textControl = "TerrainHelpLabel";
	lineControl = "TerrainHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, Locale.ConvertTextKey("TXT_KEY_GTAS_TERRAINCIVTEXT_TITLE")) },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_TERRAINCIVTEXT_SUB_TITLE_1")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_1" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_2" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_3" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_4" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_5" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_6" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_7" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_8" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_TERRAINCIVTEXT_SUB_TITLE_2")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_9" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_10" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_11" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINCIVTEXT_SUB_TITLE_3" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_12" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_13" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_14" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINCIVTEXT_SUB_TITLE_4" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_15" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_16" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINCIVTEXT_SUB_TITLE_5" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_17" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_18" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_19" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_20" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_21" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINCIVTEXT_SUB_TITLE_6" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_22" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINCIVTEXT_SUB_TITLE_7" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_23" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_24" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_25" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINCIVTEXT_SUB_TITLE_8" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_26" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_27" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_28" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINCIVTEXT_SUB_TITLE_9" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_29" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_30" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINCIVTEXT_SUB_TITLE_10" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_31" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_TERRAINCIVTEXT_SUB_TITLE_11")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_32" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_33" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_34" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_35" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINCIVTEXT_SUB_TITLE_12" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_36" },
		{ text = "TXT_KEY_GTAS_TERRAINCIVTEXT_TEXT_37" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_SCROLL_SUB_TITLE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_REMOVE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_EMPTY" },
		{ },
		{ text = ColorText(COLOR_YELLOW, Locale.ConvertTextKey("TXT_KEY_GTAS_SCROLL_TEXT_END")) },
		{ sizeY = 10 },
	};
};

TerrainMapText = {
	textControl = "TerrainHelpLabel";
	rootControl = "TerrainHelpRoot";
	lineControl = "TerrainHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, Locale.ConvertTextKey("TXT_KEY_GTAS_TERRAINMAPTEXT_TITLE")) },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = "TXT_KEY_GTAS_TERRAINMAPTEXT_SUB_TITLE_1" },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_1" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_2" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_3" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_4" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_5" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_6" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_7" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_8" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_TERRAINMAPTEXT_SUB_TITLE_2")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_9" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_10" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_11" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINMAPTEXT_SUB_TITLE_3" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_12" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_13" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_14" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINMAPTEXT_SUB_TITLE_4" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_15" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_16" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINMAPTEXT_SUB_TITLE_5" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_17" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINMAPTEXT_SUB_TITLE_6" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_18" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_19" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_TERRAINMAPTEXT_SUB_TITLE_7" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_20" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_TERRAINMAPTEXT_SUB_TITLE_8")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_21" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_22" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_23" },
		{ text = "TXT_KEY_GTAS_TERRAINMAPTEXT_TEXT_24" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_SCROLL_SUB_TITLE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_REMOVE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_EMPTY" },
		{ },
		{ text = ColorText(COLOR_YELLOW, Locale.ConvertTextKey("TXT_KEY_GTAS_SCROLL_TEXT_END")) },
		{ sizeY = 10 },
	};
};

FeatureCivText = {
	rootControl = "FeatureHelpRoot";
	textControl = "FeatureHelpLabel";
	lineControl = "FeatureHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, Locale.ConvertTextKey("TXT_KEY_GTAS_FEATURECIVTEXT_TITLE")) },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_FEATURECIVTEXT_SUB_TITLE_1")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_1" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_2" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_3" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_4" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_FEATURECIVTEXT_SUB_TITLE_2")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_5" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_6" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_7" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_FEATURECIVTEXT_SUB_TITLE_3" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_8" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_9" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_10" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_FEATURECIVTEXT_SUB_TITLE_4" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_11" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_12" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_13" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_FEATURECIVTEXT_SUB_TITLE_5" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_14" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_15" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_16" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_17" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_18" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_FEATURECIVTEXT_SUB_TITLE_6" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_19" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_FEATURECIVTEXT_SUB_TITLE_7" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_20" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_21" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_22" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_FEATURECIVTEXT_SUB_TITLE_8" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_23" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_24" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_25" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_FEATURECIVTEXT_SUB_TITLE_9" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_26" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_FEATURECIVTEXT_SUB_TITLE_10")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_27" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_28" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_29" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_30" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_FEATURECIVTEXT_SUB_TITLE_11" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_31" },
		{ text = "TXT_KEY_GTAS_FEATURECIVTEXT_TEXT_32" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_SCROLL_SUB_TITLE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_REMOVE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_EMPTY" },
		{ },
		{ text = ColorText(COLOR_YELLOW, Locale.ConvertTextKey("TXT_KEY_GTAS_SCROLL_TEXT_END")) },
		{ sizeY = 10 },
	};
};

FeatureMapText = {
	textControl = "FeatureHelpLabel";
	rootControl = "FeatureHelpRoot";
	lineControl = "FeatureHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, Locale.ConvertTextKey("TXT_KEY_GTAS_FEATUREMAPTEXT_TITLE")) },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = "TXT_KEY_GTAS_FEATUREMAPTEXT_SUB_TITLE_1" },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_1" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_2" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_3" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_4" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_FEATUREMAPTEXT_SUB_TITLE_2")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_5" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_6" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_7" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_FEATUREMAPTEXT_SUB_TITLE_3" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_8" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_9" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_10" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_FEATUREMAPTEXT_SUB_TITLE_4" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_11" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_12" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_13" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_FEATUREMAPTEXT_SUB_TITLE_5" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_14" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_FEATUREMAPTEXT_SUB_TITLE_6" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_15" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_FEATUREMAPTEXT_SUB_TITLE_7")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_16" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_17" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_18" },
		{ text = "TXT_KEY_GTAS_FEATUREMAPTEXT_TEXT_19" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_SCROLL_SUB_TITLE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_REMOVE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_EMPTY" },
		{ },
		{ text = ColorText(COLOR_YELLOW, Locale.ConvertTextKey("TXT_KEY_GTAS_SCROLL_TEXT_END")) },
		{ sizeY = 10 },
	};
};

ResourceCivText = {
	rootControl = "ResourceHelpRoot";
	textControl = "ResourceHelpLabel";
	lineControl = "ResourceHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, Locale.ConvertTextKey("TXT_KEY_GTAS_RESOURCECIVTEXT_TITLE")) },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_RESOURCECIVTEXT_SUB_TITLE_1")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_1" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_2" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_3" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_4" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_RESOURCECIVTEXT_SUB_TITLE_2")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_5" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_6" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_7" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCECIVTEXT_SUB_TITLE_3" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_8" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_9" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_10" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCECIVTEXT_SUB_TITLE_4" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_11" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_12" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCECIVTEXT_SUB_TITLE_5" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_13" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_14" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_15" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_16" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_17" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCECIVTEXT_SUB_TITLE_6" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_18" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCECIVTEXT_SUB_TITLE_7" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_19" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_20" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_21" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCECIVTEXT_SUB_TITLE_8" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_22" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_23" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_24" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCECIVTEXT_SUB_TITLE_9" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_25" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_26" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_27" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_28" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCECIVTEXT_SUB_TITLE_10" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_29" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_RESOURCECIVTEXT_SUB_TITLE_11")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_30" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_31" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_32" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_33" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCECIVTEXT_SUB_TITLE_12" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_34" },
		{ text = "TXT_KEY_GTAS_RESOURCECIVTEXT_TEXT_35" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_SCROLL_SUB_TITLE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_REMOVE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_EMPTY" },
		{ },
		{ text = ColorText(COLOR_YELLOW, Locale.ConvertTextKey("TXT_KEY_GTAS_SCROLL_TEXT_END")) },
		{ sizeY = 10 },
	};
};

ResourceMapText = {
	textControl = "ResourceHelpLabel";
	rootControl = "ResourceHelpRoot";
	lineControl = "ResourceHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, Locale.ConvertTextKey("TXT_KEY_GTAS_RESOURCEMAPTEXT_TITLE")) },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_SUB_TITLE_1" },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_1" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_2" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_3" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_4" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_RESOURCEMAPTEXT_SUB_TITLE_2")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_5" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_6" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_7" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_SUB_TITLE_3" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_8" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_9" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_10" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_SUB_TITLE_4" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_11" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_12" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_SUB_TITLE_5" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_13" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_SUB_TITLE_6" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_14" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_15" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_16" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_17" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_SUB_TITLE_7" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_18" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_RESOURCEMAPTEXT_SUB_TITLE_8")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_19" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_20" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_21" },
		{ text = "TXT_KEY_GTAS_RESOURCEMAPTEXT_TEXT_22" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_SCROLL_SUB_TITLE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_REMOVE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_EMPTY" },
		{ },
		{ text = ColorText(COLOR_YELLOW, Locale.ConvertTextKey("TXT_KEY_GTAS_SCROLL_TEXT_END")) },
		{ sizeY = 10 },
	};
};

NaturalWonderCivText = {
	rootControl = "WonderHelpRoot";
	textControl = "WonderHelpLabel";
	lineControl = "WonderHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, Locale.ConvertTextKey("TXT_KEY_GTAS_WONDERCIVTEXT_TITLE")) },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_WONDERCIVTEXT_SUB_TITLE_1")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_1" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_2" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_3" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_4" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_5" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_6" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_7" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_8" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_WONDERCIVTEXT_SUB_TITLE_2")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_9" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_10" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_11" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_12" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_13" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERCIVTEXT_SUB_TITLE_3" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_14" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_15" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_16" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_17" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERCIVTEXT_SUB_TITLE_4" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_18" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_19" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERCIVTEXT_SUB_TITLE_5" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_20" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_21" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_22" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_23" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_24" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERCIVTEXT_SUB_TITLE_6" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_25" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERCIVTEXT_SUB_TITLE_7" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_26" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_27" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_28" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERCIVTEXT_SUB_TITLE_8" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_29" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_30" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_31" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERCIVTEXT_SUB_TITLE_9" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_32" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_33" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERCIVTEXT_SUB_TITLE_10" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_34" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_WONDERCIVTEXT_SUB_TITLE_11")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_35" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_36" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_37" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_38" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERCIVTEXT_SUB_TITLE_12" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_39" },
		{ text = "TXT_KEY_GTAS_WONDERCIVTEXT_TEXT_40" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_SCROLL_SUB_TITLE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_REMOVE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_EMPTY" },
		{ },
		{ text = ColorText(COLOR_YELLOW, Locale.ConvertTextKey("TXT_KEY_GTAS_SCROLL_TEXT_END")) },
		{ sizeY = 10 },
	};
};

NaturalWonderMapText = {
	rootControl = "WonderHelpRoot";
	textControl = "WonderHelpLabel";
	lineControl = "WonderHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, Locale.ConvertTextKey("TXT_KEY_GTAS_WONDERMAPTEXT_TITLE")) },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = "TXT_KEY_GTAS_WONDERMAPTEXT_SUB_TITLE_1" },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_1" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_2" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_3" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_4" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_5" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_6" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_7" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_8" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_WONDERMAPTEXT_SUB_TITLE_2")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_9" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_10" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_11" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_12" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_13" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERMAPTEXT_SUB_TITLE_3" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_14" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_15" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_16" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_17" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERMAPTEXT_SUB_TITLE_4" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_18" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_19" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERMAPTEXT_SUB_TITLE_5" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_20" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERMAPTEXT_SUB_TITLE_6" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_21" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_22" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_WONDERMAPTEXT_SUB_TITLE_7" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_23" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_WONDERMAPTEXT_SUB_TITLE_8")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_24" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_25" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_26" },
		{ text = "TXT_KEY_GTAS_WONDERMAPTEXT_TEXT_27" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_SCROLL_SUB_TITLE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_REMOVE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_EMPTY" },
		{ },
		{ text = ColorText(COLOR_YELLOW, Locale.ConvertTextKey("TXT_KEY_GTAS_SCROLL_TEXT_END")) },
		{ sizeY = 10 },
	};
};

UnitCivText = {
	rootControl = "UnitHelpRoot";
	textControl = "UnitHelpLabel";
	lineControl = "UnitHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, Locale.ConvertTextKey("TXT_KEY_GTAS_UNITCIVTEXT_TITLE")) },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_UNITCIVTEXT_SUB_TITLE_1")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_1" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_2" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_3" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_4" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_5" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_6" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_7" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_UNITCIVTEXT_SUB_TITLE_2")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_8" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_9" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_10" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_UNITCIVTEXT_SUB_TITLE_3" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_11" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_12" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_13" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_UNITCIVTEXT_SUB_TITLE_4" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_14" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_UNITCIVTEXT_SUB_TITLE_5" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_15" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_UNITCIVTEXT_SUB_TITLE_6" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_16" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_UNITCIVTEXT_SUB_TITLE_7" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_17" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_UNITCIVTEXT_SUB_TITLE_8" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_18" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_19" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_20" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_UNITCIVTEXT_SUB_TITLE_9" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_21" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, Locale.ConvertTextKey("TXT_KEY_GTAS_UNITCIVTEXT_SUB_TITLE_10")) },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_22" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_23" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_24" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_25" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_UNITCIVTEXT_SUB_TITLE_11" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_26" },
		{ text = "TXT_KEY_GTAS_UNITCIVTEXT_TEXT_27" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "TXT_KEY_GTAS_SCROLL_SUB_TITLE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_REMOVE" },
		{ text = "TXT_KEY_GTAS_SCROLL_TEXT_EMPTY" },
		{ },
		{ text = ColorText(COLOR_YELLOW, Locale.ConvertTextKey("TXT_KEY_GTAS_SCROLL_TEXT_END")) },
		{ sizeY = 10 },
	};
};

function CreateScrollText(scrollText, manager)
	for _, line in ipairs(scrollText.data) do
		local instance = manager:GetInstance();
		local mode;

		if line.mode ~= nil then
			mode = line.mode;
		else
			mode = scrollText.defaults.mode;
		end

		local control = instance[scrollText.lineControl];

		if control ~= nil then
			if mode == MODE_LINE then
				control:SetHide(false);
			else
				control:SetHide(true);
			end
		end

		local control = instance[scrollText.textControl];

		if control ~= nil then
			if mode == MODE_TEXT then
				control:SetHide(false);

				if line.text ~= nil then
					control:SetText(Locale.ConvertTextKey(line.text));
				else
					control:SetText(Locale.ConvertTextKey(scrollText.defaults.text));
				end

				if line.anchor ~= nil then
					control:SetAnchor(line.anchor);
				else
					control:SetAnchor(scrollText.defaults.anchor);
				end

				if line.offsetX ~= nil then
					control:SetOffsetX(line.offsetX);
				else
					control:SetOffsetX(scrollText.defaults.offsetX);
				end

				if line.offsetY ~= nil then
					control:SetOffsetY(line.offsetY);
				else
					control:SetOffsetY(scrollText.defaults.offsetY);
				end

				if line.font ~= nil then
					control:SetFontByName(line.font);
				else
					control:SetFontByName(scrollText.defaults.font);
				end

			else
				control:SetHide(true);
			end
		end

		local control = instance[scrollText.rootControl];

		if control ~= nil then
			if line.sizeX ~= nil then
				control:SetSizeX(line.sizeX);
			else
				control:SetSizeX(scrollText.defaults.sizeX);
			end

			if line.sizeY ~= nil then
				control:SetSizeY(line.sizeY);
			else
				control:SetSizeY(scrollText.defaults.sizeY);
			end
		end
	end
end





