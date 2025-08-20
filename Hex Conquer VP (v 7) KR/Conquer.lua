------------------
---User Options---
------------------
--unit rules
local bUnembarkedLandUnitsCaptureLandPlots = true;
local bUnembarkedLandUnitsCaptureAdjacentLandPlots = true;
local bUnembarkedLandUnitsCaptureAdjacentWaterPlots = true;
local bEmbarkedUnitsCaptureWaterPlots = true;
local bEmbarkedUnitsCaptureAdjacentWaterPlots = true;
local bEmbarkedUnitsCaptureAdjacentLandPlots = false;
local bWaterUnitsCaptureWaterPlots = true;
local bWaterUnitsCaptureAdjacentWaterPlots = true;
local bWaterUnitsCaptureAdjacentLandPlots = false;
--red hp bar = 33% and under, yellow = 34% to 66%, green 67% and up; nil to disable hp check
local iUnitMinimumHPpercentToCapture = 34;

--ownership rules
--see top of main.lua for minor civ capture ability
local bMinorCivPlotsCanBeCaptured = true;
--improvement handling rules
local bCitadelControlsAdjacentCaptures = true;
local bUnpillagedCitadelBlocksUnitCapture = true;
local bUnpillagedImprovementBlocksUnitCapture = true;
local bUnpillagedRouteBlocksUnitCapture = true;
--autopillage improvements on capture? improvement-blocks immediately above must be set to false for this to have observable effect
local bCitadelAutoPillageOnCapture = false
local bImprovementAutoPillageOnCapture = false;
local bRouteAutoPillageOnCapture = false;

local bUnpillagedFortBlocksUnitAdjacentCapture = true;
local bUnpillagedFortBlocksUnitPlotCapture = true;

--adjacency rules
local bLandMustBeAdjacentToFriendlyPlot = true;
local bWaterMustBeAdjacentToFriendlyPlot = true;

--distance rules
local bPlotMustBeAsCloseOrCloserToFriendlyCity = false;
-- eg. suggested value: GameDefines.MAXIMUM_ACQUIRE_PLOT_DISTANCE; or any other integer.  nil to disable.
local iCaptureDistanceLimitFromFriendlyCity = nil;
-- eg. suggested value: math.ceil(GameDefines.MAXIMUM_WORK_PLOT_DISTANCE/2); or any other integer.  nil to disable.
local iCaptureImmunityCityRadius = nil;
-- eg. suggested value: GameDefines.MAXIMUM_WORK_PLOT_DISTANCE; or any other integer.  nil to disable.
local iCaptureImmunityCapitalRadius = nil;
------------------

print( "Loading Conquer.lua" )

-- Traverse all units of the given player to see if they can conquer plots
function PlayerHexConquer( playerID )
	--print("starting player conquer process")
	local player = Players[ playerID ]
	if player:IsBarbarian() then return end
	local numUnits = player:GetNumUnits()
	local i = 0
	--print(string.format(">Player %s (ID %d) has %d units", player:GetName(), playerID, numUnits));
	while numUnits > 0 do
		local unit = player:GetUnitByID( i )
		if unit ~= nil then
			UnitConquerPlots( player, unit )
			numUnits = numUnits -1
		end
		i = i + 1
	end
	--print(string.format("Player %d, %s, has passed PlayerHexConquer()", playerID , player:GetName()));
end


