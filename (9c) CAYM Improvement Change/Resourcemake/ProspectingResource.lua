print("[CAYM] Prospecting Lua loaded")

-- === COAL ===
local iProspectcoal = GameInfoTypes.IMPROVEMENT_PROSPECT_COAL
local iMine = GameInfoTypes.IMPROVEMENT_MINE
local iCoal = GameInfoTypes.RESOURCE_COAL

function MakeCoal(pPlot, iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlot:GetResourceType() == -1 then
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(iCoal, 2)
		pPlot:SetImprovementType(iMine)
		print(string.format("[Prospect] Player %d created COAL x2", iPlayer))
	end
end

Events.SerialEventImprovementCreated.Add(function(HexX, HexY, _, _, iPlayer, iImprovement)
	local pPlot = Map.GetPlot(ToGridFromHex(HexX, HexY))
	if pPlot:GetImprovementType() == iProspectcoal then
		MakeCoal(pPlot, iPlayer)
	end
end)

-- === HORSE ===
local iProspecthorse = GameInfoTypes.IMPROVEMENT_PROSPECT_HORSE
local iPasture = GameInfoTypes.IMPROVEMENT_PASTURE
local iHorse = GameInfoTypes.RESOURCE_HORSE

function MakeHorse(pPlot, iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlot:GetResourceType() == -1 then
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(iHorse, 2)
		pPlot:SetImprovementType(iPasture)
		print(string.format("[Prospect] Player %d created HORSE x2", iPlayer))
	end
end

Events.SerialEventImprovementCreated.Add(function(HexX, HexY, _, _, iPlayer, iImprovement)
	local pPlot = Map.GetPlot(ToGridFromHex(HexX, HexY))
	if pPlot:GetImprovementType() == iProspecthorse then
		MakeHorse(pPlot, iPlayer)
	end
end)

-- === IRON ===
local iProspectiron = GameInfoTypes.IMPROVEMENT_PROSPECT_IRON
local iIron = GameInfoTypes.RESOURCE_IRON

function MakeIron(pPlot, iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlot:GetResourceType() == -1 then
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(iIron, 2)
		pPlot:SetImprovementType(iMine)
		print(string.format("[Prospect] Player %d created IRON x2", iPlayer))
	end
end

Events.SerialEventImprovementCreated.Add(function(HexX, HexY, _, _, iPlayer, iImprovement)
	local pPlot = Map.GetPlot(ToGridFromHex(HexX, HexY))
	if pPlot:GetImprovementType() == iProspectiron then
		MakeIron(pPlot, iPlayer)
	end
end)

-- === OIL (LAND) ===
local iProspectoil = GameInfoTypes.IMPROVEMENT_PROSPECT_OIL
local iWell = GameInfoTypes.IMPROVEMENT_WELL
local iOil = GameInfoTypes.RESOURCE_OIL

function MakeOil(pPlot, iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlot:GetResourceType() == -1 then
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(iOil, 2)
		pPlot:SetImprovementType(iWell)
		print(string.format("[Prospect] Player %d created OIL (land) x2", iPlayer))
	end
end

Events.SerialEventImprovementCreated.Add(function(HexX, HexY, _, _, iPlayer, iImprovement)
	local pPlot = Map.GetPlot(ToGridFromHex(HexX, HexY))
	if pPlot:GetImprovementType() == iProspectoil then
		MakeOil(pPlot, iPlayer)
	end
end)

-- === OIL (SEA) ===
local iProspectOilSea = GameInfoTypes.IMPROVEMENT_PROSPECT_OIL_SEA
local iPlatform = GameInfoTypes.IMPROVEMENT_OFFSHORE_PLATFORM

function MakeSeaOil(pPlot, iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlot:IsWater() and pPlot:GetResourceType() == -1 then
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(iOil, 2)
		pPlot:SetImprovementType(iPlatform)
		print(string.format("[Prospect] Player %d created OIL (sea) x2", iPlayer))
	end
end

Events.SerialEventImprovementCreated.Add(function(HexX, HexY, _, _, iPlayer, iImprovement)
	local pPlot = Map.GetPlot(ToGridFromHex(HexX, HexY))
	if pPlot and iImprovement == iProspectOilSea then
		MakeSeaOil(pPlot, iPlayer)
	end
end)
