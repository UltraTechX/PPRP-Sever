local Warnings_for_kick = 3

-- Sepreate each group with a comma, but don't put one at the last value. Just follow this pattern and add any groups that should count as staff in the command
local staffgroups = {
	"Owner",
	"superadmin",
	"admin",
	"Moderator",
	"TrialModerator"
}

for k,v in pairs(player.GetAll()) do
	if v:query("ulx ban") or v:query("ulx seeasay") then
		table.insert(staffgroups,v)
	end
end

function ulx.liststaff(calling_ply)
	local stafflist = {}
	for _,ply in pairs(player.GetAll()) do
		if table.HasValue(staffgroups,ply:GetUserGroup()) then
			table.insert(stafflist,ply)
		end
	end
	local str = ""
	for k,v in pairs(stafflist) do
		if k == #stafflist then
			str = str .. v:Nick() .. " (" .. v:GetUserGroup() .. ")"
		else
			str = str .. v:Nick() .. " (" .. v:GetUserGroup() .. "), "
		end
	end
	ulx.fancyLogAdmin(calling_ply,{calling_ply},"Current online staff: #s", str)
end
local liststaff = ulx.command("Surplus","ulx liststaff",ulx.liststaff,{"!admins","!staff","liststaff"})
liststaff:defaultAccess( ULib.ACCESS_ALL )
liststaff:help( "List current online staff members" )

function ulx.banip(calling_ply,adress,should_unban)
	if should_unban then
		ULib.consoleCommand( "removeip ".. adress .. "\n" )
		ulx.fancyLogAdmin(calling_ply,true,"#A unbanned IP #s",adress)
	else
		for _,ply in pairs(player.GetAll()) do
		    if string.Explode(":",ply:IPAddress())[1] == adress then
        		ply:SendLua([[
        			cam.End3D()
        		]])
    	    end
	    end
		ULib.consoleCommand( "addip 0 ".. adress .. "\n" )
		ulx.fancyLogAdmin(calling_ply,true,"#A banned IP #s",adress)
	end
end
local banip = ulx.command("Surplus","ulx banip",ulx.banip,"!banip")
banip:addParam{ type=ULib.cmds.StringArg, hint="IP Adress", ULib.cmds.takeRestOfLine }
banip:addParam{ type=ULib.cmds.BoolArg, invisible=true }
banip:defaultAccess( ULib.ACCESS_SUPERADMIN  )
banip:help( "Ban IP with SRCDS" )
banip:setOpposite( "ulx unbanip", {_,_, true}, "!unbanip" )

function ulx.crash(calling_ply, target_ply)
        target_ply:SendLua([[
			while true do end
		]])
		ulx.fancyLogAdmin( calling_ply, true,  "#T was crashed by #A", target_ply)
end
local crash = ulx.command("Extended", "ulx crash", ulx.crash)
crash:addParam{ type=ULib.cmds.PlayerArg }
crash:defaultAccess( ULib.ACCESS_SUPERADMIN )

function ulx.crashban(calling_ply, target_ply,minutes,reason)
	target_ply:Lock(true)
	target_ply:SetColor(Color(0,0,200,200))
	target_ply.BeingBanned = true
        target_ply:SendLua([[
			while true do end
		]])
	local admin,steamid,time,reason, name = calling_ply,target_ply:SteamID(),minutes,reason,target_ply:Nick()
	do
		local admin_name
		if admin then
			admin_name = "(Console)"
			if admin:IsValid() then
				admin_name = string.format( "%s(%s)", admin:Name(), admin:SteamID() )
			end
		end

		local t = {}
		if ULib.bans[ steamid ] then
			t = ULib.bans[ steamid ]
			t.modified_admin = admin_name
			t.modified_time = os.time()
		else
			t.admin = admin_name
		end
		t.time = t.time or os.time()
		if time > 0 then
			t.unban = ( ( time * 60 ) + os.time() )
		else
			t.unban = 0
		end
		if reason then
			t.reason = reason
		end
		if name then
			t.name = name
		end
		ULib.bans[ steamid ] = t
		ULib.fileWrite( ULib.BANS_FILE, ULib.makeKeyValues( ULib.bans ) )
		
		game.ConsoleCommand( string.format( "banid %f %s\n", time, steamid ) )
		game.ConsoleCommand( "writeid\n" )
	end
	
	do
		local time = "for #i minute(s)"
		if minutes == 0 then time = "permanently" end
		local str = "#T will be banned " .. time .. " on disconnect"
		if reason and reason ~= "" then str = str .. " (#s)" end
		ulx.fancyLogAdmin( calling_ply, str, target_ply, minutes ~= 0 and minutes or reason, reason )
	end
	
