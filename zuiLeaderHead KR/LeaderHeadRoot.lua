--Can be reloaded by calling include("LeaderHeadRoot.lua") from Firetuner!
--Written and designed by Schnetziomi5
----------------------------------------------------------------        
----------------------------------------------------------------

print("Loading ZUI LeaderHeadScreen")

if not LISTENERS_SET_HINT then
	Events.AILeaderMessage.Add( function(a,b,c,d,e) LeaderMessageHandler(a,b,c,d,e) end ); 
	Events.LeavingLeaderViewMode.Add( function() OnLeavingLeader() end ); 
	LISTENERS_SET_HINT = true ;
end

-- of course there is no UI.IsLeaderHeadRootUp() ....
local uISUP = false ;
ISUP = function() return uISUP end 

function fExit()
	UIManager:DequeuePopup( ContextPtr );
	uISUP = false ;
	UI.SetLeaderHeadRootUp( false );
	UI.RequestLeaveLeader();
end

ContextPtr:SetInputHandler(function( uiMsg, wParam, lParam )
	if( uiMsg == KeyEvents.KeyDown ) then
		if( wParam == Keys.VK_ESCAPE ) then
			fExit();
		end
	end
	return true;
end);


local oldCursor = 0 ;
ContextPtr:SetShowHideHandler(function( hide, init )
	if init then 
		return;
	elseif hide then
		UIManager:SetUICursor(oldCursor);
	else
		oldCursor = UIManager:SetUICursor(0);
		LuaEvents.EUILeaderHeadRoot(); -- If returning from DiploTrade this signals the leader list to attach to this context. No harm done if EUI is absent...
		ContextPtr:ReprocessAnchoring();
	end
end);

-------------------------------------------------------------------------------------------------------
include( "IconSupport" );
include( "GameplayUtilities" );
include( "InfoTooltipInclude" );
include( "InstanceManager");

if MapModData and MapModData.UI_bc1 and MapModData.UI_bc1.GetMoodInfo then
	GetMoodInfo = MapModData.UI_bc1.GetMoodInfo ;
end

include( "LH_api" );
setCallback( Controls.BACKUP_EXIT, fExit ) ;

-------------------------------------------------------------------------------------------------------------------------------------
-------- STATE KEEPING OBJECTS

GLOBALS = {} ;
wHuman, wEnemy, wHumanTeam, wEnemyTeam = newObjectWithIdWrapper(4) ;
wState = {} ;

local wHuman, wEnemy, wHumanTeam, wEnemyTeam, wState = wHuman, wEnemy, wHumanTeam, wEnemyTeam, wState ;
Human, Enemy, HumanTeam, EnemyTeam = unpack( forAll( { wHuman, wEnemy, wHumanTeam, wEnemyTeam }, newRecorder ) ) ;
--local Human, Enemy, HumanTeam, EnemyTeam = Human, Enemy, HumanTeam, EnemyTeam ;

wHuman.__setTarget( Player ) ;
wEnemy.__setTarget( Player ) ;
wHumanTeam.__setTarget( Team ) ;
wEnemyTeam.__setTarget( Team ) ;

local function setState( enemyid, uistate, data )
	
	wState.iState = uistate ;
	wState.iData = data ;
	
	local idx = Game.GetActivePlayer() ;
	wHuman.__setTarget( Players[idx], idx ) ;
	
	wEnemy.__setTarget( Players[enemyid] , enemyid ) ;
	
	idx = wHuman:GetTeam() ;
	wHumanTeam.__setTarget( Teams[idx], idx ) ;
	
	idx = wEnemy:GetTeam() ;
	wEnemyTeam.__setTarget( Teams[idx], idx ) ;
end

----------------------------------------------------------------------------------------------------------------------------------------

local tHandlerarry = {};
GLOBALS.tHandlerarry = tHandlerarry ;
function registerMessageHandler( iMessageID, fHandler ) tHandlerarry[iMessageID] = fHandler end

local tStateChangeListeners = {}
addStateChangeListener = function( func ) table.insert(tStateChangeListeners,func) end
local notifyStateChanged = function() print("notifyStateChanged"); for _,f in pairs(tStateChangeListeners) do f() end end

local tLeaveLeaderListeners = {}
addLeaveLeaderListener = function( func ) table.insert(tLeaveLeaderListeners,func) end
local notifyLeaveLeader = function() print("notifyLeaveLeader"); for _,f in pairs(tLeaveLeaderListeners) do f() end end


----------------------------------------------------------------------------------------------------------------------------------------

include( "LH_chat" );
include( "LH_discuss" );
--include( "LH_trade" );
--include( "LH_debug" );

