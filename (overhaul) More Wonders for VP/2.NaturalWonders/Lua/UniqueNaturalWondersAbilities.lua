print("Loading UniqueNaturalWondersAbilities.lua from MWfVP");
--------------------------------------------------------------
-- Natural Wonders Abilities
-- Dec 13, 2017: Retrofitted for Vox Populi, Infixo
-- May 11, 2020: Created, adan_eslavo
--------------------------------------------------------------
local g_tNaturalWonder = {
	GameInfoTypes["FEATURE_SALAR_A"], -- 1
	GameInfoTypes["FEATURE_SALAR_B"],
	GameInfoTypes["FEATURE_EL_DORADO"],
	GameInfoTypes["FEATURE_POTOSI"],
	GameInfoTypes["FEATURE_CRATER"], --5
	GameInfoTypes["FEATURE_MESA"],
	GameInfoTypes["FEATURE_SOLOMONS_MINES"],
	GameInfoTypes["FEATURE_VOLCANO"],
	GameInfoTypes["FEATURE_FUJI"],
	GameInfoTypes["FEATURE_MT_SINAI"], -- 10
	GameInfoTypes["FEATURE_GEYSER"],
	GameInfoTypes["FEATURE_MT_EVEREST"],
	GameInfoTypes["FEATURE_NEW_REEF_A"],
	GameInfoTypes["FEATURE_NEW_REEF_B"],
	GameInfoTypes["FEATURE_NEW_REEF_C"], -- 15
	GameInfoTypes["FEATURE_GIBRALTAR"],
	GameInfoTypes["FEATURE_LAKE_VICTORIA"],
	GameInfoTypes["FEATURE_CAUSEWAY_A"],
	GameInfoTypes["FEATURE_CAUSEWAY_B"],
	GameInfoTypes["FEATURE_RETBA"], -- 20
	GameInfoTypes["FEATURE_LUMI_BAY"],
	GameInfoTypes["FEATURE_DALLOL"],
	GameInfoTypes["FEATURE_EYE_OF_SAHARA_A"],
	GameInfoTypes["FEATURE_EYE_OF_SAHARA_B"],
	GameInfoTypes["FEATURE_EYE_OF_SAHARA_C"], -- 25
	GameInfoTypes["FEATURE_MT_PAEKTU"],
	GameInfoTypes["FEATURE_MT_KAILASH"],
	GameInfoTypes["FEATURE_KILIMANJARO"],
	GameInfoTypes["FEATURE_ULURU"],
	GameInfoTypes["FEATURE_BLUE_HOLE"], -- 30
	GameInfoTypes["FEATURE_GALAPAGOS_A"],
	GameInfoTypes["FEATURE_GALAPAGOS_B"],
	GameInfoTypes["FEATURE_HA_LONG_A"],
	GameInfoTypes["FEATURE_HA_LONG_B"],
	GameInfoTypes["FEATURE_ZHANGJIAJIE"], -- 35
	GameInfoTypes["FEATURE_AURORA_A"],
	GameInfoTypes["FEATURE_AURORA_B"],
	GameInfoTypes["FEATURE_AURORA_C"],
	GameInfoTypes["FEATURE_JEJU_DO"],
	GameInfoTypes["FEATURE_ARCH"], -- 40
	GameInfoTypes["FEATURE_MARIANA_A"],
	GameInfoTypes["FEATURE_MARIANA_B"],
	GameInfoTypes["FEATURE_MARIANA_C"]
}

