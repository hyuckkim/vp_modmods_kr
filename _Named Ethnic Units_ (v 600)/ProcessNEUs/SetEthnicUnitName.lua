-- written by GAIA using Notepad++
--=======================================================================================================================
-- NAMED ETHNIC UNITS
--=======================================================================================================================
local bDebugMode = false
local function DebugPrint(msg) if bDebugMode then print(msg) end end

local bIsCoreModActive = (function()
	for _, v in ipairs(Modding.GetActivatedMods()) do
		if v.ID == "ab0bea08-fb7a-4c23-9234-cbe5252552b6" then
			DebugPrint("Gaia's Core Mod is active") return true
		end
	end
	if DB.Query("SELECT 1 FROM Missions WHERE Type = 'MISSION_GAIA_TRANSFORM' LIMIT 1")() then
		DebugPrint("Gaia's Core Mod is active") return true
	end
	return false
end)()
--=======================================================================================================================
-- NAMED ETHNIC UNITS
--=======================================================================================================================
-- Assign ethnic unit names
function AssignEthnicUnitName(playerID, unitID)
    local player = Players[playerID]
    if not player then return end

    local unit = player:GetUnitByID(unitID)
    if not unit then return end

    local civInfo = GameInfo.Civilizations[player:GetCivilizationType()]
    local unitInfo = GameInfo.Units[unit:GetUnitType()]
    if not civInfo or not unitInfo then return end

    for row in GameInfo.Civilization_UnitNameOverrides{CivilizationType = civInfo.Type, UnitType = unitInfo.Type} do
        local ethnicUnitName = Locale.ConvertTextKey(row.EthnicUnitName)
        if ethnicUnitName and ethnicUnitName ~= "" then
            DebugPrint("Assigning ethnic unit name:", ethnicUnitName, "to unit:", unitID)
            unit:SetName(ethnicUnitName)
        end
        break
    end
end

-- Initialize named ethnic units
function InitializeNamedEthnicUnits()
    if bIsCoreModActive then return end
    if not g_SaveData then
        g_SaveData = Modding.OpenSaveData()
    end
    local bInit = g_SaveData.GetValue("NamedEthnicUnitsInitialized")
    if not bInit then
        print("InitializingNamedEthnicUnits")
        Events.SerialEventUnitCreated.Add(AssignEthnicUnitName)
        g_SaveData.SetValue("NamedEthnicUnitsInitialized", true)
    end
end

InitializeNamedEthnicUnits()
