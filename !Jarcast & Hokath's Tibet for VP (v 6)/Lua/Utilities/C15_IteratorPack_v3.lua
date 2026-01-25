-- Cunt15_IteratorPack
-- Author: Chrisy
-- DateCreated: 6/5/2019 12:43:52 AM
--------------------------------------------------------------

-- Holy shit I actually did it :D

-- Just a shame I can't make them Plot methods ;_;

function Cunt15_PlotUnitsIterator(pPlot) -- Fuck yeah!
	local next = coroutine.create(function()
		local i = 0 
		local pUnit = pPlot:GetLayerUnit(i) 
		while pUnit do
			coroutine.yield(pUnit)
			 i = i + 1 
			 pUnit = pPlot:GetLayerUnit(i)
		end
		
		return nil
	end)
	
	return function()
		local bSuccess, pIterUnit = coroutine.resume(next) -- I'll assume bSuccess is some hidden return since icbf to look up documentation
		
		return bSuccess and pIterUnit or nil
	end
end

function Cunt15_AdjacentPlotIterator(pPlot) -- This one's much more of a PlotIterators clone obviously, since I'm trying to achieve the same end goal (in a less versatile fashion :p)
	local next = coroutine.create(function()
		for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			coroutine.yield(Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction))
		end
	end)
	
	return function()
		local pPlot = nil
		local bSuccess, pIterPlot = coroutine.resume(next)
		
		while (bSuccess and pPlot == nil) do
			if pIterPlot then
				pPlot = pIterPlot
			else
				bSuccess, pIterPlot = coroutine.resume(next)
			end
		end
		
		return bSuccess and pPlot or nil
	end
end

function Cunt15_NearbyUnitIterator(pPlot)
	local next = coroutine.create(function()
		local tPlotsToIterate = {pPlot}
		for pIterPlot in Cunt15_AdjacentPlotIterator(pPlot) do
			if pIterPlot then
				tPlotsToIterate[#tPlotsToIterate+1] = pIterPlot
			end
		end
		for i = 1, #tPlotsToIterate do
			for pUnit in Cunt15_PlotUnitsIterator(tPlotsToIterate[i]) do
				coroutine.yield(pUnit)
			end
		end
	end)
	
	return function()
		local bSuccess, pUnit = coroutine.resume(next)
		
		return bSuccess and pUnit or nil
	end
end

local iMinorStart = GameDefines.MAX_MAJOR_CIVS
local iMinorEnd = iMinorStart + GameDefines.MAX_MINOR_CIVS - 1

function Cunt15_CSIterator()
    local next = coroutine.create(function()
        for i = iMinorStart, iMinorEnd do
            local pIterPlayer = Players[i]
            if pIterPlayer and pIterPlayer:IsEverAlive() and pIterPlayer:IsAlive() and pIterPlayer:IsMinorCiv() then
                coroutine.yield(pIterPlayer)
            end
        end
        
        return nil
    end)
    
    return function()
        local bSuccess, pCS = coroutine.resume(next)
        
        return bSuccess and pCS or nil
    end
end