end
local crashban = ulx.command("Extended", "ulx crashban", ulx.crashban)
crashban:addParam{ type=ULib.cmds.PlayerArg }
crashban:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
crashban:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
crashban:defaultAccess( ULib.ACCESS_SUPERADMIN )

local RecentDCs = RecentDCs or {}
if SERVER then

	function addToRecent(ply)
	
	local plytable = {
		time = ply:TimeConnected(),
		id = ply:SteamID(),
		nick = ply:Nick()
	}
	
	table.insert(RecentDCs,1,plytable)
	if #RecentDCs >= 16 then
		for i = 16,#RecentDCs do
			table.remove(RecentDCs,i)
		end
	end
	
	end
	hook.Add( "PlayerDisconnected", "addtodctable", addToRecent )

end

function ulx.recentdcs(calling_ply)
	net.Start("RecentDCs")
		net.WriteTable(RecentDCs)
	net.Send(calling_ply)
end
local recentdcs = ulx.command("Extended", "ulx recentdcs", ulx.recentdcs)
recentdcs:defaultAccess( ULib.ACCESS_ALL )


if CLIENT then

	net.Receive("RecentDCs", function(len)
		local RecentDCs = net.ReadTable()
		print("recieved dclist")
		chat.AddText( Color(151, 211, 255), "Check console.")
		for k,v in pairs(RecentDCs) do
			print(v.nick)
		end
		
	end)



	net.Receive("RecentDCsMenu", function(len)
		local RecentDCs = net.ReadTable()
		DCMenu(RecentDCs)
	end)

end


local function receive_message(len, ply)
	if ULib.ucl.query( ply, "ulx ban") then
	local IDNick = net.ReadString()
	local datatable = string.Explode("{sep}",IDNick)
	local steamid = datatable[1]
	local nick = datatable[2]
		ULib.addBan( steamid, 0, "Avoiding punishment", nick, ply )
		ulx.fancyLogAdmin( ply, "#A banned #s(#s) for avoiding punishment!",nick,steamid)
	else
		ply:Kick("Attempted exploit")
	end
end
net.Receive("banleaver", receive_message)

function ulx.dcban(calling_ply, target_str,minutes,reason)
	local dcbanTargets = {}
	for k,v in pairs(RecentDCs) do
		if string.match(v.nick:lower(), target_str:lower()) then
			table.insert(dcbanTargets,v)
		end
	end
	
	if #dcbanTargets > 1 then ULib.tsayError(calling_ply,"More than one match!") return end
	if #dcbanTargets == 0 then ULib.tsayError(calling_ply,"No matches!") return end
	
	
	
	local time = "for #i minute(s)"
	if minutes == 0 then time = "permanently" end
	local str = "#A banned #s " .. time
	if reason and reason ~= "" then str = str .. " (#s)" end
	
	
	for k,v in pairs(dcbanTargets) do
		ULib.addBan( v.id, minutes,reason, v.nick, calling_ply )
		ulx.fancyLogAdmin( calling_ply,str,v.nick,minutes,reason)
	end

end
local dcban = ulx.command("Extended", "ulx dcban", ulx.dcban, "!dcban",true)
dcban:addParam{ type=ULib.cmds.StringArg, hint="leaver"}
dcban:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
dcban:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
dcban:defaultAccess( ULib.ACCESS_ADMIN )
dcban:help( "Bans the disconnected player" )


if SERVER then
	util.AddNetworkString( "RecentDCs" )
	util.AddNetworkString( "RecentDCsMenu" )
	util.AddNetworkString( "banleaver" )
