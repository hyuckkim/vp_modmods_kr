-- AdoptIdeologies
-- Author: Hokath
-- DateCreated: 4/12/2024 3:39:17 AM
--------------------------------------------------------------
local iProsperity = GameInfoTypes["POLICY_BRANCH_PROSPERITY"]
local iHarmony = GameInfoTypes["POLICY_BRANCH_HARMONY"]
local iDevotion = GameInfoTypes["POLICY_BRANCH_DEVOTION"]
local ideology_list = {iDevotion, iHarmony, iProsperity}
local ideology_name_list = {"Devotion", "Harmony", "Prosperity"}  -- could query the database but i am lazy

-- this is a jfd creation
-- we will use for deciding if our leader is harmonious...
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

function Player.GetFlavorValue(player, flavorType)
	return g_LeaderFlavours_Table[player:GetID()][flavorType] or 5
end	

-- this holds the logic of which ideology to prefer
-- it is currently very primitive and also RNG
function shouldSwitchProsperity(pPlayer, iPolicyBranch)
	if iPolicyBranch == GameInfoTypes["POLICY_BRANCH_ORDER"] then return 0 end
	-- first define a multiplier that gets bigger the more people follow prosperity
	local multiplier = 1.0
	for iAllPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do 
		local pAllPlayer = Players[iAllPlayer]
		if (pAllPlayer ~= pPlayer) and pAllPlayer:HasIdeology(iProsperity) then 	
			multiplier = multiplier + 0.25	-- 25% more likely
		end
	end
	print("the multiplier is " .. multiplier)
        -- get some important leader flavours
	-- but dont include too much or it dilutes the effect of each
	-- growth and defense are pretty similar for everyone, ignore those
	local fDiplo  = pPlayer:GetFlavorValue("FLAVOR_DIPLOMACY") 
	local fSpace  = pPlayer:GetFlavorValue("FLAVOR_SPACESHIP") 
	local fGPs     = pPlayer:GetFlavorValue("FLAVOR_GREAT_PEOPLE") 
	local fReligion = pPlayer:GetFlavorValue("FLAVOR_RELIGION") 
	local fArch   = pPlayer:GetFlavorValue("FLAVOR_ARCHAEOLOGY") 
	-- combine in a way that makes big numbers more prosperity
	local fRange = fSpace + fGPs + fReligion - fArch - fDiplo
	print("the Prosperity fRange is " .. fRange)
	-- the max is therefore around 30 before the multiplier
	return fRange
end

function shouldSwitchHarmony(pPlayer, iPolicyBranch)
	if iPolicyBranch == GameInfoTypes["POLICY_BRANCH_AUTOCRACY"] then return 0 end
	-- first define a multiplier that gets bigger the more people follow harmony
	local multiplier = 1.0
	for iAllPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do 
		local pAllPlayer = Players[iAllPlayer]
		if (pAllPlayer ~= pPlayer) and pAllPlayer:HasIdeology(iHarmony) then 	
			multiplier = multiplier + 0.25	-- 25% more likely
		end
	end
	print("the multiplier is " .. multiplier)
        -- get some important leader flavours
	-- but dont include too much or it dilutes the effect of each
	-- growth and defense are pretty similar for everyone, ignore those
	local fOffense  = pPlayer:GetFlavorValue("FLAVOR_OFFENSE") 
	local fScience  = pPlayer:GetFlavorValue("FLAVOR_SCIENCE") 
	local fNuke     = pPlayer:GetFlavorValue("FLAVOR_NUKE") 
	local fReligion = pPlayer:GetFlavorValue("FLAVOR_RELIGION") 
	local fWonder   = pPlayer:GetFlavorValue("FLAVOR_WONDER") 
	-- combine in a way that makes big numbers more harmony
	local fRange = fScience - fNuke + fReligion + fWonder - fOffense
	print("the Harmony fRange is " .. fRange)
	return fRange
end

