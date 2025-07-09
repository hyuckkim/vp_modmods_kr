include("IconSupport")
local iGovernmentCivics = GameInfoTypes.PLAYER_EVENT_GOVERNMENTCIVIC
local iLegalCivics = GameInfoTypes.PLAYER_EVENT_LEGALCIVIC
local iLaborCivics = GameInfoTypes.PLAYER_EVENT_LABORCIVIC
local iEconomyCivics = GameInfoTypes.PLAYER_EVENT_ECONOMYCIVIC
local iReligionCivics = GameInfoTypes.PLAYER_EVENT_RELIGIONCIVIC
local iMilitaryCivics = GameInfoTypes.PLAYER_EVENT_MILITARYCIVIC
local iDepotism = GameInfoTypes.POLICY_CIVIC_DEPOTISM
local iHereditaryRule = GameInfoTypes.POLICY_CIVIC_HEREDITARY_RULE
local iPatronage = GameInfoTypes.POLICY_CIVIC_PATRONAGE
local iRepresentation = GameInfoTypes.POLICY_CIVIC_REPRESENTATION
local iPoliceState = GameInfoTypes.POLICY_CIVIC_POLICE_STATE
local iUniversalSuffrage = GameInfoTypes.POLICY_CIVIC_UNIVERSAL_SUFFRAGE
local iBarbarism = GameInfoTypes.POLICY_CIVIC_BARBARISM
local iCivilLaw = GameInfoTypes.POLICY_CIVIC_CIVIL_LAW
local iVassalage = GameInfoTypes.POLICY_CIVIC_VASSALAGE
local iBureaucracy = GameInfoTypes.POLICY_CIVIC_BUREAUCRACY
local iNationhood = GameInfoTypes.POLICY_CIVIC_NATIONHOOD
local iFreeSpeech = GameInfoTypes.POLICY_CIVIC_FREE_SPEECH
local iTribalism = GameInfoTypes.POLICY_CIVIC_TRIBALISM
local iSlavery = GameInfoTypes.POLICY_CIVIC_SLAVERY
local iSerfdom = GameInfoTypes.POLICY_CIVIC_SERFDOM
local iCasteSystem = GameInfoTypes.POLICY_CIVIC_CASTE_SYSTEM
local iIndustrializedServitude = GameInfoTypes.POLICY_CIVIC_INDUSTRIALIZED_SERVITUDE
local iEmancipation =  GameInfoTypes.POLICY_CIVIC_EMANCIPATION
local iDecentralization = GameInfoTypes.POLICY_CIVIC_DECENTRALIZATION
local iMercantilism = GameInfoTypes.POLICY_CIVIC_MERCANTILISM
local iFreeMarket = GameInfoTypes.POLICY_CIVIC_FREE_MARKET
local iStateProperty = GameInfoTypes.POLICY_CIVIC_STATE_PROPERTY
local iCorporatism = GameInfoTypes.POLICY_CIVIC_CORPORATISM
local iEnvironmentalism = GameInfoTypes.POLICY_CIVIC_ENVIRONMENTALISM
local iPaganism = GameInfoTypes.POLICY_CIVIC_PAGANISM
local iOrganizedReligion = GameInfoTypes.POLICY_CIVIC_ORGANIZED_RELIGION
local iTheocracy = GameInfoTypes.POLICY_CIVIC_THEOCRACY
local iPacifism = GameInfoTypes.POLICY_CIVIC_PACIFISM
local iStateAtheism = GameInfoTypes.POLICY_CIVIC_STATE_ATHEISM
local iFreeReligion = GameInfoTypes.POLICY_CIVIC_FREE_RELIGION
local iConfederation = GameInfoTypes.POLICY_CIVIC_CONFEDERATION
local iConstutionalism = GameInfoTypes.POLICY_CIVIC_CONSTIUTIONALISM
local iMechanization = GameInfoTypes.POLICY_CIVIC_MECHANIZATION
local iIngeniusCraft = GameInfoTypes.POLICY_CIVIC_INGENIUSCRAFT
local iAncestorWorship = GameInfoTypes.POLICY_CIVIC_ANCESTOR_WORSHIP
local g_SortTable

function OnShowHide(bHide, bInit)
	if (not bHide) then
    UpdateCivicList()
	end	
end
ContextPtr:SetShowHideHandler(OnShowHide)

function OnClosingOK()
  ContextPtr:SetHide(true)
