-- Release.lua
-- Author: Matviyko Rozumiyko
-- DateCreated: 1/5/2013 5:21:18 PM
--------------------------------------------------------------

print( "Loading Release.lua" )


--
function PlayerHexRelease( playerID )
	CitiesReconquerPlots( playerID )
	--print( "PlayerHexRelease terminated successfully!" )
end


--
function CitiesReconquerPlots( playerID )
	--print( "CitiesReconquerPlots ", playerID )
	local player = Players[ playerID ]
	if player == nil then return end
	for city in player:Cities() do
		CityReconquerPlots( city )
	end
end


--
function CityReconquerPlots( city )
	if city == nil then return end
	if city:IsResistance() then return end -- not allowed to reconquer
	if city:IsPuppet() then return end -- not allowed to reconquer
	--print( string.format( "CityReconquerPlots(%s);", city:GetName() ) )
	for i=36, 7, -1 do
		local plot = city:GetCityIndexPlot( i )
		if plot ~= nil then
			CityReconquerPlot( city, plot )
		end
	end
	
	for i=6, 0, -1 do
		local plot = city:GetCityIndexPlot( i )
		if plot ~= nil then
			ForceCityReconquerEnemyPlot( city, plot )
		end
	end
end


--
function CityReconquerPlot( city, plot )
	if city == nil then return end
	if plot == nil then return end
	if city:IsRazing() then return end 
-------------------------------------------------------	
	local plotOwnerPlayerID = plot:GetOwner()
	if plotOwnerPlayerID < 0 then return end -- cannot reconquer neutral plot

	local cityOwnerPlayerID = city:GetOwner()
	if cityOwnerPlayerID == plotOwnerPlayerID then return end -- plot is already owned by city

	local plotOwnerPlayer = Players[ plotOwnerPlayerID ]
	local plotOwnerTeam = Teams[ plotOwnerPlayer:GetTeam() ]	
	local cityOwnerPlayer = Players[ cityOwnerPlayerID ]
	if not( plotOwnerTeam:IsAtWar( cityOwnerPlayer:GetTeam() ) ) then return end -- can reconquer enemy's plot only
---------------------------------------------------------
	if not PlotIsAdjacentToFriendlyPlot( cityOwnerPlayer, plot ) then return end

	if PlotIsWithinCityRadius( plotOwnerPlayer, plot ) then return end

	local adjPlots = GetAdjacentPlots( plot )	
	if PlotHasEnemyCombatUnit( cityOwnerPlayer, plot ) then return end
	if PlotsHaveEnemyCombatUnits( cityOwnerPlayer, adjPlots ) then return end
	if PlotHasEnemyCitadel( cityOwnerPlayer, plot ) then return end
	if PlotsHaveEnemyCitadel( cityOwnerPlayer, adjPlots ) then return end
	if plot:IsCity() then return end
	if PlotsHaveACity( adjPlots ) then return end

	local nearestCity = getNearestCity( cityOwnerPlayerID, plot )
	plot:SetOwner( cityOwnerPlayerID, nearestCity:GetID(), true, true )
	table.insert( newConqueredPots, plot )
	--print(string.format("City %s reconquered plot (%d, %d)", nearestCity:GetName(), plot:GetX(), plot:GetY() ))
end


-- reconquer an enemy plot unles it has a citadel
function ForceCityReconquerEnemyPlot(city, plot)
	if city == nil or plot == nil or city:IsRazing() then return end
	if not PlayersAreAtWarByID( city:GetOwner(), plot:GetOwner() ) then return end
	local cityOwnerPlayer = Players[ city:GetOwner() ]
	if PlotHasEnemyCitadel( cityOwnerPlayer, plot ) then return end -- not tested
	
	local nearestCity = getNearestCity( city:GetOwner(), plot )
	plot:SetOwner( city:GetOwner(), nearestCity:GetID(), true, true  )
	table.insert( newConqueredPots, plot )
	--print(string.format("City %s reconquered adjacent plot (%d, %d)", nearestCity:GetName(), plot:GetX(), plot:GetY() ))
