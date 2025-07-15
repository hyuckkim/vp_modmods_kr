
-- GTAS_StartBias - Part of Really Advanced Setup Mod

DEFAULT_START_BIAS = 1;
START_ALONG_OCEAN = 2;
START_ALONG_RIVER = 3;
START_REGION_PRIORITY = 4;
START_REGION_AVOID = 5;
START_BIAS_COUNT = 5;

START_BIAS_TEXT = { "기본", "대양을 따라", "강을 따라", "지역 우선 순위", "지역 무시" };

function GetStartBiasText(startType)
	return START_BIAS_TEXT[startType] or "";
end

