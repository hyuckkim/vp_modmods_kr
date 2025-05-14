print('ElephantSoundOnCircusBuild.lua starting');

g_builtThisTurn = 0;
Events.ActivePlayerTurnStart.Add( function() g_builtThisTurn = 0 end );

GameEvents.CityConstructed.Add(function(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]

	if not pPlayer then return end
	if not pPlayer:IsHuman() then return end
	if iBuilding == GameInfoTypes.BUILDING_CIRCUS then
		local c = g_builtThisTurn;
		g_builtThisTurn = g_builtThisTurn + 1;

		-- if more than one circus built offset it for the full meme effect
		if c > 0 then
			local _end = os.clock() + 0.25 * c;
			while (os.clock() < _end) do end
		end
		Events.AudioPlay2DSound('AS2D_ELEPHANT_TRUMPETING')
	end
end)
print('ElephantSoundOnCircusBuild.lua loaded');