end

------------------------------------ Return Not Needed Plots ------------------------------------

function ReturnPlotsTeamToTeam( team1, team2 )
	local num = GameDefines.MAX_PLAYERS - 1
	for id = 0, num, 1 do
		local player = Players[ id ]
		if player ~= nil and player:IsAlive() and not player:IsBarbarian() then
			if player:GetTeam() == team1 then 
				ReturnPlotsPlayerToTeam( player:GetID(), team2 )
			end			
		end	
	end
end


function ReturnPlotsPlayerToTeam( playerID, teamID )
	local num = GameDefines.MAX_PLAYERS - 1
	for id = 0, num, 1 do
		local player = Players[ id ]
		if player ~= nil and player:IsAlive() and not player:IsBarbarian() then
			if player:GetTeam() == teamID then 
				ReturnPlotsPlayerToPlayer( playerID, player:GetID() )
			end			
		end	
	end
end


function ReturnPlotsPlayerToPlayer( playerID1, playerID2 )
	local returnedPlots = {}
	local w, h = Map.GetGridSize()
	w = w - 1
	h = h - 1
	for x=0, w, 1 do
		for y=0, h, 1 do
			local plot = Map.GetPlot( x, y )
			ReturnPlotPlayerToPlayer( playerID1, playerID2, plot, returnedPlots )
		end
	end
	NotifyAboutReturnedPlots( returnedPlots, playerID1, playerID2 )
end


function ReturnPlotPlayerToPlayer( playerID1, playerID2, plot, returnedPlots )
	if plot == nil then return end
	if plot:GetOwner() ~= playerID1 then return end

	if PlotHasCityOrCitadel( playerID1, plot ) then return end
	local adjPlots = GetAdjacentPlots( plot )
	if PlotsHaveCityOrCitadel( playerID1, adjPlots ) then return end
	
	local city1, distance1 = getNearestCityWithException( playerID1, plot, -1 )
	local city2, distance2 = getNearestCityWithException( playerID2, plot, -1 )
	if city1 == nil or distance1 == nil or city2 == nil or distance2 == nil then return end
	if distance1 <= 3 then return end -- plot is too close to the owner city
	if distance2 > 3 then return end -- plot is too far from the beneficiary city

	plot:SetOwner( playerID2, city2:GetID(), true, true )
	plot:SetOwnershipDuration( 1 )
	--print( string.format( "Plot (%d, %d) was reassigned to %s by peace treaty", plot:GetX(), plot:GetY(), city2:GetName()))	
	
	table.insert( returnedPlots, city2 )
end


function NotifyAboutReturnedPlots( returnedPlots, playerID1, playerID2 )
	if # returnedPlots == 0 then return end
	
	local player1 = Players[ playerID1 ]
	local player2 = Players[ playerID2 ]
	if player1 == nil or player2 == nil then return end
	
	table.sort( returnedPlots, function(a,b) return a:GetName() < b:GetName() end )
	local lastCity = returnedPlots[1]
	local numPlots = 0
	local message = string.format( "Under the peace treaty, %s regained plots from %s for ",
									player2:GetName(), player1:GetName() )

	for i, city in pairs( returnedPlots ) do
		if lastCity ~= city then
			--NotifyAboutPlotsReturnedToCity( lastCity, numPlots, message )
			message = message .. string.format( "%s (%d plots), ", lastCity:GetName(), numPlots ) 
			numPlots = 0
			lastCity = city
		end
		numPlots = numPlots + 1
	end	
	--NotifyAboutPlotsReturnedToCity( lastCity, numPlots, message )
	message = message .. string.format( "%s (%d plots).", lastCity:GetName(), numPlots ) 

	local title = "Plots Returned"
	player1:AddNotification( NotificationTypes.NOTIFICATION_GENERIC,
							 message, title )
	player2:AddNotification( NotificationTypes.NOTIFICATION_GENERIC,
							 message, title )
end