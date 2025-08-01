-- Plague_Decisions
-- Author: FramedArchitecture
-- DateCreated: 3/14/2015
--------------------------------------------------------------------
include("Plague_SaveData.lua")
--------------------------------------------------------------------
local gCityHeal = GameDefines["CITY_HIT_POINTS_HEALED_PER_TURN"]
local insert = table.insert
local remove = table.remove
--------------------------------------------------------------------
local Decisions_PlagueCure = {}
	Decisions_PlagueCure.Name = "TXT_KEY_DECISIONS_PLAGUECURE"
	Decisions_PlagueCure.Desc = "TXT_KEY_DECISIONS_PLAGUECURE_DESC"
	Decisions_PlagueCure.CanFunc = (
	function(pPlayer)
	
		local iEra = load(pPlayer, "Decisions_PlagueCure")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_PlagueCure", nil)
			else
				Decisions_PlagueCure.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PLAGUECURE_ENACTED_DESC")
				return false, false, true
			end
		end
		if iCurrentEra < GameInfoTypes.ERA_MEDIEVAL then return false, false end
		if pPlayer:GetNumCities() < 1 then
			return false, false
		end

		if not IsPlagued(pPlayer) then
			return false, false
		end

		local iCost = math.ceil((iCurrentEra + 1) * 250 * iMod)
		Decisions_PlagueCure.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PLAGUECURE_DESC", iCost)
		if (pPlayer:GetGold() >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)

	Decisions_PlagueCure.DoFunc = (
	function(pPlayer)
		local iCurrentEra = pPlayer:GetCurrentEra()
		local iCost = math.ceil((iCurrentEra + 1) * 250 * iMod)
		
		pPlayer:ChangeGold(-iCost)
		ClearPlague(pPlayer)

		save(pPlayer, "Decisions_PlagueCure", pPlayer:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_PlagueCure"] = Decisions_PlagueCure
--------------------------------------------------------------------
function IsPlagued(pPlayer)
	local ownerID = pPlayer:GetID()
	local t = GetPlagueCities()
	for i = 1, #t do
		local v = t[i]
		if (v.turns > -1) then
			local pCity = Map.GetPlot(v.X, v.Y):GetPlotCity()
			if pCity and (pCity:GetOwner() == ownerID) then
				return true
			end
		end
	end
	return false
end
--------------------------------------------------------------------
function ClearPlague(pPlayer)
	local ownerID = pPlayer:GetID()
	local t = GetPlagueCities()
	for i = #t, 1, -1 do
		local v = t[i]
		local pCity = Map.GetPlot(v.X, v.Y):GetPlotCity()
		if pCity and (pCity:GetOwner() == ownerID) then
			pCity:ChangeHealRate(gCityHeal)
			remove(t, i)
		end
	end

	for pCity in pPlayer:Cities() do
		insert(t, { X = pCity:GetX(), Y = pCity:GetY(), turns = -1 })
	end

	for pUnit in pPlayer:Units() do
		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_PLAGUED, false)
	end

	SavePlagueCities(t)
end
--------------------------------------------------------------------