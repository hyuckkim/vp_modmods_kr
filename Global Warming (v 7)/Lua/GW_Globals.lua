-- GlobalWarmingOptions
-- Author: FramedArchitecture
-- DateCreated: 11/9/2012
 --------------------------------------------------------------
g_EraBegin		= "ERA_INDUSTRIAL"	-- Once any Civ enters this Era, Global Warming events may occur.
bKillResource	= true	-- Allows plots affected by Global Warming to have resources destroyed.
 --------------------------------------------------------------
g_buildings = {
	{ type = "BUILDING_IRONWORKS",			value = 4.0 },
	{ type = "BUILDING_FACTORY",			value = 1.5 },
	{ type = "BUILDING_NUCLEAR_PLANT",		value = 1.8 },
	{ type = "BUILDING_SPACESHIP_FACTORY",	value = 1.0 },
	{ type = "BUILDING_MILITARY_BASE",		value = 1.0 },
	{ type = "BUILDING_GARDEN",				value = -0.5 },
	{ type = "BUILDING_HYDRO_PLANT",		value = -2.0 },
	{ type = "BUILDING_SOLAR_PLANT",		value = -2.0 },
	{ type = "BUILDING_RECYCLING_CENTER",	value = -1.0 },
 }
 --------------------------------------------------------------
g_techs = {
	{ type = "TECH_ELECTRICITY",			value = 1.0 },
	{ type = "TECH_COMBUSTION",				value = 2.0 },
	{ type = "TECH_GLOBALIZATION",			value = 1.0 },
	{ type = "TECH_ECOLOGY",				value = -0.5 },
	{ type = "TECH_NUCLEAR_FUSION",			value = -1.0 },
	{ type = "TECH_TELECOM",				value = -0.5 },
	{ type = "TECH_INTERNET",				value = -0.5 },
 }
 --------------------------------------------------------------
g_terrains = {
	{ type = "TERRAIN_DESERT",				value = 0.2 },
	{ type = "TERRAIN_SNOW",				value = -1.2 },
	{ type = "TERRAIN_TUNDRA",				value = -0.6 },
 }
 --------------------------------------------------------------
g_features = {
	{ type = "FEATURE_FALLOUT",				value = 20.0 },
	{ type = "FEATURE_ICE",					value = -1.2 },
	{ type = "FEATURE_JUNGLE",				value = -1.0 },
	{ type = "FEATURE_FOREST",				value = -0.8 },
 }
 --------------------------------------------------------------
g_routes = {
	{ type = "ROUTE_RAILROAD",				value = 0.20 },
 }
 --------------------------------------------------------------
g_improvements = {
	{ type = "IMPROVEMENT_TRADING_POST",		value = 0.6 },
	{ type = "IMPROVEMENT_PASTURE",				value = 1.0 },
	{ type = "IMPROVEMENT_LUMBERMILL",			value = 0.6 },
	{ type = "IMPROVEMENT_BRAZILWOOD_CAMP",		value = 0.6 },
	{ type = "IMPROVEMENT_MINE",				value = 1.5 },
	{ type = "IMPROVEMENT_WELL",				value = 2.0 },
	{ type = "IMPROVEMENT_OFFSHORE_PLATFORM",	value = 2.0 },
	{ type = "IMPROVEMENT_MANUFACTORY",			value = 5.0 },
 }
