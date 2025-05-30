include("IconSupport")
BasedAutomateProduction = {}
TTManager:GetTypeControlTable("BasedAutomateProduction", BasedAutomateProduction)

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "Automate_Production", ["SortOrder"] = 3})
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(sKey, pInstance)
	if sKey ~= "Automate_Production" then return end
	local pCity = UI.GetHeadSelectedCity()
	if not(pCity) or (pCity:IsPuppet()) or (pCity:GetOwner() ~= Game.GetActivePlayer()) then
		pInstance.IconFrame:SetHide(true)
		return
	end
	pInstance.IconFrame:SetToolTipType("BasedAutomateProduction")
	if pCity:IsProductionAutomated() == true then
		IconHookup(1, 64, "REALLYBASED_ATLAS", pInstance.IconImage)
		BasedAutomateProduction.Heading:SetText("Fire Governor")
		BasedAutomateProduction.Body:SetText("[ICON_RAZING] Fire the Governor and take control of [ICON_PRODUCTION] Production manually.")
		pInstance.IconFrame:RegisterCallback(Mouse.eLClick, function()
			pCity:SetProductionAutomated(false)
			pCity:ClearOrderQueue()
			pInstance.IconFrame:SetHide(true)
			end)
	else
		IconHookup(0, 64, "REALLYBASED_ATLAS", pInstance.IconImage)
		BasedAutomateProduction.Heading:SetText("Appoint Governor")
		BasedAutomateProduction.Body:SetText("[ICON_INFLUENCE] Appoint a Governor to handle [ICON_PRODUCTION] Production here. They will train Units, construct Buildings, or commit to a particular Process to fit the City's needs.")
		pInstance.IconFrame:RegisterCallback(Mouse.eLClick, function()
			pCity:SetProductionAutomated(true)
			pInstance.IconFrame:SetHide(true)
			end)
	end
	BasedAutomateProduction.Box:DoAutoSize()
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)