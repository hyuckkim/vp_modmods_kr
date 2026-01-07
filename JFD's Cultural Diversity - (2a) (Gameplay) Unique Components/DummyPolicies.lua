-- Dummy Assignment
-- Author: Hokath
-- DateCreated: 07/02/2025 20:51:11 PM

include("JFD_CulDivUtils.lua")

local g_CDDummyPolicy_Table = {}
local g_CDDummyPolicy_Count = 1
for row in DB.Query("SELECT ID, PolicyType FROM CDDummies;") do 	
	g_CDDummyPolicy_Table[g_CDDummyPolicy_Count] = row
	g_CDDummyPolicy_Count = g_CDDummyPolicy_Count + 1
end

local function CD_DummyAssignment(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	-- dont include city states
	if player:IsMinorCiv() then return end

	local plot = Map.GetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if city ~= player:GetCapitalCity() then return end
	
	-- get the id in the JFD table. new ones added at end.
	local cultureID = player:GetCultureType()

	-- im not directly editing JFD's mod atm so
	-- his order must now match our order.
	-- we "forgot" totalitarianism and added new ones
	if cultureID > 3 then  -- make room for patagonia
		cultureID = cultureID + 1
	end
	if cultureID > 21 then  -- make room for celts
		cultureID = cultureID + 1
	end
        if cultureID == 33 then
		cultureID = 22
	elseif cultureID == 34 then
		cultureID = 4
	-- western and west_african are swapped apparently
	-- as if this wasnt silly enough...
	elseif cultureID == 30 then
                cultureID = 30  -- swap cancels change
	elseif cultureID == 31 then
                cultureID = 29  -- comes 2 back
	elseif cultureID == 32 then
                cultureID = 31  -- changes the right amount (-1)
	end
	-- now its aligned with CDDummies, give the policy
	local row = g_CDDummyPolicy_Table[cultureID]
	player:SetHasPolicy(GameInfoTypes[row.PolicyType], 1)
	print("the dummy assignment " .. cultureID .. " is complete for " .. playerID)
end

GameEvents.PlayerCityFounded.Add(CD_DummyAssignment)