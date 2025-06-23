include("IconSupport")
Based2AutomateProduction = {}
TTManager:GetTypeControlTable("Based2AutomateProduction", Based2AutomateProduction)

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "Automate_Production2", ["SortOrder"] = 4})
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(sKey, pInstance)
	if sKey ~= "Automate_Production2" then return end
	local pCity = UI.GetHeadSelectedCity()
	if not(pCity:IsCapital()) then
		pInstance.IconFrame:SetHide(true)
		return
	end
	local iPlayer = pCity:GetOwner()
	if (iPlayer ~= Game.GetActivePlayer()) then
		pInstance.IconFrame:SetHide(true)
		return
	end
	pInstance.IconFrame:SetToolTipType("Based2AutomateProduction")
	Based2AutomateProduction.Heading:SetText("Recall All Governors")
	Based2AutomateProduction.Body:SetText("[ICON_RAZING] Recall all Governors back to the [ICON_CAPITAL] Capital. This will clear the Production Queue of Cities! Be sure to assign something.")
	IconHookup(2, 64, "REALLYBASED_ATLAS", pInstance.IconImage)
	pInstance.IconFrame:RegisterCallback(Mouse.eLClick, function()
		for pSelectedCity in Players[iPlayer]:Cities() do
			if pSelectedCity:IsProductionAutomated() == true and not pSelectedCity:IsPuppet() then
				pSelectedCity:SetProductionAutomated(false)
				pSelectedCity:ClearOrderQueue()
			end
		end
		pInstance.IconFrame:SetHide(true)
	end)
	Based2AutomateProduction.Box:DoAutoSize()
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)