-- Natural Wonders Abilities
-- Dec 13, 2017: Retrofitted for Vox Populi, Infixo
-- May 11, 2020: Created, adan_eslavo
--------------------------------------------------------------
local g_tNaturalWonder = {
	GameInfoTypes["FEATURE_SALAR_A"],			-- 1
	GameInfoTypes["FEATURE_SALAR_B"],
	GameInfoTypes["FEATURE_EL_DORADO"],
	GameInfoTypes["FEATURE_POTOSI"],
	GameInfoTypes["FEATURE_CRATER"],			-- 5
	GameInfoTypes["FEATURE_MESA"],
	GameInfoTypes["FEATURE_SOLOMONS_MINES"],
	GameInfoTypes["FEATURE_VOLCANO"],
	GameInfoTypes["FEATURE_FUJI"],
	GameInfoTypes["FEATURE_MT_SINAI"],			-- 10
	GameInfoTypes["FEATURE_GEYSER"],
	GameInfoTypes["FEATURE_MT_EVEREST"],
	GameInfoTypes["FEATURE_NEW_REEF_A"],
	GameInfoTypes["FEATURE_NEW_REEF_B"],
	GameInfoTypes["FEATURE_NEW_REEF_C"],		-- 15
	GameInfoTypes["FEATURE_GIBRALTAR"],
	GameInfoTypes["FEATURE_LAKE_VICTORIA"],
	GameInfoTypes["FEATURE_CAUSEWAY_A"],
	GameInfoTypes["FEATURE_CAUSEWAY_B"],
	GameInfoTypes["FEATURE_RETBA"],				-- 20
	GameInfoTypes["FEATURE_LUMI_BAY"],
	GameInfoTypes["FEATURE_DALLOL"],
	GameInfoTypes["FEATURE_EYE_OF_SAHARA_A"],
	GameInfoTypes["FEATURE_EYE_OF_SAHARA_B"],
	GameInfoTypes["FEATURE_EYE_OF_SAHARA_C"],	-- 25
	GameInfoTypes["FEATURE_MT_PAEKTU"],
	GameInfoTypes["FEATURE_MT_KAILASH"],
	GameInfoTypes["FEATURE_KILIMANJARO"],
	GameInfoTypes["FEATURE_ULURU"],
	GameInfoTypes["FEATURE_BLUE_HOLE"],			-- 30
	GameInfoTypes["FEATURE_GALAPAGOS_A"],
	GameInfoTypes["FEATURE_GALAPAGOS_B"],
	GameInfoTypes["FEATURE_HA_LONG_A"],
	GameInfoTypes["FEATURE_HA_LONG_B"],
	GameInfoTypes["FEATURE_ZHANGJIAJIE"],		-- 35
	GameInfoTypes["FEATURE_AURORA_A"],
	GameInfoTypes["FEATURE_AURORA_B"],
	GameInfoTypes["FEATURE_AURORA_C"],
	GameInfoTypes["FEATURE_JEJU_DO"],
	GameInfoTypes["FEATURE_ARCH"],				-- 40
	GameInfoTypes["FEATURE_MARIANA_A"],
	GameInfoTypes["FEATURE_MARIANA_B"],
	GameInfoTypes["FEATURE_MARIANA_C"],
	GameInfoTypes["FEATURE_DANXIA_A"],
	GameInfoTypes["FEATURE_DANXIA_B"]			-- 45
}

