-- JFD_Sovereignty_Functions
-- Author: JFD
-- DateCreated: 4/30/2019 8:35:33 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua");
include("JFD_Sovereignty_Utils.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_GetRandom		= Game.GetRandom
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--=======================================================================================================================
-- CACHED TABLES
--=======================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Governments_Table
local g_JFD_Governments_Table = {}
local g_JFD_Governments_Count = 1
for row in DB.Query("SELECT * FROM JFD_Governments;") do 	
	g_JFD_Governments_Table[g_JFD_Governments_Count] = row
	g_JFD_Governments_Count = g_JFD_Governments_Count + 1
end

--g_JFD_Councillors_Table
local g_JFD_Councillors_Table = {}
local g_JFD_Councillors_Count = 1
for row in DB.Query("SELECT * FROM JFD_Councillors;") do 	
	g_JFD_Councillors_Table[g_JFD_Councillors_Count] = row
	g_JFD_Councillors_Count = g_JFD_Councillors_Count + 1
end

--g_JFD_Reform_FreePromotions_Table
local g_JFD_Reform_FreePromotions_Table = {}
local g_JFD_Reform_FreePromotions_Count = 1
for row in DB.Query("SELECT * FROM JFD_Reform_FreePromotions WHERE AddOnPass = 1 OR RemoveOnRevoke = 1;") do 	
	g_JFD_Reform_FreePromotions_Table[g_JFD_Reform_FreePromotions_Count] = row
	g_JFD_Reform_FreePromotions_Count = g_JFD_Reform_FreePromotions_Count + 1
end

--g_Buildings_MustBeCapital_Table
local g_Buildings_MustBeCapital_Table = {}
for row in DB.Query("SELECT ID FROM Buildings WHERE MustBeCapital = 1;") do 	
	g_Buildings_MustBeCapital_Table[row.ID] = true
end

--g_Buildings_RequiresPantheon_Table
local g_Buildings_RequiresPantheon_Table = {}
for row in DB.Query("SELECT ID FROM Buildings WHERE RequiresPantheon = 1;") do 	
	g_Buildings_RequiresPantheon_Table[row.ID] = true
end

--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]

local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]

local unitClassInquisitorID = GameInfoTypes["UNITCLASS_INQUISITOR"]
local unitClassMissionaryID = GameInfoTypes["UNITCLASS_MISSIONARY"]

local governmentChiefdomID = GameInfoTypes["GOVERNMENT_JFD_CHIEFDOM"]
local governmentDictatorshipID = GameInfoTypes["GOVERNMENT_JFD_DICTATORSHIP"]
local governmentRepublicID = GameInfoTypes["GOVERNMENT_JFD_REPUBLIC"]
local governmentPolisID = GameInfoTypes["GOVERNMENT_JFD_POLIS"] 
local governmentTribeID = GameInfoTypes["GOVERNMENT_JFD_TRIBE"]

local defineDefaultFullGovernmentPopThreshold = GameDefines["JFD_SOVEREIGNTY_DEFAULT_FULL_GOVERNMENT_POPULATION_THRESHOLD"]
local defineDefaultLimitedGovernmentPopThreshold = GameDefines["JFD_SOVEREIGNTY_DEFAULT_LIMITED_GOVERNMENT_POPULATION_THRESHOLD"]
local defineDefaultGovernmentCooldownRate = (GameDefines["JFD_SOVEREIGNTY_DEFAULT_GOVERNMENT_COOLDOWN_RATE"]*-1)
local defineDefaultReformCooldownRate = (GameDefines["JFD_SOVEREIGNTY_DEFAULT_REFORM_COOLDOWN_RATE"]*-1)
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================

--JFD_RTP_CityCanConstruct
local function JFD_RTP_CityCanConstruct(playerID, cityID, buildingID)
	local player = Players[playerID]
	local building = GameInfo.Buildings[buildingID]
	local city = player:GetCityByID(cityID)
	
	if g_Buildings_MustBeCapital_Table[buildingID] then
		if (not city:IsCapital()) then
			return false
		end
	end

	if g_Buildings_RequiresPantheon_Table[buildingID] then
		if (not player:HasCreatedPantheon()) then
			return false
		end
	end
	
	return true
end
GameEvents.CityCanConstruct.Add(JFD_RTP_CityCanConstruct)

