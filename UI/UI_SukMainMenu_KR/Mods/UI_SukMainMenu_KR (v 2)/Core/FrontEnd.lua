-- modified by Temudjin from 1.0.3.142 code
-------------------------------------------------
-- FrontEnd
-------------------------------------------------

local tValidBGs = {
	"electric_grid.dds",
	"england_bank.dds",
	"sailor2.dds",
	"glassforming.dds",
	"1920swoman.dds",
	"printingpress.dds",
	"drill.dds",
	"piano.dds",
	"orchestra2.dds",
	"trenches.dds",
	"milk2.dds",
	"maps.dds",
	"ananda.dds",
	"ethernet.dds",
	"vikings1.dds",
	"newspaper_stands.dds",
	"redeemer.dds",
	"aircraft_carrier2.dds",
	"berlin_wall.dds",
	"brick.dds",
	"statueofliberty.dds",
	"japan1.dds",
	"vinyl.dds",
	"soldiers.dds",
	"abu_simbel.dds",
	"archeology2.dds",
	"eiffel_tower.dds",
	"destroyer1.dds",
	"train.dds",
	"orbital_atk.dds",
	"curiosity.dds",
	"monks.dds",
	"gladiator1.dds",
	"aircraft_carrier3.dds",
	"empire_state.dds",
	"petri2.dds",
	"tank3.dds",
	"foundry.dds",
	"blacksmith.dds",
	"fireworks.dds",
	"vikings2.dds",
	"compass2.dds",
	"library.dds",
	"dday1.dds",
	"coke.dds",
	"computerdesign.dds",
	"mine.dds",
	"st_petersburg.dds",
	"mausoleum_halicarnassus.dds",
	"tv2.dds",
	"oldtown3.dds",
	"sailor.dds",
	"tank5.dds",
	"redsquare.dds",
	"tank1.dds",
	"oldtown.dds",
	"moonlanding.dds",
	"stealth_bomber.dds",
	"solar_panels.dds",
	"lumber_mill.dds",
	"catacombs.dds",
	"books1.dds",
	"space1.dds",
	"petri.dds",
	"tv.dds",
	"wind_turbines.dds",
	"spec_ops.dds",
	"sam_missile.dds",
	"model_t.dds",
	"orchestra.dds",
	"titanic.dds",
	"milk.dds",
	"ww1_knife.dds",
	"sparta1.dds",
	"lighthouse_alexandria.dds",
	"microscope.dds",
	"cheomseongdae.dds",
	"archers.dds",
	"shibepark.dds",
	"ww1_shovel.dds",
	"sewing.dds",
	"coffee.dds",
	"steamengine.dds",
	"terracota_army.dds",
	"ruins1.dds",
	"oldtown4.dds",
	"c4_plant.dds",
	"enfranchisement.dds",
	"marinaginesta.dds",
	"church1.dds",
	"oilplatform.dds",
	"vaticancity.dds",
	"archeology1.dds",
	"knightstemplar.dds",
	"great_wall.dds",
	"ww1_grenade.dds",
	"medicine.dds",
	"nuclear_submarine.dds",
	"aqueduct.dds",
	"lighthouse.dds",
	"engine.dds",
	"ciber_launch.dds",
	"chogha_zanbil2.dds",
	"bolton_abbey.dds",
	"clothing.dds",
	"tank4.dds",
	"bor5.dds",
	"university.dds",
	"observatory.dds",
	"mayans1.dds",
	"barrels.dds",
	"airplane.dds",
	"franklin_kite.dds",
	"grandcentral.dds",
	"bootshiner.dds",
	"libalexandria.dds",
	"gemini.dds",
	"dreamcatcher.dds",
	"taj_mahal.dds",
	"smelting.dds",
	"painting.dds",
	"harbor.dds",
	"la_bastille.dds",
	"oldtown2.dds",
	"venice.dds",
	"cannon.dds",
	"hydroplant.dds",
	"gladiator2.dds",
	"colossus_rhodes.dds",
	"poker.dds",
	"blueprints1.dds",
	"steelmaking2.dds",
	"space2.dds",
	"space_shuttle.dds",
	"chogha_zanbil.dds",
	"sanfran_bridge.dds",
	"nuclear_explosion.dds",
	"steampump.dds",
	"nuclear_submarine3.dds",
	"lights1.dds",
	"crown.dds",
	"farming1.dds",
	"computerchips.dds",
	"politician.dds",
	"nuclear_submarine2.dds",
	"excavation.dds",
	"particleaccelerator.dds",
	"aircraft_carrier1.dds",
	"nuclear_reactor.dds",
	"cathedral1.dds",
	"museum1.dds",
	"wright_brothers.dds",
	"sarcophagus.dds",
	"big_ben.dds",
	"chicago.dds",
	"construction.dds",
	"compass1.dds",
	"library2.dds",
	"china1.dds",
	"watch1.dds",
	"phalanx.dds",
	"hanging_gardens.dds",
	"louvre.dds",
	"misscleveland.dds",
	"herding.dds",
	"steelmaking.dds",
	"drone.dds",
	"radiology.dds",
	"burg_khalifa.dds",
	"madisonsquare.dds",
	"perthmint.dds",
	"weatherballoon.dds",
	"hindenburgdisaster.dds",
	"mg.dds",
	"tilburg.dds",
	"bar.dds",
	"shinsegae.dds",
	"ceilingpainting.dds",
	"museum2.dds",
	"secessionbuilding.dds",
	"benz.dds",
	"ennis.dds",
	"data.dds",
	"lloydcatwalk.dds",
	"hancock.dds",
	"lloydtower.dds",
	"donovan.dds",
	"shumen.dds",
	"singaporegardens.dds",
	"heatherwick.dds",
	"china2.dds",
	"monks2.dds",
	"monks3.dds",
	"revada.dds",
	"church3.dds",
	"berlinerdom.dds",
	"neuekirche.dds",
	"christianity.dds",
	"bible.dds",
	"chichenitza.dds",
	"doiinthanon.dds",
	"egypt.dds",
	"gemshotel.dds",
	"bridge.dds",
	"port.dds",
	"hardlabor.dds",
	"maoi.dds",
	"tower.dds",
	"hinduism.dds",
	"hinduism2.dds",
	"arjoon.dds",
	"golfball.dds",
	"prayer.dds",
	"domerock.dds",
	"missiles.dds",
	"islam.dds",
	"abuja.dds",
	"ghazi.dds",
	"minarets.dds",
	"pagan.dds",
	"leonliu.dds",
	"candles.dds",
	"parthenon.dds",
	"mayans2.dds",
	"sphinx.dds",
}

