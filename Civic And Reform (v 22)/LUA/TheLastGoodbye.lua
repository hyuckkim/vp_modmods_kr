local iDivide = math.ceil((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/5)
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local iTurn = math.ceil((GameInfo.GameSpeeds[Game.GetGameSpeedType()].GrowthPercent)/100)
local iGovernmentCivics = GameInfoTypes.PLAYER_EVENT_GOVERNMENTCIVIC
local iLegalCivics = GameInfoTypes.PLAYER_EVENT_LEGALCIVIC
local iLaborCivics = GameInfoTypes.PLAYER_EVENT_LABORCIVIC
local iEconomyCivics = GameInfoTypes.PLAYER_EVENT_ECONOMYCIVIC
local iReligionCivics = GameInfoTypes.PLAYER_EVENT_RELIGIONCIVIC
--local iMilitaryCivics = GameInfoTypes.PLAYER_EVENT_MILITARYCIVIC

local iDepotismChoice = GameInfoTypes.PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_1
local iHereditaryRuleChoice = GameInfoTypes.PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_2
local iPatronageChoice = GameInfoTypes.PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_3
local iRepresentationChoice = GameInfoTypes.PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_4
local iPoliceStateChoice = GameInfoTypes.PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_5
local iUniversalSuffrageChoice = GameInfoTypes.PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_6
local iConfederationChoice = GameInfoTypes.PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_7
local iNope = GameInfoTypes.PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_8

local iBarbarismChoice = GameInfoTypes.PLAYER_EVENT_LEGALCIVIC_CHOICE_1
local iCivilLawChoice = GameInfoTypes.PLAYER_EVENT_LEGALCIVIC_CHOICE_2
local iVassalageChoice = GameInfoTypes.PLAYER_EVENT_LEGALCIVIC_CHOICE_3
local iBureaucracyChoice = GameInfoTypes.PLAYER_EVENT_LEGALCIVIC_CHOICE_4
local iNationhoodChoice = GameInfoTypes.PLAYER_EVENT_LEGALCIVIC_CHOICE_5
local iFreeSpeechChoice = GameInfoTypes.PLAYER_EVENT_LEGALCIVIC_CHOICE_6
local iConstutionalismChoice = GameInfoTypes.PLAYER_EVENT_LEGALCIVIC_CHOICE_7
local iNope2 = GameInfoTypes.PLAYER_EVENT_LEGALCIVIC_CHOICE_8

local iTribalismChoice = GameInfoTypes.PLAYER_EVENT_LABORCIVIC_CHOICE_1
local iSlaveryChoice = GameInfoTypes.PLAYER_EVENT_LABORCIVIC_CHOICE_2
local iSerfdomChoice = GameInfoTypes.PLAYER_EVENT_LABORCIVIC_CHOICE_3
local iCasteSystemChoice = GameInfoTypes.PLAYER_EVENT_LABORCIVIC_CHOICE_4
local iIndustrializedServitudeChoice = GameInfoTypes.PLAYER_EVENT_LABORCIVIC_CHOICE_5
local iEmancipationChoice = GameInfoTypes.PLAYER_EVENT_LABORCIVIC_CHOICE_6
local iMechanizationChoice = GameInfoTypes.PLAYER_EVENT_LABORCIVIC_CHOICE_7
local iNope3 = GameInfoTypes.PLAYER_EVENT_LABORCIVIC_CHOICE_8

local iDecentralizationChoice = GameInfoTypes.PLAYER_EVENT_ECONOMYCIVIC_CHOICE_1
local iMercantilismChoice = GameInfoTypes.PLAYER_EVENT_ECONOMYCIVIC_CHOICE_2
local iFreeMarketChoice = GameInfoTypes.PLAYER_EVENT_ECONOMYCIVIC_CHOICE_3
local iStatePropertyChoice = GameInfoTypes.PLAYER_EVENT_ECONOMYCIVIC_CHOICE_4
local iCorporatismChoice = GameInfoTypes.PLAYER_EVENT_ECONOMYCIVIC_CHOICE_5
local iEnvironmentalismChoice = GameInfoTypes.PLAYER_EVENT_ECONOMYCIVIC_CHOICE_6
local iIngeniusCraftChoice = GameInfoTypes.PLAYER_EVENT_ECONOMYCIVIC_CHOICE_7
local iNope4 = GameInfoTypes.PLAYER_EVENT_ECONOMYCIVIC_CHOICE_8

local iPaganismChoice = GameInfoTypes.PLAYER_EVENT_RELIGIONCIVIC_CHOICE_1
local iOrganizedReligionChoice = GameInfoTypes.PLAYER_EVENT_RELIGIONCIVIC_CHOICE_2
local iTheocracyChoice = GameInfoTypes.PLAYER_EVENT_RELIGIONCIVIC_CHOICE_3
local iPacifismChoice = GameInfoTypes.PLAYER_EVENT_RELIGIONCIVIC_CHOICE_4
local iStateAtheismChoice = GameInfoTypes.PLAYER_EVENT_RELIGIONCIVIC_CHOICE_5
local iFreeReligionChoice = GameInfoTypes.PLAYER_EVENT_RELIGIONCIVIC_CHOICE_6
local iAncestorWorshipChoice = GameInfoTypes.PLAYER_EVENT_RELIGIONCIVIC_CHOICE_7
local iNope5 = GameInfoTypes.PLAYER_EVENT_RELIGIONCIVIC_CHOICE_8

local iDepotism = GameInfoTypes.POLICY_CIVIC_DEPOTISM
local iHereditaryRule = GameInfoTypes.POLICY_CIVIC_HEREDITARY_RULE
local iPatronage = GameInfoTypes.POLICY_CIVIC_PATRONAGE
local iRepresentation = GameInfoTypes.POLICY_CIVIC_REPRESENTATION
local iPoliceState = GameInfoTypes.POLICY_CIVIC_POLICE_STATE
local iUniversalSuffrage = GameInfoTypes.POLICY_CIVIC_UNIVERSAL_SUFFRAGE
local iConfederation = GameInfoTypes.POLICY_CIVIC_CONFEDERATION

local iBarbarism = GameInfoTypes.POLICY_CIVIC_BARBARISM
local iCivilLaw = GameInfoTypes.POLICY_CIVIC_CIVIL_LAW
local iVassalage = GameInfoTypes.POLICY_CIVIC_VASSALAGE
local iBureaucracy = GameInfoTypes.POLICY_CIVIC_BUREAUCRACY
local iNationhood = GameInfoTypes.POLICY_CIVIC_NATIONHOOD
local iFreeSpeech = GameInfoTypes.POLICY_CIVIC_FREE_SPEECH
local iConstutionalism = GameInfoTypes.POLICY_CIVIC_CONSTIUTIONALISM
local iConstutionalismBuilding = GameInfoTypes.BUILDING_CONSTUTIONALISM

local iTribalism = GameInfoTypes.POLICY_CIVIC_TRIBALISM
local iSlavery = GameInfoTypes.POLICY_CIVIC_SLAVERY
local iSerfdom = GameInfoTypes.POLICY_CIVIC_SERFDOM
local iCasteSystem = GameInfoTypes.POLICY_CIVIC_CASTE_SYSTEM
local iIndustrializedServitude = GameInfoTypes.POLICY_CIVIC_INDUSTRIALIZED_SERVITUDE
local iEmancipation = GameInfoTypes.POLICY_CIVIC_EMANCIPATION
local iMechanization = GameInfoTypes.POLICY_CIVIC_MECHANIZATION

local iDecentralization = GameInfoTypes.POLICY_CIVIC_DECENTRALIZATION
local iMercantilism = GameInfoTypes.POLICY_CIVIC_MERCANTILISM
local iFreeMarket = GameInfoTypes.POLICY_CIVIC_FREE_MARKET
local iStateProperty = GameInfoTypes.POLICY_CIVIC_STATE_PROPERTY
local iCorporatism = GameInfoTypes.POLICY_CIVIC_CORPORATISM
local iEnvironmentalism = GameInfoTypes.POLICY_CIVIC_ENVIRONMENTALISM
local iIngeniusCraft = GameInfoTypes.POLICY_CIVIC_INGENIUSCRAFT

local iPaganism = GameInfoTypes.POLICY_CIVIC_PAGANISM
local iOrganizedReligion = GameInfoTypes.POLICY_CIVIC_ORGANIZED_RELIGION
local iTheocracy = GameInfoTypes.POLICY_CIVIC_THEOCRACY
local iPacifism = GameInfoTypes.POLICY_CIVIC_PACIFISM
local iStateAtheism = GameInfoTypes.POLICY_CIVIC_STATE_ATHEISM
local iStateAtheismBuilding = GameInfoTypes.BUILDING_STATE_ATHEISM
local iFreeReligion = GameInfoTypes.POLICY_CIVIC_FREE_RELIGION
local iAncestorWorship = GameInfoTypes.POLICY_CIVIC_ANCESTOR_WORSHIP

local iTaxationIsAThing = GameInfoTypes.BUILDING_TAXTAXTAX

function ASpringCleaning(iPlayer, iUnit, iUnitType, iPlotX, iPlotY)
	if not Players[iPlayer]:IsBarbarian() then
		Map.GetPlot(iPlotX, iPlotY):GetPlotCity():SetNumRealBuilding(iTaxationIsAThing, 1)
	end
	local pPlayer = Players[iPlayer]
	if pPlayer:IsHuman() then
		--[[if pPlayer:HasPolicy(iPatronage) then
			pPlayer:SetEventChoiceCooldown(iPatronageChoice, 0)
			pPlayer:DoCancelEventChoice(iPatronageChoice)
			pPlayer:DoEventChoice(iPatronageChoice)
		else]]if pPlayer:HasPolicy(iUniversalSuffrage) then
			pPlayer:SetEventChoiceCooldown(iUniversalSuffrageChoice, 0)
			pPlayer:DoCancelEventChoice(iUniversalSuffrageChoice)
			pPlayer:DoEventChoice(iUniversalSuffrageChoice)
		elseif pPlayer:HasPolicy(iBureaucracy) then
			pPlayer:SetEventChoiceCooldown(iBureaucracyChoice, 0)
			pPlayer:DoCancelEventChoice(iBureaucracyChoice)
			pPlayer:DoEventChoice(iBureaucracyChoice)
		elseif pPlayer:HasPolicy(iNationhood) then
			pPlayer:SetEventChoiceCooldown(iNationhoodChoice, 0)
			pPlayer:DoCancelEventChoice(iNationhoodChoice)
			pPlayer:DoEventChoice(iNationhoodChoice)
		end
	end
end

function AnAutumnBlessing(oldOwnerID, bIsCapital, x, y, newOwnerID, pop, bConquest)
	if Players[oldOwnerID]:IsHuman() then
		local pPlayer = Players[oldOwnerID]
		if pPlayer:IsHuman() then
			--[[if pPlayer:HasPolicy(iPatronage) then
				pPlayer:SetEventChoiceCooldown(iPatronageChoice, 0)
				pPlayer:DoCancelEventChoice(iPatronageChoice)
				pPlayer:DoEventChoice(iPatronageChoice)
			else]]if pPlayer:HasPolicy(iUniversalSuffrage) then
				pPlayer:SetEventChoiceCooldown(iUniversalSuffrageChoice, 0)
				pPlayer:DoCancelEventChoice(iUniversalSuffrageChoice)
				pPlayer:DoEventChoice(iUniversalSuffrageChoice)
			elseif pPlayer:HasPolicy(iBureaucracy) then
				pPlayer:SetEventChoiceCooldown(iBureaucracyChoice, 0)
				pPlayer:DoCancelEventChoice(iBureaucracyChoice)
				pPlayer:DoEventChoice(iBureaucracyChoice)
			elseif pPlayer:HasPolicy(iNationhood) then
				pPlayer:SetEventChoiceCooldown(iNationhoodChoice, 0)
				pPlayer:DoCancelEventChoice(iNationhoodChoice)
				pPlayer:DoEventChoice(iNationhoodChoice)
			end
		end
	elseif Players[newOwnerID]:IsHuman() then
		local pPlayer = Players[newOwnerID]
		if pPlayer:IsHuman() then
			--[[if pPlayer:HasPolicy(iPatronage) then
				pPlayer:SetEventChoiceCooldown(iPatronageChoice, 0)
				pPlayer:DoCancelEventChoice(iPatronageChoice)
				pPlayer:DoEventChoice(iPatronageChoice)
			else]]if pPlayer:HasPolicy(iUniversalSuffrage) then
				pPlayer:SetEventChoiceCooldown(iUniversalSuffrageChoice, 0)
				pPlayer:DoCancelEventChoice(iUniversalSuffrageChoice)
				pPlayer:DoEventChoice(iUniversalSuffrageChoice)
			elseif pPlayer:HasPolicy(iBureaucracy) then
				pPlayer:SetEventChoiceCooldown(iBureaucracyChoice, 0)
				pPlayer:DoCancelEventChoice(iBureaucracyChoice)
				pPlayer:DoEventChoice(iBureaucracyChoice)
			elseif pPlayer:HasPolicy(iNationhood) then
				pPlayer:SetEventChoiceCooldown(iNationhoodChoice, 0)
				pPlayer:DoCancelEventChoice(iNationhoodChoice)
				pPlayer:DoEventChoice(iNationhoodChoice)
			end
		end
	end
end



function ISawTheLightFadeFromTheSky(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsMinorCiv() or pPlayer:IsBarbarian() then return end
	if (math.fmod(Game.GetElapsedGameTurns()-iPlayer, iDivide) == 0) then
		if not pPlayer:IsHuman() then
			pPlayer:SetEventCooldown(iReligionCivics, 0)
			pPlayer:SetEventCooldown(iEconomyCivics, 0)
			pPlayer:SetEventCooldown(iLaborCivics, 0)
			pPlayer:SetEventCooldown(iLegalCivics, 0)
			pPlayer:SetEventCooldown(iGovernmentCivics, 0)
			pPlayer:DoStartEvent(iReligionCivics)
			pPlayer:DoStartEvent(iEconomyCivics)
			pPlayer:DoStartEvent(iLaborCivics)
			pPlayer:DoStartEvent(iLegalCivics)
			pPlayer:DoStartEvent(iGovernmentCivics)
		end
	end
end

function OnTheWindIHeardASigh(iPlayer, iChoice)
	local pPlayer = Players[iPlayer]
	if iChoice == iDepotismChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iDepotism)
		pPlayer:RevokePolicy(iHereditaryRule)
		pPlayer:RevokePolicy(iConfederation)
		pPlayer:RevokePolicy(iPatronage)
		pPlayer:RevokePolicy(iRepresentation)
		pPlayer:RevokePolicy(iPoliceState)
		pPlayer:RevokePolicy(iUniversalSuffrage)
		pPlayer:SetEventChoiceCooldown(iHereditaryRuleChoice, 0)		
		pPlayer:DoCancelEventChoice(iHereditaryRuleChoice)
		pPlayer:SetEventChoiceCooldown(iUniversalSuffrageChoice, 0)	
		pPlayer:DoCancelEventChoice(iUniversalSuffrageChoice)
		pPlayer:GrantPolicy(iDepotism, true)
	elseif iChoice == iHereditaryRuleChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iDepotism)
		if pPlayer:HasPolicy(iHereditaryRule) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 75 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iHereditaryRule)
		pPlayer:SetEventChoiceCooldown(iHereditaryRuleChoice, 0)
		pPlayer:DoCancelEventChoice(iHereditaryRuleChoice)
		pPlayer:RevokePolicy(iConfederation)
		pPlayer:RevokePolicy(iPatronage)
		pPlayer:RevokePolicy(iRepresentation)
		pPlayer:RevokePolicy(iPoliceState)
		pPlayer:RevokePolicy(iUniversalSuffrage)
		pPlayer:SetEventChoiceCooldown(iUniversalSuffrageChoice, 0)	
		pPlayer:DoCancelEventChoice(iUniversalSuffrageChoice)
		pPlayer:SetEventChoiceCooldown(iHereditaryRuleChoice, iDivide)		
		pPlayer:GrantPolicy(iHereditaryRule, true)
		if pPlayer:IsHuman() then
			pPlayer:SetEventChoiceCooldown(iHereditaryRuleChoice, -1)
		end
	elseif iChoice == iPatronageChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iDepotism)
		pPlayer:RevokePolicy(iHereditaryRule)
		pPlayer:RevokePolicy(iConfederation)
		if pPlayer:HasPolicy(iPatronage) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 85 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iPatronage)
		pPlayer:RevokePolicy(iRepresentation)
		pPlayer:RevokePolicy(iPoliceState)
		pPlayer:RevokePolicy(iUniversalSuffrage)
		pPlayer:SetEventChoiceCooldown(iHereditaryRuleChoice, 0)		
		pPlayer:DoCancelEventChoice(iHereditaryRuleChoice)
		pPlayer:SetEventChoiceCooldown(iUniversalSuffrageChoice, 0)	
		pPlayer:DoCancelEventChoice(iUniversalSuffrageChoice)
		pPlayer:GrantPolicy(iPatronage, true)
	elseif iChoice == iRepresentationChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iDepotism)
		pPlayer:RevokePolicy(iHereditaryRule)
		pPlayer:RevokePolicy(iConfederation)
		pPlayer:RevokePolicy(iPatronage)
		if pPlayer:HasPolicy(iRepresentation) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 85 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iRepresentation)
		pPlayer:RevokePolicy(iPoliceState)
		pPlayer:RevokePolicy(iUniversalSuffrage)
		pPlayer:SetEventChoiceCooldown(iHereditaryRuleChoice, 0)		
		pPlayer:DoCancelEventChoice(iHereditaryRuleChoice)
		pPlayer:SetEventChoiceCooldown(iUniversalSuffrageChoice, 0)	
		pPlayer:DoCancelEventChoice(iUniversalSuffrageChoice)
		pPlayer:GrantPolicy(iRepresentation, true)
	elseif iChoice == iPoliceStateChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iDepotism)
		pPlayer:RevokePolicy(iHereditaryRule)
		pPlayer:RevokePolicy(iConfederation)
		pPlayer:RevokePolicy(iPatronage)
		pPlayer:RevokePolicy(iRepresentation)
		if pPlayer:HasPolicy(iPoliceState) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 95 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iPoliceState)
		pPlayer:RevokePolicy(iUniversalSuffrage)
		pPlayer:SetEventChoiceCooldown(iHereditaryRuleChoice, 0)		
		pPlayer:DoCancelEventChoice(iHereditaryRuleChoice)
		pPlayer:SetEventChoiceCooldown(iUniversalSuffrageChoice, 0)	
		pPlayer:DoCancelEventChoice(iUniversalSuffrageChoice)
		pPlayer:GrantPolicy(iPoliceState, true)
	elseif iChoice == iUniversalSuffrageChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iDepotism)
		pPlayer:RevokePolicy(iHereditaryRule)
		pPlayer:RevokePolicy(iConfederation)
		pPlayer:RevokePolicy(iPatronage)
		pPlayer:RevokePolicy(iRepresentation)
		pPlayer:RevokePolicy(iPoliceState)
		if pPlayer:HasPolicy(iUniversalSuffrage) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 95 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iUniversalSuffrage)
		pPlayer:SetEventChoiceCooldown(iHereditaryRuleChoice, 0)		
		pPlayer:DoCancelEventChoice(iHereditaryRuleChoice)
		pPlayer:SetEventChoiceCooldown(iUniversalSuffrageChoice, iDivide)
		pPlayer:GrantPolicy(iUniversalSuffrage, true)
		if pPlayer:IsHuman() then
			pPlayer:SetEventChoiceCooldown(iUniversalSuffrageChoice, -1)
		end
	elseif iChoice == iConfederationChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iDepotism)
		pPlayer:RevokePolicy(iHereditaryRule)
		pPlayer:RevokePolicy(iConfederation)
		pPlayer:RevokePolicy(iPatronage)
		pPlayer:RevokePolicy(iRepresentation)
		pPlayer:RevokePolicy(iPoliceState)
		pPlayer:RevokePolicy(iUniversalSuffrage)
		pPlayer:SetEventChoiceCooldown(iHereditaryRuleChoice, 0)	
		pPlayer:DoCancelEventChoice(iHereditaryRuleChoice)
		pPlayer:SetEventChoiceCooldown(iUniversalSuffrageChoice, 0)	
		pPlayer:DoCancelEventChoice(iUniversalSuffrageChoice)
		if pPlayer:HasPolicy(iConfederation) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 75 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:GrantPolicy(iConfederation, true)
	end