end
Controls.OK:RegisterCallback(Mouse.eLClick, OnClosingOK)

function OnGovernment()
	local pPlayer = Players[Game.GetActivePlayer()]
	if pPlayer:IsHuman() then
		pPlayer:DoStartEvent(iGovernmentCivics)
	end
end
function OnGovernmentHover()
	local pPlayer = Players[Game.GetActivePlayer()]
	local Civic1 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	local Civic2 = "[COLOR_NEGATIVE_TEXT]Requires Military Strategy[ENDCOLOR]"
	local Civic3 = "[COLOR_NEGATIVE_TEXT]Requires Writing[ENDCOLOR]"
	local Civic4 = "[COLOR_NEGATIVE_TEXT]Requires Education[ENDCOLOR]"
	local Civic5 = "[COLOR_NEGATIVE_TEXT]Requires Printing Press[ENDCOLOR]"
	local Civic6 = "[COLOR_NEGATIVE_TEXT]Requires Rifling[ENDCOLOR]"
	local Civic7 = "[COLOR_NEGATIVE_TEXT]Requires Atomic Theory[ENDCOLOR]"
	if pPlayer:GetCurrentEra() > 2 then
		Civic1 = "[COLOR_NEGATIVE_TEXT]Obsoleted[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ARCHERY)) then
		Civic2 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_WRITING)) then
		Civic3 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_EDUCATION)) then
		Civic4 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_PRINTING_PRESS)) then
		Civic5 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_RIFLING)) then
		Civic6 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ATOMIC_THEORY)) then
		Civic7 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if pPlayer:HasPolicy(iDepotism) then
		Civic1 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iHereditaryRule) then
		Civic2 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iPatronage) then
		Civic4 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iRepresentation) then
		Civic5 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iPoliceState) then
		Civic6 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iUniversalSuffrage) then
		Civic7 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iConfederation) then
		Civic3 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	end
	Controls.GOVERNMENT:LocalizeAndSetToolTip("TXT_KEY_TEST_GOVERNMENT_BUTTON_OK_TT", Civic1, Civic2, Civic3, Civic4, Civic5, Civic6, Civic7)
end
Controls.GOVERNMENT:RegisterCallback(Mouse.eLClick, OnGovernment)
Controls.GOVERNMENT:RegisterCallback(Mouse.eMouseEnter, OnGovernmentHover)

function OnLegal()
	local pPlayer = Players[Game.GetActivePlayer()]
	if pPlayer:IsHuman() then
		pPlayer:DoStartEvent(iLegalCivics)
	end
end
function OnLegalHover()
	local pPlayer = Players[Game.GetActivePlayer()]
	local Civic1 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	local Civic2 = "[COLOR_NEGATIVE_TEXT]Requires Mathematics[ENDCOLOR]"
	local Civic3 = "[COLOR_NEGATIVE_TEXT]Requires Chivalry[ENDCOLOR]"
	local Civic4 = "[COLOR_NEGATIVE_TEXT]Requires Physics[ENDCOLOR]"
	local Civic5 = "[COLOR_NEGATIVE_TEXT]Requires Military Science[ENDCOLOR]"
	local Civic6 = "[COLOR_NEGATIVE_TEXT]Requires Radio[ENDCOLOR]"
	local Civic7 = "[COLOR_NEGATIVE_TEXT]Requires Telecommunications[ENDCOLOR]"
	if pPlayer:GetCurrentEra() > 2 then
		Civic1 = "[COLOR_NEGATIVE_TEXT]Obsoleted[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MATHEMATICS)) then
		Civic2 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CHIVALRY)) then
		Civic3 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_PHYSICS)) then
		Civic4 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MILITARY_SCIENCE)) then
		Civic5 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_RADIO)) then
		Civic6 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_TELECOM)) then
		Civic7 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if pPlayer:HasPolicy(iBarbarism) then
		Civic1 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iCivilLaw) then
		Civic2 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iVassalage) then
		Civic3 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iBureaucracy) then
		Civic4 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iNationhood) then
		Civic5 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iFreeSpeech) then
		Civic6 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iConstutionalism) then
		Civic7 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	end
	Controls.LEGAL:LocalizeAndSetToolTip("TXT_KEY_TEST_LEGAL_BUTTON_OK_TT", Civic1, Civic2, Civic3, Civic4, Civic5, Civic6, Civic7)