do

	local function rootMessageHandler()
		UI.SetLeaderHeadRootUp(true);
		uISUP = true ;
		Controls.DIPLO_STACK:SetHide(false);
		
	end

	local function tradeMessageHander()
		print("Discarding trade screen message!");
	end

	local function unsupportedMessageHandler()
		error("Should not happen!");
	end

	do
		local handler ;
		local function H( state ) registerMessageHandler( DiploUIStateTypes[state], handler ) end
		
		handler = tradeMessageHander ;
		H( "DIPLO_UI_STATE_TRADE" );
		H( "DIPLO_UI_STATE_TRADE_AI_MAKES_DEMAND" ) ;
		H( "DIPLO_UI_STATE_TRADE_AI_MAKES_REQUEST" ) ;
		H( "DIPLO_UI_STATE_TRADE_HUMAN_OFFERS_CONCESSIONS" ) ;
		H( "DIPLO_UI_STATE_TRADE_AI_MAKES_OFFER" ) ;
		H( "DIPLO_UI_STATE_TRADE_AI_ACCEPTS_OFFER" ) ;
		H( "DIPLO_UI_STATE_TRADE_AI_REJECTS_OFFER" ) ;
		H( "DIPLO_UI_STATE_HUMAN_DEMAND" ) ;
		H( "DIPLO_UI_STATE_TRADE_AI_MAKES_GENEROUS_OFFER" ) ;
		handler = rootMessageHandler ;
		H( "DIPLO_UI_STATE_DEFAULT_ROOT" ) ;
		H( "DIPLO_UI_STATE_WAR_DECLARED_BY_HUMAN" ) ;
		H( "DIPLO_UI_STATE_PEACE_MADE_BY_HUMAN" ) ;
		H( "DIPLO_UI_STATE_CONFRONT_YOU_KILLED_MY_SPY" ) ; -- don't know, don't care...
		handler = unsupportedMessageHandler ;
		H( "DIPLO_UI_STATE_HUMAN_REQUEST" ) ; --????
		H( "DIPLO_UI_STATE_DISCUSS_YOU_EXPANSION_SERIOUS_WARNING" ) ;
		H( "DIPLO_UI_STATE_DISCUSS_YOU_PLOT_BUYING_SERIOUS_WARNING" ) ;
		H( "DIPLO_UI_STATE_DISCUSS_END_WORK_WITH_US" ) ;
		H( "NO_DIPLO_UI_STATE" ) ;
		H( "DIPLO_UI_STATE_DISCUSS_YOU_KILLED_MINOR_CIV" ) ;
		H( "DIPLO_UI_STATE_DISCUSS_PROTECT_MINOR_CIV" ) ;
		handler = 0 ;
		H( "NUM_DIPLO_UI_STATES" ) ;
		
	end

	REVERSETABLE = {}
	REVERSETABLE[DiploUIStateTypes] = {} ;
	for k,v in pairs( DiploUIStateTypes ) do
		REVERSETABLE[DiploUIStateTypes][v] = k ;
		if not tHandlerarry[v] then
			print( "Diplo State" , v, "is missing a handlerfunction! (" .. k .. ")"  );
		end
	end

end






----------------------------------------------------------------        
-- LEADER MESSAGE HANDLER
----------------------------------------------------------------

function LeaderMessageHandler( iPlayer, iState, sText, iAnimationAction, iData )
	
	print("iPlayer:", iPlayer, "iState:", iState, "sText:", sText, "iAA:", iAnimationAction, "iData:", iData, "sState:", REVERSETABLE[DiploUIStateTypes][iState]);
	--print("Clock:", os.clock())
	--local printb = print ;
	--print = function() end ;
	local t1 = os.clock() ;
	
	setState( iPlayer, iState, iData ) ;
	LISTEN( sText ) ;
	
	if tHandlerarry[iState] then tHandlerarry[iState]() else print( "No handler found!" ) end
	
	notifyStateChanged()
	
	UIManager:QueuePopup( ContextPtr, PopupPriority.LeaderHead );
	
	ContextPtr:ReprocessAnchoring() ;
	
	local t2 = os.clock() ;
	--print = printb ;
	print("t1",t1 ,"t2" ,t2 , "time(ms):", 1000*t2-1000*t1) ;
end

----------------------------------------------------------------        
----------------------------------------------------------------        

function OnLeavingLeader()
	print("LeavingLeaderViewMode");
	Controls.DIPLO_STACK:SetHide(true);
	uISUP = false ;
	UI.SetLeaderHeadRootUp( false );
	notifyLeaveLeader();
	UIManager:DequeuePopup( ContextPtr );
end

--ContextPtr:ReprocessAnchoring();