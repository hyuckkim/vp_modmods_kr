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
	local Civic1 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	local Civic2 = "[COLOR_NEGATIVE_TEXT]군사 이론 필요[ENDCOLOR]"
	local Civic3 = "[COLOR_NEGATIVE_TEXT]문자 필요[ENDCOLOR]"
	local Civic4 = "[COLOR_NEGATIVE_TEXT]교육 필요[ENDCOLOR]"
	local Civic5 = "[COLOR_NEGATIVE_TEXT]인쇄기 필요[ENDCOLOR]"
	local Civic6 = "[COLOR_NEGATIVE_TEXT]강선 필요[ENDCOLOR]"
	local Civic7 = "[COLOR_NEGATIVE_TEXT]원자론 필요[ENDCOLOR]"
	if pPlayer:GetCurrentEra() > 2 then
		Civic1 = "[COLOR_NEGATIVE_TEXT]폐기됨[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ARCHERY)) then
		Civic2 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_WRITING)) then
		Civic3 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_EDUCATION)) then
		Civic4 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_PRINTING_PRESS)) then
		Civic5 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_RIFLING)) then
		Civic6 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ATOMIC_THEORY)) then
		Civic7 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if pPlayer:HasPolicy(iDepotism) then
		Civic1 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iHereditaryRule) then
		Civic2 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iPatronage) then
		Civic4 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iRepresentation) then
		Civic5 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iPoliceState) then
		Civic6 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iUniversalSuffrage) then
		Civic7 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iConfederation) then
		Civic3 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
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
	local Civic1 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	local Civic2 = "[COLOR_NEGATIVE_TEXT]수학 필요[ENDCOLOR]"
	local Civic3 = "[COLOR_NEGATIVE_TEXT]기사도 필요[ENDCOLOR]"
	local Civic4 = "[COLOR_NEGATIVE_TEXT]물리학 필요[ENDCOLOR]"
	local Civic5 = "[COLOR_NEGATIVE_TEXT]군사 과학 필요[ENDCOLOR]"
	local Civic6 = "[COLOR_NEGATIVE_TEXT]라디오 필요[ENDCOLOR]"
	local Civic7 = "[COLOR_NEGATIVE_TEXT]전기 통신 필요[ENDCOLOR]"
	if pPlayer:GetCurrentEra() > 2 then
		Civic1 = "[COLOR_NEGATIVE_TEXT]폐기됨[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MATHEMATICS)) then
		Civic2 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CHIVALRY)) then
		Civic3 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_PHYSICS)) then
		Civic4 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MILITARY_SCIENCE)) then
		Civic5 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_RADIO)) then
		Civic6 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_TELECOM)) then
		Civic7 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if pPlayer:HasPolicy(iBarbarism) then
		Civic1 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iCivilLaw) then
		Civic2 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iVassalage) then
		Civic3 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iBureaucracy) then
		Civic4 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iNationhood) then
		Civic5 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iFreeSpeech) then
		Civic6 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iConstutionalism) then
		Civic7 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
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
	local Civic1 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	local Civic2 = "[COLOR_NEGATIVE_TEXT]청동 기술 필요[ENDCOLOR]"
	local Civic3 = "[COLOR_NEGATIVE_TEXT]공공 행정 필요[ENDCOLOR]"
	local Civic4 = "[COLOR_NEGATIVE_TEXT]길드 필요[ENDCOLOR]"
	local Civic5 = "[COLOR_NEGATIVE_TEXT]산업화 필요[ENDCOLOR]"
	local Civic6 = "[COLOR_NEGATIVE_TEXT]전기 필요[ENDCOLOR]"
	local Civic7 = "[COLOR_NEGATIVE_TEXT]세계화 필요[ENDCOLOR]"
	if pPlayer:GetCurrentEra() > 2 then
		Civic1 = "[COLOR_NEGATIVE_TEXT]폐기됨[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_BRONZE_WORKING)) then
		Civic2 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CIVIL_SERVICE)) then
		Civic3 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GUILDS)) then
		Civic4 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_INDUSTRIALIZATION)) then
		Civic5 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GLOBALIZATION)) then
		Civic7 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ELECTRICITY)) then
		Civic6 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if pPlayer:HasPolicy(iTribalism) then
		Civic1 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iSlavery) then
		Civic2 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iSerfdom) then
		Civic3 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iCasteSystem) then
		Civic4 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iIndustrializedServitude) then
		Civic5 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iEmancipation) then
		Civic7 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iMechanization) then
		Civic6 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
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
	local Civic1 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	local Civic2 = "[COLOR_NEGATIVE_TEXT]교역 필요[ENDCOLOR]"
	local Civic3 = "[COLOR_NEGATIVE_TEXT]화폐 필요[ENDCOLOR]"
	local Civic4 = "[COLOR_NEGATIVE_TEXT]경제학 필요[ENDCOLOR]"
	local Civic5 = "[COLOR_NEGATIVE_TEXT]기업 필요[ENDCOLOR]"
	local Civic6 = "[COLOR_NEGATIVE_TEXT]기업 필요[ENDCOLOR]"
	local Civic7 = "[COLOR_NEGATIVE_TEXT]대체 에너지 필요[ENDCOLOR]"
	if pPlayer:GetCurrentEra() > 2 then
		Civic1 = "[COLOR_NEGATIVE_TEXT]폐기됨[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_HORSEBACK_RIDING)) then
		Civic2 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CURRENCY)) then
		Civic3 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ECONOMICS)) then
		Civic4 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CORPORATIONS)) then
		Civic5 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CORPORATIONS)) then
		Civic6 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ECOLOGY)) then
		Civic7 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if pPlayer:HasPolicy(iDecentralization) then
		Civic1 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iIngeniusCraft) then
		Civic2 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iMercantilism) then
		Civic3 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iFreeMarket) then
		Civic4 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iStateProperty) then
		Civic5 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iCorporatism) then
		Civic6 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iEnvironmentalism) then
		Civic7 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
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
	local Civic1 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	local Civic2 = "[COLOR_NEGATIVE_TEXT]달력 필요[ENDCOLOR]"
	local Civic3 = "[COLOR_NEGATIVE_TEXT]철학 필요[ENDCOLOR]"
	local Civic4 = "[COLOR_NEGATIVE_TEXT]신학 필요[ENDCOLOR]"
	local Civic5 = "[COLOR_NEGATIVE_TEXT]생물학 필요[ENDCOLOR]"
	local Civic6 = "[COLOR_NEGATIVE_TEXT]비행 필요[ENDCOLOR]"
	local Civic7 = "[COLOR_NEGATIVE_TEXT]페니실린 필요[ENDCOLOR]"
	if pPlayer:GetCurrentEra() > 2 then
		Civic1 = "[COLOR_NEGATIVE_TEXT]폐기됨[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CALENDAR)) then
		Civic2 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_PHILOSOPHY)) then
		Civic3 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_THEOLOGY)) then
		Civic4 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_BIOLOGY)) then
		Civic5 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_FLIGHT)) then
		Civic6 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_PENICILIN)) then
		Civic7 = "[COLOR_POSITIVE_TEXT]가능[ENDCOLOR]"
	end
	if pPlayer:HasPolicy(iPaganism) then
		Civic1 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iAncestorWorship) then
		Civic2 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iOrganizedReligion) then
		Civic3 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iTheocracy) then
		Civic4 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iPacifism) then
		Civic5 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iStateAtheism) then
		Civic6 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
	elseif pPlayer:HasPolicy(iFreeReligion) then
		Civic7 = "[COLOR_ADVISOR_HIGHLIGHT_TEXT]제정됨[ENDCOLOR]"
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
		return "전제정치"
	elseif pPlayer:HasPolicy(iHereditaryRule) then
		return "세습 통치"
	elseif pPlayer:HasPolicy(iPatronage) then
		return "후원"
	elseif pPlayer:HasPolicy(iRepresentation) then
		return "대의권"
	elseif pPlayer:HasPolicy(iPoliceState) then
		return "전체주의"
	elseif pPlayer:HasPolicy(iUniversalSuffrage) then
		return "국민 참정권"
	elseif pPlayer:HasPolicy(iConfederation) then
		return "연방제"
	else 
		return "정부가 없어요???"
	end
