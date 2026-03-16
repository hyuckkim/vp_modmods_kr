------------------
---User Options---
------------------
local bMinorCivCanCapture = true;
------------------

print( "Loading Main.lua" )

include( "Conquer.lua" )
include( "Release.lua" )
include( "CityConquer.lua" )
include("PlotIterators.lua")

local errorFlag = false -- tracks whether the lua script error occured

------------------------------------ GameEvents.PlayerDoTurn ------------------------------------

-- wrapper function that detects whether a lua script in the mod encounered an error
function PlotModWrapper( playerID )
	--print("starting hex conquer turn wrapper")
	if errorFlag == true then printLuaErrorMessage() end
	errorFlag = true
	-------------------------------
	newConqueredPots = nil -- plots conquered by cureent player at this turn start 
	newConqueredPots = {} 
	
	PlotMod( playerID )
	-------------------------------
	errorFlag = false
end
GameEvents.PlayerDoTurn.Add( PlotModWrapper )


-- the actual mod entry function
function PlotMod( playerID )
	--print("starting hex conquer player checks")
	if playerID < 0 then return end

	EliminateEncircledPlots( playerID )

	local player = Players[ playerID ]
	if player == nil then return end
	if not bMinorCivCanCapture and player:IsMinorCiv() then return end
	if not player:IsAlive() then return end
	local team = Teams[ player:GetTeam() ]
	local numEnemies = team:GetAtWarCount( false )
	--print(string.format("%s has %d enemies)", player:GetName(), numEnemies));
	if numEnemies == 0 then return end -- no enemies --> no plots to conquer
	
	PlayerHexConquer( playerID )
	PlayerHexRelease( playerID )
	UpdateOwnerShipDuration(newConqueredPots)
end


--------------------------------- GameEvents.CityCaptureComplete --------------------------------

function CityModWrapper( oldPlayerID, isCapital, x, y, newPlayerID, int1, bool1 )
	if errorFlag == true then printLuaErrorMessage() end
	errorFlag = true
	-------------------------------
	CityMod( oldPlayerID, isCapital, x, y, newPlayerID, int1, bool1 )
	-------------------------------
	errorFlag = false
end
GameEvents.CityCaptureComplete.Add( CityModWrapper )


------------------------------------- Events.WarStateChanged ------------------------------------
function PeaceSigned( team1, team2, war )
	if errorFlag == true then printLuaErrorMessage() end
	errorFlag = true
	-------------------------------
	if war then --peace event expected
		errorFlag = false
		return
	end 
	
	--print(string.format( "%d signed peace with %d)", team1, team2));
	ReturnPlotsTeamToTeam( team1, team2 )
	-------------------------------
	errorFlag = false
	
end
Events.WarStateChanged.Add( PeaceSigned )