local g_tNaturalWonderDummy = {
	GameInfoTypes["BUILDING_SALAR_A_DUMMY"], -- 1
	GameInfoTypes["BUILDING_SALAR_B_DUMMY"],
	GameInfoTypes["BUILDING_EL_DORADO_DUMMY"],
	GameInfoTypes["BUILDING_POTOSI_DUMMY"],
	GameInfoTypes["BUILDING_CRATER_DUMMY"], -- 5
	GameInfoTypes["BUILDING_MESA_DUMMY"],
	GameInfoTypes["BUILDING_SOLOMONS_MINES_DUMMY"],
	GameInfoTypes["BUILDING_VOLCANO_DUMMY"],					-- placed in wonder spot
	GameInfoTypes["BUILDING_FUJI_1_DUMMY"],						-- placed in wonder spot
	GameInfoTypes["BUILDING_MT_SINAI_DUMMY"], -- 10
	GameInfoTypes["BUILDING_GEYSER_DUMMY"],
	GameInfoTypes["BUILDING_MT_EVEREST_DUMMY"],
	GameInfoTypes["BUILDING_NEW_REEF_A_DUMMY"],
	GameInfoTypes["BUILDING_NEW_REEF_B_DUMMY"],
	GameInfoTypes["BUILDING_NEW_REEF_C_DUMMY"], -- 15
	GameInfoTypes["BUILDING_GIBRALTAR_DUMMY"],
	GameInfoTypes["BUILDING_LAKE_VICTORIA_DUMMY"],
	GameInfoTypes["BUILDING_CAUSEWAY_A_DUMMY"],
	GameInfoTypes["BUILDING_CAUSEWAY_B_DUMMY"],
	GameInfoTypes["BUILDING_RETBA_DUMMY"], -- 20
	GameInfoTypes["BUILDING_LUMI_BAY_DUMMY"],
	GameInfoTypes["BUILDING_DALLOL_DUMMY"],
	GameInfoTypes["BUILDING_EYE_OF_SAHARA_A_DUMMY"],
	GameInfoTypes["BUILDING_EYE_OF_SAHARA_B_DUMMY"],
	GameInfoTypes["BUILDING_EYE_OF_SAHARA_C_DUMMY"], -- 25
	GameInfoTypes["BUILDING_MT_PAEKTU"],						-- regular building not dummy, placed in wonder spot
	GameInfoTypes["BUILDING_MT_KAILASH_DUMMY"],
	GameInfoTypes["BUILDING_KILIMANJARO_DUMMY"],
	nil,
	GameInfoTypes["BUILDING_BLUE_HOLE_DUMMY"], -- 30
	GameInfoTypes["BUILDING_GALAPAGOS_A_DUMMY"], 
	GameInfoTypes["BUILDING_GALAPAGOS_B_DUMMY"],
	GameInfoTypes["BUILDING_HA_LONG_A_DUMMY"],
	GameInfoTypes["BUILDING_HA_LONG_B_DUMMY"],
	GameInfoTypes["BUILDING_ZHANGJIAJIE_DUMMY"], -- 35
	GameInfoTypes["BUILDING_AURORA_A_DUMMY"], 
	GameInfoTypes["BUILDING_AURORA_B_DUMMY"],
	GameInfoTypes["BUILDING_AURORA_C_DUMMY"],
	GameInfoTypes["BUILDING_JEJU_DO_DUMMY"],					-- placed in wonder spot
	GameInfoTypes["BUILDING_ARCH_DUMMY"], -- 40					-- placed in wonder spot
	GameInfoTypes["BUILDING_MARIANA_A_DUMMY"],
	GameInfoTypes["BUILDING_MARIANA_B_DUMMY"],
	GameInfoTypes["BUILDING_MARIANA_C_DUMMY"]
}

local g_tNaturalWonderOwner = {}
local g_tNaturalWonderX = {}
local g_tNaturalWonderY = {}
local g_iWonderWithDummies = #g_tNaturalWonder


-- table checking if Natural wonder exists on the map
local g_tNaturalWonderExists = {}
	for i = 1, g_iWonderWithDummies do
		g_tNaturalWonderExists[i] = false
	end


-- table for placement a regular building in particular City instead of Capital
local g_tNaturalWonderRealBuilding = {}
	for i = 1, g_iWonderWithDummies do
		g_tNaturalWonderRealBuilding[i] = false
	end
	g_tNaturalWonderRealBuilding[26] = true -- Mt. Paektu


-- table for placement a dummy building in particular City instead of Capital
local g_tNaturalWonderLocalBuilding = {}
	for i = 1, g_iWonderWithDummies do
		g_tNaturalWonderLocalBuilding[i] = false
	end
	g_tNaturalWonderLocalBuilding[8] = true		-- Krakatoa
	g_tNaturalWonderLocalBuilding[9] = true		-- Mt. Fuji
	g_tNaturalWonderLocalBuilding[39] = true	-- Seongsan Ilchulbong
	g_tNaturalWonderLocalBuilding[40] = true	-- Delicate Arch


