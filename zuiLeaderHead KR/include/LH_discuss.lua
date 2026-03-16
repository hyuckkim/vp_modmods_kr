local convertText = convertText ;
REPLY_STACK = REPLY_STACK or GenerationalInstanceManager:new("REPLY_BUTTON","BUTTON",Controls.REPLY_STACK);
local REPLY_STACK = REPLY_STACK ;
REPLY_STACK:ResetInstances();
DIPLO_STACK = DIPLO_STACK or GenerationalInstanceManager:new("DIPLO_BUTTON","BUTTON",Controls.DIPLO_STACK);
local DIPLO_STACK = DIPLO_STACK ;
DIPLO_STACK:ResetInstances();

local wHuman, wEnemy, wHumanTeam, wEnemyTeam, wState = wHuman, wEnemy, wHumanTeam, wEnemyTeam, wState ;
local SPEAK, LISTEN = SPEAK, LISTEN ;
--local Game, UI = Game, UI ; Why even bother?

local function DoUIDiplo( name, data1, data2 )
	if type(name) == "string" then
		if not ( name:find("FROM_UI_DIPLO_EVENT_") == 1 ) then name = "FROM_UI_DIPLO_EVENT_" .. name end
		name = FromUIDiploEventTypes[name] ;
	end
	print( "DoUIDiplo", name, wEnemy:ID(), data1 or 0, data2 or 0) ;
	Game.DoFromUIDiploEvent( name, wEnemy:ID() , data1 or 0, data2 or 0 ) ;
end