end

function ulx.give(calling_ply,wep,target_ply)
	if not target_ply then target_ply = calling_ply end
	local isvalid = IsValid(target_ply:Give(wep))
	if isvalid then
		ulx.fancyLogAdmin( calling_ply, "#A gave #s to #T", wep, target_ply )
	else
		ULib.tsayError(calling_ply, wep.." is not a valid entity", true)
	end	
end
local give = ulx.command("Extended", "ulx give", ulx.give, "!give", true)
give:defaultAccess( ULib.ACCESS_ADMIN )
give:addParam{ type=ULib.cmds.StringArg, hint="weapon", ULib.cmds.optional }
give:addParam{ type=ULib.cmds.PlayerArg, ULib.cmds.optional }

function ulx.cleanup(calling_ply)
	game.CleanUpMap()
	ulx.fancyLogAdmin( calling_ply, "#A cleaned up the map")
end
local cleanup = ulx.command("Extended", "ulx cleanup", ulx.cleanup, "!cleanup", true)
cleanup:defaultAccess( ULib.ACCESS_SUPERADMIN )
cleanup:help( "Cleanup map (any gamemode)." )


if GetConVarString("gamemode") == "terrortown" then

	function ulx.walkspeed(calling_ply,speed)
		local ptab = FindMetaTable("Player")
		function ptab:SetSpeed(slowed)		
			if slowed then
				self:SetWalkSpeed(speed * 0.54)
			else
				self:SetWalkSpeed(speed)
			end
		end
		ulx.fancyLogAdmin( calling_ply, "#A set global walk speed to #s", speed )
	end
	local walkspeed = ulx.command("Extended", "ulx walkspeed", ulx.walkspeed, "!walkspeed",true)
	walkspeed:addParam{ type=ULib.cmds.NumArg, hint="player speed", min=1 }
	walkspeed:defaultAccess( ULib.ACCESS_ADMIN )
	walkspeed:help( "set walking speed for a player." )
	
	function ulx.runspeed(calling_ply,speed)
	
		local ptab = FindMetaTable("Player")
		function ptab:SetSpeed(slowed)		
			if slowed then
				self:SetRunSpeed(speed * 0.54)
			else
				self:SetRunSpeed(speed)
			end
		end
	
		ulx.fancyLogAdmin( calling_ply, "#A set global runspeed to #s", speed )
	end
	local runspeed = ulx.command("Extended", "ulx runspeed", ulx.runspeed, "!runspeed",true)
	runspeed:addParam{ type=ULib.cmds.NumArg, hint="player speed", min=1 }
	runspeed:defaultAccess( ULib.ACCESS_ADMIN )
	runspeed:help( "set running speed for a player." )
	
	function ulx.size(calling_ply, scale,bool)
	
		local affected_plys = {}
	
		for k,v in pairs(player.GetAll()) do
			v:SetViewOffset(Vector(0,0,64*scale))
			v:SetViewOffsetDucked(Vector(0,0,28*scale))
			v:SetModelScale(scale, 0)
			if bool == true then
				local ptab = FindMetaTable("Player")
				function ptab:SetSpeed(slowed)		
					if slowed then
						self:SetRunSpeed(200*scale*0.54)
						self:SetJumpPower(200*scale*0.54)
						self:SetWalkSpeed(200*scale*0.54)
						
					else
						self:SetRunSpeed(200*scale)
						self:SetJumpPower(200*scale)
						self:SetWalkSpeed(200*scale)
					end
				end
			end
		end
		
		if bool == false then
			ulx.fancyLogAdmin( calling_ply, "#A set global model scale to #s", scale)
		else
			ulx.fancyLogAdmin( calling_ply, "#A set global model,speed, and jump scale to #s",scale)
		end
	end
	local size = ulx.command("Extended", "ulx size", ulx.size, "!size",true)
	size:addParam{ type=ULib.cmds.NumArg, hint="scale", min=0.1 }
	size:addParam{ type=ULib.cmds.BoolArg,hint="scale other stats", }
	size:defaultAccess( ULib.ACCESS_ADMIN )
	size:help( "set global size of a player." )