end

function AsTheSnowflakesCover(iPlayer, iChoice)
	local pPlayer = Players[iPlayer]
	if iChoice == iBarbarismChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iBarbarism)
		pPlayer:RevokePolicy(iCivilLaw)
		pPlayer:RevokePolicy(iVassalage)
		pPlayer:RevokePolicy(iBureaucracy)
		pPlayer:RevokePolicy(iNationhood)
		pPlayer:RevokePolicy(iFreeSpeech)
		pPlayer:RevokePolicy(iConstutionalism)
		pPlayer:SetEventChoiceCooldown(iBureaucracyChoice, 0)
		pPlayer:DoCancelEventChoice(iBureaucracyChoice)
		pPlayer:SetEventChoiceCooldown(iNationhoodChoice, 0)
		pPlayer:DoCancelEventChoice(iNationhoodChoice)
		pPlayer:GrantPolicy(iBarbarism, true)
	elseif iChoice == iCivilLawChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iBarbarism)
		if pPlayer:HasPolicy(iCivilLaw) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 75 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iCivilLaw)
		pPlayer:RevokePolicy(iVassalage)
		pPlayer:RevokePolicy(iBureaucracy)
		pPlayer:RevokePolicy(iNationhood)
		pPlayer:RevokePolicy(iFreeSpeech)
		pPlayer:RevokePolicy(iConstutionalism)
		pPlayer:SetEventChoiceCooldown(iBureaucracyChoice, 0)
		pPlayer:DoCancelEventChoice(iBureaucracyChoice)
		pPlayer:SetEventChoiceCooldown(iNationhoodChoice, 0)
		pPlayer:DoCancelEventChoice(iNationhoodChoice)
		pPlayer:GrantPolicy(iCivilLaw, true)
	elseif iChoice == iVassalageChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iBarbarism)
		pPlayer:RevokePolicy(iCivilLaw)
		if pPlayer:HasPolicy(iVassalage) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 95 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iVassalage)
		pPlayer:RevokePolicy(iBureaucracy)
		pPlayer:RevokePolicy(iNationhood)
		pPlayer:RevokePolicy(iFreeSpeech)
		pPlayer:RevokePolicy(iConstutionalism)
		pPlayer:SetEventChoiceCooldown(iBureaucracyChoice, 0)
		pPlayer:DoCancelEventChoice(iBureaucracyChoice)
		pPlayer:SetEventChoiceCooldown(iNationhoodChoice, 0)
		pPlayer:DoCancelEventChoice(iNationhoodChoice)
		pPlayer:GrantPolicy(iVassalage, true)
	elseif iChoice == iBureaucracyChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iBarbarism)
		pPlayer:RevokePolicy(iCivilLaw)
		pPlayer:RevokePolicy(iVassalage)
		if pPlayer:HasPolicy(iBureaucracy) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 95 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iBureaucracy)
		pPlayer:RevokePolicy(iNationhood)
		pPlayer:RevokePolicy(iFreeSpeech)
		pPlayer:RevokePolicy(iConstutionalism)
		pPlayer:SetEventChoiceCooldown(iBureaucracyChoice, iDivide)
		pPlayer:SetEventChoiceCooldown(iNationhoodChoice, 0)
		pPlayer:DoCancelEventChoice(iNationhoodChoice)
		pPlayer:GrantPolicy(iBureaucracy, true)
		if pPlayer:IsHuman() then pPlayer:SetEventChoiceCooldown(iBureaucracyChoice, -1) end
	elseif iChoice == iNationhoodChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iBarbarism)
		pPlayer:RevokePolicy(iCivilLaw)
		pPlayer:RevokePolicy(iVassalage)
		pPlayer:RevokePolicy(iBureaucracy)
		if pPlayer:HasPolicy(iNationhood) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 95 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iNationhood)
		pPlayer:RevokePolicy(iFreeSpeech)
		pPlayer:RevokePolicy(iConstutionalism)
		pPlayer:SetEventChoiceCooldown(iBureaucracyChoice, 0)
		pPlayer:DoCancelEventChoice(iBureaucracyChoice)
		pPlayer:SetEventChoiceCooldown(iNationhoodChoice, iDivide)
		pPlayer:GrantPolicy(iNationhood, true)
		if pPlayer:IsHuman() then pPlayer:SetEventChoiceCooldown(iNationhoodChoice, -1) end
	elseif iChoice == iFreeSpeechChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iBarbarism)
		pPlayer:RevokePolicy(iCivilLaw)
		pPlayer:RevokePolicy(iVassalage)
		pPlayer:RevokePolicy(iBureaucracy)
		pPlayer:RevokePolicy(iNationhood)
		if pPlayer:HasPolicy(iFreeSpeech) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 85 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iFreeSpeech)
		pPlayer:RevokePolicy(iConstutionalism)
		pPlayer:SetEventChoiceCooldown(iBureaucracyChoice, 0)
		pPlayer:DoCancelEventChoice(iBureaucracyChoice)
		pPlayer:SetEventChoiceCooldown(iNationhoodChoice, 0)
		pPlayer:DoCancelEventChoice(iNationhoodChoice)
		pPlayer:GrantPolicy(iFreeSpeech, true)
	elseif iChoice == iConstutionalismChoice then
		CapitalForRealForReal(pPlayer)
		pPlayer:RevokePolicy(iBarbarism)
		pPlayer:RevokePolicy(iCivilLaw)
		pPlayer:RevokePolicy(iVassalage)
		pPlayer:RevokePolicy(iBureaucracy)
		pPlayer:RevokePolicy(iNationhood)
		pPlayer:RevokePolicy(iFreeSpeech)
		if pPlayer:HasPolicy(iConstutionalism) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 95 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iConstutionalism)
		pPlayer:SetEventChoiceCooldown(iBureaucracyChoice, 0)
		pPlayer:DoCancelEventChoice(iBureaucracyChoice)
		pPlayer:SetEventChoiceCooldown(iNationhoodChoice, 0)
		pPlayer:DoCancelEventChoice(iNationhoodChoice)
		pPlayer:GrantPolicy(iConstutionalism, true)
	end