------------------------------------- GameEvents.PlayerEndTurnCompleted ------------------------------------
function HexCREndTurn(iPlayer)
	--print ("Hex CR razing check started")
	local razingPlots = {};
	local pPlayer;
	local iNextPlayer = iPlayer + 1;
	local bNextPlayerUnavailable;
	-- let's find the ID and player corresponding to the next active player in the order
	while pPlayer == nil or not pPlayer:IsAlive() do
		if iNextPlayer == iPlayer then
			bNextPlayerUnavailable = true;
			break;
		elseif Game.CountCivPlayersEverAlive() < iNextPlayer then
			iNextPlayer = 0			
		end
		pPlayer = Players[iNextPlayer];
		iNextPlayer = iNextPlayer + 1;
	end
	-- as long as the next active player was found, cycle all cities to check for razing and redistribute plots
	if not bNextPlayerUnavailable then
		for city in pPlayer:Cities() do
			local pCity = city
			if pCity ~= nil and (pCity:IsRazing()) and (pCity:GetPopulation() == 1) then
				--print ("Hex CR: city being razed has reached one pop")
				local pCityOwner = Players[pCity:GetOwner()]
				local pOwnerTeam = Teams[pCityOwner:GetTeam()]
				local iCityOriginalOwner = pCity:GetOriginalOwner()
				for i = 0, pCity:GetNumCityPlots()-1, 1 do
					local lPlot = pCity:GetCityIndexPlot(i)
					if lPlot:IsCity() then
					else
						local ourCityAvailable = false
						local teamAvailable = false
						local allyAvailable = false
						local friendAvailable = false
						local noWarAvailable = false
						local dPactAvailable = false
						if (lPlot ~= nil) and ( (lPlot:GetOwner()) == (pCity:GetOwner()) ) then
							local CityCandidates = {}
							for pID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
								local nearCity, dist = getNearestCityWithException( pID, lPlot, pCity)
								if (nearCity ~= nil) and (dist <= GameDefines.MAXIMUM_WORK_PLOT_DISTANCE) then
									local us = (Players[pID] == pCityOwner)
									local sameteam = (not us) and (Teams[Players[pID]:GetTeam()] == pOwnerTeam)
									local friends = (not us) and (pCityOwner:IsDoF(pID))
									local allies = (not us) and (pCityOwner:IsAllies(pID))
									local war = (not us) and (pOwnerTeam:IsAtWar(Players[pID]:GetTeam()))
									local dpact = (not us) and (pOwnerTeam:IsDefensivePact(Players[pID]:GetTeam()))
					
									if us then
										ourCityAvailable = true
									end
									if sameteam then
										teamAvailable = true
									end
									if friends then
										friendAvailable = true
									end
									if allies then
										allyAvailable = true
									end
									if not war then
										noWarAvailable = true
									end
									if dpact then
										dPactAvailable = true
									end
									table.insert(CityCandidates, {iPlayer = pID, bUs = us, bTeam = sameteam, bFriends = friends, bAllies = allies, bWar = war, bDpact = dpact, cNearCity = nearCity})
						
								end
							end
							if #CityCandidates > 0 then
								if ourCityAvailable then
									for i = 1, #CityCandidates, 1 do
										if CityCandidates[i] ~= nil then
											local lUs = CityCandidates[i].bUs
											if not lUs then
												table.remove(CityCandidates, i)
												i = i - 1
											end
										end
									end
								elseif teamAvailable then
									for i = 1, #CityCandidates, 1 do
										if CityCandidates[i] ~= nil then
											local lTeam = CityCandidates[i].bTeam
											if not lTeam then
												table.remove(CityCandidates, i)
												i = i - 1
											end
										end
									end
								elseif dPactAvailable then
									for i = 1, #CityCandidates, 1 do
										if CityCandidates[i] ~= nil then
											local lDpact = CityCandidates[i].bDpact
											if not lDpact then
												table.remove(CityCandidates, i)
												i = i - 1
											end
										end
									end
								elseif allyAvailable then
									for i = 1, #CityCandidates, 1 do
										if CityCandidates[i] ~= nil then
											local lAlly = CityCandidates[i].bAllies
											if not lAlly then
												table.remove(CityCandidates, i)
												i = i - 1
											end
										end
									end
								elseif friendAvailable then
									for i = 1, #CityCandidates, 1 do
										if CityCandidates[i] ~= nil then
											local lFriend = CityCandidates[i].bFriends
											if not lFriend then
												table.remove(CityCandidates, i)
												i = i - 1
											end
										end
									end
								elseif noWarAvailable then
									for i = 1, #CityCandidates, 1 do
										if CityCandidates[i] ~= nil then
											local lNoWar = not CityCandidates[i].bWar
											if not lNoWar then
												table.remove(CityCandidates, i)
												i = i - 1
											end
										end
									end
								end
								local randPlayer = math.random(#CityCandidates)
								local iAssignPlayer = CityCandidates[randPlayer].iPlayer
								local AssignCity = CityCandidates[randPlayer].cNearCity
								if AssignCity == nil then return end -- city not found?
								if Map.PlotDistance( AssignCity:GetX(), AssignCity:GetY(), lPlot:GetX(), lPlot:GetY() ) <= GameDefines.MAXIMUM_WORK_PLOT_DISTANCE then
									--print("reassigning plot belonging to nearly razed city")
									if ourCityAvailable then
										lPlot:SetOwner(-1, -1, false, false)
									end
									lPlot:SetOwner( iAssignPlayer, AssignCity, true, true )
									table.insert( razingPlots, lPlot )
								end
							end
						end
					end
				end
			end
		end
	end
	UpdateOwnerShipDuration(razingPlots);
	razingPlots = nil;
end 
GameEvents.PlayerEndTurnCompleted.Add(HexCREndTurn)


------------------------------------- GameEvents.CityConstructed ------------------------------------
function PuppetPlotRedistributer(iCityOwner, iCity, iBuilding, bGold, bFaith)
	local pPlayer = Players[iCityOwner];
	if pPlayer == nil then return end;
	local cCity = pPlayer:GetCityByID(iCity);
	if cCity == nil then 
	elseif cCity:IsPuppet() then
		--print("reacquiring plots for puppet")
		AquireUnusedPlotsFromFriendlyCitites(cCity, iCityOwner)
	end
end
GameEvents.CityConstructed.Add(PuppetPlotRedistributer)


------------------------------------------- Debugging -------------------------------------------

--
function printLuaErrorMessage( )
	print( "ERROR  Script in Main.lua didn't terminate properly." )
	print( "       Please report description and screenshots of recent turns, and logs if available, to the mod discussion thread at https://forums.civfanatics.com/threads/hex-conquer-borders-only.657531/" )
end

-------------------------------------------------------------------------------------------------
--------------------------------------- Utility Functions ---------------------------------------
-------------------------------------------------------------------------------------------------

--[[ buggy? don't use it
function PlayerHasEnemies( playerID )
	if playerID < 0 then return end
	for i = 0, 1000, 1 do
		local player2 = Players[ i ]
		if player2 ~= nil then
			--print( i, player2:GetName() )
		end
	end
	return false
end ]]


function PlayersAreAtWarByID( player1ID, player2ID )
	if player1ID == player2ID then return false end
	if player1ID < 0 or player2ID < 0 then return false end
	
	local player1 = Players[ player1ID ]
	local player2 = Players[ player2ID ]
	if player1 == nil or player2 == nil then return false end
	
	local team1 = Teams[ player1:GetTeam() ]	
	if team1:IsAtWar( player2:GetTeam() ) then return true end
	
	return false
end


--
function PlotsHaveACity( plots )
	if plots == nil then return false end
	for i, plot in pairs( plots ) do
		if plot ~= nil then
			if plot:IsCity() then
				--print(string.format("  plot (%dx, %dy) is a city", plot:GetX(), plot:GetY()));
				return true
			end					
		end
	end	
	return false
end


--
function PlotIsAdjacentToFriendlyPlot( player, centralPlot )
	--print( "----------------" )
	local plots = GetAdjacentPlots( centralPlot )
	if plots == nil then return false end
	for i, plot in pairs( plots ) do
		if plot ~= nil and plot:GetOwnershipDuration() > 0 then
			local ownerPlayer = Players[ plot:GetOwner() ];
			if( player == ownerPlayer ) then
				--print(string.format("  plot (%dx, %dy) is adjacent to friendly plot (%dx, %dy)", centralPlot:GetX(), centralPlot:GetY(), plot:GetX(), plot:GetY()));
				return true
			end
		end
	end	
end


-- written by Gedemon, edited by Matviyko Rozumiyko
function GetAdjacentPlots( plot )
	local plotList = {}
	local direction_types = {
		DirectionTypes.DIRECTION_NORTHEAST,
		DirectionTypes.DIRECTION_SOUTHEAST,
		DirectionTypes.DIRECTION_WEST,
		DirectionTypes.DIRECTION_EAST,
		DirectionTypes.DIRECTION_SOUTHWEST,
		DirectionTypes.DIRECTION_NORTHWEST
	}
	for loop, direction in ipairs(direction_types) do
		local adjPlot = Map.PlotDirection( plot:GetX(), plot:GetY(), direction )
		if ( adjPlot ~= nil ) then table.insert(plotList, adjPlot) end
	end
	return plotList
end


--
function getNearestCity( playerID, plot )
	local player = Players[ playerID ]
	local distance = 10000
	local nearestCity = nil
	for city in player:Cities() do
		distanceToCity = Map.PlotDistance( city:GetX(), city:GetY(), plot:GetX(), plot:GetY() )
		if( distanceToCity < distance) and not (city:IsRazing()) then
			distance = distanceToCity
			nearestCity = city
		end
	end
	return nearestCity
end


function getNearestCityWithException( playerID, plot, exceptCity)
	local player = Players[ playerID ]
	local nearestDistance = 10000
	local nearestCity = nil
	for city in player:Cities() do
		if city ~= exceptCity then
			distance = Map.PlotDistance( city:GetX(), city:GetY(), plot:GetX(), plot:GetY() )
			if( distance < nearestDistance) and not (city:IsRazing()) then
				nearestDistance = distance
				nearestCity = city
			end		
		end
	end
	if nearestCity == nil then nearestDistance = -1 end
	return nearestCity, nearestDistance
end


function getAnyNearestCity( plot )
	local closestCity = nil
	local closestDistance = 10000
	local num = GameDefines.MAX_PLAYERS - 1
	for id = 0, num, 1 do
		local player = Players[ id ]
		if player ~= nil and player:IsAlive() and not player:IsBarbarian() then
			local city, distance = getNearestCityWithException( id, plot, -1 )
			if distance < closestDistance then
				closestDistance = distance
				closestCity = city
			end	
		end	
	end
	return closestCity, closestDistance
end


-- For debugging
function showAdjacentPlotsInfo( plotList )
	for i, plot in pairs( plotList ) do	
		--print( i, plot:GetX(), plot:GetY() )
		if( plot:GetOwner() >= 0 ) then
			--print( string.format( "adjacent[%d]: ownerID %d;", i, plot:GetOwner() ) )
		else
			--print( string.format( "adjacent[%d]", i ) )
		end
	end
end


-- returns true if plot owner has a city within 3 plots to the plot
function PlotIsWithinCityRadius( player, plot )
	if player == nil then return false end
	if plot == nil then return false end
	for city in player:Cities() do
		if city ~= nil then
			distanceToCity = Map.PlotDistance( city:GetX(), city:GetY(), plot:GetX(), plot:GetY() )
			if distanceToCity <= GameDefines.MAXIMUM_WORK_PLOT_DISTANCE then
				return true
			end
		end
	end
	return false
end


function UpdateOwnerShipDuration(conqueredPlotTable)
	if conqueredPlotTable == nil then return end
	if # conqueredPlotTable == 0 then return end
	for i, plot in pairs( conqueredPlotTable ) do
		if plot ~= nil then
			plot:SetOwnershipDuration( 1 )
		end
	end
end

--[[
function ListNewConqueredPlots()
	if newConqueredPots == nil then return end
	if # newConqueredPots == 0 then return end
	--print( "Conquered Plots:" )
	for i, plot in pairs( newConqueredPots ) do
		if plot ~= nil then
			--print( "  ", i, plot:GetX(), plot:GetY() )
		end
	end
end


function IsANewConqueredPlot( plot )
	if plot == nil then return false end
	if newConqueredPots == nil then return false end
	if # newConqueredPots == 0 then return false end

	for i, newPlot in pairs( newConqueredPots ) do
		if newPlot  ~= nil and newPlot == plot then
			--print(string.format("plot (%dx %dy) was conquered earlier.", plot:GetX(), plot:GetY() ))
			return true
		end
	end
	return false
end
]]--