end
Controls.LEGAL:RegisterCallback(Mouse.eLClick, OnLegal)
Controls.LEGAL:RegisterCallback(Mouse.eMouseEnter, OnLegalHover)

function OnLabor()
	local pPlayer = Players[Game.GetActivePlayer()]
	if pPlayer:IsHuman() then
		pPlayer:DoStartEvent(iLaborCivics)
	end
end
function OnLaborHover()
	local pPlayer = Players[Game.GetActivePlayer()]
	local Civic1 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	local Civic2 = "[COLOR_NEGATIVE_TEXT]Requires Bronze Working[ENDCOLOR]"
	local Civic3 = "[COLOR_NEGATIVE_TEXT]Requires Civil Service[ENDCOLOR]"
	local Civic4 = "[COLOR_NEGATIVE_TEXT]Requires Guilds[ENDCOLOR]"
	local Civic5 = "[COLOR_NEGATIVE_TEXT]Requires Industrialization[ENDCOLOR]"
	local Civic6 = "[COLOR_NEGATIVE_TEXT]Requires Electricity[ENDCOLOR]"
	local Civic7 = "[COLOR_NEGATIVE_TEXT]Requires Globalization[ENDCOLOR]"
	if pPlayer:GetCurrentEra() > 2 then
		Civic1 = "[COLOR_NEGATIVE_TEXT]Obsoleted[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_BRONZE_WORKING)) then
		Civic2 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CIVIL_SERVICE)) then
		Civic3 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GUILDS)) then
		Civic4 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_INDUSTRIALIZATION)) then
		Civic5 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GLOBALIZATION)) then
		Civic7 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ELECTRICITY)) then
		Civic6 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if pPlayer:HasPolicy(iTribalism) then
		Civic1 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iSlavery) then
		Civic2 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iSerfdom) then
		Civic3 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iCasteSystem) then
		Civic4 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iIndustrializedServitude) then
		Civic5 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iEmancipation) then
		Civic7 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iMechanization) then
		Civic6 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	end
	Controls.LABOR:LocalizeAndSetToolTip("TXT_KEY_TEST_LABOR_BUTTON_OK_TT", Civic1, Civic2, Civic3, Civic4, Civic5, Civic6, Civic7)
end
Controls.LABOR:RegisterCallback(Mouse.eLClick, OnLabor)
Controls.LABOR:RegisterCallback(Mouse.eMouseEnter, OnLaborHover)

function OnEconomy()
	local pPlayer = Players[Game.GetActivePlayer()]
	if pPlayer:IsHuman() then
		pPlayer:DoStartEvent(iEconomyCivics)
	end
end
function OnEconomyHover()
	local pPlayer = Players[Game.GetActivePlayer()]
	local Civic1 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	local Civic2 = "[COLOR_NEGATIVE_TEXT]Requires Trade[ENDCOLOR]"
	local Civic3 = "[COLOR_NEGATIVE_TEXT]Requires Currency[ENDCOLOR]"
	local Civic4 = "[COLOR_NEGATIVE_TEXT]Requires Economics[ENDCOLOR]"
	local Civic5 = "[COLOR_NEGATIVE_TEXT]Requires Corporations[ENDCOLOR]"
	local Civic6 = "[COLOR_NEGATIVE_TEXT]Requires Corporations[ENDCOLOR]"
	local Civic7 = "[COLOR_NEGATIVE_TEXT]Requires Alternative Energy[ENDCOLOR]"
	if pPlayer:GetCurrentEra() > 2 then
		Civic1 = "[COLOR_NEGATIVE_TEXT]Obsoleted[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_HORSEBACK_RIDING)) then
		Civic2 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CURRENCY)) then
		Civic3 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ECONOMICS)) then
		Civic4 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CORPORATIONS)) then
		Civic5 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CORPORATIONS)) then
		Civic6 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ECOLOGY)) then
		Civic7 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if pPlayer:HasPolicy(iDecentralization) then
		Civic1 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iIngeniusCraft) then
		Civic2 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iMercantilism) then
		Civic3 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iFreeMarket) then
		Civic4 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iStateProperty) then
		Civic5 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iCorporatism) then
		Civic6 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iEnvironmentalism) then
		Civic7 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	end
	Controls.ECONOMY:LocalizeAndSetToolTip("TXT_KEY_TEST_ECONOMY_BUTTON_OK_TT", Civic1, Civic2, Civic3, Civic4, Civic5, Civic6, Civic7)
