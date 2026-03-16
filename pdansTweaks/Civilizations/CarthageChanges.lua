--Carthage Lua function
include("FLuaVector.lua")

local eCivilizationCarthage = GameInfoTypes.CIVILIZATION_CARTHAGE
local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent / 100

function CarthageLuxuryImproveGold(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged)
	local pPlayer = Players[iOwner]
    
    if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationCarthage) then return end

	if not pPlot then return end
	
	if iOldImprovement == 'NO_IMPROVEMENT' then return end
	
	local pPlot = Map.GetPlot(iX, iY)
	local iResource = pPlot:GetResourceType(-1)
	if iResource ~= -1 then

		if GameInfo.Resources[iResource].ResourceClassType == 'RESOURCECLASS_LUXURY' then
			local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
			local iGoldGain = math.floor(50 * iEraModifier * fGameSpeedModifier)
			pPlayer:ChangeGold(iGoldGain)
			
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vPlotPosition = PositionCalculator(iX, iY)
				Events.AddPopupTextEvent(vPlotPosition, "[COLOR_YIELD_GOLD]+"..iGoldGain.." [ICON_GOLD][ENDCOLOR]", 1)
			
				pPlayer:AddNotification(0, 
					'Resource Connected:[NEWLINE][ICON_BULLET] +'..iGoldGain..' [ICON_GOLD] Gold', 
					'Phoenician Heritage', 
					iX, iY)
			end
		end
	end
end

function CarthageLuxuryFoundGold(iPlayer, iX, iY)
	local pPlayer = Players[iPlayer]
	
	if not(pPlayer and pPlayer:GetCivilizationType() == eCivilizationCarthage) then return end

	local pPlot = Map.GetPlot(iX, iY)
	local iResource = pPlot:GetResourceType(-1)
	if iResource ~= -1 then

		if GameInfo.Resources[iResource].ResourceClassType == 'RESOURCECLASS_LUXURY' then
			local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
			local iGoldGain = math.floor(50 * iEraModifier * fGameSpeedModifier)
			pPlayer:ChangeGold(iGoldGain)
			
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vPlotPosition = PositionCalculator(iX, iY)
				Events.AddPopupTextEvent(vPlotPosition, "[COLOR_YIELD_GOLD]+"..iGoldGain.." [ICON_GOLD][ENDCOLOR]", 1)
			
				pPlayer:AddNotification(0, 
					'Resource Connected:[NEWLINE][ICON_BULLET] +'..iGoldGain..' [ICON_GOLD] Gold', 
					'Phoenician Heritage', 
					iX, iY)
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationCarthage) then
	GameEvents.TileImprovementChanged.Add(CarthageLuxuryImproveGold)
	GameEvents.PlayerCityFounded.Add(CarthageLuxuryFoundGold)
end