----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_SequenceGameInitComplete
 function JFD_Sovereignty_SequenceGameInitComplete()
	for playerID = 0, defineMaxMajorCivs - 1 do
		local player = Players[playerID]
		if player:IsAlive() and (not player:IsFoundedFirstCity()) then
			local civ = GameInfo.Civilizations[player:GetCivilizationType()]
			local civDesc = civ.Description
			local civAdj = player:GetCivilizationAdjective(playerID)
			local newText = g_ConvertTextKey("TXT_KEY_JFD_CIVILIZATION_DESC", civAdj)
			Game.ChangeBaseGameText(civDesc, newText)
			player:UpdateLeaderName(governmentTribeID)
			player:UpdateCivilizationStateDescription(governmentTribeID)
		end
	end
end
Events.SequenceGameInitComplete.Add(JFD_Sovereignty_SequenceGameInitComplete)
----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_NotificationAdded
local notificationGovernmentChoiceType = NotificationTypes["NOTIFICATION_JFD_GOVERNMENT_CHOICE"]
 function JFD_Sovereignty_NotificationAdded(notification, notificationType)
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	if notificationType == notificationGovernmentChoiceType then
		if (not activePlayer:CanChangeGovernment()) then
			LuaEvents.UI_ClearNotification("GovernmentChoice")
		end
	end
end
Events.NotificationAdded.Add(JFD_Sovereignty_NotificationAdded)
----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_LoadScreenClose
 function JFD_Sovereignty_LoadScreenClose()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	if activePlayer:CanChangeGovernment() then 
		LuaEvents.JFD_Sovereignty_UI_BlockEndTurnButton(true, activePlayerID)
	end
	LuaEvents.UI_DoUpdateOverviewButtons()
	Events.OpenInfoCorner( InfoCornerID.Civilization );
end
Events.LoadScreenClose.Add(JFD_Sovereignty_LoadScreenClose)
----------------------------------------------------------------------------------------------------------------------------
--UpdateCivilizationStateDescription
local function JFD_Sovereignty_GovernmentEstablished(playerID, governmentID, oldGovernmentID)
	local player = Players[playerID]
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	if (not player:IsAlive()) then return end
	
	player:UpdateLeaderName(governmentID)
	player:UpdateCivilizationStateDescription(governmentID)
end
LuaEvents.JFD_GovernmentEstablished.Add(JFD_Sovereignty_GovernmentEstablished)
----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_PlayerCityFounded
local function JFD_Sovereignty_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	
	local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
	if (not city:IsCapital()) then return end
	
	if player:IsMinorCiv() then 
		player:SetHasGovernment(governmentPolisID, true)
	else
		player:SetHasGovernment(governmentTribeID, true)
	end

	local currentEraID = (player:GetCurrentEra()-1)
	if currentEraID > 0 then
		player:SetNumFreeReforms(currentEraID)
	end
end
GameEvents.PlayerCityFounded.Add(JFD_Sovereignty_PlayerCityFounded)
----------------------------------------------------------------------------------------------------------------------------
--g_Policies_BonusUnitHPPerTurn_Table
local g_Policies_BonusUnitHPPerTurn_Table = {}
local g_Policies_BonusUnitHPPerTurn_Count = 1
for row in DB.Query("SELECT * FROM Policies WHERE BonusUnitHPPerTurn <> 0;") do 	
	g_Policies_BonusUnitHPPerTurn_Table[g_Policies_BonusUnitHPPerTurn_Count] = row
	g_Policies_BonusUnitHPPerTurn_Count = g_Policies_BonusUnitHPPerTurn_Count + 1
end

--g_Policies_BonusInquisitorMoves_Table
local g_Policies_BonusInquisitorMoves_Table = {}
local g_Policies_BonusInquisitorMoves_Count = 1
for row in DB.Query("SELECT * FROM Policies WHERE BonusInquisitorMoves <> 0;") do 	
	g_Policies_BonusInquisitorMoves_Table[g_Policies_BonusInquisitorMoves_Count] = row
	g_Policies_BonusInquisitorMoves_Count = g_Policies_BonusInquisitorMoves_Count + 1
end

--g_Policies_BonusMissMoves_Table
local g_Policies_BonusMissMoves_Table = {}
local g_Policies_BonusMissMoves_Count = 1
for row in DB.Query("SELECT * FROM Policies WHERE BonusMissForeignMoves <> 0 OR BonusMissDomesticMoves <> 0;") do 	
	g_Policies_BonusMissMoves_Table[g_Policies_BonusMissMoves_Count] = row
	g_Policies_BonusMissMoves_Count = g_Policies_BonusMissMoves_Count + 1
end