end
Controls.ECONOMY:RegisterCallback(Mouse.eLClick, OnEconomy)
Controls.ECONOMY:RegisterCallback(Mouse.eMouseEnter, OnEconomyHover)

function OnReligion()
	local pPlayer = Players[Game.GetActivePlayer()]
	if pPlayer:IsHuman() then
		pPlayer:DoStartEvent(iReligionCivics)
	end
end
function OnReligionHover()
	local pPlayer = Players[Game.GetActivePlayer()]
	local Civic1 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	local Civic2 = "[COLOR_NEGATIVE_TEXT]Requires Calendar[ENDCOLOR]"
	local Civic3 = "[COLOR_NEGATIVE_TEXT]Requires Philosophy[ENDCOLOR]"
	local Civic4 = "[COLOR_NEGATIVE_TEXT]Requires Theology[ENDCOLOR]"
	local Civic5 = "[COLOR_NEGATIVE_TEXT]Requires Biology[ENDCOLOR]"
	local Civic6 = "[COLOR_NEGATIVE_TEXT]Requires Flight[ENDCOLOR]"
	local Civic7 = "[COLOR_NEGATIVE_TEXT]Requires Penicilin[ENDCOLOR]"
	if pPlayer:GetCurrentEra() > 2 then
		Civic1 = "[COLOR_NEGATIVE_TEXT]Obsoleted[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CALENDAR)) then
		Civic2 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_PHILOSOPHY)) then
		Civic3 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_THEOLOGY)) then
		Civic4 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_BIOLOGY)) then
		Civic5 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_FLIGHT)) then
		Civic6 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_PENICILIN)) then
		Civic7 = "[COLOR_POSITIVE_TEXT]Available[ENDCOLOR]"
	end
	if pPlayer:HasPolicy(iPaganism) then
		Civic1 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iAncestorWorship) then
		Civic2 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iOrganizedReligion) then
		Civic3 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iTheocracy) then
		Civic4 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iPacifism) then
		Civic5 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iStateAtheism) then
		Civic6 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iFreeReligion) then
		Civic7 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]Enacted[ENDCOLOR]"
	end
	Controls.RELIGION:LocalizeAndSetToolTip("TXT_KEY_TEST_RELIGION_BUTTON_OK_TT", Civic1, Civic2, Civic3, Civic4, Civic5, Civic6, Civic7)
end
Controls.RELIGION:RegisterCallback(Mouse.eLClick, OnReligion)
Controls.RELIGION:RegisterCallback(Mouse.eMouseEnter, OnReligionHover)

function SortByName(a, b)
  local sNameA = g_SortTable[tostring(a)].Name
  local sNameB = g_SortTable[tostring(b)].Name
	return sNameA < sNameB
end

function GovernmentLooker(pPlayer)
	if pPlayer:HasPolicy(iDepotism) then
		return "Despotism"
	elseif pPlayer:HasPolicy(iHereditaryRule) then
		return "Hereditary Rule"
	elseif pPlayer:HasPolicy(iPatronage) then
		return "Patronage"
	elseif pPlayer:HasPolicy(iRepresentation) then
		return "Representation"
	elseif pPlayer:HasPolicy(iPoliceState) then
		return "Totalitarianism"
	elseif pPlayer:HasPolicy(iUniversalSuffrage) then
		return "National Suffrage"
	elseif pPlayer:HasPolicy(iConfederation) then
		return "Confederation"
	else 
		return "No government???"
	end
end

function LegalLooker(pPlayer)
	if pPlayer:HasPolicy(iBarbarism) then
		return "Anarchism"
	elseif pPlayer:HasPolicy(iCivilLaw) then
		return "Codified Law"
	elseif pPlayer:HasPolicy(iVassalage) then
		return "Feudalism"
	elseif pPlayer:HasPolicy(iBureaucracy) then
		return "Bureaucracy"
	elseif pPlayer:HasPolicy(iNationhood) then
		return "Nationhood"
	elseif pPlayer:HasPolicy(iFreeSpeech) then
		return "Free Speech"
	elseif pPlayer:HasPolicy(iConstutionalism) then
		return "Constutionalism"
	else
		return "No legal system???"
	end
end