end

function MyFallenBrothers(iPlayer, iChoice)
	local pPlayer = Players[iPlayer]
	if iChoice == iTribalismChoice then
		pPlayer:RevokePolicy(iTribalism)
		pPlayer:RevokePolicy(iSlavery)
		pPlayer:RevokePolicy(iSerfdom)
		pPlayer:RevokePolicy(iCasteSystem)
		pPlayer:RevokePolicy(iIndustrializedServitude)
		pPlayer:RevokePolicy(iEmancipation)
		pPlayer:RevokePolicy(iMechanization)
		pPlayer:GrantPolicy(iTribalism, true)
	elseif iChoice == iSlaveryChoice then
		pPlayer:RevokePolicy(iTribalism)
		if pPlayer:HasPolicy(iSlavery) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 85 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iSlavery)
		pPlayer:RevokePolicy(iSerfdom)
		pPlayer:RevokePolicy(iCasteSystem)
		pPlayer:RevokePolicy(iIndustrializedServitude)
		pPlayer:RevokePolicy(iEmancipation)
		pPlayer:RevokePolicy(iMechanization)
		pPlayer:GrantPolicy(iSlavery, true)
	elseif iChoice == iSerfdomChoice then
		pPlayer:RevokePolicy(iTribalism)
		pPlayer:RevokePolicy(iSlavery)
		if pPlayer:HasPolicy(iSerfdom) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 75 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iSerfdom)
		pPlayer:RevokePolicy(iCasteSystem)
		pPlayer:RevokePolicy(iIndustrializedServitude)
		pPlayer:RevokePolicy(iEmancipation)
		pPlayer:RevokePolicy(iMechanization)
		pPlayer:GrantPolicy(iSerfdom, true)
	elseif iChoice == iCasteSystemChoice then
		pPlayer:RevokePolicy(iTribalism)
		pPlayer:RevokePolicy(iSlavery)
		pPlayer:RevokePolicy(iSerfdom)
		if pPlayer:HasPolicy(iCasteSystem) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 85 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iCasteSystem)
		pPlayer:RevokePolicy(iIndustrializedServitude)
		pPlayer:RevokePolicy(iEmancipation)
		pPlayer:RevokePolicy(iMechanization)
		pPlayer:GrantPolicy(iCasteSystem, true)
	elseif iChoice == iIndustrializedServitudeChoice then
		pPlayer:RevokePolicy(iTribalism)
		pPlayer:RevokePolicy(iSlavery)
		pPlayer:RevokePolicy(iSerfdom)
		pPlayer:RevokePolicy(iCasteSystem)
		if pPlayer:HasPolicy(iIndustrializedServitude) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 95 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iIndustrializedServitude)
		pPlayer:RevokePolicy(iEmancipation)
		pPlayer:RevokePolicy(iMechanization)
		pPlayer:GrantPolicy(iIndustrializedServitude, true)
	elseif iChoice == iEmancipationChoice then
		pPlayer:RevokePolicy(iTribalism)
		pPlayer:RevokePolicy(iSlavery)
		pPlayer:RevokePolicy(iSerfdom)
		pPlayer:RevokePolicy(iCasteSystem)
		pPlayer:RevokePolicy(iIndustrializedServitude)
		if pPlayer:HasPolicy(iEmancipation) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 75 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iEmancipation)
		pPlayer:RevokePolicy(iMechanization)
		pPlayer:GrantPolicy(iEmancipation, true)
	elseif iChoice == iMechanizationChoice then
		pPlayer:RevokePolicy(iTribalism)
		pPlayer:RevokePolicy(iSlavery)
		pPlayer:RevokePolicy(iSerfdom)
		pPlayer:RevokePolicy(iCasteSystem)
		pPlayer:RevokePolicy(iIndustrializedServitude)
		pPlayer:RevokePolicy(iEmancipation)
		if pPlayer:HasPolicy(iMechanization) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 95 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iMechanization)
		pPlayer:GrantPolicy(iMechanization, true)
	end