local g_tNaturalWonderDummy = {
	GameInfoTypes["BUILDING_DUMMY_SALAR_A"],			-- 1
	GameInfoTypes["BUILDING_DUMMY_SALAR_B"],
	GameInfoTypes["BUILDING_DUMMY_EL_DORADO"],
	GameInfoTypes["BUILDING_DUMMY_POTOSI"],
	GameInfoTypes["BUILDING_DUMMY_CRATER"],				-- 5
	GameInfoTypes["BUILDING_DUMMY_MESA"],
	GameInfoTypes["BUILDING_DUMMY_SOLOMONS_MINES"],
	GameInfoTypes["BUILDING_DUMMY_VOLCANO"],					-- placed in wonder spot
	GameInfoTypes["BUILDING_DUMMY_FUJI_1"],						-- placed in wonder spot
	GameInfoTypes["BUILDING_DUMMY_MT_SINAI"],			-- 10
	GameInfoTypes["BUILDING_DUMMY_GEYSER"],
	GameInfoTypes["BUILDING_DUMMY_MT_EVEREST"],
	GameInfoTypes["BUILDING_DUMMY_NEW_REEF_A"],
	GameInfoTypes["BUILDING_DUMMY_NEW_REEF_B"],
	GameInfoTypes["BUILDING_DUMMY_NEW_REEF_C"],			-- 15
	GameInfoTypes["BUILDING_DUMMY_GIBRALTAR"],
	GameInfoTypes["BUILDING_DUMMY_LAKE_VICTORIA"],
	GameInfoTypes["BUILDING_DUMMY_CAUSEWAY_A"],
	GameInfoTypes["BUILDING_DUMMY_CAUSEWAY_B"],
	GameInfoTypes["BUILDING_DUMMY_RETBA"],				-- 20
	GameInfoTypes["BUILDING_DUMMY_LUMI_BAY"],
	GameInfoTypes["BUILDING_DUMMY_DALLOL"],
	GameInfoTypes["BUILDING_DUMMY_EYE_OF_SAHARA_A"],
	GameInfoTypes["BUILDING_DUMMY_EYE_OF_SAHARA_B"],
	GameInfoTypes["BUILDING_DUMMY_EYE_OF_SAHARA_C"],	-- 25
	GameInfoTypes["BUILDING_MT_PAEKTU"],						-- regular building not dummy, placed in wonder spot
	GameInfoTypes["BUILDING_DUMMY_MT_KAILASH"],
	GameInfoTypes["BUILDING_DUMMY_KILIMANJARO"],
	nil,
	GameInfoTypes["BUILDING_DUMMY_BLUE_HOLE"],			-- 30
	GameInfoTypes["BUILDING_DUMMY_GALAPAGOS_A"], 
	GameInfoTypes["BUILDING_DUMMY_GALAPAGOS_B"],
	GameInfoTypes["BUILDING_DUMMY_HA_LONG_A"],
	GameInfoTypes["BUILDING_DUMMY_HA_LONG_B"],
	nil,												-- 35
	GameInfoTypes["BUILDING_DUMMY_AURORA_A"], 
	GameInfoTypes["BUILDING_DUMMY_AURORA_B"],
	GameInfoTypes["BUILDING_DUMMY_AURORA_C"],
	GameInfoTypes["BUILDING_DUMMY_JEJU_DO"],					-- placed in wonder spot
	GameInfoTypes["BUILDING_DUMMY_ARCH"],				-- 40	-- placed in wonder spot
	GameInfoTypes["BUILDING_DUMMY_MARIANA_A"],
	GameInfoTypes["BUILDING_DUMMY_MARIANA_B"],
	GameInfoTypes["BUILDING_DUMMY_MARIANA_C"],
	nil,
	nil													-- 45
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
	g_tNaturalWonderDummy2[9] = GameInfoTypes["BUILDING_DUMMY_FUJI_2"]

local g_tNaturalWonderDummy3 = {}
	for i = 1, g_iWonderWithDummies do
		g_tNaturalWonderDummy3[i] = false
	end
	g_tNaturalWonderDummy3[9] = GameInfoTypes["BUILDING_DUMMY_FUJI_3"]


-- table for adding policies
local g_tNaturalWonderDummyPolicy = {}
	for i = 1, g_iWonderWithDummies do
		g_tNaturalWonderDummyPolicy[i] = false
	end
	g_tNaturalWonderDummyPolicy[6] = GameInfoTypes["POLICY_DUMMY_MESA"]
	g_tNaturalWonderDummyPolicy[20] = GameInfoTypes["POLICY_DUMMY_RETBA"]
	g_tNaturalWonderDummyPolicy[21] = GameInfoTypes["POLICY_DUMMY_LUMI_BAY"]
	g_tNaturalWonderDummyPolicy[29] = GameInfoTypes["POLICY_DUMMY_ULURU"]
	g_tNaturalWonderDummyPolicy[33] = GameInfoTypes["POLICY_DUMMY_HA_LONG_A"]
	g_tNaturalWonderDummyPolicy[34] = GameInfoTypes["POLICY_DUMMY_HA_LONG_B"]
	g_tNaturalWonderDummyPolicy[35] = GameInfoTypes["POLICY_DUMMY_ZHANGJIAJIE"]
	g_tNaturalWonderDummyPolicy[41] = GameInfoTypes["POLICY_DUMMY_MARIANA_A"]
	g_tNaturalWonderDummyPolicy[42] = GameInfoTypes["POLICY_DUMMY_MARIANA_B"]
	g_tNaturalWonderDummyPolicy[43] = GameInfoTypes["POLICY_DUMMY_MARIANA_C"]
	g_tNaturalWonderDummyPolicy[44] = GameInfoTypes["POLICY_DUMMY_DANXIA_A"]
	g_tNaturalWonderDummyPolicy[45] = GameInfoTypes["POLICY_DUMMY_DANXIA_B"]



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
