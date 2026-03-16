CHAT_STACK = CHAT_STACK or GenerationalInstanceManager:new("MessageInstance","MESSAGE",Controls.MessageStack);
local CHAT_STACK = CHAT_STACK ;

local wHuman, wEnemy, wHumanTeam, wEnemyTeam, wState = wHuman, wEnemy, wHumanTeam, wEnemyTeam, wState ;

--__CHATS = nil ;
local allHistories = __CHATS or {};
__CHATS = allHistories ;

local TEXT_PADDING_TOP = 13 ;
local TEXT_PADDING_BOT = 18 ;
local TEXT_PADDING_SEP = 15 ;

local function updateChatWith( mess )

	local mb = CHAT_STACK:GetInstance();
	
	do -- Setup portrait and text anchors
	
		local anchor = "L,T" ;
		local offset = 32 ;
		if mess.right then
			anchor = "R,T" ;
			offset = 16 ;
		end
		mb.PAN:SetAnchor(anchor);
		mb.HEADFRAME:SetAnchor(anchor);
		mb.TEXT:SetOffsetX(offset);
		mb.TITLE:SetOffsetX(offset);
	end
	
	
	local label_size = 3 ;
	do -- Setup turn label
		local label = mess.label ;
		if label then
			mb.TURN:SetText(label);
			mb.TURNPANEL:SetToolTipString(mess.label_tt);
			local sizex = mb.TURN:GetSizeX() + 10 ;
			mb.TURNPANEL:SetSizeX(sizex);
			mb.TURN_BORDER:SetSizeX(sizex+4);
			mb.TURNPANEL:SetOffsetY(0);
			label_size = 32
		elseif not mess.portrait then
			label_size = -3
		end
		mb.TURNPANEL:SetHide(label == nil);
		
	end
	
	
	
	do -- Setup portrait
		local portrait = mess.portrait ;
		if portrait then
			local leader = GameInfo.Leaders[ Players[portrait]:GetLeaderType() ] ; 
			IconHookup( leader.PortraitIndex,64, leader.IconAtlas, mb.HEAD )
			CivIconHookup( portrait, 32, mb.CivIcon, mb.CivIconBG, mb.CivIconShadow, false, true )
		end
		mb.HEADFRAME:SetHide(portrait==nil);
	end
	
	do -- Set text and resize
		mb.PAN:SetOffsetY(label_size);
		
		local contentSize  = TEXT_PADDING_TOP ;
		
		mb.TITLE:SetHide(mess.headline==nil);
		if mess.headline then
			mb.TITLE:SetText(mess.headline);
			mb.TITLE:SetOffsetY(contentSize);
			contentSize = contentSize + mb.TITLE:GetSizeY() + TEXT_PADDING_SEP;
		end
		
		mb.TEXT:SetOffsetY( contentSize )
		mb.TEXT:SetText( mess.text );
		contentSize = contentSize + mb.TEXT:GetSizeY() + TEXT_PADDING_BOT ;
		mb.PAN:SetSizeY( contentSize  );
		mb.BORDER:SetSizeY( contentSize + 4 );
		label_size = contentSize + label_size ;
	end
	
	do -- Setup horizontal bar
		mb.SEP:SetHide( not mess.last ) ;
		if mess.last then
			label_size = label_size + 24 ;
			mb.SEP:SetOffsetY(8);
		end
	end
	
	mb.MESSAGE:SetSizeY(label_size);
end

local function updateVisibilityAll(history,show_all)
	local show = true ;
	for i = #history , 1 , -1 do
		if show_all or show then
			CHAT_STACK.m_Instances[i].MESSAGE:SetHide( false ) ;
			show = not history[i].new ;
		else
			CHAT_STACK.m_Instances[i].MESSAGE:SetHide( true ) ;
		end
	end
end

local slider_pos = 1 ;
local function sliderCallback(s)
	slider_pos = s ;
end
Controls.SBar:RegisterSliderCallback(sliderCallback);



