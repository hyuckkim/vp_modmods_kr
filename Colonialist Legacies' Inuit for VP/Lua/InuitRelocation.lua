-- StartOnSnow
-- Author: Neirai and LastSword (if it looks good, it's LastSword)
-- DateCreated: 1/28/2014 8:37:41 PM
--------------------------------------------------------------
function UsingMUCfVP()
	local isUsingMUCfVP = false

	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == "259c3593-34dd-4fdd-bd7d-8ed67cc0797c") then
			isUsingMUCfVP = true
			break
		end
    end
	return isUsingMUCfVP
end

function ReplaceInuitUnit()
	if UsingMUCfVP == false then return end
	
	if Game:GetGameTurn() == 0 then
		for i, possibleInuit in pairs(Players) do
			if possibleInuit:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLINUIT then
				local iNumberOfDoggies = 0
				for pUnit in possibleInuit:Units() do 
					if pUnit:GetUnitType() == GameInfoTypes.UNIT_SHOSHONE_PATHFINDER then

						local pPlot = pUnit:GetPlot()
						local iX, iY = pPlot:GetX(), pPlot:GetY()
						pUnit:Kill(true, -1)
						possibleInuit:InitUnit(GameInfoTypes.UNIT_CLINUIT_QAMUTIIK, iX, iY, -1, DirectionTypes.NO_DIRECTION, false)
					end
				end
				for qUnit in possibleInuit:Units() do
					if qUnit:GetUnitType() == GameInfoTypes.UNIT_CLINUIT_QAMUTIIK then
						iNumberOfDoggies = iNumberOfDoggies + 1
					end
				end
				
				if iNumberOfDoggies == 2 then
					for rUnit in possibleInuit:Units() do
						if rUnit:GetUnitType() == GameInfoTypes.UNIT_CLINUIT_QAMUTIIK then
							rUnit:Kill(true, -1) break
						end
					end
				end
			end
		end
	end
end
ReplaceInuitUnit()