else	-- TTT defines walkspeed and runspeed, so we need to dupe it, and make edgy fixes.

	function ulx.size(calling_ply, target_plys,scale,bool)
	
		local affected_plys = {}
	
		for i=1, #target_plys do
			local v = target_plys[ i ]
			v:SetViewOffset(Vector(0,0,64*scale))
			v:SetViewOffsetDucked(Vector(0,0,28*scale))
			v:SetModelScale(scale, 0)
			if bool == true then
				v:SetRunSpeed(500*scale)
				v:SetJumpPower(200*scale)
				v:SetWalkSpeed(200*scale)
			end
		end
		
		if bool == false then
			ulx.fancyLogAdmin( calling_ply, "#A set model scale for #T to #s", target_plys,scale)
		else
			ulx.fancyLogAdmin( calling_ply, "#A set model,speed, and jump scale for #T to #s", target_plys,scale)
		end
	end
	local size = ulx.command("Extended", "ulx size", ulx.size, "!size",true)
	size:addParam{ type=ULib.cmds.PlayersArg }
	size:addParam{ type=ULib.cmds.NumArg, hint="scale", min=0.1 }
	size:addParam{ type=ULib.cmds.BoolArg,hint="scale other stats", }
	size:defaultAccess( ULib.ACCESS_ADMIN )
	size:help( "set size of a player." )
	
	
	function ulx.globalsize(calling_ply, scale,bool)
	
		local affected_plys = {}
	
		for k,v in pairs(player.GetAll()) do
			v:SetViewOffset(Vector(0,0,64*scale))
			v:SetViewOffsetDucked(Vector(0,0,28*scale))
			v:SetModelScale(scale, 0)
		
			if bool == true then
				v:SetRunSpeed(500*scale)
				v:SetJumpPower(200*scale)
				v:SetWalkSpeed(200*scale)
			end
		end
		
		if bool == false then
			ulx.fancyLogAdmin( calling_ply, "#A set global model scale to #s", scale)
		else
			ulx.fancyLogAdmin( calling_ply, "#A set global model,speed, and jump scale to #s",scale)
		end
	end
	local globalsize = ulx.command("Extended", "ulx globalsize", ulx.globalsize, "!globalsize",true)
	globalsize:addParam{ type=ULib.cmds.NumArg, hint="scale", min=0.1 }
	globalsize:addParam{ type=ULib.cmds.BoolArg,hint="scale other stats", }
	globalsize:defaultAccess( ULib.ACCESS_ADMIN )
	globalsize:help( "set global size of a player." )
	
	function ulx.walkspeed(calling_ply, target_ply,speed)
		target_ply:SetWalkSpeed(speed)
		ulx.fancyLogAdmin( calling_ply, "#A set walk speed for #T to #s", target_ply,speed )
	end
	local walkspeed = ulx.command("Extended", "ulx walkspeed", ulx.walkspeed, "!walkspeed",true)
	walkspeed:addParam{ type=ULib.cmds.PlayerArg }
	walkspeed:addParam{ type=ULib.cmds.NumArg, hint="player speed", min=1 }
	walkspeed:defaultAccess( ULib.ACCESS_ADMIN )
	walkspeed:help( "set walking speed for a player." )
	
	
	function ulx.runspeed(calling_ply, target_ply,speed)
		target_ply:SetRunSpeed(speed)
		ulx.fancyLogAdmin( calling_ply, "#A set run speed for #T to #s", target_ply,speed )
	end
	local runspeed = ulx.command("Extended", "ulx runspeed", ulx.runspeed, "!runspeed",true)
	runspeed:addParam{ type=ULib.cmds.PlayerArg }
	runspeed:addParam{ type=ULib.cmds.NumArg, hint="player speed", min=1 }
	runspeed:defaultAccess( ULib.ACCESS_ADMIN )
	runspeed:help( "set running speed for a player." )
	
	function ulx.globalwalkspeed(calling_ply,speed)
		for k,v in pairs(player.GetAll()) do
			v:SetWalkSpeed(speed)
		end
		ulx.fancyLogAdmin( calling_ply, "#A set global walk speed to #s", speed )
	end
	local globalwalkspeed = ulx.command("Extended", "ulx globalwalkspeed", ulx.globalwalkspeed, "!globalwalkspeed",true)
	globalwalkspeed:addParam{ type=ULib.cmds.NumArg, hint="player speed", min=1 }
	globalwalkspeed:defaultAccess( ULib.ACCESS_ADMIN )
	globalwalkspeed:help( "set walking speed for a player." )
	
	function ulx.globalrunspeed(calling_ply,speed)
			for k,v in pairs(player.GetAll()) do
				v:SetRunSpeed(speed)
			end
		ulx.fancyLogAdmin( calling_ply, "#A set global run speed to #s", speed )
	end
	local globalrunspeed = ulx.command("Extended", "ulx globalrunspeed", ulx.globalrunspeed, "!globalrunspeed",true)
	globalrunspeed:addParam{ type=ULib.cmds.NumArg, hint="player speed", min=1 }
	globalrunspeed:defaultAccess( ULib.ACCESS_ADMIN )
	globalrunspeed:help( "set running speed for a player." )