local iCurrentBG = math.random(#tValidBGs)
local bRandomWallpaperOnLoad = Modding.GetSystemProperty("bRandomWallpaperOnLoad") == "1"
if bRandomWallpaperOnLoad then

    local sBG = Modding.GetSystemProperty("CurrentBG")
    if not sBG or sBG == "" then sBG = "1" end
    iCurrentBG = tonumber(sBG)

    if not tValidBGs[iCurrentBG] then iCurrentBG = 1; sBG = "1" end

    Modding.SetSystemProperty("CurrentBG", sBG)

else
    Modding.SetSystemProperty("CurrentBG", tostring(iCurrentBG))
end

-------------------------------------------------
-- Suk_ChangeBackground
-------------------------------------------------
LuaEvents.Suk_ChangeBackground.Add(function(iDelta)

    Controls.AtlasLogo:SetTexture(tValidBGs[iCurrentBG])

    iCurrentBG = iCurrentBG + iDelta
    if iCurrentBG > #tValidBGs then iCurrentBG = 1 end
    if iCurrentBG < 1 then iCurrentBG = #tValidBGs end

    Modding.SetSystemProperty("CurrentBG", tostring(iCurrentBG))

    Controls.AtlasAnim:SetToBeginning()
    Controls.AtlasLogo2:SetTexture(tValidBGs[iCurrentBG])
    Controls.AtlasAnim:Play()
end)

function ShowHideHandler( bIsHide, bIsInit )

        -- Check for game invites first.  If we have a game invite, we will have flipped 
        -- the Civ5App::eHasShownLegal and not show the legal/touch screens.
        UI:CheckForCommandLineInvitation();

---------- Temudjin START
--    if not UI:HasShownLegal() then
--        UIManager:QueuePopup( Controls.LegalScreen, PopupPriority.LegalScreen );
--    end
---------- Temudjin END

    if not bIsHide then
        Controls.AtlasLogo:SetTexture(tValidBGs[iCurrentBG])
        Controls.AtlasLogo2:SetTexture(tValidBGs[iCurrentBG])

        UIManager:QueuePopup( Controls.MainMenu, PopupPriority.MainMenu );
        UIManager:SetUICursor( 0 );
    else
        Controls.AtlasLogo:UnloadTexture();
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );