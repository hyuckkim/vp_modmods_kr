-- GetDemSEALS
-- Author: pineappledan
-- DateCreated: 03/30/2019
--------------------------------------------------------------
include("FLuaVector.lua")

local eCivilizationInuit = GameInfoTypes.CIVILIZATION_CLINUIT

function GetDemSEALS(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged)
	local pPlayer = Players[iOwner]
    
    if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationInuit) then return end

	local eImprovementBoat = GameInfoTypes.IMPROVEMENT_FISHING_BOATS
	local pPlot = Map.GetPlot(iX, iY)

	if not pPlot then return end
	
	if iNewImprovement == eImprovementBoat then
		print("Get Dem SEALS!")
		if pPlot:GetResourceType() == GameInfoTypes.RESOURCE_FISH then
			for eDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), eDirection)	

				for k = 0, pAdjacentPlot:GetTerrainType() - 1 do
					local pAdjacentTerrain = pAdjacentPlot:GetTerrainType(k)				
					if (pAdjacentTerrain == GameInfoTypes.TERRAIN_TUNDRA or pAdjacentTerrain == GameInfoTypes.TERRAIN_SNOW) then
						print("Turn this to Seals!")
						pPlot:SetImprovementType(-1)
						pPlot:SetResourceType(-1)
						pPlot:SetResourceType(GameInfoTypes.RESOURCE_CLSEALS, 1)
						pPlot:SetImprovementType(eImprovementBoat)
						local pTitle = ("Seals!")
						local pDesc = ("Our expert trappers have lured Seals to eat our fish! New source of [ICON_RES_CLSEALS] Seals")
						local IconID = GameInfo.Buildings{Type="BUILDING_ACBWIDGETBIG"}().ID 
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_BEATEN, pDesc, pTitle, pPlot:GetX(), pPlot:GetY(), IconID)
					return end
				end
			end
		end
	
	elseif iNewImprovement == GameInfoTypes.IMPROVEMENT_INUKSUK then
		print("Inuk Blob!")
		local iCity = pPlot:GetWorkingCity():GetID()
		for eDirection2 = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pAdjacentPlot2 = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), eDirection2)	

			if	(pAdjacentPlot2 and pAdjacentPlot2:GetOwner() == -1) then
				pAdjacentPlot2:SetOwner(iOwner, iCity, 1, 1)
				print("Tiles! Nom Nom Nom")
			end
		end
	end
end

function OnConstructionBuildIgluviak(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationInuit) then return end
	if iBuilding ~= GameInfoTypes.BUILDING_CLINUIT_IGLOO then return end

	local pCity = pPlayer:GetCityByID(iCity)
	local tPossibleSpots = {}
	local iX, iY = pCity:GetX(), pCity:GetY()
	local sCityName = pCity:GetName()
	
	for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
		local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)
		
		if (pSpecificPlot and (pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW)) then
			if (pSpecificPlot:GetResourceType(-1) == (-1) and pSpecificPlot:GetImprovementType() == (-1) and not pSpecificPlot:IsCity() and not pSpecificPlot:IsMountain()) then

				local iPlotOwner = pSpecificPlot:GetOwner()
				if iPlotOwner == iPlayer or iPlotOwner == -1 then
					tPossibleSpots[#tPossibleSpots + 1] = pSpecificPlot
				end
			end
		end
	end

	if #tPossibleSpots <= 0 then

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(0, 
			'There was no suitable place near [COLOR_CYAN]'..sCityName..'[ENDCOLOR] to build an Igluviak.', 
			'Cannot build Igvluviak near '..sCityName, 
			iX, iY)
		end	
		return 
	end

	local iChosenPlot = Game.Rand(#tPossibleSpots - 1, "") + 1
	local pChosenPlot = tPossibleSpots[iChosenPlot]
	pChosenPlot:SetOwner(iPlayer, iCity, 1, 1)
	pChosenPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_INUIT_IGLOO)	
	
	if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
		pPlayer:AddNotification(0, 
		'An Igluviak has been built near [COLOR_CYAN]'..sCityName..'[ENDCOLOR]!', 
		'Igvluviak built near '..sCityName, 
		iX, iY)
	end	
	return 
end
	
function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationInuit) then
	GameEvents.TileImprovementChanged.Add(GetDemSEALS)
	GameEvents.CityConstructed.Add(OnConstructionBuildIgluviak)
end