end

function LegalLooker(pPlayer)
	if pPlayer:HasPolicy(iBarbarism) then
		return "무정부주의"
	elseif pPlayer:HasPolicy(iCivilLaw) then
		return "성문화된 법률"
	elseif pPlayer:HasPolicy(iVassalage) then
		return "봉건제"
	elseif pPlayer:HasPolicy(iBureaucracy) then
		return "관료제"
	elseif pPlayer:HasPolicy(iNationhood) then
		return "국가주의"
	elseif pPlayer:HasPolicy(iFreeSpeech) then
		return "표현의 자유"
	elseif pPlayer:HasPolicy(iConstutionalism) then
		return "입헌주의"
	else
		return "법률 시스템이 없어요???"
	end
end

function LaborLooker(pPlayer)
	if pPlayer:HasPolicy(iTribalism) then
		return "부족제"
	elseif pPlayer:HasPolicy(iSlavery) then
		return "노예제"
	elseif pPlayer:HasPolicy(iSerfdom) then
		return "장원제"
	elseif pPlayer:HasPolicy(iCasteSystem) then
		return "신분제"
	elseif pPlayer:HasPolicy(iIndustrializedServitude) then
		return "산업 노예"
	elseif pPlayer:HasPolicy(iEmancipation) then
		return "해방"
	elseif pPlayer:HasPolicy(iMechanization) then
		return "노동조합주의"
	else
		return "노동이 없어요???"
	end
end