end

function IWillSayThisLastGoodbye(iPlayer, iChoice)
	local pPlayer = Players[iPlayer]
	if iChoice == iDecentralizationChoice then
		pPlayer:RevokePolicy(iDecentralization)
		pPlayer:RevokePolicy(iMercantilism)
		pPlayer:RevokePolicy(iFreeMarket)
		pPlayer:RevokePolicy(iStateProperty)
		pPlayer:RevokePolicy(iCorporatism)
		pPlayer:RevokePolicy(iEnvironmentalism)
		pPlayer:RevokePolicy(iIngeniusCraft)
		pPlayer:GrantPolicy(iDecentralization, true)
	elseif iChoice == iMercantilismChoice then
		pPlayer:RevokePolicy(iDecentralization)
		if pPlayer:HasPolicy(iMercantilism) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 85 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iMercantilism)
		pPlayer:RevokePolicy(iFreeMarket)
		pPlayer:RevokePolicy(iStateProperty)
		pPlayer:RevokePolicy(iCorporatism)
		pPlayer:RevokePolicy(iEnvironmentalism)
		pPlayer:RevokePolicy(iIngeniusCraft)
		pPlayer:GrantPolicy(iMercantilism, true)
	elseif iChoice == iFreeMarketChoice then
		pPlayer:RevokePolicy(iDecentralization)
		pPlayer:RevokePolicy(iMercantilism)
		if pPlayer:HasPolicy(iFreeMarket) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 85 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iFreeMarket)
		pPlayer:RevokePolicy(iStateProperty)
		pPlayer:RevokePolicy(iCorporatism)
		pPlayer:RevokePolicy(iEnvironmentalism)
		pPlayer:RevokePolicy(iIngeniusCraft)
		pPlayer:GrantPolicy(iFreeMarket, true)
	elseif iChoice == iStatePropertyChoice then
		pPlayer:RevokePolicy(iDecentralization)
		pPlayer:RevokePolicy(iMercantilism)
		pPlayer:RevokePolicy(iFreeMarket)
		if pPlayer:HasPolicy(iStateProperty) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 85 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iStateProperty)
		pPlayer:RevokePolicy(iCorporatism)
		pPlayer:RevokePolicy(iEnvironmentalism)
		pPlayer:RevokePolicy(iIngeniusCraft)
		pPlayer:GrantPolicy(iStateProperty, true)
	elseif iChoice == iCorporatismChoice then
		pPlayer:RevokePolicy(iDecentralization)
		pPlayer:RevokePolicy(iMercantilism)
		pPlayer:RevokePolicy(iFreeMarket)
		pPlayer:RevokePolicy(iStateProperty)
		if pPlayer:HasPolicy(iCorporatism) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 95 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iCorporatism)
		pPlayer:RevokePolicy(iEnvironmentalism)
		pPlayer:RevokePolicy(iIngeniusCraft)
		pPlayer:GrantPolicy(iCorporatism, true)
	elseif iChoice == iEnvironmentalismChoice then
		pPlayer:RevokePolicy(iDecentralization)
		pPlayer:RevokePolicy(iMercantilism)
		pPlayer:RevokePolicy(iFreeMarket)
		pPlayer:RevokePolicy(iStateProperty)
		pPlayer:RevokePolicy(iCorporatism)
		if pPlayer:HasPolicy(iEnvironmentalism) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 95 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iEnvironmentalism)
		pPlayer:RevokePolicy(iIngeniusCraft)
		pPlayer:GrantPolicy(iEnvironmentalism, true)
	elseif iChoice == iIngeniusCraftChoice then
		pPlayer:RevokePolicy(iDecentralization)
		pPlayer:RevokePolicy(iMercantilism)
		pPlayer:RevokePolicy(iFreeMarket)
		pPlayer:RevokePolicy(iStateProperty)
		pPlayer:RevokePolicy(iCorporatism)
		pPlayer:RevokePolicy(iEnvironmentalism)
		if pPlayer:HasPolicy(iIngeniusCraft) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 75 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iIngeniusCraft)
		pPlayer:GrantPolicy(iIngeniusCraft, true)
	end
end

function NightIsNowFalling(iPlayer, iChoice)
	local pPlayer = Players[iPlayer]
	if iChoice == iPaganismChoice then
		pPlayer:RevokePolicy(iPaganism)
		pPlayer:RevokePolicy(iOrganizedReligion)
		pPlayer:RevokePolicy(iTheocracy)
		pPlayer:SetEventChoiceCooldown(iTheocracyChoice, 0)
		pPlayer:DoCancelEventChoice(iTheocracyChoice)
		pPlayer:RevokePolicy(iPacifism)
		pPlayer:RevokePolicy(iStateAtheism)
		pPlayer:RevokePolicy(iFreeReligion)
		pPlayer:RevokePolicy(iAncestorWorship)
		pPlayer:GrantPolicy(iPaganism, true)
	elseif iChoice == iOrganizedReligionChoice then
		pPlayer:RevokePolicy(iPaganism)
		if pPlayer:HasPolicy(iOrganizedReligion) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 95 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iOrganizedReligion)
		pPlayer:RevokePolicy(iTheocracy)
		pPlayer:SetEventChoiceCooldown(iTheocracyChoice, 0)
		pPlayer:DoCancelEventChoice(iTheocracyChoice)
		pPlayer:RevokePolicy(iPacifism)
		pPlayer:RevokePolicy(iStateAtheism)
		pPlayer:RevokePolicy(iFreeReligion)
		pPlayer:RevokePolicy(iAncestorWorship)
		pPlayer:GrantPolicy(iOrganizedReligion, true)
	elseif iChoice == iTheocracyChoice then
		pPlayer:RevokePolicy(iPaganism)
		pPlayer:RevokePolicy(iOrganizedReligion)
		if pPlayer:HasPolicy(iTheocracy) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 85 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iTheocracy)
		pPlayer:SetEventChoiceCooldown(iTheocracyChoice, 0)
		pPlayer:DoCancelEventChoice(iTheocracyChoice)
		pPlayer:RevokePolicy(iPacifism)
		pPlayer:RevokePolicy(iStateAtheism)
		pPlayer:RevokePolicy(iFreeReligion)
		pPlayer:RevokePolicy(iAncestorWorship)
		pPlayer:SetEventChoiceCooldown(iTheocracyChoice, iDivide)
		pPlayer:GrantPolicy(iTheocracy, true)
		if pPlayer:IsHuman() then
			pPlayer:SetEventChoiceCooldown(iTheocracyChoice, -1)
		end
	elseif iChoice == iPacifismChoice then
		pPlayer:RevokePolicy(iPaganism)
		pPlayer:RevokePolicy(iOrganizedReligion)
		pPlayer:RevokePolicy(iTheocracy)
		pPlayer:SetEventChoiceCooldown(iTheocracyChoice, 0)
		pPlayer:DoCancelEventChoice(iTheocracyChoice)
		if pPlayer:HasPolicy(iPacifism) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 65 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iPacifism)
		pPlayer:RevokePolicy(iStateAtheism)
		pPlayer:RevokePolicy(iFreeReligion)
		pPlayer:RevokePolicy(iAncestorWorship)
		pPlayer:GrantPolicy(iPacifism, true)
	elseif iChoice == iStateAtheismChoice then
		pPlayer:RevokePolicy(iPaganism)
		pPlayer:RevokePolicy(iOrganizedReligion)
		pPlayer:RevokePolicy(iTheocracy)
		pPlayer:SetEventChoiceCooldown(iTheocracyChoice, 0)
		pPlayer:DoCancelEventChoice(iTheocracyChoice)
		pPlayer:RevokePolicy(iPacifism)
		if pPlayer:HasPolicy(iStateAtheism) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 85 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iStateAtheism)
		pPlayer:RevokePolicy(iFreeReligion)
		pPlayer:RevokePolicy(iAncestorWorship)
		pPlayer:GrantPolicy(iStateAtheism, true)
	elseif iChoice == iFreeReligionChoice then
		pPlayer:RevokePolicy(iPaganism)
		pPlayer:RevokePolicy(iOrganizedReligion)
		pPlayer:RevokePolicy(iTheocracy)
		pPlayer:SetEventChoiceCooldown(iTheocracyChoice, 0)
		pPlayer:DoCancelEventChoice(iTheocracyChoice)
		pPlayer:RevokePolicy(iPacifism)
		pPlayer:RevokePolicy(iStateAtheism)
		if pPlayer:HasPolicy(iFreeReligion) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 85 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iFreeReligion)
		pPlayer:RevokePolicy(iAncestorWorship)
		pPlayer:GrantPolicy(iFreeReligion, true)
	elseif iChoice == iAncestorWorshipChoice then
		pPlayer:RevokePolicy(iPaganism)
		pPlayer:RevokePolicy(iOrganizedReligion)
		pPlayer:RevokePolicy(iTheocracy)
		pPlayer:SetEventChoiceCooldown(iTheocracyChoice, 0)
		pPlayer:DoCancelEventChoice(iTheocracyChoice)
		pPlayer:RevokePolicy(iPacifism)
		pPlayer:RevokePolicy(iStateAtheism)
		pPlayer:RevokePolicy(iFreeReligion)
		if pPlayer:HasPolicy(iAncestorWorship) then
		else
			for pCity in pPlayer:Cities() do
				if BySilverStreamsThatRunDownToTheSea(1, 100) >= 75 and pCity:GetResistanceTurns() < 2 and not pCity:IsCapital() then
					pCity:ChangeResistanceTurns(iTurn)
				end
			end
		end
		pPlayer:RevokePolicy(iAncestorWorship)
		pPlayer:GrantPolicy(iAncestorWorship, true)
	end
