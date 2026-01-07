function CD_DzongFoodMountain(iPlayer, iUnit, iPlotX, iPlotY, iBuild)
	local pPlayer = Players[iPlayer]
	local pPlot = Map.GetPlot(iPlotX, iPlotY)
	if not pPlayer:IsAlive() then return end
	if not pPlot then return end
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if not pUnit then return end
	if iBuild == GameInfoTypes.BUILD_JAR_DZONG and pPlot:IsMountain() then
		Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfo.Yields.YIELD_FOOD.ID, 2 )
	end
end

GameEvents.PlayerBuilt.Add(CD_DzongFoodMountain)