local function triggerLayout()
	Controls.MessageStack:ReprocessAnchoring()
	Controls.ScrollPanel:CalculateInternalSize()
	Controls.ScrollPanel:ReprocessAnchoring()
	Controls.SBar:SetAndCall(slider_pos);
end

local function rebuildChat( history )
	CHAT_STACK:ResetInstances() ;
	for _,k in ipairs(history) do
		updateChatWith( k );
	end
	triggerLayout();
end

local activeHuman = Game.GetActivePlayer() ;
local activeEnemy = -1 ;
local activeHistory = nil ;

local chatmode = false;
local function setChatmode( mode )
	if not (chatmode==mode) then
		chatmode = mode ;
		updateVisibilityAll(activeHistory,chatmode) ;
		triggerLayout();
		local txt = ( mode and "Hide History" ) or "Show History" ;
		Controls.CHAT_TOGGLE:SetText( txt ) ;
	end
end
function toggleChatmode()
	setChatmode( not chatmode );
end
setCallback( Controls.CHAT_TOGGLE , toggleChatmode )

local function chatOnLeave() 
	if activeHistory[#activeHistory] then
		activeHistory[#activeHistory].last = true ;
	end
	setChatmode(false);
	activeEnemy = -1 ;
end
addLeaveLeaderListener(chatOnLeave);




local function updatePlayers( idhuman, idenemy )
	if idhuman == activeHuman and idenemy == activeEnemy then return end
	
	if activeHuman ~= idhuman then
		print("Active Player changed! Histories will be reset!") ;
		activeHuman = idhuman ;
		allHistories = {} ;
		GLOBALS.CHATS = allHistories ;
	end
	
	if not allHistories[idenemy] then
		allHistories[idenemy] = {}
	end
	
	if allHistories[activeEnemy] then
		chatOnLeave()
	end
	
	activeHistory = allHistories[idenemy] ;
	activeEnemy = idenemy ;
	rebuildChat( activeHistory );
end

local function moodIfChanged()
	local text = getMoodText( wHuman:ID() , wEnemy:ID() ) ;
end

local function SAY( who, to, text, headline )
	
	updatePlayers( wHuman:ID() , wEnemy:ID() )
	
	local count = #activeHistory ;
	
	local new = {
		tabid = count + 1 ;
		to = to ;
		--who = who ;
		text = text ;
		headline = headline ;
		turn = Game.GetGameTurn();
	};
	
	prev = activeHistory[count] ;
	
	if not prev or prev.last then
		new.new = true ;
		new.mood = getMoodText(wHuman:ID(),wEnemy:ID()) ;
		new.label = "[COLOR_LIGHT_GREY]" .. wEnemy:GetNameOrNick() .. "[ENDCOLOR]  ||  [COLOR_LIGHT_GREY]T" .. tostring( Game.GetGameTurn() ) .. " ~ " .. Game.GetTurnString() .. " [ENDCOLOR] || " .. new.mood ;

	else
		local mood = getMoodText( wHuman:ID(), wEnemy:ID() ) ;
		for i = count , 1 , -1 do
			local p = activeHistory[i] ;
			if p.mood then
				if p.mood ~= mood then
					new.mood = mood ;
					new.label = p.mood .. " -> " .. mood ;
				end
				break ;
			end
		end
	end
	
	if new.label then
		new.label_tt = GetMoodInfo( wEnemy:ID() ) ;
	end
	
	if who == wHuman:ID() then
		new.right = true ;
	end
	
	if new.label or new.new or (prev.right ~= new.right) then
		new.portrait = who ;
	end
	
	table.insert( activeHistory,new );
	
	updateChatWith( new );
	
	if new.label then
		updateVisibilityAll(activeHistory,chatmode)
	end
	triggerLayout();
end

function SPEAK( text, headline )
	SAY( wHuman:ID(), wEnemy:ID(), text, headline ) ;
	--	who	to		what	about	context
end

function LISTEN( text, headline )
	SAY( wEnemy:ID(), wHuman:ID(), text, headline ) ;
end