do
	local iState, iData ;
	local tDiplodata = {} ;
	local iReplyID = nil ;
	
	local function fButtonClicked( buttonID, speakid )
		if speakid > 0 then
			SPEAK( convertText( tDiplodata[iState][speakid].textkey ) )
		end
		Controls.REPLY_STACK:SetHide(true);
		if iReplyID == nil or buttonID == 0 or buttonID == nil then
			print( "ReplyID=", iReplyID, "Button ID=" , buttonID ) ;
			UI.RequestLeaveLeader();
		else
			DoUIDiplo( iReplyID, buttonID, iData );
		end
	end

	local defaultHandler = function()
		
		iState, iData = wState.iState, wState.iData ;
		local tHandlerData = tDiplodata[iState] ;
		iReplyID = tHandlerData.iReplyID ;
		
		REPLY_STACK:ResetInstances();
		if not( #tHandlerData == 1 and ISUP() ) then --if LHR is up and there is only one reply, don't bother with a potential back button
			for k,v in ipairs(tHandlerData) do
				local bc = REPLY_STACK:GetInstance();
				bc.TEXT:SetText( convertText(v.textkey,true) );
				bc.BUTTON:SetToolTipString( convertText(v.tooltip,true) )
				bc.BUTTON:ClearCallback( Mouse.eLClick );
				bc.BUTTON:SetVoid1( v.void1 );
				bc.BUTTON:SetVoid2( (iReplyID and k) or 0 ) ;
				bc.BUTTON:RegisterCallback( Mouse.eLClick, fButtonClicked ) ;
			end
			Controls.REPLY_STACK:SetOffsetY( ( #tHandlerData == 1 and 50 ) or 20 ) ;
			Controls.REPLY_STACK:SetHide(false);
		end
	end

	TT = {} ;
	local BUTTONS = {} ;
	local function pushButtonConfig( textkey, void1, tooltip, enabledfunc, customcallback )

		table.insert(BUTTONS, {
			textkey = convertText(textkey),
			void1 = void1,
			tooltip = convertText(tooltip),
			enabledfunc = enabledfunc,
			customcallback = customcallback
		});
		return #BUTTONS ;
	end

	local function pushDefaultHandlerWithNRecentButtons( icount, state, iReplyID )
		local tHandlerData = { iReplyID = iReplyID } ;
		for it = 1, icount do
			table.insert( tHandlerData, BUTTONS[#BUTTONS - icount + it] );
		end
		tDiplodata[state] = tHandlerData ;
		registerMessageHandler( state, defaultHandler );
	end
	

	local R = { __REPLYBUTTONCONFIGS = BUTTONS } ;
	GLOBALS.REPLYBUTTONS = R ;
	local BC = pushButtonConfig ;
	local H = pushDefaultHandlerWithNRecentButtons ;
	
	local TT_CON = function() return Players[iData] end ;
	local TT_NAME = function() return TT_CON():GetCivilizationShortDescriptionKey() end
	local TT_PTP_BREAK = ConditionalText{
		{--Packed Tooltip
			"TXT_KEY_DIPLO_DISCUSS_PROTECTED_MINOR_FORGIVE_TT";
			Enemy:GetCivilizationShortDescriptionKey();
			TT_NAME;
			(GameDefines["MINOR_FRIENDSHIP_DROP_DISHONOR_PLEDGE_TO_PROTECT"] / 100) * -1 ;
		},TT_CON ;--Condition: Players[iData] ~= nil
	};
	local TT_PTP_KEEP = ConditionalText{
		{
			"TXT_KEY_DIPLO_DISCUSS_PROTECTED_MINOR_DISPUTE_TT";
			Enemy:GetCivilizationShortDescriptionKey();
			TT_NAME;
		},TT_CON ;
	};
	local TT_HOW_DARE_YOU = ConditionalText{
		{
			"TXT_KEY_DIPLO_DISCUSS_HOW_DARE_YOU_TT";
			Enemy:GetCivilizationShortDescriptionKey();
			TT_NAME;
		},TT_CON ;
	};
		
	
	R.WHATEVER = BC("죄송하지만, 지금은 이 문제를 논의할 시간이 없습니다...");

	-- AI insults Human with some reason
	R.SORRY =	BC("TXT_KEY_DIPLO_DISCUSS_MESSAGE_SORRY");
	R.LATER =	BC("TXT_KEY_DIPLO_DISCUSS_MESSAGE_DEAL",	2,	"TXT_KEY_DIPLO_DISCUSS_MESSAGE_YOULL_PAY_TT");
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_BLANK_DISCUSSION_MEAN_HUMAN, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_MEAN_RESPONSE );

	--AI insults Human because they can?
	R.OKK = 	BC("TXT_KEY_DIPLO_DISCUSS_MESSAGE_OKAY");
	R.YWP = 	BC("TXT_KEY_DIPLO_DISCUSS_MESSAGE_YOULL_PAY",	2,	"TXT_KEY_DIPLO_DISCUSS_MESSAGE_YOULL_PAY_TT");
	H(2, DiploUIStateTypes.DIPLO_UI_STATE_BLANK_DISCUSSION_MEAN_AI, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_MEAN_RESPONSE );

	--AI declared WAR!
	R.OKK_WAR = BC("TXT_KEY_DIPLO_DISCUSS_MESSAGE_OKAY");
	R.YWP_WAR = BC("TXT_KEY_DIPLO_DISCUSS_MESSAGE_YOULL_PAY",	2);
	H(2, DiploUIStateTypes.DIPLO_UI_STATE_AI_DECLARED_WAR, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_MEAN_RESPONSE, convertText("TXT_KEY_WAR_DECLARED") );

	--AGRESSIVE MILITARY
	R.MEAN_N_HARM = BC("TXT_KEY_DIPLO_DISCUSS_WE_MEAN_NO_HARM",	1,	{"TXT_KEY_DIPLO_DURATION_MILITARY_PROMISE",Game:GetMilitaryPromiseDuration()});
	R.TIME_TO_DIE = BC("TXT_KEY_DIPLO_DISCUSS_TIME_TO_DIE", 	2);  --,randomText( "RESPONSE_MOVE_TROOPS_REJECT_CONQUEST" )
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_AGGRESSIVE_MILITARY_WARNING, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_AGGRESSIVE_MILITARY_WARNING_RESPONSE ) ;

	--AI attacked CS
	R.CS_ATTACKED_DWDW = BC("TXT_KEY_DIPLO_DISCUSS_NO_DIVIDE",		1,	TT_PTP_BREAK);
	R.CS_ATTACKED_WPAY = BC("TXT_KEY_DIPLO_DISCUSS_MESSAGE_YOULL_PAY",	2,	TT_PTP_KEEP);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_I_ATTACKED_YOUR_MINOR_CIV, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_I_ATTACKED_YOUR_MINOR_CIV_RESPONSE);

	--AI bullied CS
	R.CS_BULLIED_DWDW = BC("TXT_KEY_DIPLO_DISCUSS_NO_DIVIDE",		1,	TT_PTP_BREAK);
	R.CS_BULLIED_WPAY = BC("TXT_KEY_DIPLO_DISCUSS_MESSAGE_YOULL_PAY",	2,	TT_PTP_KEEP);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_I_BULLIED_YOUR_MINOR_CIV, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_I_BULLIED_YOUR_MINOR_CIV_RESPONSE ) ;

	--We attacked a CS
	R.CS_ATTACK_SRY =	BC("TXT_KEY_DIPLO_DISCUSS_WILL_WITHDRAW",	2,	"TXT_KEY_DIPLO_DURATION_ATTACK_MINOR_PROMISE");
	R.CS_ATTACK_NYP =	BC("TXT_KEY_DIPLO_DISCUSS_NOT_YOUR_BUSINESS",	1);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_YOU_ATTACKED_MINOR_CIV, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_ATTACKED_MINOR_RESPONSE ) ;

	--We bullied a CS
	R.CS_BULLY_SRY =	BC("TXT_KEY_DIPLO_DISCUSS_SORRY_FOR_BULLYING",	2);
	R.CS_BULLY_NYB =	BC("TXT_KEY_DIPLO_DISCUSS_NOT_YOUR_BUSINESS",	1);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_YOU_BULLIED_MINOR_CIV, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_BULLIED_MIN);

	--FORWARD SETTLING
	R.SETTLING_SRY =	BC("TXT_KEY_DIPLO_DISCUSS_SORRY_FOR_SETTLING",	2,	{"TXT_KEY_DIPLO_DURATION_PROMISE",Game:GetExpansionPromiseDuration()});
	R.SETTLING_NYB =	BC("TXT_KEY_DIPLO_DISCUSS_SETTLE_WHAT_WE_PLEASE",	1);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_YOU_EXPANSION_WARNING, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_EXPANSION_WARNING_RESPONSE );

	--PLOT CLAIMING
	R.CLAIM_SRY =		BC("TXT_KEY_DIPLO_DISCUSS_SORRY_FOR_CLAIMING",	2,	{"TXT_KEY_DIPLO_DURATION_PROMISE",Game:GetBorderPromiseDuration()});
	R.CLAIM_NYB =		BC("TXT_KEY_DIPLO_DISCUSS_NOT_YOUR_BUSINESS",	1);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_YOU_PLOT_BUYING_WARNING, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_PLOT_BUYING_WARNING_RESPONSE );

	--DOF
	R.DOF_YES =	BC("TXT_KEY_DIPLO_DISCUSS_YES_WORK_TOGETHER",	1);
	R.DOF_NAH =	BC("TXT_KEY_DIPLO_DISCUSS_NO_GO_IT_ALONE",	2);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_WORK_WITH_US, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_WORK_WITH_US_RESPONSE );

	--COOP AGAINST
	R.COOP_A_NAH =	BC("TXT_KEY_DIPLO_DISCUSS_SORRY_NO_INTEREST",	1);
	R.COOP_A_HDW =	BC("TXT_KEY_DIPLO_DISCUSS_HOW_DARE_YOU",	2);
	R.COOP_A_YES =	BC("TXT_KEY_DIPLO_DISCUSS_DO_WHAT_WE_CAN",	3);
	H( 3, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_WORK_AGAINST_SOMEONE, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_WORK_AGAINST_SOMEONE_RESPONSE);


	--COOP WAR
	R.COOP_W_NAH = 		BC("TXT_KEY_DIPLO_DISCUSS_SORRY_NO_INTEREST",	1);
	R.COOP_W_HDY = 		BC("TXT_KEY_DIPLO_DISCUSS_HOW_DARE_YOU",	2,	TT_HOW_DARE_YOU);
	R.COOP_W_YES =		BC("TXT_KEY_DIPLO_DISCUSS_COOP_WAR_SOON",	3);
	R.COOP_W_TTP =		BC("TXT_KEY_DIPLO_DISCUSS_COOP_WAR_YES",	4);
	H( 4, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_COOP_WAR, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_COOP_WAR_RESPONSE );


	--COOP WAR TIME HAS COME
	R.COOP_P_NOW = 		BC("TXT_KEY_DIPLO_DISCUSS_COOP_WAR_NOW",	1);
	R.COOP_P_NAH = 		BC("TXT_KEY_DIPLO_DISCUSS_CHANGED_MIND",	2);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_COOP_WAR_TIME, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_COOP_WAR_NOW_RESPONSE)

	--AI WANTS A RESEARCH AGREEMENT IN THE FUTURE?!?!??!?
	R.FUTURE_RA_YAY = 		BC("TXT_KEY_DIPLO_DISCUSS_YES_LET_US_PREPARE",	1);
	R.FUTURE_RA_NAH =		BC("TXT_KEY_DIPLO_DISCUSS_SORRY_OTHER_PLANS",	2);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_PLAN_RESEARCH_AGREEMENT, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_PLAN_RA_RESPONSE);
	
	--DENOUNCE ANOTHER PLAYER
	R.ASK_DENOUNCE_YES = 	BC( "TXT_KEY_DIPLO_DISCUSS_DO_WHAT_WE_CAN",	1 );
	R.ASK_DENOUNCE_NAH = 	BC( "TXT_KEY_DIPLO_DISCUSS_SORRY_NO_INTEREST",	2 );
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_AI_REQUEST_DENOUNCE, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_AI_REQUEST_DENOUNCE_RESPONSE );


	--AI CAUGHT PLAYER'S SPY
	R.SPYC_SORRY_YES = 	BC("TXT_KEY_DIPLO_DISCUSS_SORRY_FOR_SPY_CAUGHT",		2);
	R.SPYC_SORRY_NAH = 	BC("TXT_KEY_DIPLO_DISCUSS_NOT_SORRY_FOR_SPY_CAUGHT",	1);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_CAUGHT_YOUR_SPY, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_CAUGHT_YOUR_SPY_RESPONSE );


	--AI KILLED PLAYER's SPY
	R.SPYK_SORRY_YES = 	BC("TXT_KEY_DIPLO_DISCUSS_SORRY_FOR_SPY_KILLED",		2);
	R.SPYK_SORRY_NAH = 	BC("TXT_KEY_DIPLO_DISCUSS_NOT_SORRY_FOR_SPY_KILLED",	1);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_KILLED_YOUR_SPY, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_CAUGHT_YOUR_SPY_RESPONSE );

	--PLAYER KILLED AI'S SPY
	R.SPYKAI_FORGIVE_YES = 	BC("TXT_KEY_DIPLO_DISCUSS_FORGIVE_SPYING",	2);
	R.SPYKAI_FORGIVE_NAH = 	BC("TXT_KEY_DIPLO_DISCUSS_DONT_FORGIVE_SPYING",	1);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_KILLED_MY_SPY, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_KILLED_MY_SPY_RESPONSE );

	--RELIGION
	R.CONVERSIONS_STOP_YES = 	BC("TXT_KEY_DIPLO_DISCUSS_STOP_CONVERSIONS",	2);
	R.CONVERSIONS_STOP_NAH = 	BC("TXT_KEY_DIPLO_DISCUSS_DONT_STOP_CONVERSIONS",	1);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_STOP_CONVERSIONS, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_STOP_CONVERSIONS );

	--DIGGING
	R.DIG_POS = BC("TXT_KEY_DIPLO_DISCUSS_STOP_DIGGING",	2);
	R.DIG_NEG = BC("TXT_KEY_DIPLO_DISCUSS_DONT_STOP_DIGGING",	1);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_STOP_DIGGING, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_STOP_DIGGING );

	--VARIOUS
	R.BACK = 	BC("Back");
	H(1, DiploUIStateTypes.DIPLO_UI_STATE_BLANK_DISCUSSION_RETURN_TO_ROOT );
	H(1, DiploUIStateTypes.DIPLO_UI_STATE_BLANK_DISCUSSION );
	H(1, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_HUMAN_INVOKED )

	--AI axks to be released into independence...
	R.INDP_POS = BC("TXT_KEY_DIPLO_DISCUSS_ALLOW_VASSAL_INDEPENDENCE",	2); 
	R.INDP_NEG = BC("TXT_KEY_DIPLO_DISCUSS_DONT_ALLOW_VASSAL_INDEPENDENCE",	1);
	H( 2, DiploUIStateTypes.DIPLO_UI_STATE_DISCUSS_AI_REVOKE_VASSALAGE, FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_HUMAN_ENDS_VASSALAGE );

