--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------

local g_ConvertTextKey  = Locale.ConvertTextKey
local g_GetRandom		= Game.GetRandom
local g_GetRound		= Game.GetRound
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

------------------------------------------------------------------------------------------------------------------------
--MATH UTILS
------------------------------------------------------------------------------------------------------------------------

if Game then
	--Game_IsModActive
	function Game_IsModActive(modID)
		for _, mod in pairs(Modding.GetActivatedMods()) do
			if mod.ID == modID then
				return true
			end
		end
		return false
	end
	
	--Game.IsCBRTesterActive
	function Game.IsCBRTesterActive()
		return Game_IsModActive("2a742231-30bd-4aa3-a513-39cc1e029940")
	end

end


--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
--Game.GetRound
function Game.GetRound(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

--================================================================================================
-- CACHE TABLES
--================================================================================================
--g_DummyPolicies_Table
local g_DummyPolicies_Table = {}
local g_DummyPolicies_Count = 1
for row in DB.Query("SELECT ID FROM Policies WHERE PolicyBranchType IS NULL AND Type NOT IN (SELECT FreePolicy FROM PolicyBranchTypes WHERE FreePolicy IS NOT NULL) AND Type NOT IN  (SELECT FreePolicy FROM PolicyBranchTypes WHERE FreeFinishingPolicy IS NOT NULL);") do 	
	g_DummyPolicies_Table[g_DummyPolicies_Count] = row
	g_DummyPolicies_Count = g_DummyPolicies_Count + 1
end

--g_Policies_Table
local g_Policies_Table = {}
local g_Policies_Count = 1
for row in DB.Query("SELECT * FROM Policies WHERE PolicyBranchType IS NOT NULL;") do 	
	g_Policies_Table[g_Policies_Count] = row
	g_Policies_Count = g_Policies_Count + 1
end

--g_Tenets_Table
local g_Tenets_Table = {}
local g_Tenets_Count = 1
for row in DB.Query("SELECT * FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level > 0;") do 	
	g_Tenets_Table[g_Tenets_Count] = row
	g_Tenets_Count = g_Tenets_Count + 1
end

--g_Religions_Table
local g_Religions_Table = {}
local g_Religions_Count = 1
for row in DB.Query("SELECT ID FROM Religions WHERE ID > 0;") do 	
	g_Religions_Table[g_Religions_Count] = row.ID
	g_Religions_Count = g_Religions_Count + 1
end

--g_Specialists_Table
local g_Specialists_Table = {}
local g_Specialists_Count = 1
for row in DB.Query("SELECT ID FROM Specialists WHERE ID > 0;") do 	
	g_Specialists_Table[g_Specialists_Count] = row.ID
	g_Specialists_Count = g_Specialists_Count + 1
end

--g_Leader_Flavors_Table
local g_Leader_Flavors_Table = {}
local g_Leader_Flavors_Count = 1
for row in DB.Query("SELECT * FROM Leader_Flavors;") do 	
	g_Leader_Flavors_Table[g_Leader_Flavors_Count] = row
	g_Leader_Flavors_Count = g_Leader_Flavors_Count + 1
end

local g_LeaderFlavours_Table = {}
for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
	local otherPlayer = Players[otherPlayerID]
	if otherPlayer:IsAlive() then
		local leaderID = otherPlayer:GetLeaderType()
		local leader = GameInfo.Leaders[leaderID]
		local leaderType = leader.Type
		g_LeaderFlavours_Table[otherPlayerID] = {}
		--g_Leader_Flavors_Table
		local flavorsTable = g_Leader_Flavors_Table
		local numFlavors = #flavorsTable
		for index = 1, numFlavors do
			local row = flavorsTable[index]
			if row.LeaderType == leaderType then
				g_LeaderFlavours_Table[otherPlayerID][row.FlavorType] = row.Flavor
			end
		end
	end
end


local g_DefaultLeaderNames_Table = {}
for otherPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
	local otherPlayer = Players[otherPlayerID]
	if otherPlayer:IsAlive() then
		local leaderID = otherPlayer:GetLeaderType()
		local leader = GameInfo.Leaders[leaderID]
		local leaderDesc = leader.Description
		g_DefaultLeaderNames_Table[otherPlayerID] = leaderDesc
	end
end

--g_Language_en_US_HistoricalPrimeMinisters_Table
local g_Language_en_US_HistoricalPrimeMinisters_Table = {}
local g_Language_en_US_HistoricalPrimeMinisters_Count = 1
for row in DB.Query("SELECT Tag, Text FROM Language_en_US WHERE Tag LIKE '%TITLES%' AND Text LIKE '%Chancellor%'") do 	
	g_Language_en_US_HistoricalPrimeMinisters_Table[g_Language_en_US_HistoricalPrimeMinisters_Count] = row
	g_Language_en_US_HistoricalPrimeMinisters_Count = g_Language_en_US_HistoricalPrimeMinisters_Count + 1
end
for row in DB.Query("SELECT Tag, Text FROM Language_en_US WHERE Tag LIKE '%TITLES%' AND Text LIKE '%Prime Minister%'") do 	
	g_Language_en_US_HistoricalPrimeMinisters_Table[g_Language_en_US_HistoricalPrimeMinisters_Count] = row
	g_Language_en_US_HistoricalPrimeMinisters_Count = g_Language_en_US_HistoricalPrimeMinisters_Count + 1
end

--g_Language_en_US_Plurality_Table
local g_Language_en_US_Plurality_Table = {}
for row in DB.Query("SELECT Tag, Plurality FROM Language_en_US WHERE Plurality = '2'") do 	
	g_Language_en_US_Plurality_Table[row.Tag] = true
end

--g_Language_en_US_Feminine_Table
local g_Language_en_US_Feminine_Table = {}
for row in DB.Query("SELECT Tag, Gender FROM Language_en_US WHERE Gender = 'feminine'") do 	
	g_Language_en_US_Feminine_Table[row.Tag] = true
end

--g_Language_en_US_HistoricalRegents_Table
local g_Language_en_US_HistoricalRegents_Table = {}
local g_Language_en_US_HistoricalRegents_Count = 1
for row in DB.Query("SELECT Tag, Text FROM Language_en_US WHERE Tag LIKE '%TITLES%' AND Text LIKE '%Regent%'") do 	
	g_Language_en_US_HistoricalRegents_Table[g_Language_en_US_HistoricalRegents_Count] = row
	g_Language_en_US_HistoricalRegents_Count = g_Language_en_US_HistoricalRegents_Count + 1
end

------------------------------------------------------------------------------------------------------------------------
--LEADER UTILS
------------------------------------------------------------------------------------------------------------------------
--Player:GetFlavorValue
function Player.GetFlavorValue(player, flavorType)
	return g_LeaderFlavours_Table[player:GetID()][flavorType] or 5
end	

------------------------------------------------------------------------------------------------------------------------
--NOTIFICATION UTILS
------------------------------------------------------------------------------------------------------------------------
--Player:SendWorldEvent
local notificationWorldEventID = NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"]
function Player.SendWorldEvent(player, description)
	print("Sending World Event: ", description)
	local activePlayer = Players[Game.GetActivePlayer()]
	local playerTeam = Teams[player:GetTeam()]
	if (not playerTeam:IsHasMet(Game.GetActiveTeam())) then return end
	activePlayer:AddNotification(notificationWorldEventID, description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end 
-------------------------------------------------------------------------------------------------------------------------
--Player:SendNotification
function Player.SendNotification(player, notificationType, description, descriptionShort, global, data1, data2, unitID, data3, metOnly, includesSerialMessage)
	local notificationID = NotificationTypes[notificationType]
	local teamID = player:GetTeam()
	local data1 = data1 or -1
	local data2 = data2 or -1
	local unitID = unitID or -1
	local data3 = data3 or -1
	if global then
		if (metOnly and Teams[Game.GetActiveTeam()]:IsHasMet(teamID) or (not metOnly)) then
			Players[Game.GetActivePlayer()]:AddNotification(notificationID, description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	else
		if (not player:IsHuman()) then return end
		if (metOnly and Teams[Game.GetActiveTeam()]:IsHasMet(teamID) or (not metOnly)) then
			player:AddNotification(notificationID, description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
--RELIGION UTILS
------------------------------------------------------------------------------------------------------------------------
--Player:GetMainReligion
function Player.GetMainReligion(player, ignorePantheon)
	local mainReligionID = player:GetReligionCreatedByPlayer()
	if Player.GetCurrentStateReligion then
		mainReligionID = player:GetCurrentStateReligion()
	else
		if mainReligionID == -1 then
			local playerCapital = player:GetCapitalCity()
			if playerCapital then
				mainReligionID = playerCapital:GetReligiousMajority()
			end
		end
	end
	if mainReligionID == -1 and (not ignorePantheon) then
		mainReligionID = 0
	end
	return mainReligionID
end

--Player:GetNumTotalFollowers
function Player.GetNumTotalFollowers(player, religionID)
	local numFollowers = 0
	local numNotFollowers = 0
	local numNoneFollowers = 0
	if player:IsAlive() then
		for city in player:Cities() do
			local numPopulation = city:GetPopulation()
			numNoneFollowers = numPopulation
			
			local numThisFollowers = city:GetNumFollowers(religionID)
			numFollowers = numFollowers + numThisFollowers
			numNoneFollowers = numNoneFollowers - numThisFollowers

			--g_Religions_Table
			local religionsTable = g_Religions_Table
			local numReligions = #religionsTable
			for index = 1, numReligions do
				local ID = religionsTable[index]
				if ID ~= religionID then
					local numThatFollowers = city:GetNumFollowers(ID)
					numNotFollowers = numNotFollowers + numThatFollowers
					numNoneFollowers = numNoneFollowers - numThatFollowers
				end
			end
			
			if numNoneFollowers < 0 then numNoneFollowers = 0 end
		end
	end	
	return numFollowers, numNotFollowers, numNoneFollowers
end

------------------------------------------------------------------------------------------------------------------------
--SPECIALIST UTILS
------------------------------------------------------------------------------------------------------------------------
--Player:GetCityHasAnySpecialist
function Player.GetCityHasAnySpecialist(player, city)
	return (player:GetTotalSpecialistCount(nil, city) > 0)
end

--Player:GetTotalSpecialistCount
function Player.GetTotalSpecialistCount(player, specialistID, city)
	local numSpecialist = 0
	if specialistID then
		if city then
			numSpecialist = numSpecialist + city:GetSpecialistCount(specialistID)
		else
			for city in player:Cities() do
				numSpecialist = numSpecialist + city:GetSpecialistCount(specialistID)
			end	
		end	
	else
		if city then
			--g_Specialists_Table
			local specialistsTable = g_Specialists_Table
			local numSpecialists = #specialistsTable
			for index = 1, numSpecialists do
				local ID = specialistsTable[index]
				numSpecialist = numSpecialist + city:GetSpecialistCount(ID)
			end
		else
			for city in player:Cities() do
				--g_Specialists_Table
				local specialistsTable = g_Specialists_Table
				local numSpecialists = #specialistsTable
				for index = 1, numSpecialists do
					local ID = specialistsTable[index]
					numSpecialist = numSpecialist + city:GetSpecialistCount(ID)
				end
			end	
		end	
	end	
	return numSpecialist
end

------------------------------------------------------------------------------------------------------------------------
--TEXT UTILS
------------------------------------------------------------------------------------------------------------------------
--Player:GetDefaultName
function Player.GetDefaultName(player)
	local strDefaultName = g_DefaultLeaderNames_Table[player:GetID()]
	if (not strDefaultName) then
		strDefaultName = GameInfo.Leaders[player:GetLeaderType()].Description
	end
	return strDefaultName
end

--Player:IsCivilizationPlural
function Player.IsCivilizationPlural(player)
	local civID = player:GetCivilizationType()
	local civDesc = GameInfo.Civilizations[civID].Description
	return g_Language_en_US_Plurality_Table[civDesc]
end

--Player:IsLeaderFeminine
function Player.IsLeaderFeminine(player)
	local leaderID = player:GetLeaderType()
	local leaderDesc = GameInfo.Leaders[leaderID].Description
	return g_Language_en_US_Feminine_Table[leaderDesc] or false
end

--Player:IsHistoricalPrimeMinister
function Player.IsHistoricalPrimeMinister(player)
	local leaderID = player:GetLeaderType()
	local leaderTag = GameInfo.Leaders[leaderID].CivilopediaTag
	local leaderTitle = leaderTag .. "_TITLES"
	--g_Language_en_US_HistoricalPrimeMinisters_Table
	local textsTable = g_Language_en_US_HistoricalPrimeMinisters_Table
	local numTexts = #textsTable
	for index = 1, numTexts do
		local row = textsTable[index]
		if row.Tag == (leaderTitle .. "_" .. tostring(1)) 
		or row.Tag == (leaderTitle .. "_" .. tostring(2))
		or row.Tag == (leaderTitle .. "_" .. tostring(3)) then
			return true
		end
	end	
	return false
end

--Player:IsHistoricalRegent
function Player.IsHistoricalRegent(player)
	local leaderID = player:GetLeaderType()
	local leaderTag = GameInfo.Leaders[leaderID].CivilopediaTag
	local leaderTitle = leaderTag .. "_TITLES"
	--g_Language_en_US_HistoricalRegents_Table
	local textsTable = g_Language_en_US_HistoricalRegents_Table
	local numTexts = #textsTable
	for index = 1, numTexts do
		local row = textsTable[index]
		if row.Tag == (leaderTitle .. "_" .. tostring(1)) 
		or row.Tag == (leaderTitle .. "_" .. tostring(2))
		or row.Tag == (leaderTitle .. "_" .. tostring(3)) then
			return true
		end
	end	
	return false
end

--Game:ChangeBaseGameText
function Game.ChangeBaseGameText(tagQuery, newText)
	local tquery = {"UPDATE Language_en_US SET Text = '".. newText .."' WHERE Tag = '" .. tagQuery .. "'"}
	for i, iQuery in pairs(tquery) do
		for result in DB.Query(iQuery) do
		end
	end
	Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
end

--==========================================================================================================================
-- POLICIES UTILS
--==========================================================================================================================
--Player:GetNumPoliciesUnlockedInBranch
function Player.GetNumPoliciesUnlockedInBranch(player, policyBranchType) 
	if (not GameInfoTypes[policyBranchType]) then
		return 0
	end

	local numPoliciesUnlocked = 0
	local policyBranchID = GameInfoTypes[policyBranchType]

	if player:IsPolicyBranchFinished(policyBranchID) then
		numPoliciesUnlocked = numPoliciesUnlocked + 1
	end
	if player:IsPolicyBranchUnlocked(policyBranchID) then
		numPoliciesUnlocked = numPoliciesUnlocked + 1
	end

	--g_Policies_Table
	local policiesTable = g_Policies_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		if (row.PolicyBranchType == policyBranchType) then
			local policyID = row.ID
			if player:HasPolicy(policyID) then
				numPoliciesUnlocked = numPoliciesUnlocked + 1
			end
		end
	end

	return numPoliciesUnlocked
end

--Player:GetNumIdeologicalTenets
function Player.GetNumIdeologicalTenets(player)
	local numTenets = 0
	
	--g_Tenets_Table
	local policiesTable = g_Tenets_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local policyID = row.ID
		if player:HasPolicy(policyID) then
			numTenets = numTenets + 1
		end
	end
 
	return numTenets
end


function Player.GetIdeology(player)
	return player:GetLateGamePolicyTree()
end

--Player:GetNumCityStatePartners
function Player.GetNumCityStatePartners(player) 
	local numFriends = 0
	local numAllies = 0

	for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity()) then
			if otherPlayer:IsFriends(playerID) then
				numFriends = numFriends + 1
			end
			if otherPlayer:IsAllies(playerID) then
				numFriends = numFriends + 1
			end
		end
	end

	return numFriends, numAllies
end