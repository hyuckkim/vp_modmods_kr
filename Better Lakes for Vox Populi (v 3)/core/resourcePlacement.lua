-- resourcePlacement
-- Author: IA
-- DateCreated: 7/28/2020 3:54:12 PM
--------------------------------------------------------------

--The percentage of lakes that will be salt (the rest will be fish)
local SaltPercent = 0.4  --Default 0.4

--unmodified ratio of fish that will be in a lake, so 3.0 = 3 lake tiles for 1 lake fish (will be randomly modified)
local FishDivisor = 3.0 --Default 3.0

--random modifiers
local noModChance = 0.4						-- Default 0.4					(40% chance)	+0 fish
local AddOneChance = noModChance + 0.25		-- Default noModChance + 0.25	(25% chance)	+1 fish
local AddTwoChance = AddOneChance + 0.10	-- Default AddOneChance + 0.10	(10% chance)	+2 fish
											-- The remaining percent (by default 25%) have  -1 fish

local iSeaSalt = GameInfoTypes.RESOURCE_IA_SALT_LAKE
local iFish = GameInfoTypes.RESOURCE_IA_LAKE_FISH

local tLakesGroups = {}
local iCountRows = 0


function addResources()

	if Game.GetGameTurn() > Game.GetStartTurn() then return end

	---------------------------
	-- Gets All Lakes in Table 
	---------------------------
	local tLakePlots = {}

	for iPlot = 0, Map.GetNumPlots() - 1 do
		local pPlot = Map.GetPlotByIndex(iPlot)

		if isPlotLake(pPlot) then
			tLakePlots[#tLakePlots+1] = pPlot
		end
	end


	--------------------------------------------
	-- Organizes all the lakes in the 2d table
	--------------------------------------------

	--each row is a table of a "group" of lakes, ie lake tiles that are connected together
	for _, plot in ipairs(tLakePlots) do	--goes through every lake plot
		
		if not IsInTable(plot, tLakesGroups) then	--if it isn't already in the table, then it means it's a new lake group
			tLakesGroups[#tLakesGroups+1] = {}		--so, a new row is made for tLakesGroups
			iCountRows = iCountRows + 1			
			local tPlot = {}						--and groupLakes() is called to put those plots into the new row (which needs the plot as a table for the parameter)
			tPlot[plot] = true
			groupLakes(tPlot)
		end
	end


	--------------------------------
	-- Salt Resource Placement
	--------------------------------
	print("Starting Lake Resource Placement, Number of Lake Tiles: " .. #tLakePlots)
	print("Starting Lake Resource Placement, Number of Lakes (in groups of lake tiles): " .. #tLakesGroups)

	local tSaltLakes = {}
	local tSaltLakesNums = {}
	local tFishLakes = {}
	local i = 1

	while i <= math.ceil(#tLakesGroups * SaltPercent) do
		local rand = math.random(#tLakesGroups)
		local tNextLake = tLakesGroups[rand]
		local testPlot
		for k, _ in pairs(tNextLake) do testPlot = k break end --gets a plot from the table (because each plot is only in 1 table, so we can just test any plot)
		if not IsInTable(testPlot, tSaltLakes) then
			tSaltLakes[i] = tNextLake
			tSaltLakesNums[#tSaltLakesNums+1] = rand
			i = i + 1
		end
	end

	for i, tLakeGroup in ipairs(tLakesGroups) do
		if not IsInTable(i, tSaltLakesNums) then
			tFishLakes[#tFishLakes+1] = tLakesGroups[i]
		end
	end

	for _, tLakes in ipairs(tSaltLakes) do
		for plot, _ in pairs(tLakes) do
			if tLakes[plot] then
				plot:SetResourceType(iSeaSalt, 1);
			end
		end
	end

	--------------------------------
	-- Fish Resource Placement
	--------------------------------

	for _, tLakes in ipairs(tFishLakes) do
		
		local tIndexedLakes = {}	-- tLakes has the plot as the key and the value as true, but that makes it hard to count and choose a random plot,
									-- so an indexed table is created where the key is an increasing int (1, 2, 3, 4, etc.), and the value is the plot
		local i = 0
		for plot, _ in pairs(tLakes) do
			i = i+1
			tIndexedLakes[i] = plot
		end

		local iCountFish = math.ceil(#tIndexedLakes/FishDivisor)

		print("Initial Fish Amount: " .. iCountFish)

		local fishRand = math.random()

		if fishRand < noModChance then			--40% chance of nothing happening, no modification	(with default numbers)
			iCountFish = iCountFish+0
		elseif fishRand < AddOneChance then		--25% chance of +1 fish in the lake					(with default numbers)
			iCountFish = iCountFish+1
		elseif fishRand < AddTwoChance then
			iCountFish = iCountFish+2			--10% chance of +2 fish in the lake					(with default numbers)
		else
			iCountFish = iCountFish-1			--25% chance of -1 fish in the lake					(with default numbers)
		end 

		if iCountFish > #tIndexedLakes then 
			iCountFish = #tIndexedLakes
		end

		print("Final Fish Amount: " .. iCountFish)


		local tFishLakeNums = {}
		local c = 0
		while c < iCountFish do
			local rand = math.random(#tIndexedLakes)
			if not IsInTable(rand, tFishLakeNums) then
				c = c+1
				tFishLakeNums[c] = rand
			end
		end


		for _, v in ipairs(tFishLakeNums) do
			if tIndexedLakes[v] then
				tIndexedLakes[v]:SetResourceType(iFish, 1);
			end
		end
	end

	print("Finished Lake Resource Placement")

    for i,v in pairs(tLakesGroups) do --truncate table, less memory usage? idk
      for k,_ in pairs(v) do
        tLakesGroups[i][k]=nil
      end
    end
end


--Recursive function that takes a table of plots and puts all of the connected lake tiles into one row of the main table, tLakesGroups
--tLakesGroups is 2d, the rows are integers (row 1, 2, 3, etc.), each row is a table that has the plot as a key, set to true
function groupLakes(tCurrentPlots)

	local tNextPlots = {}
	local bContinue = false


	for pPlot, existsInTable in pairs(tCurrentPlots) do

		if pPlot and existsInTable then

			tLakesGroups[iCountRows][pPlot] = true

			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
				--if the plot exists,      and is a lake,             and isn't in the tLakesGroups table already,        and isn't in the tNextPlots table already,and isn't in the tCurrentPlots table already,
				if pAdjacentPlot ~= nil and isPlotLake(pAdjacentPlot) and tLakesGroups[iCountRows][pAdjacentPlot] ~= true and tNextPlots[pAdjacentPlot] ~= true and tCurrentPlots[pAdjacentPlot] ~= true then
					--then put it in the tNextPlots table to be used next time, and mark that the function should be used again
					tNextPlots[pAdjacentPlot] = true
					bContinue = true
				end
			end
		end
	end

	if bContinue then
		groupLakes(tNextPlots)
	end
end


function IsInTable(value, tTable)
	
	local key
	for k, _ in pairs(tTable) do key = k break end --grabs a key

	if type(tTable[key]) == "table" then --it is a 2d table
		for i=1,#tTable do
			if tTable[i][value] == true then
				return true
			end
		end
		return false
	else
		for i=1,#tTable do
			if tTable[i] == value then
				return true
			end
		end
		return false
	end
end

function isPlotLake(pPlot)
	if pPlot:IsNaturalWonder() then return false end --ignore lake vicotria or other natural wonder "lakes"
	if pPlot:IsLake() then return true end
	return false
end

Events.SequenceGameInitComplete.Add(addResources)