end


function ulx.jumppower(calling_ply, target_ply,power)
	target_ply:SetJumpPower(power)
	ulx.fancyLogAdmin( calling_ply, "#A set jump power for #T to #s", target_ply,power )
end
local jumppower = ulx.command("Extended", "ulx jumppower", ulx.jumppower, "!jumppower",true)
jumppower:addParam{ type=ULib.cmds.PlayerArg }
jumppower:addParam{ type=ULib.cmds.NumArg, hint="player power", min=1 }
jumppower:defaultAccess( ULib.ACCESS_ADMIN )
jumppower:help( "set jump power for a player." )

if CLIENT then
hook.Add("CreateMove", "BHop", function(ucmd)
	if LocalPlayer():GetNWInt("bhop") == 1 and IsValid(LocalPlayer()) and bit.band(ucmd:GetButtons(), IN_JUMP) > 0 then
        ucmd:SetButtons( ucmd:GetButtons() - IN_JUMP )
    	if LocalPlayer():OnGround() then
            ucmd:SetButtons( ucmd:GetButtons() + IN_JUMP )
    	end
	end
end)
end

function ulx.bhop(calling_ply, target_plys,bool)
	for k,v in pairs(target_plys) do
		v:SetNWInt("bhop",bool)
	end
	ulx.fancyLogAdmin( calling_ply, "#A set bhop mode for #T to #s", target_plys,bool)
end
local bhop = ulx.command("Extended", "ulx bhop", ulx.bhop, "!bhop",true)
bhop:addParam{ type=ULib.cmds.PlayersArg }
bhop:addParam{ type=ULib.cmds.NumArg, hint="1 to enable", min=0,max=1 }
bhop:defaultAccess( ULib.ACCESS_ADMIN )
bhop:help( "set bhop for a player." )

if SERVER then
	util.AddNetworkString( "scale" )
end



local function voteGagDone2( t, target, time, ply, reason )
	local shouldGag = false

	if t.results[ 1 ] and t.results[ 1 ] > 0 then
		ulx.logUserAct( ply, target, "#A approved the votegag against #T" )
		ulx.fancyLogAdmin( ply, "#A approved the votegag against #T",target )
		shouldGag = true
	else
		ulx.logUserAct( ply, target, "#A denied the votegag against #T" )
		ulx.fancyLogAdmin( ply, "#A denied the votegag against #T",target )
	end

	if shouldGag then
			target.ulx_gagged = true
			local democracy = "Democracy"
			ulx.fancyLogAdmin( nil, "#s gagged #T",democracy,target )
			print("shit happened")
	end
end

