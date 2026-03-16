-- CityConquer.lua
-- Author: Matviyko Rozumiyko
-- DateCreated: 1/7/2013 3:03:27 AM
--------------------------------------------------------------

print( "Loading CityConquer.lua" )

--
function CityMod( oldPlayerID, isCapital, x, y, newPlayerID, int1, bool1 )
	--print( oldPlayerID, isCapital, x, y, newPlayerID, int1, bool1 )
	if not PlayersAreAtWarByID( oldPlayerID, newPlayerID ) then return end -- city passed peacefully
	local plot = Map.GetPlot( x, y )
	if plot == nil then return end
	local city = plot:GetPlotCity()
	if city == nil then return end
	--print(string.format("%s was captured", city:GetName()));
	RedistributeCityPlots( city, oldPlayerID, newPlayerID )
	AquireUnusedPlotsFromFriendlyCitites( city, newPlayerID )
end


function AquireUnusedPlotsFromFriendlyCitites( city, playerID )
	if city == nil then return end
	for i=36, 7, -1 do -- plots withing city radius 2 to 3
		local plot = city:GetCityIndexPlot( i )
		AquireUnusedPlotFromFriendlyCitites( city, playerID, plot )
	end
end


function AquireUnusedPlotFromFriendlyCitites( city, playerID, plot )
	if plot == nil then return end
	if plot:GetOwner() ~= playerID then return end
	if city == nil then return end
	if playerID < 0 then return end
	local nearestCity, distance = getNearestCityWithException( playerID, plot, city )
	if nearestCity == nil or distance < 4 then return end

	local ownershipDiration = plot:GetOwnershipDuration()
	plot:SetOwner( -1, -1 )
	plot:SetOwner( playerID, city:GetID(), true, true )
	plot:SetOwnershipDuration( ownershipDiration )	
	
	--print(string.format("friendly plot (%dx %dy) is assigned to belong to %s.", plot:GetX(), plot:GetY(), city:GetName() ))
end

-- Plots not adjacent to the captured city return back to the closest cities of the old owner of
-- the city
function RedistributeCityPlots( city, oldPlayerID, newPlayerID )
	if city == nil then return end

	local oldPlayer = Players[ oldPlayerID ]
	local newPlayer = Players[ newPlayerID ]
	if oldPlayer == nil or newPlayer == nil then return end
	local numCities = oldPlayer:GetNumCities()
	--print( "cities remain ", numCities )
	if numCities == 0 then return end

	for i=90, 7, -1 do -- plots withing city radius 2 to 5
		local plot = city:GetCityIndexPlot( i )
		if plot ~= nil then
			RedistributePlot( plot, oldPlayerID, newPlayerID )
		end
	end
	
	for i=6, 0, -1 do -- plots withing city radius 0 to 1 (city and adjacent plots)
		local plot = city:GetCityIndexPlot( i )
		if plot ~= nil then
			plot:SetOwnershipDuration( 1 )
		end
	end	
end

-- If the plot was gained after capturing the city, it may change ownership.
-- Plot ownership duration is used to distinguish old plots (gained before capturing the city)
-- and new plots (gained after capturing the city)
function RedistributePlot( plot, oldPlayerID, newPlayerID )
	if plot == nil or oldPlayerID < 0 or newPlayerID < 0 then return end
	local plotOwnerPlayerID = plot:GetOwner()
	if plotOwnerPlayerID ~= newPlayerID then return end
	local plotOwnershipDuration = plot:GetOwnershipDuration() 
	if plotOwnershipDuration > 0 then return end
	--print(string.format("  plot (%dx %dy) has ownership duration %d", plot:GetX(), plot:GetY(), plotOwnershipDuration ));
	local nearestCity = getNearestCity( oldPlayerID, plot ) -- the nearest city of the old owner
	if nearestCity == nil then return end -- city not found?
	distance = Map.PlotDistance( nearestCity:GetX(), nearestCity:GetY(), plot:GetX(), plot:GetY() )
	if distance > 5 then return end -- too far

	plot:SetOwner( oldPlayerID, nearestCity:GetID(), true, true )
	--print(string.format("plot (%dx %dy) from the captured city was redistributed to %s.", plot:GetX(), plot:GetY(), nearestCity:GetName() ))
end