function UnitConquerPlots( player, unit )
	--print(string.format("    Unit: %s (ID %d)", unit:GetName(), i));
	--print("starting unit conquer process")
	if not unit:IsCombatUnit() then return end -- only combat units can conquer
	if (unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_RECON) or (unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_SIEGE) or (unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_SUBMARINE) or (unit:GetDomainType() == DomainTypes.DOMAIN_HOVER) then return end -- recon, siege, submarine, and hover units cannot conquer
	if iUnitMinimumHPpercentToCapture then
		if iUnitMinimumHPpercentToCapture/100 > (unit:GetCurrHitPoints()/unit:GetMaxHitPoints()) then
			--print("unit is too low on hp, capture blocked")
			return 
		end -- low hp units won't capture
	end
	local plot = unit:GetPlot()
	if plot == nil then return end
	if not bMinorCivPlotsCanBeCaptured and Players[plot:GetOwner()]:IsMinorCiv() then return end
	if not plot:IsWater() then							-- if land plot, conquer land plots
		--print("land plot found, processing")
		if (unit:GetDomainType() == DomainTypes.DOMAIN_SEA) then return end		-- naval unit cannot directly conquer land plots
		if bUnpillagedFortBlocksUnitPlotCapture and plot:HasImprovement(GameInfo.Improvements.IMPROVEMENT_FORT.ID) and not plot:IsImprovementPillaged() then
			--print("plot has fort, capture blocked")
			return 
		end
		if bUnembarkedLandUnitsCaptureLandPlots then
			--print("bUnembarkedLandUnitsCaptureLandPlots")
			ConquerCitadel( player, plot )
			ConquerPlot( player, plot, bLandMustBeAdjacentToFriendlyPlot)
		end
		if bUnembarkedLandUnitsCaptureAdjacentLandPlots then
			--print("bUnembarkedLandUnitsCaptureAdjacentLandPlots")
			ConquerAdjacentLandPlots( player, plot )
		end
		if bUnembarkedLandUnitsCaptureAdjacentWaterPlots then
			--print("bUnembarkedLandUnitsCaptureAdjacentWaterPlots")
			ConquerAdjacentWaterPlots( player, plot )
		end
	elseif unit:IsEmbarked() then
		--print("embarked unit found in water plot, processing")
		if bEmbarkedUnitsCaptureWaterPlots then
			--print("bEmbarkedUnitsCaptureWaterPlots")
			ConquerPlot( player, plot, bWaterMustBeAdjacentToFriendlyPlot)
		end
		if bEmbarkedUnitsCaptureAdjacentWaterPlots then
			--print("bEmbarkedUnitsCaptureAdjacentWaterPlots")
			ConquerAdjacentWaterPlots( player, plot )
		end
		if bEmbarkedUnitsCaptureAdjacentLandPlots then
			--print("bEmbarkedUnitsCaptureAdjacentLandPlots")
			ConquerAdjacentLandPlots( player, plot )
		end
	else
		--print("water plot found, processing")
		if (unit:GetDomainType() == DomainTypes.DOMAIN_LAND) then return end	-- unembarked land units can never conquer naval plots
		if bWaterUnitsCaptureWaterPlots then
			ConquerPlot( player, plot, bWaterMustBeAdjacentToFriendlyPlot)
		end
		if bWaterUnitsCaptureAdjacentWaterPlots then
			ConquerAdjacentWaterPlots( player, plot )
		end
		if bWaterUnitsCaptureAdjacentLandPlots then
			ConquerAdjacentLandPlots( player, plot )
		end
	end
end


--
function ConquerPlot( player, plot, mustBeAdjacentToFriendlyPlot )
	--print("starting plot conquer process")
	--if player == nil or plot = nil then return end
	if not PlotIsConquerable( player, plot ) then return end
	
	if mustBeAdjacentToFriendlyPlot then
		if not PlotIsAdjacentToFriendlyPlot( player, plot ) then return end
	end
	
	local adjPlots = GetAdjacentPlots( plot )	
	if PlotHasEnemyCombatUnit( player, plot ) then return end
	if PlotsHaveEnemyCombatUnits( player, adjPlots ) then return end
	if PlotHasEnemyCitadel( player, plot ) then return end
	if bCitadelControlsAdjacentCaptures and PlotsHaveEnemyCitadel( player, adjPlots ) then return end
	if plot:IsCity() then return end
	if PlotsHaveACity( adjPlots ) then return end

	local playerID = player:GetID()
	local cityID = getNearestCity( playerID, plot ):GetID()
	if bImprovementAutoPillageOnCapture then
		plot:SetImprovementPillaged(true)
	end
	if bRouteAutoPillageOnCapture then
		plot:SetRoutePillaged(true)
	end
	plot:SetOwner( playerID, cityID, true, true )
	--print(string.format("%s is a new owner of plot (%d, %d)", player:GetName(), plot:GetX(), plot:GetY() ))
	table.insert( newConqueredPots, plot )
end