function LaborLooker(pPlayer)
	if pPlayer:HasPolicy(iTribalism) then
		return "Tribalism"
	elseif pPlayer:HasPolicy(iSlavery) then
		return "Slavery"
	elseif pPlayer:HasPolicy(iSerfdom) then
		return "Manorialism"
	elseif pPlayer:HasPolicy(iCasteSystem) then
		return "Caste System"
	elseif pPlayer:HasPolicy(iIndustrializedServitude) then
		return "Industrialized Servitude"
	elseif pPlayer:HasPolicy(iEmancipation) then
		return "Emancipation"
	elseif pPlayer:HasPolicy(iMechanization) then
		return "Unionism"
	else
		return "No labor???"
	end
end

function EconomyLooker(pPlayer)
	if pPlayer:HasPolicy(iDecentralization) then
		return "Bartering"
	elseif pPlayer:HasPolicy(iMercantilism) then
		return "Commercialism"
	elseif pPlayer:HasPolicy(iFreeMarket) then
		return "Free Market"
	elseif pPlayer:HasPolicy(iStateProperty) then
		return "State Property"
	elseif pPlayer:HasPolicy(iCorporatism) then
		return "Corporatism"
	elseif pPlayer:HasPolicy(iEnvironmentalism) then
		return "Environmentalism"
	elseif pPlayer:HasPolicy(iIngeniusCraft) then
		return "Decentralization"
	else
		return "No economy???"
	end
end

function ReligionLooker(pPlayer)
	if pPlayer:HasPolicy(iPaganism) then
		return "Paganism"
	elseif pPlayer:HasPolicy(iOrganizedReligion) then
		return "Organized Faith"
	elseif pPlayer:HasPolicy(iTheocracy) then
		return "Theocracy"
	elseif pPlayer:HasPolicy(iPacifism) then
		return "Pacifism"
	elseif pPlayer:HasPolicy(iStateAtheism) then
		return "Celebrity Worship"
	elseif pPlayer:HasPolicy(iFreeReligion) then
		return "Free Religion"
	elseif pPlayer:HasPolicy(iAncestorWorship) then
		return "Ancestor Veneration"
	else
		return "No religion???"
	end
end

