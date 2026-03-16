-- ASP_polarwildgame.lua
-- Author: Jarcast
-- DateCreated: 2/3/2026 11:01:58 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("AssignStartingPlots")
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
local __Init = AssignStartingPlots.__Init
function AssignStartingPlots.__Init(ASP)
    __Init(ASP)
    ASP.polarwildgame_ID = GameInfo.Resources.RESOURCE_JAR_POLARWILDGAME.ID
end

local PlaceBonusResources = AssignStartingPlots.PlaceBonusResources
function AssignStartingPlots.PlaceBonusResources(ASP)
    PlaceBonusResources(ASP)
	
	local resMultiplier = 1;
	if ASP.bonusDensity == 1 then -- Sparse, so increase the number of tiles per bonus.
		resMultiplier = 1.5;
	elseif ASP.bonusDensity == 3 then -- Abundant, so reduce the number of tiles per bonus.
		resMultiplier = 0.66666667;
	elseif ASP.bonusDensity == 4 then -- Random
		resMultiplier = ASP:GetRandomMultiplier(0.5);
	end	
    resources_to_place = {
        {ASP.polarwildgame_ID, 1, 100, 1, 1}
    };
	local ResFrequency = 10 * resMultiplier
	local tPlotList = ASP.global_resource_plot_lists;
    ASP:ProcessResourceList(ResFrequency, ImpactLayers.LAYER_BONUS, tPlotList[PlotListTypes.FLAT_SNOW], resources_to_place);
	print("Polar Wild Game frequency: " .. ResFrequency)
end

local PrintFinalResourceTotalsToLog = AssignStartingPlots.PrintFinalResourceTotalsToLog
function AssignStartingPlots.PrintFinalResourceTotalsToLog(ASP)
    PrintFinalResourceTotalsToLog(ASP)
    print(ASP.polarwildgame_ID, "PolarGame: ", ASP.amounts_of_resources_placed[ASP.polarwildgame_ID + 1]);
end
--------------------------------------------------------------
print("Jarcast's Polar Wild Game resource loaded!")
--=======================================================================================================================
--=======================================================================================================================