--g_Policies_RouteMovementBonus_Table
local g_Policies_RouteMovementBonus_Table = {}
local g_Policies_RouteMovementBonus_Count = 1
for row in DB.Query("SELECT * FROM Policies WHERE RouteMovementBonus <> 0;") do 	
	g_Policies_RouteMovementBonus_Table[g_Policies_RouteMovementBonus_Count] = row
	g_Policies_RouteMovementBonus_Count = g_Policies_RouteMovementBonus_Count + 1
end

--JFD_Sovereignty_PlayerDoTurn
local notificationPolicy = NotificationTypes["NOTIFICATION_POLICY"]
function JFD_Sovereignty_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	if (not player:IsAlive()) then return end

	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	--GOVERNMENT
	local hasGovernment = player:IsHasGovernment()
	local hasFullGovernment = player:IsHasFullGovernment()
	local numPopulation = player:GetTotalPopulation()
	if (not hasGovernment) then 
		if numPopulation >= defineDefaultLimitedGovernmentPopThreshold then
			if player:IsHuman() then
				player:InitiateGovernmentChoice()
			else
                player:SetHasGovernment(governmentChiefdomID, true, false)
			end
		end
	elseif (not hasFullGovernment) then
		if numPopulation >= defineDefaultFullGovernmentPopThreshold then
			player:InitiateGovernmentChoice()
		end
	end
	
	if hasGovernment then
		--CHANGING GOVERNMENT
		if player:CanChangeGovernment() and (not player:IsHuman()) then
			local currentGovernmentID = player:GetCurrentGovernment()
			player:InitiateGovernmentChangeConsideration(currentGovernmentID)
		end
	end

	--POLICIES
	--g_Policies_BonusUnitHPPerTurn_Table
	local policiesTable = g_Policies_BonusUnitHPPerTurn_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local policyID = row.ID
		if player:HasPolicy(policyID) then
			for unit in player:Units() do	
				unit:ChangeDamage(-row.BonusUnitHPPerTurn)
			end
		end
	end

	--g_Policies_BonusInquisitorMoves_Table
	local policiesTable = g_Policies_BonusInquisitorMoves_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local policyID = row.ID
		if player:HasPolicy(policyID) then
			for unit in player:Units() do	
				if unit:GetUnitClassType() == unitClassInquisitorID then
					unit:ChangeMoves(row.BonusInquisitorMoves*60)
				end
			end
		end
	end

	--g_Policies_BonusMissMoves_Table
	local policiesTable = g_Policies_BonusMissMoves_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local policyID = row.ID
		if player:HasPolicy(policyID) then
			for unit in player:Units() do	
				if unit:GetUnitClassType() == unitClassMissionaryID then
					local plot = unit:GetPlot()
					if plot and plot:GetOwner() == playerID then
						unit:ChangeMoves(row.BonusMissDomesticMoves*60)
					else
						unit:ChangeMoves(row.BonusMissForeignMoves*60)
					end
				end
			end
		end
	end

	--g_Policies_RouteMovementBonus_Table
	local policiesTable = g_Policies_RouteMovementBonus_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local policyID = row.ID
		if player:HasPolicy(policyID) then
			for unit in player:Units() do	
				local plot = unit:GetPlot()
				if (plot and plot:GetOwner() == playerID) and (not plot:IsCity()) then
					if (plot:IsRoute() and (not plot:IsRoutePillaged())) then
						unit:ChangeMoves(row.RouteMovementBonus*60)
					end
				end
			end
		end
	end

	--SOVEREIGNTY
	if (not player:IsHuman()) then return end
	player:UpdateCurrentSovereignty()