function OnCivicSelected(playerID)
	local pPlayer = Players[playerID]
	local pActivePlayer = Players[Game.GetActivePlayer()]
	SetCivicDetails(pPlayer, Controls)
	local GovernmentName = GovernmentLooker(pPlayer)
	local LegalName = LegalLooker(pPlayer)
	local LaborName = LaborLooker(pPlayer)
	local EconomyName = EconomyLooker(pPlayer)
	local ReligionName = ReligionLooker(pPlayer)
	local GovernmentMaintain = 0 
	local LegalMaintain = 0
	local LaborMaintain = 0
	local EconomyMaintain = 0
	local ReligionMaintain = 0
	if GovernmentName == "Despotism" or GovernmentName == "Hereditary Rule" or GovernmentName == "Confederation" then GovernmentMaintain = pPlayer:GetBaseBuildingMaintenance()*0.1
	elseif GovernmentName == "Patronage" or GovernmentName == "Representation" then GovernmentMaintain = pPlayer:GetBaseBuildingMaintenance()*0.15
	elseif GovernmentName == "Totalitarianism" or GovernmentName == "National Suffrage" then GovernmentMaintain = pPlayer:GetBaseBuildingMaintenance()*0.2 end
	if LegalName == "Anarchism" or LegalName == "Codified Law" then LegalMaintain = pPlayer:GetBaseBuildingMaintenance()*0.09
	elseif LegalName == "Free Speech" then LegalMaintain = pPlayer:GetBaseBuildingMaintenance()*0.14
	elseif LegalName == "Feudalism" or LegalName == "Bureaucracy" or LegalName == "Constutionalism" then LegalMaintain = pPlayer:GetBaseBuildingMaintenance()*0.19 end
	if LaborName == "Tribalism" or LaborName == "Manorialism" or LaborName == "Emancipation" then LaborMaintain = pPlayer:GetBaseBuildingMaintenance()*0.08
	elseif LaborName == "Slavery" or LaborName == "Caste System" then LaborMaintain = pPlayer:GetBaseBuildingMaintenance()*0.13
	elseif LaborName == "Industrialized Servitude" or LaborName == "Unionism" then LaborMaintain = pPlayer:GetBaseBuildingMaintenance()*0.18 end
	if EconomyName == "Decentralization" or EconomyName == "Bartering" then EconomyMaintain = pPlayer:GetBaseBuildingMaintenance()*0.07
	elseif EconomyName == "Commercialism" or EconomyName == "State Property" or EconomyName == "Free Market" then EconomyMaintain = pPlayer:GetBaseBuildingMaintenance()*0.12
	elseif EconomyName == "Corporatism" or EconomyName == "Environmentalism" then EconomyMaintain = pPlayer:GetBaseBuildingMaintenance()*0.17 end
	if ReligionName == "Paganism" or ReligionName == "Ancestor Veneration" then ReligionMaintain = pPlayer:GetBaseBuildingMaintenance()*0.06
	elseif ReligionName == "Theocracy" or ReligionName == "Celebrity Worship" or ReligionName == "Free Religion" then ReligionMaintain = pPlayer:GetBaseBuildingMaintenance()*0.11
	elseif ReligionName == "Organized Faith" then ReligionMaintain = pPlayer:GetBaseBuildingMaintenance()*0.16 end
	if (pActivePlayer == pPlayer) then
		local sGold = "We're financially robust."
		local sHappiness = "There seems to be no discontent with our people for now."
		Controls.GovernmentName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", GovernmentName, GovernmentMaintain)
		Controls.LegalName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", LegalName, LegalMaintain)
		Controls.LaborName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", LaborName, LaborMaintain)
		Controls.EconomyName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", EconomyName, EconomyMaintain)
		Controls.ReligionName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", ReligionName, ReligionMaintain)
		if pActivePlayer:CalculateGoldRate() < 0 then
			sGold = "Might I suggest we switch to a civic that is cheaper to maintain? Our economy isn't doing so well."
		end
		if pActivePlayer:IsEmpireUnhappy() or pActivePlayer:IsEmpireSuperUnhappy() then
			sHappiness = "Perhaps, we can look into the source of our people's discontent and adjust our civics accordingly?"
		end
		Controls.HerSetting:LocalizeAndSetToolTip("TXT_KEY_IS_THERE_SOMETHING_YOU_NEED", pActivePlayer:GetNameKey(), sGold, sHappiness)
		Controls.TotalName:LocalizeAndSetText("TXT_KEY_TEST_BASED_TOTAL", GovernmentMaintain+LegalMaintain+LaborMaintain+EconomyMaintain+ReligionMaintain)
	elseif ((Teams[pPlayer:GetTeam()]:IsVassal(pActivePlayer:GetTeam()))) then
		Controls.GovernmentName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", GovernmentName, GovernmentMaintain)
		Controls.LegalName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", LegalName, LegalMaintain)
		Controls.LaborName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", LaborName, LaborMaintain)
		Controls.EconomyName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", EconomyName, EconomyMaintain)
		Controls.ReligionName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", ReligionName, ReligionMaintain)
		Controls.HerSetting:LocalizeAndSetToolTip("TXT_KEY_IS_THERE_SOMETHING_YOU_NEED1", pActivePlayer:GetNameKey())
		Controls.TotalName:LocalizeAndSetText("TXT_KEY_TEST_BASED_TOTAL", GovernmentMaintain+LegalMaintain+LaborMaintain+EconomyMaintain+ReligionMaintain)
	elseif (pActivePlayer:IsDoF(playerID)) or (pActivePlayer:IsMyDiplomatVisitingThem(playerID)) then
		Controls.GovernmentName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", GovernmentName, GovernmentMaintain)
		Controls.LegalName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", LegalName, LegalMaintain)
		Controls.LaborName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", LaborName, LaborMaintain)
		Controls.EconomyName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", EconomyName, EconomyMaintain)
		Controls.ReligionName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", ReligionName, ReligionMaintain)
		Controls.HerSetting:LocalizeAndSetToolTip("TXT_KEY_IS_THERE_SOMETHING_YOU_NEED2", pActivePlayer:GetNameKey())
		Controls.TotalName:LocalizeAndSetText("TXT_KEY_TEST_BASED_TOTAL", GovernmentMaintain+LegalMaintain+LaborMaintain+EconomyMaintain+ReligionMaintain)
	elseif (Teams[pActivePlayer:GetTeam()]:HasEmbassyAtTeam(pPlayer:GetTeam())) then
		Controls.GovernmentName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", GovernmentName, "?")
		Controls.LegalName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", LegalName, "?")
		Controls.LaborName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", LaborName, "?")
		Controls.EconomyName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", EconomyName, "?")
		Controls.ReligionName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", ReligionName, "?")
		Controls.HerSetting:LocalizeAndSetToolTip("TXT_KEY_IS_THERE_SOMETHING_YOU_NEED3", pActivePlayer:GetNameKey())
		Controls.TotalName:LocalizeAndSetText("TXT_KEY_TEST_BASED_TOTAL", "?")
	else
		Controls.GovernmentName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", "?", "?")
		Controls.LegalName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", "?", "?")
		Controls.LaborName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", "?", "?")
		Controls.EconomyName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", "?", "?")
		Controls.ReligionName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", "?", "?")
		Controls.HerSetting:LocalizeAndSetToolTip("TXT_KEY_IS_THERE_SOMETHING_YOU_NEED4")
		Controls.TotalName:LocalizeAndSetText("TXT_KEY_TEST_BASED_TOTAL", "?")
	end