end
--------------------------------------------------------------------------------------




do 
	
	local BUTTONS =  {}
	GLOBALS.DIPLO_BUTTONS = BUTTONS ;
	local function B( tab ) table.insert( BUTTONS, tab ) end
	
	
	-------------------------------
	----------- HELPER FUNCTIONS AND CONDITIONALS

	local rC = RECORDER_UTILS ;
	
	local condition_OnSameTeam = rC.Equal( HumanTeam, EnemyTeam ) ;
	local condition_HasDoF = Human:IsDoF( Enemy ) ;
	local condition_AtWar = HumanTeam:IsAtWar( EnemyTeam ) ;
	local condition_AtPeace = NONE{ condition_AtWar } ;
	local condition_Allied = ANY{ condition_HasDoF ; condition_OnSameTeam } ;
	
	
	-----------------------------------------------
	------- LeaderPickerStuff
	
	LEADER_PICKER_STACK = LEADER_PICKER_STACK or GenerationalInstanceManager:new("LeaderButtonInstance","Panel",Controls.LeaderPickerPanel);
	local LEADER_PICKER_STACK = LEADER_PICKER_STACK ;
	
	local lp_overlay = Controls.LeaderPickerOverlay ;
	local lp_panel = Controls.LeaderPickerPanel ;
	local lp_border = Controls.LeaderPickerBorder ;
	local lp_text = Controls.LeaderPickerText ;
	local lp_flavortexts = {} ;
	
	local function hideLeaderPicker() lp_overlay:SetHide(true) end
	
	local lp_callback ;
	
	local function setIcons( mb, playerID )
		local leaderinfo = GameInfo.Leaders[ Players[playerID]:GetLeaderType() ] ; 
		IconHookup( leaderinfo.PortraitIndex, mb.HEAD:GetSizeY(), leaderinfo.IconAtlas, mb.HEAD )
		CivIconHookup( playerID, mb.CivIconBG:GetSizeY(), mb.CivIcon, mb.CivIconBG, mb.CivIconShadow, false, true )
	end
	
	local function onLeaderSelected( comp )
		hideLeaderPicker();
		SPEAK( lp_flavortexts[comp] ) ;
		lp_callback( comp ) ;
	end
	
	local emptyfunc = function()end;
	local tooltipsetter = function( comp )
		comp:SetToolTipCallback(emptyfunc) -- can't set it to nil?
		local v = comp:GetVoid1();
		local tt = lp_flavortexts[v];
		if tt then
			if not comp:IsDisabled() then tt = "*" .. tt .. "*" end
			tt = tt .. "[NEWLINE][NEWLINE]" .. GetMoodInfo(v);
		else
			tt = GetMoodInfo(v) ;
		end
		comp:SetToolTipString( tt ) ;
	end
	
	local function displayLeaderPicker( filter, callback, text )
		LEADER_PICKER_STACK:ResetInstances();
		lp_callback = callback ;
		local shown = 0 ;
		for playerid = 0 , 63 do
			local show, enable, tt = filter(playerid);
			if show then
				local instance = LEADER_PICKER_STACK:GetInstance() ;
				setIcons(instance,playerid);
				local col = shown % 6 ;
				instance.Panel:SetOffsetVal( 10 + 80 * col , 10 + 80 * ( shown - col ) / 6 );
				
				instance.Button:SetToolTipString(tt);
				instance.Button:SetToolTipCallback( tooltipsetter ) ;
				instance.Button:SetVoid1( playerid ) ;
				lp_flavortexts[playerid] = tt ;
				
				instance.Button:SetDisabled(not enable) ;
				instance.Button:ClearCallback(Mouse.eLClick);
				instance.Button:RegisterCallback(Mouse.eLClick,onLeaderSelected)
				
				shown = shown + 1 ;
			end
		end
		local sizeX = math.min(shown+6,6)*80 + 20 ;
		local sizeY = math.ceil(shown/6)*80 + 20 ;
		
		lp_panel:SetSizeVal( sizeX, sizeY ) ;
		lp_border:SetSizeVal( sizeX + 4 , sizeY + 4 ) ;
		lp_overlay:SetHide(false);
		
		local mouseX, mouseY = UIManager:GetMousePos() ;
		local screenX, screenY = UIManager:GetScreenSizeVal();
		
		lp_panel:SetOffsetVal( screenX-mouseX, screenY-mouseY );
		lp_text:SetText(text);
	end
	

	
	lp_overlay:ClearCallback( Mouse.eLClick );
	lp_overlay:RegisterCallback( Mouse.eLClick, hideLeaderPicker )
	lp_overlay:ClearCallback( Mouse.eRClick );
	lp_overlay:RegisterCallback( Mouse.eRClick, hideLeaderPicker )
	
	local anyCivPassesFilter = function( filter , ... )
		for idx = 0 , 42 do
			if filter( idx, ... ) then
				return true ;
			end
		end
	end
	
	-----------------------------------------------------
	--------- WAR AND PEACE
	
	local b_declare_war = B{	
		text = "TXT_KEY_DIPLO_DECLARE_WAR" ;
		speech = ( Player.GetDOWMessage and Human:GetDOWMessage(Enemy) ) or randomText("RESPONSE_DOW_GENERIC","RESPONSE_DOW_WORLD_CONQUEST") ;
		--action = function() UI.AddPopup{ Type = ButtonPopupTypes.BUTTONPOPUP_DECLAREWARMOVE, Data1 = wEnemyTeam:ID() , Option1 = true} end ;
		action = function() DoUIDiplo( "HUMAN_DECLARES_WAR" ) end ;
		enabled = HumanTeam:CanDeclareWar(EnemyTeam) ;
		visible = NONE{ 
			condition_OnSameTeam ; 
			condition_AtWar ;
		};
		tt_disabled = ConditionalText{
			"TXT_KEY_DIPLO_DECLARE_WAR_VASSAL_BLOCKED_MASTER_TT", HumanTeam:IsVassal( EnemyTeam ) ;
			"TXT_KEY_DIPLO_DECLARE_WAR_VASSAL_BLOCKED_TT", HumanTeam:IsVassalOfSomeone() ;
			"TXT_KEY_DIPLO_MAY_NOT_ATTACK", HumanTeam:IsForcePeace( EnemyTeam ) ;
			"TXT_KEY_DIPLO_MAY_NOT_ATTACK_DP", HumanTeam:IsWarBlockedByPeaceTreaty( EnemyTeam ) ;
			"TXT_KEY_DIPLO_MAY_NOT_ATTACK_MOD" ;
		};
		tt_generic = "TXT_KEY_DIPLO_DECLARES_WAR_TT" ;
	};
	
	local b_make_peace = B{
		text = "TXT_KEY_DIPLO_NEGOTIATE_PEACE" ;
		action = function() Game.DoFromUIDiploEvent( FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_HUMAN_NEGOTIATE_PEACE, wEnemy:ID() , 0, 0 ) end ;
		enabled = ALL{ 
			HumanTeam:CanChangeWarPeace( EnemyTeam );
			NONE{ EnemyTeam:IsVassalLockedIntoWar( HumanTeam ) } ;
		};
		visible = NONE{
			condition_OnSameTeam ; --???
			condition_AtPeace ;
		};
		tt_generic = "TXT_KEY_DIPLO_NEGOTIATE_PEACE_TT" ;
		speech = "평화 협상을 해봅시다!" ;
		tt_disabled = ConditionalText{ -- TODO: Maybe test and improve?
			"TXT_KEY_DIPLO_NEGOTIATE_PEACE_VASSAL_BLOCKED_TT", HumanTeam:IsVassalLockedIntoWar(EnemyTeam);
			{"TXT_KEY_DIPLO_MAY_NOT_MAKE_PEACE_VASSAL", FT{ Team.GetName; FT{ Teams; EnemyTeam:GetMaster(); } } }, EnemyTeam:IsVassalLockedIntoWar(HumanTeam) ; --UNTESTED, has an additional check for master ~= -1 in EUI
			{"TXT_KEY_DIPLO_NEGOTIATE_PEACE_BLOCKED_TT", HumanTeam:GetNumTurnsLockedIntoWar(EnemyTeam) }, rC.Nequal{ HumanTeam:GetNumTurnsLockedIntoWar(EnemyTeam) , 0 } ;
-- Maybe add some kind of support for result storage: ???	
--			{"TXT_KEY_DIPLO_NEGOTIATE_PEACE_BLOCKED_TT", rC.var1 }, FT{ STORE{ HumanTeam:GetNumTurnsLockedIntoWar(EnemyTeam), rC.var1 } ; rC.Nequal{ rC.var1 , 0 } ; } ;
			{"TXT_KEY_DIPLO_NEGOTIATE_PEACE_BLOCKED_THEM_TT", EnemyTeam:GetNumTurnsLockedIntoWar(HumanTeam) }, rC.Nequal{ EnemyTeam:GetNumTurnsLockedIntoWar(HumanTeam) , 0 } ;
			"TXT_KEY_DIPLO_NEGOTIATE_PEACE_BLOCKED_MOD_TT" ;
		};
	};
	
	--[[
	local l_mood = B{
		text = function() return getMoodText(wHuman:ID(),wEnemy:ID()) end ;
		tt_generic = function() return GetMoodInfo( wEnemy:ID()  ) end;
		visible = ALWAYS ;
		enabled = NEVER ;
	}
	--]]
	
	local l_war_status = B{
		text = DynamicText{ "TXT_KEY_WAR_SCORE" , Human:GetWarScore(Enemy) } ;
		tt_generic = function() return getWarStatusTooltip( wHuman:ID() , wEnemy:ID() ) end;
		visible = condition_AtWar ;
		enabled = NEVER ;
	}
	
	-------------------------------------------------
	-------- TRADE AND DEMAND
	
	local b_trade = B{
		text = "TXT_KEY_DIPLO_TRADE_BUTTON" ;
		speech = "저희는 교역 거래를 하고 싶습니다..." ;
		action = function() UI.OnHumanOpenedTradeScreen(wEnemy:ID()) end ;
		enabled = condition_AtPeace ;
	};
	
	local b_demand_help = B{
		action = function() UI.OnHumanDemand(wEnemy:ID()) end ;
		speech = "우리는 당신에게 무언가를 부탁하고 싶습니다..." ;
		text = ConditionalText{
			"TXT_KEY_DIPLO_REQUEST_HELP_BUTTON" , condition_Allied ;
			"TXT_KEY_DIPLO_DEMAND_BUTTON" ;
		};
		tt_generic = ConditionalText{
			"TXT_KEY_DIPLO_REQUEST_HELP_BUTTON_TT" , condition_Allied ;
			"TXT_KEY_DIPLO_DEMAND_BUTTON_TT" ;
		};
		enabled = condition_AtPeace ;
	};
	
	---------------------------------------------------------
	--------- SHARE INTRIGUE
	
	local b_share_plot = B{
		text = ConditionalText{
			{"TXT_KEY_DIPLO_DISCUSS_MESSAGE_SHARE_INTRIGUE", Enemy:GetNameOrNick() }, NEVER ;
			"음모 공유..." ;
		};
		speech = "당신을 노리는 음모가 있는데, 당신이 이 사실을 알았으면 좋겠습니다..." ;
		tt_generic = DynamicText{"TXT_KEY_DIPLO_DISCUSS_MESSAGE_SHARE_INTRIGUE_TT", Enemy:GetNameOrNick() };
		possible = ALL{
			condition_AtPeace ;
			Human:HasRecentIntrigueAbout(Enemy) ;
			Human:IsAlive() ;
			NONE{ Enemy:IsHuman(); } ;
		};
		action = function() DoUIDiplo( "HUMAN_DISCUSSION_SHARE_INTRIGUE" , wHuman:GetRecentIntrigueInfo( wEnemy:ID() ) ) end ;
	};
	
	----------------------------------------------------------------
	-------------- STOP SPYING
	
	local b_stop_spying = B{
		text = "*스파이 파견 중지!*" ;
		--speech = "TXT_KEY_DIPLO_DISCUSS_MESSAGE_STOP_SPYING" ;
		speech = "스파이 짓을 그만두시오!" ;
		possible = ALL{
			NONE{ 
				Enemy:IsStopSpyingMessageTooSoon(Human); 
				condition_OnSameTeam ;
			};
			Human:HasAgents() ;
		};
		action = function() DoUIDiplo( "HUMAN_DISCUSSION_STOP_SPYING" ) end ;
	};
	
	---------------------------------------------------------------
	-------------- STOP RELIGION
	
	local b_stop_religion = B{
		text = "*선교사 파견 중지!*" ;
		speech = "TXT_KEY_DIPLO_DISCUSS_MESSAGE_STOP_SPREADING_RELIGION" ;
		possible = ALL{
			ANY{
				rC.GreaterZero( Human:GetNegativeReligiousConversionPoints(Enemy) ) ;
				Human:OwnsReligion() ;
				Enemy:OwnsReligion() ;
			};
			Enemy:IsAskedToStopConverting(Human) ;
		};
		action = function() DoUIDiplo( "HUMAN_DISCUSSION_STOP_SPREADING_RELIGION" ) end ;
	};
	
	-----------------------------------------------------------
	-------------- STOP SETTLING
	
	local b_stop_settle = B{
		text = "*주변 개척 중지!*" ;
		speech = L"TXT_KEY_DIPLO_DISCUSS_MESSAGE_DONT_SETTLE" ;
		possible = NONE{ Enemy:IsDontSettleMessageTooSoon(Human); } ;
		action = function() DoUIDiplo( "HUMAN_DISCUSSION_DONT_SETTLE" ) end ;
	};
	
	
	-----------------------------------------------------------
	------------- MOVE YOUR TROOPS
	local b_move_your_troops = B{
		text = "*주위 병력 철수!*" ;
		speech = ConditionalText{
			"TXT_KEY_DIPLO_DISCUSS_MESSAGE_MOVE_TROOPS_HOSTILE", Enemy:IsActHostileTowardsHuman(Human);
			"TXT_KEY_DIPLO_DISCUSS_MESSAGE_MOVE_TROOPS";
		};
		tt_generic = DynamicText{ "TXT_KEY_DIPLO_DISCUSS_MESSAGE_MOVE_TROOPS_TT", Enemy:GetNameOrNick() } ;
		possible = NONE{
			Enemy:MoveRequestTooSoon(Human); 
			rC.GreaterThan( 4 , Human:CountAggressiveMilitaryScore(Enemy) ) ;
		};
		action = function() DoUIDiplo( "HUMAN_MOVE_TROOPS_RESPONSE" ) end ;
	};
	
	----------------------------------------------------------
	------------ STOP DIGGING
	
	local b_stop_digging = B{
		text = "*도굴 중지!*" ;
		speech = "TXT_KEY_DIPLO_DISCUSS_MESSAGE_STOP_DIGGING" ;
		possible = ALL{
			rC.GreaterZero( Human:GetNegativeArchaeologyPoints(Enemy) ) ;
			NONE{ Enemy:IsAskedToStopDigging(Human) } ;
		};
		action = function() DoUIDiplo( "HUMAN_DISCUSSION_STOP_DIGGING" ) end ;
	};
	
	---------------------------------------------
	------- DENOUNCE, DOF AND CANCEL DOF
	
	local b_denounce = B{
		text = "비난하기" ;
		speech = ( Player.GetDenounceMessage and Human:GetDenounceMessage(Enemy) ) or randomText( "RESPONSE_WORK_AGAINST_SOMEONE" ) ;
		headline = "[COLOR_WARNING_TEXT]비난:[ENDCOLOR]" ;
		tt_generic = { "TXT_KEY_DIPLO_DISCUSS_DENOUNCE" , Enemy:GetNameOrNick() } ;
		--tt_generic = "TXT_KEY_DIPLO_DISCUSS_DENOUNCE_TT" ;
		possible = NONE{
			condition_OnSameTeam ;
			Enemy:IsDenounceMessageTooSoon( Human ) ;
		} ;
		action = function() DoUIDiplo( "DENOUNCE" ) end ;
	};
	
	local b_insult = B{
		text = "모욕하기" ;
		speech = randomText( "RESPONSE_INSULT_CITIES", "RESPONSE_INSULT_CULTURE", "RESPONSE_INSULT_GENERIC", "RESPONSE_INSULT_MILITARY", "RESPONSE_INSULT_POPULATION", "RESPONSE_INSULT_UNHAPPINESS" );
		action = function() DoUIDiplo( "MEAN_RESPONSE" ) end ;
		visible = Enemy:IsDenounceMessageTooSoon(Human) ;
	};
	
	local b_ask_dof = B{
		text = "우호 선언 제안" ;
		speech = randomText("TXT_KEY_DIPLO_DISCUSS_MESSAGE_DEC_FRIENDSHIP","RESPONSE_WORK_WITH_US") ;
		tt_generic = "TXT_KEY_DIPLO_DISCUSS_MESSAGE_DEC_FRIENDSHIP_TT" ;
		possible = NONE{
			condition_OnSameTeam ;
			Enemy:IsDoFMessageTooSoon( Human ) ;
		};
		action = function() DoUIDiplo( "HUMAN_DISCUSSION_WORK_WITH_US" ) end ;
	};
	
	local b_end_dof = B{
		text = "우호 선언 취소" ;
		speech = L"TXT_KEY_DIPLO_DISCUSS_MESSAGE_END_WORK_WITH_US" ;
		tt_generic = "TXT_KEY_DIPLO_DISCUSS_MESSAGE_END_DEC_FRIENDSHIP_TT" ;
		possible = condition_HasDoF ;
		action = function() DoUIDiplo( "HUMAN_END_WORK_WITH_US_RESPONSE" ) end ;
	};
	

	
	
	------------------------------------------
	------- ShallWeDeclareWarAgainst
	
	local coopWarSpeech = randomTextS( "RESPONSE_COOP_WAR_REQUEST" )
	
	local coopWarFilter = function( target )
		local show = Game.ShowThirdPartyTarget( wHuman:ID(), wEnemy:ID(), target ) ;
		if show then
			local poss, not_poss_reason = Game.CanRequestCoopWar(wHuman:ID(), wEnemy:ID(), target) ;
			if poss then
				not_poss_reason = coopWarSpeech( Players[target]:GetNameOrNick() ) ;
			else
				not_poss_reason = "[COLOR_WARNING_TEXT]이 플레이어를 대상으로 할 수 없음: " .. (not_poss_reason or "?") .. "[ENDCOLOR]" ;
			end
			return true, poss, not_poss_reason ;
		end
		return false ;
	end
	
	local coopCallback = function( target ) DoUIDiplo( "COOP_WAR_OFFER", target ) end
	
	local b_askWar = B{
		text = "협동 전쟁 요청..." ;
		action = function() displayLeaderPicker( coopWarFilter, coopCallback, "협동 전쟁 대상 선택.." ) end ;
		visible = condition_AtPeace ;
		enabled = ALL{
			condition_Allied ;
			function() return anyCivPassesFilter( coopWarFilter ) end ; 
		};
		tt_disabled = ConditionalText{
			L"TXT_KEY_DIPLO_DISCUSS_MESSAGE_DECLARE_WAR_NO_TARGET_TT", condition_Allied ;
			L"TXT_KEY_DIPLO_DISCUSS_MESSAGE_DECLARE_WAR_NOT_FRIENDS_TT"
		};
		tt_generic = L"TXT_KEY_DIPLO_DISCUSS_MESSAGE_DECLARE_WAR_TT" ;
	}
	
	--------------------------------
	------ What do you think of?
	
	local shareOpinionFilter = function( target )
		local show = Game.ShowThirdPartyTarget( wHuman:ID(), wEnemy:ID(), target ) ;
		if show then
			local poss, not_poss_reason = Game.CanAskOpinion( wHuman:ID(), wEnemy:ID(), target ) ;
			if poss then 
				not_poss_reason = "" .. Players[target]:GetNameOrNick() .. "에 대해 어떻게 생각하세요?" ;
			else
				not_poss_reason = "[COLOR_WARNING_TEXT]이 플레이어에 대해 의논할 수 없음: " .. (not_poss_reason or "?") .. "[ENDCOLOR]" 
			end
			return true, poss, not_poss_reason ;
		end
		return false ;
	end
	
	local opinionCallback = function( target ) DoUIDiplo( "HUMAN_DISCUSSION_SHARE_APPROACH", target ) end
	
	local b_askOpinion = B{
		text = L"TXT_KEY_DIPLO_DISCUSS_MESSAGE_SHARE_APPROACH" ;
		visible = condition_AtPeace ;
		enabled = function() return anyCivPassesFilter( shareOpinionFilter ) end ;
		action = function() displayLeaderPicker( shareOpinionFilter, opinionCallback, L"TXT_KEY_DIPLO_DISCUSS_MESSAGE_SHARE_APPROACH" ) end ;
	}
	
	-----------------------------------------------
	------- BACK
	local b_goodbye = B{
		text = "TXT_KEY_GOODBYE_BUTTON" ;
		action = fExit ;
	};
	
	
	
	----------------------------------------------
	--------- GENERATE BUTTONS AND SETUP UPDATE HOOK
	
	local function buttonclicked( v )
		local bbb = BUTTONS[v]
		if( bbb.speech ) then SPEAK( convertText(bbb.speech,true), convertText(bbb.headline,true) ) end
		bbb.action() 
	end
	
	for k = #BUTTONS , 1 , -1 do
		local v = BUTTONS[k] ;
		local buttoninstance = DIPLO_STACK:GetInstance().BUTTON ;
		v.inst = buttoninstance ;
		
		buttoninstance:RegisterCallback( Mouse.eLClick , buttonclicked )
		buttoninstance:SetVoid1( k )
	end
	
	local function updateButtons()
		hideLeaderPicker();
		for k,v in pairs(BUTTONS) do
			local buttoninstance = v.inst ;
			local visible = ( v.visible == nil ) or v.visible() ;
			local possible = ( v.possible == nil ) or v.possible() ;
			visible = visible and possible ;
			buttoninstance:SetHide( not visible ) ;
			if visible then
				local enabled = ( v.enabled == nil ) or v.enabled() ;
				enabled = enabled and possible ;
				buttoninstance:SetText(convertText(v.text,true));
				buttoninstance:SetDisabled( not enabled ) ;
				buttoninstance:SetToolTipString( convertText( ( (not enabled) and v.tt_disabled ) or v.tt_generic , true ) ) ;
			end

		end
	end
	addStateChangeListener(updateButtons);
end
-------------------------------------------------------------------