end
GameEvents.PlayerDoTurn.Add(JFD_Sovereignty_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_TeamSetEra
function JFD_Sovereignty_TeamSetEra(teamID, eraID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	if player:IsHuman() then return end
	if eraID == eraModernID then
		if player:IsHasGovernment() then
			local currentGovernmentID = player:GetCurrentGovernment()
			local currentGovernment = GameInfo.JFD_Governments[currentGovernmentID]
			if (not currentGovernment.IsUnique) then
				player:InitiateGovernmentChangeConsideration(currentGovernmentID)
			end
		end
	end
end
GameEvents.TeamSetEra.Add(JFD_Sovereignty_TeamSetEra)
----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_IdeologyAdopted
function JFD_Sovereignty_IdeologyAdopted(playerID, newIdeologyID)
	local player = Players[playerID]
	if player:IsHasGovernment() then

        local currentGovernmentID = player:GetCurrentGovernment()

		--DICTATORSHIP
		if currentGovernmentID == governmentDictatorshipID then
			player:ResetLegislature(governmentDictatorshipID)
		end
        
        --CHANGING GOVERNMENT
		if (not player:IsHuman()) then 
			player:InitiateGovernmentChangeConsideration(currentGovernmentID, false, true)
        else
            local dictatorship = GameInfo.JFD_Governments[governmentDictatorshipID]
            if player:GetTotalPopulation() >= dictatorship.RequiresPopulation then
			    player:InitiateGovernmentChoice()
            end
		end
	end
end
GameEvents.IdeologyAdopted.Add(JFD_Sovereignty_IdeologyAdopted)
----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_IdeologySwitched
function JFD_Sovereignty_IdeologySwitched(playerID, oldIdeologyID, newIdeologyID)
	local player = Players[playerID]
	if player:IsHasGovernment() then
		
        local currentGovernmentID = player:GetCurrentGovernment()

		--DICTATORSHIP
		if currentGovernmentID == governmentDictatorshipID then
			player:ResetLegislature(governmentDictatorshipID)
		end

		if (not player:IsHuman()) then 
			player:InitiateGovernmentChangeConsideration(currentGovernmentID, false, true)
		end
	end
end
GameEvents.IdeologySwitched.Add(JFD_Sovereignty_IdeologySwitched)
----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_ReligionFounded
function JFD_Sovereignty_ReligionFounded(playerID, newIdeologyID)
	local player = Players[playerID]
	if (not player:IsHuman()) then 
		if player:IsHasGovernment() then
			--CHANGING GOVERNMENT
			local currentGovernmentID = player:GetCurrentGovernment()
			local currentGovernment = GameInfo.JFD_Governments[currentGovernmentID]
			if (not currentGovernment.IsUnique) then
				player:InitiateGovernmentChangeConsideration(currentGovernmentID, true)
			end
		end
	end
end
GameEvents.ReligionFounded.Add(JFD_Sovereignty_ReligionFounded)
----------------------------------------------------------------------------------------------------------------------------
--g_Buildings_FoundsGovernment_Table
local g_Buildings_FoundsGovernment_Table = {}
for row in DB.Query("SELECT ID FROM Buildings WHERE FoundsGovernment IS NOT NULL;") do 	
	g_Buildings_FoundsGovernment_Table[row.ID] = true
end

--g_Buildings_NumFreeReforms_Table
local g_Buildings_NumFreeReforms_Table = {}
for row in DB.Query("SELECT ID FROM Buildings WHERE NumFreeReforms > 0;") do 	
	g_Buildings_NumFreeReforms_Table[row.ID] = true
end

--g_Buildings_UnlocksGovernment_Table
local g_Buildings_UnlocksGovernment_Table = {}
for row in DB.Query("SELECT ID FROM Buildings WHERE UnlocksGovernment = 1;") do 	
	g_Buildings_UnlocksGovernment_Table[row.ID] = true
end

--JFD_Sovereignty_CityConstructed
local function JFD_Sovereignty_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	local building = GameInfo.Buildings[buildingID]
	
	--FREE REFORMS
	if g_Buildings_NumFreeReforms_Table[buildingID] then
		player:ChangeNumFreeReforms(building.NumFreeReforms)
	end
	
	--UNLOCKS GOVERNMENT
	if g_Buildings_UnlocksGovernment_Table[buildingID] then
		local currentGovernmentID = player:GetCurrentGovernment()
		player:InitiateGovernmentChoice()
	end

end
GameEvents.CityConstructed.Add(JFD_Sovereignty_CityConstructed)
----------------------------------------------------------------------------------------------------------------------------
--g_Buildings_GovernmentType_Table
local g_Buildings_GovernmentType_Table = {}
for row in DB.Query("SELECT ID, GovernmentType FROM Buildings WHERE GovernmentType IS NOT NULL;") do 
	g_Buildings_GovernmentType_Table[row.ID] = row.GovernmentType
end

--JFD_Sovereignty_PlayerCanConstruct
local function JFD_Sovereignty_PlayerCanConstruct(playerID, buildingID)
	local player = Players[playerID]
	
	--REQUIRES GOVERNMENT
	local reqGovernment = g_Buildings_GovernmentType_Table[buildingID]
	if reqGovernment then
		return (player:GetCurrentGovernment() == GameInfoTypes[reqGovernment])
	end

	return true
end
GameEvents.PlayerCanConstruct.Add(JFD_Sovereignty_PlayerCanConstruct)
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Reform_FreePromotions_AddOnFaithPurchase_Table
local g_JFD_Reform_FreePromotions_AddOnFaithPurchase_Table = {}
local g_JFD_Reform_FreePromotions_AddOnFaithPurchase_Count = 1
for row in DB.Query("SELECT * FROM JFD_Reform_FreePromotions WHERE AddOnFaithPurchase = 1;") do 	
	g_JFD_Reform_FreePromotions_AddOnFaithPurchase_Table[g_JFD_Reform_FreePromotions_AddOnFaithPurchase_Count] = row
	g_JFD_Reform_FreePromotions_AddOnFaithPurchase_Count = g_JFD_Reform_FreePromotions_AddOnFaithPurchase_Count + 1
end

--g_JFD_Reform_FreePromotions_AddOnUnitTrain_Table
local g_JFD_Reform_FreePromotions_AddOnUnitTrain_Table = {}
local g_JFD_Reform_FreePromotions_AddOnUnitTrain_Count = 1
for row in DB.Query("SELECT * FROM JFD_Reform_FreePromotions WHERE AddOnUnitTrain = 1;") do 	
	g_JFD_Reform_FreePromotions_AddOnUnitTrain_Table[g_JFD_Reform_FreePromotions_AddOnUnitTrain_Count] = row
	g_JFD_Reform_FreePromotions_AddOnUnitTrain_Count = g_JFD_Reform_FreePromotions_AddOnUnitTrain_Count + 1
end

--g_Policies_BonusUnitTrainedMoves_Table
local g_Policies_BonusUnitTrainedMoves_Table = {}
local g_Policies_BonusUnitTrainedMoves_Count = 1
for row in DB.Query("SELECT * FROM Policies WHERE BonusUnitTrainedMoves <> 0;") do 	
	g_Policies_BonusUnitTrainedMoves_Table[g_Policies_BonusUnitTrainedMoves_Count] = row
	g_Policies_BonusUnitTrainedMoves_Count = g_Policies_BonusUnitTrainedMoves_Count + 1
end

--JFD_Sovereignty_CityTrained
local function JFD_Sovereignty_CityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	
	if unit:IsCombatUnit() then
		--g_Policies_BonusUnitTrainedMoves_Table
		local policiesTable = g_Policies_BonusUnitTrainedMoves_Table
		local numPolicies = #policiesTable
		for index = 1, numPolicies do
			local row = policiesTable[index]
			local policyID = row.ID
			if player:HasPolicy(policyID) then
				unit:ChangeMoves(row.BonusUnitTrainedMoves*60)
			end
		end
	end
	
	--g_JFD_Reform_FreePromotions_AddOnUnitTrain_Table
	local reformsTable = g_JFD_Reform_FreePromotions_AddOnUnitTrain_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local reformID = GameInfoTypes[row.ReformType]
		if player:HasReform(reformID) then
			local unitClassID = GameInfoTypes[row.UnitClassType]
			if unitClassID and unit:GetUnitClassType() == unitClassID then
				local promotionID = GameInfoTypes[row.PromotionType]
				if (not unit:IsHasPromotion(promotionID)) then
					unit:SetHasPromotion(promotionID, true)
				end
			end
			if (not unitClassID) and unit:IsCombatUnit() then
				local promotionID = GameInfoTypes[row.PromotionType]
				if (not unit:IsHasPromotion(promotionID)) then
					unit:SetHasPromotion(promotionID, true)
				end
			end
		end
	end

	if isFaith then
		--g_JFD_Reform_FreePromotions_AddOnFaithPurchase_Table
		local reformsTable = g_JFD_Reform_FreePromotions_AddOnFaithPurchase_Table
		local numReforms = #reformsTable
		for index = 1, numReforms do
			local row = reformsTable[index]
			local reformID = GameInfoTypes[row.ReformType]
			if player:HasReform(reformID) then
				local unitClassID = GameInfoTypes[row.UnitClassType]
				if unitClassID and unit:GetUnitClassType() == unitClassID then
					local promotionID = GameInfoTypes[row.PromotionType]
					if (not unit:IsHasPromotion(promotionID)) then
						unit:SetHasPromotion(promotionID, true)
					end
				end
				if (not unitClassID) and unit:IsCombatUnit() then
					local promotionID = GameInfoTypes[row.PromotionType]
					if (not unit:IsHasPromotion(promotionID)) then
						unit:SetHasPromotion(promotionID, true)
					end
				end
			end
		end
	end

end
GameEvents.CityTrained.Add(JFD_Sovereignty_CityTrained)
----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_ReformCooldownChanges
function JFD_Sovereignty_ReformCooldownChanges(playerID, cooldown)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	if player:IsBarbarian() then return end
	if (not player:IsAlive()) then return end

	if cooldown ~= 0 then return end

	if player:IsHuman() and player:IsHasGovernment() then 
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_REFORM_PASSABLE")
		player:SendNotification("NOTIFICATION_JFD_GOVERNMENT_REFORM", g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_REFORM_COOLDOWN_ENDS_TEXT"), g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_REFORM_COOLDOWN_ENDS_SHORT_TEXT"), false, -1, -1)
	else
		local numFreeReforms = (player:GetNumFreeReforms()+1)
		for index = 1, numFreeReforms do
			local reformID = Player_GetReformToPass(playerID)
			if reformID then
				--print(Game.GetGameTurn() .. " " .. player:GetName() .. " passed a reform: " .. g_ConvertTextKey(GameInfo.JFD_Reforms[reformID].ShortDescription) .. " (" .. g_ConvertTextKey(GameInfo.JFD_Reforms[reformID].ReformSubBranchDescription) .. ")")
				player:SetHasReform(reformID, (numFreeReforms > 1), true)
			end
		end
	end
	player:UpdateCurrentSovereignty()
end
GameEvents.ReformCooldownChanges.Add(JFD_Sovereignty_ReformCooldownChanges)

----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_GovernmentCooldownChanges
function JFD_Sovereignty_GovernmentCooldownChanges(playerID, cooldown)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	if player:IsBarbarian() then return end
	if (not player:IsAlive()) then return end
	
	if cooldown == 5 then
		if player:IsHuman() and player:IsTurnActive() and player:IsHasGovernment() then
			Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_NEUTRAL");
			player:SendNotification("NOTIFICATION_JFD_GOVERNMENT_LEGISLATURE", g_ConvertTextKey("TXT_KEY_JFD_NOTIFICATION_GOVERNMENT_COOLDOWN_ENDS_IMMINENT_TEXT", cooldown), g_ConvertTextKey("TXT_KEY_JFD_NOTIFICATION_GOVERNMENT_COOLDOWN_ENDS_IMMINENT_SHORT_TEXT"), false, -1, -1)
		end
	elseif cooldown == 0 then
		player:UpdateCurrentSovereignty()
		player:ResetLegislature(player:GetCurrentGovernment())
	end
end
GameEvents.GovernmentCooldownChanges.Add(JFD_Sovereignty_GovernmentCooldownChanges)

----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Government_StateTitles_ReformType_Table
local g_JFD_Government_StateTitles_ReformType_Table = {}
for row in DB.Query("SELECT ReformType FROM JFD_Government_Titles WHERE ReformType IS NOT NULL AND TitleState IS NOT NULL ORDER BY Priority;") do
	g_JFD_Government_StateTitles_ReformType_Table[GameInfoTypes[row.ReformType]] = true
end

--JFD_Sovereignty_ReformPassed
function JFD_Sovereignty_ReformPassed(playerID, reformID)
	local player = Players[playerID]
	local playerCapital = player:GetCapitalCity()
	
	--g_JFD_Reform_FreePromotions_Table
	local reformsTable = g_JFD_Reform_FreePromotions_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		if row.AddOnPass then
			local thisReformID = GameInfoTypes[row.ReformType]
			if thisReformID == reformID then
				local unitClassID = GameInfoTypes[row.UnitClassType]
				for unit in player:Units() do
					if unitClassID and unit:GetUnitClassType() == unitClassID then
						local promotionID = GameInfoTypes[row.PromotionType]
						if (not unit:IsHasPromotion(promotionID)) then
							unit:SetHasPromotion(promotionID, true)
						end
					end
					if (not unitClassID) and unit:IsCombatUnit() then
						local promotionID = GameInfoTypes[row.PromotionType]
						if (not unit:IsHasPromotion(promotionID)) then
							unit:SetHasPromotion(promotionID, true)
						end
					end
				end
			end
		end
	end
end
LuaEvents.JFD_ReformPassed.Add(JFD_Sovereignty_ReformPassed)
----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_ReformRevoked
function JFD_Sovereignty_ReformRevoked(playerID, reformID)
	local player = Players[playerID]
	
	--g_JFD_Reform_FreePromotions_Table
	local reformsTable = g_JFD_Reform_FreePromotions_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		if row.RemoveOnRevoke then
			local thisReformID = GameInfoTypes[row.ReformType]
			if thisReformID == reformID then
				for unit in player:Units() do
					local promotionID = GameInfoTypes[row.PromotionType]
					if unit:IsHasPromotion(promotionID) then
						unit:SetHasPromotion(promotionID, false)
					end
				end
			end
		end
	end

end
LuaEvents.JFD_ReformRevoked.Add(JFD_Sovereignty_ReformRevoked)
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_Reform_FreePromotions_AddOnUnitCreate_Table
local g_JFD_Reform_FreePromotions_AddOnUnitCreate_Table = {}
local g_JFD_Reform_FreePromotions_AddOnUnitCreate_Count = 1
for row in DB.Query("SELECT * FROM JFD_Reform_FreePromotions WHERE AddOnUnitCreate = 1;") do 	
	g_JFD_Reform_FreePromotions_AddOnUnitCreate_Table[g_JFD_Reform_FreePromotions_AddOnUnitCreate_Count] = row
	g_JFD_Reform_FreePromotions_AddOnUnitCreate_Count = g_JFD_Reform_FreePromotions_AddOnUnitCreate_Count + 1
end

--JFD_Sovereignty_UnitCreated
local function JFD_Sovereignty_UnitCreated(playerID, unitID, unitType, plotX, plotY)
	local player = Players[playerID]

    if player:IsHuman() then
        return
    end

	if (not player:IsHasGovernment()) then return end

   	local unit = player:GetUnitByID(unitID)
	local unitClassID = unit:GetUnitClassType()
	if (not unitClassID) then return end
	local unitClassType = GameInfo.UnitClasses[unitClassID].Type
			
	--g_JFD_Reform_FreePromotions_AddOnUnitCreate_Table
	local reformsTable = g_JFD_Reform_FreePromotions_AddOnUnitCreate_Table
	local numReforms = #reformsTable
	for index = 1, numReforms do
		local row = reformsTable[index]
		local reformID = GameInfoTypes[row.ReformType]
		if player:HasReform(reformID) then
			local thisUnitClassID = GameInfoTypes[row.UnitClassType]
			if thisUnitClassID and unitClassID == thisUnitClassID then
				local promotionID = GameInfoTypes[row.PromotionType]
				if (not unit:IsHasPromotion(promotionID)) then
					unit:SetHasPromotion(promotionID, true)
				end
			end
			if (not thisUnitClassID) and unit:IsCombatUnit() then
				local promotionID = GameInfoTypes[row.PromotionType]
				if (not unit:IsHasPromotion(promotionID)) then
					unit:SetHasPromotion(promotionID, true)
				end
			end
		end
	end
	
	if unit:IsGreatPerson() then
		--g_JFD_Councillors_Table
		local councillorsTable = g_JFD_Councillors_Table
		local numCouncillors = #councillorsTable
		for index = 1, numCouncillors do
			local row = councillorsTable[index]
			if (not player:IsHasCouncillor(row.ID)) then
				if row.UnitClassType == unitClassType then
					local flavourType = row.FlavourType
					local flavourVal = player:GetFlavorValue(flavourType)
					if (flavourVal > 5 and flavourVal >= g_GetRandom(1,10)) then
						player:SetHasCouncillor(unit, unitType, row, unit:GetName())
						break
					end					
				end
			end
		end
	end
end
GameEvents.UnitCreated.Add(JFD_Sovereignty_UnitCreated)

----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_PlayerAnarchy
local function JFD_Sovereignty_PlayerAnarchy(playerID, isStart, numTurns)
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	if isStart then return end
	player:SendNotification("NOTIFICATION_JFD_GOVERNMENT", g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_ANARCHY_ENDS_DESC"), g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_ANARCHY_ENDS_SHORT_DESC"), false, -1, -1)