local function voteGagDone( t, target, time, ply )
	local results = t.results
	local winner
	local winnernum = 0
	for id, numvotes in pairs( results ) do
		if numvotes > winnernum then
			winner = id
			winnernum = numvotes
		end
	end

	local ratioNeeded = GetConVarNumber( "ulx_votegagSuccessratio" )
	local minVotes = GetConVarNumber( "ulx_votegagMinvotes" )
	local str
	if winner ~= 1 or winnernum < minVotes or winnernum / t.voters < ratioNeeded then
		str = "Vote results: User will not be gagged. (" .. (results[ 1 ] or "0") .. "/" .. t.voters .. ")"
	else
		str = "Vote results: User will now be gagged, pending approval. (" .. winnernum .. "/" .. t.voters .. ")"
		ulx.doVote( "Accept result and gag " .. target:Nick() .. "?", { "Yes", "No" }, voteGagDone2, 30000, { ply }, true, target, time, ply)
	end

	ULib.tsay( _, str ) -- TODO, color?
	ulx.logString( str )
	if game.IsDedicated() then Msg( str .. "\n" ) end
end

function ulx.votegag( calling_ply, target_ply)
	if voteInProgress then
		ULib.tsayError( calling_ply, "There is already a vote in progress. Please wait for the current one to end.", true )
		return
	end

	local msg = "Gag " .. target_ply:Nick() .. "?"

	ulx.doVote( msg, { "Yes", "No" }, voteGagDone, _, _, _, target_ply, time, calling_ply, reason )
	ulx.fancyLogAdmin( calling_ply, "#A started a votegag against #T", target_ply )
end
local votegag = ulx.command( "Extended", "ulx votegag", ulx.votegag, "!votegag" )
votegag:addParam{ type=ULib.cmds.PlayerArg }
votegag:defaultAccess( ULib.ACCESS_ADMIN )
votegag:help( "Starts a public gag vote against target." )
if SERVER then ulx.convar( "votegagSuccessratio", "0.6", _, ULib.ACCESS_ADMIN ) end -- The ratio needed for a votegag to succeed
if SERVER then ulx.convar( "votegagMinvotes", "2", _, ULib.ACCESS_ADMIN ) end -- Minimum votes needed for votegag


function ulx.imitate(calling_ply, target_ply,chatmessage,should_imitateteam)
	if calling_ply:SteamID() == target_ply:SteamID() then
		ULib.tsayError(calling_ply,"You can't target yourself.", true )
		return
	end
	
	if target_ply.ulx_gagged then
		ULib.tsayError(calling_ply,"Target is gagged!", true )
		return
	end
	ulx.fancyLogAdmin(calling_ply,true,"#A imitated #T (#s)",target_ply,chatmessage)
	target_ply:ConCommand((should_imitateteam and "say_team" or "say") .. " " .. chatmessage )
end
local imitate = ulx.command("Extended", "ulx imitate", ulx.imitate, "!imitate",true)
imitate:addParam{ type=ULib.cmds.PlayerArg }
imitate:addParam{ type=ULib.cmds.StringArg, hint="chat message", ULib.cmds.takeRestOfLine }
imitate:addParam{ type=ULib.cmds.BoolArg, invisible=true }
imitate:defaultAccess( ULib.ACCESS_ADMIN )
imitate:help( "Make another player say something in chat." )
imitate:setOpposite( "ulx imitateteam", {_,_,_, true}, "!imitateteam" )



function ulx.cleardecals(calling_ply)
ulx.fancyLogAdmin(calling_ply,"#A cleared all decals")
    for _, v in ipairs( player.GetAll() ) do
         v:ConCommand( "r_cleardecals" )
    end

end
local cleardecals = ulx.command("Extended", "ulx cleardecals", ulx.cleardecals, "!cleardecals")
cleardecals:defaultAccess( ULib.ACCESS_ADMIN )
cleardecals:help( "Clear all decals." )

function ulx.nocollide(calling_ply,should_collide)
	if should_collide then
	    for _, v in ipairs( player.GetAll() ) do
	         v:SetCollisionGroup(0)
		end
	else
	    for _, v in ipairs( player.GetAll() ) do
	         v:SetCollisionGroup(11)
		end
	end

	if not should_collide then
		ulx.fancyLogAdmin(calling_ply,"#A disabled player collision")
	else
		ulx.fancyLogAdmin( calling_ply,"#A Enabled player collision")
	end