-- tells whether the given player can conquer the plot
-- returns true if plot is a valid, not city, and the owner is at war with the player
function PlotIsConquerable( player, plot )
	--print("checking if plot if conquerable")
	if( plot == nil ) then return false end -- not a valid plot	

	local ownerPlayerID = plot:GetOwner()
	if( ownerPlayerID < 0) then return false end -- cannot conquer a neutral plot
	
	local ownerPlayer = Players[ ownerPlayerID ]
	local invaderTeam = Teams[ player:GetTeam() ]
	if not( invaderTeam:IsAtWar( ownerPlayer:GetTeam() ) ) then return false end -- can conquer enemy's plot only
	
	if( plot:IsCity() ) then return false end -- conquering a city is a different story
	
	local iPlotImprovement = plot:GetImprovementType();
	if bUnpillagedImprovementBlocksUnitCapture and iPlotImprovement > 0 and iPlotImprovement ~= GameInfo.Improvements.IMPROVEMENT_FORT.ID and not plot:IsImprovementPillaged() then
		--print("plot has unpillaged fort, capture blocked")
		return false
	end
	if bUnpillagedRouteBlocksUnitCapture and plot:IsRoute() and not plot:IsRoutePillaged() then 
		--print("plot has unpillaged route, capture blocked")
		return false
	end

	if iCaptureDistanceLimitFromFriendlyCity then
		local _, InvaderCityDistance = getNearestCityWithException(player:GetID(), plot, nil);
		if InvaderCityDistance > iCaptureDistanceLimitFromFriendlyCity then
			--print("plot is too far from friendly city, capture blocked")
			return false 
		end
	end
	
	if iCaptureImmunityCapitalRadius then
		local pCapitalCityPlot = ownerPlayer:GetCapitalCity():Plot();
		if pCapitalCityPlot == nil then return end
		local iCapitalCityDistance = Map.PlotDistance(pCapitalCityPlot:GetX(), pCapitalCityPlot:GetY(), plot:GetX(), plot:GetY());
		if iCapitalCityDistance <= iCaptureImmunityCapitalRadius then 
			--print("plot is with capital immunity radius, capture blocked")
			return false 
		end
	end
	
	if iCaptureImmunityCityRadius then
		local _, OwnerCityDistance = getNearestCityWithException(ownerPlayerID, plot, nil);
		if OwnerCityDistance <= iCaptureImmunityCityRadius then 
			--print("plot is with city immunity radius, capture blocked")
			return false 
		end
	end
		
	if bPlotMustBeAsCloseOrCloserToFriendlyCity then
		if InvaderCityDistance == nil then
			local _, InvaderCityDistance = getNearestCityWithException(player:GetID(), plot, nil);
		end
		if OwnerCityDistance == nil then
			local _, OwnerCityDistance = getNearestCityWithException(ownerPlayerID, plot, nil);
		end
		if InvaderCityDistance > OwnerCityDistance then 
			--print("plot is further from friendly city than enemy, capture blocked")
			return false 
		end
	end

	--print(string.format("      plot (%dx, %dy) is conquerable", plot:GetX(), plot:GetY() ));
	return true
end


--
function PlotsHaveEnemyCombatUnits( player, plots )
	--print( "PlotsHaveEnemyCombatUnits" )
	if plots == nil then return false end
	for i, plot in pairs( plots ) do
		if plot ~= nil then
			if PlotHasEnemyCombatUnit( player, plot ) then
				return true
			end					
		end
	end	
	return false
end


--
function PlotHasEnemyCombatUnit( player, plot )
	--print( "PlotHasEnemyCombatUnits" )
	if plot == nil then return false end
	local numUnits = plot:GetNumUnits()
	--print(string.format("      plot (%dx, %dy) has %d units", plot:GetX(), plot:GetY(), numUnits ));
	for i=0, numUnits, 1 do
		local unit = plot:GetUnit(i)
		if unit ~= nil then
			local ownerPlayerID = unit:GetOwner()
			local ownerPlayer = Players[ ownerPlayerID ]
			local playerTeam = Teams[ player:GetTeam() ]
			local isEnemy = playerTeam:IsAtWar( ownerPlayer:GetTeam() )
			if isEnemy and unit:IsCombatUnit() then
				--print(string.format("  plot (%dx, %dy) unit[%d] is enemy", plot:GetX(), plot:GetY(), i ));
				return true
			end
		end
	end
	return false
end


function PlotsHaveEnemyCitadel( player, plots )
	--print( "PlotsHaveEnemyCitadel" )
	if plots == nil then return false end
	for i, plot in pairs( plots ) do
		if plot ~= nil then
			if PlotHasEnemyCitadel( player, plot ) then
				return true
			end					
		end
	end	
	return false
end


