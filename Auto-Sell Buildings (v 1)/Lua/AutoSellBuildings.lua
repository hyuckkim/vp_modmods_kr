--------------------------------------------------------------------------------------------
-- Auto-Sell Buildings lua script written by zai4z

-- Do NOT copy this code without permission and credits
--------------------------------------------------------------------------------------------

tSellableBuildings = {}

-- Populate the table with buildings that have maintenance
for row in DB.Query("SELECT ID FROM Buildings WHERE GoldMaintenance > 0") do
    tSellableBuildings[row.ID] = true
end

--------------------------------------------------------------------------------------------
-- Check for any sellable buildings in the razing city, delete them and give back gold
--------------------------------------------------------------------------------------------

function HumanCityRazing(iX, iY)
    local pPlot = Map.GetPlot(iX, iY)
    if not pPlot then
        return
    end

    local pCity = pPlot:GetPlotCity()
    if not pCity or not pCity:IsRazing() then
        return
    end

    local pPlayer = Players[pCity:GetOwner()]
    if not pPlayer:IsHuman() then
        return
    end

    local totalrefund = 0
    for buildingID, _ in pairs(tSellableBuildings) do
        if pCity:GetNumRealBuilding(buildingID) > 0 and pCity:IsBuildingSellable(buildingID) then
            local refund = pCity:GetSellBuildingRefund(buildingID)
            totalrefund = totalrefund + refund
            pCity:SetNumRealBuilding(buildingID, 0)
        end
    end

    if totalrefund > 0 then
        pPlayer:ChangeGold(totalrefund)
        Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE")
    end
end
GameEvents.SetPopulation.Add(HumanCityRazing)