end

--[[function SoEndsThisDay(iPlayer, iCityID, iEvent)
	local iProduction = (BySilverStreamsThatRunDownToTheSea(20, 50)*iMod)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCityID)
	if iEvent == GameInfoTypes.CITY_EVENT_DESPOTISM1 then
		pCity:SetOverflowProduction(pCity:GetOverflowProduction() + iDelta)
	end
end]]

function TheRoadIsNowCalling(iFromPlayer, iFromCity, iToPlayer, iToCity, iDomain, iConnectionType)
	local pFromPlayer = Players[iFromPlayer]
	local pToPlayer = Players[iToPlayer]
	if pFromPlayer:HasPolicy(iMercantilism) then 
		if (pFromPlayer == pToPlayer) or (pToPlayer:IsMinorCiv() and pToPlayer:IsAllies(iFromPlayer)) or (Teams[pToPlayer:GetTeam()]:IsVassal(pFromPlayer:GetTeam())) or (Teams[pFromPlayer:GetTeam()]:IsVassal(pToPlayer:GetTeam())) then
			return true
		else
			return false
		end
	end
	return true
end

function AndIMustAway(iPlayer, iUnit, iPlotX, iPlotY)
	local pPlot = Map.GetPlot(iPlotX, iPlotY)
	local pUnitReligion = Players[iPlayer]:GetUnitByID(iUnit):GetReligion()
	local pPlayer2 = Players[iPlayer]
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
		if pAdjacentPlot and pAdjacentPlot:IsCity() then
			local pCity = pAdjacentPlot:GetPlotCity()
			local pPlayer = Players[pCity:GetOwner()]
			if pPlayer:HasPolicy(iTheocracy) and pPlayer:GetMajorityReligion() ~= pUnitReligion then
				return false
			end
		end
	end
	--[[if pPlayer2:HasPolicy(iStateAtheism) then
		return false
	end]]
	return true
end

--[[function OverHillAndUnderTree(iPlayer, iUnit, iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]
	if pPlayer:HasPolicy(iStateAtheism) then
		return false
	end
	return true
end]]

function ThroughLandsWhereNeverLightHasShone(playerID, _, info, tChoiceOverrideStrings)
	--local iProduction = (BySilverStreamsThatRunDownToTheSea(20, 50)*iMod)
    if info.Type == "PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_1" then
        table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_GOVERNMENTCIVIC_CHOICE_1_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.1)})
	elseif info.Type == "PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_2" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_GOVERNMENTCIVIC_CHOICE_2_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.1)})
	elseif info.Type == "PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_3" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_GOVERNMENTCIVIC_CHOICE_3_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.15)})
	elseif info.Type == "PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_4" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_GOVERNMENTCIVIC_CHOICE_4_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.15)})
	elseif info.Type == "PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_5" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_GOVERNMENTCIVIC_CHOICE_5_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.2)})
	elseif info.Type == "PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_6" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_GOVERNMENTCIVIC_CHOICE_6_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.2)})
	elseif info.Type == "PLAYER_EVENT_GOVERNMENTCIVIC_CHOICE_7" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_GOVERNMENTCIVIC_CHOICE_7_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.1)})
	elseif info.Type == "PLAYER_EVENT_LEGALCIVIC_CHOICE_1" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LEGALCIVIC_CHOICE_1_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.09)})
	elseif info.Type == "PLAYER_EVENT_LEGALCIVIC_CHOICE_2" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LEGALCIVIC_CHOICE_2_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.09)})
	elseif info.Type == "PLAYER_EVENT_LEGALCIVIC_CHOICE_3" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LEGALCIVIC_CHOICE_3_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.19, Players[playerID]:GetBaseUnitMaintenance()*0.35)})
	elseif info.Type == "PLAYER_EVENT_LEGALCIVIC_CHOICE_4" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LEGALCIVIC_CHOICE_4_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.19)})
	elseif info.Type == "PLAYER_EVENT_LEGALCIVIC_CHOICE_6" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LEGALCIVIC_CHOICE_6_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.14)})
	elseif info.Type == "PLAYER_EVENT_LEGALCIVIC_CHOICE_7" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LEGALCIVIC_CHOICE_7_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.19)})
	elseif info.Type == "PLAYER_EVENT_LABORCIVIC_CHOICE_1" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LABORCIVIC_CHOICE_1_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.08)})
	elseif info.Type == "PLAYER_EVENT_LABORCIVIC_CHOICE_2" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LABORCIVIC_CHOICE_2_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.13)})
	elseif info.Type == "PLAYER_EVENT_LABORCIVIC_CHOICE_3" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LABORCIVIC_CHOICE_3_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.08)})
	elseif info.Type == "PLAYER_EVENT_LABORCIVIC_CHOICE_4" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LABORCIVIC_CHOICE_4_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.13)})
	elseif info.Type == "PLAYER_EVENT_LABORCIVIC_CHOICE_5" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LABORCIVIC_CHOICE_5_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.18)})
	elseif info.Type == "PLAYER_EVENT_LABORCIVIC_CHOICE_6" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LABORCIVIC_CHOICE_6_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.08)})
	elseif info.Type == "PLAYER_EVENT_LABORCIVIC_CHOICE_7" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_LABORCIVIC_CHOICE_7_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.18)})
	elseif info.Type == "PLAYER_EVENT_ECONOMYCIVIC_CHOICE_1" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_ECONOMYCIVIC_CHOICE_1_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.07)})
	elseif info.Type == "PLAYER_EVENT_ECONOMYCIVIC_CHOICE_2" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_ECONOMYCIVIC_CHOICE_2_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.12)})
	elseif info.Type == "PLAYER_EVENT_ECONOMYCIVIC_CHOICE_3" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_ECONOMYCIVIC_CHOICE_3_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.12)})
	elseif info.Type == "PLAYER_EVENT_ECONOMYCIVIC_CHOICE_4" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_ECONOMYCIVIC_CHOICE_4_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.12)})
	elseif info.Type == "PLAYER_EVENT_ECONOMYCIVIC_CHOICE_5" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_ECONOMYCIVIC_CHOICE_5_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.17)})
	elseif info.Type == "PLAYER_EVENT_ECONOMYCIVIC_CHOICE_6" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_ECONOMYCIVIC_CHOICE_6_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.17)})
	elseif info.Type == "PLAYER_EVENT_ECONOMYCIVIC_CHOICE_7" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_ECONOMYCIVIC_CHOICE_7_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.07)})
	elseif info.Type == "PLAYER_EVENT_RELIGIONCIVIC_CHOICE_1" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_RELIGIONCIVIC_CHOICE_1_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.06)})
	elseif info.Type == "PLAYER_EVENT_RELIGIONCIVIC_CHOICE_2" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_RELIGIONCIVIC_CHOICE_2_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.16)})
	elseif info.Type == "PLAYER_EVENT_RELIGIONCIVIC_CHOICE_3" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_RELIGIONCIVIC_CHOICE_3_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.11)})
	elseif info.Type == "PLAYER_EVENT_RELIGIONCIVIC_CHOICE_4" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_RELIGIONCIVIC_CHOICE_4_HELP", Players[playerID]:GetBaseUnitMaintenance())})
	elseif info.Type == "PLAYER_EVENT_RELIGIONCIVIC_CHOICE_5" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_RELIGIONCIVIC_CHOICE_5_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.11)})
	elseif info.Type == "PLAYER_EVENT_RELIGIONCIVIC_CHOICE_6" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_RELIGIONCIVIC_CHOICE_6_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.11)})
	elseif info.Type == "PLAYER_EVENT_RELIGIONCIVIC_CHOICE_7" then
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = Locale.ConvertTextKey("TXT_KEY_EVENT_RELIGIONCIVIC_CHOICE_7_HELP", Players[playerID]:GetBaseBuildingMaintenance()*0.06)})
    end