function PlotHasEnemyCitadel( player, plot )
	--print(string.format("      PlotHasEnemyCitadel(%s, %dx %dy)", player:GetName(), plot:GetX(), plot:GetY() ))
	if plot == nil then return false end
	if player == nil then return false end
	
	local ownerPlayerID = plot:GetOwner()
	if( ownerPlayerID < 0) then return false end
	local ownerPlayer = Players[ ownerPlayerID ]
	local playerTeam = Teams[ player:GetTeam() ]
	local isEnemy = playerTeam:IsAtWar( ownerPlayer:GetTeam() )
	if not isEnemy then return false end
	local improvementType = plot:GetImprovementType()
	if improvementType == GameInfo.Improvements.IMPROVEMENT_CITADEL.ID then
		--print(string.format("      plot (%dx, %dy) has enemy citadel", plot:GetX(), plot:GetY() ))
		return true
	else
		return false
	end
end


-- this function hasn't been completely tested by the author
function ConquerCitadel( player, plot )
	--print( "ConquerCitadel" )
	if plot == nil then return end
	if not PlotHasEnemyCitadel( player, plot ) then return end
	if bUnpillagedCitadelBlocksUnitCapture and not plot:IsImprovementPillaged() then return end
	-- conquer the citadel plot
	local city = getNearestCity( player:GetID(), plot )
	if city == nil then return end
	if bCitadelAutoPillageOnCapture then
		plot:SetImprovementPillaged(true)
	end
	if bRouteAutoPillageOnCapture then
		plot:SetRoutePillaged(true)
	end
	plot:SetOwner( player:GetID(), city:GetID(), true, true )
	table.insert( newConqueredPots, plot )
	--print( string.format( "Citadel on plot (%dx, %dy) was captured by %s", plot:GetX(), plot:GetY(), player:GetName() ))	
	
	-- conquer adjacent plots
	if bCitadelControlsAdjacentCaptures then
		ConquerPlotsAdjacentToCitadel( player, plot, city )
	end
end


-- Conquer plots adjacent to citadel
function ConquerPlotsAdjacentToCitadel( player, citedelPlot, city )
	if citedelPlot == nil then return end
	
	local plotsAdjacentToCitadel = GetAdjacentPlots( citedelPlot )	
	for i, adjPlot in pairs( plotsAdjacentToCitadel ) do
		ConquerPlotAdjacentToCitadel( player, adjPlot, city )
	end	
end

--Conquer plot adjacent to citadel if it is not controlled by another citadel or a city
function ConquerPlotAdjacentToCitadel( player, plot, city )
	--print( "ConquerPlotAdjacentToCitadel" )
	if plot == nil then return end
	if not PlayersAreAtWarByID( player:GetID(), plot:GetOwner() ) then return end
	if player == nil then return end

	if plot:IsCity() then return end
	if bUnpillagedFortBlocksCitadelCapture and (plot:HasImprovement(GameInfo.Improvements.IMPROVEMENT_FORT.ID)) and not plot:IsImprovementPillaged() then return end
	if PlotHasEnemyCitadel( player, plot ) then return end
	local adjacentPlots = GetAdjacentPlots( plot ) -- plots adjacent to plots adjacent to citadel
	if PlotsHaveACity( adjacentPlots ) then return end -- controlled by a city
	if PlotsHaveEnemyCitadel( player, adjacentPlots ) then return end -- controlled by a citadel

	plot:SetOwner( player:GetID(), city:GetID(), true, true )
	table.insert( newConqueredPots, plot )
	--print( string.format( "  with adjacent plot (%d, %d)", plot:GetX(), plot:GetY() ) )	
end

--Conquer adjacent land plots
function ConquerAdjacentLandPlots( player, centralPlot )
	local plots = GetAdjacentPlots( centralPlot )
	if plots == nil then return false end
	for i, plot in pairs( plots ) do
		if (plot ~= nil) and not (bUnpillagedFortBlocksUnitAdjacentCapture and (plot:HasImprovement(GameInfo.Improvements.IMPROVEMENT_FORT.ID)) and not plot:IsImprovementPillaged()) and (not plot:IsWater() or plot:IsLake()) then
			ConquerPlot( player, plot, bLandMustBeAdjacentToFriendlyPlot)
		end
	end	
	return false	
end

--Conquer adjacent water plots
function ConquerAdjacentWaterPlots( player, centralPlot )
	local plots = GetAdjacentPlots( centralPlot )
	if plots == nil then return false end
	for i, plot in pairs( plots ) do
		if (plot ~= nil) and plot:IsWater() then
			ConquerPlot( player, plot, bWaterMustBeAdjacentToFriendlyPlot)
		end
	end	
	return false	
