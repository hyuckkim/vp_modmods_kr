-- Plague_SaveData
-- Author: FramedArchitecture
-- DateCreated: 12/21/2013
--------------------------------------------------------------------
include("Serializer.lua");
--------------------------------------------------------------------
MapModData.g_Properties	= MapModData.g_Properties or {}
g_Properties			= MapModData.g_Properties
--------------------------------------------------------------------
local g_SaveData = Modding.OpenSaveData()
--------------------------------------------------------------------
function SavePlagueCities(table)
	SetPersistentTable("g_PlagueCities", table)
	g_Properties.g_PlagueCities = table
	Events.SerialEventCityInfoDirty()
end
--------------------------------------------------------------------
function GetPlagueCities()
	return GetPersistentTable("g_PlagueCities")
end
--------------------------------------------------------------------
function SavePlagueData(table)
	SetPersistentTable("g_PlagueData", table)
	g_Properties.g_PlagueData = table
end
--------------------------------------------------------------------
function GetPlagueData()
	return GetPersistentTable("g_PlagueData")
end
--------------------------------------------------------------------
function GetPersistentTable(name)
	if (g_Properties[name] == nil) then
		local code = g_SaveData.GetValue(name);
		if code then
			g_Properties[name] = loadstring(code)()
		else
			g_Properties[name] = {}
		end
	end
	return g_Properties[name];
end
--------------------------------------------------------------------
function SetPersistentTable(name, t)
    g_SaveData.SetValue(name, serialize(t))
	g_Properties[name] = t
end
--------------------------------------------------------------------