--========================================================================================================================
-- UI - STRATEGIC OUTPOST
--========================================================================================================================
function Jar_CanBuildOutpost(iPlayer, eUnit, iX, iY, eBuild)
	local pPlot = Map.GetPlot(iX, iY)
	local pPlayer = Players[iPlayer]
    if eBuild == GameInfoTypes.BUILD_JAR_STRATOUTPOST then		
		return (pPlot:GetOwner() == -1)
	end
	return true
end
GameEvents.PlayerCanBuild.Add(Jar_CanBuildOutpost)
---------------------------------------------------------
print("Jarcast's Extraction Outpost functions loaded")
--==========================================================================================================================
--==========================================================================================================================