end

function BySilverStreamsThatRunDownToTheSea(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

function UnderCloudBeneathTheStars(iTeam, iTech, iChange)
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pPlayer = Players[iPlayer]
		if (pPlayer ~= nil and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian()) then
			if (pPlayer:GetTeam() == iTeam) then
				if (iTech == GameInfoTypes.TECH_ARCHERY) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new government civic!", "Hereditary Rule Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
						--LuaEvents.VP_AdvisorDisplayShow(GameInfo.CustomTutorials["CIVIC_HEREDITARY_RULE"], iPlayer)
					end
				elseif (iTech == GameInfoTypes.TECH_EDUCATION) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new government civic!", "Patronage Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_CHIVALRY) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new legal civic!", "Feudalism Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_RIFLING) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new government civic!", "Totalitarianism Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_PRINTING_PRESS) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new government civic!", "Representation Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_MILITARY_SCIENCE) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new legal civic!", "Nationhood Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_ATOMIC_THEORY) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new government civic!", "National Suffrage Suffrage Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_MATHEMATICS) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new legal civic!", "Codified Law Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_PHYSICS) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new legal civic!", "Bureaucracy Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_CIVIL_SERVICE) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new labor civic!", "Manorialism Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_RADIO) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new legal civic!", "Free Speech Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_BRONZE_WORKING) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new labor civic!", "Slavery Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_GUILDS) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new labor civic!", "Caste System Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_CURRENCY) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new economy civic!", "Commercialism Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_INDUSTRIALIZATION) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new labor civic!", "Industrial Servitude Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_GLOBALIZATION) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new labor civic!", "Emancipation Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_ECONOMICS) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new economy civic!", "Free Market Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_SCIENTIFIC_THEORY) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new economy civic!", "State Property Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_CORPORATIONS) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new economy civic!", "Corporatism Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_ECOLOGY) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new economy civic!", "Environmentalism Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_PHILOSOPHY) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new religion civic!", "Organized Faith Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_THEOLOGY) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new religion civic!", "Theocracy Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_BIOLOGY) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new religion civic!", "Pacifism Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_FLIGHT) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new religion civic!", "Celebrity Worship Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_PENICILIN) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new religion civic!", "Free Religion Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_WRITING) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new government civic!", "Confederation Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_TELECOM) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new legal civic!", "Constituionalism Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_ELECTRICITY) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new labor civic!", "Unionism Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_HORSEBACK_RIDING) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new economy civic!", "Decentralization Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				elseif (iTech == GameInfoTypes.TECH_CALENDAR) then
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You have unlocked a new religion civic!", "Ancestor Veneration Unlocked!", pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
					end
				end
			end
		end
	end
end

