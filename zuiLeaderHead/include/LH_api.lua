--[[

Coded for use in my new LeaderHeadView but contains only general purpose code!

--]]

------------------------
-- Section A: misc

function getChildren( controlBase ) -- this is a hack, but why doesn't it exist to begin with??????
	local tmp = {} ;
	controlBase:SortChildren( function(a) tmp[a]=a; return false; end ) ;
	local ret = {} ;
	for k,v in pairs(tmp) do 
		table.insert(ret,a) 
	end
	return ret ;
end

function setCallback( ctrb, callback, id )
	id = id or Mouse.eLClick ;
	ctrb:ClearCallback( id );
	if callback then 
		ctrb:RegisterCallback( id, callback ) 
	end
end

function forAll( tab, fun, ... )
	for i = 1 , #tab do
		tab[i] = fun(tab[i], ...);
	end
	return tab ; 
end


----------------------------------------------------------------------------
---------------- API Extensions

--setmetatable(Teams, { __call = function(self,id) return Teams[id] end ; } )

for i = 0 , 63 do
	Players[i].__luaTeam = Teams[Players[i]:GetTeam()];
	Players[i].__team = Players[i]:GetTeam() ;
end

Player.HasAgents = function(p) return #p:GetEspionageSpies() > 0 end ;
Player.GetNameOrNick = function(p)
	if p:GetNickName() ~= "" and Game.IsNetworkMultiPlayer() then
		return p:GetNickName() ;
	else
		return p:GetName() ;
	end
end
Player.IsHasMet = function(p,t)
	return p.__luaTeam:IsHasMet(Players[t].__team) ;
end

local function createFunctionTable( metatable, instancetable )
	local mtt_index = {}
	for name,func in pairs(metatable) do
		mtt_index[name] = function( self , ... ) return func(instancetable[self],...) end
	end
	setmetatable(instancetable,{__index=mtt_index});
end

--createFunctionTable(Team,Teams);
--createFunctionTable(Player,Players);

function Game.ShowThirdPartyTarget( iMe, iPartner, iTarget )

	--Is target alive, a major Civ and has met us?
	local pTarget = Players[iTarget] ;
	if not ( pTarget:IsAlive() and pTarget:IsMajorCiv() and pTarget:IsHasMet(iMe) ) then 
		return false ;
	end
	
	--Is target NOT a teammate of us or our partner?
	local tTarget = pTarget.__team ;
	if tTarget == Players[iMe].__team or tTarget == Players[iPartner].__team then
		return false ;
	end
	
	return true ;
end

function Game.CanRequestCoopWar( iMe, iPartner, iTarget )
	
	local pTarget = Players[iTarget] ;
	if not pTarget:IsHasMet(iPartner) then
		return false, ("%s hasn't met %s yet!"):format( Players[iPartner]:GetNameOrNick(),pTarget:GetNameOrNick() ) ;
	end
	
	if pTarget:IsAtWarWith(iMe) then
		return false, ("You are already ar war with %s"):format( pTarget:GetNameOrNick() ) ;
	end
	
	if pTarget:IsAtWarWith(iPartner) then
		return false, ("%s is already at war with %s"):format(  Players[iPartner]:GetNameOrNick(),pTarget:GetNameOrNick() ) ;
	end

	if not Players[iMe]:CanRequestCoopWar(iPartner,iTarget) then
		return false, "Dll says no!" ;
	end
	return true ;
end

function Game.CanAskOpinion( iMe, iPartner, iTarget )
	local pTarget = Players[iTarget] ;
	if not pTarget:IsHasMet(iPartner) then
		return false, ("%s hasn't met %s yet!"):format( Players[iPartner]:GetNameOrNick(),pTarget:GetNameOrNick() ) ;
	end
	return true ;
end

function getWarStatusTooltip(idus,idthem)

	local pActivePlayer = Players[idus] ;
	local g_iAIPlayer = idthem ;

--	local iWarScore = pActivePlayer:GetWarScore(g_iAIPlayer);
--	local strWarScore = Locale.ConvertTextKey("TXT_KEY_WAR_SCORE", iWarScore);