-- tables for placement more than one dummy bulding per wonder
local g_tNaturalWonderDummy2 = {}
	for i = 1, g_iWonderWithDummies do
		g_tNaturalWonderDummy2[i] = false
	end
	g_tNaturalWonderDummy2[9] = GameInfoTypes["BUILDING_FUJI_2_DUMMY"]

local g_tNaturalWonderDummy3 = {}
	for i = 1, g_iWonderWithDummies do
		g_tNaturalWonderDummy3[i] = false
	end
	g_tNaturalWonderDummy3[9] = GameInfoTypes["BUILDING_FUJI_3_DUMMY"]


-- table for adding policies
local g_tNaturalWonderDummyPolicy = {}
	for i = 1, g_iWonderWithDummies do
		g_tNaturalWonderDummyPolicy[i] = false
	end
	g_tNaturalWonderDummyPolicy[6] = GameInfoTypes["POLICY_MESA_DUMMY"]
	g_tNaturalWonderDummyPolicy[20] = GameInfoTypes["POLICY_RETBA_DUMMY"]
	g_tNaturalWonderDummyPolicy[21] = GameInfoTypes["POLICY_LUMI_BAY_DUMMY"]
	g_tNaturalWonderDummyPolicy[29] = GameInfoTypes["POLICY_ULURU_DUMMY"]
	g_tNaturalWonderDummyPolicy[33] = GameInfoTypes["POLICY_HA_LONG_A_DUMMY"]
	g_tNaturalWonderDummyPolicy[34] = GameInfoTypes["POLICY_HA_LONG_B_DUMMY"]
	g_tNaturalWonderDummyPolicy[35] = GameInfoTypes["POLICY_ZHANGJIAJIE_DUMMY"]
	g_tNaturalWonderDummyPolicy[41] = GameInfoTypes["POLICY_MARIANA_A_DUMMY"]
	g_tNaturalWonderDummyPolicy[42] = GameInfoTypes["POLICY_MARIANA_B_DUMMY"]
	g_tNaturalWonderDummyPolicy[43] = GameInfoTypes["POLICY_MARIANA_C_DUMMY"]



-- load game and check if they exists
function CheckIfNaturalWonderExists()
	for j = 0, Map.GetNumPlots() - 1 do
		local pPlot = Map.GetPlotByIndex(j)
		local eFeature = pPlot:GetFeatureType()

		for i, feature in ipairs(g_tNaturalWonder) do
			if eFeature == feature then
				g_tNaturalWonderX[i] = pPlot:GetX()
				g_tNaturalWonderY[i] = pPlot:GetY()
				g_tNaturalWonderExists[i] = true
			end
		end
	end
end
Events.LoadScreenClose.Add(CheckIfNaturalWonderExists)



-- initializing indestructible building booleans
local bMtPaektuBuilt, bJejuDoBuilt = false, false

function CheckIfBuildingsWereBuilt()
	for _, player in ipairs(Players) do
		-- MT. PAEKTU
		if player:CountNumBuildings(g_tNaturalWonderDummy[26]) == 1 then
			print("INDESTRUCTIBLE_BUILT", "MT_PAEKTU")
    		bMtPaektuBuilt = true
		end
	end
end
Events.LoadScreenClose.Add(CheckIfBuildingsWereBuilt)



