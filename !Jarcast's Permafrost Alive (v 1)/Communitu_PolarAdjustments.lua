-- Communitu_PolarAdjustments
-- Author: Jarcast
-- DateCreated: 2/3/2026 11:01:58 PM
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
local currentMapScript = PreGame.GetMapScript();
function IsUsingMapScript(mapstring, noprint)
	for row in GameInfo.MapScripts() do
		if row.FileName == currentMapScript and string.sub(row.Name, 1, string.len(mapstring)) == mapstring then
			if not noprint then print("Current mapscript: " .. mapstring) end
			return true
		end
	end
	return false
end
-------------------------------------------------------------------------------------------------------------------------
function Round(num, places)
	local mult = 10 ^ (places or 0);
	return math.floor(num * mult + 0.5) / mult;
end
-------------------------------------------------------------------------------------------------------------------------
function IsPlotPolar(pPlot)
	local iW, iH = Map.GetGridSize()
	local iplotY = pPlot:GetY()
	local bIsPlotPolar = false
	local iPolarMargin = 0.85
	if (iplotY >= (iH/2)) then	
		-- Upper half of map;
		if (math.abs((iH/2) - iplotY)/(iH/2)) > iPolarMargin then
			bIsPlotPolar = true
		end
	else
		-- Lower half of map;
		if (math.abs((iH/2) - iplotY + 1)/(iH/2)) > iPolarMargin then
			bIsPlotPolar = true
		end
	end
	return bIsPlotPolar
end
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
local iResPolarGame = GameInfoTypes.RESOURCE_JAR_POLARWILDGAME
local MinDistancePolarGame = 3
if IsUsingMapScript("JarCommunitu_79a", true) and Map.GetWorldSize() == GameInfoTypes.WORLDSIZE_HUGE then
	if Map.GetCustomOption(17) == 2  then
		MinDistancePolarGame = 4
	elseif Map.GetCustomOption(17) == 3 then
		MinDistancePolarGame = 5
	elseif Map.GetCustomOption(17) == 4 or Map.GetCustomOption(17) == 5 then
		MinDistancePolarGame = Round(MinDistancePolarGame *2)
	end
end

function Jar_PlacePolarWildGame()
	local numResPolarGame = Map.GetNumResources(iResPolarGame)
	local tPolarGamePlotsAll = {}
	for plotLoop = Map.GetNumPlots() - 1, 0, -1 do
		local pPlot = Map.GetPlotByIndex(plotLoop)
		if pPlot:GetResourceType() == iResPolarGame then
			table.insert(tPolarGamePlotsAll, pPlot)
		end
	end
	local tPolarGamePlotsNew = {}
	local countSnow = 0
	for plotLoop = Map.GetNumPlots() - 1, 0, -1 do
		local pPlot = Map.GetPlotByIndex(plotLoop)
		local bTerrainSnow = pPlot:GetTerrainType() == GameInfoTypes.TERRAIN_SNOW and pPlot:IsFlatlands()
		if bTerrainSnow and pPlot:GetResourceType()== -1 and pPlot:GetImprovementType() == -1 and pPlot:GetFeatureType() <0 then
			countSnow = countSnow +1
			local CanPlace = true
			if #tPolarGamePlotsAll > 0 then
				for k, PlVplot in ipairs(tPolarGamePlotsAll) do
					if Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), PlVplot:GetX(), PlVplot:GetY()) < 2 then
					CanPlace = false
					break
					end
				end
			end
			if CanPlace then
				table.insert(tPolarGamePlotsNew, pPlot)
				table.insert(tPolarGamePlotsAll, pPlot)
			end
		end		
	end
	print("MinDistancePolarGame: " .. MinDistancePolarGame)
	print("Num eligible flat Snow tiles on map: " .. countSnow)
	print("PolarWildGame on map: " .. numResPolarGame)
	print("PolarWildGame to place (flat): " .. #tPolarGamePlotsNew)
	local flatplots = #tPolarGamePlotsNew
	for plotLoop = Map.GetNumPlots() - 1, 0, -1 do
		local pPlot = Map.GetPlotByIndex(plotLoop)
		local bPolarTundra = IsPlotPolar(pPlot) and pPlot:GetTerrainType() == GameInfoTypes.TERRAIN_TUNDRA and pPlot:IsFlatlands()
		if bPolarTundra and pPlot:GetResourceType()== -1 and pPlot:GetImprovementType() == -1 and pPlot:GetFeatureType() <0 then
			local CanPlace = true
			if #tPolarGamePlotsAll > 0 then
				for k, PlVplot in ipairs(tPolarGamePlotsAll) do
					if Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), PlVplot:GetX(), PlVplot:GetY()) < MinDistancePolarGame then
					CanPlace = false
					break
					end
				end
			end
			if CanPlace then
				table.insert(tPolarGamePlotsNew, pPlot)
				table.insert(tPolarGamePlotsAll, pPlot)
			end
		end		
	end
	print("PolarWildGame to place (polar tundra): " .. #tPolarGamePlotsNew - flatplots)
	print("PolarWildGame to place (all): " .. #tPolarGamePlotsNew)
	for k, v in pairs(tPolarGamePlotsNew) do
		v:SetResourceType(iResPolarGame, 1)
		local bPolarTundra = IsPlotPolar(v) and v:GetTerrainType() == GameInfoTypes.TERRAIN_TUNDRA and v:IsFlatlands()
		print(k .. ") PolarWildGame placed: " .. v:GetX() .. ", " .. v:GetY() .. ", IsPolarTundra= " .. tostring( bPolarTundra))
	end
end

local g_SaveData = Modding.OpenSaveData();
function Initialize()
	local bInit = g_SaveData.GetValue("Jar_PolarWGCommunitu"); 
	local bUsingMap = IsUsingMapScript("Communitu_79a") or IsUsingMapScript("JarCommunitu_79a")
	if bUsingMap and not bInit then
		Jar_PlacePolarWildGame();
		g_SaveData.SetValue("Jar_PolarWGCommunitu", true);
		print("Communitu_79a Polar adjustments done!")
	end
end
Initialize();
--======================================================================================================================
--======================================================================================================================