--[[function OverSnowOneWinterMorn(iDiploModifier, iFromPlayer, iToPlayer)
	local iFromPlayerID = Players[iFromPlayer]
	local iToPlayerID = Players[iToPlayer]
	local iModifier = 0
	if (iDiploModifier == GameInfoTypes.DIPLOMODIFIER_CIVIC_SAME) then
		if iToPlayerID:HasPolicy(iDepotism) and iFromPlayerID:HasPolicy(iDepotism) then
			iModifier = iModifier - 1
		elseif iToPlayerID:HasPolicy(iHereditaryRule) and iFromPlayerID:HasPolicy(iHereditaryRule) then
			iModifier = iModifier - 5
		elseif iToPlayerID:HasPolicy(iPatronage) and iFromPlayerID:HasPolicy(iPatronage) then
			iModifier = iModifier - 3
		elseif iToPlayerID:HasPolicy(iRepresentation) and iFromPlayerID:HasPolicy(iRepresentation) then
			iModifier = iModifier - 3
		elseif iToPlayerID:HasPolicy(iPoliceState) and iFromPlayerID:HasPolicy(iPoliceState) then
			iModifier = iModifier - 3
		elseif iToPlayerID:HasPolicy(iUniversalSuffrage) and iFromPlayerID:HasPolicy(iUniversalSuffrage) then
			iModifier = iModifier - 7
		elseif iToPlayerID:HasPolicy(iConfederation) and iFromPlayerID:HasPolicy(iConfederation) then
			iModifier = iModifier - 3
		end
		if iToPlayerID:HasPolicy(iBarbarism) and iFromPlayerID:HasPolicy(iBarbarism) then
			iModifier = iModifier - 1
		elseif iToPlayerID:HasPolicy(iCivilLaw) and iFromPlayerID:HasPolicy(iCivilLaw) then
			iModifier = iModifier - 3
		elseif iToPlayerID:HasPolicy(iVassalage) and iFromPlayerID:HasPolicy(iVassalage) then
			iModifier = iModifier - 7
		elseif iToPlayerID:HasPolicy(iBureaucracy) and iFromPlayerID:HasPolicy(iBureaucracy) then
			iModifier = iModifier - 3
		elseif iToPlayerID:HasPolicy(iNationhood) and iFromPlayerID:HasPolicy(iNationhood) then
			iModifier = iModifier - 3
		elseif iToPlayerID:HasPolicy(iFreeSpeech) and iFromPlayerID:HasPolicy(iFreeSpeech) then
			iModifier = iModifier - 5
		elseif iToPlayerID:HasPolicy(iConstutionalism) and iFromPlayerID:HasPolicy(iConstutionalism) then
			iModifier = iModifier - 7
		end
		if iToPlayerID:HasPolicy(iTribalism) and iFromPlayerID:HasPolicy(iTribalism) then
			iModifier = iModifier - 1
		elseif iToPlayerID:HasPolicy(iSlavery) and iFromPlayerID:HasPolicy(iSlavery) then
			iModifier = iModifier - 5
		elseif iToPlayerID:HasPolicy(iSerfdom) and iFromPlayerID:HasPolicy(iSerfdom) then
			iModifier = iModifier - 3
		elseif iToPlayerID:HasPolicy(iCasteSystem) and iFromPlayerID:HasPolicy(iCasteSystem) then
			iModifier = iModifier - 5
		elseif iToPlayerID:HasPolicy(iIndustrializedServitude) and iFromPlayerID:HasPolicy(iIndustrializedServitude) then
			iModifier = iModifier - 3
		elseif iToPlayerID:HasPolicy(iEmancipation) and iFromPlayerID:HasPolicy(iEmancipation) then
			iModifier = iModifier - 7
		elseif iToPlayerID:HasPolicy(iMechanization) and iFromPlayerID:HasPolicy(iMechanization) then
			iModifier = iModifier - 3
		end
		if iToPlayerID:HasPolicy(iDecentralization) and iFromPlayerID:HasPolicy(iDecentralization) then
			iModifier = iModifier - 1
		elseif iToPlayerID:HasPolicy(iMercantilism) and iFromPlayerID:HasPolicy(iMercantilism) then
			iModifier = iModifier - 5
		elseif iToPlayerID:HasPolicy(iFreeMarket) and iFromPlayerID:HasPolicy(iFreeMarket) then
			iModifier = iModifier - 3
		elseif iToPlayerID:HasPolicy(iStateProperty) and iFromPlayerID:HasPolicy(iStateProperty) then
			iModifier = iModifier - 5
		elseif iToPlayerID:HasPolicy(iCorporatism) and iFromPlayerID:HasPolicy(iCorporatism) then
			iModifier = iModifier - 5
		elseif iToPlayerID:HasPolicy(iEnvironmentalism) and iFromPlayerID:HasPolicy(iEnvironmentalism) then
			iModifier = iModifier - 7
		elseif iToPlayerID:HasPolicy(iIngeniusCraft) and iFromPlayerID:HasPolicy(iIngeniusCraft) then
			iModifier = iModifier - 3
		end
		if iToPlayerID:HasPolicy(iPaganism) and iFromPlayerID:HasPolicy(iPaganism) then
			iModifier = iModifier - 1
		elseif iToPlayerID:HasPolicy(iOrganizedReligion) and iFromPlayerID:HasPolicy(iOrganizedReligion) then
			iModifier = iModifier - 3
		elseif iToPlayerID:HasPolicy(iTheocracy) and iFromPlayerID:HasPolicy(iTheocracy) then
			iModifier = iModifier - 5
		elseif iToPlayerID:HasPolicy(iPacifism) and iFromPlayerID:HasPolicy(iPacifism) then
			iModifier = iModifier - 7
		elseif iToPlayerID:HasPolicy(iStateAtheism) and iFromPlayerID:HasPolicy(iStateAtheism) then
			iModifier = iModifier - 5
		elseif iToPlayerID:HasPolicy(iFreeReligion) and iFromPlayerID:HasPolicy(iFreeReligion) then
			iModifier = iModifier - 5
		elseif iToPlayerID:HasPolicy(iAncestorWorship) and iFromPlayerID:HasPolicy(iAncestorWorship) then
			iModifier = iModifier - 5
		end
	end
	return iModifier
end

function ITurnAtLastToPathsThatLeadHome(iDiploModifier, iFromPlayer, iToPlayer)
	local iFromPlayerID = Players[iFromPlayer]
	local iToPlayerID = Players[iToPlayer]
	local iModifier = 0
	if (iDiploModifier == GameInfoTypes.DIPLOMODIFIER_CIVIC_DIFFERENCE) then
		if iToPlayerID:HasPolicy(iDepotism) and not iFromPlayerID:HasPolicy(iDepotism) then
			iModifier = iModifier + 1
		elseif iToPlayerID:HasPolicy(iHereditaryRule) and not iFromPlayerID:HasPolicy(iHereditaryRule) then
			iModifier = iModifier + 5
		elseif iToPlayerID:HasPolicy(iPatronage) and not iFromPlayerID:HasPolicy(iPatronage) then
			iModifier = iModifier + 5
		elseif iToPlayerID:HasPolicy(iRepresentation) and not iFromPlayerID:HasPolicy(iRepresentation) then
			iModifier = iModifier + 3
		elseif iToPlayerID:HasPolicy(iPoliceState) and not iFromPlayerID:HasPolicy(iPoliceState) then
			iModifier = iModifier + 7
		elseif iToPlayerID:HasPolicy(iUniversalSuffrage) and not iFromPlayerID:HasPolicy(iUniversalSuffrage) then
			iModifier = iModifier + 5
		elseif iToPlayerID:HasPolicy(iConfederation) and not iFromPlayerID:HasPolicy(iConfederation) then
			iModifier = iModifier + 3
		end
		if iToPlayerID:HasPolicy(iBarbarism) and not iFromPlayerID:HasPolicy(iBarbarism) then
			iModifier = iModifier + 1
		elseif iToPlayerID:HasPolicy(iCivilLaw) and not iFromPlayerID:HasPolicy(iCivilLaw) then
			iModifier = iModifier + 3
		elseif iToPlayerID:HasPolicy(iVassalage) and not iFromPlayerID:HasPolicy(iVassalage) then
			iModifier = iModifier + 5
		elseif iToPlayerID:HasPolicy(iBureaucracy) and not iFromPlayerID:HasPolicy(iBureaucracy) then
			iModifier = iModifier + 3
		elseif iToPlayerID:HasPolicy(iNationhood) and not iFromPlayerID:HasPolicy(iNationhood) then
			iModifier = iModifier + 7
		elseif iToPlayerID:HasPolicy(iFreeSpeech) and not iFromPlayerID:HasPolicy(iFreeSpeech) then
			iModifier = iModifier + 5
		elseif iToPlayerID:HasPolicy(iConstutionalism) and not iFromPlayerID:HasPolicy(iConstutionalism) then
			iModifier = iModifier + 5
		end
		if iToPlayerID:HasPolicy(iTribalism) and not iFromPlayerID:HasPolicy(iTribalism) then
			iModifier = iModifier + 1
		elseif iToPlayerID:HasPolicy(iSlavery) and not iFromPlayerID:HasPolicy(iSlavery) then
			iModifier = iModifier + 7
		elseif iToPlayerID:HasPolicy(iSerfdom) and not iFromPlayerID:HasPolicy(iSerfdom) then
			iModifier = iModifier + 5
		elseif iToPlayerID:HasPolicy(iCasteSystem) and not iFromPlayerID:HasPolicy(iCasteSystem) then
			iModifier = iModifier + 5
		elseif iToPlayerID:HasPolicy(iIndustrializedServitude) and not iFromPlayerID:HasPolicy(iIndustrializedServitude) then
			iModifier = iModifier + 5
		elseif iToPlayerID:HasPolicy(iEmancipation) and not iFromPlayerID:HasPolicy(iEmancipation) then
			iModifier = iModifier + 7
		elseif iToPlayerID:HasPolicy(iMechanization) and not iFromPlayerID:HasPolicy(iMechanization) then
			iModifier = iModifier + 3
		end
		if iToPlayerID:HasPolicy(iDecentralization) and not iFromPlayerID:HasPolicy(iDecentralization) then
			iModifier = iModifier + 1
		elseif iToPlayerID:HasPolicy(iMercantilism) and not iFromPlayerID:HasPolicy(iMercantilism) then
			iModifier = iModifier + 5
		elseif iToPlayerID:HasPolicy(iFreeMarket) and not iFromPlayerID:HasPolicy(iFreeMarket) then
			iModifier = iModifier + 3
		elseif iToPlayerID:HasPolicy(iStateProperty) and not iFromPlayerID:HasPolicy(iStateProperty) then
			iModifier = iModifier + 7
		elseif iToPlayerID:HasPolicy(iCorporatism) and not iFromPlayerID:HasPolicy(iCorporatism) then
			iModifier = iModifier + 7
		elseif iToPlayerID:HasPolicy(iEnvironmentalism) and not iFromPlayerID:HasPolicy(iEnvironmentalism) then
			iModifier = iModifier + 7
		elseif iToPlayerID:HasPolicy(iIngeniusCraft) and not iFromPlayerID:HasPolicy(iIngeniusCraft) then
			iModifier = iModifier + 3
		end
		if iToPlayerID:HasPolicy(iPaganism) and not iFromPlayerID:HasPolicy(iPaganism) then
			iModifier = iModifier + 1
		elseif iToPlayerID:HasPolicy(iOrganizedReligion) and not iFromPlayerID:HasPolicy(iOrganizedReligion) then
			iModifier = iModifier + 3
		elseif iToPlayerID:HasPolicy(iTheocracy) and not iFromPlayerID:HasPolicy(iTheocracy) then
			iModifier = iModifier + 5
		elseif iToPlayerID:HasPolicy(iPacifism) and not iFromPlayerID:HasPolicy(iPacifism) then
			iModifier = iModifier + 3
		elseif iToPlayerID:HasPolicy(iStateAtheism) and not iFromPlayerID:HasPolicy(iStateAtheism) then
			iModifier = iModifier + 5
		elseif iToPlayerID:HasPolicy(iFreeReligion) and not iFromPlayerID:HasPolicy(iFreeReligion) then
			iModifier = iModifier + 5
		elseif iToPlayerID:HasPolicy(iAncestorWorship) and not iFromPlayerID:HasPolicy(iAncestorWorship) then
			iModifier = iModifier + 3
		end
	end
	return iModifier
end]]