function EconomyLooker(pPlayer)
	if pPlayer:HasPolicy(iDecentralization) then
		return "물물교환"
	elseif pPlayer:HasPolicy(iMercantilism) then
		return "상업주의"
	elseif pPlayer:HasPolicy(iFreeMarket) then
		return "자유시장"
	elseif pPlayer:HasPolicy(iStateProperty) then
		return "국유재산"
	elseif pPlayer:HasPolicy(iCorporatism) then
		return "협동조합주의"
	elseif pPlayer:HasPolicy(iEnvironmentalism) then
		return "환경주의"
	elseif pPlayer:HasPolicy(iIngeniusCraft) then
		return "탈중앙화"
	else
		return "경제가 없어요???"
	end
end

function ReligionLooker(pPlayer)
	if pPlayer:HasPolicy(iPaganism) then
		return "무종교"
	elseif pPlayer:HasPolicy(iOrganizedReligion) then
		return "조직된 신앙"
	elseif pPlayer:HasPolicy(iTheocracy) then
		return "신정제"
	elseif pPlayer:HasPolicy(iPacifism) then
		return "평화주의"
	elseif pPlayer:HasPolicy(iStateAtheism) then
		return "유명인 숭배"
	elseif pPlayer:HasPolicy(iFreeReligion) then
		return "종교의 자유"
	elseif pPlayer:HasPolicy(iAncestorWorship) then
		return "조상 숭배"
	else
		return "종교가 없어요???"
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
	if GovernmentName == "전제정치" or GovernmentName == "세습 통치" or GovernmentName == "연방제" then GovernmentMaintain = pPlayer:GetBaseBuildingMaintenance()*0.1
	elseif GovernmentName == "후원" or GovernmentName == "대의권" then GovernmentMaintain = pPlayer:GetBaseBuildingMaintenance()*0.15
	elseif GovernmentName == "전체주의" or GovernmentName == "국민 참정권" then GovernmentMaintain = pPlayer:GetBaseBuildingMaintenance()*0.2 end
	if LegalName == "무정부주의" or LegalName == "성문화된 법률" then LegalMaintain = pPlayer:GetBaseBuildingMaintenance()*0.09
	elseif LegalName == "표현의 자유" then LegalMaintain = pPlayer:GetBaseBuildingMaintenance()*0.14
	elseif LegalName == "봉건제" or LegalName == "관료제" or LegalName == "입헌주의" then LegalMaintain = pPlayer:GetBaseBuildingMaintenance()*0.19 end
	if LaborName == "부족제" or LaborName == "장원제" or LaborName == "해방" then LaborMaintain = pPlayer:GetBaseBuildingMaintenance()*0.08
	elseif LaborName == "노예제" or LaborName == "신분제" then LaborMaintain = pPlayer:GetBaseBuildingMaintenance()*0.13
	elseif LaborName == "산업 노예" or LaborName == "노동조합주의" then LaborMaintain = pPlayer:GetBaseBuildingMaintenance()*0.18 end
	if EconomyName == "탈중앙화" or EconomyName == "물물교환" then EconomyMaintain = pPlayer:GetBaseBuildingMaintenance()*0.07
	elseif EconomyName == "상업주의" or EconomyName == "국유재산" or EconomyName == "자유시장" then EconomyMaintain = pPlayer:GetBaseBuildingMaintenance()*0.12
	elseif EconomyName == "협동조합주의" or EconomyName == "환경주의" then EconomyMaintain = pPlayer:GetBaseBuildingMaintenance()*0.17 end
	if ReligionName == "무종교" or ReligionName == "조상 숭배" then ReligionMaintain = pPlayer:GetBaseBuildingMaintenance()*0.06
	elseif ReligionName == "신정제" or ReligionName == "유명인 숭배" or ReligionName == "종교의 자유" then ReligionMaintain = pPlayer:GetBaseBuildingMaintenance()*0.11
	elseif ReligionName == "조직된 신앙" then ReligionMaintain = pPlayer:GetBaseBuildingMaintenance()*0.16 end
	if (pActivePlayer == pPlayer) then
		local sGold = "우리는 재정적으로 안정적입니다."
		local sHappiness = "지금으로선 우리 국민들에 대한 불만은 없는 듯합니다."
		Controls.GovernmentName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", GovernmentName, GovernmentMaintain)
		Controls.LegalName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", LegalName, LegalMaintain)
		Controls.LaborName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", LaborName, LaborMaintain)
		Controls.EconomyName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", EconomyName, EconomyMaintain)
		Controls.ReligionName:LocalizeAndSetText("TXT_KEY_CIVIC_LOOKAT", ReligionName, ReligionMaintain)
		if pActivePlayer:CalculateGoldRate() < 0 then
			sGold = "유지비가 합리적인 정책으로 바꾸는 게 어떨까요? 우리 경제가 썩 좋지 않습니다."
		end
		if pActivePlayer:IsEmpireUnhappy() or pActivePlayer:IsEmpireSuperUnhappy() then
			sHappiness = "아마도 우리는 국민들 불만의 원인을 조사하고 그에 따라 정책을 조정할 수 있지 않을까요?"
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