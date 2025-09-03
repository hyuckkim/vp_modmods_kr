
local eCivilizationChina = GameInfoTypes.CIVILIZATION_CHINA
local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldenAgePercent / 100
local iUADummy = GameInfoTypes.BUILDING_CHINA_8_DUMMY

include("FLuaVector.lua")
---------------------------------------------
--Adds a dummy building whenever city population grows and the WLTED/yield bonus on 
---------------------------------------------
function OnBirthAddUADummy(iX, iY, iOld, iNew)
	if not (iNew > iOld) then return end
	if iOld < 0 then return end

	local pPlot = Map.GetPlot(iX, iY)
	if not pPlot then return end
	
	local pPlayer = Players[pPlot:GetOwner()]
	if (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationChina)) then 
		print("China Growth")
		
		local pCapital = pPlayer:GetCapitalCity()
		local iGrowthDummy = GameInfoTypes.BUILDING_CHINA_GROWTH_DUMMY
		--First population is added before a capital is assigned, so founding your 1st city fails to add a growth
		--To compensate, add 2 dummies on your 1st growth
		local eNumGrowths = pCapital:GetNumRealBuilding(iGrowthDummy)
		if eNumGrowths == 0 then
			pCapital:SetNumRealBuilding(iGrowthDummy, (eNumGrowths + 2))
		else
			pCapital:SetNumRealBuilding(iGrowthDummy, (eNumGrowths + 1))
		end
		local eNumGrowths2 = pCapital:GetNumRealBuilding(iGrowthDummy)

		if (eNumGrowths2/8 == math.floor(eNumGrowths2/8)) then
			local pCapital = pPlayer:GetCapitalCity()
			local iNumUABoosts = pCapital:GetNumRealBuilding(iUADummy)
			pCapital:SetNumRealBuilding(iUADummy, (iNumUABoosts + 1))
			
			for city in pPlayer:Cities() do
				local iWLTKDLength = math.floor(5 * fGameSpeedModifier)
				
				city:ChangeWeLoveTheKingDayCounter(iWLTKDLength)
			end

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local pCity = pPlot:GetPlotCity()
				local sName = pCity:GetName()
					
				pPlayer:AddNotification(0, 
					'The City of [COLOR_POSITIVE_TEXT]'..sName..'[ENDCOLOR] Has grown and the nation prospers. +2 [ICON_FOOD] Food and a We Love the Empress Day has started in every city across the Empire.', 
					'Mandate of Heaven', 
					pCity:GetX(), pCity:GetY())
			end
		end
	end
end
---------------------------------------------
--Removes half of the dummy buildings for the UA and UB's powers
---------------------------------------------
function UAEraDecline(eTeam, eEra, bFirst)
	for id, pPlayer in pairs(Players) do
		if pPlayer:IsEverAlive() and pPlayer:GetTeam() == eTeam and pPlayer:GetCivilizationType() == eCivilizationChina then
			local pCapital = pPlayer:GetCapitalCity()
			local iUADecay = math.ceil(pCapital:GetNumRealBuilding(iUADummy) / 2)
			pCapital:SetNumRealBuilding(iUADummy, iUADecay)
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end
---------------------------------------------
--China components activations
---------------------------------------------
if Game.IsCivEverActive(eCivilizationChina) then
	GameEvents.SetPopulation.Add(OnBirthAddUADummy)
	GameEvents.TeamSetEra.Add(UAEraDecline)
end