function shouldSwitchDevotion(pPlayer, iPolicyBranch)
	if iPolicyBranch == GameInfoTypes["POLICY_BRANCH_FREEDOM"] then return 0 end
	-- first define a multiplier that gets bigger the more people follow devotion
	local multiplier = 1.0
	for iAllPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do 
		local pAllPlayer = Players[iAllPlayer]
		if (pAllPlayer ~= pPlayer) and pAllPlayer:HasIdeology(iDevotion) then 	
			multiplier = multiplier + 0.25	-- 25% more likely
		end
	end
	print("the multiplier is " .. multiplier)
        -- get some important leader flavours
	-- but dont include too much or it dilutes the effect of each
	-- growth and defense are pretty similar for everyone, ignore those
	local fOffense  = pPlayer:GetFlavorValue("FLAVOR_OFFENSE") 
	local fSpace  = pPlayer:GetFlavorValue("FLAVOR_SPACESHIP") 
	local fCulture  = pPlayer:GetFlavorValue("FLAVOR_CULTURE") 
	local fReligion = pPlayer:GetFlavorValue("FLAVOR_RELIGION") 
	local fDiplo    = pPlayer:GetFlavorValue("FLAVOR_DIPLOMACY") 
	-- combine in a way that makes big numbers more Devotion
	local fRange = fReligion + fDiplo + fOffense - fSpace - fCulture
	print("the Devo fRange is " .. fRange)
	return fRange
end

-- now the function
function AdoptFidelis(iPlayer, iPolicyBranch)
	-- this is just for AI. I think Poland has issues so block them for simplicity.
	-- for some reason this is called for non ideologies? 9 is first ideology hopefully
	local pPlayer = Players[iPlayer];
	if (iPolicyBranch < 9) or pPlayer:IsHuman() or (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_POLAND"]) then return false end
	-- so this unfortunately calls itself. what happens is you get 3 events.
	-- 1 when you adopt, this fires our function
        -- then 1 when you switch off ipolicybranch, we want to ignore this one
        -- then 1 when you switch on iProsperity, this one actually does stuff below here
	print("argument policy branch id is " .. iPolicyBranch)
	-- if this was a revolution, we would want to ignore
        -- sadly this might fire before they choose tenets, so TODO later
	-- note the AI never adopts prosperity themselves (hence this function!)
	local numTenets = pPlayer:GetNumPoliciesPurchasedInBranch(iPolicyBranch)
	if numTenets > 0 then
		print("there are tenets, abort!")
		return false
	end

	-- now work out which modded ideology is preferred
	local DevoRange = shouldSwitchDevotion(pPlayer, iPolicyBranch)
	local HarmRange = shouldSwitchHarmony(pPlayer, iPolicyBranch)
	local ProsRange = shouldSwitchProsperity(pPlayer, iPolicyBranch)
	local fRanges = {DevoRange, HarmRange, ProsRange}  -- same order as ideology_list
	local maxVal = fRanges[1]
	local maxIndex = 1
	-- Iterate through the fRanges list
	for i = 2, #fRanges do
	    if fRanges[i] > maxVal then
        	maxVal = fRanges[i]
	        maxIndex = i
            end
	end
	-- this should be the same value every time on a given term
	-- for the first time around
	if iPolicyBranch ~= ideology_list[maxIndex] then
		-- if they were going for something with an ID bigger than 11, it was not from base VP
		if (iPolicyBranch > 11) then return false end
		-- now work out if the player should switch (we dont care about outcome of second call)
	        if (Game.Rand(30, "Fidelis Choice") > maxVal) then return false end
		print("proceeding")
		-- this apparently only sends an event when it changes, so just 1 call from each
		pPlayer:SetPolicyBranchUnlocked(iPolicyBranch, false)  
		pPlayer:SetPolicyBranchUnlocked(ideology_list[maxIndex], true)
	end
	-- for the third time around
	if iPolicyBranch == ideology_list[maxIndex] then
		print("AdoptFidelis successful")
		pPlayer:SetNumFreeTenets(1)  -- or they'll have extra
		-- notification
		local sText = pPlayer:GetName() .. " has been forced to adopt [COLOR_MAGENTA]" .. ideology_name_list[maxIndex] .."[ENDCOLOR] due to a conspiracy of priests, bankers, activists, and Hokaths Lua code!"
		for iAllPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do 
			local pAllPlayer = Players[iAllPlayer]
			sText = "Although they tried to follow a different path, " .. sText
			if pAllPlayer:IsHuman() then 	
				pAllPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sText, "Ideological Coup!")
			end
		end
	end
end

GameEvents.IdeologyAdopted.Add(AdoptFidelis)

print("AdoptIdeologies has initiated all its functions")
