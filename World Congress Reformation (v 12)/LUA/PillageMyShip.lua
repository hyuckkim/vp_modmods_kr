--[[local tResolutionDummyPolicyPairs = { [GameInfoTypes.RESOLUTION_SOMETHING] = { Enacted=GameInfoTypes.POLICY_GMS_ENACTED, Repealed=GameInfoTypes.POLICY_GMS_REPEALED } }

function SetDummyPolicyPairsForOnePlayer(pPlayer, iAddedPolicy, iPlaceholderPolicy, sAddOrRemove)
	if (sAddOrRemove == "Add") then
		if not pPlayer:HasPolicy(iAddedPolicy) then
			if pPlayer:HasPolicy(iPlaceholderPolicy) then
				pPlayer:SetHasPolicy(iPlaceholderPolicy, false)
				pPlayer:SetHasPolicy(iAddedPolicy, true)
			else
				pPlayer:SetNumFreePolicies(1)
				pPlayer:SetNumFreePolicies(0)
				pPlayer:SetHasPolicy(iAddedPolicy, true)
			end
		end
	end
	if (sAddOrRemove == "Remove") then
		if pPlayer:HasPolicy(iAddedPolicy) then
			pPlayer:SetHasPolicy(iAddedPolicy, false)
			pPlayer:SetHasPolicy(iPlaceholderPolicy, true)
		end
	end
end
function SetDummyPolicyPairsForAllMajors(iAddedPolicy, iPlaceholderPolicy, sAddOrRemove)
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer:IsAlive() then
			SetDummyPolicyPairsForOnePlayer(pPlayer, iAddedPolicy, iPlaceholderPolicy, sAddOrRemove)
		end
	end
end

function ResolutionPassed(iResolution, iChoice, bEnact, bPassed)
	if tResolutionDummyPolicyPairs[iResolution] then
		if bEnact and bPassed then
			SetDummyPolicyPairsForAllMajors(tResolutionDummyPolicyPairs[iResolution].Enacted, tResolutionDummyPolicyPairs[iResolution].Repealed, "Add")
		end
		if not bEnact and bPassed then
			SetDummyPolicyPairsForAllMajors(tResolutionDummyPolicyPairs[iResolution].Enacted, tResolutionDummyPolicyPairs[iResolution].Repealed, "Remove")
		end
	end
end
GameEvents.ResolutionResult.Add(ResolutionPassed)

iGeneticSoldierBuilding = GameInfoTypes.BUILDING_GENETIC_SOLDIER_BUILDING
iGeneticSoldeirBuildingRequiredPolicy = tResolutionDummyPolicyPairs[GameInfoTypes.RESOLUTION_SOMETHING].Enacted

function ApprovedGeneticallyModifiedSoldierBuilding(PlayerID, BuildingType)
	if BuildingType == iGeneticSoldierBuilding then
		local pPlayer = Players[PlayerID]
		return (pPlayer:HasPolicy(iGeneticSoldeirBuildingRequiredPolicy))
	end
	return true --default to true for all other buildings
end
GameEvents.CityCanConstruct.Add(ApprovedGeneticallyModifiedSoldierBuilding)]]