end

function SetCivicDetails(pPlayer, entry)
  CivIconHookup(pPlayer:GetID(), 32, entry.CivIcon, entry.CivIconBG, entry.CivIconShadow, false, true, entry.CivIconHighlight);
  entry.CivicName:SetText(pPlayer:GetName())
  local _, CivicColour = pPlayer:GetPlayerColors();
  entry.CivicName:SetColor(CivicColour, 0)
end

function UpdateCivicList()
	local iTeam = Game.GetActiveTeam()
	Controls.CivicMenu:ClearEntries()
	g_SortTable = {}
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local pPlayer = Players[playerID]
		if (pPlayer:IsAlive() and Teams[pPlayer:GetTeam()]:IsHasMet(iTeam)) then
			local sPlayerName = pPlayer:GetName()
			local entry = {}
			Controls.CivicMenu:BuildEntry("InstanceOne", entry)
			g_SortTable[tostring(entry.Button)] = {Name=sPlayerName}
			entry.Button:SetVoid1(playerID)
			SetCivicDetails(pPlayer, entry)
		end
	end
	Controls.CivicMenuStack:SortChildren(SortByName)
	Controls.CivicName:LocalizeAndSetText("TXT_KEY_TEST_MENU_CIVIC_CHOOSE")
	Controls.CivicName:SetColorByName("Beige_Black_Alpha")
	Controls.CivicMenu:RegisterSelectionCallback(OnCivicSelected)
	Controls.CivicMenu:CalculateInternals()
	Controls.CivicMenuGrid:SetSizeY(230)
	Controls.CivicMenuPanel:SetOffsetVal(4,2)
end

function TrueRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

function OnOpeningCivic()
	ContextPtr:SetHide(false)
	OnCivicSelected(Game.GetActivePlayer())
  	--Controls.GovernmentName:LocalizeAndSetText("TXT_KEY_TEST_GOVERNMENT_BUTTON_OK")
	--Controls.LegalName:LocalizeAndSetText("TXT_KEY_TEST_LEGAL_BUTTON_OK")
	--Controls.LaborName:LocalizeAndSetText("TXT_KEY_TEST_LABOR_BUTTON_OK")
	--Controls.EconomyName:LocalizeAndSetText("TXT_KEY_TEST_ECONOMY_BUTTON_OK")
	--Controls.ReligionName:LocalizeAndSetText("TXT_KEY_TEST_RELIGION_BUTTON_OK")
	--Controls.TotalName:LocalizeAndSetText("TXT_KEY_TEST_BASED_TOTAL_DEFAULT")
	Controls.Tips:LocalizeAndSetText("TXT_KEY_CIVIC_TIP_" .. TrueRandom(1,50))
end

function CivicInputHandler( uiMsg, wParam, lParam )      
    if(uiMsg == KeyEvents.KeyDown) then
        if (wParam == Keys.VK_ESCAPE) then
			OnClosingOK()
			return true
        end
    end
end
ContextPtr:SetInputHandler( CivicInputHandler )

LuaEvents.AdditionalInformationDropdownGatherEntries.Add(function(entries)
table.insert(entries, {
	text=Locale.Lookup("TXT_KEY_CIVIC_OVERVIEW"),
	art = "DC45_Civics.dds", -- icon for EUI
	call=function() 
	    OnOpeningCivic() -- function that opens the Popup.
	end,
});
end);
	
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries();

ContextPtr:SetHide(true)
IconHookup(6, 128, "MORE_SPECIALIST_ATLAS", Controls.BasedAdvisor)