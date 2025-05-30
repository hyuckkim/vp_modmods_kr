--[[
-- NW_CentralStation
-- Author: FramedArchitecture
-- DateCreated: 6/2014
--------------------------------------------------------------------
local smaller = math.min
local round = math.ceil
local bankID = -1
local maxRate = 0
--------------------------------------------------------------------
function OnPlayerDoTurn(playerID)
	if (bankID == -1) then return end

	local player = Players[playerID]
	if not IsTraitPlayer(player) then return end

	if player:CountNumBuildings(bankID) == 1 then
		DoCentralBankInterest(playerID)
	end
end
GameEvents.PlayerDoTurn.Add(OnPlayerDoTurn)
--------------------------------------------------------------------
function DoCentralBankInterest(playerID)
	local rate = 0
	local player = Players[playerID]
	local our_TeamID = player:GetTeam()
	local our_Team = Teams[our_TeamID]
	
	for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local other = Players[i]
		if other and i ~= playerID then
			local their_TeamID = other:GetTeam()
			local their_Team = Teams[their_TeamID]
			if  our_Team:IsAllowsOpenBordersToTeam(their_TeamID) and
				their_Team:IsAllowsOpenBordersToTeam(our_TeamID) then
				rate = rate + 2
			end
		end
	end

	if rate > 0 then
		local gold = player:CalculateGoldRate()
		if gold > 0 then
			player:ChangeGold( round(gold * (smaller(rate, maxRate)/100)) )
		end
	end
end
--------------------------------------------------------------------
function IsTraitPlayer(player)
	return not player:IsBarbarian() and not player:IsMinorCiv() and player:IsAlive()
end
--------------------------------------------------------------------
local bank = GameInfo.Buildings["BUILDING_FA_CENTRAL_BANK"]
if bank then
	bankID = bank.ID
	maxRate = bank.MaxInterestRate
	print("Script loaded...")
end
--------------------------------------------------------------------]]