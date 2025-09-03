-- ManualFix
-- Author: Jarcast
-- DateCreated: 4/14/2024 6:48:55 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("PlotIterators.lua")
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
local tYieldBuildings = {}
tYieldBuildings[GameInfoTypes.YIELD_FOOD] 					= GameInfoTypes.BUILDING_JAR_DUMMY_FOOD
tYieldBuildings[GameInfoTypes.YIELD_PRODUCTION] 			= GameInfoTypes.BUILDING_JAR_DUMMY_PROD
tYieldBuildings[GameInfoTypes.YIELD_GOLD] 					= GameInfoTypes.BUILDING_JAR_DUMMY_GOLD
tYieldBuildings[GameInfoTypes.YIELD_SCIENCE] 				= GameInfoTypes.BUILDING_JAR_DUMMY_SCIENCE
tYieldBuildings[GameInfoTypes.YIELD_CULTURE] 				= GameInfoTypes.BUILDING_JAR_DUMMY_CULTURE
tYieldBuildings[GameInfoTypes.YIELD_FAITH] 					= GameInfoTypes.BUILDING_JAR_DUMMY_FAITH
tYieldBuildings[GameInfoTypes.YIELD_TOURISM] 				= GameInfoTypes.BUILDING_JAR_DUMMY_TOURISM
tYieldBuildings[GameInfoTypes.YIELD_GOLDEN_AGE_POINTS] 		= GameInfoTypes.BUILDING_JAR_DUMMY_GAP
tYieldBuildings[GameInfoTypes.YIELD_GREAT_GENERAL_POINTS] 	= GameInfoTypes.BUILDING_JAR_DUMMY_GENERAL
tYieldBuildings[GameInfoTypes.YIELD_GREAT_ADMIRAL_POINTS] 	= GameInfoTypes.BUILDING_JAR_DUMMY_ADMIRAL
tYieldBuildings[GameInfoTypes.YIELD_CULTURE_LOCAL] 			= GameInfoTypes.BUILDING_JAR_DUMMY_BORDER

function Jar_Fix_Table_PerXFeatureTimes100(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	if pPlayer:IsBarbarian() or pPlayer:IsMinorCiv() then return end
	
	local tYields = {}
	tYields[GameInfoTypes.YIELD_FOOD] 					= 0
	tYields[GameInfoTypes.YIELD_PRODUCTION] 			= 0
	tYields[GameInfoTypes.YIELD_GOLD] 					= 0
	tYields[GameInfoTypes.YIELD_SCIENCE] 				= 0
	tYields[GameInfoTypes.YIELD_CULTURE] 				= 0
	tYields[GameInfoTypes.YIELD_FAITH] 					= 0
	tYields[GameInfoTypes.YIELD_TOURISM] 				= 0
	tYields[GameInfoTypes.YIELD_GOLDEN_AGE_POINTS] 		= 0
	tYields[GameInfoTypes.YIELD_GREAT_GENERAL_POINTS] 	= 0
	tYields[GameInfoTypes.YIELD_GREAT_ADMIRAL_POINTS] 	= 0
	tYields[GameInfoTypes.YIELD_CULTURE_LOCAL]			= 0
	
	for row in GameInfo.Belief_CityYieldPerXFeatureTimes100() do
		if pPlayer:HasBelief(GameInfoTypes[row.BeliefType]) and GameInfoTypes[row.FeatureType] == GameInfoTypes.FEATURE_VOLCANO_NEW then
			tYields[GameInfoTypes[row.YieldType]] = tYields[GameInfoTypes[row.YieldType]] + row.Yield
		end
	end
	for pCity in pPlayer:Cities() do
		local iVolcano = 0
		for pPlot in PlotAreaSweepIterator(pCity:Plot(), 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			local bOwner = pPlot:GetOwner() == iPlayer or pPlot:GetOwner() == -1
			if pPlot and bOwner and pPlot:GetFeatureType() == GameInfoTypes.FEATURE_VOLCANO_NEW then
				iVolcano = iVolcano +1
			end
		end
		if iVolcano>0 then
			local tYieldsB = {}
			tYieldsB[GameInfoTypes.YIELD_FOOD] 					= 0
			tYieldsB[GameInfoTypes.YIELD_PRODUCTION] 			= 0
			tYieldsB[GameInfoTypes.YIELD_GOLD] 					= 0
			tYieldsB[GameInfoTypes.YIELD_SCIENCE] 				= 0
			tYieldsB[GameInfoTypes.YIELD_CULTURE] 				= 0
			tYieldsB[GameInfoTypes.YIELD_FAITH] 				= 0
			tYieldsB[GameInfoTypes.YIELD_TOURISM] 				= 0
			tYieldsB[GameInfoTypes.YIELD_GOLDEN_AGE_POINTS] 	= 0
			tYieldsB[GameInfoTypes.YIELD_GREAT_GENERAL_POINTS] 	= 0
			tYieldsB[GameInfoTypes.YIELD_GREAT_ADMIRAL_POINTS] 	= 0
			tYieldsB[GameInfoTypes.YIELD_CULTURE_LOCAL]			= 0
			for row in GameInfo.Building_YieldPerXFeatureTimes100() do
				if pCity:IsHasBuilding(GameInfoTypes[row.BuildingType]) and GameInfoTypes[row.FeatureType] == GameInfoTypes.FEATURE_VOLCANO_NEW then
					tYieldsB[GameInfoTypes[row.YieldType]] = tYieldsB[GameInfoTypes[row.YieldType]] + row.Yield
				end
			end
			for yield, amount in pairs(tYields) do
				local iNum = math.ceil(iVolcano*(amount + tYieldsB[yield]) /100)
				pCity:SetNumRealBuilding(tYieldBuildings[yield] , iNum)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Jar_Fix_Table_PerXFeatureTimes100)
---------------------------------------------------------
print("Jarcast Volcanoes Table Fix functions loaded")
--==========================================================================================================================
--==========================================================================================================================