--	Controls.WarScore:SetText(strWarScore);

	local strWarInfo = Locale.ConvertTextKey("TXT_KEY_WAR_SCORE_EXPLANATION");

	if(Players[g_iAIPlayer]:IsWantsPeaceWithPlayer(idus)) then
		local iPeaceValue = Players[g_iAIPlayer]:GetTreatyWillingToOffer(idus);
		if(iPeaceValue >  PeaceTreatyTypes.PEACE_TREATY_WHITE_PEACE) then
			if( iPeaceValue == PeaceTreatyTypes.PEACE_TREATY_ARMISTICE ) then
				strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_OFFER_PEACE_TREATY_ARMISTICE" );
			elseif( iPeaceValue == PeaceTreatyTypes.PEACE_TREATY_SETTLEMENT ) then
				strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_OFFER_PEACE_TREATY_SETTLEMENT" );
			elseif( iPeaceValue == PeaceTreatyTypes.PEACE_TREATY_BACKDOWN ) then
				strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_OFFER_PEACE_TREATY_BACKDOWN" );
			elseif( iPeaceValue == PeaceTreatyTypes.PEACE_TREATY_SUBMISSION ) then
				strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_OFFER_PEACE_TREATY_SUBMISSION" );
			elseif( iPeaceValue == PeaceTreatyTypes.PEACE_TREATY_SURRENDER ) then
				strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_OFFER_PEACE_TREATY_SURRENDER" );
			elseif( iPeaceValue == PeaceTreatyTypes.PEACE_TREATY_CESSION ) then
				strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_OFFER_PEACE_TREATY_CESSION" );
			elseif( iPeaceValue == PeaceTreatyTypes.PEACE_TREATY_CAPITULATION ) then
				strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_OFFER_PEACE_TREATY_CAPITULATION" );
			elseif( iPeaceValue == PeaceTreatyTypes.PEACE_TREATY_UNCONDITIONAL_SURRENDER ) then
				strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_OFFER_PEACE_TREATY_UNCONDITIONAL_SURRENDER" );
			end
		end
	else
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_NO_PEACE_OFFER" );
	end

	local iStrengthAverage = pActivePlayer:GetMilitaryStrengthComparedToUs(g_iAIPlayer);
	if( iStrengthAverage == StrengthTypes.STRENGTH_PATHETIC ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_STRENGTH_PATHETIC" );
	elseif( iStrengthAverage == StrengthTypes.STRENGTH_WEAK ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_STRENGTH_WEAK" );
	elseif( iStrengthAverage == StrengthTypes.STRENGTH_POOR ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_STRENGTH_POOR" );
	elseif( iStrengthAverage == StrengthTypes.STRENGTH_AVERAGE ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_STRENGTH_AVERAGE" );
	elseif( iStrengthAverage == StrengthTypes.STRENGTH_STRONG ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_STRENGTH_STRONG" );
	elseif( iStrengthAverage == StrengthTypes.STRENGTH_POWERFUL ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_STRENGTH_POWERFUL" );
	elseif( iStrengthAverage == StrengthTypes.STRENGTH_IMMENSE ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_STRENGTH_IMMENSE" );
	end

	local iEconomicAverage = pActivePlayer:GetEconomicStrengthComparedToUs(g_iAIPlayer);
	if( iEconomicAverage == StrengthTypes.STRENGTH_PATHETIC ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_ECONOMY_PATHETIC" );
	elseif( iEconomicAverage == StrengthTypes.STRENGTH_WEAK ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_ECONOMY_WEAK" );
	elseif( iEconomicAverage == StrengthTypes.STRENGTH_POOR ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_ECONOMY_POOR" );
	elseif( iEconomicAverage == StrengthTypes.STRENGTH_AVERAGE ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_ECONOMY_AVERAGE" );
	elseif( iEconomicAverage == StrengthTypes.STRENGTH_STRONG ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_ECONOMY_STRONG" );
	elseif( iEconomicAverage == StrengthTypes.STRENGTH_POWERFUL ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_ECONOMY_POWERFUL" );
	elseif( iEconomicAverage == StrengthTypes.STRENGTH_IMMENSE ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_ECONOMY_IMMENSE" );
	end

	local iOurWarDamage = pActivePlayer:GetWarDamageValue(g_iAIPlayer);
	local iTheirWarDamage = Players[g_iAIPlayer]:GetWarDamageValue(idus);
	local iTotal = iTheirWarDamage - iOurWarDamage;

	if (iTotal > 0) then
		if (iTotal >= GameDefines.WAR_DAMAGE_LEVEL_THRESHOLD_CRIPPLED) then
			strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_DAMAGE_THEM_CRIPPLED" );
		elseif (iTotal >= GameDefines.WAR_DAMAGE_LEVEL_THRESHOLD_SERIOUS) then
			strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_DAMAGE_THEM_SERIOUS" );
		elseif (iTotal >= GameDefines.WAR_DAMAGE_LEVEL_THRESHOLD_MAJOR) then
			strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_DAMAGE_THEM_MAJOR" );
		elseif (iTotal >= GameDefines.WAR_DAMAGE_LEVEL_THRESHOLD_MINOR) then
			strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_DAMAGE_THEM_MINOR" );
		end
	elseif (iTotal < 0) then
		if (iTotal <= -GameDefines.WAR_DAMAGE_LEVEL_THRESHOLD_CRIPPLED) then
			strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_DAMAGE_US_CRIPPLED" );
		elseif (iTotal <= -GameDefines.WAR_DAMAGE_LEVEL_THRESHOLD_SERIOUS) then
			strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_DAMAGE_US_SERIOUS" );
		elseif (iTotal <= -GameDefines.WAR_DAMAGE_LEVEL_THRESHOLD_MAJOR) then
			strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_DAMAGE_US_MAJOR" );
		elseif (iTotal <= -GameDefines.WAR_DAMAGE_LEVEL_THRESHOLD_MINOR) then
			strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_DAMAGE_US_MINOR" );
		end
	end

	local iTheirWarWeariness = Players[g_iAIPlayer]:GetHighestWarWearinessPercent();
	if(iTheirWarWeariness <= 0)then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_WEARINESS_THEM_NONE" );
	elseif( iTheirWarWeariness <= 25 ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_WEARINESS_THEM_MINOR" );
	elseif( iTheirWarWeariness <= 50 ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_WEARINESS_THEM_MAJOR" );
	elseif( iTheirWarWeariness <= 75 ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_WEARINESS_THEM_SERIOUS" );
	elseif( iTheirWarWeariness > 75 ) then
		strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey( "TXT_KEY_WAR_WEARINESS_THEM_CRIPPLED" );
	end

	local iOurWarWeariness = pActivePlayer:GetWarWearinessPercent(g_iAIPlayer);
	local iWarDuration = pActivePlayer:GetWarDuration(g_iAIPlayer);
	strWarInfo = strWarInfo .. '[NEWLINE]' .. Locale.ConvertTextKey("TXT_KEY_WAR_WEARINESS_US_PERCENT", iOurWarWeariness, iWarDuration);
		
	return strWarInfo ;
end

function getMoodText(idus, idthem)
	local pActivePlayer = Players[idus]
	local pActiveTeam = pActivePlayer.__luaTeam ;
	local g_iAIPlayer = idthem ;
	local g_iAITeam = Players[idthem]:GetTeam();
	local playerLeaderInfo = GameInfo.Leaders[Players[idthem]:GetLeaderType()];
	
	local iApproach = pActivePlayer:GetApproachTowardsUsGuess(g_iAIPlayer);
	local color ;
	local strMoodText = "[COLOR_LIGHT_GREY]" .. Locale.ConvertTextKey("TXT_KEY_EMOTIONLESS") .. "[ENDCOLOR]" ;
	
	

	if (Players[g_iAIPlayer]:IsAlive()) then
		if (not pActivePlayer:IsAlive()) then
			strMoodText = Locale.ConvertTextKey( "TXT_KEY_DIPLO_MAJOR_CIV_DIPLO_STATE_NEUTRAL", playerLeaderInfo.Description );
			color = "PLAYER_LIGHT_GREEN" ;
		else
			if (pActiveTeam:IsAtWar(g_iAITeam)) then
				strMoodText = Locale.ConvertTextKey( "TXT_KEY_DIPLO_MAJOR_CIV_DIPLO_STATE_WAR" ); -- already in color
			elseif (Players[g_iAIPlayer]:IsDenouncingPlayer(idus)) then
				strMoodText = Locale.ConvertTextKey( "TXT_KEY_DIPLO_MAJOR_CIV_DIPLO_STATE_DENOUNCING" ); --already in color
			elseif (Players[g_iAIPlayer]:WasResurrectedThisTurnBy(idus)) then
				strMoodText = Locale.ConvertTextKey( "TXT_KEY_DIPLO_MAJOR_CIV_DIPLO_STATE_LIBERATED" );
				color = "CYAN" ;
			else
				if( iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_WAR ) then -- Planning war???
					strMoodText = Locale.ConvertTextKey( "TXT_KEY_WAR_CAPS" );
					color = "RED" ;
				elseif( iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_HOSTILE ) then
					strMoodText = Locale.ConvertTextKey( "TXT_KEY_DIPLO_MAJOR_CIV_DIPLO_STATE_HOSTILE", playerLeaderInfo.Description );
					color = "RED" ;
				elseif( iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_GUARDED ) then
					strMoodText = Locale.ConvertTextKey( "TXT_KEY_DIPLO_MAJOR_CIV_DIPLO_STATE_GUARDED", playerLeaderInfo.Description );
					color = "YELLOW" ;
				elseif( iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_AFRAID ) then
					strMoodText = Locale.ConvertTextKey( "TXT_KEY_DIPLO_MAJOR_CIV_DIPLO_STATE_AFRAID", playerLeaderInfo.Description );
					color = "YELLOW" ;
				elseif( iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_FRIENDLY ) then
					strMoodText = Locale.ConvertTextKey( "TXT_KEY_DIPLO_MAJOR_CIV_DIPLO_STATE_FRIENDLY", playerLeaderInfo.Description );
					color = "GREEN" ;
				else
					strMoodText = Locale.ConvertTextKey( "TXT_KEY_DIPLO_MAJOR_CIV_DIPLO_STATE_NEUTRAL", playerLeaderInfo.Description );
					color = "PLAYER_LIGHT_GREEN" ;
				end
			end
		end
	end
	if color == nil then
		return strMoodText ;
	else
		return "[COLOR_" .. color .. "]" .. strMoodText .. "[ENDCOLOR]" ;
	end
end
-----------------------------------------------------------------------------------------------------------
---------------- 


local METATABLE_RESOLVETYPE_FUNCTION = { __RESOLVETYPE = "function" } ;

local type = type ;
local rtype = function( obj )
	local ty = type(obj)
	return (ty == "table" and obj.__RESOLVETYPE) or ty ;
end 


--[[
	A version of 'unpack' that applies 'fun' to each element unpacked 
	'idx' is the starting index, while #tab is always the last element 
	'...' are passed to the transform function as additional arguments
--]]
local function unpackAndTransform( tab, fun, idx, ... )
	--print( "unpackAndTransform", tab, type(tab), #tab, fun, idx, ... ) ;
	if idx > #tab then
		return ;
	elseif idx == #tab then
		return fun( tab[idx], ... ) ;
	else
		return fun( tab[idx], ... ), unpackAndTransform( tab, fun, idx+1, ... ) ;
	end
end

local function R( obj )
	if rtype(obj) == "function" then
		return obj()
--	elseif ty == "table" and wtype(obj[1])=="function" then
--		return obj[1](R(obj[2]),R(obj[3]),R(obj[4])) ;
	else
		return obj ;
	end
end

local METATABLE_CALLABLE_TABLE = { __index = METATABLE_RESOLVETYPE_FUNCTION }
METATABLE_CALLABLE_TABLE.__call = function( obj )
	return obj[1]( unpackAndTransform( obj, R, 2 ) ) ;
end


function FT( t ) return setmetatable(t,METATABLE_CALLABLE_TABLE) end


----- kind of a pointer
-- TODO: rethink this mess, because it looks a bit ugly, even if it works fine
function newObjectWithIdWrapper(amount)
	
	local tId ;
	local idf = function() return tId end ;
	local META = {}
	local WRAPPER = {}
	WRAPPER.__setTarget = function( obj, id ) META.__index = obj ; tId = id end
	WRAPPER.__WRAPPED = true ;
	WRAPPER.ID = idf ;
	WRAPPER.__AS_ARGUMENT = idf ;
	--WRAPPER.__ID = tId ;
	META.__call = function() return WRAPPER end
	
	setmetatable(WRAPPER, META);
	
	if amount > 1 then
		return WRAPPER, newObjectWithIdWrapper( amount-1 ) ;
	else
		return WRAPPER ;
	end
end




function newRecorder( obj, dont_consider_first_arg_as_self )
	local rec_func ;
	local self = {
		__AS_ARGUMENT = obj.__AS_ARGUMENT or obj ;
	};
	local function totalMadness( ... )
		--maybeself = ( maybeself == self and obj) or maybeself
		local RES = { rec_func, ... } ;
		local selfarg = RES[2] == self ;
		local idx = 2 ; --( dont_consider_first_arg_as_self and 2 ) or 3 ;
		if selfarg then idx = 3 ; RES[2] = obj end
		while idx <= #RES do
			if type(RES[idx]) == "table" and RES[idx].__AS_ARGUMENT then
				RES[idx] = RES[idx].__AS_ARGUMENT ;
			end
			idx = idx + 1 ;
		end
		return setmetatable(RES, METATABLE_CALLABLE_TABLE);
	end;
	
	local function index( some_empty_table, name )
		local orig = obj[name] ;
		if rtype(orig) ~= "function" then error("Unsupported orig:", orig) end
		rec_func = orig ;
		return totalMadness
	end;
	return setmetatable( self , { __index = index } ) ;
end


RECORDER_UTILS = newRecorder({
	Nequal = function( x,y ) return R(x) ~= R(y) end ;
	Equal = function( x,y ) return R(x) == R(y) end ;
	GreaterZero = function( x ) return R(x) > 0 end ;
	GreaterThan = function( x,y ) return R(x) > R(y) end ;
},true);




-- returns the lowest r = offset + m*2 for which tt[r+2] is either nil or returns true when called
local function TTMETATABLE_HELP_FUNC( tt, offset )
	return ( ( tt[2+offset] == nil or tt[2+offset]() ) and offset ) or TTMETATABLE_HELP_FUNC(tt, offset+2) ;
end
local TTMETATABLE = { __index = METATABLE_RESOLVETYPE_FUNCTION ; __call = function( tt ) return tt[TTMETATABLE_HELP_FUNC(tt,0)+1] end }
function ConditionalText( t ) return setmetatable(t, TTMETATABLE) end
function DynamicText( t ) return ConditionalText{t} end
DT,CT = DynamicText, ConditionalText ;



local TABLELOGIC_OR = {
	__call = function( t, offset )
		offset = offset or 0;
		return t[1+offset]() or (t[offset+2] and t(offset+1))
	end ;
	__index = METATABLE_RESOLVETYPE_FUNCTION ;
}
function ANY( t ) return setmetatable(t, TABLELOGIC_OR) end

local TABLELOGIC_AND = {
	__call = function( t, offset )
		offset = offset or 0;
		return t[1+offset]() and ((t[offset+2] == nil) or t(offset+1)) ;
	end ;
	__index = METATABLE_RESOLVETYPE_FUNCTION ;
}
function ALL( t ) return setmetatable(t, TABLELOGIC_AND) end

local TABLELOGIC_NONE = {
	__call = function( t,offset )
		offset = offset or 0;
		return (not t[1+offset]()) and ((t[offset+2] == nil) or t(offset+1)) ;
	end ;
	__index = METATABLE_RESOLVETYPE_FUNCTION ;
}
function NONE( t ) return setmetatable(t, TABLELOGIC_NONE) end
NEVER = function() return false end
ALWAYS = function() return true end

L = Locale.ConvertTextKey ;
local L = L ;


--This is terrible. Will remove in the future. Surely.
local function removePostNewline( str )
	return string.sub(str,1,(string.find(str,"NEWLINE")or 1)-2);
end

function randomText( ... )
	local ret = {} ;
	for i = 1 , select("#",...) do
		local txt = select(i,...);
		if txt:find("RESPONSE_") == 1 then
			for row in DB.Query( "Select Tag,Response from Diplomacy_Responses, Language_en_US where LeaderType = 'GENERIC' and ResponseType = ? and Tag like Response", txt ) do
				if #row.Tag < #row.Response + 3 then
					ret[#ret+1] = removePostNewline(L(row.Tag)) ;
				else
					print( txt, row.Tag, L(row.Tag) ) ;
				end
			end
		else
			ret[#ret+1] = removePostNewline(L(txt)) ;
		end
	end
	return function() return ret[math.random(1,#ret)] end
end

function randomTextS( ... )
	local ret = {} ;
	for i = 1 , select("#",...) do
		local txt = select(i,...);
		if txt:find("RESPONSE_") == 1 then
			for row in DB.Query( "Select Tag from Diplomacy_Responses, Language_en_US where LeaderType = 'GENERIC' and ResponseType = ? and Tag like Response", txt ) do
				ret[#ret+1] = row.Tag ;
			end
		else
			ret[#ret+1] = txt ;
		end
	end
	return function(s) return L(ret[math.random(1,#ret)],s) end
end

local function C( obj , now , nilovr )
	local _type = rtype(obj);
	--print( obj, _type, now, nilovr ) ;
	if _type == "string" then 
		if obj:find("TXT_KEY_") == 1 then return L(obj) end
	elseif _type == "table" then
		if now or not obj.defer then
			-- Locale.ConvertTextKey throws when passing nil as any argument, even when the text key in question doesn't use it....
			--print("localetransform")
			return L(obj[1], unpackAndTransform( obj, C, 2, true, 0 ) )
		end
	elseif now and ( _type == "function" ) then
		return C(obj());
	end
	return obj or nilovr ;
end
convertText = C ;