end

-------------------------------------------------------------------------------------------------
------------------------------------- Encircled Plots -------------------------------------------
-------------------------------------------------------------------------------------------------

--
function EliminateEncircledPlots( playerID )
	--local deltaTime = os.clock()
	FindEncirclments( playerID )
	--local player = Players[ playerID ]
	--print( string.format( "  Player %s, time %f", player:GetName(), os.clock() - deltaTime ) )	
end


--
function FindEncirclments( playerID )
	local w, h = Map.GetGridSize()
	w = w - 1
	h = h - 1
	for x=0, w, 1 do
		for y=0, h, 1 do
			local plot = Map.GetPlot( x, y )
			CheckIfPlotIsEncircled( playerID, plot )
		end
	end
end


--
function CheckIfPlotsAreEncircled( playerID, plots )
	if plots == nil then return false end
	for i, plot in pairs( plots ) do
		CheckIfPlotIsEncircled( playerID, plot )
	end	
end


--
function CheckIfPlotIsEncircled( playerID, plot )
	if plot == nil then return end
	if playerID ~= plot:GetOwner() then return end
	local adjPlots = GetAdjacentPlots( plot )
	if not PlotIsAtBorder( playerID, adjPlots ) then return end
	if not PlotMightBeEncircled( playerID, plot, adjPlots ) then return end
	--print( string.format( "Is plot (%d, %d) Encircled???", plot:GetX(), plot:GetY() ) )	
	
	if PlotHasUnit( playerID, plot ) then return end
	if PlotsHaveUnit( playerID, adjPlots ) then return end
	if PlotHasCityOrCitadel( playerID, plot ) then return end
	if PlotsHaveCityOrCitadel( playerID, adjPlots ) then return end

	local city, distance = getNearestCityWithException( playerID, plot, -1 )
	local city2, distance2 = getAnyNearestCity( plot )
	if city == nil or distance == nil or city2 == nil or distance2 == nil then return end
	if distance <= distance2 then return end

	if distance2 <= GameDefines.MAXIMUM_WORK_PLOT_DISTANCE then 
		plot:SetOwner( city2:GetOwner(), city2:GetID(), true, true )
		table.insert( newConqueredPots, plot )
		--print( string.format( "Encircled plot (%d, %d) was reassigned to %s", plot:GetX(), plot:GetY(), city2:GetName()))	
		CheckIfPlotsAreEncircled( playerID, adjPlots )
	end
	
	--IF the closest city is an enemy city, then use adjacent tiles to decide. ???
	--reevaluate the plots adjacent to the plot which changed the ownership
end


--
function PlotIsAtBorder( playerID, adjPlots )
	if adjPlots == nil then return false end
	for i, plot in pairs( adjPlots ) do
		if plot ~= nil then
			if plot:GetOwner() ~= playerID then return true end
		end
	end	
	return false
end


--
function PlotsHaveCityOrCitadel( playerID, plots )
	if plots == nil then return false end
	for i, plot in pairs( plots ) do
		if PlotHasCityOrCitadel( playerID, plot ) then return true end
	end	
	return false
end


--
function PlotHasCityOrCitadel( playerID, plot )
	if plot == nil then return false end
	if plot:IsCity() then return true end
	if plot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_CITADEL.ID then return true end
end


--
function PlotsHaveUnit( playerID, plots )
	if plots == nil then return false end
	for i, plot in pairs( plots ) do
		if PlotHasUnit( playerID, plot ) then
			return true
		end
	end	
	return false
end


--
function PlotHasUnit( playerID, plot )
	if plot == nil then return false end
	local numUnits = plot:GetNumUnits()
	for i=0, numUnits, 1 do
		local unit = plot:GetUnit(i)
		if unit ~= nil then
			if playerID == unit:GetOwner() and unit:IsCombatUnit() then 
				return true
			end
		end
	end
	return false
end


function PlotMightBeEncircled( playerID, plot, adjPlots )
	if plot == nil then return false end
	if adjPlots == nil then return false end
	local city, distance = getNearestCityWithException( playerID, plot, -1 )
	for i, adjPlot in pairs( adjPlots ) do
		if adjPlot ~= nil and playerID == adjPlot:GetOwner() then
			local cityAdj, distanceAdj = getNearestCityWithException( playerID, adjPlot, -1 )
			if distanceAdj < distance then return false end
		end
	end	
	return true
end