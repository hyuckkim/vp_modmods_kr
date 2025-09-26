print("[CAYM] Prospecting Lua loaded")

-- === COAL ===
local iProspectcoal = GameInfoTypes.IMPROVEMENT_PROSPECT_COAL
local iMine = GameInfoTypes.IMPROVEMENT_MINE
local iCoal = GameInfoTypes.RESOURCE_COAL

function MakeCoal(pPlot, iPlayer)
	local pPlayer = Players[iPlayer]
	local iTotal = pPlayer:GetNumResourceTotal(iCoal, true)
	if pPlot:GetResourceType() == -1 and iTotal <= 12 then
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(iCoal, 4)
		pPlot:SetImprovementType(iMine)
		print(string.format("[Prospect] Player %d created COAL (total: %d)", iPlayer, iTotal))
	else
		print(string.format("[Prospect Blocked] Player %d has too much COAL (%d)", iPlayer, iTotal))
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
	local iTotal = pPlayer:GetNumResourceTotal(iHorse, true)
	if pPlot:GetResourceType() == -1 and iTotal <= 12 then
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(iHorse, 4)
		pPlot:SetImprovementType(iPasture)
		print(string.format("[Prospect] Player %d created HORSE (total: %d)", iPlayer, iTotal))
	else
		print(string.format("[Prospect Blocked] Player %d has too much HORSE (%d)", iPlayer, iTotal))
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
	local iTotal = pPlayer:GetNumResourceTotal(iIron, true)
	if pPlot:GetResourceType() == -1 and iTotal <= 12 then
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(iIron, 4)
		pPlot:SetImprovementType(iMine)
		print(string.format("[Prospect] Player %d created IRON (total: %d)", iPlayer, iTotal))
	else
		print(string.format("[Prospect Blocked] Player %d has too much IRON (%d)", iPlayer, iTotal))
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
	local iTotal = pPlayer:GetNumResourceTotal(iOil, true)
	if pPlot:GetResourceType() == -1 and iTotal <= 12 then
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(iOil, 4)
		pPlot:SetImprovementType(iWell)
		print(string.format("[Prospect] Player %d created OIL (land) (total: %d)", iPlayer, iTotal))
	else
		print(string.format("[Prospect Blocked] Player %d has too much OIL (land) (%d)", iPlayer, iTotal))
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
	local iTotal = pPlayer:GetNumResourceTotal(iOil, true)
	if pPlot:IsWater() and pPlot:GetResourceType() == -1 and iTotal <= 12 then
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(iOil, 4)
		pPlot:SetImprovementType(iPlatform)
		print(string.format("[Prospect] Player %d created OIL (sea) (total: %d)", iPlayer, iTotal))
	else
		print(string.format("[Prospect Blocked] Player %d has too much OIL (sea) (%d)", iPlayer, iTotal))
	end
end

Events.SerialEventImprovementCreated.Add(function(HexX, HexY, _, _, iPlayer, iImprovement)
	local pPlot = Map.GetPlot(ToGridFromHex(HexX, HexY))
	if pPlot and iImprovement == iProspectOilSea then
		MakeSeaOil(pPlot, iPlayer)
	end
end)
