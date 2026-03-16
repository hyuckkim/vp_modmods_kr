print("This is the 'UI - No Auto-Embark Workers' mod script.")

local modId = "1299a368-f6c8-4d02-af55-2fc863dd2fb4"
local savedData = Modding.OpenSaveData()

function OnUnitEmbark(iPlayer, iUnit)
  if (not isToggle("OPTION_WORKER_EMBARK_OCEAN")) then
    pPlayer = Players[iPlayer]

    -- Only do this for human players ...
    if (pPlayer:IsHuman()) then
      pUnit = pPlayer:GetUnitByID(iUnit)

      -- ... and only for automated workers all at sea
      if (pUnit:IsEmbarked() and pUnit:GetUnitType() == GameInfoTypes.UNIT_WORKER and pUnit:IsAutomated()) then
	    if (not (pUnit:GetPlot():IsLake() and isToggle("OPTION_WORKER_EMBARK_LAKE"))) then
          print("Worker (" .. iUnit .. ") embarked and automated")

          -- We could give the unit a single move and use the MISSION_DISEMBARK action to get them back onto land,
          -- but this is slow and fails intermittently depending on what else the UI is doing at the time.

          -- Disembark them and jump them back onto land
          pUnit:SetEmbarked(false)
          pUnit:JumpToNearestValidPlot()
          pNewPlot = pUnit:GetPlot()

          -- Kill the worker and create a new one (need to do this as the graphics don't update correctly)
          pUnit:Kill(false)
          pNewUnit = pPlayer:InitUnit(GameInfoTypes.UNIT_WORKER, pNewPlot:GetX(), pNewPlot:GetY(), UNITAI_WORKER, DirectionTypes.DIRECTION_WEST)

          -- Give the unit a single move
          -- This needs to be multiplied by the movement factor (60, but it's in Defines)
          pNewUnit:SetMoves(1)

          -- Now tell the player
          pPlayer:AddNotification(GameInfoTypes.NOTIFICATION_GENERIC, Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_AUTOMATION_CANCELLED"), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_AUTOMATION_CANCELLED"), pNewUnit:GetX(), pNewUnit:GetY())
        end
      end
    end
  end
end
Events.UnitEmbark.Add(OnUnitEmbark)


-----
----- Helper Functions -----
-----
function isInitialised()
  local sKey = modId .. "_Initialised"

  local bInitialised = (savedData.GetValue(sKey) ~= nil)

  if (not bInitialised) then
    savedData.SetValue(sKey, 1)
  end

  return bInitialised
end

function setToggleFromOption(sSwitch)
  setToggle(sSwitch, (GameInfo.PNM_Options[sSwitch].Default == 1))
end

function setToggle(sSwitch, bValue)
  local sKey = modId .. "_" .. sSwitch
  local iValue = 0
  if (bValue) then iValue = 1 end

  savedData.SetValue(sKey, iValue)
end

function isToggle(sSwitch)
  local sKey = modId .. "_" .. sSwitch
  local value = savedData.GetValue(sKey)

  return (value ~= nil and value == 1)
end


-----
----- Initialisation -----
-----
function Initialize()
  if (not isInitialised()) then
    setToggleFromOption("OPTION_WORKER_EMBARK_LAKE")
    setToggleFromOption("OPTION_WORKER_EMBARK_OCEAN")
  end
end

Initialize()