function OverSnowOneWinterMornITurnAtLastToPathsThatLeadHome(iDiploModifier, iFromPlayer, iToPlayer)
	local iFromPlayerID = Players[iFromPlayer]
	local iToPlayerID = Players[iToPlayer]
	local iModifier = 0
	if (iDiploModifier == GameInfoTypes.DIPLOMODIFIER_CIVIC_DIFFERENCE) then
		if iToPlayerID:HasPolicy(iDepotism) then
			if (iFromPlayerID:HasPolicy(iDepotism)) then
				iModifier = iModifier - 1
			else
				iModifier = iModifier + 1
			end
		elseif iToPlayerID:HasPolicy(iHereditaryRule) then
			if (iFromPlayerID:HasPolicy(iHereditaryRule)) then
				iModifier = iModifier - 5
			else
				iModifier = iModifier + 5
			end
		elseif iToPlayerID:HasPolicy(iPatronage) then
			if (iFromPlayerID:HasPolicy(iPatronage)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 5
			end
		elseif iToPlayerID:HasPolicy(iRepresentation) then
			if (iFromPlayerID:HasPolicy(iRepresentation)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 3
			end
		elseif iToPlayerID:HasPolicy(iPoliceState) then
			if (iFromPlayerID:HasPolicy(iPoliceState)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 7
			end
		elseif iToPlayerID:HasPolicy(iUniversalSuffrage) then
			if (iFromPlayerID:HasPolicy(iUniversalSuffrage)) then
				iModifier = iModifier - 7
			else
				iModifier = iModifier + 5
			end
		elseif iToPlayerID:HasPolicy(iConfederation) then
			if (iFromPlayerID:HasPolicy(iConfederation)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 3
			end
		end
		if iToPlayerID:HasPolicy(iBarbarism) then
			if (iFromPlayerID:HasPolicy(iBarbarism)) then
				iModifier = iModifier - 1
			else
				iModifier = iModifier + 1
			end
		elseif iToPlayerID:HasPolicy(iCivilLaw) then
			if (iFromPlayerID:HasPolicy(iCivilLaw)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 3
			end
		elseif iToPlayerID:HasPolicy(iVassalage) then
			if (iFromPlayerID:HasPolicy(iVassalage)) then
				iModifier = iModifier - 7
			else
				iModifier = iModifier + 5
			end
		elseif iToPlayerID:HasPolicy(iBureaucracy) then
			if (iFromPlayerID:HasPolicy(iBureaucracy)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 3
			end
		elseif iToPlayerID:HasPolicy(iNationhood) then
			if (iFromPlayerID:HasPolicy(iNationhood)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 7
			end
		elseif iToPlayerID:HasPolicy(iFreeSpeech) then
			if (iFromPlayerID:HasPolicy(iFreeSpeech)) then
				iModifier = iModifier - 5
			else
				iModifier = iModifier + 5
			end
		elseif iToPlayerID:HasPolicy(iConstutionalism) then
			if (iFromPlayerID:HasPolicy(iConstutionalism)) then
				iModifier = iModifier - 7
			else
				iModifier = iModifier + 5
			end
		end
		if iToPlayerID:HasPolicy(iTribalism) then
			if (iFromPlayerID:HasPolicy(iTribalism)) then
				iModifier = iModifier - 1
			else
				iModifier = iModifier + 1
			end
		elseif iToPlayerID:HasPolicy(iSlavery) then
			
			if (iFromPlayerID:HasPolicy(iSlavery)) then
				iModifier = iModifier - 5
			else
				iModifier = iModifier + 7
			end
		elseif iToPlayerID:HasPolicy(iSerfdom) then
			
			if (iFromPlayerID:HasPolicy(iSerfdom)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 5
			end
		elseif iToPlayerID:HasPolicy(iCasteSystem) then
			if (iFromPlayerID:HasPolicy(iCasteSystem)) then
				iModifier = iModifier - 5
			else
				iModifier = iModifier + 5
			end
		elseif iToPlayerID:HasPolicy(iIndustrializedServitude) then
			if (iFromPlayerID:HasPolicy(iIndustrializedServitude)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 5
			end
		elseif iToPlayerID:HasPolicy(iEmancipation) then
			if (iFromPlayerID:HasPolicy(iEmancipation)) then
				iModifier = iModifier - 7
			else
				iModifier = iModifier + 7
			end
		elseif iToPlayerID:HasPolicy(iMechanization) then
			if (iFromPlayerID:HasPolicy(iMechanization)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 3
			end
		end
		if iToPlayerID:HasPolicy(iDecentralization) then
			if (iFromPlayerID:HasPolicy(iDecentralization)) then
				iModifier = iModifier - 1
			else
				iModifier = iModifier + 1
			end
		elseif iToPlayerID:HasPolicy(iMercantilism) then
			
			if (iFromPlayerID:HasPolicy(iMercantilism)) then
				iModifier = iModifier - 5
			else
				iModifier = iModifier + 5
			end
		elseif iToPlayerID:HasPolicy(iFreeMarket) then
			
			if (iFromPlayerID:HasPolicy(iFreeMarket)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 3
			end
		elseif iToPlayerID:HasPolicy(iStateProperty) then
			
			if (iFromPlayerID:HasPolicy(iStateProperty)) then
				iModifier = iModifier - 5
			else
				iModifier = iModifier + 7
			end
		elseif iToPlayerID:HasPolicy(iCorporatism) then
			
			if (iFromPlayerID:HasPolicy(iCorporatism)) then
				iModifier = iModifier - 5
			else
				iModifier = iModifier + 7
			end
		elseif iToPlayerID:HasPolicy(iEnvironmentalism) then
			
			if (iFromPlayerID:HasPolicy(iEnvironmentalism)) then
				iModifier = iModifier - 7
			else
				iModifier = iModifier + 7
			end
		elseif iToPlayerID:HasPolicy(iIngeniusCraft) then
			if (iFromPlayerID:HasPolicy(iIngeniusCraft)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 3
			end
		end
		if iToPlayerID:HasPolicy(iPaganism) then
			if (iFromPlayerID:HasPolicy(iPaganism)) then
				iModifier = iModifier - 1
			else
				iModifier = iModifier + 1
			end
		elseif iToPlayerID:HasPolicy(iOrganizedReligion) then
			if (iFromPlayerID:HasPolicy(iOrganizedReligion)) then
				iModifier = iModifier - 3
			else
				iModifier = iModifier + 3
			end
		elseif iToPlayerID:HasPolicy(iTheocracy) then
			iModifier = iModifier + 5
			if (iFromPlayerID:HasPolicy(iTheocracy)) then
				iModifier = iModifier - 5
			else
				iModifier = iModifier + 5
			end
		elseif iToPlayerID:HasPolicy(iPacifism) then
			iModifier = iModifier + 3
			if (iFromPlayerID:HasPolicy(iPacifism)) then
				iModifier = iModifier - 7
			else
				iModifier = iModifier + 3
			end
		elseif iToPlayerID:HasPolicy(iStateAtheism) then
			iModifier = iModifier + 5
			if (iFromPlayerID:HasPolicy(iStateAtheism)) then
				iModifier = iModifier - 5
			else
				iModifier = iModifier + 5
			end
		elseif iToPlayerID:HasPolicy(iFreeReligion) then
			if (iFromPlayerID:HasPolicy(iFreeReligion)) then
				iModifier = iModifier - 5
			else
				iModifier = iModifier + 5
			end
		elseif iToPlayerID:HasPolicy(iAncestorWorship) then
			if (iFromPlayerID:HasPolicy(iAncestorWorship)) then
				iModifier = iModifier - 5
			else
				iModifier = iModifier + 3
			end
		end
	end
	return iModifier
end

function WhenIWasABoy(iPlayer, iChoice)
	if iChoice == iNope or iChoice == iNope2 or iChoice == iNope3 or iChoice == iNope4 or iChoice == iNope5 then
		if not Players[iPlayer]:IsHuman() then
			return false
		end
	end
	return true
end

function IHadADream(iPlayer, iChoice)
	if iChoice == iCorporatismChoice then
		if Players[iPlayer]:GetCorporation() == -1 then
			return false
		end
	elseif iChoice == iStatePropertyChoice then
		if Players[iPlayer]:GetCorporation() == -1 then
			return false
		end
	elseif iChoice == iOrganizedReligionChoice then
		if Players[iPlayer]:GetMajorityReligion() ~= -1 then
			local beliefs = Game.GetBeliefsInReligion(Players[iPlayer]:GetMajorityReligion())
			for _,beliefID in pairs( beliefs or {} ) do
				if (GameInfo.Beliefs[beliefID].Enhancer) or (GameInfo.Beliefs[beliefID].Reformation) then
					return true
				end
			end
			return false
		else
			return false
		end
	elseif iChoice == iTheocracyChoice then
		if Players[iPlayer]:GetMajorityReligion() == -1 then
			return false
		end
	end
	return true
end

GameEvents.EventChoiceCanTake.Add(WhenIWasABoy)
GameEvents.PlayerDoTurn.Add(ISawTheLightFadeFromTheSky)
GameEvents.EventChoiceActivated.Add(OnTheWindIHeardASigh)
GameEvents.EventChoiceActivated.Add(AsTheSnowflakesCover)
GameEvents.EventChoiceActivated.Add(MyFallenBrothers)
GameEvents.EventChoiceActivated.Add(IWillSayThisLastGoodbye)
GameEvents.EventChoiceActivated.Add(NightIsNowFalling)
--GameEvents.CityEventActivated.Add(SoEndsThisDay)
GameEvents.PlayerCanCreateTradeRoute.Add(TheRoadIsNowCalling)
--GameEvents.PlayerCanSpreadReligion.Add(AndIMustAway)
--GameEvents.PlayerCanRemoveHeresy.Add(OverHillAndUnderTree)
LuaEvents.EventChoice_OverrideTextStrings.Add(ThroughLandsWhereNeverLightHasShone)
GameEvents.TeamTechResearched.Add(UnderCloudBeneathTheStars)
GameEvents.GetDiploModifier.Add(OverSnowOneWinterMorn)
GameEvents.GetDiploModifier.Add(ITurnAtLastToPathsThatLeadHome)
GameEvents.GetDiploModifier.Add(OverSnowOneWinterMornITurnAtLastToPathsThatLeadHome)
GameEvents.UnitCityFounded.Add(ASpringCleaning)
GameEvents.CityCaptureComplete.Add(AnAutumnBlessing)

function InitialCivics()
	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local pPlayer = Players[iPlayerLoop]
		if (pPlayer:IsAlive()) then
			pPlayer:GrantPolicy(iDepotism, true)
			pPlayer:GrantPolicy(iBarbarism, true)
			pPlayer:GrantPolicy(iTribalism, true)
			pPlayer:GrantPolicy(iDecentralization, true)
			pPlayer:GrantPolicy(iPaganism, true)
			--if pPlayer:IsHuman() then
				--LuaEvents.VP_AdvisorDisplayShow(GameInfo.CustomTutorials["TUTORIAL_VP_CIVICS"], iPlayerLoop)
			--end
		end
	end
end

--There's probably a bug here for the Player only... that fixing it would just increase performance for some super super super niche case.. UGH!
function CapitalForRealForReal(pPlayer)
	if pPlayer:HasPolicy(iPatronage) or pPlayer:HasPolicy(iBureaucracy) or pPlayer:HasPolicy(iNationhood) then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_PATRONAGE, 0)
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_BUREAUCRACYCIVIC, 0)
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_NATIONHOOD, 0)
		end
	end
end

if (Modding.OpenSaveData().GetValue("CivicComplete") == nil) then
	InitialCivics()
	Modding.OpenSaveData().SetValue("CivicComplete", 1)
end

for _, mod in pairs(Modding.GetActivatedMods()) do
	if (mod.ID == "8411a7a8-dad3-4622-a18e-fcc18324c799") then
		GameEvents.EventChoiceCanTake.Add(IHadADream)
	end
end