--[[------------------------------------------------------------------------------

-- Communitas.lua map script --

  Created by:
- Cephalo (Rich Marinaccio)		- Perlin landform, elevation and rainfall creation
- Sirian (Bob Thomas)			- Island creation, some code from Continents and Terra scripts
- WHoward69						- Mountain-pass finding algorithm
- Bobert13						- Bug fixes and optimizations
- Thalassicus (Victor Isbell)	- Ocean rifts, rivers through lakes, natural wonder placement,
								  resource placement, map options, inland seas, aesthetic polishing
- Milae	(Miles)			- Major changes: Rainfall, Terrain and features reworked.
				- Minor changes: resources, tweaking on almost all variables, removed many features designed to reduce randomness and added extra explainations.

This map script generates climate based on a simplified model of geostrophic
and monsoon wind patterns. Rivers are generated along accurate drainage paths
governed by the elevation map used to create the landforms.

- Natural wonders appear in useful locations.
- Islands reward exploration and settlement.
- Ocean rifts prevent ancient ships from circling the world.
- Inland seas, lakes, and rivers flowing out of lakes.

--]]------------------------------------------------------------------------------

include("MapGenerator")
include("FeatureGenerator")
include("TerrainGenerator")
include("IslandMaker")
include("FLuaVector")

MapGlobals = {}


local debugTime = false
local debugPrint = false
local debugWithLogger = false

--[[
Setting "overrideAssignStartingPlots = false" may help make the map compatible 
with core game patches in the distant future when I'm no longer modding Civ 5.

This disables some advanced features of the map, so it's better to
modify the map's changes to AssignStartingPlots if possible.

~ Thalassicus @ Nov 5 2013
--]]


local overrideAssignStartingPlots = true




--
-- Map Information
--

function MapGlobals:New()
	print("MapGlobals:New")
	local mglobal = {}
	setmetatable(mglobal, self)
	self.__index = self
	
	local mapW, mapH = Map.GetGridSize()
	

	--Percent of land tiles on the map.
	mglobal.landPercent			= 0.53
	
	--Top and bottom map latitudes.
	mglobal.topLatitude			= 90
	mglobal.bottomLatitude			= -90
	
	
	--Important latitude markers used for generating climate.
	mglobal.tropicLatitudes			= 22	-- Tilt of the axis (affect summer/winter temps)			   
	mglobal.horseLatitudes			= 30	-- Location of the 1st geostropic boundary (not used)
	mglobal.polarFrontLatitude		= 60	-- Location of the 2nd geostropic boundary (not used)
	mglobal.iceLatitude			= 55	-- Furthest down ice is allowed to go


	
	--Adjusting these will generate larger or smaller landmasses and features.
	mglobal.landMinScatter			= 0.03 	--Recommended range:[0.02 to 0.1]	--Higher values makes continental divisions and stringy features more likely,
	mglobal.landMaxScatter			= 0.09	--Recommended range:[0.03 to 0.3]	--and very high values result in a lot of stringy continents and islands.
											
											
	mglobal.coastScatter			= 0.03 	--Recommended range:[0.01 to 0.3]
						--Higher values result in more islands and variance on landmasses and coastlines.
											
	mglobal.mountainScatter			= 280 * mapW --Recommended range:[130 to 1000]
						--Lower values make large, long, mountain ranges. Higher values make sporadic mountainous features.
	
	
	-- Terrain
	mglobal.mountainWeight			= 1.0  	--Weight of the mountain elevation map versus the coastline elevation map.
	mglobal.belowMountainPercent		= 0.955	-- Percent of non-mountain land
										   -- flatPercent to belowMountainPercent : hills
	mglobal.flatPercent			= 0.81 	-- Percent of flat land
	mglobal.hillsBlendPercent		= 0.30 	-- Chance for flat land to become hills per near mountain. Requires at least 2 near mountains.
	mglobal.terrainBlendRange		= 2	-- range to smooth terrain (desert surrounded by plains turns to plains, etc)
	mglobal.terrainBlendRandom		= 0.4  	-- random modifier for terrain smoothing

	
	-- Features
	mglobal.featurePercent			= 0.60 -- Percent of potential feature tiles that actually create a feature (marsh/jungle/forest) (not used)
	mglobal.featureWetVariance		= 0.15 -- Percent chance increase if freshwater, decrease if dry (groups features near rivers) (not used)
	mglobal.islePercent			= 0.07 -- Percent of coast tiles with an isle (atoll)
	mglobal.numNaturalWonders		= 3 + GameInfo.Worlds[Map.GetWorldSize()].NumNaturalWonders
	
	
	-- Rain
	mglobal.marshPercent		= 0.053 	-- Base percent chance for marsh to spawn on suitable tile (will be more on 'perfect' tile) 
	mglobal.junglePercent		= 0.52 	-- Base percent chance for jungle to spawn on suitable tile (will be more on 'perfect' tile) 
	mglobal.forestPercent		= 0.075		-- Base percent chance for forest to spawn on suitable tile (will be more on 'perfect' tile) 
	mglobal.forestTundraPercent	= 0.31		-- Base percent chance for marsh to spawn on tundra tile (half on tundra hills) 
	mglobal.featureIterations	= 2		-- Number of times all plots are checked to add features (more iterartions means more chance for features to spawn near others)
	mglobal.jungleClumpingModifier	= 4		-- chance increase based on percent of nearby tiles which have jungle
	mglobal.forestClumpingModifier	= 30		-- chance increase based on percent of nearby tiles which have forest
	mglobal.marshClumpingModifier	= 7		-- chance increase based on percent of nearby tiles which have marshes
		-- divide by number of iterations to reach the same overall base chance
	mglobal.marshPercent		= mglobal.marshPercent 		/ mglobal.featureIterations
	mglobal.junglePercent		= mglobal.junglePercent 	/ mglobal.featureIterations
	mglobal.forestPercent		= mglobal.forestPercent 	/ mglobal.featureIterations
	mglobal.forestTundraPercent	= mglobal.forestTundraPercent 	/ mglobal.featureIterations




										  							  
	mglobal.grassPercent	        = 0.78	--	> grassPercent: very wet (more jungle/marsh, less forest)
						-- 	> plainsPercent: grass
	mglobal.plainsPercent		= 0.46 	-- 	desertPercent to plainsPercent: plains/tundra/snow
	mglobal.desertPercent		= 0.18 	--	< desertPercent : desert if hot enough, plains/tundra/snow if not
	
	
	-- Temperature
	mglobal.jungleMinTemperature	= 0.78 -- > jungleMin: increased jungle, less marsh or forests.
	mglobal.desertMinTemperature	= 0.52 -- > desertMin: desert and jungle 
	mglobal.tundraTemperature	= 0.205 -- < tundraTemp: tundra
	mglobal.snowTemperature		= 0.04 -- < snowTemp:   snow


	mglobal.forestRandomPercent		= 0.07 -- Percent of barren flatland which randomly gets a forest ( not used )
	
	

	-- Water
	mglobal.riverPercent			= 0.17	-- Percent of river junctions that are large enough to become rivers.	
	mglobal.riverRainCheatFactor		= 1.25	-- Values greater than one favor watershed size. Values less than one favor actual rain amount.
	mglobal.minWaterTemp			= 0.10	-- Sets water temperature compression that creates the land/sea seasonal temperature differences that cause monsoon winds.
	mglobal.maxWaterTemp			= 0.90	-- Maximum = minWaterTemp + maxWaterTemp
	mglobal.geostrophicFactor		= 0	-- Strength of latitude climate versus monsoon climate. 	(geostropic being reworked)
	mglobal.geostrophicLateralWindStrength = 0.6 	-- Percent of geostropic wind which goes in dominant direction 	(not used)
	mglobal.lakeSize			= 10	-- read-only; cannot change lake sizes with a map script
	mglobal.oceanMaxWander			= 20	-- number of tiles a rift can randomly wander from its intended path
	mglobal.oceanElevationWeight		= 0.8	-- higher numbers make oceans avoid continents
	mglobal.oceanRiftWidth			= math.max(2, Round(mapW/40)) -- minimum number of ocean tiles in a rift
	
	-- percent of map width:
	mglobal.atlanticSize			= 0.02	-- size near poles
	mglobal.atlanticBulge			= -0.06	-- size increase at equator
	mglobal.atlanticCurve			= 0.2	-- S-curve distance
	mglobal.pacificSize			= 0.03	-- size near poles
	mglobal.pacificBulge			= 0.03	-- size increase at equator
	mglobal.pacificCurve			= 0.2	-- S-curve distance
	
	
	mglobal.atlanticSize			= Round(mglobal.atlanticSize * mapW)
	mglobal.atlanticBulge			= Round(mglobal.atlanticBulge * mapW)
	mglobal.pacificSize			= Round(mglobal.pacificSize * mapW)
	mglobal.pacificBulge			= Round(mglobal.pacificBulge * mapW)
	mglobal.atlanticCurve			= Round(mglobal.atlanticCurve * mapW)
	mglobal.pacificCurve			= Round(mglobal.pacificCurve * mapW)
	
	
	-- Resources
	mglobal.fishTargetFertility		= 66	-- fish appear to create this average city fertility
	
	
	-- Quality vs Performance
	-- Lowering these reduces map quality and creation time.
	-- Try reducing these slightly if you experience crashes on huge maps
	mglobal.tempBlendMaxRange		= 5 -- range to smooth temperature map
	mglobal.elevationBlendRange		= 10 -- range to smooth elevation map
	mglobal.RainfallBlendRange		= 1 -- range to smooth rainfall map (not used)
	
	
	
	
	

	
	--[[
	
		MAP OPTIONS
			
	1 - world_age
	2 - temperature
	3 - rainfall
	4 - sea_level
	5 - resources
	6 - Players Start
	7 - Ocean Rifts
	8 - Ocean Rift width
	9 - OverrideAssignStartingPlots
	
	--]]
	
	do
	
	local oWorldAge = Map.GetCustomOption(1)
	if oWorldAge == 4 then oWorldAge = 1 + Map.Rand(3, "Communitas random world age - Lua") end
	if oWorldAge == 1 then
		print("Map Age:  New")
		mglobal.belowMountainPercent	= 1 - (1 - mglobal.belowMountainPercent) * 1.5
		mglobal.flatPercent			= 1 - (1 - mglobal.flatPercent) * 1.5
		mglobal.landMinScatter		= mglobal.landMinScatter	/ 1.5
		mglobal.landMaxScatter		= mglobal.landMaxScatter	/ 1.5
		mglobal.coastScatter		= mglobal.coastScatter		/ 1.5
		mglobal.mountainScatter		= mglobal.mountainScatter	* 1.5
	elseif oWorldAge == 3 then
		print("Map Age:  Old")
		mglobal.belowMountainPercent	= 1 - (1 - mglobal.belowMountainPercent) / 1.5
		mglobal.flatPercent			= 1 - (1 - mglobal.flatPercent) / 1.5
		mglobal.landMinScatter		= mglobal.landMinScatter	* 1.5
		mglobal.landMaxScatter		= mglobal.landMaxScatter	* 1.3
		mglobal.coastScatter		= mglobal.coastScatter		* 1.5
		mglobal.mountainScatter		= mglobal.mountainScatter	/ 1.5
	else
		print("Map Age:  Normal")
	end
	mglobal.mountainScatter = mglobal.mountainScatter * 0.00001
	
	
	local oTemp = Map.GetCustomOption(2)
	if oTemp == 4 then oTemp = 1 + Map.Rand(3, "Communitas random temperature - Lua") end
	if oTemp == 1 then
		print("Map Temp: Cool")
		mglobal.tropicLatitudes			= mglobal.tropicLatitudes		/ 1.5
		mglobal.iceLatitude			= mglobal.topLatitude - (mglobal.topLatitude - mglobal.iceLatitude) / 2
		mglobal.jungleMinTemperature		= 1 - ( 1 - mglobal.jungleMinTemperature) / 1.25
		mglobal.desertMinTemperature		= mglobal.desertMinTemperature		* 1.25
		mglobal.tundraTemperature		= mglobal.tundraTemperature		* 1.25
		mglobal.snowTemperature			= mglobal.snowTemperature		* 1.25 -- snow is just horrible
	elseif oTemp == 3 then
		print("Map Temp: Hot")
		mglobal.tropicLatitudes			= mglobal.tropicLatitudes		* 1.5
		mglobal.iceLatitude			= mglobal.topLatitude - (mglobal.topLatitude - mglobal.iceLatitude) * 2
		mglobal.jungleMinTemperature		= 1 - ( 1 - mglobal.jungleMinTemperature) * 1.25
		mglobal.desertMinTemperature		= mglobal.desertMinTemperature		/ 1.25
		mglobal.tundraTemperature		= mglobal.tundraTemperature		/ 1.25
		mglobal.snowTemperature			= mglobal.snowTemperature		/ 1.25
	else
		print("Map Temp: Normal")
	end
	
	
	local oRainfall = Map.GetCustomOption(3)
	if oRainfall == 4 then oRainfall = 1 + Map.Rand(3, "Communitas random rain - Lua") end
	if oRainfall == 1 then
		print("Map Rain: Arid")
		mglobal.riverPercent		= mglobal.riverPercent		/ 1.5
		mglobal.featurePercent		= mglobal.featurePercent	/ 1.5
		mglobal.marshPercent		= mglobal.marshPercent		/ 1.5
		mglobal.junglePercent		= mglobal.junglePercent         / 1.5
		mglobal.forestPercent		= mglobal.forestPercent 	/ 1.25
		mglobal.forestTundraPercent	= mglobal.forestTundraPercent	/ 1.25
		mglobal.plainsPercent		= 1 - (1 - mglobal.plainsPercent) / 1.25
		mglobal.grassPercent		= 1 - (1 - mglobal.grassPercent) / 1.25
		mglobal.desertPercent		= mglobal.desertPercent		* 1.5
	elseif oRainfall == 3 then
		print("Map Rain: Wet")
		mglobal.featurePercent		= 0.9 -- should not go above 90%
		mglobal.riverPercent		= mglobal.riverPercent		* 1.5
		mglobal.marshPercent		= mglobal.marshPercent		* 1.5
		mglobal.junglePercent		= mglobal.junglePercent         * 1.5
		mglobal.forestPercent		= mglobal.forestPercent 	* 1.25
		mglobal.forestTundraPercent	= mglobal.forestTundraPercent	* 1.25
		mglobal.grassPercent		= mglobal.grassPercent		/ 1.25
		mglobal.plainsPercent		= mglobal.plainsPercent		/ 1.25
		mglobal.desertPercent		= mglobal.desertPercent		/ 1.5
	else
		print("Map Rain: Normal")
	end
	
	
	local oSeaLevel = Map.GetCustomOption(4)
	if oSeaLevel == 4 then oSeaLevel = 1 + Map.Rand(3, "Communitas random sea level - Lua") end
	if oSeaLevel == 1 then
		print("Map Seas: Low")
		mglobal.landPercent			= mglobal.landPercent * 1.25
	elseif oSeaLevel == 3 then
		print("Map Seas: High")
		mglobal.landPercent			= mglobal.landPercent / 1.25
	else
		print("Map Seas: Normal")
	end
	
	
	local oStarts = Map.GetCustomOption(6)
	if oStarts == 1 then
		print("Map Starts: Everywhere")
		mglobal.offsetAtlanticPercent	= 0.55	-- Percent of land to divide at the Atlantic Ocean (50% is usually halfway on the map)
		--mglobal.offshoreCS			= 0.50	-- no longer needed
	else
		print("Map Starts: Largest Continent")
		mglobal.offsetAtlanticPercent	= 0.35	-- Percent of land to divide at the Atlantic Ocean
		mglobal.percentLargestContinent	= 0.37	-- Eurasia must be this percent of total land (ensures citystates can appear there)
		mglobal.terraConnectWeight		= 10	-- if Eurasia is too small, connect sub-continents with this (size/distance) from Eurasia
		--mglobal.offshoreCS			= 0.75	-- no longer needed
		mglobal.numNaturalWonders		= Round (1.25 * mglobal.numNaturalWonders) -- extra wonders for larger map sizes
	end
	
	local oOceanRift = Map.GetCustomOption(7)
	if oOceanRift == 7 then
		oOceanRift = 3 + Map.Rand(4, "Communitas random ocean rifts - Lua") 
		if oOceanRift == 3 then
			oOceanRift = 1
		end
	end
	mglobal.oceanRiftTypes = oOceanRift
	local oceans = 2
	if oOceanRift == 5 then
		oceans = 1
	elseif oOceanRift == 6 then
		oceans = 0
	end
	
	local oRiftWidth = Map.GetCustomOption(8)
	if oRiftWidth == 4 then
		oRiftWidth = 1 + Map.Rand(3, "Communitas random rift width - Lua") 
	end
	--mglobal.oceanRiftWidth = mglobal.oceanRiftWidth * mapW	
	if oRiftWidth == 1 then
		print("Map Ocean Width: Narrow")
		mglobal.oceanRiftWidth = 1
		mglobal.landPercent = mglobal.landPercent + 0.02 * oceans
	elseif oRiftWidth == 2 then
		print("Map Ocean Width: Normal")
		mglobal.landPercent = mglobal.landPercent + 0.04 * oceans
	elseif oRiftWidth == 3 then
		print("Map Ocean Width: Wide")
		mglobal.oceanRiftWidth = math.max(4, Round(mapW/20)) 
		mglobal.landPercent = mglobal.landPercent + 0.07 * oceans
	end	
	
	-- Ocean rift sizes
	
	mglobal.oceanRiftWidth	= Round(mglobal.oceanRiftWidth)
	
	-- Override AssignStartingPlots?

	local oStartingPlots = Map.GetCustomOption(9)
	
	if oStartingPlots == 1 then
		overrideAssignStartingPlots = false
	elseif oStartingPlots == 2 then
		overrideAssignStartingPlots = true
	end


	end
	

	
	
	
	
	
	
	
	
	-- 
	-- Other settings
	-- 

	do
	--These attenuation factors lower the altitude of the map edges. This is
	--currently used to prevent large continents in the uninhabitable polar
	--regions. East/west attenuation is set to zero, but modded maps may
	--have need for them.
	mglobal.northAttenuationFactor	= 0.0
	mglobal.northAttenuationRange	= 0.0 --percent of the map height.
	mglobal.southAttenuationFactor	= 0.25
	mglobal.southAttenuationRange	= 0.30

	--east west attenuation may be desired for flat maps.
	mglobal.eastAttenuationFactor	= 0.58
	mglobal.eastAttenuationRange	= 0.20 --percent of the map width.
	mglobal.westAttenuationFactor	= 0.58
	mglobal.westAttenuationRange	= 0.20

	-- Rain tweaking variables
	mglobal.pressureNorm		= 1.0 --[1.0 = no normalization] Helps to prevent exaggerated Jungle/Marsh banding on the equator. -Bobert13
	mglobal.minimumRainCost		= 0.001	-- minumum percent of moisture which falls as it is passed on
	mglobal.pickUpModifier		= 0.8	-- percent of rain which falls on land and is picked up again (depends on temperature)
	mglobal.rainfallMultiplier	= 1.5	-- amount of moisture dropped per percentage change in pressure
	mglobal.basePressure		= 1.5	-- pressure at 0 elevation (pressure decreases as elevation increases) (keep this above 1)
	mglobal.polarRainBoost		= 0.00	-- additional rainfall at latitudes beyond polarFront
	
	--North and south isle latitude limits.
	mglobal.islesNearIce = false
	mglobal.isleNorthLatitudeLimit = 70
	mglobal.isleSouthLatitudeLimit = -70
	mglobal.isleMinDeepWaterNeighbors = 0

	end
	
	
	
	
	
	
	
	
	
	
	
	

	-----------------------------------------------------------------------
	--Below is map data that should not be altered.
	
	do
	mglobal.MountainPasses		= {}
	mglobal.tropicalPlots		= {}
	mglobal.oceanRiftPlots		= {}
	mglobal.islandAreaBuffed	= {}
	mglobal.lakePlots			= {}
	mglobal.seaPlots			= {}
	mglobal.elevationRect		= {}
	mglobal.oceanRiftMidlines	= {}

	-- Directions
	mglobal.C  = DirectionTypes.NO_DIRECTION
	mglobal.NE = DirectionTypes.DIRECTION_NORTHEAST
	mglobal.E  = DirectionTypes.DIRECTION_EAST
	mglobal.SE = DirectionTypes.DIRECTION_SOUTHEAST
	mglobal.SW = DirectionTypes.DIRECTION_SOUTHWEST
	mglobal.W  = DirectionTypes.DIRECTION_WEST
	mglobal.NW = DirectionTypes.DIRECTION_NORTHWEST
	mglobal.N  = DirectionTypes.DIRECTION_NORTHWEST + 1
	mglobal.S  = DirectionTypes.DIRECTION_NORTHWEST + 2
	
	mglobal.edgeDirections = {
		mglobal.NE,
		mglobal.E,
		mglobal.SE,
		mglobal.SW,
		mglobal.W,
		mglobal.NW
	}
	
	mglobal.directionNames = {
		[mglobal.C]  = "C"	,
		[mglobal.NE] = "NE"	,
		[mglobal.E]  = "E"	,
		[mglobal.SE] = "SE"	,
		[mglobal.SW] = "SW"	,
		[mglobal.W]  = "W"	,
		[mglobal.NW] = "NW"	,
		[mglobal.N]  = "N"	,
		[mglobal.S]  = "S"	
	}

	-- Flow Directions
	mglobal.NOFLOW = 0
	mglobal.WESTFLOW = 1
	mglobal.EASTFLOW = 2
	mglobal.VERTFLOW = 3
	
	mglobal.flowNONE = FlowDirectionTypes.NO_FLOWDIRECTION
	mglobal.flowN  = FlowDirectionTypes.FLOWDIRECTION_NORTH
	mglobal.flowNE = FlowDirectionTypes.FLOWDIRECTION_NORTHEAST
	mglobal.flowSE = FlowDirectionTypes.FLOWDIRECTION_SOUTHEAST
	mglobal.flowS  = FlowDirectionTypes.FLOWDIRECTION_SOUTH
	mglobal.flowSW = FlowDirectionTypes.FLOWDIRECTION_SOUTHWEST
	mglobal.flowNW = FlowDirectionTypes.FLOWDIRECTION_NORTHWEST 
	
	mglobal.flowNames = {
		[mglobal.flowNONE] = "NONE",
		[mglobal.flowN]  = "N"	,
		[mglobal.flowNE] = "NE"	,
		[mglobal.flowSE] = "SE"	,
		[mglobal.flowS]  = "S"	,
		[mglobal.flowSW] = "SW"	,
		[mglobal.flowNW] = "NW"
	}
	
	-- basic tile yields
	mglobal.basicYields = {
		YieldTypes.YIELD_FOOD,
		YieldTypes.YIELD_PRODUCTION,
		YieldTypes.YIELD_GOLD,
		YieldTypes.YIELD_SCIENCE,
		YieldTypes.YIELD_CULTURE,
		YieldTypes.YIELD_FAITH
	}
	
	--wind zones
	mglobal.NOZONE = -1
	mglobal.NPOLAR = 0
	mglobal.NTEMPERATE = 1
	mglobal.NEQUATOR = 2
	mglobal.SEQUATOR = 3
	mglobal.STEMPERATE = 4
	mglobal.SPOLAR = 5

	--Hex maps are shorter in the y direction than they are
	--wide per unit by this much. We need to know this to sample the perlin
	--maps properly so they don't look squished.
	mglobal.YtoXRatio = 1.5/(math.sqrt(0.75) * 2)
	
	
	-- Array of route types - you can change the text, but NOT the order
	mglobal.routes = {"Land", "Road", "Railroad", "Coastal", "Ocean", "Submarine"}

	-- Array of highlight colours
	mglobal.highlights = {  Red     = Vector4(1.0, 0.0, 0.0, 1.0), 
						   Green   = Vector4(0.0, 1.0, 0.0, 1.0), 
						   Blue    = Vector4(0.0, 0.0, 1.0, 1.0),
						   Cyan    = Vector4(0.0, 1.0, 1.0, 1.0),
						   Yellow  = Vector4(1.0, 1.0, 0.0 ,1.0),
						   Magenta = Vector4(1.0, 0.0, 1.0, 1.0),
						   Black   = Vector4(0.5, 0.5, 0.5, 1.0)}      

	mglobal.lastRouteLength = 0
	mglobal.pathDirections  = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
							  DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}
	
	end

--
-- Override AssignStartingPlots functions
--

if overrideAssignStartingPlots == true then
------------------------------------------------------------------------------
function AssignStartingPlots.Create()
	-- There are three methods of dividing the map in to regions.
	-- OneLandmass, Continents, Oceanic. Default method is Continents.
	--
	-- Standard start plot finding uses a regional division method, then
	-- assigns one civ per region. Regions with lowest average fertility
	-- get their assignment first, to avoid the poor getting poorer.
	--
	-- Default methods for civ and city state placement both rely on having
	-- regional division data. If the desired process for a given map script
	-- would not define regions of this type, replace the start finder
	-- with your custom method.
	--
	-- Note that this operation relies on inclusion of the Mapmaker Utilities.
	local iW, iH = Map.GetGridSize();
	local feature_atoll;
	for thisFeature in GameInfo.Features() do
		if thisFeature.Type == "FEATURE_ATOLL" then
			feature_atoll = thisFeature.ID;
		end
	end

	-- Main data table ("self dot" table).
	--
	-- Scripters have the opportunity to replace member methods without
	-- having to replace the entire process.
	local findStarts = {

		-- Core Process member methods
		__Init = AssignStartingPlots.__Init,
		__InitLuxuryWeights = AssignStartingPlots.__InitLuxuryWeights,
		__CustomInit = AssignStartingPlots.__CustomInit,
		ApplyHexAdjustment = AssignStartingPlots.ApplyHexAdjustment,
		GenerateRegions = AssignStartingPlots.GenerateRegions,
		ChooseLocations = AssignStartingPlots.ChooseLocations,
		BalanceAndAssign = AssignStartingPlots.BalanceAndAssign,
		PlaceNaturalWonders = AssignStartingPlots.PlaceNaturalWonders,
		PlaceResourcesAndCityStates = AssignStartingPlots.PlaceResourcesAndCityStates,
		
		-- Generate Regions member methods
		MeasureStartPlacementFertilityOfPlot = AssignStartingPlots.MeasureStartPlacementFertilityOfPlot,
		MeasureStartPlacementFertilityInRectangle = AssignStartingPlots.MeasureStartPlacementFertilityInRectangle,
		MeasureStartPlacementFertilityOfLandmass = AssignStartingPlots.MeasureStartPlacementFertilityOfLandmass,
		RemoveDeadRows = AssignStartingPlots.RemoveDeadRows,
		DivideIntoRegions = AssignStartingPlots.DivideIntoRegions,
		ChopIntoThreeRegions = AssignStartingPlots.ChopIntoThreeRegions,
		ChopIntoTwoRegions = AssignStartingPlots.ChopIntoTwoRegions,
		CustomOverride = AssignStartingPlots.CustomOverride,

		-- Choose Locations member methods
		MeasureTerrainInRegions = AssignStartingPlots.MeasureTerrainInRegions,
		DetermineRegionTypes = AssignStartingPlots.DetermineRegionTypes,
		PlaceImpactAndRipples = AssignStartingPlots.PlaceImpactAndRipples,
		MeasureSinglePlot = AssignStartingPlots.MeasureSinglePlot,
		EvaluateCandidatePlot = AssignStartingPlots.EvaluateCandidatePlot,
		IterateThroughCandidatePlotList = AssignStartingPlots.IterateThroughCandidatePlotList,
		FindStart = AssignStartingPlots.FindStart,
		FindCoastalStart = AssignStartingPlots.FindCoastalStart,
		FindStartWithoutRegardToAreaID = AssignStartingPlots.FindStartWithoutRegardToAreaID,
		
		-- Balance and Assign member methods
		AttemptToPlaceBonusResourceAtPlot = AssignStartingPlots.AttemptToPlaceBonusResourceAtPlot,
		AttemptToPlaceHillsAtPlot = AssignStartingPlots.AttemptToPlaceHillsAtPlot,
		AttemptToPlaceSmallStrategicAtPlot = AssignStartingPlots.AttemptToPlaceSmallStrategicAtPlot,
		FindFallbackForUnmatchedRegionPriority = AssignStartingPlots.FindFallbackForUnmatchedRegionPriority,
		AddStrategicBalanceResources = AssignStartingPlots.AddStrategicBalanceResources,
		AttemptToPlaceForestAtGrassPlot = AssignStartingPlots.AttemptToPlaceForestAtGrassPlot,
		AttemptToPlaceStoneAtGrassPlot = AssignStartingPlots.AttemptToPlaceStoneAtGrassPlot,
		NormalizeStartLocation = AssignStartingPlots.NormalizeStartLocation,
		NormalizeTeamLocations = AssignStartingPlots.NormalizeTeamLocations,
		
		-- Natural Wonders member methods
		ExaminePlotForNaturalWondersEligibility = AssignStartingPlots.ExaminePlotForNaturalWondersEligibility,
		ExamineCandidatePlotForNaturalWondersEligibility = AssignStartingPlots.ExamineCandidatePlotForNaturalWondersEligibility,
		CanBeThisNaturalWonderType = AssignStartingPlots.CanBeThisNaturalWonderType,
		GenerateLocalVersionsOfDataFromXML = AssignStartingPlots.GenerateLocalVersionsOfDataFromXML,
		GenerateNaturalWondersCandidatePlotLists = AssignStartingPlots.GenerateNaturalWondersCandidatePlotLists,
		AttemptToPlaceNaturalWonder = AssignStartingPlots.AttemptToPlaceNaturalWonder,

		-- City States member methods
		AssignCityStatesToRegionsOrToUninhabited = AssignStartingPlots.AssignCityStatesToRegionsOrToUninhabited,
		CanPlaceCityStateAt = AssignStartingPlots.CanPlaceCityStateAt,
		ObtainNextSectionInRegion = AssignStartingPlots.ObtainNextSectionInRegion,
		PlaceCityState = AssignStartingPlots.PlaceCityState,
		PlaceCityStateInRegion = AssignStartingPlots.PlaceCityStateInRegion,
		PlaceCityStates = AssignStartingPlots.PlaceCityStates,	-- Dependent on AssignLuxuryRoles being executed first, so beware.
		NormalizeCityState = AssignStartingPlots.NormalizeCityState,
		NormalizeCityStateLocations = AssignStartingPlots.NormalizeCityStateLocations, -- Dependent on PlaceLuxuries being executed first.

		-- Resources member methods
		GenerateGlobalResourcePlotLists = AssignStartingPlots.GenerateGlobalResourcePlotLists,
		PlaceResourceImpact = AssignStartingPlots.PlaceResourceImpact,		-- Note: called from PlaceImpactAndRipples
		ProcessResourceList = AssignStartingPlots.ProcessResourceList,
		PlaceSpecificNumberOfResources = AssignStartingPlots.PlaceSpecificNumberOfResources,
		IdentifyRegionsOfThisType = AssignStartingPlots.IdentifyRegionsOfThisType,
		SortRegionsByType = AssignStartingPlots.SortRegionsByType,
		AssignLuxuryToRegion = AssignStartingPlots.AssignLuxuryToRegion,
		GetLuxuriesSplitCap = AssignStartingPlots.GetLuxuriesSplitCap,		-- New for Expansion, because we have more luxuries now.
		GetCityStateLuxuriesTargetNumber = AssignStartingPlots.GetCityStateLuxuriesTargetNumber,	-- New for Expansion
		GetDisabledLuxuriesTargetNumber = AssignStartingPlots.GetDisabledLuxuriesTargetNumber,
		GetRandomLuxuriesTargetNumber = AssignStartingPlots.GetRandomLuxuriesTargetNumber,	-- MOD.Barathor: New
		AssignLuxuryRoles = AssignStartingPlots.AssignLuxuryRoles,
		GetListOfAllowableLuxuriesAtCitySite = AssignStartingPlots.GetListOfAllowableLuxuriesAtCitySite,
		GenerateLuxuryPlotListsAtCitySite = AssignStartingPlots.GenerateLuxuryPlotListsAtCitySite, -- Also doubles as Ice Removal.
		GenerateLuxuryPlotListsInRegion = AssignStartingPlots.GenerateLuxuryPlotListsInRegion,
		GetIndicesForLuxuryType = AssignStartingPlots.GetIndicesForLuxuryType,
		GetRegionLuxuryTargetNumbers = AssignStartingPlots.GetRegionLuxuryTargetNumbers,
		GetWorldLuxuryTargetNumbers = AssignStartingPlots.GetWorldLuxuryTargetNumbers,
		PlaceMarble = AssignStartingPlots.PlaceMarble,
		PlaceLuxuries = AssignStartingPlots.PlaceLuxuries,
		PlaceSmallQuantitiesOfStrategics = AssignStartingPlots.PlaceSmallQuantitiesOfStrategics,
		PlaceFish = AssignStartingPlots.PlaceFish,
		PlaceSexyBonusAtCivStarts = AssignStartingPlots.PlaceSexyBonusAtCivStarts,
		AddExtraBonusesToHillsRegions = AssignStartingPlots.AddExtraBonusesToHillsRegions,
		AddModernMinorStrategicsToCityStates = AssignStartingPlots.AddModernMinorStrategicsToCityStates,
		PlaceOilInTheSea = AssignStartingPlots.PlaceOilInTheSea,
		FixResourceGraphics = AssignStartingPlots.FixResourceGraphics, -- Sugar could not be made visible enough in jungle, so turn any sugar jungle to marsh.	-- MOD.Barathor: Update -- original = FixSugarJungles
		PrintFinalResourceTotalsToLog = AssignStartingPlots.PrintFinalResourceTotalsToLog,
		GetMajorStrategicResourceQuantityValues = AssignStartingPlots.GetMajorStrategicResourceQuantityValues,
		GetSmallStrategicResourceQuantityValues = AssignStartingPlots.GetSmallStrategicResourceQuantityValues,
		PlaceStrategicAndBonusResources = AssignStartingPlots.PlaceStrategicAndBonusResources,
		
		-- Extra functions for VP
		AdjustTiles = AssignStartingPlots.AdjustTiles,
		PlaceBonusResources = AssignStartingPlots.PlaceBonusResources,
		IsEvenMoreResourcesActive = AssignStartingPlots.IsEvenMoreResourcesActive,
		Plot_GetPlotsInCircle = AssignStartingPlots.Plot_GetPlotsInCircle,
		Plot_GetFertilityInRange = AssignStartingPlots.Plot_GetFertilityInRange,
		Plot_GetFertility = AssignStartingPlots.Plot_GetFertility,
		IsBetween = AssignStartingPlots.IsBetween,
		GetRandomMultiplier = AssignStartingPlots.GetRandomMultiplier,
		Constrain = AssignStartingPlots.Constrain,
		
		-- Support custom map resource settings
		resDensity = 2,
		resSize = 2,
		legStart = false,
		resBalance = false,
		bonusDensity = 2,
		luxuryDensity = 2,
		
		-- Civ start position variables
		startingPlots = {},				-- Stores x and y coordinates (and "score") of starting plots for civs, indexed by region number
		method = 2,						-- Method of regional division, default is 2
		iNumCivs = 0,					-- Number of civs at game start
		player_ID_list = {},			-- Correct list of player IDs (includes handling of any 'gaps' that occur in MP games)
		plotDataIsCoastal = {},			-- Stores table of NextToSaltWater plots to reduce redundant calculations
		plotDataIsNextToCoast = {},		-- Stores table of TwoAwayFromSaltWater plots to reduce redundant calculations
		regionData = {},				-- Stores data returned from regional division algorithm
		regionTerrainCounts = {},		-- Stores counts of terrain elements for all regions
		regionTypes = {},				-- Stores region types
		distanceData = table.fill(0, iW * iH), -- Stores "impact and ripple" data of start points as each is placed
		playerCollisionData = table.fill(false, iW * iH), -- Stores "impact" data only, of start points, to avoid player collisions
		startLocationConditions = {},   -- Stores info regarding conditions at each start location
		hasMountainBias = false;		-- Stores whether there's a civ that prefers to start near mountains
		hasSnowBias = false;			-- Stores whether there's a civ that prefers to start near snow
		
		-- Team info variables (not used in the core process, but necessary to many Multiplayer map scripts)
		bTeamGame,
		iNumTeamsOfCivs,
		teams_with_major_civs,
		number_civs_per_team,
		
		-- Rectangular Division, dimensions within which all regions reside. (Unused by the other methods)
		inhabited_WestX,
		inhabited_SouthY,
		inhabited_Width,
		inhabited_Height,

		-- Natural Wonders variables
		naturalWondersData = table.fill(0, iW * iH), -- Stores "impact and ripple" data in the natural wonders layer
		bWorldHasOceans,
		iBiggestLandmassID,
		iNumNW = 0,
		wonder_list = {},
		eligibility_lists = {},
		xml_row_numbers = {},
		placed_natural_wonder = {},
		feature_atoll,
		
		-- City States variables
		cityStatePlots = {},			-- Stores x and y coordinates, and region number, of city state sites
		iNumCityStates = 0,				-- Number of city states at game start
		iNumCityStatesUnassigned = 0,	-- Number of City States still in need of placement method assignment
		iNumCityStatesPerRegion = 0,	-- Number of City States to be placed in each civ's region
		iNumCityStatesUninhabited = 0,	-- Number of City States to be placed on landmasses uninhabited by civs
		iNumCityStatesSharedLux = 0,	-- Number of City States to be placed in regions whose luxury type is shared with other regions
		iNumCityStatesLowFertility = 0,	-- Number of extra City States to be placed in regions with low fertility per land plot
		cityStateData = table.fill(0, iW * iH), -- Stores "impact and ripple" data in the city state layer
		city_state_region_assignments = table.fill(-1, 41), -- Stores region number of each city state (-1 if not in a region)
		uninhabited_areas_coastal_plots = {}, -- For use in placing city states outside of Regions
		uninhabited_areas_inland_plots = {},
		iNumCityStatesDiscarded = 0,	-- If a city state cannot be placed without being too close to another start, it will be discarded
		city_state_validity_table = table.fill(false, 41), -- Value set to true when a given city state is successfully assigned a start plot
		
		-- Resources variables
		resources = {},                 -- Stores all resource data, pulled from the XML
		resource_setting,				-- User selection for Resource Setting, chosen on game launch (when applicable)
		amounts_of_resources_placed = table.fill(0, 99), -- Stores amounts of each resource ID placed. WARNING: This table uses adjusted resource ID (+1) to account for Lua indexing. Add 1 to all IDs to index this table.	-- MOD.Barathor: Updated -- original = 45 -- any new luxuries added post BNW start at ID 40, so this needs to be increased!
		luxury_assignment_count = table.fill(0, 99), -- Stores amount of each luxury type assigned to regions. WARNING: current implementation will crash if a Luxury is attached to resource ID 0 (default = iron), because this table uses unadjusted resource ID as table index.
		luxury_low_fert_compensation = table.fill(0, 99), -- Stores number of times each resource ID had extras handed out at civ starts. WARNING: Indexed by resource ID.
		region_low_fert_compensation = table.fill(0, 22); -- Stores number of luxury compensation each region received
		luxury_region_weights = {},		-- Stores weighted assignments for the types of regions
		luxury_fallback_weights = {},	-- In case all options for a given region type got assigned or disabled, also used for Undefined regions
		luxury_city_state_weights = {},	-- Stores weighted assignments for city state exclusive luxuries
		strategicData = table.fill(0, iW * iH), -- Stores "impact and ripple" data in the strategic resources layer
		luxuryData = table.fill(0, iW * iH), -- Stores "impact and ripple" data in the luxury resources layer
		bonusData = table.fill(0, iW * iH), -- Stores "impact and ripple" data in the bonus resources layer
		fishData = table.fill(0, iW * iH), -- Stores "impact and ripple" data in the fish layer
		marbleData = table.fill(0, iW * iH), -- Stores "impact and ripple" data in the marble layer
		sheepData = table.fill(0, iW * iH), -- Stores "impact and ripple" data in the sheep layer -- Sheep use regular bonus layer PLUS this one
		regions_sorted_by_type = {},	-- Stores table that includes region number and Luxury ID (this is where the two are first matched)
		region_luxury_assignment = {},	-- Stores luxury assignments, keyed by region number.
		iNumTypesUnassigned = 30,		-- Total number of luxuries. Adjust if modifying number of luxury resources.	-- MOD.Barathor: Updated: original = 20	-- MOD.Barathor: Update: No longer using this!
		iNumMaxAllowedForRegions = 16,	-- Maximum luxury types allowed to be assigned to regional distribution. CANNOT be reduced below 8!		-- MOD.Barathor: original = 8
		iNumTypesAssignedToRegions = 0,
		resourceIDs_assigned_to_regions = {},
		iNumTypesAssignedToCS = 3,		-- Luxury types that will be placed only near city states
		resourceIDs_assigned_to_cs = {},
		iNumTypesSpecialCase = 1,		-- Marble affects Wonder construction, so requires special-case handling
		resourceIDs_assigned_to_special_case = {},
		iNumTypesRandom = 0,
		resourceIDs_assigned_to_random = {},
		iNumTypesDisabled = 0,
		resourceIDs_not_being_used = {},
		totalLuxPlacedSoFar = 0,
		realtotalLuxPlacedSoFar = 0,	-- MOD.Barathor: New -- This displays the "real" total for luxuries and not the bugged one which also adds some strategics and bonuses which use the PlaceSpecificNumberOfResources placement method that luxuries use.
													-- Note: This bug doesn't affect gameplay and things are placed as intended since all luxuries are placed first, before other resource types.  This just affects the debug printout data.

		-- Plot lists for use with global distribution of Luxuries.
		--
		-- NOTE: These lists are best synchronized with the equivalent plot list generations
		-- for regions and individual city sites, to keep Luxury behavior globally consistent.
		-- All three list sets are acted upon by a single set of indices, which apply only to 
		-- Luxury resources. These are controlled in the function GetIndicesForLuxuryType.
		-- 
		global_luxury_plot_lists = {},
		coast_next_to_land_list = {},
		marsh_list = {},
		flood_plains_list = {},
		hills_open_list = {},
		hills_covered_list = {},
		hills_jungle_list = {},
		hills_forest_list = {},
		jungle_flat_list = {},
		forest_flat_list = {},
		desert_flat_no_feature = {},
		plains_flat_no_feature = {},
		dry_grass_flat_no_feature = {},
		fresh_water_grass_flat_no_feature = {},
		tundra_flat_including_forests = {},
		forest_flat_that_are_not_tundra = {},
		-- MOD.Barathor: New Plot lists
		-- MOD.Barathor: Start
		dry_plains_flat_no_feature = {},
		fresh_water_plains_flat_no_feature = {},
		tundra_flat_forest = {},
		desert_or_tundra_flat_no_feature = {},
		hills_open_no_tundra = {},
		hills_open_no_desert = {},
		hills_open_no_tundra_no_desert = {},
		hills_open_no_grass = {},
		hills_open_no_grass_no_tundra = {},
		hills_open_no_grass_no_plains = {},
		hills_covered_no_tundra = {},
		hills_covered_no_grass = {},
		hills_covered_no_grass_no_tundra = {},
		flat_covered = {},
		flat_covered_no_grass = {},
		flat_covered_no_tundra = {},
		flat_covered_no_grass_no_tundra = {},
		flat_open = {},
		flat_open_no_grass_no_plains = {},
		flat_open_no_tundra_no_desert = {},
		flat_open_no_desert = {},
		flat_desert_including_flood = {},
		-- MOD.Barathor: End
		feature_atoll = feature_atoll,
		
		-- Additional Plot lists for use with global distribution of Strategics and Bonus.
		--
		-- Unlike Luxuries, which have sophisticated handling to foster supply and demand
		-- in support of Trade and Diplomacy, the Strategic and Bonus resources are 
		-- allowed to conform to the terrain of a given map, with their quantities 
		-- available in any given game only loosely controlled. Thanks to the new method
		-- of quantifying strategic resources, the controls on their distribution no
		-- longer need to be as strenuous. Likewise with Bonus no longer affecting trade.
		grass_flat_no_feature = {},
		tundra_flat_no_feature = {},
		snow_flat_list = {},
		hills_list = {},
		land_list = {},
		coast_list = {},
		marble_list = {},
		extra_deer_list = {},
		desert_wheat_list = {},
		banana_list = {},
		-- MOD.HungryForFood: Start
		coconut_list = {},
		-- MOD.HungryForFood: End
		barren_plots = 0,
		
		-- Positioner defaults. These are the controls for the "Center Bias" placement method for civ starts in regions.
		centerBias = 34, -- % of radius from region center to examine first
		middleBias = 67, -- % of radius from region center to check second
		minFoodInner = 1,
		minProdInner = 0,
		minGoodInner = 3,
		minFoodMiddle = 4,
		minProdMiddle = 0,
		minGoodMiddle = 6,
		minFoodOuter = 4,
		minProdOuter = 2,
		minGoodOuter = 8,
		maxJunk = 9,

		-- Hex Adjustment tables. These tables direct plot by plot scans in a radius 
		-- around a center hex, starting to Northeast, moving clockwise.
		firstRingYIsEven = {{0, 1}, {1, 0}, {0, -1}, {-1, -1}, {-1, 0}, {-1, 1}},
		secondRingYIsEven = {
		{1, 2}, {1, 1}, {2, 0}, {1, -1}, {1, -2}, {0, -2},
		{-1, -2}, {-2, -1}, {-2, 0}, {-2, 1}, {-1, 2}, {0, 2}
		},
		thirdRingYIsEven = {
		{1, 3}, {2, 2}, {2, 1}, {3, 0}, {2, -1}, {2, -2},
		{1, -3}, {0, -3}, {-1, -3}, {-2, -3}, {-2, -2}, {-3, -1},
		{-3, 0}, {-3, 1}, {-2, 2}, {-2, 3}, {-1, 3}, {0, 3}
		},
		firstRingYIsOdd = {{1, 1}, {1, 0}, {1, -1}, {0, -1}, {-1, 0}, {0, 1}},
		secondRingYIsOdd = {		
		{1, 2}, {2, 1}, {2, 0}, {2, -1}, {1, -2}, {0, -2},
		{-1, -2}, {-1, -1}, {-2, 0}, {-1, 1}, {-1, 2}, {0, 2}
		},
		thirdRingYIsOdd = {		
		{2, 3}, {2, 2}, {3, 1}, {3, 0}, {3, -1}, {2, -2},
		{2, -3}, {1, -3}, {0, -3}, {-1, -3}, {-2, -2}, {-2, -1},
		{-3, 0}, {-2, 1}, {-2, 2}, {-1, 3}, {0, 3}, {1, 3}
		},
		-- Direction types table, another method of handling hex adjustments, in combination with Map.PlotDirection()
		direction_types = {
			DirectionTypes.DIRECTION_NORTHEAST,
			DirectionTypes.DIRECTION_EAST,
			DirectionTypes.DIRECTION_SOUTHEAST,
			DirectionTypes.DIRECTION_SOUTHWEST,
			DirectionTypes.DIRECTION_WEST,
			DirectionTypes.DIRECTION_NORTHWEST
			},
		
		-- Handy resource ID shortcuts
		wheat_ID, cow_ID, deer_ID, banana_ID, fish_ID, sheep_ID, stone_ID, bison_ID,
		iron_ID, horse_ID, coal_ID, oil_ID, aluminum_ID, uranium_ID,
		whale_ID, pearls_ID, ivory_ID, fur_ID, silk_ID,
		dye_ID, spices_ID, sugar_ID, cotton_ID, wine_ID, incense_ID,
		gold_ID, silver_ID, gems_ID, marble_ID,
		-- Expansion luxuries
		copper_ID, salt_ID, citrus_ID, truffles_ID, crab_ID, cocoa_ID,
		-- Mod luxuries
		coffee_ID, tea_ID, tobacco_ID, amber_ID, jade_ID, olives_ID, perfume_ID, coral_ID, lapis_ID, -- MOD.Barathor: New
		-- Even More Resources for Vox Populi (luxuries)
		lavender_ID, obsidian_ID, platinum_ID, poppy_ID, tin_ID, -- MOD.HungryForFood: New
		-- Even More Resources for Vox Populi (bonus)
		coconut_ID, hardwood_ID, lead_ID, maize_ID, pineapple_ID, potato_ID, rice_ID, rubber_ID, sulfur_ID, titanium_ID, -- MOD.HungryForFood: New
		
		-- Local arrays for storing Natural Wonder Placement XML data
		EligibilityMethodNumber = {},
		OccurrenceFrequency = {},
		RequireBiggestLandmass = {},
		AvoidBiggestLandmass = {},
		RequireFreshWater = {},
		AvoidFreshWater = {},
		LandBased = {},
		RequireLandAdjacentToOcean = {},
		AvoidLandAdjacentToOcean = {},
		RequireLandOnePlotInland = {},
		AvoidLandOnePlotInland = {},
		RequireLandTwoOrMorePlotsInland = {},
		AvoidLandTwoOrMorePlotsInland = {},
		CoreTileCanBeAnyPlotType = {},
		CoreTileCanBeFlatland = {},
		CoreTileCanBeHills = {},
		CoreTileCanBeMountain = {},
		CoreTileCanBeOcean = {},
		CoreTileCanBeAnyTerrainType = {},
		CoreTileCanBeGrass = {},
		CoreTileCanBePlains = {},
		CoreTileCanBeDesert = {},
		CoreTileCanBeTundra = {},
		CoreTileCanBeSnow = {},
		CoreTileCanBeShallowWater = {},
		CoreTileCanBeDeepWater = {},
		CoreTileCanBeAnyFeatureType = {},
		CoreTileCanBeNoFeature = {},
		CoreTileCanBeForest = {},
		CoreTileCanBeJungle = {},
		CoreTileCanBeOasis = {},
		CoreTileCanBeFloodPlains = {},
		CoreTileCanBeMarsh = {},
		CoreTileCanBeIce = {},
		CoreTileCanBeAtoll = {},
		AdjacentTilesCareAboutPlotTypes = {},
		AdjacentTilesAvoidAnyland = {},
		AdjacentTilesRequireFlatland = {},
		RequiredNumberOfAdjacentFlatland = {},
		AdjacentTilesRequireHills = {},
		RequiredNumberOfAdjacentHills = {},
		AdjacentTilesRequireMountain = {},
		RequiredNumberOfAdjacentMountain = {},
		AdjacentTilesRequireHillsPlusMountains = {},
		RequiredNumberOfAdjacentHillsPlusMountains = {},
		AdjacentTilesRequireOcean = {},
		RequiredNumberOfAdjacentOcean = {},
		AdjacentTilesAvoidFlatland = {},
		MaximumAllowedAdjacentFlatland = {},
		AdjacentTilesAvoidHills = {},
		MaximumAllowedAdjacentHills = {},
		AdjacentTilesAvoidMountain = {},
		MaximumAllowedAdjacentMountain = {},
		AdjacentTilesAvoidHillsPlusMountains = {},
		MaximumAllowedAdjacentHillsPlusMountains = {},
		AdjacentTilesAvoidOcean = {},
		MaximumAllowedAdjacentOcean = {},
		AdjacentTilesCareAboutTerrainTypes = {},
		AdjacentTilesRequireGrass = {},
		RequiredNumberOfAdjacentGrass = {},
		AdjacentTilesRequirePlains = {},
		RequiredNumberOfAdjacentPlains = {},
		AdjacentTilesRequireDesert = {},
		RequiredNumberOfAdjacentDesert = {},
		AdjacentTilesRequireTundra = {},
		RequiredNumberOfAdjacentTundra = {},
		AdjacentTilesRequireSnow = {},
		RequiredNumberOfAdjacentSnow = {},
		AdjacentTilesRequireShallowWater = {},
		RequiredNumberOfAdjacentShallowWater = {},
		AdjacentTilesRequireDeepWater = {},
		RequiredNumberOfAdjacentDeepWater = {},
		AdjacentTilesAvoidGrass = {},
		MaximumAllowedAdjacentGrass = {},
		AdjacentTilesAvoidPlains = {},
		MaximumAllowedAdjacentPlains = {},
		AdjacentTilesAvoidDesert = {},
		MaximumAllowedAdjacentDesert = {},
		AdjacentTilesAvoidTundra = {},
		MaximumAllowedAdjacentTundra = {},
		AdjacentTilesAvoidSnow = {},
		MaximumAllowedAdjacentSnow = {},
		AdjacentTilesAvoidShallowWater = {},
		MaximumAllowedAdjacentShallowWater = {},
		AdjacentTilesAvoidDeepWater = {},
		MaximumAllowedAdjacentDeepWater = {},
		AdjacentTilesCareAboutFeatureTypes = {},
		AdjacentTilesRequireNoFeature = {},
		RequiredNumberOfAdjacentNoFeature = {},
		AdjacentTilesRequireForest = {},
		RequiredNumberOfAdjacentForest = {},
		AdjacentTilesRequireJungle = {},
		RequiredNumberOfAdjacentJungle = {},
		AdjacentTilesRequireOasis = {},
		RequiredNumberOfAdjacentOasis = {},
		AdjacentTilesRequireFloodPlains = {},
		RequiredNumberOfAdjacentFloodPlains = {},
		AdjacentTilesRequireMarsh = {},
		RequiredNumberOfAdjacentMarsh = {},
		AdjacentTilesRequireIce = {},
		RequiredNumberOfAdjacentIce = {},
		AdjacentTilesRequireAtoll = {},
		RequiredNumberOfAdjacentAtoll = {},
		AdjacentTilesAvoidNoFeature = {},
		MaximumAllowedAdjacentNoFeature = {},
		AdjacentTilesAvoidForest = {},
		MaximumAllowedAdjacentForest = {},
		AdjacentTilesAvoidJungle = {},
		MaximumAllowedAdjacentJungle = {},
		AdjacentTilesAvoidOasis = {},
		MaximumAllowedAdjacentOasis = {},
		AdjacentTilesAvoidFloodPlains = {},
		MaximumAllowedAdjacentFloodPlains = {},
		AdjacentTilesAvoidMarsh = {},
		MaximumAllowedAdjacentMarsh = {},
		AdjacentTilesAvoidIce = {},
		MaximumAllowedAdjacentIce = {},
		AdjacentTilesAvoidAtoll = {},
		MaximumAllowedAdjacentAtoll = {},
		TileChangesMethodNumber = {},
		ChangeCoreTileToMountain = {},
		ChangeCoreTileToFlatland = {},
		ChangeCoreTileTerrainToGrass = {},
		ChangeCoreTileTerrainToPlains = {},
		SetAdjacentTilesToShallowWater = {},
		
	}
	
	findStarts:__Init()
	
	findStarts:__InitLuxuryWeights()
	
	-- Entry point for easy overrides, for instance if only a couple things need to change.
	findStarts:__CustomInit()
	
	return findStarts
end

function AssignStartingPlots:__Init()
	-- Set up data tables that record whether a plot is coastal land and whether a plot is adjacent to coastal land.
	self.plotDataIsCoastal, self.plotDataIsNextToCoast = GenerateNextToCoastalLandDataTables()
	--
	-- Set up data for resource ID shortcuts.
	for resource_data in GameInfo.Resources() do
		table.insert(self.resources, resource_data);
		local resourceID = resource_data.ID;
		local resourceType = resource_data.Type;
		-- Set up Bonus IDs
		if resourceType == "RESOURCE_WHEAT" then
			self.wheat_ID = resourceID;
		elseif resourceType == "RESOURCE_COW" then
			self.cow_ID = resourceID;
		elseif resourceType == "RESOURCE_DEER" then
			self.deer_ID = resourceID;
		elseif resourceType == "RESOURCE_BANANA" then
			self.banana_ID = resourceID;
		elseif resourceType == "RESOURCE_FISH" then
			self.fish_ID = resourceID;
		elseif resourceType == "RESOURCE_SHEEP" then
			self.sheep_ID = resourceID;
		elseif resourceType == "RESOURCE_STONE" then
			self.stone_ID = resourceID;
		elseif resourceType == "RESOURCE_BISON" then
			self.bison_ID = resourceID;
		-- Set up Strategic IDs
		elseif resourceType == "RESOURCE_IRON" then
			self.iron_ID = resourceID;
		elseif resourceType == "RESOURCE_HORSE" then
			self.horse_ID = resourceID;
		elseif resourceType == "RESOURCE_COAL" then
			self.coal_ID = resourceID;
		elseif resourceType == "RESOURCE_OIL" then
			self.oil_ID = resourceID;
		elseif resourceType == "RESOURCE_ALUMINUM" then
			self.aluminum_ID = resourceID;
		elseif resourceType == "RESOURCE_URANIUM" then
			self.uranium_ID = resourceID;
		-- Set up Luxury IDs
		elseif resourceType == "RESOURCE_WHALE" then
			self.whale_ID = resourceID;
		elseif resourceType == "RESOURCE_PEARLS" then
			self.pearls_ID = resourceID;
		elseif resourceType == "RESOURCE_IVORY" then
			self.ivory_ID = resourceID;
		elseif resourceType == "RESOURCE_FUR" then
			self.fur_ID = resourceID;
		elseif resourceType == "RESOURCE_SILK" then
			self.silk_ID = resourceID;
		elseif resourceType == "RESOURCE_DYE" then
			self.dye_ID = resourceID;
		elseif resourceType == "RESOURCE_SPICES" then
			self.spices_ID = resourceID;
		elseif resourceType == "RESOURCE_SUGAR" then
			self.sugar_ID = resourceID;
		elseif resourceType == "RESOURCE_COTTON" then
			self.cotton_ID = resourceID;
		elseif resourceType == "RESOURCE_WINE" then
			self.wine_ID = resourceID;
		elseif resourceType == "RESOURCE_INCENSE" then
			self.incense_ID = resourceID;
		elseif resourceType == "RESOURCE_GOLD" then
			self.gold_ID = resourceID;
		elseif resourceType == "RESOURCE_SILVER" then
			self.silver_ID = resourceID;
		elseif resourceType == "RESOURCE_GEMS" then
			self.gems_ID = resourceID;
		elseif resourceType == "RESOURCE_MARBLE" then
			self.marble_ID = resourceID;
		-- Set up Expansion Pack Luxury IDs
		elseif resourceType == "RESOURCE_COPPER" then
			self.copper_ID = resourceID;
		elseif resourceType == "RESOURCE_SALT" then
			self.salt_ID = resourceID;
		elseif resourceType == "RESOURCE_CITRUS" then
			self.citrus_ID = resourceID;
		elseif resourceType == "RESOURCE_TRUFFLES" then
			self.truffles_ID = resourceID;
		elseif resourceType == "RESOURCE_CRAB" then
			self.crab_ID = resourceID;
		elseif resourceType == "RESOURCE_COCOA" then
			self.cocoa_ID = resourceID;
		-- Mod Luxury IDs
		elseif resourceType == "RESOURCE_COFFEE" then	-- MOD.Barathor: New
			self.coffee_ID = resourceID;
		elseif resourceType == "RESOURCE_TEA" then		-- MOD.Barathor: New
			self.tea_ID = resourceID;
		elseif resourceType == "RESOURCE_TOBACCO" then	-- MOD.Barathor: New
			self.tobacco_ID = resourceID;
		elseif resourceType == "RESOURCE_AMBER" then	-- MOD.Barathor: New
			self.amber_ID = resourceID;
		elseif resourceType == "RESOURCE_JADE" then		-- MOD.Barathor: New
			self.jade_ID = resourceID;
		elseif resourceType == "RESOURCE_OLIVE" then	-- MOD.Barathor: New
			self.olives_ID = resourceID;
		elseif resourceType == "RESOURCE_PERFUME" then	-- MOD.Barathor: New
			self.perfume_ID = resourceID;
		elseif resourceType == "RESOURCE_CORAL" then	-- MOD.Barathor: New
			self.coral_ID = resourceID;
		elseif resourceType == "RESOURCE_LAPIS" then	-- MOD.Barathor: New
			self.lapis_ID = resourceID;
		elseif self:IsEvenMoreResourcesActive() == true then
		-- Even More Resources for Vox Populi (luxuries)
			if resourceType == "RESOURCE_LAVENDER" then	-- MOD.HungryForFood: New
				self.lavender_ID = resourceID;
			elseif resourceType == "RESOURCE_OBSIDIAN" then	-- MOD.HungryForFood: New
				self.obsidian_ID = resourceID;
			elseif resourceType == "RESOURCE_PLATINUM" then	-- MOD.HungryForFood: New
				self.platinum_ID = resourceID;
			elseif resourceType == "RESOURCE_POPPY" then	-- MOD.HungryForFood: New
				self.poppy_ID = resourceID;
			elseif resourceType == "RESOURCE_TIN" then		-- MOD.HungryForFood: New
				self.tin_ID = resourceID;
			-- Even More Resources for Vox Populi (bonus)
			elseif resourceType == "RESOURCE_COCONUT" then	-- MOD.HungryForFood: New
				self.coconut_ID = resourceID;
			elseif resourceType == "RESOURCE_HARDWOOD" then	-- MOD.HungryForFood: New
				self.hardwood_ID = resourceID;
			elseif resourceType == "RESOURCE_LEAD" then		-- MOD.HungryForFood: New
				self.lead_ID = resourceID;
			elseif resourceType == "RESOURCE_MAIZE" then	-- MOD.HungryForFood: New
				self.maize_ID = resourceID;
			elseif resourceType == "RESOURCE_PINEAPPLE" then	-- MOD.HungryForFood: New
				self.pineapple_ID = resourceID;
			elseif resourceType == "RESOURCE_POTATO" then	-- MOD.HungryForFood: New
				self.potato_ID = resourceID;
			elseif resourceType == "RESOURCE_RICE" then	-- MOD.HungryForFood: New
				self.rice_ID = resourceID;
			elseif resourceType == "RESOURCE_RUBBER" then	-- MOD.HungryForFood: New
				self.rubber_ID = resourceID;
			elseif resourceType == "RESOURCE_SULFUR" then	-- MOD.HungryForFood: New
				self.sulfur_ID = resourceID;
			elseif resourceType == "RESOURCE_TITANIUM" then	-- MOD.HungryForFood: New
				self.titanium_ID = resourceID;
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:__InitLuxuryWeights()
	-- Initialize luxury data table. Index == Region Type
	-- Customize this function if the terrain will fall significantly
	-- outside Earth normal, or if region definitions have been modified.
	
	-- Note: The water-based luxuries are set to appear in a region only if that region has its start on the coast.
	-- So the weights shown for those are reduced in practice to the degree that a map has inland starts.
	
	-- MOD.Barathor: All region weights below have been updated.
	-- MOD.Barathor: Start
	self.luxury_region_weights[1] = {			-- Tundra
	{self.fur_ID,		40},
	{self.silver_ID,	40},
	{self.amber_ID,		40},
	{self.salt_ID,		40},
	{self.gold_ID,		10},
	{self.copper_ID,	10},
	{self.gems_ID,		10},
	{self.jade_ID,		10},
	{self.lapis_ID,		10},
	{self.whale_ID,		10},
	{self.crab_ID,		10},
	{self.pearls_ID,	10},
	{self.coral_ID,		10},	};
	
	-- MOD.HungryForFood: Start
	if self:IsEvenMoreResourcesActive() == true then
		table.insert(self.luxury_region_weights[1], {self.obsidian_ID,	10});
		table.insert(self.luxury_region_weights[1], {self.platinum_ID,	10});
		table.insert(self.luxury_region_weights[1], {self.tin_ID,		10});
	end
	-- MOD.HungryForFood: End

	-- Added for snow bias
	self.luxury_region_weights[10] = self.luxury_region_weights[1];

	self.luxury_region_weights[2] = {			-- Jungle
	{self.citrus_ID,	40},
	{self.cocoa_ID,		40},
	{self.spices_ID,	40},
	{self.sugar_ID,		40},
	{self.truffles_ID,	10},
	{self.silk_ID,		10},
	{self.dye_ID,		10},
	{self.fur_ID,		10},
	{self.whale_ID,		10},
	{self.crab_ID,		10},
	{self.pearls_ID,	10},
	{self.coral_ID,		10},	};

	-- MOD.HungryForFood: Start
	if self:IsEvenMoreResourcesActive() == true then
		table.insert(self.luxury_region_weights[2], {self.obsidian_ID,	40});
		table.insert(self.luxury_region_weights[2], {self.poppy_ID,		40});
		table.insert(self.luxury_region_weights[2], {self.platinum_ID,	10});
		table.insert(self.luxury_region_weights[2], {self.tin_ID,		10});
	end
	-- MOD.HungryForFood: End

	self.luxury_region_weights[3] = {			-- Forest
	{self.truffles_ID,	40},
	{self.silk_ID,		40},
	{self.dye_ID,		40},
	{self.fur_ID,		40},
	{self.citrus_ID,	10},
	{self.cocoa_ID,		10},
	{self.spices_ID,	10},
	{self.sugar_ID,		10},
	{self.whale_ID,		10},
	{self.crab_ID,		10},
	{self.pearls_ID,	10},
	{self.coral_ID,		10},	};

	-- MOD.HungryForFood: Start
	if self:IsEvenMoreResourcesActive() == true then
		table.insert(self.luxury_region_weights[3], {self.lavender_ID,	10});
	end
	-- MOD.HungryForFood: End

	self.luxury_region_weights[4] = {			-- Desert
	{self.incense_ID,	40},
	{self.salt_ID,		40},
	{self.gold_ID,		40},
	{self.lapis_ID,		40},
	{self.copper_ID,	10},
	{self.silver_ID,	10},
	{self.amber_ID,		10},
	{self.gems_ID,		10},
	{self.jade_ID,		10},
	{self.whale_ID,		10},
	{self.crab_ID,		10},
	{self.pearls_ID,	10},
	{self.coral_ID,		10},	};

	-- MOD.HungryForFood: Start
	if self:IsEvenMoreResourcesActive() == true then
		table.insert(self.luxury_region_weights[4], {self.obsidian_ID,	10});
		table.insert(self.luxury_region_weights[4], {self.platinum_ID,	10});
		table.insert(self.luxury_region_weights[4], {self.tin_ID,		10});
	end
	-- MOD.HungryForFood: End
	
	self.luxury_region_weights[5] = {			-- Hills
	{self.gold_ID,		30},
	{self.silver_ID,	30},
	{self.copper_ID,	30},
	{self.gems_ID,		30},
	{self.salt_ID,		30},
	{self.jade_ID,		30},
	{self.amber_ID,		30},
	{self.lapis_ID,		30},
	{self.whale_ID,		10},
	{self.crab_ID,		10},
	{self.pearls_ID,	10},
	{self.coral_ID,		10},	};

	-- MOD.HungryForFood: Start
	if self:IsEvenMoreResourcesActive() == true then
		table.insert(self.luxury_region_weights[5], {self.obsidian_ID,	30});
		table.insert(self.luxury_region_weights[5], {self.poppy_ID,		30});
		table.insert(self.luxury_region_weights[5], {self.platinum_ID,	30});
		table.insert(self.luxury_region_weights[5], {self.tin_ID,		30});
	end
	-- MOD.HungryForFood: End

	-- Added for mountain bias
	self.luxury_region_weights[9] = self.luxury_region_weights[5];

	
	self.luxury_region_weights[6] = {			-- Plains
	{self.incense_ID,	40},
	{self.ivory_ID,		40},
	{self.wine_ID,		40},
	{self.olives_ID,	40},
	{self.coffee_ID,	40},
	{self.tobacco_ID,	10},
	{self.tea_ID,		10},
	{self.perfume_ID,	10},
	{self.cotton_ID,	10},
	{self.whale_ID,		10},
	{self.crab_ID,		10},
	{self.pearls_ID,	10},
	{self.coral_ID,		10},	};

	-- MOD.HungryForFood: Start
	if self:IsEvenMoreResourcesActive() == true then
		table.insert(self.luxury_region_weights[6], {self.lavender_ID,	40});
		table.insert(self.luxury_region_weights[6], {self.poppy_ID,		40});
	end
	-- MOD.HungryForFood: End
	
	self.luxury_region_weights[7] = {			-- Grass
	{self.tobacco_ID,	40},
	{self.tea_ID,		40},
	{self.perfume_ID,	40},
	{self.cotton_ID,	40},
	{self.ivory_ID,		10},
	{self.wine_ID,		10},
	{self.olives_ID,	10},
	{self.coffee_ID,	10},
	{self.whale_ID,		10},
	{self.crab_ID,		10},
	{self.pearls_ID,	10},
	{self.coral_ID,		10},	};

	-- MOD.HungryForFood: Start
	if self:IsEvenMoreResourcesActive() == true then
		table.insert(self.luxury_region_weights[7], {self.lavender_ID,	40});
		table.insert(self.luxury_region_weights[7], {self.poppy_ID,		40});
	end
	-- MOD.HungryForFood: End
	
	self.luxury_region_weights[8] = {			-- Hybrid
	{self.gold_ID,		30},
	{self.silver_ID,	30},					-- MOD.Barathor: Favor very flexible resources, like resources that are mined or in the water.
	{self.copper_ID,	30},
	{self.gems_ID,		30},
	{self.salt_ID,		30},
	{self.jade_ID,		30},
	{self.amber_ID,		30},
	{self.lapis_ID,		30},
	{self.coffee_ID,	05},
	{self.tobacco_ID,	05},
	{self.tea_ID,		05},
	{self.perfume_ID,	05},
	{self.cotton_ID,	05},
	{self.ivory_ID,		05},
	{self.wine_ID,		05},
	{self.olives_ID,	05},
	{self.incense_ID,	05},
	{self.truffles_ID,	05},
	{self.silk_ID,		05},
	{self.dye_ID,		05},
	{self.fur_ID,		05},
	{self.citrus_ID,	05},
	{self.cocoa_ID,		05},
	{self.spices_ID,	05},
	{self.sugar_ID,		05},
	{self.whale_ID,		20},
	{self.crab_ID,		20},
	{self.pearls_ID,	20},
	{self.coral_ID,		20},	};

	-- MOD.HungryForFood: Start
	if self:IsEvenMoreResourcesActive() == true then
		table.insert(self.luxury_region_weights[8], {self.obsidian_ID,	30});
		table.insert(self.luxury_region_weights[8], {self.platinum_ID,	30});
		table.insert(self.luxury_region_weights[8], {self.tin_ID,		30});
		table.insert(self.luxury_region_weights[8], {self.lavender_ID,	05});
		table.insert(self.luxury_region_weights[8], {self.poppy_ID,		05});
	end
	-- MOD.HungryForFood: End
	
	self.luxury_fallback_weights = {			-- Random / Fallback
	{self.gold_ID,		10},
	{self.silver_ID,	10},					-- MOD.Barathor: Favor water resources since they work great as randoms and make the coasts more interesting. 
	{self.copper_ID,	10},					--				 Also, slightly favor mined resources for their flexibility.
	{self.gems_ID,		10},
	{self.salt_ID,		10},
	{self.jade_ID,		10},
	{self.amber_ID,		10},
	{self.lapis_ID,		10},
	{self.coffee_ID,	05},
	{self.tobacco_ID,	05},
	{self.tea_ID,		05},
	{self.perfume_ID,	05},
	{self.cotton_ID,	05},
	{self.ivory_ID,		05},
	{self.wine_ID,		05},
	{self.olives_ID,	05},
	{self.incense_ID,	05},
	{self.truffles_ID,	05},
	{self.silk_ID,		05},
	{self.dye_ID,		05},
	{self.fur_ID,		05},
	{self.citrus_ID,	05},
	{self.cocoa_ID,		05},
	{self.spices_ID,	05},
	{self.sugar_ID,		05},
	{self.whale_ID,		30},
	{self.crab_ID,		30},
	{self.pearls_ID,	30},
	{self.coral_ID,		30},	};

	-- MOD.HungryForFood: Start
	if self:IsEvenMoreResourcesActive() == true then
		table.insert(self.luxury_fallback_weights, {self.obsidian_ID,	30});
		table.insert(self.luxury_fallback_weights, {self.platinum_ID,	30});
		table.insert(self.luxury_fallback_weights, {self.tin_ID,		30});
		table.insert(self.luxury_fallback_weights, {self.lavender_ID,	05});
		table.insert(self.luxury_fallback_weights, {self.poppy_ID,		05});
	end
	-- MOD.HungryForFood: End

	self.luxury_city_state_weights = {			-- City States	
	{self.gold_ID,		10},
	{self.silver_ID,	10},					-- MOD.Barathor: Slightly favor water resources since they're flexible and most city-states are coastal.
	{self.copper_ID,	10},					--				 Also, slightly favor mined resources for their flexibility.
	{self.gems_ID,		10},
	{self.salt_ID,		10},
	{self.jade_ID,		10},
	{self.amber_ID,		10},
	{self.lapis_ID,		10},
	{self.coffee_ID,	05},
	{self.tobacco_ID,	05},
	{self.tea_ID,		05},
	{self.perfume_ID,	05},
	{self.cotton_ID,	05},
	{self.ivory_ID,		05},
	{self.wine_ID,		05},
	{self.olives_ID,	05},
	{self.incense_ID,	05},
	{self.truffles_ID,	05},
	{self.silk_ID,		05},
	{self.dye_ID,		05},
	{self.fur_ID,		05},
	{self.citrus_ID,	05},
	{self.cocoa_ID,		05},
	{self.spices_ID,	05},
	{self.sugar_ID,		05},
	{self.whale_ID,		10},
	{self.crab_ID,		10},
	{self.pearls_ID,	10},
	{self.coral_ID,		10},	};

	-- MOD.HungryForFood: Start
	if self:IsEvenMoreResourcesActive() == true then
		table.insert(self.luxury_city_state_weights, {self.obsidian_ID,	10});
		table.insert(self.luxury_city_state_weights, {self.platinum_ID,	10});
		table.insert(self.luxury_city_state_weights, {self.tin_ID,		10});
		table.insert(self.luxury_city_state_weights, {self.lavender_ID,	05});
		table.insert(self.luxury_city_state_weights, {self.poppy_ID,	05});
	end
	-- MOD.HungryForFood: End
	-- MOD.Barathor: End

end	
------------------------------------------------------------------------------
function AssignStartingPlots:__CustomInit()
	-- This function included to provide a quick and easy override for changing 
	-- any initial settings. Add your customized version to the map script.
end	
------------------------------------------------------------------------------
function AssignStartingPlots:ApplyHexAdjustment(x, y, plot_adjustments)
	-- Used this bit of code so many times, I had to make it a function.
	local iW, iH = Map.GetGridSize();
	local adjusted_x, adjusted_y;
	if Map:IsWrapX() == true then
		adjusted_x = (x + plot_adjustments[1]) % iW;
	else
		adjusted_x = x + plot_adjustments[1];
	end
	if Map:IsWrapY() == true then
		adjusted_y = (y + plot_adjustments[2]) % iH;
	else
		adjusted_y = y + plot_adjustments[2];
	end
	return adjusted_x, adjusted_y;
end
------------------------------------------------------------------------------
-- Start of functions tied to GenerateRegions()
------------------------------------------------------------------------------
function AssignStartingPlots:MeasureStartPlacementFertilityOfPlot(x, y, checkForCoastalLand)
	-- Fertility of plots is used to divide continents or areas in to Regions.
	-- Regions are used to assign starting plots and place some resources.
	-- Usage: x, y are plot coords, with 0,0 in SW. The check is a boolean.
	--
	--[[ Mountain, Oasis, FloodPlain tiles = -2, 5, 6 and do not count anything else.
	     Rest of the tiles add up values of tile traits.
	     Terrain: Grass 4, Plains 3, Tundra 2, Coast 2, Desert 1, Snow -1
	     Features: Hill 1, Forest 1, FreshWater 1, River 1, Jungle -1, Marsh -1, Ice -1
	     We want players who start in Grass to have the least room to expand. ]]--
	--[[ If you modify the terrain values or add or remove any terrain elements, you
		 will need to add or modify processes here to accomodate your changes. Please 
		 be aware that the default process includes numerous assumptions that your
		 terrain changes may invalidate, so you may need to rebalance the system. ]]--
	--
	local plot = Map.GetPlot(x, y);
	local plotFertility = 0;
	local plotType = plot:GetPlotType();
	local terrainType = plot:GetTerrainType();
	local featureType = plot:GetFeatureType();
	-- Measure Fertility -- Any cases absent from the process have a 0 value.
	if plotType == PlotTypes.PLOT_MOUNTAIN then -- Note, mountains cannot belong to a landmass AreaID, so they usually go unmeasured.
		plotFertility = -2;
	elseif terrainType == TerrainTypes.TERRAIN_SNOW then
		plotFertility = -1;
	elseif featureType == FeatureTypes.FEATURE_OASIS then
		plotFertility = 4; -- Reducing Oasis value slightly. -1/26/2011 BT
	elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then
		plotFertility = 5; -- Reducing Flood Plains value slightly. -1/26/2011 BT
	else
		if terrainType == TerrainTypes.TERRAIN_GRASS then -- Reversing values for Grass and Plains. -1/26/2011 BT
			plotFertility = 3;
		elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
			plotFertility = 4;
		elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
			plotFertility = 2;
		elseif terrainType == TerrainTypes.TERRAIN_COAST then
			plotFertility = 2;
		elseif terrainType == TerrainTypes.TERRAIN_DESERT then
			plotFertility = 1;
		end
		if plotType == PlotTypes.PLOT_HILLS then
			plotFertility = plotFertility + 1;
		end
		if featureType == FeatureTypes.FEATURE_FOREST then
			plotFertility = plotFertility + 0; -- Removing forest bonus as a balance tweak. -1/26/2011 BT
		elseif featureType == FeatureTypes.FEATURE_JUNGLE then
			plotFertility = plotFertility - 1;
		elseif featureType == FeatureTypes.FEATURE_MARSH then
			plotFertility = plotFertility - 2; -- Increasing penalty for Marsh plots. -1/26/2011 BT
		elseif featureType == FeatureTypes.FEATURE_ICE then
			plotFertility = plotFertility - 1;
		end
		if plot:IsRiverSide() then
			plotFertility = plotFertility + 1;
		end
		if plot:IsFreshWater() then
			plotFertility = plotFertility + 1;
		end
		if checkForCoastalLand == true then -- When measuring only one AreaID, this shortcut helps account for coastal plots not measured.
			if plot:IsCoastalLand() then
				plotFertility = plotFertility + 2;
			end
		end
	end

	return plotFertility
end
------------------------------------------------------------------------------
function AssignStartingPlots:MeasureStartPlacementFertilityInRectangle(iWestX, iSouthY, iWidth, iHeight)
	-- This function is designed to provide initial data for regional division recursion.
	-- Loop through plots in this rectangle and measure Fertility Rating.
	-- Results will include a data table of all measured plots.
	local areaFertilityTable = {};
	local areaFertilityCount = 0;
	local plotCount = iWidth * iHeight;
	for y = iSouthY, iSouthY + iHeight - 1 do -- When generating a plot data table incrementally, process Y first so that plots go row by row.
		for x = iWestX, iWestX + iWidth - 1 do
			local plotFertility = self:MeasureStartPlacementFertilityOfPlot(x, y, false); -- Check for coastal land is disabled.
			table.insert(areaFertilityTable, plotFertility);
			areaFertilityCount = areaFertilityCount + plotFertility;
		end
	end

	-- Returns table, integer, integer.
	return areaFertilityTable, areaFertilityCount, plotCount
end
------------------------------------------------------------------------------
function AssignStartingPlots:MeasureStartPlacementFertilityOfLandmass(iAreaID, iWestX, iEastX, iSouthY, iNorthY, wrapsX, wrapsY)
	-- This function is designed to provide initial data for regional division recursion.
	-- Loop through plots in this landmass and measure Fertility Rating.
	-- Results will include a data table of all plots within the rectangle that includes the entirety of this landmass.
	--
	-- This function will account for any wrapping around the world this landmass may do.
	local iW, iH = Map.GetGridSize()
	local xEnd, yEnd; --[[ These coordinates will be used in case of wrapping landmass, 
	                       extending the landmass "off the map", in to imaginary space 
	                       to process it. Modulo math will correct the coordinates for 
	                       accessing the plot data array. ]]--
	if wrapsX then
		xEnd = iEastX + iW;
	else
		xEnd = iEastX;
	end
	if wrapsY then
		yEnd = iNorthY + iH;
	else
		yEnd = iNorthY;
	end
	--
	local areaFertilityTable = {};
	local areaFertilityCount = 0;
	local plotCount = 0;
	for yLoop = iSouthY, yEnd do -- When generating a plot data table incrementally, process Y first so that plots go row by row.
		for xLoop = iWestX, xEnd do
			plotCount = plotCount + 1;
			local x = xLoop % iW;
			local y = yLoop % iH;
			local plot = Map.GetPlot(x, y);
			local thisPlotsArea = plot:GetArea()
			if thisPlotsArea ~= iAreaID then -- This plot is not a member of the landmass, set value to 0
				table.insert(areaFertilityTable, 0);
			else -- This plot is a member, process it.
				local plotFertility = self:MeasureStartPlacementFertilityOfPlot(x, y, true); -- Check for coastal land is enabled.
				table.insert(areaFertilityTable, plotFertility);
				areaFertilityCount = areaFertilityCount + plotFertility;
			end
		end
	end
	
	-- Note: The table accounts for world wrap, so make sure to translate its index correctly.
	-- Plots in the table run from the southwest corner along the bottom row, then upward row by row, per normal plot data indexing.
	return areaFertilityTable, areaFertilityCount, plotCount
end
------------------------------------------------------------------------------
function AssignStartingPlots:RemoveDeadRows(fertility_table, iWestX, iSouthY, iWidth, iHeight)
	-- Any outside rows in the fertility table of a just-divided region that 
	-- contains all zeroes can be safely removed.
	-- This will improve the accuracy of operations involving any applicable region.
	local iW, iH = Map.GetGridSize()
	local adjusted_table = {};
	local adjusted_WestX;
	local adjusted_SouthY
	local adjusted_Width
	local adjusted_Height;
	
	-- Check for rows to remove on the bottom.
	local adjustSouth = 0;
	for y = 0, iHeight - 1 do
		local bKeepThisRow = false;
		for x = 0, iWidth - 1 do
			local i = y * iWidth + x + 1;
			if fertility_table[i] ~= 0 then
				bKeepThisRow = true;
				break
			end
		end
		if bKeepThisRow == true then
			break
		else
			adjustSouth = adjustSouth + 1;
		end
	end

	-- Check for rows to remove on the top.
	local adjustNorth = 0;
	for y = iHeight - 1, 0, -1 do
		local bKeepThisRow = false;
		for x = 0, iWidth - 1 do
			local i = y * iWidth + x + 1;
			if fertility_table[i] ~= 0 then
				bKeepThisRow = true;
				break
			end
		end
		if bKeepThisRow == true then
			break
		else
			adjustNorth = adjustNorth + 1;
		end
	end

	-- Check for columns to remove on the left.
	local adjustWest = 0;
	for x = 0, iWidth - 1 do
		local bKeepThisColumn = false;
		for y = 0, iHeight - 1 do
			local i = y * iWidth + x + 1;
			if fertility_table[i] ~= 0 then
				bKeepThisColumn = true;
				break
			end
		end
		if bKeepThisColumn == true then
			break
		else
			adjustWest = adjustWest + 1;
		end
	end

	-- Check for columns to remove on the right.
	local adjustEast = 0;
	for x = iWidth - 1, 0, -1 do
		local bKeepThisColumn = false;
		for y = 0, iHeight - 1 do
			local i = y * iWidth + x + 1;
			if fertility_table[i] ~= 0 then
				bKeepThisColumn = true;
				break
			end
		end
		if bKeepThisColumn == true then
			break
		else
			adjustEast = adjustEast + 1;
		end
	end

	if adjustSouth > 0 or adjustNorth > 0 or adjustWest > 0 or adjustEast > 0 then
		-- Truncate this region to remove dead rows.
		adjusted_WestX = (iWestX + adjustWest) % iW;
		adjusted_SouthY = (iSouthY + adjustSouth) % iH;
		adjusted_Width = (iWidth - adjustWest) - adjustEast;
		adjusted_Height = (iHeight - adjustSouth) - adjustNorth;
		-- Reconstruct fertility table. This must be done row by row, so process Y coord first.
		for y = 0, adjusted_Height - 1 do
			for x = 0, adjusted_Width - 1 do
				local i = (y + adjustSouth) * iWidth + (x + adjustWest) + 1;
				local plotFert = fertility_table[i];
				table.insert(adjusted_table, plotFert);
			end
		end
		--
		--print("-");
		--print("Removed Dead Rows, West: ", adjustWest, " East: ", adjustEast);
		--print("Removed Dead Rows, South: ", adjustSouth, " North: ", adjustNorth);
		--print("-");
		--print("Incoming values: ", iWestX, iSouthY, iWidth, iHeight);
		--print("Outgoing values: ", adjusted_WestX, adjusted_SouthY, adjusted_Width, adjusted_Height);
		--print("-");
		local incoming_index = table.maxn(fertility_table);
		local outgoing_index = table.maxn(adjusted_table);
		--print("Size of incoming fertility table: ", incoming_index);
		--print("Size of outgoing fertility table: ", outgoing_index);
		--
		return adjusted_table, adjusted_WestX, adjusted_SouthY, adjusted_Width, adjusted_Height;
	
	else -- Region not adjusted, return original values unaltered.
		return fertility_table, iWestX, iSouthY, iWidth, iHeight;
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:DivideIntoRegions(iNumDivisions, fertility_table, rectangle_data_table)
	-- This is a recursive algorithm. (Original concept and implementation by Ed Beach).
	--
	-- Fertility table is a plot data array including data for all plots to be processed here.
	-- The fertility table is obtained as part of the MeasureFertility functions, or via division during the recursion.
	--
	-- Rectangle table includes seven data fields:
	-- westX, southY, width, height, AreaID, fertilityCount, plotCount
	--
	-- If AreaID is -1, it means the rectangle contains fertility data from all plots regardless of their AreaIDs.
	-- The plotCount is an absolute count of plots within the rectangle, without regard to AreaID membership.
	-- This is going to purposely reduce average fertility per plot for Order-of-Assignment priority.
	-- Rectangles with a lot of non-member plots will tend to be misshapen and need to be on the favorable side of minDistance elements.
	-- print("-"); print("DivideIntoRegions called.");

	--[[ Log dump of incoming table data. Activate for debug only.
	print("Data tables passed to DivideIntoRegions.");
	PrintContentsOfTable(fertility_table)
	PrintContentsOfTable(rectangle_data_table)
	print("End of this instance, DivideIntoRegions tables.");
	]]--
	
	local iNumDivides = 0;
	local iSubdivisions = 0;
	local bPrimeGreaterThanThree = false;
	local firstSubdivisions = 0;
	local laterSubdivisions = 0;

	-- If this rectangle is not to be divided, break recursion and record the data.
	if (iNumDivisions == 1) then -- This area is to be defined as a Region.
		-- Expand rectangle table to include an eighth field for average fertility per plot.
		local fAverageFertility = rectangle_data_table[6] / rectangle_data_table[7]; -- fertilityCount/plotCount
		table.insert(rectangle_data_table, fAverageFertility);
		-- Insert this record in to the instance data for start placement regions for this game.
		-- (This is the crux of the entire regional definition process, determining an actual region.)
		table.insert(self.regionData, rectangle_data_table);
		--
		local iNumberOfThisRegion = table.maxn(self.regionData);
		--print("-");
		--print("---------------------------------------------");
		--print("Defined location of Start Region #", iNumberOfThisRegion);
		--print("---------------------------------------------");
		--print("-");
		--
		return

	--[[ Divide this rectangle into iNumDivisions worth of subdivisions, then send each
	     subdivision back through this function in a recursive loop. ]]--
	elseif (iNumDivisions > 1) then
		-- See if region is taller or wider.
		local iWidth = rectangle_data_table[3];
		local iHeight = rectangle_data_table[4];
		local bTaller = false;
		if iHeight > iWidth then
			bTaller = true;
		end

		-- If the number of divisions is 2 or 3, no further subdivision is required.
		if (iNumDivisions == 2) then
			iNumDivides = 2;
			iSubdivisions = 1;
		elseif (iNumDivisions == 3) then
			iNumDivides = 3;
			iSubdivisions = 1;
		
		-- If the number of divisions is greater than 3 and a prime number,
		-- divide all of these cases in to an odd plus an even number, then subdivide.
		--
		--[[ Ed's original algorithm skipped this step and produced "extra" divisions,
		     which I would have had to account for. I decided it was far far easier to
		     improve the algorithm and remove all extra divisions than it was to have
		     to write large chunks of code trying to process empty regions. Not to 
		     mention the added precision of using all land on the continent or map to
		     determine where to place major civilizations.  - Bob Thomas, April 2010 ]]--
		elseif (iNumDivisions == 5) then
			bPrimeGreaterThanThree = true;
			chopPercent = 59.2; -- These chopPercents are all set to undershoot slightly, averaging out the actual result closer to target.
			firstSubdivisions = 3; -- This is because if you aim for the exact target, there is never undershoot and almost always overshoot.
			laterSubdivisions = 2; -- So a well calibrated target ends up compensating for that overshoot factor, to improve total fairness.
		elseif (iNumDivisions == 7) then
			bPrimeGreaterThanThree = true;
			chopPercent = 42.2;
			firstSubdivisions = 3;
			laterSubdivisions = 4;
		elseif (iNumDivisions == 11) then
			bPrimeGreaterThanThree = true;
			chopPercent = 27;
			firstSubdivisions = 3;
			laterSubdivisions = 8;
		elseif (iNumDivisions == 13) then
			bPrimeGreaterThanThree = true;
			chopPercent = 38.1;
			firstSubdivisions = 5;
			laterSubdivisions = 8;
		elseif (iNumDivisions == 17) then
			bPrimeGreaterThanThree = true;
			chopPercent = 52.8;
			firstSubdivisions = 9;
			laterSubdivisions = 8;
		elseif (iNumDivisions == 19) then
			bPrimeGreaterThanThree = true;
			chopPercent = 36.7;
			firstSubdivisions = 7;
			laterSubdivisions = 12;

		-- If the number of divisions is greater than 3 and not a prime number,
		-- then chop this rectangle in to 2 or 3 parts and subdivide those.
		elseif (iNumDivisions == 4) then
			iNumDivides = 2;
			iSubdivisions = 2;
		elseif (iNumDivisions == 6) then
			iNumDivides = 3;
			iSubdivisions = 2;
		elseif (iNumDivisions == 8) then
			iNumDivides = 2;
			iSubdivisions = 4;
		elseif (iNumDivisions == 9) then
			iNumDivides = 3;
			iSubdivisions = 3;
		elseif (iNumDivisions == 10) then
			iNumDivides = 2;
			iSubdivisions = 5;
		elseif (iNumDivisions == 12) then
			iNumDivides = 3;
			iSubdivisions = 4;
		elseif (iNumDivisions == 14) then
			iNumDivides = 2;
			iSubdivisions = 7;
		elseif (iNumDivisions == 15) then
			iNumDivides = 3;
			iSubdivisions = 5;
		elseif (iNumDivisions == 16) then
			iNumDivides = 2;
			iSubdivisions = 8;
		elseif (iNumDivisions == 18) then
			iNumDivides = 3;
			iSubdivisions = 6;
		elseif (iNumDivisions == 20) then
			iNumDivides = 2;
			iSubdivisions = 10;
		elseif (iNumDivisions == 21) then
			iNumDivides = 3;
			iSubdivisions = 7;
		elseif (iNumDivisions == 22) then
			iNumDivides = 2;
			iSubdivisions = 11;
		else
			--print("Erroneous number of regional divisions : ", iNumDivisions);
		end

		-- Now process the division via one of the three methods.
		-- All methods involve recursion, to obtain the best manner of subdividing each rectangle involved.
		if bPrimeGreaterThanThree then
			--print("DivideIntoRegions: Uneven Division for handling prime numbers selected.");
			local results = self:ChopIntoTwoRegions(fertility_table, rectangle_data_table, bTaller, chopPercent);
			local first_section_fertility_table = results[1];
			local first_section_data_table = results[2];
			local second_section_fertility_table = results[3];
			local second_section_data_table = results[4];
			--
			self:DivideIntoRegions(firstSubdivisions, first_section_fertility_table, first_section_data_table)
			self:DivideIntoRegions(laterSubdivisions, second_section_fertility_table, second_section_data_table)

		else
			if (iNumDivides == 2) then
				--print("DivideIntoRegions: Divide in to Halves selected.");
				local results = self:ChopIntoTwoRegions(fertility_table, rectangle_data_table, bTaller, 49.5); -- Undershoot by design, to compensate for inevitable overshoot. Gets the actual result closer to target.
				local first_section_fertility_table = results[1];
				local first_section_data_table = results[2];
				local second_section_fertility_table = results[3];
				local second_section_data_table = results[4];
				--
				self:DivideIntoRegions(iSubdivisions, first_section_fertility_table, first_section_data_table)
				self:DivideIntoRegions(iSubdivisions, second_section_fertility_table, second_section_data_table)

			elseif (iNumDivides == 3) then
				--print("DivideIntoRegions: Divide in to Thirds selected.");
				local results = self:ChopIntoThreeRegions(fertility_table, rectangle_data_table, bTaller);
				local first_section_fertility_table = results[1];
				local first_section_data_table = results[2];
				local second_section_fertility_table = results[3];
				local second_section_data_table = results[4];
				local third_section_fertility_table = results[5];
				local third_section_data_table = results[6];
				--
				self:DivideIntoRegions(iSubdivisions, first_section_fertility_table, first_section_data_table)
				self:DivideIntoRegions(iSubdivisions, second_section_fertility_table, second_section_data_table)
				self:DivideIntoRegions(iSubdivisions, third_section_fertility_table, third_section_data_table)

			else
				--print("Invalid iNumDivides value (from DivideIntoRegions): must be 2 or 3.");
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:ChopIntoThreeRegions(fertility_table, rectangle_data_table, bTaller, chopPercent)
	--print("-"); print("ChopIntoThree called.");
	-- Performs the mechanics of dividing a region into three roughly equal fertility subregions.
	local results = {};

	-- Chop off the first third.
	local initial_results = self:ChopIntoTwoRegions(fertility_table, rectangle_data_table, bTaller, 33); -- Undershoot by a bit, tends to make the actual result closer to accurate.
	-- add first subdivision to results
	local temptable = initial_results[1];
	table.insert(results, temptable); 

	--[[ Activate table printouts for debug purposes only, then deactivate when done. ]]--
	--print("Data returned to ChopIntoThree from ChopIntoTwo.");
	--PrintContentsOfTable(temptable)

	local temptable = initial_results[2];
	table.insert(results, temptable);

	--PrintContentsOfTable(temptable)

	-- Prepare the remainder for further processing.
	local second_section_fertility_table = initial_results[3]; 

	--PrintContentsOfTable(second_section_fertility_table)

	local second_section_data_table = initial_results[4];

	--PrintContentsOfTable(second_section_data_table)
	--print("End of this instance, ChopIntoThree tables.");

	-- See if this piece is taller or wider. (Ed's original implementation skipped this step).
	local bTallerForRemainder = false;
	local width = second_section_data_table[3];
	local height = second_section_data_table[4];
	if height > width then
		bTallerForRemainder = true;
	end

	-- Chop the bigger piece in half.		
	local interim_results = self:ChopIntoTwoRegions(second_section_fertility_table, second_section_data_table, bTallerForRemainder, 48.5); -- Undershoot just a little.
	table.insert(results, interim_results[1]); 
	table.insert(results, interim_results[2]); 
	table.insert(results, interim_results[3]); 
	table.insert(results, interim_results[4]); 

	--[[ Returns a table of six entries, each of which is a nested table.
	1: fertility_table of first subdivision
	2: rectangle_data_table of first subdivision.
	3: fertility_table of second subdivision
	4: rectangle_data_table of second subdivision.
	5: fertility_table of third subdivision
	6: rectangle_data_table of third subdivision.  ]]--
	return results
end
------------------------------------------------------------------------------
function AssignStartingPlots:ChopIntoTwoRegions(fertility_table, rectangle_data_table, bTaller, chopPercent)
	-- Performs the mechanics of dividing a region into two subregions.
	--
	-- Fertility table is a plot data array including data for all plots to be processed here.
	-- This data already factors any need for processing AreaID.
	--
	-- Rectangle table includes seven data fields:
	-- westX, southY, width, height, AreaID, fertilityCount, plotCount
	--print("-"); print("ChopIntoTwo called.");

	--[[ Log dump of incoming table data. Activate for debug only.
	print("Data tables passed to ChopIntoTwoRegions.");
	PrintContentsOfTable(fertility_table)
	PrintContentsOfTable(rectangle_data_table)
	print("End of this instance, ChopIntoTwoRegions tables.");
	]]--

	-- Read the incoming data table.
	local iW, iH = Map.GetGridSize()
	local iWestX = rectangle_data_table[1];
	local iSouthY = rectangle_data_table[2];
	local iRectWidth = rectangle_data_table[3];
	local iRectHeight = rectangle_data_table[4];
	local iAreaID = rectangle_data_table[5];
	local iTargetFertility = rectangle_data_table[6] * chopPercent / 100;
	
	-- Now divide the region.
	--
	-- West and South edges remain the same for first region.
	local firstRegionWestX = iWestX;
	local firstRegionSouthY = iSouthY;
	-- scope variables that get decided conditionally.
	local firstRegionWidth, firstRegionHeight;
	local secondRegionWestX, secondRegionSouthY, secondRegionWidth, secondRegionHeight;
	local iFirstRegionFertility = 0;
	local iSecondRegionFertility = 0;
	local region_one_fertility = {};
	local region_two_fertility = {};

	if (bTaller) then -- We will divide horizontally, resulting in first region on bottom, second on top.
		--
		-- Width for both will remain the same as the parent rectangle.
		firstRegionWidth = iRectWidth;
		secondRegionWestX = iWestX;
		secondRegionWidth = iRectWidth;

		-- Measure one row at a time, moving up from bottom, until we have exceeded the target fertility.
		local reachedTargetRow = false;
		local rectY = 0;
		while reachedTargetRow == false do
			-- Process the next row in line.
			for rectX = 0, iRectWidth - 1 do
				local fertIndex = rectY * iRectWidth + rectX + 1;
				local plotFertility = fertility_table[fertIndex];
				-- Add this plot's fertility to the region total so far.
				iFirstRegionFertility = iFirstRegionFertility + plotFertility;
				-- Record this plot in a new fertility table. (Needed for further subdivisions).
				-- Note, building this plot data table incrementally, so it must go row by row.
				table.insert(region_one_fertility, plotFertility);
			end
			if iFirstRegionFertility >= iTargetFertility then
				-- This row has completed the region.
				firstRegionHeight = rectY + 1;
				secondRegionSouthY = (iSouthY + rectY + 1) % iH;
				secondRegionHeight = iRectHeight - firstRegionHeight;
				reachedTargetRow = true;
				break
			else
				rectY = rectY + 1;
			end
		end
		
		-- Debug printout of division location.
		--print("Dividing along horizontal line between rows: ", secondRegionSouthY - 1, "-", secondRegionSouthY);
		
		-- Create the fertility table for the second region, the one on top.
		-- Data must be added row by row, to keep the table index behavior consistent.
		for rectY = firstRegionHeight, iRectHeight - 1 do
			for rectX = 0, iRectWidth - 1 do
				local fertIndex = rectY * iRectWidth + rectX + 1;
				local plotFertility = fertility_table[fertIndex];
				-- Add this plot's fertility to the region total so far.
				iSecondRegionFertility = iSecondRegionFertility + plotFertility;
				-- Record this plot in a new fertility table. (Needed for further subdivisions).
				-- Note, building this plot data table incrementally, so it must go row by row.
				table.insert(region_two_fertility, plotFertility);
			end
		end
				
	else -- We will divide vertically, resulting in first region on left, second on right.
		--
		-- Height for both will remain the same as the parent rectangle.
		firstRegionHeight = iRectHeight;
		secondRegionSouthY = iSouthY;
		secondRegionHeight = iRectHeight;
		
		--[[ First region's new fertility table will be a little tricky. We don't know how many 
		     table entries it will need beforehand, and we cannot add the entries sequentially
		     when the data is being generated column by column, yet the table index needs to 
		     proceed row by row. So we will have to make a second pass.  ]]--

		-- Measure one column at a time, moving left to right, until we have exceeded the target fertility.
		local reachedTargetColumn = false;
		local rectX = 0;
		while reachedTargetColumn == false do
			-- Process the next column in line.
			for rectY = 0, iRectHeight - 1 do
				local fertIndex = rectY * iRectWidth + rectX + 1;
				local plotFertility = fertility_table[fertIndex];
				-- Add this plot's fertility to the region total so far.
				iFirstRegionFertility = iFirstRegionFertility + plotFertility;
				-- No table record here, handle later row by row.
			end
			if iFirstRegionFertility >= iTargetFertility then
				-- This column has completed the region.
				firstRegionWidth = rectX + 1;
				secondRegionWestX = (iWestX + rectX + 1) % iW;
				secondRegionWidth = iRectWidth - firstRegionWidth;
				reachedTargetColumn = true;
				break
			else
				rectX = rectX + 1;
			end
		end

		-- Debug printout of division location.
		--print("Dividing along vertical line between columns: ", secondRegionWestX - 1, "-", secondRegionWestX);

		-- Create the fertility table for the second region, the one on the right.
		-- Data must be added row by row, to keep the table index behavior consistent.
		for rectY = 0, iRectHeight - 1 do
			for rectX = firstRegionWidth, iRectWidth - 1 do
				local fertIndex = rectY * iRectWidth + rectX + 1;
				local plotFertility = fertility_table[fertIndex];
				-- Add this plot's fertility to the region total so far.
				iSecondRegionFertility = iSecondRegionFertility + plotFertility;
				-- Record this plot in a new fertility table. (Needed for further subdivisions).
				-- Note, building this plot data table incrementally, so it must go row by row.
				table.insert(region_two_fertility, plotFertility);
			end
		end
		-- Now create the fertility table for the first region.
		for rectY = 0, iRectHeight - 1 do
			for rectX = 0, firstRegionWidth - 1 do
				local fertIndex = rectY * iRectWidth + rectX + 1;
				local plotFertility = fertility_table[fertIndex];
				table.insert(region_one_fertility, plotFertility);
			end
		end
	end
	
	-- Now check the newly divided regions for dead rows (all zero values) along
	-- the edges and remove any found.
	--
	-- First region
	local FRFertT, FRWX, FRSY, FRWid, FRHei;
	FRFertT, FRWX, FRSY, FRWid, FRHei = self:RemoveDeadRows(region_one_fertility,
		firstRegionWestX, firstRegionSouthY, firstRegionWidth, firstRegionHeight);
	--
	-- Second region
	local SRFertT, SRWX, SRSY, SRWid, SRHei;
	SRFertT, SRWX, SRSY, SRWid, SRHei = self:RemoveDeadRows(region_two_fertility,
		secondRegionWestX, secondRegionSouthY, secondRegionWidth, secondRegionHeight);
	--
	
	-- Generate the data tables that record the location of the new subdivisions.
	local firstPlots = FRWid * FRHei;
	local secondPlots = SRWid * SRHei;
	local region_one_data = {FRWX, FRSY, FRWid, FRHei, iAreaID, iFirstRegionFertility, firstPlots};
	local region_two_data = {SRWX, SRSY, SRWid, SRHei, iAreaID, iSecondRegionFertility, secondPlots};
	-- Generate the final data.
	local outcome = {FRFertT, region_one_data, SRFertT, region_two_data};
	return outcome
end
------------------------------------------------------------------------------
function AssignStartingPlots:CustomOverride()
	-- This function allows an easy entry point for overrides that need to 
	-- take place after regional division, but before anything else.
end
------------------------------------------------------------------------------
function AssignStartingPlots:GenerateRegions(args)
	print("Map Generation - Dividing the map in to Regions");
	-- This function stores its data in the instance (self) data table.
	--
	-- The "Three Methods" of regional division:
	-- 1. Biggest Landmass: All civs start on the biggest landmass.
	-- 2. Continental: Civs are assigned to continents. Any continents with more than one civ are divided.
	-- 3. Rectangular: Civs start within a given rectangle that spans the whole map, without regard to landmass sizes.
	--                 This method is primarily applied to Archipelago and other maps with lots of tiny islands.
	-- 4. Rectangular: Civs start within a given rectangle defined by arguments passed in on the function call.
	--                 Arguments required for this method: iWestX, iSouthY, iWidth, iHeight
	local args = args or {};
	local iW, iH = Map.GetGridSize();
	self.method = args.method or self.method; -- Continental method is default.
	self.resource_setting = args.resources or 2; -- UNUSED, use the below resource settings instead
	args.resources = args.resources or 2;
	
	-- Custom map resource settings (Communitu_79a support)
	if args.resources == 6 then
		args.resources = 1 + Map.Rand(3, "Resource setting - AssignStartingPlots");
	end
	
	if args.resources < 4 and not args.comm then
		self.resDensity = args.resources;						-- Strategic Resource Density setting
		self.resSize = args.resources;							-- Strategic Resource Deposit Size setting
		self.bonusDensity = args.resources;						-- Bonus Resource Density setting
		self.luxuryDensity = args.resources;					-- Luxury Resource Density setting
	elseif args.comm then
		self.resDensity = args.resources;						-- Strategic Resource Density setting
		self.resSize = args.size;								-- Strategic Resource Deposit Size setting
		self.bonusDensity = args.bonus;							-- Bonus Resource Density setting
		self.luxuryDensity = args.lux;							-- Luxury Resource Density setting
	end
	self.legStart = args.legend or (args.resources == 4);		-- Legendary Start setting
	self.resBalance = args.balance or (args.resources == 5);	-- Strategic Balance setting

	print("-"); print("Resource settings");
	print("Strategic Density = ", self.resDensity);
	print("Strategic Size = ", self.resSize);
	print("Bonus Density = ", self.bonusDensity);
	print("Luxury Density = ", self.luxuryDensity);
	print("Legendary Start = ", self.legStart);
	print("Strategic Balance = ", self.resBalance);

	-- Determine number of civilizations and city states present in this game.
	self.iNumCivs, self.iNumCityStates, self.player_ID_list, self.bTeamGame, self.teams_with_major_civs, self.number_civs_per_team = GetPlayerAndTeamInfo()
	self.iNumCityStatesUnassigned = self.iNumCityStates;
	--print("-"); print("Civs:", self.iNumCivs); print("City States:", self.iNumCityStates);

	if self.method == 1 then -- Biggest Landmass
		-- Identify the biggest landmass.
		local biggest_area = Map.FindBiggestArea(False);
		local iAreaID = biggest_area:GetID();
		-- We'll need all eight data fields returned in the results table from the boundary finder:
		local landmass_data = ObtainLandmassBoundaries(iAreaID);
		local iWestX = landmass_data[1];
		local iSouthY = landmass_data[2];
		local iEastX = landmass_data[3];
		local iNorthY = landmass_data[4];
		local iWidth = landmass_data[5];
		local iHeight = landmass_data[6];
		local wrapsX = landmass_data[7];
		local wrapsY = landmass_data[8];
		
		-- Obtain "Start Placement Fertility" of the landmass. (This measurement is customized for start placement).
		-- This call returns a table recording fertility of all plots within a rectangle that contains the landmass,
		-- with a zero value for any plots not part of the landmass -- plus a fertility sum and plot count.
		local fert_table, fertCount, plotCount = self:MeasureStartPlacementFertilityOfLandmass(iAreaID, 
												 iWestX, iEastX, iSouthY, iNorthY, wrapsX, wrapsY);
		-- Now divide this landmass in to regions, one per civ.
		-- The regional divider requires three arguments:
		-- 1. Number of divisions. (For "Biggest Landmass" this means number of civs in the game).
		-- 2. Fertility table. (This was obtained from the last call.)
		-- 3. Rectangle table. This table includes seven data fields:
		-- westX, southY, width, height, AreaID, fertilityCount, plotCount
		-- This is why we got the fertCount and plotCount from the fertility function.
		--
		-- Assemble the Rectangle data table:
		local rect_table = {iWestX, iSouthY, iWidth, iHeight, iAreaID, fertCount, plotCount};
		-- The data from this call is processed in to self.regionData during the process.
		self:DivideIntoRegions(self.iNumCivs, fert_table, rect_table)
		-- The regions have been defined.
	
	elseif self.method == 3 or self.method == 4 then -- Rectangular
		-- Obtain the boundaries of the rectangle to be processed.
		-- If no coords were passed via the args table, default to processing the entire map.
		-- Note that it matters if method 3 or 4 is designated, because the difference affects
		-- how city states are placed, whether they look for any uninhabited lands outside the rectangle.
		self.inhabited_WestX = args.iWestX or 0;
		self.inhabited_SouthY = args.iSouthY or 0;
		self.inhabited_Width = args.iWidth or iW;
		self.inhabited_Height = args.iHeight or iH;
		
		-- Obtain "Start Placement Fertility" inside the rectangle.
		-- Data returned is: fertility table, sum of all fertility, plot count.
		local fert_table, fertCount, plotCount = self:MeasureStartPlacementFertilityInRectangle(self.inhabited_WestX, 
												 self.inhabited_SouthY, self.inhabited_Width, self.inhabited_Height)
		-- Assemble the Rectangle data table:
		local rect_table = {self.inhabited_WestX, self.inhabited_SouthY, self.inhabited_Width, 
							self.inhabited_Height, -1, fertCount, plotCount}; -- AreaID -1 means ignore area IDs.
		-- Divide the rectangle.
		self:DivideIntoRegions(self.iNumCivs, fert_table, rect_table)
		-- The regions have been defined.
	
	else -- Continental.
		--[[ Loop through all plots on the map, measuring fertility of each land 
			 plot, identifying its AreaID, building a list of landmass AreaIDs, and
			 tallying the Start Placement Fertility for each landmass. ]]--

		-- region_data: [WestX, EastX, SouthY, NorthY, 
		-- numLandPlotsinRegion, numCoastalPlotsinRegion,
		-- numOceanPlotsinRegion, iRegionNetYield, 
		-- iNumLandAreas, iNumPlotsinRegion]
		local best_areas = {};
		local globalFertilityOfLands = {};

		-- Obtain info on all landmasses for comparision purposes.
		local iGlobalFertilityOfLands = 0;
		local iNumLandPlots = 0;
		local iNumLandAreas = 0;
		local land_area_IDs = {};
		local land_area_plots = {};
		local land_area_fert = {};
		-- Cycle through all plots in the world, checking their Start Placement Fertility and AreaID.
		for x = 0, iW - 1 do
			for y = 0, iH - 1 do
				local i = y * iW + x + 1;
				local plot = Map.GetPlot(x, y);
				if not plot:IsWater() then -- Land plot, process it.
					iNumLandPlots = iNumLandPlots + 1;
					local iArea = plot:GetArea();
					local plotFertility = self:MeasureStartPlacementFertilityOfPlot(x, y, true); -- Check for coastal land is enabled.
					iGlobalFertilityOfLands = iGlobalFertilityOfLands + plotFertility;
					--
					if TestMembership(land_area_IDs, iArea) == false then -- This plot is the first detected in its AreaID.
						iNumLandAreas = iNumLandAreas + 1;
						table.insert(land_area_IDs, iArea);
						land_area_plots[iArea] = 1;
						land_area_fert[iArea] = plotFertility;
					else -- This AreaID already known.
						land_area_plots[iArea] = land_area_plots[iArea] + 1;
						land_area_fert[iArea] = land_area_fert[iArea] + plotFertility;
					end
				end
			end
		end

		-- Sort areas, achieving a list of AreaIDs with best areas first.
		--
		-- Fertility data in land_area_fert is stored with areaID index keys.
		-- Need to generate a version of this table with indices of 1 to n, where n is number of land areas.
		local interim_table = {};
		local min_area_fertility = iGlobalFertilityOfLands / self.iNumCivs * 0.5;
		print("Minimum area fertility required =", min_area_fertility);
		for loop_index, data_entry in pairs(land_area_fert) do
			-- add fertility check to prevent tiny islands from being considered
			if data_entry >= min_area_fertility then
				table.insert(interim_table, data_entry);
			else
				iNumLandAreas = iNumLandAreas - 1;
			end
		end
		
		--[[for AreaID, fert in ipairs(interim_table) do
			print("Interim Table ID " .. AreaID .. " has fertility of " .. fert);
		end
		print("* * * * * * * * * *"); ]]--
		
		-- Sort the fertility values stored in the interim table. Sort order in Lua is lowest to highest.
		table.sort(interim_table);

		--[[ for AreaID, fert in ipairs(interim_table) do
			print("Interim Table ID " .. AreaID .. " has fertility of " .. fert);
		end
		print("* * * * * * * * * *"); ]]--

		-- If less players than landmasses, we will ignore the extra landmasses.
		local iNumRelevantLandAreas = math.min(iNumLandAreas, self.iNumCivs);
		print("Number of relevant areas =", iNumRelevantLandAreas);
		-- Now re-match the AreaID numbers with their corresponding fertility values
		-- by comparing the original fertility table with the sorted interim table.
		-- During this comparison, best_areas will be constructed from sorted AreaIDs, richest stored first.
		local best_areas = {};
		-- Currently, the best yields are at the end of the interim table. We need to step backward from there.
		local end_of_interim_table = table.maxn(interim_table);
		-- We may not need all entries in the table. Process only iNumRelevantLandAreas worth of table entries.
		local fertility_value_list = {};
		local fertility_value_tie = false;
		for tableConstructionLoop = end_of_interim_table, (end_of_interim_table - iNumRelevantLandAreas + 1), -1 do
			if TestMembership(fertility_value_list, interim_table[tableConstructionLoop]) == true then
				fertility_value_tie = true;
				print("*** WARNING: Fertility Value Tie exists! ***");
			else
				table.insert(fertility_value_list, interim_table[tableConstructionLoop]);
			end
		end

		if fertility_value_tie == false then -- No ties, so no need of special handling for ties.
			for areaTestLoop = end_of_interim_table, (end_of_interim_table - iNumRelevantLandAreas + 1), -1 do
				for loop_index, AreaID in ipairs(land_area_IDs) do
					if interim_table[areaTestLoop] == land_area_fert[land_area_IDs[loop_index]] then
						table.insert(best_areas, AreaID);
						break
					end
				end
			end
		else -- Ties exist! Special handling required to protect against a shortfall in the number of defined regions.
			local iNumUniqueFertValues = table.maxn(fertility_value_list);
			for fertLoop = 1, iNumUniqueFertValues do
				for AreaID, fert in pairs(land_area_fert) do
					if fert == fertility_value_list[fertLoop] then
						-- Add ties only if there is room!
						local best_areas_length = table.maxn(best_areas);
						if best_areas_length < iNumRelevantLandAreas then
							table.insert(best_areas, AreaID);
						else
							break
						end
					end
				end
			end
		end

		-- Assign continents to receive start plots. Record number of civs assigned to each landmass.
		local inhabitedAreaIDs = {};
		local numberOfCivsPerArea = table.fill(0, iNumRelevantLandAreas); -- Indexed in synch with best_areas. Use same index to match values from each table.
		for civToAssign = 1, self.iNumCivs do
			local bestRemainingArea = -1;
			local bestRemainingFertility = 0;
			local bestAreaTableIndex;
			-- Loop through areas, find the one with the best remaining fertility (civs added 
			-- to a landmass reduces its fertility rating for subsequent civs).
			--
			--print("- - Searching landmasses in order to place Civ #", civToAssign); print("-");
			for area_loop, AreaID in ipairs(best_areas) do
				--local thisLandmassCurrentFertility = land_area_fert[AreaID] / (1 + numberOfCivsPerArea[area_loop]);
				-- assume 80% of fertility is in relevant land areas
				local thisLandmassCurrentFertility = land_area_fert[AreaID] - iGlobalFertilityOfLands * 0.8 * numberOfCivsPerArea[area_loop] / self.iNumCivs;
				if thisLandmassCurrentFertility > bestRemainingFertility and numberOfCivsPerArea[area_loop] < math.max(self.iNumCivs - 2, 2) then
					bestRemainingArea = AreaID;
					bestRemainingFertility = thisLandmassCurrentFertility;
					bestAreaTableIndex = area_loop;
					--
					-- print("- Found new candidate landmass with Area ID#:", bestRemainingArea, " with fertility of ", bestRemainingFertility);
				end
			end
			if bestRemainingArea == -1 then
				print("Failed to find an area somehow, assign to first area as a failsafe");
				bestRemainingArea = best_areas[1];
				bestAreaTableIndex = 1;
			end

			-- Record results for this pass. (A landmass has been assigned to receive one more start point than it previously had).
			numberOfCivsPerArea[bestAreaTableIndex] = numberOfCivsPerArea[bestAreaTableIndex] + 1;
			if TestMembership(inhabitedAreaIDs, bestRemainingArea) == false then
				table.insert(inhabitedAreaIDs, bestRemainingArea);
			end
			--print("Civ #", civToAssign, "has been assigned to Area#", bestRemainingArea); print("-");
		end
		--print("-"); print("--- End of Initial Readout ---"); print("-");
		
		--print("*** Number of Civs per Landmass - Table Readout ***");
		--PrintContentsOfTable(numberOfCivsPerArea)
		--print("--- End of Civs per Landmass readout ***"); print("-"); print("-");
				
		-- Loop through the list of inhabited landmasses, dividing each landmass in to regions.
		-- Note that it is OK to divide a continent with one civ on it: this will assign the whole
		-- of the landmass to a single region, and is the easiest method of recording such a region.
		local iNumInhabitedLandmasses = table.maxn(inhabitedAreaIDs);
		for loop, currentLandmassID in ipairs(inhabitedAreaIDs) do
			-- Obtain the boundaries of and data for this landmass.
			local landmass_data = ObtainLandmassBoundaries(currentLandmassID);
			local iWestX = landmass_data[1];
			local iSouthY = landmass_data[2];
			local iEastX = landmass_data[3];
			local iNorthY = landmass_data[4];
			local iWidth = landmass_data[5];
			local iHeight = landmass_data[6];
			local wrapsX = landmass_data[7];
			local wrapsY = landmass_data[8];
			-- Obtain "Start Placement Fertility" of the current landmass. (Necessary to do this
			-- again because the fert_table can't be built prior to finding boundaries, and we had
			-- to ID the proper landmasses via fertility to be able to figure out their boundaries.
			local fert_table, fertCount, plotCount = self:MeasureStartPlacementFertilityOfLandmass(currentLandmassID, 
													 iWestX, iEastX, iSouthY, iNorthY, wrapsX, wrapsY);
			-- Assemble the rectangle data for this landmass.
			local rect_table = {iWestX, iSouthY, iWidth, iHeight, currentLandmassID, fertCount, plotCount};
			-- Divide this landmass in to number of regions equal to civs assigned here.
			iNumCivsOnThisLandmass = numberOfCivsPerArea[loop];
			if iNumCivsOnThisLandmass > 0 and iNumCivsOnThisLandmass <= 22 then -- valid number of civs.
			
				--[[ Debug printout for regional division inputs.
				print("-"); print("- Region #: ", loop);
				print("- Civs on this landmass: ", iNumCivsOnThisLandmass);
				print("- Area ID#: ", currentLandmassID);
				print("- Fertility: ", fertCount);
				print("- Plot Count: ", plotCount); print("-");
				--]]
				self:DivideIntoRegions(iNumCivsOnThisLandmass, fert_table, rect_table)
			else
				print("Invalid number of civs assigned to a landmass: ", iNumCivsOnThisLandmass);
			end
		end
		--
		-- The regions have been defined.
	end
	
	-- Entry point for easier overrides.
	self:CustomOverride()
	
	--[[ Printout is for debugging only. Deactivate otherwise.
	local tempRegionData = self.regionData;
	for i, data in ipairs(tempRegionData) do
		print("-");
		print("Data for Start Region #", i);
		print("WestX:  ", data[1]);
		print("SouthY: ", data[2]);
		print("Width:  ", data[3]);
		print("Height: ", data[4]);
		print("AreaID: ", data[5]);
		print("Fertility:", data[6]);
		print("Plots:  ", data[7]);
		print("Fert/Plot:", data[8]);
		print("-");
	end
	--]]
end
------------------------------------------------------------------------------
-- Start of functions tied to ChooseLocations()
------------------------------------------------------------------------------
function AssignStartingPlots:MeasureTerrainInRegions()
	local iW, iH = Map.GetGridSize();
	-- This function stores its data in the instance (self) data table.
	for region_loop, region_data_table in ipairs(self.regionData) do
		local iWestX = region_data_table[1];
		local iSouthY = region_data_table[2];
		local iWidth = region_data_table[3];
		local iHeight = region_data_table[4];
		local iAreaID = region_data_table[5];
		
		local totalPlots, areaPlots = 0, 0;
		local waterCount, flatlandsCount, hillsCount, peaksCount = 0, 0, 0, 0;
		local lakeCount, coastCount, oceanCount, iceCount = 0, 0, 0, 0;
		local grassCount, plainsCount, desertCount, tundraCount, snowCount = 0, 0, 0, 0, 0; -- counts flatlands only!
		local forestCount, jungleCount, marshCount, riverCount, floodplainCount, oasisCount = 0, 0, 0, 0, 0, 0;
		local coastalLandCount, nextToCoastCount = 0, 0;

		-- Iterate through the region's plots, getting plotType, terrainType, featureType and river status.
		for region_loop_y = 0, iHeight - 1 do
			for region_loop_x = 0, iWidth - 1 do
				totalPlots = totalPlots + 1;
				local x = (region_loop_x + iWestX) % iW;
				local y = (region_loop_y + iSouthY) % iH;
				local plot = Map.GetPlot(x, y);
				local area_of_plot = plot:GetArea();
				-- get plot info
				local plotType = plot:GetPlotType()
				local terrainType = plot:GetTerrainType()
				local featureType = plot:GetFeatureType()
				
				-- Mountain and Ocean plot types get their own AreaIDs, but we are going to measure them anyway.
				if plotType == PlotTypes.PLOT_MOUNTAIN then
					peaksCount = peaksCount + 1; -- and that's it for Mountain plots. No other stats.
				elseif plotType == PlotTypes.PLOT_OCEAN then
					waterCount = waterCount + 1;
					if terrainType == TerrainTypes.TERRAIN_COAST then
						if plot:IsLake() then
							lakeCount = lakeCount + 1;
						else
							coastCount = coastCount + 1;
						end
					else
						oceanCount = oceanCount + 1;
					end
					if featureType == FeatureTypes.FEATURE_ICE then
						iceCount = iceCount + 1;
					end

				else
					-- Hills and Flatlands, check plot for region membership. Only process this plot if it is a member.
					if (area_of_plot == iAreaID) or (iAreaID == -1) then
						areaPlots = areaPlots + 1;

						-- set up coastalLand and nextToCoast index
						local i = iW * y + x + 1;
			
						-- Record plot data
						if plotType == PlotTypes.PLOT_HILLS and terrainType ~= TerrainTypes.TERRAIN_SNOW then
							hillsCount = hillsCount + 1;

							if self.plotDataIsCoastal[i] then
								coastalLandCount = coastalLandCount + 1;
							elseif self.plotDataIsNextToCoast[i] then
								nextToCoastCount = nextToCoastCount + 1;
							end

							if plot:IsRiverSide() then
								riverCount = riverCount + 1;
							end

							-- Feature check checking for all types, in case features are not obeying standard allowances.
							if featureType == FeatureTypes.FEATURE_FOREST then
								forestCount = forestCount + 1;
							elseif featureType == FeatureTypes.FEATURE_JUNGLE then
								jungleCount = jungleCount + 1;
							elseif featureType == FeatureTypes.FEATURE_MARSH then
								marshCount = marshCount + 1;
							elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then
								floodplainCount = floodplainCount + 1;
							elseif featureType == FeatureTypes.FEATURE_OASIS then
								oasisCount = oasisCount + 1;
							end
								
						else -- Flatlands plot OR snow
							flatlandsCount = flatlandsCount + 1;
	
							if self.plotDataIsCoastal[i] then
								coastalLandCount = coastalLandCount + 1;
							elseif self.plotDataIsNextToCoast[i] then
								nextToCoastCount = nextToCoastCount + 1;
							end

							if plot:IsRiverSide() then
								riverCount = riverCount + 1;
							end
				
							if terrainType == TerrainTypes.TERRAIN_GRASS then
								grassCount = grassCount + 1;
							elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
								plainsCount = plainsCount + 1;
							elseif terrainType == TerrainTypes.TERRAIN_DESERT then
								desertCount = desertCount + 1;
							elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
								tundraCount = tundraCount + 1;
							elseif terrainType == TerrainTypes.TERRAIN_SNOW then
								snowCount = snowCount + 1;
							end
				
							-- Feature check checking for all types, in case features are not obeying standard allowances.
							if featureType == FeatureTypes.FEATURE_FOREST then
								forestCount = forestCount + 1;
							elseif featureType == FeatureTypes.FEATURE_JUNGLE then
								jungleCount = jungleCount + 1;
							elseif featureType == FeatureTypes.FEATURE_MARSH then
								marshCount = marshCount + 1;
							elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then
								floodplainCount = floodplainCount + 1;
							elseif featureType == FeatureTypes.FEATURE_OASIS then
								oasisCount = oasisCount + 1;
							end
						end
					end
				end
			end
		end
			
		-- Assemble in to an array the recorded data for this region: 23 variables.
		local regionCounts = {
			totalPlots, areaPlots,
			waterCount, flatlandsCount, hillsCount, peaksCount,
			lakeCount, coastCount, oceanCount, iceCount,
			grassCount, plainsCount, desertCount, tundraCount, snowCount,
			forestCount, jungleCount, marshCount, riverCount, floodplainCount, oasisCount,
			coastalLandCount, nextToCoastCount
			}
		--[[ Table Key:
		
		1) totalPlots
		2) areaPlots                 13) desertCount
		3) waterCount                14) tundraCount
		4) flatlandsCount            15) snowCount
		5) hillsCount                16) forestCount
		6) peaksCount                17) jungleCount
		7) lakeCount                 18) marshCount
		8) coastCount                19) riverCount
		9) oceanCount                20) floodplainCount
		10) iceCount                 21) oasisCount
		11) grassCount               22) coastalLandCount
		12) plainsCount              23) nextToCoastCount   ]]--
			
		-- Add array to the data table.
		table.insert(self.regionTerrainCounts, regionCounts);
		
		--[[ Activate printout only for debugging.
		print("-");
		print("--- Region Terrain Measurements for Region #", region_loop, "---");
		print("Total Plots: ", totalPlots);
		print("Area Plots: ", areaPlots);
		print("-");
		print("Mountains: ", peaksCount, " - Cannot belong to a landmass AreaID.");
		print("Total Water Plots: ", waterCount, " - Cannot belong to a landmass AreaID.");
		print("-");
		print("Lake Plots: ", lakeCount);
		print("Coast Plots: ", coastCount, " - Does not include Lakes.");
		print("Ocean Plots: ", oceanCount);
		print("Icebergs: ", iceCount);
		print("-");
		print("Flatlands: ", flatlandsCount);
		print("Hills: ", hillsCount);
		print("-");
		print("Grass Plots: ", grassCount);
		print("Plains Plots: ", plainsCount);
		print("Desert Plots: ", desertCount);
		print("Tundra Plots: ", tundraCount);
		print("Snow Plots: ", snowCount);
		print("-");
		print("Forest Plots: ", forestCount);
		print("Jungle Plots: ", jungleCount);
		print("Marsh Plots: ", marshCount);
		print("Flood Plains: ", floodplainCount);
		print("Oases: ", oasisCount);
		print("-");
		print("Plots Along Rivers: ", riverCount);
		print("Plots Along Oceans: ", coastalLandCount);
		print("Plots Next To Plots Along Oceans: ", nextToCoastCount);
		print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
		--]]
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:DetermineRegionTypes()
	-- Determine region type and conditions. Use self.regionTypes to store the results
	--
	-- REGION TYPES
	-- 0. Undefined
	-- 1. Tundra
	-- 2. Jungle
	-- 3. Forest
	-- 4. Desert
	-- 5. Hills
	-- 6. Plains
	-- 7. Grassland
	-- 8. Hybrid
	-- 9. Mountain
	-- 10. Snow

	-- Main loop
	for this_region, terrainCounts in ipairs(self.regionTerrainCounts) do
		-- Set each region to "Undefined Type" as default.
		-- If all efforts fail at determining what type of region this should be, region type will remain Undefined.
		--local totalPlots = terrainCounts[1];
		local areaPlots = terrainCounts[2];
		--local waterCount = terrainCounts[3];
		local flatlandsCount = terrainCounts[4];
		local hillsCount = terrainCounts[5];
		local peaksCount = terrainCounts[6];
		--local lakeCount = terrainCounts[7];
		--local coastCount = terrainCounts[8];
		--local oceanCount = terrainCounts[9];
		local iceCount = terrainCounts[10];
		local grassCount = terrainCounts[11];
		local plainsCount = terrainCounts[12];
		local desertCount = terrainCounts[13];
		local tundraCount = terrainCounts[14];
		local snowCount = terrainCounts[15];
		local forestCount = terrainCounts[16];
		local jungleCount = terrainCounts[17];
		--local marshCount = terrainCounts[18];
		local riverCount = terrainCounts[19];
		--local floodplainCount = terrainCounts[20];
		--local oasisCount = terrainCounts[21];
		--local coastalLandCount = terrainCounts[22];
		--local nextToCoastCount = terrainCounts[23];

		-- If Rectangular regional division, then water plots would be included in area plots.
		-- Let's recalculate area plots based only on flatland and hills plots.
		if self.method == 3 or self.method == 4 then
			areaPlots = flatlandsCount + hillsCount;
		end
		
		--[[
			 MOD.Barathor: 
			 Totally revamped this entire function.
			 With the old method, very dominant conditions could be missed, resulting in mislabeled regions.
			 Now, a large decrementing value is added on to the base percentage requirements to filter out very dominant conditions first. 
		--]]
	
		local found_region   = false
		-- MOD.Barathor: These are the minimum values
		local desert_percent = 0.20
		local tundra_percent = 0.20
		local jungle_percent = 0.20
		local forest_percent = 0.25
		local hills_percent  = 0.30
		local plains_percent = 0.30
		local grass_percent  = 0.30

		-- MOD.Barathor: This variable will decrement until a region is assigned; starts off very high.
		local adjustment     = 0.50
		
		-- MOD.Barathor: Decided to disable this part.
		--[[
		-- MOD.Barathor: An additional value is applied to region types already chosen, to very slightly lessen the chances of choosing it again.
		for loop, region in ipairs(self.regionTypes) do
			if region == 4 then
				desert_percent = desert_percent + 0.05
			elseif region == 1 then
				tundra_percent = tundra_percent + 0.05
			elseif region == 2 then
				jungle_percent = jungle_percent + 0.05
			elseif region == 3 then
				forest_percent = forest_percent + 0.05
			elseif region == 5 then
				hills_percent = hills_percent + 0.05
			elseif region == 6 then
				plains_percent = plains_percent + 0.05
			elseif region == 7 then
				grass_percent = grass_percent + 0.05
			end
		end
		--]]
		
		-- MOD.Barathor: Reordered condition checks and modified what some checks include.
		while found_region == false do
			-- Desert check.
			if (desertCount >= areaPlots * (desert_percent + adjustment)) then
				table.insert(self.regionTypes, 4)
				print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
				print("Region #", this_region, " has been defined as a DESERT Region.")
				found_region = true
				
			-- Tundra check.
			elseif (tundraCount >= areaPlots * (tundra_percent + adjustment)) then
				table.insert(self.regionTypes, 1)
				print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
				print("Region #", this_region, " has been defined as a TUNDRA Region.")
				found_region = true
				
			-- Jungle check.
			elseif (jungleCount >= areaPlots * (jungle_percent + adjustment)) then 
				table.insert(self.regionTypes, 2)
				print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
				print("Region #", this_region, " has been defined as a JUNGLE Region.")
				found_region = true
				
			-- Forest check. 
			elseif (forestCount >= areaPlots * (forest_percent + adjustment)) and (tundraCount < areaPlots * tundra_percent) then
				table.insert(self.regionTypes, 3)
				print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
				print("Region #", this_region, " has been defined as a FOREST Region.")
				found_region = true

			-- Hills check.
			elseif (hillsCount >= areaPlots * (hills_percent + adjustment)) then
				table.insert(self.regionTypes, 5)
				print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
				print("Region #", this_region, " has been defined as a HILLS Region.")
				found_region = true
				
			else
				if adjustment <= 0 then
					-- Plains check.
					if (plainsCount >= areaPlots * plains_percent) and (plainsCount * 0.8 > grassCount) then
						table.insert(self.regionTypes, 6)
						print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
						print("Region #", this_region, " has been defined as a PLAINS Region.")
						found_region = true
					-- Grass check.
					elseif (grassCount >= areaPlots * grass_percent) and (grassCount * 0.8 > plainsCount) then
						table.insert(self.regionTypes, 7)
						print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
						print("Region #", this_region, " has been defined as a GRASSLAND Region.")
						found_region = true
					else
						-- Hybrid: No conditions dominate or other mods have included new terrain/feature/plot types which aren't recognized here.
						table.insert(self.regionTypes, 8)
						print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
						print("Region #", this_region, " has been defined as a HYBRID Region.")
						found_region = true
					end
				end
				adjustment = adjustment - 0.01
			end
		end
		
		-- MOD.Barathor: New data for very useful debug printouts.
		--print("Threshold Values:")
		--print(string.format("Desert: %.2f - Tundra: %.2f - Jungle: %.2f - Forest: %.2f - Hills: %.2f - Plains: %.2f - Grass: %.2f", desert_percent, tundra_percent, jungle_percent, forest_percent, hills_percent, plains_percent, grass_percent))		
		--print("Region Values:")
		--print(string.format("Desert: %.2f - Tundra: %.2f - Jungle: %.2f - Forest: %.2f - Hills: %.2f - Plains: %.2f - Grass: %.2f", desertCount / areaPlots, tundraCount / areaPlots, jungleCount / areaPlots, forestCount / areaPlots, hillsCount / areaPlots, plainsCount / areaPlots, grassCount / areaPlots))
		--print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
		
	end

	-- Added by azum4roll: Support for Mountain and Snow "bias"
	-- This changes one region to a "Mountain region" or "Snow region", if a civ with the respective start bias exists
	-- It's possible that there's no snow/mountain on the map, so we need to handle it later in BalanceAndAssign

	if self.hasSnowBias then
		-- Get ID of region with the most snow, prioritizing tundra regions first
		local snowRegion = -1;
		local snowCount = 0;
		for this_region, terrainCounts in ipairs(self.regionTerrainCounts) do
			local regionType = self.regionTypes[this_region];
			local thisSnowCount = terrainCounts[15];
			if regionType == 1 then
				thisSnowCount = thisSnowCount + 1000;
			end
			if thisSnowCount > snowCount then
				snowRegion = this_region;
				snowCount = thisSnowCount;
			end
		end

		if snowRegion ~= -1 then
			self.regionTypes[snowRegion] = 10;
			print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
			print("Region #", snowRegion, " has been converted into a SNOW Region.");
		end
	end

	if self.hasMountainBias then
		-- Get ID of region with the most mountains
		local mountainRegion = -1;
		local mountainCount = 0;
		for this_region, terrainCounts in ipairs(self.regionTerrainCounts) do
			local regionType = self.regionTypes[this_region];
			local thisMountainCount = terrainCounts[6];
			if thisMountainCount > mountainCount and regionType ~= 10 then
				mountainRegion = this_region;
				mountainCount = thisMountainCount;
			end
		end

		if mountainRegion ~= -1 then
			self.regionTypes[mountainRegion] = 9;
			print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
			print("Region #", mountainRegion, " has been converted into a MOUNTAIN Region.");
		end
	end

	-- MOD.Barathor: Disabled old method.
	--[[
		-- Tundra check first.
		if (tundraCount + snowCount) >= areaPlots * 0.3 then
			table.insert(self.regionTypes, 1);
			--print("-");
			--print("Region #", this_region, " has been defined as a Tundra Region.");
		
		-- Jungle check.
		elseif (jungleCount >= areaPlots * 0.30) then
			table.insert(self.regionTypes, 2);
			--print("-");
			--print("Region #", this_region, " has been defined as a Jungle Region.");
		elseif (jungleCount >= areaPlots * 0.20) and (jungleCount + forestCount >= areaPlots * 0.35) then
			table.insert(self.regionTypes, 2);
			--print("-");
			--print("Region #", this_region, " has been defined as a Jungle Region.");
		
		-- Forest check.
		elseif (forestCount >= areaPlots * 0.30) then
			table.insert(self.regionTypes, 3);
			--print("-");
			--print("Region #", this_region, " has been defined as a Forest Region.");
		elseif (forestCount >= areaPlots * 0.20) and (jungleCount + forestCount >= areaPlots * 0.35) then
			table.insert(self.regionTypes, 3);
			--print("-");
			--print("Region #", this_region, " has been defined as a Forest Region.");
		
		-- Desert check.
		elseif (desertCount >= areaPlots * 0.25) then
			table.insert(self.regionTypes, 4);
			--print("-");
			--print("Region #", this_region, " has been defined as a Desert Region.");

		-- Hills check.
		elseif (hillsCount >= areaPlots * 0.415) then
			table.insert(self.regionTypes, 5);
			--print("-");
			--print("Region #", this_region, " has been defined as a Hills Region.");
		
		-- Plains check.
		elseif (plainsCount >= areaPlots * 0.3) and (plainsCount * 0.7 > grassCount) then
			table.insert(self.regionTypes, 6);
			--print("-");
			--print("Region #", this_region, " has been defined as a Plains Region.");
		
		-- Grass check.
		elseif (grassCount >= areaPlots * 0.3) and (grassCount * 0.7 > plainsCount) then
			table.insert(self.regionTypes, 7);
			--print("-");
			--print("Region #", this_region, " has been defined as a Grassland Region.");
		
		-- Hybrid check.
		elseif ((grassCount + plainsCount + desertCount + tundraCount + snowCount + hillsCount + peaksCount) > areaPlots * 0.8) then
			table.insert(self.regionTypes, 8);
			--print("-");
			--print("Region #", this_region, " has been defined as a Hybrid Region.");

		else -- Undefined Region (most likely due to operating on a mod that adds new terrain types.)
			table.insert(self.regionTypes, 0);
			--print("-");
			--print("Region #", this_region, " has been defined as an Undefined Region.");
		
		end
	end
	]]--
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceImpactAndRipples(x, y)
	-- This function operates upon the "impact and ripple" data overlays. This
	-- is the core version, which operates on start points. Resources and city 
	-- states have their own data layers, using this same design principle.
	-- Execution of this function handles a single start point (x, y).
	--[[ The purpose of the overlay is to strongly discourage placement of new
	     start points near already-placed start points. Each start placed makes
	     an "impact" on the map, and this impact "ripples" outward in rings, each
	     ring weaker in bias than the previous ring. ... Civ4 attempted to adjust
	     the minimum distance between civs according to a formula that factored
	     map size and number of civs in the game, but the formula was chock full 
	     of faulty assumptions, resulting in an accurate calibration rate of less
	     than ten percent. The failure of this approach is the primary reason 
	     that an all-new positioner was written for Civ5. ... Rather than repeat
	     the mistakes of the old system, in part or in whole, I have opted to go 
	     with a flat 9-tile impact crater for all map sizes and number of civs.
	     The new system will place civs at least 9 tiles away from other civs
	     whenever and wherever a reasonable candidate plot exists at this range. 
	     If a start must be found within that range, it will attempt to balance
	     quality of the location against proximity to another civ, with the bias
	     becoming very heavy inside 7 plots, and all but prohibitive inside 5.
	     The only starts that should see any Civs crowding together are those 
	     with impossible conditions such as cramming more than a dozen civs on 
	     to Tiny or Duel sized maps. ... The Impact and Ripple is aimed mostly
	     at assisting with Rectangular Method regional division on islands maps,
	     as the primary method of spacing civs is the Center Bias factor. The 
	     Impact and Ripple is a second layer of protection, for those rare cases
	     when regional shapes are severely distorted, with little to no land in
	     the region center, and the start having to be placed near the edge, and
	     for cases of extremely thin regional dimension.   ]]--
	-- To establish a bias of 9, we Impact the overlay and Ripple outward 8 times.
	-- Value of 0 in a plot means no influence from existing Impacts in that plot.
	-- Value of 99 means an Impact occurred in that plot and it IS a start point.
	-- Values > 0 and < 99 are "ripples", meaning that plot is near a start point.
	local iW, iH = Map.GetGridSize();
	local wrapX = Map:IsWrapX();
	local wrapY = Map:IsWrapY();
	local impact_value = 99;
	local ripple_values = {97, 95, 92, 89, 69, 57, 24, 15};
	local odd = self.firstRingYIsOdd;
	local even = self.firstRingYIsEven;
	local nextX, nextY, plot_adjustments;
	-- Start points need to impact the resource layers, so let's handle that first.
	self:PlaceResourceImpact(x, y, 1, 0) -- Strategic layer, at impact site only.
	self:PlaceResourceImpact(x, y, 2, 3) -- Luxury layer, set all plots within this civ start as off limits.
	self:PlaceResourceImpact(x, y, 3, 3) -- Bonus layer
	self:PlaceResourceImpact(x, y, 4, 3) -- Fish layer
	self:PlaceResourceImpact(x, y, 6, 4) -- Natural Wonders layer, set a minimum distance of 5 plots (4 ripples) away.
	-- Now the main data layer, for start points themselves, and the City State data layer.
	-- Place Impact!
	local impactPlotIndex = y * iW + x + 1;
	self.distanceData[impactPlotIndex] = impact_value;
	self.playerCollisionData[impactPlotIndex] = true;
	self.cityStateData[impactPlotIndex] = 1;
	-- Place Ripples
	for ripple_radius, ripple_value in ipairs(ripple_values) do
		-- Moving clockwise around the ring, the first direction to travel will be Northeast.
		-- This matches the direction-based data in the odd and even tables. Each
		-- subsequent change in direction will correctly match with these tables, too.
		--
		-- Locate the plot within this ripple ring that is due West of the Impact Plot.
		local currentX = x - ripple_radius;
		local currentY = y;
		-- Now loop through the six directions, moving ripple_radius number of times
		-- per direction. At each plot in the ring, add the ripple_value for that ring 
		-- to the plot's entry in the distance data table.
		for direction_index = 1, 6 do
			for plot_to_handle = 1, ripple_radius do
				-- Must account for hex factor.
			 	if currentY / 2 > math.floor(currentY / 2) then -- Current Y is odd. Use odd table.
					plot_adjustments = odd[direction_index];
				else -- Current Y is even. Use plot adjustments from even table.
					plot_adjustments = even[direction_index];
				end
				-- Identify the next plot in the ring.
				nextX = currentX + plot_adjustments[1];
				nextY = currentY + plot_adjustments[2];
				-- Make sure the plot exists
				if wrapX == false and (nextX < 0 or nextX >= iW) then -- X is out of bounds.
					-- Do not add ripple data to this plot.
				elseif wrapY == false and (nextY < 0 or nextY >= iH) then -- Y is out of bounds.
					-- Do not add ripple data to this plot.
				else -- Plot is in bounds, process it.
					-- Handle any world wrap.
					local realX = nextX;
					local realY = nextY;
					if wrapX then
						realX = realX % iW;
					end
					if wrapY then
						realY = realY % iH;
					end
					-- Record ripple data for this plot.
					local ringPlotIndex = realY * iW + realX + 1;
					if self.distanceData[ringPlotIndex] > 0 then -- This plot is already in range of at least one other civ!
						-- First choose the greater of the two, existing value or current ripple.
						local stronger_value = math.max(self.distanceData[ringPlotIndex], ripple_value);
						-- Now increase it by 1.2x to reflect that multiple civs are in range of this plot.
						local overlap_value = math.min(97, math.floor(stronger_value * 1.2));
						self.distanceData[ringPlotIndex] = overlap_value;
					else
						self.distanceData[ringPlotIndex] = ripple_value;
					end
					-- Now impact the City State layer if appropriate.
					if ripple_radius <= 6 then
						self.cityStateData[ringPlotIndex] = 1;
					end
				end
				currentX, currentY = nextX, nextY;
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:MeasureSinglePlot(x, y, region_type)
	local data = table.fill(false, 4);
	-- Note that "Food" is not strictly about tile yield.
	-- Different regions get their food in different ways.
	-- Tundra, Jungle, Forest, Desert, Plains regions will 
	-- get Bonus resource support to cover food shortages.
	--
	-- Data table entries hold results; all begin as false:
	-- [1] "Food"
	-- [2] "Prod"
	-- [3] "Good"
	-- [4] "Junk"
	local iW, iH = Map.GetGridSize();
	local plot = Map.GetPlot(x, y);
	local plotType = plot:GetPlotType()
	local terrainType = plot:GetTerrainType()
	local featureType = plot:GetFeatureType()

	if plotType == PlotTypes.PLOT_MOUNTAIN then -- Mountains are Junk, except in Mountain regions (made for mountain bias)
		if region_type ~= 9 then
			data[4] = true;
		else
			data[1] = true;
			data[3] = true;
		end
		return data
	elseif plotType == PlotTypes.PLOT_OCEAN then
		if featureType == FeatureTypes.FEATURE_ICE then -- Icebergs are Junk, except in snow bias where it's ignored.
			if region_type ~= 10 then
				data[4] = true;
			end
			return data
		elseif plot:IsLake() then -- Lakes are Food, Good.
			data[1] = true;
			data[3] = true;
			return data
		elseif self.method == 3 or self.method == 4 then
			if terrainType == TerrainTypes.TERRAIN_COAST then -- Shallow water is Good for Archipelago-type maps.
				data[3] = true;
				return data
			end
		elseif terrainType == TerrainTypes.TERRAIN_COAST and region_type == 10 then -- Give more coastal score for snow bias
			data[3] = true;
			return data
		end
		-- Other water plots are ignored.
		return data
	end

	if featureType == FeatureTypes.FEATURE_JUNGLE then -- Jungles are Food, Good, except in Grass regions.
		if region_type ~= 7 then -- Region type is not grass.
			data[1] = true;
			data[3] = true;
		elseif plotType == PlotTypes.PLOT_HILLS then -- Jungle hill, in grass region, count as Prod but not Good.
			data[2] = true;
		end
		return data
	elseif featureType == FeatureTypes.FEATURE_FOREST then -- Forests are Prod, Good.
		data[2] = true;
		data[3] = true;
		if region_type == 3 or region_type == 1 or region_type == 10 then -- In Forest or Tundra or Snow Regions, Forests are also Food.
			data[1] = true;
		end
		return data
	elseif featureType == FeatureTypes.FEATURE_OASIS then -- Oases are Food, Good.
		data[1] = true;
		data[3] = true;
		return data
	elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then -- Flood Plains are Food, Good.
		data[1] = true;
		data[3] = true;
		return data
	elseif featureType == FeatureTypes.FEATURE_MARSH then -- Marsh are ignored.
		return data
	end

	if plotType == PlotTypes.PLOT_HILLS and terrainType ~= TerrainTypes.TERRAIN_SNOW then -- Non-Snow Hills with no features are Prod, Good.
		data[2] = true;
		data[3] = true;
		return data
	end
	
	-- If we have reached this point in the process, the plot is flatlands and snow.
	if terrainType == TerrainTypes.TERRAIN_SNOW then -- Snow are Junk, except in Snow regions (made for snow bias)
		if region_type ~= 10 then
			data[4] = true;
		else
			data[1] = true;
			data[2] = true;
			data[3] = true;
		end
		return data
		
	elseif terrainType == TerrainTypes.TERRAIN_DESERT then -- Non-Oasis, non-FloodPlain flat deserts are Junk, except in Desert regions.
		if region_type ~= 4 then
			data[4] = true;
		end
		return data

	elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then -- Tundra are ignored, except in Tundra/Snow Regions where they are Food, Good.
		if region_type == 1 or region_type == 10 then
			data[1] = true;
			data[3] = true;
		end
		if region_type == 10 then
			data[2] = true;
		end
		return data

	elseif terrainType == TerrainTypes.TERRAIN_PLAINS then -- Plains are Good for all region types, but Food in only about half of them.
		if region_type ~= 10 then
			data[3] = true;
		end
		if region_type == 1 or region_type == 4 or region_type == 5 or region_type == 6 or region_type == 8 or region_type == 9 then
			data[1] = true;
		end
		return data

	elseif terrainType == TerrainTypes.TERRAIN_GRASS then -- Grass is Good for all region types, but Food in only about half of them.
		if region_type ~= 10 then
			data[3] = true;
		end
		if region_type == 2 or region_type == 3 or region_type == 5 or region_type == 7 or region_type == 8 or region_type == 9 or region_type == 10 then
			data[1] = true;
		end
		return data
	end

	-- If we have arrived here, the plot has non-standard terrain.
	--print("Encountered non-standard terrain.");
	return data
end
------------------------------------------------------------------------------
function AssignStartingPlots:EvaluateCandidatePlot(plotIndex, region_type)
	local goodSoFar = true;
	local iW, iH = Map.GetGridSize();
	local x = (plotIndex - 1) % iW;
	local y = (plotIndex - x - 1) / iW;
	local plot = Map.GetPlot(x, y);
	local isEvenY = true;
	if y / 2 > math.floor(y / 2) then
		isEvenY = false;
	end
	local wrapX = Map:IsWrapX();
	local wrapY = Map:IsWrapY();
	local distance_bias = self.distanceData[plotIndex];
	local foodTotal, prodTotal, goodTotal, junkTotal, riverTotal, mountainTotal, coastScore = 0, 0, 0, 0, 0, 0, 0;
	local search_table = {};

	-- Check candidate plot to see if it's adjacent to saltwater. Add higher score for snow bias
	if self.plotDataIsCoastal[plotIndex] == true then
		if region_type == 10 then
			coastScore = 120;
		else
			coastScore = 60;
		end
	end

	-- Evaluate First Ring
	if isEvenY then
		search_table = self.firstRingYIsEven;
	else
		search_table = self.firstRingYIsOdd;
	end

	for loop, plot_adjustments in ipairs(search_table) do
		local searchX, searchY;
		if wrapX then
			searchX = (x + plot_adjustments[1]) % iW;
		else
			searchX = x + plot_adjustments[1];
		end
		if wrapY then
			searchY = (y + plot_adjustments[2]) % iH;
		else
			searchY = y + plot_adjustments[2];
		end
		--
		if searchX < 0 or searchX >= iW or searchY < 0 or searchY >= iH then
			-- This plot does not exist. It's off the map edge.
			junkTotal = junkTotal + 1;
		else
			if Map.GetPlot(searchX, searchY):GetPlotType() == PlotTypes.PLOT_MOUNTAIN then
				mountainTotal = mountainTotal + 1;
			end
			local result = self:MeasureSinglePlot(searchX, searchY, region_type)
			if result[4] then
				junkTotal = junkTotal + 1;
			else
				if result[1] then
					foodTotal = foodTotal + 1;
				end
				if result[2] then
					prodTotal = prodTotal + 1;
				end
				if result[3] then
					goodTotal = goodTotal + 1;
				end
				local searchPlot = Map.GetPlot(searchX, searchY);
				if searchPlot:IsRiverSide() then
					riverTotal = riverTotal + 1;
				end
			end
		end
	end

	-- Now check the results from the first ring against the established targets.
	if foodTotal < self.minFoodInner then
		goodSoFar = false;
	elseif prodTotal < self.minProdInner then
		goodSoFar = false;
	elseif goodTotal < self.minGoodInner then
		goodSoFar = false;
	end

	-- Set up the "score" for this candidate. Inner ring results weigh the heaviest.
	local weightedFoodInner = {0, 8, 14, 18, 19, 18, 14};	-- too much food is bad
	local foodResultInner = weightedFoodInner[foodTotal + 1];
	local weightedProdInner = {0, 10, 16, 20, 22, 24, 25};
	local prodResultInner = weightedProdInner[prodTotal + 1];
	local goodResultInner = goodTotal * 2;
	local innerRingScore = foodResultInner + prodResultInner + goodResultInner + riverTotal - (junkTotal * 3);

	if region_type == 9 then
		innerRingScore = innerRingScore + mountainTotal * 3;
	end

	-- Evaluate Second Ring
	if isEvenY then
		search_table = self.secondRingYIsEven;
	else
		search_table = self.secondRingYIsOdd;
	end

	for loop, plot_adjustments in ipairs(search_table) do
		local searchX, searchY;
		if wrapX then
			searchX = (x + plot_adjustments[1]) % iW;
		else
			searchX = x + plot_adjustments[1];
		end
		if wrapY then
			searchY = (y + plot_adjustments[2]) % iH;
		else
			searchY = y + plot_adjustments[2];
		end
		if searchX < 0 or searchX >= iW or searchY < 0 or searchY >= iH then
			-- This plot does not exist. It's off the map edge.
			junkTotal = junkTotal + 1;
		else
			if Map.GetPlot(searchX, searchY):GetPlotType() == PlotTypes.PLOT_MOUNTAIN then
				mountainTotal = mountainTotal + 1;
			end
			local result = self:MeasureSinglePlot(searchX, searchY, region_type)
			if result[4] then
				junkTotal = junkTotal + 1;
			else
				if result[1] then
					foodTotal = foodTotal + 1;
				end
				if result[2] then
					prodTotal = prodTotal + 1;
				end
				if result[3] then
					goodTotal = goodTotal + 1;
				end
				if plot:IsRiverSide() then
					riverTotal = riverTotal + 1;
				end
			end
		end
	end

	-- Check the results from the second ring against the established targets.
	if foodTotal < self.minFoodMiddle then
		goodSoFar = false;
	elseif prodTotal < self.minProdMiddle then
		goodSoFar = false;
	elseif goodTotal < self.minGoodMiddle then
		goodSoFar = false;
	end

	-- Update up the "score" for this candidate. Middle ring results weigh significantly.
	local weightedFoodMiddle = {0, 2, 5, 10, 20, 25, 28, 30, 32, 34, 35}; -- 35 for any further values.
	local foodResultMiddle = 35;
	if foodTotal < 10 then
		foodResultMiddle = weightedFoodMiddle[foodTotal + 1];
	end
	local weightedProdMiddle = {0, 10, 20, 25, 30, 35, 39, 42, 44, 45}; -- 45 for any further values.
	local effectiveProdTotal = prodTotal;
	if foodTotal * 2 < prodTotal then
		effectiveProdTotal = math.ceil(foodTotal / 2);
	end
	local prodResultMiddle = 35;
	if effectiveProdTotal < 5 then
		prodResultMiddle = weightedProdMiddle[effectiveProdTotal + 1];
	end
	local goodResultMiddle = goodTotal * 2;
	local middleRingScore = foodResultMiddle + prodResultMiddle + goodResultMiddle + riverTotal - (junkTotal * 3);

	if region_type == 9 then
		middleRingScore = middleRingScore + mountainTotal * 2;
	end

	-- Evaluate Third Ring
	if isEvenY then
		search_table = self.thirdRingYIsEven;
	else
		search_table = self.thirdRingYIsOdd;
	end

	for loop, plot_adjustments in ipairs(search_table) do
		local searchX, searchY;
		if wrapX then
			searchX = (x + plot_adjustments[1]) % iW;
		else
			searchX = x + plot_adjustments[1];
		end
		if wrapY then
			searchY = (y + plot_adjustments[2]) % iH;
		else
			searchY = y + plot_adjustments[2];
		end
		if searchX < 0 or searchX >= iW or searchY < 0 or searchY >= iH then
			-- This plot does not exist. It's off the map edge.
			junkTotal = junkTotal + 1;
		else
			if Map.GetPlot(searchX, searchY):GetPlotType() == PlotTypes.PLOT_MOUNTAIN then
				mountainTotal = mountainTotal + 1;
			end
			local result = self:MeasureSinglePlot(searchX, searchY, region_type)
			if result[4] then
				junkTotal = junkTotal + 1;
			else
				if result[1] then
					foodTotal = foodTotal + 1;
				end
				if result[2] then
					prodTotal = prodTotal + 1;
				end
				if result[3] then
					goodTotal = goodTotal + 1;
				end
				if plot:IsRiverSide() then
					riverTotal = riverTotal + 1;
				end
			end
		end
	end

	-- Check the results from the third ring against the established targets.
	if foodTotal < self.minFoodOuter then
		goodSoFar = false;
	elseif prodTotal < self.minProdOuter then
		goodSoFar = false;
	elseif goodTotal < self.minGoodOuter then
		goodSoFar = false;
	end
	if junkTotal > self.maxJunk then
		goodSoFar = false;
	end

	-- Tally the final "score" for this candidate.
	local outerRingScore = foodTotal + prodTotal + goodTotal + riverTotal - (junkTotal * 2);
	if region_type == 9 then
		outerRingScore = outerRingScore + mountainTotal;
	end
	local finalScore = innerRingScore + middleRingScore + outerRingScore + coastScore;

	-- Check Impact and Ripple data to see if candidate is near an already-placed start point.
	if distance_bias > 0 then
		-- This candidate is near an already placed start. This invalidates its 
		-- eligibility for first-pass placement; but it may still qualify as a 
		-- fallback site, so we will reduce its Score according to the bias factor.
		goodSoFar = false;
		finalScore = finalScore - math.floor(finalScore * distance_bias / 100);
	end

	--[[ Debug
	print(".");
	print("Plot:", x, y, " Food:", foodTotal, "Prod: ", prodTotal, "Good:", goodTotal, "Junk:", 
	       junkTotal, "River:", riverTotal, "Score:", finalScore);
	print("Plot:", x, y, " Coastal:", self.plotDataIsCoastal[plotIndex], "Distance Bias:", distance_bias);
	]]--
	
	return finalScore, goodSoFar
end
------------------------------------------------------------------------------
function AssignStartingPlots:IterateThroughCandidatePlotList(plot_list, region_type)
	-- Iterates through a list of candidate plots.
	-- Each plot is identified by its global plot index.
	-- This function assumes all candidate plots can have a city built on them.
	-- Any plots not allowed to have a city should be weeded out when building the candidate list.
	local found_eligible = false;
	local bestPlotScore = -5000;
	local bestPlotIndex;
	local found_fallback = false;
	local bestFallbackScore = -5000;
	local bestFallbackIndex;
	-- Process list of candidate plots.
	for loop, plotIndex in ipairs(plot_list) do
		local score, meets_minimums = self:EvaluateCandidatePlot(plotIndex, region_type)
		-- Test current plot against best known plot.
		if meets_minimums == true then
			found_eligible = true;
			if score > bestPlotScore then
				bestPlotScore = score;
				bestPlotIndex = plotIndex;
			end
		else
			found_fallback = true;
			if score > bestFallbackScore then
				bestFallbackScore = score;
				bestFallbackIndex = plotIndex;
			end
		end
	end
	-- returns table containing six variables: boolean, integer, integer, boolean, integer, integer
	local election_results = {found_eligible, bestPlotScore, bestPlotIndex, found_fallback, bestFallbackScore, bestFallbackIndex};
	return election_results
end
------------------------------------------------------------------------------
function AssignStartingPlots:FindStart(region_number)
	-- This function attempts to choose a start position for a single region.
	-- This function returns two boolean flags, indicating the success level of the operation.
	local bSuccessFlag = false; -- Returns true when a start is placed, false when process fails.
	local bForcedPlacementFlag = false; -- Returns true if this region had no eligible starts and one was forced to occur.
	
	-- Obtain data needed to process this region.
	local iW, iH = Map.GetGridSize();
	local region_data_table = self.regionData[region_number];
	local iWestX = region_data_table[1];
	local iSouthY = region_data_table[2];
	local iWidth = region_data_table[3];
	local iHeight = region_data_table[4];
	local iAreaID = region_data_table[5];
	local iMembershipEastX = iWestX + iWidth - 1;
	local iMembershipNorthY = iSouthY + iHeight - 1;
	--
	local terrainCounts = self.regionTerrainCounts[region_number];
	--
	local region_type = self.regionTypes[region_number];
	-- Done setting up region data.
	-- Set up contingency.
	local fallback_plots = {};
	
	-- Establish scope of center bias.
	local fCenterWidth = (self.centerBias / 100) * iWidth;
	local iNonCenterWidth = math.floor((iWidth - fCenterWidth) / 2)
	local iCenterWidth = iWidth - (iNonCenterWidth * 2);
	local iCenterWestX = (iWestX + iNonCenterWidth) % iW; -- Modulo math to synch coordinate to actual map in case of world wrap.
	local iCenterTestWestX = (iWestX + iNonCenterWidth); -- "Test" values ignore world wrap for easier membership testing.
	local iCenterTestEastX = (iCenterWestX + iCenterWidth - 1);

	local fCenterHeight = (self.centerBias / 100) * iHeight;
	local iNonCenterHeight = math.floor((iHeight - fCenterHeight) / 2)
	local iCenterHeight = iHeight - (iNonCenterHeight * 2);
	local iCenterSouthY = (iSouthY + iNonCenterHeight) % iH;
	local iCenterTestSouthY = (iSouthY + iNonCenterHeight);
	local iCenterTestNorthY = (iCenterTestSouthY + iCenterHeight - 1);

	-- Establish scope of "middle donut", outside the center but inside the outer.
	local fMiddleWidth = (self.middleBias / 100) * iWidth;
	local iOuterWidth = math.floor((iWidth - fMiddleWidth) / 2)
	local iMiddleWidth = iWidth - (iOuterWidth * 2);
	local iMiddleWestX = (iWestX + iOuterWidth) % iW;
	local iMiddleTestWestX = (iWestX + iOuterWidth);
	local iMiddleTestEastX = (iMiddleTestWestX + iMiddleWidth - 1);

	local fMiddleHeight = (self.middleBias / 100) * iHeight;
	local iOuterHeight = math.floor((iHeight - fMiddleHeight) / 2)
	local iMiddleHeight = iHeight - (iOuterHeight * 2);
	local iMiddleSouthY = (iSouthY + iOuterHeight) % iH;
	local iMiddleTestSouthY = (iSouthY + iOuterHeight);
	local iMiddleTestNorthY = (iMiddleTestSouthY + iMiddleHeight - 1); 

	-- Assemble candidates lists.
	local two_plots_from_ocean = {};
	local center_candidates = {};
	local center_river = {};
	local center_coastal = {};
	local center_inland_dry = {};
	local middle_candidates = {};
	local middle_river = {};
	local middle_coastal = {};
	local middle_inland_dry = {};
	local outer_plots = {};
	
	-- Identify candidate plots.
	for region_y = 0, iHeight - 1 do -- When handling global plot indices, process Y first.
		for region_x = 0, iWidth - 1 do
			local x = (region_x + iWestX) % iW; -- Actual coords, adjusted for world wrap, if any.
			local y = (region_y + iSouthY) % iH; --
			local plotIndex = y * iW + x + 1;
			local plot = Map.GetPlot(x, y);
			local plotType = plot:GetPlotType()
			if plotType == PlotTypes.PLOT_HILLS or plotType == PlotTypes.PLOT_LAND then -- Could host a city.
				-- Check if plot is two away from salt water.
				if self.plotDataIsNextToCoast[plotIndex] == true then
					table.insert(two_plots_from_ocean, plotIndex);
				else
					local area_of_plot = plot:GetArea();
					if area_of_plot == iAreaID or iAreaID == -1 then -- This plot is a member, so it goes on at least one candidate list.
						--
						-- Test whether plot is in center bias, middle donut, or outer donut.
						--
						local test_x = region_x + iWestX; -- "Test" coords, ignoring any world wrap and
						local test_y = region_y + iSouthY; -- reaching in to virtual space if necessary.
						if (test_x >= iCenterTestWestX and test_x <= iCenterTestEastX) and 
						   (test_y >= iCenterTestSouthY and test_y <= iCenterTestNorthY) then -- Center Bias.
							table.insert(center_candidates, plotIndex);
							if plot:IsRiverSide() then
								table.insert(center_river, plotIndex);
							elseif plot:IsFreshWater() or self.plotDataIsCoastal[plotIndex] == true then
								table.insert(center_coastal, plotIndex);
							else
								table.insert(center_inland_dry, plotIndex);
							end
						elseif (test_x >= iMiddleTestWestX and test_x <= iMiddleTestEastX) and 
						       (test_y >= iMiddleTestSouthY and test_y <= iMiddleTestNorthY) then
							table.insert(middle_candidates, plotIndex);
							if plot:IsRiverSide() then
								table.insert(middle_river, plotIndex);
							elseif plot:IsFreshWater() or self.plotDataIsCoastal[plotIndex] == true then
								table.insert(middle_coastal, plotIndex);
							else
								table.insert(middle_inland_dry, plotIndex);
							end
						else
							table.insert(outer_plots, plotIndex);
						end
					end
				end
			end
		end
	end

	-- Check how many plots landed on each list.
	local iNumDisqualified = table.maxn(two_plots_from_ocean);
	local iNumCenter = table.maxn(center_candidates);
	local iNumCenterRiver = table.maxn(center_river);
	local iNumCenterCoastLake = table.maxn(center_coastal);
	local iNumCenterInlandDry = table.maxn(center_inland_dry);
	local iNumMiddle = table.maxn(middle_candidates);
	local iNumMiddleRiver = table.maxn(middle_river);
	local iNumMiddleCoastLake = table.maxn(middle_coastal);
	local iNumMiddleInlandDry = table.maxn(middle_inland_dry);
	local iNumOuter = table.maxn(outer_plots);
	
	--[[ Debug printout.
	print("-");
	print("--- Number of Candidate Plots in Region #", region_number, " - Region Type:", region_type, " ---");
	print("-");
	print("Candidates in Center Bias area: ", iNumCenter);
	print("Which are next to river: ", iNumCenterRiver);
	print("Which are next to lake or sea: ", iNumCenterCoastLake);
	print("Which are inland and dry: ", iNumCenterInlandDry);
	print("-");
	print("Candidates in Middle Donut area: ", iNumMiddle);
	print("Which are next to river: ", iNumMiddleRiver);
	print("Which are next to lake or sea: ", iNumMiddleCoastLake);
	print("Which are inland and dry: ", iNumMiddleInlandDry);
	print("-");
	print("Candidate Plots in Outer area: ", iNumOuter);
	print("-");
	print("Disqualified, two plots away from salt water: ", iNumDisqualified);
	print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
	]]--
	
	-- Process lists of candidate plots.
	if iNumCenter + iNumMiddle > 0 then
		local candidate_lists = {};
		if iNumCenterRiver > 0 then -- Process center bias river plots.
			table.insert(candidate_lists, center_river);
		end
		if iNumCenterCoastLake > 0 then -- Process center bias lake or coastal plots.
			table.insert(candidate_lists, center_coastal);
		end
		if iNumCenterInlandDry > 0 then -- Process center bias inland dry plots.
			table.insert(candidate_lists, center_inland_dry);
		end
		if iNumMiddleRiver > 0 then -- Process middle donut river plots.
			table.insert(candidate_lists, middle_river);
		end
		if iNumMiddleCoastLake > 0 then -- Process middle donut lake or coastal plots.
			table.insert(candidate_lists, middle_coastal);
		end
		if iNumMiddleInlandDry > 0 then -- Process middle donut inland dry plots.
			table.insert(candidate_lists, middle_inland_dry);
		end
		--
		for loop, plot_list in ipairs(candidate_lists) do -- Up to six plot lists, processed by priority.
			local election_returns = self:IterateThroughCandidatePlotList(plot_list, region_type)
			-- If any candidates are eligible, choose one.
			local found_eligible = election_returns[1];
			if found_eligible then
				local bestPlotScore = election_returns[2];
				print("Region #", region_number, "has", bestPlotScore, "score.");
				local bestPlotIndex = election_returns[3];
				local x = (bestPlotIndex - 1) % iW;
				local y = (bestPlotIndex - x - 1) / iW;
				self.startingPlots[region_number] = {x, y, bestPlotScore};
				self:PlaceImpactAndRipples(x, y)
				return true, false
			end
			-- If none eligible, check for fallback plot.
			local found_fallback = election_returns[4];
			if found_fallback then
				local bestFallbackScore = election_returns[5];
				print("Region #", region_number, "has", bestFallbackScore, "fallback score.");
				local bestFallbackIndex = election_returns[6];
				local x = (bestFallbackIndex - 1) % iW;
				local y = (bestFallbackIndex - x - 1) / iW;
				table.insert(fallback_plots, {x, y, bestFallbackScore});
			end
		end
	end
	-- Reaching this point means no eligible sites in center bias or middle donut subregions!
	
	-- Process candidates from Outer subregion, if any.
	if iNumOuter > 0 then
		local outer_eligible_list = {};
		local found_eligible = false;
		local found_fallback = false;
		local bestFallbackScore = -50;
		local bestFallbackIndex;
		-- Process list of candidate plots.
		for loop, plotIndex in ipairs(outer_plots) do
			local score, meets_minimums = self:EvaluateCandidatePlot(plotIndex, region_type)
			-- Test current plot against best known plot.
			if meets_minimums == true then
				found_eligible = true;
				table.insert(outer_eligible_list, plotIndex);
			else
				found_fallback = true;
				if score > bestFallbackScore then
					bestFallbackScore = score;
					bestFallbackIndex = plotIndex;
				end
			end
		end
		if found_eligible then -- Iterate through eligible plots and choose the one closest to the center of the region.
			local closestPlot;
			local closestDistance = math.max(iW, iH);
			local bullseyeX = iWestX + (iWidth / 2);
			if bullseyeX < iWestX then -- wrapped around: un-wrap it for test purposes.
				bullseyeX = bullseyeX + iW;
			end
			local bullseyeY = iSouthY + (iHeight / 2);
			if bullseyeY < iSouthY then -- wrapped around: un-wrap it for test purposes.
				bullseyeY = bullseyeY + iH;
			end
			if bullseyeY / 2 ~= math.floor(bullseyeY / 2) then -- Y coord is odd, add .5 to X coord for hex-shift.
				bullseyeX = bullseyeX + 0.5;
			end
			
			for loop, plotIndex in ipairs(outer_eligible_list) do
				local x = (plotIndex - 1) % iW;
				local y = (plotIndex - x - 1) / iW;
				local adjusted_x = x;
				local adjusted_y = y;
				if y / 2 ~= math.floor(y / 2) then -- Y coord is odd, add .5 to X coord for hex-shift.
					adjusted_x = x + 0.5;
				end
				
				if x < iWestX then -- wrapped around: un-wrap it for test purposes.
					adjusted_x = adjusted_x + iW;
				end
				if y < iSouthY then -- wrapped around: un-wrap it for test purposes.
					adjusted_y = y + iH;
				end
				local fDistance = math.sqrt( (adjusted_x - bullseyeX)^2 + (adjusted_y - bullseyeY)^2 );
				if fDistance < closestDistance then -- Found new "closer" plot.
					closestPlot = plotIndex;
					closestDistance = fDistance;
				end
			end
			-- Assign the closest eligible plot as the start point.
			local x = (closestPlot - 1) % iW;
			local y = (closestPlot - x - 1) / iW;
			-- Re-get plot score for inclusion in start plot data.
			local score, meets_minimums = self:EvaluateCandidatePlot(closestPlot, region_type)
			-- Assign this plot as the start for this region.
			self.startingPlots[region_number] = {x, y, score};
			self:PlaceImpactAndRipples(x, y)
			return true, false
		end
		-- Add the fallback plot (best scored plot) from the Outer region to the fallback list.
		if found_fallback then
			local x = (bestFallbackIndex - 1) % iW;
			local y = (bestFallbackIndex - x - 1) / iW;
			table.insert(fallback_plots, {x, y, bestFallbackScore});
		end
	end
	-- Reaching here means no plot in the entire region met the minimum standards for selection.
	
	-- The fallback plot contains the best-scored plots from each test area in this region.
	-- We will compare all the fallback plots and choose the best to be the start plot.
	local iNumFallbacks = table.maxn(fallback_plots);
	if iNumFallbacks > 0 then
		local best_fallback_score = 0
		local best_fallback_x;
		local best_fallback_y;
		for loop, plotData in ipairs(fallback_plots) do
			local score = plotData[3];
			if score > best_fallback_score then
				best_fallback_score = score;
				best_fallback_x = plotData[1];
				best_fallback_y = plotData[2];
			end
		end
		-- Assign the start for this region.
		self.startingPlots[region_number] = {best_fallback_x, best_fallback_y, best_fallback_score};
		self:PlaceImpactAndRipples(best_fallback_x, best_fallback_y)
		bSuccessFlag = true;
	else
		-- This region cannot have a start and something has gone way wrong.
		-- We'll force a one tile grass island in the SW corner of the region and put the start there.
		local forcePlot = Map.GetPlot(iWestX, iSouthY);
		bSuccessFlag = true;
		bForcedPlacementFlag = true;
		forcePlot:SetPlotType(PlotTypes.PLOT_LAND, false, true);
		forcePlot:SetTerrainType(TerrainTypes.TERRAIN_GRASS, false, true);
		forcePlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
		self.startingPlots[region_number] = {iWestX, iSouthY, 0};
		self:PlaceImpactAndRipples(iWestX, iSouthY)
	end

	return bSuccessFlag, bForcedPlacementFlag
end
------------------------------------------------------------------------------
function AssignStartingPlots:FindCoastalStart(region_number)
	-- This function attempts to choose a start position (which is along an ocean) for a single region.
	-- This function returns two boolean flags, indicating the success level of the operation.
	local bSuccessFlag = false; -- Returns true when a start is placed, false when process fails.
	local bForcedPlacementFlag = false; -- Returns true if this region had no eligible starts and one was forced to occur.
	
	-- Obtain data needed to process this region.
	local iW, iH = Map.GetGridSize();
	local region_data_table = self.regionData[region_number];
	local iWestX = region_data_table[1];
	local iSouthY = region_data_table[2];
	local iWidth = region_data_table[3];
	local iHeight = region_data_table[4];
	local iAreaID = region_data_table[5];
	local iMembershipEastX = iWestX + iWidth - 1;
	local iMembershipNorthY = iSouthY + iHeight - 1;
	--
	local terrainCounts = self.regionTerrainCounts[region_number];
	local coastalLandCount = terrainCounts[22];
	--
	local region_type = self.regionTypes[region_number];
	-- Done setting up region data.
	-- Set up contingency.
	local fallback_plots = {};
	
	-- Check region for AlongOcean eligibility.
	if coastalLandCount < 3 then
		-- This region cannot support an Along Ocean start. Try instead to find an inland start for it.
		bSuccessFlag, bForcedPlacementFlag = self:FindStart(region_number)
		if bSuccessFlag == false then
			-- This region cannot have a start and something has gone way wrong.
			-- We'll force a one tile grass island in the SW corner of the region and put the start there.
			local forcePlot = Map.GetPlot(iWestX, iSouthY);
			bForcedPlacementFlag = true;
			forcePlot:SetPlotType(PlotTypes.PLOT_LAND, false, true);
			forcePlot:SetTerrainType(TerrainTypes.TERRAIN_GRASS, false, true);
			forcePlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
			self.startingPlots[region_number] = {iWestX, iSouthY, 0};
			self:PlaceImpactAndRipples(iWestX, iSouthY)
		end
		return bSuccessFlag, bForcedPlacementFlag
	end

	-- Establish scope of center bias.
	local fCenterWidth = (self.centerBias / 100) * iWidth;
	local iNonCenterWidth = math.floor((iWidth - fCenterWidth) / 2)
	local iCenterWidth = iWidth - (iNonCenterWidth * 2);
	local iCenterWestX = (iWestX + iNonCenterWidth) % iW; -- Modulo math to synch coordinate to actual map in case of world wrap.
	local iCenterTestWestX = (iWestX + iNonCenterWidth); -- "Test" values ignore world wrap for easier membership testing.
	local iCenterTestEastX = (iCenterWestX + iCenterWidth - 1);

	local fCenterHeight = (self.centerBias / 100) * iHeight;
	local iNonCenterHeight = math.floor((iHeight - fCenterHeight) / 2)
	local iCenterHeight = iHeight - (iNonCenterHeight * 2);
	local iCenterSouthY = (iSouthY + iNonCenterHeight) % iH;
	local iCenterTestSouthY = (iSouthY + iNonCenterHeight);
	local iCenterTestNorthY = (iCenterTestSouthY + iCenterHeight - 1);

	-- Establish scope of "middle donut", outside the center but inside the outer.
	local fMiddleWidth = (self.middleBias / 100) * iWidth;
	local iOuterWidth = math.floor((iWidth - fMiddleWidth) / 2)
	local iMiddleWidth = iWidth - (iOuterWidth * 2);
	--local iMiddleDiameterX = (iMiddleWidth - iCenterWidth) / 2;
	local iMiddleWestX = (iWestX + iOuterWidth) % iW;
	local iMiddleTestWestX = (iWestX + iOuterWidth);
	local iMiddleTestEastX = (iMiddleTestWestX + iMiddleWidth - 1);

	local fMiddleHeight = (self.middleBias / 100) * iHeight;
	local iOuterHeight = math.floor((iHeight - fMiddleHeight) / 2)
	local iMiddleHeight = iHeight - (iOuterHeight * 2);
	--local iMiddleDiameterY = (iMiddleHeight - iCenterHeight) / 2;
	local iMiddleSouthY = (iSouthY + iOuterHeight) % iH;
	local iMiddleTestSouthY = (iSouthY + iOuterHeight);
	local iMiddleTestNorthY = (iMiddleTestSouthY + iMiddleHeight - 1); 

	-- Assemble candidates lists.
	local center_coastal_plots = {};
	local center_plots_on_river = {};
	local center_fresh_plots = {};
	local center_dry_plots = {};
	local middle_coastal_plots = {};
	local middle_plots_on_river = {};
	local middle_fresh_plots = {};
	local middle_dry_plots = {};
	local outer_coastal_plots = {};
	
	-- Identify candidate plots.
	for region_y = 0, iHeight - 1 do -- When handling global plot indices, process Y first.
		for region_x = 0, iWidth - 1 do
			local x = (region_x + iWestX) % iW; -- Actual coords, adjusted for world wrap, if any.
			local y = (region_y + iSouthY) % iH; --
			local plotIndex = y * iW + x + 1;
			if self.plotDataIsCoastal[plotIndex] == true then -- This plot is a land plot next to an ocean.
				local plot = Map.GetPlot(x, y);
				local plotType = plot:GetPlotType()
				if plotType ~= PlotTypes.PLOT_MOUNTAIN then -- Not a mountain plot.
					local area_of_plot = plot:GetArea();
					if area_of_plot == iAreaID or iAreaID == -1 then -- This plot is a member, so it goes on at least one candidate list.
						--
						-- Test whether plot is in center bias, middle donut, or outer donut.
						--
						local test_x = region_x + iWestX; -- "Test" coords, ignoring any world wrap and
						local test_y = region_y + iSouthY; -- reaching in to virtual space if necessary.
						if (test_x >= iCenterTestWestX and test_x <= iCenterTestEastX) and 
						   (test_y >= iCenterTestSouthY and test_y <= iCenterTestNorthY) then
							table.insert(center_coastal_plots, plotIndex);
							if plot:IsRiverSide() then
								table.insert(center_plots_on_river, plotIndex);
							elseif plot:IsFreshWater() then
								table.insert(center_fresh_plots, plotIndex);
							else
								table.insert(center_dry_plots, plotIndex);
							end
						elseif (test_x >= iMiddleTestWestX and test_x <= iMiddleTestEastX) and 
						       (test_y >= iMiddleTestSouthY and test_y <= iMiddleTestNorthY) then
							table.insert(middle_coastal_plots, plotIndex);
							if plot:IsRiverSide() then
								table.insert(middle_plots_on_river, plotIndex);
							elseif plot:IsFreshWater() then
								table.insert(middle_fresh_plots, plotIndex);
							else
								table.insert(middle_dry_plots, plotIndex);
							end
						else
							table.insert(outer_coastal_plots, plotIndex);
						end
					end
				end
			end
		end
	end
	-- Check how many plots landed on each list.
	local iNumCenterCoastal = table.maxn(center_coastal_plots);
	local iNumCenterRiver = table.maxn(center_plots_on_river);
	local iNumCenterFresh = table.maxn(center_fresh_plots);
	local iNumCenterDry = table.maxn(center_dry_plots);
	local iNumMiddleCoastal = table.maxn(middle_coastal_plots);
	local iNumMiddleRiver = table.maxn(middle_plots_on_river);
	local iNumMiddleFresh = table.maxn(middle_fresh_plots);
	local iNumMiddleDry = table.maxn(middle_dry_plots);
	local iNumOuterCoastal = table.maxn(outer_coastal_plots);
	
	--[[ Debug printout.
	print("-");
	print("--- Number of Candidate Plots next to an ocean in Region #", region_number, " - Region Type:", region_type, " ---");
	print("-");
	print("Coastal Plots in Center Bias area: ", iNumCenterCoastal);
	print("Which are along rivers: ", iNumCenterRiver);
	print("Which are fresh water: ", iNumCenterFresh);
	print("Which are dry: ", iNumCenterDry);
	print("-");
	print("Coastal Plots in Middle Donut area: ", iNumMiddleCoastal);
	print("Which are along rivers: ", iNumMiddleRiver);
	print("Which are fresh water: ", iNumMiddleFresh);
	print("Which are dry: ", iNumMiddleDry);
	print("-");
	print("Coastal Plots in Outer area: ", iNumOuterCoastal);
	print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
	]]--
	
	-- Process lists of candidate plots.
	if iNumCenterCoastal + iNumMiddleCoastal > 0 then
		local candidate_lists = {};
		if iNumCenterRiver > 0 then -- Process center bias river plots.
			table.insert(candidate_lists, center_plots_on_river);
		end
		if iNumCenterFresh > 0 then -- Process center bias fresh water plots that are not rivers.
			table.insert(candidate_lists, center_fresh_plots);
		end
		if iNumCenterDry > 0 then -- Process center bias dry plots.
			table.insert(candidate_lists, center_dry_plots);
		end
		if iNumMiddleRiver > 0 then -- Process middle bias river plots.
			table.insert(candidate_lists, middle_plots_on_river);
		end
		if iNumMiddleFresh > 0 then -- Process middle bias fresh water plots that are not rivers.
			table.insert(candidate_lists, middle_fresh_plots);
		end
		if iNumMiddleDry > 0 then -- Process middle bias dry plots.
			table.insert(candidate_lists, middle_dry_plots);
		end
		--
		for loop, plot_list in ipairs(candidate_lists) do -- Up to six plot lists, processed by priority.
			local election_returns = self:IterateThroughCandidatePlotList(plot_list, region_type)
			-- If any riverside candidates are eligible, choose one.
			local found_eligible = election_returns[1];
			if found_eligible then
				local bestPlotScore = election_returns[2]; 
				local bestPlotIndex = election_returns[3];
				local x = (bestPlotIndex - 1) % iW;
				local y = (bestPlotIndex - x - 1) / iW;
				self.startingPlots[region_number] = {x, y, bestPlotScore};
				self:PlaceImpactAndRipples(x, y)
				return true, false
			end
			-- If none eligible, check for fallback plot.
			local found_fallback = election_returns[4];
			if found_fallback then
				local bestFallbackScore = election_returns[5];
				local bestFallbackIndex = election_returns[6];
				local x = (bestFallbackIndex - 1) % iW;
				local y = (bestFallbackIndex - x - 1) / iW;
				table.insert(fallback_plots, {x, y, bestFallbackScore});
			end
		end
	end
	-- Reaching this point means no strong coastal sites in center bias or middle donut subregions!
	
	-- Process candidates from Outer subregion, if any.
	if iNumOuterCoastal > 0 then
		local outer_eligible_list = {};
		local found_eligible = false;
		local found_fallback = false;
		local bestFallbackScore = -50;
		local bestFallbackIndex;
		-- Process list of candidate plots.
		for loop, plotIndex in ipairs(outer_coastal_plots) do
			local score, meets_minimums = self:EvaluateCandidatePlot(plotIndex, region_type)
			-- Test current plot against best known plot.
			if meets_minimums == true then
				found_eligible = true;
				table.insert(outer_eligible_list, plotIndex);
			else
				found_fallback = true;
				if score > bestFallbackScore then
					bestFallbackScore = score;
					bestFallbackIndex = plotIndex;
				end
			end
		end
		if found_eligible then -- Iterate through eligible plots and choose the one closest to the center of the region.
			local closestPlot;
			local closestDistance = math.max(iW, iH);
			local bullseyeX = iWestX + (iWidth / 2);
			if bullseyeX < iWestX then -- wrapped around: un-wrap it for test purposes.
				bullseyeX = bullseyeX + iW;
			end
			local bullseyeY = iSouthY + (iHeight / 2);
			if bullseyeY < iSouthY then -- wrapped around: un-wrap it for test purposes.
				bullseyeY = bullseyeY + iH;
			end
			if bullseyeY / 2 ~= math.floor(bullseyeY / 2) then -- Y coord is odd, add .5 to X coord for hex-shift.
				bullseyeX = bullseyeX + 0.5;
			end
			
			for loop, plotIndex in ipairs(outer_eligible_list) do
				local x = (plotIndex - 1) % iW;
				local y = (plotIndex - x - 1) / iW;
				local adjusted_x = x;
				local adjusted_y = y;
				if y / 2 ~= math.floor(y / 2) then -- Y coord is odd, add .5 to X coord for hex-shift.
					adjusted_x = x + 0.5;
				end
				
				if x < iWestX then -- wrapped around: un-wrap it for test purposes.
					adjusted_x = adjusted_x + iW;
				end
				if y < iSouthY then -- wrapped around: un-wrap it for test purposes.
					adjusted_y = y + iH;
				end
				local fDistance = math.sqrt( (adjusted_x - bullseyeX)^2 + (adjusted_y - bullseyeY)^2 );
				if fDistance < closestDistance then -- Found new "closer" plot.
					closestPlot = plotIndex;
					closestDistance = fDistance;
				end
			end
			-- Assign the closest eligible plot as the start point.
			local x = (closestPlot - 1) % iW;
			local y = (closestPlot - x - 1) / iW;
			-- Re-get plot score for inclusion in start plot data.
			local score, meets_minimums = self:EvaluateCandidatePlot(closestPlot, region_type)
			-- Assign this plot as the start for this region.
			self.startingPlots[region_number] = {x, y, score};
			self:PlaceImpactAndRipples(x, y)
			return true, false
		end
		-- Add the fallback plot (best scored plot) from the Outer region to the fallback list.
		if found_fallback then
			local x = (bestFallbackIndex - 1) % iW;
			local y = (bestFallbackIndex - x - 1) / iW;
			table.insert(fallback_plots, {x, y, bestFallbackScore});
		end
	end
	-- Reaching here means no plot in the entire region met the minimum standards for selection.
	
	-- The fallback plot contains the best-scored plots from each test area in this region.
	-- This region must be something awful on food, or had too few coastal plots with none being decent.
	-- We will compare all the fallback plots and choose the best to be the start plot.
	local iNumFallbacks = table.maxn(fallback_plots);
	if iNumFallbacks > 0 then
		local best_fallback_score = 0
		local best_fallback_x;
		local best_fallback_y;
		for loop, plotData in ipairs(fallback_plots) do
			local score = plotData[3];
			if score > best_fallback_score then
				best_fallback_score = score;
				best_fallback_x = plotData[1];
				best_fallback_y = plotData[2];
			end
		end
		-- Assign the start for this region.
		self.startingPlots[region_number] = {best_fallback_x, best_fallback_y, best_fallback_score};
		self:PlaceImpactAndRipples(best_fallback_x, best_fallback_y)
		bSuccessFlag = true;
	else
		-- This region cannot support an Along Ocean start. Try instead to find an Inland start for it.
		bSuccessFlag, bForcedPlacementFlag = self:FindStart(region_number)
		if bSuccessFlag == false then
			-- This region cannot have a start and something has gone way wrong.
			-- We'll force a one tile grass island in the SW corner of the region and put the start there.
			local forcePlot = Map.GetPlot(iWestX, iSouthY);
			bSuccessFlag = false;
			bForcedPlacementFlag = true;
			forcePlot:SetPlotType(PlotTypes.PLOT_LAND, false, true);
			forcePlot:SetTerrainType(TerrainTypes.TERRAIN_GRASS, false, true);
			forcePlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
			self.startingPlots[region_number] = {iWestX, iSouthY, 0};
			self:PlaceImpactAndRipples(iWestX, iSouthY)
		end
	end

	return bSuccessFlag, bForcedPlacementFlag
end
------------------------------------------------------------------------------
function AssignStartingPlots:FindStartWithoutRegardToAreaID(region_number, bMustBeCoast)
	-- This function attempts to choose a start position on the best AreaID section within the Region's rectangle.
	-- This function returns two boolean flags, indicating the success level of the operation.
	local bSuccessFlag = false; -- Returns true when a start is placed, false when process fails.
	local bForcedPlacementFlag = false; -- Returns true if this region had no eligible starts and one was forced to occur.
	
	-- Obtain data needed to process this region.
	local iW, iH = Map.GetGridSize();
	local region_data_table = self.regionData[region_number];
	local iWestX = region_data_table[1];
	local iSouthY = region_data_table[2];
	local iWidth = region_data_table[3];
	local iHeight = region_data_table[4];
	local wrapX = Map:IsWrapX();
	local wrapY = Map:IsWrapY();
	local iMembershipEastX = iWestX + iWidth - 1;
	local iMembershipNorthY = iSouthY + iHeight - 1;
	--
	local region_type = self.regionTypes[region_number];
	local fallback_plots = {};
	-- Done setting up region data.

	-- Obtain info on all landmasses wholly or partially within this region, for comparision purposes.
	local regionalFertilityOfLands = {};
	local iRegionalFertilityOfLands = 0;
	local iNumLandPlots = 0;
	local iNumLandAreas = 0;
	local land_area_IDs = {};
	local land_area_plots = {};
	local land_area_fert = {};
	local land_area_plot_lists = {};
	-- Cycle through all plots in the region, checking their Start Placement Fertility and AreaID.
	for region_y = 0, iHeight - 1 do
		for region_x = 0, iWidth - 1 do
			local x = region_x + iWestX;
			local y = region_y + iSouthY;
			local plot = Map.GetPlot(x, y);
			local plotType = plot:GetPlotType()
			if plotType == PlotTypes.PLOT_HILLS or plotType == PlotTypes.PLOT_LAND then -- Land plot, process it.
				iNumLandPlots = iNumLandPlots + 1;
				local iArea = plot:GetArea();
				local plotFertility = self:MeasureStartPlacementFertilityOfPlot(x, y, false); -- Check for coastal land is disabled.
				iRegionalFertilityOfLands = iRegionalFertilityOfLands + plotFertility;
				if TestMembership(land_area_IDs, iArea) == false then -- This plot is the first detected in its AreaID.
					iNumLandAreas = iNumLandAreas + 1;
					table.insert(land_area_IDs, iArea);
					land_area_plots[iArea] = 1;
					land_area_fert[iArea] = plotFertility;
				else -- This AreaID already known.
					land_area_plots[iArea] = land_area_plots[iArea] + 1;
					land_area_fert[iArea] = land_area_fert[iArea] + plotFertility;
				end
			end
		end
	end

	-- Generate empty (non-nil) tables for each Area ID in the plot lists matrix.
	for loop, areaID in ipairs(land_area_IDs) do
		land_area_plot_lists[areaID] = {};
	end
	-- Cycle through all plots in the region again, adding candidates to the applicable AreaID plot list.
	for region_y = 0, iHeight - 1 do
		for region_x = 0, iWidth - 1 do
			local x = region_x + iWestX;
			local y = region_y + iSouthY;
			local i = y * iW + x + 1;
			local plot = Map.GetPlot(x, y);
			local plotType = plot:GetPlotType()
			if plotType == PlotTypes.PLOT_HILLS or plotType == PlotTypes.PLOT_LAND then -- Land plot, process it.
				local iArea = plot:GetArea();
				if self.plotDataIsCoastal[i] == true then
					table.insert(land_area_plot_lists[iArea], i);
				elseif bMustBeCoast == false and self.plotDataIsNextToCoast[i] == false then
					table.insert(land_area_plot_lists[iArea], i);
				end
			end
		end
	end
	
	local best_areas = {};
	local regionAreaListUnsorted = {};
	local regionAreaListSorted = {}; -- Have to make this a separate table, not merely a pointer to the first table.
	for areaNum, fert in pairs(land_area_fert) do
		table.insert(regionAreaListUnsorted, {areaNum, fert});
		table.insert(regionAreaListSorted, fert);
	end
	table.sort(regionAreaListSorted);
	
	-- Match each sorted fertilty value to the matching unsorted AreaID number and record in sequence.
	local iNumAreas = table.maxn(regionAreaListSorted);
	for area_order = iNumAreas, 1, -1 do -- Best areas are at the end of the list, so run the list backward.
		for loop, data_pair in ipairs(regionAreaListUnsorted) do
			local unsorted_fert = data_pair[2];
			if regionAreaListSorted[area_order] == unsorted_fert then
				local unsorted_area_num = data_pair[1];
				table.insert(best_areas, unsorted_area_num);
				-- HAVE TO remove the entry from the table in case of ties on fert value.
				table.remove(regionAreaListUnsorted, loop);
				break
			end
		end
	end

	--[[ Debug printout.
	print("-");
	print("--- Number of Candidate Plots in each landmass in Region #", region_number, " - Region Type:", region_type, " ---");
	print("-");
	for loop, iAreaID in ipairs(best_areas) do
		local fert_rating = land_area_fert[iAreaID];
		local plotCount = table.maxn(land_area_plot_lists[iAreaID]);
		print("* Area ID#", iAreaID, "has fertility rating of", fert_rating, "and candidate plot count of", plotCount); print("-");
	end
	print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
	]]--

	-- Now iterate through areas, from best fertility downward, looking for a site good enough to choose.
	for loop, iAreaID in ipairs(best_areas) do
		local plot_list = land_area_plot_lists[iAreaID];
		local election_returns = self:IterateThroughCandidatePlotList(plot_list, region_type)
		-- If any plots in this area are eligible, choose one.
		local found_eligible = election_returns[1];
		if found_eligible then
			local bestPlotScore = election_returns[2]; 
			local bestPlotIndex = election_returns[3];
			local x = (bestPlotIndex - 1) % iW;
			local y = (bestPlotIndex - x - 1) / iW;
			self.startingPlots[region_number] = {x, y, bestPlotScore};
			self:PlaceImpactAndRipples(x, y)
			return true, false
		end
		-- If none eligible, check for fallback plot.
		local found_fallback = election_returns[4];
		if found_fallback then
			local bestFallbackScore = election_returns[5];
			local bestFallbackIndex = election_returns[6];
			local x = (bestFallbackIndex - 1) % iW;
			local y = (bestFallbackIndex - x - 1) / iW;
			table.insert(fallback_plots, {x, y, bestFallbackScore});
		end
	end
	-- Reaching this point means no strong sites far enough away from any already-placed start points.

	-- We will compare all the fallback plots and choose the best to be the start plot.
	local iNumFallbacks = table.maxn(fallback_plots);
	if iNumFallbacks > 0 then
		local best_fallback_score = 0
		local best_fallback_x;
		local best_fallback_y;
		for loop, plotData in ipairs(fallback_plots) do
			local score = plotData[3];
			if score > best_fallback_score then
				best_fallback_score = score;
				best_fallback_x = plotData[1];
				best_fallback_y = plotData[2];
			end
		end
		-- Assign the start for this region.
		self.startingPlots[region_number] = {best_fallback_x, best_fallback_y, best_fallback_score};
		self:PlaceImpactAndRipples(best_fallback_x, best_fallback_y)
		bSuccessFlag = true;
	else
		-- Somehow, this region has had no eligible plots of any kind.
		-- We'll force a one tile grass island in the SW corner of the region and put the start there.
		local forcePlot = Map.GetPlot(iWestX, iSouthY);
		bSuccessFlag = false;
		bForcedPlacementFlag = true;
		forcePlot:SetPlotType(PlotTypes.PLOT_LAND, false, true);
		forcePlot:SetTerrainType(TerrainTypes.TERRAIN_GRASS, false, true);
		forcePlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
		self.startingPlots[region_number] = {iWestX, iSouthY, 0};
		self:PlaceImpactAndRipples(iWestX, iSouthY)
	end

	return bSuccessFlag, bForcedPlacementFlag
end
------------------------------------------------------------------------------
function CivNeedsMountainStart(civType)
	for row in GameInfo.Civilization_Start_Prefer_Mountain{CivilizationType = civType} do
		if(row.StartPreferMountain == true) then
			return true;
		end
	end
	return false;
end
------------------------------------------------------------------------------
function CivNeedsSnowStart(civType)
	for row in GameInfo.Civilization_Start_Prefer_Snow{CivilizationType = civType} do
		if(row.StartPreferSnow == true) then
			return true;
		end
	end
	return false;
end
------------------------------------------------------------------------------
function AssignStartingPlots:ChooseLocations(args)
	print("Map Generation - Choosing Start Locations for Civilizations");
	local args = args or {};
	local iW, iH = Map.GetGridSize();
	local mustBeCoast = args.mustBeCoast or false; -- if true, will force all starts on salt water coast if possible
	
	-- Defaults for evaluating potential start plots are assigned in .Create but args
	-- passed in here can override. If args value for a field is nil (no arg) then
	-- these assignments will keep the default values in place.
	self.centerBias = args.centerBias or self.centerBias; -- % of radius from region center to examine first
	self.middleBias = args.middleBias or self.middleBias; -- % of radius from region center to check second
	self.minFoodInner = args.minFoodInner or self.minFoodInner;
	self.minProdInner = args.minProdInner or self.minProdInner;
	self.minGoodInner = args.minGoodInner or self.minGoodInner;
	self.minFoodMiddle = args.minFoodMiddle or self.minFoodMiddle;
	self.minProdMiddle = args.minProdMiddle or self.minProdMiddle;
	self.minGoodMiddle = args.minGoodMiddle or self.minGoodMiddle;
	self.minFoodOuter = args.minFoodOuter or self.minFoodOuter;
	self.minProdOuter = args.minProdOuter or self.minProdOuter;
	self.minGoodOuter = args.minGoodOuter or self.minGoodOuter;
	self.maxJunk = args.maxJunk or self.maxJunk;

	-- Determine whether any civ should start near mountain or snow
	for loop = 1, self.iNumCivs do
		local playerNum = self.player_ID_list[loop]; -- MP games can have gaps between player numbers, so we cannot assume a sequential set of IDs.
		local player = Players[playerNum];
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type;
		if CivNeedsMountainStart(civType) then
			self.hasMountainBias = true;
		end
		if CivNeedsSnowStart(civType) then
			self.hasSnowBias = true;
		end 
	end

	-- Measure terrain/plot/feature in regions.
	self:MeasureTerrainInRegions()
	
	-- Determine region type.
	self:DetermineRegionTypes()

	-- Set up list of regions (to be processed in this order).
	--
	-- First, make a list of all average fertility values...
	local regionAssignList = {};
	local averageFertilityListUnsorted = {};
	local averageFertilityListSorted = {}; -- Have to make this a separate table, not merely a pointer to the first table.
	for i, region_data in ipairs(self.regionData) do
		local thisRegionAvgFert = region_data[8];
		table.insert(averageFertilityListUnsorted, {i, thisRegionAvgFert});
		table.insert(averageFertilityListSorted, thisRegionAvgFert);
	end
	-- Now sort the copy low to high.
	table.sort(averageFertilityListSorted);
	-- Finally, match each sorted fertilty value to the matching unsorted region number and record in sequence.
	local iNumRegions = table.maxn(averageFertilityListSorted);
	for region_order = 1, iNumRegions do
		for loop, data_pair in ipairs(averageFertilityListUnsorted) do
			local unsorted_fert = data_pair[2];
			if averageFertilityListSorted[region_order] == unsorted_fert then
				local unsorted_reg_num = data_pair[1];
				table.insert(regionAssignList, unsorted_reg_num);
				-- HAVE TO remove the entry from the table in rare case of ties on fert 
				-- value. Or it will just match this value for a second time, then crash 
				-- when the region it was tied with ends up with nil data.
				table.remove(averageFertilityListUnsorted, loop);
				break
			end
		end
	end

	-- main loop
	for assignIndex = 1, iNumRegions do
		local currentRegionNumber = regionAssignList[assignIndex];
		local bSuccessFlag = false;
		local bForcedPlacementFlag = false;
		
		if self.method == 3 or self.method == 4 then
			bSuccessFlag, bForcedPlacementFlag = self:FindStartWithoutRegardToAreaID(currentRegionNumber, mustBeCoast)
		elseif mustBeCoast == true then
			bSuccessFlag, bForcedPlacementFlag = self:FindCoastalStart(currentRegionNumber)
		else
			bSuccessFlag, bForcedPlacementFlag = self:FindStart(currentRegionNumber)
		end
		
		--[[ Printout for debug only.
		print("- - -");
		print("Start Plot for Region #", currentRegionNumber, " was successful: ", bSuccessFlag);
		print("Start Plot for Region #", currentRegionNumber, " was forced: ", bForcedPlacementFlag);
		]]--		
	end
	--

	--[[ Printout of start plots. Debug use only.
	print("-");
	print("--- Table of results, New Start Finder ---");
	for loop, startData in ipairs(self.startingPlots) do
		print("-");
		print("Region#", loop, " has start plot at: ", startData[1], startData[2], "with Fertility Rating of ", startData[3]);
	end
	print("-");
	print("--- Table of results, New Start Finder ---");
	print("-");
	]]--
	
	--[[ Printout of Impact and Ripple data.
	print("--- Impact and Ripple ---");
	PrintContentsOfTable(self.distanceData)
	print("-");  ]]--
end
------------------------------------------------------------------------------
-- Start of functions tied to BalanceAndAssign()
------------------------------------------------------------------------------
function AssignStartingPlots:AttemptToPlaceBonusResourceAtPlot(x, y, bAllowOasis)
	-- Returns two booleans. First is true if something was placed. Second true if Oasis placed.
	--print("-"); print("Attempting to place a Bonus at: ", x, y);
	local plot = Map.GetPlot(x, y);
	if plot == nil then
		--print("Placement failed, plot was nil.");
		return false
	end
	if plot:GetResourceType(-1) ~= -1 then
		--print("Plot already had a resource.");
		return false
	end
	local terrainType = plot:GetTerrainType()
	if terrainType == TerrainTypes.TERRAIN_SNOW then
		--print("Plot was arctic land buried beneath endless snow.");
		return false
	end
	local featureType = plot:GetFeatureType()
	if featureType == FeatureTypes.FEATURE_OASIS then
		--print("Plot already had an Oasis.");
		return false
	end
	local plotType = plot:GetPlotType()
	-- Randomize resource selected instead -- September 2020, azum4roll
	if featureType == FeatureTypes.FEATURE_JUNGLE then -- Place Banana
		plot:SetResourceType(self.banana_ID, 1);
		--print("Placed Banana.");
		self.amounts_of_resources_placed[self.banana_ID + 1] = self.amounts_of_resources_placed[self.banana_ID + 1] + 1;
		return true, false
	elseif featureType == FeatureTypes.FEATURE_FOREST then -- Place Deer
		plot:SetResourceType(self.deer_ID, 1);
		--print("Placed Deer.");
		self.amounts_of_resources_placed[self.deer_ID + 1] = self.amounts_of_resources_placed[self.deer_ID + 1] + 1;
		return true, false
	elseif plotType == PlotTypes.PLOT_HILLS and featureType == FeatureTypes.NO_FEATURE then
		plot:SetResourceType(self.sheep_ID, 1);
		--print("Placed Sheep.");
		self.amounts_of_resources_placed[self.sheep_ID + 1] = self.amounts_of_resources_placed[self.sheep_ID + 1] + 1;
		return true, false
	elseif plotType == PlotTypes.PLOT_LAND then
		if featureType == FeatureTypes.NO_FEATURE then
			if terrainType == TerrainTypes.TERRAIN_GRASS then -- Place Cows or Bison
				local diceroll = Map.Rand(3, "Selection of Bonus Resource type - Start Normalization LUA");
				local resourceType;
				if diceroll < 2 then
					resourceType = self.cow_ID;
					--print("Placed Cows.");
				else
					resourceType = self.bison_ID;
					--print("Placed Bison.");
				end
				plot:SetResourceType(resourceType, 1);
				self.amounts_of_resources_placed[resourceType + 1] = self.amounts_of_resources_placed[resourceType + 1] + 1;
				return true, false
			elseif terrainType == TerrainTypes.TERRAIN_PLAINS then -- Place Wheat or Bison
				local diceroll = Map.Rand(3, "Selection of Bonus Resource type - Start Normalization LUA");
				local resourceType;
				if diceroll < 2 then
					resourceType = self.wheat_ID;
					--print("Placed Wheat.");
				else
					resourceType = self.bison_ID;
					--print("Placed Bison.");
				end
				plot:SetResourceType(resourceType, 1);
				self.amounts_of_resources_placed[resourceType + 1] = self.amounts_of_resources_placed[resourceType + 1] + 1;
				return true, false
			elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then -- Place Deer
				plot:SetResourceType(self.deer_ID, 1);
				--print("Placed Deer.");
				self.amounts_of_resources_placed[self.deer_ID + 1] = self.amounts_of_resources_placed[self.deer_ID + 1] + 1;
				return true, false
			elseif terrainType == TerrainTypes.TERRAIN_DESERT then
				if plot:IsFreshWater() then -- Place Wheat
					plot:SetResourceType(self.wheat_ID, 1);
					--print("Placed Wheat.");
					self.amounts_of_resources_placed[self.wheat_ID + 1] = self.amounts_of_resources_placed[self.wheat_ID + 1] + 1;
					return true, false
				elseif bAllowOasis then -- Place Oasis
					plot:SetFeatureType(FeatureTypes.FEATURE_OASIS, -1);
					--print("Placed Oasis.");
					return true, true
				--else
					--print("Not allowed to place any more Oasis help at this site.");
				end
			end
		end
	elseif plotType == PlotTypes.PLOT_OCEAN then
		if terrainType == TerrainTypes.TERRAIN_COAST and featureType == FeatureTypes.NO_FEATURE then
			if plot:IsLake() == false then -- Place Fish
				plot:SetResourceType(self.fish_ID, 1);
				--print("Placed Fish.");
				self.amounts_of_resources_placed[self.fish_ID + 1] = self.amounts_of_resources_placed[self.fish_ID + 1] + 1;
				return true, false
			end
		end
	end	
	-- Nothing placed.
	return false, false
end
------------------------------------------------------------------------------
function AssignStartingPlots:AttemptToPlaceHillsAtPlot(x, y)
	-- This function will add hills at a specified plot, if able.
	--print("-"); print("Attempting to add Hills at: ", x, y);
	local plot = Map.GetPlot(x, y);
	if plot == nil then
		--print("Placement failed, plot was nil.");
		return false
	end
	if plot:GetResourceType(-1) ~= -1 then
		--print("Placement failed, plot had a resource.");
		return false
	end
	local plotType = plot:GetPlotType()
	local featureType = plot:GetFeatureType();
	if plotType == PlotTypes.PLOT_OCEAN then
		--print("Placement failed, plot was water.");
		return false
	elseif plot:IsRiverSide() then
		--print("Placement failed, plot was next to river.");
		return false
	elseif featureType == FeatureTypes.FEATURE_FOREST then
		--print("Placement failed, plot had a forest already.");
		return false
	end	
	-- Change the plot type from flatlands to hills and clear any features.
	plot:SetPlotType(PlotTypes.PLOT_HILLS, false, true);
	plot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
	return true
end
------------------------------------------------------------------------------
function AssignStartingPlots:AttemptToPlaceSmallStrategicAtPlot(x, y)
	-- This function will add a small horse or iron source to a specified plot, if able.
	--print("-"); print("Attempting to add Small Strategic resource at: ", x, y);
	local plot = Map.GetPlot(x, y);
	if plot == nil then
		--print("Placement failed, plot was nil.");
		return false
	end
	if plot:GetResourceType(-1) ~= -1 then
		--print("Plot already had a resource.");
		return false
	end
	local plotType = plot:GetPlotType()
	local terrainType = plot:GetTerrainType()
	local featureType = plot:GetFeatureType()
	if plotType ~= PlotTypes.PLOT_LAND then
		--print("Placement failed, plot was not flat land.");
		return false
	elseif featureType == FeatureTypes.NO_FEATURE then
		if terrainType == TerrainTypes.TERRAIN_GRASS or terrainType == TerrainTypes.TERRAIN_PLAINS then -- Could be horses.
			local choice = self.horse_ID;
			local diceroll = Map.Rand(4, "Selection of Strategic Resource type - Start Normalization LUA");
			if diceroll == 2 then
				choice = self.iron_ID;
				--print("Placed Iron.");
			else
				--print("Placed Horse.");
			end
			plot:SetResourceType(choice, 2);
			self.amounts_of_resources_placed[choice + 1] = self.amounts_of_resources_placed[choice + 1] + 2;
		else -- Can't be horses.
			plot:SetResourceType(self.iron_ID, 2);
			self.amounts_of_resources_placed[self.iron_ID + 1] = self.amounts_of_resources_placed[self.iron_ID + 1] + 2;
			--print("Placed Iron.");
		end
		return true
	end
	--print("Placement failed, feature in the way.");
	return false
end
------------------------------------------------------------------------------
function AssignStartingPlots:AddStrategicBalanceResources(region_number)
	-- This function adds the required Strategic Resources to start plots, for
	-- games that have selected to enable Strategic Resource Balance.
	local iW, iH = Map.GetGridSize();
	local start_point_data = self.startingPlots[region_number];
	local x = start_point_data[1];
	local y = start_point_data[2];
	local plot = Map.GetPlot(x, y);
	local plotIndex = y * iW + x + 1;
	local wrapX = Map:IsWrapX();
	local wrapY = Map:IsWrapY();
	local odd = self.firstRingYIsOdd;
	local even = self.firstRingYIsEven;
	local nextX, nextY, plot_adjustments;
	local iron_list, horse_list, oil_list = {}, {}, {};
	local iron_fallback, horse_fallback, oil_fallback = {}, {}, {};
	
	--print("- Adding Strategic Balance Resources for start location in Region#", region_number);
	
	for ripple_radius = 4, 6 do
		local currentX = x - ripple_radius;
		local currentY = y;
		for direction_index = 1, 6 do
			for plot_to_handle = 1, ripple_radius do
				if currentY / 2 > math.floor(currentY / 2) then
					plot_adjustments = odd[direction_index];
				else
					plot_adjustments = even[direction_index];
				end
				nextX = currentX + plot_adjustments[1];
				nextY = currentY + plot_adjustments[2];
				if wrapX == false and (nextX < 0 or nextX >= iW) then
					-- X is out of bounds.
				elseif wrapY == false and (nextY < 0 or nextY >= iH) then
					-- Y is out of bounds.
				else
					local realX = nextX;
					local realY = nextY;
					if wrapX then
						realX = realX % iW;
					end
					if wrapY then
						realY = realY % iH;
					end
					-- We've arrived at the correct x and y for the current plot.
					local plot = Map.GetPlot(realX, realY);
					local plotType = plot:GetPlotType()
					local terrainType = plot:GetTerrainType()
					local featureType = plot:GetFeatureType()
					local plotIndex = realY * iW + realX + 1;
					-- Check this plot for resource placement eligibility.
					if plotType == PlotTypes.PLOT_HILLS and featureType ~= FeatureTypes.FEATURE_JUNGLE then
						if ripple_radius < 5 then
							table.insert(iron_list, plotIndex)
						else
							table.insert(iron_fallback, plotIndex)
						end
					elseif plotType == PlotTypes.PLOT_LAND then
						if featureType == FeatureTypes.NO_FEATURE then
							if terrainType == TerrainTypes.TERRAIN_TUNDRA or terrainType == TerrainTypes.TERRAIN_DESERT then
								if plot:IsFreshWater() then
									table.insert(horse_fallback, plotIndex)
								else
									table.insert(iron_fallback, plotIndex)
								end
							elseif terrainType == TerrainTypes.TERRAIN_PLAINS or terrainType == TerrainTypes.TERRAIN_GRASS then
								if ripple_radius < 5 then
									table.insert(horse_list, plotIndex)
								else
									table.insert(horse_fallback, plotIndex)
								end
								table.insert(iron_fallback, plotIndex)
							elseif terrainType == TerrainTypes.TERRAIN_SNOW then
								if ripple_radius < 5 then
									table.insert(iron_list, plotIndex)
								else
									table.insert(iron_fallback, plotIndex)
								end
							end
						elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then		
							table.insert(horse_list, plotIndex)
							table.insert(iron_fallback, plotIndex)
						elseif featureType == FeatureTypes.FEATURE_FOREST then		
							if ripple_radius < 5 then
								table.insert(iron_list, plotIndex)
							else
								table.insert(iron_fallback, plotIndex)
							end
						end
					end
					currentX, currentY = nextX, nextY;
				end
			end
		end
	end

	local uran_amt, horse_amt, oil_amt, iron_amt, coal_amt, alum_amt = self:GetSmallStrategicResourceQuantityValues()
	local shuf_list;
	local placed_iron, placed_horse = false, false;

	if table.maxn(iron_list) > 0 then
		shuf_list = GetShuffledCopyOfTable(iron_list)
		iNumLeftToPlace = self:PlaceSpecificNumberOfResources(self.iron_ID, iron_amt, 1, 1, -1, 0, 0, shuf_list);
		if iNumLeftToPlace == 0 then
			placed_iron = true;
		end
	end
	if table.maxn(horse_list) > 0 then
		shuf_list = GetShuffledCopyOfTable(horse_list)
		iNumLeftToPlace = self:PlaceSpecificNumberOfResources(self.horse_ID, horse_amt, 1, 1, -1, 0, 0, shuf_list);
		if iNumLeftToPlace == 0 then
			placed_horse = true;
		end
	end
	if placed_iron == false and table.maxn(iron_fallback) > 0 then
		shuf_list = GetShuffledCopyOfTable(iron_fallback)
		iNumLeftToPlace = self:PlaceSpecificNumberOfResources(self.iron_ID, iron_amt, 1, 1, -1, 0, 0, shuf_list);
	end
	if placed_horse == false and table.maxn(horse_fallback) > 0 then
		shuf_list = GetShuffledCopyOfTable(horse_fallback)
		iNumLeftToPlace = self:PlaceSpecificNumberOfResources(self.horse_ID, horse_amt, 1, 1, -1, 0, 0, shuf_list);
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:AttemptToPlaceForestAtGrassPlot(x, y)
	-- Function modified May 2011 to boost production at heavy grass starts. - BT
	-- Now placing Stone instead of Cows. Returns true if Stone is placed.
	-- Now placing Forest instead of Stone. -- September 2020, azum4roll
	--print("-"); print("Attempting to place Forest at: ", x, y);
	local plot = Map.GetPlot(x, y);
	if plot == nil then
		--print("Placement failed, plot was nil.");
		return false
	end
	if plot:GetResourceType(-1) ~= -1 then
		--print("Plot already had a resource.");
		return false
	end
	local plotType = plot:GetPlotType()
	if plotType == PlotTypes.PLOT_LAND then
		local featureType = plot:GetFeatureType()
		if featureType == FeatureTypes.NO_FEATURE then
			local terrainType = plot:GetTerrainType()
			if terrainType == TerrainTypes.TERRAIN_GRASS then -- Place Forest
				plot:SetFeatureType(FeatureTypes.FEATURE_FOREST, -1);
				--print("Placed Forest.");
				return true
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:AttemptToPlaceStoneAtGrassPlot(x, y)
	-- Function modified May 2011 to boost production at heavy grass starts. - BT
	-- Now placing Stone instead of Cows. Returns true if Stone is placed.
	--print("-"); print("Attempting to place Stone at: ", x, y);
	local plot = Map.GetPlot(x, y);
	if plot == nil then
		--print("Placement failed, plot was nil.");
		return false
	end
	if plot:GetResourceType(-1) ~= -1 then
		--print("Plot already had a resource.");
		return false
	end
	local plotType = plot:GetPlotType()
	if plotType == PlotTypes.PLOT_LAND then
		local featureType = plot:GetFeatureType()
		if featureType == FeatureTypes.NO_FEATURE then
			local terrainType = plot:GetTerrainType()
			if terrainType == TerrainTypes.TERRAIN_GRASS then -- Place Stone
				plot:SetResourceType(self.stone_ID, 1);
				--print("Placed Stone.");
				self.amounts_of_resources_placed[self.stone_ID + 1] = self.amounts_of_resources_placed[self.stone_ID + 1] + 1;
				return true
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:NormalizeStartLocation(region_number)
	--[[ This function measures the value of land in two rings around a given start
	     location, primarily for the purpose of determining how much support the site
	     requires in the form of Bonus Resources. Numerous assumptions are built in 
	     to this operation that would need to be adjusted for any modifications to 
	     terrain or resources types and yields, or to game rules about rivers and 
	     other map elements. Nothing is hardcoded in a way that puts it out of the 
	     reach of modders, but any mods including changes to map elements may have a
	     significant workload involved with rebalancing the start finder and the 
	     resource distribution to fit them properly to a mod's custom needs. I have
	     labored to document every function and method in detail to make it as easy
	     as possible to modify this system.  -- Bob Thomas - April 15, 2010  ]]--
	-- 
	local iW, iH = Map.GetGridSize();
	local start_point_data = self.startingPlots[region_number];
	local x = start_point_data[1];
	local y = start_point_data[2];
	local plot = Map.GetPlot(x, y);
	local plotIndex = y * iW + x + 1;
	local isEvenY = true;
	if y / 2 > math.floor(y / 2) then
		isEvenY = false;
	end
	local wrapX = Map:IsWrapX();
	local wrapY = Map:IsWrapY();
	local innerFourFood, innerThreeFood, innerTwoFood, innerHills, innerForest, innerOneHammer, innerOcean = 0, 0, 0, 0, 0, 0, 0;
	local outerFourFood, outerThreeFood, outerTwoFood, outerHills, outerForest, outerOneHammer, outerOcean = 0, 0, 0, 0, 0, 0, 0;
	local innerCanHaveBonus, outerCanHaveBonus, innerBadTiles, outerBadTiles = 0, 0, 0, 0;
	local iNumFoodBonusNeeded = 0;
	local iNumNativeTwoFoodFirstRing, iNumNativeTwoFoodSecondRing = 0, 0; -- Cities must begin the game with at least three native 2F tiles, one in first ring.
	local search_table = {};
	
	-- Remove any feature Ice from the first ring.
	self:GenerateLuxuryPlotListsAtCitySite(x, y, 1, true)
	
	-- Set up Conditions checks.
	local alongOcean = false;
	local nextToLake = false;
	local isRiver = false;
	local nearRiver = false;
	local nearMountain = false;
	local forestCount, jungleCount = 0, 0;

	-- Check start plot to see if it's adjacent to saltwater.
	if self.plotDataIsCoastal[plotIndex] == true then
		alongOcean = true;
	end
	
	-- Check start plot to see if it's on a river.
	if plot:IsRiver() then
		isRiver = true;
	end

	-- Data Chart for early game tile potentials
	--
	-- 4F:	Flood Plains, Grass on fresh water (includes forest and marsh).
	-- 3F:	Dry Grass, Plains on fresh water (includes forest and jungle), Tundra on fresh water (includes forest), Oasis
	-- 2F:  Dry Plains, Lake, all remaining Jungles.
	--
	-- 1H:	Plains, Jungle on Plains

	-- Adding evaluation of grassland and plains for balance boost of bonus Cows for heavy grass starts. -1/26/2011 BT
	local iNumGrass, iNumPlains = 0, 0;

	-- Evaluate First Ring
	if isEvenY then
		search_table = self.firstRingYIsEven;
	else
		search_table = self.firstRingYIsOdd;
	end

	for loop, plot_adjustments in ipairs(search_table) do
		local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
		--
		if searchX < 0 or searchX >= iW or searchY < 0 or searchY >= iH then
			-- This plot does not exist. It's off the map edge.
			innerBadTiles = innerBadTiles + 1;
		else
			local searchPlot = Map.GetPlot(searchX, searchY)
			local plotType = searchPlot:GetPlotType()
			local terrainType = searchPlot:GetTerrainType()
			local featureType = searchPlot:GetFeatureType()
			--
			if plotType == PlotTypes.PLOT_MOUNTAIN then
				local nearMountain = true;
				innerBadTiles = innerBadTiles + 1;
			elseif plotType == PlotTypes.PLOT_OCEAN then
				if searchPlot:IsLake() then
					nextToLake = true;
					if featureType == FeatureTypes.FEATURE_ICE then
						innerBadTiles = innerBadTiles + 1;
					else
						innerTwoFood = innerTwoFood + 1;
						iNumNativeTwoFoodFirstRing = iNumNativeTwoFoodFirstRing + 1;
					end
				else
					if featureType == FeatureTypes.FEATURE_ICE then
						innerBadTiles = innerBadTiles + 1;
					else
						innerOcean = innerOcean + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1;
					end
				end
			else -- Habitable plot.
				if featureType == FeatureTypes.FEATURE_JUNGLE then
					jungleCount = jungleCount + 1;
					iNumNativeTwoFoodFirstRing = iNumNativeTwoFoodFirstRing + 1;
				elseif featureType == FeatureTypes.FEATURE_FOREST then
					forestCount = forestCount + 1;
				end
				if searchPlot:IsRiver() then
					nearRiver = true;
				end
				if plotType == PlotTypes.PLOT_HILLS then
					innerHills = innerHills + 1;
					if featureType == FeatureTypes.FEATURE_JUNGLE then
						innerTwoFood = innerTwoFood + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1;
					elseif featureType == FeatureTypes.FEATURE_FOREST then
						innerCanHaveBonus = innerCanHaveBonus + 1;
--					elseif terrainType == TerrainTypes.TERRAIN_GRASS then
--						iNumGrass = iNumGrass + 1;
--					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
--						iNumPlains = iNumPlains + 1;
					end
				elseif featureType == FeatureTypes.FEATURE_OASIS then
					innerThreeFood = innerThreeFood + 1;
					iNumNativeTwoFoodFirstRing = iNumNativeTwoFoodFirstRing + 1;
				elseif searchPlot:IsFreshWater() then
					if terrainType == TerrainTypes.TERRAIN_GRASS then
						innerFourFood = innerFourFood + 1;
						iNumGrass = iNumGrass + 1;
						if featureType ~= FeatureTypes.FEATURE_MARSH then
							innerCanHaveBonus = innerCanHaveBonus + 1;
						end
						if featureType == FeatureTypes.FEATURE_FOREST then
							innerForest = innerForest + 1;
						end
						if featureType == FeatureTypes.NO_FEATURE then
							iNumNativeTwoFoodFirstRing = iNumNativeTwoFoodFirstRing + 1;
						end
					elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then
						innerFourFood = innerFourFood + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1;
						iNumNativeTwoFoodFirstRing = iNumNativeTwoFoodFirstRing + 1;
					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
						innerThreeFood = innerThreeFood + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1;
						iNumPlains = iNumPlains + 1;
						if featureType == FeatureTypes.FEATURE_FOREST then
							innerForest = innerForest + 1;
						else
							innerOneHammer = innerOneHammer + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
						innerThreeFood = innerThreeFood + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1;
						if featureType == FeatureTypes.FEATURE_FOREST then
							innerForest = innerForest + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_DESERT then
						innerBadTiles = innerBadTiles + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1; -- Can have Oasis.
					else -- Snow
						innerBadTiles = innerBadTiles + 1;
					end
				else -- Dry Flatlands
					if terrainType == TerrainTypes.TERRAIN_GRASS then
						innerThreeFood = innerThreeFood + 1;
						iNumGrass = iNumGrass + 1;
						if featureType ~= FeatureTypes.FEATURE_MARSH then
							innerCanHaveBonus = innerCanHaveBonus + 1;
						end
						if featureType == FeatureTypes.FEATURE_FOREST then
							innerForest = innerForest + 1;
						end
						if featureType == FeatureTypes.NO_FEATURE then
							iNumNativeTwoFoodFirstRing = iNumNativeTwoFoodFirstRing + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
						innerTwoFood = innerTwoFood + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1;
						iNumPlains = iNumPlains + 1;
						if featureType == FeatureTypes.FEATURE_FOREST then
							innerForest = innerForest + 1;
						else
							innerOneHammer = innerOneHammer + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
						innerCanHaveBonus = innerCanHaveBonus + 1;
						if featureType == FeatureTypes.FEATURE_FOREST then
							innerForest = innerForest + 1;
						else
							innerBadTiles = innerBadTiles + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_DESERT then
						innerBadTiles = innerBadTiles + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1; -- Can have Oasis.
					else -- Snow
						innerBadTiles = innerBadTiles + 1;
					end
				end
			end
		end
	end
				
	-- Evaluate Second Ring
	if isEvenY then
		search_table = self.secondRingYIsEven;
	else
		search_table = self.secondRingYIsOdd;
	end

	for loop, plot_adjustments in ipairs(search_table) do
		local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
		local plot = Map.GetPlot(x, y);
		--
		--
		if searchX < 0 or searchX >= iW or searchY < 0 or searchY >= iH then
			-- This plot does not exist. It's off the map edge.
			outerBadTiles = outerBadTiles + 1;
		else
			local searchPlot = Map.GetPlot(searchX, searchY)
			local plotType = searchPlot:GetPlotType()
			local terrainType = searchPlot:GetTerrainType()
			local featureType = searchPlot:GetFeatureType()
			--
			if plotType == PlotTypes.PLOT_MOUNTAIN then
				local nearMountain = true;
				outerBadTiles = outerBadTiles + 1;
			elseif plotType == PlotTypes.PLOT_OCEAN then
				if searchPlot:IsLake() then
					if featureType == FeatureTypes.FEATURE_ICE then
						outerBadTiles = outerBadTiles + 1;
					else
						outerTwoFood = outerTwoFood + 1;
						iNumNativeTwoFoodSecondRing = iNumNativeTwoFoodSecondRing + 1;
					end
				else
					if featureType == FeatureTypes.FEATURE_ICE then
						outerBadTiles = outerBadTiles + 1;
					elseif terrainType == TerrainTypes.TERRAIN_COAST then
						outerCanHaveBonus = outerCanHaveBonus + 1;
						outerOcean = outerOcean + 1;
					end
				end
			else -- Habitable plot.
				if featureType == FeatureTypes.FEATURE_JUNGLE then
					jungleCount = jungleCount + 1;
					iNumNativeTwoFoodSecondRing = iNumNativeTwoFoodSecondRing + 1;
				elseif featureType == FeatureTypes.FEATURE_FOREST then
					forestCount = forestCount + 1;
				end
				if searchPlot:IsRiver() then
					nearRiver = true;
				end
				if plotType == PlotTypes.PLOT_HILLS then
					outerHills = outerHills + 1;
					if featureType == FeatureTypes.FEATURE_JUNGLE then
						outerTwoFood = outerTwoFood + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1;
					elseif featureType == FeatureTypes.FEATURE_FOREST then
						outerCanHaveBonus = outerCanHaveBonus + 1;
--					elseif terrainType == TerrainTypes.TERRAIN_GRASS then
--						iNumGrass = iNumGrass + 1;
--					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
--						iNumPlains = iNumPlains + 1;
					end
				elseif featureType == FeatureTypes.FEATURE_OASIS then
					innerThreeFood = innerThreeFood + 1;
					iNumNativeTwoFoodSecondRing = iNumNativeTwoFoodSecondRing + 1;
				elseif searchPlot:IsFreshWater() then
					if terrainType == TerrainTypes.TERRAIN_GRASS then
						outerFourFood = outerFourFood + 1;
						iNumGrass = iNumGrass + 1;
						if featureType ~= FeatureTypes.FEATURE_MARSH then
							outerCanHaveBonus = outerCanHaveBonus + 1;
						end
						if featureType == FeatureTypes.FEATURE_FOREST then
							outerForest = outerForest + 1;
						end
						if featureType == FeatureTypes.NO_FEATURE then
							iNumNativeTwoFoodSecondRing = iNumNativeTwoFoodSecondRing + 1;
						end
					elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then
						outerFourFood = outerFourFood + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1;
						iNumNativeTwoFoodSecondRing = iNumNativeTwoFoodSecondRing + 1;
					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
						outerThreeFood = outerThreeFood + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1;
						iNumPlains = iNumPlains + 1;
						if featureType == FeatureTypes.FEATURE_FOREST then
							outerForest = outerForest + 1;
						else
							outerOneHammer = outerOneHammer + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
						outerThreeFood = outerThreeFood + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1;
						if featureType == FeatureTypes.FEATURE_FOREST then
							outerForest = outerForest + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_DESERT then
						outerBadTiles = outerBadTiles + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1; -- Can have Oasis.
					else -- Snow
						outerBadTiles = outerBadTiles + 1;
					end
				else -- Dry Flatlands
					if terrainType == TerrainTypes.TERRAIN_GRASS then
						outerThreeFood = outerThreeFood + 1;
						iNumGrass = iNumGrass + 1;
						if featureType ~= FeatureTypes.FEATURE_MARSH then
							outerCanHaveBonus = outerCanHaveBonus + 1;
						end
						if featureType == FeatureTypes.FEATURE_FOREST then
							outerForest = outerForest + 1;
						end
						if featureType == FeatureTypes.NO_FEATURE then
							iNumNativeTwoFoodSecondRing = iNumNativeTwoFoodSecondRing + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
						outerTwoFood = outerTwoFood + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1;
						iNumPlains = iNumPlains + 1;
						if featureType == FeatureTypes.FEATURE_FOREST then
							outerForest = outerForest + 1;
						else
							outerOneHammer = outerOneHammer + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
						outerCanHaveBonus = outerCanHaveBonus + 1;
						if featureType == FeatureTypes.FEATURE_FOREST then
							outerForest = outerForest + 1;
						else
							outerBadTiles = outerBadTiles + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_DESERT then
						outerBadTiles = outerBadTiles + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1; -- Can have Oasis.
					else -- Snow
						outerBadTiles = outerBadTiles + 1;
					end
				end
			end
		end
	end
	
	-- Adjust the hammer situation, if needed.
	local innerHammerScore = (4 * innerHills) + (2 * innerForest) + innerOneHammer;
	local outerHammerScore = (2 * outerHills) + outerForest + outerOneHammer;
	local earlyHammerScore = (2 * innerForest) + outerForest + innerOneHammer + outerOneHammer;
	-- If drastic shortage, attempt to add a hill to first ring.
	if (outerHammerScore < 8 and innerHammerScore < 2) or innerHammerScore == 0 then -- Change a first ring plot to Hills.
		if isEvenY then
			randomized_first_ring_adjustments = GetShuffledCopyOfTable(self.firstRingYIsEven);
		else
			randomized_first_ring_adjustments = GetShuffledCopyOfTable(self.firstRingYIsOdd);
		end
		for attempt = 1, 6 do
			local plot_adjustments = randomized_first_ring_adjustments[attempt];
			local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
			-- Attempt to place a Hill at the currently chosen plot.
			local placedHill = self:AttemptToPlaceHillsAtPlot(searchX, searchY);
			if placedHill == true then
				innerHammerScore = innerHammerScore + 4;
				print("Added hills next to hammer-poor start plot at ", x, y);
				break
			elseif attempt == 6 then
				print("FAILED to add hills next to hammer-poor start plot at ", x, y);
			end
		end
	end
	
	-- Add mandatory Iron and Horse to every start if Strategic Balance option is enabled.
	if self.resBalance then
		self:AddStrategicBalanceResources(region_number)
	end
	
	-- If early hammers will be too short, attempt to add a small Horse or Iron to second ring.
	-- Add a forest instead -- September 2020, azum4roll
	if innerHammerScore < 3 and earlyHammerScore < 6 then -- Add a forest to second ring.
		if isEvenY then
			randomized_second_ring_adjustments = GetShuffledCopyOfTable(self.secondRingYIsEven);
		else
			randomized_second_ring_adjustments = GetShuffledCopyOfTable(self.secondRingYIsOdd);
		end
		for attempt = 1, 12 do
			local plot_adjustments = randomized_second_ring_adjustments[attempt];
			local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
			-- Attempt to place a Forest at the currently chosen plot.
			local plot = Map.GetPlot(searchX, searchY);
			if plot:GetResourceType(-1) == -1 then -- No resource here, safe to proceed.
				local plotType = plot:GetPlotType();
				local terrainType = plot:GetTerrainType();
				local featureType = plot:GetFeatureType();
				if plotType == PlotTypes.PLOT_LAND then
					if terrainType ~= TerrainTypes.TERRAIN_DESERT and terrainType ~= TerrainTypes.TERRAIN_SNOW then
						if featureType == FeatureTypes.NO_FEATURE then
							plot:SetFeatureType(FeatureTypes.FEATURE_FOREST, -1);
							break;
						end
					end
				end
			end
			if attempt == 12 then
				print("FAILED to add forest near hammer-poor start plot at ", x, y);
			end
		end
	end
	
	-- Rate the food situation.
	local innerFoodScore = (4 * innerFourFood) + (2 * innerThreeFood) + innerTwoFood;
	local outerFoodScore = (4 * outerFourFood) + (2 * outerThreeFood) + outerTwoFood;
	local totalFoodScore = innerFoodScore + outerFoodScore;
	local nativeTwoFoodTiles = iNumNativeTwoFoodFirstRing + iNumNativeTwoFoodSecondRing;
	
	-- Six levels for Bonus Resource support, from zero to five.
	if totalFoodScore < 4 and innerFoodScore == 0 then
		iNumFoodBonusNeeded = 5;
	elseif totalFoodScore < 6 then
		iNumFoodBonusNeeded = 4;
	elseif totalFoodScore < 8 then
		iNumFoodBonusNeeded = 3;
	elseif totalFoodScore < 12 and innerFoodScore < 5 then
		iNumFoodBonusNeeded = 3;
	elseif totalFoodScore < 17 and innerFoodScore < 9 then
		iNumFoodBonusNeeded = 2;
	elseif nativeTwoFoodTiles <= 1 then
		iNumFoodBonusNeeded = 2;
	elseif totalFoodScore < 24 and innerFoodScore < 11 then
		iNumFoodBonusNeeded = 1;
	elseif nativeTwoFoodTiles == 2 or iNumNativeTwoFoodFirstRing == 0 then
		iNumFoodBonusNeeded = 1;
	elseif totalFoodScore < 20 then
		iNumFoodBonusNeeded = 1;
	end
	
	-- Check for Legendary Start resource option.
	if self.legStart then
		iNumFoodBonusNeeded = iNumFoodBonusNeeded + 2;
	end
	
	-- Check to see if a Grass tile needs to be added at an all-plains site with zero native 2-food tiles in first two rings.
	if nativeTwoFoodTiles == 0 and iNumFoodBonusNeeded < 3 then
		local odd = self.firstRingYIsOdd;
		local even = self.firstRingYIsEven;
		local plot_list = {};
		-- For notes on how the hex-iteration works, refer to PlaceResourceImpact()
		local ripple_radius = 2;
		local currentX = x - ripple_radius;
		local currentY = y;
		for direction_index = 1, 6 do
			for plot_to_handle = 1, ripple_radius do
				if currentY / 2 > math.floor(currentY / 2) then
					plot_adjustments = odd[direction_index];
				else
					plot_adjustments = even[direction_index];
				end
				nextX = currentX + plot_adjustments[1];
				nextY = currentY + plot_adjustments[2];
				if wrapX == false and (nextX < 0 or nextX >= iW) then
					-- X is out of bounds.
				elseif wrapY == false and (nextY < 0 or nextY >= iH) then
					-- Y is out of bounds.
				else
					local realX = nextX;
					local realY = nextY;
					if wrapX then
						realX = realX % iW;
					end
					if wrapY then
						realY = realY % iH;
					end
					-- We've arrived at the correct x and y for the current plot.
					local plot = Map.GetPlot(realX, realY);
					if plot:GetResourceType(-1) == -1 then -- No resource here, safe to proceed.
						local plotType = plot:GetPlotType()
						local terrainType = plot:GetTerrainType()
						local featureType = plot:GetFeatureType()
						local plotIndex = realY * iW + realX + 1;
						-- Now check this plot for eligibility to be converted to flat open grassland.
						if plotType == PlotTypes.PLOT_LAND then
							if terrainType == TerrainTypes.TERRAIN_PLAINS then
								if featureType == FeatureTypes.NO_FEATURE then
									table.insert(plot_list, plotIndex);
								end
							end
						end
					end
				end
				currentX, currentY = nextX, nextY;
			end
		end
		local iNumConversionCandidates = table.maxn(plot_list);
		if iNumConversionCandidates == 0 then
			iNumFoodBonusNeeded = 3;
		else
			print("-"); print("*** START HAD NO 2-FOOD TILES, YET ONLY QUALIFIED FOR 2 BONUS; CONVERTING A PLAINS TO GRASS! ***"); print("-");
			local diceroll = 1 + Map.Rand(iNumConversionCandidates, "Choosing plot to convert to Grass near food-poor Plains start - LUA");
			local conversionPlotIndex = plot_list[diceroll];
			local conv_x = (conversionPlotIndex - 1) % iW;
			local conv_y = (conversionPlotIndex - conv_x - 1) / iW;
			local plot = Map.GetPlot(conv_x, conv_y);
			plot:SetTerrainType(TerrainTypes.TERRAIN_GRASS, false, false)
			self:PlaceResourceImpact(conv_x, conv_y, 1, 0) -- Disallow strategic resources at this plot, to keep it a farm plot.
		end
	end
	-- Add Bonus Resources to food-poor start positions.
	if iNumFoodBonusNeeded > 0 then
		local maxBonusesPossible = innerCanHaveBonus + outerCanHaveBonus;

		print("-");
		print("Food-Poor start ", x, y, " needs ", iNumFoodBonusNeeded, " Bonus, with ", maxBonusesPossible, " eligible plots.");
		print("-");

		local innerPlaced, outerPlaced = 0, 0;
		local randomized_first_ring_adjustments, randomized_second_ring_adjustments, randomized_third_ring_adjustments;
		if isEvenY then
			randomized_first_ring_adjustments = GetShuffledCopyOfTable(self.firstRingYIsEven);
			randomized_second_ring_adjustments = GetShuffledCopyOfTable(self.secondRingYIsEven);
			randomized_third_ring_adjustments = GetShuffledCopyOfTable(self.thirdRingYIsEven);
		else
			randomized_first_ring_adjustments = GetShuffledCopyOfTable(self.firstRingYIsOdd);
			randomized_second_ring_adjustments = GetShuffledCopyOfTable(self.secondRingYIsOdd);
			randomized_third_ring_adjustments = GetShuffledCopyOfTable(self.thirdRingYIsOdd);
		end
		local tried_all_first_ring = false;
		local tried_all_second_ring = false;
		local tried_all_third_ring = false;
		local allow_oasis = true; -- Permanent flag. (We don't want to place more than one Oasis per location).
		local placedOasis; -- Records returning result from each attempt.
		while iNumFoodBonusNeeded > 0 do
			if ((innerPlaced < 2 and innerCanHaveBonus > 0) or (self.legStart and innerPlaced < 3 and innerCanHaveBonus > 0))
			  and tried_all_first_ring == false then
				-- Add bonus to inner ring.
				for attempt = 1, 6 do
					local plot_adjustments = randomized_first_ring_adjustments[attempt];
					local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
					-- Attempt to place a Bonus at the currently chosen plot.
					local placedBonus, placedOasis = self:AttemptToPlaceBonusResourceAtPlot(searchX, searchY, allow_oasis);
					if placedBonus == true then
						if allow_oasis == true and placedOasis == true then -- First oasis was placed on this pass, so change permission.
							allow_oasis = false;
						end
						print("Placed a Bonus in first ring at ", searchX, searchY);
						innerPlaced = innerPlaced + 1;
						innerCanHaveBonus = innerCanHaveBonus - 1;
						iNumFoodBonusNeeded = iNumFoodBonusNeeded - 1;
						break
					elseif attempt == 6 then
						tried_all_first_ring = true;
					end
				end

			elseif ((innerPlaced + outerPlaced < 5 and outerCanHaveBonus > 0) or (self.legStart and innerPlaced + outerPlaced < 4 and outerCanHaveBonus > 0))
			  and tried_all_second_ring == false then
				-- Add bonus to second ring.
				for attempt = 1, 12 do
					local plot_adjustments = randomized_second_ring_adjustments[attempt];
					local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
					-- Attempt to place a Bonus at the currently chosen plot.
					local placedBonus, placedOasis = self:AttemptToPlaceBonusResourceAtPlot(searchX, searchY, allow_oasis);
					if placedBonus == true then
						if allow_oasis == true and placedOasis == true then -- First oasis was placed on this pass, so change permission.
							allow_oasis = false;
						end
						print("Placed a Bonus in second ring at ", searchX, searchY);
						outerPlaced = outerPlaced + 1;
						outerCanHaveBonus = outerCanHaveBonus - 1;
						iNumFoodBonusNeeded = iNumFoodBonusNeeded - 1;
						break
					elseif attempt == 12 then
						tried_all_second_ring = true;
					end
				end

			elseif tried_all_third_ring == false then
				-- Add bonus to third ring.
				for attempt = 1, 18 do
					local plot_adjustments = randomized_third_ring_adjustments[attempt];
					local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
					-- Attempt to place a Bonus at the currently chosen plot.
					local placedBonus, placedOasis = self:AttemptToPlaceBonusResourceAtPlot(searchX, searchY, allow_oasis);
					if placedBonus == true then
						if allow_oasis == true and placedOasis == true then -- First oasis was placed on this pass, so change permission.
							allow_oasis = false;
						end
						print("Placed a Bonus in third ring at ", searchX, searchY);
						iNumFoodBonusNeeded = iNumFoodBonusNeeded - 1;
						break
					elseif attempt == 18 then
						tried_all_third_ring = true;
					end
				end
				
			else -- Tried everywhere, have to give up.
				break				
			end
		end
	end

	-- Check for heavy grass and light plains. Adding Stone if grass count is high and plains count is low. - May 2011, BT
	-- Changed to check for only FLAT grass/plains and add forests instead. - September 2020, azum4roll
	local iNumStoneNeeded = 0;
	if iNumGrass >= 9 and iNumPlains == 0 then
		iNumStoneNeeded = 2;
	elseif iNumGrass >= 6 and iNumPlains <= 4 then
		iNumStoneNeeded = 1;
	end
	if iNumStoneNeeded > 0 then -- Add Forest to this grass start.
		local stonePlaced, innerPlaced = 0, 0;
		local randomized_first_ring_adjustments, randomized_second_ring_adjustments;
		if isEvenY then
			randomized_first_ring_adjustments = GetShuffledCopyOfTable(self.firstRingYIsEven);
			randomized_second_ring_adjustments = GetShuffledCopyOfTable(self.secondRingYIsEven);
		else
			randomized_first_ring_adjustments = GetShuffledCopyOfTable(self.firstRingYIsOdd);
			randomized_second_ring_adjustments = GetShuffledCopyOfTable(self.secondRingYIsOdd);
		end
		local tried_all_first_ring = false;
		local tried_all_second_ring = false;
		while iNumStoneNeeded > 0 do
			if innerPlaced < 1 and tried_all_first_ring == false then
				-- Add bonus to inner ring.
				for attempt = 1, 6 do
					local plot_adjustments = randomized_first_ring_adjustments[attempt];
					local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
					-- Attempt to place Forest at the currently chosen plot.
					local placedBonus = self:AttemptToPlaceForestAtGrassPlot(searchX, searchY);
					if placedBonus == true then
						print("Placed Forest in first ring at ", searchX, searchY);
						innerPlaced = innerPlaced + 1;
						iNumStoneNeeded = iNumStoneNeeded - 1;
						break
					elseif attempt == 6 then
						tried_all_first_ring = true;
					end
				end

			elseif tried_all_second_ring == false then
				-- Add bonus to second ring.
				for attempt = 1, 12 do
					local plot_adjustments = randomized_second_ring_adjustments[attempt];
					local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
					-- Attempt to place Forest at the currently chosen plot.
					local placedBonus = self:AttemptToPlaceForestAtGrassPlot(searchX, searchY);
					if placedBonus == true then
						print("Placed Forest in second ring at ", searchX, searchY);
						iNumStoneNeeded = iNumStoneNeeded - 1;
						break
					elseif attempt == 12 then
						tried_all_second_ring = true;
					end
				end

			else -- Tried everywhere, have to give up.
				break
			end
		end
	end
	
	-- Record conditions at this start location.
	local results_table = {alongOcean, nextToLake, isRiver, nearRiver, nearMountain, forestCount, jungleCount};
	self.startLocationConditions[region_number] = results_table;
end
------------------------------------------------------------------------------
function AssignStartingPlots:FindFallbackForUnmatchedRegionPriority(iRegionType, regions_still_available)
	-- This function acts upon Civs with a single Region Priority who were unable to be 
	-- matched to a region of their priority type. We will scan remaining regions for the
	-- one with the most plots of the matching terrain type.
	local iMostTundra, iMostTundraForest, iMostJungle, iMostForest, iMostDesert = 0, 0, 0, 0, 0;
	local iMostHills, iMostPlains, iMostGrass, iMostHybrid = 0, 0, 0, 0;
	local bestTundra, bestTundraForest, bestJungle, bestForest, bestDesert = -1, -1, -1, -1, -1;
	local bestHills, bestPlains, bestGrass, bestHybrid = -1, -1, -1, -1;

	for loop, region_number in ipairs(regions_still_available) do
		local terrainCounts = self.regionTerrainCounts[region_number];
		--local totalPlots = terrainCounts[1];
		--local areaPlots = terrainCounts[2];
		--local waterCount = terrainCounts[3];
		local flatlandsCount = terrainCounts[4];
		local hillsCount = terrainCounts[5];
		local peaksCount = terrainCounts[6];
		--local lakeCount = terrainCounts[7];
		--local coastCount = terrainCounts[8];
		--local oceanCount = terrainCounts[9];
		--local iceCount = terrainCounts[10];
		local grassCount = terrainCounts[11];
		local plainsCount = terrainCounts[12];
		local desertCount = terrainCounts[13];
		local tundraCount = terrainCounts[14];
		local snowCount = terrainCounts[15];
		local forestCount = terrainCounts[16];
		local jungleCount = terrainCounts[17];
		local marshCount = terrainCounts[18];
		--local riverCount = terrainCounts[19];
		local floodplainCount = terrainCounts[20];
		local oasisCount = terrainCounts[21];
		--local coastalLandCount = terrainCounts[22];
		--local nextToCoastCount = terrainCounts[23];
		
		if iRegionType == 1 then -- Find fallback for Tundra priority
			-- MOD.Barathor: Updated -- Removed the snowCount addition.  Why potentially favor a small tundra area with lots of nearly useless snow over a decent tundra area that could be near fertile land?
			if tundraCount > iMostTundra then
				bestTundra = region_number;
				iMostTundra = tundraCount;
			end
			--[[	MOD.Barathor: Disabled -- Why have a fallback to place a tundra civ in a forest region (with no jungle)?  Especially since it could take it away from other civs with a forest bias!
			if forestCount > iMostTundraForest and jungleCount == 0 then
				bestTundraForest = region_number;
				iMostTundraForest = forestCount;
			end
			]]--
		elseif iRegionType == 2 then -- Find fallback for Jungle priority
			if jungleCount > iMostJungle then
				bestJungle = region_number;
				iMostJungle = jungleCount;
			end
		elseif iRegionType == 3 then -- Find fallback for Forest priority
			if forestCount > iMostForest then
				bestForest = region_number;
				iMostForest = forestCount;
			end
		elseif iRegionType == 4 then -- Find fallback for Desert priority
			-- MOD.Barathor: Updated -- Keeping the addition of floodplainCount and oasisCount since they're beneficial, but lessening to only half the value.  This way it doesn't so easily trump larger desert regions.
			if desertCount + math.floor((floodplainCount + oasisCount)/2) > iMostDesert then
				bestDesert = region_number;
				iMostDesert = desertCount + math.floor((floodplainCount + oasisCount)/2);
			end
		elseif iRegionType == 5 then -- Find fallback for Hills priority
			-- MOD.Barathor: Updated -- Keeping the addition of peaksCount since it's beneficial to the Inca (and doesn't affect workable tiles, like marsh does), but lessening to only half the value.
			if hillsCount + math.floor(peaksCount/2) > iMostHills then
				bestHills = region_number;
				iMostHills = hillsCount + math.floor(peaksCount/2);
			end
		elseif iRegionType == 6 then -- Find fallback for Plains priority
			if plainsCount > iMostPlains then
				bestPlains = region_number;
				iMostPlains = plainsCount;
			end
		elseif iRegionType == 7 then -- Find fallback for Grass priority
			-- MOD.Barathor: Updated -- Removed the marshCount addition, which would double count tiles with marsh.  Other than the Dutch, other grass civs really don't benefit from marsh.
							-- The Dutch will still usually find marshes if placed within a grass region.  And better methods can be implemented to give them some marsh at placement.
			if grassCount > iMostGrass then
				bestGrass = region_number;
				iMostGrass = grassCount;
			end
		elseif iRegionType == 8 then -- Find fallback for Hybrid priority
			-- MOD.Barathor: The way this one is determined is a bit off, but I'm leaving it as is since civs shouldn't really be given a hybrid bias anyway.
			if grassCount + plainsCount > iMostHybrid then
				bestHybrid = region_number;
				iMostHybrid = grassCount + plainsCount;
			end
		end
	end
	
	
	--[[	MOD.Barathor: Disabled
	if iRegionType == 1 then
		if bestTundra ~= -1 then
			return bestTundra
		elseif bestTundraForest ~= -1 then
			return bestTundraForest
		end
	]]--
	if iRegionType == 1 and bestTundra ~= -1 then		-- MOD.Barathor: New
		return bestTundra
	elseif iRegionType == 2 and bestJungle ~= -1 then
		return bestJungle
	elseif iRegionType == 3 and bestForest ~= -1 then
		return bestForest
	elseif iRegionType == 4 and bestDesert ~= -1 then
		return bestDesert
	elseif iRegionType == 5 and bestHills ~= -1 then
		return bestHills
	elseif iRegionType == 6 and bestPlains ~= -1 then
		return bestPlains
	elseif iRegionType == 7 and bestGrass ~= -1 then
		return bestGrass
	elseif iRegionType == 8 and bestHybrid ~= -1 then
		return bestHybrid
	end

	return -1
end
------------------------------------------------------------------------------
function AssignStartingPlots:NormalizeTeamLocations()
	-- This function will reorganize which Civs are assigned to which start
	-- locations, to ensure that Civs on the same team start near one another.
	--Game:NormalizeStartingPlotLocations() 
end
------------------------------------------------------------------------------
function AssignStartingPlots:BalanceAndAssign()
	-- This function determines what level of Bonus Resource support a location
	-- may need, identifies compatibility with civ-specific biases, and places starts.

	-- Normalize each start plot location.
	local iNumStarts = table.maxn(self.startingPlots);
	for region_number = 1, iNumStarts do
		self:NormalizeStartLocation(region_number)
	end

	-- Check Game Option for disabling civ-specific biases.
	-- If they are to be disabled, then all civs are simply assigned to start plots at random.
	local bDisableStartBias = Game.GetCustomOption("GAMEOPTION_DISABLE_START_BIAS");
	if bDisableStartBias == 1 then
		--print("-"); print("ALERT: Civ Start Biases have been selected to be Disabled!"); print("-");
		local playerList = {};
		for loop = 1, self.iNumCivs do
			local player_ID = self.player_ID_list[loop];
			table.insert(playerList, player_ID);
		end
		local playerListShuffled = GetShuffledCopyOfTable(playerList)
		for region_number, player_ID in ipairs(playerListShuffled) do
			local x = self.startingPlots[region_number][1];
			local y = self.startingPlots[region_number][2];
			local start_plot = Map.GetPlot(x, y)
			local player = Players[player_ID]
			player:SetStartingPlot(start_plot)
		end
		-- If this is a team game (any team has more than one Civ in it) then make 
		-- sure team members start near each other if possible. (This may scramble 
		-- Civ biases in some cases, but there is no cure).
		if self.bTeamGame == true then
			self:NormalizeTeamLocations()
		end
		-- Done with un-biased Civ placement.
		return
	end

	-- If the process reaches here, civ-specific start-location biases are enabled. Handle them now.
	-- Create a randomized list of all regions. As a region gets assigned, we'll remove it from the list.
	local all_regions = {};
	for loop = 1, self.iNumCivs do
		table.insert(all_regions, loop);
	end
	local regions_still_available = GetShuffledCopyOfTable(all_regions)

	local civs_needing_coastal_start = {};
	local civs_priority_coastal_start = {};
	local civs_needing_river_start = {};
	local civs_needing_region_priority = {};
	local civs_needing_region_avoid = {};
	local civs_needing_mountain_start = {};
	local civs_needing_snow_start = {};
	local regions_with_coastal_start = {};
	local regions_with_lake_start = {};
	local regions_with_river_start = {};
	local regions_with_near_river_start = {};
	local civ_status = table.fill(false, GameDefines.MAX_MAJOR_CIVS); -- Have to account for possible gaps in player ID numbers, for MP.
	local region_status = table.fill(false, self.iNumCivs);
	local priority_lists = {};
	local avoid_lists = {};
	local iNumCoastalCivs, iNumRiverCivs, iNumPriorityCivs, iNumAvoidCivs, iNumMountainCivs, iNumSnowCivs = 0, 0, 0, 0, 0, 0;
	local iNumCoastalCivsRemaining, iNumRiverCivsRemaining, iNumPriorityCivsRemaining, iNumAvoidCivsRemaining, iNumMountainCivsRemaining, iNumSnowCivsRemaining = 0, 0, 0, 0, 0, 0;
	
	--print("-"); print("-"); print("--- DEBUG READOUT OF PLAYER START ASSIGNMENTS ---"); print("-");
	
	-- Generate lists of player needs. Each additional need type is subordinate to those
	-- that come before. In other words, each Civ can have only one need type.
	for loop = 1, self.iNumCivs do
		local playerNum = self.player_ID_list[loop]; -- MP games can have gaps between player numbers, so we cannot assume a sequential set of IDs.
		local player = Players[playerNum];
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type;
		print("Player", playerNum, "of Civ Type", civType);
		if CivNeedsMountainStart(civType) then
			print("- - - - - - - needs Mountain Start!"); print("-");
			iNumMountainCivs = iNumMountainCivs + 1;
			iNumMountainCivsRemaining = iNumMountainCivsRemaining + 1;
			table.insert(civs_needing_mountain_start, playerNum);
		elseif CivNeedsSnowStart(civType) then
			print("- - - - - - - needs Snow Start!"); print("-");
			iNumSnowCivs = iNumSnowCivs + 1;
			iNumSnowCivsRemaining = iNumSnowCivsRemaining + 1;
			table.insert(civs_needing_snow_start, playerNum);
		elseif CivNeedsCoastalStart(civType) then
			print("- - - - - - - needs Coastal Start!"); print("-");
			iNumCoastalCivs = iNumCoastalCivs + 1;
			iNumCoastalCivsRemaining = iNumCoastalCivsRemaining + 1;
			table.insert(civs_needing_coastal_start, playerNum);
			local bPlaceFirst = CivNeedsPlaceFirstCoastalStart(civType);
			if bPlaceFirst then
				print("- - - - - - - needs to Place First!"); print("-");
				table.insert(civs_priority_coastal_start, playerNum);
			end
		elseif CivNeedsRiverStart(civType) then
			print("- - - - - - - needs River Start!"); print("-");
			iNumRiverCivs = iNumRiverCivs + 1;
			iNumRiverCivsRemaining = iNumRiverCivsRemaining + 1;
			table.insert(civs_needing_river_start, playerNum);
		elseif GetNumStartRegionPriorityForCiv(civType) > 0 then
			print("- - - - - - - needs Region Priority!"); print("-");
			local table_of_this_civs_priority_needs = GetStartRegionPriorityListForCiv_GetIDs(civType)
			iNumPriorityCivs = iNumPriorityCivs + 1;
			iNumPriorityCivsRemaining = iNumPriorityCivsRemaining + 1;
			table.insert(civs_needing_region_priority, playerNum);
			priority_lists[playerNum] = table_of_this_civs_priority_needs;
		elseif GetNumStartRegionAvoidForCiv(civType) > 0 then
			print("- - - - - - - needs Region Avoid!"); print("-");
			local table_of_this_civs_avoid_needs = GetStartRegionAvoidListForCiv_GetIDs(civType)
			iNumAvoidCivs = iNumAvoidCivs + 1;
			iNumAvoidCivsRemaining = iNumAvoidCivsRemaining + 1;
			table.insert(civs_needing_region_avoid, playerNum);
			avoid_lists[playerNum] = table_of_this_civs_avoid_needs;
		end
	end
	--[[
	print("Civs with Coastal Bias:", iNumCoastalCivs);
	print("Civs with River Bias:", iNumRiverCivs);
	print("Civs with Region Priority:", iNumPriorityCivs);
	print("Civs with Region Avoid:", iNumAvoidCivs); print("-");
	]]--
	-- Handle Snow Bias (maximum one civ for now)
	if iNumSnowCivs > 0 then
		for region_number, bAlreadyAssigned in ipairs(region_status) do
			if not bAlreadyAssigned and self.regionTypes[region_number] == 10 then
				local iPlayerNum = civs_needing_snow_start[1];
				local x = self.startingPlots[region_number][1];
				local y = self.startingPlots[region_number][2];
				local plot = Map.GetPlot(x, y);
				local player = Players[iPlayerNum];
				player:SetStartingPlot(plot);
				print("Player Number", iPlayerNum, "with Snow bias assigned to Region#", region_number, "at Plot", x, y);
				iNumSnowCivsRemaining = iNumSnowCivsRemaining - 1;
				region_status[region_number] = true;
				civ_status[iPlayerNum + 1] = true;
				local a, b, c = IdentifyTableIndex(regions_still_available, region_number);
				if a then
					table.remove(regions_still_available, c[1]);
				end
			end
		end
	end

	-- Handle Mountain Bias (maximum one civ for now)
	if iNumMountainCivs > 0 then
		for region_number, bAlreadyAssigned in ipairs(region_status) do
			if not bAlreadyAssigned and self.regionTypes[region_number] == 9 then
				local iPlayerNum = civs_needing_mountain_start[1];
				local x = self.startingPlots[region_number][1];
				local y = self.startingPlots[region_number][2];
				local plot = Map.GetPlot(x, y);
				local player = Players[iPlayerNum];
				player:SetStartingPlot(plot);
				print("Player Number", iPlayerNum, "with Mountain bias assigned to Region#", region_number, "at Plot", x, y);
				iNumMountainCivsRemaining = iNumMountainCivsRemaining - 1;
				region_status[region_number] = true;
				civ_status[iPlayerNum + 1] = true;
				local a, b, c = IdentifyTableIndex(regions_still_available, region_number);
				if a then
					table.remove(regions_still_available, c[1]);
				end
			end
		end
	end

	-- Handle Coastal Start Bias
	if iNumCoastalCivs > 0 then
		-- Generate lists of regions eligible to support a coastal start.
		local iNumRegionsWithCoastalStart, iNumRegionsWithLakeStart, iNumUnassignableCoastStarts = 0, 0, 0;
		for region_number, bAlreadyAssigned in ipairs(region_status) do
			if bAlreadyAssigned == false then
				if self.startLocationConditions[region_number][1] == true then
					--print("Region#", region_number, "has a Coastal Start.");
					iNumRegionsWithCoastalStart = iNumRegionsWithCoastalStart + 1;
					table.insert(regions_with_coastal_start, region_number);
				end
			end
		end
		if iNumRegionsWithCoastalStart < iNumCoastalCivs then
			for region_number, bAlreadyAssigned in ipairs(region_status) do
				if bAlreadyAssigned == false then
					if self.startLocationConditions[region_number][2] == true and
					   self.startLocationConditions[region_number][1] == false then
						--print("Region#", region_number, "has a Lake Start.");
						iNumRegionsWithLakeStart = iNumRegionsWithLakeStart + 1;
						table.insert(regions_with_lake_start, region_number);
					end
				end
			end
		end
		if iNumRegionsWithCoastalStart + iNumRegionsWithLakeStart < iNumCoastalCivs then
			iNumUnassignableCoastStarts = iNumCoastalCivs - (iNumRegionsWithCoastalStart + iNumRegionsWithLakeStart);
		end
		-- Now assign those with coastal bias to start locations, where possible.
		--print("iNumCoastalCivs: " .. iNumCoastalCivs);
		--print("iNumUnassignableCoastStarts: " .. iNumUnassignableCoastStarts);
		if iNumCoastalCivs - iNumUnassignableCoastStarts > 0 then
			-- create non-priority coastal start list
			local non_priority_coastal_start = {};
			for loop1, iPlayerNum1 in ipairs(civs_needing_coastal_start) do
				local bAdd = true;
				for loop2, iPlayerNum2 in ipairs(civs_priority_coastal_start) do
					if (iPlayerNum1 == iPlayerNum2) then
						bAdd = false;
					end
				end
				if bAdd then
					table.insert(non_priority_coastal_start, iPlayerNum1);
				end
			end
			
			local shuffled_priority_coastal_start = GetShuffledCopyOfTable(civs_priority_coastal_start);
			local shuffled_non_priority_coastal_start = GetShuffledCopyOfTable(non_priority_coastal_start);
			local shuffled_coastal_civs = {};
			
			-- insert priority coastal starts first
			for loop, iPlayerNum in ipairs(shuffled_priority_coastal_start) do
				table.insert(shuffled_coastal_civs, iPlayerNum);
			end
			
			-- insert non-priority coastal starts second
			for loop, iPlayerNum in ipairs(shuffled_non_priority_coastal_start) do
				table.insert(shuffled_coastal_civs, iPlayerNum);
			end			
			--[[
			for loop, iPlayerNum in ipairs(shuffled_coastal_civs) do
				print("shuffled_coastal_civs[" .. loop .. "]: " .. iPlayerNum);
			end
			]]--
			local shuffled_coastal_regions, shuffled_lake_regions;
			local current_lake_index = 1;
			if iNumRegionsWithCoastalStart > 0 then
				shuffled_coastal_regions = GetShuffledCopyOfTable(regions_with_coastal_start);
			end
			if iNumRegionsWithLakeStart > 0 then
				shuffled_lake_regions = GetShuffledCopyOfTable(regions_with_lake_start);
			end
			for loop, playerNum in ipairs(shuffled_coastal_civs) do
				if loop > iNumCoastalCivs - iNumUnassignableCoastStarts then
					--print("Ran out of Coastal and Lake start locations to assign to Coastal Bias.");
					break
				end
				-- Assign next randomly chosen civ in line to next randomly chosen eligible region.
				if loop <= iNumRegionsWithCoastalStart then
					-- Assign this civ to a region with coastal start.
					local choose_this_region = shuffled_coastal_regions[loop];
					local x = self.startingPlots[choose_this_region][1];
					local y = self.startingPlots[choose_this_region][2];
					local plot = Map.GetPlot(x, y);
					local player = Players[playerNum];
					player:SetStartingPlot(plot);
					--print("Player Number", playerNum, "assigned a COASTAL START BIAS location in Region#", choose_this_region, "at Plot", x, y);
					region_status[choose_this_region] = true;
					civ_status[playerNum + 1] = true;
					iNumCoastalCivsRemaining = iNumCoastalCivsRemaining - 1;
					local a, b, c = IdentifyTableIndex(civs_needing_coastal_start, playerNum)
					if a then
						table.remove(civs_needing_coastal_start, c[1]);
					end
					local a, b, c = IdentifyTableIndex(regions_still_available, choose_this_region)
					if a then
						table.remove(regions_still_available, c[1]);
					end
				else
					-- Out of coastal starts, assign this civ to region with lake start.
					local choose_this_region = shuffled_lake_regions[current_lake_index];
					local x = self.startingPlots[choose_this_region][1];
					local y = self.startingPlots[choose_this_region][2];
					local plot = Map.GetPlot(x, y);
					local player = Players[playerNum];
					player:SetStartingPlot(plot);
					--print("Player Number", playerNum, "with Coastal Bias assigned a fallback Lake location in Region#", choose_this_region, "at Plot", x, y);
					region_status[choose_this_region] = true;
					civ_status[playerNum + 1] = true;
					iNumCoastalCivsRemaining = iNumCoastalCivsRemaining - 1;
					local a, b, c = IdentifyTableIndex(civs_needing_coastal_start, playerNum)
					if a then
						table.remove(civs_needing_coastal_start, c[1]);
					end
					local a, b, c = IdentifyTableIndex(regions_still_available, choose_this_region)
					if a then
						table.remove(regions_still_available, c[1]);
					end
					current_lake_index = current_lake_index + 1;
				end
			end
		--else
			--print("Either no civs required a Coastal Start, or no Coastal Starts were available.");
		end
	end
	
	-- Handle River bias
	if iNumRiverCivs > 0 or iNumCoastalCivsRemaining > 0 then
		-- Generate lists of regions eligible to support a river start.
		local iNumRegionsWithRiverStart, iNumRegionsNearRiverStart, iNumUnassignableRiverStarts = 0, 0, 0;
		for region_number, bAlreadyAssigned in ipairs(region_status) do
			if bAlreadyAssigned == false then
				if self.startLocationConditions[region_number][3] == true then
					iNumRegionsWithRiverStart = iNumRegionsWithRiverStart + 1;
					table.insert(regions_with_river_start, region_number);
				end
			end
		end
		for region_number, bAlreadyAssigned in ipairs(region_status) do
			if bAlreadyAssigned == false then
				if self.startLocationConditions[region_number][4] == true and
				   self.startLocationConditions[region_number][3] == false then
					iNumRegionsNearRiverStart = iNumRegionsNearRiverStart + 1;
					table.insert(regions_with_near_river_start, region_number);
				end
			end
		end
		if iNumRegionsWithRiverStart + iNumRegionsNearRiverStart < iNumRiverCivs then
			iNumUnassignableRiverStarts = iNumRiverCivs - (iNumRegionsWithRiverStart + iNumRegionsNearRiverStart);
		end
		-- Now assign those with river bias to start locations, where possible.
		-- Also handle fallback placement for coastal bias that failed to find a match.
		if iNumRiverCivs - iNumUnassignableRiverStarts > 0 then
			local shuffled_river_civs = GetShuffledCopyOfTable(civs_needing_river_start);
			local shuffled_river_regions, shuffled_near_river_regions;
			if iNumRegionsWithRiverStart > 0 then
				shuffled_river_regions = GetShuffledCopyOfTable(regions_with_river_start);
			end
			if iNumRegionsNearRiverStart > 0 then
				shuffled_near_river_regions = GetShuffledCopyOfTable(regions_with_near_river_start);
			end
			for loop, playerNum in ipairs(shuffled_river_civs) do
				if loop > iNumRiverCivs - iNumUnassignableRiverStarts then
					--print("Ran out of River and Near-River start locations to assign to River Bias.");
					break
				end
				-- Assign next randomly chosen civ in line to next randomly chosen eligible region.
				if loop <= iNumRegionsWithRiverStart then
					-- Assign this civ to a region with river start.
					local choose_this_region = shuffled_river_regions[loop];
					local x = self.startingPlots[choose_this_region][1];
					local y = self.startingPlots[choose_this_region][2];
					local plot = Map.GetPlot(x, y);
					local player = Players[playerNum];
					player:SetStartingPlot(plot);
					--print("Player Number", playerNum, "assigned a RIVER START BIAS location in Region#", choose_this_region, "at Plot", x, y);
					region_status[choose_this_region] = true;
					civ_status[playerNum + 1] = true;
					local a, b, c = IdentifyTableIndex(regions_still_available, choose_this_region)
					if a then
						table.remove(regions_still_available, c[1]);
					end
				else
					-- Assign this civ to a region where a river is near the start.
					local choose_this_region = shuffled_near_river_regions[loop - iNumRegionsWithRiverStart];
					local x = self.startingPlots[choose_this_region][1];
					local y = self.startingPlots[choose_this_region][2];
					local plot = Map.GetPlot(x, y);
					local player = Players[playerNum];
					player:SetStartingPlot(plot);
					--print("Player Number", playerNum, "with River Bias assigned a fallback 'near river' location in Region#", choose_this_region, "at Plot", x, y);
					region_status[choose_this_region] = true;
					civ_status[playerNum + 1] = true;
					local a, b, c = IdentifyTableIndex(regions_still_available, choose_this_region)
					if a then
						table.remove(regions_still_available, c[1]);
					end
				end
			end
		end
		-- Now handle any fallbacks for unassigned coastal bias.
		if iNumCoastalCivsRemaining > 0 and iNumRiverCivs < iNumRegionsWithRiverStart + iNumRegionsNearRiverStart then
			local iNumFallbacksWithRiverStart, iNumFallbacksNearRiverStart = 0, 0;
			local fallbacks_with_river_start, fallbacks_with_near_river_start = {}, {};
			for region_number, bAlreadyAssigned in ipairs(region_status) do
				if bAlreadyAssigned == false then
					if self.startLocationConditions[region_number][3] == true then
						iNumFallbacksWithRiverStart = iNumFallbacksWithRiverStart + 1;
						table.insert(fallbacks_with_river_start, region_number);
					end
				end
			end
			for region_number, bAlreadyAssigned in ipairs(region_status) do
				if bAlreadyAssigned == false then
					if self.startLocationConditions[region_number][4] == true and
					   self.startLocationConditions[region_number][3] == false then
						iNumFallbacksNearRiverStart = iNumFallbacksNearRiverStart + 1;
						table.insert(fallbacks_with_near_river_start, region_number);
					end
				end
			end
			if iNumFallbacksWithRiverStart + iNumFallbacksNearRiverStart > 0 then
			
				local shuffled_coastal_fallback_civs = GetShuffledCopyOfTable(civs_needing_coastal_start);
				local shuffled_river_fallbacks, shuffled_near_river_fallbacks;
				if iNumFallbacksWithRiverStart > 0 then
					shuffled_river_fallbacks = GetShuffledCopyOfTable(fallbacks_with_river_start);
				end
				if iNumFallbacksNearRiverStart > 0 then
					shuffled_near_river_fallbacks = GetShuffledCopyOfTable(fallbacks_with_near_river_start);
				end
				for loop, playerNum in ipairs(shuffled_coastal_fallback_civs) do
					if loop > iNumFallbacksWithRiverStart + iNumFallbacksNearRiverStart then
						--print("Ran out of River and Near-River start locations to assign as fallbacks for Coastal Bias.");
						break
					end
					-- Assign next randomly chosen civ in line to next randomly chosen eligible region.
					if loop <= iNumFallbacksWithRiverStart then
						-- Assign this civ to a region with river start.
						local choose_this_region = shuffled_river_fallbacks[loop];
						local x = self.startingPlots[choose_this_region][1];
						local y = self.startingPlots[choose_this_region][2];
						local plot = Map.GetPlot(x, y);
						local player = Players[playerNum];
						player:SetStartingPlot(plot);
						--print("Player Number", playerNum, "with Coastal Bias assigned a fallback river location in Region#", choose_this_region, "at Plot", x, y);
						region_status[choose_this_region] = true;
						civ_status[playerNum + 1] = true;
						local a, b, c = IdentifyTableIndex(regions_still_available, choose_this_region)
						if a then
							table.remove(regions_still_available, c[1]);
						end
					else
						-- Assign this civ to a region where a river is near the start.
						local choose_this_region = shuffled_near_river_fallbacks[loop - iNumRegionsWithRiverStart];
						local x = self.startingPlots[choose_this_region][1];
						local y = self.startingPlots[choose_this_region][2];
						local plot = Map.GetPlot(x, y);
						local player = Players[playerNum];
						player:SetStartingPlot(plot);
						--print("Player Number", playerNum, "with Coastal Bias assigned a fallback 'near river' location in Region#", choose_this_region, "at Plot", x, y);
						region_status[choose_this_region] = true;
						civ_status[playerNum + 1] = true;
						local a, b, c = IdentifyTableIndex(regions_still_available, choose_this_region)
						if a then
							table.remove(regions_still_available, c[1]);
						end
					end
				end
			end
		end
	end
	
	-- Handle Region Priority
	if iNumPriorityCivs > 0 then
		--print("-"); print("-"); print("--- REGION PRIORITY READOUT ---"); print("-");
		local iNumSinglePriority, iNumMultiPriority, iNumNeedFallbackPriority = 0, 0, 0;
		local single_priority, multi_priority, fallback_priority = {}, {}, {};
		local single_sorted, multi_sorted = {}, {};
		-- Separate priority civs in to two categories: single priority, multiple priority.
		for playerNum, priority_needs in pairs(priority_lists) do
			local len = table.maxn(priority_needs)
			if len == 1 then
				--print("Player#", playerNum, "has a single Region Priority of type", priority_needs[1]);
				local priority_data = {playerNum, priority_needs[1]};
				table.insert(single_priority, priority_data)
				iNumSinglePriority = iNumSinglePriority + 1;
			else
				--print("Player#", playerNum, "has multiple Region Priority, this many types:", len);
				local priority_data = {playerNum, len};
				table.insert(multi_priority, priority_data)
				iNumMultiPriority = iNumMultiPriority + 1;
			end
		end
		-- Single priority civs go first, and will engage fallback methods if no match found.
		if iNumSinglePriority > 0 then
			-- Sort the list so that proper order of execution occurs. (Going to use a blunt method for easy coding.)
			for region_type = 1, 10 do							-- Must expand if new region types are added.
				for loop, data in ipairs(single_priority) do
					if data[2] == region_type then
						--print("Adding Player#", data[1], "to sorted list of single Region Priority.");
						table.insert(single_sorted, data);
					end
				end
			end
			-- Match civs who have a single Region Priority to the region type they need, if possible.
			for loop, data in ipairs(single_sorted) do
				local iPlayerNum = data[1];
				local iPriorityType = data[2];
				--print("* Attempting to assign Player#", iPlayerNum, "to a region of Type#", iPriorityType);
				local bFoundCandidate, candidate_regions = false, {};
				for test_loop, region_number in ipairs(regions_still_available) do
					if self.regionTypes[region_number] == iPriorityType then
						table.insert(candidate_regions, region_number);
						bFoundCandidate = true;
						--print("- - Found candidate: Region#", region_number);
					end
				end
				if bFoundCandidate then
					local diceroll = 1 + Map.Rand(table.maxn(candidate_regions), "Choosing from among Candidate Regions for start bias - LUA");
					local choose_this_region = candidate_regions[diceroll];
					local x = self.startingPlots[choose_this_region][1];
					local y = self.startingPlots[choose_this_region][2];
					local plot = Map.GetPlot(x, y);
					local player = Players[iPlayerNum];
					player:SetStartingPlot(plot);
					--print("Player Number", iPlayerNum, "with single Region Priority assigned to Region#", choose_this_region, "at Plot", x, y);
					region_status[choose_this_region] = true;
					civ_status[iPlayerNum + 1] = true;
					local a, b, c = IdentifyTableIndex(regions_still_available, choose_this_region)
					if a then
						table.remove(regions_still_available, c[1]);
					end
				else
					table.insert(fallback_priority, data)
					iNumNeedFallbackPriority = iNumNeedFallbackPriority + 1;
					--print("Player Number", iPlayerNum, "with single Region Priority was UNABLE to be matched to its type. Added to fallback list.");
				end
			end
		end
		-- Multiple priority civs go next, with fewest regions of priority going first.
		if iNumMultiPriority > 0 then
			for iNumPriorities = 2, 8 do						-- Must expand if new region types are added.
				for loop, data in ipairs(multi_priority) do
					if data[2] == iNumPriorities then
						--print("Adding Player#", data[1], "to sorted list of multi Region Priority.");
						table.insert(multi_sorted, data);
					end
				end
			end
			-- Match civs who have mulitple Region Priority to one of the region types they need, if possible.
			for loop, data in ipairs(multi_sorted) do
				local iPlayerNum = data[1];
				local iNumPriorityTypes = data[2];
				--print("* Attempting to assign Player#", iPlayerNum, "to one of its Priority Region Types.");
				local bFoundCandidate, candidate_regions = false, {};
				for test_loop, region_number in ipairs(regions_still_available) do
					for inner_loop = 1, iNumPriorityTypes do
						local region_type_to_test = priority_lists[iPlayerNum][inner_loop];
						if self.regionTypes[region_number] == region_type_to_test then
							table.insert(candidate_regions, region_number);
							bFoundCandidate = true;
							--print("- - Found candidate: Region#", region_number);
						end
					end
				end
				if bFoundCandidate then
					local diceroll = 1 + Map.Rand(table.maxn(candidate_regions), "Choosing from among Candidate Regions for start bias - LUA");
					local choose_this_region = candidate_regions[diceroll];
					local x = self.startingPlots[choose_this_region][1];
					local y = self.startingPlots[choose_this_region][2];
					local plot = Map.GetPlot(x, y);
					local player = Players[iPlayerNum];
					player:SetStartingPlot(plot);
					--print("Player Number", iPlayerNum, "with multiple Region Priority assigned to Region#", choose_this_region, "at Plot", x, y);
					region_status[choose_this_region] = true;
					civ_status[iPlayerNum + 1] = true;
					local a, b, c = IdentifyTableIndex(regions_still_available, choose_this_region)
					if a then
						table.remove(regions_still_available, c[1]);
					end
				--else
					--print("Player Number", iPlayerNum, "with multiple Region Priority was unable to be matched.");
				end
			end
		end
		-- Fallbacks are done (if needed) after multiple-region priority is handled. The list is pre-sorted.
		if iNumNeedFallbackPriority > 0 then
			for loop, data in ipairs(fallback_priority) do
				local iPlayerNum = data[1];
				local iPriorityType = data[2];
				--print("* Attempting to assign Player#", iPlayerNum, "to a fallback region as similar as possible to Region Type#", iPriorityType);
				local choose_this_region = self:FindFallbackForUnmatchedRegionPriority(iPriorityType, regions_still_available)
				if choose_this_region == -1 then
					--print("FAILED to find fallback region bias for player#", iPlayerNum);
				else
					local x = self.startingPlots[choose_this_region][1];
					local y = self.startingPlots[choose_this_region][2];
					local plot = Map.GetPlot(x, y);
					local player = Players[iPlayerNum];
					player:SetStartingPlot(plot);
					--print("Player Number", iPlayerNum, "with single Region Priority assigned to FALLBACK Region#", choose_this_region, "at Plot", x, y);
					region_status[choose_this_region] = true;
					civ_status[iPlayerNum + 1] = true;
					local a, b, c = IdentifyTableIndex(regions_still_available, choose_this_region)
					if a then
						table.remove(regions_still_available, c[1]);
					end
				end
			end
		end
	end
	
	-- Handle Region Avoid
	if iNumAvoidCivs > 0 then
		--print("-"); print("-"); print("--- REGION AVOID READOUT ---"); print("-");
		local avoid_sorted, avoid_unsorted, avoid_counts = {}, {}, {};
		-- Sort list of civs with Avoid needs, then process in reverse order, so most needs goes first.
		for playerNum, avoid_needs in pairs(avoid_lists) do
			local len = table.maxn(avoid_needs)
			--print("- Player#", playerNum, "has this number of Region Avoid needs:", len);
			local avoid_data = {playerNum, len};
			table.insert(avoid_unsorted, avoid_data)
			table.insert(avoid_counts, len)
		end
		table.sort(avoid_counts)
		for loop, avoid_count in ipairs(avoid_counts) do
			for test_loop, avoid_data in ipairs(avoid_unsorted) do
				if avoid_count == avoid_data[2] then
					table.insert(avoid_sorted, avoid_data[1])
					table.remove(avoid_unsorted, test_loop)
				end
			end
		end
		-- Process the Region Avoid needs.
		for loop = iNumAvoidCivs, 1, -1 do
			local iPlayerNum = avoid_sorted[loop];
			local candidate_regions = {};
			for test_loop, region_number in ipairs(regions_still_available) do
				local bFoundCandidate = true;
				for inner_loop, region_type_to_avoid in ipairs(avoid_lists[iPlayerNum]) do
					if self.regionTypes[region_number] == region_type_to_avoid then
						bFoundCandidate = false;
					end
				end
				if bFoundCandidate == true then
					table.insert(candidate_regions, region_number);
					--print("- - Found candidate: Region#", region_number)
				end
			end
			if table.maxn(candidate_regions) > 0 then
				local diceroll = 1 + Map.Rand(table.maxn(candidate_regions), "Choosing from among Candidate Regions for start bias - LUA");
				local choose_this_region = candidate_regions[diceroll];
				local x = self.startingPlots[choose_this_region][1];
				local y = self.startingPlots[choose_this_region][2];
				local plot = Map.GetPlot(x, y);
				local player = Players[iPlayerNum];
				player:SetStartingPlot(plot);
				--print("Player Number", iPlayerNum, "with Region Avoid assigned to allowed region type in Region#", choose_this_region, "at Plot", x, y);
				region_status[choose_this_region] = true;
				civ_status[iPlayerNum + 1] = true;
				local a, b, c = IdentifyTableIndex(regions_still_available, choose_this_region)
				if a then
					table.remove(regions_still_available, c[1]);
				end
			--else
				--print("Player Number", iPlayerNum, "with Region Avoid was unable to avoid the undesired region types.");
			end
		end
	end
				
	-- Assign remaining civs to start plots.
	local playerList, regionList = {}, {};
	for loop = 1, self.iNumCivs do
		local player_ID = self.player_ID_list[loop];
		if civ_status[player_ID + 1] == false then -- Using C++ player ID, which starts at zero. Add 1 for Lua indexing.
			table.insert(playerList, player_ID);
		end
		if region_status[loop] == false then
			table.insert(regionList, loop);
		end
	end
	local iNumRemainingPlayers = table.maxn(playerList);
	local iNumRemainingRegions = table.maxn(regionList);
	if iNumRemainingPlayers > 0 or iNumRemainingRegions > 0 then
		--print("-"); print("Table of players with no start bias:");
		--PrintContentsOfTable(playerList);
		--print("-"); print("Table of regions still available after bias handling:");
		--PrintContentsOfTable(regionList);
		--[[
		if iNumRemainingPlayers ~= iNumRemainingRegions then
			print("-"); print("ERROR: Number of civs remaining after handling biases does not match number of regions remaining!"); print("-");
		end
		]]--
		local playerListShuffled = GetShuffledCopyOfTable(playerList)
		for index, player_ID in ipairs(playerListShuffled) do
			local region_number = regionList[index];
			local x = self.startingPlots[region_number][1];
			local y = self.startingPlots[region_number][2];
			--print("Now placing Player#", player_ID, "in Region#", region_number, "at start plot:", x, y);
			local start_plot = Map.GetPlot(x, y)
			local player = Players[player_ID]
			player:SetStartingPlot(start_plot)
		end
	end

	-- If this is a team game (any team has more than one Civ in it) then make 
	-- sure team members start near each other if possible. (This may scramble 
	-- Civ biases in some cases, but there is no cure).
	if self.bTeamGame == true then
		self:NormalizeTeamLocations()
	end
	--	
end
------------------------------------------------------------------------------
-- Start of functions tied to PlaceNaturalWonders()
------------------------------------------------------------------------------
function AssignStartingPlots:ExaminePlotForNaturalWondersEligibility(x, y)
	-- This function checks only for eligibility requirements applicable to all 
	-- Natural Wonders. If a candidate plot passes all such checks, we will move
	-- on to checking it against specific needs for each particular wonderID.
	--
	-- Update, May 2011: Control over wonderID placement is being migrated to XML. Some checks here moved to there.
	local iW, iH = Map.GetGridSize();
	local plotIndex = iW * y + x + 1;
	
	-- Check for collision with player starts
	if self.naturalWondersData[plotIndex] > 0 then
		return false
	end
	
	-- Check the location is a decent city site, otherwise the wonderID is pointless
	local plot = Map.GetPlot(x, y);
	if self:Plot_GetFertilityInRange(plot, 3) < 28 then
		return false
	end
	return true
end
------------------------------------------------------------------------------
function AssignStartingPlots:ExamineCandidatePlotForNaturalWondersEligibility(x, y)
	-- This function checks only for eligibility requirements applicable to all 
	-- Natural Wonders. If a candidate plot passes all such checks, we will move
	-- on to checking it against specific needs for each particular NW.
	if self:ExaminePlotForNaturalWondersEligibility(x, y) == false then
		return false
	end
	local iW, iH = Map.GetGridSize();
	-- Now loop through adjacent plots. Using Map.PlotDirection() in combination with
	-- direction types, an alternate first-ring hex adjustment method, instead of the
	-- odd/even tables used elsewhere in this file, which often have to process more rings.
	for loop, direction in ipairs(self.direction_types) do
		local adjPlot = Map.PlotDirection(x, y, direction)
		if adjPlot == nil then
			return false
		else
			local adjX = adjPlot:GetX();
			local adjY = adjPlot:GetY();
			if self:ExaminePlotForNaturalWondersEligibility(adjX, adjY) == false then
				return false
			end
		end
	end
	return true
end
------------------------------------------------------------------------------
function AssignStartingPlots:CanBeThisNaturalWonderType(x, y, wn, rn)
	-- Checks a candidate plot for eligibility to host the supplied wonder type.
	-- "rn" = the row number for this wonder type within the xml Placement data table.
	local plot = Map.GetPlot(x, y);
	-- Use Custom Eligibility method if indicated.
	if self.EligibilityMethodNumber[wn] ~= -1 then
		local method_number = self.EligibilityMethodNumber[wn];
		if NWCustomEligibility(x, y, method_number) == true then
			local iW, iH = Map.GetGridSize();
			local plotIndex = y * iW + x + 1;
			table.insert(self.eligibility_lists[wn], plotIndex);
		end
		return
	end
	-- Run root checks.
	if self.bWorldHasOceans == true then -- Check to see if this wonder requires or avoids the biggest landmass.
		if self.RequireBiggestLandmass[wn] == true then
			local iAreaID = plot:GetArea();
			if iAreaID ~= self.iBiggestLandmassID then
				return
			end
		elseif self.AvoidBiggestLandmass[wn] == true then
			local iAreaID = plot:GetArea();
			if iAreaID == self.iBiggestLandmassID then
				return
			end
		end
	end
	if self.RequireFreshWater[wn] == true then
		if plot:IsFreshWater() == false then
			return
		end
	elseif self.AvoidFreshWater[wn] == true then
		if plot:IsRiver() or plot:IsLake() or plot:IsFreshWater() then
			return
		end
	end
	-- Land or Sea
	if self.LandBased[wn] == true then
		if plot:IsWater() == true then
			return
		end
		local iW, iH = Map.GetGridSize();
		local plotIndex = y * iW + x + 1;
		if self.RequireLandAdjacentToOcean[wn] == true then
			if self.plotDataIsCoastal[plotIndex] == false then
				return
			end
		elseif self.AvoidLandAdjacentToOcean[wn] == true then
			if self.plotDataIsCoastal[plotIndex] == true then
				return
			end
		end
		if self.RequireLandOnePlotInland[wn] == true then
			if self.plotDataIsNextToCoast[plotIndex] == false then
				return
			end
		elseif self.AvoidLandOnePlotInland[wn] == true then
			if self.plotDataIsNextToCoast[plotIndex] == true then
				return
			end
		end
		if self.RequireLandTwoOrMorePlotsInland[wn] == true then
			if self.plotDataIsCoastal[plotIndex] == true then
				return
			elseif self.plotDataIsNextToCoast[plotIndex] == true then
				return
			end
		elseif self.AvoidLandTwoOrMorePlotsInland[wn] == true then
			if self.plotDataIsCoastal[plotIndex] == false and self.plotDataIsNextToCoast[plotIndex] == false then
				return
			end
		end
	end
	-- Core Tile
	if self.CoreTileCanBeAnyPlotType[wn] == false then
		local plotType = plot:GetPlotType()
		if plotType == PlotTypes.PLOT_LAND and self.CoreTileCanBeFlatland[wn] == true then
			-- Continue
		elseif plotType == PlotTypes.PLOT_HILLS and self.CoreTileCanBeHills[wn] == true then
			-- Continue
		elseif plotType == PlotTypes.PLOT_MOUNTAIN and self.CoreTileCanBeMountain[wn] == true then
			-- Continue
		elseif plotType == PlotTypes.PLOT_OCEAN and self.CoreTileCanBeOcean[wn] == true then
			-- Continue
		else -- Plot type does not match an eligible type, reject this plot.
			return
		end
	end
	if self.CoreTileCanBeAnyTerrainType[wn] == false then
		local terrainType = plot:GetTerrainType()
		if terrainType == TerrainTypes.TERRAIN_GRASS and self.CoreTileCanBeGrass[wn] == true then
			-- Continue
		elseif terrainType == TerrainTypes.TERRAIN_PLAINS and self.CoreTileCanBePlains[wn] == true then
			-- Continue
		elseif terrainType == TerrainTypes.TERRAIN_DESERT and self.CoreTileCanBeDesert[wn] == true then
			-- Continue
		elseif terrainType == TerrainTypes.TERRAIN_TUNDRA and self.CoreTileCanBeTundra[wn] == true then
			-- Continue
		elseif terrainType == TerrainTypes.TERRAIN_SNOW and self.CoreTileCanBeSnow[wn] == true then
			-- Continue
		elseif terrainType == TerrainTypes.TERRAIN_COAST and self.CoreTileCanBeShallowWater[wn] == true then
			-- Continue
		elseif terrainType == TerrainTypes.TERRAIN_OCEAN and self.CoreTileCanBeDeepWater[wn] == true then
			-- Continue
		else -- Terrain type does not match an eligible type, reject this plot.
			return
		end
	end
	if self.CoreTileCanBeAnyFeatureType[wn] == false then
		local featureType = plot:GetFeatureType()
		if featureType == FeatureTypes.NO_FEATURE and self.CoreTileCanBeNoFeature[wn] == true then
			-- Continue
		elseif featureType == FeatureTypes.FEATURE_FOREST and self.CoreTileCanBeForest[wn] == true then
			-- Continue
		elseif featureType == FeatureTypes.FEATURE_JUNGLE and self.CoreTileCanBeJungle[wn] == true then
			-- Continue
		elseif featureType == FeatureTypes.FEATURE_OASIS and self.CoreTileCanBeOasis[wn] == true then
			-- Continue
		elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS and self.CoreTileCanBeFloodPlains[wn] == true then
			-- Continue
		elseif featureType == FeatureTypes.FEATURE_MARSH and self.CoreTileCanBeMarsh[wn] == true then
			-- Continue
		elseif featureType == FeatureTypes.FEATURE_ICE and self.CoreTileCanBeIce[wn] == true then
			-- Continue
		elseif featureType == self.feature_atoll and self.CoreTileCanBeAtoll[wn] == true then
			-- Continue
		else -- Feature type does not match an eligible type, reject this plot.
			return
		end
	end
	-- Adjacent Tiles: Plot Types
	if self.AdjacentTilesCareAboutPlotTypes[wn] == true then
		local iNumAnyLand, iNumFlatland, iNumHills, iNumMountain, iNumHillsPlusMountains, iNumOcean = 0, 0, 0, 0, 0, 0;
		for loop, direction in ipairs(self.direction_types) do
			local adjPlot = Map.PlotDirection(x, y, direction)
			local plotType = adjPlot:GetPlotType();
			if plotType == PlotTypes.PLOT_OCEAN then
				iNumOcean = iNumOcean + 1;
			else
				iNumAnyLand = iNumAnyLand + 1;
				if plotType == PlotTypes.PLOT_LAND then
					iNumFlatland = iNumFlatland + 1;
				else
					iNumHillsPlusMountains = iNumHillsPlusMountains + 1;
					if plotType == PlotTypes.PLOT_HILLS then
						iNumHills = iNumHills + 1;
					else
						iNumMountain = iNumMountain + 1;
					end
				end
			end
		end
		if iNumAnyLand > 0 and self.AdjacentTilesAvoidAnyland[wn] == true then
			return
		end
		-- Require
		if self.AdjacentTilesRequireFlatland[wn] == true then
			if iNumFlatland < self.RequiredNumberOfAdjacentFlatland[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireHills[wn] == true then
			if iNumHills < self.RequiredNumberOfAdjacentHills[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireMountain[wn] == true then
			if iNumMountain < self.RequiredNumberOfAdjacentMountain[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireHillsPlusMountains[wn] == true then
			if iNumHillsPlusMountains < self.RequiredNumberOfAdjacentHillsPlusMountains[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireOcean[wn] == true then
			if iNumOcean < self.RequiredNumberOfAdjacentOcean[wn] then
				return
			end
		end
		-- Avoid
		if self.AdjacentTilesAvoidFlatland[wn] == true then
			if iNumFlatland > self.MaximumAllowedAdjacentFlatland[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidHills[wn] == true then
			if iNumHills > self.MaximumAllowedAdjacentHills[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidMountain[wn] == true then
			if iNumMountain > self.MaximumAllowedAdjacentMountain[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidHillsPlusMountains[wn] == true then
			if iNumHillsPlusMountains > self.MaximumAllowedAdjacentHillsPlusMountains[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidOcean[wn] == true then
			if iNumOcean > self.MaximumAllowedAdjacentOcean[wn] then
				return
			end
		end
	end
	-- Adjacent Tiles: Terrain Types
	if self.AdjacentTilesCareAboutTerrainTypes[wn] == true then
		local iNumGrass, iNumPlains, iNumDesert, iNumTundra, iNumSnow, iNumShallowWater, iNumDeepWater = 0, 0, 0, 0, 0, 0, 0;
		for loop, direction in ipairs(self.direction_types) do
			local adjPlot = Map.PlotDirection(x, y, direction)
			local terrainType = adjPlot:GetTerrainType();
			if terrainType == TerrainTypes.TERRAIN_GRASS then
				iNumGrass = iNumGrass + 1;
			elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
				iNumPlains = iNumPlains + 1;
			elseif terrainType == TerrainTypes.TERRAIN_DESERT then
				iNumDesert = iNumDesert + 1;
			elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
				iNumTundra = iNumTundra + 1;
			elseif terrainType == TerrainTypes.TERRAIN_SNOW then
				iNumSnow = iNumSnow + 1;
			elseif terrainType == TerrainTypes.TERRAIN_COAST then
				iNumShallowWater = iNumShallowWater + 1;
			elseif terrainType == TerrainTypes.TERRAIN_OCEAN then
				iNumDeepWater = iNumDeepWater + 1;
			end
		end
		-- Require
		if self.AdjacentTilesRequireGrass[wn] == true then
			if iNumGrass < self.RequiredNumberOfAdjacentGrass[wn] then
				return
			end
		end
		if self.AdjacentTilesRequirePlains[wn] == true then
			if iNumPlains < self.RequiredNumberOfAdjacentPlains[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireDesert[wn] == true then
			if iNumDesert < self.RequiredNumberOfAdjacentDesert[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireTundra[wn] == true then
			if iNumTundra < self.RequiredNumberOfAdjacentTundra[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireSnow[wn] == true then
			if iNumSnow < self.RequiredNumberOfAdjacentSnow[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireShallowWater[wn] == true then
			if iNumShallowWater < self.RequiredNumberOfAdjacentShallowWater[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireGrass[wn] == true then
			if iNumDeepWater < self.RequiredNumberOfAdjacentDeepWater[wn] then
				return
			end
		end
		-- Avoid
		if self.AdjacentTilesAvoidGrass[wn] == true then
			if iNumGrass > self.MaximumAllowedAdjacentGrass[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidPlains[wn] == true then
			if iNumPlains > self.MaximumAllowedAdjacentPlains[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidDesert[wn] == true then
			if iNumDesert > self.MaximumAllowedAdjacentDesert[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidTundra[wn] == true then
			if iNumTundra > self.MaximumAllowedAdjacentTundra[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidSnow[wn] == true then
			if iNumSnow > self.MaximumAllowedAdjacentSnow[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidShallowWater[wn] == true then
			if iNumShallowWater > self.MaximumAllowedAdjacentShallowWater[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidDeepWater[wn] == true then
			if iNumDeepWater > self.MaximumAllowedAdjacentDeepWater[wn] then
				return
			end
		end
	end
	-- Adjacent Tiles: Feature Types
	if self.AdjacentTilesCareAboutFeatureTypes[wn] == true then
		local iNumNoFeature, iNumForest, iNumJungle, iNumOasis, iNumFloodPlains, iNumMarsh, iNumIce, iNumAtoll = 0, 0, 0, 0, 0, 0, 0, 0;
		for loop, direction in ipairs(self.direction_types) do
			local adjPlot = Map.PlotDirection(x, y, direction)
			local featureType = adjPlot:GetFeatureType();
			if featureType == FeatureTypes.NO_FEATURE then
				iNumNoFeature = iNumNoFeature + 1;
			elseif featureType == FeatureTypes.FEATURE_FOREST then
				iNumForest = iNumForest + 1;
			elseif featureType == FeatureTypes.FEATURE_JUNGLE then
				iNumJungle = iNumJungle + 1;
			elseif featureType == FeatureTypes.FEATURE_OASIS then
				iNumOasis = iNumOasis + 1;
			elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then
				iNumFloodPlains = iNumFloodPlains + 1;
			elseif featureType == FeatureTypes.FEATURE_MARSH then
				iNumMarsh = iNumMarsh + 1;
			elseif featureType == FeatureTypes.FEATURE_ICE then
				iNumIce = iNumIce + 1;
			elseif featureType == self.feature_atoll then
				iNumAtoll = iNumAtoll + 1;
			end
		end
		-- Require
		if self.AdjacentTilesRequireNoFeature[wn] == true then
			if iNumNoFeature < self.RequiredNumberOfAdjacentNoFeature[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireForest[wn] == true then
			if iNumForest < self.RequiredNumberOfAdjacentForest[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireJungle[wn] == true then
			if iNumJungle < self.RequiredNumberOfAdjacentJungle[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireOasis[wn] == true then
			if iNumOasis < self.RequiredNumberOfAdjacentOasis[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireFloodPlains[wn] == true then
			if iNumFloodPlains < self.RequiredNumberOfAdjacentFloodPlains[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireMarsh[wn] == true then
			if iNumMarsh < self.RequiredNumberOfAdjacentMarsh[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireIce[wn] == true then
			if iNumIce < self.RequiredNumberOfAdjacentIce[wn] then
				return
			end
		end
		if self.AdjacentTilesRequireAtoll[wn] == true then
			if iNumAtoll < self.RequiredNumberOfAdjacentAtoll[wn] then
				return
			end
		end
		-- Avoid
		if self.AdjacentTilesAvoidNoFeature[wn] == true then
			if iNumNoFeature > self.MaximumAllowedAdjacentNoFeature[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidForest[wn] == true then
			if iNumForest > self.MaximumAllowedAdjacentForest[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidJungle[wn] == true then
			if iNumJungle > self.MaximumAllowedAdjacentJungle[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidOasis[wn] == true then
			if iNumOasis > self.MaximumAllowedAdjacentOasis[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidFloodPlains[wn] == true then
			if iNumFloodPlains > self.MaximumAllowedAdjacentFloodPlains[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidMarsh[wn] == true then
			if iNumMarsh > self.MaximumAllowedAdjacentMarsh[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidIce[wn] == true then
			if iNumIce > self.MaximumAllowedAdjacentIce[wn] then
				return
			end
		end
		if self.AdjacentTilesAvoidAtoll[wn] == true then
			if iNumAtoll > self.MaximumAllowedAdjacentAtoll[wn] then
				return
			end
		end
	end

	-- This plot has survived all tests and is eligible to host this wonder type.
	local iW, iH = Map.GetGridSize();
	local plotIndex = y * iW + x + 1;
	table.insert(self.eligibility_lists[wn], plotIndex);
end
------------------------------------------------------------------------------
function AssignStartingPlots:GenerateLocalVersionsOfDataFromXML()
	for nw_number, rn in ipairs(self.xml_row_numbers) do
		table.insert(self.EligibilityMethodNumber, GameInfo.Natural_Wonder_Placement[rn].EligibilityMethodNumber);
		table.insert(self.OccurrenceFrequency, GameInfo.Natural_Wonder_Placement[rn].OccurrenceFrequency);		
		table.insert(self.RequireBiggestLandmass, GameInfo.Natural_Wonder_Placement[rn].RequireBiggestLandmass);
		table.insert(self.AvoidBiggestLandmass, GameInfo.Natural_Wonder_Placement[rn].AvoidBiggestLandmass);
		table.insert(self.RequireFreshWater, GameInfo.Natural_Wonder_Placement[rn].RequireFreshWater);
		table.insert(self.AvoidFreshWater, GameInfo.Natural_Wonder_Placement[rn].AvoidFreshWater);
		table.insert(self.LandBased, GameInfo.Natural_Wonder_Placement[rn].LandBased);
		table.insert(self.RequireLandAdjacentToOcean, GameInfo.Natural_Wonder_Placement[rn].RequireLandAdjacentToOcean);
		table.insert(self.AvoidLandAdjacentToOcean, GameInfo.Natural_Wonder_Placement[rn].AvoidLandAdjacentToOcean);
		table.insert(self.RequireLandOnePlotInland, GameInfo.Natural_Wonder_Placement[rn].RequireLandOnePlotInland);
		table.insert(self.AvoidLandOnePlotInland, GameInfo.Natural_Wonder_Placement[rn].AvoidLandOnePlotInland);
		table.insert(self.RequireLandTwoOrMorePlotsInland, GameInfo.Natural_Wonder_Placement[rn].RequireLandTwoOrMorePlotsInland);
		table.insert(self.AvoidLandTwoOrMorePlotsInland, GameInfo.Natural_Wonder_Placement[rn].AvoidLandTwoOrMorePlotsInland);

		table.insert(self.CoreTileCanBeAnyPlotType, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeAnyPlotType);
		table.insert(self.CoreTileCanBeFlatland, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeFlatland);
		table.insert(self.CoreTileCanBeHills, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeHills);
		table.insert(self.CoreTileCanBeMountain, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeMountain);
		table.insert(self.CoreTileCanBeOcean, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeOcean);
		table.insert(self.CoreTileCanBeAnyTerrainType, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeAnyTerrainType);
		table.insert(self.CoreTileCanBeGrass, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeGrass);
		table.insert(self.CoreTileCanBePlains, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBePlains);
		table.insert(self.CoreTileCanBeDesert, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeDesert);
		table.insert(self.CoreTileCanBeTundra, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeTundra);
		table.insert(self.CoreTileCanBeSnow, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeSnow);
		table.insert(self.CoreTileCanBeShallowWater, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeShallowWater);
		table.insert(self.CoreTileCanBeDeepWater, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeDeepWater);
		table.insert(self.CoreTileCanBeAnyFeatureType, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeAnyFeatureType);
		table.insert(self.CoreTileCanBeNoFeature, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeNoFeature);
		table.insert(self.CoreTileCanBeForest, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeForest);
		table.insert(self.CoreTileCanBeJungle, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeJungle);
		table.insert(self.CoreTileCanBeOasis, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeOasis);
		table.insert(self.CoreTileCanBeFloodPlains, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeFloodPlains);
		table.insert(self.CoreTileCanBeMarsh, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeMarsh);
		table.insert(self.CoreTileCanBeIce, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeIce);
		table.insert(self.CoreTileCanBeAtoll, GameInfo.Natural_Wonder_Placement[rn].CoreTileCanBeAtoll);

		table.insert(self.AdjacentTilesCareAboutPlotTypes, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesCareAboutPlotTypes);
		table.insert(self.AdjacentTilesAvoidAnyland, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidAnyland);
		table.insert(self.AdjacentTilesRequireFlatland, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireFlatland);
		table.insert(self.RequiredNumberOfAdjacentFlatland, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentFlatland);
		table.insert(self.AdjacentTilesRequireHills, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireHills);
		table.insert(self.RequiredNumberOfAdjacentHills, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentHills);
		table.insert(self.AdjacentTilesRequireMountain, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireMountain);
		table.insert(self.RequiredNumberOfAdjacentMountain, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentMountain);
		table.insert(self.AdjacentTilesRequireHillsPlusMountains, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireHillsPlusMountains);
		table.insert(self.RequiredNumberOfAdjacentHillsPlusMountains, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentHillsPlusMountains);
		table.insert(self.AdjacentTilesRequireOcean, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireOcean);
		table.insert(self.RequiredNumberOfAdjacentOcean, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentOcean);
		table.insert(self.AdjacentTilesAvoidFlatland, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidFlatland);
		table.insert(self.MaximumAllowedAdjacentFlatland, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentFlatland);
		table.insert(self.AdjacentTilesAvoidHills, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidHills);
		table.insert(self.MaximumAllowedAdjacentHills, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentHills);
		table.insert(self.AdjacentTilesAvoidMountain, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidMountain);
		table.insert(self.MaximumAllowedAdjacentMountain, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentMountain);
		table.insert(self.AdjacentTilesAvoidHillsPlusMountains, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidHillsPlusMountains);
		table.insert(self.MaximumAllowedAdjacentHillsPlusMountains, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentHillsPlusMountains);
		table.insert(self.AdjacentTilesAvoidOcean, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidOcean);
		table.insert(self.MaximumAllowedAdjacentOcean, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentOcean);

		table.insert(self.AdjacentTilesCareAboutTerrainTypes, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesCareAboutTerrainTypes);
		table.insert(self.AdjacentTilesRequireGrass, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireGrass);
		table.insert(self.RequiredNumberOfAdjacentGrass, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentGrass);
		table.insert(self.AdjacentTilesRequirePlains, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequirePlains);
		table.insert(self.RequiredNumberOfAdjacentPlains, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentPlains);
		table.insert(self.AdjacentTilesRequireDesert, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireDesert);
		table.insert(self.RequiredNumberOfAdjacentDesert, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentDesert);
		table.insert(self.AdjacentTilesRequireTundra, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireTundra);
		table.insert(self.RequiredNumberOfAdjacentTundra, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentTundra);
		table.insert(self.AdjacentTilesRequireSnow, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireSnow);
		table.insert(self.RequiredNumberOfAdjacentSnow, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentSnow);
		table.insert(self.AdjacentTilesRequireShallowWater, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireShallowWater);
		table.insert(self.RequiredNumberOfAdjacentShallowWater, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentShallowWater);
		table.insert(self.AdjacentTilesRequireDeepWater, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireDeepWater);
		table.insert(self.RequiredNumberOfAdjacentDeepWater, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentDeepWater);
		table.insert(self.AdjacentTilesAvoidGrass, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidGrass);
		table.insert(self.MaximumAllowedAdjacentGrass, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentGrass);
		table.insert(self.AdjacentTilesAvoidPlains, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidPlains);
		table.insert(self.MaximumAllowedAdjacentPlains, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentPlains);
		table.insert(self.AdjacentTilesAvoidDesert, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidDesert);
		table.insert(self.MaximumAllowedAdjacentDesert, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentDesert);
		table.insert(self.AdjacentTilesAvoidTundra, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidTundra);
		table.insert(self.MaximumAllowedAdjacentTundra, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentTundra);
		table.insert(self.AdjacentTilesAvoidSnow, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidSnow);
		table.insert(self.MaximumAllowedAdjacentSnow, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentSnow);
		table.insert(self.AdjacentTilesAvoidShallowWater, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidShallowWater);
		table.insert(self.MaximumAllowedAdjacentShallowWater, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentShallowWater);
		table.insert(self.AdjacentTilesAvoidDeepWater, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidDeepWater);
		table.insert(self.MaximumAllowedAdjacentDeepWater, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentDeepWater);
		
		table.insert(self.AdjacentTilesCareAboutFeatureTypes, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesCareAboutFeatureTypes);
		table.insert(self.AdjacentTilesRequireNoFeature, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireNoFeature);
		table.insert(self.RequiredNumberOfAdjacentNoFeature, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentNoFeature);
		table.insert(self.AdjacentTilesRequireForest, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireForest);
		table.insert(self.RequiredNumberOfAdjacentForest, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentForest);
		table.insert(self.AdjacentTilesRequireJungle, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireJungle);
		table.insert(self.RequiredNumberOfAdjacentJungle, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentJungle);
		table.insert(self.AdjacentTilesRequireOasis, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireOasis);
		table.insert(self.RequiredNumberOfAdjacentOasis, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentOasis);
		table.insert(self.AdjacentTilesRequireFloodPlains, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireFloodPlains);
		table.insert(self.RequiredNumberOfAdjacentFloodPlains, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentFloodPlains);
		table.insert(self.AdjacentTilesRequireMarsh, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireMarsh);
		table.insert(self.RequiredNumberOfAdjacentMarsh, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentMarsh);
		table.insert(self.AdjacentTilesRequireIce, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireIce);
		table.insert(self.RequiredNumberOfAdjacentIce, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentIce);
		table.insert(self.AdjacentTilesRequireAtoll, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesRequireAtoll);
		table.insert(self.RequiredNumberOfAdjacentAtoll, GameInfo.Natural_Wonder_Placement[rn].RequiredNumberOfAdjacentAtoll);
		table.insert(self.AdjacentTilesAvoidNoFeature, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidNoFeature);
		table.insert(self.MaximumAllowedAdjacentNoFeature, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentNoFeature);
		table.insert(self.AdjacentTilesAvoidForest, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidForest);
		table.insert(self.MaximumAllowedAdjacentForest, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentForest);
		table.insert(self.AdjacentTilesAvoidJungle, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidJungle);
		table.insert(self.MaximumAllowedAdjacentJungle, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentJungle);
		table.insert(self.AdjacentTilesAvoidOasis, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidOasis);
		table.insert(self.MaximumAllowedAdjacentOasis, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentOasis);
		table.insert(self.AdjacentTilesAvoidFloodPlains, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidFloodPlains);
		table.insert(self.MaximumAllowedAdjacentFloodPlains, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentFloodPlains);
		table.insert(self.AdjacentTilesAvoidMarsh, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidMarsh);
		table.insert(self.MaximumAllowedAdjacentMarsh, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentMarsh);
		table.insert(self.AdjacentTilesAvoidIce, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidIce);
		table.insert(self.MaximumAllowedAdjacentIce, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentIce);
		table.insert(self.AdjacentTilesAvoidAtoll, GameInfo.Natural_Wonder_Placement[rn].AdjacentTilesAvoidAtoll);
		table.insert(self.MaximumAllowedAdjacentAtoll, GameInfo.Natural_Wonder_Placement[rn].MaximumAllowedAdjacentAtoll);
		
		table.insert(self.TileChangesMethodNumber, GameInfo.Natural_Wonder_Placement[rn].TileChangesMethodNumber);
		table.insert(self.ChangeCoreTileToMountain, GameInfo.Natural_Wonder_Placement[rn].ChangeCoreTileToMountain);
		table.insert(self.ChangeCoreTileToFlatland, GameInfo.Natural_Wonder_Placement[rn].ChangeCoreTileToFlatland);
		table.insert(self.ChangeCoreTileTerrainToGrass, GameInfo.Natural_Wonder_Placement[rn].ChangeCoreTileTerrainToGrass);
		table.insert(self.ChangeCoreTileTerrainToPlains, GameInfo.Natural_Wonder_Placement[rn].ChangeCoreTileTerrainToPlains);
		table.insert(self.SetAdjacentTilesToShallowWater, GameInfo.Natural_Wonder_Placement[rn].SetAdjacentTilesToShallowWater);
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:GenerateNaturalWondersCandidatePlotLists()
	-- This function scans the map for eligible sites for all "Natural Wonders" Features.
	
	local iW, iH = Map.GetGridSize();
	-- Set up Atolls ID.
	for thisFeature in GameInfo.Features() do
		if thisFeature.Type == "FEATURE_ATOLL" then
			self.feature_atoll = thisFeature.ID;
		end
	end
	
	-- Set up Landmass check for wonders that avoid the biggest landmass when the world has oceans.
	local biggest_landmass = Map.FindBiggestArea(false)
	self.iBiggestLandmassID = biggest_landmass:GetID()
	local biggest_ocean = Map.FindBiggestArea(true)
	local iNumBiggestOceanPlots = 0;
	if biggest_ocean ~= nil then
		iNumBiggestOceanPlots = biggest_ocean:GetNumTiles()
	end
	if iNumBiggestOceanPlots > (iW * iH) / 4 then
		self.bWorldHasOceans = true;
	else
		self.bWorldHasOceans = false;
	end
	-- Read the XML data. Count the number of wonders.
	for row in GameInfo.Natural_Wonder_Placement() do
		self.iNumNW = self.iNumNW + 1;
	end
	
	if self.iNumNW == 0 then
		print("-"); print("*** No Natural Wonders found in Civ5Features.xml! ***"); print("-");
		return
	end
	
	-- Set up NW IDs.
	self.wonder_list = table.fill(-1, self.iNumNW);
	local next_wonder_number = 1;
	for row in GameInfo.Features() do
		if (row.NaturalWonder == true) then
			self.wonder_list[next_wonder_number] = row.Type;
			next_wonder_number = next_wonder_number + 1;
		end
	end
	-- Set up Eligibility Lists.
	for i = 1, self.iNumNW do
		table.insert(self.eligibility_lists, {});
	end
	-- Set up Row Numbers.
	for nw_number, nw_type in ipairs(self.wonder_list) do
		-- Obtain the correct Row number from the xml Placement table.
		local row_number;
		for row in GameInfo.Natural_Wonder_Placement() do
			if row.NaturalWonderType == nw_type then
				row_number = row.ID;
			end
		end
		table.insert(self.xml_row_numbers, row_number);
	end
	
	-- Load Data from XML.
	self:GenerateLocalVersionsOfDataFromXML()
	-- Main Loop
	for y = 0, iH - 1 do
		for x = 0, iW - 1 do
			if self:ExamineCandidatePlotForNaturalWondersEligibility(x, y) == true then
				-- Plot has passed checks applicable to all NW types. Move on to specific checks.
				for nw_number, row_number in ipairs(self.xml_row_numbers) do
					self:CanBeThisNaturalWonderType(x, y, nw_number, row_number)
				end
			end
		end
	end
	
	-- Eligibility will affect which NWs can be used, and number of candidates will affect placement order.
	local iCanBeWonder = {};
	for loop = 1, self.iNumNW do
		table.insert(iCanBeWonder, table.maxn(self.eligibility_lists[loop]));
		--print("Wonder #", loop, "has", iCanBeWonder[loop], "candidate plots.");
	end
	-- Sort the wonders with fewest candidates listed first.
	local NW_eligibility_order, NW_eligibility_unsorted, NW_eligibility_sorted, NW_remaining_to_sort_by_occurrence = {}, {}, {}, {}; 
	for loop = 1, self.iNumNW do
		if iCanBeWonder[loop] > 0 then -- This wonder has eligible sites.
			table.insert(NW_eligibility_unsorted, {loop, iCanBeWonder[loop]});
			table.insert(NW_eligibility_sorted, iCanBeWonder[loop]);
		end
	end
	table.sort(NW_eligibility_sorted);
	
	-- Match each sorted eligibility count to the matching unsorted NW number and record in sequence.
	for NW_order = 1, self.iNumNW do
		for loop, data_pair in ipairs(NW_eligibility_unsorted) do
			local unsorted_count = data_pair[2];
			if NW_eligibility_sorted[NW_order] == unsorted_count then
				local unsorted_NW_num = data_pair[1];
				table.insert(NW_eligibility_order, unsorted_NW_num);
				table.insert(NW_remaining_to_sort_by_occurrence, unsorted_NW_num);
				table.remove(NW_eligibility_unsorted, loop);
				break
			end
		end
	end
	
	--[[ Debug printout of natural wonder candidate plot lists
	print("-"); print("-"); print("--- Number of Candidate Plots on the map for Natural Wonders ---"); print("-");
	for loop = 1, self.iNumNW do
		print("-", iCanBeWonder[loop], "candidates for", self.wonder_list[loop]);
	end
	print("-"); print("--- End of candidates readout for Natural Wonders ---"); print("-");
	--]]

	-- Read in from the XML for each eligible wonder, obtaining OccurrenceFrequency data.
	--
	-- Set up pool of entries and enter an entry for each level of OccurrenceFrequency for each eligible NW.
	local NW_candidate_pool_entries, NW_final_selections = {}, {};
	for loop, iNaturalWonderNumber in ipairs(NW_eligibility_order) do
		local nw_type = self.wonder_list[iNaturalWonderNumber];
		local row_number;
		for row in GameInfo.Natural_Wonder_Placement() do
			if row.NaturalWonderType == nw_type then
				row_number = row.ID;
			end
		end
		local iFrequency = GameInfo.Natural_Wonder_Placement[row_number].OccurrenceFrequency;
		
		--print("-"); print("NW#", iNaturalWonderNumber, "of ID#", row_number, "has OccurrenceFrequency of:", iFrequency);
		
		for entry = 1, iFrequency do
			table.insert(NW_candidate_pool_entries, iNaturalWonderNumber);
		end
	end
	--PrintContentsOfTable(NW_candidate_pool_entries)
	local iNumNWtoProcess = table.maxn(NW_remaining_to_sort_by_occurrence)
	if iNumNWtoProcess > 0 then
		-- Choose at random from the entry pool to select the final order of operations for NW placement.
		local entry_count = table.maxn(NW_candidate_pool_entries)
		for loop = 1, iNumNWtoProcess do
			local current_NW_selected = false;
			local current_attempt_to_select = 0;
			while current_NW_selected == false do
				if current_attempt_to_select > 1000 then
					break
				end
				current_attempt_to_select = current_attempt_to_select + 1;
				--print("Selection for #", loop, "NW to be assigned -- ATTEMPT #", current_attempt_to_select);
				local diceroll = 1 + Map.Rand(entry_count, "Checking a random pool entry for NW assignment - Lua");
				local possible_selection = NW_candidate_pool_entries[diceroll];
				local bFoundValue, iNumTimesFoundValue, table_of_indices = IdentifyTableIndex(NW_remaining_to_sort_by_occurrence, possible_selection)
				if bFoundValue then
					table.insert(NW_final_selections, possible_selection)
					table.remove(NW_remaining_to_sort_by_occurrence, table_of_indices[1])
					--print("NW#", possible_selection, "chosen.");
					current_NW_selected = true;
				end
			end
		end
	end
	
	if NW_final_selections ~= nil then
		return NW_final_selections;
	else
		print("ERROR: Failed to produce final selection list of NWs!");
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:AttemptToPlaceNaturalWonder(wonder_number, row_number)
	-- Attempts to place a specific natural wonder. The "wonder_number" is a Lua index while "row_number" is an XML index.
	local iW, iH = Map.GetGridSize();
	local feature_type_to_place;
	for thisFeature in GameInfo.Features() do
		if thisFeature.Type == self.wonder_list[wonder_number] then
			feature_type_to_place = thisFeature.ID;
			break
		end
	end
	local temp_table = self.eligibility_lists[wonder_number];
	local candidate_plot_list = GetShuffledCopyOfTable(temp_table)
	for loop, plotIndex in ipairs(candidate_plot_list) do
		if self.naturalWondersData[plotIndex] == 0 then -- No collision with civ start or other NW, so place wonder here!
			local x = (plotIndex - 1) % iW;
			local y = (plotIndex - x - 1) / iW;
			local plot = Map.GetPlot(x, y);
			-- If called for, force the local terrain to conform to what the wonder needs.
			local method_number = GameInfo.Natural_Wonder_Placement[row_number].TileChangesMethodNumber;
			if method_number ~= -1 then
				-- Custom method for tile changes needed by this wonder.
				NWCustomPlacement(x, y, row_number, method_number)
			else
				-- Check the XML data for any standard type tile changes, execute any that are indicated.
				if GameInfo.Natural_Wonder_Placement[row_number].ChangeCoreTileToMountain == true then
					if not plot:IsMountain() then
						plot:SetPlotType(PlotTypes.PLOT_MOUNTAIN, false, false);
					end
				elseif GameInfo.Natural_Wonder_Placement[row_number].ChangeCoreTileToFlatland == true then
					if plot:GetPlotType() ~= PlotTypes.PLOT_LAND then
						plot:SetPlotType(PlotTypes.PLOT_LAND, false, false);
					end
				end
				if GameInfo.Natural_Wonder_Placement[row_number].ChangeCoreTileTerrainToGrass == true then
					if plot:GetTerrainType() ~= TerrainTypes.TERRAIN_GRASS then
						plot:SetTerrainType(TerrainTypes.TERRAIN_GRASS, false, false);
					end
				elseif GameInfo.Natural_Wonder_Placement[row_number].ChangeCoreTileTerrainToPlains == true then
					if plot:GetTerrainType() ~= TerrainTypes.TERRAIN_PLAINS then
						plot:SetTerrainType(TerrainTypes.TERRAIN_PLAINS, false, false);
					end
				end
				if GameInfo.Natural_Wonder_Placement[row_number].SetAdjacentTilesToShallowWater == true then
					for loop, direction in ipairs(self.direction_types) do
						local adjPlot = Map.PlotDirection(x, y, direction)
						if adjPlot:GetTerrainType() ~= TerrainTypes.TERRAIN_COAST then
							adjPlot:SetTerrainType(TerrainTypes.TERRAIN_COAST, false, false)
						end
					end
				end
			end
			-- Now place this wonder and record the placement.
			plot:SetFeatureType(feature_type_to_place)
			table.insert(self.placed_natural_wonder, wonder_number);
			self:PlaceResourceImpact(x, y, 6, math.floor(iH / 5))	-- Natural Wonders layer
			self:PlaceResourceImpact(x, y, 1, 1)					-- Strategic layer
			self:PlaceResourceImpact(x, y, 2, 1)					-- Luxury layer
			self:PlaceResourceImpact(x, y, 3, 1)					-- Bonus layer
			self:PlaceResourceImpact(x, y, 5, 3)					-- City State layer
			self:PlaceResourceImpact(x, y, 7, 1)					-- Marble layer
			local plotIndex = y * iW + x + 1;
			self.playerCollisionData[plotIndex] = true				-- Record exact plot of wonder in the collision list.
			
			-- MOD.Barathor: Fixed: Added a check for the Great Barrier Reef being placed.  If so, it appropriately applies impact values to its second tile to avoid buggy collisions with water resources.
			-- MOD.Barathor: Start
			if (self.wonder_list[wonder_number] == "FEATURE_REEF") then
				--print("Great Barrier Reef placed... applying impact values to its southeast tile as well.")
				local SEPlot = Map.PlotDirection(x, y, DirectionTypes.DIRECTION_SOUTHEAST)
				local southeastX = SEPlot:GetX()
				local southeastY = SEPlot:GetY()
				self:PlaceResourceImpact(southeastX, southeastY, 1, 1)		-- Strategic layer
				self:PlaceResourceImpact(southeastX, southeastY, 2, 1)		-- Luxury layer
				self:PlaceResourceImpact(southeastX, southeastY, 3, 1)		-- Bonus layer
				local SEplotIndex = southeastY * iW + southeastX + 1
				self.playerCollisionData[SEplotIndex] = true				-- Record exact plot of wonder in the collision list.
			end
			-- MOD.Barathor: End
			--
			--print("- Placed ".. self.wonder_list[wonder_number].. " in Plot", x, y);
			--
			return true
		end
	end
	-- If reached here, this wonder was unable to be placed because all candidates are too close to an already-placed NW.
	return false
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceNaturalWonders()
	local NW_eligibility_order = self:GenerateNaturalWondersCandidatePlotLists()
	local iNumNWCandidates = table.maxn(NW_eligibility_order);
	if iNumNWCandidates == 0 then
		print("No Natural Wonders placed, no eligible sites found for any of them.");
		return
	end
	
	--[[Debug printout
	print("-"); print("--- Readout of NW Assignment Priority ---");
	for print_loop, order in ipairs(NW_eligibility_order) do
		print("NW Assignment Priority#", print_loop, "goes to NW#", order);
	end
	print("-"); print("-");
	--]]
	
	-- Determine how many NWs to attempt to place. Target is regulated per map size.
	-- The final number cannot exceed the number the map has locations to support.
	local worldsizes = {
		[GameInfo.Worlds.WORLDSIZE_DUEL.ID] = 2,
		[GameInfo.Worlds.WORLDSIZE_TINY.ID] = 3,
		[GameInfo.Worlds.WORLDSIZE_SMALL.ID] = 4,
		[GameInfo.Worlds.WORLDSIZE_STANDARD.ID] = 5,
		[GameInfo.Worlds.WORLDSIZE_LARGE.ID] = 6,
		[GameInfo.Worlds.WORLDSIZE_HUGE.ID] = 7
		}
	local target_number = worldsizes[Map.GetWorldSize()];
	local iNumNWtoPlace = math.min(target_number, iNumNWCandidates);
	local selected_NWs, fallback_NWs = {}, {};
	for loop, NW in ipairs(NW_eligibility_order) do
		if loop <= iNumNWtoPlace then
			table.insert(selected_NWs, NW);
		else
			table.insert(fallback_NWs, NW);
		end
	end
	--[[
	print("-");
	for loop, NW in ipairs(selected_NWs) do
		print("Natural Wonder #", NW, "has been selected for placement.");
	end
	print("-");
	for loop, NW in ipairs(fallback_NWs) do
		print("Natural Wonder #", NW, "has been selected as fallback.");
	end
	print("-");
	]]--
	
	print("--- Placing Natural Wonders! ---");
	-- Place the NWs
	local iNumPlaced = 0;
	for loop, nw_number in ipairs(selected_NWs) do
		local nw_type = self.wonder_list[nw_number];
		-- Obtain the correct Row number from the xml Placement table.
		local row_number;
		for row in GameInfo.Natural_Wonder_Placement() do
			if row.NaturalWonderType == nw_type then
				row_number = row.ID;
			end
		end
		-- Place the wonder, using the correct row data from XML.
		local bSuccess = self:AttemptToPlaceNaturalWonder(nw_number, row_number)
		if bSuccess then
			iNumPlaced = iNumPlaced + 1;
		end
	end
	if iNumPlaced < iNumNWtoPlace then
		for loop, nw_number in ipairs(fallback_NWs) do
			if iNumPlaced >= iNumNWtoPlace then
				break
			end
			local nw_type = self.wonder_list[nw_number];
			-- Obtain the correct Row number from the xml Placement table.
			local row_number;
			for row in GameInfo.Natural_Wonder_Placement() do
				if row.NaturalWonderType == nw_type then
					row_number = row.ID;
				end
			end
			-- Place the wonder, using the correct row data from XML.
			local bSuccess = self:AttemptToPlaceNaturalWonder(nw_number, row_number)
			if bSuccess then
				iNumPlaced = iNumPlaced + 1;
			end
		end
	end
	
	if iNumPlaced >= iNumNWtoPlace then
		print("-- Placed all Natural Wonders --"); print("-"); print("-");
	else
		print("-- Not all Natural Wonders targeted got placed --"); print("-"); print("-");
	end
		
end
------------------------------------------------------------------------------
-- Start of functions tied to PlaceCityStates()
------------------------------------------------------------------------------
function AssignStartingPlots:AssignCityStatesToRegionsOrToUninhabited(args)
	-- Placement methods include:
	-- 1. Assign n Per Region
	-- 2. Assign to uninhabited landmasses
	-- 3. Assign to regions with shared luxury IDs
	-- 4. Assign to low fertility regions

	-- Determine number to assign Per Region
	local iW, iH = Map.GetGridSize()
	local ratio = self.iNumCityStates / self.iNumCivs;
	if ratio > 14 then -- This is a ridiculous number of city states for a game with two civs, but we'll account for it anyway.
		self.iNumCityStatesPerRegion = 10;
	elseif ratio > 11 then -- This is a ridiculous number of cs for two or three civs.
		self.iNumCityStatesPerRegion = 8;
	elseif ratio > 8 then
		self.iNumCityStatesPerRegion = 6;
	elseif ratio > 5.7 then
		self.iNumCityStatesPerRegion = 4;
	elseif ratio > 4.35 then
		self.iNumCityStatesPerRegion = 3;
	elseif ratio > 2.7 then
		self.iNumCityStatesPerRegion = 2;
	elseif ratio > 1.35 then
		self.iNumCityStatesPerRegion = 1;
	else
		self.iNumCityStatesPerRegion = 0;
	end
	-- Assign the "Per Region" City States to their regions.
	--print("- - - - - - - - - - - - - - - - -"); print("Assigning City States to Regions");
	local current_cs_index = 1;
	if self.iNumCityStatesPerRegion > 0 then
		for current_region = 1, self.iNumCivs do
			for cs_to_assign_to_this_region = 1, self.iNumCityStatesPerRegion do
				self.city_state_region_assignments[current_cs_index] = current_region;
				--print("-"); print("City State", current_cs_index, "assigned to Region#", current_region);
				current_cs_index = current_cs_index + 1;
				self.iNumCityStatesUnassigned = self.iNumCityStatesUnassigned - 1;
			end
		end
	end

	-- Determine how many City States to place on uninhabited landmasses.
	-- Also generate lists of candidate plots from uninhabited areas.
	local iNumLandAreas = 0;
	local iNumCivLandmassPlots = 0;
	local iNumUninhabitedLandmassPlots = 0;
	local land_area_IDs = {};
	local land_area_plot_count = {};
	local land_area_plot_tables = {};
	local areas_inhabited_by_civs = {};
	local areas_too_small = {};
	local areas_uninhabited = {};
	--
	if self.method == 3 then -- Rectangular regional division spanning the entire globe, ALL plots belong to inhabited regions.
		self.iNumCityStatesUninhabited = 0;
		--print("Rectangular regional division spanning the whole world: all city states must belong to a region!");
	else -- Possibility of plots that do not belong to any civ's Region. Evaluate these plots and assign an appropriate number of City States to them.
		-- Generate list of inhabited area IDs.
		if self.method == 1 or self.method == 2 then
			for index, region_data in ipairs(self.regionData) do
				local region_areaID = region_data[5];
				if TestMembership(areas_inhabited_by_civs, region_areaID) == false then
					table.insert(areas_inhabited_by_civs, region_areaID);
				end
			end
		end
		-- Iterate through plots and, for each land area, generate a list of all its member plots
		for x = 0, iW - 1 do
			for y = 0, iH - 1 do
				local plotIndex = y * iW + x + 1;
				local plot = Map.GetPlot(x, y);
				local plotType = plot:GetPlotType()
				local terrainType = plot:GetTerrainType()
				if (plotType == PlotTypes.PLOT_LAND or plotType == PlotTypes.PLOT_HILLS) and terrainType ~= TerrainTypes.TERRAIN_SNOW then -- Habitable land plot, process it.
					local iArea = plot:GetArea();
					if self.method == 4 then -- Determine if plot is inside or outside the regional rectangle
						if (x >= self.inhabited_WestX and x <= self.inhabited_WestX + self.inhabited_Width - 1) and
						   (y >= self.inhabited_SouthY and y <= self.inhabited_SouthY + self.inhabited_Height - 1) then -- Civ-inhabited rectangle
							iNumCivLandmassPlots = iNumCivLandmassPlots + 1;
						else
							iNumUninhabitedLandmassPlots = iNumUninhabitedLandmassPlots + 1;
							if self.plotDataIsCoastal[i] == true then
								table.insert(self.uninhabited_areas_coastal_plots, i);
							else
								table.insert(self.uninhabited_areas_inland_plots, i);
							end
						end
					else -- AreaID-based method must be applied, which cannot all be done in this loop
						if TestMembership(land_area_IDs, iArea) == false then -- This plot is the first detected in its AreaID.
							iNumLandAreas = iNumLandAreas + 1;
							table.insert(land_area_IDs, iArea);
							land_area_plot_count[iArea] = 1;
							land_area_plot_tables[iArea] = {plotIndex};
						else -- This AreaID already known.
							land_area_plot_count[iArea] = land_area_plot_count[iArea] + 1;
							table.insert(land_area_plot_tables[iArea], plotIndex);
						end
					end
				end
			end
		end
		-- Complete the AreaID-based method. 
		if self.method == 1 or self.method == 2 then
			-- Obtain counts of inhabited and uninhabited plots. Identify areas too small to use for City States.
			for areaID, plot_count in pairs(land_area_plot_count) do
				if TestMembership(areas_inhabited_by_civs, areaID) == true then 
					iNumCivLandmassPlots = iNumCivLandmassPlots + plot_count;
				else
					iNumUninhabitedLandmassPlots = iNumUninhabitedLandmassPlots + plot_count;
					if plot_count < 4 then
						table.insert(areas_too_small, areaID);
					else
						table.insert(areas_uninhabited, areaID);
					end
				end
			end
			-- Now loop through all Uninhabited Areas that are large enough to use and append their plots to the candidates tables.
			for areaID, area_plot_list in pairs(land_area_plot_tables) do
				if TestMembership(areas_uninhabited, areaID) == true then 
					for loop, plotIndex in ipairs(area_plot_list) do
						local x = (plotIndex - 1) % iW;
						local y = (plotIndex - x - 1) / iW;
						local plot = Map.GetPlot(x, y);
						local terrainType = plot:GetTerrainType();
						if terrainType ~= TerrainTypes.TERRAIN_SNOW then
							if self.plotDataIsCoastal[plotIndex] == true then
								table.insert(self.uninhabited_areas_coastal_plots, plotIndex);
							else
								table.insert(self.uninhabited_areas_inland_plots, plotIndex);
							end
						end
					end
				end
			end
		end
		-- Determine the number of City States to assign to uninhabited areas.
		local uninhabited_ratio = iNumUninhabitedLandmassPlots / (iNumCivLandmassPlots + iNumUninhabitedLandmassPlots);
		local max_by_ratio = math.floor(3 * uninhabited_ratio * self.iNumCityStates);
		local max_by_method;
		if self.method == 1 then
			max_by_method = math.ceil(self.iNumCityStates / 4);
		else
			max_by_method = math.ceil(self.iNumCityStates / 2);
		end
		self.iNumCityStatesUninhabited = math.min(self.iNumCityStatesUnassigned, max_by_ratio, max_by_method);
		self.iNumCityStatesUnassigned = self.iNumCityStatesUnassigned - self.iNumCityStatesUninhabited;
	end
	--print("-"); print("City States assigned to Uninhabited Areas: ", self.iNumCityStatesUninhabited);
	-- Update the city state number.
	current_cs_index = current_cs_index + self.iNumCityStatesUninhabited;
	
	if self.iNumCityStatesUnassigned > 0 then
		-- Determine how many to place in support of regions that share their luxury type with two other regions.
		local iNumRegionsSharedLux = 0;
		local shared_lux_IDs = {};
		for resource_ID, amount_assigned_to_regions in ipairs(self.luxury_assignment_count) do
			if amount_assigned_to_regions == 3 then
				iNumRegionsSharedLux = iNumRegionsSharedLux + 3;
				table.insert(shared_lux_IDs, resource_ID);
			end
		end
		if iNumRegionsSharedLux > 0 and iNumRegionsSharedLux <= self.iNumCityStatesUnassigned then
			self.iNumCityStatesSharedLux = iNumRegionsSharedLux;
			self.iNumCityStatesLowFertility = self.iNumCityStatesUnassigned - self.iNumCityStatesSharedLux;
		else
			self.iNumCityStatesLowFertility = self.iNumCityStatesUnassigned;
		end
		--print("CS Shared Lux: ", self.iNumCityStatesSharedLux, " CS Low Fert: ", self.iNumCityStatesLowFertility);
		-- Assign remaining types to their respective regions.
		if self.iNumCityStatesSharedLux > 0 then
			for loop, res_ID in ipairs(shared_lux_IDs) do
				for loop, region_lux_data in ipairs(self.regions_sorted_by_type) do
					local this_region_res = region_lux_data[2];
					if this_region_res == res_ID then
						self.city_state_region_assignments[current_cs_index] = region_lux_data[1];
						--print("-"); print("City State", current_cs_index, "assigned to Region#", region_lux_data[1], " to compensate for Shared Luxury ID#", res_ID);
						current_cs_index = current_cs_index + 1;
						self.iNumCityStatesUnassigned = self.iNumCityStatesUnassigned - 1;
					end
				end
			end
		end
		if self.iNumCityStatesLowFertility > 0 then
			-- If more to assign than number of regions, assign per region.
			while self.iNumCityStatesUnassigned >= self.iNumCivs do
				for current_region = 1, self.iNumCivs do
					self.city_state_region_assignments[current_cs_index] = current_region;
					--print("-"); print("City State", current_cs_index, "assigned to Region#", current_region, " to compensate for Low Fertility");
					current_cs_index = current_cs_index + 1;
					self.iNumCityStatesUnassigned = self.iNumCityStatesUnassigned - 1;
				end
			end
			if self.iNumCityStatesUnassigned > 0 then
				local fert_unsorted, fert_sorted, region_list = {}, {}, {};
				for region_num = 1, self.iNumCivs do
					local area_plots = self.regionTerrainCounts[region_num][2];
					local region_fertility = self.regionData[region_num][6];
					local fertility_per_land_plot = region_fertility / area_plots;
					--print("-"); print("Region#", region_num, "AreaPlots:", area_plots, "Region Fertility:", region_fertility, "Per Plot:", fertility_per_land_plot);
					
					table.insert(fert_unsorted, {region_num, fertility_per_land_plot});
					table.insert(fert_sorted, fertility_per_land_plot);
				end
				table.sort(fert_sorted);
				for current_lowest_fertility, fert_value in ipairs(fert_sorted) do
					for loop, data_pair in ipairs(fert_unsorted) do
						local this_region_fert = data_pair[2];
						if this_region_fert == fert_value then
							local regionNum = data_pair[1];
							table.insert(region_list, regionNum);
							table.remove(fert_unsorted, loop);
							break
						end
					end
				end
				for loop = 1, self.iNumCityStatesUnassigned do
					self.city_state_region_assignments[current_cs_index] = region_list[loop];
					--print("-"); print("City State", current_cs_index, "assigned to Region#", region_list[loop], " to compensate for Low Fertility");
					current_cs_index = current_cs_index + 1;
					self.iNumCityStatesUnassigned = self.iNumCityStatesUnassigned - 1;
				end
			end
		end
	end
	
	-- Debug check
	if self.iNumCityStatesUnassigned ~= 0 then
		print("Wrong number of City States assigned at end of assignment process. This number unassigned: ", self.iNumCityStatesUnassigned);
	else
		print("All city states assigned.");
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:CanPlaceCityStateAt(x, y, area_ID, force_it, ignore_collisions)
	local iW, iH = Map.GetGridSize();
	local plot = Map.GetPlot(x, y)
	local area = plot:GetArea()
	if area ~= area_ID and area_ID ~= -1 then
		return false
	end
	
	if plot:IsWater() or plot:IsMountain() then
		return false
	end
	
	-- Avoid natural wonders
	for nearPlot in self:Plot_GetPlotsInCircle(plot, 1, 4) do
		local featureInfo = GameInfo.Features[nearPlot:GetFeatureType()]
		if featureInfo and featureInfo.NaturalWonder then
			--print("CanPlaceCityStateAt: avoided natural wonder: ", featureInfo.Type)
			return false
		end
	end
	
	-- Reserve the best city sites for major civs
	local fertility = self:Plot_GetFertilityInRange(plot, 2)
	if fertility > 28 then
		--print("CanPlaceCityStateAt: avoided fertility: ", fertility)
		return false
	end
	
	local plotIndex = y * iW + x + 1;
	if self.cityStateData[plotIndex] > 0 and force_it == false then
		return false
	end
	local plotIndex = y * iW + x + 1;
	if self.playerCollisionData[plotIndex] == true and ignore_collisions == false then
		print("-"); print("City State candidate plot rejected: collided with already-placed civ or City State at", x, y);
		return false
	end
	return true
end
------------------------------------------------------------------------------
function AssignStartingPlots:ObtainNextSectionInRegion(incoming_west_x, incoming_south_y,
	                         incoming_width, incoming_height, iAreaID, force_it, ignore_collisions)
	--print("ObtainNextSectionInRegion called, for AreaID", iAreaID, "with SW plot at ", incoming_west_x, incoming_south_y, " Width/Height at", incoming_width, incoming_height);
	--[[ This function carves off the outermost plots in a region, checks them for City
	     State Placement eligibility, and returns 7 variables: two plot lists, the 
	     coordinates of the inner portion of the area that was not processed on this 
	     round, and a boolean indicating whether the middle of the region was reached. ]]--
	--[[ If this round does not produce a suitable placement site, another round can be 
	     executed on the remaining unprocessed plots, recursively, until the middle of
	     the region has been reached. If the entire region has no eligible plots, then
	     it is likely that something extreme is going on with the map. Then choose a plot 
	     from the outermost portion of the region at random and hope for the best. ]]--
	--
	local iW, iH = Map.GetGridSize();
	local reached_middle = false;
	if incoming_width <= 0 or incoming_height <= 0 then -- Nothing to process
		return {}, {}, -1, -1, -1, -1, true;
	end
	if incoming_width < 4 or incoming_height < 4 then
		reached_middle = true;
	end
	local bTaller = false;
	local rows_to_check = math.ceil(0.167 * incoming_width);
	if incoming_height > incoming_width then
		bTaller = true;
		rows_to_check = math.ceil(0.167 * incoming_height);
	end
	-- Main loop
	local coastal_plots, inland_plots = {}, {};
	for section_y = incoming_south_y, incoming_south_y + incoming_height - 1 do
		for section_x = incoming_west_x, incoming_west_x + incoming_width - 1 do
			if reached_middle then -- Process all plots.
				local x = section_x % iW;
				local y = section_y % iH;
				if self:CanPlaceCityStateAt(x, y, iAreaID, force_it, ignore_collisions) == true then
					local i = y * iW + x + 1;
					if self.plotDataIsCoastal[i] == true then
						table.insert(coastal_plots, i);
					else
						table.insert(inland_plots, i);
					end
				end
			else -- Process only plots near enough to the region edge.
				if bTaller == false then -- Processing leftmost and rightmost columns.
					if section_x < incoming_west_x + rows_to_check or section_x >= incoming_west_x + incoming_width - rows_to_check then
						local x = section_x % iW;
						local y = section_y % iH;
						if self:CanPlaceCityStateAt(x, y, iAreaID, force_it, ignore_collisions) == true then
							local i = y * iW + x + 1;
							if self.plotDataIsCoastal[i] == true then
								table.insert(coastal_plots, i);
							else
								table.insert(inland_plots, i);
							end
						end
					end
				else -- Processing top and bottom rows.
					if section_y < incoming_south_y + rows_to_check or section_y >= incoming_south_y + incoming_height - rows_to_check then
						local x = section_x % iW;
						local y = section_y % iH;
						if self:CanPlaceCityStateAt(x, y, iAreaID, force_it, ignore_collisions) == true then
							local i = y * iW + x + 1;
							if self.plotDataIsCoastal[i] == true then
								table.insert(coastal_plots, i);
							else
								table.insert(inland_plots, i);
							end
						end
					end
				end
			end
		end
	end
	local new_west_x, new_south_y, new_width, new_height;
	if bTaller then
		new_west_x = incoming_west_x + rows_to_check;
		new_south_y = incoming_south_y;
		new_width = incoming_width - (2 * rows_to_check);
		new_height = incoming_height;
	else
		new_west_x = incoming_west_x;
		new_south_y = incoming_south_y + rows_to_check;
		new_width = incoming_width;
		new_height = incoming_height - (2 * rows_to_check);
	end		

	return coastal_plots, inland_plots, new_west_x, new_south_y, new_width, new_height, reached_middle;
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceCityState(coastal_plot_list, inland_plot_list, check_proximity, check_collision)
	-- returns coords, plus boolean indicating whether assignment succeeded or failed.
	-- Argument "check_collision" should be false if plots in lists were already checked, true if not.
	if coastal_plot_list == nil or inland_plot_list == nil then
		print("Nil plot list incoming for PlaceCityState()");
	end
	local iW, iH = Map.GetGridSize()
	local iNumCoastal = table.maxn(coastal_plot_list);
	if iNumCoastal > 0 then
		if check_collision == false then
			local diceroll = 1 + Map.Rand(iNumCoastal, "Standard City State placement - LUA");
			local selected_plot_index = coastal_plot_list[diceroll];
			local x = (selected_plot_index - 1) % iW;
			local y = (selected_plot_index - x - 1) / iW;
			return x, y, true;
		else
			local randomized_coastal = GetShuffledCopyOfTable(coastal_plot_list);
			for loop, candidate_plot in ipairs(randomized_coastal) do
				if self.playerCollisionData[candidate_plot] == false then
					if check_proximity == false or self.cityStateData[candidate_plot] == 0 then
						local x = (candidate_plot - 1) % iW;
						local y = (candidate_plot - x - 1) / iW;
						return x, y, true;
					end
				end
			end
		end
	end
	local iNumInland = table.maxn(inland_plot_list);
	if iNumInland > 0 then
		if check_collision == false then
			local diceroll = 1 + Map.Rand(iNumInland, "Standard City State placement - LUA");
			local selected_plot_index = inland_plot_list[diceroll];
			local x = (selected_plot_index - 1) % iW;
			local y = (selected_plot_index - x - 1) / iW;
			return x, y, true;
		else
			local randomized_inland = GetShuffledCopyOfTable(inland_plot_list);
			for loop, candidate_plot in ipairs(randomized_inland) do
				if self.playerCollisionData[candidate_plot] == false then
					if check_proximity == false or self.cityStateData[candidate_plot] == 0 then
						local x = (candidate_plot - 1) % iW;
						local y = (candidate_plot - x - 1) / iW;
						return x, y, true;
					end
				end
			end
		end
	end
	
	return 0, 0, false;
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceCityStateInRegion(city_state_number, region_number)
	print("Place City State in Region called for City State", city_state_number, "Region", region_number);
	local iW, iH = Map.GetGridSize();
	local placed_city_state = false;
	local reached_middle = false;
	local region_data_table = self.regionData[region_number];
	local iWestX = region_data_table[1];
	local iSouthY = region_data_table[2];
	local iWidth = region_data_table[3];
	local iHeight = region_data_table[4];
	local iAreaID = region_data_table[5];
	
	local eligible_coastal, eligible_inland = {}, {};

	-- Main loop, first pass, unforced
	local x, y;
	local curWX = iWestX;
	local curSY = iSouthY;
	local curWid = iWidth;
	local curHei = iHeight;
	while placed_city_state == false and reached_middle == false do
		-- Send the remaining unprocessed portion of the region to be processed.
		local nextWX, nextSY, nextWid, nextHei;
		eligible_coastal, eligible_inland, nextWX, nextSY, nextWid, nextHei, 
		  reached_middle = self:ObtainNextSectionInRegion(curWX, curSY, curWid, curHei, iAreaID, false, false) -- Don't force it. Yet.
		curWX, curSY, curWid, curHei = nextWX, nextSY, nextWid, nextHei;
		-- Attempt to place city state using the two plot lists received from the last call.
		x, y, placed_city_state = self:PlaceCityState(eligible_coastal, eligible_inland, false, false) -- Don't need to re-check collisions.
	end

	if placed_city_state == true then
		-- Record and enact the placement.
		self.cityStatePlots[city_state_number] = {x, y, region_number};
		self.city_state_validity_table[city_state_number] = true; -- This is the line that marks a city state as valid to be processed by the rest of the system.
		local city_state_ID = city_state_number + GameDefines.MAX_MAJOR_CIVS - 1;
		local cityState = Players[city_state_ID];
		local cs_start_plot = Map.GetPlot(x, y)
		cityState:SetStartingPlot(cs_start_plot)
		self:GenerateLuxuryPlotListsAtCitySite(x, y, 1, true) -- Removes Feature Ice from coasts adjacent to the city state's new location
		self:PlaceResourceImpact(x, y, 5, 4) -- City State layer
		self:PlaceResourceImpact(x, y, 2, 3) -- Luxury layer
		self:PlaceResourceImpact(x, y, 3, 3) -- Bonus layer
		self:PlaceResourceImpact(x, y, 4, 3) -- Fish layer
		self:PlaceResourceImpact(x, y, 7, 3) -- Marble layer
		-- ####Vanilla Communitas change - Militaristic CS gets more potential strategic resources? Up to you to keep or not. I do like the flavour.
		if cityState:GetMinorCivTrait() == MinorCivTraitTypes.MINOR_CIV_TRAIT_MILITARISTIC then
			self:PlaceResourceImpact(x, y, 1, 0) -- Strategic layer, at start point only.
		else
			self:PlaceResourceImpact(x, y, 1, 3) -- Strategic layer
		end
		local impactPlotIndex = y * iW + x + 1;
		self.playerCollisionData[impactPlotIndex] = true;
		print("-"); print("City State", city_state_number, "has been started at Plot", x, y, "in Region#", region_number);
	else
		print("-"); print("WARNING: Crowding issues for City State #", city_state_number, " - Could not find valid site in Region#", region_number);
		self.iNumCityStatesDiscarded = self.iNumCityStatesDiscarded + 1;
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceCityStates()
	print("Map Generation - Choosing sites for City States");
	-- This function is dependent on AssignLuxuryRoles() having been executed first.
	-- This is because some city state placements are made in compensation for drawing
	-- the short straw in regard to multiple regions being assigned the same luxury type.

	self:AssignCityStatesToRegionsOrToUninhabited()
	
	print("-"); print("--- City State Placement Results ---");

	local iW, iH = Map.GetGridSize();
	local iUninhabitedCandidatePlots = table.maxn(self.uninhabited_areas_coastal_plots) + table.maxn(self.uninhabited_areas_inland_plots);
	print("-"); print("."); print(". NUMBER OF UNINHABITED CS CANDIDATE PLOTS: ", iUninhabitedCandidatePlots); print(".");
	for cs_number, region_number in ipairs(self.city_state_region_assignments) do
		if cs_number <= self.iNumCityStates then -- Make sure it's an active city state before processing.
			if region_number == -1 and iUninhabitedCandidatePlots > 0 then -- Assigned to areas outside of Regions.
				--print("Place City States, place in uninhabited called for City State", cs_number);
				iUninhabitedCandidatePlots = iUninhabitedCandidatePlots - 1;
				local cs_x, cs_y, success;
				cs_x, cs_y, success = self:PlaceCityState(self.uninhabited_areas_coastal_plots, self.uninhabited_areas_inland_plots, true, true)
				--
				-- Disabling fallback methods that remove proximity and collision checks. Jon has decided
				-- that city states that do not fit on the map will simply not be placed, but instead discarded.
				--[[
				if not success then -- Try again, this time with proximity checks disabled.
					cs_x, cs_y, success = self:PlaceCityState(self.uninhabited_areas_coastal_plots, self.uninhabited_areas_inland_plots, false, true)
					if not success then -- Try a third time, this time with all collision checks disabled.
						cs_x, cs_y, success = self:PlaceCityState(self.uninhabited_areas_coastal_plots, self.uninhabited_areas_inland_plots, false, false)
					end
				end
				]]--
				--
				if success == true then
					self.cityStatePlots[cs_number] = {cs_x, cs_y, -1};
					self.city_state_validity_table[cs_number] = true; -- This is the line that marks a city state as valid to be processed by the rest of the system.
					local city_state_ID = cs_number + GameDefines.MAX_MAJOR_CIVS - 1;
					local cityState = Players[city_state_ID];
					local cs_start_plot = Map.GetPlot(cs_x, cs_y)
					cityState:SetStartingPlot(cs_start_plot)
					self:GenerateLuxuryPlotListsAtCitySite(cs_x, cs_y, 1, true) -- Removes Feature Ice from coasts adjacent to the city state's new location
					self:PlaceResourceImpact(cs_x, cs_y, 5, 4) -- City State layer
					self:PlaceResourceImpact(cs_x, cs_y, 2, 3) -- Luxury layer
					self:PlaceResourceImpact(cs_x, cs_y, 1, 0) -- Strategic layer, at start point only.
					self:PlaceResourceImpact(cs_x, cs_y, 3, 3) -- Bonus layer
					self:PlaceResourceImpact(cs_x, cs_y, 4, 3) -- Fish layer
					self:PlaceResourceImpact(cs_x, cs_y, 7, 3) -- Marble layer
					local impactPlotIndex = cs_y * iW + cs_x + 1;
					self.playerCollisionData[impactPlotIndex] = true;
					print("-"); print("City State", cs_number, "has been started at Plot", cs_x, cs_y, "in Uninhabited Lands");
				else
					print("-"); print("WARNING: Crowding issues for City State #", city_state_number, " - Could not find valid site in Uninhabited Lands.", region_number);
					self.iNumCityStatesDiscarded = self.iNumCityStatesDiscarded + 1;
				end
			elseif region_number == -1 and iUninhabitedCandidatePlots <= 0 then -- Assigned to areas outside of Regions, but nowhere there to put them!
				local iRandRegion = 1 + Map.Rand(self.iNumCivs, "Emergency Redirect of CS placement, choosing Region - LUA");
				print("Place City States, place in uninhabited called for City State", cs_number, "but it has no legal site, so is being put in Region#", iRandRegion);
				self:PlaceCityStateInRegion(cs_number, iRandRegion)
			else -- Assigned to a Region.
				print("Place City States, place in Region#", region_number, "for City State", cs_number);
				self:PlaceCityStateInRegion(cs_number, region_number)
			end
		end
	end
	
	-- Last chance method to place city states that didn't fit where they were supposed to go.
	if self.iNumCityStatesDiscarded > 0 then
		-- Assemble a global plot list of eligible City State sites that remain.
		local cs_last_chance_plot_list = {};
		for y = 0, iH - 1 do
			for x = 0, iW - 1 do
				if self:CanPlaceCityStateAt(x, y, -1, false, false) == true then
					local i = y * iW + x + 1;
					table.insert(cs_last_chance_plot_list, i);
				end
			end
		end
		local iNumLastChanceCandidates = table.maxn(cs_last_chance_plot_list);
		-- If any eligible sites were found anywhere on the map, place as many of the remaining CS as possible.
		if iNumLastChanceCandidates > 0 then
			print("-"); print("-"); print("ALERT: Some City States failed to be placed due to overcrowding. Attempting 'last chance' placement method.");
			print("Total number of remaining eligible candidate plots:", iNumLastChanceCandidates);
			local last_chance_shuffled = GetShuffledCopyOfTable(cs_last_chance_plot_list)
			local cs_list = {};
			for cs_num = 1, self.iNumCityStates do
				if self.city_state_validity_table[cs_num] == false then
					table.insert(cs_list, cs_num);
					print("City State #", cs_num, "not yet placed, adding it to 'last chance' list.");
				end
			end
			for loop, cs_number in ipairs(cs_list) do
				local cs_x, cs_y, success;
				cs_x, cs_y, success = self:PlaceCityState(last_chance_shuffled, {}, true, true)
				if success == true then
					self.cityStatePlots[cs_number] = {cs_x, cs_y, -1};
					self.city_state_validity_table[cs_number] = true; -- This is the line that marks a city state as valid to be processed by the rest of the system.
					local city_state_ID = cs_number + GameDefines.MAX_MAJOR_CIVS - 1;
					local cityState = Players[city_state_ID];
					local cs_start_plot = Map.GetPlot(cs_x, cs_y)
					cityState:SetStartingPlot(cs_start_plot)
					self:GenerateLuxuryPlotListsAtCitySite(cs_x, cs_y, 1, true) -- Removes Feature Ice from coasts adjacent to the city state's new location
					self:PlaceResourceImpact(cs_x, cs_y, 5, 4) -- City State layer
					self:PlaceResourceImpact(cs_x, cs_y, 2, 3) -- Luxury layer
					self:PlaceResourceImpact(cs_x, cs_y, 1, 0) -- Strategic layer, at start point only.
					self:PlaceResourceImpact(cs_x, cs_y, 3, 3) -- Bonus layer
					self:PlaceResourceImpact(cs_x, cs_y, 4, 3) -- Fish layer
					self:PlaceResourceImpact(cs_x, cs_y, 7, 3) -- Marble layer
					local impactPlotIndex = cs_y * iW + cs_x + 1;
					self.playerCollisionData[impactPlotIndex] = true;
					self.iNumCityStatesDiscarded = self.iNumCityStatesDiscarded - 1;
					print("-"); print("City State", cs_number, "has been RESCUED from the trash bin of history and started at Fallback Plot", cs_x, cs_y);
				else
					print("-"); print("We have run out of possible 'last chance' sites for unplaced city states!");
					break
				end
			end
			if self.iNumCityStatesDiscarded > 0 then
				print("-"); print("ALERT: No eligible city state sites remain. DISCARDING", self.iNumCityStatesDiscarded, "city states. BYE BYE!"); print("-");
			end
		else
			print("-"); print("-"); print("ALERT: No eligible city state sites remain. DISCARDING", self.iNumCityStatesDiscarded, "city states. BYE BYE!"); print("-");
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:NormalizeCityState(x, y)
	-- Similar to the version for normalizing civ starts, but less placed, no third-ring considerations and different weightings.
	local iW, iH = Map.GetGridSize();
	local plot = Map.GetPlot(x, y);
	local isEvenY = true;
	if y / 2 > math.floor(y / 2) then
		isEvenY = false;
	end
	local wrapX = Map:IsWrapX();
	local wrapY = Map:IsWrapY();
	local innerFourFood, innerThreeFood, innerTwoFood, innerHills, innerForest, innerOneHammer, innerOcean = 0, 0, 0, 0, 0, 0, 0;
	local outerFourFood, outerThreeFood, outerTwoFood, outerOcean = 0, 0, 0, 0;
	local innerCanHaveBonus, outerCanHaveBonus, innerBadTiles, outerBadTiles = 0, 0, 0, 0;
	local iNumFoodBonusNeeded = 0;
	local search_table = {};
	
	-- Data Chart for early game tile potentials
	--
	-- 4F:	Flood Plains, Grass on fresh water (includes forest and marsh).
	-- 3F:	Dry Grass, Plains on fresh water (includes forest and jungle), Tundra on fresh water (includes forest), Oasis
	-- 2F:  Dry Plains, Lake, all remaining Jungles.
	--
	-- 1H:	Plains, Jungle on Plains

	-- Evaluate First Ring
	if isEvenY then
		search_table = self.firstRingYIsEven;
	else
		search_table = self.firstRingYIsOdd;
	end

	for loop, plot_adjustments in ipairs(search_table) do
		local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
		--
		if searchX < 0 or searchX >= iW or searchY < 0 or searchY >= iH then -- This plot's off the map edge.
			innerBadTiles = innerBadTiles + 1;
		else
			local searchPlot = Map.GetPlot(searchX, searchY)
			local plotType = searchPlot:GetPlotType()
			local terrainType = searchPlot:GetTerrainType()
			local featureType = searchPlot:GetFeatureType()
			--
			if plotType == PlotTypes.PLOT_MOUNTAIN then
				innerBadTiles = innerBadTiles + 1;
			elseif plotType == PlotTypes.PLOT_OCEAN then
				if searchPlot:IsLake() then
					if featureType == FeatureTypes.FEATURE_ICE then
						innerBadTiles = innerBadTiles + 1;
					else
						innerTwoFood = innerTwoFood + 1;
					end
				else
					if featureType == FeatureTypes.FEATURE_ICE then
						innerBadTiles = innerBadTiles + 1;
					else
						innerOcean = innerOcean + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1;
					end
				end
			else -- Habitable plot.
				if plotType == PlotTypes.PLOT_HILLS then
					innerHills = innerHills + 1;
					if featureType == FeatureTypes.FEATURE_JUNGLE then
						innerTwoFood = innerTwoFood + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1;
					elseif featureType == FeatureTypes.FEATURE_FOREST then
						innerCanHaveBonus = innerCanHaveBonus + 1;
					end
				elseif searchPlot:IsFreshWater() then
					if terrainType == TerrainTypes.TERRAIN_GRASS then
						innerFourFood = innerFourFood + 1;
						if featureType ~= FeatureTypes.FEATURE_MARSH then
							innerCanHaveBonus = innerCanHaveBonus + 1;
						end
						if featureType == FeatureTypes.FEATURE_FOREST then
							innerForest = innerForest + 1;
						end
					elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then
						innerFourFood = innerFourFood + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1;
					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
						innerThreeFood = innerThreeFood + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1;
						if featureType == FeatureTypes.FEATURE_FOREST then
							innerForest = innerForest + 1;
						else
							innerOneHammer = innerOneHammer + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
						innerThreeFood = innerThreeFood + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1;
						if featureType == FeatureTypes.FEATURE_FOREST then
							innerForest = innerForest + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_DESERT then
						innerBadTiles = innerBadTiles + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1; -- Can have Oasis.
					else -- Snow
						innerBadTiles = innerBadTiles + 1;
					end
				else -- Dry Flatlands
					if terrainType == TerrainTypes.TERRAIN_GRASS then
						innerThreeFood = innerThreeFood + 1;
						if featureType ~= FeatureTypes.FEATURE_MARSH then
							innerCanHaveBonus = innerCanHaveBonus + 1;
						end
						if featureType == FeatureTypes.FEATURE_FOREST then
							innerForest = innerForest + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
						innerTwoFood = innerTwoFood + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1;
						if featureType == FeatureTypes.FEATURE_FOREST then
							innerForest = innerForest + 1;
						else
							innerOneHammer = innerOneHammer + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
						innerCanHaveBonus = innerCanHaveBonus + 1;
						if featureType == FeatureTypes.FEATURE_FOREST then
							innerForest = innerForest + 1;
						else
							innerBadTiles = innerBadTiles + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_DESERT then
						innerBadTiles = innerBadTiles + 1;
						innerCanHaveBonus = innerCanHaveBonus + 1; -- Can have Oasis.
					else -- Snow
						innerBadTiles = innerBadTiles + 1;
					end
				end
			end
		end
	end
				
	-- Evaluate Second Ring
	if isEvenY then
		search_table = self.secondRingYIsEven;
	else
		search_table = self.secondRingYIsOdd;
	end
	for loop, plot_adjustments in ipairs(search_table) do
		local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
		if searchX < 0 or searchX >= iW or searchY < 0 or searchY >= iH then -- This plot's off the map edge.
			outerBadTiles = outerBadTiles + 1;
		else
			local searchPlot = Map.GetPlot(searchX, searchY)
			local plotType = searchPlot:GetPlotType()
			local terrainType = searchPlot:GetTerrainType()
			local featureType = searchPlot:GetFeatureType()
			--
			if plotType == PlotTypes.PLOT_MOUNTAIN then
				outerBadTiles = outerBadTiles + 1;
			elseif plotType == PlotTypes.PLOT_OCEAN then
				if searchPlot:IsLake() then
					if featureType == FeatureTypes.FEATURE_ICE then
						outerBadTiles = outerBadTiles + 1;
					else
						outerTwoFood = outerTwoFood + 1;
					end
				else
					if featureType == FeatureTypes.FEATURE_ICE then
						outerBadTiles = outerBadTiles + 1;
					elseif terrainType == TerrainTypes.TERRAIN_COAST then
						outerCanHaveBonus = outerCanHaveBonus + 1;
						outerOcean = outerOcean + 1;
					end
				end
			else -- Habitable plot.
				if plotType == PlotTypes.PLOT_HILLS then
					if featureType == FeatureTypes.FEATURE_JUNGLE then
						outerTwoFood = outerTwoFood + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1;
					elseif featureType == FeatureTypes.FEATURE_FOREST then
						outerCanHaveBonus = outerCanHaveBonus + 1;
					end
				elseif searchPlot:IsFreshWater() then
					if terrainType == TerrainTypes.TERRAIN_GRASS then
						outerFourFood = outerFourFood + 1;
						if featureType ~= FeatureTypes.FEATURE_MARSH then
							outerCanHaveBonus = outerCanHaveBonus + 1;
						end
					elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then
						outerFourFood = outerFourFood + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1;
					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
						outerThreeFood = outerThreeFood + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1;
					elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
						outerThreeFood = outerThreeFood + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1;
					elseif terrainType == TerrainTypes.TERRAIN_DESERT then
						outerBadTiles = outerBadTiles + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1; -- Can have Oasis.
					else -- Snow
						outerBadTiles = outerBadTiles + 1;
					end
				else -- Dry Flatlands
					if terrainType == TerrainTypes.TERRAIN_GRASS then
						outerThreeFood = outerThreeFood + 1;
						if featureType ~= FeatureTypes.FEATURE_MARSH then
							outerCanHaveBonus = outerCanHaveBonus + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
						outerTwoFood = outerTwoFood + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1;
					elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
						outerCanHaveBonus = outerCanHaveBonus + 1;
						if featureType ~= FeatureTypes.FEATURE_FOREST then
							outerBadTiles = outerBadTiles + 1;
						end
					elseif terrainType == TerrainTypes.TERRAIN_DESERT then
						outerBadTiles = outerBadTiles + 1;
						outerCanHaveBonus = outerCanHaveBonus + 1; -- Can have Oasis.
					else -- Snow
						outerBadTiles = outerBadTiles + 1;
					end
				end
			end
		end
	end
	
	-- Adjust the hammer situation, if needed.
	local hammerScore = (4 * innerHills) + (2 * innerForest) + innerOneHammer;
	if hammerScore < 4 then -- Change a first ring plot to Hills.
		if isEvenY then
			randomized_first_ring_adjustments = GetShuffledCopyOfTable(self.firstRingYIsEven);
		else
			randomized_first_ring_adjustments = GetShuffledCopyOfTable(self.firstRingYIsOdd);
		end
		for attempt = 1, 6 do
			local plot_adjustments = randomized_first_ring_adjustments[attempt];
			local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
			-- Attempt to place a Hill at the currently chosen plot.
			local placedHill = self:AttemptToPlaceHillsAtPlot(searchX, searchY);
			if placedHill == true then
				hammerScore = hammerScore + 4;
				--print("Added hills next to hammer-poor city state at ", x, y);
				break
			elseif attempt == 6 then
				--print("FAILED to add hills next to hammer-poor city state at ", x, y);
			end
		end
	end
	
	-- Rate the food situation.
	local innerFoodScore = (4 * innerFourFood) + (2 * innerThreeFood) + innerTwoFood;
	local outerFoodScore = (4 * outerFourFood) + (2 * outerThreeFood) + outerTwoFood;
	local totalFoodScore = innerFoodScore + outerFoodScore;

	-- Debug printout of food scores.
	--print("-");
	--print("-- - City State #", city_state_number, " has Food Score of ", totalFoodScore, " with rings of ", innerFoodScore, outerFoodScore);
	--	
	
	-- Three levels for Bonus Resource support, from zero to two.
	if totalFoodScore < 12 or innerFoodScore < 4 then
		iNumFoodBonusNeeded = 2;
	elseif totalFoodScore < 16 and innerFoodScore < 9 then
		iNumFoodBonusNeeded = 1;
	end
	-- Add Bonus Resources to food-poor city states.
	if iNumFoodBonusNeeded > 0 then
		local maxBonusesPossible = innerCanHaveBonus + outerCanHaveBonus;

		--print("-");
		--print("Food-Poor city state ", x, y, " needs ", iNumFoodBonusNeeded, " Bonus, with ", maxBonusesPossible, " eligible plots.");
		--print("-");

		local innerPlaced, outerPlaced = 0, 0;
		local randomized_first_ring_adjustments, randomized_second_ring_adjustments;
		if isEvenY then
			randomized_first_ring_adjustments = GetShuffledCopyOfTable(self.firstRingYIsEven);
			randomized_second_ring_adjustments = GetShuffledCopyOfTable(self.secondRingYIsEven);
		else
			randomized_first_ring_adjustments = GetShuffledCopyOfTable(self.firstRingYIsOdd);
			randomized_second_ring_adjustments = GetShuffledCopyOfTable(self.secondRingYIsOdd);
		end
		local tried_all_first_ring = false;
		local tried_all_second_ring = false;
		local allow_oasis = true; -- Permanent flag. (We don't want to place more than one Oasis per location).
		local placedOasis; -- Records returning result from each attempt.
		while iNumFoodBonusNeeded > 0 do
			if innerPlaced < 2 and innerCanHaveBonus > 0 and tried_all_first_ring == false then -- Add bonus to inner ring.
				for attempt = 1, 6 do
					local plot_adjustments = randomized_first_ring_adjustments[attempt];
					local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
					-- Attempt to place a Bonus at the currently chosen plot.
					local placedBonus, placedOasis = self:AttemptToPlaceBonusResourceAtPlot(searchX, searchY, allow_oasis);
					if placedBonus == true then
						if allow_oasis == true and placedOasis == true then -- First oasis was placed on this pass, so change permission.
							allow_oasis = false;
						end
						--print("Placed a Bonus in first ring at ", searchX, searchY);
						innerPlaced = innerPlaced + 1;
						innerCanHaveBonus = innerCanHaveBonus - 1;
						iNumFoodBonusNeeded = iNumFoodBonusNeeded - 1;
						break
					elseif attempt == 6 then
						tried_all_first_ring = true;
					end
				end

			elseif innerPlaced + outerPlaced < 4 and outerCanHaveBonus > 0 and tried_all_second_ring == false then
				-- Add bonus to second ring.
				for attempt = 1, 12 do
					local plot_adjustments = randomized_second_ring_adjustments[attempt];
					local searchX, searchY = self:ApplyHexAdjustment(x, y, plot_adjustments)
					-- Attempt to place a Bonus at the currently chosen plot.
					local placedBonus, placedOasis = self:AttemptToPlaceBonusResourceAtPlot(searchX, searchY, allow_oasis);
					if placedBonus == true then
						if allow_oasis == true and placedOasis == true then -- First oasis was placed on this pass, so change permission.
							allow_oasis = false;
						end
						--print("Placed a Bonus in second ring at ", searchX, searchY);
						outerPlaced = outerPlaced + 1;
						outerCanHaveBonus = outerCanHaveBonus - 1;
						iNumFoodBonusNeeded = iNumFoodBonusNeeded - 1;
						break
					elseif attempt == 12 then
						tried_all_second_ring = true;
					end
				end
			
			else -- Tried everywhere, have to give up.
				break				
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:NormalizeCityStateLocations()
	for city_state, data_table in ipairs(self.cityStatePlots) do
		if self.city_state_validity_table[city_state] == true then
			local x = data_table[1];
			local y = data_table[2];
			self:NormalizeCityState(x, y)
		else
			print("WARNING: City State #", city_state, "is not valid in this game. It must have been discarded from overcrowding.");
		end
	end
end
------------------------------------------------------------------------------
-- Start of functions tied to PlaceResourcesAndCityStates()
------------------------------------------------------------------------------
function AssignStartingPlots:GenerateGlobalResourcePlotLists()
	-- This function generates all global plot lists needed for resource distribution.
	local iW, iH = Map.GetGridSize();
	local temp_coast_next_to_land_list, temp_marsh_list, temp_flood_plains_list = {}, {}, {};
	local temp_hills_open_list, temp_hills_covered_list, temp_hills_jungle_list = {}, {}, {};
	local temp_hills_forest_list, temp_jungle_flat_list, temp_forest_flat_list = {}, {}, {};
	local temp_desert_flat_no_feature, temp_plains_flat_no_feature, temp_dry_grass_flat_no_feature = {}, {}, {};
	local temp_fresh_water_grass_flat_no_feature, temp_tundra_flat_including_forests, temp_forest_flat_that_are_not_tundra = {}, {}, {};
	local temp_dry_plains_flat_no_feature, temp_fresh_water_plains_flat_no_feature = {}, {};							-- MOD.Barathor: New
	local temp_desert_or_tundra_flat_no_feature, temp_tundra_flat_forest = {}, {};										-- MOD.Barathor: New
	local temp_hills_open_no_tundra, temp_hills_open_no_desert, temp_hills_open_no_tundra_no_desert = {}, {}, {};		-- MOD.Barathor: New
	local temp_hills_open_no_grass, temp_hills_open_no_grass_no_tundra, temp_hills_covered_no_tundra = {}, {}, {};		-- MOD.Barathor: New
	local temp_hills_covered_no_grass, temp_hills_covered_no_grass_no_tundra, temp_flat_covered = {}, {}, {};			-- MOD.Barathor: New
	local temp_flat_covered_no_grass, temp_flat_covered_no_tundra, temp_flat_covered_no_grass_no_tundra = {}, {}, {};	-- MOD.Barathor: New
	local temp_flat_open, temp_flat_open_no_grass_no_plains, temp_flat_open_no_tundra_no_desert = {}, {}, {};			-- MOD.Barathor: New
	local temp_flat_open_no_desert, temp_flat_desert_including_flood, temp_hills_open_no_grass_no_plains = {}, {}, {};	-- MOD.Barathor: New
	local temp_tropical_marsh_list, temp_hills_snow_list = {}, {};
	--
	-- local iW, iH = Map.GetGridSize();	-- MOD.Barathor: Disabled -- already initialized above, though, not a big deal
	local temp_hills_list, temp_coast_list, temp_grass_flat_no_feature = {}, {}, {};
	local temp_tundra_flat_no_feature, temp_snow_flat_list, temp_land_list = {}, {}, {}, {};
	local temp_marble_list, temp_deer_list, temp_desert_wheat_list, temp_banana_list = {}, {}, {}, {};
	local temp_coconut_list = {};																						-- MOD.HungryForFood: New
	--
	for y = 0, iH - 1 do
		for x = 0, iW - 1 do
			local i = y * iW + x + 1; -- Lua tables/lists/arrays start at 1, not 0 like C++ or Python
			local plot = Map.GetPlot(x, y)
			-- Check if plot has a civ start, CS start, or Natural Wonder
			if self.playerCollisionData[i] == true then
				-- Do not process this plot!
			elseif plot:GetResourceType(-1) ~= -1 then
				-- Plot has a resource already, do not include it.
			else
				-- Process this plot for inclusion in the plot lists.
				local plotType = plot:GetPlotType()
				local terrainType = plot:GetTerrainType()
				local featureType = plot:GetFeatureType()
				if plotType == PlotTypes.PLOT_MOUNTAIN then
					self.barren_plots = self.barren_plots + 1;
				elseif plotType == PlotTypes.PLOT_OCEAN then
					if featureType ~= self.feature_atoll then
						if featureType == FeatureTypes.FEATURE_ICE then
							self.barren_plots = self.barren_plots + 1;
						elseif plot:IsLake() then
							self.barren_plots = self.barren_plots + 1;
						elseif terrainType == TerrainTypes.TERRAIN_COAST then
							table.insert(temp_coast_list, i);
							if plot:IsAdjacentToLand() then
								table.insert(temp_coast_next_to_land_list, i);
							end
						else
							self.barren_plots = self.barren_plots + 1;
						end
					end
				elseif plotType == PlotTypes.PLOT_HILLS then
					table.insert(temp_hills_list, i);
					if featureType == FeatureTypes.NO_FEATURE then
						if terrainType ~= TerrainTypes.TERRAIN_SNOW then
							table.insert(temp_hills_open_list, i);
							table.insert(temp_marble_list, i);
						end
						if terrainType == TerrainTypes.TERRAIN_TUNDRA then			-- MOD.Barathor: New Condition
							table.insert(temp_hills_open_no_desert, i);				-- MOD.Barathor: New
							table.insert(temp_hills_open_no_grass, i);				-- MOD.Barathor: New
							table.insert(temp_hills_open_no_grass_no_plains, i);	-- MOD.Barathor: New
						elseif terrainType == TerrainTypes.TERRAIN_DESERT then
							table.insert(temp_hills_open_no_tundra, i);				-- MOD.Barathor: New
							table.insert(temp_hills_open_no_grass, i);				-- MOD.Barathor: New
							table.insert(temp_hills_open_no_grass_no_tundra, i);	-- MOD.Barathor: New
							table.insert(temp_hills_open_no_grass_no_plains, i);	-- MOD.Barathor: New
						elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
							table.insert(temp_hills_open_no_tundra, i);				-- MOD.Barathor: New
							table.insert(temp_hills_open_no_desert, i);				-- MOD.Barathor: New
							table.insert(temp_hills_open_no_grass, i);				-- MOD.Barathor: New
							table.insert(temp_hills_open_no_grass_no_tundra, i);	-- MOD.Barathor: New
							table.insert(temp_hills_open_no_tundra_no_desert, i);	-- MOD.Barathor: New
						elseif terrainType == TerrainTypes.TERRAIN_GRASS then
							table.insert(temp_hills_open_no_tundra, i);				-- MOD.Barathor: New
							table.insert(temp_hills_open_no_desert, i);				-- MOD.Barathor: New
							table.insert(temp_hills_open_no_tundra_no_desert, i);	-- MOD.Barathor: New
						elseif terrainType == TerrainTypes.TERRAIN_SNOW then
							table.insert(temp_hills_snow_list, i);
						else
							self.barren_plots = self.barren_plots + 1;				-- MOD.Barathor: New
							table.remove(temp_hills_list);							-- MOD.Barathor: New
						end
					elseif featureType == FeatureTypes.FEATURE_JUNGLE then
						table.insert(temp_banana_list, i);
						table.insert(temp_hills_jungle_list, i);
						table.insert(temp_hills_covered_list, i);
						table.insert(temp_marble_list, i);							-- MOD.Barathor: Updated
						if terrainType == TerrainTypes.TERRAIN_PLAINS then			-- MOD.Barathor: New Condition
							table.insert(temp_hills_covered_no_tundra, i);			-- MOD.Barathor: New
							table.insert(temp_hills_covered_no_grass, i);			-- MOD.Barathor: New
							table.insert(temp_hills_covered_no_grass_no_tundra, i);	-- MOD.Barathor: New
						elseif terrainType == TerrainTypes.TERRAIN_GRASS then
							table.insert(temp_hills_covered_no_tundra, i);			-- MOD.Barathor: New
						end
					elseif featureType == FeatureTypes.FEATURE_FOREST then
						table.insert(temp_hills_forest_list, i);
						table.insert(temp_hills_covered_list, i);
						table.insert(temp_marble_list, i);							-- MOD.Barathor: Updated
						if terrainType == TerrainTypes.TERRAIN_TUNDRA then
							table.insert(temp_deer_list, i);
							table.insert(temp_hills_covered_no_grass, i);			-- MOD.Barathor: New
						elseif terrainType == TerrainTypes.TERRAIN_PLAINS then		-- MOD.Barathor: New Condition
							table.insert(temp_hills_covered_no_tundra, i);			-- MOD.Barathor: New
							table.insert(temp_hills_covered_no_grass, i);			-- MOD.Barathor: New
							table.insert(temp_hills_covered_no_grass_no_tundra, i);	-- MOD.Barathor: New
						elseif terrainType == TerrainTypes.TERRAIN_GRASS then		-- MOD.Barathor: New Condition
							table.insert(temp_hills_covered_no_tundra, i);			-- MOD.Barathor: New
						end
					else
						self.barren_plots = self.barren_plots + 1;					-- MOD.Barathor: Fixed
						table.remove(temp_hills_list);								-- MOD.Barathor: Fixed
					end
				elseif featureType == FeatureTypes.FEATURE_MARSH then
					table.insert(temp_marsh_list, i);
					local lat = 0
					if (y >= (iH/2)) then
						lat = math.abs((iH/2) - y)/(iH/2)
					else
						lat = math.abs((iH/2) - (y + 1))/(iH/2)
					end
					local AvgJungleRange = 0
					local rain = Map.GetCustomOption(2)
					if rain == 1 then
						-- Arid
						AvgJungleRange = 0.08
					elseif rain == 3 then
						-- Wet
						AvgJungleRange = 0.25
					else
						-- Normal or Random (Note: I'm currently not sure how to retrieve random, so we'll just use normal for now.)
						AvgJungleRange = 0.10
					end
					if lat <= AvgJungleRange then
						table.insert(temp_tropical_marsh_list, i);
					end
				elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then
					table.insert(temp_flood_plains_list, i);
					table.insert(temp_desert_wheat_list, i);
					table.insert(temp_flat_desert_including_flood, i);				-- MOD.Barathor: New
				elseif plotType == PlotTypes.PLOT_LAND then
					table.insert(temp_land_list, i);
					if featureType == FeatureTypes.FEATURE_JUNGLE then
						table.insert(temp_jungle_flat_list, i);
						table.insert(temp_banana_list, i);
						table.insert(temp_flat_covered, i);								-- MOD.Barathor: New
						if terrainType == TerrainTypes.TERRAIN_PLAINS then				-- MOD.Barathor: New Condition
							table.insert(temp_flat_covered_no_tundra, i);				-- MOD.Barathor: New
							table.insert(temp_flat_covered_no_grass, i);				-- MOD.Barathor: New
							table.insert(temp_flat_covered_no_grass_no_tundra, i);		-- MOD.Barathor: New
							if plot:IsCoastalLand() then								-- MOD.HungryForFood: New Condition
								table.insert(temp_coconut_list, i);						-- MOD.HungryForFood: New
							end
						elseif terrainType == TerrainTypes.TERRAIN_GRASS then
							table.insert(temp_flat_covered_no_tundra, i);				-- MOD.Barathor: New
							if plot:IsCoastalLand() then								-- MOD.HungryForFood: New Condition
								table.insert(temp_coconut_list, i);						-- MOD.HungryForFood: New
							end
						end
					elseif featureType == FeatureTypes.FEATURE_FOREST then
						table.insert(temp_forest_flat_list, i);
						table.insert(temp_flat_covered, i);								-- MOD.Barathor: New
						if terrainType == TerrainTypes.TERRAIN_TUNDRA then
							table.insert(temp_deer_list, i);
							table.insert(temp_tundra_flat_including_forests, i);
							table.insert(temp_tundra_flat_forest, i);					-- MOD.Barathor: New
							table.insert(temp_flat_covered_no_grass, i);				-- MOD.Barathor: New
						elseif terrainType == TerrainTypes.TERRAIN_PLAINS then			-- MOD.Barathor: New Condition
							table.insert(temp_forest_flat_that_are_not_tundra, i);
							table.insert(temp_flat_covered_no_tundra, i);				-- MOD.Barathor: New
							table.insert(temp_flat_covered_no_grass_no_tundra, i);		-- MOD.Barathor: New
							table.insert(temp_flat_covered_no_grass, i);				-- MOD.Barathor: New
						elseif terrainType == TerrainTypes.TERRAIN_GRASS then			-- MOD.Barathor: New Condition
							table.insert(temp_forest_flat_that_are_not_tundra, i);
							table.insert(temp_flat_covered_no_tundra, i);				-- MOD.Barathor: New
						end
					elseif featureType == FeatureTypes.NO_FEATURE then
						if terrainType == TerrainTypes.TERRAIN_SNOW then
							table.insert(temp_snow_flat_list, i);
						elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
							table.insert(temp_tundra_flat_no_feature, i);
							table.insert(temp_tundra_flat_including_forests, i);
							table.insert(temp_marble_list, i);
							table.insert(temp_desert_or_tundra_flat_no_feature, i);		-- MOD.Barathor: New
							table.insert(temp_flat_open, i);							-- MOD.Barathor: New
							table.insert(temp_flat_open_no_desert, i);					-- MOD.Barathor: New
							table.insert(temp_flat_open_no_grass_no_plains, i);			-- MOD.Barathor: New
						elseif terrainType == TerrainTypes.TERRAIN_DESERT then
							table.insert(temp_desert_flat_no_feature, i);
							table.insert(temp_marble_list, i);
							table.insert(temp_desert_or_tundra_flat_no_feature, i);		-- MOD.Barathor: New
							table.insert(temp_flat_open, i);							-- MOD.Barathor: New
							table.insert(temp_flat_open_no_grass_no_plains, i);			-- MOD.Barathor: New
							table.insert(temp_flat_desert_including_flood, i);			-- MOD.Barathor: New
							if plot:IsFreshWater() then
								table.insert(temp_desert_wheat_list, i);
							end
							if plot:IsCoastalLand() then								-- MOD.HungryForFood: New Condition
								if plot:GetLatitude() < 15 then							-- MOD.HungryForFood: New Condition
									table.insert(temp_coconut_list, i);					-- MOD.HungryForFood: New
								end
							end
						elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
							table.insert(temp_plains_flat_no_feature, i);
							table.insert(temp_marble_list, i);								-- MOD.Barathor: Updated
							table.insert(temp_flat_open_no_desert, i);						-- MOD.Barathor: New
							table.insert(temp_flat_open, i);								-- MOD.Barathor: New
							table.insert(temp_flat_open_no_tundra_no_desert, i);			-- MOD.Barathor: New
							if plot:IsFreshWater() then										-- MOD.Barathor: Updated fresh water check
								table.insert(temp_fresh_water_plains_flat_no_feature, i);	-- MOD.Barathor: New
							else
								table.insert(temp_dry_plains_flat_no_feature, i);			-- MOD.Barathor: New
							end
							if plot:IsCoastalLand() then								-- MOD.HungryForFood: New Condition
								if plot:GetLatitude() < 15 then							-- MOD.HungryForFood: New Condition
									table.insert(temp_coconut_list, i);					-- MOD.HungryForFood: New
								end
							end
						elseif terrainType == TerrainTypes.TERRAIN_GRASS then
							table.insert(temp_grass_flat_no_feature, i);
							table.insert(temp_marble_list, i);							-- MOD.Barathor: Updated
							table.insert(temp_flat_open_no_desert, i);					-- MOD.Barathor: New
							table.insert(temp_flat_open, i);							-- MOD.Barathor: New
							table.insert(temp_flat_open_no_tundra_no_desert, i);		-- MOD.Barathor: New
							if plot:IsFreshWater() then
								table.insert(temp_fresh_water_grass_flat_no_feature, i);
							else
								table.insert(temp_dry_grass_flat_no_feature, i);
							end
							if plot:IsCoastalLand() then								-- MOD.HungryForFood: New Condition
								if plot:GetLatitude() < 15 then							-- MOD.HungryForFood: New Condition
									table.insert(temp_coconut_list, i);					-- MOD.HungryForFood: New
								end
							end
						else
							self.barren_plots = self.barren_plots + 1;
							table.remove(temp_land_list);
						end
					else
						self.barren_plots = self.barren_plots + 1;
						table.remove(temp_land_list);
					end
				else
					self.barren_plots = self.barren_plots + 1;
				end
			end
		end
	end
	-- Scramble and record the lists.
	self.coast_next_to_land_list = GetShuffledCopyOfTable(temp_coast_next_to_land_list)
	self.marsh_list = GetShuffledCopyOfTable(temp_marsh_list)
	self.flood_plains_list = GetShuffledCopyOfTable(temp_flood_plains_list)
	self.hills_open_list = GetShuffledCopyOfTable(temp_hills_open_list)
	self.hills_covered_list = GetShuffledCopyOfTable(temp_hills_covered_list)
	self.hills_jungle_list = GetShuffledCopyOfTable(temp_hills_jungle_list)
	self.hills_forest_list = GetShuffledCopyOfTable(temp_hills_forest_list)
	self.hills_snow_list = GetShuffledCopyOfTable(temp_hills_snow_list)
	self.jungle_flat_list = GetShuffledCopyOfTable(temp_jungle_flat_list)
	self.forest_flat_list = GetShuffledCopyOfTable(temp_forest_flat_list)
	self.desert_flat_no_feature = GetShuffledCopyOfTable(temp_desert_flat_no_feature)
	self.plains_flat_no_feature = GetShuffledCopyOfTable(temp_plains_flat_no_feature)
	self.dry_grass_flat_no_feature = GetShuffledCopyOfTable(temp_dry_grass_flat_no_feature)
	self.fresh_water_grass_flat_no_feature = GetShuffledCopyOfTable(temp_fresh_water_grass_flat_no_feature)
	self.tundra_flat_including_forests = GetShuffledCopyOfTable(temp_tundra_flat_including_forests)
	self.forest_flat_that_are_not_tundra = GetShuffledCopyOfTable(temp_forest_flat_that_are_not_tundra)
	self.dry_plains_flat_no_feature = GetShuffledCopyOfTable(temp_dry_plains_flat_no_feature)					-- MOD.Barathor: New
	self.fresh_water_plains_flat_no_feature = GetShuffledCopyOfTable(temp_fresh_water_plains_flat_no_feature)	-- MOD.Barathor: New
	self.desert_or_tundra_flat_no_feature = GetShuffledCopyOfTable(temp_desert_or_tundra_flat_no_feature)		-- MOD.Barathor: New
	self.tundra_flat_forest = GetShuffledCopyOfTable(temp_tundra_flat_forest)									-- MOD.Barathor: New
	self.hills_open_no_tundra = GetShuffledCopyOfTable(temp_hills_open_no_tundra)								-- MOD.Barathor: New
	self.hills_open_no_desert = GetShuffledCopyOfTable(temp_hills_open_no_desert)								-- MOD.Barathor: New
	self.hills_open_no_tundra_no_desert = GetShuffledCopyOfTable(temp_hills_open_no_tundra_no_desert)			-- MOD.Barathor: New
	self.hills_open_no_grass = GetShuffledCopyOfTable(temp_hills_open_no_grass)									-- MOD.Barathor: New
	self.hills_open_no_grass_no_tundra = GetShuffledCopyOfTable(temp_hills_open_no_grass_no_tundra)				-- MOD.Barathor: New
	self.hills_open_no_grass_no_plains = GetShuffledCopyOfTable(temp_hills_open_no_grass_no_plains)				-- MOD.Barathor: New
	self.hills_covered_no_tundra = GetShuffledCopyOfTable(temp_hills_covered_no_tundra)							-- MOD.Barathor: New
	self.hills_covered_no_grass = GetShuffledCopyOfTable(temp_hills_covered_no_grass)							-- MOD.Barathor: New
	self.hills_covered_no_grass_no_tundra = GetShuffledCopyOfTable(temp_hills_covered_no_grass_no_tundra)		-- MOD.Barathor: New
	self.flat_covered = GetShuffledCopyOfTable(temp_flat_covered)												-- MOD.Barathor: New
	self.flat_covered_no_grass = GetShuffledCopyOfTable(temp_flat_covered_no_grass)								-- MOD.Barathor: New
	self.flat_covered_no_tundra = GetShuffledCopyOfTable(temp_flat_covered_no_tundra)							-- MOD.Barathor: New
	self.flat_covered_no_grass_no_tundra = GetShuffledCopyOfTable(temp_flat_covered_no_grass_no_tundra)			-- MOD.Barathor: New
	self.flat_open = GetShuffledCopyOfTable(temp_flat_open)														-- MOD.Barathor: New
	self.flat_open_no_grass_no_plains = GetShuffledCopyOfTable(temp_flat_open_no_grass_no_plains)				-- MOD.Barathor: New
	self.flat_open_no_tundra_no_desert = GetShuffledCopyOfTable(temp_flat_open_no_tundra_no_desert)				-- MOD.Barathor: New
	self.flat_open_no_desert = GetShuffledCopyOfTable(temp_flat_open_no_desert)									-- MOD.Barathor: New
	self.flat_desert_including_flood = GetShuffledCopyOfTable(temp_flat_desert_including_flood)					-- MOD.Barathor: New
	--
	self.grass_flat_no_feature = GetShuffledCopyOfTable(temp_grass_flat_no_feature)
	self.tundra_flat_no_feature = GetShuffledCopyOfTable(temp_tundra_flat_no_feature)
	self.snow_flat_list = GetShuffledCopyOfTable(temp_snow_flat_list)
	self.hills_list = GetShuffledCopyOfTable(temp_hills_list)
	self.land_list = GetShuffledCopyOfTable(temp_land_list)
	self.coast_list = GetShuffledCopyOfTable(temp_coast_list)
	self.marble_list = GetShuffledCopyOfTable(temp_marble_list)
	self.extra_deer_list = GetShuffledCopyOfTable(temp_deer_list)
	self.desert_wheat_list = GetShuffledCopyOfTable(temp_desert_wheat_list)
	self.banana_list = GetShuffledCopyOfTable(temp_banana_list)
	self.tropical_marsh_list = GetShuffledCopyOfTable(temp_tropical_marsh_list)
	self.coconut_list = GetShuffledCopyOfTable(temp_coconut_list)												-- MOD.HungryForFood: New
	--
	-- Set up the Global Luxury Plot Lists matrix, with indices synched to GetIndicesForLuxuryType()
	self.global_luxury_plot_lists = {
	self.coast_next_to_land_list,				-- 1
	self.marsh_list,							-- 2
	self.flood_plains_list,						-- 3
	self.hills_open_list,						-- 4
	self.hills_covered_list,					-- 5
	self.hills_jungle_list,						-- 6
	self.hills_forest_list,						-- 7
	self.jungle_flat_list,						-- 8
	self.forest_flat_list,						-- 9
	self.desert_flat_no_feature,				-- 10
	self.plains_flat_no_feature,				-- 11
	self.dry_grass_flat_no_feature,				-- 12
	self.fresh_water_grass_flat_no_feature,		-- 13
	self.tundra_flat_including_forests,			-- 14
	self.forest_flat_that_are_not_tundra,		-- 15
	self.grass_flat_no_feature,					-- 16	-- MOD.Barathor: New
	self.tundra_flat_no_feature,				-- 17	-- MOD.Barathor: New
	self.dry_plains_flat_no_feature,			-- 18	-- MOD.Barathor: New
	self.fresh_water_plains_flat_no_feature,	-- 19	-- MOD.Barathor: New
	self.desert_or_tundra_flat_no_feature,		-- 20	-- MOD.Barathor: New
	self.tundra_flat_forest,					-- 21	-- MOD.Barathor: New
	self.hills_open_no_tundra,					-- 22	-- MOD.Barathor: New
	self.hills_open_no_desert,					-- 23	-- MOD.Barathor: New
	self.hills_open_no_tundra_no_desert,		-- 24	-- MOD.Barathor: New
	self.hills_open_no_grass,					-- 25	-- MOD.Barathor: New
	self.hills_open_no_grass_no_tundra,			-- 26   -- MOD.Barathor: New
	self.hills_open_no_grass_no_plains,			-- 27   -- MOD.Barathor: New
	self.hills_covered_no_tundra,				-- 28	-- MOD.Barathor: New
	self.hills_covered_no_grass,				-- 29	-- MOD.Barathor: New
	self.hills_covered_no_grass_no_tundra,		-- 30	-- MOD.Barathor: New
	self.flat_covered,							-- 31	-- MOD.Barathor: New
	self.flat_covered_no_grass,					-- 32	-- MOD.Barathor: New
	self.flat_covered_no_tundra,				-- 33	-- MOD.Barathor: New
	self.flat_covered_no_grass_no_tundra,		-- 34	-- MOD.Barathor: New
	self.flat_open,								-- 35	-- MOD.Barathor: New
	self.flat_open_no_grass_no_plains,			-- 36	-- MOD.Barathor: New
	self.flat_open_no_tundra_no_desert,			-- 37	-- MOD.Barathor: New
	self.flat_open_no_desert,					-- 38	-- MOD.Barathor: New
	self.flat_desert_including_flood,			-- 39	-- MOD.Barathor: New
	self.tropical_marsh_list,					-- 40
	};

end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceResourceImpact(x, y, impact_table_number, radius)
	-- This function operates upon one of the "impact and ripple" data overlays for resources.
	-- These data layers are a primary way of preventing assignments from clustering too much.
	-- Impact #s - 1 strategic - 2 luxury - 3 bonus - 4 fish - 5 city states - 6 natural wonders - 7 marble - 8 sheep
	local iW, iH = Map.GetGridSize();
	local wrapX = Map:IsWrapX();
	local wrapY = Map:IsWrapY();
	local impact_value = 99;
	local odd = self.firstRingYIsOdd;
	local even = self.firstRingYIsEven;
	local nextX, nextY, plot_adjustments;
	-- Place Impact!
	local impactPlotIndex = y * iW + x + 1;
	if impact_table_number == 1 then
		self.strategicData[impactPlotIndex] = impact_value;
	elseif impact_table_number == 2 then
		self.luxuryData[impactPlotIndex] = impact_value;
	elseif impact_table_number == 3 then
		self.bonusData[impactPlotIndex] = impact_value;
	elseif impact_table_number == 4 then
		self.fishData[impactPlotIndex] = 1;
	elseif impact_table_number == 5 then
		self.cityStateData[impactPlotIndex] = impact_value;
	elseif impact_table_number == 6 then
		self.naturalWondersData[impactPlotIndex] = impact_value;
	elseif impact_table_number == 7 then
		self.marbleData[impactPlotIndex] = 1;
	end
	if radius == 0 then
		return
	end
	-- Place Ripples
	if radius > 0 and radius < iH / 2 then
		for ripple_radius = 1, radius do
			local ripple_value = radius - ripple_radius + 1;
			-- Moving clockwise around the ring, the first direction to travel will be Northeast.
			-- This matches the direction-based data in the odd and even tables. Each
			-- subsequent change in direction will correctly match with these tables, too.
			--
			-- Locate the plot within this ripple ring that is due West of the Impact Plot.
			local currentX = x - ripple_radius;
			local currentY = y;
			-- Now loop through the six directions, moving ripple_radius number of times
			-- per direction. At each plot in the ring, add the ripple_value for that ring 
			-- to the plot's entry in the distance data table.
			for direction_index = 1, 6 do
				for plot_to_handle = 1, ripple_radius do
					-- Must account for hex factor.
				 	if currentY / 2 > math.floor(currentY / 2) then -- Current Y is odd. Use odd table.
						plot_adjustments = odd[direction_index];
					else -- Current Y is even. Use plot adjustments from even table.
						plot_adjustments = even[direction_index];
					end
					-- Identify the next plot in the ring.
					nextX = currentX + plot_adjustments[1];
					nextY = currentY + plot_adjustments[2];
					-- Make sure the plot exists
					if wrapX == false and (nextX < 0 or nextX >= iW) then -- X is out of bounds.
						-- Do not add ripple data to this plot.
					elseif wrapY == false and (nextY < 0 or nextY >= iH) then -- Y is out of bounds.
						-- Do not add ripple data to this plot.
					else -- Plot is in bounds, process it.
						-- Handle any world wrap.
						local realX = nextX;
						local realY = nextY;
						if wrapX then
							realX = realX % iW;
						end
						if wrapY then
							realY = realY % iH;
						end
						-- Record ripple data for this plot.
						local ringPlotIndex = realY * iW + realX + 1;
						if impact_table_number == 1 then
							if self.strategicData[ringPlotIndex] > 0 then
								-- First choose the greater of the two, existing value or current ripple.
								local stronger_value = math.max(self.strategicData[ringPlotIndex], ripple_value);
								-- Now increase it by 2 to reflect that multiple civs are in range of this plot.
								local overlap_value = math.min(50, stronger_value + 2);
								self.strategicData[ringPlotIndex] = overlap_value;
							else
								self.strategicData[ringPlotIndex] = ripple_value;
							end
						elseif impact_table_number == 2 then
							if self.luxuryData[ringPlotIndex] > 0 then
								-- First choose the greater of the two, existing value or current ripple.
								local stronger_value = math.max(self.luxuryData[ringPlotIndex], ripple_value);
								-- Now increase it by 2 to reflect that multiple civs are in range of this plot.
								local overlap_value = math.min(50, stronger_value + 2);
								self.luxuryData[ringPlotIndex] = overlap_value;
							else
								self.luxuryData[ringPlotIndex] = ripple_value;
							end
						elseif impact_table_number == 3 then
							if self.bonusData[ringPlotIndex] > 0 then
								-- First choose the greater of the two, existing value or current ripple.
								local stronger_value = math.max(self.bonusData[ringPlotIndex], ripple_value);
								-- Now increase it by 2 to reflect that multiple civs are in range of this plot.
								local overlap_value = math.min(50, stronger_value + 2);
								self.bonusData[ringPlotIndex] = overlap_value;
							else
								self.bonusData[ringPlotIndex] = ripple_value;
							end
						elseif impact_table_number == 4 then
							if self.fishData[ringPlotIndex] > 0 then
								-- First choose the greater of the two, existing value or current ripple.
								local stronger_value = math.max(self.fishData[ringPlotIndex], ripple_value);
								-- Now increase it by 2 to reflect that multiple civs are in range of this plot.
								local overlap_value = math.min(10, stronger_value + 1);
								self.fishData[ringPlotIndex] = overlap_value;
							else
								self.fishData[ringPlotIndex] = ripple_value;
							end
						elseif impact_table_number == 5 then
							self.cityStateData[ringPlotIndex] = 1;
						elseif impact_table_number == 6 then
							if self.naturalWondersData[ringPlotIndex] > 0 then
								-- First choose the greater of the two, existing value or current ripple.
								local stronger_value = math.max(self.naturalWondersData[ringPlotIndex], ripple_value);
								-- Now increase it by 2 to reflect that multiple civs are in range of this plot.
								local overlap_value = math.min(50, stronger_value + 2);
								self.naturalWondersData[ringPlotIndex] = overlap_value;
							else
								self.naturalWondersData[ringPlotIndex] = ripple_value;
							end
						elseif impact_table_number == 7 then
							self.marbleData[ringPlotIndex] = 1;
						end
					end
					currentX, currentY = nextX, nextY;
				end
			end
		end
	else
		print("Unsupported Radius length of ", radius, " passed to PlaceResourceImpact()");
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:ProcessResourceList(frequency, impact_table_number, plot_list, resources_to_place)
	-- Added a random factor to strategic resources - Thalassicus

	-- This function needs to receive two numbers and two tables.
	-- Length of the plotlist is divided by frequency to get the number of 
	-- resources to place. ... The first table is a list of plot indices.
	-- The second table contains subtables, one per resource type, detailing the
	-- resource ID number, quantity, weighting, and impact radius of each applicable
	-- resource. If radius min and max are different, the radius length is variable
	-- and a die roll will determine a value >= min and <= max.
	--
	-- The system may be easiest to manage if the weightings add up to 100, so they
	-- can be handled as percentages, but this is not required.
	--
	-- Impact #s - 1 strategic - 2 luxury - 3 bonus
	-- Res data  - 1 ID - 2 quantity - 3 weight - 4 radius min - 5 radius max
	--
	-- The plot list will be processed sequentially, so randomize it in advance.
	-- The default lists are terrain-oriented and are randomized during __Init
	if plot_list == nil then
		print("Plot list was nil! -ProcessResourceList");
		return
	end
	local iW, iH = Map.GetGridSize();
	local iNumTotalPlots = table.maxn(plot_list);
	local iNumResourcesToPlace = math.ceil(iNumTotalPlots / frequency);
	local iNumResourcesTypes = table.maxn(resources_to_place);
	local res_ID, res_quantity, res_weight, res_min, res_max, res_range, res_threshold = {}, {}, {}, {}, {}, {}, {};
	local totalWeight, accumulatedWeight = 0, 0;
	for index, resource_data in ipairs(resources_to_place) do
		res_ID[index] = resource_data[1];
		res_quantity[index] = resource_data[2];
		res_weight[index] = resource_data[3];
		totalWeight = totalWeight + resource_data[3];
		res_min[index] = resource_data[4];
		res_max[index] = resource_data[5];
		if res_max[index] > res_min[index] then
			res_range[index] = res_max[index] - res_min[index] + 1;
		else
			res_range[index] = -1;
		end
	end
	for index = 1, iNumResourcesTypes do
		-- We'll roll a die and check each resource in turn to see if it is 
		-- the one to get placed in that particular case. The weightings are 
		-- used to decide how much percentage of the total each represents.
		-- This chunk sets the threshold for each resource in turn.
		local threshold = (res_weight[index] + accumulatedWeight) * 10000 / totalWeight;
		table.insert(res_threshold, threshold);
		accumulatedWeight = accumulatedWeight + res_weight[index];
	end
	-- Main loop
	local current_index = 1;
	local avoid_ripples = true;
	for place_resource = 1, iNumResourcesToPlace do
		local placed_this_res = false;
		local use_this_res_index = 1;
		local diceroll = Map.Rand(10000, "Choose resource type - Distribute Resources - Lua");
		for index, threshold in ipairs(res_threshold) do
			if diceroll < threshold then -- Choose this resource type.
				use_this_res_index = index;
				break
			end
		end
		if avoid_ripples == true then -- Still on first pass through plot_list, seek first eligible 0 value on impact matrix.
			for index_to_check = current_index, iNumTotalPlots do
				if index_to_check == iNumTotalPlots then -- Completed first pass of plot_list, now change to seeking lowest value instead of zero value.
					avoid_ripples = false;
				end
				if placed_this_res == true then
					break
				else
					current_index = current_index + 1;
				end
				local plotIndex = plot_list[index_to_check];
				if impact_table_number == 1 then
					if self.strategicData[plotIndex] == 0 then
						local x = (plotIndex - 1) % iW;
						local y = (plotIndex - x - 1) / iW;
						local res_plot = Map.GetPlot(x, y)
						if res_plot:GetResourceType(-1) == -1 then -- Placing this strategic resource in this plot.
							local res_addition = 0;
							if res_range[use_this_res_index] ~= -1 then
								res_addition = Map.Rand(res_range[use_this_res_index], "Resource Radius - Place Resource LUA");
							end
							local quantity = res_quantity[use_this_res_index]
							-- added by azum4roll: give some variance to strategic amounts
							local rand = Map.Rand(10000, "ProcessResourceList - Lua") / 10000
							if (rand >= 0.75) then
								quantity = quantity * 1.2
							elseif (rand < 0.25) then
								quantity = quantity * 0.8
							end
							quantity = math.floor(quantity + 0.5)
							--
							res_plot:SetResourceType(res_ID[use_this_res_index], quantity);
							if (Game.GetResourceUsageType(res_ID[use_this_res_index]) == ResourceUsageTypes.RESOURCEUSAGE_LUXURY) then
								self.totalLuxPlacedSoFar = self.totalLuxPlacedSoFar + 1;
							end
							self:PlaceResourceImpact(x, y, impact_table_number, res_min[use_this_res_index] + res_addition);
							placed_this_res = true;
							self.amounts_of_resources_placed[res_ID[use_this_res_index] + 1] = self.amounts_of_resources_placed[res_ID[use_this_res_index] + 1] + quantity;
						end
					end
				elseif impact_table_number == 2 then
					if self.luxuryData[plotIndex] == 0 then
						local x = (plotIndex - 1) % iW;
						local y = (plotIndex - x - 1) / iW;
						local res_plot = Map.GetPlot(x, y)
						if res_plot:GetResourceType(-1) == -1 then -- Placing this luxury resource in this plot.
							local res_addition = 0;
							if res_range[use_this_res_index] ~= -1 then
								res_addition = Map.Rand(res_range[use_this_res_index], "Resource Radius - Place Resource LUA");
							end
							--print("ProcessResourceList table 2, Resource: " .. res_ID[use_this_res_index] .. ", Quantity: " .. res_quantity[use_this_res_index]);
							res_plot:SetResourceType(res_ID[use_this_res_index], res_quantity[use_this_res_index]);
							self:PlaceResourceImpact(x, y, impact_table_number, res_min[use_this_res_index] + res_addition);
							placed_this_res = true;
							self.amounts_of_resources_placed[res_ID[use_this_res_index] + 1] = self.amounts_of_resources_placed[res_ID[use_this_res_index] + 1] + 1;
						end
					end
				elseif impact_table_number == 3 then
					if self.bonusData[plotIndex] == 0 then
						local x = (plotIndex - 1) % iW;
						local y = (plotIndex - x - 1) / iW;
						local res_plot = Map.GetPlot(x, y)
						if res_plot:GetResourceType(-1) == -1 then -- Placing this bonus resource in this plot.
							local res_addition = 0;
							if res_range[use_this_res_index] ~= -1 then
								res_addition = Map.Rand(res_range[use_this_res_index], "Resource Radius - Place Resource LUA");
							end
							--print("ProcessResourceList table 3, Resource: " .. res_ID[use_this_res_index] .. ", Quantity: " .. res_quantity[use_this_res_index]);
							res_plot:SetResourceType(res_ID[use_this_res_index], res_quantity[use_this_res_index]);
							self:PlaceResourceImpact(x, y, impact_table_number, res_min[use_this_res_index] + res_addition);
							placed_this_res = true;
							self.amounts_of_resources_placed[res_ID[use_this_res_index] + 1] = self.amounts_of_resources_placed[res_ID[use_this_res_index] + 1] + 1;
						end
					end
				end
			end
		end
		if avoid_ripples == false then -- Completed first pass through plot_list, so use backup method.
			local lowest_impact = 98;
			local best_plot;
			for loop, plotIndex in ipairs(plot_list) do
				if impact_table_number == 1 then
					if lowest_impact > self.strategicData[plotIndex] then
						local x = (plotIndex - 1) % iW;
						local y = (plotIndex - x - 1) / iW;
						local res_plot = Map.GetPlot(x, y)
						if res_plot:GetResourceType(-1) == -1 then
							lowest_impact = self.strategicData[plotIndex];
							best_plot = plotIndex;
						end
					end
				elseif impact_table_number == 2 then
					if lowest_impact > self.luxuryData[plotIndex] then
						local x = (plotIndex - 1) % iW;
						local y = (plotIndex - x - 1) / iW;
						local res_plot = Map.GetPlot(x, y)
						if res_plot:GetResourceType(-1) == -1 then
							lowest_impact = self.luxuryData[plotIndex];
							best_plot = plotIndex;
						end
					end
				elseif impact_table_number == 3 then
					if lowest_impact > self.bonusData[plotIndex] then
						local x = (plotIndex - 1) % iW;
						local y = (plotIndex - x - 1) / iW;
						local res_plot = Map.GetPlot(x, y)
						if res_plot:GetResourceType(-1) == -1 then
							lowest_impact = self.bonusData[plotIndex];
							best_plot = plotIndex;
						end
					end
				end
			end
			if best_plot ~= nil then
				local x = (best_plot - 1) % iW;
				local y = (best_plot - x - 1) / iW;
				local res_plot = Map.GetPlot(x, y)
				local res_addition = 0;
				if res_range[use_this_res_index] ~= -1 then
					res_addition = Map.Rand(res_range[use_this_res_index], "Resource Radius - Place Resource LUA");
				end
				--print("ProcessResourceList backup, Resource: " .. res_ID[use_this_res_index] .. ", Quantity: " .. res_quantity[use_this_res_index]);
				res_plot:SetResourceType(res_ID[use_this_res_index], res_quantity[use_this_res_index]);
				self:PlaceResourceImpact(x, y, impact_table_number, res_min[use_this_res_index] + res_addition);
				self.amounts_of_resources_placed[res_ID[use_this_res_index] + 1] = self.amounts_of_resources_placed[res_ID[use_this_res_index] + 1] + res_quantity[use_this_res_index];
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceSpecificNumberOfResources(resource_ID, quantity, amount,
	                         ratio, impact_table_number, min_radius, max_radius, plot_list)
	-- This function needs to receive seven numbers and one table.
	--
	-- Resource_ID is the type of resource to place.
	-- Quantity is the in-game quantity of the resource, or 0 if unquantified resource type.
	-- Amount is the number of plots intended to receive an assignment of this resource.
	--
	-- Ratio should be > 0 and <= 1 and is what determines when secondary and tertiary lists 
	-- come in to play. The actual ratio is (AmountOfResource / PlotsInList). For instance, 
	-- if we are assigning Sugar resources to Marsh, then if we are to assign eight Sugar 
	-- resources, but there are only four Marsh plots in the list, a ratio of 1 would assign
	-- a Sugar to every single marsh plot, and then have to return an unplaced value of 4; 
	-- but a ratio of 0.5 would assign only two Sugars to the four marsh plots, and return a 
	-- value of 6. Any ratio less than or equal to 0.25 would assign one Sugar and return
	-- seven, as the ratio results will be rounded up not down, to the nearest integer.
	--
	-- Impact tables: -1 = ignore, 1 = strategic, 2 = luxury, 3 = bonus, 4 = fish
	-- Radius is amount of impact to place on this table when placing a resource.
	--
	-- nil tables are not acceptable but empty tables are fine
	--
	-- The plot lists will be processed sequentially, so randomize them in advance.
	-- 
	
	--print("-"); print("PlaceSpecificResource called. ResID:", resource_ID, "Quantity:", quantity, "Amount:", amount, "Ratio:", ratio);
	
	if plot_list == nil then
		--print("Plot list was nil! -PlaceSpecificNumberOfResources");
		return
	end
	local bCheckImpact = false;
	local impact_table = {};
	if impact_table_number == 1 then
		bCheckImpact = true;
		impact_table = self.strategicData;
	elseif impact_table_number == 2 then
		bCheckImpact = true;
		impact_table = self.luxuryData;
	elseif impact_table_number == 3 then
		bCheckImpact = true;
		impact_table = self.bonusData;
	elseif impact_table_number == 4 then
		bCheckImpact = true;
		impact_table = self.fishData;
	end
	local iW, iH = Map.GetGridSize();
	local iNumLeftToPlace = amount;
	local iNumPlots = table.maxn(plot_list);
	local iNumResources = math.min(amount, math.ceil(ratio * iNumPlots));
	-- Main loop
	for place_resource = 1, iNumResources do
		for loop, plotIndex in ipairs(plot_list) do
			if resource_ID == self.marble_ID then	-- MOD.Barathor: Temporary Fix: Marble's additional impact and ripple values on the marble layer were originally disregarded.
				if bCheckImpact == false or impact_table[plotIndex] == 0 then
					if self.marbleData[plotIndex] == 0 then
						local x = (plotIndex - 1) % iW;
						local y = (plotIndex - x - 1) / iW;
						local res_plot = Map.GetPlot(x, y)
						if res_plot:GetResourceType(-1) == -1 then -- Placing this resource in this plot.
							res_plot:SetResourceType(resource_ID, quantity);
							self.amounts_of_resources_placed[resource_ID + 1] = self.amounts_of_resources_placed[resource_ID + 1] + quantity;
							self.totalLuxPlacedSoFar = self.totalLuxPlacedSoFar + 1;
							iNumLeftToPlace = iNumLeftToPlace - 1;
							self:PlaceResourceImpact(x, y, 7, 9) 			-- MOD.Barathor: Always emit marble layer ripples, regardless of bCheckImpact.  Using the updated ripple radius value of 9 instead of 6.
							if bCheckImpact == true then
								local res_addition = 0;
								if max_radius > min_radius then
									res_addition = Map.Rand(1 + (max_radius - min_radius), "Resource Radius - Place Resource LUA");
								end
								local radius = min_radius + res_addition;					-- MOD.Barathor: Changed "rad" to "radius"
								self:PlaceResourceImpact(x, y, impact_table_number, radius)	-- MOD.Barathor: Changed "rad" to "radius"
							end
							break
						end
					end
				end
			else
				if bCheckImpact == false or impact_table[plotIndex] == 0 then
					local x = (plotIndex - 1) % iW;
					local y = (plotIndex - x - 1) / iW;
					local res_plot = Map.GetPlot(x, y)
					if res_plot:GetResourceType(-1) == -1 then -- Placing this resource in this plot.
						res_plot:SetResourceType(resource_ID, quantity);
						self.amounts_of_resources_placed[resource_ID + 1] = self.amounts_of_resources_placed[resource_ID + 1] + quantity;
						--print("-"); print("Placed Resource#", resource_ID, "at Plot", x, y);		-- MOD.Barathor: Test
						self.totalLuxPlacedSoFar = self.totalLuxPlacedSoFar + 1;					-- MOD.Barathor: Note -- This is what screws up the original total, as non-luxury resources which use this placement function are added to the total.  
																												 -- Luckily, this happens after all luxuries are already placed. (Unless you use the Strategic Balance setting.)
						--print("Total luxuries placed so far: ", self.totalLuxPlacedSoFar);		-- MOD.Barathor: Test
						iNumLeftToPlace = iNumLeftToPlace - 1;
						if bCheckImpact == true then
							local res_addition = 0;
							if max_radius > min_radius then
								res_addition = Map.Rand(1 + (max_radius - min_radius), "Resource Radius - Place Resource LUA");
							end
							local radius = min_radius + res_addition;					-- MOD.Barathor: Changed "rad" to "radius"
							self:PlaceResourceImpact(x, y, impact_table_number, radius)	-- MOD.Barathor: Changed "rad" to "radius"					
						end
						break
					end
				end
			end
		end
	end
	return iNumLeftToPlace
end
------------------------------------------------------------------------------
function AssignStartingPlots:IdentifyRegionsOfThisType(region_type)
	-- Necessary for assigning luxury types to regions.
	local regions_of_this_type = {};
	for index, current_type in ipairs(self.regionTypes) do
		if current_type == region_type then
			table.insert(regions_of_this_type, index);
		end
	end
	local length = table.maxn(regions_of_this_type);
	if length > 0 then
		local scrambled = GetShuffledCopyOfTable(regions_of_this_type);
		for index, region_to_add in ipairs(scrambled) do
			table.insert(self.regions_sorted_by_type, {region_to_add}) -- Note: adding region number as a table, so this data can be expanded later.
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:SortRegionsByType()
	-- Necessary for assigning luxury types to regions.
	for check_this_type = 1, 10 do -- Valid range for default Region Types. Any regions modders be alert to this.
		self:IdentifyRegionsOfThisType(check_this_type)
	end
	self:IdentifyRegionsOfThisType(0) -- If any Undefined Regions, put them at the bottom of the list.
end
------------------------------------------------------------------------------
function AssignStartingPlots:AssignLuxuryToRegion(region_number)
	-- Assigns a luxury type to an individual region.
	local region_type = self.regionTypes[region_number];
	local luxury_candidates;
	if region_type > 0 and region_type < 11 then -- Note: if number of Region Types is modified, this line and the table to which it refers need adjustment.
		luxury_candidates = self.luxury_region_weights[region_type];
	else
		luxury_candidates = self.luxury_fallback_weights; -- Undefined Region, enable all possible luxury types.
	end
	--
	-- Build options list.
	local iNumAvailableTypes = 0;
	local resource_IDs, resource_weights, res_threshold = {}, {}, {};
	local split_cap = self:GetLuxuriesSplitCap() -- New for expansion. Cap no longer set to hardcoded value of 3.
	local iW, iH = Map.GetGridSize()	-- MOD.Barathor: Added this so water check can be a formula based off of height instead of a hard value.
	
	for index, resource_options in ipairs(luxury_candidates) do
		local res_ID = resource_options[1];
		if self.luxury_assignment_count[res_ID] < split_cap then -- This type still eligible.
			local test = TestMembership(self.resourceIDs_assigned_to_regions, res_ID)
			if self.iNumTypesAssignedToRegions < self.iNumMaxAllowedForRegions or test == true then -- Not a new type that would exceed number of allowed types, so continue.
				-- Water-based resources need to run a series of permission checks: coastal start in region, not a disallowed regions type, enough water, etc.
				if res_ID == self.whale_ID or res_ID == self.pearls_ID or res_ID == self.crab_ID or res_ID == self.coral_ID then
					--MOD.Barathor: Removed unnecessary "regional" restrictions between whales/jungle, pearls/tundra, and crab/desert to make assignments more flexible.
					if self.startLocationConditions[region_number][1] == true then -- This region's start is along an ocean, so water-based luxuries are allowed.
						-- MOD.Barathor: Start
						-- MOD.Barathor: Base required coastal water total off of the target number of regional luxuries to place.
						local target_list = self:GetRegionLuxuryTargetNumbers()
						local target = target_list[self.iNumCivs]
						local water_needed = target * 8
						-- MOD.Barathor: End
						if self.regionTerrainCounts[region_number][8] >= water_needed then -- Enough water available.		-- MOD.Barathor: Updated: Existing = 12; increased this very small value so that enough regional water luxuries can be placed and meet their target.
							table.insert(resource_IDs, res_ID);
							local adjusted_weight = resource_options[2] / (1 + self.luxury_assignment_count[res_ID]) -- If selected before, for a different region, reduce weight.
							table.insert(resource_weights, adjusted_weight);
							iNumAvailableTypes = iNumAvailableTypes + 1;
						end
					end
				-- Land-based resources are automatically approved if they were in the region's option table.
				else
					table.insert(resource_IDs, res_ID);
					local adjusted_weight = resource_options[2] / (1 + self.luxury_assignment_count[res_ID])
					table.insert(resource_weights, adjusted_weight);
					iNumAvailableTypes = iNumAvailableTypes + 1;
				end
			end
		end
	end
	
	-- If options list is empty, pick from fallback options. First try to respect water-resources not being assigned to regions without coastal starts.
	if iNumAvailableTypes == 0 then
		for index, resource_options in ipairs(self.luxury_fallback_weights) do
			local res_ID = resource_options[1];
			if self.luxury_assignment_count[res_ID] < 3 then -- This type still eligible.
				local test = TestMembership(self.resourceIDs_assigned_to_regions, res_ID)
				if self.iNumTypesAssignedToRegions < self.iNumMaxAllowedForRegions or test == true then -- Won't exceed allowed types.
					if res_ID == self.whale_ID or res_ID == self.pearls_ID or res_ID == self.crab_ID or res_ID == self.coral_ID then		-- MOD.Barathor: Fixed -- added missing crab restriction for regional placement
						--MOD.Barathor: Removed unnecessary "regional" restrictions between whales/jungle, pearls/tundra, and crab/desert to make assignments more flexible.
						if self.startLocationConditions[region_number][1] == true then -- This region's start is along an ocean, so water-based luxuries are allowed.
							-- MOD.Barathor: Start
							-- MOD.Barathor: Base required coastal water total off of the target number of regional luxuries to place.
							local target_list = self:GetRegionLuxuryTargetNumbers()
							local target = target_list[self.iNumCivs]
							local water_needed = target * 8
							-- MOD.Barathor: End
							if self.regionTerrainCounts[region_number][8] >= water_needed then -- Enough water available.		-- MOD.Barathor: Updated: Existing = 12; increased this very small value so that enough regional water luxuries can be placed and meet their target.
								table.insert(resource_IDs, res_ID);
								local adjusted_weight = resource_options[2] / (1 + self.luxury_assignment_count[res_ID]) -- If selected before, for a different region, reduce weight.
								table.insert(resource_weights, adjusted_weight);
								iNumAvailableTypes = iNumAvailableTypes + 1;
							end
						end
					else
						table.insert(resource_IDs, res_ID);
						local adjusted_weight = resource_options[2] / (1 + self.luxury_assignment_count[res_ID])
						table.insert(resource_weights, adjusted_weight);
						iNumAvailableTypes = iNumAvailableTypes + 1;
					end
				end
			end
		end
	end

	-- If we get to here and still need to assign a luxury type, it means we have to force a water-based luxury in to this region, period.
	-- This should be the rarest of the rare emergency assignment cases, unless modifications to the system have tightened things too far.
	if iNumAvailableTypes == 0 then
		--print("-"); print("Having to use emergency Luxury assignment process for Region#", region_number);
		--print("This likely means a near-maximum number of civs in this game, and problems with not having enough legal Luxury types to spread around.");
		--print("If you are modifying luxury types or number of regions allowed to get the same type, check to make sure your changes haven't violated the math so each region can have a legal assignment.");
		for index, resource_options in ipairs(self.luxury_fallback_weights) do
			local res_ID = resource_options[1];
			if self.luxury_assignment_count[res_ID] < 3 then -- This type still eligible.
				local test = TestMembership(self.resourceIDs_assigned_to_regions, res_ID)
				if self.iNumTypesAssignedToRegions < self.iNumMaxAllowedForRegions or test == true then -- Won't exceed allowed types.
					table.insert(resource_IDs, res_ID);
					local adjusted_weight = resource_options[2] / (1 + self.luxury_assignment_count[res_ID])
					table.insert(resource_weights, adjusted_weight);
					iNumAvailableTypes = iNumAvailableTypes + 1;
				end
			end
		end
	end
	if iNumAvailableTypes == 0 then -- Bad mojo!
		print("-"); print("FAILED to assign a Luxury type to Region#", region_number); print("-");
	end

	-- Choose luxury.
	local totalWeight = 0;
	for i, this_weight in ipairs(resource_weights) do
		totalWeight = totalWeight + this_weight;
	end
	local accumulatedWeight = 0;
	for index = 1, iNumAvailableTypes do
		local threshold = (resource_weights[index] + accumulatedWeight) * 10000 / totalWeight;
		table.insert(res_threshold, threshold);
		accumulatedWeight = accumulatedWeight + resource_weights[index];
	end
	local use_this_ID;
	local diceroll = Map.Rand(10000, "Choose resource type - Assign Luxury To Region - Lua");
	for index, threshold in ipairs(res_threshold) do
		if diceroll <= threshold then -- Choose this resource type.
			use_this_ID = resource_IDs[index];
			break
		end
	end
	
	return use_this_ID;
end
------------------------------------------------------------------------------
function AssignStartingPlots:GetLuxuriesSplitCap()
	-- This data was separated out to allow easy replacement in map scripts.
	local split_cap = 1;
	-- MOD.Barathor: New -- With a new regional luxury cap of 16, there's no need for a split cap higher than 2 to cover the maximum civ count of 22 (16 x 2 = 32)
	--			   In fact, a split cap of 3 isn't needed in the default game until you pass a civ count of 16 (8 x 2 = 16), not 12.  Split caps higher than 2 are not ideal, and are more random and uneven.
	if self.iNumCivs > 16 then	
		split_cap = 2
	end
	--[[	MOD.Barathor: Disabled
	if self.iNumCivs > 12 then
		split_cap = 3;
	elseif self.iNumCivs > 8 then
		split_cap = 2;
	end
	]]--
	return split_cap
end
------------------------------------------------------------------------------
function AssignStartingPlots:GetCityStateLuxuriesTargetNumber()
	-- This data was separated out to allow easy replacement in map scripts.
	local worldsizes = {
		[GameInfo.Worlds.WORLDSIZE_DUEL.ID] = 3,
		[GameInfo.Worlds.WORLDSIZE_TINY.ID] = 3,
		[GameInfo.Worlds.WORLDSIZE_SMALL.ID] = 3,
		[GameInfo.Worlds.WORLDSIZE_STANDARD.ID] = 3,
		[GameInfo.Worlds.WORLDSIZE_LARGE.ID] = 4,
		[GameInfo.Worlds.WORLDSIZE_HUGE.ID] = 4
		}
	local CSluxCount = worldsizes[Map.GetWorldSize()];
	return CSluxCount
end
------------------------------------------------------------------------------
function AssignStartingPlots:GetDisabledLuxuriesTargetNumber()
	-- This data was separated out to allow easy replacement in map scripts.
	local worldsizes = {
		[GameInfo.Worlds.WORLDSIZE_DUEL.ID] = 10,
		[GameInfo.Worlds.WORLDSIZE_TINY.ID] = 7,
		[GameInfo.Worlds.WORLDSIZE_SMALL.ID] = 5,
		[GameInfo.Worlds.WORLDSIZE_STANDARD.ID] = 3,
		[GameInfo.Worlds.WORLDSIZE_LARGE.ID] = 1,
		[GameInfo.Worlds.WORLDSIZE_HUGE.ID] = 0
		}
	local maxToDisable = worldsizes[Map.GetWorldSize()];
	return maxToDisable
	-- MOD.Barathor: Update: This function is no longer used. Original code restored.
	--[[ 
		 MOD.Barathor: 
		 Updated: original values were 10, 7, 5, 3, 1, 0
		 The new target numbers keep total luxuries somewhat similar to the original game
		 default total luxuries: 10, 13, 15, 17, 19, 20
	         new total luxuries: 10, 13, 15, 17, 19, 22  (Huge really needed more anyway)
	
	local worldsizes = {								-- MOD.Barathor: Using the default values and keeping things the same:
		[GameInfo.Worlds.WORLDSIZE_DUEL.ID] = 18,		-- MOD.Barathor: 28 - ( 2 regional + 1 marble + 3 city-state + 4 random) = 18
		[GameInfo.Worlds.WORLDSIZE_TINY.ID] = 15,		-- MOD.Barathor: 28 - ( 4 regional + 1 marble + 3 city-state + 5 random) = 15
		[GameInfo.Worlds.WORLDSIZE_SMALL.ID] = 13,		-- MOD.Barathor: 28 - ( 6 regional + 1 marble + 3 city-state + 5 random) = 13
		[GameInfo.Worlds.WORLDSIZE_STANDARD.ID] = 11,	-- MOD.Barathor: 28 - ( 8 regional + 1 marble + 3 city-state + 5 random) = 11
		[GameInfo.Worlds.WORLDSIZE_LARGE.ID] = 9,		-- MOD.Barathor: 28 - (10 regional + 1 marble + 3 city-state + 5 random) =  9
		[GameInfo.Worlds.WORLDSIZE_HUGE.ID] = 6,		-- MOD.Barathor: 28 - (12 regional + 1 marble + 3 city-state + 6 random) =  6
		}
	local maxToDisable = worldsizes[Map.GetWorldSize()];
	return maxToDisable
	--]]
end
------------------------------------------------------------------------------
function AssignStartingPlots:GetRandomLuxuriesTargetNumber()
	--[[ MOD.Barathor:
		 This data was separated out to allow easy replacement in map scripts.
		 With more luxuries available, this ensures that the total luxuries used each game
		 still match the default game, except for Huge, which really needed a few more anyway! ]]
	local worldsizes = {							
		[GameInfo.Worlds.WORLDSIZE_DUEL.ID] = 4,
		[GameInfo.Worlds.WORLDSIZE_TINY.ID] = 5,
		[GameInfo.Worlds.WORLDSIZE_SMALL.ID] = 5,
		[GameInfo.Worlds.WORLDSIZE_STANDARD.ID] = 5,
		[GameInfo.Worlds.WORLDSIZE_LARGE.ID] = 7,
		[GameInfo.Worlds.WORLDSIZE_HUGE.ID] = 9,
		}
	local maxRandoms = worldsizes[Map.GetWorldSize()]
	return maxRandoms
end
------------------------------------------------------------------------------
function AssignStartingPlots:AssignLuxuryRoles()
	-- Each region gets an individual Luxury type assigned to it.
	-- Each Luxury type can be assigned to no more than three regions.
	-- No more than nine total Luxury types will be assigned to regions.
	-- Between two and four Luxury types will be assigned to City States.
	-- Remaining Luxury types will be distributed at random or left out.
	--
	-- Luxury roles must be assigned before City States can be placed.
	-- This is because civs who are forced to share their luxury type with other 
	-- civs may get extra city states placed in their region to compensate.

	self:SortRegionsByType() -- creates self.regions_sorted_by_type, which will be expanded to store all data regarding regional luxuries.

	-- Assign a luxury to each region.
	for index, region_info in ipairs(self.regions_sorted_by_type) do
		local region_number = region_info[1];
		local resource_ID = self:AssignLuxuryToRegion(region_number)
		self.regions_sorted_by_type[index][2] = resource_ID; -- This line applies the assignment.
		self.region_luxury_assignment[region_number] = resource_ID;
		self.luxury_assignment_count[resource_ID] = self.luxury_assignment_count[resource_ID] + 1; -- Track assignments
		--
		--print("-"); print("Region#", region_number, " of type ", self.regionTypes[region_number], " has been assigned Luxury ID#", resource_ID);
		--
		local already_assigned = TestMembership(self.resourceIDs_assigned_to_regions, resource_ID)
		if not already_assigned then
			table.insert(self.resourceIDs_assigned_to_regions, resource_ID);
			self.iNumTypesAssignedToRegions = self.iNumTypesAssignedToRegions + 1;
			-- self.iNumTypesUnassigned = self.iNumTypesUnassigned - 1;	-- MOD.Barathor: This is no longer needed.
		end
	end
	
	-- Assign three of the remaining types to be exclusive to City States.
	-- Build options list.
	local iNumAvailableTypes = 0;
	local resource_IDs, resource_weights = {}, {};
	for index, resource_options in ipairs(self.luxury_city_state_weights) do
		local res_ID = resource_options[1];
		local test = TestMembership(self.resourceIDs_assigned_to_regions, res_ID)
		if test == false then
			table.insert(resource_IDs, res_ID);
			table.insert(resource_weights, resource_options[2]);
			iNumAvailableTypes = iNumAvailableTypes + 1;
		else
			--print("Luxury ID#", res_ID, "rejected by City States as already belonging to Regions.");
		end
	end
	if iNumAvailableTypes < 3 then
		print("---------------------------------------------------------------------------------------");
		print("- Luxuries have been modified in ways disruptive to the City State Assignment Process -");
		print("---------------------------------------------------------------------------------------");
	end
	-- Choose luxuries.
	for cs_lux = 1, 3 do
		local totalWeight = 0;
		local res_threshold = {};
		for i, this_weight in ipairs(resource_weights) do
			totalWeight = totalWeight + this_weight;
		end
		local accumulatedWeight = 0;
		for index, weight in ipairs(resource_weights) do
			local threshold = (weight + accumulatedWeight) * 10000 / totalWeight;
			table.insert(res_threshold, threshold);
			accumulatedWeight = accumulatedWeight + resource_weights[index];
		end
		local use_this_ID;
		local diceroll = Map.Rand(10000, "Choose resource type - City State Luxuries - Lua");
		for index, threshold in ipairs(res_threshold) do
			if diceroll < threshold then -- Choose this resource type.
				use_this_ID = resource_IDs[index];
				table.insert(self.resourceIDs_assigned_to_cs, use_this_ID);
				table.remove(resource_IDs, index);
				table.remove(resource_weights, index);
				--self.iNumTypesUnassigned = self.iNumTypesUnassigned - 1;	-- MOD.Barathor: This is no longer needed.
				--print("-"); print("City States have been assigned Luxury ID#", use_this_ID);
				break
			end
		end
	end
	
	-- Assign Marble to special casing.
	table.insert(self.resourceIDs_assigned_to_special_case, self.marble_ID);
	--self.iNumTypesUnassigned = self.iNumTypesUnassigned - 1;	-- MOD.Barathor: This is no longer needed.
	
	--[[ MOD.Barathor.Barthor:
	
	Modified the next block of code so that increasing the civ count on maps below the maximum Regional 
	luxury total (which is now all of them) won't subtract from the Random total first. 
	Instead, the Disabled total will adjust to whatever is leftover after assignments.
	
	This also optimizes the functionality of the Fallback weights table, so that flexible luxuries can 
	be given a heavier weight when needed as a regional fallback and also will be more likely to be chosen 
	for ranodm distribution throughout the map.  The old default method didn't use weightings for choosing
	random luxuries and instead randomly chose a number of luxuries to disable, then chose all the rest.
	
	--]]
	
	-- MOD.Barathor: Start 
	-- MOD.Barathor: Assign some luxuries to random distribution, disable the rest.
	local remaining_resource_IDs, rand_resource_IDs, rand_resource_weights = {}, {}, {}
	for index, resource_options in ipairs(self.luxury_fallback_weights) do
		local res_ID = resource_options[1]
		local test1 = TestMembership(self.resourceIDs_assigned_to_regions, res_ID)
		local test2 = TestMembership(self.resourceIDs_assigned_to_cs, res_ID)
		if test1 == false and test2 == false then
			table.insert(rand_resource_IDs, res_ID)
			table.insert(rand_resource_weights, resource_options[2])
		else
			--print("Luxury ID#", res_ID, "rejected by Randoms as already belonging to Regions or City States.")
		end
	end	
	
	self.iNumTypesRandom = self:GetRandomLuxuriesTargetNumber()	
	for rand_lux = 1, self.iNumTypesRandom do
		local totalWeight = 0
		local res_threshold = {}
		for i, this_weight in ipairs(rand_resource_weights) do
			totalWeight = totalWeight + this_weight
		end
		local accumulatedWeight = 0
		for index, weight in ipairs(rand_resource_weights) do
			local threshold = (weight + accumulatedWeight) * 10000 / totalWeight
			table.insert(res_threshold, threshold)
			accumulatedWeight = accumulatedWeight + rand_resource_weights[index]
		end
		local use_this_ID
		local diceroll = Map.Rand(10000, "Choose resource type - Random Luxuries - Lua")
		for index, threshold in ipairs(res_threshold) do
			if diceroll < threshold then -- Choose this resource type.
				use_this_ID = rand_resource_IDs[index]
				table.insert(self.resourceIDs_assigned_to_random, use_this_ID)
				table.remove(rand_resource_IDs, index)
				table.remove(rand_resource_weights, index)
				--print("-") print("Luxury ID#", use_this_ID, "assigned to Random.")
				break
			end
		end
	end
	
	-- MOD.Barathor: Assign remaining luxuries to Disabled.
	for index, resource_options in ipairs(self.luxury_fallback_weights) do
		local res_ID = resource_options[1]
		--print("-") print("Luxury ID#", res_ID, "checking to disable.")
		local test1 = TestMembership(self.resourceIDs_assigned_to_regions, res_ID)
		local test2 = TestMembership(self.resourceIDs_assigned_to_cs, res_ID)
		local test3 = TestMembership(self.resourceIDs_assigned_to_random, res_ID)
		if test1 == false and test2 == false and test3 == false then
			table.insert(self.resourceIDs_not_being_used, res_ID)
			--print("-") print("Luxury ID#", res_ID, "disabled.")
		else
			--print("Luxury ID#", res_ID, "cannot be disabled and already assigned.")
		end
	end
	-- MOD.Barathor: End
	
	--[[ -- MOD.Barathor: Disabled old method
	-- Assign appropriate amount to be Disabled, then assign the rest to be Random.
	local maxToDisable = self:GetDisabledLuxuriesTargetNumber()
	self.iNumTypesDisabled = math.min(self.iNumTypesUnassigned, maxToDisable);
	self.iNumTypesRandom = self.iNumTypesUnassigned - self.iNumTypesDisabled;
	local remaining_resource_IDs = {};
	for index, resource_options in ipairs(self.luxury_fallback_weights) do
		local res_ID = resource_options[1];
		local test1 = TestMembership(self.resourceIDs_assigned_to_regions, res_ID)
		local test2 = TestMembership(self.resourceIDs_assigned_to_cs, res_ID)
		if test1 == false and test2 == false then
			table.insert(remaining_resource_IDs, res_ID);
		end
	end
	local randomized_version = GetShuffledCopyOfTable(remaining_resource_IDs)
	local countdown = math.min(self.iNumTypesUnassigned, maxToDisable);
	for loop, resID in ipairs(randomized_version) do
		if countdown > 0 then
			table.insert(self.resourceIDs_not_being_used, resID);
			countdown = countdown - 1;
		else
			table.insert(self.resourceIDs_assigned_to_random, resID);
		end
	end
	--]]
	
	-- Debug printout of luxury assignments.
	print("--- Luxury Assignment Table ---");
	print("-"); print("- - Assigned to Regions - -");
	for index, data in ipairs(self.regions_sorted_by_type) do
		print("Region#", data[1], "has Luxury type", data[2]);
	end
	print("-"); print("Total unique regional luxuries: ", self.iNumTypesAssignedToRegions);		-- MOD.Barathor: New -- I just added this for easier debugging and some other tests.
	print("-"); print("- - Assigned to City States - -");
	for index, type in ipairs(self.resourceIDs_assigned_to_cs) do
		print("Luxury type", type);
	end
	print("-"); print("- - Assigned to Random - -");
	for index, type in ipairs(self.resourceIDs_assigned_to_random) do
		print("Luxury type", type);
	end
	print("-"); print("- - Luxuries handled via Special Case - -");
	for index, type in ipairs(self.resourceIDs_assigned_to_special_case) do
		print("Luxury type", type);
	end
	print("-"); print("- - Disabled - -");
	for index, type in ipairs(self.resourceIDs_not_being_used) do
		print("Luxury type", type);
	end
	print("- - - - - - - - - - - - - - - -");
	--	
end
------------------------------------------------------------------------------
function AssignStartingPlots:GetListOfAllowableLuxuriesAtCitySite(x, y, radius)
	--print("-"); print("- -"); print("Getting list of luxuries allowable at city state site:", x, y, "Radius:", radius);
	local iW, iH = Map.GetGridSize();
	local wrapX = Map:IsWrapX();
	local wrapY = Map:IsWrapY();
	local odd = self.firstRingYIsOdd;
	local even = self.firstRingYIsEven;
	local nextX, nextY, plot_adjustments;
	local allowed_luxuries = table.fill(false, 99);		-- MOD.Barathor: original = 35; updated to hold higher luxury ID's
	
	for ripple_radius = 1, radius do
		local ripple_value = radius - ripple_radius + 1;
		local currentX = x - ripple_radius;
		local currentY = y;
		for direction_index = 1, 6 do
			for plot_to_handle = 1, ripple_radius do
			 	if currentY / 2 > math.floor(currentY / 2) then
					plot_adjustments = odd[direction_index];
				else
					plot_adjustments = even[direction_index];
				end
				nextX = currentX + plot_adjustments[1];
				nextY = currentY + plot_adjustments[2];
				if wrapX == false and (nextX < 0 or nextX >= iW) then
					-- X is out of bounds.
				elseif wrapY == false and (nextY < 0 or nextY >= iH) then
					-- Y is out of bounds.
				else
					local realX = nextX;
					local realY = nextY;
					if wrapX then
						realX = realX % iW;
					end
					if wrapY then
						realY = realY % iH;
					end
					-- We've arrived at the correct x and y for the current plot.
					local plot = Map.GetPlot(realX, realY);
					local plotType = plot:GetPlotType()
					local terrainType = plot:GetTerrainType()
					local featureType = plot:GetFeatureType()
					local plotIndex = realY * iW + realX + 1;
					-- MOD.Barathor: Start
					--[[ MOD.Barathor: Fixed: Check to make sure this plot doesn't already contain a resource!
						 This corrects a rare bug that occurs and denies some civs their 2nd bonus luxury type, since 
						 it would mark a tile's resource options to "true" when there's already a regional luxury present. ]]
					if plot:GetResourceType(-1) == -1 then	
						-- Check this plot for luxury placement eligibility. Set allowed luxuries to true.
						--[[ MOD.Barathor: Updated all conditions below.  Also added expansion and mod luxuries.
							 This function is used for placing luxuries at city-states and second types at civ starts. ]]
						if plotType == PlotTypes.PLOT_OCEAN then -- Testing for Water Luxury eligibility. This is more involved than land-based.
							if terrainType == TerrainTypes.TERRAIN_COAST then
								if plot:IsLake() == false then
									if featureType ~= self.feature_atoll and featureType ~= FeatureTypes.FEATURE_ICE then
										allowed_luxuries[self.whale_ID] = true
										allowed_luxuries[self.pearls_ID] = true
										allowed_luxuries[self.crab_ID] = true
										allowed_luxuries[self.coral_ID] = true
									end
								end
							end
						--[[ MOD.Barathor: With my new FixResourceGraphics(), plot and feature type doesn't matter.
							 The only important thing is the terrain type. This greatly increases the flexibility of
							 placing luxuries at city-states and can easily support more diversity in assignments. ]]
						elseif plotType == PlotTypes.PLOT_HILLS or plotType == PlotTypes.PLOT_LAND then
							if terrainType == TerrainTypes.TERRAIN_TUNDRA then
								allowed_luxuries[self.marble_ID] = true
								allowed_luxuries[self.gold_ID] = true
								allowed_luxuries[self.silver_ID] = true
								allowed_luxuries[self.copper_ID] = true	
								allowed_luxuries[self.gems_ID] = true
								allowed_luxuries[self.salt_ID] = true
								allowed_luxuries[self.jade_ID] = true
								allowed_luxuries[self.amber_ID] = true
								allowed_luxuries[self.lapis_ID] = true
								--
								allowed_luxuries[self.fur_ID] = true
								allowed_luxuries[self.dye_ID] = true
								-- MOD.HungryForFood
								if self:IsEvenMoreResourcesActive() == true then
									allowed_luxuries[self.obsidian_ID] = true
									allowed_luxuries[self.platinum_ID] = true
									allowed_luxuries[self.tin_ID] = true
								end
							elseif terrainType == TerrainTypes.TERRAIN_DESERT then
								allowed_luxuries[self.marble_ID] = true
								allowed_luxuries[self.gold_ID] = true
								allowed_luxuries[self.silver_ID] = true
								allowed_luxuries[self.copper_ID] = true	
								allowed_luxuries[self.gems_ID] = true
								allowed_luxuries[self.salt_ID] = true
								allowed_luxuries[self.jade_ID] = true
								allowed_luxuries[self.amber_ID] = true
								allowed_luxuries[self.lapis_ID] = true
								--
								allowed_luxuries[self.incense_ID] = true
								allowed_luxuries[self.ivory_ID] = true
								-- MOD.HungryForFood
								if self:IsEvenMoreResourcesActive() == true then
									allowed_luxuries[self.obsidian_ID] = true
									allowed_luxuries[self.platinum_ID] = true
									allowed_luxuries[self.poppy_ID] = true
									allowed_luxuries[self.tin_ID] = true
								end
							elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
								allowed_luxuries[self.marble_ID] = true
								allowed_luxuries[self.gold_ID] = true
								allowed_luxuries[self.silver_ID] = true
								allowed_luxuries[self.copper_ID] = true	
								allowed_luxuries[self.gems_ID] = true
								allowed_luxuries[self.salt_ID] = true
								allowed_luxuries[self.jade_ID] = true
								allowed_luxuries[self.amber_ID] = true
								allowed_luxuries[self.lapis_ID] = true
								--
								allowed_luxuries[self.spices_ID] = true
								allowed_luxuries[self.silk_ID] = true
								allowed_luxuries[self.sugar_ID] = true
								allowed_luxuries[self.citrus_ID] = true
								allowed_luxuries[self.truffles_ID] = true
								allowed_luxuries[self.cocoa_ID] = true
								allowed_luxuries[self.fur_ID] = true
								allowed_luxuries[self.dye_ID] = true
								--
								allowed_luxuries[self.cotton_ID] = true
								allowed_luxuries[self.wine_ID] = true
								allowed_luxuries[self.ivory_ID] = true
								allowed_luxuries[self.coffee_ID] = true
								allowed_luxuries[self.tea_ID] = true
								allowed_luxuries[self.tobacco_ID] = true
								allowed_luxuries[self.perfume_ID] = true
								allowed_luxuries[self.olives_ID] = true
								allowed_luxuries[self.incense_ID] = true
								-- MOD.HungryForFood
								if self:IsEvenMoreResourcesActive() == true then
									allowed_luxuries[self.lavender_ID] = true
									allowed_luxuries[self.obsidian_ID] = true
									allowed_luxuries[self.platinum_ID] = true
									allowed_luxuries[self.poppy_ID] = true
									allowed_luxuries[self.tin_ID] = true
								end
							elseif terrainType == TerrainTypes.TERRAIN_GRASS then
								allowed_luxuries[self.marble_ID] = true
								allowed_luxuries[self.gold_ID] = true
								allowed_luxuries[self.silver_ID] = true
								allowed_luxuries[self.copper_ID] = true	
								allowed_luxuries[self.gems_ID] = true
								allowed_luxuries[self.salt_ID] = true
								allowed_luxuries[self.jade_ID] = true
								allowed_luxuries[self.amber_ID] = true
								allowed_luxuries[self.lapis_ID] = true
								--
								allowed_luxuries[self.spices_ID] = true
								allowed_luxuries[self.silk_ID] = true
								allowed_luxuries[self.sugar_ID] = true
								allowed_luxuries[self.citrus_ID] = true
								allowed_luxuries[self.truffles_ID] = true
								allowed_luxuries[self.cocoa_ID] = true
								allowed_luxuries[self.fur_ID] = true
								allowed_luxuries[self.dye_ID] = true
								--
								allowed_luxuries[self.cotton_ID] = true
								allowed_luxuries[self.wine_ID] = true
								allowed_luxuries[self.ivory_ID] = true
								allowed_luxuries[self.coffee_ID] = true
								allowed_luxuries[self.tea_ID] = true
								allowed_luxuries[self.tobacco_ID] = true
								allowed_luxuries[self.perfume_ID] = true
								allowed_luxuries[self.olives_ID] = true	
								allowed_luxuries[self.incense_ID] = true
								-- MOD.HungryForFood
								if self:IsEvenMoreResourcesActive() == true then
									allowed_luxuries[self.lavender_ID] = true
									allowed_luxuries[self.obsidian_ID] = true
									allowed_luxuries[self.platinum_ID] = true
									allowed_luxuries[self.poppy_ID] = true
									allowed_luxuries[self.tin_ID] = true
								end
							end
						end
					end
					-- MOD.Barathor: End
					currentX, currentY = nextX, nextY;
				end
			end
		end
	end
	return allowed_luxuries
end
------------------------------------------------------------------------------
function AssignStartingPlots:GenerateLuxuryPlotListsAtCitySite(x, y, radius, bRemoveFeatureIce)
	-- bRemoveFeatureIce is piggybacked on to this function to reduce redundant code.
	-- If ice is being removed from around a plot, ONLY that will occur. If both ice 
	-- removal and plot list generation are desired, call this function twice.
	--print("GenerateLuxuryPlotListsAtCitySite called. RemoveIce:", bRemoveFeatureIce, "Plot:", x, y, "Radius:", radius);
	local iW, iH = Map.GetGridSize();
	local wrapX = Map:IsWrapX();
	local wrapY = Map:IsWrapY();
	local odd = self.firstRingYIsOdd;
	local even = self.firstRingYIsEven;
	local nextX, nextY, plot_adjustments;

	local region_coast, region_marsh, region_flood_plains, region_tundra_flat_including_forests = {}, {}, {}, {};
	local region_hills_open, region_hills_covered, region_hills_jungle, region_hills_forest = {}, {}, {}, {};
	local region_desert_flat_no_feature, region_plains_flat_no_feature, region_jungle_flat = {}, {}, {};
	local region_forest_flat, region_forest_flat_but_not_tundra = {}, {};
	local region_dry_grass_flat_no_feature, region_fresh_water_grass_flat_no_feature = {}, {};
	local region_dry_plains_flat_no_feature, region_fresh_water_plains_flat_no_feature = {}, {};								-- MOD.Barathor: New
	local region_desert_or_tundra_flat_no_feature, region_grass_flat_no_feature = {}, {};										-- MOD.Barathor: New
	local region_tundra_flat_no_feature, region_tundra_flat_forest = {}, {};													-- MOD.Barathor: New
	local region_hills_open_no_tundra, region_hills_open_no_desert, region_hills_open_no_tundra_no_desert = {}, {}, {};			-- MOD.Barathor: New
	local region_hills_open_no_grass, region_hills_open_no_grass_no_tundra, region_hills_covered_no_tundra = {}, {}, {};		-- MOD.Barathor: New
	local region_hills_covered_no_grass, region_hills_covered_no_grass_no_tundra, region_flat_covered = {}, {}, {};				-- MOD.Barathor: New
	local region_flat_covered_no_grass, region_flat_covered_no_tundra, region_flat_covered_no_grass_no_tundra = {}, {}, {};		-- MOD.Barathor: New
	local region_flat_open, region_flat_open_no_grass_no_plains, region_flat_open_no_tundra_no_desert = {}, {}, {};				-- MOD.Barathor: New
	local region_flat_open_no_desert, region_flat_desert_including_flood, region_hills_open_no_grass_no_plains = {}, {}, {};	-- MOD.Barathor: New
	
	-- Iterate through the city's plots, building the fifteen lists defined above.
	-- For notes on how the hex-iteration works, refer to PlaceResourceImpact()
	if radius > 0 and radius < 6 then
		for ripple_radius = 1, radius do
			local ripple_value = radius - ripple_radius + 1;
			local currentX = x - ripple_radius;
			local currentY = y;
			for direction_index = 1, 6 do
				for plot_to_handle = 1, ripple_radius do
				 	if currentY / 2 > math.floor(currentY / 2) then
						plot_adjustments = odd[direction_index];
					else
						plot_adjustments = even[direction_index];
					end
					nextX = currentX + plot_adjustments[1];
					nextY = currentY + plot_adjustments[2];
					if wrapX == false and (nextX < 0 or nextX >= iW) then
						-- X is out of bounds.
					elseif wrapY == false and (nextY < 0 or nextY >= iH) then
						-- Y is out of bounds.
					else
						local realX = nextX;
						local realY = nextY;
						if wrapX then
							realX = realX % iW;
						end
						if wrapY then
							realY = realY % iH;
						end
						-- We've arrived at the correct x and y for the current plot.
						local plot = Map.GetPlot(realX, realY);
						
						local plotType = plot:GetPlotType()
						local terrainType = plot:GetTerrainType()
						local featureType = plot:GetFeatureType()
						local plotIndex = realY * iW + realX + 1;
						
						-- If Ice removal is enabled, process only that.
						if bRemoveFeatureIce == true then
							if featureType == FeatureTypes.FEATURE_ICE then
								plot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
							end
							
						-- Otherwise generate the plot lists.
						else
							if plotType == PlotTypes.PLOT_OCEAN then
								if terrainType == TerrainTypes.TERRAIN_COAST then
									if plot:IsLake() == false then
										if featureType ~= self.feature_atoll and featureType ~= FeatureTypes.FEATURE_ICE then
											table.insert(region_coast, plotIndex);
										end
									end
								end
							elseif plotType == PlotTypes.PLOT_HILLS and terrainType ~= TerrainTypes.TERRAIN_SNOW then
								if featureType == FeatureTypes.NO_FEATURE then
									table.insert(region_hills_open, plotIndex);
									if terrainType == TerrainTypes.TERRAIN_TUNDRA then								-- MOD.Barathor: New Condition
										table.insert(region_hills_open_no_desert, plotIndex);						-- MOD.Barathor: New
										table.insert(region_hills_open_no_grass, plotIndex);						-- MOD.Barathor: New
										table.insert(region_hills_open_no_grass_no_plains, plotIndex);				-- MOD.Barathor: New
									elseif terrainType == TerrainTypes.TERRAIN_DESERT then
										table.insert(region_hills_open_no_tundra, plotIndex);						-- MOD.Barathor: New
										table.insert(region_hills_open_no_grass, plotIndex);						-- MOD.Barathor: New
										table.insert(region_hills_open_no_grass_no_tundra, plotIndex);				-- MOD.Barathor: New
										table.insert(region_hills_open_no_grass_no_plains, plotIndex);				-- MOD.Barathor: New
									elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
										table.insert(region_hills_open_no_tundra, plotIndex);						-- MOD.Barathor: New
										table.insert(region_hills_open_no_desert, plotIndex);						-- MOD.Barathor: New
										table.insert(region_hills_open_no_grass, plotIndex);						-- MOD.Barathor: New
										table.insert(region_hills_open_no_grass_no_tundra, plotIndex);				-- MOD.Barathor: New
										table.insert(region_hills_open_no_tundra_no_desert, plotIndex);				-- MOD.Barathor: New
									elseif terrainType == TerrainTypes.TERRAIN_GRASS then
										table.insert(region_hills_open_no_tundra, plotIndex);						-- MOD.Barathor: New
										table.insert(region_hills_open_no_desert, plotIndex);						-- MOD.Barathor: New
										table.insert(region_hills_open_no_tundra_no_desert, plotIndex);				-- MOD.Barathor: New
									end
								elseif featureType == FeatureTypes.FEATURE_JUNGLE then		
									table.insert(region_hills_jungle, plotIndex);
									table.insert(region_hills_covered, plotIndex);
									if terrainType == TerrainTypes.TERRAIN_PLAINS then								-- MOD.Barathor: New Condition
										table.insert(region_hills_covered_no_tundra, plotIndex);					-- MOD.Barathor: New
										table.insert(region_hills_covered_no_grass, plotIndex);						-- MOD.Barathor: New
										table.insert(region_hills_covered_no_grass_no_tundra, plotIndex);			-- MOD.Barathor: New
									elseif terrainType == TerrainTypes.TERRAIN_GRASS then
										table.insert(region_hills_covered_no_tundra, plotIndex);					-- MOD.Barathor: New
									end
								elseif featureType == FeatureTypes.FEATURE_FOREST then		
									table.insert(region_hills_forest, plotIndex);
									table.insert(region_hills_covered, plotIndex);
									if terrainType == TerrainTypes.TERRAIN_TUNDRA then
										table.insert(region_hills_covered_no_grass, plotIndex);						-- MOD.Barathor: New
									elseif terrainType == TerrainTypes.TERRAIN_PLAINS then							-- MOD.Barathor: New Condition
										table.insert(region_hills_covered_no_tundra, plotIndex);					-- MOD.Barathor: New
										table.insert(region_hills_covered_no_grass, plotIndex);						-- MOD.Barathor: New
										table.insert(region_hills_covered_no_grass_no_tundra, plotIndex);			-- MOD.Barathor: New
									elseif terrainType == TerrainTypes.TERRAIN_GRASS then							-- MOD.Barathor: New Condition
										table.insert(region_hills_covered_no_tundra, plotIndex);					-- MOD.Barathor: New
									end
								end
							elseif plotType == PlotTypes.PLOT_LAND then
								if featureType == FeatureTypes.NO_FEATURE then
									if terrainType == TerrainTypes.TERRAIN_TUNDRA then
										table.insert(region_tundra_flat_no_feature, plotIndex);						-- MOD.Barathor: New
										table.insert(region_desert_or_tundra_flat_no_feature, plotIndex);			-- MOD.Barathor: New
										table.insert(region_tundra_flat_including_forests, plotIndex);
										table.insert(region_flat_open, plotIndex);									-- MOD.Barathor: New
										table.insert(region_flat_open_no_desert, plotIndex);						-- MOD.Barathor: New
										table.insert(region_flat_open_no_grass_no_plains, plotIndex);				-- MOD.Barathor: New
									elseif terrainType == TerrainTypes.TERRAIN_DESERT then
										table.insert(region_desert_flat_no_feature, plotIndex);
										table.insert(region_desert_or_tundra_flat_no_feature, plotIndex);			-- MOD.Barathor: New
										table.insert(region_flat_open, plotIndex);									-- MOD.Barathor: New
										table.insert(region_flat_open_no_grass_no_plains, plotIndex);				-- MOD.Barathor: New
										table.insert(region_flat_desert_including_flood, plotIndex);				-- MOD.Barathor: New
									elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
										table.insert(region_plains_flat_no_feature, plotIndex);
										table.insert(region_flat_open_no_desert, plotIndex);						-- MOD.Barathor: New
										table.insert(region_flat_open, plotIndex);									-- MOD.Barathor: New
										table.insert(region_flat_open_no_tundra_no_desert, plotIndex);				-- MOD.Barathor: New
										if plot:IsFreshWater() then													-- MOD.Barathor: New Condition -- fresh water check
											table.insert(region_fresh_water_plains_flat_no_feature, plotIndex);		-- MOD.Barathor: New
										else
											table.insert(region_dry_plains_flat_no_feature, plotIndex);				-- MOD.Barathor: New
										end
									elseif terrainType == TerrainTypes.TERRAIN_GRASS then
										table.insert(region_grass_flat_no_feature, plotIndex);						-- MOD.Barathor: New
										table.insert(region_flat_open_no_desert, plotIndex);						-- MOD.Barathor: New
										table.insert(region_flat_open, plotIndex);									-- MOD.Barathor: New
										table.insert(region_flat_open_no_tundra_no_desert, plotIndex);				-- MOD.Barathor: New
										if plot:IsFreshWater() then
											table.insert(region_fresh_water_grass_flat_no_feature, plotIndex);
										else
											table.insert(region_dry_grass_flat_no_feature, plotIndex);
										end
									end
								elseif featureType == FeatureTypes.FEATURE_MARSH then		
									table.insert(region_marsh, plotIndex);
								elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then		
									table.insert(region_flood_plains, plotIndex);
									table.insert(region_flat_desert_including_flood, plotIndex);					-- MOD.Barathor: New
								elseif featureType == FeatureTypes.FEATURE_JUNGLE then		
									table.insert(region_jungle_flat, plotIndex);
									if terrainType == TerrainTypes.TERRAIN_PLAINS then								-- MOD.Barathor: New Condition
										table.insert(region_flat_covered_no_tundra, plotIndex);						-- MOD.Barathor: New
										table.insert(region_flat_covered_no_grass, plotIndex);						-- MOD.Barathor: New
										table.insert(region_flat_covered_no_grass_no_tundra, plotIndex);			-- MOD.Barathor: New
									elseif terrainType == TerrainTypes.TERRAIN_GRASS then
										table.insert(region_flat_covered_no_tundra, plotIndex);						-- MOD.Barathor: New
									end
								elseif featureType == FeatureTypes.FEATURE_FOREST then		
									table.insert(region_forest_flat, plotIndex);
									if terrainType == TerrainTypes.TERRAIN_TUNDRA then
										table.insert(region_tundra_flat_including_forests, plotIndex);
										table.insert(region_tundra_flat_forest, plotIndex);							-- MOD.Barathor: New
										table.insert(region_flat_covered_no_grass, plotIndex);						-- MOD.Barathor: New
									elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
										table.insert(region_forest_flat_but_not_tundra, plotIndex);
										table.insert(region_flat_covered_no_tundra, plotIndex);						-- MOD.Barathor: New
										table.insert(region_flat_covered_no_grass_no_tundra, plotIndex);			-- MOD.Barathor: New
										table.insert(region_flat_covered_no_grass, plotIndex);						-- MOD.Barathor: New
									elseif terrainType == TerrainTypes.TERRAIN_GRASS then
										table.insert(region_forest_flat_but_not_tundra, plotIndex);
										table.insert(region_flat_covered_no_tundra, plotIndex);						-- MOD.Barathor: New
									end
								end
							end
						end
					end
					currentX, currentY = nextX, nextY;
				end
			end
		end
	end
			
	local results_table = {
	region_coast, -- (Coast next to land)		-- 1
	region_marsh,								-- 2
	region_flood_plains,						-- 3
	region_hills_open,							-- 4
	region_hills_covered,						-- 5
	region_hills_jungle,						-- 6
	region_hills_forest,						-- 7
	region_jungle_flat,							-- 8
	region_forest_flat,							-- 9
	region_desert_flat_no_feature,				-- 10
	region_plains_flat_no_feature,				-- 11			
	region_dry_grass_flat_no_feature,			-- 12
	region_fresh_water_grass_flat_no_feature,	-- 13
	region_tundra_flat_including_forests,		-- 14
	region_forest_flat_but_not_tundra,			-- 15
	region_grass_flat_no_feature,				-- 16	-- MOD.Barathor: New
	region_tundra_flat_no_feature,				-- 17	-- MOD.Barathor: New
	region_dry_plains_flat_no_feature,			-- 18	-- MOD.Barathor: New
	region_fresh_water_plains_flat_no_feature,	-- 19	-- MOD.Barathor: New
	region_desert_or_tundra_flat_no_feature,	-- 20	-- MOD.Barathor: New
	region_tundra_flat_forest,					-- 21	-- MOD.Barathor: New
	region_hills_open_no_tundra,				-- 22	-- MOD.Barathor: New
	region_hills_open_no_desert,				-- 23	-- MOD.Barathor: New
	region_hills_open_no_tundra_no_desert,		-- 24	-- MOD.Barathor: New
	region_hills_open_no_grass,					-- 25	-- MOD.Barathor: New
	region_hills_open_no_grass_no_tundra,		-- 26   -- MOD.Barathor: New
	region_hills_open_no_grass_no_plains,		-- 27   -- MOD.Barathor: New
	region_hills_covered_no_tundra,				-- 28	-- MOD.Barathor: New
	region_hills_covered_no_grass,				-- 29	-- MOD.Barathor: New
	region_hills_covered_no_grass_no_tundra,	-- 30	-- MOD.Barathor: New
	region_flat_covered,						-- 31	-- MOD.Barathor: New
	region_flat_covered_no_grass,				-- 32	-- MOD.Barathor: New
	region_flat_covered_no_tundra,				-- 33	-- MOD.Barathor: New
	region_flat_covered_no_grass_no_tundra,		-- 34	-- MOD.Barathor: New
	region_flat_open,							-- 35	-- MOD.Barathor: New
	region_flat_open_no_grass_no_plains,		-- 36	-- MOD.Barathor: New
	region_flat_open_no_tundra_no_desert,		-- 37	-- MOD.Barathor: New
	region_flat_open_no_desert,					-- 38	-- MOD.Barathor: New
	region_flat_desert_including_flood,			-- 39	-- MOD.Barathor: New
	};
	return results_table
end
------------------------------------------------------------------------------
function AssignStartingPlots:GenerateLuxuryPlotListsInRegion(region_number)
	local iW, iH = Map.GetGridSize();
	-- This function groups a region's plots in to lists, for Luxury resource assignment.
	local region_data_table = self.regionData[region_number];
	local iWestX = region_data_table[1];
	local iSouthY = region_data_table[2];
	local iWidth = region_data_table[3];
	local iHeight = region_data_table[4];
	local iAreaID = region_data_table[5];
	local region_area_object;
	if iAreaID ~= -1 then
		region_area_object = Map.GetArea(iAreaID);
	end

	local region_coast, region_marsh, region_flood_plains, region_tundra_flat_including_forests = {}, {}, {}, {};
	local region_hills_open, region_hills_covered, region_hills_jungle, region_hills_forest = {}, {}, {}, {};
	local region_desert_flat_no_feature, region_plains_flat_no_feature, region_jungle_flat = {}, {}, {};
	local region_forest_flat, region_forest_flat_but_not_tundra = {}, {};
	local region_dry_grass_flat_no_feature, region_fresh_water_grass_flat_no_feature = {}, {};
	local region_dry_plains_flat_no_feature, region_fresh_water_plains_flat_no_feature = {}, {};								-- MOD.Barathor: New
	local region_desert_or_tundra_flat_no_feature, region_grass_flat_no_feature = {}, {};										-- MOD.Barathor: New
	local region_tundra_flat_no_feature, region_tundra_flat_forest = {}, {};													-- MOD.Barathor: New
	local region_hills_open_no_tundra, region_hills_open_no_desert, region_hills_open_no_tundra_no_desert = {}, {}, {};			-- MOD.Barathor: New
	local region_hills_open_no_grass, region_hills_open_no_grass_no_tundra, region_hills_covered_no_tundra = {}, {}, {};		-- MOD.Barathor: New
	local region_hills_covered_no_grass, region_hills_covered_no_grass_no_tundra, region_flat_covered = {}, {}, {};				-- MOD.Barathor: New
	local region_flat_covered_no_grass, region_flat_covered_no_tundra, region_flat_covered_no_grass_no_tundra = {}, {}, {};		-- MOD.Barathor: New
	local region_flat_open, region_flat_open_no_grass_no_plains, region_flat_open_no_tundra_no_desert = {}, {}, {};				-- MOD.Barathor: New
	local region_flat_open_no_desert, region_flat_desert_including_flood, region_hills_open_no_grass_no_plains = {}, {}, {};	-- MOD.Barathor: New

	-- Iterate through the region's plots, building the fifteen lists defined above.
	for region_loop_y = 0, iHeight - 1 do
		for region_loop_x = 0, iWidth - 1 do
			local x = (region_loop_x + iWestX) % iW;
			local y = (region_loop_y + iSouthY) % iH;
			local plotIndex = y * iW + x + 1;
			local plot = Map.GetPlot(x, y);
			local area_of_plot = plot:GetArea();
			-- get plot info
			local plotType = plot:GetPlotType()
			local terrainType = plot:GetTerrainType()
			local featureType = plot:GetFeatureType()
			--
			if plotType == PlotTypes.PLOT_OCEAN then
				if terrainType == TerrainTypes.TERRAIN_COAST then
					if plot:IsLake() == false then
						if featureType ~= self.feature_atoll and featureType ~= FeatureTypes.FEATURE_ICE then
							if iAreaID == -1 then
								if plot:IsAdjacentToLand() then
									table.insert(region_coast, plotIndex);
								end
							else
								if plot:IsAdjacentToArea(region_area_object) then
									table.insert(region_coast, plotIndex);
								end
							end
						end
					end
				end
			elseif plotType == PlotTypes.PLOT_HILLS and terrainType ~= TerrainTypes.TERRAIN_SNOW then
				if featureType == FeatureTypes.NO_FEATURE then
					table.insert(region_hills_open, plotIndex);
					if terrainType == TerrainTypes.TERRAIN_TUNDRA then								-- MOD.Barathor: New Condition
						table.insert(region_hills_open_no_desert, plotIndex);						-- MOD.Barathor: New
						table.insert(region_hills_open_no_grass, plotIndex);						-- MOD.Barathor: New
						table.insert(region_hills_open_no_grass_no_plains, plotIndex);				-- MOD.Barathor: New
					elseif terrainType == TerrainTypes.TERRAIN_DESERT then
						table.insert(region_hills_open_no_tundra, plotIndex);						-- MOD.Barathor: New
						table.insert(region_hills_open_no_grass, plotIndex);						-- MOD.Barathor: New
						table.insert(region_hills_open_no_grass_no_tundra, plotIndex);				-- MOD.Barathor: New
						table.insert(region_hills_open_no_grass_no_plains, plotIndex);				-- MOD.Barathor: New
					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
						table.insert(region_hills_open_no_tundra, plotIndex);						-- MOD.Barathor: New
						table.insert(region_hills_open_no_desert, plotIndex);						-- MOD.Barathor: New
						table.insert(region_hills_open_no_grass, plotIndex);						-- MOD.Barathor: New
						table.insert(region_hills_open_no_grass_no_tundra, plotIndex);				-- MOD.Barathor: New
						table.insert(region_hills_open_no_tundra_no_desert, plotIndex);				-- MOD.Barathor: New
					elseif terrainType == TerrainTypes.TERRAIN_GRASS then
						table.insert(region_hills_open_no_tundra, plotIndex);						-- MOD.Barathor: New
						table.insert(region_hills_open_no_desert, plotIndex);						-- MOD.Barathor: New
						table.insert(region_hills_open_no_tundra_no_desert, plotIndex);				-- MOD.Barathor: New
					end
				elseif featureType == FeatureTypes.FEATURE_JUNGLE then		
					table.insert(region_hills_jungle, plotIndex);
					table.insert(region_hills_covered, plotIndex);
					if terrainType == TerrainTypes.TERRAIN_PLAINS then								-- MOD.Barathor: New Condition
						table.insert(region_hills_covered_no_tundra, plotIndex);					-- MOD.Barathor: New
						table.insert(region_hills_covered_no_grass, plotIndex);						-- MOD.Barathor: New
						table.insert(region_hills_covered_no_grass_no_tundra, plotIndex);			-- MOD.Barathor: New
					elseif terrainType == TerrainTypes.TERRAIN_GRASS then
						table.insert(region_hills_covered_no_tundra, plotIndex);					-- MOD.Barathor: New
					end
				elseif featureType == FeatureTypes.FEATURE_FOREST then		
					table.insert(region_hills_forest, plotIndex);
					table.insert(region_hills_covered, plotIndex);
					if terrainType == TerrainTypes.TERRAIN_TUNDRA then
						table.insert(region_hills_covered_no_grass, plotIndex);						-- MOD.Barathor: New
					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then							-- MOD.Barathor: New Condition
						table.insert(region_hills_covered_no_tundra, plotIndex);					-- MOD.Barathor: New
						table.insert(region_hills_covered_no_grass, plotIndex);						-- MOD.Barathor: New
						table.insert(region_hills_covered_no_grass_no_tundra, plotIndex);			-- MOD.Barathor: New
					elseif terrainType == TerrainTypes.TERRAIN_GRASS then							-- MOD.Barathor: New Condition
						table.insert(region_hills_covered_no_tundra, plotIndex);					-- MOD.Barathor: New
					end
				end
			elseif plotType == PlotTypes.PLOT_LAND then
				if featureType == FeatureTypes.NO_FEATURE then
					if terrainType == TerrainTypes.TERRAIN_TUNDRA then
						table.insert(region_tundra_flat_no_feature, plotIndex);						-- MOD.Barathor: New
						table.insert(region_desert_or_tundra_flat_no_feature, plotIndex);			-- MOD.Barathor: New
						table.insert(region_tundra_flat_including_forests, plotIndex);
						table.insert(region_flat_open, plotIndex);									-- MOD.Barathor: New
						table.insert(region_flat_open_no_desert, plotIndex);						-- MOD.Barathor: New
						table.insert(region_flat_open_no_grass_no_plains, plotIndex);				-- MOD.Barathor: New
					elseif terrainType == TerrainTypes.TERRAIN_DESERT then
						table.insert(region_desert_flat_no_feature, plotIndex);
						table.insert(region_desert_or_tundra_flat_no_feature, plotIndex);			-- MOD.Barathor: New
						table.insert(region_flat_open, plotIndex);									-- MOD.Barathor: New
						table.insert(region_flat_open_no_grass_no_plains, plotIndex);				-- MOD.Barathor: New
						table.insert(region_flat_desert_including_flood, plotIndex);				-- MOD.Barathor: New
					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
						table.insert(region_plains_flat_no_feature, plotIndex);
						table.insert(region_flat_open_no_desert, plotIndex);						-- MOD.Barathor: New
						table.insert(region_flat_open, plotIndex);									-- MOD.Barathor: New
						table.insert(region_flat_open_no_tundra_no_desert, plotIndex);				-- MOD.Barathor: New
						if plot:IsFreshWater() then													-- MOD.Barathor: New Condition -- fresh water check
							table.insert(region_fresh_water_plains_flat_no_feature, plotIndex);		-- MOD.Barathor: New
						else
							table.insert(region_dry_plains_flat_no_feature, plotIndex);				-- MOD.Barathor: New
						end
					elseif terrainType == TerrainTypes.TERRAIN_GRASS then
						table.insert(region_grass_flat_no_feature, plotIndex);						-- MOD.Barathor: New
						table.insert(region_flat_open_no_desert, plotIndex);						-- MOD.Barathor: New
						table.insert(region_flat_open, plotIndex);									-- MOD.Barathor: New
						table.insert(region_flat_open_no_tundra_no_desert, plotIndex);				-- MOD.Barathor: New
						if plot:IsFreshWater() then
							table.insert(region_fresh_water_grass_flat_no_feature, plotIndex);
						else
							table.insert(region_dry_grass_flat_no_feature, plotIndex);
						end
					end
				elseif featureType == FeatureTypes.FEATURE_MARSH then		
					table.insert(region_marsh, plotIndex);
				elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then		
					table.insert(region_flood_plains, plotIndex);
					table.insert(region_flat_desert_including_flood, plotIndex);					-- MOD.Barathor: New
				elseif featureType == FeatureTypes.FEATURE_JUNGLE then		
					table.insert(region_jungle_flat, plotIndex);
					if terrainType == TerrainTypes.TERRAIN_PLAINS then								-- MOD.Barathor: New Condition
						table.insert(region_flat_covered_no_tundra, plotIndex);						-- MOD.Barathor: New
						table.insert(region_flat_covered_no_grass, plotIndex);						-- MOD.Barathor: New
						table.insert(region_flat_covered_no_grass_no_tundra, plotIndex);			-- MOD.Barathor: New
					elseif terrainType == TerrainTypes.TERRAIN_GRASS then
						table.insert(region_flat_covered_no_tundra, plotIndex);						-- MOD.Barathor: New
					end
				elseif featureType == FeatureTypes.FEATURE_FOREST then		
					table.insert(region_forest_flat, plotIndex);
					if terrainType == TerrainTypes.TERRAIN_TUNDRA then
						table.insert(region_tundra_flat_including_forests, plotIndex);
						table.insert(region_tundra_flat_forest, plotIndex);							-- MOD.Barathor: New
						table.insert(region_flat_covered_no_grass, plotIndex);						-- MOD.Barathor: New
					elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
						table.insert(region_forest_flat_but_not_tundra, plotIndex);
						table.insert(region_flat_covered_no_tundra, plotIndex);						-- MOD.Barathor: New
						table.insert(region_flat_covered_no_grass_no_tundra, plotIndex);			-- MOD.Barathor: New
						table.insert(region_flat_covered_no_grass, plotIndex);						-- MOD.Barathor: New
					elseif terrainType == TerrainTypes.TERRAIN_GRASS then
						table.insert(region_forest_flat_but_not_tundra, plotIndex);
						table.insert(region_flat_covered_no_tundra, plotIndex);						-- MOD.Barathor: New
					end
				end
			end
		end
	end
	
	-- Luxury Plot Lists
	local results_table = {
	region_coast, -- (Coast next to land)		-- 1
	region_marsh,								-- 2
	region_flood_plains,						-- 3
	region_hills_open,							-- 4
	region_hills_covered,						-- 5
	region_hills_jungle,						-- 6
	region_hills_forest,						-- 7
	region_jungle_flat,							-- 8
	region_forest_flat,							-- 9
	region_desert_flat_no_feature,				-- 10
	region_plains_flat_no_feature,				-- 11			
	region_dry_grass_flat_no_feature,			-- 12
	region_fresh_water_grass_flat_no_feature,	-- 13
	region_tundra_flat_including_forests,		-- 14
	region_forest_flat_but_not_tundra,			-- 15
	region_grass_flat_no_feature,				-- 16	-- MOD.Barathor: New
	region_tundra_flat_no_feature,				-- 17	-- MOD.Barathor: New
	region_dry_plains_flat_no_feature,			-- 18	-- MOD.Barathor: New
	region_fresh_water_plains_flat_no_feature,	-- 19	-- MOD.Barathor: New
	region_desert_or_tundra_flat_no_feature,	-- 20	-- MOD.Barathor: New
	region_tundra_flat_forest,					-- 21	-- MOD.Barathor: New
	region_hills_open_no_tundra,				-- 22	-- MOD.Barathor: New
	region_hills_open_no_desert,				-- 23	-- MOD.Barathor: New
	region_hills_open_no_tundra_no_desert,		-- 24	-- MOD.Barathor: New
	region_hills_open_no_grass,					-- 25	-- MOD.Barathor: New
	region_hills_open_no_grass_no_tundra,		-- 26   -- MOD.Barathor: New
	region_hills_open_no_grass_no_plains,		-- 27   -- MOD.Barathor: New
	region_hills_covered_no_tundra,				-- 28	-- MOD.Barathor: New
	region_hills_covered_no_grass,				-- 29	-- MOD.Barathor: New
	region_hills_covered_no_grass_no_tundra,	-- 30	-- MOD.Barathor: New
	region_flat_covered,						-- 31	-- MOD.Barathor: New
	region_flat_covered_no_grass,				-- 32	-- MOD.Barathor: New
	region_flat_covered_no_tundra,				-- 33	-- MOD.Barathor: New
	region_flat_covered_no_grass_no_tundra,		-- 34	-- MOD.Barathor: New
	region_flat_open,							-- 35	-- MOD.Barathor: New
	region_flat_open_no_grass_no_plains,		-- 36	-- MOD.Barathor: New
	region_flat_open_no_tundra_no_desert,		-- 37	-- MOD.Barathor: New
	region_flat_open_no_desert,					-- 38	-- MOD.Barathor: New
	region_flat_desert_including_flood,			-- 39	-- MOD.Barathor: New
	};
	return results_table
end
------------------------------------------------------------------------------
function AssignStartingPlots:GetIndicesForLuxuryType(resource_ID)
	-- This function will identify up to four of the fifteen "Luxury Plot Lists"
	-- (visually listed on screen directly above this text) that match terrain 
	-- best suitable for this type of luxury.
	--print("-"); print("Obtaining indices for Luxury#", resource_ID);
	local primary, secondary, tertiary, quaternary, quinary, senary = -1, -1, -1, -1, -1, -1;	-- MOD.Barathor: New -- added a quinary and senary list
																								-- MOD.Barathor: Modders, don't forget, if you add or remove indices, make sure you have the correct number of primary, secondary, etc. as well!
	-- MOD.Barathor: New -- All Indices are either updated or new.
	-- Water Luxuries
	if resource_ID == self.whale_ID then
		primary = 1;
	elseif resource_ID == self.pearls_ID then
		primary = 1;
	elseif resource_ID == self.crab_ID then
		primary = 1;
	elseif resource_ID == self.coral_ID then
		primary = 1;
	-- Rock Luxuries
	elseif resource_ID == self.marble_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 27, 24, 36, 37, 5, 31;
	elseif resource_ID == self.gold_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 27, 24, 36, 37, 5, 31;
	elseif resource_ID == self.silver_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 27, 24, 36, 37, 5, 31;
	elseif resource_ID == self.copper_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 27, 24, 36, 37, 5, 31;
	elseif resource_ID == self.gems_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 27, 24, 36, 37, 5, 31;
	elseif resource_ID == self.salt_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 27, 24, 36, 37, 5, 31;
	elseif resource_ID == self.jade_ID then							
		primary, secondary, tertiary, quaternary, quinary, senary = 27, 24, 36, 37, 5, 31;
	elseif resource_ID == self.amber_ID then						
		primary, secondary, tertiary, quaternary, quinary, senary = 27, 24, 36, 37, 5, 31;	
	elseif resource_ID == self.lapis_ID then							
		primary, secondary, tertiary, quaternary, quinary, senary = 27, 24, 36, 37, 5, 31;
	-- Tree Luxuries
	elseif resource_ID == self.cocoa_ID then						
		primary, secondary, tertiary, quaternary, quinary, senary = 8, 15, 28, 37, 24, 2;
	elseif resource_ID == self.citrus_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 8, 15, 28, 37, 24, 2;
	elseif resource_ID == self.spices_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 8, 15, 28, 37, 24, 2;
	elseif resource_ID == self.sugar_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 8, 15, 28, 37, 24, 2;
	elseif resource_ID == self.truffles_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 15, 8, 28, 37, 24, 2;
	elseif resource_ID == self.silk_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 15, 8, 28, 37, 24, 2;
	elseif resource_ID == self.dye_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 9, 8, 5, 38, 23, 2;
	elseif resource_ID == self.fur_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 21, 15, 7, 38, 23, 2;
	-- Land Luxuries
	elseif resource_ID == self.incense_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 39, 11, 22, 33, 28, 16;
	elseif resource_ID == self.ivory_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 11, 16, 39, 22, 33, 28;
	elseif resource_ID == self.wine_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 11, 16, 33, 24, 28, 2;
	elseif resource_ID == self.olives_ID then						
		primary, secondary, tertiary, quaternary, quinary, senary = 11, 16, 33, 24, 28, 2;
	elseif resource_ID == self.coffee_ID then						
		primary, secondary, tertiary, quaternary, quinary, senary = 11, 16, 33, 24, 28, 2;	
	elseif resource_ID == self.tobacco_ID then						
		primary, secondary, tertiary, quaternary, quinary, senary = 16, 11, 33, 24, 28, 2;
	elseif resource_ID == self.tea_ID then							
		primary, secondary, tertiary, quaternary, quinary, senary = 16, 11, 33, 24, 28, 2;
	elseif resource_ID == self.perfume_ID then						
		primary, secondary, tertiary, quaternary, quinary, senary = 16, 11, 33, 24, 28, 2;
	elseif resource_ID == self.cotton_ID then
		primary, secondary, tertiary, quaternary, quinary, senary = 16, 11, 33, 24, 28, 2;
	-- MOD.HungryForFood: Start
	-- Even More Resources for Vox Populi
	elseif self:IsEvenMoreResourcesActive() == true then
		if resource_ID == self.lavender_ID then
			primary, secondary, tertiary, quaternary, quinary, senary = 16, 11, 33, 24, 28, 2;
		elseif resource_ID == self.obsidian_ID then
			primary, secondary, tertiary, quaternary, quinary, senary = 27, 6, 24, 36, 37, 5;
		elseif resource_ID == self.platinum_ID then
			primary, secondary, tertiary, quaternary, quinary, senary = 27, 24, 36, 37, 5, 31;
		elseif resource_ID == self.poppy_ID then
			primary, secondary, tertiary, quaternary, quinary, senary = 4, 39, 11, 22, 33, 28;
		elseif resource_ID == self.tin_ID then
			primary, secondary, tertiary, quaternary, quinary, senary = 27, 24, 36, 37, 5, 31;
		end
	-- MOD.HungryForFood: End
	end
	--print("Found indices of", primary, secondary, tertiary, quaternary);
	return primary, secondary, tertiary, quaternary, quinary, senary;		-- MOD.Barathor: New -- added a quinary and senary list
end
------------------------------------------------------------------------------
function AssignStartingPlots:GetRegionLuxuryTargetNumbers()
	-- This data was separated out to allow easy replacement in map scripts.
	--
	-- This table, indexed by civ-count, provides the target amount of luxuries to place in each region.
	-- MOD.Barathor: Updated -- increased inital value when increasing total civ count by 2.  Instead of decreasing by 2, it'll decrease copies of regional luxuries placed by 1.
	-- MOD.Barathor: Rough Example -- Standard 8 civs x 6 copies of each regional luxury = 48 ... 10 x 4 = 40 ... 10 x 5 = 50 ... 50 is closer to 48 than 40
	-- MOD.Barathor: This will not hurt the random luxury total to be placed since it always places a minimum number at least.  
	local duel_values = table.fill(1, 22); -- Max is one per region for all player counts at this size.
	--
	--[[	MOD.Barathor: Disabled -- old values
	local tiny_values = {0, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
	--
	local small_values = {0, 3, 3, 3, 4, 4, 4, 3, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
	--
	local standard_values = {0, 3, 3, 4, 4, 5, 5, 6, 5, 4, 4, 3, 3, 2, 2, 1, 1, 1, 1, 1, 1, 1};
	--
	local large_values = {0, 3, 4, 4, 5, 5, 5, 6, 6, 7, 6, 5, 5, 4, 4, 3, 3, 2, 2, 2, 2, 2};
	--
	local huge_values = {0, 4, 5, 5, 6, 6, 6, 6, 7, 7, 7, 8, 7, 6, 6, 5, 5, 4, 4, 3, 3, 2};
	]]--
	-- MOD.Barathor: Updated -- new values
	local tiny_values = {0, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
	--
	local small_values = {0, 3, 3, 3, 4, 4, 4, 3, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
	--
	local standard_values = {0, 3, 3, 4, 4, 5, 5, 6, 5, 5, 4, 4, 3, 3, 2, 2, 1, 1, 1, 1, 1, 1};
	--
	local large_values = {0, 3, 4, 4, 5, 5, 5, 6, 6, 7, 6, 6, 5, 5, 4, 4, 3, 3, 2, 2, 2, 2};
	--
	local huge_values = {0, 4, 5, 5, 6, 6, 6, 6, 7, 7, 7, 8, 7, 7, 6, 6, 5, 5, 4, 4, 3, 3};
	--
	local worldsizes = {
		[GameInfo.Worlds.WORLDSIZE_DUEL.ID] = duel_values,
		[GameInfo.Worlds.WORLDSIZE_TINY.ID] = tiny_values,
		[GameInfo.Worlds.WORLDSIZE_SMALL.ID] = small_values,
		[GameInfo.Worlds.WORLDSIZE_STANDARD.ID] = standard_values,
		[GameInfo.Worlds.WORLDSIZE_LARGE.ID] = large_values,
		[GameInfo.Worlds.WORLDSIZE_HUGE.ID] = huge_values
		}
	local target_list = worldsizes[Map.GetWorldSize()];
	return target_list
end
------------------------------------------------------------------------------
function AssignStartingPlots:GetWorldLuxuryTargetNumbers()
	-- This data was separated out to allow easy replacement in map scripts.
	--
	-- The first number is the target for total luxuries in the world, NOT
	-- counting the one-per-civ "second type" added at start locations.
	--
	-- The second number affects minimum number of random luxuries placed.
	-- I say "affects" because it is only one part of the formula.
	local worldsizes = {};
	
	if self.luxuryDensity == 4 then
		self.luxuryDensity = 1 + Map.Rand(3, "Luxury Resource Density");
	end
	
	if self.luxuryDensity == 1 then -- Sparse
		worldsizes = {
			[GameInfo.Worlds.WORLDSIZE_DUEL.ID] = {14, 3},
			[GameInfo.Worlds.WORLDSIZE_TINY.ID] = {24, 4},
			[GameInfo.Worlds.WORLDSIZE_SMALL.ID] = {36, 4},
			[GameInfo.Worlds.WORLDSIZE_STANDARD.ID] = {48, 5},
			[GameInfo.Worlds.WORLDSIZE_LARGE.ID] = {60, 5},
			[GameInfo.Worlds.WORLDSIZE_HUGE.ID] = {76, 6}
		}
	elseif self.luxuryDensity == 3 then -- Abundant
		worldsizes = {
			[GameInfo.Worlds.WORLDSIZE_DUEL.ID] = {24, 3},
			[GameInfo.Worlds.WORLDSIZE_TINY.ID] = {40, 4},
			[GameInfo.Worlds.WORLDSIZE_SMALL.ID] = {60, 4},
			[GameInfo.Worlds.WORLDSIZE_STANDARD.ID] = {80, 5},
			[GameInfo.Worlds.WORLDSIZE_LARGE.ID] = {100, 5},
			[GameInfo.Worlds.WORLDSIZE_HUGE.ID] = {128, 6}
		}
	else -- Standard
		worldsizes = {
			[GameInfo.Worlds.WORLDSIZE_DUEL.ID] = {18, 3},
			[GameInfo.Worlds.WORLDSIZE_TINY.ID] = {30, 4},
			[GameInfo.Worlds.WORLDSIZE_SMALL.ID] = {45, 4},
			[GameInfo.Worlds.WORLDSIZE_STANDARD.ID] = {60, 5},
			[GameInfo.Worlds.WORLDSIZE_LARGE.ID] = {75, 5},
			[GameInfo.Worlds.WORLDSIZE_HUGE.ID] = {95, 6}
		}
	end
	local world_size_data = worldsizes[Map.GetWorldSize()];
	return world_size_data
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceLuxuries()
	-- This function is dependent upon AssignLuxuryRoles() and PlaceCityStates() having been executed first.
	local iW, iH = Map.GetGridSize();
	-- Place Luxuries at civ start locations.
	for loop, reg_data in ipairs(self.regions_sorted_by_type) do
		local region_number = reg_data[1];
		local this_region_luxury = reg_data[2];
		local x = self.startingPlots[region_number][1];
		local y = self.startingPlots[region_number][2];
		--print("-"); print("Attempting to place Luxury#", this_region_luxury, "at start plot", x, y, "in Region#", region_number);
		-- Determine number to place at the start location
		local iNumToPlace = 2;	-- MOD.Barathor: Updated -- original = 1 -- Most times, 2 of the initial type are placed at the start anyway, because of the old fertility checks below.  This will make it consistent.
		if self.legStart then -- Legendary Start
			iNumToPlace = 3;	-- MOD.Barathor: Updated -- original = 2
		end
		
		-- Obtain plot lists appropriate to this luxury type.
		local primary, secondary, tertiary, quaternary, quinary, senary, luxury_plot_lists, shuf_list;					-- MOD.Barathor: New -- added a quinary and senary list
		primary, secondary, tertiary, quaternary, quinary, senary = self:GetIndicesForLuxuryType(this_region_luxury);	-- MOD.Barathor: New -- added a quinary and senary list

		-- First pass, checking only first two rings with a 50% ratio.
		luxury_plot_lists = self:GenerateLuxuryPlotListsAtCitySite(x, y, 2, false)
		shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[primary])
		local iNumLeftToPlace = self:PlaceSpecificNumberOfResources(this_region_luxury, 1, iNumToPlace, 0.5, -1, 0, 0, shuf_list);
		if iNumLeftToPlace > 0 and secondary > 0 then
			shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[secondary])
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(this_region_luxury, 1, iNumLeftToPlace, 0.5, -1, 0, 0, shuf_list);
		end
		if iNumLeftToPlace > 0 and tertiary > 0 then
			shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[tertiary])
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(this_region_luxury, 1, iNumLeftToPlace, 0.5, -1, 0, 0, shuf_list);
		end
		if iNumLeftToPlace > 0 and quaternary > 0 then
			shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quaternary])
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(this_region_luxury, 1, iNumLeftToPlace, 0.5, -1, 0, 0, shuf_list);
		end
		if iNumLeftToPlace > 0 and quinary > 0 then		-- MOD.Barathor: New -- added a quinary list
			shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quinary])
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(this_region_luxury, 1, iNumLeftToPlace, 0.5, -1, 0, 0, shuf_list);
		end
		if iNumLeftToPlace > 0 and senary > 0 then		-- MOD.Barathor: New -- added a senary list
			shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[senary])
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(this_region_luxury, 1, iNumLeftToPlace, 0.5, -1, 0, 0, shuf_list);
		end

		if iNumLeftToPlace > 0 then
			-- Second pass, checking three rings with a 100% ratio.
			luxury_plot_lists = self:GenerateLuxuryPlotListsAtCitySite(x, y, 3, false)
			shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[primary])
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(this_region_luxury, 1, iNumLeftToPlace, 1, -1, 0, 0, shuf_list);
			if iNumLeftToPlace > 0 and secondary > 0 then
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[secondary])
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(this_region_luxury, 1, iNumLeftToPlace, 1, -1, 0, 0, shuf_list);
			end
			if iNumLeftToPlace > 0 and tertiary > 0 then
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[tertiary])
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(this_region_luxury, 1, iNumLeftToPlace, 1, -1, 0, 0, shuf_list);
			end
			if iNumLeftToPlace > 0 and quaternary > 0 then
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quaternary])
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(this_region_luxury, 1, iNumLeftToPlace, 1, -1, 0, 0, shuf_list);
			end
			if iNumLeftToPlace > 0 and quinary > 0 then		-- MOD.Barathor: New -- added a quinary list
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quinary])
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(this_region_luxury, 1, iNumLeftToPlace, 1, -1, 0, 0, shuf_list);
			end
			if iNumLeftToPlace > 0 and senary > 0 then		-- MOD.Barathor: New -- added a senary list
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[senary])
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(this_region_luxury, 1, iNumLeftToPlace, 1, -1, 0, 0, shuf_list);
			end
		end

		if iNumLeftToPlace > 0 then
			-- If we haven't been able to place all of this lux type at the start, it CAN be placed
			-- in the region somewhere. Subtract remainder from this region's compensation, so that the
			-- regional process, later, will attempt to place this remainder somewhere in the region.
			self.luxury_low_fert_compensation[this_region_luxury] = self.luxury_low_fert_compensation[this_region_luxury] - iNumLeftToPlace;
			self.region_low_fert_compensation[region_number] = self.region_low_fert_compensation[region_number] - iNumLeftToPlace;
		end
		if iNumLeftToPlace > 0 and self.iNumTypesRandom > 0 then
			-- We'll attempt to place one source of a Luxury type assigned to random distribution.
			local randoms_to_place = 1;
			for loop, random_res in ipairs(self.resourceIDs_assigned_to_random) do
				primary, secondary, tertiary, quaternary, quinary, senary = self:GetIndicesForLuxuryType(random_res);	-- MOD.Barathor: New -- added a quinary and senary list
				if randoms_to_place > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[primary])
					randoms_to_place = self:PlaceSpecificNumberOfResources(random_res, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if randoms_to_place > 0 and secondary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[secondary])
					randoms_to_place = self:PlaceSpecificNumberOfResources(random_res, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if randoms_to_place > 0 and tertiary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[tertiary])
					randoms_to_place = self:PlaceSpecificNumberOfResources(random_res, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if randoms_to_place > 0 and quaternary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quaternary])
					randoms_to_place = self:PlaceSpecificNumberOfResources(random_res, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if randoms_to_place > 0 and quinary > 0 then	-- MOD.Barathor: New -- added a quinary list
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quinary])
					randoms_to_place = self:PlaceSpecificNumberOfResources(random_res, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if randoms_to_place > 0 and senary > 0 then	-- MOD.Barathor: New -- added a senary list
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[senary])
					randoms_to_place = self:PlaceSpecificNumberOfResources(random_res, 1, 1, 1, -1, 0, 0, shuf_list);
				end
			end
		end
	end
	
	-- Place Luxuries at City States.
	-- Candidates include luxuries exclusive to CS, the lux assigned to this CS's region (if in a region), and the randoms.
	for city_state = 1, self.iNumCityStates do
		-- First check to see if this city state number received a valid start plot.
		if self.city_state_validity_table[city_state] == false then
			-- This one did not! It does not exist on the map nor have valid data, so we will ignore it.
		else
			-- OK, it's a valid city state. Process it.
			local region_number = self.city_state_region_assignments[city_state];
			local x = self.cityStatePlots[city_state][1];
			local y = self.cityStatePlots[city_state][2];
			local allowed_luxuries = self:GetListOfAllowableLuxuriesAtCitySite(x, y, 2)
			local lux_possible_for_cs = {}; -- Recorded with ID as key, weighting as data entry
			-- Identify Allowable Luxuries assigned to City States.
			-- If any CS-Only types are eligible, then all combined will have a weighting of 75%
			local cs_only_types = {};
			for loop, res_ID in ipairs(self.resourceIDs_assigned_to_cs) do
				if allowed_luxuries[res_ID] == true then
					table.insert(cs_only_types, res_ID);
				end
			end
			local iNumCSAllowed = table.maxn(cs_only_types);
			if iNumCSAllowed > 0 then
				for loop, res_ID in ipairs(cs_only_types) do
					lux_possible_for_cs[res_ID] = 75 / iNumCSAllowed;
				end
			end
			-- Identify Allowable Random Luxuries and the Regional Luxury if any.
			-- If any random types are eligible (plus the regional type if in a region) these combined carry a 25% weighting.
			if self.iNumTypesRandom > 0 or region_number > 0 then
				local random_types_allowed = {};
				for loop, res_ID in ipairs(self.resourceIDs_assigned_to_random) do
					if allowed_luxuries[res_ID] == true then
						table.insert(random_types_allowed, res_ID);
					end
				end
				local iNumRandAllowed = table.maxn(random_types_allowed);
				local iNumAllowed = iNumRandAllowed;
				if region_number > 0 then
					iNumAllowed = iNumAllowed + 1; -- Adding the region type in to the mix with the random types.
					local res_ID = self.region_luxury_assignment[region_number];
					if allowed_luxuries[res_ID] == true then
						lux_possible_for_cs[res_ID] = 25 / iNumAllowed;
					end
				end
				if iNumRandAllowed > 0 then
					for loop, res_ID in ipairs(random_types_allowed) do
						lux_possible_for_cs[res_ID] = 25 / iNumAllowed;
					end
				end
			end

			-- If there are no allowable luxury types at this city site, then this city state gets none.
			local iNumAvailableTypes = table.maxn(lux_possible_for_cs);
			if iNumAvailableTypes == 0 then
				--print("City State #", city_state, "has poor land, ineligible to receive a Luxury resource.");
			else
				-- Calculate probability thresholds for each allowable luxury type.
				local res_threshold = {};
				local totalWeight, accumulatedWeight = 0, 0;
				for res_ID, this_weight in pairs(lux_possible_for_cs) do
					totalWeight = totalWeight + this_weight;
				end
				for res_ID, this_weight in pairs(lux_possible_for_cs) do
					local threshold = (this_weight + accumulatedWeight) * 10000 / totalWeight;
					res_threshold[res_ID] = threshold;
					accumulatedWeight = accumulatedWeight + this_weight;
				end
				-- Choose luxury type.
				local use_this_ID;
				local diceroll = Map.Rand(10000, "Choose resource type - Assign Luxury To City State - Lua");
				for res_ID, threshold in pairs(res_threshold) do
					if diceroll < threshold then -- Choose this resource type.
						use_this_ID = res_ID;
						break
					end
				end
				--print("-"); print("-"); print("-Assigned Luxury Type", use_this_ID, "to City State#", city_state);
				-- Place luxury.
				local primary, secondary, tertiary, quaternary, quinary, senary, luxury_plot_lists, shuf_list;			-- MOD.Barathor: New -- added a quinary and senary list
				primary, secondary, tertiary, quaternary, quinary, senary = self:GetIndicesForLuxuryType(use_this_ID);	-- MOD.Barathor: New -- added a quinary and senary list
				luxury_plot_lists = self:GenerateLuxuryPlotListsAtCitySite(x, y, 2, false)
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[primary])
				local iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
				if iNumLeftToPlace > 0 and secondary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[secondary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace > 0 and tertiary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[tertiary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace > 0 and quaternary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quaternary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace > 0 and quinary > 0 then		-- MOD.Barathor: New -- added a quinary list
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quinary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace > 0 and senary > 0 then		-- MOD.Barathor: New -- added a senary list
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[senary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace == 0 then
					--print("-"); print("Placed Luxury ID#", use_this_ID, "at City State#", city_state, "in Region#", region_number, "located at Plot", x, y);
				end
			end
		end
	end
		
	-- Place Regional Luxuries
	for region_number, res_ID in ipairs(self.region_luxury_assignment) do
		--print("-"); print("- - -"); print("Attempting to place regional luxury #", res_ID, "in Region#", region_number);
		local iNumAlreadyPlaced = self.amounts_of_resources_placed[res_ID + 1];
		local assignment_split = self.luxury_assignment_count[res_ID];
		local primary, secondary, tertiary, quaternary, quinary, senary, luxury_plot_lists, shuf_list, iNumLeftToPlace;		-- MOD.Barathor: New -- added a quinary and senary list
		primary, secondary, tertiary, quaternary, quinary, senary = self:GetIndicesForLuxuryType(res_ID);					-- MOD.Barathor: New -- added a quinary and senary list
		luxury_plot_lists = self:GenerateLuxuryPlotListsInRegion(region_number)

		-- Calibrate number of luxuries per region to world size and number of civs
		-- present. The amount of lux per region should be at its highest when the 
		-- number of civs in the game is closest to "default" for that map size.
		local target_list = self:GetRegionLuxuryTargetNumbers()
		local targetNum = target_list[self.iNumCivs] 		-- MOD.Barathor: Updated -- Keep it simple and consistent.  Plus, fertility compensation above is disabled anyway.
		targetNum = targetNum - self.region_low_fert_compensation[region_number];
		-- Adjust target number according to Resource Setting.
		if self.luxuryDensity == 1 then
			targetNum = targetNum - 2;
		elseif self.luxuryDensity == 3 then
			targetNum = targetNum + 2;
		elseif self.luxuryDensity == 4 then
			targetNum = targetNum - 2 + Map.Rand(5, "Luxury Resource Density");
		end
		local iNumThisLuxToPlace = math.max(1, targetNum); -- Always place at least one.

		--print("-"); print("Target number for Luxury#", res_ID, "with assignment split of", assignment_split, "is", targetNum);
		
		-- Place luxuries.
		shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[primary])
		iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumThisLuxToPlace, 0.25, 2, 1, 3, shuf_list);	-- MOD.Barathor: Updated -- Existing ratio = 0.3, min radius = 0, max radius = 3
		if iNumLeftToPlace > 0 and secondary > 0 then
			shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[secondary])
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 0.25, 2, 1, 3, shuf_list);	-- MOD.Barathor: Updated -- Existing ratio = 0.3, min radius = 0, max radius = 3
		end
		if iNumLeftToPlace > 0 and tertiary > 0 then
			shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[tertiary])
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 0.25, 2, 1, 3, shuf_list);	-- MOD.Barathor: Updated -- Existing ratio = 0.4, min radius = 0, max radius = 2
		end
		if iNumLeftToPlace > 0 and quaternary > 0 then
			shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quaternary])
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 0.25, 2, 1, 3, shuf_list);	-- MOD.Barathor: Updated -- Existing ratio = 0.5, min radius = 0, max radius = 2 
		end
		if iNumLeftToPlace > 0 and quinary > 0 then		-- MOD.Barathor: New -- added a quinary list
			shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quinary])
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 0.25, 2, 1, 3, shuf_list);	-- MOD.Barathor: Updated -- Existing ratio = 0.5, min radius = 0, max radius = 2 
		end
		if iNumLeftToPlace > 0 and senary > 0 then		-- MOD.Barathor: New -- added a senary list
			shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[senary])
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 0.25, 2, 1, 3, shuf_list);	-- MOD.Barathor: Updated -- Existing ratio = 0.5, min radius = 0, max radius = 2 
		end
		--print("-"); print("-"); print("Number of LuxuryID", res_ID, "left to place in Region#", region_number, "is", iNumLeftToPlace);
		
		-- MOD.Barathor: New -- New Fallback loop since some luxuries frequently miss the target total during regionl placement (like silk, dyes, spices, etc.)
					-- This is because some luxuries have only a few indices and don't utilize all four, plus they have strict requirements, like foliage only and on flat land only
					-- When a luxury only uses two or three selective indices, it gets harder to place them all since the first default ratios above are only 0.3 (3 placements for every 10 eligible plots, rounded up)
		if iNumLeftToPlace > 0 then	
			-- Second pass, checking all with a 100% ratio to make sure the target total is reached for this region!
			shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[primary])
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 1, 2, 1, 3, shuf_list);
			if iNumLeftToPlace > 0 and secondary > 0 then
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[secondary])
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 1, 2, 1, 3, shuf_list);
			end
			if iNumLeftToPlace > 0 and tertiary > 0 then
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[tertiary])
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 1, 2, 1, 3, shuf_list);
			end
			if iNumLeftToPlace > 0 and quaternary > 0 then
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quaternary])
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 1, 2, 1, 3, shuf_list);
			end
			if iNumLeftToPlace > 0 and quinary > 0 then		-- MOD.Barathor: New -- added a quinary list
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quinary])
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 1, 2, 1, 3, shuf_list);
			end
			if iNumLeftToPlace > 0 and senary > 0 then		-- MOD.Barathor: New -- added a senary list
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[senary])
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 1, 2, 1, 3, shuf_list);
			end
			print("-"); print("Number of LuxuryID", res_ID, "not placed in Region#", region_number, "is", iNumLeftToPlace);
		end	
	end

	-- Place Random Luxuries
	if self.iNumTypesRandom > 0 then
		--print("* *"); print("* iNumTypesRandom = ", self.iNumTypesRandom); print("* *");
		-- This table governs targets for total number of luxuries placed in the world, not
		-- including the "extra types" of Luxuries placed at start locations. These targets
		-- are approximate. An additional random factor is added in based on number of civs.
		-- Any difference between regional and city state luxuries placed, and the target, is
		-- made up for with the number of randomly placed luxuries that get distributed.
		
		local world_size_data = self:GetWorldLuxuryTargetNumbers()
		-- This modifies self.luxuryDensity if random, to a value between 1 and 3
		-- Which is okay, since regional luxuries have been placed
		
		local targetLuxForThisWorldSize = world_size_data[1];
		local loopTarget = world_size_data[2];
		local extraLux = Map.Rand(self.iNumCivs, "Luxury Resource Variance - Place Resources LUA");
		local iNumRandomLuxTarget = targetLuxForThisWorldSize + extraLux - self.totalLuxPlacedSoFar;
		--print("* *"); print("* targetLuxForThisWorldSize = ", targetLuxForThisWorldSize); print("* *");	-- MOD.Barathor: Test
		--print("* *"); print("* random to add to target = ", extraLux); print("* *");					-- MOD.Barathor: Test
		--print("* *"); print("* totalLuxPlacedSoFar = ", self.totalLuxPlacedSoFar); print("* *");		-- MOD.Barathor: Test
		--print("* *"); print("* iNumRandomLuxTarget = ", iNumRandomLuxTarget); print("* *");				-- MOD.Barathor: Test
		local iNumRandomLuxPlaced, iNumThisLuxToPlace = 0, 0;
		-- This table weights the amount of random luxuries to place, with first-selected getting heavier weighting.
		local random_lux_ratios_table = {
		{1},
		{0.55, 0.45},
		{0.40, 0.33, 0.27},
		{0.35, 0.25, 0.25, 0.15},
		{0.25, 0.25, 0.20, 0.15, 0.15},
		{0.20, 0.20, 0.20, 0.15, 0.15, 0.10},
		{0.20, 0.20, 0.15, 0.15, 0.10, 0.10, 0.10},
		{0.20, 0.15, 0.15, 0.10, 0.10, 0.10, 0.10, 0.10} };

		for loop, res_ID in ipairs(self.resourceIDs_assigned_to_random) do
			local primary, secondary, tertiary, quaternary, quinary, senary, luxury_plot_lists, current_list, iNumLeftToPlace;	-- MOD.Barathor: New -- added a quinary and senary list
			primary, secondary, tertiary, quaternary, quinary, senary = self:GetIndicesForLuxuryType(res_ID);					-- MOD.Barathor: New -- added a quinary and senary list
			if self.iNumTypesRandom > 8 then
				iNumThisLuxToPlace = math.max(3, math.ceil(iNumRandomLuxTarget / 10));
			else
				local lux_minimum = math.max(3, loopTarget - loop);
				local lux_share_of_remaining = math.ceil(iNumRandomLuxTarget * random_lux_ratios_table[self.iNumTypesRandom][loop]);
				iNumThisLuxToPlace = math.max(lux_minimum, lux_share_of_remaining);
			end
			-- Place this luxury type.
			current_list = self.global_luxury_plot_lists[primary];
			iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumThisLuxToPlace, 0.25, 2, 4, 6, current_list);
			if iNumLeftToPlace > 0 and secondary > 0 then
				current_list = self.global_luxury_plot_lists[secondary];
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 0.25, 2, 4, 6, current_list);
			end
			if iNumLeftToPlace > 0 and tertiary > 0 then
				current_list = self.global_luxury_plot_lists[tertiary];
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 0.25, 2, 4, 6, current_list);
			end
			if iNumLeftToPlace > 0 and quaternary > 0 then
				current_list = self.global_luxury_plot_lists[quaternary];
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 0.25, 2, 4, 6, current_list);
			end
			if iNumLeftToPlace > 0 and quinary > 0 then		-- MOD.Barathor: New -- added a quinary list
				current_list = self.global_luxury_plot_lists[quinary];
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 0.25, 2, 4, 6, current_list);
			end
			if iNumLeftToPlace > 0 and senary > 0 then		-- MOD.Barathor: New -- added a senary list
				current_list = self.global_luxury_plot_lists[senary];
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(res_ID, 1, iNumLeftToPlace, 0.25, 2, 4, 6, current_list);
			end
			iNumRandomLuxPlaced = iNumRandomLuxPlaced + iNumThisLuxToPlace - iNumLeftToPlace;
			--print("-"); 
			--print("Random Luxury ID#:", res_ID);	-- MOD.Barathor: Test
			--print("-"); print("Random Luxury Target Number:", iNumThisLuxToPlace);
			--print("Random Luxury Target Placed:", iNumThisLuxToPlace - iNumLeftToPlace); print("-");
		end
		--print("-"); print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
		--print("+ Random Luxuries Target Number:", iNumRandomLuxTarget);
		--print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
		--print("+ Random Luxuries Number Placed:", iNumRandomLuxPlaced);
		--print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"); print("-");
	end

	-- For Resource settings other than Sparse, add a second luxury type at start locations.
	-- This second type will be selected from Random types if possible, CS types if necessary, and other regions' types as a final fallback.
	-- Marble is included in the types possible to be placed.
	if self.luxuryDensity ~= 1 then
		for region_number = 1, self.iNumCivs do
			local x = self.startingPlots[region_number][1];
			local y = self.startingPlots[region_number][2];
			local use_this_ID;
			local candidate_types, iNumTypesAllowed = {}, 0;
			local allowed_luxuries = self:GetListOfAllowableLuxuriesAtCitySite(x, y, 2)
			--print("-"); print("--- Eligible Types List for Second Luxury in Region#", region_number, "---");
			-- See if any Random types are eligible.
			for loop, res_ID in ipairs(self.resourceIDs_assigned_to_random) do
				if allowed_luxuries[res_ID] == true then
					--print("- Found eligible luxury type:", res_ID);
					iNumTypesAllowed = iNumTypesAllowed + 1;
					table.insert(candidate_types, res_ID);
				end
			end
			-- Check to see if any Special Case luxuries are eligible.
			for loop, res_ID in ipairs(self.resourceIDs_assigned_to_special_case) do
				if allowed_luxuries[res_ID] == true then
					--print("- Found eligible luxury type:", res_ID);
					iNumTypesAllowed = iNumTypesAllowed + 1;
					table.insert(candidate_types, res_ID);
				end
			end
		
			if iNumTypesAllowed > 0 then
				local diceroll = 1 + Map.Rand(iNumTypesAllowed, "Choosing second luxury type at a start location - LUA");
				use_this_ID = candidate_types[diceroll];
			else
				-- See if any City State types are eligible.
				for loop, res_ID in ipairs(self.resourceIDs_assigned_to_cs) do
					if allowed_luxuries[res_ID] == true then
						--print("- Found eligible luxury type:", res_ID);
						iNumTypesAllowed = iNumTypesAllowed + 1;
						table.insert(candidate_types, res_ID);
					end
				end
				if iNumTypesAllowed > 0 then
					local diceroll = 1 + Map.Rand(iNumTypesAllowed, "Choosing second luxury type at a start location - LUA");
					use_this_ID = candidate_types[diceroll];
				else
					-- See if anybody else's regional type is eligible.
					local region_lux_ID = self.region_luxury_assignment[region_number];
					for loop, res_ID in ipairs(self.resourceIDs_assigned_to_regions) do
						if res_ID ~= region_lux_ID then
							if allowed_luxuries[res_ID] == true then
								--print("- Found eligible luxury type:", res_ID);
								iNumTypesAllowed = iNumTypesAllowed + 1;
								table.insert(candidate_types, res_ID);
							end
						end
					end
					if iNumTypesAllowed > 0 then
						local diceroll = 1 + Map.Rand(iNumTypesAllowed, "Choosing second luxury type at a start location - LUA");
						use_this_ID = candidate_types[diceroll];
					else
						--print("-"); print("Failed to place second Luxury type at start in Region#", region_number, "-- no eligible types!"); print("-");
					end
				end
			end
			--print("--- End of Eligible Types list for Second Luxury in Region#", region_number, "---");
			if use_this_ID ~= nil then -- Place this luxury type at this start.
				local primary, secondary, tertiary, quaternary, quinary, senary, luxury_plot_lists, shuf_list;			-- MOD.Barathor: New -- added a quinary and senary list
				primary, secondary, tertiary, quaternary, quinary, senary = self:GetIndicesForLuxuryType(use_this_ID);	-- MOD.Barathor: New -- added a quinary and senary list
				luxury_plot_lists = self:GenerateLuxuryPlotListsAtCitySite(x, y, 2, false)
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[primary])
				local iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
				if iNumLeftToPlace > 0 and secondary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[secondary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace > 0 and tertiary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[tertiary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace > 0 and quaternary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quaternary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace > 0 and quinary > 0 then		-- MOD.Barathor: New -- added a quinary list
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quinary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace > 0 and senary > 0 then		-- MOD.Barathor: New -- added a senary list
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[senary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace == 0 then
					--print("-"); print("Placed Second Luxury type of ID#", use_this_ID, "for start located at Plot", x, y, " in Region#", region_number);
				end
			end
		end
	end

	-- Handle Special Case Luxuries
	if self.iNumTypesSpecialCase > 0 then
		-- Add a special case function for each luxury to be handled as a special case.
		self:PlaceMarble()
	end

	self.realtotalLuxPlacedSoFar = self.totalLuxPlacedSoFar		-- MOD.Barathor: New -- save the real total of luxuries before it gets corrupted with non-luxury additions which use the luxury placement method
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceMarble()
	local marble_already_placed = self.amounts_of_resources_placed[self.marble_ID + 1];
	local marble_target = math.ceil(self.iNumCivs * 0.75);
	if self.luxuryDensity == 1 then
		marble_target = math.ceil(self.iNumCivs * 0.5);
	elseif self.luxuryDensity == 3 then
		marble_target = math.ceil(self.iNumCivs * 1.0);
	end
	local iNumMarbleToPlace = math.max(2, marble_target - marble_already_placed);
	local iW, iH = Map.GetGridSize();
	local iNumLeftToPlace = iNumMarbleToPlace;
	local iNumPlots = table.maxn(self.marble_list);
	if iNumPlots < 1 then
		print("No eligible plots available to place Marble!");
		return
	end
	-- Main loop
	for place_resource = 1, iNumMarbleToPlace do
		for loop, plotIndex in ipairs(self.marble_list) do
			if self.marbleData[plotIndex] == 0 and self.luxuryData[plotIndex] == 0 then
				local x = (plotIndex - 1) % iW;
				local y = (plotIndex - x - 1) / iW;
				local res_plot = Map.GetPlot(x, y)
				if res_plot:GetResourceType(-1) == -1 then -- Placing this resource in this plot.
					res_plot:SetResourceType(self.marble_ID, 1);
					self.amounts_of_resources_placed[self.marble_ID + 1] = self.amounts_of_resources_placed[self.marble_ID + 1] + 1;
					--print("-"); print("Placed Marble randomly at Plot", x, y);			-- MOD.Barathor: Test
					self.totalLuxPlacedSoFar = self.totalLuxPlacedSoFar + 1;
					--print("Total luxuries placed so far: ", self.totalLuxPlacedSoFar);	-- MOD.Barathor: Test
					iNumLeftToPlace = iNumLeftToPlace - 1;
					--print("Still need to place", iNumLeftToPlace, "more units of Marble.");
					self:PlaceResourceImpact(x, y, 2, 1)
					self:PlaceResourceImpact(x, y, 7, 9)	-- MOD.Barathor: Updated -- Increased ripple radius from 6 to 9 to spread out distribution a little better.
					break
				end
			end
		end
	end
	if iNumLeftToPlace > 0 then
		print("Failed to place", iNumLeftToPlace, "units of Marble.");
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceSmallQuantitiesOfStrategics(frequency, plot_list)
	-- This function distributes small quantities of strategic resources.
	if plot_list == nil then
		print("No strategics were placed! -SmallQuantities");
		return
	end
	local iW, iH = Map.GetGridSize();
	local iNumTotalPlots = table.maxn(plot_list);
	local iNumToPlace = math.ceil(iNumTotalPlots / frequency);

	local uran_amt, horse_amt, oil_amt, iron_amt, coal_amt, alum_amt = self:GetSmallStrategicResourceQuantityValues()
	
	-- Main loop
	local current_index = 1;
	for place_resource = 1, iNumToPlace do
		local placed_this_res = false;
		if current_index <= iNumTotalPlots then
			for index_to_check = current_index, iNumTotalPlots do
				if placed_this_res == true then
					break
				else
					current_index = current_index + 1;
				end
				local plotIndex = plot_list[index_to_check];
				if self.strategicData[plotIndex] == 0 then
					local x = (plotIndex - 1) % iW;
					local y = (plotIndex - x - 1) / iW;
					local res_plot = Map.GetPlot(x, y)
					if res_plot:GetResourceType(-1) == -1 then
						-- Placing a small strategic resource here. Need to determine what type to place.
						local selected_ID = -1;
						local selected_quantity = 2;
						local plotType = res_plot:GetPlotType()
						local terrainType = res_plot:GetTerrainType()
						local featureType = res_plot:GetFeatureType()
						if featureType == FeatureTypes.FEATURE_MARSH or featureType == FeatureTypes.FEATURE_JUNGLE then
							local diceroll = Map.Rand(5, "Resource selection - Place Small Quantities LUA");
							if diceroll < 1 or plotType == PlotTypes.PLOT_HILLS then
								selected_ID = self.uranium_ID;
								selected_quantity = uran_amt;
							else
								selected_ID = self.oil_ID;
								selected_quantity = oil_amt;
							end
						elseif featureType == FeatureTypes.FEATURE_FOREST then
							local diceroll = Map.Rand(5, "Resource selection - Place Small Quantities LUA");
							if diceroll < 1 then
								selected_ID = self.uranium_ID;
								selected_quantity = uran_amt;
							else
								selected_ID = self.iron_ID;
								selected_quantity = iron_amt;
							end
						elseif featureType == FeatureTypes.NO_FEATURE then
							if plotType == PlotTypes.PLOT_HILLS then
								if terrainType == TerrainTypes.TERRAIN_GRASS then
									local diceroll = Map.Rand(10, "Resource selection - Place Small Quantities LUA");
									if diceroll < 1 then
										selected_ID = self.uranium_ID;
										selected_quantity = uran_amt;
									elseif diceroll < 6 then
										selected_ID = self.iron_ID;
										selected_quantity = iron_amt;
									else
										selected_ID = self.coal_ID;
										selected_quantity = coal_amt;
									end
								elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
									local diceroll = Map.Rand(10, "Resource selection - Place Small Quantities LUA");
									if diceroll < 1 then
										selected_ID = self.uranium_ID;
										selected_quantity = uran_amt;
									elseif diceroll < 4 then
										selected_ID = self.iron_ID;
										selected_quantity = iron_amt;
									elseif diceroll < 7 then
										selected_ID = self.coal_ID;
										selected_quantity = coal_amt;
									else
										selected_ID = self.aluminum_ID;
										selected_quantity = alum_amt;
									end
								else
									local diceroll = Map.Rand(10, "Resource selection - Place Small Quantities LUA");
									if diceroll < 1 then
										selected_ID = self.uranium_ID;
										selected_quantity = uran_amt;
									elseif diceroll < 5 then
										selected_ID = self.iron_ID;
										selected_quantity = iron_amt;
									else
										selected_ID = self.aluminum_ID;
										selected_quantity = alum_amt;
									end
								end
							elseif terrainType == TerrainTypes.TERRAIN_GRASS then
								if res_plot:IsFreshWater() then
									local diceroll = Map.Rand(10, "Resource selection - Place Small Quantities LUA");
									if diceroll < 1 then
										selected_ID = self.uranium_ID;
										selected_quantity = uran_amt;
									elseif diceroll < 3 then
										selected_ID = self.iron_ID;
										selected_quantity = iron_amt;
									else
										selected_ID = self.horse_ID;
										selected_quantity = horse_amt;
									end
								else
									local diceroll = Map.Rand(10, "Resource selection - Place Small Quantities LUA");
									if diceroll < 1 then
										selected_ID = self.uranium_ID;
										selected_quantity = uran_amt;
									elseif diceroll < 4 then
										selected_ID = self.iron_ID;
										selected_quantity = iron_amt;
									elseif diceroll < 6 then
										selected_ID = self.coal_ID;
										selected_quantity = coal_amt;
									else
										selected_ID = self.horse_ID;
										selected_quantity = horse_amt;
									end
								end
							elseif terrainType == TerrainTypes.TERRAIN_PLAINS then
								local diceroll = Map.Rand(10, "Resource selection - Place Small Quantities LUA");
								if diceroll < 1 then
									selected_ID = self.uranium_ID;
									selected_quantity = uran_amt;
								elseif diceroll < 3 then
									selected_ID = self.iron_ID;
									selected_quantity = iron_amt;
								elseif diceroll < 5 then
									selected_ID = self.coal_ID;
									selected_quantity = coal_amt;
								elseif diceroll < 7 then
									selected_ID = self.horse_ID;
									selected_quantity = horse_amt;
								else
									selected_ID = self.aluminum_ID;
									selected_quantity = alum_amt;
								end
							elseif terrainType == TerrainTypes.TERRAIN_DESERT then
								if res_plot:IsFreshWater() then
									selected_ID = self.horse_ID;
									selected_quantity = horse_amt;
								else
									local diceroll = Map.Rand(10, "Resource selection - Place Small Quantities LUA");
									if diceroll < 1 then
										selected_ID = self.uranium_ID;
										selected_quantity = uran_amt;
									elseif diceroll < 3 then
										selected_ID = self.iron_ID;
										selected_quantity = iron_amt;
									elseif diceroll < 6 then
										selected_ID = self.oil_ID;
										selected_quantity = oil_amt;
									else
										selected_ID = self.aluminum_ID;
										selected_quantity = alum_amt;
									end
								end
							elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
								local diceroll = Map.Rand(10, "Resource selection - Place Small Quantities LUA");
								if diceroll < 1 then
									selected_ID = self.uranium_ID;
									selected_quantity = uran_amt;
								elseif diceroll < 4 then
									selected_ID = self.iron_ID;
									selected_quantity = iron_amt;
								elseif diceroll < 7 then
									selected_ID = self.coal_ID;
									selected_quantity = coal_amt;
								elseif diceroll < 9 then
									selected_ID = self.horse_ID;
									selected_quantity = horse_amt;
								else
									selected_ID = self.oil_ID;
									selected_quantity = oil_amt;
								end
							else
								local diceroll = Map.Rand(10, "Resource selection - Place Small Quantities LUA");
								if diceroll < 3 then
									selected_ID = self.uranium_ID;
									selected_quantity = uran_amt;
								elseif diceroll < 6 then
									selected_ID = self.iron_ID;
									selected_quantity = iron_amt;
								else
									selected_ID = self.oil_ID;
									selected_quantity = oil_amt;
								end
							end
						end
						-- Now place the resource, then impact the strategic data layer.
						if selected_ID ~= -1 then	
							local strat_radius = Map.Rand(4, "Resource Radius - Place Small Quantities LUA");
							if strat_radius > 2 then
								strat_radius = 1;
							end
							res_plot:SetResourceType(selected_ID, selected_quantity);
							self:PlaceResourceImpact(x, y, 1, strat_radius);
							placed_this_res = true;
							self.amounts_of_resources_placed[selected_ID + 1] = self.amounts_of_resources_placed[selected_ID + 1] + selected_quantity;
						end
					end
				end
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceFish(frequency, plot_list)
	-- This function places fish at members of plot_list. (Sounds fishy to me!)
	if plot_list == nil then
		print("No fish were placed! -PlaceFish");
		return
	end
	local iW, iH = Map.GetGridSize();
	local iNumTotalPlots = table.maxn(plot_list);
	local iNumFishToPlace = math.ceil(iNumTotalPlots / frequency);
	-- Main loop
	local current_index = 1;
	for place_resource = 1, iNumFishToPlace do
		local placed_this_res = false;
		if current_index <= iNumTotalPlots then
			for index_to_check = current_index, iNumTotalPlots do
				if placed_this_res == true then
					break
				else
					current_index = current_index + 1;
				end
				local plotIndex = plot_list[index_to_check];
				if self.fishData[plotIndex] == 0 then
					local x = (plotIndex - 1) % iW;
					local y = (plotIndex - x - 1) / iW;
					local res_plot = Map.GetPlot(x, y)
					if res_plot:GetResourceType(-1) == -1 then
						-- Placing fish here. First decide impact radius of this fish.
						local fish_radius = Map.Rand(7, "Fish Radius - Place Fish LUA");
						if fish_radius > 5 then
							fish_radius = 3;
						end
						res_plot:SetResourceType(self.fish_ID, 1);
						self:PlaceResourceImpact(x, y, 4, fish_radius);
						placed_this_res = true;
						self.amounts_of_resources_placed[self.fish_ID + 1] = self.amounts_of_resources_placed[self.fish_ID + 1] + 1;
					end
				end
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceSexyBonusAtCivStarts()
	-- This function will place a Bonus resource in the third ring around a Civ's start.
	-- The added Bonus is meant to make the start look more sexy, so to speak.
	-- Third-ring resources will take a long time to bring online, but will assist the site in the late game.
	-- Alternatively, it may assist a different city if another city is settled close enough to the capital and takes control of this tile.
	local iW, iH = Map.GetGridSize();
	local wrapX = Map:IsWrapX();
	local wrapY = Map:IsWrapY();
	local odd = self.firstRingYIsOdd;
	local even = self.firstRingYIsEven;
	local nextX, nextY, plot_adjustments;
	
	local bonus_type_associated_with_region_type = {self.deer_ID, self.banana_ID, 
	self.deer_ID, self.wheat_ID, self.sheep_ID, self.wheat_ID, self.cow_ID, self.cow_ID,
	self.sheep_ID, self.deer_ID};
	
	for region_number = 1, self.iNumCivs do
		local x = self.startingPlots[region_number][1];
		local y = self.startingPlots[region_number][2];
		local region_type = self.regionTypes[region_number];
		local use_this_ID = bonus_type_associated_with_region_type[region_type];
		local plot_list, fish_list = {}, {};
		-- For notes on how the hex-iteration works, refer to PlaceResourceImpact()
		local ripple_radius = 3;
		local currentX = x - ripple_radius;
		local currentY = y;
		for direction_index = 1, 6 do
			for plot_to_handle = 1, ripple_radius do
			 	if currentY / 2 > math.floor(currentY / 2) then
					plot_adjustments = odd[direction_index];
				else
					plot_adjustments = even[direction_index];
				end
				nextX = currentX + plot_adjustments[1];
				nextY = currentY + plot_adjustments[2];
				if wrapX == false and (nextX < 0 or nextX >= iW) then
					-- X is out of bounds.
				elseif wrapY == false and (nextY < 0 or nextY >= iH) then
					-- Y is out of bounds.
				else
					local realX = nextX;
					local realY = nextY;
					if wrapX then
						realX = realX % iW;
					end
					if wrapY then
						realY = realY % iH;
					end
					-- We've arrived at the correct x and y for the current plot.
					local plot = Map.GetPlot(realX, realY);
					local featureType = plot:GetFeatureType()
					if plot:GetResourceType(-1) == -1 and featureType ~= FeatureTypes.FEATURE_OASIS then -- No resource or Oasis here, safe to proceed.
						local plotType = plot:GetPlotType()
						local terrainType = plot:GetTerrainType()
						local plotIndex = realY * iW + realX + 1;
						-- Now check this plot for eligibility for the applicable Bonus type for this region.
						if use_this_ID == self.deer_ID then
							if featureType == FeatureTypes.FEATURE_FOREST then
								table.insert(plot_list, plotIndex);
							elseif terrainType == TerrainTypes.TERRAIN_TUNDRA and plotType == PlotTypes.PLOT_LAND then
								table.insert(plot_list, plotIndex);
							end
						elseif use_this_ID == self.banana_ID then
							if featureType == FeatureTypes.FEATURE_JUNGLE then
								table.insert(plot_list, plotIndex);
							end
						elseif use_this_ID == self.wheat_ID then
							if plotType == PlotTypes.PLOT_LAND then
								if terrainType == TerrainTypes.TERRAIN_PLAINS and featureType == FeatureTypes.NO_FEATURE then
									table.insert(plot_list, plotIndex);
								elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then
									table.insert(plot_list, plotIndex);
								elseif terrainType == TerrainTypes.TERRAIN_DESERT and plot:IsFreshWater() then
									table.insert(plot_list, plotIndex);
								end
							end
						elseif use_this_ID == self.sheep_ID then
							if plotType == PlotTypes.PLOT_HILLS and featureType == FeatureTypes.NO_FEATURE then
								if terrainType == TerrainTypes.TERRAIN_PLAINS or terrainType == TerrainTypes.TERRAIN_GRASS or terrainType == TerrainTypes.TERRAIN_TUNDRA then
									table.insert(plot_list, plotIndex);
								end
							end
						elseif use_this_ID == self.cow_ID then
							if terrainType == TerrainTypes.TERRAIN_GRASS and plotType == PlotTypes.PLOT_LAND then
								if featureType == FeatureTypes.NO_FEATURE then
									table.insert(plot_list, plotIndex);
								end
							end
						end
						if plotType == PlotTypes.PLOT_OCEAN then
							if not plot:IsLake() then
								if featureType ~= self.feature_atoll and featureType ~= FeatureTypes.FEATURE_ICE then
									if terrainType == TerrainTypes.TERRAIN_COAST then
										table.insert(fish_list, plotIndex);
									end
								end
							end
						end
					end
				end
				currentX, currentY = nextX, nextY;
			end
		end
		local iNumCandidates = table.maxn(plot_list);
		if iNumCandidates > 0 then
			--print("Placing 'sexy Bonus' in third ring of start location in Region#", region_number);
			local shuf_list = GetShuffledCopyOfTable(plot_list)
			local iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
			if iNumCandidates > 1 and use_this_ID == self.sheep_ID then
				-- Hills region, attempt to give them a second Sexy Sheep.
				--print("Placing a second 'sexy Sheep' in third ring of start location in Hills Region#", region_number);
				iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, 1, 1, 1, -1, 0, 0, shuf_list);
			end
		else
			local iFishCandidates = table.maxn(fish_list);
			if iFishCandidates > 0 then
				--print("Placing 'sexy Fish' in third ring of start location in Region#", region_number);
				local shuf_list = GetShuffledCopyOfTable(fish_list)
				local iNumLeftToPlace = self:PlaceSpecificNumberOfResources(self.fish_ID, 1, 1, 1, -1, 0, 0, shuf_list);
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:AddExtraBonusesToHillsRegions()
	-- Hills/Mountain regions are very low on food, yet not deemed by the fertility measurements to be so.
	-- Spreading some food bonus around in these regions will help bring them up closer to par.
	local iW, iH = Map.GetGridSize();
	local wrapX = Map:IsWrapX();
	local wrapY = Map:IsWrapY();
	-- Identify Hills Regions, if any.
	local hills_regions, iNumHillsRegions = {}, 0;
	for region_number = 1, self.iNumCivs do
		if self.regionTypes[region_number] == 5 or self.regionTypes[region_number] == 9 then
			iNumHillsRegions = iNumHillsRegions + 1;
			table.insert(hills_regions, region_number);
		end
	end
	if iNumHillsRegions == 0 then -- We're done.
		return
	end
	-- Process Hills Regions
	local shuffled_hills_regions = GetShuffledCopyOfTable(hills_regions)
	for loop, region_number in ipairs(shuffled_hills_regions) do
		local iWestX = self.regionData[region_number][1];
		local iSouthY = self.regionData[region_number][2];
		local iWidth = self.regionData[region_number][3];
		local iHeight = self.regionData[region_number][4];
		local iAreaID = self.regionData[region_number][5];
		--
		local terrainCounts = self.regionTerrainCounts[region_number];
		--local totalPlots = terrainCounts[1];
		local areaPlots = terrainCounts[2];
		--local waterCount = terrainCounts[3];
		local flatlandsCount = terrainCounts[4];
		local hillsCount = terrainCounts[5];
		local peaksCount = terrainCounts[6];
		--local lakeCount = terrainCounts[7];
		--local coastCount = terrainCounts[8];
		--local oceanCount = terrainCounts[9];
		--local iceCount = terrainCounts[10];
		local grassCount = terrainCounts[11];
		local plainsCount = terrainCounts[12];
		--local desertCount = terrainCounts[13];
		--local tundraCount = terrainCounts[14];
		--local snowCount = terrainCounts[15];
		--local forestCount = terrainCounts[16];
		--local jungleCount = terrainCounts[17];
		--local marshCount = terrainCounts[18];
		--local riverCount = terrainCounts[19];
		--local floodplainCount = terrainCounts[20];
		--local oasisCount = terrainCounts[21];
		--local coastalLandCount = terrainCounts[22];
		--local nextToCoastCount = terrainCounts[23];
		--
		-- Check how badly infertile the region is by comparing hills and mountains to flat farmlands.
		local hills_ratio = (hillsCount + peaksCount) / areaPlots;
		local farm_ratio = (grassCount + plainsCount) / areaPlots;
		if self.method == 3 then -- Need to ignore water tiles, which are included in areaPlots with this regional division method.
			hills_ratio = (hillsCount + peaksCount) / (hillsCount + peaksCount + flatlandsCount);
			farm_ratio = (grassCount + plainsCount) / (hillsCount + peaksCount + flatlandsCount);
		end
		-- If the infertility quotient is greater than 1, this will increase how
		-- many Bonus get placed, up to a max of double the normal ratio.
		local infertility_quotient = 1 + math.max(0, hills_ratio - farm_ratio);
		
		print("Infertility Quotient for Hills Region#", region_number, " is:", infertility_quotient);
		
		--
		-- Generate plot lists for the extra Bonus placements.
		local dry_hills, flat_plains, flat_grass, flat_tundra, jungles, forests = {}, {}, {}, {}, {}, {};
		for region_loop_y = 0, iHeight - 1 do
			for region_loop_x = 0, iWidth - 1 do
				local x = (region_loop_x + iWestX) % iW;
				local y = (region_loop_y + iSouthY) % iH;
				local plot = Map.GetPlot(x, y);
				local plotIndex = y * iW + x + 1;
				local area_of_plot = plot:GetArea();
				local plotType = plot:GetPlotType()
				local terrainType = plot:GetTerrainType()
				local featureType = plot:GetFeatureType()
				if plotType == PlotTypes.PLOT_LAND or plotType == PlotTypes.PLOT_HILLS then
					-- Check plot for region membership. Only process this plot if it is a member.
					if (area_of_plot == iAreaID) or (iAreaID == -1) then
						if plot:GetResourceType(-1) == -1 then
							if featureType == FeatureTypes.FEATURE_JUNGLE then
								table.insert(jungles, plotIndex);
							elseif featureType == FeatureTypes.FEATURE_FOREST then
								table.insert(forests, plotIndex);
							elseif featureType == FeatureTypes.FEATURE_FLOOD_PLAINS then
								table.insert(flat_plains, plotIndex);
							elseif featureType == FeatureTypes.NO_FEATURE then
								if plotType == PlotTypes.PLOT_HILLS then
									if (terrainType == TerrainTypes.TERRAIN_GRASS or terrainType == TerrainTypes.TERRAIN_PLAINS or terrainType == TerrainTypes.TERRAIN_TUNDRA) then
										if plot:IsFreshWater() == false then
											table.insert(dry_hills, plotIndex);
										end
									end
								elseif plotType == PlotTypes.PLOT_LAND then
									if terrainType == TerrainTypes.TERRAIN_PLAINS then
										table.insert(flat_plains, plotIndex);
									elseif terrainType == TerrainTypes.TERRAIN_DESERT and plot:IsFreshWater() then
										table.insert(flat_plains, plotIndex);
									elseif terrainType == TerrainTypes.TERRAIN_GRASS then
										table.insert(flat_grass, plotIndex);
									elseif terrainType == TerrainTypes.TERRAIN_TUNDRA then
										table.insert(flat_tundra, plotIndex);
									end
								end
							end
						end
					end
				end
			end
		end
		
		--[[
		print("-"); print("--- Extra-Bonus Plot Counts for Hills Region#", region_number, "---");
		print("- Jungles:", table.maxn(jungles));
		print("- Forests:", table.maxn(forests));
		print("- Tundra:", table.maxn(flat_tundra));
		print("- Plains:", table.maxn(flat_plains));
		print("- Grass:", table.maxn(flat_grass));
		print("- Dry Hills:", table.maxn(dry_hills));
		]]--
		
		-- Now that the plot lists are ready, place the Bonuses.
		if table.maxn(dry_hills) > 0 then
			local resources_to_place = {
			{self.sheep_ID, 1, 100, 0, 1} };
			self:ProcessResourceList(16 / infertility_quotient, 3, dry_hills, resources_to_place)
		end
		if table.maxn(jungles) > 0 then
			local resources_to_place = {
			{self.banana_ID, 1, 100, 1, 2} };
			self:ProcessResourceList(14 / infertility_quotient, 3, jungles, resources_to_place)
		end
		if table.maxn(flat_tundra) > 0 then
			local resources_to_place = {
			{self.deer_ID, 1, 100, 0, 1} };
			self:ProcessResourceList(14 / infertility_quotient, 3, flat_tundra, resources_to_place)
		end
		if table.maxn(flat_plains) > 0 then
			local resources_to_place = {
			{self.wheat_ID, 1, 100, 0, 2} };
			self:ProcessResourceList(16 / infertility_quotient, 3, flat_plains, resources_to_place)
		end
		if table.maxn(flat_grass) > 0 then
			local resources_to_place = {
			{self.cow_ID, 1, 100, 0, 2} };
			self:ProcessResourceList(14 / infertility_quotient, 3, flat_grass, resources_to_place)
		end
		if table.maxn(forests) > 0 then
			local resources_to_place = {
			{self.deer_ID, 1, 100, 1, 2} };
			self:ProcessResourceList(24 / infertility_quotient, 3, forests, resources_to_place)
		end
		
		--
		print("-"); print("Added extra Bonus resources to Hills Region#", region_number);
		--
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:AddModernMinorStrategicsToCityStates()
	-- This function added Spring 2011. Purpose is to add a small strategic to most city states.
	local uran_amt, horse_amt, oil_amt, iron_amt, coal_amt, alum_amt = self:GetSmallStrategicResourceQuantityValues()
	for city_state = 1, self.iNumCityStates do
		-- First check to see if this city state number received a valid start plot.
		if self.city_state_validity_table[city_state] == false then
			-- This one did not! It does not exist on the map nor have valid data, so we will ignore it.
		else
			-- OK, it's a valid city state. Process it.
			local x = self.cityStatePlots[city_state][1];
			local y = self.cityStatePlots[city_state][2];
			-- Choose strategic type. Options are: 0 None, 1 Coal, 2 Oil, 3 Aluminum
			local diceroll = Map.Rand(5, "Choose resource type - CS Strategic LUA");
			if diceroll > 1 then
				-- This city state selected for minor strategic resource placement.
				local use_this_ID, res_amt, luxury_plot_lists, shuf_list;
				local primary, secondary, tertiary, quaternary, quinternary, sexternary = 0, 0, 0, 0, 0, 0;
				if diceroll == 2 then
					use_this_ID = self.coal_ID;
					res_amt = coal_amt;
					primary, secondary, tertiary, quaternary, quinternary, sexternary = 24, 18, 12, 13, 19, 13;
				elseif diceroll == 3 then
					use_this_ID = self.oil_ID;
					res_amt = oil_amt;
					primary, secondary, tertiary, quaternary, quinternary, sexternary = 10, 2, 8, 17, 1, 1;
				elseif diceroll == 4 then
					use_this_ID = self.aluminum_ID;
					res_amt = alum_amt;
					primary, secondary, tertiary, quaternary, quinternary, sexternary = 25, 25, 36, 36, 18, 19;
				end
				--print("-"); print("-"); print("-Assigned Strategic Type", use_this_ID, "to City State#", city_state);
				-- Place strategic.
				luxury_plot_lists = self:GenerateLuxuryPlotListsAtCitySite(x, y, 3, false)
				shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[primary])
				local iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, res_amt, 1, 1, -1, 0, 0, shuf_list);
				if iNumLeftToPlace > 0 and secondary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[secondary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, res_amt, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace > 0 and tertiary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[tertiary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, res_amt, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace > 0 and quaternary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quaternary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, res_amt, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace > 0 and quinternary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[quinternary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, res_amt, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace > 0 and sexternary > 0 then
					shuf_list = GetShuffledCopyOfTable(luxury_plot_lists[sexternary])
					iNumLeftToPlace = self:PlaceSpecificNumberOfResources(use_this_ID, res_amt, 1, 1, -1, 0, 0, shuf_list);
				end
				if iNumLeftToPlace == 0 then
					--print("-"); print("Placed Minor Strategic ID#", use_this_ID, "at City State#", city_state, "located at Plot", x, y);
				end
			else
				--print("-"); print("-"); print("-City State#", city_state, "gets no strategic resource assigned to it.");
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceOilInTheSea()
	-- Places sources of Oil in Coastal waters, equal to half what's on the 
	-- land. If the map has too little ocean, then whatever will fit.
	--
	-- WARNING: This operation will render the Strategic Resource Impact Table useless for
	-- further operations, so should always be called last, even after minor placements.
	local sea_oil_amt_small = 2;
	local sea_oil_amt_major = 3;
	local iNumLandOilUnits = self.amounts_of_resources_placed[self.oil_ID + 1];
	local iNumToPlaceSmall = math.floor((iNumLandOilUnits / 4) / sea_oil_amt_small);
	local iNumToPlaceMajor = math.floor((iNumLandOilUnits / 4) / sea_oil_amt_major);

	--print("Adding Oil resources to the Sea.");
	--experimental; possibly janky
	self:PlaceSpecificNumberOfResources(self.oil_ID, sea_oil_amt_small, iNumToPlaceSmall, 0.2, 1, 2, 4, self.coast_list)
	self:PlaceSpecificNumberOfResources(self.oil_ID, sea_oil_amt_major, iNumToPlaceMajor, 0.2, 1, 4, 7, self.coast_list)
end
------------------------------------------------------------------------------
function AssignStartingPlots:AdjustTiles()
	--[[ MOD.Barathor: 
	
		 Hijacked this function and it now fixes many resource types.  Formerly, this function was FixSugarJungles.
		 This function does not adjust terrain types (except when under jungle), so that terrain bands stay intact.
	
		 This allows much greater flexibility when assigning resources to the map. ]]

	-- ####Not Communitu_79a's version since that depends on map settings, so here's a generic one
	
	-- This function was renamed to AdjustTiles from FixResourceGraphics

	local iW, iH = Map.GetGridSize()
	for y = 0, iH - 1 do
		for x = 0, iW - 1 do
			
			local plot = Map.GetPlot(x, y)
			local res_ID = plot:GetResourceType(-1)
			local featureType = plot:GetFeatureType()
			
			-- Mined/Quarried Resources
			if res_ID == self.marble_ID or 
			   res_ID == self.gold_ID or 
			   res_ID == self.silver_ID or 
			   res_ID == self.copper_ID or 
			   res_ID == self.gems_ID or 
			   res_ID == self.salt_ID or 
			   res_ID == self.lapis_ID or 
			   res_ID == self.jade_ID or 
			   res_ID == self.amber_ID or
			   -- MOD.HungryForFood: Start
			   self:IsEvenMoreResourcesActive() == true and
			   (
			   res_ID == self.obsidian_ID or
			   res_ID == self.platinum_ID or
			   res_ID == self.tin_ID or
			   res_ID == self.lead_ID or
			   res_ID == self.sulfur_ID or
			   res_ID == self.titanium_ID
			   )
			   -- MOD.HungryForFood: End
			   then 
			   
				-- If a forest, jungle or flood plains is present, keep it.  Remove anything else.
				if (featureType ~= FeatureTypes.FEATURE_FOREST) and (featureType ~= FeatureTypes.FEATURE_JUNGLE) and (featureType ~= FeatureTypes.FEATURE_FLOOD_PLAINS) then
					plot:SetFeatureType(FeatureTypes.NO_FEATURE, -1)
				end
				
			-- Tree Resources
			elseif res_ID == self.cocoa_ID or 
				   res_ID == self.citrus_ID or 
				   res_ID == self.spices_ID or 
				   res_ID == self.sugar_ID or 
				   res_ID == self.truffles_ID or 
				   res_ID == self.silk_ID or 
				   res_ID == self.dye_ID or 
				   res_ID == self.fur_ID or 
				   res_ID == self.deer_ID or
				   -- MOD.HungryForFood: Start
				   self:IsEvenMoreResourcesActive() == true and
				   (
				   res_ID == self.hardwood_ID or
				   res_ID == self.rubber_ID
				   )
				   -- MOD.HungryForFood: End
				   then
				
				if res_ID == self.fur_ID then
					-- Always want it flat.  The foxes fall into the hills.
					plot:SetPlotType(PlotTypes.PLOT_LAND, false, true)
				end
				
				-- MOD.Barathor: Gets the latitude of the tile to determine jungle eligibility.  Note: I like to use symmetrical latitudes, with an equator the width of two rows, which my map script utilizes.
				local lat = 0
				if (y >= (iH/2)) then
					lat = math.abs((iH/2) - y)/(iH/2)
				else
					lat = math.abs((iH/2) - (y + 1))/(iH/2)
				end
				local AvgJungleRange = 0
				--[[ MOD.Barathor: 
					 Get Rainfall setting to determine appropriate jungle range.
					 Assumed Formula: (jungle percent) / ((jungle percent) * (jungle factor)) = X; Jungle will form from 0.0 to X, decreasing as it gets further.
					 Example: Normal Rainfall: 65 / (65 * 5) = 0.2; Divide by 2 to get the mid range, which we'll use to blend it in.  ]]
				local rain = Map.GetCustomOption(2)	
				if rain == 1 then		
					-- Arid
					AvgJungleRange = 0.08
				elseif rain == 3 then	
					-- Wet
					AvgJungleRange = 0.25
				else					
					-- Normal or Random (Note: I'm currently not sure how to retrieve random, so we'll just use normal for now.)
					AvgJungleRange = 0.10
				end
				
				-- Always want it covered for most tree resources.
				if (featureType == FeatureTypes.FEATURE_MARSH) then
					if res_ID == self.sugar_ID or res_ID == self.spices_ID or res_ID == self.dye_ID then
						-- Keep it marsh for these resources.
					else
						-- Add some jungle or forest.
						if lat <= AvgJungleRange then
							if res_ID ~= self.deer_ID and res_ID ~= self.fur_ID then
								plot:SetFeatureType(FeatureTypes.FEATURE_JUNGLE, -1)
							else
								plot:SetFeatureType(FeatureTypes.FEATURE_FOREST, -1)
							end
						else
							plot:SetFeatureType(FeatureTypes.FEATURE_FOREST, -1)
						end	
					end
				else
					-- Add some jungle or forest.
					if lat <= AvgJungleRange then
						if res_ID ~= self.deer_ID and res_ID ~= self.fur_ID then
							plot:SetFeatureType(FeatureTypes.FEATURE_JUNGLE, -1)
						else
							plot:SetFeatureType(FeatureTypes.FEATURE_FOREST, -1)
						end
					else
						plot:SetFeatureType(FeatureTypes.FEATURE_FOREST, -1)
					end		
				end
				
			-- Open Land Resources
			elseif res_ID == self.incense_ID or 
				   res_ID == self.ivory_ID or 
				   res_ID == self.wine_ID or 
				   res_ID == self.olives_ID or 
				   res_ID == self.coffee_ID or
				   res_ID == self.tobacco_ID or 
				   res_ID == self.tea_ID or 
				   res_ID == self.perfume_ID or 
				   res_ID == self.cotton_ID or 
				   -- MOD.HungryForFood: Start
				   self:IsEvenMoreResourcesActive() == true and
				   (
				   res_ID == self.poppy_ID
				   )
				   -- MOD.HungryForFood: End
				   then
				
				if res_ID == self.ivory_ID then
					-- Always want it flat.  Other types are fine on hills.
					plot:SetPlotType(PlotTypes.PLOT_LAND, false, true)
				end
				
				-- Don't remove flood plains if present for the few that are placed on it, only remove other features, like marsh or any trees.				
				if (featureType ~= FeatureTypes.FEATURE_FLOOD_PLAINS) then	
					plot:SetFeatureType(FeatureTypes.NO_FEATURE, -1)
				end
				
				if res_ID == self.incense_ID then
					-- Because incense is very restricted, it was expanded to look for grass tiles as a final fallback.
					-- This will help with certain distributions that incense previously didn't work well in, such as assignments to city-states which could be hit or miss.
					-- Besides jungle placements, this is the only luxury which will change the terrain it's found on.  Plus, plains are mixed in with grass anyway.
					if terrainType == TerrainTypes.TERRAIN_GRASS then
						plot:SetTerrainType(TerrainTypes.TERRAIN_PLAINS, false, true)
					end
				end
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:PrintFinalResourceTotalsToLog()
	print("-");
	print("--- Table of Results, New Start Finder ---");
	for loop, startData in ipairs(self.startingPlots) do
		print("-");
		print("Region#", loop, " has start plot at: ", startData[1], startData[2], "with Fertility Rating of ", startData[3]);
	end
	print("-");
	print("--- End of Start Finder Results Table ---");
	print("-");
	print("-");
	print("--- Table of Final Results, City State Placements ---");
	print("-");
	for cs_number = 1, self.iNumCityStates do
		if self.city_state_validity_table[cs_number] == true then
			local data_table = self.cityStatePlots[cs_number];
			local x = data_table[1];
			local y = data_table[2];
			local regNum = data_table[3];
			print("- City State", cs_number, "in Region", regNum, "is located at Plot", x, y);
		else
			print("- City State", cs_number, "was discarded due to overcrowding.");
		end
	end
	print("-");
	print("- - - - -");
	print("-");
	print("--- Table of Final Results, Resource Distribution ---");
	print("-");
	print("- LUXURY Resources -");
	-- MOD.Barathor: Updated: Added ID numbers to each resource name and reordered them for much easier testing!
	print(self.whale_ID,    "Whale...: ", self.amounts_of_resources_placed[self.whale_ID + 1])
	print(self.pearls_ID,   "Pearls..: ", self.amounts_of_resources_placed[self.pearls_ID + 1])
	print(self.gold_ID,     "Gold....: ", self.amounts_of_resources_placed[self.gold_ID + 1])
	print(self.silver_ID,   "Silver..: ", self.amounts_of_resources_placed[self.silver_ID + 1])
	print(self.gems_ID,     "Gems....: ", self.amounts_of_resources_placed[self.gems_ID + 1])
	print(self.marble_ID,   "Marble..: ", self.amounts_of_resources_placed[self.marble_ID + 1])
	print(self.ivory_ID,    "Ivory...: ", self.amounts_of_resources_placed[self.ivory_ID + 1])
	print(self.fur_ID,      "Fur.....: ", self.amounts_of_resources_placed[self.fur_ID + 1])
	print(self.dye_ID,      "Dye.....: ", self.amounts_of_resources_placed[self.dye_ID + 1])
	print(self.spices_ID,   "Spices..: ", self.amounts_of_resources_placed[self.spices_ID + 1])
	print(self.silk_ID,     "Silk....: ", self.amounts_of_resources_placed[self.silk_ID + 1])
	print(self.sugar_ID,    "Sugar...: ", self.amounts_of_resources_placed[self.sugar_ID + 1])
	print(self.cotton_ID,   "Cotton..: ", self.amounts_of_resources_placed[self.cotton_ID + 1])
	print(self.wine_ID,     "Wine....: ", self.amounts_of_resources_placed[self.wine_ID + 1])
	print(self.incense_ID,  "Incense.: ", self.amounts_of_resources_placed[self.incense_ID + 1])
	print("- Expansion LUXURY Resources -");
	print(self.copper_ID,   "Copper..: ", self.amounts_of_resources_placed[self.copper_ID + 1])
	print(self.salt_ID,     "Salt....: ", self.amounts_of_resources_placed[self.salt_ID + 1])
	print(self.crab_ID,     "Crab....: ", self.amounts_of_resources_placed[self.crab_ID + 1])
	print(self.truffles_ID, "Truffles: ", self.amounts_of_resources_placed[self.truffles_ID + 1])
	print(self.citrus_ID,   "Citrus..: ", self.amounts_of_resources_placed[self.citrus_ID + 1])
	print(self.cocoa_ID,    "Cocoa...: ", self.amounts_of_resources_placed[self.cocoa_ID + 1])
	-- MOD.Barathor: Start
	print("- Mod LUXURY Resources -")
	print(self.coffee_ID,   "Coffee..: ", self.amounts_of_resources_placed[self.coffee_ID + 1])
	print(self.tea_ID,      "Tea.....: ", self.amounts_of_resources_placed[self.tea_ID + 1])
	print(self.tobacco_ID,  "Tobacco.: ", self.amounts_of_resources_placed[self.tobacco_ID + 1])
	print(self.amber_ID,    "Amber...: ", self.amounts_of_resources_placed[self.amber_ID + 1])
	print(self.jade_ID,     "Jade....: ", self.amounts_of_resources_placed[self.jade_ID + 1])
	print(self.olives_ID,   "Olives..: ", self.amounts_of_resources_placed[self.olives_ID + 1])
	print(self.perfume_ID,  "Perfume.: ", self.amounts_of_resources_placed[self.perfume_ID + 1])
	print(self.coral_ID,  	"Coral...: ", self.amounts_of_resources_placed[self.coral_ID + 1])
	print(self.lapis_ID,  	"Lapis...: ", self.amounts_of_resources_placed[self.lapis_ID + 1])
	print("-")
	-- MOD.HungryForFood: Start
	if self:IsEvenMoreResourcesActive() == true then
		print("- Even More Resources for Vox Populi (Luxuries) -")
		print(self.lavender_ID,  "Lavender: ", self.amounts_of_resources_placed[self.lavender_ID + 1])
		print(self.obsidian_ID,  "Obsidian: ", self.amounts_of_resources_placed[self.obsidian_ID + 1])
		print(self.platinum_ID,  "Platinum: ", self.amounts_of_resources_placed[self.platinum_ID + 1])
		print(self.poppy_ID,     "Poppy...: ", self.amounts_of_resources_placed[self.poppy_ID + 1])
		print(self.tin_ID,       "Tin.....: ", self.amounts_of_resources_placed[self.tin_ID + 1])
		print("-")
	end
	-- MOD.HungryForFood: End
	print("+ TOTAL.Lux: ", self.realtotalLuxPlacedSoFar)	-- MOD.Barathor: Fixed: The old variable gets corrupted with non-luxury additions after all luxuries have been placed.  This will display the correct total.
	-- MOD.Barathor: End
	print("-");
	print("- STRATEGIC Resources -");
	print(self.iron_ID,     "Iron....: ", self.amounts_of_resources_placed[self.iron_ID + 1])
	print(self.horse_ID,    "Horse...: ", self.amounts_of_resources_placed[self.horse_ID + 1])
	print(self.coal_ID,     "Coal....: ", self.amounts_of_resources_placed[self.coal_ID + 1])
	print(self.oil_ID,      "Oil.....: ", self.amounts_of_resources_placed[self.oil_ID + 1])
	print(self.aluminum_ID, "Aluminum: ", self.amounts_of_resources_placed[self.aluminum_ID + 1])
	print(self.uranium_ID,  "Uranium.: ", self.amounts_of_resources_placed[self.uranium_ID + 1])
	print("-");
	print("- BONUS Resources -");
	print(self.wheat_ID,    "Wheat...: ", self.amounts_of_resources_placed[self.wheat_ID + 1])
	print(self.cow_ID,      "Cow.....: ", self.amounts_of_resources_placed[self.cow_ID + 1])
	print(self.sheep_ID,    "Sheep...: ", self.amounts_of_resources_placed[self.sheep_ID + 1])
	print(self.deer_ID,     "Deer....: ", self.amounts_of_resources_placed[self.deer_ID + 1])
	print(self.banana_ID,   "Banana..: ", self.amounts_of_resources_placed[self.banana_ID + 1])
	print(self.fish_ID,     "Fish....: ", self.amounts_of_resources_placed[self.fish_ID + 1])
	print(self.stone_ID,    "Stone...: ", self.amounts_of_resources_placed[self.stone_ID + 1])
	print(self.bison_ID,    "Bison...: ", self.amounts_of_resources_placed[self.bison_ID + 1])
	print("-");
	-- MOD.HungryForFood: Start
	if self:IsEvenMoreResourcesActive() == true then
		print("- Even More Resources for Vox Populi (Bonus) -")
		print(self.coconut_ID,  "Coconut.: ", self.amounts_of_resources_placed[self.coconut_ID + 1])
		print(self.hardwood_ID, "Hardwood: ", self.amounts_of_resources_placed[self.hardwood_ID + 1])
		print(self.lead_ID,     "Lead....: ", self.amounts_of_resources_placed[self.lead_ID + 1])
		print(self.maize_ID,    "Maize...: ", self.amounts_of_resources_placed[self.maize_ID + 1])
		print(self.pineapple_ID,"Pineapple: ", self.amounts_of_resources_placed[self.pineapple_ID + 1])
		print(self.potato_ID,   "Potato..: ", self.amounts_of_resources_placed[self.potato_ID + 1])
		print(self.rice_ID,     "Rice....: ", self.amounts_of_resources_placed[self.rice_ID + 1])
		print(self.rubber_ID,   "Rubber..: ", self.amounts_of_resources_placed[self.rubber_ID + 1])
		print(self.sulfur_ID,   "Sulfur..: ", self.amounts_of_resources_placed[self.sulfur_ID + 1])
		print(self.titanium_ID, "Titanium: ", self.amounts_of_resources_placed[self.titanium_ID + 1])
	end
	-- MOD.HungryForFood: End
	print("-----------------------------------------------------");
end
------------------------------------------------------------------------------
function AssignStartingPlots:GetMajorStrategicResourceQuantityValues()
	-- This function determines quantity per tile for each strategic resource's major deposit size.
	-- Note: scripts that cannot place Oil in the sea need to increase amounts on land to compensate.
	local uran_amt, horse_amt, oil_amt, iron_amt, coal_amt, alum_amt = 2, 3, 6, 3, 7, 7;
	-- Check the strategic deposit size setting.
	if self.resSize == 1 then -- Small
		uran_amt, horse_amt, oil_amt, iron_amt, coal_amt, alum_amt = 2, 2, 3, 2, 3, 3;
	elseif self.resSize == 3 then -- Large
		uran_amt, horse_amt, oil_amt, iron_amt, coal_amt, alum_amt = 4, 6, 9, 6, 10, 10;
	end
	return uran_amt, horse_amt, oil_amt, iron_amt, coal_amt, alum_amt
end
------------------------------------------------------------------------------
function AssignStartingPlots:GetSmallStrategicResourceQuantityValues()
	-- This function determines quantity per tile for each strategic resource's small deposit size.
	local uran_amt, horse_amt, oil_amt, iron_amt, coal_amt, alum_amt = 1, 2, 2, 2, 2, 3;
	-- Check the strategic deposit size setting.
	if self.resSize == 1 then -- Small
		uran_amt, horse_amt, oil_amt, iron_amt, coal_amt, alum_amt = 1, 1, 1, 1, 1, 2;
	elseif self.resSize == 3 then -- Large
		uran_amt, horse_amt, oil_amt, iron_amt, coal_amt, alum_amt = 2, 2, 2, 2, 2, 3;
	end
	return uran_amt, horse_amt, oil_amt, iron_amt, coal_amt, alum_amt
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceStrategicAndBonusResources()
	print("PlaceStrategicAndBonusResources")
	-- KEY: {Resource ID, Quantity (0 = unquantified), weighting, minimum radius, maximum radius}
	-- KEY: (frequency (1 per n plots in the list), impact list number, plot list, resource data)
	--
	-- The radius creates a zone around the plot that other resources of that
	-- type will avoid if possible. See ProcessResourceList for impact numbers.
	--
	-- Order of placement matters, so changing the order may affect a later dependency.
	
	-- Adjust amounts, if applicable, based on Resource Setting.
	local uran_amt, horse_amt, oil_amt, iron_amt, coal_amt, alum_amt = self:GetMajorStrategicResourceQuantityValues()
	local resources_to_place = {}

	-- Adjust appearance rate per Resource Setting chosen by user.
	local resMultiplier = 1;
	if self.resource_setting == 1 then -- Sparse, so increase the number of tiles per bonus.
		resMultiplier = 1.4;
	elseif self.resource_setting == 3 then -- Abundant, so reduce the number of tiles per bonus.
		resMultiplier = 0.7;
	end
	
	print("self.resource_setting = " .. self.resource_setting)
	
	-- Place Strategic resources.

	do
	print("Map Generation - Placing Strategics");

	--new
	
	resources_to_place = {
		{self.horse_ID, horse_amt, 100, 0, 0}
	};
	self:ProcessResourceList(55, 1, self.grass_flat_no_feature, resources_to_place)
	self:ProcessResourceList(45, 1, self.plains_flat_no_feature, resources_to_place)
	self:ProcessResourceList(45, 1, self.desert_wheat_list, resources_to_place)
	self:ProcessResourceList(75, 1, self.tundra_flat_no_feature, resources_to_place)
	self:ProcessResourceList(55, 1, self.marsh_list, resources_to_place)
	
	resources_to_place = {
		{self.iron_ID, iron_amt, 100, 0, 0}
	};
	self:ProcessResourceList(100, 1, self.hills_open_list, resources_to_place)
	self:ProcessResourceList(170, 1, self.flat_open_no_tundra_no_desert, resources_to_place)
	self:ProcessResourceList(50, 1, self.desert_flat_no_feature, resources_to_place)
	self:ProcessResourceList(70, 1, self.tundra_flat_no_feature, resources_to_place)
	self:ProcessResourceList(25, 1, self.snow_flat_list, resources_to_place)
	self:ProcessResourceList(25, 1, self.hills_snow_list, resources_to_place)
	
	resources_to_place = {
		{self.coal_ID, coal_amt, 100, 0, 0}
	};
	self:ProcessResourceList(130, 1, self.hills_open_list, resources_to_place)
	self:ProcessResourceList(180, 1, self.flat_open_no_tundra_no_desert, resources_to_place)
	self:ProcessResourceList(80, 1, self.desert_flat_no_feature, resources_to_place)
	self:ProcessResourceList(70, 1, self.tundra_flat_no_feature, resources_to_place)
	self:ProcessResourceList(25, 1, self.snow_flat_list, resources_to_place)
	self:ProcessResourceList(25, 1, self.hills_snow_list, resources_to_place)

	resources_to_place = {
		{self.oil_ID, oil_amt, 100,0, 0}
	};
	self:ProcessResourceList(10, 1, self.desert_flat_no_feature, resources_to_place)
	self:ProcessResourceList(250, 1, self.grass_flat_no_feature, resources_to_place)
	self:ProcessResourceList(65, 1, self.tundra_flat_no_feature, resources_to_place)
	self:ProcessResourceList(140, 1, self.flat_open_no_tundra_no_desert, resources_to_place)
	self:ProcessResourceList(18, 1, self.snow_flat_list, resources_to_place)
	self:ProcessResourceList(40, 1, self.marsh_list, resources_to_place)
	self:ProcessResourceList(22, 1, self.jungle_flat_list, resources_to_place)
	
	resources_to_place = {
		{self.aluminum_ID, alum_amt, 100, 1, 3}
	};
	self:ProcessResourceList(120, 1, self.hills_open_list, resources_to_place)
	self:ProcessResourceList(190, 1, self.flat_open_no_tundra_no_desert, resources_to_place)
	self:ProcessResourceList(90, 1, self.desert_flat_no_feature, resources_to_place)
	self:ProcessResourceList(70, 1, self.tundra_flat_no_feature, resources_to_place)
	self:ProcessResourceList(18, 1, self.snow_flat_list, resources_to_place)
	self:ProcessResourceList(18, 1, self.hills_snow_list, resources_to_place)

	
	resources_to_place = {
		{self.uranium_ID, uran_amt, 100, 1, 3}
	};
	self:ProcessResourceList(200, 1, self.hills_jungle_list, resources_to_place)
	self:ProcessResourceList(300, 1, self.hills_open_list, resources_to_place)
	self:ProcessResourceList(85, 1, self.tundra_flat_no_feature, resources_to_place)
	self:ProcessResourceList(100, 1, self.desert_flat_no_feature, resources_to_place)
	self:ProcessResourceList(350, 1, self.flat_open_no_tundra_no_desert, resources_to_place)
	self:ProcessResourceList(18, 1, self.snow_flat_list, resources_to_place)
	self:ProcessResourceList(18, 1, self.hills_snow_list, resources_to_place)
	self:ProcessResourceList(70, 1, self.marsh_list, resources_to_place)
	
	resources_to_place = {
		{self.iron_ID, iron_amt, 35, 0, 0},
		{self.coal_ID, coal_amt, 40, 0, 0},
		{self.uranium_ID, uran_amt, 5, 0, 0},
		{self.aluminum_ID, alum_amt, 20, 0, 0}
	};
	self:ProcessResourceList(120, 1, self.hills_forest_list, resources_to_place)
	self:ProcessResourceList(140, 1, self.flat_forest_no_tundra, resources_to_place)
	self:ProcessResourceList(130, 1, self.tundra_flat_forest, resources_to_place)
	self:ProcessResourceList(50, 1, self.marsh_list, resources_to_place)
	self:ProcessResourceList(110, 1, self.banana_list, resources_to_place)
	
	
	end
	
	self:AddModernMinorStrategicsToCityStates() -- Added spring 2011
	
	self:PlaceSmallQuantitiesOfStrategics(28 * resMultiplier, self.land_list)
	
	self:PlaceOilInTheSea()
	
	-- Check for low or missing Strategic resources
	do
	if self.amounts_of_resources_placed[self.iron_ID + 1] < 8 then
		--print("Map has very low iron, adding another.");
		local resources_to_place = { {self.iron_ID, iron_amt, 100, 0, 0} };
		self:ProcessResourceList(99999, 1, self.hills_list, resources_to_place) -- 99999 means one per that many tiles: a single instance.
	end
	if self.amounts_of_resources_placed[self.iron_ID + 1] < 4 * self.iNumCivs then
		--print("Map has very low iron, adding another.");
		local resources_to_place = { {self.iron_ID, iron_amt, 100, 0, 0} };
		self:ProcessResourceList(99999, 1, self.land_list, resources_to_place)
	end
	if self.amounts_of_resources_placed[self.horse_ID + 1] < 4 * self.iNumCivs then
		--print("Map has very low horse, adding another.");
		local resources_to_place = { {self.horse_ID, horse_amt, 100, 0, 0} };
		self:ProcessResourceList(99999, 1, self.plains_flat_no_feature, resources_to_place)
	end
	if self.amounts_of_resources_placed[self.horse_ID + 1] < 4 * self.iNumCivs then
		--print("Map has very low horse, adding another.");
		local resources_to_place = { {self.horse_ID, horse_amt, 100, 0, 0} };
		self:ProcessResourceList(99999, 1, self.dry_grass_flat_no_feature, resources_to_place)
	end
	if self.amounts_of_resources_placed[self.coal_ID + 1] < 8 then
		--print("Map has very low coal, adding another.");
		local resources_to_place = { {self.coal_ID, coal_amt, 100, 0, 0} };
		self:ProcessResourceList(99999, 1, self.hills_list, resources_to_place)
	end
	if self.amounts_of_resources_placed[self.coal_ID + 1] < 4 * self.iNumCivs then
		--print("Map has very low coal, adding another.");
		local resources_to_place = { {self.coal_ID, coal_amt, 100, 0, 0} };
		self:ProcessResourceList(99999, 1, self.land_list, resources_to_place)
	end
	if self.amounts_of_resources_placed[self.oil_ID + 1] < 4 * self.iNumCivs then
		--print("Map has very low oil, adding another.");
		local resources_to_place = { {self.oil_ID, oil_amt, 100, 0, 0} };
		self:ProcessResourceList(99999, 1, self.land_list, resources_to_place)
	end
	if self.amounts_of_resources_placed[self.aluminum_ID + 1] < 4 * self.iNumCivs then
		--print("Map has very low aluminum, adding another.");
		local resources_to_place = { {self.aluminum_ID, alum_amt, 100, 0, 0} };
		self:ProcessResourceList(99999, 1, self.hills_list, resources_to_place)
	end
	if self.amounts_of_resources_placed[self.uranium_ID + 1] < 2 * self.iNumCivs then
		--print("Map has very low uranium, adding another.");
		local resources_to_place = { {self.uranium_ID, uran_amt, 100, 0, 0} };
		self:ProcessResourceList(99999, 1, self.land_list, resources_to_place)
	end
	end
	
	self:PlaceBonusResources()
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceBonusResources()
	local resMultiplier = 1;
	if self.bonusDensity == 1 then -- Sparse, so increase the number of tiles per bonus.
		resMultiplier = 1.5;
	elseif self.bonusDensity == 3 then -- Abundant, so reduce the number of tiles per bonus.
		resMultiplier = 0.66666667;
	elseif self.bonusDensity == 4 then -- Random
		resMultiplier = self:GetRandomMultiplier(0.5);
	end
	
	-- Place Bonus Resources
	print("Map Generation - Placing Bonuses");
	-- ####Communitu_79a has a completely different PlaceFish mechanic, but that's too map dependent
	self:PlaceFish(8 * resMultiplier, self.coast_list);
	self:PlaceSexyBonusAtCivStarts()
	self:AddExtraBonusesToHillsRegions()
	
	local resources_to_place = {}

	if self:IsEvenMoreResourcesActive() == true then
		resources_to_place = {
		{self.deer_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(12 * resMultiplier, 3, self.extra_deer_list, resources_to_place)
		-- 8
		resources_to_place = {
		{self.deer_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(16 * resMultiplier, 3, self.tundra_flat_no_feature, resources_to_place)
		-- 12
		
		resources_to_place = {
		{self.wheat_ID, 1, 100, 1, 2} };
		self:ProcessResourceList(20 * resMultiplier, 3, self.desert_wheat_list, resources_to_place)
		-- 10
		resources_to_place = {
		{self.wheat_ID, 1, 100, 2, 3} };
		self:ProcessResourceList(44 * resMultiplier, 3, self.plains_flat_no_feature, resources_to_place)
		-- 27
		
		resources_to_place = {
		{self.banana_ID, 1, 100, 0, 1} };
		self:ProcessResourceList(30 * resMultiplier, 3, self.banana_list, resources_to_place)
		-- 14
		
		resources_to_place = {
		{self.banana_ID, 1, 100, 0, 1} };
		self:ProcessResourceList(40 * resMultiplier, 3, self.tropical_marsh_list, resources_to_place)
		-- none
		
		resources_to_place = {
		{self.cow_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(30 * resMultiplier, 3, self.grass_flat_no_feature, resources_to_place)
		-- 18
		
	-- CBP
		resources_to_place = {
		{self.bison_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(24 * resMultiplier, 3, self.flat_open_no_tundra_no_desert, resources_to_place)
	-- END

		resources_to_place = {
		{self.sheep_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(44 * resMultiplier, 3, self.hills_open_list, resources_to_place)
		-- 13

		resources_to_place = {
		{self.stone_ID, 1, 100, 1, 1} };
		self:ProcessResourceList(40 * resMultiplier, 3, self.dry_grass_flat_no_feature, resources_to_place)
		-- 20
		
		resources_to_place = {
		{self.stone_ID, 1, 100, 1, 1} };
		self:ProcessResourceList(40 * resMultiplier, 3, self.dry_plains_flat_no_feature, resources_to_place)
		-- none
		
		resources_to_place = {
		{self.stone_ID, 1, 100, 1, 2} };
		self:ProcessResourceList(30 * resMultiplier, 3, self.tundra_flat_no_feature, resources_to_place)
		-- 15
		
		resources_to_place = {
		{self.stone_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(16 * resMultiplier, 3, self.desert_flat_no_feature, resources_to_place)
		-- 19
		
		resources_to_place = {
		{self.stone_ID, 1, 100, 1, 2} };
		self:ProcessResourceList(36 * resMultiplier, 3, self.hills_open_list, resources_to_place)
		-- none
		
		resources_to_place = {
		{self.stone_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(10 * resMultiplier, 3, self.snow_flat_list, resources_to_place)
		-- none
		
		resources_to_place = {
		{self.deer_ID, 1, 100, 3, 4} };
		self:ProcessResourceList(50 * resMultiplier, 3, self.forest_flat_that_are_not_tundra, resources_to_place)
		self:ProcessResourceList(50 * resMultiplier, 3, self.hills_forest_list, resources_to_place)
		-- 25

	-- Even More Resources for VP start
		resources_to_place = {
		{self.rice_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(24 * resMultiplier, 3, self.fresh_water_grass_flat_no_feature, resources_to_place)

		resources_to_place = {
		{self.maize_ID, 1, 100, 1, 2} };
		self:ProcessResourceList(32 * resMultiplier, 3, self.plains_flat_no_feature, resources_to_place)

		resources_to_place = {
		{self.coconut_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(12 * resMultiplier, 3, self.coconut_list, resources_to_place)

		resources_to_place = {
		{self.hardwood_ID, 1, 100, 1, 2} };
		self:ProcessResourceList(37 * resMultiplier, 3, self.hills_covered_list, resources_to_place)

		resources_to_place = {
		{self.hardwood_ID, 1, 100, 1, 2} };
		self:ProcessResourceList(37 * resMultiplier, 3, self.flat_covered, resources_to_place)

		resources_to_place = {
		{self.hardwood_ID, 1, 100, 1, 2} };
		self:ProcessResourceList(29 * resMultiplier, 3, self.tundra_flat_forest, resources_to_place)

		resources_to_place = {
		{self.lead_ID, 1, 100, 1, 3} };
		self:ProcessResourceList(40 * resMultiplier, 3, self.dry_grass_flat_no_feature, resources_to_place)

		resources_to_place = {
		{self.lead_ID, 1, 100, 2, 3} };
		self:ProcessResourceList(35 * resMultiplier, 3, self.hills_open_list, resources_to_place)

		resources_to_place = {
		{self.lead_ID, 1, 100, 1, 2} };
		self:ProcessResourceList(35 * resMultiplier, 3, self.desert_flat_no_feature, resources_to_place)

		resources_to_place = {
		{self.pineapple_ID, 1, 100, 0, 3} };
		self:ProcessResourceList(29 * resMultiplier, 3, self.banana_list, resources_to_place)

		resources_to_place = {
		{self.potato_ID, 1, 100, 2, 3} };
		self:ProcessResourceList(40 * resMultiplier, 3, self.flat_open_no_tundra_no_desert, resources_to_place)

		resources_to_place = {
		{self.potato_ID, 1, 100, 0, 3} };
		self:ProcessResourceList(29 * resMultiplier, 3, self.hills_open_no_tundra_no_desert, resources_to_place)

		resources_to_place = {
		{self.rubber_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(43 * resMultiplier, 3, self.banana_list, resources_to_place)

		resources_to_place = {
		{self.sulfur_ID, 1, 100, 1, 3} };
		self:ProcessResourceList(29 * resMultiplier, 3, self.hills_open_list, resources_to_place)

		resources_to_place = {
		{self.sulfur_ID, 1, 100, 1, 3} };
		self:ProcessResourceList(37 * resMultiplier, 3, self.hills_covered_list, resources_to_place)

		resources_to_place = {
		{self.sulfur_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(21 * resMultiplier, 3, self.snow_flat_list, resources_to_place)

		resources_to_place = {
		{self.sulfur_ID, 1, 100, 1, 3} };
		self:ProcessResourceList(43 * resMultiplier, 3, self.flat_open, resources_to_place)

		resources_to_place = {
		{self.titanium_ID, 1, 100,0, 2} };
		self:ProcessResourceList(56 * resMultiplier, 3, self.flat_open, resources_to_place)

		resources_to_place = {
		{self.titanium_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(51 * resMultiplier, 3, self.hills_open_list, resources_to_place)

		resources_to_place = {
		{self.titanium_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(48 * resMultiplier, 3, self.desert_flat_no_feature, resources_to_place)

		resources_to_place = {
		{self.titanium_ID, 1, 100, 0, 2} };
		self:ProcessResourceList(40 * resMultiplier, 3, self.tundra_flat_including_forests, resources_to_place)

		resources_to_place = {
		{self.titanium_ID, 1, 100, 0, 1} };
		self:ProcessResourceList(24 * resMultiplier, 3, self.snow_flat_list, resources_to_place)
	-- Even More Resources for VP end
	else
		resources_to_place = {
			{self.deer_ID, 1, 100, 0, 0} };
			self:ProcessResourceList(24 * resMultiplier, 3, self.extra_deer_list, resources_to_place)
			self:ProcessResourceList(20 * resMultiplier, 3, self.tundra_flat_including_forests, resources_to_place)
			self:ProcessResourceList(24 * resMultiplier, 3, self.forest_flat_that_are_not_tundra, resources_to_place)
			self:ProcessResourceList(26 * resMultiplier, 3, self.hills_forest_list, resources_to_place)
			self:ProcessResourceList(22 * resMultiplier, 3, self.snow_flat_list, resources_to_place)
			
			resources_to_place = {
			{self.wheat_ID, 1, 100, 0, 0} };
			self:ProcessResourceList(8 * resMultiplier, 3, self.desert_wheat_list, resources_to_place)
			self:ProcessResourceList(34 * resMultiplier, 3, self.plains_flat_no_feature, resources_to_place)
			self:ProcessResourceList(21 * resMultiplier, 3, self.fresh_water_plains_flat_no_feature, resources_to_place)
			
			resources_to_place = {
			{self.banana_ID, 1, 100, 0, 0} };
			self:ProcessResourceList(10 * resMultiplier, 3, self.banana_list, resources_to_place)
		
			
			resources_to_place = {
			{self.cow_ID, 1, 100, 0, 0} };
			self:ProcessResourceList(32 * resMultiplier, 3, self.grass_flat_no_feature, resources_to_place)
			self:ProcessResourceList(22 * resMultiplier, 3, self.dry_grass_flat_no_feature, resources_to_place)
			self:ProcessResourceList(22 * resMultiplier, 3, self.marsh_list, resources_to_place)
		
			
		-- CBP
			resources_to_place = {
			{self.bison_ID, 1, 100, 0, 0} };
			self:ProcessResourceList(33 * resMultiplier, 3, self.plains_flat_no_feature, resources_to_place)
			self:ProcessResourceList(22 * resMultiplier, 3, self.dry_plains_flat_no_feature, resources_to_place)
			self:ProcessResourceList(23 * resMultiplier, 3, self.tundra_flat_no_feature, resources_to_place)
			self:ProcessResourceList(22 * resMultiplier, 3, self.snow_flat_list, resources_to_place)
		-- END
		
			resources_to_place = {
			{self.sheep_ID, 1, 100, 0, 0} };
			self:ProcessResourceList(19 * resMultiplier, 3, self.hills_open_list, resources_to_place)
			self:ProcessResourceList(26 * resMultiplier, 3, self.hills_open_no_grass_no_plains, resources_to_place)
			-- 13
		
			resources_to_place = {
			{self.stone_ID, 1, 100, 0, 0} };
			self:ProcessResourceList(24 * resMultiplier, 3,self.dry_grass_flat_no_feature, resources_to_place)
			self:ProcessResourceList(30 * resMultiplier, 3, self.tundra_flat_no_feature, resources_to_place)
			self:ProcessResourceList(8 * resMultiplier, 3, self.desert_flat_no_feature, resources_to_place)
			self:ProcessResourceList(21 * resMultiplier, 3, self.snow_flat_list, resources_to_place)
			self:ProcessResourceList(47 * resMultiplier, 3, self.marble_list, resources_to_place)
			self:ProcessResourceList(21 * resMultiplier, 3, self.hills_snow_list, resources_to_place)
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:PlaceResourcesAndCityStates()
	-- This function controls nearly all resource placement. Only resources
	-- placed during Normalization operations are handled elsewhere.
	--
	-- Luxury resources are placed in relationship to Regions, adapting to the
	-- details of the given map instance, including number of civs and city 
	-- states present. At Jon's direction, Luxuries have been implemented to
	-- be diplomatic widgets for trading, in addition to sources of Happiness.
	--
	-- Strategic and Bonus resources are terrain-adjusted. They will customize
	-- to each map instance. Each terrain type has been measured and has certain 
	-- resource types assigned to it. You can customize resource placement to 
	-- any degree desired by controlling generation of plot groups to feed in
	-- to the process. The default plot groups are terrain-based, but any
	-- criteria you desire could be used to determine plot group membership.
	-- 
	-- If any default methods fail to meet a specific need, don't hesitate to 
	-- replace them with custom methods. I have labored to make this new 
	-- system as accessible and powerful as any ever before offered.

	print("Map Generation - Assigning Luxury Resource Distribution");
	self:AssignLuxuryRoles()

	print("Map Generation - Placing City States");
	self:PlaceCityStates()

	-- Generate global plot lists for resource distribution.
	self:GenerateGlobalResourcePlotLists()
	
	print("Map Generation - Placing Luxuries");
	self:PlaceLuxuries()

	-- Place Strategic and Bonus resources.
	self:PlaceStrategicAndBonusResources()

	print("Map Generation - Normalize City State Locations");
	self:NormalizeCityStateLocations()
	
	print("Map Generation - Fix Tile Graphics");
	self:AdjustTiles()
	
	-- Necessary to implement placement of Natural Wonders, and possibly other plot-type changes.
	-- This operation must be saved for last, as it invalidates all regional data by resetting Area IDs.
	Map.RecalculateAreas();

	-- Activate for debug only
	self:PrintFinalResourceTotalsToLog()
	--
	print("End PlaceResourcesAndCityStates");
end
------------------------------------------------------------------------------
-- HELPER FUNCTIONS
------------------------------------------------------------------------------
-- Check if Even More Resources for Vox Populi is activated
function AssignStartingPlots:IsEvenMoreResourcesActive()
	local communityPatchModID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	local evenMoreResourcesModID = "8e54eb87-31e8-4fcd-aafe-ede055b463d0"
	local isUsingCommunityPatch = false
	local isUsingEvenMoreResources = false

	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == communityPatchModID) then -- if Community Patch is not activated, then we are running in modpack mode
			isUsingCommunityPatch = true
		elseif (mod.ID == evenMoreResourcesModID) then
			isUsingEvenMoreResources = true
			break
		end
	end

	if isUsingCommunityPatch == false then -- fallback method for modpack mode
		for row in DB.Query("SELECT * FROM Resources WHERE Type = 'RESOURCE_BEER'") do
			isUsingEvenMoreResources = true
		end
	end
	return isUsingEvenMoreResources
end

----------------------------------------------------------------
function AssignStartingPlots:Plot_GetPlotsInCircle(plot, minR, maxR)
	if not plot then
		print("plot:GetPlotsInCircle plot=nil")
		return
	end
	if not maxR then
		maxR = minR
		minR = 1
	end
	
	local mapW, mapH	= Map.GetGridSize()
	local isWrapX		= Map:IsWrapX()
	local isWrapY		= Map:IsWrapY()
	local centerX		= plot:GetX()
	local centerY		= plot:GetY()
	
	leftX	= isWrapX and ((centerX-maxR) % mapW) or self:Constrain(0, centerX-maxR, mapW-1)
	rightX	= isWrapX and ((centerX+maxR) % mapW) or self:Constrain(0, centerX+maxR, mapW-1)
	bottomY	= isWrapY and ((centerY-maxR) % mapH) or self:Constrain(0, centerY-maxR, mapH-1)
	topY	= isWrapY and ((centerY+maxR) % mapH) or self:Constrain(0, centerY+maxR, mapH-1)
	
	local nearX	= leftX
	local nearY	= bottomY
	local stepX	= 0
	local stepY	= 0
	local rectW	= rightX-leftX 
	local rectH	= topY-bottomY
	
	if rectW < 0 then
		rectW = rectW + mapW
	end
	
	if rectH < 0 then
		rectH = rectH + mapH
	end
	
	local nextPlot = Map.GetPlot(nearX, nearY)
	
	return function ()
		while (stepY < 1 + rectH) and nextPlot do
			while (stepX < 1 + rectW) and nextPlot do
				local plot		= nextPlot
				local distance	= Map.PlotDistance(nearX, nearY, centerX, centerY)
				
				nearX		= (nearX + 1) % mapW
				stepX		= stepX + 1
				nextPlot	= Map.GetPlot(nearX, nearY)
				
				if self:IsBetween(minR, distance, maxR) then
					return plot, distance
				end
			end
			nearX		= leftX
			nearY		= (nearY + 1) % mapH
			stepX		= 0
			stepY		= stepY + 1
			nextPlot	= Map.GetPlot(nearX, nearY)
		end
	end
end
------------------------------------------------------
function AssignStartingPlots:Plot_GetFertilityInRange(plot, range, yieldID)
	local value = 0
	for nearPlot, distance in self:Plot_GetPlotsInCircle(plot, range) do
		value = value + self:Plot_GetFertility(nearPlot, yieldID) / math.max(1, distance)
	end
	return value
end
------------------------------------------------------
function AssignStartingPlots:Plot_GetFertility(plot, yieldID, ignoreStrategics)
	if plot:IsImpassable() or plot:GetTerrainType() == TerrainTypes.TERRAIN_OCEAN then
		return 0
	end
	
	local value = 0
	local featureID = plot:GetFeatureType()
	local terrainID = plot:GetTerrainType()
	local resID = plot:GetResourceType(-1)
	
	if yieldID then
		value = value + plot:CalculateYield(yieldID, true)
	else
		-- Science, Culture and Faith are worth more than the others at start
		value = value + plot:CalculateYield(YieldTypes.YIELD_FOOD, true)
		value = value + plot:CalculateYield(YieldTypes.YIELD_PRODUCTION, true)
		value = value + plot:CalculateYield(YieldTypes.YIELD_GOLD, true)
		value = value + 2 * plot:CalculateYield(YieldTypes.YIELD_SCIENCE, true)
		value = value + 2 * plot:CalculateYield(YieldTypes.YIELD_CULTURE, true)
		value = value + 2 * plot:CalculateYield(YieldTypes.YIELD_FAITH, true)
	end
	
	if plot:IsFreshWater() and plot:GetPlotType() ~= PlotTypes.PLOT_HILLS then
		-- Fresh water farm possibility
		value = value + 0.25
	end
	
	if plot:IsLake() then
		-- can't improve lakes
		value = value - 0.5
	end
	
	if featureID == FeatureTypes.FEATURE_JUNGLE then
		-- jungles aren't as good as the yields imply
		value = value - 0.5
	end
	
	if resID == -1 then
		if featureID == -1 and terrainID == TerrainTypes.TERRAIN_COAST then
			-- can't improve coast tiles until lighthouse
			-- lower value generates more fish
			value = value - 1
		end
	else
		local resInfo = GameInfo.Resources[resID]
		value = value + 2 * resInfo.Happiness
		if resInfo.ResourceClassType == "RESOURCECLASS_RUSH" and not ignoreStrategics then
			-- Iron and Horses
			value = value + math.ceil(3 * math.sqrt(plot:GetNumResource()))
		elseif resInfo.ResourceClassType == "RESOURCECLASS_BONUS" then
			value = value + 2
		end
	end
	
	return value
end
------------------------------------------------------
function AssignStartingPlots:IsBetween(lower, mid, upper)
	return ((lower <= mid) and (mid <= upper))
end
------------------------------------------------------
function AssignStartingPlots:Constrain(lower, mid, upper)
	return math.max(lower, math.min(mid, upper))
end
------------------------------------------------------
-- Get random multiplier normalized to 1
-- rand: optional random value
-- higher: optional boolean, determines >1 or <1
function AssignStartingPlots:GetRandomMultiplier(variance, rand, higher)
	if higher == nil then
		higher = (1 == Map.Rand(2, "GetRandomMultiplier"))
	end
	
	local multiplier = 1
	if rand == nil then
		multiplier = 1 + Map.Rand(10000, "GetRandomMultiplier") / 10000 * variance
	else
		multiplier = 1 + rand * variance
	end
	
	if higher then
		return multiplier
	else
		return 1 / multiplier
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------
end
------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------END OF ASSIGNSTARTINGPLOTS FUNCTIONS---------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	return mglobal
end

function GetMapScriptInfo()
	local world_age, temperature, rainfall, sea_level, resources = GetCoreMapOptions()
	return {
		Name = "Milae Pangea v6",
		Description = "Milae's map with Pangea style and nearby neighbours",
		IsAdvancedMap = 0,
		SupportsMultiplayer = true,
		IconIndex = 5,
		SortIndex = -999,
		CustomOptions = {
			world_age,
			temperature,
			rainfall, 
			sea_level,
			resources,
			{
                Name = "Players Start",
                Values = 	{
                    "Continents - Everywhere",
                    "Terra - Largest Continent"
                		},
                DefaultValue = 1,
                SortPriority = 1,
            		},
			{
                Name = "Ocean Rifts",
                Values = 	{
                    "Pacific and Atlantic",
                    "2 Atlantic",
                    "2 Pacific",
                    "2 Random",
                    "1 Random",
                    "None",
		    "Random"
                		},
                DefaultValue = 6,
                SortPriority = 2,
            		},
			{
                Name = "Rift Width",
                Values = 	{
                    "Narrow",
                    "Normal",
                    "Wide",
		    "Random"
               			 },
                DefaultValue = 2,
                SortPriority = 3,
            		},
			{
		Name 		= "Override AssignStartingPlots",
		Description 	= "Affects Resources and start locations. Change this to NO if mapscript doesn't run. NO = Game default, YES = My changes",
		Values = 	{
			"No",
			"Yes"
				},
		DefaultValue = 1,
		SortPriority = 4,
			},
		},
	}
end

function GetMapInitData(worldSize)
	print("GetMapInitData")
	local worldsizes = {
		[GameInfo.Worlds.WORLDSIZE_DUEL.ID] = {33, 22},
		[GameInfo.Worlds.WORLDSIZE_TINY.ID] = {42, 28},
		[GameInfo.Worlds.WORLDSIZE_SMALL.ID] = {51, 34},
		[GameInfo.Worlds.WORLDSIZE_STANDARD.ID] = {60, 40},
		[GameInfo.Worlds.WORLDSIZE_LARGE.ID] = {72, 48},
		[GameInfo.Worlds.WORLDSIZE_HUGE.ID] = {81, 54}
		}
		
	if Map.GetCustomOption(6) == 2 then
		-- Enlarge terra-style maps 30% to create expansion room on the new world
		worldsizes = {
		[GameInfo.Worlds.WORLDSIZE_DUEL.ID] = {44, 31},
		[GameInfo.Worlds.WORLDSIZE_TINY.ID] = {64, 43},
		[GameInfo.Worlds.WORLDSIZE_SMALL.ID] = {78, 52},
		[GameInfo.Worlds.WORLDSIZE_STANDARD.ID] = {90, 60},
		[GameInfo.Worlds.WORLDSIZE_LARGE.ID] = {99, 66},
		[GameInfo.Worlds.WORLDSIZE_HUGE.ID] = {109, 74}
		}
	end
	--
	local grid_size = worldsizes[worldSize]
	
	
	--
	local world = GameInfo.Worlds[worldSize]
	if(world ~= nil) then
	return {
		Width = grid_size[1],
		Height = grid_size[2],
		WrapX = true,
	}
     end
end

function DetermineContinents()
	print("Determining continents for art purposes (CommunitasMap)")
	-- Each plot has a continent art type.
	-- Command for setting the art type for a plot is: <plot object>:SetContinentArtType(<art_set_number>)
	
	-- CONTINENTAL ART SETS - in order from hot to cold
	-- 0) Ocean
	-- 3) Africa
	-- 2) Asia
	-- 1) America
	-- 4) Europe
	
	contArt = {}
	contArt.OCEAN	= 0
	contArt.AFRICA	= 3
	contArt.ASIA	= 2
	contArt.AMERICA	= 1
	contArt.EUROPE	= 4
	
	local mapW, mapH = Map.GetGridSize()

	--[[
 	for i, plot in Plots() do
 		if plot:IsWater() then
 			plot:SetContinentArtType(contArt.OCEAN)
 		else
 			plot:SetContinentArtType(contArt.AFRICA)
 		end
 	end
	--]]
	
	local continentMap = PWAreaMap:New(elevationMap.width,elevationMap.height,elevationMap.wrapX,elevationMap.wrapY)
	continentMap:DefineAreas(oceanMatch)
	table.sort(continentMap.areaList,function (a,b) return a.size > b.size end)

	--check for jungle
	for y=0, elevationMap.height - 1 do
		for x=0,elevationMap.width - 1 do
			local i = elevationMap:GetIndex(x,y)
			local area = continentMap:GetAreaByID(continentMap.data[i])
			area.hasJungle = false
		end
	end
	for y=0, elevationMap.height - 1 do
		for x=0, elevationMap.width - 1 do
			local plot = Map.GetPlot(x,y)
			if plot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE then
				local i = elevationMap:GetIndex(x,y)
				local area = continentMap:GetAreaByID(continentMap.data[i])
				area.hasJungle = true
			end
		end
	end
	for n=1, #continentMap.areaList do
--		if not continentMap.areaList[n].trueMatch and not continentMap.areaList[n].hasJungle then
		if not continentMap.areaList[n].trueMatch then
			continentMap.areaList[n].artStyle = 1 + Map.Rand(2, "Continent Art Styles - Lua") -- left out America's orange trees
		end
	end 
	for y=0, elevationMap.height - 1 do
		for x=0, elevationMap.width - 1 do
			local plot = Map.GetPlot(x,y)
			local i = elevationMap:GetIndex(x,y)
			local artStyle = continentMap:GetAreaByID(continentMap.data[i]).artStyle
			if plot:IsWater() then
				plot:SetContinentArtType(contArt.OCEAN)
			elseif jungleMatch(x,y) then
				plot:SetContinentArtType(contArt.ASIA)
			else
				plot:SetContinentArtType(contArt.AFRICA)
			end
		end
	end
	
	--Africa has the best looking deserts, so for the biggest
	--desert use Africa. America has a nice dirty looking desert also, so
	--that should be the second biggest desert.
	local desertMap = PWAreaMap:New(elevationMap.width,elevationMap.height,elevationMap.wrapX,elevationMap.wrapY)
	desertMap:DefineAreas(desertMatch)
	table.sort(desertMap.areaList,function (a,b) return a.size > b.size end)
	local largestDesertID = nil
	local secondLargestDesertID = nil
	for n=1,#desertMap.areaList do
		--if debugTime then print(string.format("area[%d] size = %d",n,desertMap.areaList[n].size)) end
		if desertMap.areaList[n].trueMatch then
			if largestDesertID == nil then
				largestDesertID = desertMap.areaList[n].id
			else
				secondLargestDesertID = desertMap.areaList[n].id
				break
			end
		end
	end
	for y=0,elevationMap.height - 1 do
		for x=0,elevationMap.width - 1 do
			local plot = Map.GetPlot(x,y)
			local i = elevationMap:GetIndex(x,y)
			if desertMap.data[i] == largestDesertID then
				plot:SetContinentArtType(contArt.AFRICA)
			elseif desertMap.data[i] == secondLargestDesertID then
				plot:SetContinentArtType(contArt.AMERICA)
			elseif plot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT then
				plot:SetContinentArtType(contArt.ASIA)
			end
		end
	end
	
	-- Set tundra/mountains -> snowy when near to snow tiles
	for y = 0, mapH-1 do
		for x = 0, mapW-1 do
			local plot = Map.GetPlot(x,y)
			local plotTerrainID = plot:GetTerrainType()
			if IsMountain(plot) then
				local coldness = 0
				local zone = elevationMap:GetZone(y)
				
				if (zone == mg.NPOLAR or zone == mg.SPOLAR) then
					coldness = coldness + 2
				elseif (zone == mg.NTEMPERATE or zone == mg.STEMPERATE) then
					coldness = coldness + 1
				else
					coldness = coldness - 1
				end
				
				for nearPlot in Plot_GetPlotsInCircle(plot, 1, 1) do
					local nearTerrainID = nearPlot:GetTerrainType()
					local nearFeatureID = nearPlot:GetFeatureType()
					if IsMountain(nearPlot) then
						coldness = coldness + 0.5
					elseif nearTerrainID == TerrainTypes.TERRAIN_SNOW then
						coldness = coldness + 2
					elseif nearTerrainID == TerrainTypes.TERRAIN_TUNDRA then
						coldness = coldness + 1
					elseif nearTerrainID == TerrainTypes.TERRAIN_DESERT then
						coldness = coldness - 1
					elseif nearFeatureID == FeatureTypes.FEATURE_JUNGLE or nearFeatureID == FeatureTypes.FEATURE_MARSH then
						coldness = coldness - 8
					end
				end
				
				for nearPlot in Plot_GetPlotsInCircle(plot, 2, 2) do
					if IsMountain(nearPlot) then
						coldness = coldness + 0.25
					end
				end
				
				-- Avoid snow near tropical jungle
				if coldness >= 1 then
					for nearPlot in Plot_GetPlotsInCircle(plot, 2, 3) do
						local nearFeatureID = nearPlot:GetFeatureType()
						if nearFeatureID == FeatureTypes.FEATURE_JUNGLE or nearFeatureID == FeatureTypes.FEATURE_MARSH then
							coldness = coldness - 8 / math.max(1, Map.PlotDistance(x, y, nearPlot:GetX(), nearPlot:GetY()))
						end
					end
				end
				
				if coldness >= 6 then
					--plot:SetTerrainType(TerrainTypes.TERRAIN_SNOW, false, true)
					plot:SetContinentArtType(contArt.EUROPE)
				elseif coldness >= 4 then
					--plot:SetTerrainType(TerrainTypes.TERRAIN_TUNDRA, false, true)
					plot:SetContinentArtType(contArt.AMERICA)
				elseif coldness >= 2 then
					--plot:SetTerrainType(TerrainTypes.TERRAIN_PLAINS, false, true)
					plot:SetContinentArtType(contArt.ASIA)
				else
					--plot:SetTerrainType(TerrainTypes.TERRAIN_PLAINS, false, true)
					plot:SetContinentArtType(contArt.AFRICA)
				end
				

			elseif plotTerrainID == TerrainTypes.TERRAIN_TUNDRA then
				local coldness = 0
				for nearPlot in Plot_GetPlotsInCircle(plot, 1, 1) do
					local nearTerrainID = nearPlot:GetTerrainType()
					local nearFeatureID = nearPlot:GetFeatureType()
					if nearTerrainID == TerrainTypes.TERRAIN_SNOW then
						coldness = coldness + 5
					elseif nearTerrainID == TerrainTypes.TERRAIN_TUNDRA then
						coldness = coldness + 1
					elseif nearTerrainID == TerrainTypes.TERRAIN_DESERT or nearFeatureID == FeatureTypes.FEATURE_JUNGLE or nearFeatureID == FeatureTypes.FEATURE_MARSH then
						coldness = coldness - 2
					end
				end
				for nearPlot in Plot_GetPlotsInCircle(plot, 2, 2) do
					if nearTerrainID == TerrainTypes.TERRAIN_DESERT or nearFeatureID == FeatureTypes.FEATURE_JUNGLE or nearFeatureID == FeatureTypes.FEATURE_MARSH then
						coldness = coldness - 1
					end
				end
				if coldness >= 6 then
					if plot:GetFeatureType() == FeatureTypes.FEATURE_FOREST then
						plot:SetContinentArtType(contArt.ASIA)
					else
						plot:SetContinentArtType(contArt.EUROPE)
					end
				else
					plot:SetContinentArtType(contArt.AFRICA)
				end
			elseif plotTerrainID == TerrainTypes.TERRAIN_SNOW then
				plot:SetContinentArtType(contArt.EUROPE)
			end
		end
	end
end

function inheritsFrom( baseClass )
	--inheritance mechanism from http://www.gamedev.net/community/forums/topic.asp?topic_id=561909

    local new_class = {}
    local class_mt = { __index = new_class }

    function new_class:create()
        local newinst = {}
        setmetatable( newinst, class_mt )
        return newinst
    end

    if nil ~= baseClass then
        setmetatable( new_class, { __index = baseClass } )
    end

    -- Implementation of additional OO properties starts here --

    -- Return the class object of the instance
    function new_class:class()
        return new_class
    end

	-- Return the super class object of the instance, optional base class of the given class (must be part of hiearchy)
    function new_class:baseClass(class)
		return new_class:_B(class)
    end

    -- Return the super class object of the instance, optional base class of the given class (must be part of hiearchy)
    function new_class:_B(class)
		if (class==nil) or (new_class==class) then
			return baseClass
		elseif(baseClass~=nil) then
			return baseClass:_B(class)
		end
		return nil
    end

	-- Return true if the caller is an instance of theClass
    function new_class:_ISA( theClass )
        local b_isa = false

        local cur_class = new_class

        while ( nil ~= cur_class ) and ( false == b_isa ) do
            if cur_class == theClass then
                b_isa = true
            else
                cur_class = cur_class:baseClass()
            end
        end

        return b_isa
    end

    return new_class
end

function Logger(self)
	local logger = {}
	setmetatable(logger, self)
	self.__index = self

	logger.level = LEVEL.INFO

	logger.SetLevel = function (self, level)
		self.level = level
	end

	logger.Message = function (self, level, ...)
		local arg = {...}
		if LEVEL[level] < LEVEL[self.level] then
			return false
		end
		if type(arg[1]) == "string" then
			local _, numCommands = string.gsub(arg[1], "[%%]", "")
			for i = 2, numCommands+1 do
				if type(arg[i]) ~= "number" and type(arg[i]) ~= "string" then
					arg[i] = tostring(arg[i])
				end
			end
		else
			arg[1] = tostring(arg[1])
		end
		local message = string.format(unpack(arg))
		if level == LOG_FATAL then
			message = string.format("Turn %-3s %s", Game.GetGameTurn(), message)
			print(level .. string.rep(" ", 7-level:len()) .. message)
			if debug then print(debug.traceback()) end
		else
			if level >= LOG_INFO then
				message = string.format("Turn %-3s %s", Game.GetGameTurn(), message)
			end
			print(level .. string.rep(" ", 7-level:len()) .. message)
		end
		return true
	end

	if debugWithLogger then
		logger.Trace = function (logger, ...) return logger:Message(LOG_TRACE, unpack{...}) end
		logger.Debug = function (logger, ...) return logger:Message(LOG_DEBUG, unpack{...}) end
		logger.Info  = function (logger, ...) return logger:Message(LOG_INFO,  unpack{...}) end
		logger.Warn  = function (logger, ...) return logger:Message(LOG_WARN,  unpack{...}) end
		logger.Error = function (logger, ...) return logger:Message(LOG_ERROR, unpack{...}) end
		logger.Fatal = function (logger, ...) return logger:Message(LOG_FATAL, unpack{...}) end
	else
		logger.Trace = function () end
		logger.Debug = function () end
		logger.Info  = function () end
		logger.Warn  = function () end
		logger.Error = function () end
		logger.Fatal = function () end
	end
	return logger
end

LOG_TRACE	= "TRACE"
LOG_DEBUG	= "DEBUG"
LOG_INFO	= "INFO"
LOG_WARN	= "WARN"
LOG_ERROR	= "ERROR"
LOG_FATAL	= "FATAL"

LEVEL = {
	[LOG_TRACE] = 1,
	[LOG_DEBUG] = 2,
	[LOG_INFO]  = 3,
	[LOG_WARN]  = 4,
	[LOG_ERROR] = 5,
	[LOG_FATAL] = 6,
}

LuaLogger = {}
LuaLogger.New = Logger

log = LuaLogger:New()
log:SetLevel("INFO")











--
-- Generate Plots
--

function StartPlotSystem()
	-- Get Resources setting input by user.
	local res = Map.GetCustomOption(5) or 2
	if res == 6 then
		res = 1 + Map.Rand(3, "Random Resources Option - Lua")
	end

	local oStarts = Map.GetCustomOption(6)
	local divMethod = nil
	if oStarts == 1 then
		-- Continents
		divMethod = 2
	else
		--Terra
		divMethod = 1
	end

	print("Creating start plot database.")
	local start_plot_database = AssignStartingPlots.Create()

	print("Dividing the map in to Regions.")
	-- Regional Division Method 2: Continental or 1:Terra
	local args = {
		method = divMethod,
		resources = res,
		}
	start_plot_database:GenerateRegions(args)

	print("Choosing start locations for civilizations.")
	start_plot_database:ChooseLocations()

	print("Normalizing start locations and assigning them to Players.")
	start_plot_database:BalanceAndAssign()

	--error(":P")
	print("Placing Natural Wonders.")
	start_plot_database:PlaceNaturalWonders()

	print("Placing Resources and City States.")
	start_plot_database:PlaceResourcesAndCityStates()
end

function GeneratePlotTypes()
	print("Creating initial map data - CommunitasMap")
	--[[
	local plot = Map.GetPlot(5, 5)
	for nearPlot, distance in Plot_GetPlotsInCircle(plot, 0, 1) do
		print(string.format(
			"plot %s distance=%s",
			Plot_GetID(nearPlot),
			distance
		))
	end
	--]]
	
	local timeStart = debugTime and os.clock() or 0
	local mapW, mapH = Map.GetGridSize()
	
	--first do all the preliminary calculations in this function
	if debugTime then print(string.format("map size: width=%d, height=%d",mapW,mapH)) end
	mg = MapGlobals:New()
	PWRandSeed()

	-- Elevations
	
	elevationMap = GenerateElevationMap(mapW,mapH,true,false)  -- generate height map for each plot
	
	--elevationMap:Save("elevationMap.csv")

	-- Plots
	print("Generating plot types - CommunitasMap")
	ShiftMaps()						-- shift the map so that the edge lines up with where ocean will liely be
	DiffMap = GenerateDiffMap(mapW,mapH,true,false)		-- map for determining height difference to surrounding plots (for hills and mountains)
	CreateArcticOceans()					-- create oceans at top and bottom
	CreateVerticalOceans()					-- create artificial oceans as desired from options (placed at longitudes with lowest height)
	ConnectSeasToOceans()					-- any inland sea over size 10 (max lake size) will be connected to the rest of the oceans.
	FillInLakes()						-- inland seas under size 10 are lakes
	elevationMap = SetOceanRiftElevations(elevationMap)	-- set created oceans as belowSeaLevel
	ConnectTerraContinents()				-- additional continent if Terra option selected
	
	-- Rainfall
	rainfallMap, temperatureMap = GenerateRainfallMap(elevationMap)	-- Rainfall and Temperature maps created
	--rainfallMap:Save("rainfallMap.csv")
	
	-- Rivers
	riverMap = RiverMap:New(elevationMap)
	riverMap:SetJunctionAltitudes()
	riverMap:SiltifyLakes()
	riverMap:SetFlowDestinations()
	riverMap:SetRiverSizes(rainfallMap)

	--find exact thresholds
	
	local hillsThreshold = DiffMap:FindThresholdFromPercent(mg.flatPercent,false,true)
	local mountainsThreshold = DiffMap:FindThresholdFromPercent(mg.belowMountainPercent,false,true)
	local i = 0
	for y = 0, mapH - 1,1 do
		for x = 0,mapW - 1,1 do
			local plot = Map.GetPlot(x,y)
			if elevationMap:IsBelowSeaLevel(x,y) then
				plot:SetPlotType(PlotTypes.PLOT_OCEAN, false, false)		-- fill in all BelowSeaLevel as oceans
			elseif DiffMap.data[i] < hillsThreshold then
				plot:SetPlotType(PlotTypes.PLOT_LAND,false,false)		-- create land
			--This code makes the game only ever plot flat land if it's within two tiles of 
			--the seam. This prevents issues with tiles that don't look like what they are.
			elseif x == 0 or x == 1 or x == mapW - 1 or x == mapW -2 then
				plot:SetPlotType(PlotTypes.PLOT_LAND,false,false)
			-- Bobert13
			elseif DiffMap.data[i] < mountainsThreshold then			-- create hills
				plot:SetPlotType(PlotTypes.PLOT_HILLS,false,false)
			else
				plot:SetPlotType(PlotTypes.PLOT_MOUNTAIN,false,false)		-- and mountains
			end
			i=i+1
		end
	end
	Map.RecalculateAreas()			-- Sets areas which are used in other functions
	GenerateIslands(rainfallMap)		-- Generate additional islands for map (currently these are set to at least > plainsPercent rain as rainfall map already done)
	GenerateCoasts()			-- Set ocean tiles to coast if they are elegible
	SetOceanRiftPlots()			-- make sure ocean rift coast tiles are set correctly
end

function ConnectSeasToOceans()
	local areaMap = PWAreaMap:New(elevationMap.width,elevationMap.height,elevationMap.wrapX,elevationMap.wrapY)
	areaMap:DefineAreas(waterMatch)
	local oceanArea, oceanSize = GetLargestArea(areaMap)
	
	if not oceanArea then
		print("ConnectSeasToOceans: No ocean!")
		return
	end
	
	local plotFunc = function(plot)
		return not Plot_IsWater(plot, true)
	end
	
	log:Info("ConnectSeasToOceans: oceanSize = %s", oceanSize)
	local newWater = {}
	for areaID=1, #areaMap.areaList do
		local seaArea = areaMap.areaList[areaID]
		if seaArea.trueMatch and seaArea.size < oceanSize then
			local pathPlots, distance, airDistance = GetPathBetweenAreas(areaMap, seaArea, oceanArea, true, plotFunc)
			if seaArea.size >= mg.lakeSize then--or seaArea.size >= 2 * distance then
				log:Info("ConnectSeasToOceans: Connect seaArea.size = %-3s distance = %-3s airDistance = %-3s", seaArea.size, distance, airDistance)
				--log:Info("                     Connect")
				for _, plot in pairs(pathPlots) do
					local plotID = Plot_GetID(plot)
					newWater[Plot_GetID(plot)] = elevationMap.seaLevelThreshold - 0.01
					if seaArea.size <= 2 * mg.lakeSize then
						table.insert(mg.seaPlots, plot)
					end
					--plot:SetFeatureType(FeatureTypes.FEATURE_ICE, -1)
				end
			end
		end
	end
	local randPercent
	for plotID, elevation in pairs(newWater) do
		randPercent = Map.Rand(100, "Communitas random connection chance - Lua")
		if randPercent >= 65 then
			elevationMap.data[plotID] = elevation
		end
	end
end

function ConnectTerraContinents()
	if Map.GetCustomOption(6) == 1 then
		-- Continents-style formation
		return
	end	
	
	log:Info("ConnectTerraContinents")
	
	local oceanX1		= mg.oceanRiftMidlines[1]
	local oceanX2		= mg.oceanRiftMidlines[2]
	local continents	= {}
	local totalLand		= 0
	local areaMap		= PWAreaMap:New(elevationMap.width,elevationMap.height,elevationMap.wrapX,elevationMap.wrapY)
	
	areaMap:DefineAreas(landMatch)
	
	for areaID=1, #areaMap.areaList do
		local area = areaMap.areaList[areaID]
		if area.trueMatch and area.size > 10 then
			if not IsAreaBetweenOceans(area, oceanX1, oceanX2) then
				table.insert(continents, area)
			end
		end
	end
	
	if continents == {} then
		print("ConnectTerraContinents: No biggest continent!")
		return
	end
	
	for plotID, elevation in pairs(elevationMap.data) do
		if elevation > elevationMap.seaLevelThreshold then
			totalLand = totalLand + 1
		end
	end
	
	table.sort(continents, function(a, b)
		return a.size > b.size
	end)
	
	log:Info("ConnectTerraContinents: largestLand = %s%% of %s totalLand", Round(100 * continents[1].size / totalLand), totalLand)
	local largestSize = continents[1].size
	if largestSize > mg.percentLargestContinent * totalLand then
		return
	end
	
	--
	
	local plotFunc = function(plot)
		return Plot_IsWater(plot, true)
	end
	
	for i = 1, #continents do
		if i == 1 then
			continents[i].pathPlots		= {}
			continents[i].airDistance	= 0
			continents[i].distance		= 0
		else
			local pathPlots, distance, airDistance = GetPathBetweenAreas(areaMap, continents[i], continents[1], false, plotFunc)
			continents[i].pathPlots		= pathPlots
			continents[i].airDistance	= airDistance
			continents[i].distance		= distance
		end
	end
	
	for index, area in ipairs(continents) do
		log:Info("ConnectTerraContinents: continent #%-2s size = %-4s distance = %-3s size/distance = %s", index, area.size, area.distance, Round(area.size / math.max(1, area.distance)))
	end
	
	local newLand = {}
	
	for index, area in ipairs(continents) do
		if index ~= 1 and area.distance < mg.oceanRiftWidth + 2 and area.size / math.max(1, area.distance) > mg.terraConnectWeight then
			log:Info("ConnectTerraContinents: Connect continents[%s].size = %-3s distance = %-3s airDistance = %-3s size/distance = %s",
				index,
				area.size,
				area.distance,
				area.airDistance,
				Round(area.size / math.max(1, area.distance))
			)
			for _, plot in pairs(area.pathPlots) do
				newLand[Plot_GetID(plot)] = elevationMap.seaLevelThreshold
			end
			largestSize = largestSize + area.size
			if largestSize > mg.percentLargestContinent * totalLand then
				break
			end
		end
	end
	for plotID, elevation in pairs(newLand) do
		--Map.GetPlotByIndex(plotID):SetFeatureType(FeatureTypes.FEATURE_ICE, -1)
		elevationMap.data[plotID] = elevation
	end
end

function IsAreaBetweenOceans(area, oceanX1, oceanX2)
	return false
end

function GetPathBetweenAreas(areaMap, areaA, areaB, findLowest, plotMatchFunc)
	-- using Dijkstra's algorithm
	local mapW, mapH = Map.GetGridSize()
	
	-- initialize
	local plots = {}
	for plotID = 0, areaMap.length - 1 do
		plots[plotID]			= {}
		plots[plotID].plot		= Map.GetPlot(elevationMap:GetXYFromIndex(plotID))
		plots[plotID].areaID	= areaMap.data[plotID]
		
		if plots[plotID].areaID == areaA.id or plots[plotID].areaID == areaB.id then
			-- consider all plots equal in start and end areas
			plots[plotID].elevation	= 0
		else
			if findLowest then
				-- connect oceans
				plots[plotID].elevation	= GetElevationByPlotID(plotID) ^ 2
			else
				-- connect continents
				plots[plotID].elevation	= 1000 - GetElevationByPlotID(plotID) ^ 2
			end
		end
		
		if plots[plotID].areaID == areaA.id then
			plots[plotID].sumElevation = 0
		else
			plots[plotID].sumElevation = 30000
		end
	end
	
	-- main loop
	local lowestID = -1
	local lowest = nil
	local attempts = 0
	while attempts < mapW * mapH do
		lowestID, lowest = GetBestFromTable(plots, 
			function(a, b)
				if not a or not b then
					return a or b
				end
				if a.sumElevation ~= b.sumElevation then
					return a.sumElevation < b.sumElevation
				end
				return a.elevation < b.elevation
			end
		)
		
		if not lowest or lowest.sumElevation == math.huge or lowest.areaID == areaB.id then
			break
		end
		plots[lowestID] = nil
		for nearPlot in Plot_GetPlotsInCircle(lowest.plot, 1) do
			local nearID = Plot_GetID(nearPlot)
			local nearPlotInfo = plots[nearID]
			if nearPlotInfo then
				local altSumElevation = lowest.sumElevation + nearPlotInfo.elevation
				if altSumElevation < nearPlotInfo.sumElevation then
					plots[nearID].sumElevation = altSumElevation
					plots[nearID].previous = lowest
				end
			end
		end
	end
	
	local path = {}
	local start = lowest
	while lowest.previous do
		if plotMatchFunc(lowest.plot) then
			table.insert(path, lowest.plot)
		end
		lowest = lowest.previous
	end
	return path, #path, Map.PlotDistance(start.plot:GetX(), start.plot:GetY(), lowest.plot:GetX(), lowest.plot:GetY())
end

function GetBestFromTable(list, compareFunc)
	local least = nil
	local leastID = -1
	for k, v in pairs(list) do
		if compareFunc(v, least) then
			leastID = k
			least = v
		end
	end
	return leastID, least
end



function GetLargestArea(areaMap)
	local largestArea = nil
	local largestSize = 0
	for areaID=1, #areaMap.areaList do
		local area = areaMap.areaList[areaID]
		if area.trueMatch and area.size > largestSize then
			largestSize = area.size
			largestArea = area
		end
	end
	return largestArea, largestSize
end

function FillInLakes()
	local areaMap = PWAreaMap:New(elevationMap.width,elevationMap.height,elevationMap.wrapX,elevationMap.wrapY)
	areaMap:DefineAreas(waterMatch)
	for i=1, #areaMap.areaList do
		local area = areaMap.areaList[i]
		if area.trueMatch and area.size <= mg.lakeSize then
			for n = 0, areaMap.length do
				if areaMap.data[n] == area.id then
					elevationMap.data[n] = elevationMap.seaLevelThreshold
					--print("Saving lake of size ".. area.size)
					table.insert(mg.lakePlots, Map.GetPlot(elevationMap:GetXYFromIndex(n)))
				end
			end
		end
	end
end

function RestoreLakes()
	log:Info("RestoreLakes")
	
	--[[
	-- Seperate lakes from new ocean rifts
	for index, plot in pairs(mg.lakePlots) do
		local isLake = true
		for nearPlot in Plot_GetPlotsInCircle(plot, 1) do
			if nearPlot:IsWater() and not nearPlot:IsLake() then
				table.remove(mg.lakePlots, index)
				break
			end
		end
	end
	--]]
	
	-- Remove all rivers bordering lakes or oceans
	for _, plot in Plots() do
		if Plot_IsWater(plot) then
			for edgeDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
				Plot_SetRiver(plot, edgeDirection, mg.flowNONE)
			end
		end
	end
	
	-- Add lakes
	for _, plot in pairs(mg.lakePlots) do
		local isIce = (plot:GetFeatureType() == FeatureTypes.FEATURE_ICE)
		plot:SetTerrainType(TerrainTypes.TERRAIN_COAST, false, true)
		if isIce then
			--plot:SetFeatureType(FeatureTypes.FEATURE_ICE, -1)
		end
	end
	
	-- Calculate outflow from lakes
	local riversToAdd = {}
	local lakesDone = {}
	for plotID, plot in Plots(Shuffle) do
		for edgeDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
			if Plot_IsRiver(plot, edgeDirection) then
				prevPlot, edgeA, edgeB, flowA, flowB = Plot_GetPreviousRiverPlot(plot, edgeDirection)
				if prevPlot and Plot_IsLake(prevPlot) and not Contains(lakesDone, prevPlot) then
					print(string.format(
						"%2s flowing river: add edge %2s flowing %2s, edge %2s flowing %2s", 
						mg.flowNames[Plot_GetRiverFlowDirection(plot, edgeDirection)],
						mg.directionNames[edgeA],
						mg.flowNames[flowA],
						mg.directionNames[edgeB],
						mg.flowNames[flowB]
					))
					table.insert(riversToAdd, {plot=prevPlot, edge=edgeA, flow=flowA})
					table.insert(riversToAdd, {plot=prevPlot, edge=edgeB, flow=flowB})
					table.insert(lakesDone, prevPlot)
				end
			end
		end
	end
	
	for _, v in pairs(riversToAdd) do
		Plot_SetRiver(v.plot, v.edge, v.flow)
	end
end

function AddLakes()
	-- disable vanilla lake creation
end








--
-- Generate Terrain
--

function GenerateTerrain()
	print("Generating terrain - CommunitasMap")
	local timeStart = debugTime and os.clock() or 0
	local terrainTundra	= GameInfoTypes["TERRAIN_TUNDRA"]
	local terrainGrass	= GameInfoTypes["TERRAIN_GRASS"]

	local mapW, mapH = Map.GetGridSize()
	
	--first find minimum rain above sea level for a soft desert transition
	local minRain = 100.0
	for y = 0, mapH-1 do
		for x = 0,mapW-1 do
			local i = elevationMap:GetIndex(x,y)
			if not elevationMap:IsBelowSeaLevel(x,y) then
				if rainfallMap.data[i] < minRain then
					minRain = rainfallMap.data[i]
				end
			end
		end
	end

	--find exact thresholds

	local desertThreshold = rainfallMap:FindThresholdFromPercent(mg.desertPercent,false,false)
	local plainsThreshold = rainfallMap:FindThresholdFromPercent(mg.plainsPercent,false,false)
	local grassThreshold = rainfallMap:FindThresholdFromPercent(mg.grassPercent,false,false)

	for y = 0, mapH-1 do
		for x = 0,mapW-1 do
			local i = elevationMap:GetIndex(x,y)
			local plot = Map.GetPlot(x, y)
			if plot:GetPlotType() == PlotTypes.PLOT_LAND or plot:GetPlotType()==PlotTypes.PLOT_HILLS then

				if temperatureMap.data[i] < mg.snowTemperature then

					if rainfallMap.data[i] < plainsThreshold then
					
						plot:SetTerrainType(TerrainTypes.TERRAIN_SNOW,false,false)
					
					else 
					
						plot:SetTerrainType(terrainTundra,false,false)
					
					end

				elseif temperatureMap.data[i] < mg.tundraTemperature then

					if rainfallMap.data[i] < grassThreshold then

						plot:SetTerrainType(terrainTundra,false,false)

					else

						plot:SetTerrainType(terrainGrass,false,false)

					end

				elseif temperatureMap.data[i] < mg.desertMinTemperature then

					if rainfallMap.data[i] < plainsThreshold then
				
						plot:SetTerrainType(TerrainTypes.TERRAIN_PLAINS,false,false)

					else

						plot:SetTerrainType(terrainGrass,false,false)

					end

				else

					if rainfallMap.data[i] <= desertThreshold then

						plot:SetTerrainType(TerrainTypes.TERRAIN_DESERT,false,false)

					elseif rainfallMap.data[i] < plainsThreshold then
				
						plot:SetTerrainType(TerrainTypes.TERRAIN_PLAINS,false,false)

					else

						plot:SetTerrainType(terrainGrass,false,false)

					end
				end
			end
		end
	end
	
	
	if debugTime then print(string.format("%5s ms, GenerateTerrain %s", math.floor((os.clock() - timeStart) * 1000), "Main")) end
	if debugTime then timeStart = os.clock() end
	
	if debugTime then print(string.format("%5s ms, GenerateTerrain %s", math.floor((os.clock() - timeStart) * 1000), "SetOceanRiftPlots")) end
	if debugTime then timeStart = os.clock() end
	BlendTerrain()
	if debugTime then print(string.format("%5s ms, GenerateTerrain %s", math.floor((os.clock() - timeStart) * 1000), "BlendTerrain")) end
end


function GenerateIslands(rainfallMap)
	-- A cell system will be used to combine predefined land chunks with randomly generated island groups.
	-- Define the cell traits. (These need to fit correctly with the map grid width and height.)
	local grassThresholdA = rainfallMap:FindThresholdFromPercent(mg.plainsPercent+0.01,false,false)
	local iW, iH = Map.GetGridSize()
	local iCellWidth = 8
	local iCellHeight = 6
	local iNumCellColumns = math.floor(iW / iCellWidth)
	local iNumCellRows = math.floor(iH / iCellHeight)
	local iNumTotalCells = iNumCellColumns * iNumCellRows
	local cell_data = table.fill(false, iNumTotalCells) -- Stores data on map cells in use. All cells begin as empty.
	local iNumCellsInUse = 0
	local iNumCellTarget = math.floor(iNumTotalCells * 1)
	local island_chain_PlotTypes = table.fill(PlotTypes.PLOT_OCEAN, iW * iH)

	-- Add randomly generated island groups
	local iNumGroups = iNumCellTarget -- Should virtually never use all the groups.
	for group = 1, iNumGroups do
		if iNumCellsInUse >= iNumCellTarget then -- Map has reeached desired island population.
			print("-") print("** Number of Island Groups produced:", group - 1) print("-")
			break
		end
		--[[ Formation Chart
		1. Single Cell, Axis Only
		2. Double Cell, Horizontal, Axis Only
		3. Single Cell With Dots
		4. Double Cell, Horizontal, With Shifted Dots
		5. Double Cell, Vertical, Axis Only
		6. Double Cell, Vertical, With Shifted Dots
		7. Triple Cell, Vertical, With Double Dots
		8. Square of Cells 2x2 With Double Dots
		9. Rectangle 3x2 With Double Dots
		10. Rectangle 2x3 With Double Dots ]]--
		--
		-- Choose a formation
		local rate_threshold = {}
		local total_appearance_rate, iNumFormations = 0, 0
		local appearance_rates = { -- These numbers are relative to one another. No specific target total is necessary.
			7, -- #1
			3, -- #2
			15, --#3
			8, -- #4
			3, -- #5
			6, -- #6
			4, -- #7
			6, -- #8
			4, -- #9
			3, -- #10
		}
		for i, rate in ipairs(appearance_rates) do
			total_appearance_rate = total_appearance_rate + rate
			iNumFormations = iNumFormations + 1
		end
		local accumulated_rate = 0
		for index = 1, iNumFormations do
			local threshold = (appearance_rates[index] + accumulated_rate) * 10000 / total_appearance_rate
			table.insert(rate_threshold, threshold)
			accumulated_rate = accumulated_rate + appearance_rates[index]
		end
		local formation_type
		local diceroll = Map.Rand(10000, "Choose formation type - Island Making - Lua")
		for index, threshold in ipairs(rate_threshold) do
			if diceroll <= threshold then -- Choose this formation type.
				formation_type = index
				break
			end
		end
		-- Choose cell(s) not in use
		local iNumAttemptsToFindOpenCells = 0
		local found_unoccupied_cell = false
		local anchor_cell, cell_x, cell_y, foo
		while found_unoccupied_cell == false do
			if iNumAttemptsToFindOpenCells > 100 then -- Too many attempts on this pass. Might not be any valid locations for this formation.
				print("-") print("*-* ERROR:  Formation type of", formation_type, "for island group#", group, "unable to find an open space. Switching to single-cell.")
				formation_type = 3 -- Reset formation type.
				iNumAttemptsToFindOpenCells = 0
			end
			local diceroll = 1 + Map.Rand(iNumTotalCells, "Choosing a cell for an island group - Polynesia LUA")
			if cell_data[diceroll] == false then -- Anchor cell is unoccupied.
				-- If formation type is multiple-cell, all secondary cells must also be unoccupied.
				if formation_type == 1 or formation_type == 3 then -- single cell, proceed.
					anchor_cell = diceroll
					found_unoccupied_cell = true
				elseif formation_type == 2 or formation_type == 4 then -- double cell, horizontal.
					-- Check to see if anchor cell is in the final column. If so, reject.
					cell_x = math.fmod(diceroll, iNumCellColumns)
					if cell_x ~= 0 then -- Anchor cell is valid, but still have to check near cell.
						if cell_data[diceroll + 1] == false then -- Adjacent cell is unoccupied.
							anchor_cell = diceroll
							found_unoccupied_cell = true
						end
					end
				elseif formation_type == 5 or formation_type == 6 then -- double cell, vertical.
					-- Check to see if anchor cell is in the final row. If so, reject.
					cell_y, foo = math.modf(diceroll / iNumCellColumns)
					cell_y = cell_y + 1
					if cell_y < iNumCellRows then -- Anchor cell is valid, but still have to check cell above it.
						if cell_data[diceroll + iNumCellColumns] == false then -- Adjacent cell is unoccupied.
							anchor_cell = diceroll
							found_unoccupied_cell = true
						end
					end
				elseif formation_type == 7 then -- triple cell, vertical.
					-- Check to see if anchor cell is in the northern two rows. If so, reject.
					cell_y, foo = math.modf(diceroll / iNumCellColumns)
					cell_y = cell_y + 1
					if cell_y < iNumCellRows - 1 then -- Anchor cell is valid, but still have to check cells above it.
						if cell_data[diceroll + iNumCellColumns] == false then -- Cell directly above is unoccupied.
							if cell_data[diceroll + (iNumCellColumns * 2)] == false then -- Cell two rows above is unoccupied.
								anchor_cell = diceroll
								found_unoccupied_cell = true
							end
						end
					end
				elseif formation_type == 8 then -- square, 2x2.
					-- Check to see if anchor cell is in the final row or column. If so, reject.
					cell_x = math.fmod(diceroll, iNumCellColumns)
					if cell_x ~= 0 then
						cell_y, foo = math.modf(diceroll / iNumCellColumns)
						cell_y = cell_y + 1
						if cell_y < iNumCellRows then -- Anchor cell is valid. Still have to check the other three cells.
							if cell_data[diceroll + iNumCellColumns] == false then
								if cell_data[diceroll + 1] == false then
									if cell_data[diceroll + iNumCellColumns + 1] == false then -- All cells are open.
										anchor_cell = diceroll
										found_unoccupied_cell = true
									end
								end
							end
						end
					end
				elseif formation_type == 9 then -- horizontal, 3x2.
					-- Check to see if anchor cell is too near to an edge. If so, reject.
					cell_x = math.fmod(diceroll, iNumCellColumns)
					if cell_x ~= 0 and cell_x ~= iNumCellColumns - 1 then
						cell_y, foo = math.modf(diceroll / iNumCellColumns)
						cell_y = cell_y + 1
						if cell_y < iNumCellRows then -- Anchor cell is valid. Still have to check the other cells.
							if cell_data[diceroll + iNumCellColumns] == false then
								if cell_data[diceroll + 1] == false and cell_data[diceroll + 2] == false then
									if cell_data[diceroll + iNumCellColumns + 1] == false then
										if cell_data[diceroll + iNumCellColumns + 2] == false then -- All cells are open.
											anchor_cell = diceroll
											found_unoccupied_cell = true
										end
									end
								end
							end
						end
					end
				elseif formation_type == 10 then -- vertical, 2x3.
					-- Check to see if anchor cell is too near to an edge. If so, reject.
					cell_x = math.fmod(diceroll, iNumCellColumns)
					if cell_x ~= 0 then
						cell_y, foo = math.modf(diceroll / iNumCellColumns)
						cell_y = cell_y + 1
						if cell_y < iNumCellRows - 1 then -- Anchor cell is valid. Still have to check the other cells.
							if cell_data[diceroll + iNumCellColumns] == false then
								if cell_data[diceroll + 1] == false then
									if cell_data[diceroll + iNumCellColumns + 1] == false then
										if cell_data[diceroll + (iNumCellColumns * 2)] == false then
											if cell_data[diceroll + (iNumCellColumns * 2) + 1] == false then -- All cells are open.
												anchor_cell = diceroll
												found_unoccupied_cell = true
											end
										end
									end
								end
							end
						end
					end
				end
			end
			iNumAttemptsToFindOpenCells = iNumAttemptsToFindOpenCells + 1
		end
		-- Find Cell X and Y
		cell_x = math.fmod(anchor_cell, iNumCellColumns)
		if cell_x == 0 then
			cell_x = iNumCellColumns
		end
		cell_y, foo = math.modf(anchor_cell / iNumCellColumns)
		cell_y = cell_y + 1
		
		-- Debug
		--print("-") print("-") print("* Group# " .. group, "Formation Type: " .. formation_type, "Cell X, Y: " .. cell_x .. ", " .. cell_y)

		-- Create this island group.
		local iWidth, iHeight, fTilt -- Scope the variables needed for island group creation.
		local plot_data = {}
		local x_shift, y_shift
		if formation_type == 1 then -- single cell
			local x_shrinkage = Map.Rand(4, "Cell Width adjustment - Lua")
			if x_shrinkage > 2 then
				x_shrinkage = 0
			end
			local y_shrinkage = Map.Rand(5, "Cell Height adjustment - Lua")
			if y_shrinkage > 2 then
				y_shrinkage = 0
			end
			x_shift, y_shift = 0, 0
			if x_shrinkage > 0 then
				x_shift = Map.Rand(x_shrinkage, "Cell Width offset - Lua")
			end
			if y_shrinkage > 0 then
				y_shift = Map.Rand(y_shrinkage, "Cell Height offset - Lua")
			end
			iWidth = iCellWidth - x_shrinkage
			iHeight = iCellHeight - y_shrinkage
			fTilt = Map.Rand(181, "Angle for island chain axis - LUA")
			plot_data = CreateSingleAxisIslandChain(iWidth, iHeight, fTilt)

		elseif formation_type == 2 then -- two cells, horizontal
			local x_shrinkage = Map.Rand(8, "Cell Width adjustment - Lua")
			if x_shrinkage > 5 then
				x_shrinkage = 0
			end
			local y_shrinkage = Map.Rand(5, "Cell Height adjustment - Lua")
			if y_shrinkage > 2 then
				y_shrinkage = 0
			end
			x_shift, y_shift = 0, 0
			if x_shrinkage > 0 then
				x_shift = Map.Rand(x_shrinkage, "Cell Width offset - Lua")
			end
			if y_shrinkage > 0 then
				y_shift = Map.Rand(y_shrinkage, "Cell Height offset - Lua")
			end
			iWidth = iCellWidth * 2 - x_shrinkage
			iHeight = iCellHeight - y_shrinkage
			-- Limit angles to mostly horizontal ones.
			fTilt = 145 + Map.Rand(90, "Angle for island chain axis - LUA")
			if fTilt > 180 then
				fTilt = fTilt - 180
			end
			plot_data = CreateSingleAxisIslandChain(iWidth, iHeight, fTilt)
			
		elseif formation_type == 3 then -- single cell, with dots
			local x_shrinkage = Map.Rand(4, "Cell Width adjustment - Lua")
			if x_shrinkage > 2 then
				x_shrinkage = 0
			end
			local y_shrinkage = Map.Rand(5, "Cell Height adjustment - Lua")
			if y_shrinkage > 2 then
				y_shrinkage = 0
			end
			x_shift, y_shift = 0, 0
			if x_shrinkage > 0 then
				x_shift = Map.Rand(x_shrinkage, "Cell Width offset - Lua")
			end
			if y_shrinkage > 0 then
				y_shift = Map.Rand(y_shrinkage, "Cell Height offset - Lua")
			end
			iWidth = iCellWidth - x_shrinkage
			iHeight = iCellHeight - y_shrinkage
			fTilt = Map.Rand(181, "Angle for island chain axis - LUA")
			-- Determine "dot box"
			local iInnerWidth, iInnerHeight = iWidth - 2, iHeight - 2
			-- Determine number of dots
			local die_1 = Map.Rand(4, "Diceroll - Lua")
			local die_2 = Map.Rand(8, "Diceroll - Lua")
			local iNumDots = 4
			if die_1 + die_2 > 1 then
				iNumDots = iNumDots + Map.Rand(die_1 + die_2, "Number of dots to add to island chain - Lua")
			else
				iNumDots = iNumDots + die_1 + die_2
			end
			plot_data = CreateAxisChainWithDots(iWidth, iHeight, fTilt, iInnerWidth, iInnerHeight, iNumDots)

		elseif formation_type == 4 then -- two cells, horizontal, with dots
			local x_shrinkage = Map.Rand(8, "Cell Width adjustment - Lua")
			if x_shrinkage > 5 then
				x_shrinkage = 0
			end
			local y_shrinkage = Map.Rand(5, "Cell Height adjustment - Lua")
			if y_shrinkage > 2 then
				y_shrinkage = 0
			end
			x_shift, y_shift = 0, 0
			if x_shrinkage > 0 then
				x_shift = Map.Rand(x_shrinkage, "Cell Width offset - Lua")
			end
			if y_shrinkage > 0 then
				y_shift = Map.Rand(y_shrinkage, "Cell Height offset - Lua")
			end
			iWidth = iCellWidth * 2 - x_shrinkage
			iHeight = iCellHeight - y_shrinkage
			-- Limit angles to mostly horizontal ones.
			fTilt = 145 + Map.Rand(90, "Angle for island chain axis - LUA")
			if fTilt > 180 then
				fTilt = fTilt - 180
			end
			-- Determine "dot box"
			local iInnerWidth = math.floor(iWidth / 2)
			local iInnerHeight = iHeight - 2
			local iInnerWest = 2 + Map.Rand((iWidth - 1) - iInnerWidth, "Shift for sub island group - Lua")
			local iInnerSouth = 2
			-- Determine number of dots
			local die_1 = Map.Rand(4, "Diceroll - Lua")
			local die_2 = Map.Rand(10, "Diceroll - Lua")
			local iNumDots = 5
			if die_1 + die_2 > 1 then
				iNumDots = iNumDots + Map.Rand(die_1 + die_2, "Number of dots to add to island chain - Lua")
			else
				iNumDots = iNumDots + die_1 + die_2
			end
			plot_data = CreateAxisChainWithShiftedDots(iWidth, iHeight, fTilt, iInnerWidth, iInnerHeight, iInnerWest, iInnerSouth, iNumDots)
			
		elseif formation_type == 5 then -- Double Cell, Vertical, Axis Only
			local x_shrinkage = Map.Rand(5, "Cell Width adjustment - Lua")
			if x_shrinkage > 2 then
				x_shrinkage = 0
			end
			local y_shrinkage = Map.Rand(7, "Cell Height adjustment - Lua")
			if y_shrinkage > 4 then
				y_shrinkage = 0
			end
			x_shift, y_shift = 0, 0
			if x_shrinkage > 0 then
				x_shift = Map.Rand(x_shrinkage, "Cell Width offset - Lua")
			end
			if y_shrinkage > 0 then
				y_shift = Map.Rand(y_shrinkage, "Cell Height offset - Lua")
			end
			iWidth = iCellWidth - x_shrinkage
			iHeight = iCellHeight * 2 - y_shrinkage
			-- Limit angles to mostly vertical ones.
			fTilt = 55 + Map.Rand(71, "Angle for island chain axis - LUA")
			plot_data = CreateSingleAxisIslandChain(iWidth, iHeight, fTilt)
		
		elseif formation_type == 6 then -- Double Cell, Vertical With Dots
			local x_shrinkage = Map.Rand(5, "Cell Width adjustment - Lua")
			if x_shrinkage > 2 then
				x_shrinkage = 0
			end
			local y_shrinkage = Map.Rand(7, "Cell Height adjustment - Lua")
			if y_shrinkage > 4 then
				y_shrinkage = 0
			end
			x_shift, y_shift = 0, 0
			if x_shrinkage > 0 then
				x_shift = Map.Rand(x_shrinkage, "Cell Width offset - Lua")
			end
			if y_shrinkage > 0 then
				y_shift = Map.Rand(y_shrinkage, "Cell Height offset - Lua")
			end
			iWidth = iCellWidth - x_shrinkage
			iHeight = iCellHeight * 2 - y_shrinkage
			-- Limit angles to mostly vertical ones.
			fTilt = 55 + Map.Rand(71, "Angle for island chain axis - LUA")
			-- Determine "dot box"
			local iInnerWidth = iWidth - 2
			local iInnerHeight = math.floor(iHeight / 2)
			local iInnerWest = 2
			local iInnerSouth = 2 + Map.Rand((iHeight - 1) - iInnerHeight, "Shift for sub island group - Lua")
			-- Determine number of dots
			local die_1 = Map.Rand(4, "Diceroll - Lua")
			local die_2 = Map.Rand(10, "Diceroll - Lua")
			local iNumDots = 5
			if die_1 + die_2 > 1 then
				iNumDots = iNumDots + Map.Rand(die_1 + die_2, "Number of dots to add to island chain - Lua")
			else
				iNumDots = iNumDots + die_1 + die_2
			end
			plot_data = CreateAxisChainWithShiftedDots(iWidth, iHeight, fTilt, iInnerWidth, iInnerHeight, iInnerWest, iInnerSouth, iNumDots)
		
		elseif formation_type == 7 then -- Triple Cell, Vertical With Double Dots
			local x_shrinkage = Map.Rand(4, "Cell Width adjustment - Lua")
			if x_shrinkage > 1 then
				x_shrinkage = 0
			end
			local y_shrinkage = Map.Rand(9, "Cell Height adjustment - Lua")
			if y_shrinkage > 5 then
				y_shrinkage = 0
			end
			x_shift, y_shift = 0, 0
			if x_shrinkage > 0 then
				x_shift = Map.Rand(x_shrinkage, "Cell Width offset - Lua")
			end
			if y_shrinkage > 0 then
				y_shift = Map.Rand(y_shrinkage, "Cell Height offset - Lua")
			end
			iWidth = iCellWidth - x_shrinkage
			iHeight = iCellHeight * 3 - y_shrinkage
			-- Limit angles to steep ones.
			fTilt = 70 + Map.Rand(41, "Angle for island chain axis - LUA")
			-- Handle Dots Group 1.
			local iInnerWidth1 = iWidth - 3
			local iInnerHeight1 = iCellHeight - 1
			local iInnerWest1 = 2 + Map.Rand(2, "Shift for sub island group - Lua")
			local iInnerSouth1 = 2 + Map.Rand(iCellHeight - 3, "Shift for sub island group - Lua")
			-- Determine number of dots
			local die_1 = Map.Rand(4, "Diceroll - Lua")
			local die_2 = Map.Rand(8, "Diceroll - Lua")
			local iNumDots1 = 4
			if die_1 + die_2 > 1 then
				iNumDots1 = iNumDots1 + Map.Rand(die_1 + die_2, "Number of dots to add to island chain - Lua")
			else
				iNumDots1 = iNumDots1 + die_1 + die_2
			end
			-- Handle Dots Group 2.
			local iInnerWidth2 = iWidth - 3
			local iInnerHeight2 = iCellHeight - 1
			local iInnerWest2 = 2 + Map.Rand(2, "Shift for sub island group - Lua")
			local iInnerSouth2 = iCellHeight + 2 + Map.Rand(iCellHeight - 3, "Shift for sub island group - Lua")
			-- Determine number of dots
			local die_1 = Map.Rand(4, "Diceroll - Lua")
			local die_2 = Map.Rand(8, "Diceroll - Lua")
			local iNumDots2 = 4
			if die_1 + die_2 > 1 then
				iNumDots2 = iNumDots2 + Map.Rand(die_1 + die_2, "Number of dots to add to island chain - Lua")
			else
				iNumDots2 = iNumDots2 + die_1 + die_2
			end
			plot_data = CreateAxisChainWithDoubleDots(iWidth, iHeight, fTilt, iInnerWidth1, iInnerHeight1, iInnerWest1, iInnerSouth1,
                                                      iNumDots1, iInnerWidth2, iInnerHeight2, iInnerWest2, iInnerSouth2, iNumDots2)
		elseif formation_type == 8 then -- Square Block 2x2 With Double Dots
			local x_shrinkage = Map.Rand(6, "Cell Width adjustment - Lua")
			if x_shrinkage > 4 then
				x_shrinkage = 0
			end
			local y_shrinkage = Map.Rand(5, "Cell Height adjustment - Lua")
			if y_shrinkage > 3 then
				y_shrinkage = 0
			end
			x_shift, y_shift = 0, 0
			if x_shrinkage > 0 then
				x_shift = Map.Rand(x_shrinkage, "Cell Width offset - Lua")
			end
			if y_shrinkage > 0 then
				y_shift = Map.Rand(y_shrinkage, "Cell Height offset - Lua")
			end
			iWidth = iCellWidth * 2 - x_shrinkage
			iHeight = iCellHeight * 2 - y_shrinkage
			-- Full range of angles
			fTilt = Map.Rand(181, "Angle for island chain axis - LUA")
			-- Handle Dots Group 1.
			local iInnerWidth1 = iCellWidth - 2
			local iInnerHeight1 = iCellHeight - 2
			local iInnerWest1 = 3 + Map.Rand(iCellWidth - 2, "Shift for sub island group - Lua")
			local iInnerSouth1 = 3 + Map.Rand(iCellHeight - 2, "Shift for sub island group - Lua")
			-- Determine number of dots
			local die_1 = Map.Rand(6, "Diceroll - Lua")
			local die_2 = Map.Rand(10, "Diceroll - Lua")
			local iNumDots1 = 5
			if die_1 + die_2 > 1 then
				iNumDots1 = iNumDots1 + Map.Rand(die_1 + die_2, "Number of dots to add to island chain - Lua")
			else
				iNumDots1 = iNumDots1 + die_1 + die_2
			end
			-- Handle Dots Group 2.
			local iInnerWidth2 = iCellWidth - 2
			local iInnerHeight2 = iCellHeight - 2
			local iInnerWest2 = 3 + Map.Rand(iCellWidth - 2, "Shift for sub island group - Lua")
			local iInnerSouth2 = 3 + Map.Rand(iCellHeight - 2, "Shift for sub island group - Lua")
			-- Determine number of dots
			local die_1 = Map.Rand(4, "Diceroll - Lua")
			local die_2 = Map.Rand(8, "Diceroll - Lua")
			local iNumDots2 = 5
			if die_1 + die_2 > 1 then
				iNumDots2 = iNumDots2 + Map.Rand(die_1 + die_2, "Number of dots to add to island chain - Lua")
			else
				iNumDots2 = iNumDots2 + die_1 + die_2
			end
			plot_data = CreateAxisChainWithDoubleDots(iWidth, iHeight, fTilt, iInnerWidth1, iInnerHeight1, iInnerWest1, iInnerSouth1,
                                                      iNumDots1, iInnerWidth2, iInnerHeight2, iInnerWest2, iInnerSouth2, iNumDots2)

		elseif formation_type == 9 then -- Horizontal Block 3x2 With Double Dots
			local x_shrinkage = Map.Rand(8, "Cell Width adjustment - Lua")
			if x_shrinkage > 5 then
				x_shrinkage = 0
			end
			local y_shrinkage = Map.Rand(5, "Cell Height adjustment - Lua")
			if y_shrinkage > 3 then
				y_shrinkage = 0
			end
			x_shift, y_shift = 0, 0
			if x_shrinkage > 0 then
				x_shift = Map.Rand(x_shrinkage, "Cell Width offset - Lua")
			end
			if y_shrinkage > 0 then
				y_shift = Map.Rand(y_shrinkage, "Cell Height offset - Lua")
			end
			iWidth = iCellWidth * 3 - x_shrinkage
			iHeight = iCellHeight * 2 - y_shrinkage
			-- Limit angles to mostly horizontal ones.
			fTilt = 145 + Map.Rand(90, "Angle for island chain axis - LUA")
			if fTilt > 180 then
				fTilt = fTilt - 180
			end
			-- Handle Dots Group 1.
			local iInnerWidth1 = iCellWidth
			local iInnerHeight1 = iCellHeight - 2
			local iInnerWest1 = 4 + Map.Rand(iCellWidth + 2, "Shift for sub island group - Lua")
			local iInnerSouth1 = 3 + Map.Rand(iCellHeight - 2, "Shift for sub island group - Lua")
			-- Determine number of dots
			local die_1 = Map.Rand(4, "Diceroll - Lua")
			local die_2 = Map.Rand(8, "Diceroll - Lua")
			local iNumDots1 = 9
			if die_1 + die_2 > 1 then
				iNumDots1 = iNumDots1 + Map.Rand(die_1 + die_2, "Number of dots to add to island chain - Lua")
			else
				iNumDots1 = iNumDots1 + die_1 + die_2
			end
			-- Handle Dots Group 2.
			local iInnerWidth2 = iCellWidth
			local iInnerHeight2 = iCellHeight - 2
			local iInnerWest2 = 4 + Map.Rand(iCellWidth + 2, "Shift for sub island group - Lua")
			local iInnerSouth2 = 3 + Map.Rand(iCellHeight - 2, "Shift for sub island group - Lua")
			-- Determine number of dots
			local die_1 = Map.Rand(5, "Diceroll - Lua")
			local die_2 = Map.Rand(7, "Diceroll - Lua")
			local iNumDots2 = 8
			if die_1 + die_2 > 1 then
				iNumDots2 = iNumDots2 + Map.Rand(die_1 + die_2, "Number of dots to add to island chain - Lua")
			else
				iNumDots2 = iNumDots2 + die_1 + die_2
			end
			plot_data = CreateAxisChainWithDoubleDots(iWidth, iHeight, fTilt, iInnerWidth1, iInnerHeight1, iInnerWest1, iInnerSouth1,
                                                      iNumDots1, iInnerWidth2, iInnerHeight2, iInnerWest2, iInnerSouth2, iNumDots2)

		elseif formation_type == 10 then -- Vertical Block 2x3 With Double Dots
			local x_shrinkage = Map.Rand(6, "Cell Width adjustment - Lua")
			if x_shrinkage > 4 then
				x_shrinkage = 0
			end
			local y_shrinkage = Map.Rand(8, "Cell Height adjustment - Lua")
			if y_shrinkage > 5 then
				y_shrinkage = 0
			end
			x_shift, y_shift = 0, 0
			if x_shrinkage > 0 then
				x_shift = Map.Rand(x_shrinkage, "Cell Width offset - Lua")
			end
			if y_shrinkage > 0 then
				y_shift = Map.Rand(y_shrinkage, "Cell Height offset - Lua")
			end
			iWidth = iCellWidth * 2 - x_shrinkage
			iHeight = iCellHeight * 3 - y_shrinkage
			-- Mostly vertical
			fTilt = 55 + Map.Rand(71, "Angle for island chain axis - LUA")
			-- Handle Dots Group 1.
			local iInnerWidth1 = iCellWidth - 2
			local iInnerHeight1 = iCellHeight
			local iInnerWest1 = 3 + Map.Rand(iCellWidth - 2, "Shift for sub island group - Lua")
			local iInnerSouth1 = 4 + Map.Rand(iCellHeight + 2, "Shift for sub island group - Lua")
			-- Determine number of dots
			local die_1 = Map.Rand(4, "Diceroll - Lua")
			local die_2 = Map.Rand(10, "Diceroll - Lua")
			local iNumDots1 = 8
			if die_1 + die_2 > 1 then
				iNumDots1 = iNumDots1 + Map.Rand(die_1 + die_2, "Number of dots to add to island chain - Lua")
			else
				iNumDots1 = iNumDots1 + die_1 + die_2
			end
			-- Handle Dots Group 2.
			local iInnerWidth2 = iCellWidth - 2
			local iInnerHeight2 = iCellHeight
			local iInnerWest2 = 3 + Map.Rand(iCellWidth - 2, "Shift for sub island group - Lua")
			local iInnerSouth2 = 4 + Map.Rand(iCellHeight + 2, "Shift for sub island group - Lua")
			-- Determine number of dots
			local die_1 = Map.Rand(4, "Diceroll - Lua")
			local die_2 = Map.Rand(8, "Diceroll - Lua")
			local iNumDots2 = 7
			if die_1 + die_2 > 1 then
				iNumDots2 = iNumDots2 + Map.Rand(die_1 + die_2, "Number of dots to add to island chain - Lua")
			else
				iNumDots2 = iNumDots2 + die_1 + die_2
			end
			plot_data = CreateAxisChainWithDoubleDots(iWidth, iHeight, fTilt, iInnerWidth1, iInnerHeight1, iInnerWest1, iInnerSouth1,
                                                      iNumDots1, iInnerWidth2, iInnerHeight2, iInnerWest2, iInnerSouth2, iNumDots2)
		end

		-- Obtain land plots from the plot data
		local x_adjust = (cell_x - 1) * iCellWidth + x_shift
		local y_adjust = (cell_y - 1) * iCellHeight + y_shift
		for y = 1, iHeight do
			for x = 1, iWidth do
				local data_index = (y - 1) * iWidth + x
				if plot_data[data_index] == true then -- This plot is land.
					local real_x, real_y = x + x_adjust - 1, y + y_adjust - 1
					local plot_index = real_y * iW + real_x + 1
					island_chain_PlotTypes[plot_index] = PlotTypes.PLOT_LAND
				end
			end
		end
		
		-- Record cells in use
		if formation_type == 1 then -- single cell
			cell_data[anchor_cell] = true
			iNumCellsInUse = iNumCellsInUse + 1
		elseif formation_type == 2 then
			cell_data[anchor_cell], cell_data[anchor_cell + 1] = true, true
			iNumCellsInUse = iNumCellsInUse + 2
		elseif formation_type == 3 then
			cell_data[anchor_cell] = true
			iNumCellsInUse = iNumCellsInUse + 1
		elseif formation_type == 4 then
			cell_data[anchor_cell], cell_data[anchor_cell + 1] = true, true
			iNumCellsInUse = iNumCellsInUse + 2
		elseif formation_type == 5 then
			cell_data[anchor_cell], cell_data[anchor_cell + iNumCellColumns] = true, true
			iNumCellsInUse = iNumCellsInUse + 2
		elseif formation_type == 6 then
			cell_data[anchor_cell], cell_data[anchor_cell + iNumCellColumns] = true, true
			iNumCellsInUse = iNumCellsInUse + 2
		elseif formation_type == 7 then
			cell_data[anchor_cell], cell_data[anchor_cell + iNumCellColumns] = true, true
			cell_data[anchor_cell + (iNumCellColumns * 2)] = true
			iNumCellsInUse = iNumCellsInUse + 3
		elseif formation_type == 8 then
			cell_data[anchor_cell], cell_data[anchor_cell + 1] = true, true
			cell_data[anchor_cell + iNumCellColumns], cell_data[anchor_cell + iNumCellColumns + 1] = true, true
			iNumCellsInUse = iNumCellsInUse + 4
		elseif formation_type == 9 then
			cell_data[anchor_cell], cell_data[anchor_cell + 1] = true, true
			cell_data[anchor_cell + iNumCellColumns], cell_data[anchor_cell + iNumCellColumns + 1] = true, true
			cell_data[anchor_cell + 2], cell_data[anchor_cell + iNumCellColumns + 2] = true, true
			iNumCellsInUse = iNumCellsInUse + 6
		elseif formation_type == 10 then
			cell_data[anchor_cell], cell_data[anchor_cell + 1] = true, true
			cell_data[anchor_cell + iNumCellColumns], cell_data[anchor_cell + iNumCellColumns + 1] = true, true
			cell_data[anchor_cell + (iNumCellColumns * 2)], cell_data[anchor_cell + (iNumCellColumns * 2) + 1] = true, true
			iNumCellsInUse = iNumCellsInUse + 6
		end
	end
	
	-- Debug check of cell occupation.
	--print("- - -")
	for loop = iNumCellRows, 1, -1 do
		local c = (loop - 1) * iNumCellColumns
		local stringdata = {}
		for innerloop = 1, iNumCellColumns do
			if cell_data[c + innerloop] == false then
				stringdata[innerloop] = "false"
			else
				stringdata[innerloop] = "true "
			end
		end
		--print("Row: ", table.concat(stringdata))
	end
	--
	
	-- Add Hills and Peaks to randomly generated islands.
	local regionHillsFrac = Fractal.Create(iW, iH, 5, {}, 7, 7)
	local regionPeaksFrac = Fractal.Create(iW, iH, 6, {}, 7, 7)
	local iHillsBottom1 = regionHillsFrac:GetHeight(20)
	local iHillsTop1 = regionHillsFrac:GetHeight(35)
	local iHillsBottom2 = regionHillsFrac:GetHeight(65)
	local iHillsTop2 = regionHillsFrac:GetHeight(80)
	local iPeakThreshold = regionPeaksFrac:GetHeight(80)
	for x = 0, iW - 1 do
		for y = 0, iH - 1 do
			local i = y * iW + x + 1
			if island_chain_PlotTypes[i] ~= PlotTypes.PLOT_OCEAN then
				local hillVal = regionHillsFrac:GetHeight(x,y)
				if ((hillVal >= iHillsBottom1 and hillVal <= iHillsTop1) or (hillVal >= iHillsBottom2 and hillVal <= iHillsTop2)) then
					island_chain_PlotTypes[i] = PlotTypes.PLOT_HILLS
				end
			end
		end
	end
	
	-- Apply island data to the map.
	for y = 3, iH - 4 do -- avoid polar caps
		for x = 0, iW - 1 do
			local i = y * iW + x + 1
			local plot = Map.GetPlot(x, y)
			if island_chain_PlotTypes[i] ~= PlotTypes.PLOT_OCEAN and Plot_IsWater(plot, true) then
				local isValid = true
				local numAdjacentLand = 0
				-- Don't fill river deltas with land
				for nearPlot in Plot_GetPlotsInCircle(plot, 1) do
					if nearPlot:GetPlotType() ~= PlotTypes.PLOT_OCEAN and nearPlot:Area():GetNumTiles() >= 10 then
						numAdjacentLand = numAdjacentLand + 1
						if numAdjacentLand > 1 then
							isValid = false
							break
						end
					end
				end
				if isValid then
					plot:SetPlotType(island_chain_PlotTypes[i], false, false)
					rainfallMap.data[i]=math.max(grassThresholdA,rainfallMap.data[i])
				else
					--plot:SetPlotType(PlotTypes.PLOT_MOUNTAIN, false, false)
				end
			end
		end
	end
end

function GetTemperature(myPlot)
	if myPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW then
		return 0
	elseif myPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA then
		return 1
	end
	return 2
end

function BlendTerrain()
	local mapW, mapH = Map.GetGridSize()
	local landPlots = {}
	
	local mountainCheckTime = 0
	for plotID, plot in Plots(Shuffle) do
		if Plot_IsWater(plot) then
			--
		else
			local plotTerrainID = plot:GetTerrainType()
			local plotFeatureID = plot:GetFeatureType()
			local plotPercent = Plot_GetCirclePercents(plot, 1, mg.terrainBlendRange)
			local randPercent = 1 + PWRand() * 2 * mg.terrainBlendRandom - mg.terrainBlendRandom
			
			if plot:IsMountain() then
				-- minimize necessary pathfinding
				local numNearMountains = 0
				for nearPlot in Plot_GetPlotsInCircle(plot, 1, 1) do
					if nearPlot:IsMountain() then
						numNearMountains = numNearMountains + 1
					end
				end
				if debugTime then timeStart = os.clock() end
				if 2 <= numNearMountains and numNearMountains <= 4 then
					--CreatePossibleMountainPass(plot)
				end
				if debugTime then mountainCheckTime = mountainCheckTime + (os.clock() - timeStart) end
			else

				if plotTerrainID == TerrainTypes.TERRAIN_DESERT then
					if plotPercent.TERRAIN_GRASS >= 0.2 * randPercent then
						plot:SetTerrainType(TerrainTypes.TERRAIN_PLAINS, true, true)
					end
				
				elseif plotTerrainID == TerrainTypes.TERRAIN_GRASS then
					if plotPercent.TERRAIN_DESERT + plotPercent.TERRAIN_SNOW >= 0.33 * randPercent then
						plot:SetTerrainType(TerrainTypes.TERRAIN_PLAINS, true, true)
					end

				end
			end

			if plotTerrainID == TerrainTypes.TERRAIN_SNOW then
				local isMountain = plot:IsMountain()
				local warmCount = 2 * plotPercent.FEATURE_JUNGLE + 2 * plotPercent.FEATURE_MARSH + plotPercent.TERRAIN_GRASS + plotPercent.TERRAIN_DESERT + 0.5 * plotPercent.TERRAIN_PLAINS
				if warmCount >= 0.25 * randPercent then
					plot:SetTerrainType(TerrainTypes.TERRAIN_TUNDRA, true, true)
				elseif warmCount >= 0.10 * randPercent or plot:IsFreshWater() then
					plot:SetTerrainType(TerrainTypes.TERRAIN_TUNDRA, true, true)
				end
				if isMountain then
					plot:SetPlotType(PlotTypes.PLOT_MOUNTAIN, false, false)
				end

			end
		end
	end
	if debugTime then print(string.format("%5s ms, BlendTerrain %s", math.floor(mountainCheckTime * 1000), "MountainCheckTime")) end
	
	-- flat -> hills near mountain, and flat cold -> hills when surrounded by warm.
	for plotID, plot in Plots(Shuffle) do
		if plot:GetPlotType() == PlotTypes.PLOT_LAND then
			local nearMountains = 0
			local nearWarm = 0
			for nearPlot in Plot_GetPlotsInCircle(plot, 1) do
				if not nearPlot:IsWater() then
					local nearTerrainID = nearPlot:GetTerrainType()
					
					if IsMountain(nearPlot) then
						nearMountains = nearMountains + 1
					end
					
					if GetTemperature(nearPlot) > GetTemperature(plot) then
						nearWarm = nearWarm + 1
					end
				end
			end
			if (nearMountains > 1 and (nearMountains * mg.hillsBlendPercent * 100) >= Map.Rand(100, "Blend mountains - Lua")) then
				--print("Turning flatland near mountain into hills")
				plot:SetPlotType(PlotTypes.PLOT_HILLS, false, false)
				--plot:SetTerrainType(TerrainTypes.TERRAIN_SNOW, false, false)
			elseif nearWarm * 0.5 * mg.hillsBlendPercent * 100 >= Map.Rand(100, "Blend hills - Lua") then
				if plot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW then
					--
				else
					plot:SetPlotType(PlotTypes.PLOT_HILLS, false, false)
				end
			end
		end
		if plot:GetPlotType() == PlotTypes.PLOT_HILLS then
			if plot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW then

					plot:SetPlotType(PlotTypes.PLOT_LAND,false,false)    -- allows resources to be placed on snow

			end
		end

	end
end
--[[
function CreatePossibleMountainPass(plot)
	local x, y = plot:GetX(), plot:GetY()
	if not plot:IsMountain() then
		return
	end
	
	local longestRoute = 0
	for dirA = 0, 3 do
		plotA = Map.PlotDirection(x, y, dirA)
		if plotA and (plotA:GetPlotType() == PlotTypes.PLOT_LAND or plotA:GetPlotType() == PlotTypes.PLOT_HILLS) then
			for dirB = dirA+2, 5 do
				local plotB = Map.PlotDirection(x, y, dirB)
				if plotB and (plotB:GetPlotType() == PlotTypes.PLOT_LAND or plotB:GetPlotType() == PlotTypes.PLOT_HILLS) then
					local isConnected = isPlotConnected(nil, plotA, plotB, "Land", true)
					if longestRoute < getRouteLength() then
						longestRoute = getRouteLength()
					end
					if (getRouteLength() == 0 or getRouteLength() > 15) then
						print(string.format("CreatePossibleMountainPass path distance = %2s - Change to Hills", getRouteLength()))
						plot:SetPlotType(PlotTypes.PLOT_HILLS, false, true)
						--plot:SetFeatureType(FeatureTypes.FEATURE_FALLOUT, -1) -- debug
						
						table.insert(mg.MountainPasses, plot) -- still consider this a mountain tile for art purposes
						return
					end
				end
			end
		end
	end
	--print(string.format("CreatePossibleMountainPass longestRoute = %2s", longestRoute))
end
--]]

function CreateArcticOceans()
	local mapW, mapH = Map.GetGridSize()	
	--CreateOceanRift{y = 0,  	direction = mg.E, totalSize = 1, oceanSize = 1, fill = true}
	--CreateOceanRift{y = mapH-1, direction = mg.E, totalSize = 1, oceanSize = 1, fill = true}
end

function CreateVerticalOceans()	
	local oOceanRifts = mg.oceanRiftTypes
	local mapW, mapH = Map.GetGridSize()	
	if oOceanRifts == 6 then
		-- No vertical rifts
		return
	end
	
	log:Info("CreateVerticalOceans mg.oceanRiftWidth = %s", mg.oceanRiftWidth)
	
	
	function CreatePacific(midline)
		CreateOceanRift{x = midline, totalSize = mg.pacificSize, bulge = mg.pacificBulge, curve = mg.pacificCurve, oceanSize = math.max(1, Round(mg.oceanRiftWidth - 1))}
	end
	function CreateAtlantic(midline)
		CreateOceanRift{x = midline, totalSize = mg.atlanticSize, bulge = mg.atlanticBulge, curve = mg.atlanticCurve, oceanSize = mg.oceanRiftWidth, cleanMid = true}
	end
	
	local landInColumn = {}	
	for x = 0, mapW - 1 do
		landInColumn[x]			= 0
		mg.elevationRect[x]		= {}
		mg.elevationRect[x][-1]	= 0
		for y = 0, mapH - 1 do
			mg.elevationRect[x][y] = 0
		end
	end
	
	-- scan plots
	local totalLand = 0
	for x = 0, mapW - 1 do
		for y = 0, mapH - 1 do
			plot = Map.GetPlot(x, y)
			
			if not Plot_IsWater(plot, true) then
				totalLand = totalLand + 1
				landInColumn[x] = landInColumn[x] + 1
			end
			
			-- elevation in a size-wide rectangle
			local elevation = Plot_GetElevation(plot, false)
			for x2 = 0 - math.ceil(2 + mg.oceanRiftWidth), 1 + math.floor(2 + mg.oceanRiftWidth) do
				xOffset = (x + x2) % mapW
				mg.elevationRect[xOffset][-1] = mg.elevationRect[xOffset][-1] + elevation
				mg.elevationRect[xOffset][y] = mg.elevationRect[xOffset][y] + elevation
			end
		end
	end
	
	-- find biggest ocean (usually Pacific)
	local lowestElevation	= 0
	local startX			= 0
	local startY			= math.floor(mapH/2)
	for x = 0, mapW - 1 do
		local elevation = mg.elevationRect[xOffset][-1]
		if elevation < lowestElevation then
			lowestElevation = elevation
			startX = x
		end
	end
	
	table.insert(mg.oceanRiftMidlines, startX)
	if mapW < 60 then
		log:Debug("CreateVerticalOceans: Creating Atlantic at x=%s", startX)
		CreateAtlantic(startX)
		return
	elseif oOceanRifts == 1 or oOceanRifts == 3 then
		-- PA or PP
		log:Debug("CreateVerticalOceans: Creating Pacific  at x=%s", startX)
		CreatePacific(startX)
	elseif oOceanRifts == 2 then
		-- AA
		log:Debug("CreateVerticalOceans: Creating Atlantic at x=%s", startX)
		CreateAtlantic(startX)
	elseif oOceanRifts == 4 or oOceanRifts == 5 then
		-- 1 or 2 random
		if 50 >= Map.Rand(100, "Random ocean rift - Lua") then
			log:Debug("CreateVerticalOceans: Creating Pacific  at x=%s (Random)", startX)
			CreatePacific(startX)
		else
			log:Debug("CreateVerticalOceans: Creating Atlantic at x=%s (Random)", startX)
			CreateAtlantic(startX)
		end
	end
	
	
	if oOceanRifts == 5 then
		-- Only one rift
		return
	end
	
	-- find median land (usually place for Atlantic)
	local startX	= 0
	local sumLand	= 0
	local offsetAtlanticPercent	= (0 == Map.Rand(2, "Atlantic Offset - Lua")) and mg.offsetAtlanticPercent or 1 - mg.offsetAtlanticPercent
	for x = 0, mapW - 1 do
		local xOffset = (x + startX) % mapW
		sumLand = sumLand + landInColumn[xOffset]
		if sumLand > offsetAtlanticPercent * totalLand then
			startX = xOffset
			break
		end
	end
	
	log:Debug("totalLand=%4f sumElevation=%4f", totalLand, sumLand)
	
	table.insert(mg.oceanRiftMidlines, startX)
	if oOceanRifts == 1 or oOceanRifts == 2 then
		-- PA or AA
		log:Debug("CreateVerticalOceans: Creating Atlantic at x=%s", startX)
		CreateAtlantic(startX)
	elseif oOceanRifts == 3 then
		-- PP
		log:Debug("CreateVerticalOceans: Creating Pacific  at x=%s", startX)
		CreatePacific(startX)
	elseif oOceanRifts == 4 then
		-- 2 random
		if 50 >= Map.Rand(100, "Random ocean rift - Lua") then
			log:Debug("CreateVerticalOceans: Creating Pacific  at x=%s (Random)", startX)
			CreatePacific(startX)
		else
			log:Debug("CreateVerticalOceans: Creating Atlantic at x=%s (Random)", startX)
			CreateAtlantic(startX)
		end
	end
end

function CreateOceanRift(args)
	log:Debug("CreateOceanRift")
	for k, v in pairs(args) do
		log:Debug("%s = %s", k, v)
	end
	local x			= args.x or 0
	local y			= args.y or 0
	local midline	= args.midline or x
	local direction	= args.direction or mg.N
	local totalSize	= args.totalSize or 3
	local oceanSize	= args.oceanSize or mg.oceanRiftWidth
	local bulge		= args.bulge or 0
	local curve		= args.curve or 0
	local fill		= args.fill
	local cleanMid	= args.cleanMid
	
	local plots = {}
	if bulge ~= 0 then
		-- see which curve direction fits the land better
			  plots  = GetRiftPlots(x-2, midline-2, y, direction, totalSize, oceanSize, bulge, curve)
		local plotsB = GetRiftPlots(x+2, midline+2, y, direction, totalSize, oceanSize, bulge, curve)
		
		if GetMatchingPlots(plotsB) > GetMatchingPlots(plots) then
			plots = DeepCopy(plotsB)
		end
	elseif curve ~= 0 then
		-- see which curve direction fits the land better
			  plots  = GetRiftPlots(x-1, midline-1, y, direction, totalSize, oceanSize, bulge, curve)
		local plotsB = GetRiftPlots(x+1, midline+1, y, direction, totalSize, oceanSize, bulge, -1 * curve)
		
		if GetMatchingPlots(plotsB) > GetMatchingPlots(plots) then
			plots = DeepCopy(plotsB)
		end
	else
		plots = GetRiftPlots(x, midline, y, direction, totalSize, oceanSize, bulge, curve)
	end
	
	for plotID, v in pairs(plots) do
		log:Trace("oceanRiftPlots %s, %s, %s", v.plot:GetX(), v.plot:GetY(), v.strip)
		if (fill and v.strip <= 0) or IsBetween(0, v.strip, oceanSize) then
			mg.oceanRiftPlots[plotID] = {
				isWater = true,
				terrainID = TerrainTypes.TERRAIN_OCEAN
			}
		elseif v.strip == -1 or v.strip == oceanSize+1 then
			if (cleanMid and v.strip <= 0) then
				mg.oceanRiftPlots[plotID] = {
					isWater = true,
					terrainID = TerrainTypes.TERRAIN_OCEAN
				}
			elseif 50 >= Map.Rand(100, "Ocean rift ocean/coast - Lua") then
				mg.oceanRiftPlots[plotID] = {
					isWater = true,
					terrainID = TerrainTypes.TERRAIN_OCEAN
				}
			else
				mg.oceanRiftPlots[plotID] = mg.oceanRiftPlots[plotID] or {
					isWater = true,
					terrainID = TerrainTypes.TERRAIN_COAST
				}
			end
		elseif v.strip == -2 or v.strip == oceanSize+2 then
			if 50 >= Map.Rand(100, "Ocean rift coast/land - Lua") then
				if (cleanMid and v.strip <= 0) then
					mg.oceanRiftPlots[plotID] = {
						isWater = true,
						terrainID = TerrainTypes.TERRAIN_OCEAN
					}
				else
					mg.oceanRiftPlots[plotID] = mg.oceanRiftPlots[plotID] or {
						isWater = true,
						terrainID = TerrainTypes.TERRAIN_COAST
					}
				end
			else
				mg.oceanRiftPlots[plotID] = mg.oceanRiftPlots[plotID] or {
					isWater = false,
					terrainID = TerrainTypes.TERRAIN_COAST
				}
			end	
		else
			
		end
	end
	

	function GetMatchingPlots(plots)
		local nicePlots = 0
		for plotID, v in pairs(plots) do
			if (fill and v.strip <= 0) or IsBetween(0, v.strip, oceanSize) or v.strip == -1 or v.strip == oceanSize+1 then
				-- turns plots to water
				if Plot_IsWater(v.plot, true) then
					nicePlots = nicePlots + 1
				else
					nicePlots = nicePlots - 1
				end
			elseif v.strip == -2 or v.strip == oceanSize+2 then
				-- 50% chance turns to water
				if Plot_IsWater(v.plot, true) then
					nicePlots = nicePlots + 1 -- okay if already water
				else
					nicePlots = nicePlots - 0.5 -- destroys land half the time
				end
			else
				-- encourage land in center area
				if Plot_IsWater(v.plot, true) then
					nicePlots = nicePlots - 0.1
				else
					nicePlots = nicePlots + 0.1
				end
			end
		end
		return nicePlots
	end
end

function GetRiftPlots(x, midline, y, direction, totalSize, oceanSize, bulge, curve)
	local mapW, mapH = Map.GetGridSize()
	local riftPlots = {}
	
	log:Debug("x=%-3s, y=%-3s Creating %s ocean rift with midline %s curve %s on map size (%s, %s)", x, y, mg.directionNames[direction], midline, curve, mapW, mapH)
	
	local nextDirA		= 0
	local nextDirB		= 0
	
	local curveNormal = (50 >= Map.Rand(100, "Ocean Rift Curve - Lua"))
	
	function GetMidX(y)
		if curve == 0 then
			return midline
		end
		log:Trace("%s * GetSinCurve(%s, %s) = %s", curve, y, mapH, Round(curve * GetSinCurve(y, mapH, 3)))
		return (midline + Round(curve * GetSinCurve(y, mapH, 3))) % mapW
	end
	
	if direction == mg.N then
		nextDirA = mg.NE
		nextDirB = mg.NW
	elseif direction == mg.S then
		nextDirA = mg.SE
		nextDirB = mg.SW
	elseif direction == mg.E then
		nextDirA = mg.E
		nextDirB = mg.E
	elseif direction == mg.W then
		nextDirA = mg.W
		nextDirB = mg.W
	else
		print("Invalid direction %s for CreateOceanRift")
		return
	end
	
	
	plot = Map.GetPlot(x, y)
	local attempts = 0
	while plot and attempts < mapW do
		local foundNewPlots	= false
		local plotID		= Plot_GetID(plot)
		local radius		= math.max(0, Round((totalSize-1)/2 + bulge/2 * GetBellCurve(y, mapH)))
		local extraRadius	= oceanSize + 2
		
		if direction == mg.E or direction == mg.W then
			log:Trace("x=%-3s, y=%-3s radius=%-3s extraRadius=%-3s", x, y, radius, extraRadius)
		else
			log:Trace("x=%-3s, y=%-3s radius=%-3s extraRadius=%-3s midX=%-3s", x, y, radius, extraRadius, GetMidX(y))
		end
		
		for nearPlot, nearDistance in Plot_GetPlotsInCircle(plot, 0, radius + extraRadius) do
			if not mg.oceanRiftPlots[nearPlotID] then
				local nearPlotID = Plot_GetID(nearPlot)
				if not riftPlots[nearPlotID] then
					riftPlots[nearPlotID] = {plot=nearPlot, minDistance=999, strip=0}
				end
				if nearDistance < riftPlots[nearPlotID].minDistance then
					foundNewPlots = true
					riftPlots[nearPlotID].minDistance = nearDistance
					riftPlots[nearPlotID].strip = nearDistance - radius
				end
				--[[
				log:Trace("%s, %s, %s, %s, %s",
					nearPlot:GetX(),
					nearPlot:GetY(),
					nearDistance,
					riftPlots[nearPlotID].minDistance,
					riftPlots[nearPlotID].strip
				)
				--]]
			end
		end
		
		local nextPlotA  	= Map.PlotDirection(x, y, nextDirA)
		local nextPlotB 	= Map.PlotDirection(x, y, nextDirB)
		if not nextPlotA or not nextPlotB then
			-- reached edge of map
			--print("End ocean rift")
			return riftPlots
		end
		
		
		local oddsA = 0.50
		if nextPlotA == nextPlotB then		
			plot = nextPlotA
		else
			local distanceA = Map.PlotDistance(nextPlotA:GetX(), y, GetMidX(y), y)
			local distanceB = Map.PlotDistance(nextPlotB:GetX(), y, GetMidX(y), y)
			if distanceA < distanceB then
				oddsA = oddsA + (0.50 * distanceA / mg.oceanMaxWander)
			elseif distanceA > distanceB then
				oddsA = oddsA - (0.50 * distanceA / mg.oceanMaxWander)
			end
			
			--[[
			local nextElevationA = mg.elevationRect[nextPlotA:GetX()][nextPlotA:GetY()]
			local nextElevationB = mg.elevationRect[nextPlotB:GetX()][nextPlotB:GetY()]
			
			if nextElevationA < nextElevationB then
				oddsA = oddsA + mg.oceanElevationWeight
			elseif nextElevationA > nextElevationB then
				oddsA = oddsA - mg.oceanElevationWeight
			end
			--]]
			
			local randomPercent = 0.5--PWRand()
			log:Trace("distance A=%s B=%s oddsA=%.2f rand=%.2f", distanceA, distanceB, Round(oddsA, 2), Round(randomPercent, 2))
			if oddsA >= randomPercent then
				plot = nextPlotA
				log:Trace("choose A")
			else
				plot = nextPlotB
				log:Trace("choose B")
			end
		end
			
		x = plot:GetX()
		y = plot:GetY()
		attempts = attempts + 1
	end
	return riftPlots
end

function SetOceanRiftElevations(elevationMap)
	--
	for plotID, data in pairs(mg.oceanRiftPlots) do
		if data.isWater then
			local plot = Map.GetPlotByIndex(plotID)
			elevationMap.data[elevationMap:GetIndex(plot:GetX(), plot:GetY())] = 0
		end
	end
	--]]
	return elevationMap
end

function SetOceanRiftPlots()
	print("SetOceanRiftPlots")
	for plotID, data in pairs(mg.oceanRiftPlots) do
		local plot = Map.GetPlotByIndex(plotID)
		--print(string.format("oceanRiftPlots plotID=%-4s isWater=%-6s terrainID=%-3s", plotID, tostring(data.isWater), data.terrainID))
		if data.isWater then
			if not plot:IsWater() or data.terrainID == TerrainTypes.TERRAIN_OCEAN then
				plot:SetTerrainType(data.terrainID, true, true)
			end
		end
	end
	--
	for plotID, data in pairs(mg.oceanRiftPlots) do
		local plot = Map.GetPlotByIndex(plotID)
		if plot:GetTerrainType() == TerrainTypes.TERRAIN_COAST then
			local foundLand = false
			for nearPlot in Plot_GetPlotsInCircle(plot, 1, 2) do
				if not Plot_IsWater(nearPlot) then
					foundLand = true
					break
				end
			end
			if not foundLand then
				plot:SetTerrainType(TerrainTypes.TERRAIN_OCEAN, true, true)
			end
		elseif plot:GetTerrainType() == TerrainTypes.TERRAIN_OCEAN then
			for nearPlot in Plot_GetPlotsInCircle(plot, 1, 1) do
				if not Plot_IsWater(nearPlot) then
					plot:SetTerrainType(TerrainTypes.TERRAIN_COAST, true, true)
					break
				end
			end
		end
	end
	--]]
end










--
-- Generate Features
--

function AddFeatures()
	print("Adding Features CommunitasMap")
	local mapW, mapH = Map.GetGridSize()
	Map.RecalculateAreas()	
	RestoreLakes()
	
	local timeStart = debugTime and os.clock() or 0
	local desertThreshold	= rainfallMap:FindThresholdFromPercent(mg.desertPercent,false,false)
	local plainsThreshold  	= rainfallMap:FindThresholdFromPercent(mg.plainsPercent,false,false)
	local wetThreshold	= rainfallMap:FindThresholdFromPercent(mg.grassPercent,false,false)
	
	for iteration = 0 , mg.featureIterations - 1 do		-- repeat this featureIterations no. of times
		for plotID, plot in Plots(Shuffle) do
			Plot_AddMainFeatures(plot,desertThreshold, plainsThreshold,wetThreshold,iteration)
		end
	end
	local potentialForestPlots = {}
	for plotID, plot in Plots(Shuffle) do
		if not plot:IsWater() then
			PlacePossibleOasis(plot)
			if 		(plot) then
				--table.insert(potentialForestPlots, plot)
			end
		end
		--PlacePossibleIce(plot)
	end
	--[[
	for _, plot in pairs(potentialForestPlots) do
		plot:SetFeatureType(FeatureTypes.FEATURE_FOREST, -1)
	end
	--]]
	AddIsles()
	--ConnectTerraContinents()
	
	if debugTime then print(string.format("%5s ms, AddFeatures %s", math.floor((os.clock() - timeStart) * 1000), "End")) end
end

function Plot_AddMainFeatures(plot, desertThreshold, plainsThreshold, wetThreshold,iteration)
	local x, y					= plot:GetX(), plot:GetY()
	local i						= elevationMap:GetIndex(x,y)
	local mapW, mapH			= Map.GetGridSize()
	local plotTerrainID 		= plot:GetTerrainType()
	local rain                      = rainfallMap.data[i]
	local temp                      = temperatureMap.data[i]
	
	if plot:IsWater() or plot:IsMountain() then
		return
	end
	if iteration == 0 then		-- these only need to happen once
	-- Set desert rivers to floodplains
		if plot:CanHaveFeature(FeatureTypes.FEATURE_FLOOD_PLAINS) then
			plot:SetFeatureType(FeatureTypes.FEATURE_FLOOD_PLAINS,-1)
			return
		end
	
	-- Micro-climates for tiny volcanic islands 
		if not plot:IsMountain() and (plotTerrainID == TerrainTypes.TERRAIN_PLAINS or plotTerrainID == TerrainTypes.TERRAIN_GRASS or plotTerrainID == TerrainTypes.TERRAIN_TUNDRA) then
			local areaSize = plot:Area():GetNumTiles()
			if areaSize <= 5 and (6 - areaSize) >= Map.Rand(5, "Add Island Features - Lua") then
				local zone = elevationMap:GetZone(y)
				if temperatureMap.data[i] > mg.desertMinTemperature then
					plot:SetFeatureType(FeatureTypes.FEATURE_JUNGLE,-1)
					return
				elseif temperatureMap.data[i] > mg.snowTemperature then
					plot:SetFeatureType(FeatureTypes.FEATURE_FOREST,-1)
					return
				end
			end
		end
	end
	--check jungle
	if IsGoodJunglePlot(plot,wetThreshold,plainsThreshold,desertThreshold,rain,temp) then
		plot:SetFeatureType(FeatureTypes.FEATURE_JUNGLE,-1)
		return
	end	
	
	--check forest
	if IsGoodForestPlot(plot,wetThreshold,plainsThreshold,desertThreshold,rain,temp) then
		plot:SetFeatureType(FeatureTypes.FEATURE_FOREST,-1)
		return
	end

	-- Check marsh
	if temperatureMap.data[i] > mg.snowTemperature and IsGoodMarshPlot(plot,wetThreshold,plainsThreshold,desertThreshold,rain,temp) then
		plot:SetPlotType(PlotTypes.PLOT_LAND,false,false)
		if (plotTerrainID == TerrainTypes.TERRAIN_TUNDRA) or (plotTerrainID == TerrainTypes.TERRAIN_DESERT) then
			plot:SetTerrainType(TerrainTypes.TERRAIN_GRASS, true, true)
		end
		plot:SetFeatureType(FeatureTypes.FEATURE_MARSH,-1)
		return
	end


	
end
function IsGoodMarshPlot(plot,wetThreshold,plainsThreshold,desertThreshold,rain,temp)
	local odds = 0
	

	if plot:GetPlotType() ~= PlotTypes.PLOT_LAND then
		return false
	end
	
	if plot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE then
		return false
	end






	local possibleMarsh = 0		-- Track number of nearby possible marsh plots
	local nearbyMarsh = 0 		-- Track number of nearby marsh plots (including lakes)
	local nearMouth = false		-- track whether near a river end (lake or ocean)
	
	for nearPlot in Plot_GetPlotsInCircle(plot, 0, 1) do
		local nearTerrainID = nearPlot:GetTerrainType()
		if Contains(mg.lakePlots, nearPlot) then
			odds = odds + 2 * mg.marshPercent
			if plot:IsRiverSide() then
				nearMouth = true
			end	
		end 
		if nearPlot:GetPlotType() == PlotTypes.PLOT_OCEAN then
			if plot:IsRiverSide() then
				nearMouth = true
			end
		end
		if nearPlot:GetPlotType() == PlotTypes.PLOT_LAND then
			if nearPlot:GetFeatureType() == FeatureTypes.FEATURE_MARSH then
				nearbyMarsh = nearbyMarsh + 1
			end
			possibleMarsh = possibleMarsh + 1
		end
	end
	
	odds = odds + mg.marshPercent * mg.marshClumpingModifier * (nearbyMarsh / math.max(1,possibleMarsh))

	if plot:IsRiverSide() then
		odds = odds + 2 * mg.marshPercent
	end

	if rain > wetThreshold then
		odds = odds +  mg.marshPercent
	end
	if rain < desertThreshold then
		odds = odds * 0.5
	end
	if temp < mg.tundraTemperature then
		odds = odds * 0.5
	elseif temp > mg.jungleMinTemperature then
		odds = odds * 0.6
	end
	if nearMouth then
		odds = odds * 2
	end


	return odds >= PWRand()

end

function IsGoodJunglePlot(plot,wetThreshold,plainsThreshold,desertThreshold,rain,temp)
	local odds = 0
	if temp < mg.desertMinTemperature then
		return false
	end
	if rain < desertThreshold then
		return false
	end

	local possibleJungle = 0		-- Track number of nearby possible jungle plots
	local nearbyJungle = 0 			-- Track number of nearby jungle plots

	for nearPlot in Plot_GetPlotsInCircle(plot, 0, 2) do
		local nearTerrainID = nearPlot:GetTerrainType()
		if nearPlot:GetPlotType() == PlotTypes.PLOT_LAND or nearPlot:GetPlotType() == PlotTypes.PLOT_HILLS then
			if nearPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT then
				odds = odds - mg.junglePercent
			end
			if nearPlot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE then
				nearbyJungle = nearbyJungle + 1
			end
			possibleJungle = possibleJungle + 1
		end
	end

	odds = odds + mg.jungleClumpingModifier * mg.junglePercent * (nearbyJungle / math.max(1,possibleJungle))	

	if temp > mg.jungleMinTemperature then
		if rain > plainsThreshold then
			odds = odds + mg.junglePercent
		end
		if rain > wetThreshold then
			odds = odds + mg.junglePercent
		end
	end

	return odds >= PWRand()

end

function IsGoodForestPlot(plot,wetThreshold,plainsThreshold,desertThreshold,rain,temp)
	local odds = 0

	if plot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT or plot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW then
		return false
	end

	if plot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE then
		return false
	end

	if plot:GetFeatureType() == FeatureTypes.FEATURE_MARSH then
		return false
	end

	local possibleForest = 0		-- Track number of nearby possible forest plots
	local nearbyForest = 0 			-- Track number of nearby forest plots

	for nearPlot in Plot_GetPlotsInCircle(plot, 0, 2) do
		if nearPlot:GetPlotType() == PlotTypes.PLOT_LAND or nearPlot:GetPlotType() == PlotTypes.PLOT_HILLS then
			if nearPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT then
				nearbyForest = nearbyForest - 1
			end
			if nearPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW then
				nearbyForest = nearbyForest - 0.3
			end
			if nearPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST then
				nearbyForest = nearbyForest + 1
			end
			possibleForest = possibleForest + 1
		end
	end

	odds = odds + mg.forestClumpingModifier * mg.forestPercent * (nearbyForest / math.max(1,possibleForest))	

	if plot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA then
		if plot:GetPlotType() == PlotTypes.PLOT_LAND then
			odds = odds + mg.forestTundraPercent
		elseif plot:GetPlotType() == PlotTypes.PLOT_HILLS then
			odds = odds + 0.6 * mg.forestTundraPercent
		end
		return odds >= PWRand()
	end

	if rain < desertThreshold then
		odds = odds * 0.5
	elseif rain < plainsThreshold then
		odds = odds +  0.8 * mg.forestPercent
	else
		odds = odds +  2 * mg.forestPercent
	end
	if temp > mg.jungleMinTemperature then
		odds = odds * 0.4
	end

	return odds >= PWRand()

end

function IsBarrenDesert(plot)
	return plot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT and not plot:IsMountain() and plot:GetFeatureType() == FeatureTypes.NO_FEATURE
end

function PlacePossibleOasis(plot)
	local x, y = plot:GetX(), plot:GetY()
	if not plot:CanHaveFeature(FeatureTypes.FEATURE_OASIS) then
		return
	end
	
	local odds = 0
	for nearPlot, distance in Plot_GetPlotsInCircle(plot, 3) do
		local distance = distance or 1
		local featureID = nearPlot:GetFeatureType()
		
		if featureID == FeatureTypes.FEATURE_OASIS then
			if distance <= 2 then
				-- at least 2 tile spacing between oases
				return
		
		end
			odds = odds - 200 / distance
		end
		
		if featureID == FeatureTypes.NO_FEATURE and not nearPlot:IsFreshWater() then
			if nearPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT then
				odds = odds + 11 / distance
			elseif nearPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS then
				odds = odds + 2 / distance
			end
		else
			odds = odds - 6 / distance
		end
	end
	
	if odds >= Map.Rand(100, "PlacePossibleOasis - Lua") then
		plot:SetFeatureType(FeatureTypes.FEATURE_OASIS, -1)
	end
end

function IsGoodExtraForestTile(plot)	
	local x, y		= plot:GetX(), plot:GetY()	
	local odds		= mg.forestRandomPercent
	local terrainID = plot:GetTerrainType() 
	local resID		= plot:GetResourceType()
	if not plot:CanHaveFeature(FeatureTypes.FEATURE_FOREST) then
		return false
	end
	
	if terrainID == TerrainTypes.TERRAIN_TUNDRA then
		if resID ~= -1 then
			return true
		end
		if plot:IsFreshWater() then
			odds = odds + mg.featureWetVariance
		end
	end
	
	-- Avoid filling flat holes of tropical areas, which are too dense already
	if not plot:IsHills() and Contains(mg.tropicalPlots, plot) then
		odds = odds - 0.30
	end
	
	for nearPlot in Plot_GetPlotsInCircle(plot, 1, 1) do
		local nearTerrainID = nearPlot:GetTerrainType()
		local nearFeatureID = nearPlot:GetFeatureType()
		
		if nearPlot:IsMountain() then
			-- do nothing
		elseif nearPlot:IsHills() then
			-- Region already has enough production and rough terrain
			odds = odds - 0.10
		elseif nearTerrainID == TerrainTypes.TERRAIN_SNOW then
			-- Help extreme polar regions
			odds = odds + 0.2
		elseif nearTerrainID == TerrainTypes.TERRAIN_TUNDRA then
			odds = odds + 0.1
		elseif terrainID == TerrainTypes.TERRAIN_TUNDRA and Plot_IsWater(nearPlot) then
			odds = odds + 0.1
		end	
		
		-- Avoid tropics
		if Contains(mg.tropicalPlots, nearPlot) then
			odds = odds - 0.10
		end
		
		-- Too dry
		if nearTerrainID == TerrainTypes.TERRAIN_DESERT then
			odds = odds - 0.20
		end
	end
	
	if 100 * mg.featurePercent * math.min(1, odds) >= Map.Rand(100, "Add Extra Forest - Lua") then
		--plot:SetFeatureType(FeatureTypes.FEATURE_FOREST, -1)
		return true
	end
	
	return false
end

function PlacePossibleIce(plot)
	local mapW, mapH = Map.GetGridSize()
	local x, y = plot:GetX(), plot:GetY()
	
	local latitude = (temperatureMap:GetLatitudeForY(y))
	local lowestIce = mg.iceLatitude
	local odds = 100 
	if y < mapH / 2 then
		return
	end
	if 0 < y and y < mapH - 2 then
		odds = 100 * (latitude - lowestIce) / (mg.topLatitude - lowestIce)
	end
	
	--if not Cep then
		local nearLand = false
		for nearPlot in Plot_GetPlotsInCircle(plot, 1) do
			if not nearPlot:IsWater() then
				odds = odds
				--return
			end
		end
	--end
	
	if odds >= Map.Rand(100, "PlacePossibleIce - Lua") then
		if not plot:IsWater() then
			plot:SetPlotType(PlotTypes.PLOT_LAND,false,false)
			plot:SetTerrainType(TerrainTypes.TERRAIN_SNOW, false, true)
		end
		plot:SetFeatureType(FeatureTypes.FEATURE_ICE,-1)

			
		--[[
		if y < 5 then
			log:Debug("Ice at y=%s odds=%s latitude=%s lowestIce=%s topLatitude=%s",
				y,
				odds,
				latitude,
				lowestIce,
				mg.topLatitude
			)
		end
		--]]
		--[[
		for nearPlot in Plot_GetPlotsInCircle(plot, 1) do
			if nearPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS then
				--nearPlot:SetTerrainType(TerrainTypes.TERRAIN_TUNDRA, false, true)
				if nearPlot:GetFeatureType() == FeatureTypes.FEATURE_MARSH then
					--nearPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1)
				end
			end
		end
		--]]
	end
end

function AddIsles()
	-- This function added Feb 2011 by Bob Thomas.
	-- Adds the new feature Isles in to the game, for oceanic maps.
	local iW, iH = Map.GetGridSize()
	local biggest_ocean = Map.FindBiggestArea(true)
	local iNumBiggestOceanPlots = 0
	
	if biggest_ocean ~= nil then
		iNumBiggestOceanPlots = biggest_ocean:GetNumTiles()
	end
	if iNumBiggestOceanPlots <= (iW * iH) / 4 then -- No major oceans on this world.
		return
	end
	
	-- World has oceans, proceed with adding Isles.
	local iNumIslesPlaced = 0
	local direction_types = {
		mg.NE,
		mg.E,
		mg.SE,
		mg.SW,
		mg.W,
		mg.NW
	}
	local numCoast = 0
	local coastID = GameInfo.Terrains.TERRAIN_COAST.ID
	for i, plot in Plots() do
		if plot:GetTerrainType() == coastID then
			numCoast = numCoast + 1
		end
	end
	local isle_target = numCoast * mg.islePercent
	local variance = 25
		  variance = isle_target * (Map.Rand(2 * variance, "Number of Isles to place - LUA") - variance) / 100
	local isle_number = math.floor(isle_target + variance)
	local isleInfo = GameInfo.Features.FEATURE_ATOLL
	local isleID = isleInfo.ID

	-- Generate candidate plot lists.
	local temp_one_tile_island_list, temp_alpha_list, temp_beta_list = {}, {}, {}
	local temp_gamma_list, temp_delta_list, temp_epsilon_list = {}, {}, {}
	for y = 0, iH - 1 do
		for x = 0, iW - 1 do
			local i = y * iW + x + 1 -- Lua tables/lists/arrays start at 1, not 0 like C++ or Python
			local plot = Map.GetPlot(x, y)
			local plotType = plot:GetPlotType()
			local featureType = plot:GetFeatureType()
			local terrainType = plot:GetTerrainType()
			if terrainType == TerrainTypes.TERRAIN_COAST and featureType ~= FeatureTypes.FEATURE_ICE and not plot:IsLake() then
				-- Check all near plots and identify near landmasses.
				local iNumLandAdjacent, biggest_adj_area = 0, 0
				local bPlotValid = true
				for loop, direction in ipairs(direction_types) do
					local nearPlot = Map.PlotDirection(x, y, direction)
					if nearPlot ~= nil then
						local nearPlotType = nearPlot:GetPlotType()
						if not islesNearIce then
							if nearPlot:GetFeatureType() == FeatureTypes.FEATURE_ICE then
								bPlotValid = false
							elseif nearPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW then
								bPlotValid = false
							elseif nearPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA then
								bPlotValid = false
							end
						end
						if nearPlotType ~= PlotTypes.PLOT_OCEAN then -- Found land.
							iNumLandAdjacent = iNumLandAdjacent + 1
							if nearPlotType == PlotTypes.PLOT_LAND or nearPlotType == PlotTypes.PLOT_HILLS then
								local iArea = nearPlot:GetArea()
								local adjArea = Map.GetArea(iArea)
								local iNumAreaPlots = adjArea:GetNumTiles()
								if iNumAreaPlots > biggest_adj_area then
									biggest_adj_area = iNumAreaPlots
								end
							end
						end
					end
				end
				-- Only plots with a single land plot near can be eligible.
				if bPlotValid and iNumLandAdjacent <= 1 then
					--if biggest_adj_area >= 152 then
						-- discard this site
					if biggest_adj_area >= 82 then
						table.insert(temp_epsilon_list, i)
					elseif biggest_adj_area >= 34 then
						table.insert(temp_delta_list, i)
					elseif biggest_adj_area >= 16 or biggest_adj_area == 0 then
						table.insert(temp_gamma_list, i)
					elseif biggest_adj_area >= 6 then
						table.insert(temp_beta_list, i)
					elseif biggest_adj_area >= 1 then
						table.insert(temp_alpha_list, i)
					else -- Unexpected result
						--print("** Area Plot Count =", biggest_adj_area)
					end
				end
			end
		end
	end
	local alpha_list = GetShuffledCopyOfTable(temp_alpha_list)
	local beta_list = GetShuffledCopyOfTable(temp_beta_list)
	local gamma_list = GetShuffledCopyOfTable(temp_gamma_list)
	local delta_list = GetShuffledCopyOfTable(temp_delta_list)
	local epsilon_list = GetShuffledCopyOfTable(temp_epsilon_list)

	-- Determine maximum number able to be placed, per candidate category.
	local max_alpha = math.ceil(table.maxn(alpha_list) )--* .25)
	local max_beta = math.ceil(table.maxn(beta_list) )--* .2)
	local max_gamma = math.ceil(table.maxn(gamma_list) )--* .25)
	local max_delta = math.ceil(table.maxn(delta_list) )--* .3)
	local max_epsilon = math.ceil(table.maxn(epsilon_list) )--* .4)
	
	-- Place Isles.
	local plotIndex
	local i_alpha, i_beta, i_gamma, i_delta, i_epsilon = 1, 1, 1, 1, 1		
	local passNum = 0	
	
	while (iNumIslesPlaced < isle_number) and (passNum < isle_number * 5) do
		local able_to_proceed = true
		local diceroll = 1 + Map.Rand(100, "Isle Placement Type - LUA")
		if diceroll <= 30 and max_alpha > 0 then
			plotIndex = alpha_list[i_alpha]
			i_alpha = i_alpha + 1
			max_alpha = max_alpha - 1
			--print("- Alpha site chosen")
		elseif diceroll <= 55 then
			if max_beta > 0 then
				plotIndex = beta_list[i_beta]
				i_beta = i_beta + 1
				max_beta = max_beta - 1
				--print("- Beta site chosen")
			elseif max_alpha > 0 then
				plotIndex = alpha_list[i_alpha]
				i_alpha = i_alpha + 1
				max_alpha = max_alpha - 1
				--print("- Alpha site chosen")
			else -- Unable to place this Isle
				--print("-") print("* Isle #", loop, "was unable to be placed.")
				able_to_proceed = false
			end
		elseif diceroll <= 72 then
			if max_gamma > 0 then
				plotIndex = gamma_list[i_gamma]
				i_gamma = i_gamma + 1
				max_gamma = max_gamma - 1
				--print("- Gamma site chosen")
			elseif max_beta > 0 then
				plotIndex = beta_list[i_beta]
				i_beta = i_beta + 1
				max_beta = max_beta - 1
				--print("- Beta site chosen")
			elseif max_alpha > 0 then
				plotIndex = alpha_list[i_alpha]
				i_alpha = i_alpha + 1
				max_alpha = max_alpha - 1
				--print("- Alpha site chosen")
			else -- Unable to place this Isle
				--print("-") print("* Isle #", loop, "was unable to be placed.")
				able_to_proceed = false
			end
		elseif diceroll <= 86 then
			if max_delta > 0 then
				plotIndex = delta_list[i_delta]
				i_delta = i_delta + 1
				max_delta = max_delta - 1
				--print("- Delta site chosen")
			elseif max_gamma > 0 then
				plotIndex = gamma_list[i_gamma]
				i_gamma = i_gamma + 1
				max_gamma = max_gamma - 1
				--print("- Gamma site chosen")
			elseif max_beta > 0 then
				plotIndex = beta_list[i_beta]
				i_beta = i_beta + 1
				max_beta = max_beta - 1
				--print("- Beta site chosen")
			elseif max_alpha > 0 then
				plotIndex = alpha_list[i_alpha]
				i_alpha = i_alpha + 1
				max_alpha = max_alpha - 1
				--print("- Alpha site chosen")
			else -- Unable to place this Isle
				--print("-") print("* Isle #", loop, "was unable to be placed.")
				able_to_proceed = false
			end
		else
			if max_epsilon > 0 then
				plotIndex = epsilon_list[i_epsilon]
				i_epsilon = i_epsilon + 1
				max_epsilon = max_epsilon - 1
				--print("- Epsilon site chosen")
			elseif max_delta > 0 then
				plotIndex = delta_list[i_delta]
				i_delta = i_delta + 1
				max_delta = max_delta - 1
				--print("- Delta site chosen")
			elseif max_gamma > 0 then
				plotIndex = gamma_list[i_gamma]
				i_gamma = i_gamma + 1
				max_gamma = max_gamma - 1
				--print("- Gamma site chosen")
			elseif max_beta > 0 then
				plotIndex = beta_list[i_beta]
				--print("- Beta site chosen")
				i_beta = i_beta + 1
				max_beta = max_beta - 1
			elseif max_alpha > 0 then
				plotIndex = alpha_list[i_alpha]
				i_alpha = i_alpha + 1
				max_alpha = max_alpha - 1
				--print("- Alpha site chosen")
			else -- Unable to place this Isle
				--print("-") print("* Isle #", loop, "was unable to be placed.")
				able_to_proceed = false
			end
		end
		if able_to_proceed and plotIndex then
			local x = (plotIndex - 1) % iW
			local y = (plotIndex - x - 1) / iW
			local plot = Map.GetPlot(x, y)
			for _, direction in ipairs(direction_types) do
				local nearPlot = Map.PlotDirection(x, y, direction)
				if nearPlot and nearPlot:GetFeatureType() == isleID and PWRand() >= 0.3 then
					able_to_proceed = false
					--print("Adjacent isle")
					break
				end
			end
			if able_to_proceed then
				plot:SetFeatureType(isleID, -1)
				iNumIslesPlaced = iNumIslesPlaced + 1
			end
		end
		passNum = passNum + 1
	end 
	
	-- Debug report
	print("-")
	print("-                 Isle Target Number: ", isle_number)
	print("-             Number of Isles placed: ", iNumIslesPlaced)
	print("-                           Attempts: ", passNum)
	print("-")	
	print("- Isles placed in Alpha locations   : ", i_alpha - 1)
	print("- Isles placed in Beta locations    : ", i_beta - 1)
	print("- Isles placed in Gamma locations   : ", i_gamma - 1)
	print("- Isles placed in Delta locations   : ", i_delta - 1)
	print("- Isles placed in Epsilon locations : ", i_epsilon - 1)
	--]]
end













--
-- Other Generators

DiffMap = inheritsFrom(FloatMap)
function GenerateDiffMap(width,height,xWrap,yWrap)
	DiffMap = FloatMap:New(width,height,xWrap,yWrap)
	local i = 0
	for y = 0, height - 1,1 do
		for x = 0,width - 1,1 do
			if elevationMap:IsBelowSeaLevel(x,y) then
				DiffMap.data[i] = 0.0
			else
				DiffMap.data[i] = GetDifferenceAroundHex(x,y)
			end
			i=i+1
		end
	end

	DiffMap:Normalize()
	i = 0
	for y = 0, height - 1,1 do
		for x = 0,width - 1,1 do
			if elevationMap:IsBelowSeaLevel(x,y) then
				DiffMap.data[i] = 0.0
			else
				DiffMap.data[i] = DiffMap.data[i] + elevationMap.data[i] * 1.1
			end
			i=i+1
		end
	end

	DiffMap:Normalize()
	return DiffMap
end

function GenerateTwistedPerlinMap(width, height, xWrap, yWrap,minFreq,maxFreq,varFreq)
	local inputNoise = FloatMap:New(width,height,xWrap,yWrap)
	inputNoise:GenerateNoise()
	inputNoise:Normalize()

	local freqMap = FloatMap:New(width,height,xWrap,yWrap)
	for y = 0, freqMap.height - 1 do
		for x = 0,freqMap.width - 1 do
			local i = freqMap:GetIndex(x,y)
			local odd = y % 2
			local xx = x + odd * 0.5
			freqMap.data[i] = GetPerlinNoise(xx,y * mg.YtoXRatio,freqMap.width,freqMap.height * mg.YtoXRatio,varFreq,1.0,0.1,8,inputNoise)
		end
	end
	freqMap:Normalize()
--	freqMap:Save("freqMap.csv")

	local twistMap = FloatMap:New(width,height,xWrap,yWrap)
	for y = 0, twistMap.height - 1 do
		for x = 0,twistMap.width - 1 do
			local i = twistMap:GetIndex(x,y)
			local freq = freqMap.data[i] * (maxFreq - minFreq) + minFreq
			local mid = (maxFreq - minFreq)/2 + minFreq
			local coordScale = freq/mid
			local offset = (1.0 - coordScale)/mid
			--print("1-coordscale = " .. (1.0 - coordScale) .. ", offset = " .. offset)
			local ampChange = 0.85 - freqMap.data[i] * 0.5
			local odd = y % 2
			local xx = x + odd * 0.5
			twistMap.data[i] = GetPerlinNoise(xx + offset,(y + offset) * mg.YtoXRatio,twistMap.width,twistMap.height * mg.YtoXRatio,mid,1.0,ampChange,8,inputNoise)
		end
	end

	twistMap:Normalize()
	--twistMap:Save("twistMap.csv")
	return twistMap
end

function GenerateMountainMap(width,height,xWrap,yWrap,initFreq)
	local timeStart = debugTime and os.clock() or 0
	
	local inputNoise = FloatMap:New(width,height,xWrap,yWrap)
	inputNoise:GenerateBinaryNoise()
	inputNoise:Normalize()
	local inputNoise2 = FloatMap:New(width,height,xWrap,yWrap)
	inputNoise2:GenerateNoise()
	inputNoise2:Normalize()

	local mountainMap = FloatMap:New(width,height,xWrap,yWrap)
	local stdDevMap = FloatMap:New(width,height,xWrap,yWrap)
	local noiseMap = FloatMap:New(width,height,xWrap,yWrap)
	
	if debugTime then print(string.format("%5s ms, GenerateMountainMap %s", math.floor((os.clock() - timeStart) * 1000), "Start")) end
	if debugTime then timeStart = os.clock() end
	for y = 0, mountainMap.height - 1 do
		for x = 0,mountainMap.width - 1 do
			local i = mountainMap:GetIndex(x,y)
			local odd = y % 2
			local xx = x + odd * 0.5
			mountainMap.data[i] = GetPerlinNoise(xx,y * mg.YtoXRatio,mountainMap.width,mountainMap.height * mg.YtoXRatio,initFreq,1.0,0.4,8,inputNoise)
			noiseMap.data[i] = GetPerlinNoise(xx,y * mg.YtoXRatio,mountainMap.width,mountainMap.height * mg.YtoXRatio,initFreq,1.0,0.4,8,inputNoise2)
			stdDevMap.data[i] = mountainMap.data[i]
		end
	end
	if debugTime then print(string.format("%5s ms, GenerateMountainMap %s", math.floor((os.clock() - timeStart) * 1000), "A")) end
	if debugTime then timeStart = os.clock() end
	mountainMap:Normalize()
	if debugTime then print(string.format("%5s ms, GenerateMountainMap %s", math.floor((os.clock() - timeStart) * 1000), "B")) end
	if debugTime then timeStart = os.clock() end
	stdDevMap:Deviate(mg.elevationBlendRange)
	if debugTime then print(string.format("%5s ms, GenerateMountainMap %s", math.floor((os.clock() - timeStart) * 1000), "C")) end
	if debugTime then timeStart = os.clock() end
	stdDevMap:Normalize()
	--stdDevMap:Save("stdDevMap.csv")
	--mountainMap:Save("mountainCloud.csv")
	noiseMap:Normalize()
	--noiseMap:Save("noiseMap.csv")
	
	if debugTime then print(string.format("%5s ms, GenerateMountainMap %s", math.floor((os.clock() - timeStart) * 1000), "D")) end
	if debugTime then timeStart = os.clock() end

	local moundMap = FloatMap:New(width,height,xWrap,yWrap)
	for y = 0, mountainMap.height - 1 do
		for x = 0,mountainMap.width - 1 do
			local i = mountainMap:GetIndex(x,y)
			local val = mountainMap.data[i]
			moundMap.data[i] = (math.sin(val*math.pi*2-math.pi*0.5)*0.5+0.5) * GetAttenuationFactor(mountainMap,x,y)
			if val < 0.5 then
				val = val^1 * 4
			else
				val = (1 - val)^1 * 4
			end
			--mountainMap.data[i] = val
			mountainMap.data[i] = moundMap.data[i]
		end
	end
	mountainMap:Normalize()
	--mountainMap:Save("premountMap.csv")
	--moundMap:Save("moundMap.csv")

	for y = 0, mountainMap.height - 1 do
		for x = 0,mountainMap.width - 1 do
			local i = mountainMap:GetIndex(x,y)
			local val = mountainMap.data[i]
			--mountainMap.data[i] = (math.sin(val * 2 * math.pi + math.pi * 0.5)^8 * val) + moundMap.data[i] * 2 + noiseMap.data[i] * 0.6
			mountainMap.data[i] = (math.sin(val * 3 * math.pi + math.pi * 0.5)^16 * val)^0.5
			if mountainMap.data[i] > 0.2 then
				mountainMap.data[i] = 1.0
			else
				mountainMap.data[i] = 0.0
			end
		end
	end
	--mountainMap:Save("premountMap.csv")

	local stdDevThreshold = stdDevMap:FindThresholdFromPercent(mg.landPercent + 0.05,true,false)
	log:Debug("stdDevThreshold = %s", stdDevThreshold)

	for y = 0, mountainMap.height - 1 do
		for x = 0,mountainMap.width - 1 do
			local i = mountainMap:GetIndex(x,y)
			local val = mountainMap.data[i]
			local dev = 2.0 * stdDevMap.data[i] - 2.0 * stdDevThreshold
			--mountainMap.data[i] = (math.sin(val * 2 * math.pi + math.pi * 0.5)^8 * val) + moundMap.data[i] * 2 + noiseMap.data[i] * 0.6
			mountainMap.data[i] = (val + moundMap.data[i]) * dev
		end
	end

	mountainMap:Normalize()
	--mountainMap:Save("mountainMap.csv")
	
	return mountainMap
end

function GetAttenuationFactor(map,x,y)
	local southY = map.height * mg.southAttenuationRange
	local southRange = map.height * mg.southAttenuationRange
	local yAttenuation = 1.0
	if y < southY then
		yAttenuation = mg.southAttenuationFactor + (y/southRange) * (1.0 - mg.southAttenuationFactor)
	end

	local northY = map.height - (map.height * mg.northAttenuationRange)
	local northRange = map.height * mg.northAttenuationRange
	if y > northY then
		yAttenuation = mg.northAttenuationFactor + ((map.height - y)/northRange) * (1.0 - mg.northAttenuationFactor)
	end

	local eastY = map.width - (map.width * mg.eastAttenuationRange)
	local eastRange = map.width * mg.eastAttenuationRange
	local xAttenuation = 1.0
	if x > eastY then
		xAttenuation = mg.eastAttenuationFactor + ((map.width - x)/eastRange) * (1.0 - mg.eastAttenuationFactor)
	end

	local westY = map.width * mg.westAttenuationRange
	local westRange = map.width * mg.westAttenuationRange
	if x < westY then
		xAttenuation = mg.westAttenuationFactor + (x/westRange) * (1.0 - mg.westAttenuationFactor)
	end

	return yAttenuation * xAttenuation
end

function GenerateElevationMap(width,height,xWrap,yWrap)
	local timeStart = debugTime and os.clock() or 0
	local landMinScatter = 128/width * mg.landMinScatter --0.02/128
	local landMaxScatter = 128/width * mg.landMaxScatter --0.12/128
	local coastScatter = 128/width * mg.coastScatter --0.042/128
	local mountainScatter = 128/width * mg.mountainScatter --0.05/128
	local twistMap = GenerateTwistedPerlinMap(width,height,xWrap,yWrap,landMinScatter,landMaxScatter,coastScatter)
	
	if debugTime then timeStart = os.clock() end
	local mountainMap = GenerateMountainMap(width,height,xWrap,yWrap,mountainScatter)
	if debugTime then print(string.format("%5s ms, GenerateElevationMap %s", math.floor((os.clock() - timeStart) * 1000), "GenerateMountainMap")) end
	
	if debugTime then timeStart = os.clock() end
	local elevationMap = ElevationMap:New(width,height,xWrap,yWrap)	
	for y = 0,height - 1 do
		for x = 0,width - 1 do
			local i = elevationMap:GetIndex(x,y)
			local tVal = twistMap.data[i]
			tVal = (math.sin(tVal*math.pi-math.pi*0.5)*0.5+0.5)^0.25 --this formula adds a curve flattening the extremes
			elevationMap.data[i] = (tVal + ((mountainMap.data[i] * 2) - 1) * mg.mountainWeight)
		end
	end
	
	if debugTime then timeStart = os.clock() end

	elevationMap:Normalize()

	--attentuation should not break normalization
	for y = 0,height - 1 do
		for x = 0,width - 1 do
			local i = elevationMap:GetIndex(x,y)
			local attenuationFactor = GetAttenuationFactor(elevationMap,x,y)
			elevationMap.data[i] = elevationMap.data[i] * attenuationFactor
		end
	end
	
	if debugTime then timeStart = os.clock() end

	elevationMap.seaLevelThreshold = elevationMap:FindThresholdFromPercent(mg.landPercent + 0.05,true,false)
	log:Debug("seaLevelThreshold = %s", elevationMap.seaLevelThreshold)

	if debugTime then print(string.format("%5s ms, GenerateElevationMap %s", math.floor((os.clock() - timeStart) * 1000), "End")) end
	return elevationMap
end

function GenerateTempMaps(elevationMap)
	local timeStart = debugTime and os.clock() or 0
	local aboveSeaLevelMap = FloatMap:New(elevationMap.width,elevationMap.height,elevationMap.xWrap,elevationMap.yWrap)
	for y = 0,elevationMap.height - 1 do
		for x = 0,elevationMap.width - 1 do
			local i = aboveSeaLevelMap:GetIndex(x,y)		-- sets amount plot is above sea level
			if elevationMap:IsBelowSeaLevel(x,y) then
				aboveSeaLevelMap.data[i] = 0.0
			else
				aboveSeaLevelMap.data[i] = elevationMap.data[i] - elevationMap.seaLevelThreshold
			end
		end
	end
	aboveSeaLevelMap:Normalize()
	--aboveSeaLevelMap:Save("aboveSeaLevelMap.csv")

	local summerMap = FloatMap:New(elevationMap.width,elevationMap.height,elevationMap.xWrap,elevationMap.yWrap)
	local zenith = mg.tropicLatitudes
	local topTempLat = mg.topLatitude + zenith
	local bottomTempLat = 1.8 * mg.bottomLatitude
	local latRange = topTempLat - bottomTempLat
	for y = 0,elevationMap.height - 1 do
		for x = 0,elevationMap.width - 1 do
			local i = summerMap:GetIndex(x,y)
			local lat = summerMap:GetLatitudeForY(y)
			--print("y=" .. y ..",lat=" .. lat)
			local latPercent = (lat - bottomTempLat)/latRange
			--print("latPercent=" .. latPercent)
			local temp = (math.sin(latPercent * math.pi * 2 - math.pi * 0.5) * 0.5 + 0.5)  -- maximum at mid point between top and bottom, 0 at top and bottom.
			if elevationMap:IsBelowSeaLevel(x,y) then
				temp = temp * mg.maxWaterTemp + mg.minWaterTemp	-- if water then modify temp by applying a minimum
			end
			summerMap.data[i] = temp
		end
	end
	if debugTime then timeStart = os.clock() end
	summerMap:Smooth(math.min(mg.tempBlendMaxRange, math.floor(elevationMap.width/8)))
	if debugTime then print(string.format("%5s ms, GenerateTempMaps %s", math.floor((os.clock() - timeStart) * 1000), "Smooth")) end	
	if debugTime then timeStart = os.clock() end
	summerMap:Normalize()
	local winterMap = FloatMap:New(elevationMap.width,elevationMap.height,elevationMap.xWrap,elevationMap.yWrap)
	zenith = -mg.tropicLatitudes
	topTempLat = mg.topLatitude
	bottomTempLat = 1.8 * mg.bottomLatitude + zenith
	latRange = topTempLat - bottomTempLat
	for y = 0,elevationMap.height - 1 do
		for x = 0,elevationMap.width - 1 do
			local i = winterMap:GetIndex(x,y)
			local lat = winterMap:GetLatitudeForY(y)
			local latPercent = (lat - bottomTempLat)/latRange
			local temp = math.sin(latPercent * math.pi * 2 - math.pi * 0.5) * 0.5 + 0.5	-- maximum at mid point between top and bottom, 0 at top and bottom.
			if elevationMap:IsBelowSeaLevel(x,y) then
				temp = temp * mg.maxWaterTemp + mg.minWaterTemp	-- if water then modify temp by applying a minimum
			end
			winterMap.data[i] = temp
		end
	end
	winterMap:Smooth(math.min(mg.tempBlendMaxRange, math.floor(elevationMap.width/8)))
	winterMap:Normalize()

	local temperatureMap = FloatMap:New(elevationMap.width,elevationMap.height,elevationMap.xWrap,elevationMap.yWrap)
	for y = 0,elevationMap.height - 1 do
		for x = 0,elevationMap.width - 1 do
			local i = temperatureMap:GetIndex(x,y)
			temperatureMap.data[i] = (winterMap.data[i] + summerMap.data[i]) * (1.0 - aboveSeaLevelMap.data[i])
			-- average of summer and winter maps decreased by how high above sea level
		end
	end
	temperatureMap:Normalize()

	return summerMap,winterMap,temperatureMap,aboveSeaLevelMap
end

function GenerateRainfallMap(elevationMap)
	local summerMap,winterMap,temperatureMap,aboveSeaLevelMap = GenerateTempMaps(elevationMap)
	
	--summerMap:Save("summerMap.csv")
	--winterMap:Save("winterMap.csv")
	--temperatureMap:Save("temperatureMap.csv")
	local geoMap = FloatMap:New(elevationMap.width,elevationMap.height,elevationMap.xWrap,elevationMap.yWrap)
	for y = 0,elevationMap.height - 1 do
		for x = 0,elevationMap.width - 1 do
			local i = elevationMap:GetIndex(x,y)
			local lat = elevationMap:GetLatitudeForY(y)
			local pressure = elevationMap:GetGeostrophicPressure(lat)
			geoMap.data[i] = pressure
		end
	end
	geoMap:Normalize()
	--geoMap:Save("geoMap.csv")
	for y = 0,elevationMap.height - 1 do
		for x = 0,elevationMap.width - 1 do
			local i = elevationMap:GetIndex(x,y)
			local pressure = summerMap.data[i] * math.max(mg.basePressure - aboveSeaLevelMap.data[i],0)
			summerMap.data[i] = pressure
		end
	end
	summerMap:Normalize()
	for y = 0,elevationMap.height - 1 do
		for x = 0,elevationMap.width - 1 do
			local i = elevationMap:GetIndex(x,y)
			local pressure = winterMap.data[i] * math.max(mg.basePressure - aboveSeaLevelMap.data[i],0)
			winterMap.data[i] = pressure
		end
	end
	winterMap:Normalize()
	local sortedSummerMap = {}
	local sortedWinterMap = {}
	for y = 0,elevationMap.height - 1 do
		for x = 0,elevationMap.width - 1 do
			local i = elevationMap:GetIndex(x,y)
			sortedSummerMap[i + 1] = {x,y,summerMap.data[i]}
			sortedWinterMap[i + 1] = {x,y,winterMap.data[i]}
		end
	end
	table.sort(sortedSummerMap, function (a,b) return a[3] > b[3] end)
	table.sort(sortedWinterMap, function (a,b) return a[3] > b[3] end)
	
	local sortedGeoMap = {}
	local xStart = 0
	local xStop = 0
	local yStart = 0
	local yStop = 0
	local incX = 0
	local incY = 0
	local geoIndex = 1
	local str = ""
	for zone=0,5 do
		local topY = elevationMap:GetYFromZone(zone,true)
		local bottomY = elevationMap:GetYFromZone(zone,false)
		if not (topY == -1 and bottomY == -1) then
			if topY == -1 then
				topY = elevationMap.height - 1
			end
			if bottomY == -1 then
				bottomY = 0
			end
			--str = string.format("topY = %d, bottomY = %d",topY,bottomY)
			--print(str)
			local dir1,dir2 = elevationMap:GetGeostrophicWindDirections(zone)
			--str = string.format("zone = %d, dir1 = %d",zone,dir1)
			--print(str)
			if (dir1 == mg.SW) or (dir1 == mg.SE) then
				yStart = topY
				yStop = bottomY --- 1
				incY = -1
			else
				yStart = bottomY
				yStop = topY --+ 1
				incY = 1
			end
			if dir2 == mg.W then
				xStart = elevationMap.width - 1
				xStop = 0---1
				incX = -1
			else
				xStart = 0
				xStop = elevationMap.width
				incX = 1
			end
			--str = string.format("yStart = %d, yStop = %d, incY = %d",yStart,yStop,incY)
			--print(str)
			--str = string.format("xStart = %d, xStop = %d, incX = %d",xStart,xStop,incX)
			--print(str)

			for y = yStart,yStop ,incY do
				--str = string.format("y = %d",y)
				--print(str)
				--each line should start on water to avoid vast areas without rain
				local xxStart = xStart
				local xxStop = xStop
				for xx = xStart,xStop - incX, incX do
					local i = elevationMap:GetIndex(xx,y)
					if elevationMap:IsBelowSeaLevel(xx,y) then
						xxStart = xx
						xxStop = xx + elevationMap.width * incX
						break
					end
				end
				for x = xxStart,xxStop - incX,incX do
					local i = elevationMap:GetIndex(x,y)
					sortedGeoMap[geoIndex] = {x,y,geoMap.data[i]}
					geoIndex = geoIndex + 1
				end
			end
		end
	end
--	table.sort(sortedGeoMap, function (a,b) return a[3] > b[3] end)
	--print(#sortedGeoMap)
	--print(#geoMap.data)

	local rainfallSummerMap = FloatMap:New(elevationMap.width,elevationMap.height,elevationMap.xWrap,elevationMap.yWrap)
	local moistureMap = FloatMap:New(elevationMap.width,elevationMap.height,elevationMap.xWrap,elevationMap.yWrap)
	for i = 1,#sortedSummerMap do
		local x = sortedSummerMap[i][1]
		local y = sortedSummerMap[i][2]
		local pressure = sortedSummerMap[i][3]
		DistributeRain(x,y,elevationMap,temperatureMap,summerMap,rainfallSummerMap,moistureMap,false)
		-- distribues rain into rainfallSummerMap
	end

	local rainfallWinterMap = FloatMap:New(elevationMap.width,elevationMap.height,elevationMap.xWrap,elevationMap.yWrap)
	local moistureMap = FloatMap:New(elevationMap.width,elevationMap.height,elevationMap.xWrap,elevationMap.yWrap)
	for i = 1,#sortedWinterMap do
		local x = sortedWinterMap[i][1]
		local y = sortedWinterMap[i][2]
		local pressure = sortedWinterMap[i][3]
		DistributeRain(x,y,elevationMap,temperatureMap,winterMap,rainfallWinterMap,moistureMap,false)
		-- distribues rain into rainfallWinterMap
	end

	local rainfallGeostrophicMap = FloatMap:New(elevationMap.width,elevationMap.height,elevationMap.xWrap,elevationMap.yWrap)
	moistureMap = FloatMap:New(elevationMap.width,elevationMap.height,elevationMap.xWrap,elevationMap.yWrap)
	
	--print("----------------------------------------------------------------------------------------")
	--print("--GEOSTROPHIC---------------------------------------------------------------------------")
	--print("----------------------------------------------------------------------------------------")
	for i = 1,#sortedGeoMap do
		local x = sortedGeoMap[i][1]
		local y = sortedGeoMap[i][2]
--~ 		if y == 35 or y == 40 then
--~ 			str = string.format("x = %d, y = %d",x,y)
--~ 			print(str)
--~ 		end
		DistributeRain(x,y,elevationMap,temperatureMap,geoMap,rainfallGeostrophicMap,moistureMap,true)
		-- distribues rain into rainfallGeostropicMap
	end
	--zero below sea level for proper percent threshold finding
	--[[
	for y = 0,elevationMap.height - 1 do
		for x = 0,elevationMap.width - 1 do
			local i = elevationMap:GetIndex(x,y)
			if elevationMap:IsBelowSeaLevel(x,y) then
				rainfallSummerMap.data[i] = 0.0
				rainfallWinterMap.data[i] = 0.0
				rainfallGeostrophicMap.data[i] = 0.0
			end
		end
	end
	--]]

	rainfallSummerMap:Normalize()
	--rainfallSummerMap:Save("rainFallSummerMap.csv")
	rainfallWinterMap:Normalize()
	--rainfallWinterMap:Save("rainFallWinterMap.csv")
	rainfallGeostrophicMap:Normalize()
	--rainfallGeostrophicMap:Save("rainfallGeostrophicMap.csv")

	local rainfallMap = FloatMap:New(elevationMap.width,elevationMap.height,elevationMap.xWrap,elevationMap.yWrap)

	for y = 0,elevationMap.height - 1 do
		for x = 0,elevationMap.width - 1 do
			local i = elevationMap:GetIndex(x,y)
			rainfallMap.data[i] =  rainfallSummerMap.data[i] +   rainfallWinterMap.data[i] + (rainfallGeostrophicMap.data[i] * mg.geostrophicFactor) -- (geostopicFactor = 0 currently)
		end
	end

	rainfallMap:Smooth(mg.RainfallBlendRange) 	-- Blending had strange effects
	rainfallMap:Normalize()

	return rainfallMap, temperatureMap
end

function DistributeRain(x,y,elevationMap,temperatureMap,pressureMap,rainfallMap,moistureMap,boolGeostrophic)

	local i = elevationMap:GetIndex(x,y)
	local upLiftSource = math.max(0.05,pressureMap.data[i])
	--local str = string.format("geo=%s,x=%d, y=%d, srcPressure uplift = %f, upliftSource = %f",tostring(boolGeostrophic),x,y,math.pow(pressureMap.data[i],mg.upLiftExponent),upLiftSource)
	--print(str)
	if elevationMap:IsBelowSeaLevel(x,y) then
		moistureMap.data[i] = moistureMap.data[i] + temperatureMap.data[i] -- Oceans create additional mositure depending on temp
		--print("water tile = true")
	end
	--if debugTime then print(string.format("moistureMap.data[i] = %f",moistureMap.data[i])) end

	--make list of neighbors
	local nList = {}
	if boolGeostrophic then
		local zone = elevationMap:GetZone(y)
		local dir1,dir2 = elevationMap:GetGeostrophicWindDirections(zone)
		local x1,y1 = elevationMap:GetNeighbor(x,y,dir1)
		local ii = elevationMap:GetIndex(x1,y1)
		--neighbor must be on map and in same wind zone
		if ii >= 0 and (elevationMap:GetZone(y1) == elevationMap:GetZone(y)) then
			table.insert(nList,{x1,y1})
		end
		local x2,y2 = elevationMap:GetNeighbor(x,y,dir2)
		ii = elevationMap:GetIndex(x2,y2)
		if ii >= 0 then
			table.insert(nList,{x2,y2})
		end
	else
		for dir = 0, 5 do
			local xx,yy = elevationMap:GetNeighbor(x,y,dir)
			local ii = elevationMap:GetIndex(xx,yy)
			if ii >= 0 and pressureMap.data[i] > pressureMap.data[ii] then	-- if temp of adjacent tile is lower (or equal)
				table.insert(nList,{xx,yy})				-- add it to list of neighbours to pass moisture to
			end
		end
	end
	if #nList == 0 or boolGeostrophic and #nList == 1 then		-- if no neighbours to pass to
		local cost = moistureMap.data[i]
		--local cost = 0
		rainfallMap.data[i] = cost				-- drop all moisture
		return
	end
	local moisturePerNeighbor = moistureMap.data[i]/#nList		-- divide moistue up between tiles it will be passed to
	for n = 1,#nList do
		local xx = nList[n][1]
		local yy = nList[n][2]
		local ii = elevationMap:GetIndex(xx,yy)
		local upLiftDest = math.max(0.05,pressureMap.data[ii])
		local cost = GetRainCost(upLiftSource,upLiftDest)  -- gives a percent of available moisture to drop
		local bonus = 0.0
		if (elevationMap:GetZone(y) == mg.NPOLAR or elevationMap:GetZone(y) == mg.SPOLAR) then
			bonus = mg.polarRainBoost
		end
		if boolGeostrophic and #nList == 2 then
			if n == 1 then
				moisturePerNeighbor = (1.0 - mg.geostrophicLateralWindStrength) * moistureMap.data[i]
			else
				moisturePerNeighbor = mg.geostrophicLateralWindStrength * moistureMap.data[i]
			end
		end
		--if debugTime then print(string.format("---xx=%d, yy=%d, destPressure uplift = %f, upLiftDest = %f, cost = %f, moisturePerNeighbor = %f, bonus = %f",xx,yy,math.pow(pressureMap.data[ii],mg.upLiftExponent),upLiftDest,cost,moisturePerNeighbor,bonus)) end
		
		rainfallMap.data[i] = rainfallMap.data[i] + cost * moisturePerNeighbor + bonus	-- drop percentage of moisture
		
		--pass to neighbor.
		--if debugTime then print(string.format("---moistureMap.data[ii] = %f",moistureMap.data[ii])) end
		
		if elevationMap:IsBelowSeaLevel(x,y) then
			moistureMap.data[ii] = math.max(moistureMap.data[ii] + moisturePerNeighbor - (cost * moisturePerNeighbor),moistureMap.data[ii])
			-- if below sea, pass on remaining moiture after rain dropped
		else

			moistureMap.data[ii] = math.max(moistureMap.data[ii] + moisturePerNeighbor - (1 - mg.pickUpModifier * temperatureMap.data[i]) * (cost * moisturePerNeighbor),moistureMap.data[ii])
			-- if above sea, pass on remaining moisture + pickUpModifier * rain dropped
		end
		--if debugTime then print(string.format("---dropping %f rain",cost * moisturePerNeighbor + bonus)) end
		--if debugTime then print(string.format("---passing on %f moisture",moisturePerNeighbor - (cost * moisturePerNeighbor))) end
	end

end

function GetRainCost(upLiftSource,upLiftDest)
	local cost =  math.max(mg.minimumRainCost, mg.rainfallMultiplier * ( (upLiftSource - upLiftDest)/upLiftSource))
	--  multiplier * percent change in pressure
	if cost < 0.0 then
		cost = 0.0
	end
	return cost
end

function GetDifferenceAroundHex(x,y)
	local avg = elevationMap:GetAverageInHex(x,y,1)
 	local i = elevationMap:GetIndex(x,y)
	return elevationMap.data[i] - avg
--~ 	local nList = elevationMap:GetRadiusAroundHex(x,y,1)
--~ 	local i = elevationMap:GetIndex(x,y)
--~ 	local biggestDiff = 0.0
--~ 	for n=1,#nList do
--~ 		local xx = nList[n][1]
--~ 		local yy = nList[n][2]
--~ 		local ii = elevationMap:GetIndex(xx,yy)
--~ 		local diff = nil
--~ 		if elevationMap:IsBelowSeaLevel(x,y) then
--~ 			diff = elevationMap.data[i] - elevationMap.seaLevelThreshold
--~ 		else
--~ 			diff = elevationMap.data[i] - elevationMap.data[ii]
--~ 		end
--~ 		if diff > biggestDiff then
--~ 			biggestDiff = diff
--~ 		end
--~ 	end
--~ 	if biggestDiff < 0.0 then
--~ 		biggestDiff = 0.0
--~ 	end
--~ 	return biggestDiff
end












--
-- Plot functions
--

function Plot_GetID(plot)
	if not plot then
		error("plot:GetID plot=nil")
		return nil
	end
	local iW, iH = Map.GetGridSize()
	return plot:GetY() * iW + plot:GetX()
end

function Plot_GetFertilityInRange(plot, range, yieldID)
	local value = 0
	for nearPlot, distance in Plot_GetPlotsInCircle(plot, range, yieldID) do
		value = value + Plot_GetFertility(nearPlot, yieldID) / math.max(1, distance)
	end
	return value
end

function Plot_GetFertility(plot, yieldID, ignoreStrategics)
	if plot:IsImpassable() or plot:GetTerrainType() == TerrainTypes.TERRAIN_OCEAN then
		return 0
	end
	
	local value = 0
	local featureID = plot:GetFeatureType()
	local terrainID = plot:GetTerrainType()
	local resID = plot:GetResourceType()
	
	if yieldID then
		value = value + plot:CalculateYield(yieldID, true)
	else
		for _, yieldID in pairs(mg.basicYields) do
			value = value + plot:CalculateYield(yieldID, true)
		end
	end
	
	if plot:IsFreshWater() then
		value = value + 0.25
	end
	
	if plot:IsLake() then
		-- can't improve lakes
		value = value - 1
	end
	
	if featureID == FeatureTypes.FEATURE_FOREST and terrainID ~= TerrainTypes.TERRAIN_TUNDRA then
		value = value + 0.5
	end
	
	if resID == -1 then
		if featureID == -1 and terrainID == TerrainTypes.TERRAIN_COAST then
			-- can't do much with these tiles in BNW
			value = value - 0.75
		end
	else
		local resInfo = GameInfo.Resources[resID]
		value = value + 4 * resInfo.Happiness
		if resInfo.ResourceClassType == "RESOURCECLASS_RUSH" and not ignoreStrategics then
			value = value + math.ceil(5 * math.sqrt(plot:GetNumResource()))
		elseif resInfo.ResourceClassType == "RESOURCECLASS_BONUS" then
			value = value + 2
		end
	end
	--]]
	return value
end
----------------------------------------------------------------
function Plot_GetPlotsInCircle(plot, minR, maxR)
	if not plot then
		print("plot:GetPlotsInCircle plot=nil")
		return
	end
	if not maxR then
		maxR = minR
		minR = 1
	end
	
	local mapW, mapH	= Map.GetGridSize()
	local isWrapX		= Map:IsWrapX()
	local isWrapY		= Map:IsWrapY()
	local centerX		= plot:GetX()
	local centerY		= plot:GetY()
	
	leftX	= isWrapX and ((centerX-maxR) % mapW) or Constrain(0, centerX-maxR, mapW-1)
	rightX	= isWrapX and ((centerX+maxR) % mapW) or Constrain(0, centerX+maxR, mapW-1)
	bottomY	= isWrapY and ((centerY-maxR) % mapH) or Constrain(0, centerY-maxR, mapH-1)
	topY	= isWrapY and ((centerY+maxR) % mapH) or Constrain(0, centerY+maxR, mapH-1)
	
	local nearX	= leftX
	local nearY	= bottomY
	local stepX	= 0
	local stepY	= 0
	local rectW	= rightX-leftX 
	local rectH	= topY-bottomY
	
	if rectW < 0 then
		rectW = rectW + mapW
	end
	
	if rectH < 0 then
		rectH = rectH + mapH
	end
	
	local nextPlot = Map.GetPlot(nearX, nearY)
	
	return function ()
		while (stepY < 1 + rectH) and nextPlot do
			while (stepX < 1 + rectW) and nextPlot do
				local plot		= nextPlot
				local distance	= Map.PlotDistance(nearX, nearY, centerX, centerY)
				
				nearX		= (nearX + 1) % mapW
				stepX		= stepX + 1
				nextPlot	= Map.GetPlot(nearX, nearY)
				
				if IsBetween(minR, distance, maxR) then
					return plot, distance
				end
			end
			nearX		= leftX
			nearY		= (nearY + 1) % mapH
			stepX		= 0
			stepY		= stepY + 1
			nextPlot	= Map.GetPlot(nearX, nearY)
		end
	end
end

function Plot_GetPlotsInCircleFast(x, y, radius)
	-- assumes X wrap
	
	local plotIDs	= {}
	local W, H		= Map.GetGridSize()
	local odd		= y % 2
	local topY		= radius
	local bottomY	= radius
	local currentY	= nil
	local len		= 1+radius
	local i			= (y % H) * W + (x % W)
	
	--constrain the top of our circle to be on the map
	if y+radius > H-1 then
		for r=0,radius,1 do
			if y+r == H-1 then
				topY = r
				break
			end
		end
	end
	
	--constrain the bottom of our circle to be on the map
	if y-radius < 0 then
		for r=0,radius,1 do
			if y-r == 0 then
				bottomY = r
				break
			end
		end
	end
	
	--adjust starting length, apply the top and bottom limits, and correct odd for the starting point
	len			= len+(radius-bottomY)
	currentY	= y - bottomY
	topY		= y + topY
	odd			= (odd+bottomY)%2
	
	--set starting point
	if x-(radius-bottomY) - math.floor((bottomY+odd)/2) < 0 then
		i = i - (W*bottomY) + (W-(radius-bottomY)) - math.floor((bottomY+odd)/2)
		x = x + (W-(radius-bottomY)) - math.floor((bottomY+odd)/2)
		-- print(string.format("i for (%d,%d) WOULD have been in outer space. x is (%d,%d) i is (%d)",xx,y,x,y-bottomY,i))
	else
		i = i - (W*bottomY) - (radius-bottomY) - math.floor((bottomY+odd)/2)
		x = x - (radius-bottomY) - math.floor((bottomY+odd)/2)
	end
	
	--cycle through the plot indexes and add them to a table
	--local str = ""
	--local iters = 0
	while currentY <= topY do
		--insert the start value, scan left to right adding each index in the line to our table
		--str = str..i..","
		table.insert(plotIDs,i)
		local wrapped = false
		for n=1,len-1,1 do
			if x ~= (W-1) then
				i = i + 1
				x = x + 1
			else
				i = i-(W-1)
				x = 0
				wrapped = true
			end
			--str = str..i..","
			table.insert(plotIDs,i)
		end
		if currentY < y then
			--move i NW and increment the length to scan
			if not wrapped then
				i = i+W-len+odd
				x = x-len+odd
			else
				i = i+W+(W-len+odd)
				x = x+(W-len+odd)
			end
			len = len+1
		else
			--move i NE and decrement the length to scan
			if not wrapped then
				i = i+W-len+1+odd
				x = x-len+1+odd
			else
				i = i+W+(W-len+1+odd)
				x = x+(W-len+1+odd)
			end
			len = len-1
		end
		currentY = currentY+1
		odd = (odd+1)%2
		-- iters = iters+1
		-- if iters > 300 then
			-- print("infinite loop in GetCircle")
			-- break
		-- end
	end
	-- print(string.format("added "..str.." to table for circle starting at(%d,%d)",xx,y))
	return plotIDs
end

local plotTypeName		= {}-- -1="NO_PLOT"}
local terrainTypeName	= {}-- -1="NO_TERRAIN"}
local featureTypeName	= {}-- -1="NO_FEATURE"}
function Plot_GetCirclePercents(plot, minR, maxR)
	--[[ Plot_GetCirclePercents(centerPlot, minRadius, maxRadius) usage example:

	plotPercent = Plot_GetCirclePercents(plot, 2, 2)
	if (plotPercent.PLOT_LAND + plotPercent.PLOT_HILLS) <= 0.25 then
		return
	end
	]]
	for k, v in pairs(PlotTypes) do
		plotTypeName[v] = k
	end
	for itemInfo in GameInfo.Terrains() do
		terrainTypeName[itemInfo.ID] = itemInfo.Type
	end
	for itemInfo in GameInfo.Features() do
		featureTypeName[itemInfo.ID] = itemInfo.Type
	end
	
	local weights = {TOTAL=0, SEA=0, NO_PLOT=0, NO_TERRAIN=0, NO_FEATURE=0}
	
	for k, v in pairs(PlotTypes) do
		weights[k] = 0
	end
	for itemInfo in GameInfo.Terrains() do
		weights[itemInfo.Type] = 0
	end
	for itemInfo in GameInfo.Features() do
		weights[itemInfo.Type] = 0
	end
	
	for nearPlot, distance in Plot_GetPlotsInCircle(plot, minR, maxR) do
		local nearWeight	 = (distance == 0) and 6 or (1/distance)
		local plotType		 = plotTypeName[nearPlot:GetPlotType()]
		local terrainType	 = terrainTypeName[nearPlot:GetTerrainType()]
		local featureType	 = featureTypeName[nearPlot:GetFeatureType()] or "NO_FEATURE"
		
		weights.TOTAL		 = weights.TOTAL		+ nearWeight 
		weights[plotType]	 = weights[plotType]	+ nearWeight
		weights[terrainType] = weights[terrainType]	+ nearWeight
		weights[featureType] = weights[featureType]	+ nearWeight
				
		if plotType == "PLOT_OCEAN" then
			if not nearPlot:IsLake() and featureType ~= "FEATURE_ICE" then
				weights.SEA = weights.SEA + nearWeight
			end
		end
	end
	
	if weights.TOTAL == 0 then
		print("plot:GetAreaWeights Total=0! x=%s y=%s", x, y)
	end
	for k, v in pairs(weights) do
		if k ~= "TOTAL" then
			weights[k] = weights[k] / weights.TOTAL
		end
	end
	
	return weights
end

function Plot_GetElevation(plot, ignoreSeas)
	if ignoreSeas and Contains(mg.seaPlots, plot) then
		-- try to preserve inland seas
		return elevationMap.seaLevelThreshold
	end
	return elevationMap.data[elevationMap:GetIndex(plot:GetX(), plot:GetY())]
end

function GetElevationByPlotID(plotID)
	local elevation = elevationMap.data[plotID]
	if not elevation then
		log:Warn("GetElevationByPlotID elevationMap.data[%s] = %s", plotID, elevation)
		return 0
	end
	return elevation
end

function Plot_IsWater(plot, useElevation, ignoreSeas)
	if useElevation then
		return elevationMap.data[elevationMap:GetIndex(plot:GetX(), plot:GetY())] < elevationMap.seaLevelThreshold
	end
	if ignoreSeas and Contains(mg.seaPlots, plot) then
		return false
	end
	return (plot:GetPlotType() == PlotTypes.PLOT_OCEAN) or Contains(mg.lakePlots, plot)
end

function Plot_IsLake(plot)
	return plot:IsLake() or Contains(mg.lakePlots, plot)
end

function waterMatch(x,y)
	return elevationMap:IsBelowSeaLevel(x,y)
end

function landMatch(x,y)
	return not elevationMap:IsBelowSeaLevel(x,y)
end

function oceanMatch(x,y)
	local plot = Map.GetPlot(x,y)
	if plot:GetPlotType() == PlotTypes.PLOT_OCEAN then
		return true
	end
	return false
end

function jungleMatch(x,y)
	local plot = Map.GetPlot(x,y)
	if plot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE or Contains(mg.tropicalPlots, plot) then
		return true
	--include any mountains on the border as part of the desert.
	elseif (plot:GetFeatureType() == FeatureTypes.FEATURE_MARSH or plot:GetFeatureType() == FeatureTypes.FEATURE_FOREST) and plot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS then
		local nList = elevationMap:GetRadiusAroundHex(x,y,1)
		for n=1,#nList do
			local xx = nList[n][1]
			local yy = nList[n][2]
			local ii = elevationMap:GetIndex(xx,yy)
			if 11 ~= -1 then
				local nPlot = Map.GetPlot(xx,yy)
				if nPlot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE then
					return true
				end
			end
		end
	end
	return false
end

function desertMatch(x,y)
	local plot = Map.GetPlot(x,y)
	if plot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT then
		return true
	--include any mountains on the border as part of the desert.
	elseif IsMountain(plot) then
		local nList = elevationMap:GetRadiusAroundHex(x,y,1)
		for n=1,#nList do
			local xx = nList[n][1]
			local yy = nList[n][2]
			local ii = elevationMap:GetIndex(xx,yy)
			if 11 ~= -1 then
				local nPlot = Map.GetPlot(xx,yy)
				if not IsMountain(nPlot) and nPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT then
					return true
				end
			end
		end
	end
	return false
end

function IsMountain(plot)
	return plot:IsMountain() or Contains(mg.MountainPasses, plot)
end












--
-- Utilities
--
---------------------------------------------------------------------
function Round(num, places)
	local mult = 10^(places or 0)
	return math.floor(num * mult + 0.5) / mult
end

function ShuffleList(list)
	local len = #list
	for i=0,len - 1 do
		local k = PWRandint(0,len-1)
		list[i], list[k] = list[k], list[i]
	end
end

function IsBetween(lower, mid, upper)
	return ((lower <= mid) and (mid <= upper))
end

function Contains(list, value)
	for k, v in pairs(list) do
		if v == value then
			return true
		end
	end
	return false
end

function DeepCopy(object)
	-- DeepCopy(object) copies all elements of a table
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

function Constrain(lower, mid, upper)
	return math.max(lower, math.min(mid, upper))
end

function Push(a,item)
	table.insert(a,item)
end

function Pop(a)
	return table.remove(a)
end

function GetRandomWeighted(list, size)
	-- GetRandomWeighted(list, size) returns a key from a list of (key, weight) pairs
	size = size or 100
	local chanceIDs = GetWeightedTable(list, size)

	if chanceIDs == -1 then
		return -1
	end
	local randomID = 1 + Map.Rand(size, "GetRandomWeighted")
	if not chanceIDs[randomID] then
		print("GetRandomWeighted: invalid random index selected = %s", randomID)
		chanceIDs[randomID] = -1
	end
	return chanceIDs[randomID]
end

function GetWeightedTable(list, size)
	-- GetWeightedTable(list, size) returns a table with key blocks sized proportionately to a weighted list
	local totalWeight	= 0
	local chanceIDs		= {}
	local position		= 1
	
	for key, weight in pairs(list) do
		totalWeight = totalWeight + weight
	end
	
	if totalWeight == 0 then
		for key, weight in pairs(list) do
			list[key] = 1
			totalWeight = totalWeight + 1
		end
		if totalWeight == 0 then
			print("GetWeightedTable: empty list")
			--print(debug.traceback())
			return -1
		end
	end
	
	for key, weight in pairs(list) do
		local positionNext = position + size * weight / totalWeight
		for i = math.floor(position), math.floor(positionNext) do
			chanceIDs[i] = key
		end
		position = positionNext
	end	
	return chanceIDs
end

function GetOppositeDir(dir)
	return ((dir + 2) % 6) + 1
end

function GetBellCurve(value, normalize)
	--Returns a value along a bell curve from a 0 - 1 range
	if normalize then
		value = 1 - math.abs(value - normalize) / normalize
	end
	return math.sin(value * math.pi * 2 - math.pi/2)/2 + 0.5
end

function GetSinCurve(value, normalize, pushEdges)
	--Returns a value along a sin curve from a 0 - 1 range
	if not pushEdges then pushEdges = 0 end
	if normalize then
		value = 1 - ((normalize - pushEdges*2) - (value - pushEdges)) / (normalize - pushEdges*2)
		--value = 1 - math.abs(value - normalize) / normalize
	end
	return math.sin(value * math.pi * 2)
end

-----------------------------------------------------------------------------
--Interpolation and Perlin functions
function CubicInterpolate(v0,v1,v2,v3,mu)
	local mu2 = mu * mu
	local a0 = v3 - v2 - v0 + v1
	local a1 = v0 - v1 - a0
	local a2 = v2 - v0
	local a3 = v1

	return (a0 * mu * mu2 + a1 * mu2 + a2 * mu + a3)
end

function BicubicInterpolate(v,muX,muY)
	local a0 = CubicInterpolate(v[1],v[2],v[3],v[4],muX)
	local a1 = CubicInterpolate(v[5],v[6],v[7],v[8],muX)
	local a2 = CubicInterpolate(v[9],v[10],v[11],v[12],muX)
	local a3 = CubicInterpolate(v[13],v[14],v[15],v[16],muX)

	return CubicInterpolate(a0,a1,a2,a3,muY)
end

function CubicDerivative(v0,v1,v2,v3,mu)
	local mu2 = mu * mu
	local a0 = v3 - v2 - v0 + v1
	local a1 = v0 - v1 - a0
	local a2 = v2 - v0
	--local a3 = v1

	return (3 * a0 * mu2 + 2 * a1 * mu + a2)
end

function BicubicDerivative(v,muX,muY)
	local a0 = CubicInterpolate(v[1],v[2],v[3],v[4],muX)
	local a1 = CubicInterpolate(v[5],v[6],v[7],v[8],muX)
	local a2 = CubicInterpolate(v[9],v[10],v[11],v[12],muX)
	local a3 = CubicInterpolate(v[13],v[14],v[15],v[16],muX)

	return CubicDerivative(a0,a1,a2,a3,muY)
end

function GetInterpolatedValue(X,Y,srcMap)
	--This function gets a smoothly interpolated value from srcMap.
	--x and y are non-integer coordinates of where the value is to
	--be calculated, and wrap in both directions. srcMap is an bject
	--of type FloatMap.
	local points = {}
	local fractionX = X - math.floor(X)
	local fractionY = Y - math.floor(Y)

	--wrappedX and wrappedY are set to -1,-1 of the sampled area
	--so that the sample area is in the middle quad of the 4x4 grid
	local wrappedX = ((math.floor(X) - 1) % srcMap.rectWidth) + srcMap.rectX
	local wrappedY = ((math.floor(Y) - 1) % srcMap.rectHeight) + srcMap.rectY

	local x
	local y

	for pY = 0, 4-1 do
		y = pY + wrappedY
		for pX = 0,4-1 do
			x = pX + wrappedX
			local srcIndex = srcMap:GetRectIndex(x, y)
			points[(pY * 4 + pX) + 1] = srcMap.data[srcIndex]
		end
	end

	local finalValue = BicubicInterpolate(points,fractionX,fractionY)

	return finalValue

end

function GetDerivativeValue(X,Y,srcMap)
	local points = {}
	local fractionX = X - math.floor(X)
	local fractionY = Y - math.floor(Y)

	--wrappedX and wrappedY are set to -1,-1 of the sampled area
	--so that the sample area is in the middle quad of the 4x4 grid
	local wrappedX = ((math.floor(X) - 1) % srcMap.rectWidth) + srcMap.rectX
	local wrappedY = ((math.floor(Y) - 1) % srcMap.rectHeight) + srcMap.rectY

	local x
	local y

	for pY = 0, 4-1 do
		y = pY + wrappedY
		for pX = 0,4-1 do
			x = pX + wrappedX
			local srcIndex = srcMap:GetRectIndex(x, y)
			points[(pY * 4 + pX) + 1] = srcMap.data[srcIndex]
		end
	end

	local finalValue = BicubicDerivative(points,fractionX,fractionY)

	return finalValue

end

function GetPerlinNoise(x,y,destMapWidth,destMapHeight,initialFrequency,initialAmplitude,amplitudeChange,octaves,noiseMap)
	--This function gets Perlin noise for the destination coordinates. Note
	--that in order for the noise to wrap, the area sampled on the noise map
	--must change to fit each octave.
	local finalValue = 0.0
	local frequency = initialFrequency
	local amplitude = initialAmplitude
	local frequencyX --slight adjustment for seamless wrapping
	local frequencyY --''
	for i = 1,octaves do
		if noiseMap.wrapX then
			noiseMap.rectX = math.floor(noiseMap.width/2 - (destMapWidth * frequency)/2)
			noiseMap.rectWidth = math.max(math.floor(destMapWidth * frequency),1)
			frequencyX = noiseMap.rectWidth/destMapWidth
		else
			noiseMap.rectX = 0
			noiseMap.rectWidth = noiseMap.width
			frequencyX = frequency
		end
		if noiseMap.wrapY then
			noiseMap.rectY = math.floor(noiseMap.height/2 - (destMapHeight * frequency)/2)
			noiseMap.rectHeight = math.max(math.floor(destMapHeight * frequency),1)
			frequencyY = noiseMap.rectHeight/destMapHeight
		else
			noiseMap.rectY = 0
			noiseMap.rectHeight = noiseMap.height
			frequencyY = frequency
		end

		finalValue = finalValue + GetInterpolatedValue(x * frequencyX, y * frequencyY, noiseMap) * amplitude
		frequency = frequency * 2.0
		amplitude = amplitude * amplitudeChange
	end
	finalValue = finalValue/octaves
	return finalValue
end

function GetPerlinDerivative(x,y,destMapWidth,destMapHeight,initialFrequency,initialAmplitude,amplitudeChange,octaves,noiseMap)
	local finalValue = 0.0
	local frequency = initialFrequency
	local amplitude = initialAmplitude
	local frequencyX --slight adjustment for seamless wrapping
	local frequencyY --''
	for i = 1,octaves do
		if noiseMap.wrapX then
			noiseMap.rectX = math.floor(noiseMap.width/2 - (destMapWidth * frequency)/2)
			noiseMap.rectWidth = math.floor(destMapWidth * frequency)
			frequencyX = noiseMap.rectWidth/destMapWidth
		else
			noiseMap.rectX = 0
			noiseMap.rectWidth = noiseMap.width
			frequencyX = frequency
		end
		if noiseMap.wrapY then
			noiseMap.rectY = math.floor(noiseMap.height/2 - (destMapHeight * frequency)/2)
			noiseMap.rectHeight = math.floor(destMapHeight * frequency)
			frequencyY = noiseMap.rectHeight/destMapHeight
		else
			noiseMap.rectY = 0
			noiseMap.rectHeight = noiseMap.height
			frequencyY = frequency
		end

		finalValue = finalValue + GetDerivativeValue(x * frequencyX, y * frequencyY, noiseMap) * amplitude
		frequency = frequency * 2.0
		amplitude = amplitude * amplitudeChange
	end
	finalValue = finalValue/octaves
	return finalValue
end


---------------------------------------------------------------------

--ShiftMap Class
function ShiftMaps()
	--local stripRadius = self.stripRadius
	local shift_x = 0 
	local shift_y = 0

	shift_x = DetermineXShift()
	
	ShiftMapsBy(shift_x, shift_y)
end

function ShiftMapsBy(xshift, yshift)	
	local W, H = Map.GetGridSize()
	if(xshift > 0 or yshift > 0) then
		local Shift = {}
		local iDestI = 0
		for iDestY = 0, H-1 do
			for iDestX = 0, W-1 do
				local iSourceX = (iDestX + xshift) % W
				
				--local iSourceY = (iDestY + yshift) % H -- If using yshift, enable this and comment out the faster line below. - Bobert13
				local iSourceY = iDestY
				
				local iSourceI = W * iSourceY + iSourceX
				Shift[iDestI] = elevationMap.data[iSourceI]
				--if debugTime then print(string.format("Shift:%d,	%f	|	eMap:%d,	%f",iDestI,Shift[iDestI],iSourceI,elevationMap.data[iSourceI])) end
				iDestI = iDestI + 1
			end
		end
		elevationMap.data = Shift --It's faster to do one large table operation here than it is to do thousands of small operations to set up a copy of the input table at the beginning. -Bobert13
	end
	return elevationMap
end

function DetermineXShift()
	--[[ This function will align the most water-heavy vertical portion of the map with the 
	vertical map edge. This is a form of centering the landmasses, but it emphasizes the
	edge not the middle. If there are columns completely empty of land, these will tend to
	be chosen as the new map edge, but it is possible for a narrow column between two large 
	continents to be passed over in favor of the thinnest section of a continent, because
	the operation looks at a group of columns not just a single column, then picks the 
	center of the most water heavy group of columns to be the new vertical map edge. ]]--

	-- First loop through the map columns and record land plots in each column.
	local mapW, mapH = Map.GetGridSize()
	local land_totals = {}
	for x = 0, mapW - 1 do
		local current_column = 0
		for y = 0, mapH - 1 do
			local i = y * mapW + x + 1
			if not elevationMap:IsBelowSeaLevel(x,y) then
				current_column = current_column + 1
			end
		end
		table.insert(land_totals, current_column)
	end
	
	-- Now evaluate column groups, each record applying to the center column of the group.
	local column_groups = {}
	-- Determine the group size in relation to map width.
	local group_radius = 3
	-- Measure the groups.
	for column_index = 1, mapW do
		local current_group_total = 0
		--for current_column = column_index - group_radius, column_index + group_radius do
		--Changed how group_radius works to get groups of four. -Bobert13
		for current_column = column_index, column_index + group_radius do
			local current_index = current_column % mapW
			if current_index == 0 then -- Modulo of the last column will be zero this repairs the issue.
				current_index = mapW
			end
			current_group_total = current_group_total + land_totals[current_index]
		end
		table.insert(column_groups, current_group_total)
	end
	
	-- Identify the group with the least amount of land in it.
	local best_value = mapH * (group_radius + 1) -- Set initial value to max possible.
	local best_group = 1 -- Set initial best group as current map edge.
	for column_index, group_land_plots in ipairs(column_groups) do
		if group_land_plots < best_value then
			best_value = group_land_plots
			best_group = column_index
		end
	end
	
	-- Determine X Shift	
	local x_shift = best_group + 2

	return x_shift
end

-----------------------------------------------------------------------------
-- Random functions will use lua rands for stand alone script running and Map.rand for in game.
function PWRand()
	if Map then
		return Map.Rand(10000, "Random - Lua") / 10000
	end
	return math.random()
end

function PWRandSeed(fixedseed)
    local seed
    if fixedseed == nil then
        seed = (Map.Rand(32767,"") * 65536) + Map.Rand(65535,"")
    else
        seed = fixedseed
    end
    math.randomseed(seed)
    print("random seed for this map is " .. seed) 
end

function PWRandint(low, high)
	--range is inclusive, low and high are possible results
	return math.random(low, high)
end













--
-- FloatMap
--

-----------------------------------------------------------------------------
-- FloatMap class
-- This is for storing 2D map data. The 'data' field is a zero based, one
-- dimensional array. To access map data by x and y coordinates, use the
-- GetIndex method to obtain the 1D index, which will handle any needs for
-- wrapping in the x and y directions.
-----------------------------------------------------------------------------
FloatMap = inheritsFrom(nil)

function FloatMap:New(width, height, wrapX, wrapY)
	local new_inst = {}
	setmetatable(new_inst, {__index = FloatMap})	--setup metatable

	new_inst.width = width
	new_inst.height = height
	new_inst.wrapX = wrapX
	new_inst.wrapY = wrapY
	new_inst.length = width*height

	--These fields are used to access only a subset of the map
	--with the GetRectIndex function. This is useful for
	--making Perlin noise wrap without generating separate
	--noise fields for each octave
	new_inst.rectX = 0
	new_inst.rectY = 0
	new_inst.rectWidth = width
	new_inst.rectHeight = height

	new_inst.data = {}
	for i = 0,width*height - 1 do
		new_inst.data[i] = 0.0
	end

	return new_inst
end

function FloatMap:GetNeighbor(x,y,dir)
	local xx
	local yy
	local odd = y % 2
	if dir == mg.C then
		return x,y
	elseif dir == mg.W then
		xx = x - 1
		yy = y
		return xx,yy
	elseif dir == mg.NW then
		xx = x - 1 + odd
		yy = y + 1
		return xx,yy
	elseif dir == mg.NE then
		xx = x + odd
		yy = y + 1
		return xx,yy
	elseif dir == mg.E then
		xx = x + 1
		yy = y
		return xx,yy
	elseif dir == mg.SE then
		xx = x + odd
		yy = y - 1
		return xx,yy
	elseif dir == mg.SW then
		xx = x - 1 + odd
		yy = y - 1
		return xx,yy
	else
		print(string.format("Bad direction %s in FloatMap:GetNeighbor", dir))
	end
	return -1,-1
end

function FloatMap:GetIndex(x,y)
	if not self.wrapY and (y < 0 or y > self.height-1) then
		return -1
	elseif not self.wrapX and (x < 0 or x > self.width-1) then
		return -1
	end

	return (y % self.height) * self.width + (x % self.width)
end

function FloatMap:GetXYFromIndex(i)
	local x = i % self.width
	local y = (i - x)/self.width
	return x,y
end

--quadrants are labeled
--A B
--D C
function FloatMap:GetQuadrant(x,y)
	if x < self.width/2 then
		if y < self.height/2 then
			return "A"
		else
			return "D"
		end
	else
		if y < self.height/2 then
			return "B"
		else
			return "C"
		end
	end
end

--Gets an index for x and y based on the current rect settings. x and y are local to the defined rect.
--Wrapping is assumed in both directions
function FloatMap:GetRectIndex(x,y)
	local xx = x % self.rectWidth
	local yy = y % self.rectHeight

	xx = self.rectX + xx
	yy = self.rectY + yy

	return self:GetIndex(xx,yy)
end

function FloatMap:Normalize()
	--find highest and lowest values
	local maxAlt = -1000.0
	local minAlt = 1000.0
	for i = 0,self.length - 1 do
		local alt = self.data[i]
		if alt > maxAlt then
			maxAlt = alt
		end
		if alt < minAlt then
			minAlt = alt
		end

	end
	--subtract minAlt from all values so that
	--all values are zero and above
	for i = 0, self.length - 1, 1 do
		self.data[i] = self.data[i] - minAlt
	end

	--subract minAlt also from maxAlt
	maxAlt = maxAlt - minAlt

	--determine and apply scaler to whole map
	local scaler
	if maxAlt == 0.0 then
		scaler = 0.0
	else
		scaler = 1.0/maxAlt
	end

	-- for i = 0,self.length - 1,1 do
		-- self.data[i] = self.data[i] * scaler
		-- if i == self.length/2 then
			-- print("normalized: "..self.data[i])
		-- end
	-- end

	for i=0,self.length-1,1 do
		self.data[i],expo = math.frexp(self.data[i])
		self.data[i] = (self.data[i]*scaler)
		self.data[i] = math.ldexp(self.data[i],expo)
		-- if i == self.length/2 then
			-- print("normalized: "..self.data[i].." expo: "..expo)
		-- end
	end
end

function FloatMap:GenerateNoise()
	for i = 0,self.length - 1 do
		self.data[i] = PWRand()
	end

end

function FloatMap:GenerateBinaryNoise()
	for i = 0,self.length - 1 do
		if PWRand() > 0.5 then
			self.data[i] = 1
		else
			self.data[i] = 0
		end
	end

end

function FloatMap:FindThresholdFromPercent(percent, greaterThan, excludeZeros)
	local mapList = {}
	local percentage = percent * 100

	if greaterThan then
		percentage = 100 - percentage
	end

	if percentage >= 100 then
		return 1.01 --whole map
	elseif percentage <= 0 then
		return -0.01 --none of the map
	end

	for i = 0,self.length - 1 do
		if not (self.data[i] == 0.0 and excludeZeros) then
			table.insert(mapList,self.data[i])
		end
	end

	table.sort(mapList, function (a,b) return a < b end)
	local threshIndex = math.floor((#mapList * percentage)/100)

	log:Debug("threshIndex %s = math.floor((%s * %s)/100)", threshIndex, #mapList, percentage)
	
	return mapList[threshIndex - 1]

end

function FloatMap:GetLatitudeForY(y)
	local range = mg.topLatitude - mg.bottomLatitude
	local lat = nil
	if y < self.height/2 then
		lat = (y+1) / self.height * range + (mg.bottomLatitude - mg.topLatitude / self.height)
	else
		lat = y / self.height * range + (mg.bottomLatitude + mg.topLatitude / self.height)
	end
	return lat
end

function FloatMap:GetYForLatitude(lat)
	local range = mg.topLatitude - mg.bottomLatitude
	return math.floor(((lat - mg.bottomLatitude) /range * self.height) + 0.5)
end

function FloatMap:GetZone(y)
	local lat = self:GetLatitudeForY(y)
	if y < 0 or y >= self.height then
		return mg.NOZONE
	end
	if lat > mg.polarFrontLatitude then
		return mg.NPOLAR
	elseif lat >= mg.horseLatitudes then
		return mg.NTEMPERATE
	elseif lat >= 0.0 then
		return mg.NEQUATOR
	elseif lat > -mg.horseLatitudes then
		return mg.SEQUATOR
	elseif lat >= -mg.polarFrontLatitude then
		return mg.STEMPERATE
	else
		return mg.SPOLAR
	end
end

function FloatMap:GetYFromZone(zone, bTop)
	if bTop then
		for y=self.height - 1,0,-1 do
			if zone == self:GetZone(y) then
				return y
			end
		end
	else
		for y=0,self.height - 1 do
			if zone == self:GetZone(y) then
				return y
			end
		end
	end
	return -1
end

function FloatMap:GetGeostrophicWindDirections(zone)

	if zone == mg.NPOLAR then
		return mg.SW,mg.W
	elseif zone == mg.NTEMPERATE then
		return mg.NE,mg.E
	elseif zone == mg.NEQUATOR then
		return mg.SW,mg.W
	elseif zone == mg.SEQUATOR then
		return mg.NW,mg.W
	elseif zone == mg.STEMPERATE then
		return mg.SE, mg.E
	else
		return mg.NW,mg.W
	end
	return -1,-1
end

function FloatMap:GetGeostrophicPressure(lat)
	local latRange = nil
	local latPercent = nil
	local pressure = nil
	if lat > mg.polarFrontLatitude then
		latRange = 90.0 - mg.polarFrontLatitude
		latPercent = (lat - mg.polarFrontLatitude)/latRange
		pressure = 1.0 - latPercent
	elseif lat >= mg.horseLatitudes then
		latRange = mg.polarFrontLatitude - mg.horseLatitudes
		latPercent = (lat - mg.horseLatitudes)/latRange
		pressure = latPercent
	elseif lat >= 0.0 then
		latRange = mg.horseLatitudes - 0.0
		latPercent = (lat - 0.0)/latRange
		pressure = 1.0 - latPercent
	elseif lat > -mg.horseLatitudes then
		latRange = 0.0 + mg.horseLatitudes
		latPercent = (lat + mg.horseLatitudes)/latRange
		pressure = latPercent
	elseif lat >= -mg.polarFrontLatitude then
		latRange = -mg.horseLatitudes + mg.polarFrontLatitude
		latPercent = (lat + mg.polarFrontLatitude)/latRange
		pressure = 1.0 - latPercent
	else
		latRange = -mg.polarFrontLatitude + 90.0
		latPercent = (lat + 90)/latRange
		pressure = latPercent
	end
-- Prevents excessively high and low pressures which helps distribute rain more evenly in the affected areas. -Bobert13
	pressure = pressure + 1
	if pressure > 1.5 then
		pressure = pressure * mg.pressureNorm
	else
		pressure = pressure / mg.pressureNorm
	end
	pressure = pressure - 1
-- FIN -Bobert13
	--print(pressure)
	return pressure
end

function FloatMap:ApplyFunction(func)
	for i = 0,self.length - 1 do
		self.data[i] = func(self.data[i])
	end
end

function FloatMap:GetRadiusAroundHex(x,y,radius)
	local list = {}
	table.insert(list,{x,y})
	if radius == 0 then
		return list
	end

	local hereX = x
	local hereY = y

	--make a circle for each radius
	for r = 1,radius do
		--start 1 to the west
		hereX,hereY = self:GetNeighbor(hereX,hereY,mg.W)
		if self:IsOnMap(hereX,hereY) then
			table.insert(list,{hereX,hereY})
		end
		--Go r times to the NE
		for z = 1,r do
			hereX, hereY = self:GetNeighbor(hereX,hereY,mg.NE)
			if self:IsOnMap(hereX,hereY) then
				table.insert(list,{hereX,hereY})
			end
		end
		--Go r times to the E
		for z = 1,r do
			hereX, hereY = self:GetNeighbor(hereX,hereY,mg.E)
			if self:IsOnMap(hereX,hereY) then
				table.insert(list,{hereX,hereY})
			end
		end
		--Go r times to the SE
		for z = 1,r do
			hereX, hereY = self:GetNeighbor(hereX,hereY,mg.SE)
			if self:IsOnMap(hereX,hereY) then
				table.insert(list,{hereX,hereY})
			end
		end
		--Go r times to the SW
		for z = 1,r do
			hereX, hereY = self:GetNeighbor(hereX,hereY,mg.SW)
			if self:IsOnMap(hereX,hereY) then
				table.insert(list,{hereX,hereY})
			end
		end
		--Go r times to the W
		for z = 1,r do
			hereX, hereY = self:GetNeighbor(hereX,hereY,mg.W)
			if self:IsOnMap(hereX,hereY) then
				table.insert(list,{hereX,hereY})
			end
		end
		--Go r - 1 times to the NW!!!!!
		for z = 1,r - 1 do
			hereX, hereY = self:GetNeighbor(hereX,hereY,mg.NW)
			if self:IsOnMap(hereX,hereY) then
				table.insert(list,{hereX,hereY})
			end
		end
		--one extra NW to set up for next circle
		hereX, hereY = self:GetNeighbor(hereX,hereY,mg.NW)
	end
	return list
end

function FloatMap:GetAverageInHex(x,y,radius)
	local sum = 0
	local numPlots = 0
	--print("GetAverageInHex A")
	local nearPlotIDs = Plot_GetPlotsInCircleFast(x, y, radius)
	--print("GetAverageInHex B")
	for _, nearPlotID in pairs(nearPlotIDs) do
		sum = sum + self.data[nearPlotID]
		numPlots = numPlots + 1
	end
	return sum / numPlots
end

function FloatMap:GetStdDevInHex(x,y,radius)
	local average = 0
	local numPlots = 0
	--print("GetStdDevInHex A")
	local nearPlotIDs = Plot_GetPlotsInCircleFast(x, y, radius)
	--print("GetStdDevInHex B")
	
	for _, nearPlotID in ipairs(nearPlotIDs) do
		average = average + self.data[nearPlotID]
		numPlots = numPlots + 1
	end
	average = average / numPlots
	
	local deviation = 0.0
	for _, nearPlotID in ipairs(nearPlotIDs) do
		deviation = deviation + (self.data[nearPlotID] - average) ^ 2
	end
	return math.sqrt(deviation/numPlots)
end

function FloatMap:Smooth(radius)
	--log:Info("FloatMap:Smooth(%s)", radius)
	local dataCopy = {}
	local i = 0
	for y = 0, self.height - 1 do
		for x = 0, self.width - 1 do
--			local i = self:GetIndex(x,y)
			dataCopy[i] = self:GetAverageInHex(x,y,radius)
			i = i + 1
		end
	end
	self.data = dataCopy
end

function FloatMap:Deviate(radius)
	local dataCopy = {}
	local i = 0
	for y = 0, self.height - 1 do
		for x = 0, self.width - 1 do
--			local i = self:GetIndex(x,y)
			dataCopy[i] = self:GetStdDevInHex(x,y,radius)
			i = i + 1
		end
	end
	self.data = dataCopy
end

function FloatMap:IsOnMap(x,y)
	local i = self:GetIndex(x,y)
	if i == -1 then
		return false
	end
	return true
end

function FloatMap:Save(name)
	print("saving " .. name .. "..")
	local str = self.width .. "," .. self.height
	for i = 0,self.length - 1 do
		str = str .. "," .. self.data[i]
	end
	local file = io.open(name,"w+")
	file:write(str)
	file:close()
	print("bitmap saved as " .. name .. ".")
end













--
-- AreaMap
--

PWAreaMap = inheritsFrom(FloatMap)

function PWAreaMap:New(width,height,wrapX,wrapY)
	local new_inst = FloatMap:New(width,height,wrapX,wrapY)
	setmetatable(new_inst, {__index = PWAreaMap})	--setup metatable

	new_inst.areaList = {}
	new_inst.segStack = {}
	return new_inst
end

function PWAreaMap:DefineAreas(matchFunction)
	--zero map data
	for i = 0,self.width*self.height - 1 do
		self.data[i] = 0.0
	end

	self.areaList = {}
	local currentAreaID = 0
	for y = 0, self.height - 1 do
		for x = 0, self.width - 1 do
			local i = self:GetIndex(x,y)
			if self.data[i] == 0 then
				currentAreaID = currentAreaID + 1
				local area = PWArea:New(currentAreaID,x,y,matchFunction(x,y))
				--str = string.format("Filling area %d, matchFunction(x = %d,y = %d) = %s",area.id,x,y,tostring(matchFunction(x,y)))
				--print(str)
				self:FillArea(x,y,area,matchFunction)
				table.insert(self.areaList, area)

			end
		end
	end
end

function PWAreaMap:FillArea(x,y,area,matchFunction)
	self.segStack = {}
	local seg = LineSeg:New(y,x,x,1)
	Push(self.segStack,seg)
	seg = LineSeg:New(y + 1,x,x,-1)
	Push(self.segStack,seg)
	while #self.segStack > 0 do
		seg = Pop(self.segStack)
		self:ScanAndFillLine(seg,area,matchFunction)
	end
end

function PWAreaMap:ScanAndFillLine(seg,area,matchFunction)

	--str = string.format("Processing line y = %d, xLeft = %d, xRight = %d, dy = %d -------",seg.y,seg.xLeft,seg.xRight,seg.dy)
	--print(str)
	if self:ValidateY(seg.y + seg.dy) == -1 then
		return
	end

	local odd = (seg.y + seg.dy) % 2
	local notOdd = seg.y % 2
	--str = string.format("odd = %d, notOdd = %d",odd,notOdd)
	--print(str)

	local lineFound = 0
	local xStop = nil
	if self.wrapX then
		xStop = 0 - (self.width * 30)
	else
		xStop = -1
	end
	local leftExtreme = nil
	for leftExt = seg.xLeft - odd,xStop + 1,-1 do
		leftExtreme = leftExt --need this saved
		--str = string.format("leftExtreme = %d",leftExtreme)
		--print(str)
		local x = self:ValidateX(leftExtreme)
		local y = self:ValidateY(seg.y + seg.dy)
		local i = self:GetIndex(x,y)
		--str = string.format("x = %d, y = %d, area.trueMatch = %s, matchFunction(x,y) = %s",x,y,tostring(area.trueMatch),tostring(matchFunction(x,y)))
		--print(str)
		if self.data[i] == 0 and area.trueMatch == matchFunction(x,y) then
			self.data[i] = area.id
			area.size = area.size + 1
			--print("adding to area")
			lineFound = 1
		else
			--if no line was found, then leftExtreme is fine, but if
			--a line was found going left, then we need to increment
            --xLeftExtreme to represent the inclusive end of the line
			if lineFound == 1 then
				leftExtreme = leftExtreme + 1
				--print("line found, adding 1 to leftExtreme")
			end
			break
		end
	end
	--str = string.format("leftExtreme = %d",leftExtreme)
	--print(str)
	local rightExtreme = nil
	--now scan right to find extreme right, place each found segment on stack
	if self.wrapX then
		xStop = self.width * 20
	else
		xStop = self.width
	end
	for rightExt = seg.xLeft + lineFound - odd,xStop - 1 do
		rightExtreme = rightExt --need this saved
		--str = string.format("rightExtreme = %d",rightExtreme)
		--print(str)
		local x = self:ValidateX(rightExtreme)
		local y = self:ValidateY(seg.y + seg.dy)
		local i = self:GetIndex(x,y)
		--str = string.format("x = %d, y = %d, area.trueMatch = %s, matchFunction(x,y) = %s",x,y,tostring(area.trueMatch),tostring(matchFunction(x,y)))
		--print(str)
		if self.data[i] == 0 and area.trueMatch == matchFunction(x,y) then
			self.data[i] = area.id
			area.size = area.size + 1
			--print("adding to area")
			if lineFound == 0 then
				lineFound = 1 --starting new line
				leftExtreme = rightExtreme
			end
		elseif lineFound == 1 then --found the right end of a line segment
			--print("found right end of line")
			lineFound = 0
			--put same direction on stack
			local newSeg = LineSeg:New(y,leftExtreme,rightExtreme - 1,seg.dy)
			Push(self.segStack,newSeg)
			--str = string.format("  pushing y = %d, xLeft = %d, xRight = %d, dy = %d",y,leftExtreme,rightExtreme - 1,seg.dy)
			--print(str)
			--determine if we must put reverse direction on stack
			if leftExtreme < seg.xLeft - odd or rightExtreme >= seg.xRight + notOdd then
				--out of shadow so put reverse direction on stack
				newSeg = LineSeg:New(y,leftExtreme,rightExtreme - 1,-seg.dy)
				Push(self.segStack,newSeg)
				--str = string.format("  pushing y = %d, xLeft = %d, xRight = %d, dy = %d",y,leftExtreme,rightExtreme - 1,-seg.dy)
				--print(str)
			end
			if(rightExtreme >= seg.xRight + notOdd) then
				break
			end
		elseif lineFound == 0 and rightExtreme >= seg.xRight + notOdd then
			break --past the end of the parent line and no line found
		end
		--continue finding segments
	end
	if lineFound == 1 then --still needing a line to be put on stack
		print("still need line segments")
		lineFound = 0
		--put same direction on stack
		local newSeg = LineSeg:New(seg.y + seg.dy,leftExtreme,rightExtreme - 1,seg.dy)
		Push(self.segStack,newSeg)
		str = string.format("  pushing y = %d, xLeft = %d, xRight = %d, dy = %d",seg.y + seg.dy,leftExtreme,rightExtreme - 1,seg.dy)
		print(str)
		--determine if we must put reverse direction on stack
		if leftExtreme < seg.xLeft - odd or rightExtreme >= seg.xRight + notOdd then
			--out of shadow so put reverse direction on stack
			newSeg = LineSeg:New(seg.y + seg.dy,leftExtreme,rightExtreme - 1,-seg.dy)
			Push(self.segStack,newSeg)
			str = string.format("  pushing y = %d, xLeft = %d, xRight = %d, dy = %d",seg.y + seg.dy,leftExtreme,rightExtreme - 1,-seg.dy)
			print(str)
		end
	end
end

function PWAreaMap:GetAreaByID(id)
	for i = 1,#self.areaList do
		if self.areaList[i].id == id then
			return self.areaList[i]
		end
	end
	error("Can't find area id in AreaMap.areaList")
end

function PWAreaMap:ValidateY(y)
	local yy = nil
	if self.wrapY then
		yy = y % self.height
	elseif y < 0 or y >= self.height then
		return -1
	else
		yy = y
	end
	return yy
end

function PWAreaMap:ValidateX(x)
	local xx = nil
	if self.wrapX then
		xx = x % self.width
	elseif x < 0 or x >= self.width then
		return -1
	else
		xx = x
	end
	return xx
end

function PWAreaMap:PrintAreaList()
	for i=1,#self.areaList do
		local id = self.areaList[i].id
		local seedx = self.areaList[i].seedx
		local seedy = self.areaList[i].seedy
		local size = self.areaList[i].size
		local trueMatch = self.areaList[i].trueMatch
		local str = string.format("area id = %d, trueMatch = %s, size = %d, seedx = %d, seedy = %d",id,tostring(trueMatch),size,seedx,seedy)
		print(str)
	end
end

--Area class
PWArea = inheritsFrom(nil)
function PWArea:New(id,seedx,seedy,trueMatch)
	local new_inst = {}
	setmetatable(new_inst, {__index = PWArea})	--setup metatable

	new_inst.id = id
	new_inst.seedx = seedx
	new_inst.seedy = seedy
	new_inst.trueMatch = trueMatch
	new_inst.size = 0

	return new_inst
end

--LineSeg class
LineSeg = inheritsFrom(nil)
function LineSeg:New(y,xLeft,xRight,dy)
	local new_inst = {}
	setmetatable(new_inst, {__index = LineSeg})	--setup metatable

	new_inst.y = y
	new_inst.xLeft = xLeft
	new_inst.xRight = xRight
	new_inst.dy = dy

	return new_inst
end













--
-- ElevationMap
--

ElevationMap = inheritsFrom(FloatMap)

function ElevationMap:New(width, height, wrapX, wrapY)
	local new_inst = FloatMap:New(width,height,wrapX,wrapY)
	setmetatable(new_inst, {__index = ElevationMap})	--setup metatable
	return new_inst
end
function ElevationMap:IsBelowSeaLevel(x,y)
	local i = self:GetIndex(x,y)
	if self.data[i] < self.seaLevelThreshold then
		return true
	else
		return false
	end
end













--
-- Rivers
--


function AddRivers()
	local mapW, mapH = Map.GetGridSize()
	
	
	for y = 0, mapH-1 do
		for x = 0,mapW-1 do
			local plot = Map.GetPlot(x, y)

			local WOfRiver, NWOfRiver, NEOfRiver = riverMap:GetFlowDirections(x,y)

			if WOfRiver == mg.flowNONE then
				plot:SetWOfRiver(false,WOfRiver)
			else
				local xx,yy = elevationMap:GetNeighbor(x,y,mg.E)
				local nPlot = Map.GetPlot(xx,yy)
				if plot:IsMountain() and nPlot:IsMountain() then
					plot:SetPlotType(PlotTypes.PLOT_HILLS,false,false)
				end
				plot:SetWOfRiver(true,WOfRiver)
				--if debugTime then print(string.format("(%d,%d)WOfRiver = true dir=%d",x,y,WOfRiver)) end
			end

			if NWOfRiver == mg.flowNONE then
				plot:SetNWOfRiver(false,NWOfRiver)
			else
				local xx,yy = elevationMap:GetNeighbor(x,y,mg.SE)
				local nPlot = Map.GetPlot(xx,yy)
				if plot:IsMountain() and nPlot:IsMountain() then
					plot:SetPlotType(PlotTypes.PLOT_HILLS,false,false)
				end
				plot:SetNWOfRiver(true,NWOfRiver)
				--if debugTime then print(string.format("(%d,%d)NWOfRiver = true dir=%d",x,y,NWOfRiver)) end
			end

			if NEOfRiver == mg.flowNONE then
				plot:SetNEOfRiver(false,NEOfRiver)
			else
				local xx,yy = elevationMap:GetNeighbor(x,y,mg.SW)
				local nPlot = Map.GetPlot(xx,yy)
				if plot:IsMountain() and nPlot:IsMountain() then
					plot:SetPlotType(PlotTypes.PLOT_HILLS,false,false)
				end
				plot:SetNEOfRiver(true,NEOfRiver)
				--if debugTime then print(string.format("(%d,%d)NEOfRiver = true dir=%d",x,y,NEOfRiver)) end
			end
		end
	end
end

function Plot_GetPreviousRiverPlot(plot, edgeDirection)
	local flowDirection = Plot_GetRiverFlowDirection(plot, edgeDirection)
	local nearDirection = mg.C
	if edgeDirection == (flowDirection + 1) % 6 then
		nearDirection = (flowDirection + 2) % 6
	else
		nearDirection = (flowDirection + 3) % 6
	end
	local nearPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), nearDirection)
	local edgeA = (flowDirection - 1) % 6
	local edgeB = (flowDirection + 0) % 6
	local flowA = (flowDirection + 1) % 6
	local flowB = (flowDirection - 1) % 6
	return nearPlot, edgeA, edgeB, flowA, flowB
end

function Plot_GetNextRiverPlot(plot, edgeDirection)
	local flowDirection = Plot_GetRiverFlowDirection(plot, edgeDirection)
	local nearDirection = mg.C
	if edgeDirection == (flowDirection + 1) % 6 then
		nearDirection = (flowDirection + 0) % 6
	else
		nearDirection = (flowDirection - 1) % 6
	end
	local nearPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), nearDirection)
	local edgeA = (flowDirection + 2) % 6
	local edgeB = (flowDirection + 3) % 6
	local flowA = (flowDirection + 4) % 6
	local flowB = (flowDirection + 2) % 6
	return nearPlot, edgeA, flowA, edgeB, flowB
end

function Plot_GetRiverFlowDirection(plot, edgeDirection)
	if edgeDirection == mg.E then
		return plot:GetRiverEFlowDirection()
	elseif edgeDirection == mg.SW then
		return plot:GetRiverSWFlowDirection()
	elseif edgeDirection == mg.SE then
		return plot:GetRiverSEFlowDirection()
	else
		nextPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), edgeDirection)
		if not nextPlot then
			return mg.flowNONE
		end
		if edgeDirection == mg.W then
			return nextPlot:GetRiverEFlowDirection()
		elseif edgeDirection == mg.NE then
			return nextPlot:GetRiverSWFlowDirection()
		elseif edgeDirection == mg.NW then
			return nextPlot:GetRiverSEFlowDirection()
		end
	end
	return mg.flowNONE
end

function Plot_GetRiverRotation(plot, edgeDirection)
	if not Plot_IsRiver(plot, edgeDirection) then
		return 0 -- no river
	end
	if Plot_GetRiverFlowDirection(plot, edgeDirection) == (edgeDirection + 2) % 6 then
		return 1 -- clockwise
	end
	return -1 -- counterclockwise
end

function Plot_IsRiver(plot, edgeDirection)
	if edgeDirection then
		return Plot_IsRiverInDirection(plot, edgeDirection)
	end
	for _, edgeDirection in pairs(mg.edgeDirections) do
		if Plot_IsRiverInDirection(plot, edgeDirection) then
			return true
		end
	end
	return false
end

function Plot_IsRiverInDirection(plot, edgeDirection)
	if edgeDirection == mg.E then
		return plot:IsWOfRiver()
	elseif edgeDirection == mg.SE then
		return plot:IsNWOfRiver()
	elseif edgeDirection == mg.SW then
		return plot:IsNEOfRiver()
	else
		nextPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), edgeDirection)
		if not nextPlot then
			return false
		end
		if edgeDirection == mg.W then
			return nextPlot:IsWOfRiver()
		elseif edgeDirection == mg.NW then
			return nextPlot:IsNWOfRiver()
		elseif edgeDirection == mg.NE then
			return nextPlot:IsNEOfRiver()
		end
	end
	return false
end

function Plot_SetRiver(plot, edgeDirection, flowDirection)
	local isRiver = (flowDirection ~= mg.flowNONE)
	if edgeDirection == mg.E then
		plot:SetWOfRiver(isRiver, flowDirection)
	elseif edgeDirection == mg.SE then
		plot:SetNWOfRiver(isRiver, flowDirection)
	elseif edgeDirection == mg.SW then
		plot:SetNEOfRiver(isRiver, flowDirection)
	else
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), edgeDirection)
		if not plot then
			return false
		end
		if edgeDirection == mg.W then
			plot:SetWOfRiver(isRiver, flowDirection)
		elseif edgeDirection == mg.NW then
			plot:SetNWOfRiver(isRiver, flowDirection)
		elseif edgeDirection == mg.NE then
			plot:SetNEOfRiver(isRiver, flowDirection)
		end
	end
	--plot:SetFeatureType(FeatureTypes.FEATURE_ICE, -1)
	return true
end

RiverMap = inheritsFrom(nil)

function RiverMap:New(elevationMap)
	local new_inst = {}
	setmetatable(new_inst, {__index = RiverMap})

	new_inst.elevationMap = elevationMap
	new_inst.riverData = {}
	for y = 0,new_inst.elevationMap.height - 1 do
		for x = 0,new_inst.elevationMap.width - 1 do
			local i = new_inst.elevationMap:GetIndex(x,y)
			new_inst.riverData[i] = RiverHex:New(x,y)
		end
	end

	return new_inst
end

function RiverMap:GetJunction(x,y,isNorth)
	local i = self.elevationMap:GetIndex(x,y)
	if isNorth then
		return self.riverData[i].northJunction
	else
		return self.riverData[i].southJunction
	end
end

function RiverMap:GetJunctionNeighbor(direction,junction)
	local xx = nil
	local yy = nil
	local ii = nil
	local neighbor = nil
	local odd = junction.y % 2
	if direction == mg.NOFLOW then
		error("can't get junction neighbor in direction NOFLOW")
	elseif direction == mg.WESTFLOW then
		xx = junction.x + odd - 1
		if junction.isNorth then
			yy = junction.y + 1
		else
			yy = junction.y - 1
		end
		ii = self.elevationMap:GetIndex(xx,yy)
		if ii ~= -1 then
			neighbor = self:GetJunction(xx,yy,not junction.isNorth)
			return neighbor
		end
	elseif direction == mg.EASTFLOW then
		xx = junction.x + odd
		if junction.isNorth then
			yy = junction.y + 1
		else
			yy = junction.y - 1
		end
		ii = self.elevationMap:GetIndex(xx,yy)
		if ii ~= -1 then
			neighbor = self:GetJunction(xx,yy,not junction.isNorth)
			return neighbor
		end
	elseif direction == mg.VERTFLOW then
		xx = junction.x
		if junction.isNorth then
			yy = junction.y + 2
		else
			yy = junction.y - 2
		end
		ii = self.elevationMap:GetIndex(xx,yy)
		if ii ~= -1 then
			neighbor = self:GetJunction(xx,yy,not junction.isNorth)
			return neighbor
		end
	end

	return nil --neighbor off map
end

--Get the west or east hex neighboring this junction
function RiverMap:GetRiverHexNeighbor(junction,westNeighbor)
	local xx = nil
	local yy = nil
	local ii = nil
	local odd = junction.y % 2
	if junction.isNorth then
		yy = junction.y + 1
	else
		yy = junction.y - 1
	end
	if westNeighbor then
		xx = junction.x + odd - 1
	else
		xx = junction.x + odd
	end

	ii = self.elevationMap:GetIndex(xx,yy)
	if ii ~= -1 then
		return self.riverData[ii]
	end

	return nil
end

function RiverMap:SetJunctionAltitudes()
	for y = 0,self.elevationMap.height - 1 do
		for x = 0,self.elevationMap.width - 1 do
			local i = self.elevationMap:GetIndex(x,y)
			local vertAltitude = self.elevationMap.data[i]
			local westAltitude = nil
			local eastAltitude = nil
			local vertNeighbor = self.riverData[i]
			local westNeighbor = nil
			local eastNeighbor = nil
			local xx = nil
			local yy = nil
			local ii = nil

			--first do north
			westNeighbor = self:GetRiverHexNeighbor(vertNeighbor.northJunction,true)
			eastNeighbor = self:GetRiverHexNeighbor(vertNeighbor.northJunction,false)

			if westNeighbor ~= nil then
				ii = self.elevationMap:GetIndex(westNeighbor.x,westNeighbor.y)
			else
				ii = -1
			end

			if ii ~= -1 then
				westAltitude = self.elevationMap.data[ii]
			else
				westAltitude = vertAltitude
			end

			if eastNeighbor ~= nil then
				ii = self.elevationMap:GetIndex(eastNeighbor.x, eastNeighbor.y)
			else
				ii = -1
			end

			if ii ~= -1 then
				eastAltitude = self.elevationMap.data[ii]
			else
				eastAltitude = vertAltitude
			end

			vertNeighbor.northJunction.altitude = math.min(math.min(vertAltitude,westAltitude),eastAltitude)

			--then south
			westNeighbor = self:GetRiverHexNeighbor(vertNeighbor.southJunction,true)
			eastNeighbor = self:GetRiverHexNeighbor(vertNeighbor.southJunction,false)

			if westNeighbor ~= nil then
				ii = self.elevationMap:GetIndex(westNeighbor.x,westNeighbor.y)
			else
				ii = -1
			end

			if ii ~= -1 then
				westAltitude = self.elevationMap.data[ii]
			else
				westAltitude = vertAltitude
			end

			if eastNeighbor ~= nil then
				ii = self.elevationMap:GetIndex(eastNeighbor.x, eastNeighbor.y)
			else
				ii = -1
			end

			if ii ~= -1 then
				eastAltitude = self.elevationMap.data[ii]
			else
				eastAltitude = vertAltitude
			end

			vertNeighbor.southJunction.altitude = math.min(math.min(vertAltitude,westAltitude),eastAltitude)
		end
	end
end

function RiverMap:isLake(junction)

	--first exclude the map edges that don't have neighbors
	if junction.y == 0 and junction.isNorth == false then
		return false
	elseif junction.y == self.elevationMap.height - 1 and junction.isNorth == true then
		return false
	end

	--exclude altitudes below sea level
	if junction.altitude < self.elevationMap.seaLevelThreshold then
		return false
	end

	--if debugTime then print(string.format("junction = (%d,%d) N = %s, alt = %f",junction.x,junction.y,tostring(junction.isNorth),junction.altitude)) end

	local vertNeighbor = self:GetJunctionNeighbor(mg.VERTFLOW,junction)
	local vertAltitude = nil
	if vertNeighbor == nil then
		vertAltitude = junction.altitude
		--print("--vertNeighbor == nil")
	else
		vertAltitude = vertNeighbor.altitude
		--if debugTime then print(string.format("--vertNeighbor = (%d,%d) N = %s, alt = %f",vertNeighbor.x,vertNeighbor.y,tostring(vertNeighbor.isNorth),vertNeighbor.altitude)) end
	end

	local westNeighbor = self:GetJunctionNeighbor(mg.WESTFLOW,junction)
	local westAltitude = nil
	if westNeighbor == nil then
		westAltitude = junction.altitude
		--print("--westNeighbor == nil")
	else
		westAltitude = westNeighbor.altitude
		--if debugTime then print(string.format("--westNeighbor = (%d,%d) N = %s, alt = %f",westNeighbor.x,westNeighbor.y,tostring(westNeighbor.isNorth),westNeighbor.altitude)) end
	end

	local eastNeighbor = self:GetJunctionNeighbor(mg.EASTFLOW,junction)
	local eastAltitude = nil
	if eastNeighbor == nil then
		eastAltitude = junction.altitude
		--print("--eastNeighbor == nil")
	else
		eastAltitude = eastNeighbor.altitude
		--if debugTime then print(string.format("--eastNeighbor = (%d,%d) N = %s, alt = %f",eastNeighbor.x,eastNeighbor.y,tostring(eastNeighbor.isNorth),eastNeighbor.altitude)) end
	end

	local lowest = math.min(vertAltitude,math.min(westAltitude,math.min(eastAltitude,junction.altitude)))

	if lowest == junction.altitude then
		--print("--is lake")
		return true
	end
	--print("--is not lake")
	return false
end

--get the average altitude of the two lowest neighbors that are higher than the junction altitude.
function RiverMap:GetLowerNeighborAverage(junction)
	local vertNeighbor = self:GetJunctionNeighbor(mg.VERTFLOW,junction)
	local vertAltitude = nil
	if vertNeighbor == nil then
		vertAltitude = junction.altitude
	else
		vertAltitude = vertNeighbor.altitude
	end

	local westNeighbor = self:GetJunctionNeighbor(mg.WESTFLOW,junction)
	local westAltitude = nil
	if westNeighbor == nil then
		westAltitude = junction.altitude
	else
		westAltitude = westNeighbor.altitude
	end

	local eastNeighbor = self:GetJunctionNeighbor(mg.EASTFLOW,junction)
	local eastAltitude = nil
	if eastNeighbor == nil then
		eastAltitude = junction.altitude
	else
		eastAltitude = eastNeighbor.altitude
	end

	local nList = {vertAltitude,westAltitude,eastAltitude}
	table.sort(nList)
	local avg = nil
	if nList[1] > junction.altitude then
		avg = (nList[1] + nList[2])/2.0
	elseif nList[2] > junction.altitude then
		avg = (nList[2] + nList[3])/2.0
	elseif nList[3] > junction.altitude then
		avg = (nList[3] + junction.altitude)/2.0
	else
		avg = junction.altitude --all neighbors are the same height. Dealt with later
	end
	return avg
end

--this function alters the drainage pattern
function RiverMap:SiltifyLakes()
	local lakeList = {}
	local onQueueMapNorth = {}
	local onQueueMapSouth = {}
	for y = 0,self.elevationMap.height - 1 do
		for x = 0,self.elevationMap.width - 1 do
			local i = self.elevationMap:GetIndex(x,y)
			onQueueMapNorth[i] = false
			onQueueMapSouth[i] = false
			if self:isLake(self.riverData[i].northJunction) then
				Push(lakeList,self.riverData[i].northJunction)
				onQueueMapNorth[i] = true
			end
			if self:isLake(self.riverData[i].southJunction) then
				Push(lakeList,self.riverData[i].southJunction)
				onQueueMapSouth[i] = true
			end
		end
	end

	local longestLakeList = #lakeList
	local shortestLakeList = #lakeList
	local iterations = 0
	local debugOn = false
	--if debugTime then print(string.format("initial lake count = %d",longestLakeList)) end
	while #lakeList > 0 do
		--if debugTime then print(string.format("length of lakeList = %d",#lakeList)) end
		iterations = iterations + 1
		if #lakeList > longestLakeList then
			longestLakeList = #lakeList
		end

		if #lakeList < shortestLakeList then
			shortestLakeList = #lakeList
			--if debugTime then print(string.format("shortest lake list = %d, iterations = %d",shortestLakeList,iterations)) end
			iterations = 0
		end

		if iterations > 1000000 then
			debugOn = true
		end

		if iterations > 1001000 then
			error("endless loop in lake siltification. check logs")
		end

		local junction = Pop(lakeList)
		local i = self.elevationMap:GetIndex(junction.x,junction.y)
		if junction.isNorth then
			onQueueMapNorth[i] = false
		else
			onQueueMapSouth[i] = false
		end

		if debugOn then
			if debugTime then print(string.format("processing (%d,%d) N=%s alt=%f",junction.x,junction.y,tostring(junction.isNorth),junction.altitude)) end
		end

		local avgLowest = self:GetLowerNeighborAverage(junction)

		if debugOn then
			if debugTime then print(string.format("--avgLowest == %f",avgLowest)) end
		end

		if avgLowest < junction.altitude + 0.005 then --cant use == in fp comparison
			junction.altitude = avgLowest + 0.005
			if debugOn then
				print("--adding 0.005 to avgLowest")
			end
		else
			junction.altitude = avgLowest
		end

		if debugOn then
			if debugTime then print(string.format("--changing altitude to %f",junction.altitude)) end
		end

		for dir = mg.WESTFLOW,mg.VERTFLOW do
			local neighbor = self:GetJunctionNeighbor(dir,junction)
			if debugOn and neighbor == nil then
				if debugTime then print(string.format("--nil neighbor at direction = %d",dir)) end
			end
			if neighbor ~= nil and self:isLake(neighbor) then
				local i = self.elevationMap:GetIndex(neighbor.x,neighbor.y)
				if neighbor.isNorth == true and onQueueMapNorth[i] == false then
					Push(lakeList,neighbor)
					onQueueMapNorth[i] = true
					if debugOn then
						if debugTime then print(string.format("--pushing (%d,%d) N=%s alt=%f",neighbor.x,neighbor.y,tostring(neighbor.isNorth),neighbor.altitude)) end
					end
				elseif neighbor.isNorth == false and onQueueMapSouth[i] == false then
					Push(lakeList,neighbor)
					onQueueMapSouth[i] = true
					if debugOn then
						if debugTime then print(string.format("--pushing (%d,%d) N=%s alt=%f",neighbor.x,neighbor.y,tostring(neighbor.isNorth),neighbor.altitude)) end
					end
				end
			end
		end
	end
	--if debugTime then print(string.format("longestLakeList = %d",longestLakeList)) end

	--if debugTime then print(string.format("sea level = %f",self.elevationMap.seaLevelThreshold)) end

	--[[
	local belowSeaLevelCount = 0
	local riverTest = FloatMap:New(self.elevationMap.width,self.elevationMap.height,self.elevationMap.xWrap,self.elevationMap.yWrap)
	local lakesFound = false
	for y = 0,self.elevationMap.height - 1 do
		for x = 0,self.elevationMap.width - 1 do
			local i = self.elevationMap:GetIndex(x,y)

			local northAltitude = self.riverData[i].northJunction.altitude
			local southAltitude = self.riverData[i].southJunction.altitude
			if northAltitude < self.elevationMap.seaLevelThreshold then
				belowSeaLevelCount = belowSeaLevelCount + 1
			end
			if southAltitude < self.elevationMap.seaLevelThreshold then
				belowSeaLevelCount = belowSeaLevelCount + 1
			end
			riverTest.data[i] = (northAltitude + southAltitude)/2.0

			if self:isLake(self.riverData[i].northJunction) then
				local junction = self.riverData[i].northJunction
				if debugTime then print(string.format("lake found at (%d, %d) isNorth = %s, altitude = %f!",junction.x,junction.y,tostring(junction.isNorth),junction.altitude)) end
				riverTest.data[i] = 1.0
				lakesFound = true
			end
			if self:isLake(self.riverData[i].southJunction) then
				local junction = self.riverData[i].southJunction
				if debugTime then print(string.format("lake found at (%d, %d) isNorth = %s, altitude = %f!",junction.x,junction.y,tostring(junction.isNorth),junction.altitude)) end
				riverTest.data[i] = 1.0
				lakesFound = true
			end
		end
	end

	if lakesFound then
		--error("Failed to siltify lakes. check logs")
	end
	--]]
	--riverTest:Normalize()
--	riverTest:Save("riverTest.csv")
end

function RiverMap:SetFlowDestinations()
	junctionList = {}
	for y = 0,self.elevationMap.height - 1 do
		for x = 0,self.elevationMap.width - 1 do
			local i = self.elevationMap:GetIndex(x,y)
			table.insert(junctionList,self.riverData[i].northJunction)
			table.insert(junctionList,self.riverData[i].southJunction)
		end
	end

	table.sort(junctionList,function (a,b) return a.altitude > b.altitude end)

	for n=1,#junctionList do
		local junction = junctionList[n]
		local validList = self:GetValidFlows(junction)
		if #validList > 0 then
			local choice = PWRandint(1,#validList)
			junction.flow = validList[choice]
		else
			junction.flow = mg.NOFLOW
		end
	end
end

function RiverMap:GetValidFlows(junction)
	local validList = {}
	for dir = mg.WESTFLOW,mg.VERTFLOW do
		neighbor = self:GetJunctionNeighbor(dir,junction)
		if neighbor ~= nil and neighbor.altitude < junction.altitude then
			table.insert(validList,dir)
		end
	end
	return validList
end

function RiverMap:IsTouchingOcean(junction)

	if elevationMap:IsBelowSeaLevel(junction.x,junction.y) then
		return true
	end
	local westNeighbor = self:GetRiverHexNeighbor(junction,true)
	local eastNeighbor = self:GetRiverHexNeighbor(junction,false)

	if westNeighbor == nil or elevationMap:IsBelowSeaLevel(westNeighbor.x,westNeighbor.y) then
		return true
	end
	if eastNeighbor == nil or elevationMap:IsBelowSeaLevel(eastNeighbor.x,eastNeighbor.y) then
		return true
	end
	return false
end

function RiverMap:SetRiverSizes(rainfallMap)
	local junctionList = {} --only include junctions not touching ocean in this list
	for y = 0,self.elevationMap.height - 1 do
		for x = 0,self.elevationMap.width - 1 do
			local i = self.elevationMap:GetIndex(x,y)
			if not self:IsTouchingOcean(self.riverData[i].northJunction) then
				table.insert(junctionList,self.riverData[i].northJunction)
			end
			if not self:IsTouchingOcean(self.riverData[i].southJunction) then
				table.insert(junctionList,self.riverData[i].southJunction)
			end
		end
	end

	table.sort(junctionList,function (a,b) return a.altitude > b.altitude end)

	for n=1,#junctionList do
		local junction = junctionList[n]
		local nextJunction = junction
		local i = self.elevationMap:GetIndex(junction.x,junction.y)
		while true do
			nextJunction.size = (nextJunction.size + rainfallMap.data[i]) * mg.riverRainCheatFactor
			if nextJunction.flow == mg.NOFLOW or self:IsTouchingOcean(nextJunction) then
				nextJunction.size = 0.0
				break
			end
			nextJunction = self:GetJunctionNeighbor(nextJunction.flow,nextJunction)
		end
	end

	--now sort by river size to find river threshold
	table.sort(junctionList,function (a,b) return a.size > b.size end)
	local riverIndex = math.floor(mg.riverPercent * #junctionList)
	self.riverThreshold = junctionList[riverIndex].size
	if debugTime then print(string.format("river threshold = %f",self.riverThreshold)) end

--~ 	local riverMap = FloatMap:New(self.elevationMap.width,self.elevationMap.height,self.elevationMap.xWrap,self.elevationMap.yWrap)
--~ 	for y = 0,self.elevationMap.height - 1 do
--~ 		for x = 0,self.elevationMap.width - 1 do
--~ 			local i = self.elevationMap:GetIndex(x,y)
--~ 			riverMap.data[i] = math.max(self.riverData[i].northJunction.size,self.riverData[i].southJunction.size)
--~ 		end
--~ 	end
--~ 	riverMap:Normalize()
	--riverMap:Save("riverSizeMap.csv")
end

--This function returns the flow directions needed by civ
function RiverMap:GetFlowDirections(x,y)
	--if debugTime then print(string.format("Get flow dirs for %d,%d",x,y)) end
	local i = elevationMap:GetIndex(x,y)

	local WOfRiver = mg.flowNONE
	local xx,yy = elevationMap:GetNeighbor(x,y,mg.NE)
	local ii = elevationMap:GetIndex(xx,yy)
	if ii ~= -1 and self.riverData[ii].southJunction.flow == mg.VERTFLOW and self.riverData[ii].southJunction.size > self.riverThreshold then
		--if debugTime then print(string.format("--NE(%d,%d) south flow=%d, size=%f",xx,yy,self.riverData[ii].southJunction.flow,self.riverData[ii].southJunction.size)) end
		WOfRiver = mg.flowS
	end
	xx,yy = elevationMap:GetNeighbor(x,y,mg.SE)
	ii = elevationMap:GetIndex(xx,yy)
	if ii ~= -1 and self.riverData[ii].northJunction.flow == mg.VERTFLOW and self.riverData[ii].northJunction.size > self.riverThreshold then
		--if debugTime then print(string.format("--SE(%d,%d) north flow=%d, size=%f",xx,yy,self.riverData[ii].northJunction.flow,self.riverData[ii].northJunction.size)) end
		WOfRiver = mg.flowN
	end

	local NWOfRiver = mg.flowNONE
	xx,yy = elevationMap:GetNeighbor(x,y,mg.SE)
	ii = elevationMap:GetIndex(xx,yy)
	if ii ~= -1 and self.riverData[ii].northJunction.flow == mg.WESTFLOW and self.riverData[ii].northJunction.size > self.riverThreshold then
		NWOfRiver = mg.flowSW
	end
	if self.riverData[i].southJunction.flow == mg.EASTFLOW and self.riverData[i].southJunction.size > self.riverThreshold then
		NWOfRiver = mg.flowNE
	end

	local NEOfRiver = mg.flowNONE
	xx,yy = elevationMap:GetNeighbor(x,y,mg.SW)
	ii = elevationMap:GetIndex(xx,yy)
	if ii ~= -1 and self.riverData[ii].northJunction.flow == mg.EASTFLOW and self.riverData[ii].northJunction.size > self.riverThreshold then
		NEOfRiver = mg.flowSE
	end
	if self.riverData[i].southJunction.flow == mg.WESTFLOW and self.riverData[i].southJunction.size > self.riverThreshold then
		NEOfRiver = mg.flowNW
	end

	return WOfRiver,NWOfRiver,NEOfRiver
end

--RiverHex class
RiverHex = inheritsFrom(nil)
function RiverHex:New(x, y)
	local new_inst = {}
	setmetatable(new_inst, {__index = RiverHex})

	new_inst.x = x
	new_inst.y = y
	new_inst.northJunction = RiverJunction:New(x,y,true)
	new_inst.southJunction = RiverJunction:New(x,y,false)

	return new_inst
end

--RiverJunction class
RiverJunction = inheritsFrom(nil)
function RiverJunction:New(x,y,isNorth)
	local new_inst = {}
	setmetatable(new_inst, {__index = RiverJunction})

	new_inst.x = x
	new_inst.y = y
	new_inst.isNorth = isNorth
	new_inst.altitude = 0.0
	new_inst.flow = mg.NOFLOW
	new_inst.size = 0.0

	return new_inst
end

































--
-- RouteConnections.lua
--
-- Copyright 2011  (c)  William Howard
--
-- Determines if a route exists between two plots/cities
--
-- Permission granted to re-distribute this file as part of a mod
-- on the condition that this comment block is preserved in its entirity
--


----- PUBLIC METHODS -----

       

--
-- pPlayer                 - player object (not ID) or nil
-- pStartPlot, pTargetPlot - plot objects (not IDs)
-- sRoute                  - one of mg.routes (see above)
-- bShortestRoute          - true to find the shortest route
-- sHighlight              - one of the highlight keys (see above)
-- fBlockaded              - call-back function of the form f(pPlot, pPlayer) to determine if a plot is blocked for this player (return true if blocked)
--

function isCityConnected(pPlayer, pStartCity, pTargetCity, sRoute, bShortestRoute, sHighlight, fBlockaded)
  return isPlotConnected(pPlayer, pStartCity:Plot(), pTargetCity:Plot(), sRoute, bShortestRoute, sHighlight, fBlockaded)
end

function isPlotConnected(pPlayer, pStartPlot, pTargetPlot, sRoute, bShortestRoute, sHighlight, fBlockaded)
  if (bShortestRoute) then
    mg.lastRouteLength = plotToPlotShortestRoute(pPlayer, pStartPlot, pTargetPlot, sRoute, mg.highlights[sHighlight], fBlockaded)
  else
    mg.lastRouteLength = plotToPlotConnection(pPlayer, pStartPlot, pTargetPlot, sRoute, 1, mg.highlights[sHighlight], listAddPlot(pStartPlot, {}), fBlockaded)
  end

  return (mg.lastRouteLength ~= 0)
end

function getRouteLength()
  return mg.lastRouteLength
end

function getDistance(pPlot1, pPlot2)
  return distanceBetween(pPlot1, pPlot2)
end


----- PRIVATE DATA AND METHODS -----

--
-- Check if pStartPlot is connected to pTargetPlot
--
-- NOTE: This is a recursive method
--
-- Returns the length of the route between the start and target plots (inclusive) - so 0 if no route
--

function plotToPlotConnection(pPlayer, pStartPlot, pTargetPlot, sRoute, iLength, highlight, listVisitedPlots, fBlockaded)
  if (highlight ~= nil) then
    Events.SerialEventHexHighlight(PlotToHex(pStartPlot), true, highlight)
  end

  -- Have we got there yet?
  if (isSamePlot(pStartPlot, pTargetPlot)) then
    return iLength
  end

  -- Find any new plots we can visit from here
  local listRoutes = listFilter(reachablePlots(pPlayer, pStartPlot, sRoute, fBlockaded), listVisitedPlots)

  -- New routes to check, so there is an onward path
  if (listRoutes ~= nil) then
    -- Covert the associative array into a linear array so it can be sorted
    local array = {}
    for sId, pPlot in pairs(listRoutes) do
      table.insert(array, pPlot)
    end

    -- Now sort the linear array by distance from the target plot
    table.sort(array, function(x, y) return (distanceBetween(x, pTargetPlot) < distanceBetween(y, pTargetPlot)) end)

    -- Now check each onward plot in turn to see if that is connected
    for i, pPlot in ipairs(array) do
      -- Check that a prior route didn't visit this plot
      if (not listContainsPlot(pPlot, listVisitedPlots)) then
        -- Add this plot to the list of visited plots
        listAddPlot(pPlot, listVisitedPlots)

        -- If there's a route, we're done
        local iLen = plotToPlotConnection(pPlayer, pPlot, pTargetPlot, sRoute, iLength+1, highlight, listVisitedPlots, fBlockaded)
        if (iLen > 0) then
          return iLen
        end
      end
    end
  end

  if (highlight ~= nil) then
    Events.SerialEventHexHighlight(PlotToHex(pStartPlot), false)
  end

  -- No connection found
  return 0
end


--
-- Find the shortest route between two plots
--
-- We start at the TARGET plot - as the path length from here to the target plot is 1,
-- we will call this "ring 1".  We then find all reachable near plots and place them in "ring 2".
-- If the START plot is in "ring 2", we have a route, if "ring 2" is empty, there is no route,
-- otherwise find all reachable near plots that have not already been seen and place those in "ring 3"
-- We then loop, checking "ring N" otherwise generating "ring N+1"
--
-- Once we have found a route, the path length will be of length N and we know that there must be at 
-- least one route by picking a plot from each ring.  The plot needed from "ring N" is the START plot,
-- we then need ANY plot from "ring N-1" that is near to the start plot. And in general we need 
-- any plot from "ring M-1" that is near to the plot choosen from "ring M".  The final plot in 
-- the path will always be the target plot as that is the only plot in "ring 1"
--
-- Returns the length of the route between the start and target plots (inclusive) - so 0 if no route
--

function plotToPlotShortestRoute(pPlayer, pStartPlot, pTargetPlot, sRoute, highlight, fBlockaded)
  local rings = {}

  local iRing = 1
  rings[iRing] = listAddPlot(pTargetPlot, {})

  repeat
    iRing = generateNextRing(pPlayer, sRoute, rings, iRing, fBlockaded)

    bFound = listContainsPlot(pStartPlot, rings[iRing])
    bNoRoute = (rings[iRing] == nil)
  until (bFound or bNoRoute)

  if (bFound and highlight ~= nil) then
    Events.SerialEventHexHighlight(PlotToHex(pStartPlot), true, highlight)

    local pLastPlot = pStartPlot

    for i = iRing - 1, 1, -1 do
      pNextPlot = listFirstAdjacentPlot(pLastPlot, rings[i])
      
      -- Check should be completely unnecessary
      if (pNextPlot == nil) then
        return 0
      end

      Events.SerialEventHexHighlight(PlotToHex(pNextPlot), true, highlight)

      pLastPlot = pNextPlot
    end
  end  
  
  return (bFound) and iRing or 0
end

-- Helper method to find all plots near to the plots in the specified ring
function generateNextRing(pPlayer, sRoute, rings, iRing, fBlockaded)
  local nextRing = nil

  --print("generateNextRing " .. iRing)
  for k, pPlot in pairs(rings[iRing]) do
    -- Consider two near tiles A and B,  if A is in ring N, B must either be unvisited or in ring N-1
    -- for if B was in ring N-2, A would have to be in ring N-1 - which it is not
    local listRoutes = listFilter(reachablePlots(pPlayer, pPlot, sRoute, fBlockaded), ((iRing > 1) and rings[iRing-1] or {}))

    if (listRoutes ~= nil) then
      for sId, pPlot in pairs(listRoutes) do
        nextRing = nextRing or {}
        listAddPlot(pPlot, nextRing)
      end
    end
  end

  rings[iRing+1] = nextRing

  return iRing+1
end


--
-- Methods dealing with finding all near tiles that can be reached by the specified route type
--

-- Return a list of (up to 6) reachable plots from this one by route type
function reachablePlots(pPlayer, pPlot, sRoute, fBlockaded)
  local list = nil
  for pDestPlot in Plot_GetPlotsInCircle(pPlot, 1) do
    -- Don't let submarines fall over the edge!
    if (pDestPlot ~= nil) then
      if (pPlayer == nil or pDestPlot:IsRevealed(pPlayer:GetTeam())) then
        local bAdd = false
        -- Be careful of order, must check for road before rail, and coastal before ocean
        if (sRoute == mg.routes[1] and (pDestPlot:GetPlotType() == PlotTypes.PLOT_LAND or pDestPlot:GetPlotType() == PlotTypes.PLOT_HILLS)) then		
          bAdd = true
        elseif (sRoute == mg.routes[2] and pDestPlot:GetRouteType() >= 0) then
          bAdd = true
        elseif (sRoute == mg.routes[3] and pDestPlot:GetRouteType() >= 1) then
          bAdd = true
        elseif (sRoute == mg.routes[4] and pDestPlot:GetTerrainType() == TerrainTypes.TERRAIN_COAST) then
          bAdd = true
        elseif (sRoute == mg.routes[5] and pDestPlot:IsWater()) then
          bAdd = true
        elseif (sRoute == mg.routes[6] and pDestPlot:IsWater()) then
          bAdd = true
        end
        -- Special case for water, a city on the coast counts as water
        if (not bAdd and (sRoute == mg.routes[4] or sRoute == mg.routes[5] or sRoute == mg.routes[6])) then
          bAdd = pDestPlot:IsCity()
        end
        -- Check for impassable and blockaded tiles
        bAdd = bAdd and isPassable(pDestPlot, sRoute) and not isBlockaded(pDestPlot, pPlayer, fBlockaded)
        if (bAdd) then
          list = list or {}
          listAddPlot(pDestPlot, list)
        end
      end
    end
  end
  return list
end

-- Is the plot passable for this route type ..
function isPassable(pPlot, sRoute)
  bPassable = true

  -- .. due to terrain, eg natural wonders and those covered in ice
  iFeature = pPlot:GetFeatureType()
  if (iFeature > 0 and GameInfo.Features[iFeature].NaturalWonder == true) then
    bPassable = false
  elseif (iFeature == FeatureTypes.FEATURE_ICE and sRoute ~= mg.routes[6]) then
    bPassable = false
  end

  return bPassable
end

-- Is the plot blockaded for this player ..
function isBlockaded(pPlot, pPlayer, fBlockaded)
  bBlockaded = false

  if (fBlockaded ~= nil) then
    bBlockaded = fBlockaded(pPlot, pPlayer)
  end

  return bBlockaded
end



--
-- Calculate the distance between two plots
--
-- See http://www-cs-students.stanford.edu/~amitp/Articles/HexLOS.html
-- Also http://keekerdc.com/2011/03/hexagon-grids-coordinate-systems-and-distance-calculations/
--
function distanceBetween(pPlot1, pPlot2)
  local mapX, mapY = Map.GetGridSize()

  -- Need to work on a hex based grid
  local hex1 = PlotToHex(pPlot1)
  local hex2 = PlotToHex(pPlot2)

  -- Calculate the distance between the x and z co-ordinate pairs
  -- allowing for the East-West wrap, (ie shortest route may be by going backwards!)
  local deltaX = math.min(math.abs(hex2.x - hex1.x), mapX - math.abs(hex2.x - hex1.x))
  local deltaZ = math.min(math.abs(hex2.z - hex1.z), mapX - math.abs(hex2.z - hex1.z))

  -- Calculate the distance between the y co-ordinates
  -- there is no North-South wrap, so this is easy
  local deltaY = math.abs(hex2.y - hex1.y)

  -- Calculate the distance between the plots
  local distance = math.max(deltaX, deltaY, deltaZ)

  -- Allow for both end points in the distance calculation
  return distance + 1
end

-- Get the hex co-ordinates of a plot
function PlotToHex(pPlot)
  local hex = ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))

  -- X + y + z = 0, hence z = -(x+y)
  hex.z = -(hex.x + hex.y)

  return hex
end


--
-- List (associative arrays) helper methods
--

-- Return a list formed by removing all entries from list1 which are in list2
function listFilter(list1, list2)
  local list = nil

  if (list1 ~= nil) then
    for sKey, pPlot in pairs(list1) do
      if (list2 == nil or list2[sKey] == nil) then
        list = list or {}
        list[sKey] = pPlot
      end
    end
  end

  return list
end

-- Return true if pPlot is in list
function listContainsPlot(pPlot, list)
  return (list ~= nil and list[getPlotKey(pPlot)] ~= nil)
end

-- Add the plot to the list
function listAddPlot(pPlot, list)
  if (list ~= nil) then
    list[getPlotKey(pPlot)] = pPlot
  end

  return list
end

function listFirstAdjacentPlot(pPlot, list)
  for key, plot in pairs(list) do
    if (distanceBetween(pPlot, plot) == 2) then
      return plot
    end
  end

  -- We should NEVER reach here
  return nil
end


--
-- Plot helper methods
--

-- Are the plots one and the same?
function isSamePlot(pPlot1, pPlot2)
  return (pPlot1:GetX() == pPlot2:GetX() and pPlot1:GetY() == pPlot2:GetY())
end

-- Get a unique key for the plot
function getPlotKey(pPlot)
  return string.format("%d:%d", pPlot:GetX(), pPlot:GetY())
end

-- Get the grid-based (x, y) co-ordinates of the plot as a string
function plotToGridStr(pPlot)
  if (pPlot == nil) then return "" end

  return string.format("(%d, %d)", pPlot:GetX(), pPlot:GetY())
end

-- Get the hex-based (x, y, z) co-ordinates of the plot as a string
function plotToHexStr(pPlot)
  if (pPlot == nil) then return "" end

  local hex = PlotToHex(pPlot)

  return string.format("(%d, %d, %d)", hex.x, hex.y, hex.z)
end