function SetDummiesForOwnedNaturalWonders(ePlayer)
	for i, existingFeature in ipairs(g_tNaturalWonderExists) do
		if existingFeature then
			local pPlayer = Players[ePlayer]
			
			if pPlayer:IsMinorCiv() or pPlayer:IsBarbarian() then return end

			local bHasNaturalWonderInRange = pPlayer:CountCityFeatures(g_tNaturalWonder[i]) >= 1
			
			if bHasNaturalWonderInRange then
				g_tNaturalWonderOwner[i] = Map.GetPlot(g_tNaturalWonderX[i], g_tNaturalWonderY[i]):GetOwner()
				
				if g_tNaturalWonderRealBuilding[i] then
					-- placement regular buildings
					-- MT. PAEKTU
					if g_tNaturalWonderDummy[i] == GameInfoTypes["BUILDING_MT_PAEKTU"] and not bMtPaektuBuilt then
						if g_tNaturalWonderOwner[i] == ePlayer then
							local pCity = Map.GetPlot(g_tNaturalWonderX[i], g_tNaturalWonderY[i]):GetWorkingCity()
								
							pCity:SetNumRealBuilding(g_tNaturalWonderDummy[i], 1)
							bMtPaektuBuilt = true
						end
					end
				elseif g_tNaturalWonderLocalBuilding[i] then
					-- placement in local owning city
					local pCity = Map.GetPlot(g_tNaturalWonderX[i], g_tNaturalWonderY[i]):GetWorkingCity()
					
					if g_tNaturalWonderOwner[i] == ePlayer then
						if g_tNaturalWonderDummy[i] then
							pCity:SetNumRealBuilding(g_tNaturalWonderDummy[i], 1)
						end

						if g_tNaturalWonderDummy2[i] then
							pCity:SetNumRealBuilding(g_tNaturalWonderDummy2[i], 1)
						end

						if g_tNaturalWonderDummy3[i] then
							pCity:SetNumRealBuilding(g_tNaturalWonderDummy3[i], 1)
						end

						if g_tNaturalWonderDummyPolicy[i] then
							pPlayer:SetHasPolicy(g_tNaturalWonderDummyPolicy[i], true)
						end
					else
						if g_tNaturalWonderDummy[i] then
							pCity:SetNumRealBuilding(g_tNaturalWonderDummy[i], 0)
						end							

						if g_tNaturalWonderDummy2[i] then
							pCity:SetNumRealBuilding(g_tNaturalWonderDummy2[i], 0)
						end

						if g_tNaturalWonderDummy3[i] then
							pCity:SetNumRealBuilding(g_tNaturalWonderDummy3[i], 0)
						end

						if g_tNaturalWonderDummyPolicy[i] then
							pPlayer:SetHasPolicy(g_tNaturalWonderDummyPolicy[i], false)
						end
					end
				else
					-- placement in capital
					local pCapital = pPlayer:GetCapitalCity()
					
					if g_tNaturalWonderOwner[i] == ePlayer then
						if g_tNaturalWonderDummy[i] then
							pCapital:SetNumRealBuilding(g_tNaturalWonderDummy[i], 1)
						end

						if g_tNaturalWonderDummy2[i] then
							pCapital:SetNumRealBuilding(g_tNaturalWonderDummy2[i], 1)
						end

						if g_tNaturalWonderDummy3[i] then
							pCapital:SetNumRealBuilding(g_tNaturalWonderDummy3[i], 1)
						end

						if g_tNaturalWonderDummyPolicy[i] then
							pPlayer:SetHasPolicy(g_tNaturalWonderDummyPolicy[i], true)
						end
					else
						if g_tNaturalWonderDummy[i] then
							pCapital:SetNumRealBuilding(g_tNaturalWonderDummy[i], 0)
						end							

						if g_tNaturalWonderDummy2[i] then
							pCapital:SetNumRealBuilding(g_tNaturalWonderDummy2[i], 0)
						end

						if g_tNaturalWonderDummy3[i] then
							pCapital:SetNumRealBuilding(g_tNaturalWonderDummy3[i], 0)
						end

						if g_tNaturalWonderDummyPolicy[i] then
							pPlayer:SetHasPolicy(g_tNaturalWonderDummyPolicy[i], false)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(SetDummiesForOwnedNaturalWonders)

function CanWeBuildInBlueHole(ePlayer, eBuilding)
	if eBuilding ~= GameInfoTypes.BUILDING_SCUBA_RESORT 
	and eBuilding ~= GameInfoTypes.BUILDING_BATHYSCAPHE_BAY 
	and eBuilding ~= GameInfoTypes.BUILDING_OCEAN_FACILITY then return true end
	
	local pPlayer = Players[ePlayer]
	
	if pPlayer:CountNumBuildings(g_tNaturalWonderDummy[30]) >= 1 then
		return true
	else
		return false
	end
end
GameEvents.PlayerCanConstruct.Add(CanWeBuildInBlueHole)
--------------------------------------------------------------
--------------------------------------------------------------
print("Loaded UniqueNaturalWondersAbilities.lua from MWfVP");
--------------------------------------------------------------
--------------------------------------------------------------
