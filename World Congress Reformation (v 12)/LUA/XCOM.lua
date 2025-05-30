local iXCOM = GameInfoTypes.UNIT_XCOM_SQUAD
local XCOMhq2 = GameInfoTypes.BUILDINGCLASS_XCOM_MILITARY_SECRET
local iGDR = GameInfoTypes.UNIT_MECH
local GDRhq2 = GameInfoTypes.BUILDINGCLASS_GDR_MILITARY_SECRET
local iParaTrooper = GameInfoTypes.UNIT_MARINE
local iModernArmor = GameInfoTypes.UNIT_MODERN_ARMOR

function XCOMUnit(iPlayer, iCity, iUnit)
	if iUnit == iXCOM and Players[iPlayer]:GetBuildingClassCount(XCOMhq2) == 0 then	
		return false
	end
	return true
end

function GDRUnit(iPlayer, iCity, iUnit)
	if iUnit == iGDR and Players[iPlayer]:GetBuildingClassCount(GDRhq2) == 0 then
		return false
	end
	return true
end

function XCOMUnits(iPlayer, iUnit)
	if Players[iPlayer]:GetUnitByID(iUnit):GetUnitType() == iParaTrooper and Players[iPlayer]:GetBuildingClassCount(XCOMhq2) == 0 then
		return false
	end
	return true
end

function GDRUnits(iPlayer, iUnit)
	if Players[iPlayer]:GetUnitByID(iUnit):GetUnitType() == iModernArmor and Players[iPlayer]:GetBuildingClassCount(GDRhq2) == 0 then
		return false
	end
	return true
end

GameEvents.CityCanTrain.Add(GDRUnit)
GameEvents.CityCanTrain.Add(XCOMUnit)
GameEvents.CanHaveAnyUpgrade.Add(GDRUnits)
GameEvents.CanHaveAnyUpgrade.Add(XCOMUnits)