end
GameEvents.PlayerAnarchy.Add(JFD_Sovereignty_PlayerAnarchy)

----------------------------------------------------------------------------------------------------------------------------
--JFD_Sovereignty_GetDiploModifier
local reformPrecedenceBasicID = GameInfoTypes["REFORM_JFD_PRECEDENCE_BASIC"]
local reformPrecedencePowerID = GameInfoTypes["REFORM_JFD_PRECEDENCE_POWER"]
local reformPrecedenceRankID = GameInfoTypes["REFORM_JFD_PRECEDENCE_RANK"]
local diploModBasicBonusID = GameInfoTypes["DIPLOMODIFIER_JFD_PRECEDENCE_BASIC_BONUS"]
local diploModBasicPenaltyID = GameInfoTypes["DIPLOMODIFIER_JFD_PRECEDENCE_BASIC_PENALTY"]
local diploModPowerBonusID = GameInfoTypes["DIPLOMODIFIER_JFD_PRECEDENCE_POWER_BONUS"]
local diploModPowerPenaltyID = GameInfoTypes["DIPLOMODIFIER_JFD_PRECEDENCE_POWER_PENALTY"]
local diploModRankBonusID = GameInfoTypes["DIPLOMODIFIER_JFD_PRECEDENCE_RANK_BONUS"]
local diploModRankPenaltyID = GameInfoTypes["DIPLOMODIFIER_JFD_PRECEDENCE_RANK_PENALTY"]
local function JFD_Sovereignty_GetDiploModifier(diploModifierID, playerID, otherPlayerID)
	local player = Players[playerID]
	local otherPlayer = Players[otherPlayerID]
	local numDiploMod = 0

	if diploModifierID == diploModBasicBonusID then
		if otherPlayer:HasReform(reformPrecedenceBasicID) then
			if player:GetCurrentGovernment() == otherPlayer:GetCurrentGovernment() then
				numDiploMod = -10
			end
		end
	elseif diploModifierID == diploModBasicPenaltyID then
		if otherPlayer:HasReform(reformPrecedenceBasicID) then
			if player:GetCurrentGovernment() ~= otherPlayer:GetCurrentGovernment() then
				numDiploMod = 10
			end
		end
	elseif diploModifierID == diploModPowerBonusID then
		if otherPlayer:HasReform(reformPrecedencePowerID) then
			if otherPlayer:GetNumCities() > player:GetNumCities() then
				numDiploMod = -20
			end
		end
	elseif diploModifierID == diploModPowerPenaltyID then
		if otherPlayer:HasReform(reformPrecedencePowerID) then
			if otherPlayer:GetNumCities() < player:GetNumCities() then
				numDiploMod = 20
			end
		end
	elseif diploModifierID == diploModRankBonusID then
		if otherPlayer:HasReform(reformPrecedenceRankID) then
			if player:IsPlayerHasOpenBorders(otherPlayerID) then
				numDiploMod = -10
			end
		end
	elseif diploModifierID == diploModRankPenaltyID then
		if otherPlayer:HasReform(reformPrecedenceRankID) then
			if (not player:IsPlayerHasOpenBorders(otherPlayerID)) then
				numDiploMod = 10
			end
		end
	end

	return numDiploMod