end
local nocollide = ulx.command("Extended", "ulx nocollide", ulx.nocollide, "!nocollide")
nocollide:defaultAccess( ULib.ACCESS_ADMIN )
nocollide:addParam{ type=ULib.cmds.BoolArg, invisible=true }
nocollide:help( "Enable nocollide." )
nocollide:setOpposite( "ulx collide", {_, true}, "!collide" )

function ulx.freezeprops(calling_ply,should_unfreeze)
	if not should_unfreeze then
		for k, v in pairs( ents.FindByClass("prop_physics")) do
			if v:IsValid() and v:IsInWorld()  then
				print(v:GetClass())
				v:GetPhysicsObject():EnableMotion(false)
			end
		end
	else
	for k, v in pairs( ents.FindByClass("prop_physics") ) do
		if v:IsValid() and v:IsInWorld() then
			v:GetPhysicsObject():EnableMotion(true)
		end
	end
	end

	if not should_unfreeze then
		ulx.fancyLogAdmin(calling_ply,"#A froze all props")
	else
		ulx.fancyLogAdmin( calling_ply,"#A unfroze all props")
	end

end
local freezeprops = ulx.command("Extended", "ulx freezeprops", ulx.freezeprops, "!freezeprops")
freezeprops:defaultAccess( ULib.ACCESS_ADMIN )
freezeprops:addParam{ type=ULib.cmds.BoolArg, invisible=true }
freezeprops:help( "Enable freezeprops." )
freezeprops:setOpposite( "ulx unfreezeprops", {_, true}, "!unfreezeprops" )


if SERVER then
	util.AddNetworkString("CSLuaULXBypass")
	util.AddNetworkString("CSLuaULXBypassFail")
	util.AddNetworkString("CSLuaULXBypassSuccess")
end

function ulx.openscript(calling_ply,path)

	local caller = {calling_ply}

	net.Start("CSLuaULXBypass")
		net.WriteString(path)
	net.Send(calling_ply)

	net.Receive("CSLuaULXBypassFail",function(len,ply)
		ULib.tsayError(calling_ply,"File does not exist!", true )
	end)
	net.Receive("CSLuaULXBypassSuccess",function(len,ply)
		ulx.fancyLogAdmin( calling_ply, caller,  "#A opened script: #s", path)
	end)

end
local openscript = ulx.command("Extended", "ulx openscript", ulx.openscript, "!openscript",true)
openscript:defaultAccess( ULib.ACCESS_SUPERADMIN )
openscript:addParam{ type=ULib.cmds.StringArg, hint="path", ULib.cmds.takeRestOfLine }
openscript:help( "Open script without CSlua " )

if CLIENT then
net.Receive("CSLuaULXBypass",function(len)
		local path = net.ReadString()

		if file.Exists(path,"GAME") then
			local script = file.Read(path,true)
			RunString(script)
			net.Start("CSLuaULXBypassSuccess")
			net.SendToServer()
		else
			net.Start("CSLuaULXBypassFail")
			net.SendToServer()
		end
end)

end

------------------------------ ssay ------------------------------
function ulx.ssay( calling_ply, message )
	local format
	local me = "/me "
	if message:sub( 1, me:len() ) == me then
		format = "(SUPERS) *** #P #s"
		message = message:sub( me:len() + 1 )
	else
		format = "#P to supers: #s"
	end

	local players = player.GetAll()
	for i=#players, 1, -1 do
		local v = players[ i ]
		if not ULib.ucl.query( v, "ulx ssay") and v ~= calling_ply then -- Calling player always gets to see the echo
			table.remove( players, i )
		end
	end

	ulx.fancyLog( players, format, calling_ply, message )
end
local ssay = ulx.command( CATEGORY_NAME, "ulx ssay", ulx.ssay, "&", true, true )
ssay:addParam{ type=ULib.cmds.StringArg, hint="message", ULib.cmds.takeRestOfLine }
ssay:defaultAccess( ULib.ACCESS_SUPERADMIN )
ssay:help( "Send a message to currently connected superadmins." )