end
GameEvents.GetDiploModifier.Add(JFD_Sovereignty_GetDiploModifier)
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------

local g_LButtonDown = false
local g_RButtonDown = false
local g_ChoosingCouncillor = nil

function InputHandler(uiMsg, wParam, lParam)

  if g_ChoosingCouncillor then

    if uiMsg == MouseEvents.LButtonDown then
        g_LButtonDown = true
   		local player = Players[Game:GetActivePlayer()]
		local plot = Map.GetPlot(UI.GetMouseOverHex())

        if plot then
            local numUnits = plot:GetNumUnits()           
            if numUnits > 0 then
    			for i = 0, numUnits - 1 do
    				local unit = plot:GetUnit(i)
    				if unit and unit:IsGreatPerson() and (unit:GetOwner() == player:GetID()) then

                        local unitInfo = GameInfo.Units[unit:GetUnitType()];
                        local councillor = player:GetUnitClassCouncillor(unitInfo.Class)

                        if councillor.ID == g_ChoosingCouncillor.ID then
                            UI.SelectUnit(unit)
                            LuaEvents.UI_ShowChooseCouncillor(unit, councillor)
                            return true
                        end
    				end
    			end
            end
		end        
    elseif uiMsg == MouseEvents.LButtonUp then
		g_LButtonDown = false
	elseif uiMsg == MouseEvents.RButtonDown then
		g_RButtonDown = true
	elseif uiMsg == MouseEvents.RButtonUp then
		if g_RButtonDown and g_ChoosingCouncillor then
			g_RButtonDown = false
            OnChooseCouncillor(nil)
		end
	end

  end
end
ContextPtr:SetInputHandler(InputHandler)


function OnChooseCouncillor(councillor)
    g_ChoosingCouncillor = councillor

    if (g_ChoosingCouncillor) then
        local player = Players[Game:GetActivePlayer()]    
        for unit in player:Units() do
           local unitClassType = GameInfo.Units[unit:GetUnitType()].Class;
           if unitClassType == g_ChoosingCouncillor.UnitClassType then
               Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY())), true, Vector4(1.0, 0, 0, 1.0))
           end
        end
    else
        Events.ClearHexHighlights()
    end

end
LuaEvents.ChooseCouncillor.Add(OnChooseCouncillor)


--==========================================================================================================================
--==========================================================================================================================